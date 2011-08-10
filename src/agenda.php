<?php

/*
 * script inspirado no webcalendar/upcoming.php do webcalendar, escrevi um proprio
 * para ter maior controle
 */

include_once('tiki-setup.php');
include_once('webcalendar/includes/config.php');
include_once('webcalendar/includes/php-dbi.php');
include_once('webcalendar/includes/functions.php');
include_once('webcalendar/includes/connect.php');

if ($_REQUEST["id"] != '') {
    $id = $_REQUEST['id'];
    $sql = "SELECT * FROM webcal_entry WHERE cal_id = $id";
    $res = dbi_query($sql);
    $evento = dbi_fetch_row($res);
    $evento['cal_date'] = preg_replace('/(\d{4})(\d{2})(\d{2})/', '$3/$2/$1', $evento['cal_date']);
    $evento['cal_time'] = preg_replace('/(\d{2})(\d{2})\d{2}/', '$1:$2', $evento['cal_time']);
    $h = explode(":",$evento['cal_time']);
    $h[0] = $h[0] + (integer) ($evento['cal_duration'] / 60);
    $h[1] = $h[1] + ($evento['cal_duration'] % 60);
    $h[1] = (strlen($h[1]) == 1) ? '0' . $h[1] : $h[1];
    $evento['cal_time_end'] = "$h[0]:$h[1]";
    
    $smarty->assign('evento', $evento);
    $smarty->assign('mid', 'evento.tpl');
    $smarty->display('tiki.tpl');
} else {
    load_global_settings();
    // Change this to false if you still want to access this page even
    // though you do not have public access enabled.
    $public_must_be_enabled = true;

    // Do we include a link to view the event?  If so, what target
    // should we use.
    $display_link = true;
    $link_target = '_blank';

    // Default time window of events to load
    // Can override with "upcoming.php?days=60"
    $numDays = 720;

    // Max number of events to display
    if (isset($_REQUEST['maxEvents'])) {
	$maxEvents = $_REQUEST['maxEvents'];
    } else {
	$maxEvents = 5;
    }

    // Login of calendar user to use
    // '__public__' is the login name for the public user
    $username = '__public__';

    // Allow the URL to override the user setting such as
    // "upcoming.php?user=craig"
    $allow_user_override = false;

    // Load layers
    $load_layers = true;

    // Load just a specified category (by its id)
    // Leave blank to not filter on category (unless specified in URL)
    // Can override in URL with "upcoming.php?cat_id=4"
    $cat_id = '';

    // End configurable settings...

    // Set for use elsewhere as a global
    $login = $username;
    // Load user preferences for DISPLAY_UNAPPROVED
    load_user_preferences();
    $get_unapproved = ! empty ( $DISPLAY_UNAPPROVED ) && $DISPLAY_UNAPPROVED == 'Y';

    include "webcalendar/includes/translate.php";

    if ( $allow_user_override ) {
        $u = getValue ( "user", "[A-Za-z0-9_\.=@,\-]+", true );
        if ( ! empty ( $u ) ) {
            $username = $u;
            $login = $u;
            // We also set $login since some functions assume that it is set.
        }
    }

    $cat_id = '';
    if ( $categories_enabled == 'Y' ) {
        $x = getIntValue ( "cat_id", true );
        if ( ! empty ( $x ) ) {
            $cat_id = $x;
        }
    }

    if ( $load_layers ) {
        load_user_layers ( $username );
    }

    // Calculate date range
    $date = getIntValue ( "date", true );
    if ( empty ( $date ) || strlen ( $date ) != 8 ) {
        // If no date specified, start with today
        $date = date ( "Ymd" );
    }
    $thisyear = substr ( $date, 0, 4 );
    $thismonth = substr ( $date, 4, 2 );
    $thisday = substr ( $date, 6, 2 );

    $startTime = mktime ( 3, 0, 0, $thismonth, $thisday, $thisyear );

    $x = getIntValue ( "days", true );
    if ( ! empty ( $x ) ) {
        $numDays = $x;
    }
    // Don't let a malicious user specify more than 365 days
    if ( $numDays > 365 ) {
        $numDays = 365;
    }
    $endTime = mktime ( 3, 0, 0, $thismonth, $thisday + $numDays, $thisyear );
    $endDate = date ( "Ymd", $endTime );

    /* Pre-Load the repeated events for quckier access */
    $repeated_events = read_repeated_events ( $username, $cat_id, $date );

    /* Pre-load the non-repeating events for quicker access */
    $events = read_events ( $username, $date, $endDate, $cat_id );

    $numEvents = 0;
    $days = array();
    for ($i = $startTime, $j = 0; date("Ymd", $i) <= date("Ymd", $endTime) && $numEvents < $maxEvents; $i += (24 * 3600), $j++) {
	$d = date("Ymd", $i);
	$days[$j] = array();
	$days[$j]['day'] = date("d/m/Y", $i);
	$days[$j]['entries'] = get_entries($username, $d, $get_unapproved);
	$days[$j]['rentries'] = get_repeating_entries($username, $d, $get_unapproved);
    }

    $smarty->assign('days', $days);
    $smarty->assign('mid', 'agenda.tpl');
    $smarty->display('tiki.tpl');
                                                                              }

?>
