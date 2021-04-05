-- phpMyAdmin SQL Dump
-- version 5.0.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3308
-- Generation Time: Apr 05, 2021 at 12:41 PM
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

--
-- Indexes for dumped tables
--

--
-- Indexes for table `fs_request_main`
--
ALTER TABLE `fs_request_main`
  ADD PRIMARY KEY (`id`),
  ADD KEY `rq_id` (`rq_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `fs_request_main`
--
ALTER TABLE `fs_request_main`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=58;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
