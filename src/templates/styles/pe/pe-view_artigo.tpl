<div class="box_artigos box_home">
	<a href="tiki-view_articles.php?type=Artigo">
		<img src="styles/pe/artigos.gif" border="0">
	</a>
	<div id="conteudo">
		<div class="articletitle">
			<span class="titlea"><a href="tiki-read_article.php?articleId={$artigo.articleId}">{$artigo.title|truncate:58}</a></span><br />
			<span class="titleb">
			{$artigo.publishDate|tiki_short_date}&nbsp;
			({$artigo.nbreads} {tr}Reads{/tr})
			</span><br />
		</div>
		<div class="articleheading">
			<div class="articleheadingtext">
                                {$artigo.parsed_heading|truncate:110}
                        </div>
                </div>
	</div>
</div>
