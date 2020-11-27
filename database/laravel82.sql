/*
Navicat MySQL Data Transfer

Source Server         : Localhost
Source Server Version : 50505
Source Host           : localhost:3306
Source Database       : laravel82

Target Server Type    : MYSQL
Target Server Version : 50505
File Encoding         : 65001

Date: 2020-11-27 08:50:42
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
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of personal_access_tokens
-- ----------------------------

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
INSERT INTO `sessions` VALUES ('1mDzWQYwwgXaKV5MKxceEv7nnRj8QL5IXKOsszwK', '1', '::1', 'Mozilla/5.0 (Windows NT 6.3; Win64; x64; rv:83.0) Gecko/20100101 Firefox/83.0', 'YTo4OntzOjY6Il90b2tlbiI7czo0MDoiV290RUJvZ21MakpCTDF4TUlYMGs2U3dreUlSdnl6RUwwdXhsU052dSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjU6Imh0dHA6Ly9sb2NhbGhvc3QvY2hlY2tvdXQiO31zOjM6InVybCI7YTowOnt9czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6MTtzOjE3OiJwYXNzd29yZF9oYXNoX3dlYiI7czo2MDoiJDJ5JDEwJG9PeEYuS0R0TXBubE5QdWlCWU43c3VLYld2dWJBUkhXblpHbmY3Y1N0YkRnUWZmcWszTEh1IjtzOjIxOiJwYXNzd29yZF9oYXNoX3NhbmN0dW0iO3M6NjA6IiQyeSQxMCRvT3hGLktEdE1wbmxOUHVpQllON3N1S2JXdnViQVJIV25aR25mN2NTdGJEZ1FmZnFrM0xIdSI7czo0OiJjYXJ0IjthOjM6e2k6MTAyO2E6Njp7czoyOiJpZCI7aToxMDI7czo0OiJuYW1lIjtzOjU6IkFwcGxlIjtzOjU6InByaWNlIjtkOjEwMDtzOjY6InN0YXR1cyI7czo2OiJBY3RpdmUiO3M6MTA6ImNyZWF0ZWRfYXQiO3M6Mjc6IjIwMjAtMTEtMjJUMTQ6NDk6NDMuMDAwMDAwWiI7czoxMDoidXBkYXRlZF9hdCI7czoyNzoiMjAyMC0xMS0yM1QwMToxMDo1My4wMDAwMDBaIjt9aTo5NDthOjY6e3M6MjoiaWQiO2k6OTQ7czo0OiJuYW1lIjtzOjU6Ik1hbmdvIjtzOjU6InByaWNlIjtkOjE1MDtzOjY6InN0YXR1cyI7czo2OiJBY3RpdmUiO3M6MTA6ImNyZWF0ZWRfYXQiO047czoxMDoidXBkYXRlZF9hdCI7czoyNzoiMjAyMC0xMS0yM1QwMToxMzowMy4wMDAwMDBaIjt9aTo5MzthOjY6e3M6MjoiaWQiO2k6OTM7czo0OiJuYW1lIjtzOjE1OiJKYW1lc29uIEhpbHBlcnQiO3M6NToicHJpY2UiO2Q6MTM3LjgxO3M6Njoic3RhdHVzIjtzOjY6IkFjdGl2ZSI7czoxMDoiY3JlYXRlZF9hdCI7TjtzOjEwOiJ1cGRhdGVkX2F0IjtOO319fQ==', '1606371972');
INSERT INTO `sessions` VALUES ('6lrxgLQecC30Izv8bOxZnswSoGrOjAudHcz5siLh', null, '59.127.252.213', 'Mozilla/5.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiRmR1RXJUcldaemRZVVdnWDl5UWJtSUJYTFVvVmtpUm5UbHltTGVmMyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MTY6Imh0dHA6Ly8xMjcuMC4wLjEiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', '1606368451');
INSERT INTO `sessions` VALUES ('AlkzCcQjr2TaPnlDqQeTOtK6E3XI0JENz33lQiOS', null, '192.241.238.197', 'Mozilla/5.0 zgrab/0.x', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZVZCMVJIQ3lKaUc1NnFLeHdmN2I1em5GRlFSYTJjZ21YUGNmdDhoTyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzU6Imh0dHA6Ly8xMDMuODkuMjcuMTg2L3BvcnRhbC9yZWRsaW9uIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', '1606364576');
INSERT INTO `sessions` VALUES ('e98gmxDkQtESAEe62kkCE1h5HV78VYIEAetkd2sk', null, '163.172.40.200', 'Mozilla/5.0 zgrab/0.x', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiOHR3T2FmRDM3RzJBYkJpMmJJYzlMdmZ6NUNhTUlKcDV2Qk1yNE9lYSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjA6Imh0dHA6Ly8xMDMuODkuMjcuMTg2Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', '1606368276');
INSERT INTO `sessions` VALUES ('fP41BYLbOvWiFIfILePWRsOEJNCOOYgI7MrNlx8Q', null, '89.40.73.248', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/38.0.2125.122 Safari/537.36 SE 2.X MetaSr 1.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiekZnVmVZazlDV0QwOGxIcExIRVFCelBmVGR6Z1BJRXBNNVBWMjNNQyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjA6Imh0dHA6Ly8xMDMuODkuMjcuMTg2Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', '1606364625');
INSERT INTO `sessions` VALUES ('GAuLj3dm8Zlx9xpCV0tPFONhNPEjLPpEdARNOptP', null, '192.241.238.48', 'Mozilla/5.0 zgrab/0.x', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiTUtEcUN4UEd5eVFpT3VoQXJqVGw2cUNKRXFHeWtiMzRyZEw2WEk2OSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzY6Imh0dHA6Ly8xMDMuODkuMjcuMTg2L2FjdHVhdG9yL2hlYWx0aCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', '1606376020');
INSERT INTO `sessions` VALUES ('H3onBvE2HtBr9JEJ3EW5o2GN98viOBxM80syeivG', null, '193.177.162.226', 'Mozilla/5.0 zgrab/0.x', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiTzNpSU5RcVpVd1F0Z3A0Qnhyc3JrMjBKUGtIMzB5MVlsWnNXcHoyYyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjA6Imh0dHA6Ly8xMDMuODkuMjcuMTg2Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', '1606364897');
INSERT INTO `sessions` VALUES ('icEzyn0dvaQvVxxTTjmHC1Segq6pwKrlIoX1Hw2i', null, '83.180.53.194', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.103 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoib09PQW04RGlLcWt4a3RSN3VMODdoTHJHdDNaWnFkWm9TSEhidUxUVyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjA6Imh0dHA6Ly8xMDMuODkuMjcuMTg2Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', '1606372171');
INSERT INTO `sessions` VALUES ('Io8e1oJN88SGZ6fG7o56sGiVSlPsfY66bgJsXGQ7', null, '104.136.130.152', '', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiNUJVM3E0bW1kYmE0QmVlV3BBb0R4Tmc0ekZ3WHRNcENNaHI4SU45ZyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjEwOiJodHRwOi8vbG9jYWxob3N0L3NldHVwLmNnaT9jbWQ9cm0lMjAtcmYlMjAlMkZ0bXAlMkYlMkElM0J3Z2V0JTIwaHR0cCUzQSUyRiUyRjE5Mi4xNjguMS4xJTNBODA4OCUyRk1vemkubSUyMC1PJTIwJTJGdG1wJTJGbmV0Z2VhciUzQnNoJTIwbmV0Z2VhciZjdXJwYXRoPSUyRiZjdXJyZW50c2V0dGluZ19odG09MSZuZXh0X2ZpbGU9bmV0Z2Vhci5jZmcmdG9kbz1zeXNjbWQiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', '1606368695');
INSERT INTO `sessions` VALUES ('MxzIvOURW828KFYUxdFSYoMao8AjxmgkfESQbL08', '1', '::1', 'Mozilla/5.0 (Windows NT 6.3; Win64; x64; rv:83.0) Gecko/20100101 Firefox/83.0', 'YTo3OntzOjY6Il90b2tlbiI7czo0MDoiQWhhU3YxTGhES0pJRmFHRHgxRkIyRjJQTDFOWjBnQlRrTGlRcHRoaCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDg6Imh0dHA6Ly9sb2NhbGhvc3QvdGhlbWUvY3NzL2Jvb3RzdHJhcC5taW4uY3NzLm1hcCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fXM6MzoidXJsIjthOjA6e31zOjUwOiJsb2dpbl93ZWJfNTliYTM2YWRkYzJiMmY5NDAxNTgwZjAxNGM3ZjU4ZWE0ZTMwOTg5ZCI7aToxO3M6MTc6InBhc3N3b3JkX2hhc2hfd2ViIjtzOjYwOiIkMnkkMTAkb094Ri5LRHRNcG5sTlB1aUJZTjdzdUtiV3Z1YkFSSFduWkduZjdjU3RiRGdRZmZxazNMSHUiO3M6MjE6InBhc3N3b3JkX2hhc2hfc2FuY3R1bSI7czo2MDoiJDJ5JDEwJG9PeEYuS0R0TXBubE5QdWlCWU43c3VLYld2dWJBUkhXblpHbmY3Y1N0YkRnUWZmcWszTEh1Ijt9', '1606445384');
INSERT INTO `sessions` VALUES ('nUZQVB9x4nrzEwTh4WpJ2MLHghJaoOUBYLjrRgj9', null, '149.3.85.127', '', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoic2lZMldVUFUzTGFHdFJYNzcxOWhpZURiUWpmZ3BOdVZaRVJRZThCQiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjEyOiJodHRwOi8vbG9jYWxob3N0L3NldHVwLmNnaT9jbWQ9cm0lMjAtcmYlMjAlMkZ0bXAlMkYlMkElM0J3Z2V0JTIwaHR0cCUzQSUyRiUyRjE0OS4zLjg1LjEyNyUzQTM0NDU1JTJGTW96aS5tJTIwLU8lMjAlMkZ0bXAlMkZuZXRnZWFyJTNCc2glMjBuZXRnZWFyJmN1cnBhdGg9JTJGJmN1cnJlbnRzZXR0aW5nX2h0bT0xJm5leHRfZmlsZT1uZXRnZWFyLmNmZyZ0b2RvPXN5c2NtZCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', '1606368501');
INSERT INTO `sessions` VALUES ('uZYI7loP1zBDbMXsExMc95kGHDKx4qEcsK6CwJH7', null, '2.57.122.186', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:76.0) Gecko/20100101 Firefox/76.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiNmhjT05BeVA3TUtTNmJWSEdTbDFtVGFuVm9kc3hsZk51eHZ3NW9uaCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDM6Imh0dHA6Ly8xMDMuODkuMjcuMTg2L2NvbmZpZy9nZXR1c2VyP2luZGV4PTAiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', '1606369811');
INSERT INTO `sessions` VALUES ('wnnjs9fQijCE4Egggjig13CUX0z37XEX233Jeowt', null, '103.237.32.194', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.103 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiYWozVjhUMzVPQ0N3ZVIxc3VVTlRrbXlFVXEwc1NOQ2hRS0FDcVRNaCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjA6Imh0dHA6Ly8xMDMuODkuMjcuMTg2Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', '1606442308');
INSERT INTO `sessions` VALUES ('XB6cRHauZGeZcKztTry2EYFWFETKPAMf5Ohd80wO', null, '2.57.122.186', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:76.0) Gecko/20100101 Firefox/76.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoidlBVUllEWVlPYmNKUlpNeEtLSHJma3pVdlVXazIyMUJ5aEZSU1pMZSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDM6Imh0dHA6Ly8xMDMuODkuMjcuMTg2L2NvbmZpZy9nZXR1c2VyP2luZGV4PTAiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', '1606363944');

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
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

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
INSERT INTO `system_tasks` VALUES ('8', 'Shop', 'দোকান', 'TASK', '0', 'Shop', '3', 'menu.png', 'Active', 'No', null, null);
INSERT INTO `system_tasks` VALUES ('9', 'Checout', 'চেকআউট', 'TASK', '0', 'Checkout', '4', 'menu.png', 'Active', 'No', null, null);

-- ----------------------------
-- Table structure for `users`
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `mobile_no` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES ('1', '01912097849', '$2y$10$oOxF.KDtMpnlNPuiBYN7suKbWvubARHWnZGnf7cStbDgQffqk3LHu', null, null, 'Active', 'Shaiful Islam', 'সাইফুল ইসলাম', 'shaiful@shaiful.me', '1', null, null, 'profile-photos/1/jyXMhMWeg1XXWgGZZ8cSnOfngd1T2imqfycvK1Ea.png', null, null, '2020-11-21 01:59:00', '2020-11-21 02:14:03');
INSERT INTO `users` VALUES ('4', '01794624835', '$2y$10$ufKTa2IAAvdEkaJ.Cy9AFuZdIzf/ik4d7xBjOeVYeBVnfj5c/im9W', null, null, 'Active', 'Samin sharmeen', 'সামিন শারমিন', 'sunan@shaiful.me', '4', null, null, null, null, null, '2020-11-24 07:24:52', '2020-11-24 07:24:52');

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
INSERT INTO `user_groups` VALUES ('1', 'Super Admin', 'Active', '99', null, null, null, null, ',2,3,4,6,7,,8,9,', ',2,3,4,6,7,', ',2,3,4,6,7,', ',2,3,4,6,7,', ',2,3,4,6,7,', ',2,3,4,6,7,', ',2,3,4,6,7,', ',2,3,4,6,7,', ',2,3,4,6,7,');
INSERT INTO `user_groups` VALUES ('2', 'Admin', 'Active', '99', null, null, null, null, ',', ',', ',', ',', ',', ',', ',', ',', ',');
INSERT INTO `user_groups` VALUES ('3', 'Visitors', 'Active', '99', null, null, null, null, ',8,9,', ',', ',', ',', ',', ',', ',', ',', ',');
INSERT INTO `user_groups` VALUES ('4', 'Registered', 'Active', '99', null, null, null, null, ',7,,8,9,', ',', ',', ',', ',7,', ',7,', ',7,', ',7,', ',2,');
