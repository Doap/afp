<div class="banner_flotanteizq">{$banner_160x600_lateral_1}</div>
<p id="sectionname">{$rows[0].seccion} {$depto}</p>
<div id="bloque1">
<div id="bigizqbloque1b"{if $rows[0].idseccion == 56} style="background-style: none;background-color:white;"{/if}>
{if $uri == 'elecciones'}
<div id="notaAmplia">
<div class="resultados">
{if !$depto}
<h1>{$nota_elecciones.pagina}</h1>
<p style="font-size:16px;color:black">{$subnota_elecciones.pagina}</p>
<p>{$subnota_elecciones.texto}</p>
{section name=c loop=$candidatos}
	<div class="flag">
		<img src="{$smarty.const.FILESURL}/ppolitico/{$candidatos[c].foto}" width="75" /><br/>
		<img src="{$smarty.const.FILESURL}/ppolitico/{$candidatos[c].imagen}" width="75" height="40"/>
		<p class="total_votos"><span class="partido" style="font-size: 16px;">{$candidatos[c].ppolitico}</span>&nbsp;{$candidatos[c].porcentaje|string_format:"%.2f"}%</p>
		<p class="total_votos2">{$candidatos[c].votos|number_format}</p>
	</div>
{/section}
<br clear="all"/><br /><br />
{/if}
<!-- h1>Resultados Diputados {if !$depto}Nacionales{else} - {$depto}{/if}</h1 -->
<h1>Esca&ntilde;os ganados por partidos en diputados {if !$depto}nacionales{else} - {$depto}{/if}</h1>
{section name=v loop=$votos}
<div class="flag">
	{$votos[v].ppolitico}<br />
	<img src="{$smarty.const.FILESURL}/ppolitico/{$votos[v].imagen}" width="80" />
	{if !$depto && $votos[v].foto}
	<img src="{$smarty.const.FILESURL}/ppolitico/{$votos[v].foto}" width="30" />
	{/if}
	<p class="total_votos">{$votos[v].votos|number_format}</p>
</div>
{/section}
{if !$depto}
<br clear="all" /><br />
<div style="text-align: left; color: #000; font-size: 13px; margin-left: 10px; margin-top: 10px; font-weight: bold;">
	<p>{$nota_elecciones.texto}</p>
</div>
{/if}
</div>
{if !$depto && $uri == 'elecciones'} 
<br clear="all" />
<div class="candidatos" id="candidatos">
<div id="candidatosdetalle">
{section name=cc loop=$candidatos}
<div class="candidato" style="display:none" id="candidato{$smarty.section.cc.iteration}">
<div class="candidatohide" style="cursor: pointer; text-align: right; font-size: 17px; font-wight: bold;width: 690px;">[x]</div>
<img src="/files/ppolitico/{$candidatos[cc].foto}" width="190"/>
<h1>{$candidatos[cc].presidente}</h1> 
{* $candidatos[cc].texto|strip_tags|regex_replace:"/[\r\t\n]/":" "|replace:"&nbsp;":" "|regex_replace:"/\s+/":" "|trim|truncate:700:"..." *}
{* $candidatos[cc].texto|truncate:700:"..." *} <!-- /* FIXME: alguna etiqueta en el texto del candidato causaba que se rompieta el esquema - volvia a colocarlo a solicitud de juan martinez */ -->
{* $candidatos[cc].texto|strip_tags|truncate:700:"..." *}
{$candidatos[cc].texto|strip_tags|nl2br|truncate:700:"..."}
<a href="/candidatos/{$candidatos[cc].idppolitico}">leer m&aacute;s</a>
<br clear="all"/>
</div> <!-- candidato -->
{/section}
</div> <!-- candidatosdetalle -->
<br clear="all"/>
<div class="fotos-presidentes" id="fotos-presidentes">
{section name=cc loop=$candidatos}
<img src="/files/ppolitico/{$candidatos[cc].foto}" width="80" id="candidato{$smarty.section.cc.iteration}" style="cursor: pointer;"/>
{/section}
</div> <!-- fotos-presidentes -->
</div> <!-- candidatos -->
{literal}<script>
$(".candidatohide").click(function () {
		$("#candidatosdetalle").hide();
		});
