-- phpMyAdmin SQL Dump
-- version 4.8.0.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: May 06, 2018 at 10:21 PM
-- Server version: 5.7.19
-- PHP Version: 7.2.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ttt`
--

-- --------------------------------------------------------

--
-- Table structure for table `brute_forces`
--

CREATE TABLE `brute_forces` (
  `id` int(10) UNSIGNED NOT NULL,
  `ip` varchar(70) NOT NULL,
  `times` tinyint(5) UNSIGNED NOT NULL DEFAULT '1',
  `whenin` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `countries`
--

CREATE TABLE `countries` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(60) NOT NULL,
  `iso_code` varchar(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `countries`
--

INSERT INTO `countries` (`id`, `name`, `iso_code`) VALUES
(1, 'Afghanistan', 'AFG'),
(2, 'Åland Islands', 'ALA'),
(3, 'Albania', 'ALB'),
(4, 'Algeria', 'DZA'),
(5, 'American Samoa', 'ASM'),
(6, 'Andorra', 'AND'),
(7, 'Angola', 'AGO'),
(8, 'Anguilla', 'AIA'),
(9, 'Antarctica', 'ATA'),
(10, 'Antigua and Barbuda', 'ATG'),
(11, 'Argentina', 'ARG'),
(12, 'Armenia', 'ARM'),
(13, 'Aruba', 'ABW'),
(14, 'Australia', 'AUS'),
(15, 'Austria', 'AUT'),
(16, 'Azerbaijan', 'AZE'),
(17, 'Bahamas', 'BHS'),
(18, 'Bahrain', 'BHR'),
(19, 'Bangladesh', 'BGD'),
(20, 'Barbados', 'BRB'),
(21, 'Belarus', 'BLR'),
(22, 'Belgium', 'BEL'),
(23, 'Belize', 'BLZ'),
(24, 'Benin', 'BEN'),
(25, 'Bermuda', 'BMU'),
(26, 'Bhutan', 'BTN'),
(27, 'Bolivia', 'BOL'),
(28, 'Bonaire, Saint Eustatius And Saba', 'BES'),
(29, 'Bosnia and Herzegovina', 'BIH'),
(30, 'Botswana', 'BWA'),
(31, 'Bouvet Island', 'BVT'),
(32, 'Brazil', 'BRA'),
(33, 'British Indian Ocean Territory', 'IOT'),
(34, 'Brunei', 'BRN'),
(35, 'Bulgaria', 'BGR'),
(36, 'Burkina Faso', 'BFA'),
(37, 'Burundi', 'BDI'),
(38, 'Cabo Verde', 'CPV'),
(39, 'Cambodia', 'KHM'),
(40, 'Cameroon', 'CMR'),
(41, 'Canada', 'CAN'),
(42, 'Cayman Islands', 'CYM'),
(43, 'Central African Republic', 'CAF'),
(44, 'Chad', 'TCD'),
(45, 'Chile', 'CHL'),
(46, 'China', 'CHN'),
(47, 'Christmas Island', 'CXR'),
(48, 'Cocos (Keeling) Islands', 'CCK'),
(49, 'Colombia', 'COL'),
(50, 'Comoros', 'COM'),
(51, 'Congo', 'COG'),
(52, 'Cook Islands', 'COK'),
(53, 'Costa Rica', 'CRI'),
(54, 'Côte dIvoire', 'CIV'),
(55, 'Croatia', 'HRV'),
(56, 'Cuba', 'CUB'),
(57, 'Curaçao', 'CUW'),
(58, 'Cyprus', 'CYP'),
(59, 'Czech Republic', 'CZE'),
(60, 'Democratic Republic of the Congo', 'ZAR'),
(61, 'Denmark', 'DNK'),
(62, 'Djibouti', 'DJI'),
(63, 'Dominica', 'DMA'),
(64, 'Dominican Republic', 'DOM'),
(65, 'Ecuador', 'ECU'),
(66, 'Egypt', 'EGY'),
(67, 'El Salvador', 'SLV'),
(68, 'Equatorial Guinea', 'GNQ'),
(69, 'Eritrea', 'ERI'),
(70, 'Estonia', 'EST'),
(71, 'Ethiopia', 'ETH'),
(72, 'European Union', 'EUR'),
(73, 'Falkland Islands (Malvinas)', 'FLK'),
(74, 'Faroe Islands', 'FRO'),
(75, 'Fiji', 'FJI'),
(76, 'Finland', 'FIN'),
(77, 'France', 'FRA'),
(78, 'French Guiana', 'GUF'),
(79, 'French Polynesia', 'PYF'),
(80, 'French Southern and Antarctic Lands', 'ATF'),
(81, 'Gabon', 'GAB'),
(82, 'Georgia', 'GEO'),
(83, 'Germany', 'DEU'),
(84, 'Ghana', 'GHA'),
(85, 'Gibraltar', 'GIB'),
(86, 'Greece', 'GRC'),
(87, 'Greenland', 'GRL'),
(88, 'Grenada', 'GRD'),
(89, 'Guadeloupe', 'GLP'),
(90, 'Guam', 'GUM'),
(91, 'Guatemala', 'GTM'),
(92, 'Guernsey', 'GGY'),
(93, 'Guinea', 'GIN'),
(94, 'Guinea-Bissau', 'GNB'),
(95, 'Guyana', 'GUY'),
(96, 'Haiti', 'HTI'),
(97, 'Heard Island And McDonald Islands', 'HMD'),
(98, 'Honduras', 'HND'),
(99, 'Hong Kong', 'HKG'),
(100, 'Hungary', 'HUN'),
(101, 'Iceland', 'ISL'),
(102, 'India', 'IND'),
(103, 'Indonesia', 'IDN'),
(104, 'Iran', 'IRN'),
(105, 'Iraq', 'IRQ'),
(106, 'Ireland', 'IRL'),
(107, 'Isle of Man', 'IMN'),
(108, 'Israel', 'ISR'),
(109, 'Italy', 'ITA'),
(110, 'Jamaica', 'JAM'),
(111, 'Japan', 'JPN'),
(112, 'Jersey', 'JEY'),
(113, 'Jordan', 'JOR'),
(114, 'Kazakhstan', 'KAZ'),
(115, 'Kenya', 'KEN'),
(116, 'Kiribati', 'KIR'),
(117, 'Kuwait', 'KWT'),
(118, 'Kyrgyzstan', 'KGZ'),
(119, 'Laos', 'LAO'),
(120, 'Latvia', 'LVA'),
(121, 'Lebanon', 'LBN'),
(122, 'Lesotho', 'LSO'),
(123, 'Liberia', 'LBR'),
(124, 'Libya', 'LBY'),
(125, 'Liechtenstein', 'LIE'),
(126, 'Lithuania', 'LTU'),
(127, 'Luxembourg', 'LUX'),
(128, 'Macao', 'MAC'),
(129, 'Macedonia', 'MKD'),
(130, 'Madagascar', 'MDG'),
(131, 'Malawi', 'MWI'),
(132, 'Malaysia', 'MYS'),
(133, 'Maldives', 'MDV'),
(134, 'Mali', 'MLI'),
(135, 'Malta', 'MLT'),
(136, 'Marshall Islands', 'MHL'),
(137, 'Martinique', 'MTQ'),
(138, 'Mauritania', 'MRT'),
(139, 'Mauritius', 'MUS'),
(140, 'Mayotte', 'MYT'),
(141, 'Mexico', 'MEX'),
(142, 'Micronesia', 'FSM'),
(143, 'Moldova', 'MDA'),
(144, 'Monaco', 'MCO'),
(145, 'Mongolia', 'MNG'),
(146, 'Montenegro', 'MNE'),
(147, 'Montserrat', 'MSR'),
(148, 'Morocco', 'MAR'),
(149, 'Mozambique', 'MOZ'),
(150, 'Myanmar', 'MMR'),
(151, 'Namibia', 'NAM'),
(152, 'Nauru', 'NRU'),
(153, 'Nepal', 'NPL'),
(154, 'Netherlands', 'NLD'),
(155, 'New Caledonia', 'NCL'),
(156, 'New Zealand', 'NZL'),
(157, 'Nicaragua', 'NIC'),
(158, 'Niger', 'NER'),
(159, 'Nigeria', 'NGA'),
(160, 'Niue', 'NIU'),
(161, 'Norfolk Island', 'NFK'),
(162, 'North Korea', 'PRK'),
(163, 'Northern Mariana Islands', 'MNP'),
(164, 'Norway', 'NOR'),
(165, 'Oman', 'OMN'),
(166, 'Pakistan', 'PAK'),
(167, 'Palau', 'PLW'),
(168, 'Palestinian Territory, Occupied', 'PSE'),
(169, 'Panama', 'PAN'),
(170, 'Papua New Guinea', 'PNG'),
(171, 'Paraguay', 'PRY'),
(172, 'Peru', 'PER'),
(173, 'Philippines', 'PHL'),
(174, 'Pitcairn Islands', 'PCN'),
(175, 'Poland', 'POL'),
(176, 'Portugal', 'PRT'),
(177, 'Puerto Rico', 'PRI'),
(178, 'Qatar', 'QAT'),
(179, 'Réunion', 'REU'),
(180, 'Romania', 'ROU'),
(181, 'Russia', 'RUS'),
(182, 'Rwanda', 'RWA'),
(183, 'Saint Barthélemy', 'BLM'),
(184, 'Saint Helena, Ascension and Tristan da Cunha', 'SHN'),
(185, 'Saint Kitts and Nevis', 'KNA'),
(186, 'Saint Lucia', 'LCA'),
(187, 'Saint Martin', 'MAF'),
(188, 'Saint Pierre and Miquelon', 'SPM'),
(189, 'Saint Vincent and the Grenadines', 'VCT'),
(190, 'Samoa', 'WSM'),
(191, 'San Marino', 'SMR'),
(192, 'Sao Tome and Principe', 'STP'),
(193, 'Saudi Arabia', 'SAU'),
(194, 'Senegal', 'SEN'),
(195, 'Serbia', 'SRB'),
(196, 'Seychelles', 'SYC'),
(197, 'Sierra Leone', 'SLE'),
(198, 'Singapore', 'SGP'),
(199, 'Sint Maarten', 'SXM'),
(200, 'Slovakia', 'SVK'),
(201, 'Slovenia', 'SVN'),
(202, 'Solomon Islands', 'SLB'),
(203, 'Somalia', 'SOM'),
(204, 'South Africa', 'ZAF'),
(205, 'South Georgia and the South Sandwich Islands', 'SGS'),
(206, 'South Korea', 'KOR'),
(207, 'South Sudan', 'SSD'),
(208, 'Spain', 'ESP'),
(209, 'Sri Lanka', 'LKA'),
(210, 'Sudan', 'SDN'),
(211, 'Suriname', 'SUR'),
(212, 'Svalbard and Jan Mayen', 'SJM'),
(213, 'Swaziland', 'SWZ'),
(214, 'Sweden', 'SWE'),
(215, 'Switzerland', 'CHE'),
(216, 'Syria', 'SYR'),
(217, 'Taiwan', 'TWN'),
(218, 'Tajikistan', 'TJK'),
(219, 'Tanzania', 'TZA'),
(220, 'Thailand', 'THA'),
(221, 'The Gambia', 'GMB'),
(222, 'Timor-Leste', 'TLS'),
(223, 'Togo', 'TGO'),
(224, 'Tokelau', 'TKL'),
(225, 'Tonga', 'TON'),
(226, 'Trinidad and Tobago', 'TTO'),
(227, 'Tunisia', 'TUN'),
(228, 'Turkey', 'TUR'),
(229, 'Turkmenistan', 'TKM'),
(230, 'Turks and Caicos Islands', 'TCA'),
(231, 'Tuvalu', 'TUV'),
(232, 'Uganda', 'UGA'),
(233, 'Ukraine', 'UKR'),
(234, 'United Arab Emirates', 'ARE'),
(235, 'United Kingdom', 'GBR'),
(236, 'United States', 'USA'),
(237, 'United States Minor Outlying Islands', 'UMI'),
(238, 'United States Virgin Islands', 'VIR'),
(239, 'Uruguay', 'URY'),
(240, 'Uzbekistan', 'UZB'),
(241, 'Vanuatu', 'VUT'),
(242, 'Vatican City State', 'VAT'),
(243, 'Venezuela', 'VEN'),
(244, 'Viet Nam', 'VNM'),
(245, 'Virgin Islands', 'VGB'),
(246, 'Wallis and Futuna', 'WLF'),
(247, 'Western Sahara', 'ESH'),
(248, 'Yemen', 'YEM'),
(249, 'Zambia', 'ZMB'),
(250, 'Zimbabwe', 'ZWE');

-- --------------------------------------------------------

--
-- Table structure for table `faqs`
--

CREATE TABLE `faqs` (
  `id` int(10) UNSIGNED NOT NULL,
  `category_id` int(10) UNSIGNED NOT NULL,
  `question` varchar(255) NOT NULL,
  `answer` text NOT NULL,
  `style` varchar(30) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `faqs`
--

INSERT INTO `faqs` (`id`, `category_id`, `question`, `answer`, `style`, `created_at`, `updated_at`) VALUES
(1, 1, 'What is this bittorrent all about anyway? How do I get the files? ', 'Check out <a href=\"http://www.btfaq.com/\">Brian\'s BitTorrent FAQ and Guide</a>', NULL, '2018-01-28 13:13:17', '2018-01-28 13:13:17'),
(2, 2, 'I registered an account but did not receive the confirmation e-mail!', 'You can use <a href=\"account-delete.php\">this form</a> to delete the account so you can re-register.\r\nNote though that if you didn\'t receive the email the first time it will probably not\r\nsucceed the second time either so you should really try another email address.', NULL, '2018-01-28 13:20:16', '2018-01-28 13:20:16'),
(3, 2, 'Why is my port number reported as \"---\"? (And why should I care?)', 'The tracker has determined that you are firewalled or NATed and cannot accept incoming connections.\r\n<br />\r\n<br />\r\nThis means that other peers in the swarm will be unable to connect to you, only you to them. Even worse,\r\nif two peers are both in this state they will not be able to connect at all. This has obviously a\r\ndetrimental effect on the overall speed.\r\n<br />\r\n<br />\r\nThe way to solve the problem involves opening the ports used for incoming connections\r\n(the same range you defined in your client) on the firewall and/or configuring your\r\nNAT server to use a basic form of NAT\r\nfor that range instead of NAPT (the actual process differs widely between different router models.\r\nCheck your router documentation and/or support forum. You will also find lots of information on the\r\nsubject at <a href=\"http://portforward.com/\">PortForward</a>).', NULL, '2018-01-28 13:21:36', '2018-01-28 13:21:36'),
(4, 2, 'I\'ve lost my user name or password! Can you send it to me?', 'Please use <a href=\"account-recover.php\">this form</a> to have the login details mailed back to you.', NULL, '2018-01-28 13:22:40', '2018-01-28 13:22:40'),
(5, 2, 'Can you delete my account?', 'You cannot delete your own account, please ask a member of staff', NULL, '2018-01-28 13:23:12', '2018-01-28 13:23:12'),
(6, 2, 'So, what\'s MY ratio?', 'Click on your <a href=\"account.php\">profile</a>, then on your user name (at the top).<br />\r\n<br />\r\nIt\'s important to distinguish between your overall ratio and the individual ratio on each torrent\r\nyou may be seeding or leeching. The overall ratio takes into account the total uploaded and downloaded\r\nfrom your account since you joined the site. The individual ratio takes into account those values for each torrent.<br />\r\n<br />\r\nYou may see two symbols instead of a number: &quot;Inf.&quot;, which is just an abbreviation for Infinity, and\r\nmeans that you have downloaded 0 bytes while uploading a non-zero amount (ul/dl becomes infinity); &quot;---&quot;,\r\nwhich should be read as &quot;non-available&quot;, and shows up when you have both downloaded and uploaded 0 bytes\r\n(ul/dl = 0/0 which is an indeterminate amount).', NULL, '2018-01-28 13:23:51', '2018-01-28 13:23:51'),
(7, 2, 'Why is my IP displayed on my details page?', 'Only you and the site moderators can view your IP address and email. Regular users do not see that information.', NULL, '2018-01-28 13:24:27', '2018-01-28 13:24:27'),
(8, 2, 'Help! I cannot login!?', 'This problem sometimes occurs with MSIE. Close all Internet Explorer windows and open Internet Options in the control panel. Click the Delete Cookies button. You should now be able to login.', NULL, '2018-01-28 13:24:58', '2018-01-28 13:24:58'),
(9, 2, 'My IP address is dynamic. How do I stay logged in?', 'You do not have to anymore. All you have to do is make sure you are logged in with your actual IP when starting a torrent session. After that, even if the IP changes mid-session, the seeding or leeching will continue and the statistics will update without any problem.', NULL, '2018-01-28 13:25:43', '2018-01-28 13:25:43'),
(10, 3, 'Most common reason for stats not updating', '<ul>\r\n<li>The user is cheating. (a.k.a. &quot;Summary Ban&quot;)</li>\r\n<li>The server is overloaded and unresponsive. Just try to keep the session open until the server responds again. (Flooding the server with consecutive manual updates is not recommended.)</li>\r\n</ul>', NULL, '2018-01-28 15:32:50', '2018-01-28 15:32:50'),
(11, 3, 'How does NAT/ICS change the picture?', 'This is a very particular case in that all computers in the LAN will appear to the outside world as having the same IP. We must distinguish\r\nbetween two cases:<br />\r\n<br />\r\n<b>1.</b> <i>You are the single  user in the LAN</i><br />\r\n<br />\r\nYou should use the same account in all the computers.<br />\r\n<br />\r\nNote also that in the ICS case it is preferable to run the BT client on the ICS gateway. Clients running on the other computers\r\nwill be unconnectable (their ports will be listed as &quot;---&quot;, as explained elsewhere in the FAQ) unless you specify\r\nthe appropriate services in your ICS configuration (a good explanation of how to do this for Windows XP can be found\r\n<a href=\"http://www.microsoft.com/downloads/details.aspx?FamilyID=1dcff3ce-f50f-4a34-ae67-cac31ccd7bc9&amp;displaylang=en\">here</a>).\r\nIn the NAT case you should configure different ranges for clients on different computers and create appropriate NAT rules in the router. (Details vary widely from router to router and are outside the scope of this FAQ. Check your router documentation and/or support forum.)<br />\r\n<br />\r\n<br />\r\n<b>2.</b> <i>There are multiple users in the LAN</i><br />\r\n<br />\r\nAt present there is no way of making this setup always work properly.\r\nEach torrent will be associated with the user who last accessed the site from within\r\nthe LAN before the torrent was started.\r\nUnless there is cooperation between the users mixing of statistics is possible.\r\n(User A accesses the site, downloads a .torrent file, but does not start the torrent immediately.\r\nMeanwhile, user B accesses the site. User A then starts the torrent. The torrent will count\r\ntowards user B\'s statistics, not user A\'s.)\r\n<br />\r\n<br />\r\nIt is your LAN, the responsibility is yours. Do not ask us to ban other users\r\nwith the same IP, we will not do that. (Why should we ban <i>him</i> instead of <i>you</i>?)', NULL, '2018-01-28 15:33:40', '2018-01-28 15:33:40'),
(12, 3, 'Best practices', '<ul>\r\n<li>If a torrent you are currently leeching/seeding is not listed on your profile, just wait or force a manual update.</li>\r\n<li>Make sure you exit your client properly, so that the tracker receives &quot;event=completed&quot;.</li>\r\n<li>If the tracker is down, do not stop seeding. As long as the tracker is back up before you exit the client the stats should update properly.</li>\r\n</ul>', NULL, '2018-01-28 15:34:32', '2018-01-28 15:34:32'),
(13, 3, 'May I use any bittorrent client?', 'Yes. The tracker now updates the stats correctly for all bittorrent clients. However, we still recommend\r\nthat you <b>avoid</b> the following clients:<br />\r\n<br />\r\n\r\n<ul>\r\n<li>BitTorrent++</li>\r\n<li>Nova Torrent</li>\r\n<li>TorrentStorm</li>\r\n</ul>\r\n\r\n<br />\r\nThese clients do not report correctly to the tracker when canceling/finishing a torrent session.\r\nIf you use them then a few MB may not be counted towards\r\nthe stats near the end, and torrents may still be listed in your profile for some time after you have closed the client.<br />\r\n<br />\r\nAlso, clients in alpha or beta version should be avoided.', NULL, '2018-01-28 15:35:31', '2018-01-28 15:35:31'),
(14, 3, 'Why is a torrent I\'m leeching/seeding listed several times in my profile?', 'If for some reason (e.g. pc crash, or frozen client) your client exits improperly and you restart it, it will have a new peer_id, so it will show as a new torrent. The old one will never receive a \"event=completed\" or \"event=stopped\" and will be listed until some tracker timeout. Just ignore it, it will eventually go away.', NULL, '2018-01-28 15:36:16', '2018-01-28 15:36:16'),
(15, 3, 'I\'ve finished or cancelled a torrent. Why is it still listed in my profile?', 'Some clients, notably TorrentStorm and Nova Torrent, do not report properly to the tracker when canceling or finishing a torrent. In that case the tracker will keep waiting for some message - and thus listing the torrent as seeding or leeching - until some timeout occurs. Just ignore it, it will eventually go away.', NULL, '2018-01-28 15:36:43', '2018-01-28 15:36:43'),
(16, 3, 'Why do I sometimes see torrents I\'m not leeching in my profile!?', 'When a torrent is first started, the tracker uses the IP to identify the user. Therefore the torrent will become associated with the user who last accessed the site from that IP. If you share your IP in some way (you are behind NAT/ICS, or using a proxy), and some of the persons you share it with are also users, you may occasionally see their torrents listed in your profile. (If they start a torrent session from that IP and you were the last one to visit the site the torrent will be associated with you). Note that now torrents listed in your profile will always count towards your total stats.', NULL, '2018-01-28 15:37:14', '2018-01-28 15:37:14'),
(17, 4, 'Why can\'t I upload torrents?', 'Only specially authorized users (<font color=\"#4040c0\"><b>Uploaders</b></font>) have permission to upload torrents.', NULL, '2018-01-28 15:38:26', '2018-01-28 15:38:26'),
(18, 4, 'What criteria must I meet before I can join the <font color=\"#4040c0\">Uploader</font> team?', 'You must be able to provide releases that:<br />\r\n<ul>\r\n<li>include a proper NFO</li>\r\n<li>are genuine scene releases. If it\'s not on <a href=\"http://www.nforce.nl\">NFOrce</a> then forget it! (except music).</li>\r\n<li>are not older than seven (7) days.</li>\r\n<li>have all files in original format (usually 14.3 MB RARs)</li>\r\n<li>you\'ll be able to seed, or make sure are well-seeded, for at least 24 hours.</li>\r\n<li>you should have atleast 2MBit upload bandwith.</li>\r\n</ul>\r\n\r\n<br />\r\nIf you think you can match these criteria do not hesitate to <a href=\"staff.php\">contact</a> one of the administrators.<br />\r\n<b>Remember!</b> Write your application carefully! Be sure to include your UL speed and what kind of stuff you\'re planning to upload.<br />\r\nOnly well written letters with serious intent will be considered.', NULL, '2018-01-28 15:39:33', '2018-01-28 15:39:33'),
(19, 5, 'How do I use the files I\'ve downloaded?', 'Check out <a href=\"videoformats.php\">this guide</a>.', NULL, '2018-01-28 15:41:49', '2018-01-28 15:41:49'),
(20, 5, 'Downloaded a movie and don\'t know what CAM/TS/TC/SCR means?', 'Check out <a href=\"videoformats.php\">this guide.</a>', NULL, '2018-01-28 15:42:27', '2018-01-28 15:42:27'),
(21, 5, 'Why did an active torrent suddenly disappear?', 'There may be three reasons for this:<br />\r\n(<b>1</b>) The torrent may have been out-of-sync with the site\r\n<a href=\"rules.php\">rules</a>.<br />\r\n(<b>2</b>) The uploader may have deleted it because it was a bad release.\r\nA replacement will probably be uploaded to take its place.<br />\r\n(<b>3</b>) Torrents are automatically deleted after 28 days.', NULL, '2018-01-28 15:43:02', '2018-01-28 15:43:02'),
(22, 5, 'How do I resume a broken download or reseed something?', 'Open the .torrent file. When your client asks you for a location, choose the location of the existing file(s) and it will resume/reseed the torrent.', NULL, '2018-01-28 15:43:39', '2018-01-28 15:43:39'),
(23, 5, 'Why do my downloads sometimes stall at 99%?', 'The more pieces you have, the harder it becomes to find peers who have pieces you are missing. That is why downloads sometimes slow down or even stall when there are just a few percent remaining. Just be patient and you will, sooner or later, get the remaining pieces.', NULL, '2018-01-28 15:44:06', '2018-01-28 15:44:06'),
(24, 5, 'What are these \"a piece has failed an hash check\" messages?', 'Bittorrent clients check the data they receive for integrity. When a piece fails this check it is\r\nautomatically re-downloaded. Occasional hash fails are a common occurrence, and you shouldn\'t worry.<br />\r\n<br />\r\nSome clients have an (advanced) option/preference to \'kick/ban clients that send you bad data\' or\r\nsimilar. It should be turned on, since it makes sure that if a peer repeatedly sends you pieces that\r\nfail the hash check it will be ignored in the future.', NULL, '2018-01-28 15:44:49', '2018-01-28 15:44:49'),
(25, 5, 'The torrent is supposed to be 100MB. How come I downloaded 120MB?', 'See the hash fails topic. If your client receives bad data it will have to redownload it, therefore the total downloaded may be larger than the torrent size. Make sure the \"kick/ban\" option is turned on to minimize the extra downloads.', NULL, '2018-01-28 15:45:22', '2018-01-28 15:45:22'),
(26, 5, 'Why do I get a \"Not authorized (xx h) - READ THE FAQ\" error?', 'From the time that each <b>new</b> torrent is uploaded to the tracker, there is a period of time that\r\nsome users must wait before they can download it.<br />\r\nThis delay in downloading will only affect users with a low ratio, and users with low upload amounts.<br />\r\n<br />\r\n<table class=\"table_table\" cellspacing=\"3\" cellpadding=\"5\" align=\"center\">\r\n <tr>\r\n    <td class=\"table_col1\"><b>Ratio below</b></td>\r\n    <td class=\"table_col2\" align=\"center\"><font color=\"#bb0000\">0.50</font></td>\r\n    <td class=\"table_col2\">and/or upload below</td>\r\n    <td class=\"table_col1\" align=\"center\">5.0GB</td>\r\n    <td class=\"table_col2\">delay of</td>\r\n    <td class=\"table_col1\" align=\"center\">48h</td>\r\n </tr>\r\n <tr>\r\n    <td class=\"table_col1\"><b>Ratio below</b></td>\r\n    <td class=\"table_col2\"><font color=\"#A10000\">0.65</font></td>\r\n    <td class=\"table_col1\">and/or upload below</td>\r\n    <td class=\"table_col2\">6.5GB</td>\r\n    <td class=\"table_col1\">delay of</td>\r\n    <td class=\"table_col2\">24h</td>\r\n </tr>\r\n <tr>\r\n    <td class=\"table_col1\"><b>Ratio below</b></td>\r\n    <td class=\"table_col2\"><font color=\"#880000\">0.80</font></td>\r\n    <td class=\"table_col1\">and/or upload below</td>\r\n    <td class=\"table_col2\">8.0GB</td>\r\n    <td class=\"table_col1\">delay of</td>\r\n    <td class=\"table_col2\">12h</td>\r\n </tr>\r\n <tr>\r\n    <td class=\"table_col1\"><b>Ratio below</b></td>\r\n    <td class=\"table_col2\"><font color=\"#6E0000\">0.95</font></td>\r\n    <td class=\"table_col1\">and/or upload below</td>\r\n    <td class=\"table_col2\">9.5GB</td>\r\n    <td class=\"table_col1\">delay of</td>\r\n    <td class=\"table_col2\">06h</td>\r\n </tr>\r\n</table>\r\n<br />\r\n\"<b>And/or</b>\" means any or both. Your delay will be the <b>largest</b> one for which you meet <b>at least</b> one condition.<br />\r\n<br />\r\nThis applies to new users as well, so opening a new account will not help. Note also that this\r\nworks at tracker level, you will be able to grab the .torrent file itself at any time.<br />\r\n<br />\r\n<!--The delay applies only to leeching, not to seeding. If you got the files from any other source and\r\nwish to seed them you may do so at any time irrespectively of your ratio or total uploaded.<br />-->\r\nN.B. Due to some users exploiting the \'no-delay-for-seeders\' policy we had to change it. The delay\r\nnow applies to both seeding and leeching. So if you are subject to a delay and get the files from\r\nsome other source you will not be able to seed them until the delay has elapsed.', NULL, '2018-01-28 15:46:04', '2018-01-28 15:46:04'),
(27, 5, 'Why do I get a \"rejected by tracker - Port xxxx is blacklisted\" error?', 'Your client is reporting to the tracker that it uses one of the default bittorrent ports\r\n(6881-6889) or any other common p2p port for incoming connections.<br />\r\n<br />\r\nThis tracker does not allow clients to use ports commonly associated with p2p protocols.\r\nThe reason for this is that it is a common practice for ISPs to throttle those ports\r\n(that is, limit the bandwidth, hence the speed). <br />\r\n<br />\r\nThe blocked ports list include, but is not neccessarily limited to, the following:<br />\r\n<br />\r\n  <table border=\"0\" cellspacing=\"3\" cellpadding=\"5\" class=\"table_table\" align=\"center\">\r\n  <tr>\r\n    <td class=\"table_col1\"><b>Direct Connect</b></td>\r\n    <td class=\"table_col2\">411 - 413</td>\r\n  </tr>\r\n  <tr>\r\n    <td class=\"table_col1\"><b>Kazaa</b></td>\r\n    <td class=\"table_col2\">1214</td>\r\n  </tr>\r\n  <tr>\r\n    <td class=\"table_col1\"><b>eDonkey</b></td>\r\n    <td class=\"table_col2\">4662</td>\r\n  </tr>\r\n  <tr>\r\n    <td class=\"table_col1\"><b>Gnutella</b></td>\r\n    <td class=\"table_col2\">6346 - 6347</td>\r\n  </tr>\r\n  <tr>\r\n    <td class=\"table_col1\"><b>BitTorrent</b></td>\r\n    <td class=\"table_col2\">6881 - 6889</td>\r\n </tr>\r\n</table>\r\n<br />\r\nIn order to use use our tracker you must  configure your client to use\r\nany port range that does not contain those ports (a range within the region 49152 through 65535 is preferable,\r\ncf. <a href=\"http://www.iana.org/assignments/port-numbers\">IANA</a>). Notice that some clients,\r\nlike Azureus 2.0.7.0 or higher, use a single port for all torrents, while most others use one port per open torrent. The size\r\nof the range you choose should take this into account (typically less than 10 ports wide. There\r\nis no benefit whatsoever in choosing a wide range, and there are possible security implications). <br />\r\n<br />\r\nThese ports are used for connections between peers, not client to tracker.\r\nTherefore this change will not interfere with your ability to use other trackers (in fact it\r\nshould <i>increase</i> your speed with torrents from any tracker, not just ours). Your client\r\nwill also still be able to connect to peers that are using the standard ports.\r\nIf your client does not allow custom ports to be used, you will have to switch to one that does.<br />\r\n<br />\r\nDo not ask us, or in the forums, which ports you should choose. The more random the choice is the harder\r\nit will be for ISPs to catch on to us and start limiting speeds on the ports we use.\r\nIf we simply define another range ISPs will start throttling that range also. <br />\r\n<br />\r\nFinally, remember to forward the chosen ports in your router and/or open them in your\r\nfirewall, should you have them.', NULL, '2018-01-28 15:46:52', '2018-01-28 15:46:52'),
(28, 5, 'What\'s this \"IOError - [Errno13] Permission denied\" error?', 'If you just want to fix it reboot your computer, it should solve the problem.\r\nOtherwise read on.<br />\r\n<br />\r\nIOError means Input-Output Error, and that is a file system error, not a tracker one.\r\nIt shows up when your client is for some reason unable to open the partially downloaded\r\ntorrent files. The most common cause is two instances of the client to be running\r\nsimultaneously:\r\nthe last time the client was closed it somehow didn\'t really close but kept running in the\r\nbackground, and is therefore still\r\nlocking the files, making it impossible for the new instance to open them.<br />\r\n<br />\r\nA more uncommon occurrence is a corrupted FAT. A crash may result in corruption\r\nthat makes the partially downloaded files unreadable, and the error ensues. Running\r\nscandisk should solve the problem. (Note that this may happen only if you\'re running\r\nWindows 9x - which only support FAT - or NT/2000/XP with FAT formatted hard drives.\r\nNTFS is much more robust and should never permit this problem.)', NULL, '2018-01-28 15:47:52', '2018-01-28 15:47:52'),
(29, 5, 'What\'s this \"TTL\" in the browse page?', 'The torrent\'s Time To Live, in hours. It means the torrent will be deleted\r\nfrom the tracker after that many hours have elapsed (yes, even if it is still active).\r\nNote that this a maximum value, the torrent may be deleted at any time if it\'s inactive.', NULL, '2018-01-28 15:48:46', '2018-01-28 15:48:46'),
(30, 6, 'Do not immediately jump on new torrents', 'The download speed mostly depends on the seeder-to-leecher ratio (SLR). Poor download speed is\r\nmainly a problem with new and very popular torrents where the SLR is low.<br />\r\n<br />\r\n(Proselytising sidenote: make sure you remember that you did not enjoy the low speed.\r\n<b>Seed</b> so that others will not endure the same.)<br />\r\n<br />\r\nThere are a couple of things that you can try on your end to improve your speed:<br />\r\n<br />In particular, do not do it if you have a slow connection. The best speeds will be found around the\r\nhalf-life of a torrent, when the SLR will be at its highest. (The downside is that you will not be able to seed\r\nso much. It\'s up to you to balance the pros and cons of this.)', NULL, '2018-01-28 15:50:08', '2018-01-28 15:50:08'),
(31, 6, 'Limit your upload speed', 'The upload speed affects the download speed in essentially two ways:<br />\r\n<ul>\r\n    <li>Bittorrent peers tend to favour those other peers that upload to them. This means that if A and B\r\n    are leeching the same torrent and A is sending data to B at high speed then B will try to reciprocate.\r\n    So due to this effect high upload speeds lead to high download speeds.</li>\r\n\r\n    <li>Due to the way TCP works, when A is downloading something from B it has to keep telling B that\r\n        it received the data sent to him. (These are called acknowledgements - ACKs -, a sort of &quot;got it!&quot; messages).\r\n        If A fails to do this then B will stop sending data and wait. If A is uploading at full speed there may be no\r\n        bandwidth left for the ACKs and they will be delayed. So due to this effect excessively high upload speeds lead\r\n        to low download speeds.</li>\r\n</ul>\r\n\r\nThe full effect is a combination of the two. The upload should be kept as high as possible while allowing the\r\nACKs to get through without delay. <b>A good thumb rule is keeping the upload at about 80% of the theoretical\r\nupload speed.</b> You will have to fine tune yours to find out what works best for you. (Remember that keeping the\r\nupload high has the additional benefit of helping with your ratio.) <br />\r\n<br />\r\nIf you are running more than one instance of a client it is the overall upload speed that you must take into account.\r\nSome clients (e.g. Azureus) limit global upload speed, others (e.g. Shad0w\'s) do it on a per torrent basis.\r\nKnow your client. The same applies if you are using your connection for anything else (e.g. browsing or ftp),\r\nalways think of the overall upload speed.', NULL, '2018-01-28 15:54:56', '2018-01-28 15:54:56'),
(32, 6, 'Limit the number of simultaneous connections ', 'Some operating systems (like Windows 9x) do not deal well with a large number of connections, and may even crash. Also some home routers (particularly when running NAT and/or firewall with stateful inspection services) tend to become slow or crash when having to deal with too many connections. There are no fixed values for this, you may try 60 or 100 and experiment with the value. Note that these numbers are additive, if you have two instances of a client running the numbers add up. \r\n', NULL, '2018-01-28 15:55:32', '2018-01-28 15:55:32'),
(33, 6, 'Limit the number of simultaneous uploads', 'Isn\'t this the same as above? No. Connections limit the number of peers your client is talking to and/or downloading from. Uploads limit the number of peers your client is actually uploading to. The ideal number is typically much lower than the number of connections, and highly dependent on your (physical) connection.', NULL, '2018-01-28 15:56:02', '2018-01-28 15:56:02'),
(34, 6, 'Just give it some time', 'As explained above peers favour other peers that upload to them. When you start leeching a new torrent you have nothing to offer to other peers and they will tend to ignore you. This makes the starts slow, in particular if, by change, the peers you are connected to include few or no seeders. The download speed should increase as soon as you have some pieces to share.', NULL, '2018-01-28 15:56:38', '2018-01-28 15:56:38'),
(35, 6, 'Why is my browsing so slow while leeching?', 'The download speed mostly depends on the seeder-to-leecher ratio (SLR). Poor download speed is\r\nmainly a problem with new and very popular torrents where the SLR is low.<br />\r\n<br />\r\n(Proselytising sidenote: make sure you remember that you did not enjoy the low speed.\r\n<b>Seed</b> so that others will not endure the same.)<br />\r\n<br />\r\nThere are a couple of things that you can try on your end to improve your speed:<br />\r\n<br />In particular, do not do it if you have a slow connection. The best speeds will be found around the\r\nhalf-life of a torrent, when the SLR will be at its highest. (The downside is that you will not be able to seed\r\nso much. It\'s up to you to balance the pros and cons of this.)', NULL, '2018-01-28 15:57:12', '2018-01-28 15:57:12'),
(36, 7, 'What is a proxy?', 'Basically a middleman. When you are browsing a site through a proxy your requests are sent to the proxy and the proxy\r\nforwards them to the site instead of you connecting directly to the site. There are several classifications\r\n(the terminology is far from standard):<br />\r\n<br />\r\n\r\n\r\n<table cellspacing=\"3\" cellpadding=\"3\" class=\"table_table\" align=\"center\">\r\n <tr>\r\n    <td class=\"table_col1\"><b>Transparent</b></td>\r\n    <td class=\"table_col2\">A transparent proxy is one that needs no configuration on the clients. It works by automatically redirecting all port 80 traffic to the proxy. (Sometimes used as synonymous for non-anonymous.)</td>\r\n </tr>\r\n <tr>\r\n    <td class=\"table_col1\"><b>Explicit/Voluntary</b></td>\r\n    <td class=\"table_col2\">Clients must configure their browsers to use them.</td>\r\n </tr>\r\n <tr>\r\n    <td class=\"table_col1\"><b>Anonymous</b></td>\r\n    <td class=\"table_col2\">The proxy sends no client identification to the server. (HTTP_X_FORWARDED_FOR header is not sent; the server does not see your IP.)</td>\r\n </tr>\r\n <tr>\r\n    <td class=\"table_col1\"><b>Highly Anonymous</b></td>\r\n    <td class=\"table_col2\">The proxy sends no client nor proxy identification to the server. (HTTP_X_FORWARDED_FOR, HTTP_VIA and HTTP_PROXY_CONNECTION headers are not sent; the server doesn\'t see your IP and doesn\'t even know you\'re using a proxy.)</td>\r\n </tr>\r\n <tr>\r\n    <td class=\"table_col1\"><b>Public</b></td>\r\n    <td class=\"table_col2\">(Self explanatory)</td>\r\n </tr>\r\n</table>\r\n<br />\r\nA transparent proxy may or may not be anonymous, and there are several levels of anonymity.', NULL, '2018-01-28 15:58:21', '2018-01-28 15:58:21'),
(37, 7, 'How do I find out if I\'m behind a (transparent/anonymous) proxy?', 'Try <a href=\"http://proxyjudge.org\">ProxyJudge</a>. It lists the HTTP headers that the server where it is running\r\nreceived from you. The relevant ones are HTTP_CLIENT_IP, HTTP_X_FORWARDED_FOR and REMOTE_ADDR.<br />\r\n<br />\r\n<br />\r\n<b>Why is my port listed as &quot;---&quot; even though I\'m not NAT/Firewalled?</b><a name=\"prox3\"></a><br />\r\n<br />\r\nThe tracker is quite smart at finding your real IP, but it does need the proxy to send the HTTP header\r\nHTTP_X_FORWARDED_FOR. If your ISP\'s proxy does not then what happens is that the tracker will interpret the proxy\'s IP\r\naddress as the client\'s IP address. So when you login and the tracker tries to connect to your client to see if you are\r\nNAT/firewalled it will actually try to connect to the proxy on the port your client reports to be using for\r\nincoming connections. Naturally the proxy will not be listening on that port, the connection will fail and the\r\ntracker will think you are NAT/firewalled.', NULL, '2018-01-28 15:58:55', '2018-01-28 15:58:55'),
(38, 7, 'Can I bypass my ISP\'s proxy?', 'If your ISP only allows HTTP traffic through port 80 or blocks the usual proxy ports then you would need to use something\r\nlike <a href=\"http://www.socks.permeo.com\">socks</a> and that is outside the scope of this FAQ.<br />\r\n<br />\r\nOtherwise you may try the following:<br />\r\n<ul>\r\n    <li>Choose any public <b>non-anonymous</b> proxy that does <b>not</b> use port 80\r\n    (e.g. from <a href=\"http://tools.rosinstrument.com/proxy\">this</a>,\r\n    <a href=\"http://www.proxy4free.com/index.html\">this</a> or\r\n    <a href=\"http://www.samair.ru/proxy\">this</a> list).</li>\r\n\r\n    <li>Configure your computer to use that proxy. For Windows XP, do <i>Start</i>, <i>Control Panel</i>, <i>Internet Options</i>,\r\n    <i>Connections</i>, <i>LAN Settings</i>, <i>Use a Proxy server</i>, <i>Advanced</i> and type in the IP and port of your chosen\r\n    proxy. Or from Internet Explorer use <i>Tools</i>, <i>Internet Options</i>, ...<br /></li>\r\n\r\n    <li>(Facultative) Visit <a href=\"http://proxyjudge.org\">ProxyJudge</a>. If you see an HTTP_X_FORWARDED_FOR in\r\n    the list followed by your IP then everything should be ok, otherwise choose another proxy and try again.<br /></li>\r\n\r\n    <li>Visit this site. Hopefully the tracker will now pickup your real IP (check your profile to make sure).</li>\r\n</ul>\r\n<br />\r\nNotice that now you will be doing all your browsing through a public proxy, which are typically quite slow.\r\nCommunications between peers do not use port 80 so their speed will not be affected by this, and should be better than when\r\nyou were &quot;unconnectable&quot;.', NULL, '2018-01-28 15:59:33', '2018-01-28 15:59:33'),
(39, 7, 'How do I make my bittorrent client use a proxy?', 'Just configure Windows XP as above. When you configure a proxy for Internet Explorer you\r\nre actually configuring a proxy for\r\nall HTTP traffic (thank Microsoft and their &quot;IE as part of the OS policy&quot; ). On the other hand if you use another\r\nbrowser (Opera/Mozilla/Firefox) and configure a proxy there you\'ll be configuring a proxy just for that browser. We don\'t\r\nknow of any BT client that allows a proxy to be specified explicitly.', NULL, '2018-01-28 16:00:10', '2018-01-28 16:00:10'),
(40, 7, 'Why can\'t I signup from behind a proxy?', 'It is our policy not to allow new accounts to be opened from behind a proxy.', NULL, '2018-01-28 16:00:38', '2018-01-28 16:00:38'),
(41, 8, 'Maybe my address is blacklisted?', 'The site blocks addresses listed in the (former) <a href=\"http://methlabs.org/\">PeerGuardian</a>\r\ndatabase, as well as addresses of banned users. This works at Apache/PHP level, it\'s just a script that\r\nblocks <i>logins</i> from those addresses. It should not stop you from reaching the site. In particular\r\nit does not block lower level protocols, you should be able to ping/traceroute the server even if your\r\naddress is blacklisted. If you cannot then the reason for the problem lies elsewhere.<br />\r\n<br />\r\nIf somehow your address is indeed blocked in the PG database do not contact us about it, it is not our\r\npolicy to open <i>ad hoc</i> exceptions. You should clear your IP with the database maintainers instead.', NULL, '2018-01-28 16:01:38', '2018-01-28 16:01:38'),
(42, 8, 'Your ISP blocks the site\'s address', '(In first place, it\'s unlikely your ISP is doing so. DNS name resolution and/or network problems are the usual culprits.)\r\n<br />\r\nThere\'s nothing we can do.\r\nYou should contact your ISP (or get a new one). Note that you can still visit the site via a proxy, follow the instructions\r\nin the relevant section. In this case it doesn\'t matter if the proxy is anonymous or not, or which port it listens to.<br />\r\n<br />\r\nNotice that you will always be listed as an &quot;unconnectable&quot; client because the tracker will be unable to\r\ncheck that you\'re capable of accepting incoming connections.', NULL, '2018-01-28 16:02:08', '2018-01-28 16:02:08'),
(43, 9, 'You can try these:', 'Post in the <a href=\"forums.php\">Forums</a>, by all means. You\'ll find they\r\nare usually a friendly and helpful place,\r\nprovided you follow a few basic guidelines:\r\n<ul>\r\n<li>Make sure your problem is not really in this FAQ. There\'s no point in posting just to be sent\r\nback here.</li>\r\n<li>Before posting read the sticky topics (the ones at the top). Many times new information that\r\nstill hasn\'t been incorporated in the FAQ can be found there.</li>\r\n<li>Help us in helping you. Do not just say \"it doesn\'t work!\". Provide details so that we don\'t\r\nhave to guess or waste time asking. What client do you use? What\'s your OS? What\'s your network setup? What\'s the exact\r\nerror message you get, if any? What are the torrents you are having problems with? The more\r\nyou tell the easiest it will be for us, and the more probable your post will get a reply.</li>\r\n<li>And needless to say: be polite. Demanding help rarely works, asking for it usually does\r\nthe trick.</li></ul>', NULL, '2018-01-28 16:02:47', '2018-01-28 16:02:47');

-- --------------------------------------------------------

--
-- Table structure for table `faq_categories`
--

CREATE TABLE `faq_categories` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `style` varchar(30) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `faq_categories`
--

INSERT INTO `faq_categories` (`id`, `name`, `style`, `created_at`, `updated_at`) VALUES
(1, 'Site information', 'bg-primary', '2018-01-28 11:45:12', '2018-01-28 11:45:12'),
(2, 'User information', 'bg-info', '2018-01-28 11:45:12', '2018-01-28 11:45:12'),
(3, 'Stats', 'bg-success', '2018-01-28 11:45:12', '2018-01-28 11:45:12'),
(4, 'Uploading', 'bg-warning', '2018-01-28 11:45:12', '2018-01-28 11:45:12'),
(5, 'Downloading', 'bg-light', '2018-01-28 11:45:12', '2018-01-28 11:45:12'),
(6, 'How can I improve my download speed?', 'bg-secondary', '2018-01-28 11:45:12', '2018-01-28 11:45:12'),
(7, 'My ISP uses a transparent proxy. What should I do?', 'bg-danger', '2018-01-28 11:45:12', '2018-01-28 11:45:12'),
(8, 'Why can\'t I connect? Is the site blocking me?', 'bg-danger', '2018-01-28 11:45:12', '2018-01-28 11:45:12'),
(9, 'What if I can\'t find the answer to my problem here?', 'bg-light', '2018-01-28 11:45:12', '2018-01-28 11:45:12');

-- --------------------------------------------------------

--
-- Table structure for table `guests`
--

CREATE TABLE `guests` (
  `id` int(10) UNSIGNED NOT NULL,
  `ip` varchar(70) DEFAULT NULL,
  `country` varchar(45) DEFAULT NULL,
  `city` varchar(100) DEFAULT NULL,
  `estate` varchar(100) DEFAULT NULL,
  `os_system` varchar(100) DEFAULT NULL,
  `browser` varchar(190) DEFAULT NULL,
  `referrer` varchar(200) DEFAULT NULL,
  `has_returned` tinyint(1) NOT NULL DEFAULT '0',
  `access` smallint(10) UNSIGNED NOT NULL DEFAULT '1',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `invites`
--

CREATE TABLE `invites` (
  `id` int(10) UNSIGNED NOT NULL,
  `email` varchar(130) NOT NULL,
  `hash` varchar(45) NOT NULL,
  `expires_on` date NOT NULL,
  `invited_by` int(10) UNSIGNED NOT NULL,
  `accepted_by` int(10) UNSIGNED DEFAULT NULL,
  `accepted_at` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `invites`
--

INSERT INTO `invites` (`id`, `email`, `hash`, `expires_on`, `invited_by`, `accepted_by`, `accepted_at`, `created_at`, `updated_at`) VALUES
(7, 'jo@hotmail.com', '73c33481de32ba6e62187c6a9958e31e', '2018-05-11', 3, NULL, NULL, '2018-05-04 02:01:48', '2018-05-04 02:01:48');

-- --------------------------------------------------------

--
-- Table structure for table `logs`
--

CREATE TABLE `logs` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `message` varchar(255) NOT NULL,
  `ip` varchar(70) NOT NULL,
  `browser` varchar(190) NOT NULL,
  `os_system` varchar(100) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `logs`
--

INSERT INTO `logs` (`id`, `user_id`, `message`, `ip`, `browser`, `os_system`, `created_at`, `updated_at`) VALUES
(1, 1, 'A new member registered an new account: System', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36 OPR/52.0.2871.99', 'Windows 10', '2018-05-03 13:21:13', '2018-05-03 13:21:13'),
(2, 1, 'A new member just active account: System', '127.0.0.1', 'Opera', 'Windows 10', '2018-05-03 13:55:16', '2018-05-03 13:55:16'),
(3, 2, 'A new member registered an new account: Bot', '127.0.0.1', 'Opera', 'Windows 10', '2018-05-03 13:58:38', '2018-05-03 13:58:38'),
(4, 2, 'A new member just active account: Bot', '127.0.0.1', 'Opera', 'Windows 10', '2018-05-03 13:59:03', '2018-05-03 13:59:03'),
(5, 3, 'A new member registered an new account: mee', '127.0.0.1', 'Opera', 'Windows 10', '2018-05-03 14:05:52', '2018-05-03 14:05:52'),
(6, 3, 'A new member just active account: mee', '127.0.0.1', 'Opera', 'Windows 10', '2018-05-03 14:06:03', '2018-05-03 14:06:03'),
(7, 0, 'User reported a user 1', '127.0.0.1', 'Opera', 'Windows 10', '2018-05-04 00:02:53', '2018-05-04 00:02:53'),
(8, 0, 'User reported a user: 2', '127.0.0.1', 'Opera', 'Windows 10', '2018-05-04 00:05:47', '2018-05-04 00:05:47'),
(9, 3, 'A member send a invite to email: dasd@dasdas.', '127.0.0.1', 'Opera', 'Windows 10', '2018-05-04 01:54:33', '2018-05-04 01:54:33'),
(10, 3, 'A member send a invite to email: jo@hotmail.com.', '127.0.0.1', 'Opera', 'Windows 10', '2018-05-04 02:01:48', '2018-05-04 02:01:48');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `id` int(10) UNSIGNED NOT NULL,
  `email` varchar(130) NOT NULL,
  `hash` varchar(45) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `perm_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(45) NOT NULL,
  `description` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`perm_id`, `name`, `description`) VALUES
