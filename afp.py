# -*- coding: utf-8 -*-
from __future__ import unicode_literals
import argparse
import os
import redis
from defusedxml.minidom import parse
import datetime

parser = argparse.ArgumentParser()
parser.add_argument("path", help="directorio de archivos xml")
args = parser.parse_args()

def get_filelist(path):
    return (os.path.join(group[0], filename)
        for  group in os.walk(path)
        for filename in group[2]
        if filename.endswith('.xml') and not filename == 'index.xml')



def process_news_file(file_path):
    rconn = redis.Redis()
    if rconn.sismember('news:files', file_path):
        return

    if not rconn.hsetnx('news:lock', file_path, True):
        return

    with open(file_path, 'r') as news_file:
        dom = parse(news_file)

    news_items = map(process_news_item, dom.getElementsByTagName('NewsItem'))

    rconn.hdel('news:lock', file_path)
    rconn.sadd('news:files', file_path)

    return news_items

def process_news_item(news_item):
    data = {}
    for node in news_item.childNodes:
        if node.localName == 'Identification':
            date_elem = node.getElementsByTagName('DateId')[0]
            data['date'] = datetime.datetime.strptime(date_elem.firstChild.nodeValue, '%Y%m%d')

        if node.localName == 'NewsComponent':
            # Trabajando en obtener el titulo y el slug
            newslines_node = [n for n in node.childNodes if n.localName == 'NewsLines'][0]
            headline_node = [c for c in newslines_node.childNodes if c.localName == 'HeadLine'][0]
            text = headline_node.firstChild.nodeValue

            try:
                slug_node = [c for c in newslines_node.childNodes if c.localName == 'SlugLine'][0]
                data['slug'] = slug_node.firstChild.nodeValue

            except IndexError:
                pass

            data['title'] = text


            #Procesando el texto
            news_component_nodes = [n for n in node.childNodes if n.localName == 'NewsComponent']
            text_news_component_node = [n for n in news_component_nodes
                                        if 'ContentItem' in map(lambda x: x.localName, n.childNodes)  ][0]

            data['content'] = text_news_component_node.getElementsByTagName('DataContent')[0].toxml()



    return data


if __name__ == '__main__':

    import pprint
    pprint.pprint(map(process_news_file, get_filelist(args.path)))
