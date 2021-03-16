-- phpMyAdmin SQL Dump
-- version 4.9.4
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Mar 16, 2021 at 05:33 PM
-- Server version: 5.5.57-MariaDB
-- PHP Version: 7.3.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `w156cred__wplending`
--

-- --------------------------------------------------------

--
-- Table structure for table `account_repayment_records`
--

CREATE TABLE `account_repayment_records` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `client_phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_reference` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `access_code` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'status of the account from paystack',
  `transaction_reference` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gateway_response` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `authorization_code` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `card_type` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `card_last_4` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `exp_month` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `exp_year` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bin` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bank` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `signature` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `channel` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `reusable` tinyint(1) DEFAULT NULL,
  `customer_id` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'customer id on paystack',
  `customer_email` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `trans_date` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `account_repayment_records`
--

INSERT INTO `account_repayment_records` (`id`, `user_id`, `client_phone`, `customer_reference`, `access_code`, `status`, `transaction_reference`, `gateway_response`, `authorization_code`, `card_type`, `card_last_4`, `exp_month`, `exp_year`, `bin`, `bank`, `signature`, `channel`, `reusable`, `customer_id`, `customer_email`, `trans_date`, `created_at`, `updated_at`) VALUES
(17, NULL, '08037228850', 'gnj2sl4344', 'mg62990j7d68gav', 'success', 'gnj2sl4344', 'Approved', 'AUTH_k0l33gf9pg', 'mastercard DEBIT', '2879', '12', '2022', '539941', 'Zenith Bank', 'SIG_2jhYSXhCiCrEpHexI1Ih', 'card', 1, '25672455', 'stella.ibhade@gmail.com', NULL, NULL, '2020-06-25 19:56:03'),
(19, NULL, '08033298534', '0ja32cauly', 'a25xb12cbsedszt', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(23, NULL, '07087335778', '454tc0bvx9', 'jfvq7u01d52fykg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(24, NULL, '07087335778', 'rxe2si98ef', '7m2vkf7lxo42umt', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(25, NULL, '07087335778', 'wjhr3sofcb', 'j7axtcaz2v02v3x', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(26, NULL, '08084051636', 'c966xo2en7', 'd1e7ppykv7o0upt', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(27, NULL, '08033008963', 'hsyz78qopl', 'ce9r2ff6lo7jl64', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `admin_id` varchar(255) DEFAULT NULL COMMENT 'md5 twice',
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `other_name` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `mobile_phone_number` varchar(50) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `permissions_details` text,
  `when_added` timestamp NULL DEFAULT NULL,
  `added_by` varchar(255) DEFAULT NULL COMMENT 'id of superadmin who added',
  `status` tinyint(1) DEFAULT NULL COMMENT '1 for active, 0 for disabled, 2 for suspended',
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `admin_id`, `first_name`, `last_name`, `other_name`, `password`, `mobile_phone_number`, `email`, `username`, `permissions_details`, `when_added`, `added_by`, `status`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, '84198155c5c81ea058359fd9ee9b4780', 'samuel', 'adebunmi', 'olusola', '$2y$10$pl6icYfPFyIdFmgiKwq9fOl9ctuZiEDp.PonpYi85f3vzCsAi0Ns.', '08168509044', 'adebsholey4reale@gmail.com', 'adebsholey4reale@gmail.com', 'details here', '2020-04-10 12:16:36', '5ae29817e2bceds2181e9c7b5c491769', 1, 'eKxgmO1DRjWI67Hm2oR8rWwkjPTVpHX5GIFkZ7QYKiHUoMtF601DMi60dY4N', '0000-00-00 00:00:00', '2020-05-17 10:34:57'),
(7, 'aa8c4f939b116b90a221283a8afe8c56', 'ajosav', 'ajosavboy', 'Joshua', '$2y$10$hiQaXKQ1rhd6AbYCgxMqL.ONw0MwavAm6kl4ODASnryYS2cKLnN5W', '09089786758', 'ajosavboy@gmail.com', '', NULL, NULL, NULL, 1, '12NX2DoqL3csUpg2TEQmdrNjjbWRUKVdLIxoNOK2Bue4qPtHlAuZ2aTj56Et', '2020-05-08 11:21:41', '2020-05-08 18:20:55'),
(9, '38aad9deabb72ed633f3e48cabe8ad7b', 'Admin', 'Cloudware', 'Technologies', '$2y$10$bmpNs8AevAkrLRip4FXtBuK00KtofFJl7A3nOrseHh.ubP03TLfw2', '08137512747', 'ctosoffice@cloudware.ng', '', NULL, NULL, 'aa8c4f939b116b90a221283a8afe8c56', 1, 'AFluDUj9d96XVdHKMbvttQFfBjh9YAhCCuPXHRneITvUXRhlRlTFofreIPnT', '2020-05-17 20:22:28', '2020-05-17 20:22:36'),
(10, 'b13ca80bfe17ae872c5911a9d32a476b', 'Owolabi', 'Badmus', 'Temitope', '$2y$10$qp1QtTaiHwQ.ntmPRdPj7uSYodlT5ow.jApVIh3i02ozR8VcTgSAa', '08154955575', 'temitope.owolabi@cloudware.ng', '', NULL, NULL, 'aa8c4f939b116b90a221283a8afe8c56', 1, '4pEK4Rcsn4EN5v7LCZyAMAY9gtFmI4J09WL9nT35', '2020-06-19 10:28:08', '2020-06-19 10:28:18'),
(11, 'c4e75ea6c8363987dd8a6f512467f336', 'Femi', 'Cloudware', 'Tester', '$2y$10$bzSvuXOXdwR9bGEXebHMPeosHL2r5QASS81yw85TL6vkkoTfxqgoO', '07037495325', 'akinfemi46@gmail.com', NULL, NULL, NULL, NULL, 2, 'xZZyK2L7b1B9QGDvF5kBoKk5JiVQR4h8KIQR3KHl', '2021-03-15 18:43:19', '2021-03-15 18:43:19');

-- --------------------------------------------------------

--
-- Table structure for table `audit_log`
--

CREATE TABLE `audit_log` (
  `id` int(11) NOT NULL,
  `activity_performed` mediumtext,
  `who_performed` varchar(255) DEFAULT NULL,
  `ip_address` varchar(255) DEFAULT NULL,
  `when_performed` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `url_accessed` mediumtext NOT NULL,
  `system_name` varchar(255) NOT NULL,
  `before_details` varchar(255) NOT NULL,
  `after_details` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `audit_log`
--

INSERT INTO `audit_log` (`id`, `activity_performed`, `who_performed`, `ip_address`, `when_performed`, `url_accessed`, `system_name`, `before_details`, `after_details`) VALUES
(5, 'admin creation', '5ae29817e2bceds2181e9c7b5c491769', '192.156.234.33', '2020-04-10 12:26:55', 'www.whatsapp_lending.com', 'sammy PC', 'this happens before', 'this happens after'),
(8, 'chat return template creation', '5ae29817e2bceds2181e9c7b5c491769e', '192.156.234.33', '2020-04-10 12:58:29', 'www.whatsapp_lending.com', 'sammyPC2', 'chat template before creation', 'chat template after creation');

-- --------------------------------------------------------

--
-- Table structure for table `bvn_json`
--

CREATE TABLE `bvn_json` (
  `id` int(11) NOT NULL,
  `phone` varchar(100) DEFAULT NULL,
  `first_name` varchar(100) DEFAULT NULL,
  `last_name` varchar(100) DEFAULT NULL,
  `bvn` varchar(100) DEFAULT NULL,
  `json` longtext,
  `date` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `bvn_json`
--

INSERT INTO `bvn_json` (`id`, `phone`, `first_name`, `last_name`, `bvn`, `json`, `date`) VALUES
(1, '08168509044', 'samuel', 'adebunmi', '22225553718', '{\n  \"status\": true,\n  \"message\": \"BVN resolved\",\n  \"data\": {\n    \"first_name\": \"OLUSOLA\",\n    \"last_name\": \"ADEBUNMI\",\n    \"dob\": \"03-Sep-88\",\n    \"formatted_dob\": \"1988-09-03\",\n    \"mobile\": \"08168509044\",\n    \"bvn\": \"22225553718\"\n  },\n  \"meta\": {\n    \"calls_this_month\": 28,\n    \"free_calls_left\": 0\n  }\n}', '2020-05-26 09:08:04'),
(2, '08052257405', 'Akinmade', 'Akintoye', '22181814058', '{\n  \"status\": true,\n  \"message\": \"BVN resolved\",\n  \"data\": {\n    \"first_name\": \"AKINMADE\",\n    \"last_name\": \"AKINTOYE\",\n    \"dob\": \"02-May-90\",\n    \"formatted_dob\": \"1990-05-02\",\n    \"mobile\": \"08179092255\",\n    \"bvn\": \"22181814058\"\n  },\n  \"meta\": {\n    \"calls_this_month\": 29,\n    \"free_calls_left\": 0\n  }\n}', '2020-05-26 17:00:58'),
(3, '08154955575', 'Owolabi', 'Temitope', '22445494549', '{\n  \"status\": true,\n  \"message\": \"BVN resolved\",\n  \"data\": {\n    \"first_name\": \"BADMUS\",\n    \"last_name\": \"OWOLABI\",\n    \"dob\": \"27-Jul-97\",\n    \"formatted_dob\": \"1997-07-27\",\n    \"mobile\": \"08154955575\",\n    \"bvn\": \"22445494549\"\n  },\n  \"meta\": {\n    \"calls_this_month\": 1,\n    \"free_calls_left\": 9\n  }\n}', '2020-06-18 18:26:06'),
(4, '08037228850', 'Stella', 'Ibhade', '22144637287', '{\n  \"status\": true,\n  \"message\": \"BVN resolved\",\n  \"data\": {\n    \"first_name\": \"STELLA\",\n    \"last_name\": \"IBHADE\",\n    \"dob\": \"01-Dec-79\",\n    \"formatted_dob\": \"1979-12-01\",\n    \"mobile\": \"08037228850\",\n    \"bvn\": \"22144637287\"\n  },\n  \"meta\": {\n    \"calls_this_month\": 2,\n    \"free_calls_left\": 8\n  }\n}', '2020-06-25 20:48:07'),
(5, '08136022884', 'Bassey', 'Ademoyega', '22141870348', '{\n  \"status\": true,\n  \"message\": \"BVN resolved\",\n  \"data\": {\n    \"first_name\": \"BASSEY\",\n    \"last_name\": \"ADEMOYEGA\",\n    \"dob\": \"07-Oct-80\",\n    \"formatted_dob\": \"1980-10-07\",\n    \"mobile\": \"08023111660\",\n    \"bvn\": \"22141870348\"\n  },\n  \"meta\": {\n    \"calls_this_month\": 3,\n    \"free_calls_left\": 7\n  }\n}', '2020-06-26 11:13:40'),
(6, '08033298534', 'Adebayo', 'Michael-Ojo', '22151886861', '{\n  \"status\": true,\n  \"message\": \"BVN resolved\",\n  \"data\": {\n    \"first_name\": \"FRANCIS\",\n    \"last_name\": \"MICHAEL-OJO\",\n    \"dob\": \"13-Jan-68\",\n    \"formatted_dob\": \"1968-01-13\",\n    \"mobile\": \"08033298534\",\n    \"bvn\": \"22151886861\"\n  },\n  \"meta\": {\n    \"calls_this_month\": 4,\n    \"free_calls_left\": 6\n  }\n}', '2020-06-30 22:29:00'),
(7, '07065514100', 'Adeniyi', 'Aderinto', '22242237381', '{\n  \"status\": true,\n  \"message\": \"BVN resolved\",\n  \"data\": {\n    \"first_name\": \"ADENIYI\",\n    \"last_name\": \"ADERINTO\",\n    \"dob\": \"20-Sep-72\",\n    \"formatted_dob\": \"1972-09-20\",\n    \"mobile\": \"07065514100\",\n    \"bvn\": \"22242237381\"\n  },\n  \"meta\": {\n    \"calls_this_month\": 1,\n    \"free_calls_left\": 9\n  }\n}', '2020-07-01 11:42:37'),
(8, '07081605493', 'Aderoju', 'Ademoyega', '22160367287', '{\n  \"status\": true,\n  \"message\": \"BVN resolved\",\n  \"data\": {\n    \"first_name\": \"ADEROJU\",\n    \"last_name\": \"ADEMOYEGA\",\n    \"dob\": \"24-Jul-81\",\n    \"formatted_dob\": \"1981-07-24\",\n    \"mobile\": \"08067033576\",\n    \"bvn\": \"22160367287\"\n  },\n  \"meta\": {\n    \"calls_this_month\": 2,\n    \"free_calls_left\": 8\n  }\n}', '2020-07-01 11:53:54'),
(9, '08033127287', 'tiwalade', 'ademoyega', '22141821153', '{\n  \"status\": true,\n  \"message\": \"BVN resolved\",\n  \"data\": {\n    \"first_name\": \"TIWALADE\",\n    \"last_name\": \"ADEMOYEGA\",\n    \"dob\": \"09-Apr-75\",\n    \"formatted_dob\": \"1975-04-09\",\n    \"mobile\": \"08033127287\",\n    \"bvn\": \"22141821153\"\n  },\n  \"meta\": {\n    \"calls_this_month\": 3,\n    \"free_calls_left\": 7\n  }\n}', '2020-07-02 14:08:30'),
(10, '07087335778', 'azubuike', 'emereonye', '22201370843', '{\n  \"status\": true,\n  \"message\": \"BVN resolved\",\n  \"data\": {\n    \"first_name\": \"AZUBUIKE\",\n    \"last_name\": \"EMEREONYE\",\n    \"dob\": \"06-Apr-78\",\n    \"formatted_dob\": \"1978-04-06\",\n    \"mobile\": \"07087335778\",\n    \"bvn\": \"22201370843\"\n  },\n  \"meta\": {\n    \"calls_this_month\": 4,\n    \"free_calls_left\": 6\n  }\n}', '2020-07-02 14:08:48'),
(11, '08084051636', 'ojomon', 'ibhade', '22154270423', '{\n  \"status\": true,\n  \"message\": \"BVN resolved\",\n  \"data\": {\n    \"first_name\": \"OJOMON\",\n    \"last_name\": \"IBHADE\",\n    \"dob\": \"12-Apr-75\",\n    \"formatted_dob\": \"1975-04-12\",\n    \"mobile\": \"08084051636\",\n    \"bvn\": \"22154270423\"\n  },\n  \"meta\": {\n    \"calls_this_month\": 5,\n    \"free_calls_left\": 5\n  }\n}', '2020-07-03 16:54:25'),
(12, '08033008963', 'olayinka', 'ogundairo', '22190139298', '{\n  \"status\": true,\n  \"message\": \"BVN resolved\",\n  \"data\": {\n    \"first_name\": \"OLAYINKA\",\n    \"last_name\": \"OGUNDAIRO\",\n    \"dob\": \"14-Oct-74\",\n    \"formatted_dob\": \"1974-10-14\",\n    \"mobile\": \"08033008963\",\n    \"bvn\": \"22190139298\"\n  },\n  \"meta\": {\n    \"calls_this_month\": 6,\n    \"free_calls_left\": 4\n  }\n}', '2020-07-03 22:50:31');

-- --------------------------------------------------------

--
-- Table structure for table `chat_return_template`
--

CREATE TABLE `chat_return_template` (
  `id` int(11) NOT NULL,
  `message_id` varchar(255) DEFAULT NULL,
  `message_type` tinyint(3) DEFAULT NULL,
  `message` text,
  `message_url` varchar(255) DEFAULT NULL,
  `message_image` mediumtext,
  `when_added` timestamp NULL DEFAULT NULL,
  `who_added` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `chat_return_template`
--

INSERT INTO `chat_return_template` (`id`, `message_id`, `message_type`, `message`, `message_url`, `message_image`, `when_added`, `who_added`) VALUES
(5, '0f0b21007dc1397a9ea28209746fe1bb', 1, 'Hello', 'www.whatsapp_lending.com/message_url', '08168509044', '2020-04-10 12:58:29', '5ae29817e2bceds2181e9c7b5c491769e');

-- --------------------------------------------------------

--
-- Table structure for table `chat_status_tbl`
--

CREATE TABLE `chat_status_tbl` (
  `id` bigint(255) NOT NULL,
  `chat_id` varchar(255) DEFAULT NULL,
  `status` varchar(100) DEFAULT NULL,
  `variable_json` text,
  `date_added` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `chat_status_tbl`
--

INSERT INTO `chat_status_tbl` (`id`, `chat_id`, `status`, `variable_json`, `date_added`) VALUES
(1, '1135428624', 'get_phone', '[]', '2021-03-15 17:42:23'),
(2, '1339305363', 'sdfs', '[]', '2021-03-15 18:30:42');

-- --------------------------------------------------------

--
-- Table structure for table `completed_transfers`
--

CREATE TABLE `completed_transfers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `loan_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `reference_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'recipient code',
  `transfer_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `transfer_reference` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `recipient_code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'paystack assigned code',
  `transfer_code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'transfer code for retrieval of transfer data',
  `status` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'status of the transfer',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `completed_transfers`
--

INSERT INTO `completed_transfers` (`id`, `loan_id`, `reference_id`, `transfer_id`, `transfer_reference`, `recipient_code`, `transfer_code`, `status`, `created_at`, `updated_at`) VALUES
(9, 'loans_11c1bdf03bfbdba165c62c47169628ba', 'RCP_eopqvgfogwblt1v', '26466897', 'vwppmkost0', '7321401', 'TRF_i1a0tpqzcizgyro', 'success', '2020-07-04 19:08:12', '2020-07-04 19:09:04'),
(24, 'loans_9f3d6a256caa31fc95c2f5ef5ce4e9e8', 'RCP_5u9m4lbnvnx8a5a', '27818987', 'ppm7a8rf3e', '7803204', 'TRF_okex9r385kpya2e', 'success', '2020-07-20 14:56:09', '2020-07-20 14:57:04'),
(26, 'loans_0dd200f6c6449fd4fc5c326551f622a2', 'RCP_ieoosvlufxomthw', '27928171', 'f558o4mldh', '7462325', 'TRF_xgt2jkqsnj61cfp', 'success', '2020-07-21 20:51:10', '2020-07-21 20:52:03'),
(27, 'loans_bee89758ab9e909019af22af9dff88bb', 'RCP_7ugljz33gee77w0', '27958809', 'xydvm8isfb', '7842599', 'TRF_v460ryvutpiyve0', 'success', '2020-07-22 09:38:11', '2020-07-22 09:39:05'),
(28, 'loans_c56736d9a5004e14602bf334198f7c43', 'RCP_a8folwj13ap1evx', '28007660', 'kuxpke9pq0', '7856580', 'TRF_dus7astt3vvyizq', 'success', '2020-07-22 20:49:09', '2020-07-22 20:50:07'),
(29, 'loans_76feee13c97be36b1f9a65609cccc0b5', 'RCP_98kzmg8bjydyftg', '28045694', 'vm5hfv164g', '7457648', 'TRF_j6a5eezef0qeezi', 'success', '2020-07-23 11:20:13', '2020-07-23 12:26:04'),
(30, 'loans_1856107bd3f1979fd3b57efbc8b44463', 'RCP_ewmbnpxs6kirysy', '28072032', 'y0if2yva53', '7874852', 'TRF_kggmpgqcm5r020s', 'success', '2020-07-23 18:02:14', '2020-07-23 18:03:05'),
(31, 'loans_bf53e8b06a0fa868cafd12c1ee57dd2b', 'RCP_c9l3wech9bmv0zi', '28086225', '6nj66qvtr2', '7878570', 'TRF_gtzwthc60wuziro', 'success', '2020-07-23 21:09:16', '2020-07-23 21:10:06'),
(32, 'loans_b95cbb0ba53f7515b24297e75adcc53e', 'RCP_j376y68rkx480d8', '28114002', 'rumcgipvk5', '7886134', 'TRF_wvlh6ukk5hhd061', 'success', '2020-07-24 09:18:27', '2020-07-24 09:19:11'),
(33, 'loans_541c759a6a5135e974730d84677d8f5a', 'RCP_6rdf6mho6xmlrtl', '28274398', 'cv3pfcxjoz', '7925169', 'TRF_7kyjgyegpt1xywq', 'success', '2020-07-26 10:24:12', '2020-07-26 10:25:05'),
(34, 'loans_e734e55ccda4d1a08a861220458b99b9', 'RCP_6qucbe1lvoszdvf', '28425184', '6e6uzma2ab', '7957631', 'TRF_wegy09mqir6jmq7', 'success', '2020-07-27 21:02:10', '2020-07-27 21:03:05'),
(35, 'loans_d6a78512862073cb7a4e9a7116f72b96', 'RCP_eopqvgfogwblt1v', '28462791', '9vd0o8fmnx', '7321401', 'TRF_4mqcvjeo9iine7w', 'success', '2020-07-28 11:34:08', '2020-07-28 11:35:04'),
(36, 'loans_5c4b13ecafb6634ee3da2b64f952fda4', 'RCP_vxdbbjil12msw69', '28472326', 'kyveknb837', '7969633', 'TRF_i1j6f2ea8ansr8e', 'success', '2020-07-28 13:45:12', '2020-07-28 13:46:03'),
(37, 'loans_bb5507b15eabaa53b38d0df59c05dfa8', 'RCP_7ugljz33gee77w0', '30056252', 'lsrrkmcejt', '7842599', 'TRF_5oujy3y0sl0m1gf', 'success', '2020-08-14 16:56:09', '2020-08-14 16:57:03');

-- --------------------------------------------------------

--
-- Table structure for table `defaulter_list`
--

CREATE TABLE `defaulter_list` (
  `id` int(11) NOT NULL,
  `defaulter_id` varchar(255) DEFAULT NULL,
  `client_phone` varchar(255) DEFAULT NULL,
  `loan_id` varchar(50) DEFAULT NULL,
  `status` tinyint(4) DEFAULT NULL,
  `since_when` timestamp NULL DEFAULT NULL,
  `amnt_owed` int(11) DEFAULT NULL,
  `recovery_level_used` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `diss_pend`
--

CREATE TABLE `diss_pend` (
  `id` int(11) NOT NULL,
  `diss_id` varchar(255) DEFAULT NULL,
  `amount` int(11) DEFAULT NULL,
  `client_id` varchar(255) DEFAULT NULL,
  `channel_dis` char(8) DEFAULT NULL COMMENT 'abbrivation of disburse channel',
  `when_requested` timestamp NULL DEFAULT NULL,
  `expected_repay` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `diss_pend_log`
--

CREATE TABLE `diss_pend_log` (
  `id` int(11) NOT NULL,
  `diss_id` varchar(255) DEFAULT NULL,
  `amount` int(11) DEFAULT NULL,
  `client_id` varchar(255) DEFAULT NULL,
  `channel_dis` char(8) DEFAULT NULL COMMENT 'abbrivation of disburse channel',
  `when_requested` timestamp NULL DEFAULT NULL,
  `when_diss` timestamp NULL DEFAULT NULL,
  `who_diss` varchar(255) DEFAULT NULL,
  `repaid` tinyint(1) DEFAULT NULL COMMENT '1 for yes 2 for partial, 0 for no',
  `expected_repay` int(11) DEFAULT NULL,
  `expected_repay_date` timestamp NULL DEFAULT '0000-00-00 00:00:00',
  `classified_default` tinyint(1) DEFAULT NULL COMMENT '1 for default'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `email_otp`
--

CREATE TABLE `email_otp` (
  `id` int(11) NOT NULL,
  `unique_id` varchar(255) DEFAULT NULL,
  `email` varchar(200) DEFAULT NULL,
  `code` int(7) DEFAULT NULL,
  `date_sent` datetime DEFAULT NULL,
  `expiry_date` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `email_otp`
--

INSERT INTO `email_otp` (`id`, `unique_id`, `email`, `code`, `date_sent`, `expiry_date`) VALUES
(19, '548865e850a1bbadf56f335d04e8d3c9', 'adebsholey4real@gmail.com', 68818, '2020-06-25 12:10:20', '2020-06-25 12:40:20'),
(8, '29be620fea91b2738ca45c96540789ee', 'hr_internal@cloudware.ng', 87226, '2020-06-25 11:50:50', '2020-06-25 12:20:50'),
(20, '7113aa6a29d598fcb13b81bf2955be11', 'ogunleyeoluwatosin2014@gmail.com', 38225, '2020-06-25 12:10:56', '2020-06-25 12:40:56'),
(11, 'f668f50ad72cd253c8fd60532281dc55', 'oluwatosin.ogunleye@cloudware.ng', 68146, '2020-06-25 11:57:23', '2020-06-25 12:27:23');

-- --------------------------------------------------------

--
-- Table structure for table `existing_users`
--

CREATE TABLE `existing_users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `unique_id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'MD5 current time',
  `staff_number` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `staff_name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `dob` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date_of_emp` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'date_of_employment',
  `phone_1` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone_2` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL,
  `confirmation_status` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `g_m_s` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `n_m_s` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `bank_name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `bank_code` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bank_acct_no` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `bvn` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `existing_users`
