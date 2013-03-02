# -*- coding: utf-8 -*-
from __future__ import unicode_literals
import futures
import argparse
import os
import redis
from defusedxml.minidom import parse
import datetime
import shutil
from jinja2 import Template
import functools

parser = argparse.ArgumentParser()
parser.add_argument("path", help="directorio de archivos xml")
parser.add_argument("img_path", help="directorio de imagenes")
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
    news_items = map(functools.partial(process_news_item,file_path=os.path.dirname(file_path)), dom.getElementsByTagName('NewsItem'))
    rconn.hdel('news:lock', file_path)
    rconn.sadd('news:files', file_path)

    return news_items

def process_news_item(news_item, file_path):
    data = {}
    img_properties, img_ref = [], []
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
            media = [n for n in text_news_component_node.getElementsByTagName('DataContent')[0].childNodes if n.localName == 'media']
            img_properties = [ { 'foto':m.childNodes[0].getAttribute('data-location')[1:], 'style':m.getAttribute('style')} for m in media  ]

            for node in news_component_nodes:
                foto = node.getAttribute('Duid')
                #obteniendo news component de cada media
                news_components_media = [n for n in node.childNodes if n.localName == 'NewsComponent']
                for t in news_components_media:
                    #News components con definicion de archivos
                    news_components_files = [n for n in t.childNodes if 'Role' in map(lambda x: x.localName, t.childNodes)]

                    #Solamente imagenes medianas
                    if news_components_files[1].getAttribute('FormalName') == 'Quicklook':
                        #Nombre de la imagen
                        img_quicklook = news_components_files[3].getAttribute('Href')
                        #Moviendo archivo a carpeta media de laprensa
                        shutil.copy2(os.path.join(file_path,img_quicklook), args.img_path)

                        if img_quicklook:
                            template = Template('<img src="{{ img_path }}{{img}}" alt="" />')
                            render = template.render(img=img_quicklook, img_path=args.img_path)
                            img_ref.append({ 'ref':render, 'foto':foto })

            for x,y,z  in map(None,img_properties, img_ref, media):
                data['content'] = data['content'].replace(z.toxml(), y['ref']).replace('<DataContent>','').replace('</DataContent>','')

    return data


if __name__ == '__main__':

    import pprint
    with futures.ProcessPoolExecutor() as executor:
        for news_item in executor.map(process_news_file, get_filelist(args.path)):
            pprint.pprint(news_item)
