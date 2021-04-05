-- phpMyAdmin SQL Dump
-- version 5.0.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3308
-- Generation Time: Apr 05, 2021 at 12:52 PM
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
(421, 'fs_user_group', 'UPDATE', '{\"id\":\"11\",\"edit_gname\":\"Collection Dept Implementers\",\"edit_gdescription\":\"Collection Dept \",\"edit_gmembers\":[\"Chardey\"],\"edit\":\"\"}', 'Ann', '192.168.254.208', 1613789656),
(422, 'fs_user_group', 'UPDATE', '{\"id\":\"4\",\"edit_gname\":\"HR Implementers\",\"edit_gdescription\":\"Implementor\",\"edit_gmembers\":[\"Syra\"],\"edit\":\"\"}', 'Ann', '192.168.254.208', 1613789682),
(423, 'fs_user_group', 'UPDATE', '{\"id\":\"9\",\"edit_gname\":\"IT Implementers\",\"edit_gdescription\":\"IT\",\"edit_gmembers\":[\"Teo\"],\"edit\":\"\"}', 'Ann', '192.168.254.208', 1613789694),
(424, 'fs_user_group', 'UPDATE', '{\"id\":\"1\",\"edit_gname\":\"Loan Department Implementers\",\"edit_gdescription\":\"Loan Department\",\"edit_gmembers\":[\"Gladys\"],\"edit\":\"\"}', 'Ann', '192.168.254.208', 1613789705),
(425, 'fs_user_group', 'UPDATE', '{\"id\":\"13\",\"edit_gname\":\"Marketing & Membership Dept Im\",\"edit_gdescription\":\"Marketing & Membership Dept\",\"edit_gmembers\":[\"Dux\"],\"edit\":\"\"}', 'Ann', '192.168.254.208', 1613789713),
(426, 'fs_user_group', 'INSERT', '{\"gname\":\"Accounting\",\"gdescription\":\"Accounting Implementers\",\"gmembers\":[\"Dimple\"],\"add\":\"\"}', 'Ann', '192.168.254.208', 1613789781),
(427, 'fs_users', 'UPDATE', '{\"id\":\"24\",\"userId\":\"Dimple\",\"firstname\":\"Rachelle Faye\",\"middlename\":\"H.\",\"lastname\":\"Molinos\",\"emailadd\":\"dimps_molinos@yahoo.com\",\"password\":\"12345\",\"accesslevel\":[\"Implementor\"],\"department\":\"7\",\"edit\":\"\"}', 'Ann', '192.168.254.208', 1613790051),
(428, 'fs_users', 'UPDATE', '{\"id\":\"31\",\"userId\":\"Gladys\",\"firstname\":\"Gladys\",\"middlename\":\"B.\",\"lastname\":\"Golosino\",\"emailadd\":\"gladysgolosino1995@gmail.com\",\"password\":\"12345\",\"accesslevel\":[\"Implementor\"],\"department\":\"3\",\"edit\":\"\"}', 'Ann', '192.168.254.208', 1613790136),
(429, 'fs_users', 'UPDATE', '{\"id\":\"10\",\"userId\":\"Dux\",\"firstname\":\"Dux\",\"middlename\":\"M. \",\"lastname\":\"Samonte\",\"emailadd\":\"dux_fairchildcoop@yahoo.com\",\"password\":\"12345\",\"accesslevel\":[\"Implementor\"],\"department\":\"3\",\"edit\":\"\"}', 'Ann', '192.168.254.208', 1613790175),
(430, 'fs_user_group', 'UPDATE', '{\"id\":\"10\",\"edit_gname\":\"Business Dept Implementer\",\"edit_gdescription\":\"Business Implementer\",\"edit_gmembers\":[\"JR\"],\"edit\":\"\"}', 'Ann', '192.168.254.208', 1613790211),
(431, 'fs_user_group', 'UPDATE', '{\"id\":\"9\",\"edit_gname\":\"IT Implementers\",\"edit_gdescription\":\"IT Implementer\",\"edit_gmembers\":[\"Teo\"],\"edit\":\"\"}', 'Ann', '192.168.254.208', 1613790288),
(432, 'fs_workstpes', 'UPDATE', '{\"id\":\"3\",\"edit_description\":\"Implementers Conformance\",\"edit_usergroup\":[\"E5KGHJ47DU1A\",\"SAMWXPZ5N6OY\",\"2G4KRSL1W6YI\",\"E7SZRKNA1VB3\",\"7OWC53Z02H4L\",\"YTUCS5ODF0N8\"],\"edit_approvaltype\":\"Parallel\",\"edit_confirmtype\":\"Concurrence\",\"edit_timewindow\":\"3\",\"edit_rejectfirst\":\"NA\",\"edit_rejectchange\":\"NA\",\"edit_rejectanchor\":\"No\",\"edit_selectgroup\":\"Yes\",\"edit_needed_approval\":\"1\",\"edit\":\"\"}', 'Ann', '192.168.254.208', 1613790482),
(433, 'fs_user_group', 'UPDATE', '{\"id\":\"15\",\"edit_gname\":\"Accounting Implementers\",\"edit_gdescription\":\"Accounting Implementers\",\"edit_gmembers\":[\"Dimple\"],\"edit\":\"\"}', 'Ann', '192.168.254.208', 1613790514),
(434, 'fs_request_main', 'INSERT', '{\"docname\":\"FC-BD-005\",\"docdesp\":\"business\",\"workflow\":\"SYR85G14OIPHA9L\",\"task\":\"Implementers Conformance\",\"task_id\":\"M9RXFWGI31NOQVC\",\"app_group\":[\"E5KGHJ47DU1A\",\"SAMWXPZ5N6OY\",\"2G4KRSL1W6YI\",\"E7SZRKNA1VB3\",\"7OWC53Z02H4L\",\"YTUCS5ODF0N8\"],\"revno\":\"1\",\"add\":\"submit\"}', 'JR', '192.168.254.105', 1613790527),
(435, 'fs_request_main', 'INSERT', '{\"rqid\":\"FCCMPC-0000042\",\"wflow_id\":\"SYR85G14OIPHA9L\",\"step_id\":\"UI94P61QSGXLWCZ\",\"sel_actiond\":\"Approved\",\"remarks\":\"\",\"user_apex\":\"submit\"}', 'Minda', '192.168.254.105', 1613790598),
(436, 'fs_request_main', 'INSERT', '{\"rqid\":\"FCCMPC-0000042\",\"wflow_id\":\"SYR85G14OIPHA9L\",\"step_id\":\"UI94P61QSGXLWCZ\",\"sel_actiond\":\"Approved\",\"remarks\":\"ok\",\"user_apex\":\"submit\"}', 'Sheila', '192.168.250.76', 1613790618),
(437, 'fs_request_main', 'INSERT', '{\"rqid\":\"FCCMPC-0000042\",\"wflow_id\":\"SYR85G14OIPHA9L\",\"step_id\":\"LWU2GAZ6HR51O0X\",\"sel_actiond\":\"Approved\",\"remarks\":\"\",\"user_apex\":\"submit\"}', 'Reygan', '192.168.254.208', 1613790640),
(438, 'fs_request_main', 'INSERT', '{\"rqid\":\"FCCMPC-0000042\",\"wflow_id\":\"SYR85G14OIPHA9L\",\"step_id\":\"FOES7XV8I35HYCG\",\"sel_actiond\":\"Approved\",\"remarks\":\"\",\"user_apex\":\"submit\"}', 'Ann', '192.168.254.208', 1613790691),
(439, 'fs_request_main', 'INSERT', '{\"rqid\":\"FCCMPC-0000042\",\"wflow_id\":\"SYR85G14OIPHA9L\",\"step_id\":\"IDQSR0BKEPO8CLH\",\"sel_actiond\":\"Approved\",\"remarks\":\"ok\",\"user_apex\":\"submit\"}', 'yuya', '192.168.250.76', 1613790818),
(440, 'fs_request_main', 'INSERT', '{\"rqid\":\"FCCMPC-0000042\",\"wflow_id\":\"SYR85G14OIPHA9L\",\"step_id\":\"IDQSR0BKEPO8CLH\",\"sel_actiond\":\"Approved\",\"remarks\":\"\",\"user_apex\":\"submit\"}', 'Jema', '192.168.254.105', 1613790827),
(441, 'fs_workstpes', 'UPDATE', '{\"id\":\"3\",\"edit_description\":\"Implementers Conformance\",\"edit_usergroup\":[\"E5KGHJ47DU1A\",\"SAMWXPZ5N6OY\",\"2G4KRSL1W6YI\",\"E7SZRKNA1VB3\",\"7OWC53Z02H4L\",\"NCV3ELWT0J64\",\"YTUCS5ODF0N8\"],\"edit_approvaltype\":\"Parallel\",\"edit_confirmtype\":\"Concurrence\",\"edit_timewindow\":\"3\",\"edit_rejectfirst\":\"NA\",\"edit_rejectchange\":\"NA\",\"edit_rejectanchor\":\"No\",\"edit_selectgroup\":\"Yes\",\"edit_needed_approval\":\"1\",\"edit\":\"\"}', 'Ann', '192.168.254.208', 1613791038),
(442, 'fs_request_main', 'INSERT', '{\"rqid\":\"FCCMPC-0000042\",\"wflow_id\":\"SYR85G14OIPHA9L\",\"step_id\":\"M9RXFWGI31NOQVC\",\"sel_actiond\":\"Confirmed\",\"user_apex\":\"submit\"}', 'JR', '192.168.254.105', 1613791234),
(443, 'fs_request_main', 'INSERT', '{\"rqid\":\"FCCMPC-0000042\",\"wflow_id\":\"SYR85G14OIPHA9L\",\"step_id\":\"M9RXFWGI31NOQVC\",\"sel_actiond\":\"Confirmed\",\"user_apex\":\"submit\"}', 'Teo', '192.168.254.105', 1613791434),
(444, 'fs_request_main', 'INSERT', '{\"rqid\":\"FCCMPC-0000042\",\"wflow_id\":\"SYR85G14OIPHA9L\",\"step_id\":\"M9RXFWGI31NOQVC\",\"sel_actiond\":\"Confirmed\",\"user_apex\":\"submit\"}', 'Syra', '192.168.254.105', 1613791549),
(445, 'fs_request_main', 'INSERT', '{\"rqid\":\"FCCMPC-0000042\",\"wflow_id\":\"SYR85G14OIPHA9L\",\"step_id\":\"M9RXFWGI31NOQVC\",\"sel_actiond\":\"Confirmed\",\"user_apex\":\"submit\"}', 'Chardey', '192.168.250.76', 1613791611),
(446, 'fs_request_main', 'INSERT', '{\"rqid\":\"FCCMPC-0000030\",\"wflow_id\":\"SYR85G14OIPHA9L\",\"step_id\":\"M9RXFWGI31NOQVC\",\"sel_actiond\":\"Confirmed\",\"user_apex\":\"submit\"}', 'Gladys', '192.168.254.181', 1613791662),
(447, 'fs_workstpes', 'UPDATE', '{\"id\":\"4\",\"edit_description\":\"Department Head Approval\",\"edit_usergroup\":[\"FK6XL3P1WM2I\"],\"edit_approvaltype\":\"Parallel\",\"edit_confirmtype\":\"Approval\",\"edit_timewindow\":\"3\",\"edit_rejectfirst\":\"N/A\",\"edit_rejectchange\":\"N/A\",\"edit_rejectanchor\":\"No\",\"edit_selectgroup\":\"No\",\"edit_needed_approval\":\"6\",\"edit\":\"\"}', 'Ann', '192.168.254.208', 1613792536),
(448, 'fs_workstpes', 'UPDATE', '{\"id\":\"3\",\"edit_description\":\"Implementers Conformance\",\"edit_usergroup\":[\"E5KGHJ47DU1A\",\"SAMWXPZ5N6OY\",\"2G4KRSL1W6YI\",\"E7SZRKNA1VB3\",\"7OWC53Z02H4L\",\"NCV3ELWT0J64\",\"YTUCS5ODF0N8\"],\"edit_approvaltype\":\"Parallel\",\"edit_confirmtype\":\"Concurrence\",\"edit_timewindow\":\"3\",\"edit_rejectfirst\":\"NA\",\"edit_rejectchange\":\"NA\",\"edit_rejectanchor\":\"No\",\"edit_selectgroup\":\"Yes\",\"edit_needed_approval\":\"10\",\"edit\":\"\"}', 'Ann', '192.168.254.208', 1613792653),
(449, 'fs_request_main', 'INSERT', '{\"docname\":\"FC-BD-007\",\"docdesp\":\"business\",\"workflow\":\"SYR85G14OIPHA9L\",\"task\":\"Implementers Conformance\",\"task_id\":\"M9RXFWGI31NOQVC\",\"app_group\":[\"E5KGHJ47DU1A\",\"SAMWXPZ5N6OY\",\"2G4KRSL1W6YI\",\"E7SZRKNA1VB3\",\"7OWC53Z02H4L\",\"NCV3ELWT0J64\",\"YTUCS5ODF0N8\"],\"revno\":\"2\",\"add\":\"submit\"}', 'JR', '192.168.254.105', 1613792712),
(450, 'fs_request_main', 'INSERT', '{\"rqid\":\"FCCMPC-0000043\",\"wflow_id\":\"SYR85G14OIPHA9L\",\"step_id\":\"UI94P61QSGXLWCZ\",\"sel_actiond\":\"Approved\",\"remarks\":\"\",\"user_apex\":\"submit\"}', 'Minda', '192.168.254.105', 1613792824),
(451, 'fs_request_main', 'INSERT', '{\"rqid\":\"FCCMPC-0000043\",\"wflow_id\":\"SYR85G14OIPHA9L\",\"step_id\":\"UI94P61QSGXLWCZ\",\"sel_actiond\":\"Approved\",\"remarks\":\"ok\",\"user_apex\":\"submit\"}', 'Sheila', '192.168.250.76', 1613792856),
(452, 'fs_request_main', 'INSERT', '{\"rqid\":\"FCCMPC-0000043\",\"wflow_id\":\"SYR85G14OIPHA9L\",\"step_id\":\"LWU2GAZ6HR51O0X\",\"sel_actiond\":\"Approved\",\"remarks\":\"\",\"user_apex\":\"submit\"}', 'Reygan', '192.168.254.105', 1613792915),
(453, 'fs_request_main', 'INSERT', '{\"rqid\":\"FCCMPC-0000043\",\"wflow_id\":\"SYR85G14OIPHA9L\",\"step_id\":\"FOES7XV8I35HYCG\",\"sel_actiond\":\"Approved\",\"remarks\":\"\",\"user_apex\":\"submit\"}', 'Ann', '192.168.254.208', 1613792967),
(454, 'fs_request_main', 'INSERT', '{\"rqid\":\"FCCMPC-0000043\",\"wflow_id\":\"SYR85G14OIPHA9L\",\"step_id\":\"IDQSR0BKEPO8CLH\",\"sel_actiond\":\"Approved\",\"remarks\":\"\",\"user_apex\":\"submit\"}', 'Jema', '192.168.254.105', 1613792986),
(455, 'fs_users', 'UPDATE', '{\"id\":\"10\",\"userId\":\"Dux\",\"firstname\":\"Dux\",\"middlename\":\"M. \",\"lastname\":\"Samolde\",\"emailadd\":\"dux_fairchildcoop@yahoo.com\",\"password\":\"$2y$10$O/adN0oaVp2NzuQsssuJsOodt7QOKWFWkJ3YOR3uMuGJOwlMGW5li\",\"accesslevel\":[\"Implementor\"],\"department\":\"3\",\"edit\":\"\"}', 'Ann', '192.168.254.208', 1613793023),
(456, 'fs_request_main', 'INSERT', '{\"rqid\":\"FCCMPC-0000043\",\"wflow_id\":\"SYR85G14OIPHA9L\",\"step_id\":\"IDQSR0BKEPO8CLH\",\"sel_actiond\":\"Approved\",\"remarks\":\"ok\",\"user_apex\":\"submit\"}', 'yuya', '192.168.250.76', 1613793042),
(457, 'fs_request_main', 'INSERT', '{\"rqid\":\"FCCMPC-0000043\",\"wflow_id\":\"SYR85G14OIPHA9L\",\"step_id\":\"M9RXFWGI31NOQVC\",\"sel_actiond\":\"Confirmed\",\"user_apex\":\"submit\"}', 'Syra', '192.168.254.105', 1613793187),
(458, 'fs_request_main', 'INSERT', '{\"rqid\":\"FCCMPC-0000043\",\"wflow_id\":\"SYR85G14OIPHA9L\",\"step_id\":\"M9RXFWGI31NOQVC\",\"sel_actiond\":\"Confirmed\",\"user_apex\":\"submit\"}', 'Chardey', '192.168.250.76', 1613793268),
(459, 'fs_department', 'UPDATE', '{\"id\":\"7\",\"dept_no\":\"Accounting Dept\",\"description\":\"Accounting and Finance Dept\",\"approver\":\"YES\",\"edit\":\"\"}', 'Ann', '192.168.254.208', 1613797866),
(460, 'fs_department', 'UPDATE', '{\"id\":\"5\",\"dept_no\":\"Business Department\",\"description\":\"Business Department\",\"approver\":\"NO\",\"edit\":\"\"}', 'Ann', '192.168.254.208', 1613798031),
(461, 'fs_department', 'INSERT', '{\"dept_no\":\"IT Department\",\"description\":\"IT Department\",\"approver\":\"NO\",\"add\":\"\"}', 'Ann', '192.168.254.208', 1613798070),
(462, 'fs_request_main', 'INSERT', '{\"docname\":\"FC-BD-005\",\"docdesp\":\"business\",\"workflow\":\"ZJVUOB63FMWCS9T\",\"task\":\"Implementers Conformance\",\"task_id\":\"M9RXFWGI31NOQVC\",\"app_group\":[\"SAMWXPZ5N6OY\",\"2G4KRSL1W6YI\"],\"revno\":\"3\",\"add\":\"submit\"}', 'Teo', '192.168.254.105', 1613799580),
(463, 'fs_request_main', 'UPDATE', '{\"id\":\"44\",\"rqid\":\"FCCMPC-0000044\",\"cancel\":\"\"}', 'Teo', '192.168.254.105', 1613799638),
(464, 'fs_workstpes', 'UPDATE', '{\"id\":\"5\",\"edit_description\":\"DCA Approval\",\"edit_usergroup\":[\"BSGDR8AYM1U7\"],\"edit_approvaltype\":\"Series\",\"edit_confirmtype\":\"Approval\",\"edit_timewindow\":\"10\",\"edit_rejectfirst\":\"N/A\",\"edit_rejectchange\":\"N/A\",\"edit_rejectanchor\":\"Yes\",\"edit_selectgroup\":\"Yes\",\"edit_needed_approval\":\"1\",\"edit\":\"\"}', 'Ann', '192.168.254.208', 1613799940),
(465, 'fs_request_main', 'INSERT', '{\"docname\":\"FC-BD-003\",\"revno\":\"1.0\",\"docdesp\":\"Bankal Plaza Operating Guidelines\",\"workflow\":\"SYR85G14OIPHA9L\",\"task\":\"Implementers Conformance\",\"task_id\":\"M9RXFWGI31NOQVC\",\"app_group\":[\"7OWC53Z02H4L\",\"undefined\"],\"add\":\"submit\"}', 'yuya', '192.168.250.76', 1614389205),
(466, 'fs_request_main', 'INSERT', '{\"rqid\":\"FCCMPC-0000045\",\"wflow_id\":\"SYR85G14OIPHA9L\",\"step_id\":\"UI94P61QSGXLWCZ\",\"sel_actiond\":\"Approved\",\"remarks\":\"ok\",\"user_apex\":\"submit\"}', 'Sheila', '192.168.250.76', 1614390534),
(467, 'fs_request_main', 'INSERT', '{\"rqid\":\"FCCMPC-0000045\",\"wflow_id\":\"SYR85G14OIPHA9L\",\"step_id\":\"UI94P61QSGXLWCZ\",\"sel_actiond\":\"Approved\",\"remarks\":\"ok\",\"user_apex\":\"submit\"}', 'Minda', '192.168.254.105', 1614390675),
(468, 'fs_user_group', 'UPDATE', '{\"id\":\"7\",\"edit_gname\":\"Department Heads\",\"edit_gdescription\":\"List of all department heads\",\"edit_gmembers\":[\"Nitz\",\"Sheila\",\"Whien\",\"Salvie\",\"Minda\",\"Tad\"],\"edit\":\"\"}', 'Ann', '192.168.254.105', 1614390847),
(469, 'fs_request_main', 'INSERT', '{\"rqid\":\"FCCMPC-0000045\",\"wflow_id\":\"SYR85G14OIPHA9L\",\"step_id\":\"UI94P61QSGXLWCZ\",\"sel_actiond\":\"Approved\",\"remarks\":\"\",\"user_apex\":\"submit\"}', 'Nitz', '192.168.254.105', 1614391120),
(470, 'fs_request_main', 'INSERT', '{\"rqid\":\"FCCMPC-0000045\",\"wflow_id\":\"SYR85G14OIPHA9L\",\"step_id\":\"UI94P61QSGXLWCZ\",\"sel_actiond\":\"Approved\",\"remarks\":\"\",\"user_apex\":\"submit\"}', 'Tad', '192.168.254.105', 1614391178),
(471, 'fs_request_main', 'INSERT', '{\"rqid\":\"FCCMPC-0000045\",\"wflow_id\":\"SYR85G14OIPHA9L\",\"step_id\":\"UI94P61QSGXLWCZ\",\"sel_actiond\":\"Approved\",\"remarks\":\"OK\",\"user_apex\":\"submit\"}', 'Whien', '192.168.250.76', 1614391196),
(472, 'fs_request_main', 'INSERT', '{\"rqid\":\"FCCMPC-0000045\",\"wflow_id\":\"SYR85G14OIPHA9L\",\"step_id\":\"UI94P61QSGXLWCZ\",\"sel_actiond\":\"Approved\",\"remarks\":\"\",\"user_apex\":\"submit\"}', 'Salvie', '192.168.254.105', 1614391237),
(473, 'fs_request_main', 'INSERT', '{\"rqid\":\"FCCMPC-0000045\",\"wflow_id\":\"SYR85G14OIPHA9L\",\"step_id\":\"LWU2GAZ6HR51O0X\",\"sel_actiond\":\"Approved\",\"remarks\":\"\",\"user_apex\":\"submit\"}', 'Reygan', '192.168.254.105', 1614391304),
(474, 'fs_request_main', 'INSERT', '{\"rqid\":\"FCCMPC-0000045\",\"wflow_id\":\"SYR85G14OIPHA9L\",\"step_id\":\"FOES7XV8I35HYCG\",\"sel_actiond\":\"Approved\",\"remarks\":\"\",\"user_apex\":\"submit\"}', 'Ann', '192.168.254.105', 1614391394),
(475, 'fs_request_main', 'INSERT', '{\"rqid\":\"FCCMPC-0000045\",\"wflow_id\":\"SYR85G14OIPHA9L\",\"step_id\":\"IDQSR0BKEPO8CLH\",\"sel_actiond\":\"Approved\",\"remarks\":\"\",\"user_apex\":\"submit\"}', 'Jema', '192.168.254.105', 1614391801),
(476, 'fs_request_main', 'INSERT', '{\"rqid\":\"FCCMPC-0000045\",\"wflow_id\":\"SYR85G14OIPHA9L\",\"step_id\":\"IDQSR0BKEPO8CLH\",\"sel_actiond\":\"Approved\",\"remarks\":\"Ok\",\"user_apex\":\"submit\"}', 'yuya', '192.168.250.76', 1614391836),
(477, 'fs_request_main', 'INSERT', '{\"rqid\":\"FCCMPC-0000045\",\"wflow_id\":\"SYR85G14OIPHA9L\",\"step_id\":\"M9RXFWGI31NOQVC\",\"sel_actiond\":\"Confirmed\",\"user_apex\":\"submit\"}', 'Chardey', '192.168.254.105', 1614392044),
(478, 'fs_request_main', 'INSERT', '{\"docname\":\"New Loan Policy 2\",\"revno\":\"4\",\"docdesp\":\"\",\"workflow\":\"SYR85G14OIPHA9L\",\"task\":\"Implementers Conformance\",\"task_id\":\"M9RXFWGI31NOQVC\",\"app_group\":[\"E7SZRKNA1VB3\"],\"add\":\"submit\"}', 'Hilberth', '127.0.0.1', 1614392976),
(479, 'fs_user_group', 'UPDATE', '{\"id\":\"9\",\"edit_gname\":\"IT Implementers\",\"edit_gdescription\":\"IT Implementer\",\"edit_gmembers\":[\"Christine\",\"Teo\"],\"edit\":\"\"}', 'Ann', '192.168.254.105', 1614393509),
(480, 'fs_user_group', 'UPDATE', '{\"id\":\"4\",\"edit_gname\":\"HR Dept  Implementers\",\"edit_gdescription\":\"Implementor\",\"edit_gmembers\":[\"Syra\"],\"edit\":\"\"}', 'Ann', '192.168.254.105', 1614396271),
(481, 'fs_user_group', 'UPDATE', '{\"id\":\"15\",\"edit_gname\":\"Accounting Dept Implementers\",\"edit_gdescription\":\"Accounting Implementers\",\"edit_gmembers\":[\"Dimple\"],\"edit\":\"\"}', 'Ann', '192.168.254.105', 1614396286),
(482, 'fs_user_group', 'UPDATE', '{\"id\":\"9\",\"edit_gname\":\"IT Dept Implementers\",\"edit_gdescription\":\"IT Implementer\",\"edit_gmembers\":[\"Christine\",\"Teo\"],\"edit\":\"\"}', 'Ann', '192.168.254.105', 1614396307),
(483, 'fs_user_group', 'UPDATE', '{\"id\":\"15\",\"edit_gname\":\"Accounting/Finance Dept Implementers\",\"edit_gdescription\":\"Accounting Implementers\",\"edit_gmembers\":[\"Dimple\"],\"edit\":\"\"}', 'Ann', '192.168.254.105', 1614396336),
(484, 'fs_user_group', 'UPDATE', '{\"id\":\"13\",\"edit_gname\":\"Marketing & Membership Dept Implementers\",\"edit_gdescription\":\"Marketing & Membership Dept\",\"edit_gmembers\":[\"Dux\"],\"edit\":\"\"}', 'Ann', '192.168.254.105', 1614396358),
(485, 'fs_request_main', 'INSERT', '{\"docname\":\"New Loan Policy\",\"revno\":\"4\",\"docdesp\":\"\",\"workflow\":\"SYR85G14OIPHA9L\",\"task\":\"Implementers Conformance\",\"task_id\":\"M9RXFWGI31NOQVC\",\"app_group\":[\"E7SZRKNA1VB3\"],\"add\":\"submit\"}', 'Hilberth', '127.0.0.1', 1617519544),
(486, 'fs_request_main', 'INSERT', '{\"rqid\":\"FCCMPC-0000047\",\"wflow_id\":\"SYR85G14OIPHA9L\",\"step_id\":\"UI94P61QSGXLWCZ\",\"sel_actiond\":\"Approved\",\"remarks\":\"\",\"user_apex\":\"submit\"}', 'Sheila', '127.0.0.1', 1617519640),
(487, 'fs_users', 'UPDATE', '{\"id\":\"10\",\"userId\":\"Dux\",\"firstname\":\"Dux\",\"middlename\":\"M. \",\"lastname\":\"Samolde\",\"emailadd\":\"dux_fairchildcoop@yahoo.com\",\"password\":\"12345\",\"accesslevel\":[\"Implementor\"],\"department\":\"9\",\"edit\":\"\"}', 'Dux', '192.168.254.208', 1617585394),
(488, 'fs_users', 'UPDATE', '{\"id\":\"13\",\"userId\":\"yuya\",\"firstname\":\"Philura\",\"middlename\":\"M.\",\"lastname\":\"Hipe\",\"emailadd\":\"yujhipe@gmail.com\",\"password\":\"$2y$10$kQHfQZVLhVjUycCZhRSBaug5rftbxS8Rn8xRJ4I18Vv8XCs4umN92\",\"accesslevel\":[\"Approver\",\"Implementor\"],\"department\":\"4\",\"edit\":\"\"}', 'yuya', '192.168.254.208', 1617585533),
(489, 'fs_request_main', 'INSERT', '{\"docname\":\"FC-ORG-33\",\"revno\":\"02\",\"docdesp\":\"COVID-19 POLICY AND GUIDELINES\",\"workflow\":\"SYR85G14OIPHA9L\",\"task\":\"Implementers Conformance\",\"task_id\":\"M9RXFWGI31NOQVC\",\"app_group\":[\"E5KGHJ47DU1A\",\"SAMWXPZ5N6OY\",\"E7SZRKNA1VB3\",\"7OWC53Z02H4L\",\"NCV3ELWT0J64\",\"YTUCS5ODF0N8\",\"undefined\"],\"add\":\"submit\"}', 'Syra', '192.168.254.208', 1617587000),
(490, 'fs_request_main', 'INSERT', '{\"rqid\":\"FCCMPC-0000048\",\"wflow_id\":\"SYR85G14OIPHA9L\",\"step_id\":\"UI94P61QSGXLWCZ\",\"sel_actiond\":\"Approved\",\"remarks\":\"ok\",\"user_apex\":\"submit\"}', 'Sheila', '192.168.250.76', 1617587674),
(491, 'fs_request_main', 'INSERT', '{\"rqid\":\"FCCMPC-0000048\",\"wflow_id\":\"SYR85G14OIPHA9L\",\"step_id\":\"UI94P61QSGXLWCZ\",\"sel_actiond\":\"Approved\",\"remarks\":\"ok\",\"user_apex\":\"submit\"}', 'Whien', '192.168.254.208', 1617588674),
(492, 'fs_request_main', 'INSERT', '{\"rqid\":\"FCCMPC-0000048\",\"wflow_id\":\"SYR85G14OIPHA9L\",\"step_id\":\"UI94P61QSGXLWCZ\",\"sel_actiond\":\"Approved\",\"remarks\":\"ok\",\"user_apex\":\"submit\"}', 'Minda', '192.168.250.76', 1617588774),
(493, 'fs_request_main', 'INSERT', '{\"rqid\":\"FCCMPC-0000048\",\"wflow_id\":\"SYR85G14OIPHA9L\",\"step_id\":\"UI94P61QSGXLWCZ\",\"sel_actiond\":\"Approved\",\"remarks\":\"ok\",\"user_apex\":\"submit\"}', 'Nitz', '192.168.254.208', 1617588784),
(494, 'fs_request_main', 'INSERT', '{\"rqid\":\"FCCMPC-0000048\",\"wflow_id\":\"SYR85G14OIPHA9L\",\"step_id\":\"UI94P61QSGXLWCZ\",\"sel_actiond\":\"Approved\",\"remarks\":\"ok\",\"user_apex\":\"submit\"}', 'Salvie', '192.168.254.208', 1617588829),
(495, 'fs_request_main', 'INSERT', '{\"rqid\":\"FCCMPC-0000048\",\"wflow_id\":\"SYR85G14OIPHA9L\",\"step_id\":\"UI94P61QSGXLWCZ\",\"sel_actiond\":\"Approved\",\"remarks\":\"ok\",\"user_apex\":\"submit\"}', 'Tad', '192.168.254.208', 1617588876),
(496, 'fs_request_main', 'INSERT', '{\"rqid\":\"FCCMPC-0000048\",\"wflow_id\":\"SYR85G14OIPHA9L\",\"step_id\":\"LWU2GAZ6HR51O0X\",\"sel_actiond\":\"Approved\",\"remarks\":\"\",\"user_apex\":\"submit\"}', 'Reygan', '192.168.254.105', 1617589114),
(497, 'fs_request_main', 'INSERT', '{\"docname\":\"FC-BD-008\",\"revno\":\"1\",\"docdesp\":\"business\",\"workflow\":\"SYR85G14OIPHA9L\",\"task\":\"Implementers Conformance\",\"task_id\":\"M9RXFWGI31NOQVC\",\"app_group\":[\"SAMWXPZ5N6OY\"],\"add\":\"submit\"}', 'Teo', '192.168.254.105', 1617589464),
(498, 'fs_request_main', 'INSERT', '{\"rqid\":\"FCCMPC-0000049\",\"wflow_id\":\"SYR85G14OIPHA9L\",\"step_id\":\"UI94P61QSGXLWCZ\",\"sel_actiond\":\"Approved\",\"remarks\":\"\",\"user_apex\":\"submit\"}', 'Salvie', '192.168.254.105', 1617589544),
(499, 'fs_request_main', 'INSERT', '{\"rqid\":\"FCCMPC-0000049\",\"wflow_id\":\"SYR85G14OIPHA9L\",\"step_id\":\"UI94P61QSGXLWCZ\",\"sel_actiond\":\"Approved\",\"remarks\":\"\",\"user_apex\":\"submit\"}', 'Nitz', '192.168.254.105', 1617589585),
(500, 'fs_request_main', 'INSERT', '{\"rqid\":\"FCCMPC-0000049\",\"wflow_id\":\"SYR85G14OIPHA9L\",\"step_id\":\"UI94P61QSGXLWCZ\",\"sel_actiond\":\"Approved\",\"remarks\":\"ok\",\"user_apex\":\"submit\"}', 'Sheila', '192.168.250.76', 1617589622),
(501, 'fs_request_main', 'INSERT', '{\"rqid\":\"FCCMPC-0000049\",\"wflow_id\":\"SYR85G14OIPHA9L\",\"step_id\":\"UI94P61QSGXLWCZ\",\"sel_actiond\":\"Approved\",\"remarks\":\"\",\"user_apex\":\"submit\"}', 'Minda', '192.168.254.105', 1617589634),
(502, 'fs_request_main', 'INSERT', '{\"rqid\":\"FCCMPC-0000049\",\"wflow_id\":\"SYR85G14OIPHA9L\",\"step_id\":\"UI94P61QSGXLWCZ\",\"sel_actiond\":\"Approved\",\"remarks\":\"\",\"user_apex\":\"submit\"}', 'Tad', '192.168.254.105', 1617589673),
(503, 'fs_request_main', 'INSERT', '{\"rqid\":\"FCCMPC-0000049\",\"wflow_id\":\"SYR85G14OIPHA9L\",\"step_id\":\"UI94P61QSGXLWCZ\",\"sel_actiond\":\"Approved\",\"remarks\":\"ok\",\"user_apex\":\"submit\"}', 'Whien', '192.168.250.76', 1617589686),
(504, 'fs_request_main', 'INSERT', '{\"rqid\":\"FCCMPC-0000049\",\"wflow_id\":\"SYR85G14OIPHA9L\",\"step_id\":\"LWU2GAZ6HR51O0X\",\"sel_actiond\":\"Approved\",\"remarks\":\"\",\"user_apex\":\"submit\"}', 'Reygan', '192.168.254.105', 1617589744),
(505, 'fs_users', 'UPDATE', '{\"id\":\"7\",\"userId\":\"Ann\",\"firstname\":\"Ann\",\"middlename\":\"E.\",\"lastname\":\"Sorela\",\"emailadd\":\"annalyn.sorela@yahoo.com\",\"password\":\"$2y$10$k3hlKmlRjVeZoMgFv.7BbeQjb/p1Jt1JJGSpW8rkSFNamjvGom0Su\",\"accesslevel\":[\"Approver\",\"Implementor\",\"DocAdmin\",\"Administrator\"],\"department\":\"1\",\"edit\":\"\"}', 'Ann', '127.0.0.1', 1617591725),
(506, 'fs_request_main', 'INSERT', '{\"rqid\":\"FCCMPC-0000049\",\"wflow_id\":\"SYR85G14OIPHA9L\",\"step_id\":\"FOES7XV8I35HYCG\",\"sel_actiond\":\"Approved\",\"remarks\":\"ok\",\"user_apex\":\"submit\"}', 'Ann', '192.168.254.208', 1617594717),
(507, 'fs_request_main', 'INSERT', '{\"rqid\":\"FCCMPC-0000049\",\"wflow_id\":\"SYR85G14OIPHA9L\",\"step_id\":\"IDQSR0BKEPO8CLH\",\"sel_actiond\":\"Approved\",\"remarks\":\"ok\",\"user_apex\":\"submit\"}', 'yuya', '192.168.250.76', 1617594787),
(508, 'fs_request_main', 'INSERT', '{\"rqid\":\"FCCMPC-0000049\",\"wflow_id\":\"SYR85G14OIPHA9L\",\"step_id\":\"IDQSR0BKEPO8CLH\",\"sel_actiond\":\"Approved\",\"remarks\":\"ok\",\"user_apex\":\"submit\"}', 'Jema', '192.168.254.208', 1617594841),
(509, 'fs_request_main', 'INSERT', '{\"rqid\":\"FCCMPC-0000049\",\"wflow_id\":\"SYR85G14OIPHA9L\",\"step_id\":\"M9RXFWGI31NOQVC\",\"sel_actiond\":\"Confirmed\",\"user_apex\":\"submit\"}', 'Syra', '192.168.254.208', 1617594993),
(510, 'fs_request_main', 'INSERT', '{\"rqid\":\"FCCMPC-0000048\",\"wflow_id\":\"SYR85G14OIPHA9L\",\"step_id\":\"FOES7XV8I35HYCG\",\"sel_actiond\":\"Approved\",\"remarks\":\"ok\",\"user_apex\":\"submit\"}', 'Ann', '192.168.254.208', 1617595041),
(511, 'fs_request_main', 'INSERT', '{\"rqid\":\"FCCMPC-0000048\",\"wflow_id\":\"SYR85G14OIPHA9L\",\"step_id\":\"IDQSR0BKEPO8CLH\",\"sel_actiond\":\"Approved\",\"remarks\":\"ok\",\"user_apex\":\"submit\"}', 'yuya', '192.168.250.76', 1617595302),
(512, 'fs_request_main', 'INSERT', '{\"rqid\":\"FCCMPC-0000048\",\"wflow_id\":\"SYR85G14OIPHA9L\",\"step_id\":\"IDQSR0BKEPO8CLH\",\"sel_actiond\":\"Approved\",\"remarks\":\"ok\",\"user_apex\":\"submit\"}', 'Jema', '192.168.254.208', 1617595308),
(513, 'fs_request_main', 'INSERT', '{\"rqid\":\"FCCMPC-0000048\",\"wflow_id\":\"SYR85G14OIPHA9L\",\"step_id\":\"M9RXFWGI31NOQVC\",\"sel_actiond\":\"Confirmed\",\"user_apex\":\"submit\"}', 'Dux', '192.168.250.76', 1617595432),
(514, 'fs_request_main', 'INSERT', '{\"rqid\":\"FCCMPC-0000048\",\"wflow_id\":\"SYR85G14OIPHA9L\",\"step_id\":\"M9RXFWGI31NOQVC\",\"sel_actiond\":\"Confirmed\",\"user_apex\":\"submit\"}', 'Chardey', '192.168.250.76', 1617595546),
(515, 'fs_request_main', 'INSERT', '{\"docname\":\"FC-ORG-33\",\"revno\":\"03\",\"docdesp\":\"COVID-19 POLICY AND GUIDELINES\",\"workflow\":\"SYR85G14OIPHA9L\",\"task\":\"Implementers Conformance\",\"task_id\":\"M9RXFWGI31NOQVC\",\"app_group\":[\"E5KGHJ47DU1A\",\"SAMWXPZ5N6OY\",\"E7SZRKNA1VB3\",\"7OWC53Z02H4L\",\"NCV3ELWT0J64\",\"YTUCS5ODF0N8\",\"undefined\"],\"add\":\"submit\"}', 'Syra', '192.168.254.208', 1617596409),
(516, 'fs_workstpes', 'UPDATE', '{\"id\":\"5\",\"edit_description\":\"DCA Approval\",\"edit_usergroup\":[\"BSGDR8AYM1U7\"],\"edit_approvaltype\":\"Series\",\"edit_confirmtype\":\"Approval\",\"edit_timewindow\":\"10\",\"edit_rejectfirst\":\"N/A\",\"edit_rejectchange\":\"N/A\",\"edit_rejectanchor\":\"Yes\",\"edit_selectgroup\":\"No\",\"edit_needed_approval\":\"1\",\"edit\":\"\"}', 'Ann', '127.0.0.1', 1617596690),
(517, 'fs_workstpes', 'UPDATE', '{\"id\":\"8\",\"edit_description\":\"Department Head Implementers\",\"edit_usergroup\":[\"FK6XL3P1WM2I\"],\"edit_approvaltype\":\"Parallel\",\"edit_confirmtype\":\"Concurrence\",\"edit_timewindow\":\"3\",\"edit_rejectfirst\":\"N/A\",\"edit_rejectchange\":\"N/A\",\"edit_rejectanchor\":\"No\",\"edit_selectgroup\":\"No\",\"edit_needed_approval\":\"3\",\"edit\":\"\"}', 'Ann', '127.0.0.1', 1617596711),
(518, 'fs_request_main', 'INSERT', '{\"refile_id\":\"FCCMPC-0000050\",\"upload\":\"\"}', 'Syra', '192.168.254.208', 1617596838),
(519, 'fs_request_main', 'INSERT', '{\"rqid\":\"FCCMPC-0000050\",\"wflow_id\":\"SYR85G14OIPHA9L\",\"step_id\":\"UI94P61QSGXLWCZ\",\"sel_actiond\":\"Approved\",\"remarks\":\"\",\"user_apex\":\"submit\"}', 'Minda', '192.168.254.105', 1617597536),
(520, 'fs_request_main', 'INSERT', '{\"docname\":\"FC-BD-007\",\"revno\":\"7\",\"docdesp\":\"Business 007\",\"workflow\":\"SYR85G14OIPHA9L\",\"task\":\"Implementers Conformance\",\"task_id\":\"M9RXFWGI31NOQVC\",\"app_group\":[\"2G4KRSL1W6YI\"],\"add\":\"submit\"}', 'Teo', '192.168.254.105', 1617597662),
(521, 'fs_request_main', 'INSERT', '{\"rqid\":\"FCCMPC-0000050\",\"wflow_id\":\"SYR85G14OIPHA9L\",\"step_id\":\"UI94P61QSGXLWCZ\",\"sel_actiond\":\"Disapproved\",\"remarks\":\"correct statement in sec 5.3\",\"user_apex\":\"submit\"}', 'Whien', '192.168.250.76', 1617597680),
(522, 'fs_request_main', 'UPDATE', '{\"id\":\"50\",\"edit_docname\":\"FC-ORG-33\",\"edit_docdesp\":\"COVID-19 POLICY AND GUIDELINES\",\"edit_revno\":\"03\",\"edit\":\"\"}', 'Syra', '127.0.0.1', 1617597771),
(523, 'fs_request_main', 'INSERT', '{\"rqid\":\"FCCMPC-0000050\",\"wflow_id\":\"SYR85G14OIPHA9L\",\"step_id\":\"UI94P61QSGXLWCZ\",\"sel_actiond\":\"Approved\",\"remarks\":\"ok\",\"user_apex\":\"submit\"}', 'Salvie', '192.168.254.208', 1617597780),
(524, 'fs_request_main', 'INSERT', '{\"docname\":\"FC-BD-007\",\"revno\":\"7\",\"docdesp\":\"business_07\",\"workflow\":\"SYR85G14OIPHA9L\",\"task\":\"Implementers Conformance\",\"task_id\":\"M9RXFWGI31NOQVC\",\"app_group\":[\"2G4KRSL1W6YI\"],\"add\":\"submit\"}', 'Teo', '192.168.254.105', 1617597785),
(525, 'fs_request_main', 'INSERT', '{\"rqid\":\"FCCMPC-0000050\",\"wflow_id\":\"SYR85G14OIPHA9L\",\"step_id\":\"UI94P61QSGXLWCZ\",\"sel_actiond\":\"Approved\",\"remarks\":\"ok\",\"user_apex\":\"submit\"}', 'Sheila', '192.168.250.76', 1617597824),
(526, 'fs_request_main', 'INSERT', '{\"rqid\":\"FCCMPC-0000050\",\"wflow_id\":\"SYR85G14OIPHA9L\",\"step_id\":\"UI94P61QSGXLWCZ\",\"sel_actiond\":\"Approved\",\"remarks\":\"ok\",\"user_apex\":\"submit\"}', 'Tad', '192.168.250.76', 1617597907),
(527, 'fs_request_main', 'INSERT', '{\"docname\":\"New Loan Policy 2\",\"revno\":\"4\",\"docdesp\":\"\",\"workflow\":\"SYR85G14OIPHA9L\",\"task\":\"Implementers Conformance\",\"task_id\":\"M9RXFWGI31NOQVC\",\"app_group\":[\"E7SZRKNA1VB3\"],\"add\":\"submit\"}', 'Syra', '127.0.0.1', 1617597936),
(528, 'fs_request_main', 'INSERT', '{\"rqid\":\"FCCMPC-0000050\",\"wflow_id\":\"SYR85G14OIPHA9L\",\"step_id\":\"UI94P61QSGXLWCZ\",\"sel_actiond\":\"Disapproved\",\"remarks\":\"not ok\",\"user_apex\":\"submit\"}', 'Nitz', '192.168.254.208', 1617597952),
(529, 'fs_request_main', 'UPDATE', '{\"id\":\"52\",\"edit_docname\":\"FC-BD-007\",\"edit_docdesp\":\"business_007\",\"edit_revno\":\"7\",\"edit\":\"\"}', 'Teo', '192.168.254.105', 1617598068),
(530, 'fs_request_main', '', '{\"refile_id\":\"FCCMPC-0000050\",\"upload\":\"\"}', 'Syra', '192.168.254.208', 1617598311),
(531, 'fs_request_main', 'INSERT', '{\"docname\":\"New Loan Policy 2\",\"revno\":\"12\",\"docdesp\":\"\",\"workflow\":\"SYR85G14OIPHA9L\",\"task\":\"Implementers Conformance\",\"task_id\":\"M9RXFWGI31NOQVC\",\"app_group\":[\"2G4KRSL1W6YI\"],\"add\":\"submit\"}', 'Syra', '127.0.0.1', 1617598411),
(532, 'fs_request_main', 'UPDATE', '{\"rqid\":\"FCCMPC-0000050\",\"wrkflow_id\":\"SYR85G14OIPHA9L\",\"resubmit\":\"submit\"}', 'Syra', '192.168.254.208', 1617598594),
(533, 'fs_request_main', 'INSERT', '{\"docname\":\"New Loan Policy 2\",\"revno\":\"4\",\"docdesp\":\"\",\"workflow\":\"SYR85G14OIPHA9L\",\"task\":\"Implementers Conformance\",\"task_id\":\"M9RXFWGI31NOQVC\",\"app_group\":[\"2G4KRSL1W6YI\"],\"add\":\"submit\"}', 'Syra', '127.0.0.1', 1617598794),
(534, 'fs_request_main', 'UPDATE', '{\"id\":\"55\",\"rqid\":\"FCCMPC-0000055\",\"cancel\":\"\"}', 'Syra', '127.0.0.1', 1617598809),
(535, 'fs_request_main', 'INSERT', '{\"rqid\":\"FCCMPC-0000050\",\"wflow_id\":\"SYR85G14OIPHA9L\",\"step_id\":\"UI94P61QSGXLWCZ\",\"sel_actiond\":\"Approved\",\"remarks\":\"ok\",\"user_apex\":\"submit\"}', 'Minda', '192.168.254.208', 1617598904),
(536, 'fs_request_main', 'INSERT', '{\"rqid\":\"FCCMPC-0000050\",\"wflow_id\":\"SYR85G14OIPHA9L\",\"step_id\":\"UI94P61QSGXLWCZ\",\"sel_actiond\":\"Approved\",\"remarks\":\"corrected\",\"user_apex\":\"submit\"}', 'Sheila', '192.168.250.76', 1617598963),
(537, 'fs_request_main', 'INSERT', '{\"rqid\":\"FCCMPC-0000050\",\"wflow_id\":\"SYR85G14OIPHA9L\",\"step_id\":\"UI94P61QSGXLWCZ\",\"sel_actiond\":\"Approved\",\"remarks\":\"ok\",\"user_apex\":\"submit\"}', 'Sheila', '192.168.254.208', 1617598966),
(538, 'fs_request_main', 'UPDATE', '{\"id\":\"52\",\"rqid\":\"FCCMPC-0000052\",\"cancel\":\"\"}', 'Teo', '192.168.254.105', 1617598976),
(539, 'fs_request_main', 'UPDATE', '{\"id\":\"51\",\"rqid\":\"FCCMPC-0000051\",\"cancel\":\"\"}', 'Teo', '192.168.254.105', 1617598988),
(540, 'fs_request_main', 'INSERT', '{\"rqid\":\"FCCMPC-0000050\",\"wflow_id\":\"SYR85G14OIPHA9L\",\"step_id\":\"UI94P61QSGXLWCZ\",\"sel_actiond\":\"Approved\",\"remarks\":\"\",\"user_apex\":\"submit\"}', 'Salvie', '192.168.254.105', 1617599116),
(541, 'fs_request_main', 'INSERT', '{\"rqid\":\"FCCMPC-0000050\",\"wflow_id\":\"SYR85G14OIPHA9L\",\"step_id\":\"UI94P61QSGXLWCZ\",\"sel_actiond\":\"Approved\",\"remarks\":\"\",\"user_apex\":\"submit\"}', 'Nitz', '192.168.254.105', 1617599174),
(542, 'fs_request_main', 'INSERT', '{\"rqid\":\"FCCMPC-0000050\",\"wflow_id\":\"SYR85G14OIPHA9L\",\"step_id\":\"UI94P61QSGXLWCZ\",\"sel_actiond\":\"Approved\",\"remarks\":\"\",\"user_apex\":\"submit\"}', 'Tad', '192.168.254.105', 1617599235),
(543, 'fs_request_main', 'INSERT', '{\"rqid\":\"FCCMPC-0000050\",\"wflow_id\":\"SYR85G14OIPHA9L\",\"step_id\":\"UI94P61QSGXLWCZ\",\"sel_actiond\":\"Approved\",\"remarks\":\"\",\"user_apex\":\"submit\"}', 'Whien', '192.168.254.105', 1617599287),
(544, 'fs_request_main', 'INSERT', '{\"rqid\":\"FCCMPC-0000050\",\"wflow_id\":\"SYR85G14OIPHA9L\",\"step_id\":\"LWU2GAZ6HR51O0X\",\"sel_actiond\":\"Approved\",\"remarks\":\"\",\"user_apex\":\"submit\"}', 'Reygan', '192.168.254.105', 1617599367),
(545, 'fs_request_main', 'INSERT', '{\"docname\":\"FC-BD-008\",\"revno\":\"08\",\"docdesp\":\"business_07\",\"workflow\":\"SYR85G14OIPHA9L\",\"task\":\"Implementers Conformance\",\"task_id\":\"M9RXFWGI31NOQVC\",\"app_group\":[\"E5KGHJ47DU1A\",\"SAMWXPZ5N6OY\",\"2G4KRSL1W6YI\",\"E7SZRKNA1VB3\",\"7OWC53Z02H4L\",\"NCV3ELWT0J64\",\"YTUCS5ODF0N8\"],\"add\":\"submit\"}', 'Teo', '192.168.254.105', 1617599935),
(546, 'fs_request_main', 'INSERT', '{\"refile_id\":\"FCCMPC-0000056\",\"upload\":\"\"}', 'Teo', '192.168.254.105', 1617599952),
(547, 'fs_request_main', 'INSERT', '{\"docname\":\"FC-BD-009\",\"revno\":\"009\",\"docdesp\":\"business_012\",\"workflow\":\"SYR85G14OIPHA9L\",\"task\":\"Implementers Conformance\",\"task_id\":\"M9RXFWGI31NOQVC\",\"app_group\":[\"E5KGHJ47DU1A\",\"SAMWXPZ5N6OY\",\"2G4KRSL1W6YI\",\"E7SZRKNA1VB3\",\"7OWC53Z02H4L\",\"NCV3ELWT0J64\",\"YTUCS5ODF0N8\"],\"add\":\"submit\"}', 'Teo', '192.168.254.105', 1617600676),
(548, 'fs_request_main', 'INSERT', '{\"rqid\":\"FCCMPC-0000056\",\"wflow_id\":\"SYR85G14OIPHA9L\",\"step_id\":\"UI94P61QSGXLWCZ\",\"sel_actiond\":\"Approved\",\"remarks\":\"OK\",\"user_apex\":\"submit\"}', 'Minda', '192.168.250.76', 1617600703),
(549, 'fs_request_main', 'INSERT', '{\"rqid\":\"FCCMPC-0000056\",\"wflow_id\":\"SYR85G14OIPHA9L\",\"step_id\":\"UI94P61QSGXLWCZ\",\"sel_actiond\":\"Approved\",\"remarks\":\"ok\",\"user_apex\":\"submit\"}', 'Sheila', '192.168.254.208', 1617600729),
(550, 'fs_request_main', 'INSERT', '{\"rqid\":\"FCCMPC-0000056\",\"wflow_id\":\"SYR85G14OIPHA9L\",\"step_id\":\"UI94P61QSGXLWCZ\",\"sel_actiond\":\"Approved\",\"remarks\":\"\",\"user_apex\":\"submit\"}', 'Nitz', '192.168.254.105', 1617600764),
(551, 'fs_request_main', 'INSERT', '{\"rqid\":\"FCCMPC-0000056\",\"wflow_id\":\"SYR85G14OIPHA9L\",\"step_id\":\"UI94P61QSGXLWCZ\",\"sel_actiond\":\"Approved\",\"remarks\":\"OK\",\"user_apex\":\"submit\"}', 'Whien', '192.168.250.76', 1617600793),
(552, 'fs_request_main', 'INSERT', '{\"rqid\":\"FCCMPC-0000056\",\"wflow_id\":\"SYR85G14OIPHA9L\",\"step_id\":\"UI94P61QSGXLWCZ\",\"sel_actiond\":\"Approved\",\"remarks\":\"ok\",\"user_apex\":\"submit\"}', 'Salvie', '192.168.254.208', 1617600805),
(553, 'fs_request_main', 'INSERT', '{\"rqid\":\"FCCMPC-0000056\",\"wflow_id\":\"SYR85G14OIPHA9L\",\"step_id\":\"UI94P61QSGXLWCZ\",\"sel_actiond\":\"Approved\",\"remarks\":\"\",\"user_apex\":\"submit\"}', 'Tad', '192.168.254.105', 1617600819),
(554, 'fs_request_main', 'INSERT', '{\"rqid\":\"FCCMPC-0000056\",\"wflow_id\":\"SYR85G14OIPHA9L\",\"step_id\":\"LWU2GAZ6HR51O0X\",\"sel_actiond\":\"Disapproved\",\"remarks\":\"Disapprove\",\"user_apex\":\"submit\"}', 'Reygan', '192.168.254.105', 1617600894),
(555, 'fs_request_main', 'INSERT', '{\"rqid\":\"FCCMPC-0000057\",\"wflow_id\":\"SYR85G14OIPHA9L\",\"step_id\":\"UI94P61QSGXLWCZ\",\"sel_actiond\":\"Approved\",\"remarks\":\"ok\",\"user_apex\":\"submit\"}', 'Minda', '192.168.254.208', 1617600917),
(556, 'fs_request_main', 'INSERT', '{\"rqid\":\"FCCMPC-0000057\",\"wflow_id\":\"SYR85G14OIPHA9L\",\"step_id\":\"UI94P61QSGXLWCZ\",\"sel_actiond\":\"Approved\",\"remarks\":\"\",\"user_apex\":\"submit\"}', 'Nitz', '192.168.254.208', 1617601021),
(557, 'fs_request_main', 'UPDATE', '{\"id\":\"56\",\"edit_docname\":\"FC-BD-008\",\"edit_docdesp\":\"business_077\",\"edit_revno\":\"08\",\"edit\":\"\"}', 'Teo', '192.168.254.105', 1617601025),
(558, 'fs_request_main', '', '{\"refile_id\":\"FCCMPC-0000056\",\"upload\":\"\"}', 'Teo', '192.168.254.105', 1617601047),
(559, 'fs_request_main', 'INSERT', '{\"rqid\":\"FCCMPC-0000057\",\"wflow_id\":\"SYR85G14OIPHA9L\",\"step_id\":\"UI94P61QSGXLWCZ\",\"sel_actiond\":\"Approved\",\"remarks\":\"ok\",\"user_apex\":\"submit\"}', 'Whien', '192.168.250.76', 1617601055),
(560, 'fs_request_main', 'UPDATE', '{\"rqid\":\"FCCMPC-0000056\",\"wrkflow_id\":\"SYR85G14OIPHA9L\",\"resubmit\":\"submit\"}', 'Teo', '192.168.254.105', 1617601056),
(561, 'fs_request_main', 'INSERT', '{\"rqid\":\"FCCMPC-0000050\",\"wflow_id\":\"SYR85G14OIPHA9L\",\"step_id\":\"FOES7XV8I35HYCG\",\"sel_actiond\":\"Approved\",\"remarks\":\"ok\",\"user_apex\":\"submit\"}', 'Ann', '192.168.254.208', 1617601467),
(562, 'fs_request_main', 'INSERT', '{\"rqid\":\"FCCMPC-0000050\",\"wflow_id\":\"SYR85G14OIPHA9L\",\"step_id\":\"IDQSR0BKEPO8CLH\",\"sel_actiond\":\"Approved\",\"remarks\":\"\",\"user_apex\":\"submit\"}', 'Jema', '192.168.254.105', 1617601553),
(563, 'fs_request_main', 'INSERT', '{\"rqid\":\"FCCMPC-0000050\",\"wflow_id\":\"SYR85G14OIPHA9L\",\"step_id\":\"IDQSR0BKEPO8CLH\",\"sel_actiond\":\"Approved\",\"remarks\":\"OK\",\"user_apex\":\"submit\"}', 'yuya', '192.168.250.76', 1617601560),
(564, 'fs_request_main', 'INSERT', '{\"rqid\":\"FCCMPC-0000050\",\"wflow_id\":\"SYR85G14OIPHA9L\",\"step_id\":\"M9RXFWGI31NOQVC\",\"sel_actiond\":\"Confirmed\",\"user_apex\":\"submit\"}', 'Gladys', '192.168.250.76', 1617601633),
(565, 'fs_request_main', 'INSERT', '{\"rqid\":\"FCCMPC-0000050\",\"wflow_id\":\"SYR85G14OIPHA9L\",\"step_id\":\"M9RXFWGI31NOQVC\",\"sel_actiond\":\"Confirmed\",\"user_apex\":\"submit\"}', 'Chardey', '192.168.250.76', 1617601697);

