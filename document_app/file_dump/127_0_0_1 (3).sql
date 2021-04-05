-- phpMyAdmin SQL Dump
-- version 5.0.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3308
-- Generation Time: Feb 20, 2021 at 03:54 AM
-- Server version: 10.4.14-MariaDB
-- PHP Version: 7.2.34

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `coop_system`
--
CREATE DATABASE IF NOT EXISTS `coop_system` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `coop_system`;

-- --------------------------------------------------------

--
-- Table structure for table `fcs_request`
--

CREATE TABLE `fcs_request` (
  `pid` int(15) NOT NULL,
  `form_id` varchar(15) NOT NULL,
  `flow_id` varchar(15) NOT NULL,
  `date_created` date NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `fs_access_level`
--

CREATE TABLE `fs_access_level` (
  `id` int(10) NOT NULL,
  `access_name` varchar(30) NOT NULL,
  `access_menu` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `fs_attribute_logger`
--

CREATE TABLE `fs_attribute_logger` (
  `id` int(10) NOT NULL,
  `page_name` varchar(30) NOT NULL,
  `page_action` varchar(20) NOT NULL,
  `page_attrib` text NOT NULL,
  `page_user` varchar(20) NOT NULL,
  `user_ip` varchar(20) NOT NULL,
  `date_update` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `fs_attribute_logger`
--

INSERT INTO `fs_attribute_logger` (`id`, `page_name`, `page_action`, `page_attrib`, `page_user`, `user_ip`, `date_update`) VALUES
(1, 'fs_department', 'INSERT', '{\"dept_no\":\"HR\",\"description\":\"HR Department\",\"approver\":\"YES\",\"add\":\"\"}', 'admin', '::1', 1610625959),
(2, 'fs_department', 'INSERT', '{\"dept_no\":\"Managing Department\",\"description\":\"Businness Manager\",\"approver\":\"YES\",\"add\":\"\"}', 'admin', '::1', 1610626005),
(3, 'fs_department', 'INSERT', '{\"dept_no\":\"Loan Department\",\"description\":\"Loan Department\",\"approver\":\"YES\",\"add\":\"\"}', 'admin', '::1', 1610626044),
(4, 'fs_user_group', 'INSERT', '{\"gname\":\"Loan Supervisor\",\"gdescription\":\"Loan supervisor approvers\",\"gmembers\":[\"99992\"],\"add\":\"\"}', 'admin', '::1', 1610626313),
(5, 'fs_user_group', 'UPDATE', '{\"id\":\"1\",\"edit_gname\":\"Supervisor\",\"edit_gdescription\":\"Supervisor\",\"edit_gmembers\":[\"99992\"],\"edit\":\"\"}', 'admin', '::1', 1610627873),
(6, 'fs_user_group', 'UPDATE', '{\"id\":\"1\",\"edit_gname\":\"Loan Supervisor\",\"edit_gdescription\":\"Supervisor\",\"edit_gmembers\":[\"99992\"],\"edit\":\"\"}', 'admin', '::1', 1610627893),
(7, 'fs_user_group', 'INSERT', '{\"gname\":\"HR Manager\",\"gdescription\":\"HR Manager\",\"gmembers\":[\"99991\"],\"add\":\"\"}', 'admin', '::1', 1610627944),
(8, 'fs_user_group', 'INSERT', '{\"gname\":\"General Manager\",\"gdescription\":\"Business General Manager\",\"gmembers\":[\"99991\"],\"add\":\"\"}', 'admin', '::1', 1610627988),
(9, 'fs_user_group', 'INSERT', '{\"gname\":\"Implementor\",\"gdescription\":\"Implementor\",\"gmembers\":[\"10002\"],\"add\":\"\"}', 'admin', '::1', 1610628018),
(10, 'fs_user_group', 'INSERT', '{\"gname\":\"Board of Directors\",\"gdescription\":\"Approving Board\",\"gmembers\":[\"radiant\",\"99991\",\"99992\"],\"add\":\"\"}', 'admin', '::1', 1610628072),
(11, 'fs_workstpes', 'INSERT', '{\"description\":\"Loan Supervisor Approval\",\"usergroup\":\"E5KGHJ47DU1A\",\"approvaltype\":\"Parallel\",\"timewindow\":\"3\",\"rejectfirst\":\"NA\",\"rejectchange\":\"NA\",\"add\":\"\"}', 'admin', '::1', 1610628411),
(12, 'fs_users', 'INSERT', '{\"userId\":\"Ann\",\"firstname\":\"Ann\",\"middlename\":\"A.\",\"lastname\":\"Sorela\",\"emailadd\":\"hilberth01@yahoo.com\",\"password\":\"12345\",\"accesslevel\":[\"DocAdmin\"],\"department\":\"1\",\"add\":\"\"}', 'admin', '::1', 1610628486),
(13, 'fs_users', 'INSERT', '{\"userId\":\"ReyGan\",\"firstname\":\"Reynaldo\",\"middlename\":\"G.\",\"lastname\":\"Gandionco\",\"emailadd\":\"hilberth01@yahoo.com\",\"password\":\"12345\",\"accesslevel\":[\"Approver\"],\"department\":\"2\",\"add\":\"\"}', 'admin', '::1', 1610628559),
(14, 'fs_users', 'INSERT', '{\"userId\":\"Nitz\",\"firstname\":\"Nenita\",\"middlename\":\"N.\",\"lastname\":\"Ricaforte\",\"emailadd\":\"hilberth01@yahoo.com\",\"password\":\"12345\",\"accesslevel\":[\"Approver\"],\"department\":\"3\",\"add\":\"\"}', 'admin', '::1', 1610628635),
(15, 'fs_users', 'INSERT', '{\"userId\":\"Dux\",\"firstname\":\"Dux\",\"middlename\":\"M. \",\"lastname\":\"Samonte\",\"emailadd\":\"hilberth01@yahoo.com\",\"password\":\"12345\",\"accesslevel\":[\"Implementor\"],\"department\":\"3\",\"add\":\"\"}', 'admin', '::1', 1610628688),
(16, 'fs_workstpes', 'INSERT', '{\"description\":\"General Manager Approval\",\"usergroup\":\"JZ0FV1MS4H9W\",\"approvaltype\":\"Parallel\",\"timewindow\":\"3\",\"rejectfirst\":\"NA\",\"rejectchange\":\"NA\",\"add\":\"\"}', 'admin', '::1', 1610628745),
(17, 'fs_workstpes', 'INSERT', '{\"description\":\"Implementer Confirmation\",\"usergroup\":\"SAMWXPZ5N6OY\",\"approvaltype\":\"Parallel\",\"timewindow\":\"3\",\"rejectfirst\":\"NA\",\"rejectchange\":\"NA\",\"add\":\"\"}', 'admin', '::1', 1610628786),
(18, 'fs_workflow', 'INSERT', '{\"description\":\"Loan Approval Workflow\",\"worksteps\":[\"OMKZL0Q7YRJ5NXW\",\"LWU2GAZ6HR51O0X\",\"M9RXFWGI31NOQVC\"],\"add\":\"\"}', 'admin', '::1', 1610628836),
(19, 'fs_request_main', 'INSERT', '{\"docname\":\"New Loan Policy\",\"docdesp\":\"Newly created loan policy\",\"workflow\":\"9MBKG64J7IOAYCE\",\"add\":\"\"}', 'admin', '::1', 1610628998),
(20, 'fs_user_group', 'UPDATE', '{\"id\":\"1\",\"edit_gname\":\"Loan Supervisor\",\"edit_gdescription\":\"Supervisor\",\"edit_gmembers\":[\"Nitz\"],\"edit\":\"\"}', 'admin', '::1', 1610629119),
(21, 'fs_user_group', 'UPDATE', '{\"id\":\"5\",\"edit_gname\":\"Board of Directors\",\"edit_gdescription\":\"Approving Board\",\"edit\":\"\"}', 'admin', '::1', 1610629134),
(22, 'fs_user_group', 'UPDATE', '{\"id\":\"5\",\"edit_gname\":\"Board of Directors\",\"edit_gdescription\":\"Approving Board\",\"edit\":\"\"}', 'admin', '::1', 1610629139),
(23, 'fs_user_group', 'UPDATE', '{\"id\":\"3\",\"edit_gname\":\"General Manager\",\"edit_gdescription\":\"Business General Manager\",\"edit_gmembers\":[\"ReyGan\"],\"edit\":\"\"}', 'admin', '::1', 1610629220),
(24, 'fs_user_group', 'UPDATE', '{\"id\":\"2\",\"edit_gname\":\"HR Manager\",\"edit_gdescription\":\"HR Manager\",\"edit_gmembers\":[\"Ann\"],\"edit\":\"\"}', 'admin', '::1', 1610629231),
(25, 'fs_user_group', 'UPDATE', '{\"id\":\"4\",\"edit_gname\":\"Implementor\",\"edit_gdescription\":\"Implementor\",\"edit_gmembers\":[\"10002\",\"Dux\"],\"edit\":\"\"}', 'admin', '::1', 1610629238),
(26, 'fs_users', 'INSERT', '{\"userId\":\"Jema\",\"firstname\":\"Jema\",\"middlename\":\"T. \",\"lastname\":\"Tibon\",\"emailadd\":\"hilberth01@yahoo.com\",\"password\":\"12345\",\"accesslevel\":[\"Approver\"],\"department\":\"1\",\"add\":\"\"}', 'admin', '::1', 1610629289),
(27, 'fs_department', 'INSERT', '{\"dept_no\":\"Board of Directors\",\"description\":\"Board of Directors\",\"approver\":\"YES\",\"add\":\"\"}', 'admin', '::1', 1610629324),
(28, 'fs_users', 'UPDATE', '{\"id\":\"11\",\"userId\":\"Jema\",\"firstname\":\"Jema\",\"middlename\":\"T. \",\"lastname\":\"Tibon\",\"emailadd\":\"hilberth01@yahoo.com\",\"password\":\"$2y$10$tkK9kusRfN0TIOfORhOEaODy3W3vjhlU3.uLUWoPtLFdoMwY2/6dO\",\"accesslevel\":[\"Approver\"],\"department\":\"4\",\"edit\":\"\"}', 'admin', '::1', 1610629394),
(29, 'fs_users', 'DELETE', '{\"id\":\"2\",\"delete\":\"\"}', 'admin', '::1', 1610629403),
(30, 'fs_users', 'DELETE', '{\"id\":\"3\",\"delete\":\"\"}', 'admin', '::1', 1610629407),
(31, 'fs_users', 'DELETE', '{\"id\":\"6\",\"delete\":\"\"}', 'admin', '::1', 1610629413),
(32, 'fs_users', 'INSERT', '{\"userId\":\"Hilberth\",\"firstname\":\"Hilberth\",\"middlename\":\"U.\",\"lastname\":\"Regala\",\"emailadd\":\"hilberth01@yahoo.com\",\"password\":\"12345\",\"accesslevel\":[\"Approver\",\"Implementor\",\"DocAdmin\",\"Administrator\"],\"department\":\"1\",\"add\":\"\"}', '', '::1', 1610629473),
(33, 'fs_department', 'INSERT', '{\"dept_no\":\"IT Department\",\"description\":\"IT\",\"approver\":\"NO\",\"add\":\"\"}', '', '::1', 1610629499),
(34, 'fs_users', 'UPDATE', '{\"id\":\"12\",\"userId\":\"Hilberth\",\"firstname\":\"Hilberth\",\"middlename\":\"U.\",\"lastname\":\"Regala\",\"emailadd\":\"hilberth01@yahoo.com\",\"password\":\"$2y$10$zEDVnAhhA4sOl4cE3z3Ta.2E0HCMrs2Y4hlYR4zc6f8TTN91c.wqy\",\"accesslevel\":[\"Approver\",\"Implementor\",\"DocAdmin\",\"Administrator\"],\"department\":\"5\",\"edit\":\"\"}', 'Hilberth', '::1', 1610672250),
(35, 'fs_users', 'UPDATE', '{\"id\":\"12\",\"userId\":\"Hilberth\",\"firstname\":\"Hilberth\",\"middlename\":\"U.\",\"lastname\":\"Regala\",\"emailadd\":\"hilberth01@yahoo.com\",\"password\":\"$2y$10$zEDVnAhhA4sOl4cE3z3Ta.2E0HCMrs2Y4hlYR4zc6f8TTN91c.wqy\",\"accesslevel\":[\"Approver\",\"Implementor\",\"DocAdmin\",\"Administrator\"],\"department\":\"5\",\"edit\":\"\"}', 'Hilberth', '::1', 1610672307),
(36, 'fs_workflow', 'UPDATE', '{\"id\":\"1\",\"description\":\"Loan Approval Workflow\",\"steps_id\":\"OMKZL0Q7YRJ5NXW\",\"edit_ug_name\":\"Nitz\",\"edit\":\"\"}', 'Hilberth', '::1', 1610684792),
(37, 'fs_workstpes', 'UPDATE', '{\"id\":\"2\",\"edit_description\":\"General Manager Approval\",\"edit_usergroup\":\"JZ0FV1MS4H9W\",\"edit_approvaltype\":\"Parallel\",\"edit_confirmtype\":\"Approval\",\"edit_timewindow\":\"3\",\"edit_rejectfirst\":\"NA\",\"edit_rejectchange\":\"NA\",\"edit\":\"\"}', 'radiant', '::1', 1610759058),
(38, 'fs_workstpes', 'UPDATE', '{\"id\":\"3\",\"edit_description\":\"Implementer Confirmation\",\"edit_usergroup\":\"SAMWXPZ5N6OY\",\"edit_approvaltype\":\"Parallel\",\"edit_confirmtype\":\"Reviewal\",\"edit_timewindow\":\"3\",\"edit_rejectfirst\":\"NA\",\"edit_rejectchange\":\"NA\",\"edit\":\"\"}', 'radiant', '::1', 1610759069),
(39, 'fs_workstpes', 'UPDATE', '{\"id\":\"3\",\"edit_description\":\"Implementer Confirmation\",\"edit_usergroup\":\"SAMWXPZ5N6OY\",\"edit_approvaltype\":\"Parallel\",\"edit_confirmtype\":\"Reviewal\",\"edit_timewindow\":\"3\",\"edit_rejectfirst\":\"NA\",\"edit_rejectchange\":\"NA\",\"edit\":\"\"}', 'Hilberth', '::1', 1610759301),
(40, 'fs_request_main', 'INSERT', '{\"refile_id\":\"FCCMPC-0000007\",\"upload\":\"\"}', 'Ann', '::1', 1610759978),
(41, 'fs_department', 'INSERT', '{\"dept_no\":\"Audit\",\"description\":\"Auditing  Department\",\"approver\":\"NO\",\"add\":\"\"}', 'Hilberth', '::1', 1610760314),
(42, 'fs_user_group', 'INSERT', '{\"gname\":\"Audit\",\"gdescription\":\"Audit\",\"add\":\"\"}', 'Hilberth', '::1', 1610760342),
(43, 'fs_users', 'INSERT', '{\"userId\":\"yuya\",\"firstname\":\"Philura\",\"middlename\":\"P.\",\"lastname\":\"Hipe\",\"emailadd\":\"hilberth01@yahoo.com\",\"password\":\"12345\",\"accesslevel\":[\"DocAdmin\"],\"department\":\"6\",\"add\":\"\"}', 'Hilberth', '::1', 1610760450),
(44, 'fs_request_main', 'INSERT', '{\"refile_id\":\"FCCMPC-0000008\",\"upload\":\"\"}', 'Hilberth', '::1', 1610760784),
(45, 'fs_request_main', 'UPDATE', '{\"id\":\"8\",\"edit_docname\":\"New Loan Policy 4\",\"edit_docdesp\":\"this has been revised\",\"edit_workflow\":\"9MBKG64J7IOAYCE\",\"edit\":\"\"}', 'Hilberth', '::1', 1610760810),
(46, 'fs_request_main', 'INSERT', '{\"refile_id\":\"FCCMPC-0000009\",\"upload\":\"\"}', 'Hilberth', '::1', 1610761095),
(47, 'fs_users', 'UPDATE', '{\"id\":\"7\",\"userId\":\"Ann\",\"firstname\":\"Ann\",\"middlename\":\"A.\",\"lastname\":\"Sorela\",\"emailadd\":\"hilberth01@yahoo.com\",\"password\":\"$2y$10$Ko4xNDn9k.92b0l7Q739kO.z91sKk/2FWdv53x6LR4vc3he7WG7tq\",\"accesslevel\":[\"Approver\",\"DocAdmin\",\"Administrator\"],\"department\":\"1\",\"edit\":\"\"}', 'Hilberth', '::1', 1610762719),
(48, 'fs_users', 'INSERT', '{\"userId\":\"christine\",\"firstname\":\"Christine\",\"middlename\":\"T\",\"lastname\":\"Bajao\",\"emailadd\":\"christinebajao.8894@gmail.com\",\"password\":\"12345\",\"accesslevel\":[\"Administrator\"],\"department\":\"5\",\"add\":\"\"}', 'Ann', '192.168.254.208', 1610763024),
(49, 'fs_users', 'UPDATE', '{\"id\":\"7\",\"userId\":\"Ann\",\"firstname\":\"Ann\",\"middlename\":\"A.\",\"lastname\":\"Sorela\",\"emailadd\":\"annalyn.sorela@yahoo.com\",\"password\":\"12345\",\"accesslevel\":[\"Approver\",\"Implementor\",\"DocAdmin\",\"Administrator\"],\"department\":\"1\",\"edit\":\"\"}', 'Ann', '192.168.254.208', 1610763073),
(50, 'fs_users', 'UPDATE', '{\"id\":\"13\",\"userId\":\"yuya\",\"firstname\":\"Philura\",\"middlename\":\"M.\",\"lastname\":\"Hipe\",\"emailadd\":\"yujhipe@gmail.com\",\"password\":\"12345\",\"accesslevel\":[\"DocAdmin\"],\"department\":\"6\",\"edit\":\"\"}', 'Ann', '192.168.254.208', 1610763124),
(51, 'fs_user_group', 'UPDATE', '{\"id\":\"5\",\"edit_gname\":\"Board of Directors\",\"edit_gdescription\":\"Approving Board\",\"edit_gmembers\":[\"Jema\",\"yuya\"],\"edit\":\"\"}', 'Ann', '192.168.254.208', 1610763188),
(52, 'fs_workstpes', 'DELETE', '{\"id\":\"1\",\"delete\":\"\"}', 'Ann', '192.168.254.208', 1610763962),
(53, 'fs_user_group', 'INSERT', '{\"gname\":\"Department Heads\",\"gdescription\":\"List of all department heads\",\"gmembers\":[\"Nitz\"],\"add\":\"\"}', 'Ann', '192.168.254.208', 1610764097),
(54, 'fs_users', 'INSERT', '{\"userId\":\"10021\",\"firstname\":\"Sheila Marie\",\"middlename\":\"Booc\",\"lastname\":\"Beceril\",\"emailadd\":\"smbb_@yahoo.com\",\"password\":\"12345\",\"accesslevel\":[\"Approver\",\"Implementor\",\"DocAdmin\",\"Administrator\"],\"department\":\"1\",\"add\":\"\"}', 'Ann', '192.168.254.208', 1610764291),
(55, 'fs_user_group', 'UPDATE', '{\"id\":\"7\",\"edit_gname\":\"Department Heads\",\"edit_gdescription\":\"List of all department heads\",\"edit_gmembers\":[\"Nitz\",\"10021\"],\"edit\":\"\"}', 'Ann', '192.168.254.208', 1610764332),
(56, 'fs_workstpes', 'INSERT', '{\"description\":\"Department Head Approval\",\"usergroup\":\"FK6XL3P1WM2I\",\"approvaltype\":\"Parallel\",\"confirmtype\":\"Approval\",\"timewindow\":\"3\",\"rejectfirst\":\"na\",\"rejectchange\":\"na\",\"add\":\"\"}', 'Ann', '192.168.254.208', 1610764796),
(57, 'fs_workflow', 'INSERT', '{\"description\":\"HR Policy Workflow\",\"worksteps\":[\"LWU2GAZ6HR51O0X\",\"M9RXFWGI31NOQVC\",\"UI94P61QSGXLWCZ\"],\"add\":\"\"}', 'Ann', '192.168.254.208', 1610764930),
(58, 'fs_workflow', 'UPDATE', '{\"id\":\"6\"}{\"form_id\":\"SYR85G14OIPHA9L\"}', 'Ann', '192.168.254.208', 1610764972),
(59, 'fs_workflow', 'UPDATE', '{\"id\":\"5\"}{\"form_id\":\"SYR85G14OIPHA9L\"}', 'Ann', '192.168.254.208', 1610764973),
(60, 'fs_workflow', 'UPDATE', '{\"id\":\"6\"}{\"form_id\":\"SYR85G14OIPHA9L\"}', 'Ann', '192.168.254.208', 1610764974),
(61, 'fs_workflow', 'UPDATE', '{\"id\":\"4\"}{\"form_id\":\"SYR85G14OIPHA9L\"}', 'Ann', '192.168.254.208', 1610764976),
(62, 'fs_user_group', 'INSERT', '{\"gname\":\"DCA Approvers\",\"gdescription\":\"Doccon Admin Approvers\",\"gmembers\":[\"Ann\",\"10021\"],\"add\":\"\"}', 'Ann', '192.168.254.208', 1610765199),
(63, 'fs_user_group', 'UPDATE', '{\"id\":\"8\",\"edit_gname\":\"DCA Approver\",\"edit_gdescription\":\"Doccon Admin Approver\",\"edit_gmembers\":[\"Ann\"],\"edit\":\"\"}', 'Ann', '192.168.254.208', 1610765352),
(64, 'fs_workstpes', 'INSERT', '{\"description\":\"DCA Approval\",\"usergroup\":\"BSGDR8AYM1U7\",\"approvaltype\":\"Series\",\"confirmtype\":\"Approval\",\"timewindow\":\"3\",\"rejectfirst\":\"N/A\",\"rejectchange\":\"N/A\",\"add\":\"\"}', 'Ann', '192.168.254.208', 1610766264),
(65, 'fs_workflow', 'INSERT', '{\"form_id\":\"SYR85G14OIPHA9L\",\"approvaltype\":\"series\",\"description\":\"HR Policy Workflow\",\"worksteps\":\"FOES7XV8I35HYCG\",\"ug_name\":\"BSGDR8AYM1U7\",\"addstep\":\"\"}', 'Ann', '192.168.254.208', 1610766308),
(66, 'fs_workflow', 'UPDATE', '{\"id\":\"5\"}{\"form_id\":\"SYR85G14OIPHA9L\"}', 'Ann', '192.168.254.208', 1610766314),
(67, 'fs_workstpes', 'INSERT', '{\"description\":\"BOD  Approval\",\"usergroup\":\"RX9MWFLHUY81\",\"approvaltype\":\"Parallel\",\"confirmtype\":\"Approval\",\"timewindow\":\"3\",\"rejectfirst\":\"N/A\",\"rejectchange\":\"N/A\",\"add\":\"\"}', 'Ann', '192.168.254.208', 1610766858),
(68, 'fs_workstpes', 'UPDATE', '{\"id\":\"3\",\"edit_description\":\"Implementers Conformance\",\"edit_usergroup\":\"SAMWXPZ5N6OY\",\"edit_approvaltype\":\"Parallel\",\"edit_confirmtype\":\"Reviewal\",\"edit_timewindow\":\"3\",\"edit_rejectfirst\":\"NA\",\"edit_rejectchange\":\"NA\",\"edit\":\"\"}', 'Ann', '192.168.254.208', 1610766985),
(69, 'fs_workflow', 'INSERT', '{\"form_id\":\"SYR85G14OIPHA9L\",\"approvaltype\":\"series\",\"description\":\"HR Policy Workflow\",\"worksteps\":\"IDQSR0BKEPO8CLH\",\"ug_name\":\"RX9MWFLHUY81\",\"addstep\":\"\"}', 'Ann', '192.168.254.208', 1610767017),
(70, 'fs_workflow', 'UPDATE', '{\"id\":\"8\"}{\"form_id\":\"SYR85G14OIPHA9L\"}', 'Ann', '192.168.254.208', 1610767024),
(71, 'fs_user_group', 'UPDATE', '{\"id\":\"4\",\"edit_gname\":\"HR Implementers\",\"edit_gdescription\":\"Implementor\",\"edit_gmembers\":[\"Ann\",\"10021\"],\"edit\":\"\"}', 'Ann', '192.168.254.208', 1610767278),
(72, 'fs_user_group', 'UPDATE', '{\"id\":\"4\",\"edit_gname\":\"HR Implementers\",\"edit_gdescription\":\"Implementor\",\"edit_gmembers\":[\"Ann\",\"10021\"],\"edit\":\"\"}', 'Ann', '192.168.254.208', 1610767300),
(73, 'fs_workflow', 'UPDATE', '{\"id\":\"SYR85G14OIPHA9L\",\"description\":\"Workflow MAIN OFFICE\",\"edit\":\"\"}', 'Ann', '192.168.254.208', 1610767360),
(74, 'fs_workflow', 'UPDATE', '{\"id\":\"5\",\"description\":\"Workflow MAIN OFFICE\",\"steps_id\":\"M9RXFWGI31NOQVC\",\"edit\":\"\"}', 'Ann', '192.168.254.208', 1610767441),
(75, 'fs_user_group', 'INSERT', '{\"gname\":\"IT Implementers\",\"gdescription\":\"IT\",\"gmembers\":[\"christine\"],\"add\":\"\"}', 'Ann', '192.168.254.208', 1610767603),
(76, 'fs_workflow', 'UPDATE', '{\"id\":\"5\",\"description\":\"Workflow MAIN OFFICE\",\"steps_id\":\"M9RXFWGI31NOQVC\",\"edit_ug_name\":\"2G4KRSL1W6YI\",\"edit\":\"\"}', 'Ann', '192.168.254.208', 1610767689),
(77, 'fs_users', 'INSERT', '{\"userId\":\"Whien\",\"firstname\":\"Whiendelyn\",\"middlename\":\"L.\",\"lastname\":\"Enero\",\"emailadd\":\"whiendelyn.enero@gmail.com\",\"password\":\"12345\",\"accesslevel\":[\"Approver\"],\"department\":\"6\",\"add\":\"\"}', 'Ann', '192.168.254.208', 1610767873),
(78, 'fs_department', 'INSERT', '{\"dept_no\":\"Accounting and Finance Department\",\"description\":\"Accounting\",\"approver\":\"YES\",\"add\":\"\"}', 'Ann', '192.168.254.208', 1610767918),
(79, 'fs_users', 'UPDATE', '{\"id\":\"16\",\"userId\":\"Whien\",\"firstname\":\"Whiendelyn\",\"middlename\":\"L.\",\"lastname\":\"Enero\",\"emailadd\":\"whiendelyn.enero@gmail.com\",\"password\":\"$2y$10$JjaOVVui673igavNyFJaFuyzNnjU.9pgKLjEsNNQgtbDJDPhPuj0.\",\"accesslevel\":[\"Approver\"],\"department\":\"7\",\"edit\":\"\"}', 'Ann', '192.168.254.208', 1610767944),
(80, 'fs_users', 'UPDATE', '{\"id\":\"16\",\"userId\":\"Whien\",\"firstname\":\"Whiendelyn\",\"middlename\":\"L.\",\"lastname\":\"Enero\",\"emailadd\":\"whiendelyn.enero@gmail.com\",\"password\":\"$2y$10$JjaOVVui673igavNyFJaFuyzNnjU.9pgKLjEsNNQgtbDJDPhPuj0.\",\"accesslevel\":[\"Approver\"],\"department\":\"7\",\"edit\":\"\"}', 'Ann', '192.168.254.208', 1610768030),
(81, 'fs_department', 'UPDATE', '{\"id\":\"7\",\"dept_no\":\"Accounting and Finance Department\",\"description\":\"Accounting\",\"approver\":\"YES\",\"edit\":\"\"}', 'Ann', '192.168.254.208', 1610768118),
(82, 'fs_department', 'UPDATE', '{\"id\":\"7\",\"dept_no\":\"Accounting\",\"description\":\"Accounting and Finance Department\",\"approver\":\"YES\",\"edit\":\"\"}', 'Ann', '192.168.254.208', 1610768224),
(83, 'fs_workflow', 'UPDATE', '{\"id\":\"5\",\"description\":\"Workflow MAIN OFFICE\",\"steps_id\":\"M9RXFWGI31NOQVC\",\"edit_ug_name\":\"2G4KRSL1W6YI\",\"edit\":\"\"}', 'Ann', '192.168.254.208', 1610768284),
(84, 'fs_users', 'UPDATE', '{\"id\":\"8\",\"userId\":\"ReyGan\",\"firstname\":\"Reynaldo\",\"middlename\":\"G.\",\"lastname\":\"Gandionco\",\"emailadd\":\"hilberth01@yahoo.com\",\"password\":\"$2y$10$YSHnOOjDH3bcC8c0HLQULe47xbuuHsdsQBy/VXFE9rl9pwEaR9lji\",\"accesslevel\":[\"Approver\"],\"department\":\"2\",\"edit\":\"\"}', 'Ann', '192.168.254.208', 1610768364),
(85, 'fs_request_main', 'INSERT', '{\"docname\":\"QMS-FC-002 \",\"docdesp\":\"FCCMPC Document Control & Procedure \",\"workflow\":\"SYR85G14OIPHA9L\",\"add\":\"\"}', 'Ann', '192.168.254.208', 1610768666),
(86, 'fs_request_main', 'INSERT', '{\"rqid\":\"FCCMPC-0000011\",\"wflow_id\":\"SYR85G14OIPHA9L\",\"step_id\":\"UI94P61QSGXLWCZ\",\"sel_actiond\":\"Approved\",\"remarks\":\"Approved\",\"user_apex\":\"\"}', 'Ann', '192.168.254.208', 1610768841),
(87, 'fs_request_main', 'INSERT', '{\"rqid\":\"FCCMPC-0000011\",\"wflow_id\":\"SYR85G14OIPHA9L\",\"step_id\":\"LWU2GAZ6HR51O0X\",\"sel_actiond\":\"Approved\",\"remarks\":\"Approved\",\"user_apex\":\"\"}', 'Ann', '192.168.254.208', 1610768897),
(88, 'fs_request_main', 'INSERT', '{\"rqid\":\"FCCMPC-0000011\",\"wflow_id\":\"SYR85G14OIPHA9L\",\"step_id\":\"LWU2GAZ6HR51O0X\",\"sel_actiond\":\"Approved\",\"remarks\":\"Approved\",\"user_apex\":\"\"}', 'Ann', '192.168.254.208', 1610768905),
(89, 'fs_request_main', 'INSERT', '{\"rqid\":\"FCCMPC-0000011\",\"wflow_id\":\"SYR85G14OIPHA9L\",\"step_id\":\"LWU2GAZ6HR51O0X\",\"sel_actiond\":\"Approved\",\"remarks\":\"Approved\",\"user_apex\":\"\"}', 'Ann', '192.168.254.208', 1610768905),
(90, 'fs_request_main', 'INSERT', '{\"rqid\":\"FCCMPC-0000011\",\"wflow_id\":\"SYR85G14OIPHA9L\",\"step_id\":\"FOES7XV8I35HYCG\",\"sel_actiond\":\"Approved\",\"remarks\":\"Approved\",\"user_apex\":\"\"}', 'Ann', '192.168.254.208', 1610769204),
(91, 'fs_request_main', 'INSERT', '{\"docname\":\"QMS-FC-002 \",\"docdesp\":\"2\",\"workflow\":\"SYR85G14OIPHA9L\",\"add\":\"\"}', 'Ann', '192.168.254.208', 1610769444),
(92, 'fs_request_main', 'INSERT', '{\"rqid\":\"FCCMPC-0000012\",\"wflow_id\":\"SYR85G14OIPHA9L\",\"step_id\":\"UI94P61QSGXLWCZ\",\"sel_actiond\":\"Approved\",\"remarks\":\"\",\"user_apex\":\"\"}', 'Hilberth', '::1', 1610769866),
(93, 'fs_request_main', 'INSERT', '{\"rqid\":\"FCCMPC-0000012\",\"wflow_id\":\"SYR85G14OIPHA9L\",\"step_id\":\"LWU2GAZ6HR51O0X\",\"sel_actiond\":\"Approved\",\"remarks\":\"\",\"user_apex\":\"\"}', 'Hilberth', '::1', 1610769885),
(94, 'fs_request_main', 'INSERT', '{\"rqid\":\"FCCMPC-0000012\",\"wflow_id\":\"SYR85G14OIPHA9L\",\"step_id\":\"FOES7XV8I35HYCG\",\"sel_actiond\":\"Approved\",\"remarks\":\"\",\"user_apex\":\"\"}', 'Hilberth', '::1', 1610769904),
(95, 'fs_request_main', 'INSERT', '{\"rqid\":\"FCCMPC-0000012\",\"wflow_id\":\"SYR85G14OIPHA9L\",\"step_id\":\"IDQSR0BKEPO8CLH\",\"sel_actiond\":\"Approved\",\"remarks\":\"\",\"user_apex\":\"\"}', 'Hilberth', '::1', 1610769924),
(96, 'fs_request_main', 'INSERT', '{\"rqid\":\"FCCMPC-0000012\",\"wflow_id\":\"SYR85G14OIPHA9L\",\"step_id\":\"M9RXFWGI31NOQVC\",\"sel_actiond\":\"Confirmed\",\"remarks\":\"\",\"user_apex\":\"\"}', 'Hilberth', '::1', 1610769942),
(97, 'fs_request_main', 'INSERT', '{\"docname\":\"FC-BD-003\",\"docdesp\":\"Business Policy\",\"workflow\":\"SYR85G14OIPHA9L\",\"add\":\"\"}', 'Ann', '192.168.254.208', 1610773969),
(98, 'fs_request_main', 'INSERT', '{\"rqid\":\"FCCMPC-0000013\",\"wflow_id\":\"SYR85G14OIPHA9L\",\"step_id\":\"UI94P61QSGXLWCZ\",\"sel_actiond\":\"Approved\",\"remarks\":\"Approved\",\"user_apex\":\"\"}', 'Ann', '192.168.254.208', 1610774045),
(99, 'fs_request_main', 'INSERT', '{\"rqid\":\"FCCMPC-0000013\",\"wflow_id\":\"SYR85G14OIPHA9L\",\"step_id\":\"LWU2GAZ6HR51O0X\",\"sel_actiond\":\"Approved\",\"remarks\":\"approved\",\"user_apex\":\"\"}', 'Ann', '192.168.254.208', 1610774083),
(100, 'fs_request_main', 'INSERT', '{\"rqid\":\"FCCMPC-0000013\",\"wflow_id\":\"SYR85G14OIPHA9L\",\"step_id\":\"FOES7XV8I35HYCG\",\"sel_actiond\":\"Disapproved\",\"remarks\":\"parag no. 5 not acceptable\",\"user_apex\":\"\"}', 'Ann', '192.168.254.208', 1610774125),
(101, 'fs_request_main', 'INSERT', '{\"docname\":\"FC-BD-003\",\"docdesp\":\"BUSINESS\",\"workflow\":\"SYR85G14OIPHA9L\",\"add\":\"\"}', 'christine', '192.168.250.44', 1610774591),
(102, 'fs_request_main', 'INSERT', '{\"rqid\":\"FCCMPC-0000014\",\"wflow_id\":\"SYR85G14OIPHA9L\",\"step_id\":\"UI94P61QSGXLWCZ\",\"sel_actiond\":\"Approved\",\"remarks\":\"ok\",\"user_apex\":\"\"}', 'Ann', '192.168.254.208', 1610774785),
(103, 'fs_request_main', 'INSERT', '{\"rqid\":\"FCCMPC-0000014\",\"wflow_id\":\"SYR85G14OIPHA9L\",\"step_id\":\"LWU2GAZ6HR51O0X\",\"sel_actiond\":\"Approved\",\"remarks\":\"ok\",\"user_apex\":\"\"}', 'Ann', '192.168.254.208', 1610774853),
(104, 'fs_request_main', 'INSERT', '{\"rqid\":\"FCCMPC-0000014\",\"wflow_id\":\"SYR85G14OIPHA9L\",\"step_id\":\"FOES7XV8I35HYCG\",\"sel_actiond\":\"Approved\",\"remarks\":\"approved\",\"user_apex\":\"\"}', 'Ann', '192.168.254.208', 1610775022),
(105, 'fs_request_main', 'INSERT', '{\"rqid\":\"FCCMPC-0000014\",\"wflow_id\":\"SYR85G14OIPHA9L\",\"step_id\":\"IDQSR0BKEPO8CLH\",\"sel_actiond\":\"Disapproved\",\"remarks\":\"Requirement in section 6  not acceptable. Need to improve controls.\",\"user_apex\":\"\"}', 'yuya', '192.168.250.76', 1610775157),
(106, 'fs_request_main', 'INSERT', '{\"rqid\":\"FCCMPC-0000014\",\"wflow_id\":\"SYR85G14OIPHA9L\",\"step_id\":\"IDQSR0BKEPO8CLH\",\"sel_actiond\":\"Disapproved\",\"remarks\":\"rate not applicable\",\"user_apex\":\"\"}', 'Ann', '192.168.254.208', 1610775175),
(107, 'fs_request_main', 'UPDATE', '{\"rqid\":\"FCCMPC-0000014\",\"wrkflow_id\":\"SYR85G14OIPHA9L\",\"resubmit\":\"\"}', 'christine', '192.168.250.44', 1610775599),
(108, 'fs_request_main', 'UPDATE', '{\"rqid\":\"FCCMPC-0000014\",\"wrkflow_id\":\"SYR85G14OIPHA9L\",\"resubmit\":\"\"}', 'christine', '192.168.250.44', 1610775631),
(109, 'fs_request_main', 'UPDATE', '{\"refile_id\":\"FCCMPC-0000014\",\"upload\":\"\"}', 'christine', '192.168.250.44', 1610775684),
(110, 'fs_request_main', 'UPDATE', '{\"rqid\":\"FCCMPC-0000014\",\"wrkflow_id\":\"SYR85G14OIPHA9L\",\"resubmit\":\"\"}', 'christine', '192.168.250.44', 1610775690),
(111, 'fs_users', 'UPDATE', '{\"id\":\"15\",\"userId\":\"Sheila\",\"firstname\":\"Sheila Marie\",\"middlename\":\"Booc\",\"lastname\":\"Beceril\",\"emailadd\":\"smbb_@yahoo.com\",\"password\":\"12345\",\"accesslevel\":[\"Approver\",\"DocAdmin\",\"Administrator\"],\"department\":\"1\",\"edit\":\"\"}', 'Ann', '192.168.254.165', 1610779995),
(112, 'fs_users', 'UPDATE', '{\"id\":\"8\",\"userId\":\"Reygan\",\"firstname\":\"Reynaldo\",\"middlename\":\"A.\",\"lastname\":\"Gandionco\",\"emailadd\":\"reygancoop@yahoo.com\",\"password\":\"12345\",\"accesslevel\":[\"Approver\"],\"department\":\"2\",\"edit\":\"\"}', 'Ann', '192.168.254.165', 1610780062),
(113, 'fs_department', 'UPDATE', '{\"id\":\"7\",\"dept_no\":\"Accounting\",\"description\":\"Accounting and Finance Dept\",\"approver\":\"YES\",\"edit\":\"\"}', 'Ann', '192.168.254.165', 1610780178),
(114, 'fs_department', 'UPDATE', '{\"id\":\"1\",\"dept_no\":\"HR\",\"description\":\"HR Department\",\"approver\":\"YES\",\"edit\":\"\"}', 'Ann', '192.168.254.165', 1610780193),
(115, 'fs_department', 'INSERT', '{\"dept_no\":\"Collection\",\"description\":\"Collection Dept\",\"approver\":\"YES\",\"add\":\"\"}', 'Ann', '192.168.254.165', 1610780215),
(116, 'fs_department', 'UPDATE', '{\"id\":\"3\",\"dept_no\":\"Loan Department\",\"description\":\"Loan Department\",\"approver\":\"YES\",\"edit\":\"\"}', 'Ann', '192.168.254.165', 1610780233),
(117, 'fs_department', 'UPDATE', '{\"id\":\"5\",\"dept_no\":\"IT Department\",\"description\":\"IT Department\",\"approver\":\"NO\",\"edit\":\"\"}', 'Ann', '192.168.254.165', 1610780245),
(118, 'fs_department', 'UPDATE', '{\"id\":\"2\",\"dept_no\":\"Managing Department\",\"description\":\"General Manager\",\"approver\":\"YES\",\"edit\":\"\"}', 'Ann', '192.168.254.165', 1610780269),
(119, 'fs_users', 'UPDATE', '{\"id\":\"7\",\"userId\":\"Ann\",\"firstname\":\"Ann\",\"middlename\":\"E.\",\"lastname\":\"Sorela\",\"emailadd\":\"annalyn.sorela@yahoo.com\",\"password\":\"12345\",\"accesslevel\":[\"Approver\",\"Implementor\",\"DocAdmin\",\"Administrator\"],\"department\":\"1\",\"edit\":\"\"}', 'Ann', '192.168.254.165', 1610780295),
(120, 'fs_department', 'UPDATE', '{\"id\":\"1\",\"dept_no\":\"HR Admin\",\"description\":\"HR Department\",\"approver\":\"YES\",\"edit\":\"\"}', 'Ann', '192.168.254.165', 1610780335),
(121, 'fs_users', 'INSERT', '{\"userId\":\"Syra\",\"firstname\":\"Syra Lee\",\"middlename\":\"M.\",\"lastname\":\"Lauron\",\"emailadd\":\"annalyn.sorela@yahoo.com\",\"password\":\"12345\",\"accesslevel\":[\"Implementor\"],\"department\":\"1\",\"add\":\"\"}', 'Ann', '192.168.254.165', 1610782110),
(122, 'fs_users', 'INSERT', '{\"userId\":\"JR\",\"firstname\":\"Jhun Rey\",\"middlename\":\"P.\",\"lastname\":\"Amorganda\",\"emailadd\":\"annalyn.sorela@yahoo.com\",\"password\":\"123445\",\"accesslevel\":[\"Implementor\"],\"department\":\"5\",\"add\":\"\"}', 'Ann', '192.168.254.165', 1610782200),
(123, 'fs_department', 'INSERT', '{\"dept_no\":\"Business Department\",\"description\":\"Business Department\",\"approver\":\"NO\",\"add\":\"\"}', 'Ann', '192.168.254.165', 1610782239),
(124, 'fs_department', 'UPDATE', '{\"id\":\"5\",\"dept_no\":\"Business and IT Dept\",\"description\":\"Business and IT Dept\",\"approver\":\"NO\",\"edit\":\"\"}', 'Ann', '192.168.254.165', 1610782293),
(125, 'fs_department', 'UPDATE', '{\"id\":\"9\",\"dept_no\":\"Membership and Marketing Dept\",\"description\":\"Membership and Marketing Dept\",\"approver\":\"NO\",\"edit\":\"\"}', 'Ann', '192.168.254.165', 1610782334),
(126, 'fs_department', 'INSERT', '{\"dept_no\":\"Knowles Branch\",\"description\":\"Knowles Branch\",\"approver\":\"NO\",\"add\":\"\"}', 'Ann', '192.168.254.165', 1610782362),
(127, 'fs_users', 'UPDATE', '{\"id\":\"14\",\"userId\":\"Christine\",\"firstname\":\"Christine\",\"middlename\":\"T\",\"lastname\":\"Bajao\",\"emailadd\":\"christinebajao.8894@gmail.com\",\"password\":\"1234\",\"accesslevel\":[\"Administrator\"],\"department\":\"5\",\"edit\":\"\"}', 'Ann', '192.168.254.165', 1610782383),
(128, 'fs_users', 'INSERT', '{\"userId\":\"Salvie\",\"firstname\":\"Mary Salvie\",\"middlename\":\"S.\",\"lastname\":\"Abastas\",\"emailadd\":\"annalyn.sorela@yahoo.com\",\"password\":\"12345\",\"accesslevel\":[\"Approver\"],\"department\":\"8\",\"add\":\"\"}', 'Ann', '192.168.254.165', 1610782477),
(129, 'fs_users', 'INSERT', '{\"userId\":\"Annjy\",\"firstname\":\"Ann Jaysa\",\"middlename\":\"O.\",\"lastname\":\"Tirol\",\"emailadd\":\"annalyn.sorela@yahoo.com\",\"password\":\"12345\",\"accesslevel\":[\"Implementor\"],\"department\":\"8\",\"add\":\"\"}', 'Ann', '192.168.254.165', 1610782522),
(130, 'fs_users', 'INSERT', '{\"userId\":\"Minda\",\"firstname\":\"Lusminda\",\"middlename\":\"L.\",\"lastname\":\"Buagas\",\"emailadd\":\"annalyn.sorela@yahoo.com\",\"password\":\"12345\",\"accesslevel\":[\"Approver\"],\"department\":\"3\",\"add\":\"\"}', 'Ann', '192.168.254.165', 1610782560),
(131, 'fs_users', 'INSERT', '{\"userId\":\"Chardey\",\"firstname\":\"Chardey\",\"middlename\":\"T.\",\"lastname\":\"Bermudez\",\"emailadd\":\"annalyn.sorela@yahoo.com\",\"password\":\"12345\",\"accesslevel\":[\"Implementor\"],\"department\":\"8\",\"add\":\"\"}', 'Ann', '192.168.254.165', 1610782603),
(132, 'fs_users', 'INSERT', '{\"userId\":\"Charisse\",\"firstname\":\"Charisse\",\"middlename\":\"E.\",\"lastname\":\"Menguito\",\"emailadd\":\"annalyn.sorela@yahoo.com\",\"password\":\"12345\",\"accesslevel\":[\"Implementor\"],\"department\":\"9\",\"add\":\"\"}', 'Ann', '192.168.254.165', 1610782648),
(133, 'fs_users', 'INSERT', '{\"userId\":\"Dimple\",\"firstname\":\"Rachelle Faye\",\"middlename\":\"H.\",\"lastname\":\"Molinos\",\"emailadd\":\"annalyn.sorela@yahoo.com\",\"password\":\"12345\",\"accesslevel\":[\"Implementor\"],\"department\":\"7\",\"add\":\"\"}', 'Ann', '192.168.254.165', 1610782733),
(134, 'fs_users', 'INSERT', '{\"userId\":\"Sandy\",\"firstname\":\"Sandy\",\"middlename\":\"F.\",\"lastname\":\"Canoneo\",\"emailadd\":\"annalyn.sorela@yahoo.com\",\"password\":\"12345\",\"accesslevel\":[\"Implementor\"],\"department\":\"7\",\"add\":\"\"}', 'Ann', '192.168.254.165', 1610782774),
(135, 'fs_users', 'INSERT', '{\"userId\":\"Ailec\",\"firstname\":\"Glicel Ann\",\"middlename\":\"A.\",\"lastname\":\"Abueva\",\"emailadd\":\"annalyn.sorela@yahoo.com\",\"password\":\"12345\",\"accesslevel\":[\"Implementor\"],\"department\":\"3\",\"add\":\"\"}', 'Ann', '192.168.254.165', 1610782812),
(136, 'fs_users', 'INSERT', '{\"userId\":\"Teo\",\"firstname\":\"Teofredo\",\"middlename\":\"C.\",\"lastname\":\"Llido Jr.\",\"emailadd\":\"teofredo.llido@gmail.com\",\"password\":\"123445\",\"accesslevel\":[\"Implementor\"],\"department\":\"5\",\"add\":\"\"}', 'Ann', '192.168.254.165', 1610782884),
(137, 'fs_users', 'INSERT', '{\"userId\":\"Jeaneth\",\"firstname\":\"Jeaneth\",\"middlename\":\"C.\",\"lastname\":\"Gaspan\",\"emailadd\":\"annalyn.sorela@yahoo.com\",\"password\":\"12345\",\"accesslevel\":[\"Implementor\"],\"department\":\"7\",\"add\":\"\"}', 'Ann', '192.168.254.165', 1610782912),
(138, 'fs_users', 'INSERT', '{\"userId\":\"Regina\",\"firstname\":\"Regina Marie\",\"middlename\":\"E.\",\"lastname\":\"Suico\",\"emailadd\":\"annalyn.sorela@yahoo.com\",\"password\":\"12345\",\"accesslevel\":[\"Implementor\"],\"department\":\"7\",\"add\":\"\"}', 'Ann', '192.168.254.165', 1610782955),
(139, 'fs_users', 'INSERT', '{\"userId\":\"Mel\",\"firstname\":\"Melissa\",\"middlename\":\".\",\"lastname\":\"Paeres\",\"emailadd\":\"annalyn.sorela@yahoo.com\",\"password\":\"12345\",\"accesslevel\":[\"Implementor\"],\"department\":\"7\",\"add\":\"\"}', 'Ann', '192.168.254.165', 1610782984),
(140, 'fs_users', 'UPDATE', '{\"id\":\"30\",\"userId\":\"Mel\",\"firstname\":\"Melissa\",\"middlename\":\"A.\",\"lastname\":\"Paeres\",\"emailadd\":\"annalyn.sorela@yahoo.com\",\"password\":\"12345\",\"accesslevel\":[\"Implementor\"],\"department\":\"7\",\"edit\":\"\"}', 'Ann', '192.168.254.165', 1610783035),
(141, 'fs_users', 'INSERT', '{\"userId\":\"Gladys\",\"firstname\":\"Gladys\",\"middlename\":\"B.\",\"lastname\":\"Golosino\",\"emailadd\":\"annalyn.sorela@yahoo.com\",\"password\":\"12345\",\"accesslevel\":[\"Implementor\"],\"department\":\"3\",\"add\":\"\"}', 'Ann', '192.168.254.165', 1610783066),
(142, 'fs_users', 'INSERT', '{\"userId\":\"Rhina\",\"firstname\":\"Ma. Clarina\",\"middlename\":\"A.\",\"lastname\":\"Cabadon\",\"emailadd\":\"annalyn.sorela@yahoo.com\",\"password\":\"12345\",\"accesslevel\":[\"Implementor\"],\"department\":\"3\",\"add\":\"\"}', 'Ann', '192.168.254.165', 1610783103),
(143, 'fs_users', 'INSERT', '{\"userId\":\"Tad\",\"firstname\":\"Rudolph\",\"middlename\":\"C.\",\"lastname\":\"Montayre\",\"emailadd\":\"annalyn.sorela@yahoo.com\",\"password\":\"12345\",\"accesslevel\":[\"Approver\"],\"department\":\"5\",\"add\":\"\"}', 'Ann', '192.168.254.165', 1610783136),
(144, 'fs_user_group', 'UPDATE', '{\"id\":\"7\",\"edit_gname\":\"Department Heads\",\"edit_gdescription\":\"List of all department heads\",\"edit_gmembers\":[\"Nitz\",\"Sheila\",\"Whien\",\"Salvie\",\"Minda\",\"Tad\"],\"edit\":\"\"}', 'Ann', '192.168.254.165', 1610783195),
(145, 'fs_user_group', 'UPDATE', '{\"id\":\"4\",\"edit_gname\":\"HR Implementers\",\"edit_gdescription\":\"Implementor\",\"edit_gmembers\":[\"Ann\",\"Syra\"],\"edit\":\"\"}', 'Ann', '192.168.254.165', 1610783242),
(146, 'fs_user_group', 'UPDATE', '{\"id\":\"9\",\"edit_gname\":\"IT Implementers\",\"edit_gdescription\":\"IT\",\"edit_gmembers\":[\"Christine\",\"Teo\"],\"edit\":\"\"}', 'Ann', '192.168.254.165', 1610783265),
(147, 'fs_user_group', 'INSERT', '{\"gname\":\"Business and IT Dept\",\"gdescription\":\"Business and IT Dept\",\"gmembers\":[\"Christine\",\"JR\",\"Teo\"],\"add\":\"\"}', 'Ann', '192.168.254.165', 1610783306),
(148, 'fs_user_group', 'INSERT', '{\"gname\":\"Collection Dept\",\"gdescription\":\"Collection Dept\",\"gmembers\":[\"Annjy\",\"Chardey\"],\"add\":\"\"}', 'Ann', '192.168.254.165', 1610783336),
(149, 'fs_user_group', 'INSERT', '{\"gname\":\"Knowles Branch\",\"gdescription\":\"Knowles Branch\",\"add\":\"\"}', 'Ann', '192.168.254.165', 1610783358),
(150, 'fs_user_group', 'DELETE', '{\"id\":\"2\",\"delete\":\"\"}', 'Ann', '192.168.254.165', 1610783383),
(151, 'fs_user_group', 'UPDATE', '{\"id\":\"1\",\"edit_gname\":\"Loan Department\",\"edit_gdescription\":\"Loan Department\",\"edit_gmembers\":[\"Ailec\",\"Gladys\",\"Rhina\"],\"edit\":\"\"}', 'Ann', '192.168.254.165', 1610783444),
(152, 'fs_workstpes', 'UPDATE', '{\"id\":\"4\",\"edit_description\":\"Department Head Approval\",\"edit_usergroup\":\"FK6XL3P1WM2I\",\"edit_approvaltype\":\"Parallel\",\"edit_confirmtype\":\"Approval\",\"edit_timewindow\":\"3\",\"edit_rejectfirst\":\"N/A\",\"edit_rejectchange\":\"N/A\",\"edit\":\"\"}', 'Ann', '192.168.254.165', 1610783463),
(153, 'fs_workflow', 'INSERT', '{\"description\":\"Workflow KNOWLES BRANCH\",\"worksteps\":[\"LWU2GAZ6HR51O0X\",\"M9RXFWGI31NOQVC\",\"FOES7XV8I35HYCG\",\"IDQSR0BKEPO8CLH\"],\"add\":\"\"}', 'Ann', '192.168.254.165', 1610783528),
(154, 'fs_workflow', 'UPDATE', '{\"id\":\"10\"}{\"form_id\":\"ZJVUOB63FMWCS9T\"}', 'Ann', '192.168.254.165', 1610783546),
(155, 'fs_workflow', 'UPDATE', '{\"id\":\"10\"}{\"form_id\":\"ZJVUOB63FMWCS9T\"}', 'Ann', '192.168.254.165', 1610783548),
(156, 'fs_workstpes', 'INSERT', '{\"description\":\"KBOC Approval\",\"usergroup\":\"X4AWYOUFMKSI\",\"approvaltype\":\"Parallel\",\"confirmtype\":\"Approval\",\"timewindow\":\"3\",\"rejectfirst\":\"N/A\",\"rejectchange\":\"N/A\",\"add\":\"\"}', 'Ann', '192.168.254.165', 1610783633),
(157, 'fs_users', 'UPDATE', '{\"id\":\"32\",\"userId\":\"Rhina\",\"firstname\":\"Maria Clarina\",\"middlename\":\"A.\",\"lastname\":\"Cabadon\",\"emailadd\":\"annalyn.sorela@yahoo.com\",\"password\":\"$2y$10$.i.lLfXuOgxQdimd/TxcouNsvjaPe.zhM7byd1eZ26.Z6K8PZ7gl6\",\"accesslevel\":[\"Implementor\"],\"department\":\"3\",\"edit\":\"\"}', 'Ann', '192.168.254.165', 1611273904),
(158, 'fs_users', 'INSERT', '{\"userId\":\"Michael\",\"firstname\":\"Michael\",\"middlename\":\".\",\"lastname\":\"Gille\",\"emailadd\":\"michaelgille322@yahoo.com\",\"password\":\"12345\",\"accesslevel\":[\"Implementor\"],\"department\":\"7\",\"add\":\"\"}', 'Ann', '192.168.254.165', 1611273975),
(159, 'fs_users', 'INSERT', '{\"userId\":\"Junray\",\"firstname\":\"Junray\",\"middlename\":\"G.\",\"lastname\":\"Mecares\",\"emailadd\":\"junskey86@gmail.com\",\"password\":\"12345\",\"accesslevel\":[\"Implementor\"],\"department\":\"1\",\"add\":\"\"}', 'Ann', '192.168.254.165', 1611274033),
(160, 'fs_users', 'INSERT', '{\"userId\":\"Richard\",\"firstname\":\"Richard\",\"middlename\":\".\",\"lastname\":\"Benolirao\",\"emailadd\":\"annalyn.sorela@yahoo.com\",\"password\":\"12345\",\"accesslevel\":[\"Implementor\"],\"department\":\"1\",\"add\":\"\"}', 'Ann', '192.168.254.165', 1611274151),
(161, 'fs_users', 'UPDATE', '{\"id\":\"35\",\"userId\":\"Junray\",\"firstname\":\"Junray\",\"middlename\":\"G.\",\"lastname\":\"Mecares\",\"emailadd\":\"annalyn.sorela@yahoo.com\",\"password\":\"$2y$10$thMXq65M9HJNWryNTekHYOVx1O7PAg.nvUbKj3UkINHLTzmf2NBXa\",\"accesslevel\":[\"Implementor\"],\"department\":\"1\",\"edit\":\"\"}', 'Ann', '192.168.254.165', 1611274168),
(162, 'fs_users', 'UPDATE', '{\"id\":\"34\",\"userId\":\"Michael\",\"firstname\":\"Michael\",\"middlename\":\".\",\"lastname\":\"Gille\",\"emailadd\":\"annalyn.sorela@yahoo.com\",\"password\":\"12345\",\"accesslevel\":[\"Implementor\"],\"department\":\"7\",\"edit\":\"\"}', 'Ann', '192.168.254.165', 1611274185),
(163, 'fs_users', 'INSERT', '{\"userId\":\"Daisy\",\"firstname\":\"Ma. Daisy\",\"middlename\":\"A.\",\"lastname\":\"Vega\",\"emailadd\":\"christinebajao.8894@gmail.com\",\"password\":\"12345\",\"accesslevel\":[\"Implementor\"],\"department\":\"10\",\"add\":\"\"}', 'Ann', '192.168.254.165', 1611274300),
(164, 'fs_users', 'INSERT', '{\"userId\":\"Melanie\",\"firstname\":\"Melanie\",\"middlename\":\".\",\"lastname\":\"Amorin\",\"emailadd\":\"christinebajao.8894@gmail.com\",\"password\":\"12345\",\"accesslevel\":[\"Implementor\"],\"department\":\"10\",\"add\":\"\"}', 'Ann', '192.168.254.165', 1611274324),
(165, 'fs_users', 'INSERT', '{\"userId\":\"Nina\",\"firstname\":\"Nina\",\"middlename\":\".\",\"lastname\":\"Magto\",\"emailadd\":\"christinebajao.8894@gmail.com\",\"password\":\"12345\",\"accesslevel\":[\"Implementor\"],\"department\":\"10\",\"add\":\"\"}', 'Ann', '192.168.254.165', 1611274345),
(166, 'fs_users', 'INSERT', '{\"userId\":\"Ella\",\"firstname\":\"Estella\",\"middlename\":\".\",\"lastname\":\"Delarita\",\"emailadd\":\"christinebajao.8894@gmail.com\",\"password\":\"12345\",\"accesslevel\":[\"Implementor\"],\"department\":\"10\",\"add\":\"\"}', 'Ann', '192.168.254.165', 1611274384),
(167, 'fs_users', 'INSERT', '{\"userId\":\"Bibi\",\"firstname\":\"Maria Cristina\",\"middlename\":\"B.\",\"lastname\":\"Estacio\",\"emailadd\":\"christinebajao.8894@gmail.com\",\"password\":\"12345\",\"accesslevel\":[\"Approver\"],\"department\":\"4\",\"add\":\"\"}', 'Ann', '192.168.254.165', 1611274433),
(168, 'fs_users', 'INSERT', '{\"userId\":\"Jerry\",\"firstname\":\"Jerry\",\"middlename\":\"I.\",\"lastname\":\"Dulce\",\"emailadd\":\"annalyn.sorela@yahoo.com\",\"password\":\"12345\",\"accesslevel\":[\"Approver\"],\"department\":\"4\",\"add\":\"\"}', 'Ann', '192.168.254.165', 1611274511),
(169, 'fs_users', 'INSERT', '{\"userId\":\"Noel\",\"firstname\":\"Noel\",\"middlename\":\"P.\",\"lastname\":\"Nunez\",\"emailadd\":\"christinebajao.8894@gmail.com\",\"password\":\"12345\",\"accesslevel\":[\"Approver\"],\"department\":\"4\",\"add\":\"\"}', 'Ann', '192.168.254.165', 1611281924),
(170, 'fs_users', 'INSERT', '{\"userId\":\"Boy\",\"firstname\":\"Sixto\",\"middlename\":\".\",\"lastname\":\"Wahing\",\"emailadd\":\"christinebajao.8894@gmail.com\",\"password\":\"12345\",\"accesslevel\":[\"Approver\"],\"department\":\"4\",\"add\":\"\"}', 'Ann', '192.168.254.165', 1611281951),
(171, 'fs_users', 'INSERT', '{\"userId\":\"Fina\",\"firstname\":\"Josefina\",\"middlename\":\"I.\",\"lastname\":\"Ricafranca\",\"emailadd\":\"christinebajao.8894@gmail.com\",\"password\":\"12345\",\"accesslevel\":[\"Approver\"],\"department\":\"4\",\"add\":\"\"}', 'Ann', '192.168.254.165', 1611281983),
(172, 'fs_users', 'INSERT', '{\"userId\":\"Godo\",\"firstname\":\"Godofredo\",\"middlename\":\"I.\",\"lastname\":\"Gequillo\",\"emailadd\":\"christinebajao.8894@gmail.com\",\"password\":\"12345\",\"accesslevel\":[\"Approver\"],\"department\":\"4\",\"add\":\"\"}', 'Ann', '192.168.254.165', 1611282013),
(173, 'fs_users', 'INSERT', '{\"userId\":\"Daryl\",\"firstname\":\"Daryl\",\"middlename\":\"S.\",\"lastname\":\"Go\",\"emailadd\":\"christinebajao.8894@gmail.com\",\"password\":\"12345\",\"accesslevel\":[\"Approver\"],\"department\":\"4\",\"add\":\"\"}', 'Ann', '192.168.254.165', 1611282058),
(174, 'fs_users', 'INSERT', '{\"userId\":\"Dodon\",\"firstname\":\"Porferio\",\"middlename\":\"S.\",\"lastname\":\"Montesclaros Jr.\",\"emailadd\":\"christinebajao.8894@gmail.com\",\"password\":\"12345\",\"accesslevel\":[\"Approver\"],\"department\":\"4\",\"add\":\"\"}', 'Ann', '192.168.254.165', 1611282098),
(175, 'fs_users', 'UPDATE', '{\"id\":\"13\",\"userId\":\"yuya\",\"firstname\":\"Philura\",\"middlename\":\"M.\",\"lastname\":\"Hipe\",\"emailadd\":\"yujhipe@gmail.com\",\"password\":\"$2y$10$kQHfQZVLhVjUycCZhRSBaug5rftbxS8Rn8xRJ4I18Vv8XCs4umN92\",\"accesslevel\":[\"Approver\",\"Implementor\",\"DocAdmin\",\"Administrator\"],\"department\":\"6\",\"edit\":\"\"}', 'Ann', '192.168.254.165', 1611378967),
(176, 'fs_users', 'UPDATE', '{\"id\":\"15\",\"userId\":\"Sheila\",\"firstname\":\"Sheila Marie\",\"middlename\":\"Booc\",\"lastname\":\"Beceril\",\"emailadd\":\"smbb_@yahoo.com\",\"password\":\"$2y$10$5JFBQwKjAG0C0P.Roc93p.hiOkiArDnOm2YNFt/Zx/KLbAPVvdb3G\",\"accesslevel\":[\"Approver\",\"Implementor\",\"DocAdmin\",\"Administrator\"],\"department\":\"1\",\"edit\":\"\"}', 'Ann', '192.168.254.165', 1611378984),
(177, 'fs_workflow', 'INSERT', '{\"description\":\"Direct Staff Workflow\",\"worksteps\":[\"LWU2GAZ6HR51O0X\",\"UI94P61QSGXLWCZ\",\"FOES7XV8I35HYCG\",\"IDQSR0BKEPO8CLH\"],\"add\":\"\"}', 'Ann', '192.168.254.165', 1611379165),
(178, 'fs_workflow', 'UPDATE', '{\"id\":\"SYR85G14OIPHA9L\",\"description\":\"MAIN OFFICE Workflow\",\"edit\":\"\"}', 'Ann', '192.168.254.165', 1611379179),
(179, 'fs_workflow', 'UPDATE', '{\"id\":\"ZJVUOB63FMWCS9T\",\"description\":\"KNOWLES BRANCH Workflow\",\"edit\":\"\"}', 'Ann', '192.168.254.165', 1611379202),
(180, 'fs_workflow', 'UPDATE', '{\"id\":\"14\"}{\"form_id\":\"0EUZ39FK687SD1Q\"}', 'Ann', '192.168.254.165', 1611379219),
(181, 'fs_user_group', 'UPDATE', '{\"id\":\"4\",\"edit_gname\":\"HR Implementers\",\"edit_gdescription\":\"Implementor\",\"edit_gmembers\":[\"Ann\",\"Syra\",\"Richard\"],\"edit\":\"\"}', 'Ann', '192.168.254.165', 1611379306),
(182, 'fs_request_main', 'UPDATE', '{\"rqid\":\"FCCMPC-0000013\",\"wrkflow_id\":\"SYR85G14OIPHA9L\",\"resubmit\":\"submit\"}', 'Ann', '::1', 1611575548),
(183, 'fs_request_main', 'INSERT', '{\"rqid\":\"FCCMPC-0000014\",\"wflow_id\":\"SYR85G14OIPHA9L\",\"step_id\":\"IDQSR0BKEPO8CLH\",\"sel_actiond\":\"Approved\",\"remarks\":\"\",\"user_apex\":\"submit\"}', 'Ann', '::1', 1611575586),
(184, 'fs_workstpes', 'UPDATE', '{\"id\":\"3\",\"edit_description\":\"Implementers Conformance\",\"edit_usergroup\":\"SAMWXPZ5N6OY\",\"edit_approvaltype\":\"Parallel\",\"edit_confirmtype\":\"Concurrence\",\"edit_timewindow\":\"3\",\"edit_rejectfirst\":\"NA\",\"edit_rejectchange\":\"NA\",\"edit_rejectanchor\":\"No\",\"edit\":\"\"}', 'Ann', '::1', 1611575646),
(185, 'fs_request_main', 'INSERT', '{\"rqid\":\"FCCMPC-0000014\",\"wflow_id\":\"SYR85G14OIPHA9L\",\"step_id\":\"M9RXFWGI31NOQVC\",\"sel_actiond\":\"Confirmed\",\"remarks\":\"\",\"user_apex\":\"\"}', 'Ann', '::1', 1611575664),
(186, 'fs_request_main', 'INSERT', '{\"docname\":\"FCC-001\",\"docdesp\":\"Assets Monitoring\",\"workflow\":\"9MBKG64J7IOAYCE\",\"add\":\"submit\"}', 'Ann', '::1', 1611576281),
(187, 'fs_request_main', 'INSERT', '{\"rqid\":\"\",\"wflow_id\":\"\",\"step_id\":\"\",\"sel_actiond\":\"Approved\",\"remarks\":\"\",\"user_apex\":\"submit\"}', 'Ann', '::1', 1611576639),
(188, 'fs_request_main', 'INSERT', '{\"rqid\":\"FCCMPC-0000015\",\"wflow_id\":\"9MBKG64J7IOAYCE\",\"step_id\":\"LWU2GAZ6HR51O0X\",\"sel_actiond\":\"Disapproved\",\"remarks\":\"test\",\"user_apex\":\"submit\"}', 'Ann', '::1', 1611576672),
(189, 'fs_request_main', 'UPDATE', '{\"rqid\":\"FCCMPC-0000015\",\"wrkflow_id\":\"9MBKG64J7IOAYCE\",\"resubmit\":\"submit\"}', 'Ann', '::1', 1611576710),
(190, 'fs_request_main', 'INSERT', '{\"rqid\":\"FCCMPC-0000015\",\"wflow_id\":\"9MBKG64J7IOAYCE\",\"step_id\":\"LWU2GAZ6HR51O0X\",\"sel_actiond\":\"Approved\",\"remarks\":\"\",\"user_apex\":\"submit\"}', 'Ann', '::1', 1611576735),
(191, 'fs_request_main', 'INSERT', '{\"rqid\":\"FCCMPC-0000015\",\"wflow_id\":\"9MBKG64J7IOAYCE\",\"step_id\":\"M9RXFWGI31NOQVC\",\"sel_actiond\":\"Confirmed\",\"remarks\":\"test\",\"user_apex\":\"\"}', 'Ann', '::1', 1611576755),
(192, 'fs_request_main', 'INSERT', '{\"rqid\":\"\",\"wflow_id\":\"\",\"step_id\":\"\",\"sel_actiond\":\"Approved\",\"remarks\":\"tf\",\"user_apex\":\"submit\"}', 'Ann', '::1', 1611576778),
(193, 'fs_request_main', 'INSERT', '{\"docname\":\"FCC-002\",\"docdesp\":\"F\r\nTEST\",\"workflow\":\"0EUZ39FK687SD1Q\",\"add\":\"submit\"}', 'Ann', '::1', 1611576877),
(194, 'fs_request_main', 'INSERT', '{\"rqid\":\"FCCMPC-0000016\",\"wflow_id\":\"0EUZ39FK687SD1Q\",\"step_id\":\"UI94P61QSGXLWCZ\",\"sel_actiond\":\"Approved\",\"remarks\":\"\",\"user_apex\":\"submit\"}', 'Ann', '::1', 1611576938),
(195, 'fs_workstpes', 'UPDATE', '{\"id\":\"5\",\"edit_description\":\"DCA Approval\",\"edit_usergroup\":\"BSGDR8AYM1U7\",\"edit_approvaltype\":\"Series\",\"edit_confirmtype\":\"Approval\",\"edit_timewindow\":\"3\",\"edit_rejectfirst\":\"N/A\",\"edit_rejectchange\":\"N/A\",\"edit_rejectanchor\":\"Yes\",\"edit\":\"\"}', 'Ann', '::1', 1611576982),
(196, 'fs_request_main', 'INSERT', '{\"rqid\":\"FCCMPC-0000016\",\"wflow_id\":\"0EUZ39FK687SD1Q\",\"step_id\":\"LWU2GAZ6HR51O0X\",\"sel_actiond\":\"Disapproved\",\"remarks\":\"\",\"user_apex\":\"submit\"}', 'Ann', '::1', 1611577001),
(197, 'fs_request_main', 'INSERT', '{\"rqid\":\"FCCMPC-0000016\",\"wflow_id\":\"0EUZ39FK687SD1Q\",\"step_id\":\"LWU2GAZ6HR51O0X\",\"sel_actiond\":\"Approved\",\"remarks\":\"test\",\"user_apex\":\"submit\"}', 'Ann', '::1', 1611577248),
(198, 'fs_request_main', 'INSERT', '{\"rqid\":\"FCCMPC-0000016\",\"wflow_id\":\"0EUZ39FK687SD1Q\",\"step_id\":\"FOES7XV8I35HYCG\",\"sel_actiond\":\"Approved\",\"remarks\":\"\",\"user_apex\":\"submit\"}', 'Ann', '::1', 1611577282),
(199, 'fs_request_main', 'INSERT', '{\"rqid\":\"FCCMPC-0000016\",\"wflow_id\":\"0EUZ39FK687SD1Q\",\"step_id\":\"IDQSR0BKEPO8CLH\",\"sel_actiond\":\"Disapproved\",\"remarks\":\"j\",\"user_apex\":\"submit\"}', 'Ann', '::1', 1611577304),
(200, 'fs_request_main', 'INSERT', '{\"rqid\":\"FCCMPC-0000016\",\"wflow_id\":\"0EUZ39FK687SD1Q\",\"step_id\":\"IDQSR0BKEPO8CLH\",\"sel_actiond\":\"Approved\",\"remarks\":\"\",\"user_apex\":\"submit\"}', 'Ann', '::1', 1611577381),
(201, 'fs_request_main', 'INSERT', '{\"docname\":\"FCPM\",\"docdesp\":\"te\",\"workflow\":\"9MBKG64J7IOAYCE\",\"add\":\"submit\"}', 'Ann', '::1', 1611664917),
(202, 'fs_request_main', 'UPDATE', '{\"refile_id\":\"FCCMPC-0000013\",\"upload\":\"\"}', 'Ann', '::1', 1611665463),
(203, 'fs_request_main', 'INSERT', '{\"docname\":\"NEW POLICY REV. 1\",\"docdesp\":\"est\",\"workflow\":\"SYR85G14OIPHA9L\",\"add\":\"submit\"}', 'Ann', '::1', 1611666029),
(204, 'fs_request_main', 'INSERT', '{\"rqid\":\"FCCMPC-0000018\",\"wflow_id\":\"SYR85G14OIPHA9L\",\"step_id\":\"UI94P61QSGXLWCZ\",\"sel_actiond\":\"Approved\",\"remarks\":\"\",\"user_apex\":\"submit\"}', 'Ann', '::1', 1611666060),
(205, 'fs_request_main', 'INSERT', '{\"rqid\":\"FCCMPC-0000018\",\"wflow_id\":\"SYR85G14OIPHA9L\",\"step_id\":\"LWU2GAZ6HR51O0X\",\"sel_actiond\":\"Disapproved\",\"remarks\":\"\",\"user_apex\":\"submit\"}', 'Ann', '::1', 1611666082),
(206, 'fs_request_main', 'INSERT', '{\"rqid\":\"FCCMPC-0000018\",\"wflow_id\":\"SYR85G14OIPHA9L\",\"step_id\":\"LWU2GAZ6HR51O0X\",\"sel_actiond\":\"Approved\",\"remarks\":\"\",\"user_apex\":\"submit\"}', 'Ann', '::1', 1611666138),
(207, 'fs_request_main', 'INSERT', '{\"rqid\":\"FCCMPC-0000018\",\"wflow_id\":\"SYR85G14OIPHA9L\",\"step_id\":\"FOES7XV8I35HYCG\",\"sel_actiond\":\"Approved\",\"remarks\":\"\",\"user_apex\":\"submit\"}', 'Ann', '::1', 1611666157),
(208, 'fs_request_main', 'INSERT', '{\"rqid\":\"FCCMPC-0000018\",\"wflow_id\":\"SYR85G14OIPHA9L\",\"step_id\":\"IDQSR0BKEPO8CLH\",\"sel_actiond\":\"Approved\",\"remarks\":\"\",\"user_apex\":\"submit\"}', 'Ann', '::1', 1611666181),
(209, 'fs_request_main', 'INSERT', '{\"rqid\":\"FCCMPC-0000018\",\"wflow_id\":\"SYR85G14OIPHA9L\",\"step_id\":\"M9RXFWGI31NOQVC\",\"sel_actiond\":\"Confirmed\",\"remarks\":\"\",\"user_apex\":\"\"}', 'Ann', '::1', 1611666199),
(210, 'fs_request_main', 'INSERT', '{\"rqid\":\"FCCMPC-0000013\",\"wflow_id\":\"SYR85G14OIPHA9L\",\"step_id\":\"FOES7XV8I35HYCG\",\"sel_actiond\":\"Disapproved\",\"remarks\":\"reject\",\"user_apex\":\"submit\"}', 'Ann', '::1', 1611836765),
(211, 'fs_request_main', 'UPDATE', '{\"refile_id\":\"FCCMPC-0000013\",\"upload\":\"\"}', 'Ann', '::1', 1611836827),
(212, 'fs_request_main', 'UPDATE', '{\"rqid\":\"FCCMPC-0000013\",\"wrkflow_id\":\"SYR85G14OIPHA9L\",\"resubmit\":\"submit\"}', 'Ann', '::1', 1611836834),
(213, 'fs_request_main', 'INSERT', '{\"rqid\":\"FCCMPC-0000013\",\"wflow_id\":\"SYR85G14OIPHA9L\",\"step_id\":\"FOES7XV8I35HYCG\",\"sel_actiond\":\"Approved\",\"remarks\":\"\",\"user_apex\":\"submit\"}', 'Ann', '::1', 1611836878);
INSERT INTO `fs_attribute_logger` (`id`, `page_name`, `page_action`, `page_attrib`, `page_user`, `user_ip`, `date_update`) VALUES
(214, 'fs_workstpes', 'UPDATE', '{\"id\":\"3\",\"edit_description\":\"Implementers Conformance\",\"edit_usergroup\":[\"SAMWXPZ5N6OY\",\"RX9MWFLHUY81\",\"BSGDR8AYM1U7\",\"2G4KRSL1W6YI\",\"E7SZRKNA1VB3\"],\"edit_approvaltype\":\"Parallel\",\"edit_confirmtype\":\"Concurrence\",\"edit_timewindow\":\"3\",\"edit_rejectfirst\":\"NA\",\"edit_rejectchange\":\"NA\",\"edit_rejectanchor\":\"No\",\"edit_selectgroup\":\"Yes\",\"edit\":\"\"}', 'Ann', '::1', 1611836972),
(215, 'fs_request_main', 'INSERT', '{\"docname\":\"QMS-FC-002\",\"docdesp\":\"test\",\"workflow\":\"SYR85G14OIPHA9L\",\"task\":\"Implementers Conformance\",\"task_id\":\"M9RXFWGI31NOQVC\",\"app_group\":\"IT Implementers\",\"add\":\"submit\"}', 'Ann', '::1', 1611923747),
(216, 'fs_request_main', 'INSERT', '{\"rqid\":\"FCCMPC-0000019\",\"wflow_id\":\"SYR85G14OIPHA9L\",\"step_id\":\"UI94P61QSGXLWCZ\",\"sel_actiond\":\"Approved\",\"remarks\":\"\",\"user_apex\":\"submit\"}', 'Ann', '::1', 1611923839),
(217, 'fs_request_main', 'INSERT', '{\"rqid\":\"FCCMPC-0000019\",\"wflow_id\":\"SYR85G14OIPHA9L\",\"step_id\":\"LWU2GAZ6HR51O0X\",\"sel_actiond\":\"Approved\",\"remarks\":\"\",\"user_apex\":\"submit\"}', 'Ann', '::1', 1611923857),
(218, 'fs_request_main', 'INSERT', '{\"rqid\":\"FCCMPC-0000019\",\"wflow_id\":\"SYR85G14OIPHA9L\",\"step_id\":\"FOES7XV8I35HYCG\",\"sel_actiond\":\"Approved\",\"remarks\":\"\",\"user_apex\":\"submit\"}', 'Ann', '::1', 1611923893),
(219, 'fs_request_main', 'INSERT', '{\"rqid\":\"FCCMPC-0000019\",\"wflow_id\":\"SYR85G14OIPHA9L\",\"step_id\":\"IDQSR0BKEPO8CLH\",\"sel_actiond\":\"Disapproved\",\"remarks\":\"\",\"user_apex\":\"submit\"}', 'Ann', '::1', 1611923922),
(220, 'fs_request_main', 'INSERT', '{\"docname\":\"QMS-FC-002 \",\"docdesp\":\"rev 7\",\"workflow\":\"SYR85G14OIPHA9L\",\"task\":\"Implementers Conformance\",\"task_id\":\"M9RXFWGI31NOQVC\",\"app_group\":\"2G4KRSL1W6YI\",\"add\":\"submit\"}', 'Ann', '192.168.254.208', 1611969026),
(221, 'fs_user_group', 'UPDATE', '{\"id\":\"11\",\"edit_gname\":\"Collection Dept Implementers\",\"edit_gdescription\":\"Collection Dept \",\"edit_gmembers\":[\"Annjy\",\"Chardey\"],\"edit\":\"\"}', 'Ann', '192.168.254.208', 1611970093),
(222, 'fs_user_group', 'UPDATE', '{\"id\":\"10\",\"edit_gname\":\"Business Dept Implementer\",\"edit_gdescription\":\"Business and IT Dept\",\"edit_gmembers\":[\"JR\"],\"edit\":\"\"}', 'Ann', '192.168.254.208', 1611970140),
(223, 'fs_user_group', 'UPDATE', '{\"id\":\"1\",\"edit_gname\":\"Loan Department Implementers\",\"edit_gdescription\":\"Loan Department\",\"edit_gmembers\":[\"Ailec\",\"Gladys\",\"Rhina\"],\"edit\":\"\"}', 'Ann', '192.168.254.208', 1611970165),
(224, 'fs_user_group', 'UPDATE', '{\"id\":\"12\",\"edit_gname\":\"Knowles Branch Implementers\",\"edit_gdescription\":\"Knowles Branch\",\"edit\":\"\"}', 'Ann', '192.168.254.208', 1611970227),
(225, 'fs_user_group', 'INSERT', '{\"gname\":\"Marketing & Membership Dept Implementers\",\"gdescription\":\"Marketing & Membership Dept\",\"gmembers\":[\"Dux\",\"Charisse\"],\"add\":\"\"}', 'Ann', '192.168.254.208', 1611970304),
(226, 'fs_workstpes', 'UPDATE', '{\"id\":\"3\",\"edit_description\":\"Implementers Conformance\",\"edit_usergroup\":[\"E5KGHJ47DU1A\",\"SAMWXPZ5N6OY\",\"RX9MWFLHUY81\",\"BSGDR8AYM1U7\",\"2G4KRSL1W6YI\",\"E7SZRKNA1VB3\",\"7OWC53Z02H4L\",\"X4AWYOUFMKSI\",\"NCV3ELWT0J64\"],\"edit_approvaltype\":\"Parallel\",\"edit_confirmtype\":\"Concurrence\",\"edit_timewindow\":\"3\",\"edit_rejectfirst\":\"NA\",\"edit_rejectchange\":\"NA\",\"edit_rejectanchor\":\"No\",\"edit_selectgroup\":\"Yes\",\"edit\":\"\"}', 'Ann', '192.168.254.208', 1611970552),
(227, 'fs_workstpes', 'UPDATE', '{\"id\":\"3\",\"edit_description\":\"Implementers Conformance\",\"edit_usergroup\":[\"E5KGHJ47DU1A\",\"SAMWXPZ5N6OY\",\"2G4KRSL1W6YI\",\"E7SZRKNA1VB3\",\"7OWC53Z02H4L\"],\"edit_approvaltype\":\"Parallel\",\"edit_confirmtype\":\"Concurrence\",\"edit_timewindow\":\"3\",\"edit_rejectfirst\":\"NA\",\"edit_rejectchange\":\"NA\",\"edit_rejectanchor\":\"No\",\"edit_selectgroup\":\"Yes\",\"edit\":\"\"}', 'Ann', '192.168.254.208', 1611970574),
(228, 'fs_request_main', 'INSERT', '{\"docname\":\"FC-BD-003\",\"docdesp\":\"bankal\",\"workflow\":\"SYR85G14OIPHA9L\",\"task\":\"Implementers Conformance\",\"task_id\":\"M9RXFWGI31NOQVC\",\"app_group\":\"E5KGHJ47DU1A\",\"add\":\"submit\"}', 'Ann', '192.168.254.208', 1611970906),
(229, 'fs_request_main', 'UPDATE', '{\"refile_id\":\"FCCMPC-0000021\",\"upload\":\"\"}', 'Ann', '192.168.254.208', 1611971048),
(230, 'fs_request_main', 'INSERT', '{\"rqid\":\"FCCMPC-0000021\",\"wflow_id\":\"SYR85G14OIPHA9L\",\"step_id\":\"UI94P61QSGXLWCZ\",\"sel_actiond\":\"Approved\",\"remarks\":\"ok\",\"user_apex\":\"submit\"}', 'Ann', '192.168.254.208', 1611971098),
(231, 'fs_user_group', 'UPDATE', '{\"id\":\"3\",\"edit_gname\":\"General Manager\",\"edit_gdescription\":\"Business General Manager\",\"edit_gmembers\":[\"Reygan\"],\"edit\":\"\"}', 'Ann', '192.168.254.208', 1611971364),
(232, 'fs_user_group', 'UPDATE', '{\"id\":\"3\",\"edit_gname\":\"General Manager\",\"edit_gdescription\":\"Business General Manager\",\"edit_gmembers\":[\"Reygan\"],\"edit\":\"\"}', 'Ann', '192.168.254.208', 1611971392),
(233, 'fs_user_group', 'UPDATE', '{\"id\":\"3\",\"edit_gname\":\"General Manager\",\"edit_gdescription\":\"Business General Manager\",\"edit_gmembers\":[\"Reygan\"],\"edit\":\"\"}', 'Ann', '::1', 1611971405),
(234, 'fs_request_main', 'INSERT', '{\"docname\":\"FC-BD-003\",\"docdesp\":\"bankal\",\"workflow\":\"SYR85G14OIPHA9L\",\"task\":\"Implementers Conformance\",\"task_id\":\"M9RXFWGI31NOQVC\",\"app_group\":\"E5KGHJ47DU1A\",\"add\":\"submit\"}', 'Ann', '192.168.254.208', 1611971454),
(235, 'fs_request_main', 'INSERT', '{\"rqid\":\"FCCMPC-0000022\",\"wflow_id\":\"SYR85G14OIPHA9L\",\"step_id\":\"UI94P61QSGXLWCZ\",\"sel_actiond\":\"Approved\",\"remarks\":\"ok\",\"user_apex\":\"submit\"}', 'Ann', '192.168.254.208', 1611971489),
(236, 'fs_request_main', 'INSERT', '{\"rqid\":\"FCCMPC-0000022\",\"wflow_id\":\"SYR85G14OIPHA9L\",\"step_id\":\"LWU2GAZ6HR51O0X\",\"sel_actiond\":\"Approved\",\"remarks\":\"ok\",\"user_apex\":\"submit\"}', 'Ann', '192.168.254.208', 1611971600),
(237, 'fs_request_main', 'INSERT', '{\"rqid\":\"FCCMPC-0000022\",\"wflow_id\":\"SYR85G14OIPHA9L\",\"step_id\":\"FOES7XV8I35HYCG\",\"sel_actiond\":\"Approved\",\"remarks\":\"ok\",\"user_apex\":\"submit\"}', 'Ann', '192.168.254.208', 1611971658),
(238, 'fs_request_main', 'INSERT', '{\"rqid\":\"FCCMPC-0000022\",\"wflow_id\":\"SYR85G14OIPHA9L\",\"step_id\":\"IDQSR0BKEPO8CLH\",\"sel_actiond\":\"Approved\",\"remarks\":\"ok\",\"user_apex\":\"submit\"}', 'Ann', '192.168.254.208', 1611971717),
(239, 'fs_request_main', 'INSERT', '{\"rqid\":\"FCCMPC-0000022\",\"wflow_id\":\"SYR85G14OIPHA9L\",\"step_id\":\"M9RXFWGI31NOQVC\",\"sel_actiond\":\"Confirmed\",\"remarks\":\"ok\",\"user_apex\":\"submit\"}', 'Ann', '192.168.254.208', 1611971835),
(240, 'fs_user_group', 'UPDATE', '{\"id\":\"3\",\"edit_gname\":\"General Manager\",\"edit_gdescription\":\"General Manager\",\"edit_gmembers\":[\"Reygan\"],\"edit\":\"\"}', 'Ann', '192.168.254.208', 1611972547),
(241, 'fs_request_main', 'INSERT', '{\"docname\":\"FC-BD-003\",\"docdesp\":\"bankal\",\"workflow\":\"SYR85G14OIPHA9L\",\"task\":\"Implementers Conformance\",\"task_id\":\"M9RXFWGI31NOQVC\",\"app_group\":\"2G4KRSL1W6YI\",\"add\":\"submit\"}', 'Ann', '192.168.254.208', 1611972652),
(242, 'fs_request_main', 'INSERT', '{\"rqid\":\"FCCMPC-0000023\",\"wflow_id\":\"SYR85G14OIPHA9L\",\"step_id\":\"UI94P61QSGXLWCZ\",\"sel_actiond\":\"Approved\",\"remarks\":\"ok\",\"user_apex\":\"submit\"}', 'Ann', '192.168.254.208', 1611972791),
(243, 'fs_request_main', 'INSERT', '{\"docname\":\"FC-BD-003\",\"docdesp\":\"bankal\",\"workflow\":\"SYR85G14OIPHA9L\",\"task\":\"Implementers Conformance\",\"task_id\":\"M9RXFWGI31NOQVC\",\"app_group\":\"2G4KRSL1W6YI\",\"add\":\"submit\"}', 'Ann', '192.168.254.208', 1611973216),
(244, 'fs_request_main', 'INSERT', '{\"rqid\":\"FCCMPC-0000024\",\"wflow_id\":\"SYR85G14OIPHA9L\",\"step_id\":\"UI94P61QSGXLWCZ\",\"sel_actiond\":\"Approved\",\"remarks\":\"ok\",\"user_apex\":\"submit\"}', 'Ann', '192.168.254.208', 1611973271),
(245, 'fs_request_main', 'INSERT', '{\"rqid\":\"FCCMPC-0000024\",\"wflow_id\":\"SYR85G14OIPHA9L\",\"step_id\":\"LWU2GAZ6HR51O0X\",\"sel_actiond\":\"Disapproved\",\"remarks\":\"to add Responsibility\",\"user_apex\":\"submit\"}', 'Ann', '192.168.254.208', 1611973322),
(246, 'fs_request_main', 'UPDATE', '{\"refile_id\":\"FCCMPC-0000024\",\"upload\":\"\"}', 'Ann', '192.168.254.208', 1611973391),
(247, 'fs_request_main', 'UPDATE', '{\"rqid\":\"FCCMPC-0000024\",\"wrkflow_id\":\"SYR85G14OIPHA9L\",\"resubmit\":\"submit\"}', 'Ann', '192.168.254.208', 1611973455),
(248, 'fs_request_main', 'INSERT', '{\"rqid\":\"FCCMPC-0000024\",\"wflow_id\":\"SYR85G14OIPHA9L\",\"step_id\":\"LWU2GAZ6HR51O0X\",\"sel_actiond\":\"Approved\",\"remarks\":\"Gwapo si Reygan\",\"user_apex\":\"submit\"}', 'Reygan', '192.168.254.120', 1611973941),
(249, 'fs_request_main', 'INSERT', '{\"rqid\":\"FCCMPC-0000024\",\"wflow_id\":\"SYR85G14OIPHA9L\",\"step_id\":\"FOES7XV8I35HYCG\",\"sel_actiond\":\"Approved\",\"remarks\":\"ok\",\"user_apex\":\"submit\"}', 'Ann', '192.168.254.208', 1611974057),
(250, 'fs_request_main', 'INSERT', '{\"rqid\":\"FCCMPC-0000024\",\"wflow_id\":\"SYR85G14OIPHA9L\",\"step_id\":\"IDQSR0BKEPO8CLH\",\"sel_actiond\":\"Disapproved\",\"remarks\":\"to consider the rate applied\",\"user_apex\":\"submit\"}', 'Ann', '192.168.254.208', 1611974248),
(251, 'fs_users', 'UPDATE', '{\"id\":\"7\",\"userId\":\"Ann\",\"firstname\":\"Ann\",\"middlename\":\"E.\",\"lastname\":\"Sorela\",\"emailadd\":\"annalyn.sorela@yahoo.com\",\"password\":\"$2y$10$k3hlKmlRjVeZoMgFv.7BbeQjb/p1Jt1JJGSpW8rkSFNamjvGom0Su\",\"accesslevel\":[\"Approver\",\"Implementor\",\"DocAdmin\"],\"department\":\"1\",\"edit\":\"\"}', 'Ann', '192.168.254.208', 1611974613),
(252, 'fs_request_main', '', '{\"refile_id\":\"FCCMPC-0000024\"}', 'Ann', '192.168.254.208', 1611974674),
(253, 'fs_request_main', 'UPDATE', '{\"refile_id\":\"FCCMPC-0000024\",\"upload\":\"\"}', 'Ann', '192.168.254.208', 1611974677),
(254, 'fs_request_main', 'UPDATE', '{\"rqid\":\"FCCMPC-0000024\",\"wrkflow_id\":\"SYR85G14OIPHA9L\",\"resubmit\":\"submit\"}', 'Ann', '192.168.254.208', 1611974693),
(255, 'fs_users', 'UPDATE', '{\"id\":\"7\",\"userId\":\"Ann\",\"firstname\":\"Ann\",\"middlename\":\"E.\",\"lastname\":\"Sorela\",\"emailadd\":\"annalyn.sorela@yahoo.com\",\"password\":\"$2y$10$k3hlKmlRjVeZoMgFv.7BbeQjb/p1Jt1JJGSpW8rkSFNamjvGom0Su\",\"accesslevel\":[\"Approver\",\"Implementor\",\"DocAdmin\",\"Administrator\"],\"department\":\"1\",\"edit\":\"\"}', 'Ann', '::1', 1611974788),
(256, 'fs_request_main', 'INSERT', '{\"rqid\":\"FCCMPC-0000024\",\"wflow_id\":\"SYR85G14OIPHA9L\",\"step_id\":\"FOES7XV8I35HYCG\",\"sel_actiond\":\"Approved\",\"remarks\":\"ok\",\"user_apex\":\"submit\"}', 'Ann', '192.168.254.208', 1611974831),
(257, 'fs_request_main', 'INSERT', '{\"rqid\":\"FCCMPC-0000024\",\"wflow_id\":\"SYR85G14OIPHA9L\",\"step_id\":\"IDQSR0BKEPO8CLH\",\"sel_actiond\":\"Disapproved\",\"remarks\":\"update requirement in section 6\",\"user_apex\":\"submit\"}', 'yuya', '192.168.250.76', 1611975007),
(258, 'fs_users', 'UPDATE', '{\"id\":\"13\",\"userId\":\"yuya\",\"firstname\":\"Philura\",\"middlename\":\"M.\",\"lastname\":\"Hipe\",\"emailadd\":\"yujhipe@gmail.com\",\"password\":\"$2y$10$kQHfQZVLhVjUycCZhRSBaug5rftbxS8Rn8xRJ4I18Vv8XCs4umN92\",\"accesslevel\":[\"Approver\",\"Implementor\"],\"department\":\"6\",\"edit\":\"\"}', 'Ann', '192.168.254.208', 1611975158),
(259, 'fs_request_main', 'UPDATE', '{\"refile_id\":\"FCCMPC-0000024\",\"upload\":\"\"}', 'Ann', '192.168.254.208', 1611975583),
(260, 'fs_request_main', 'UPDATE', '{\"rqid\":\"FCCMPC-0000024\",\"wrkflow_id\":\"SYR85G14OIPHA9L\",\"resubmit\":\"submit\"}', 'Ann', '192.168.254.208', 1611975594),
(261, 'fs_request_main', 'INSERT', '{\"rqid\":\"FCCMPC-0000024\",\"wflow_id\":\"SYR85G14OIPHA9L\",\"step_id\":\"FOES7XV8I35HYCG\",\"sel_actiond\":\"Approved\",\"remarks\":\"ok\",\"user_apex\":\"submit\"}', 'Ann', '192.168.254.208', 1611975657),
(262, 'fs_request_main', 'INSERT', '{\"rqid\":\"FCCMPC-0000024\",\"wflow_id\":\"SYR85G14OIPHA9L\",\"step_id\":\"IDQSR0BKEPO8CLH\",\"sel_actiond\":\"Approved\",\"remarks\":\"ok\",\"user_apex\":\"submit\"}', 'yuya', '192.168.250.76', 1611975711),
(263, 'fs_users', 'UPDATE', '{\"id\":\"27\",\"userId\":\"Teo\",\"firstname\":\"Teofredo\",\"middlename\":\"C.\",\"lastname\":\"Llido Jr.\",\"emailadd\":\"teofredo.llido@gmail.com\",\"password\":\"12345\",\"accesslevel\":[\"Implementor\"],\"department\":\"5\",\"edit\":\"\"}', 'Ann', '192.168.254.208', 1611975929),
(264, 'fs_users', 'UPDATE', '{\"id\":\"14\",\"userId\":\"Christine\",\"firstname\":\"Christine\",\"middlename\":\"T\",\"lastname\":\"Bajao\",\"emailadd\":\"christinebajao.8894@gmail.com\",\"password\":\"12345\",\"accesslevel\":[\"Implementor\"],\"department\":\"5\",\"edit\":\"\"}', 'Ann', '192.168.254.208', 1611977286),
(265, 'fs_users', 'UPDATE', '{\"id\":\"14\",\"userId\":\"Christine\",\"firstname\":\"Christine\",\"middlename\":\"T\",\"lastname\":\"Bajao\",\"emailadd\":\"christinebajao.8894@gmail.com\",\"password\":\"$2y$10$lK.NmxGdKVxwIkZt3Yuv2emB./d1VKn5ihDIBot.4cBXbiPMUVPUm\",\"accesslevel\":[\"Implementor\"],\"department\":\"5\",\"edit\":\"\"}', 'Hilberth', '::1', 1611977307),
(266, 'fs_request_main', 'INSERT', '{\"docname\":\"FC-BD-003\",\"docdesp\":\"Bankal\",\"workflow\":\"SYR85G14OIPHA9L\",\"task\":\"Implementers Conformance\",\"task_id\":\"M9RXFWGI31NOQVC\",\"app_group\":\"2G4KRSL1W6YI\",\"add\":\"submit\"}', 'Teo', '192.168.250.76', 1611977509),
(267, 'fs_request_main', 'INSERT', '{\"rqid\":\"FCCMPC-0000025\",\"wflow_id\":\"SYR85G14OIPHA9L\",\"step_id\":\"UI94P61QSGXLWCZ\",\"sel_actiond\":\"Approved\",\"remarks\":\"ok\",\"user_apex\":\"submit\"}', 'Ann', '192.168.254.208', 1611977560),
(268, 'fs_request_main', 'INSERT', '{\"rqid\":\"FCCMPC-0000025\",\"wflow_id\":\"SYR85G14OIPHA9L\",\"step_id\":\"LWU2GAZ6HR51O0X\",\"sel_actiond\":\"Approved\",\"remarks\":\"Obispo si Reygan\",\"user_apex\":\"submit\"}', 'Reygan', '192.168.254.120', 1611977674),
(269, 'fs_request_main', 'INSERT', '{\"rqid\":\"FCCMPC-0000025\",\"wflow_id\":\"SYR85G14OIPHA9L\",\"step_id\":\"FOES7XV8I35HYCG\",\"sel_actiond\":\"Approved\",\"remarks\":\"ok\",\"user_apex\":\"submit\"}', 'Ann', '192.168.254.208', 1611977746),
(270, 'fs_request_main', 'INSERT', '{\"rqid\":\"FCCMPC-0000025\",\"wflow_id\":\"SYR85G14OIPHA9L\",\"step_id\":\"IDQSR0BKEPO8CLH\",\"sel_actiond\":\"Approved\",\"remarks\":\"ok\",\"user_apex\":\"submit\"}', 'yuya', '192.168.250.76', 1611977826),
(271, 'fs_request_main', 'INSERT', '{\"docname\":\"FC-BD-003\",\"docdesp\":\"Bankal\",\"workflow\":\"SYR85G14OIPHA9L\",\"task\":\"Implementers Conformance\",\"task_id\":\"M9RXFWGI31NOQVC\",\"app_group\":\"2G4KRSL1W6YI\",\"add\":\"submit\"}', 'Teo', '192.168.250.76', 1611977974),
(272, 'fs_request_main', 'INSERT', '{\"rqid\":\"FCCMPC-0000026\",\"wflow_id\":\"SYR85G14OIPHA9L\",\"step_id\":\"UI94P61QSGXLWCZ\",\"sel_actiond\":\"Approved\",\"remarks\":\"\",\"user_apex\":\"submit\"}', 'Hilberth', '::1', 1611978057),
(273, 'fs_request_main', 'INSERT', '{\"rqid\":\"FCCMPC-0000026\",\"wflow_id\":\"SYR85G14OIPHA9L\",\"step_id\":\"LWU2GAZ6HR51O0X\",\"sel_actiond\":\"Approved\",\"remarks\":\"\",\"user_apex\":\"submit\"}', 'Hilberth', '::1', 1611978075),
(274, 'fs_request_main', 'INSERT', '{\"rqid\":\"FCCMPC-0000026\",\"wflow_id\":\"SYR85G14OIPHA9L\",\"step_id\":\"FOES7XV8I35HYCG\",\"sel_actiond\":\"Approved\",\"remarks\":\"\",\"user_apex\":\"submit\"}', 'Hilberth', '::1', 1611978093),
(275, 'fs_request_main', 'INSERT', '{\"rqid\":\"FCCMPC-0000026\",\"wflow_id\":\"SYR85G14OIPHA9L\",\"step_id\":\"IDQSR0BKEPO8CLH\",\"sel_actiond\":\"Approved\",\"remarks\":\"\",\"user_apex\":\"submit\"}', 'Hilberth', '::1', 1611978110),
(276, 'fs_user_group', 'UPDATE', '{\"id\":\"9\",\"edit_gname\":\"IT Implementers\",\"edit_gdescription\":\"IT\",\"edit_gmembers\":[\"Christine\",\"Teo\"],\"edit\":\"\"}', 'Hilberth', '::1', 1611978143),
(277, 'fs_users', 'UPDATE', '{\"id\":\"14\",\"userId\":\"Christine\",\"firstname\":\"Christine\",\"middlename\":\"T\",\"lastname\":\"Bajao\",\"emailadd\":\"christinebajao.8894@gmail.com\",\"password\":\"12345\",\"accesslevel\":[\"Implementor\"],\"department\":\"5\",\"edit\":\"\"}', 'Hilberth', '::1', 1611978468),
(278, 'fs_request_main', 'INSERT', '{\"docname\":\"QMS-FC-002 \",\"docdesp\":\"Document Control\",\"workflow\":\"SYR85G14OIPHA9L\",\"task\":\"Implementers Conformance\",\"task_id\":\"M9RXFWGI31NOQVC\",\"app_group\":\"2G4KRSL1W6YI\",\"add\":\"submit\"}', 'Ann', '192.168.254.208', 1611979165),
(279, 'fs_request_main', 'INSERT', '{\"rqid\":\"FCCMPC-0000027\",\"wflow_id\":\"SYR85G14OIPHA9L\",\"step_id\":\"UI94P61QSGXLWCZ\",\"sel_actiond\":\"Approved\",\"remarks\":\"ok\",\"user_apex\":\"submit\"}', 'Ann', '192.168.254.208', 1611979228),
(280, 'fs_request_main', 'INSERT', '{\"rqid\":\"FCCMPC-0000026\",\"wflow_id\":\"SYR85G14OIPHA9L\",\"step_id\":\"M9RXFWGI31NOQVC\",\"sel_actiond\":\"Confirmed\",\"remarks\":\"\",\"user_apex\":\"submit\"}', 'Hilberth', '::1', 1611980691),
(281, 'fs_request_main', 'INSERT', '{\"docname\":\"rt\",\"docdesp\":\"r\",\"workflow\":\"SYR85G14OIPHA9L\",\"task\":\"Implementers Conformance\",\"task_id\":\"M9RXFWGI31NOQVC\",\"app_group\":\"E5KGHJ47DU1A\",\"add\":\"submit\"}', 'Hilberth', '::1', 1612185140),
(282, 'fs_request_main', 'UPDATE', '{\"refile_id\":\"FCCMPC-0000028\",\"upload\":\"\"}', 'Hilberth', '::1', 1612185162),
(283, 'fs_request_main', 'INSERT', '{\"docname\":\"QMS-FC-002 \",\"docdesp\":\"Doccon\",\"workflow\":\"SYR85G14OIPHA9L\",\"task\":\"Implementers Conformance\",\"task_id\":\"M9RXFWGI31NOQVC\",\"app_group\":\"SAMWXPZ5N6OY\",\"revno\":\"07\",\"add\":\"submit\"}', 'Ann', '192.168.254.208', 1612573192),
(284, 'fs_request_main', 'INSERT', '{\"rqid\":\"FCCMPC-0000029\",\"wflow_id\":\"SYR85G14OIPHA9L\",\"step_id\":\"UI94P61QSGXLWCZ\",\"sel_actiond\":\"Approved\",\"remarks\":\"ok\",\"user_apex\":\"submit\"}', 'Sheila', '192.168.254.105', 1612573436),
(285, 'fs_request_main', 'INSERT', '{\"rqid\":\"FCCMPC-0000029\",\"wflow_id\":\"SYR85G14OIPHA9L\",\"step_id\":\"UI94P61QSGXLWCZ\",\"sel_actiond\":\"Approved\",\"remarks\":\"ok\",\"user_apex\":\"submit\"}', 'Salvie', '192.168.254.105', 1612573499),
(286, 'fs_request_main', 'INSERT', '{\"rqid\":\"FCCMPC-0000029\",\"wflow_id\":\"SYR85G14OIPHA9L\",\"step_id\":\"UI94P61QSGXLWCZ\",\"sel_actiond\":\"Approved\",\"remarks\":\"ok\",\"user_apex\":\"submit\"}', 'Minda', '192.168.254.105', 1612573570),
(287, 'fs_request_main', 'INSERT', '{\"rqid\":\"FCCMPC-0000029\",\"wflow_id\":\"SYR85G14OIPHA9L\",\"step_id\":\"UI94P61QSGXLWCZ\",\"sel_actiond\":\"Approved\",\"remarks\":\"ok\",\"user_apex\":\"submit\"}', 'Whien', '192.168.254.105', 1612573633),
(288, 'fs_request_main', 'INSERT', '{\"rqid\":\"FCCMPC-0000029\",\"wflow_id\":\"SYR85G14OIPHA9L\",\"step_id\":\"UI94P61QSGXLWCZ\",\"sel_actiond\":\"Approved\",\"remarks\":\"ok\",\"user_apex\":\"submit\"}', 'Nitz', '192.168.254.105', 1612573672),
(289, 'fs_request_main', 'INSERT', '{\"rqid\":\"FCCMPC-0000029\",\"wflow_id\":\"SYR85G14OIPHA9L\",\"step_id\":\"UI94P61QSGXLWCZ\",\"sel_actiond\":\"Approved\",\"remarks\":\"ok\",\"user_apex\":\"submit\"}', 'Tad', '192.168.254.105', 1612573710),
(290, 'fs_request_main', 'INSERT', '{\"docname\":\"QMS-FC-002 \",\"docdesp\":\"Document Control\",\"workflow\":\"SYR85G14OIPHA9L\",\"task\":\"Implementers Conformance\",\"task_id\":\"M9RXFWGI31NOQVC\",\"app_group\":[\"E5KGHJ47DU1A\",\"SAMWXPZ5N6OY\",\"2G4KRSL1W6YI\",\"E7SZRKNA1VB3\",\"7OWC53Z02H4L\"],\"revno\":\"07\",\"add\":\"submit\"}', 'Ann', '192.168.254.208', 1612576580),
(291, 'fs_request_main', 'INSERT', '{\"rqid\":\"FCCMPC-0000030\",\"wflow_id\":\"SYR85G14OIPHA9L\",\"step_id\":\"UI94P61QSGXLWCZ\",\"sel_actiond\":\"Approved\",\"remarks\":\"ok\",\"user_apex\":\"submit\"}', 'Tad', '192.168.254.105', 1612576733),
(292, 'fs_request_main', 'INSERT', '{\"rqid\":\"FCCMPC-0000030\",\"wflow_id\":\"SYR85G14OIPHA9L\",\"step_id\":\"UI94P61QSGXLWCZ\",\"sel_actiond\":\"Approved\",\"remarks\":\"ok\",\"user_apex\":\"submit\"}', 'Sheila', '192.168.254.105', 1612576775),
(293, 'fs_request_main', 'INSERT', '{\"rqid\":\"FCCMPC-0000030\",\"wflow_id\":\"SYR85G14OIPHA9L\",\"step_id\":\"UI94P61QSGXLWCZ\",\"sel_actiond\":\"Approved\",\"remarks\":\"ok\",\"user_apex\":\"submit\"}', 'Salvie', '192.168.254.105', 1612576814),
(294, 'fs_request_main', 'INSERT', '{\"rqid\":\"FCCMPC-0000030\",\"wflow_id\":\"SYR85G14OIPHA9L\",\"step_id\":\"UI94P61QSGXLWCZ\",\"sel_actiond\":\"Approved\",\"remarks\":\"ok\",\"user_apex\":\"submit\"}', 'Minda', '192.168.254.105', 1612576854),
(295, 'fs_request_main', 'INSERT', '{\"rqid\":\"FCCMPC-0000030\",\"wflow_id\":\"SYR85G14OIPHA9L\",\"step_id\":\"UI94P61QSGXLWCZ\",\"sel_actiond\":\"Approved\",\"remarks\":\"ok\",\"user_apex\":\"submit\"}', 'Whien', '192.168.254.105', 1612576888),
(296, 'fs_request_main', 'INSERT', '{\"rqid\":\"FCCMPC-0000030\",\"wflow_id\":\"SYR85G14OIPHA9L\",\"step_id\":\"UI94P61QSGXLWCZ\",\"sel_actiond\":\"Approved\",\"remarks\":\"ok\",\"user_apex\":\"submit\"}', 'Nitz', '192.168.254.105', 1612576946),
(297, 'fs_request_main', 'INSERT', '{\"rqid\":\"FCCMPC-0000030\",\"wflow_id\":\"SYR85G14OIPHA9L\",\"step_id\":\"LWU2GAZ6HR51O0X\",\"sel_actiond\":\"Approved\",\"remarks\":\"\",\"user_apex\":\"submit\"}', 'Reygan', '192.168.254.120', 1612577330),
(298, 'fs_request_main', '', '[]', 'Nitz', '192.168.254.105', 1612577367),
(299, 'fs_request_main', 'INSERT', '{\"rqid\":\"FCCMPC-0000030\",\"wflow_id\":\"SYR85G14OIPHA9L\",\"step_id\":\"FOES7XV8I35HYCG\",\"sel_actiond\":\"Approved\",\"remarks\":\"ok\",\"user_apex\":\"submit\"}', 'Ann', '192.168.254.208', 1612577387),
(300, 'fs_request_main', 'INSERT', '{\"rqid\":\"FCCMPC-0000030\",\"wflow_id\":\"SYR85G14OIPHA9L\",\"step_id\":\"IDQSR0BKEPO8CLH\",\"sel_actiond\":\"Approved\",\"remarks\":\"ok\",\"user_apex\":\"submit\"}', 'yuya', '192.168.250.76', 1612577714),
(301, 'fs_request_main', 'INSERT', '{\"rqid\":\"FCCMPC-0000030\",\"wflow_id\":\"SYR85G14OIPHA9L\",\"step_id\":\"IDQSR0BKEPO8CLH\",\"sel_actiond\":\"Approved\",\"remarks\":\"ok\",\"user_apex\":\"submit\"}', 'Jema', '192.168.254.105', 1612577845),
(302, 'fs_request_main', 'INSERT', '{\"docname\":\"FC-BD-003\",\"docdesp\":\"Business\",\"workflow\":\"SYR85G14OIPHA9L\",\"task\":\"Implementers Conformance\",\"task_id\":\"M9RXFWGI31NOQVC\",\"app_group\":[\"2G4KRSL1W6YI\",\"E7SZRKNA1VB3\"],\"revno\":\"5\",\"add\":\"submit\"}', 'Ann', '192.168.254.208', 1612578092),
(303, 'fs_request_main', 'INSERT', '{\"rqid\":\"FCCMPC-0000031\",\"wflow_id\":\"SYR85G14OIPHA9L\",\"step_id\":\"UI94P61QSGXLWCZ\",\"sel_actiond\":\"Approved\",\"remarks\":\"ok\",\"user_apex\":\"submit\"}', 'Salvie', '192.168.254.105', 1612578162),
(304, 'fs_request_main', 'INSERT', '{\"rqid\":\"FCCMPC-0000031\",\"wflow_id\":\"SYR85G14OIPHA9L\",\"step_id\":\"UI94P61QSGXLWCZ\",\"sel_actiond\":\"Approved\",\"remarks\":\"ok\",\"user_apex\":\"submit\"}', 'Sheila', '192.168.254.208', 1612578183),
(305, 'fs_request_main', 'INSERT', '{\"rqid\":\"FCCMPC-0000031\",\"wflow_id\":\"SYR85G14OIPHA9L\",\"step_id\":\"UI94P61QSGXLWCZ\",\"sel_actiond\":\"Approved\",\"remarks\":\"ok\",\"user_apex\":\"submit\"}', 'Nitz', '192.168.250.76', 1612578189),
(306, 'fs_request_main', 'INSERT', '{\"rqid\":\"FCCMPC-0000031\",\"wflow_id\":\"SYR85G14OIPHA9L\",\"step_id\":\"UI94P61QSGXLWCZ\",\"sel_actiond\":\"Approved\",\"remarks\":\"ok\",\"user_apex\":\"submit\"}', 'Minda', '192.168.254.105', 1612578202),
(307, 'fs_request_main', 'INSERT', '{\"rqid\":\"FCCMPC-0000031\",\"wflow_id\":\"SYR85G14OIPHA9L\",\"step_id\":\"UI94P61QSGXLWCZ\",\"sel_actiond\":\"Approved\",\"remarks\":\"ok\",\"user_apex\":\"submit\"}', 'Tad', '192.168.254.105', 1612578245),
(308, 'fs_request_main', 'INSERT', '{\"rqid\":\"FCCMPC-0000031\",\"wflow_id\":\"SYR85G14OIPHA9L\",\"step_id\":\"UI94P61QSGXLWCZ\",\"sel_actiond\":\"Approved\",\"remarks\":\"ok\",\"user_apex\":\"submit\"}', 'Whien', '192.168.250.76', 1612578270),
(309, 'fs_request_main', 'INSERT', '{\"rqid\":\"FCCMPC-0000031\",\"wflow_id\":\"SYR85G14OIPHA9L\",\"step_id\":\"LWU2GAZ6HR51O0X\",\"sel_actiond\":\"Approved\",\"remarks\":\"\",\"user_apex\":\"submit\"}', 'Reygan', '192.168.254.120', 1612578350),
(310, 'fs_request_main', 'INSERT', '{\"rqid\":\"FCCMPC-0000031\",\"wflow_id\":\"SYR85G14OIPHA9L\",\"step_id\":\"FOES7XV8I35HYCG\",\"sel_actiond\":\"Approved\",\"remarks\":\"ok\",\"user_apex\":\"submit\"}', 'Ann', '192.168.254.208', 1612578614),
(311, 'fs_request_main', 'INSERT', '{\"rqid\":\"FCCMPC-0000031\",\"wflow_id\":\"SYR85G14OIPHA9L\",\"step_id\":\"IDQSR0BKEPO8CLH\",\"sel_actiond\":\"Approved\",\"remarks\":\"ok\",\"user_apex\":\"submit\"}', 'Jema', '192.168.254.208', 1612578679),
(312, 'fs_request_main', 'INSERT', '{\"rqid\":\"FCCMPC-0000031\",\"wflow_id\":\"SYR85G14OIPHA9L\",\"step_id\":\"IDQSR0BKEPO8CLH\",\"sel_actiond\":\"Approved\",\"remarks\":\"ok\",\"user_apex\":\"submit\"}', 'yuya', '192.168.250.76', 1612578803),
(313, 'fs_users', 'UPDATE', '{\"id\":\"33\",\"userId\":\"Tad\",\"firstname\":\"Rudolph\",\"middlename\":\"C.\",\"lastname\":\"Montayre\",\"emailadd\":\"annalyn.sorela@yahoo.com\",\"password\":\"$2y$10$Sjz0CZX3Mrln9Rg7Kl.Nwet5sgRfzoV5GMaO4U37byxyqr20WFhIS\",\"accesslevel\":[\"Approver\",\"Administrator\"],\"department\":\"5\",\"edit\":\"\"}', 'Ann', '192.168.254.208', 1612579689),
(314, 'fs_users', 'UPDATE', '{\"id\":\"33\",\"userId\":\"Tad\",\"firstname\":\"Rudolph\",\"middlename\":\"C.\",\"lastname\":\"Montayre\",\"emailadd\":\"annalyn.sorela@yahoo.com\",\"password\":\"$2y$10$Sjz0CZX3Mrln9Rg7Kl.Nwet5sgRfzoV5GMaO4U37byxyqr20WFhIS\",\"accesslevel\":[\"Approver\",\"Implementor\"],\"department\":\"5\",\"edit\":\"\"}', 'Ann', '192.168.254.208', 1612579927),
(315, 'fs_request_main', 'INSERT', '{\"docname\":\"FC-BD-003\",\"docdesp\":\"business\",\"workflow\":\"SYR85G14OIPHA9L\",\"task\":\"Implementers Conformance\",\"task_id\":\"M9RXFWGI31NOQVC\",\"app_group\":[\"E7SZRKNA1VB3\"],\"revno\":\"02\",\"add\":\"submit\"}', 'Tad', '192.168.254.105', 1612580159),
(316, 'fs_request_main', 'INSERT', '{\"rqid\":\"FCCMPC-0000032\",\"wflow_id\":\"SYR85G14OIPHA9L\",\"step_id\":\"UI94P61QSGXLWCZ\",\"sel_actiond\":\"Approved\",\"remarks\":\"ok\",\"user_apex\":\"submit\"}', 'Salvie', '192.168.254.105', 1612580372),
(317, 'fs_request_main', 'INSERT', '{\"rqid\":\"FCCMPC-0000032\",\"wflow_id\":\"SYR85G14OIPHA9L\",\"step_id\":\"UI94P61QSGXLWCZ\",\"sel_actiond\":\"Approved\",\"remarks\":\"ok\",\"user_apex\":\"submit\"}', 'Whien', '192.168.250.76', 1612580411),
(318, 'fs_request_main', 'INSERT', '{\"rqid\":\"FCCMPC-0000032\",\"wflow_id\":\"SYR85G14OIPHA9L\",\"step_id\":\"UI94P61QSGXLWCZ\",\"sel_actiond\":\"Approved\",\"remarks\":\"ok\",\"user_apex\":\"submit\"}', 'Nitz', '192.168.254.105', 1612580413),
(319, 'fs_request_main', 'INSERT', '{\"rqid\":\"FCCMPC-0000032\",\"wflow_id\":\"SYR85G14OIPHA9L\",\"step_id\":\"UI94P61QSGXLWCZ\",\"sel_actiond\":\"Approved\",\"remarks\":\"ok\",\"user_apex\":\"submit\"}', 'Minda', '192.168.254.105', 1612580455),
(320, 'fs_request_main', 'INSERT', '{\"rqid\":\"FCCMPC-0000032\",\"wflow_id\":\"SYR85G14OIPHA9L\",\"step_id\":\"UI94P61QSGXLWCZ\",\"sel_actiond\":\"Approved\",\"remarks\":\"ok\",\"user_apex\":\"submit\"}', 'Sheila', '192.168.254.208', 1612580479),
(321, 'fs_request_main', 'INSERT', '{\"rqid\":\"FCCMPC-0000032\",\"wflow_id\":\"SYR85G14OIPHA9L\",\"step_id\":\"UI94P61QSGXLWCZ\",\"sel_actiond\":\"Approved\",\"remarks\":\"ok\",\"user_apex\":\"submit\"}', 'Tad', '192.168.254.105', 1612580528),
(322, 'fs_request_main', 'INSERT', '{\"rqid\":\"FCCMPC-0000032\",\"wflow_id\":\"SYR85G14OIPHA9L\",\"step_id\":\"LWU2GAZ6HR51O0X\",\"sel_actiond\":\"Approved\",\"remarks\":\"\",\"user_apex\":\"submit\"}', 'Reygan', '192.168.254.120', 1612580733),
(323, 'fs_request_main', 'INSERT', '{\"rqid\":\"FCCMPC-0000032\",\"wflow_id\":\"SYR85G14OIPHA9L\",\"step_id\":\"FOES7XV8I35HYCG\",\"sel_actiond\":\"Approved\",\"remarks\":\"ok\",\"user_apex\":\"submit\"}', 'Ann', '192.168.254.208', 1612580800),
(324, 'fs_request_main', 'INSERT', '{\"docname\":\"FC-BD-005\",\"docdesp\":\"b\",\"workflow\":\"SYR85G14OIPHA9L\",\"task\":\"Implementers Conformance\",\"task_id\":\"M9RXFWGI31NOQVC\",\"app_group\":[\"E7SZRKNA1VB3\"],\"revno\":\"3\",\"add\":\"submit\"}', 'Tad', '192.168.254.105', 1612580810),
(325, 'fs_request_main', 'INSERT', '{\"rqid\":\"FCCMPC-0000032\",\"wflow_id\":\"SYR85G14OIPHA9L\",\"step_id\":\"IDQSR0BKEPO8CLH\",\"sel_actiond\":\"Approved\",\"remarks\":\"ok\",\"user_apex\":\"submit\"}', 'Jema', '192.168.254.208', 1612580857),
(326, 'fs_request_main', 'INSERT', '{\"rqid\":\"FCCMPC-0000032\",\"wflow_id\":\"SYR85G14OIPHA9L\",\"step_id\":\"IDQSR0BKEPO8CLH\",\"sel_actiond\":\"Approved\",\"remarks\":\"ok\",\"user_apex\":\"submit\"}', 'yuya', '192.168.250.76', 1612580870),
(327, 'fs_request_main', 'INSERT', '{\"rqid\":\"FCCMPC-0000033\",\"wflow_id\":\"SYR85G14OIPHA9L\",\"step_id\":\"UI94P61QSGXLWCZ\",\"sel_actiond\":\"Approved\",\"remarks\":\"ok\",\"user_apex\":\"submit\"}', 'Nitz', '192.168.254.105', 1612580881),
(328, 'fs_users', 'UPDATE', '{\"id\":\"18\",\"userId\":\"JR\",\"firstname\":\"Jhun Rey\",\"middlename\":\"P.\",\"lastname\":\"Amorganda\",\"emailadd\":\"annalyn.sorela@yahoo.com\",\"password\":\"12345\",\"accesslevel\":[\"Implementor\"],\"department\":\"5\",\"edit\":\"\"}', 'Ann', '192.168.254.208', 1612580937),
(329, 'fs_request_main', 'INSERT', '{\"rqid\":\"FCCMPC-0000033\",\"wflow_id\":\"SYR85G14OIPHA9L\",\"step_id\":\"UI94P61QSGXLWCZ\",\"sel_actiond\":\"Approved\",\"remarks\":\"ok\",\"user_apex\":\"submit\"}', 'Salvie', '192.168.254.208', 1612582757),
(330, 'fs_request_main', 'INSERT', '{\"rqid\":\"FCCMPC-0000033\",\"wflow_id\":\"SYR85G14OIPHA9L\",\"step_id\":\"UI94P61QSGXLWCZ\",\"sel_actiond\":\"Approved\",\"remarks\":\"ok\",\"user_apex\":\"submit\"}', 'Tad', '192.168.254.105', 1612582781),
(331, 'fs_request_main', 'INSERT', '{\"rqid\":\"FCCMPC-0000033\",\"wflow_id\":\"SYR85G14OIPHA9L\",\"step_id\":\"UI94P61QSGXLWCZ\",\"sel_actiond\":\"Approved\",\"remarks\":\"ok\",\"user_apex\":\"submit\"}', 'Minda', '192.168.254.105', 1612582823),
(332, 'fs_request_main', 'INSERT', '{\"rqid\":\"FCCMPC-0000033\",\"wflow_id\":\"SYR85G14OIPHA9L\",\"step_id\":\"UI94P61QSGXLWCZ\",\"sel_actiond\":\"Approved\",\"remarks\":\"ok\",\"user_apex\":\"submit\"}', 'Whien', '192.168.254.105', 1612582855),
(333, 'fs_request_main', 'INSERT', '{\"rqid\":\"FCCMPC-0000033\",\"wflow_id\":\"SYR85G14OIPHA9L\",\"step_id\":\"UI94P61QSGXLWCZ\",\"sel_actiond\":\"Approved\",\"remarks\":\"\",\"user_apex\":\"submit\"}', 'Sheila', '192.168.254.105', 1612582908),
(334, 'fs_request_main', 'INSERT', '{\"rqid\":\"FCCMPC-0000033\",\"wflow_id\":\"SYR85G14OIPHA9L\",\"step_id\":\"LWU2GAZ6HR51O0X\",\"sel_actiond\":\"Disapproved\",\"remarks\":\"\",\"user_apex\":\"submit\"}', 'Reygan', '192.168.254.120', 1612583116),
(335, 'fs_user_group', 'INSERT', '{\"gname\":\"Department Heads Implementers \",\"gdescription\":\"Department Heads \",\"gmembers\":[\"Nitz\",\"Sheila\",\"Whien\",\"Salvie\",\"Minda\",\"Tad\"],\"add\":\"\"}', 'Ann', '192.168.254.208', 1612586747),
(336, 'fs_workflow', 'DELETE', '{\"id\":\"1\",\"delete\":\"\"}', 'Ann', '192.168.254.208', 1612589390),
(337, 'fs_workflow', 'UPDATE', '{\"id\":\"2\",\"description\":\"Loan Approval Workflow\",\"steps_id\":\"FOES7XV8I35HYCG\",\"edit\":\"\"}', 'Ann', '192.168.254.208', 1612589409),
(338, 'fs_workflow', 'INSERT', '{\"form_id\":\"9MBKG64J7IOAYCE\",\"approvaltype\":\"series\",\"description\":\"Loan Approval Workflow\",\"worksteps\":\"IDQSR0BKEPO8CLH\",\"addstep\":\"\"}', 'Ann', '192.168.254.208', 1612589422),
(339, 'fs_workflow', 'UPDATE', '{\"id\":\"3\"}{\"form_id\":\"9MBKG64J7IOAYCE\"}', 'Ann', '192.168.254.208', 1612589428),
(340, 'fs_workflow', 'UPDATE', '{\"id\":\"9MBKG64J7IOAYCE\",\"description\":\"GMs Approval Workflow\",\"edit\":\"\"}', 'Ann', '192.168.254.208', 1612589452),
(341, 'fs_workstpes', 'INSERT', '{\"description\":\"Department Head Implementers\",\"usergroup\":[\"FK6XL3P1WM2I\"],\"approvaltype\":\"Parallel\",\"confirmtype\":\"Concurrence\",\"timewindow\":\"3\",\"rejectfirst\":\"N/A\",\"rejectchange\":\"N/A\",\"rejectanchor\":\"No\",\"selectgroup\":\"Yes\",\"needed_approval\":\"3\",\"add\":\"\"}', 'Ann', '192.168.254.208', 1612590066),
(342, 'fs_workflow', 'UPDATE', '{\"id\":\"3\",\"description\":\"GMs Approval Workflow\",\"steps_id\":\"P8RASZ5I43DMN06\",\"edit\":\"\"}', 'Ann', '192.168.254.208', 1612590097),
(343, 'fs_request_main', 'INSERT', '{\"docname\":\"New Loan Policy 2\",\"docdesp\":\"\",\"workflow\":\"SYR85G14OIPHA9L\",\"task\":\"Implementers Conformance\",\"task_id\":\"M9RXFWGI31NOQVC\",\"app_group\":[\"2G4KRSL1W6YI\"],\"revno\":\"4\",\"add\":\"submit\"}', 'Hilberth', '::1', 1613092337),
(344, 'fs_request_main', 'INSERT', '{\"rqid\":\"FCCMPC-0000034\",\"wflow_id\":\"SYR85G14OIPHA9L\",\"step_id\":\"UI94P61QSGXLWCZ\",\"sel_actiond\":\"Approved\",\"remarks\":\"ok\",\"user_apex\":\"submit\"}', 'Sheila', '192.168.254.208', 1613092739),
(345, 'fs_request_main', 'INSERT', '{\"rqid\":\"FCCMPC-0000034\",\"wflow_id\":\"SYR85G14OIPHA9L\",\"step_id\":\"UI94P61QSGXLWCZ\",\"sel_actiond\":\"Approved\",\"remarks\":\"ok\",\"user_apex\":\"submit\"}', 'Salvie', '192.168.254.105', 1613092741),
(346, 'fs_request_main', 'INSERT', '{\"rqid\":\"FCCMPC-0000034\",\"wflow_id\":\"SYR85G14OIPHA9L\",\"step_id\":\"UI94P61QSGXLWCZ\",\"sel_actiond\":\"Approved\",\"remarks\":\"ok\",\"user_apex\":\"submit\"}', 'Nitz', '192.168.254.105', 1613092808),
(347, 'fs_request_main', 'INSERT', '{\"rqid\":\"FCCMPC-0000034\",\"wflow_id\":\"SYR85G14OIPHA9L\",\"step_id\":\"UI94P61QSGXLWCZ\",\"sel_actiond\":\"Approved\",\"remarks\":\"ok\",\"user_apex\":\"submit\"}', 'Whien', '192.168.250.76', 1613092826),
(348, 'fs_request_main', 'INSERT', '{\"rqid\":\"FCCMPC-0000034\",\"wflow_id\":\"SYR85G14OIPHA9L\",\"step_id\":\"UI94P61QSGXLWCZ\",\"sel_actiond\":\"Approved\",\"remarks\":\"ok\",\"user_apex\":\"submit\"}', 'Tad', '192.168.254.105', 1613092844),
(349, 'fs_request_main', 'INSERT', '{\"rqid\":\"FCCMPC-0000034\",\"wflow_id\":\"SYR85G14OIPHA9L\",\"step_id\":\"UI94P61QSGXLWCZ\",\"sel_actiond\":\"Approved\",\"remarks\":\"ok\",\"user_apex\":\"submit\"}', 'Minda', '192.168.254.208', 1613092868),
(350, 'fs_request_main', 'INSERT', '{\"rqid\":\"FCCMPC-0000034\",\"wflow_id\":\"SYR85G14OIPHA9L\",\"step_id\":\"LWU2GAZ6HR51O0X\",\"sel_actiond\":\"Approved\",\"remarks\":\"ok\",\"user_apex\":\"submit\"}', 'Reygan', '192.168.254.105', 1613092929),
(351, 'fs_request_main', 'INSERT', '{\"rqid\":\"FCCMPC-0000034\",\"wflow_id\":\"SYR85G14OIPHA9L\",\"step_id\":\"FOES7XV8I35HYCG\",\"sel_actiond\":\"Approved\",\"remarks\":\"ok\",\"user_apex\":\"submit\"}', 'Ann', '192.168.254.208', 1613093341),
(352, 'fs_request_main', 'INSERT', '{\"rqid\":\"FCCMPC-0000034\",\"wflow_id\":\"SYR85G14OIPHA9L\",\"step_id\":\"IDQSR0BKEPO8CLH\",\"sel_actiond\":\"Disapproved\",\"remarks\":\"check requirements in section 3\",\"user_apex\":\"submit\"}', 'yuya', '192.168.250.76', 1613093764),
(353, 'fs_request_main', 'UPDATE', '{\"refile_id\":\"FCCMPC-0000034\",\"upload\":\"\"}', 'Hilberth', '::1', 1613093910),
(354, 'fs_request_main', 'UPDATE', '{\"rqid\":\"FCCMPC-0000034\",\"wrkflow_id\":\"SYR85G14OIPHA9L\",\"resubmit\":\"submit\"}', 'Hilberth', '::1', 1613093916),
(355, 'fs_request_main', 'INSERT', '{\"rqid\":\"FCCMPC-0000034\",\"wflow_id\":\"SYR85G14OIPHA9L\",\"step_id\":\"FOES7XV8I35HYCG\",\"sel_actiond\":\"Approved\",\"remarks\":\"ok\",\"user_apex\":\"submit\"}', 'Ann', '192.168.254.208', 1613094096),
(356, 'fs_request_main', 'INSERT', '{\"rqid\":\"FCCMPC-0000034\",\"wflow_id\":\"SYR85G14OIPHA9L\",\"step_id\":\"IDQSR0BKEPO8CLH\",\"sel_actiond\":\"Approved\",\"remarks\":\"ok\",\"user_apex\":\"submit\"}', 'Jema', '192.168.254.105', 1613094221),
(357, 'fs_request_main', 'INSERT', '{\"rqid\":\"FCCMPC-0000034\",\"wflow_id\":\"SYR85G14OIPHA9L\",\"step_id\":\"M9RXFWGI31NOQVC\",\"sel_actiond\":\"Confirmed\",\"remarks\":\"confirmed\",\"user_apex\":\"submit\"}', 'Teo', '192.168.254.105', 1613094753),
(358, 'fs_request_main', 'INSERT', '{\"rqid\":\"FCCMPC-0000034\",\"wflow_id\":\"SYR85G14OIPHA9L\",\"step_id\":\"M9RXFWGI31NOQVC\",\"sel_actiond\":\"Confirmed\",\"remarks\":\"confirmed\",\"user_apex\":\"submit\"}', 'Christine', '192.168.254.105', 1613094821),
(359, 'fs_request_main', 'INSERT', '{\"docname\":\"New Loan Policy 2\",\"docdesp\":\"j\",\"workflow\":\"SYR85G14OIPHA9L\",\"task\":\"Implementers Conformance\",\"task_id\":\"M9RXFWGI31NOQVC\",\"app_group\":[\"2G4KRSL1W6YI\"],\"revno\":\"4\",\"add\":\"submit\"}', 'Hilberth', '::1', 1613097376),
(360, 'fs_request_main', 'INSERT', '{\"docname\":\"FC-BD-005\",\"docdesp\":\"business\",\"workflow\":\"SYR85G14OIPHA9L\",\"task\":\"Implementers Conformance\",\"task_id\":\"M9RXFWGI31NOQVC\",\"app_group\":[\"2G4KRSL1W6YI\"],\"revno\":\"4\",\"add\":\"submit\"}', 'Christine', '192.168.254.105', 1613097391),
(361, 'fs_request_main', 'UPDATE', '{\"id\":\"35\",\"rqid\":\"FCCMPC-0000035\",\"cancel\":\"\"}', 'Hilberth', '::1', 1613097399),
(362, 'fs_request_main', 'UPDATE', '{\"id\":\"36\",\"rqid\":\"FCCMPC-0000036\",\"cancel\":\"\"}', 'Christine', '192.168.254.105', 1613097407),
(363, 'fs_request_main', 'INSERT', '{\"docname\":\"FC-BD-007\",\"docdesp\":\"business\",\"workflow\":\"SYR85G14OIPHA9L\",\"task\":\"Implementers Conformance\",\"task_id\":\"M9RXFWGI31NOQVC\",\"revno\":\"7\",\"add\":\"submit\"}', 'Christine', '192.168.254.105', 1613097850),
(364, 'fs_request_main', 'INSERT', '{\"docname\":\"FC-BD-003\",\"docdesp\":\"business\",\"workflow\":\"SYR85G14OIPHA9L\",\"task\":\"Implementers Conformance\",\"task_id\":\"M9RXFWGI31NOQVC\",\"app_group\":[\"E7SZRKNA1VB3\"],\"revno\":\"02\",\"add\":\"submit\"}', 'Christine', '192.168.254.105', 1613097938),
(365, 'fs_request_main', 'INSERT', '{\"docname\":\"QMS-FC-002 \",\"docdesp\":\"doccon control\",\"workflow\":\"SYR85G14OIPHA9L\",\"task\":\"Implementers Conformance\",\"task_id\":\"M9RXFWGI31NOQVC\",\"app_group\":[\"SAMWXPZ5N6OY\",\"2G4KRSL1W6YI\"],\"revno\":\"07\",\"add\":\"submit\"}', 'Syra', '192.168.254.208', 1613098036),
(366, 'fs_request_main', 'INSERT', '{\"rqid\":\"FCCMPC-0000039\",\"wflow_id\":\"SYR85G14OIPHA9L\",\"step_id\":\"UI94P61QSGXLWCZ\",\"sel_actiond\":\"Disapproved\",\"remarks\":\"\",\"user_apex\":\"submit\"}', 'Tad', '192.168.254.105', 1613098146),
(367, 'fs_request_main', 'UPDATE', '{\"refile_id\":\"FCCMPC-0000039\",\"upload\":\"\"}', 'Syra', '192.168.254.208', 1613098696),
(368, 'fs_request_main', 'UPDATE', '{\"rqid\":\"FCCMPC-0000039\",\"wrkflow_id\":\"SYR85G14OIPHA9L\",\"resubmit\":\"submit\"}', 'Syra', '192.168.254.208', 1613098719),
(369, 'fs_request_main', 'INSERT', '{\"rqid\":\"FCCMPC-0000039\",\"wflow_id\":\"SYR85G14OIPHA9L\",\"step_id\":\"UI94P61QSGXLWCZ\",\"sel_actiond\":\"Approved\",\"remarks\":\"ok\",\"user_apex\":\"submit\"}', 'Tad', '192.168.254.105', 1613098863),
(370, 'fs_request_main', 'INSERT', '{\"rqid\":\"FCCMPC-0000039\",\"wflow_id\":\"SYR85G14OIPHA9L\",\"step_id\":\"UI94P61QSGXLWCZ\",\"sel_actiond\":\"Approved\",\"remarks\":\"ok\",\"user_apex\":\"submit\"}', 'Minda', '192.168.254.208', 1613099088),
(371, 'fs_request_main', 'INSERT', '{\"rqid\":\"FCCMPC-0000039\",\"wflow_id\":\"SYR85G14OIPHA9L\",\"step_id\":\"UI94P61QSGXLWCZ\",\"sel_actiond\":\"Approved\",\"remarks\":\"ok\",\"user_apex\":\"submit\"}', 'Sheila', '192.168.254.105', 1613099111),
(372, 'fs_request_main', 'INSERT', '{\"rqid\":\"FCCMPC-0000039\",\"wflow_id\":\"SYR85G14OIPHA9L\",\"step_id\":\"UI94P61QSGXLWCZ\",\"sel_actiond\":\"Approved\",\"remarks\":\"ok\",\"user_apex\":\"submit\"}', 'Nitz', '192.168.254.105', 1613099145),
(373, 'fs_request_main', 'INSERT', '{\"rqid\":\"FCCMPC-0000039\",\"wflow_id\":\"SYR85G14OIPHA9L\",\"step_id\":\"UI94P61QSGXLWCZ\",\"sel_actiond\":\"Approved\",\"remarks\":\"ok\",\"user_apex\":\"submit\"}', 'Whien', '192.168.250.76', 1613099152),
(374, 'fs_request_main', 'INSERT', '{\"rqid\":\"FCCMPC-0000039\",\"wflow_id\":\"SYR85G14OIPHA9L\",\"step_id\":\"UI94P61QSGXLWCZ\",\"sel_actiond\":\"Approved\",\"remarks\":\"ok\",\"user_apex\":\"submit\"}', 'Salvie', '192.168.254.208', 1613099166),
(375, 'fs_request_main', 'INSERT', '{\"rqid\":\"FCCMPC-0000039\",\"wflow_id\":\"SYR85G14OIPHA9L\",\"step_id\":\"LWU2GAZ6HR51O0X\",\"sel_actiond\":\"Approved\",\"remarks\":\"ok\",\"user_apex\":\"submit\"}', 'Reygan', '192.168.254.105', 1613099304),
(376, 'fs_request_main', 'INSERT', '{\"rqid\":\"FCCMPC-0000039\",\"wflow_id\":\"SYR85G14OIPHA9L\",\"step_id\":\"FOES7XV8I35HYCG\",\"sel_actiond\":\"Approved\",\"remarks\":\"ok\",\"user_apex\":\"submit\"}', 'Ann', '192.168.254.208', 1613099391),
(377, 'fs_request_main', 'INSERT', '{\"rqid\":\"FCCMPC-0000039\",\"wflow_id\":\"SYR85G14OIPHA9L\",\"step_id\":\"IDQSR0BKEPO8CLH\",\"sel_actiond\":\"Disapproved\",\"remarks\":\"review\",\"user_apex\":\"submit\"}', 'Jema', '192.168.254.105', 1613099430),
(378, 'fs_request_main', 'UPDATE', '{\"refile_id\":\"FCCMPC-0000039\",\"upload\":\"\"}', 'Syra', '192.168.254.208', 1613099560),
(379, 'fs_request_main', 'UPDATE', '{\"rqid\":\"FCCMPC-0000039\",\"wrkflow_id\":\"SYR85G14OIPHA9L\",\"resubmit\":\"submit\"}', 'Syra', '192.168.254.208', 1613099570),
(380, 'fs_request_main', 'INSERT', '{\"rqid\":\"FCCMPC-0000039\",\"wflow_id\":\"SYR85G14OIPHA9L\",\"step_id\":\"FOES7XV8I35HYCG\",\"sel_actiond\":\"Approved\",\"remarks\":\"ok\",\"user_apex\":\"submit\"}', 'Ann', '192.168.254.208', 1613099729),
(381, 'fs_request_main', 'INSERT', '{\"rqid\":\"FCCMPC-0000039\",\"wflow_id\":\"SYR85G14OIPHA9L\",\"step_id\":\"IDQSR0BKEPO8CLH\",\"sel_actiond\":\"Approved\",\"remarks\":\"ok\r\n\",\"user_apex\":\"submit\"}', 'Jema', '192.168.254.105', 1613099777),
(382, 'fs_request_main', 'INSERT', '{\"rqid\":\"FCCMPC-0000039\",\"wflow_id\":\"SYR85G14OIPHA9L\",\"step_id\":\"IDQSR0BKEPO8CLH\",\"sel_actiond\":\"Approved\",\"remarks\":\"ok\",\"user_apex\":\"submit\"}', 'yuya', '192.168.250.76', 1613099805),
(383, 'fs_request_main', 'INSERT', '{\"rqid\":\"FCCMPC-0000039\",\"wflow_id\":\"SYR85G14OIPHA9L\",\"step_id\":\"M9RXFWGI31NOQVC\",\"sel_actiond\":\"Confirmed\",\"remarks\":\"\",\"user_apex\":\"submit\"}', 'Ann', '192.168.254.208', 1613099859),
(384, 'fs_request_main', 'INSERT', '{\"rqid\":\"FCCMPC-0000039\",\"wflow_id\":\"SYR85G14OIPHA9L\",\"step_id\":\"M9RXFWGI31NOQVC\",\"sel_actiond\":\"Confirmed\",\"remarks\":\"\",\"user_apex\":\"submit\"}', 'Syra', '192.168.254.208', 1613099933),
(385, 'fs_request_main', 'INSERT', '{\"rqid\":\"FCCMPC-0000039\",\"wflow_id\":\"SYR85G14OIPHA9L\",\"step_id\":\"M9RXFWGI31NOQVC\",\"sel_actiond\":\"Confirmed\",\"remarks\":\"\",\"user_apex\":\"submit\"}', 'Teo', '192.168.254.105', 1613099943),
(386, 'fs_request_main', 'INSERT', '{\"rqid\":\"FCCMPC-0000039\",\"wflow_id\":\"SYR85G14OIPHA9L\",\"step_id\":\"M9RXFWGI31NOQVC\",\"sel_actiond\":\"Confirmed\",\"remarks\":\"\",\"user_apex\":\"submit\"}', 'Christine', '192.168.254.105', 1613099990),
(387, 'fs_request_main', 'INSERT', '{\"rqid\":\"FCCMPC-0000039\",\"wflow_id\":\"SYR85G14OIPHA9L\",\"step_id\":\"M9RXFWGI31NOQVC\",\"sel_actiond\":\"Confirmed\",\"remarks\":\"\",\"user_apex\":\"submit\"}', 'Richard', '192.168.254.208', 1613100056),
(388, 'fs_workstpes', 'UPDATE', '{\"id\":\"2\",\"edit_description\":\"General Manager Approval\",\"edit_usergroup\":[\"JZ0FV1MS4H9W\"],\"edit_approvaltype\":\"Parallel\",\"edit_confirmtype\":\"Approval\",\"edit_timewindow\":\"10\",\"edit_rejectfirst\":\"NA\",\"edit_rejectchange\":\"NA\",\"edit_rejectanchor\":\"No\",\"edit_selectgroup\":\"Yes\",\"edit_needed_approval\":\"1\",\"edit\":\"\"}', 'Ann', '192.168.254.208', 1613102975),
(389, 'fs_workstpes', 'UPDATE', '{\"id\":\"2\",\"edit_description\":\"General Manager Approval\",\"edit_usergroup\":[\"JZ0FV1MS4H9W\"],\"edit_approvaltype\":\"Parallel\",\"edit_confirmtype\":\"Approval\",\"edit_timewindow\":\"10\",\"edit_rejectfirst\":\"NA\",\"edit_rejectchange\":\"NA\",\"edit_rejectanchor\":\"No\",\"edit_selectgroup\":\"No\",\"edit_needed_approval\":\"1\",\"edit\":\"\"}', 'Ann', '192.168.254.208', 1613103040),
(390, 'fs_workstpes', 'UPDATE', '{\"id\":\"6\",\"edit_description\":\"BOD  Approval\",\"edit_usergroup\":[\"RX9MWFLHUY81\"],\"edit_approvaltype\":\"Parallel\",\"edit_confirmtype\":\"Approval\",\"edit_timewindow\":\"3\",\"edit_rejectfirst\":\"N/A\",\"edit_rejectchange\":\"N/A\",\"edit_rejectanchor\":\"No\",\"edit_selectgroup\":\"No\",\"edit_needed_approval\":\"1\",\"edit\":\"\"}', 'Hilberth', '::1', 1613103138),
(391, 'fs_workstpes', 'UPDATE', '{\"id\":\"2\",\"edit_description\":\"General Manager Approval\",\"edit_usergroup\":[\"JZ0FV1MS4H9W\"],\"edit_approvaltype\":\"Series\",\"edit_confirmtype\":\"Approval\",\"edit_timewindow\":\"10\",\"edit_rejectfirst\":\"NA\",\"edit_rejectchange\":\"NA\",\"edit_rejectanchor\":\"No\",\"edit_selectgroup\":\"No\",\"edit_needed_approval\":\"1\",\"edit\":\"\"}', 'Ann', '192.168.254.208', 1613103153),
(392, 'fs_users', 'UPDATE', '{\"id\":\"15\",\"userId\":\"Sheila\",\"firstname\":\"Sheila Marie\",\"middlename\":\"Booc\",\"lastname\":\"Beceril\",\"emailadd\":\"annalyn.sorela@yahoo.com\",\"password\":\"$2y$10$5JFBQwKjAG0C0P.Roc93p.hiOkiArDnOm2YNFt/Zx/KLbAPVvdb3G\",\"accesslevel\":[\"Approver\",\"Implementor\",\"DocAdmin\",\"Administrator\"],\"department\":\"1\",\"edit\":\"\"}', 'Ann', '192.168.254.165', 1613348440),
(393, 'fs_request_main', 'INSERT', '{\"docname\":\"FC-QMS-007\",\"docdesp\":\"Archiving\",\"workflow\":\"SYR85G14OIPHA9L\",\"task\":\"Implementers Conformance\",\"task_id\":\"M9RXFWGI31NOQVC\",\"app_group\":[\"SAMWXPZ5N6OY\",\"2G4KRSL1W6YI\"],\"revno\":\"05\",\"add\":\"submit\"}', 'Syra', '192.168.254.208', 1613782884),
(394, 'fs_request_main', 'INSERT', '{\"rqid\":\"FCCMPC-0000040\",\"wflow_id\":\"SYR85G14OIPHA9L\",\"step_id\":\"UI94P61QSGXLWCZ\",\"sel_actiond\":\"Approved\",\"remarks\":\"\",\"user_apex\":\"submit\"}', 'Nitz', '192.168.254.105', 1613783026),
(395, 'fs_request_main', 'INSERT', '{\"rqid\":\"FCCMPC-0000040\",\"wflow_id\":\"SYR85G14OIPHA9L\",\"step_id\":\"UI94P61QSGXLWCZ\",\"sel_actiond\":\"Approved\",\"remarks\":\"\",\"user_apex\":\"submit\"}', 'Tad', '192.168.254.105', 1613783069),
(396, 'fs_request_main', 'INSERT', '{\"rqid\":\"FCCMPC-0000040\",\"wflow_id\":\"SYR85G14OIPHA9L\",\"step_id\":\"UI94P61QSGXLWCZ\",\"sel_actiond\":\"Approved\",\"remarks\":\"ok\",\"user_apex\":\"submit\"}', 'Whien', '192.168.250.76', 1613783096),
(397, 'fs_request_main', 'INSERT', '{\"rqid\":\"FCCMPC-0000040\",\"wflow_id\":\"SYR85G14OIPHA9L\",\"step_id\":\"UI94P61QSGXLWCZ\",\"sel_actiond\":\"Approved\",\"remarks\":\"\",\"user_apex\":\"submit\"}', 'Salvie', '192.168.254.105', 1613783130),
(398, 'fs_request_main', 'INSERT', '{\"rqid\":\"FCCMPC-0000040\",\"wflow_id\":\"SYR85G14OIPHA9L\",\"step_id\":\"UI94P61QSGXLWCZ\",\"sel_actiond\":\"Disapproved\",\"remarks\":\"need to update current forms\",\"user_apex\":\"submit\"}', 'Minda', '192.168.254.208', 1613783136),
(399, 'fs_request_main', 'UPDATE', '{\"refile_id\":\"FCCMPC-0000040\",\"upload\":\"\"}', 'Syra', '192.168.254.208', 1613783993),
(400, 'fs_request_main', 'UPDATE', '{\"rqid\":\"FCCMPC-0000040\",\"wrkflow_id\":\"SYR85G14OIPHA9L\",\"resubmit\":\"submit\"}', 'Syra', '192.168.254.208', 1613784004),
(401, 'fs_request_main', 'INSERT', '{\"rqid\":\"FCCMPC-0000040\",\"wflow_id\":\"SYR85G14OIPHA9L\",\"step_id\":\"UI94P61QSGXLWCZ\",\"sel_actiond\":\"Approved\",\"remarks\":\"\",\"user_apex\":\"submit\"}', 'Sheila', '192.168.254.105', 1613784041),
(402, 'fs_request_main', 'INSERT', '{\"docname\":\"FC-QMS-007\",\"docdesp\":\"Archiving\",\"workflow\":\"SYR85G14OIPHA9L\",\"task\":\"Implementers Conformance\",\"task_id\":\"M9RXFWGI31NOQVC\",\"app_group\":[\"SAMWXPZ5N6OY\",\"2G4KRSL1W6YI\"],\"revno\":\"07\",\"add\":\"submit\"}', 'Syra', '192.168.254.208', 1613785044),
(403, 'fs_request_main', 'INSERT', '{\"rqid\":\"FCCMPC-0000041\",\"wflow_id\":\"SYR85G14OIPHA9L\",\"step_id\":\"UI94P61QSGXLWCZ\",\"sel_actiond\":\"Approved\",\"remarks\":\"\",\"user_apex\":\"submit\"}', 'Nitz', '192.168.254.105', 1613785072),
(404, 'fs_request_main', 'INSERT', '{\"rqid\":\"FCCMPC-0000041\",\"wflow_id\":\"SYR85G14OIPHA9L\",\"step_id\":\"UI94P61QSGXLWCZ\",\"sel_actiond\":\"Approved\",\"remarks\":\"\",\"user_apex\":\"submit\"}', 'Minda', '192.168.254.208', 1613785108),
(405, 'fs_request_main', 'INSERT', '{\"rqid\":\"FCCMPC-0000041\",\"wflow_id\":\"SYR85G14OIPHA9L\",\"step_id\":\"UI94P61QSGXLWCZ\",\"sel_actiond\":\"Approved\",\"remarks\":\"\",\"user_apex\":\"submit\"}', 'Sheila', '192.168.254.105', 1613785118),
(406, 'fs_request_main', 'INSERT', '{\"rqid\":\"FCCMPC-0000041\",\"wflow_id\":\"SYR85G14OIPHA9L\",\"step_id\":\"UI94P61QSGXLWCZ\",\"sel_actiond\":\"Approved\",\"remarks\":\"\",\"user_apex\":\"submit\"}', 'Tad', '192.168.254.105', 1613785177),
(407, 'fs_request_main', 'INSERT', '{\"rqid\":\"FCCMPC-0000041\",\"wflow_id\":\"SYR85G14OIPHA9L\",\"step_id\":\"UI94P61QSGXLWCZ\",\"sel_actiond\":\"Approved\",\"remarks\":\"ok\",\"user_apex\":\"submit\"}', 'Whien', '192.168.250.76', 1613785184),
(408, 'fs_request_main', 'INSERT', '{\"rqid\":\"FCCMPC-0000041\",\"wflow_id\":\"SYR85G14OIPHA9L\",\"step_id\":\"UI94P61QSGXLWCZ\",\"sel_actiond\":\"Approved\",\"remarks\":\"\",\"user_apex\":\"submit\"}', 'Salvie', '192.168.254.105', 1613785213),
(409, 'fs_request_main', 'INSERT', '{\"rqid\":\"FCCMPC-0000041\",\"wflow_id\":\"SYR85G14OIPHA9L\",\"step_id\":\"LWU2GAZ6HR51O0X\",\"sel_actiond\":\"Approved\",\"remarks\":\"\",\"user_apex\":\"submit\"}', 'Reygan', '192.168.254.105', 1613785339),
(410, 'fs_request_main', 'INSERT', '{\"rqid\":\"FCCMPC-0000041\",\"wflow_id\":\"SYR85G14OIPHA9L\",\"step_id\":\"FOES7XV8I35HYCG\",\"sel_actiond\":\"Disapproved\",\"remarks\":\"in correct revision number\",\"user_apex\":\"submit\"}', 'Ann', '192.168.254.208', 1613785424),
(411, 'fs_request_main', 'UPDATE', '{\"refile_id\":\"FCCMPC-0000041\",\"upload\":\"\"}', 'Syra', '192.168.254.105', 1613785508),
(412, 'fs_request_main', 'UPDATE', '{\"rqid\":\"FCCMPC-0000041\",\"wrkflow_id\":\"SYR85G14OIPHA9L\",\"resubmit\":\"submit\"}', 'Syra', '192.168.254.105', 1613785517),
(413, 'fs_request_main', 'INSERT', '{\"rqid\":\"FCCMPC-0000041\",\"wflow_id\":\"SYR85G14OIPHA9L\",\"step_id\":\"FOES7XV8I35HYCG\",\"sel_actiond\":\"Approved\",\"remarks\":\"ok\",\"user_apex\":\"submit\"}', 'Ann', '192.168.254.208', 1613785549);
INSERT INTO `fs_attribute_logger` (`id`, `page_name`, `page_action`, `page_attrib`, `page_user`, `user_ip`, `date_update`) VALUES
(414, 'fs_request_main', 'INSERT', '{\"rqid\":\"FCCMPC-0000041\",\"wflow_id\":\"SYR85G14OIPHA9L\",\"step_id\":\"IDQSR0BKEPO8CLH\",\"sel_actiond\":\"Disapproved\",\"remarks\":\"review title\",\"user_apex\":\"submit\"}', 'Jema', '192.168.254.105', 1613785611),
(415, 'fs_request_main', 'UPDATE', '{\"refile_id\":\"FCCMPC-0000041\",\"upload\":\"\"}', 'Syra', '192.168.254.105', 1613785738),
(416, 'fs_request_main', 'UPDATE', '{\"rqid\":\"FCCMPC-0000041\",\"wrkflow_id\":\"SYR85G14OIPHA9L\",\"resubmit\":\"submit\"}', 'Syra', '192.168.254.105', 1613785807),
(417, 'fs_request_main', 'INSERT', '{\"rqid\":\"FCCMPC-0000041\",\"wflow_id\":\"SYR85G14OIPHA9L\",\"step_id\":\"FOES7XV8I35HYCG\",\"sel_actiond\":\"Approved\",\"remarks\":\"\",\"user_apex\":\"submit\"}', 'Ann', '192.168.254.208', 1613785846),
(418, 'fs_request_main', 'INSERT', '{\"rqid\":\"FCCMPC-0000041\",\"wflow_id\":\"SYR85G14OIPHA9L\",\"step_id\":\"IDQSR0BKEPO8CLH\",\"sel_actiond\":\"Approved\",\"remarks\":\"ok\",\"user_apex\":\"submit\"}', 'yuya', '192.168.250.76', 1613786098),
(419, 'fs_request_main', 'INSERT', '{\"rqid\":\"FCCMPC-0000041\",\"wflow_id\":\"SYR85G14OIPHA9L\",\"step_id\":\"IDQSR0BKEPO8CLH\",\"sel_actiond\":\"Approved\",\"remarks\":\"\",\"user_apex\":\"submit\"}', 'Jema', '192.168.254.105', 1613786212),
(420, 'fs_user_group', 'UPDATE', '{\"id\":\"7\",\"edit_gname\":\"Department Heads\",\"edit_gdescription\":\"List of all department heads\",\"edit_gmembers\":[\"Sheila\",\"Minda\"],\"edit\":\"\"}', 'Ann', '192.168.254.208', 1613786518),
(421, 'fs_user_group', 'UPDATE', '{\"id\":\"11\",\"edit_gname\":\"Collection Dept Implementers\",\"edit_gdescription\":\"Collection Dept \",\"edit_gmembers\":[\"Chardey\"],\"edit\":\"\"}', 'Ann', '192.168.254.208', 1613789656);

-- --------------------------------------------------------

--
-- Table structure for table `fs_department`
--

CREATE TABLE `fs_department` (
  `id` int(10) NOT NULL,
  `dept_no` varchar(30) NOT NULL,
  `dept_name` varchar(30) NOT NULL,
  `dept_approver` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `fs_department`
--

INSERT INTO `fs_department` (`id`, `dept_no`, `dept_name`, `dept_approver`) VALUES
(1, 'HR Admin', 'HR Department', 'YES'),
(2, 'Managing Department', 'General Manager', 'YES'),
(3, 'Loan Department', 'Loan Department', 'YES'),
(4, 'Board of Directors', 'Board of Directors', 'YES'),
(5, 'Business and IT Dept', 'Business and IT Dept', 'NO'),
(6, 'Audit', 'Auditing  Department', 'NO'),
(7, 'Accounting', 'Accounting and Finance Dept', 'YES'),
(8, 'Collection', 'Collection Dept', 'YES'),
(9, 'Membership and Marketing Dept', 'Membership and Marketing Dept', 'NO'),
(10, 'Knowles Branch', 'Knowles Branch', 'NO');

-- --------------------------------------------------------

--
-- Table structure for table `fs_doc_viewer`
--

CREATE TABLE `fs_doc_viewer` (
  `id` int(10) NOT NULL,
  `unixdate` int(10) NOT NULL,
  `rq_id` varchar(30) NOT NULL,
  `user_id` varchar(30) NOT NULL,
  `datetime` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `fs_doc_viewer`
--

INSERT INTO `fs_doc_viewer` (`id`, `unixdate`, `rq_id`, `user_id`, `datetime`) VALUES
(1, 1612577261, '', 'Nitz', '2021-02-06 10:07'),
(2, 1612577261, '', 'Nitz', '2021-02-06 10:07'),
(3, 1612581535, '', 'Tad', '2021-02-06 11:18'),
(4, 1612581535, '', 'Tad', '2021-02-06 11:18'),
(5, 1613092780, '', 'Nitz', '2021-02-12 09:19'),
(6, 1613092780, '', 'Nitz', '2021-02-12 09:19'),
(7, 1613092834, '', 'Minda', '2021-02-12 09:20'),
(8, 1613092834, '', 'Minda', '2021-02-12 09:20'),
(9, 1613095074, '', 'Hilberth', '2021-02-12 09:57'),
(10, 1613095074, '', 'Hilberth', '2021-02-12 09:57'),
(11, 1613095088, '', 'Hilberth', '2021-02-12 09:58'),
(12, 1613095088, '', 'Hilberth', '2021-02-12 09:58'),
(13, 1613095108, '', 'Hilberth', '2021-02-12 09:58'),
(14, 1613095108, '', 'Hilberth', '2021-02-12 09:58'),
(15, 1613095139, '', 'Ann', '2021-02-12 09:58'),
(16, 1613095139, '', 'Ann', '2021-02-12 09:58'),
(17, 1613783057, '', 'Whien', '2021-02-20 09:04'),
(18, 1613783057, '', 'Whien', '2021-02-20 09:04'),
(19, 1613783281, '', 'Sheila', '2021-02-20 09:08'),
(20, 1613783281, '', 'Sheila', '2021-02-20 09:08'),
(21, 1613785169, '', 'Whien', '2021-02-20 09:39'),
(22, 1613785169, '', 'Whien', '2021-02-20 09:39'),
(23, 1613786382, 'FCCMPC-0000041', 'Sheila', '2021-02-20 09:59'),
(24, 1613786382, 'FCCMPC-0000041', 'Sheila', '2021-02-20 09:59'),
(25, 1613789337, '', 'Sheila', '2021-02-20 10:48'),
(26, 1613789337, '', 'Sheila', '2021-02-20 10:48');

-- --------------------------------------------------------

--
-- Table structure for table `fs_request_approval`
--

CREATE TABLE `fs_request_approval` (
  `id` int(10) NOT NULL,
  `request_id` varchar(30) NOT NULL,
  `flow_id` varchar(30) NOT NULL,
  `step_id` varchar(30) NOT NULL,
  `user_apex` varchar(30) NOT NULL,
  `user_approver` varchar(30) NOT NULL,
  `user_remarks` text NOT NULL,
  `date_approved` date NOT NULL DEFAULT current_timestamp(),
  `unix` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `fs_request_approval`
--

INSERT INTO `fs_request_approval` (`id`, `request_id`, `flow_id`, `step_id`, `user_apex`, `user_approver`, `user_remarks`, `date_approved`, `unix`) VALUES
(1, 'FCCMPC-0000001', '9MBKG64J7IOAYCE', 'Created', 'Created', 'admin', 'New', '2021-01-14', 1610628998),
(2, 'FCCMPC-0000002', '9MBKG64J7IOAYCE', 'Created', 'Created', '', 'New', '2021-01-14', 1610630236),
(3, 'FCCMPC-0000003', '9MBKG64J7IOAYCE', 'Created', 'Created', '', 'New', '2021-01-14', 1610630242),
(4, 'FCCMPC-0000004', '9MBKG64J7IOAYCE', 'Created', 'Created', '', 'New', '2021-01-14', 1610630249),
(5, 'FCCMPC-0000004', '9MBKG64J7IOAYCE', 'OMKZL0Q7YRJ5NXW', 'Approved', 'Nitz', 'Approved', '2021-01-14', 1610630799),
(6, 'FCCMPC-0000004', '9MBKG64J7IOAYCE', 'LWU2GAZ6HR51O0X', 'Approved', 'ReyGan', 'approve', '2021-01-14', 1610631018),
(7, 'FCCMPC-0000004', '9MBKG64J7IOAYCE', 'M9RXFWGI31NOQVC', 'Approved', 'Dux', 'yes', '2021-01-14', 1610631192),
(8, 'FCCMPC-0000003', '9MBKG64J7IOAYCE', 'OMKZL0Q7YRJ5NXW', 'Disapproved', 'Hilberth', '', '2021-01-15', 1610672407),
(9, 'FCCMPC-0000003', '9MBKG64J7IOAYCE', 'OMKZL0Q7YRJ5NXW', 'Disapproved', 'Hilberth', '', '2021-01-15', 1610672413),
(10, 'FCCMPC-0000005', '9MBKG64J7IOAYCE', 'Created', 'Created', 'Ann', 'New', '2021-01-15', 1610684071),
(11, 'FCCMPC-0000005', '9MBKG64J7IOAYCE', 'OMKZL0Q7YRJ5NXW', 'Approved', 'Nitz', 'approved', '2021-01-15', 1610684483),
(12, 'FCCMPC-0000005', '9MBKG64J7IOAYCE', 'LWU2GAZ6HR51O0X', 'Approved', 'ReyGan', '', '2021-01-15', 1610684612),
(13, 'FCCMPC-0000005', '9MBKG64J7IOAYCE', 'M9RXFWGI31NOQVC', 'Approved', 'Dux', 'implemented', '2021-01-15', 1610684679),
(14, 'FCCMPC-0000006', '9MBKG64J7IOAYCE', 'Created', 'Created', 'Hilberth', 'New', '2021-01-16', 1610759192),
(15, 'FCCMPC-0000006', '9MBKG64J7IOAYCE', 'OMKZL0Q7YRJ5NXW', 'Approved', 'Hilberth', 'a', '2021-01-16', 1610759222),
(16, 'FCCMPC-0000006', '9MBKG64J7IOAYCE', 'LWU2GAZ6HR51O0X', 'Approved', 'Hilberth', '', '2021-01-16', 1610759238),
(17, 'FCCMPC-0000006', '9MBKG64J7IOAYCE', 'M9RXFWGI31NOQVC', 'Confirmed', 'Hilberth', 'cb', '2021-01-16', 1610759253),
(18, 'FCCMPC-0000007', '9MBKG64J7IOAYCE', 'Created', 'Created', 'Ann', 'New', '2021-01-16', 1610759875),
(19, 'FCCMPC-0000007', '9MBKG64J7IOAYCE', 'OMKZL0Q7YRJ5NXW', 'Approved', 'Hilberth', '', '2021-01-16', 1610760109),
(20, 'FCCMPC-0000007', '9MBKG64J7IOAYCE', 'LWU2GAZ6HR51O0X', 'Approved', 'Hilberth', '', '2021-01-16', 1610760163),
(21, 'FCCMPC-0000007', '9MBKG64J7IOAYCE', 'M9RXFWGI31NOQVC', 'Confirmed', 'Hilberth', '', '2021-01-16', 1610760176),
(22, 'FCCMPC-0000008', '9MBKG64J7IOAYCE', 'Created', 'Created', 'Hilberth', 'New', '2021-01-16', 1610760584),
(23, 'FCCMPC-0000008', '9MBKG64J7IOAYCE', 'OMKZL0Q7YRJ5NXW', 'Approved', 'Hilberth', '', '2021-01-16', 1610760660),
(24, 'FCCMPC-0000008', '9MBKG64J7IOAYCE', 'LWU2GAZ6HR51O0X', 'Disapproved', 'Hilberth', '', '2021-01-16', 1610760703),
(25, 'FCCMPC-0000008', '', 'Resubmit', 'Resubmit', 'Hilberth', 'Resubmit', '2021-01-16', 1610760819),
(26, 'FCCMPC-0000008', '9MBKG64J7IOAYCE', 'LWU2GAZ6HR51O0X', 'Approved', 'Hilberth', '', '2021-01-16', 1610760903),
(27, 'FCCMPC-0000008', '9MBKG64J7IOAYCE', 'LWU2GAZ6HR51O0X', 'Approved', 'Hilberth', '', '2021-01-16', 1610760910),
(28, 'FCCMPC-0000009', '9MBKG64J7IOAYCE', 'Created', 'Created', 'Hilberth', 'New', '2021-01-16', 1610761069),
(29, 'FCCMPC-0000009', '9MBKG64J7IOAYCE', 'OMKZL0Q7YRJ5NXW', 'Approved', 'Hilberth', '', '2021-01-16', 1610761114),
(30, 'FCCMPC-0000009', '9MBKG64J7IOAYCE', 'LWU2GAZ6HR51O0X', 'Disapproved', 'Hilberth', '', '2021-01-16', 1610761130),
(31, 'FCCMPC-0000009', '', 'Resubmit', 'Resubmit', 'Hilberth', 'Resubmit', '2021-01-16', 1610761179),
(32, 'FCCMPC-0000009', '', 'Resubmit', 'Resubmit', 'Hilberth', 'Resubmit', '2021-01-16', 1610761197),
(33, 'FCCMPC-0000009', '9MBKG64J7IOAYCE', 'LWU2GAZ6HR51O0X', 'Approved', 'Hilberth', '', '2021-01-16', 1610761231),
(34, 'FCCMPC-0000009', '9MBKG64J7IOAYCE', 'M9RXFWGI31NOQVC', 'Confirmed', 'Hilberth', '', '2021-01-16', 1610761248),
(35, 'FCCMPC-0000010', '9MBKG64J7IOAYCE', 'Created', 'Created', 'Hilberth', 'New', '2021-01-16', 1610761846),
(36, 'FCCMPC-0000011', 'SYR85G14OIPHA9L', 'Created', 'Created', 'Ann', 'New', '2021-01-16', 1610768665),
(37, 'FCCMPC-0000011', 'SYR85G14OIPHA9L', 'UI94P61QSGXLWCZ', 'Approved', 'Ann', 'Approved', '2021-01-16', 1610768841),
(38, 'FCCMPC-0000011', 'SYR85G14OIPHA9L', 'LWU2GAZ6HR51O0X', 'Approved', 'Ann', 'Approved', '2021-01-16', 1610768897),
(39, 'FCCMPC-0000011', 'SYR85G14OIPHA9L', 'LWU2GAZ6HR51O0X', 'Approved', 'Ann', 'Approved', '2021-01-16', 1610768905),
(40, 'FCCMPC-0000011', 'SYR85G14OIPHA9L', 'LWU2GAZ6HR51O0X', 'Approved', 'Ann', 'Approved', '2021-01-16', 1610768905),
(41, 'FCCMPC-0000011', 'SYR85G14OIPHA9L', 'FOES7XV8I35HYCG', 'Approved', 'Ann', 'Approved', '2021-01-16', 1610769204),
(42, 'FCCMPC-0000012', 'SYR85G14OIPHA9L', 'Created', 'Created', 'Ann', 'New', '2021-01-16', 1610769444),
(43, 'FCCMPC-0000012', 'SYR85G14OIPHA9L', 'UI94P61QSGXLWCZ', 'Approved', 'Hilberth', '', '2021-01-16', 1610769866),
(44, 'FCCMPC-0000012', 'SYR85G14OIPHA9L', 'LWU2GAZ6HR51O0X', 'Approved', 'Hilberth', '', '2021-01-16', 1610769885),
(45, 'FCCMPC-0000012', 'SYR85G14OIPHA9L', 'FOES7XV8I35HYCG', 'Approved', 'Hilberth', '', '2021-01-16', 1610769904),
(46, 'FCCMPC-0000012', 'SYR85G14OIPHA9L', 'IDQSR0BKEPO8CLH', 'Approved', 'Hilberth', '', '2021-01-16', 1610769924),
(47, 'FCCMPC-0000012', 'SYR85G14OIPHA9L', 'M9RXFWGI31NOQVC', 'Confirmed', 'Hilberth', '', '2021-01-16', 1610769942),
(48, 'FCCMPC-0000013', 'SYR85G14OIPHA9L', 'Created', 'Created', 'Ann', 'New', '2021-01-16', 1610773968),
(49, 'FCCMPC-0000013', 'SYR85G14OIPHA9L', 'UI94P61QSGXLWCZ', 'Approved', 'Ann', 'Approved', '2021-01-16', 1610774045),
(50, 'FCCMPC-0000013', 'SYR85G14OIPHA9L', 'LWU2GAZ6HR51O0X', 'Approved', 'Ann', 'approved', '2021-01-16', 1610774083),
(51, 'FCCMPC-0000013', 'SYR85G14OIPHA9L', 'FOES7XV8I35HYCG', 'Disapproved', 'Ann', 'parag no. 5 not acceptable', '2021-01-16', 1610774125),
(52, 'FCCMPC-0000014', 'SYR85G14OIPHA9L', 'Created', 'Created', 'christine', 'New', '2021-01-16', 1610774591),
(53, 'FCCMPC-0000014', 'SYR85G14OIPHA9L', 'UI94P61QSGXLWCZ', 'Approved', 'Ann', 'ok', '2021-01-16', 1610774785),
(54, 'FCCMPC-0000014', 'SYR85G14OIPHA9L', 'LWU2GAZ6HR51O0X', 'Approved', 'Ann', 'ok', '2021-01-16', 1610774853),
(55, 'FCCMPC-0000014', 'SYR85G14OIPHA9L', 'FOES7XV8I35HYCG', 'Approved', 'Ann', 'approved', '2021-01-16', 1610775022),
(56, 'FCCMPC-0000014', 'SYR85G14OIPHA9L', 'IDQSR0BKEPO8CLH', 'Disapproved', 'yuya', 'Requirement in section 6  not acceptable. Need to improve controls.', '2021-01-16', 1610775157),
(57, 'FCCMPC-0000014', 'SYR85G14OIPHA9L', 'IDQSR0BKEPO8CLH', 'Disapproved', 'Ann', 'rate not applicable', '2021-01-16', 1610775175),
(58, 'FCCMPC-0000014', '', 'Resubmit', 'Resubmit', 'christine', 'Resubmit', '2021-01-16', 1610775599),
(59, 'FCCMPC-0000014', '', 'Resubmit', 'Resubmit', 'christine', 'Resubmit', '2021-01-16', 1610775631),
(60, 'FCCMPC-0000014', '', 'Resubmit', 'Resubmit', 'christine', 'Resubmit', '2021-01-16', 1610775690),
(61, 'FCCMPC-0000013', 'Resubmit', 'Resubmit', 'Resubmit', 'Ann', 'Resubmit', '2021-01-25', 1611575548),
(62, 'FCCMPC-0000014', 'SYR85G14OIPHA9L', 'IDQSR0BKEPO8CLH', 'Approved', 'Ann', '', '2021-01-25', 1611575586),
(63, 'FCCMPC-0000014', 'SYR85G14OIPHA9L', 'M9RXFWGI31NOQVC', 'Confirmed', 'Ann', '', '2021-01-25', 1611575664),
(64, 'FCCMPC-0000015', '9MBKG64J7IOAYCE', 'Created', 'Created', 'Ann', 'New', '2021-01-25', 1611576281),
(65, '', '', '', 'Approved', 'Ann', '', '2021-01-25', 1611576639),
(66, 'FCCMPC-0000015', '9MBKG64J7IOAYCE', 'LWU2GAZ6HR51O0X', 'Disapproved', 'Ann', 'test', '2021-01-25', 1611576672),
(67, 'FCCMPC-0000015', 'Resubmit', 'Resubmit', 'Resubmit', 'Ann', 'Resubmit', '2021-01-25', 1611576710),
(68, 'FCCMPC-0000015', '9MBKG64J7IOAYCE', 'LWU2GAZ6HR51O0X', 'Approved', 'Ann', '', '2021-01-25', 1611576735),
(69, 'FCCMPC-0000015', '9MBKG64J7IOAYCE', 'M9RXFWGI31NOQVC', 'Confirmed', 'Ann', 'test', '2021-01-25', 1611576755),
(70, '', '', '', 'Approved', 'Ann', 'tf', '2021-01-25', 1611576778),
(71, 'FCCMPC-0000016', '0EUZ39FK687SD1Q', 'Created', 'Created', 'Ann', 'New', '2021-01-25', 1611576877),
(72, 'FCCMPC-0000016', '0EUZ39FK687SD1Q', 'UI94P61QSGXLWCZ', 'Approved', 'Ann', '', '2021-01-25', 1611576938),
(73, 'FCCMPC-0000016', '0EUZ39FK687SD1Q', 'LWU2GAZ6HR51O0X', 'Disapproved', 'Ann', '', '2021-01-25', 1611577001),
(74, 'FCCMPC-0000016', '0EUZ39FK687SD1Q', 'LWU2GAZ6HR51O0X', 'Approved', 'Ann', 'test', '2021-01-25', 1611577248),
(75, 'FCCMPC-0000016', '0EUZ39FK687SD1Q', 'FOES7XV8I35HYCG', 'Approved', 'Ann', '', '2021-01-25', 1611577282),
(76, 'FCCMPC-0000016', '0EUZ39FK687SD1Q', 'IDQSR0BKEPO8CLH', 'Disapproved', 'Ann', 'j', '2021-01-25', 1611577304),
(77, 'FCCMPC-0000016', '0EUZ39FK687SD1Q', 'IDQSR0BKEPO8CLH', 'Approved', 'Ann', '', '2021-01-25', 1611577381),
(78, 'FCCMPC-0000017', '9MBKG64J7IOAYCE', 'Created', 'Created', 'Ann', 'New', '2021-01-26', 1611664916),
(79, 'FCCMPC-0000018', 'SYR85G14OIPHA9L', 'Created', 'Created', 'Ann', 'New', '2021-01-26', 1611666029),
(80, 'FCCMPC-0000018', 'SYR85G14OIPHA9L', 'UI94P61QSGXLWCZ', 'Approved', 'Ann', '', '2021-01-26', 1611666060),
(81, 'FCCMPC-0000018', 'SYR85G14OIPHA9L', 'LWU2GAZ6HR51O0X', 'Disapproved', 'Ann', '', '2021-01-26', 1611666082),
(82, 'FCCMPC-0000018', 'SYR85G14OIPHA9L', 'LWU2GAZ6HR51O0X', 'Approved', 'Ann', '', '2021-01-26', 1611666138),
(83, 'FCCMPC-0000018', 'SYR85G14OIPHA9L', 'FOES7XV8I35HYCG', 'Approved', 'Ann', '', '2021-01-26', 1611666157),
(84, 'FCCMPC-0000018', 'SYR85G14OIPHA9L', 'IDQSR0BKEPO8CLH', 'Approved', 'Ann', '', '2021-01-26', 1611666181),
(85, 'FCCMPC-0000018', 'SYR85G14OIPHA9L', 'M9RXFWGI31NOQVC', 'Confirmed', 'Ann', '', '2021-01-26', 1611666199),
(86, 'FCCMPC-0000013', 'SYR85G14OIPHA9L', 'FOES7XV8I35HYCG', 'Disapproved', 'Ann', 'reject', '2021-01-28', 1611836765),
(87, 'FCCMPC-0000013', 'Resubmit', 'Resubmit', 'Resubmit', 'Ann', 'Resubmit', '2021-01-28', 1611836834),
(88, 'FCCMPC-0000013', 'SYR85G14OIPHA9L', 'FOES7XV8I35HYCG', 'Approved', 'Ann', '', '2021-01-28', 1611836878),
(89, 'FCCMPC-0000019', 'SYR85G14OIPHA9L', 'Created', 'Created', 'Ann', 'New', '2021-01-29', 1611923747),
(90, 'FCCMPC-0000019', 'SYR85G14OIPHA9L', 'UI94P61QSGXLWCZ', 'Approved', 'Ann', '', '2021-01-29', 1611923839),
(91, 'FCCMPC-0000019', 'SYR85G14OIPHA9L', 'LWU2GAZ6HR51O0X', 'Approved', 'Ann', '', '2021-01-29', 1611923857),
(92, 'FCCMPC-0000019', 'SYR85G14OIPHA9L', 'FOES7XV8I35HYCG', 'Approved', 'Ann', '', '2021-01-29', 1611923893),
(93, 'FCCMPC-0000019', 'SYR85G14OIPHA9L', 'IDQSR0BKEPO8CLH', 'Disapproved', 'Ann', '', '2021-01-29', 1611923922),
(94, 'FCCMPC-0000020', 'SYR85G14OIPHA9L', 'Created', 'Created', 'Ann', 'New', '2021-01-30', 1611969025),
(95, 'FCCMPC-0000020', 'SYR85G14OIPHA9L', 'UI94P61QSGXLWCZ', 'Approved', 'Ann', 'ok', '2021-01-30', 1611969119),
(96, 'FCCMPC-0000021', 'SYR85G14OIPHA9L', 'Created', 'Created', 'Ann', 'New', '2021-01-30', 1611970906),
(97, 'FCCMPC-0000021', 'SYR85G14OIPHA9L', 'UI94P61QSGXLWCZ', 'Approved', 'Ann', 'ok', '2021-01-30', 1611971097),
(98, 'FCCMPC-0000022', 'SYR85G14OIPHA9L', 'Created', 'Created', 'Ann', 'New', '2021-01-30', 1611971454),
(99, 'FCCMPC-0000022', 'SYR85G14OIPHA9L', 'UI94P61QSGXLWCZ', 'Approved', 'Ann', 'ok', '2021-01-30', 1611971489),
(100, 'FCCMPC-0000022', 'SYR85G14OIPHA9L', 'LWU2GAZ6HR51O0X', 'Approved', 'Ann', 'ok', '2021-01-30', 1611971600),
(101, 'FCCMPC-0000022', 'SYR85G14OIPHA9L', 'FOES7XV8I35HYCG', 'Approved', 'Ann', 'ok', '2021-01-30', 1611971658),
(102, 'FCCMPC-0000022', 'SYR85G14OIPHA9L', 'IDQSR0BKEPO8CLH', 'Approved', 'Ann', 'ok', '2021-01-30', 1611971717),
(103, 'FCCMPC-0000022', 'SYR85G14OIPHA9L', 'M9RXFWGI31NOQVC', 'Confirmed', 'Ann', 'ok', '2021-01-30', 1611971835),
(104, 'FCCMPC-0000023', 'SYR85G14OIPHA9L', 'Created', 'Created', 'Ann', 'New', '2021-01-30', 1611972652),
(105, 'FCCMPC-0000023', 'SYR85G14OIPHA9L', 'UI94P61QSGXLWCZ', 'Approved', 'Ann', 'ok', '2021-01-30', 1611972791),
(106, 'FCCMPC-0000024', 'SYR85G14OIPHA9L', 'Created', 'Created', 'Ann', 'New', '2021-01-30', 1611973216),
(107, 'FCCMPC-0000024', 'SYR85G14OIPHA9L', 'UI94P61QSGXLWCZ', 'Approved', 'Ann', 'ok', '2021-01-30', 1611973271),
(108, 'FCCMPC-0000024', 'SYR85G14OIPHA9L', 'LWU2GAZ6HR51O0X', 'Disapproved', 'Ann', 'to add Responsibility', '2021-01-30', 1611973322),
(109, 'FCCMPC-0000024', 'Resubmit', 'Resubmit', 'Resubmit', 'Ann', 'Resubmit', '2021-01-30', 1611973455),
(110, 'FCCMPC-0000024', 'SYR85G14OIPHA9L', 'LWU2GAZ6HR51O0X', 'Approved', 'Reygan', 'Gwapo si Reygan', '2021-01-30', 1611973940),
(111, 'FCCMPC-0000024', 'SYR85G14OIPHA9L', 'FOES7XV8I35HYCG', 'Approved', 'Ann', 'ok', '2021-01-30', 1611974057),
(112, 'FCCMPC-0000024', 'SYR85G14OIPHA9L', 'IDQSR0BKEPO8CLH', 'Disapproved', 'Ann', 'to consider the rate applied', '2021-01-30', 1611974248),
(113, 'FCCMPC-0000024', 'Resubmit', 'Resubmit', 'Resubmit', 'Ann', 'Resubmit', '2021-01-30', 1611974693),
(114, 'FCCMPC-0000024', 'SYR85G14OIPHA9L', 'FOES7XV8I35HYCG', 'Approved', 'Ann', 'ok', '2021-01-30', 1611974831),
(115, 'FCCMPC-0000024', 'SYR85G14OIPHA9L', 'IDQSR0BKEPO8CLH', 'Disapproved', 'yuya', 'update requirement in section 6', '2021-01-30', 1611975007),
(116, 'FCCMPC-0000024', 'Resubmit', 'Resubmit', 'Resubmit', 'Ann', 'Resubmit', '2021-01-30', 1611975594),
(117, 'FCCMPC-0000024', 'SYR85G14OIPHA9L', 'FOES7XV8I35HYCG', 'Approved', 'Ann', 'ok', '2021-01-30', 1611975657),
(118, 'FCCMPC-0000024', 'SYR85G14OIPHA9L', 'IDQSR0BKEPO8CLH', 'Approved', 'yuya', 'ok', '2021-01-30', 1611975711),
(119, 'FCCMPC-0000025', 'SYR85G14OIPHA9L', 'Created', 'Created', 'Teo', 'New', '2021-01-30', 1611977508),
(120, 'FCCMPC-0000025', 'SYR85G14OIPHA9L', 'UI94P61QSGXLWCZ', 'Approved', 'Ann', 'ok', '2021-01-30', 1611977560),
(121, 'FCCMPC-0000025', 'SYR85G14OIPHA9L', 'LWU2GAZ6HR51O0X', 'Approved', 'Reygan', 'Obispo si Reygan', '2021-01-30', 1611977674),
(122, 'FCCMPC-0000025', 'SYR85G14OIPHA9L', 'FOES7XV8I35HYCG', 'Approved', 'Ann', 'ok', '2021-01-30', 1611977746),
(123, 'FCCMPC-0000025', 'SYR85G14OIPHA9L', 'IDQSR0BKEPO8CLH', 'Approved', 'yuya', 'ok', '2021-01-30', 1611977826),
(124, 'FCCMPC-0000026', 'SYR85G14OIPHA9L', 'Created', 'Created', 'Teo', 'New', '2021-01-30', 1611977973),
(125, 'FCCMPC-0000026', 'SYR85G14OIPHA9L', 'UI94P61QSGXLWCZ', 'Approved', 'Hilberth', '', '2021-01-30', 1611978057),
(126, 'FCCMPC-0000026', 'SYR85G14OIPHA9L', 'LWU2GAZ6HR51O0X', 'Approved', 'Hilberth', '', '2021-01-30', 1611978075),
(127, 'FCCMPC-0000026', 'SYR85G14OIPHA9L', 'FOES7XV8I35HYCG', 'Approved', 'Hilberth', '', '2021-01-30', 1611978092),
(128, 'FCCMPC-0000026', 'SYR85G14OIPHA9L', 'IDQSR0BKEPO8CLH', 'Approved', 'Hilberth', '', '2021-01-30', 1611978110),
(129, 'FCCMPC-0000027', 'SYR85G14OIPHA9L', 'Created', 'Created', 'Ann', 'New', '2021-01-30', 1611979164),
(130, 'FCCMPC-0000027', 'SYR85G14OIPHA9L', 'UI94P61QSGXLWCZ', 'Approved', 'Ann', 'ok', '2021-01-30', 1611979228),
(131, 'FCCMPC-0000026', 'SYR85G14OIPHA9L', 'M9RXFWGI31NOQVC', 'Confirmed', 'Hilberth', '', '2021-01-30', 1611980691),
(132, 'FCCMPC-0000028', 'SYR85G14OIPHA9L', 'Created', 'Created', 'Hilberth', 'New', '2021-02-01', 1612185139),
(133, 'FCCMPC-0000029', 'SYR85G14OIPHA9L', 'Created', 'Created', 'Ann', 'New', '2021-02-06', 1612573192),
(134, 'FCCMPC-0000029', 'SYR85G14OIPHA9L', 'UI94P61QSGXLWCZ', 'Approved', 'Sheila', 'ok', '2021-02-06', 1612573436),
(135, 'FCCMPC-0000029', 'SYR85G14OIPHA9L', 'UI94P61QSGXLWCZ', 'Approved', 'Salvie', 'ok', '2021-02-06', 1612573499),
(136, 'FCCMPC-0000029', 'SYR85G14OIPHA9L', 'UI94P61QSGXLWCZ', 'Approved', 'Minda', 'ok', '2021-02-06', 1612573570),
(137, 'FCCMPC-0000029', 'SYR85G14OIPHA9L', 'UI94P61QSGXLWCZ', 'Approved', 'Whien', 'ok', '2021-02-06', 1612573633),
(138, 'FCCMPC-0000029', 'SYR85G14OIPHA9L', 'UI94P61QSGXLWCZ', 'Approved', 'Nitz', 'ok', '2021-02-06', 1612573672),
(139, 'FCCMPC-0000029', 'SYR85G14OIPHA9L', 'UI94P61QSGXLWCZ', 'Approved', 'Tad', 'ok', '2021-02-06', 1612573710),
(140, 'FCCMPC-0000030', 'SYR85G14OIPHA9L', 'Created', 'Created', 'Ann', 'New', '2021-02-06', 1612576580),
(141, 'FCCMPC-0000030', 'SYR85G14OIPHA9L', 'UI94P61QSGXLWCZ', 'Approved', 'Tad', 'ok', '2021-02-06', 1612576733),
(142, 'FCCMPC-0000030', 'SYR85G14OIPHA9L', 'UI94P61QSGXLWCZ', 'Approved', 'Sheila', 'ok', '2021-02-06', 1612576775),
(143, 'FCCMPC-0000030', 'SYR85G14OIPHA9L', 'UI94P61QSGXLWCZ', 'Approved', 'Salvie', 'ok', '2021-02-06', 1612576814),
(144, 'FCCMPC-0000030', 'SYR85G14OIPHA9L', 'UI94P61QSGXLWCZ', 'Approved', 'Minda', 'ok', '2021-02-06', 1612576854),
(145, 'FCCMPC-0000030', 'SYR85G14OIPHA9L', 'UI94P61QSGXLWCZ', 'Approved', 'Whien', 'ok', '2021-02-06', 1612576888),
(146, 'FCCMPC-0000030', 'SYR85G14OIPHA9L', 'UI94P61QSGXLWCZ', 'Approved', 'Nitz', 'ok', '2021-02-06', 1612576946),
(147, 'FCCMPC-0000030', 'SYR85G14OIPHA9L', 'LWU2GAZ6HR51O0X', 'Approved', 'Reygan', '', '2021-02-06', 1612577330),
(148, 'FCCMPC-0000030', 'SYR85G14OIPHA9L', 'FOES7XV8I35HYCG', 'Approved', 'Ann', 'ok', '2021-02-06', 1612577386),
(149, 'FCCMPC-0000030', 'SYR85G14OIPHA9L', 'IDQSR0BKEPO8CLH', 'Approved', 'yuya', 'ok', '2021-02-06', 1612577714),
(150, 'FCCMPC-0000030', 'SYR85G14OIPHA9L', 'IDQSR0BKEPO8CLH', 'Approved', 'Jema', 'ok', '2021-02-06', 1612577845),
(151, 'FCCMPC-0000031', 'SYR85G14OIPHA9L', 'Created', 'Created', 'Ann', 'New', '2021-02-06', 1612578092),
(152, 'FCCMPC-0000031', 'SYR85G14OIPHA9L', 'UI94P61QSGXLWCZ', 'Approved', 'Salvie', 'ok', '2021-02-06', 1612578162),
(153, 'FCCMPC-0000031', 'SYR85G14OIPHA9L', 'UI94P61QSGXLWCZ', 'Approved', 'Sheila', 'ok', '2021-02-06', 1612578183),
(154, 'FCCMPC-0000031', 'SYR85G14OIPHA9L', 'UI94P61QSGXLWCZ', 'Approved', 'Nitz', 'ok', '2021-02-06', 1612578189),
(155, 'FCCMPC-0000031', 'SYR85G14OIPHA9L', 'UI94P61QSGXLWCZ', 'Approved', 'Minda', 'ok', '2021-02-06', 1612578202),
(156, 'FCCMPC-0000031', 'SYR85G14OIPHA9L', 'UI94P61QSGXLWCZ', 'Approved', 'Tad', 'ok', '2021-02-06', 1612578245),
(157, 'FCCMPC-0000031', 'SYR85G14OIPHA9L', 'UI94P61QSGXLWCZ', 'Approved', 'Whien', 'ok', '2021-02-06', 1612578270),
(158, 'FCCMPC-0000031', 'SYR85G14OIPHA9L', 'LWU2GAZ6HR51O0X', 'Approved', 'Reygan', '', '2021-02-06', 1612578349),
(159, 'FCCMPC-0000031', 'SYR85G14OIPHA9L', 'FOES7XV8I35HYCG', 'Approved', 'Ann', 'ok', '2021-02-06', 1612578614),
(160, 'FCCMPC-0000031', 'SYR85G14OIPHA9L', 'IDQSR0BKEPO8CLH', 'Approved', 'Jema', 'ok', '2021-02-06', 1612578679),
(161, 'FCCMPC-0000031', 'SYR85G14OIPHA9L', 'IDQSR0BKEPO8CLH', 'Approved', 'yuya', 'ok', '2021-02-06', 1612578803),
(162, 'FCCMPC-0000032', 'SYR85G14OIPHA9L', 'Created', 'Created', 'Tad', 'New', '2021-02-06', 1612580159),
(163, 'FCCMPC-0000032', 'SYR85G14OIPHA9L', 'UI94P61QSGXLWCZ', 'Approved', 'Salvie', 'ok', '2021-02-06', 1612580372),
(164, 'FCCMPC-0000032', 'SYR85G14OIPHA9L', 'UI94P61QSGXLWCZ', 'Approved', 'Whien', 'ok', '2021-02-06', 1612580411),
(165, 'FCCMPC-0000032', 'SYR85G14OIPHA9L', 'UI94P61QSGXLWCZ', 'Approved', 'Nitz', 'ok', '2021-02-06', 1612580413),
(166, 'FCCMPC-0000032', 'SYR85G14OIPHA9L', 'UI94P61QSGXLWCZ', 'Approved', 'Minda', 'ok', '2021-02-06', 1612580455),
(167, 'FCCMPC-0000032', 'SYR85G14OIPHA9L', 'UI94P61QSGXLWCZ', 'Approved', 'Sheila', 'ok', '2021-02-06', 1612580479),
(168, 'FCCMPC-0000032', 'SYR85G14OIPHA9L', 'UI94P61QSGXLWCZ', 'Approved', 'Tad', 'ok', '2021-02-06', 1612580528),
(169, 'FCCMPC-0000032', 'SYR85G14OIPHA9L', 'LWU2GAZ6HR51O0X', 'Approved', 'Reygan', '', '2021-02-06', 1612580733),
(170, 'FCCMPC-0000032', 'SYR85G14OIPHA9L', 'FOES7XV8I35HYCG', 'Approved', 'Ann', 'ok', '2021-02-06', 1612580800),
(171, 'FCCMPC-0000033', 'SYR85G14OIPHA9L', 'Created', 'Created', 'Tad', 'New', '2021-02-06', 1612580809),
(172, 'FCCMPC-0000032', 'SYR85G14OIPHA9L', 'IDQSR0BKEPO8CLH', 'Approved', 'Jema', 'ok', '2021-02-06', 1612580857),
(173, 'FCCMPC-0000032', 'SYR85G14OIPHA9L', 'IDQSR0BKEPO8CLH', 'Approved', 'yuya', 'ok', '2021-02-06', 1612580870),
(174, 'FCCMPC-0000033', 'SYR85G14OIPHA9L', 'UI94P61QSGXLWCZ', 'Approved', 'Nitz', 'ok', '2021-02-06', 1612580880),
(175, 'FCCMPC-0000033', 'SYR85G14OIPHA9L', 'UI94P61QSGXLWCZ', 'Approved', 'Salvie', 'ok', '2021-02-06', 1612582757),
(176, 'FCCMPC-0000033', 'SYR85G14OIPHA9L', 'UI94P61QSGXLWCZ', 'Approved', 'Tad', 'ok', '2021-02-06', 1612582781),
(177, 'FCCMPC-0000033', 'SYR85G14OIPHA9L', 'UI94P61QSGXLWCZ', 'Approved', 'Minda', 'ok', '2021-02-06', 1612582823),
(178, 'FCCMPC-0000033', 'SYR85G14OIPHA9L', 'UI94P61QSGXLWCZ', 'Approved', 'Whien', 'ok', '2021-02-06', 1612582855),
(179, 'FCCMPC-0000033', 'SYR85G14OIPHA9L', 'UI94P61QSGXLWCZ', 'Approved', 'Sheila', '', '2021-02-06', 1612582908),
(180, 'FCCMPC-0000033', 'SYR85G14OIPHA9L', 'LWU2GAZ6HR51O0X', 'Disapproved', 'Reygan', '', '2021-02-06', 1612583116),
(181, 'FCCMPC-0000034', 'SYR85G14OIPHA9L', 'Created', 'Created', 'Hilberth', 'New', '2021-02-12', 1613092337),
(182, 'FCCMPC-0000034', 'SYR85G14OIPHA9L', 'UI94P61QSGXLWCZ', 'Approved', 'Sheila', 'ok', '2021-02-12', 1613092739),
(183, 'FCCMPC-0000034', 'SYR85G14OIPHA9L', 'UI94P61QSGXLWCZ', 'Approved', 'Salvie', 'ok', '2021-02-12', 1613092741),
(184, 'FCCMPC-0000034', 'SYR85G14OIPHA9L', 'UI94P61QSGXLWCZ', 'Approved', 'Nitz', 'ok', '2021-02-12', 1613092808),
(185, 'FCCMPC-0000034', 'SYR85G14OIPHA9L', 'UI94P61QSGXLWCZ', 'Approved', 'Whien', 'ok', '2021-02-12', 1613092826),
(186, 'FCCMPC-0000034', 'SYR85G14OIPHA9L', 'UI94P61QSGXLWCZ', 'Approved', 'Tad', 'ok', '2021-02-12', 1613092844),
(187, 'FCCMPC-0000034', 'SYR85G14OIPHA9L', 'UI94P61QSGXLWCZ', 'Approved', 'Minda', 'ok', '2021-02-12', 1613092868),
(188, 'FCCMPC-0000034', 'SYR85G14OIPHA9L', 'LWU2GAZ6HR51O0X', 'Approved', 'Reygan', 'ok', '2021-02-12', 1613092929),
(189, 'FCCMPC-0000034', 'SYR85G14OIPHA9L', 'FOES7XV8I35HYCG', 'Approved', 'Ann', 'ok', '2021-02-12', 1613093341),
(190, 'FCCMPC-0000034', 'SYR85G14OIPHA9L', 'IDQSR0BKEPO8CLH', 'Disapproved', 'yuya', 'check requirements in section 3', '2021-02-12', 1613093764),
(191, 'FCCMPC-0000034', 'Resubmit', 'Resubmit', 'Resubmit', 'Hilberth', 'Resubmit', '2021-02-12', 1613093916),
(192, 'FCCMPC-0000034', 'SYR85G14OIPHA9L', 'FOES7XV8I35HYCG', 'Approved', 'Ann', 'ok', '2021-02-12', 1613094095),
(193, 'FCCMPC-0000034', 'SYR85G14OIPHA9L', 'IDQSR0BKEPO8CLH', 'Approved', 'Jema', 'ok', '2021-02-12', 1613094221),
(194, 'FCCMPC-0000034', 'SYR85G14OIPHA9L', 'M9RXFWGI31NOQVC', 'Confirmed', 'Teo', 'confirmed', '2021-02-12', 1613094753),
(195, 'FCCMPC-0000034', 'SYR85G14OIPHA9L', 'M9RXFWGI31NOQVC', 'Confirmed', 'Christine', 'confirmed', '2021-02-12', 1613094820),
(196, 'FCCMPC-0000035', 'SYR85G14OIPHA9L', 'Created', 'Created', 'Hilberth', 'New', '2021-02-12', 1613097376),
(197, 'FCCMPC-0000036', 'SYR85G14OIPHA9L', 'Created', 'Created', 'Christine', 'New', '2021-02-12', 1613097390),
(198, '', 'Cancelled', 'Cancelled', 'Cancelled', 'Hilberth', 'Cancelled', '2021-02-12', 1613097399),
(199, '', 'Cancelled', 'Cancelled', 'Cancelled', 'Christine', 'Cancelled', '2021-02-12', 1613097407),
(200, 'FCCMPC-0000037', 'SYR85G14OIPHA9L', 'Created', 'Created', 'Christine', 'New', '2021-02-12', 1613097850),
(201, 'FCCMPC-0000038', 'SYR85G14OIPHA9L', 'Created', 'Created', 'Christine', 'New', '2021-02-12', 1613097938),
(202, 'FCCMPC-0000039', 'SYR85G14OIPHA9L', 'Created', 'Created', 'Syra', 'New', '2021-02-12', 1613098036),
(203, 'FCCMPC-0000039', 'SYR85G14OIPHA9L', 'UI94P61QSGXLWCZ', 'Disapproved', 'Tad', '', '2021-02-12', 1613098146),
(204, 'FCCMPC-0000039', 'Resubmit', 'Resubmit', 'Resubmit', 'Syra', 'Resubmit', '2021-02-12', 1613098719),
(205, 'FCCMPC-0000039', 'SYR85G14OIPHA9L', 'UI94P61QSGXLWCZ', 'Approved', 'Tad', 'ok', '2021-02-12', 1613098863),
(206, 'FCCMPC-0000039', 'SYR85G14OIPHA9L', 'UI94P61QSGXLWCZ', 'Approved', 'Minda', 'ok', '2021-02-12', 1613099088),
(207, 'FCCMPC-0000039', 'SYR85G14OIPHA9L', 'UI94P61QSGXLWCZ', 'Approved', 'Sheila', 'ok', '2021-02-12', 1613099111),
(208, 'FCCMPC-0000039', 'SYR85G14OIPHA9L', 'UI94P61QSGXLWCZ', 'Approved', 'Nitz', 'ok', '2021-02-12', 1613099145),
(209, 'FCCMPC-0000039', 'SYR85G14OIPHA9L', 'UI94P61QSGXLWCZ', 'Approved', 'Whien', 'ok', '2021-02-12', 1613099151),
(210, 'FCCMPC-0000039', 'SYR85G14OIPHA9L', 'UI94P61QSGXLWCZ', 'Approved', 'Salvie', 'ok', '2021-02-12', 1613099166),
(211, 'FCCMPC-0000039', 'SYR85G14OIPHA9L', 'LWU2GAZ6HR51O0X', 'Approved', 'Reygan', 'ok', '2021-02-12', 1613099304),
(212, 'FCCMPC-0000039', 'SYR85G14OIPHA9L', 'FOES7XV8I35HYCG', 'Approved', 'Ann', 'ok', '2021-02-12', 1613099391),
(213, 'FCCMPC-0000039', 'SYR85G14OIPHA9L', 'IDQSR0BKEPO8CLH', 'Disapproved', 'Jema', 'review', '2021-02-12', 1613099430),
(214, 'FCCMPC-0000039', 'Resubmit', 'Resubmit', 'Resubmit', 'Syra', 'Resubmit', '2021-02-12', 1613099570),
(215, 'FCCMPC-0000039', 'SYR85G14OIPHA9L', 'FOES7XV8I35HYCG', 'Approved', 'Ann', 'ok', '2021-02-12', 1613099728),
(216, 'FCCMPC-0000039', 'SYR85G14OIPHA9L', 'IDQSR0BKEPO8CLH', 'Approved', 'Jema', 'ok\r\n', '2021-02-12', 1613099776),
(217, 'FCCMPC-0000039', 'SYR85G14OIPHA9L', 'IDQSR0BKEPO8CLH', 'Approved', 'yuya', 'ok', '2021-02-12', 1613099805),
(218, 'FCCMPC-0000039', 'SYR85G14OIPHA9L', 'M9RXFWGI31NOQVC', 'Confirmed', 'Ann', '', '2021-02-12', 1613099859),
(219, 'FCCMPC-0000039', 'SYR85G14OIPHA9L', 'M9RXFWGI31NOQVC', 'Confirmed', 'Syra', '', '2021-02-12', 1613099932),
(220, 'FCCMPC-0000039', 'SYR85G14OIPHA9L', 'M9RXFWGI31NOQVC', 'Confirmed', 'Teo', '', '2021-02-12', 1613099943),
(221, 'FCCMPC-0000039', 'SYR85G14OIPHA9L', 'M9RXFWGI31NOQVC', 'Confirmed', 'Christine', '', '2021-02-12', 1613099989),
(222, 'FCCMPC-0000039', 'SYR85G14OIPHA9L', 'M9RXFWGI31NOQVC', 'Confirmed', 'Richard', '', '2021-02-12', 1613100056),
(223, 'FCCMPC-0000040', 'SYR85G14OIPHA9L', 'Created', 'Created', 'Syra', 'New', '2021-02-20', 1613782884),
(224, 'FCCMPC-0000040', 'SYR85G14OIPHA9L', 'UI94P61QSGXLWCZ', 'Approved', 'Nitz', '', '2021-02-20', 1613783026),
(225, 'FCCMPC-0000040', 'SYR85G14OIPHA9L', 'UI94P61QSGXLWCZ', 'Approved', 'Tad', '', '2021-02-20', 1613783069),
(226, 'FCCMPC-0000040', 'SYR85G14OIPHA9L', 'UI94P61QSGXLWCZ', 'Approved', 'Whien', 'ok', '2021-02-20', 1613783096),
(227, 'FCCMPC-0000040', 'SYR85G14OIPHA9L', 'UI94P61QSGXLWCZ', 'Approved', 'Salvie', '', '2021-02-20', 1613783130),
(228, 'FCCMPC-0000040', 'SYR85G14OIPHA9L', 'UI94P61QSGXLWCZ', 'Disapproved', 'Minda', 'need to update current forms', '2021-02-20', 1613783136),
(229, 'FCCMPC-0000040', 'Resubmit', 'Resubmit', 'Resubmit', 'Syra', 'Resubmit', '2021-02-20', 1613784004),
(230, 'FCCMPC-0000040', 'SYR85G14OIPHA9L', 'UI94P61QSGXLWCZ', 'Approved', 'Sheila', '', '2021-02-20', 1613784041),
(231, 'FCCMPC-0000041', 'SYR85G14OIPHA9L', 'Created', 'Created', 'Syra', 'New', '2021-02-20', 1613785044),
(232, 'FCCMPC-0000041', 'SYR85G14OIPHA9L', 'UI94P61QSGXLWCZ', 'Approved', 'Nitz', '', '2021-02-20', 1613785072),
(233, 'FCCMPC-0000041', 'SYR85G14OIPHA9L', 'UI94P61QSGXLWCZ', 'Approved', 'Minda', '', '2021-02-20', 1613785108),
(234, 'FCCMPC-0000041', 'SYR85G14OIPHA9L', 'UI94P61QSGXLWCZ', 'Approved', 'Sheila', '', '2021-02-20', 1613785117),
(235, 'FCCMPC-0000041', 'SYR85G14OIPHA9L', 'UI94P61QSGXLWCZ', 'Approved', 'Tad', '', '2021-02-20', 1613785177),
(236, 'FCCMPC-0000041', 'SYR85G14OIPHA9L', 'UI94P61QSGXLWCZ', 'Approved', 'Whien', 'ok', '2021-02-20', 1613785184),
(237, 'FCCMPC-0000041', 'SYR85G14OIPHA9L', 'UI94P61QSGXLWCZ', 'Approved', 'Salvie', '', '2021-02-20', 1613785213),
(238, 'FCCMPC-0000041', 'SYR85G14OIPHA9L', 'LWU2GAZ6HR51O0X', 'Approved', 'Reygan', '', '2021-02-20', 1613785339),
(239, 'FCCMPC-0000041', 'SYR85G14OIPHA9L', 'FOES7XV8I35HYCG', 'Disapproved', 'Ann', 'in correct revision number', '2021-02-20', 1613785424),
(240, 'FCCMPC-0000041', 'Resubmit', 'Resubmit', 'Resubmit', 'Syra', 'Resubmit', '2021-02-20', 1613785517),
(241, 'FCCMPC-0000041', 'SYR85G14OIPHA9L', 'FOES7XV8I35HYCG', 'Approved', 'Ann', 'ok', '2021-02-20', 1613785549),
(242, 'FCCMPC-0000041', 'SYR85G14OIPHA9L', 'IDQSR0BKEPO8CLH', 'Disapproved', 'Jema', 'review title', '2021-02-20', 1613785611),
(243, 'FCCMPC-0000041', 'Resubmit', 'Resubmit', 'Resubmit', 'Syra', 'Resubmit', '2021-02-20', 1613785806),
(244, 'FCCMPC-0000041', 'SYR85G14OIPHA9L', 'FOES7XV8I35HYCG', 'Approved', 'Ann', '', '2021-02-20', 1613785846),
(245, 'FCCMPC-0000041', 'SYR85G14OIPHA9L', 'IDQSR0BKEPO8CLH', 'Approved', 'yuya', 'ok', '2021-02-20', 1613786098),
(246, 'FCCMPC-0000041', 'SYR85G14OIPHA9L', 'IDQSR0BKEPO8CLH', 'Approved', 'Jema', '', '2021-02-20', 1613786212);

-- --------------------------------------------------------

--
-- Table structure for table `fs_request_attachment`
--

CREATE TABLE `fs_request_attachment` (
  `id` int(10) NOT NULL,
  `file_id` varchar(15) NOT NULL,
  `file_name` varchar(500) NOT NULL,
  `file_uploader` varchar(30) NOT NULL,
  `file_unix` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `fs_request_attachment`
--

INSERT INTO `fs_request_attachment` (`id`, `file_id`, `file_name`, `file_uploader`, `file_unix`) VALUES
(1, 'FCCMPC-0000001', 'Loan Policy.txt', 'admin', 1610628998),
(2, 'FCCMPC-0000007', 'Loan Policy.txt', 'Ann', 1610759978),
(3, 'FCCMPC-0000008', 'Loan Policy.txt', 'Hilberth', 1610760784),
(4, 'FCCMPC-0000009', 'Loan Policy.txt', 'Hilberth', 1610761095),
(5, 'FCCMPC-0000011', 'FC-QMS-002_FCCMPC Document Control& Procedure_Rev6', 'Ann', 1610768665),
(6, 'FCCMPC-0000012', 'FC-QMS-002_FCCMPC Document Control& Procedure_Rev6', 'Ann', 1610769444),
(7, 'FCCMPC-0000013', 'sdfsdfsdfsfsdfsdfffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffsss.txt', 'Ann', 1611836827),
(8, 'FCCMPC-0000014', 'BANKAL PLAZA CHARGES DESCRIPTION.docx', 'christine', 1610775683),
(9, 'FCCMPC-0000015', 'text policy.txt', 'Ann', 1611576281),
(10, 'FCCMPC-0000016', 'text policy.txt', 'Ann', 1611576877),
(11, 'FCCMPC-0000017', 'sdfsdfsdfsfsdfsdfffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffsss.txt', 'Ann', 1611664916),
(12, 'FCCMPC-0000018', 'sdfsdfsdfsfsdfsdfffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffsss.txt', 'Ann', 1611666029),
(13, 'FCCMPC-0000019', 'sdfsdfsdfsfsdfsdfffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffsss.txt', 'Ann', 1611923747),
(14, 'FCCMPC-0000020', 'FC-BD-003_BANGKAL PLAZA OPERATING  rev5 for approval.doc', 'Ann', 1611969025),
(15, 'FCCMPC-0000021', 'FC-BD-003_BANGKAL PLAZA OPERATING  rev5.doc', 'Ann', 1611971048),
(16, 'FCCMPC-0000022', 'FC-BD-003_BANGKAL PLAZA OPERATING  rev5 for approval.doc', 'Ann', 1611971454),
(17, 'FCCMPC-0000023', 'FC-BD-003_BANGKAL PLAZA OPERATING  rev5 for approval.doc', 'Ann', 1611972652),
(18, 'FCCMPC-0000024', 'FC-BD-003_BANGKAL PLAZA OPERATING  rev5 for approval.doc', 'Ann', 1611975583),
(19, 'FCCMPC-0000025', 'TOR letter.docx', 'Teo', 1611977508),
(20, 'FCCMPC-0000026', 'TOR letter.docx', 'Teo', 1611977973),
(21, 'FCCMPC-0000027', 'FC-QMS-002_FCCMPC Document Control& Procedure_Rev5 for approval.doc', 'Ann', 1611979164),
(22, 'FCCMPC-0000028', 'sdfsdfsdfsfsdfsdfffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffsss.txt', 'Hilberth', 1612185162),
(23, 'FCCMPC-0000029', 'attendance.doc', 'Ann', 1612573192),
(24, 'FCCMPC-0000030', 'attendance.doc', 'Ann', 1612576580),
(25, 'FCCMPC-0000031', 'BR NO 556.doc', 'Ann', 1612578092),
(26, 'FCCMPC-0000032', 'New Text Document.txt', 'Tad', 1612580159),
(27, 'FCCMPC-0000033', 'New Text Document.txt', 'Tad', 1612580809),
(28, 'FCCMPC-0000034', 'dd.txt', 'Hilberth', 1613093910),
(29, 'FCCMPC-0000035', 'dd.txt', 'Hilberth', 1613097376),
(30, 'FCCMPC-0000036', 'New Text Document.txt', 'Christine', 1613097390),
(31, 'FCCMPC-0000037', 'New Text Document.txt', 'Christine', 1613097850),
(32, 'FCCMPC-0000038', 'New Text Document.txt', 'Christine', 1613097938),
(33, 'FCCMPC-0000039', 'BR NO 556.doc', 'Syra', 1613099559),
(34, 'FCCMPC-0000040', 'year end meeting dec 21 2020.doc', 'Syra', 1613783993),
(35, 'FCCMPC-0000041', 'title1.txt', 'Syra', 1613785738);

-- --------------------------------------------------------

--
-- Table structure for table `fs_request_main`
--

CREATE TABLE `fs_request_main` (
  `id` int(10) NOT NULL,
  `revision_id` varchar(5) NOT NULL,
  `rq_id` varchar(15) NOT NULL,
  `rq_name` varchar(50) NOT NULL,
  `rq_description` text NOT NULL,
  `rq_workflow` varchar(50) NOT NULL,
  `rq_requestor` varchar(30) NOT NULL,
  `rq_status` varchar(30) NOT NULL,
  `rq_unix` int(11) NOT NULL,
  `rq_created` date NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `fs_request_main`
--

INSERT INTO `fs_request_main` (`id`, `revision_id`, `rq_id`, `rq_name`, `rq_description`, `rq_workflow`, `rq_requestor`, `rq_status`, `rq_unix`, `rq_created`) VALUES
(1, '', 'FCCMPC-0000001', 'New Loan Policy', 'Newly created loan policy', '9MBKG64J7IOAYCE', 'admin', 'New', 1610628998, '2021-01-14'),
(2, '', 'FCCMPC-0000002', 'New Loan Policy 2', 'New policy 2', '9MBKG64J7IOAYCE', '', 'New', 1610630236, '2021-01-14'),
(3, '', 'FCCMPC-0000003', 'New Loan Policy 2', 'New policy 2', '9MBKG64J7IOAYCE', '', 'Disapproved', 1610630242, '2021-01-14'),
(4, '', 'FCCMPC-0000004', 'New Loan Policy 2', 'New policy 2', '9MBKG64J7IOAYCE', '', 'Completed', 1610630249, '2021-01-14'),
(5, '', 'FCCMPC-0000005', 'Case Loan Policy', 'New case loan policy', '9MBKG64J7IOAYCE', 'Ann', 'Completed', 1610684071, '2021-01-15'),
(6, '', 'FCCMPC-0000006', 'New Policy 123', 'new policy', '9MBKG64J7IOAYCE', 'Hilberth', 'Completed', 1610759192, '2021-01-16'),
(7, '', 'FCCMPC-0000007', 'New Loan Policy 3', 'test', '9MBKG64J7IOAYCE', 'Ann', 'Completed', 1610759875, '2021-01-16'),
(8, '', 'FCCMPC-0000008', 'New Loan Policy 4', 'this has been revised', '9MBKG64J7IOAYCE', 'Hilberth', 'Completed', 1610760584, '2021-01-16'),
(9, '', 'FCCMPC-0000009', 'New Loan Policy 5', '', '9MBKG64J7IOAYCE', 'Hilberth', 'Completed', 1610761069, '2021-01-16'),
(10, '', 'FCCMPC-0000010', 'New Loan Policy 6', 'testing', '9MBKG64J7IOAYCE', 'Hilberth', 'New', 1610761846, '2021-01-16'),
(11, '', 'FCCMPC-0000011', 'QMS-FC-002 ', 'FCCMPC Document Control & Procedure ', 'SYR85G14OIPHA9L', 'Ann', 'Completed', 1610768665, '2021-01-16'),
(12, '', 'FCCMPC-0000012', 'QMS-FC-002 ', '2', 'SYR85G14OIPHA9L', 'Ann', 'Completed', 1610769444, '2021-01-16'),
(13, '', 'FCCMPC-0000013', 'FC-BD-003', 'Business Policy', 'SYR85G14OIPHA9L', 'Ann', 'Approved', 1610773968, '2021-01-16'),
(14, '', 'FCCMPC-0000014', 'FC-BD-003', 'BUSINESS', 'SYR85G14OIPHA9L', 'christine', 'Confirmed', 1610774591, '2021-01-16'),
(15, '', 'FCCMPC-0000015', 'FCC-001', 'Assets Monitoring', '9MBKG64J7IOAYCE', 'Ann', 'Confirmed', 1611576281, '2021-01-25'),
(16, '', 'FCCMPC-0000016', 'FCC-002', 'F\r\nTEST', '0EUZ39FK687SD1Q', 'Ann', 'Completed', 1611576877, '2021-01-25'),
(17, '', 'FCCMPC-0000017', 'FCPM', 'te', '9MBKG64J7IOAYCE', 'Ann', 'New', 1611664916, '2021-01-26'),
(18, '', 'FCCMPC-0000018', 'NEW POLICY REV. 1', 'est', 'SYR85G14OIPHA9L', 'Ann', 'Completed', 1611666029, '2021-01-26'),
(19, '3', 'FCCMPC-0000019', 'QMS-FC-002', 'test', 'SYR85G14OIPHA9L', 'Ann', 'Disapproved', 1611923747, '2021-01-29'),
(20, '4', 'FCCMPC-0000020', 'QMS-FC-002 ', 'rev 7', 'SYR85G14OIPHA9L', 'Ann', 'Approved', 1611969025, '2021-01-30'),
(21, '3', 'FCCMPC-0000021', 'FC-BD-003', 'bankal', 'SYR85G14OIPHA9L', 'Ann', 'Approved', 1611970906, '2021-01-30'),
(22, '4', 'FCCMPC-0000022', 'FC-BD-003', 'bankal', 'SYR85G14OIPHA9L', 'Ann', 'Completed', 1611971454, '2021-01-30'),
(23, '5', 'FCCMPC-0000023', 'FC-BD-003', 'bankal', 'SYR85G14OIPHA9L', 'Ann', 'Approved', 1611972652, '2021-01-30'),
(24, '6', 'FCCMPC-0000024', 'FC-BD-003', 'bankal', 'SYR85G14OIPHA9L', 'Ann', 'Approved', 1611973216, '2021-01-30'),
(25, '7', 'FCCMPC-0000025', 'FC-BD-003', 'Bankal', 'SYR85G14OIPHA9L', 'Teo', 'Approved', 1611977508, '2021-01-30'),
(26, '8', 'FCCMPC-0000026', 'FC-BD-003', 'Bankal', 'SYR85G14OIPHA9L', 'Teo', 'Completed', 1611977973, '2021-01-30'),
(27, '5', 'FCCMPC-0000027', 'QMS-FC-002 ', 'Document Control', 'SYR85G14OIPHA9L', 'Ann', 'Approved', 1611979164, '2021-01-30'),
(28, '1', 'FCCMPC-0000028', 'rt', 'r', 'SYR85G14OIPHA9L', 'Hilberth', 'New', 1612185139, '2021-02-01'),
(29, '07', 'FCCMPC-0000029', 'QMS-FC-002 ', 'Doccon', 'SYR85G14OIPHA9L', 'Ann', 'Approved', 1612573192, '2021-02-06'),
(30, '07', 'FCCMPC-0000030', 'QMS-FC-002 ', 'Document Control', 'SYR85G14OIPHA9L', 'Ann', 'Approved', 1612576580, '2021-02-06'),
(31, '5', 'FCCMPC-0000031', 'FC-BD-003', 'Business', 'SYR85G14OIPHA9L', 'Ann', 'Approved', 1612578092, '2021-02-06'),
(32, '02', 'FCCMPC-0000032', 'FC-BD-003', 'business', 'SYR85G14OIPHA9L', 'Tad', 'Approved', 1612580159, '2021-02-06'),
(33, '3', 'FCCMPC-0000033', 'FC-BD-005', 'b', 'SYR85G14OIPHA9L', 'Tad', 'Disapproved', 1612580809, '2021-02-06'),
(34, '4', 'FCCMPC-0000034', 'New Loan Policy 2', '', 'SYR85G14OIPHA9L', 'Hilberth', 'Completed', 1613092337, '2021-02-12'),
(35, '4', 'FCCMPC-0000035', 'New Loan Policy 2', 'j', 'SYR85G14OIPHA9L', 'Hilberth', 'Cancelled', 1613097376, '2021-02-12'),
(36, '4', 'FCCMPC-0000036', 'FC-BD-005', 'business', 'SYR85G14OIPHA9L', 'Christine', 'Cancelled', 1613097390, '2021-02-12'),
(37, '7', 'FCCMPC-0000037', 'FC-BD-007', 'business', 'SYR85G14OIPHA9L', 'Christine', 'New', 1613097850, '2021-02-12'),
(38, '02', 'FCCMPC-0000038', 'FC-BD-003', 'business', 'SYR85G14OIPHA9L', 'Christine', 'New', 1613097938, '2021-02-12'),
(39, '07', 'FCCMPC-0000039', 'QMS-FC-002 ', 'doccon control', 'SYR85G14OIPHA9L', 'Syra', 'Completed', 1613098036, '2021-02-12'),
(40, '05', 'FCCMPC-0000040', 'FC-QMS-007', 'Archiving', 'SYR85G14OIPHA9L', 'Syra', 'Approved', 1613782884, '2021-02-20'),
(41, '07', 'FCCMPC-0000041', 'FC-QMS-007', 'Archiving', 'SYR85G14OIPHA9L', 'Syra', 'Completed', 1613785044, '2021-02-20');

-- --------------------------------------------------------

--
-- Table structure for table `fs_request_task_approver`
--

CREATE TABLE `fs_request_task_approver` (
  `id` int(10) NOT NULL,
  `unixdate` int(10) NOT NULL,
  `rq_no` varchar(30) NOT NULL,
  `workflow_id` varchar(30) NOT NULL,
  `steps_id` varchar(30) NOT NULL,
  `seq_no` int(5) NOT NULL,
  `approver_id` varchar(30) NOT NULL,
  `approval_status` varchar(30) NOT NULL,
  `approval_remarks` varchar(300) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `fs_request_task_approver`
--

INSERT INTO `fs_request_task_approver` (`id`, `unixdate`, `rq_no`, `workflow_id`, `steps_id`, `seq_no`, `approver_id`, `approval_status`, `approval_remarks`) VALUES
(1, 1612573436, 'FCCMPC-0000029', 'SYR85G14OIPHA9L', 'UI94P61QSGXLWCZ', 1, 'Sheila', 'Approved', 'ok'),
(2, 1612573499, 'FCCMPC-0000029', 'SYR85G14OIPHA9L', 'UI94P61QSGXLWCZ', 1, 'Salvie', 'Approved', 'ok'),
(3, 1612573570, 'FCCMPC-0000029', 'SYR85G14OIPHA9L', 'UI94P61QSGXLWCZ', 1, 'Minda', 'Approved', 'ok'),
(4, 1612573633, 'FCCMPC-0000029', 'SYR85G14OIPHA9L', 'UI94P61QSGXLWCZ', 1, 'Whien', 'Approved', 'ok'),
(5, 1612573672, 'FCCMPC-0000029', 'SYR85G14OIPHA9L', 'UI94P61QSGXLWCZ', 1, 'Nitz', 'Approved', 'ok'),
(6, 1612573710, 'FCCMPC-0000029', 'SYR85G14OIPHA9L', 'UI94P61QSGXLWCZ', 1, 'Tad', 'Approved', 'ok'),
(7, 1612576733, 'FCCMPC-0000030', 'SYR85G14OIPHA9L', 'UI94P61QSGXLWCZ', 1, 'Tad', 'Approved', 'ok'),
(8, 1612576775, 'FCCMPC-0000030', 'SYR85G14OIPHA9L', 'UI94P61QSGXLWCZ', 1, 'Sheila', 'Approved', 'ok'),
(9, 1612576814, 'FCCMPC-0000030', 'SYR85G14OIPHA9L', 'UI94P61QSGXLWCZ', 1, 'Salvie', 'Approved', 'ok'),
(10, 1612576854, 'FCCMPC-0000030', 'SYR85G14OIPHA9L', 'UI94P61QSGXLWCZ', 1, 'Minda', 'Approved', 'ok'),
(11, 1612576888, 'FCCMPC-0000030', 'SYR85G14OIPHA9L', 'UI94P61QSGXLWCZ', 1, 'Whien', 'Approved', 'ok'),
(12, 1612576946, 'FCCMPC-0000030', 'SYR85G14OIPHA9L', 'UI94P61QSGXLWCZ', 1, 'Nitz', 'Approved', 'ok'),
(13, 1612577330, 'FCCMPC-0000030', 'SYR85G14OIPHA9L', 'LWU2GAZ6HR51O0X', 2, 'Reygan', 'Approved', ''),
(14, 1612577386, 'FCCMPC-0000030', 'SYR85G14OIPHA9L', 'FOES7XV8I35HYCG', 3, 'Ann', 'Approved', 'ok'),
(15, 1612577714, 'FCCMPC-0000030', 'SYR85G14OIPHA9L', 'IDQSR0BKEPO8CLH', 4, 'yuya', 'Approved', 'ok'),
(16, 1612577845, 'FCCMPC-0000030', 'SYR85G14OIPHA9L', 'IDQSR0BKEPO8CLH', 4, 'Jema', 'Approved', 'ok'),
(17, 1612578162, 'FCCMPC-0000031', 'SYR85G14OIPHA9L', 'UI94P61QSGXLWCZ', 1, 'Salvie', 'Approved', 'ok'),
(18, 1612578183, 'FCCMPC-0000031', 'SYR85G14OIPHA9L', 'UI94P61QSGXLWCZ', 1, 'Sheila', 'Approved', 'ok'),
(19, 1612578189, 'FCCMPC-0000031', 'SYR85G14OIPHA9L', 'UI94P61QSGXLWCZ', 1, 'Nitz', 'Approved', 'ok'),
(20, 1612578202, 'FCCMPC-0000031', 'SYR85G14OIPHA9L', 'UI94P61QSGXLWCZ', 1, 'Minda', 'Approved', 'ok'),
(21, 1612578245, 'FCCMPC-0000031', 'SYR85G14OIPHA9L', 'UI94P61QSGXLWCZ', 1, 'Tad', 'Approved', 'ok'),
(22, 1612578270, 'FCCMPC-0000031', 'SYR85G14OIPHA9L', 'UI94P61QSGXLWCZ', 1, 'Whien', 'Approved', 'ok'),
(23, 1612578349, 'FCCMPC-0000031', 'SYR85G14OIPHA9L', 'LWU2GAZ6HR51O0X', 2, 'Reygan', 'Approved', ''),
(24, 1612578614, 'FCCMPC-0000031', 'SYR85G14OIPHA9L', 'FOES7XV8I35HYCG', 3, 'Ann', 'Approved', 'ok'),
(25, 1612578679, 'FCCMPC-0000031', 'SYR85G14OIPHA9L', 'IDQSR0BKEPO8CLH', 4, 'Jema', 'Approved', 'ok'),
(26, 1612578803, 'FCCMPC-0000031', 'SYR85G14OIPHA9L', 'IDQSR0BKEPO8CLH', 4, 'yuya', 'Approved', 'ok'),
(27, 1612580372, 'FCCMPC-0000032', 'SYR85G14OIPHA9L', 'UI94P61QSGXLWCZ', 1, 'Salvie', 'Approved', 'ok'),
(28, 1612580411, 'FCCMPC-0000032', 'SYR85G14OIPHA9L', 'UI94P61QSGXLWCZ', 1, 'Whien', 'Approved', 'ok'),
(29, 1612580413, 'FCCMPC-0000032', 'SYR85G14OIPHA9L', 'UI94P61QSGXLWCZ', 1, 'Nitz', 'Approved', 'ok'),
(30, 1612580455, 'FCCMPC-0000032', 'SYR85G14OIPHA9L', 'UI94P61QSGXLWCZ', 1, 'Minda', 'Approved', 'ok'),
(31, 1612580479, 'FCCMPC-0000032', 'SYR85G14OIPHA9L', 'UI94P61QSGXLWCZ', 1, 'Sheila', 'Approved', 'ok'),
(32, 1612580528, 'FCCMPC-0000032', 'SYR85G14OIPHA9L', 'UI94P61QSGXLWCZ', 1, 'Tad', 'Approved', 'ok'),
(33, 1612580733, 'FCCMPC-0000032', 'SYR85G14OIPHA9L', 'LWU2GAZ6HR51O0X', 2, 'Reygan', 'Approved', ''),
(34, 1612580800, 'FCCMPC-0000032', 'SYR85G14OIPHA9L', 'FOES7XV8I35HYCG', 3, 'Ann', 'Approved', 'ok'),
(35, 1612580857, 'FCCMPC-0000032', 'SYR85G14OIPHA9L', 'IDQSR0BKEPO8CLH', 4, 'Jema', 'Approved', 'ok'),
(36, 1612580870, 'FCCMPC-0000032', 'SYR85G14OIPHA9L', 'IDQSR0BKEPO8CLH', 4, 'yuya', 'Approved', 'ok'),
(37, 1612580880, 'FCCMPC-0000033', 'SYR85G14OIPHA9L', 'UI94P61QSGXLWCZ', 1, 'Nitz', 'Approved', 'ok'),
(38, 1612582757, 'FCCMPC-0000033', 'SYR85G14OIPHA9L', 'UI94P61QSGXLWCZ', 1, 'Salvie', 'Approved', 'ok'),
(39, 1612582781, 'FCCMPC-0000033', 'SYR85G14OIPHA9L', 'UI94P61QSGXLWCZ', 1, 'Tad', 'Approved', 'ok'),
(40, 1612582823, 'FCCMPC-0000033', 'SYR85G14OIPHA9L', 'UI94P61QSGXLWCZ', 1, 'Minda', 'Approved', 'ok'),
(41, 1612582855, 'FCCMPC-0000033', 'SYR85G14OIPHA9L', 'UI94P61QSGXLWCZ', 1, 'Whien', 'Approved', 'ok'),
(42, 1612582908, 'FCCMPC-0000033', 'SYR85G14OIPHA9L', 'UI94P61QSGXLWCZ', 1, 'Sheila', 'Approved', ''),
(43, 1612583116, 'FCCMPC-0000033', 'SYR85G14OIPHA9L', 'LWU2GAZ6HR51O0X', 2, 'Reygan', 'Disapproved', ''),
(44, 1613092739, 'FCCMPC-0000034', 'SYR85G14OIPHA9L', 'UI94P61QSGXLWCZ', 1, 'Sheila', 'Approved', 'ok'),
(45, 1613092741, 'FCCMPC-0000034', 'SYR85G14OIPHA9L', 'UI94P61QSGXLWCZ', 1, 'Salvie', 'Approved', 'ok'),
(46, 1613092808, 'FCCMPC-0000034', 'SYR85G14OIPHA9L', 'UI94P61QSGXLWCZ', 1, 'Nitz', 'Approved', 'ok'),
(47, 1613092826, 'FCCMPC-0000034', 'SYR85G14OIPHA9L', 'UI94P61QSGXLWCZ', 1, 'Whien', 'Approved', 'ok'),
(48, 1613092844, 'FCCMPC-0000034', 'SYR85G14OIPHA9L', 'UI94P61QSGXLWCZ', 1, 'Tad', 'Approved', 'ok'),
(49, 1613092868, 'FCCMPC-0000034', 'SYR85G14OIPHA9L', 'UI94P61QSGXLWCZ', 1, 'Minda', 'Approved', 'ok'),
(50, 1613092929, 'FCCMPC-0000034', 'SYR85G14OIPHA9L', 'LWU2GAZ6HR51O0X', 2, 'Reygan', 'Approved', 'ok'),
(51, 1613094095, 'FCCMPC-0000034', 'SYR85G14OIPHA9L', 'FOES7XV8I35HYCG', 3, 'Ann', 'Approved', 'ok'),
(52, 1613093764, 'FCCMPC-0000034', 'SYR85G14OIPHA9L', 'IDQSR0BKEPO8CLH', 4, 'yuya', 'Disapproved', 'check requirements in section 3'),
(53, 1613094221, 'FCCMPC-0000034', 'SYR85G14OIPHA9L', 'IDQSR0BKEPO8CLH', 4, 'Jema', 'Approved', 'ok'),
(54, 1613094753, 'FCCMPC-0000034', 'SYR85G14OIPHA9L', 'M9RXFWGI31NOQVC', 5, 'Teo', 'Confirmed', 'confirmed'),
(55, 1613094820, 'FCCMPC-0000034', 'SYR85G14OIPHA9L', 'M9RXFWGI31NOQVC', 5, 'Christine', 'Confirmed', 'confirmed'),
(56, 1613098863, 'FCCMPC-0000039', 'SYR85G14OIPHA9L', 'UI94P61QSGXLWCZ', 1, 'Tad', 'Approved', 'ok'),
(57, 1613099088, 'FCCMPC-0000039', 'SYR85G14OIPHA9L', 'UI94P61QSGXLWCZ', 1, 'Minda', 'Approved', 'ok'),
(58, 1613099111, 'FCCMPC-0000039', 'SYR85G14OIPHA9L', 'UI94P61QSGXLWCZ', 1, 'Sheila', 'Approved', 'ok'),
(59, 1613099145, 'FCCMPC-0000039', 'SYR85G14OIPHA9L', 'UI94P61QSGXLWCZ', 1, 'Nitz', 'Approved', 'ok'),
(60, 1613099151, 'FCCMPC-0000039', 'SYR85G14OIPHA9L', 'UI94P61QSGXLWCZ', 1, 'Whien', 'Approved', 'ok'),
(61, 1613099166, 'FCCMPC-0000039', 'SYR85G14OIPHA9L', 'UI94P61QSGXLWCZ', 1, 'Salvie', 'Approved', 'ok'),
(62, 1613099304, 'FCCMPC-0000039', 'SYR85G14OIPHA9L', 'LWU2GAZ6HR51O0X', 2, 'Reygan', 'Approved', 'ok'),
(63, 1613099728, 'FCCMPC-0000039', 'SYR85G14OIPHA9L', 'FOES7XV8I35HYCG', 3, 'Ann', 'Approved', 'ok'),
(64, 1613099776, 'FCCMPC-0000039', 'SYR85G14OIPHA9L', 'IDQSR0BKEPO8CLH', 4, 'Jema', 'Approved', 'ok\r\n'),
(65, 1613099805, 'FCCMPC-0000039', 'SYR85G14OIPHA9L', 'IDQSR0BKEPO8CLH', 4, 'yuya', 'Approved', 'ok'),
(66, 1613099859, 'FCCMPC-0000039', 'SYR85G14OIPHA9L', 'M9RXFWGI31NOQVC', 5, 'Ann', 'Confirmed', ''),
(67, 1613099932, 'FCCMPC-0000039', 'SYR85G14OIPHA9L', 'M9RXFWGI31NOQVC', 5, 'Syra', 'Confirmed', ''),
(68, 1613099943, 'FCCMPC-0000039', 'SYR85G14OIPHA9L', 'M9RXFWGI31NOQVC', 5, 'Teo', 'Confirmed', ''),
(69, 1613099989, 'FCCMPC-0000039', 'SYR85G14OIPHA9L', 'M9RXFWGI31NOQVC', 5, 'Christine', 'Confirmed', ''),
(70, 1613100056, 'FCCMPC-0000039', 'SYR85G14OIPHA9L', 'M9RXFWGI31NOQVC', 5, 'Richard', 'Confirmed', ''),
(71, 1613783026, 'FCCMPC-0000040', 'SYR85G14OIPHA9L', 'UI94P61QSGXLWCZ', 1, 'Nitz', 'Approved', ''),
(72, 1613783069, 'FCCMPC-0000040', 'SYR85G14OIPHA9L', 'UI94P61QSGXLWCZ', 1, 'Tad', 'Approved', ''),
(73, 1613783096, 'FCCMPC-0000040', 'SYR85G14OIPHA9L', 'UI94P61QSGXLWCZ', 1, 'Whien', 'Approved', 'ok'),
(74, 1613783130, 'FCCMPC-0000040', 'SYR85G14OIPHA9L', 'UI94P61QSGXLWCZ', 1, 'Salvie', 'Approved', ''),
(75, 1613783136, 'FCCMPC-0000040', 'SYR85G14OIPHA9L', 'UI94P61QSGXLWCZ', 1, 'Minda', 'Disapproved', 'need to update current forms'),
(76, 1613784041, 'FCCMPC-0000040', 'SYR85G14OIPHA9L', 'UI94P61QSGXLWCZ', 1, 'Sheila', 'Approved', ''),
(77, 1613785072, 'FCCMPC-0000041', 'SYR85G14OIPHA9L', 'UI94P61QSGXLWCZ', 1, 'Nitz', 'Approved', ''),
(78, 1613785108, 'FCCMPC-0000041', 'SYR85G14OIPHA9L', 'UI94P61QSGXLWCZ', 1, 'Minda', 'Approved', ''),
(79, 1613785117, 'FCCMPC-0000041', 'SYR85G14OIPHA9L', 'UI94P61QSGXLWCZ', 1, 'Sheila', 'Approved', ''),
(80, 1613785177, 'FCCMPC-0000041', 'SYR85G14OIPHA9L', 'UI94P61QSGXLWCZ', 1, 'Tad', 'Approved', ''),
(81, 1613785184, 'FCCMPC-0000041', 'SYR85G14OIPHA9L', 'UI94P61QSGXLWCZ', 1, 'Whien', 'Approved', 'ok'),
(82, 1613785213, 'FCCMPC-0000041', 'SYR85G14OIPHA9L', 'UI94P61QSGXLWCZ', 1, 'Salvie', 'Approved', ''),
(83, 1613785339, 'FCCMPC-0000041', 'SYR85G14OIPHA9L', 'LWU2GAZ6HR51O0X', 2, 'Reygan', 'Approved', ''),
(84, 1613785846, 'FCCMPC-0000041', 'SYR85G14OIPHA9L', 'FOES7XV8I35HYCG', 3, 'Ann', 'Approved', ''),
(85, 1613786212, 'FCCMPC-0000041', 'SYR85G14OIPHA9L', 'IDQSR0BKEPO8CLH', 4, 'Jema', 'Approved', ''),
(86, 1613786098, 'FCCMPC-0000041', 'SYR85G14OIPHA9L', 'IDQSR0BKEPO8CLH', 4, 'yuya', 'Approved', 'ok');

-- --------------------------------------------------------

--
-- Table structure for table `fs_request_task_status`
--

CREATE TABLE `fs_request_task_status` (
  `id` int(10) NOT NULL,
  `rq_work_id` varchar(30) NOT NULL,
  `rq_step_id` varchar(30) NOT NULL,
  `rq_no` varchar(30) NOT NULL,
  `seq_no` int(5) NOT NULL,
  `user_approvers` varchar(300) NOT NULL,
  `rq_status` varchar(30) NOT NULL,
  `unix_date` int(10) NOT NULL,
  `app_user` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `fs_request_task_status`
--

INSERT INTO `fs_request_task_status` (`id`, `rq_work_id`, `rq_step_id`, `rq_no`, `seq_no`, `user_approvers`, `rq_status`, `unix_date`, `app_user`) VALUES
(1, 'SYR85G14OIPHA9L', 'IDQSR0BKEPO8CLH', 'FCCMPC-0000014', 0, '', 'Approved', 1611575586, 'Ann'),
(2, 'SYR85G14OIPHA9L', 'M9RXFWGI31NOQVC', 'FCCMPC-0000014', 0, '', 'Confirmed', 1611575664, 'Ann'),
(3, '', '', '', 0, '', 'Approved', 1611576778, 'Ann'),
(4, '9MBKG64J7IOAYCE', 'LWU2GAZ6HR51O0X', 'FCCMPC-0000015', 0, '', 'Approved', 1611576735, 'Ann'),
(5, '9MBKG64J7IOAYCE', 'M9RXFWGI31NOQVC', 'FCCMPC-0000015', 0, '', 'Confirmed', 1611576755, 'Ann'),
(6, '0EUZ39FK687SD1Q', 'UI94P61QSGXLWCZ', 'FCCMPC-0000016', 0, '', 'Approved', 1611576938, 'Ann'),
(7, '0EUZ39FK687SD1Q', 'LWU2GAZ6HR51O0X', 'FCCMPC-0000016', 0, '', 'Approved', 1611577248, 'Ann'),
(8, '0EUZ39FK687SD1Q', 'FOES7XV8I35HYCG', 'FCCMPC-0000016', 0, '', 'Approved', 1611577282, 'Ann'),
(9, '0EUZ39FK687SD1Q', 'IDQSR0BKEPO8CLH', 'FCCMPC-0000016', 0, '', 'Approved', 1611577381, 'Ann'),
(10, 'SYR85G14OIPHA9L', 'UI94P61QSGXLWCZ', 'FCCMPC-0000018', 0, '', 'Approved', 1611666060, 'Ann'),
(11, 'SYR85G14OIPHA9L', 'LWU2GAZ6HR51O0X', 'FCCMPC-0000018', 0, '', 'Approved', 1611666138, 'Ann'),
(12, 'SYR85G14OIPHA9L', 'FOES7XV8I35HYCG', 'FCCMPC-0000018', 0, '', 'Approved', 1611666157, 'Ann'),
(13, 'SYR85G14OIPHA9L', 'IDQSR0BKEPO8CLH', 'FCCMPC-0000018', 0, '', 'Approved', 1611666181, 'Ann'),
(14, 'SYR85G14OIPHA9L', 'M9RXFWGI31NOQVC', 'FCCMPC-0000018', 0, '', 'Confirmed', 1611666199, 'Ann'),
(15, 'SYR85G14OIPHA9L', 'FOES7XV8I35HYCG', 'FCCMPC-0000013', 0, '', 'Approved', 1611836878, 'Ann'),
(16, 'SYR85G14OIPHA9L', 'UI94P61QSGXLWCZ', 'FCCMPC-0000019', 0, '', 'Approved', 1611923839, 'Ann'),
(17, 'SYR85G14OIPHA9L', 'LWU2GAZ6HR51O0X', 'FCCMPC-0000019', 0, '', 'Approved', 1611923857, 'Ann'),
(18, 'SYR85G14OIPHA9L', 'FOES7XV8I35HYCG', 'FCCMPC-0000019', 0, '', 'Approved', 1611923893, 'Ann'),
(19, 'SYR85G14OIPHA9L', 'IDQSR0BKEPO8CLH', 'FCCMPC-0000019', 0, '', 'Disapproved', 1611923922, 'Ann'),
(20, 'SYR85G14OIPHA9L', 'UI94P61QSGXLWCZ', 'FCCMPC-0000021', 1, 'FK6XL3P1WM2I', 'Approved', 1611971097, 'Ann'),
(21, 'SYR85G14OIPHA9L', 'LWU2GAZ6HR51O0X', 'FCCMPC-0000021', 2, 'JZ0FV1MS4H9W', '', 0, ''),
(22, 'SYR85G14OIPHA9L', 'FOES7XV8I35HYCG', 'FCCMPC-0000021', 3, 'BSGDR8AYM1U7', '', 0, ''),
(23, 'SYR85G14OIPHA9L', 'IDQSR0BKEPO8CLH', 'FCCMPC-0000021', 4, 'RX9MWFLHUY81', '', 0, ''),
(24, 'SYR85G14OIPHA9L', 'M9RXFWGI31NOQVC', 'FCCMPC-0000021', 5, 'E5KGHJ47DU1A', '', 0, ''),
(27, 'SYR85G14OIPHA9L', 'UI94P61QSGXLWCZ', 'FCCMPC-0000022', 1, 'FK6XL3P1WM2I', 'Approved', 1611971489, 'Ann'),
(28, 'SYR85G14OIPHA9L', 'LWU2GAZ6HR51O0X', 'FCCMPC-0000022', 2, 'JZ0FV1MS4H9W', 'Approved', 1611971600, 'Ann'),
(29, 'SYR85G14OIPHA9L', 'FOES7XV8I35HYCG', 'FCCMPC-0000022', 3, 'BSGDR8AYM1U7', 'Approved', 1611971658, 'Ann'),
(30, 'SYR85G14OIPHA9L', 'IDQSR0BKEPO8CLH', 'FCCMPC-0000022', 4, 'RX9MWFLHUY81', 'Approved', 1611971717, 'Ann'),
(31, 'SYR85G14OIPHA9L', 'M9RXFWGI31NOQVC', 'FCCMPC-0000022', 5, 'E5KGHJ47DU1A', 'Confirmed', 1611971835, 'Ann'),
(34, 'SYR85G14OIPHA9L', 'UI94P61QSGXLWCZ', 'FCCMPC-0000023', 1, 'FK6XL3P1WM2I', 'Approved', 1611972791, 'Ann'),
(35, 'SYR85G14OIPHA9L', 'LWU2GAZ6HR51O0X', 'FCCMPC-0000023', 2, 'JZ0FV1MS4H9W', '', 0, ''),
(36, 'SYR85G14OIPHA9L', 'FOES7XV8I35HYCG', 'FCCMPC-0000023', 3, 'BSGDR8AYM1U7', '', 0, ''),
(37, 'SYR85G14OIPHA9L', 'IDQSR0BKEPO8CLH', 'FCCMPC-0000023', 4, 'RX9MWFLHUY81', '', 0, ''),
(38, 'SYR85G14OIPHA9L', 'M9RXFWGI31NOQVC', 'FCCMPC-0000023', 5, '2G4KRSL1W6YI', '', 0, ''),
(41, 'SYR85G14OIPHA9L', 'UI94P61QSGXLWCZ', 'FCCMPC-0000024', 1, 'FK6XL3P1WM2I', 'Approved', 1611973271, 'Ann'),
(42, 'SYR85G14OIPHA9L', 'LWU2GAZ6HR51O0X', 'FCCMPC-0000024', 2, 'JZ0FV1MS4H9W', 'Approved', 1611973940, 'Reygan'),
(43, 'SYR85G14OIPHA9L', 'FOES7XV8I35HYCG', 'FCCMPC-0000024', 3, 'BSGDR8AYM1U7', 'Approved', 1611975657, 'Ann'),
(44, 'SYR85G14OIPHA9L', 'IDQSR0BKEPO8CLH', 'FCCMPC-0000024', 4, 'RX9MWFLHUY81', 'Approved', 1611975711, 'yuya'),
(45, 'SYR85G14OIPHA9L', 'M9RXFWGI31NOQVC', 'FCCMPC-0000024', 5, '2G4KRSL1W6YI', '', 0, ''),
(48, 'SYR85G14OIPHA9L', 'UI94P61QSGXLWCZ', 'FCCMPC-0000025', 1, 'FK6XL3P1WM2I', 'Approved', 1611977560, 'Ann'),
(49, 'SYR85G14OIPHA9L', 'LWU2GAZ6HR51O0X', 'FCCMPC-0000025', 2, 'JZ0FV1MS4H9W', 'Approved', 1611977674, 'Reygan'),
(50, 'SYR85G14OIPHA9L', 'FOES7XV8I35HYCG', 'FCCMPC-0000025', 3, 'BSGDR8AYM1U7', 'Approved', 1611977746, 'Ann'),
(51, 'SYR85G14OIPHA9L', 'IDQSR0BKEPO8CLH', 'FCCMPC-0000025', 4, 'RX9MWFLHUY81', 'Approved', 1611977826, 'yuya'),
(52, 'SYR85G14OIPHA9L', 'M9RXFWGI31NOQVC', 'FCCMPC-0000025', 5, '2G4KRSL1W6YI', '', 0, ''),
(55, 'SYR85G14OIPHA9L', 'UI94P61QSGXLWCZ', 'FCCMPC-0000026', 1, 'FK6XL3P1WM2I', 'Approved', 1611978057, 'Hilberth'),
(56, 'SYR85G14OIPHA9L', 'LWU2GAZ6HR51O0X', 'FCCMPC-0000026', 2, 'JZ0FV1MS4H9W', 'Approved', 1611978075, 'Hilberth'),
(57, 'SYR85G14OIPHA9L', 'FOES7XV8I35HYCG', 'FCCMPC-0000026', 3, 'BSGDR8AYM1U7', 'Approved', 1611978093, 'Hilberth'),
(58, 'SYR85G14OIPHA9L', 'IDQSR0BKEPO8CLH', 'FCCMPC-0000026', 4, 'RX9MWFLHUY81', 'Approved', 1611978110, 'Hilberth'),
(59, 'SYR85G14OIPHA9L', 'M9RXFWGI31NOQVC', 'FCCMPC-0000026', 5, '2G4KRSL1W6YI', 'Confirmed', 1611980691, 'Hilberth'),
(62, 'SYR85G14OIPHA9L', 'UI94P61QSGXLWCZ', 'FCCMPC-0000027', 1, 'FK6XL3P1WM2I', 'Approved', 1611979228, 'Ann'),
(63, 'SYR85G14OIPHA9L', 'LWU2GAZ6HR51O0X', 'FCCMPC-0000027', 2, 'JZ0FV1MS4H9W', '', 0, ''),
(64, 'SYR85G14OIPHA9L', 'FOES7XV8I35HYCG', 'FCCMPC-0000027', 3, 'BSGDR8AYM1U7', '', 0, ''),
(65, 'SYR85G14OIPHA9L', 'IDQSR0BKEPO8CLH', 'FCCMPC-0000027', 4, 'RX9MWFLHUY81', '', 0, ''),
(66, 'SYR85G14OIPHA9L', 'M9RXFWGI31NOQVC', 'FCCMPC-0000027', 5, '2G4KRSL1W6YI', '', 0, ''),
(69, 'SYR85G14OIPHA9L', 'UI94P61QSGXLWCZ', 'FCCMPC-0000028', 1, 'FK6XL3P1WM2I', '', 0, ''),
(70, 'SYR85G14OIPHA9L', 'LWU2GAZ6HR51O0X', 'FCCMPC-0000028', 2, 'JZ0FV1MS4H9W', '', 0, ''),
(71, 'SYR85G14OIPHA9L', 'FOES7XV8I35HYCG', 'FCCMPC-0000028', 3, 'BSGDR8AYM1U7', '', 0, ''),
(72, 'SYR85G14OIPHA9L', 'IDQSR0BKEPO8CLH', 'FCCMPC-0000028', 4, 'RX9MWFLHUY81', '', 0, ''),
(73, 'SYR85G14OIPHA9L', 'M9RXFWGI31NOQVC', 'FCCMPC-0000028', 5, 'E5KGHJ47DU1A', '', 0, ''),
(76, 'SYR85G14OIPHA9L', 'UI94P61QSGXLWCZ', 'FCCMPC-0000029', 1, 'FK6XL3P1WM2I', 'Approved', 1612573710, 'Tad'),
(77, 'SYR85G14OIPHA9L', 'LWU2GAZ6HR51O0X', 'FCCMPC-0000029', 2, 'JZ0FV1MS4H9W', '', 0, ''),
(78, 'SYR85G14OIPHA9L', 'FOES7XV8I35HYCG', 'FCCMPC-0000029', 3, 'BSGDR8AYM1U7', '', 0, ''),
(79, 'SYR85G14OIPHA9L', 'IDQSR0BKEPO8CLH', 'FCCMPC-0000029', 4, 'RX9MWFLHUY81', '', 0, ''),
(80, 'SYR85G14OIPHA9L', 'M9RXFWGI31NOQVC', 'FCCMPC-0000029', 5, 'SAMWXPZ5N6OY', '', 0, ''),
(83, 'SYR85G14OIPHA9L', 'UI94P61QSGXLWCZ', 'FCCMPC-0000030', 1, 'FK6XL3P1WM2I', 'Approved', 1612576946, 'Nitz'),
(84, 'SYR85G14OIPHA9L', 'LWU2GAZ6HR51O0X', 'FCCMPC-0000030', 2, 'JZ0FV1MS4H9W', 'Approved', 1612577330, 'Reygan'),
(85, 'SYR85G14OIPHA9L', 'FOES7XV8I35HYCG', 'FCCMPC-0000030', 3, 'BSGDR8AYM1U7', 'Approved', 1612577386, 'Ann'),
(86, 'SYR85G14OIPHA9L', 'IDQSR0BKEPO8CLH', 'FCCMPC-0000030', 4, 'RX9MWFLHUY81', 'Approved', 1612577845, 'Jema'),
(87, 'SYR85G14OIPHA9L', 'M9RXFWGI31NOQVC', 'FCCMPC-0000030', 5, 'E5KGHJ47DU1A,SAMWXPZ5N6OY,2G4KRSL1W6YI,E7SZRKNA1VB3,7OWC53Z02H4L', '', 0, ''),
(90, 'SYR85G14OIPHA9L', 'UI94P61QSGXLWCZ', 'FCCMPC-0000031', 1, 'FK6XL3P1WM2I', 'Approved', 1612578270, 'Whien'),
(91, 'SYR85G14OIPHA9L', 'LWU2GAZ6HR51O0X', 'FCCMPC-0000031', 2, 'JZ0FV1MS4H9W', 'Approved', 1612578349, 'Reygan'),
(92, 'SYR85G14OIPHA9L', 'FOES7XV8I35HYCG', 'FCCMPC-0000031', 3, 'BSGDR8AYM1U7', 'Approved', 1612578614, 'Ann'),
(93, 'SYR85G14OIPHA9L', 'IDQSR0BKEPO8CLH', 'FCCMPC-0000031', 4, 'RX9MWFLHUY81', 'Approved', 1612578803, 'yuya'),
(94, 'SYR85G14OIPHA9L', 'M9RXFWGI31NOQVC', 'FCCMPC-0000031', 5, '2G4KRSL1W6YI,E7SZRKNA1VB3', '', 0, ''),
(97, 'SYR85G14OIPHA9L', 'UI94P61QSGXLWCZ', 'FCCMPC-0000032', 1, 'FK6XL3P1WM2I', 'Approved', 1612580528, 'Tad'),
(98, 'SYR85G14OIPHA9L', 'LWU2GAZ6HR51O0X', 'FCCMPC-0000032', 2, 'JZ0FV1MS4H9W', 'Approved', 1612580733, 'Reygan'),
(99, 'SYR85G14OIPHA9L', 'FOES7XV8I35HYCG', 'FCCMPC-0000032', 3, 'BSGDR8AYM1U7', 'Approved', 1612580800, 'Ann'),
(100, 'SYR85G14OIPHA9L', 'IDQSR0BKEPO8CLH', 'FCCMPC-0000032', 4, 'RX9MWFLHUY81', 'Approved', 1612580870, 'yuya'),
(101, 'SYR85G14OIPHA9L', 'M9RXFWGI31NOQVC', 'FCCMPC-0000032', 5, 'E7SZRKNA1VB3', '', 0, ''),
(104, 'SYR85G14OIPHA9L', 'UI94P61QSGXLWCZ', 'FCCMPC-0000033', 1, 'FK6XL3P1WM2I', 'Approved', 1612582908, 'Sheila'),
(105, 'SYR85G14OIPHA9L', 'LWU2GAZ6HR51O0X', 'FCCMPC-0000033', 2, 'JZ0FV1MS4H9W', 'Disapproved', 1612583116, 'Reygan'),
(106, 'SYR85G14OIPHA9L', 'FOES7XV8I35HYCG', 'FCCMPC-0000033', 3, 'BSGDR8AYM1U7', '', 0, ''),
(107, 'SYR85G14OIPHA9L', 'IDQSR0BKEPO8CLH', 'FCCMPC-0000033', 4, 'RX9MWFLHUY81', '', 0, ''),
(108, 'SYR85G14OIPHA9L', 'M9RXFWGI31NOQVC', 'FCCMPC-0000033', 5, 'E7SZRKNA1VB3', '', 0, ''),
(111, 'SYR85G14OIPHA9L', 'UI94P61QSGXLWCZ', 'FCCMPC-0000034', 1, 'FK6XL3P1WM2I', 'Approved', 1613092868, 'Minda'),
(112, 'SYR85G14OIPHA9L', 'LWU2GAZ6HR51O0X', 'FCCMPC-0000034', 2, 'JZ0FV1MS4H9W', 'Approved', 1613092929, 'Reygan'),
(113, 'SYR85G14OIPHA9L', 'FOES7XV8I35HYCG', 'FCCMPC-0000034', 3, 'BSGDR8AYM1U7', 'Approved', 1613094095, 'Ann'),
(114, 'SYR85G14OIPHA9L', 'IDQSR0BKEPO8CLH', 'FCCMPC-0000034', 4, 'RX9MWFLHUY81', 'Approved', 1613094221, 'Jema'),
(115, 'SYR85G14OIPHA9L', 'M9RXFWGI31NOQVC', 'FCCMPC-0000034', 5, '2G4KRSL1W6YI', 'Confirmed', 1613094820, 'Christine'),
(118, 'SYR85G14OIPHA9L', 'UI94P61QSGXLWCZ', 'FCCMPC-0000035', 1, 'FK6XL3P1WM2I', '', 0, ''),
(119, 'SYR85G14OIPHA9L', 'LWU2GAZ6HR51O0X', 'FCCMPC-0000035', 2, 'JZ0FV1MS4H9W', '', 0, ''),
(120, 'SYR85G14OIPHA9L', 'FOES7XV8I35HYCG', 'FCCMPC-0000035', 3, 'BSGDR8AYM1U7', '', 0, ''),
(121, 'SYR85G14OIPHA9L', 'IDQSR0BKEPO8CLH', 'FCCMPC-0000035', 4, 'RX9MWFLHUY81', '', 0, ''),
(122, 'SYR85G14OIPHA9L', 'M9RXFWGI31NOQVC', 'FCCMPC-0000035', 5, '2G4KRSL1W6YI', '', 0, ''),
(125, 'SYR85G14OIPHA9L', 'UI94P61QSGXLWCZ', 'FCCMPC-0000036', 1, 'FK6XL3P1WM2I', '', 0, ''),
(126, 'SYR85G14OIPHA9L', 'LWU2GAZ6HR51O0X', 'FCCMPC-0000036', 2, 'JZ0FV1MS4H9W', '', 0, ''),
(127, 'SYR85G14OIPHA9L', 'FOES7XV8I35HYCG', 'FCCMPC-0000036', 3, 'BSGDR8AYM1U7', '', 0, ''),
(128, 'SYR85G14OIPHA9L', 'IDQSR0BKEPO8CLH', 'FCCMPC-0000036', 4, 'RX9MWFLHUY81', '', 0, ''),
(129, 'SYR85G14OIPHA9L', 'M9RXFWGI31NOQVC', 'FCCMPC-0000036', 5, '2G4KRSL1W6YI', '', 0, ''),
(132, 'SYR85G14OIPHA9L', 'UI94P61QSGXLWCZ', 'FCCMPC-0000037', 1, 'FK6XL3P1WM2I', '', 0, ''),
(133, 'SYR85G14OIPHA9L', 'LWU2GAZ6HR51O0X', 'FCCMPC-0000037', 2, 'JZ0FV1MS4H9W', '', 0, ''),
(134, 'SYR85G14OIPHA9L', 'FOES7XV8I35HYCG', 'FCCMPC-0000037', 3, 'BSGDR8AYM1U7', '', 0, ''),
(135, 'SYR85G14OIPHA9L', 'IDQSR0BKEPO8CLH', 'FCCMPC-0000037', 4, 'RX9MWFLHUY81', '', 0, ''),
(136, 'SYR85G14OIPHA9L', 'M9RXFWGI31NOQVC', 'FCCMPC-0000037', 5, '', '', 0, ''),
(139, 'SYR85G14OIPHA9L', 'UI94P61QSGXLWCZ', 'FCCMPC-0000038', 1, 'FK6XL3P1WM2I', '', 0, ''),
(140, 'SYR85G14OIPHA9L', 'LWU2GAZ6HR51O0X', 'FCCMPC-0000038', 2, 'JZ0FV1MS4H9W', '', 0, ''),
(141, 'SYR85G14OIPHA9L', 'FOES7XV8I35HYCG', 'FCCMPC-0000038', 3, 'BSGDR8AYM1U7', '', 0, ''),
(142, 'SYR85G14OIPHA9L', 'IDQSR0BKEPO8CLH', 'FCCMPC-0000038', 4, 'RX9MWFLHUY81', '', 0, ''),
(143, 'SYR85G14OIPHA9L', 'M9RXFWGI31NOQVC', 'FCCMPC-0000038', 5, 'E7SZRKNA1VB3', '', 0, ''),
(146, 'SYR85G14OIPHA9L', 'UI94P61QSGXLWCZ', 'FCCMPC-0000039', 1, 'FK6XL3P1WM2I', 'Approved', 1613099166, 'Salvie'),
(147, 'SYR85G14OIPHA9L', 'LWU2GAZ6HR51O0X', 'FCCMPC-0000039', 2, 'JZ0FV1MS4H9W', 'Approved', 1613099304, 'Reygan'),
(148, 'SYR85G14OIPHA9L', 'FOES7XV8I35HYCG', 'FCCMPC-0000039', 3, 'BSGDR8AYM1U7', 'Approved', 1613099728, 'Ann'),
(149, 'SYR85G14OIPHA9L', 'IDQSR0BKEPO8CLH', 'FCCMPC-0000039', 4, 'RX9MWFLHUY81', 'Approved', 1613099805, 'yuya'),
(150, 'SYR85G14OIPHA9L', 'M9RXFWGI31NOQVC', 'FCCMPC-0000039', 5, 'SAMWXPZ5N6OY,2G4KRSL1W6YI', 'Confirmed', 1613100056, 'Richard'),
(151, 'SYR85G14OIPHA9L', 'UI94P61QSGXLWCZ', 'FCCMPC-0000040', 1, 'FK6XL3P1WM2I', 'Approved', 1613784041, 'Sheila'),
(152, 'SYR85G14OIPHA9L', 'LWU2GAZ6HR51O0X', 'FCCMPC-0000040', 2, 'JZ0FV1MS4H9W', '', 0, ''),
(153, 'SYR85G14OIPHA9L', 'FOES7XV8I35HYCG', 'FCCMPC-0000040', 3, 'BSGDR8AYM1U7', '', 0, ''),
(154, 'SYR85G14OIPHA9L', 'IDQSR0BKEPO8CLH', 'FCCMPC-0000040', 4, 'RX9MWFLHUY81', '', 0, ''),
(155, 'SYR85G14OIPHA9L', 'M9RXFWGI31NOQVC', 'FCCMPC-0000040', 5, 'SAMWXPZ5N6OY,2G4KRSL1W6YI', '', 0, ''),
(158, 'SYR85G14OIPHA9L', 'UI94P61QSGXLWCZ', 'FCCMPC-0000041', 1, 'FK6XL3P1WM2I', 'Approved', 1613785213, 'Salvie'),
(159, 'SYR85G14OIPHA9L', 'LWU2GAZ6HR51O0X', 'FCCMPC-0000041', 2, 'JZ0FV1MS4H9W', 'Approved', 1613785339, 'Reygan'),
(160, 'SYR85G14OIPHA9L', 'FOES7XV8I35HYCG', 'FCCMPC-0000041', 3, 'BSGDR8AYM1U7', 'Approved', 1613785846, 'Ann'),
(161, 'SYR85G14OIPHA9L', 'IDQSR0BKEPO8CLH', 'FCCMPC-0000041', 4, 'RX9MWFLHUY81', 'Approved', 1613786212, 'Jema'),
(162, 'SYR85G14OIPHA9L', 'M9RXFWGI31NOQVC', 'FCCMPC-0000041', 5, 'SAMWXPZ5N6OY,2G4KRSL1W6YI', '', 0, '');

-- --------------------------------------------------------

--
-- Table structure for table `fs_settings`
--

CREATE TABLE `fs_settings` (
  `id` int(10) NOT NULL,
  `group_name` varchar(30) NOT NULL,
  `settings_label` varchar(30) NOT NULL,
  `settings_value` varchar(50) NOT NULL,
  `status` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `fs_settings`
--

INSERT INTO `fs_settings` (`id`, `group_name`, `settings_label`, `settings_value`, `status`) VALUES
(1, 'access_level', 'Approver', 'Approver', 'enable'),
(2, 'access_level', 'Implementor', 'Implementor', 'enable'),
(3, 'access_level', 'Document Administrator', 'DocAdmin', 'enable'),
(4, 'access_level', 'Administrator', 'Administrator', 'enable'),
(5, 'approvaltype', 'Series', 'Series', 'enable'),
(6, 'approvaltype', 'Parallel', 'Parallel', 'enable'),
(7, 'confirmation_type', 'Approval', 'Approval', 'enable'),
(8, 'confirmation_type', 'Concurrence', 'Concurrence', 'enable'),
(9, 'yes_no', 'Yes', 'Yes', 'enable'),
(10, 'yes_no', 'No', 'No', 'enable');

-- --------------------------------------------------------

--
-- Table structure for table `fs_users`
--

CREATE TABLE `fs_users` (
  `id` int(11) NOT NULL,
  `user_id` varchar(15) NOT NULL,
  `password` varchar(60) NOT NULL,
  `firstname` varchar(30) NOT NULL,
  `middlename` varchar(30) DEFAULT NULL,
  `lastname` varchar(30) NOT NULL,
  `user_email` varchar(50) NOT NULL,
  `photo` varchar(150) NOT NULL,
  `access_level` varchar(100) NOT NULL,
  `department` varchar(30) NOT NULL,
  `last_login` datetime(6) NOT NULL,
  `created_on` date DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `fs_users`
--

INSERT INTO `fs_users` (`id`, `user_id`, `password`, `firstname`, `middlename`, `lastname`, `user_email`, `photo`, `access_level`, `department`, `last_login`, `created_on`) VALUES
(1, 'radiant', '$2y$10$g4m/PfziRBxoM9fvwqiS9OgxAV29w0y8..XHruyEplYPxYnhZJ6bC', 'Radiant', 'A', 'Ganaden', 'radiantganaden@gmail.com', 'superman.jpg', 'Administrator', '3', '2021-01-16 09:04:00.000000', '2020-11-28'),
(4, '10002', '$2y$10$VaNpOIfmgxDcGNVaBBGIW.zXT1BW0tD/bTzE1n1QnFicQoyY/ZF4.', 'User', 'T', 'User', 'radiant_rag@yahoo.com.ph', 'reddd.jpg', 'DocAdmin,Administrator', '4', '0000-00-00 00:00:00.000000', '2020-11-28'),
(7, 'Ann', '$2y$10$k3hlKmlRjVeZoMgFv.7BbeQjb/p1Jt1JJGSpW8rkSFNamjvGom0Su', 'Ann', 'E.', 'Sorela', 'annalyn.sorela@yahoo.com', '', 'Approver,Implementor,DocAdmin,Administrator', '1', '2021-02-20 09:40:10.000000', '2021-01-14'),
(8, 'Reygan', '$2y$10$FzGBaZdAoQNds5Ku7AyLc.f5YAf2lqurB1HIlQ2jXcEuhokDTJ2X.', 'Reynaldo', 'A.', 'Gandionco', 'reygancoop@yahoo.com', '', 'Approver', '2', '2021-02-20 09:42:08.000000', '2021-01-14'),
(9, 'Nitz', '$2y$10$1Am653XI/IeXEZB3XxfM5Or.KjZ/reayYyjVzh7djabDz3BTEGUQ6', 'Nenita', 'N.', 'Ricaforte', 'hilberth01@yahoo.com', '', 'Approver', '3', '2021-02-20 09:37:40.000000', '2021-01-14'),
(10, 'Dux', '$2y$10$MZpt0Zhk2L9bn2F3AxmcuuVyZ9pBwhb.yKEBOPZy9kWvpuvDzdeH6', 'Dux', 'M. ', 'Samonte', 'hilberth01@yahoo.com', '', 'Implementor', '3', '2021-01-15 12:24:08.000000', '2021-01-14'),
(11, 'Jema', '$2y$10$tkK9kusRfN0TIOfORhOEaODy3W3vjhlU3.uLUWoPtLFdoMwY2/6dO', 'Jema', 'T. ', 'Tibon', 'hilberth01@yahoo.com', '', 'Approver', '4', '2021-02-20 09:50:26.000000', '2021-01-14'),
(12, 'Hilberth', '$2y$10$zEDVnAhhA4sOl4cE3z3Ta.2E0HCMrs2Y4hlYR4zc6f8TTN91c.wqy', 'Hilberth', 'U.', 'Regala', 'hilberth01@yahoo.com', '', 'Approver,Implementor,DocAdmin,Administrator', '5', '2021-02-12 09:11:15.000000', '2021-01-14'),
(13, 'yuya', '$2y$10$kQHfQZVLhVjUycCZhRSBaug5rftbxS8Rn8xRJ4I18Vv8XCs4umN92', 'Philura', 'M.', 'Hipe', 'yujhipe@gmail.com', '', 'Approver,Implementor', '6', '2021-02-20 09:47:33.000000', '2021-01-16'),
(14, 'Christine', '$2y$10$IxOo84iwg4Q5TUhDM3EjkutZQJ4bYgW0sYUndtNB1unEyHx00Ky.e', 'Christine', 'T', 'Bajao', 'christinebajao.8894@gmail.com', '', 'Implementor', '5', '2021-02-12 11:19:27.000000', '2021-01-16'),
(15, 'Sheila', '$2y$10$5JFBQwKjAG0C0P.Roc93p.hiOkiArDnOm2YNFt/Zx/KLbAPVvdb3G', 'Sheila Marie', 'Booc', 'Beceril', 'annalyn.sorela@yahoo.com', '', 'Approver,Implementor,DocAdmin,Administrator', '1', '2021-02-20 09:59:05.000000', '2021-01-16'),
(16, 'Whien', '$2y$10$JjaOVVui673igavNyFJaFuyzNnjU.9pgKLjEsNNQgtbDJDPhPuj0.', 'Whiendelyn', 'L.', 'Enero', 'whiendelyn.enero@gmail.com', '', 'Approver', '7', '2021-02-20 09:38:25.000000', '2021-01-16'),
(17, 'Syra', '$2y$10$7Ptwzvfa9cbjDN8g.pqy4uNa9ldjXJTUxkFsgZyihNMoXDqFUe2uW', 'Syra Lee', 'M.', 'Lauron', 'annalyn.sorela@yahoo.com', '', 'Implementor', '1', '2021-02-20 09:49:57.000000', '2021-01-16'),
(18, 'JR', '$2y$10$bKwbv3MzHBAX2lQhCqQ8Te8V.yHMV3H4yY7sZGF0F/SdJZ7ZsKobC', 'Jhun Rey', 'P.', 'Amorganda', 'annalyn.sorela@yahoo.com', '', 'Implementor', '5', '2021-02-06 13:19:54.000000', '2021-01-16'),
(19, 'Salvie', '$2y$10$IBEiryxaizH2bjdp1WFfR.v3BvBfErwp70M/OQFYHvrQbdSdO0Pnq', 'Mary Salvie', 'S.', 'Abastas', 'annalyn.sorela@yahoo.com', '', 'Approver', '8', '2021-02-20 09:40:01.000000', '2021-01-16'),
(20, 'Annjy', '$2y$10$.N4yauM2TkoKi9ZopOuGJ.8VZAvyR3NRLyB9btMV8gGP/2kZFxEJ6', 'Ann Jaysa', 'O.', 'Tirol', 'annalyn.sorela@yahoo.com', '', 'Implementor', '8', '0000-00-00 00:00:00.000000', '2021-01-16'),
(21, 'Minda', '$2y$10$pfyMjEnsqIfgWvpTujmkFuOHoa7A5j2vtIY7sEMh5O./YN21QmN0e', 'Lusminda', 'L.', 'Buagas', 'annalyn.sorela@yahoo.com', '', 'Approver', '3', '2021-02-20 09:37:54.000000', '2021-01-16'),
(22, 'Chardey', '$2y$10$Oxv1iHROfc1Ua99kbk9Ox.lYd8CBTVaqc78pYjXTfDT2v65KbMl5i', 'Chardey', 'T.', 'Bermudez', 'annalyn.sorela@yahoo.com', '', 'Implementor', '8', '0000-00-00 00:00:00.000000', '2021-01-16'),
(23, 'Charisse', '$2y$10$Wp2lqz80G.pzC.VghLR0rula1obiQcYbxwdJv.KRlTdYTu2zctUxO', 'Charisse', 'E.', 'Menguito', 'annalyn.sorela@yahoo.com', '', 'Implementor', '9', '0000-00-00 00:00:00.000000', '2021-01-16'),
(24, 'Dimple', '$2y$10$Iqg4jUcHbu6tUmyhtV4vZuxIfY9g7IRo3uEoi39P0exQ7bM9VaEHy', 'Rachelle Faye', 'H.', 'Molinos', 'annalyn.sorela@yahoo.com', '', 'Implementor', '7', '0000-00-00 00:00:00.000000', '2021-01-16'),
(25, 'Sandy', '$2y$10$bnwTNgs390xnFiaCU9Kjluy/b1ioI0I/C9msuwivGREEcCRzj.UIa', 'Sandy', 'F.', 'Canoneo', 'annalyn.sorela@yahoo.com', '', 'Implementor', '7', '0000-00-00 00:00:00.000000', '2021-01-16'),
(26, 'Ailec', '$2y$10$8Foo/S.lOEhFbCbS5qFOhee3epOTLPVwhet7PQbwsHf1.JA.XfZve', 'Glicel Ann', 'A.', 'Abueva', 'annalyn.sorela@yahoo.com', '', 'Implementor', '3', '0000-00-00 00:00:00.000000', '2021-01-16'),
(27, 'Teo', '$2y$10$YYaS7z/PhiqPqv/fTO6PreVPVTyZyK.p5Srr9BlH9WNuce9lE5m4S', 'Teofredo', 'C.', 'Llido Jr.', 'teofredo.llido@gmail.com', '', 'Implementor', '5', '2021-02-20 08:42:25.000000', '2021-01-16'),
(28, 'Jeaneth', '$2y$10$yA77EsBNkkmYJDmAwfhgpeTKUIwYnTR55E4UOb1/z3RsyabC8LLvi', 'Jeaneth', 'C.', 'Gaspan', 'annalyn.sorela@yahoo.com', '', 'Implementor', '7', '0000-00-00 00:00:00.000000', '2021-01-16'),
(29, 'Regina', '$2y$10$rqw7/erfIBQyKmcPulOsPu88H/i4gpkJZD/H6NUUKrc6Mg87775va', 'Regina Marie', 'E.', 'Suico', 'annalyn.sorela@yahoo.com', '', 'Implementor', '7', '0000-00-00 00:00:00.000000', '2021-01-16'),
(30, 'Mel', '$2y$10$LZTgRh74G9/aaH5zPOj5ZeXDsMTmoHHHrM38eB/GuHy8/GeTzTHwy', 'Melissa', 'A.', 'Paeres', 'annalyn.sorela@yahoo.com', '', 'Implementor', '7', '0000-00-00 00:00:00.000000', '2021-01-16'),
(31, 'Gladys', '$2y$10$iFtRaPLaWYvZMbbZcvyMuO9hT5si/YNmM8IDMpk/vskkkiY3cBnYy', 'Gladys', 'B.', 'Golosino', 'annalyn.sorela@yahoo.com', '', 'Implementor', '3', '0000-00-00 00:00:00.000000', '2021-01-16'),
(32, 'Rhina', '$2y$10$.i.lLfXuOgxQdimd/TxcouNsvjaPe.zhM7byd1eZ26.Z6K8PZ7gl6', 'Maria Clarina', 'A.', 'Cabadon', 'annalyn.sorela@yahoo.com', '', 'Implementor', '3', '0000-00-00 00:00:00.000000', '2021-01-16'),
(33, 'Tad', '$2y$10$Sjz0CZX3Mrln9Rg7Kl.Nwet5sgRfzoV5GMaO4U37byxyqr20WFhIS', 'Rudolph', 'C.', 'Montayre', 'annalyn.sorela@yahoo.com', '', 'Approver,Implementor', '5', '2021-02-20 09:39:38.000000', '2021-01-16'),
(34, 'Michael', '$2y$10$02eIQk3Q7pc6stumO.f2.OIO8qN30ZhUguPaPnQ20WVgWjDH6l9Uu', 'Michael', '.', 'Gille', 'annalyn.sorela@yahoo.com', '', 'Implementor', '7', '0000-00-00 00:00:00.000000', '2021-01-22'),
(35, 'Junray', '$2y$10$thMXq65M9HJNWryNTekHYOVx1O7PAg.nvUbKj3UkINHLTzmf2NBXa', 'Junray', 'G.', 'Mecares', 'annalyn.sorela@yahoo.com', '', 'Implementor', '1', '0000-00-00 00:00:00.000000', '2021-01-22'),
(36, 'Richard', '$2y$10$foGaKKGufEQ9KGfJi0x3guw0MI3o6bmZNPjAavu2uTzrsjfvyqhiO', 'Richard', '.', 'Benolirao', 'annalyn.sorela@yahoo.com', '', 'Implementor', '1', '2021-02-12 11:19:20.000000', '2021-01-22'),
(37, 'Daisy', '$2y$10$8vir17oc0Bdd3glfLQ5Sl.K9Mbnl2oUWib5RC0aTitmi3PRMf1UvO', 'Ma. Daisy', 'A.', 'Vega', 'christinebajao.8894@gmail.com', '', 'Implementor', '10', '0000-00-00 00:00:00.000000', '2021-01-22'),
(38, 'Melanie', '$2y$10$Zg0MeljsOL39QnBM5ByVU.lxIq0p4bnxt2CwxZBpiG092nTAH0aES', 'Melanie', '.', 'Amorin', 'christinebajao.8894@gmail.com', '', 'Implementor', '10', '0000-00-00 00:00:00.000000', '2021-01-22'),
(39, 'Nina', '$2y$10$.uWPT7Ep9B/fQ4c2sMEaG.s1WRq2mzCcykBiAn21u0pF3rXFfcBKK', 'Nina', '.', 'Magto', 'christinebajao.8894@gmail.com', '', 'Implementor', '10', '0000-00-00 00:00:00.000000', '2021-01-22'),
(40, 'Ella', '$2y$10$gsyLvdIkOhhS6fgPMmvK1OXXdlmBm19G0Klw.H1vFY31URIZ0x2uq', 'Estella', '.', 'Delarita', 'christinebajao.8894@gmail.com', '', 'Implementor', '10', '0000-00-00 00:00:00.000000', '2021-01-22'),
(41, 'Bibi', '$2y$10$8m0vnJ13TuYoKTCzCvNfIuY6MiNaWzioSkDeZxDKNoMt51gyRwUIC', 'Maria Cristina', 'B.', 'Estacio', 'christinebajao.8894@gmail.com', '', 'Approver', '4', '0000-00-00 00:00:00.000000', '2021-01-22'),
(42, 'Jerry', '$2y$10$7f/A5hLVy4oMO7fymSsPqeViWsjxgPw8YqVgDWkCHCmSyiL1LGUW2', 'Jerry', 'I.', 'Dulce', 'annalyn.sorela@yahoo.com', '', 'Approver', '4', '0000-00-00 00:00:00.000000', '2021-01-22'),
(43, 'Noel', '$2y$10$5k1mS2bulnflz2XOehbp9ekG8uB/b6cvcNd9t26nX/pUK3EcDG3ja', 'Noel', 'P.', 'Nunez', 'christinebajao.8894@gmail.com', '', 'Approver', '4', '0000-00-00 00:00:00.000000', '2021-01-22'),
(44, 'Boy', '$2y$10$sNt5EAhLrrPi1cCFptR6e.gJYZ/DOXNiZLqkODCVo2AdZGa9nQ3OW', 'Sixto', '.', 'Wahing', 'christinebajao.8894@gmail.com', '', 'Approver', '4', '0000-00-00 00:00:00.000000', '2021-01-22'),
(45, 'Fina', '$2y$10$JbXxYwB8O58ZQ98.f1QSTOQYx1ea4NgzuSVfkqVn4DwR/zEXixYcu', 'Josefina', 'I.', 'Ricafranca', 'christinebajao.8894@gmail.com', '', 'Approver', '4', '0000-00-00 00:00:00.000000', '2021-01-22'),
(46, 'Godo', '$2y$10$vM3sNCfQrtgg5.2eV/kdSuzPlDBY3.SQe9NLXvQXm7mqNTdtwM9.K', 'Godofredo', 'I.', 'Gequillo', 'christinebajao.8894@gmail.com', '', 'Approver', '4', '0000-00-00 00:00:00.000000', '2021-01-22'),
(47, 'Daryl', '$2y$10$QguEFUA1TcWj2nANc/pU9OEKlEvyl8RL2kZf7XxkUAdx6G52lK61q', 'Daryl', 'S.', 'Go', 'christinebajao.8894@gmail.com', '', 'Approver', '4', '0000-00-00 00:00:00.000000', '2021-01-22'),
(48, 'Dodon', '$2y$10$BbtL3CLGkka25mfQ/HXJLOMKMjCgVw95P3QACR9LMFxgsdwUKjorG', 'Porferio', 'S.', 'Montesclaros Jr.', 'christinebajao.8894@gmail.com', '', 'Approver', '4', '0000-00-00 00:00:00.000000', '2021-01-22');

-- --------------------------------------------------------

--
-- Table structure for table `fs_user_group`
--

CREATE TABLE `fs_user_group` (
  `id` int(10) NOT NULL,
  `ug_id` varchar(15) NOT NULL,
  `ug_name` varchar(30) NOT NULL,
  `ug_description` text NOT NULL,
  `ug_members` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `fs_user_group`
--

INSERT INTO `fs_user_group` (`id`, `ug_id`, `ug_name`, `ug_description`, `ug_members`) VALUES
(1, 'E5KGHJ47DU1A', 'Loan Department Implementers', 'Loan Department', 'Ailec,Gladys,Rhina'),
(3, 'JZ0FV1MS4H9W', 'General Manager', 'General Manager', 'Reygan'),
(4, 'SAMWXPZ5N6OY', 'HR Implementers', 'Implementor', 'Ann,Syra,Richard'),
(5, 'RX9MWFLHUY81', 'Board of Directors', 'Approving Board', 'Jema,yuya'),
(6, 'XSRGUE3HKOYM', 'Audit', 'Audit', ''),
(7, 'FK6XL3P1WM2I', 'Department Heads', 'List of all department heads', 'Sheila,Minda'),
(8, 'BSGDR8AYM1U7', 'DCA Approver', 'Doccon Admin Approver', 'Ann'),
(9, '2G4KRSL1W6YI', 'IT Implementers', 'IT', 'Christine,Teo'),
(10, 'E7SZRKNA1VB3', 'Business Dept Implementer', 'Business and IT Dept', 'JR'),
(11, '7OWC53Z02H4L', 'Collection Dept Implementers', 'Collection Dept ', 'Chardey'),
(12, 'X4AWYOUFMKSI', 'Knowles Branch Implementers', 'Knowles Branch', ''),
(13, 'NCV3ELWT0J64', 'Marketing & Membership Dept Im', 'Marketing & Membership Dept', 'Dux,Charisse'),
(14, 'C7W1D0URZ9JK', 'Department Heads Implementers ', 'Department Heads ', 'Nitz,Sheila,Whien,Salvie,Minda,Tad');

-- --------------------------------------------------------

--
-- Table structure for table `fs_workflow`
--

CREATE TABLE `fs_workflow` (
  `id` int(10) NOT NULL,
  `form_id` varchar(15) NOT NULL,
  `form_name` varchar(30) NOT NULL,
  `form_steps_id` varchar(30) NOT NULL,
  `form_sequence` int(10) NOT NULL,
  `form_approver` varchar(30) DEFAULT NULL,
  `form_approval_type` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `fs_workflow`
--

INSERT INTO `fs_workflow` (`id`, `form_id`, `form_name`, `form_steps_id`, `form_sequence`, `form_approver`, `form_approval_type`) VALUES
(2, '9MBKG64J7IOAYCE', 'GMs Approval Workflow', 'FOES7XV8I35HYCG', 1, 'NA', 'series'),
(3, '9MBKG64J7IOAYCE', 'GMs Approval Workflow', 'P8RASZ5I43DMN06', 3, 'NA', 'series'),
(4, 'SYR85G14OIPHA9L', 'MAIN OFFICE Workflow', 'LWU2GAZ6HR51O0X', 2, NULL, 'series'),
(5, 'SYR85G14OIPHA9L', 'MAIN OFFICE Workflow', 'M9RXFWGI31NOQVC', 5, '2G4KRSL1W6YI', 'series'),
(6, 'SYR85G14OIPHA9L', 'MAIN OFFICE Workflow', 'UI94P61QSGXLWCZ', 1, NULL, 'series'),
(7, 'SYR85G14OIPHA9L', 'MAIN OFFICE Workflow', 'FOES7XV8I35HYCG', 3, 'BSGDR8AYM1U7', 'series'),
(8, 'SYR85G14OIPHA9L', 'MAIN OFFICE Workflow', 'IDQSR0BKEPO8CLH', 4, 'RX9MWFLHUY81', 'series'),
(9, 'ZJVUOB63FMWCS9T', 'KNOWLES BRANCH Workflow', 'LWU2GAZ6HR51O0X', 1, NULL, 'series'),
(10, 'ZJVUOB63FMWCS9T', 'KNOWLES BRANCH Workflow', 'M9RXFWGI31NOQVC', 4, NULL, 'series'),
(11, 'ZJVUOB63FMWCS9T', 'KNOWLES BRANCH Workflow', 'FOES7XV8I35HYCG', 2, NULL, 'series'),
(12, 'ZJVUOB63FMWCS9T', 'KNOWLES BRANCH Workflow', 'IDQSR0BKEPO8CLH', 3, NULL, 'series'),
(13, '0EUZ39FK687SD1Q', 'Direct Staff Workflow', 'LWU2GAZ6HR51O0X', 2, NULL, 'series'),
(14, '0EUZ39FK687SD1Q', 'Direct Staff Workflow', 'UI94P61QSGXLWCZ', 1, NULL, 'series'),
(15, '0EUZ39FK687SD1Q', 'Direct Staff Workflow', 'FOES7XV8I35HYCG', 3, NULL, 'series'),
(16, '0EUZ39FK687SD1Q', 'Direct Staff Workflow', 'IDQSR0BKEPO8CLH', 4, NULL, 'series'),
(17, '9MBKG64J7IOAYCE', 'GMs Approval Workflow', 'IDQSR0BKEPO8CLH', 2, 'NA', 'series');

-- --------------------------------------------------------

--
-- Table structure for table `fs_workstpes`
--

CREATE TABLE `fs_workstpes` (
  `id` int(10) NOT NULL,
  `work_id` varchar(30) NOT NULL,
  `work_name` varchar(50) NOT NULL,
  `approver` varchar(100) NOT NULL,
  `approval_type` varchar(20) NOT NULL,
  `confirm_type` varchar(15) NOT NULL,
  `time_window` int(10) NOT NULL DEFAULT 1,
  `needed_approval` int(5) NOT NULL DEFAULT 1,
  `reject_first` varchar(30) NOT NULL,
  `reject_change` varchar(30) NOT NULL,
  `reject_anchor` varchar(10) NOT NULL,
  `select_group` varchar(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `fs_workstpes`
--

INSERT INTO `fs_workstpes` (`id`, `work_id`, `work_name`, `approver`, `approval_type`, `confirm_type`, `time_window`, `needed_approval`, `reject_first`, `reject_change`, `reject_anchor`, `select_group`) VALUES
(2, 'LWU2GAZ6HR51O0X', 'General Manager Approval', 'JZ0FV1MS4H9W', 'Series', 'Approval', 10, 1, 'NA', 'NA', 'No', 'No'),
(3, 'M9RXFWGI31NOQVC', 'Implementers Conformance', 'E5KGHJ47DU1A,SAMWXPZ5N6OY,2G4KRSL1W6YI,E7SZRKNA1VB3,7OWC53Z02H4L', 'Parallel', 'Concurrence', 3, 1, 'NA', 'NA', 'No', 'Yes'),
(4, 'UI94P61QSGXLWCZ', 'Department Head Approval', 'FK6XL3P1WM2I', 'Parallel', 'Approval', 3, 1, 'N/A', 'N/A', '', ''),
(5, 'FOES7XV8I35HYCG', 'DCA Approval', 'BSGDR8AYM1U7', 'Series', 'Approval', 3, 1, 'N/A', 'N/A', 'Yes', ''),
(6, 'IDQSR0BKEPO8CLH', 'BOD  Approval', 'RX9MWFLHUY81', 'Parallel', 'Approval', 3, 1, 'N/A', 'N/A', 'No', 'No'),
(7, 'TSX1UQP25VA0Z9J', 'KBOC Approval', 'X4AWYOUFMKSI', 'Parallel', 'Approval', 3, 1, 'N/A', 'N/A', '', ''),
(8, 'P8RASZ5I43DMN06', 'Department Head Implementers', 'FK6XL3P1WM2I', 'Parallel', 'Concurrence', 3, 3, 'N/A', 'N/A', 'No', 'Yes');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `fcs_request`
--
ALTER TABLE `fcs_request`
  ADD PRIMARY KEY (`pid`);

--
-- Indexes for table `fs_access_level`
--
ALTER TABLE `fs_access_level`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `fs_attribute_logger`
--
ALTER TABLE `fs_attribute_logger`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `fs_department`
--
ALTER TABLE `fs_department`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `dept_no` (`dept_no`);

--
-- Indexes for table `fs_doc_viewer`
--
ALTER TABLE `fs_doc_viewer`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `fs_request_approval`
--
ALTER TABLE `fs_request_approval`
  ADD PRIMARY KEY (`id`),
  ADD KEY `request_id` (`request_id`,`flow_id`,`step_id`),
  ADD KEY `unix` (`unix`);

--
-- Indexes for table `fs_request_attachment`
--
ALTER TABLE `fs_request_attachment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `file_id` (`file_id`);

--
-- Indexes for table `fs_request_main`
--
ALTER TABLE `fs_request_main`
  ADD PRIMARY KEY (`id`),
  ADD KEY `rq_id` (`rq_id`);

--
-- Indexes for table `fs_request_task_approver`
--
ALTER TABLE `fs_request_task_approver`
  ADD PRIMARY KEY (`id`),
  ADD KEY `rq_no` (`rq_no`,`workflow_id`,`steps_id`);

--
-- Indexes for table `fs_request_task_status`
--
ALTER TABLE `fs_request_task_status`
  ADD PRIMARY KEY (`id`),
  ADD KEY `unix_date` (`unix_date`),
  ADD KEY `rq_work_id` (`rq_work_id`,`rq_step_id`,`rq_no`);

--
-- Indexes for table `fs_settings`
--
ALTER TABLE `fs_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `fs_users`
--
ALTER TABLE `fs_users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_id` (`user_id`);

--
-- Indexes for table `fs_user_group`
--
ALTER TABLE `fs_user_group`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ug_id` (`ug_id`);

--
-- Indexes for table `fs_workflow`
--
ALTER TABLE `fs_workflow`
  ADD PRIMARY KEY (`id`),
  ADD KEY `form_id` (`form_id`),
  ADD KEY `form_steps_id` (`form_steps_id`);

--
-- Indexes for table `fs_workstpes`
--
ALTER TABLE `fs_workstpes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `work_id` (`work_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `fcs_request`
--
ALTER TABLE `fcs_request`
  MODIFY `pid` int(15) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `fs_access_level`
--
ALTER TABLE `fs_access_level`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `fs_attribute_logger`
--
ALTER TABLE `fs_attribute_logger`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=422;

--
-- AUTO_INCREMENT for table `fs_department`
--
ALTER TABLE `fs_department`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `fs_doc_viewer`
--
ALTER TABLE `fs_doc_viewer`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `fs_request_approval`
--
ALTER TABLE `fs_request_approval`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=247;

--
-- AUTO_INCREMENT for table `fs_request_attachment`
--
ALTER TABLE `fs_request_attachment`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT for table `fs_request_main`
--
ALTER TABLE `fs_request_main`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT for table `fs_request_task_approver`
--
ALTER TABLE `fs_request_task_approver`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=87;

--
-- AUTO_INCREMENT for table `fs_request_task_status`
--
ALTER TABLE `fs_request_task_status`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=165;

--
-- AUTO_INCREMENT for table `fs_settings`
--
ALTER TABLE `fs_settings`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `fs_users`
--
ALTER TABLE `fs_users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT for table `fs_user_group`
--
ALTER TABLE `fs_user_group`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `fs_workflow`
--
ALTER TABLE `fs_workflow`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `fs_workstpes`
--
ALTER TABLE `fs_workstpes`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- Database: `db_ittr`
--
CREATE DATABASE IF NOT EXISTS `db_ittr` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `db_ittr`;

-- --------------------------------------------------------

--
-- Table structure for table `tb_ca`
--

CREATE TABLE `tb_ca` (
  `ca_id` int(11) NOT NULL,
  `request_id` int(11) NOT NULL,
  `ca_root_cause` longtext DEFAULT NULL,
  `ca_containment` text DEFAULT NULL,
  `ca_corrective_action` text DEFAULT NULL,
  `ca_effectiveness` text DEFAULT NULL,
  `closed_by` int(11) DEFAULT NULL,
  `closed_date` varchar(50) DEFAULT NULL,
  `r_feedback` varchar(50) DEFAULT NULL,
  `r_comment` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_ca`
--

INSERT INTO `tb_ca` (`ca_id`, `request_id`, `ca_root_cause`, `ca_containment`, `ca_corrective_action`, `ca_effectiveness`, `closed_by`, `closed_date`, `r_feedback`, `r_comment`) VALUES
(1, 3, 'not the same network connection; VLAN in use on Wireless network', 'Transfer connection to Vlan with thesame network to printer', 'Transfer connection to Vlan with thesame network to printer', '', 14, '11/18/2020', '', ''),
(2, 4, 'Accidentally spammed email', 'Set as Not Spam', 'Set as Not Spam', '', 14, '11/19/2020', '', ''),
(3, 4, 'Accidentally spammed email', 'Set as Not Spam', 'Set as Not Spam', '', 14, '11/19/2020', '', ''),
(4, 12, 'server Network connection expired', 're-input password', 're-input password', '', 14, '12/04/2020', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `tb_concern`
--

CREATE TABLE `tb_concern` (
  `concern_id` int(11) NOT NULL,
  `concern_name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_concern`
--

INSERT INTO `tb_concern` (`concern_id`, `concern_name`) VALUES
(1, 'Technical problem and Software Related'),
(2, 'Admin Issues'),
(3, 'Mechanical Issues'),
(4, 'System Error / Malfunction'),
(5, 'External Audit'),
(6, 'Internal Audit');

-- --------------------------------------------------------

--
-- Table structure for table `tb_department`
--

CREATE TABLE `tb_department` (
  `department_id` int(11) NOT NULL,
  `department_name` varchar(50) NOT NULL,
  `department_status` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_department`
--

INSERT INTO `tb_department` (`department_id`, `department_name`, `department_status`) VALUES
(1, 'Accounting', 'Available'),
(2, 'Cashier', 'Available'),
(3, 'Collection', 'Available'),
(4, 'HR/Admin', 'Available'),
(5, 'Membership', 'Available'),
(6, 'Credit', 'Available'),
(7, 'Business Group/Property Custodian/IT', 'Available'),
(8, 'Management', 'Available'),
(9, 'BOD / Officers', 'Available');

-- --------------------------------------------------------

--
-- Table structure for table `tb_escalated`
--

CREATE TABLE `tb_escalated` (
  `escalated_id` int(11) NOT NULL,
  `request_id` int(11) NOT NULL,
  `date_escalated` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tb_rejectaction`
--

CREATE TABLE `tb_rejectaction` (
  `ra_id` int(11) NOT NULL,
  `ca_id` int(11) NOT NULL,
  `closed_by` int(11) NOT NULL,
  `details` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tb_rejected`
--

CREATE TABLE `tb_rejected` (
  `rejected_id` int(11) NOT NULL,
  `ca_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tb_reopen`
--

CREATE TABLE `tb_reopen` (
  `reopen_id` int(11) NOT NULL,
  `request_id` int(11) NOT NULL,
  `date_reopened` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tb_request`
--

CREATE TABLE `tb_request` (
  `request_id` int(11) NOT NULL,
  `request_date` text NOT NULL,
  `department` text NOT NULL,
  `other_department` varchar(100) NOT NULL,
  `requestor` text NOT NULL,
  `other_requestor` varchar(100) NOT NULL,
  `mobile_number` text NOT NULL,
  `requestor_email` text NOT NULL,
  `concern_date_encountered` text NOT NULL,
  `department_responsible` text NOT NULL,
  `other_departmentRes` varchar(100) NOT NULL,
  `concern` text NOT NULL,
  `other_concern` varchar(100) NOT NULL,
  `details` longtext NOT NULL,
  `request_img` varchar(500) NOT NULL,
  `status` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_request`
--

INSERT INTO `tb_request` (`request_id`, `request_date`, `department`, `other_department`, `requestor`, `other_requestor`, `mobile_number`, `requestor_email`, `concern_date_encountered`, `department_responsible`, `other_departmentRes`, `concern`, `other_concern`, `details`, `request_img`, `status`) VALUES
(1, '11/16/2020', '7', '', '14', '', '09668045368', 'teofredo.llido@gmail.com', '11/16/2020', '7', '', '4', '', 'printer not working', '', 'Close'),
(2, '11/17/2020', '0', 'IT STAFF', '0', 'CHRISTINE', '09488032551', 'christinebajao.8894@gmail.com', '11/17/2020', '7', '', '0', 'jhdshfkjhgh', 'sfdgdfshgh', '', 'Open'),
(3, '11/17/2020', '3', '', '1', '', '09432104769', 'jhela_cutie@yahoo.com', '11/17/2020', '7', '', '1', '', 'Laptop unit cannot connect to printer.', '', 'Close'),
(4, '11/19/2020', '3', '', '1', '', '09432104769', 'jhela_cutie@yahoo.com', '11/19/2020', '7', '', '1', '', 'Some incoming emails (specifically from GM is tag as SPAM. This was resolved last time but  now it occurred again.  ', 'SPAM.pdf', 'Close'),
(5, '11/23/2020', '1', '', '0', 'MOLINOS, RAHCEL', '09567125247', 'dimps_molinos@yahoo.com', '11/23/2020', '2', '', '4', '', 'HARDWARE WONT TURN ON', '', 'Open'),
(6, '11/23/2020', '5', '', '18', '', '09229706856', 'dux_fairchildcoop@yahoo.com', '11/23/2020', '5', '', '4', '', 'C:projectscom_acctngacctg.exe is not a valid Win32 application', '', 'Open'),
(7, '11/25/2020', '2', '', '0', 'RACHEL FAYE MOLINOS', '09567125247', 'dimps_molinos@yahoo.com', '11/25/2020', '7', '', '1', '', 'LASER JET PRO MPF WONT WORK. ', '', 'Open'),
(8, '11/25/2020', '2', '', '0', 'RACHEL FAYE MOLINOS', '09567125247', 'dimps_molinos@yahoo.com', '11/25/2020', '7', '', '1', '', 'LASER JET PRO MPF WONT WORK. ', '', 'Open'),
(9, '11/26/2020', '1', '', '8', '', '09063386870', 'ewhiendelyn@gmail.com', '11/22/2020', '1', '', '1', '', 'Microsoft office on the laptop is disabled', '', 'Open'),
(10, '11/27/2020', '2', '', '15', '', '09959302927', 'paeresm@yahoo.com', '11/27/2020', '7', '', '4', '', 'unable to log-in', '', 'Open'),
(11, '12/3/2020', '5', '', '30', '', '09339947331', 'charissefairchildcoop@gmail.com', '12/03/2020', '5', '', '1', '', 'Hello Sir Teo,\r\nPlease see attached.\r\nThank you...', 'error.pdf', 'Open'),
(12, '12/3/2020', '5', '', '30', '', '09339947331', 'charissefairchildcoop@gmail.com', '12/03/2020', '7', '', '4', '', 'Hi Sir Teo,\r\n\r\nPlease see attached.\r\nThank you very much.', 'error.pdf', 'Close'),
(13, '12/3/2020', '0', 'Knowles Branch', '0', 'Nenita Ricafort', '09225706233', '', '12/03/2020', '7', '', '1', '', 'This has been a long standing concerns at Knowles Branch:\r\n1) 1 unit Kiosk at KEP locker room - Hang up problem since Nov 20, 2020\r\n2) All Pcs with NO Anti-Virus', '', 'Open'),
(14, '12/14/2020', '0', 'Knowles Branch', '0', 'Nenita Ricafort', '09225706233', 'nenitamendoza@yahoo.com', '11/01/2020', '7', '', '1', '', 'Ø1 KIOSK – system issue needed for Sir Chinkee – SYBASE Central was deleted (KEP will not allow other personnel aside from COOP) .  \r\n\r\nSuggestion by sir Chinkee :  Pull out the unit and send to Branch Office.  Sir chinkee will fix the problem remotely.', '', 'Open'),
(15, '1/19/2021', '5', '', '30', '', '09339947331', 'Charissefairchildcoop@gmail.com', '01/19/2021', '1', '', '4', '', 'PLEASE  (CANCEL/DELETE)  JV0000238 \r\n\r\nSAVINGS ACCOUNT SET UP FOR NEW MEMBERS &EXISTING( REQUEST DENIED)', 'ERRORS 1&2.pdf', 'Open');

-- --------------------------------------------------------

--
-- Table structure for table `tb_responsible`
--

CREATE TABLE `tb_responsible` (
  `responsible_id` int(11) NOT NULL,
  `request_id` int(11) NOT NULL,
  `staff_id` int(11) NOT NULL,
  `date_accept` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_responsible`
--

INSERT INTO `tb_responsible` (`responsible_id`, `request_id`, `staff_id`, `date_accept`) VALUES
(1, 1, 14, '11/17/2020'),
(2, 3, 14, '11/17/2020'),
(3, 4, 14, '11/19/2020'),
(4, 7, 14, '11/25/2020'),
(5, 8, 14, '11/25/2020'),
(6, 1, 10, '11/26/2020'),
(7, 10, 10, '11/27/2020'),
(8, 10, 14, '12/01/2020'),
(9, 3, 10, '12/03/2020'),
(10, 12, 14, '12/03/2020'),
(11, 13, 14, '12/04/2020'),
(12, 14, 14, '12/14/2020');

-- --------------------------------------------------------

--
-- Table structure for table `tb_staff`
--

CREATE TABLE `tb_staff` (
  `staff_id` int(11) NOT NULL,
  `department_id` int(11) NOT NULL,
  `staff_name` varchar(50) NOT NULL,
  `staff_email` varchar(100) NOT NULL,
  `u_name` varchar(50) NOT NULL,
  `u_pwd` varchar(100) NOT NULL,
  `staff_status` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_staff`
--

INSERT INTO `tb_staff` (`staff_id`, `department_id`, `staff_name`, `staff_email`, `u_name`, `u_pwd`, `staff_status`) VALUES
(1, 3, 'ABASTAS, SALVIE S. (salvie)', 'marysalve.msa@gmail.com', '', '', 'Available'),
(3, 4, 'SOLERA, ANNALIN (ann s.)', 'annalyn.sorela@yahoo.com', '', '', 'Available'),
(4, 3, 'BERMUDEZ, CHARDEY T. (chardey)', 'chardey.bermudez@gmail.com', '', '', 'Available'),
(6, 6, 'BUAGAS, LUSMINDA L. (minda)', 'mlbuagas@yahoo.com', '', '', 'Available'),
(7, 6, 'CABADON, MARIA CLARINA A. (rina)', 'rhinnacabs@gmail.com', '', '', 'Available'),
(8, 1, 'ENERO, WHIENDELYN L. (whien)', 'ewhiendelyn@gmail.com', '', '', 'Available'),
(10, 7, 'Amorganda, Jhunrey (JR)', 'jhunrey22amor@gmail.com', '', '', 'Available'),
(11, 1, 'GASPAN, JEANETH C. (Jeaneth)', 'jeaneth.cataluna@gmail.com\r\n', '', '', 'Available'),
(12, 4, 'GILLE, MICHAEL P. (michael)', 'jeaneth.cataluna@gmail.com\r\n', '', '', 'Available'),
(13, 6, 'GOLOSINO, GLADYS B. (gladys)', 'jeaneth.cataluna@gmail.com\r\n', '', '', 'Available'),
(14, 7, 'LLIDO, TEOFREDO C. Jr. (teo)', 'teofredo.llido@gmail.com', '', '', 'Available'),
(15, 2, 'PAERES, MELISSA A. (mel)', 'paeresm@yahoo.com', '', '', 'Available'),
(17, 5, 'RICAFORT, NENITA M. (nitz)', 'nenitamendoza74@gmail.com\r\n', '', '', 'Available'),
(18, 5, 'SAMOLDE, DEXTER (dux)', 'nenitamendoza74@gmail.com\r\n', '', '', 'Available'),
(19, 4, 'BECERIL, SHEILA (shiela)', 'smbb_1972@yahoo.com', '', '', 'Available'),
(20, 1, 'SUICO, REGINA MARIE E. (reg)', 'reginasuico.fairchildcoop@gmail.com\r\n', '', '', 'Available'),
(21, 3, 'TIROL, ANN JAYSA O. (ann t)', 'reginasuico.fairchildcoop@gmail.com\r\n', '', '', 'Available'),
(22, 7, 'Tad Montayre', 'yoyex21@gmail.com', '', '', 'Available'),
(23, 0, 'Reynaldo Gadionco', 'reygancooop@yahoo.com', '', '', 'Available'),
(24, 1, 'Cecil Pilapil', 'pilapilcecille2619@gmail.com', 'a', 'a', 'Available'),
(25, 3, 'Chardey Bermudez ', 'Chardey Bermudez \r\n', 'a', 'a', 'Available'),
(26, 2, 'Dimple Molinos', 'dimps_molinos@yahoo.com', 'a', 'a', 'Available'),
(27, 4, 'Christian Benolirao ', 'christianbenolirao98@gmail.com', 'a', 'a', 'Available'),
(28, 4, 'Junray Mecares \r\ns', 'junskey86@gmail.com', 'a', 'a', 'Available'),
(29, 4, 'Lauron Syra Lee', 'lauronsyralee1998@gmail.com', 'a', 'a', 'Available'),
(30, 5, 'Charisse E. Menguito \r\ns', 'charissefairchildcoop@gmail.com', 'a', 'a', 'Available'),
(31, 6, 'Glicel Abueva', 'gliniel.06.21.14@gmail.com', 'a', 'a', 'Available'),
(32, 1, 'Sandy Canoneo', 'sandy.canz1993@gmail.com', 'a', 'a', 'Available');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tb_ca`
--
ALTER TABLE `tb_ca`
  ADD PRIMARY KEY (`ca_id`),
  ADD KEY `request_id` (`request_id`);

--
-- Indexes for table `tb_concern`
--
ALTER TABLE `tb_concern`
  ADD PRIMARY KEY (`concern_id`);

--
-- Indexes for table `tb_department`
--
ALTER TABLE `tb_department`
  ADD PRIMARY KEY (`department_id`);

--
-- Indexes for table `tb_escalated`
--
ALTER TABLE `tb_escalated`
  ADD PRIMARY KEY (`escalated_id`);

--
-- Indexes for table `tb_rejectaction`
--
ALTER TABLE `tb_rejectaction`
  ADD PRIMARY KEY (`ra_id`),
  ADD KEY `ca_id` (`ca_id`);

--
-- Indexes for table `tb_rejected`
--
ALTER TABLE `tb_rejected`
  ADD PRIMARY KEY (`rejected_id`),
  ADD KEY `ca_id` (`ca_id`);

--
-- Indexes for table `tb_reopen`
--
ALTER TABLE `tb_reopen`
  ADD PRIMARY KEY (`reopen_id`);

--
-- Indexes for table `tb_request`
--
ALTER TABLE `tb_request`
  ADD PRIMARY KEY (`request_id`);

--
-- Indexes for table `tb_responsible`
--
ALTER TABLE `tb_responsible`
  ADD PRIMARY KEY (`responsible_id`),
  ADD KEY `request_id` (`request_id`),
  ADD KEY `staff_id` (`staff_id`);

--
-- Indexes for table `tb_staff`
--
ALTER TABLE `tb_staff`
  ADD PRIMARY KEY (`staff_id`),
  ADD KEY `department_id` (`department_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tb_ca`
--
ALTER TABLE `tb_ca`
  MODIFY `ca_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `tb_concern`
--
ALTER TABLE `tb_concern`
  MODIFY `concern_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `tb_department`
--
ALTER TABLE `tb_department`
  MODIFY `department_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `tb_escalated`
--
ALTER TABLE `tb_escalated`
  MODIFY `escalated_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tb_rejectaction`
--
ALTER TABLE `tb_rejectaction`
  MODIFY `ra_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tb_rejected`
--
ALTER TABLE `tb_rejected`
  MODIFY `rejected_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tb_reopen`
--
ALTER TABLE `tb_reopen`
  MODIFY `reopen_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tb_request`
--
ALTER TABLE `tb_request`
  MODIFY `request_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `tb_responsible`
--
ALTER TABLE `tb_responsible`
  MODIFY `responsible_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `tb_staff`
--
ALTER TABLE `tb_staff`
  MODIFY `staff_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;
--
-- Database: `db_recall`
--
CREATE DATABASE IF NOT EXISTS `db_recall` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `db_recall`;

-- --------------------------------------------------------

--
-- Table structure for table `tb_document`
--

CREATE TABLE `tb_document` (
  `d_id` int(11) NOT NULL,
  `d_name` varchar(500) NOT NULL,
  `d_details` varchar(10000) NOT NULL,
  `d_expiryDate` varchar(20) NOT NULL,
  `d_renewalDate` varchar(20) NOT NULL,
  `d_instructions` varchar(10000) NOT NULL,
  `d_buget` varchar(20) NOT NULL,
  `r_name` varchar(50) NOT NULL,
  `r_contact` varchar(11) NOT NULL,
  `r_email` varchar(50) NOT NULL,
  `s1_name` varchar(20) NOT NULL,
  `s1_email` varchar(50) NOT NULL,
  `d_status` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_document`
--

INSERT INTO `tb_document` (`d_id`, `d_name`, `d_details`, `d_expiryDate`, `d_renewalDate`, `d_instructions`, `d_buget`, `r_name`, `r_contact`, `r_email`, `s1_name`, `s1_email`, `d_status`) VALUES
(1, 'LCFC BUSINESS PERMIT', 'LCFC BUSINESS PERMIT', '2020-03-12', '2021-19-11', 'GO TO THE ONE STOP SHOP AT CITY HALL AND REQUEST AN APPLICATION FORM FOR BUSINESS PERMIT.', '5000', 'JHUN REY P. AMORGANDA', '09229706684', 'jhunrey22amor@gmail.com', 'JR', 'jhunrey22amor@gmail.com', 'Escalated'),
(2, 'FIRE SAFETY INSPECTION CERTIFICATE', 'MAIN OFFICE FIRE SAFETY INSPECTION CERTIFICATE', '2021-02-10', '2021-05-07', 'PREPARE THE PAPERS NEED AND OTHER REQUIREMENTS.', '3000', 'Jhun Rey Amorganda', '09561551422', 'jhunrey22amor@gmail.com', 'Tad Montayre', 'tad.montayree@gmail.com', 'OK'),
(3, 'PERMIT TO LOCATE', 'MAIN OFFICE PERMIT TO LOCATE', '2021-05-06', '2021-01-03', 'PREPARE ALL NEEDED DOCUMENTS FOR RENEWING P.T.L AND GO TO THE ADMIN OFFICE IN PEZA MAIN OFFICE AND ASK WHAT ARE THE REQUIREMENTS WHEN WE RENEWING PTL OR CONTACT HER THROUGH EMAIL.\r\n\r\nJessica.chiongbian@peza.gov.ph', '2500', 'JHUN REY P. AMORGANDA', '09229706684', 'jhunrey22amor@gmail.com', 'Tad Montayre', 'tad.montayree@gmail.com', 'Escalated'),
(4, 'Business Permit', 'Main office Business Permit', '2020-03-12', '2021-04-01', 'Prepare all documents needed and then go to the ONE STOP SHOP at City Hall and request an Application form for Business Permit.', '25000', 'Jhun Rey P. Amorganda', '09229706684', 'jhunrey22amor@gmail.com', 'Tad Montayre', 'tad.montayree@gmail.com', 'OK'),
(5, 'KNOWLES-BRANCH BUSINESS PERMIT', 'KNOWLES-BRANCH BUSINESS PERMIT', '2020-03-12', '2021-04-01', 'GO TO THE ONE STOP SHOP AT CITY HALL AND REQUEST AN APPLICATION FORM FOR BUSINESS PERMIT.', '2000', 'Jhun Rey P. Amorganda', '09229706684', 'jhunrey22amor@gmail.com', 'JR', 'jhunrey22amor@gmail.com', 'OK'),
(6, 'BUSINESS PERMIT', 'BANKAL PLAZA BUSINESS PERMIT', '2020-12-31', '2021-01-04', 'GO TO THE ONE STOP SHOP AT CITY HALL AND REQUEST AN APPLICATION FORM FOR BUSINESS PERMIT.', '82000', 'Jhun Rey P. Amorganda', '9229706683', 'jhunrey22amor@gmail.com', 'Tad Montayre', 'tad.montayreee@gmail.com', 'Need Action'),
(7, 'SANITARY PERMIT', 'BANKAL PLAZA SANITARY PERMIT', '2020-12-31', '2021-01-04', 'GO TO CITY HEALTH BRING THE FF. PHOTOCOPY: BUSINESS PERMIT, EXPIRED SANITARY PERMIT.', '2500', 'Jhun Rey P. Amorganda', '09229706684', 'jhunrey22amor@gmail.com', 'Tad Montayre', 'tad.montayree@gmail.com', 'Need Action'),
(8, 'FIRE SAFETY INSPECTION CERTIFICATE', 'BANKAL PLAZA FIRE SAFETY INSPECTION CERTIFICATE', '2021-09-25', '2021-06-07', 'PREPARE THE PAPERS NEED AND OTHER REQUIREMENTS.', '3000', 'Jhun Rey P. Amorganda', '09229706684', 'jhunrey22amor@gmail.com', 'Tad Montayre', 'tad.montayree@gmail.com', 'OK'),
(9, 'SMBR CONTRACT', 'SMBR CONTRACT', '2021-08-31', '2021-05-03', 'CALL SIR TATA FROM SMBR', '100', 'Jhun Rey P. Amorganda', '06229706684', 'jhunrey22amor@gmail.com', 'Tad Montayre', 'tad.montayree@gmail.com', 'OK'),
(10, 'ABLE SERVICES', 'ABLE SERVICES', '2022-08-31', '2022-05-03', 'CALL ABLE SERVIVES', '100', 'Jhun Rey P. Amorganda', '09229706684', 'jhunrey22amor@gmail.com', 'Tad Montayre', 'tad.montayree@gmail.com', 'OK');

-- --------------------------------------------------------

--
-- Table structure for table `tb_mailstatus`
--

CREATE TABLE `tb_mailstatus` (
  `ms_id` int(11) NOT NULL,
  `d_id` int(11) NOT NULL,
  `ms_status` longtext NOT NULL,
  `ms_date` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_mailstatus`
--

INSERT INTO `tb_mailstatus` (`ms_id`, `d_id`, `ms_status`, `ms_date`) VALUES
(1, 0, 'Email Sent!', '10-13-2020'),
(2, 3, 'Email Sent!', '10-13-2020'),
(3, 1, 'Escalated Email Sent!', '10-16-2020'),
(4, 1, ' Escalated EmailEmail Sent!', '10-16-2020'),
(5, 1, 'Escalated Email Sent!', '10-16-2020'),
(6, 1, ' Escalated EmailEmail Sent!', '10-16-2020'),
(7, 1, 'Escalated Email Sent!', '11-17-2020'),
(8, 1, 'Escalated Email Sent!', '11-17-2020'),
(9, 1, ' Escalated EmailEmail Sent!', '11-17-2020'),
(10, 1, ' Escalated EmailEmail Sent!', '11-17-2020'),
(11, 1, 'Escalated Email Sent!', '11-17-2020'),
(12, 1, ' Escalated EmailEmail Sent!', '11-17-2020'),
(13, 1, 'Escalated Email Sent!', '11-17-2020'),
(14, 1, ' Escalated EmailEmail Sent!', '11-17-2020'),
(15, 1, 'Escalated Email Sent!', '11-17-2020'),
(16, 1, ' Escalated EmailEmail Sent!', '11-17-2020'),
(17, 1, 'Escalated Email Sent!', '11-17-2020'),
(18, 1, ' Escalated EmailEmail Sent!', '11-17-2020'),
(19, 1, 'Escalated Email Sent!', '11-17-2020'),
(20, 1, ' Escalated EmailEmail Sent!', '11-17-2020'),
(21, 1, 'Escalated Email Sent!', '11-17-2020'),
(22, 1, 'Escalated Email Sent!', '11-17-2020'),
(23, 1, ' Escalated EmailEmail Sent!', '11-17-2020'),
(24, 1, ' Escalated EmailEmail Sent!', '11-17-2020'),
(25, 1, 'Escalated Email Sent!', '11-17-2020'),
(26, 1, ' Escalated EmailEmail Sent!', '11-17-2020'),
(27, 1, 'Escalated Email Sent!', '11-17-2020'),
(28, 1, ' Escalated EmailEmail Sent!', '11-17-2020'),
(29, 1, 'Escalated Email Sent!', '11-17-2020'),
(30, 1, ' Escalated EmailEmail Sent!', '11-17-2020'),
(31, 1, 'Escalated Email Sent!', '11-17-2020'),
(32, 1, ' Escalated EmailEmail Sent!', '11-17-2020'),
(33, 1, 'Escalated Email Sent!', '11-17-2020'),
(34, 1, ' Escalated EmailEmail Sent!', '11-17-2020'),
(35, 1, 'Escalated Email Sent!', '11-17-2020'),
(36, 1, ' Escalated EmailEmail Sent!', '11-17-2020'),
(37, 1, 'Escalated Email Sent!', '11-17-2020'),
(38, 1, ' Escalated EmailEmail Sent!', '11-17-2020'),
(39, 1, 'Escalated Email Sent!', '11-26-2020'),
(40, 1, 'Escalated Email Sent!', '11-26-2020'),
(41, 1, ' Escalated EmailEmail Sent!', '11-26-2020'),
(42, 1, ' Escalated EmailEmail Sent!', '11-26-2020'),
(43, 1, 'Escalated Email Sent!', '11-27-2020'),
(44, 1, ' Escalated EmailEmail Sent!', '11-27-2020'),
(45, 1, 'Escalated Email Sent!', '11-27-2020'),
(46, 1, ' Escalated EmailEmail Sent!', '11-27-2020'),
(47, 1, 'Escalated Email Sent!', '11-28-2020'),
(48, 1, 'Escalated Email Sent!', '11-28-2020'),
(49, 1, ' Escalated EmailEmail Sent!', '11-28-2020'),
(50, 1, ' Escalated EmailEmail Sent!', '11-28-2020'),
(51, 1, 'Escalated Email Sent!', '11-28-2020'),
(52, 1, ' Escalated EmailEmail Sent!', '11-28-2020'),
(53, 1, 'Escalated Email Sent!', '11-29-2020'),
(54, 1, 'Escalated Email Sent!', '11-29-2020'),
(55, 1, ' Escalated EmailEmail Sent!', '11-29-2020'),
(56, 1, ' Escalated EmailEmail Sent!', '11-29-2020'),
(57, 1, 'Escalated Email Sent!', '11-29-2020'),
(58, 1, ' Escalated EmailEmail Sent!', '11-29-2020'),
(59, 1, 'Escalated Email Sent!', '12-01-2020'),
(60, 1, 'Escalated Email Sent!', '12-01-2020'),
(61, 1, ' Escalated EmailEmail Sent!', '12-01-2020'),
(62, 1, ' Escalated EmailEmail Sent!', '12-01-2020'),
(63, 1, 'Escalated Email Sent!', '12-01-2020'),
(64, 1, ' Escalated EmailEmail Sent!', '12-01-2020'),
(65, 1, 'Escalated Email Sent!', '12-02-2020'),
(66, 1, 'Escalated Email Sent!', '12-02-2020'),
(67, 1, ' Escalated EmailEmail Sent!', '12-02-2020'),
(68, 1, ' Escalated EmailEmail Sent!', '12-02-2020'),
(69, 1, 'Escalated Email Sent!', '12-02-2020'),
(70, 1, ' Escalated EmailEmail Sent!', '12-02-2020'),
(71, 1, 'Escalated Email Sent!', '12-03-2020'),
(72, 1, 'Escalated Email Sent!', '12-03-2020'),
(73, 1, ' Escalated EmailEmail Sent!', '12-03-2020'),
(74, 1, ' Escalated EmailEmail Sent!', '12-03-2020'),
(75, 1, 'Escalated Email Sent!', '12-03-2020'),
(76, 1, ' Escalated EmailEmail Sent!', '12-03-2020'),
(77, 1, 'Escalated Email Sent!', '12-04-2020'),
(78, 1, 'Escalated Email Sent!', '12-04-2020'),
(79, 1, ' Escalated EmailEmail Sent!', '12-04-2020'),
(80, 1, ' Escalated EmailEmail Sent!', '12-04-2020'),
(81, 1, 'Escalated Email Sent!', '12-04-2020'),
(82, 1, ' Escalated EmailEmail Sent!', '12-04-2020'),
(83, 1, 'Escalated Email Sent!', '12-05-2020'),
(84, 1, 'Escalated Email Sent!', '12-05-2020'),
(85, 1, ' Escalated EmailEmail Sent!', '12-05-2020'),
(86, 1, ' Escalated EmailEmail Sent!', '12-05-2020'),
(87, 1, 'Escalated Email Sent!', '12-05-2020'),
(88, 1, ' Escalated EmailEmail Sent!', '12-05-2020'),
(89, 1, 'Escalated Email Sent!', '12-06-2020'),
(90, 1, 'Escalated Email Sent!', '12-06-2020'),
(91, 1, ' Escalated EmailEmail Sent!', '12-06-2020'),
(92, 1, ' Escalated EmailEmail Sent!', '12-06-2020'),
(93, 1, 'Escalated Email Sent!', '12-06-2020'),
(94, 1, ' Escalated EmailEmail Sent!', '12-06-2020'),
(95, 1, 'Escalated Email Sent!', '12-07-2020'),
(96, 1, ' Escalated EmailEmail Sent!', '12-07-2020'),
(97, 1, 'Escalated Email Sent!', '12-07-2020'),
(98, 1, 'Escalated Email Sent!', '12-07-2020'),
(99, 1, ' Escalated EmailEmail Sent!', '12-07-2020'),
(100, 1, ' Escalated EmailEmail Sent!', '12-07-2020'),
(101, 1, 'Escalated Email Sent!', '12-07-2020'),
(102, 1, ' Escalated EmailEmail Sent!', '12-07-2020'),
(103, 1, 'Escalated Email Sent!', '12-08-2020'),
(104, 1, 'Escalated Email Sent!', '12-08-2020'),
(105, 1, ' Escalated EmailEmail Sent!', '12-08-2020'),
(106, 1, ' Escalated EmailEmail Sent!', '12-08-2020'),
(107, 1, 'Escalated Email Sent!', '12-08-2020'),
(108, 1, ' Escalated EmailEmail Sent!', '12-08-2020'),
(109, 1, 'Escalated Email Sent!', '12-09-2020'),
(110, 1, 'Escalated Email Sent!', '12-09-2020'),
(111, 1, ' Escalated EmailEmail Sent!', '12-09-2020'),
(112, 1, ' Escalated EmailEmail Sent!', '12-09-2020'),
(113, 1, 'Escalated Email Sent!', '12-09-2020'),
(114, 1, ' Escalated EmailEmail Sent!', '12-09-2020'),
(115, 1, 'Escalated Email Sent!', '12-10-2020'),
(116, 1, 'Escalated Email Sent!', '12-10-2020'),
(117, 1, ' Escalated EmailEmail Sent!', '12-10-2020'),
(118, 1, ' Escalated EmailEmail Sent!', '12-10-2020'),
(119, 1, 'Escalated Email Sent!', '12-10-2020'),
(120, 1, ' Escalated EmailEmail Sent!', '12-10-2020'),
(121, 1, 'Escalated Email Sent!', '12-11-2020'),
(122, 1, 'Escalated Email Sent!', '12-11-2020'),
(123, 1, ' Escalated EmailEmail Sent!', '12-11-2020'),
(124, 1, ' Escalated EmailEmail Sent!', '12-11-2020'),
(125, 1, 'Escalated Email Sent!', '12-11-2020'),
(126, 1, ' Escalated EmailEmail Sent!', '12-11-2020'),
(127, 1, 'Escalated Email Sent!', '12-12-2020'),
(128, 1, 'Escalated Email Sent!', '12-12-2020'),
(129, 1, ' Escalated EmailEmail Sent!', '12-12-2020'),
(130, 1, ' Escalated EmailEmail Sent!', '12-12-2020'),
(131, 1, 'Escalated Email Sent!', '12-12-2020'),
(132, 1, ' Escalated EmailEmail Sent!', '12-12-2020'),
(133, 1, 'Escalated Email Sent!', '12-13-2020'),
(134, 1, 'Escalated Email Sent!', '12-13-2020'),
(135, 1, ' Escalated EmailEmail Sent!', '12-13-2020'),
(136, 1, ' Escalated EmailEmail Sent!', '12-13-2020'),
(137, 1, 'Escalated Email Sent!', '12-13-2020'),
(138, 1, ' Escalated EmailEmail Sent!', '12-13-2020'),
(139, 1, 'Escalated Email Sent!', '12-14-2020'),
(140, 1, 'Escalated Email Sent!', '12-14-2020'),
(141, 1, ' Escalated EmailEmail Sent!', '12-14-2020'),
(142, 1, ' Escalated EmailEmail Sent!', '12-14-2020'),
(143, 1, 'Escalated Email Sent!', '12-14-2020'),
(144, 1, ' Escalated EmailEmail Sent!', '12-14-2020'),
(145, 1, 'Escalated Email Sent!', '12-15-2020'),
(146, 1, 'Escalated Email Sent!', '12-15-2020'),
(147, 1, ' Escalated EmailEmail Sent!', '12-15-2020'),
(148, 1, ' Escalated EmailEmail Sent!', '12-15-2020'),
(149, 1, 'Escalated Email Could not be sent ERROR:SMTP connect() failed. https://github.com/PHPMailer/PHPMailer/wiki/Troubleshooting', '12-15-2020'),
(150, 1, 'Escalated Email Sent!', '12-16-2020'),
(151, 1, 'Escalated Email Sent!', '12-16-2020'),
(152, 1, ' Escalated EmailEmail Sent!', '12-16-2020'),
(153, 1, ' Escalated EmailEmail Sent!', '12-16-2020'),
(154, 1, 'Escalated Email Sent!', '12-16-2020'),
(155, 1, ' Escalated EmailEmail Sent!', '12-16-2020'),
(156, 1, 'Escalated Email Sent!', '12-17-2020'),
(157, 1, 'Escalated Email Sent!', '12-17-2020'),
(158, 1, ' Escalated EmailEmail Sent!', '12-17-2020'),
(159, 1, ' Escalated EmailEmail Sent!', '12-17-2020'),
(160, 1, 'Escalated Email Sent!', '12-17-2020'),
(161, 1, ' Escalated EmailEmail Sent!', '12-17-2020'),
(162, 1, 'Escalated Email Sent!', '12-18-2020'),
(163, 1, 'Escalated Email Sent!', '12-18-2020'),
(164, 1, ' Escalated EmailEmail Sent!', '12-18-2020'),
(165, 1, ' Escalated EmailEmail Sent!', '12-18-2020'),
(166, 1, 'Escalated Email Sent!', '12-18-2020'),
(167, 1, ' Escalated EmailEmail Sent!', '12-18-2020'),
(168, 1, 'Escalated Email Sent!', '12-19-2020'),
(169, 1, 'Escalated Email Sent!', '12-19-2020'),
(170, 1, ' Escalated EmailEmail Sent!', '12-19-2020'),
(171, 1, ' Escalated EmailEmail Sent!', '12-19-2020'),
(172, 3, 'Email Sent!', '12-19-2020'),
(173, 3, 'Email Sent!', '12-19-2020'),
(174, 1, 'Escalated Email Sent!', '12-19-2020'),
(175, 1, ' Escalated EmailEmail Sent!', '12-19-2020'),
(176, 3, 'Email Sent!', '12-19-2020'),
(177, 1, 'Escalated Email Sent!', '12-20-2020'),
(178, 1, 'Escalated Email Sent!', '12-20-2020'),
(179, 1, ' Escalated EmailEmail Sent!', '12-20-2020'),
(180, 1, ' Escalated EmailEmail Sent!', '12-20-2020'),
(181, 3, 'Email Sent!', '12-20-2020'),
(182, 3, 'Email Sent!', '12-20-2020'),
(183, 6, 'Email Sent!', '12-20-2020'),
(184, 6, 'Email Sent!', '12-20-2020'),
(185, 7, 'Email Sent!', '12-20-2020'),
(186, 7, 'Email Sent!', '12-20-2020'),
(187, 1, 'Escalated Email Sent!', '12-20-2020'),
(188, 1, ' Escalated EmailEmail Sent!', '12-20-2020'),
(189, 3, 'Email Sent!', '12-20-2020'),
(190, 6, 'Email Sent!', '12-20-2020'),
(191, 7, 'Email Sent!', '12-20-2020'),
(192, 1, 'Escalated Email Sent!', '12-21-2020'),
(193, 1, 'Escalated Email Sent!', '12-21-2020'),
(194, 1, ' Escalated EmailEmail Sent!', '12-21-2020'),
(195, 1, ' Escalated EmailEmail Sent!', '12-21-2020'),
(196, 3, 'Email Sent!', '12-21-2020'),
(197, 3, 'Email Sent!', '12-21-2020'),
(198, 6, 'Email Sent!', '12-21-2020'),
(199, 6, 'Email Sent!', '12-21-2020'),
(200, 7, 'Email Sent!', '12-21-2020'),
(201, 7, 'Email Sent!', '12-21-2020'),
(202, 1, 'Escalated Email Sent!', '12-21-2020'),
(203, 1, ' Escalated EmailEmail Sent!', '12-21-2020'),
(204, 3, 'Email Sent!', '12-21-2020'),
(205, 6, 'Email Sent!', '12-21-2020'),
(206, 7, 'Email Sent!', '12-21-2020'),
(207, 1, 'Escalated Email Sent!', '12-22-2020'),
(208, 1, 'Escalated Email Sent!', '12-22-2020'),
(209, 1, ' Escalated EmailEmail Sent!', '12-22-2020'),
(210, 1, ' Escalated EmailEmail Sent!', '12-22-2020'),
(211, 3, 'Email Sent!', '12-22-2020'),
(212, 3, 'Email Sent!', '12-22-2020'),
(213, 6, 'Email Sent!', '12-22-2020'),
(214, 6, 'Email Sent!', '12-22-2020'),
(215, 7, 'Email Sent!', '12-22-2020'),
(216, 7, 'Email Sent!', '12-22-2020'),
(217, 1, 'Escalated Email Sent!', '12-22-2020'),
(218, 1, ' Escalated EmailEmail Sent!', '12-22-2020'),
(219, 3, 'Email Sent!', '12-22-2020'),
(220, 6, 'Email Sent!', '12-22-2020'),
(221, 7, 'Email Sent!', '12-22-2020'),
(222, 1, 'Escalated Email Sent!', '01-11-2021'),
(223, 1, ' Escalated EmailEmail Sent!', '01-11-2021'),
(224, 1, 'Escalated Email Sent!', '01-11-2021'),
(225, 1, ' Escalated EmailEmail Sent!', '01-11-2021'),
(226, 1, 'Escalated Email Sent!', '01-12-2021'),
(227, 1, 'Escalated Email Sent!', '01-12-2021'),
(228, 1, ' Escalated EmailEmail Sent!', '01-12-2021'),
(229, 1, ' Escalated EmailEmail Sent!', '01-12-2021'),
(230, 1, 'Escalated Email Sent!', '01-12-2021'),
(231, 1, ' Escalated EmailEmail Sent!', '01-12-2021'),
(232, 1, 'Escalated Email Sent!', '01-13-2021'),
(233, 1, 'Escalated Email Sent!', '01-13-2021'),
(234, 1, ' Escalated EmailEmail Sent!', '01-13-2021'),
(235, 1, ' Escalated EmailEmail Sent!', '01-13-2021'),
(236, 1, 'Escalated Email Sent!', '01-13-2021'),
(237, 1, ' Escalated EmailEmail Sent!', '01-13-2021'),
(238, 1, 'Escalated Email Sent!', '01-14-2021'),
(239, 1, 'Escalated Email Sent!', '01-14-2021'),
(240, 1, ' Escalated EmailEmail Sent!', '01-14-2021'),
(241, 1, ' Escalated EmailEmail Sent!', '01-14-2021'),
(242, 1, 'Escalated Email Sent!', '01-14-2021'),
(243, 1, ' Escalated EmailEmail Sent!', '01-14-2021'),
(244, 1, 'Escalated Email Sent!', '01-15-2021'),
(245, 1, 'Escalated Email Sent!', '01-15-2021'),
(246, 1, ' Escalated EmailEmail Sent!', '01-15-2021'),
(247, 1, ' Escalated EmailEmail Sent!', '01-15-2021'),
(248, 1, 'Escalated Email Sent!', '01-15-2021'),
(249, 1, ' Escalated EmailEmail Sent!', '01-15-2021'),
(250, 1, 'Escalated Email Sent!', '01-16-2021'),
(251, 1, 'Escalated Email Sent!', '01-16-2021'),
(252, 1, ' Escalated EmailEmail Sent!', '01-16-2021'),
(253, 1, ' Escalated EmailEmail Sent!', '01-16-2021'),
(254, 1, 'Escalated Email Sent!', '01-16-2021'),
(255, 1, ' Escalated EmailEmail Sent!', '01-16-2021'),
(256, 1, 'Escalated Email Sent!', '01-17-2021'),
(257, 1, 'Escalated Email Sent!', '01-17-2021'),
(258, 1, ' Escalated EmailEmail Sent!', '01-17-2021'),
(259, 1, ' Escalated EmailEmail Sent!', '01-17-2021'),
(260, 1, 'Escalated Email Sent!', '01-17-2021'),
(261, 1, ' Escalated EmailEmail Sent!', '01-17-2021'),
(262, 1, 'Escalated Email Sent!', '01-18-2021'),
(263, 1, 'Escalated Email Sent!', '01-18-2021'),
(264, 1, ' Escalated EmailEmail Sent!', '01-18-2021'),
(265, 1, ' Escalated EmailEmail Sent!', '01-18-2021'),
(266, 1, 'Escalated Email Sent!', '01-18-2021'),
(267, 1, ' Escalated EmailEmail Sent!', '01-18-2021'),
(268, 1, 'Escalated Email Sent!', '01-19-2021'),
(269, 1, 'Escalated Email Sent!', '01-19-2021'),
(270, 1, ' Escalated EmailEmail Sent!', '01-19-2021'),
(271, 1, ' Escalated EmailEmail Sent!', '01-19-2021'),
(272, 1, 'Escalated Email Sent!', '01-19-2021'),
(273, 1, ' Escalated EmailEmail Sent!', '01-19-2021'),
(274, 1, 'Escalated Email Sent!', '01-20-2021'),
(275, 1, 'Escalated Email Sent!', '01-20-2021'),
(276, 1, ' Escalated EmailEmail Sent!', '01-20-2021'),
(277, 1, ' Escalated EmailEmail Sent!', '01-20-2021'),
(278, 1, 'Escalated Email Sent!', '01-20-2021'),
(279, 1, ' Escalated EmailEmail Sent!', '01-20-2021'),
(280, 1, 'Escalated Email Sent!', '01-21-2021'),
(281, 1, 'Escalated Email Sent!', '01-21-2021'),
(282, 1, ' Escalated EmailEmail Sent!', '01-21-2021'),
(283, 1, ' Escalated EmailEmail Sent!', '01-21-2021'),
(284, 1, 'Escalated Email Sent!', '01-21-2021'),
(285, 1, ' Escalated EmailEmail Sent!', '01-21-2021'),
(286, 1, 'Escalated Email Sent!', '01-22-2021'),
(287, 1, 'Escalated Email Sent!', '01-22-2021'),
(288, 1, ' Escalated EmailEmail Sent!', '01-22-2021'),
(289, 1, ' Escalated EmailEmail Sent!', '01-22-2021'),
(290, 1, 'Escalated Email Sent!', '01-22-2021'),
(291, 1, ' Escalated EmailEmail Sent!', '01-22-2021'),
(292, 1, 'Escalated Email Sent!', '01-23-2021'),
(293, 1, 'Escalated Email Sent!', '01-23-2021'),
(294, 1, ' Escalated EmailEmail Sent!', '01-23-2021'),
(295, 1, ' Escalated EmailEmail Sent!', '01-23-2021'),
(296, 1, 'Escalated Email Sent!', '01-23-2021'),
(297, 1, ' Escalated EmailEmail Sent!', '01-23-2021'),
(298, 1, 'Escalated Email Sent!', '01-24-2021'),
(299, 1, 'Escalated Email Sent!', '01-24-2021'),
(300, 1, ' Escalated EmailEmail Sent!', '01-24-2021'),
(301, 1, ' Escalated EmailEmail Sent!', '01-24-2021'),
(302, 1, 'Escalated Email Sent!', '01-24-2021'),
(303, 1, ' Escalated EmailEmail Sent!', '01-24-2021'),
(304, 1, 'Escalated Email Sent!', '01-25-2021'),
(305, 1, 'Escalated Email Sent!', '01-25-2021'),
(306, 1, ' Escalated EmailEmail Sent!', '01-25-2021'),
(307, 1, ' Escalated EmailEmail Sent!', '01-25-2021'),
(308, 1, 'Escalated Email Sent!', '01-25-2021'),
(309, 1, ' Escalated EmailEmail Sent!', '01-25-2021'),
(310, 1, 'Escalated Email Sent!', '01-26-2021'),
(311, 1, 'Escalated Email Sent!', '01-26-2021'),
(312, 1, ' Escalated EmailEmail Sent!', '01-26-2021'),
(313, 1, ' Escalated EmailEmail Sent!', '01-26-2021'),
(314, 1, 'Escalated Email Sent!', '01-26-2021'),
(315, 1, ' Escalated EmailEmail Sent!', '01-26-2021'),
(316, 1, 'Escalated Email Sent!', '01-27-2021'),
(317, 1, 'Escalated Email Sent!', '01-27-2021'),
(318, 1, ' Escalated EmailEmail Sent!', '01-27-2021'),
(319, 1, ' Escalated EmailEmail Sent!', '01-27-2021'),
(320, 1, 'Escalated Email Sent!', '01-27-2021'),
(321, 1, ' Escalated EmailEmail Sent!', '01-27-2021'),
(322, 1, 'Escalated Email Sent!', '01-28-2021'),
(323, 1, 'Escalated Email Sent!', '01-28-2021'),
(324, 1, ' Escalated EmailEmail Sent!', '01-28-2021'),
(325, 1, ' Escalated EmailEmail Sent!', '01-28-2021'),
(326, 1, 'Escalated Email Sent!', '01-28-2021'),
(327, 1, ' Escalated EmailEmail Sent!', '01-28-2021'),
(328, 1, 'Escalated Email Sent!', '01-29-2021'),
(329, 1, 'Escalated Email Sent!', '01-29-2021'),
(330, 1, ' Escalated EmailEmail Sent!', '01-29-2021'),
(331, 1, ' Escalated EmailEmail Sent!', '01-29-2021'),
(332, 1, 'Escalated Email Sent!', '01-29-2021'),
(333, 1, ' Escalated EmailEmail Sent!', '01-29-2021'),
(334, 1, 'Escalated Email Sent!', '01-30-2021'),
(335, 1, 'Escalated Email Sent!', '01-30-2021'),
(336, 1, ' Escalated EmailEmail Sent!', '01-30-2021'),
(337, 1, ' Escalated EmailEmail Sent!', '01-30-2021'),
(338, 1, 'Escalated Email Sent!', '01-30-2021'),
(339, 1, ' Escalated EmailEmail Sent!', '01-30-2021'),
(340, 1, 'Escalated Email Sent!', '01-31-2021'),
(341, 1, 'Escalated Email Sent!', '01-31-2021'),
(342, 1, ' Escalated EmailEmail Sent!', '01-31-2021'),
(343, 1, ' Escalated EmailEmail Sent!', '01-31-2021'),
(344, 1, 'Escalated Email Sent!', '01-31-2021'),
(345, 1, ' Escalated EmailEmail Sent!', '01-31-2021'),
(346, 1, 'Escalated Email Sent!', '02-01-2021'),
(347, 1, 'Escalated Email Sent!', '02-01-2021'),
(348, 1, ' Escalated EmailEmail Sent!', '02-01-2021'),
(349, 1, ' Escalated EmailEmail Sent!', '02-01-2021'),
(350, 1, 'Escalated Email Sent!', '02-01-2021'),
(351, 1, ' Escalated EmailEmail Sent!', '02-01-2021'),
(352, 1, 'Escalated Email Sent!', '02-02-2021'),
(353, 1, 'Escalated Email Sent!', '02-02-2021'),
(354, 1, ' Escalated EmailEmail Sent!', '02-02-2021'),
(355, 1, ' Escalated EmailEmail Sent!', '02-02-2021'),
(356, 1, 'Escalated Email Sent!', '02-02-2021'),
(357, 1, ' Escalated EmailEmail Sent!', '02-02-2021'),
(358, 1, 'Escalated Email Sent!', '02-03-2021'),
(359, 1, 'Escalated Email Sent!', '02-03-2021'),
(360, 1, ' Escalated EmailEmail Sent!', '02-03-2021'),
(361, 1, ' Escalated EmailEmail Sent!', '02-03-2021'),
(362, 1, 'Escalated Email Sent!', '02-03-2021'),
(363, 1, ' Escalated EmailEmail Sent!', '02-03-2021'),
(364, 1, 'Escalated Email Sent!', '02-04-2021'),
(365, 1, 'Escalated Email Sent!', '02-04-2021'),
(366, 1, ' Escalated EmailEmail Sent!', '02-04-2021'),
(367, 1, ' Escalated EmailEmail Sent!', '02-04-2021'),
(368, 1, 'Escalated Email Sent!', '02-04-2021'),
(369, 1, ' Escalated EmailEmail Sent!', '02-04-2021'),
(370, 1, 'Escalated Email Sent!', '02-05-2021'),
(371, 1, 'Escalated Email Sent!', '02-05-2021'),
(372, 1, ' Escalated EmailEmail Sent!', '02-05-2021'),
(373, 1, ' Escalated EmailEmail Sent!', '02-05-2021'),
(374, 1, 'Escalated Email Sent!', '02-05-2021'),
(375, 1, ' Escalated EmailEmail Sent!', '02-05-2021'),
(376, 1, 'Escalated Email Sent!', '02-06-2021'),
(377, 1, 'Escalated Email Sent!', '02-06-2021'),
(378, 1, ' Escalated EmailEmail Sent!', '02-06-2021'),
(379, 1, ' Escalated EmailEmail Sent!', '02-06-2021'),
(380, 1, 'Escalated Email Sent!', '02-06-2021'),
(381, 1, ' Escalated EmailEmail Sent!', '02-06-2021'),
(382, 1, 'Escalated Email Sent!', '02-07-2021'),
(383, 1, 'Escalated Email Sent!', '02-07-2021'),
(384, 1, ' Escalated EmailEmail Sent!', '02-07-2021'),
(385, 1, ' Escalated EmailEmail Sent!', '02-07-2021'),
(386, 1, 'Escalated Email Sent!', '02-07-2021'),
(387, 1, ' Escalated EmailEmail Sent!', '02-07-2021'),
(388, 1, 'Escalated Email Sent!', '02-08-2021'),
(389, 1, 'Escalated Email Sent!', '02-08-2021'),
(390, 1, ' Escalated EmailEmail Sent!', '02-08-2021'),
(391, 1, ' Escalated EmailEmail Sent!', '02-08-2021'),
(392, 1, 'Escalated Email Sent!', '02-08-2021'),
(393, 1, ' Escalated EmailEmail Sent!', '02-08-2021'),
(394, 1, 'Escalated Email Sent!', '02-09-2021'),
(395, 1, 'Escalated Email Sent!', '02-09-2021'),
(396, 1, ' Escalated EmailEmail Sent!', '02-09-2021'),
(397, 1, ' Escalated EmailEmail Sent!', '02-09-2021'),
(398, 1, 'Escalated Email Sent!', '02-09-2021'),
(399, 1, ' Escalated EmailEmail Sent!', '02-09-2021'),
(400, 1, 'Escalated Email Sent!', '02-10-2021'),
(401, 1, 'Escalated Email Sent!', '02-10-2021'),
(402, 1, ' Escalated EmailEmail Sent!', '02-10-2021'),
(403, 1, ' Escalated EmailEmail Sent!', '02-10-2021'),
(404, 1, 'Escalated Email Sent!', '02-10-2021'),
(405, 1, ' Escalated EmailEmail Sent!', '02-10-2021'),
(406, 1, 'Escalated Email Sent!', '02-11-2021'),
(407, 1, 'Escalated Email Sent!', '02-11-2021'),
(408, 1, ' Escalated EmailEmail Sent!', '02-11-2021'),
(409, 1, ' Escalated EmailEmail Sent!', '02-11-2021'),
(410, 1, 'Escalated Email Sent!', '02-11-2021'),
(411, 1, ' Escalated EmailEmail Sent!', '02-11-2021'),
(412, 1, 'Escalated Email Sent!', '02-12-2021'),
(413, 1, 'Escalated Email Sent!', '02-12-2021'),
(414, 1, ' Escalated EmailEmail Sent!', '02-12-2021'),
(415, 1, ' Escalated EmailEmail Sent!', '02-12-2021'),
(416, 1, 'Escalated Email Sent!', '02-12-2021'),
(417, 1, ' Escalated EmailEmail Sent!', '02-12-2021'),
(418, 1, 'Escalated Email Sent!', '02-13-2021'),
(419, 1, 'Escalated Email Sent!', '02-13-2021'),
(420, 1, ' Escalated EmailEmail Sent!', '02-13-2021'),
(421, 1, ' Escalated EmailEmail Sent!', '02-13-2021'),
(422, 1, 'Escalated Email Sent!', '02-13-2021'),
(423, 1, ' Escalated EmailEmail Sent!', '02-13-2021'),
(424, 1, 'Escalated Email Sent!', '02-14-2021'),
(425, 1, 'Escalated Email Sent!', '02-14-2021'),
(426, 1, ' Escalated EmailEmail Sent!', '02-14-2021'),
(427, 1, ' Escalated EmailEmail Sent!', '02-14-2021'),
(428, 1, 'Escalated Email Sent!', '02-14-2021'),
(429, 1, ' Escalated EmailEmail Sent!', '02-14-2021'),
(430, 1, 'Escalated Email Sent!', '02-15-2021'),
(431, 1, 'Escalated Email Sent!', '02-15-2021'),
(432, 1, ' Escalated EmailEmail Sent!', '02-15-2021'),
(433, 1, ' Escalated EmailEmail Sent!', '02-15-2021'),
(434, 1, 'Escalated Email Sent!', '02-15-2021'),
(435, 1, ' Escalated EmailEmail Sent!', '02-15-2021'),
(436, 1, 'Escalated Email Sent!', '02-16-2021'),
(437, 1, 'Escalated Email Sent!', '02-16-2021'),
(438, 1, ' Escalated EmailEmail Sent!', '02-16-2021'),
(439, 1, ' Escalated EmailEmail Sent!', '02-16-2021'),
(440, 1, 'Escalated Email Sent!', '02-16-2021'),
(441, 1, ' Escalated EmailEmail Sent!', '02-16-2021'),
(442, 1, 'Escalated Email Sent!', '02-17-2021'),
(443, 1, 'Escalated Email Sent!', '02-17-2021'),
(444, 1, ' Escalated EmailEmail Sent!', '02-17-2021'),
(445, 1, ' Escalated EmailEmail Sent!', '02-17-2021'),
(446, 1, 'Escalated Email Sent!', '02-17-2021'),
(447, 1, ' Escalated EmailEmail Sent!', '02-17-2021'),
(448, 1, 'Escalated Email Sent!', '02-18-2021'),
(449, 1, 'Escalated Email Sent!', '02-18-2021'),
(450, 1, ' Escalated EmailEmail Sent!', '02-18-2021'),
(451, 1, ' Escalated EmailEmail Sent!', '02-18-2021'),
(452, 1, 'Escalated Email Sent!', '02-18-2021'),
(453, 1, ' Escalated EmailEmail Sent!', '02-18-2021');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tb_document`
--
ALTER TABLE `tb_document`
  ADD PRIMARY KEY (`d_id`);

--
-- Indexes for table `tb_mailstatus`
--
ALTER TABLE `tb_mailstatus`
  ADD PRIMARY KEY (`ms_id`),
  ADD KEY `d_id` (`d_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tb_document`
--
ALTER TABLE `tb_document`
  MODIFY `d_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `tb_mailstatus`
--
ALTER TABLE `tb_mailstatus`
  MODIFY `ms_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=454;
--
-- Database: `phpmyadmin`
--
CREATE DATABASE IF NOT EXISTS `phpmyadmin` DEFAULT CHARACTER SET utf8 COLLATE utf8_bin;
USE `phpmyadmin`;

-- --------------------------------------------------------

--
-- Table structure for table `pma__bookmark`
--

CREATE TABLE `pma__bookmark` (
  `id` int(10) UNSIGNED NOT NULL,
  `dbase` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `user` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `label` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `query` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Bookmarks';

-- --------------------------------------------------------

--
-- Table structure for table `pma__central_columns`
--

CREATE TABLE `pma__central_columns` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_type` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_length` text COLLATE utf8_bin DEFAULT NULL,
  `col_collation` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_isNull` tinyint(1) NOT NULL,
  `col_extra` varchar(255) COLLATE utf8_bin DEFAULT '',
  `col_default` text COLLATE utf8_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Central list of columns';

-- --------------------------------------------------------

--
-- Table structure for table `pma__column_info`
--

CREATE TABLE `pma__column_info` (
  `id` int(5) UNSIGNED NOT NULL,
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `column_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `comment` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `mimetype` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `transformation` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `transformation_options` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `input_transformation` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `input_transformation_options` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Column information for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__designer_settings`
--

CREATE TABLE `pma__designer_settings` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `settings_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Settings related to Designer';

--
-- Dumping data for table `pma__designer_settings`
--

INSERT INTO `pma__designer_settings` (`username`, `settings_data`) VALUES
('root', '{\"angular_direct\":\"direct\",\"snap_to_grid\":\"off\",\"relation_lines\":\"true\"}');

-- --------------------------------------------------------

--
-- Table structure for table `pma__export_templates`
--

CREATE TABLE `pma__export_templates` (
  `id` int(5) UNSIGNED NOT NULL,
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `export_type` varchar(10) COLLATE utf8_bin NOT NULL,
  `template_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `template_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Saved export templates';

--
-- Dumping data for table `pma__export_templates`
--

INSERT INTO `pma__export_templates` (`id`, `username`, `export_type`, `template_name`, `template_data`) VALUES
(1, 'root', 'database', 'coopsql', '{\"quick_or_custom\":\"quick\",\"what\":\"sql\",\"structure_or_data_forced\":\"0\",\"table_select[]\":[\"fcs_request\",\"fs_access_level\",\"fs_attribute_logger\",\"fs_department\",\"fs_request_approval\",\"fs_request_attachment\",\"fs_request_main\",\"fs_request_task_status\",\"fs_settings\",\"fs_users\",\"fs_user_group\",\"fs_workflow\",\"fs_workstpes\"],\"table_structure[]\":[\"fcs_request\",\"fs_access_level\",\"fs_attribute_logger\",\"fs_department\",\"fs_request_approval\",\"fs_request_attachment\",\"fs_request_main\",\"fs_request_task_status\",\"fs_settings\",\"fs_users\",\"fs_user_group\",\"fs_workflow\",\"fs_workstpes\"],\"table_data[]\":[\"fcs_request\",\"fs_access_level\",\"fs_attribute_logger\",\"fs_department\",\"fs_request_approval\",\"fs_request_attachment\",\"fs_request_main\",\"fs_request_task_status\",\"fs_settings\",\"fs_users\",\"fs_user_group\",\"fs_workflow\",\"fs_workstpes\"],\"aliases_new\":\"\",\"output_format\":\"sendit\",\"filename_template\":\"@DATABASE@\",\"remember_template\":\"on\",\"charset\":\"utf-8\",\"compression\":\"none\",\"maxsize\":\"\",\"codegen_structure_or_data\":\"data\",\"codegen_format\":\"0\",\"csv_separator\":\",\",\"csv_enclosed\":\"\\\"\",\"csv_escaped\":\"\\\"\",\"csv_terminated\":\"AUTO\",\"csv_null\":\"NULL\",\"csv_structure_or_data\":\"data\",\"excel_null\":\"NULL\",\"excel_columns\":\"something\",\"excel_edition\":\"win\",\"excel_structure_or_data\":\"data\",\"json_structure_or_data\":\"data\",\"json_unicode\":\"something\",\"latex_caption\":\"something\",\"latex_structure_or_data\":\"structure_and_data\",\"latex_structure_caption\":\"Structure of table @TABLE@\",\"latex_structure_continued_caption\":\"Structure of table @TABLE@ (continued)\",\"latex_structure_label\":\"tab:@TABLE@-structure\",\"latex_relation\":\"something\",\"latex_comments\":\"something\",\"latex_mime\":\"something\",\"latex_columns\":\"something\",\"latex_data_caption\":\"Content of table @TABLE@\",\"latex_data_continued_caption\":\"Content of table @TABLE@ (continued)\",\"latex_data_label\":\"tab:@TABLE@-data\",\"latex_null\":\"\\\\textit{NULL}\",\"mediawiki_structure_or_data\":\"structure_and_data\",\"mediawiki_caption\":\"something\",\"mediawiki_headers\":\"something\",\"htmlword_structure_or_data\":\"structure_and_data\",\"htmlword_null\":\"NULL\",\"ods_null\":\"NULL\",\"ods_structure_or_data\":\"data\",\"odt_structure_or_data\":\"structure_and_data\",\"odt_relation\":\"something\",\"odt_comments\":\"something\",\"odt_mime\":\"something\",\"odt_columns\":\"something\",\"odt_null\":\"NULL\",\"phparray_structure_or_data\":\"data\",\"sql_include_comments\":\"something\",\"sql_header_comment\":\"\",\"sql_use_transaction\":\"something\",\"sql_compatibility\":\"NONE\",\"sql_structure_or_data\":\"structure_and_data\",\"sql_create_table\":\"\",\"sql_auto_increment\":\"something\",\"sql_create_view\":\"something\",\"sql_procedure_function\":\"something\",\"sql_create_trigger\":\"something\",\"sql_backquotes\":\"something\",\"sql_type\":\"INSERT\",\"sql_insert_syntax\":\"both\",\"sql_max_query_size\":\"50000\",\"sql_hex_for_binary\":\"something\",\"sql_utc_time\":\"something\",\"texytext_structure_or_data\":\"structure_and_data\",\"texytext_null\":\"NULL\",\"xml_structure_or_data\":\"data\",\"xml_export_events\":\"something\",\"xml_export_functions\":\"something\",\"xml_export_procedures\":\"something\",\"xml_export_tables\":\"something\",\"xml_export_triggers\":\"something\",\"xml_export_views\":\"something\",\"xml_export_contents\":\"something\",\"yaml_structure_or_data\":\"data\",\"\":null,\"lock_tables\":null,\"as_separate_files\":null,\"csv_removeCRLF\":null,\"csv_columns\":null,\"excel_removeCRLF\":null,\"json_pretty_print\":null,\"htmlword_columns\":null,\"ods_columns\":null,\"sql_dates\":null,\"sql_relation\":null,\"sql_mime\":null,\"sql_disable_fk\":null,\"sql_views_as_tables\":null,\"sql_metadata\":null,\"sql_create_database\":null,\"sql_drop_table\":null,\"sql_if_not_exists\":null,\"sql_view_current_user\":null,\"sql_or_replace_view\":null,\"sql_truncate\":null,\"sql_delayed\":null,\"sql_ignore\":null,\"texytext_columns\":null}'),
(2, 'root', 'database', 'coop_system', '{\"quick_or_custom\":\"quick\",\"what\":\"sql\",\"structure_or_data_forced\":\"0\",\"table_select[]\":[\"fcs_request\",\"fs_access_level\",\"fs_attribute_logger\",\"fs_department\",\"fs_request_approval\",\"fs_request_attachment\",\"fs_request_main\",\"fs_request_task_status\",\"fs_settings\",\"fs_users\",\"fs_user_group\",\"fs_workflow\",\"fs_workstpes\"],\"table_structure[]\":[\"fcs_request\",\"fs_access_level\",\"fs_attribute_logger\",\"fs_department\",\"fs_request_approval\",\"fs_request_attachment\",\"fs_request_main\",\"fs_request_task_status\",\"fs_settings\",\"fs_users\",\"fs_user_group\",\"fs_workflow\",\"fs_workstpes\"],\"table_data[]\":[\"fcs_request\",\"fs_access_level\",\"fs_attribute_logger\",\"fs_department\",\"fs_request_approval\",\"fs_request_attachment\",\"fs_request_main\",\"fs_request_task_status\",\"fs_settings\",\"fs_users\",\"fs_user_group\",\"fs_workflow\",\"fs_workstpes\"],\"aliases_new\":\"\",\"output_format\":\"sendit\",\"filename_template\":\"@DATABASE@\",\"remember_template\":\"on\",\"charset\":\"utf-8\",\"compression\":\"none\",\"maxsize\":\"\",\"codegen_structure_or_data\":\"data\",\"codegen_format\":\"0\",\"csv_separator\":\",\",\"csv_enclosed\":\"\\\"\",\"csv_escaped\":\"\\\"\",\"csv_terminated\":\"AUTO\",\"csv_null\":\"NULL\",\"csv_structure_or_data\":\"data\",\"excel_null\":\"NULL\",\"excel_columns\":\"something\",\"excel_edition\":\"win\",\"excel_structure_or_data\":\"data\",\"json_structure_or_data\":\"data\",\"json_unicode\":\"something\",\"latex_caption\":\"something\",\"latex_structure_or_data\":\"structure_and_data\",\"latex_structure_caption\":\"Structure of table @TABLE@\",\"latex_structure_continued_caption\":\"Structure of table @TABLE@ (continued)\",\"latex_structure_label\":\"tab:@TABLE@-structure\",\"latex_relation\":\"something\",\"latex_comments\":\"something\",\"latex_mime\":\"something\",\"latex_columns\":\"something\",\"latex_data_caption\":\"Content of table @TABLE@\",\"latex_data_continued_caption\":\"Content of table @TABLE@ (continued)\",\"latex_data_label\":\"tab:@TABLE@-data\",\"latex_null\":\"\\\\textit{NULL}\",\"mediawiki_structure_or_data\":\"structure_and_data\",\"mediawiki_caption\":\"something\",\"mediawiki_headers\":\"something\",\"htmlword_structure_or_data\":\"structure_and_data\",\"htmlword_null\":\"NULL\",\"ods_null\":\"NULL\",\"ods_structure_or_data\":\"data\",\"odt_structure_or_data\":\"structure_and_data\",\"odt_relation\":\"something\",\"odt_comments\":\"something\",\"odt_mime\":\"something\",\"odt_columns\":\"something\",\"odt_null\":\"NULL\",\"phparray_structure_or_data\":\"data\",\"sql_include_comments\":\"something\",\"sql_header_comment\":\"\",\"sql_use_transaction\":\"something\",\"sql_compatibility\":\"NONE\",\"sql_structure_or_data\":\"structure_and_data\",\"sql_create_table\":\"\",\"sql_auto_increment\":\"something\",\"sql_create_view\":\"something\",\"sql_procedure_function\":\"something\",\"sql_create_trigger\":\"something\",\"sql_backquotes\":\"something\",\"sql_type\":\"INSERT\",\"sql_insert_syntax\":\"both\",\"sql_max_query_size\":\"50000\",\"sql_hex_for_binary\":\"something\",\"sql_utc_time\":\"something\",\"texytext_structure_or_data\":\"structure_and_data\",\"texytext_null\":\"NULL\",\"xml_structure_or_data\":\"data\",\"xml_export_events\":\"something\",\"xml_export_functions\":\"something\",\"xml_export_procedures\":\"something\",\"xml_export_tables\":\"something\",\"xml_export_triggers\":\"something\",\"xml_export_views\":\"something\",\"xml_export_contents\":\"something\",\"yaml_structure_or_data\":\"data\",\"\":null,\"lock_tables\":null,\"as_separate_files\":null,\"csv_removeCRLF\":null,\"csv_columns\":null,\"excel_removeCRLF\":null,\"json_pretty_print\":null,\"htmlword_columns\":null,\"ods_columns\":null,\"sql_dates\":null,\"sql_relation\":null,\"sql_mime\":null,\"sql_disable_fk\":null,\"sql_views_as_tables\":null,\"sql_metadata\":null,\"sql_create_database\":null,\"sql_drop_table\":null,\"sql_if_not_exists\":null,\"sql_view_current_user\":null,\"sql_or_replace_view\":null,\"sql_truncate\":null,\"sql_delayed\":null,\"sql_ignore\":null,\"texytext_columns\":null}');

-- --------------------------------------------------------

--
-- Table structure for table `pma__favorite`
--

CREATE TABLE `pma__favorite` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `tables` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Favorite tables';

-- --------------------------------------------------------

--
-- Table structure for table `pma__history`
--

CREATE TABLE `pma__history` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `username` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `db` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `timevalue` timestamp NOT NULL DEFAULT current_timestamp(),
  `sqlquery` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='SQL history for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__navigationhiding`
--

CREATE TABLE `pma__navigationhiding` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `item_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `item_type` varchar(64) COLLATE utf8_bin NOT NULL,
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Hidden items of navigation tree';

-- --------------------------------------------------------

--
-- Table structure for table `pma__pdf_pages`
--

CREATE TABLE `pma__pdf_pages` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `page_nr` int(10) UNSIGNED NOT NULL,
  `page_descr` varchar(50) CHARACTER SET utf8 NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='PDF relation pages for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__recent`
--

CREATE TABLE `pma__recent` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `tables` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Recently accessed tables';

--
-- Dumping data for table `pma__recent`
--

INSERT INTO `pma__recent` (`username`, `tables`) VALUES
('root', '[{\"db\":\"coop_system\",\"table\":\"fs_request_task_approver\"},{\"db\":\"coop_system\",\"table\":\"fs_request_task_status\"},{\"db\":\"coop_system\",\"table\":\"fs_workstpes\"},{\"db\":\"coop_system\",\"table\":\"fs_user_group\"},{\"db\":\"coop_system\",\"table\":\"fs_users\"},{\"db\":\"coop_system\",\"table\":\"fs_settings\"},{\"db\":\"coop_system\",\"table\":\"fs_request_main\"},{\"db\":\"coop_system\",\"table\":\"fs_request_approval\"},{\"db\":\"coop_system\",\"table\":\"fs_workflow\"},{\"db\":\"db_recall\",\"table\":\"tb_document\"}]');

-- --------------------------------------------------------

--
-- Table structure for table `pma__relation`
--

CREATE TABLE `pma__relation` (
  `master_db` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `master_table` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `master_field` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `foreign_db` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `foreign_table` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `foreign_field` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Relation table';

-- --------------------------------------------------------

--
-- Table structure for table `pma__savedsearches`
--

CREATE TABLE `pma__savedsearches` (
  `id` int(5) UNSIGNED NOT NULL,
  `username` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `search_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `search_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Saved searches';

-- --------------------------------------------------------

--
-- Table structure for table `pma__table_coords`
--

CREATE TABLE `pma__table_coords` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `pdf_page_number` int(11) NOT NULL DEFAULT 0,
  `x` float UNSIGNED NOT NULL DEFAULT 0,
  `y` float UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table coordinates for phpMyAdmin PDF output';

-- --------------------------------------------------------

--
-- Table structure for table `pma__table_info`
--

CREATE TABLE `pma__table_info` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `display_field` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table information for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__table_uiprefs`
--

CREATE TABLE `pma__table_uiprefs` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `prefs` text COLLATE utf8_bin NOT NULL,
  `last_update` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Tables'' UI preferences';

-- --------------------------------------------------------

--
-- Table structure for table `pma__tracking`
--

CREATE TABLE `pma__tracking` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `version` int(10) UNSIGNED NOT NULL,
  `date_created` datetime NOT NULL,
  `date_updated` datetime NOT NULL,
  `schema_snapshot` text COLLATE utf8_bin NOT NULL,
  `schema_sql` text COLLATE utf8_bin DEFAULT NULL,
  `data_sql` longtext COLLATE utf8_bin DEFAULT NULL,
  `tracking` set('UPDATE','REPLACE','INSERT','DELETE','TRUNCATE','CREATE DATABASE','ALTER DATABASE','DROP DATABASE','CREATE TABLE','ALTER TABLE','RENAME TABLE','DROP TABLE','CREATE INDEX','DROP INDEX','CREATE VIEW','ALTER VIEW','DROP VIEW') COLLATE utf8_bin DEFAULT NULL,
  `tracking_active` int(1) UNSIGNED NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Database changes tracking for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__userconfig`
--

CREATE TABLE `pma__userconfig` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `timevalue` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `config_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='User preferences storage for phpMyAdmin';

--
-- Dumping data for table `pma__userconfig`
--

INSERT INTO `pma__userconfig` (`username`, `timevalue`, `config_data`) VALUES
('root', '2021-02-20 02:49:50', '{\"Console\\/Mode\":\"collapse\"}');

-- --------------------------------------------------------

--
-- Table structure for table `pma__usergroups`
--

CREATE TABLE `pma__usergroups` (
  `usergroup` varchar(64) COLLATE utf8_bin NOT NULL,
  `tab` varchar(64) COLLATE utf8_bin NOT NULL,
  `allowed` enum('Y','N') COLLATE utf8_bin NOT NULL DEFAULT 'N'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='User groups with configured menu items';

-- --------------------------------------------------------

--
-- Table structure for table `pma__users`
--

CREATE TABLE `pma__users` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `usergroup` varchar(64) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Users and their assignments to user groups';

--
-- Indexes for dumped tables
--

--
-- Indexes for table `pma__bookmark`
--
ALTER TABLE `pma__bookmark`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pma__central_columns`
--
ALTER TABLE `pma__central_columns`
  ADD PRIMARY KEY (`db_name`,`col_name`);

--
-- Indexes for table `pma__column_info`
--
ALTER TABLE `pma__column_info`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `db_name` (`db_name`,`table_name`,`column_name`);

--
-- Indexes for table `pma__designer_settings`
--
ALTER TABLE `pma__designer_settings`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `pma__export_templates`
--
ALTER TABLE `pma__export_templates`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `u_user_type_template` (`username`,`export_type`,`template_name`);

--
-- Indexes for table `pma__favorite`
--
ALTER TABLE `pma__favorite`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `pma__history`
--
ALTER TABLE `pma__history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `username` (`username`,`db`,`table`,`timevalue`);

--
-- Indexes for table `pma__navigationhiding`
--
ALTER TABLE `pma__navigationhiding`
  ADD PRIMARY KEY (`username`,`item_name`,`item_type`,`db_name`,`table_name`);

--
-- Indexes for table `pma__pdf_pages`
--
ALTER TABLE `pma__pdf_pages`
  ADD PRIMARY KEY (`page_nr`),
  ADD KEY `db_name` (`db_name`);

--
-- Indexes for table `pma__recent`
--
ALTER TABLE `pma__recent`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `pma__relation`
--
ALTER TABLE `pma__relation`
  ADD PRIMARY KEY (`master_db`,`master_table`,`master_field`),
  ADD KEY `foreign_field` (`foreign_db`,`foreign_table`);

--
-- Indexes for table `pma__savedsearches`
--
ALTER TABLE `pma__savedsearches`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `u_savedsearches_username_dbname` (`username`,`db_name`,`search_name`);

--
-- Indexes for table `pma__table_coords`
--
ALTER TABLE `pma__table_coords`
  ADD PRIMARY KEY (`db_name`,`table_name`,`pdf_page_number`);

--
-- Indexes for table `pma__table_info`
--
ALTER TABLE `pma__table_info`
  ADD PRIMARY KEY (`db_name`,`table_name`);

--
-- Indexes for table `pma__table_uiprefs`
--
ALTER TABLE `pma__table_uiprefs`
  ADD PRIMARY KEY (`username`,`db_name`,`table_name`);

--
-- Indexes for table `pma__tracking`
--
ALTER TABLE `pma__tracking`
  ADD PRIMARY KEY (`db_name`,`table_name`,`version`);

--
-- Indexes for table `pma__userconfig`
--
ALTER TABLE `pma__userconfig`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `pma__usergroups`
--
ALTER TABLE `pma__usergroups`
  ADD PRIMARY KEY (`usergroup`,`tab`,`allowed`);

--
-- Indexes for table `pma__users`
--
ALTER TABLE `pma__users`
  ADD PRIMARY KEY (`username`,`usergroup`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `pma__bookmark`
--
ALTER TABLE `pma__bookmark`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pma__column_info`
--
ALTER TABLE `pma__column_info`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pma__export_templates`
--
ALTER TABLE `pma__export_templates`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `pma__history`
--
ALTER TABLE `pma__history`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pma__pdf_pages`
--
ALTER TABLE `pma__pdf_pages`
  MODIFY `page_nr` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pma__savedsearches`
--
ALTER TABLE `pma__savedsearches`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- Database: `test`
--
CREATE DATABASE IF NOT EXISTS `test` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `test`;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
