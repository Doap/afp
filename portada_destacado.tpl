<div class="limpiar">&nbsp;</div>
{if $banner2_160x600}<div class="banner_flotanteizq">{$banner2_160x600}</div>{/if}
<div id="bloque1">
        <div id="bigizqbloque1">
{*if $noticiaelectoral2012}
<div id="elecciones-2012">
  <div class="header">
    <a href="/{$noticiaelectoral2012[0].edicion|date_format:"%Y/%m/%d"}/elecciones-municipales-2012"><img src="/elecciones-2012/img/header.jpg" alt="" /></a>
  </div>
  <div class="left">
    {if $bamb.estado == 'A'}
      <div class="noticia">
        <object id="bplayer" classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" width="396" height="400"><embed name="bplayer" src="http://static.bambuser.com/r/player.swf?username=laprensa" type="application/x-shockwave-flash" width="396" height="400" allowfullscreen="true" allowscriptaccess="always" wmode="opaque"></embed><param name="movie" value="http://static.bambuser.com/r/player.swf?username=laprensa"></param><param name="allowfullscreen" value="true"></param><param name="allowscriptaccess" value="always"></param><param name="wmode" value="opaque"></param></object>
      </div>
   {else}
     <div class="noticia">
        {if $noticiaelectoral2012[0].video==1}
          {if $is_mobile}
            <video poster="{if $noticiaelectoral2012[0].cdn=='t'}{$smarty.const.CDN_URL}/video{else}{$smarty.const.CLIPSURL}{/if}/{$noticiaelectoral2012[0].idvideo|substr:0:-4|escape:url|cat:".jpg"}" controls >
              <source src="{if $noticiaelectoral2012[0].cdn=='t'}{$smarty.const.CDN_URL}/video{else}{$smarty.const.CLIPSURL}{/if}/{$noticiaelectoral2012[0].idvideo}" type="video/mp4" />
            </video>
          {else}
            <a class="flowplayer" style="background-image: url({if $noticiaelectoral2012[0].cdn=='t'}{$smarty.const.CDN_URL}/video{else}{$smarty.const.CLIPSURL}{/if}/{$noticiaelectoral2012[0].idvideo|substr:0:-4|escape:url|cat:".jpg"}); width:397px; height:240px;" href="{if $noticiaelectoral2012[0].cdn=='t'}{$smarty.const.CDN_URL}/video{else}{$smarty.const.CLIPSURL}{/if}/{$noticiaelectoral2012[0].idvideo}">
            <img src="http://media.laprensa.com.ni/play_large.png" alt="videos"  width="83" height="83" />
            </a>
          {/if}
        {elseif $noticiaelectoral2012[0].imgs}
          <img src="{$smarty.const.PIXURL}/{$noticiaelectoral2012[0].imgs[0]|time_pic:"%Y/%m"}/640x300_{$noticiaelectoral2012[0].imgs[0]|escape:url}" alt="" width="395" height="250" />
        {/if}
        <h1 class="margentop"><a href="{$noticiaelectoral2012[0].edicion|date_format:"%Y/%m/%d"}/{$noticiaelectoral2012[0].uri}/{$noticiaelectoral2012[0].idnoticia}-{$noticiaelectoral2012[0].noticia|seo_url}">{$noticiaelectoral2012[0].noticia}</a></h1> 
        {if $noticiaelectoral2012[0].resumen}
          {$noticiaelectoral2012[0].resumen|strip_tags|truncate:600}</p>
        {else}
          <p>{$noticiaelectoral2012[0].texto|strip_tags|regex_replace:"/[\r\t\n]/":" "|replace:"&nbsp;":" "|regex_replace:"/\s+/":" "|trim|truncate:600:"..."}</p>
        {/if}
        <div class="puntuacion{if $noticiaelectoral2012[0].comentarios > 0} borde{/if}"><label>Resultado:</label><div class="stars">{section name=j loop=5}{assign var="left" value=$noticiaelectoral2012[0].stars-$smarty.section.j.index}{if $left>0.9}<img src="/imgs/star_full.png" alt="" title="" class="star" />{elseif $left>0.1&&$left<=0.9}<img src="/imgs/star_waxing.png" alt="" title="" class="star" />{else}<img src="/imgs/star_empty.png" alt="" title="" class="star"/>{/if}{/section}</div> {$noticiaelectoral2012[0].votos|default:"0"} votos</div>
      </div>
    {/if}
  </div>
  <div class="right">
    <div class="noticia">
    {if $bamb.estado == 'A'}
      {if $noticiaelectoral2012[0].imgs}<img src="{$smarty.const.PIXURL}/{$noticiaelectoral2012[0].imgs[0]|time_pic:"%Y/%m"}/271x165_{$noticiaelectoral2012[0].imgs[0]|escape:url}" alt="" width="271" height="140" />{/if}
      <span class="category">{$noticiaelectoral2012[0].seccion}</span> | <span class="time">{$noticiaelectoral[0].hora|date_format:"%I:%M"} {if $noticiaelectoral[0].hora|date_format:"%H" > 12}p.m.{elseif $noticiaelectoral2012[0].hora|date_format:"%H"==12}m.{else}a.m.{/if}</span> <br />
      <h1><a href="/{$noticiaelectoral2012[0].edicion|date_format:"%Y/%m/%d"}/{$noticiaelectoral2012[0].uri}/{$noticiaelectoral2012[0].idnoticia}-{$noticiaelectoral2012[0].noticia|seo_url}">{$noticiaelectoral2012[0].noticia}</a></h1>
      {if $noticiaelectoral2012[0].imgs}
        <p>{$noticiaelectoral2012[0].resumen|strip_tags|regex_replace:"/[\r\t\n]/":" "|replace:"&nbsp;":" "|regex_replace:"/\s+/":" "|trim|truncate:80:"..."}</p>
      {else}
        <p>{$noticiaelectoral2012[0].resumen|strip_tags|regex_replace:"/[\r\t\n]/":" "|replace:"&nbsp;":" "|regex_replace:"/\s+/":" "|trim|truncate:300:"..."}</p>
      {/if}
    {else}
     {if $noticiaelectoral2012[1].imgs}<img src="{$smarty.const.PIXURL}/{$noticiaelectoral2012[1].imgs[0]|time_pic:"%Y/%m"}/271x165_{$noticiaelectoral2012[1].imgs[0]|escape:url}" alt="" width="271" height="140" />{/if}
      <span class="category">{$noticiaelectoral2012[1].seccion}</span> | <span class="time">{$noticiaelectoral[1].hora|date_format:"%I:%M"} {if $noticiaelectoral[1].hora|date_format:"%H" > 12}p.m.{elseif $noticiaelectoral2012[1].hora|date_format:"%H"==12}m.{else}a.m.{/if}</span> <br />
      <h1><a href="/{$noticiaelectoral2012[1].edicion|date_format:"%Y/%m/%d"}/{$noticiaelectoral2012[1].uri}/{$noticiaelectoral2012[1].idnoticia}-{$noticiaelectoral2012[1].noticia|seo_url}">{$noticiaelectoral2012[1].noticia}</a></h1>
      <p>{$noticiaelectoral2012[1].resumen|strip_tags|regex_replace:"/[\r\t\n]/":" "|replace:"&nbsp;":" "|regex_replace:"/\s+/":" "|trim|truncate:80:"..."}</p>
     {/if}
    </div>

    <div class="slider-elecciones">
      <div class="titularb">
        <span class="titulo">Galer&iacute;a</span>
        
        <span class="next"></span>
        <span class="prev"></span>


      </div>
      {if $galelecciones2012}
      <div class="slider slider-image">
          <ul>
            {section name=i loop=$galelecciones2012}
              <li>
                <a rel="prettyPhoto[pp_gal]" href="{$smarty.const.PIXURL}/{$galelecciones2012[i].imagen|time_pic:"%Y/%m"}/600x400_{$galelecciones2012[i].imagen}" class="image" title="{$galelecciones2012[i].texto|strip_tags|regex_replace:"/[\r\t\n]/":" "|replace:"&nbsp;":" "|regex_replace:"/\s+/":" "|trim|truncate:60:"..."}" alt="{$smarty.section.i.iteration}"><img src="{$smarty.const.PIXURL}/{$galelecciones2012[i].imagen|time_pic:"%Y/%m"}/271x165_{$galelecciones2012[i].imagen}" title="{$galelecciones2012[i].texto|nl2br}" alt="{$galelecciones2012[0].galeria}" width="275" height="152" /></a>
                <div class="text" style="width:240px;">{$galelecciones2012[i].texto|strip_tags|regex_replace:"/[\r\t\n]/":" "|replace:"&nbsp;":" "|regex_replace:"/\s+/":" "|trim|truncate:60:"..."}</div>
              </li>
            {/section}
         </ul>
      </div>
      {/if}
    </div>
  </div>
