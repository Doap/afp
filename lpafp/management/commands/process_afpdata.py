# -*- coding: utf-8 -*-
from __future__ import unicode_literals

import os
import argparse
import datetime
import shutil
import functools
import itertools
import hashlib

import futures
import redis
from defusedxml.minidom import parse
import jinja2
import psycopg2

from django.conf import settings
from django.core.management.base import BaseCommand, CommandError

#==============================================================================

# TODO: rename HD Image adding time mark, move to the image directory insert in
# to the database
# XXX: In [1]: import time 
# In [2]: mytime = time.localtime()
# In [3]: print time.mktime(mytime), int(time.mktime(mytime))
# 1385421055.0 1385421055

class Command(BaseCommand):
    args = '<data_source_path>'
    help = 'Import News from AFP conntent service'
    def handle(self, sourcepath,  *args, **options):
        rconn = redis.Redis()
        database = setting.DATABASES['default']
        pgconn = psycopg2.connect(
                database=database['NAME'],
                user=database['USER'],
                password=database['PASSWORD'], 
                host=database['HOST'], 
                port=database['PORT'])
        file_path_list = get_filelist(args.path, rconn)
        print map(
            functools.partial(process_news_data, rconn=rconn, pgconn=pgconn),
            (
                news for news_list in
                itertools.imap(
                    functools.partial(process_news_file, rconn=rconn),
                    sourcepath
                ) for news in news_list
            )
        )
        pgconn.commit()

#==============================================================================

def get_file_sha1(filepath):
    with open(filepath, 'r') as f:
        return hashlib.sha1(f.read()).hexdigest()

def get_filelist(path, rconn):
    for index_path in (os.path.join(group[0], filename)
         for  group in os.walk(path)
         for filename in group[2]
         if filename == 'index.xml'):
        path_hash = hashlib.sha1(index_path).hexdigest()
        file_hash = get_file_sha1(index_path)
        directory_path = os.path.dirname(index_path)
        if rconn.hget('afp:file_index', path_hash) != file_hash:
            with open(index_path, 'r') as index_file:
                index_dom = parse(index_file)
                for node in index_dom.getElementsByTagName('NewsItemRef'):
                    yield os.path.join(directory_path, node.getAttribute('NewsItem'))

            rconn.hset('afp:file_index', path_hash, file_hash)

def process_news_file(file_path, rconn):
    if not rconn.hsetnx('news:lock', file_path, True):
        return ()

    with open(file_path, 'r') as file_object:
        dom = parse(file_object)

    result = itertools.imap(functools.partial(process_news_item, file_path=file_path), dom.getElementsByTagName('NewsItem'))
    rconn.hdel('news:lock', file_path)

    return result

def process_news_item(news_item, file_path):
    directory = os.path.dirname(file_path)
    data = {}
    img_properties_list, img_ref_list = [], []
    for node in news_item.childNodes:
        if node.localName == 'NewsManagement':
                date_elem = node.getElementsByTagName('FirstCreated')[0]
                data['date'] = datetime.datetime.strptime(date_elem.firstChild.nodeValue, '%Y%m%dT%H%M%SZ')

        if node.localName == 'Identification':
            ident_elem = node.getElementsByTagName('NewsItemId')[0]
            data['news_item_id'] = ident_elem.firstChild.nodeValue

            revision_elem = node.getElementsByTagName('RevisionId')[0]
            data['revision'] = int(revision_elem.firstChild.nodeValue)

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
            media_list = [n for n in text_news_component_node.getElementsByTagName('DataContent')[0].childNodes if n.localName == 'media']
            img_properties_list = [ { 'foto':m.childNodes[0].getAttribute('data-location')[1:], 'style':m.getAttribute('style')} for m in media_list]

            for node in news_component_nodes:
                foto = node.getAttribute('Duid')
                #obteniendo news component de cada media
                news_components_media = [n for n in node.childNodes if n.localName == 'NewsComponent']
                for t in news_components_media:
                    #News components con definicion de archivos
                    news_components_files = [n for n in t.childNodes if 'Role' in map(lambda x: x.localName, t.childNodes)]

                    if news_components_files[1].getAttribute('FormalName') == 'Caption':
                        caption = news_components_files[3].getElementsByTagName('p')[0].toxml()

                    #Solamente imagenes medianas
                    if news_components_files[1].getAttribute('FormalName') == 'HighDef':
                        #Nombre de la imagen
                        img_quicklook = news_components_files[3].getAttribute('Href')
                        #Moviendo archivo a carpeta media de laprensa
                        # shutil.copy2(os.path.join(directory, img_quicklook), args.img_path)

                        if img_quicklook:
                            template = jinja2.Template('<img width="310" \
                                    src="http://{{S3_BUCKET}}{{S3_IMG_DEST}}{{img}}" alt="" />')
                            # template = jinja2.Template('<img width="310" src="http://www.laprensa.com.ni/files/imagen/{{img}}" alt="" />')
                            render = template.render(S3_BUCKET=S3_BUCKET,
                                    S3_IMG_DEST=S3_IMG_DEST, img=img_quicklook)
                            # render = template.render(img=img_quicklook, img_path=args.img_path)
                            img_ref_list.append({ 'ref':render, 'foto':foto, 'caption':caption })

            for img_properties, img_ref, media  in zip(img_properties_list, img_ref_list, media_list):
                left = jinja2.Template('<div style="text-align:center;" class="na-media na-image-left">{{ img }}<div class="info">{{ caption }}</div></div>')
                right = jinja2.Template('<div style="text-align:center;" class="na-media na-image-right">{{ img }}<div class="info">{{ caption }}</div></div>')
                content = jinja2.Template('<div>{{contenido}}<style>p{ padding: 5px; }</style></div>')
                if img_properties['style'] == 'leftSide':
                    render = left.render(img=img_ref['ref'], caption=img_ref['caption'])
                if img_properties['style'] == 'rightSide':
                    render = right.render(img=img_ref['ref'],caption=img_ref['caption'])
                data['content'] = data['content'].replace(media.toxml(), render).replace('<DataContent>','').replace('</DataContent>','')
                data['content'] = content.render(contenido=data['content'])

    return data

