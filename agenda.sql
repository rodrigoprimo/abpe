-- MySQL dump 10.11
--
-- Host: localhost    Database: webcalendar_abpe
-- ------------------------------------------------------
-- Server version	5.0.32-Debian_7etch5-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `webcal_asst`
--

DROP TABLE IF EXISTS `webcal_asst`;
CREATE TABLE `webcal_asst` (
  `cal_boss` varchar(25) NOT NULL,
  `cal_assistant` varchar(25) NOT NULL,
  PRIMARY KEY  (`cal_boss`,`cal_assistant`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `webcal_asst`
--

LOCK TABLES `webcal_asst` WRITE;
/*!40000 ALTER TABLE `webcal_asst` DISABLE KEYS */;
/*!40000 ALTER TABLE `webcal_asst` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `webcal_categories`
--

DROP TABLE IF EXISTS `webcal_categories`;
CREATE TABLE `webcal_categories` (
  `cat_id` int(11) NOT NULL,
  `cat_owner` varchar(25) default NULL,
  `cat_name` varchar(80) NOT NULL,
  PRIMARY KEY  (`cat_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `webcal_categories`
--

LOCK TABLES `webcal_categories` WRITE;
/*!40000 ALTER TABLE `webcal_categories` DISABLE KEYS */;
/*!40000 ALTER TABLE `webcal_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `webcal_config`
--

DROP TABLE IF EXISTS `webcal_config`;
CREATE TABLE `webcal_config` (
  `cal_setting` varchar(50) NOT NULL,
  `cal_value` varchar(100) default NULL,
  PRIMARY KEY  (`cal_setting`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `webcal_config`
--

LOCK TABLES `webcal_config` WRITE;
/*!40000 ALTER TABLE `webcal_config` DISABLE KEYS */;
INSERT INTO `webcal_config` VALUES ('LANGUAGE','Portuguese_BR'),('demo_mode','N'),('require_approvals','Y'),('groups_enabled','N'),('user_sees_only_his_groups','N'),('categories_enabled','N'),('allow_conflicts','N'),('conflict_repeat_months','6'),('disable_priority_field','N'),('disable_access_field','N'),('disable_participants_field','N'),('disable_repeating_field','N'),('allow_view_other','Y'),('email_fallback_from','youremailhere'),('remember_last_login','Y'),('allow_color_customization','Y'),('BGCOLOR','#FFFFFF'),('TEXTCOLOR','#000000'),('H2COLOR','#000000'),('CELLBG','#C0C0C0'),('WEEKENDBG','#D0D0D0'),('TABLEBG','#000000'),('THBG','#FFFFFF'),('THFG','#000000'),('POPUP_FG','#000000'),('POPUP_BG','#FFFFFF'),('TODAYCELLBG','#FFFF33'),('STARTVIEW','month.php'),('WEEK_START','0'),('TIME_FORMAT','24'),('DISPLAY_UNAPPROVED','Y'),('DISPLAY_WEEKNUMBER','Y'),('WORK_DAY_START_HOUR','8'),('WORK_DAY_END_HOUR','23'),('send_email','N'),('EMAIL_REMINDER','Y'),('EMAIL_EVENT_ADDED','Y'),('EMAIL_EVENT_UPDATED','Y'),('EMAIL_EVENT_DELETED','Y'),('EMAIL_EVENT_REJECTED','Y'),('auto_refresh','N'),('nonuser_enabled','N'),('allow_html_description','N'),('reports_enabled','N'),('DISPLAY_WEEKENDS','Y'),('DISPLAY_DESC_PRINT_DAY','N'),('DATE_FORMAT','__dd__ __month__, __yyyy__'),('TIME_SLOTS','24'),('TIMED_EVT_LEN','D'),('PUBLISH_ENABLED','N'),('DATE_FORMAT_MY','__month__ __yyyy__'),('DATE_FORMAT_MD','__dd__/__mm__'),('CUSTOM_SCRIPT','N'),('CUSTOM_HEADER','N'),('CUSTOM_TRAILER','N'),('bold_days_in_year','Y'),('site_extras_in_popup','N'),('add_link_in_views','Y'),('allow_conflict_override','Y'),('limit_appts','N'),('limit_appts_number','6'),('public_access','Y'),('public_access_default_visible','Y'),('public_access_default_selected','Y'),('public_access_others','N'),('public_access_can_add','N'),('public_access_add_needs_approval','N'),('public_access_view_part','N'),('nonuser_at_top','Y'),('allow_external_users','N'),('external_notifications','N'),('external_reminders','N'),('enable_gradients','N'),('application_name','Calendário da Associação Brasileira de Pedagogia Espírita'),('server_url','http://localhost/pe/agenda/'),('FONTS','Arial, Helvetica, sans-serif'),('auto_refresh_time','0');
/*!40000 ALTER TABLE `webcal_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `webcal_entry`
--

DROP TABLE IF EXISTS `webcal_entry`;
CREATE TABLE `webcal_entry` (
  `cal_id` int(11) NOT NULL,
  `cal_group_id` int(11) default NULL,
  `cal_ext_for_id` int(11) default NULL,
  `cal_create_by` varchar(25) NOT NULL,
  `cal_date` int(11) NOT NULL,
  `cal_time` int(11) default NULL,
  `cal_mod_date` int(11) default NULL,
  `cal_mod_time` int(11) default NULL,
  `cal_duration` int(11) NOT NULL,
  `cal_priority` int(11) default '2',
  `cal_type` char(1) default 'E',
  `cal_access` char(1) default 'P',
  `cal_name` varchar(80) NOT NULL,
  `cal_description` text,
  PRIMARY KEY  (`cal_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `webcal_entry`
--

LOCK TABLES `webcal_entry` WRITE;
/*!40000 ALTER TABLE `webcal_entry` DISABLE KEYS */;
INSERT INTO `webcal_entry` VALUES (1,NULL,NULL,'admin',20080717,160000,20080709,103553,60,2,'E','P','novo evento','lalala'),(2,NULL,NULL,'admin',20080717,-1,20080709,103650,0,2,'E','P','teste','lalaal'),(3,NULL,NULL,'admin',20080718,160000,20080915,164049,180,2,'M','P','Teste com repetiÃ§Ã£o de evento','lalala'),(4,NULL,NULL,'admin',20080826,-1,20080822,222153,0,2,'E','P','Novo evento qualquer','qualquer evento'),(5,NULL,NULL,'admin',20080827,-1,20080822,222208,0,2,'E','P','Acentuação','um evento com acentuação'),(6,NULL,NULL,'admin',20080826,-1,20080822,222300,0,2,'E','P','Acentuação','evento para testar acentuação'),(7,NULL,NULL,'admin',20080827,-1,20080822,222317,0,2,'E','P','Mais um evento para testar','Mais um evento para testar'),(8,NULL,NULL,'admin',20081107,-1,20080908,152302,0,2,'M','P','Congresso Brasileiro de Pedagogia Espírita','UNI ÍTALO\r\nAv. João Dias, 2046\r\nSanto Amaro - SP\r\n'),(9,NULL,NULL,'admin',20081111,-1,20080909,80124,0,2,'E','P','Mais um teste','qualquer descrição'),(10,NULL,NULL,'admin',20081003,100000,20080908,152603,120,2,'E','P','Dois eventos distintos no mesmo dia','Dois eventos distintos no mesmo dia'),(11,NULL,NULL,'admin',20081110,-1,20080915,164931,0,2,'E','P','Acento Ã¡ Ã© I Ã','laal');
/*!40000 ALTER TABLE `webcal_entry` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `webcal_entry_ext_user`
--

DROP TABLE IF EXISTS `webcal_entry_ext_user`;
CREATE TABLE `webcal_entry_ext_user` (
  `cal_id` int(11) NOT NULL default '0',
  `cal_fullname` varchar(50) NOT NULL,
  `cal_email` varchar(75) default NULL,
  PRIMARY KEY  (`cal_id`,`cal_fullname`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `webcal_entry_ext_user`
--

LOCK TABLES `webcal_entry_ext_user` WRITE;
/*!40000 ALTER TABLE `webcal_entry_ext_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `webcal_entry_ext_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `webcal_entry_log`
--

DROP TABLE IF EXISTS `webcal_entry_log`;
CREATE TABLE `webcal_entry_log` (
  `cal_log_id` int(11) NOT NULL,
  `cal_entry_id` int(11) NOT NULL,
  `cal_login` varchar(25) NOT NULL,
  `cal_user_cal` varchar(25) default NULL,
  `cal_type` char(1) NOT NULL,
  `cal_date` int(11) NOT NULL,
  `cal_time` int(11) default NULL,
  `cal_text` text,
  PRIMARY KEY  (`cal_log_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `webcal_entry_log`
--

LOCK TABLES `webcal_entry_log` WRITE;
/*!40000 ALTER TABLE `webcal_entry_log` DISABLE KEYS */;
INSERT INTO `webcal_entry_log` VALUES (1,1,'admin','admin','C',20080709,103506,NULL),(2,1,'admin','admin','U',20080709,103553,NULL),(3,2,'admin','admin','C',20080709,103650,NULL),(4,3,'admin','admin','C',20080709,104509,NULL),(5,4,'admin','admin','C',20080822,222153,NULL),(6,5,'admin','admin','C',20080822,222208,NULL),(7,6,'admin','admin','C',20080822,222300,NULL),(8,7,'admin','admin','C',20080822,222317,NULL),(9,3,'admin','admin','U',20080908,151308,NULL),(10,8,'admin','admin','C',20080908,152215,NULL),(11,8,'admin','admin','U',20080908,152244,NULL),(12,8,'admin','admin','U',20080908,152302,NULL),(13,9,'admin','admin','C',20080908,152523,NULL),(14,10,'admin','admin','C',20080908,152603,NULL),(15,9,'admin','admin','U',20080909,75833,NULL),(16,9,'admin','admin','U',20080909,80124,NULL),(17,3,'admin','admin','U',20080915,164049,NULL),(18,8,'admin','__public__','A',20080915,164113,NULL),(19,3,'admin','__public__','D',20080915,164505,NULL),(20,11,'admin','admin','C',20080915,164917,NULL),(21,11,'admin','admin','U',20080915,164931,NULL),(22,11,'admin','__public__','D',20080915,165056,NULL);
/*!40000 ALTER TABLE `webcal_entry_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `webcal_entry_repeats`
--

DROP TABLE IF EXISTS `webcal_entry_repeats`;
CREATE TABLE `webcal_entry_repeats` (
  `cal_id` int(11) NOT NULL default '0',
  `cal_type` varchar(20) default NULL,
  `cal_end` int(11) default NULL,
  `cal_frequency` int(11) default '1',
  `cal_days` char(7) default NULL,
  PRIMARY KEY  (`cal_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `webcal_entry_repeats`
--

LOCK TABLES `webcal_entry_repeats` WRITE;
/*!40000 ALTER TABLE `webcal_entry_repeats` DISABLE KEYS */;
INSERT INTO `webcal_entry_repeats` VALUES (3,'weekly',20081030,1,'nnnnnyn'),(8,'daily',20081109,1,'nnnnnnn');
/*!40000 ALTER TABLE `webcal_entry_repeats` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `webcal_entry_repeats_not`
--

DROP TABLE IF EXISTS `webcal_entry_repeats_not`;
CREATE TABLE `webcal_entry_repeats_not` (
  `cal_id` int(11) NOT NULL,
  `cal_date` int(11) NOT NULL,
  PRIMARY KEY  (`cal_id`,`cal_date`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `webcal_entry_repeats_not`
--

LOCK TABLES `webcal_entry_repeats_not` WRITE;
/*!40000 ALTER TABLE `webcal_entry_repeats_not` DISABLE KEYS */;
/*!40000 ALTER TABLE `webcal_entry_repeats_not` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `webcal_entry_user`
--

DROP TABLE IF EXISTS `webcal_entry_user`;
CREATE TABLE `webcal_entry_user` (
  `cal_id` int(11) NOT NULL default '0',
  `cal_login` varchar(25) NOT NULL,
  `cal_status` char(1) default 'A',
  `cal_category` int(11) default NULL,
  PRIMARY KEY  (`cal_id`,`cal_login`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `webcal_entry_user`
--

LOCK TABLES `webcal_entry_user` WRITE;
/*!40000 ALTER TABLE `webcal_entry_user` DISABLE KEYS */;
INSERT INTO `webcal_entry_user` VALUES (1,'admin','D',NULL),(2,'__public__','A',NULL),(2,'admin','A',NULL),(3,'__public__','D',NULL),(4,'admin','A',NULL),(5,'admin','A',NULL),(6,'__public__','A',NULL),(6,'admin','A',NULL),(7,'__public__','A',NULL),(7,'admin','A',NULL),(3,'admin','D',NULL),(8,'__public__','A',NULL),(9,'__public__','A',NULL),(10,'__public__','A',NULL),(10,'admin','A',NULL),(9,'admin','A',NULL),(11,'__public__','D',NULL),(11,'admin','D',NULL);
/*!40000 ALTER TABLE `webcal_entry_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `webcal_group`
--

DROP TABLE IF EXISTS `webcal_group`;
CREATE TABLE `webcal_group` (
  `cal_group_id` int(11) NOT NULL,
  `cal_owner` varchar(25) default NULL,
  `cal_name` varchar(50) NOT NULL,
  `cal_last_update` int(11) NOT NULL,
  PRIMARY KEY  (`cal_group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `webcal_group`
--

LOCK TABLES `webcal_group` WRITE;
/*!40000 ALTER TABLE `webcal_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `webcal_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `webcal_group_user`
--

DROP TABLE IF EXISTS `webcal_group_user`;
CREATE TABLE `webcal_group_user` (
  `cal_group_id` int(11) NOT NULL,
  `cal_login` varchar(25) NOT NULL,
  PRIMARY KEY  (`cal_group_id`,`cal_login`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `webcal_group_user`
--

LOCK TABLES `webcal_group_user` WRITE;
/*!40000 ALTER TABLE `webcal_group_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `webcal_group_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `webcal_import`
--

DROP TABLE IF EXISTS `webcal_import`;
CREATE TABLE `webcal_import` (
  `cal_import_id` int(11) NOT NULL,
  `cal_name` varchar(50) default NULL,
  `cal_date` int(11) NOT NULL,
  `cal_type` varchar(10) NOT NULL,
  `cal_login` varchar(25) default NULL,
  PRIMARY KEY  (`cal_import_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `webcal_import`
--

LOCK TABLES `webcal_import` WRITE;
/*!40000 ALTER TABLE `webcal_import` DISABLE KEYS */;
/*!40000 ALTER TABLE `webcal_import` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `webcal_import_data`
--

DROP TABLE IF EXISTS `webcal_import_data`;
CREATE TABLE `webcal_import_data` (
  `cal_import_id` int(11) NOT NULL,
  `cal_id` int(11) NOT NULL,
  `cal_login` varchar(25) NOT NULL,
  `cal_import_type` varchar(15) NOT NULL,
  `cal_external_id` varchar(200) default NULL,
  PRIMARY KEY  (`cal_id`,`cal_login`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `webcal_import_data`
--

LOCK TABLES `webcal_import_data` WRITE;
/*!40000 ALTER TABLE `webcal_import_data` DISABLE KEYS */;
/*!40000 ALTER TABLE `webcal_import_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `webcal_nonuser_cals`
--

DROP TABLE IF EXISTS `webcal_nonuser_cals`;
CREATE TABLE `webcal_nonuser_cals` (
  `cal_login` varchar(25) NOT NULL,
  `cal_lastname` varchar(25) default NULL,
  `cal_firstname` varchar(25) default NULL,
  `cal_admin` varchar(25) NOT NULL,
  PRIMARY KEY  (`cal_login`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `webcal_nonuser_cals`
--

LOCK TABLES `webcal_nonuser_cals` WRITE;
/*!40000 ALTER TABLE `webcal_nonuser_cals` DISABLE KEYS */;
/*!40000 ALTER TABLE `webcal_nonuser_cals` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `webcal_reminder_log`
--

DROP TABLE IF EXISTS `webcal_reminder_log`;
CREATE TABLE `webcal_reminder_log` (
  `cal_id` int(11) NOT NULL default '0',
  `cal_name` varchar(25) NOT NULL,
  `cal_event_date` int(11) NOT NULL default '0',
  `cal_last_sent` int(11) NOT NULL default '0',
  PRIMARY KEY  (`cal_id`,`cal_name`,`cal_event_date`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `webcal_reminder_log`
--

LOCK TABLES `webcal_reminder_log` WRITE;
/*!40000 ALTER TABLE `webcal_reminder_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `webcal_reminder_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `webcal_report`
--

DROP TABLE IF EXISTS `webcal_report`;
CREATE TABLE `webcal_report` (
  `cal_login` varchar(25) NOT NULL,
  `cal_report_id` int(11) NOT NULL,
  `cal_is_global` char(1) NOT NULL default 'N',
  `cal_report_type` varchar(20) NOT NULL,
  `cal_include_header` char(1) NOT NULL default 'Y',
  `cal_report_name` varchar(50) NOT NULL,
  `cal_time_range` int(11) NOT NULL,
  `cal_user` varchar(25) default NULL,
  `cal_allow_nav` char(1) default 'Y',
  `cal_cat_id` int(11) default NULL,
  `cal_include_empty` char(1) default 'N',
  `cal_show_in_trailer` char(1) default 'N',
  `cal_update_date` int(11) NOT NULL,
  PRIMARY KEY  (`cal_report_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `webcal_report`
--

LOCK TABLES `webcal_report` WRITE;
/*!40000 ALTER TABLE `webcal_report` DISABLE KEYS */;
/*!40000 ALTER TABLE `webcal_report` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `webcal_report_template`
--

DROP TABLE IF EXISTS `webcal_report_template`;
CREATE TABLE `webcal_report_template` (
  `cal_report_id` int(11) NOT NULL,
  `cal_template_type` char(1) NOT NULL,
  `cal_template_text` text,
  PRIMARY KEY  (`cal_report_id`,`cal_template_type`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `webcal_report_template`
--

LOCK TABLES `webcal_report_template` WRITE;
/*!40000 ALTER TABLE `webcal_report_template` DISABLE KEYS */;
/*!40000 ALTER TABLE `webcal_report_template` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `webcal_site_extras`
--

DROP TABLE IF EXISTS `webcal_site_extras`;
CREATE TABLE `webcal_site_extras` (
  `cal_id` int(11) NOT NULL default '0',
  `cal_name` varchar(25) NOT NULL,
  `cal_type` int(11) NOT NULL,
  `cal_date` int(11) default '0',
  `cal_remind` int(11) default '0',
  `cal_data` text,
  PRIMARY KEY  (`cal_id`,`cal_name`,`cal_type`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `webcal_site_extras`
--

LOCK TABLES `webcal_site_extras` WRITE;
/*!40000 ALTER TABLE `webcal_site_extras` DISABLE KEYS */;
/*!40000 ALTER TABLE `webcal_site_extras` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `webcal_user`
--

DROP TABLE IF EXISTS `webcal_user`;
CREATE TABLE `webcal_user` (
  `cal_login` varchar(25) NOT NULL,
  `cal_passwd` varchar(32) default NULL,
  `cal_lastname` varchar(25) default NULL,
  `cal_firstname` varchar(25) default NULL,
  `cal_is_admin` char(1) default 'N',
  `cal_email` varchar(75) default NULL,
  PRIMARY KEY  (`cal_login`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `webcal_user`
--

LOCK TABLES `webcal_user` WRITE;
/*!40000 ALTER TABLE `webcal_user` DISABLE KEYS */;
INSERT INTO `webcal_user` VALUES ('admin','81dc9bdb52d04dc20036dbd8313ed055','Administrator','Default','Y',NULL);
/*!40000 ALTER TABLE `webcal_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `webcal_user_layers`
--

DROP TABLE IF EXISTS `webcal_user_layers`;
CREATE TABLE `webcal_user_layers` (
  `cal_layerid` int(11) NOT NULL default '0',
  `cal_login` varchar(25) NOT NULL,
  `cal_layeruser` varchar(25) NOT NULL,
  `cal_color` varchar(25) default NULL,
  `cal_dups` char(1) default 'N',
  PRIMARY KEY  (`cal_login`,`cal_layeruser`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `webcal_user_layers`
--

LOCK TABLES `webcal_user_layers` WRITE;
/*!40000 ALTER TABLE `webcal_user_layers` DISABLE KEYS */;
/*!40000 ALTER TABLE `webcal_user_layers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `webcal_user_pref`
--

DROP TABLE IF EXISTS `webcal_user_pref`;
CREATE TABLE `webcal_user_pref` (
  `cal_login` varchar(25) NOT NULL,
  `cal_setting` varchar(25) NOT NULL,
  `cal_value` varchar(100) default NULL,
  PRIMARY KEY  (`cal_login`,`cal_setting`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `webcal_user_pref`
--

LOCK TABLES `webcal_user_pref` WRITE;
/*!40000 ALTER TABLE `webcal_user_pref` DISABLE KEYS */;
INSERT INTO `webcal_user_pref` VALUES ('admin','LANGUAGE','Portuguese_BR'),('admin','TZ_OFFSET','0'),('admin','FONTS','Arial, Helvetica, sans-serif'),('admin','STARTVIEW','month.php'),('admin','DISPLAY_WEEKENDS','Y'),('admin','DISPLAY_DESC_PRINT_DAY','N'),('admin','DATE_FORMAT','__dd__ __month__, __yyyy__'),('admin','DATE_FORMAT_MY','__month__ __yyyy__'),('admin','DATE_FORMAT_MD','__dd__/__mm__'),('admin','TIME_FORMAT','24'),('admin','TIME_SLOTS','24'),('admin','auto_refresh','N'),('admin','auto_refresh_time','0'),('admin','DISPLAY_UNAPPROVED','Y'),('admin','DISPLAY_WEEKNUMBER','Y'),('admin','WEEK_START','0'),('admin','WORK_DAY_START_HOUR','8'),('admin','WORK_DAY_END_HOUR','23'),('admin','TIMED_EVT_LEN','D'),('admin','EMAIL_REMINDER','Y'),('admin','EMAIL_EVENT_ADDED','Y'),('admin','EMAIL_EVENT_UPDATED','Y'),('admin','EMAIL_EVENT_DELETED','Y'),('admin','EMAIL_EVENT_REJECTED','Y'),('admin','BGCOLOR','#FFFFFF'),('admin','H2COLOR','#000000'),('admin','CELLBG','#C0C0C0'),('admin','TODAYCELLBG','#FFFF33'),('admin','WEEKENDBG','#D0D0D0');
/*!40000 ALTER TABLE `webcal_user_pref` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `webcal_view`
--

DROP TABLE IF EXISTS `webcal_view`;
CREATE TABLE `webcal_view` (
  `cal_view_id` int(11) NOT NULL,
  `cal_owner` varchar(25) NOT NULL,
  `cal_name` varchar(50) NOT NULL,
  `cal_view_type` char(1) default NULL,
  `cal_is_global` char(1) NOT NULL default 'N',
  PRIMARY KEY  (`cal_view_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `webcal_view`
--

LOCK TABLES `webcal_view` WRITE;
/*!40000 ALTER TABLE `webcal_view` DISABLE KEYS */;
/*!40000 ALTER TABLE `webcal_view` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `webcal_view_user`
--

DROP TABLE IF EXISTS `webcal_view_user`;
CREATE TABLE `webcal_view_user` (
  `cal_view_id` int(11) NOT NULL,
  `cal_login` varchar(25) NOT NULL,
  PRIMARY KEY  (`cal_view_id`,`cal_login`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `webcal_view_user`
--

LOCK TABLES `webcal_view_user` WRITE;
/*!40000 ALTER TABLE `webcal_view_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `webcal_view_user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2008-10-22 17:30:42