</div>
{/if*}
        {if $amplia}
        <div id="notaAmplia">
          <div class="noticia">
             {if $amplia.destacado!='t'}<h1><a href="/{$amplia.edicion|date_format:"%Y/%m/%d"}/{$amplia.uri}/{$amplia.idnoticia}-{$amplia.noticia|seo_url}">{$amplia.noticia}</a></h1>{/if}
             {if $amplia.imgs&&$amplia.ubicacion=='2'}<img src="{$smarty.const.PIXURL}/{$amplia.imgs[0]|time_pic:"%Y/%m"}/{if $amplia.destacado=='t'}600x400{else}150x100{/if}_{$amplia.imgs[0]|escape:url}" {if $amplia.destacado=='t'}width="397"{/if} alt="" />{/if}
             {if $amplia.imgs&&$amplia.ubicacion=='2R'}<img src="{$smarty.const.PIXURL}/{$amplia.imgs[0]|time_pic:"%Y/%m"}/{if $amplia.destacado=='t'}600x400{else}150x100{/if}_{$amplia.imgs[0]|escape:url}" {if $amplia.destacado=='t'}width="397"{/if} alt="" class="right" />{/if}
             {if $amplia.imgs&&$amplia.ubicacion=='2W'}<img src="{$smarty.const.PIXURL}/{$amplia.imgs[0]|time_pic:"%Y/%m"}/640x300_{$amplia.imgs[0]|escape:url}" alt="" class="width" />{/if}
             {if $amplia.destacado=='t'}<h1><a href="/{$amplia.edicion|date_format:"%Y/%m/%d"}/{$amplia.uri}/{$amplia.idnoticia}-{$amplia.noticia|seo_url}">{$amplia.noticia}</a></h1>{/if}
             {if $amplia.resumen}{$amplia.resumen}{else}{$amplia.texto|strip_tags|regex_replace:"/[\r\t\n]/":" "|replace:"&nbsp;":" "|regex_replace:"/\s+/":" "|trim|truncate:250:"..."}{/if}
          </div>
            <div id="relacionadas">
            {section name=rel loop=$amplia.rels}
              <p class="rel_{$amplia.rels[rel].tipo}"><a href="{$amplia.rels[rel].enlace}" target="_blank">- {$amplia.rels[rel].relacionado}</a></p>
            {/section}
            </div>
          <div class="options">
            <div class="puntuacion{if $amplia.comentarios > 0} borde{/if}"><label>Resultado:</label><div class="stars">{section name=j loop=5}{assign var="left" value=$amplia.stars-$smarty.section.j.index}{if $left>0.9}<img src="/imgs/star_full.png" alt="" title="" class="star" />{elseif $left>0.1&&$left<=0.9}<img src="/imgs/star_waxing.png" alt="" title="" class="star" />{else}<img src="/imgs/star_empty.png" alt="" title="" class="star"/>{/if}{/section}</div> {$amplia.votos|default:"0"} votos</div>
            {if $amplia.comentarios > 0}<div class="comentario">Comentarios: <span class="rojo">{$amplia.comentarios}</span></div>{/if}
          </div><br/>
          <!-- 
          <a href="http://www.laprensa.com.ni/enlaces/hugo-chavez-fin-de-un-caudillo/index.html"><img src="http://www.laprensa.com.ni/enlaces/hugo-chavez-fin-de-un-caudillo/images/banner-especial-hugo-chavez-fin-de-un-caudillo.png" alt="Especial Hugo Chavez, fin de un caudillo" title="Especial Hugo Chavez, fin de un caudillo" border="0" /></a> 
          -->
          <br clear="all"/>
        </div>
        {/if}
    { if $showelecciones }
        <div id="notaAmplia">
          <div class="banner_2011"><a href="/{$edicion.edicion|date_format:"%Y/%m/%d"}/elecciones"><img src="/imgs/header-elecc2011.png" width="716" border="0" alt="banner" /></a>  </div>
          <div class="resultados">
            <h1>{$nota_elecciones.pagina} </h1>
            <p style="font-size:16px;color:black">{$subnota_elecciones.pagina}</p>
            <p>{$subnota_elecciones.texto}</p>
            {section name=candi loop=$candidatos}
              <div class="flag">
                <img src="{$smarty.const.FILESURL}/ppolitico/{$candidatos[candi].foto}" width="75" alt="foto" /><br/>
                <img src="{$smarty.const.FILESURL}/ppolitico/{$candidatos[candi].imagen}" width="75" height="40" alt="logo" />
                <p class="total_votos"><span class="partido" style="font-size: 16px;">{$candidatos[candi].ppolitico}</span>&nbsp;{$candidatos[candi].porcentaje|string_format:"%.2f"}%</p>
                <p class="total_votos2">{$candidatos[candi].votos|number_format}</p>
              </div>
            {/section}
          </div>

          <div class="izq electoral_mapa">
          {include file="mapa.tpl"}
          </div>

          <div class="der electoral_portada_der">
            {section name=i loop=$noticiaelectoral}
              <div class="noticia actualidadchica" style="padding-bottom: 12px;">
{if $noticiaelectoral[i].imgs[0] && $noticiaelectoral[i].imgs[0] != 'large.png'}
                <div class="imagenelec"><img src="{$smarty.const.PIXURL}/{$noticiaelectoral[i].imgs[0]|time_pic:"%Y/%m"}/120x90_{$noticiaelectoral[i].imgs[0]}" alt="foto" /></div>
{/if}
                <span class="rojo">{$noticiaelectoral[i].creacion|date_format:"%I:%M"}</span>
                <h2 class="elecciones"><a href="/{$noticiaelectoral[i].edicion|date_format:"%Y/%m/%d"}/{$noticiaelectoral[i].uri}/{$noticiaelectoral[i].idnoticia}">{$noticiaelectoral[i].noticia}</a></h2>
                <p>
                  {if $noticiaelectoral[i].resumen}
                  {$noticiaelectoral[i].resumen|strip_tags|truncate:120}
                  {else}
                  {$noticiaelectoral[i].texto|strip_tags|regex_replace:"/[\r\t\n]/":" "|replace:"&nbsp;":" "|regex_replace:"/\s+/":" "|trim|truncate:150:"..."}{/if}
                </p>
              </div>
            {/section}
          </div>
          <br clear="all" />      <br />
           <div class="puntos480"></div>
        </div>
        <br clear="all" />
    {/if}
        <div id="izqbloque1">
          {section name=v loop=$izquierda}
            {if $izquierda[v].destacado == 't'}
            <div class="noticia actualidadgrande">
            {else}
            <div class="noticia actualidadchica">
            {/if}
            <div class="titularventana"><p>{$izquierda[v].seccion}{if $izquierda[v].ultimahora=='t'} | <span class="last">ULTIMO MINUTO</span> - <span class="time">{$izquierda[v].hora|date_format:"%I:%M"} {if $izquierda[v].hora|date_format:"%H" > 12}p.m.{elseif $izquierda[v].hora|date_format:"%H"==12}m.{else}a.m.{/if}</span>{/if}</p></div>
            {if $izquierda[v].destacado == 't'}
              <h1><a href="/{$izquierda[v].edicion|date_format:"%Y/%m/%d"}/{$izquierda[v].uri}/{$izquierda[v].idnoticia}-{$izquierda[v].noticia|seo_url}">{$izquierda[v].noticia}</a></h1>
              {if $izquierda[v].video==2}

