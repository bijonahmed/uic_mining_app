-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 17, 2024 at 05:53 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_uic`
--

-- --------------------------------------------------------

--
-- Table structure for table `brands`
--

CREATE TABLE `brands` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `categorys`
--

CREATE TABLE `categorys` (
  `id` bigint(20) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `percentage_amt` varchar(100) DEFAULT NULL COMMENT '%',
  `store_price` int(11) DEFAULT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `meta_title` varchar(255) DEFAULT NULL,
  `meta_description` text DEFAULT NULL,
  `meta_keyword` varchar(255) DEFAULT NULL,
  `parent_id` int(11) DEFAULT 0,
  `sort_order` int(11) DEFAULT 0,
  `file` varchar(255) DEFAULT NULL,
  `bg_images` varchar(255) DEFAULT NULL,
  `store_images` varchar(255) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `mobile_view_class` varchar(255) DEFAULT NULL,
  `keyword` varchar(255) DEFAULT NULL,
  `created_at` varchar(255) DEFAULT NULL,
  `updated_at` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `community`
--

CREATE TABLE `community` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `community`
--

INSERT INTO `community` (`id`, `name`, `slug`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Community (English)', 'community-english', 1, '2024-05-28 14:05:53', '2024-05-28 14:05:53'),
(2, 'Community (Chinese)', 'community-chinese', 1, '2024-05-28 14:07:25', '2024-05-28 12:10:52'),
(3, 'Community (Arabic)', 'community-arabic', 1, '2024-05-28 14:07:25', '2024-05-28 12:10:52'),
(4, 'Community (Malasian)', 'community-malasian', 1, '2024-05-28 14:07:25', '2024-05-28 12:10:52'),
(5, 'Community (Hindi/Urdu)', 'community-hindi-urdu', 1, '2024-05-28 14:07:25', '2024-05-28 12:10:52');

-- --------------------------------------------------------

--
-- Table structure for table `countdown`
--

CREATE TABLE `countdown` (
  `id` int(11) NOT NULL,
  `start_time` datetime NOT NULL,
  `end_time` datetime NOT NULL,
  `currenttime` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `countdown`
--

INSERT INTO `countdown` (`id`, `start_time`, `end_time`, `currenttime`) VALUES
(1, '2024-05-01 22:25:43', '2024-05-01 22:30:43', '2024-05-26 13:13:19');

-- --------------------------------------------------------

--
-- Table structure for table `country`
--

CREATE TABLE `country` (
  `id` int(11) NOT NULL,
  `shortname` varchar(3) NOT NULL,
  `name` varchar(150) NOT NULL,
  `phonecode` int(11) NOT NULL,
  `status` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `country`
--

INSERT INTO `country` (`id`, `shortname`, `name`, `phonecode`, `status`) VALUES
(1, 'AF', 'Afghanistan', 93, 1),
(2, 'AL', 'Albania', 355, 1),
(3, 'DZ', 'Algeria', 213, 1),
(4, 'AS', 'American Samoa', 1684, 1),
(5, 'AD', 'Andorra', 376, 1),
(6, 'AO', 'Angola', 244, 1),
(7, 'AI', 'Anguilla', 1264, 1),
(8, 'AQ', 'Antarctica', 0, 1),
(9, 'AG', 'Antigua And Barbuda', 1268, 1),
(10, 'AR', 'Argentina', 54, 1),
(11, 'AM', 'Armenia', 374, 1),
(12, 'AW', 'Aruba', 297, 1),
(13, 'AU', 'Australia', 61, 1),
(14, 'AT', 'Austria', 43, 1),
(15, 'AZ', 'Azerbaijan', 994, 1),
(16, 'BS', 'Bahamas The', 1242, 1),
(17, 'BH', 'Bahrain', 973, 1),
(18, 'BD', 'Bangladesh', 880, 1),
(19, 'BB', 'Barbados', 1246, 1),
(20, 'BY', 'Belarus', 375, 1),
(21, 'BE', 'Belgium', 32, 1),
(22, 'BZ', 'Belize', 501, 1),
(23, 'BJ', 'Benin', 229, 1),
(24, 'BM', 'Bermuda', 1441, 1),
(25, 'BT', 'Bhutan', 975, 1),
(26, 'BO', 'Bolivia', 591, 1),
(27, 'BA', 'Bosnia and Herzegovina', 387, 1),
(28, 'BW', 'Botswana', 267, 1),
(29, 'BV', 'Bouvet Island', 0, 1),
(30, 'BR', 'Brazil', 55, 1),
(31, 'IO', 'British Indian Ocean Territory', 246, 1),
(32, 'BN', 'Brunei', 673, 1),
(33, 'BG', 'Bulgaria', 359, 1),
(34, 'BF', 'Burkina Faso', 226, 1),
(35, 'BI', 'Burundi', 257, 1),
(36, 'KH', 'Cambodia', 855, 1),
(37, 'CM', 'Cameroon', 237, 1),
(38, 'CA', 'Canada', 1, 1),
(39, 'CV', 'Cape Verde', 238, 1),
(40, 'KY', 'Cayman Islands', 1345, 1),
(41, 'CF', 'Central African Republic', 236, 1),
(42, 'TD', 'Chad', 235, 1),
(43, 'CL', 'Chile', 56, 1),
(44, 'CN', 'China', 86, 1),
(45, 'CX', 'Christmas Island', 61, 1),
(46, 'CC', 'Cocos (Keeling) Islands', 672, 1),
(47, 'CO', 'Colombia', 57, 1),
(48, 'KM', 'Comoros', 269, 1),
(49, 'CG', 'Republic Of The Congo', 242, 1),
(50, 'CD', 'Democratic Republic Of The Congo', 242, 1),
(51, 'CK', 'Cook Islands', 682, 1),
(52, 'CR', 'Costa Rica', 506, 1),
(53, 'CI', 'Cote D\'Ivoire (Ivory Coast)', 225, 1),
(54, 'HR', 'Croatia (Hrvatska)', 385, 1),
(55, 'CU', 'Cuba', 53, 1),
(56, 'CY', 'Cyprus', 357, 1),
(57, 'CZ', 'Czech Republic', 420, 1),
(58, 'DK', 'Denmark', 45, 1),
(59, 'DJ', 'Djibouti', 253, 1),
(60, 'DM', 'Dominica', 1767, 1),
(61, 'DO', 'Dominican Republic', 1809, 1),
(62, 'TP', 'East Timor', 670, 1),
(63, 'EC', 'Ecuador', 593, 1),
(64, 'EG', 'Egypt', 20, 1),
(65, 'SV', 'El Salvador', 503, 1),
(66, 'GQ', 'Equatorial Guinea', 240, 1),
(67, 'ER', 'Eritrea', 291, 1),
(68, 'EE', 'Estonia', 372, 1),
(69, 'ET', 'Ethiopia', 251, 1),
(70, 'XA', 'External Territories of Australia', 61, 1),
(71, 'FK', 'Falkland Islands', 500, 1),
(72, 'FO', 'Faroe Islands', 298, 1),
(73, 'FJ', 'Fiji Islands', 679, 1),
(74, 'FI', 'Finland', 358, 1),
(75, 'FR', 'France', 33, 1),
(76, 'GF', 'French Guiana', 594, 1),
(77, 'PF', 'French Polynesia', 689, 1),
(78, 'TF', 'French Southern Territories', 0, 1),
(79, 'GA', 'Gabon', 241, 1),
(80, 'GM', 'Gambia The', 220, 1),
(81, 'GE', 'Georgia', 995, 1),
(82, 'DE', 'Germany', 49, 1),
(83, 'GH', 'Ghana', 233, 1),
(84, 'GI', 'Gibraltar', 350, 1),
(85, 'GR', 'Greece', 30, 1),
(86, 'GL', 'Greenland', 299, 1),
(87, 'GD', 'Grenada', 1473, 1),
(88, 'GP', 'Guadeloupe', 590, 1),
(89, 'GU', 'Guam', 1671, 1),
(90, 'GT', 'Guatemala', 502, 1),
(91, 'XU', 'Guernsey and Alderney', 44, 1),
(92, 'GN', 'Guinea', 224, 1),
(93, 'GW', 'Guinea-Bissau', 245, 1),
(94, 'GY', 'Guyana', 592, 1),
(95, 'HT', 'Haiti', 509, 1),
(96, 'HM', 'Heard and McDonald Islands', 0, 1),
(97, 'HN', 'Honduras', 504, 1),
(98, 'HK', 'Hong Kong S.A.R.', 852, 1),
(99, 'HU', 'Hungary', 36, 1),
(100, 'IS', 'Iceland', 354, 1),
(101, 'IN', 'India', 91, 1),
(102, 'ID', 'Indonesia', 62, 1),
(103, 'IR', 'Iran', 98, 1),
(104, 'IQ', 'Iraq', 964, 1),
(105, 'IE', 'Ireland', 353, 1),
(106, 'IL', 'Israel', 972, 1),
(107, 'IT', 'Italy', 39, 1),
(108, 'JM', 'Jamaica', 1876, 1),
(109, 'JP', 'Japan', 81, 1),
(110, 'XJ', 'Jersey', 44, 1),
(111, 'JO', 'Jordan', 962, 1),
(112, 'KZ', 'Kazakhstan', 7, 1),
(113, 'KE', 'Kenya', 254, 1),
(114, 'KI', 'Kiribati', 686, 1),
(115, 'KP', 'Korea North', 850, 1),
(116, 'KR', 'Korea South', 82, 1),
(117, 'KW', 'Kuwait', 965, 1),
(118, 'KG', 'Kyrgyzstan', 996, 1),
(119, 'LA', 'Laos', 856, 1),
(120, 'LV', 'Latvia', 371, 1),
(121, 'LB', 'Lebanon', 961, 1),
(122, 'LS', 'Lesotho', 266, 1),
(123, 'LR', 'Liberia', 231, 1),
(124, 'LY', 'Libya', 218, 1),
(125, 'LI', 'Liechtenstein', 423, 1),
(126, 'LT', 'Lithuania', 370, 1),
(127, 'LU', 'Luxembourg', 352, 1),
(128, 'MO', 'Macau S.A.R.', 853, 1),
(129, 'MK', 'Macedonia', 389, 1),
(130, 'MG', 'Madagascar', 261, 1),
(131, 'MW', 'Malawi', 265, 1),
(132, 'MY', 'Malaysia', 60, 1),
(133, 'MV', 'Maldives', 960, 1),
(134, 'ML', 'Mali', 223, 1),
(135, 'MT', 'Malta', 356, 1),
(136, 'XM', 'Man (Isle of)', 44, 1),
(137, 'MH', 'Marshall Islands', 692, 1),
(138, 'MQ', 'Martinique', 596, 1),
(139, 'MR', 'Mauritania', 222, 1),
(140, 'MU', 'Mauritius', 230, 1),
(141, 'YT', 'Mayotte', 269, 1),
(142, 'MX', 'Mexico', 52, 1),
(143, 'FM', 'Micronesia', 691, 1),
(144, 'MD', 'Moldova', 373, 1),
(145, 'MC', 'Monaco', 377, 1),
(146, 'MN', 'Mongolia', 976, 1),
(147, 'MS', 'Montserrat', 1664, 1),
(148, 'MA', 'Morocco', 212, 1),
(149, 'MZ', 'Mozambique', 258, 1),
(150, 'MM', 'Myanmar', 95, 1),
(151, 'NA', 'Namibia', 264, 1),
(152, 'NR', 'Nauru', 674, 1),
(153, 'NP', 'Nepal', 977, 1),
(154, 'AN', 'Netherlands Antilles', 599, 1),
(155, 'NL', 'Netherlands The', 31, 1),
(156, 'NC', 'New Caledonia', 687, 1),
(157, 'NZ', 'New Zealand', 64, 1),
(158, 'NI', 'Nicaragua', 505, 1),
(159, 'NE', 'Niger', 227, 1),
(160, 'NG', 'Nigeria', 234, 1),
(161, 'NU', 'Niue', 683, 1),
(162, 'NF', 'Norfolk Island', 672, 1),
(163, 'MP', 'Northern Mariana Islands', 1670, 1),
(164, 'NO', 'Norway', 47, 1),
(165, 'OM', 'Oman', 968, 1),
(166, 'PK', 'Pakistan', 92, 1),
(167, 'PW', 'Palau', 680, 1),
(168, 'PS', 'Palestinian Territory Occupied', 970, 1),
(169, 'PA', 'Panama', 507, 1),
(170, 'PG', 'Papua new Guinea', 675, 1),
(171, 'PY', 'Paraguay', 595, 1),
(172, 'PE', 'Peru', 51, 1),
(173, 'PH', 'Philippines', 63, 1),
(174, 'PN', 'Pitcairn Island', 0, 1),
(175, 'PL', 'Poland', 48, 1),
(176, 'PT', 'Portugal', 351, 1),
(177, 'PR', 'Puerto Rico', 1787, 1),
(178, 'QA', 'Qatar', 974, 1),
(179, 'RE', 'Reunion', 262, 1),
(180, 'RO', 'Romania', 40, 1),
(181, 'RU', 'Russia', 70, 1),
(182, 'RW', 'Rwanda', 250, 1),
(183, 'SH', 'Saint Helena', 290, 1),
(184, 'KN', 'Saint Kitts And Nevis', 1869, 1),
(185, 'LC', 'Saint Lucia', 1758, 1),
(186, 'PM', 'Saint Pierre and Miquelon', 508, 1),
(187, 'VC', 'Saint Vincent And The Grenadines', 1784, 1),
(188, 'WS', 'Samoa', 684, 1),
(189, 'SM', 'San Marino', 378, 1),
(190, 'ST', 'Sao Tome and Principe', 239, 1),
(191, 'SA', 'Saudi Arabia', 966, 1),
(192, 'SN', 'Senegal', 221, 1),
(193, 'RS', 'Serbia', 381, 1),
(194, 'SC', 'Seychelles', 248, 1),
(195, 'SL', 'Sierra Leone', 232, 1),
(196, 'SG', 'Singapore', 65, 1),
(197, 'SK', 'Slovakia', 421, 1),
(198, 'SI', 'Slovenia', 386, 1),
(199, 'XG', 'Smaller Territories of the UK', 44, 1),
(200, 'SB', 'Solomon Islands', 677, 1),
(201, 'SO', 'Somalia', 252, 1),
(202, 'ZA', 'South Africa', 27, 1),
(203, 'GS', 'South Georgia', 0, 1),
(204, 'SS', 'South Sudan', 211, 1),
(205, 'ES', 'Spain', 34, 1),
(206, 'LK', 'Sri Lanka', 94, 1),
(207, 'SD', 'Sudan', 249, 1),
(208, 'SR', 'Suriname', 597, 1),
(209, 'SJ', 'Svalbard And Jan Mayen Islands', 47, 1),
(210, 'SZ', 'Swaziland', 268, 1),
(211, 'SE', 'Sweden', 46, 1),
(212, 'CH', 'Switzerland', 41, 1),
(213, 'SY', 'Syria', 963, 1),
(214, 'TW', 'Taiwan', 886, 1),
(215, 'TJ', 'Tajikistan', 992, 1),
(216, 'TZ', 'Tanzania', 255, 1),
(217, 'TH', 'Thailand', 66, 1),
(218, 'TG', 'Togo', 228, 1),
(219, 'TK', 'Tokelau', 690, 1),
(220, 'TO', 'Tonga', 676, 1),
(221, 'TT', 'Trinidad And Tobago', 1868, 1),
(222, 'TN', 'Tunisia', 216, 1),
(223, 'TR', 'Turkey', 90, 1),
(224, 'TM', 'Turkmenistan', 7370, 1),
(225, 'TC', 'Turks And Caicos Islands', 1649, 1),
(226, 'TV', 'Tuvalu', 688, 1),
(227, 'UG', 'Uganda', 256, 1),
(228, 'UA', 'Ukraine', 380, 1),
(229, 'AE', 'United Arab Emirates', 971, 1),
(230, 'GB', 'United Kingdom', 44, 1),
(231, 'US', 'United States', 1, 1),
(232, 'UM', 'United States Minor Outlying Islands', 1, 1),
(233, 'UY', 'Uruguay', 598, 1),
(234, 'UZ', 'Uzbekistan', 998, 1),
(235, 'VU', 'Vanuatu', 678, 1),
(236, 'VA', 'Vatican City State (Holy See)', 39, 1),
(237, 'VE', 'Venezuela', 58, 1),
(238, 'VN', 'Vietnam', 84, 1),
(239, 'VG', 'Virgin Islands (British)', 1284, 1),
(240, 'VI', 'Virgin Islands (US)', 1340, 1),
(241, 'WF', 'Wallis And Futuna Islands', 681, 1),
(242, 'EH', 'Western Sahara', 212, 1),
(243, 'YE', 'Yemen', 967, 1),
(244, 'YU', 'Yugoslavia', 38, 1),
(245, 'ZM', 'Zambia', 260, 1),
(246, 'ZW', 'Zimbabwe', 263, 1);

-- --------------------------------------------------------

--
-- Table structure for table `currency_type`
--

CREATE TABLE `currency_type` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `status` int(11) DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `currency_type`
--

INSERT INTO `currency_type` (`id`, `name`, `status`, `created_at`, `updated_at`) VALUES
(1, 'USDT-TRC20-TRX', 1, '2024-03-21 19:13:11', '2024-03-21 19:13:11'),
(2, 'USDT-ERC20', 1, '2024-03-21 19:13:11', '2024-03-21 19:13:11'),
(3, 'USDT-OMNI', 1, '2024-03-21 19:13:11', '2024-03-21 19:13:11'),
(4, 'BTC', 1, '2024-03-21 19:13:11', '2024-03-21 19:13:11'),
(5, 'LTC', 1, '2024-03-21 19:13:11', '2024-03-21 19:13:11'),
(6, 'ETH', 1, '2024-03-21 19:13:11', '2024-03-21 19:13:11'),
(7, 'TRX', 1, '2024-03-21 19:13:11', '2024-03-21 19:13:11'),
(8, 'ADA', 1, '2024-03-21 19:13:11', '2024-03-21 19:13:11');

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `id` int(11) NOT NULL,
  `name` varchar(225) DEFAULT NULL,
  `addres` varchar(255) DEFAULT NULL,
  `email` varchar(225) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `entry_by` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`id`, `name`, `addres`, `email`, `phone`, `entry_by`, `status`, `created_at`, `updated_at`) VALUES
(3, 'Bijon Ahmed', 'Dhaka', 'mdbijon@gmail.com', '5989899', NULL, 1, '2024-02-12 07:15:21', '2024-02-12 07:15:21'),
(4, 'Sumon Ahmed', 'Dhaka', 'sumon@gmail.com', '5748788', NULL, 1, '2024-02-12 07:20:35', '2024-02-12 07:20:35'),
(5, 'Robiul Islam', NULL, 'robiul@gmail.com', '2365989899', NULL, 1, '2024-02-12 07:31:40', '2024-02-12 07:31:40'),
(6, 'Mohammad Ibraheem', NULL, 'ibraheem@gmail.com', '5987999', NULL, 1, '2024-02-12 07:46:55', '2024-02-12 07:46:55');

-- --------------------------------------------------------

--
-- Table structure for table `customer_history`
--

CREATE TABLE `customer_history` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `deposit`
--

CREATE TABLE `deposit` (
  `id` int(11) NOT NULL,
  `depositID` varchar(255) DEFAULT NULL,
  `trxId` varchar(255) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `deposit_amount` double(10,2) DEFAULT NULL,
  `receivable_amount` double(10,2) DEFAULT NULL,
  `payment_method` varchar(255) DEFAULT NULL,
  `depscription` text DEFAULT NULL,
  `wallet_address` varchar(255) DEFAULT NULL,
  `status` int(11) DEFAULT NULL COMMENT '0=Review,2=Reject,1=Approved',
  `approved_by` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `deposit`
--

INSERT INTO `deposit` (`id`, `depositID`, `trxId`, `user_id`, `deposit_amount`, `receivable_amount`, `payment_method`, `depscription`, `wallet_address`, `status`, `approved_by`, `created_at`, `updated_at`) VALUES
(1, 'D.4a71e49f6bda0c9b7642f39f1aa1f567', 'TPpMvdKfhENfJqYZsDJQLgEopMRBy15jeU', 2, 500.00, 500.00, 'USDT (TRC20)', 'D.4a71e49f6bda0c9b7642f39f1aa1f567', NULL, 1, NULL, '2024-08-16 19:16:02', '2024-08-16 19:16:02');

-- --------------------------------------------------------

--
-- Table structure for table `expense_history`
--

CREATE TABLE `expense_history` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `business_type` varchar(255) DEFAULT NULL,
  `operation_type` varchar(255) DEFAULT NULL,
  `amount_type` varchar(255) DEFAULT NULL,
  `operation_amount` double(10,2) DEFAULT NULL,
  `charge_description` varchar(255) DEFAULT NULL,
  `operation_date` date DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `expense_history`
--

INSERT INTO `expense_history` (`id`, `user_id`, `business_type`, `operation_type`, `amount_type`, `operation_amount`, `charge_description`, `operation_date`, `created_at`, `updated_at`) VALUES
(1, 20, NULL, 'Debited', NULL, 2.00, 'ddd [ID: 1] ', '2024-06-22', '2024-06-22 06:59:05', '2024-06-22 06:59:05'),
(2, 20, NULL, 'Debited', NULL, 5.00, 'sss [ID: 2] ', '2024-06-22', '2024-06-22 07:07:37', '2024-06-22 07:07:37'),
(3, 20, NULL, 'Credited', NULL, 2.00, 'dd [ID: 3] ', '2024-06-22', '2024-06-22 07:15:18', '2024-06-22 07:15:18'),
(4, 20, NULL, 'Credited', NULL, 2.00, 'ffff [ID: 4] ', '2024-06-22', '2024-06-22 07:18:42', '2024-06-22 07:18:42'),
(5, 20, NULL, 'Credited', NULL, 2.00, 'fffffffffffffff [ID: 5] ', '2024-06-22', '2024-06-22 07:19:08', '2024-06-22 07:19:08'),
(6, 20, NULL, 'Debited', NULL, 5.00, 'Test [ID: 1] ', '2024-06-22', '2024-06-22 07:24:36', '2024-06-22 07:24:36'),
(7, 3, NULL, 'Debited', NULL, 5.00, 'ssss [ID: 2] ', '2024-06-22', '2024-06-22 07:25:46', '2024-06-22 07:25:46'),
(8, 3, NULL, 'Credited', NULL, 1.00, 'fff [ID: 3] ', '2024-06-22', '2024-06-22 07:27:10', '2024-06-22 07:27:10');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `reserved_at` timestamp NULL DEFAULT NULL,
  `available_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `jobs`