$("#fotos-presidentes img").click(function () {
		$("#candidatosdetalle").show();
		$("#candidato1").hide();
		$("#candidato2").hide();
		$("#candidato3").hide();
		$("#candidato4").hide();
		$("#candidato5").hide();
		$("#"+this.id).show("slow");
		});
</script>{/literal}
{elseif $depto}
<br clear="all" />
<h2 class="galelecciones">Galer&iacute;a de fotos: Elecciones Nigaragua 2011</h2>
<div class="galelecciones">
{section name=fotos5 loop=$fotos5}
{if $smarty.section.fotos5.iteration > 5}
<a href="{$smarty.const.PIXURL}/{$fotos5[fotos5].imagen|time_pic:"%Y/%m"}/600x400_{$fotos5[fotos5].imagen}" rel="galelecciones[fotos]" title="{$fotos5[fotos5].texto}"><img alt="{$fotos5[fotos5].galeria}" style="display: none;"/></a>
{else}
<a href="{$smarty.const.PIXURL}/{$fotos5[fotos5].imagen|time_pic:"%Y/%m"}/600x400_{$fotos5[fotos5].imagen}" rel="galelecciones[fotos]" title="{$fotos5[fotos5].texto}"><img src="{$smarty.const.PIXURL}/{$fotos5[fotos5].imagen|time_pic:"%Y/%m"}/120x90_{$fotos5[fotos5].imagen}" width="120" height="90" alt="{$fotos5[fotos5].galeria}"/></a>
{/if}
{/section}
</div><br/>
{/if}
</div> <!-- notaAmplia -->
{/if}
{if $uri == 'elecciones-municipales-2012'}
  <div id="notaAmplia">
{else}
<div id="izqbloque1">
{/if}
{if $uri == 'elecciones'}{include file="mapa.tpl"}{/if}
{section name=v loop=$rows max=$max}
  {if $uri == 'elecciones-municipales-2012'}
    <div class="noticia elecciones">
  {elseif $rows[v].destacado == 't'}
    <div class="noticia actualidadgrande">
  {else}
    <div class="noticia actualidadchica">
  {/if}
{if $rows[v].ultimahora=='t'}<div class="titularventana"><p><span class="last">ULTIMO MINUTO</span> - <span class="time">{$rows[v].hora|date_format:"%I:%M"} {if $rows[v].hora|date_format:"%H" > 12}p.m.{elseif $rows[v].hora|date_format:"%H"==12}m.{else}a.m.{/if}</span></p></div>{/if}
{if $rows[v].destacado == 't' && !$uri == 'elecciones-municipales-2012'}
<h1><a href="/{$rows[v].edicion|date_format:"%Y/%m/%d"}/{$rows[v].uri}/{$rows[v].idnoticia}-{$rows[v].noticia|seo_url}">{$rows[v].noticia}</a></h1>
{if $rows[v].video==2}<div class="dest_video"><object width="397" height="240"><param name="movie" value="http://www.youtube.com/v/{$rows[v].idvideo}"></param><param name="wmode" value="transparent"></param><embed src="http://www.youtube.com/v/{$rows[v].idvideo}" type="application/x-shockwave-flash" wmode="transparent" width="397" height="240"></embed></object></div>{elseif $rows[v].fotogaleria}<img src="{$smarty.const.PIXURL}/{$rows[v].fotogaleria.imagen|time_pic:"%Y/%m"}/{if $rows[v].presentar=='w'}397x200{else}288x318{/if}_{$rows[v].fotogaleria.imagen|escape:url}"{if $rows[v].presentar=='h'} width="150" style="float:left; margin-right:10px; margin-bottom:5px;"{/if} alt="" />{elseif $rows[v].imgs}