<div class="dest_video">
	<object width="397" height="240">
		<param name="movie" value="http://www.youtube.com/v/{$izquierda[v].idvideo}"></param>
		<param name="wmode" value="transparent"></param>
		<embed src="http://www.youtube.com/v/{$izquierda[v].idvideo}" type="application/x-shockwave-flash" wmode="transparent" width="397" height="240"></embed>
	</object>
</div>
            {elseif $izquierda[v].video==1}
            {if $is_mobile}
<video style="width: 240px; height: 180px" poster="{if $izquierda[v].cdn=='t'}{$smarty.const.CDN_URL}/video{else}{$smarty.const.CLIPSURL}{/if}/{$izquierda[v].idvideo|substr:0:-4|escape:url|cat:".jpg"}" controls >
    <source src="{if $izquierda[v].cdn=='t'}{$smarty.const.CDN_URL}/video{else}{$smarty.const.CLIPSURL}{/if}/{$izquierda[v].idvideo}" type="video/mp4" />
</video>
            {else}
<div style="float: left; margin-right:10px; margin-bottom:5px;">
    <a class="flowplayer" style="background-image: url({if $izquierda[v].cdn=='t'}{$smarty.const.CDN_URL}/video{else}{$smarty.const.CLIPSURL}{/if}/{$izquierda[v].idvideo|substr:0:-4|escape:url|cat:".jpg"}); width: 397px; height: 240px;" href="{if $izquierda[v].cdn=='t'}{$smarty.const.CDN_URL}/video{else}{$smarty.const.CLIPSURL}{/if}/{$izquierda[v].idvideo}">
    <img src="http://media.laprensa.com.ni/play_large.png" alt="videos" width="83" height="83" />
    </a>
</div>
            {/if}
            {elseif $izquierda[v].fotogaleria}
<img src="{$smarty.const.PIXURL}/{$izquierda[v].fotogaleria.imagen|time_pic:"%Y/%m"}/{if $izquierda[v].presentar=='w'}397x200{else}288x318{/if}_{$izquierda[v].fotogaleria.imagen|escape:url}" {if $izquierda[v].presentar=='w'}width="397"{else}width="150" style="float:left; margin-right:10px; margin-bottom:5px;"{/if} alt="" />

            {elseif $izquierda[v].imgs}
                {if $izquierda[v].antetitulo == 'AFP'}
<img src="/files/imagen/photo_{$izquierda[v].imgs[0]}" style="float:left; margin-right:10px; margin-bottom:5px;" width="200" alt="" />
                {else}
<img src="{$smarty.const.PIXURL}/{$izquierda[v].imgs[0]|time_pic:"%Y/%m"}/{if $izquierda[v].presentar=='w'}397x200{else}288x318{/if}_{$izquierda[v].imgs[0]|escape:url}" {if $izquierda[v].presentar=='w'}width="397"{else}width="150" style="float:left; margin-right:10px; margin-bottom:5px;"{/if} alt="" />
              {/if}

{/if}
              <p>
              {if $izquierda[v].resumen}
              {$izquierda[v].resumen|strip_tags}
              {else}
              {$izquierda[v].texto|strip_tags|regex_replace:"/[\r\t\n]/":" "|replace:"&nbsp;":" "|regex_replace:"/\s+/":" "|trim|truncate:250:"..."}{/if}
              </p>
            {else}
              {if $izquierda[v].video==2}
<div class="little_video left">
    <object width="240" height="180">
        <param name="movie" value="http://www.youtube.com/v/{$izquierda[v].idvideo}"></param>
        <param name="wmode" value="transparent"></param>
        <embed src="http://www.youtube.com/v/{$izquierda[v].idvideo}" type="application/x-shockwave-flash" wmode="transparent" width="240" height="180"></embed>
    </object>
</div>
    {elseif $izquierda[v].video==1}
            {if $is_mobile}
<video style="width: 240px; height: 180px" poster="{if $izquierda[v].cdn=='t'}{$smarty.const.CDN_URL}/video{else}{$smarty.const.CLIPSURL}{/if}/{$izquierda[v].idvideo|substr:0:-4|escape:url|cat:".jpg"}" controls >
    <source src="{if $izquierda[v].cdn=='t'}{$smarty.const.CDN_URL}/video{else}{$smarty.const.CLIPSURL}{/if}/{$izquierda[v].idvideo}" type="video/mp4" />
</video>
            {else}
                {if $is_mobile}
                <video poster="{if $izquierda[v].cdn=='t'}{$smarty.const.CDN_URL}/video{else}{$smarty.const.CLIPSURL}{/if}/{$izquierda[v].idvideo|substr:0:-4|escape:url|cat:".jpg"}" controls >
                    <source src="{if $izquierda[v].cdn=='t'}{$smarty.const.CDN_URL}/video{else}{$smarty.const.CLIPSURL}{/if}/{$izquierda[v].idvideo}" type="video/mp4" />
                </video>
                {else}
                    <div style="float: left; margin-right:10px; margin-bottom:5px;">
                        <a class="flowplayer" style="background-image: url({if $izquierda[v].cdn=='t'}{$smarty.const.CDN_URL}/video{else}{$smarty.const.CLIPSURL}{/if}/{$izquierda[v].idvideo|substr:0:-4|escape:url|cat:".jpg"}); width: 397px; height: 240px;" href="{if $izquierda[v].cdn=='t'}{$smarty.const.CDN_URL}/video{else}{$smarty.const.CLIPSURL}{/if}/{$izquierda[v].idvideo}">
                        <img src="http://media.laprensa.com.ni/play_large.png" alt="videos" width="83" height="83" />
                        </a>
                    </div>
                {/if}
            {/if}
    {elseif $izquierda[v].fotogaleria}
