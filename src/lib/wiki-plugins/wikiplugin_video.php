<?php

require_once('lib/wiki-plugins/wikiplugin_flash.php');

function wikiplugin_video_help() {
	return wikiplugin_flash_info();
}

function wikiplugin_video($data, $params) {
	$params['height'] = 200;
	$params['width'] = 284;	
	
	if ($params['type'] == 'vimeo') {
		$params['vimeo'] = $params['url'];
	}
	
	if ($params['type'] == 'youtube') {
		$params['youtube'] = $params['url'];
	}
	
	return '<div class="box_video box_home"><img border="0" src="styles/pe/video.gif">' . wikiplugin_flash($data, $params) . '</div>';
}

?>