def get_edition(date, cursor):
    print  date
    cursor.execute('''
    select idedicion from edicion
    where edicion = DATE %(fecha)s
    order by edicion limit 1
    ''', {
        'fecha' : date
    })
    edicion = cursor.fetchone()
    print edicion
    if edicion is not None:
        edicion = edicion[0]

    return edicion

def process_news_data(news_data, rconn, pgconn):
    cursor = pgconn.cursor()
    if not news_data['date'].date() == datetime.date.today():
        return

    edition = get_edition(news_data['date'].date(), cursor)
    if edition is None:
        return

    news_id = rconn.hget('afp:news:list', news_data['news_item_id'])
    if  news_id is not None:
        revision = news_data['revision']
        if revision > int(rconn.hget('afp:news:revisions', news_data['news_item_id'])):
            cursor.execute('''
            UPDATE noticia SET
            noticia=%(titulo)s,
            texto=%(texto)s,
            creacion=%(fecha)s
            WHERE idnoticia=%(news_id)s
            ''', {
            'titulo' : news_data['title'],
            'texto' : news_data['content'],
            'fecha' : news_data['date'],
            'news_id': news_id
            })
            rconn.hset('afp:news:revisions', news_data['news_item_id'], news_data['revision'])
            return 'UPDATE {0}'.format(news_id)
    else:
       cursor.execute('''
       INSERT INTO noticia (idedicion, idseccion, noticia, texto, creacion, destacado, ubicacion, orden, antetitulo )
       VALUES ( %(edicion)s,  %(seccion)s, %(titulo)s, %(texto)s, %(fecha)s, %(destacado)s, %(ubicacion)s, 101, 'AFP' )
       RETURNING idnoticia
       ''', {
        'seccion': 53,
        'edicion': edition,
        'titulo' : news_data['title'],
        'texto' : news_data['content'],
        'fecha' : news_data['date'],
        'ubicacion': 'D', 
        'destacado': 't',
       })
       news_id = cursor.fetchone()[0]
       rconn.hset('afp:news:list', news_data['news_item_id'], news_id)
       rconn.hset('afp:news:revisions', news_data['news_item_id'], news_data['revision'])

       return 'INSERT {0}'.format(news_id)



# if __name__ == '__main__':
#     rconn = redis.Redis()
#     pgconn = psycopg2.connect(database=DB_DATABASE, user=DB_USER,
#             password=DB_PASSWORD, host=DB_HOST, port=5432)
#     file_path_list = get_filelist(args.path, rconn)
# 
#     print map(
#     functools.partial(process_news_data, rconn=rconn, pgconn=pgconn),
#     (
#     news for news_list in
#     itertools.imap(functools.partial(process_news_file, rconn=rconn), file_path_list)
#     for news in news_list
#     ))
# 
#     pgconn.commit()
