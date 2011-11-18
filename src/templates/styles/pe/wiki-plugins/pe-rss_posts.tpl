<div class="box_blog">
	<a href="{$blog.siteurl}">
		<img src="styles/pe/blog.gif" border=0 >
	</a>
	<div id="conteudo">
		{foreach from=$posts item=post}
			{$post.publication_date|tiki_date_format:"%m/%d"} <a href="{$post.url}" target="_blank">{$post.title|truncate:27}</a><br />
		{/foreach}
	</div>
</div>
