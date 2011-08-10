<?php

function wikiplugin_editorial_help() {
    $help = tra("Exibe uma chamada para o último artigo do tipo editorial");
    $help .= "<br />";
    $help .= tra("~np~{EDITORIAL()}Se tiver algum texto aqui, HTML ou sintaxe wiki ele aparece ao lado do box do editorial{EDITORIAL}~/np~");
    
    return $help;
}

function wikiplugin_editorial($data,$params) {
    global $smarty, $tikilib, $prefs, $tiki_p_read_article;
    
    extract($params,EXTR_SKIP);
    if (($prefs['feature_articles'] !=  'y') || ($tiki_p_read_article != 'y')) {
	// the feature is disabled or the user can't read articles
	return("");
    }

    $type='editorial';

    $list_articles = $tikilib->list_articles(0, 1, 'publishDate_desc', '', $tikilib->now, 'admin', $type, '', 'y', '', '', '', '', '');
    $editorial = $list_articles['data'][0];
    $editorial['parsed_heading'] = $tikilib->parse_data($editorial['heading']);
    
    $destaque = $tikilib->parse_data($data);

    $smarty->assign('editorial', $editorial);
    $smarty->assign('destaque', $destaque);
    return "~np~ ".$smarty->fetch('pe-view_editorial.tpl')." ~/np~";
}
?>
