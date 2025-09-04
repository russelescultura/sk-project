-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 03, 2025 at 10:30 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `sk_project`
--

-- --------------------------------------------------------

--
-- Table structure for table `content`
--

CREATE TABLE `content` (
  `id` varchar(191) NOT NULL,
  `title` varchar(191) NOT NULL,
  `description` text DEFAULT NULL,
  `type` enum('POST','GALLERY','VIDEO','FILE','ANNOUNCEMENT','NEWS','EVENT') NOT NULL,
  `status` enum('DRAFT','PUBLISHED','ARCHIVED') NOT NULL DEFAULT 'DRAFT',
  `fileUrl` varchar(191) DEFAULT NULL,
  `thumbnail` varchar(191) DEFAULT NULL,
  `tags` text DEFAULT NULL,
  `authorId` varchar(191) NOT NULL,
  `createdAt` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `updatedAt` datetime(3) NOT NULL,
  `featured` tinyint(1) NOT NULL DEFAULT 0,
  `order` int(11) DEFAULT 0,
  `fileUrls` text DEFAULT NULL,
  `thumbnailMode` varchar(191) DEFAULT 'SINGLE',
  `selectedThumbnails` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `content`
--

INSERT INTO `content` (`id`, `title`, `description`, `type`, `status`, `fileUrl`, `thumbnail`, `tags`, `authorId`, `createdAt`, `updatedAt`, `featured`, `order`, `fileUrls`, `thumbnailMode`, `selectedThumbnails`) VALUES
('cmdyh20og0005ah1h4m4udesx', 'Opisyal na Simula ng Fiesta Celebration, Pinangunahan ng Masiglang Parada', 'Isang simple ngunit masiglang parada ang bumungad sa Barangay Tulay bilang hudyat ng opisyal na pagsisimula ng Fiesta Celebration!\r\nBagamat payak, ang masiglang parada ay puno ng kulay, sigla, at tunay na damdaming pamayanan. Isang paalala na hindi kailangang engrande upang maging makabuluhan ang selebrasyon—ang mahalaga ay ang pagkakaisa at malasakit ng bawat isa.', 'EVENT', 'PUBLISHED', '/uploads/content/1754394277970-ksx5m7g5buq-495375462_122208726626173297_4943088971622096134_n.jpg', '/uploads/content/1754394278043-mvk7abqeao-495172748_122208726524173297_1044642702805661238_n.jpg', 'Parade ', 'cmdvwocmm00005u04ci2gg6yz', '2025-08-05 11:44:38.122', '2025-08-05 17:14:07.418', 1, 0, '[\"/uploads/content/1754394277970-ksx5m7g5buq-495375462_122208726626173297_4943088971622096134_n.jpg\",\"/uploads/content/1754394277989-irwgfdl8ib-495369064_122208726614173297_6094720890976772067_n.jpg\",\"/uploads/content/1754394277998-p7oxbu1o69q-495371504_122208726596173297_6353335989526729950_n.jpg\",\"/uploads/content/1754394278008-b6zrrflrl8-495199714_122208726578173297_4854345288197114824_n.jpg\",\"/uploads/content/1754394278023-l79f5wrhqad-495338231_122208726548173297_4696217031304482954_n.jpg\",\"/uploads/content/1754394278033-eeh0tdd5k6m-495001827_122208726536173297_977962000838416187_n.jpg\",\"/uploads/content/1754394278043-mvk7abqeao-495172748_122208726524173297_1044642702805661238_n.jpg\",\"/uploads/content/1754394278053-arfyudh9vop-494524332_122208726464173297_5029628012885924483_n.jpg\",\"/uploads/content/1754394278063-nyljxs50fp8-494531983_122208726242173297_1229855677237284735_n.jpg\",\"/uploads/content/1754394278077-uo894pn6bo-494482925_122208726128173297_9158389307993083682_n.jpg\"]', 'MULTIPLE', '[\"/uploads/content/1754394278043-mvk7abqeao-495172748_122208726524173297_1044642702805661238_n.jpg\",\"/uploads/content/1754394278033-eeh0tdd5k6m-495001827_122208726536173297_977962000838416187_n.jpg\",\"/uploads/content/1754394277998-p7oxbu1o69q-495371504_122208726596173297_6353335989526729950_n.jpg\",\"/uploads/content/1754394278008-b6zrrflrl8-495199714_122208726578173297_4854345288197114824_n.jpg\"]'),
('cmdyhqdi30007ah1h7yiu6pks', 'Viva Barangay Tulay! A Joyful Celebration of Faith and Community', '𝐉𝐨𝐢𝐧 𝐮𝐬 𝐢𝐧 𝐜𝐞𝐥𝐞𝐛𝐫𝐚𝐭𝐢𝐧𝐠 𝐨𝐮𝐫 𝐛𝐞𝐥𝐨𝐯𝐞𝐝 𝐅𝐢𝐞𝐬𝐭𝐚 𝐨𝐧 𝐌𝐚𝐲 𝟕–𝟖, 𝟐𝟎𝟐𝟓 𝐢𝐧 𝐡𝐨𝐧𝐨𝐫 𝐨𝐟 𝐭𝐡𝐞 𝐇𝐨𝐥𝐲 𝐅𝐚𝐦𝐢𝐥𝐲, 𝐨𝐮𝐫 𝐩𝐚𝐭𝐫𝐨𝐧 𝐬𝐚𝐢𝐧𝐭.\r\n𝐋𝐞𝐭’𝐬 𝐮𝐧𝐢𝐭𝐞 𝐢𝐧 𝐟𝐚𝐢𝐭𝐡, 𝐣𝐨𝐲, 𝐚𝐧𝐝 𝐜𝐨𝐦𝐦𝐮𝐧𝐢𝐭𝐲 𝐬𝐩𝐢𝐫𝐢𝐭!', 'NEWS', 'PUBLISHED', '/uploads/content/1754395414472-r67hg97qao-495147882_122105737610856739_8731849478509323474_n.jpg', '/uploads/content/1754395414472-r67hg97qao-495147882_122105737610856739_8731849478509323474_n.jpg', 'Religious', 'cmdvwocmm00005u04ci2gg6yz', '2025-08-05 12:03:34.488', '2025-08-05 12:04:00.227', 0, 0, '[\"/uploads/content/1754395414472-r67hg97qao-495147882_122105737610856739_8731849478509323474_n.jpg\"]', 'SINGLE', NULL),
('cmdyi68f10009ah1hpse4n99g', 'MISS GAY BAHAGHARI', 'Miss Gay Bahaghari 2025 was a vibrant success — all thanks to the amazing people behind it!\r\nWe extend our heartfelt gratitude to our Barangay Officials, SK Officials, appointed officials, esteemed judges, generous sponsors, dazzling candidates, hardworking organizers, and to everyone who supported and celebrated with us last May 6, 2025.\r\nYou all made this event not just possible, but unforgettable. Maraming salamat sa suporta, pagmamahal, at pagkakaisa!', 'EVENT', 'PUBLISHED', '/uploads/content/1754396154309-40u08z6j4ht-495367596_122107607684856739_6830743734592611825_n.jpg', '/uploads/content/1754396154349-8xyx56361kq-495369650_122107605542856739_8293467542466260305_n.jpg', '', 'cmdvwocmm00005u04ci2gg6yz', '2025-08-05 12:15:54.395', '2025-08-05 17:11:15.990', 0, 0, '[\"/uploads/content/1754396154309-40u08z6j4ht-495367596_122107607684856739_6830743734592611825_n.jpg\",\"/uploads/content/1754396154313-sg4j51g787m-494921197_122107607660856739_7928371616113917400_n.jpg\",\"/uploads/content/1754396154319-3b4fvknmeke-495373064_122107607636856739_3039089140212391418_n.jpg\",\"/uploads/content/1754396154323-0gud705smmge-495024734_122107607552856739_102467478731371806_n.jpg\",\"/uploads/content/1754396154328-zisbtjibsvo-495305817_122107607510856739_6962651408521527700_n.jpg\",\"/uploads/content/1754396154332-uwaeaj97kf-494885487_122107607378856739_3480278800019041365_n (1).jpg\",\"/uploads/content/1754396154336-wykkelcbpl-494885487_122107607378856739_3480278800019041365_n.jpg\",\"/uploads/content/1754396154341-hu1fcko975-495648722_122107607132856739_4179527036348966142_n.jpg\",\"/uploads/content/1754396154345-srz0s2hmn9-495150473_122107606406856739_869319767221738749_n.jpg\",\"/uploads/content/1754396154349-8xyx56361kq-495369650_122107605542856739_8293467542466260305_n.jpg\"]', 'MULTIPLE', '[\"/uploads/content/1754396154349-8xyx56361kq-495369650_122107605542856739_8293467542466260305_n.jpg\",\"/uploads/content/1754396154341-hu1fcko975-495648722_122107607132856739_4179527036348966142_n.jpg\"]'),
('cmdyioj7i000bah1hs10z5h3t', 'COLOR RUN 2025', 'Isang makulay at masiglang araw ang ating pinagsaluhan noong Mayo 7, 2025 bilang bahagi ng ating Fiesta Celebration!\r\nLubos ang pasasalamat ng Sangguniang Kabataan sa lahat ng nakiisa—mga kabataan, matatanda, pamilya, at buong komunidad—kayo ang dahilan ng tagumpay ng Color Run ngayong taon!\r\nSalamat sa pagpapakita ng suporta, pagkakaisa, at kasiyahan. Sama-sama nating pinatunayan na sa isang makulay na takbuhan, buhay na buhay ang diwa ng ating barangay!\r\nHanggang sa susunod na takbo, mga taga-Tulay❤️??🏃🏼‍♀️', 'EVENT', 'PUBLISHED', '/uploads/content/1754397008157-uxl36ozu85-495321958_122107695524856739_4060323179231866610_n.jpg', '/uploads/content/1754397008168-do6so6b8bzk-495369976_122107695110856739_6966803741296654051_n.jpg', '', 'cmdvwocmm00005u04ci2gg6yz', '2025-08-05 12:30:08.191', '2025-08-20 14:15:25.000', 0, 0, '[\"/uploads/content/1754397008157-uxl36ozu85-495321958_122107695524856739_4060323179231866610_n.jpg\",\"/uploads/content/1754397008161-z9wnmfht5lh-494938640_122107695422856739_7210682269202882389_n.jpg\",\"/uploads/content/1754397008163-el4cu7x7tr-495038316_122107695326856739_7502425872767928683_n.jpg\",\"/uploads/content/1754397008166-5g78xtt4igq-495377911_122107695248856739_7042340051694148427_n.jpg\",\"/uploads/content/1754397008168-do6so6b8bzk-495369976_122107695110856739_6966803741296654051_n.jpg\",\"/uploads/content/1754397008171-zsx0e376hx-496126231_122107690322856739_7344937248177394957_n (1).jpg\",\"/uploads/content/1754397008173-8bgtv9sndh-496126231_122107690322856739_7344937248177394957_n.jpg\",\"/uploads/content/1754397008176-y2q4s7sst7-495625244_122107690232856739_857544058674161345_n.jpg\"]', 'MULTIPLE', '[\"/uploads/content/1754397008168-do6so6b8bzk-495369976_122107695110856739_6966803741296654051_n.jpg\",\"/uploads/content/1754397008166-5g78xtt4igq-495377911_122107695248856739_7042340051694148427_n.jpg\",\"/uploads/content/1754397008157-uxl36ozu85-495321958_122107695524856739_4060323179231866610_n.jpg\"]'),
('cmdyithd3000dah1hwi63g41z', 'REYNANAY 2025!', 'Isang Gabi ng Ganda, Tapang, at Inspirasyon!\r\nNoong Mayo 7, 2025, ating ipinagdiwang hindi lamang ang kagandahan kundi ang lakas at husay ng ating mga ilaw ng tahanan—ang ating mga Reyna ng Tahanan!\r\nLubos ang pasasalamat ng Sangguniang Kabataan at buong pamunuan ng barangay sa lahat ng tumulong at sumuporta upang maging matagumpay ang gabing ito:\r\nSa ating mga Barangay Officials, Appointed Officials, SK Officials, Sponsors, Judges, Organizers, at sa buong komunidad—maraming, maraming salamat po!\r\nDahil sa inyo, naging makabuluhan at makulay ang ating selebrasyon.\r\nMabuhay ang mga nanay!', 'EVENT', 'PUBLISHED', '/uploads/content/1754397239031-dj5bpa780u-495372173_122107710530856739_1878355033891916783_n.jpg', '/uploads/content/1754397239068-h9wc00kuyhc-495335807_122107709804856739_6433070092032666530_n.jpg', '', 'cmdvwocmm00005u04ci2gg6yz', '2025-08-05 12:33:59.079', '2025-08-05 17:06:56.750', 0, 0, '[\"/uploads/content/1754397239031-dj5bpa780u-495372173_122107710530856739_1878355033891916783_n.jpg\",\"/uploads/content/1754397239041-93e9m5g4mmc-494988360_122107710290856739_8028670437630931158_n.jpg\",\"/uploads/content/1754397239048-72j2gui4vo9-495379674_122107710122856739_354104609095039537_n (1).jpg\",\"/uploads/content/1754397239054-1its1b5fzt1-495379674_122107710122856739_354104609095039537_n.jpg\",\"/uploads/content/1754397239059-pipn0o3aa1f-495378631_122107709996856739_953519648136319956_n.jpg\",\"/uploads/content/1754397239068-h9wc00kuyhc-495335807_122107709804856739_6433070092032666530_n.jpg\"]', 'SINGLE', '[\"/uploads/content/1754397239068-h9wc00kuyhc-495335807_122107709804856739_6433070092032666530_n.jpg\"]'),
('cmdyiy6pc000fah1hw76vhp0n', 'PARLOR GAMES PARA SA MGA KABATAAN – Fiesta 2025 Edition!', 'Kahapon, Mayo 8, 2025, naging makulay at masigla ang ating barangay sa pamamagitan ng mga parlor games na inihanda para sa ating mga kabataan!\r\nSalamat sa lahat ng nakiisa, nakipaglaro, at nagpakitang-gilas! Tunay na buhay na buhay ang diwa ng kabataan—masayahin, palaban, at nagkakaisa.', 'NEWS', 'PUBLISHED', '/uploads/content/1754397458507-ty0nshmpa8c-495196118_122107719338856739_32963760916672736_n.jpg', '/uploads/content/1754397458507-ty0nshmpa8c-495196118_122107719338856739_32963760916672736_n.jpg', '', 'cmdvwocmm00005u04ci2gg6yz', '2025-08-05 12:37:38.545', '2025-08-05 12:38:18.997', 0, 0, '[\"/uploads/content/1754397458507-ty0nshmpa8c-495196118_122107719338856739_32963760916672736_n.jpg\",\"/uploads/content/1754397458509-4w9udgqcnjl-495465674_122107719290856739_7773613467986194091_n.jpg\",\"/uploads/content/1754397458511-4gwv6z574sb-494734114_122107719242856739_849850504564606668_n.jpg\",\"/uploads/content/1754397458515-eioah8q6htb-494660952_122107719200856739_7831115486624457549_n.jpg\",\"/uploads/content/1754397458519-s9ogwrtltt-496678273_122107719152856739_2781956588619272588_n.jpg\",\"/uploads/content/1754397458522-9ccv1pp6osm-495367986_122107725008856739_565842610601575688_n.jpg\",\"/uploads/content/1754397458526-kvcd31ajnxq-495376050_122107724984856739_2619818203713343591_n.jpg\",\"/uploads/content/1754397458531-l4vluhyljfk-495337373_122107724804856739_2252565043233432894_n.jpg\"]', 'SINGLE', NULL),
('cmdyod32s000jah1hlso4jozj', '𝗧𝗨𝗟𝗔𝗬 𝗬𝗢𝗨𝗧𝗛, 𝗧𝗔𝗥𝗔 𝗡𝗔!', 'Mainit na panahon, mas mainit na bonding!\r\nSamahan ang Katipunan ng Kabataan ng Barangay Tulay sa isang araw ng saya, teamwork, at kabataan vibes sa:\r\n\r\n𝐊𝐀𝐓𝐈𝐏𝐔𝐍𝐀𝐍 𝐍𝐆 𝐊𝐀𝐁𝐀𝐓𝐀𝐀𝐍 𝐒𝐔𝐌𝐌𝐄𝐑 𝐓𝐄𝐀𝐌 𝐁𝐔𝐈𝐋𝐃𝐈𝐍𝐆 𝟐𝟎𝟐𝟓\r\n𝐌𝐚𝐲 𝟏𝟒, 𝟐𝟎𝟐𝟓 | 𝐀𝐠𝐨𝐡𝐨 𝐅𝐨𝐫𝐞𝐬𝐭 𝐑𝐞𝐬𝐞𝐫𝐯𝐞, 𝐆𝐮𝐛𝐚𝐭, 𝐒𝐨𝐫𝐬𝐨𝐠𝐨𝐧\r\n𝐓𝐡𝐞𝐦𝐞: \"𝐓𝐮𝐥𝐚𝐲 𝐘𝐨𝐮𝐭𝐡 𝐔𝐧𝐢𝐭𝐞𝐝: 𝐒𝐮𝐦𝐦𝐞𝐫 𝐁𝐨𝐧𝐝 𝐟𝐨𝐫 𝐚 𝐒𝐭𝐫𝐨𝐧𝐠𝐞𝐫 𝐓𝐨𝐦𝐨𝐫𝐫𝐨𝐰\"\r\n\r\n𝙇𝙄𝙈𝙄𝙏𝙀𝘿 𝙋𝘼𝙍𝙏𝙄𝘾𝙄𝙋𝘼𝙉𝙏𝙎 𝙊𝙉𝙇𝙔\r\nKaya’t mag-register na agad at wag palampasin ang pagkakataon!\r\nIto ang araw para makakilala, makisaya, at magsama-sama tungo sa mas matibay na bukas!\r\nSa mga nais mag-register, mag-message lamang dito sa ating official FB page/ sa ating GC o kaya sa SK Council.🫶\r\n\r\n#TulayYouthUnited #SummerTeamBuilding2025\r\n#KabataangTulay See less', 'ANNOUNCEMENT', 'PUBLISHED', '/uploads/content/1754406551744-1x7w829fufx-495274370_122108169068856739_5056234591620602462_n.jpg', '/uploads/content/1754406551744-1x7w829fufx-495274370_122108169068856739_5056234591620602462_n.jpg', '', 'cmdvwocmm00005u04ci2gg6yz', '2025-08-05 15:09:11.764', '2025-08-05 15:09:15.276', 0, 0, '[\"/uploads/content/1754406551744-1x7w829fufx-495274370_122108169068856739_5056234591620602462_n.jpg\"]', 'SINGLE', NULL),
('cmdyssb4v00019pax4laynbmy', '𝗛𝗔𝗣𝗣𝗬 𝗠𝗢𝗧𝗛𝗘𝗥’𝗦 𝗗𝗔𝗬!', '“𝑰𝒏𝒂, 𝑰𝒍𝒂𝒘 𝒏𝒈 𝑻𝒂𝒉𝒂𝒏𝒂𝒏, 𝑯𝒂𝒍𝒊𝒈𝒊 𝒏𝒈 𝑷𝒂𝒈-𝒂𝒔𝒂.”\r\nToday, we honor all the mothers who continue to nurture, guide, and inspire.\r\nYour love, strength, and sacrifices are the foundations of our community.\r\nMaraming Salamat po, Nanay!\r\nYour endless care and devotion do not go unnoticed.\r\nWe celebrate YOU today and always.\r\n– Sangguniang Kabataan ng Barangay Tulay', 'NEWS', 'PUBLISHED', '/uploads/content/1754413980495-hg6nmayf38b-495578316_122108343122856739_262158520935791496_n.jpg', '/uploads/content/1754413980495-hg6nmayf38b-495578316_122108343122856739_262158520935791496_n.jpg', '', 'cmdvwocmm00005u04ci2gg6yz', '2025-08-05 17:13:00.505', '2025-08-05 17:13:19.004', 0, 0, '[\"/uploads/content/1754413980495-hg6nmayf38b-495578316_122108343122856739_262158520935791496_n.jpg\"]', 'SINGLE', '[\"/uploads/content/1754413980495-hg6nmayf38b-495578316_122108343122856739_262158520935791496_n.jpg\"]');

-- --------------------------------------------------------

--
-- Table structure for table `events`
--

CREATE TABLE `events` (
  `id` varchar(191) NOT NULL,
  `title` varchar(191) NOT NULL,
  `description` text NOT NULL,
  `dateTime` datetime(3) NOT NULL,
  `venue` varchar(191) NOT NULL,
  `maxParticipants` int(11) DEFAULT NULL,
  `status` enum('PLANNED','ACTIVE','COMPLETED','CANCELLED') NOT NULL DEFAULT 'PLANNED',
  `poster` varchar(191) DEFAULT NULL,
  `attachments` text DEFAULT NULL,
  `createdAt` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `updatedAt` datetime(3) NOT NULL,
  `programId` varchar(191) NOT NULL,
  `endDateTime` datetime(3) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `events`
--

INSERT INTO `events` (`id`, `title`, `description`, `dateTime`, `venue`, `maxParticipants`, `status`, `poster`, `attachments`, `createdAt`, `updatedAt`, `programId`, `endDateTime`) VALUES
('cmf3l758q0002spbbivavxfev', 'Leadership Orientation Workshop', 'Introduction to leadership, responsibilities of youth leaders, and teamwork-building activities.', '2025-09-06 09:00:00.000', 'Gynamsium', 10, 'ACTIVE', '', '', '2025-09-03 06:19:08.994', '2025-09-03 06:19:08.994', 'cmf3kyxwv0000spbb33nhr9mm', '2025-09-06 11:00:00.000');

-- --------------------------------------------------------

--
-- Table structure for table `expenses`
--

CREATE TABLE `expenses` (
  `id` varchar(191) NOT NULL,
  `title` varchar(191) NOT NULL,
  `description` text DEFAULT NULL,
  `amount` double NOT NULL,
  `category` enum('VENUE','MATERIALS','FOOD','TRANSPORTATION','EQUIPMENT','MARKETING','ADMINISTRATIVE','OTHER') NOT NULL,
  `date` datetime(3) NOT NULL,
  `receipt` varchar(191) DEFAULT NULL,
  `status` enum('PENDING','APPROVED','REJECTED') NOT NULL DEFAULT 'PENDING',
  `programId` varchar(191) NOT NULL,
  `createdAt` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `updatedAt` datetime(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `forms`
--

CREATE TABLE `forms` (
  `id` varchar(191) NOT NULL,
  `title` varchar(191) NOT NULL,
  `type` enum('REGISTRATION','SURVEY','WAIVER','FEEDBACK','CUSTOM') NOT NULL,
  `fields` text NOT NULL,
  `fileUpload` tinyint(1) NOT NULL DEFAULT 0,
  `gcashReceipt` tinyint(1) NOT NULL DEFAULT 0,
  `submissionLimit` int(11) DEFAULT NULL,
  `submissionDeadline` datetime(3) DEFAULT NULL,
  `isActive` tinyint(1) NOT NULL DEFAULT 1,
  `createdAt` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `updatedAt` datetime(3) NOT NULL,
  `eventId` varchar(191) NOT NULL,
  `accessLink` varchar(191) DEFAULT NULL,
  `accessQRCode` varchar(191) DEFAULT NULL,
  `publishStatus` enum('DRAFT','PUBLISHED','ARCHIVED') NOT NULL DEFAULT 'DRAFT',
  `qrCodeImage` varchar(191) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `forms`
--

INSERT INTO `forms` (`id`, `title`, `type`, `fields`, `fileUpload`, `gcashReceipt`, `submissionLimit`, `submissionDeadline`, `isActive`, `createdAt`, `updatedAt`, `eventId`, `accessLink`, `accessQRCode`, `publishStatus`, `qrCodeImage`) VALUES
('cmf3lotr20004spbba8ap87p3', 'Registration for Leadership program', 'REGISTRATION', '\"[{\\\"id\\\":\\\"1756880884660\\\",\\\"name\\\":\\\"Full Name\\\",\\\"label\\\":\\\"Full Name\\\",\\\"type\\\":\\\"text\\\",\\\"required\\\":false,\\\"placeholder\\\":\\\"Enter your full name\\\"},{\\\"id\\\":\\\"1756880945849\\\",\\\"name\\\":\\\"Email Address\\\",\\\"label\\\":\\\"Email Address\\\",\\\"type\\\":\\\"email\\\",\\\"required\\\":false,\\\"placeholder\\\":\\\"Enter your email address\\\"},{\\\"id\\\":\\\"1756880991241\\\",\\\"name\\\":\\\"Upload your Image\\\",\\\"label\\\":\\\"2x2 Picture\\\",\\\"type\\\":\\\"fileUpload\\\",\\\"required\\\":false}]\"', 0, 0, NULL, '2025-09-07 16:00:00.000', 1, '2025-09-03 06:32:53.914', '2025-09-03 06:32:58.290', 'cmf3l758q0002spbbivavxfev', 'http://localhost:3000/forms/cmf3lotr20004spbba8ap87p3', '/uploads/form-qr-codes/form-access-cmf3lotr20004spbba8ap87p3-1756881178283.png', 'PUBLISHED', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `form_submissions`
--

CREATE TABLE `form_submissions` (
  `id` varchar(191) NOT NULL,
  `data` text NOT NULL,
  `files` text DEFAULT NULL,
  `gcashReceipt` varchar(191) DEFAULT NULL,
  `status` enum('PENDING','APPROVED','REJECTED') NOT NULL DEFAULT 'PENDING',
  `submittedAt` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `reviewedAt` datetime(3) DEFAULT NULL,
  `reviewedBy` varchar(191) DEFAULT NULL,
  `notes` text DEFAULT NULL,
  `formId` varchar(191) NOT NULL,
  `userId` varchar(191) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `form_submissions`
--

INSERT INTO `form_submissions` (`id`, `data`, `files`, `gcashReceipt`, `status`, `submittedAt`, `reviewedAt`, `reviewedBy`, `notes`, `formId`, `userId`) VALUES
('cmf3mfy9m0006spbbrj47sn6z', '{\"Full Name\":\"RUSSEL ESTABAYA ESCULTURA\",\"Email Address\":\"russelescultura4@gmail.com\",\"Upload your Image\":\"/uploads/submissions/Upload your Image-1756882439393-images (3).jpeg\"}', NULL, NULL, 'REJECTED', '2025-09-03 06:53:59.472', '2025-09-03 07:00:20.475', 'sample user', 'Documents are unclear or illegible', 'cmf3lotr20004spbba8ap87p3', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `locations`
--

CREATE TABLE `locations` (
  `id` varchar(191) NOT NULL,
  `name` varchar(191) NOT NULL,
  `description` text DEFAULT NULL,
  `address` varchar(191) DEFAULT NULL,
  `latitude` double NOT NULL,
  `longitude` double NOT NULL,
  `type` enum('SCHOOL','GOVERNMENT','HEALTH','COMMERCIAL','SPORTS','RELIGIOUS','EMERGENCY','RESIDENTIAL','RECREATION','GYMNASIUM') NOT NULL,
  `isActive` tinyint(1) NOT NULL DEFAULT 1,
  `createdAt` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `updatedAt` datetime(3) NOT NULL,
  `image` varchar(191) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `locations`
--

INSERT INTO `locations` (`id`, `name`, `description`, `address`, `latitude`, `longitude`, `type`, `isActive`, `createdAt`, `updatedAt`, `image`) VALUES
('cmdvsgoh700023nqjyyjmfjcb', 'Gynamsium', 'Gynamsium', NULL, 12.87289038781579, 124.0079963207245, 'GOVERNMENT', 1, '2025-08-03 14:40:39.403', '2025-08-19 05:47:20.194', '/uploads/locations/location-1754232039322.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `programs`
--

CREATE TABLE `programs` (
  `id` varchar(191) NOT NULL,
  `title` varchar(191) NOT NULL,
  `objectives` text NOT NULL,
  `startDate` datetime(3) NOT NULL,
  `endDate` datetime(3) NOT NULL,
  `targetAudience` varchar(191) NOT NULL,
  `status` enum('ONGOING','COMPLETED','CANCELLED') NOT NULL DEFAULT 'ONGOING',
  `createdAt` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `updatedAt` datetime(3) NOT NULL,
  `budget` double DEFAULT NULL,
  `category` varchar(255) DEFAULT NULL,
  `schedule` text NOT NULL,
  `benefits` text NOT NULL,
  `venue` varchar(255) DEFAULT NULL,
  `schedule_type` enum('ONE_TIME','RECURRING') DEFAULT 'RECURRING',
  `start_time` varchar(5) DEFAULT NULL,
  `end_time` varchar(5) DEFAULT NULL,
  `frequency` enum('DAILY','WEEKLY','BI_WEEKLY','MONTHLY','CUSTOM') DEFAULT NULL,
  `frequency_interval` int(11) DEFAULT 1,
  `days_of_week` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`days_of_week`)),
  `timezone` varchar(50) DEFAULT 'Asia/Manila',
  `schedule_exceptions` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`schedule_exceptions`))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `programs`
--

INSERT INTO `programs` (`id`, `title`, `objectives`, `startDate`, `endDate`, `targetAudience`, `status`, `createdAt`, `updatedAt`, `budget`, `category`, `schedule`, `benefits`, `venue`, `schedule_type`, `start_time`, `end_time`, `frequency`, `frequency_interval`, `days_of_week`, `timezone`, `schedule_exceptions`) VALUES
('cmf3kyxwv0000spbb33nhr9mm', 'Youth Leadership and Sports Development Program', 'Promote leadership skills among youth.', '2025-09-01 00:00:00.000', '2025-09-30 00:00:00.000', 'Youth age 15-30', 'ONGOING', '2025-09-03 06:12:46.250', '2025-09-03 06:12:46.250', 50000, 'Leadership', '', '• Leadership skills development\n• Community service experience\n• Team management experience', 'Gynamsium', 'RECURRING', '17:00', '19:00', 'WEEKLY', 1, '[\"SATURDAY\",\"SUNDAY\"]', 'Asia/Manila', '[]');

-- --------------------------------------------------------

--
-- Table structure for table `revenues`
--

CREATE TABLE `revenues` (
  `id` varchar(191) NOT NULL,
  `title` varchar(191) NOT NULL,
  `description` text DEFAULT NULL,
  `amount` double NOT NULL,
  `source` enum('MANUAL','GCASH') NOT NULL DEFAULT 'MANUAL',
  `date` datetime(3) NOT NULL,
  `receipt` varchar(191) DEFAULT NULL,
  `status` enum('PENDING','APPROVED','REJECTED') NOT NULL DEFAULT 'PENDING',
  `programId` varchar(191) NOT NULL,
  `formSubmissionId` varchar(191) DEFAULT NULL,
  `createdAt` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `updatedAt` datetime(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sk_members`
--

CREATE TABLE `sk_members` (
  `id` varchar(191) NOT NULL,
  `name` varchar(191) NOT NULL,
  `email` varchar(191) NOT NULL,
  `phone` varchar(191) NOT NULL,
  `role` enum('SK_CHAIRMAN','SK_VICE_CHAIRMAN','SK_SECRETARY','SK_TREASURER','SK_COUNCILOR','SK_YOUTH_REPRESENTATIVE') NOT NULL,
  `status` enum('ACTIVE','INACTIVE','SUSPENDED') NOT NULL DEFAULT 'ACTIVE',
  `department` varchar(191) NOT NULL,
  `position` varchar(191) NOT NULL,
  `location` varchar(191) NOT NULL,
  `skills` text DEFAULT NULL,
  `profileImage` varchar(191) DEFAULT NULL,
  `lastActive` datetime(3) DEFAULT NULL,
  `performance` text DEFAULT NULL,
  `projects` text DEFAULT NULL,
  `achievements` text DEFAULT NULL,
  `joinDate` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `createdAt` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `updatedAt` datetime(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sk_members`
--

INSERT INTO `sk_members` (`id`, `name`, `email`, `phone`, `role`, `status`, `department`, `position`, `location`, `skills`, `profileImage`, `lastActive`, `performance`, `projects`, `achievements`, `joinDate`, `createdAt`, `updatedAt`) VALUES
('cmdxcq7pg0002brmemqdu75s4', 'Juan Dela Cruz', 'juan.delacruz@example.com', '09171234567', 'SK_CHAIRMAN', 'ACTIVE', 'SK Executive Board', 'Chairperson', 'Barangay Tulay, Casiguran', '[]', '/uploads/profile/profile-1754326768894.jpeg', '2025-08-04 16:59:31.979', NULL, NULL, NULL, '2025-08-04 16:55:42.720', '2025-08-04 16:55:42.723', '2025-08-04 16:59:31.982'),
('cmdxd3gea0003brmeimqdxdk3', 'Maria Santos', 'maria.santos@example.com', '09182345678', 'SK_SECRETARY', 'ACTIVE', 'Community Programs', 'Committee Chair on Community Programs', 'Barangay Tulay, Casiguran', '[]', '/uploads/profile/profile-1754327117122.jpg', '2025-08-04 17:06:00.507', NULL, NULL, NULL, '2025-08-04 17:06:00.507', '2025-08-04 17:06:00.511', '2025-08-04 17:06:00.511'),
('cmdxd4zv30004brme4a28u4br', 'Ana Mendoza', 'ana.mendoza@example.com', '09164567890', 'SK_TREASURER', 'ACTIVE', 'Finance', 'Treasurer', 'Barangay Tulay, Casiguran', '[]', '/uploads/profile/profile-1754327242022.jpg', '2025-08-04 17:07:25.072', NULL, NULL, NULL, '2025-08-04 17:07:12.396', '2025-08-04 17:07:12.398', '2025-08-04 17:07:25.074'),
('cmdxd6cgw0005brme458u0lg6', 'Jose Ramirez', 'jose.ramirez@example.com', '09203456789', 'SK_COUNCILOR', 'ACTIVE', 'Sports & Youth Development', 'Committee Chair on Sports', 'Barangay Tulay, Casiguran', '[]', '/uploads/profile/profile-1754327304046.jpg', '2025-08-04 17:08:25.770', NULL, NULL, NULL, '2025-08-04 17:08:15.390', '2025-08-04 17:08:15.392', '2025-08-04 17:08:25.773'),
('cme1056sr0000851h20puej9y', 'Carlos Bautista', 'carlos.bautista@example.com', '09277890123', 'SK_COUNCILOR', 'ACTIVE', 'Peace & Order', 'Committee Chair on Peace and Order', 'Barangay Tulay, Casiguran', '[]', '/uploads/profile/profile-1754547229005.jpg', '2025-08-07 06:14:31.070', NULL, NULL, NULL, '2025-08-07 06:14:31.070', '2025-08-07 06:14:31.077', '2025-08-07 06:14:31.077'),
('cme107yee0001851h7hxx6fij', 'Mark Salazar', 'mark.salazar@example.com', '09309012345', 'SK_COUNCILOR', 'ACTIVE', 'Livelihood Programs', 'SK Councilor', 'Barangay Tulay, Casiguran', '[]', '/uploads/profile/profile-1754547409221.jpeg', '2025-08-07 06:16:53.612', NULL, NULL, NULL, '2025-08-07 06:16:40.161', '2025-08-07 06:16:40.166', '2025-08-07 06:16:53.615'),
('cme10cvel0002851h0ym6gayw', 'Ronald Villanueva', 'ronald.villanueva@example.com', '09101234567', 'SK_COUNCILOR', 'ACTIVE', 'Community Relations', 'Public Affairs', 'Barangay Tulay, Casiguran', '[]', '/uploads/profile/profile-1754547636731.jpg', '2025-08-07 06:20:38.540', NULL, NULL, NULL, '2025-08-07 06:20:29.558', '2025-08-07 06:20:29.561', '2025-08-07 06:20:38.543'),
('cme10ed780003851heykokoyf', 'Francis Lopez', 'francis.lopez@example.com', '09451234567', 'SK_COUNCILOR', 'ACTIVE', 'Project Manager', 'Infrastructure', 'Barangay Tulay, Casiguran', '[]', '/uploads/profile/profile-1754547697657.jpeg', '2025-08-07 06:21:39.281', NULL, NULL, NULL, '2025-08-07 06:21:39.281', '2025-08-07 06:21:39.284', '2025-08-07 06:21:39.284'),
('cme10fvc90004851hvbl8h39b', 'Bryan Santos', 'bryan.santos@example.com', '098678678768', 'SK_COUNCILOR', 'ACTIVE', 'Health', 'Barangay Health Worker', 'Barangay Tulay, Casiguran', '[]', '/uploads/profile/profile-1754547730312.jpeg', '2025-08-07 06:22:49.446', '0', '0', '0', '2025-08-07 06:22:49.446', '2025-08-07 06:22:49.449', '2025-08-20 13:57:21.000');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` varchar(191) NOT NULL,
  `email` varchar(191) NOT NULL,
  `name` varchar(191) DEFAULT NULL,
  `role` enum('ADMIN','USER') NOT NULL DEFAULT 'USER',
  `profileImage` varchar(191) DEFAULT NULL,
  `createdAt` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `updatedAt` datetime(3) NOT NULL,
  `password` varchar(191) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `email`, `name`, `role`, `profileImage`, `createdAt`, `updatedAt`, `password`) VALUES
('cmdvwocmm00005u04ci2gg6yz', 'sampleuser@gmail.com', 'sample user', 'ADMIN', '/images/profiles/profile-1754239219134.jpeg', '2025-08-03 16:38:35.757', '2025-08-20 06:06:42.208', '$2b$12$wkXbGvExDcLAZtZdBLv/.ewARoB/GlJ8iRMwb.igmUQllxMaMy5bO');

-- --------------------------------------------------------

--
-- Table structure for table `youth_profiles`
--

CREATE TABLE `youth_profiles` (
  `id` int(11) NOT NULL,
  `trackingId` varchar(191) NOT NULL,
  `fullName` varchar(191) NOT NULL,
  `dateOfBirth` datetime(3) NOT NULL,
  `age` int(11) NOT NULL,
  `sex` varchar(191) NOT NULL,
  `civilStatus` varchar(191) NOT NULL DEFAULT 'Single',
  `profilePicture` varchar(191) DEFAULT NULL,
  `mobileNumber` varchar(191) NOT NULL,
  `emailAddress` varchar(191) DEFAULT NULL,
  `barangay` varchar(191) NOT NULL,
  `streetAddress` varchar(191) NOT NULL,
  `educationLevel` varchar(191) NOT NULL,
  `gradeLevel` varchar(191) DEFAULT NULL,
  `schoolName` varchar(191) NOT NULL,
  `courseStrand` varchar(191) DEFAULT NULL,
  `isGraduated` tinyint(1) NOT NULL DEFAULT 0,
  `lastSchoolYear` varchar(191) DEFAULT NULL,
  `skills` text NOT NULL,
  `hobbies` text NOT NULL,
  `preferredPrograms` text NOT NULL,
  `isEmployed` tinyint(1) NOT NULL DEFAULT 0,
  `occupation` varchar(191) DEFAULT NULL,
  `workingHours` varchar(191) DEFAULT NULL,
  `skMembership` tinyint(1) NOT NULL DEFAULT 0,
  `volunteerExperience` text NOT NULL,
  `leadershipRoles` text NOT NULL,
  `isPWD` tinyint(1) NOT NULL DEFAULT 0,
  `pwdType` varchar(191) DEFAULT NULL,
  `indigenousGroup` varchar(191) DEFAULT NULL,
  `isSoloParent` tinyint(1) NOT NULL DEFAULT 0,
  `specialCases` text DEFAULT NULL,
  `emergencyContactPerson` varchar(191) DEFAULT NULL,
  `emergencyContactNumber` varchar(191) DEFAULT NULL,
  `emergencyRelationship` varchar(191) DEFAULT NULL,
  `latitude` double DEFAULT NULL,
  `longitude` double DEFAULT NULL,
  `status` varchar(191) NOT NULL DEFAULT 'Active',
  `committee` varchar(191) NOT NULL,
  `participation` int(11) NOT NULL DEFAULT 0,
  `dateOfRegistration` varchar(191) NOT NULL,
  `lastActivity` varchar(191) NOT NULL,
  `createdAt` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `updatedAt` datetime(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `youth_profiles`
--

INSERT INTO `youth_profiles` (`id`, `trackingId`, `fullName`, `dateOfBirth`, `age`, `sex`, `civilStatus`, `profilePicture`, `mobileNumber`, `emailAddress`, `barangay`, `streetAddress`, `educationLevel`, `gradeLevel`, `schoolName`, `courseStrand`, `isGraduated`, `lastSchoolYear`, `skills`, `hobbies`, `preferredPrograms`, `isEmployed`, `occupation`, `workingHours`, `skMembership`, `volunteerExperience`, `leadershipRoles`, `isPWD`, `pwdType`, `indigenousGroup`, `isSoloParent`, `specialCases`, `emergencyContactPerson`, `emergencyContactNumber`, `emergencyRelationship`, `latitude`, `longitude`, `status`, `committee`, `participation`, `dateOfRegistration`, `lastActivity`, `createdAt`, `updatedAt`) VALUES
(3, 'SK-2025-8414', 'Russel Escultura', '2001-02-19 00:00:00.000', 24, 'Male', 'Single', '/uploads/submissions/Profile Picture (2x2)-1754639836919.jpeg', '09786756756', 'russelescultura4@gmail.com', 'Casiguran Tulay', 'tulay casiguran sorsogn', 'Graduate School', '4rth year', 'CCDI', 'N/a', 1, '2023-2024', 'Computer Literate', 'Singing Reading and Coding', 'Sports', 0, 'N/a', NULL, 0, 'School President', 'School President', 0, 'N/a', 'N/a', 0, NULL, 'Ronald Escultura Sr.', '0978787877', 'Father', 12.87337150987239, 124.0054374933243, 'Active', 'Sports', 0, '2025-08-08', '2025-08-08', '2025-08-08 08:04:09.494', '2025-08-08 08:14:31.824');

-- --------------------------------------------------------

--
-- Table structure for table `_eventassignments`
--

CREATE TABLE `_eventassignments` (
  `A` varchar(191) NOT NULL,
  `B` varchar(191) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `_prisma_migrations`
--

CREATE TABLE `_prisma_migrations` (
  `id` varchar(36) NOT NULL,
  `checksum` varchar(64) NOT NULL,
  `finished_at` datetime(3) DEFAULT NULL,
  `migration_name` varchar(255) NOT NULL,
  `logs` text DEFAULT NULL,
  `rolled_back_at` datetime(3) DEFAULT NULL,
  `started_at` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `applied_steps_count` int(10) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `_prisma_migrations`
--

INSERT INTO `_prisma_migrations` (`id`, `checksum`, `finished_at`, `migration_name`, `logs`, `rolled_back_at`, `started_at`, `applied_steps_count`) VALUES
('3cd9d815-236a-4b31-b298-55a51dd88428', 'df8d4be09850e5c996b28859be9817b2e5868bc309665b663066409af6344e37', '2025-08-03 11:36:13.535', '20250802150652_add_end_datetime_to_events', NULL, NULL, '2025-08-03 11:36:13.520', 1),
('87b1763f-c8fe-4e54-8f9a-5f56557e5676', 'e66bcdc97a1c0af18c698ac45a9f16e6e2a9c09b3288d43212f2a5457ea848db', NULL, '20250803101410_add_location_coordinates', 'A migration failed to apply. New migrations cannot be applied before the error is recovered from. Read more about how to resolve migration issues in a production database: https://pris.ly/d/migrate-resolve\n\nMigration name: 20250803101410_add_location_coordinates\n\nDatabase error code: 1061\n\nDatabase error:\nDuplicate key name \'_eventassignments_AB_unique\'\n\nPlease check the query number 9 from the migration file.\n\n   0: sql_schema_connector::apply_migration::apply_script\n           with migration_name=\"20250803101410_add_location_coordinates\"\n             at schema-engine\\connectors\\sql-schema-connector\\src\\apply_migration.rs:106\n   1: schema_core::commands::apply_migrations::Applying migration\n           with migration_name=\"20250803101410_add_location_coordinates\"\n             at schema-engine\\core\\src\\commands\\apply_migrations.rs:91\n   2: schema_core::state::ApplyMigrations\n             at schema-engine\\core\\src\\state.rs:226', NULL, '2025-08-03 11:36:13.559', 0),
('cb185185-d5b9-467d-974a-afa1b898e4b7', '8514315697e01b5021abb1e96c562badcece7f0a033ec44a6df16f1bccc25324', '2025-08-03 11:36:13.516', '20250731122801_add_sk_program_management', NULL, NULL, '2025-08-03 11:36:13.075', 1),
('fd7eb107-9692-4ae1-9c75-c13f7724e180', '9832d711a67fccc02b4fc2e594000f470b7510f81e5c4c1469a614e7e449d19f', '2025-08-03 11:36:13.554', '20250802_add_locations', NULL, NULL, '2025-08-03 11:36:13.538', 1);

-- --------------------------------------------------------

--
-- Table structure for table `_programassignments`
--

CREATE TABLE `_programassignments` (
  `A` varchar(191) NOT NULL,
  `B` varchar(191) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `content`
--
ALTER TABLE `content`
  ADD PRIMARY KEY (`id`),
  ADD KEY `content_authorId_fkey` (`authorId`);

--
-- Indexes for table `events`
--
ALTER TABLE `events`
  ADD PRIMARY KEY (`id`),
  ADD KEY `events_programId_fkey` (`programId`);

--
-- Indexes for table `expenses`
--
ALTER TABLE `expenses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `expenses_programId_fkey` (`programId`);

--
-- Indexes for table `forms`
--
ALTER TABLE `forms`
  ADD PRIMARY KEY (`id`),
  ADD KEY `forms_eventId_fkey` (`eventId`);

--
-- Indexes for table `form_submissions`
--
ALTER TABLE `form_submissions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `form_submissions_formId_fkey` (`formId`),
  ADD KEY `form_submissions_userId_fkey` (`userId`);

--
-- Indexes for table `locations`
--
ALTER TABLE `locations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `programs`
--
ALTER TABLE `programs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_programs_schedule_type` (`schedule_type`),
  ADD KEY `idx_programs_frequency` (`frequency`);

--
-- Indexes for table `revenues`
--
ALTER TABLE `revenues`
  ADD PRIMARY KEY (`id`),
  ADD KEY `revenues_programId_fkey` (`programId`),
  ADD KEY `revenues_formSubmissionId_fkey` (`formSubmissionId`);

--
-- Indexes for table `sk_members`
--
ALTER TABLE `sk_members`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `sk_members_email_key` (`email`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_key` (`email`);

--
-- Indexes for table `youth_profiles`
--
ALTER TABLE `youth_profiles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `youth_profiles_trackingId_key` (`trackingId`);

--
-- Indexes for table `_eventassignments`
--
ALTER TABLE `_eventassignments`
  ADD UNIQUE KEY `_eventassignments_AB_unique` (`A`,`B`),
  ADD KEY `_eventassignments_B_index` (`B`);

--
-- Indexes for table `_prisma_migrations`
--
ALTER TABLE `_prisma_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `_programassignments`
--
ALTER TABLE `_programassignments`
  ADD UNIQUE KEY `_programassignments_AB_unique` (`A`,`B`),
  ADD KEY `_programassignments_B_index` (`B`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `youth_profiles`
--
ALTER TABLE `youth_profiles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `content`
--
ALTER TABLE `content`
  ADD CONSTRAINT `content_authorId_fkey` FOREIGN KEY (`authorId`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `events`
--
ALTER TABLE `events`
  ADD CONSTRAINT `events_programId_fkey` FOREIGN KEY (`programId`) REFERENCES `programs` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `expenses`
--
ALTER TABLE `expenses`
  ADD CONSTRAINT `expenses_programId_fkey` FOREIGN KEY (`programId`) REFERENCES `programs` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `forms`
--
ALTER TABLE `forms`
  ADD CONSTRAINT `forms_eventId_fkey` FOREIGN KEY (`eventId`) REFERENCES `events` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `form_submissions`
--
ALTER TABLE `form_submissions`
  ADD CONSTRAINT `form_submissions_formId_fkey` FOREIGN KEY (`formId`) REFERENCES `forms` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `form_submissions_userId_fkey` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `revenues`
--
ALTER TABLE `revenues`
  ADD CONSTRAINT `revenues_formSubmissionId_fkey` FOREIGN KEY (`formSubmissionId`) REFERENCES `form_submissions` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `revenues_programId_fkey` FOREIGN KEY (`programId`) REFERENCES `programs` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `_eventassignments`
--
ALTER TABLE `_eventassignments`
  ADD CONSTRAINT `_eventassignments_A_fkey` FOREIGN KEY (`A`) REFERENCES `events` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `_eventassignments_B_fkey` FOREIGN KEY (`B`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `_programassignments`
--
ALTER TABLE `_programassignments`
  ADD CONSTRAINT `_programassignments_A_fkey` FOREIGN KEY (`A`) REFERENCES `programs` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `_programassignments_B_fkey` FOREIGN KEY (`B`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
