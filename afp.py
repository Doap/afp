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

                    if news_components_files[1].getAttribute('FormalName') == 'Caption':
                        caption = news_components_files[3].getElementsByTagName('p')[0].toxml()

                    #Solamente imagenes medianas
                    if news_components_files[1].getAttribute('FormalName') == 'Quicklook':
                        #Nombre de la imagen
                        img_quicklook = news_components_files[3].getAttribute('Href')
                        #Moviendo archivo a carpeta media de laprensa
                        shutil.copy2(os.path.join(file_path,img_quicklook), args.img_path)

                        if img_quicklook:
                            template = Template('<img src="/files/imagen/{{img}}" alt="" />')
                            render = template.render(img=img_quicklook, img_path=args.img_path)
                            img_ref.append({ 'ref':render, 'foto':foto, 'caption':caption })

            for x,y,z  in zip(img_properties, img_ref, media):
                left = Template('<div style="text-align:center;" class="na-media na-image-left">{{ img }}<div class="info">{{ caption }}</div></div>')
                right = Template('<div style="text-align:center;" class="na-media na-image-right">{{ img }}<div class="info">{{ caption }}</div></div>')
                content = Template('<div>{{contenido}}<style>p{ padding: 5px; }</style></div>')
                if x['style'] == 'leftSide':
                    render = left.render(img=y['ref'],caption=y['caption'])
                if x['style'] == 'rightSide':
                    render = right.render(img=y['ref'],caption=y['caption'])
                data['content'] = data['content'].replace(z.toxml(), render).replace('<DataContent>','').replace('</DataContent>','')
		data['content'] = content.render(contenido=data['content'])

    return data


if __name__ == '__main__':
    import psycopg2
    import datetime
    conn = psycopg2.connect("dbname=laprensa user=laprensa password=laprensa")
    cursor = conn.cursor()

    with futures.ProcessPoolExecutor() as executor:
        for news_item in executor.map(process_news_file, get_filelist(args.path)):
            if news_item is not None:
		rconn = redis.Redis()
		if rconn.sismember('titles:title', news_item[0]['title']):
		    pass
		else:
		    if news_item[0]['date'].date() == datetime.date.today():
			print news_item[0]['title']
			cursor.execute('''
				select idedicion from edicion 
				where edicion = DATE %(fecha)s 
				order by edicion limit 1
				''', {
				 'fecha' : news_item[0]['date']
				})
			edicion = cursor.fetchone()
			if edicion is not None:
			    edicion = edicion[0]
			cursor.execute('''
			    INSERT INTO noticia (idedicion, idseccion, noticia, texto, creacion, destacado, ubicacion, orden )
			    VALUES ( %(edicion)s,  %(seccion)s, %(titulo)s, %(texto)s, %(fecha)s, 't', 'I', 101 )
			    ''',
			    {	'seccion': 53,
				'edicion': edicion,
				'titulo' : news_item[0]['title'],
				'texto' : news_item[0]['content'],
				'fecha' : news_item[0]['date'],
			    })
			conn.commit()
			rconn.hdel('titles:lock', news_item[0]['title'])
			rconn.sadd('titles:title', news_item[0]['title'])
    cursor.close()
    conn.close()
