
<div class="box_noticias box_home">
	<a href="tiki-view_articles.php?type=Notícia">
    	<img src="styles/pe/noticias.gif" border="0">
    </a>
	<div id="conteudo">
		{foreach from=$items item=noticia}
			<div class="articletitle">
				<span class="titlea"><a href="tiki-read_article.php?articleId={$noticia.articleId}">{$noticia.title|truncate:58}</a></span><br />
				<div style="padding-top: 6px;>
					<span class="titleb">
						{$noticia.publishDate|tiki_short_date}&nbsp;
						({$noticia.nbreads} {tr}Reads{/tr})
					</span>
				</div>
				<br />
			</div>
		{/foreach}
	</div>
</div>
