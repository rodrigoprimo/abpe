<?php

$caminho = preg_replace('/^\/(\w+\/)?/', '', $url);

if (!preg_match('/tiki-read_article\.php/', $caminho)) {
	if (preg_match('/tiki-index\.php\?page\=(.*)/', $caminho, $matches)) {
		$smarty->assign('nomepagina', $matches[1]);
	} else if (preg_match('/tiki-view_articles\.php\?type\=(.*)/', $caminho, $matches)) {
		$smarty->assign('nomepagina', $matches[1]);
	} else if (preg_match('/tiki-view_blog.php/', $caminho) || preg_match('/tiki-view_blog_post.php/', $caminho)) {
		$smarty->assign('nomepagina', 'blog');
	} else if (preg_match('/tiki-forums.php/', $caminho) || preg_match('/tiki-view_forum.php/', $caminho) || preg_match('/tiki-view_forum_thread.php/', $caminho)) {
		$smarty->assign('nomepagina', 'forum');
	} else {
		$smarty->assign('nomepagina', $caminho);
	}
}
?>
