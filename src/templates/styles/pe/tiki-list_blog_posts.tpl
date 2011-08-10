<div class="box_blog">
	<a href="tiki-view_blog.php?blogId={$blog.blogId}">
    	   <img src="styles/pe/blog.gif" border=0 >
	</a>
	<div id="conteudo">
  {foreach from=$posts item=post}
    {$post.created|tiki_date_format:"%m/%d"} <a href="tiki-view_blog_post.php?blogId={$post.blogId}&postId={$post.postId}">{$post.title|truncate:27}</a><br />
  {/foreach}
	</div>
</div>
