<?php

$caminho = preg_replace('/^\/(\w+\/)?/', '', $url);

if (!preg_match('/tiki-read_article\.php/', $caminho)) {
	if (preg_match('/tiki-index\.php\?page\=(.*)/', $caminho, $matches)) {
		$nomepagina = $matches[1];
	} else if (preg_match('/tiki-view_articles\.php\?type\=(.*)/', $caminho, $matches)) {
		$nomepagina = $matches[1];
	} else {
		$nomepagina = $caminho;
	}
}

$filepath = "styles/pe/logos/$nomepagina.png";

if (file_exists($filepath)) {
	$imagemLogoTopo = "$nomepagina.png";
} else {
	$imagemLogoTopo = 'logo.jpg';
}

$smarty->assign('nomepagina', $nomepagina);
$smarty->assign('imagemLogoTopo', $imagemLogoTopo);
?>