<img src="{$smarty.const.PIXURL}/{$izquierda[v].fotogaleria.imagen|time_pic:"%Y/%m"}/{if $izquierda[v].presentar=='w'}150x100{else}288x318{/if}_{$izquierda[v].fotogaleria.imagen|escape:url}" alt="" width="150" />
    {elseif $izquierda[v].imgs}
<img src="{$smarty.const.PIXURL}/{$izquierda[v].imgs[0]|time_pic:"%Y/%m"}/{if $izquierda[v].presentar=='w'}150x100{else}288x318{/if}_{$izquierda[v].imgs[0]|escape:url}" alt="" width="150" />
    {/if}
              <h1><a href="/{$izquierda[v].edicion|date_format:"%Y/%m/%d"}/{$izquierda[v].uri}/{$izquierda[v].idnoticia}-{$izquierda[v].noticia|seo_url}">{$izquierda[v].noticia}</a></h1>
              <p>
                {if $izquierda[v].resumen}
                {$izquierda[v].resumen|strip_tags}
                {else}
                {$izquierda[v].texto|strip_tags|regex_replace:"/[\r\t\n]/":" "|replace:"&nbsp;":" "|regex_replace:"/\s+/":" "|trim|truncate:350:"..."}
                {/if}
              </p>
              <div class="limpiar"></div>
            {/if}
            {if $izquierda[v].rels||$izquierda[v].fotogaleria}
            <div id="relacionadas">
            {if $izquierda[v].fotogaleria}<p class="rel_galeria"><a href="#" onclick="openwindow('/gallery.php?id={$izquierda[v].fotogaleria.idgaleria}',640,460);">{$izquierda[v].fotogaleria.galeria}</a></p>{/if}
            {section name=rel loop=$izquierda[v].rels}
              <p class="rel_{$izquierda[v].rels[rel].tipo}"><a href="{$izquierda[v].rels[rel].enlace}" target="_blank">{$izquierda[v].rels[rel].relacionado}</a></p>
            {/section}
            </div>
            {/if}
              <div class="puntuacion{if $izquierda[v].comentarios > 0} borde{/if}"><label>Resultado:</label><div class="stars">{section name=j loop=5}{assign var="left" value=$izquierda[v].stars-$smarty.section.j.index}{if $left>0.9}<img src="/imgs/star_full.png" alt="" title="" class="star" />{elseif $left>0.1&&$left<=0.9}<img src="/imgs/star_waxing.png" alt="" title="" class="star" />{else}<img src="/imgs/star_empty.png" alt="" title="" class="star"/>{/if}{/section}</div>&nbsp; {$izquierda[v].votos|default:"0"} votos</div>
              {if $izquierda[v].comentarios > 0}<div class="comentario">Comentarios: <span class="rojo">{$izquierda[v].comentarios}</span></div>{/if}
            <div class="limpiar"></div>
          </div><!--noticia-->
	  {if !$smarty.section.v.last}<div class="puntos392"></div>{/if}
          {/section}  
        </div><!--izqbloque1-->
          <!-- Aqui se coloca el banner especial 300x250 -->
	  <div id="centrobloque1" style="margin-top: 10px;">
	<!--Slider noticias -->
	 {if $cajita}
          <div class="nacionalconborde slider" id="slider1">
            <div class="titularventana">
              {if $departamentales===true}<a href="/{$edicion.edicion|date_format:"%Y/%m/%d"}/departamentales/"><img src="/imgs/departamentales.png" height="92" width="285" title="Seccion departamentales" /></a>{/if}
              <p>
                <span class="separacion5right"><a href="javascript:;" class="prev" name="slider1"><img src="/imgs/flechitaizq.png" width="15" height="12" alt="" /></a><span class="num_slides"><span class="cur_slide">1</span>/{$cajita|@count}</span><a href="javascript:;" class="next" name="slider1"><img src="/imgs/flechitader.png" width="15" height="12" alt="" /></a></span>
              </p>
            </div>
            {section name=na loop=$cajita}
            <div id="nac_{$cajita[na].idnoticia}" class="noticia slide"{if !$smarty.section.na.first} style="display:none;"{/if}>
              {if $departamentales===false} <div class="titularventana"><p>{$cajita[na].seccion}</p></div> {/if}
              <h1><a href="/{$cajita[na].edicion|date_format:"%Y/%m/%d"}/{$cajita[na].uri}/{$cajita[na].idnoticia}">{$cajita[na].noticia}</a></h1>
              {if $cajita[na].video||$cajita[na].imgs}
              {if $cajita[na].video==2}
<div class="little_video left">
    <object width="240" height="180">
    <param name="movie" value="http://www.youtube.com/v/{$cajita[na].idvideo}"></param>
    <param name="wmode" value="transparent"></param>
    <embed src="http://www.youtube.com/v/{$cajita[na].idvideo}" type="application/x-shockwave-flash" wmode="transparent" width="240" height="180"></embed></object>
</div>
        {elseif $cajita[na].video==1}
        {if $is_mobile}
            <video poster="{if $cajita[na].cdn=='t'}{$smarty.const.CDN_URL}/video{else}{$smarty.const.CLIPSURL}{/if}/{$cajita[na].idvideo|substr:0:-4|escape:url|cat:".jpg"}" controls >
                <source src="{if $cajita[na].cdn=='t'}{$smarty.const.CDN_URL}/video{else}{$smarty.const.CLIPSURL}{/if}/{$cajita[na].idvideo}" type="video/mp4" />
            </video>
        {else}
<div class="little_video left">
    <a class="flowplayer" style="background-image: url({if $cajita[na].cdn=='t'}{$smarty.const.CDN_URL}/video{else}{$smarty.const.CLIPSURL}{/if}/{$cajita[na].idvideo|substr:0:-4|escape:url|cat:".jpg"}); width: 271px; height: 165px;" href="{if $cajita[na].cdn=='t'}{$smarty.const.CDN_URL}/video{else}{$smarty.const.CLIPSURL}{/if}/{$cajita[na].idvideo}">
        <img src="http://media.laprensa.com.ni/play_large.png" alt="videos" width="83" height="83" />
    </a>
</div>
        {/if}
        {elseif $cajita[na].imgs}
