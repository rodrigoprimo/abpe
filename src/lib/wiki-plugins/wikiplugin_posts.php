<?php

function wikiplugin_posts_help() {
        $help = tra("Includes blog posts listing into a wiki page");
        $help .= "<br />";
        $help .= tra("~np~{POSTS(max=>5, blogId=>id)}{POSTS}~/np~");

        return $help;
}

function wikiplugin_posts($data,$params) {
	global $smarty, $prefs, $tiki_p_read_blog, $tikilib;
	global $bloglib; require_once('lib/blogs/bloglib.php');
	
	extract($params,EXTR_SKIP);
	if (($prefs['feature_blogs'] !=  'y') || ($tiki_p_read_blog != 'y')) {
		// the feature is disabled or the user can't read blogs
		return('');
	}
	if (!isset($blogId)) {
	    return tra('blogId is mandatory');
	}
	if (!isset($max))
	    $max='5';

	$blog = $bloglib->get_blog($blogId);
        if (is_object($bloglib)) {
            $posts = $bloglib->list_blog_posts($blogId, false, 0, $max);
        }
	$smarty->assign('blog', $blog);
	$smarty->assign('posts', $posts['data']);
	return "~np~ ".$smarty->fetch('tiki-list_blog_posts.tpl')." ~/np~";
}
?>