<!-- aqui esta la imagen del listado-->
<img src="{$smarty.const.PIXURL}/{$rows[v].imgs[0]|time_pic:"%Y/%m"}/{if $rows[v].presentar=='w'}397x200{else}288x318{/if}_{$rows[v].imgs[0]}"{if $rows[v].presentar=='h'} width="150" style="float:left;margin-right:10px;margin-bottom:5px;"{/if} alt="" />{/if}
<p>
{if $rows[v].resumen}
{$rows[v].resumen|strip_tags}
{else}
{$rows[v].texto|strip_tags|regex_replace:"/[\r\t\n]/":" "|replace:"&nbsp;":" "|regex_replace:"/\s+/":" "|trim|truncate:300}{/if}
</p>
{else}
{if $rows[v].video==2}<div class="little_video left"><object width="240" height="180"><param name="movie" value="http://www.youtube.com/v/{$rows[v].idvideo}"></param><param name="wmode" value="transparent"></param><embed src="http://www.youtube.com/v/{$rows[v].idvideo}" type="application/x-shockwave-flash" wmode="transparent" width="240" height="180"></embed></object></div>{elseif $rows[v].video==1}<div style="float: left; margin-right:10px; margin-bottom:5px;"><a class="flowplayer" style="background-image: url({if $rows[v].cdn=='t'}{$smarty.const.CDN_URL}/video{else}{$smarty.const.CLIPSURL}{/if}/{$rows[v].idvideo|substr:0:-4|escape:url|cat:".jpg"}); width: 397px; height: 240px;" href="{if $rows[v].cdn=='t'}{$smarty.const.CDN_URL}/video{else}{$smarty.const.CLIPSURL}{/if}/{$rows[v].idvideo}"><img src="http://media.laprensa.com.ni/play_large.png" alt="videos" width="83" height="83" style="margin-left:160px;" /></a></div>
{elseif $rows[v].fotogaleria}<img src="{$smarty.const.PIXURL}/{$rows[v].fotogaleria.imagen|time_pic:"%Y/%m"}/{if $rows[v].presentar=='w'}397x200{else}288x318{/if}_{$rows[v].fotogaleria.imagen|escape:url}"{if $rows[v].presentar=='h'} width="150" style="float:left; margin-right:10px; margin-bottom:5px;"{/if} alt="" />
{elseif $rows[v].imgs}<div class="imagen left">{if $rows[dp].antetitulo == 'AFP'}<img src="/files/imagen/photo_{$rows[dp].imgs[0]}"  width="150" alt="" style="float:left; margin-right:10px; margin-bottom:5px;"/>{else}<img src="{$smarty.const.PIXURL}/{$rows[v].imgs[0]|time_pic:"%Y/%m"}/{if $rows[v].presentar=='h'}288x318{else}150x100{/if}_{$rows[v].imgs[0]}" alt="" width="150" />{/if}</div>{/if}
<h1{if $uri == 'elecciones-municipales-2012'} class="tituloart"{/if}><a href="/{$rows[v].edicion|date_format:"%Y/%m/%d"}/{$rows[v].uri}/{$rows[v].idnoticia}-{$rows[v].noticia|seo_url}">{$rows[v].noticia}</a></h1>
<p>
{if $rows[v].idseccion == 56}
  {if $rows[v].resumen}
    {$rows[v].resumen|strip_tags|regex_replace:"/[\r\t\n]/":" "|replace:"&nbsp;":" "|regex_replace:"/\s+/":" "|trim|truncate:500}
  {else}
    {$rows[v].texto|strip_tags|regex_replace:"/[\r\t\n]/":" "|replace:"&nbsp;":" "|regex_replace:"/\s+/":" "|trim|truncate:500}
  {/if}
{else}
  {if $rows[v].resumen}
  {$rows[v].resumen|strip_tags|regex_replace:"/[\r\t\n]/":" "|replace:"&nbsp;":" "|regex_replace:"/\s+/":" "|trim|truncate:350}
  {else}
  {$rows[v].texto|strip_tags|regex_replace:"/[\r\t\n]/":" "|replace:"&nbsp;":" "|regex_replace:"/\s+/":" "|trim|truncate:350}
  {/if}
{/if}
</p>
{if !$rows[v].idseccion == 56}<div class="limpiar"></div>{/if}
{/if}
{if $rows[v].rels||$rows[v].fotogaleria}
<div id="relacionadas">
{if $rows[v].fotogaleria}<p class="rel_galeria"><a href="#" onclick="openwindow('/gallery.php?id={$rows[v].fotogaleria.idgaleria}',640,460);">{$rows[v].fotogaleria.galeria}</a></p>{/if}
{section name=rel loop=$rows[v].rels}
<p class="rel_{$rows[v].rels[rel].tipo}"><a href="{$rows[v].rels[rel].enlace}">{$rows[v].rels[rel].relacionado}</a></p>
{/section}
</div>
{/if}
<div class="options">
<div class="puntuacion{if $rows[v].comentarios > 0} borde{/if}"><label>Resultado:</label><div class="stars">{section name=j loop=5}{assign var="left" value=$rows[v].stars-$smarty.section.j.index}{if $left>0.9}<img src="/imgs/star_full.png" alt="" title="" class="star" />{elseif $left>0.1&&$left<=0.9}<img src="/imgs/star_waxing.png" alt="" title="" class="star"/>{else}<img src="/imgs/star_empty.png" alt="" title="" class="star" />{/if}{/section}</div>&nbsp;{$rows[v].stars}&nbsp; {$rows[v].votos|default:"0"} votos</div>
{if $rows[v].comentarios > 0}<div class="comentario">Comentarios: <span class="rojo">{$rows[v].comentarios}</span></div>{/if}
</div>
<div class="limpiar"></div>
</div><!--noticia-->
{if !$smarty.section.v.last}<div class="puntos480"></div>{/if}
{/section}  
</div><!--izqbloque1-->
<div id="centrobloque1">
{if $uri == 'elecciones' && !$depto} 
<div class="galelecciones2">
<h1>Galer&iacute;a</h1>
<a href="{$smarty.const.PIXURL}/{$fotos5[0].imagen|time_pic:"%Y/%m"}/600x400_{$fotos5[0].imagen}" rel="galelecciones[fotos]" title="{$fotos5[0].texto}"><img src="{$smarty.const.PIXURL}/{$fotos5[0].imagen|time_pic:"%Y/%m"}/270x280_{$fotos5[0].imagen}" alt="{$fotos5[0].galeria}" style="min-width: 100px; max-width: 280px;" /></a><br /><h2>{$fotos5[0].galeria}</h2>
{section start=1 name=fotos5 loop=$fotos5}
<a href="{$smarty.const.PIXURL}/{$fotos5[fotos5].imagen|time_pic:"%Y/%m"}/600x400_{$fotos5[fotos5].imagen}" rel="galelecciones[fotos]" title="{$fotos5[fotos5].texto}"><img alt="{$fotos5[fotos5].galeria}" style="display: none;"/></a>
{/section}
</div>
<br />{/if}
{section name=dp loop=$rows start=$max}
<div class="noticia">
{if $rows[dp].ultimahora=='t'}<div class="titularventana"><p><span class="last">ULTIMO MINUTO</span> - <span class="time">{$rows[dp].hora|date_format:"%I:%M"} {if $rows[dp].hora|date_format:"%H" > 12}p.m.{elseif $rows[dp].hora|date_format:"%H"==12}m.{else}a.m.{/if}</span></p></div>{/if}
<h1><a href="/{$rows[dp].edicion|date_format:"%Y/%m/%d"}/{$rows[dp].uri}/{$rows[dp].idnoticia}-{$rows[dp].noticia|seo_url}">{$rows[dp].noticia}</a></h1>
{if $rows[dp].destacado=='t'}
{if $rows[dp].video==2}<div class="dest_video"><object width="300" height="180"><param name="movie" value="http://www.youtube.com/v/{$rows[dp].idvideo}"></param><param name="wmode" value="transparent"></param><embed src="http://www.youtube.com/v/{$rows[dp].idvideo}" type="application/x-shockwave-flash" wmode="transparent" width="300" height="180"></embed></object></div>{elseif $rows[dp].video==1}<div style="float: left; margin-right:10px; margin-bottom:5px;"><a class="flowplayer" style="background-image: url({if $rows[dp].cdn=='t'}{$smarty.const.CDN_URL}/video{else}{$smarty.const.CLIPSURL}{/if}/{$rows[dp].idvideo|substr:0:-4|escape:url|cat:".jpg"}); width: 300px; height: 200px;" href="{if $rows[dp].cdn=='t'}{$smarty.const.CDN_URL}/video{else}{$smarty.const.CLIPSURL}{/if}/{$rows[dp].idvideo}"><img src="http://media.laprensa.com.ni/play_large.png" alt="videos" width="83" height="83" style="margin-top:65px;" /></a></div>{elseif $rows[dp].fotogaleria}<img src="{$smarty.const.PIXURL}/{$rows[dp].fotogaleria.imagen|time_pic:"%Y/%m"}/{if $rows[dp].presentar=='w'}397x200{else}288x318{/if}_{$rows[dp].fotogaleria.imagen|escape:url}"{if $rows[dp].presentar=='h'} width="150" style="float:left; margin-right:10px; margin-bottom:5px;" {else} width="300" {/if} alt="" />{elseif $rows[dp].imgs}{if $rows[dp].antetitulo == 'AFP'}<img src="/files/imagen/photo_{$rows[dp].imgs[0]}"  width="150" alt="" style="float:left; margin-right:10px; margin-bottom:5px;"/>{else}<img src="{$smarty.const.PIXURL}/{$rows[dp].imgs[0]|time_pic:"%Y/%m"}/{if $rows[dp].presentar=='w'}300x100{else}288x318{/if}_{$rows[dp].imgs[0]}" {if $rows[dp].presentar=='h'}width="150" {/if}alt="" />{/if}{/if}
{else}
{if $rows[dp].video==2}<div class="dest_video"><object width="300" height="180"><param name="movie" value="http://www.youtube.com/v/{$rows[dp].idvideo}"></param><param name="wmode" value="transparent"></param><embed src="http://www.youtube.com/v/{$rows[dp].idvideo}" type="application/x-shockwave-flash" wmode="transparent" width="300" height="180"></embed></object></div>{elseif $rows[dp].video==1}<div style="float: left; margin-right:10px; margin-bottom:5px;"><a class="flowplayer" style="background-image: url({if $rows[dp].cdn=='t'}{$smarty.const.CDN_URL}/video{else}{$smarty.const.CLIPSURL}{/if}/{$rows[dp].idvideo|substr:0:-4|escape:url|cat:".jpg"}); width: 300px; height: 200px;" href="{if $rows[dp].cdn=='t'}{$smarty.const.CDN_URL}/video{else}{$smarty.const.CLIPSURL}{/if}/{$rows[dp].idvideo}"><img src="http://media.laprensa.com.ni/play_large.png" alt="videos" width="83" height="83" style="margin-top:65px;" /></a></div>{elseif $rows[dp].imgs}<div class="imagen left"><img src="{$smarty.const.PIXURL}/{$rows[dp].imgs[0]|time_pic:"%Y/%m"}/{if $rows[dp].presentar=='h'}288x318{else}150x100{/if}_{$rows[dp].imgs[0]}" width="150" alt="" /></div>{/if}
{/if}
<p>{if $rows[dp].resumen}{$rows[dp].resumen|strip_tags|truncate:300}{else}{$rows[dp].texto|strip_tags|regex_replace:"/[\r\t\n]/":" "|replace:"&nbsp;":" "|regex_replace:"/\s+/":" "|trim|truncate:150}{/if}</p>

