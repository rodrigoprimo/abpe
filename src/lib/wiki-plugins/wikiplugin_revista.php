<?php

function wikiplugin_revista_help() {
    $help = tra("Exibe uma chamada para o último artigo do tipo revista");
    $help .= "<br />";
    $help .= tra("~np~{REVISTA()}{REVISTA}~/np~");
    
    return $help;
}

function wikiplugin_revista($data,$params) {
    global $smarty, $tikilib, $prefs, $tiki_p_read_article;
    
    extract($params,EXTR_SKIP);
    if (($prefs['feature_articles'] !=  'y') || ($tiki_p_read_article != 'y')) {
	// the feature is disabled or the user can't read articles
	return("");
    }

    $type='revista';

    $list_articles = $tikilib->list_articles(0, 1, 'publishDate_desc', '', $tikilib->now, 'admin', $type, '', 'y', '', '', '', '', '');
    $revista = $list_articles['data'][0];
    $revista['parsed_heading'] = $tikilib->parse_data($revista['heading']);
    
    $smarty->assign('revista', $revista);
    return "~np~ ".$smarty->fetch('pe-view_revista.tpl')." ~/np~";
}
?>
