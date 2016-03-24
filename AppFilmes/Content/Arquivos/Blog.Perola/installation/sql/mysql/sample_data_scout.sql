-- phpMyAdmin SQL Dump
-- version 3.3.10deb2
-- http://www.phpmyadmin.net
--
-- Servidor: 187.45.196.204
-- Tempo de Geração: Abr 11, 2012 as 01:08 AM
-- Versão do Servidor: 5.1.54
-- Versão do PHP: 5.3.3-7+squeeze8

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Banco de Dados: `guilhermeafons40`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `ueb_assets`
--

DROP TABLE IF EXISTS `ueb_assets`;
CREATE TABLE IF NOT EXISTS `ueb_assets` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Primary Key',
  `parent_id` int(11) NOT NULL DEFAULT '0' COMMENT 'Nested set parent.',
  `lft` int(11) NOT NULL DEFAULT '0' COMMENT 'Nested set lft.',
  `rgt` int(11) NOT NULL DEFAULT '0' COMMENT 'Nested set rgt.',
  `level` int(10) unsigned NOT NULL COMMENT 'The cached level in the nested tree.',
  `name` varchar(50) NOT NULL COMMENT 'The unique name for the asset.\n',
  `title` varchar(100) NOT NULL COMMENT 'The descriptive title for the asset.',
  `rules` varchar(5120) NOT NULL COMMENT 'JSON encoded access control.',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_asset_name` (`name`),
  KEY `idx_lft_rgt` (`lft`,`rgt`),
  KEY `idx_parent_id` (`parent_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=71 ;

--
-- Extraindo dados da tabela `ueb_assets`
--

