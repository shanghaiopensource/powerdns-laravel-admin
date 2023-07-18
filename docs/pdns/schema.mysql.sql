-- Adminer 4.1.0 MySQL dump

SET NAMES utf8;
SET time_zone = '+00:00';
SET foreign_key_checks = 0;
SET sql_mode = 'NO_AUTO_VALUE_ON_ZERO';

DROP TABLE IF EXISTS `comments`;
CREATE TABLE `comments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `domain_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `type` varchar(10) NOT NULL,
  `modified_at` int(11) NOT NULL,
  `account` varchar(40) CHARACTER SET utf8 DEFAULT NULL,
  `comment` text CHARACTER SET utf8 NOT NULL,
  PRIMARY KEY (`id`),
  KEY `comments_name_type_idx` (`name`,`type`),
  KEY `comments_order_idx` (`domain_id`,`modified_at`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


DROP TABLE IF EXISTS `cryptokeys`;
CREATE TABLE `cryptokeys` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `domain_id` int(11) NOT NULL,
  `flags` int(11) NOT NULL,
  `active` tinyint(1) DEFAULT NULL,
  `published` tinyint(1) DEFAULT '1',
  `content` text,
  PRIMARY KEY (`id`),
  KEY `domainidindex` (`domain_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


DROP TABLE IF EXISTS `domainmetadata`;
CREATE TABLE `domainmetadata` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `domain_id` int(11) NOT NULL,
  `kind` varchar(32) DEFAULT NULL,
  `content` text,
  PRIMARY KEY (`id`),
  KEY `domainmetadata_idx` (`domain_id`,`kind`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `domainmetadata` (`id`, `domain_id`, `kind`, `content`) VALUES
(2,	1,	'SOA-EDIT-API',	'DEFAULT'),
(3,	1,	'SOA-EDIT',	'INCEPTION-INCREMENT'),
(4,	1,	'API-RECTIFY',	'1');

DROP TABLE IF EXISTS `domains`;
CREATE TABLE `domains` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `master` varchar(128) DEFAULT NULL,
  `last_check` int(11) DEFAULT NULL,
  `type` varchar(8) NOT NULL,
  `notified_serial` int(10) unsigned DEFAULT NULL,
  `account` varchar(40) CHARACTER SET utf8 DEFAULT NULL,
  `options` varchar(64000) DEFAULT NULL,
  `catalog` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_index` (`name`),
  KEY `catalog_idx` (`catalog`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `domains` (`id`, `name`, `master`, `last_check`, `type`, `notified_serial`, `account`, `options`, `catalog`) VALUES
(1,	'zylinkus.com',	'',	NULL,	'NATIVE',	NULL,	'',	NULL,	NULL);

DROP TABLE IF EXISTS `pda_admin_menu`;
CREATE TABLE `pda_admin_menu` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) NOT NULL DEFAULT '0',
  `order` int(11) NOT NULL DEFAULT '0',
  `title` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `uri` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `permission` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `pda_admin_menu` (`id`, `parent_id`, `order`, `title`, `icon`, `uri`, `permission`, `created_at`, `updated_at`) VALUES
(1,	0,	1,	'Dashboard',	'fa-bar-chart',	'/',	NULL,	NULL,	NULL),
(2,	0,	5,	'Admin',	'fa-tasks',	'',	NULL,	NULL,	'2023-07-17 01:21:53'),
(3,	2,	6,	'Users',	'fa-users',	'auth/users',	NULL,	NULL,	'2023-07-17 01:21:53'),
(4,	2,	7,	'Roles',	'fa-user',	'auth/roles',	NULL,	NULL,	'2023-07-17 01:21:53'),
(5,	2,	8,	'Permission',	'fa-ban',	'auth/permissions',	NULL,	NULL,	'2023-07-17 01:21:53'),
(6,	2,	9,	'Menu',	'fa-bars',	'auth/menu',	NULL,	NULL,	'2023-07-17 01:21:53'),
(7,	2,	10,	'Operation log',	'fa-history',	'auth/logs',	NULL,	NULL,	'2023-07-17 01:21:53'),
(8,	0,	3,	'Package',	'fa-space-shuttle',	'packages',	NULL,	'2023-07-17 00:29:29',	'2023-07-17 01:21:53'),
(9,	0,	4,	'Counpon',	'fa-file-code-o',	'counpons',	NULL,	'2023-07-17 01:01:08',	'2023-07-17 01:21:53'),
(10,	0,	2,	'My Domain',	'fa-random',	'users-domains',	NULL,	'2023-07-17 01:21:42',	'2023-07-17 01:31:12');

DROP TABLE IF EXISTS `pda_admin_operation_log`;
CREATE TABLE `pda_admin_operation_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `path` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `method` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ip` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `input` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `pda_admin_operation_log_user_id_index` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `pda_admin_permissions`;
CREATE TABLE `pda_admin_permissions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `http_method` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `http_path` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `pda_admin_permissions_name_unique` (`name`),
  UNIQUE KEY `pda_admin_permissions_slug_unique` (`slug`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `pda_admin_permissions` (`id`, `name`, `slug`, `http_method`, `http_path`, `created_at`, `updated_at`) VALUES
(1,	'All permission',	'*',	'',	'*',	NULL,	NULL),
(2,	'Dashboard',	'dashboard',	'GET',	'/',	NULL,	NULL),
(3,	'Login',	'auth.login',	'',	'/auth/login\r\n/auth/logout',	NULL,	NULL),
(4,	'User setting',	'auth.setting',	'GET,PUT',	'/auth/setting',	NULL,	NULL),
(5,	'Auth management',	'auth.management',	'',	'/auth/roles\r\n/auth/permissions\r\n/auth/menu\r\n/auth/logs',	NULL,	NULL);

DROP TABLE IF EXISTS `pda_admin_roles`;
CREATE TABLE `pda_admin_roles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `pda_admin_roles_name_unique` (`name`),
  UNIQUE KEY `pda_admin_roles_slug_unique` (`slug`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `pda_admin_roles` (`id`, `name`, `slug`, `created_at`, `updated_at`) VALUES
(1,	'Administrator',	'administrator',	'2023-07-17 00:10:26',	'2023-07-17 00:10:26');

DROP TABLE IF EXISTS `pda_admin_role_menu`;
CREATE TABLE `pda_admin_role_menu` (
  `role_id` int(11) NOT NULL,
  `menu_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  KEY `pda_admin_role_menu_role_id_menu_id_index` (`role_id`,`menu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `pda_admin_role_menu` (`role_id`, `menu_id`, `created_at`, `updated_at`) VALUES
(1,	2,	NULL,	NULL),
(1,	8,	NULL,	NULL),
(1,	9,	NULL,	NULL);

DROP TABLE IF EXISTS `pda_admin_role_permissions`;
CREATE TABLE `pda_admin_role_permissions` (
  `role_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  KEY `pda_admin_role_permissions_role_id_permission_id_index` (`role_id`,`permission_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `pda_admin_role_permissions` (`role_id`, `permission_id`, `created_at`, `updated_at`) VALUES
(1,	1,	NULL,	NULL);

DROP TABLE IF EXISTS `pda_admin_role_users`;
CREATE TABLE `pda_admin_role_users` (
  `role_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  KEY `pda_admin_role_users_role_id_user_id_index` (`role_id`,`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `pda_admin_role_users` (`role_id`, `user_id`, `created_at`, `updated_at`) VALUES
(1,	1,	NULL,	NULL);

DROP TABLE IF EXISTS `pda_admin_users`;
CREATE TABLE `pda_admin_users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `pda_admin_users_username_unique` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `pda_admin_users` (`id`, `username`, `password`, `name`, `avatar`, `remember_token`, `created_at`, `updated_at`) VALUES
(1,	'admin',	'$2y$10$GkjFww2gYvG44oHkF5lQjeo7iaMl2iDTVX8OQAeZL1TP3iTEYb47m',	'Administrator',	NULL,	'ncXHnx5NFgdL7VJEDxWGvmB87cYN7KN10qDAgmANR8SEt0J9SCdgnYJnb1XW',	'2023-07-17 00:10:26',	'2023-07-17 00:10:26');

DROP TABLE IF EXISTS `pda_admin_user_permissions`;
CREATE TABLE `pda_admin_user_permissions` (
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  KEY `pda_admin_user_permissions_user_id_permission_id_index` (`user_id`,`permission_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `pda_counpons`;
CREATE TABLE `pda_counpons` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'counpon name',
  `price` double NOT NULL COMMENT 'counpon price',
  `number` int(11) NOT NULL COMMENT 'counpon number',
  `start_at` date NOT NULL COMMENT 'counpon start date',
  `end_at` date NOT NULL COMMENT 'counpon end date',
  `status` enum('0','1') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `pda_counpons_codes`;
CREATE TABLE `pda_counpons_codes` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `counpons_id` int(11) NOT NULL COMMENT 'counpons id',
  `code` char(10) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'code',
  `user_id` int(11) NOT NULL,
  `status` enum('0','1','2','3') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `pda_failed_jobs`;
CREATE TABLE `pda_failed_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `pda_failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `pda_migrations`;
CREATE TABLE `pda_migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `pda_packages`;
CREATE TABLE `pda_packages` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'package title',
  `description` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'package description',
  `start_at` date NOT NULL COMMENT 'package start date',
  `end_at` date NOT NULL COMMENT 'package end date',
  `price` double(8,2) NOT NULL COMMENT 'package price',
  `status` enum('0','1','2') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0' COMMENT 'package status 0 disable, 1 enable',
  `owner` json NOT NULL COMMENT 'package owner',
  `rules` json NOT NULL COMMENT 'package rules',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `pda_packages` (`id`, `title`, `description`, `start_at`, `end_at`, `price`, `status`, `owner`, `rules`, `created_at`, `updated_at`) VALUES
(1,	'Basic',	'Basic Domain  package',	'2023-07-17',	'2030-12-28',	8.99,	'1',	'0',	'[]',	'2023-07-17 01:03:14',	'2023-07-17 01:03:14');

DROP TABLE IF EXISTS `pda_password_resets`;
CREATE TABLE `pda_password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `pda_password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `pda_personal_access_tokens`;
CREATE TABLE `pda_personal_access_tokens` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) unsigned NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `pda_personal_access_tokens_token_unique` (`token`),
  KEY `pda_personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `pda_users`;
CREATE TABLE `pda_users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `pda_users_email_unique` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `pda_users_counpons`;
CREATE TABLE `pda_users_counpons` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `pda_users_domains`;
CREATE TABLE `pda_users_domains` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `domain` char(100) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'domain name',
  `user_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `pda_users_domains` (`id`, `domain`, `user_id`, `created_at`, `updated_at`) VALUES
(1,	'zylinkus.com',	1,	'2023-07-17 02:14:19',	'2023-07-17 02:14:19');

DROP TABLE IF EXISTS `pda_users_domains_records`;
CREATE TABLE `pda_users_domains_records` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `domain_id` int(11) NOT NULL,
  `type` char(6) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `pda_users_orders`;
CREATE TABLE `pda_users_orders` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL DEFAULT '0' COMMENT 'package user',
  `package_id` int(11) NOT NULL DEFAULT '0' COMMENT 'package id',
  `order_sn` char(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'order sn',
  `price` double(8,2) NOT NULL COMMENT 'order price',
  `counpons_id` int(11) NOT NULL DEFAULT '0' COMMENT 'counpons id',
  `status` enum('0','1','2') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `pda_users_orders_order_sn_unique` (`order_sn`),
  KEY `pda_users_orders_user_id_index` (`user_id`),
  KEY `pda_users_orders_package_id_index` (`package_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `pda_users_packages`;
CREATE TABLE `pda_users_packages` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL DEFAULT '0' COMMENT 'package user',
  `package_id` int(11) NOT NULL DEFAULT '0' COMMENT 'package id',
  `start_at` date NOT NULL COMMENT 'package start date',
  `end_at` date NOT NULL COMMENT 'package end date',
  `status` enum('0','1') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `pda_users_profiles`;
CREATE TABLE `pda_users_profiles` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `balance` double(8,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `records`;
CREATE TABLE `records` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `domain_id` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `type` varchar(10) DEFAULT NULL,
  `content` varchar(64000) DEFAULT NULL,
  `ttl` int(11) DEFAULT NULL,
  `prio` int(11) DEFAULT NULL,
  `disabled` tinyint(1) DEFAULT '0',
  `ordername` varchar(255) CHARACTER SET latin1 COLLATE latin1_bin DEFAULT NULL,
  `auth` tinyint(1) DEFAULT '1',
  `change_date` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `nametype_index` (`name`,`type`),
  KEY `domain_id` (`domain_id`),
  KEY `ordername` (`ordername`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `records` (`id`, `domain_id`, `name`, `type`, `content`, `ttl`, `prio`, `disabled`, `ordername`, `auth`, `change_date`) VALUES
(1,	1,	'zylinkus.com',	'SOA',	'a.misconfigured.powerdns.server hostmaster.zylinkus.com 2023071701 10800 3600 604800 3600',	3600,	0,	0,	NULL,	1,	NULL),
(2,	1,	'zylinkus.com',	'NS',	'ns1.zylinkus.com',	3600,	0,	0,	NULL,	1,	NULL),
(3,	1,	'zylinkus.com',	'NS',	'ns2.zylinkus.com',	3600,	0,	0,	NULL,	1,	NULL);

DROP TABLE IF EXISTS `supermasters`;
CREATE TABLE `supermasters` (
  `ip` varchar(64) NOT NULL,
  `nameserver` varchar(255) NOT NULL,
  `account` varchar(40) CHARACTER SET utf8 NOT NULL,
  PRIMARY KEY (`ip`,`nameserver`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


DROP TABLE IF EXISTS `tsigkeys`;
CREATE TABLE `tsigkeys` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `algorithm` varchar(50) DEFAULT NULL,
  `secret` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `namealgoindex` (`name`,`algorithm`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


-- 2023-07-18 03:38:26