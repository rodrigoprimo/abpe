insert into tiki_preferences values ('log_sql', 'n') on duplicate key update value = 'n';
delete from adodb_logsql;

insert into tiki_preferences values ('change_language', 'y') on duplicate key update value = 'y';
insert into tiki_preferences values ('feature_sitemycode', 'n') on duplicate key update value = 'n';
insert into tiki_preferences values ('feature_sitelogo', 'n') on duplicate key update value = 'n';
insert into tiki_preferences values ('feature_site_login', 'n') on duplicate key update value = 'n';
insert into tiki_preferences values ('feature_tell_a_friend', 'n') on duplicate key update value = 'n';
insert into tiki_preferences values ('wikiplugin_banner' ,'y') on duplicate key update value = 'y';

insert into tiki_preferences values ('feature_sitemycode' ,'y') on duplicate key update value = 'y';
insert into tiki_preferences values ('sitemycode','{include file=\'pe-top_bar.tpl\'}\r\n') on duplicate key update value = '{include file=\'pe-top_bar.tpl\'}\r\n';
insert into tiki_preferences values ('sitemycode_publish' ,'y') on duplicate key update value = 'y';

insert into tiki_preferences values ('feature_sitesearch', 'n') on duplicate key update value = 'n';
insert into tiki_preferences values ('feature_bot_bar', 'y') on duplicate key update value = 'y';
insert into tiki_preferences values ('feature_top_bar', 'n') on duplicate key update value = 'n';
insert into tiki_preferences values ('site_title_location', 'before') on duplicate key update value = 'before';

insert into tiki_preferences values ('feature_search', 'y') on duplicate key update value = 'y';
insert into tiki_preferences values ('feature_search_fulltext', 'y') on duplicate key update value = 'y';

delete from tiki_menu_options where optionId = 190 and name = 'Agenda';
delete from tiki_menu_options where optionId = 193 and name = 'Fórum';
delete from tiki_menu_options where optionId = 192 and name = 'Blog da ABPE';

insert into tiki_preferences values ('feature_forums', 'n') on duplicate key update value = 'n';
insert into tiki_preferences values ('feature_blogs', 'n') on duplicate key update value = 'n';

delete from `tiki_user_modules` where name = 'Menu_lateral';
insert into `tiki_user_modules` (`name`,`title`,`data`, `parse`) VALUES ('Menu_lateral','Menu','{menu id=43}\r\n{if $user}\r\n  <div id=\"icone0\" class=\"option icone\">\r\n    <a class=\"linkmenu\" href=\"tiki-logout.php\">Sair</a>\r\n  </div>\r\n{else}\r\n  <div id=\"icone0\" class=\"option icone\">\r\n    <a class=\"linkmenu\" href=\"tiki-login.php\">Entrar</a>\r\n  </div>\r\n{/if}\r\n\r\n<center><a href=\"tiki-index.php?page=abpezinha\"><img src=\"styles/pe/ABPE_abpezinha.jpg\" alt=\"ABPEzinha\" title=\"ABPEzinha\" style=\"border:0px solid;\"></a><center>',NULL);
