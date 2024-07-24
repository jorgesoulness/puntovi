-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versión del servidor:         8.0.30 - MySQL Community Server - GPL
-- SO del servidor:              Win64
-- HeidiSQL Versión:             12.1.0.6537
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

-- Volcando estructura para tabla dbpunto.backend_access_log
CREATE TABLE IF NOT EXISTS `backend_access_log` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int unsigned NOT NULL,
  `ip_address` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla dbpunto.backend_access_log: ~3 rows (aproximadamente)
INSERT INTO `backend_access_log` (`id`, `user_id`, `ip_address`, `created_at`, `updated_at`) VALUES
	(1, 1, '127.0.0.1', '2024-07-24 01:34:30', '2024-07-24 01:34:30'),
	(2, 1, '127.0.0.1', '2024-07-24 04:13:20', '2024-07-24 04:13:20'),
	(3, 1, '127.0.0.1', '2024-07-24 04:13:46', '2024-07-24 04:13:46');

-- Volcando estructura para tabla dbpunto.backend_users
CREATE TABLE IF NOT EXISTS `backend_users` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `first_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `login` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `activation_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `persist_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `reset_password_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `permissions` text COLLATE utf8mb4_unicode_ci,
  `is_activated` tinyint(1) NOT NULL DEFAULT '0',
  `role_id` int unsigned DEFAULT NULL,
  `activated_at` timestamp NULL DEFAULT NULL,
  `last_login` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `login_unique` (`login`),
  UNIQUE KEY `email_unique` (`email`),
  KEY `act_code_index` (`activation_code`),
  KEY `reset_code_index` (`reset_password_code`),
  KEY `admin_role_index` (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla dbpunto.backend_users: ~0 rows (aproximadamente)
INSERT INTO `backend_users` (`id`, `first_name`, `last_name`, `login`, `email`, `password`, `activation_code`, `persist_code`, `reset_password_code`, `permissions`, `is_activated`, `role_id`, `activated_at`, `last_login`, `created_at`, `updated_at`, `deleted_at`, `is_superuser`) VALUES
	(1, 'Jorge', 'Malagón', 'admin_punto', 'soulnes.works@gmail.com', '$2y$10$SMIfhmn65rooKbhhTwz5BeRZVSxZ//PFE/VKsZdcpu.bjJXlORZ1y', NULL, '$2y$10$iYd2byLjrfR6rhNyGgO4NejveiUJdI5RED5V5/Bc14TnigiDNDvmW', NULL, '', 1, 2, NULL, '2024-07-24 04:13:46', '2024-07-24 01:33:43', '2024-07-24 04:13:46', NULL, 1);

-- Volcando estructura para tabla dbpunto.backend_users_groups
CREATE TABLE IF NOT EXISTS `backend_users_groups` (
  `user_id` int unsigned NOT NULL,
  `user_group_id` int unsigned NOT NULL,
  PRIMARY KEY (`user_id`,`user_group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla dbpunto.backend_users_groups: ~0 rows (aproximadamente)
INSERT INTO `backend_users_groups` (`user_id`, `user_group_id`) VALUES
	(1, 1);

-- Volcando estructura para tabla dbpunto.backend_user_groups
CREATE TABLE IF NOT EXISTS `backend_user_groups` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `is_new_user_default` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_unique` (`name`),
  KEY `code_index` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla dbpunto.backend_user_groups: ~0 rows (aproximadamente)
INSERT INTO `backend_user_groups` (`id`, `name`, `created_at`, `updated_at`, `code`, `description`, `is_new_user_default`) VALUES
	(1, 'Owners', '2024-07-24 01:33:43', '2024-07-24 01:33:43', 'owners', 'Default group for website owners.', 0);

-- Volcando estructura para tabla dbpunto.backend_user_preferences
CREATE TABLE IF NOT EXISTS `backend_user_preferences` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int unsigned NOT NULL,
  `namespace` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `group` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `item` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `user_item_index` (`user_id`,`namespace`,`group`,`item`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla dbpunto.backend_user_preferences: ~0 rows (aproximadamente)
INSERT INTO `backend_user_preferences` (`id`, `user_id`, `namespace`, `group`, `item`, `value`) VALUES
	(1, 1, 'backend', 'reportwidgets', 'dashboard', '{"welcome":{"class":"Backend\\\\ReportWidgets\\\\Welcome","sortOrder":50,"configuration":{"ocWidgetWidth":7}},"systemStatus":{"class":"System\\\\ReportWidgets\\\\Status","sortOrder":60,"configuration":{"ocWidgetWidth":7}},"activeTheme":{"class":"Cms\\\\ReportWidgets\\\\ActiveTheme","sortOrder":70,"configuration":{"ocWidgetWidth":5}},"report_container_dashboard_4":{"class":"Indikator\\\\Backend\\\\ReportWidgets\\\\Cache","configuration":{"title":"Cache usage","ocWidgetWidth":"12","ocWidgetNewRow":null},"sortOrder":71}}'),
	(2, 1, 'backend', 'backend', 'preferences', '{"locale":"es","fallback_locale":"en","timezone":"America\\/Mexico_City","editor_font_size":"12","editor_word_wrap":"fluid","editor_code_folding":"manual","editor_tab_size":"4","editor_theme":"twilight","editor_show_invisibles":"0","editor_highlight_active_line":"1","editor_use_hard_tabs":"0","editor_show_gutter":"1","editor_auto_closing":"0","editor_autocompletion":"manual","editor_enable_snippets":"0","editor_display_indent_guides":"0","editor_show_print_margin":"0","rounded_avatar":"0","topmenu_label":"0","sidebar_description":"0","sidebar_search":"0","focus_searchfield":"0","context_menu":"0","virtual_keyboard":"0","user_id":1}');

-- Volcando estructura para tabla dbpunto.backend_user_roles
CREATE TABLE IF NOT EXISTS `backend_user_roles` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `permissions` text COLLATE utf8mb4_unicode_ci,
  `is_system` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `role_unique` (`name`),
  KEY `role_code_index` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla dbpunto.backend_user_roles: ~2 rows (aproximadamente)
INSERT INTO `backend_user_roles` (`id`, `name`, `code`, `description`, `permissions`, `is_system`, `created_at`, `updated_at`) VALUES
	(1, 'Publisher', 'publisher', 'Site editor with access to publishing tools.', '', 1, '2024-07-24 01:33:43', '2024-07-24 01:33:43'),
	(2, 'Developer', 'developer', 'Site administrator with access to developer tools.', '', 1, '2024-07-24 01:33:43', '2024-07-24 01:33:43');

-- Volcando estructura para tabla dbpunto.backend_user_throttle
CREATE TABLE IF NOT EXISTS `backend_user_throttle` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int unsigned DEFAULT NULL,
  `ip_address` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `attempts` int NOT NULL DEFAULT '0',
  `last_attempt_at` timestamp NULL DEFAULT NULL,
  `is_suspended` tinyint(1) NOT NULL DEFAULT '0',
  `suspended_at` timestamp NULL DEFAULT NULL,
  `is_banned` tinyint(1) NOT NULL DEFAULT '0',
  `banned_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `backend_user_throttle_user_id_index` (`user_id`),
  KEY `backend_user_throttle_ip_address_index` (`ip_address`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla dbpunto.backend_user_throttle: ~0 rows (aproximadamente)
INSERT INTO `backend_user_throttle` (`id`, `user_id`, `ip_address`, `attempts`, `last_attempt_at`, `is_suspended`, `suspended_at`, `is_banned`, `banned_at`) VALUES
	(1, 1, '127.0.0.1', 0, NULL, 0, NULL, 0, NULL);

-- Volcando estructura para tabla dbpunto.cache
CREATE TABLE IF NOT EXISTS `cache` (
  `key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL,
  UNIQUE KEY `cache_key_unique` (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla dbpunto.cache: ~0 rows (aproximadamente)

-- Volcando estructura para tabla dbpunto.cms_theme_data
CREATE TABLE IF NOT EXISTS `cms_theme_data` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `theme` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `data` mediumtext COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cms_theme_data_theme_index` (`theme`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla dbpunto.cms_theme_data: ~0 rows (aproximadamente)

-- Volcando estructura para tabla dbpunto.cms_theme_logs
CREATE TABLE IF NOT EXISTS `cms_theme_logs` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `theme` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `template` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `old_template` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci,
  `old_content` longtext COLLATE utf8mb4_unicode_ci,
  `user_id` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cms_theme_logs_type_index` (`type`),
  KEY `cms_theme_logs_theme_index` (`theme`),
  KEY `cms_theme_logs_user_id_index` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla dbpunto.cms_theme_logs: ~0 rows (aproximadamente)

-- Volcando estructura para tabla dbpunto.cms_theme_templates
CREATE TABLE IF NOT EXISTS `cms_theme_templates` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `source` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `path` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `file_size` int unsigned NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cms_theme_templates_source_index` (`source`),
  KEY `cms_theme_templates_path_index` (`path`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla dbpunto.cms_theme_templates: ~0 rows (aproximadamente)

-- Volcando estructura para tabla dbpunto.deferred_bindings
CREATE TABLE IF NOT EXISTS `deferred_bindings` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `master_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `master_field` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slave_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slave_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `session_key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_bind` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `deferred_bindings_master_type_index` (`master_type`),
  KEY `deferred_bindings_master_field_index` (`master_field`),
  KEY `deferred_bindings_slave_type_index` (`slave_type`),
  KEY `deferred_bindings_slave_id_index` (`slave_id`),
  KEY `deferred_bindings_session_key_index` (`session_key`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla dbpunto.deferred_bindings: ~0 rows (aproximadamente)

-- Volcando estructura para tabla dbpunto.failed_jobs
CREATE TABLE IF NOT EXISTS `failed_jobs` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci,
  `failed_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla dbpunto.failed_jobs: ~0 rows (aproximadamente)

-- Volcando estructura para tabla dbpunto.indikator_backend_trash
CREATE TABLE IF NOT EXISTS `indikator_backend_trash` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1',
  `path` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `size` varchar(8) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla dbpunto.indikator_backend_trash: ~0 rows (aproximadamente)

-- Volcando estructura para tabla dbpunto.jobs
CREATE TABLE IF NOT EXISTS `jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `queue` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint unsigned NOT NULL,
  `reserved_at` int unsigned DEFAULT NULL,
  `available_at` int unsigned NOT NULL,
  `created_at` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `jobs_queue_reserved_at_index` (`queue`,`reserved_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla dbpunto.jobs: ~0 rows (aproximadamente)

-- Volcando estructura para tabla dbpunto.migrations
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla dbpunto.migrations: ~37 rows (aproximadamente)
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
	(1, '2013_10_01_000001_Db_Deferred_Bindings', 1),
	(2, '2013_10_01_000002_Db_System_Files', 1),
	(3, '2013_10_01_000003_Db_System_Plugin_Versions', 1),
	(4, '2013_10_01_000004_Db_System_Plugin_History', 1),
	(5, '2013_10_01_000005_Db_System_Settings', 1),
	(6, '2013_10_01_000006_Db_System_Parameters', 1),
	(7, '2013_10_01_000007_Db_System_Add_Disabled_Flag', 1),
	(8, '2013_10_01_000008_Db_System_Mail_Templates', 1),
	(9, '2013_10_01_000009_Db_System_Mail_Layouts', 1),
	(10, '2014_10_01_000010_Db_Jobs', 1),
	(11, '2014_10_01_000011_Db_System_Event_Logs', 1),
	(12, '2014_10_01_000012_Db_System_Request_Logs', 1),
	(13, '2014_10_01_000013_Db_System_Sessions', 1),
	(14, '2015_10_01_000014_Db_System_Mail_Layout_Rename', 1),
	(15, '2015_10_01_000015_Db_System_Add_Frozen_Flag', 1),
	(16, '2015_10_01_000016_Db_Cache', 1),
	(17, '2015_10_01_000017_Db_System_Revisions', 1),
	(18, '2015_10_01_000018_Db_FailedJobs', 1),
	(19, '2016_10_01_000019_Db_System_Plugin_History_Detail_Text', 1),
	(20, '2016_10_01_000020_Db_System_Timestamp_Fix', 1),
	(21, '2017_08_04_121309_Db_Deferred_Bindings_Add_Index_Session', 1),
	(22, '2017_10_01_000021_Db_System_Sessions_Update', 1),
	(23, '2017_10_01_000022_Db_Jobs_FailedJobs_Update', 1),
	(24, '2017_10_01_000023_Db_System_Mail_Partials', 1),
	(25, '2017_10_23_000024_Db_System_Mail_Layouts_Add_Options_Field', 1),
	(26, '2013_10_01_000001_Db_Backend_Users', 2),
	(27, '2013_10_01_000002_Db_Backend_User_Groups', 2),
	(28, '2013_10_01_000003_Db_Backend_Users_Groups', 2),
	(29, '2013_10_01_000004_Db_Backend_User_Throttle', 2),
	(30, '2014_01_04_000005_Db_Backend_User_Preferences', 2),
	(31, '2014_10_01_000006_Db_Backend_Access_Log', 2),
	(32, '2014_10_01_000007_Db_Backend_Add_Description_Field', 2),
	(33, '2015_10_01_000008_Db_Backend_Add_Superuser_Flag', 2),
	(34, '2016_10_01_000009_Db_Backend_Timestamp_Fix', 2),
	(35, '2017_10_01_000010_Db_Backend_User_Roles', 2),
	(36, '2018_12_16_000011_Db_Backend_Add_Deleted_At', 2),
	(37, '2014_10_01_000001_Db_Cms_Theme_Data', 3),
	(38, '2016_10_01_000002_Db_Cms_Timestamp_Fix', 3),
	(39, '2017_10_01_000003_Db_Cms_Theme_Logs', 3),
	(40, '2018_11_01_000001_Db_Cms_Theme_Templates', 3);

-- Volcando estructura para tabla dbpunto.sessions
CREATE TABLE IF NOT EXISTS `sessions` (
  `id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` text COLLATE utf8mb4_unicode_ci,
  `last_activity` int DEFAULT NULL,
  `user_id` int unsigned DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci,
  UNIQUE KEY `sessions_id_unique` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla dbpunto.sessions: ~0 rows (aproximadamente)

-- Volcando estructura para tabla dbpunto.system_event_logs
CREATE TABLE IF NOT EXISTS `system_event_logs` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `level` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `message` text COLLATE utf8mb4_unicode_ci,
  `details` mediumtext COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `system_event_logs_level_index` (`level`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla dbpunto.system_event_logs: ~7 rows (aproximadamente)
INSERT INTO `system_event_logs` (`id`, `level`, `message`, `details`, `created_at`, `updated_at`) VALUES
	(1, 'error', 'Symfony\\Component\\Debug\\Exception\\FatalThrowableError: Class \'Tailor\\Models\\EntryRecord\' not found in C:\\laragon\\www\\visual\\plugins\\artistro08\\tailorstartercompanion\\Plugin.php:55\nStack trace:\n#0 C:\\laragon\\www\\visual\\modules\\system\\classes\\PluginManager.php(317): Artistro08\\TailorStarterCompanion\\Plugin->boot()\n#1 C:\\laragon\\www\\visual\\modules\\system\\classes\\PluginManager.php(299): System\\Classes\\PluginManager->bootPlugin(Object(Artistro08\\TailorStarterCompanion\\Plugin))\n#2 C:\\laragon\\www\\visual\\modules\\system\\ServiceProvider.php(105): System\\Classes\\PluginManager->bootAll()\n#3 [internal function]: System\\ServiceProvider->boot()\n#4 C:\\laragon\\www\\visual\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(29): call_user_func_array(Array, Array)\n#5 C:\\laragon\\www\\visual\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(87): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#6 C:\\laragon\\www\\visual\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(31): Illuminate\\Container\\BoundMethod::callBoundMethod(Object(October\\Rain\\Foundation\\Application), Array, Object(Closure))\n#7 C:\\laragon\\www\\visual\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Container.php(549): Illuminate\\Container\\BoundMethod::call(Object(October\\Rain\\Foundation\\Application), Array, Array, NULL)\n#8 C:\\laragon\\www\\visual\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Application.php(792): Illuminate\\Container\\Container->call(Array)\n#9 C:\\laragon\\www\\visual\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Application.php(775): Illuminate\\Foundation\\Application->bootProvider(Object(System\\ServiceProvider))\n#10 [internal function]: Illuminate\\Foundation\\Application->Illuminate\\Foundation\\{closure}(Object(System\\ServiceProvider), 24)\n#11 C:\\laragon\\www\\visual\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Application.php(776): array_walk(Array, Object(Closure))\n#12 C:\\laragon\\www\\visual\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Bootstrap\\BootProviders.php(17): Illuminate\\Foundation\\Application->boot()\n#13 C:\\laragon\\www\\visual\\vendor\\october\\rain\\src\\Foundation\\Application.php(85): Illuminate\\Foundation\\Bootstrap\\BootProviders->bootstrap(Object(October\\Rain\\Foundation\\Application))\n#14 C:\\laragon\\www\\visual\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Http\\Kernel.php(162): October\\Rain\\Foundation\\Application->bootstrapWith(Array)\n#15 C:\\laragon\\www\\visual\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Http\\Kernel.php(146): Illuminate\\Foundation\\Http\\Kernel->bootstrap()\n#16 C:\\laragon\\www\\visual\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Http\\Kernel.php(116): Illuminate\\Foundation\\Http\\Kernel->sendRequestThroughRouter(Object(Illuminate\\Http\\Request))\n#17 C:\\laragon\\www\\visual\\index.php(43): Illuminate\\Foundation\\Http\\Kernel->handle(Object(Illuminate\\Http\\Request))\n#18 {main}', NULL, '2024-07-24 02:19:14', '2024-07-24 02:19:14'),
	(2, 'error', 'Twig\\Error\\SyntaxError: An array element must be followed by a comma. Unexpected token "string" of value "assets/css/style.min.css" ("punctuation" expected with value ",") in "C:\\laragon\\www\\visual/themes/punto-visual/layouts/default.htm" at line 23. in C:\\laragon\\www\\visual\\vendor\\twig\\twig\\src\\TokenStream.php:76\nStack trace:\n#0 C:\\laragon\\www\\visual\\vendor\\twig\\twig\\src\\ExpressionParser.php(329): Twig\\TokenStream->expect(9, \',\', \'An array elemen...\')\n#1 C:\\laragon\\www\\visual\\vendor\\twig\\twig\\src\\ExpressionParser.php(279): Twig\\ExpressionParser->parseArrayExpression()\n#2 C:\\laragon\\www\\visual\\vendor\\twig\\twig\\src\\ExpressionParser.php(175): Twig\\ExpressionParser->parsePrimaryExpression()\n#3 C:\\laragon\\www\\visual\\vendor\\twig\\twig\\src\\ExpressionParser.php(70): Twig\\ExpressionParser->getPrimary()\n#4 C:\\laragon\\www\\visual\\vendor\\twig\\twig\\src\\Parser.php(142): Twig\\ExpressionParser->parseExpression()\n#5 C:\\laragon\\www\\visual\\vendor\\twig\\twig\\src\\Parser.php(98): Twig\\Parser->subparse(NULL, false)\n#6 C:\\laragon\\www\\visual\\vendor\\twig\\twig\\src\\Environment.php(563): Twig\\Parser->parse(Object(Twig\\TokenStream))\n#7 C:\\laragon\\www\\visual\\vendor\\twig\\twig\\src\\Environment.php(595): Twig\\Environment->parse(Object(Twig\\TokenStream))\n#8 C:\\laragon\\www\\visual\\vendor\\twig\\twig\\src\\Environment.php(408): Twig\\Environment->compileSource(Object(Twig\\Source))\n#9 C:\\laragon\\www\\visual\\vendor\\twig\\twig\\src\\Environment.php(381): Twig\\Environment->loadClass(\'__TwigTemplate_...\', \'C:\\\\laragon\\\\www\\\\...\', NULL)\n#10 C:\\laragon\\www\\visual\\modules\\cms\\classes\\Controller.php(434): Twig\\Environment->loadTemplate(\'C:\\\\laragon\\\\www\\\\...\')\n#11 C:\\laragon\\www\\visual\\modules\\cms\\classes\\Controller.php(225): Cms\\Classes\\Controller->runPage(Object(Cms\\Classes\\Page))\n#12 C:\\laragon\\www\\visual\\modules\\cms\\classes\\CmsController.php(50): Cms\\Classes\\Controller->run(\'/\')\n#13 [internal function]: Cms\\Classes\\CmsController->run(\'/\')\n#14 C:\\laragon\\www\\visual\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Controller.php(54): call_user_func_array(Array, Array)\n#15 C:\\laragon\\www\\visual\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\ControllerDispatcher.php(45): Illuminate\\Routing\\Controller->callAction(\'run\', Array)\n#16 C:\\laragon\\www\\visual\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Route.php(212): Illuminate\\Routing\\ControllerDispatcher->dispatch(Object(Illuminate\\Routing\\Route), Object(Cms\\Classes\\CmsController), \'run\')\n#17 C:\\laragon\\www\\visual\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Route.php(169): Illuminate\\Routing\\Route->runController()\n#18 C:\\laragon\\www\\visual\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Router.php(658): Illuminate\\Routing\\Route->run()\n#19 C:\\laragon\\www\\visual\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Pipeline.php(30): Illuminate\\Routing\\Router->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#20 C:\\laragon\\www\\visual\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Middleware\\SubstituteBindings.php(41): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#21 C:\\laragon\\www\\visual\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(149): Illuminate\\Routing\\Middleware\\SubstituteBindings->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#22 C:\\laragon\\www\\visual\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Pipeline.php(53): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#23 C:\\laragon\\www\\visual\\vendor\\laravel\\framework\\src\\Illuminate\\View\\Middleware\\ShareErrorsFromSession.php(49): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#24 C:\\laragon\\www\\visual\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(149): Illuminate\\View\\Middleware\\ShareErrorsFromSession->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#25 C:\\laragon\\www\\visual\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Pipeline.php(53): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#26 C:\\laragon\\www\\visual\\vendor\\laravel\\framework\\src\\Illuminate\\Session\\Middleware\\StartSession.php(63): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#27 C:\\laragon\\www\\visual\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(149): Illuminate\\Session\\Middleware\\StartSession->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#28 C:\\laragon\\www\\visual\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Pipeline.php(53): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#29 C:\\laragon\\www\\visual\\vendor\\laravel\\framework\\src\\Illuminate\\Cookie\\Middleware\\AddQueuedCookiesToResponse.php(37): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#30 C:\\laragon\\www\\visual\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(149): Illuminate\\Cookie\\Middleware\\AddQueuedCookiesToResponse->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#31 C:\\laragon\\www\\visual\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Pipeline.php(53): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#32 C:\\laragon\\www\\visual\\vendor\\laravel\\framework\\src\\Illuminate\\Cookie\\Middleware\\EncryptCookies.php(68): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#33 C:\\laragon\\www\\visual\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(149): Illuminate\\Cookie\\Middleware\\EncryptCookies->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#34 C:\\laragon\\www\\visual\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Pipeline.php(53): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#35 C:\\laragon\\www\\visual\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(102): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#36 C:\\laragon\\www\\visual\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Router.php(660): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#37 C:\\laragon\\www\\visual\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Router.php(635): Illuminate\\Routing\\Router->runRouteWithinStack(Object(Illuminate\\Routing\\Route), Object(Illuminate\\Http\\Request))\n#38 C:\\laragon\\www\\visual\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Router.php(601): Illuminate\\Routing\\Router->runRoute(Object(Illuminate\\Http\\Request), Object(Illuminate\\Routing\\Route))\n#39 C:\\laragon\\www\\visual\\vendor\\october\\rain\\src\\Router\\CoreRouter.php(20): Illuminate\\Routing\\Router->dispatchToRoute(Object(Illuminate\\Http\\Request))\n#40 C:\\laragon\\www\\visual\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Http\\Kernel.php(176): October\\Rain\\Router\\CoreRouter->dispatch(Object(Illuminate\\Http\\Request))\n#41 C:\\laragon\\www\\visual\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Pipeline.php(30): Illuminate\\Foundation\\Http\\Kernel->Illuminate\\Foundation\\Http\\{closure}(Object(Illuminate\\Http\\Request))\n#42 C:\\laragon\\www\\visual\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Http\\Middleware\\CheckForMaintenanceMode.php(46): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#43 C:\\laragon\\www\\visual\\vendor\\october\\rain\\src\\Foundation\\Http\\Middleware\\CheckForMaintenanceMode.php(25): Illuminate\\Foundation\\Http\\Middleware\\CheckForMaintenanceMode->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#44 C:\\laragon\\www\\visual\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(149): October\\Rain\\Foundation\\Http\\Middleware\\CheckForMaintenanceMode->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#45 C:\\laragon\\www\\visual\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Pipeline.php(53): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#46 C:\\laragon\\www\\visual\\vendor\\october\\rain\\src\\Http\\Middleware\\TrustHosts.php(46): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#47 C:\\laragon\\www\\visual\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(149): October\\Rain\\Http\\Middleware\\TrustHosts->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#48 C:\\laragon\\www\\visual\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Pipeline.php(53): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#49 C:\\laragon\\www\\visual\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(102): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#50 C:\\laragon\\www\\visual\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Http\\Kernel.php(151): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#51 C:\\laragon\\www\\visual\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Http\\Kernel.php(116): Illuminate\\Foundation\\Http\\Kernel->sendRequestThroughRouter(Object(Illuminate\\Http\\Request))\n#52 C:\\laragon\\www\\visual\\index.php(43): Illuminate\\Foundation\\Http\\Kernel->handle(Object(Illuminate\\Http\\Request))\n#53 {main}', NULL, '2024-07-24 02:36:48', '2024-07-24 02:36:48'),
	(3, 'error', 'Twig\\Error\\SyntaxError: An array element must be followed by a comma. Unexpected token "string" of value "assets/css/style.min.css" ("punctuation" expected with value ",") in "C:\\laragon\\www\\visual/themes/punto-visual/layouts/default.htm" at line 23. in C:\\laragon\\www\\visual\\vendor\\twig\\twig\\src\\TokenStream.php:76\nStack trace:\n#0 C:\\laragon\\www\\visual\\vendor\\twig\\twig\\src\\ExpressionParser.php(329): Twig\\TokenStream->expect(9, \',\', \'An array elemen...\')\n#1 C:\\laragon\\www\\visual\\vendor\\twig\\twig\\src\\ExpressionParser.php(279): Twig\\ExpressionParser->parseArrayExpression()\n#2 C:\\laragon\\www\\visual\\vendor\\twig\\twig\\src\\ExpressionParser.php(175): Twig\\ExpressionParser->parsePrimaryExpression()\n#3 C:\\laragon\\www\\visual\\vendor\\twig\\twig\\src\\ExpressionParser.php(70): Twig\\ExpressionParser->getPrimary()\n#4 C:\\laragon\\www\\visual\\vendor\\twig\\twig\\src\\Parser.php(142): Twig\\ExpressionParser->parseExpression()\n#5 C:\\laragon\\www\\visual\\vendor\\twig\\twig\\src\\Parser.php(98): Twig\\Parser->subparse(NULL, false)\n#6 C:\\laragon\\www\\visual\\vendor\\twig\\twig\\src\\Environment.php(563): Twig\\Parser->parse(Object(Twig\\TokenStream))\n#7 C:\\laragon\\www\\visual\\vendor\\twig\\twig\\src\\Environment.php(595): Twig\\Environment->parse(Object(Twig\\TokenStream))\n#8 C:\\laragon\\www\\visual\\vendor\\twig\\twig\\src\\Environment.php(408): Twig\\Environment->compileSource(Object(Twig\\Source))\n#9 C:\\laragon\\www\\visual\\vendor\\twig\\twig\\src\\Environment.php(381): Twig\\Environment->loadClass(\'__TwigTemplate_...\', \'C:\\\\laragon\\\\www\\\\...\', NULL)\n#10 C:\\laragon\\www\\visual\\modules\\cms\\classes\\Controller.php(434): Twig\\Environment->loadTemplate(\'C:\\\\laragon\\\\www\\\\...\')\n#11 C:\\laragon\\www\\visual\\modules\\cms\\classes\\Controller.php(225): Cms\\Classes\\Controller->runPage(Object(Cms\\Classes\\Page))\n#12 C:\\laragon\\www\\visual\\modules\\cms\\classes\\CmsController.php(50): Cms\\Classes\\Controller->run(\'/\')\n#13 [internal function]: Cms\\Classes\\CmsController->run(\'/\')\n#14 C:\\laragon\\www\\visual\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Controller.php(54): call_user_func_array(Array, Array)\n#15 C:\\laragon\\www\\visual\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\ControllerDispatcher.php(45): Illuminate\\Routing\\Controller->callAction(\'run\', Array)\n#16 C:\\laragon\\www\\visual\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Route.php(212): Illuminate\\Routing\\ControllerDispatcher->dispatch(Object(Illuminate\\Routing\\Route), Object(Cms\\Classes\\CmsController), \'run\')\n#17 C:\\laragon\\www\\visual\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Route.php(169): Illuminate\\Routing\\Route->runController()\n#18 C:\\laragon\\www\\visual\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Router.php(658): Illuminate\\Routing\\Route->run()\n#19 C:\\laragon\\www\\visual\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Pipeline.php(30): Illuminate\\Routing\\Router->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#20 C:\\laragon\\www\\visual\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Middleware\\SubstituteBindings.php(41): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#21 C:\\laragon\\www\\visual\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(149): Illuminate\\Routing\\Middleware\\SubstituteBindings->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#22 C:\\laragon\\www\\visual\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Pipeline.php(53): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#23 C:\\laragon\\www\\visual\\vendor\\laravel\\framework\\src\\Illuminate\\View\\Middleware\\ShareErrorsFromSession.php(49): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#24 C:\\laragon\\www\\visual\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(149): Illuminate\\View\\Middleware\\ShareErrorsFromSession->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#25 C:\\laragon\\www\\visual\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Pipeline.php(53): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#26 C:\\laragon\\www\\visual\\vendor\\laravel\\framework\\src\\Illuminate\\Session\\Middleware\\StartSession.php(63): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#27 C:\\laragon\\www\\visual\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(149): Illuminate\\Session\\Middleware\\StartSession->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#28 C:\\laragon\\www\\visual\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Pipeline.php(53): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#29 C:\\laragon\\www\\visual\\vendor\\laravel\\framework\\src\\Illuminate\\Cookie\\Middleware\\AddQueuedCookiesToResponse.php(37): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#30 C:\\laragon\\www\\visual\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(149): Illuminate\\Cookie\\Middleware\\AddQueuedCookiesToResponse->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#31 C:\\laragon\\www\\visual\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Pipeline.php(53): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#32 C:\\laragon\\www\\visual\\vendor\\laravel\\framework\\src\\Illuminate\\Cookie\\Middleware\\EncryptCookies.php(68): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#33 C:\\laragon\\www\\visual\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(149): Illuminate\\Cookie\\Middleware\\EncryptCookies->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#34 C:\\laragon\\www\\visual\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Pipeline.php(53): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#35 C:\\laragon\\www\\visual\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(102): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#36 C:\\laragon\\www\\visual\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Router.php(660): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#37 C:\\laragon\\www\\visual\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Router.php(635): Illuminate\\Routing\\Router->runRouteWithinStack(Object(Illuminate\\Routing\\Route), Object(Illuminate\\Http\\Request))\n#38 C:\\laragon\\www\\visual\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Router.php(601): Illuminate\\Routing\\Router->runRoute(Object(Illuminate\\Http\\Request), Object(Illuminate\\Routing\\Route))\n#39 C:\\laragon\\www\\visual\\vendor\\october\\rain\\src\\Router\\CoreRouter.php(20): Illuminate\\Routing\\Router->dispatchToRoute(Object(Illuminate\\Http\\Request))\n#40 C:\\laragon\\www\\visual\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Http\\Kernel.php(176): October\\Rain\\Router\\CoreRouter->dispatch(Object(Illuminate\\Http\\Request))\n#41 C:\\laragon\\www\\visual\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Pipeline.php(30): Illuminate\\Foundation\\Http\\Kernel->Illuminate\\Foundation\\Http\\{closure}(Object(Illuminate\\Http\\Request))\n#42 C:\\laragon\\www\\visual\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Http\\Middleware\\CheckForMaintenanceMode.php(46): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#43 C:\\laragon\\www\\visual\\vendor\\october\\rain\\src\\Foundation\\Http\\Middleware\\CheckForMaintenanceMode.php(25): Illuminate\\Foundation\\Http\\Middleware\\CheckForMaintenanceMode->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#44 C:\\laragon\\www\\visual\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(149): October\\Rain\\Foundation\\Http\\Middleware\\CheckForMaintenanceMode->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#45 C:\\laragon\\www\\visual\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Pipeline.php(53): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#46 C:\\laragon\\www\\visual\\vendor\\october\\rain\\src\\Http\\Middleware\\TrustHosts.php(46): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#47 C:\\laragon\\www\\visual\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(149): October\\Rain\\Http\\Middleware\\TrustHosts->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#48 C:\\laragon\\www\\visual\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Pipeline.php(53): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#49 C:\\laragon\\www\\visual\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(102): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#50 C:\\laragon\\www\\visual\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Http\\Kernel.php(151): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#51 C:\\laragon\\www\\visual\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Http\\Kernel.php(116): Illuminate\\Foundation\\Http\\Kernel->sendRequestThroughRouter(Object(Illuminate\\Http\\Request))\n#52 C:\\laragon\\www\\visual\\index.php(43): Illuminate\\Foundation\\Http\\Kernel->handle(Object(Illuminate\\Http\\Request))\n#53 {main}', NULL, '2024-07-24 02:36:48', '2024-07-24 02:36:48'),
	(4, 'error', 'Twig\\Error\\SyntaxError: An array element must be followed by a comma. Unexpected token "string" of value "assets/css/style.min.css" ("punctuation" expected with value ",") in "C:\\laragon\\www\\visual/themes/punto-visual/layouts/default.htm" at line 23. in C:\\laragon\\www\\visual\\vendor\\twig\\twig\\src\\TokenStream.php:76\nStack trace:\n#0 C:\\laragon\\www\\visual\\vendor\\twig\\twig\\src\\ExpressionParser.php(329): Twig\\TokenStream->expect(9, \',\', \'An array elemen...\')\n#1 C:\\laragon\\www\\visual\\vendor\\twig\\twig\\src\\ExpressionParser.php(279): Twig\\ExpressionParser->parseArrayExpression()\n#2 C:\\laragon\\www\\visual\\vendor\\twig\\twig\\src\\ExpressionParser.php(175): Twig\\ExpressionParser->parsePrimaryExpression()\n#3 C:\\laragon\\www\\visual\\vendor\\twig\\twig\\src\\ExpressionParser.php(70): Twig\\ExpressionParser->getPrimary()\n#4 C:\\laragon\\www\\visual\\vendor\\twig\\twig\\src\\Parser.php(142): Twig\\ExpressionParser->parseExpression()\n#5 C:\\laragon\\www\\visual\\vendor\\twig\\twig\\src\\Parser.php(98): Twig\\Parser->subparse(NULL, false)\n#6 C:\\laragon\\www\\visual\\vendor\\twig\\twig\\src\\Environment.php(563): Twig\\Parser->parse(Object(Twig\\TokenStream))\n#7 C:\\laragon\\www\\visual\\vendor\\twig\\twig\\src\\Environment.php(595): Twig\\Environment->parse(Object(Twig\\TokenStream))\n#8 C:\\laragon\\www\\visual\\vendor\\twig\\twig\\src\\Environment.php(408): Twig\\Environment->compileSource(Object(Twig\\Source))\n#9 C:\\laragon\\www\\visual\\vendor\\twig\\twig\\src\\Environment.php(381): Twig\\Environment->loadClass(\'__TwigTemplate_...\', \'C:\\\\laragon\\\\www\\\\...\', NULL)\n#10 C:\\laragon\\www\\visual\\modules\\cms\\classes\\Controller.php(434): Twig\\Environment->loadTemplate(\'C:\\\\laragon\\\\www\\\\...\')\n#11 C:\\laragon\\www\\visual\\modules\\cms\\classes\\Controller.php(225): Cms\\Classes\\Controller->runPage(Object(Cms\\Classes\\Page))\n#12 C:\\laragon\\www\\visual\\modules\\cms\\classes\\CmsController.php(50): Cms\\Classes\\Controller->run(\'/\')\n#13 [internal function]: Cms\\Classes\\CmsController->run(\'/\')\n#14 C:\\laragon\\www\\visual\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Controller.php(54): call_user_func_array(Array, Array)\n#15 C:\\laragon\\www\\visual\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\ControllerDispatcher.php(45): Illuminate\\Routing\\Controller->callAction(\'run\', Array)\n#16 C:\\laragon\\www\\visual\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Route.php(212): Illuminate\\Routing\\ControllerDispatcher->dispatch(Object(Illuminate\\Routing\\Route), Object(Cms\\Classes\\CmsController), \'run\')\n#17 C:\\laragon\\www\\visual\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Route.php(169): Illuminate\\Routing\\Route->runController()\n#18 C:\\laragon\\www\\visual\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Router.php(658): Illuminate\\Routing\\Route->run()\n#19 C:\\laragon\\www\\visual\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Pipeline.php(30): Illuminate\\Routing\\Router->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#20 C:\\laragon\\www\\visual\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Middleware\\SubstituteBindings.php(41): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#21 C:\\laragon\\www\\visual\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(149): Illuminate\\Routing\\Middleware\\SubstituteBindings->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#22 C:\\laragon\\www\\visual\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Pipeline.php(53): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#23 C:\\laragon\\www\\visual\\vendor\\laravel\\framework\\src\\Illuminate\\View\\Middleware\\ShareErrorsFromSession.php(49): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#24 C:\\laragon\\www\\visual\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(149): Illuminate\\View\\Middleware\\ShareErrorsFromSession->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#25 C:\\laragon\\www\\visual\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Pipeline.php(53): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#26 C:\\laragon\\www\\visual\\vendor\\laravel\\framework\\src\\Illuminate\\Session\\Middleware\\StartSession.php(63): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#27 C:\\laragon\\www\\visual\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(149): Illuminate\\Session\\Middleware\\StartSession->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#28 C:\\laragon\\www\\visual\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Pipeline.php(53): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#29 C:\\laragon\\www\\visual\\vendor\\laravel\\framework\\src\\Illuminate\\Cookie\\Middleware\\AddQueuedCookiesToResponse.php(37): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#30 C:\\laragon\\www\\visual\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(149): Illuminate\\Cookie\\Middleware\\AddQueuedCookiesToResponse->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#31 C:\\laragon\\www\\visual\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Pipeline.php(53): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#32 C:\\laragon\\www\\visual\\vendor\\laravel\\framework\\src\\Illuminate\\Cookie\\Middleware\\EncryptCookies.php(68): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#33 C:\\laragon\\www\\visual\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(149): Illuminate\\Cookie\\Middleware\\EncryptCookies->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#34 C:\\laragon\\www\\visual\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Pipeline.php(53): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#35 C:\\laragon\\www\\visual\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(102): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#36 C:\\laragon\\www\\visual\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Router.php(660): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#37 C:\\laragon\\www\\visual\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Router.php(635): Illuminate\\Routing\\Router->runRouteWithinStack(Object(Illuminate\\Routing\\Route), Object(Illuminate\\Http\\Request))\n#38 C:\\laragon\\www\\visual\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Router.php(601): Illuminate\\Routing\\Router->runRoute(Object(Illuminate\\Http\\Request), Object(Illuminate\\Routing\\Route))\n#39 C:\\laragon\\www\\visual\\vendor\\october\\rain\\src\\Router\\CoreRouter.php(20): Illuminate\\Routing\\Router->dispatchToRoute(Object(Illuminate\\Http\\Request))\n#40 C:\\laragon\\www\\visual\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Http\\Kernel.php(176): October\\Rain\\Router\\CoreRouter->dispatch(Object(Illuminate\\Http\\Request))\n#41 C:\\laragon\\www\\visual\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Pipeline.php(30): Illuminate\\Foundation\\Http\\Kernel->Illuminate\\Foundation\\Http\\{closure}(Object(Illuminate\\Http\\Request))\n#42 C:\\laragon\\www\\visual\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Http\\Middleware\\CheckForMaintenanceMode.php(46): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#43 C:\\laragon\\www\\visual\\vendor\\october\\rain\\src\\Foundation\\Http\\Middleware\\CheckForMaintenanceMode.php(25): Illuminate\\Foundation\\Http\\Middleware\\CheckForMaintenanceMode->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#44 C:\\laragon\\www\\visual\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(149): October\\Rain\\Foundation\\Http\\Middleware\\CheckForMaintenanceMode->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#45 C:\\laragon\\www\\visual\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Pipeline.php(53): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#46 C:\\laragon\\www\\visual\\vendor\\october\\rain\\src\\Http\\Middleware\\TrustHosts.php(46): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#47 C:\\laragon\\www\\visual\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(149): October\\Rain\\Http\\Middleware\\TrustHosts->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#48 C:\\laragon\\www\\visual\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Pipeline.php(53): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#49 C:\\laragon\\www\\visual\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(102): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#50 C:\\laragon\\www\\visual\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Http\\Kernel.php(151): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#51 C:\\laragon\\www\\visual\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Http\\Kernel.php(116): Illuminate\\Foundation\\Http\\Kernel->sendRequestThroughRouter(Object(Illuminate\\Http\\Request))\n#52 C:\\laragon\\www\\visual\\index.php(43): Illuminate\\Foundation\\Http\\Kernel->handle(Object(Illuminate\\Http\\Request))\n#53 {main}', NULL, '2024-07-24 02:36:51', '2024-07-24 02:36:51'),
	(5, 'error', 'Twig\\Error\\SyntaxError: An array element must be followed by a comma. Unexpected token "string" of value "assets/css/style.min.css" ("punctuation" expected with value ",") in "C:\\laragon\\www\\visual/themes/punto-visual/layouts/default.htm" at line 23. in C:\\laragon\\www\\visual\\vendor\\twig\\twig\\src\\TokenStream.php:76\nStack trace:\n#0 C:\\laragon\\www\\visual\\vendor\\twig\\twig\\src\\ExpressionParser.php(329): Twig\\TokenStream->expect(9, \',\', \'An array elemen...\')\n#1 C:\\laragon\\www\\visual\\vendor\\twig\\twig\\src\\ExpressionParser.php(279): Twig\\ExpressionParser->parseArrayExpression()\n#2 C:\\laragon\\www\\visual\\vendor\\twig\\twig\\src\\ExpressionParser.php(175): Twig\\ExpressionParser->parsePrimaryExpression()\n#3 C:\\laragon\\www\\visual\\vendor\\twig\\twig\\src\\ExpressionParser.php(70): Twig\\ExpressionParser->getPrimary()\n#4 C:\\laragon\\www\\visual\\vendor\\twig\\twig\\src\\Parser.php(142): Twig\\ExpressionParser->parseExpression()\n#5 C:\\laragon\\www\\visual\\vendor\\twig\\twig\\src\\Parser.php(98): Twig\\Parser->subparse(NULL, false)\n#6 C:\\laragon\\www\\visual\\vendor\\twig\\twig\\src\\Environment.php(563): Twig\\Parser->parse(Object(Twig\\TokenStream))\n#7 C:\\laragon\\www\\visual\\vendor\\twig\\twig\\src\\Environment.php(595): Twig\\Environment->parse(Object(Twig\\TokenStream))\n#8 C:\\laragon\\www\\visual\\vendor\\twig\\twig\\src\\Environment.php(408): Twig\\Environment->compileSource(Object(Twig\\Source))\n#9 C:\\laragon\\www\\visual\\vendor\\twig\\twig\\src\\Environment.php(381): Twig\\Environment->loadClass(\'__TwigTemplate_...\', \'C:\\\\laragon\\\\www\\\\...\', NULL)\n#10 C:\\laragon\\www\\visual\\modules\\cms\\classes\\Controller.php(434): Twig\\Environment->loadTemplate(\'C:\\\\laragon\\\\www\\\\...\')\n#11 C:\\laragon\\www\\visual\\modules\\cms\\classes\\Controller.php(225): Cms\\Classes\\Controller->runPage(Object(Cms\\Classes\\Page))\n#12 C:\\laragon\\www\\visual\\modules\\cms\\classes\\CmsController.php(50): Cms\\Classes\\Controller->run(\'/\')\n#13 [internal function]: Cms\\Classes\\CmsController->run(\'/\')\n#14 C:\\laragon\\www\\visual\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Controller.php(54): call_user_func_array(Array, Array)\n#15 C:\\laragon\\www\\visual\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\ControllerDispatcher.php(45): Illuminate\\Routing\\Controller->callAction(\'run\', Array)\n#16 C:\\laragon\\www\\visual\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Route.php(212): Illuminate\\Routing\\ControllerDispatcher->dispatch(Object(Illuminate\\Routing\\Route), Object(Cms\\Classes\\CmsController), \'run\')\n#17 C:\\laragon\\www\\visual\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Route.php(169): Illuminate\\Routing\\Route->runController()\n#18 C:\\laragon\\www\\visual\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Router.php(658): Illuminate\\Routing\\Route->run()\n#19 C:\\laragon\\www\\visual\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Pipeline.php(30): Illuminate\\Routing\\Router->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#20 C:\\laragon\\www\\visual\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Middleware\\SubstituteBindings.php(41): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#21 C:\\laragon\\www\\visual\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(149): Illuminate\\Routing\\Middleware\\SubstituteBindings->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#22 C:\\laragon\\www\\visual\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Pipeline.php(53): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#23 C:\\laragon\\www\\visual\\vendor\\laravel\\framework\\src\\Illuminate\\View\\Middleware\\ShareErrorsFromSession.php(49): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#24 C:\\laragon\\www\\visual\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(149): Illuminate\\View\\Middleware\\ShareErrorsFromSession->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#25 C:\\laragon\\www\\visual\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Pipeline.php(53): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#26 C:\\laragon\\www\\visual\\vendor\\laravel\\framework\\src\\Illuminate\\Session\\Middleware\\StartSession.php(63): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#27 C:\\laragon\\www\\visual\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(149): Illuminate\\Session\\Middleware\\StartSession->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#28 C:\\laragon\\www\\visual\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Pipeline.php(53): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#29 C:\\laragon\\www\\visual\\vendor\\laravel\\framework\\src\\Illuminate\\Cookie\\Middleware\\AddQueuedCookiesToResponse.php(37): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#30 C:\\laragon\\www\\visual\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(149): Illuminate\\Cookie\\Middleware\\AddQueuedCookiesToResponse->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#31 C:\\laragon\\www\\visual\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Pipeline.php(53): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#32 C:\\laragon\\www\\visual\\vendor\\laravel\\framework\\src\\Illuminate\\Cookie\\Middleware\\EncryptCookies.php(68): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#33 C:\\laragon\\www\\visual\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(149): Illuminate\\Cookie\\Middleware\\EncryptCookies->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#34 C:\\laragon\\www\\visual\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Pipeline.php(53): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#35 C:\\laragon\\www\\visual\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(102): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#36 C:\\laragon\\www\\visual\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Router.php(660): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#37 C:\\laragon\\www\\visual\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Router.php(635): Illuminate\\Routing\\Router->runRouteWithinStack(Object(Illuminate\\Routing\\Route), Object(Illuminate\\Http\\Request))\n#38 C:\\laragon\\www\\visual\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Router.php(601): Illuminate\\Routing\\Router->runRoute(Object(Illuminate\\Http\\Request), Object(Illuminate\\Routing\\Route))\n#39 C:\\laragon\\www\\visual\\vendor\\october\\rain\\src\\Router\\CoreRouter.php(20): Illuminate\\Routing\\Router->dispatchToRoute(Object(Illuminate\\Http\\Request))\n#40 C:\\laragon\\www\\visual\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Http\\Kernel.php(176): October\\Rain\\Router\\CoreRouter->dispatch(Object(Illuminate\\Http\\Request))\n#41 C:\\laragon\\www\\visual\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Pipeline.php(30): Illuminate\\Foundation\\Http\\Kernel->Illuminate\\Foundation\\Http\\{closure}(Object(Illuminate\\Http\\Request))\n#42 C:\\laragon\\www\\visual\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Http\\Middleware\\CheckForMaintenanceMode.php(46): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#43 C:\\laragon\\www\\visual\\vendor\\october\\rain\\src\\Foundation\\Http\\Middleware\\CheckForMaintenanceMode.php(25): Illuminate\\Foundation\\Http\\Middleware\\CheckForMaintenanceMode->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#44 C:\\laragon\\www\\visual\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(149): October\\Rain\\Foundation\\Http\\Middleware\\CheckForMaintenanceMode->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#45 C:\\laragon\\www\\visual\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Pipeline.php(53): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#46 C:\\laragon\\www\\visual\\vendor\\october\\rain\\src\\Http\\Middleware\\TrustHosts.php(46): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#47 C:\\laragon\\www\\visual\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(149): October\\Rain\\Http\\Middleware\\TrustHosts->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#48 C:\\laragon\\www\\visual\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Pipeline.php(53): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#49 C:\\laragon\\www\\visual\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(102): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#50 C:\\laragon\\www\\visual\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Http\\Kernel.php(151): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#51 C:\\laragon\\www\\visual\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Http\\Kernel.php(116): Illuminate\\Foundation\\Http\\Kernel->sendRequestThroughRouter(Object(Illuminate\\Http\\Request))\n#52 C:\\laragon\\www\\visual\\index.php(43): Illuminate\\Foundation\\Http\\Kernel->handle(Object(Illuminate\\Http\\Request))\n#53 {main}', NULL, '2024-07-24 02:37:06', '2024-07-24 02:37:06'),
	(6, 'error', 'RuntimeException: Failed to write cache file "C:\\laragon\\www\\visual\\storage/cms/twig/f3/f354a5b49a9ee9161c9cffab6276000c942059f7efca7e97ccb7ec9fd0d764ae.php". in C:\\laragon\\www\\visual\\vendor\\twig\\twig\\src\\Cache\\FilesystemCache.php:80\nStack trace:\n#0 C:\\laragon\\www\\visual\\vendor\\twig\\twig\\src\\Environment.php(409): Twig\\Cache\\FilesystemCache->write(\'C:\\\\laragon\\\\www\\\\...\', \'<?php\\n\\nuse Twig...\')\n#1 C:\\laragon\\www\\visual\\vendor\\twig\\twig\\src\\Environment.php(381): Twig\\Environment->loadClass(\'__TwigTemplate_...\', \'C:\\\\laragon\\\\www\\\\...\', NULL)\n#2 C:\\laragon\\www\\visual\\modules\\cms\\classes\\Controller.php(424): Twig\\Environment->loadTemplate(\'C:\\\\laragon\\\\www\\\\...\')\n#3 C:\\laragon\\www\\visual\\modules\\cms\\classes\\Controller.php(225): Cms\\Classes\\Controller->runPage(Object(Cms\\Classes\\Page))\n#4 C:\\laragon\\www\\visual\\modules\\cms\\classes\\CmsController.php(50): Cms\\Classes\\Controller->run(\'/\')\n#5 [internal function]: Cms\\Classes\\CmsController->run(\'/\')\n#6 C:\\laragon\\www\\visual\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Controller.php(54): call_user_func_array(Array, Array)\n#7 C:\\laragon\\www\\visual\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\ControllerDispatcher.php(45): Illuminate\\Routing\\Controller->callAction(\'run\', Array)\n#8 C:\\laragon\\www\\visual\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Route.php(212): Illuminate\\Routing\\ControllerDispatcher->dispatch(Object(Illuminate\\Routing\\Route), Object(Cms\\Classes\\CmsController), \'run\')\n#9 C:\\laragon\\www\\visual\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Route.php(169): Illuminate\\Routing\\Route->runController()\n#10 C:\\laragon\\www\\visual\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Router.php(658): Illuminate\\Routing\\Route->run()\n#11 C:\\laragon\\www\\visual\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Pipeline.php(30): Illuminate\\Routing\\Router->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#12 C:\\laragon\\www\\visual\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Middleware\\SubstituteBindings.php(41): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#13 C:\\laragon\\www\\visual\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(149): Illuminate\\Routing\\Middleware\\SubstituteBindings->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#14 C:\\laragon\\www\\visual\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Pipeline.php(53): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#15 C:\\laragon\\www\\visual\\vendor\\laravel\\framework\\src\\Illuminate\\View\\Middleware\\ShareErrorsFromSession.php(49): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#16 C:\\laragon\\www\\visual\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(149): Illuminate\\View\\Middleware\\ShareErrorsFromSession->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#17 C:\\laragon\\www\\visual\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Pipeline.php(53): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#18 C:\\laragon\\www\\visual\\vendor\\laravel\\framework\\src\\Illuminate\\Session\\Middleware\\StartSession.php(63): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#19 C:\\laragon\\www\\visual\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(149): Illuminate\\Session\\Middleware\\StartSession->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#20 C:\\laragon\\www\\visual\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Pipeline.php(53): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#21 C:\\laragon\\www\\visual\\vendor\\laravel\\framework\\src\\Illuminate\\Cookie\\Middleware\\AddQueuedCookiesToResponse.php(37): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#22 C:\\laragon\\www\\visual\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(149): Illuminate\\Cookie\\Middleware\\AddQueuedCookiesToResponse->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#23 C:\\laragon\\www\\visual\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Pipeline.php(53): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#24 C:\\laragon\\www\\visual\\vendor\\laravel\\framework\\src\\Illuminate\\Cookie\\Middleware\\EncryptCookies.php(68): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#25 C:\\laragon\\www\\visual\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(149): Illuminate\\Cookie\\Middleware\\EncryptCookies->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#26 C:\\laragon\\www\\visual\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Pipeline.php(53): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#27 C:\\laragon\\www\\visual\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(102): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#28 C:\\laragon\\www\\visual\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Router.php(660): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#29 C:\\laragon\\www\\visual\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Router.php(635): Illuminate\\Routing\\Router->runRouteWithinStack(Object(Illuminate\\Routing\\Route), Object(Illuminate\\Http\\Request))\n#30 C:\\laragon\\www\\visual\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Router.php(601): Illuminate\\Routing\\Router->runRoute(Object(Illuminate\\Http\\Request), Object(Illuminate\\Routing\\Route))\n#31 C:\\laragon\\www\\visual\\vendor\\october\\rain\\src\\Router\\CoreRouter.php(20): Illuminate\\Routing\\Router->dispatchToRoute(Object(Illuminate\\Http\\Request))\n#32 C:\\laragon\\www\\visual\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Http\\Kernel.php(176): October\\Rain\\Router\\CoreRouter->dispatch(Object(Illuminate\\Http\\Request))\n#33 C:\\laragon\\www\\visual\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Pipeline.php(30): Illuminate\\Foundation\\Http\\Kernel->Illuminate\\Foundation\\Http\\{closure}(Object(Illuminate\\Http\\Request))\n#34 C:\\laragon\\www\\visual\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Http\\Middleware\\CheckForMaintenanceMode.php(46): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#35 C:\\laragon\\www\\visual\\vendor\\october\\rain\\src\\Foundation\\Http\\Middleware\\CheckForMaintenanceMode.php(25): Illuminate\\Foundation\\Http\\Middleware\\CheckForMaintenanceMode->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#36 C:\\laragon\\www\\visual\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(149): October\\Rain\\Foundation\\Http\\Middleware\\CheckForMaintenanceMode->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#37 C:\\laragon\\www\\visual\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Pipeline.php(53): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#38 C:\\laragon\\www\\visual\\vendor\\october\\rain\\src\\Http\\Middleware\\TrustHosts.php(46): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#39 C:\\laragon\\www\\visual\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(149): October\\Rain\\Http\\Middleware\\TrustHosts->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#40 C:\\laragon\\www\\visual\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Pipeline.php(53): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#41 C:\\laragon\\www\\visual\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(102): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#42 C:\\laragon\\www\\visual\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Http\\Kernel.php(151): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#43 C:\\laragon\\www\\visual\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Http\\Kernel.php(116): Illuminate\\Foundation\\Http\\Kernel->sendRequestThroughRouter(Object(Illuminate\\Http\\Request))\n#44 C:\\laragon\\www\\visual\\index.php(43): Illuminate\\Foundation\\Http\\Kernel->handle(Object(Illuminate\\Http\\Request))\n#45 {main}', NULL, '2024-07-24 06:36:41', '2024-07-24 06:36:41'),
	(7, 'error', 'RuntimeException: Failed to write cache file "C:\\laragon\\www\\visual\\storage/cms/twig/f3/f354a5b49a9ee9161c9cffab6276000c942059f7efca7e97ccb7ec9fd0d764ae.php". in C:\\laragon\\www\\visual\\vendor\\twig\\twig\\src\\Cache\\FilesystemCache.php:80\nStack trace:\n#0 C:\\laragon\\www\\visual\\vendor\\twig\\twig\\src\\Environment.php(409): Twig\\Cache\\FilesystemCache->write(\'C:\\\\laragon\\\\www\\\\...\', \'<?php\\n\\nuse Twig...\')\n#1 C:\\laragon\\www\\visual\\vendor\\twig\\twig\\src\\Environment.php(381): Twig\\Environment->loadClass(\'__TwigTemplate_...\', \'C:\\\\laragon\\\\www\\\\...\', NULL)\n#2 C:\\laragon\\www\\visual\\modules\\cms\\classes\\Controller.php(424): Twig\\Environment->loadTemplate(\'C:\\\\laragon\\\\www\\\\...\')\n#3 C:\\laragon\\www\\visual\\modules\\cms\\classes\\Controller.php(225): Cms\\Classes\\Controller->runPage(Object(Cms\\Classes\\Page))\n#4 C:\\laragon\\www\\visual\\modules\\cms\\classes\\CmsController.php(50): Cms\\Classes\\Controller->run(\'/\')\n#5 [internal function]: Cms\\Classes\\CmsController->run(\'/\')\n#6 C:\\laragon\\www\\visual\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Controller.php(54): call_user_func_array(Array, Array)\n#7 C:\\laragon\\www\\visual\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\ControllerDispatcher.php(45): Illuminate\\Routing\\Controller->callAction(\'run\', Array)\n#8 C:\\laragon\\www\\visual\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Route.php(212): Illuminate\\Routing\\ControllerDispatcher->dispatch(Object(Illuminate\\Routing\\Route), Object(Cms\\Classes\\CmsController), \'run\')\n#9 C:\\laragon\\www\\visual\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Route.php(169): Illuminate\\Routing\\Route->runController()\n#10 C:\\laragon\\www\\visual\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Router.php(658): Illuminate\\Routing\\Route->run()\n#11 C:\\laragon\\www\\visual\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Pipeline.php(30): Illuminate\\Routing\\Router->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#12 C:\\laragon\\www\\visual\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Middleware\\SubstituteBindings.php(41): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#13 C:\\laragon\\www\\visual\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(149): Illuminate\\Routing\\Middleware\\SubstituteBindings->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#14 C:\\laragon\\www\\visual\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Pipeline.php(53): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#15 C:\\laragon\\www\\visual\\vendor\\laravel\\framework\\src\\Illuminate\\View\\Middleware\\ShareErrorsFromSession.php(49): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#16 C:\\laragon\\www\\visual\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(149): Illuminate\\View\\Middleware\\ShareErrorsFromSession->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#17 C:\\laragon\\www\\visual\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Pipeline.php(53): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#18 C:\\laragon\\www\\visual\\vendor\\laravel\\framework\\src\\Illuminate\\Session\\Middleware\\StartSession.php(63): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#19 C:\\laragon\\www\\visual\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(149): Illuminate\\Session\\Middleware\\StartSession->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#20 C:\\laragon\\www\\visual\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Pipeline.php(53): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#21 C:\\laragon\\www\\visual\\vendor\\laravel\\framework\\src\\Illuminate\\Cookie\\Middleware\\AddQueuedCookiesToResponse.php(37): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#22 C:\\laragon\\www\\visual\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(149): Illuminate\\Cookie\\Middleware\\AddQueuedCookiesToResponse->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#23 C:\\laragon\\www\\visual\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Pipeline.php(53): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#24 C:\\laragon\\www\\visual\\vendor\\laravel\\framework\\src\\Illuminate\\Cookie\\Middleware\\EncryptCookies.php(68): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#25 C:\\laragon\\www\\visual\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(149): Illuminate\\Cookie\\Middleware\\EncryptCookies->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#26 C:\\laragon\\www\\visual\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Pipeline.php(53): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#27 C:\\laragon\\www\\visual\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(102): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#28 C:\\laragon\\www\\visual\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Router.php(660): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#29 C:\\laragon\\www\\visual\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Router.php(635): Illuminate\\Routing\\Router->runRouteWithinStack(Object(Illuminate\\Routing\\Route), Object(Illuminate\\Http\\Request))\n#30 C:\\laragon\\www\\visual\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Router.php(601): Illuminate\\Routing\\Router->runRoute(Object(Illuminate\\Http\\Request), Object(Illuminate\\Routing\\Route))\n#31 C:\\laragon\\www\\visual\\vendor\\october\\rain\\src\\Router\\CoreRouter.php(20): Illuminate\\Routing\\Router->dispatchToRoute(Object(Illuminate\\Http\\Request))\n#32 C:\\laragon\\www\\visual\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Http\\Kernel.php(176): October\\Rain\\Router\\CoreRouter->dispatch(Object(Illuminate\\Http\\Request))\n#33 C:\\laragon\\www\\visual\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Pipeline.php(30): Illuminate\\Foundation\\Http\\Kernel->Illuminate\\Foundation\\Http\\{closure}(Object(Illuminate\\Http\\Request))\n#34 C:\\laragon\\www\\visual\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Http\\Middleware\\CheckForMaintenanceMode.php(46): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#35 C:\\laragon\\www\\visual\\vendor\\october\\rain\\src\\Foundation\\Http\\Middleware\\CheckForMaintenanceMode.php(25): Illuminate\\Foundation\\Http\\Middleware\\CheckForMaintenanceMode->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#36 C:\\laragon\\www\\visual\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(149): October\\Rain\\Foundation\\Http\\Middleware\\CheckForMaintenanceMode->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#37 C:\\laragon\\www\\visual\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Pipeline.php(53): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#38 C:\\laragon\\www\\visual\\vendor\\october\\rain\\src\\Http\\Middleware\\TrustHosts.php(46): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#39 C:\\laragon\\www\\visual\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(149): October\\Rain\\Http\\Middleware\\TrustHosts->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#40 C:\\laragon\\www\\visual\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Pipeline.php(53): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#41 C:\\laragon\\www\\visual\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(102): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#42 C:\\laragon\\www\\visual\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Http\\Kernel.php(151): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#43 C:\\laragon\\www\\visual\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Http\\Kernel.php(116): Illuminate\\Foundation\\Http\\Kernel->sendRequestThroughRouter(Object(Illuminate\\Http\\Request))\n#44 C:\\laragon\\www\\visual\\index.php(43): Illuminate\\Foundation\\Http\\Kernel->handle(Object(Illuminate\\Http\\Request))\n#45 {main}', NULL, '2024-07-24 06:36:41', '2024-07-24 06:36:41');

-- Volcando estructura para tabla dbpunto.system_files
CREATE TABLE IF NOT EXISTS `system_files` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `disk_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `file_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `file_size` int NOT NULL,
  `content_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `field` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `attachment_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `attachment_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_public` tinyint(1) NOT NULL DEFAULT '1',
  `sort_order` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `system_files_field_index` (`field`),
  KEY `system_files_attachment_id_index` (`attachment_id`),
  KEY `system_files_attachment_type_index` (`attachment_type`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla dbpunto.system_files: ~3 rows (aproximadamente)
INSERT INTO `system_files` (`id`, `disk_name`, `file_name`, `file_size`, `content_type`, `title`, `description`, `field`, `attachment_id`, `attachment_type`, `is_public`, `sort_order`, `created_at`, `updated_at`) VALUES
	(1, '66a02a0bc2087305978234.png', 'logo_pv_circle.png', 15210, 'image/png', NULL, NULL, 'avatar', '1', 'Backend\\Models\\User', 1, 1, '2024-07-24 04:09:15', '2024-07-24 04:09:19'),
	(2, '66a02a61b7ef4426866842.png', 'logo_puntovisual.png', 15641, 'image/png', NULL, NULL, 'logo', '1', 'Backend\\Models\\BrandSetting', 1, 2, '2024-07-24 04:10:41', '2024-07-24 04:10:48'),
	(3, '66a02a64de27f409135444.png', 'logo_pv_circle.png', 15210, 'image/png', NULL, NULL, 'favicon', '1', 'Backend\\Models\\BrandSetting', 1, 3, '2024-07-24 04:10:44', '2024-07-24 04:10:48');

-- Volcando estructura para tabla dbpunto.system_mail_layouts
CREATE TABLE IF NOT EXISTS `system_mail_layouts` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content_html` text COLLATE utf8mb4_unicode_ci,
  `content_text` text COLLATE utf8mb4_unicode_ci,
  `content_css` text COLLATE utf8mb4_unicode_ci,
  `is_locked` tinyint(1) NOT NULL DEFAULT '0',
  `options` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla dbpunto.system_mail_layouts: ~2 rows (aproximadamente)
INSERT INTO `system_mail_layouts` (`id`, `name`, `code`, `content_html`, `content_text`, `content_css`, `is_locked`, `options`, `created_at`, `updated_at`) VALUES
	(1, 'Default layout', 'default', '<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">\n<html xmlns="http://www.w3.org/1999/xhtml">\n<head>\n    <meta name="viewport" content="width=device-width, initial-scale=1.0" />\n    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />\n</head>\n<body>\n    <style type="text/css" media="screen">\n        {{ brandCss|raw }}\n        {{ css|raw }}\n    </style>\n\n    <table class="wrapper layout-default" width="100%" cellpadding="0" cellspacing="0">\n\n        <!-- Header -->\n        {% partial \'header\' body %}\n            {{ subject|raw }}\n        {% endpartial %}\n\n        <tr>\n            <td align="center">\n                <table class="content" width="100%" cellpadding="0" cellspacing="0">\n                    <!-- Email Body -->\n                    <tr>\n                        <td class="body" width="100%" cellpadding="0" cellspacing="0">\n                            <table class="inner-body" align="center" width="570" cellpadding="0" cellspacing="0">\n                                <!-- Body content -->\n                                <tr>\n                                    <td class="content-cell">\n                                        {{ content|raw }}\n                                    </td>\n                                </tr>\n                            </table>\n                        </td>\n                    </tr>\n                </table>\n            </td>\n        </tr>\n\n        <!-- Footer -->\n        {% partial \'footer\' body %}\n            &copy; {{ "now"|date("Y") }} {{ appName }}. All rights reserved.\n        {% endpartial %}\n\n    </table>\n\n</body>\n</html>', '{{ content|raw }}', '@media only screen and (max-width: 600px) {\n    .inner-body {\n        width: 100% !important;\n    }\n\n    .footer {\n        width: 100% !important;\n    }\n}\n\n@media only screen and (max-width: 500px) {\n    .button {\n        width: 100% !important;\n    }\n}', 1, NULL, '2024-07-24 01:33:43', '2024-07-24 01:33:43'),
	(2, 'System layout', 'system', '<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">\n<html xmlns="http://www.w3.org/1999/xhtml">\n<head>\n    <meta name="viewport" content="width=device-width, initial-scale=1.0" />\n    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />\n</head>\n<body>\n    <style type="text/css" media="screen">\n        {{ brandCss|raw }}\n        {{ css|raw }}\n    </style>\n\n    <table class="wrapper layout-system" width="100%" cellpadding="0" cellspacing="0">\n        <tr>\n            <td align="center">\n                <table class="content" width="100%" cellpadding="0" cellspacing="0">\n                    <!-- Email Body -->\n                    <tr>\n                        <td class="body" width="100%" cellpadding="0" cellspacing="0">\n                            <table class="inner-body" align="center" width="570" cellpadding="0" cellspacing="0">\n                                <!-- Body content -->\n                                <tr>\n                                    <td class="content-cell">\n                                        {{ content|raw }}\n\n                                        <!-- Subcopy -->\n                                        {% partial \'subcopy\' body %}\n                                            **This is an automatic message. Please do not reply to it.**\n                                        {% endpartial %}\n                                    </td>\n                                </tr>\n                            </table>\n                        </td>\n                    </tr>\n                </table>\n            </td>\n        </tr>\n    </table>\n\n</body>\n</html>', '{{ content|raw }}\n\n\n---\nThis is an automatic message. Please do not reply to it.', '@media only screen and (max-width: 600px) {\n    .inner-body {\n        width: 100% !important;\n    }\n\n    .footer {\n        width: 100% !important;\n    }\n}\n\n@media only screen and (max-width: 500px) {\n    .button {\n        width: 100% !important;\n    }\n}', 1, NULL, '2024-07-24 01:33:43', '2024-07-24 01:33:43');

-- Volcando estructura para tabla dbpunto.system_mail_partials
CREATE TABLE IF NOT EXISTS `system_mail_partials` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content_html` text COLLATE utf8mb4_unicode_ci,
  `content_text` text COLLATE utf8mb4_unicode_ci,
  `is_custom` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla dbpunto.system_mail_partials: ~0 rows (aproximadamente)

-- Volcando estructura para tabla dbpunto.system_mail_templates
CREATE TABLE IF NOT EXISTS `system_mail_templates` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subject` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `content_html` text COLLATE utf8mb4_unicode_ci,
  `content_text` text COLLATE utf8mb4_unicode_ci,
  `layout_id` int DEFAULT NULL,
  `is_custom` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `system_mail_templates_layout_id_index` (`layout_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla dbpunto.system_mail_templates: ~0 rows (aproximadamente)

-- Volcando estructura para tabla dbpunto.system_parameters
CREATE TABLE IF NOT EXISTS `system_parameters` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `namespace` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `group` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `item` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `item_index` (`namespace`,`group`,`item`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla dbpunto.system_parameters: ~5 rows (aproximadamente)
INSERT INTO `system_parameters` (`id`, `namespace`, `group`, `item`, `value`) VALUES
	(1, 'system', 'update', 'count', '0'),
	(2, 'system', 'core', 'hash', '"6819ec80bb4951db1139f26ca9238dbd"'),
	(3, 'system', 'core', 'build', '"476"'),
	(4, 'system', 'update', 'retry', '1721849673'),
	(5, 'cms', 'theme', 'active', '"punto-visual"'),
	(6, 'system', 'theme', 'history', '[]');

-- Volcando estructura para tabla dbpunto.system_plugin_history
CREATE TABLE IF NOT EXISTS `system_plugin_history` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `version` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `detail` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `system_plugin_history_code_index` (`code`),
  KEY `system_plugin_history_type_index` (`type`)
) ENGINE=InnoDB AUTO_INCREMENT=196 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla dbpunto.system_plugin_history: ~108 rows (aproximadamente)
INSERT INTO `system_plugin_history` (`id`, `code`, `type`, `version`, `detail`, `created_at`) VALUES
	(1, 'October.Demo', 'comment', '1.0.1', 'First version of Demo', '2024-07-24 01:33:43'),
	(69, 'RainLab.Builder', 'comment', '1.0.1', 'Initialize plugin.', '2024-07-24 01:40:54'),
	(70, 'RainLab.Builder', 'comment', '1.0.2', 'Fixes the problem with selecting a plugin. Minor localization corrections. Configuration files in the list and form behaviors are now autocomplete.', '2024-07-24 01:40:54'),
	(71, 'RainLab.Builder', 'comment', '1.0.3', 'Improved handling of the enum data type.', '2024-07-24 01:40:54'),
	(72, 'RainLab.Builder', 'comment', '1.0.4', 'Added user permissions to work with the Builder.', '2024-07-24 01:40:54'),
	(73, 'RainLab.Builder', 'comment', '1.0.5', 'Fixed permissions registration.', '2024-07-24 01:40:54'),
	(74, 'RainLab.Builder', 'comment', '1.0.6', 'Fixed front-end record ordering in the Record List component.', '2024-07-24 01:40:54'),
	(75, 'RainLab.Builder', 'comment', '1.0.7', 'Builder settings are now protected with user permissions. The database table column list is scrollable now. Minor code cleanup.', '2024-07-24 01:40:54'),
	(76, 'RainLab.Builder', 'comment', '1.0.8', 'Added the Reorder Controller behavior.', '2024-07-24 01:40:54'),
	(77, 'RainLab.Builder', 'comment', '1.0.9', 'Minor API and UI updates.', '2024-07-24 01:40:54'),
	(78, 'RainLab.Builder', 'comment', '1.0.10', 'Minor styling update.', '2024-07-24 01:40:54'),
	(79, 'RainLab.Builder', 'comment', '1.0.11', 'Fixed a bug where clicking placeholder in a repeater would open Inspector. Fixed a problem with saving forms with repeaters in tabs. Minor style fix.', '2024-07-24 01:40:54'),
	(80, 'RainLab.Builder', 'comment', '1.0.12', 'Added support for the Trigger property to the Media Finder widget configuration. Names of form fields and list columns definition files can now contain underscores.', '2024-07-24 01:40:54'),
	(81, 'RainLab.Builder', 'comment', '1.0.13', 'Minor styling fix on the database editor.', '2024-07-24 01:40:54'),
	(82, 'RainLab.Builder', 'comment', '1.0.14', 'Added support for published_at timestamp field', '2024-07-24 01:40:54'),
	(83, 'RainLab.Builder', 'comment', '1.0.15', 'Fixed a bug where saving a localization string in Inspector could cause a JavaScript error. Added support for Timestamps and Soft Deleting for new models.', '2024-07-24 01:40:54'),
	(84, 'RainLab.Builder', 'comment', '1.0.16', 'Fixed a bug when saving a form with the Repeater widget in a tab could create invalid fields in the form\'s outside area. Added a check that prevents creating localization strings inside other existing strings.', '2024-07-24 01:40:54'),
	(85, 'RainLab.Builder', 'comment', '1.0.17', 'Added support Trigger attribute support for RecordFinder and Repeater form widgets.', '2024-07-24 01:40:54'),
	(86, 'RainLab.Builder', 'comment', '1.0.18', 'Fixes a bug where \'::class\' notations in a model class definition could prevent the model from appearing in the Builder model list. Added emptyOption property support to the dropdown form control.', '2024-07-24 01:40:54'),
	(87, 'RainLab.Builder', 'comment', '1.0.19', 'Added a feature allowing to add all database columns to a list definition. Added max length validation for database table and column names.', '2024-07-24 01:40:54'),
	(88, 'RainLab.Builder', 'comment', '1.0.20', 'Fixes a bug where form the builder could trigger the "current.hasAttribute is not a function" error.', '2024-07-24 01:40:54'),
	(89, 'RainLab.Builder', 'comment', '1.0.21', 'Back-end navigation sort order updated.', '2024-07-24 01:40:54'),
	(90, 'RainLab.Builder', 'comment', '1.0.22', 'Added scopeValue property to the RecordList component.', '2024-07-24 01:40:54'),
	(91, 'RainLab.Builder', 'comment', '1.0.23', 'Added support for balloon-selector field type, added Brazilian Portuguese translation, fixed some bugs', '2024-07-24 01:40:54'),
	(92, 'RainLab.Builder', 'comment', '1.0.24', 'Added support for tag list field type, added read only toggle for fields. Prevent plugins from using reserved PHP keywords for class names and namespaces', '2024-07-24 01:40:54'),
	(93, 'RainLab.Builder', 'comment', '1.0.25', 'Allow editing of migration code in the "Migration" popup when saving changes in the database editor.', '2024-07-24 01:40:54'),
	(94, 'RainLab.Builder', 'comment', '1.0.26', 'Allow special default values for columns and added new "Add ID column" button to database editor.', '2024-07-24 01:40:54'),
	(95, 'RainLab.Builder', 'comment', '1.0.27', 'Added ability to use \'scope\' in a form relation field, added ability to change the sort order of versions and added additional properties for repeater widget in form builder. Added Polish translation.', '2024-07-24 01:40:54'),
	(96, 'RainLab.Builder', 'comment', '1.0.28', 'Fixes support for PHP 8', '2024-07-24 01:40:54'),
	(97, 'RainLab.Builder', 'comment', '1.0.29', 'Disable touch device detection', '2024-07-24 01:40:54'),
	(98, 'RainLab.Builder', 'comment', '1.0.30', 'Minor styling improvements', '2024-07-24 01:40:54'),
	(99, 'RainLab.Builder', 'comment', '1.0.31', 'Added support for more rich editor and file upload properties', '2024-07-24 01:40:54'),
	(100, 'RainLab.Builder', 'comment', '1.0.32', 'Minor styling improvements', '2024-07-24 01:40:54'),
	(101, 'RainLab.Builder', 'comment', '1.1.0', 'Adds feature for adding database fields to a form definition.', '2024-07-24 01:40:54'),
	(102, 'RainLab.Builder', 'comment', '1.1.1', 'Adds DBAL timestamp column type. Adds database prefix support. Fixes various bugs.', '2024-07-24 01:40:54'),
	(103, 'RainLab.Builder', 'comment', '1.1.2', 'Compatibility with October CMS v2.2', '2024-07-24 01:40:54'),
	(104, 'RainLab.Builder', 'comment', '1.1.3', 'Adds comment support to database tables.', '2024-07-24 01:40:54'),
	(105, 'RainLab.Builder', 'comment', '1.1.4', 'Fixes duplication bug saving backend menu permissions.', '2024-07-24 01:40:54'),
	(106, 'RainLab.Builder', 'comment', '1.2.0', 'Improve support with October v3.0', '2024-07-24 01:40:54'),
	(107, 'RainLab.Builder', 'comment', '1.2.2', 'Compatibility updates.', '2024-07-24 01:40:55'),
	(108, 'RainLab.Builder', 'comment', '1.2.3', 'Fixes issue when removing items from permissions and menus.', '2024-07-24 01:40:55'),
	(109, 'RainLab.Builder', 'comment', '1.2.5', 'Fixes validator conflict with other plugins.', '2024-07-24 01:40:55'),
	(110, 'RainLab.Builder', 'comment', '1.2.6', 'Compatibility with October v3.1', '2024-07-24 01:40:55'),
	(111, 'Indikator.Backend', 'comment', '1.0.0', 'First version of Backend Plus.', '2024-07-24 01:42:14'),
	(112, 'Indikator.Backend', 'comment', '1.0.1', 'Fixed the update count issue.', '2024-07-24 01:42:14'),
	(113, 'Indikator.Backend', 'comment', '1.0.2', 'Added Last logins widget.', '2024-07-24 01:42:14'),
	(114, 'Indikator.Backend', 'comment', '1.0.3', 'Added RSS viewer widget.', '2024-07-24 01:42:14'),
	(115, 'Indikator.Backend', 'comment', '1.0.4', 'Minor improvements and bugfix.', '2024-07-24 01:42:14'),
	(116, 'Indikator.Backend', 'comment', '1.0.5', 'Added Random images widget.', '2024-07-24 01:42:14'),
	(117, 'Indikator.Backend', 'comment', '1.0.6', 'Added virtual keyboard option.', '2024-07-24 01:42:14'),
	(118, 'Indikator.Backend', 'comment', '1.1.0', 'Added Lorem ipsum components (image and text).', '2024-07-24 01:42:14'),
	(119, 'Indikator.Backend', 'comment', '1.1.0', 'Improving the Random images widget with slideshow.', '2024-07-24 01:42:14'),
	(120, 'Indikator.Backend', 'comment', '1.1.0', 'Added Turkish translation (thanks to mahony0).', '2024-07-24 01:42:14'),
	(121, 'Indikator.Backend', 'comment', '1.1.0', 'Fixed the URL path issue by virtual keyboard.', '2024-07-24 01:42:14'),
	(122, 'Indikator.Backend', 'comment', '1.1.1', 'Hide the "Find more themes" link.', '2024-07-24 01:42:14'),
	(123, 'Indikator.Backend', 'comment', '1.1.2', 'Added German translation.', '2024-07-24 01:42:14'),
	(124, 'Indikator.Backend', 'comment', '1.1.3', 'The widgets work on localhost too.', '2024-07-24 01:42:14'),
	(125, 'Indikator.Backend', 'comment', '1.1.4', 'Added Spanish translation.', '2024-07-24 01:42:14'),
	(126, 'Indikator.Backend', 'comment', '1.2.0', 'All features are working on the whole backend.', '2024-07-24 01:42:14'),
	(127, 'Indikator.Backend', 'comment', '1.2.1', 'Rounded profile image is optional in top menu.', '2024-07-24 01:42:14'),
	(128, 'Indikator.Backend', 'comment', '1.2.2', 'Fixed the authenticated user bug.', '2024-07-24 01:42:14'),
	(129, 'Indikator.Backend', 'comment', '1.2.3', 'Hide the Media menu optional in top menu.', '2024-07-24 01:42:14'),
	(130, 'Indikator.Backend', 'comment', '1.2.4', 'Minor improvements and bugfix.', '2024-07-24 01:42:14'),
	(131, 'Indikator.Backend', 'comment', '1.2.5', 'Renamed the name of backend widgets.', '2024-07-24 01:42:14'),
	(132, 'Indikator.Backend', 'comment', '1.2.6', 'Improved the automatic search focus.', '2024-07-24 01:42:14'),
	(133, 'Indikator.Backend', 'comment', '1.2.7', 'Minor improvements.', '2024-07-24 01:42:14'),
	(134, 'Indikator.Backend', 'comment', '1.2.8', 'Fixed the hiding Media menu issue.', '2024-07-24 01:42:14'),
	(135, 'Indikator.Backend', 'comment', '1.2.9', 'Improved the widget exception handling.', '2024-07-24 01:42:14'),
	(136, 'Indikator.Backend', 'comment', '1.3.0', 'Added 2 new options for Settings.', '2024-07-24 01:42:14'),
	(137, 'Indikator.Backend', 'comment', '1.3.1', 'Fixed the search field hide issue.', '2024-07-24 01:42:14'),
	(138, 'Indikator.Backend', 'comment', '1.3.2', 'Delete only demo folder instead of october.', '2024-07-24 01:42:14'),
	(139, 'Indikator.Backend', 'comment', '1.3.3', 'Added clear button option to form fields.', '2024-07-24 01:42:14'),
	(140, 'Indikator.Backend', 'comment', '1.3.4', 'Improved the Media menu hiding.', '2024-07-24 01:42:14'),
	(141, 'Indikator.Backend', 'comment', '1.3.5', 'Fixed the automatically focus option.', '2024-07-24 01:42:14'),
	(142, 'Indikator.Backend', 'comment', '1.3.6', 'Added the Cache dashboard widget.', '2024-07-24 01:42:14'),
	(143, 'Indikator.Backend', 'comment', '1.4.0', 'Added 2 new form widgets.', '2024-07-24 01:42:14'),
	(144, 'Indikator.Backend', 'comment', '1.4.1', 'Added new colorpicker form widget.', '2024-07-24 01:42:14'),
	(145, 'Indikator.Backend', 'comment', '1.4.2', 'Minor improvements.', '2024-07-24 01:42:14'),
	(146, 'Indikator.Backend', 'comment', '1.4.3', 'Improved the Cache dashboard widget.', '2024-07-24 01:42:14'),
	(147, 'Indikator.Backend', 'comment', '1.4.4', 'Updated for latest October.', '2024-07-24 01:42:14'),
	(148, 'Indikator.Backend', 'comment', '1.4.5', 'Minor improvements and bugfix.', '2024-07-24 01:42:14'),
	(149, 'Indikator.Backend', 'comment', '1.4.6', 'Improved the UI and fixed bug.', '2024-07-24 01:42:14'),
	(150, 'Indikator.Backend', 'comment', '1.4.7', 'Hide the label in top menu.', '2024-07-24 01:42:14'),
	(151, 'Indikator.Backend', 'comment', '1.4.8', 'Enable the gzip compression.', '2024-07-24 01:42:14'),
	(152, 'Indikator.Backend', 'script', '1.5.0', 'create_trash_table.php', '2024-07-24 01:42:14'),
	(153, 'Indikator.Backend', 'comment', '1.5.0', 'Delete the unused files and folders.', '2024-07-24 01:42:14'),
	(154, 'Indikator.Backend', 'comment', '1.5.1', 'Minor improvements and bugfix.', '2024-07-24 01:42:14'),
	(155, 'Indikator.Backend', 'comment', '1.5.2', 'Improved the Trash items page.', '2024-07-24 01:42:14'),
	(156, 'Indikator.Backend', 'comment', '1.5.3', 'Expanded the Trash items page.', '2024-07-24 01:42:14'),
	(157, 'Indikator.Backend', 'comment', '1.5.4', 'Minor improvements.', '2024-07-24 01:42:14'),
	(158, 'Indikator.Backend', 'comment', '1.5.5', 'Added tooltip when hiding the labels.', '2024-07-24 01:42:14'),
	(159, 'Indikator.Backend', 'comment', '1.5.6', 'Fixed the page overflow issue.', '2024-07-24 01:42:14'),
	(160, 'Indikator.Backend', 'comment', '1.5.7', 'Added the context menu feature.', '2024-07-24 01:42:14'),
	(161, 'Indikator.Backend', 'comment', '1.5.8', 'Improved the context menu.', '2024-07-24 01:42:14'),
	(162, 'Indikator.Backend', 'comment', '1.6.0', 'Available the Elite version.', '2024-07-24 01:42:14'),
	(163, 'Indikator.Backend', 'comment', '1.6.1', 'Added the Russian translation.', '2024-07-24 01:42:14'),
	(164, 'Indikator.Backend', 'comment', '1.6.2', 'Added the Brazilian Portuguese lang.', '2024-07-24 01:42:14'),
	(165, 'Indikator.Backend', 'comment', '1.6.3', 'Minor improvements.', '2024-07-24 01:42:14'),
	(166, 'Indikator.Backend', 'comment', '1.6.4', 'Fixed the German translation.', '2024-07-24 01:42:14'),
	(167, 'Indikator.Backend', 'comment', '1.6.5', 'Fixed the Cache widget issue.', '2024-07-24 01:42:14'),
	(168, 'Indikator.Backend', 'comment', '1.6.6', '!!! Updated for October 420+.', '2024-07-24 01:42:14'),
	(169, 'Indikator.Backend', 'comment', '1.6.7', 'Added more trash items.', '2024-07-24 01:42:14'),
	(170, 'Indikator.Backend', 'comment', '1.6.8', 'Minor improvements.', '2024-07-24 01:42:14'),
	(171, 'Indikator.Backend', 'comment', '1.6.9', 'Added permission to Dashboard widgets.', '2024-07-24 01:42:14'),
	(172, 'Indikator.Backend', 'comment', '1.6.10', 'Added Polish translation.', '2024-07-24 01:42:14'),
	(173, 'Indikator.Backend', 'comment', '1.6.11', 'Updated the trash file list.', '2024-07-24 01:42:14'),
	(174, 'Indikator.Backend', 'comment', '1.6.12', 'Added more trash items.', '2024-07-24 01:42:14'),
	(175, 'Indikator.Backend', 'comment', '1.6.13', 'Added Slovenian translation.', '2024-07-24 01:42:14');

-- Volcando estructura para tabla dbpunto.system_plugin_versions
CREATE TABLE IF NOT EXISTS `system_plugin_versions` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `version` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `is_disabled` tinyint(1) NOT NULL DEFAULT '0',
  `is_frozen` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `system_plugin_versions_code_index` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla dbpunto.system_plugin_versions: ~1 rows (aproximadamente)
INSERT INTO `system_plugin_versions` (`id`, `code`, `version`, `created_at`, `is_disabled`, `is_frozen`) VALUES
	(1, 'October.Demo', '1.0.1', '2024-07-24 01:33:43', 0, 0),
	(3, 'RainLab.Builder', '1.2.6', '2024-07-24 01:40:55', 0, 0),
	(4, 'Indikator.Backend', '1.6.13', '2024-07-24 01:42:14', 0, 0);

-- Volcando estructura para tabla dbpunto.system_request_logs
CREATE TABLE IF NOT EXISTS `system_request_logs` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `status_code` int DEFAULT NULL,
  `url` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `referer` text COLLATE utf8mb4_unicode_ci,
  `count` int NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla dbpunto.system_request_logs: ~0 rows (aproximadamente)

-- Volcando estructura para tabla dbpunto.system_revisions
CREATE TABLE IF NOT EXISTS `system_revisions` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int unsigned DEFAULT NULL,
  `field` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cast` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `old_value` text COLLATE utf8mb4_unicode_ci,
  `new_value` text COLLATE utf8mb4_unicode_ci,
  `revisionable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `revisionable_id` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `system_revisions_revisionable_id_revisionable_type_index` (`revisionable_id`,`revisionable_type`),
  KEY `system_revisions_user_id_index` (`user_id`),
  KEY `system_revisions_field_index` (`field`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla dbpunto.system_revisions: ~0 rows (aproximadamente)

-- Volcando estructura para tabla dbpunto.system_settings
CREATE TABLE IF NOT EXISTS `system_settings` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `item` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `value` mediumtext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `system_settings_item_index` (`item`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla dbpunto.system_settings: ~0 rows (aproximadamente)
INSERT INTO `system_settings` (`id`, `item`, `value`) VALUES
	(1, 'backend_brand_settings', '{"app_name":"PuntoVisual","app_tagline":"Volviendo a lo b\\u00e1sico","primary_color":"#4f5458","secondary_color":"#27ae60","accent_color":"#27ae60","menu_mode":"inline","custom_css":""}');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
