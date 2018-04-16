-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Apr 11, 2018 at 03:00 PM
-- Server version: 5.7.21-0ubuntu0.16.04.1
-- PHP Version: 5.6.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `mrbs_original`
--

-- --------------------------------------------------------

--
-- Table structure for table `mrbs_area`
--

CREATE TABLE `mrbs_area` (
  `id` int(11) NOT NULL,
  `disabled` tinyint(1) NOT NULL DEFAULT '0',
  `area_name` varchar(30) DEFAULT NULL,
  `sort_key` varchar(30) NOT NULL DEFAULT '',
  `timezone` varchar(50) DEFAULT NULL,
  `area_admin_email` text,
  `resolution` int(11) DEFAULT NULL,
  `default_duration` int(11) DEFAULT NULL,
  `default_duration_all_day` tinyint(1) NOT NULL DEFAULT '0',
  `morningstarts` int(11) DEFAULT NULL,
  `morningstarts_minutes` int(11) DEFAULT NULL,
  `eveningends` int(11) DEFAULT NULL,
  `eveningends_minutes` int(11) DEFAULT NULL,
  `private_enabled` tinyint(1) DEFAULT NULL,
  `private_default` tinyint(1) DEFAULT NULL,
  `private_mandatory` tinyint(1) DEFAULT NULL,
  `private_override` varchar(32) DEFAULT NULL,
  `min_create_ahead_enabled` tinyint(1) DEFAULT NULL,
  `min_create_ahead_secs` int(11) DEFAULT NULL,
  `max_create_ahead_enabled` tinyint(1) DEFAULT NULL,
  `max_create_ahead_secs` int(11) DEFAULT NULL,
  `min_delete_ahead_enabled` tinyint(1) DEFAULT NULL,
  `min_delete_ahead_secs` int(11) DEFAULT NULL,
  `max_delete_ahead_enabled` tinyint(1) DEFAULT NULL,
  `max_delete_ahead_secs` int(11) DEFAULT NULL,
  `max_per_day_enabled` tinyint(1) NOT NULL DEFAULT '0',
  `max_per_day` int(11) NOT NULL DEFAULT '0',
  `max_per_week_enabled` tinyint(1) NOT NULL DEFAULT '0',
  `max_per_week` int(11) NOT NULL DEFAULT '0',
  `max_per_month_enabled` tinyint(1) NOT NULL DEFAULT '0',
  `max_per_month` int(11) NOT NULL DEFAULT '0',
  `max_per_year_enabled` tinyint(1) NOT NULL DEFAULT '0',
  `max_per_year` int(11) NOT NULL DEFAULT '0',
  `max_per_future_enabled` tinyint(1) NOT NULL DEFAULT '0',
  `max_per_future` int(11) NOT NULL DEFAULT '0',
  `max_duration_enabled` tinyint(1) NOT NULL DEFAULT '0',
  `max_duration_secs` int(11) NOT NULL DEFAULT '0',
  `max_duration_periods` int(11) NOT NULL DEFAULT '0',
  `custom_html` text,
  `approval_enabled` tinyint(1) DEFAULT NULL,
  `reminders_enabled` tinyint(1) DEFAULT NULL,
  `enable_periods` tinyint(1) DEFAULT NULL,
  `confirmation_enabled` tinyint(1) DEFAULT NULL,
  `confirmed_default` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `mrbs_area`
--

INSERT INTO `mrbs_area` (`id`, `disabled`, `area_name`, `sort_key`, `timezone`, `area_admin_email`, `resolution`, `default_duration`, `default_duration_all_day`, `morningstarts`, `morningstarts_minutes`, `eveningends`, `eveningends_minutes`, `private_enabled`, `private_default`, `private_mandatory`, `private_override`, `min_create_ahead_enabled`, `min_create_ahead_secs`, `max_create_ahead_enabled`, `max_create_ahead_secs`, `min_delete_ahead_enabled`, `min_delete_ahead_secs`, `max_delete_ahead_enabled`, `max_delete_ahead_secs`, `max_per_day_enabled`, `max_per_day`, `max_per_week_enabled`, `max_per_week`, `max_per_month_enabled`, `max_per_month`, `max_per_year_enabled`, `max_per_year`, `max_per_future_enabled`, `max_per_future`, `max_duration_enabled`, `max_duration_secs`, `max_duration_periods`, `custom_html`, `approval_enabled`, `reminders_enabled`, `enable_periods`, `confirmation_enabled`, `confirmed_default`) VALUES
(1, 0, 'AC (Academic Complex)', 'AC', 'Asia/Kolkata', '', 1800, 3600, 0, 7, 0, 18, 30, 0, 0, 0, 'none', 0, 0, 0, 604800, 0, 0, 0, 604800, 0, 1, 0, 5, 0, 10, 0, 50, 0, 100, 0, 7200, 2, '', 1, 1, 0, 1, 0),
(2, 0, 'Entc Extension Building', 'Entc Extension Building', 'Asia/Kolkata', '', 1800, 3600, 0, 7, 0, 18, 30, 0, 0, 0, 'none', 0, 0, 0, 604800, 0, 0, 0, 604800, 0, 1, 0, 5, 0, 10, 0, 50, 0, 100, 0, 7200, 2, '', 1, 1, 0, 1, 1),
(3, 0, 'Main Building', 'Main Building', 'Asia/Kolkata', '', 1800, 3600, 0, 7, 0, 18, 30, 0, 0, 0, 'none', 0, 0, 0, 604800, 0, 0, 0, 604800, 0, 1, 0, 5, 0, 10, 0, 50, 0, 100, 0, 7200, 2, '', 1, 1, 0, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `mrbs_entry`
--

CREATE TABLE `mrbs_entry` (
  `id` int(11) NOT NULL,
  `start_time` int(11) NOT NULL DEFAULT '0',
  `end_time` int(11) NOT NULL DEFAULT '0',
  `entry_type` int(11) NOT NULL DEFAULT '0',
  `repeat_id` int(11) DEFAULT NULL,
  `room_id` int(11) NOT NULL DEFAULT '1',
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `create_by` varchar(80) NOT NULL DEFAULT '',
  `modified_by` varchar(80) NOT NULL DEFAULT '',
  `name` varchar(80) NOT NULL DEFAULT '',
  `type` char(1) NOT NULL DEFAULT 'E',
  `description` text,
  `speakers` tinytext,
  `status` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `reminded` int(11) DEFAULT NULL,
  `info_time` int(11) DEFAULT NULL,
  `info_user` varchar(80) DEFAULT NULL,
  `info_text` text,
  `ical_uid` varchar(255) NOT NULL DEFAULT '',
  `ical_sequence` smallint(6) NOT NULL DEFAULT '0',
  `ical_recur_id` varchar(16) DEFAULT NULL,
  `students_attended` int(11) DEFAULT NULL,
  `event_report` text,
  `image_path` varchar(200) DEFAULT NULL,
  `club_name` varchar(64) DEFAULT NULL,
  `club_secretary` varchar(64) DEFAULT NULL,
  `secretary_contact` bigint(12) DEFAULT NULL,
  `secretary_email` varchar(50) DEFAULT NULL,
  `contact_details` bigint(12) DEFAULT NULL,
  `user_email` varchar(50) DEFAULT NULL,
  `facad_contact` bigint(12) DEFAULT NULL,
  `approved_facad` smallint(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `mrbs_entry`
--

INSERT INTO `mrbs_entry` (`id`, `start_time`, `end_time`, `entry_type`, `repeat_id`, `room_id`, `timestamp`, `create_by`, `modified_by`, `name`, `type`, `description`, `speakers`, `status`, `reminded`, `info_time`, `info_user`, `info_text`, `ical_uid`, `ical_sequence`, `ical_recur_id`, `students_attended`, `event_report`, `image_path`, `club_name`, `club_secretary`, `secretary_contact`, `secretary_email`, `contact_details`, `user_email`, `facad_contact`, `approved_facad`) VALUES
(3, 1506907800, 1506951000, 0, NULL, 7, '2018-04-11 07:28:12', 'rohit', '', 'Linux Workshop', 'F', 'To conduct a Foss Linux Workshop of Debian Packaging and OS concepts.', NULL, 2, NULL, NULL, NULL, NULL, 'MRBS-59d1e2016d30f-d8dea7ff@localhost', 0, NULL, NULL, NULL, NULL, 'a', 'parag', 345, 'asdf', 123, 'saf', 213, 1),
(4, 1506994200, 1506997800, 0, NULL, 8, '2018-04-11 07:27:57', 'aditya', '', 'Webcalendar Project Meet', 'F', 'To show prototype of Webcalendar Project', NULL, 4, NULL, NULL, NULL, NULL, 'MRBS-59d1e309436b8-f36a9bcf@localhost', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(6, 1506857400, 1506861000, 0, NULL, 8, '2018-04-11 07:22:55', 'rohit', 'rohit', 'SDS Meet', 'I', 'To discuss about projects and hackathons', NULL, 4, NULL, NULL, NULL, NULL, 'MRBS-59d1def61ee76-8d2f2c27@localhost', 3, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(7, 1507181400, 1507185000, 0, NULL, 1, '2018-04-11 07:24:47', 'aditya', '', 'Extra Lecture(PSC)', 'I', 'Extra lecture is scheduled to catch up with syllabus.', NULL, 8, NULL, NULL, NULL, NULL, 'MRBS-59d65883f11ae-0b7faad1@localhost', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(9, 1507170600, 1507174200, 0, NULL, 8, '2018-04-07 06:21:07', 'rohit', '', 'Event 1', 'I', 'An Event', NULL, 4, NULL, NULL, NULL, NULL, 'MRBS-59d872532fb53-d6b51230@localhost', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(10, 1507179600, 1507190400, 0, NULL, 9, '2018-04-11 07:23:04', 'aditya', '', 'Impressions', 'I', 'Coep\'s Annual Cultural Festival.', NULL, 0, NULL, NULL, NULL, NULL, 'MRBS-59d8b20dac0a0-f1aa2d20@localhost', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(11, 1507181400, 1507188600, 0, NULL, 5, '2018-04-30 10:53:58', 'rohit', '', 'Placements and Internship', 'I', 'Schlumberger Pre Placement Talk', NULL, 4, NULL, NULL, NULL, NULL, 'MRBS-59d8b24693afb-cc70809d@localhost', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(12, 1507289400, 1507296600, 0, NULL, 9, '2018-04-22 11:54:35', 'rohit', 'rohit', 'ZEST\'18 Inaug', 'I', 'Coep annual sports festival ZEST 2018 Inauguration function.', NULL, 4, NULL, NULL, NULL, NULL, 'MRBS-59d658d683bff-433a5e7d@localhost', 1, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(13, 1507609800, 1507613400, 0, NULL, 2, '2018-04-11 07:23:11', 'aditya', '', 'A tentative event', 'I', 'An event which needs to be approved by admin', NULL, 4, NULL, NULL, NULL, NULL, 'MRBS-59da35a722ef6-bc853eef@localhost', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(14, 1523507400, 1523511000, 0, NULL, 4, '2018-04-11 07:11:44', 'aditya', '', 'SDS Meet', 'F', 'Final meet of members', 'No Speaker', 0, NULL, NULL, NULL, NULL, 'MRBS-5acdb53074cc4-7dc2ef80@localhost', 0, NULL, NULL, NULL, '', 'a', 'Parag Verma', 9988776655, 'parag@gmail.com', 7744904623, 'aj@gmail.com', 4455667788, 1),
(15, 1523583000, 1523586600, 0, NULL, 5, '2018-04-11 07:15:17', 'aditya', '', 'SDS get together', 'F', 'Party', 'No speaker', 0, NULL, NULL, NULL, NULL, 'MRBS-5acdb6057782e-9871232a@localhost', 0, NULL, NULL, NULL, '', 'a', 'Parag Verma', 9955778899, 'adf', 8899, 'dfan', 6677, 1),
(17, 1523755800, 1523759400, 0, NULL, 1, '2018-04-11 07:18:05', 'rohit', '', 'sfaj', 'F', 'sfaj', 'nsjasg', 2, NULL, NULL, NULL, NULL, 'MRBS-5acdb6ad026c1-656df773@localhost', 0, NULL, NULL, NULL, '', 'a', 'jdb', 4378, 'jdbfak', 24896, 'djgj', 48658, 1);

-- --------------------------------------------------------

--
-- Table structure for table `mrbs_repeat`
--

CREATE TABLE `mrbs_repeat` (
  `id` int(11) NOT NULL,
  `start_time` int(11) NOT NULL DEFAULT '0',
  `end_time` int(11) NOT NULL DEFAULT '0',
  `rep_type` int(11) NOT NULL DEFAULT '0',
  `end_date` int(11) NOT NULL DEFAULT '0',
  `rep_opt` varchar(32) NOT NULL DEFAULT '',
  `room_id` int(11) NOT NULL DEFAULT '1',
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `create_by` varchar(80) NOT NULL DEFAULT '',
  `modified_by` varchar(80) NOT NULL DEFAULT '',
  `name` varchar(80) NOT NULL DEFAULT '',
  `type` char(1) NOT NULL DEFAULT 'E',
  `description` text,
  `speakers` tinytext,
  `rep_num_weeks` smallint(6) DEFAULT NULL,
  `month_absolute` smallint(6) DEFAULT NULL,
  `month_relative` varchar(4) DEFAULT NULL,
  `status` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `reminded` int(11) DEFAULT NULL,
  `info_time` int(11) DEFAULT NULL,
  `info_user` varchar(80) DEFAULT NULL,
  `info_text` text,
  `ical_uid` varchar(255) NOT NULL DEFAULT '',
  `ical_sequence` smallint(6) NOT NULL DEFAULT '0',
  `students_attended` int(11) DEFAULT NULL,
  `event_report` text,
  `image_path` varchar(200) DEFAULT NULL,
  `club_name` varchar(64) DEFAULT NULL,
  `club_secretary` varchar(64) DEFAULT NULL,
  `secretary_contact` bigint(12) DEFAULT NULL,
  `secretary_email` varchar(50) DEFAULT NULL,
  `contact_details` bigint(12) DEFAULT NULL,
  `user_email` varchar(50) DEFAULT NULL,
  `facad_contact` bigint(12) DEFAULT NULL,
  `approved_facad` smallint(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `mrbs_room`
--

CREATE TABLE `mrbs_room` (
  `id` int(11) NOT NULL,
  `disabled` tinyint(1) NOT NULL DEFAULT '0',
  `area_id` int(11) NOT NULL DEFAULT '0',
  `room_name` varchar(25) NOT NULL DEFAULT '',
  `sort_key` varchar(25) NOT NULL DEFAULT '',
  `description` varchar(60) DEFAULT NULL,
  `capacity` int(11) NOT NULL DEFAULT '0',
  `room_admin_email` text,
  `custom_html` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `mrbs_room`
--

INSERT INTO `mrbs_room` (`id`, `disabled`, `area_id`, `room_name`, `sort_key`, `description`, `capacity`, `room_admin_email`, `custom_html`) VALUES
(1, 0, 1, 'AC101', 'AC101', 'Academic Complex Classroom', 80, '', NULL),
(2, 0, 1, 'AC102', 'AC102', 'Academic Complex Classroom', 80, '', NULL),
(3, 0, 1, 'AC103', 'AC103', 'Academic Complex Classroom', 80, '', NULL),
(4, 0, 1, 'AC201', 'AC201', 'Academic Complex Classroom', 80, '', NULL),
(5, 0, 1, 'Mini Audi', 'Mini Audi', 'Mini Auditorium', 120, '', NULL),
(6, 0, 2, 'Seminar Hall', 'Seminar Hall', 'Seminar Hall', 80, '', NULL),
(7, 0, 2, 'FOSS Lab', 'FOSS Lab', 'Free and open source laboratory', 50, '', NULL),
(8, 0, 2, 'Data Mining Lab', 'Data Mining Lab', 'Data Mining Lab', 30, '', NULL),
(9, 0, 3, 'Main Audi', 'Main Audi', 'Main Auditorium', 200, '', NULL),
(10, 0, 3, 'Seminar Hall 2', 'Seminar Hall 2', 'Seminar Hall 2', 60, '', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `mrbs_users`
--

CREATE TABLE `mrbs_users` (
  `id` int(11) NOT NULL,
  `level` smallint(6) NOT NULL DEFAULT '0',
  `name` varchar(30) DEFAULT NULL,
  `password_hash` varchar(255) DEFAULT NULL,
  `email` varchar(75) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `mrbs_variables`
--

CREATE TABLE `mrbs_variables` (
  `id` int(11) NOT NULL,
  `variable_name` varchar(80) DEFAULT NULL,
  `variable_content` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `mrbs_variables`
--

INSERT INTO `mrbs_variables` (`id`, `variable_name`, `variable_content`) VALUES
(1, 'db_version', '49'),
(2, 'local_db_version', '1');

-- --------------------------------------------------------

--
-- Table structure for table `mrbs_zoneinfo`
--

CREATE TABLE `mrbs_zoneinfo` (
  `id` int(11) NOT NULL,
  `timezone` varchar(255) NOT NULL DEFAULT '',
  `outlook_compatible` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `vtimezone` text,
  `last_updated` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `mrbs_zoneinfo`
--

INSERT INTO `mrbs_zoneinfo` (`id`, `timezone`, `outlook_compatible`, `vtimezone`, `last_updated`) VALUES
(1, 'Asia/Kolkata', 1, 'BEGIN:VTIMEZONE\r\nTZID:Asia/Kolkata\r\nTZURL:http://tzurl.org/zoneinfo-outlook/Asia/Kolkata\r\nX-LIC-LOCATION:Asia/Kolkata\r\nBEGIN:STANDARD\r\nTZOFFSETFROM:+0530\r\nTZOFFSETTO:+0530\r\nTZNAME:IST\r\nDTSTART:19700101T000000\r\nEND:STANDARD\r\nEND:VTIMEZONE', 1523290532);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `mrbs_area`
--
ALTER TABLE `mrbs_area`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uq_area_name` (`area_name`);

--
-- Indexes for table `mrbs_entry`
--
ALTER TABLE `mrbs_entry`
  ADD PRIMARY KEY (`id`),
  ADD KEY `room_id` (`room_id`),
  ADD KEY `repeat_id` (`repeat_id`),
  ADD KEY `idxStartTime` (`start_time`),
  ADD KEY `idxEndTime` (`end_time`);

--
-- Indexes for table `mrbs_repeat`
--
ALTER TABLE `mrbs_repeat`
  ADD PRIMARY KEY (`id`),
  ADD KEY `room_id` (`room_id`);

--
-- Indexes for table `mrbs_room`
--
ALTER TABLE `mrbs_room`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uq_room_name` (`area_id`,`room_name`),
  ADD KEY `idxSortKey` (`sort_key`);

--
-- Indexes for table `mrbs_users`
--
ALTER TABLE `mrbs_users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uq_name` (`name`);

--
-- Indexes for table `mrbs_variables`
--
ALTER TABLE `mrbs_variables`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uq_variable_name` (`variable_name`);

--
-- Indexes for table `mrbs_zoneinfo`
--
ALTER TABLE `mrbs_zoneinfo`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uq_timezone` (`timezone`,`outlook_compatible`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `mrbs_area`
--
ALTER TABLE `mrbs_area`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `mrbs_entry`
--
ALTER TABLE `mrbs_entry`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;
--
-- AUTO_INCREMENT for table `mrbs_repeat`
--
ALTER TABLE `mrbs_repeat`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mrbs_room`
--
ALTER TABLE `mrbs_room`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `mrbs_users`
--
ALTER TABLE `mrbs_users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mrbs_variables`
--
ALTER TABLE `mrbs_variables`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `mrbs_zoneinfo`
--
ALTER TABLE `mrbs_zoneinfo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `mrbs_entry`
--
ALTER TABLE `mrbs_entry`
  ADD CONSTRAINT `mrbs_entry_ibfk_1` FOREIGN KEY (`room_id`) REFERENCES `mrbs_room` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `mrbs_entry_ibfk_2` FOREIGN KEY (`repeat_id`) REFERENCES `mrbs_repeat` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `mrbs_repeat`
--
ALTER TABLE `mrbs_repeat`
  ADD CONSTRAINT `mrbs_repeat_ibfk_1` FOREIGN KEY (`room_id`) REFERENCES `mrbs_room` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `mrbs_room`
--
ALTER TABLE `mrbs_room`
  ADD CONSTRAINT `mrbs_room_ibfk_1` FOREIGN KEY (`area_id`) REFERENCES `mrbs_area` (`id`) ON UPDATE CASCADE;

DELIMITER $$
--
-- Events
--
CREATE DEFINER=`root`@`localhost` EVENT `status_update` ON SCHEDULE EVERY 1 HOUR STARTS '2018-04-11 00:00:00' ENDS '2020-01-01 00:00:00' ON COMPLETION NOT PRESERVE ENABLE DO Update mrbs_entry Set status = 8 WHERE end_time < UNIX_TIMESTAMP() and status = 0 and students_attended is null$$

DELIMITER ;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
