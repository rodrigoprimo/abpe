<?php

function wikiplugin_agenda_help() {
    $help = tra('Exibe uma listagem dos próximos eventos da agenda');
    $help .= '<br />';
    $help .= tra('~np~{AGENDA()}{AGENDA}~/np~');
    
    return $help;
}

function wikiplugin_agenda($data,$params) {
    global $smarty;
    // gambi para descobrir a URL. deve ter um jeito melhor de pegar a saida do webcalendar/upcoming.php
    if (preg_match('/\/tiki-index\.php/', $_SERVER['SCRIPT_NAME'])) {
	$url = 'http://' . $_SERVER['SERVER_NAME'] . preg_replace('/\/tiki-index\.php/', '', $_SERVER['SCRIPT_NAME']) . '/webcalendar/upcoming.php';
    } else if (preg_match('/\/tiki-editpage\.php/', $_SERVER['SCRIPT_NAME'])) {
	$url = 'http://' . $_SERVER['SERVER_NAME'] . preg_replace('/\/tiki-editpage\.php/', '', $_SERVER['SCRIPT_NAME']) . '/webcalendar/upcoming.php';
    }
    $eventos = file_get_contents($url);
    $smarty->assign('eventos', $eventos);
    return "~np~ ".$smarty->fetch('pe-view_agenda.tpl')." ~/np~";
}
?>
