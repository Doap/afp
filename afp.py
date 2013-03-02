import argparse
import os
import redis
from defusedxml.minidom import parse
import psycopg2
import datetime


def get_filelist(path):
    return [os.path.join(group[0], filename)
        for  group in os.walk(path)
        for filename in group[2]
        if filename.endswith('.xml') and not filename == 'index.xml']



def process_news_file(file_path, rconn):
    if rconn.sismember('news:files', file_path):
        return

    if not rconn.hsetnx('news:lock', file_path, True):
        return

    with open(file_path, 'r') as news_file:
        dom = parse(news_file)

    news_items = map(process_news_item, dom.getElementsByTagName('NewsItem'))

    rconn.hdel('news:lock', file_path)
    rconn.sadd('news:files', file_path)

def process_news_item(news_item):
    print news_item


if __name__ == '__main__':
    parser = argparse.ArgumentParser()
    parser.add_argument("path", help="directorio de archivos xml")
    args = parser.parse_args()
    directory = args.path

    rconn = redis.Redis("localhost")

    map(lambda file_path: process_news_file(file_path, rconn), get_filelist(directory))

    conn = psycopg2.connect("dbname=laprensa user=laprensa")
    cursor = conn.cursor()
    cursor.close()
    conn.close()