--

INSERT INTO `existing_users` (`id`, `unique_id`, `staff_number`, `staff_name`, `dob`, `date_of_emp`, `phone_1`, `phone_2`, `confirmation_status`, `g_m_s`, `n_m_s`, `bank_name`, `bank_code`, `bank_acct_no`, `bvn`, `created_at`, `updated_at`) VALUES
(1, '95970f8db7381d996c5b29fa62634d10', '101', 'Akinmade Akintoye', '12/2/1980', '12/3/2009', '08168509044', '08052257405', 'Y', '80000', '156000', 'GTbank', '058', '0028919118', '22181814058', '2020-05-26 05:03:23', '2020-05-26 05:03:23'),
(4, '5caee34ac4a09a7f0a2166bce2341c26', '', 'IBHADE EHINOMEN', '4/28/1977', '1/1/2000', '08023154429', '08182193401', 'Y', '50000', '45000', 'ZENITH', '057', '2254299975', '22142024818', NULL, NULL),
(5, '59386f534df5b5904d3300c89fa6d9c8', '', 'IBHADE STELLA', '12/1/1979', '1/1/2000', '08037228850', '-', 'Y', '50000', '45000', 'ZENITH', '057', '1000729315', '22144637287', NULL, NULL),
(6, 'c8776da8e92b58eecc319e24a9c499f7', '', 'AJARE KINGSLEY', '11/13/1990', '1/1/2000', '07039833163', '08095278545', 'Y', '50000', '45000', 'UNION', '032', '0038631295', '22207279139', NULL, NULL),
(7, '8c783bb545f1d1a3fa80d4d7dec46b3c', '', 'NWACHUKWU ITSWELL', '2/25/1994', '1/1/2000', '08034333230', '-', 'Y', '50000', '45000', 'ACCESS', '044', '0028016266', '22142853249', NULL, NULL),
(8, '8e7bdc00f2e03d27c654d77f76cb4eba', '', 'MOSES BLESSING', '4/1/1990', '1/1/2000', '09096859029', '07068084493', 'Y', '50000', '45000', 'FCMB', '214', '4416165011', '22225651027', NULL, NULL),
(9, '25b436ea35d65038a00354239049dccc', '', 'OBOK REGINA', '11/25/1996', '1/1/2000', '09030036046', '08081260702', 'Y', '50000', '45000', 'ACCESS', '044', '0107961980', '22504179363', NULL, NULL),
(10, '9fb775b84dd39d425de891f0dbce2d51', '', 'ADEMOYEGA BASSEY', '10/7/1980', '1/1/2000', '08136022884', '08023111660', 'Y', '50000', '45000', 'ZENITH', '057', '1020063338', '22141870348', NULL, NULL),
(11, '7334b02009d56214d6e2434e358e6132', '', 'EMEREONYE AZUBUIKE', '6/4/1978', '1/1/2000', '08179044394', '07087335778', 'Y', '50000', '45000', 'ACCESS', '044', '0075018989', '22201370843', NULL, NULL),
(12, '2294a61a1979519897e810148ed30111', '', 'MAYA JOSEPH', '12/25/1977', '1/1/2000', '08156183373', '08103021782', 'Y', '50000', '45000', 'UBA', '033', '2125147855', '22143213796', NULL, NULL),
(13, 'ffa0995a4d4d148233f742ac2064f7cf', '', 'ADEMOYEGA ADEROJU', '7/24/1981', '1/1/2000', '07081605493', '08115502608', 'Y', '50000', '45000', 'GTB', '058', '0037534476', '22160367287', NULL, NULL),
(14, 'b5b7c3c4f51ba13cba3327fffd1f0c99', '', 'OGUNDAIRO NKOYO', '8/2/1976', '1/1/2000', '07039887142', '-', 'Y', '50000', '45000', 'GTB', '058', '0006088050', '22298409020', NULL, NULL),
(15, '3775effb1488f8aaf1c062e3a4dee132', '', 'ADERINTO ADENIYI', '9/20/1972', '1/1/2000', '07065514100', '-', 'Y', '50000', '45000', 'STANBIC', '221', '9202442190', '22242237381', NULL, NULL),
(16, '9c68de871e6140e915eec95bd65783ae', '', 'MICHAEL-OJO ADEBAYO', '1/13/1968', '1/1/2000', '08033298534', '-', 'Y', '50000', '20000', 'GTB', '058', '0161670512', '22151886861', NULL, NULL),
(17, '7d6ad1e23e3df6943890676e39da6464', '', 'UDOAKA MARY', '4/18/1981', '1/1/2000', '08027256586', '08064204055', 'Y', '50000', '45000', 'Access Bank', '044', '1382914321', '22312008057', NULL, NULL),
(18, '69e8d5301f91c2c22d5874adc1f3358f', '', 'ADERINTO STEPHEN', '4/23/1975', '1/1/2000', '08099120707', '-', 'Y', '50000', '45000', 'GTB', '058', '0019786701', '22172462637', NULL, NULL),
(19, '95970f8db7-4059_6c5b29fa62634d10', '', 'Nwachukwu Itswell', '27/10/1976', '', '08034333230', '', 'Y', '', '', 'Access Bank', '044', '0028016266', '22142853249', '2020-06-16 11:38:44', NULL),
(20, '7d6ad1e23e3df69438906763uwda6464', '', 'Joshua Adebayo', '09/19/1999', '20/08/2018', '08137512747', '08138152101', 'Y', '800000', '700000', 'Access Bank', '044', '0791138362', '22445494549', '2020-06-18 17:06:00', NULL),
(21, '19d0f4edf38881fc5455da09f3384bde', '', 'IBHADE OJOMO', '12-04-75', '01-01-00', '08084051636', '07034130534', 'Y', '50000', '45000', 'UNION', '032', '0041674010', '22154270423', NULL, NULL),
(22, '571f8074a291a70cb4474fb93e2435f0', '', 'ADEMOYEGA TIWALADE', '09-04-75', '01-01-00', '08033127287', '08136022884', 'Y', '50000', '45000', 'FCMB', '214', '0224041015', '22141821153', NULL, NULL),
(23, '9a49bfc3dc6ff059e7f19919226dba39', '', 'OGUNDAIRO OLAYINKA', '14-10-1974', '01-01-00', '08033008963', '', 'Y', '50000', '45000', 'ZENITH', '057', '1001779238', '22190139298', NULL, NULL),
(24, '9a49bfc3dc6ff059e7f19919226dba12', '', 'Sammy Testing', '14-10-1974', '01-01-00', '08032122345', '', 'Y', '50000', '45000', 'ZENITH', '057', '1001779238', '22190139298', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `failed_logins`
--

CREATE TABLE `failed_logins` (
  `id` int(11) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `user_id` varchar(200) DEFAULT NULL,
  `user_type` tinyint(1) DEFAULT '0' COMMENT '0- undefined(rare case), 1- user 2- admin',
  `ip_address` varchar(100) DEFAULT NULL,
  `when_last_login` datetime DEFAULT NULL,
  `system_name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `failed_logins`
--

INSERT INTO `failed_logins` (`id`, `email`, `user_id`, `user_type`, `ip_address`, `when_last_login`, `system_name`) VALUES
(1, 'peto@gmail.com', 'd2a397533e3e640494168a353c965e0f', 1, '192.168.09.33', '2020-04-10 17:05:15', 'petoPC'),
(2, 'adebsholey4reale@gmail.com', '0918ab11daed32e5ca9759cb43a81887', 1, '192.168.09.44', '2020-04-10 17:05:15', 'sammyPC'),
(7, 'adebsholey4reale@gmail.com', '0918ab11daed32e5ca9759cb43a81887', 1, '192.168.04.55', '2020-04-11 07:27:40', 'sammy_PC'),
(8, 'adebsholey4reale@gmail.com', '0918ab11daed32e5ca9759cb43a81887', 1, '192.168.04.55', '2020-04-11 08:22:13', 'sammy_PC'),
(9, 'adebsholey4reale@gmail.com', '0918ab11daed32e5ca9759cb43a81887', 1, '192.168.04.55', '2020-04-28 23:16:47', 'sammy_PC');

-- --------------------------------------------------------

--
-- Table structure for table `last_logins`
--

CREATE TABLE `last_logins` (
  `id` int(11) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `user_id` varchar(200) DEFAULT NULL,
  `user_type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0- undefined(rare case), 1- user 2- admin',
  `ip_address` varchar(100) DEFAULT NULL,
  `when_last_login` datetime DEFAULT NULL,
  `system_name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `last_logins_old`
--

CREATE TABLE `last_logins_old` (
  `id` int(11) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `user_id` varchar(200) DEFAULT NULL,
  `ip_address` varchar(100) DEFAULT NULL,
  `when_last_login` datetime DEFAULT NULL,
  `system_name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `loans_tbl`
--

CREATE TABLE `loans_tbl` (
  `id` int(11) NOT NULL,
  `unique_id` varchar(255) DEFAULT NULL,
  `client_phone` varchar(100) DEFAULT NULL,
  `loan_amount` varchar(100) DEFAULT NULL,
  `interest_rate` varchar(100) DEFAULT NULL,
  `tenure_days` varchar(100) DEFAULT NULL,
  `loan_status` tinyint(1) DEFAULT '0' COMMENT '0-not approved, 1 - running, 2 - completed',
  `date_applied` datetime DEFAULT NULL,
  `date_approved` datetime DEFAULT NULL,
  `channel` varchar(255) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `loans_tbl`
--

INSERT INTO `loans_tbl` (`id`, `unique_id`, `client_phone`, `loan_amount`, `interest_rate`, `tenure_days`, `loan_status`, `date_applied`, `date_approved`, `channel`, `created_at`, `updated_at`) VALUES
(31, 'loans_0dd200f6c6449fd4fc5c326551f622a2', '08033008963', '30', '20', '5', 1, '2020-07-21 18:20:10', '2020-07-21 21:52:03', '1', NULL, '2020-07-21 20:52:03'),
(36, 'loans_bf53e8b06a0fa868cafd12c1ee57dd2b', '08027256586', '30', '20', '5', 1, '2020-07-23 22:09:00', '2020-07-23 22:10:06', '1', NULL, '2020-07-23 21:10:06'),
(10, 'loans_11c1bdf03bfbdba165c62c47169628ba', '08037228850', '30', '20', '5', 2, '2020-06-25 21:03:12', '2020-07-04 20:09:04', '1', NULL, '2020-07-04 19:14:18'),
(35, 'loans_1856107bd3f1979fd3b57efbc8b44463', '08179044394', '30', '20', '5', 1, '2020-07-23 19:01:29', '2020-07-23 19:03:05', '1', NULL, '2020-07-23 18:03:05'),
(34, 'loans_76feee13c97be36b1f9a65609cccc0b5', '08084051636', '30', '20', '5', 1, '2020-07-23 12:19:28', '2020-07-23 13:26:04', '1', NULL, '2020-07-23 12:26:04'),
(42, 'loans_bb5507b15eabaa53b38d0df59c05dfa8', '08168509044', '30', '20', '5', 1, '2020-08-14 17:55:58', '2020-08-14 17:57:03', '1', NULL, '2020-08-14 16:57:03'),
(29, 'loans_9f3d6a256caa31fc95c2f5ef5ce4e9e8', '08137512747', '30', '20', '5', 1, '2020-07-20 15:37:25', '2020-07-20 15:57:04', '1', NULL, '2020-07-20 14:57:04'),
(37, 'loans_b95cbb0ba53f7515b24297e75adcc53e', '08099120707', '30', '20', '5', 1, '2020-07-24 10:17:55', '2020-07-24 10:19:11', '1', NULL, '2020-07-24 09:19:11'),
(38, 'loans_541c759a6a5135e974730d84677d8f5a', '07081605493', '30', '20', '5', 1, '2020-07-26 11:23:53', '2020-07-26 11:25:05', '1', NULL, '2020-07-26 10:25:05'),
(39, 'loans_e734e55ccda4d1a08a861220458b99b9', '07039887142', '30', '20', '5', 1, '2020-07-27 22:01:09', '2020-07-27 22:03:05', '1', NULL, '2020-07-27 21:03:05'),
(40, 'loans_d6a78512862073cb7a4e9a7116f72b96', '08037228850', '30', '20', '5', 2, '2020-07-28 12:31:48', '2020-07-28 12:35:04', '1', NULL, '2020-07-28 11:41:37'),
(41, 'loans_5c4b13ecafb6634ee3da2b64f952fda4', '08156183373', '30', '20', '5', 1, '2020-07-28 14:44:23', '2020-07-28 14:46:03', '1', NULL, '2020-07-28 13:46:03');

-- --------------------------------------------------------

--
-- Table structure for table `maker_checker`
--

CREATE TABLE `maker_checker` (
  `id` int(11) NOT NULL,
  `mk_id` varchar(255) DEFAULT NULL,
  `action` tinyint(3) DEFAULT NULL COMMENT 'for each action, know which table to write permanetly',
  `table_to_act_on` varchar(255) DEFAULT NULL COMMENT 'table in chich the action will be performed',
  `data` text,
  `who_initated_admin_id` varchar(255) DEFAULT NULL,
  `done` tinyint(1) DEFAULT NULL COMMENT '1 for done',
  `second_level_admin_id` varchar(255) DEFAULT NULL,
  `other_level_admin_id` varchar(255) DEFAULT NULL,
  `when_initiated` timestamp NULL DEFAULT NULL,
  `when_approved` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `otp`
--

CREATE TABLE `otp` (
  `id` int(11) NOT NULL,
  `unique_id` varchar(255) DEFAULT NULL,
  `phone` varchar(200) DEFAULT NULL,
  `code` int(7) DEFAULT NULL,
  `date_sent` datetime DEFAULT NULL,
  `expiry_date` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `otp`
--

INSERT INTO `otp` (`id`, `unique_id`, `phone`, `code`, `date_sent`, `expiry_date`) VALUES
(221, 'ad1dfb12da35909cfb343a34f1679d8c', '08168509044', 71694, '2020-08-14 17:55:40', '2020-08-14 18:25:40'),
(35, '6b25e30197dd3d7c6dff6ebaaf409856', '09022889911', 38640, '2020-05-26 09:22:50', '2020-05-26 09:52:50'),
(189, '9a6ac693a08eef7ed1799a1bde6cc915', '08052257405', 75708, '2020-07-21 14:45:33', '2020-07-21 15:15:33'),
(51, 'df64e61cc9010cec0e3f73ecf07ef357', '08154955575', 71078, '2020-06-19 11:13:11', '2020-06-19 11:43:11'),
(50, '7044647c4c4edfb9cd84ac2df0d320d7', '08154955574', 67183, '2020-06-19 11:11:31', '2020-06-19 11:41:31'),
(216, 'b75c68b5f927da012a9ad27bf2bd2735', '08037228850', 22192, '2020-07-28 12:30:55', '2020-07-28 13:00:55'),
(213, '3c9c678c25bab9a03ea2bf5d98bb30e2', '07081605493', 74288, '2020-07-26 11:22:53', '2020-07-26 11:52:53'),
(203, '4e3fdfaff37ff0e48d8b9933565d347e', '08136022884', 71247, '2020-07-22 21:47:49', '2020-07-22 22:17:49'),
(107, '7f286a23328b266f63a2b4fbf69a6102', '08138152101', 83993, '2020-06-26 20:17:39', '2020-06-26 20:47:39'),
(108, '2f85174a98b38ed4b2719f7cb8f85a4b', '08023154429', 34105, '2020-06-26 23:44:44', '2020-06-27 00:14:44'),
(218, '50104cd37b1d4b039b13f72f6ca5d369', '08156183373', 52896, '2020-07-28 14:43:57', '2020-07-28 15:13:57'),
(151, '7f5875b165270fc538f8671459e26591', '08103021782', 70018, '2020-07-09 21:26:11', '2020-07-09 21:56:11'),
(145, '6b3605d36afc85f52241336b7e278492', '07087335778', 53147, '2020-07-02 15:13:57', '2020-07-02 15:43:57'),
(208, '1fa2218a8b20ebe7b93844f88eddec3c', '08179044394', 62091, '2020-07-23 19:00:40', '2020-07-23 19:30:40'),
(134, 'd3ada26dc28b80f792ffd4dacb9c0f7d', '08033298534', 38493, '2020-07-01 11:35:21', '2020-07-01 12:05:21'),
(210, '9a6589a1bc3715f579620176c03be0f9', '08099120707', 70445, '2020-07-24 10:14:56', '2020-07-24 10:44:56'),
(132, 'b41c6dfbb6ea603670633f7548803ae2', '07746302442', 61313, '2020-07-01 10:25:05', '2020-07-01 10:55:05'),
(133, '34dbddfcd1c6e5b2612622a3c5ae01d6', '07057114195', 58011, '2020-07-01 11:35:07', '2020-07-01 12:05:07'),
(141, 'b1fc8f565f4a867ee7ff3582a3854e8b', '07039833163', 40695, '2020-07-01 21:57:19', '2020-07-01 22:27:19'),
(220, '9a37d899eac9e16f79e082fb25e0be0a', '08033127287', 30922, '2020-08-12 20:44:53', '2020-08-12 21:14:53'),
(204, '6279a7f41c5ece53e0ee115eb05dd01f', '08084051636', 53032, '2020-07-23 12:19:13', '2020-07-23 12:49:13'),
(196, '7e68eac8ec197fb8d603f32f897b8c37', '08033008963', 68895, '2020-07-21 18:19:55', '2020-07-21 18:49:55'),
(164, 'a9c17183ef567bb429738b7f28cc00ca', '08168509045', 77616, '2020-07-20 08:53:19', '2020-07-20 09:23:19'),
(178, '12911fc68d9ae9e4a31c30c2bf8f8892', '08137512747', 85665, '2020-07-20 15:36:34', '2020-07-20 16:06:34'),
(207, '79c5b96bea55af0e7d6319522846098a', '08027256586', 88481, '2020-07-23 18:07:23', '2020-07-23 18:37:23'),
(215, 'b221cecab6c74d371463ef818d6b118f', '07039887142', 71712, '2020-07-27 22:00:43', '2020-07-27 22:30:43'),
(224, '349bec80bb34f3bd91fa3198ac22ea98', '08032122345', 22098, '2021-03-16 14:45:04', '2021-03-16 15:15:04');

-- --------------------------------------------------------

--
-- Table structure for table `password_log`
--

CREATE TABLE `password_log` (
  `id` int(11) NOT NULL,
  `user_id` varchar(255) DEFAULT NULL,
  `user_type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0- undefined(rare case), 1- user 2- admin',
  `when_updated_last` datetime DEFAULT NULL,
  `expiry_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `permi`
--

CREATE TABLE `permi` (
  `id` int(11) NOT NULL,
  `permi_id` varchar(255) DEFAULT NULL,
  `the_permi` mediumtext,
  `admin_id` varchar(255) DEFAULT NULL,
  `when_added` timestamp NULL DEFAULT NULL,
  `who_added` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `repayments`
--

CREATE TABLE `repayments` (
  `id` int(11) NOT NULL,
  `unique_id` varchar(255) DEFAULT NULL,
  `loan_id` varchar(255) DEFAULT NULL,
  `client_phone` varchar(100) DEFAULT NULL,
  `rep_amount` varchar(100) DEFAULT NULL,
  `rep_status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0-pending 1- confirmed',
  `rep_date` date DEFAULT NULL,
  `date_sent` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `repayments`
--

INSERT INTO `repayments` (`id`, `unique_id`, `loan_id`, `client_phone`, `rep_amount`, `rep_status`, `rep_date`, `date_sent`) VALUES
(10, '513567fc5cd952aea46885b152ac5f10', 'loans_bf53e8b06a0fa868cafd12c1ee57dd2b', '08027256586', '36', 0, '2029-07-20', '2020-07-29 15:55:59'),
(9, '0cf19ad629d5ef37bf1fbdc4b99afa9c', 'loans_d6a78512862073cb7a4e9a7116f72b96', '08037228850', '36', 1, '2020-07-28', '2020-07-28 12:41:37'),
(5, 'f1cb2eae5c70d6111ef7268a24efb8f0', 'loans_fe914fecd3f04715b7810b69f8244b61', '08137512747', '12', 1, '2020-05-20', '2020-05-20 18:09:10'),
(8, '6a36fbcd05198c83e74210418b40ecdb', 'loans_11c1bdf03bfbdba165c62c47169628ba', '08037228850', '36', 1, '2020-07-04', '2020-07-04 20:14:18');

-- --------------------------------------------------------

--
-- Table structure for table `repay_log`
--

CREATE TABLE `repay_log` (
  `id` int(11) NOT NULL,
  `repay_id` varchar(255) DEFAULT NULL,
  `diss_id` varchar(255) DEFAULT NULL,
  `amount` int(11) DEFAULT NULL,
  `client_id` varchar(255) DEFAULT NULL,
  `channel_repay` char(8) DEFAULT NULL COMMENT 'abbreviation of repayment channel',
  `when_repayed` timestamp NULL DEFAULT NULL,
  `amnt_remain` int(11) DEFAULT NULL,
  `who_repaid` varchar(255) DEFAULT NULL,
  `repaid` tinyint(1) DEFAULT NULL COMMENT '1 for yes 2 for partial, 0 for no',
  `expected_repay` int(11) DEFAULT NULL,
  `expected_repay_date` timestamp NULL DEFAULT '0000-00-00 00:00:00',
  `classified_default_before_paid` tinyint(1) DEFAULT NULL COMMENT '1 for default'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `request_flag_pend`
--

CREATE TABLE `request_flag_pend` (
  `id` int(11) NOT NULL,
  `diss_id` varchar(255) DEFAULT NULL,
  `amount` int(11) DEFAULT NULL,
  `client_id` varchar(255) DEFAULT NULL,
  `channel_dis` char(8) DEFAULT NULL COMMENT 'abbrivation of disburse channel',
  `when_requested` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `telegram_webhook_tbl`
--

CREATE TABLE `telegram_webhook_tbl` (
  `id` bigint(255) NOT NULL,
  `chat_json` text,
  `date_received` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `telegram_webhook_tbl`
--

INSERT INTO `telegram_webhook_tbl` (`id`, `chat_json`, `date_received`) VALUES
(1, '{\"update_id\":957589400,\n\"message\":{\"message_id\":319,\"from\":{\"id\":1135428624,\"is_bot\":false,\"first_name\":\"Samuel\",\"last_name\":\"Adebunmi\",\"language_code\":\"en\"},\"chat\":{\"id\":1135428624,\"first_name\":\"Samuel\",\"last_name\":\"Adebunmi\",\"type\":\"private\"},\"date\":1615887394,\"text\":\"hello\"}}', NULL),
(2, '{\"update_id\":957589401,\n\"message\":{\"message_id\":321,\"from\":{\"id\":1135428624,\"is_bot\":false,\"first_name\":\"Samuel\",\"last_name\":\"Adebunmi\",\"language_code\":\"en\"},\"chat\":{\"id\":1135428624,\"first_name\":\"Samuel\",\"last_name\":\"Adebunmi\",\"type\":\"private\"},\"date\":1615887399,\"text\":\"1\"}}', NULL),
(3, '{\"update_id\":957589402,\n\"message\":{\"message_id\":323,\"from\":{\"id\":1135428624,\"is_bot\":false,\"first_name\":\"Samuel\",\"last_name\":\"Adebunmi\",\"language_code\":\"en\"},\"chat\":{\"id\":1135428624,\"first_name\":\"Samuel\",\"last_name\":\"Adebunmi\",\"type\":\"private\"},\"date\":1615887404,\"text\":\"09033228822\",\"entities\":[{\"offset\":0,\"length\":11,\"type\":\"phone_number\"}]}}', NULL),
(4, '{\"update_id\":957589403,\n\"message\":{\"message_id\":325,\"from\":{\"id\":1135428624,\"is_bot\":false,\"first_name\":\"Samuel\",\"last_name\":\"Adebunmi\",\"language_code\":\"en\"},\"chat\":{\"id\":1135428624,\"first_name\":\"Samuel\",\"last_name\":\"Adebunmi\",\"type\":\"private\"},\"date\":1615887532,\"text\":\"hello\"}}', NULL),
(5, '{\"update_id\":957589404,\n\"message\":{\"message_id\":327,\"from\":{\"id\":1135428624,\"is_bot\":false,\"first_name\":\"Samuel\",\"last_name\":\"Adebunmi\",\"language_code\":\"en\"},\"chat\":{\"id\":1135428624,\"first_name\":\"Samuel\",\"last_name\":\"Adebunmi\",\"type\":\"private\"},\"date\":1615887578,\"text\":\"1\"}}', NULL),
(6, '{\"update_id\":957589405,\n\"message\":{\"message_id\":329,\"from\":{\"id\":1135428624,\"is_bot\":false,\"first_name\":\"Samuel\",\"last_name\":\"Adebunmi\",\"language_code\":\"en\"},\"chat\":{\"id\":1135428624,\"first_name\":\"Samuel\",\"last_name\":\"Adebunmi\",\"type\":\"private\"},\"date\":1615887589,\"text\":\"08033882200\",\"entities\":[{\"offset\":0,\"length\":11,\"type\":\"phone_number\"}]}}', NULL),
(7, '{\"update_id\":957589406,\n\"message\":{\"message_id\":330,\"from\":{\"id\":1135428624,\"is_bot\":false,\"first_name\":\"Samuel\",\"last_name\":\"Adebunmi\",\"language_code\":\"en\"},\"chat\":{\"id\":1135428624,\"first_name\":\"Samuel\",\"last_name\":\"Adebunmi\",\"type\":\"private\"},\"date\":1615887732,\"text\":\"hello\"}}', NULL),
(8, '{\"update_id\":957589407,\n\"message\":{\"message_id\":332,\"from\":{\"id\":1135428624,\"is_bot\":false,\"first_name\":\"Samuel\",\"last_name\":\"Adebunmi\",\"language_code\":\"en\"},\"chat\":{\"id\":1135428624,\"first_name\":\"Samuel\",\"last_name\":\"Adebunmi\",\"type\":\"private\"},\"date\":1615887735,\"text\":\"1\"}}', NULL),
(9, '{\"update_id\":957589408,\n\"message\":{\"message_id\":334,\"from\":{\"id\":1135428624,\"is_bot\":false,\"first_name\":\"Samuel\",\"last_name\":\"Adebunmi\",\"language_code\":\"en\"},\"chat\":{\"id\":1135428624,\"first_name\":\"Samuel\",\"last_name\":\"Adebunmi\",\"type\":\"private\"},\"date\":1615887742,\"text\":\"090338822990\"}}', NULL),
(10, '{\"update_id\":957589409,\n\"message\":{\"message_id\":335,\"from\":{\"id\":1135428624,\"is_bot\":false,\"first_name\":\"Samuel\",\"last_name\":\"Adebunmi\",\"language_code\":\"en\"},\"chat\":{\"id\":1135428624,\"first_name\":\"Samuel\",\"last_name\":\"Adebunmi\",\"type\":\"private\"},\"date\":1615887977,\"text\":\"09033449900\",\"entities\":[{\"offset\":0,\"length\":11,\"type\":\"phone_number\"}]}}', NULL),
(11, '{\"update_id\":957589410,\n\"message\":{\"message_id\":336,\"from\":{\"id\":1135428624,\"is_bot\":false,\"first_name\":\"Samuel\",\"last_name\":\"Adebunmi\",\"language_code\":\"en\"},\"chat\":{\"id\":1135428624,\"first_name\":\"Samuel\",\"last_name\":\"Adebunmi\",\"type\":\"private\"},\"date\":1615887987,\"text\":\"08168509044\",\"entities\":[{\"offset\":0,\"length\":11,\"type\":\"phone_number\"}]}}', NULL),
(12, '{\"update_id\":957589411,\n\"message\":{\"message_id\":338,\"from\":{\"id\":1135428624,\"is_bot\":false,\"first_name\":\"Samuel\",\"last_name\":\"Adebunmi\",\"language_code\":\"en\"},\"chat\":{\"id\":1135428624,\"first_name\":\"Samuel\",\"last_name\":\"Adebunmi\",\"type\":\"private\"},\"date\":1615888144,\"text\":\"hello\"}}', NULL),
(13, '{\"update_id\":957589412,\n\"message\":{\"message_id\":340,\"from\":{\"id\":1135428624,\"is_bot\":false,\"first_name\":\"Samuel\",\"last_name\":\"Adebunmi\",\"language_code\":\"en\"},\"chat\":{\"id\":1135428624,\"first_name\":\"Samuel\",\"last_name\":\"Adebunmi\",\"type\":\"private\"},\"date\":1615888155,\"text\":\"1\"}}', NULL),
(14, '{\"update_id\":957589413,\n\"message\":{\"message_id\":342,\"from\":{\"id\":1135428624,\"is_bot\":false,\"first_name\":\"Samuel\",\"last_name\":\"Adebunmi\",\"language_code\":\"en\"},\"chat\":{\"id\":1135428624,\"first_name\":\"Samuel\",\"last_name\":\"Adebunmi\",\"type\":\"private\"},\"date\":1615888162,\"text\":\"090332244887\"}}', NULL),
(15, '{\"update_id\":957589414,\n\"message\":{\"message_id\":343,\"from\":{\"id\":1135428624,\"is_bot\":false,\"first_name\":\"Samuel\",\"last_name\":\"Adebunmi\",\"language_code\":\"en\"},\"chat\":{\"id\":1135428624,\"first_name\":\"Samuel\",\"last_name\":\"Adebunmi\",\"type\":\"private\"},\"date\":1615888231,\"text\":\"hello\"}}', NULL),
(16, '{\"update_id\":957589415,\n\"message\":{\"message_id\":345,\"from\":{\"id\":1135428624,\"is_bot\":false,\"first_name\":\"Samuel\",\"last_name\":\"Adebunmi\",\"language_code\":\"en\"},\"chat\":{\"id\":1135428624,\"first_name\":\"Samuel\",\"last_name\":\"Adebunmi\",\"type\":\"private\"},\"date\":1615888233,\"text\":\"1\"}}', NULL),
(17, '{\"update_id\":957589416,\n\"message\":{\"message_id\":347,\"from\":{\"id\":1135428624,\"is_bot\":false,\"first_name\":\"Samuel\",\"last_name\":\"Adebunmi\",\"language_code\":\"en\"},\"chat\":{\"id\":1135428624,\"first_name\":\"Samuel\",\"last_name\":\"Adebunmi\",\"type\":\"private\"},\"date\":1615888239,\"text\":\"090338899330\"}}', NULL),
(18, '{\"update_id\":957589417,\n\"message\":{\"message_id\":349,\"from\":{\"id\":1135428624,\"is_bot\":false,\"first_name\":\"Samuel\",\"last_name\":\"Adebunmi\",\"language_code\":\"en\"},\"chat\":{\"id\":1135428624,\"first_name\":\"Samuel\",\"last_name\":\"Adebunmi\",\"type\":\"private\"},\"date\":1615888376,\"text\":\"hello\"}}', NULL),
(19, '{\"update_id\":957589418,\n\"message\":{\"message_id\":351,\"from\":{\"id\":1135428624,\"is_bot\":false,\"first_name\":\"Samuel\",\"last_name\":\"Adebunmi\",\"language_code\":\"en\"},\"chat\":{\"id\":1135428624,\"first_name\":\"Samuel\",\"last_name\":\"Adebunmi\",\"type\":\"private\"},\"date\":1615888379,\"text\":\"1\"}}', NULL),
(20, '{\"update_id\":957589419,\n\"message\":{\"message_id\":353,\"from\":{\"id\":1135428624,\"is_bot\":false,\"first_name\":\"Samuel\",\"last_name\":\"Adebunmi\",\"language_code\":\"en\"},\"chat\":{\"id\":1135428624,\"first_name\":\"Samuel\",\"last_name\":\"Adebunmi\",\"type\":\"private\"},\"date\":1615888384,\"text\":\"090348933884\"}}', NULL),
(21, '{\"update_id\":957589420,\n\"message\":{\"message_id\":355,\"from\":{\"id\":1135428624,\"is_bot\":false,\"first_name\":\"Samuel\",\"last_name\":\"Adebunmi\",\"language_code\":\"en\"},\"chat\":{\"id\":1135428624,\"first_name\":\"Samuel\",\"last_name\":\"Adebunmi\",\"type\":\"private\"},\"date\":1615888446,\"text\":\"hello\"}}', NULL),
(22, '{\"update_id\":957589421,\n\"message\":{\"message_id\":357,\"from\":{\"id\":1135428624,\"is_bot\":false,\"first_name\":\"Samuel\",\"last_name\":\"Adebunmi\",\"language_code\":\"en\"},\"chat\":{\"id\":1135428624,\"first_name\":\"Samuel\",\"last_name\":\"Adebunmi\",\"type\":\"private\"},\"date\":1615888449,\"text\":\"1\"}}', NULL),
(23, '{\"update_id\":957589422,\n\"message\":{\"message_id\":359,\"from\":{\"id\":1135428624,\"is_bot\":false,\"first_name\":\"Samuel\",\"last_name\":\"Adebunmi\",\"language_code\":\"en\"},\"chat\":{\"id\":1135428624,\"first_name\":\"Samuel\",\"last_name\":\"Adebunmi\",\"type\":\"private\"},\"date\":1615888456,\"text\":\"090338290120\"}}', NULL),
(24, '{\"update_id\":957589423,\n\"message\":{\"message_id\":361,\"from\":{\"id\":1135428624,\"is_bot\":false,\"first_name\":\"Samuel\",\"last_name\":\"Adebunmi\",\"language_code\":\"en\"},\"chat\":{\"id\":1135428624,\"first_name\":\"Samuel\",\"last_name\":\"Adebunmi\",\"type\":\"private\"},\"date\":1615888646,\"text\":\"hello\"}}', NULL),
(25, '{\"update_id\":957589424,\n\"message\":{\"message_id\":363,\"from\":{\"id\":1135428624,\"is_bot\":false,\"first_name\":\"Samuel\",\"last_name\":\"Adebunmi\",\"language_code\":\"en\"},\"chat\":{\"id\":1135428624,\"first_name\":\"Samuel\",\"last_name\":\"Adebunmi\",\"type\":\"private\"},\"date\":1615888649,\"text\":\"1\"}}', NULL),
(26, '{\"update_id\":957589425,\n\"message\":{\"message_id\":365,\"from\":{\"id\":1135428624,\"is_bot\":false,\"first_name\":\"Samuel\",\"last_name\":\"Adebunmi\",\"language_code\":\"en\"},\"chat\":{\"id\":1135428624,\"first_name\":\"Samuel\",\"last_name\":\"Adebunmi\",\"type\":\"private\"},\"date\":1615888654,\"text\":\"0349908093453945\"}}', NULL),
(27, '{\"update_id\":957589426,\n\"message\":{\"message_id\":367,\"from\":{\"id\":1135428624,\"is_bot\":false,\"first_name\":\"Samuel\",\"last_name\":\"Adebunmi\",\"language_code\":\"en\"},\"chat\":{\"id\":1135428624,\"first_name\":\"Samuel\",\"last_name\":\"Adebunmi\",\"type\":\"private\"},\"date\":1615888686,\"text\":\"hello\"}}', NULL),
(28, '{\"update_id\":957589427,\n\"message\":{\"message_id\":369,\"from\":{\"id\":1135428624,\"is_bot\":false,\"first_name\":\"Samuel\",\"last_name\":\"Adebunmi\",\"language_code\":\"en\"},\"chat\":{\"id\":1135428624,\"first_name\":\"Samuel\",\"last_name\":\"Adebunmi\",\"type\":\"private\"},\"date\":1615888691,\"text\":\"1\"}}', NULL),
(29, '{\"update_id\":957589428,\n\"message\":{\"message_id\":371,\"from\":{\"id\":1135428624,\"is_bot\":false,\"first_name\":\"Samuel\",\"last_name\":\"Adebunmi\",\"language_code\":\"en\"},\"chat\":{\"id\":1135428624,\"first_name\":\"Samuel\",\"last_name\":\"Adebunmi\",\"type\":\"private\"},\"date\":1615888697,\"text\":\"090338899002\"}}', NULL),
(30, '{\"update_id\":957589429,\n\"message\":{\"message_id\":373,\"from\":{\"id\":1135428624,\"is_bot\":false,\"first_name\":\"Samuel\",\"last_name\":\"Adebunmi\",\"language_code\":\"en\"},\"chat\":{\"id\":1135428624,\"first_name\":\"Samuel\",\"last_name\":\"Adebunmi\",\"type\":\"private\"},\"date\":1615888726,\"text\":\"hello\"}}', NULL),
(31, '{\"update_id\":957589430,\n\"message\":{\"message_id\":375,\"from\":{\"id\":1135428624,\"is_bot\":false,\"first_name\":\"Samuel\",\"last_name\":\"Adebunmi\",\"language_code\":\"en\"},\"chat\":{\"id\":1135428624,\"first_name\":\"Samuel\",\"last_name\":\"Adebunmi\",\"type\":\"private\"},\"date\":1615888737,\"text\":\"1\"}}', NULL),
(32, '{\"update_id\":957589431,\n\"message\":{\"message_id\":377,\"from\":{\"id\":1135428624,\"is_bot\":false,\"first_name\":\"Samuel\",\"last_name\":\"Adebunmi\",\"language_code\":\"en\"},\"chat\":{\"id\":1135428624,\"first_name\":\"Samuel\",\"last_name\":\"Adebunmi\",\"type\":\"private\"},\"date\":1615888744,\"text\":\"09033882299000\"}}', NULL),
(33, '{\"update_id\":957589432,\n\"message\":{\"message_id\":379,\"from\":{\"id\":1135428624,\"is_bot\":false,\"first_name\":\"Samuel\",\"last_name\":\"Adebunmi\",\"language_code\":\"en\"},\"chat\":{\"id\":1135428624,\"first_name\":\"Samuel\",\"last_name\":\"Adebunmi\",\"type\":\"private\"},\"date\":1615888815,\"text\":\"hello\"}}', NULL),
(34, '{\"update_id\":957589433,\n\"message\":{\"message_id\":381,\"from\":{\"id\":1135428624,\"is_bot\":false,\"first_name\":\"Samuel\",\"last_name\":\"Adebunmi\",\"language_code\":\"en\"},\"chat\":{\"id\":1135428624,\"first_name\":\"Samuel\",\"last_name\":\"Adebunmi\",\"type\":\"private\"},\"date\":1615888817,\"text\":\"1\"}}', NULL),
(35, '{\"update_id\":957589434,\n\"message\":{\"message_id\":383,\"from\":{\"id\":1135428624,\"is_bot\":false,\"first_name\":\"Samuel\",\"last_name\":\"Adebunmi\",\"language_code\":\"en\"},\"chat\":{\"id\":1135428624,\"first_name\":\"Samuel\",\"last_name\":\"Adebunmi\",\"type\":\"private\"},\"date\":1615888823,\"text\":\"090338820011\"}}', NULL),
(36, '{\"update_id\":957589435,\n\"message\":{\"message_id\":385,\"from\":{\"id\":1135428624,\"is_bot\":false,\"first_name\":\"Samuel\",\"last_name\":\"Adebunmi\",\"language_code\":\"en\"},\"chat\":{\"id\":1135428624,\"first_name\":\"Samuel\",\"last_name\":\"Adebunmi\",\"type\":\"private\"},\"date\":1615888828,\"text\":\"08168509044\",\"entities\":[{\"offset\":0,\"length\":11,\"type\":\"phone_number\"}]}}', NULL),
(37, '{\"update_id\":957589436,\n\"message\":{\"message_id\":387,\"from\":{\"id\":1135428624,\"is_bot\":false,\"first_name\":\"Samuel\",\"last_name\":\"Adebunmi\",\"language_code\":\"en\"},\"chat\":{\"id\":1135428624,\"first_name\":\"Samuel\",\"last_name\":\"Adebunmi\",\"type\":\"private\"},\"date\":1615888852,\"text\":\"08178229900\",\"entities\":[{\"offset\":0,\"length\":11,\"type\":\"phone_number\"}]}}', NULL),
(38, '{\"update_id\":957589437,\n\"message\":{\"message_id\":389,\"from\":{\"id\":1135428624,\"is_bot\":false,\"first_name\":\"Samuel\",\"last_name\":\"Adebunmi\",\"language_code\":\"en\"},\"chat\":{\"id\":1135428624,\"first_name\":\"Samuel\",\"last_name\":\"Adebunmi\",\"type\":\"private\"},\"date\":1615888860,\"text\":\"0902211990022\"}}', NULL),
(39, '{\"update_id\":957589438,\n\"message\":{\"message_id\":391,\"from\":{\"id\":1135428624,\"is_bot\":false,\"first_name\":\"Samuel\",\"last_name\":\"Adebunmi\",\"language_code\":\"en\"},\"chat\":{\"id\":1135428624,\"first_name\":\"Samuel\",\"last_name\":\"Adebunmi\",\"type\":\"private\"},\"date\":1615888874,\"text\":\"hello\"}}', NULL),
(40, '{\"update_id\":957589439,\n\"message\":{\"message_id\":393,\"from\":{\"id\":1135428624,\"is_bot\":false,\"first_name\":\"Samuel\",\"last_name\":\"Adebunmi\",\"language_code\":\"en\"},\"chat\":{\"id\":1135428624,\"first_name\":\"Samuel\",\"last_name\":\"Adebunmi\",\"type\":\"private\"},\"date\":1615890314,\"text\":\"1\"}}', NULL),
(41, '{\"update_id\":957589440,\n\"message\":{\"message_id\":395,\"from\":{\"id\":1135428624,\"is_bot\":false,\"first_name\":\"Samuel\",\"last_name\":\"Adebunmi\",\"language_code\":\"en\"},\"chat\":{\"id\":1135428624,\"first_name\":\"Samuel\",\"last_name\":\"Adebunmi\",\"type\":\"private\"},\"date\":1615890709,\"text\":\"08032122345\",\"entities\":[{\"offset\":0,\"length\":11,\"type\":\"phone_number\"}]}}', NULL),
(42, '{\"update_id\":957589441,\n\"message\":{\"message_id\":397,\"from\":{\"id\":1135428624,\"is_bot\":false,\"first_name\":\"Samuel\",\"last_name\":\"Adebunmi\",\"language_code\":\"en\"},\"chat\":{\"id\":1135428624,\"first_name\":\"Samuel\",\"last_name\":\"Adebunmi\",\"type\":\"private\"},\"date\":1615890958,\"text\":\"22225552299\"}}', NULL),
(43, '{\"update_id\":957589442,\n\"message\":{\"message_id\":399,\"from\":{\"id\":1135428624,\"is_bot\":false,\"first_name\":\"Samuel\",\"last_name\":\"Adebunmi\",\"language_code\":\"en\"},\"chat\":{\"id\":1135428624,\"first_name\":\"Samuel\",\"last_name\":\"Adebunmi\",\"type\":\"private\"},\"date\":1615890992,\"text\":\"22190139298\"}}', NULL),
(44, '{\"update_id\":957589443,\n\"message\":{\"message_id\":401,\"from\":{\"id\":1135428624,\"is_bot\":false,\"first_name\":\"Samuel\",\"last_name\":\"Adebunmi\",\"language_code\":\"en\"},\"chat\":{\"id\":1135428624,\"first_name\":\"Samuel\",\"last_name\":\"Adebunmi\",\"type\":\"private\"},\"date\":1615891156,\"text\":\"sdfjkf.com\",\"entities\":[{\"offset\":0,\"length\":10,\"type\":\"url\"}]}}', NULL),
(45, '{\"update_id\":957589444,\n\"message\":{\"message_id\":403,\"from\":{\"id\":1135428624,\"is_bot\":false,\"first_name\":\"Samuel\",\"last_name\":\"Adebunmi\",\"language_code\":\"en\"},\"chat\":{\"id\":1135428624,\"first_name\":\"Samuel\",\"last_name\":\"Adebunmi\",\"type\":\"private\"},\"date\":1615891160,\"text\":\"sdfsdfsdfs\"}}', NULL),
(46, '{\"update_id\":957589445,\n\"message\":{\"message_id\":405,\"from\":{\"id\":1135428624,\"is_bot\":false,\"first_name\":\"Samuel\",\"last_name\":\"Adebunmi\",\"language_code\":\"en\"},\"chat\":{\"id\":1135428624,\"first_name\":\"Samuel\",\"last_name\":\"Adebunmi\",\"type\":\"private\"},\"date\":1615891169,\"text\":\"samtest@test.com\",\"entities\":[{\"offset\":0,\"length\":16,\"type\":\"email\"}]}}', NULL),
(47, '{\"update_id\":957589446,\n\"message\":{\"message_id\":407,\"from\":{\"id\":1135428624,\"is_bot\":false,\"first_name\":\"Samuel\",\"last_name\":\"Adebunmi\",\"language_code\":\"en\"},\"chat\":{\"id\":1135428624,\"first_name\":\"Samuel\",\"last_name\":\"Adebunmi\",\"type\":\"private\"},\"date\":1615891186,\"text\":\"samtest@gmail.com\",\"entities\":[{\"offset\":0,\"length\":17,\"type\":\"email\"}]}}', NULL),
(48, '{\"update_id\":957589447,\n\"message\":{\"message_id\":409,\"from\":{\"id\":1135428624,\"is_bot\":false,\"first_name\":\"Samuel\",\"last_name\":\"Adebunmi\",\"language_code\":\"en\"},\"chat\":{\"id\":1135428624,\"first_name\":\"Samuel\",\"last_name\":\"Adebunmi\",\"type\":\"private\"},\"date\":1615891235,\"text\":\"samtest@gmail.com\",\"entities\":[{\"offset\":0,\"length\":17,\"type\":\"email\"}]}}', NULL),
(49, '{\"update_id\":957589448,\n\"message\":{\"message_id\":411,\"from\":{\"id\":1135428624,\"is_bot\":false,\"first_name\":\"Samuel\",\"last_name\":\"Adebunmi\",\"language_code\":\"en\"},\"chat\":{\"id\":1135428624,\"first_name\":\"Samuel\",\"last_name\":\"Adebunmi\",\"type\":\"private\"},\"date\":1615891323,\"text\":\"sammy@gmail.com\",\"entities\":[{\"offset\":0,\"length\":15,\"type\":\"email\"}]}}', NULL),
(50, '{\"update_id\":957589449,\n\"message\":{\"message_id\":413,\"from\":{\"id\":1135428624,\"is_bot\":false,\"first_name\":\"Samuel\",\"last_name\":\"Adebunmi\",\"language_code\":\"en\"},\"chat\":{\"id\":1135428624,\"first_name\":\"Samuel\",\"last_name\":\"Adebunmi\",\"type\":\"private\"},\"date\":1615891740,\"text\":\"hello\"}}', NULL),
(51, '{\"update_id\":957589450,\n\"message\":{\"message_id\":415,\"from\":{\"id\":1135428624,\"is_bot\":false,\"first_name\":\"Samuel\",\"last_name\":\"Adebunmi\",\"language_code\":\"en\"},\"chat\":{\"id\":1135428624,\"first_name\":\"Samuel\",\"last_name\":\"Adebunmi\",\"type\":\"private\"},\"date\":1615891743,\"text\":\"1\"}}', NULL),
(52, '{\"update_id\":957589451,\n\"message\":{\"message_id\":417,\"from\":{\"id\":1135428624,\"is_bot\":false,\"first_name\":\"Samuel\",\"last_name\":\"Adebunmi\",\"language_code\":\"en\"},\"chat\":{\"id\":1135428624,\"first_name\":\"Samuel\",\"last_name\":\"Adebunmi\",\"type\":\"private\"},\"date\":1615891754,\"text\":\"08032122345\",\"entities\":[{\"offset\":0,\"length\":11,\"type\":\"phone_number\"}]}}', NULL),
(53, '{\"update_id\":957589452,\n\"message\":{\"message_id\":419,\"from\":{\"id\":1135428624,\"is_bot\":false,\"first_name\":\"Samuel\",\"last_name\":\"Adebunmi\",\"language_code\":\"en\"},\"chat\":{\"id\":1135428624,\"first_name\":\"Samuel\",\"last_name\":\"Adebunmi\",\"type\":\"private\"},\"date\":1615891764,\"text\":\"22190139298\"}}', NULL),
(54, '{\"update_id\":957589453,\n\"message\":{\"message_id\":421,\"from\":{\"id\":1135428624,\"is_bot\":false,\"first_name\":\"Samuel\",\"last_name\":\"Adebunmi\",\"language_code\":\"en\"},\"chat\":{\"id\":1135428624,\"first_name\":\"Samuel\",\"last_name\":\"Adebunmi\",\"type\":\"private\"},\"date\":1615891776,\"text\":\"testing@gmail.com\",\"entities\":[{\"offset\":0,\"length\":17,\"type\":\"email\"}]}}', NULL),
(55, '{\"update_id\":957589454,\n\"message\":{\"message_id\":423,\"from\":{\"id\":1135428624,\"is_bot\":false,\"first_name\":\"Samuel\",\"last_name\":\"Adebunmi\",\"language_code\":\"en\"},\"chat\":{\"id\":1135428624,\"first_name\":\"Samuel\",\"last_name\":\"Adebunmi\",\"type\":\"private\"},\"date\":1615891893,\"text\":\"hello\"}}', NULL),
(56, '{\"update_id\":957589455,\n\"message\":{\"message_id\":425,\"from\":{\"id\":1135428624,\"is_bot\":false,\"first_name\":\"Samuel\",\"last_name\":\"Adebunmi\",\"language_code\":\"en\"},\"chat\":{\"id\":1135428624,\"first_name\":\"Samuel\",\"last_name\":\"Adebunmi\",\"type\":\"private\"},\"date\":1615891895,\"text\":\"1\"}}', NULL),
(57, '{\"update_id\":957589456,\n\"message\":{\"message_id\":427,\"from\":{\"id\":1135428624,\"is_bot\":false,\"first_name\":\"Samuel\",\"last_name\":\"Adebunmi\",\"language_code\":\"en\"},\"chat\":{\"id\":1135428624,\"first_name\":\"Samuel\",\"last_name\":\"Adebunmi\",\"type\":\"private\"},\"date\":1615891912,\"text\":\"08032122345\",\"entities\":[{\"offset\":0,\"length\":11,\"type\":\"phone_number\"}]}}', NULL),
(58, '{\"update_id\":957589457,\n\"message\":{\"message_id\":429,\"from\":{\"id\":1135428624,\"is_bot\":false,\"first_name\":\"Samuel\",\"last_name\":\"Adebunmi\",\"language_code\":\"en\"},\"chat\":{\"id\":1135428624,\"first_name\":\"Samuel\",\"last_name\":\"Adebunmi\",\"type\":\"private\"},\"date\":1615891920,\"text\":\"22190139298\"}}', NULL),
(59, '{\"update_id\":957589458,\n\"message\":{\"message_id\":431,\"from\":{\"id\":1135428624,\"is_bot\":false,\"first_name\":\"Samuel\",\"last_name\":\"Adebunmi\",\"language_code\":\"en\"},\"chat\":{\"id\":1135428624,\"first_name\":\"Samuel\",\"last_name\":\"Adebunmi\",\"type\":\"private\"},\"date\":1615891931,\"text\":\"testing@156credit.com\",\"entities\":[{\"offset\":0,\"length\":21,\"type\":\"email\"}]}}', NULL),
(60, '{\"update_id\":957589459,\n\"message\":{\"message_id\":433,\"from\":{\"id\":1135428624,\"is_bot\":false,\"first_name\":\"Samuel\",\"last_name\":\"Adebunmi\",\"language_code\":\"en\"},\"chat\":{\"id\":1135428624,\"first_name\":\"Samuel\",\"last_name\":\"Adebunmi\",\"type\":\"private\"},\"date\":1615891956,\"text\":\"1001779238\",\"entities\":[{\"offset\":0,\"length\":10,\"type\":\"phone_number\"}]}}', NULL),
(61, '{\"update_id\":957589460,\n\"message\":{\"message_id\":435,\"from\":{\"id\":1135428624,\"is_bot\":false,\"first_name\":\"Samuel\",\"last_name\":\"Adebunmi\",\"language_code\":\"en\"},\"chat\":{\"id\":1135428624,\"first_name\":\"Samuel\",\"last_name\":\"Adebunmi\",\"type\":\"private\"},\"date\":1615892179,\"text\":\"1001779238\",\"entities\":[{\"offset\":0,\"length\":10,\"type\":\"phone_number\"}]}}', NULL),
(62, '{\"update_id\":957589461,\n\"message\":{\"message_id\":437,\"from\":{\"id\":1135428624,\"is_bot\":false,\"first_name\":\"Samuel\",\"last_name\":\"Adebunmi\",\"language_code\":\"en\"},\"chat\":{\"id\":1135428624,\"first_name\":\"Samuel\",\"last_name\":\"Adebunmi\",\"type\":\"private\"},\"date\":1615892211,\"text\":\"1001779238\",\"entities\":[{\"offset\":0,\"length\":10,\"type\":\"phone_number\"}]}}', NULL),
(63, '{\"update_id\":957589462,\n\"message\":{\"message_id\":439,\"from\":{\"id\":1135428624,\"is_bot\":false,\"first_name\":\"Samuel\",\"last_name\":\"Adebunmi\",\"language_code\":\"en\"},\"chat\":{\"id\":1135428624,\"first_name\":\"Samuel\",\"last_name\":\"Adebunmi\",\"type\":\"private\"},\"date\":1615892282,\"text\":\"1001779238\",\"entities\":[{\"offset\":0,\"length\":10,\"type\":\"phone_number\"}]}}', NULL),
(64, '{\"update_id\":957589463,\n\"message\":{\"message_id\":441,\"from\":{\"id\":1135428624,\"is_bot\":false,\"first_name\":\"Samuel\",\"last_name\":\"Adebunmi\",\"language_code\":\"en\"},\"chat\":{\"id\":1135428624,\"first_name\":\"Samuel\",\"last_name\":\"Adebunmi\",\"type\":\"private\"},\"date\":1615893720,\"text\":\"hello\"}}', NULL),
(65, '{\"update_id\":957589464,\n\"message\":{\"message_id\":443,\"from\":{\"id\":1135428624,\"is_bot\":false,\"first_name\":\"Samuel\",\"last_name\":\"Adebunmi\",\"language_code\":\"en\"},\"chat\":{\"id\":1135428624,\"first_name\":\"Samuel\",\"last_name\":\"Adebunmi\",\"type\":\"private\"},\"date\":1615893723,\"text\":\"1\"}}', NULL),
(66, '{\"update_id\":957589465,\n\"message\":{\"message_id\":445,\"from\":{\"id\":1135428624,\"is_bot\":false,\"first_name\":\"Samuel\",\"last_name\":\"Adebunmi\",\"language_code\":\"en\"},\"chat\":{\"id\":1135428624,\"first_name\":\"Samuel\",\"last_name\":\"Adebunmi\",\"type\":\"private\"},\"date\":1615893740,\"text\":\"08032122345\",\"entities\":[{\"offset\":0,\"length\":11,\"type\":\"phone_number\"}]}}', NULL),
(67, '{\"update_id\":957589466,\n\"message\":{\"message_id\":447,\"from\":{\"id\":1135428624,\"is_bot\":false,\"first_name\":\"Samuel\",\"last_name\":\"Adebunmi\",\"language_code\":\"en\"},\"chat\":{\"id\":1135428624,\"first_name\":\"Samuel\",\"last_name\":\"Adebunmi\",\"type\":\"private\"},\"date\":1615893752,\"text\":\"22190139298\"}}', NULL),
(68, '{\"update_id\":957589467,\n\"message\":{\"message_id\":449,\"from\":{\"id\":1135428624,\"is_bot\":false,\"first_name\":\"Samuel\",\"last_name\":\"Adebunmi\",\"language_code\":\"en\"},\"chat\":{\"id\":1135428624,\"first_name\":\"Samuel\",\"last_name\":\"Adebunmi\",\"type\":\"private\"},\"date\":1615893765,\"text\":\"testing@156credit.com\",\"entities\":[{\"offset\":0,\"length\":21,\"type\":\"email\"}]}}', NULL),
(69, '{\"update_id\":957589468,\n\"message\":{\"message_id\":451,\"from\":{\"id\":1135428624,\"is_bot\":false,\"first_name\":\"Samuel\",\"last_name\":\"Adebunmi\",\"language_code\":\"en\"},\"chat\":{\"id\":1135428624,\"first_name\":\"Samuel\",\"last_name\":\"Adebunmi\",\"type\":\"private\"},\"date\":1615893768,\"text\":\"1001779238\",\"entities\":[{\"offset\":0,\"length\":10,\"type\":\"phone_number\"}]}}', NULL),
(70, '{\"update_id\":957589469,\n\"message\":{\"message_id\":453,\"from\":{\"id\":1135428624,\"is_bot\":false,\"first_name\":\"Samuel\",\"last_name\":\"Adebunmi\",\"language_code\":\"en\"},\"chat\":{\"id\":1135428624,\"first_name\":\"Samuel\",\"last_name\":\"Adebunmi\",\"type\":\"private\"},\"date\":1615893792,\"text\":\"2\"}}', NULL),
(71, '{\"update_id\":957589470,\n\"message\":{\"message_id\":455,\"from\":{\"id\":1135428624,\"is_bot\":false,\"first_name\":\"Samuel\",\"last_name\":\"Adebunmi\",\"language_code\":\"en\"},\"chat\":{\"id\":1135428624,\"first_name\":\"Samuel\",\"last_name\":\"Adebunmi\",\"type\":\"private\"},\"date\":1615893814,\"text\":\"2\"}}', NULL),
(72, '{\"update_id\":957589471,\n\"message\":{\"message_id\":456,\"from\":{\"id\":1135428624,\"is_bot\":false,\"first_name\":\"Samuel\",\"last_name\":\"Adebunmi\",\"language_code\":\"en\"},\"chat\":{\"id\":1135428624,\"first_name\":\"Samuel\",\"last_name\":\"Adebunmi\",\"type\":\"private\"},\"date\":1615893898,\"text\":\"2\"}}', NULL),
(73, '{\"update_id\":957589472,\n\"message\":{\"message_id\":458,\"from\":{\"id\":1135428624,\"is_bot\":false,\"first_name\":\"Samuel\",\"last_name\":\"Adebunmi\",\"language_code\":\"en\"},\"chat\":{\"id\":1135428624,\"first_name\":\"Samuel\",\"last_name\":\"Adebunmi\",\"type\":\"private\"},\"date\":1615893903,\"text\":\"hello\"}}', NULL),
(74, '{\"update_id\":957589473,\n\"message\":{\"message_id\":460,\"from\":{\"id\":1135428624,\"is_bot\":false,\"first_name\":\"Samuel\",\"last_name\":\"Adebunmi\",\"language_code\":\"en\"},\"chat\":{\"id\":1135428624,\"first_name\":\"Samuel\",\"last_name\":\"Adebunmi\",\"type\":\"private\"},\"date\":1615893906,\"text\":\"1\"}}', NULL),
(75, '{\"update_id\":957589474,\n\"message\":{\"message_id\":462,\"from\":{\"id\":1135428624,\"is_bot\":false,\"first_name\":\"Samuel\",\"last_name\":\"Adebunmi\",\"language_code\":\"en\"},\"chat\":{\"id\":1135428624,\"first_name\":\"Samuel\",\"last_name\":\"Adebunmi\",\"type\":\"private\"},\"date\":1615893923,\"text\":\"08032122345\",\"entities\":[{\"offset\":0,\"length\":11,\"type\":\"phone_number\"}]}}', NULL),
(76, '{\"update_id\":957589475,\n\"message\":{\"message_id\":464,\"from\":{\"id\":1135428624,\"is_bot\":false,\"first_name\":\"Samuel\",\"last_name\":\"Adebunmi\",\"language_code\":\"en\"},\"chat\":{\"id\":1135428624,\"first_name\":\"Samuel\",\"last_name\":\"Adebunmi\",\"type\":\"private\"},\"date\":1615893940,\"text\":\"22190139298\"}}', NULL),
(77, '{\"update_id\":957589476,\n\"message\":{\"message_id\":466,\"from\":{\"id\":1135428624,\"is_bot\":false,\"first_name\":\"Samuel\",\"last_name\":\"Adebunmi\",\"language_code\":\"en\"},\"chat\":{\"id\":1135428624,\"first_name\":\"Samuel\",\"last_name\":\"Adebunmi\",\"type\":\"private\"},\"date\":1615893949,\"text\":\"testing@156credit.com\",\"entities\":[{\"offset\":0,\"length\":21,\"type\":\"email\"}]}}', NULL),
(78, '{\"update_id\":957589477,\n\"message\":{\"message_id\":468,\"from\":{\"id\":1135428624,\"is_bot\":false,\"first_name\":\"Samuel\",\"last_name\":\"Adebunmi\",\"language_code\":\"en\"},\"chat\":{\"id\":1135428624,\"first_name\":\"Samuel\",\"last_name\":\"Adebunmi\",\"type\":\"private\"},\"date\":1615893960,\"text\":\"1001779238\",\"entities\":[{\"offset\":0,\"length\":10,\"type\":\"phone_number\"}]}}', NULL),
(79, '{\"update_id\":957589478,\n\"message\":{\"message_id\":470,\"from\":{\"id\":1135428624,\"is_bot\":false,\"first_name\":\"Samuel\",\"last_name\":\"Adebunmi\",\"language_code\":\"en\"},\"chat\":{\"id\":1135428624,\"first_name\":\"Samuel\",\"last_name\":\"Adebunmi\",\"type\":\"private\"},\"date\":1615893967,\"text\":\"2\"}}', NULL),
(80, '{\"update_id\":957589479,\n\"message\":{\"message_id\":472,\"from\":{\"id\":1135428624,\"is_bot\":false,\"first_name\":\"Samuel\",\"last_name\":\"Adebunmi\",\"language_code\":\"en\"},\"chat\":{\"id\":1135428624,\"first_name\":\"Samuel\",\"last_name\":\"Adebunmi\",\"type\":\"private\"},\"date\":1615893972,\"text\":\"hello\"}}', NULL),
(81, '{\"update_id\":957589480,\n\"message\":{\"message_id\":474,\"from\":{\"id\":1135428624,\"is_bot\":false,\"first_name\":\"Samuel\",\"last_name\":\"Adebunmi\",\"language_code\":\"en\"},\"chat\":{\"id\":1135428624,\"first_name\":\"Samuel\",\"last_name\":\"Adebunmi\",\"type\":\"private\"},\"date\":1615893975,\"text\":\"1\"}}', NULL),
(82, '{\"update_id\":957589481,\n\"message\":{\"message_id\":476,\"from\":{\"id\":1135428624,\"is_bot\":false,\"first_name\":\"Samuel\",\"last_name\":\"Adebunmi\",\"language_code\":\"en\"},\"chat\":{\"id\":1135428624,\"first_name\":\"Samuel\",\"last_name\":\"Adebunmi\",\"type\":\"private\"},\"date\":1615893984,\"text\":\"08032122345\",\"entities\":[{\"offset\":0,\"length\":11,\"type\":\"phone_number\"}]}}', NULL),
(83, '{\"update_id\":957589482,\n\"message\":{\"message_id\":478,\"from\":{\"id\":1135428624,\"is_bot\":false,\"first_name\":\"Samuel\",\"last_name\":\"Adebunmi\",\"language_code\":\"en\"},\"chat\":{\"id\":1135428624,\"first_name\":\"Samuel\",\"last_name\":\"Adebunmi\",\"type\":\"private\"},\"date\":1615893998,\"text\":\"22190139298\"}}', NULL),
(84, '{\"update_id\":957589483,\n\"message\":{\"message_id\":480,\"from\":{\"id\":1135428624,\"is_bot\":false,\"first_name\":\"Samuel\",\"last_name\":\"Adebunmi\",\"language_code\":\"en\"},\"chat\":{\"id\":1135428624,\"first_name\":\"Samuel\",\"last_name\":\"Adebunmi\",\"type\":\"private\"},\"date\":1615894008,\"text\":\"testing@156credit.com\",\"entities\":[{\"offset\":0,\"length\":21,\"type\":\"email\"}]}}', NULL),
(85, '{\"update_id\":957589484,\n\"message\":{\"message_id\":482,\"from\":{\"id\":1135428624,\"is_bot\":false,\"first_name\":\"Samuel\",\"last_name\":\"Adebunmi\",\"language_code\":\"en\"},\"chat\":{\"id\":1135428624,\"first_name\":\"Samuel\",\"last_name\":\"Adebunmi\",\"type\":\"private\"},\"date\":1615894017,\"text\":\"1001779238\",\"entities\":[{\"offset\":0,\"length\":10,\"type\":\"phone_number\"}]}}', NULL),
(86, '{\"update_id\":957589485,\n\"message\":{\"message_id\":484,\"from\":{\"id\":1135428624,\"is_bot\":false,\"first_name\":\"Samuel\",\"last_name\":\"Adebunmi\",\"language_code\":\"en\"},\"chat\":{\"id\":1135428624,\"first_name\":\"Samuel\",\"last_name\":\"Adebunmi\",\"type\":\"private\"},\"date\":1615894026,\"text\":\"1\"}}', NULL),
(87, '{\"update_id\":957589486,\n\"message\":{\"message_id\":485,\"from\":{\"id\":1135428624,\"is_bot\":false,\"first_name\":\"Samuel\",\"last_name\":\"Adebunmi\",\"language_code\":\"en\"},\"chat\":{\"id\":1135428624,\"first_name\":\"Samuel\",\"last_name\":\"Adebunmi\",\"type\":\"private\"},\"date\":1615894064,\"text\":\"1\"}}', NULL),
(88, '{\"update_id\":957589487,\n\"message\":{\"message_id\":487,\"from\":{\"id\":1135428624,\"is_bot\":false,\"first_name\":\"Samuel\",\"last_name\":\"Adebunmi\",\"language_code\":\"en\"},\"chat\":{\"id\":1135428624,\"first_name\":\"Samuel\",\"last_name\":\"Adebunmi\",\"type\":\"private\"},\"date\":1615894093,\"text\":\"26232\"}}', NULL),
(89, '{\"update_id\":957589488,\n\"message\":{\"message_id\":489,\"from\":{\"id\":1135428624,\"is_bot\":false,\"first_name\":\"Samuel\",\"last_name\":\"Adebunmi\",\"language_code\":\"en\"},\"chat\":{\"id\":1135428624,\"first_name\":\"Samuel\",\"last_name\":\"Adebunmi\",\"type\":\"private\"},\"date\":1615894114,\"text\":\"26234\"}}', NULL),
(90, '{\"update_id\":957589489,\n\"message\":{\"message_id\":491,\"from\":{\"id\":1135428624,\"is_bot\":false,\"first_name\":\"Samuel\",\"last_name\":\"Adebunmi\",\"language_code\":\"en\"},\"chat\":{\"id\":1135428624,\"first_name\":\"Samuel\",\"last_name\":\"Adebunmi\",\"type\":\"private\"},\"date\":1615894117,\"text\":\"26230\"}}', NULL),
(91, '{\"update_id\":957589490,\n\"message\":{\"message_id\":493,\"from\":{\"id\":1135428624,\"is_bot\":false,\"first_name\":\"Samuel\",\"last_name\":\"Adebunmi\",\"language_code\":\"en\"},\"chat\":{\"id\":1135428624,\"first_name\":\"Samuel\",\"last_name\":\"Adebunmi\",\"type\":\"private\"},\"date\":1615894125,\"text\":\"26230\"}}', NULL),
(92, '{\"update_id\":957589491,\n\"message\":{\"message_id\":495,\"from\":{\"id\":1135428624,\"is_bot\":false,\"first_name\":\"Samuel\",\"last_name\":\"Adebunmi\",\"language_code\":\"en\"},\"chat\":{\"id\":1135428624,\"first_name\":\"Samuel\",\"last_name\":\"Adebunmi\",\"type\":\"private\"},\"date\":1615894250,\"text\":\"26230\"}}', NULL),
(93, '{\"update_id\":957589492,\n\"message\":{\"message_id\":497,\"from\":{\"id\":1135428624,\"is_bot\":false,\"first_name\":\"Samuel\",\"last_name\":\"Adebunmi\",\"language_code\":\"en\"},\"chat\":{\"id\":1135428624,\"first_name\":\"Samuel\",\"last_name\":\"Adebunmi\",\"type\":\"private\"},\"date\":1615894359,\"text\":\"26230\"}}', NULL),
(94, '{\"update_id\":957589493,\n\"message\":{\"message_id\":499,\"from\":{\"id\":1135428624,\"is_bot\":false,\"first_name\":\"Samuel\",\"last_name\":\"Adebunmi\",\"language_code\":\"en\"},\"chat\":{\"id\":1135428624,\"first_name\":\"Samuel\",\"last_name\":\"Adebunmi\",\"type\":\"private\"},\"date\":1615894433,\"text\":\"26230\"}}', NULL),
(95, '{\"update_id\":957589494,\n\"message\":{\"message_id\":501,\"from\":{\"id\":1135428624,\"is_bot\":false,\"first_name\":\"Samuel\",\"last_name\":\"Adebunmi\",\"language_code\":\"en\"},\"chat\":{\"id\":1135428624,\"first_name\":\"Samuel\",\"last_name\":\"Adebunmi\",\"type\":\"private\"},\"date\":1615894506,\"text\":\"26230\"}}', NULL),
(96, '{\"update_id\":957589495,\n\"message\":{\"message_id\":503,\"from\":{\"id\":1135428624,\"is_bot\":false,\"first_name\":\"Samuel\",\"last_name\":\"Adebunmi\",\"language_code\":\"en\"},\"chat\":{\"id\":1135428624,\"first_name\":\"Samuel\",\"last_name\":\"Adebunmi\",\"type\":\"private\"},\"date\":1615894512,\"text\":\"26230\"}}', NULL),
(97, '{\"update_id\":957589496,\n\"message\":{\"message_id\":505,\"from\":{\"id\":1135428624,\"is_bot\":false,\"first_name\":\"Samuel\",\"last_name\":\"Adebunmi\",\"language_code\":\"en\"},\"chat\":{\"id\":1135428624,\"first_name\":\"Samuel\",\"last_name\":\"Adebunmi\",\"type\":\"private\"},\"date\":1615894547,\"text\":\"262302\"}}', NULL),
(98, '{\"update_id\":957589497,\n\"message\":{\"message_id\":507,\"from\":{\"id\":1135428624,\"is_bot\":false,\"first_name\":\"Samuel\",\"last_name\":\"Adebunmi\",\"language_code\":\"en\"},\"chat\":{\"id\":1135428624,\"first_name\":\"Samuel\",\"last_name\":\"Adebunmi\",\"type\":\"private\"},\"date\":1615894550,\"text\":\"26230\"}}', NULL),
(99, '{\"update_id\":957589498,\n\"message\":{\"message_id\":509,\"from\":{\"id\":1135428624,\"is_bot\":false,\"first_name\":\"Samuel\",\"last_name\":\"Adebunmi\",\"language_code\":\"en\"},\"chat\":{\"id\":1135428624,\"first_name\":\"Samuel\",\"last_name\":\"Adebunmi\",\"type\":\"private\"},\"date\":1615894635,\"text\":\"26230\"}}', NULL),
(100, '{\"update_id\":957589499,\n\"message\":{\"message_id\":511,\"from\":{\"id\":1135428624,\"is_bot\":false,\"first_name\":\"Samuel\",\"last_name\":\"Adebunmi\",\"language_code\":\"en\"},\"chat\":{\"id\":1135428624,\"first_name\":\"Samuel\",\"last_name\":\"Adebunmi\",\"type\":\"private\"},\"date\":1615894641,\"text\":\"hello\"}}', NULL),
(101, '{\"update_id\":957589500,\n\"message\":{\"message_id\":513,\"from\":{\"id\":1135428624,\"is_bot\":false,\"first_name\":\"Samuel\",\"last_name\":\"Adebunmi\",\"language_code\":\"en\"},\"chat\":{\"id\":1135428624,\"first_name\":\"Samuel\",\"last_name\":\"Adebunmi\",\"type\":\"private\"},\"date\":1615895155,\"text\":\"26230\"}}', NULL),
(102, '{\"update_id\":957589501,\n\"message\":{\"message_id\":515,\"from\":{\"id\":1135428624,\"is_bot\":false,\"first_name\":\"Samuel\",\"last_name\":\"Adebunmi\",\"language_code\":\"en\"},\"chat\":{\"id\":1135428624,\"first_name\":\"Samuel\",\"last_name\":\"Adebunmi\",\"type\":\"private\"},\"date\":1615895240,\"text\":\"26230\"}}', NULL),
(103, '{\"update_id\":957589502,\n\"message\":{\"message_id\":517,\"from\":{\"id\":1135428624,\"is_bot\":false,\"first_name\":\"Samuel\",\"last_name\":\"Adebunmi\",\"language_code\":\"en\"},\"chat\":{\"id\":1135428624,\"first_name\":\"Samuel\",\"last_name\":\"Adebunmi\",\"type\":\"private\"},\"date\":1615895433,\"text\":\"26230\"}}', NULL),
(104, '{\"update_id\":957589503,\n\"message\":{\"message_id\":519,\"from\":{\"id\":1135428624,\"is_bot\":false,\"first_name\":\"Samuel\",\"last_name\":\"Adebunmi\",\"language_code\":\"en\"},\"chat\":{\"id\":1135428624,\"first_name\":\"Samuel\",\"last_name\":\"Adebunmi\",\"type\":\"private\"},\"date\":1615895452,\"text\":\"26230\"}}', NULL),
(105, '{\"update_id\":957589504,\n\"message\":{\"message_id\":521,\"from\":{\"id\":1135428624,\"is_bot\":false,\"first_name\":\"Samuel\",\"last_name\":\"Adebunmi\",\"language_code\":\"en\"},\"chat\":{\"id\":1135428624,\"first_name\":\"Samuel\",\"last_name\":\"Adebunmi\",\"type\":\"private\"},\"date\":1615895458,\"text\":\"hello\"}}', NULL),
(106, '{\"update_id\":957589505,\n\"message\":{\"message_id\":523,\"from\":{\"id\":1135428624,\"is_bot\":false,\"first_name\":\"Samuel\",\"last_name\":\"Adebunmi\",\"language_code\":\"en\"},\"chat\":{\"id\":1135428624,\"first_name\":\"Samuel\",\"last_name\":\"Adebunmi\",\"type\":\"private\"},\"date\":1615896272,\"text\":\"1\"}}', NULL),
(107, '{\"update_id\":957589506,\n\"message\":{\"message_id\":528,\"from\":{\"id\":1135428624,\"is_bot\":false,\"first_name\":\"Samuel\",\"last_name\":\"Adebunmi\",\"language_code\":\"en\"},\"chat\":{\"id\":1135428624,\"first_name\":\"Samuel\",\"last_name\":\"Adebunmi\",\"type\":\"private\"},\"date\":1615896302,\"text\":\"hello\"}}', NULL),
(108, '{\"update_id\":957589507,\n\"message\":{\"message_id\":530,\"from\":{\"id\":1135428624,\"is_bot\":false,\"first_name\":\"Samuel\",\"last_name\":\"Adebunmi\",\"language_code\":\"en\"},\"chat\":{\"id\":1135428624,\"first_name\":\"Samuel\",\"last_name\":\"Adebunmi\",\"type\":\"private\"},\"date\":1615896310,\"text\":\"hello\"}}', NULL),
(109, '{\"update_id\":957589508,\n\"message\":{\"message_id\":532,\"from\":{\"id\":1135428624,\"is_bot\":false,\"first_name\":\"Samuel\",\"last_name\":\"Adebunmi\",\"language_code\":\"en\"},\"chat\":{\"id\":1135428624,\"first_name\":\"Samuel\",\"last_name\":\"Adebunmi\",\"type\":\"private\"},\"date\":1615896371,\"text\":\"hello\"}}', NULL),
(110, '{\"update_id\":957589509,\n\"message\":{\"message_id\":537,\"from\":{\"id\":1135428624,\"is_bot\":false,\"first_name\":\"Samuel\",\"last_name\":\"Adebunmi\",\"language_code\":\"en\"},\"chat\":{\"id\":1135428624,\"first_name\":\"Samuel\",\"last_name\":\"Adebunmi\",\"type\":\"private\"},\"date\":1615896609,\"text\":\"hello\"}}', NULL),
(111, '{\"update_id\":957589510,\n\"message\":{\"message_id\":539,\"from\":{\"id\":1135428624,\"is_bot\":false,\"first_name\":\"Samuel\",\"last_name\":\"Adebunmi\",\"language_code\":\"en\"},\"chat\":{\"id\":1135428624,\"first_name\":\"Samuel\",\"last_name\":\"Adebunmi\",\"type\":\"private\"},\"date\":1615896670,\"text\":\"hello\"}}', NULL),
(112, '{\"update_id\":957589511,\n\"message\":{\"message_id\":540,\"from\":{\"id\":1135428624,\"is_bot\":false,\"first_name\":\"Samuel\",\"last_name\":\"Adebunmi\",\"language_code\":\"en\"},\"chat\":{\"id\":1135428624,\"first_name\":\"Samuel\",\"last_name\":\"Adebunmi\",\"type\":\"private\"},\"date\":1615896791,\"text\":\"hello\"}}', NULL),
(113, '{\"update_id\":957589512,\n\"message\":{\"message_id\":541,\"from\":{\"id\":1135428624,\"is_bot\":false,\"first_name\":\"Samuel\",\"last_name\":\"Adebunmi\",\"language_code\":\"en\"},\"chat\":{\"id\":1135428624,\"first_name\":\"Samuel\",\"last_name\":\"Adebunmi\",\"type\":\"private\"},\"date\":1615896879,\"text\":\"hello\"}}', NULL),
(114, '{\"update_id\":957589513,\n\"message\":{\"message_id\":542,\"from\":{\"id\":1135428624,\"is_bot\":false,\"first_name\":\"Samuel\",\"last_name\":\"Adebunmi\",\"language_code\":\"en\"},\"chat\":{\"id\":1135428624,\"first_name\":\"Samuel\",\"last_name\":\"Adebunmi\",\"type\":\"private\"},\"date\":1615896916,\"text\":\"hello\"}}', NULL),
(115, '{\"update_id\":957589514,\n\"message\":{\"message_id\":551,\"from\":{\"id\":1135428624,\"is_bot\":false,\"first_name\":\"Samuel\",\"last_name\":\"Adebunmi\",\"language_code\":\"en\"},\"chat\":{\"id\":1135428624,\"first_name\":\"Samuel\",\"last_name\":\"Adebunmi\",\"type\":\"private\"},\"date\":1615897005,\"text\":\"hello\"}}', NULL),
(116, '{\"update_id\":957589515,\n\"message\":{\"message_id\":553,\"from\":{\"id\":1135428624,\"is_bot\":false,\"first_name\":\"Samuel\",\"last_name\":\"Adebunmi\",\"language_code\":\"en\"},\"chat\":{\"id\":1135428624,\"first_name\":\"Samuel\",\"last_name\":\"Adebunmi\",\"type\":\"private\"},\"date\":1615897049,\"text\":\"hello\"}}', NULL),
(117, '{\"update_id\":957589516,\n\"message\":{\"message_id\":555,\"from\":{\"id\":1135428624,\"is_bot\":false,\"first_name\":\"Samuel\",\"last_name\":\"Adebunmi\",\"language_code\":\"en\"},\"chat\":{\"id\":1135428624,\"first_name\":\"Samuel\",\"last_name\":\"Adebunmi\",\"type\":\"private\"},\"date\":1615897059,\"text\":\"1\"}}', NULL),
(118, '{\"update_id\":957589517,\n\"message\":{\"message_id\":557,\"from\":{\"id\":1135428624,\"is_bot\":false,\"first_name\":\"Samuel\",\"last_name\":\"Adebunmi\",\"language_code\":\"en\"},\"chat\":{\"id\":1135428624,\"first_name\":\"Samuel\",\"last_name\":\"Adebunmi\",\"type\":\"private\"},\"date\":1615897135,\"text\":\"08032122345\",\"entities\":[{\"offset\":0,\"length\":11,\"type\":\"phone_number\"}]}}', NULL),
(119, '{\"update_id\":957589518,\n\"message\":{\"message_id\":559,\"from\":{\"id\":1135428624,\"is_bot\":false,\"first_name\":\"Samuel\",\"last_name\":\"Adebunmi\",\"language_code\":\"en\"},\"chat\":{\"id\":1135428624,\"first_name\":\"Samuel\",\"last_name\":\"Adebunmi\",\"type\":\"private\"},\"date\":1615897199,\"text\":\"hello\"}}', NULL),
(120, '{\"update_id\":957589519,\n\"message\":{\"message_id\":561,\"from\":{\"id\":1135428624,\"is_bot\":false,\"first_name\":\"Samuel\",\"last_name\":\"Adebunmi\",\"language_code\":\"en\"},\"chat\":{\"id\":1135428624,\"first_name\":\"Samuel\",\"last_name\":\"Adebunmi\",\"type\":\"private\"},\"date\":1615897223,\"text\":\"hello\"}}', NULL),
(121, '{\"update_id\":957589520,\n\"message\":{\"message_id\":563,\"from\":{\"id\":1135428624,\"is_bot\":false,\"first_name\":\"Samuel\",\"last_name\":\"Adebunmi\",\"language_code\":\"en\"},\"chat\":{\"id\":1135428624,\"first_name\":\"Samuel\",\"last_name\":\"Adebunmi\",\"type\":\"private\"},\"date\":1615897230,\"text\":\"1\"}}', NULL),
(122, '{\"update_id\":957589521,\n\"message\":{\"message_id\":565,\"from\":{\"id\":1135428624,\"is_bot\":false,\"first_name\":\"Samuel\",\"last_name\":\"Adebunmi\",\"language_code\":\"en\"},\"chat\":{\"id\":1135428624,\"first_name\":\"Samuel\",\"last_name\":\"Adebunmi\",\"type\":\"private\"},\"date\":1615897350,\"text\":\"hello\"}}', NULL),
(123, '{\"update_id\":957589522,\n\"message\":{\"message_id\":567,\"from\":{\"id\":1135428624,\"is_bot\":false,\"first_name\":\"Samuel\",\"last_name\":\"Adebunmi\",\"language_code\":\"en\"},\"chat\":{\"id\":1135428624,\"first_name\":\"Samuel\",\"last_name\":\"Adebunmi\",\"type\":\"private\"},\"date\":1615897352,\"text\":\"1\"}}', NULL),
(124, '{\"update_id\":957589523,\n\"message\":{\"message_id\":569,\"from\":{\"id\":1135428624,\"is_bot\":false,\"first_name\":\"Samuel\",\"last_name\":\"Adebunmi\",\"language_code\":\"en\"},\"chat\":{\"id\":1135428624,\"first_name\":\"Samuel\",\"last_name\":\"Adebunmi\",\"type\":\"private\"},\"date\":1615897355,\"text\":\"08032122345\",\"entities\":[{\"offset\":0,\"length\":11,\"type\":\"phone_number\"}]}}', NULL),
(125, '{\"update_id\":957589524,\n\"message\":{\"message_id\":571,\"from\":{\"id\":1135428624,\"is_bot\":false,\"first_name\":\"Samuel\",\"last_name\":\"Adebunmi\",\"language_code\":\"en\"},\"chat\":{\"id\":1135428624,\"first_name\":\"Samuel\",\"last_name\":\"Adebunmi\",\"type\":\"private\"},\"date\":1615897410,\"text\":\"22190139298\"}}', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `transfer_recipients`
--

CREATE TABLE `transfer_recipients` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `loan_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `reference_code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `account_number` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `bank_name` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `bank_code` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `transfer_recipients`
--

INSERT INTO `transfer_recipients` (`id`, `loan_id`, `reference_code`, `account_number`, `bank_name`, `bank_code`, `created_at`, `updated_at`) VALUES
(4, 'loans_fe914fecd3f04715b7810b69f8244b61', 'RCP_aklzugrw5mmub1t', '0232503207', 'Wema Bank', '035', '2020-05-17 20:01:06', '2020-05-17 20:01:06'),
(12, 'loans_11c1bdf03bfbdba165c62c47169628ba', 'RCP_eopqvgfogwblt1v', '1000729315', 'Zenith Bank', '057', '2020-06-25 20:04:05', '2020-06-25 20:04:05'),
(13, 'loans_fd34985926b61d5ae831ab29ea655acc', 'RCP_yguv11gzemsormu', '0224041015', 'First City Monument Bank', '214', '2020-07-02 13:13:03', '2020-07-02 13:13:03'),
(14, 'loans_be5ab64449d56ddc56526f913fc575da', 'RCP_98kzmg8bjydyftg', '0041674010', 'Union Bank of Nigeria', '032', '2020-07-03 16:06:03', '2020-07-03 16:06:03'),
(15, 'loans_f839a254f014c23fe6e05849218ae836', 'RCP_ieoosvlufxomthw', '1001779238', 'Zenith Bank', '057', '2020-07-03 21:53:03', '2020-07-03 21:53:03'),
(16, 'loans_45ed844998f716e4328ae21080855299', 'RCP_ccdaojdyq8kz8pc', '3069976671', 'First Bank of Nigeria', '011', '2020-07-04 18:47:02', '2020-07-04 18:47:02'),
(17, 'loans_afe89b02f983fce9ee0d9066deda6061', 'RCP_ccdaojdyq8kz8pc', '3069976671', 'First Bank of Nigeria', '011', '2020-07-04 20:05:05', '2020-07-04 20:05:05'),
(18, 'loans_a1b87c1d88ade4eba6b54c553c679c17', 'RCP_ccdaojdyq8kz8pc', '3069976671', 'First Bank of Nigeria', '011', '2020-07-20 07:42:04', '2020-07-20 07:42:04'),
(19, 'loans_560f2ca4480c1ca73b82716ea497976a', 'RCP_ccdaojdyq8kz8pc', '3069976671', 'First Bank of Nigeria', '011', '2020-07-20 08:22:04', '2020-07-20 08:22:04'),
(20, 'loans_2a2b2fdfbae43d6f52e5737b49981f36', 'RCP_ccdaojdyq8kz8pc', '3069976671', 'First Bank of Nigeria', '011', '2020-07-20 08:37:03', '2020-07-20 08:37:03'),
(21, 'loans_c2ad4290b970fbe27a8a57447904d4ca', 'RCP_ccdaojdyq8kz8pc', '3069976671', 'First Bank of Nigeria', '011', '2020-07-20 08:40:04', '2020-07-20 08:40:04'),
(22, 'loans_a0dad91a20d5250185fa4d20ef6541ff', 'RCP_ccdaojdyq8kz8pc', '3069976671', 'First Bank of Nigeria', '011', '2020-07-20 08:45:07', '2020-07-20 08:45:07'),
(23, 'loans_777aabe63bd1676a98aab4b3769639a7', 'RCP_ccdaojdyq8kz8pc', '3069976671', 'First Bank of Nigeria', '011', '2020-07-20 08:59:04', '2020-07-20 08:59:04'),
(24, 'loans_a6166de96273c3098a1d06ab4975eea7', 'RCP_ccdaojdyq8kz8pc', '3069976671', 'First Bank of Nigeria', '011', '2020-07-20 09:08:05', '2020-07-20 09:08:05'),
(25, 'loans_a6c42cf1ef11c9b055ad761612f789a7', 'RCP_ccdaojdyq8kz8pc', '3069976671', 'First Bank of Nigeria', '011', '2020-07-20 09:21:03', '2020-07-20 09:21:03'),
(26, 'loans_a662debab127e88d427a967efe66d5c3', 'RCP_ccdaojdyq8kz8pc', '3069976671', 'First Bank of Nigeria', '011', '2020-07-20 09:26:03', '2020-07-20 09:26:03'),
(27, 'loans_2c048982ab7d5df70ad3cce3e32b70cf', 'RCP_ccdaojdyq8kz8pc', '3069976671', 'First Bank of Nigeria', '011', '2020-07-20 09:35:05', '2020-07-20 09:35:05'),
(28, 'loans_26efafc98b95f1084d2f06b0ff7d321a', 'RCP_ccdaojdyq8kz8pc', '3069976671', 'First Bank of Nigeria', '011', '2020-07-20 09:40:05', '2020-07-20 09:40:05'),
(29, 'loans_c1e83c16858179f08eb16686a9cb93c1', 'RCP_ccdaojdyq8kz8pc', '3069976671', 'First Bank of Nigeria', '011', '2020-07-20 09:45:05', '2020-07-20 09:45:05'),
(30, 'loans_9f3d6a256caa31fc95c2f5ef5ce4e9e8', 'RCP_5u9m4lbnvnx8a5a', '0791138362', 'Access Bank', '044', '2020-07-20 14:56:03', '2020-07-20 14:56:03'),
(31, 'loans_2c6b6f8eecfb61570b70007cabb056fd', 'RCP_ieoosvlufxomthw', '1001779238', 'Zenith Bank', '057', '2020-07-21 13:56:02', '2020-07-21 13:56:02'),
(32, 'loans_0dd200f6c6449fd4fc5c326551f622a2', 'RCP_ieoosvlufxomthw', '1001779238', 'Zenith Bank', '057', '2020-07-21 20:51:03', '2020-07-21 20:51:03'),
(33, 'loans_bee89758ab9e909019af22af9dff88bb', 'RCP_7ugljz33gee77w0', '0028919118', 'Guaranty Trust Bank', '058', '2020-07-22 09:38:03', '2020-07-22 09:38:03'),
(34, 'loans_c56736d9a5004e14602bf334198f7c43', 'RCP_a8folwj13ap1evx', '1020063338', 'Zenith Bank', '057', '2020-07-22 20:49:03', '2020-07-22 20:49:03'),
(35, 'loans_76feee13c97be36b1f9a65609cccc0b5', 'RCP_98kzmg8bjydyftg', '0041674010', 'Union Bank of Nigeria', '032', '2020-07-23 11:20:06', '2020-07-23 11:20:06'),
(36, 'loans_1856107bd3f1979fd3b57efbc8b44463', 'RCP_ewmbnpxs6kirysy', '0075018989', 'Access Bank', '044', '2020-07-23 18:02:05', '2020-07-23 18:02:05'),
(37, 'loans_bf53e8b06a0fa868cafd12c1ee57dd2b', 'RCP_c9l3wech9bmv0zi', '1382914321', 'Access Bank', '044', '2020-07-23 21:09:04', '2020-07-23 21:09:04'),
(38, 'loans_b95cbb0ba53f7515b24297e75adcc53e', 'RCP_j376y68rkx480d8', '0019786701', 'Guaranty Trust Bank', '058', '2020-07-24 09:18:09', '2020-07-24 09:18:09'),
(39, 'loans_541c759a6a5135e974730d84677d8f5a', 'RCP_6rdf6mho6xmlrtl', '0037534476', 'Guaranty Trust Bank', '058', '2020-07-26 10:24:05', '2020-07-26 10:24:05'),
(40, 'loans_e734e55ccda4d1a08a861220458b99b9', 'RCP_6qucbe1lvoszdvf', '0006088050', 'Guaranty Trust Bank', '058', '2020-07-27 21:02:02', '2020-07-27 21:02:02'),
(41, 'loans_d6a78512862073cb7a4e9a7116f72b96', 'RCP_eopqvgfogwblt1v', '1000729315', 'Zenith Bank', '057', '2020-07-28 11:32:03', '2020-07-28 11:32:03'),
(42, 'loans_5c4b13ecafb6634ee3da2b64f952fda4', 'RCP_vxdbbjil12msw69', '2125147855', 'United Bank For Africa', '033', '2020-07-28 13:45:05', '2020-07-28 13:45:05'),
(43, 'loans_bb5507b15eabaa53b38d0df59c05dfa8', 'RCP_7ugljz33gee77w0', '0028919118', 'Guaranty Trust Bank', '058', '2020-08-14 16:56:03', '2020-08-14 16:56:03');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `user_id` varchar(50) DEFAULT NULL COMMENT 'md5 twice',
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `other_name` varchar(255) DEFAULT NULL,
  `mobile_phone_number` varchar(50) DEFAULT NULL COMMENT 'this is the main bvn number',
  `phone_input1` varchar(50) DEFAULT NULL,
  `phone_input2` varchar(100) DEFAULT NULL,
  `email_address` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `other_details` text,
  `when_added` timestamp NULL DEFAULT NULL,
  `channel` tinyint(1) DEFAULT NULL COMMENT '1 for whastapp 2 for others',
  `status` tinyint(1) DEFAULT NULL COMMENT '1 for active, 0 for disabled, 2 for suspended',
  `sece_ques` mediumtext,
  `sece_ans` varchar(255) DEFAULT NULL,
  `acctno` varchar(100) DEFAULT NULL,
  `bankcode` varchar(100) DEFAULT NULL,
  `bankname` varchar(100) DEFAULT NULL,
  `bvn` varchar(100) DEFAULT NULL,
  `employer_name` varchar(200) DEFAULT NULL,
  `staff_no` varchar(200) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `user_id`, `first_name`, `last_name`, `other_name`, `mobile_phone_number`, `phone_input1`, `phone_input2`, `email_address`, `password`, `other_details`, `when_added`, `channel`, `status`, `sece_ques`, `sece_ans`, `acctno`, `bankcode`, `bankname`, `bvn`, `employer_name`, `staff_no`, `created_at`, `updated_at`) VALUES
(10, '03bf3557e755c2e273a19f6ed5e21a86', 'Stella', 'Ibhade', NULL, '08037228850', '08037228850', '08037228850', 'Stella.ibhade@gmail.com', NULL, NULL, '2020-06-25 20:01:18', 1, 1, NULL, NULL, '1000729315', '057', 'Zenith Bank Plc', '22144637287', 'TEPNG', '0227688', NULL, NULL),
(13, 'c13ffebeda44dc4b9fca5e4f61bdd629', 'Azubuike', 'Emereonye', NULL, '08179044394', '08179044394', '08179044394', 'zcsltd046@gmail.com', NULL, NULL, '2020-07-02 13:28:14', 1, 1, NULL, NULL, '0075018989', '044', 'Access Bank Plc', '22201370843', 'Zubby limited', '0123', NULL, NULL),
(14, '506ee9d102661d474a7c39eea52b05ca', 'Ojomon', 'Ibhade', NULL, '08084051636', '08084051636', '07034130534', 'ojomon25@yahoo.com', NULL, NULL, '2020-07-03 16:03:26', 1, 1, NULL, NULL, '0041674010', '032', 'Union Bank of Nigeria Plc', '22154270423', 'Oj and Ella', '1234567', NULL, NULL),
(19, 'bec33f1f08bcad1996d23b0cae02df6f', 'Adebayo', 'Joshua', NULL, '08137512747', '08137512747', '08138152101', 'ajosavboy@gmail.com', NULL, NULL, '2020-07-20 14:35:11', 1, 1, NULL, NULL, '0791138362', '044', 'Access Bank Plc', '22445494549', NULL, NULL, '2020-07-20 14:35:11', '2020-07-20 14:35:11'),
(21, 'e0ae76bcaff43e5f4faff38af58fc5ac', 'OLAYINKA', 'OGUNDAIRO', NULL, '08033008963', '08033008963', '', 'yogundairo@gmail.com', NULL, NULL, '2020-07-21 17:18:27', 1, 1, NULL, NULL, '1001779238', '057', 'ZENITH', '22190139298', NULL, NULL, '2020-07-21 17:18:27', '2020-07-21 17:18:27'),
(23, '839fc25bbcb7270b235a62dabc8bc285', 'Akintoye', 'Akinmade', NULL, '08168509044', '08168509044', '08052257405', 'adebsholey4real@gmail.com', NULL, NULL, '2020-07-21 21:30:29', 1, 1, NULL, NULL, '0028919118', '058', 'GTbank', '22181814058', NULL, NULL, '2020-07-21 21:30:29', '2020-07-21 21:30:29'),
(24, 'd158b900515e0c5a8b4e0ba7b4d7554f', 'BASSEY', 'ADEMOYEGA', NULL, '08136022884', '08136022884', '08023111660', 'Baceevien80@yahoo.com', NULL, NULL, '2020-07-22 20:46:27', 1, 1, NULL, NULL, '1020063338', '057', 'ZENITH', '22141870348', NULL, NULL, '2020-07-22 20:46:27', '2020-07-22 20:46:27'),
(25, '39819776ca8fafd01756bd3730e723b8', 'MARY', 'UDOAKA', NULL, '08027256586', '08027256586', '08064204055', 'maryahamefula30@gmail.com', NULL, NULL, '2020-07-23 17:04:24', 1, 1, NULL, NULL, '1382914321', '044', 'Access Bank', '22312008057', NULL, NULL, '2020-07-23 17:04:24', '2020-07-23 17:04:24'),
(26, '20187cf14a58a4cdbe9c4baeae24ec2b', 'STEPHEN', 'ADERINTO', NULL, '08099120707', '08099120707', '-', 'stephenaderintoadewuyi1975@gmail.com', NULL, NULL, '2020-07-24 09:10:22', 1, 1, NULL, NULL, '0019786701', '058', 'GTB', '22172462637', NULL, NULL, '2020-07-24 09:10:22', '2020-07-24 09:10:22'),
(27, '0e5065400d826092a817b3b42665feec', 'ADEROJU', 'ADEMOYEGA', NULL, '07081605493', '07081605493', '08115502608', 'deroj4j@yahoo.com', NULL, NULL, '2020-07-26 10:21:50', 1, 1, NULL, NULL, '0037534476', '058', 'GTB', '22160367287', NULL, NULL, '2020-07-26 10:21:50', '2020-07-26 10:21:50'),
(28, '6130ff1c454abaf8154de7858020780c', 'NKOYO', 'OGUNDAIRO', NULL, '07039887142', '07039887142', '-', 'nkoyouyo@yahoo.com', NULL, NULL, '2020-07-27 20:49:38', 1, 1, NULL, NULL, '0006088050', '058', 'GTB', '22298409020', NULL, NULL, '2020-07-27 20:49:38', '2020-07-27 20:49:38'),
(29, '7cffa50a91e28dc6f763b15a0c70c1b6', 'JOSEPH', 'MAYA', NULL, '08156183373', '08156183373', '08103021782', 'Josephreubeen2577@gmail.com', NULL, NULL, '2020-07-28 13:41:06', 1, 1, NULL, NULL, '2125147855', '033', 'UBA', '22143213796', NULL, NULL, '2020-07-28 13:41:06', '2020-07-28 13:41:06'),
(30, 'cde1b2e1c11c15e10de58e69ea8a27c1', 'TIWALADE', 'ADEMOYEGA', NULL, '08033127287', '08033127287', '08136022884', 'tiwa01@yahoo.com', NULL, NULL, '2020-08-11 20:44:36', 1, 1, NULL, NULL, '0224041015', '214', 'FCMB', '22141821153', NULL, NULL, '2020-08-11 20:44:36', '2020-08-11 20:44:36'),
(35, 'db4cd03844ce672112b73691e8065f7f', 'Testing', 'Sammy', NULL, '08032122345', '08032122345', '08032122345', 'testing@156cred.com', NULL, NULL, '2021-03-16 13:45:34', 1, 1, NULL, NULL, '1001779238', '057', 'ZENITH', '22190139298', NULL, NULL, '2021-03-16 13:45:34', '2021-03-16 13:45:34');

-- --------------------------------------------------------

--
-- Table structure for table `verifica_warapu`
--

CREATE TABLE `verifica_warapu` (
  `id` int(11) NOT NULL,
  `veri_id` varchar(255) NOT NULL,
  `verification_type` varchar(100) NOT NULL,
  `result_endpoint` text NOT NULL,
  `result_status` tinyint(1) NOT NULL,
  `when_done` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `warapu_bala`
--

CREATE TABLE `warapu_bala` (
  `id` int(11) NOT NULL,
  `bal_id` varchar(255) DEFAULT NULL,
  `client_id` varchar(255) DEFAULT NULL,
  `first_bala` decimal(12,0) DEFAULT NULL,
  `second_bala` decimal(12,0) DEFAULT NULL,
  `lien_status` tinyint(4) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `account_repayment_records`
--
ALTER TABLE `account_repayment_records`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `signature` (`signature`),
  ADD KEY `customer_reference` (`customer_reference`);

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `audit_log`
--
ALTER TABLE `audit_log`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bvn_json`
--
ALTER TABLE `bvn_json`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `chat_return_template`
--
ALTER TABLE `chat_return_template`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `chat_status_tbl`
--
ALTER TABLE `chat_status_tbl`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `completed_transfers`
--
ALTER TABLE `completed_transfers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `loan_id` (`loan_id`(191));

--
-- Indexes for table `defaulter_list`
--
ALTER TABLE `defaulter_list`
  ADD PRIMARY KEY (`id`),
  ADD KEY `client_phone` (`client_phone`);

--
-- Indexes for table `diss_pend`
--
ALTER TABLE `diss_pend`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `diss_pend_log`
--
ALTER TABLE `diss_pend_log`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `email_otp`
--
ALTER TABLE `email_otp`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `existing_users`
--
ALTER TABLE `existing_users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_logins`
--
ALTER TABLE `failed_logins`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `last_logins`
--
ALTER TABLE `last_logins`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `last_logins_old`
--
ALTER TABLE `last_logins_old`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `loans_tbl`
--
ALTER TABLE `loans_tbl`
  ADD PRIMARY KEY (`id`),
  ADD KEY `client_phone` (`client_phone`),
  ADD KEY `unique_id` (`unique_id`);

--
-- Indexes for table `otp`
--
ALTER TABLE `otp`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_log`
--
ALTER TABLE `password_log`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `repayments`
--
ALTER TABLE `repayments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `loan_id` (`unique_id`),
  ADD KEY `client_phone` (`client_phone`);

--
-- Indexes for table `telegram_webhook_tbl`
--
ALTER TABLE `telegram_webhook_tbl`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `transfer_recipients`
--
ALTER TABLE `transfer_recipients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `loan_id` (`loan_id`(191)),
  ADD KEY `reference_code` (`reference_code`(191));

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `mobile_phone_number` (`mobile_phone_number`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `account_repayment_records`
--
ALTER TABLE `account_repayment_records`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `audit_log`
--
ALTER TABLE `audit_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `bvn_json`
--
ALTER TABLE `bvn_json`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `chat_return_template`
--
ALTER TABLE `chat_return_template`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `chat_status_tbl`
--
ALTER TABLE `chat_status_tbl`
  MODIFY `id` bigint(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `completed_transfers`
--
ALTER TABLE `completed_transfers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT for table `email_otp`
--
ALTER TABLE `email_otp`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `existing_users`
--
ALTER TABLE `existing_users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `loans_tbl`
--
ALTER TABLE `loans_tbl`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT for table `otp`
--
ALTER TABLE `otp`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=225;

--
-- AUTO_INCREMENT for table `repayments`
--
ALTER TABLE `repayments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `telegram_webhook_tbl`
--
ALTER TABLE `telegram_webhook_tbl`
  MODIFY `id` bigint(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=126;

--
-- AUTO_INCREMENT for table `transfer_recipients`
--
ALTER TABLE `transfer_recipients`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
