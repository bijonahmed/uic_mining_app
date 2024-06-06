-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 06, 2024 at 11:33 PM
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
(1, 'D.22cf8d98dca2b9de5052ae9253bddef3', 'D.46dce5f2f0e61edb70931a00d00a464e', 3, 50.00, NULL, 'USDT (TRC20)', 'D.22cf8d98dca2b9de5052ae9253bddef3', NULL, 1, NULL, '2024-06-07 01:37:24', '2024-06-07 01:37:24'),
(2, 'D.31a6b5568bbb9c350c1b296d9086acf0', 'D.22cf8d98dca2b9de5052ae9253bddef3', 3, 60.00, NULL, 'USDT (TRC20)', 'D.31a6b5568bbb9c350c1b296d9086acf0', NULL, 0, NULL, '2024-06-07 02:00:03', '2024-06-07 02:00:03');

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
(37, 'default', '{\"uuid\":\"3d005c50-d22f-4658-ada6-fde2a7427116\",\"displayName\":\"App\\\\Events\\\\Message\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":14:{s:5:\\\"event\\\";O:18:\\\"App\\\\Events\\\\Message\\\":4:{s:8:\\\"username\\\";s:11:\\\"b@gmail.com\\\";s:7:\\\"message\\\";s:23:\\\"yes sir i\'m okay please\\\";s:14:\\\"community_slug\\\";s:17:\\\"community-english\\\";s:10:\\\"created_at\\\";s:19:\\\"2024-06-06 03:02:01\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}\"}}', 0, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00');

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

--
-- Dumping data for table `logs`
--

INSERT INTO `logs` (`id`, `user_id`, `user_agent`, `method`, `full_request`, `url`, `ip`, `created_at`, `updated_at`) VALUES
(1, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'POST', '{\"username\":\"Bijon\",\"message\":\"Hello\"}', 'http://127.0.0.1:8000/api/messages', '127.0.0.1', '2024-06-01 05:48:36', '2024-06-01 05:48:36'),
(2, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:127.0) Gecko/20100101 Firefox/127.0', 'POST', '{\"username\":\"Ibraheem\",\"message\":\"Yes\"}', 'http://127.0.0.1:8000/api/messages', '127.0.0.1', '2024-06-01 05:48:49', '2024-06-01 05:48:49'),
(3, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'POST', '{\"username\":\"Bijon\",\"message\":\"Baba come to me\"}', 'http://127.0.0.1:8000/api/messages', '127.0.0.1', '2024-06-01 05:49:05', '2024-06-01 05:49:05'),
(4, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'POST', '{\"username\":\"Bijon\",\"message\":\"Hello\"}', 'http://127.0.0.1:8000/api/messages', '127.0.0.1', '2024-06-01 05:53:46', '2024-06-01 05:53:46'),
(5, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'POST', '{\"username\":\"Bijon\",\"message\":\"Bijon how are you\"}', 'http://127.0.0.1:8000/api/messages', '127.0.0.1', '2024-06-01 05:53:53', '2024-06-01 05:53:53'),
(6, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:127.0) Gecko/20100101 Firefox/127.0', 'POST', '{\"username\":\"Kabir\",\"message\":\"Yes bijon bhia I\'m fine you\"}', 'http://127.0.0.1:8000/api/messages', '127.0.0.1', '2024-06-01 05:54:03', '2024-06-01 05:54:03'),
(7, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'POST', '{\"username\":\"Bijon\",\"message\":\"Hello\"}', 'http://127.0.0.1:8000/api/messages', '127.0.0.1', '2024-06-01 05:55:33', '2024-06-01 05:55:33'),
(8, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:127.0) Gecko/20100101 Firefox/127.0', 'POST', '{\"username\":\"Kabir\",\"message\":\"Yes , bijon bhai when come\"}', 'http://127.0.0.1:8000/api/messages', '127.0.0.1', '2024-06-01 05:55:55', '2024-06-01 05:55:55'),
(9, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'POST', '{\"username\":\"Bijon\",\"message\":\"Yes brother I have problem\"}', 'http://127.0.0.1:8000/api/messages', '127.0.0.1', '2024-06-01 05:56:13', '2024-06-01 05:56:13'),
(10, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:127.0) Gecko/20100101 Firefox/127.0', 'POST', '{\"username\":\"Kabir\",\"message\":\"what problem ..? please explain\"}', 'http://127.0.0.1:8000/api/messages', '127.0.0.1', '2024-06-01 05:56:26', '2024-06-01 05:56:26'),
(11, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', 'POST', '{\"username\":\"Mamun  Bhai\",\"message\":\"Yes\"}', 'http://127.0.0.1:8000/api/messages', '127.0.0.1', '2024-06-01 05:59:56', '2024-06-01 05:59:56'),
(12, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', 'POST', '{\"username\":\"Mamun  Bhai\",\"message\":\"Please leesion to me ..\"}', 'http://127.0.0.1:8000/api/messages', '127.0.0.1', '2024-06-01 06:00:11', '2024-06-01 06:00:11'),
(13, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'POST', '{\"username\":\"Bijon\",\"message\":\"Yes tell me\"}', 'http://127.0.0.1:8000/api/messages', '127.0.0.1', '2024-06-01 06:00:21', '2024-06-01 06:00:21'),
(14, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'POST', '{\"username\":\"vv\",\"message\":\"xcv\"}', 'http://127.0.0.1:8000/api/messages', '127.0.0.1', '2024-06-01 06:14:16', '2024-06-01 06:14:16'),
(15, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'GET', '[]', 'http://127.0.0.1:8000/api/setting/settingrow', '127.0.0.1', '2024-06-01 06:14:58', '2024-06-01 06:14:58'),
(16, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'GET', '[]', 'http://127.0.0.1:8000/api/mining/checkMiningInfo', '127.0.0.1', '2024-06-01 06:14:59', '2024-06-01 06:14:59'),
(17, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'POST', '[]', 'http://127.0.0.1:8000/api/auth/me', '127.0.0.1', '2024-06-01 06:15:01', '2024-06-01 06:15:01'),
(18, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'GET', '[]', 'http://127.0.0.1:8000/api/setting/settingrow', '127.0.0.1', '2024-06-01 06:15:20', '2024-06-01 06:15:20'),
(19, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'GET', '[]', 'http://127.0.0.1:8000/api/mining/checkMiningInfo', '127.0.0.1', '2024-06-01 06:15:21', '2024-06-01 06:15:21'),
(20, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'GET', '[]', 'http://127.0.0.1:8000/api/setting/settingrow', '127.0.0.1', '2024-06-01 06:15:25', '2024-06-01 06:15:25'),
(21, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'GET', '[]', 'http://127.0.0.1:8000/api/mining/checkMiningInfo', '127.0.0.1', '2024-06-01 06:15:25', '2024-06-01 06:15:25'),
(22, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'POST', '[]', 'http://127.0.0.1:8000/api/auth/me', '127.0.0.1', '2024-06-01 06:15:29', '2024-06-01 06:15:29'),
(23, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'GET', '[]', 'http://127.0.0.1:8000/api/setting/settingrow', '127.0.0.1', '2024-06-01 06:17:05', '2024-06-01 06:17:05'),
(24, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'GET', '[]', 'http://127.0.0.1:8000/api/mining/checkMiningInfo', '127.0.0.1', '2024-06-01 06:17:05', '2024-06-01 06:17:05'),
(25, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'POST', '{\"email\":\"b@gmail.com\",\"password\":\"b@gmail.com\",\"captchaInput\":\"972686\",\"userCapInput\":\"972686\"}', 'http://127.0.0.1:8000/api/auth/login', '127.0.0.1', '2024-06-01 06:22:08', '2024-06-01 06:22:08'),
(26, 3, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'GET', '[]', 'http://127.0.0.1:8000/api/setting/settingrow', '127.0.0.1', '2024-06-01 06:22:09', '2024-06-01 06:22:09'),
(27, 3, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'GET', '[]', 'http://127.0.0.1:8000/api/mining/checkMiningInfo', '127.0.0.1', '2024-06-01 06:22:10', '2024-06-01 06:22:10'),
(28, 3, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'GET', '{\"mining_category_id\":\"1\"}', 'http://127.0.0.1:8000/api/mining/miningProcessState?mining_category_id=1', '127.0.0.1', '2024-06-01 06:22:10', '2024-06-01 06:22:10'),
(29, 3, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'GET', '{\"mining_category_id\":\"3\"}', 'http://127.0.0.1:8000/api/mining/miningProcessState?mining_category_id=3', '127.0.0.1', '2024-06-01 06:22:10', '2024-06-01 06:22:10'),
(30, 3, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'POST', '[]', 'http://127.0.0.1:8000/api/auth/me', '127.0.0.1', '2024-06-01 06:22:12', '2024-06-01 06:22:12'),
(31, 3, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'GET', '[]', 'http://127.0.0.1:8000/api/auth/showProfileData', '127.0.0.1', '2024-06-01 06:22:16', '2024-06-01 06:22:16'),
(32, 3, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'GET', '[]', 'http://127.0.0.1:8000/api/auth/showProfileData', '127.0.0.1', '2024-06-01 06:26:52', '2024-06-01 06:26:52'),
(33, 3, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'GET', '[]', 'http://127.0.0.1:8000/api/setting/settingrow', '127.0.0.1', '2024-06-01 06:28:05', '2024-06-01 06:28:05'),
(34, 3, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'GET', '[]', 'http://127.0.0.1:8000/api/mining/checkMiningInfo', '127.0.0.1', '2024-06-01 06:28:05', '2024-06-01 06:28:05'),
(35, 3, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'GET', '[]', 'http://127.0.0.1:8000/api/mining/checkMiningInfo', '127.0.0.1', '2024-06-01 06:28:07', '2024-06-01 06:28:07'),
(36, 3, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'GET', '[]', 'http://127.0.0.1:8000/api/setting/settingrow', '127.0.0.1', '2024-06-01 06:28:08', '2024-06-01 06:28:08'),
(37, 3, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'GET', '{\"mining_category_id\":\"1\"}', 'http://127.0.0.1:8000/api/mining/miningProcessState?mining_category_id=1', '127.0.0.1', '2024-06-01 06:28:08', '2024-06-01 06:28:08'),
(38, 3, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'GET', '{\"mining_category_id\":\"3\"}', 'http://127.0.0.1:8000/api/mining/miningProcessState?mining_category_id=3', '127.0.0.1', '2024-06-01 06:28:08', '2024-06-01 06:28:08'),
(39, 3, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'POST', '[]', 'http://127.0.0.1:8000/api/auth/me', '127.0.0.1', '2024-06-01 06:28:10', '2024-06-01 06:28:10'),
(40, 3, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'GET', '[]', 'http://127.0.0.1:8000/api/users/getCommunity', '127.0.0.1', '2024-06-01 06:44:49', '2024-06-01 06:44:49'),
(41, 3, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'GET', '[]', 'http://127.0.0.1:8000/api/users/getCommunity', '127.0.0.1', '2024-06-01 06:44:54', '2024-06-01 06:44:54'),
(42, 3, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'GET', '[]', 'http://127.0.0.1:8000/api/user/getCommunity', '127.0.0.1', '2024-06-01 06:45:24', '2024-06-01 06:45:24'),
(43, 3, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'GET', '[]', 'http://127.0.0.1:8000/api/user/getCommunity', '127.0.0.1', '2024-06-01 06:45:31', '2024-06-01 06:45:31'),
(44, 3, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'GET', '[]', 'http://127.0.0.1:8000/api/user/getCommunity', '127.0.0.1', '2024-06-01 06:46:04', '2024-06-01 06:46:04'),
(45, 3, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'GET', '[]', 'http://127.0.0.1:8000/api/user/getCommunity', '127.0.0.1', '2024-06-01 06:46:45', '2024-06-01 06:46:45'),
(46, 3, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'GET', '[]', 'http://127.0.0.1:8000/api/user/getCommunity', '127.0.0.1', '2024-06-01 06:46:51', '2024-06-01 06:46:51'),
(47, 3, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'GET', '[]', 'http://127.0.0.1:8000/api/user/getCommunity', '127.0.0.1', '2024-06-01 06:47:47', '2024-06-01 06:47:47'),
(48, 3, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'GET', '[]', 'http://127.0.0.1:8000/api/user/getCommunity', '127.0.0.1', '2024-06-01 06:51:52', '2024-06-01 06:51:52'),
(49, 3, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'GET', '[]', 'http://127.0.0.1:8000/api/user/getCommunity', '127.0.0.1', '2024-06-01 06:52:24', '2024-06-01 06:52:24'),
(50, 3, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'GET', '[]', 'http://127.0.0.1:8000/api/setting/settingrow', '127.0.0.1', '2024-06-01 06:54:59', '2024-06-01 06:54:59'),
(51, 3, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'GET', '[]', 'http://127.0.0.1:8000/api/mining/checkMiningInfo', '127.0.0.1', '2024-06-01 06:54:59', '2024-06-01 06:54:59'),
(52, 3, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'GET', '{\"mining_category_id\":\"1\"}', 'http://127.0.0.1:8000/api/mining/miningProcessState?mining_category_id=1', '127.0.0.1', '2024-06-01 06:54:59', '2024-06-01 06:54:59'),
(53, 3, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'GET', '{\"mining_category_id\":\"3\"}', 'http://127.0.0.1:8000/api/mining/miningProcessState?mining_category_id=3', '127.0.0.1', '2024-06-01 06:54:59', '2024-06-01 06:54:59'),
(54, 3, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'GET', '[]', 'http://127.0.0.1:8000/api/setting/settingrow', '127.0.0.1', '2024-06-01 06:55:01', '2024-06-01 06:55:01'),
(55, 3, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'GET', '[]', 'http://127.0.0.1:8000/api/mining/checkMiningInfo', '127.0.0.1', '2024-06-01 06:55:01', '2024-06-01 06:55:01'),
(56, 3, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'GET', '{\"mining_category_id\":\"1\"}', 'http://127.0.0.1:8000/api/mining/miningProcessState?mining_category_id=1', '127.0.0.1', '2024-06-01 06:55:02', '2024-06-01 06:55:02'),
(57, 3, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'GET', '{\"mining_category_id\":\"3\"}', 'http://127.0.0.1:8000/api/mining/miningProcessState?mining_category_id=3', '127.0.0.1', '2024-06-01 06:55:02', '2024-06-01 06:55:02'),
(58, 3, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'POST', '[]', 'http://127.0.0.1:8000/api/auth/me', '127.0.0.1', '2024-06-01 06:55:04', '2024-06-01 06:55:04'),
(59, 3, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'GET', '[]', 'http://127.0.0.1:8000/api/user/getCommunity', '127.0.0.1', '2024-06-01 06:55:07', '2024-06-01 06:55:07'),
(60, 3, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'GET', '[]', 'http://127.0.0.1:8000/api/user/getCommunity', '127.0.0.1', '2024-06-01 06:55:54', '2024-06-01 06:55:54'),
(61, 3, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'GET', '[]', 'http://127.0.0.1:8000/api/setting/settingrow', '127.0.0.1', '2024-06-01 06:58:32', '2024-06-01 06:58:32'),
(62, 3, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'GET', '[]', 'http://127.0.0.1:8000/api/mining/checkMiningInfo', '127.0.0.1', '2024-06-01 06:58:32', '2024-06-01 06:58:32'),
(63, 3, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'GET', '{\"mining_category_id\":\"1\"}', 'http://127.0.0.1:8000/api/mining/miningProcessState?mining_category_id=1', '127.0.0.1', '2024-06-01 06:58:33', '2024-06-01 06:58:33'),
(64, 3, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'GET', '{\"mining_category_id\":\"3\"}', 'http://127.0.0.1:8000/api/mining/miningProcessState?mining_category_id=3', '127.0.0.1', '2024-06-01 06:58:33', '2024-06-01 06:58:33'),
(65, 3, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'GET', '[]', 'http://127.0.0.1:8000/api/setting/settingrow', '127.0.0.1', '2024-06-01 06:58:35', '2024-06-01 06:58:35'),
(66, 3, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'GET', '[]', 'http://127.0.0.1:8000/api/mining/checkMiningInfo', '127.0.0.1', '2024-06-01 06:58:35', '2024-06-01 06:58:35'),
(67, 3, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'GET', '{\"mining_category_id\":\"1\"}', 'http://127.0.0.1:8000/api/mining/miningProcessState?mining_category_id=1', '127.0.0.1', '2024-06-01 06:58:36', '2024-06-01 06:58:36'),
(68, 3, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'GET', '{\"mining_category_id\":\"3\"}', 'http://127.0.0.1:8000/api/mining/miningProcessState?mining_category_id=3', '127.0.0.1', '2024-06-01 06:58:36', '2024-06-01 06:58:36'),
(69, 3, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'POST', '[]', 'http://127.0.0.1:8000/api/auth/me', '127.0.0.1', '2024-06-01 06:58:38', '2024-06-01 06:58:38'),
(70, 3, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'GET', '[]', 'http://127.0.0.1:8000/api/user/getCommunity', '127.0.0.1', '2024-06-01 06:58:42', '2024-06-01 06:58:42'),
(71, 3, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'GET', '[]', 'http://127.0.0.1:8000/api/user/getCommunity', '127.0.0.1', '2024-06-01 07:05:00', '2024-06-01 07:05:00'),
(72, 3, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'GET', '[]', 'http://127.0.0.1:8000/api/user/getCommunity', '127.0.0.1', '2024-06-01 07:07:16', '2024-06-01 07:07:16'),
(73, 3, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'GET', '[]', 'http://127.0.0.1:8000/api/user/getCommunity', '127.0.0.1', '2024-06-01 07:07:25', '2024-06-01 07:07:25'),
(74, 3, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'GET', '[]', 'http://127.0.0.1:8000/api/user/getCommunity', '127.0.0.1', '2024-06-01 07:07:31', '2024-06-01 07:07:31'),
(75, 3, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'GET', '[]', 'http://127.0.0.1:8000/api/setting/settingrow', '127.0.0.1', '2024-06-01 07:10:28', '2024-06-01 07:10:28'),
(76, 3, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'GET', '[]', 'http://127.0.0.1:8000/api/mining/checkMiningInfo', '127.0.0.1', '2024-06-01 07:10:28', '2024-06-01 07:10:28'),
(77, 3, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'GET', '{\"mining_category_id\":\"1\"}', 'http://127.0.0.1:8000/api/mining/miningProcessState?mining_category_id=1', '127.0.0.1', '2024-06-01 07:10:28', '2024-06-01 07:10:28'),
(78, 3, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'GET', '{\"mining_category_id\":\"3\"}', 'http://127.0.0.1:8000/api/mining/miningProcessState?mining_category_id=3', '127.0.0.1', '2024-06-01 07:10:28', '2024-06-01 07:10:28'),
(79, 3, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'POST', '[]', 'http://127.0.0.1:8000/api/auth/me', '127.0.0.1', '2024-06-01 07:10:30', '2024-06-01 07:10:30'),
(80, 3, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'GET', '[]', 'http://127.0.0.1:8000/api/user/getCommunity', '127.0.0.1', '2024-06-01 07:10:35', '2024-06-01 07:10:35'),
(81, 3, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'POST', '{\"username\":\"username\",\"message\":\"Hello\"}', 'http://127.0.0.1:8000/api/messages', '127.0.0.1', '2024-06-01 07:16:19', '2024-06-01 07:16:19'),
(82, 3, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'POST', '{\"username\":\"community-english\",\"message\":\"Hello\"}', 'http://127.0.0.1:8000/api/messages', '127.0.0.1', '2024-06-01 07:16:57', '2024-06-01 07:16:57'),
(83, 3, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'POST', '{\"username\":\"community-english\",\"message\":\"Hello\"}', 'http://127.0.0.1:8000/api/messages', '127.0.0.1', '2024-06-01 07:18:43', '2024-06-01 07:18:43'),
(84, 3, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'POST', '{\"username\":\"community-english\",\"message\":\"bijon how are you\"}', 'http://127.0.0.1:8000/api/messages', '127.0.0.1', '2024-06-01 07:19:16', '2024-06-01 07:19:16'),
(85, 3, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'POST', '{\"username\":\"community-english\",\"message\":\"What are ydow doing ..\"}', 'http://127.0.0.1:8000/api/messages', '127.0.0.1', '2024-06-01 07:19:28', '2024-06-01 07:19:28'),
(86, 3, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'POST', '{\"username\":\"community-english\",\"message\":\"Hello\",\"community_slug\":\"community-english\"}', 'http://127.0.0.1:8000/api/messages', '127.0.0.1', '2024-06-01 07:34:28', '2024-06-01 07:34:28'),
(87, 3, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'POST', '{\"username\":\"community-english\",\"message\":\"Hello\",\"community_slug\":\"community-english\"}', 'http://127.0.0.1:8000/api/messages', '127.0.0.1', '2024-06-01 07:35:03', '2024-06-01 07:35:03'),
(88, 3, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'POST', '{\"username\":\"community-english\",\"message\":\"Hello\",\"community_slug\":\"community-english\"}', 'http://127.0.0.1:8000/api/messages', '127.0.0.1', '2024-06-01 07:35:42', '2024-06-01 07:35:42'),
(89, 3, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'POST', '{\"username\":\"community-english\",\"message\":\"Hello bijon\",\"community_slug\":\"community-english\"}', 'http://127.0.0.1:8000/api/messages', '127.0.0.1', '2024-06-01 07:37:57', '2024-06-01 07:37:57'),
(90, 3, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'GET', '[]', 'http://127.0.0.1:8000/api/messages/community-english', '127.0.0.1', '2024-06-01 07:40:57', '2024-06-01 07:40:57'),
(91, 3, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'POST', '{\"username\":\"community-english\",\"message\":\"How are you bijon\",\"community_slug\":\"community-english\"}', 'http://127.0.0.1:8000/api/messages', '127.0.0.1', '2024-06-01 07:41:11', '2024-06-01 07:41:11'),
(92, 3, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'POST', '{\"username\":\"community-english\",\"message\":\"really i miss you\",\"community_slug\":\"community-english\"}', 'http://127.0.0.1:8000/api/messages', '127.0.0.1', '2024-06-01 07:41:21', '2024-06-01 07:41:21'),
(93, 3, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'GET', '[]', 'http://127.0.0.1:8000/api/messages/community-english', '127.0.0.1', '2024-06-01 07:41:25', '2024-06-01 07:41:25'),
(94, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', 'GET', '[]', 'http://127.0.0.1:8000/api/setting/settingrow', '127.0.0.1', '2024-06-01 07:41:40', '2024-06-01 07:41:40'),
(95, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', 'GET', '[]', 'http://127.0.0.1:8000/api/mining/checkMiningInfo', '127.0.0.1', '2024-06-01 07:41:41', '2024-06-01 07:41:41'),
(96, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', 'POST', '[]', 'http://127.0.0.1:8000/api/auth/me', '127.0.0.1', '2024-06-01 07:41:43', '2024-06-01 07:41:43'),
(97, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', 'POST', '{\"email\":\"r@gmail.com\",\"password\":\"r@gmail.com\",\"captchaInput\":\"711153\",\"userCapInput\":\"711153\"}', 'http://127.0.0.1:8000/api/auth/login', '127.0.0.1', '2024-06-01 07:41:55', '2024-06-01 07:41:55'),
(98, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', 'GET', '[]', 'http://127.0.0.1:8000/api/setting/settingrow', '127.0.0.1', '2024-06-01 07:41:55', '2024-06-01 07:41:55'),
(99, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', 'GET', '[]', 'http://127.0.0.1:8000/api/mining/checkMiningInfo', '127.0.0.1', '2024-06-01 07:41:55', '2024-06-01 07:41:55'),
(100, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', 'POST', '[]', 'http://127.0.0.1:8000/api/auth/me', '127.0.0.1', '2024-06-01 07:41:58', '2024-06-01 07:41:58'),
(101, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', 'GET', '[]', 'http://127.0.0.1:8000/api/user/getCommunity', '127.0.0.1', '2024-06-01 07:42:03', '2024-06-01 07:42:03'),
(102, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', 'GET', '[]', 'http://127.0.0.1:8000/api/messages/community-chinese', '127.0.0.1', '2024-06-01 07:42:05', '2024-06-01 07:42:05'),
(103, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', 'GET', '[]', 'http://127.0.0.1:8000/api/user/getCommunity', '127.0.0.1', '2024-06-01 07:42:06', '2024-06-01 07:42:06'),
(104, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', 'GET', '[]', 'http://127.0.0.1:8000/api/messages/community-english', '127.0.0.1', '2024-06-01 07:42:07', '2024-06-01 07:42:07'),
(105, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', 'GET', '[]', 'http://127.0.0.1:8000/api/user/getCommunity', '127.0.0.1', '2024-06-01 07:42:09', '2024-06-01 07:42:09'),
(106, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', 'GET', '[]', 'http://127.0.0.1:8000/api/messages/community-chinese', '127.0.0.1', '2024-06-01 07:42:10', '2024-06-01 07:42:10'),
(107, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', 'POST', '{\"username\":\"community-chinese\",\"message\":\"Hello sumon this chinese community\",\"community_slug\":\"community-chinese\"}', 'http://127.0.0.1:8000/api/messages', '127.0.0.1', '2024-06-01 07:42:21', '2024-06-01 07:42:21'),
(108, 3, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'GET', '[]', 'http://127.0.0.1:8000/api/messages/community-english', '127.0.0.1', '2024-06-01 07:50:23', '2024-06-01 07:50:23'),
(109, 3, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'GET', '[]', 'http://127.0.0.1:8000/api/user/getCommunity', '127.0.0.1', '2024-06-01 07:50:28', '2024-06-01 07:50:28'),
(110, 3, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'GET', '[]', 'http://127.0.0.1:8000/api/messages/community-chinese', '127.0.0.1', '2024-06-01 07:50:30', '2024-06-01 07:50:30'),
(111, 3, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'GET', '[]', 'http://127.0.0.1:8000/api/user/getCommunity', '127.0.0.1', '2024-06-01 07:50:32', '2024-06-01 07:50:32'),
(112, 3, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'GET', '[]', 'http://127.0.0.1:8000/api/messages/community-english', '127.0.0.1', '2024-06-01 07:50:34', '2024-06-01 07:50:34'),
(113, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', 'POST', '{\"username\":\"community-chinese\",\"message\":\"Hi\",\"community_slug\":\"community-chinese\"}', 'http://127.0.0.1:8000/api/messages', '127.0.0.1', '2024-06-01 08:03:15', '2024-06-01 08:03:15'),
(114, 3, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'POST', '{\"username\":\"community-english\",\"message\":\"again come cinish messages\",\"community_slug\":\"community-english\"}', 'http://127.0.0.1:8000/api/messages', '127.0.0.1', '2024-06-01 08:03:25', '2024-06-01 08:03:25'),
(115, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', 'GET', '[]', 'http://127.0.0.1:8000/api/messages/community-chinese', '127.0.0.1', '2024-06-01 09:08:37', '2024-06-01 09:08:37'),
(116, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'GET', '[]', 'http://127.0.0.1:8000/api/setting/settingrow', '127.0.0.1', '2024-06-01 11:25:18', '2024-06-01 11:25:18'),
(117, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'GET', '[]', 'http://127.0.0.1:8000/api/mining/checkMiningInfo', '127.0.0.1', '2024-06-01 11:25:20', '2024-06-01 11:25:20'),
(118, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'POST', '[]', 'http://127.0.0.1:8000/api/auth/me', '127.0.0.1', '2024-06-01 11:25:22', '2024-06-01 11:25:22'),
(119, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'POST', '{\"email\":\"b@gmail.com\",\"password\":\"b@gmail.com\",\"captchaInput\":\"927435\",\"userCapInput\":\"927435\"}', 'http://127.0.0.1:8000/api/auth/login', '127.0.0.1', '2024-06-01 11:27:41', '2024-06-01 11:27:41'),
(120, 3, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'GET', '[]', 'http://127.0.0.1:8000/api/setting/settingrow', '127.0.0.1', '2024-06-01 11:27:42', '2024-06-01 11:27:42'),
(121, 3, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'GET', '[]', 'http://127.0.0.1:8000/api/mining/checkMiningInfo', '127.0.0.1', '2024-06-01 11:27:43', '2024-06-01 11:27:43'),
(122, 3, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'GET', '{\"mining_category_id\":\"1\"}', 'http://127.0.0.1:8000/api/mining/miningProcessState?mining_category_id=1', '127.0.0.1', '2024-06-01 11:27:43', '2024-06-01 11:27:43'),
(123, 3, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'GET', '{\"mining_category_id\":\"3\"}', 'http://127.0.0.1:8000/api/mining/miningProcessState?mining_category_id=3', '127.0.0.1', '2024-06-01 11:27:43', '2024-06-01 11:27:43'),
(124, 3, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'POST', '[]', 'http://127.0.0.1:8000/api/auth/me', '127.0.0.1', '2024-06-01 11:27:45', '2024-06-01 11:27:45'),
(125, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:127.0) Gecko/20100101 Firefox/127.0', 'GET', '[]', 'http://127.0.0.1:8000/api/setting/settingrow', '127.0.0.1', '2024-06-01 11:28:00', '2024-06-01 11:28:00'),
(126, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:127.0) Gecko/20100101 Firefox/127.0', 'GET', '[]', 'http://127.0.0.1:8000/api/mining/checkMiningInfo', '127.0.0.1', '2024-06-01 11:28:01', '2024-06-01 11:28:01'),
(127, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:127.0) Gecko/20100101 Firefox/127.0', 'POST', '[]', 'http://127.0.0.1:8000/api/auth/me', '127.0.0.1', '2024-06-01 11:28:03', '2024-06-01 11:28:03'),
(128, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:127.0) Gecko/20100101 Firefox/127.0', 'GET', '[]', 'http://127.0.0.1:8000/api/setting/settingrow', '127.0.0.1', '2024-06-01 11:28:18', '2024-06-01 11:28:18'),
(129, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:127.0) Gecko/20100101 Firefox/127.0', 'GET', '[]', 'http://127.0.0.1:8000/api/mining/checkMiningInfo', '127.0.0.1', '2024-06-01 11:28:19', '2024-06-01 11:28:19'),
(130, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:127.0) Gecko/20100101 Firefox/127.0', 'POST', '[]', 'http://127.0.0.1:8000/api/auth/me', '127.0.0.1', '2024-06-01 11:28:21', '2024-06-01 11:28:21'),
(131, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:127.0) Gecko/20100101 Firefox/127.0', 'POST', '{\"email\":\"r@gmail.com\",\"password\":\"r@gmail.com\",\"captchaInput\":\"579483\",\"userCapInput\":\"579483\"}', 'http://127.0.0.1:8000/api/auth/login', '127.0.0.1', '2024-06-01 11:28:32', '2024-06-01 11:28:32'),
(132, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:127.0) Gecko/20100101 Firefox/127.0', 'GET', '[]', 'http://127.0.0.1:8000/api/setting/settingrow', '127.0.0.1', '2024-06-01 11:28:32', '2024-06-01 11:28:32'),
(133, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:127.0) Gecko/20100101 Firefox/127.0', 'GET', '[]', 'http://127.0.0.1:8000/api/mining/checkMiningInfo', '127.0.0.1', '2024-06-01 11:28:32', '2024-06-01 11:28:32'),
(134, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:127.0) Gecko/20100101 Firefox/127.0', 'POST', '[]', 'http://127.0.0.1:8000/api/auth/me', '127.0.0.1', '2024-06-01 11:28:35', '2024-06-01 11:28:35'),
(135, 3, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'GET', '[]', 'http://127.0.0.1:8000/api/user/getCommunity', '127.0.0.1', '2024-06-01 11:32:24', '2024-06-01 11:32:24'),
(136, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:127.0) Gecko/20100101 Firefox/127.0', 'GET', '[]', 'http://127.0.0.1:8000/api/setting/settingrow', '127.0.0.1', '2024-06-01 11:39:11', '2024-06-01 11:39:11'),
(137, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:127.0) Gecko/20100101 Firefox/127.0', 'GET', '[]', 'http://127.0.0.1:8000/api/mining/checkMiningInfo', '127.0.0.1', '2024-06-01 11:39:11', '2024-06-01 11:39:11'),
(138, 3, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'GET', '[]', 'http://127.0.0.1:8000/api/user/getCommunity', '127.0.0.1', '2024-06-01 11:39:13', '2024-06-01 11:39:13'),
(139, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:127.0) Gecko/20100101 Firefox/127.0', 'POST', '[]', 'http://127.0.0.1:8000/api/auth/me', '127.0.0.1', '2024-06-01 11:39:15', '2024-06-01 11:39:15'),
(140, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:127.0) Gecko/20100101 Firefox/127.0', 'GET', '[]', 'http://127.0.0.1:8000/api/setting/settingrow', '127.0.0.1', '2024-06-01 11:39:27', '2024-06-01 11:39:27'),
(141, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:127.0) Gecko/20100101 Firefox/127.0', 'GET', '[]', 'http://127.0.0.1:8000/api/mining/checkMiningInfo', '127.0.0.1', '2024-06-01 11:39:27', '2024-06-01 11:39:27'),
(142, 3, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'GET', '[]', 'http://127.0.0.1:8000/api/user/getCommunity', '127.0.0.1', '2024-06-01 11:39:30', '2024-06-01 11:39:30'),
(143, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:127.0) Gecko/20100101 Firefox/127.0', 'POST', '[]', 'http://127.0.0.1:8000/api/auth/me', '127.0.0.1', '2024-06-01 11:39:31', '2024-06-01 11:39:31'),
(144, 3, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'GET', '[]', 'http://127.0.0.1:8000/api/messages/undefined', '127.0.0.1', '2024-06-01 11:39:33', '2024-06-01 11:39:33'),
(145, 3, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'GET', '[]', 'http://127.0.0.1:8000/api/messages/undefined', '127.0.0.1', '2024-06-01 11:52:59', '2024-06-01 11:52:59'),
(146, 3, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'GET', '[]', 'http://127.0.0.1:8000/api/messages/undefined', '127.0.0.1', '2024-06-01 11:53:03', '2024-06-01 11:53:03'),
(147, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:127.0) Gecko/20100101 Firefox/127.0', 'GET', '[]', 'http://127.0.0.1:8000/api/setting/settingrow', '127.0.0.1', '2024-06-01 11:54:03', '2024-06-01 11:54:03'),
(148, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:127.0) Gecko/20100101 Firefox/127.0', 'GET', '[]', 'http://127.0.0.1:8000/api/mining/checkMiningInfo', '127.0.0.1', '2024-06-01 11:54:03', '2024-06-01 11:54:03'),
(149, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:127.0) Gecko/20100101 Firefox/127.0', 'POST', '[]', 'http://127.0.0.1:8000/api/auth/me', '127.0.0.1', '2024-06-01 11:54:05', '2024-06-01 11:54:05'),
(150, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:127.0) Gecko/20100101 Firefox/127.0', 'GET', '[]', 'http://127.0.0.1:8000/api/user/getCommunity', '127.0.0.1', '2024-06-01 11:54:09', '2024-06-01 11:54:09'),
(151, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:127.0) Gecko/20100101 Firefox/127.0', 'GET', '[]', 'http://127.0.0.1:8000/api/messages/undefined', '127.0.0.1', '2024-06-01 11:54:11', '2024-06-01 11:54:11'),
(152, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:127.0) Gecko/20100101 Firefox/127.0', 'POST', '{\"username\":\"username\",\"message\":\"Hello\"}', 'http://127.0.0.1:8000/api/messages', '127.0.0.1', '2024-06-01 11:54:18', '2024-06-01 11:54:18'),
(153, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:127.0) Gecko/20100101 Firefox/127.0', 'POST', '{\"username\":\"username\",\"message\":\"Hello\"}', 'http://127.0.0.1:8000/api/messages', '127.0.0.1', '2024-06-01 11:54:22', '2024-06-01 11:54:22'),
(154, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:127.0) Gecko/20100101 Firefox/127.0', 'POST', '{\"username\":\"username\",\"message\":\"Hello\"}', 'http://127.0.0.1:8000/api/messages', '127.0.0.1', '2024-06-01 11:54:25', '2024-06-01 11:54:25'),
(155, 3, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'POST', '{\"username\":\"username\",\"message\":\"hello\"}', 'http://127.0.0.1:8000/api/messages', '127.0.0.1', '2024-06-01 11:54:34', '2024-06-01 11:54:34'),
(156, 3, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'POST', '{\"username\":\"username\",\"message\":\"hello\"}', 'http://127.0.0.1:8000/api/messages', '127.0.0.1', '2024-06-01 11:54:34', '2024-06-01 11:54:34'),
(157, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:127.0) Gecko/20100101 Firefox/127.0', 'GET', '[]', 'http://127.0.0.1:8000/api/messages/community-english', '127.0.0.1', '2024-06-01 11:55:02', '2024-06-01 11:55:02'),
(158, 3, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'GET', '[]', 'http://127.0.0.1:8000/api/messages/community-english', '127.0.0.1', '2024-06-01 11:55:02', '2024-06-01 11:55:02'),
(159, 3, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'POST', '{\"username\":\"community-english\",\"message\":\"hello\",\"community_slug\":\"community-english\"}', 'http://127.0.0.1:8000/api/messages', '127.0.0.1', '2024-06-01 11:55:21', '2024-06-01 11:55:21'),
(160, 3, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'POST', '{\"username\":\"community-english\",\"message\":\"hello\",\"community_slug\":\"community-english\"}', 'http://127.0.0.1:8000/api/messages', '127.0.0.1', '2024-06-01 11:55:24', '2024-06-01 11:55:24'),
(161, 3, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'POST', '{\"username\":\"community-english\",\"message\":\"jobs\",\"community_slug\":\"community-english\"}', 'http://127.0.0.1:8000/api/messages', '127.0.0.1', '2024-06-01 11:55:59', '2024-06-01 11:55:59'),
(162, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:127.0) Gecko/20100101 Firefox/127.0', 'POST', '{\"username\":\"community-english\",\"message\":\"yes bijon\",\"community_slug\":\"community-english\"}', 'http://127.0.0.1:8000/api/messages', '127.0.0.1', '2024-06-01 11:56:11', '2024-06-01 11:56:11'),
(163, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:127.0) Gecko/20100101 Firefox/127.0', 'GET', '[]', 'http://127.0.0.1:8000/api/messages/community-english', '127.0.0.1', '2024-06-01 11:56:16', '2024-06-01 11:56:16'),
(164, 3, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'GET', '[]', 'http://127.0.0.1:8000/api/messages/community-english', '127.0.0.1', '2024-06-01 11:56:23', '2024-06-01 11:56:23'),
(165, 3, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'POST', '{\"username\":\"community-english\",\"message\":\"hi\",\"community_slug\":\"community-english\"}', 'http://127.0.0.1:8000/api/messages', '127.0.0.1', '2024-06-01 11:57:02', '2024-06-01 11:57:02'),
(166, 3, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'POST', '{\"username\":\"community-english\",\"message\":\"ye sjonb what can i help ypu\",\"community_slug\":\"community-english\"}', 'http://127.0.0.1:8000/api/messages', '127.0.0.1', '2024-06-01 11:57:37', '2024-06-01 11:57:37'),
(167, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:127.0) Gecko/20100101 Firefox/127.0', 'POST', '{\"username\":\"community-english\",\"message\":\"ohh sorry\",\"community_slug\":\"community-english\"}', 'http://127.0.0.1:8000/api/messages', '127.0.0.1', '2024-06-01 11:57:43', '2024-06-01 11:57:43'),
(168, 3, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'POST', '{\"username\":\"community-english\",\"message\":\"oplease come\",\"community_slug\":\"community-english\"}', 'http://127.0.0.1:8000/api/messages', '127.0.0.1', '2024-06-01 12:02:48', '2024-06-01 12:02:48'),
(169, 3, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'POST', '{\"username\":\"community-english\",\"message\":\"hello\",\"community_slug\":\"community-english\"}', 'http://127.0.0.1:8000/api/messages', '127.0.0.1', '2024-06-01 12:02:55', '2024-06-01 12:02:55'),
(170, 3, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'POST', '{\"username\":\"community-english\",\"message\":\"helo bijon\",\"community_slug\":\"community-english\"}', 'http://127.0.0.1:8000/api/messages', '127.0.0.1', '2024-06-01 12:03:13', '2024-06-01 12:03:13'),
(171, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:127.0) Gecko/20100101 Firefox/127.0', 'GET', '[]', 'http://127.0.0.1:8000/api/messages/community-english', '127.0.0.1', '2024-06-01 12:08:27', '2024-06-01 12:08:27'),
(172, 3, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'GET', '[]', 'http://127.0.0.1:8000/api/messages/community-english', '127.0.0.1', '2024-06-01 12:08:29', '2024-06-01 12:08:29'),
(173, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:127.0) Gecko/20100101 Firefox/127.0', 'GET', '[]', 'http://127.0.0.1:8000/api/messages/undefined', '127.0.0.1', '2024-06-01 12:14:29', '2024-06-01 12:14:29'),
(174, 3, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'GET', '[]', 'http://127.0.0.1:8000/api/messages/undefined', '127.0.0.1', '2024-06-01 12:14:30', '2024-06-01 12:14:30'),
(175, 3, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'POST', '{\"username\":\"username\",\"message\":\"hello\"}', 'http://127.0.0.1:8000/api/messages', '127.0.0.1', '2024-06-01 12:14:35', '2024-06-01 12:14:35'),
(176, 3, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'GET', '[]', 'http://127.0.0.1:8000/api/messages/undefined', '127.0.0.1', '2024-06-01 12:16:17', '2024-06-01 12:16:17'),
(177, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:127.0) Gecko/20100101 Firefox/127.0', 'GET', '[]', 'http://127.0.0.1:8000/api/messages/undefined', '127.0.0.1', '2024-06-01 12:16:20', '2024-06-01 12:16:20'),
(178, 3, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'POST', '{\"username\":\"username\",\"message\":\"Hello\"}', 'http://127.0.0.1:8000/api/messages', '127.0.0.1', '2024-06-01 12:16:25', '2024-06-01 12:16:25'),
(179, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:127.0) Gecko/20100101 Firefox/127.0', 'GET', '[]', 'http://127.0.0.1:8000/api/messages/undefined', '127.0.0.1', '2024-06-01 12:16:46', '2024-06-01 12:16:46'),
(180, 3, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'GET', '[]', 'http://127.0.0.1:8000/api/messages/undefined', '127.0.0.1', '2024-06-01 12:16:47', '2024-06-01 12:16:47'),
(181, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:127.0) Gecko/20100101 Firefox/127.0', 'GET', '[]', 'http://127.0.0.1:8000/api/messages/community-english', '127.0.0.1', '2024-06-01 12:17:03', '2024-06-01 12:17:03'),
(182, 3, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'GET', '[]', 'http://127.0.0.1:8000/api/messages/community-english', '127.0.0.1', '2024-06-01 12:17:03', '2024-06-01 12:17:03'),
(183, 3, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'POST', '{\"username\":\"username\",\"message\":\"yes\",\"community_slug\":\"community-english\"}', 'http://127.0.0.1:8000/api/messages', '127.0.0.1', '2024-06-01 12:17:14', '2024-06-01 12:17:14'),
(184, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:127.0) Gecko/20100101 Firefox/127.0', 'GET', '[]', 'http://127.0.0.1:8000/api/user/getCommunity', '127.0.0.1', '2024-06-01 12:17:21', '2024-06-01 12:17:21'),
(185, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:127.0) Gecko/20100101 Firefox/127.0', 'GET', '[]', 'http://127.0.0.1:8000/api/messages/community-malasian', '127.0.0.1', '2024-06-01 12:17:23', '2024-06-01 12:17:23'),
(186, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:127.0) Gecko/20100101 Firefox/127.0', 'POST', '{\"username\":\"username\",\"message\":\"kmona\",\"community_slug\":\"community-malasian\"}', 'http://127.0.0.1:8000/api/messages', '127.0.0.1', '2024-06-01 12:17:27', '2024-06-01 12:17:27'),
(187, 3, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'POST', '{\"username\":\"username\",\"message\":\"kamal tumra koy\",\"community_slug\":\"community-english\"}', 'http://127.0.0.1:8000/api/messages', '127.0.0.1', '2024-06-01 12:17:37', '2024-06-01 12:17:37'),
(188, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:127.0) Gecko/20100101 Firefox/127.0', 'GET', '[]', 'http://127.0.0.1:8000/api/user/getCommunity', '127.0.0.1', '2024-06-01 12:17:42', '2024-06-01 12:17:42'),
(189, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:127.0) Gecko/20100101 Firefox/127.0', 'GET', '[]', 'http://127.0.0.1:8000/api/messages/community-english', '127.0.0.1', '2024-06-01 12:17:44', '2024-06-01 12:17:44'),
(190, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:127.0) Gecko/20100101 Firefox/127.0', 'GET', '[]', 'http://127.0.0.1:8000/api/user/getCommunity', '127.0.0.1', '2024-06-01 12:17:55', '2024-06-01 12:17:55'),
(191, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:127.0) Gecko/20100101 Firefox/127.0', 'GET', '[]', 'http://127.0.0.1:8000/api/messages/community-english', '127.0.0.1', '2024-06-01 12:17:58', '2024-06-01 12:17:58'),
(192, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:127.0) Gecko/20100101 Firefox/127.0', 'POST', '{\"username\":\"username\",\"message\":\"jon please\",\"community_slug\":\"community-english\"}', 'http://127.0.0.1:8000/api/messages', '127.0.0.1', '2024-06-01 12:18:02', '2024-06-01 12:18:02'),
(193, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:127.0) Gecko/20100101 Firefox/127.0', 'GET', '[]', 'http://127.0.0.1:8000/api/messages/community-english', '127.0.0.1', '2024-06-01 12:18:16', '2024-06-01 12:18:16'),
(194, 3, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'GET', '[]', 'http://127.0.0.1:8000/api/messages/community-english', '127.0.0.1', '2024-06-01 12:18:16', '2024-06-01 12:18:16'),
(195, 3, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'POST', '{\"username\":\"community-english\",\"message\":\"roman come to me\",\"community_slug\":\"community-english\"}', 'http://127.0.0.1:8000/api/messages', '127.0.0.1', '2024-06-01 12:18:25', '2024-06-01 12:18:25'),
(196, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:127.0) Gecko/20100101 Firefox/127.0', 'POST', '{\"username\":\"community-english\",\"message\":\"okay please\",\"community_slug\":\"community-english\"}', 'http://127.0.0.1:8000/api/messages', '127.0.0.1', '2024-06-01 12:18:33', '2024-06-01 12:18:33'),
(197, 3, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'POST', '{\"username\":\"community-english\",\"message\":\"ibraheem\",\"community_slug\":\"community-english\"}', 'http://127.0.0.1:8000/api/messages', '127.0.0.1', '2024-06-01 12:22:39', '2024-06-01 12:22:39'),
(198, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:127.0) Gecko/20100101 Firefox/127.0', 'GET', '[]', 'http://127.0.0.1:8000/api/messages/community-english', '127.0.0.1', '2024-06-01 12:24:23', '2024-06-01 12:24:23'),
(199, 3, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'GET', '[]', 'http://127.0.0.1:8000/api/messages/community-english', '127.0.0.1', '2024-06-01 12:24:23', '2024-06-01 12:24:23'),
(200, 3, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'POST', '{\"username\":\"community-english\",\"message\":\"hello\",\"community_slug\":\"community-english\"}', 'http://127.0.0.1:8000/api/messages', '127.0.0.1', '2024-06-01 12:24:31', '2024-06-01 12:24:31'),
(201, 3, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'POST', '{\"username\":\"community-english\",\"message\":\"hellokorbal\",\"community_slug\":\"community-english\"}', 'http://127.0.0.1:8000/api/messages', '127.0.0.1', '2024-06-01 12:24:37', '2024-06-01 12:24:37'),
(202, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:127.0) Gecko/20100101 Firefox/127.0', 'GET', '[]', 'http://127.0.0.1:8000/api/messages/community-english', '127.0.0.1', '2024-06-01 12:25:27', '2024-06-01 12:25:27'),
(203, 3, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'GET', '[]', 'http://127.0.0.1:8000/api/messages/community-english', '127.0.0.1', '2024-06-01 12:25:27', '2024-06-01 12:25:27'),
(204, 3, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'POST', '{\"username\":\"community-english\",\"message\":\"hello join\",\"community_slug\":\"community-english\"}', 'http://127.0.0.1:8000/api/messages', '127.0.0.1', '2024-06-01 12:25:43', '2024-06-01 12:25:43'),
(205, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:127.0) Gecko/20100101 Firefox/127.0', 'POST', '{\"username\":\"community-english\",\"message\":\"ohh\",\"community_slug\":\"community-english\"}', 'http://127.0.0.1:8000/api/messages', '127.0.0.1', '2024-06-01 12:25:59', '2024-06-01 12:25:59'),
(206, 3, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'POST', '{\"username\":\"community-english\",\"message\":\"Bhai\",\"community_slug\":\"community-english\"}', 'http://127.0.0.1:8000/api/messages', '127.0.0.1', '2024-06-01 12:34:15', '2024-06-01 12:34:15');
INSERT INTO `logs` (`id`, `user_id`, `user_agent`, `method`, `full_request`, `url`, `ip`, `created_at`, `updated_at`) VALUES
(207, 3, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'GET', '[]', 'http://127.0.0.1:8000/api/messages/community-english', '127.0.0.1', '2024-06-01 12:34:55', '2024-06-01 12:34:55'),
(208, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:127.0) Gecko/20100101 Firefox/127.0', 'GET', '[]', 'http://127.0.0.1:8000/api/messages/community-english', '127.0.0.1', '2024-06-01 12:36:06', '2024-06-01 12:36:06'),
(209, 3, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'GET', '[]', 'http://127.0.0.1:8000/api/messages/community-english', '127.0.0.1', '2024-06-01 12:36:06', '2024-06-01 12:36:06'),
(210, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:127.0) Gecko/20100101 Firefox/127.0', 'GET', '[]', 'http://127.0.0.1:8000/api/messages/community-english', '127.0.0.1', '2024-06-01 12:36:50', '2024-06-01 12:36:50'),
(211, 3, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'GET', '[]', 'http://127.0.0.1:8000/api/messages/community-english', '127.0.0.1', '2024-06-01 12:36:50', '2024-06-01 12:36:50'),
(212, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:127.0) Gecko/20100101 Firefox/127.0', 'GET', '[]', 'http://127.0.0.1:8000/api/messages/community-english', '127.0.0.1', '2024-06-01 12:36:53', '2024-06-01 12:36:53'),
(213, 3, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'GET', '[]', 'http://127.0.0.1:8000/api/messages/community-english', '127.0.0.1', '2024-06-01 12:36:56', '2024-06-01 12:36:56'),
(214, 3, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'POST', '{\"username\":\"community-english\",\"message\":\"Hello\",\"community_slug\":\"community-english\"}', 'http://127.0.0.1:8000/api/messages', '127.0.0.1', '2024-06-01 12:37:07', '2024-06-01 12:37:07'),
(215, 3, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'POST', '{\"username\":\"community-english\",\"message\":\"Kabir\",\"community_slug\":\"community-english\"}', 'http://127.0.0.1:8000/api/messages', '127.0.0.1', '2024-06-01 12:37:12', '2024-06-01 12:37:12'),
(216, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:127.0) Gecko/20100101 Firefox/127.0', 'POST', '{\"username\":\"community-english\",\"message\":\"come to me\",\"community_slug\":\"community-english\"}', 'http://127.0.0.1:8000/api/messages', '127.0.0.1', '2024-06-01 12:37:22', '2024-06-01 12:37:22'),
(217, 3, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'GET', '[]', 'http://127.0.0.1:8000/api/messages/community-english', '127.0.0.1', '2024-06-01 12:38:16', '2024-06-01 12:38:16'),
(218, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:127.0) Gecko/20100101 Firefox/127.0', 'GET', '[]', 'http://127.0.0.1:8000/api/messages/community-english', '127.0.0.1', '2024-06-01 12:38:31', '2024-06-01 12:38:31'),
(219, 3, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'GET', '[]', 'http://127.0.0.1:8000/api/messages/community-english', '127.0.0.1', '2024-06-01 12:38:31', '2024-06-01 12:38:31'),
(220, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:127.0) Gecko/20100101 Firefox/127.0', 'GET', '[]', 'http://127.0.0.1:8000/api/messages/community-english', '127.0.0.1', '2024-06-01 12:57:14', '2024-06-01 12:57:14'),
(221, 3, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'GET', '[]', 'http://127.0.0.1:8000/api/messages/community-english', '127.0.0.1', '2024-06-01 12:57:14', '2024-06-01 12:57:14'),
(222, 3, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'POST', '{\"username\":\"community-english\",\"message\":\"hello\",\"community_slug\":\"community-english\"}', 'http://127.0.0.1:8000/api/messages', '127.0.0.1', '2024-06-01 12:57:35', '2024-06-01 12:57:35'),
(223, 3, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'POST', '{\"username\":\"community-english\",\"message\":\"boss how are you\",\"community_slug\":\"community-english\"}', 'http://127.0.0.1:8000/api/messages', '127.0.0.1', '2024-06-01 12:57:54', '2024-06-01 12:57:54'),
(224, 3, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'POST', '{\"username\":\"community-english\",\"message\":\"hi sdfjsdfklsdf\",\"community_slug\":\"community-english\"}', 'http://127.0.0.1:8000/api/messages', '127.0.0.1', '2024-06-01 13:00:21', '2024-06-01 13:00:21'),
(225, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:127.0) Gecko/20100101 Firefox/127.0', 'POST', '{\"username\":\"community-english\",\"message\":\"hell bhai\",\"community_slug\":\"community-english\"}', 'http://127.0.0.1:8000/api/messages', '127.0.0.1', '2024-06-01 13:00:51', '2024-06-01 13:00:51'),
(226, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:127.0) Gecko/20100101 Firefox/127.0', 'GET', '[]', 'http://127.0.0.1:8000/api/user/getCommunity', '127.0.0.1', '2024-06-01 13:01:54', '2024-06-01 13:01:54'),
(227, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:127.0) Gecko/20100101 Firefox/127.0', 'GET', '[]', 'http://127.0.0.1:8000/api/messages/community-chinese', '127.0.0.1', '2024-06-01 13:01:55', '2024-06-01 13:01:55'),
(228, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:127.0) Gecko/20100101 Firefox/127.0', 'GET', '[]', 'http://127.0.0.1:8000/api/user/getCommunity', '127.0.0.1', '2024-06-01 13:01:58', '2024-06-01 13:01:58'),
(229, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:127.0) Gecko/20100101 Firefox/127.0', 'GET', '[]', 'http://127.0.0.1:8000/api/messages/community-arabic', '127.0.0.1', '2024-06-01 13:02:00', '2024-06-01 13:02:00'),
(230, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:127.0) Gecko/20100101 Firefox/127.0', 'GET', '[]', 'http://127.0.0.1:8000/api/user/getCommunity', '127.0.0.1', '2024-06-01 13:02:02', '2024-06-01 13:02:02'),
(231, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:127.0) Gecko/20100101 Firefox/127.0', 'GET', '[]', 'http://127.0.0.1:8000/api/messages/community-english', '127.0.0.1', '2024-06-01 13:02:03', '2024-06-01 13:02:03'),
(232, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:127.0) Gecko/20100101 Firefox/127.0', 'POST', '{\"username\":\"community-english\",\"message\":\"bijon koy\",\"community_slug\":\"community-english\"}', 'http://127.0.0.1:8000/api/messages', '127.0.0.1', '2024-06-01 15:32:40', '2024-06-01 15:32:40'),
(233, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:127.0) Gecko/20100101 Firefox/127.0', 'GET', '[]', 'http://127.0.0.1:8000/api/user/getCommunity', '127.0.0.1', '2024-06-01 15:32:59', '2024-06-01 15:32:59'),
(234, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:127.0) Gecko/20100101 Firefox/127.0', 'GET', '[]', 'http://127.0.0.1:8000/api/setting/settingrow', '127.0.0.1', '2024-06-01 15:33:22', '2024-06-01 15:33:22'),
(235, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:127.0) Gecko/20100101 Firefox/127.0', 'GET', '[]', 'http://127.0.0.1:8000/api/mining/checkMiningInfo', '127.0.0.1', '2024-06-01 15:33:22', '2024-06-01 15:33:22'),
(236, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:127.0) Gecko/20100101 Firefox/127.0', 'POST', '[]', 'http://127.0.0.1:8000/api/auth/me', '127.0.0.1', '2024-06-01 15:33:25', '2024-06-01 15:33:25'),
(237, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'GET', '[]', 'http://127.0.0.1:8000/api/setting/settingrow', '127.0.0.1', '2024-06-02 20:42:28', '2024-06-02 20:42:28'),
(238, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'GET', '[]', 'http://127.0.0.1:8000/api/mining/checkMiningInfo', '127.0.0.1', '2024-06-02 20:42:29', '2024-06-02 20:42:29'),
(239, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'POST', '[]', 'http://127.0.0.1:8000/api/auth/me', '127.0.0.1', '2024-06-02 20:42:30', '2024-06-02 20:42:30'),
(240, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'POST', '{\"email\":\"r@gmail.com\",\"password\":\"r@gmail.com\",\"captchaInput\":\"772403\",\"userCapInput\":\"772403\"}', 'http://127.0.0.1:8000/api/auth/login', '127.0.0.1', '2024-06-02 20:42:55', '2024-06-02 20:42:55'),
(241, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'GET', '[]', 'http://127.0.0.1:8000/api/setting/settingrow', '127.0.0.1', '2024-06-02 20:42:57', '2024-06-02 20:42:57'),
(242, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'GET', '[]', 'http://127.0.0.1:8000/api/mining/checkMiningInfo', '127.0.0.1', '2024-06-02 20:42:57', '2024-06-02 20:42:57'),
(243, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'POST', '[]', 'http://127.0.0.1:8000/api/auth/me', '127.0.0.1', '2024-06-02 20:43:00', '2024-06-02 20:43:00'),
(244, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'GET', '[]', 'http://127.0.0.1:8000/api/mining/getMiningCategory', '127.0.0.1', '2024-06-02 20:43:33', '2024-06-02 20:43:33'),
(245, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'GET', '{\"categoryId\":\"1\"}', 'http://127.0.0.1:8000/api/mining/getMiningDuration?categoryId=1', '127.0.0.1', '2024-06-02 20:43:35', '2024-06-02 20:43:35'),
(246, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'POST', '{\"mining_category_id\":\"1\",\"selected_duration_id\":\"1\",\"selectedDuration\":\"30\",\"selectedPrice\":\"10\"}', 'http://127.0.0.1:8000/api/mining/buyMiningDuration', '127.0.0.1', '2024-06-02 20:43:38', '2024-06-02 20:43:38'),
(247, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'GET', '[]', 'http://127.0.0.1:8000/api/setting/settingrow', '127.0.0.1', '2024-06-02 20:43:38', '2024-06-02 20:43:38'),
(248, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'GET', '[]', 'http://127.0.0.1:8000/api/mining/checkMiningInfo', '127.0.0.1', '2024-06-02 20:43:38', '2024-06-02 20:43:38'),
(249, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'GET', '{\"mining_category_id\":\"1\"}', 'http://127.0.0.1:8000/api/mining/miningProcessState?mining_category_id=1', '127.0.0.1', '2024-06-02 20:43:38', '2024-06-02 20:43:38'),
(250, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'POST', '[]', 'http://127.0.0.1:8000/api/auth/me', '127.0.0.1', '2024-06-02 20:43:41', '2024-06-02 20:43:41'),
(251, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'POST', '{\"mining_category_id\":\"1\"}', 'http://127.0.0.1:8000/api/mining/miningProcess', '127.0.0.1', '2024-06-02 20:43:42', '2024-06-02 20:43:42'),
(252, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'GET', '[]', 'http://127.0.0.1:8000/api/setting/settingrow', '127.0.0.1', '2024-06-02 20:43:54', '2024-06-02 20:43:54'),
(253, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'GET', '[]', 'http://127.0.0.1:8000/api/mining/checkMiningInfo', '127.0.0.1', '2024-06-02 20:43:54', '2024-06-02 20:43:54'),
(254, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'GET', '{\"mining_category_id\":\"1\"}', 'http://127.0.0.1:8000/api/mining/miningProcessState?mining_category_id=1', '127.0.0.1', '2024-06-02 20:43:54', '2024-06-02 20:43:54'),
(255, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'POST', '[]', 'http://127.0.0.1:8000/api/auth/me', '127.0.0.1', '2024-06-02 20:43:57', '2024-06-02 20:43:57'),
(256, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'POST', '{\"mining_category_id\":\"1\"}', 'http://127.0.0.1:8000/api/mining/miningProcess', '127.0.0.1', '2024-06-02 20:44:01', '2024-06-02 20:44:01'),
(257, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'GET', '[]', 'http://127.0.0.1:8000/api/setting/settingrow', '127.0.0.1', '2024-06-02 20:44:09', '2024-06-02 20:44:09'),
(258, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'GET', '[]', 'http://127.0.0.1:8000/api/mining/checkMiningInfo', '127.0.0.1', '2024-06-02 20:44:09', '2024-06-02 20:44:09'),
(259, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'GET', '{\"mining_category_id\":\"1\"}', 'http://127.0.0.1:8000/api/mining/miningProcessState?mining_category_id=1', '127.0.0.1', '2024-06-02 20:44:10', '2024-06-02 20:44:10'),
(260, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'POST', '[]', 'http://127.0.0.1:8000/api/auth/me', '127.0.0.1', '2024-06-02 20:44:12', '2024-06-02 20:44:12'),
(261, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'GET', '[]', 'http://127.0.0.1:8000/api/setting/settingrow', '127.0.0.1', '2024-06-02 20:44:16', '2024-06-02 20:44:16'),
(262, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'GET', '[]', 'http://127.0.0.1:8000/api/mining/checkMiningInfo', '127.0.0.1', '2024-06-02 20:44:16', '2024-06-02 20:44:16'),
(263, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'GET', '{\"mining_category_id\":\"1\"}', 'http://127.0.0.1:8000/api/mining/miningProcessState?mining_category_id=1', '127.0.0.1', '2024-06-02 20:44:16', '2024-06-02 20:44:16'),
(264, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'POST', '[]', 'http://127.0.0.1:8000/api/auth/me', '127.0.0.1', '2024-06-02 20:44:19', '2024-06-02 20:44:19'),
(265, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'GET', '[]', 'http://127.0.0.1:8000/api/setting/settingrow', '127.0.0.1', '2024-06-02 20:44:53', '2024-06-02 20:44:53'),
(266, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'GET', '[]', 'http://127.0.0.1:8000/api/mining/checkMiningInfo', '127.0.0.1', '2024-06-02 20:44:53', '2024-06-02 20:44:53'),
(267, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'GET', '{\"mining_category_id\":\"1\"}', 'http://127.0.0.1:8000/api/mining/miningProcessState?mining_category_id=1', '127.0.0.1', '2024-06-02 20:44:53', '2024-06-02 20:44:53'),
(268, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'POST', '[]', 'http://127.0.0.1:8000/api/auth/me', '127.0.0.1', '2024-06-02 20:44:55', '2024-06-02 20:44:55'),
(269, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'GET', '{\"mining_category_id\":\"1\"}', 'http://127.0.0.1:8000/api/mining/miningProcessState?mining_category_id=1', '127.0.0.1', '2024-06-02 20:45:30', '2024-06-02 20:45:30'),
(270, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'GET', '[]', 'http://127.0.0.1:8000/api/setting/settingrow', '127.0.0.1', '2024-06-02 20:45:37', '2024-06-02 20:45:37'),
(271, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'GET', '[]', 'http://127.0.0.1:8000/api/mining/checkMiningInfo', '127.0.0.1', '2024-06-02 20:45:37', '2024-06-02 20:45:37'),
(272, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'GET', '{\"mining_category_id\":\"1\"}', 'http://127.0.0.1:8000/api/mining/miningProcessState?mining_category_id=1', '127.0.0.1', '2024-06-02 20:45:37', '2024-06-02 20:45:37'),
(273, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'POST', '[]', 'http://127.0.0.1:8000/api/auth/me', '127.0.0.1', '2024-06-02 20:45:39', '2024-06-02 20:45:39'),
(274, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'GET', '[]', 'http://127.0.0.1:8000/api/setting/settingrow', '127.0.0.1', '2024-06-02 20:45:59', '2024-06-02 20:45:59'),
(275, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'GET', '[]', 'http://127.0.0.1:8000/api/mining/checkMiningInfo', '127.0.0.1', '2024-06-02 20:46:00', '2024-06-02 20:46:00'),
(276, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'GET', '{\"mining_category_id\":\"1\"}', 'http://127.0.0.1:8000/api/mining/miningProcessState?mining_category_id=1', '127.0.0.1', '2024-06-02 20:46:00', '2024-06-02 20:46:00'),
(277, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'POST', '[]', 'http://127.0.0.1:8000/api/auth/me', '127.0.0.1', '2024-06-02 20:46:02', '2024-06-02 20:46:02'),
(278, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'GET', '[]', 'http://127.0.0.1:8000/api/setting/settingrow', '127.0.0.1', '2024-06-02 20:46:57', '2024-06-02 20:46:57'),
(279, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'GET', '[]', 'http://127.0.0.1:8000/api/mining/checkMiningInfo', '127.0.0.1', '2024-06-02 20:46:57', '2024-06-02 20:46:57'),
(280, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'GET', '{\"mining_category_id\":\"1\"}', 'http://127.0.0.1:8000/api/mining/miningProcessState?mining_category_id=1', '127.0.0.1', '2024-06-02 20:46:57', '2024-06-02 20:46:57'),
(281, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'POST', '[]', 'http://127.0.0.1:8000/api/auth/me', '127.0.0.1', '2024-06-02 20:47:00', '2024-06-02 20:47:00'),
(282, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'GET', '{\"mining_category_id\":\"1\"}', 'http://127.0.0.1:8000/api/mining/miningProcessState?mining_category_id=1', '127.0.0.1', '2024-06-02 20:48:04', '2024-06-02 20:48:04'),
(283, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'GET', '[]', 'http://127.0.0.1:8000/api/setting/settingrow', '127.0.0.1', '2024-06-02 20:52:28', '2024-06-02 20:52:28'),
(284, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'GET', '[]', 'http://127.0.0.1:8000/api/mining/checkMiningInfo', '127.0.0.1', '2024-06-02 20:52:28', '2024-06-02 20:52:28'),
(285, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'GET', '{\"mining_category_id\":\"1\"}', 'http://127.0.0.1:8000/api/mining/miningProcessState?mining_category_id=1', '127.0.0.1', '2024-06-02 20:52:28', '2024-06-02 20:52:28'),
(286, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'POST', '[]', 'http://127.0.0.1:8000/api/auth/me', '127.0.0.1', '2024-06-02 20:52:30', '2024-06-02 20:52:30'),
(287, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'GET', '[]', 'http://127.0.0.1:8000/api/setting/settingrow', '127.0.0.1', '2024-06-02 20:52:43', '2024-06-02 20:52:43'),
(288, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'GET', '[]', 'http://127.0.0.1:8000/api/mining/checkMiningInfo', '127.0.0.1', '2024-06-02 20:52:43', '2024-06-02 20:52:43'),
(289, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'GET', '{\"mining_category_id\":\"1\"}', 'http://127.0.0.1:8000/api/mining/miningProcessState?mining_category_id=1', '127.0.0.1', '2024-06-02 20:52:43', '2024-06-02 20:52:43'),
(290, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'POST', '[]', 'http://127.0.0.1:8000/api/auth/me', '127.0.0.1', '2024-06-02 20:52:45', '2024-06-02 20:52:45'),
(291, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'GET', '[]', 'http://127.0.0.1:8000/api/setting/settingrow', '127.0.0.1', '2024-06-02 20:57:35', '2024-06-02 20:57:35'),
(292, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'GET', '[]', 'http://127.0.0.1:8000/api/mining/checkMiningInfo', '127.0.0.1', '2024-06-02 20:57:35', '2024-06-02 20:57:35'),
(293, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'GET', '{\"mining_category_id\":\"1\"}', 'http://127.0.0.1:8000/api/mining/miningProcessState?mining_category_id=1', '127.0.0.1', '2024-06-02 20:57:35', '2024-06-02 20:57:35'),
(294, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'POST', '[]', 'http://127.0.0.1:8000/api/auth/me', '127.0.0.1', '2024-06-02 20:57:38', '2024-06-02 20:57:38'),
(295, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'GET', '{\"mining_category_id\":\"1\"}', 'http://127.0.0.1:8000/api/mining/miningProcessState?mining_category_id=1', '127.0.0.1', '2024-06-02 21:00:35', '2024-06-02 21:00:35'),
(296, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'GET', '[]', 'http://127.0.0.1:8000/api/setting/settingrow', '127.0.0.1', '2024-06-02 21:00:42', '2024-06-02 21:00:42'),
(297, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'GET', '[]', 'http://127.0.0.1:8000/api/mining/checkMiningInfo', '127.0.0.1', '2024-06-02 21:00:42', '2024-06-02 21:00:42'),
(298, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'GET', '{\"mining_category_id\":\"1\"}', 'http://127.0.0.1:8000/api/mining/miningProcessState?mining_category_id=1', '127.0.0.1', '2024-06-02 21:00:42', '2024-06-02 21:00:42'),
(299, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'POST', '[]', 'http://127.0.0.1:8000/api/auth/me', '127.0.0.1', '2024-06-02 21:00:45', '2024-06-02 21:00:45'),
(300, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'GET', '[]', 'http://127.0.0.1:8000/api/setting/settingrow', '127.0.0.1', '2024-06-02 21:00:58', '2024-06-02 21:00:58'),
(301, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'GET', '[]', 'http://127.0.0.1:8000/api/mining/checkMiningInfo', '127.0.0.1', '2024-06-02 21:00:58', '2024-06-02 21:00:58'),
(302, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'GET', '{\"mining_category_id\":\"1\"}', 'http://127.0.0.1:8000/api/mining/miningProcessState?mining_category_id=1', '127.0.0.1', '2024-06-02 21:00:59', '2024-06-02 21:00:59'),
(303, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'POST', '[]', 'http://127.0.0.1:8000/api/auth/me', '127.0.0.1', '2024-06-02 21:01:01', '2024-06-02 21:01:01'),
(304, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'GET', '{\"mining_category_id\":\"1\"}', 'http://127.0.0.1:8000/api/mining/miningProcessState?mining_category_id=1', '127.0.0.1', '2024-06-02 21:03:00', '2024-06-02 21:03:00'),
(305, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'GET', '[]', 'http://127.0.0.1:8000/api/setting/settingrow', '127.0.0.1', '2024-06-02 21:03:08', '2024-06-02 21:03:08'),
(306, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'GET', '[]', 'http://127.0.0.1:8000/api/mining/checkMiningInfo', '127.0.0.1', '2024-06-02 21:03:09', '2024-06-02 21:03:09'),
(307, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'GET', '{\"mining_category_id\":\"1\"}', 'http://127.0.0.1:8000/api/mining/miningProcessState?mining_category_id=1', '127.0.0.1', '2024-06-02 21:03:09', '2024-06-02 21:03:09'),
(308, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'POST', '[]', 'http://127.0.0.1:8000/api/auth/me', '127.0.0.1', '2024-06-02 21:03:11', '2024-06-02 21:03:11'),
(309, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'GET', '[]', 'http://127.0.0.1:8000/api/setting/settingrow', '127.0.0.1', '2024-06-02 21:03:28', '2024-06-02 21:03:28'),
(310, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'GET', '[]', 'http://127.0.0.1:8000/api/mining/checkMiningInfo', '127.0.0.1', '2024-06-02 21:03:28', '2024-06-02 21:03:28'),
(311, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'GET', '{\"mining_category_id\":\"1\"}', 'http://127.0.0.1:8000/api/mining/miningProcessState?mining_category_id=1', '127.0.0.1', '2024-06-02 21:03:28', '2024-06-02 21:03:28'),
(312, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'POST', '[]', 'http://127.0.0.1:8000/api/auth/me', '127.0.0.1', '2024-06-02 21:03:30', '2024-06-02 21:03:30'),
(313, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'GET', '[]', 'http://127.0.0.1:8000/api/setting/settingrow', '127.0.0.1', '2024-06-02 21:03:48', '2024-06-02 21:03:48'),
(314, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'GET', '[]', 'http://127.0.0.1:8000/api/mining/checkMiningInfo', '127.0.0.1', '2024-06-02 21:03:48', '2024-06-02 21:03:48'),
(315, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'GET', '{\"mining_category_id\":\"1\"}', 'http://127.0.0.1:8000/api/mining/miningProcessState?mining_category_id=1', '127.0.0.1', '2024-06-02 21:03:48', '2024-06-02 21:03:48'),
(316, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'POST', '[]', 'http://127.0.0.1:8000/api/auth/me', '127.0.0.1', '2024-06-02 21:03:51', '2024-06-02 21:03:51'),
(317, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'GET', '{\"mining_category_id\":\"1\"}', 'http://127.0.0.1:8000/api/mining/miningProcessState?mining_category_id=1', '127.0.0.1', '2024-06-02 21:05:28', '2024-06-02 21:05:28'),
(318, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'GET', '[]', 'http://127.0.0.1:8000/api/setting/settingrow', '127.0.0.1', '2024-06-02 21:05:48', '2024-06-02 21:05:48'),
(319, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'GET', '[]', 'http://127.0.0.1:8000/api/mining/checkMiningInfo', '127.0.0.1', '2024-06-02 21:05:48', '2024-06-02 21:05:48'),
(320, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'GET', '{\"mining_category_id\":\"1\"}', 'http://127.0.0.1:8000/api/mining/miningProcessState?mining_category_id=1', '127.0.0.1', '2024-06-02 21:05:48', '2024-06-02 21:05:48'),
(321, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'POST', '[]', 'http://127.0.0.1:8000/api/auth/me', '127.0.0.1', '2024-06-02 21:05:53', '2024-06-02 21:05:53'),
(322, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'GET', '[]', 'http://127.0.0.1:8000/api/setting/settingrow', '127.0.0.1', '2024-06-02 21:06:45', '2024-06-02 21:06:45'),
(323, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'GET', '[]', 'http://127.0.0.1:8000/api/mining/checkMiningInfo', '127.0.0.1', '2024-06-02 21:06:45', '2024-06-02 21:06:45'),
(324, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'GET', '{\"mining_category_id\":\"1\"}', 'http://127.0.0.1:8000/api/mining/miningProcessState?mining_category_id=1', '127.0.0.1', '2024-06-02 21:06:45', '2024-06-02 21:06:45'),
(325, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'POST', '[]', 'http://127.0.0.1:8000/api/auth/me', '127.0.0.1', '2024-06-02 21:06:47', '2024-06-02 21:06:47'),
(326, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'GET', '[]', 'http://127.0.0.1:8000/api/setting/settingrow', '127.0.0.1', '2024-06-02 21:07:14', '2024-06-02 21:07:14'),
(327, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'GET', '[]', 'http://127.0.0.1:8000/api/mining/checkMiningInfo', '127.0.0.1', '2024-06-02 21:07:14', '2024-06-02 21:07:14'),
(328, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'GET', '{\"mining_category_id\":\"1\"}', 'http://127.0.0.1:8000/api/mining/miningProcessState?mining_category_id=1', '127.0.0.1', '2024-06-02 21:07:14', '2024-06-02 21:07:14'),
(329, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'POST', '[]', 'http://127.0.0.1:8000/api/auth/me', '127.0.0.1', '2024-06-02 21:07:16', '2024-06-02 21:07:16'),
(330, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'GET', '[]', 'http://127.0.0.1:8000/api/setting/settingrow', '127.0.0.1', '2024-06-02 21:08:52', '2024-06-02 21:08:52'),
(331, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'GET', '[]', 'http://127.0.0.1:8000/api/mining/checkMiningInfo', '127.0.0.1', '2024-06-02 21:08:52', '2024-06-02 21:08:52'),
(332, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'GET', '{\"mining_category_id\":\"1\"}', 'http://127.0.0.1:8000/api/mining/miningProcessState?mining_category_id=1', '127.0.0.1', '2024-06-02 21:08:53', '2024-06-02 21:08:53'),
(333, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'POST', '[]', 'http://127.0.0.1:8000/api/auth/me', '127.0.0.1', '2024-06-02 21:08:56', '2024-06-02 21:08:56'),
(334, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'GET', '[]', 'http://127.0.0.1:8000/api/setting/settingrow', '127.0.0.1', '2024-06-02 21:15:56', '2024-06-02 21:15:56'),
(335, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'GET', '[]', 'http://127.0.0.1:8000/api/mining/checkMiningInfo', '127.0.0.1', '2024-06-02 21:15:56', '2024-06-02 21:15:56'),
(336, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'GET', '{\"mining_category_id\":\"1\"}', 'http://127.0.0.1:8000/api/mining/miningProcessState?mining_category_id=1', '127.0.0.1', '2024-06-02 21:15:56', '2024-06-02 21:15:56'),
(337, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'POST', '[]', 'http://127.0.0.1:8000/api/auth/me', '127.0.0.1', '2024-06-02 21:15:58', '2024-06-02 21:15:58'),
(338, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'GET', '[]', 'http://127.0.0.1:8000/api/mining/getMiningCategory', '127.0.0.1', '2024-06-02 21:17:12', '2024-06-02 21:17:12'),
(339, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'GET', '{\"categoryId\":\"2\"}', 'http://127.0.0.1:8000/api/mining/getMiningDuration?categoryId=2', '127.0.0.1', '2024-06-02 21:17:15', '2024-06-02 21:17:15'),
(340, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'GET', '[]', 'http://127.0.0.1:8000/api/setting/settingrow', '127.0.0.1', '2024-06-02 21:17:17', '2024-06-02 21:17:17'),
(341, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'GET', '[]', 'http://127.0.0.1:8000/api/mining/checkMiningInfo', '127.0.0.1', '2024-06-02 21:17:18', '2024-06-02 21:17:18'),
(342, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'GET', '{\"mining_category_id\":\"1\"}', 'http://127.0.0.1:8000/api/mining/miningProcessState?mining_category_id=1', '127.0.0.1', '2024-06-02 21:17:18', '2024-06-02 21:17:18'),
(343, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'POST', '[]', 'http://127.0.0.1:8000/api/auth/me', '127.0.0.1', '2024-06-02 21:17:20', '2024-06-02 21:17:20'),
(344, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'GET', '[]', 'http://127.0.0.1:8000/api/mining/getMiningCategory', '127.0.0.1', '2024-06-02 21:17:23', '2024-06-02 21:17:23'),
(345, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'GET', '{\"categoryId\":\"2\"}', 'http://127.0.0.1:8000/api/mining/getMiningDuration?categoryId=2', '127.0.0.1', '2024-06-02 21:17:24', '2024-06-02 21:17:24'),
(346, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'POST', '{\"mining_category_id\":\"2\",\"selected_duration_id\":\"4\",\"selectedDuration\":\"30\",\"selectedPrice\":\"10\"}', 'http://127.0.0.1:8000/api/mining/buyMiningDuration', '127.0.0.1', '2024-06-02 21:17:27', '2024-06-02 21:17:27'),
(347, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'GET', '[]', 'http://127.0.0.1:8000/api/setting/settingrow', '127.0.0.1', '2024-06-02 21:17:27', '2024-06-02 21:17:27'),
(348, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'GET', '[]', 'http://127.0.0.1:8000/api/mining/checkMiningInfo', '127.0.0.1', '2024-06-02 21:17:28', '2024-06-02 21:17:28'),
(349, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'GET', '{\"mining_category_id\":\"1\"}', 'http://127.0.0.1:8000/api/mining/miningProcessState?mining_category_id=1', '127.0.0.1', '2024-06-02 21:17:28', '2024-06-02 21:17:28'),
(350, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'GET', '{\"mining_category_id\":\"2\"}', 'http://127.0.0.1:8000/api/mining/miningProcessState?mining_category_id=2', '127.0.0.1', '2024-06-02 21:17:28', '2024-06-02 21:17:28'),
(351, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'POST', '[]', 'http://127.0.0.1:8000/api/auth/me', '127.0.0.1', '2024-06-02 21:17:30', '2024-06-02 21:17:30'),
(352, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'POST', '{\"mining_category_id\":\"2\"}', 'http://127.0.0.1:8000/api/mining/miningProcess', '127.0.0.1', '2024-06-02 21:17:34', '2024-06-02 21:17:34'),
(353, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'GET', '[]', 'http://127.0.0.1:8000/api/setting/settingrow', '127.0.0.1', '2024-06-02 21:19:19', '2024-06-02 21:19:19'),
(354, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'GET', '[]', 'http://127.0.0.1:8000/api/mining/checkMiningInfo', '127.0.0.1', '2024-06-02 21:19:19', '2024-06-02 21:19:19'),
(355, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'GET', '{\"mining_category_id\":\"1\"}', 'http://127.0.0.1:8000/api/mining/miningProcessState?mining_category_id=1', '127.0.0.1', '2024-06-02 21:19:20', '2024-06-02 21:19:20'),
(356, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'GET', '{\"mining_category_id\":\"2\"}', 'http://127.0.0.1:8000/api/mining/miningProcessState?mining_category_id=2', '127.0.0.1', '2024-06-02 21:19:20', '2024-06-02 21:19:20'),
(357, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'POST', '[]', 'http://127.0.0.1:8000/api/auth/me', '127.0.0.1', '2024-06-02 21:19:22', '2024-06-02 21:19:22'),
(358, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'GET', '[]', 'http://127.0.0.1:8000/api/setting/settingrow', '127.0.0.1', '2024-06-02 21:20:01', '2024-06-02 21:20:01'),
(359, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'GET', '[]', 'http://127.0.0.1:8000/api/mining/checkMiningInfo', '127.0.0.1', '2024-06-02 21:20:01', '2024-06-02 21:20:01'),
(360, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'GET', '{\"mining_category_id\":\"1\"}', 'http://127.0.0.1:8000/api/mining/miningProcessState?mining_category_id=1', '127.0.0.1', '2024-06-02 21:20:01', '2024-06-02 21:20:01'),
(361, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'GET', '{\"mining_category_id\":\"2\"}', 'http://127.0.0.1:8000/api/mining/miningProcessState?mining_category_id=2', '127.0.0.1', '2024-06-02 21:20:01', '2024-06-02 21:20:01'),
(362, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'POST', '[]', 'http://127.0.0.1:8000/api/auth/me', '127.0.0.1', '2024-06-02 21:20:03', '2024-06-02 21:20:03'),
(363, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'GET', '[]', 'http://127.0.0.1:8000/api/mining/getMiningCategory', '127.0.0.1', '2024-06-02 21:20:18', '2024-06-02 21:20:18'),
(364, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'GET', '{\"categoryId\":\"3\"}', 'http://127.0.0.1:8000/api/mining/getMiningDuration?categoryId=3', '127.0.0.1', '2024-06-02 21:20:21', '2024-06-02 21:20:21'),
(365, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'POST', '{\"mining_category_id\":\"3\",\"selected_duration_id\":\"7\",\"selectedDuration\":\"30\",\"selectedPrice\":\"10\"}', 'http://127.0.0.1:8000/api/mining/buyMiningDuration', '127.0.0.1', '2024-06-02 21:20:24', '2024-06-02 21:20:24'),
(366, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'GET', '[]', 'http://127.0.0.1:8000/api/setting/settingrow', '127.0.0.1', '2024-06-02 21:20:24', '2024-06-02 21:20:24'),
(367, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'GET', '[]', 'http://127.0.0.1:8000/api/mining/checkMiningInfo', '127.0.0.1', '2024-06-02 21:20:25', '2024-06-02 21:20:25'),
(368, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'GET', '{\"mining_category_id\":\"1\"}', 'http://127.0.0.1:8000/api/mining/miningProcessState?mining_category_id=1', '127.0.0.1', '2024-06-02 21:20:25', '2024-06-02 21:20:25'),
(369, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'GET', '{\"mining_category_id\":\"2\"}', 'http://127.0.0.1:8000/api/mining/miningProcessState?mining_category_id=2', '127.0.0.1', '2024-06-02 21:20:25', '2024-06-02 21:20:25'),
(370, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'GET', '{\"mining_category_id\":\"3\"}', 'http://127.0.0.1:8000/api/mining/miningProcessState?mining_category_id=3', '127.0.0.1', '2024-06-02 21:20:26', '2024-06-02 21:20:26'),
(371, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'POST', '[]', 'http://127.0.0.1:8000/api/auth/me', '127.0.0.1', '2024-06-02 21:20:27', '2024-06-02 21:20:27'),
(372, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'POST', '{\"mining_category_id\":\"3\"}', 'http://127.0.0.1:8000/api/mining/miningProcess', '127.0.0.1', '2024-06-02 21:20:29', '2024-06-02 21:20:29'),
(373, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'GET', '[]', 'http://127.0.0.1:8000/api/setting/settingrow', '127.0.0.1', '2024-06-02 21:20:41', '2024-06-02 21:20:41'),
(374, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'GET', '[]', 'http://127.0.0.1:8000/api/mining/checkMiningInfo', '127.0.0.1', '2024-06-02 21:20:41', '2024-06-02 21:20:41'),
(375, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'GET', '{\"mining_category_id\":\"1\"}', 'http://127.0.0.1:8000/api/mining/miningProcessState?mining_category_id=1', '127.0.0.1', '2024-06-02 21:20:42', '2024-06-02 21:20:42'),
(376, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'GET', '{\"mining_category_id\":\"2\"}', 'http://127.0.0.1:8000/api/mining/miningProcessState?mining_category_id=2', '127.0.0.1', '2024-06-02 21:20:42', '2024-06-02 21:20:42'),
(377, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'GET', '{\"mining_category_id\":\"3\"}', 'http://127.0.0.1:8000/api/mining/miningProcessState?mining_category_id=3', '127.0.0.1', '2024-06-02 21:20:42', '2024-06-02 21:20:42'),
(378, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'POST', '[]', 'http://127.0.0.1:8000/api/auth/me', '127.0.0.1', '2024-06-02 21:20:44', '2024-06-02 21:20:44'),
(379, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'POST', '{\"mining_category_id\":\"3\"}', 'http://127.0.0.1:8000/api/mining/miningProcess', '127.0.0.1', '2024-06-02 21:20:46', '2024-06-02 21:20:46'),
(380, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'GET', '[]', 'http://127.0.0.1:8000/api/setting/settingrow', '127.0.0.1', '2024-06-02 21:20:51', '2024-06-02 21:20:51'),
(381, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'GET', '[]', 'http://127.0.0.1:8000/api/mining/checkMiningInfo', '127.0.0.1', '2024-06-02 21:20:52', '2024-06-02 21:20:52'),
(382, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'GET', '{\"mining_category_id\":\"1\"}', 'http://127.0.0.1:8000/api/mining/miningProcessState?mining_category_id=1', '127.0.0.1', '2024-06-02 21:20:52', '2024-06-02 21:20:52'),
(383, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'GET', '{\"mining_category_id\":\"2\"}', 'http://127.0.0.1:8000/api/mining/miningProcessState?mining_category_id=2', '127.0.0.1', '2024-06-02 21:20:52', '2024-06-02 21:20:52'),
(384, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'GET', '{\"mining_category_id\":\"3\"}', 'http://127.0.0.1:8000/api/mining/miningProcessState?mining_category_id=3', '127.0.0.1', '2024-06-02 21:20:52', '2024-06-02 21:20:52'),
(385, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'POST', '[]', 'http://127.0.0.1:8000/api/auth/me', '127.0.0.1', '2024-06-02 21:20:54', '2024-06-02 21:20:54'),
(386, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'GET', '[]', 'http://127.0.0.1:8000/api/mining/getMiningCategory', '127.0.0.1', '2024-06-02 21:20:57', '2024-06-02 21:20:57'),
(387, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'GET', '{\"categoryId\":\"4\"}', 'http://127.0.0.1:8000/api/mining/getMiningDuration?categoryId=4', '127.0.0.1', '2024-06-02 21:21:03', '2024-06-02 21:21:03'),
(388, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'POST', '{\"mining_category_id\":\"4\",\"selected_duration_id\":\"10\",\"selectedDuration\":\"30\",\"selectedPrice\":\"10\"}', 'http://127.0.0.1:8000/api/mining/buyMiningDuration', '127.0.0.1', '2024-06-02 21:21:05', '2024-06-02 21:21:05'),
(389, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'GET', '[]', 'http://127.0.0.1:8000/api/setting/settingrow', '127.0.0.1', '2024-06-02 21:21:06', '2024-06-02 21:21:06'),
(390, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'GET', '[]', 'http://127.0.0.1:8000/api/mining/checkMiningInfo', '127.0.0.1', '2024-06-02 21:21:06', '2024-06-02 21:21:06'),
(391, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'GET', '{\"mining_category_id\":\"1\"}', 'http://127.0.0.1:8000/api/mining/miningProcessState?mining_category_id=1', '127.0.0.1', '2024-06-02 21:21:07', '2024-06-02 21:21:07'),
(392, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'GET', '{\"mining_category_id\":\"2\"}', 'http://127.0.0.1:8000/api/mining/miningProcessState?mining_category_id=2', '127.0.0.1', '2024-06-02 21:21:07', '2024-06-02 21:21:07'),
(393, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'GET', '{\"mining_category_id\":\"3\"}', 'http://127.0.0.1:8000/api/mining/miningProcessState?mining_category_id=3', '127.0.0.1', '2024-06-02 21:21:07', '2024-06-02 21:21:07'),
(394, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'GET', '{\"mining_category_id\":\"4\"}', 'http://127.0.0.1:8000/api/mining/miningProcessState?mining_category_id=4', '127.0.0.1', '2024-06-02 21:21:07', '2024-06-02 21:21:07'),
(395, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'POST', '[]', 'http://127.0.0.1:8000/api/auth/me', '127.0.0.1', '2024-06-02 21:21:09', '2024-06-02 21:21:09'),
(396, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'POST', '{\"mining_category_id\":\"4\"}', 'http://127.0.0.1:8000/api/mining/miningProcess', '127.0.0.1', '2024-06-02 21:21:12', '2024-06-02 21:21:12'),
(397, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'GET', '[]', 'http://127.0.0.1:8000/api/setting/settingrow', '127.0.0.1', '2024-06-02 21:21:24', '2024-06-02 21:21:24'),
(398, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'GET', '[]', 'http://127.0.0.1:8000/api/mining/checkMiningInfo', '127.0.0.1', '2024-06-02 21:21:24', '2024-06-02 21:21:24'),
(399, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'GET', '{\"mining_category_id\":\"1\"}', 'http://127.0.0.1:8000/api/mining/miningProcessState?mining_category_id=1', '127.0.0.1', '2024-06-02 21:21:25', '2024-06-02 21:21:25'),
(400, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'GET', '{\"mining_category_id\":\"2\"}', 'http://127.0.0.1:8000/api/mining/miningProcessState?mining_category_id=2', '127.0.0.1', '2024-06-02 21:21:25', '2024-06-02 21:21:25'),
(401, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'GET', '{\"mining_category_id\":\"3\"}', 'http://127.0.0.1:8000/api/mining/miningProcessState?mining_category_id=3', '127.0.0.1', '2024-06-02 21:21:25', '2024-06-02 21:21:25'),
(402, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'GET', '{\"mining_category_id\":\"4\"}', 'http://127.0.0.1:8000/api/mining/miningProcessState?mining_category_id=4', '127.0.0.1', '2024-06-02 21:21:25', '2024-06-02 21:21:25'),
(403, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'POST', '[]', 'http://127.0.0.1:8000/api/auth/me', '127.0.0.1', '2024-06-02 21:21:27', '2024-06-02 21:21:27'),
(404, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'GET', '[]', 'http://127.0.0.1:8000/api/setting/settingrow', '127.0.0.1', '2024-06-02 21:22:09', '2024-06-02 21:22:09'),
(405, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'GET', '[]', 'http://127.0.0.1:8000/api/mining/checkMiningInfo', '127.0.0.1', '2024-06-02 21:22:10', '2024-06-02 21:22:10'),
(406, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'GET', '{\"mining_category_id\":\"1\"}', 'http://127.0.0.1:8000/api/mining/miningProcessState?mining_category_id=1', '127.0.0.1', '2024-06-02 21:22:10', '2024-06-02 21:22:10'),
(407, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'GET', '{\"mining_category_id\":\"2\"}', 'http://127.0.0.1:8000/api/mining/miningProcessState?mining_category_id=2', '127.0.0.1', '2024-06-02 21:22:11', '2024-06-02 21:22:11'),
(408, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'GET', '{\"mining_category_id\":\"3\"}', 'http://127.0.0.1:8000/api/mining/miningProcessState?mining_category_id=3', '127.0.0.1', '2024-06-02 21:22:11', '2024-06-02 21:22:11'),
(409, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'GET', '{\"mining_category_id\":\"4\"}', 'http://127.0.0.1:8000/api/mining/miningProcessState?mining_category_id=4', '127.0.0.1', '2024-06-02 21:22:11', '2024-06-02 21:22:11'),
(410, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'POST', '[]', 'http://127.0.0.1:8000/api/auth/me', '127.0.0.1', '2024-06-02 21:22:16', '2024-06-02 21:22:16'),
(411, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'POST', '[]', 'http://127.0.0.1:8000/api/auth/logout', '127.0.0.1', '2024-06-02 21:34:29', '2024-06-02 21:34:29'),
(412, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'POST', '{\"email\":\"b@gmail.com\",\"password\":\"b@gmail.com\",\"captchaInput\":\"426974\",\"userCapInput\":\"426974\"}', 'http://127.0.0.1:8000/api/auth/login', '127.0.0.1', '2024-06-02 21:34:45', '2024-06-02 21:34:45'),
(413, 3, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'GET', '[]', 'http://127.0.0.1:8000/api/setting/settingrow', '127.0.0.1', '2024-06-02 21:34:45', '2024-06-02 21:34:45'),
(414, 3, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'GET', '[]', 'http://127.0.0.1:8000/api/mining/checkMiningInfo', '127.0.0.1', '2024-06-02 21:34:45', '2024-06-02 21:34:45'),
(415, 3, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'GET', '{\"mining_category_id\":\"1\"}', 'http://127.0.0.1:8000/api/mining/miningProcessState?mining_category_id=1', '127.0.0.1', '2024-06-02 21:34:46', '2024-06-02 21:34:46'),
(416, 3, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'GET', '{\"mining_category_id\":\"3\"}', 'http://127.0.0.1:8000/api/mining/miningProcessState?mining_category_id=3', '127.0.0.1', '2024-06-02 21:34:46', '2024-06-02 21:34:46'),
(417, 3, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'POST', '[]', 'http://127.0.0.1:8000/api/auth/me', '127.0.0.1', '2024-06-02 21:34:48', '2024-06-02 21:34:48'),
(418, 3, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'GET', '[]', 'http://127.0.0.1:8000/api/user/getCommunity', '127.0.0.1', '2024-06-02 21:35:04', '2024-06-02 21:35:04');
INSERT INTO `logs` (`id`, `user_id`, `user_agent`, `method`, `full_request`, `url`, `ip`, `created_at`, `updated_at`) VALUES
(419, 3, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'GET', '[]', 'http://127.0.0.1:8000/api/messages/community-english', '127.0.0.1', '2024-06-02 21:35:28', '2024-06-02 21:35:28'),
(420, 3, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'POST', '{\"username\":\"community-english\",\"message\":\"Yello\",\"community_slug\":\"community-english\"}', 'http://127.0.0.1:8000/api/messages', '127.0.0.1', '2024-06-02 21:35:41', '2024-06-02 21:35:41'),
(421, 3, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'POST', '{\"username\":\"community-english\",\"message\":\"Yes good\",\"community_slug\":\"community-english\"}', 'http://127.0.0.1:8000/api/messages', '127.0.0.1', '2024-06-02 21:36:15', '2024-06-02 21:36:15'),
(422, 3, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'POST', '{\"username\":\"community-english\",\"message\":\"sfsdfsdf\",\"community_slug\":\"community-english\"}', 'http://127.0.0.1:8000/api/messages', '127.0.0.1', '2024-06-02 21:38:00', '2024-06-02 21:38:00'),
(423, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'POST', '{\"email\":\"dev1@mail.com\",\"password\":\"dev1@mail.com\",\"captchaInput\":\"114506\",\"userCapInput\":\"114506\"}', 'http://127.0.0.1:8000/api/auth/login', '127.0.0.1', '2024-06-03 11:08:18', '2024-06-03 11:08:18'),
(424, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'POST', '[]', 'http://127.0.0.1:8000/api/auth/me', '127.0.0.1', '2024-06-03 11:08:20', '2024-06-03 11:08:20'),
(425, 1, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'GET', '[]', 'http://127.0.0.1:8000/api/product/dashboardCounting', '127.0.0.1', '2024-06-03 11:08:20', '2024-06-03 11:08:20'),
(426, 1, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'POST', '[]', 'http://127.0.0.1:8000/api/auth/me', '127.0.0.1', '2024-06-03 11:08:20', '2024-06-03 11:08:20'),
(427, 1, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'POST', '[]', 'http://127.0.0.1:8000/api/auth/me', '127.0.0.1', '2024-06-03 11:10:03', '2024-06-03 11:10:03'),
(428, 1, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'GET', '[]', 'http://127.0.0.1:8000/api/setting/settingrow', '127.0.0.1', '2024-06-03 11:10:03', '2024-06-03 11:10:03'),
(429, 1, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'POST', '{\"name\":\"UIC\",\"email\":\"uic@abcd.com\",\"address\":\"Addres\",\"whatsApp\":\"00000055555\",\"description\":\"Business Description\",\"copyright\":\"Copyright \\u00a9 2024 uic . All Rights Reserved\",\"currency\":\"$\",\"fblink\":\"https:\\/\\/www.fiverr.com\",\"telegram\":\"116898999999\",\"deposit_service_charge\":\"5\",\"withdraw_service_charge\":\"5\",\"crypto_wallet_address\":\"TPpMvdKfhENfJqYZsDJQLgEopMRBy15jeU\",\"store_policy\":null,\"register_bonus\":\"3\",\"maximum_supply\":\"21474836470000\",\"total_supply\":\"21474836471111\",\"website\":\"http:\\/\\/winup360.com\"}', 'http://127.0.0.1:8000/api/setting/upateSetting', '127.0.0.1', '2024-06-03 11:10:14', '2024-06-03 11:10:14'),
(430, 1, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'POST', '[]', 'http://127.0.0.1:8000/api/auth/me', '127.0.0.1', '2024-06-03 11:10:19', '2024-06-03 11:10:19'),
(431, 1, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'GET', '[]', 'http://127.0.0.1:8000/api/setting/settingrow', '127.0.0.1', '2024-06-03 11:10:19', '2024-06-03 11:10:19'),
(432, 1, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'POST', '{\"name\":\"UIC\",\"email\":\"uic@abcd.com\",\"address\":\"Addres\",\"whatsApp\":\"00000055555\",\"description\":\"Business Description\",\"copyright\":\"Copyright \\u00a9 2024 uic . All Rights Reserved\",\"currency\":\"$\",\"fblink\":\"https:\\/\\/www.fiverr.com\",\"telegram\":\"116898999999\",\"deposit_service_charge\":\"5\",\"withdraw_service_charge\":\"5\",\"crypto_wallet_address\":\"TPpMvdKfhENfJqYZsDJQLgEopMRBy15jeU\",\"store_policy\":null,\"register_bonus\":\"3\",\"maximum_supply\":\"2147483647222\",\"total_supply\":\"21474836474343434\",\"website\":\"http:\\/\\/winup360.com\"}', 'http://127.0.0.1:8000/api/setting/upateSetting', '127.0.0.1', '2024-06-03 11:11:51', '2024-06-03 11:11:51'),
(433, 1, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'POST', '[]', 'http://127.0.0.1:8000/api/auth/me', '127.0.0.1', '2024-06-03 11:11:54', '2024-06-03 11:11:54'),
(434, 1, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'GET', '[]', 'http://127.0.0.1:8000/api/setting/settingrow', '127.0.0.1', '2024-06-03 11:11:55', '2024-06-03 11:11:55'),
(435, 1, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'POST', '[]', 'http://127.0.0.1:8000/api/auth/me', '127.0.0.1', '2024-06-03 11:13:07', '2024-06-03 11:13:07'),
(436, 1, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'GET', '[]', 'http://127.0.0.1:8000/api/setting/settingrow', '127.0.0.1', '2024-06-03 11:13:07', '2024-06-03 11:13:07'),
(437, 1, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'POST', '{\"name\":\"UIC\",\"email\":\"uic@abcd.com\",\"address\":\"Addres\",\"whatsApp\":\"00000055555\",\"description\":\"Business Description\",\"copyright\":\"Copyright \\u00a9 2024 uic . All Rights Reserved\",\"currency\":\"$\",\"fblink\":\"https:\\/\\/www.fiverr.com\",\"telegram\":\"116898999999\",\"deposit_service_charge\":\"5\",\"withdraw_service_charge\":\"5\",\"crypto_wallet_address\":\"TPpMvdKfhENfJqYZsDJQLgEopMRBy15jeU\",\"store_policy\":null,\"register_bonus\":\"3\",\"maximum_supply\":\"214748364711\",\"total_supply\":\"214748364722222\",\"website\":\"http:\\/\\/winup360.com\"}', 'http://127.0.0.1:8000/api/setting/upateSetting', '127.0.0.1', '2024-06-03 11:13:12', '2024-06-03 11:13:12'),
(438, 1, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'POST', '[]', 'http://127.0.0.1:8000/api/auth/me', '127.0.0.1', '2024-06-03 11:13:17', '2024-06-03 11:13:17'),
(439, 1, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'GET', '[]', 'http://127.0.0.1:8000/api/setting/settingrow', '127.0.0.1', '2024-06-03 11:13:17', '2024-06-03 11:13:17'),
(440, 1, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'POST', '{\"name\":\"UIC\",\"email\":\"uic@abcd.com\",\"address\":\"Addres\",\"whatsApp\":\"00000055555\",\"description\":\"Business Description\",\"copyright\":\"Copyright \\u00a9 2024 uic . All Rights Reserved\",\"currency\":\"$\",\"fblink\":\"https:\\/\\/www.fiverr.com\",\"telegram\":\"116898999999\",\"deposit_service_charge\":\"5\",\"withdraw_service_charge\":\"5\",\"crypto_wallet_address\":\"TPpMvdKfhENfJqYZsDJQLgEopMRBy15jeU\",\"store_policy\":null,\"register_bonus\":\"3\",\"maximum_supply\":\"214748364722\",\"total_supply\":\"21474836473434\",\"website\":\"http:\\/\\/winup360.com\"}', 'http://127.0.0.1:8000/api/setting/upateSetting', '127.0.0.1', '2024-06-03 11:14:29', '2024-06-03 11:14:29'),
(441, 1, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'POST', '{\"name\":\"UIC\",\"email\":\"uic@abcd.com\",\"address\":\"Addres\",\"whatsApp\":\"00000055555\",\"description\":\"Business Description\",\"copyright\":\"Copyright \\u00a9 2024 uic . All Rights Reserved\",\"currency\":\"$\",\"fblink\":\"https:\\/\\/www.fiverr.com\",\"telegram\":\"116898999999\",\"deposit_service_charge\":\"5\",\"withdraw_service_charge\":\"5\",\"crypto_wallet_address\":\"TPpMvdKfhENfJqYZsDJQLgEopMRBy15jeU\",\"store_policy\":null,\"register_bonus\":\"3\",\"maximum_supply\":\"214748364722333\",\"total_supply\":\"2147483647343433\",\"website\":\"http:\\/\\/winup360.com\"}', 'http://127.0.0.1:8000/api/setting/upateSetting', '127.0.0.1', '2024-06-03 11:15:27', '2024-06-03 11:15:27'),
(442, 1, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'POST', '{\"name\":\"UIC\",\"email\":\"uic@abcd.com\",\"address\":\"Addres\",\"whatsApp\":\"00000055555\",\"description\":\"Business Description\",\"copyright\":\"Copyright \\u00a9 2024 uic . All Rights Reserved\",\"currency\":\"$\",\"fblink\":\"https:\\/\\/www.fiverr.com\",\"telegram\":\"116898999999\",\"deposit_service_charge\":\"5\",\"withdraw_service_charge\":\"5\",\"crypto_wallet_address\":\"TPpMvdKfhENfJqYZsDJQLgEopMRBy15jeU\",\"store_policy\":null,\"register_bonus\":\"3\",\"maximum_supply\":\"214748364722333\",\"total_supply\":\"2147483647343433\",\"website\":\"http:\\/\\/winup360.com\"}', 'http://127.0.0.1:8000/api/setting/upateSetting', '127.0.0.1', '2024-06-03 11:15:53', '2024-06-03 11:15:53'),
(443, 1, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'POST', '[]', 'http://127.0.0.1:8000/api/auth/me', '127.0.0.1', '2024-06-03 11:15:59', '2024-06-03 11:15:59'),
(444, 1, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'GET', '[]', 'http://127.0.0.1:8000/api/setting/settingrow', '127.0.0.1', '2024-06-03 11:15:59', '2024-06-03 11:15:59'),
(445, 1, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'POST', '[]', 'http://127.0.0.1:8000/api/auth/me', '127.0.0.1', '2024-06-03 11:26:12', '2024-06-03 11:26:12'),
(446, 1, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'GET', '[]', 'http://127.0.0.1:8000/api/setting/settingrow', '127.0.0.1', '2024-06-03 11:26:12', '2024-06-03 11:26:12'),
(447, 1, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'POST', '[]', 'http://127.0.0.1:8000/api/auth/me', '127.0.0.1', '2024-06-03 11:36:14', '2024-06-03 11:36:14'),
(448, 1, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'GET', '[]', 'http://127.0.0.1:8000/api/setting/settingrow', '127.0.0.1', '2024-06-03 11:36:14', '2024-06-03 11:36:14'),
(449, 1, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'POST', '[]', 'http://127.0.0.1:8000/api/auth/me', '127.0.0.1', '2024-06-03 11:39:55', '2024-06-03 11:39:55'),
(450, 1, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'GET', '[]', 'http://127.0.0.1:8000/api/setting/settingrow', '127.0.0.1', '2024-06-03 11:39:55', '2024-06-03 11:39:55'),
(451, 1, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'POST', '[]', 'http://127.0.0.1:8000/api/auth/me', '127.0.0.1', '2024-06-03 11:43:10', '2024-06-03 11:43:10'),
(452, 1, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'GET', '[]', 'http://127.0.0.1:8000/api/setting/settingrow', '127.0.0.1', '2024-06-03 11:43:10', '2024-06-03 11:43:10'),
(453, 1, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'POST', '{\"name\":\"UIC\",\"email\":\"uic@abcd.com\",\"address\":\"Addres\",\"whatsApp\":\"00000055555\",\"description\":\"Business Description\",\"copyright\":\"Copyright \\u00a9 2024 uic . All Rights Reserved\",\"currency\":\"$\",\"fblink\":\"https:\\/\\/www.fiverr.com\",\"telegram\":\"116898999999\",\"deposit_service_charge\":\"5\",\"withdraw_service_charge\":\"5\",\"crypto_wallet_address\":\"TPpMvdKfhENfJqYZsDJQLgEopMRBy15jeU\",\"store_policy\":null,\"register_bonus\":\"3\",\"maximum_supply\":\"214748364722333\",\"total_supply\":\"2147483647343433\",\"website\":\"http:\\/\\/winup360.com\"}', 'http://127.0.0.1:8000/api/setting/upateSetting', '127.0.0.1', '2024-06-03 11:46:51', '2024-06-03 11:46:51'),
(454, 1, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'GET', '[]', 'http://127.0.0.1:8000/api/setting/settingrow', '127.0.0.1', '2024-06-03 13:11:38', '2024-06-03 13:11:38'),
(455, 1, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'GET', '[]', 'http://127.0.0.1:8000/api/setting/settingrow', '127.0.0.1', '2024-06-03 13:13:31', '2024-06-03 13:13:31'),
(456, 1, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'POST', '{\"name\":\"UIC\",\"email\":\"uic@abcd.com\",\"address\":\"Addres\",\"whatsApp\":\"00000055555\",\"description\":\"Business Description\",\"copyright\":\"Copyright \\u00a9 2024 uic . All Rights Reserved\",\"currency\":\"$\",\"fblink\":\"https:\\/\\/www.fiverr.com\",\"telegram\":\"116898999999\",\"deposit_service_charge\":\"5\",\"withdraw_service_charge\":\"5\",\"crypto_wallet_address\":\"TPpMvdKfhENfJqYZsDJQLgEopMRBy15jeU\",\"store_policy\":null,\"register_bonus\":\"5\",\"maximum_supply\":\"214748364722333\",\"total_supply\":\"2147483647343433\",\"website\":\"http:\\/\\/winup360.com\"}', 'http://127.0.0.1:8000/api/setting/upateSetting', '127.0.0.1', '2024-06-03 13:34:27', '2024-06-03 13:34:27'),
(457, 1, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'GET', '[]', 'http://127.0.0.1:8000/api/setting/settingrow', '127.0.0.1', '2024-06-03 13:36:54', '2024-06-03 13:36:54'),
(458, 1, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'POST', '{\"name\":\"UIC\",\"email\":\"uic@abcd.com\",\"address\":\"Addres\",\"whatsApp\":\"00000055555\",\"description\":\"Business Description\",\"copyright\":\"Copyright \\u00a9 2024 uic . All Rights Reserved\",\"currency\":\"$\",\"fblink\":\"https:\\/\\/www.fiverr.com\",\"telegram\":\"116898999999\",\"deposit_service_charge\":\"5\",\"mininmum_deposit_amount\":\"55\",\"maximum_deposit_amount\":\"5\",\"minimum_withdrawal\":\"5\",\"maximum_withdrawal\":\"5\",\"daily_max_withdraw_request\":\"5\",\"withdrawal_free_amount\":\"5\",\"withdrawal_free_on_percentage\":\"5\",\"mimumun_transfer_amount_to_other_user\":\"5\",\"maximum_transfer_amount_to_other_user\":\"5\",\"transfer_fee_fixed_amount\":\"5\",\"traansfer_fee_on_percentage\":\"5\",\"withdraw_service_charge\":\"5\",\"crypto_wallet_address\":\"TPpMvdKfhENfJqYZsDJQLgEopMRBy15jeU\",\"store_policy\":null,\"register_bonus\":\"5\",\"maximum_supply\":\"214748364722333\",\"total_supply\":\"2147483647343433\",\"website\":\"http:\\/\\/winup360.com\"}', 'http://127.0.0.1:8000/api/setting/upateSetting', '127.0.0.1', '2024-06-03 13:37:06', '2024-06-03 13:37:06'),
(459, 1, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'GET', '[]', 'http://127.0.0.1:8000/api/setting/settingrow', '127.0.0.1', '2024-06-03 13:38:39', '2024-06-03 13:38:39'),
(460, 1, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'POST', '{\"name\":\"UIC\",\"email\":\"uic@abcd.com\",\"address\":\"Addres\",\"whatsApp\":\"00000055555\",\"description\":\"Business Description\",\"copyright\":\"Copyright \\u00a9 2024 uic . All Rights Reserved\",\"currency\":\"$\",\"fblink\":\"https:\\/\\/www.fiverr.com\",\"telegram\":\"116898999999\",\"deposit_service_charge\":\"5\",\"mininmum_deposit_amount\":\"55\",\"maximum_deposit_amount\":\"5\",\"minimum_withdrawal\":\"5\",\"maximum_withdrawal\":\"5\",\"daily_max_withdraw_request\":\"5\",\"withdrawal_free_amount\":\"5\",\"withdrawal_free_on_percentage\":\"5\",\"mimumun_transfer_amount_to_other_user\":\"5\",\"maximum_transfer_amount_to_other_user\":\"5\",\"transfer_fee_fixed_amount\":\"5\",\"traansfer_fee_on_percentage\":\"5\",\"withdraw_service_charge\":\"5\",\"crypto_wallet_address\":\"TPpMvdKfhENfJqYZsDJQLgEopMRBy15jeU\",\"store_policy\":null,\"register_bonus\":\"5\",\"maximum_supply\":\"214748364722333\",\"total_supply\":\"2147483647343433\",\"website\":\"http:\\/\\/winup360.com\"}', 'http://127.0.0.1:8000/api/setting/upateSetting', '127.0.0.1', '2024-06-03 13:42:34', '2024-06-03 13:42:34'),
(461, 1, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'GET', '[]', 'http://127.0.0.1:8000/api/setting/settingrow', '127.0.0.1', '2024-06-03 13:43:17', '2024-06-03 13:43:17'),
(462, 1, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'POST', '{\"name\":\"UIC\",\"email\":\"uic@abcd.com\",\"address\":\"Addres\",\"whatsApp\":\"00000055555\",\"description\":\"Business Description\",\"copyright\":\"Copyright \\u00a9 2024 uic . All Rights Reserved\",\"currency\":\"$\",\"fblink\":\"https:\\/\\/www.fiverr.com\",\"telegram\":\"116898999999\",\"deposit_service_charge\":\"5\",\"mininmum_deposit_amount\":\"55\",\"maximum_deposit_amount\":\"5\",\"minimum_withdrawal\":\"5\",\"maximum_withdrawal\":\"5\",\"daily_max_withdraw_request\":\"5\",\"withdrawal_free_amount\":\"5\",\"withdrawal_free_on_percentage\":\"5\",\"mimumun_transfer_amount_to_other_user\":\"5\",\"maximum_transfer_amount_to_other_user\":\"5\",\"transfer_fee_fixed_amount\":\"5\",\"traansfer_fee_on_percentage\":\"50\",\"withdraw_service_charge\":\"5\",\"crypto_wallet_address\":\"TPpMvdKfhENfJqYZsDJQLgEopMRBy15jeU\",\"store_policy\":null,\"register_bonus\":\"5\",\"maximum_supply\":\"214748364722333\",\"total_supply\":\"2147483647343433\",\"website\":\"http:\\/\\/winup360.com\"}', 'http://127.0.0.1:8000/api/setting/upateSetting', '127.0.0.1', '2024-06-03 13:43:26', '2024-06-03 13:43:26'),
(463, 1, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'POST', '[]', 'http://127.0.0.1:8000/api/auth/me', '127.0.0.1', '2024-06-03 13:43:35', '2024-06-03 13:43:35'),
(464, 1, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'GET', '[]', 'http://127.0.0.1:8000/api/setting/settingrow', '127.0.0.1', '2024-06-03 13:43:35', '2024-06-03 13:43:35'),
(465, 1, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'GET', '{\"page\":\"1\",\"pageSize\":\"10\",\"searchQuery\":null,\"selectedFilter\":\"1\"}', 'http://127.0.0.1:8000/api/mining/allMiningDuration?page=1&pageSize=10&searchQuery=&selectedFilter=1', '127.0.0.1', '2024-06-03 13:44:44', '2024-06-03 13:44:44'),
(466, 1, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'GET', '[]', 'http://127.0.0.1:8000/api/mining/getMiningCategory', '127.0.0.1', '2024-06-03 13:44:46', '2024-06-03 13:44:46'),
(467, 1, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'GET', '{\"page\":\"1\",\"pageSize\":\"10\",\"searchQuery\":null,\"selectedFilter\":\"1\"}', 'http://127.0.0.1:8000/api/mining/allMiningDuration?page=1&pageSize=10&searchQuery=&selectedFilter=1', '127.0.0.1', '2024-06-03 13:45:36', '2024-06-03 13:45:36'),
(468, 1, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'GET', '[]', 'http://127.0.0.1:8000/api/mining/minningDurationrow/11', '127.0.0.1', '2024-06-03 13:45:38', '2024-06-03 13:45:38'),
(469, 1, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'GET', '[]', 'http://127.0.0.1:8000/api/mining/getMiningCategory', '127.0.0.1', '2024-06-03 13:45:38', '2024-06-03 13:45:38'),
(470, 1, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'GET', '{\"page\":\"1\",\"pageSize\":\"10\",\"searchQuery\":null,\"selectedFilter\":\"1\"}', 'http://127.0.0.1:8000/api/category/allMiningCategoryes?page=1&pageSize=10&searchQuery=&selectedFilter=1', '127.0.0.1', '2024-06-03 13:45:52', '2024-06-03 13:45:52'),
(471, 1, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'GET', '{\"page\":\"1\",\"pageSize\":\"10\",\"searchQuery\":null,\"selectedFilter\":\"1\"}', 'http://127.0.0.1:8000/api/category/allMiningCategoryes?page=1&pageSize=10&searchQuery=&selectedFilter=1', '127.0.0.1', '2024-06-03 13:46:58', '2024-06-03 13:46:58'),
(472, 1, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'GET', '[]', 'http://127.0.0.1:8000/api/category/minningCategoryrow/4', '127.0.0.1', '2024-06-03 13:46:59', '2024-06-03 13:46:59'),
(473, 1, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'POST', '[]', 'http://127.0.0.1:8000/api/auth/logout', '127.0.0.1', '2024-06-03 14:04:11', '2024-06-03 14:04:11'),
(474, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'GET', '[]', 'http://127.0.0.1:8000/api/setting/settingrow', '127.0.0.1', '2024-06-03 14:06:44', '2024-06-03 14:06:44'),
(475, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'GET', '[]', 'http://127.0.0.1:8000/api/mining/checkMiningInfo', '127.0.0.1', '2024-06-03 14:06:44', '2024-06-03 14:06:44'),
(476, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'POST', '[]', 'http://127.0.0.1:8000/api/auth/me', '127.0.0.1', '2024-06-03 14:06:47', '2024-06-03 14:06:47'),
(477, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'POST', '{\"email\":\"b@gmail.com\",\"password\":\"b@gmail.com\",\"captchaInput\":\"036514\",\"userCapInput\":\"036514\"}', 'http://127.0.0.1:8000/api/auth/login', '127.0.0.1', '2024-06-03 14:07:20', '2024-06-03 14:07:20'),
(478, 3, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'GET', '[]', 'http://127.0.0.1:8000/api/setting/settingrow', '127.0.0.1', '2024-06-03 14:07:20', '2024-06-03 14:07:20'),
(479, 3, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'GET', '[]', 'http://127.0.0.1:8000/api/mining/checkMiningInfo', '127.0.0.1', '2024-06-03 14:07:20', '2024-06-03 14:07:20'),
(480, 3, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'GET', '{\"mining_category_id\":\"1\"}', 'http://127.0.0.1:8000/api/mining/miningProcessState?mining_category_id=1', '127.0.0.1', '2024-06-03 14:07:21', '2024-06-03 14:07:21'),
(481, 3, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'GET', '{\"mining_category_id\":\"3\"}', 'http://127.0.0.1:8000/api/mining/miningProcessState?mining_category_id=3', '127.0.0.1', '2024-06-03 14:07:21', '2024-06-03 14:07:21'),
(482, 3, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'POST', '[]', 'http://127.0.0.1:8000/api/auth/me', '127.0.0.1', '2024-06-03 14:07:23', '2024-06-03 14:07:23'),
(483, 3, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'GET', '[]', 'http://127.0.0.1:8000/api/auth/showProfileData', '127.0.0.1', '2024-06-03 14:07:26', '2024-06-03 14:07:26'),
(484, 3, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'GET', '[]', 'http://127.0.0.1:8000/api/setting/settingrow', '127.0.0.1', '2024-06-03 14:07:32', '2024-06-03 14:07:32'),
(485, 3, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'GET', '[]', 'http://127.0.0.1:8000/api/mining/checkMiningInfo', '127.0.0.1', '2024-06-03 14:07:32', '2024-06-03 14:07:32'),
(486, 3, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'GET', '{\"mining_category_id\":\"1\"}', 'http://127.0.0.1:8000/api/mining/miningProcessState?mining_category_id=1', '127.0.0.1', '2024-06-03 14:07:33', '2024-06-03 14:07:33'),
(487, 3, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'GET', '{\"mining_category_id\":\"3\"}', 'http://127.0.0.1:8000/api/mining/miningProcessState?mining_category_id=3', '127.0.0.1', '2024-06-03 14:07:33', '2024-06-03 14:07:33'),
(488, 3, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'POST', '[]', 'http://127.0.0.1:8000/api/auth/me', '127.0.0.1', '2024-06-03 14:07:35', '2024-06-03 14:07:35'),
(489, 3, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'GET', '[]', 'http://127.0.0.1:8000/api/mining/getMiningCategory', '127.0.0.1', '2024-06-03 14:07:36', '2024-06-03 14:07:36'),
(490, 3, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'GET', '{\"categoryId\":\"1\"}', 'http://127.0.0.1:8000/api/mining/getMiningDuration?categoryId=1', '127.0.0.1', '2024-06-03 14:08:06', '2024-06-03 14:08:06'),
(491, 3, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'GET', '[]', 'http://127.0.0.1:8000/api/mining/getMiningCategory', '127.0.0.1', '2024-06-03 14:11:16', '2024-06-03 14:11:16'),
(492, 3, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'GET', '[]', 'http://127.0.0.1:8000/api/mining/getMiningCategory', '127.0.0.1', '2024-06-03 14:11:54', '2024-06-03 14:11:54'),
(493, 3, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'GET', '[]', 'http://127.0.0.1:8000/api/mining/getMiningCategory', '127.0.0.1', '2024-06-03 14:13:18', '2024-06-03 14:13:18'),
(494, 3, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'GET', '[]', 'http://127.0.0.1:8000/api/mining/getMiningCategory', '127.0.0.1', '2024-06-03 14:13:40', '2024-06-03 14:13:40'),
(495, 3, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'GET', '{\"categoryId\":\"1\"}', 'http://127.0.0.1:8000/api/mining/getMiningDuration?categoryId=1', '127.0.0.1', '2024-06-03 14:13:42', '2024-06-03 14:13:42'),
(496, 3, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'GET', '[]', 'http://127.0.0.1:8000/api/mining/getMiningCategory', '127.0.0.1', '2024-06-03 14:14:33', '2024-06-03 14:14:33'),
(497, 3, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'GET', '[]', 'http://127.0.0.1:8000/api/mining/getMiningCategory', '127.0.0.1', '2024-06-03 14:14:56', '2024-06-03 14:14:56'),
(498, 3, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'GET', '[]', 'http://127.0.0.1:8000/api/mining/getMiningCategory', '127.0.0.1', '2024-06-03 14:15:06', '2024-06-03 14:15:06'),
(499, 3, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'GET', '[]', 'http://127.0.0.1:8000/api/mining/getMiningCategory', '127.0.0.1', '2024-06-03 14:15:24', '2024-06-03 14:15:24'),
(500, 3, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'GET', '[]', 'http://127.0.0.1:8000/api/mining/getMiningCategory', '127.0.0.1', '2024-06-03 14:15:46', '2024-06-03 14:15:46'),
(501, 3, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'GET', '{\"categoryId\":\"2\"}', 'http://127.0.0.1:8000/api/mining/getMiningDuration?categoryId=2', '127.0.0.1', '2024-06-03 14:16:18', '2024-06-03 14:16:18'),
(502, 3, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'POST', '{\"mining_category_id\":\"2\",\"selected_duration_id\":\"4\",\"selectedDuration\":\"30\",\"selectedPrice\":\"10\"}', 'http://127.0.0.1:8000/api/mining/buyMiningDuration', '127.0.0.1', '2024-06-03 14:16:22', '2024-06-03 14:16:22'),
(503, 3, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'GET', '[]', 'http://127.0.0.1:8000/api/setting/settingrow', '127.0.0.1', '2024-06-03 14:16:23', '2024-06-03 14:16:23'),
(504, 3, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'GET', '[]', 'http://127.0.0.1:8000/api/mining/checkMiningInfo', '127.0.0.1', '2024-06-03 14:16:23', '2024-06-03 14:16:23'),
(505, 3, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'GET', '{\"mining_category_id\":\"1\"}', 'http://127.0.0.1:8000/api/mining/miningProcessState?mining_category_id=1', '127.0.0.1', '2024-06-03 14:16:23', '2024-06-03 14:16:23'),
(506, 3, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'GET', '{\"mining_category_id\":\"2\"}', 'http://127.0.0.1:8000/api/mining/miningProcessState?mining_category_id=2', '127.0.0.1', '2024-06-03 14:16:23', '2024-06-03 14:16:23'),
(507, 3, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'GET', '{\"mining_category_id\":\"3\"}', 'http://127.0.0.1:8000/api/mining/miningProcessState?mining_category_id=3', '127.0.0.1', '2024-06-03 14:16:23', '2024-06-03 14:16:23'),
(508, 3, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'POST', '[]', 'http://127.0.0.1:8000/api/auth/me', '127.0.0.1', '2024-06-03 14:16:25', '2024-06-03 14:16:25'),
(509, 3, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'GET', '[]', 'http://127.0.0.1:8000/api/mining/getMiningCategory', '127.0.0.1', '2024-06-03 14:16:27', '2024-06-03 14:16:27'),
(510, 3, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'GET', '[]', 'http://127.0.0.1:8000/api/mining/getMiningCategory', '127.0.0.1', '2024-06-03 14:16:40', '2024-06-03 14:16:40'),
(511, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'GET', '[]', 'http://127.0.0.1:8000', '127.0.0.1', '2024-06-03 19:17:58', '2024-06-03 19:17:58'),
(512, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'GET', '[]', 'http://127.0.0.1:8000/upload', '127.0.0.1', '2024-06-03 19:18:04', '2024-06-03 19:18:04'),
(513, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'POST', '{\"_token\":\"FIBx0pRTFP2dhPPdIUG6wnXy2ujZjMCK8DgQXqN2\",\"file\":{}}', 'http://127.0.0.1:8000/upload-excel', '127.0.0.1', '2024-06-03 19:20:02', '2024-06-03 19:20:02'),
(514, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'GET', '[]', 'http://127.0.0.1:8000/upload', '127.0.0.1', '2024-06-03 19:29:34', '2024-06-03 19:29:34'),
(515, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'GET', '[]', 'http://127.0.0.1:8000/upload', '127.0.0.1', '2024-06-03 19:29:36', '2024-06-03 19:29:36'),
(516, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'GET', '[]', 'http://127.0.0.1:8000/upload', '127.0.0.1', '2024-06-03 19:29:37', '2024-06-03 19:29:37'),
(517, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'POST', '{\"_token\":\"FIBx0pRTFP2dhPPdIUG6wnXy2ujZjMCK8DgQXqN2\",\"file\":{}}', 'http://127.0.0.1:8000/upload-excel', '127.0.0.1', '2024-06-03 19:29:44', '2024-06-03 19:29:44'),
(518, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'GET', '[]', 'http://127.0.0.1:8000/upload', '127.0.0.1', '2024-06-03 19:30:32', '2024-06-03 19:30:32'),
(519, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'GET', '[]', 'http://127.0.0.1:8000/upload', '127.0.0.1', '2024-06-03 19:30:34', '2024-06-03 19:30:34'),
(520, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'POST', '{\"_token\":\"FIBx0pRTFP2dhPPdIUG6wnXy2ujZjMCK8DgQXqN2\",\"file\":{}}', 'http://127.0.0.1:8000/upload-excel', '127.0.0.1', '2024-06-03 19:30:40', '2024-06-03 19:30:40'),
(521, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'GET', '[]', 'http://127.0.0.1:8000/upload', '127.0.0.1', '2024-06-03 19:37:43', '2024-06-03 19:37:43'),
(522, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'GET', '[]', 'http://127.0.0.1:8000/upload', '127.0.0.1', '2024-06-03 19:37:45', '2024-06-03 19:37:45'),
(523, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'POST', '{\"_token\":\"FIBx0pRTFP2dhPPdIUG6wnXy2ujZjMCK8DgQXqN2\",\"file\":{}}', 'http://127.0.0.1:8000/upload-excel', '127.0.0.1', '2024-06-03 19:37:52', '2024-06-03 19:37:52'),
(524, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'POST', '{\"email\":\"dev1@mail.com\",\"password\":\"dev1@mail.com\",\"captchaInput\":\"466463\",\"userCapInput\":\"466463\"}', 'http://127.0.0.1:8000/api/auth/login', '127.0.0.1', '2024-06-04 04:42:19', '2024-06-04 04:42:19'),
(525, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'POST', '[]', 'http://127.0.0.1:8000/api/auth/me', '127.0.0.1', '2024-06-04 04:42:21', '2024-06-04 04:42:21'),
(526, 1, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'GET', '[]', 'http://127.0.0.1:8000/api/product/dashboardCounting', '127.0.0.1', '2024-06-04 04:42:22', '2024-06-04 04:42:22'),
(527, 1, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'POST', '[]', 'http://127.0.0.1:8000/api/auth/me', '127.0.0.1', '2024-06-04 04:42:22', '2024-06-04 04:42:22'),
(528, 1, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'POST', '[]', 'http://127.0.0.1:8000/api/auth/me', '127.0.0.1', '2024-06-04 04:43:26', '2024-06-04 04:43:26'),
(529, 1, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'GET', '{\"page\":\"1\",\"pageSize\":\"10\",\"searchQuery\":null,\"selectedFilter\":\"1\"}', 'http://127.0.0.1:8000/api/user/allAdmin?page=1&pageSize=10&searchQuery=&selectedFilter=1', '127.0.0.1', '2024-06-04 04:43:36', '2024-06-04 04:43:36'),
(530, 1, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'GET', '{\"page\":\"1\",\"pageSize\":\"10\",\"searchQuery\":null,\"selectedFilter\":\"1\"}', 'http://127.0.0.1:8000/api/user/allAdmin?page=1&pageSize=10&searchQuery=&selectedFilter=1', '127.0.0.1', '2024-06-04 04:43:38', '2024-06-04 04:43:38'),
(531, 1, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'GET', '[]', 'http://127.0.0.1:8000/api/user/allrolelist', '127.0.0.1', '2024-06-04 04:43:40', '2024-06-04 04:43:40'),
(532, 1, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'GET', '{\"page\":\"1\",\"pageSize\":\"10\",\"searchQuery\":null,\"selectedFilter\":\"1\"}', 'http://127.0.0.1:8000/api/user/allAdmin?page=1&pageSize=10&searchQuery=&selectedFilter=1', '127.0.0.1', '2024-06-04 04:43:50', '2024-06-04 04:43:50'),
(533, 1, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'POST', '[]', 'http://127.0.0.1:8000/api/auth/me', '127.0.0.1', '2024-06-04 04:53:22', '2024-06-04 04:53:22'),
(534, 1, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'POST', '[]', 'http://127.0.0.1:8000/api/auth/me', '127.0.0.1', '2024-06-04 04:53:47', '2024-06-04 04:53:47'),
(535, 1, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'GET', '{\"page\":\"1\",\"pageSize\":\"10\",\"searchQuery\":null,\"selectedFilter\":\"1\"}', 'http://127.0.0.1:8000/api/user/allAdmin?page=1&pageSize=10&searchQuery=&selectedFilter=1', '127.0.0.1', '2024-06-04 04:53:47', '2024-06-04 04:53:47'),
(536, 1, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'POST', '[]', 'http://127.0.0.1:8000/api/auth/me', '127.0.0.1', '2024-06-04 04:54:13', '2024-06-04 04:54:13'),
(537, 1, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'GET', '{\"page\":\"1\",\"pageSize\":\"10\",\"searchQuery\":null,\"searchEmail\":null,\"selectedFilter\":\"0\",\"searchOrderId\":null,\"filterFrmDate\":\"2024-06-04\",\"filterToDate\":\"2024-06-04\"}', 'http://127.0.0.1:8000/api/deposit/withdrawal-list?filterFrmDate=2024-06-04&filterToDate=2024-06-04&page=1&pageSize=10&searchEmail=&searchOrderId=&searchQuery=&selectedFilter=0', '127.0.0.1', '2024-06-04 04:58:37', '2024-06-04 04:58:37'),
(538, 1, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'POST', '[]', 'http://127.0.0.1:8000/api/auth/me', '127.0.0.1', '2024-06-04 04:58:41', '2024-06-04 04:58:41'),
(539, 1, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'GET', '[]', 'http://127.0.0.1:8000/api/product/dashboardCounting', '127.0.0.1', '2024-06-04 04:58:41', '2024-06-04 04:58:41'),
(540, 1, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'POST', '[]', 'http://127.0.0.1:8000/api/auth/logout', '127.0.0.1', '2024-06-04 04:58:46', '2024-06-04 04:58:46'),
(541, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'GET', '[]', 'http://127.0.0.1:8000/api/setting/settingrow', '127.0.0.1', '2024-06-04 05:00:45', '2024-06-04 05:00:45'),
(542, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'GET', '[]', 'http://127.0.0.1:8000/api/mining/checkMiningInfo', '127.0.0.1', '2024-06-04 05:00:46', '2024-06-04 05:00:46'),
(543, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'POST', '[]', 'http://127.0.0.1:8000/api/auth/me', '127.0.0.1', '2024-06-04 05:00:51', '2024-06-04 05:00:51'),
(544, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'POST', '{\"email\":\"dev1@mail.com\",\"password\":\"dev1@mail.com\",\"captchaInput\":\"763356\",\"userCapInput\":\"763356\"}', 'http://127.0.0.1:8000/api/auth/login', '127.0.0.1', '2024-06-04 05:08:17', '2024-06-04 05:08:17'),
(545, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'POST', '[]', 'http://127.0.0.1:8000/api/auth/me', '127.0.0.1', '2024-06-04 05:08:17', '2024-06-04 05:08:17'),
(546, 1, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'GET', '[]', 'http://127.0.0.1:8000/api/product/dashboardCounting', '127.0.0.1', '2024-06-04 05:08:18', '2024-06-04 05:08:18'),
(547, 1, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'POST', '[]', 'http://127.0.0.1:8000/api/auth/me', '127.0.0.1', '2024-06-04 05:08:18', '2024-06-04 05:08:18'),
(548, 1, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'GET', '{\"page\":\"1\",\"pageSize\":\"10\",\"searchQuery\":null,\"selectedFilter\":\"1\"}', 'http://127.0.0.1:8000/api/category/allMiningCategoryes?page=1&pageSize=10&searchQuery=&selectedFilter=1', '127.0.0.1', '2024-06-04 05:08:21', '2024-06-04 05:08:21'),
(549, 1, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'POST', '[]', 'http://127.0.0.1:8000/api/auth/me', '127.0.0.1', '2024-06-04 05:08:29', '2024-06-04 05:08:29'),
(550, 1, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'GET', '{\"page\":\"1\",\"pageSize\":\"10\",\"searchQuery\":null,\"selectedFilter\":\"1\"}', 'http://127.0.0.1:8000/api/category/allMiningCategoryes?page=1&pageSize=10&searchQuery=&selectedFilter=1', '127.0.0.1', '2024-06-04 05:08:29', '2024-06-04 05:08:29'),
(551, 1, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'POST', '[]', 'http://127.0.0.1:8000/api/auth/me', '127.0.0.1', '2024-06-04 05:24:37', '2024-06-04 05:24:37'),
(552, 1, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'POST', '{\"name\":\"aasdasd\",\"minining_amount_per_secnd\":\"0.00001157\",\"second\":\"3600\",\"minute\":\"60\",\"duration_in_hour\":\"1\",\"offer_description\":\"dfdf\",\"daily_mining_amount\":\"1\",\"mining_value_mention_at_hour\":\"0.04166667\",\"status\":\"1\"}', 'http://127.0.0.1:8000/api/category/inserMiningCategory', '127.0.0.1', '2024-06-04 05:38:49', '2024-06-04 05:38:49'),
(553, 1, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'GET', '{\"page\":\"1\",\"pageSize\":\"10\",\"searchQuery\":null,\"selectedFilter\":\"1\"}', 'http://127.0.0.1:8000/api/category/allMiningCategoryes?page=1&pageSize=10&searchQuery=&selectedFilter=1', '127.0.0.1', '2024-06-04 05:38:50', '2024-06-04 05:38:50'),
(554, 1, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'GET', '[]', 'http://127.0.0.1:8000/api/category/minningCategoryrow/6', '127.0.0.1', '2024-06-04 05:39:20', '2024-06-04 05:39:20'),
(555, 1, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'POST', '[]', 'http://127.0.0.1:8000/api/auth/me', '127.0.0.1', '2024-06-04 05:40:44', '2024-06-04 05:40:44'),
(556, 1, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'GET', '{\"page\":\"1\",\"pageSize\":\"10\",\"searchQuery\":null,\"selectedFilter\":\"1\"}', 'http://127.0.0.1:8000/api/user/allUsers?page=1&pageSize=10&searchQuery=&selectedFilter=1', '127.0.0.1', '2024-06-04 05:40:57', '2024-06-04 05:40:57'),
(557, 1, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'GET', '{\"page\":\"1\",\"pageSize\":\"10\",\"searchQuery\":null,\"selectedFilter\":\"1\"}', 'http://127.0.0.1:8000/api/user/allSuperAdmin?page=1&pageSize=10&searchQuery=&selectedFilter=1', '127.0.0.1', '2024-06-04 05:43:11', '2024-06-04 05:43:11'),
(558, 1, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'GET', '{\"page\":\"1\",\"pageSize\":\"10\",\"searchQuery\":null,\"selectedFilter\":\"1\"}', 'http://127.0.0.1:8000/api/user/allUsers?page=1&pageSize=10&searchQuery=&selectedFilter=1', '127.0.0.1', '2024-06-04 05:43:15', '2024-06-04 05:43:15'),
(559, 1, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'GET', '{\"page\":\"1\",\"pageSize\":\"10\",\"searchQuery\":null,\"selectedFilter\":\"1\"}', 'http://127.0.0.1:8000/api/user/allUsers?page=1&pageSize=10&searchQuery=&selectedFilter=1', '127.0.0.1', '2024-06-04 05:43:52', '2024-06-04 05:43:52'),
(560, 1, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'GET', '{\"page\":\"1\",\"pageSize\":\"10\",\"searchQuery\":null,\"selectedFilter\":\"1\"}', 'http://127.0.0.1:8000/api/category/allMiningCategoryes?page=1&pageSize=10&searchQuery=&selectedFilter=1', '127.0.0.1', '2024-06-04 06:49:11', '2024-06-04 06:49:11'),
(561, 1, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'GET', '[]', 'http://127.0.0.1:8000/api/category/minningCategoryrow/6', '127.0.0.1', '2024-06-04 06:49:13', '2024-06-04 06:49:13'),
(562, 1, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'GET', '{\"page\":\"1\",\"pageSize\":\"10\",\"searchQuery\":null,\"selectedFilter\":\"1\"}', 'http://127.0.0.1:8000/api/category/allMiningCategoryes?page=1&pageSize=10&searchQuery=&selectedFilter=1', '127.0.0.1', '2024-06-04 06:49:25', '2024-06-04 06:49:25'),
(563, 1, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'GET', '{\"page\":\"1\",\"pageSize\":\"10\",\"searchQuery\":null,\"selectedFilter\":\"1\"}', 'http://127.0.0.1:8000/api/category/allMiningCategoryes?page=1&pageSize=10&searchQuery=&selectedFilter=1', '127.0.0.1', '2024-06-04 06:49:34', '2024-06-04 06:49:34'),
(564, 1, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'GET', '[]', 'http://127.0.0.1:8000/api/category/minningCategoryrow/6', '127.0.0.1', '2024-06-04 06:49:35', '2024-06-04 06:49:35'),
(565, 1, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'POST', '{\"id\":\"6\",\"name\":\"test\",\"minining_amount_per_secnd\":\"0.00001157\",\"second\":\"3600\",\"minute\":\"60\",\"duration_in_hour\":\"1\",\"offer_description\":\"dfdfsssssssssss\",\"daily_mining_amount\":\"1\",\"mining_value_mention_at_hour\":\"0.04166667\",\"status\":\"1\"}', 'http://127.0.0.1:8000/api/category/editMiningCategory', '127.0.0.1', '2024-06-04 06:49:57', '2024-06-04 06:49:57'),
(566, 1, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'GET', '{\"page\":\"1\",\"pageSize\":\"10\",\"searchQuery\":null,\"selectedFilter\":\"1\"}', 'http://127.0.0.1:8000/api/category/allMiningCategoryes?page=1&pageSize=10&searchQuery=&selectedFilter=1', '127.0.0.1', '2024-06-04 06:49:57', '2024-06-04 06:49:57'),
(567, 1, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'GET', '[]', 'http://127.0.0.1:8000/api/category/minningCategoryrow/6', '127.0.0.1', '2024-06-04 06:50:00', '2024-06-04 06:50:00'),
(568, 1, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'POST', '{\"id\":\"6\",\"name\":\"test\",\"minining_amount_per_secnd\":\"0.00003472\",\"second\":\"3600\",\"minute\":\"60\",\"duration_in_hour\":\"1\",\"offer_description\":\"dfdfsssssssssss\",\"daily_mining_amount\":\"3\",\"mining_value_mention_at_hour\":\"0.12500000\",\"status\":\"1\"}', 'http://127.0.0.1:8000/api/category/editMiningCategory', '127.0.0.1', '2024-06-04 06:50:05', '2024-06-04 06:50:05'),
(569, 1, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'GET', '{\"page\":\"1\",\"pageSize\":\"10\",\"searchQuery\":null,\"selectedFilter\":\"1\"}', 'http://127.0.0.1:8000/api/category/allMiningCategoryes?page=1&pageSize=10&searchQuery=&selectedFilter=1', '127.0.0.1', '2024-06-04 06:50:05', '2024-06-04 06:50:05'),
(570, 1, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'GET', '[]', 'http://127.0.0.1:8000/api/category/minningCategoryrow/6', '127.0.0.1', '2024-06-04 06:50:07', '2024-06-04 06:50:07'),
(571, 1, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'POST', '{\"id\":\"6\",\"name\":\"test\",\"minining_amount_per_secnd\":\"0.00003472\",\"second\":\"3600\",\"minute\":\"60\",\"duration_in_hour\":\"1\",\"offer_description\":\"dfdfsssssssssss\",\"daily_mining_amount\":\"3\",\"mining_value_mention_at_hour\":\"0.12500000\",\"status\":\"1\"}', 'http://127.0.0.1:8000/api/category/editMiningCategory', '127.0.0.1', '2024-06-04 06:50:18', '2024-06-04 06:50:18'),
(572, 1, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'GET', '{\"page\":\"1\",\"pageSize\":\"10\",\"searchQuery\":null,\"selectedFilter\":\"1\"}', 'http://127.0.0.1:8000/api/category/allMiningCategoryes?page=1&pageSize=10&searchQuery=&selectedFilter=1', '127.0.0.1', '2024-06-04 06:50:18', '2024-06-04 06:50:18'),
(573, 1, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'GET', '[]', 'http://127.0.0.1:8000/api/category/minningCategoryrow/6', '127.0.0.1', '2024-06-04 06:50:20', '2024-06-04 06:50:20'),
(574, 1, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'POST', '{\"id\":\"6\",\"name\":\"test\",\"minining_amount_per_secnd\":\"0.00003472\",\"second\":\"3600\",\"minute\":\"60\",\"duration_in_hour\":\"1\",\"offer_description\":\"dfdfsssssssssss\",\"daily_mining_amount\":\"3\",\"mining_value_mention_at_hour\":\"0.12500000\",\"status\":\"1\"}', 'http://127.0.0.1:8000/api/category/editMiningCategory', '127.0.0.1', '2024-06-04 06:53:03', '2024-06-04 06:53:03'),
(575, 1, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'GET', '{\"page\":\"1\",\"pageSize\":\"10\",\"searchQuery\":null,\"selectedFilter\":\"1\"}', 'http://127.0.0.1:8000/api/category/allMiningCategoryes?page=1&pageSize=10&searchQuery=&selectedFilter=1', '127.0.0.1', '2024-06-04 06:53:04', '2024-06-04 06:53:04'),
(576, 1, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'GET', '[]', 'http://127.0.0.1:8000/api/category/minningCategoryrow/6', '127.0.0.1', '2024-06-04 06:53:06', '2024-06-04 06:53:06'),
(577, 1, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'POST', '{\"id\":\"6\",\"name\":\"test\",\"minining_amount_per_secnd\":\"0.00005787\",\"second\":\"3600\",\"minute\":\"60\",\"duration_in_hour\":\"1\",\"offer_description\":\"dfdfsssssssssss\",\"daily_mining_amount\":\"5\",\"mining_value_mention_at_hour\":\"0.20833333\",\"status\":\"1\"}', 'http://127.0.0.1:8000/api/category/editMiningCategory', '127.0.0.1', '2024-06-04 06:53:25', '2024-06-04 06:53:25'),
(578, 1, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'GET', '{\"page\":\"1\",\"pageSize\":\"10\",\"searchQuery\":null,\"selectedFilter\":\"1\"}', 'http://127.0.0.1:8000/api/category/allMiningCategoryes?page=1&pageSize=10&searchQuery=&selectedFilter=1', '127.0.0.1', '2024-06-04 06:53:26', '2024-06-04 06:53:26'),
(579, 1, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'GET', '[]', 'http://127.0.0.1:8000/api/category/minningCategoryrow/6', '127.0.0.1', '2024-06-04 06:53:39', '2024-06-04 06:53:39'),
(580, 1, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'GET', '{\"page\":\"1\",\"pageSize\":\"10\",\"searchQuery\":null,\"selectedFilter\":\"1\"}', 'http://127.0.0.1:8000/api/category/allMiningCategoryes?page=1&pageSize=10&searchQuery=&selectedFilter=1', '127.0.0.1', '2024-06-04 06:53:58', '2024-06-04 06:53:58'),
(581, 1, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'GET', '{\"page\":\"1\",\"pageSize\":\"10\",\"searchQuery\":null,\"selectedFilter\":\"1\"}', 'http://127.0.0.1:8000/api/category/allMiningCategoryes?page=1&pageSize=10&searchQuery=&selectedFilter=1', '127.0.0.1', '2024-06-04 06:54:18', '2024-06-04 06:54:18'),
(582, 1, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'GET', '[]', 'http://127.0.0.1:8000/api/category/minningCategoryrow/6', '127.0.0.1', '2024-06-04 06:54:21', '2024-06-04 06:54:21'),
(583, 1, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'POST', '{\"id\":\"6\",\"name\":\"test\",\"minining_amount_per_secnd\":\"0.00006944\",\"second\":\"3600\",\"minute\":\"60\",\"duration_in_hour\":\"1\",\"offer_description\":\"dfdfsssssssssss\",\"daily_mining_amount\":\"6\",\"mining_value_mention_at_hour\":\"0.25000000\",\"status\":\"1\"}', 'http://127.0.0.1:8000/api/category/editMiningCategory', '127.0.0.1', '2024-06-04 06:54:28', '2024-06-04 06:54:28');
INSERT INTO `logs` (`id`, `user_id`, `user_agent`, `method`, `full_request`, `url`, `ip`, `created_at`, `updated_at`) VALUES
(584, 1, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'GET', '{\"page\":\"1\",\"pageSize\":\"10\",\"searchQuery\":null,\"selectedFilter\":\"1\"}', 'http://127.0.0.1:8000/api/category/allMiningCategoryes?page=1&pageSize=10&searchQuery=&selectedFilter=1', '127.0.0.1', '2024-06-04 06:54:29', '2024-06-04 06:54:29'),
(585, 1, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'GET', '[]', 'http://127.0.0.1:8000/api/category/minningCategoryrow/6', '127.0.0.1', '2024-06-04 06:54:36', '2024-06-04 06:54:36'),
(586, 1, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'POST', '{\"id\":\"6\",\"name\":\"test\",\"minining_amount_per_secnd\":\"0.00008102\",\"second\":\"3600\",\"minute\":\"60\",\"duration_in_hour\":\"1\",\"offer_description\":\"dfdfsssssssssss\",\"daily_mining_amount\":\"7\",\"mining_value_mention_at_hour\":\"0.29166667\",\"status\":\"1\"}', 'http://127.0.0.1:8000/api/category/editMiningCategory', '127.0.0.1', '2024-06-04 06:55:03', '2024-06-04 06:55:03'),
(587, 1, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'GET', '{\"page\":\"1\",\"pageSize\":\"10\",\"searchQuery\":null,\"selectedFilter\":\"1\"}', 'http://127.0.0.1:8000/api/category/allMiningCategoryes?page=1&pageSize=10&searchQuery=&selectedFilter=1', '127.0.0.1', '2024-06-04 06:55:04', '2024-06-04 06:55:04'),
(588, 1, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'GET', '{\"page\":\"1\",\"pageSize\":\"10\",\"searchQuery\":null,\"selectedFilter\":\"1\"}', 'http://127.0.0.1:8000/api/category/allMiningCategoryes?page=1&pageSize=10&searchQuery=&selectedFilter=1', '127.0.0.1', '2024-06-04 06:55:11', '2024-06-04 06:55:11'),
(589, 1, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'GET', '[]', 'http://127.0.0.1:8000/api/category/minningCategoryrow/6', '127.0.0.1', '2024-06-04 06:55:15', '2024-06-04 06:55:15'),
(590, 1, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'POST', '{\"id\":\"6\",\"name\":\"test\",\"minining_amount_per_secnd\":\"0.00002315\",\"second\":\"3600\",\"minute\":\"60\",\"duration_in_hour\":\"1\",\"offer_description\":\"dfdfsssssssssss\",\"daily_mining_amount\":\"2\",\"mining_value_mention_at_hour\":\"0.08333333\",\"status\":\"1\"}', 'http://127.0.0.1:8000/api/category/editMiningCategory', '127.0.0.1', '2024-06-04 06:55:21', '2024-06-04 06:55:21'),
(591, 1, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'GET', '{\"page\":\"1\",\"pageSize\":\"10\",\"searchQuery\":null,\"selectedFilter\":\"1\"}', 'http://127.0.0.1:8000/api/category/allMiningCategoryes?page=1&pageSize=10&searchQuery=&selectedFilter=1', '127.0.0.1', '2024-06-04 06:55:21', '2024-06-04 06:55:21'),
(592, 1, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'GET', '[]', 'http://127.0.0.1:8000/api/category/minningCategoryrow/6', '127.0.0.1', '2024-06-04 06:55:23', '2024-06-04 06:55:23'),
(593, 1, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'GET', '{\"page\":\"1\",\"pageSize\":\"10\",\"searchQuery\":null,\"selectedFilter\":\"1\"}', 'http://127.0.0.1:8000/api/brands/allCouminitylist?page=1&pageSize=10&searchQuery=&selectedFilter=1', '127.0.0.1', '2024-06-04 06:57:08', '2024-06-04 06:57:08'),
(594, 1, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'GET', '{\"page\":\"1\",\"pageSize\":\"10\",\"searchQuery\":null,\"selectedFilter\":\"1\"}', 'http://127.0.0.1:8000/api/brands/allCouminitylist?page=1&pageSize=10&searchQuery=&selectedFilter=1', '127.0.0.1', '2024-06-04 07:03:10', '2024-06-04 07:03:10'),
(595, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'GET', '[]', 'http://127.0.0.1:8000/api/setting/settingrow', '127.0.0.1', '2024-06-04 07:11:02', '2024-06-04 07:11:02'),
(596, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'GET', '[]', 'http://127.0.0.1:8000/api/mining/checkMiningInfo', '127.0.0.1', '2024-06-04 07:11:02', '2024-06-04 07:11:02'),
(597, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'POST', '[]', 'http://127.0.0.1:8000/api/auth/me', '127.0.0.1', '2024-06-04 07:11:06', '2024-06-04 07:11:06'),
(598, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'GET', '[]', 'http://127.0.0.1:8000/api/setting/settingrow', '127.0.0.1', '2024-06-04 07:14:59', '2024-06-04 07:14:59'),
(599, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'GET', '[]', 'http://127.0.0.1:8000/api/mining/checkMiningInfo', '127.0.0.1', '2024-06-04 07:14:59', '2024-06-04 07:14:59'),
(600, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'POST', '[]', 'http://127.0.0.1:8000/api/auth/me', '127.0.0.1', '2024-06-04 07:15:03', '2024-06-04 07:15:03'),
(601, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'GET', '[]', 'http://127.0.0.1:8000/api/setting/settingrow', '127.0.0.1', '2024-06-04 07:16:30', '2024-06-04 07:16:30'),
(602, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'GET', '[]', 'http://127.0.0.1:8000/api/mining/checkMiningInfo', '127.0.0.1', '2024-06-04 07:16:30', '2024-06-04 07:16:30'),
(603, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'POST', '[]', 'http://127.0.0.1:8000/api/auth/me', '127.0.0.1', '2024-06-04 07:16:33', '2024-06-04 07:16:33'),
(604, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'GET', '[]', 'http://127.0.0.1:8000/api/setting/settingrow', '127.0.0.1', '2024-06-04 07:17:51', '2024-06-04 07:17:51'),
(605, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'GET', '[]', 'http://127.0.0.1:8000/api/mining/checkMiningInfo', '127.0.0.1', '2024-06-04 07:17:52', '2024-06-04 07:17:52'),
(606, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'POST', '[]', 'http://127.0.0.1:8000/api/auth/me', '127.0.0.1', '2024-06-04 07:17:55', '2024-06-04 07:17:55'),
(607, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'GET', '[]', 'http://127.0.0.1:8000', '127.0.0.1', '2024-06-04 07:17:55', '2024-06-04 07:17:55'),
(608, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'GET', '[]', 'http://127.0.0.1:8000', '127.0.0.1', '2024-06-04 07:18:36', '2024-06-04 07:18:36');

-- --------------------------------------------------------

--
-- Table structure for table `manual_adjustment`
--

CREATE TABLE `manual_adjustment` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `adjustment_type` int(11) DEFAULT NULL COMMENT '1=The effective amount is manually increased\r\n2=The effective amount is manually reduced',
  `adjustment_amount` int(11) DEFAULT NULL,
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
(1, 3, 'b@gmail.com', 'community-english', 'Bijon-123', '2024-06-05 20:19:48', '2024-06-05 20:19:48'),
(2, 2, 'r@gmail.com', 'community-english', 'replay 123', '2024-06-05 20:20:06', '2024-06-05 20:20:06'),
(3, 3, 'r@gmail.com', 'community-english', 'ee', '2024-06-05 20:31:18', '2024-06-05 20:31:18'),
(4, 3, 'b@gmail.com', 'community-english', 'yes sir i\'m okay please', '2024-06-05 21:02:01', '2024-06-05 21:02:01');

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
(1, 2, '2024-06-02 20:43:42', '2024-06-02 21:43:42', 1, 1, '127.0.0.1', '2024-06-02 20:43:42', '2024-06-02 20:43:42'),
(2, 2, '2024-06-02 21:17:34', '2024-06-02 22:17:34', 1, 2, '127.0.0.1', '2024-06-02 21:17:34', '2024-06-02 21:17:34'),
(3, 2, '2024-06-02 21:20:29', '2024-06-02 22:20:29', 1, 3, '127.0.0.1', '2024-06-02 21:20:29', '2024-06-02 21:20:29'),
(4, 2, '2024-06-02 21:21:12', '2024-06-02 22:21:12', 1, 4, '127.0.0.1', '2024-06-02 21:21:12', '2024-06-02 21:21:12'),
(5, 3, '2024-06-06 19:13:40', '2024-06-06 20:13:40', 1, 2, '127.0.0.1', '2024-06-06 19:13:40', '2024-06-06 19:13:40');

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

--
-- Dumping data for table `mining_service_buy_history`
--

INSERT INTO `mining_service_buy_history` (`id`, `user_id`, `mining_category_id`, `mining_category_duration_id`, `duration`, `service_price`, `start_date`, `end_date`, `status`, `created_at`, `updated_at`) VALUES
(1, 3, 1, 1, '30', 10, '2024-06-07', '2024-07-07', NULL, '2024-06-06 19:46:08', '2024-06-06 19:46:08');

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

INSERT INTO `posts` (`id`, `name`, `slug`, `description_short`, `description_full`, `question`, `answer`, `categoryId`, `entry_by`, `thumnail_img`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Announcement', 'announcement', '', '<h6 data-v-inspector=\"pages/partner/community/announcement.vue:34:37\">Online recharge:</h6><p data-v-inspector=\"pages/partner/community/announcement.vue:35:37\">Enter\n the amount - select the payment method - obtain the payment QR code and\n pay using the payment application - please pay within the specified \ntime (within 30 minutes) - payment is completed - wait for the system to\n automatically confirm. It is prohibited to reuse QR codes for payment, \nand a new payment code must be obtained for each recharge. </p><p></p>', '', '', 1, 1, '/backend/files/6sqrvTOFNMboJxByFYIS.png', 1, '2024-03-10 18:35:57', '2024-03-10 18:35:57'),
(2, 'Announcement', 'announcement', '', '<h6 data-v-inspector=\"pages/partner/community/announcement.vue:44:37\">Online recharge:</h6><p data-v-inspector=\"pages/partner/community/announcement.vue:45:37\">Enter\r\n the amount - select the payment method - obtain the payment QR code and\r\n pay using the payment application - please pay within the specified \r\ntime (within 30 minutes) - payment is completed - wait for the system to\r\n automatically confirm. It is prohibited to reuse QR codes for payment, \r\nand a new payment code must be obtained for each recharge. </p><p></p>', '', '', 1, 1, '/backend/files/eJxV8SezpYqrVmkmaQhG.png', 1, '2024-03-10 18:36:55', '2024-03-10 18:36:55'),
(3, 'Announcement', 'announcement', '', '<h6 data-v-inspector=\"pages/partner/community/announcement.vue:44:37\">Online recharge:</h6><p data-v-inspector=\"pages/partner/community/announcement.vue:45:37\">Enter\n the amount - select the payment method - obtain the payment QR code and\n pay using the payment application - please pay within the specified \ntime (within 30 minutes) - payment is completed - wait for the system to\n automatically confirm. It is prohibited to reuse QR codes for payment, \nand a new payment code must be obtained for each recharge. </p><p></p>', '', '', 1, 1, '/backend/files/2Tqp9iow8CQTavozWohf.png', 1, '2024-03-10 18:37:21', '2024-03-10 12:44:29'),
(4, 'Invite subordinares for a share of sales revenue', 'invite-subordinares-for-a-share-of-sales-revenue', '', '<p>Enter the amount - select the payment method - obtain the payment QR \r\ncode and pay using the payment application - please pay within the \r\nspecified time (within 30 minutes) - payment is completed - wait for the\r\n system to automatically confirm. It is prohibited to reuse QR codes for\r\n payment, and a new payment code must be obtained for each recharge. </p>', '', '', 2, 1, '/backend/files/e6fWlYGeLnDUSTIslwUg.png', 1, '2024-03-10 18:47:39', '2024-04-26 17:11:41'),
(6, 'What is internatinal dropshipping and how does it work?', 'what-is-internatinal-dropshipping-and-how-does-it-work-', '', '', 'What is internatinal dropshipping and how does it work?', 'internatinal dropshipping Products: This could refer to the top-selling products within a DS store. DS provides analytics and reporting tools that allow merchants to track their sales performance, including which products are selling the most. Merchants can use this information to optimize their product offerings, marketing strategies, and inventory management.', 3, 1, NULL, 1, '2024-03-10 18:58:05', '2024-03-10 18:58:05'),
(7, 'How much does it cost to open a store on  internatinal dropshipping?', 'how-much-does-it-cost-to-open-a-store-on-internatinal-dropshipping-', '', '', 'How much does it cost to open a store on  Dropshipping international?', 'It seems there might be some confusion. \"internatinal dropshipping\" isn\'t a platform or service that I\'m aware of. However, I assume you\'re referring to internatinal dropshipping, which is a popular e-commerce platform that allows businesses to create and manage online stores.', 3, 1, NULL, 1, '2024-03-10 18:58:54', '2024-03-10 18:58:54'),
(8, 'How much working capital does it take to open a store on internatinal dropshipping?', 'how-much-working-capital-does-it-take-to-open-a-store-on-internatinal-dropshipping-', '', '', 'How much working capital does it take to open a store on internatinal dropshipping?', 'Opening a store on internatinal dropshipping doesn\'t necessarily require a significant amount of working capital compared to starting a traditional brick-and-mortar store. However, the amount of working capital needed can vary depending on various factors such as:', 3, 1, NULL, 1, '2024-03-10 18:59:36', '2024-03-10 18:59:36'),
(9, 'Do I need to advertise my store, or find products?', 'do-i-need-to-advertise-my-store-or-find-products-', '', '', 'Do I need to advertise my store, or find products?', 'Both advertising your store and finding products are essential components of running a successful e-commerce business, including a store on internatinal dropshipping.', 3, 1, NULL, 1, '2024-03-10 19:00:14', '2024-03-10 19:00:14'),
(10, 'Team development bonus', 'team-development-bonus', '', '<p>Enter the amount - select the payment method - obtain the payment QR \r\ncode and pay using the payment application - please pay within the \r\nspecified time (within 30 minutes) - payment is completed - wait for the\r\n system to automatically confirm. It is prohibited to reuse QR codes for\r\n payment, and a new payment code must be obtained for each recharge. </p>', '', '', 2, 1, '/backend/files/sqJ38nLNcwhzuLkKRHR3.png', 1, '2024-03-10 18:47:39', '2024-04-26 17:14:22'),
(11, 'New members invitaion reward', 'new-members-invitaion-reward', '', '<p>New members invitaion reward<br></p>', '', '', 2, 1, '/backend/files/0D7dEwlPSNYlFaXyko27.png', 1, '2024-04-26 19:15:20', '2024-04-26 19:15:20'),
(12, 'New members invitaion reward', 'new-members-invitaion-reward', '', '<p>New members invitaion reward<br></p>', '', '', 2, 1, '/backend/files/zDeAQkIwiVSTr2jnnjZJ.png', 1, '2024-04-26 19:15:22', '2024-04-26 19:15:22'),
(13, 'Agency Team Weekly Sallary', 'agency-team-weekly-sallary', '', '<p>Agency Team Weekly Sallary<br></p>', '', '', 2, 1, '/backend/files/ML5M4mMjfp4ebculdjnC.png', 1, '2024-04-26 19:18:37', '2024-04-26 19:18:37'),
(14, 'Free store promotions', 'free-store-promotions', '', '<p>Free store promotions<br></p>', '', '', 2, 1, '/backend/files/NEW2LMZnKhMjCbaLi8rx.png', 1, '2024-04-26 19:21:56', '2024-04-26 19:21:56'),
(15, 'Seasonal promotion', 'seasonal-promotion', '', '<p>Seasonal promotion<br></p>', '', '', 2, 1, '/backend/files/dr1bWEisdCKq4JdYq3Sq.png', 1, '2024-04-26 19:22:56', '2024-04-26 19:22:56'),
(16, 'Reach team investment', 'reach-team-investment', '', 'Reach team investment', '', '', 2, 1, '/backend/files/6dgHRaylqoOJf3vhqOiH.png', 1, '2024-04-26 19:23:50', '2024-04-26 19:23:50');

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
  `update_by` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `setting`
--

INSERT INTO `setting` (`id`, `name`, `deposit_service_charge`, `convert_php_amt`, `withdraw_service_charge`, `withdraw_minimum_amount`, `withdraw_maximum_amount`, `minimum_trade_amount`, `minimum_deposit_amount`, `trade_fee`, `tel`, `email`, `address`, `whatsApp`, `emergency`, `photo`, `description`, `copyright`, `status`, `admin_photo`, `admin_name`, `admin_email`, `admin_phone`, `meta_keywords`, `meta_description`, `pphoto`, `bg_color`, `currency`, `openinig_balance_date`, `reffer_bonus`, `maximum_supply`, `total_supply`, `openinig_balance_comments`, `fblink`, `twitterlink`, `linkdinlink`, `instragramlink`, `store_policy`, `crypto_wallet_address`, `master_pass_acc_no`, `website`, `telegram`, `register_bonus`, `mininmum_deposit_amount`, `maximum_deposit_amount`, `minimum_withdrawal`, `maximum_withdrawal`, `level_1_bonus`, `level_2_bonus`, `level_3_bonus`, `daily_max_withdraw_request`, `withdrawal_free_amount`, `withdrawal_free_on_percentage`, `mimumun_transfer_amount_to_other_user`, `maximum_transfer_amount_to_other_user`, `transfer_fee_fixed_amount`, `traansfer_fee_on_percentage`, `update_by`, `created_at`, `updated_at`) VALUES
(1, 'UIC', 5, 64, 5, 20, 4000, 5, 10, 6, '+44245454545', 'uic@abcd.com', 'Addres', '00000055555', '+000000', 'pic/2tAjiUpJ0X8GziIrKJJJ.png', 'Business Description', 'Copyright © 2024 uic . All Rights Reserved', 1, 'pic/ZOdc8nsWAMY1YELkp9zH.jpg', 'admin', 'info@admin.com', '+44245454545', NULL, NULL, '', '#ffffff', '$', '2020-05-13', 5, '214748364722333', '2147483647343433', NULL, 'https://www.fiverr.com', 'https://www.facebook.com', 'https://web.whatsapp.com/', '#', '', 'TPpMvdKfhENfJqYZsDJQLgEopMRBy15jeU', '225588996633', 'http://winup360.com', '116898999999', 5, 55.00, 5.00, 5.00, 5.00, 3, 2, 1, 5.00, 5.00, 5.00, 5.00, 5.00, 5.00, 50.00, 2993, '2024-05-12 05:32:50', '2024-05-12 03:42:05');

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
-- Table structure for table `states`
--

CREATE TABLE `states` (
  `id` int(11) NOT NULL,
  `name` varchar(30) NOT NULL,
  `country_id` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `transaction_history`
--

CREATE TABLE `transaction_history` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `type` int(11) DEFAULT NULL COMMENT '1=deposit,2=withdraw,3=machine purchase ',
  `last_Id` int(11) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `amount` double(10,2) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `transaction_history`
--

INSERT INTO `transaction_history` (`id`, `user_id`, `type`, `last_Id`, `description`, `amount`, `created_at`, `updated_at`) VALUES
(1, 3, 1, 1, 'Deposit', 50.00, '2024-06-06 19:37:24', '2024-06-06 19:37:24'),
(2, 3, 3, 1, 'Mining Machine : [Start], Duration : 30', 10.00, '2024-06-06 19:46:08', '2024-06-06 19:46:08'),
(3, 3, 1, 2, 'Deposit', 60.00, '2024-06-06 20:00:03', '2024-06-06 20:00:03');

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

INSERT INTO `users` (`id`, `uic_id`, `uic_address`, `inviteCode`, `ref_id`, `employee_id`, `role_id`, `email`, `available_balance`, `level_commission`, `show_password`, `name`, `real_name`, `phone_number`, `image`, `doc_file`, `address`, `address_1`, `address_2`, `website`, `github`, `gender`, `date_of_birth`, `twitter`, `instagram`, `nationality_id`, `state_id`, `otp`, `facebook`, `wallet_balance`, `password`, `with_show_password`, `with_password`, `email_verified_at`, `telegram`, `whtsapp`, `othersway_connect`, `remember_token`, `entry_by`, `register_ip`, `lastlogin_ip`, `lastlogin_country`, `lastlogin_datetime`, `created_at`, `updated_at`, `status`, `logged_out`) VALUES
(1, NULL, NULL, '0000123', 0, 4, 1, 'dev1@mail.com', 1.00000000, 1, 'dev1@mail.com', 'Dev1', NULL, '0000123', '/backend/files/hZkagctUSINKsFU64UJr.png', NULL, 'Dhaka', '', '', 'http://localhost:3000/profile', 'http://localhost:3000/profile', '', '1982-01-30', 'http://localhost:3000/profile', 'http://localhost:3000/profile', 0, 0, NULL, 'http://localhost:3000/profile', NULL, '$2a$12$oT7dmrympiE1Y1tfnz8iIOYWGL1qLEtpB5LDmVAwVEhxZ6rPHLmJq', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '127.0.0.1', NULL, '2024-06-06 00:10:10', '2023-06-22 03:20:43', '2024-06-06 06:06:41', 1, NULL),
(2, NULL, NULL, '5726413', 1, NULL, 2, 'r@gmail.com', 1.00000000, 1, 'r@gmail.com', 'Rana', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '$2y$10$pvmqv7CHQ0Vn.oP8SNl0I.SOIxaI7eyuMTRuhb05bIsye7R35ZUwi', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '127.0.0.1', '127.0.0.1', NULL, '2024-06-06 02:03:10', '2024-05-25 12:16:12', '2024-06-06 06:10:32', 1, NULL),
(3, NULL, NULL, '9696955', 2, NULL, 2, 'b@gmail.com', 2.00000000, 2, 'b@gmail.com', 'Bijon', NULL, '019157288', NULL, NULL, '', NULL, NULL, '', '', NULL, NULL, 'twitter', '', NULL, NULL, NULL, 'facebook', NULL, '$2y$10$kuQtVcqh0wcKIQSjxRsFguFiuFVQlZz54F4AG1.bcvkS08daJtXCe', NULL, NULL, NULL, NULL, '0198899999', NULL, NULL, NULL, '127.0.0.1', '127.0.0.1', NULL, '2024-06-07 00:17:12', '2024-05-26 21:26:09', '2024-06-06 18:17:12', 1, NULL),
(4, NULL, NULL, '8454078', 3, NULL, 2, 'c@gmail.com', 3.00000000, NULL, 'c@gmail.com', 'c', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '$2y$10$fprDcwCveao7NImy8/p2JekUoTpZldCA7yGV4IgdnlNdtqqbbcVd6', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, '2024-05-30 01:07:34', '2024-05-30 01:07:34', 1, NULL),
(5, NULL, NULL, '55493952', 3, NULL, 2, 'cc@gmail.com', 3.00000000, NULL, 'cc@gmail.com', 'cc', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '$2y$10$Km6RIjTkfRnTawxKuhswveA0d9HEivpgvXbnVwHrcadB2YcXtuD1S', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, '2024-05-30 01:09:09', '2024-05-30 01:09:09', 1, NULL),
(6, NULL, NULL, '65711692', 5, NULL, 2, 'dd@gmail.com', 3.00000000, NULL, 'dd@gmail.com', 'dd', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '$2y$10$zrvWR2mgseg/CFgIAvx2G.nhGDA/2sjCU/KMhss9REYf23UFNBhFa', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, '2024-05-30 01:09:31', '2024-06-01 01:34:42', 0, NULL),
(7, NULL, NULL, NULL, NULL, NULL, 1, 'dev2@mail.com', NULL, NULL, 'dev2@mail.com', 'Dev2', NULL, '0123456789', NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '$2y$10$xBDoWf0Gn2pdlbKRVC10/Oqs6olgeJgxynlKrPIJgwMNs6C6cXhi.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL),
(8, NULL, NULL, NULL, NULL, NULL, 1, 'admin001@mail.com', NULL, NULL, 'Azp3xU2a', 'Admin001', NULL, '0123456789', NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '$2y$10$O90eHgvR08FK.hBVk1neTuZ9U2IWoagxsG8C2p/1UO5hrUQPFyFeG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL),
(9, NULL, NULL, '97438377', 6, NULL, 2, 'abc@gmail.com', 5.00000000, NULL, 'abc@gmail.com', 'abc', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '$2y$10$hFe7ERazIFNLtfcJQinO7eETIOFQEI00o489S8RzhKZXvP.CE8zJy', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, '2024-06-04 08:29:03', '2024-06-04 08:29:03', 1, NULL),
(10, 'UIC000000010', '1f8c311e54a4c440f488d99715421ad4', '108189888', 9, NULL, 2, 'a11@gmail.com', 5.00000000, NULL, 'a11@gmail.com', 'a11', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '$2y$10$6XK8PJYrE72s.Yts5uzFTuEpjY2pPewP2sYQgfX9dzODOOAKGz/Xy', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, '2024-06-04 08:30:18', '2024-06-04 08:30:18', 1, NULL),
(11, 'UIC000000011', 'e8455e425f290c5af7d56dee19a919fd', '118877868', 10, NULL, 2, 'k@gmail.com', 5.00000000, NULL, 'k@gmail.com', 'k', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '$2y$10$sxdOn18P9XMLzACPV3.yKuOLrk2BDBs48s9/yYKk9DoVgtrMvk0uC', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, '2024-06-04 08:31:27', '2024-06-04 08:31:27', 1, NULL),
(12, 'UIC000000012', 'd650a9e891be0bf75e1154c9bcdb907b', '127540561', 11, NULL, 2, 'cdd@gmail.com', 1.00000000, 1, 'cdd@gmail.com', 'cdd', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '$2y$10$IdG5IqIqc4fODcziBk80/eN4e9Ekx/Rfy2TBJJFSKGBbzZgsvej02', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, '2024-06-04 12:39:14', '2024-06-05 19:49:58', 1, NULL),
(13, 'UIC000000013', '480cedd0d996b9df05d2a99082b0d07f', '138322299', 12, NULL, 2, 'lakasdf@gmail.com', 5.00000000, NULL, '127540561', 'lakasdf', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '$2y$10$UhVQ716WMIJAxKqf7e6ScenQBpuMEYnIwDaJxH3kS/H3HZoqIqW5y', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, '2024-06-04 12:40:32', '2024-06-04 12:40:32', 1, NULL),
(14, 'UIC000000014', '871e97b1e71e0046ba008723b46b4642', '149450924', 12, NULL, 2, 'kamrulhas@gmail.com', 5.00000000, NULL, '127540561', 'kamrulhas', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '$2y$10$Z/CVLhROKbza5zGWLbzrGelbVxC907oQCeo4Rb5S9EqLXLf3jDXoG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, '2024-06-04 12:42:25', '2024-06-04 12:42:25', 1, NULL),
(15, 'UIC000000015', '6f21357f863ce24ce21c1a82f49a7d5d', '150939929', 9, NULL, 2, 'rana@gmail.com', 5.00000000, NULL, 'rana@gmail.com', 'rana', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '$2y$10$Scds8xUIhaHfCgkfZDO0TuMZRW.scsxIFbOLXLVDzKikbk4QNDCxW', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, '2024-06-04 12:44:53', '2024-06-04 12:44:53', 1, NULL),
(16, 'UIC000000016', '6b29ecaf275b8ca943e3b88c16d32656', '160496114', 9, NULL, 2, 'jant@gmail.com', 5.00000000, NULL, '97438377', 'jant', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '$2y$10$ZWEzi59kf5H0SEqI24ronejITe5KSxtQ1AqYydPVYV.9N0z.p.Pom', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, '2024-06-04 13:00:49', '2024-06-04 13:00:49', 1, NULL),
(17, 'UIC000000017', 'cefa5941b89f26355f93a8b788b1ede1', '171493823', 12, NULL, 2, 'jasns@gmail.com', 2.00000000, 2, '127540561', 'jasns', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '$2y$10$m0Z2IxZ8m7ZvslzTUFBlJ.jpVt73ZaC1FiH/CydPvtSDRI8jrlAdG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, '2024-06-04 13:19:09', '2024-06-05 19:49:58', 1, NULL),
(20, 'UIC000000020', '308a33ceb3b8af86a052fcead0f00393', '204936183', 17, NULL, 2, 'mdbijon@gmail.com', 3.00000000, 3, 'mdbijon@gmail.com', 'mdbijon', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '$2y$10$lFZIJTMzo2l6WKe.luRtM.1DJBJPyQbo1IG9O0N/ebtRtifPlU89C', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, '2024-06-04 13:41:33', '2024-06-05 19:49:58', 1, NULL),
(21, 'UIC000000021', 'ecf7690e0d7d0a62ac7c4d8b87ed9656', '216998113', 20, NULL, 2, 'test@gmail.com', 5.00000000, NULL, 'test@gmail.com', 'test', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '$2y$10$17hPBRBT7Mk6SqX7v6p1S.y51UQhJHSwYsWiN6.q60GhKcZmpy9Ha', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, '2024-06-05 19:49:58', '2024-06-05 19:49:58', 0, NULL),
(22, 'UIC000000022', 'bbaa200546e0f709cc3057d658eea32b', '223742843', 3, NULL, 2, 'ahmed@gmail.com', 5.00000000, NULL, 'ahmed@gmail.com', 'ahmed', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '$2y$10$4Y.L80A6L59jCSM74VrjnOq7RrGoYX5XU45JzVh7toeHIbUZabERm', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, '2024-06-06 06:02:22', '2024-06-06 06:02:22', 1, NULL),
(23, 'UIC000000023', '83ee59fa5c84fcb505c0f08a510554e3', '230020229', 3, NULL, 2, 'ayesha@gmail.com', 3.00000000, 3, 'ayesha@gmail.com', 'ayesha', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '$2y$10$i2vvydDWzaPO0LxAHItfiO77GHplvucOEam1KLAlh3elLwlKHQQqC', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '127.0.0.1', '127.0.0.1', NULL, '2024-06-06 12:09:42', '2024-06-06 06:06:42', '2024-06-06 06:10:32', 1, NULL),
(24, 'UIC000000024', 'd1facb1fea58c28f7791d486baee8085', '242115953', 23, NULL, 2, 'fahim@gmail.com', 5.00000000, NULL, 'fahim@gmail.com', 'fahim', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '$2y$10$mvX7Hm3963zjpvzS8IV/8uFdQLOY38WhDMJK5hA2uKegr/WvKAM4i', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, '2024-06-06 06:10:11', '2024-06-06 06:10:11', 0, NULL),
(25, 'UIC000000025', '36d1bfa4f4bc2b3f6d786aa676a9476a', '252327294', 23, NULL, 2, 'anim@gmail.com', 5.00000000, NULL, 'anim@gmail.com', 'anim', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '$2y$10$sJ/uM0kU4Bvq6eUFw3c3e.IH1an.qW0A1ZuklCN.hUeY9OJsACmkO', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, '2024-06-06 06:10:32', '2024-06-06 06:10:32', 0, NULL);

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

--
-- Dumping data for table `verifyemail`
--

INSERT INTO `verifyemail` (`id`, `email`, `code`, `status`, `created_at`, `updated_at`) VALUES
(1, 'mdbijon@gmail.com', '7348', 1, '2024-04-19 14:50:58', '2024-04-19 14:52:37'),
(2, 'mdbijon@yahoo.com', '2626', 1, '2024-04-19 14:58:17', '2024-04-19 14:58:49'),
(3, 'fawadshakir9696@gmail.com', '1068', 0, '2024-04-19 15:15:17', '2024-04-19 15:15:17'),
(4, 'fawadshakir7873@gmail.com', '8639', 0, '2024-04-19 15:17:17', '2024-04-19 15:17:17'),
(5, 'lainaearn@gmail.com', '9769', 0, '2024-04-19 15:32:01', '2024-04-19 15:32:01'),
(6, 'kashiwasim121@gmail.com', '9755', 0, '2024-04-19 15:51:34', '2024-04-19 15:51:34'),
(7, 'shahazzeemtanoli@gmail.com', '8867', 0, '2024-04-19 15:52:37', '2024-04-19 15:52:37'),
(8, 'goharcustomerservices@gmail.com', '2334', 0, '2024-04-19 16:08:51', '2024-04-19 16:08:51'),
(9, 'd6428021@gmail.com', '4102', 0, '2024-04-19 16:28:51', '2024-04-19 16:28:51'),
(10, 'dsinternational982@gmail.com', '7544', 0, '2024-04-19 20:26:08', '2024-04-19 20:26:08'),
(11, 'd48447625@gmail.com', '1951', 0, '2024-04-19 20:31:39', '2024-04-19 20:31:39'),
(12, 'rkimrankhan65@gmail.com', '3057', 0, '2024-04-20 04:05:18', '2024-04-20 04:05:18');

-- --------------------------------------------------------

--
-- Table structure for table `withdraw`
--

CREATE TABLE `withdraw` (
  `id` int(11) NOT NULL,
  `withdrawID` varchar(255) DEFAULT NULL,
  `depscription` text DEFAULT NULL,
  `transection_fee` int(11) NOT NULL COMMENT '%',
  `user_id` int(11) DEFAULT NULL,
  `payable_amount` double(10,2) DEFAULT NULL COMMENT 'After 5% deduction amount',
  `withdraw_amount` double(10,2) DEFAULT NULL,
  `receivable_amount` int(11) DEFAULT NULL COMMENT 'no need this column',
  `remarks` text DEFAULT NULL,
  `withdrawal_method_id` int(11) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `approved_by` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL COMMENT ' 	0=Review,2=Reject,1=Approved 	',
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `withdrawal_method`
--

CREATE TABLE `withdrawal_method` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `currency_type_id` int(11) DEFAULT NULL,
  `wallet_address` varchar(255) DEFAULT NULL,
  `remarks` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
-- Indexes for table `states`
--
ALTER TABLE `states`
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
  ADD UNIQUE KEY `email` (`email`);

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
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_id` (`user_id`);

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `expense_history`
--
ALTER TABLE `expense_history`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT for table `logs`
--
ALTER TABLE `logs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=609;

--
-- AUTO_INCREMENT for table `manual_adjustment`
--
ALTER TABLE `manual_adjustment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `messages`
--
ALTER TABLE `messages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `mining_service_buy_history`
--
ALTER TABLE `mining_service_buy_history`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `post_category`
--
ALTER TABLE `post_category`
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
-- AUTO_INCREMENT for table `states`
--
ALTER TABLE `states`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `transaction_history`
--
ALTER TABLE `transaction_history`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `transfer`
--
ALTER TABLE `transfer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `verifyemail`
--
ALTER TABLE `verifyemail`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `withdraw`
--
ALTER TABLE `withdraw`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `withdrawal_method`
--
ALTER TABLE `withdrawal_method`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
