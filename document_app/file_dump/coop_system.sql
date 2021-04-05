-- phpMyAdmin SQL Dump
-- version 5.0.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3308
-- Generation Time: Feb 04, 2021 at 01:43 PM
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
(282, 'fs_request_main', 'UPDATE', '{\"refile_id\":\"FCCMPC-0000028\",\"upload\":\"\"}', 'Hilberth', '::1', 1612185162);

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
(132, 'FCCMPC-0000028', 'SYR85G14OIPHA9L', 'Created', 'Created', 'Hilberth', 'New', '2021-02-01', 1612185139);

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
(22, 'FCCMPC-0000028', 'sdfsdfsdfsfsdfsdfffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffsss.txt', 'Hilberth', 1612185162);

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
(28, '1', 'FCCMPC-0000028', 'rt', 'r', 'SYR85G14OIPHA9L', 'Hilberth', 'New', 1612185139, '2021-02-01');

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
(73, 'SYR85G14OIPHA9L', 'M9RXFWGI31NOQVC', 'FCCMPC-0000028', 5, 'E5KGHJ47DU1A', '', 0, '');

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
(7, 'Ann', '$2y$10$k3hlKmlRjVeZoMgFv.7BbeQjb/p1Jt1JJGSpW8rkSFNamjvGom0Su', 'Ann', 'E.', 'Sorela', 'annalyn.sorela@yahoo.com', '', 'Approver,Implementor,DocAdmin,Administrator', '1', '2021-01-30 08:53:33.000000', '2021-01-14'),
(8, 'Reygan', '$2y$10$FzGBaZdAoQNds5Ku7AyLc.f5YAf2lqurB1HIlQ2jXcEuhokDTJ2X.', 'Reynaldo', 'A.', 'Gandionco', 'reygancoop@yahoo.com', '', 'Approver', '2', '2021-01-30 10:26:59.000000', '2021-01-14'),
(9, 'Nitz', '$2y$10$1Am653XI/IeXEZB3XxfM5Or.KjZ/reayYyjVzh7djabDz3BTEGUQ6', 'Nenita', 'N.', 'Ricaforte', 'hilberth01@yahoo.com', '', 'Approver', '3', '2021-01-15 12:20:35.000000', '2021-01-14'),
(10, 'Dux', '$2y$10$MZpt0Zhk2L9bn2F3AxmcuuVyZ9pBwhb.yKEBOPZy9kWvpuvDzdeH6', 'Dux', 'M. ', 'Samonte', 'hilberth01@yahoo.com', '', 'Implementor', '3', '2021-01-15 12:24:08.000000', '2021-01-14'),
(11, 'Jema', '$2y$10$tkK9kusRfN0TIOfORhOEaODy3W3vjhlU3.uLUWoPtLFdoMwY2/6dO', 'Jema', 'T. ', 'Tibon', 'hilberth01@yahoo.com', '', 'Approver', '4', '0000-00-00 00:00:00.000000', '2021-01-14'),
(12, 'Hilberth', '$2y$10$zEDVnAhhA4sOl4cE3z3Ta.2E0HCMrs2Y4hlYR4zc6f8TTN91c.wqy', 'Hilberth', 'U.', 'Regala', 'hilberth01@yahoo.com', '', 'Approver,Implementor,DocAdmin,Administrator', '5', '2021-02-01 20:36:52.000000', '2021-01-14'),
(13, 'yuya', '$2y$10$kQHfQZVLhVjUycCZhRSBaug5rftbxS8Rn8xRJ4I18Vv8XCs4umN92', 'Philura', 'M.', 'Hipe', 'yujhipe@gmail.com', '', 'Approver,Implementor', '6', '2021-01-30 11:34:21.000000', '2021-01-16'),
(14, 'Christine', '$2y$10$IxOo84iwg4Q5TUhDM3EjkutZQJ4bYgW0sYUndtNB1unEyHx00Ky.e', 'Christine', 'T', 'Bajao', 'christinebajao.8894@gmail.com', '', 'Implementor', '5', '2021-01-30 11:55:05.000000', '2021-01-16'),
(15, 'Sheila', '$2y$10$5JFBQwKjAG0C0P.Roc93p.hiOkiArDnOm2YNFt/Zx/KLbAPVvdb3G', 'Sheila Marie', 'Booc', 'Beceril', 'smbb_@yahoo.com', '', 'Approver,Implementor,DocAdmin,Administrator', '1', '0000-00-00 00:00:00.000000', '2021-01-16'),
(16, 'Whien', '$2y$10$JjaOVVui673igavNyFJaFuyzNnjU.9pgKLjEsNNQgtbDJDPhPuj0.', 'Whiendelyn', 'L.', 'Enero', 'whiendelyn.enero@gmail.com', '', 'Approver', '7', '0000-00-00 00:00:00.000000', '2021-01-16'),
(17, 'Syra', '$2y$10$7Ptwzvfa9cbjDN8g.pqy4uNa9ldjXJTUxkFsgZyihNMoXDqFUe2uW', 'Syra Lee', 'M.', 'Lauron', 'annalyn.sorela@yahoo.com', '', 'Implementor', '1', '0000-00-00 00:00:00.000000', '2021-01-16'),
(18, 'JR', '$2y$10$wsmqZ32p.CSouWQmjc.9Ge0rufw5MDmXNUDPqoZYD02zMBqB3mnB.', 'Jhun Rey', 'P.', 'Amorganda', 'annalyn.sorela@yahoo.com', '', 'Implementor', '5', '0000-00-00 00:00:00.000000', '2021-01-16'),
(19, 'Salvie', '$2y$10$IBEiryxaizH2bjdp1WFfR.v3BvBfErwp70M/OQFYHvrQbdSdO0Pnq', 'Mary Salvie', 'S.', 'Abastas', 'annalyn.sorela@yahoo.com', '', 'Approver', '8', '0000-00-00 00:00:00.000000', '2021-01-16'),
(20, 'Annjy', '$2y$10$.N4yauM2TkoKi9ZopOuGJ.8VZAvyR3NRLyB9btMV8gGP/2kZFxEJ6', 'Ann Jaysa', 'O.', 'Tirol', 'annalyn.sorela@yahoo.com', '', 'Implementor', '8', '0000-00-00 00:00:00.000000', '2021-01-16'),
(21, 'Minda', '$2y$10$pfyMjEnsqIfgWvpTujmkFuOHoa7A5j2vtIY7sEMh5O./YN21QmN0e', 'Lusminda', 'L.', 'Buagas', 'annalyn.sorela@yahoo.com', '', 'Approver', '3', '0000-00-00 00:00:00.000000', '2021-01-16'),
(22, 'Chardey', '$2y$10$Oxv1iHROfc1Ua99kbk9Ox.lYd8CBTVaqc78pYjXTfDT2v65KbMl5i', 'Chardey', 'T.', 'Bermudez', 'annalyn.sorela@yahoo.com', '', 'Implementor', '8', '0000-00-00 00:00:00.000000', '2021-01-16'),
(23, 'Charisse', '$2y$10$Wp2lqz80G.pzC.VghLR0rula1obiQcYbxwdJv.KRlTdYTu2zctUxO', 'Charisse', 'E.', 'Menguito', 'annalyn.sorela@yahoo.com', '', 'Implementor', '9', '0000-00-00 00:00:00.000000', '2021-01-16'),
(24, 'Dimple', '$2y$10$Iqg4jUcHbu6tUmyhtV4vZuxIfY9g7IRo3uEoi39P0exQ7bM9VaEHy', 'Rachelle Faye', 'H.', 'Molinos', 'annalyn.sorela@yahoo.com', '', 'Implementor', '7', '0000-00-00 00:00:00.000000', '2021-01-16'),
(25, 'Sandy', '$2y$10$bnwTNgs390xnFiaCU9Kjluy/b1ioI0I/C9msuwivGREEcCRzj.UIa', 'Sandy', 'F.', 'Canoneo', 'annalyn.sorela@yahoo.com', '', 'Implementor', '7', '0000-00-00 00:00:00.000000', '2021-01-16'),
(26, 'Ailec', '$2y$10$8Foo/S.lOEhFbCbS5qFOhee3epOTLPVwhet7PQbwsHf1.JA.XfZve', 'Glicel Ann', 'A.', 'Abueva', 'annalyn.sorela@yahoo.com', '', 'Implementor', '3', '0000-00-00 00:00:00.000000', '2021-01-16'),
(27, 'Teo', '$2y$10$YYaS7z/PhiqPqv/fTO6PreVPVTyZyK.p5Srr9BlH9WNuce9lE5m4S', 'Teofredo', 'C.', 'Llido Jr.', 'teofredo.llido@gmail.com', '', 'Implementor', '5', '2021-01-30 11:30:46.000000', '2021-01-16'),
(28, 'Jeaneth', '$2y$10$yA77EsBNkkmYJDmAwfhgpeTKUIwYnTR55E4UOb1/z3RsyabC8LLvi', 'Jeaneth', 'C.', 'Gaspan', 'annalyn.sorela@yahoo.com', '', 'Implementor', '7', '0000-00-00 00:00:00.000000', '2021-01-16'),
(29, 'Regina', '$2y$10$rqw7/erfIBQyKmcPulOsPu88H/i4gpkJZD/H6NUUKrc6Mg87775va', 'Regina Marie', 'E.', 'Suico', 'annalyn.sorela@yahoo.com', '', 'Implementor', '7', '0000-00-00 00:00:00.000000', '2021-01-16'),
(30, 'Mel', '$2y$10$LZTgRh74G9/aaH5zPOj5ZeXDsMTmoHHHrM38eB/GuHy8/GeTzTHwy', 'Melissa', 'A.', 'Paeres', 'annalyn.sorela@yahoo.com', '', 'Implementor', '7', '0000-00-00 00:00:00.000000', '2021-01-16'),
(31, 'Gladys', '$2y$10$iFtRaPLaWYvZMbbZcvyMuO9hT5si/YNmM8IDMpk/vskkkiY3cBnYy', 'Gladys', 'B.', 'Golosino', 'annalyn.sorela@yahoo.com', '', 'Implementor', '3', '0000-00-00 00:00:00.000000', '2021-01-16'),
(32, 'Rhina', '$2y$10$.i.lLfXuOgxQdimd/TxcouNsvjaPe.zhM7byd1eZ26.Z6K8PZ7gl6', 'Maria Clarina', 'A.', 'Cabadon', 'annalyn.sorela@yahoo.com', '', 'Implementor', '3', '0000-00-00 00:00:00.000000', '2021-01-16'),
(33, 'Tad', '$2y$10$Sjz0CZX3Mrln9Rg7Kl.Nwet5sgRfzoV5GMaO4U37byxyqr20WFhIS', 'Rudolph', 'C.', 'Montayre', 'annalyn.sorela@yahoo.com', '', 'Approver', '5', '0000-00-00 00:00:00.000000', '2021-01-16'),
(34, 'Michael', '$2y$10$02eIQk3Q7pc6stumO.f2.OIO8qN30ZhUguPaPnQ20WVgWjDH6l9Uu', 'Michael', '.', 'Gille', 'annalyn.sorela@yahoo.com', '', 'Implementor', '7', '0000-00-00 00:00:00.000000', '2021-01-22'),
(35, 'Junray', '$2y$10$thMXq65M9HJNWryNTekHYOVx1O7PAg.nvUbKj3UkINHLTzmf2NBXa', 'Junray', 'G.', 'Mecares', 'annalyn.sorela@yahoo.com', '', 'Implementor', '1', '0000-00-00 00:00:00.000000', '2021-01-22'),
(36, 'Richard', '$2y$10$foGaKKGufEQ9KGfJi0x3guw0MI3o6bmZNPjAavu2uTzrsjfvyqhiO', 'Richard', '.', 'Benolirao', 'annalyn.sorela@yahoo.com', '', 'Implementor', '1', '0000-00-00 00:00:00.000000', '2021-01-22'),
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
(7, 'FK6XL3P1WM2I', 'Department Heads', 'List of all department heads', 'Nitz,Sheila,Whien,Salvie,Minda,Tad'),
(8, 'BSGDR8AYM1U7', 'DCA Approver', 'Doccon Admin Approver', 'Ann'),
(9, '2G4KRSL1W6YI', 'IT Implementers', 'IT', 'Christine,Teo'),
(10, 'E7SZRKNA1VB3', 'Business Dept Implementer', 'Business and IT Dept', 'JR'),
(11, '7OWC53Z02H4L', 'Collection Dept Implementers', 'Collection Dept ', 'Annjy,Chardey'),
(12, 'X4AWYOUFMKSI', 'Knowles Branch Implementers', 'Knowles Branch', ''),
(13, 'NCV3ELWT0J64', 'Marketing & Membership Dept Im', 'Marketing & Membership Dept', 'Dux,Charisse');

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
(1, '9MBKG64J7IOAYCE', 'Loan Approval Workflow', 'OMKZL0Q7YRJ5NXW', 1, 'Nitz', 'series'),
(2, '9MBKG64J7IOAYCE', 'Loan Approval Workflow', 'LWU2GAZ6HR51O0X', 2, NULL, 'series'),
(3, '9MBKG64J7IOAYCE', 'Loan Approval Workflow', 'M9RXFWGI31NOQVC', 3, NULL, 'series'),
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
(16, '0EUZ39FK687SD1Q', 'Direct Staff Workflow', 'IDQSR0BKEPO8CLH', 4, NULL, 'series');

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
  `reject_first` varchar(30) NOT NULL,
  `reject_change` varchar(30) NOT NULL,
  `reject_anchor` varchar(10) NOT NULL,
  `select_group` varchar(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `fs_workstpes`
--

INSERT INTO `fs_workstpes` (`id`, `work_id`, `work_name`, `approver`, `approval_type`, `confirm_type`, `time_window`, `reject_first`, `reject_change`, `reject_anchor`, `select_group`) VALUES
(2, 'LWU2GAZ6HR51O0X', 'General Manager Approval', 'JZ0FV1MS4H9W', 'Parallel', 'Approval', 3, 'NA', 'NA', '', ''),
(3, 'M9RXFWGI31NOQVC', 'Implementers Conformance', 'E5KGHJ47DU1A,SAMWXPZ5N6OY,2G4KRSL1W6YI,E7SZRKNA1VB3,7OWC53Z02H4L', 'Parallel', 'Concurrence', 3, 'NA', 'NA', 'No', 'Yes'),
(4, 'UI94P61QSGXLWCZ', 'Department Head Approval', 'FK6XL3P1WM2I', 'Parallel', 'Approval', 3, 'N/A', 'N/A', '', ''),
(5, 'FOES7XV8I35HYCG', 'DCA Approval', 'BSGDR8AYM1U7', 'Series', 'Approval', 3, 'N/A', 'N/A', 'Yes', ''),
(6, 'IDQSR0BKEPO8CLH', 'BOD  Approval', 'RX9MWFLHUY81', 'Parallel', 'Approval', 3, 'N/A', 'N/A', '', ''),
(7, 'TSX1UQP25VA0Z9J', 'KBOC Approval', 'X4AWYOUFMKSI', 'Parallel', 'Approval', 3, 'N/A', 'N/A', '', '');

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
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=283;

--
-- AUTO_INCREMENT for table `fs_department`
--
ALTER TABLE `fs_department`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `fs_request_approval`
--
ALTER TABLE `fs_request_approval`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=133;

--
-- AUTO_INCREMENT for table `fs_request_attachment`
--
ALTER TABLE `fs_request_attachment`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `fs_request_main`
--
ALTER TABLE `fs_request_main`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `fs_request_task_status`
--
ALTER TABLE `fs_request_task_status`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=76;

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
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `fs_workflow`
--
ALTER TABLE `fs_workflow`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `fs_workstpes`
--
ALTER TABLE `fs_workstpes`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
