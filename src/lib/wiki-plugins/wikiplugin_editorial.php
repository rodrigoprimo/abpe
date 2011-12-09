<?php

function wikiplugin_editorial_help() {
    $help = tra("Exibe uma chamada para o último artigo do tipo editorial");
    $help .= "<br />";
    $help .= tra("~np~{EDITORIAL()}Se tiver algum texto aqui, HTML ou sintaxe wiki ele aparece ao lado do box do editorial{EDITORIAL}~/np~");
    
    return $help;
}

function wikiplugin_editorial($data,$params) {
    global $smarty, $tikilib, $prefs, $tiki_p_read_article;
    global $artlib; require_once('lib/articles/artlib.php');
    
    extract($params,EXTR_SKIP);
    if (($prefs['feature_articles'] !=  'y') || ($tiki_p_read_article != 'y')) {
	// the feature is disabled or the user can't read articles
	return("");
    }

    $type='editorial';

    $list_articles = $artlib->list_articles(0, 1, 'publishDate_desc', '', 0, $tikilib->now, false, $type, '', 'y');
    $editorial = $list_articles['data'][0];
    $editorial['parsed_heading'] = $tikilib->parse_data($editorial['heading']);
    
    if (isset($params['destaque'])) {
    	$destaque = $tikilib->parse_data($params['destaque']);
    }
    
    if (isset($params['largura'])) {
    	$smarty->assign('largura', $params['largura']);
    }

    $smarty->assign('editorial', $editorial);
    $smarty->assign('destaque', $destaque);
    return "~np~ ".$smarty->fetch('pe-view_editorial.tpl')." ~/np~";
}
?>