-- --------------------------------------------------------

--
-- Table structure for table `fs_department`
--

CREATE TABLE `fs_department` (
  `id` int(10) NOT NULL,
  `dept_no` varchar(30) NOT NULL,
  `dept_name` varchar(50) NOT NULL,
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
(5, 'Business Department', 'Business Department', 'NO'),
(6, 'Audit', 'Auditing  Department', 'NO'),
(7, 'Accounting Dept', 'Accounting and Finance Dept', 'YES'),
(8, 'Collection', 'Collection Dept', 'YES'),
(9, 'Membership and Marketing Dept', 'Membership and Marketing Dept', 'NO'),
(10, 'Knowles Branch', 'Knowles Branch', 'NO'),
(11, 'IT Department', 'IT Department', 'NO');

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
(26, 1613789337, '', 'Sheila', '2021-02-20 10:48'),
(27, 1613790602, '', 'Sheila', '2021-02-20 11:10'),
(28, 1613790602, '', 'Sheila', '2021-02-20 11:10'),
(29, 1613790619, '', 'Minda', '2021-02-20 11:10'),
(30, 1613790619, '', 'Minda', '2021-02-20 11:10'),
(31, 1613790678, '', 'Ann', '2021-02-20 11:11'),
(32, 1613790678, '', 'Ann', '2021-02-20 11:11'),
(33, 1613791024, '', 'Jema', '2021-02-20 11:17'),
(34, 1613791024, '', 'Jema', '2021-02-20 11:17'),
(35, 1613791146, '', 'JR', '2021-02-20 11:19'),
(36, 1613791146, '', 'JR', '2021-02-20 11:19'),
(37, 1613791220, '', 'JR', '2021-02-20 11:20'),
(38, 1613791220, '', 'JR', '2021-02-20 11:20'),
(39, 1613792834, 'FCCMPC-0000043', 'Sheila', '2021-02-20 11:47'),
(40, 1613792834, 'FCCMPC-0000043', 'Sheila', '2021-02-20 11:47'),
(41, 1613793252, '', 'Ann', '2021-02-20 11:54'),
(42, 1613793252, '', 'Ann', '2021-02-20 11:54'),
(43, 1613793282, '', 'Ann', '2021-02-20 11:54'),
(44, 1613793282, '', 'Ann', '2021-02-20 11:54'),
(45, 1617587600, '', 'Sheila', '2021-04-05 09:53'),
(46, 1617587600, '', 'Sheila', '2021-04-05 09:53'),
(47, 1617587644, '', 'Sheila', '2021-04-05 09:54'),
(48, 1617587644, '', 'Sheila', '2021-04-05 09:54'),
(49, 1617588624, '', 'Minda', '2021-04-05 10:10'),
(50, 1617588624, '', 'Minda', '2021-04-05 10:10'),
(51, 1617588626, '', 'Whien', '2021-04-05 10:10'),
(52, 1617588626, '', 'Whien', '2021-04-05 10:10'),
(53, 1617588910, '', 'Tad', '2021-04-05 10:15'),
(54, 1617588910, '', 'Tad', '2021-04-05 10:15'),
(55, 1617595091, 'FCCMPC-0000045', 'yuya', '2021-04-05 11:58'),
(56, 1617595091, 'FCCMPC-0000045', 'yuya', '2021-04-05 11:58'),
(57, 1617595412, '', 'Dux', '2021-04-05 12:03'),
(58, 1617595412, '', 'Dux', '2021-04-05 12:03'),
(59, 1617595422, '', 'Syra', '2021-04-05 12:03'),
(60, 1617595422, '', 'Syra', '2021-04-05 12:03'),
(61, 1617597538, '', 'yuya', '2021-04-05 12:38'),
(62, 1617597538, '', 'yuya', '2021-04-05 12:38');

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
(246, 'FCCMPC-0000041', 'SYR85G14OIPHA9L', 'IDQSR0BKEPO8CLH', 'Approved', 'Jema', '', '2021-02-20', 1613786212),
(247, 'FCCMPC-0000042', 'SYR85G14OIPHA9L', 'Created', 'Created', 'JR', 'New', '2021-02-20', 1613790527),
(248, 'FCCMPC-0000042', 'SYR85G14OIPHA9L', 'UI94P61QSGXLWCZ', 'Approved', 'Minda', '', '2021-02-20', 1613790598),
(249, 'FCCMPC-0000042', 'SYR85G14OIPHA9L', 'UI94P61QSGXLWCZ', 'Approved', 'Sheila', 'ok', '2021-02-20', 1613790618),
(250, 'FCCMPC-0000042', 'SYR85G14OIPHA9L', 'LWU2GAZ6HR51O0X', 'Approved', 'Reygan', '', '2021-02-20', 1613790640),
(251, 'FCCMPC-0000042', 'SYR85G14OIPHA9L', 'FOES7XV8I35HYCG', 'Approved', 'Ann', '', '2021-02-20', 1613790691),
(252, 'FCCMPC-0000042', 'SYR85G14OIPHA9L', 'IDQSR0BKEPO8CLH', 'Approved', 'yuya', 'ok', '2021-02-20', 1613790818),
(253, 'FCCMPC-0000042', 'SYR85G14OIPHA9L', 'IDQSR0BKEPO8CLH', 'Approved', 'Jema', '', '2021-02-20', 1613790827),
(254, 'FCCMPC-0000042', 'SYR85G14OIPHA9L', 'M9RXFWGI31NOQVC', 'Confirmed', 'JR', '', '2021-02-20', 1613791234),
(255, 'FCCMPC-0000042', 'SYR85G14OIPHA9L', 'M9RXFWGI31NOQVC', 'Confirmed', 'Teo', '', '2021-02-20', 1613791434),
(256, 'FCCMPC-0000042', 'SYR85G14OIPHA9L', 'M9RXFWGI31NOQVC', 'Confirmed', 'Syra', '', '2021-02-20', 1613791549),
(257, 'FCCMPC-0000042', 'SYR85G14OIPHA9L', 'M9RXFWGI31NOQVC', 'Confirmed', 'Chardey', '', '2021-02-20', 1613791611),
(258, 'FCCMPC-0000030', 'SYR85G14OIPHA9L', 'M9RXFWGI31NOQVC', 'Confirmed', 'Gladys', '', '2021-02-20', 1613791662),
(259, 'FCCMPC-0000043', 'SYR85G14OIPHA9L', 'Created', 'Created', 'JR', 'New', '2021-02-20', 1613792712),
(260, 'FCCMPC-0000043', 'SYR85G14OIPHA9L', 'UI94P61QSGXLWCZ', 'Approved', 'Minda', '', '2021-02-20', 1613792824),
(261, 'FCCMPC-0000043', 'SYR85G14OIPHA9L', 'UI94P61QSGXLWCZ', 'Approved', 'Sheila', 'ok', '2021-02-20', 1613792856),
(262, 'FCCMPC-0000043', 'SYR85G14OIPHA9L', 'LWU2GAZ6HR51O0X', 'Approved', 'Reygan', '', '2021-02-20', 1613792915),
(263, 'FCCMPC-0000043', 'SYR85G14OIPHA9L', 'FOES7XV8I35HYCG', 'Approved', 'Ann', '', '2021-02-20', 1613792967),
(264, 'FCCMPC-0000043', 'SYR85G14OIPHA9L', 'IDQSR0BKEPO8CLH', 'Approved', 'Jema', '', '2021-02-20', 1613792985),
(265, 'FCCMPC-0000043', 'SYR85G14OIPHA9L', 'IDQSR0BKEPO8CLH', 'Approved', 'yuya', 'ok', '2021-02-20', 1613793042),
(266, 'FCCMPC-0000043', 'SYR85G14OIPHA9L', 'M9RXFWGI31NOQVC', 'Confirmed', 'Syra', '', '2021-02-20', 1613793187),
(267, 'FCCMPC-0000043', 'SYR85G14OIPHA9L', 'M9RXFWGI31NOQVC', 'Confirmed', 'Chardey', '', '2021-02-20', 1613793268),
(268, 'FCCMPC-0000044', 'ZJVUOB63FMWCS9T', 'Created', 'Created', 'Teo', 'New', '2021-02-20', 1613799579),
(269, '', 'Cancelled', 'Cancelled', 'Cancelled', 'Teo', 'Cancelled', '2021-02-20', 1613799638),
(270, 'FCCMPC-0000045', 'SYR85G14OIPHA9L', 'Created', 'Created', 'yuya', 'New', '2021-02-27', 1614389205),
(271, 'FCCMPC-0000045', 'SYR85G14OIPHA9L', 'UI94P61QSGXLWCZ', 'Approved', 'Sheila', 'ok', '2021-02-27', 1614390534),
(272, 'FCCMPC-0000045', 'SYR85G14OIPHA9L', 'UI94P61QSGXLWCZ', 'Approved', 'Minda', 'ok', '2021-02-27', 1614390675),
(273, 'FCCMPC-0000045', 'SYR85G14OIPHA9L', 'UI94P61QSGXLWCZ', 'Approved', 'Nitz', '', '2021-02-27', 1614391120),
(274, 'FCCMPC-0000045', 'SYR85G14OIPHA9L', 'UI94P61QSGXLWCZ', 'Approved', 'Tad', '', '2021-02-27', 1614391178),
(275, 'FCCMPC-0000045', 'SYR85G14OIPHA9L', 'UI94P61QSGXLWCZ', 'Approved', 'Whien', 'OK', '2021-02-27', 1614391196),
(276, 'FCCMPC-0000045', 'SYR85G14OIPHA9L', 'UI94P61QSGXLWCZ', 'Approved', 'Salvie', '', '2021-02-27', 1614391237),
(277, 'FCCMPC-0000045', 'SYR85G14OIPHA9L', 'LWU2GAZ6HR51O0X', 'Approved', 'Reygan', '', '2021-02-27', 1614391304),
(278, 'FCCMPC-0000045', 'SYR85G14OIPHA9L', 'FOES7XV8I35HYCG', 'Approved', 'Ann', '', '2021-02-27', 1614391394),
(279, 'FCCMPC-0000045', 'SYR85G14OIPHA9L', 'IDQSR0BKEPO8CLH', 'Approved', 'Jema', '', '2021-02-27', 1614391801),
(280, 'FCCMPC-0000045', 'SYR85G14OIPHA9L', 'IDQSR0BKEPO8CLH', 'Approved', 'yuya', 'Ok', '2021-02-27', 1614391836),
(281, 'FCCMPC-0000045', 'SYR85G14OIPHA9L', 'M9RXFWGI31NOQVC', 'Confirmed', 'Chardey', '', '2021-02-27', 1614392044),
(282, 'FCCMPC-0000046', 'SYR85G14OIPHA9L', 'Created', 'Created', 'Hilberth', 'New', '2021-02-27', 1614392976),
(283, 'FCCMPC-0000047', 'SYR85G14OIPHA9L', 'Created', 'Created', 'Hilberth', 'New', '2021-04-04', 1617519544),
(284, 'FCCMPC-0000047', 'SYR85G14OIPHA9L', 'UI94P61QSGXLWCZ', 'Approved', 'Sheila', '', '2021-04-04', 1617519640),
(285, 'FCCMPC-0000048', 'SYR85G14OIPHA9L', 'Created', 'Created', 'Syra', 'New', '2021-04-05', 1617586999),
(286, 'FCCMPC-0000048', 'SYR85G14OIPHA9L', 'UI94P61QSGXLWCZ', 'Approved', 'Sheila', 'ok', '2021-04-05', 1617587674),
(287, 'FCCMPC-0000048', 'SYR85G14OIPHA9L', 'UI94P61QSGXLWCZ', 'Approved', 'Whien', 'ok', '2021-04-05', 1617588674),
(288, 'FCCMPC-0000048', 'SYR85G14OIPHA9L', 'UI94P61QSGXLWCZ', 'Approved', 'Minda', 'ok', '2021-04-05', 1617588773),
(289, 'FCCMPC-0000048', 'SYR85G14OIPHA9L', 'UI94P61QSGXLWCZ', 'Approved', 'Nitz', 'ok', '2021-04-05', 1617588784),
(290, 'FCCMPC-0000048', 'SYR85G14OIPHA9L', 'UI94P61QSGXLWCZ', 'Approved', 'Salvie', 'ok', '2021-04-05', 1617588829),
(291, 'FCCMPC-0000048', 'SYR85G14OIPHA9L', 'UI94P61QSGXLWCZ', 'Approved', 'Tad', 'ok', '2021-04-05', 1617588876),
(292, 'FCCMPC-0000048', 'SYR85G14OIPHA9L', 'LWU2GAZ6HR51O0X', 'Approved', 'Reygan', '', '2021-04-05', 1617589114),
(293, 'FCCMPC-0000049', 'SYR85G14OIPHA9L', 'Created', 'Created', 'Teo', 'New', '2021-04-05', 1617589464),
(294, 'FCCMPC-0000049', 'SYR85G14OIPHA9L', 'UI94P61QSGXLWCZ', 'Approved', 'Salvie', '', '2021-04-05', 1617589543),
(295, 'FCCMPC-0000049', 'SYR85G14OIPHA9L', 'UI94P61QSGXLWCZ', 'Approved', 'Nitz', '', '2021-04-05', 1617589585),
(296, 'FCCMPC-0000049', 'SYR85G14OIPHA9L', 'UI94P61QSGXLWCZ', 'Approved', 'Sheila', 'ok', '2021-04-05', 1617589622),
(297, 'FCCMPC-0000049', 'SYR85G14OIPHA9L', 'UI94P61QSGXLWCZ', 'Approved', 'Minda', '', '2021-04-05', 1617589634),
(298, 'FCCMPC-0000049', 'SYR85G14OIPHA9L', 'UI94P61QSGXLWCZ', 'Approved', 'Tad', '', '2021-04-05', 1617589673),
(299, 'FCCMPC-0000049', 'SYR85G14OIPHA9L', 'UI94P61QSGXLWCZ', 'Approved', 'Whien', 'ok', '2021-04-05', 1617589686),
(300, 'FCCMPC-0000049', 'SYR85G14OIPHA9L', 'LWU2GAZ6HR51O0X', 'Approved', 'Reygan', '', '2021-04-05', 1617589744),
(301, 'FCCMPC-0000049', 'SYR85G14OIPHA9L', 'FOES7XV8I35HYCG', 'Approved', 'Ann', 'ok', '2021-04-05', 1617594716),
(302, 'FCCMPC-0000049', 'SYR85G14OIPHA9L', 'IDQSR0BKEPO8CLH', 'Approved', 'yuya', 'ok', '2021-04-05', 1617594787),
(303, 'FCCMPC-0000049', 'SYR85G14OIPHA9L', 'IDQSR0BKEPO8CLH', 'Approved', 'Jema', 'ok', '2021-04-05', 1617594841),
(304, 'FCCMPC-0000049', 'SYR85G14OIPHA9L', 'M9RXFWGI31NOQVC', 'Confirmed', 'Syra', '', '2021-04-05', 1617594993),
(305, 'FCCMPC-0000048', 'SYR85G14OIPHA9L', 'FOES7XV8I35HYCG', 'Approved', 'Ann', 'ok', '2021-04-05', 1617595041),
(306, 'FCCMPC-0000048', 'SYR85G14OIPHA9L', 'IDQSR0BKEPO8CLH', 'Approved', 'yuya', 'ok', '2021-04-05', 1617595302),
(307, 'FCCMPC-0000048', 'SYR85G14OIPHA9L', 'IDQSR0BKEPO8CLH', 'Approved', 'Jema', 'ok', '2021-04-05', 1617595308),
(308, 'FCCMPC-0000048', 'SYR85G14OIPHA9L', 'M9RXFWGI31NOQVC', 'Confirmed', 'Syra', '', '2021-04-05', 1617595432),
(309, 'FCCMPC-0000048', 'SYR85G14OIPHA9L', 'M9RXFWGI31NOQVC', 'Confirmed', 'Dux', '', '2021-04-05', 1617595432),
(310, 'FCCMPC-0000048', 'SYR85G14OIPHA9L', 'M9RXFWGI31NOQVC', 'Confirmed', 'Chardey', '', '2021-04-05', 1617595546),
(311, 'FCCMPC-0000050', 'SYR85G14OIPHA9L', 'Created', 'Created', 'Syra', 'New', '2021-04-05', 1617596409),
(312, 'FCCMPC-0000050', 'SYR85G14OIPHA9L', 'UI94P61QSGXLWCZ', 'Approved', 'Minda', '', '2021-04-05', 1617597536),
(313, 'FCCMPC-0000051', 'SYR85G14OIPHA9L', 'Created', 'Created', 'Teo', 'New', '2021-04-05', 1617597662),
(314, 'FCCMPC-0000050', 'SYR85G14OIPHA9L', 'UI94P61QSGXLWCZ', 'Disapproved', 'Whien', 'correct statement in sec 5.3', '2021-04-05', 1617597680),
(315, 'FCCMPC-0000050', 'SYR85G14OIPHA9L', 'UI94P61QSGXLWCZ', 'Approved', 'Salvie', 'ok', '2021-04-05', 1617597780),
(316, 'FCCMPC-0000052', 'SYR85G14OIPHA9L', 'Created', 'Created', 'Teo', 'New', '2021-04-05', 1617597784),
(317, 'FCCMPC-0000050', 'SYR85G14OIPHA9L', 'UI94P61QSGXLWCZ', 'Approved', 'Sheila', 'ok', '2021-04-05', 1617597823),
(318, 'FCCMPC-0000050', 'SYR85G14OIPHA9L', 'UI94P61QSGXLWCZ', 'Approved', 'Tad', 'ok', '2021-04-05', 1617597907),
(319, 'FCCMPC-0000053', 'SYR85G14OIPHA9L', 'Created', 'Created', 'Syra', 'New', '2021-04-05', 1617597936),
(320, 'FCCMPC-0000050', 'SYR85G14OIPHA9L', 'UI94P61QSGXLWCZ', 'Disapproved', 'Nitz', 'not ok', '2021-04-05', 1617597951),
(321, 'FCCMPC-0000054', 'SYR85G14OIPHA9L', 'Created', 'Created', 'Syra', 'New', '2021-04-05', 1617598410),
(322, 'FCCMPC-0000050', 'Resubmit', 'Resubmit', 'Resubmit', 'Syra', 'Resubmit', '2021-04-05', 1617598594),
(323, 'FCCMPC-0000055', 'SYR85G14OIPHA9L', 'Created', 'Created', 'Syra', 'New', '2021-04-05', 1617598794),
(324, 'FCCMPC-0000055', 'Cancelled', 'Cancelled', 'Cancelled', 'Syra', 'Cancelled', '2021-04-05', 1617598809),
(325, 'FCCMPC-0000050', 'SYR85G14OIPHA9L', 'UI94P61QSGXLWCZ', 'Approved', 'Minda', 'ok', '2021-04-05', 1617598903),
(326, 'FCCMPC-0000050', 'SYR85G14OIPHA9L', 'UI94P61QSGXLWCZ', 'Approved', 'Sheila', 'corrected', '2021-04-05', 1617598963),
(327, 'FCCMPC-0000050', 'SYR85G14OIPHA9L', 'UI94P61QSGXLWCZ', 'Approved', 'Sheila', 'ok', '2021-04-05', 1617598966),
(328, 'FCCMPC-0000052', 'Cancelled', 'Cancelled', 'Cancelled', 'Teo', 'Cancelled', '2021-04-05', 1617598976),
(329, 'FCCMPC-0000051', 'Cancelled', 'Cancelled', 'Cancelled', 'Teo', 'Cancelled', '2021-04-05', 1617598988),
(330, 'FCCMPC-0000050', 'SYR85G14OIPHA9L', 'UI94P61QSGXLWCZ', 'Approved', 'Salvie', '', '2021-04-05', 1617599116),
(331, 'FCCMPC-0000050', 'SYR85G14OIPHA9L', 'UI94P61QSGXLWCZ', 'Approved', 'Nitz', '', '2021-04-05', 1617599174),
(332, 'FCCMPC-0000050', 'SYR85G14OIPHA9L', 'UI94P61QSGXLWCZ', 'Approved', 'Tad', '', '2021-04-05', 1617599235),
(333, 'FCCMPC-0000050', 'SYR85G14OIPHA9L', 'UI94P61QSGXLWCZ', 'Approved', 'Whien', '', '2021-04-05', 1617599287),
(334, 'FCCMPC-0000050', 'SYR85G14OIPHA9L', 'LWU2GAZ6HR51O0X', 'Approved', 'Reygan', '', '2021-04-05', 1617599367),
(335, 'FCCMPC-0000056', 'SYR85G14OIPHA9L', 'Created', 'Created', 'Teo', 'New', '2021-04-05', 1617599934),
(336, 'FCCMPC-0000057', 'SYR85G14OIPHA9L', 'Created', 'Created', 'Teo', 'New', '2021-04-05', 1617600676),
(337, 'FCCMPC-0000056', 'SYR85G14OIPHA9L', 'UI94P61QSGXLWCZ', 'Approved', 'Minda', 'OK', '2021-04-05', 1617600703),
(338, 'FCCMPC-0000056', 'SYR85G14OIPHA9L', 'UI94P61QSGXLWCZ', 'Approved', 'Sheila', 'ok', '2021-04-05', 1617600729),
(339, 'FCCMPC-0000056', 'SYR85G14OIPHA9L', 'UI94P61QSGXLWCZ', 'Approved', 'Nitz', '', '2021-04-05', 1617600764),
(340, 'FCCMPC-0000056', 'SYR85G14OIPHA9L', 'UI94P61QSGXLWCZ', 'Approved', 'Whien', 'OK', '2021-04-05', 1617600792),
(341, 'FCCMPC-0000056', 'SYR85G14OIPHA9L', 'UI94P61QSGXLWCZ', 'Approved', 'Salvie', 'ok', '2021-04-05', 1617600805),
(342, 'FCCMPC-0000056', 'SYR85G14OIPHA9L', 'UI94P61QSGXLWCZ', 'Approved', 'Tad', '', '2021-04-05', 1617600819),
(343, 'FCCMPC-0000056', 'SYR85G14OIPHA9L', 'LWU2GAZ6HR51O0X', 'Disapproved', 'Reygan', 'Disapprove', '2021-04-05', 1617600894),
(344, 'FCCMPC-0000057', 'SYR85G14OIPHA9L', 'UI94P61QSGXLWCZ', 'Approved', 'Minda', 'ok', '2021-04-05', 1617600917),
(345, 'FCCMPC-0000057', 'SYR85G14OIPHA9L', 'UI94P61QSGXLWCZ', 'Approved', 'Nitz', '', '2021-04-05', 1617601021),
(346, 'FCCMPC-0000057', 'SYR85G14OIPHA9L', 'UI94P61QSGXLWCZ', 'Approved', 'Whien', 'ok', '2021-04-05', 1617601055),
(347, 'FCCMPC-0000056', 'Resubmit', 'Resubmit', 'Resubmit', 'Teo', 'Resubmit', '2021-04-05', 1617601056),
(348, 'FCCMPC-0000050', 'SYR85G14OIPHA9L', 'FOES7XV8I35HYCG', 'Approved', 'Ann', 'ok', '2021-04-05', 1617601466),
(349, 'FCCMPC-0000050', 'SYR85G14OIPHA9L', 'IDQSR0BKEPO8CLH', 'Approved', 'Jema', '', '2021-04-05', 1617601553),
(350, 'FCCMPC-0000050', 'SYR85G14OIPHA9L', 'IDQSR0BKEPO8CLH', 'Approved', 'yuya', 'OK', '2021-04-05', 1617601560),
(351, 'FCCMPC-0000050', 'SYR85G14OIPHA9L', 'M9RXFWGI31NOQVC', 'Confirmed', 'Syra', '', '2021-04-05', 1617601632),
(352, 'FCCMPC-0000050', 'SYR85G14OIPHA9L', 'M9RXFWGI31NOQVC', 'Confirmed', 'Gladys', '', '2021-04-05', 1617601632),
(353, 'FCCMPC-0000050', 'SYR85G14OIPHA9L', 'M9RXFWGI31NOQVC', 'Confirmed', 'Chardey', '', '2021-04-05', 1617601696);

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
(35, 'FCCMPC-0000041', 'title1.txt', 'Syra', 1613785738),
(36, 'FCCMPC-0000042', 'title1.txt', 'JR', 1613790527),
(37, 'FCCMPC-0000043', 'title1.txt', 'JR', 1613792712),
(38, 'FCCMPC-0000044', 'title1.txt', 'Teo', 1613799579),
(39, 'FCCMPC-0000045', 'FC-BD-003_BANGKAL PLAZA OPERATING rev2.doc', 'yuya', 1614389205),
(40, 'FCCMPC-0000047', 'dd.txt', 'Hilberth', 1617519544),
(41, 'FCCMPC-0000048', 'FC-ORG-033 COVID-19 POLICY & GUIDELINES_YH_Final.doc', 'Syra', 1617586999),
(42, 'FCCMPC-0000049', 'title1.txt', 'Teo', 1617589464),
(43, 'FCCMPC-0000050', 'FC-ORG-033 COVID-19 POLICY & GUIDELINES_YH_Final.doc', 'Syra', 1617598311),
(44, 'FCCMPC-0000052', 'title1.txt', 'Teo', 1617597784),
(45, 'FCCMPC-0000056', 'title1.txt', 'Teo', 1617601047),
(46, 'FCCMPC-0000057', 'title1.txt', 'Teo', 1617600676);

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
(30, '07', 'FCCMPC-0000030', 'QMS-FC-002 ', 'Document Control', 'SYR85G14OIPHA9L', 'Ann', 'InProgress', 1612576580, '2021-02-06'),
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
(41, '07', 'FCCMPC-0000041', 'FC-QMS-007', 'Archiving', 'SYR85G14OIPHA9L', 'Syra', 'Completed', 1613785044, '2021-02-20'),
(42, '1', 'FCCMPC-0000042', 'FC-BD-005', 'business', 'SYR85G14OIPHA9L', 'JR', 'Completed', 1613790527, '2021-02-20'),
(43, '2', 'FCCMPC-0000043', 'FC-BD-007', 'business', 'SYR85G14OIPHA9L', 'JR', 'Completed', 1613792712, '2021-02-20'),
(44, '3', 'FCCMPC-0000044', 'FC-BD-005', 'business', 'ZJVUOB63FMWCS9T', 'Teo', 'Cancelled', 1613799579, '2021-02-20'),
(45, '1.0', 'FCCMPC-0000045', 'FC-BD-003', 'Bankal Plaza Operating Guidelines', 'SYR85G14OIPHA9L', 'yuya', 'Completed', 1614389205, '2021-02-27'),
(46, '4', 'FCCMPC-0000046', 'New Loan Policy 2', '', 'SYR85G14OIPHA9L', 'Hilberth', 'New', 1614392976, '2021-02-27'),
(47, '4', 'FCCMPC-0000047', 'New Loan Policy', '', 'SYR85G14OIPHA9L', 'Hilberth', 'InProgress', 1617519544, '2021-04-04'),
(48, '02', 'FCCMPC-0000048', 'FC-ORG-33', 'COVID-19 POLICY AND GUIDELINES', 'SYR85G14OIPHA9L', 'Syra', 'Completed', 1617586999, '2021-04-05'),
(49, '1', 'FCCMPC-0000049', 'FC-BD-008', 'business', 'SYR85G14OIPHA9L', 'Teo', 'Completed', 1617589464, '2021-04-05'),
(50, '03', 'FCCMPC-0000050', 'FC-ORG-33', 'COVID-19 POLICY AND GUIDELINES', 'SYR85G14OIPHA9L', 'Syra', 'Completed', 1617596409, '2021-04-05'),
(51, '7', 'FCCMPC-0000051', 'FC-BD-007', 'Business 007', 'SYR85G14OIPHA9L', 'Teo', 'Cancelled', 1617597662, '2021-04-05'),
(52, '7', 'FCCMPC-0000052', 'FC-BD-007', 'business_007', 'SYR85G14OIPHA9L', 'Teo', 'Cancelled', 1617597784, '2021-04-05'),
(53, '4', 'FCCMPC-0000053', 'New Loan Policy 2', '', 'SYR85G14OIPHA9L', 'Syra', 'Cancelled', 1617597936, '2021-04-05'),
(54, '12', 'FCCMPC-0000054', 'New Loan Policy 2', '', 'SYR85G14OIPHA9L', 'Syra', 'Cancelled', 1617598410, '2021-04-05'),
(55, '4', 'FCCMPC-0000055', 'New Loan Policy 2', '', 'SYR85G14OIPHA9L', 'Syra', 'Cancelled', 1617598794, '2021-04-05'),
(56, '08', 'FCCMPC-0000056', 'FC-BD-008', 'business_077', 'SYR85G14OIPHA9L', 'Teo', 'InProgress', 1617599934, '2021-04-05'),
(57, '009', 'FCCMPC-0000057', 'FC-BD-009', 'business_012', 'SYR85G14OIPHA9L', 'Teo', 'InProgress', 1617600676, '2021-04-05');

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
(86, 1613786098, 'FCCMPC-0000041', 'SYR85G14OIPHA9L', 'IDQSR0BKEPO8CLH', 4, 'yuya', 'Approved', 'ok'),
(87, 1613790598, 'FCCMPC-0000042', 'SYR85G14OIPHA9L', 'UI94P61QSGXLWCZ', 1, 'Minda', 'Approved', ''),
(88, 1613790618, 'FCCMPC-0000042', 'SYR85G14OIPHA9L', 'UI94P61QSGXLWCZ', 1, 'Sheila', 'Approved', 'ok'),
(89, 1613790640, 'FCCMPC-0000042', 'SYR85G14OIPHA9L', 'LWU2GAZ6HR51O0X', 2, 'Reygan', 'Approved', ''),
(90, 1613790691, 'FCCMPC-0000042', 'SYR85G14OIPHA9L', 'FOES7XV8I35HYCG', 3, 'Ann', 'Approved', ''),
(91, 1613790818, 'FCCMPC-0000042', 'SYR85G14OIPHA9L', 'IDQSR0BKEPO8CLH', 4, 'yuya', 'Approved', 'ok'),
(92, 1613790827, 'FCCMPC-0000042', 'SYR85G14OIPHA9L', 'IDQSR0BKEPO8CLH', 4, 'Jema', 'Approved', ''),
(93, 1613791234, 'FCCMPC-0000042', 'SYR85G14OIPHA9L', 'M9RXFWGI31NOQVC', 5, 'JR', 'Confirmed', ''),
(94, 1613791434, 'FCCMPC-0000042', 'SYR85G14OIPHA9L', 'M9RXFWGI31NOQVC', 5, 'Teo', 'Confirmed', ''),
(95, 1613791549, 'FCCMPC-0000042', 'SYR85G14OIPHA9L', 'M9RXFWGI31NOQVC', 5, 'Syra', 'Confirmed', ''),
(96, 1613791611, 'FCCMPC-0000042', 'SYR85G14OIPHA9L', 'M9RXFWGI31NOQVC', 5, 'Chardey', 'Confirmed', ''),
(97, 1613791662, 'FCCMPC-0000030', 'SYR85G14OIPHA9L', 'M9RXFWGI31NOQVC', 5, 'Gladys', 'Confirmed', ''),
(98, 1613792824, 'FCCMPC-0000043', 'SYR85G14OIPHA9L', 'UI94P61QSGXLWCZ', 1, 'Minda', 'Approved', ''),
(99, 1613792856, 'FCCMPC-0000043', 'SYR85G14OIPHA9L', 'UI94P61QSGXLWCZ', 1, 'Sheila', 'Approved', 'ok'),
(100, 1613792915, 'FCCMPC-0000043', 'SYR85G14OIPHA9L', 'LWU2GAZ6HR51O0X', 2, 'Reygan', 'Approved', ''),
(101, 1613792967, 'FCCMPC-0000043', 'SYR85G14OIPHA9L', 'FOES7XV8I35HYCG', 3, 'Ann', 'Approved', ''),
(102, 1613792985, 'FCCMPC-0000043', 'SYR85G14OIPHA9L', 'IDQSR0BKEPO8CLH', 4, 'Jema', 'Approved', ''),
(103, 1613793042, 'FCCMPC-0000043', 'SYR85G14OIPHA9L', 'IDQSR0BKEPO8CLH', 4, 'yuya', 'Approved', 'ok'),
(104, 1613793187, 'FCCMPC-0000043', 'SYR85G14OIPHA9L', 'M9RXFWGI31NOQVC', 5, 'Syra', 'Confirmed', ''),
(105, 1613793268, 'FCCMPC-0000043', 'SYR85G14OIPHA9L', 'M9RXFWGI31NOQVC', 5, 'Chardey', 'Confirmed', ''),
(106, 1614390534, 'FCCMPC-0000045', 'SYR85G14OIPHA9L', 'UI94P61QSGXLWCZ', 0, 'Sheila', 'Approved', 'ok'),
(107, 1614390675, 'FCCMPC-0000045', 'SYR85G14OIPHA9L', 'UI94P61QSGXLWCZ', 0, 'Minda', 'Approved', 'ok'),
(108, 1614391120, 'FCCMPC-0000045', 'SYR85G14OIPHA9L', 'UI94P61QSGXLWCZ', 0, 'Nitz', 'Approved', ''),
(109, 1614391178, 'FCCMPC-0000045', 'SYR85G14OIPHA9L', 'UI94P61QSGXLWCZ', 0, 'Tad', 'Approved', ''),
(110, 1614391196, 'FCCMPC-0000045', 'SYR85G14OIPHA9L', 'UI94P61QSGXLWCZ', 0, 'Whien', 'Approved', 'OK'),
(111, 1614391237, 'FCCMPC-0000045', 'SYR85G14OIPHA9L', 'UI94P61QSGXLWCZ', 0, 'Salvie', 'Approved', ''),
(112, 1614391304, 'FCCMPC-0000045', 'SYR85G14OIPHA9L', 'LWU2GAZ6HR51O0X', 0, 'Reygan', 'Approved', ''),
(113, 1614391394, 'FCCMPC-0000045', 'SYR85G14OIPHA9L', 'FOES7XV8I35HYCG', 0, 'Ann', 'Approved', ''),
(114, 1614391801, 'FCCMPC-0000045', 'SYR85G14OIPHA9L', 'IDQSR0BKEPO8CLH', 0, 'Jema', 'Approved', ''),
(115, 1614391836, 'FCCMPC-0000045', 'SYR85G14OIPHA9L', 'IDQSR0BKEPO8CLH', 0, 'yuya', 'Approved', 'Ok'),
(116, 1614392044, 'FCCMPC-0000045', 'SYR85G14OIPHA9L', 'M9RXFWGI31NOQVC', 0, 'Chardey', 'Confirmed', ''),
(117, 1617519640, 'FCCMPC-0000047', 'SYR85G14OIPHA9L', 'UI94P61QSGXLWCZ', 1, 'Sheila', 'Approved', ''),
(118, 1617587674, 'FCCMPC-0000048', 'SYR85G14OIPHA9L', 'UI94P61QSGXLWCZ', 1, 'Sheila', 'Approved', 'ok'),
(119, 1617588674, 'FCCMPC-0000048', 'SYR85G14OIPHA9L', 'UI94P61QSGXLWCZ', 1, 'Whien', 'Approved', 'ok'),
(120, 1617588773, 'FCCMPC-0000048', 'SYR85G14OIPHA9L', 'UI94P61QSGXLWCZ', 1, 'Minda', 'Approved', 'ok'),
(121, 1617588784, 'FCCMPC-0000048', 'SYR85G14OIPHA9L', 'UI94P61QSGXLWCZ', 1, 'Nitz', 'Approved', 'ok'),
(122, 1617588829, 'FCCMPC-0000048', 'SYR85G14OIPHA9L', 'UI94P61QSGXLWCZ', 1, 'Salvie', 'Approved', 'ok'),
(123, 1617588876, 'FCCMPC-0000048', 'SYR85G14OIPHA9L', 'UI94P61QSGXLWCZ', 1, 'Tad', 'Approved', 'ok'),
(124, 1617589114, 'FCCMPC-0000048', 'SYR85G14OIPHA9L', 'LWU2GAZ6HR51O0X', 2, 'Reygan', 'Approved', ''),
(125, 1617589543, 'FCCMPC-0000049', 'SYR85G14OIPHA9L', 'UI94P61QSGXLWCZ', 1, 'Salvie', 'Approved', ''),
(126, 1617589585, 'FCCMPC-0000049', 'SYR85G14OIPHA9L', 'UI94P61QSGXLWCZ', 1, 'Nitz', 'Approved', ''),
(127, 1617589622, 'FCCMPC-0000049', 'SYR85G14OIPHA9L', 'UI94P61QSGXLWCZ', 1, 'Sheila', 'Approved', 'ok'),
(128, 1617589634, 'FCCMPC-0000049', 'SYR85G14OIPHA9L', 'UI94P61QSGXLWCZ', 1, 'Minda', 'Approved', ''),
(129, 1617589673, 'FCCMPC-0000049', 'SYR85G14OIPHA9L', 'UI94P61QSGXLWCZ', 1, 'Tad', 'Approved', ''),
(130, 1617589686, 'FCCMPC-0000049', 'SYR85G14OIPHA9L', 'UI94P61QSGXLWCZ', 1, 'Whien', 'Approved', 'ok'),
(131, 1617589744, 'FCCMPC-0000049', 'SYR85G14OIPHA9L', 'LWU2GAZ6HR51O0X', 2, 'Reygan', 'Approved', ''),
(132, 1617594716, 'FCCMPC-0000049', 'SYR85G14OIPHA9L', 'FOES7XV8I35HYCG', 3, 'Ann', 'Approved', 'ok'),
(133, 1617594787, 'FCCMPC-0000049', 'SYR85G14OIPHA9L', 'IDQSR0BKEPO8CLH', 4, 'yuya', 'Approved', 'ok'),
(134, 1617594841, 'FCCMPC-0000049', 'SYR85G14OIPHA9L', 'IDQSR0BKEPO8CLH', 4, 'Jema', 'Approved', 'ok'),
(135, 1617594993, 'FCCMPC-0000049', 'SYR85G14OIPHA9L', 'M9RXFWGI31NOQVC', 5, 'Syra', 'Confirmed', ''),
(136, 1617595041, 'FCCMPC-0000048', 'SYR85G14OIPHA9L', 'FOES7XV8I35HYCG', 3, 'Ann', 'Approved', 'ok'),
(137, 1617595302, 'FCCMPC-0000048', 'SYR85G14OIPHA9L', 'IDQSR0BKEPO8CLH', 4, 'yuya', 'Approved', 'ok'),
(138, 1617595308, 'FCCMPC-0000048', 'SYR85G14OIPHA9L', 'IDQSR0BKEPO8CLH', 4, 'Jema', 'Approved', 'ok'),
(139, 1617595432, 'FCCMPC-0000048', 'SYR85G14OIPHA9L', 'M9RXFWGI31NOQVC', 5, 'Dux', 'Confirmed', ''),
(140, 1617595432, 'FCCMPC-0000048', 'SYR85G14OIPHA9L', 'M9RXFWGI31NOQVC', 5, 'Syra', 'Confirmed', ''),
(141, 1617595546, 'FCCMPC-0000048', 'SYR85G14OIPHA9L', 'M9RXFWGI31NOQVC', 5, 'Chardey', 'Confirmed', ''),
(142, 1617598903, 'FCCMPC-0000050', 'SYR85G14OIPHA9L', 'UI94P61QSGXLWCZ', 1, 'Minda', 'Approved', 'ok'),
(143, 1617599287, 'FCCMPC-0000050', 'SYR85G14OIPHA9L', 'UI94P61QSGXLWCZ', 1, 'Whien', 'Approved', ''),
(144, 1617599116, 'FCCMPC-0000050', 'SYR85G14OIPHA9L', 'UI94P61QSGXLWCZ', 1, 'Salvie', 'Approved', ''),
(145, 1617598966, 'FCCMPC-0000050', 'SYR85G14OIPHA9L', 'UI94P61QSGXLWCZ', 1, 'Sheila', 'Approved', 'ok'),
(146, 1617599235, 'FCCMPC-0000050', 'SYR85G14OIPHA9L', 'UI94P61QSGXLWCZ', 1, 'Tad', 'Approved', ''),
(147, 1617599174, 'FCCMPC-0000050', 'SYR85G14OIPHA9L', 'UI94P61QSGXLWCZ', 1, 'Nitz', 'Approved', ''),
(148, 1617599367, 'FCCMPC-0000050', 'SYR85G14OIPHA9L', 'LWU2GAZ6HR51O0X', 2, 'Reygan', 'Approved', ''),
(149, 1617600703, 'FCCMPC-0000056', 'SYR85G14OIPHA9L', 'UI94P61QSGXLWCZ', 1, 'Minda', 'Approved', 'OK'),
(150, 1617600729, 'FCCMPC-0000056', 'SYR85G14OIPHA9L', 'UI94P61QSGXLWCZ', 1, 'Sheila', 'Approved', 'ok'),
(151, 1617600764, 'FCCMPC-0000056', 'SYR85G14OIPHA9L', 'UI94P61QSGXLWCZ', 1, 'Nitz', 'Approved', ''),
(152, 1617600792, 'FCCMPC-0000056', 'SYR85G14OIPHA9L', 'UI94P61QSGXLWCZ', 1, 'Whien', 'Approved', 'OK'),
(153, 1617600805, 'FCCMPC-0000056', 'SYR85G14OIPHA9L', 'UI94P61QSGXLWCZ', 1, 'Salvie', 'Approved', 'ok'),
(154, 1617600819, 'FCCMPC-0000056', 'SYR85G14OIPHA9L', 'UI94P61QSGXLWCZ', 1, 'Tad', 'Approved', ''),
(155, 1617600894, 'FCCMPC-0000056', 'SYR85G14OIPHA9L', 'LWU2GAZ6HR51O0X', 2, 'Reygan', '', 'Disapprove'),
(156, 1617600917, 'FCCMPC-0000057', 'SYR85G14OIPHA9L', 'UI94P61QSGXLWCZ', 1, 'Minda', 'Approved', 'ok'),
(157, 1617601021, 'FCCMPC-0000057', 'SYR85G14OIPHA9L', 'UI94P61QSGXLWCZ', 1, 'Nitz', 'Approved', ''),
(158, 1617601055, 'FCCMPC-0000057', 'SYR85G14OIPHA9L', 'UI94P61QSGXLWCZ', 1, 'Whien', 'Approved', 'ok'),
(159, 1617601466, 'FCCMPC-0000050', 'SYR85G14OIPHA9L', 'FOES7XV8I35HYCG', 3, 'Ann', 'Approved', 'ok'),
(160, 1617601553, 'FCCMPC-0000050', 'SYR85G14OIPHA9L', 'IDQSR0BKEPO8CLH', 4, 'Jema', 'Approved', ''),
(161, 1617601560, 'FCCMPC-0000050', 'SYR85G14OIPHA9L', 'IDQSR0BKEPO8CLH', 4, 'yuya', 'Approved', 'OK'),
(162, 1617601632, 'FCCMPC-0000050', 'SYR85G14OIPHA9L', 'M9RXFWGI31NOQVC', 5, 'Gladys', 'Confirmed', ''),
(163, 1617601632, 'FCCMPC-0000050', 'SYR85G14OIPHA9L', 'M9RXFWGI31NOQVC', 5, 'Syra', 'Confirmed', ''),
(164, 1617601696, 'FCCMPC-0000050', 'SYR85G14OIPHA9L', 'M9RXFWGI31NOQVC', 5, 'Chardey', 'Confirmed', '');

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
(87, 'SYR85G14OIPHA9L', 'M9RXFWGI31NOQVC', 'FCCMPC-0000030', 5, 'E5KGHJ47DU1A,SAMWXPZ5N6OY,2G4KRSL1W6YI,E7SZRKNA1VB3,7OWC53Z02H4L', 'Confirmed', 1613791662, 'Gladys'),
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
(162, 'SYR85G14OIPHA9L', 'M9RXFWGI31NOQVC', 'FCCMPC-0000041', 5, 'SAMWXPZ5N6OY,2G4KRSL1W6YI', '', 0, ''),
(165, 'SYR85G14OIPHA9L', 'UI94P61QSGXLWCZ', 'FCCMPC-0000042', 1, 'FK6XL3P1WM2I', 'Approved', 1613790618, 'Sheila'),
(166, 'SYR85G14OIPHA9L', 'LWU2GAZ6HR51O0X', 'FCCMPC-0000042', 2, 'JZ0FV1MS4H9W', 'Approved', 1613790640, 'Reygan'),
(167, 'SYR85G14OIPHA9L', 'FOES7XV8I35HYCG', 'FCCMPC-0000042', 3, 'BSGDR8AYM1U7', 'Approved', 1613790691, 'Ann'),
(168, 'SYR85G14OIPHA9L', 'IDQSR0BKEPO8CLH', 'FCCMPC-0000042', 4, 'RX9MWFLHUY81', 'Approved', 1613790827, 'Jema'),
(169, 'SYR85G14OIPHA9L', 'M9RXFWGI31NOQVC', 'FCCMPC-0000042', 5, 'E5KGHJ47DU1A,SAMWXPZ5N6OY,2G4KRSL1W6YI,E7SZRKNA1VB3,7OWC53Z02H4L,YTUCS5ODF0N8', 'Confirmed', 1613791611, 'Chardey'),
(172, 'SYR85G14OIPHA9L', 'UI94P61QSGXLWCZ', 'FCCMPC-0000043', 1, 'FK6XL3P1WM2I', 'Approved', 1613792856, 'Sheila'),
(173, 'SYR85G14OIPHA9L', 'LWU2GAZ6HR51O0X', 'FCCMPC-0000043', 2, 'JZ0FV1MS4H9W', 'Approved', 1613792915, 'Reygan'),
(174, 'SYR85G14OIPHA9L', 'FOES7XV8I35HYCG', 'FCCMPC-0000043', 3, 'BSGDR8AYM1U7', 'Approved', 1613792967, 'Ann'),
(175, 'SYR85G14OIPHA9L', 'IDQSR0BKEPO8CLH', 'FCCMPC-0000043', 4, 'RX9MWFLHUY81', 'Approved', 1613793042, 'yuya'),
(176, 'SYR85G14OIPHA9L', 'M9RXFWGI31NOQVC', 'FCCMPC-0000043', 5, 'E5KGHJ47DU1A,SAMWXPZ5N6OY,2G4KRSL1W6YI,E7SZRKNA1VB3,7OWC53Z02H4L,NCV3ELWT0J64,YTUCS5ODF0N8', 'Confirmed', 1613793268, 'Chardey'),
(179, 'ZJVUOB63FMWCS9T', 'LWU2GAZ6HR51O0X', 'FCCMPC-0000044', 1, 'JZ0FV1MS4H9W', '', 0, ''),
(180, 'ZJVUOB63FMWCS9T', 'FOES7XV8I35HYCG', 'FCCMPC-0000044', 2, 'BSGDR8AYM1U7', '', 0, ''),
(181, 'ZJVUOB63FMWCS9T', 'IDQSR0BKEPO8CLH', 'FCCMPC-0000044', 3, 'RX9MWFLHUY81', '', 0, ''),
(182, 'ZJVUOB63FMWCS9T', 'M9RXFWGI31NOQVC', 'FCCMPC-0000044', 4, 'SAMWXPZ5N6OY,2G4KRSL1W6YI', '', 0, ''),
(186, 'SYR85G14OIPHA9L', 'UI94P61QSGXLWCZ', 'FCCMPC-0000045', 1, 'FK6XL3P1WM2I', 'Approved', 1614391237, 'Salvie'),
(187, 'SYR85G14OIPHA9L', 'LWU2GAZ6HR51O0X', 'FCCMPC-0000045', 2, 'JZ0FV1MS4H9W', 'Approved', 1614391304, 'Reygan'),
(188, 'SYR85G14OIPHA9L', 'FOES7XV8I35HYCG', 'FCCMPC-0000045', 3, 'BSGDR8AYM1U7', 'Approved', 1614391394, 'Ann'),
(189, 'SYR85G14OIPHA9L', 'IDQSR0BKEPO8CLH', 'FCCMPC-0000045', 4, 'RX9MWFLHUY81', 'Approved', 1614391836, 'yuya'),
(190, 'SYR85G14OIPHA9L', 'M9RXFWGI31NOQVC', 'FCCMPC-0000045', 5, '7OWC53Z02H4L,undefined', 'Confirmed', 1614392044, 'Chardey'),
(193, 'SYR85G14OIPHA9L', 'UI94P61QSGXLWCZ', 'FCCMPC-0000046', 1, 'FK6XL3P1WM2I', '', 0, ''),
(194, 'SYR85G14OIPHA9L', 'LWU2GAZ6HR51O0X', 'FCCMPC-0000046', 2, 'JZ0FV1MS4H9W', '', 0, ''),
(195, 'SYR85G14OIPHA9L', 'FOES7XV8I35HYCG', 'FCCMPC-0000046', 3, 'BSGDR8AYM1U7', '', 0, ''),
(196, 'SYR85G14OIPHA9L', 'IDQSR0BKEPO8CLH', 'FCCMPC-0000046', 4, 'RX9MWFLHUY81', '', 0, ''),
(197, 'SYR85G14OIPHA9L', 'M9RXFWGI31NOQVC', 'FCCMPC-0000046', 5, 'E7SZRKNA1VB3', '', 0, ''),
(198, 'SYR85G14OIPHA9L', 'UI94P61QSGXLWCZ', 'FCCMPC-0000047', 1, 'FK6XL3P1WM2I', 'Approved', 1617519640, 'Sheila'),
(199, 'SYR85G14OIPHA9L', 'LWU2GAZ6HR51O0X', 'FCCMPC-0000047', 2, 'JZ0FV1MS4H9W', '', 0, ''),
(200, 'SYR85G14OIPHA9L', 'FOES7XV8I35HYCG', 'FCCMPC-0000047', 3, 'E7SZRKNA1VB3', '', 0, ''),
(201, 'SYR85G14OIPHA9L', 'IDQSR0BKEPO8CLH', 'FCCMPC-0000047', 4, 'RX9MWFLHUY81', '', 0, ''),
(202, 'SYR85G14OIPHA9L', 'M9RXFWGI31NOQVC', 'FCCMPC-0000047', 5, 'E7SZRKNA1VB3', '', 0, ''),
(203, 'SYR85G14OIPHA9L', 'UI94P61QSGXLWCZ', 'FCCMPC-0000048', 1, 'FK6XL3P1WM2I', 'Approved', 1617588876, 'Tad'),
(204, 'SYR85G14OIPHA9L', 'LWU2GAZ6HR51O0X', 'FCCMPC-0000048', 2, 'JZ0FV1MS4H9W', 'Approved', 1617589114, 'Reygan'),
(205, 'SYR85G14OIPHA9L', 'FOES7XV8I35HYCG', 'FCCMPC-0000048', 3, 'BSGDR8AYM1U7', 'Approved', 1617595041, 'Ann'),
(206, 'SYR85G14OIPHA9L', 'IDQSR0BKEPO8CLH', 'FCCMPC-0000048', 4, 'RX9MWFLHUY81', 'Approved', 1617595308, 'Jema'),
(207, 'SYR85G14OIPHA9L', 'M9RXFWGI31NOQVC', 'FCCMPC-0000048', 5, 'E5KGHJ47DU1A,SAMWXPZ5N6OY,E7SZRKNA1VB3,7OWC53Z02H4L,NCV3ELWT0J64,YTUCS5ODF0N8,undefined', 'Confirmed', 1617595546, 'Chardey'),
(208, 'SYR85G14OIPHA9L', 'UI94P61QSGXLWCZ', 'FCCMPC-0000049', 1, 'FK6XL3P1WM2I', 'Approved', 1617589686, 'Whien'),
(209, 'SYR85G14OIPHA9L', 'LWU2GAZ6HR51O0X', 'FCCMPC-0000049', 2, 'JZ0FV1MS4H9W', 'Approved', 1617589744, 'Reygan'),
(210, 'SYR85G14OIPHA9L', 'FOES7XV8I35HYCG', 'FCCMPC-0000049', 3, 'BSGDR8AYM1U7', 'Approved', 1617594716, 'Ann'),
(211, 'SYR85G14OIPHA9L', 'IDQSR0BKEPO8CLH', 'FCCMPC-0000049', 4, 'RX9MWFLHUY81', 'Approved', 1617594841, 'Jema'),
(212, 'SYR85G14OIPHA9L', 'M9RXFWGI31NOQVC', 'FCCMPC-0000049', 5, 'SAMWXPZ5N6OY', 'Confirmed', 1617594993, 'Syra'),
(213, 'SYR85G14OIPHA9L', 'UI94P61QSGXLWCZ', 'FCCMPC-0000050', 1, 'FK6XL3P1WM2I', 'Approved', 1617599287, 'Whien'),
(214, 'SYR85G14OIPHA9L', 'LWU2GAZ6HR51O0X', 'FCCMPC-0000050', 2, 'JZ0FV1MS4H9W', 'Approved', 1617599367, 'Reygan'),
(215, 'SYR85G14OIPHA9L', 'FOES7XV8I35HYCG', 'FCCMPC-0000050', 3, 'BSGDR8AYM1U7', 'Approved', 1617601466, 'Ann'),
(216, 'SYR85G14OIPHA9L', 'IDQSR0BKEPO8CLH', 'FCCMPC-0000050', 4, 'RX9MWFLHUY81', 'Approved', 1617601560, 'yuya'),
(217, 'SYR85G14OIPHA9L', 'M9RXFWGI31NOQVC', 'FCCMPC-0000050', 5, 'E5KGHJ47DU1A,SAMWXPZ5N6OY,E7SZRKNA1VB3,7OWC53Z02H4L,NCV3ELWT0J64,YTUCS5ODF0N8,undefined', 'Confirmed', 1617601696, 'Chardey'),
(218, 'SYR85G14OIPHA9L', 'UI94P61QSGXLWCZ', 'FCCMPC-0000051', 1, 'FK6XL3P1WM2I', '', 0, ''),
(219, 'SYR85G14OIPHA9L', 'LWU2GAZ6HR51O0X', 'FCCMPC-0000051', 2, 'JZ0FV1MS4H9W', '', 0, ''),
(220, 'SYR85G14OIPHA9L', 'FOES7XV8I35HYCG', 'FCCMPC-0000051', 3, 'BSGDR8AYM1U7', '', 0, ''),
(221, 'SYR85G14OIPHA9L', 'IDQSR0BKEPO8CLH', 'FCCMPC-0000051', 4, 'RX9MWFLHUY81', '', 0, ''),
(222, 'SYR85G14OIPHA9L', 'M9RXFWGI31NOQVC', 'FCCMPC-0000051', 5, '2G4KRSL1W6YI', '', 0, ''),
(223, 'SYR85G14OIPHA9L', 'UI94P61QSGXLWCZ', 'FCCMPC-0000052', 1, 'FK6XL3P1WM2I', '', 0, ''),
(224, 'SYR85G14OIPHA9L', 'LWU2GAZ6HR51O0X', 'FCCMPC-0000052', 2, 'JZ0FV1MS4H9W', '', 0, ''),
(225, 'SYR85G14OIPHA9L', 'FOES7XV8I35HYCG', 'FCCMPC-0000052', 3, 'BSGDR8AYM1U7', '', 0, ''),
(226, 'SYR85G14OIPHA9L', 'IDQSR0BKEPO8CLH', 'FCCMPC-0000052', 4, 'RX9MWFLHUY81', '', 0, ''),
(227, 'SYR85G14OIPHA9L', 'M9RXFWGI31NOQVC', 'FCCMPC-0000052', 5, '2G4KRSL1W6YI', '', 0, ''),
(228, 'SYR85G14OIPHA9L', 'UI94P61QSGXLWCZ', 'FCCMPC-0000053', 1, 'FK6XL3P1WM2I', '', 0, ''),
(229, 'SYR85G14OIPHA9L', 'LWU2GAZ6HR51O0X', 'FCCMPC-0000053', 2, 'JZ0FV1MS4H9W', '', 0, ''),
(230, 'SYR85G14OIPHA9L', 'FOES7XV8I35HYCG', 'FCCMPC-0000053', 3, 'BSGDR8AYM1U7', '', 0, ''),
(231, 'SYR85G14OIPHA9L', 'IDQSR0BKEPO8CLH', 'FCCMPC-0000053', 4, 'RX9MWFLHUY81', '', 0, ''),
(232, 'SYR85G14OIPHA9L', 'M9RXFWGI31NOQVC', 'FCCMPC-0000053', 5, 'E7SZRKNA1VB3', '', 0, ''),
(233, 'SYR85G14OIPHA9L', 'UI94P61QSGXLWCZ', 'FCCMPC-0000054', 1, 'FK6XL3P1WM2I', '', 0, ''),
(234, 'SYR85G14OIPHA9L', 'LWU2GAZ6HR51O0X', 'FCCMPC-0000054', 2, 'JZ0FV1MS4H9W', '', 0, ''),
(235, 'SYR85G14OIPHA9L', 'FOES7XV8I35HYCG', 'FCCMPC-0000054', 3, 'BSGDR8AYM1U7', '', 0, ''),
(236, 'SYR85G14OIPHA9L', 'IDQSR0BKEPO8CLH', 'FCCMPC-0000054', 4, 'RX9MWFLHUY81', '', 0, ''),
(237, 'SYR85G14OIPHA9L', 'M9RXFWGI31NOQVC', 'FCCMPC-0000054', 5, '2G4KRSL1W6YI', '', 0, ''),
(238, 'SYR85G14OIPHA9L', 'UI94P61QSGXLWCZ', 'FCCMPC-0000055', 1, 'FK6XL3P1WM2I', '', 0, ''),
(239, 'SYR85G14OIPHA9L', 'LWU2GAZ6HR51O0X', 'FCCMPC-0000055', 2, 'JZ0FV1MS4H9W', '', 0, ''),
(240, 'SYR85G14OIPHA9L', 'FOES7XV8I35HYCG', 'FCCMPC-0000055', 3, 'BSGDR8AYM1U7', '', 0, ''),
(241, 'SYR85G14OIPHA9L', 'IDQSR0BKEPO8CLH', 'FCCMPC-0000055', 4, 'RX9MWFLHUY81', '', 0, ''),
(242, 'SYR85G14OIPHA9L', 'M9RXFWGI31NOQVC', 'FCCMPC-0000055', 5, '2G4KRSL1W6YI', '', 0, ''),
(243, 'SYR85G14OIPHA9L', 'UI94P61QSGXLWCZ', 'FCCMPC-0000056', 1, 'FK6XL3P1WM2I', 'Approved', 1617600819, 'Tad'),
(244, 'SYR85G14OIPHA9L', 'LWU2GAZ6HR51O0X', 'FCCMPC-0000056', 2, 'JZ0FV1MS4H9W', 'Disapproved', 1617600894, 'Reygan'),
(245, 'SYR85G14OIPHA9L', 'FOES7XV8I35HYCG', 'FCCMPC-0000056', 3, 'BSGDR8AYM1U7', '', 0, ''),
(246, 'SYR85G14OIPHA9L', 'IDQSR0BKEPO8CLH', 'FCCMPC-0000056', 4, 'RX9MWFLHUY81', '', 0, ''),
(247, 'SYR85G14OIPHA9L', 'M9RXFWGI31NOQVC', 'FCCMPC-0000056', 5, 'E5KGHJ47DU1A,SAMWXPZ5N6OY,2G4KRSL1W6YI,E7SZRKNA1VB3,7OWC53Z02H4L,NCV3ELWT0J64,YTUCS5ODF0N8', '', 0, ''),
(248, 'SYR85G14OIPHA9L', 'UI94P61QSGXLWCZ', 'FCCMPC-0000057', 1, 'FK6XL3P1WM2I', 'Approved', 1617601055, 'Whien'),
(249, 'SYR85G14OIPHA9L', 'LWU2GAZ6HR51O0X', 'FCCMPC-0000057', 2, 'JZ0FV1MS4H9W', '', 0, ''),
(250, 'SYR85G14OIPHA9L', 'FOES7XV8I35HYCG', 'FCCMPC-0000057', 3, 'BSGDR8AYM1U7', '', 0, ''),
(251, 'SYR85G14OIPHA9L', 'IDQSR0BKEPO8CLH', 'FCCMPC-0000057', 4, 'RX9MWFLHUY81', '', 0, ''),
(252, 'SYR85G14OIPHA9L', 'M9RXFWGI31NOQVC', 'FCCMPC-0000057', 5, 'E5KGHJ47DU1A,SAMWXPZ5N6OY,2G4KRSL1W6YI,E7SZRKNA1VB3,7OWC53Z02H4L,NCV3ELWT0J64,YTUCS5ODF0N8', '', 0, '');

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
(7, 'Ann', '$2y$10$k3hlKmlRjVeZoMgFv.7BbeQjb/p1Jt1JJGSpW8rkSFNamjvGom0Su', 'Ann', 'E.', 'Sorela', 'annalyn.sorela@yahoo.com', '', 'Approver,Implementor,DocAdmin,Administrator', '1', '2021-04-05 13:50:40.000000', '2021-01-14'),
(8, 'Reygan', '$2y$10$FzGBaZdAoQNds5Ku7AyLc.f5YAf2lqurB1HIlQ2jXcEuhokDTJ2X.', 'Reynaldo', 'A.', 'Gandionco', 'reygancoop@yahoo.com', '', 'Approver', '2', '2021-04-05 13:40:24.000000', '2021-01-14'),
(9, 'Nitz', '$2y$10$1Am653XI/IeXEZB3XxfM5Or.KjZ/reayYyjVzh7djabDz3BTEGUQ6', 'Nenita', 'N.', 'Ricaforte', 'hilberth01@yahoo.com', '', 'Approver', '3', '2021-04-05 13:38:12.000000', '2021-01-14'),
(10, 'Dux', '$2y$10$rFDL1Z813RHAy6kK.21qXOSC806Qz3v.QOO9JZEImdvpuj64stWSO', 'Dux', 'M. ', 'Samolde', 'dux_fairchildcoop@yahoo.com', '', 'Implementor', '9', '2021-04-05 14:08:48.000000', '2021-01-14'),
(11, 'Jema', '$2y$10$tkK9kusRfN0TIOfORhOEaODy3W3vjhlU3.uLUWoPtLFdoMwY2/6dO', 'Jema', 'T. ', 'Tibon', 'hilberth01@yahoo.com', '', 'Approver', '4', '2021-04-05 13:45:29.000000', '2021-01-14'),
(12, 'Hilberth', '$2y$10$zEDVnAhhA4sOl4cE3z3Ta.2E0HCMrs2Y4hlYR4zc6f8TTN91c.wqy', 'Hilberth', 'U.', 'Regala', 'hilberth01@yahoo.com', '', 'Approver,Implementor,DocAdmin,Administrator', '5', '2021-04-05 12:44:18.000000', '2021-01-14'),
(13, 'yuya', '$2y$10$kQHfQZVLhVjUycCZhRSBaug5rftbxS8Rn8xRJ4I18Vv8XCs4umN92', 'Philura', 'M.', 'Hipe', 'yujhipe@gmail.com', '', 'Approver,Implementor', '4', '2021-04-05 13:44:29.000000', '2021-01-16'),
(14, 'Christine', '$2y$10$IxOo84iwg4Q5TUhDM3EjkutZQJ4bYgW0sYUndtNB1unEyHx00Ky.e', 'Christine', 'T', 'Bajao', 'christinebajao.8894@gmail.com', '', 'Implementor', '5', '2021-02-12 11:19:27.000000', '2021-01-16'),
(15, 'Sheila', '$2y$10$5JFBQwKjAG0C0P.Roc93p.hiOkiArDnOm2YNFt/Zx/KLbAPVvdb3G', 'Sheila Marie', 'Booc', 'Beceril', 'annalyn.sorela@yahoo.com', '', 'Approver,Implementor,DocAdmin,Administrator', '1', '2021-04-05 13:31:15.000000', '2021-01-16'),
(16, 'Whien', '$2y$10$JjaOVVui673igavNyFJaFuyzNnjU.9pgKLjEsNNQgtbDJDPhPuj0.', 'Whiendelyn', 'L.', 'Enero', 'whiendelyn.enero@gmail.com', '', 'Approver', '7', '2021-04-05 13:37:05.000000', '2021-01-16'),
(17, 'Syra', '$2y$10$7Ptwzvfa9cbjDN8g.pqy4uNa9ldjXJTUxkFsgZyihNMoXDqFUe2uW', 'Syra Lee', 'M.', 'Lauron', 'annalyn.sorela@yahoo.com', 'female-user-icon-flat-style-long-shadow-transparent-b-background-130891875.jpg', 'Implementor', '1', '2021-04-05 13:58:12.000000', '2021-01-16'),
(18, 'JR', '$2y$10$bKwbv3MzHBAX2lQhCqQ8Te8V.yHMV3H4yY7sZGF0F/SdJZ7ZsKobC', 'Jhun Rey', 'P.', 'Amorganda', 'annalyn.sorela@yahoo.com', '', 'Implementor', '5', '2021-02-20 11:30:48.000000', '2021-01-16'),
(19, 'Salvie', '$2y$10$IBEiryxaizH2bjdp1WFfR.v3BvBfErwp70M/OQFYHvrQbdSdO0Pnq', 'Mary Salvie', 'S.', 'Abastas', 'annalyn.sorela@yahoo.com', '', 'Approver', '8', '2021-04-05 13:38:16.000000', '2021-01-16'),
(20, 'Annjy', '$2y$10$.N4yauM2TkoKi9ZopOuGJ.8VZAvyR3NRLyB9btMV8gGP/2kZFxEJ6', 'Ann Jaysa', 'O.', 'Tirol', 'annalyn.sorela@yahoo.com', '', 'Implementor', '8', '0000-00-00 00:00:00.000000', '2021-01-16'),
(21, 'Minda', '$2y$10$pfyMjEnsqIfgWvpTujmkFuOHoa7A5j2vtIY7sEMh5O./YN21QmN0e', 'Lusminda', 'L.', 'Buagas', 'annalyn.sorela@yahoo.com', '', 'Approver', '3', '2021-04-05 13:34:55.000000', '2021-01-16'),
(22, 'Chardey', '$2y$10$Oxv1iHROfc1Ua99kbk9Ox.lYd8CBTVaqc78pYjXTfDT2v65KbMl5i', 'Chardey', 'T.', 'Bermudez', 'annalyn.sorela@yahoo.com', '', 'Implementor', '8', '2021-04-05 13:48:00.000000', '2021-01-16'),
(23, 'Charisse', '$2y$10$Wp2lqz80G.pzC.VghLR0rula1obiQcYbxwdJv.KRlTdYTu2zctUxO', 'Charisse', 'E.', 'Menguito', 'annalyn.sorela@yahoo.com', '', 'Implementor', '9', '0000-00-00 00:00:00.000000', '2021-01-16'),
(24, 'Dimple', '$2y$10$/b259lNuQt2DcEGd.BK4OOnjG0QqqpM1RxZ6Z.TPSfevLOo7eZWYK', 'Rachelle Faye', 'H.', 'Molinos', 'dimps_molinos@yahoo.com', '', 'Implementor', '7', '2021-04-05 12:05:54.000000', '2021-01-16'),
(25, 'Sandy', '$2y$10$bnwTNgs390xnFiaCU9Kjluy/b1ioI0I/C9msuwivGREEcCRzj.UIa', 'Sandy', 'F.', 'Canoneo', 'annalyn.sorela@yahoo.com', '', 'Implementor', '7', '0000-00-00 00:00:00.000000', '2021-01-16'),
(26, 'Ailec', '$2y$10$8Foo/S.lOEhFbCbS5qFOhee3epOTLPVwhet7PQbwsHf1.JA.XfZve', 'Glicel Ann', 'A.', 'Abueva', 'annalyn.sorela@yahoo.com', '', 'Implementor', '3', '0000-00-00 00:00:00.000000', '2021-01-16'),
(27, 'Teo', '$2y$10$YYaS7z/PhiqPqv/fTO6PreVPVTyZyK.p5Srr9BlH9WNuce9lE5m4S', 'Teofredo', 'C.', 'Llido Jr.', 'teofredo.llido@gmail.com', '44c9f01e31ee327634f079cd15e7745b842e0d69_hq.gif', 'Implementor', '5', '2021-04-05 13:44:57.000000', '2021-01-16'),
(28, 'Jeaneth', '$2y$10$yA77EsBNkkmYJDmAwfhgpeTKUIwYnTR55E4UOb1/z3RsyabC8LLvi', 'Jeaneth', 'C.', 'Gaspan', 'annalyn.sorela@yahoo.com', '', 'Implementor', '7', '0000-00-00 00:00:00.000000', '2021-01-16'),
(29, 'Regina', '$2y$10$rqw7/erfIBQyKmcPulOsPu88H/i4gpkJZD/H6NUUKrc6Mg87775va', 'Regina Marie', 'E.', 'Suico', 'annalyn.sorela@yahoo.com', '', 'Implementor', '7', '0000-00-00 00:00:00.000000', '2021-01-16'),
(30, 'Mel', '$2y$10$LZTgRh74G9/aaH5zPOj5ZeXDsMTmoHHHrM38eB/GuHy8/GeTzTHwy', 'Melissa', 'A.', 'Paeres', 'annalyn.sorela@yahoo.com', '', 'Implementor', '7', '0000-00-00 00:00:00.000000', '2021-01-16'),
(31, 'Gladys', '$2y$10$evaSM/ZMmMhpjrRHQn386ergDL9nLdq5Wi9RIoRCKSLLfKHII06hS', 'Gladys', 'B.', 'Golosino', 'gladysgolosino1995@gmail.com', '139283268_1263639427333030_2812351458702102727_n.jpg', 'Implementor', '3', '2021-04-05 13:46:47.000000', '2021-01-16'),
(32, 'Rhina', '$2y$10$.i.lLfXuOgxQdimd/TxcouNsvjaPe.zhM7byd1eZ26.Z6K8PZ7gl6', 'Maria Clarina', 'A.', 'Cabadon', 'annalyn.sorela@yahoo.com', '', 'Implementor', '3', '0000-00-00 00:00:00.000000', '2021-01-16'),
(33, 'Tad', '$2y$10$Sjz0CZX3Mrln9Rg7Kl.Nwet5sgRfzoV5GMaO4U37byxyqr20WFhIS', 'Rudolph', 'C.', 'Montayre', 'annalyn.sorela@yahoo.com', '', 'Approver,Implementor', '5', '2021-04-05 13:38:16.000000', '2021-01-16'),
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
(1, 'E5KGHJ47DU1A', 'Loan Department Implementers', 'Loan Department', 'Gladys'),
(3, 'JZ0FV1MS4H9W', 'General Manager', 'General Manager', 'Reygan'),
(4, 'SAMWXPZ5N6OY', 'HR Dept  Implementers', 'Implementor', 'Syra'),
(5, 'RX9MWFLHUY81', 'Board of Directors', 'Approving Board', 'Jema,yuya'),
(6, 'XSRGUE3HKOYM', 'Audit', 'Audit', ''),
(7, 'FK6XL3P1WM2I', 'Department Heads', 'List of all department heads', 'Nitz,Sheila,Whien,Salvie,Minda,Tad'),
(8, 'BSGDR8AYM1U7', 'DCA Approver', 'Doccon Admin Approver', 'Ann'),
(9, '2G4KRSL1W6YI', 'IT Dept Implementers', 'IT Implementer', 'Christine,Teo'),
(10, 'E7SZRKNA1VB3', 'Business Dept Implementer', 'Business Implementer', 'JR'),
(11, '7OWC53Z02H4L', 'Collection Dept Implementers', 'Collection Dept ', 'Chardey'),
(12, 'X4AWYOUFMKSI', 'Knowles Branch Implementers', 'Knowles Branch', ''),
(13, 'NCV3ELWT0J64', 'Marketing & Membership Dept Im', 'Marketing & Membership Dept', 'Dux'),
(14, 'C7W1D0URZ9JK', 'Department Heads Implementers ', 'Department Heads ', 'Nitz,Sheila,Whien,Salvie,Minda,Tad'),
(15, 'YTUCS5ODF0N8', 'Accounting/Finance Dept Implem', 'Accounting Implementers', 'Dimple');

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
(3, 'M9RXFWGI31NOQVC', 'Implementers Conformance', 'E5KGHJ47DU1A,SAMWXPZ5N6OY,2G4KRSL1W6YI,E7SZRKNA1VB3,7OWC53Z02H4L,NCV3ELWT0J64,YTUCS5ODF0N8', 'Parallel', 'Concurrence', 3, 10, 'NA', 'NA', 'No', 'Yes'),
(4, 'UI94P61QSGXLWCZ', 'Department Head Approval', 'FK6XL3P1WM2I', 'Parallel', 'Approval', 3, 6, 'N/A', 'N/A', 'No', 'No'),
(5, 'FOES7XV8I35HYCG', 'DCA Approval', 'BSGDR8AYM1U7', 'Series', 'Approval', 10, 1, 'N/A', 'N/A', 'Yes', 'No'),
(6, 'IDQSR0BKEPO8CLH', 'BOD  Approval', 'RX9MWFLHUY81', 'Parallel', 'Approval', 3, 1, 'N/A', 'N/A', 'No', 'No'),
(7, 'TSX1UQP25VA0Z9J', 'KBOC Approval', 'X4AWYOUFMKSI', 'Parallel', 'Approval', 3, 1, 'N/A', 'N/A', '', ''),
(8, 'P8RASZ5I43DMN06', 'Department Head Implementers', 'FK6XL3P1WM2I', 'Parallel', 'Concurrence', 3, 3, 'N/A', 'N/A', 'No', 'No');

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
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=566;

--
-- AUTO_INCREMENT for table `fs_department`
--
ALTER TABLE `fs_department`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `fs_doc_viewer`
--
ALTER TABLE `fs_doc_viewer`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=63;

--
-- AUTO_INCREMENT for table `fs_request_approval`
--
ALTER TABLE `fs_request_approval`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=354;

--
-- AUTO_INCREMENT for table `fs_request_attachment`
--
ALTER TABLE `fs_request_attachment`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;

--
-- AUTO_INCREMENT for table `fs_request_main`
--
ALTER TABLE `fs_request_main`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=58;

--
-- AUTO_INCREMENT for table `fs_request_task_approver`
--
ALTER TABLE `fs_request_task_approver`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=165;

--
-- AUTO_INCREMENT for table `fs_request_task_status`
--
ALTER TABLE `fs_request_task_status`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=253;

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
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

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
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
