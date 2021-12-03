-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               10.3.13-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win64
-- HeidiSQL Version:             9.5.0.5196
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Dumping database structure for oap
CREATE DATABASE IF NOT EXISTS `oap` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `oap`;

-- Dumping structure for table oap.assessments
CREATE TABLE IF NOT EXISTS `assessments` (
  `ASSESSMENT_ID` bigint(50) NOT NULL,
  `ASSESSMENT_NAME` varchar(300) DEFAULT NULL,
  `NO_QUESTIONS` int(30) DEFAULT NULL,
  `DURATION_PER_QUESTION` float DEFAULT NULL,
  `PASS_PERCENTAGE` varchar(10) DEFAULT NULL,
  `CREATED_BY` varchar(200) DEFAULT NULL,
  `MODIFIED_BY` varchar(200) DEFAULT NULL,
  `CREATED_DATE` datetime DEFAULT NULL,
  `MODIFIED_DATE` datetime DEFAULT NULL,
  PRIMARY KEY (`ASSESSMENT_ID`),
  KEY `FK_created_by` (`CREATED_BY`),
  KEY `FK_modified_by` (`MODIFIED_BY`),
  CONSTRAINT `FK_created_by` FOREIGN KEY (`CREATED_BY`) REFERENCES `sub_admins` (`EMP_EMAIL_ID`),
  CONSTRAINT `FK_modified_by` FOREIGN KEY (`MODIFIED_BY`) REFERENCES `sub_admins` (`EMP_EMAIL_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table oap.assessments: ~0 rows (approximately)
/*!40000 ALTER TABLE `assessments` DISABLE KEYS */;
/*!40000 ALTER TABLE `assessments` ENABLE KEYS */;

-- Dumping structure for table oap.assessment_results
CREATE TABLE IF NOT EXISTS `assessment_results` (
  `ASSESSMENT_ID` bigint(50) DEFAULT NULL,
  `EMP_EMAIL_ID` varchar(200) DEFAULT NULL,
  `QUESTION_ID` bigint(100) DEFAULT NULL,
  `SUBMITTED_ANSWER` text DEFAULT NULL,
  `RESULT` int(10) DEFAULT NULL,
  KEY `FK_assesment_id_results` (`ASSESSMENT_ID`),
  KEY `FK_question_id` (`QUESTION_ID`),
  CONSTRAINT `FK_assesment_id_results` FOREIGN KEY (`ASSESSMENT_ID`) REFERENCES `assessments` (`ASSESSMENT_ID`),
  CONSTRAINT `FK_question_id` FOREIGN KEY (`QUESTION_ID`) REFERENCES `questions` (`QUESTION_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table oap.assessment_results: ~0 rows (approximately)
/*!40000 ALTER TABLE `assessment_results` DISABLE KEYS */;
/*!40000 ALTER TABLE `assessment_results` ENABLE KEYS */;

-- Dumping structure for table oap.participant_users
CREATE TABLE IF NOT EXISTS `participant_users` (
  `EMP_ID` varchar(20) DEFAULT NULL,
  `EMP_NAME` varchar(100) DEFAULT NULL,
  `EMP_EMAIL_ID` varchar(200) DEFAULT NULL,
  `ASSESSMENT_ID` bigint(50) DEFAULT NULL,
  `SCHEDULE_STARTTIME` datetime DEFAULT NULL,
  `SCHEDULE_ENDTIME` datetime DEFAULT NULL,
  `SCORE` varchar(10) DEFAULT NULL,
  KEY `FK_assesment_id_partipant_users` (`ASSESSMENT_ID`),
  CONSTRAINT `FK_assesment_id_partipant_users` FOREIGN KEY (`ASSESSMENT_ID`) REFERENCES `assessments` (`ASSESSMENT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table oap.participant_users: ~0 rows (approximately)
/*!40000 ALTER TABLE `participant_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `participant_users` ENABLE KEYS */;

-- Dumping structure for table oap.questions
CREATE TABLE IF NOT EXISTS `questions` (
  `QUESTION_ID` bigint(100) NOT NULL,
  `ASSESSMENT_ID` bigint(50) NOT NULL,
  `SERIAL_NO` int(20) DEFAULT NULL,
  `QUESTION_TOPIC` varchar(300) DEFAULT NULL,
  `QUESTION_PROFICIENCY` varchar(100) DEFAULT NULL,
  `QUESTION` text DEFAULT NULL,
  `OPTION_1` text DEFAULT NULL,
  `OPTION_2` text DEFAULT NULL,
  `OPTION_3` text DEFAULT NULL,
  `OPTION_4` text DEFAULT NULL,
  `CORRECT_ANSWER` text DEFAULT NULL,
  PRIMARY KEY (`QUESTION_ID`),
  KEY `FK_assesment_id_questions` (`ASSESSMENT_ID`),
  CONSTRAINT `FK_assesment_id_questions` FOREIGN KEY (`ASSESSMENT_ID`) REFERENCES `assessments` (`ASSESSMENT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table oap.questions: ~0 rows (approximately)
/*!40000 ALTER TABLE `questions` DISABLE KEYS */;
/*!40000 ALTER TABLE `questions` ENABLE KEYS */;

-- Dumping structure for table oap.sub_admins
CREATE TABLE IF NOT EXISTS `sub_admins` (
  `EMP_ID` varchar(20) DEFAULT NULL,
  `EMP_NAME` varchar(100) DEFAULT NULL,
  `EMP_EMAIL_ID` varchar(200) NOT NULL,
  `COUNTRY` varchar(100) DEFAULT NULL,
  `FIRSTTIME_LOGGED` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`EMP_EMAIL_ID`),
  CONSTRAINT `FIRSTTIME_LOGGED` CHECK (`FIRSTTIME_LOGGED` = 0 | `FIRSTTIME_LOGGED` = 1)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table oap.sub_admins: ~2 rows (approximately)
/*!40000 ALTER TABLE `sub_admins` DISABLE KEYS */;
INSERT INTO `sub_admins` (`EMP_ID`, `EMP_NAME`, `EMP_EMAIL_ID`, `COUNTRY`, `FIRSTTIME_LOGGED`) VALUES
	('102', 'Amogha', 'amoghab@gmail.com', 'India', 1),
	('101', 'Amogha', 'amoghabandari@gmail.com', 'India', 0);
/*!40000 ALTER TABLE `sub_admins` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