<img src="{$smarty.const.PIXURL}/{$cajita[na].imgs[0]|time_pic:"%Y/%m"}/271x165_{$cajita[na].imgs[0]|escape:url}" alt="" />
        {/if}
              <p>{if $cajita[na].resumen}{$cajita[na].resumen|strip_tags}{else}{$cajita[na].texto|strip_tags|regex_replace:"/[\r\t\n]/":" "|replace:"&nbsp;":" "|regex_replace:"/\s+/":" "|trim|truncate:225}{/if}</p>
              {else}
              <p>{if $cajita[na].resumen}{$cajita[na].resumen|strip_tags}{else}{$cajita[na].texto|strip_tags|regex_replace:"/[\r\t\n]/":" "|replace:"&nbsp;":" "|regex_replace:"/\s+/":" "|trim|truncate:760}{/if}</p>
              {/if}
              <div class="puntuacion"><label>Resultado:</label><div class="stars">{section name=j loop=5}{assign var="left" value=$cajita[na].stars-$smarty.section.j.index}{if $left>0.9}<img src="/imgs/star_full.png" alt="" title="" class="star"/>{elseif $left>0.1&&$left<=0.9}<img src="/imgs/star_waxing.png" alt="" title="" class="star"/>{else}<img src="/imgs/star_empty.png" alt="" title="" class="star"/>{/if}{/section}</div>&nbsp; {$cajita[na].votos|default:"0"} votos</div>
              {if $cajita[na].comentarios}<div class="comentario" >Comentarios:<span class="rojo">{$cajita[na].comentarios}</span></div>{/if}
              <div class="limpiar"></div>
            </div>
            {/section}
          </div>
          {/if}
            {if $marcador_superior}{$marcador_superior}{/if} 
            <br clear="all" />
 <div class="puntos304"></div>
 <!-- Fin Slider -->
	<!-- notas mi noticia-->
          {if $tweet.estado=='A'} 
            <div id="twitcam">
             <img src="/imgs/twitlive.png" height="56" width="300" border="0"/> 
             {$tweet.texto}<br/>
              <!-- embed --> 
                <object id="twitcamPlayer" width="280" height="265" classid="clsid:d27cdb6e-ae6d-11cf-96b8-444553540000"><param name="movie" value="http://static.livestream.com/grid/LSPlayer.swf?hash={$tweet.pagina}"/><param name="allowScriptAccess" value="always"/><param name="allowFullScreen" value="true"/><param name="ColorOver" value="0x8cb6e5"/><param name="autoPlay" value="true"/><param name="wmode" value="window"/> <embed name="twitcamPlayer" src="http://static.livestream.com/grid/LSPlayer.swf?hash={$tweet.pagina}" allowFullScreen="true" allowScriptAccess="always" type="application/x-shockwave-flash" bgcolor="#ffffff" width="300" height="265" wmode="window" ></embed></object>
              <!--fin del codigo embed -->
            </div>
          <br/>   
          {/if}
         {if $bamb.estado=='A'}
            <div id="twitcam">
            <img src="http://www.laprensa.com.ni/enlaces/logoenvivo3.png" width="300" border="0" />
            <h2 style="font-size:24px;color:#0d72b9; font-family:'Times New Roman', Times, serif; font-weight:normal;text-align:center;">{if $bamb.pagina}{$bamb.pagina}{/if}</h2>
            <!-- <span style="text-align:center;">{$bamb.texto}</span>
             <object id="bplayer" classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" width="300" height="340"><embed name="bplayer" src="http://static.bambuser.com/r/player.swf?username=laprensa" type="application/x-shockwave-flash" width="300" height="340" allowfullscreen="true" allowscriptaccess="always" wmode="opaque"></embed><param name="movie" value="http://static.bambuser.com/r/player.swf?username=laprensa"></param><param name="allowfullscreen" value="true"></param><param name="allowscriptaccess" value="always"></param><param name="wmode" value="opaque"></param></object>
           -->
         <iframe width="300" height="340"
src="http://www.youtube.com/embed/3X6E_FeyJGc" frameborder="0"
allowfullscreen></iframe>
          </div>
          {/if}
	
          {if $notas || $notas2}
          <div class="minoticia" align="center" style="color:#000000;">
          <img src="/imgs/minoticiabloque.png" border="0" alt="" /><br/>
          Envia tu noticia a <a href="mailto:minoticia@laprensa.com.ni" style="color:#004e96;">minoticia@laprensa.com.ni</a>
          <div class="limpiar">&nbsp;</div>
          <ul id="slide">
          {section name=i loop=$notas}
           <li>
            {if $notas[i].video == 2}
<div class="dest_video" style="float: left; margin-right: 10px; margin-bottom: 5px;">
    <object width="271" height="165">
        <param name="movie" value="http://www.youtube.com/v/{$notas[i].idvideo}"></param>
        <param name="wmode" value="transparent"></param>
        <embed src="http://www.youtube.com/v/{$notas[i].idvideo}" type="application/x-shockwave-flash" wmode="transparent" width="271" height="165"></embed>
    </object>
</div>
        {elseif $notas[i].video == 1}
        {if $is_mobile}
            <video poster="{$smarty.const.URL}/files/videominoticia/{$notas[i].idvideo|substr:0:-4|escape:url|cat:".jpg"}" controls >
                <source src="{$smarty.const.CLIPSMN}/{$notas[i].idvideo|escape:url}" type="video/mp4" />
            </video>
        {else}
<div style="float: left; margin-right:10px; margin-bottom:5px;">
    <a class="flowplayer" style="background-image: url({$smarty.const.URL}/files/videominoticia/{$notas[i].idvideo|substr:0:-4|escape:url|cat:".jpg"}); width: 240px; height: 180px;" href="{$smarty.const.CLIPSMN}/{$notas[i].idvideo|escape:url}">
        <img src="http://media2.laprensa.com.ni/play_large.png" alt="videos" width="83" height="83" />
    </a>
</div>
        {/if}
        {elseif $notas[i].imgs}
<img src="{$smarty.const.PIXURL}/{$notas[i].imgs[0]|time_pic:"%Y/%m"}/271x165_{$notas[i].imgs[0]|escape:url}" alt="" style="float:left; margin-right:10px; margin-bottom:5px;" />
        {/if}

           <h3><a href="/minoticia/{$notas[i].idminoticia}">{$notas[i].minoticia}</a></h3>
           {if $notas[i].resumen}
             <p>{$notas[i].resumen|strip_tags}</p>
           {else}
             <p>{$notas[i].texto|strip_tags|regex_replace:"/[\r\t\n]/":" "|replace:"&nbsp;":" "|regex_replace:"/\s+/":" "|trim|truncate:350:"..."}</p>
           {/if}
         <br/>
         <div class="limpiar">&nbsp;</div>
          </li>
          {/section}

          {section name=i loop=$notas2}
          <li>
             {if $notas2[i].video == 2}
               <div class="dest_video" style="float: left; margin-right: 10px; margin-bottom: 5px;"><object width="271" height="165"><param name="movie" value="http://www.youtube.com/v/{$notas2[i].idvideo}"></param><param name="wmode" value="transparent"></param><embed src="http://www.youtube.com/v/{$notas2[i].idvideo}" type="application/x-shockwave-flash" wmode="transparent" width="360" height="238"></embed></object></div>
                {elseif $notas2[i].video == 1}
                {if $is_mobile}
                <video poster="{$smarty.const.URL}/files/videominoticia/{$notas2[i].idvideo|substr:0:-4|escape:url|cat:".jpg"}" controls >
                    <source type="video/mp4" src="{$smarty.const.CLIPSMN}/{$notas2[i].idvideo}" />
                </video>
                {else}
<div style="float: left; margin-right:10px; margin-bottom:5px;">
    <a class="flowplayer" style="background-image: url({$smarty.const.URL}/files/videominoticia/{$notas2[i].idvideo|substr:0:-4|escape:url|cat:".jpg"}); width: 360px; height: 220px;" href="{$smarty.const.CLIPSMN}/{$notas2[i].idvideo}">
        <img src="http://media.laprensa.com.ni/play_large.png" alt="videos" width="83" height="83" />
    </a>