INSERT INTO `ueb_assets` (`id`, `parent_id`, `lft`, `rgt`, `level`, `name`, `title`, `rules`) VALUES
(1, 0, 1, 133, 0, 'root.1', 'Root Asset', '{"core.login.site":{"6":1,"2":1},"core.login.admin":{"6":1},"core.login.offline":{"6":1},"core.admin":{"8":1},"core.manage":{"7":1},"core.create":{"6":1,"3":1},"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"core.edit.own":{"6":1,"3":1}}'),
(2, 1, 1, 2, 1, 'com_admin', 'com_admin', '{}'),
(3, 1, 3, 8, 1, 'com_banners', 'com_banners', '{"core.admin":{"7":1},"core.manage":{"6":1},"core.create":[],"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(4, 1, 9, 10, 1, 'com_cache', 'com_cache', '{"core.admin":{"7":1},"core.manage":{"7":1}}'),
(5, 1, 11, 12, 1, 'com_checkin', 'com_checkin', '{"core.admin":{"7":1},"core.manage":{"7":1}}'),
(6, 1, 13, 14, 1, 'com_config', 'com_config', '{}'),
(7, 1, 15, 18, 1, 'com_contact', 'com_contact', '{"core.admin":{"7":1},"core.manage":{"6":1},"core.create":[],"core.delete":[],"core.edit":[],"core.edit.state":[],"core.edit.own":[]}'),
(8, 1, 19, 88, 1, 'com_content', 'com_content', '{"core.admin":{"7":1},"core.manage":{"6":1},"core.create":{"3":1},"core.delete":[],"core.edit":{"4":1},"core.edit.state":{"5":1},"core.edit.own":[]}'),
(9, 1, 89, 90, 1, 'com_cpanel', 'com_cpanel', '{}'),
(10, 1, 91, 92, 1, 'com_installer', 'com_installer', '{"core.admin":[],"core.manage":{"7":0},"core.delete":{"7":0},"core.edit.state":{"7":0}}'),
(11, 1, 93, 94, 1, 'com_languages', 'com_languages', '{"core.admin":{"7":1},"core.manage":[],"core.create":[],"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(12, 1, 95, 96, 1, 'com_login', 'com_login', '{}'),
(13, 1, 97, 98, 1, 'com_mailto', 'com_mailto', '{}'),
(14, 1, 99, 100, 1, 'com_massmail', 'com_massmail', '{}'),
(15, 1, 101, 102, 1, 'com_media', 'com_media', '{"core.admin":{"7":1},"core.manage":{"6":1},"core.create":{"3":1},"core.delete":{"5":1}}'),
(16, 1, 103, 104, 1, 'com_menus', 'com_menus', '{"core.admin":{"7":1},"core.manage":[],"core.create":[],"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(17, 1, 105, 106, 1, 'com_messages', 'com_messages', '{"core.admin":{"7":1},"core.manage":{"7":1}}'),
(18, 1, 107, 108, 1, 'com_modules', 'com_modules', '{"core.admin":{"7":1},"core.manage":[],"core.create":[],"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(19, 1, 109, 112, 1, 'com_newsfeeds', 'com_newsfeeds', '{"core.admin":{"7":1},"core.manage":{"6":1},"core.create":[],"core.delete":[],"core.edit":[],"core.edit.state":[],"core.edit.own":[]}'),
(20, 1, 113, 114, 1, 'com_plugins', 'com_plugins', '{"core.admin":{"7":1},"core.manage":[],"core.edit":[],"core.edit.state":[]}'),
(21, 1, 115, 116, 1, 'com_redirect', 'com_redirect', '{"core.admin":{"7":1},"core.manage":[]}'),
(22, 1, 117, 118, 1, 'com_search', 'com_search', '{"core.admin":{"7":1},"core.manage":{"6":1}}'),
(23, 1, 119, 120, 1, 'com_templates', 'com_templates', '{"core.admin":{"7":1},"core.manage":[],"core.create":[],"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(24, 1, 121, 124, 1, 'com_users', 'com_users', '{"core.admin":{"7":1},"core.manage":[],"core.create":[],"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(25, 1, 125, 128, 1, 'com_weblinks', 'com_weblinks', '{"core.admin":{"7":1},"core.manage":{"6":1},"core.create":{"3":1},"core.delete":[],"core.edit":{"4":1},"core.edit.state":{"5":1},"core.edit.own":[]}'),
(26, 1, 129, 130, 1, 'com_wrapper', 'com_wrapper', '{}'),
(27, 8, 20, 29, 2, 'com_content.category.2', 'Uncategorised', '{"core.create":[],"core.delete":[],"core.edit":[],"core.edit.state":[],"core.edit.own":[]}'),
(28, 3, 4, 5, 2, 'com_banners.category.3', 'Uncategorised', '{"core.create":[],"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(29, 7, 16, 17, 2, 'com_contact.category.4', 'Uncategorised', '{"core.create":[],"core.delete":[],"core.edit":[],"core.edit.state":[],"core.edit.own":[]}'),
(30, 19, 110, 111, 2, 'com_newsfeeds.category.5', 'Uncategorised', '{"core.create":[],"core.delete":[],"core.edit":[],"core.edit.state":[],"core.edit.own":[]}'),
(31, 25, 126, 127, 2, 'com_weblinks.category.6', 'Uncategorised', '{"core.create":[],"core.delete":[],"core.edit":[],"core.edit.state":[],"core.edit.own":[]}'),
(32, 24, 122, 123, 1, 'com_users.notes.category.7', 'Uncategorised', '{"core.create":[],"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(33, 1, 131, 132, 1, 'com_finder', 'com_finder', '{"core.admin":{"7":1},"core.manage":{"6":1}}'),
(34, 8, 30, 41, 2, 'com_content.category.8', 'Notícias', '{"core.create":[],"core.delete":[],"core.edit":[],"core.edit.state":[],"core.edit.own":[]}'),
(35, 34, 31, 32, 3, 'com_content.article.1', 'Vestibulum nulla lectus, auctor a commo', '{"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(40, 60, 79, 80, 3, 'com_content.article.6', 'Institucional', '{"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(36, 34, 33, 34, 3, 'com_content.article.2', 'Duis sed faucibus velit. Aenean vel enim felis.', '{"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(37, 34, 35, 36, 3, 'com_content.article.3', 'Quisque eleifend, purus quis sagittis euismod', '{"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(38, 34, 37, 38, 3, 'com_content.article.4', 'Maecenas ipsum nunc, dictum vitae', '{"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(39, 34, 39, 40, 3, 'com_content.article.5', 'Phasellus dolor magna, mattis at hendrerit ut', '{"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(41, 61, 85, 86, 3, 'com_content.article.7', 'Escotismo', '{"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(42, 8, 42, 45, 2, 'com_content.category.9', 'Downloads', '{"core.create":[],"core.delete":[],"core.edit":[],"core.edit.state":[],"core.edit.own":[]}'),
(43, 8, 46, 55, 2, 'com_content.category.10', 'Agenda', '{"core.create":[],"core.delete":[],"core.edit":[],"core.edit.state":[],"core.edit.own":[]}'),
(44, 8, 56, 65, 2, 'com_content.category.11', 'Grupos Escoteiros', '{"core.create":[],"core.delete":[],"core.edit":[],"core.edit.state":[],"core.edit.own":[]}'),
(45, 8, 66, 69, 2, 'com_content.category.12', 'Registro', '{"core.create":[],"core.delete":[],"core.edit":[],"core.edit.state":[],"core.edit.own":[]}'),
(47, 27, 21, 22, 3, 'com_content.article.9', 'Agenda 1', '{"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(48, 27, 23, 24, 3, 'com_content.article.10', 'Agenda 2', '{"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(50, 27, 25, 26, 3, 'com_content.article.12', 'Grupos Escoteiro 2', '{"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(51, 45, 67, 68, 3, 'com_content.article.13', 'Registro', '{"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(52, 8, 70, 77, 2, 'com_content.category.13', 'Eventos', '{"core.create":[],"core.delete":[],"core.edit":[],"core.edit.state":[],"core.edit.own":[]}'),
(53, 52, 71, 72, 3, 'com_content.article.14', 'Duis sed faucibus velit. Aenean vel enim felis.', '{"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(54, 52, 73, 74, 3, 'com_content.article.15', 'Quisque eleifend, purus quis sagittis euismod', '{"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(55, 52, 75, 76, 3, 'com_content.article.16', 'Vestibulum nulla lectus, auctor a commo', '{"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(56, 3, 6, 7, 2, 'com_banners.category.14', 'Banner', '{"core.create":[],"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(57, 27, 27, 28, 3, 'com_content.article.17', 'UNIÃO DOS ESCOTEIROS DO BRASIL', '{"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(59, 60, 81, 82, 3, 'com_content.article.18', 'Listagem de Pessoas', '{"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(60, 8, 78, 83, 2, 'com_content.category.16', 'Institucional', '{"core.create":[],"core.delete":[],"core.edit":[],"core.edit.state":[],"core.edit.own":[]}'),
(61, 8, 84, 87, 2, 'com_content.category.17', 'Escotismo', '{"core.create":[],"core.delete":[],"core.edit":[],"core.edit.state":[],"core.edit.own":[]}'),
(62, 42, 43, 44, 3, 'com_content.article.19', 'Downloads', '{"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(63, 43, 47, 48, 3, 'com_content.article.20', 'Curso de Formadores - N1', '{"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(64, 43, 51, 52, 3, 'com_content.article.21', 'XIX Mutirão Nacional Escoteiro de Ação Ecológica', '{"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(65, 43, 49, 50, 3, 'com_content.article.22', 'XIII Jamboree Panamericano', '{"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(66, 43, 53, 54, 3, 'com_content.article.23', 'Aventura Escoteira Nacional Sênior e Guia', '{"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(67, 44, 57, 58, 3, 'com_content.article.24', 'Grupo Escoteiro', '{"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(68, 44, 59, 60, 3, 'com_content.article.25', 'Grupo Escoteiro 2', '{"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(69, 44, 61, 62, 3, 'com_content.article.26', 'Grupo Escoteiro 3', '{"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(70, 44, 63, 64, 3, 'com_content.article.27', 'Grupo Escoteiro 4', '{"core.delete":[],"core.edit":[],"core.edit.state":[]}');

-- --------------------------------------------------------

--
-- Estrutura da tabela `ueb_associations`
--

DROP TABLE IF EXISTS `ueb_associations`;
CREATE TABLE IF NOT EXISTS `ueb_associations` (
  `id` varchar(50) NOT NULL COMMENT 'A reference to the associated item.',
  `context` varchar(50) NOT NULL COMMENT 'The context of the associated item.',
  `key` char(32) NOT NULL COMMENT 'The key for the association computed from an md5 on associated ids.',
  PRIMARY KEY (`context`,`id`),
  KEY `idx_key` (`key`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `ueb_associations`
--


-- --------------------------------------------------------

--
-- Estrutura da tabela `ueb_banners`
--

DROP TABLE IF EXISTS `ueb_banners`;
CREATE TABLE IF NOT EXISTS `ueb_banners` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cid` int(11) NOT NULL DEFAULT '0',
  `type` int(11) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `alias` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `imptotal` int(11) NOT NULL DEFAULT '0',
  `impmade` int(11) NOT NULL DEFAULT '0',
  `clicks` int(11) NOT NULL DEFAULT '0',
  `clickurl` varchar(200) NOT NULL DEFAULT '',
  `state` tinyint(3) NOT NULL DEFAULT '0',
  `catid` int(10) unsigned NOT NULL DEFAULT '0',
  `description` text NOT NULL,
  `custombannercode` varchar(2048) NOT NULL,
  `sticky` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `ordering` int(11) NOT NULL DEFAULT '0',
  `metakey` text NOT NULL,
  `params` text NOT NULL,
  `own_prefix` tinyint(1) NOT NULL DEFAULT '0',
  `metakey_prefix` varchar(255) NOT NULL DEFAULT '',
  `purchase_type` tinyint(4) NOT NULL DEFAULT '-1',
  `track_clicks` tinyint(4) NOT NULL DEFAULT '-1',
  `track_impressions` tinyint(4) NOT NULL DEFAULT '-1',
  `checked_out` int(10) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_up` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_down` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `reset` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `language` char(7) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `idx_state` (`state`),
  KEY `idx_own_prefix` (`own_prefix`),
  KEY `idx_metakey_prefix` (`metakey_prefix`),
  KEY `idx_banner_catid` (`catid`),
  KEY `idx_language` (`language`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Extraindo dados da tabela `ueb_banners`
--

INSERT INTO `ueb_banners` (`id`, `cid`, `type`, `name`, `alias`, `imptotal`, `impmade`, `clicks`, `clickurl`, `state`, `catid`, `description`, `custombannercode`, `sticky`, `ordering`, `metakey`, `params`, `own_prefix`, `metakey_prefix`, `purchase_type`, `track_clicks`, `track_impressions`, `checked_out`, `checked_out_time`, `publish_up`, `publish_down`, `reset`, `created`, `language`) VALUES
(1, 0, 0, 'Banner1', 'banner1', 0, 381, 0, '', 1, 14, '', '', 0, 1, '', '{"imageurl":"images\\/banners\\/bannerbutton.jpg","width":"","height":"","alt":""}', 0, '', -1, 0, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '2012-03-10 22:15:59', '*'),
(2, 0, 0, 'Banner2', 'banner1-2', 0, 381, 0, '', 1, 14, '', '', 0, 1, '', '{"imageurl":"images\\/banners\\/bannerbutton.jpg","width":"","height":"","alt":""}', 0, '', -1, 0, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '2012-03-10 22:15:59', '*'),
(3, 0, 0, 'Banner3', 'banner1-3', 0, 381, 0, '', 1, 14, '', '', 0, 1, '', '{"imageurl":"images\\/banners\\/bannerbutton.jpg","width":"","height":"","alt":""}', 0, '', -1, 0, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '2012-03-10 22:15:59', '*'),
(4, 0, 0, 'União dos Escoteiros do Brasil', 'uniao-dos-escoteiros-do-brasil', 0, 378, 1, 'http://www.scout.org/', 1, 3, '', '', 0, 1, '', '{"imageurl":"images\\/banners\\/scouts.gif","width":"","height":"","alt":"Uni\\u00e3o dos Escoteiros do Brasil"}', 0, '', -1, 0, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '2012-03-10 23:08:13', '*');

-- --------------------------------------------------------

--
-- Estrutura da tabela `ueb_banner_clients`
--

DROP TABLE IF EXISTS `ueb_banner_clients`;
CREATE TABLE IF NOT EXISTS `ueb_banner_clients` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `contact` varchar(255) NOT NULL DEFAULT '',
  `email` varchar(255) NOT NULL DEFAULT '',
  `extrainfo` text NOT NULL,
  `state` tinyint(3) NOT NULL DEFAULT '0',
  `checked_out` int(10) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `metakey` text NOT NULL,
  `own_prefix` tinyint(4) NOT NULL DEFAULT '0',
  `metakey_prefix` varchar(255) NOT NULL DEFAULT '',
  `purchase_type` tinyint(4) NOT NULL DEFAULT '-1',
  `track_clicks` tinyint(4) NOT NULL DEFAULT '-1',
  `track_impressions` tinyint(4) NOT NULL DEFAULT '-1',
  PRIMARY KEY (`id`),
  KEY `idx_own_prefix` (`own_prefix`),
  KEY `idx_metakey_prefix` (`metakey_prefix`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Extraindo dados da tabela `ueb_banner_clients`
--


-- --------------------------------------------------------

--
-- Estrutura da tabela `ueb_banner_tracks`
--

DROP TABLE IF EXISTS `ueb_banner_tracks`;
CREATE TABLE IF NOT EXISTS `ueb_banner_tracks` (
  `track_date` datetime NOT NULL,
  `track_type` int(10) unsigned NOT NULL,
  `banner_id` int(10) unsigned NOT NULL,
  `count` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`track_date`,`track_type`,`banner_id`),
  KEY `idx_track_date` (`track_date`),
  KEY `idx_track_type` (`track_type`),
  KEY `idx_banner_id` (`banner_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `ueb_banner_tracks`
--


-- --------------------------------------------------------

--
-- Estrutura da tabela `ueb_categories`
--

DROP TABLE IF EXISTS `ueb_categories`;
CREATE TABLE IF NOT EXISTS `ueb_categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `asset_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'FK to the #__assets table.',
  `parent_id` int(10) unsigned NOT NULL DEFAULT '0',
  `lft` int(11) NOT NULL DEFAULT '0',
  `rgt` int(11) NOT NULL DEFAULT '0',
  `level` int(10) unsigned NOT NULL DEFAULT '0',
  `path` varchar(255) NOT NULL DEFAULT '',
  `extension` varchar(50) NOT NULL DEFAULT '',
  `title` varchar(255) NOT NULL,
  `alias` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `note` varchar(255) NOT NULL DEFAULT '',
  `description` mediumtext NOT NULL,
  `published` tinyint(1) NOT NULL DEFAULT '0',
  `checked_out` int(11) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `access` int(10) unsigned NOT NULL DEFAULT '0',
  `params` text NOT NULL,
  `metadesc` varchar(1024) NOT NULL COMMENT 'The meta description for the page.',
  `metakey` varchar(1024) NOT NULL COMMENT 'The meta keywords for the page.',
  `metadata` varchar(2048) NOT NULL COMMENT 'JSON encoded metadata properties.',
  `created_user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `created_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `modified_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `hits` int(10) unsigned NOT NULL DEFAULT '0',
  `language` char(7) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `cat_idx` (`extension`,`published`,`access`),
  KEY `idx_access` (`access`),
  KEY `idx_checkout` (`checked_out`),
  KEY `idx_path` (`path`),
  KEY `idx_left_right` (`lft`,`rgt`),
  KEY `idx_alias` (`alias`),
  KEY `idx_language` (`language`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=18 ;

--
-- Extraindo dados da tabela `ueb_categories`
--

INSERT INTO `ueb_categories` (`id`, `asset_id`, `parent_id`, `lft`, `rgt`, `level`, `path`, `extension`, `title`, `alias`, `note`, `description`, `published`, `checked_out`, `checked_out_time`, `access`, `params`, `metadesc`, `metakey`, `metadata`, `created_user_id`, `created_time`, `modified_user_id`, `modified_time`, `hits`, `language`) VALUES
(1, 0, 0, 0, 31, 0, '', 'system', 'ROOT', 'root', '', '', 1, 0, '0000-00-00 00:00:00', 1, '{}', '', '', '', 0, '2009-10-18 16:07:09', 0, '0000-00-00 00:00:00', 0, '*'),
(2, 27, 1, 1, 2, 1, 'uncategorised', 'com_content', 'Uncategorised', 'uncategorised', '', '', 1, 0, '0000-00-00 00:00:00', 1, '{"target":"","image":""}', '', '', '{"page_title":"","author":"","robots":""}', 42, '2010-06-28 13:26:37', 0, '0000-00-00 00:00:00', 0, '*'),
(3, 28, 1, 3, 4, 1, 'uncategorised', 'com_banners', 'Uncategorised', 'uncategorised', '', '', 1, 0, '0000-00-00 00:00:00', 1, '{"target":"","image":"","foobar":""}', '', '', '{"page_title":"","author":"","robots":""}', 42, '2010-06-28 13:27:35', 0, '0000-00-00 00:00:00', 0, '*'),
(4, 29, 1, 5, 6, 1, 'uncategorised', 'com_contact', 'Uncategorised', 'uncategorised', '', '', 1, 0, '0000-00-00 00:00:00', 1, '{"target":"","image":""}', '', '', '{"page_title":"","author":"","robots":""}', 42, '2010-06-28 13:27:57', 0, '0000-00-00 00:00:00', 0, '*'),
(5, 30, 1, 7, 8, 1, 'uncategorised', 'com_newsfeeds', 'Uncategorised', 'uncategorised', '', '', 1, 0, '0000-00-00 00:00:00', 1, '{"target":"","image":""}', '', '', '{"page_title":"","author":"","robots":""}', 42, '2010-06-28 13:28:15', 0, '0000-00-00 00:00:00', 0, '*'),
(6, 31, 1, 9, 10, 1, 'uncategorised', 'com_weblinks', 'Uncategorised', 'uncategorised', '', '', 1, 0, '0000-00-00 00:00:00', 1, '{"target":"","image":""}', '', '', '{"page_title":"","author":"","robots":""}', 42, '2010-06-28 13:28:33', 0, '0000-00-00 00:00:00', 0, '*'),
(7, 32, 1, 11, 12, 1, 'uncategorised', 'com_users.notes', 'Uncategorised', 'uncategorised', '', '', 1, 0, '0000-00-00 00:00:00', 1, '{"target":"","image":""}', '', '', '{"page_title":"","author":"","robots":""}', 42, '2010-06-28 13:28:33', 0, '0000-00-00 00:00:00', 0, '*'),
(8, 34, 1, 13, 14, 1, 'noticias', 'com_content', 'Notícias', 'noticias', '', '', 1, 0, '0000-00-00 00:00:00', 1, '{"category_layout":"","image":""}', '', '', '{"author":"","robots":""}', 42, '2012-03-06 02:37:48', 0, '0000-00-00 00:00:00', 0, '*'),
(9, 42, 1, 15, 16, 1, 'downloads', 'com_content', 'Downloads', 'downloads', '', '', 1, 0, '0000-00-00 00:00:00', 1, '{"category_layout":"","image":""}', '', '', '{"author":"","robots":""}', 42, '2012-03-06 12:21:18', 0, '0000-00-00 00:00:00', 0, '*'),
(10, 43, 1, 17, 18, 1, 'agenda', 'com_content', 'Agenda', 'agenda', '', '', 1, 0, '0000-00-00 00:00:00', 1, '{"category_layout":"","image":""}', '', '', '{"author":"","robots":""}', 42, '2012-03-06 12:21:26', 0, '0000-00-00 00:00:00', 0, '*'),
(11, 44, 1, 19, 20, 1, 'grupos-escoteiros', 'com_content', 'Grupos Escoteiros', 'grupos-escoteiros', '', '<p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry''s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.</p>', 1, 0, '0000-00-00 00:00:00', 1, '{"category_layout":"","image":""}', '', '', '{"author":"","robots":""}', 42, '2012-03-06 12:21:45', 42, '2012-03-28 12:52:38', 0, '*'),
(12, 45, 1, 21, 22, 1, 'registro', 'com_content', 'Registro', 'registro', '', '', 1, 0, '0000-00-00 00:00:00', 1, '{"category_layout":"","image":""}', '', '', '{"author":"","robots":""}', 42, '2012-03-06 12:21:52', 0, '0000-00-00 00:00:00', 0, '*'),
(13, 52, 1, 23, 24, 1, 'eventos', 'com_content', 'Eventos', 'eventos', '', '', 1, 0, '0000-00-00 00:00:00', 1, '{"category_layout":"","image":""}', '', '', '{"author":"","robots":""}', 42, '2012-03-10 22:05:13', 0, '0000-00-00 00:00:00', 0, '*'),
(14, 56, 1, 25, 26, 1, 'banner', 'com_banners', 'Banner', 'banner', '', '', 1, 0, '0000-00-00 00:00:00', 1, '{"category_layout":"","image":""}', '', '', '{"author":"","robots":""}', 42, '2012-03-10 22:15:25', 0, '0000-00-00 00:00:00', 0, '*'),
(16, 60, 1, 27, 28, 1, 'institucional', 'com_content', 'Institucional', 'institucional', '', '', 1, 0, '0000-00-00 00:00:00', 1, '{"category_layout":"","image":""}', '', '', '{"author":"","robots":""}', 42, '2012-03-12 14:12:21', 0, '0000-00-00 00:00:00', 0, '*'),
(17, 61, 1, 29, 30, 1, 'escotismo', 'com_content', 'Escotismo', 'escotismo', '', '', 1, 0, '0000-00-00 00:00:00', 1, '{"category_layout":"","image":""}', '', '', '{"author":"","robots":""}', 42, '2012-03-12 14:38:52', 0, '0000-00-00 00:00:00', 0, '*');

-- --------------------------------------------------------

--
-- Estrutura da tabela `ueb_contact_details`
--

DROP TABLE IF EXISTS `ueb_contact_details`;
CREATE TABLE IF NOT EXISTS `ueb_contact_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `alias` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `con_position` varchar(255) DEFAULT NULL,
  `address` text,
  `suburb` varchar(100) DEFAULT NULL,
  `state` varchar(100) DEFAULT NULL,
  `country` varchar(100) DEFAULT NULL,
  `postcode` varchar(100) DEFAULT NULL,
  `telephone` varchar(255) DEFAULT NULL,
  `fax` varchar(255) DEFAULT NULL,
  `misc` mediumtext,
  `image` varchar(255) DEFAULT NULL,
  `imagepos` varchar(20) DEFAULT NULL,
  `email_to` varchar(255) DEFAULT NULL,
  `default_con` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `published` tinyint(1) NOT NULL DEFAULT '0',
  `checked_out` int(10) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `ordering` int(11) NOT NULL DEFAULT '0',
  `params` text NOT NULL,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `catid` int(11) NOT NULL DEFAULT '0',
  `access` int(10) unsigned NOT NULL DEFAULT '0',
  `mobile` varchar(255) NOT NULL DEFAULT '',
  `webpage` varchar(255) NOT NULL DEFAULT '',
  `sortname1` varchar(255) NOT NULL,
  `sortname2` varchar(255) NOT NULL,
  `sortname3` varchar(255) NOT NULL,
  `language` char(7) NOT NULL,
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(10) unsigned NOT NULL DEFAULT '0',
  `created_by_alias` varchar(255) NOT NULL DEFAULT '',
  `modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` int(10) unsigned NOT NULL DEFAULT '0',
  `metakey` text NOT NULL,
  `metadesc` text NOT NULL,
  `metadata` text NOT NULL,
  `featured` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT 'Set if article is featured.',
  `xreference` varchar(50) NOT NULL COMMENT 'A reference to enable linkages to external data sets.',
  `publish_up` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_down` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `idx_access` (`access`),
  KEY `idx_checkout` (`checked_out`),
  KEY `idx_state` (`published`),
  KEY `idx_catid` (`catid`),
  KEY `idx_createdby` (`created_by`),
  KEY `idx_featured_catid` (`featured`,`catid`),
  KEY `idx_language` (`language`),
  KEY `idx_xreference` (`xreference`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Extraindo dados da tabela `ueb_contact_details`
--

INSERT INTO `ueb_contact_details` (`id`, `name`, `alias`, `con_position`, `address`, `suburb`, `state`, `country`, `postcode`, `telephone`, `fax`, `misc`, `image`, `imagepos`, `email_to`, `default_con`, `published`, `checked_out`, `checked_out_time`, `ordering`, `params`, `user_id`, `catid`, `access`, `mobile`, `webpage`, `sortname1`, `sortname2`, `sortname3`, `language`, `created`, `created_by`, `created_by_alias`, `modified`, `modified_by`, `metakey`, `metadesc`, `metadata`, `featured`, `xreference`, `publish_up`, `publish_down`) VALUES
(1, 'Contato', 'contato', '', '', '', '', '', '', '', '', '', 'images/noticias/escoteiros_do_brasil.jpg', NULL, '', 0, 1, 0, '0000-00-00 00:00:00', 1, '{"show_contact_category":"","show_contact_list":"","presentation_style":"","show_name":"","show_position":"","show_email":"","show_street_address":"","show_suburb":"","show_state":"","show_postcode":"","show_country":"","show_telephone":"","show_mobile":"","show_fax":"","show_webpage":"","show_misc":"","show_image":"","allow_vcard":"","show_articles":"","show_profile":"","show_links":"","linka_name":"","linka":null,"linkb_name":"","linkb":null,"linkc_name":"","linkc":null,"linkd_name":"","linkd":null,"linke_name":"","linke":"","contact_layout":"","show_email_form":"","show_email_copy":"","banned_email":"","banned_subject":"","banned_text":"","validate_session":"","custom_reply":"","redirect":""}', 0, 4, 1, '', '', '', '', '', '*', '2012-03-28 13:52:03', 42, '', '0000-00-00 00:00:00', 0, '', '', '{"robots":"","rights":""}', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Estrutura da tabela `ueb_content`
--

DROP TABLE IF EXISTS `ueb_content`;
CREATE TABLE IF NOT EXISTS `ueb_content` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `asset_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'FK to the #__assets table.',
  `title` varchar(255) NOT NULL DEFAULT '',
  `alias` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `title_alias` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT 'Deprecated in Joomla! 3.0',
  `introtext` mediumtext NOT NULL,
  `fulltext` mediumtext NOT NULL,
  `state` tinyint(3) NOT NULL DEFAULT '0',
  `sectionid` int(10) unsigned NOT NULL DEFAULT '0',
  `mask` int(10) unsigned NOT NULL DEFAULT '0',
  `catid` int(10) unsigned NOT NULL DEFAULT '0',
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(10) unsigned NOT NULL DEFAULT '0',
  `created_by_alias` varchar(255) NOT NULL DEFAULT '',
  `modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` int(10) unsigned NOT NULL DEFAULT '0',
  `checked_out` int(10) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_up` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_down` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `images` text NOT NULL,
  `urls` text NOT NULL,
  `attribs` varchar(5120) NOT NULL,
  `version` int(10) unsigned NOT NULL DEFAULT '1',
  `parentid` int(10) unsigned NOT NULL DEFAULT '0',
  `ordering` int(11) NOT NULL DEFAULT '0',
  `metakey` text NOT NULL,
  `metadesc` text NOT NULL,
  `access` int(10) unsigned NOT NULL DEFAULT '0',
  `hits` int(10) unsigned NOT NULL DEFAULT '0',
  `metadata` text NOT NULL,
  `featured` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT 'Set if article is featured.',
  `language` char(7) NOT NULL COMMENT 'The language code for the article.',
  `xreference` varchar(50) NOT NULL COMMENT 'A reference to enable linkages to external data sets.',
  PRIMARY KEY (`id`),
  KEY `idx_access` (`access`),
  KEY `idx_checkout` (`checked_out`),
  KEY `idx_state` (`state`),
  KEY `idx_catid` (`catid`),
  KEY `idx_createdby` (`created_by`),
  KEY `idx_featured_catid` (`featured`,`catid`),
  KEY `idx_language` (`language`),
  KEY `idx_xreference` (`xreference`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=28 ;

--
-- Extraindo dados da tabela `ueb_content`
--

INSERT INTO `ueb_content` (`id`, `asset_id`, `title`, `alias`, `title_alias`, `introtext`, `fulltext`, `state`, `sectionid`, `mask`, `catid`, `created`, `created_by`, `created_by_alias`, `modified`, `modified_by`, `checked_out`, `checked_out_time`, `publish_up`, `publish_down`, `images`, `urls`, `attribs`, `version`, `parentid`, `ordering`, `metakey`, `metadesc`, `access`, `hits`, `metadata`, `featured`, `language`, `xreference`) VALUES
(1, 35, 'Vestibulum nulla lectus, auctor a commo', 'vestibulum-nulla-lectus-auctor-a-commo', '', '<p><img src="images/noticias/_boy_scout_camp_3.jpg" border="0" alt="" width="164" height="146" /> Nulla semper diam non felis pellentesque eget vestibulum.</p>\r\n', '\r\n<p>Donec et gravida lectus. Quisque adipiscing, neque at dapibus sollicitudin, nisl risus eleifend ante, non convallis orci est et dolor. Nulla semper diam non felis pellentesque eget vestibulum risus iaculis. Fusce quis nibh dui. Integer quis massa eget nisi laoreet vehicula vulputate non justo. Vestibulum at ante libero. Curabitur lorem risus, consequat ac venenatis vel, congue ac tortor.</p>\r\n<p>Etiam ut elit ligula. Phasellus tempus consequat odio. Aliquam nulla est, facilisis vel viverra eget, accumsan a erat. Sed pretium, risus eget porttitor mattis, lorem felis lobortis lectus, vel pellentesque nunc quam a sem. Quisque molestie tortor eget risus sagittis a vehicula eros porttitor. Nullam libero nisl, bibendum ac ullamcorper pulvinar, ultricies sit amet nisi. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Ut ipsum ante, faucibus nec mattis ut, sagittis et ligula. Donec vehicula mattis sem, consectetur euismod lacus eleifend ut. Nulla dui diam, commodo eu porttitor eu, dignissim eu nisi. Nullam eget est nec orci lobortis fermentum. Curabitur laoreet leo at sapien volutpat gravida. Praesent id magna erat.</p>', 1, 0, 0, 8, '2012-03-06 02:46:57', 42, '', '2012-03-14 13:48:55', 42, 0, '0000-00-00 00:00:00', '2012-03-06 02:46:57', '0000-00-00 00:00:00', '{"image_intro":"images\\/noticias\\/imgexemplo.png","float_intro":"","image_intro_alt":"","image_intro_caption":"","image_fulltext":"images\\/noticias\\/scout.jpg","float_fulltext":"","image_fulltext_alt":"","image_fulltext_caption":""}', '{"urla":null,"urlatext":"","targeta":"","urlb":null,"urlbtext":"","targetb":"","urlc":null,"urlctext":"","targetc":""}', '{"show_title":"","link_titles":"","show_intro":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_vote":"","show_hits":"","show_noauth":"","urls_position":"","alternative_readmore":"","article_layout":"","show_publishing_options":"","show_article_options":"","show_urls_images_backend":"","show_urls_images_frontend":""}', 17, 0, 5, '', '', 1, 14, '{"robots":"","author":"","rights":"","xreference":""}', 0, '*', ''),
(14, 53, 'Duis sed faucibus velit. Aenean vel enim felis.', 'duis-sed-faucibus-velit-aenean-vel-enim-felis', '', '<p><img src="images/noticias/_boy_scout_camp_3.jpg" border="0" alt="" width="185" height="163" />Imperdiet arcu a elit fermentum condimentum nec vitae justo.</p>\r\n', '\r\n<p>Nam nec elit nec urna dignissim fermentum id vel mauris. Pellentesque varius, elit vel aliquet ultrices, erat massa aliquam odio, non egestas ante enim in turpis. Maecenas ipsum nunc, dictum vitae consequat sed, fermentum hendrerit purus. Nunc pellentesque, nisi eu feugiat mattis, magna lectus convallis purus, eu iaculis metus nisi in leo. Sed eget risus eu libero congue venenatis ac vitae justo. Mauris scelerisque pretium elementum. In imperdiet arcu a elit fermentum condimentum nec vitae justo. Duis nec sem sit amet sem aliquam blandit. Suspendisse potenti.</p>\r\n<p>Duis sed faucibus velit. Aenean vel enim felis. Ut semper elementum sollicitudin. Praesent eu diam erat. Nunc ultricies molestie pretium. Nulla at rhoncus est. Sed non lorem ac turpis cursus molestie a lacinia nibh. Nulla sollicitudin dignissim porta. Etiam viverra tristique cursus. Donec auctor, nisl placerat rhoncus tempus, sapien dui congue odio, sed imperdiet ipsum purus vitae neque.</p>', 1, 0, 0, 13, '2012-03-06 02:47:42', 42, '', '2012-03-10 22:49:50', 42, 0, '0000-00-00 00:00:00', '2012-03-06 02:47:42', '0000-00-00 00:00:00', '{"image_intro":"images\\/noticias\\/scout2.jpg","float_intro":"left","image_intro_alt":"","image_intro_caption":"","image_fulltext":"images\\/noticias\\/scout2.jpg","float_fulltext":"","image_fulltext_alt":"","image_fulltext_caption":""}', '{"urla":null,"urlatext":"","targeta":"","urlb":null,"urlbtext":"","targetb":"","urlc":null,"urlctext":"","targetc":""}', '{"show_title":"","link_titles":"","show_intro":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_vote":"","show_hits":"","show_noauth":"","urls_position":"","alternative_readmore":"","article_layout":"","show_publishing_options":"","show_article_options":"","show_urls_images_backend":"","show_urls_images_frontend":""}', 8, 0, 4, '', '', 1, 6, '{"robots":"","author":"","rights":"","xreference":""}', 0, '*', ''),
(6, 40, 'Institucional', 'institucional', '', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam id tortor turpis, ac lacinia nisl. Aliquam semper, libero eu hendrerit posuere, nulla augue pulvinar sapien, quis luctus ipsum orci quis ligula. Cras laoreet pellentesque lorem, et iaculis augue congue vel.</p>\r\n', '\r\n<p>Nam nec elit nec urna dignissim fermentum id vel mauris. Pellentesque varius, elit vel aliquet ultrices, erat massa aliquam odio, non egestas ante enim in turpis. Maecenas ipsum nunc, dictum vitae consequat sed, fermentum hendrerit purus. Nunc pellentesque, nisi eu feugiat mattis, magna lectus convallis purus, eu iaculis metus nisi in leo. Sed eget risus eu libero congue venenatis ac vitae justo. Mauris scelerisque pretium elementum. In imperdiet arcu a elit fermentum condimentum nec vitae justo. Duis nec sem sit amet sem aliquam blandit. Suspendisse potenti.</p>\r\n<p>Duis sed faucibus velit. Aenean vel enim felis. Ut semper elementum sollicitudin. Praesent eu diam erat. Nunc ultricies molestie pretium. Nulla at rhoncus est. Sed non lorem ac turpis cursus molestie a lacinia nibh. Nulla sollicitudin dignissim porta. Etiam viverra tristique cursus. Donec auctor, nisl placerat rhoncus tempus, sapien dui congue odio, sed imperdiet ipsum purus vitae neque.</p>', 1, 0, 0, 16, '2012-03-06 02:47:42', 42, '', '2012-03-12 14:12:38', 42, 0, '0000-00-00 00:00:00', '2012-03-06 02:47:42', '0000-00-00 00:00:00', '{"image_intro":"","float_intro":"left","image_intro_alt":"","image_intro_caption":"","image_fulltext":"","float_fulltext":"","image_fulltext_alt":"","image_fulltext_caption":""}', '{"urla":null,"urlatext":"","targeta":"","urlb":null,"urlbtext":"","targetb":"","urlc":null,"urlctext":"","targetc":""}', '{"show_title":"","link_titles":"","show_intro":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_vote":"","show_hits":"","show_noauth":"","urls_position":"","alternative_readmore":"","article_layout":"","show_publishing_options":"","show_article_options":"","show_urls_images_backend":"","show_urls_images_frontend":""}', 2, 0, 6, '', '', 1, 48, '{"robots":"","author":"","rights":"","xreference":""}', 0, '*', ''),
(2, 36, 'Duis sed faucibus velit. Aenean vel enim felis.', 'duis-sed-faucibus-velit-aenean-vel-enim-felis', '', '<p><img src="images/noticias/_boy_scout_camp_3.jpg" border="0" alt="" width="185" /> Nam nec elit nec urna dignissim fermentum id vel mauris.</p>\r\n', '\r\n<p>Nam nec elit nec urna dignissim fermentum id vel mauris. Pellentesque varius, elit vel aliquet ultrices, erat massa aliquam odio, non egestas ante enim in turpis. Maecenas ipsum nunc, dictum vitae consequat sed, fermentum hendrerit purus. Nunc pellentesque, nisi eu feugiat mattis, magna lectus convallis purus, eu iaculis metus nisi in leo. Sed eget risus eu libero congue venenatis ac vitae justo. Mauris scelerisque pretium elementum. In imperdiet arcu a elit fermentum condimentum nec vitae justo. Duis nec sem sit amet sem aliquam blandit. Suspendisse potenti.</p>\r\n<p>Duis sed faucibus velit. Aenean vel enim felis. Ut semper elementum sollicitudin. Praesent eu diam erat. Nunc ultricies molestie pretium. Nulla at rhoncus est. Sed non lorem ac turpis cursus molestie a lacinia nibh. Nulla sollicitudin dignissim porta. Etiam viverra tristique cursus. Donec auctor, nisl placerat rhoncus tempus, sapien dui congue odio, sed imperdiet ipsum purus vitae neque.</p>', 1, 0, 0, 8, '2012-03-06 02:47:42', 42, '', '2012-03-14 13:47:43', 42, 0, '0000-00-00 00:00:00', '2012-03-06 02:47:42', '0000-00-00 00:00:00', '{"image_intro":"images\\/noticias\\/imgexemplo.png","float_intro":"left","image_intro_alt":"","image_intro_caption":"","image_fulltext":"images\\/noticias\\/scout2.jpg","float_fulltext":"","image_fulltext_alt":"","image_fulltext_caption":""}', '{"urla":null,"urlatext":"","targeta":"","urlb":null,"urlbtext":"","targetb":"","urlc":null,"urlctext":"","targetc":""}', '{"show_title":"","link_titles":"","show_intro":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_vote":"","show_hits":"","show_noauth":"","urls_position":"","alternative_readmore":"","article_layout":"","show_publishing_options":"","show_article_options":"","show_urls_images_backend":"","show_urls_images_frontend":""}', 12, 0, 4, '', '', 1, 12, '{"robots":"","author":"","rights":"","xreference":""}', 0, '*', ''),
(3, 37, 'Quisque eleifend, purus quis sagittis euismod', 'quisque-eleifend-purus-quis-sagittis-euismod-felis-diam-dapibus-justo', '', '<p><img src="images/noticias/_boy_scout_camp_3.jpg" border="0" width="100" style="border: 0pt none;" /> Nam nec elit nec urna dignissim fermentum id vel mauris.</p>\r\n', '\r\n<p>Nunc ultricies molestie pretium. Nulla at rhoncus est. Sed non lorem ac turpis cursus molestie a lacinia nibh. Nulla sollicitudin dignissim porta. Etiam viverra tristique cursus. Donec auctor, nisl placerat rhoncus tempus, sapien dui congue odio, sed imperdiet ipsum purus vitae neque.</p>\r\n<p>Nam vitae ante leo, in consectetur turpis. Quisque eleifend, purus quis sagittis euismod, felis diam dapibus justo, eu tincidunt sem neque ut lorem. Praesent non leo id est hendrerit posuere. Phasellus dolor magna, mattis at hendrerit ut, porta eget neque. Pellentesque tincidunt fermentum risus, euismod auctor libero eleifend eget. Morbi non nisi eget elit malesuada pulvinar et ultricies lacus. Nullam laoreet massa rhoncus orci fringilla nec semper urna mattis. Maecenas et lectus justo, et mollis ipsum.</p>', 1, 0, 0, 8, '2012-03-06 02:48:04', 42, '', '2012-03-14 13:48:28', 42, 0, '0000-00-00 00:00:00', '2012-03-06 02:48:04', '0000-00-00 00:00:00', '{"image_intro":"images\\/noticias\\/ilustracao.jpg","float_intro":"left","image_intro_alt":"boy","image_intro_caption":"boy","image_fulltext":"images\\/noticias\\/scout3.jpg","float_fulltext":"left","image_fulltext_alt":"boy","image_fulltext_caption":"boy"}', '{"urla":null,"urlatext":"","targeta":"","urlb":null,"urlbtext":"","targetb":"","urlc":null,"urlctext":"","targetc":""}', '{"show_title":"","link_titles":"","show_intro":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_vote":"","show_hits":"","show_noauth":"","urls_position":"","alternative_readmore":"","article_layout":"","show_publishing_options":"","show_article_options":"","show_urls_images_backend":"","show_urls_images_frontend":""}', 16, 0, 3, '', '', 1, 9, '{"robots":"","author":"","rights":"","xreference":""}', 0, '*', ''),
(4, 38, 'Maecenas ipsum nunc, dictum vitae', 'maecenas-ipsum-nunc-dictum-vitae-consequat-sed', '', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>\r\n', '\r\n<p>Nam nec elit nec urna dignissim fermentum id vel mauris. Pellentesque varius, elit vel aliquet ultrices, erat massa aliquam odio, non egestas ante enim in turpis. Maecenas ipsum nunc, dictum vitae consequat sed, fermentum hendrerit purus. Nunc pellentesque, nisi eu feugiat mattis, magna lectus convallis purus, eu iaculis metus nisi in leo. Sed eget risus eu libero congue venenatis ac vitae justo. Mauris scelerisque pretium elementum. In imperdiet arcu a elit fermentum condimentum nec vitae justo. Duis nec sem sit amet sem aliquam blandit. Suspendisse potenti.</p>\r\n<p>Duis sed faucibus velit. Aenean vel enim felis. Ut semper elementum sollicitudin. Praesent eu diam erat. Nunc ultricies molestie pretium. Nulla at rhoncus est. Sed non lorem ac turpis cursus molestie a lacinia nibh. Nulla sollicitudin dignissim porta. Etiam viverra tristique cursus. Donec auctor, nisl placerat rhoncus tempus, sapien dui congue odio, sed imperdiet ipsum purus vitae neque.</p>', 1, 0, 0, 8, '2012-03-06 02:49:07', 42, '', '2012-03-14 13:47:05', 42, 0, '0000-00-00 00:00:00', '2012-03-06 02:49:07', '0000-00-00 00:00:00', '{"image_intro":"images\\/noticias\\/imgexemplo.png","float_intro":"","image_intro_alt":"","image_intro_caption":"","image_fulltext":"images\\/noticias\\/scout4.jpg","float_fulltext":"","image_fulltext_alt":"","image_fulltext_caption":""}', '{"urla":null,"urlatext":"","targeta":"","urlb":null,"urlbtext":"","targetb":"","urlc":null,"urlctext":"","targetc":""}', '{"show_title":"","link_titles":"","show_intro":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_vote":"","show_hits":"","show_noauth":"","urls_position":"","alternative_readmore":"","article_layout":"","show_publishing_options":"","show_article_options":"","show_urls_images_backend":"","show_urls_images_frontend":""}', 11, 0, 2, '', '', 1, 41, '{"robots":"","author":"","rights":"","xreference":""}', 0, '*', ''),
(5, 39, 'Phasellus dolor magna, mattis at hendrerit ut', 'phasellus-dolor-magna-mattis-at-hendrerit-ut', '', '<p>Duis sed faucibus velit. Aenean vel enim felis.</p>\r\n', '\r\n<p>Ut semper elementum sollicitudin. Praesent eu diam erat. Nunc ultricies molestie pretium. Nulla at rhoncus est. Sed non lorem ac turpis cursus molestie a lacinia nibh. Nulla sollicitudin dignissim porta. Etiam viverra tristique cursus. Donec auctor, nisl placerat rhoncus tempus, sapien dui congue odio, sed imperdiet ipsum purus vitae neque.</p>\r\n<p>Nam vitae ante leo, in consectetur turpis. Quisque eleifend, purus quis sagittis euismod, felis diam dapibus justo, eu tincidunt sem neque ut lorem. Praesent non leo id est hendrerit posuere. Phasellus dolor magna, mattis at hendrerit ut, porta eget neque. Pellentesque tincidunt fermentum risus, euismod auctor libero eleifend eget. Morbi non nisi eget elit malesuada pulvinar et ultricies lacus. Nullam laoreet massa rhoncus orci fringilla nec semper urna mattis. Maecenas et lectus justo, et mollis ipsum.</p>', 1, 0, 0, 8, '2012-02-06 02:49:00', 42, '', '2012-03-15 13:49:20', 42, 0, '0000-00-00 00:00:00', '2012-03-06 02:49:35', '0000-00-00 00:00:00', '{"image_intro":"images\\/noticias\\/imgexemplo.png","float_intro":"","image_intro_alt":"phasellus","image_intro_caption":"phasellus","image_fulltext":"images\\/noticias\\/scout5.jpg","float_fulltext":"","image_fulltext_alt":"phasellus","image_fulltext_caption":"phasellus"}', '{"urla":null,"urlatext":"","targeta":"","urlb":null,"urlbtext":"","targetb":"","urlc":null,"urlctext":"","targetc":""}', '{"show_title":"","link_titles":"","show_intro":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_vote":"","show_hits":"","show_noauth":"","urls_position":"","alternative_readmore":"","article_layout":"","show_publishing_options":"","show_article_options":"","show_urls_images_backend":"1","show_urls_images_frontend":"1"}', 20, 0, 1, '', '', 1, 20, '{"robots":"","author":"","rights":"","xreference":""}', 0, '*', ''),
(7, 41, 'Escotismo', 'escotismo', '', '<h3>Ramo Lobinho (6,5 à 10 anos)</h3>\r\n<p><img src="images/noticias/imgexemplo.png" border="0" alt="" style="float: left;" /></p>\r\n<p>Lorem Ipsum has been the industry''s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>\r\n<hr />\r\n<h3>Ramo Escoteiro (11 à 14 anos)</h3>\r\n<p><img src="images/noticias/imgexemplo.png" border="0" alt="" style="float: left;" /></p>\r\n<p>Lorem Ipsum has been the industry''s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>\r\n<hr />\r\n<h3>Ramo Sênior (15 à 17 anos)</h3>\r\n<p><img src="images/noticias/imgexemplo.png" border="0" alt="" style="float: left;" /></p>\r\n<p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry''s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>\r\n<hr />\r\n<h3>Ramo Pioneiro (18 à 21 anos)</h3>\r\n<p><img src="images/noticias/imgexemplo.png" border="0" alt="" style="float: left;" /></p>\r\n<p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry''s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>\r\n<hr />\r\n<h3>Adulto Voluntário (acima de 21 anos)</h3>\r\n<p><img src="images/noticias/imgexemplo.png" border="0" alt="" style="float: left;" /></p>\r\n<p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry''s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>', '', 1, 0, 0, 17, '2012-03-06 02:49:07', 42, '', '2012-03-13 13:53:22', 42, 0, '0000-00-00 00:00:00', '2012-03-06 02:49:07', '0000-00-00 00:00:00', '{"image_intro":"","float_intro":"","image_intro_alt":"","image_intro_caption":"","image_fulltext":"","float_fulltext":"","image_fulltext_alt":"","image_fulltext_caption":""}', '{"urla":null,"urlatext":"","targeta":"","urlb":null,"urlbtext":"","targetb":"","urlc":null,"urlctext":"","targetc":""}', '{"show_title":"","link_titles":"","show_intro":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_vote":"","show_hits":"","show_noauth":"","urls_position":"","alternative_readmore":"","article_layout":"","show_publishing_options":"","show_article_options":"","show_urls_images_backend":"","show_urls_images_frontend":""}', 10, 0, 7, '', '', 1, 40, '{"robots":"","author":"","rights":"","xreference":""}', 0, '*', ''),
(9, 47, 'Agenda 1', 'agenda-1', '', '<p>Aliquam nulla augue, posuere ut sollicitudin eu, faucibus at ante. Donec interdum orci at mauris egestas at iaculis odio dapibus. Nullam at commodo quam. Aliquam eleifend erat eu nisl faucibus eleifend. Sed imperdiet malesuada turpis, quis gravida nisl ullamcorper a. Duis at dignissim leo. Nunc lectus massa, lacinia ac eleifend ut, luctus sit amet purus. Aenean a ipsum at sapien ullamcorper rhoncus eu in lectus. Sed facilisis, ante vel vulputate condimentum, tortor mauris laoreet eros, et sollicitudin velit massa vel nunc. Sed eget eros quis felis tempus malesuada ut ac turpis. In hac habitasse platea dictumst. Sed arcu quam, laoreet in faucibus at, faucibus vitae est.</p>', '', 1, 0, 0, 2, '2012-03-06 12:23:00', 42, '', '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', '2012-03-06 12:23:00', '0000-00-00 00:00:00', '{"image_intro":"","float_intro":"","image_intro_alt":"","image_intro_caption":"","image_fulltext":"","float_fulltext":"","image_fulltext_alt":"","image_fulltext_caption":""}', '{"urla":null,"urlatext":"","targeta":"","urlb":null,"urlbtext":"","targetb":"","urlc":null,"urlctext":"","targetc":""}', '{"show_title":"","link_titles":"","show_intro":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_vote":"","show_hits":"","show_noauth":"","urls_position":"","alternative_readmore":"","article_layout":"","show_publishing_options":"","show_article_options":"","show_urls_images_backend":"","show_urls_images_frontend":""}', 1, 0, 4, '', '', 1, 0, '{"robots":"","author":"","rights":"","xreference":""}', 0, '*', ''),
(10, 48, 'Agenda 2', 'agenda-2', '', '<p>Aenean a ipsum at sapien ullamcorper rhoncus eu in lectus. Sed facilisis, ante vel vulputate condimentum, tortor mauris laoreet eros, et sollicitudin velit massa vel nunc. Sed eget eros quis felis tempus malesuada ut ac turpis. In hac habitasse platea dictumst. Sed arcu quam, laoreet in faucibus at, faucibus vitae est.</p>', '', 1, 0, 0, 2, '2012-03-06 12:23:11', 42, '', '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', '2012-03-06 12:23:11', '0000-00-00 00:00:00', '{"image_intro":"","float_intro":"","image_intro_alt":"","image_intro_caption":"","image_fulltext":"","float_fulltext":"","image_fulltext_alt":"","image_fulltext_caption":""}', '{"urla":null,"urlatext":"","targeta":"","urlb":null,"urlbtext":"","targetb":"","urlc":null,"urlctext":"","targetc":""}', '{"show_title":"","link_titles":"","show_intro":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_vote":"","show_hits":"","show_noauth":"","urls_position":"","alternative_readmore":"","article_layout":"","show_publishing_options":"","show_article_options":"","show_urls_images_backend":"","show_urls_images_frontend":""}', 1, 0, 3, '', '', 1, 0, '{"robots":"","author":"","rights":"","xreference":""}', 0, '*', ''),
(12, 50, 'Grupos Escoteiro 2', 'grupos-escoteiro-2', '', '<p>Nunc lectus massa, lacinia ac eleifend ut, luctus sit amet purus. Aenean a ipsum at sapien ullamcorper rhoncus eu in lectus. Sed facilisis, ante vel vulputate condimentum, tortor mauris laoreet eros, et sollicitudin velit massa vel nunc. Sed eget eros quis felis tempus malesuada ut ac turpis. In hac habitasse platea dictumst. Sed arcu quam, laoreet in faucibus at, faucibus vitae est.</p>\r\n<p>Praesent massa metus, faucibus quis placerat eget, ornare id odio. Suspendisse consequat nisi vitae justo bibendum sed lacinia nibh lacinia. Nulla tincidunt tincidunt ornare. Duis ante mi, euismod nec suscipit sit amet, dignissim a urna. Aenean commodo ligula sed urna volutpat sodales. Vivamus nec lorem laoreet orci viverra eleifend sed sed tellus. Morbi non sapien nec odio aliquam consequat. Mauris vitae urna ac purus interdum euismod sed ut urna. Integer tortor lectus, suscipit non venenatis iaculis, porttitor vel felis. Phasellus mauris nulla, semper nec mattis non, tempus in elit. Pellentesque nisi enim, sollicitudin eu elementum eget, ultrices eu elit. Aenean lacus ligula, ultrices sit amet malesuada in, ullamcorper ut nisi. Aliquam erat volutpat. Etiam condimentum magna at sapien aliquam et convallis libero semper.</p>\r\n<p>Cras tellus nulla, semper aliquet molestie eu, tempor ac urna. Etiam viverra faucibus eros sit amet faucibus. Ut at nisi nunc. In nec eros libero, eu elementum ipsum. Etiam at nisl vel nunc egestas luctus. Aenean non purus quis dui semper cursus nec vel massa. Nullam non est lectus, nec pretium nibh. Fusce blandit, nisi vel euismod iaculis, mauris quam imperdiet lectus, non bibendum mauris mi in arcu. Fusce libero est, tempor id fermentum nec, tempor pretium metus. Nunc fermentum enim iaculis nunc gravida ornare. Nam vehicula tellus consequat velit tincidunt imperdiet. Nulla elementum elementum porttitor.</p>', '', 1, 0, 0, 2, '2012-03-06 12:23:44', 42, '', '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', '2012-03-06 12:23:44', '0000-00-00 00:00:00', '{"image_intro":"","float_intro":"","image_intro_alt":"","image_intro_caption":"","image_fulltext":"","float_fulltext":"","image_fulltext_alt":"","image_fulltext_caption":""}', '{"urla":null,"urlatext":"","targeta":"","urlb":null,"urlbtext":"","targetb":"","urlc":null,"urlctext":"","targetc":""}', '{"show_title":"","link_titles":"","show_intro":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_vote":"","show_hits":"","show_noauth":"","urls_position":"","alternative_readmore":"","article_layout":"","show_publishing_options":"","show_article_options":"","show_urls_images_backend":"","show_urls_images_frontend":""}', 1, 0, 2, '', '', 1, 0, '{"robots":"","author":"","rights":"","xreference":""}', 0, '*', ''),
(13, 51, 'Registro', 'registro', '', '<p>Donec interdum orci at mauris egestas at iaculis odio dapibus. Nullam at commodo quam. Aliquam eleifend erat eu nisl faucibus eleifend. Sed imperdiet malesuada turpis, quis gravida nisl ullamcorper a. Duis at dignissim leo. Nunc lectus massa, lacinia ac eleifend ut, luctus sit amet purus. Aenean a ipsum at sapien ullamcorper rhoncus eu in lectus. Sed facilisis, ante vel vulputate condimentum, tortor mauris laoreet eros, et sollicitudin velit massa vel nunc. Sed eget eros quis felis tempus malesuada ut ac turpis. In hac habitasse platea dictumst. Sed arcu quam, laoreet in faucibus at, faucibus vitae est.</p>', '', 1, 0, 0, 12, '2012-03-06 12:24:00', 42, '', '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', '2012-03-06 12:24:00', '0000-00-00 00:00:00', '{"image_intro":"","float_intro":"","image_intro_alt":"","image_intro_caption":"","image_fulltext":"","float_fulltext":"","image_fulltext_alt":"","image_fulltext_caption":""}', '{"urla":null,"urlatext":"","targeta":"","urlb":null,"urlbtext":"","targetb":"","urlc":null,"urlctext":"","targetc":""}', '{"show_title":"","link_titles":"","show_intro":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_vote":"","show_hits":"","show_noauth":"","urls_position":"","alternative_readmore":"","article_layout":"","show_publishing_options":"","show_article_options":"","show_urls_images_backend":"","show_urls_images_frontend":""}', 1, 0, 0, '', '', 1, 11, '{"robots":"","author":"","rights":"","xreference":""}', 0, '*', ''),
(15, 54, 'Quisque eleifend, purus quis sagittis euismod', 'quisque-eleifend-purus-quis-sagittis-euismod-felis-diam-dapibus-justo', '', '<p><img src="images/noticias/_boy_scout_camp_3.jpg" border="0" width="100" style="border: 0pt none;" /> Imperdiet arcu a elit fermentum condimentum nec vitae justo.</p>\r\n', '\r\n<p>Nunc ultricies molestie pretium. Nulla at rhoncus est. Sed non lorem ac turpis cursus molestie a lacinia nibh. Nulla sollicitudin dignissim porta. Etiam viverra tristique cursus. Donec auctor, nisl placerat rhoncus tempus, sapien dui congue odio, sed imperdiet ipsum purus vitae neque.</p>\r\n<p>Nam vitae ante leo, in consectetur turpis. Quisque eleifend, purus quis sagittis euismod, felis diam dapibus justo, eu tincidunt sem neque ut lorem. Praesent non leo id est hendrerit posuere. Phasellus dolor magna, mattis at hendrerit ut, porta eget neque. Pellentesque tincidunt fermentum risus, euismod auctor libero eleifend eget. Morbi non nisi eget elit malesuada pulvinar et ultricies lacus. Nullam laoreet massa rhoncus orci fringilla nec semper urna mattis. Maecenas et lectus justo, et mollis ipsum.</p>', 1, 0, 0, 13, '2012-03-06 02:48:04', 42, '', '2012-03-10 22:50:18', 42, 0, '0000-00-00 00:00:00', '2012-03-06 02:48:04', '0000-00-00 00:00:00', '{"image_intro":"images\\/noticias\\/scout3.jpg","float_intro":"left","image_intro_alt":"boy","image_intro_caption":"boy","image_fulltext":"","float_fulltext":"left","image_fulltext_alt":"boy","image_fulltext_caption":"boy"}', '{"urla":null,"urlatext":"","targeta":"","urlb":null,"urlbtext":"","targetb":"","urlc":null,"urlctext":"","targetc":""}', '{"show_title":"","link_titles":"","show_intro":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_vote":"","show_hits":"","show_noauth":"","urls_position":"","alternative_readmore":"","article_layout":"","show_publishing_options":"","show_article_options":"","show_urls_images_backend":"","show_urls_images_frontend":""}', 12, 0, 3, '', '', 1, 8, '{"robots":"","author":"","rights":"","xreference":""}', 0, '*', ''),
(16, 55, 'Vestibulum nulla lectus, auctor a commo', 'vestibulum-nulla-lectus-auctor-a-commo', '', '<p><img src="images/noticias/_boy_scout_camp_3.jpg" border="0" alt="" width="222" height="197" /> Imperdiet arcu a elit fermentum condimentum nec vitae justo.</p>\r\n', '\r\n<p>Donec et gravida lectus. Quisque adipiscing, neque at dapibus sollicitudin, nisl risus eleifend ante, non convallis orci est et dolor. Nulla semper diam non felis pellentesque eget vestibulum risus iaculis. Fusce quis nibh dui. Integer quis massa eget nisi laoreet vehicula vulputate non justo. Vestibulum at ante libero. Curabitur lorem risus, consequat ac venenatis vel, congue ac tortor.</p>\r\n<p>Etiam ut elit ligula. Phasellus tempus consequat odio. Aliquam nulla est, facilisis vel viverra eget, accumsan a erat. Sed pretium, risus eget porttitor mattis, lorem felis lobortis lectus, vel pellentesque nunc quam a sem. Quisque molestie tortor eget risus sagittis a vehicula eros porttitor. Nullam libero nisl, bibendum ac ullamcorper pulvinar, ultricies sit amet nisi. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Ut ipsum ante, faucibus nec mattis ut, sagittis et ligula. Donec vehicula mattis sem, consectetur euismod lacus eleifend ut. Nulla dui diam, commodo eu porttitor eu, dignissim eu nisi. Nullam eget est nec orci lobortis fermentum. Curabitur laoreet leo at sapien volutpat gravida. Praesent id magna erat.</p>', 1, 0, 0, 13, '2012-03-06 02:46:57', 42, '', '2012-03-10 22:50:34', 42, 0, '0000-00-00 00:00:00', '2012-03-06 02:46:57', '0000-00-00 00:00:00', '{"image_intro":"images\\/noticias\\/scout.jpg","float_intro":"","image_intro_alt":"","image_intro_caption":"","image_fulltext":"","float_fulltext":"","image_fulltext_alt":"","image_fulltext_caption":""}', '{"urla":null,"urlatext":"","targeta":"","urlb":null,"urlbtext":"","targetb":"","urlc":null,"urlctext":"","targetc":""}', '{"show_title":"","link_titles":"","show_intro":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_vote":"","show_hits":"","show_noauth":"","urls_position":"","alternative_readmore":"","article_layout":"","show_publishing_options":"","show_article_options":"","show_urls_images_backend":"","show_urls_images_frontend":""}', 12, 0, 5, '', '', 1, 10, '{"robots":"","author":"","rights":"","xreference":""}', 0, '*', ''),
(17, 57, 'UNIÃO DOS ESCOTEIROS DO BRASIL', 'uniao-dos-escoteiros-do-brasil', '', '<p>Rua Coronel Dulcídio, 2107 - Bairro Água Verde<br /> CEP 80250-100 - Curitiba - Paraná - Brasil<br /> (41) 3353-4732</p>', '', 1, 0, 0, 2, '2012-03-10 22:55:37', 42, '', '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', '2012-03-10 22:55:37', '0000-00-00 00:00:00', '{"image_intro":"","float_intro":"","image_intro_alt":"","image_intro_caption":"","image_fulltext":"","float_fulltext":"","image_fulltext_alt":"","image_fulltext_caption":""}', '{"urla":null,"urlatext":"","targeta":"","urlb":null,"urlbtext":"","targetb":"","urlc":null,"urlctext":"","targetc":""}', '{"show_title":"","link_titles":"","show_intro":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_vote":"","show_hits":"","show_noauth":"","urls_position":"","alternative_readmore":"","article_layout":"","show_publishing_options":"","show_article_options":"","show_urls_images_backend":"","show_urls_images_frontend":""}', 1, 0, 1, '', '', 1, 0, '{"robots":"","author":"","rights":"","xreference":""}', 0, '*', ''),
(18, 59, 'Listagem de Pessoas', 'listagem-de-pessoas', '', '<p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry''s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.</p>\r\n<p><img src="images/noticias/pessoa.jpg" border="0" alt="" style="float: left;" /></p>\r\n<h3>Nome da Pessoa</h3>\r\n<p>Função/Cargo</p>\r\n<p>Mandato (opcional)</p>\r\n<hr />\r\n<p><img src="images/noticias/pessoa.jpg" border="0" alt="" style="float: left;" /></p>\r\n<h3>Nome da Pessoa</h3>\r\n<p>Função/Cargo</p>\r\n<p>Mandato (opcional)</p>\r\n<hr />', '', 1, 0, 0, 16, '2012-03-12 14:07:59', 42, '', '2012-03-13 02:59:59', 42, 0, '0000-00-00 00:00:00', '2012-03-12 14:07:59', '0000-00-00 00:00:00', '{"image_intro":"","float_intro":"","image_intro_alt":"","image_intro_caption":"","image_fulltext":"","float_fulltext":"","image_fulltext_alt":"","image_fulltext_caption":""}', '{"urla":null,"urlatext":"","targeta":"","urlb":null,"urlbtext":"","targetb":"","urlc":null,"urlctext":"","targetc":""}', '{"show_title":"","link_titles":"","show_intro":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_vote":"","show_hits":"","show_noauth":"","urls_position":"","alternative_readmore":"","article_layout":"","show_publishing_options":"","show_article_options":"","show_urls_images_backend":"","show_urls_images_frontend":""}', 8, 0, 0, 'Institucional', '', 1, 20, '{"robots":"","author":"","rights":"","xreference":""}', 0, '*', ''),
(19, 62, 'Downloads', 'downloads', '', '<p><img src="images/noticias/indisponivel.jpg" border="0" alt="" style="float: left;" /></p>\r\n<h3>Título do Arquivo</h3>\r\n<p>Descrição do arquivo.</p>\r\n<p><a class="download" href="#">ARQUIVO PDF (30K)</a></p>\r\n<hr />\r\n<p><img src="images/noticias/indisponivel.jpg" border="0" alt="" style="float: left;" /></p>\r\n<h3>Título do Arquivo</h3>\r\n<p>Descrição do arquivo.</p>\r\n<p><a class="download" href="#">ARQUIVO PDF (30K)</a></p>', '', 1, 0, 0, 9, '2012-03-13 02:32:04', 42, '', '2012-03-28 13:25:46', 42, 0, '0000-00-00 00:00:00', '2012-03-13 02:32:04', '0000-00-00 00:00:00', '{"image_intro":"","float_intro":"","image_intro_alt":"","image_intro_caption":"","image_fulltext":"","float_fulltext":"","image_fulltext_alt":"","image_fulltext_caption":""}', '{"urla":null,"urlatext":"","targeta":"1","urlb":null,"urlbtext":"","targetb":"","urlc":null,"urlctext":"","targetc":""}', '{"show_title":"","link_titles":"","show_intro":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_vote":"","show_hits":"","show_noauth":"","urls_position":"0","alternative_readmore":"","article_layout":"","show_publishing_options":"","show_article_options":"","show_urls_images_backend":"","show_urls_images_frontend":""}', 11, 0, 0, '', '', 1, 44, '{"robots":"","author":"","rights":"","xreference":""}', 0, '*', ''),
(20, 63, 'Curso de Formadores - N1', 'curso-de-formadores-n1', '', '<p>de 3 a 6 de junho de 2010</p>\r\n', '\r\n<p> O Curso de Formadores, seguindo as novas regras das Diretrizes Nacionais de Gestão de Adultos, acontecerá em brasília, de 3 a 6 de junho de 2010.</p>\r\n<p><a class="external">Carta de Divulgação do Curso de Formadores - Nível 1</a></p>\r\n<p> </p>\r\n<p><a class="external">Ficha de Inscrição</a></p>\r\n<p> </p>', 1, 0, 0, 10, '2012-03-13 14:03:00', 42, '', '2012-03-28 13:35:39', 42, 0, '0000-00-00 00:00:00', '2012-03-13 14:03:00', '0000-00-00 00:00:00', '{"image_intro":"images\\/noticias\\/imgexemplo.png","float_intro":"","image_intro_alt":"","image_intro_caption":"","image_fulltext":"","float_fulltext":"","image_fulltext_alt":"","image_fulltext_caption":""}', '{"urla":null,"urlatext":"","targeta":"","urlb":null,"urlbtext":"","targetb":"","urlc":null,"urlctext":"","targetc":""}', '{"show_title":"","link_titles":"","show_intro":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_vote":"","show_hits":"","show_noauth":"","urls_position":"","alternative_readmore":"","article_layout":"","show_publishing_options":"","show_article_options":"","show_urls_images_backend":"","show_urls_images_frontend":""}', 4, 0, 1, '', '', 1, 19, '{"robots":"","author":"","rights":"","xreference":""}', 0, '*', ''),
(21, 64, 'XIX Mutirão Nacional Escoteiro de Ação Ecológica', 'xix-mutirao-nacional-escoteiro-de-acao-ecologica', '', '<p><img src="images/noticias/imgexemplo.png" border="0" alt="" style="float: left;" />05 de junho de 2010</p>\r\n', '\r\n<p> Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam id tortor turpis, ac lacinia nisl. Aliquam semper, libero eu hendrerit posuere, nulla augue pulvinar sapien, quis luctus ipsum orci quis ligula. Cras laoreet pellentesque lorem, et iaculis augue congue vel.</p>', 1, 0, 0, 10, '2012-03-13 14:03:51', 42, '', '2012-03-28 13:36:06', 42, 0, '0000-00-00 00:00:00', '2012-03-13 14:03:51', '0000-00-00 00:00:00', '{"image_intro":"images\\/noticias\\/imgexemplo.png","float_intro":"","image_intro_alt":"","image_intro_caption":"","image_fulltext":"","float_fulltext":"","image_fulltext_alt":"","image_fulltext_caption":""}', '{"urla":null,"urlatext":"","targeta":"","urlb":null,"urlbtext":"","targetb":"","urlc":null,"urlctext":"","targetc":""}', '{"show_title":"","link_titles":"","show_intro":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_vote":"","show_hits":"","show_noauth":"","urls_position":"","alternative_readmore":"","article_layout":"","show_publishing_options":"","show_article_options":"","show_urls_images_backend":"","show_urls_images_frontend":""}', 5, 0, 0, '', '', 1, 4, '{"robots":"","author":"","rights":"","xreference":""}', 0, '*', ''),
(22, 65, 'XIII Jamboree Panamericano', 'xiii-jamboree-panamericano', '', '<p><img src="images/noticias/imgexemplo.png" border="0" alt="" style="float: left;" />de 10 a 18 de julho</p>\r\n', '\r\n<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam id tortor turpis, ac lacinia nisl. Aliquam semper, libero eu hendrerit posuere, nulla augue pulvinar sapien, quis luctus ipsum orci quis ligula. Cras laoreet pellentesque lorem, et iaculis augue congue vel.</p>\r\n<p> </p>', 1, 0, 0, 10, '2012-03-13 14:04:48', 42, '', '2012-03-13 14:12:18', 42, 0, '0000-00-00 00:00:00', '2012-03-13 14:04:48', '0000-00-00 00:00:00', '{"image_intro":"","float_intro":"","image_intro_alt":"","image_intro_caption":"","image_fulltext":"","float_fulltext":"","image_fulltext_alt":"","image_fulltext_caption":""}', '{"urla":null,"urlatext":"","targeta":"","urlb":null,"urlbtext":"","targetb":"","urlc":null,"urlctext":"","targetc":""}', '{"show_title":"","link_titles":"","show_intro":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_vote":"","show_hits":"","show_noauth":"","urls_position":"","alternative_readmore":"","article_layout":"","show_publishing_options":"","show_article_options":"","show_urls_images_backend":"","show_urls_images_frontend":""}', 2, 0, 0, '', '', 1, 2, '{"robots":"","author":"","rights":"","xreference":""}', 0, '*', ''),
(23, 66, 'Aventura Escoteira Nacional Sênior e Guia', 'aventura-escoteira-nacional-senior-e-guia', '', '<p>de 17 a 21 de julho de 2010</p>\r\n', '\r\n<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam id tortor turpis, ac lacinia nisl. Aliquam semper, libero eu hendrerit posuere, nulla augue pulvinar sapien, quis luctus ipsum orci quis ligula. Cras laoreet pellentesque lorem, et iaculis augue congue vel.</p>\r\n<p> </p>', 1, 0, 0, 10, '2012-03-13 14:05:26', 42, '', '2012-03-28 13:34:53', 42, 0, '0000-00-00 00:00:00', '2012-03-13 14:05:26', '0000-00-00 00:00:00', '{"image_intro":"images\\/noticias\\/imgexemplo.png","float_intro":"","image_intro_alt":"","image_intro_caption":"","image_fulltext":"","float_fulltext":"","image_fulltext_alt":"","image_fulltext_caption":""}', '{"urla":null,"urlatext":"","targeta":"","urlb":null,"urlbtext":"","targetb":"","urlc":null,"urlctext":"","targetc":""}', '{"show_title":"","link_titles":"","show_intro":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_vote":"","show_hits":"","show_noauth":"","urls_position":"","alternative_readmore":"","article_layout":"","show_publishing_options":"","show_article_options":"","show_urls_images_backend":"","show_urls_images_frontend":""}', 5, 0, 0, '', '', 1, 7, '{"robots":"","author":"","rights":"","xreference":""}', 0, '*', ''),
(24, 67, 'Grupo Escoteiro', 'grupo-escoteiro', '', '<div class="coluna2-interna">\r\n<div class="escritorio">\r\n<div class="endereco">Rua Endereço, 000</div>\r\n<div class="atendimento"><span>Atendimento</span><br /> (00) 0000-0000<br /> <a href="http://www.grupoescoteiro.com.br/" title="Visite www.grupoescoteiro.com.br">www.grupoescoteiro.com.br</a><br /> <a href="mailto:grupoescoteiro@grupoescoteiro.com.br" title="Enviar e-mail para grupoescoteiro@grupoescoteiro.com.br">grupoescoteiro@grupoescoteiro.com.br</a></div>\r\n</div>\r\n<div class="hr"> </div>\r\n</div>', '', 1, 0, 0, 11, '2012-03-28 12:53:14', 42, '', '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', '2012-03-28 12:53:14', '0000-00-00 00:00:00', '{"image_intro":"","float_intro":"","image_intro_alt":"","image_intro_caption":"","image_fulltext":"","float_fulltext":"","image_fulltext_alt":"","image_fulltext_caption":""}', '{"urla":null,"urlatext":"","targeta":"","urlb":null,"urlbtext":"","targetb":"","urlc":null,"urlctext":"","targetc":""}', '{"show_title":"","link_titles":"","show_intro":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_vote":"","show_hits":"","show_noauth":"","urls_position":"","alternative_readmore":"","article_layout":"","show_publishing_options":"","show_article_options":"","show_urls_images_backend":"","show_urls_images_frontend":""}', 1, 0, 3, '', '', 1, 0, '{"robots":"","author":"","rights":"","xreference":""}', 0, '*', ''),
(25, 68, 'Grupo Escoteiro 2', 'grupo-escoteiro-2', '', '<div class="estado">\r\n<div class="coluna2-interna">\r\n<div class="escritorio">\r\n<div class="endereco">Rua Endereço, 000</div>\r\n<div class="atendimento"><span>Atendimento</span><br /> (00) 0000-0000<br /> <a href="http://www.grupoescoteiro.com.br/" title="Visite www.grupoescoteiro.com.br">www.grupoescoteiro.com.br</a><br /> <a href="mailto:grupoescoteiro@grupoescoteiro.com.br" title="Enviar e-mail para grupoescoteiro@grupoescoteiro.com.br">grupoescoteiro@grupoescoteiro.com.br</a></div>\r\n</div>\r\n<div class="hr"> </div>\r\n</div>\r\n</div>', '', 1, 0, 0, 11, '2012-03-28 12:53:39', 42, '', '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', '2012-03-28 12:53:39', '0000-00-00 00:00:00', '{"image_intro":"","float_intro":"","image_intro_alt":"","image_intro_caption":"","image_fulltext":"","float_fulltext":"","image_fulltext_alt":"","image_fulltext_caption":""}', '{"urla":null,"urlatext":"","targeta":"","urlb":null,"urlbtext":"","targetb":"","urlc":null,"urlctext":"","targetc":""}', '{"show_title":"","link_titles":"","show_intro":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_vote":"","show_hits":"","show_noauth":"","urls_position":"","alternative_readmore":"","article_layout":"","show_publishing_options":"","show_article_options":"","show_urls_images_backend":"","show_urls_images_frontend":""}', 1, 0, 2, '', '', 1, 0, '{"robots":"","author":"","rights":"","xreference":""}', 0, '*', '');
INSERT INTO `ueb_content` (`id`, `asset_id`, `title`, `alias`, `title_alias`, `introtext`, `fulltext`, `state`, `sectionid`, `mask`, `catid`, `created`, `created_by`, `created_by_alias`, `modified`, `modified_by`, `checked_out`, `checked_out_time`, `publish_up`, `publish_down`, `images`, `urls`, `attribs`, `version`, `parentid`, `ordering`, `metakey`, `metadesc`, `access`, `hits`, `metadata`, `featured`, `language`, `xreference`) VALUES
(26, 69, 'Grupo Escoteiro 3', 'grupo-escoteiro-3', '', '<div class="estado">\r\n<div class="coluna2-interna">\r\n<div class="escritorio">\r\n<div class="endereco">Rua Endereço, 000</div>\r\n<div class="atendimento"><span>Atendimento</span><br /> (00) 0000-0000<br /> <a href="http://www.grupoescoteiro.com.br/" title="Visite www.grupoescoteiro.com.br">www.grupoescoteiro.com.br</a><br /> <a href="mailto:grupoescoteiro@grupoescoteiro.com.br" title="Enviar e-mail para grupoescoteiro@grupoescoteiro.com.br">grupoescoteiro@grupoescoteiro.com.br</a></div>\r\n</div>\r\n<div class="hr"> </div>\r\n</div>\r\n</div>', '', 1, 0, 0, 11, '2012-03-28 12:53:55', 42, '', '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', '2012-03-28 12:53:55', '0000-00-00 00:00:00', '{"image_intro":"","float_intro":"","image_intro_alt":"","image_intro_caption":"","image_fulltext":"","float_fulltext":"","image_fulltext_alt":"","image_fulltext_caption":""}', '{"urla":null,"urlatext":"","targeta":"","urlb":null,"urlbtext":"","targetb":"","urlc":null,"urlctext":"","targetc":""}', '{"show_title":"","link_titles":"","show_intro":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_vote":"","show_hits":"","show_noauth":"","urls_position":"","alternative_readmore":"","article_layout":"","show_publishing_options":"","show_article_options":"","show_urls_images_backend":"","show_urls_images_frontend":""}', 1, 0, 1, '', '', 1, 0, '{"robots":"","author":"","rights":"","xreference":""}', 0, '*', ''),
(27, 70, 'Grupo Escoteiro 4', 'grupo-escoteiro-4', '', '<div class="estado">\r\n<div class="coluna2-interna">\r\n<div class="escritorio">\r\n<div class="endereco">Rua Endereço, 000</div>\r\n<div class="atendimento"><span>Atendimento</span><br /> (00) 0000-0000<br /> <a href="http://www.grupoescoteiro.com.br/" title="Visite www.grupoescoteiro.com.br">www.grupoescoteiro.com.br</a><br /> <a href="mailto:grupoescoteiro@grupoescoteiro.com.br" title="Enviar e-mail para grupoescoteiro@grupoescoteiro.com.br">grupoescoteiro@grupoescoteiro.com.br</a></div>\r\n</div>\r\n<div class="hr"> </div>\r\n</div>\r\n</div>', '', 1, 0, 0, 11, '2012-03-28 12:54:10', 42, '', '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', '2012-03-28 12:54:10', '0000-00-00 00:00:00', '{"image_intro":"","float_intro":"","image_intro_alt":"","image_intro_caption":"","image_fulltext":"","float_fulltext":"","image_fulltext_alt":"","image_fulltext_caption":""}', '{"urla":null,"urlatext":"","targeta":"","urlb":null,"urlbtext":"","targetb":"","urlc":null,"urlctext":"","targetc":""}', '{"show_title":"","link_titles":"","show_intro":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_vote":"","show_hits":"","show_noauth":"","urls_position":"","alternative_readmore":"","article_layout":"","show_publishing_options":"","show_article_options":"","show_urls_images_backend":"","show_urls_images_frontend":""}', 1, 0, 0, '', '', 1, 1, '{"robots":"","author":"","rights":"","xreference":""}', 0, '*', '');

-- --------------------------------------------------------

--
-- Estrutura da tabela `ueb_content_frontpage`
--

DROP TABLE IF EXISTS `ueb_content_frontpage`;
CREATE TABLE IF NOT EXISTS `ueb_content_frontpage` (
  `content_id` int(11) NOT NULL DEFAULT '0',
  `ordering` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`content_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `ueb_content_frontpage`
--


-- --------------------------------------------------------

--
-- Estrutura da tabela `ueb_content_rating`
--

DROP TABLE IF EXISTS `ueb_content_rating`;
CREATE TABLE IF NOT EXISTS `ueb_content_rating` (
  `content_id` int(11) NOT NULL DEFAULT '0',
  `rating_sum` int(10) unsigned NOT NULL DEFAULT '0',
  `rating_count` int(10) unsigned NOT NULL DEFAULT '0',
  `lastip` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`content_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `ueb_content_rating`
--


-- --------------------------------------------------------

--
-- Estrutura da tabela `ueb_core_log_searches`
--

DROP TABLE IF EXISTS `ueb_core_log_searches`;
CREATE TABLE IF NOT EXISTS `ueb_core_log_searches` (
  `search_term` varchar(128) NOT NULL DEFAULT '',
  `hits` int(10) unsigned NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `ueb_core_log_searches`
--


-- --------------------------------------------------------

--
-- Estrutura da tabela `ueb_extensions`
--

DROP TABLE IF EXISTS `ueb_extensions`;
CREATE TABLE IF NOT EXISTS `ueb_extensions` (
  `extension_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `type` varchar(20) NOT NULL,
  `element` varchar(100) NOT NULL,
  `folder` varchar(100) NOT NULL,
  `client_id` tinyint(3) NOT NULL,
  `enabled` tinyint(3) NOT NULL DEFAULT '1',
  `access` int(10) unsigned NOT NULL DEFAULT '1',
  `protected` tinyint(3) NOT NULL DEFAULT '0',
  `manifest_cache` text NOT NULL,
  `params` text NOT NULL,
  `custom_data` text NOT NULL,
  `system_data` text NOT NULL,
  `checked_out` int(10) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `ordering` int(11) DEFAULT '0',
  `state` int(11) DEFAULT '0',
  PRIMARY KEY (`extension_id`),
  KEY `element_clientid` (`element`,`client_id`),
  KEY `element_folder_clientid` (`element`,`folder`,`client_id`),
  KEY `extension` (`type`,`element`,`folder`,`client_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=10028 ;

--
-- Extraindo dados da tabela `ueb_extensions`
--

INSERT INTO `ueb_extensions` (`extension_id`, `name`, `type`, `element`, `folder`, `client_id`, `enabled`, `access`, `protected`, `manifest_cache`, `params`, `custom_data`, `system_data`, `checked_out`, `checked_out_time`, `ordering`, `state`) VALUES
(1, 'com_mailto', 'component', 'com_mailto', '', 0, 1, 1, 1, '{"legacy":false,"name":"com_mailto","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2012 Open Source Matters. All rights reserved.\\t","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"COM_MAILTO_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(2, 'com_wrapper', 'component', 'com_wrapper', '', 0, 1, 1, 1, '{"legacy":false,"name":"com_wrapper","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2012 Open Source Matters. All rights reserved.\\n\\t","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"COM_WRAPPER_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(3, 'com_admin', 'component', 'com_admin', '', 1, 1, 1, 1, '{"legacy":false,"name":"com_admin","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2012 Open Source Matters. All rights reserved.\\n\\t","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"COM_ADMIN_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(4, 'com_banners', 'component', 'com_banners', '', 1, 1, 1, 0, '{"legacy":false,"name":"com_banners","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2012 Open Source Matters. All rights reserved.\\n\\t","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"COM_BANNERS_XML_DESCRIPTION","group":""}', '{"purchase_type":"3","track_impressions":"0","track_clicks":"0","metakey_prefix":""}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(5, 'com_cache', 'component', 'com_cache', '', 1, 1, 1, 1, '{"legacy":false,"name":"com_cache","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2012 Open Source Matters. All rights reserved.\\t","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"COM_CACHE_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(6, 'com_categories', 'component', 'com_categories', '', 1, 1, 1, 1, '{"legacy":false,"name":"com_categories","type":"component","creationDate":"December 2007","author":"Joomla! Project","copyright":"(C) 2005 - 2012 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"COM_CATEGORIES_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(7, 'com_checkin', 'component', 'com_checkin', '', 1, 1, 1, 1, '{"legacy":false,"name":"com_checkin","type":"component","creationDate":"Unknown","author":"Joomla! Project","copyright":"(C) 2005 - 2008 Open Source Matters. All rights reserved.\\n\\t","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"COM_CHECKIN_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(8, 'com_contact', 'component', 'com_contact', '', 1, 1, 1, 0, '{"legacy":false,"name":"com_contact","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2012 Open Source Matters. All rights reserved.\\n\\t","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"COM_CONTACT_XML_DESCRIPTION","group":""}', '{"show_contact_category":"hide","show_contact_list":"0","presentation_style":"sliders","show_name":"1","show_position":"1","show_email":"0","show_street_address":"1","show_suburb":"1","show_state":"1","show_postcode":"1","show_country":"1","show_telephone":"1","show_mobile":"1","show_fax":"1","show_webpage":"1","show_misc":"1","show_image":"1","image":"","allow_vcard":"0","show_articles":"0","show_profile":"0","show_links":"0","linka_name":"","linkb_name":"","linkc_name":"","linkd_name":"","linke_name":"","contact_icons":"0","icon_address":"","icon_email":"","icon_telephone":"","icon_mobile":"","icon_fax":"","icon_misc":"","show_headings":"1","show_position_headings":"1","show_email_headings":"0","show_telephone_headings":"1","show_mobile_headings":"0","show_fax_headings":"0","allow_vcard_headings":"0","show_suburb_headings":"1","show_state_headings":"1","show_country_headings":"1","show_email_form":"1","show_email_copy":"1","banned_email":"","banned_subject":"","banned_text":"","validate_session":"1","custom_reply":"0","redirect":"","show_category_crumb":"0","metakey":"","metadesc":"","robots":"","author":"","rights":"","xreference":""}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(9, 'com_cpanel', 'component', 'com_cpanel', '', 1, 1, 1, 1, '{"legacy":false,"name":"com_cpanel","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2012 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"COM_CPANEL_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10, 'com_installer', 'component', 'com_installer', '', 1, 1, 1, 1, '{"legacy":false,"name":"com_installer","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2012 Open Source Matters. All rights reserved.\\t","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"COM_INSTALLER_XML_DESCRIPTION","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(11, 'com_languages', 'component', 'com_languages', '', 1, 1, 1, 1, '{"legacy":false,"name":"com_languages","type":"component","creationDate":"2006","author":"Joomla! Project","copyright":"(C) 2005 - 2012 Open Source Matters. All rights reserved.\\n\\t","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"COM_LANGUAGES_XML_DESCRIPTION","group":""}', '{"administrator":"pt-BR","site":"pt-BR"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(12, 'com_login', 'component', 'com_login', '', 1, 1, 1, 1, '{"legacy":false,"name":"com_login","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2012 Open Source Matters. All rights reserved.\\t","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"COM_LOGIN_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(13, 'com_media', 'component', 'com_media', '', 1, 1, 0, 1, '{"legacy":false,"name":"com_media","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2012 Open Source Matters. All rights reserved.\\t","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"COM_MEDIA_XML_DESCRIPTION","group":""}', '{"upload_extensions":"bmp,csv,doc,gif,ico,jpg,jpeg,odg,odp,ods,odt,pdf,png,ppt,swf,txt,xcf,xls,BMP,CSV,DOC,GIF,ICO,JPG,JPEG,ODG,ODP,ODS,ODT,PDF,PNG,PPT,SWF,TXT,XCF,XLS","upload_maxsize":"10","file_path":"images","image_path":"images","restrict_uploads":"1","allowed_media_usergroup":"3","check_mime":"1","image_extensions":"bmp,gif,jpg,png","ignore_extensions":"","upload_mime":"image\\/jpeg,image\\/gif,image\\/png,image\\/bmp,application\\/x-shockwave-flash,application\\/msword,application\\/excel,application\\/pdf,application\\/powerpoint,text\\/plain,application\\/x-zip","upload_mime_illegal":"text\\/html","enable_flash":"0"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(14, 'com_menus', 'component', 'com_menus', '', 1, 1, 1, 1, '{"legacy":false,"name":"com_menus","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2012 Open Source Matters. All rights reserved.\\t","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"COM_MENUS_XML_DESCRIPTION","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(15, 'com_messages', 'component', 'com_messages', '', 1, 1, 1, 1, '{"legacy":false,"name":"com_messages","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2012 Open Source Matters. All rights reserved.\\t","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"COM_MESSAGES_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(16, 'com_modules', 'component', 'com_modules', '', 1, 1, 1, 1, '{"legacy":false,"name":"com_modules","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2012 Open Source Matters. All rights reserved.\\t","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"COM_MODULES_XML_DESCRIPTION","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(17, 'com_newsfeeds', 'component', 'com_newsfeeds', '', 1, 1, 1, 0, '{"legacy":false,"name":"com_newsfeeds","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2012 Open Source Matters. All rights reserved.\\t","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"COM_NEWSFEEDS_XML_DESCRIPTION","group":""}', '{"show_feed_image":"1","show_feed_description":"1","show_item_description":"1","feed_word_count":"0","show_headings":"1","show_name":"1","show_articles":"0","show_link":"1","show_description":"1","show_description_image":"1","display_num":"","show_pagination_limit":"1","show_pagination":"1","show_pagination_results":"1","show_cat_items":"1"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(18, 'com_plugins', 'component', 'com_plugins', '', 1, 1, 1, 1, '{"legacy":false,"name":"com_plugins","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2012 Open Source Matters. All rights reserved.\\t","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"COM_PLUGINS_XML_DESCRIPTION","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(19, 'com_search', 'component', 'com_search', '', 1, 1, 1, 1, '{"legacy":false,"name":"com_search","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2012 Open Source Matters. All rights reserved.\\n\\t","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"COM_SEARCH_XML_DESCRIPTION","group":""}', '{"enabled":"0","show_date":"1"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(20, 'com_templates', 'component', 'com_templates', '', 1, 1, 1, 1, '{"legacy":false,"name":"com_templates","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2012 Open Source Matters. All rights reserved.\\t","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"COM_TEMPLATES_XML_DESCRIPTION","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(21, 'com_weblinks', 'component', 'com_weblinks', '', 1, 1, 1, 0, '{"legacy":false,"name":"com_weblinks","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2012 Open Source Matters. All rights reserved.\\n\\t","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"COM_WEBLINKS_XML_DESCRIPTION","group":""}', '{"show_comp_description":"1","comp_description":"","show_link_hits":"1","show_link_description":"1","show_other_cats":"0","show_headings":"0","show_numbers":"0","show_report":"1","count_clicks":"1","target":"0","link_icons":""}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(22, 'com_content', 'component', 'com_content', '', 1, 1, 0, 1, '{"legacy":false,"name":"com_content","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2012 Open Source Matters. All rights reserved.\\t","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"COM_CONTENT_XML_DESCRIPTION","group":""}', '{"article_layout":"_:default","show_title":"1","link_titles":"1","show_intro":"1","show_category":"0","link_category":"1","show_parent_category":"0","link_parent_category":"0","show_author":"0","link_author":"0","show_create_date":"0","show_modify_date":"0","show_publish_date":"0","show_item_navigation":"0","show_vote":"0","show_readmore":"1","show_readmore_title":"1","readmore_limit":"100","show_icons":"0","show_print_icon":"0","show_email_icon":"0","show_hits":"0","show_noauth":"0","urls_position":"0","show_publishing_options":"1","show_article_options":"1","show_urls_images_frontend":"1","show_urls_images_backend":"1","targeta":0,"targetb":0,"targetc":0,"float_intro":"left","float_fulltext":"left","category_layout":"_:blog","show_category_title":"0","show_description":"0","show_description_image":"0","maxLevel":"1","show_empty_categories":"0","show_no_articles":"1","show_subcat_desc":"1","show_cat_num_articles":"0","show_base_description":"1","maxLevelcat":"-1","show_empty_categories_cat":"0","show_subcat_desc_cat":"1","show_cat_num_articles_cat":"1","num_leading_articles":"1","num_intro_articles":"4","num_columns":"2","num_links":"4","multi_column_order":"0","show_subcategory_content":"0","show_pagination_limit":"1","filter_field":"hide","show_headings":"1","list_show_date":"0","date_format":"d-m-y","list_show_hits":"1","list_show_author":"1","orderby_pri":"order","orderby_sec":"rdate","order_date":"published","show_pagination":"2","show_pagination_results":"1","show_feed_link":"1","feed_summary":"0"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(23, 'com_config', 'component', 'com_config', '', 1, 1, 0, 1, '{"legacy":false,"name":"com_config","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2012 Open Source Matters. All rights reserved.\\t","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"COM_CONFIG_XML_DESCRIPTION","group":""}', '{"filters":{"1":{"filter_type":"NH","filter_tags":"","filter_attributes":""},"6":{"filter_type":"BL","filter_tags":"","filter_attributes":""},"7":{"filter_type":"NONE","filter_tags":"","filter_attributes":""},"2":{"filter_type":"NH","filter_tags":"","filter_attributes":""},"3":{"filter_type":"BL","filter_tags":"","filter_attributes":""},"4":{"filter_type":"BL","filter_tags":"","filter_attributes":""},"5":{"filter_type":"BL","filter_tags":"","filter_attributes":""},"8":{"filter_type":"NONE","filter_tags":"","filter_attributes":""}}}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(24, 'com_redirect', 'component', 'com_redirect', '', 1, 1, 0, 1, '{"legacy":false,"name":"com_redirect","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2012 Open Source Matters. All rights reserved.\\t","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"COM_REDIRECT_XML_DESCRIPTION","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(25, 'com_users', 'component', 'com_users', '', 1, 1, 0, 1, '{"legacy":false,"name":"com_users","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2012 Open Source Matters. All rights reserved.\\t","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"COM_USERS_XML_DESCRIPTION","group":""}', '{"allowUserRegistration":"1","new_usertype":"2","useractivation":"1","frontend_userparams":"1","mailSubjectPrefix":"","mailBodySuffix":""}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(27, 'com_finder', 'component', 'com_finder', '', 1, 1, 0, 0, '{"legacy":false,"name":"com_finder","type":"component","creationDate":"August 2011","author":"Joomla! Project","copyright":"(C) 2005 - 2012 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"COM_FINDER_XML_DESCRIPTION","group":""}', '{"show_description":"1","description_length":255,"allow_empty_query":"0","show_url":"1","show_advanced":"1","expand_advanced":"0","show_date_filters":"0","highlight_terms":"1","opensearch_name":"","opensearch_description":"","batch_size":"50","memory_table_limit":30000,"title_multiplier":"1.7","text_multiplier":"0.7","meta_multiplier":"1.2","path_multiplier":"2.0","misc_multiplier":"0.3","stemmer":"snowball"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(100, 'PHPMailer', 'library', 'phpmailer', '', 0, 1, 1, 1, '{"legacy":false,"name":"PHPMailer","type":"library","creationDate":"2008","author":"PHPMailer","copyright":"Copyright (C) PHPMailer.","authorEmail":"","authorUrl":"http:\\/\\/phpmailer.codeworxtech.com\\/","version":"2.5.0","description":"LIB_PHPMAILER_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(101, 'SimplePie', 'library', 'simplepie', '', 0, 1, 1, 1, '{"legacy":false,"name":"SimplePie","type":"library","creationDate":"2008","author":"SimplePie","copyright":"Copyright (C) 2008 SimplePie","authorEmail":"","authorUrl":"http:\\/\\/simplepie.org\\/","version":"1.0.1","description":"LIB_SIMPLEPIE_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(102, 'phputf8', 'library', 'phputf8', '', 0, 1, 1, 1, '{"legacy":false,"name":"phputf8","type":"library","creationDate":"2008","author":"Harry Fuecks","copyright":"Copyright various authors","authorEmail":"","authorUrl":"http:\\/\\/sourceforge.net\\/projects\\/phputf8","version":"2.5.0","description":"LIB_PHPUTF8_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(103, 'Joomla! Web Application Framework', 'library', 'joomla', '', 0, 1, 1, 1, '{"legacy":false,"name":"Joomla! Web Application Framework","type":"library","creationDate":"2008","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2012 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"http:\\/\\/www.joomla.org","version":"2.5.0","description":"LIB_JOOMLA_XML_DESCRIPTION","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(200, 'mod_articles_archive', 'module', 'mod_articles_archive', '', 0, 1, 1, 1, '{"legacy":false,"name":"mod_articles_archive","type":"module","creationDate":"July 2006","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2012 Open Source Matters.\\n\\t\\tAll rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"MOD_ARTICLES_ARCHIVE_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(201, 'mod_articles_latest', 'module', 'mod_articles_latest', '', 0, 1, 1, 1, '{"legacy":false,"name":"mod_articles_latest","type":"module","creationDate":"July 2004","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2012 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"MOD_LATEST_NEWS_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(202, 'mod_articles_popular', 'module', 'mod_articles_popular', '', 0, 1, 1, 0, '{"legacy":false,"name":"mod_articles_popular","type":"module","creationDate":"July 2006","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2012 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"MOD_POPULAR_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(203, 'mod_banners', 'module', 'mod_banners', '', 0, 1, 1, 1, '{"legacy":false,"name":"mod_banners","type":"module","creationDate":"July 2006","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2012 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"MOD_BANNERS_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(204, 'mod_breadcrumbs', 'module', 'mod_breadcrumbs', '', 0, 1, 1, 1, '{"legacy":false,"name":"mod_breadcrumbs","type":"module","creationDate":"July 2006","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2012 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"MOD_BREADCRUMBS_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(205, 'mod_custom', 'module', 'mod_custom', '', 0, 1, 1, 1, '{"legacy":false,"name":"mod_custom","type":"module","creationDate":"July 2004","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2012 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"MOD_CUSTOM_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(206, 'mod_feed', 'module', 'mod_feed', '', 0, 1, 1, 1, '{"legacy":false,"name":"mod_feed","type":"module","creationDate":"July 2005","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2012 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"MOD_FEED_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(207, 'mod_footer', 'module', 'mod_footer', '', 0, 1, 1, 1, '{"legacy":false,"name":"mod_footer","type":"module","creationDate":"July 2006","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2012 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"MOD_FOOTER_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(208, 'mod_login', 'module', 'mod_login', '', 0, 1, 1, 1, '{"legacy":false,"name":"mod_login","type":"module","creationDate":"July 2006","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2012 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"MOD_LOGIN_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(209, 'mod_menu', 'module', 'mod_menu', '', 0, 1, 1, 1, '{"legacy":false,"name":"mod_menu","type":"module","creationDate":"July 2004","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2012 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"MOD_MENU_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(210, 'mod_articles_news', 'module', 'mod_articles_news', '', 0, 1, 1, 0, '{"legacy":false,"name":"mod_articles_news","type":"module","creationDate":"July 2006","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2012 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"MOD_ARTICLES_NEWS_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(211, 'mod_random_image', 'module', 'mod_random_image', '', 0, 1, 1, 0, '{"legacy":false,"name":"mod_random_image","type":"module","creationDate":"July 2006","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2012 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"MOD_RANDOM_IMAGE_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(212, 'mod_related_items', 'module', 'mod_related_items', '', 0, 1, 1, 0, '{"legacy":false,"name":"mod_related_items","type":"module","creationDate":"July 2004","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2012 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"MOD_RELATED_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(213, 'mod_search', 'module', 'mod_search', '', 0, 1, 1, 0, '{"legacy":false,"name":"mod_search","type":"module","creationDate":"July 2004","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2012 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"MOD_SEARCH_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(214, 'mod_stats', 'module', 'mod_stats', '', 0, 1, 1, 0, '{"legacy":false,"name":"mod_stats","type":"module","creationDate":"July 2004","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2012 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"MOD_STATS_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(215, 'mod_syndicate', 'module', 'mod_syndicate', '', 0, 1, 1, 1, '{"legacy":false,"name":"mod_syndicate","type":"module","creationDate":"May 2006","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2012 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"MOD_SYNDICATE_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(216, 'mod_users_latest', 'module', 'mod_users_latest', '', 0, 1, 1, 1, '{"legacy":false,"name":"mod_users_latest","type":"module","creationDate":"December 2009","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2012 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"MOD_USERS_LATEST_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(217, 'mod_weblinks', 'module', 'mod_weblinks', '', 0, 1, 1, 0, '{"legacy":false,"name":"mod_weblinks","type":"module","creationDate":"July 2009","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2012 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"MOD_WEBLINKS_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(218, 'mod_whosonline', 'module', 'mod_whosonline', '', 0, 1, 1, 0, '{"legacy":false,"name":"mod_whosonline","type":"module","creationDate":"July 2004","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2012 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"MOD_WHOSONLINE_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(219, 'mod_wrapper', 'module', 'mod_wrapper', '', 0, 1, 1, 0, '{"legacy":false,"name":"mod_wrapper","type":"module","creationDate":"October 2004","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2012 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"MOD_WRAPPER_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(220, 'mod_articles_category', 'module', 'mod_articles_category', '', 0, 1, 1, 1, '{"legacy":false,"name":"mod_articles_category","type":"module","creationDate":"February 2010","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2012 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"MOD_ARTICLES_CATEGORY_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(221, 'mod_articles_categories', 'module', 'mod_articles_categories', '', 0, 1, 1, 1, '{"legacy":false,"name":"mod_articles_categories","type":"module","creationDate":"February 2010","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2012 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"MOD_ARTICLES_CATEGORIES_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(222, 'mod_languages', 'module', 'mod_languages', '', 0, 1, 1, 1, '{"legacy":false,"name":"mod_languages","type":"module","creationDate":"February 2010","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2012 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"MOD_LANGUAGES_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(223, 'mod_finder', 'module', 'mod_finder', '', 0, 1, 0, 0, '{"legacy":false,"name":"mod_finder","type":"module","creationDate":"August 2011","author":"Joomla! Project","copyright":"(C) 2005 - 2012 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"MOD_FINDER_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(300, 'mod_custom', 'module', 'mod_custom', '', 1, 1, 1, 1, '{"legacy":false,"name":"mod_custom","type":"module","creationDate":"July 2004","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2012 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"MOD_CUSTOM_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(301, 'mod_feed', 'module', 'mod_feed', '', 1, 1, 1, 0, '{"legacy":false,"name":"mod_feed","type":"module","creationDate":"July 2005","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2012 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"MOD_FEED_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(302, 'mod_latest', 'module', 'mod_latest', '', 1, 1, 1, 0, '{"legacy":false,"name":"mod_latest","type":"module","creationDate":"July 2004","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2012 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"MOD_LATEST_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(303, 'mod_logged', 'module', 'mod_logged', '', 1, 1, 1, 0, '{"legacy":false,"name":"mod_logged","type":"module","creationDate":"January 2005","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2012 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"MOD_LOGGED_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(304, 'mod_login', 'module', 'mod_login', '', 1, 1, 1, 1, '{"legacy":false,"name":"mod_login","type":"module","creationDate":"March 2005","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2012 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"MOD_LOGIN_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(305, 'mod_menu', 'module', 'mod_menu', '', 1, 1, 1, 0, '{"legacy":false,"name":"mod_menu","type":"module","creationDate":"March 2006","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2012 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"MOD_MENU_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(307, 'mod_popular', 'module', 'mod_popular', '', 1, 1, 1, 0, '{"legacy":false,"name":"mod_popular","type":"module","creationDate":"July 2004","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2012 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"MOD_POPULAR_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(308, 'mod_quickicon', 'module', 'mod_quickicon', '', 1, 1, 1, 1, '{"legacy":false,"name":"mod_quickicon","type":"module","creationDate":"Nov 2005","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2012 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"MOD_QUICKICON_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(309, 'mod_status', 'module', 'mod_status', '', 1, 1, 1, 0, '{"legacy":false,"name":"mod_status","type":"module","creationDate":"Feb 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2012 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"MOD_STATUS_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(310, 'mod_submenu', 'module', 'mod_submenu', '', 1, 1, 1, 0, '{"legacy":false,"name":"mod_submenu","type":"module","creationDate":"Feb 2006","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2012 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"MOD_SUBMENU_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(311, 'mod_title', 'module', 'mod_title', '', 1, 1, 1, 0, '{"legacy":false,"name":"mod_title","type":"module","creationDate":"Nov 2005","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2012 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"MOD_TITLE_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(312, 'mod_toolbar', 'module', 'mod_toolbar', '', 1, 1, 1, 1, '{"legacy":false,"name":"mod_toolbar","type":"module","creationDate":"Nov 2005","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2012 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"MOD_TOOLBAR_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(313, 'mod_multilangstatus', 'module', 'mod_multilangstatus', '', 1, 1, 1, 0, '{"legacy":false,"name":"mod_multilangstatus","type":"module","creationDate":"September 2011","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2012 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"MOD_MULTILANGSTATUS_XML_DESCRIPTION","group":""}', '{"cache":"0"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(314, 'mod_version', 'module', 'mod_version', '', 1, 1, 1, 0, '{"legacy":false,"name":"mod_version","type":"module","creationDate":"January 2012","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2012 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"MOD_VERSION_XML_DESCRIPTION","group":""}', '{"format":"short","product":"1","cache":"0"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(400, 'plg_authentication_gmail', 'plugin', 'gmail', 'authentication', 0, 0, 1, 0, '{"legacy":false,"name":"plg_authentication_gmail","type":"plugin","creationDate":"February 2006","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2012 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"PLG_GMAIL_XML_DESCRIPTION","group":""}', '{"applysuffix":"0","suffix":"","verifypeer":"1","user_blacklist":""}', '', '', 0, '0000-00-00 00:00:00', 1, 0),
(401, 'plg_authentication_joomla', 'plugin', 'joomla', 'authentication', 0, 1, 1, 1, '{"legacy":false,"name":"plg_authentication_joomla","type":"plugin","creationDate":"November 2005","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2012 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"PLG_AUTH_JOOMLA_XML_DESCRIPTION","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(402, 'plg_authentication_ldap', 'plugin', 'ldap', 'authentication', 0, 0, 1, 0, '{"legacy":false,"name":"plg_authentication_ldap","type":"plugin","creationDate":"November 2005","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2012 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"PLG_LDAP_XML_DESCRIPTION","group":""}', '{"host":"","port":"389","use_ldapV3":"0","negotiate_tls":"0","no_referrals":"0","auth_method":"bind","base_dn":"","search_string":"","users_dn":"","username":"admin","password":"bobby7","ldap_fullname":"fullName","ldap_email":"mail","ldap_uid":"uid"}', '', '', 0, '0000-00-00 00:00:00', 3, 0),
(404, 'plg_content_emailcloak', 'plugin', 'emailcloak', 'content', 0, 1, 1, 0, '{"legacy":false,"name":"plg_content_emailcloak","type":"plugin","creationDate":"November 2005","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2012 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"PLG_CONTENT_EMAILCLOAK_XML_DESCRIPTION","group":""}', '{"mode":"1"}', '', '', 0, '0000-00-00 00:00:00', 1, 0),
(405, 'plg_content_geshi', 'plugin', 'geshi', 'content', 0, 0, 1, 0, '{"legacy":false,"name":"plg_content_geshi","type":"plugin","creationDate":"November 2005","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2012 Open Source Matters. All rights reserved.","authorEmail":"","authorUrl":"qbnz.com\\/highlighter","version":"2.5.0","description":"PLG_CONTENT_GESHI_XML_DESCRIPTION","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 2, 0),
(406, 'plg_content_loadmodule', 'plugin', 'loadmodule', 'content', 0, 1, 1, 0, '{"legacy":false,"name":"plg_content_loadmodule","type":"plugin","creationDate":"November 2005","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2012 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"PLG_LOADMODULE_XML_DESCRIPTION","group":""}', '{"style":"xhtml"}', '', '', 0, '2011-09-18 15:22:50', 0, 0),
(407, 'plg_content_pagebreak', 'plugin', 'pagebreak', 'content', 0, 1, 1, 1, '{"legacy":false,"name":"plg_content_pagebreak","type":"plugin","creationDate":"November 2005","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2012 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"PLG_CONTENT_PAGEBREAK_XML_DESCRIPTION","group":""}', '{"title":"1","multipage_toc":"1","showall":"1"}', '', '', 0, '0000-00-00 00:00:00', 4, 0),
(408, 'plg_content_pagenavigation', 'plugin', 'pagenavigation', 'content', 0, 1, 1, 1, '{"legacy":false,"name":"plg_content_pagenavigation","type":"plugin","creationDate":"January 2006","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2012 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"PLG_PAGENAVIGATION_XML_DESCRIPTION","group":""}', '{"position":"1"}', '', '', 0, '0000-00-00 00:00:00', 5, 0),
(409, 'plg_content_vote', 'plugin', 'vote', 'content', 0, 1, 1, 1, '{"legacy":false,"name":"plg_content_vote","type":"plugin","creationDate":"November 2005","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2012 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"PLG_VOTE_XML_DESCRIPTION","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 6, 0),
(410, 'plg_editors_codemirror', 'plugin', 'codemirror', 'editors', 0, 1, 1, 1, '{"legacy":false,"name":"plg_editors_codemirror","type":"plugin","creationDate":"28 March 2011","author":"Marijn Haverbeke","copyright":"","authorEmail":"N\\/A","authorUrl":"","version":"1.0","description":"PLG_CODEMIRROR_XML_DESCRIPTION","group":""}', '{"linenumbers":"0","tabmode":"indent"}', '', '', 0, '0000-00-00 00:00:00', 1, 0),
(411, 'plg_editors_none', 'plugin', 'none', 'editors', 0, 1, 1, 1, '{"legacy":false,"name":"plg_editors_none","type":"plugin","creationDate":"August 2004","author":"Unknown","copyright":"","authorEmail":"N\\/A","authorUrl":"","version":"2.5.0","description":"PLG_NONE_XML_DESCRIPTION","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 2, 0),
(412, 'plg_editors_tinymce', 'plugin', 'tinymce', 'editors', 0, 1, 1, 1, '{"legacy":false,"name":"plg_editors_tinymce","type":"plugin","creationDate":"2005-2012","author":"Moxiecode Systems AB","copyright":"Moxiecode Systems AB","authorEmail":"N\\/A","authorUrl":"tinymce.moxiecode.com\\/","version":"3.4.9","description":"PLG_TINY_XML_DESCRIPTION","group":""}', '{"mode":"1","skin":"0","entity_encoding":"raw","lang_mode":"0","lang_code":"en","text_direction":"ltr","content_css":"1","content_css_custom":"","relative_urls":"1","newlines":"0","invalid_elements":"script,applet,iframe","extended_elements":"","toolbar":"top","toolbar_align":"left","html_height":"550","html_width":"750","resizing":"true","resize_horizontal":"false","element_path":"1","fonts":"1","paste":"1","searchreplace":"1","insertdate":"1","format_date":"%Y-%m-%d","inserttime":"1","format_time":"%H:%M:%S","colors":"1","table":"1","smilies":"1","media":"1","hr":"1","directionality":"1","fullscreen":"1","style":"1","layer":"1","xhtmlxtras":"1","visualchars":"1","nonbreaking":"1","template":"1","blockquote":"1","wordcount":"1","advimage":"1","advlink":"1","advlist":"1","autosave":"1","contextmenu":"1","inlinepopups":"1","custom_plugin":"","custom_button":""}', '', '', 0, '0000-00-00 00:00:00', 3, 0),
(413, 'plg_editors-xtd_article', 'plugin', 'article', 'editors-xtd', 0, 1, 1, 1, '{"legacy":false,"name":"plg_editors-xtd_article","type":"plugin","creationDate":"October 2009","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2012 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"PLG_ARTICLE_XML_DESCRIPTION","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 1, 0),
(414, 'plg_editors-xtd_image', 'plugin', 'image', 'editors-xtd', 0, 1, 1, 0, '{"legacy":false,"name":"plg_editors-xtd_image","type":"plugin","creationDate":"August 2004","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2012 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"PLG_IMAGE_XML_DESCRIPTION","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 2, 0),
(415, 'plg_editors-xtd_pagebreak', 'plugin', 'pagebreak', 'editors-xtd', 0, 1, 1, 0, '{"legacy":false,"name":"plg_editors-xtd_pagebreak","type":"plugin","creationDate":"August 2004","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2012 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"PLG_EDITORSXTD_PAGEBREAK_XML_DESCRIPTION","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 3, 0),
(416, 'plg_editors-xtd_readmore', 'plugin', 'readmore', 'editors-xtd', 0, 1, 1, 0, '{"legacy":false,"name":"plg_editors-xtd_readmore","type":"plugin","creationDate":"March 2006","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2012 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"PLG_READMORE_XML_DESCRIPTION","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 4, 0),
(417, 'plg_search_categories', 'plugin', 'categories', 'search', 0, 1, 1, 0, '{"legacy":false,"name":"plg_search_categories","type":"plugin","creationDate":"November 2005","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2012 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"PLG_SEARCH_CATEGORIES_XML_DESCRIPTION","group":""}', '{"search_limit":"50","search_content":"1","search_archived":"1"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(418, 'plg_search_contacts', 'plugin', 'contacts', 'search', 0, 1, 1, 0, '{"legacy":false,"name":"plg_search_contacts","type":"plugin","creationDate":"November 2005","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2012 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"PLG_SEARCH_CONTACTS_XML_DESCRIPTION","group":""}', '{"search_limit":"50","search_content":"1","search_archived":"1"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(419, 'plg_search_content', 'plugin', 'content', 'search', 0, 1, 1, 0, '{"legacy":false,"name":"plg_search_content","type":"plugin","creationDate":"November 2005","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2012 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"PLG_SEARCH_CONTENT_XML_DESCRIPTION","group":""}', '{"search_limit":"50","search_content":"1","search_archived":"1"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(420, 'plg_search_newsfeeds', 'plugin', 'newsfeeds', 'search', 0, 1, 1, 0, '{"legacy":false,"name":"plg_search_newsfeeds","type":"plugin","creationDate":"November 2005","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2012 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"PLG_SEARCH_NEWSFEEDS_XML_DESCRIPTION","group":""}', '{"search_limit":"50","search_content":"1","search_archived":"1"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(421, 'plg_search_weblinks', 'plugin', 'weblinks', 'search', 0, 1, 1, 0, '{"legacy":false,"name":"plg_search_weblinks","type":"plugin","creationDate":"November 2005","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2012 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"PLG_SEARCH_WEBLINKS_XML_DESCRIPTION","group":""}', '{"search_limit":"50","search_content":"1","search_archived":"1"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(422, 'plg_system_languagefilter', 'plugin', 'languagefilter', 'system', 0, 0, 1, 1, '{"legacy":false,"name":"plg_system_languagefilter","type":"plugin","creationDate":"July 2010","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2012 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"PLG_SYSTEM_LANGUAGEFILTER_XML_DESCRIPTION","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 1, 0),
(423, 'plg_system_p3p', 'plugin', 'p3p', 'system', 0, 1, 1, 1, '{"legacy":false,"name":"plg_system_p3p","type":"plugin","creationDate":"September 2010","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2012 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"PLG_P3P_XML_DESCRIPTION","group":""}', '{"headers":"NOI ADM DEV PSAi COM NAV OUR OTRo STP IND DEM"}', '', '', 0, '0000-00-00 00:00:00', 2, 0),
(424, 'plg_system_cache', 'plugin', 'cache', 'system', 0, 0, 1, 1, '{"legacy":false,"name":"plg_system_cache","type":"plugin","creationDate":"February 2007","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2012 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"PLG_CACHE_XML_DESCRIPTION","group":""}', '{"browsercache":"0","cachetime":"15"}', '', '', 0, '0000-00-00 00:00:00', 9, 0),
(425, 'plg_system_debug', 'plugin', 'debug', 'system', 0, 1, 1, 0, '{"legacy":false,"name":"plg_system_debug","type":"plugin","creationDate":"December 2006","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2012 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"PLG_DEBUG_XML_DESCRIPTION","group":""}', '{"profile":"1","queries":"1","memory":"1","language_files":"1","language_strings":"1","strip-first":"1","strip-prefix":"","strip-suffix":""}', '', '', 0, '0000-00-00 00:00:00', 4, 0),
(426, 'plg_system_log', 'plugin', 'log', 'system', 0, 1, 1, 1, '{"legacy":false,"name":"plg_system_log","type":"plugin","creationDate":"April 2007","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2012 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"PLG_LOG_XML_DESCRIPTION","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 5, 0),
(427, 'plg_system_redirect', 'plugin', 'redirect', 'system', 0, 1, 1, 1, '{"legacy":false,"name":"plg_system_redirect","type":"plugin","creationDate":"April 2009","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2012 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"PLG_REDIRECT_XML_DESCRIPTION","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 6, 0),
(428, 'plg_system_remember', 'plugin', 'remember', 'system', 0, 1, 1, 1, '{"legacy":false,"name":"plg_system_remember","type":"plugin","creationDate":"April 2007","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2012 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"PLG_REMEMBER_XML_DESCRIPTION","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 7, 0);
INSERT INTO `ueb_extensions` (`extension_id`, `name`, `type`, `element`, `folder`, `client_id`, `enabled`, `access`, `protected`, `manifest_cache`, `params`, `custom_data`, `system_data`, `checked_out`, `checked_out_time`, `ordering`, `state`) VALUES
(429, 'plg_system_sef', 'plugin', 'sef', 'system', 0, 1, 1, 0, '{"legacy":false,"name":"plg_system_sef","type":"plugin","creationDate":"December 2007","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2012 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"PLG_SEF_XML_DESCRIPTION","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 8, 0),
(430, 'plg_system_logout', 'plugin', 'logout', 'system', 0, 1, 1, 1, '{"legacy":false,"name":"plg_system_logout","type":"plugin","creationDate":"April 2009","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2012 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"PLG_SYSTEM_LOGOUT_XML_DESCRIPTION","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 3, 0),
(431, 'plg_user_contactcreator', 'plugin', 'contactcreator', 'user', 0, 0, 1, 1, '{"legacy":false,"name":"plg_user_contactcreator","type":"plugin","creationDate":"August 2009","author":"Joomla! Project","copyright":"(C) 2005 - 2012 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"PLG_CONTACTCREATOR_XML_DESCRIPTION","group":""}', '{"autowebpage":"","category":"34","autopublish":"0"}', '', '', 0, '0000-00-00 00:00:00', 1, 0),
(432, 'plg_user_joomla', 'plugin', 'joomla', 'user', 0, 1, 1, 0, '{"legacy":false,"name":"plg_user_joomla","type":"plugin","creationDate":"December 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2009 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"PLG_USER_JOOMLA_XML_DESCRIPTION","group":""}', '{"autoregister":"1"}', '', '', 0, '0000-00-00 00:00:00', 2, 0),
(433, 'plg_user_profile', 'plugin', 'profile', 'user', 0, 0, 1, 1, '{"legacy":false,"name":"plg_user_profile","type":"plugin","creationDate":"January 2008","author":"Joomla! Project","copyright":"(C) 2005 - 2012 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"PLG_USER_PROFILE_XML_DESCRIPTION","group":""}', '{"register-require_address1":"1","register-require_address2":"1","register-require_city":"1","register-require_region":"1","register-require_country":"1","register-require_postal_code":"1","register-require_phone":"1","register-require_website":"1","register-require_favoritebook":"1","register-require_aboutme":"1","register-require_tos":"1","register-require_dob":"1","profile-require_address1":"1","profile-require_address2":"1","profile-require_city":"1","profile-require_region":"1","profile-require_country":"1","profile-require_postal_code":"1","profile-require_phone":"1","profile-require_website":"1","profile-require_favoritebook":"1","profile-require_aboutme":"1","profile-require_tos":"1","profile-require_dob":"1"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(434, 'plg_extension_joomla', 'plugin', 'joomla', 'extension', 0, 1, 1, 1, '{"legacy":false,"name":"plg_extension_joomla","type":"plugin","creationDate":"May 2010","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2012 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"PLG_EXTENSION_JOOMLA_XML_DESCRIPTION","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 1, 0),
(435, 'plg_content_joomla', 'plugin', 'joomla', 'content', 0, 1, 1, 0, '{"legacy":false,"name":"plg_content_joomla","type":"plugin","creationDate":"November 2010","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2012 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"PLG_CONTENT_JOOMLA_XML_DESCRIPTION","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(436, 'plg_system_languagecode', 'plugin', 'languagecode', 'system', 0, 0, 1, 0, '{"legacy":false,"name":"plg_system_languagecode","type":"plugin","creationDate":"November 2011","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2012 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"PLG_SYSTEM_LANGUAGECODE_XML_DESCRIPTION","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 10, 0),
(437, 'plg_quickicon_joomlaupdate', 'plugin', 'joomlaupdate', 'quickicon', 0, 1, 1, 1, '{"legacy":false,"name":"plg_quickicon_joomlaupdate","type":"plugin","creationDate":"August 2011","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2012 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"PLG_QUICKICON_JOOMLAUPDATE_XML_DESCRIPTION","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(438, 'plg_quickicon_extensionupdate', 'plugin', 'extensionupdate', 'quickicon', 0, 1, 1, 1, '{"legacy":false,"name":"plg_quickicon_extensionupdate","type":"plugin","creationDate":"August 2011","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2012 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"PLG_QUICKICON_EXTENSIONUPDATE_XML_DESCRIPTION","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(439, 'plg_captcha_recaptcha', 'plugin', 'recaptcha', 'captcha', 0, 1, 1, 0, '{"legacy":false,"name":"plg_captcha_recaptcha","type":"plugin","creationDate":"December 2011","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2012 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"PLG_CAPTCHA_RECAPTCHA_XML_DESCRIPTION","group":""}', '{"public_key":"","private_key":"","theme":"clean"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(440, 'plg_system_highlight', 'plugin', 'highlight', 'system', 0, 1, 1, 0, '{"legacy":false,"name":"plg_system_highlight","type":"plugin","creationDate":"August 2011","author":"Joomla! Project","copyright":"(C) 2005 - 2012 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"PLG_SYSTEM_HIGHLIGHT_XML_DESCRIPTION","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 7, 0),
(441, 'plg_content_finder', 'plugin', 'finder', 'content', 0, 0, 1, 0, '{"legacy":false,"name":"plg_content_finder","type":"plugin","creationDate":"December 2011","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2012 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"PLG_CONTENT_FINDER_XML_DESCRIPTION","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(442, 'plg_finder_categories', 'plugin', 'categories', 'finder', 0, 1, 1, 0, '{"legacy":false,"name":"plg_finder_categories","type":"plugin","creationDate":"August 2011","author":"Joomla! Project","copyright":"(C) 2005 - 2012 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"PLG_FINDER_CATEGORIES_XML_DESCRIPTION","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 1, 0),
(443, 'plg_finder_contacts', 'plugin', 'contacts', 'finder', 0, 1, 1, 0, '{"legacy":false,"name":"plg_finder_contacts","type":"plugin","creationDate":"August 2011","author":"Joomla! Project","copyright":"(C) 2005 - 2012 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"PLG_FINDER_CONTACTS_XML_DESCRIPTION","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 2, 0),
(444, 'plg_finder_content', 'plugin', 'content', 'finder', 0, 1, 1, 0, '{"legacy":false,"name":"plg_finder_content","type":"plugin","creationDate":"August 2011","author":"Joomla! Project","copyright":"(C) 2005 - 2012 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"PLG_FINDER_CONTENT_XML_DESCRIPTION","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 3, 0),
(445, 'plg_finder_newsfeeds', 'plugin', 'newsfeeds', 'finder', 0, 1, 1, 0, '{"legacy":false,"name":"plg_finder_newsfeeds","type":"plugin","creationDate":"August 2011","author":"Joomla! Project","copyright":"(C) 2005 - 2012 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"PLG_FINDER_NEWSFEEDS_XML_DESCRIPTION","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 4, 0),
(446, 'plg_finder_weblinks', 'plugin', 'weblinks', 'finder', 0, 1, 1, 0, '{"legacy":false,"name":"plg_finder_weblinks","type":"plugin","creationDate":"August 2011","author":"Joomla! Project","copyright":"(C) 2005 - 2012 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"PLG_FINDER_WEBLINKS_XML_DESCRIPTION","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 5, 0),
(502, 'bluestork', 'template', 'bluestork', '', 1, 1, 1, 0, '{"legacy":false,"name":"bluestork","type":"template","creationDate":"07\\/02\\/09","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2012 Open Source Matters, Inc. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"TPL_BLUESTORK_XML_DESCRIPTION","group":""}', '{"useRoundedCorners":"1","showSiteName":"0","textBig":"0","highContrast":"0"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(504, 'hathor', 'template', 'hathor', '', 1, 1, 1, 0, '{"legacy":false,"name":"hathor","type":"template","creationDate":"May 2010","author":"Andrea Tarr","copyright":"Copyright (C) 2005 - 2012 Open Source Matters, Inc. All rights reserved.","authorEmail":"hathor@tarrconsulting.com","authorUrl":"http:\\/\\/www.tarrconsulting.com","version":"2.5.0","description":"TPL_HATHOR_XML_DESCRIPTION","group":""}', '{"showSiteName":"0","colourChoice":"0","boldText":"0"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(600, 'English (United Kingdom)', 'language', 'en-GB', '', 0, 1, 1, 1, '{"legacy":false,"name":"English (United Kingdom)","type":"language","creationDate":"2008-03-15","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2012 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"en-GB site language","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(601, 'English (United Kingdom)', 'language', 'en-GB', '', 1, 1, 1, 1, '{"legacy":false,"name":"English (United Kingdom)","type":"language","creationDate":"2008-03-15","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2012 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"en-GB administrator language","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(700, 'files_joomla', 'file', 'joomla', '', 0, 1, 1, 1, '{"legacy":false,"name":"files_joomla","type":"file","creationDate":"April 2012","author":"Joomla! Project","copyright":"(C) 2005 - 2012 Open Source Matters. All rights reserved","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.4","description":"FILES_JOOMLA_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(800, 'PKG_JOOMLA', 'package', 'pkg_joomla', '', 0, 1, 1, 1, '{"legacy":false,"name":"PKG_JOOMLA","type":"package","creationDate":"2006","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2012 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"http:\\/\\/www.joomla.org","version":"2.5.0","description":"PKG_JOOMLA_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10011, 'jatypobutton', 'plugin', 'jatypobutton', 'editors-xtd', 0, 1, 1, 0, '{"legacy":false,"name":"Editor Button - JA Typo Button","type":"plugin","creationDate":"Feb 2012","author":"JoomlArt.com","copyright":"Copyright (C), J.O.O.M Solutions Co., Ltd. All Rights Reserved.","authorEmail":"webmaster@joomlart.com","authorUrl":"www.joomlart.com","version":"2.5.0","description":"Please install plugin jatypo along.","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, -1),
(10012, 'jat3', 'plugin', 'jat3', 'system', 0, 1, 1, 0, '{"legacy":false,"name":"JA T3 Framework","type":"plugin","creationDate":"Feb 2012","author":"www.JoomlArt.com","copyright":"Copyright (C), J.O.O.M Solutions Co., Ltd. All Rights Reserved.","authorEmail":"webmaster@joomlart.com","authorUrl":"http:\\/\\/www.joomlart.com","version":"2.5.0","description":"T3 Framework - JoomlArt Template Framework for Joomla 2.5","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, -1),
(10013, 'jatypo', 'plugin', 'jatypo', 'system', 0, 1, 1, 0, '{"legacy":false,"name":"Button - JA Typography","type":"plugin","creationDate":"February 2012","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2008 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"\\n\\t<span style=\\"color: #008000;\\"><strong>JA Typo plugin support Preformatted text, Lists Style, Icons Style, Button & Tags Style<\\/strong><\\/span><p><span style=\\"color: #ff6600;\\"><strong>Features:<\\/strong><\\/span><\\/p><img border=\\"0\\" alt=\\"JA Typography Plugin\\" src=\\"http:\\/\\/asset.joomlart.com\\/images\\/stories\\/extensions\\/joomla\\/jaec_typo_plg.png?javer=1109070934\\" style=\\"float: left;\\">Bonus Typography styles for your content, choose style right from your editor window. Colorful buttons, table, forms, tags, headings, lists, badges, icons, CSS3 buttons and more styles coming up...<p><strong><span style=\\"color: #ff0000;\\">Important Instructions :<\\/span><br \\/><\\/strong><\\/p>You can use may type to load from popup<p><strong><span style=\\"color: #ff0000;\\">Usage Instructions :<\\/span><br \\/><\\/strong><\\/p>Show popup for you can select typo when you click to typo button<p><strong><span style=\\"color: #ff0000;\\">Upgrade Methods :<\\/span><br \\/><\\/strong><\\/p><ol><li>Standard joomla uninstall \\/ reinstall method. OR<\\/li><li>Module supports upgrade method. You can install new version directly over this version. Uninstallation is not required. Backup any customized file before upgrading, your settings would be saved though.<\\/li><\\/ol><p><span style=\\"color: #008000;\\"><strong>Links :<\\/strong><\\/span><\\/p><ul><li><a target=\\"_blank\\" href=\\"http:\\/\\/update.joomlart.com\\/#products.list\\/plugin_16\\/JA%20Typo%20plugin%20For%20Joomla%201.7\\/\\">Updates &amp; Versions<\\/a><\\/li><\\/ul><p>Copyright 2004 - 2011 <a href=\\"http:\\/\\/www.joomlart.com\\/\\" title=\\"Visit Joomlart.com!\\">JoomlArt.com<\\/a>.<\\/p>\\t\\n\\t","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, -1),
(10009, 'fr-FR', 'language', 'fr-FR', '', 0, 1, 1, 0, '{"legacy":false,"name":"French (FR)","type":"language","creationDate":"2010-08-01","author":"French translation team : Joomla!fr","copyright":"Copyright (C) 2005 - 2010 Open Source Matters &  Joomla.fr. All rights reserved.","authorEmail":"traduction@joomla.fr","authorUrl":"www.joomla.fr","version":"1.6","description":"French administrator language for Joomla 1.6","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, -1),
(10010, 'fr-FR', 'language', 'fr-FR', '', 1, 1, 1, 0, '{"legacy":false,"name":"French (FR)","type":"language","creationDate":"2010-08-01","author":"French translation team : Joomla!fr","copyright":"Copyright (C) 2005 - 2010 Open Source Matters &  Joomla.fr. All rights reserved.","authorEmail":"traduction@joomla.fr","authorUrl":"www.joomla.fr","version":"1.6","description":"French administrator language for Joomla 1.6","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, -1),
(10015, 'Lof ArticlesSlideShow Module', 'module', 'mod_lofarticlesslideshow', '', 0, 1, 0, 0, '{"legacy":false,"name":"Lof ArticlesSlideShow Module","type":"module","creationDate":"Jan 2012","author":"LandOfCoder","copyright":"GNU \\/ GPL2 http:\\/\\/www.gnu.org\\/licenses\\/gpl-2.0.html","authorEmail":"landofcoder@gmail.com","authorUrl":"http:\\/\\/www.landofcoder.com","version":"2.2","description":"\\n    <div style=\\"font-size:11px;\\">\\n      <i>\\n      The ArticleSlideshow Module is as best choice and \\n      the most eye-catching way to display featured  articles on in a rich\\n      slideshow, usually put in the head position of the main site. \\n      The module supports flexible showing content\\n      of each slider and easy to fit your website with one of themes, \\n      skins.\\n      <\\/i>\\n      <p><img src=\\"..\\/modules\\/mod_lofarticlesslideshow\\/assets\\/lof-articleslideshow.png\\" style=\\"width:100%\\"><h4>Module Information:<\\/h4><ul><li><a href=''http:\\/\\/landofcoder.com\\/joomla\\/f33\\/lof-articlesslideshow-module'' target=''_blank''>+ Detail<\\/a><\\/li>\\n      <li><a href=''http:\\/\\/landofcoder.com\\/forum\\/supports.html'' target=''_blank''>+ Forum Support<\\/a><\\/li><li><a href=\\"http:\\/\\/landofcoder.com\\/submit-request.html\\" target=''_blank''>+ Email Request<\\/a><\\/li>\\n      <\\/ul><\\/p><br><div>@Copyright: <a href=''http:\\/\\/landofcoder.com'' target=''_blank''>LandOfCoder.com<\\/a><\\/div>\\n  ","group":""}', '{"moduleclass_sfx":"","theme":"","enable_css3":"1","limit_description_by":"char","title_max_chars":"100","description_max_chars":"100","replacer":"...","module_height":"auto","module_width":"auto","preload":"1","start_item":"0","main_height":"300","main_width":"650","slider_information":"1","enable_image_link":"0","enable_playstop":"1","display_button":"1","desc_opacity":"1","enable_blockdescription":"1","override_links":"","custom_slider_class":"","navigator_pos":"right","navitem_height":"100","navitem_width":"310","max_items_display":"3","thumbnail_width":"60","thumbnail_height":"60","enable_thumbnail":"1","enable_navtitle":"1","enable_navdate":"1","enable_navcate":"0","source":"category","article_ids":"","category":"0","user_id":"0","show_featured":"","ordering":"created-asc","limit_items":"5","layout_style":"vrdown","interval":"5000","duration":"500","effect":"Fx.Transitions.Quad.easeInOut","auto_start":"1","enable_cache":"0","cache_time":"30","auto_renderthumb":"1","auto_strip_tags":"1","open_target":"parent"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10018, 'RegioesEscoteiras', 'template', 'regioesescoteiras', '', 0, 1, 1, 0, '{"legacy":true,"name":"Regioes Escoteiras","type":"template","creationDate":"05 march 2012","author":"Squee Design","copyright":"Copyright (C) 2012 Open Source Matters, Inc. All rights reserved.","authorEmail":"contato@squee.com.br","authorUrl":"http:\\/\\/www.squee.com.br","version":"1.0","description":"Template padrao para sites de Regioes Escoteiras","group":""}', '[]', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10019, 'System - jQuery++ Integrator by tushev.org', 'plugin', 'jqueryintegrator', 'system', 0, 1, 1, 0, '{"legacy":false,"name":"System - jQuery++ Integrator by tushev.org","type":"plugin","creationDate":"June 2010","author":"Semyon Tushev","copyright":"Copyright (c) S.Tushev, 2011. All rights reserved","authorEmail":"support@tushev.org","authorUrl":"http:\\/\\/tushev.org","version":"v 1.5.4","description":"PLG_SYSTEM_JQUERYINTEGRATOR_DESC","group":""}', '{"embedjquery":"4","jquerycdnpath":"\\/\\/ajax.googleapis.com\\/ajax\\/libs\\/jquery\\/1.6.2\\/jquery.min.js","embedjqueryui":"0","jqueryuicdnpath":"\\/\\/ajax.googleapis.com\\/ajax\\/libs\\/jqueryui\\/1.8.6\\/jquery-ui.min.js","embedjqueryuicss":"0","jqueryuicsspath":"\\/plugins\\/system\\/jqueryintegrator\\/jqueryintegrator\\/ui-lightness\\/jquery-ui-1.8.6.custom.css","embedjquerytools":"0","jquerytoolscdnpath":"http:\\/\\/cdn.jquerytools.org\\/1.2.5\\/all\\/jquery.tools.min.js","jquerynoconflict":"1","notactivateatbackend":"1"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10024, 'DisplayNews', 'module', 'mod_dn', '', 0, 1, 0, 0, '{"legacy":false,"name":"DisplayNews","type":"module","creationDate":"2011-Aug","author":"BK","copyright":"(C) 2006 - 2011 BK. All rights reserved.","authorEmail":"bkomraz1@gmail.com","authorUrl":"http:\\/\\/joomla.rjews.net","version":"2.0.RC4","description":"DISPLAY_NEWS_BY_BK_MODULE","group":""}', '{"set_count":"5","minus_leading":"","ordering":"mostrecent","show_tooltips":"0","style":"blog","set_column":"1","moduleclass_sfx":"","set_date_today":"0","set_date_range":"","set_date_month":"","set_date_year":"","set_category_type":"","set_category_id":"","set_article_type":"0","set_article_id":"","set_article_id_extra":"","set_state":"0","set_article_archived_id":"","set_article_archived_id_extra":"","set_author_name":"","set_auto_author":"0","set_related":"0","set_metakeys":"","show_frontpage":"y","hide_current":"0","set_access":"","show_title":"","link_titles":"","text_hover_title":"","title_tag":"span class=\\"title\\"","filter_title":"0","length_limit_title":"20","truncate_ending_title":"1","truncate_ending_title_sign":"...","show_text":"1","link_text":"0","filter_text":"0","preserve_tags":"<img>","limit_text":"0","length_limit_text":"100","truncate_ending":"1","truncate_ending_sign":"...","text_hover_text":"","image":"1","link_image":"0","image_num":"","image_scale":"bestfit","image_bg":"FFFFFF","image_type":"","image_width":"","image_height":"","image_size":"","image_align":"0","image_margin":"","image_class":"0","image_class_name":"","image_default":"0","image_default_file":"","show_category":"","link_category":"","text_hover_category":"","show_more_auto":"0","text_more":"","text_hover_more_category":"","use_modify_date":"0","show_date":"","format_date":"","show_author":"","show_readmore":"2","text_readmore":"","text_hover_readmore":"","show_vote":"","show_hits":"","show_jcomment_counter":"0","scroll_direction":"","scroll_speed":"1","scroll_delay":"30","scroll_mouse_ctrl":"1","scroll_height":"100","lead_space":"50","tail_space":"80","link_type":"0","link_target":"","window_width":"","window_height":"","window_menubar":"0","window_directories":"0","window_location":"0","window_resizable":"0","window_scrollbars":"0","window_status":"0","window_toolbar":"0","article_link":"0","item_id_type":"0","item_id_cat_type":"0","use_rows_template":"1","format":"%t <br\\/>%c<br\\/>%a - %d<br\\/>%b<br\\/>%p%i<br\\/>%m<div class=\\"item-separator\\"> <\\/div>","row_template":"($title_out!='''' ? \\"$title_out\\" : '''').  ($title_out!='''' && $style != ''blog'' && $style != ''featured'' ? \\"<br\\/>\\" : ''''). ($rate_out!='''' ? \\"$rate_out<br\\/>\\" : '''').  ($cat_out!='''' ? \\"$cat_out\\" : '''').  ($cat_out!='''' ? ''<br\\/>'' : '''').  ($author_out!='''' ? \\"$author_out\\" : '''').  ($author_out!='''' && $date_out!='''' ? '' - '' : '''').  ($date_out!='''' ? \\"$date_out\\" : '''').  ($author_out.$date_out!='''' ? ''<br\\/>'' : '''').  ($before_out!='''' ? \\"$before_out<br\\/>\\" : '''').  ($img_out!='''' ? \\"$img_out\\" : '''').  ($text_out!='''' ? \\"$text_out\\" : '''').  ($hits_out!='''' ? \\"($hits_out)\\" : '''').  ($jcomments_out<>'''' ? \\"($jcomments_out)\\" : '''').  ($readmore_out!='''' ? \\"<br\\/>$readmore_out\\" : '''').  (!$last ? ''<div class=\\"item-separator\\"> <\\/div>'' : '''')","show_empty_module":"0","show_title_auto":"0","mod_title_format":"<h3>%c<\\/h3>","use_module_template":"1","module_format":"%t %c %s %r %f %m","module_template":"($mod_title_out != '''' ? \\"$mod_title_out\\" : ''''). $mod_cat_out. $scroll_start. $rows_out. $scroll_finish. ($mod_automore_out != '''' ? $mod_automore_out :'''' )","on_prepare_content_plugins":"1","before_display_content_plugins":"0","force_builtin_rating":"0","rating_txt":"","jcomments":"0","cache":"1","cache_time":"900"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10025, 'PortugusBrasil', 'language', 'pt-BR', '', 0, 1, 0, 0, '{"legacy":true,"name":"Portugu\\u00eas (Brasil)","type":"language","creationDate":"2012-02-07","author":"Joomleiros","copyright":"Copyright (C) 2005 - 2012 Open Source Matters. All rights reserved. Copyright (C) Translation 2005 - 2012 Joomleiros. All rights reserved.","authorEmail":"traducao@joomleiros.com","authorUrl":"http:\\/\\/joomlacode.org\\/gf\\/project\\/portuguesebr\\/","version":"2.5.1","description":"Arquivos de Idioma em Portugu\\u00eas Brasileiro para Joomla! 1.7 - Site.<br\\/>\\n\\t\\t\\t\\t Copyrights: 2005 - 2011 Joomla! Brasil.<br\\/>\\n\\t\\t\\t\\t Todos os direitos reservados.<br\\/>\\n\\t\\t\\t\\t <a href=\\"http:\\/\\/joomlacode.org\\/gf\\/project\\/portuguesebr\\/\\" target=\\"_blank\\">Joomla! Brasil<\\/a> \\u00e9 o \\u00fanico detentor dos copyrights desta tradu\\u00e7\\u00e3o.<br\\/>\\n\\t\\t\\t\\t De acordo com termo de licenciamento de <a href=\\"http:\\/\\/www.opensourcematters.org\\" target=\\"_blank\\">OpenSourceMatters<\\/a> e <a href=\\"http:\\/\\/www.joomla.org\\" target=\\"_blank\\">Joomla!<\\/a> todos os arquivos de idioma devem ser licenciados sob a <a href=\\"http:\\/\\/www.gnu.org\\/licenses\\/gpl-2.0.html\\" target=\\"_blank\\"> licen\\u00e7a GNU\\/GPL (v.2.0)<\\/a>.\\n\\t\\t\\t\\t Esta tradu\\u00e7\\u00e3o est\\u00e1 licenciada sob esta licen\\u00e7a. Se voc\\u00ea encontrar algum erro de digita\\u00e7\\u00e3o, tradu\\u00e7\\u00f5es incorretas ou se deseja sugerir melhorias, entre em contato com o <a href=\\"mailto:traducao@joomla.com.br\\">coordenador<\\/a> da tradu\\u00e7\\u00e3o.<br\\/><br\\/>\\n\\t","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10026, 'PortugusBrasil', 'language', 'pt-BR', '', 1, 1, 0, 0, '{"legacy":true,"name":"Portugu\\u00eas(Brasil)","type":"language","creationDate":"2012-02-07","author":"Joomleiros","copyright":"Copyright (C) 2005 - 2012 Open Source Matters. All rights reserved. Copyright (C) Translation 2005 - 2012 Joomleiros. All rights reserved.","authorEmail":"traducao@joomleiros.com","authorUrl":"http:\\/\\/joomlacode.org\\/gf\\/project\\/portuguesebr\\/","version":"2.5.1","description":"Arquivos de Idioma em Portugu\\u00eas Brasileiro para Joomla! 2.5 - Administra\\u00e7\\u00e3o.<br\\/>\\n\\t\\t\\t\\t Copyrights: 2005 - 2011 Joomla! Brasil.<br\\/>\\n\\t\\t\\t\\t Todos os direitos reservados.<br\\/>\\n\\t\\t\\t\\t <a href=\\"http:\\/\\/joomlacode.org\\/gf\\/project\\/portuguesebr\\/\\" target=\\"_blank\\">Joomla! Brasil<\\/a> \\u00e9 o \\u00fanico detentor dos copyrights desta tradu\\u00e7\\u00e3o.<br\\/>\\n\\t\\t\\t\\t De acordo com termo de licenciamento de <a href=\\"http:\\/\\/www.opensourcematters.org\\" target=\\"_blank\\">OpenSourceMatters<\\/a> e <a href=\\"http:\\/\\/www.joomla.org\\" target=\\"_blank\\">Joomla!<\\/a> todos os arquivos de idioma devem ser licenciados sob a <a href=\\"http:\\/\\/www.gnu.org\\/licenses\\/gpl-2.0.html\\" target=\\"_blank\\"> licen\\u00e7a GNU\\/GPL (v.2.0)<\\/a>.\\n\\t\\t\\t\\t Esta tradu\\u00e7\\u00e3o est\\u00e1 licenciada sob esta licen\\u00e7a. Se voc\\u00ea encontrar algum erro de digita\\u00e7\\u00e3o, tradu\\u00e7\\u00f5es incorretas ou se deseja sugerir melhorias, entre em contato com o <a href=\\"mailto:traducao@joomleiros.com\\">coordenador<\\/a> da tradu\\u00e7\\u00e3o.<br\\/><br\\/>\\n\\t","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10027, 'pt-BR', 'package', 'pkg_pt-BR', '', 0, 1, 1, 0, '{"legacy":false,"name":"Pacote de Idiomas em Portugu\\u00eas Brasileiro","type":"package","creationDate":"Unknown","author":"Unknown","copyright":"","authorEmail":"","authorUrl":"","version":"2.5.0","description":"Arquivos de Idioma em Portugu\\u00eas Brasileiro para Joomla! 2.5<br\\/>\\n\\t\\t\\t\\t Copyrights: 2005 - 2012 Joomleiros.<br\\/>\\n\\t\\t\\t\\t Todos os direitos reservados.<br\\/>\\n\\t\\t\\t\\t <a href=\\"http:\\/\\/joomlacode.org\\/gf\\/project\\/portuguesebr\\/\\" target=\\"_blank\\">Joomleiros<\\/a> \\u00e9 o \\u00fanico detentor dos copyrights desta tradu\\u00e7\\u00e3o.<br\\/>\\n\\t\\t\\t\\t De acordo com termo de licenciamento de <a href=\\"http:\\/\\/www.opensourcematters.org\\" target=\\"_blank\\">OpenSourceMatters<\\/a> e <a href=\\"http:\\/\\/www.joomla.org\\" target=\\"_blank\\">Joomla!<\\/a> todos os arquivos de idioma devem ser licenciados sob a <a href=\\"http:\\/\\/www.gnu.org\\/licenses\\/gpl-2.0.html\\" target=\\"_blank\\"> licen\\u00e7a GNU\\/GPL (v.2.0)<\\/a>.<br \\/>\\n\\t\\t\\t\\t Esta tradu\\u00e7\\u00e3o est\\u00e1 licenciada sob esta licen\\u00e7a. Se voc\\u00ea encontrar algum erro de digita\\u00e7\\u00e3o, tradu\\u00e7\\u00f5es incorretas ou se deseja sugerir melhorias, entre em contato com o <a href=\\"mailto:traducao@joomleiros.com\\">coordenador<\\/a> da tradu\\u00e7\\u00e3o.<br\\/><br\\/>\\n\\t","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(28, 'com_joomlaupdate', 'component', 'com_joomlaupdate', '', 1, 1, 0, 1, '{"legacy":false,"name":"com_joomlaupdate","type":"component","creationDate":"February 2012","author":"Joomla! Project","copyright":"(C) 2005 - 2012 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.2","description":"COM_JOOMLAUPDATE_XML_DESCRIPTION","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0);

-- --------------------------------------------------------

--
-- Estrutura da tabela `ueb_finder_filters`
--

DROP TABLE IF EXISTS `ueb_finder_filters`;
CREATE TABLE IF NOT EXISTS `ueb_finder_filters` (
  `filter_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `alias` varchar(255) NOT NULL,
  `state` tinyint(1) NOT NULL DEFAULT '1',
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(10) unsigned NOT NULL,
  `created_by_alias` varchar(255) NOT NULL,
  `modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` int(10) unsigned NOT NULL DEFAULT '0',
  `checked_out` int(10) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `map_count` int(10) unsigned NOT NULL DEFAULT '0',
  `data` text NOT NULL,
  `params` mediumtext,
  PRIMARY KEY (`filter_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Extraindo dados da tabela `ueb_finder_filters`
--


-- --------------------------------------------------------

--
-- Estrutura da tabela `ueb_finder_links`
--

DROP TABLE IF EXISTS `ueb_finder_links`;
CREATE TABLE IF NOT EXISTS `ueb_finder_links` (
  `link_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `url` varchar(255) NOT NULL,
  `route` varchar(255) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `indexdate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `md5sum` varchar(32) DEFAULT NULL,
  `published` tinyint(1) NOT NULL DEFAULT '1',
  `state` int(5) DEFAULT '1',
  `access` int(5) DEFAULT '0',
  `language` varchar(8) NOT NULL,
  `publish_start_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_end_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `start_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `end_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `list_price` double unsigned NOT NULL DEFAULT '0',
  `sale_price` double unsigned NOT NULL DEFAULT '0',
  `type_id` int(11) NOT NULL,
  `object` mediumblob NOT NULL,
  PRIMARY KEY (`link_id`),
  KEY `idx_type` (`type_id`),
  KEY `idx_title` (`title`),
  KEY `idx_md5` (`md5sum`),
  KEY `idx_url` (`url`(75)),
  KEY `idx_published_list` (`published`,`state`,`access`,`publish_start_date`,`publish_end_date`,`list_price`),
  KEY `idx_published_sale` (`published`,`state`,`access`,`publish_start_date`,`publish_end_date`,`sale_price`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Extraindo dados da tabela `ueb_finder_links`
--


-- --------------------------------------------------------

--
-- Estrutura da tabela `ueb_finder_links_terms0`
--

DROP TABLE IF EXISTS `ueb_finder_links_terms0`;
CREATE TABLE IF NOT EXISTS `ueb_finder_links_terms0` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `ueb_finder_links_terms0`
--


-- --------------------------------------------------------

--
-- Estrutura da tabela `ueb_finder_links_terms1`
--

DROP TABLE IF EXISTS `ueb_finder_links_terms1`;
CREATE TABLE IF NOT EXISTS `ueb_finder_links_terms1` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `ueb_finder_links_terms1`
--


-- --------------------------------------------------------

--
-- Estrutura da tabela `ueb_finder_links_terms2`
--

DROP TABLE IF EXISTS `ueb_finder_links_terms2`;
CREATE TABLE IF NOT EXISTS `ueb_finder_links_terms2` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `ueb_finder_links_terms2`
--


-- --------------------------------------------------------

--
-- Estrutura da tabela `ueb_finder_links_terms3`
--

DROP TABLE IF EXISTS `ueb_finder_links_terms3`;
CREATE TABLE IF NOT EXISTS `ueb_finder_links_terms3` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `ueb_finder_links_terms3`
--


-- --------------------------------------------------------

--
-- Estrutura da tabela `ueb_finder_links_terms4`
--

DROP TABLE IF EXISTS `ueb_finder_links_terms4`;
CREATE TABLE IF NOT EXISTS `ueb_finder_links_terms4` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `ueb_finder_links_terms4`
--


-- --------------------------------------------------------

--
-- Estrutura da tabela `ueb_finder_links_terms5`
--

DROP TABLE IF EXISTS `ueb_finder_links_terms5`;
CREATE TABLE IF NOT EXISTS `ueb_finder_links_terms5` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `ueb_finder_links_terms5`
--


-- --------------------------------------------------------

--
-- Estrutura da tabela `ueb_finder_links_terms6`
--

DROP TABLE IF EXISTS `ueb_finder_links_terms6`;
CREATE TABLE IF NOT EXISTS `ueb_finder_links_terms6` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `ueb_finder_links_terms6`
--


-- --------------------------------------------------------

--
-- Estrutura da tabela `ueb_finder_links_terms7`
--

DROP TABLE IF EXISTS `ueb_finder_links_terms7`;
CREATE TABLE IF NOT EXISTS `ueb_finder_links_terms7` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `ueb_finder_links_terms7`
--


-- --------------------------------------------------------

--
-- Estrutura da tabela `ueb_finder_links_terms8`
--

DROP TABLE IF EXISTS `ueb_finder_links_terms8`;
CREATE TABLE IF NOT EXISTS `ueb_finder_links_terms8` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `ueb_finder_links_terms8`
--


-- --------------------------------------------------------

--
-- Estrutura da tabela `ueb_finder_links_terms9`
--

DROP TABLE IF EXISTS `ueb_finder_links_terms9`;
CREATE TABLE IF NOT EXISTS `ueb_finder_links_terms9` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `ueb_finder_links_terms9`
--


-- --------------------------------------------------------

--
-- Estrutura da tabela `ueb_finder_links_termsa`
--

DROP TABLE IF EXISTS `ueb_finder_links_termsa`;
CREATE TABLE IF NOT EXISTS `ueb_finder_links_termsa` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `ueb_finder_links_termsa`
--


-- --------------------------------------------------------

--
-- Estrutura da tabela `ueb_finder_links_termsb`
--

DROP TABLE IF EXISTS `ueb_finder_links_termsb`;
CREATE TABLE IF NOT EXISTS `ueb_finder_links_termsb` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `ueb_finder_links_termsb`
--


-- --------------------------------------------------------

--
-- Estrutura da tabela `ueb_finder_links_termsc`
--

DROP TABLE IF EXISTS `ueb_finder_links_termsc`;
CREATE TABLE IF NOT EXISTS `ueb_finder_links_termsc` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `ueb_finder_links_termsc`
--


-- --------------------------------------------------------

--
-- Estrutura da tabela `ueb_finder_links_termsd`
--

DROP TABLE IF EXISTS `ueb_finder_links_termsd`;
CREATE TABLE IF NOT EXISTS `ueb_finder_links_termsd` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `ueb_finder_links_termsd`
--


-- --------------------------------------------------------

--
-- Estrutura da tabela `ueb_finder_links_termse`
--

DROP TABLE IF EXISTS `ueb_finder_links_termse`;
CREATE TABLE IF NOT EXISTS `ueb_finder_links_termse` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `ueb_finder_links_termse`
--


-- --------------------------------------------------------

--
-- Estrutura da tabela `ueb_finder_links_termsf`
--

DROP TABLE IF EXISTS `ueb_finder_links_termsf`;
CREATE TABLE IF NOT EXISTS `ueb_finder_links_termsf` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `ueb_finder_links_termsf`
--


-- --------------------------------------------------------

--
-- Estrutura da tabela `ueb_finder_taxonomy`
--

DROP TABLE IF EXISTS `ueb_finder_taxonomy`;
CREATE TABLE IF NOT EXISTS `ueb_finder_taxonomy` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int(10) unsigned NOT NULL DEFAULT '0',
  `title` varchar(255) NOT NULL,
  `state` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `access` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `ordering` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `parent_id` (`parent_id`),
  KEY `state` (`state`),
  KEY `ordering` (`ordering`),
  KEY `access` (`access`),
  KEY `idx_parent_published` (`parent_id`,`state`,`access`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Extraindo dados da tabela `ueb_finder_taxonomy`
--

INSERT INTO `ueb_finder_taxonomy` (`id`, `parent_id`, `title`, `state`, `access`, `ordering`) VALUES
(1, 0, 'ROOT', 0, 0, 0);

-- --------------------------------------------------------

--
-- Estrutura da tabela `ueb_finder_taxonomy_map`
--

DROP TABLE IF EXISTS `ueb_finder_taxonomy_map`;
CREATE TABLE IF NOT EXISTS `ueb_finder_taxonomy_map` (
  `link_id` int(10) unsigned NOT NULL,
  `node_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`node_id`),
  KEY `link_id` (`link_id`),
  KEY `node_id` (`node_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `ueb_finder_taxonomy_map`
--


-- --------------------------------------------------------

--
-- Estrutura da tabela `ueb_finder_terms`
--

DROP TABLE IF EXISTS `ueb_finder_terms`;
CREATE TABLE IF NOT EXISTS `ueb_finder_terms` (
  `term_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `term` varchar(75) NOT NULL,
  `stem` varchar(75) NOT NULL,
  `common` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `phrase` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `weight` float unsigned NOT NULL DEFAULT '0',
  `soundex` varchar(75) NOT NULL,
  `links` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`term_id`),
  UNIQUE KEY `idx_term` (`term`),
  KEY `idx_term_phrase` (`term`,`phrase`),
  KEY `idx_stem_phrase` (`stem`,`phrase`),
  KEY `idx_soundex_phrase` (`soundex`,`phrase`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Extraindo dados da tabela `ueb_finder_terms`
--


-- --------------------------------------------------------

--
-- Estrutura da tabela `ueb_finder_terms_common`
--

DROP TABLE IF EXISTS `ueb_finder_terms_common`;
CREATE TABLE IF NOT EXISTS `ueb_finder_terms_common` (
  `term` varchar(75) NOT NULL,
  `language` varchar(3) NOT NULL,
  KEY `idx_word_lang` (`term`,`language`),
  KEY `idx_lang` (`language`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `ueb_finder_terms_common`
--

INSERT INTO `ueb_finder_terms_common` (`term`, `language`) VALUES
('a', 'en'),
('about', 'en'),
('after', 'en'),
('ago', 'en'),
('all', 'en'),
('am', 'en'),
('an', 'en'),
('and', 'en'),
('ani', 'en'),
('any', 'en'),
('are', 'en'),
('aren''t', 'en'),
('as', 'en'),
('at', 'en'),
('be', 'en'),
('but', 'en'),
('by', 'en'),
('for', 'en'),
('from', 'en'),
('get', 'en'),
('go', 'en'),
('how', 'en'),
('if', 'en'),
('in', 'en'),
('into', 'en'),
('is', 'en'),
('isn''t', 'en'),
('it', 'en'),
('its', 'en'),
('me', 'en'),
('more', 'en'),
('most', 'en'),
('must', 'en'),
('my', 'en'),
('new', 'en'),
('no', 'en'),
('none', 'en'),
('not', 'en'),
('noth', 'en'),
('nothing', 'en'),
('of', 'en'),
('off', 'en'),
('often', 'en'),
('old', 'en'),
('on', 'en'),
('onc', 'en'),
('once', 'en'),
('onli', 'en'),
('only', 'en'),
('or', 'en'),
('other', 'en'),
('our', 'en'),
('ours', 'en'),
('out', 'en'),
('over', 'en'),
('page', 'en'),
('she', 'en'),
('should', 'en'),
('small', 'en'),
('so', 'en'),
('some', 'en'),
('than', 'en'),
('thank', 'en'),
('that', 'en'),
('the', 'en'),
('their', 'en'),
('theirs', 'en'),
('them', 'en'),
('then', 'en'),
('there', 'en'),
('these', 'en'),
('they', 'en'),
('this', 'en'),
('those', 'en'),
('thus', 'en'),
('time', 'en'),
('times', 'en'),
('to', 'en'),
('too', 'en'),
('true', 'en'),
('under', 'en'),
('until', 'en'),
('up', 'en'),
('upon', 'en'),
('use', 'en'),
('user', 'en'),
('users', 'en'),
('veri', 'en'),
('version', 'en'),
('very', 'en'),
('via', 'en'),
('want', 'en'),
('was', 'en'),
('way', 'en'),
('were', 'en'),
('what', 'en'),
('when', 'en'),
('where', 'en'),
('whi', 'en'),
('which', 'en'),
('who', 'en'),
('whom', 'en'),
('whose', 'en'),
('why', 'en'),
('wide', 'en'),
('will', 'en'),
('with', 'en'),
('within', 'en'),
('without', 'en'),
('would', 'en'),
('yes', 'en'),
('yet', 'en'),
('you', 'en'),
('your', 'en'),
('yours', 'en');

-- --------------------------------------------------------

--
-- Estrutura da tabela `ueb_finder_tokens`
--

DROP TABLE IF EXISTS `ueb_finder_tokens`;
CREATE TABLE IF NOT EXISTS `ueb_finder_tokens` (
  `term` varchar(75) NOT NULL,
  `stem` varchar(75) NOT NULL,
  `common` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `phrase` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `weight` float unsigned NOT NULL DEFAULT '1',
  `context` tinyint(1) unsigned NOT NULL DEFAULT '2',
  KEY `idx_word` (`term`),
  KEY `idx_context` (`context`)
) ENGINE=MEMORY DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `ueb_finder_tokens`
--


-- --------------------------------------------------------

--
-- Estrutura da tabela `ueb_finder_tokens_aggregate`
--

DROP TABLE IF EXISTS `ueb_finder_tokens_aggregate`;
CREATE TABLE IF NOT EXISTS `ueb_finder_tokens_aggregate` (
  `term_id` int(10) unsigned NOT NULL,
  `map_suffix` char(1) NOT NULL,
  `term` varchar(75) NOT NULL,
  `stem` varchar(75) NOT NULL,
  `common` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `phrase` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `term_weight` float unsigned NOT NULL,
  `context` tinyint(1) unsigned NOT NULL DEFAULT '2',
  `context_weight` float unsigned NOT NULL,
  `total_weight` float unsigned NOT NULL,
  KEY `token` (`term`),
  KEY `keyword_id` (`term_id`)
) ENGINE=MEMORY DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `ueb_finder_tokens_aggregate`
--


-- --------------------------------------------------------

--
-- Estrutura da tabela `ueb_finder_types`
--

DROP TABLE IF EXISTS `ueb_finder_types`;
CREATE TABLE IF NOT EXISTS `ueb_finder_types` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  `mime` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `title` (`title`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Extraindo dados da tabela `ueb_finder_types`
--


-- --------------------------------------------------------

--
-- Estrutura da tabela `ueb_languages`
--

DROP TABLE IF EXISTS `ueb_languages`;
CREATE TABLE IF NOT EXISTS `ueb_languages` (
  `lang_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `lang_code` char(7) NOT NULL,
  `title` varchar(50) NOT NULL,
  `title_native` varchar(50) NOT NULL,
  `sef` varchar(50) NOT NULL,
  `image` varchar(50) NOT NULL,
  `description` varchar(512) NOT NULL,
  `metakey` text NOT NULL,
  `metadesc` text NOT NULL,
  `sitename` varchar(1024) NOT NULL DEFAULT '',
  `published` int(11) NOT NULL DEFAULT '0',
  `access` int(10) unsigned NOT NULL DEFAULT '0',
  `ordering` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`lang_id`),
  UNIQUE KEY `idx_sef` (`sef`),
  UNIQUE KEY `idx_image` (`image`),
  UNIQUE KEY `idx_langcode` (`lang_code`),
  KEY `idx_ordering` (`ordering`),
  KEY `idx_access` (`access`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Extraindo dados da tabela `ueb_languages`
--

INSERT INTO `ueb_languages` (`lang_id`, `lang_code`, `title`, `title_native`, `sef`, `image`, `description`, `metakey`, `metadesc`, `sitename`, `published`, `access`, `ordering`) VALUES
(1, 'en-GB', 'English (UK)', 'English (UK)', 'en', 'en', '', '', '', '', 1, 0, 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `ueb_menu`
--

DROP TABLE IF EXISTS `ueb_menu`;
CREATE TABLE IF NOT EXISTS `ueb_menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `menutype` varchar(24) NOT NULL COMMENT 'The type of menu this item belongs to. FK to #__menu_types.menutype',
  `title` varchar(255) NOT NULL COMMENT 'The display title of the menu item.',
  `alias` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'The SEF alias of the menu item.',
  `note` varchar(255) NOT NULL DEFAULT '',
  `path` varchar(1024) NOT NULL COMMENT 'The computed path of the menu item based on the alias field.',
  `link` varchar(1024) NOT NULL COMMENT 'The actually link the menu item refers to.',
  `type` varchar(16) NOT NULL COMMENT 'The type of link: Component, URL, Alias, Separator',
  `published` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'The published state of the menu link.',
  `parent_id` int(10) unsigned NOT NULL DEFAULT '1' COMMENT 'The parent menu item in the menu tree.',
  `level` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'The relative level in the tree.',
  `component_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'FK to #__extensions.id',
  `ordering` int(11) NOT NULL DEFAULT '0' COMMENT 'The relative ordering of the menu item in the tree.',
  `checked_out` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'FK to #__users.id',
  `checked_out_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'The time the menu item was checked out.',
  `browserNav` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'The click behaviour of the link.',
  `access` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'The access level required to view the menu item.',
  `img` varchar(255) NOT NULL COMMENT 'The image of the menu item.',
  `template_style_id` int(10) unsigned NOT NULL DEFAULT '0',
  `params` text NOT NULL COMMENT 'JSON encoded data for the menu item.',
  `lft` int(11) NOT NULL DEFAULT '0' COMMENT 'Nested set lft.',
  `rgt` int(11) NOT NULL DEFAULT '0' COMMENT 'Nested set rgt.',
  `home` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT 'Indicates if this menu item is the home or default page.',
  `language` char(7) NOT NULL DEFAULT '',
  `client_id` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_client_id_parent_id_alias_language` (`client_id`,`parent_id`,`alias`,`language`),
  KEY `idx_componentid` (`component_id`,`menutype`,`published`,`access`),
  KEY `idx_menutype` (`menutype`),
  KEY `idx_left_right` (`lft`,`rgt`),
  KEY `idx_alias` (`alias`),
  KEY `idx_path` (`path`(333)),
  KEY `idx_language` (`language`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=115 ;

--
-- Extraindo dados da tabela `ueb_menu`
--

INSERT INTO `ueb_menu` (`id`, `menutype`, `title`, `alias`, `note`, `path`, `link`, `type`, `published`, `parent_id`, `level`, `component_id`, `ordering`, `checked_out`, `checked_out_time`, `browserNav`, `access`, `img`, `template_style_id`, `params`, `lft`, `rgt`, `home`, `language`, `client_id`) VALUES
(1, '', 'Menu_Item_Root', 'root', '', '', '', '', 1, 0, 0, 0, 0, 0, '0000-00-00 00:00:00', 0, 0, '', 0, '', 0, 69, 0, '*', 0),
(2, 'menu', 'com_banners', 'Banners', '', 'Banners', 'index.php?option=com_banners', 'component', 0, 1, 1, 4, 0, 0, '0000-00-00 00:00:00', 0, 0, 'class:banners', 0, '', 1, 10, 0, '*', 1),
(3, 'menu', 'com_banners', 'Banners', '', 'Banners/Banners', 'index.php?option=com_banners', 'component', 0, 2, 2, 4, 0, 0, '0000-00-00 00:00:00', 0, 0, 'class:banners', 0, '', 2, 3, 0, '*', 1),
(4, 'menu', 'com_banners_categories', 'Categories', '', 'Banners/Categories', 'index.php?option=com_categories&extension=com_banners', 'component', 0, 2, 2, 6, 0, 0, '0000-00-00 00:00:00', 0, 0, 'class:banners-cat', 0, '', 4, 5, 0, '*', 1),
(5, 'menu', 'com_banners_clients', 'Clients', '', 'Banners/Clients', 'index.php?option=com_banners&view=clients', 'component', 0, 2, 2, 4, 0, 0, '0000-00-00 00:00:00', 0, 0, 'class:banners-clients', 0, '', 6, 7, 0, '*', 1),
(6, 'menu', 'com_banners_tracks', 'Tracks', '', 'Banners/Tracks', 'index.php?option=com_banners&view=tracks', 'component', 0, 2, 2, 4, 0, 0, '0000-00-00 00:00:00', 0, 0, 'class:banners-tracks', 0, '', 8, 9, 0, '*', 1),
(7, 'menu', 'com_contact', 'Contacts', '', 'Contacts', 'index.php?option=com_contact', 'component', 0, 1, 1, 8, 0, 0, '0000-00-00 00:00:00', 0, 0, 'class:contact', 0, '', 11, 16, 0, '*', 1),
(8, 'menu', 'com_contact', 'Contacts', '', 'Contacts/Contacts', 'index.php?option=com_contact', 'component', 0, 7, 2, 8, 0, 0, '0000-00-00 00:00:00', 0, 0, 'class:contact', 0, '', 12, 13, 0, '*', 1),
(9, 'menu', 'com_contact_categories', 'Categories', '', 'Contacts/Categories', 'index.php?option=com_categories&extension=com_contact', 'component', 0, 7, 2, 6, 0, 0, '0000-00-00 00:00:00', 0, 0, 'class:contact-cat', 0, '', 14, 15, 0, '*', 1),
(10, 'menu', 'com_messages', 'Messaging', '', 'Messaging', 'index.php?option=com_messages', 'component', 0, 1, 1, 15, 0, 0, '0000-00-00 00:00:00', 0, 0, 'class:messages', 0, '', 17, 22, 0, '*', 1),
(11, 'menu', 'com_messages_add', 'New Private Message', '', 'Messaging/New Private Message', 'index.php?option=com_messages&task=message.add', 'component', 0, 10, 2, 15, 0, 0, '0000-00-00 00:00:00', 0, 0, 'class:messages-add', 0, '', 18, 19, 0, '*', 1),
(12, 'menu', 'com_messages_read', 'Read Private Message', '', 'Messaging/Read Private Message', 'index.php?option=com_messages', 'component', 0, 10, 2, 15, 0, 0, '0000-00-00 00:00:00', 0, 0, 'class:messages-read', 0, '', 20, 21, 0, '*', 1),
(13, 'menu', 'com_newsfeeds', 'News Feeds', '', 'News Feeds', 'index.php?option=com_newsfeeds', 'component', 0, 1, 1, 17, 0, 0, '0000-00-00 00:00:00', 0, 0, 'class:newsfeeds', 0, '', 23, 28, 0, '*', 1),
(14, 'menu', 'com_newsfeeds_feeds', 'Feeds', '', 'News Feeds/Feeds', 'index.php?option=com_newsfeeds', 'component', 0, 13, 2, 17, 0, 0, '0000-00-00 00:00:00', 0, 0, 'class:newsfeeds', 0, '', 24, 25, 0, '*', 1),
(15, 'menu', 'com_newsfeeds_categories', 'Categories', '', 'News Feeds/Categories', 'index.php?option=com_categories&extension=com_newsfeeds', 'component', 0, 13, 2, 6, 0, 0, '0000-00-00 00:00:00', 0, 0, 'class:newsfeeds-cat', 0, '', 26, 27, 0, '*', 1),
(16, 'menu', 'com_redirect', 'Redirect', '', 'Redirect', 'index.php?option=com_redirect', 'component', 0, 1, 1, 24, 0, 0, '0000-00-00 00:00:00', 0, 0, 'class:redirect', 0, '', 41, 42, 0, '*', 1),
(17, 'menu', 'com_search', 'Basic Search', '', 'Basic Search', 'index.php?option=com_search', 'component', 0, 1, 1, 19, 0, 0, '0000-00-00 00:00:00', 0, 0, 'class:search', 0, '', 33, 34, 0, '*', 1),
(18, 'menu', 'com_weblinks', 'Weblinks', '', 'Weblinks', 'index.php?option=com_weblinks', 'component', 0, 1, 1, 21, 0, 0, '0000-00-00 00:00:00', 0, 0, 'class:weblinks', 0, '', 35, 40, 0, '*', 1),
(19, 'menu', 'com_weblinks_links', 'Links', '', 'Weblinks/Links', 'index.php?option=com_weblinks', 'component', 0, 18, 2, 21, 0, 0, '0000-00-00 00:00:00', 0, 0, 'class:weblinks', 0, '', 36, 37, 0, '*', 1),
(20, 'menu', 'com_weblinks_categories', 'Categories', '', 'Weblinks/Categories', 'index.php?option=com_categories&extension=com_weblinks', 'component', 0, 18, 2, 6, 0, 0, '0000-00-00 00:00:00', 0, 0, 'class:weblinks-cat', 0, '', 38, 39, 0, '*', 1),
(21, 'menu', 'com_finder', 'Smart Search', '', 'Smart Search', 'index.php?option=com_finder', 'component', 0, 1, 1, 27, 0, 0, '0000-00-00 00:00:00', 0, 0, 'class:finder', 0, '', 31, 32, 0, '*', 1),
(101, 'mainmenu', 'Home', 'home', '', 'home', 'index.php?option=com_content&view=featured', 'component', 1, 1, 1, 22, 0, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"featured_categories":[""],"layout_type":"blog","num_leading_articles":"1","num_intro_articles":"3","num_columns":"3","num_links":"0","multi_column_order":"1","orderby_pri":"","orderby_sec":"front","order_date":"","show_pagination":"2","show_pagination_results":"1","show_title":"","link_titles":"","show_intro":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_vote":"","show_readmore":"","show_readmore_title":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_hits":"","show_noauth":"","show_feed_link":"1","feed_summary":"","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"page_title":"Escoteiros do Brasil","show_page_heading":0,"page_heading":"","pageclass_sfx":" home","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 29, 30, 1, '*', 0),
(102, 'acesso-rapido', 'Loja Escoteira', '2012-03-03-14-17-41', '', '2012-03-03-14-17-41', 'http://www.lojaescoteiranacional.com.br/', 'url', 1, 1, 1, 0, 0, 0, '0000-00-00 00:00:00', 2, 1, '', 0, '{"menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1}', 43, 44, 0, '*', 0),
(103, 'acesso-rapido', 'SIGUE Jovem', '2012-03-03-14-18-46', '', '2012-03-03-14-18-46', 'http://idc.escoteiros.org.br:8080/siguejovem/', 'url', 1, 1, 1, 0, 0, 0, '0000-00-00 00:00:00', 2, 1, '', 0, '{"menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1}', 45, 46, 0, '*', 0),
(104, 'acesso-rapido', 'SIGUE Administrativo', '2012-03-03-14-19-37', '', '2012-03-03-14-19-37', 'http://idc.escoteiros.org.br:8080/sigue/', 'url', 1, 1, 1, 0, 0, 0, '0000-00-00 00:00:00', 2, 1, '', 0, '{"menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1}', 47, 48, 0, '*', 0),
(105, 'acesso-rapido', 'Webmail', '2012-03-03-14-20-37', '', '2012-03-03-14-20-37', '#', 'url', 1, 1, 1, 0, 0, 0, '0000-00-00 00:00:00', 2, 1, '', 0, '{"menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1}', 49, 50, 0, '*', 0),
(106, 'acesso-rapido', 'Contato', '2012-03-03-14-22-28', '', '2012-03-03-14-22-28', '#', 'url', 1, 1, 1, 8, 0, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1}', 51, 52, 0, '*', 0),
(107, 'mainmenu', 'Institucional', '2012-03-03-14-46-21', '', '2012-03-03-14-46-21', 'index.php?option=com_content&view=article&id=6', 'component', 1, 1, 1, 22, 0, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"show_title":"","link_titles":"","show_intro":"","show_category":"0","link_category":"","show_parent_category":"0","link_parent_category":"","show_author":"0","link_author":"","show_create_date":"0","show_modify_date":"","show_publish_date":"","show_item_navigation":"0","show_vote":"0","show_icons":"0","show_print_icon":"0","show_email_icon":"0","show_hits":"0","show_noauth":"","urls_position":"","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"page_title":"","show_page_heading":0,"page_heading":"","pageclass_sfx":" institucional","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 53, 54, 0, '*', 0),
(108, 'mainmenu', 'Escotismo', '2012-03-03-14-46-43', '', '2012-03-03-14-46-43', 'index.php?option=com_content&view=article&id=7', 'component', 1, 1, 1, 22, 0, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"show_title":"","link_titles":"","show_intro":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_vote":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_hits":"","show_noauth":"","urls_position":"","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"page_title":"","show_page_heading":0,"page_heading":"","pageclass_sfx":" escotismo","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 55, 56, 0, '*', 0),
(109, 'mainmenu', 'Downloads', '2012-03-03-14-47-07', '', '2012-03-03-14-47-07', 'index.php?option=com_content&view=article&id=19', 'component', 1, 1, 1, 22, 0, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"show_title":"","link_titles":"","show_intro":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_vote":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_hits":"","show_noauth":"","urls_position":"","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"page_title":"","show_page_heading":0,"page_heading":"","pageclass_sfx":" downloads","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 57, 58, 0, '*', 0),
(110, 'mainmenu', 'Agenda', '2012-03-03-14-47-24', '', '2012-03-03-14-47-24', 'index.php?option=com_content&view=category&layout=blog&id=10', 'component', 1, 1, 1, 22, 0, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"layout_type":"blog","show_category_title":"1","show_description":"","show_description_image":"","maxLevel":"","show_empty_categories":"","show_no_articles":"","show_subcat_desc":"","show_cat_num_articles":"","page_subheading":"","num_leading_articles":"2","num_intro_articles":"6","num_columns":"2","num_links":"","multi_column_order":"","show_subcategory_content":"","orderby_pri":"","orderby_sec":"date","order_date":"","show_pagination":"","show_pagination_results":"","show_title":"","link_titles":"","show_intro":"1","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_vote":"","show_readmore":"0","show_readmore_title":"0","show_icons":"","show_print_icon":"","show_email_icon":"","show_hits":"","show_noauth":"","show_feed_link":"","feed_summary":"","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"page_title":"","show_page_heading":0,"page_heading":"","pageclass_sfx":" agenda","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 59, 60, 0, '*', 0),
(111, 'mainmenu', 'Notícias', '2012-03-03-14-47-43', '', '2012-03-03-14-47-43', 'index.php?option=com_content&view=category&layout=blog&id=8', 'component', 1, 1, 1, 22, 0, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"layout_type":"blog","show_category_title":"1","show_description":"","show_description_image":"","maxLevel":"","show_empty_categories":"","show_no_articles":"","show_subcat_desc":"","show_cat_num_articles":"","page_subheading":"","num_leading_articles":"2","num_intro_articles":"10","num_columns":"2","num_links":"0","multi_column_order":"","show_subcategory_content":"","orderby_pri":"","orderby_sec":"rdate","order_date":"created","show_pagination":"","show_pagination_results":"","show_title":"","link_titles":"","show_intro":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"1","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_vote":"","show_readmore":"0","show_readmore_title":"0","show_icons":"","show_print_icon":"","show_email_icon":"","show_hits":"","show_noauth":"","show_feed_link":"","feed_summary":"","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"page_title":"","show_page_heading":0,"page_heading":"","pageclass_sfx":" noticias","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 61, 62, 0, '*', 0),
(112, 'mainmenu', 'Grupos Escoteiros', '2012-03-03-14-48-13', '', '2012-03-03-14-48-13', 'index.php?option=com_content&view=category&layout=blog&id=11', 'component', 1, 1, 1, 22, 0, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"layout_type":"blog","show_category_title":"1","show_description":"1","show_description_image":"","maxLevel":"","show_empty_categories":"","show_no_articles":"","show_subcat_desc":"","show_cat_num_articles":"","page_subheading":"","num_leading_articles":"0","num_intro_articles":"10","num_columns":"2","num_links":"","multi_column_order":"","show_subcategory_content":"","orderby_pri":"","orderby_sec":"","order_date":"","show_pagination":"","show_pagination_results":"","show_title":"","link_titles":"0","show_intro":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_vote":"","show_readmore":"0","show_readmore_title":"0","show_icons":"","show_print_icon":"","show_email_icon":"","show_hits":"","show_noauth":"","show_feed_link":"","feed_summary":"","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"page_title":"","show_page_heading":0,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 63, 64, 0, '*', 0),
(113, 'mainmenu', 'Registro', '2012-03-03-14-48-30', '', '2012-03-03-14-48-30', 'index.php?option=com_content&view=article&id=13', 'component', 1, 1, 1, 22, 0, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"show_title":"","link_titles":"","show_intro":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_vote":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_hits":"","show_noauth":"","urls_position":"","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"page_title":"","show_page_heading":0,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 65, 66, 0, '*', 0),
(114, 'mainmenu', 'Eventos', 'eventos', '', 'eventos', 'index.php?option=com_content&view=category&layout=blog&id=13', 'component', 0, 1, 1, 22, 0, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"layout_type":"blog","show_category_title":"","show_description":"","show_description_image":"","maxLevel":"","show_empty_categories":"","show_no_articles":"","show_subcat_desc":"","show_cat_num_articles":"","page_subheading":"","num_leading_articles":"","num_intro_articles":"","num_columns":"","num_links":"","multi_column_order":"","show_subcategory_content":"","orderby_pri":"","orderby_sec":"","order_date":"","show_pagination":"","show_pagination_results":"","show_title":"","link_titles":"","show_intro":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_vote":"","show_readmore":"","show_readmore_title":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_hits":"","show_noauth":"","show_feed_link":"","feed_summary":"","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"page_title":"","show_page_heading":0,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 67, 68, 0, '*', 0),
(22, 'menu', 'com_joomlaupdate', 'Joomla! Update', '', 'Joomla! Update', 'index.php?option=com_joomlaupdate', 'component', 0, 1, 1, 28, 0, 0, '0000-00-00 00:00:00', 0, 0, 'class:joomlaupdate', 0, '', 41, 42, 0, '*', 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `ueb_menu_types`
--

DROP TABLE IF EXISTS `ueb_menu_types`;
CREATE TABLE IF NOT EXISTS `ueb_menu_types` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `menutype` varchar(24) NOT NULL,
  `title` varchar(48) NOT NULL,
  `description` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_menutype` (`menutype`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Extraindo dados da tabela `ueb_menu_types`
--

INSERT INTO `ueb_menu_types` (`id`, `menutype`, `title`, `description`) VALUES
(1, 'mainmenu', 'Main Menu', 'The main menu for the site'),
(2, 'acesso-rapido', 'Acesso Rápido', '');

-- --------------------------------------------------------

--
-- Estrutura da tabela `ueb_messages`
--

DROP TABLE IF EXISTS `ueb_messages`;
CREATE TABLE IF NOT EXISTS `ueb_messages` (
  `message_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id_from` int(10) unsigned NOT NULL DEFAULT '0',
  `user_id_to` int(10) unsigned NOT NULL DEFAULT '0',
  `folder_id` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `date_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `state` tinyint(1) NOT NULL DEFAULT '0',
  `priority` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `subject` varchar(255) NOT NULL DEFAULT '',
  `message` text NOT NULL,
  PRIMARY KEY (`message_id`),
  KEY `useridto_state` (`user_id_to`,`state`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Extraindo dados da tabela `ueb_messages`
--


-- --------------------------------------------------------

--
-- Estrutura da tabela `ueb_messages_cfg`
--

DROP TABLE IF EXISTS `ueb_messages_cfg`;
CREATE TABLE IF NOT EXISTS `ueb_messages_cfg` (
  `user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `cfg_name` varchar(100) NOT NULL DEFAULT '',
  `cfg_value` varchar(255) NOT NULL DEFAULT '',
  UNIQUE KEY `idx_user_var_name` (`user_id`,`cfg_name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `ueb_messages_cfg`
--


-- --------------------------------------------------------

--
-- Estrutura da tabela `ueb_modules`
--

DROP TABLE IF EXISTS `ueb_modules`;
CREATE TABLE IF NOT EXISTS `ueb_modules` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL DEFAULT '',
  `note` varchar(255) NOT NULL DEFAULT '',
  `content` text NOT NULL,
  `ordering` int(11) NOT NULL DEFAULT '0',
  `position` varchar(50) NOT NULL DEFAULT '',
  `checked_out` int(10) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_up` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_down` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `published` tinyint(1) NOT NULL DEFAULT '0',
  `module` varchar(50) DEFAULT NULL,
  `access` int(10) unsigned NOT NULL DEFAULT '0',
  `showtitle` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `params` text NOT NULL,
  `client_id` tinyint(4) NOT NULL DEFAULT '0',
  `language` char(7) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `published` (`published`,`access`),
  KEY `newsfeeds` (`module`,`published`),
  KEY `idx_language` (`language`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=121 ;

--
-- Extraindo dados da tabela `ueb_modules`
--

INSERT INTO `ueb_modules` (`id`, `title`, `note`, `content`, `ordering`, `position`, `checked_out`, `checked_out_time`, `publish_up`, `publish_down`, `published`, `module`, `access`, `showtitle`, `params`, `client_id`, `language`) VALUES
(1, 'Main Menu', '', '', 1, 'menuprinc', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_menu', 1, 0, '{"menutype":"mainmenu","startLevel":"1","endLevel":"0","showAllChildren":"0","tag_id":"","class_sfx":"","window_open":"","layout":"_:default","moduleclass_sfx":"_menu","cache":"1","cache_time":"900","cachemode":"itemid"}', 0, '*'),
(2, 'Login', '', '', 1, 'login', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_login', 1, 1, '', 1, '*'),
(3, 'Popular Articles', '', '', 3, 'cpanel', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_popular', 3, 1, '{"count":"5","catid":"","user_id":"0","layout":"_:default","moduleclass_sfx":"","cache":"0","automatic_title":"1"}', 1, '*'),
(4, 'Recently Added Articles', '', '', 4, 'cpanel', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_latest', 3, 1, '{"count":"5","ordering":"c_dsc","catid":"","user_id":"0","layout":"_:default","moduleclass_sfx":"","cache":"0","automatic_title":"1"}', 1, '*'),
(8, 'Toolbar', '', '', 1, 'toolbar', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_toolbar', 3, 1, '', 1, '*'),
(9, 'Quick Icons', '', '', 1, 'icon', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_quickicon', 3, 1, '', 1, '*'),
(10, 'Logged-in Users', '', '', 2, 'cpanel', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_logged', 3, 1, '{"count":"5","name":"1","layout":"_:default","moduleclass_sfx":"","cache":"0","automatic_title":"1"}', 1, '*'),
(12, 'Admin Menu', '', '', 1, 'menu', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_menu', 3, 1, '{"layout":"","moduleclass_sfx":"","shownew":"1","showhelp":"1","cache":"0"}', 1, '*'),
(13, 'Admin Submenu', '', '', 1, 'submenu', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_submenu', 3, 1, '', 1, '*'),
(14, 'User Status', '', '', 2, 'status', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_status', 3, 1, '', 1, '*'),
(15, 'Title', '', '', 1, 'title', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_title', 3, 1, '', 1, '*'),
(16, 'Login Form', '', '', 7, 'position-7', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', -2, 'mod_login', 1, 1, '{"greeting":"1","name":"0"}', 0, '*'),
(17, 'Breadcrumbs', '', '', 1, 'breadcrumbs', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_breadcrumbs', 1, 0, '{"showHere":"1","showHome":"1","homeText":"P\\u00e1gina inicial","showLast":"1","separator":"\\u203a","layout":"_:default","moduleclass_sfx":" migalha","cache":"1","cache_time":"900","cachemode":"itemid"}', 0, '*'),
(79, 'Multilanguage status', '', '', 1, 'status', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 'mod_multilangstatus', 3, 1, '{"layout":"_:default","moduleclass_sfx":"","cache":"0"}', 1, '*'),
(86, 'Joomla Version', '', '', 1, 'footer', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_version', 3, 1, '{"format":"short","product":"1","layout":"_:default","moduleclass_sfx":"","cache":"0"}', 1, '*'),
(87, 'Acesso Rápido - Menu', '', '', 1, 'menutop', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_menu', 1, 0, '{"menutype":"acesso-rapido","startLevel":"1","endLevel":"0","showAllChildren":"0","tag_id":"","class_sfx":"","window_open":"","layout":"_:default","moduleclass_sfx":"","cache":"1","cache_time":"900","cachemode":"itemid"}', 0, '*'),
(88, 'Banner', '', '', 1, 'banner', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', -2, 'mod_lofarticlesslideshow', 1, 0, '{"moduleclass_sfx":"","theme":"grey","enable_css3":"1","limit_description_by":"char","title_max_chars":"100","description_max_chars":"100","replacer":"...","module_height":"auto","module_width":"auto","preload":"0","start_item":"0","main_height":"300","main_width":"650","slider_information":"description","enable_image_link":"0","enable_playstop":"0","display_button":"0","desc_opacity":"1","enable_blockdescription":"0","navigator_pos":"right","navitem_height":"100","navitem_width":"310","max_items_display":"3","thumbnail_width":"60","thumbnail_height":"60","enable_thumbnail":"1","enable_navtitle":"1","enable_navdate":"1","enable_navcate":"0","source":"category","article_ids":"","category":["8"],"user_id":"0","show_featured":"2","ordering":"created-asc","limit_items":"5","layout_style":"vrdown","interval":"5000","duration":"500","effect":"Fx.Transitions.Quad.easeInOut","auto_start":"1","enable_cache":"0","cache_time":"30","auto_renderthumb":"1","auto_strip_tags":"1","open_target":"parent"}', 0, '*'),
(89, 'Banner', '', '', 1, 'banner', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', -2, 'mod_articles_news', 1, 1, '{"catid":["8"],"image":"1","item_title":"1","link_titles":"","item_heading":"h4","showLastSeparator":"1","readmore":"0","count":"5","ordering":"a.publish_up","layout":"_:horizontal","moduleclass_sfx":"","cache":"1","cache_time":"900","cachemode":"itemid"}', 0, '*'),
(90, 'Banner', '', '', 1, 'banner', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', -2, 'mod_articles_category', 1, 1, '{"mode":"normal","show_on_article_page":"1","show_front":"show","count":"5","category_filtering_type":"1","catid":["8"],"show_child_category_articles":"0","levels":"1","author_filtering_type":"1","created_by":[""],"author_alias_filtering_type":"1","created_by_alias":[""],"excluded_articles":"","date_filtering":"off","date_field":"a.created","start_date_range":"","end_date_range":"","relative_date":"30","article_ordering":"a.title","article_ordering_direction":"ASC","article_grouping":"none","article_grouping_direction":"ksort","month_year_format":"F Y","item_heading":"4","link_titles":"1","show_date":"0","show_date_field":"created","show_date_format":"Y-m-d H:i:s","show_category":"0","show_hits":"0","show_author":"0","show_introtext":"0","introtext_limit":"100","show_readmore":"0","show_readmore_title":"1","readmore_limit":"15","layout":"_:banner","moduleclass_sfx":"","owncache":"1","cache_time":"900"}', 0, '*'),
(91, 'Banner', '', '', 1, 'atomic-bottommiddle', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', -2, 'mod_articles_news', 1, 1, '{"catid":["8"],"image":"1","item_title":"1","link_titles":"1","item_heading":"h4","showLastSeparator":"0","readmore":"0","count":"5","ordering":"a.publish_up","layout":"_:banner","moduleclass_sfx":"","cache":"1","cache_time":"900","cachemode":"itemid"}', 0, '*'),
(92, 'Banner', '', '', 0, 'banner', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', -2, 'mod_articles_latest', 1, 1, '{"catid":["8"],"count":"5","show_featured":"","ordering":"c_dsc","user_id":"0","layout":"_:default","moduleclass_sfx":"","cache":"1","cache_time":"900","cachemode":"static"}', 0, '*'),
(93, 'Banner', '', '', 0, 'banner', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', -2, 'mod_articles_category', 1, 1, '{"mode":"normal","show_on_article_page":"1","show_front":"show","count":"0","category_filtering_type":"1","catid":["8"],"show_child_category_articles":"0","levels":"1","author_filtering_type":"1","created_by":[""],"author_alias_filtering_type":"1","created_by_alias":[""],"excluded_articles":"","date_filtering":"off","date_field":"a.created","start_date_range":"","end_date_range":"","relative_date":"30","article_ordering":"a.title","article_ordering_direction":"ASC","article_grouping":"none","article_grouping_direction":"ksort","month_year_format":"F Y","item_heading":"4","link_titles":"1","show_date":"0","show_date_field":"created","show_date_format":"Y-m-d H:i:s","show_category":"0","show_hits":"0","show_author":"0","show_introtext":"0","introtext_limit":"100","show_readmore":"0","show_readmore_title":"1","readmore_limit":"15","layout":"_:default","moduleclass_sfx":"","owncache":"1","cache_time":"900"}', 0, '*'),
(94, 'Banner', '', '', 1, 'banner', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', -2, 'mod_lofarticlesslideshow', 1, 1, '{"moduleclass_sfx":"","theme":"","enable_css3":"1","limit_description_by":"char","title_max_chars":"100","description_max_chars":"100","replacer":"...","module_height":"auto","module_width":"auto","preload":"1","start_item":"0","main_height":"300","main_width":"650","slider_information":"description","enable_image_link":"0","enable_playstop":"1","display_button":"1","desc_opacity":"1","enable_blockdescription":"1","navigator_pos":"right","navitem_height":"100","navitem_width":"310","max_items_display":"3","thumbnail_width":"60","thumbnail_height":"60","enable_thumbnail":"1","enable_navtitle":"1","enable_navdate":"1","enable_navcate":"0","source":"category","article_ids":"","category":["8"],"user_id":"0","show_featured":"2","ordering":"created-asc","limit_items":"5","layout_style":"vrdown","interval":"5000","duration":"500","effect":"Fx.Transitions.Quad.easeInOut","auto_start":"1","enable_cache":"0","cache_time":"30","auto_renderthumb":"1","auto_strip_tags":"1","open_target":"parent"}', 0, '*'),
(95, 'Banner newsflash', '', '', 1, 'banner', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', -2, 'mod_articles_news', 1, 1, '{"catid":["8"],"image":"1","item_title":"1","link_titles":"1","item_heading":"h4","showLastSeparator":"1","readmore":"0","count":"5","ordering":"a.publish_up","layout":"_:default","moduleclass_sfx":"","cache":"0","cache_time":"900","cachemode":"itemid"}', 0, '*'),
(96, 'Slider', '', '', 1, 'slider', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_lofarticlesslideshow', 1, 0, '{"moduleclass_sfx":"","theme":"","enable_css3":"0","limit_description_by":"word","title_max_chars":"100","description_max_chars":"0","replacer":"...","module_height":"254","module_width":"954","preload":"1","start_item":"0","main_height":"254","main_width":"758","slider_information":"description","enable_image_link":"0","enable_playstop":"0","display_button":"0","desc_opacity":"1","enable_blockdescription":"1","override_links":["",""],"navigator_pos":"right","navitem_height":"51","navitem_width":"215","max_items_display":"5","thumbnail_width":"60","thumbnail_height":"40","enable_thumbnail":"1","enable_navtitle":"1","enable_navdate":"0","enable_navcate":"0","source":"category","article_ids":"","category":["8"],"user_id":"0","show_featured":"2","ordering":"created-asc","limit_items":"5","layout_style":"vrdown","interval":"5000","duration":"500","effect":"Fx.Transitions.Quad.easeInOut","auto_start":"1","enable_cache":"0","cache_time":"30","auto_renderthumb":"1","auto_strip_tags":"1","open_target":"parent"}', 0, '*'),
(97, 'Notícias', '', '', 1, 'atomic-bottomleft', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', -2, 'mod_articles_category', 1, 0, '{"mode":"normal","show_on_article_page":"1","show_front":"show","count":"0","category_filtering_type":"1","catid":["8"],"show_child_category_articles":"0","levels":"1","author_filtering_type":"1","created_by":[""],"author_alias_filtering_type":"1","created_by_alias":[""],"excluded_articles":"","date_filtering":"off","date_field":"a.created","start_date_range":"","end_date_range":"","relative_date":"30","article_ordering":"a.title","article_ordering_direction":"ASC","article_grouping":"none","article_grouping_direction":"ksort","month_year_format":"F Y","item_heading":"4","link_titles":"1","show_date":"0","show_date_field":"created","show_date_format":"Y-m-d H:i:s","show_category":"0","show_hits":"0","show_author":"0","show_introtext":"0","introtext_limit":"100","show_readmore":"0","show_readmore_title":"1","readmore_limit":"15","layout":"_:default","moduleclass_sfx":"","owncache":"1","cache_time":"900"}', 0, '*'),
(98, 'Tetse', '', '', 1, 'atomic-bottommiddle', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', -2, 'mod_articles_news', 1, 1, '{"catid":["8"],"image":"1","item_title":"1","link_titles":"1","item_heading":"h4","showLastSeparator":"1","readmore":"0","count":"5","ordering":"a.publish_up","layout":"_:vertical","moduleclass_sfx":"","cache":"1","cache_time":"900","cachemode":"itemid"}', 0, '*'),
(99, 'teste', '', '', 1, 'atomic-bottomleft', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', -2, 'mod_articles_latest', 1, 1, '{"catid":["8"],"count":"5","show_featured":"","ordering":"c_dsc","user_id":"0","layout":"_:default","moduleclass_sfx":"","cache":"1","cache_time":"900","cachemode":"static"}', 0, '*'),
(100, 'Notícias', '', '', 1, 'user1', 0, '0000-00-00 00:00:00', '2012-03-08 16:27:21', '0000-00-00 00:00:00', -2, 'mod_articles_news', 1, 1, '{"catid":[""],"image":"1","item_title":"1","link_titles":"1","item_heading":"h4","showLastSeparator":"1","readmore":"0","count":"4","ordering":"a.publish_up","layout":"_:banner","moduleclass_sfx":"","cache":"1","cache_time":"900","cachemode":"itemid"}', 0, '*'),
(102, 'Notícias', '', '', 1, 'user1', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', -2, 'mod_articles_news', 1, 1, '{"catid":["8"],"image":"1","item_title":"1","link_titles":"1","item_heading":"h4","showLastSeparator":"1","readmore":"0","count":"5","ordering":"a.publish_up","layout":"_:banner","moduleclass_sfx":"","cache":"1","cache_time":"1","cachemode":"itemid"}', 0, '*'),
(108, 'Notícias', '', '', 1, 'user1', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', -2, 'mod_dn', 1, 1, '{"set_count":"3","minus_leading":"","ordering":"mostold","show_tooltips":"0","style":"flat","set_column":"3","moduleclass_sfx":"","set_date_today":"0","set_date_range":"","set_date_month":"","set_date_year":"","set_category_type":"2","set_category_id":["8"],"set_article_type":"0","set_article_id_extra":"","set_state":"1","set_article_archived_id_extra":"","set_auto_author":"0","set_related":"0","set_metakeys":"","show_frontpage":"y","hide_current":"0","show_title":"","link_titles":"","text_hover_title":"","title_tag":"span class=\\"title\\"","filter_title":"0","length_limit_title":"20","truncate_ending_title":"1","truncate_ending_title_sign":"...","show_text":"1","link_text":"0","filter_text":"0","preserve_tags":"<img>","limit_text":"0","length_limit_text":"100","truncate_ending":"1","truncate_ending_sign":"...","text_hover_text":"","image":"2","link_image":"1","image_num":"2","image_scale":"bestfit","image_bg":"FFFFFF","image_type":"","image_width":"","image_height":"","image_size":"88x68","image_align":"2","image_margin":"0px 10px 0px 0px","image_class":"0","image_class_name":"","image_default":"0","image_default_file":"","show_category":"0","show_category_title":"0","show_description":"0","show_description_image":"0","link_category":"","text_hover_category":"","show_more_auto":"0","text_more":"","text_hover_more_category":"","use_modify_date":"0","show_date":"0","format_date":"","show_author":"0","show_readmore":"0","text_readmore":"","text_hover_readmore":"","show_vote":"0","show_hits":"0","show_jcomment_counter":"0","scroll_direction":"","scroll_speed":"1","scroll_delay":"30","scroll_mouse_ctrl":"1","scroll_height":"100","lead_space":"50","tail_space":"80","link_type":"0","link_target":"","window_width":"","window_height":"","window_menubar":"0","window_directories":"0","window_location":"0","window_resizable":"0","window_scrollbars":"0","window_status":"0","window_toolbar":"0","article_link":"0","item_id_type":"0","item_id_cat_type":"0","use_rows_template":"1","format":"%t <br\\/>%c<br\\/>%a - %d<br\\/>%b<br\\/>%p%i<br\\/>%m<div class=\\"item-separator\\"> <\\/div>","row_template":"($title_out!='''' ? \\"$title_out\\" : '''').  ($title_out!='''' && $style != ''blog'' && $style != ''featured'' ? \\"<br\\/>\\" : ''''). ($rate_out!='''' ? \\"$rate_out<br\\/>\\" : '''').  ($cat_out!='''' ? \\"$cat_out\\" : '''').  ($cat_out!='''' ? ''<br\\/>'' : '''').  ($author_out!='''' ? \\"$author_out\\" : '''').  ($author_out!='''' && $date_out!='''' ? '' - '' : '''').  ($date_out!='''' ? \\"$date_out\\" : '''').  ($author_out.$date_out!='''' ? ''<br\\/>'' : '''').  ($before_out!='''' ? \\"$before_out<br\\/>\\" : '''').  ($img_out!='''' ? \\"$img_out\\" : '''').  ($text_out!='''' ? \\"$text_out\\" : '''').  ($hits_out!='''' ? \\"($hits_out)\\" : '''').  ($jcomments_out<>'''' ? \\"($jcomments_out)\\" : '''').  ($readmore_out!='''' ? \\"<br\\/>$readmore_out\\" : '''').  (!$last ? ''<div class=\\"item-separator\\"> <\\/div>'' : '''')","show_empty_module":"0","show_title_auto":"0","mod_title_format":"<h3>%c<\\/h3>","use_module_template":"1","module_format":"%t %c %s %r %f %m","module_template":"($mod_title_out != '''' ? \\"$mod_title_out\\" : ''''). $mod_cat_out. $scroll_start. $rows_out. $scroll_finish. ($mod_automore_out != '''' ? $mod_automore_out :'''' )","on_prepare_content_plugins":"1","before_display_content_plugins":"0","force_builtin_rating":"0","rating_txt":"","jcomments":"0","cache":"1","cache_time":"1"}', 0, '*'),
(107, 'Notícias', '', '', 0, 'user1', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', -2, 'mod_articles_category', 1, 1, '{"mode":"normal","show_on_article_page":"1","show_front":"show","count":"0","category_filtering_type":"1","catid":["8"],"show_child_category_articles":"0","levels":"1","author_filtering_type":"1","created_by":[""],"author_alias_filtering_type":"1","created_by_alias":[""],"excluded_articles":"","date_filtering":"off","date_field":"a.created","start_date_range":"","end_date_range":"","relative_date":"30","article_ordering":"a.title","article_ordering_direction":"ASC","article_grouping":"none","article_grouping_direction":"ksort","month_year_format":"F Y","item_heading":"4","link_titles":"1","show_date":"0","show_date_field":"created","show_date_format":"Y-m-d H:i:s","show_category":"0","show_hits":"0","show_author":"0","show_introtext":"1","introtext_limit":"100","show_readmore":"0","show_readmore_title":"1","readmore_limit":"15","layout":"_:default","moduleclass_sfx":"","owncache":"1","cache_time":"900"}', 0, '*'),
(109, 'Notícias', '', '', 1, 'user1', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_articles_news', 1, 1, '{"catid":["8"],"image":"1","item_title":"1","link_titles":"1","item_heading":"h4","showLastSeparator":"0","readmore":"0","count":"3","ordering":"a.ordering","layout":"_:noticias","moduleclass_sfx":" noticias","cache":"1","cache_time":"1","cachemode":"itemid"}', 0, '*'),
(110, 'Teste', '', '', 1, 'user1', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', -2, 'mod_articles_category', 1, 1, '{"mode":"normal","show_on_article_page":"1","show_front":"show","count":"3","category_filtering_type":"1","catid":["8"],"show_child_category_articles":"0","levels":"1","author_filtering_type":"1","created_by":[""],"author_alias_filtering_type":"1","created_by_alias":[""],"excluded_articles":"","date_filtering":"off","date_field":"a.created","start_date_range":"","end_date_range":"","relative_date":"30","article_ordering":"a.created","article_ordering_direction":"DESC","article_grouping":"none","article_grouping_direction":"ksort","month_year_format":"F Y","item_heading":"4","link_titles":"1","show_date":"0","show_date_field":"created","show_date_format":"Y-m-d H:i:s","show_category":"1","show_hits":"0","show_author":"0","show_introtext":"1","introtext_limit":"100","show_readmore":"0","show_readmore_title":"0","readmore_limit":"15","layout":"_:default","moduleclass_sfx":"","owncache":"1","cache_time":"900"}', 0, '*'),
(111, 'Teste', '', '', 0, 'user1', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', -2, 'mod_articles_latest', 1, 1, '{"catid":["8"],"count":"5","show_featured":"","ordering":"c_dsc","user_id":"0","layout":"_:default","moduleclass_sfx":"","cache":"1","cache_time":"900","cachemode":"static"}', 0, '*'),
(112, 'teste', '', '', 1, 'user1', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', -2, 'mod_dn', 1, 1, '{"set_count":"3","minus_leading":"","ordering":"mostrecent","show_tooltips":"0","style":"blog","set_column":"3","moduleclass_sfx":"","set_date_today":"0","set_date_range":"","set_date_month":"","set_date_year":"","set_category_type":"2","set_category_id":["8"],"set_article_type":"0","set_article_id_extra":"","set_state":"1","set_article_archived_id_extra":"","set_auto_author":"0","set_related":"0","set_metakeys":"","show_frontpage":"y","hide_current":"0","show_title":"","link_titles":"","text_hover_title":"","title_tag":"span class=\\"title\\"","filter_title":"0","length_limit_title":"20","truncate_ending_title":"1","truncate_ending_title_sign":"...","show_text":"1","link_text":"0","filter_text":"0","preserve_tags":"<img>","limit_text":"0","length_limit_text":"100","truncate_ending":"1","truncate_ending_sign":"...","text_hover_text":"","image":"1","link_image":"0","image_num":"","image_scale":"bestfit","image_bg":"FFFFFF","image_type":"","image_width":"","image_height":"","image_size":"","image_align":"0","image_margin":"","image_class":"0","image_class_name":"","image_default":"0","image_default_file":"","show_category":"0","show_category_title":"","show_description":"","show_description_image":"","link_category":"","text_hover_category":"","show_more_auto":"1","text_more":"","text_hover_more_category":"","use_modify_date":"0","show_date":"","format_date":"","show_author":"","show_readmore":"0","text_readmore":"","text_hover_readmore":"","show_vote":"0","show_hits":"0","show_jcomment_counter":"0","scroll_direction":"","scroll_speed":"1","scroll_delay":"30","scroll_mouse_ctrl":"1","scroll_height":"100","lead_space":"50","tail_space":"80","link_type":"0","link_target":"","window_width":"","window_height":"","window_menubar":"0","window_directories":"0","window_location":"0","window_resizable":"0","window_scrollbars":"0","window_status":"0","window_toolbar":"0","article_link":"0","item_id_type":"0","item_id_cat_type":"0","use_rows_template":"1","format":"%t <br\\/>%c<br\\/>%a - %d<br\\/>%b<br\\/>%p%i<br\\/>%m<div class=\\"item-separator\\"> <\\/div>","row_template":"($title_out!='''' ? \\"$title_out\\" : '''').  ($title_out!='''' && $style != ''blog'' && $style != ''featured'' ? \\"<br\\/>\\" : ''''). ($rate_out!='''' ? \\"$rate_out<br\\/>\\" : '''').  ($cat_out!='''' ? \\"$cat_out\\" : '''').  ($cat_out!='''' ? ''<br\\/>'' : '''').  ($author_out!='''' ? \\"$author_out\\" : '''').  ($author_out!='''' && $date_out!='''' ? '' - '' : '''').  ($date_out!='''' ? \\"$date_out\\" : '''').  ($author_out.$date_out!='''' ? ''<br\\/>'' : '''').  ($before_out!='''' ? \\"$before_out<br\\/>\\" : '''').  ($img_out!='''' ? \\"$img_out\\" : '''').  ($text_out!='''' ? \\"$text_out\\" : '''').  ($hits_out!='''' ? \\"($hits_out)\\" : '''').  ($jcomments_out<>'''' ? \\"($jcomments_out)\\" : '''').  ($readmore_out!='''' ? \\"<br\\/>$readmore_out\\" : '''').  (!$last ? ''<div class=\\"item-separator\\"> <\\/div>'' : '''')","show_empty_module":"0","show_title_auto":"0","mod_title_format":"<h3>%c<\\/h3>","use_module_template":"1","module_format":"%t %c %s %r %f %m","module_template":"($mod_title_out != '''' ? \\"$mod_title_out\\" : ''''). $mod_cat_out. $scroll_start. $rows_out. $scroll_finish. ($mod_automore_out != '''' ? $mod_automore_out :'''' )","on_prepare_content_plugins":"1","before_display_content_plugins":"0","force_builtin_rating":"0","rating_txt":"","jcomments":"0","cache":"1","cache_time":"900"}', 0, '*'),
(113, 'Eventos', '', '', 1, 'user1', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_articles_news', 1, 1, '{"catid":["13"],"image":"1","item_title":"1","link_titles":"","item_heading":"h4","showLastSeparator":"1","readmore":"0","count":"3","ordering":"a.publish_up","layout":"_:eventos","moduleclass_sfx":" eventos","cache":"1","cache_time":"900","cachemode":"itemid"}', 0, '*'),
(114, 'Banner', '', '', 1, 'banner', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_banners', 1, 0, '{"target":"1","count":"3","cid":"0","catid":["14"],"tag_search":"0","ordering":"0","header_text":"","footer_text":"","layout":"_:default","moduleclass_sfx":"","cache":"1","cache_time":"900"}', 0, '*'),
(115, 'Rodapé - Endereço', '', '<h2><span>UNIÃO DOS ESCOTEIROS DO BRASIL</span></h2>\r\n<p>Rua Coronel Dulcídio, 2107 - Bairro Água Verde<br /> CEP 80250-100 - Curitiba - Paraná - Brasil<br /> (41) 3353-4732</p>', 1, 'rodape', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_custom', 1, 0, '{"prepare_content":"1","backgroundimage":"","layout":"_:default","moduleclass_sfx":" add","cache":"1","cache_time":"900","cachemode":"static"}', 0, '*'),
(116, 'Rodapé - Menu', '', '', 2, 'rodape', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_menu', 1, 0, '{"menutype":"mainmenu","startLevel":"1","endLevel":"0","showAllChildren":"0","tag_id":"","class_sfx":" ","window_open":"","layout":"_:default","moduleclass_sfx":" links","cache":"1","cache_time":"900","cachemode":"itemid"}', 0, '*'),
(117, 'Rodapé - logo União dos Escoteiros do Brasil', '', '', 3, 'rodape', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_banners', 1, 0, '{"target":"1","count":"1","cid":"0","catid":["3"],"tag_search":"0","ordering":"0","header_text":"","footer_text":"","layout":"_:default","moduleclass_sfx":" wosm","cache":"1","cache_time":"900"}', 0, '*'),
(118, 'Banner (copy)', '', '', 1, 'banner', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', -2, 'mod_banners', 1, 0, '{"target":"1","count":"3","cid":"0","catid":["14"],"tag_search":"0","ordering":"0","header_text":"","footer_text":"","layout":"_:default","moduleclass_sfx":"","cache":"1","cache_time":"900"}', 0, '*'),
(119, 'Coluna Esquerda', '', '', 1, 'user1', 42, '2012-04-10 02:15:44', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_articles_category', 1, 0, '{"mode":"dynamic","show_on_article_page":"1","show_front":"show","count":"5","category_filtering_type":"1","catid":[""],"show_child_category_articles":"0","levels":"1","author_filtering_type":"1","created_by":[""],"author_alias_filtering_type":"1","created_by_alias":[""],"excluded_articles":"","date_filtering":"off","date_field":"a.created","start_date_range":"","end_date_range":"","relative_date":"30","article_ordering":"a.title","article_ordering_direction":"ASC","article_grouping":"none","article_grouping_direction":"ksort","month_year_format":"F Y","item_heading":"4","link_titles":"1","show_date":"0","show_date_field":"created","show_date_format":"Y-m-d H:i:s","show_category":"0","show_hits":"0","show_author":"0","show_introtext":"0","introtext_limit":"100","show_readmore":"0","show_readmore_title":"0","readmore_limit":"15","layout":"_:default","moduleclass_sfx":" esquerda","owncache":"1","cache_time":"1"}', 0, '*'),
(120, 'Refresh', '', '', 0, 'menutop', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_custom', 1, 0, '{"prepare_content":"1","backgroundimage":"","layout":"_:default","moduleclass_sfx":"","cache":"1","cache_time":"900","cachemode":"static"}', 0, '*');

-- --------------------------------------------------------

--
-- Estrutura da tabela `ueb_modules_menu`
--

DROP TABLE IF EXISTS `ueb_modules_menu`;
CREATE TABLE IF NOT EXISTS `ueb_modules_menu` (
  `moduleid` int(11) NOT NULL DEFAULT '0',
  `menuid` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`moduleid`,`menuid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `ueb_modules_menu`
--

INSERT INTO `ueb_modules_menu` (`moduleid`, `menuid`) VALUES
(1, 0),
(2, 0),
(3, 0),
(4, 0),
(6, 0),
(7, 0),
(8, 0),
(9, 0),
(10, 0),
(12, 0),
(13, 0),
(14, 0),
(15, 0),
(16, 0),
(17, 102),
(17, 103),
(17, 104),
(17, 105),
(17, 106),
(17, 107),
(17, 108),
(17, 109),
(17, 110),
(17, 111),
(17, 112),
(17, 113),
(17, 114),
(79, 0),
(86, 0),
(87, 0),
(88, 101),
(89, 0),
(90, 0),
(91, 101),
(92, 0),
(93, 0),
(94, 0),
(95, 0),
(96, 101),
(97, 0),
(98, 0),
(99, 0),
(100, 0),
(102, 0),
(107, 0),
(108, 101),
(109, 101),
(110, 0),
(111, 0),
(112, 0),
(113, 101),
(114, 0),
(115, 0),
(116, 0),
(117, 0),
(118, 0),
(119, 102),
(119, 103),
(119, 104),
(119, 105),
(119, 106),
(119, 107),
(119, 108),
(119, 109),
(119, 110),
(119, 111),
(119, 112),
(119, 113),
(119, 114),
(120, 0);

-- --------------------------------------------------------

--
-- Estrutura da tabela `ueb_newsfeeds`
--

DROP TABLE IF EXISTS `ueb_newsfeeds`;
CREATE TABLE IF NOT EXISTS `ueb_newsfeeds` (
  `catid` int(11) NOT NULL DEFAULT '0',
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL DEFAULT '',
  `alias` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `link` varchar(200) NOT NULL DEFAULT '',
  `filename` varchar(200) DEFAULT NULL,
  `published` tinyint(1) NOT NULL DEFAULT '0',
  `numarticles` int(10) unsigned NOT NULL DEFAULT '1',
  `cache_time` int(10) unsigned NOT NULL DEFAULT '3600',
  `checked_out` int(10) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `ordering` int(11) NOT NULL DEFAULT '0',
  `rtl` tinyint(4) NOT NULL DEFAULT '0',
  `access` int(10) unsigned NOT NULL DEFAULT '0',
  `language` char(7) NOT NULL DEFAULT '',
  `params` text NOT NULL,
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(10) unsigned NOT NULL DEFAULT '0',
  `created_by_alias` varchar(255) NOT NULL DEFAULT '',
  `modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` int(10) unsigned NOT NULL DEFAULT '0',
  `metakey` text NOT NULL,
  `metadesc` text NOT NULL,
  `metadata` text NOT NULL,
  `xreference` varchar(50) NOT NULL COMMENT 'A reference to enable linkages to external data sets.',
  `publish_up` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_down` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `idx_access` (`access`),
  KEY `idx_checkout` (`checked_out`),
  KEY `idx_state` (`published`),
  KEY `idx_catid` (`catid`),
  KEY `idx_createdby` (`created_by`),
  KEY `idx_language` (`language`),
  KEY `idx_xreference` (`xreference`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Extraindo dados da tabela `ueb_newsfeeds`
--


-- --------------------------------------------------------

--
-- Estrutura da tabela `ueb_overrider`
--

DROP TABLE IF EXISTS `ueb_overrider`;
CREATE TABLE IF NOT EXISTS `ueb_overrider` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT 'Primary Key',
  `constant` varchar(255) NOT NULL,
  `string` text NOT NULL,
  `file` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Extraindo dados da tabela `ueb_overrider`
--


-- --------------------------------------------------------

--
-- Estrutura da tabela `ueb_redirect_links`
--

DROP TABLE IF EXISTS `ueb_redirect_links`;
CREATE TABLE IF NOT EXISTS `ueb_redirect_links` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `old_url` varchar(255) NOT NULL,
  `new_url` varchar(255) NOT NULL,
  `referer` varchar(150) NOT NULL,
  `comment` varchar(255) NOT NULL,
  `published` tinyint(4) NOT NULL,
  `created_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_link_old` (`old_url`),
  KEY `idx_link_modifed` (`modified_date`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- Extraindo dados da tabela `ueb_redirect_links`
--

INSERT INTO `ueb_redirect_links` (`id`, `old_url`, `new_url`, `referer`, `comment`, `published`, `created_date`, `modified_date`) VALUES
(1, 'http://squee.com.br/scouts/index.php/undefined', '', 'http://squee.com.br/scouts/index.php/2012-03-03-14-46-21', '', 0, '2012-03-07 14:54:56', '0000-00-00 00:00:00'),
(2, 'http://www.squee.com.br/scouts/index.php/undefined', '', 'http://www.squee.com.br/scouts/index.php/2012-03-03-14-46-21', '', 0, '2012-03-07 15:20:24', '0000-00-00 00:00:00'),
(3, 'http://www.squee.com.br/scouts/index.php/2012-03-03-14-47-43/undefined', '', 'http://www.squee.com.br/scouts/index.php/2012-03-03-14-47-43/3-quisque-eleifend-purus-quis-sagittis-euismod-felis-diam-dapibus-justo', '', 0, '2012-03-07 15:20:39', '0000-00-00 00:00:00'),
(4, 'http://squee.com.br/scouts/index.php/2012-03-03-14-47-43/undefined', '', 'http://squee.com.br/scouts/index.php/2012-03-03-14-47-43/5-phasellus-dolor-magna-mattis-at-hendrerit-ut', '', 0, '2012-03-08 19:01:11', '0000-00-00 00:00:00'),
(5, 'http://squee.com.br/scouts/index.php/2012-03-03-14-47-24', '', 'http://squee.com.br/scouts/index.php/2012-03-03-14-47-43', '', 0, '2012-03-13 14:20:39', '0000-00-00 00:00:00'),
(6, 'http://squee.com.br/scouts/index.php/2012-03-03-14-47-43', '', 'http://squee.com.br/scouts/index.php/2012-03-03-14-47-43/1-vestibulum-nulla-lectus-auctor-a-commo', '', 0, '2012-03-14 00:47:44', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Estrutura da tabela `ueb_schemas`
--

DROP TABLE IF EXISTS `ueb_schemas`;
CREATE TABLE IF NOT EXISTS `ueb_schemas` (
  `extension_id` int(11) NOT NULL,
  `version_id` varchar(20) NOT NULL,
  PRIMARY KEY (`extension_id`,`version_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `ueb_schemas`
--

INSERT INTO `ueb_schemas` (`extension_id`, `version_id`) VALUES
(700, '2.5.4-2012-03-19');

-- --------------------------------------------------------

--
-- Estrutura da tabela `ueb_session`
--

DROP TABLE IF EXISTS `ueb_session`;
CREATE TABLE IF NOT EXISTS `ueb_session` (
  `session_id` varchar(200) NOT NULL DEFAULT '',
  `client_id` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `guest` tinyint(4) unsigned DEFAULT '1',
  `time` varchar(14) DEFAULT '',
  `data` mediumtext,
  `userid` int(11) DEFAULT '0',
  `username` varchar(150) DEFAULT '',
  `usertype` varchar(50) DEFAULT '',
  PRIMARY KEY (`session_id`),
  KEY `whosonline` (`guest`,`usertype`),
  KEY `userid` (`userid`),
  KEY `time` (`time`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `ueb_session`
--

INSERT INTO `ueb_session` (`session_id`, `client_id`, `guest`, `time`, `data`, `userid`, `username`, `usertype`) VALUES
('2748d333389704c10f7cf9523db9bd18', 0, 1, '1334115576', '__default|a:8:{s:24:"session.client.forwarded";s:14:"187.104.232.10";s:22:"session.client.browser";s:81:"Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7; rv:11.0) Gecko/20100101 Firefox/11.0";s:15:"session.counter";i:4;s:8:"registry";O:9:"JRegistry":1:{s:7:"\0*\0data";O:8:"stdClass":0:{}}s:4:"user";O:5:"JUser":23:{s:9:"\0*\0isRoot";b:0;s:2:"id";i:0;s:4:"name";N;s:8:"username";N;s:5:"email";N;s:8:"password";N;s:14:"password_clear";s:0:"";s:8:"usertype";N;s:5:"block";N;s:9:"sendEmail";i:0;s:12:"registerDate";N;s:13:"lastvisitDate";N;s:10:"activation";N;s:6:"params";N;s:6:"groups";a:0:{}s:5:"guest";i:1;s:10:"\0*\0_params";O:9:"JRegistry":1:{s:7:"\0*\0data";O:8:"stdClass":0:{}}s:14:"\0*\0_authGroups";a:1:{i:0;i:1;}s:14:"\0*\0_authLevels";a:2:{i:0;i:1;i:1;i:1;}s:15:"\0*\0_authActions";N;s:12:"\0*\0_errorMsg";N;s:10:"\0*\0_errors";a:0:{}s:3:"aid";i:0;}s:19:"session.timer.start";i:1334114468;s:18:"session.timer.last";i:1334114680;s:17:"session.timer.now";i:1334115576;}', 0, '', ''),
('07cff5f306a1298e72ca1b78f5c2c25a', 1, 0, '1334115603', '__default|a:9:{s:24:"session.client.forwarded";s:14:"187.104.232.10";s:22:"session.client.browser";s:81:"Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7; rv:11.0) Gecko/20100101 Firefox/11.0";s:15:"session.counter";i:6;s:8:"registry";O:9:"JRegistry":1:{s:7:"\0*\0data";O:8:"stdClass":2:{s:11:"application";O:8:"stdClass":1:{s:4:"lang";s:0:"";}s:13:"com_installer";O:8:"stdClass":2:{s:7:"message";s:0:"";s:17:"extension_message";s:0:"";}}}s:4:"user";O:5:"JUser":23:{s:9:"\0*\0isRoot";b:1;s:2:"id";s:2:"42";s:4:"name";s:10:"Super User";s:8:"username";s:5:"admin";s:5:"email";s:27:"guilherme.fonseca@gmail.com";s:8:"password";s:65:"563697ff1f1a29824ff448d43c04039c:QKEwz0ltvDFW1ITyOQJLTNAHOuboTQOy";s:14:"password_clear";s:0:"";s:8:"usertype";s:10:"deprecated";s:5:"block";s:1:"0";s:9:"sendEmail";s:1:"1";s:12:"registerDate";s:19:"2012-03-01 03:37:44";s:13:"lastvisitDate";s:19:"2012-04-11 03:19:52";s:10:"activation";s:1:"0";s:6:"params";s:0:"";s:6:"groups";a:1:{i:8;s:1:"8";}s:5:"guest";i:0;s:10:"\0*\0_params";O:9:"JRegistry":1:{s:7:"\0*\0data";O:8:"stdClass":0:{}}s:14:"\0*\0_authGroups";a:2:{i:0;i:1;i:1;i:8;}s:14:"\0*\0_authLevels";a:4:{i:0;i:1;i:1;i:1;i:2;i:2;i:3;i:3;}s:15:"\0*\0_authActions";N;s:12:"\0*\0_errorMsg";N;s:10:"\0*\0_errors";a:0:{}s:3:"aid";i:0;}s:13:"session.token";s:32:"9fecec3374420367f71b38cf96a98e92";s:19:"session.timer.start";i:1334115589;s:18:"session.timer.last";i:1334115593;s:17:"session.timer.now";i:1334115603;}', 42, 'admin', '');

-- --------------------------------------------------------

--
-- Estrutura da tabela `ueb_template_styles`
--

DROP TABLE IF EXISTS `ueb_template_styles`;
CREATE TABLE IF NOT EXISTS `ueb_template_styles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `template` varchar(50) NOT NULL DEFAULT '',
  `client_id` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `home` char(7) NOT NULL DEFAULT '0',
  `title` varchar(255) NOT NULL DEFAULT '',
  `params` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_template` (`template`),
  KEY `idx_home` (`home`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=14 ;

--
-- Extraindo dados da tabela `ueb_template_styles`
--

INSERT INTO `ueb_template_styles` (`id`, `template`, `client_id`, `home`, `title`, `params`) VALUES
(2, 'bluestork', 1, '1', 'Bluestork - Default', '{"useRoundedCorners":"1","showSiteName":"0"}'),
(5, 'hathor', 1, '0', 'Hathor - Default', '{"showSiteName":"0","colourChoice":"","boldText":"0"}'),
(9, 'cambridgesoftware_html5', 0, '0', 'Scouts', '{}'),
(13, 'regioesescoteiras', 0, '1', 'RegioesEscoteiras - Default', '[]');

-- --------------------------------------------------------

--
-- Estrutura da tabela `ueb_updates`
--

DROP TABLE IF EXISTS `ueb_updates`;
CREATE TABLE IF NOT EXISTS `ueb_updates` (
  `update_id` int(11) NOT NULL AUTO_INCREMENT,
  `update_site_id` int(11) DEFAULT '0',
  `extension_id` int(11) DEFAULT '0',
  `categoryid` int(11) DEFAULT '0',
  `name` varchar(100) DEFAULT '',
  `description` text NOT NULL,
  `element` varchar(100) DEFAULT '',
  `type` varchar(20) DEFAULT '',
  `folder` varchar(20) DEFAULT '',
  `client_id` tinyint(3) DEFAULT '0',
  `version` varchar(10) DEFAULT '',
  `data` text NOT NULL,
  `detailsurl` text NOT NULL,
  `infourl` text NOT NULL,
  PRIMARY KEY (`update_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Available Updates' AUTO_INCREMENT=1 ;

--
-- Extraindo dados da tabela `ueb_updates`
--


-- --------------------------------------------------------

--
-- Estrutura da tabela `ueb_update_categories`
--

DROP TABLE IF EXISTS `ueb_update_categories`;
CREATE TABLE IF NOT EXISTS `ueb_update_categories` (
  `categoryid` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) DEFAULT '',
  `description` text NOT NULL,
  `parent` int(11) DEFAULT '0',
  `updatesite` int(11) DEFAULT '0',
  PRIMARY KEY (`categoryid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Update Categories' AUTO_INCREMENT=1 ;

--
-- Extraindo dados da tabela `ueb_update_categories`
--


-- --------------------------------------------------------

--
-- Estrutura da tabela `ueb_update_sites`
--

DROP TABLE IF EXISTS `ueb_update_sites`;
CREATE TABLE IF NOT EXISTS `ueb_update_sites` (
  `update_site_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT '',
  `type` varchar(20) DEFAULT '',
  `location` text NOT NULL,
  `enabled` int(11) DEFAULT '0',
  `last_check_timestamp` bigint(20) DEFAULT '0',
  PRIMARY KEY (`update_site_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='Update Sites' AUTO_INCREMENT=6 ;

--
-- Extraindo dados da tabela `ueb_update_sites`
--

INSERT INTO `ueb_update_sites` (`update_site_id`, `name`, `type`, `location`, `enabled`, `last_check_timestamp`) VALUES
(1, 'Joomla Core', 'collection', 'http://update.joomla.org/core/list.xml', 1, 1334115593),
(2, 'Joomla Extension Directory', 'collection', 'http://update.joomla.org/jed/list.xml', 1, 1334115593),
(5, 'Joomla.Rjews.Net', 'extension', 'http://joomla.rjews.net/extensions.xml', 1, 1334115593);

-- --------------------------------------------------------

--
-- Estrutura da tabela `ueb_update_sites_extensions`
--

DROP TABLE IF EXISTS `ueb_update_sites_extensions`;
CREATE TABLE IF NOT EXISTS `ueb_update_sites_extensions` (
  `update_site_id` int(11) NOT NULL DEFAULT '0',
  `extension_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`update_site_id`,`extension_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Links extensions to update sites';

--
-- Extraindo dados da tabela `ueb_update_sites_extensions`
--

INSERT INTO `ueb_update_sites_extensions` (`update_site_id`, `extension_id`) VALUES
(1, 700),
(2, 700),
(5, 10024);

-- --------------------------------------------------------

--
-- Estrutura da tabela `ueb_usergroups`
--

DROP TABLE IF EXISTS `ueb_usergroups`;
CREATE TABLE IF NOT EXISTS `ueb_usergroups` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Primary Key',
  `parent_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Adjacency List Reference Id',
  `lft` int(11) NOT NULL DEFAULT '0' COMMENT 'Nested set lft.',
  `rgt` int(11) NOT NULL DEFAULT '0' COMMENT 'Nested set rgt.',
  `title` varchar(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_usergroup_parent_title_lookup` (`parent_id`,`title`),
  KEY `idx_usergroup_title_lookup` (`title`),
  KEY `idx_usergroup_adjacency_lookup` (`parent_id`),
  KEY `idx_usergroup_nested_set_lookup` (`lft`,`rgt`) USING BTREE
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=9 ;

--
-- Extraindo dados da tabela `ueb_usergroups`
--

INSERT INTO `ueb_usergroups` (`id`, `parent_id`, `lft`, `rgt`, `title`) VALUES
(1, 0, 1, 20, 'Public'),
(2, 1, 6, 17, 'Registered'),
(3, 2, 7, 14, 'Author'),
(4, 3, 8, 11, 'Editor'),
(5, 4, 9, 10, 'Publisher'),
(6, 1, 2, 5, 'Manager'),
(7, 6, 3, 4, 'Administrator'),
(8, 1, 18, 19, 'Super Users');

-- --------------------------------------------------------

--
-- Estrutura da tabela `ueb_users`
--

DROP TABLE IF EXISTS `ueb_users`;
CREATE TABLE IF NOT EXISTS `ueb_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `username` varchar(150) NOT NULL DEFAULT '',
  `email` varchar(100) NOT NULL DEFAULT '',
  `password` varchar(100) NOT NULL DEFAULT '',
  `usertype` varchar(25) NOT NULL DEFAULT '',
  `block` tinyint(4) NOT NULL DEFAULT '0',
  `sendEmail` tinyint(4) DEFAULT '0',
  `registerDate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `lastvisitDate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `activation` varchar(100) NOT NULL DEFAULT '',
  `params` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `usertype` (`usertype`),
  KEY `idx_name` (`name`),
  KEY `idx_block` (`block`),
  KEY `username` (`username`),
  KEY `email` (`email`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=43 ;

--
-- Extraindo dados da tabela `ueb_users`
--

INSERT INTO `ueb_users` (`id`, `name`, `username`, `email`, `password`, `usertype`, `block`, `sendEmail`, `registerDate`, `lastvisitDate`, `activation`, `params`) VALUES
(42, 'Super User', 'admin', 'guilherme.fonseca@gmail.com', '563697ff1f1a29824ff448d43c04039c:QKEwz0ltvDFW1ITyOQJLTNAHOuboTQOy', 'deprecated', 0, 1, '2012-03-01 03:37:44', '2012-04-11 03:39:49', '0', '');

-- --------------------------------------------------------

--
-- Estrutura da tabela `ueb_user_notes`
--

DROP TABLE IF EXISTS `ueb_user_notes`;
CREATE TABLE IF NOT EXISTS `ueb_user_notes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `catid` int(10) unsigned NOT NULL DEFAULT '0',
  `subject` varchar(100) NOT NULL DEFAULT '',
  `body` text NOT NULL,
  `state` tinyint(3) NOT NULL DEFAULT '0',
  `checked_out` int(10) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `created_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_user_id` int(10) unsigned NOT NULL,
  `modified_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `review_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_up` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_down` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `idx_user_id` (`user_id`),
  KEY `idx_category_id` (`catid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Extraindo dados da tabela `ueb_user_notes`
--


-- --------------------------------------------------------

--
-- Estrutura da tabela `ueb_user_profiles`
--

DROP TABLE IF EXISTS `ueb_user_profiles`;
CREATE TABLE IF NOT EXISTS `ueb_user_profiles` (
  `user_id` int(11) NOT NULL,
  `profile_key` varchar(100) NOT NULL,
  `profile_value` varchar(255) NOT NULL,
  `ordering` int(11) NOT NULL DEFAULT '0',
  UNIQUE KEY `idx_user_id_profile_key` (`user_id`,`profile_key`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Simple user profile storage table';

--
-- Extraindo dados da tabela `ueb_user_profiles`
--


-- --------------------------------------------------------

--
-- Estrutura da tabela `ueb_user_usergroup_map`
--

DROP TABLE IF EXISTS `ueb_user_usergroup_map`;
CREATE TABLE IF NOT EXISTS `ueb_user_usergroup_map` (
  `user_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Foreign Key to #__users.id',
  `group_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Foreign Key to #__usergroups.id',
  PRIMARY KEY (`user_id`,`group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `ueb_user_usergroup_map`
--

INSERT INTO `ueb_user_usergroup_map` (`user_id`, `group_id`) VALUES
(42, 8);

-- --------------------------------------------------------

--
-- Estrutura da tabela `ueb_viewlevels`
--

DROP TABLE IF EXISTS `ueb_viewlevels`;
CREATE TABLE IF NOT EXISTS `ueb_viewlevels` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Primary Key',
  `title` varchar(100) NOT NULL DEFAULT '',
  `ordering` int(11) NOT NULL DEFAULT '0',
  `rules` varchar(5120) NOT NULL COMMENT 'JSON encoded access control.',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_assetgroup_title_lookup` (`title`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Extraindo dados da tabela `ueb_viewlevels`
--

INSERT INTO `ueb_viewlevels` (`id`, `title`, `ordering`, `rules`) VALUES
(1, 'Public', 0, '[1]'),
(2, 'Registered', 1, '[6,2,8]'),
(3, 'Special', 2, '[6,3,8]');

-- --------------------------------------------------------

--
-- Estrutura da tabela `ueb_weblinks`
--

DROP TABLE IF EXISTS `ueb_weblinks`;
CREATE TABLE IF NOT EXISTS `ueb_weblinks` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `catid` int(11) NOT NULL DEFAULT '0',
  `sid` int(11) NOT NULL DEFAULT '0',
  `title` varchar(250) NOT NULL DEFAULT '',
  `alias` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `url` varchar(250) NOT NULL DEFAULT '',
  `description` text NOT NULL,
  `date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `hits` int(11) NOT NULL DEFAULT '0',
  `state` tinyint(1) NOT NULL DEFAULT '0',
  `checked_out` int(11) NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `ordering` int(11) NOT NULL DEFAULT '0',
  `archived` tinyint(1) NOT NULL DEFAULT '0',
  `approved` tinyint(1) NOT NULL DEFAULT '1',
  `access` int(11) NOT NULL DEFAULT '1',
  `params` text NOT NULL,
  `language` char(7) NOT NULL DEFAULT '',
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(10) unsigned NOT NULL DEFAULT '0',
  `created_by_alias` varchar(255) NOT NULL DEFAULT '',
  `modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` int(10) unsigned NOT NULL DEFAULT '0',
  `metakey` text NOT NULL,
  `metadesc` text NOT NULL,
  `metadata` text NOT NULL,
  `featured` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT 'Set if link is featured.',
  `xreference` varchar(50) NOT NULL COMMENT 'A reference to enable linkages to external data sets.',
  `publish_up` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_down` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `idx_access` (`access`),
  KEY `idx_checkout` (`checked_out`),
  KEY `idx_state` (`state`),
  KEY `idx_catid` (`catid`),
  KEY `idx_createdby` (`created_by`),
  KEY `idx_featured_catid` (`featured`,`catid`),
  KEY `idx_language` (`language`),
  KEY `idx_xreference` (`xreference`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Extraindo dados da tabela `ueb_weblinks`
--

