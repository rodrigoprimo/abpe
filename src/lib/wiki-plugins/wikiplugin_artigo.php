<?php

function wikiplugin_artigo_help() {
    $help = tra("Exibe uma chamada para o último artigo");
    $help .= "<br />";
    $help .= tra("~np~{ARTIGO()}{ARTIGO}~/np~");
    
    return $help;
}

function wikiplugin_artigo($data,$params) {
    global $smarty, $tikilib, $prefs, $tiki_p_read_article;
    global $artlib; require_once('lib/articles/artlib.php');
    
    extract($params,EXTR_SKIP);
    if (($prefs['feature_articles'] !=  'y') || ($tiki_p_read_article != 'y')) {
	// the feature is disabled or the user can't read articles
	return("");
    }

    $type='artigo';

    $list_articles = $artlib->list_articles(0, 1, 'publishDate_desc', '', 0, $tikilib->now, false, $type, '', 'y',
    	'', '', '', '', '', '', '', false, 'y');
    $artigo = $list_articles['data'][0];

    $smarty->assign('artigo', $artigo);
    return "~np~ ".$smarty->fetch('pe-view_artigo.tpl')." ~/np~";
}
?>