{if $rows[dp].rels||$rows[dp].fotogaleria}
<div id="relacionadas">
{if $rows[dp].fotogaleria}<p class="rel_galeria"><a href="#" onclick="openwindow('/gallery.php?id={$rows[dp].fotogaleria.idgaleria}',640,460);">{$rows[dp].fotogaleria.galeria}</a></p>{/if}
{section name=rel loop=$rows[dp].rels}
<p class="rel_{$rows[dp].rels[rel].tipo}"><a href="{$rows[dp].rels[rel].enlace}">{$rows[dp].rels[rel].relacionado}</a></p>
{/section}
</div>
{/if}
<div class="puntuacion{if $rows[dp].comentarios > 0 && $rows[dp].stars < 1} borde{/if}"><label>Resultado:</label><div class="stars">{section name=j loop=5}{assign var="left" value=$rows[dp].stars-$smarty.section.j.index}{if $left>0.9}<img src="/imgs/star_full.png" alt="" title="" class="star"/>{elseif $left>0.1&&$left<=0.9}<img src="/imgs/star_waxing.png" alt="" title="" class="star"/>{else}<img src="/imgs/star_empty.png" alt="" title="" class="star" />{/if}{/section}</div>&nbsp; {$rows[dp].stars}</div>
{if $rows[dp].comentarios > 0}<div class="comentario">Comentarios:  <span class="rojo">{$rows[dp].comentarios}</span></div>{/if}
<div class="limpiar"></div>
{if $smarty.section.dp.first}<div class="baner_centro">{if $uri == 'reportajes-especiales'}<a href="http://www.laprensa.com.ni/enlaces/mga24hr/" target="_blank"><img src="/imgs/managua24hr.png" border="0" /></a>{/if}{$banner_medio_300_250}</div>
{/if}
</div><!--especiales-->
{if !$smarty.section.dp.last}<div class="puntos480"></div>{/if}
{/section}
</div><!--centrobloque1-->
{if $uri == 'elecciones-municipales-2012'}
  {include file="paginado-noticias-elecciones2012.tpl"}
  <div class="limpiar"></div>
  <div id="ctmp">{include file="redes_minoticia_elecciones2012.tpl"}</div>
{/if}
</div> <!-- bigizqbloque1b -->
<div class="banner_flotanteder">{$banner_160x600_lateral_2}</div> 
<div id="derbloque1">
{include file="encuesta.inc.tpl"}
{if $uri == 'elecciones-municipales-2012'|| $uri == 'elecciones'}
  {include file="live.tpl"}
{/if}
{if $uri == 'elecciones-municipales-2012'}
  {include file="todo_elecciones2012_right.tpl"}
{/if}
{if $uri == 'elecciones'}

