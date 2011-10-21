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

insert into tiki_preferences values ('feature_sitesearch', 'n') on duplicate key update value = 'n';
insert into tiki_preferences values ('feature_bot_bar', 'y') on duplicate key update value = 'y';
insert into tiki_preferences values ('feature_top_bar', 'n') on duplicate key update value = 'n';

