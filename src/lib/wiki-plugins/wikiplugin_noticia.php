<?php

function wikiplugin_noticia_help() {
    $help = tra("Lista as últimas notícias ou artigos publicados no site");
    $help .= "<br />";
    $help .= tra("~np~{NOTICIA()}{NOTICIA}~/np~");
    
    return $help;
}

function wikiplugin_noticia($data,$params) {
    global $smarty, $tikilib, $prefs, $tiki_p_read_article;
    global $artlib; require_once('lib/articles/artlib.php');
    
    extract($params,EXTR_SKIP);
    if (($prefs['feature_articles'] !=  'y') || ($tiki_p_read_article != 'y')) {
	// the feature is disabled or the user can't read articles
	return("");
    }

    $tipo = 'noticia';

    //TODO: verificar se nao tem uma funcao que pega soh o titulo, a data e o id dos artigos para nao precisar pegar tudo
    $list_articles = $artlib->list_articles(0, 3, 'publishDate_desc', '', 0, $tikilib->now, false, $tipo, '', 'y',
    	'', '', '', '', '', '', '', false, 'y');
    $items = $list_articles['data'];
    $i = 0;
    foreach ($items as $item) {
	$items[$i]['parsed_heading'] = $tikilib->parse_data($item['heading']);
	$i++;
    }
    $smarty->assign('items', $items);
    return "~np~ ".$smarty->fetch('pe-view_noticias.tpl')." ~/np~";

}
?>