</div>
                {/if}
                {elseif $notas2[i].imgs}<img src="{$smarty.const.PIXURL}/{$notas2[i].imgs[0]|time_pic:"%Y/%m"}/271x165_{$notas2[i].imgs[0]|escape:url}" alt="" style="float:left; margin-right:10px; margin-bottom:5px;" />{/if}
           <h3><a href="/minoticia/ojociudadano/{$notas2[i].idojociudadano}">{$notas2[i].ojociudadano}</a></h3>
           {if $notas2[i].resumen}
             <p>{$notas2[i].resumen|strip_tags}</p>
           {else}
             <p>{$notas2[i].texto|strip_tags|regex_replace:"/[\r\t\n]/":" "|replace:"&nbsp;":" "|regex_replace:"/\s+/":" "|trim|truncate:350:"..."}</p>
           {/if}
           <div class="limpiar">&nbsp;</div>
           </li>
           {/section}
            </ul>
           </div>
          {else}
              <div class="puntos304"></div><br/>
              <div align="center">
              {if $portada_300x100_2}
                {$portada_300x100_2}
              {/if}
              </div>
              <br/><div class="puntos304"></div>
          {/if}
   <!-- fin de las notas mi noticia -->

<!--          {*if $banner_superior_300x250_especial*}<div class="baner_centro">{*$banner_superior_300x250_especial*}</div>{*/if*} -->
 	  <div class="puntos304"></div>
          {if $domingo}
          <div id="domingoPic">
            <img {if $cambio===true} src="/imgs/domingo_redesign.png" width="298" height="64" style="margin:10px 0 10px 0;" {else} src="/imgs/la-prensa-domingo.png" width="298" height="78" {/if} /><br />
            <a href="/domingo/{$domingo.iddomingo}"><img src="/files/domingo/{$domingo.domingo|escape:url}" alt="Domingo {$domingo.edicion|date_format:"%b %d/%Y"|capitalize}" width="298" height="163" border="0" class="preview" /></a>
          </div>
          {/if}
          <div class="puntos304"></div>
          {if $extra_ad}{$extra_ad}{/if}
          <div class="limpiar">&nbsp;</div>
{if $marcadores}
<input type="Hidden" name="num_tabs" value="{$marcadores|@count}">
<script language="JavaScript">
var tabcount =new Array("{$marcadores|@count}");
</script>
<script type="text/javascript" src="/js/marcador.js"></script>
	<center><div>{include file="marcador2.inc.tpl"}</div></center>
{else} 
{/if}
          {if $especiales}
          <div class="elementocentro">
            <div id="afondo">
              {section name=ej loop=$especiales}
              {if $especiales[ej].idespecial != $especiales[$smarty.section.ej.index_prev].idespecial}<img src="{$smarty.const.PIXURL}/{$especiales[ej].tituloimg|time_pic:"%Y/%m"}/304x176_{$especiales[ej].tituloimg}" alt="" width="304" height="176" /><div style="background-color:#{$especiales[e].color|default:"e3f0f8"}" class="special">{/if}
              <div style="padding-left:10px; color:#000; font-weight:bold">{if $especiales[ej].idespecial != $especiales[$smarty.section.ej.index_prev].idespecial}{$especiales[ej].descripcion}<br/>{/if}</div>
              <div class="item"><a href="/especial/{$especiales[ej].uri}/{$especiales[ej].idnota}">{$especiales[ej].nota}</a></div>
              {if $especiales[ej].comentarios > 0}<div class="comentario"> Comentarios: <span class="rojo">{$especiales[ej].comentarios}</span></div>{/if}
              {if $smarty.section.ej.first&&$smarty.section.ej.last || (!$smarty.section.ej.first && $especiales[ej].idespecial != $especiales[$smarty.section.ej.index_prev].idespecial)}</div>{/if}
              {/section}
            </div><!--afondo-->
          </div><!--elementocentro-->
         </div>
          <div class="puntos304"></div>
          {/if}
          {*if $suplemento}
          <div id="suplemento">
            <div class="titsuplemento">SUPLEMENTO</div>
            <div class="articulos">
              <h1><a href="/{$suplemento[0].edicionsuplemento|date_format:"%Y/%m/%d"}/suplemento/{$suplemento[0].uri}">{$suplemento[0].suplemento}</a></h1>
              <img src="{$smarty.const.PIXURL}/{$suplemento[0].portadasuplemento|time_pic:"%Y/%m"}/270x150_{$suplemento[0].portadasuplemento|escape:url}" alt="" width="270" height="150" /><br clear="all" />
              <div class="limpiar"></div>}
              {section name=st loop=$suplemento}
                <p><a href="/{$suplemento[0].edicionsuplemento|date_format:"%Y/%m/%d"}/suplemento/{$suplemento[0].uri}/{$suplemento[st].idarticulo}">{$suplemento[st].articulo}</a></p>
                {if (($smarty.section.st.iteration % 2) - 1) == 0}<div class="der">{else}<div class="izq">{/if}<p><a href="/{$suplemento[0].edicionsuplemento|date_format:"%Y/%m/%d"}/suplemento/{$suplemento[0].uri}/{$suplemento[st].idarticulo}">{$suplemento[st].articulo}</a></p>}
              {/section}
              <br clear="all" />
            </div>
          </div>
          {/if*}
          {section name=dp loop=$derecha max=1}
          <div class="noticia{if $smarty.section.dp.last} last{/if}">
            <div class="titularventana"><p>{$derecha[dp].seccion}{if $derecha[dp].ultimahora=='t'} | <span class="last">ULTIMO MINUTO</span> - <span class="time">{$derecha[dp].hora|date_format:"%I:%M"} {if $derecha[dp].hora|date_format:"%H" > 12}p.m.{elseif $derecha[dp].hora|date_format:"%H"==12}m.{else}a.m.{/if}</span>{/if}</p></div><!--titularventana-->
            <h1><a href="/{$derecha[dp].edicion|date_format:"%Y/%m/%d"}/{$derecha[dp].uri}/{$derecha[dp].idnoticia}-{$derecha[dp].noticia|seo_url}">{$derecha[dp].noticia}</a></h1>
            {if $derecha[dp].video==2}
                <div class="dest_video">
                    <object width="397" height="240">
                        <param name="movie" value="http://www.youtube.com/v/{$derecha[dp].idvideo}"></param>
                        <param name="wmode" value="transparent"></param>
                        <embed src="http://www.youtube.com/v/{$derecha[dp].idvideo}" type="application/x-shockwave-flash" wmode="transparent" width="300" height="100"></embed>
                    </object>
                </div>
            {elseif $derecha[dp].video==1}
                {if $is_mobile}
                <video poster="{if $derecha[dp].cdn=='t'}{$smarty.const.CDN_URL}/video{else}{$smarty.const.CLIPSURL}{/if}/{$derecha[dp].idvideo|substr:0:-4|escape:url|cat:".jpg"}" controls >
                    <source src="{if $derecha[dp].cdn=='t'}{$smarty.const.CDN_URL}/video{else}{$smarty.const.CLIPSURL}{/if}/{$derecha[dp].idvideo}" type="video/mp4" />
                </video>
                {else}
                <div style="float: left; margin-right:10px; margin-bottom:5px;">
                    <a class="flowplayer" style="background-image: url({if $derecha[dp].cdn=='t'}{$smarty.const.CDN_URL}/video{else}{$smarty.const.CLIPSURL}{/if}/{$derecha[dp].idvideo|substr:0:-4|escape:url|cat:".jpg"}); width: 300px; height: 200px;" href="{if $derecha[dp].cdn=='t'}{$smarty.const.CDN_URL}/video{else}{$smarty.const.CLIPSURL}{/if}/{$derecha[dp].idvideo}">
                        <img src="http://media.laprensa.com.ni/play_large.png" alt="videos" width="83" height="83" />
                    </a>
                </div>
                {/if}
            {elseif $derecha[dp].fotogaleria}<img src="{$smarty.const.PIXURL}/{$derecha[dp].fotogaleria.imagen|time_pic:"%Y/%m"}/{if $derecha[dp].presentar=='w'}300x100{else}288x318{/if}_{$derecha[dp].fotogaleria.imagen|escape:url}" {if $derecha[dp].presentar=='w'}width="300"{else}width="150" style="float:left; margin-right:10px; margin-bottom:5px;"{/if} alt="" />{elseif $derecha[dp].imgs}<img src="{$smarty.const.PIXURL}/{$derecha[dp].imgs[0]|time_pic:"%Y/%m"}/{if $derecha[dp].presentar=='w'}300x100{else}288x318{/if}_{$derecha[dp].imgs[0]|escape:url}" {if $derecha[dp].presentar=='h'} width="150" style="float:left;margin-right:10px; margin-bottom:5px;"{/if} alt="" />{/if}
            <p>{if $derecha[dp].resumen}{$derecha[dp].resumen|strip_tags|truncate:300}{else}{$derecha[dp].texto|strip_tags|regex_replace:"/[\r\t\n]/":" "|replace:"&nbsp;":" "|regex_replace:"/\s+/":" "|trim|truncate:150:"..."}{/if}</p>
            {if $derecha[dp].rels||$derecha[dp].fotogaleria}
            <br clear="all"/>
            <div id="relacionadas">
            {if $derecha[dp].fotogaleria}<p class="rel_galeria"><a href="#" onclick="openwindow('/gallery.php?id={$derecha[dp].fotogaleria.idgaleria}',640,460);">{$derecha[dp].fotogaleria.galeria}</a></p>{/if}
            {section name=rel loop=$derecha[dp].rels}
              <p class="rel_{$derecha[dp].rels[rel].tipo}"><a href="{$derecha[dp].rels[rel].enlace}" target="_blank">{$derecha[dp].rels[rel].relacionado}</a></p>
            {/section}
            </div>
            {/if}
            <div class="puntuacion{if $derecha[dp].comentarios > 0 && $derecha[dp].stars < 0} borde{/if}"><label>Resultado:</label><div class="stars">{section name=j loop=5}{assign var="left" value=$derecha[dp].stars-$smarty.section.j.index}{if $left>0.9}<img src="/imgs/star_full.png" alt="" title="" class="star"/>{elseif $left>0.1&&$left<=0.9}<img src="/imgs/star_waxing.png" alt="" title="" class="star"/>{else}<img src="/imgs/star_empty.png" alt="" title="" class="star"/>{/if}{/section}</div>&nbsp; {$derecha[dp].votos|default:"0"} votos</div>{if $derecha[dp].comentarios > 0}<div class="comentario">Comentarios: <span class="rojo">{$derecha[dp].comentarios}</span></div>{/if}
            <div class="limpiar"></div>
          </div><!--especiales-->
          {/section}
	 <div class="puntos304"></div>
          {if $banner_centro_300_250}<div class="baner_centro">{$banner_centro_300_250}</div>{/if}
 	  <div class="puntos304"></div>
          {section name=dp loop=$derecha start=1}
          {if $cuentanotas == $smarty.section.dp.index}{if $banner6_300x250}{$banner6_300x250}{/if}<div class="puntos304"></div>{/if}
          <div class="noticia">
            <div class="titularventana"><p>{$derecha[dp].seccion}{if $derecha[dp].ultimahora=='t'} | <span class="last">ULTIMO MINUTO</span> - <span class="time">{$derecha[dp].hora|date_format:"%I:%M"} {if $derecha[dp].hora|date_format:"%H" > 12}p.m.{elseif $derecha[dp].hora|date_format:"%H"==12}m.{else}a.m.{/if}</span>{/if}</p></div><!--titularventana-->
            <h1><a href="/{$derecha[dp].edicion|date_format:"%Y/%m/%d"}/{$derecha[dp].uri}/{$derecha[dp].idnoticia}-{$derecha[dp].noticia|seo_url}">{$derecha[dp].noticia}</a></h1>
            {if $derecha[dp].video==2}
                <div class="dest_video">
                    <object width="397" height="240">
                        <param name="movie" value="http://www.youtube.com/v/{$derecha[dp].idvideo}"></param>
                        <param name="wmode" value="transparent"></param>
                        <embed src="http://www.youtube.com/v/{$derecha[dp].idvideo}" type="application/x-shockwave-flash" wmode="transparent" width="300" height="240"></embed>
                    </object>
                </div>
            {elseif $derecha[dp].video==1}
            {if $is_mobile}
                <video poster="{if $derecha[dp].cdn=='t'}{$smarty.const.CDN_URL}/video{else}{$smarty.const.CLIPSURL}{/if}/{$derecha[dp].idvideo|substr:0:-4|escape:url|cat:".jpg"}" controls >
                    <source src="{if $derecha[dp].cdn=='t'}{$smarty.const.CDN_URL}/video{else}{$smarty.const.CLIPSURL}{/if}/{$derecha[dp].idvideo}" type="video/mp4" />
                </video>
            {else}
                <div style="float: left; margin-right:10px; margin-bottom:5px;">
                    <a class="flowplayer" style="background-image: url({if $derecha[dp].cdn=='t'}{$smarty.const.CDN_URL}/video{else}{$smarty.const.CLIPSURL}{/if}/{$derecha[dp].idvideo|substr:0:-4|escape:url|cat:".jpg"}); width: 300px; height: 200px;" href="{if $derecha[dp].cdn=='t'}{$smarty.const.CDN_URL}/video{else}{$smarty.const.CLIPSURL}{/if}/{$derecha[dp].idvideo}">
                        <img src="http://media.laprensa.com.ni/play_large.png" alt="videos" width="83" height="83" />
                    </a>
                </div>
            {/if}
            {elseif $derecha[dp].fotogaleria}<img src="{$smarty.const.PIXURL}/{$derecha[dp].fotogaleria.imagen|time_pic:"%Y/%m"}/{if $derecha[dp].presentar=='w'}300x100{else}288x318{/if}_{$derecha[dp].fotogaleria.imagen|escape:url}" {if $derecha[dp].presentar=='w'}width="300"{else}width="150" style="float:left; margin-right:10px; margin-bottom:5px;"{/if} alt="" />{elseif $derecha[dp].imgs}{if $derecha[dp].antetitulo == 'AFP'}<img src="/files/imagen/photo_{$derecha[dp].imgs[0]}" style="float:left; margin-right:10px; margin-bottom:5px;" width="200" alt="" />{else}<img src="{$smarty.const.PIXURL}/{$derecha[dp].imgs[0]|time_pic:"%Y/%m"}/{if $derecha[dp].presentar=='w'}300x100{else}288x318{/if}_{$derecha[dp].imgs[0]|escape:url}" {if $derecha[dp].presentar=='h'} width="150" style="float:left;margin-right:10px; margin-bottom:5px;"{/if} alt="" />{/if}{/if}
            <p>{if $derecha[dp].resumen}{$derecha[dp].resumen|strip_tags|truncate:300}{else}{$derecha[dp].texto|strip_tags|regex_replace:"/[\r\t\n]/":" "|replace:"&nbsp;":" "|regex_replace:"/\s+/":" "|trim|truncate:150:"..."}{/if}</p>
            {if $derecha[dp].rels||$derecha[dp].fotogaleria}
            <div id="relacionadas">
            <br clear="all"/>
            {if $derecha[dp].fotogaleria}<p class="rel_galeria"><a href="#" onclick="openwindow('/gallery.php?id={$derecha[dp].fotogaleria.idgaleria}',640,460);">{$derecha[dp].fotogaleria.galeria}</a></p>{/if}            {section name=rel loop=$derecha[dp].rels}
              <p class="rel_{$derecha[dp].rels[rel].tipo}"><a href="{$derecha[dp].rels[rel].enlace}">{$derecha[dp].rels[rel].relacionado}</a></p>
            {/section}
            </div>
            {/if}
            <div class="puntuacion{if $derecha[dp].comentarios > 0 && $derecha[dp].stars < 1} borde{/if}"><label>Resultado:</label><div class="stars">{section name=j loop=5}{assign var="left" value=$derecha[dp].stars-$smarty.section.j.index}{if $left>0.9}<img src="/imgs/star_full.png" alt="" title="" class="star"/>{elseif $left>0.1&&$left<=0.9}<img src="/imgs/star_waxing.png" alt="" title="" class="star"/>{else}<img src="/imgs/star_empty.png" alt="" title="" class="star"/>{/if}{/section}</div>&nbsp; {$derecha[dp].votos|default:"0"} votos</div>
            {if $derecha[dp].comentarios > 0}<div class="comentario">Comentarios:  <span class="rojo">{$derecha[dp].comentarios}</span></div>{/if}
            <div class="limpiar"></div>
          </div><!--especiales-->
 	   {if !$smarty.section.dp.last}<div class="puntos304"></div>{/if}
          {/section}
        </div><!--centrobloque1-->
        </div><!--bigizqbloque1-->
        {if $banner3_160x600}<div class="banner_flotanteder">{$banner3_160x600}</div>{/if}
        <div id="derbloque1">
        <div class="limpiar"></div>
        <!-- redes sociales  -->
       <div id="redes_sociales">
         {include file="redes_sociales.tpl"}
       </div>
       <div style="text-align:left;margin-right:25px;">
         <!-- <a href="http://www.laprensa.com.ni/clasificados"><img src="/imgs/prensiguialogo.png" border='0' /></a> -->
         <!-- <a href="http://www.laprensa.com.ni/enlaces/landing/" target="_blank"><img src="http://www.laprensa.com.ni/enlaces/cliclogix.png" border="0" /></a> -->
         <a href="#" class="aplicaciones"><img src='/imgs/bannerapps.png' border='0' /></a>
       </div>
