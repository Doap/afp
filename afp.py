import argparse
import os
import redis
from xml.dom import minidom
from xml.dom.minidom import parseString
from xml.dom.minidom import Node
import psycopg2

def getChildrenByTitle(node):
    for child in node.childNodes:
		if child.localName=='HeadLine':
			yield child

		if child.localName=='DataContent':
			yield child

		if child.localName=='NewsLines':
			for ch in child.childNodes:
				if ch.nodeName == 'HeadLine':
					titulo =  ch.toxml().replace('<HeadLine>','').replace('</HeadLine>','')
					print titulo

		if child.localName=='ContentItem':
			for ch in child.childNodes:
				if ch.nodeName == 'DataContent':
					contenido =  ch.toxml().replace('<DataContent>','').replace('</DataContent>','')
					print contenido

parser = argparse.ArgumentParser()
parser.add_argument("path", help="directorio de archivos xml")
args = parser.parse_args()
directorio = args.path

r_server = redis.Redis("localhost")
conn = psycopg2.connect("dbname=laprensa user=laprensa")
cursor = conn.cursor()

for (path, dirs, files) in os.walk(directorio):
	print files
	for filename in files:
		if filename.endswith('.xml') and not filename.startswith('index'):
			# si no esta en el set de noticias en redis
			if not r_server.sismember("noticias", filename):
				fullpath = os.path.join(path, filename)
				with open(fullpath, 'r') as f:
					read_data = f.read()
					dom = parseString(read_data)
					
					for node in dom.getElementsByTagName('NewsComponent'):
						alist = getChildrenByTitle(node)

						for a in alist:
							pass
							
						
						#cursor.execute("INSERT INTO noticia VALUES (%s)", (xmlData,))
						#conn.commit()
				#r_server.sadd("noticias", filename)
			else:
				print 'ya existe esta noticia'

cursor.close()
conn.close()

