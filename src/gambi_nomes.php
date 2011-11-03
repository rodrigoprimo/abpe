<?php

$caminho = preg_replace('/^\/(\w+\/)?/', '', $url);

if (!preg_match('/tiki-read_article\.php/', $caminho)) {
	if (preg_match('/tiki-index\.php\?page\=(.*)/', $caminho, $matches)) {
		$smarty->assign('nomepagina', $matches[1]);
	} else if (preg_match('/tiki-view_articles\.php\?type\=(.*)/', $caminho, $matches)) {
		$smarty->assign('nomepagina', $matches[1]);
	} else {
		$smarty->assign('nomepagina', $caminho);
	}
}
?>
