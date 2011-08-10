
<div class="box_noticias">
	<a href="tiki-view_articles.php?type=Notícia">
    	<img src="styles/pe/noticias.gif" border="0">
    </a>
	<div id="conteudo">
	  {foreach from=$items item=noticia}
	    {$noticia.publishDate|date_format:"%d/%m"} <a href="tiki-read_article.php?articleId={$noticia.articleId}">{$noticia.title}</a><br />
	  {/foreach}
	</div>
</div>