(1, 'torrent-view', NULL),
(2, 'torrent-edit', NULL),
(3, 'torrent-delete', NULL),
(4, 'torrent-upload', NULL),
(5, 'torrent-download', NULL),
(6, 'user-view', NULL),
(7, 'user-edit', NULL),
(8, 'user-delete', NULL),
(9, 'user-create', NULL),
(10, 'news-view', NULL),
(11, 'news-edit', NULL),
(12, 'news-delete', NULL),
(13, 'news-create', NULL),
(14, 'forum-view', NULL),
(15, 'forum-edit', NULL),
(16, 'forum-delete', NULL),
(17, 'topic-view', NULL),
(18, 'topic-edit', NULL),
(19, 'topic-delete', NULL),
(20, 'topic-create', NULL),
(21, 'chat-view', NULL),
(22, 'poll-view', NULL),
(23, 'poll-edit', NULL),
(24, 'poll-delete', NULL),
(25, 'poll-create', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `reports`
--

CREATE TABLE `reports` (
  `id` int(10) UNSIGNED NOT NULL,
  `report_by` int(10) UNSIGNED NOT NULL,
  `link_id` int(10) UNSIGNED NOT NULL,
  `type` enum('torrent','topic','user','comment') NOT NULL,
  `reason` varchar(255) NOT NULL,
  `dealt_by` int(10) UNSIGNED DEFAULT NULL,
  `solution` varchar(255) DEFAULT NULL,
  `solved` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `reports`
--

INSERT INTO `reports` (`id`, `report_by`, `link_id`, `type`, `reason`, `dealt_by`, `solution`, `solved`, `created_at`, `updated_at`) VALUES
(1, 0, 1, 'user', 'Just a testeeeeeeeeeeeeee', NULL, NULL, 0, '2018-05-04 00:02:53', '2018-05-04 00:02:53'),
(2, 0, 2, 'user', 'daasdasdasd', NULL, NULL, 0, '2018-05-04 00:05:47', '2018-05-04 00:05:47');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `role_id` int(10) UNSIGNED NOT NULL,
  `role_name` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`role_id`, `role_name`) VALUES
(1, 'member'),
(2, 'memberplus'),
(3, 'vip'),
(4, 'uploader'),
(5, 'moderator'),
(6, 'moderatorplus'),
(7, 'admin'),
(8, 'boss');

-- --------------------------------------------------------

--
-- Table structure for table `role_permissions`
--

CREATE TABLE `role_permissions` (
  `role_id` int(10) UNSIGNED NOT NULL,
  `perm_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `role_users`
--

CREATE TABLE `role_users` (
  `user_id` int(10) UNSIGNED NOT NULL,
  `role_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `rules`
--

CREATE TABLE `rules` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `rules`
--

INSERT INTO `rules` (`id`, `title`, `content`, `created_at`, `updated_at`) VALUES
(1, 'General Rules', '<b> Breaking these rules can and will get you banned! </b> <br>\n\n- We are a English only site, so please only talk in english! <br />\n\n- Do not defy the moderators expressed wishes! <br />\n\n- Respect staff members at all given times. <br>\n\n- No aggressive behavior, flaming, defamation, advertising, requesting, pictures and text which include racism/nudity/sexism/religion or foul language in Personal Messages. <br>\n\n- No query regarding ranks, if we feel like you deserve it you will be promoted. <br>', NULL, NULL),
(2, 'Forum Rules', '- No other language than English. <br>\n- No aggressive behaviour or flaming or defamation. <br />\n- No trashing of other peoples topics (i.e. SPAM). <br />\n- No links to warez or crack sites. <br />\n- No serials, CD keys, passwords or crack, trackers or money-making sites. <br />\n- No requesting if the release is over 7 days old. <br />\n- No bumping... (All bumped threads will be deleted.) <br />\n- No double posting. If you wish to post again, and yours is the last post in the thread please use the EDIT function,instead of posting a double. <br />\n- Please ensure all questions are posted in the correct section! <br />\n- No advertising. <br />\n- Mentioning other sites is allowed as long as you are not promoting it <br />\n- No requesting of downloads. <br />\n- No questions about when anything will be uploaded. <br />\n-No pictures with racism/nudity/sexism/religion are to be posted in the forum.\n[If you really need to post it, only post the link with a **18+** tag around it.] <br>\n- Use the search before posting anything, your thread will get locked if you dont. <br>', NULL, NULL),
(3, 'Moderating Rules', '- The most important rule!; Use your better judgement! <br />\n- Don\'t defy another mod in public, instead send a PM or make a post in the \"Site admin\". <br />\n- Be tolerant! give the user(s) a chance to reform. <br />\n- Don\'t act prematurely, Let the users make their mistake and THEN correct them. <br />\n- Try correcting any \"off topics\" rather then closing the thread. <br />\n- Move topics rather than locking / deleting them. <br />\n- Be tolerant when moderating the Chit-chat section. (give them some slack) <br />\n- If you lock a topic, Give a brief explanation as to why you\'re locking it. <br />\n- Before banning a user, Send him/her a PM and If they reply, put them on a 2 week trial. <br />\n- Don\'t ban a user until he or she has been a member for at least 4 weeks. <br />\n- Always state a reason (in the user comment box) as to why the user is being banned. <br />\n', NULL, NULL),
(4, 'Downloading Rules', '- Keep your overall ratio at or above 0.5 at all times! <br />\n\n- Cheating is not allowed, if either we or our system finds out you\'ll receive an immediate ban.  <br>\n\n- DHT and PEX (Peer Exchange) must be disabled on all clients. <br>\n\n- Banned clients are not allowed. Refer to the FAQs. <br>', NULL, NULL),
(5, 'Forum Guidelines', '- We advise you not to write any contact details e.g. address, email address or IP on the forum or in your profile for your own privacy. <br>\r\n\r\n- Whenever you have something to add and there hasnt been made a new post, use the edit function. This means no bumping as well. <br>\r\n\r\n- Posting in CAPS LOCK is very often taken as screaming and is therefore not appreciated. Nor is posting entire posts in a very huge size. <br>\r\n\r\n- Please ensure all threads are posted in the correct section! <br>', NULL, NULL),
(6, 'Avatar Rules', '- Do not use any avatar that may cause members to confuse you as a staff member. <br>\r\n\r\n- Your avatar may not include any racism/nudity/sexism/religion or something which is easily taken as an offence.\r\n[If you\'re in doubt whether something is appropriate or not feel free to message a staff member.] <br>\r\n\r\n- Maximum sizes are 200px x 300px. <br>', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `torrents`
--

CREATE TABLE `torrents` (
  `id` int(10) UNSIGNED NOT NULL,
  `info_hash` varchar(45) NOT NULL,
  `name` varchar(255) NOT NULL,
  `filename` varchar(255) NOT NULL,
  `poster` varchar(200) DEFAULT NULL,
  `image1` varchar(200) DEFAULT NULL,
  `image2` varchar(200) DEFAULT NULL,
  `image3` varchar(200) DEFAULT NULL,
  `announce` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `category_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `size` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `numfiles` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `views` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `comments` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `downs` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `times_completed` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `leechers` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `seeders` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `thanks` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `uploader_id` int(10) UNSIGNED NOT NULL,
  `visible` enum('yes','no') NOT NULL DEFAULT 'no',
  `banned` enum('yes','no') NOT NULL DEFAULT 'no',
  `anon` enum('yes','no') NOT NULL DEFAULT 'no',
  `nfo` enum('yes','no') NOT NULL DEFAULT 'no',
  `freeleech` enum('yes','no') NOT NULL DEFAULT 'no',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `torrent_categories`
--

CREATE TABLE `torrent_categories` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(45) NOT NULL,
  `slug` varchar(45) NOT NULL,
  `icon` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `torrent_categories`
--

INSERT INTO `torrent_categories` (`id`, `name`, `slug`, `icon`) VALUES
(1, 'Movies', 'movies', 'fa fa-film'),
(2, 'TV', 'tv', 'fa fa-television'),
(3, 'Music', 'music', 'fa fa-music'),
(4, 'E-Book', 'ebook', ''),
(5, 'XXX', 'xxx', ''),
(6, 'Applications', 'applications', '');

-- --------------------------------------------------------

--
-- Table structure for table `torrent_comments`
--

CREATE TABLE `torrent_comments` (
  `id` int(10) UNSIGNED NOT NULL,
  `torrent_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `comment` text NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `torrent_completes`
--

CREATE TABLE `torrent_completes` (
  `id` int(10) UNSIGNED NOT NULL,
  `torrent_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `user_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `created_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `torrent_files`
--

CREATE TABLE `torrent_files` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `torrent_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `length` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `path` varchar(255) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `torrent_peers`
--

CREATE TABLE `torrent_peers` (
  `id` int(10) UNSIGNED NOT NULL,
  `torrent_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `peer_id` varchar(45) NOT NULL,
  `ip` varchar(70) NOT NULL,
  `port` smallint(2) UNSIGNED NOT NULL,
  `uploaded` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `downloaded` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `to_go` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `seeder` enum('yes','no') NOT NULL DEFAULT 'no',
  `connectable` enum('yes','no') NOT NULL DEFAULT 'yes',
  `client` varchar(70) NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `passkey` varchar(45) NOT NULL,
  `started` datetime DEFAULT NULL,
  `lastaction` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `torrent_ratings`
--

CREATE TABLE `torrent_ratings` (
  `id` int(10) UNSIGNED NOT NULL,
  `torrent_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `rating` tinyint(3) UNSIGNED NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `email` varchar(130) NOT NULL,
  `passwd` varchar(70) NOT NULL,
  `username` varchar(30) NOT NULL,
  `status` enum('confirmed','pending','banned') NOT NULL DEFAULT 'pending',
  `profile` enum('public','friends','private') NOT NULL DEFAULT 'public',
  `class` enum('member','memberplus','vip','uploader','moderator','moderatorplus','admin','boss') NOT NULL DEFAULT 'member',
  `downloaded` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `uploaded` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `passkey` varchar(45) NOT NULL,
  `invites` tinyint(3) UNSIGNED NOT NULL DEFAULT '1',
  `dob` date DEFAULT NULL,
  `info` varchar(255) DEFAULT NULL,
  `acceptpms` tinyint(1) NOT NULL DEFAULT '1',
  `signature` varchar(255) DEFAULT NULL,
  `avatar` varchar(255) NOT NULL DEFAULT '/images/avatar.jpg',
  `title` varchar(255) DEFAULT NULL,
  `sex` enum('na','female','male') NOT NULL,
  `donated` decimal(10,0) DEFAULT NULL,
  `country_id` int(10) UNSIGNED NOT NULL,
  `points` int(10) UNSIGNED NOT NULL DEFAULT '1000',
  `social_facebook` varchar(100) DEFAULT NULL,
  `social_twitter` varchar(100) DEFAULT NULL,
  `social_gplus` varchar(100) DEFAULT NULL,
  `social_linkedin` varchar(100) DEFAULT NULL,
  `social_instagram` varchar(100) DEFAULT NULL,
  `social_pinterest` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `email`, `passwd`, `username`, `status`, `profile`, `class`, `downloaded`, `uploaded`, `passkey`, `invites`, `dob`, `info`, `acceptpms`, `signature`, `avatar`, `title`, `sex`, `donated`, `country_id`, `points`, `social_facebook`, `social_twitter`, `social_gplus`, `social_linkedin`, `social_instagram`, `social_pinterest`, `created_at`, `updated_at`) VALUES
(1, 'system@tracker.org', '$2y$10$xeOl1wnM04Pe0b89Da3hq.isOIAdRSZDTBN/Mqp9Dkdr4YAWUO1DW', 'System', 'confirmed', 'public', 'member', 0, 0, 'cfeb102c78d32712d018e935ae367ee1', 1, '2018-05-03', NULL, 1, NULL, '/images/avatar.jpg', NULL, 'na', NULL, 235, 1000, NULL, NULL, NULL, NULL, NULL, NULL, '2018-05-03 16:21:13', '2018-05-03 16:55:16'),
(2, 'bot@tracker.org', '$2y$10$PsMB19GaoQaJ5Z7xHPzJ.edz4Vd9mlgqXqsJJ4edPcp/3kNM9NDSm', 'Bot', 'confirmed', 'public', 'member', 0, 0, '0f25b67d26b0be8653537ec4aa7c562a', 1, '2018-05-03', NULL, 1, NULL, '/images/avatar.jpg', NULL, 'na', NULL, 235, 1000, NULL, NULL, NULL, NULL, NULL, NULL, '2018-05-03 16:58:38', '2018-05-03 16:59:03'),
(3, 'me@me.com', '$2y$10$zl57JViPVQhPUkS1/Q2chO8iBqreju1Rss7ZRE1fROfL4dq4wWqmG', 'mee', 'confirmed', 'public', 'member', 0, 0, '76fd87cf400c9362d36d32b0c3b38974', 47, '2018-05-03', NULL, 1, NULL, '/images/avatar.jpg', NULL, 'male', NULL, 32, 3010, NULL, NULL, NULL, NULL, NULL, NULL, '2018-05-01 17:05:51', '2018-05-06 15:55:51');

-- --------------------------------------------------------

--
-- Table structure for table `user_activations`
--

CREATE TABLE `user_activations` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `hash` varchar(45) NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` datetime DEFAULT NULL,
  `actived_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user_activations`
--

INSERT INTO `user_activations` (`id`, `user_id`, `hash`, `active`, `created_at`, `actived_at`) VALUES
(1, 1, '', 1, '2018-05-03 13:21:13', '2018-05-03 13:55:16'),
(2, 2, '', 1, '2018-05-03 13:58:38', '2018-05-03 13:59:03'),
(3, 3, '', 1, '2018-05-03 14:05:51', '2018-05-03 14:06:03');

-- --------------------------------------------------------

--
-- Table structure for table `user_logins`
--

CREATE TABLE `user_logins` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `ip` varchar(70) NOT NULL,
  `browser` varchar(190) NOT NULL,
  `os_system` varchar(100) NOT NULL,
  `created_at` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user_logins`
--

INSERT INTO `user_logins` (`id`, `user_id`, `ip`, `browser`, `os_system`, `created_at`, `updated_at`) VALUES
(1, 3, '127.0.0.1', 'Opera', 'Windows 10', '2018-05-03 14:12:13', '2018-05-03 14:12:13'),
(2, 3, '127.0.0.1', 'Opera', 'Windows 10', '2018-05-03 14:13:40', '2018-05-03 14:13:40'),
(3, 3, '127.0.0.1', 'Opera', 'Windows 10', '2018-05-03 14:16:35', '2018-05-03 14:16:35'),
(4, 3, '127.0.0.1', 'Opera', 'Windows 10', '2018-05-03 14:17:33', '2018-05-03 14:17:33'),
(5, 3, '127.0.0.1', 'Opera', 'Windows 10', '2018-05-03 14:19:08', '2018-05-03 14:19:08'),
(6, 3, '127.0.0.1', 'Opera', 'Windows 10', '2018-05-03 14:21:45', '2018-05-03 14:21:45'),
(7, 3, '127.0.0.1', 'Opera', 'Windows 10', '2018-05-03 14:31:26', '2018-05-03 14:31:26'),
(8, 3, '127.0.0.1', 'Opera', 'Windows 10', '2018-05-03 16:20:30', '2018-05-03 16:20:30'),
(9, 3, '127.0.0.1', 'Opera', 'Windows 10', '2018-05-03 17:50:48', '2018-05-03 17:50:48'),
(10, 3, '127.0.0.1', 'Opera', 'Windows 10', '2018-05-03 21:17:14', '2018-05-03 21:17:14'),
(11, 3, '127.0.0.1', 'Opera', 'Windows 10', '2018-05-04 00:00:08', '2018-05-04 00:00:08'),
(12, 3, '127.0.0.1', 'Firefox', 'Windows 10', '2018-05-04 01:10:44', '2018-05-04 01:10:44'),
(13, 3, '127.0.0.1', 'Opera', 'Windows 10', '2018-05-04 01:15:57', '2018-05-04 01:15:57'),
(14, 3, '127.0.0.1', 'Opera', 'Windows 10', '2018-05-04 01:21:56', '2018-05-04 01:21:56'),
(15, 3, '127.0.0.1', 'Opera', 'Windows 10', '2018-05-04 01:27:55', '2018-05-04 01:27:55'),
(16, 3, '127.0.0.1', 'Opera', 'Windows 10', '2018-05-04 02:09:20', '2018-05-04 02:09:20'),
(17, 3, '127.0.0.1', 'Opera', 'Windows 10', '2018-05-04 16:59:15', '2018-05-04 16:59:15'),
(18, 3, '127.0.0.1', 'Opera', 'Windows 10', '2018-05-04 17:04:34', '2018-05-04 17:04:34'),
(19, 3, '127.0.0.1', 'Opera', 'Windows 10', '2018-05-05 00:29:05', '2018-05-05 00:29:05'),
(20, 3, '127.0.0.1', 'Opera', 'Windows 10', '2018-05-06 12:49:38', '2018-05-06 12:49:38'),
(21, 3, '127.0.0.1', 'Opera', 'Windows 10', '2018-05-06 12:55:51', '2018-05-06 12:55:51');

-- --------------------------------------------------------

--
-- Table structure for table `user_warnings`
--

CREATE TABLE `user_warnings` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `warned_by` int(10) UNSIGNED NOT NULL,
  `reason` varchar(255) NOT NULL,
  `type` varchar(45) NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `expiry` datetime NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `brute_forces`
--
ALTER TABLE `brute_forces`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `countries`
--
ALTER TABLE `countries`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `faqs`
--
ALTER TABLE `faqs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `category_id` (`category_id`);

--
-- Indexes for table `faq_categories`
--
ALTER TABLE `faq_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `guests`
--
ALTER TABLE `guests`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `invites`
--
ALTER TABLE `invites`
  ADD PRIMARY KEY (`id`),
  ADD KEY `invited_by` (`invited_by`);

--
-- Indexes for table `logs`
--
ALTER TABLE `logs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD PRIMARY KEY (`id`),
  ADD KEY `email` (`email`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`perm_id`);

--
-- Indexes for table `reports`
--
ALTER TABLE `reports`
  ADD PRIMARY KEY (`id`),
  ADD KEY `report_by` (`report_by`),
  ADD KEY `dealt_by` (`dealt_by`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`role_id`);

--
-- Indexes for table `role_permissions`
--
ALTER TABLE `role_permissions`
  ADD KEY `role_id` (`role_id`),
  ADD KEY `perm_id` (`perm_id`);

--
-- Indexes for table `role_users`
--
ALTER TABLE `role_users`
  ADD KEY `user_id` (`user_id`),
  ADD KEY `role_id` (`role_id`);

--
-- Indexes for table `rules`
--
ALTER TABLE `rules`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `torrents`
--
ALTER TABLE `torrents`
  ADD PRIMARY KEY (`id`),
  ADD KEY `category_id` (`category_id`),
  ADD KEY `uploader` (`uploader_id`);

--
-- Indexes for table `torrent_categories`
--
ALTER TABLE `torrent_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `torrent_comments`
--
ALTER TABLE `torrent_comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `torrent_id` (`torrent_id`);

--
-- Indexes for table `torrent_completes`
--
ALTER TABLE `torrent_completes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `torrent_id` (`torrent_id`);

--
-- Indexes for table `torrent_files`
--
ALTER TABLE `torrent_files`
  ADD PRIMARY KEY (`id`),
  ADD KEY `torrent_id` (`torrent_id`);

--
-- Indexes for table `torrent_peers`
--
ALTER TABLE `torrent_peers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `torrent_id` (`torrent_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `torrent_ratings`
--
ALTER TABLE `torrent_ratings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `torrent_id` (`torrent_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `estate_id` (`country_id`);

--
-- Indexes for table `user_activations`
--
ALTER TABLE `user_activations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_logins`
--
ALTER TABLE `user_logins`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_warnings`
--
ALTER TABLE `user_warnings`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `brute_forces`
--
ALTER TABLE `brute_forces`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `countries`
--
ALTER TABLE `countries`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=251;

--
-- AUTO_INCREMENT for table `faqs`
--
ALTER TABLE `faqs`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;

--
-- AUTO_INCREMENT for table `faq_categories`
--
ALTER TABLE `faq_categories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `guests`
--
ALTER TABLE `guests`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `invites`
--
ALTER TABLE `invites`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `logs`
--
ALTER TABLE `logs`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `password_resets`
--
ALTER TABLE `password_resets`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `perm_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `reports`
--
ALTER TABLE `reports`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `role_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `rules`
--
ALTER TABLE `rules`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `torrents`
--
ALTER TABLE `torrents`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `torrent_categories`
--
ALTER TABLE `torrent_categories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `torrent_comments`
--
ALTER TABLE `torrent_comments`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `torrent_completes`
--
ALTER TABLE `torrent_completes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `torrent_files`
--
ALTER TABLE `torrent_files`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `torrent_peers`
--
ALTER TABLE `torrent_peers`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `torrent_ratings`
--
ALTER TABLE `torrent_ratings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `user_activations`
--
ALTER TABLE `user_activations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `user_logins`
--
ALTER TABLE `user_logins`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `user_warnings`
--
ALTER TABLE `user_warnings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `faqs`
--
ALTER TABLE `faqs`
  ADD CONSTRAINT `faqs_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `faq_categories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