<div id="new_video" style="clear:both; text-align:left; margin-left:2px;">
{$smarty.session.tituloseccion}
{include file="videos.tpl"}
</div> 
<div style="clear:both;">
{include file="encuesta.inc.tpl"}
</div>
<!-- suscripciones con feedburner  -->
<div class="feedburner" id="feedburner">
{include file="boletin.tpl"}
</div>  
<!--Cambios en la url de magazine -->          
<div id="magazine"><a {if $suscripcion == true} href="/magazine" {else} {if $pendiente == true} href="/magaccess.php?opt=view" {else} href="/magazine" {/if}{/if}><img src="/imgs/magazine_redesign.png" width="254" height="88" border="0"/></a></div>
          {if $rdomingo}<div id="domingoOthersDay"><a href="/domingo/{$rdomingo.iddomingo}"><img src="/imgs/domingo_redesign.png" width="254" height="64" border="0" alt="La Prensa Domingo" /></a></div>{/if}

{if $banner5_160x600}<div class="baner_alargado">{$banner5_160x600}</div>{/if}
          {*include file="marcador.inc.tpl"*}
          {include file="blogs.inc.tpl"}
          <br clear="all" /> 
          {include file="tags.inc.tpl"}
          {if $masleida||$masenviada}
            <div class="cajaenumerada">
              <div class="ventanas">
                <div class="on"><a href="#">Más leídas</a></div>
                {*<div class="ventana"><a href="#">Más enviadas</a></div>*}
                {*<div class="ventana"><a href="#">Mas comentadas</a></div>*}
              </div><!--ventanas-->
             <div class="cajaenumeradaop">
              <ol>
                {section name=i loop=$masleida}
                <li><p><a href="/{$masleida[i].edicion|date_format:"%Y/%m/%d"}/{$masleida[i].uri}/{$masleida[i].idnoticia}-{$masleida[i].noticia|seo_url}">{$masleida[i].noticia}</a></p></li>
                {/section}
              </ol>
            </div><!--cajaenumerada-->
            </div>
          {/if}
          
          <div id="portadapdf" style="clear:both; margin-top:10px;">
            <div class="izq">
              <div class="titulo">Portada impresa</div>
              <p class="edicion">Edición No {$edicion.numero}{if $edicion.paginas} - {$edicion.paginas} páginas{/if}</p>
              {if $edicion.pdf}
              <div class="imagenpdf"><a href="/files/edicion/{$edicion.pdf}" target="_blank"><img src="/imgs/pdf.png" alt="" /></a></div>
              <div class="botonpdf"><a href="/files/edicion/{$edicion.pdf}" target="_blank">Contenido impreso</a></div>
              {/if}
              <div class="botonpdf"><a href="/suscribirse">Suscr&iacute;birse aqu&iacute;</a></div>
            </div><!--izq-->
            {if $edicion.portada}<div class="der"><a href="/files/edicion/{$edicion.pdf}" target="_blank"><img src="{$smarty.const.PIXURL}/{$edicion.portada|time_pic:"%Y/%m"}/70x110_{$edicion.portada|escape:url}" width="70" height="110" alt="" /></a></div><!--der-->{/if}
            <div class="limpiar"></div>
          </div><!--portadapdf-->
            {if $suplemento}
              <br clear="all" />
              {if $visibleanimado.pagina == '0'}<a href="{$smarty.const.URL}/suple-animado">{else}<a href="/{$suplemento.edicionsuplemento|date_format:"%Y/%m/%d"}/suplemento/{$suplemento.uri}">{/if}<img src="{$smarty.const.PIXURL}/{$suplemento.portadasuplemento|time_pic:"%Y/%m"}/250_{$suplemento.portadasuplemento|escape:url}" alt="" width="250" class="suplemento"/></a>
              <br/><div align="center">{if $banner7_160x600}{$banner7_160x600}{/if}</div>
              <div class="limpiar"></div>
              <br clear="all" />
            {/if}
            {* if $supcomercial *}
             <!--  <a href="/suplementocomercial/{$supcomercial.idsuplementocomercial}"><img src="{$smarty.const.PIXURL}/{$supcomercial.preview|time_pic:"%Y/%m"}/228_{$supcomercial.preview|escape:url}" width="250" /></a> -->
            {* /if *}
          </div><!--derbloque1-->
        <div class="limpiar"></div>
			      </div><!--bloque1-->

