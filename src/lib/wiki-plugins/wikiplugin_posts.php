<?php

require_once('lib/rss/rsslib.php');

function wikiplugin_posts_help() {
        $help = tra("Includes blog posts listing into a wiki page");
        $help .= "<br />";
        $help .= tra("~np~{POSTS(max=>5, rssId=>id)}{POSTS}~/np~");

        return $help;
}

function wikiplugin_posts($data, $params) {
	global $smarty, $prefs, $tikilib;

	if (isset($params['rssId'])) {
		$rssId = $params['rssId'];
	} else {
		return tra('rssId is mandatory');
	}
	
	$rsslib = new RssLib;
		
	$max = isset($params['max']) ? $params['max'] : 5;
	
	$blog = $rsslib->get_rss_module($rssId);
	$items = $rsslib->get_feed_items($rssId, $max);

	$smarty->assign('blog', $blog);
	$smarty->assign('posts', $items);
	return "~np~ ".$smarty->fetch('pe-rss_posts.tpl')." ~/np~";
}
?>