{include file="comentarios_electorales.inc.tpl"}
{* twitter*}
<script src="http://widgets.twimg.com/j/2/widget.js"></script>
<script>
{literal}
new TWTR.Widget({
version: 2,
type: 'search',
search: '#votonica -ortiratas -piricuacos -ladrÃ³n -torturador -ladrones -asesino -abortista -maricÃ³n -cochÃ³n -cochona -genocida -bombardeo',
interval: 30000,
title: 'La Prensa',
subject: '#VotoNica',
width: 'auto',
height: 350,
theme: {
shell: {
background: '#225094',
color: '#ffffff'
},
tweets: {
background: '#ffffff',
color: '#000000',
links: '#000305'
}
},
features: {
scrollbar: false,
		   loop: true,
		   live: true,
		   behavior: 'default'
		  }
}).render().start();
{/literal}
</script>
<br /><br />
{/if}
{if $uri == 'poderes'}
<iframe src="http://partner.dw-world.de/syndication/feeds/cb_prensanicaraguapolitica.8799-cb.html" scrolling="no" frameborder="0" style="border: none; overflow: hidden; width: 252px; height: 480px;" allowtransparency="true"></iframe>
{/if}
{if $uri == 'activos'}
<iframe src="http://partner.dw-world.de/syndication/feeds/cb_prensanicaraguaeconom%C3%ADa.8801-cb.html" scrolling="no" frameborder="0" style="border: none; overflow: hidden; width: 252px; height: 480px;" allowtransparency="true"></iframe>
{/if}
{if $uri == 'vida'}
<iframe src="http://partner.dw-world.de/syndication/feeds/cb_prensanicaraguacultura.8803-cb.html" scrolling="no" frameborder="0" style="border: none; overflow: hidden; width: 252px; height: 480px;" allowtransparency="true"></iframe>
{/if}
{if $uri == 'tecnologia'}
<iframe src="http://partner.dw-world.de/syndication/feeds/cb_prensanicaraguaciencia.8805-cb.html" scrolling="no" frameborder="0" style="border: none; overflow: hidden; width: 252px; height: 480px;" allowtransparency="true"></iframe>
{/if}
{if $uri != 'elecciones-municipales-2012'}
  {include file="todo_elecciones2012_right.tpl"}
  {include file="blogs.inc.tpl"}
  {include file="tags.inc.tpl"}
{/if}
{* end twitter*}
{if $banner_derecho_160_600}<div class="baner_alargado">{$banner_derecho_160_600}</div>{/if}
</div><!--derbloque1-->
<div class="limpiar"></div>
</div><!--bloque1-->
