/*
Navicat MySQL Data Transfer

Source Server         : Localhost
Source Server Version : 50505
Source Host           : localhost:3306
Source Database       : laravel82

Target Server Type    : MYSQL
Target Server Version : 50505
File Encoding         : 65001

Date: 2021-01-17 03:42:31
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `failed_jobs`
-- ----------------------------
DROP TABLE IF EXISTS `failed_jobs`;
CREATE TABLE `failed_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of failed_jobs
-- ----------------------------

-- ----------------------------
-- Table structure for `migrations`
-- ----------------------------
DROP TABLE IF EXISTS `migrations`;
CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of migrations
-- ----------------------------
INSERT INTO `migrations` VALUES ('1', '2014_10_12_000000_create_users_table', '1');
INSERT INTO `migrations` VALUES ('2', '2014_10_12_100000_create_password_resets_table', '1');
INSERT INTO `migrations` VALUES ('3', '2014_10_12_200000_add_two_factor_columns_to_users_table', '1');
INSERT INTO `migrations` VALUES ('4', '2019_08_19_000000_create_failed_jobs_table', '1');
INSERT INTO `migrations` VALUES ('5', '2019_12_14_000001_create_personal_access_tokens_table', '1');
INSERT INTO `migrations` VALUES ('6', '2020_11_19_191707_create_sessions_table', '1');
INSERT INTO `migrations` VALUES ('7', '2020_11_19_192821_create_user_groups_table', '1');
INSERT INTO `migrations` VALUES ('8', '2020_11_19_192944_create_system_tasks_table', '1');
INSERT INTO `migrations` VALUES ('9', '2020_11_21_190632_create_products_table', '2');
INSERT INTO `migrations` VALUES ('10', '2020_11_21_190916_create_product_pictures_table', '2');
INSERT INTO `migrations` VALUES ('13', '2020_11_27_081017_create_purchases_table', '3');
INSERT INTO `migrations` VALUES ('14', '2020_12_05_081051_create_system_configurations_table', '4');

-- ----------------------------
-- Table structure for `password_resets`
-- ----------------------------
DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of password_resets
-- ----------------------------

-- ----------------------------
-- Table structure for `personal_access_tokens`
-- ----------------------------
DROP TABLE IF EXISTS `personal_access_tokens`;
CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of personal_access_tokens
-- ----------------------------
INSERT INTO `personal_access_tokens` VALUES ('1', 'App\\Models\\User', '1', 'MyApp', 'da5511842c41e38fa9fd5d991d13282a1656dde810602c18c9b83ce01d02c499', '[\"*\"]', null, '2020-12-01 07:34:54', '2020-12-01 07:34:54');
INSERT INTO `personal_access_tokens` VALUES ('2', 'App\\Models\\User', '1', 'MyApp', '0cfdffa1c67e2407c1ff314f69106d2a0eab83be911423ad1640f7d464fffdf9', '[\"*\"]', null, '2020-12-01 07:35:02', '2020-12-01 07:35:02');
INSERT INTO `personal_access_tokens` VALUES ('3', 'App\\Models\\User', '1', 'MyApp', '2de9dbf6e8700681ea64e3c4928a88321b613ae99b3f8f2dd70773d07cd32618', '[\"*\"]', null, '2020-12-01 07:35:25', '2020-12-01 07:35:25');
INSERT INTO `personal_access_tokens` VALUES ('4', 'App\\Models\\User', '1', 'MyApp', '9fadbc0458a2cc2486ccd40ced95928dc2ad0667c48fcccc848c47156cddc47b', '[\"*\"]', null, '2020-12-01 07:36:28', '2020-12-01 07:36:28');
INSERT INTO `personal_access_tokens` VALUES ('5', 'App\\Models\\User', '1', 'MyApp', '2b75e795ac97b944c7e1c25df7ee5c814485f1cd3147e09df89d10a020068383', '[\"*\"]', null, '2020-12-01 07:39:26', '2020-12-01 07:39:26');
INSERT INTO `personal_access_tokens` VALUES ('6', 'App\\Models\\User', '1', 'MyApp', '799ba703f85de1d8e8f2c1c08cffee1963143e004a34119bfc5f435ec4d510c5', '[\"*\"]', null, '2020-12-01 07:50:08', '2020-12-01 07:50:08');

-- ----------------------------
-- Table structure for `products`
-- ----------------------------
DROP TABLE IF EXISTS `products`;
CREATE TABLE `products` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` double(8,2) NOT NULL,
  `status` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=103 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of products
-- ----------------------------
INSERT INTO `products` VALUES ('1', 'Charlotte Cummerata', '576.25', 'Active', null, null);
INSERT INTO `products` VALUES ('2', 'Kole Torp', '493.18', 'Active', null, null);
INSERT INTO `products` VALUES ('3', 'Dr. Dedrick Cassin I', '563.27', 'Active', null, null);
INSERT INTO `products` VALUES ('4', 'Colleen Boyle', '559.86', 'Active', null, null);
INSERT INTO `products` VALUES ('5', 'Mr. Remington Rice DDS', '256.78', 'Active', null, null);
INSERT INTO `products` VALUES ('6', 'Oswaldo Schneider', '506.72', 'Active', null, null);
INSERT INTO `products` VALUES ('7', 'Sherman Hoeger', '698.93', 'Active', null, null);
INSERT INTO `products` VALUES ('8', 'Pattie Boehm III', '343.93', 'Active', null, null);
INSERT INTO `products` VALUES ('9', 'Pierre Bosco', '441.87', 'Active', null, null);
INSERT INTO `products` VALUES ('10', 'Minnie Bosco', '894.46', 'Active', null, null);
INSERT INTO `products` VALUES ('11', 'Ms. Alexa Rodriguez', '321.54', 'Active', null, null);
INSERT INTO `products` VALUES ('12', 'Flossie Kohler', '212.00', 'Active', null, null);
INSERT INTO `products` VALUES ('13', 'Dr. Wilburn Fisher', '538.00', 'Active', null, null);
INSERT INTO `products` VALUES ('14', 'Idella Watsica', '275.59', 'Active', null, null);
INSERT INTO `products` VALUES ('15', 'Kelsi Balistreri', '212.24', 'Active', null, null);
INSERT INTO `products` VALUES ('16', 'Brady Oberbrunner', '753.61', 'Active', null, null);
INSERT INTO `products` VALUES ('17', 'Shayne Leffler', '621.73', 'Active', null, null);
INSERT INTO `products` VALUES ('18', 'Miss Minnie Abbott', '562.76', 'Active', null, null);
INSERT INTO `products` VALUES ('19', 'Schuyler Crist', '509.23', 'Active', null, null);
INSERT INTO `products` VALUES ('20', 'Dr. Willy Thiel III', '298.65', 'Active', null, null);
INSERT INTO `products` VALUES ('21', 'Noel Miller', '196.53', 'Active', null, null);
INSERT INTO `products` VALUES ('22', 'Dr. Bartholome White MD', '12.29', 'Active', null, null);
INSERT INTO `products` VALUES ('23', 'Prof. Bertram Spencer', '755.16', 'Active', null, null);
INSERT INTO `products` VALUES ('24', 'Stefan Gutmann DVM', '840.08', 'Active', null, null);
INSERT INTO `products` VALUES ('25', 'Dr. Armando Schumm Jr.', '112.17', 'Active', null, null);
INSERT INTO `products` VALUES ('26', 'Casimer Block Sr.', '63.23', 'Active', null, null);
INSERT INTO `products` VALUES ('27', 'Marco Hirthe', '936.47', 'Active', null, null);
INSERT INTO `products` VALUES ('28', 'Mr. Mckenzie Hauck', '919.67', 'Active', null, null);
INSERT INTO `products` VALUES ('29', 'Julien Hansen', '848.27', 'Active', null, null);
INSERT INTO `products` VALUES ('30', 'Elva Ruecker MD', '173.16', 'Active', null, null);
INSERT INTO `products` VALUES ('31', 'Dr. Uriah Torphy', '438.96', 'Active', null, null);
INSERT INTO `products` VALUES ('32', 'Gerson Beahan DVM', '784.04', 'Active', null, null);
INSERT INTO `products` VALUES ('33', 'Christa Will', '318.12', 'Active', null, null);
INSERT INTO `products` VALUES ('34', 'Yazmin Lemke', '834.49', 'Active', null, null);
INSERT INTO `products` VALUES ('35', 'Chandler Towne IV', '177.98', 'Active', null, null);
INSERT INTO `products` VALUES ('36', 'Gerda Hartmann', '546.94', 'Active', null, null);
INSERT INTO `products` VALUES ('37', 'Cleo Shields', '268.68', 'Active', null, null);
INSERT INTO `products` VALUES ('38', 'Sim Sawayn V', '373.92', 'Active', null, null);
INSERT INTO `products` VALUES ('39', 'Darien Kohler III', '815.75', 'Active', null, null);
INSERT INTO `products` VALUES ('40', 'Vidal Harris', '619.67', 'Active', null, null);
INSERT INTO `products` VALUES ('41', 'Ms. Eileen Beier', '106.64', 'Active', null, null);
INSERT INTO `products` VALUES ('42', 'Alyson Keeling', '144.77', 'Active', null, null);
INSERT INTO `products` VALUES ('43', 'Lulu Cruickshank', '999.64', 'Active', null, null);
INSERT INTO `products` VALUES ('44', 'Viva Collier', '682.58', 'Active', null, null);
INSERT INTO `products` VALUES ('45', 'Loy Larson', '756.94', 'Active', null, null);
INSERT INTO `products` VALUES ('46', 'Jennyfer Renner', '194.61', 'Active', null, null);
INSERT INTO `products` VALUES ('47', 'Electa Herzog', '217.94', 'Active', null, null);
INSERT INTO `products` VALUES ('48', 'Elliott Sawayn', '514.63', 'Active', null, null);
INSERT INTO `products` VALUES ('49', 'Brigitte Walter', '155.38', 'Active', null, null);
INSERT INTO `products` VALUES ('50', 'Dr. Verna Bode DDS', '12.44', 'Active', null, null);
INSERT INTO `products` VALUES ('51', 'Rico Block', '654.20', 'Active', null, null);
INSERT INTO `products` VALUES ('52', 'Dr. Trystan Maggio', '720.03', 'Active', null, null);
INSERT INTO `products` VALUES ('53', 'Ms. Herta Dicki IV', '232.13', 'Active', null, null);
INSERT INTO `products` VALUES ('54', 'Mr. Quentin Will', '315.89', 'Active', null, null);
INSERT INTO `products` VALUES ('55', 'Murray DuBuque', '963.09', 'Active', null, null);
INSERT INTO `products` VALUES ('56', 'Heaven Kuhlman PhD', '411.12', 'Active', null, null);
INSERT INTO `products` VALUES ('57', 'Mr. Taurean Stroman', '747.73', 'Active', null, null);
INSERT INTO `products` VALUES ('58', 'Rahsaan Parker', '300.15', 'Active', null, null);
INSERT INTO `products` VALUES ('59', 'Mrs. Kasandra Graham III', '440.88', 'Active', null, null);
INSERT INTO `products` VALUES ('60', 'Mr. Emmet Cartwright', '507.76', 'Active', null, null);
INSERT INTO `products` VALUES ('61', 'Eino Medhurst', '844.62', 'Active', null, null);
INSERT INTO `products` VALUES ('62', 'Dr. Israel King I', '175.21', 'Active', null, null);
INSERT INTO `products` VALUES ('63', 'Dr. Felix Simonis DVM', '98.15', 'Active', null, null);
INSERT INTO `products` VALUES ('64', 'Rodrick Bartell', '818.65', 'Active', null, null);
INSERT INTO `products` VALUES ('65', 'Abner Ryan', '240.39', 'Active', null, null);
INSERT INTO `products` VALUES ('66', 'Madie Nikolaus II', '873.95', 'Active', null, null);
INSERT INTO `products` VALUES ('67', 'Tanya McKenzie', '986.15', 'Active', null, null);
INSERT INTO `products` VALUES ('68', 'Mariano Lakin', '792.05', 'Active', null, null);
INSERT INTO `products` VALUES ('69', 'Derrick Harber', '806.90', 'Active', null, null);
INSERT INTO `products` VALUES ('70', 'Karli Feeney', '391.99', 'Active', null, null);
INSERT INTO `products` VALUES ('71', 'Marianne Eichmann', '744.74', 'Active', null, null);
INSERT INTO `products` VALUES ('72', 'Tracey Towne', '214.87', 'Active', null, null);
INSERT INTO `products` VALUES ('73', 'Valentine Predovic DVM', '249.39', 'Active', null, null);
INSERT INTO `products` VALUES ('74', 'Gudrun Fay', '117.27', 'Active', null, null);
INSERT INTO `products` VALUES ('75', 'Teagan Haag', '162.65', 'Active', null, null);
INSERT INTO `products` VALUES ('76', 'Bette Grimes', '794.10', 'Active', null, null);
INSERT INTO `products` VALUES ('77', 'Else Armstrong', '653.36', 'Active', null, null);
INSERT INTO `products` VALUES ('78', 'Christelle Mertz', '217.42', 'Active', null, null);
INSERT INTO `products` VALUES ('79', 'Hoyt Dibbert', '106.54', 'Active', null, null);
INSERT INTO `products` VALUES ('80', 'Amely Lueilwitz', '921.74', 'Active', null, null);
INSERT INTO `products` VALUES ('81', 'Miss Jolie Sauer', '405.25', 'Active', null, null);
INSERT INTO `products` VALUES ('82', 'Dannie Jast', '986.80', 'Active', null, null);
INSERT INTO `products` VALUES ('83', 'Lazaro Hahn PhD', '778.51', 'Active', null, null);
INSERT INTO `products` VALUES ('84', 'Mrs. Marietta Baumbach', '819.55', 'Active', null, null);
INSERT INTO `products` VALUES ('85', 'Alexandro Hackett', '725.20', 'Active', null, null);
INSERT INTO `products` VALUES ('86', 'Ms. Vicky Rice', '225.34', 'Active', null, null);
INSERT INTO `products` VALUES ('87', 'Eileen Yost III', '307.76', 'Active', null, null);
INSERT INTO `products` VALUES ('88', 'Antonette Powlowski PhD', '874.24', 'Active', null, null);
INSERT INTO `products` VALUES ('89', 'Mrs. Ursula Littel I', '879.29', 'Active', null, null);
INSERT INTO `products` VALUES ('90', 'Carolyn Greenholt', '831.47', 'Active', null, null);
INSERT INTO `products` VALUES ('91', 'Monte Hegmann', '236.20', 'Active', null, null);
INSERT INTO `products` VALUES ('92', 'Prof. Dylan Sipes', '194.39', 'Deleted', null, '2020-11-22 20:52:42');
INSERT INTO `products` VALUES ('93', 'Jameson Hilpert', '137.81', 'Active', null, null);
INSERT INTO `products` VALUES ('94', 'Mango', '150.00', 'Active', null, '2020-11-23 07:13:03');
INSERT INTO `products` VALUES ('95', 'Dr. Rocky Turner V', '558.53', 'Deleted', null, '2020-11-22 06:10:53');
INSERT INTO `products` VALUES ('96', 'Prof. Ethel Terry Sr.', '616.47', 'Deleted', null, '2020-11-22 06:10:44');
INSERT INTO `products` VALUES ('97', 'Emily Halvorson', '767.31', 'Deleted', null, '2020-11-22 06:10:09');
INSERT INTO `products` VALUES ('98', 'Eladio Bode', '617.88', 'Deleted', null, '2020-11-22 20:53:33');
INSERT INTO `products` VALUES ('99', 'Miss Leanna Windler', '234.57', 'Deleted', null, '2020-11-22 19:37:11');
INSERT INTO `products` VALUES ('100', 'Brain Sanford DVM', '139.45', 'Deleted', null, '2020-11-22 05:54:14');
INSERT INTO `products` VALUES ('101', 'Edited', '123.00', 'Deleted', '2020-11-22 19:12:54', '2020-11-22 20:13:40');
INSERT INTO `products` VALUES ('102', 'Apple', '100.00', 'Active', '2020-11-22 20:49:43', '2020-11-23 07:10:53');

-- ----------------------------
-- Table structure for `product_pictures`
-- ----------------------------
DROP TABLE IF EXISTS `product_pictures`;
CREATE TABLE `product_pictures` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `product_id` bigint(20) unsigned NOT NULL,
  `picture` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of product_pictures
-- ----------------------------
INSERT INTO `product_pictures` VALUES ('1', '102', 'products/102/d9n1FNmayv6BZ2F72J5llAIO0YQuxeZ10xlDROpM.jpeg', 'Active', '2020-11-23 07:11:44', '2020-11-23 07:11:44');
INSERT INTO `product_pictures` VALUES ('2', '102', 'products/102/GhBrKlIwbpesG5JG9nwyfh9ymiMRMdnWIYPSwx9m.jpeg', 'Active', '2020-11-23 07:12:01', '2020-11-23 07:12:01');
INSERT INTO `product_pictures` VALUES ('3', '102', 'products/102/G557ZHbS8EB0TEvvFQjifbhkgv4AwHWU6twVbyA5.jpeg', 'Active', '2020-11-23 07:12:23', '2020-11-23 07:12:23');
INSERT INTO `product_pictures` VALUES ('4', '90', 'products/94/XoepYzdBQNZLkXvRuoVbSqvLTWZ49MkrpLZxihWn.jpeg', 'Active', '2020-11-23 07:13:57', '2020-11-23 07:13:57');
INSERT INTO `product_pictures` VALUES ('5', '93', 'products/94/7SZTLzGbbRQe14qvp5MM08Qms3ng78sIeRQmgV6g.jpeg', 'Active', '2020-11-23 07:14:31', '2020-11-23 07:14:31');
INSERT INTO `product_pictures` VALUES ('6', '93', 'products/94/3MA7F7btG85v59rz7Yxj0EoKokmDK7mvqWFRu89d.jpeg', 'Active', '2020-11-23 07:15:20', '2020-11-23 07:15:20');

-- ----------------------------
-- Table structure for `purchases`
-- ----------------------------
DROP TABLE IF EXISTS `purchases`;
CREATE TABLE `purchases` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `stripeEmail` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `stripeToken` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `stripeCustomerId` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `products` varchar(500) COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` double NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of purchases
-- ----------------------------
INSERT INTO `purchases` VALUES ('1', '1', 'shaiful@shaiful.me', 'tok_1HrwywC7Qt33rDM6kHiDenhm', 'cus_ISskhnkK6TVvth', '{\"102\":{\"id\":102,\"name\":\"Apple\",\"price\":100,\"status\":\"Active\",\"created_at\":\"2020-11-22T14:49:43.000000Z\",\"updated_at\":\"2020-11-23T01:10:53.000000Z\",\"quantity\":\"1\"}}', '10000', '2020-11-27 08:46:49', '2020-11-27 08:46:49');
INSERT INTO `purchases` VALUES ('2', '1', 'shaiful@shaiful.me', 'tok_1Hrx1jC7Qt33rDM6VlO6WdJD', 'cus_ISsn8nepKBc7Qt', '{\"102\":{\"id\":102,\"name\":\"Apple\",\"price\":100,\"status\":\"Active\",\"created_at\":\"2020-11-22T14:49:43.000000Z\",\"updated_at\":\"2020-11-23T01:10:53.000000Z\",\"quantity\":\"2\"}}', '20000', '2020-11-27 08:49:42', '2020-11-27 08:49:42');

-- ----------------------------
-- Table structure for `sessions`
-- ----------------------------
DROP TABLE IF EXISTS `sessions`;
CREATE TABLE `sessions` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payload` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sessions_user_id_index` (`user_id`),
  KEY `sessions_last_activity_index` (`last_activity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of sessions
-- ----------------------------
INSERT INTO `sessions` VALUES ('0QdyrCkFMIp4c6EygE8gjuimj7ytzXE0E9Rq9rOQ', null, '3.218.249.68', 'python-requests/2.22.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiUk9OaTdSZzlzSVpFVnJZTkxqRm8wM0lsQXo0SGRDa1c4Y3lhNWNXSCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzI6Imh0dHA6Ly8xMDMuODkuMjcuMTg2L2NvbmZpZy8uZW52Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', '1608461584');
INSERT INTO `sessions` VALUES ('0vyAMMTE65DHGlW5mxBc16QevCDt2khIJ0jyGqrs', null, '113.92.199.112', 'Hello, world', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiQlFENmZ3clMyUHVhTXNvaGV4THJVWnNhMUE2YWRGNEMweE1lNkowUyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MTQ0OiJodHRwOi8vMTAzLjg5LjI3LjE4Ni9zaGVsbD9jZF8lMkZ0bXAlM0JybV8tcmZfJTJBJTNCd2dldF9odHRwJTNBJTJGJTJGMTEzXzkyXzE5OV8xMTIlM0E1ODU0NSUyRk1vemlfYSUzQmNobW9kXzc3N19Nb3ppX2ElM0IlMkZ0bXAlMkZNb3ppX2FfamF3cz0iO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', '1608427019');
INSERT INTO `sessions` VALUES ('10yPSdVanyB05FZljUv2bCFwxspSuz38sVhMPehu', null, '20.55.19.125', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.129 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiT01qR2hXeWFDVkEzMUlIak1odGFNODQ3bllGSUFZenNXU25meVc1ZCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjU6Imh0dHA6Ly8xMDMuODkuMjcuMTg2Ly5lbnYiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', '1608453586');
INSERT INTO `sessions` VALUES ('11Ip2IxB2StHeFnF78yjDuAXxLtHv8EICnPBrdcC', null, '185.239.242.154', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.129 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiVFF3NTU3WjNlVldRS3E5ZzMyQUFYWUJMY282SmdDejRvY01pVnJWUCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjU6Imh0dHA6Ly8xMDMuODkuMjcuMTg2Ly5lbnYiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', '1608454867');
INSERT INTO `sessions` VALUES ('19jdkWm5HA0StrAPWigG36ZZMIG5dSFzQsLUKBn5', null, '20.55.19.125', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.129 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiNjRialk5TVkzTTdOU0o4ZkpOUmc4Q20wc0t3TnBsdTZyaEtoaEZuYiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjU6Imh0dHA6Ly8xMDMuODkuMjcuMTg2Ly5lbnYiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', '1608453566');
INSERT INTO `sessions` VALUES ('2VS4IDpLRYnB8DJQlseqMQotXtwNAqJhkPimvRL3', null, '93.120.181.108', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_6) AppleWebKit/601.7.7 (KHTML, like Gecko) Version/9.1.2 Safari/601.7.7', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiUUZVQmJybmRKTG9BWjRNTVJwNWVrUVl5ZVhlY3VLMFQ2U1JQc003ZyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjA6Imh0dHA6Ly8xMDMuODkuMjcuMTg2Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', '1608471222');
INSERT INTO `sessions` VALUES ('4rcHq3IzTxIymtufLl0PKSamIW4VvamTaLzYKhPI', null, '109.63.180.130', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/52.0.2743.116 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiaDZ2TUh6dElGdnliWm1lcE0zWWJ4Z2V4aWhLSkdQYmxNclR2eFM3eiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjA6Imh0dHA6Ly8xMDMuODkuMjcuMTg2Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', '1608431877');
INSERT INTO `sessions` VALUES ('73CfJueDwPMGNQyC75UJ6Qgz6kSBCfQpkv4JqU70', null, '23.146.241.149', 'libwww-perl/6.49', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiUlNxN3dObkdJUFloT052VkFYQXVpM2pXblVQU1VoajhMeUFlRWpwRiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjA6Imh0dHA6Ly8xMDMuODkuMjcuMTg2Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', '1608426449');
INSERT INTO `sessions` VALUES ('AHzzHLTCgVxaBbIoWv2aln7YxQIWVa5RKimimvte', null, '3.218.249.68', 'python-requests/2.22.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiM1NndjQ3NHVWbVpWYVRmNEJscms3WVF3SzdCcFF2dVBEb1l2MnU4bSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjk6Imh0dHA6Ly8xMDMuODkuMjcuMTg2L2FwcC8uZW52Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', '1608461582');
INSERT INTO `sessions` VALUES ('bnBXZ7uJlA5s3Niov1WfWsQVOMzi4BzMdtMXg36F', null, '3.218.249.68', 'python-requests/2.22.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiRDJ6RHA1NFpoMXl2a0ZMTlNKSGNZYkpsSHIzNWdyUm82SVNIQWpyRCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzE6Imh0dHA6Ly8xMDMuODkuMjcuMTg2L2FkbWluLy5lbnYiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', '1608461577');
INSERT INTO `sessions` VALUES ('C1jc9sXMEh4rN2OjnmRwDWVIqoBrcDrLZieizJeF', null, '3.218.249.68', 'python-requests/2.22.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiSFpQU3ZtZ0dQOVVKc3dOSzlUUVlJM2U0WVExZ3BCQjFHYnBIdlVnTCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzM6Imh0dHA6Ly8xMDMuODkuMjcuMTg2L2xhcmF2ZWwvLmVudiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', '1608461578');
INSERT INTO `sessions` VALUES ('c3770ipJp5SC8EheTGALY5603mX04qxcTQWJWnAj', null, '3.218.249.68', 'python-requests/2.22.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiQjRxT2xQbGJpUmZaQ2NhZTNxWlZ2TmFYMkduSUhWaUU5SFIxa2ZVUCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzI6Imh0dHA6Ly8xMDMuODkuMjcuMTg2L3B1YmxpYy8uZW52Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', '1608461579');
INSERT INTO `sessions` VALUES ('D60Rhig9gaRX8CznFqyBGHMcq1mCBVVzHBCePEvq', null, '59.88.231.51', '', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiNVZ5UVlEckM2UDRabG1KMFhzWmZjUVNEeXExVm1nQVhVWmN5bTRQaCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NjU6Imh0dHA6Ly9sb2NhbGhvc3QvYm9hZm9ybS9hZG1pbi9mb3JtTG9naW4/cHNkPWFkbWluJnVzZXJuYW1lPWFkbWluIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', '1608469796');
INSERT INTO `sessions` VALUES ('EoowiT8BcgcZksHWeeosHyZ7kT04iy5HuOW2iBUc', null, '94.45.164.2', 'Mozilla/5.0 zgrab/0.x', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoic01JVGdmdFZOd1MydEdQeGN0b3lsWXA0WWlGMklad0xxZ2ZVSlBtZiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjA6Imh0dHA6Ly8xMDMuODkuMjcuMTg2Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', '1608467513');
INSERT INTO `sessions` VALUES ('i210piaJj9UAGsgzuwxbgmSt9BCntYRK1wyzXrLX', null, '192.241.224.37', 'Mozilla/5.0 zgrab/0.x', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoidHNsd1JkTzRObWZ1emlHNUp4V1Voa2lYNWdkN0tkY2tLU1FnbDFlTSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjc6Imh0dHA6Ly8xMDMuODkuMjcuMTg2L2h1ZHNvbiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', '1608452034');
INSERT INTO `sessions` VALUES ('ni1GaT7faRufy7VB6UOhAMtlbrL0vXw1GcXKOJJN', null, '91.148.177.207', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_6) AppleWebKit/601.7.7 (KHTML, like Gecko) Version/9.1.2 Safari/601.7.7', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoic3l5NzVvZG1vc2VMMzFmcWJSNnpHSmpIeWpQN2pjM0dwaFdFclpGYyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjA6Imh0dHA6Ly8xMDMuODkuMjcuMTg2Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', '1608440746');
INSERT INTO `sessions` VALUES ('NNJjeta6VNC05NcoD65vAmwSB2nzLsBi9lgONWwc', null, '162.243.187.129', 'masscan/1.0 (https://github.com/robertdavidgraham/masscan)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiVWNTNzVEU1Q1TEtDcVpHdmtBcnZBY2JCa0o1SmdXcG9XeVlkN3ZWayI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MTY6Imh0dHA6Ly9sb2NhbGhvc3QiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', '1608468645');
INSERT INTO `sessions` VALUES ('Of68AxbVVKH1cWhfilr3v4HKL7J3OAsrDw509EOK', null, '112.80.138.146', 'Mozilla/4.01687919 Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 6.1; WOW64; Trident/7.0; SLCC2; .NET CLR 2.0.50727; .NET CLR 3.5.30729; .NET CLR 3.0.30729; .NET4.0C; .NET4.0E; Media Center PC 6.0)', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoibWNYRUNSM3hxbE5rRWFDY0w3NTJmR2IzOEN6UE9abGlod3A4Y1h4VCI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', '1608469975');
INSERT INTO `sessions` VALUES ('oZmayF09Y4Lyt6WvGP9lSJWn1syIV1AwSyvmFTrA', null, '193.169.252.34', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:72.0) Gecko/20100101 Firefox/72.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiRHI2aVZHb1pBRDM2VzhCdDFUMzVER2Nxb0xxY3ZNbkhrTmtZeHNkayI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzU6Imh0dHA6Ly8xMDMuODkuMjcuMTg2L215c3FscHJpbnQuY3NzIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', '1608473112');
INSERT INTO `sessions` VALUES ('QCaELbM9Q82JNdflzZdQgUyL2eGdm1gm1hh7dmoW', null, '89.40.73.244', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/38.0.2125.122 Safari/537.36 SE 2.X MetaSr 1.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiTzMwMGNhSFJ1V2UzRHZqNzV4UHdhQzh4TVdNRDZtdmpRd2xiTkpzQyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjA6Imh0dHA6Ly8xMDMuODkuMjcuMTg2Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', '1608428668');
INSERT INTO `sessions` VALUES ('RFaTXvqMP4zdHm1FHiKNp4zQEpiUGrj9hcIkF0Jg', null, '200.53.28.87', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/52.0.2743.116 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiYW82VUxuVFZZSFBmOHNTaFdYbVEyVFh3Wm5zMVZBZllhc0d3OHVaSyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjA6Imh0dHA6Ly8xMDMuODkuMjcuMTg2Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', '1608432359');
INSERT INTO `sessions` VALUES ('tqZB7hrJPWbQ5fbAv1yNOox3kL9npAAgji83b4ed', null, '3.218.249.68', 'python-requests/2.22.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiclRjaWQzMTFEdVdYeVhTaXE5WDJYWDVUam4yUXVlS0lJUDhBY3RMNSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjU6Imh0dHA6Ly8xMDMuODkuMjcuMTg2Ly5lbnYiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', '1608461570');
INSERT INTO `sessions` VALUES ('ulKO7ieDdfng6AYWoLRu8ucc7XjdO4rV0izAPLgJ', null, '223.30.222.76', 'Mozilla/5.0 zgrab/0.x', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiVWpGYmd0dVcyaDNzUWQ2bkxQTTlNb0JHd3V0d00xVnl0UjY2WnhSQiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjA6Imh0dHA6Ly8xMDMuODkuMjcuMTg2Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', '1608427418');
INSERT INTO `sessions` VALUES ('W1L3iBCri8FbkiacbUgdF64SivWCLp8CR9QNI3Np', null, '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.3; Win64; x64; rv:84.0) Gecko/20100101 Firefox/84.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiUnhHWnJOOXFMMWlSNXRvTUZnR3g1T3Jic3lJaHlKdG4wRUZ5ckpINiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly9sb2NhbGhvc3Qvd29yZHByZXNzIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', '1608589748');
INSERT INTO `sessions` VALUES ('wxEtyU5xPhVGWNWmKj9WE8V1WCprgPjnWX2T3YMB', null, '192.241.205.249', 'Mozilla/5.0 zgrab/0.x', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiV1N4RlVDMGVSYzluN252Y2MxSk5ITG40U3oxSlF5ZWpINDdxWktnRiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjA6Imh0dHA6Ly8xMDMuODkuMjcuMTg2Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', '1608465123');
INSERT INTO `sessions` VALUES ('xYiNWI1Qu5VbhvVUvJnH8LCJSav6zsbyqAGMiMY7', null, '3.218.249.68', 'python-requests/2.22.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoieFlYMWhzQXRTWUdOTURUanFodDdEYTFRd1lDN0dpempYMWZRU1B2NSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjg6Imh0dHA6Ly8xMDMuODkuMjcuMTg2L3YxLy5lbnYiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', '1608461581');
INSERT INTO `sessions` VALUES ('yg9MRwe2wTqMXyprHRtU1aL3Qt0k6czHiWR0nLg7', null, '45.95.169.227', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:76.0) Gecko/20100101 Firefox/76.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoidTdIM2VnVzcwTklPb0REUDRxamlPYTdLQlJkQ3p6dGJoRDVjaHl2WiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjA6Imh0dHA6Ly8xMDMuODkuMjcuMTg2Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', '1608467253');
INSERT INTO `sessions` VALUES ('ZZVRoPUkSxwMD0peQ5cFf266hJOHAmnLLe47VTCU', null, '36.72.99.13', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_6) AppleWebKit/601.7.7 (KHTML, like Gecko) Version/9.1.2 Safari/601.7.7', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiTEpWaXgwVVB6UVFHSTR3Y1ZLREREamYwMGRBdWJkOTZEYTRmanRoRiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjA6Imh0dHA6Ly8xMDMuODkuMjcuMTg2Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', '1608454270');

-- ----------------------------
-- Table structure for `system_configurations`
-- ----------------------------
DROP TABLE IF EXISTS `system_configurations`;
CREATE TABLE `system_configurations` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `purpose` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `config_value` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Active',
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of system_configurations
-- ----------------------------
INSERT INTO `system_configurations` VALUES ('1', 'SITE_OFF_LINE', 'Offline api site', '0', 'Active', '1', '1', null, null);

-- ----------------------------
-- Table structure for `system_tasks`
-- ----------------------------
DROP TABLE IF EXISTS `system_tasks`;
CREATE TABLE `system_tasks` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name_en` varchar(255) NOT NULL,
  `name_bn` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL DEFAULT 'TASK',
  `parent` int(11) NOT NULL DEFAULT 0,
  `controller` varchar(500) NOT NULL DEFAULT '',
  `ordering` smallint(6) NOT NULL DEFAULT 9999,
  `icon` varchar(255) NOT NULL DEFAULT 'menu.png',
  `status` varchar(11) NOT NULL DEFAULT 'Active',
  `status_notification` varchar(3) NOT NULL DEFAULT 'No',
  `created_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of system_tasks
-- ----------------------------
INSERT INTO `system_tasks` VALUES ('1', 'System Settings', 'পদ্ধতি নির্ধারণ', 'MODULE', '0', '', '1', 'menu.png', 'Active', 'No', null, null);
INSERT INTO `system_tasks` VALUES ('2', 'Module & Task', 'মডিউল এবং টাস্ক', 'TASK', '1', 'Sys_module_task', '1', 'menu.png', 'In-Active', 'No', null, null);
INSERT INTO `system_tasks` VALUES ('3', 'Configuration Setup', 'কনফিগারেশন সেটআপ', 'TASK', '1', 'Sys_configurations', '4', 'menu.png', 'Active', 'No', '2020-11-19 21:14:19', '2020-11-19 21:14:19');
INSERT INTO `system_tasks` VALUES ('4', 'User Group', 'ব্যবহারকারী দল', 'TASK', '1', 'Sys_user_group', '2', 'menu.png', 'Active', 'No', null, null);
INSERT INTO `system_tasks` VALUES ('5', 'Setup', 'সেটআপ', 'MODULE', '0', '', '2', 'menu.png', 'Active', 'No', '2020-11-19 21:14:59', '2020-11-19 21:14:59');
INSERT INTO `system_tasks` VALUES ('6', 'Users', 'ব্যবহারকারীরা', 'TASK', '5', 'Setup_users', '1', 'menu.png', 'Active', 'No', '2020-11-19 21:15:52', '2020-11-19 21:15:52');
INSERT INTO `system_tasks` VALUES ('7', 'Product', 'পণ্য', 'TASK', '5', 'Setup_products', '2', 'menu.png', 'Active', 'No', '2020-11-21 00:40:41', '2020-11-21 00:40:41');
INSERT INTO `system_tasks` VALUES ('8', 'Shop', 'দোকান', 'TASK', '0', 'Shop', '3', 'menu.png', 'Active', 'No', '2020-11-24 04:35:17', '2020-11-24 04:35:17');
INSERT INTO `system_tasks` VALUES ('9', 'Checout', 'চেকআউট', 'TASK', '0', 'Checkout', '4', 'menu.png', 'Active', 'No', null, null);
INSERT INTO `system_tasks` VALUES ('10', 'Stripe Demo', 'স্ট্রাইপ ডেমো', 'TASK', '0', 'StripeDemo', '5', 'menu.png', 'Active', 'No', null, null);

-- ----------------------------
-- Table structure for `users`
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `mobile_no` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `api_token` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `two_factor_secret` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `two_factor_recovery_codes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Active',
  `name_en` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name_bn` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_group_id` smallint(6) NOT NULL DEFAULT 4,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `profile_photo_path` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_mobile_no_unique` (`mobile_no`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES ('1', '01912097849', '$2y$10$oOxF.KDtMpnlNPuiBYN7suKbWvubARHWnZGnf7cStbDgQffqk3LHu', 'TFUOgKR8v5UlhcGdDyR/s9tAtG1fAbW5BzO+dPq82KPH2yNkOwazZXH+hIatZkkS', null, null, 'Active', 'Shaiful Islam', 'সাইফুল ইসলাম', 'shaiful@shaiful.me', '1', null, null, 'profile-photos/1/jyXMhMWeg1XXWgGZZ8cSnOfngd1T2imqfycvK1Ea.png', null, null, '2020-11-21 01:59:00', '2020-12-12 20:45:09');
INSERT INTO `users` VALUES ('4', '01794624835', '$2y$10$ufKTa2IAAvdEkaJ.Cy9AFuZdIzf/ik4d7xBjOeVYeBVnfj5c/im9W', 'qwM3DPNJpByEPkmhbi2LGonThgDFPTm1+cBMFJiYqojkN9Tqsr6ZPhkyrPgqRLXm', null, null, 'Active', 'Samin sharmeen', 'সামিন শারমিন', 'sunan@shaiful.me', '1', null, null, null, null, null, '2020-11-24 07:24:52', '2020-12-10 17:15:22');
INSERT INTO `users` VALUES ('5', '01234567890', '$2y$10$Fcj3R.uLhV1h3xWGkusQJerSnUFM99prCo7pZxH6sSuQ1Q0IDfgoK', '', null, null, 'Active', 'test', 'tettbn', 'sunan1@shaiful.me', '4', null, null, null, null, null, '2020-12-06 08:03:58', '2020-12-06 08:03:58');
INSERT INTO `users` VALUES ('6', '01234567891', '$2y$10$76SvWdS9yDKAxf.D/ewuh.b.JTb6juHBNPGORE0AVczMN2rIn7M0G', 'cfGxr2TXGJg0pAZXZSSPUM94yf/PiU3f7LVMsp02kqgyMhJjtYoXCk8TJyDk9Vjk', null, null, 'Active', 'test', 'tettbn', 'sunan2@shaiful.me', '4', null, null, null, null, null, '2020-12-06 08:06:33', '2020-12-06 08:06:33');
INSERT INTO `users` VALUES ('7', '01234567893', '$2y$10$pB8O9RsVPd8cIotJJR4ST.cVGO1p/ctaDtOOLiV8vS4RluU/ZNRbm', 'a0c39M/iOoAxz4ijbKg6sAa2JUgmm16cwSdZPk8gr2ycH7rT876EO5mDwZK37AE/', null, null, 'Active', 'test', 'tettbn', 'sunan3@shaiful.me', '4', null, null, null, null, null, '2020-12-06 08:12:46', '2020-12-06 08:12:46');
INSERT INTO `users` VALUES ('8', '01234567894', '$2y$10$ycFbXtmqOxYCaEBEZuEjluWvNLesc8UFrrsGUasKRKAJcsxY1zX9O', 'Y2CNfwIUgmp0sFLkzxwkuTcbl3Jhodrkm2hnZ487ojKM1jV4MlLqaIKPKOzdPTyM', null, null, 'Active', 'test', 'tettbn', 'sunan4@shaiful.me', '4', null, null, null, null, null, '2020-12-06 08:14:12', '2020-12-06 08:41:03');
INSERT INTO `users` VALUES ('9', '01234567895', '$2y$10$21C/.NZ0WUEEVhMayzQeXeWFGz4IBIDzLsNgY/cDeWorxZ2VByKga', null, null, null, 'Active', 'a', 's', 'sunan5@shaiful.me', '4', null, null, null, null, null, '2020-12-07 01:04:12', '2020-12-07 01:04:37');
INSERT INTO `users` VALUES ('10', '01234567811', '$2y$10$4uuApXEZgJ4YL6ecCdmwCeUZFMDDGrDqdbVuRMP.kLjBxisXMq0K6', 'tnvkSApvBrRdheFjKDI10hkBP4kIoYpA6ytZHlifcohKrEIWrRgX3F+Ui5d9Wy2P', null, null, 'Active', 'shaiful', 'shaiufl', 'sunan6@shaiful.me', '4', null, null, null, null, null, '2020-12-07 11:26:29', '2020-12-07 11:26:29');
INSERT INTO `users` VALUES ('11', '01234567800', '$2y$10$fR3aAjkix9vWt.8sBxVP0uIULToN28JjZC/skKujeelDCBZf6Uoii', '', null, null, 'Active', 'asad', 'asdf', 'sunan7@shaiful.me', '2', null, null, null, null, null, '2020-12-11 20:22:20', '2020-12-11 20:56:10');
INSERT INTO `users` VALUES ('12', '01234567801', '$2y$10$4yYSXnyyaipsWqzTvQkqWexXNCvHILJpjPVSQ9H3dWglpWY1crECy', '', null, null, 'Active', 'asad', 'asdf', 'sunan8@shaiful.me', '4', null, null, null, null, null, '2020-12-11 20:56:30', '2020-12-11 20:56:30');
INSERT INTO `users` VALUES ('13', '01234567802', '$2y$10$h0UChkFlHcfXi2gvHERZEeuu44/zR8bapJHfCdzvTvdRv5ppofFmy', '', null, null, 'In-Active', 'Shaiful Islam', 'সলাম', 'sunan9@shaiful.me', '4', null, null, null, null, null, '2020-12-01 21:09:08', '2020-12-13 00:56:29');
INSERT INTO `users` VALUES ('14', '01234567805', '$2y$10$m7GZLoYR0HNNoc7GQYH.2uqmIHlUv41xlbZcWYx5R4evIHnH8WIxy', '', null, null, 'Active', 'time', 'sa', 'sunan10@shaiful.me', '4', null, null, null, null, null, '2020-12-12 21:33:20', '2020-12-12 21:33:20');

-- ----------------------------
-- Table structure for `user_groups`
-- ----------------------------
DROP TABLE IF EXISTS `user_groups`;
CREATE TABLE `user_groups` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Active',
  `ordering` smallint(6) NOT NULL DEFAULT 99,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `action_0` varchar(500) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT ',',
  `action_1` varchar(500) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT ',',
  `action_2` varchar(500) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT ',',
  `action_3` varchar(500) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT ',',
  `action_4` varchar(500) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT ',',
  `action_5` varchar(500) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT ',',
  `action_6` varchar(500) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT ',',
  `action_7` varchar(500) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT ',',
  `action_8` varchar(500) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT ',',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of user_groups
-- ----------------------------
INSERT INTO `user_groups` VALUES ('1', 'Super Admin', 'Active', '99', null, null, null, null, ',2,3,4,6,7,8,9,10,', ',2,3,4,6,7,', ',2,3,4,6,7,', ',2,3,4,6,7,', ',2,3,4,6,7,', ',2,3,4,6,7,', ',2,3,4,6,7,', ',2,3,4,6,7,', ',2,3,4,6,7,');
INSERT INTO `user_groups` VALUES ('2', 'Admin', 'Active', '99', null, null, null, null, ',', ',', ',', ',', ',', ',', ',', ',', ',');
INSERT INTO `user_groups` VALUES ('3', 'Visitors', 'Active', '99', null, null, null, null, ',8,9,10,', ',', ',', ',', ',', ',', ',', ',', ',');
INSERT INTO `user_groups` VALUES ('4', 'Registered', 'Active', '99', null, null, null, null, ',7,8,9,10,', ',', ',', ',', ',7,', ',7,', ',7,', ',7,', ',2,');
