<?php

require_once('lib/wiki-plugins/wikiplugin_flash.php');

function wikiplugin_video_help() {
	return wikiplugin_flash_info();
}

function wikiplugin_video($data, $params) {
	global $artlib, $tikilib;
	
	$list_articles = $artlib->list_articles(0, 1, 'publishDate_desc', '', 0, $tikilib->now, false, 'video', '', 'y');
	$article = $list_articles['data'][0];
	
	$plugins = array();
	$tikilib->plugin_match($article['body'], $plugins);
	
	$pluginName = strtolower($plugins[1]);
	
	if ($pluginName !== 'vimeo' && $pluginName !== 'youtube') {
		return "ERRO: não foi possível encontrar o plugin com o vídeo do Vimeo ou Youtube. Isso significa que ele não está presente ou que ele não é o primeiro plugin no corpo do objeto.";
	}
	
	$params = $plugins['arguments'];
	
	if (isset($params['movie']) && !isset($params['url'])) {
		$params['url'] = $params['movie'];
	}
	
	if (!$params['url']) {
		return "ERRO: não foi possível encontrar o parâmetro obrigatório 'url' no plugin com o vídeo.";
	}
	
	$params['height'] = 200;
	$params['width'] = 284;	
	
	if ($pluginName == 'vimeo') {
		$params['vimeo'] = $params['url'];
	}
	
	if ($pluginName == 'youtube') {
		$params['youtube'] = $params['url'];
	}
	
	return '<div class="box_video box_home"><a href="video"><img border="0" src="styles/pe/video.gif"></a>' . wikiplugin_flash($data, $params) . '</div>';
}

?>