--

INSERT INTO `jobs` (`id`, `queue`, `payload`, `attempts`, `reserved_at`, `available_at`, `created_at`) VALUES
(13, 'default', '{\"uuid\":\"4a1615bf-f642-4ce8-9e74-72838c6d3c65\",\"displayName\":\"App\\\\Events\\\\Message\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":14:{s:5:\\\"event\\\";O:18:\\\"App\\\\Events\\\\Message\\\":4:{s:8:\\\"username\\\";s:17:\\\"community-english\\\";s:7:\\\"message\\\";s:5:\\\"Hello\\\";s:14:\\\"community_slug\\\";s:17:\\\"community-english\\\";s:10:\\\"created_at\\\";s:19:\\\"2024-06-06 01:58:39\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}\"}}', 0, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(14, 'default', '{\"uuid\":\"eab8104d-9c21-4293-9997-6d46008af46f\",\"displayName\":\"App\\\\Events\\\\Message\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":14:{s:5:\\\"event\\\";O:18:\\\"App\\\\Events\\\\Message\\\":4:{s:8:\\\"username\\\";s:17:\\\"community-english\\\";s:7:\\\"message\\\";s:3:\\\"Yes\\\";s:14:\\\"community_slug\\\";s:17:\\\"community-english\\\";s:10:\\\"created_at\\\";s:19:\\\"2024-06-06 01:59:03\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}\"}}', 0, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(15, 'default', '{\"uuid\":\"e402aa49-7b1f-4b35-bc4d-3f1337901dd4\",\"displayName\":\"App\\\\Events\\\\Message\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":14:{s:5:\\\"event\\\";O:18:\\\"App\\\\Events\\\\Message\\\":4:{s:8:\\\"username\\\";s:17:\\\"community-english\\\";s:7:\\\"message\\\";s:5:\\\"sdfdf\\\";s:14:\\\"community_slug\\\";s:17:\\\"community-english\\\";s:10:\\\"created_at\\\";s:19:\\\"2024-06-06 01:59:33\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}\"}}', 0, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(16, 'default', '{\"uuid\":\"a80db167-34d1-4955-8487-52bd5bb4e818\",\"displayName\":\"App\\\\Events\\\\Message\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":14:{s:5:\\\"event\\\";O:18:\\\"App\\\\Events\\\\Message\\\":4:{s:8:\\\"username\\\";s:17:\\\"community-english\\\";s:7:\\\"message\\\";s:5:\\\"Hello\\\";s:14:\\\"community_slug\\\";s:17:\\\"community-english\\\";s:10:\\\"created_at\\\";s:19:\\\"2024-06-06 02:02:38\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}\"}}', 0, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(17, 'default', '{\"uuid\":\"9596de02-407b-40b1-bc00-ca20a2c7ccf1\",\"displayName\":\"App\\\\Events\\\\Message\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":14:{s:5:\\\"event\\\";O:18:\\\"App\\\\Events\\\\Message\\\":4:{s:8:\\\"username\\\";s:17:\\\"community-english\\\";s:7:\\\"message\\\";s:5:\\\"hello\\\";s:14:\\\"community_slug\\\";s:17:\\\"community-english\\\";s:10:\\\"created_at\\\";s:19:\\\"2024-06-06 02:03:24\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}\"}}', 0, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(18, 'default', '{\"uuid\":\"4f4ff34d-b234-49cb-811d-78dbf26ecf08\",\"displayName\":\"App\\\\Events\\\\Message\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":14:{s:5:\\\"event\\\";O:18:\\\"App\\\\Events\\\\Message\\\":4:{s:8:\\\"username\\\";s:17:\\\"community-english\\\";s:7:\\\"message\\\";s:7:\\\"yes sir\\\";s:14:\\\"community_slug\\\";s:17:\\\"community-english\\\";s:10:\\\"created_at\\\";s:19:\\\"2024-06-06 02:03:33\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}\"}}', 0, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(19, 'default', '{\"uuid\":\"dbf42b35-704a-4fb8-a15a-db6082edf2e5\",\"displayName\":\"App\\\\Events\\\\Message\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":14:{s:5:\\\"event\\\";O:18:\\\"App\\\\Events\\\\Message\\\":4:{s:8:\\\"username\\\";s:17:\\\"community-english\\\";s:7:\\\"message\\\";s:6:\\\"Hi sir\\\";s:14:\\\"community_slug\\\";s:17:\\\"community-english\\\";s:10:\\\"created_at\\\";s:19:\\\"2024-06-06 02:04:03\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}\"}}', 0, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(20, 'default', '{\"uuid\":\"15687e4b-943c-4ed7-bfcc-ea12ce09c791\",\"displayName\":\"App\\\\Events\\\\Message\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":14:{s:5:\\\"event\\\";O:18:\\\"App\\\\Events\\\\Message\\\":4:{s:8:\\\"username\\\";s:17:\\\"community-english\\\";s:7:\\\"message\\\";s:3:\\\"jan\\\";s:14:\\\"community_slug\\\";s:17:\\\"community-english\\\";s:10:\\\"created_at\\\";s:19:\\\"2024-06-06 02:06:51\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}\"}}', 0, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(21, 'default', '{\"uuid\":\"0e3a81ae-2261-4207-877b-1e8202579ca7\",\"displayName\":\"App\\\\Events\\\\Message\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":14:{s:5:\\\"event\\\";O:18:\\\"App\\\\Events\\\\Message\\\":4:{s:8:\\\"username\\\";s:17:\\\"community-english\\\";s:7:\\\"message\\\";s:3:\\\"fan\\\";s:14:\\\"community_slug\\\";s:17:\\\"community-english\\\";s:10:\\\"created_at\\\";s:19:\\\"2024-06-06 02:06:55\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}\"}}', 0, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(22, 'default', '{\"uuid\":\"cd355eba-314e-4c7f-94cc-f1452eba15cb\",\"displayName\":\"App\\\\Events\\\\Message\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":14:{s:5:\\\"event\\\";O:18:\\\"App\\\\Events\\\\Message\\\":4:{s:8:\\\"username\\\";s:17:\\\"community-english\\\";s:7:\\\"message\\\";s:2:\\\"Hi\\\";s:14:\\\"community_slug\\\";s:17:\\\"community-english\\\";s:10:\\\"created_at\\\";s:19:\\\"2024-06-06 02:07:41\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}\"}}', 0, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(23, 'default', '{\"uuid\":\"d4dc0f7c-f81a-4648-9eea-afa036a8f8fd\",\"displayName\":\"App\\\\Events\\\\Message\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":14:{s:5:\\\"event\\\";O:18:\\\"App\\\\Events\\\\Message\\\":4:{s:8:\\\"username\\\";s:17:\\\"community-english\\\";s:7:\\\"message\\\";s:6:\\\"Hellow\\\";s:14:\\\"community_slug\\\";s:17:\\\"community-english\\\";s:10:\\\"created_at\\\";s:19:\\\"2024-06-06 02:07:46\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}\"}}', 0, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(24, 'default', '{\"uuid\":\"9e95a41e-1a55-4fd7-9c90-cda8f2792bdf\",\"displayName\":\"App\\\\Events\\\\Message\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":14:{s:5:\\\"event\\\";O:18:\\\"App\\\\Events\\\\Message\\\":4:{s:8:\\\"username\\\";s:17:\\\"community-english\\\";s:7:\\\"message\\\";s:2:\\\"hi\\\";s:14:\\\"community_slug\\\";s:17:\\\"community-english\\\";s:10:\\\"created_at\\\";s:19:\\\"2024-06-06 02:08:45\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}\"}}', 0, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(25, 'default', '{\"uuid\":\"6a2afdcc-a0ca-446d-a9ec-5a36a3132596\",\"displayName\":\"App\\\\Events\\\\Message\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":14:{s:5:\\\"event\\\";O:18:\\\"App\\\\Events\\\\Message\\\":4:{s:8:\\\"username\\\";s:17:\\\"community-english\\\";s:7:\\\"message\\\";s:3:\\\"sir\\\";s:14:\\\"community_slug\\\";s:17:\\\"community-english\\\";s:10:\\\"created_at\\\";s:19:\\\"2024-06-06 02:08:47\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}\"}}', 0, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(26, 'default', '{\"uuid\":\"a1d0ad52-cead-413a-bd56-10574c9a32ee\",\"displayName\":\"App\\\\Events\\\\Message\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":14:{s:5:\\\"event\\\";O:18:\\\"App\\\\Events\\\\Message\\\":4:{s:8:\\\"username\\\";s:17:\\\"community-english\\\";s:7:\\\"message\\\";s:8:\\\"dddddddd\\\";s:14:\\\"community_slug\\\";s:17:\\\"community-english\\\";s:10:\\\"created_at\\\";s:19:\\\"2024-06-06 02:12:19\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}\"}}', 0, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(27, 'default', '{\"uuid\":\"9658de26-b110-4169-a534-04dfa3db0ca5\",\"displayName\":\"App\\\\Events\\\\Message\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":14:{s:5:\\\"event\\\";O:18:\\\"App\\\\Events\\\\Message\\\":4:{s:8:\\\"username\\\";s:17:\\\"community-english\\\";s:7:\\\"message\\\";s:2:\\\"hi\\\";s:14:\\\"community_slug\\\";s:17:\\\"community-english\\\";s:10:\\\"created_at\\\";s:19:\\\"2024-06-06 02:13:51\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}\"}}', 0, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(28, 'default', '{\"uuid\":\"9e21bdba-93ec-475f-8eb6-78b1c351a525\",\"displayName\":\"App\\\\Events\\\\Message\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":14:{s:5:\\\"event\\\";O:18:\\\"App\\\\Events\\\\Message\\\":4:{s:8:\\\"username\\\";s:17:\\\"community-english\\\";s:7:\\\"message\\\";s:4:\\\"jobs\\\";s:14:\\\"community_slug\\\";s:17:\\\"community-english\\\";s:10:\\\"created_at\\\";s:19:\\\"2024-06-06 02:13:54\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}\"}}', 0, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(29, 'default', '{\"uuid\":\"0ec6915e-7e3c-4aa7-aa74-f678682426bd\",\"displayName\":\"App\\\\Events\\\\Message\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":14:{s:5:\\\"event\\\";O:18:\\\"App\\\\Events\\\\Message\\\":4:{s:8:\\\"username\\\";s:17:\\\"community-chinese\\\";s:7:\\\"message\\\";s:3:\\\"sir\\\";s:14:\\\"community_slug\\\";s:17:\\\"community-chinese\\\";s:10:\\\"created_at\\\";s:19:\\\"2024-06-06 02:14:05\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}\"}}', 0, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(30, 'default', '{\"uuid\":\"c085f739-a414-4e51-b69e-b5263ee5a938\",\"displayName\":\"App\\\\Events\\\\Message\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":14:{s:5:\\\"event\\\";O:18:\\\"App\\\\Events\\\\Message\\\":4:{s:8:\\\"username\\\";s:17:\\\"community-english\\\";s:7:\\\"message\\\";s:4:\\\"dfdf\\\";s:14:\\\"community_slug\\\";s:17:\\\"community-english\\\";s:10:\\\"created_at\\\";s:19:\\\"2024-06-06 02:16:34\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}\"}}', 0, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(31, 'default', '{\"uuid\":\"e0f98236-1ffd-494b-8741-6cc083c5b586\",\"displayName\":\"App\\\\Events\\\\Message\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":14:{s:5:\\\"event\\\";O:18:\\\"App\\\\Events\\\\Message\\\":4:{s:8:\\\"username\\\";s:17:\\\"community-english\\\";s:7:\\\"message\\\";s:4:\\\"jobs\\\";s:14:\\\"community_slug\\\";s:17:\\\"community-english\\\";s:10:\\\"created_at\\\";s:19:\\\"2024-06-06 02:18:14\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}\"}}', 0, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(32, 'default', '{\"uuid\":\"a23a8fcf-6d59-4c01-ba4e-1d7502f2dcc8\",\"displayName\":\"App\\\\Events\\\\Message\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":14:{s:5:\\\"event\\\";O:18:\\\"App\\\\Events\\\\Message\\\":4:{s:8:\\\"username\\\";s:17:\\\"community-english\\\";s:7:\\\"message\\\";s:3:\\\"yes\\\";s:14:\\\"community_slug\\\";s:17:\\\"community-english\\\";s:10:\\\"created_at\\\";s:19:\\\"2024-06-06 02:18:32\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}\"}}', 0, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(33, 'default', '{\"uuid\":\"41e2d336-792a-455f-9112-045775bc9e7c\",\"displayName\":\"App\\\\Events\\\\Message\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":14:{s:5:\\\"event\\\";O:18:\\\"App\\\\Events\\\\Message\\\":4:{s:8:\\\"username\\\";s:17:\\\"community-english\\\";s:7:\\\"message\\\";s:3:\\\"sir\\\";s:14:\\\"community_slug\\\";s:17:\\\"community-english\\\";s:10:\\\"created_at\\\";s:19:\\\"2024-06-06 02:18:35\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}\"}}', 0, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(34, 'default', '{\"uuid\":\"8e899eb5-76ba-4113-90c4-e32980ccb167\",\"displayName\":\"App\\\\Events\\\\Message\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":14:{s:5:\\\"event\\\";O:18:\\\"App\\\\Events\\\\Message\\\":4:{s:8:\\\"username\\\";s:17:\\\"community-english\\\";s:7:\\\"message\\\";s:9:\\\"Bijon-123\\\";s:14:\\\"community_slug\\\";s:17:\\\"community-english\\\";s:10:\\\"created_at\\\";s:19:\\\"2024-06-06 02:19:48\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}\"}}', 0, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(35, 'default', '{\"uuid\":\"41a3f48f-46d2-44a2-bd48-8319babe8870\",\"displayName\":\"App\\\\Events\\\\Message\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":14:{s:5:\\\"event\\\";O:18:\\\"App\\\\Events\\\\Message\\\":4:{s:8:\\\"username\\\";s:17:\\\"community-english\\\";s:7:\\\"message\\\";s:10:\\\"replay 123\\\";s:14:\\\"community_slug\\\";s:17:\\\"community-english\\\";s:10:\\\"created_at\\\";s:19:\\\"2024-06-06 02:20:06\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}\"}}', 0, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(36, 'default', '{\"uuid\":\"45794401-b15b-4509-974c-44e45d30015e\",\"displayName\":\"App\\\\Events\\\\Message\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":14:{s:5:\\\"event\\\";O:18:\\\"App\\\\Events\\\\Message\\\":4:{s:8:\\\"username\\\";s:17:\\\"community-english\\\";s:7:\\\"message\\\";s:2:\\\"ee\\\";s:14:\\\"community_slug\\\";s:17:\\\"community-english\\\";s:10:\\\"created_at\\\";s:19:\\\"2024-06-06 02:31:18\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}\"}}', 0, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(37, 'default', '{\"uuid\":\"3d005c50-d22f-4658-ada6-fde2a7427116\",\"displayName\":\"App\\\\Events\\\\Message\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":14:{s:5:\\\"event\\\";O:18:\\\"App\\\\Events\\\\Message\\\":4:{s:8:\\\"username\\\";s:11:\\\"b@gmail.com\\\";s:7:\\\"message\\\";s:23:\\\"yes sir i\'m okay please\\\";s:14:\\\"community_slug\\\";s:17:\\\"community-english\\\";s:10:\\\"created_at\\\";s:19:\\\"2024-06-06 03:02:01\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}\"}}', 0, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(38, 'default', '{\"uuid\":\"ab9ef50a-53b3-49ef-a9fa-4d4ba00371f8\",\"displayName\":\"App\\\\Events\\\\Message\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":14:{s:5:\\\"event\\\";O:18:\\\"App\\\\Events\\\\Message\\\":4:{s:8:\\\"username\\\";s:11:\\\"b@gmail.com\\\";s:7:\\\"message\\\";s:2:\\\"HI\\\";s:14:\\\"community_slug\\\";s:17:\\\"community-english\\\";s:10:\\\"created_at\\\";s:19:\\\"2024-06-09 19:06:11\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}\"}}', 0, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(39, 'default', '{\"uuid\":\"27f85701-f27d-4470-baee-8c82467f364f\",\"displayName\":\"App\\\\Events\\\\Message\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":14:{s:5:\\\"event\\\";O:18:\\\"App\\\\Events\\\\Message\\\":4:{s:8:\\\"username\\\";s:11:\\\"b@gmail.com\\\";s:7:\\\"message\\\";s:5:\\\"hello\\\";s:14:\\\"community_slug\\\";s:17:\\\"community-english\\\";s:10:\\\"created_at\\\";s:19:\\\"2024-06-09 21:45:48\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}\"}}', 0, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(40, 'default', '{\"uuid\":\"096c54dd-97e8-4856-a866-756c99e5a5bc\",\"displayName\":\"App\\\\Events\\\\Message\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":14:{s:5:\\\"event\\\";O:18:\\\"App\\\\Events\\\\Message\\\":4:{s:8:\\\"username\\\";s:11:\\\"b@gmail.com\\\";s:7:\\\"message\\\";s:17:\\\"bijon how are you\\\";s:14:\\\"community_slug\\\";s:17:\\\"community-english\\\";s:10:\\\"created_at\\\";s:19:\\\"2024-06-09 21:45:55\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}\"}}', 0, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(41, 'default', '{\"uuid\":\"c3e32242-05f3-4290-ac7d-cc1f0ab8e18b\",\"displayName\":\"App\\\\Events\\\\Message\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":14:{s:5:\\\"event\\\";O:18:\\\"App\\\\Events\\\\Message\\\":4:{s:8:\\\"username\\\";s:11:\\\"b@gmail.com\\\";s:7:\\\"message\\\";s:2:\\\"Hi\\\";s:14:\\\"community_slug\\\";s:17:\\\"community-english\\\";s:10:\\\"created_at\\\";s:19:\\\"2024-06-10 14:40:42\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}\"}}', 0, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(42, 'default', '{\"uuid\":\"e916c233-dc8c-4071-8ae7-f9cd3331f382\",\"displayName\":\"App\\\\Events\\\\Message\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":14:{s:5:\\\"event\\\";O:18:\\\"App\\\\Events\\\\Message\\\":4:{s:8:\\\"username\\\";s:11:\\\"b@gmail.com\\\";s:7:\\\"message\\\";s:2:\\\"Hi\\\";s:14:\\\"community_slug\\\";s:17:\\\"community-english\\\";s:10:\\\"created_at\\\";s:19:\\\"2024-06-10 14:42:28\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}\"}}', 0, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(43, 'default', '{\"uuid\":\"c1ea0e7b-2b83-4155-8fea-2eccbe94db1b\",\"displayName\":\"App\\\\Events\\\\Message\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":14:{s:5:\\\"event\\\";O:18:\\\"App\\\\Events\\\\Message\\\":4:{s:8:\\\"username\\\";s:11:\\\"b@gmail.com\\\";s:7:\\\"message\\\";s:2:\\\"Hi\\\";s:14:\\\"community_slug\\\";s:17:\\\"community-english\\\";s:10:\\\"created_at\\\";s:19:\\\"2024-06-10 14:44:15\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}\"}}', 0, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(44, 'default', '{\"uuid\":\"02e6ef45-7465-4e40-9e00-1f2c380532ed\",\"displayName\":\"App\\\\Events\\\\Message\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":14:{s:5:\\\"event\\\";O:18:\\\"App\\\\Events\\\\Message\\\":4:{s:8:\\\"username\\\";s:11:\\\"b@gmail.com\\\";s:7:\\\"message\\\";s:4:\\\"Boss\\\";s:14:\\\"community_slug\\\";s:17:\\\"community-english\\\";s:10:\\\"created_at\\\";s:19:\\\"2024-06-10 14:44:19\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}\"}}', 0, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(45, 'default', '{\"uuid\":\"d2449b15-4e86-4079-ac4c-77500e3127b1\",\"displayName\":\"App\\\\Events\\\\Message\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":14:{s:5:\\\"event\\\";O:18:\\\"App\\\\Events\\\\Message\\\":4:{s:8:\\\"username\\\";s:11:\\\"b@gmail.com\\\";s:7:\\\"message\\\";s:2:\\\"hi\\\";s:14:\\\"community_slug\\\";s:17:\\\"community-english\\\";s:10:\\\"created_at\\\";s:19:\\\"2024-06-10 15:12:04\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}\"}}', 0, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(46, 'default', '{\"uuid\":\"17845229-b970-4ac7-a330-04c3ffc8d669\",\"displayName\":\"App\\\\Events\\\\Message\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":14:{s:5:\\\"event\\\";O:18:\\\"App\\\\Events\\\\Message\\\":4:{s:8:\\\"username\\\";s:11:\\\"b@gmail.com\\\";s:7:\\\"message\\\";s:7:\\\"brother\\\";s:14:\\\"community_slug\\\";s:17:\\\"community-english\\\";s:10:\\\"created_at\\\";s:19:\\\"2024-06-10 15:12:06\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}\"}}', 0, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(47, 'default', '{\"uuid\":\"2895aaf9-dd89-4033-9c37-0ae6de4456c8\",\"displayName\":\"App\\\\Events\\\\Message\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":14:{s:5:\\\"event\\\";O:18:\\\"App\\\\Events\\\\Message\\\":4:{s:8:\\\"username\\\";s:11:\\\"b@gmail.com\\\";s:7:\\\"message\\\";s:5:\\\"hello\\\";s:14:\\\"community_slug\\\";s:17:\\\"community-english\\\";s:10:\\\"created_at\\\";s:19:\\\"2024-06-10 15:12:18\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}\"}}', 0, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(48, 'default', '{\"uuid\":\"5719b703-c8c4-4495-b38b-675445055e20\",\"displayName\":\"App\\\\Events\\\\Message\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":14:{s:5:\\\"event\\\";O:18:\\\"App\\\\Events\\\\Message\\\":4:{s:8:\\\"username\\\";s:11:\\\"b@gmail.com\\\";s:7:\\\"message\\\";s:2:\\\"hi\\\";s:14:\\\"community_slug\\\";s:17:\\\"community-english\\\";s:10:\\\"created_at\\\";s:19:\\\"2024-06-10 15:13:12\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}\"}}', 0, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(49, 'default', '{\"uuid\":\"98b3b464-04ce-43c6-ba80-767463e7ca94\",\"displayName\":\"App\\\\Events\\\\Message\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":14:{s:5:\\\"event\\\";O:18:\\\"App\\\\Events\\\\Message\\\":4:{s:8:\\\"username\\\";s:11:\\\"b@gmail.com\\\";s:7:\\\"message\\\";s:2:\\\"hi\\\";s:14:\\\"community_slug\\\";s:17:\\\"community-english\\\";s:10:\\\"created_at\\\";s:19:\\\"2024-06-10 15:13:43\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}\"}}', 0, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(50, 'default', '{\"uuid\":\"9e761fef-7537-4f1c-a996-1669ebe7c0bb\",\"displayName\":\"App\\\\Events\\\\Message\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":14:{s:5:\\\"event\\\";O:18:\\\"App\\\\Events\\\\Message\\\":4:{s:8:\\\"username\\\";s:11:\\\"b@gmail.com\\\";s:7:\\\"message\\\";s:6:\\\"y3oo9\\\\\\\";s:14:\\\"community_slug\\\";s:17:\\\"community-english\\\";s:10:\\\"created_at\\\";s:19:\\\"2024-06-10 15:20:40\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}\"}}', 0, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(51, 'default', '{\"uuid\":\"b8de1f46-121a-4827-8bae-acea4664831d\",\"displayName\":\"App\\\\Events\\\\Message\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":14:{s:5:\\\"event\\\";O:18:\\\"App\\\\Events\\\\Message\\\":4:{s:8:\\\"username\\\";s:11:\\\"b@gmail.com\\\";s:7:\\\"message\\\";s:2:\\\"hi\\\";s:14:\\\"community_slug\\\";s:17:\\\"community-english\\\";s:10:\\\"created_at\\\";s:19:\\\"2024-06-10 15:20:44\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}\"}}', 0, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(52, 'default', '{\"uuid\":\"77b24644-e3ed-4580-adf3-c970200f9c58\",\"displayName\":\"App\\\\Events\\\\Message\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":14:{s:5:\\\"event\\\";O:18:\\\"App\\\\Events\\\\Message\\\":4:{s:8:\\\"username\\\";s:11:\\\"b@gmail.com\\\";s:7:\\\"message\\\";s:5:\\\"hello\\\";s:14:\\\"community_slug\\\";s:17:\\\"community-english\\\";s:10:\\\"created_at\\\";s:19:\\\"2024-06-10 15:21:14\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}\"}}', 0, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(53, 'default', '{\"uuid\":\"48aa4c1e-e4fb-4c41-a2ab-ad01ffa5e7da\",\"displayName\":\"App\\\\Events\\\\Message\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":14:{s:5:\\\"event\\\";O:18:\\\"App\\\\Events\\\\Message\\\":4:{s:8:\\\"username\\\";s:11:\\\"b@gmail.com\\\";s:7:\\\"message\\\";s:11:\\\"hello bijon\\\";s:14:\\\"community_slug\\\";s:17:\\\"community-english\\\";s:10:\\\"created_at\\\";s:19:\\\"2024-06-10 15:21:30\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}\"}}', 0, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(54, 'default', '{\"uuid\":\"3744498e-5aaa-45f8-bbb9-cbcdf65150d9\",\"displayName\":\"App\\\\Events\\\\Message\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":14:{s:5:\\\"event\\\";O:18:\\\"App\\\\Events\\\\Message\\\":4:{s:8:\\\"username\\\";s:11:\\\"b@gmail.com\\\";s:7:\\\"message\\\";s:5:\\\"bijon\\\";s:14:\\\"community_slug\\\";s:17:\\\"community-english\\\";s:10:\\\"created_at\\\";s:19:\\\"2024-06-10 15:22:36\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}\"}}', 0, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(55, 'default', '{\"uuid\":\"0cd3c3ba-a690-42c2-8444-7854d4a2b31b\",\"displayName\":\"App\\\\Events\\\\Message\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":14:{s:5:\\\"event\\\";O:18:\\\"App\\\\Events\\\\Message\\\":4:{s:8:\\\"username\\\";s:11:\\\"b@gmail.com\\\";s:7:\\\"message\\\";s:6:\\\"hellow\\\";s:14:\\\"community_slug\\\";s:17:\\\"community-english\\\";s:10:\\\"created_at\\\";s:19:\\\"2024-06-10 15:22:40\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}\"}}', 0, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(56, 'default', '{\"uuid\":\"70bd8a46-4556-42ea-b348-5783990a549a\",\"displayName\":\"App\\\\Events\\\\Message\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":14:{s:5:\\\"event\\\";O:18:\\\"App\\\\Events\\\\Message\\\":4:{s:8:\\\"username\\\";s:11:\\\"b@gmail.com\\\";s:7:\\\"message\\\";s:19:\\\"respons not working\\\";s:14:\\\"community_slug\\\";s:17:\\\"community-english\\\";s:10:\\\"created_at\\\";s:19:\\\"2024-06-10 15:22:46\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}\"}}', 0, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(57, 'default', '{\"uuid\":\"52a060d4-244f-459e-8a57-cb995f5b782e\",\"displayName\":\"App\\\\Events\\\\Message\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":14:{s:5:\\\"event\\\";O:18:\\\"App\\\\Events\\\\Message\\\":4:{s:8:\\\"username\\\";s:11:\\\"b@gmail.com\\\";s:7:\\\"message\\\";s:5:\\\"hello\\\";s:14:\\\"community_slug\\\";s:17:\\\"community-english\\\";s:10:\\\"created_at\\\";s:19:\\\"2024-06-10 15:24:06\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}\"}}', 0, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `jobs` (`id`, `queue`, `payload`, `attempts`, `reserved_at`, `available_at`, `created_at`) VALUES
(58, 'default', '{\"uuid\":\"be149726-c32b-46c4-9ba4-3c8812b03d52\",\"displayName\":\"App\\\\Events\\\\Message\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":14:{s:5:\\\"event\\\";O:18:\\\"App\\\\Events\\\\Message\\\":4:{s:8:\\\"username\\\";s:11:\\\"b@gmail.com\\\";s:7:\\\"message\\\";s:5:\\\"jonbs\\\";s:14:\\\"community_slug\\\";s:17:\\\"community-english\\\";s:10:\\\"created_at\\\";s:19:\\\"2024-06-10 15:24:10\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}\"}}', 0, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(59, 'default', '{\"uuid\":\"e7174690-70f9-4721-9436-351677682980\",\"displayName\":\"App\\\\Events\\\\Message\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":14:{s:5:\\\"event\\\";O:18:\\\"App\\\\Events\\\\Message\\\":4:{s:8:\\\"username\\\";s:11:\\\"b@gmail.com\\\";s:7:\\\"message\\\";s:3:\\\"hei\\\";s:14:\\\"community_slug\\\";s:17:\\\"community-english\\\";s:10:\\\"created_at\\\";s:19:\\\"2024-06-10 15:24:33\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}\"}}', 0, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(60, 'default', '{\"uuid\":\"c5f86709-097a-4516-b433-638614874086\",\"displayName\":\"App\\\\Events\\\\Message\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":14:{s:5:\\\"event\\\";O:18:\\\"App\\\\Events\\\\Message\\\":4:{s:8:\\\"username\\\";s:11:\\\"b@gmail.com\\\";s:7:\\\"message\\\";s:5:\\\"hello\\\";s:14:\\\"community_slug\\\";s:17:\\\"community-english\\\";s:10:\\\"created_at\\\";s:19:\\\"2024-06-10 15:25:02\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}\"}}', 0, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(61, 'default', '{\"uuid\":\"30b72e0f-553f-4bc1-9d6e-e8eda1464b3e\",\"displayName\":\"App\\\\Events\\\\Message\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":14:{s:5:\\\"event\\\";O:18:\\\"App\\\\Events\\\\Message\\\":4:{s:8:\\\"username\\\";s:11:\\\"b@gmail.com\\\";s:7:\\\"message\\\";s:3:\\\"555\\\";s:14:\\\"community_slug\\\";s:17:\\\"community-english\\\";s:10:\\\"created_at\\\";s:19:\\\"2024-06-10 19:39:31\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}\"}}', 0, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(62, 'default', '{\"uuid\":\"770e7d4d-4412-4444-82e0-17b03414822e\",\"displayName\":\"App\\\\Events\\\\Message\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":14:{s:5:\\\"event\\\";O:18:\\\"App\\\\Events\\\\Message\\\":4:{s:8:\\\"username\\\";s:11:\\\"b@gmail.com\\\";s:7:\\\"message\\\";s:3:\\\"ddf\\\";s:14:\\\"community_slug\\\";s:17:\\\"community-english\\\";s:10:\\\"created_at\\\";s:19:\\\"2024-06-10 19:48:07\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}\"}}', 0, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(63, 'default', '{\"uuid\":\"b0758466-8da5-49b9-a9ed-1ed9102ad847\",\"displayName\":\"App\\\\Events\\\\Message\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":14:{s:5:\\\"event\\\";O:18:\\\"App\\\\Events\\\\Message\\\":4:{s:8:\\\"username\\\";s:11:\\\"b@gmail.com\\\";s:7:\\\"message\\\";s:5:\\\"jobns\\\";s:14:\\\"community_slug\\\";s:17:\\\"community-english\\\";s:10:\\\"created_at\\\";s:19:\\\"2024-06-10 19:48:20\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}\"}}', 0, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(64, 'default', '{\"uuid\":\"18fcfde3-6904-4df9-87f4-22f26a0c9e1f\",\"displayName\":\"App\\\\Events\\\\Message\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":14:{s:5:\\\"event\\\";O:18:\\\"App\\\\Events\\\\Message\\\":4:{s:8:\\\"username\\\";s:11:\\\"b@gmail.com\\\";s:7:\\\"message\\\";s:5:\\\"hello\\\";s:14:\\\"community_slug\\\";s:17:\\\"community-english\\\";s:10:\\\"created_at\\\";s:19:\\\"2024-06-10 19:51:22\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}\"}}', 0, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(65, 'default', '{\"uuid\":\"b786c989-d209-4d37-8e1d-86994cd00987\",\"displayName\":\"App\\\\Events\\\\Message\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":14:{s:5:\\\"event\\\";O:18:\\\"App\\\\Events\\\\Message\\\":4:{s:8:\\\"username\\\";s:11:\\\"b@gmail.com\\\";s:7:\\\"message\\\";s:4:\\\"boss\\\";s:14:\\\"community_slug\\\";s:17:\\\"community-english\\\";s:10:\\\"created_at\\\";s:19:\\\"2024-06-10 19:51:25\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}\"}}', 0, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(66, 'default', '{\"uuid\":\"47391a7c-da9d-4184-b780-e0d0a334f73a\",\"displayName\":\"App\\\\Events\\\\Message\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":14:{s:5:\\\"event\\\";O:18:\\\"App\\\\Events\\\\Message\\\":4:{s:8:\\\"username\\\";s:11:\\\"b@gmail.com\\\";s:7:\\\"message\\\";s:4:\\\"jons\\\";s:14:\\\"community_slug\\\";s:17:\\\"community-english\\\";s:10:\\\"created_at\\\";s:19:\\\"2024-06-10 19:53:02\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}\"}}', 0, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(67, 'default', '{\"uuid\":\"b18121ce-c919-4503-a5dc-c3a9033f7151\",\"displayName\":\"App\\\\Events\\\\Message\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":14:{s:5:\\\"event\\\";O:18:\\\"App\\\\Events\\\\Message\\\":4:{s:8:\\\"username\\\";s:11:\\\"b@gmail.com\\\";s:7:\\\"message\\\";s:4:\\\"jons\\\";s:14:\\\"community_slug\\\";s:17:\\\"community-english\\\";s:10:\\\"created_at\\\";s:19:\\\"2024-06-10 19:54:00\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}\"}}', 0, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(68, 'default', '{\"uuid\":\"b1676f7c-4353-4af2-aaca-aab5ca263166\",\"displayName\":\"App\\\\Events\\\\Message\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":14:{s:5:\\\"event\\\";O:18:\\\"App\\\\Events\\\\Message\\\":4:{s:8:\\\"username\\\";s:11:\\\"b@gmail.com\\\";s:7:\\\"message\\\";s:6:\\\"remove\\\";s:14:\\\"community_slug\\\";s:17:\\\"community-english\\\";s:10:\\\"created_at\\\";s:19:\\\"2024-06-10 19:54:04\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}\"}}', 0, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(69, 'default', '{\"uuid\":\"0f785bdc-6807-49e7-96c4-43cb1636e305\",\"displayName\":\"App\\\\Events\\\\Message\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":14:{s:5:\\\"event\\\";O:18:\\\"App\\\\Events\\\\Message\\\":4:{s:8:\\\"username\\\";s:11:\\\"b@gmail.com\\\";s:7:\\\"message\\\";s:5:\\\"hello\\\";s:14:\\\"community_slug\\\";s:17:\\\"community-english\\\";s:10:\\\"created_at\\\";s:19:\\\"2024-06-10 19:54:25\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}\"}}', 0, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(70, 'default', '{\"uuid\":\"f1e01013-1f7d-4c51-9f00-9a72399f428c\",\"displayName\":\"App\\\\Events\\\\Message\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":14:{s:5:\\\"event\\\";O:18:\\\"App\\\\Events\\\\Message\\\":4:{s:8:\\\"username\\\";s:11:\\\"b@gmail.com\\\";s:7:\\\"message\\\";s:6:\\\"dfdfdf\\\";s:14:\\\"community_slug\\\";s:17:\\\"community-english\\\";s:10:\\\"created_at\\\";s:19:\\\"2024-06-10 19:55:38\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}\"}}', 0, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(71, 'default', '{\"uuid\":\"f5d09342-a358-47b4-8b5f-6c879bc1696d\",\"displayName\":\"App\\\\Events\\\\Message\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":14:{s:5:\\\"event\\\";O:18:\\\"App\\\\Events\\\\Message\\\":4:{s:8:\\\"username\\\";s:11:\\\"b@gmail.com\\\";s:7:\\\"message\\\";s:3:\\\"fgg\\\";s:14:\\\"community_slug\\\";s:17:\\\"community-english\\\";s:10:\\\"created_at\\\";s:19:\\\"2024-06-10 19:58:48\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}\"}}', 0, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(72, 'default', '{\"uuid\":\"f402a15c-a139-4180-8bf5-081c20d2229c\",\"displayName\":\"App\\\\Events\\\\Message\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":14:{s:5:\\\"event\\\";O:18:\\\"App\\\\Events\\\\Message\\\":4:{s:8:\\\"username\\\";s:15:\\\"bijon@gmail.com\\\";s:7:\\\"message\\\";s:3:\\\"dff\\\";s:14:\\\"community_slug\\\";s:17:\\\"community-english\\\";s:10:\\\"created_at\\\";s:19:\\\"2024-06-10 20:03:26\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}\"}}', 0, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(73, 'default', '{\"uuid\":\"f55edf59-834d-47f4-81c1-c7ab99a766d2\",\"displayName\":\"App\\\\Events\\\\Message\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":14:{s:5:\\\"event\\\";O:18:\\\"App\\\\Events\\\\Message\\\":4:{s:8:\\\"username\\\";s:15:\\\"bijon@gmail.com\\\";s:7:\\\"message\\\";s:3:\\\"dfd\\\";s:14:\\\"community_slug\\\";s:17:\\\"community-english\\\";s:10:\\\"created_at\\\";s:19:\\\"2024-06-10 20:09:46\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}\"}}', 0, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(74, 'default', '{\"uuid\":\"e974a29d-9318-4487-9139-f34160793462\",\"displayName\":\"App\\\\Events\\\\Message\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":14:{s:5:\\\"event\\\";O:18:\\\"App\\\\Events\\\\Message\\\":4:{s:8:\\\"username\\\";s:11:\\\"b@gmail.com\\\";s:7:\\\"message\\\";s:4:\\\"sdsd\\\";s:14:\\\"community_slug\\\";s:17:\\\"community-english\\\";s:10:\\\"created_at\\\";s:19:\\\"2024-06-10 20:10:48\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}\"}}', 0, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(75, 'default', '{\"uuid\":\"56c2a3e4-d5f9-459a-bfd7-a0cdc0e0ee52\",\"displayName\":\"App\\\\Events\\\\Message\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":14:{s:5:\\\"event\\\";O:18:\\\"App\\\\Events\\\\Message\\\":4:{s:8:\\\"username\\\";s:11:\\\"b@gmail.com\\\";s:7:\\\"message\\\";s:4:\\\"sdds\\\";s:14:\\\"community_slug\\\";s:17:\\\"community-english\\\";s:10:\\\"created_at\\\";s:19:\\\"2024-06-10 20:11:28\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}\"}}', 0, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(76, 'default', '{\"uuid\":\"7fb99bad-f8c1-49f0-90fa-a79902d7173c\",\"displayName\":\"App\\\\Events\\\\Message\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":14:{s:5:\\\"event\\\";O:18:\\\"App\\\\Events\\\\Message\\\":4:{s:8:\\\"username\\\";s:11:\\\"b@gmail.com\\\";s:7:\\\"message\\\";s:9:\\\"dfgdfgdfg\\\";s:14:\\\"community_slug\\\";s:17:\\\"community-english\\\";s:10:\\\"created_at\\\";s:19:\\\"2024-06-10 20:11:31\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}\"}}', 0, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(77, 'default', '{\"uuid\":\"faed3b3f-6e37-47aa-9c80-7e294f8d236c\",\"displayName\":\"App\\\\Events\\\\Message\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":14:{s:5:\\\"event\\\";O:18:\\\"App\\\\Events\\\\Message\\\":2:{s:8:\\\"username\\\";s:11:\\\"b@gmail.com\\\";s:7:\\\"message\\\";s:4:\\\"dfdf\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}\"}}', 0, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(78, 'default', '{\"uuid\":\"6ebae555-447a-42bf-8e8e-e0b3fb825997\",\"displayName\":\"App\\\\Events\\\\Message\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":14:{s:5:\\\"event\\\";O:18:\\\"App\\\\Events\\\\Message\\\":2:{s:8:\\\"username\\\";s:11:\\\"b@gmail.com\\\";s:7:\\\"message\\\";s:13:\\\"fgfgffgfgfgfg\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}\"}}', 0, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(79, 'default', '{\"uuid\":\"ee252a0b-00f4-4859-9dd8-9d86e7c81dd9\",\"displayName\":\"App\\\\Events\\\\Message\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":14:{s:5:\\\"event\\\";O:18:\\\"App\\\\Events\\\\Message\\\":2:{s:8:\\\"username\\\";s:11:\\\"b@gmail.com\\\";s:7:\\\"message\\\";s:4:\\\"dddd\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}\"}}', 0, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `kyc`
--

CREATE TABLE `kyc` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `cnicFrontFile` varchar(255) DEFAULT NULL,
  `cnicBackFile` varchar(255) DEFAULT NULL,
  `passportFile` varchar(255) DEFAULT NULL,
  `drivingFrontFile` varchar(255) DEFAULT NULL,
  `drivingBackFile` varchar(255) DEFAULT NULL,
  `status` int(11) DEFAULT 0 COMMENT '0=admin not approval\r\n1=admin approval',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `kyc`
--

INSERT INTO `kyc` (`id`, `name`, `user_id`, `cnicFrontFile`, `cnicBackFile`, `passportFile`, `drivingFrontFile`, `drivingBackFile`, `status`, `created_at`, `updated_at`) VALUES
(1, 'passport', 2, NULL, NULL, '/backend/files/7tvtmZOymDmfcux6gJDL.png', NULL, NULL, 0, '2024-08-16 15:22:22', '2024-08-16 15:22:22');

-- --------------------------------------------------------

--
-- Table structure for table `logs`
--

CREATE TABLE `logs` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `user_agent` varchar(255) DEFAULT NULL,
  `method` varchar(255) DEFAULT NULL,
  `full_request` text DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `ip` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `manual_adjustment`
--

CREATE TABLE `manual_adjustment` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `adjustment_type` int(11) DEFAULT NULL COMMENT '1=The effective amount is manually increased\r\n2=The effective amount is manually reduced',
  `adjustment_amount` int(11) DEFAULT NULL COMMENT 'UIC Amount',
  `detailed_remarks` varchar(255) DEFAULT NULL,
  `entry_by` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

CREATE TABLE `messages` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `community_slug` varchar(255) DEFAULT NULL,
  `message` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `messages`
--

INSERT INTO `messages` (`id`, `user_id`, `username`, `community_slug`, `message`, `created_at`, `updated_at`) VALUES
(1, 3, 'b@gmail.com', 'community-english', 'Hi', '2024-06-12 10:15:21', '2024-06-12 10:15:21'),
(2, 3, 'b@gmail.com', 'community-english', 'Boss', '2024-06-12 10:15:24', '2024-06-12 10:15:24'),
(3, 3, 'b@gmail.com', 'community-english', 'how are you', '2024-06-12 10:15:29', '2024-06-12 10:15:29'),
(4, 2, 'r@gmail.com', 'community-english', 'yes sir good', '2024-06-12 10:16:09', '2024-06-12 10:16:09'),
(5, 2, 'r@gmail.com', 'community-english', 'what about now', '2024-06-12 10:16:14', '2024-06-12 10:16:14'),
(6, 3, 'b@gmail.com', 'community-chinese', 'HI', '2024-06-12 10:16:39', '2024-06-12 10:16:39'),
(7, 2, 'test1@gmail.com', 'community-english', 'hi', '2024-08-16 14:21:26', '2024-08-16 14:21:26');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_reset_tokens_table', 2),
(3, '2019_08_19_000000_create_failed_jobs_table', 3),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 4);

-- --------------------------------------------------------

--
-- Table structure for table `mininghistory`
--

CREATE TABLE `mininghistory` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `mining_date` date DEFAULT NULL,
  `mining_amount` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `mininghistory`
--

INSERT INTO `mininghistory` (`id`, `user_id`, `mining_date`, `mining_amount`, `created_at`, `updated_at`) VALUES
(1, 3, '2024-06-23', '0.00000870', '2024-06-23 16:35:28', '2024-06-23 16:35:28'),
(2, 3, '2024-06-23', '0.00000900', '2024-06-23 16:35:29', '2024-06-23 16:35:29'),
(3, 3, '2024-06-23', '0.00000930', '2024-06-23 16:35:30', '2024-06-23 16:35:30'),
(4, 3, '2024-06-23', '0.00000960', '2024-06-23 16:35:31', '2024-06-23 16:35:31'),
(5, 3, '2024-06-23', '0.00000990', '2024-06-23 16:35:32', '2024-06-23 16:35:32'),
(6, 3, '2024-06-23', '0.00001020', '2024-06-23 16:35:33', '2024-06-23 16:35:33'),
(7, 3, '2024-06-23', '0.00001050', '2024-06-23 16:35:34', '2024-06-23 16:35:34'),
(8, 3, '2024-06-23', '0.00001080', '2024-06-23 16:35:35', '2024-06-23 16:35:35'),
(9, 3, '2024-06-23', '0.00001110', '2024-06-23 16:35:36', '2024-06-23 16:35:36'),
(10, 3, '2024-06-23', '0.00001170', '2024-06-23 16:35:38', '2024-06-23 16:35:38'),
(11, 3, '2024-06-23', '0.00001200', '2024-06-23 16:35:39', '2024-06-23 16:35:39'),
(12, 3, '2024-06-23', '0.00001230', '2024-06-23 16:35:40', '2024-06-23 16:35:40'),
(13, 3, '2024-06-23', '0.00001260', '2024-06-23 16:35:41', '2024-06-23 16:35:41'),
(14, 3, '2024-06-23', '0.00001290', '2024-06-23 16:35:42', '2024-06-23 16:35:42'),
(15, 3, '2024-06-23', '0.00001320', '2024-06-23 16:35:43', '2024-06-23 16:35:43'),
(16, 3, '2024-06-23', '0.00001350', '2024-06-23 16:35:44', '2024-06-23 16:35:44'),
(17, 3, '2024-06-23', '0.00001380', '2024-06-23 16:35:45', '2024-06-23 16:35:45'),
(18, 3, '2024-06-23', '0.00001410', '2024-06-23 16:35:46', '2024-06-23 16:35:46'),
(19, 3, '2024-06-23', '0.00001440', '2024-06-23 16:35:47', '2024-06-23 16:35:47'),
(20, 3, '2024-06-20', '0.00001470', '2024-06-23 16:35:48', '2024-06-23 16:35:48'),
(21, 3, '2024-06-23', '0.00001500', '2024-06-23 16:35:49', '2024-06-23 16:35:49'),
(22, 3, '2024-06-23', '0.00001530', '2024-06-23 16:35:50', '2024-06-23 16:35:50'),
(23, 3, '2024-06-23', '0.00001560', '2024-06-23 16:35:51', '2024-06-23 16:35:51'),
(24, 3, '2024-06-20', '0.00001590', '2024-06-23 16:35:52', '2024-06-23 16:35:52'),
(25, 3, '2024-06-21', '0.00001620', '2024-06-23 16:35:54', '2024-06-23 16:35:54'),
(26, 3, '2024-06-21', '0.00001680', '2024-06-23 16:35:55', '2024-06-23 16:35:55'),
(27, 3, '2024-06-21', '0.00001710', '2024-06-23 16:35:56', '2024-06-23 16:35:56'),
(28, 3, '2024-06-23', '0.00001740', '2024-06-23 16:35:57', '2024-06-23 16:35:57'),
(29, 3, '2024-06-22', '0.00001770', '2024-06-23 16:35:58', '2024-06-23 16:35:58'),
(30, 3, '2024-06-22', '0.00001800', '2024-06-23 16:35:59', '2024-06-23 16:35:59'),
(31, 3, '2024-06-22', '0.00001830', '2024-06-23 16:36:00', '2024-06-23 16:36:00'),
(32, 5, '2024-08-15', '0.00001890', '2024-08-15 04:43:33', '2024-08-15 04:43:33'),
(33, 2, '2024-08-15', '0.00058740', '2024-08-15 04:43:33', '2024-08-15 04:43:33'),
(34, 5, '2024-08-15', '0.00002280', '2024-08-15 04:43:46', '2024-08-15 04:43:46'),
(35, 2, '2024-08-15', '0.00059520', '2024-08-15 04:43:46', '2024-08-15 04:43:46'),
(36, 5, '2024-08-15', '0.00002310', '2024-08-15 04:43:47', '2024-08-15 04:43:47'),
(37, 2, '2024-08-15', '0.00059580', '2024-08-15 04:43:47', '2024-08-15 04:43:47'),
(38, 5, '2024-08-15', '0.00002340', '2024-08-15 04:43:48', '2024-08-15 04:43:48'),
(39, 2, '2024-08-15', '0.00059640', '2024-08-15 04:43:48', '2024-08-15 04:43:48'),
(40, 5, '2024-08-15', '0.00002370', '2024-08-15 04:43:49', '2024-08-15 04:43:49'),
(41, 2, '2024-08-15', '0.00059700', '2024-08-15 04:43:49', '2024-08-15 04:43:49'),
(42, 5, '2024-08-15', '0.00002400', '2024-08-15 04:43:50', '2024-08-15 04:43:50'),
(43, 2, '2024-08-15', '0.00059760', '2024-08-15 04:43:50', '2024-08-15 04:43:50'),
(44, 5, '2024-08-15', '0.00002430', '2024-08-15 04:43:51', '2024-08-15 04:43:51'),
(45, 2, '2024-08-15', '0.00059820', '2024-08-15 04:43:51', '2024-08-15 04:43:51'),
(46, 5, '2024-08-15', '0.00002460', '2024-08-15 04:43:52', '2024-08-15 04:43:52'),
(47, 2, '2024-08-15', '0.00059880', '2024-08-15 04:43:52', '2024-08-15 04:43:52'),
(48, 5, '2024-08-15', '0.00002490', '2024-08-15 04:43:53', '2024-08-15 04:43:53'),
(49, 2, '2024-08-15', '0.00059940', '2024-08-15 04:43:53', '2024-08-15 04:43:53'),
(50, 5, '2024-08-15', '0.00002520', '2024-08-15 04:43:54', '2024-08-15 04:43:54'),
(51, 2, '2024-08-15', '0.00060000', '2024-08-15 04:43:54', '2024-08-15 04:43:54'),
(52, 5, '2024-08-15', '0.00002550', '2024-08-15 04:43:55', '2024-08-15 04:43:55'),
(53, 2, '2024-08-15', '0.00060060', '2024-08-15 04:43:55', '2024-08-15 04:43:55'),
(54, 5, '2024-08-15', '0.00002580', '2024-08-15 04:43:56', '2024-08-15 04:43:56'),
(55, 2, '2024-08-15', '0.00060120', '2024-08-15 04:43:56', '2024-08-15 04:43:56'),
(56, 5, '2024-08-15', '0.00002640', '2024-08-15 04:43:58', '2024-08-15 04:43:58'),
(57, 2, '2024-08-15', '0.00060240', '2024-08-15 04:43:58', '2024-08-15 04:43:58'),
(58, 5, '2024-08-15', '0.00002670', '2024-08-15 04:43:59', '2024-08-15 04:43:59'),
(59, 2, '2024-08-15', '0.00060300', '2024-08-15 04:43:59', '2024-08-15 04:43:59'),
(60, 5, '2024-08-15', '0.00002700', '2024-08-15 04:44:00', '2024-08-15 04:44:00'),
(61, 2, '2024-08-15', '0.00060360', '2024-08-15 04:44:00', '2024-08-15 04:44:00');

-- --------------------------------------------------------

--
-- Table structure for table `mining_categogy`
--

CREATE TABLE `mining_categogy` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `duration_in_hour` int(11) DEFAULT NULL,
  `minute` int(11) DEFAULT NULL,
  `second` int(11) DEFAULT NULL,
  `minining_amount_per_secnd` varchar(255) DEFAULT NULL,
  `daily_mining_amount` varchar(255) DEFAULT NULL,
  `mining_value_mention_at_hour` varchar(255) DEFAULT NULL,
  `offer_description` text DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `entry_by` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `mining_categogy`
--

INSERT INTO `mining_categogy` (`id`, `name`, `slug`, `duration_in_hour`, `minute`, `second`, `minining_amount_per_secnd`, `daily_mining_amount`, `mining_value_mention_at_hour`, `offer_description`, `status`, `entry_by`, `created_at`, `updated_at`) VALUES
(1, 'Start', 'start', 1, 60, 3600, '0.0000003', NULL, NULL, 'A mining package providing essential tools and resources to kick start your projects.', 1, 1, '2024-05-25 12:33:49', '2024-05-25 12:33:49'),
(2, 'Fast', 'fast', 1, 60, 7200, '0.0000004', NULL, NULL, 'Premium mining package offering high-speed, reliable services for a fee.', 1, 1, '2024-05-25 12:34:10', '2024-05-25 11:58:48'),
(3, 'Super', 'super', 1, 60, 7200, '0.0000005', NULL, NULL, 'Premium mining package offering advanced tools and resources for professional use.', 1, 1, '2024-05-25 12:34:29', '2024-05-25 12:34:29'),
(4, 'Platinum', 'platinum', 1, 60, 7200, '0.0000006', NULL, NULL, 'This premium and paid service offering advanced mining tools and resources.', 1, 1, '2024-05-25 12:34:57', '2024-05-25 12:34:57');

-- --------------------------------------------------------

--
-- Table structure for table `mining_categogy_duration`
--

CREATE TABLE `mining_categogy_duration` (
  `id` int(11) NOT NULL,
  `mining_category_id` int(11) DEFAULT NULL,
  `packages_name` varchar(255) DEFAULT NULL,
  `duration` varchar(255) DEFAULT NULL,
  `prices` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `mining_categogy_duration`
--

INSERT INTO `mining_categogy_duration` (`id`, `mining_category_id`, `packages_name`, `duration`, `prices`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, '1M', '30', 10, 1, '2024-05-30 17:48:37', '2024-05-30 17:48:37'),
(2, 1, '2M', '60', 18, 1, '2024-05-30 17:48:37', '2024-05-30 17:48:37'),
(3, 1, '3M', '90', 40, 1, '2024-05-30 17:48:37', '2024-05-30 17:48:37'),
(4, 2, 'PACK-1M', '30', 10, 1, '2024-05-30 17:48:37', '2024-05-30 17:48:37'),
(5, 2, 'PACK-2M', '60', 18, 1, '2024-05-30 17:48:37', '2024-05-30 17:48:37'),
(6, 2, 'PACK-3M', '90', 40, 1, '2024-05-30 17:48:37', '2024-05-30 17:48:37'),
(7, 3, 'PACK-1M', '30', 10, 1, '2024-05-30 17:48:37', '2024-05-30 17:48:37'),
(8, 3, 'PACK-2M', '60', 18, 1, '2024-05-30 17:48:37', '2024-05-30 17:48:37'),
(9, 3, 'PACK-3M', '90', 40, 1, '2024-05-30 17:48:37', '2024-05-30 17:48:37'),
(10, 4, 'PACK-PRE1M', '30', 10, 1, '2024-05-30 17:48:37', '2024-05-30 17:48:37'),
(11, 4, 'PACK-PRE2M', '60', 18, 1, '2024-05-30 17:48:37', '2024-06-01 02:43:37');

-- --------------------------------------------------------

--
-- Table structure for table `mining_process_history`
--

CREATE TABLE `mining_process_history` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `start_time` timestamp NULL DEFAULT NULL,
  `end_time` timestamp NULL DEFAULT NULL,
  `duration` int(11) DEFAULT NULL,
  `mining_category_id` int(11) DEFAULT NULL,
  `ip` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `mining_process_history`
--

INSERT INTO `mining_process_history` (`id`, `user_id`, `start_time`, `end_time`, `duration`, `mining_category_id`, `ip`, `created_at`, `updated_at`) VALUES
(1, 3, '2024-06-22 04:20:40', '2024-06-22 05:20:40', 1, 1, '127.0.0.1', '2024-06-22 04:20:40', '2024-06-22 04:20:40'),
(2, 3, '2024-06-23 13:59:51', '2024-06-23 14:59:51', 1, 1, '127.0.0.1', '2024-06-23 13:59:51', '2024-06-23 13:59:51'),
(3, 3, '2024-06-23 15:27:41', '2024-06-23 16:27:41', 1, 1, '127.0.0.1', '2024-06-23 15:27:41', '2024-06-23 15:27:41'),
(4, 3, '2024-06-23 16:34:59', '2024-06-23 17:34:59', 1, 1, '127.0.0.1', '2024-06-23 16:34:59', '2024-06-23 16:34:59'),
(5, 2, '2024-08-13 17:10:14', '2024-08-13 18:10:14', 1, 1, '127.0.0.1', '2024-08-13 17:10:14', '2024-08-13 17:10:14'),
(6, 2, '2024-08-14 22:04:17', '2024-08-14 23:04:17', 1, 1, '127.0.0.1', '2024-08-14 22:04:17', '2024-08-14 22:04:17'),
(7, 2, '2024-08-14 22:04:34', '2024-08-14 23:04:34', 1, 1, '127.0.0.1', '2024-08-14 22:04:34', '2024-08-14 22:04:34'),
(8, 2, '2024-08-15 04:27:01', '2024-08-15 05:27:01', 1, 1, '127.0.0.1', '2024-08-15 04:27:01', '2024-08-15 04:27:01'),
(9, 2, '2024-08-15 04:27:27', '2024-08-15 05:27:27', 1, 1, '127.0.0.1', '2024-08-15 04:27:27', '2024-08-15 04:27:27'),
(10, 5, '2024-08-15 04:42:30', '2024-08-15 05:42:30', 1, 1, '127.0.0.1', '2024-08-15 04:42:30', '2024-08-15 04:42:30'),
(11, 2, '2024-08-16 12:25:00', '2024-08-16 13:25:00', 1, 1, '127.0.0.1', '2024-08-16 12:25:00', '2024-08-16 12:25:00'),
(12, 2, '2024-08-16 15:31:59', '2024-08-16 16:31:59', 1, 1, '127.0.0.1', '2024-08-16 15:31:59', '2024-08-16 15:31:59'),
(13, 2, '2024-08-16 17:46:54', '2024-08-16 18:46:54', 1, 1, '127.0.0.1', '2024-08-16 17:46:54', '2024-08-16 17:46:54');

-- --------------------------------------------------------

--
-- Table structure for table `mining_service_buy_history`
--

CREATE TABLE `mining_service_buy_history` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `mining_category_id` int(11) DEFAULT NULL,
  `mining_category_duration_id` int(11) DEFAULT NULL,
  `duration` varchar(255) DEFAULT NULL,
  `service_price` int(11) DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `notification`
--

CREATE TABLE `notification` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `msg` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `notification`
--

INSERT INTO `notification` (`id`, `user_id`, `msg`, `created_at`, `updated_at`) VALUES
(1, NULL, 'Your changes have been saved successfully.', '2024-08-16 16:03:03', '2024-08-16 16:03:03'),
(2, NULL, 'Something went wrong. Please try again.', '2024-08-16 16:03:32', '2024-08-16 16:03:32'),
(3, NULL, 'New updates are available. Check them out!', '2024-08-16 16:03:32', '2024-08-16 16:03:32'),
(4, NULL, 'Your session is about to expire. Please save your work.', '2024-08-16 16:03:32', '2024-08-16 16:03:32'),
(5, NULL, 'Don\'t forget to complete your profile setup.', '2024-08-16 16:03:32', '2024-08-16 16:03:32');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `orderId` varchar(255) NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  `transfer_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `product_name` varchar(255) DEFAULT NULL,
  `selling_price` double(10,2) DEFAULT NULL,
  `profit` double(10,2) DEFAULT NULL,
  `buying_price` double(10,2) DEFAULT NULL COMMENT 'cost price',
  `user_balance` double(10,2) DEFAULT NULL,
  `user_mul_balance` double(10,2) DEFAULT NULL,
  `order_date` date DEFAULT NULL,
  `product_qty` int(11) DEFAULT 1,
  `order_status` int(11) NOT NULL DEFAULT 1 COMMENT '1=To be paid\r\n                                                        2=To be confiremed\r\n                                                        3=Goods To be received\r\n                                                        4=Platform procced\r\n                                                        5=To be shipped\r\n                                                        6=Complete\r\n                                                        7=Canceled\r\n                                                        8=Returning\r\n                                                        9=Return complete\r\n                                                        10=Abnormal order',
  `status` int(11) DEFAULT 1,
  `order_type` varchar(255) DEFAULT NULL,
  `thumnail_img` varchar(255) DEFAULT NULL,
  `created_at` varchar(255) DEFAULT NULL,
  `order_inactive_time` varchar(255) DEFAULT NULL,
  `pay_confirm_time` timestamp NULL DEFAULT NULL COMMENT 'After click on payment button',
  `goods_to_be_received_time` timestamp NULL DEFAULT NULL COMMENT '+30',
  `platform_proceed_Time` timestamp NULL DEFAULT NULL COMMENT '+60',
  `to_be_shipped_time` timestamp NULL DEFAULT NULL COMMENT '+90',
  `complete_time` timestamp NULL DEFAULT NULL COMMENT '+120',
  `cancel_time` timestamp NULL DEFAULT NULL,
  `return_time` timestamp NULL DEFAULT NULL,
  `return_complete_time` timestamp NULL DEFAULT NULL,
  `updated_at` datetime DEFAULT current_timestamp(),
  `abnormal_order_time` timestamp NULL DEFAULT NULL,
  `remarks` varchar(255) DEFAULT NULL,
  `update_by` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `order_status`
--

CREATE TABLE `order_status` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `schedule_time` varchar(255) DEFAULT NULL,
  `status` int(11) DEFAULT 1,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `order_status`
--

INSERT INTO `order_status` (`id`, `name`, `description`, `schedule_time`, `status`, `created_at`, `updated_at`) VALUES
(1, 'To be paid', 'To be paid', NULL, 1, '2023-12-04 11:15:23', '2023-12-04 05:55:06'),
(2, 'To be confiremed', 'To be confiremed', NULL, 1, '2023-12-04 11:15:23', '2023-12-04 05:55:48'),
(3, 'Goods To be received', 'Goods To be received', '30', 1, '2023-12-04 11:15:23', '2023-12-04 05:56:14'),
(4, 'Platform procced', 'Platform procced', '30', 1, '2023-12-04 11:15:23', '2023-12-04 05:56:45'),
(5, 'To be shipped', 'To be shipped', '30', 1, '2023-12-04 11:15:23', '2023-12-04 05:57:14'),
(6, 'Complete', 'Complete', '30', 1, '2023-12-04 11:15:23', '2023-12-04 05:57:42'),
(7, 'Canceled', 'Canceled', NULL, 1, '2023-12-04 11:15:23', '2023-12-04 05:58:19'),
(8, 'Returning', 'Returning', NULL, 1, '2023-12-04 11:15:23', '2023-12-04 05:58:53'),
(9, 'Return complete', 'Return complete', NULL, 1, '2023-12-04 11:15:23', '2023-12-04 05:59:17'),
(10, 'Abnormal order', 'Abnormal order', NULL, 1, '2023-12-04 11:15:23', '2023-12-04 05:59:17');

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `description_short` text DEFAULT NULL,
  `description_full` text DEFAULT NULL,
  `question` text DEFAULT NULL,
  `answer` text DEFAULT NULL,
  `likeCount` int(11) DEFAULT NULL,
  `categoryId` int(11) DEFAULT NULL,
  `entry_by` int(11) DEFAULT NULL,
  `thumnail_img` varchar(255) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`id`, `name`, `slug`, `description_short`, `description_full`, `question`, `answer`, `likeCount`, `categoryId`, `entry_by`, `thumnail_img`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Automation Testing', 'automation-testing', '', '<p>Automation TestingAutomation TestingAutomation TestingAutomation TestingAutomation TestingAutomation TestingAutomation TestingAutomation TestingAutomation TestingAutomation TestingAutomation TestingAutomation TestingAutomation TestingAutomation TestingAutomation TestingAutomation Testing<br></p>', '', '', 5, 0, 1, '/backend/files/SaEQDSXlk5pEwqoScDnV.jpg', 1, '2024-06-24 12:12:27', '2024-08-15 07:16:56'),
(2, 'Active Directory', 'active-directory', '', '<p>Active DirectoryActive DirectoryActive DirectoryActive DirectoryActive DirectoryActive DirectoryActive DirectoryActive DirectoryActive DirectoryActive DirectoryActive DirectoryActive DirectoryActive DirectoryActive DirectoryActive DirectoryActive DirectoryActive Directory<br></p>', '', '', 1, 0, 1, '/backend/files/ck7bBb8CRZcnPdbbiaaX.jpeg', 1, '2024-06-24 12:15:50', '2024-08-15 07:16:40'),
(3, 'Adobe Photoshop', 'adobe-photoshop', '', '<p>Adobe PhotoshopAdobe PhotoshopAdobe PhotoshopAdobe PhotoshopAdobe PhotoshopAdobe PhotoshopAdobe PhotoshopAdobe PhotoshopAdobe Photoshop<br></p>', '', '', 1, 0, 1, '/backend/files/m8S1QuWsgtCfI65tBhqV.jpeg', 1, '2024-06-24 12:19:02', '2024-08-15 07:15:01'),
(4, 'sss', 'sss', '', '<p>Adobe PhotoshopAdobe PhotoshopAdobe PhotoshopAdobe PhotoshopAdobe PhotoshopAdobe PhotoshopAdobe PhotoshopAdobe PhotoshopAdobe Photoshop<br></p>', '', '', 158, 0, 1, NULL, 1, '2024-06-27 02:11:36', '2024-08-15 07:14:54'),
(5, 'xxx', 'xxx', '', '<p>Adobe PhotoshopAdobe PhotoshopAdobe PhotoshopAdobe PhotoshopAdobe PhotoshopAdobe PhotoshopAdobe PhotoshopAdobe PhotoshopAdobe Photoshop<br></p>', '', '', NULL, 0, 3, NULL, 0, '2024-06-27 02:11:53', '2024-06-27 02:11:53'),
(6, 'Gazi', 'gazi', NULL, 'I am Mohammad Hasan Ejaz and i was designed this movie cover poster, I have designed this poster on photoshop and if you want', NULL, NULL, NULL, NULL, 1, '/backend/files/o0iO1GQqBmIZzgqo3g7Y.png', 0, '2024-06-27 02:19:18', '2024-06-27 04:22:36'),
(7, 'Gazi', 'gazi', NULL, 'I am Mohammad Hasan Ejaz and i was designed this movie cover poster, I have designed this poster on photoshop and if you want I am Mohammad Hasan Ejaz and i was designed this movie cover poster, I have designed this poster on photoshop and if you want I am Mohammad Hasan Ejaz and i was designed this movie cover poster, I have designed this poster on photoshop and if you want I am Mohammad Hasan Ejaz and i was designed this movie cover poster, I have designed this poster on photoshop and if you want', NULL, NULL, NULL, NULL, 3, '/backend/files/BBX7qnVcTjqwyuGhFFgL.png', 0, '2024-06-27 02:20:52', '2024-06-27 02:20:52'),
(8, 'Gazi', 'gazi', NULL, 'Your post is pending. Your post will be published if the admin approves it', NULL, NULL, NULL, NULL, 1, NULL, 0, '2024-06-27 02:22:10', '2024-06-27 04:09:16');

-- --------------------------------------------------------

--
-- Table structure for table `post_category`
--

CREATE TABLE `post_category` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `post_category`
--

INSERT INTO `post_category` (`id`, `name`, `status`) VALUES
(1, 'Announcement', 1),
(2, 'Event', 1),
(3, 'FAQs', 1);

-- --------------------------------------------------------

--
-- Table structure for table `post_like`
--

CREATE TABLE `post_like` (
  `id` int(11) NOT NULL,
  `post_id` int(11) DEFAULT NULL,
  `postlikesCount` int(11) DEFAULT 0,
  `user_id` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `post_like`
--

INSERT INTO `post_like` (`id`, `post_id`, `postlikesCount`, `user_id`, `created_at`, `updated_at`) VALUES
(1, 4, 0, 2, '2024-08-15 07:29:34', '2024-08-15 07:29:34'),
(2, 3, 0, 2, '2024-08-15 07:29:55', '2024-08-15 07:29:55'),
(3, 2, 0, 2, '2024-08-15 07:29:59', '2024-08-15 07:29:59');

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `description_short` text DEFAULT NULL,
  `description_full` text DEFAULT NULL,
  `selling_price` double(10,2) DEFAULT NULL,
  `profit` double(10,2) DEFAULT NULL,
  `buying_price` double(10,2) DEFAULT NULL,
  `qty_status` int(11) DEFAULT NULL,
  `meta_title` varchar(255) DEFAULT NULL,
  `meta_description` text DEFAULT NULL,
  `meta_keyword` varchar(255) DEFAULT NULL,
  `product_tag` varchar(255) DEFAULT NULL,
  `brand` int(11) DEFAULT NULL,
  `sku` varchar(255) DEFAULT NULL,
  `external_link` varchar(255) DEFAULT NULL,
  `sell_qty` int(11) DEFAULT NULL,
  `balance_qty` int(11) DEFAULT NULL,
  `cash_dev_status` int(11) DEFAULT NULL,
  `price` double(10,2) DEFAULT NULL,
  `unit` varchar(255) DEFAULT NULL,
  `stock_qty` int(11) DEFAULT NULL,
  `stock_mini_qty` int(11) DEFAULT NULL,
  `stock_status` int(11) DEFAULT NULL,
  `manufacturer` int(11) DEFAULT NULL,
  `download_link` varchar(255) DEFAULT NULL,
  `year` varchar(255) DEFAULT NULL,
  `discount` double(10,2) DEFAULT NULL,
  `discount_status` int(11) DEFAULT NULL,
  `shipping_days` int(11) DEFAULT NULL,
  `free_shopping` int(11) DEFAULT NULL,
  `flat_rate_status` int(11) DEFAULT NULL,
  `flat_rate_price` double(10,5) DEFAULT NULL,
  `draw_details` text DEFAULT NULL,
  `vat` varchar(255) DEFAULT NULL,
  `vat_status` int(11) DEFAULT NULL,
  `tax` varchar(255) DEFAULT NULL,
  `tax_status` int(11) DEFAULT NULL,
  `thumnail_img` varchar(255) DEFAULT NULL,
  `status` int(11) DEFAULT 1,
  `entry_by` int(11) DEFAULT NULL,
  `counter` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `produc_categories`
--

CREATE TABLE `produc_categories` (
  `id` int(11) NOT NULL,
  `product_id` int(11) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `parent_id` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `produc_img_history`
--

CREATE TABLE `produc_img_history` (
  `id` int(11) NOT NULL,
  `product_id` int(11) DEFAULT NULL,
  `images` varchar(255) NOT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `rule`
--

CREATE TABLE `rule` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `status` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `rule`
--

INSERT INTO `rule` (`id`, `name`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Super Admin', 1, '2024-04-16 10:33:46', '2024-04-16 10:33:46'),
(2, 'User', 1, '2024-04-16 10:56:15', '2024-04-16 10:56:15'),
(3, 'Admin', 1, '2024-04-16 10:56:27', '2024-04-16 10:56:27'),
(4, 'Agent', 1, '2024-04-16 10:56:39', '2024-04-16 10:56:39');

-- --------------------------------------------------------

--
-- Table structure for table `send_received`
--

CREATE TABLE `send_received` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `sender_user_id` int(11) DEFAULT NULL,
  `receiver_user_id` int(11) DEFAULT NULL,
  `receiver_uic_address` varchar(255) DEFAULT NULL,
  `receiver_name` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `wallet_type` varchar(255) DEFAULT NULL COMMENT '1=UIC\r\n2= USDT',
  `amount` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `send_received`
--

INSERT INTO `send_received` (`id`, `user_id`, `sender_user_id`, `receiver_user_id`, `receiver_uic_address`, `receiver_name`, `password`, `wallet_type`, `amount`, `created_at`, `updated_at`) VALUES
(1, 2, 2, 6, 'c399147ccbf9aeeb93bfb710d60a61f3', 'test5', 'test1@gmail.com', '2', '10.00', '2024-08-16 14:19:53', '2024-08-16 14:19:53');

-- --------------------------------------------------------

--
-- Table structure for table `service`
--

CREATE TABLE `service` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT 1,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `service`
--

INSERT INTO `service` (`id`, `name`, `price`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Service 1', 20, 1, '2024-04-20 20:03:13', '2024-04-20 20:03:13'),
(2, 'Service 2', 40, 1, '2024-04-20 20:03:13', '2024-04-20 20:03:13'),
(3, 'Service 3', 60, 1, '2024-04-20 20:03:13', '2024-04-20 20:03:13'),
(4, 'Service 4', 80, 1, '2024-04-20 20:03:13', '2024-04-20 20:03:13'),
(5, 'Service 5', 50, 0, '2024-04-20 20:03:13', '2024-04-20 20:03:13'),
(6, 'Service 6', 60, 0, '2024-04-20 20:03:13', '2024-04-20 20:03:13');

-- --------------------------------------------------------

--
-- Table structure for table `setting`
--

CREATE TABLE `setting` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `deposit_service_charge` int(11) DEFAULT NULL COMMENT '%',
  `convert_php_amt` float DEFAULT NULL,
  `withdraw_service_charge` int(11) DEFAULT NULL COMMENT '%',
  `withdraw_minimum_amount` int(11) DEFAULT NULL,
  `withdraw_maximum_amount` int(11) DEFAULT NULL,
  `minimum_trade_amount` int(11) DEFAULT NULL,
  `minimum_deposit_amount` int(11) DEFAULT NULL,
  `trade_fee` int(11) DEFAULT NULL COMMENT '%',
  `tel` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `address` mediumtext NOT NULL,
  `whatsApp` varchar(255) NOT NULL,
  `emergency` varchar(255) NOT NULL,
  `photo` varchar(255) DEFAULT NULL,
  `description` mediumtext NOT NULL,
  `copyright` varchar(255) NOT NULL,
  `status` int(11) NOT NULL,
  `admin_photo` varchar(244) NOT NULL,
  `admin_name` varchar(255) NOT NULL,
  `admin_email` varchar(255) NOT NULL,
  `admin_phone` varchar(255) NOT NULL,
  `meta_keywords` mediumtext DEFAULT NULL,
  `meta_description` mediumtext DEFAULT NULL,
  `pphoto` varchar(255) NOT NULL,
  `bg_color` varchar(255) DEFAULT NULL,
  `currency` varchar(150) DEFAULT NULL,
  `openinig_balance_date` date DEFAULT NULL,
  `reffer_bonus` int(11) DEFAULT NULL,
  `maximum_supply` varchar(255) DEFAULT NULL,
  `total_supply` varchar(255) DEFAULT NULL,
  `openinig_balance_comments` mediumtext DEFAULT NULL,
  `fblink` varchar(255) DEFAULT NULL,
  `twitterlink` varchar(255) DEFAULT NULL,
  `linkdinlink` varchar(255) DEFAULT NULL,
  `instragramlink` varchar(255) DEFAULT NULL,
  `store_policy` longtext DEFAULT NULL,
  `crypto_wallet_address` varchar(255) DEFAULT NULL,
  `master_pass_acc_no` varchar(255) DEFAULT NULL,
  `website` varchar(255) DEFAULT NULL,
  `telegram` varchar(255) DEFAULT NULL,
  `register_bonus` int(11) DEFAULT NULL,
  `mininmum_deposit_amount` double(10,2) DEFAULT NULL,
  `maximum_deposit_amount` double(10,2) DEFAULT NULL,
  `minimum_withdrawal` double(10,2) DEFAULT NULL,
  `maximum_withdrawal` double(10,2) DEFAULT NULL,
  `level_1_bonus` int(11) DEFAULT NULL,
  `level_2_bonus` int(11) DEFAULT NULL,
  `level_3_bonus` int(11) DEFAULT NULL,
  `daily_max_withdraw_request` double(10,2) DEFAULT NULL,
  `withdrawal_free_amount` double(10,2) DEFAULT NULL,
  `withdrawal_free_on_percentage` double(10,2) DEFAULT NULL,
  `mimumun_transfer_amount_to_other_user` double(10,2) DEFAULT NULL,
  `maximum_transfer_amount_to_other_user` double(10,2) DEFAULT NULL,
  `transfer_fee_fixed_amount` double(10,2) DEFAULT NULL,
  `traansfer_fee_on_percentage` double(10,2) DEFAULT NULL,
  `liquidity_total_supply` varchar(255) DEFAULT NULL,
  `beganing_price` varchar(255) DEFAULT NULL,
  `circlation` varchar(255) DEFAULT NULL,
  `update_by` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `setting`
--

INSERT INTO `setting` (`id`, `name`, `deposit_service_charge`, `convert_php_amt`, `withdraw_service_charge`, `withdraw_minimum_amount`, `withdraw_maximum_amount`, `minimum_trade_amount`, `minimum_deposit_amount`, `trade_fee`, `tel`, `email`, `address`, `whatsApp`, `emergency`, `photo`, `description`, `copyright`, `status`, `admin_photo`, `admin_name`, `admin_email`, `admin_phone`, `meta_keywords`, `meta_description`, `pphoto`, `bg_color`, `currency`, `openinig_balance_date`, `reffer_bonus`, `maximum_supply`, `total_supply`, `openinig_balance_comments`, `fblink`, `twitterlink`, `linkdinlink`, `instragramlink`, `store_policy`, `crypto_wallet_address`, `master_pass_acc_no`, `website`, `telegram`, `register_bonus`, `mininmum_deposit_amount`, `maximum_deposit_amount`, `minimum_withdrawal`, `maximum_withdrawal`, `level_1_bonus`, `level_2_bonus`, `level_3_bonus`, `daily_max_withdraw_request`, `withdrawal_free_amount`, `withdrawal_free_on_percentage`, `mimumun_transfer_amount_to_other_user`, `maximum_transfer_amount_to_other_user`, `transfer_fee_fixed_amount`, `traansfer_fee_on_percentage`, `liquidity_total_supply`, `beganing_price`, `circlation`, `update_by`, `created_at`, `updated_at`) VALUES
(1, 'UIC', 5, 64, 5, 20, 4000, 5, 10, 6, '+44245454545', 'uic@abcd.com', 'Addres', '00000055555', '+000000', 'pic/2tAjiUpJ0X8GziIrKJJJ.png', 'Business Description', 'Copyright © 2024 uic . All Rights Reserved', 1, 'pic/ZOdc8nsWAMY1YELkp9zH.jpg', 'admin', 'info@admin.com', '+44245454545', NULL, NULL, '', '#ffffff', '$', '2020-05-13', 5, '300000000', '120000000', NULL, 'https://www.fiverr.com', 'https://www.facebook.com', 'https://web.whatsapp.com/', '#', '', 'TPpMvdKfhENfJqYZsDJQLgEopMRBy15jeU', '225588996633', 'http://winup360.com', '116898999999', 5, 55.00, 5.00, 5.00, 5.00, 3, 2, 1, 5.00, 5.00, 5.00, 5.00, 5.00, 5.00, 50.00, '1000', '0.00000833333333', '66666666', 2993, '2024-05-12 05:32:50', '2024-05-12 03:42:05');

-- --------------------------------------------------------

--
-- Table structure for table `sliders`
--

CREATE TABLE `sliders` (
  `id` int(11) NOT NULL,
  `images` varchar(255) DEFAULT NULL,
  `redirect_url` varchar(255) DEFAULT NULL,
  `status` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `spin_setup`
--

CREATE TABLE `spin_setup` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `spin_setup`
--

INSERT INTO `spin_setup` (`id`, `name`, `status`, `created_at`, `updated_at`) VALUES
(1, '100', 1, '2024-08-16 17:39:42', '2024-08-16 17:39:42'),
(2, '300', 1, '2024-08-16 17:39:42', '2024-08-16 17:39:42'),
(3, '400', 1, '2024-08-16 17:39:42', '2024-08-16 17:39:42'),
(4, '600', 1, '2024-08-16 17:39:42', '2024-08-16 17:39:42'),
(5, '650', 1, '2024-08-16 17:39:42', '2024-08-16 17:39:42'),
(6, '660', 1, '2024-08-16 17:39:42', '2024-08-16 17:39:42'),
(7, '670', 1, '2024-08-16 17:39:42', '2024-08-16 17:39:42'),
(8, '680', 1, '2024-08-16 17:39:42', '2024-08-16 17:39:42'),
(9, '690', 1, '2024-08-16 17:39:42', '2024-08-16 17:39:42'),
(10, '700', 1, '2024-08-16 17:39:42', '2024-08-16 17:39:42'),
(11, '710', 1, '2024-08-16 17:39:42', '2024-08-16 17:39:42'),
(12, '720', 1, '2024-08-16 17:39:42', '2024-08-16 17:39:42');

-- --------------------------------------------------------

--
-- Table structure for table `states`
--

CREATE TABLE `states` (
  `id` int(11) NOT NULL,
  `name` varchar(30) NOT NULL,
  `country_id` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `swaphistory`
--

CREATE TABLE `swaphistory` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL COMMENT '1=UIC,2=USDT',
  `wallet_type_frm` varchar(255) DEFAULT NULL,
  `wallet_type_to` varchar(255) DEFAULT NULL,
  `frm_amount` decimal(10,2) DEFAULT NULL,
  `to_amount` varchar(255) DEFAULT NULL,
  `swape_date` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `transaction_history`
--

CREATE TABLE `transaction_history` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `type` int(11) DEFAULT NULL COMMENT '1=deposit,2=withdraw,3=machine purchase,4=Send/Receive',
  `last_Id` int(11) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `amount` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `transaction_history`
--

INSERT INTO `transaction_history` (`id`, `user_id`, `type`, `last_Id`, `description`, `amount`, `created_at`, `updated_at`) VALUES
(1, 2, 1, 1, 'Deposit', '500', '2024-08-16 13:16:02', '2024-08-16 13:16:02'),
(2, 2, 4, 1, 'Send/Receive-USDT Amount', '10.00', '2024-08-16 14:19:53', '2024-08-16 14:19:53');

-- --------------------------------------------------------

--
-- Table structure for table `transfer`
--

CREATE TABLE `transfer` (
  `id` int(11) NOT NULL,
  `previous_user_id` int(11) DEFAULT NULL,
  `transer_user_id` int(11) DEFAULT NULL,
  `order_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uic_id` varchar(255) DEFAULT NULL,
  `uic_address` varchar(255) DEFAULT NULL,
  `inviteCode` varchar(255) DEFAULT NULL,
  `ref_id` int(11) DEFAULT NULL,
  `employee_id` int(11) DEFAULT NULL,
  `role_id` int(11) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `available_balance` double(10,8) DEFAULT NULL,
  `spincount` int(11) DEFAULT NULL,
  `taptap_coin` int(11) DEFAULT NULL,
  `mining_amount` varchar(255) DEFAULT NULL COMMENT 'UIC',
  `level_commission` int(11) DEFAULT NULL,
  `show_password` varchar(225) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `real_name` varchar(255) DEFAULT NULL,
  `phone_number` varchar(225) DEFAULT NULL,
  `image` varchar(225) DEFAULT NULL,
  `doc_file` varchar(255) DEFAULT NULL,
  `address` varchar(225) DEFAULT NULL,
  `address_1` varchar(255) DEFAULT NULL,
  `address_2` varchar(255) DEFAULT NULL,
  `website` varchar(225) DEFAULT NULL,
  `github` varchar(225) DEFAULT NULL,
  `gender` varchar(50) DEFAULT NULL,
  `date_of_birth` date DEFAULT NULL,
  `twitter` varchar(225) DEFAULT NULL,
  `instagram` varchar(225) DEFAULT NULL,
  `nationality_id` int(11) DEFAULT NULL,
  `state_id` int(11) DEFAULT NULL,
  `register_bonus` int(11) DEFAULT NULL,
  `otp` int(11) DEFAULT NULL,
  `facebook` varchar(225) DEFAULT NULL,
  `wallet_balance` decimal(10,2) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `with_show_password` varchar(255) DEFAULT NULL,
  `with_password` varchar(255) DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `telegram` varchar(255) DEFAULT NULL,
  `whtsapp` varchar(255) DEFAULT NULL,
  `othersway_connect` varchar(255) DEFAULT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `entry_by` int(11) DEFAULT NULL,
  `register_ip` varchar(255) DEFAULT NULL,
  `lastlogin_ip` varchar(255) DEFAULT NULL,
  `lastlogin_country` varchar(255) DEFAULT NULL,
  `lastlogin_datetime` datetime DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `status` int(11) DEFAULT 0,
  `logged_out` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `uic_id`, `uic_address`, `inviteCode`, `ref_id`, `employee_id`, `role_id`, `email`, `available_balance`, `spincount`, `taptap_coin`, `mining_amount`, `level_commission`, `show_password`, `name`, `real_name`, `phone_number`, `image`, `doc_file`, `address`, `address_1`, `address_2`, `website`, `github`, `gender`, `date_of_birth`, `twitter`, `instagram`, `nationality_id`, `state_id`, `register_bonus`, `otp`, `facebook`, `wallet_balance`, `password`, `with_show_password`, `with_password`, `email_verified_at`, `telegram`, `whtsapp`, `othersway_connect`, `remember_token`, `entry_by`, `register_ip`, `lastlogin_ip`, `lastlogin_country`, `lastlogin_datetime`, `created_at`, `updated_at`, `status`, `logged_out`) VALUES
(1, NULL, '6f21357fs863ce24ce21c1a82f49a7d5d13', '0000123', 0, 4, 1, 'dev1@mail.com', 1.00000000, NULL, NULL, NULL, 3, 'dev1@mail.com', 'Dev1', NULL, '0000123', '/backend/files/hZkagctUSINKsFU64UJr.png', NULL, 'DHK', '', '', 'bijopforile.com', 'github/bijonahmed', '', '1982-01-30', 'http://localhost:3000/profile', 'Instagram/bijonahmed', 0, 0, 0, NULL, 'http://localhost:3000/profile', NULL, '$2a$12$oT7dmrympiE1Y1tfnz8iIOYWGL1qLEtpB5LDmVAwVEhxZ6rPHLmJq', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '127.0.0.1', NULL, '2024-08-17 07:48:32', '2023-06-22 03:20:43', '2024-08-17 02:03:12', 1, NULL),
(2, 'UIC000000002', '3839cc87060e26b9e4111f63af1ab7f4', '23450058', 1, NULL, 2, 'test1@gmail.com', 2.00000000, 2680, 90, NULL, 4, 'test1@gmail.com', 'test1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, NULL, NULL, NULL, '$2y$10$q7j/lOS0aduUUKOfbVHfbuc5CiQ95KRykUzIEhvmUHLz0dH8b0Rfu', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '127.0.0.1', '127.0.0.1', NULL, '2024-08-16 18:30:37', '2024-08-16 12:29:05', '2024-08-16 18:05:43', 1, NULL),
(3, 'UIC000000003', 'b50c4e5581de4cc991a60c4b097309a4', '33706308', 2, NULL, 2, 'test2@gmail.com', 5.00000000, NULL, NULL, NULL, 2, 'test2@gmail.com', 'test2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, NULL, NULL, NULL, '$2y$10$eiBY/wtRMblYq045R6vRpuRjTERccVYlLhCcKilv.MsEUh1e6fwuS', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '127.0.0.1', '127.0.0.1', NULL, '2024-08-16 19:20:08', '2024-08-16 13:19:30', '2024-08-16 13:26:44', 1, NULL),
(4, 'UIC000000004', 'e6b4858ec462b75130582e986936d259', '44351421', 3, NULL, 2, 'test3@gmail.com', 5.00000000, NULL, NULL, NULL, 3, 'test3@gmail.com', 'test3', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, NULL, NULL, NULL, '$2y$10$aNacMa71COohjYj.uV8vCOAviSGRmAWhtOWT5z0gRnwWIG/7yv2B6', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '127.0.0.1', '127.0.0.1', NULL, '2024-08-16 19:26:11', '2024-08-16 13:20:35', '2024-08-16 13:26:44', 1, NULL),
(5, 'UIC000000005', 'baf706206b7903142e1ad86806c7f45b', '58047905', 4, NULL, 2, 'test4@gmail.com', 5.00000000, NULL, NULL, NULL, NULL, 'test4@gmail.com', 'test4', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, NULL, NULL, NULL, '$2y$10$pYIi3CBBk4RuKfa8qo3kjuktk3UB/H5.NCSXFBr3uim2pGl5HUeka', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, '2024-08-16 13:26:44', '2024-08-16 13:26:44', 1, NULL),
(6, 'UIC000000006', 'c399147ccbf9aeeb93bfb710d60a61f3', '66438775', 2, NULL, 2, 'test5@gmail.com', 5.00000000, NULL, NULL, NULL, NULL, 'test5@gmail.com', 'test5', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, NULL, NULL, NULL, '$2y$10$4jDggGkkFr70E5alyP5yTeWbhEtIYsKtDupor/m9Zf5TbR9DHRdty', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '127.0.0.1', '127.0.0.1', NULL, '2024-08-16 20:20:39', '2024-08-16 13:57:23', '2024-08-16 14:20:39', 1, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `verifyemail`
--

CREATE TABLE `verifyemail` (
  `id` int(11) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `status` int(11) DEFAULT NULL COMMENT '1=active,0=inactive',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `withdraw`
--

CREATE TABLE `withdraw` (
  `id` int(11) NOT NULL,
  `withdrawID` varchar(255) DEFAULT NULL,
  `depscription` text DEFAULT NULL,
  `payment_method` varchar(255) DEFAULT NULL,
  `account_number` varchar(255) DEFAULT NULL,
  `usd_amount` varchar(255) DEFAULT NULL,
  `uic_amount` varchar(255) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `receivable_amount` int(11) DEFAULT NULL COMMENT 'no need this column',
  `password` varchar(255) DEFAULT NULL,
  `remarks` text DEFAULT NULL,
  `approved_by` int(11) DEFAULT NULL,
  `transection_fee` int(11) NOT NULL COMMENT '%',
  `payable_amount` double(10,2) DEFAULT NULL COMMENT 'After 5% deduction amount',
  `withdraw_amount` double(10,2) DEFAULT NULL,
  `withdrawal_method_id` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL COMMENT ' 	0=Review,2=Reject,1=Approved 	',
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `withdraw`
--

INSERT INTO `withdraw` (`id`, `withdrawID`, `depscription`, `payment_method`, `account_number`, `usd_amount`, `uic_amount`, `user_id`, `receivable_amount`, `password`, `remarks`, `approved_by`, `transection_fee`, `payable_amount`, `withdraw_amount`, `withdrawal_method_id`, `status`, `created_at`, `updated_at`) VALUES
(1, 'W.eb37b9bd6dbd6f66cd3fe110037e5974', 'W.eb37b9bd6dbd6f66cd3fe110037e5974', 'USDT TRC-20', 'vzxvxgfdgdgdgdgdfg', '490.00', '14.00', 2, NULL, 'test1@gmail.com', NULL, NULL, 0, NULL, 14.00, NULL, 0, '2024-08-16 15:36:27', '2024-08-16 15:36:27');

-- --------------------------------------------------------

--
-- Table structure for table `withdrawal_method`
--

CREATE TABLE `withdrawal_method` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `account_number` varchar(255) DEFAULT NULL,
  `currency_type_id` int(11) DEFAULT NULL,
  `wallet_address` varchar(255) DEFAULT NULL,
  `remarks` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `withdrawal_method`
--

INSERT INTO `withdrawal_method` (`id`, `user_id`, `name`, `account_number`, `currency_type_id`, `wallet_address`, `remarks`, `created_at`, `updated_at`) VALUES
(1, 3, 'JBL', '2255666', NULL, NULL, NULL, '2024-06-09 14:19:43', '2024-06-09 14:19:43'),
(5, 3, 'Test-5', '6898999', NULL, NULL, NULL, '2024-06-09 14:22:25', '2024-06-09 14:22:25'),
(6, 3, 'USDT TRC-20', '455566666666666', NULL, NULL, NULL, '2024-06-28 11:26:45', '2024-06-28 11:26:45'),
(7, 3, 'USDT TRC-20', '89645665566666', NULL, NULL, NULL, '2024-06-28 11:27:20', '2024-06-28 11:27:20'),
(8, 2, 'USDT TRC-20', 'vzxvxgfdgdgdgdgdfg', NULL, NULL, NULL, '2024-08-16 15:34:27', '2024-08-16 15:34:27');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categorys`
--
ALTER TABLE `categorys`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `community`
--
ALTER TABLE `community`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `countdown`
--
ALTER TABLE `countdown`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `country`
--
ALTER TABLE `country`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `currency_type`
--
ALTER TABLE `currency_type`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `customer_history`
--
ALTER TABLE `customer_history`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `deposit`
--
ALTER TABLE `deposit`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `expense_history`
--
ALTER TABLE `expense_history`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `kyc`
--
ALTER TABLE `kyc`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `logs`
--
ALTER TABLE `logs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `manual_adjustment`
--
ALTER TABLE `manual_adjustment`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mininghistory`
--
ALTER TABLE `mininghistory`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mining_categogy`
--
ALTER TABLE `mining_categogy`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mining_categogy_duration`
--
ALTER TABLE `mining_categogy_duration`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mining_process_history`
--
ALTER TABLE `mining_process_history`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mining_service_buy_history`
--
ALTER TABLE `mining_service_buy_history`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notification`
--
ALTER TABLE `notification`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `orderId` (`orderId`);

--
-- Indexes for table `order_status`
--
ALTER TABLE `order_status`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `post_category`
--
ALTER TABLE `post_category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `post_like`
--
ALTER TABLE `post_like`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `produc_categories`
--
ALTER TABLE `produc_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `produc_img_history`
--
ALTER TABLE `produc_img_history`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `rule`
--
ALTER TABLE `rule`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `send_received`
--
ALTER TABLE `send_received`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `service`
--
ALTER TABLE `service`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `setting`
--
ALTER TABLE `setting`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sliders`
--
ALTER TABLE `sliders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `spin_setup`
--
ALTER TABLE `spin_setup`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `states`
--
ALTER TABLE `states`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `swaphistory`
--
ALTER TABLE `swaphistory`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `transaction_history`
--
ALTER TABLE `transaction_history`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `transfer`
--
ALTER TABLE `transfer`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `uic_address` (`uic_address`);

--
-- Indexes for table `verifyemail`
--
ALTER TABLE `verifyemail`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `withdraw`
--
ALTER TABLE `withdraw`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `withdrawal_method`
--
ALTER TABLE `withdrawal_method`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `brands`
--
ALTER TABLE `brands`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `categorys`
--
ALTER TABLE `categorys`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `community`
--
ALTER TABLE `community`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `countdown`
--
ALTER TABLE `countdown`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `country`
--
ALTER TABLE `country`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=247;

--
-- AUTO_INCREMENT for table `currency_type`
--
ALTER TABLE `currency_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `customer`
--
ALTER TABLE `customer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `customer_history`
--
ALTER TABLE `customer_history`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `deposit`
--
ALTER TABLE `deposit`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `expense_history`
--
ALTER TABLE `expense_history`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=80;

--
-- AUTO_INCREMENT for table `kyc`
--
ALTER TABLE `kyc`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `logs`
--
ALTER TABLE `logs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `manual_adjustment`
--
ALTER TABLE `manual_adjustment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `messages`
--
ALTER TABLE `messages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `mininghistory`
--
ALTER TABLE `mininghistory`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=62;

--
-- AUTO_INCREMENT for table `mining_categogy`
--
ALTER TABLE `mining_categogy`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `mining_categogy_duration`
--
ALTER TABLE `mining_categogy_duration`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `mining_process_history`
--
ALTER TABLE `mining_process_history`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `mining_service_buy_history`
--
ALTER TABLE `mining_service_buy_history`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `notification`
--
ALTER TABLE `notification`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `order_status`
--
ALTER TABLE `order_status`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `post_category`
--
ALTER TABLE `post_category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `post_like`
--
ALTER TABLE `post_like`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `produc_categories`
--
ALTER TABLE `produc_categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `produc_img_history`
--
ALTER TABLE `produc_img_history`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `rule`
--
ALTER TABLE `rule`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `send_received`
--
ALTER TABLE `send_received`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `service`
--
ALTER TABLE `service`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `setting`
--
ALTER TABLE `setting`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `sliders`
--
ALTER TABLE `sliders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `spin_setup`
--
ALTER TABLE `spin_setup`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `states`
--
ALTER TABLE `states`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `swaphistory`
--
ALTER TABLE `swaphistory`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `transaction_history`
--
ALTER TABLE `transaction_history`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `transfer`
--
ALTER TABLE `transfer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `verifyemail`
--
ALTER TABLE `verifyemail`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `withdraw`
--
ALTER TABLE `withdraw`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `withdrawal_method`
--
ALTER TABLE `withdrawal_method`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
