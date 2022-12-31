-- MySQL dump 10.13  Distrib 8.0.27, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: ohrms
-- ------------------------------------------------------
-- Server version	8.0.27

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `announcements`
--

DROP TABLE IF EXISTS `announcements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `announcements` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `announcementType` varchar(100) DEFAULT NULL,
  `title` varchar(80) DEFAULT NULL,
  `message` varchar(255) DEFAULT NULL,
  `startDate` date NOT NULL,
  `endDate` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `announcements`
--

LOCK TABLES `announcements` WRITE;
/*!40000 ALTER TABLE `announcements` DISABLE KEYS */;
/*!40000 ALTER TABLE `announcements` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `applicantprocessnotification`
--

DROP TABLE IF EXISTS `applicantprocessnotification`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `applicantprocessnotification` (
  `id` int NOT NULL AUTO_INCREMENT,
  `message` varchar(100) DEFAULT NULL,
  `status` varchar(45) DEFAULT NULL,
  `setDate` date DEFAULT NULL,
  `setTime` time DEFAULT NULL,
  `place` varchar(100) DEFAULT NULL,
  `dateTime` date DEFAULT NULL,
  `deliverTo` varchar(100) DEFAULT NULL,
  `fullName` varchar(100) DEFAULT NULL,
  `isRead` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `applicantprocessnotification`
--

LOCK TABLES `applicantprocessnotification` WRITE;
/*!40000 ALTER TABLE `applicantprocessnotification` DISABLE KEYS */;
INSERT INTO `applicantprocessnotification` VALUES (1,'Congratulation! You can now Proceed to Initial Interview','intialInterview','2022-01-09','09:00:00','STI Baliuag - Gil Carlos Street, Poblacion, Baliuag, 3006 Bulacan','2022-01-08','Manuel, Christian Reymond ','Delara, Julie','False'),(2,'Congratulation! You can now Proceed to Teaching Demo','teachingDemo','2022-01-09','09:00:00','STI Baliuag - Gil Carlos Street, Poblacion, Baliuag, 3006 Bulacan','2022-01-08','Manuel, Christian Reymond ','Delara, Julie','False'),(3,'Congratulation! You can now Proceed to Final Interview','finalInterview','2022-01-09','09:00:00','STI Baliuag - Gil Carlos Street, Poblacion, Baliuag, 3006 Bulacan','2022-01-08','Manuel, Christian Reymond ','Delara, Julie','False'),(4,'Congratulation! You are now Hired as Employee of STI College Baliuag','','2022-01-14','09:00:00','STI Baliuag - Gil Carlos Street, Poblacion, Baliuag, 3006 Bulacan','2022-01-08','Manuel, Christian Reymond ','Delara, Julie','False'),(5,'Congratulation! You can now Proceed to Initial Interview','intialInterview','2022-01-09','09:00:00','STI Baliuag - Gil Carlos Street, Poblacion, Baliuag, 3006 Bulacan','2022-01-08','Dela Cruz, Juan ','Delara, Julie','False'),(6,'Congratulation! You can now Proceed to Teaching Demo','teachingDemo','2022-01-09','09:00:00','STI Baliuag - Gil Carlos Street, Poblacion, Baliuag, 3006 Bulacan','2022-01-08','Dela Cruz, Juan ','Delara, Julie','False'),(7,'Congratulation! You can now Proceed to Examination','examination','2022-01-09','09:00:00','STI Baliuag - Gil Carlos Street, Poblacion, Baliuag, 3006 Bulacan','2022-01-08','Dela Cruz, Juan ','Delara, Julie','False'),(8,'Congratulation! You can now Proceed to Final Interview','finalInterview','2022-01-09','09:00:00','STI Baliuag - Gil Carlos Street, Poblacion, Baliuag, 3006 Bulacan','2022-01-08','Dela Cruz, Juan ','Delara, Julie','False'),(9,'Congratulation! You are now Hired as Employee of STI College Baliuag','','2022-01-09','09:00:00','STI Baliuag - Gil Carlos Street, Poblacion, Baliuag, 3006 Bulacan','2022-01-08','Dela Cruz, Juan ','Delara, Julie','False'),(10,'Congratulation! You can now Proceed to Initial Interview','intialInterview','2022-01-09','09:00:00','STI Baliuag - Gil Carlos Street, Poblacion, Baliuag, 3006 Bulacan','2022-01-08','Vidad, Soledad ','Delara, Julie','False'),(11,'Congratulation! You can now Proceed to Teaching Demo','teachingDemo','2022-01-09','09:00:00','STI Baliuag - Gil Carlos Street, Poblacion, Baliuag, 3006 Bulacan','2022-01-08','Vidad, Soledad ','Delara, Julie','False'),(12,'Congratulation! You can now Proceed to Examination','examination','2022-01-09','09:00:00','STI Baliuag - Gil Carlos Street, Poblacion, Baliuag, 3006 Bulacan','2022-01-08','Vidad, Soledad ','Delara, Julie','False'),(13,'Congratulation! You can now Proceed to Final Interview','finalInterview','2022-01-09','09:00:00','STI Baliuag - Gil Carlos Street, Poblacion, Baliuag, 3006 Bulacan','2022-01-08','Vidad, Soledad ','Delara, Julie','False'),(14,'Congratulation! You are now Hired as Employee of STI College Baliuag','','2022-01-09','09:00:00','STI Baliuag - Gil Carlos Street, Poblacion, Baliuag, 3006 Bulacan','2022-01-08','Vidad, Soledad ','Delara, Julie','False');
/*!40000 ALTER TABLE `applicantprocessnotification` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `applicants`
--

DROP TABLE IF EXISTS `applicants`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `applicants` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `lastModifiedDate` datetime DEFAULT CURRENT_TIMESTAMP,
  `isActive` bit(1) DEFAULT b'1',
  `firstName` varchar(50) NOT NULL,
  `lastName` varchar(50) NOT NULL,
  `middleName` varchar(50) DEFAULT NULL,
  `fullName` varchar(150) NOT NULL,
  `appliedPosition` varchar(100) NOT NULL,
  `attachedResume` varchar(100) NOT NULL,
  `intialInterview` varchar(6) DEFAULT '',
  `intialInterviewDate` date DEFAULT NULL,
  `intialInterviewTime` time DEFAULT NULL,
  `intialInterviewPlace` varchar(100) DEFAULT '',
  `teachingDemo` varchar(6) DEFAULT '',
  `teachingDemoDate` date DEFAULT NULL,
  `teachingDemoTime` time DEFAULT NULL,
  `teachingDemoPlace` varchar(100) DEFAULT '',
  `examination` varchar(6) DEFAULT '',
  `examinationDate` date DEFAULT NULL,
  `examinationTime` time DEFAULT NULL,
  `examinationPlace` varchar(100) DEFAULT '',
  `finalInterview` varchar(6) DEFAULT '',
  `finalInterviewDate` date DEFAULT NULL,
  `finalInterviewTime` time DEFAULT NULL,
  `finalInterviewPlace` varchar(100) DEFAULT '',
  `status` varchar(15) DEFAULT '',
  `email` varchar(100) DEFAULT '',
  `createdDate` datetime DEFAULT CURRENT_TIMESTAMP,
  `hiredDate` datetime DEFAULT NULL,
  `rejectedDate` datetime DEFAULT NULL,
  `postedJobReferenceId` bigint DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `applicants`
--

LOCK TABLES `applicants` WRITE;
/*!40000 ALTER TABLE `applicants` DISABLE KEYS */;
INSERT INTO `applicants` VALUES (1,'2022-01-08 15:30:42',_binary '','Christian Reymond','Manuel','','Manuel, Christian Reymond ','Clerk','0b6d10c9fcdc4cd1a97c19a690fab9f6.pdf','Passed','2022-01-10','09:00:00','STI Baliuag - Gil Carlos Street, Poblacion, Baliuag, 3006 Bulacan','','2022-01-13','09:00:00','STI Baliuag - Gil Carlos Street, Poblacion, Baliuag, 3006 Bulacan','Passed',NULL,NULL,'','Passed','2022-01-14','09:00:00','STI Baliuag - Gil Carlos Street, Poblacion, Baliuag, 3006 Bulacan','HIRED','christianreymanuel23@gmail.com','2022-01-08 15:30:42','2022-01-08 15:31:22',NULL,3),(2,'2022-01-08 16:21:48',_binary '','Juan','Dela Cruz','','Dela Cruz, Juan ','Instructor','ac9912dd0c8445959f0e836c7a5c143a.pdf','Passed','2022-01-09','09:00:00','STI Baliuag - Gil Carlos Street, Poblacion, Baliuag, 3006 Bulacan','Passed','2022-01-09','09:00:00','STI Baliuag - Gil Carlos Street, Poblacion, Baliuag, 3006 Bulacan','Passed','2022-01-09','09:00:00','STI Baliuag - Gil Carlos Street, Poblacion, Baliuag, 3006 Bulacan','Passed','2022-01-09','09:00:00','STI Baliuag - Gil Carlos Street, Poblacion, Baliuag, 3006 Bulacan','HIRED','xenada3886@veb34.com','2022-01-08 16:21:48','2022-01-08 16:22:35',NULL,1),(3,'2022-01-08 23:31:14',_binary '','Soledad','Vidad','','Vidad, Soledad ','Instructor','7558af2f1a40437dba04f65e85f95581.pdf','Passed','2022-01-09','09:00:00','STI Baliuag - Gil Carlos Street, Poblacion, Baliuag, 3006 Bulacan','Passed','2022-01-09','09:00:00','STI Baliuag - Gil Carlos Street, Poblacion, Baliuag, 3006 Bulacan','Passed','2022-01-09','09:00:00','STI Baliuag - Gil Carlos Street, Poblacion, Baliuag, 3006 Bulacan','Passed','2022-01-09','09:00:00','STI Baliuag - Gil Carlos Street, Poblacion, Baliuag, 3006 Bulacan','HIRED','vidadsoledad@gmail.com','2022-01-08 23:31:14','2022-01-08 23:31:51',NULL,1);
/*!40000 ALTER TABLE `applicants` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `autonumbers`
--

DROP TABLE IF EXISTS `autonumbers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `autonumbers` (
  `id` int NOT NULL AUTO_INCREMENT,
  `lastModifiedDate` datetime DEFAULT CURRENT_TIMESTAMP,
  `isActive` bit(1) DEFAULT b'1',
  `prefix` varchar(10) DEFAULT NULL,
  `suffix` varchar(10) DEFAULT NULL,
  `currentSequence` int DEFAULT '0',
  `zeroPadding` int DEFAULT '0',
  `displaySequence` varchar(100) DEFAULT NULL,
  `groupType` varchar(80) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `autonumbers`
--

LOCK TABLES `autonumbers` WRITE;
/*!40000 ALTER TABLE `autonumbers` DISABLE KEYS */;
INSERT INTO `autonumbers` VALUES (1,'2022-01-08 23:40:16',_binary '','BLG','F',3,4,'BLG0003F','EMPLOYEE NO');
/*!40000 ALTER TABLE `autonumbers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `certificateemploymentrequest`
--

DROP TABLE IF EXISTS `certificateemploymentrequest`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `certificateemploymentrequest` (
  `id` int NOT NULL AUTO_INCREMENT,
  `lastModifiedDate` datetime DEFAULT CURRENT_TIMESTAMP,
  `isActive` bit(1) DEFAULT b'1',
  `employeeNo` varchar(25) DEFAULT NULL,
  `employeeName` varchar(100) DEFAULT NULL,
  `department` varchar(45) DEFAULT NULL,
  `purpose` varchar(1000) DEFAULT NULL,
  `salaryRate` decimal(10,2) DEFAULT NULL,
  `prescribeAquireDate` datetime DEFAULT CURRENT_TIMESTAMP,
  `coeType` varchar(25) DEFAULT NULL,
  `status` varchar(20) DEFAULT NULL,
  `isPrinted` bit(1) DEFAULT b'1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `certificateemploymentrequest`
--

LOCK TABLES `certificateemploymentrequest` WRITE;
/*!40000 ALTER TABLE `certificateemploymentrequest` DISABLE KEYS */;
INSERT INTO `certificateemploymentrequest` VALUES (1,'2022-01-08 15:51:45',_binary '','BLG0001F','Manuel, Christian Reymond ',NULL,'Car Loan',20000.00,'2022-01-10 00:00:00','MULTI PURPOSE','APPROVED',_binary ''),(2,'2022-01-09 01:27:39',_binary '','BLG0003P','Vidad, Soledad ','Business Administration','Car Loan',200.00,'2022-01-12 00:00:00','MULTI PURPOSE','APPROVED',_binary ''),(3,'2022-01-10 10:52:59',_binary '','BLG0003P','Vidad, Soledad ','Business Administration','House Loan',200.00,'2022-01-13 00:00:00','MULTI PURPOSE','APPROVED',_binary '');
/*!40000 ALTER TABLE `certificateemploymentrequest` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `certificates`
--

DROP TABLE IF EXISTS `certificates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `certificates` (
  `employeeId` varchar(50) DEFAULT NULL,
  `typeCertification` varchar(50) DEFAULT NULL,
  `institution` varchar(50) DEFAULT NULL,
  `inclusiveDates` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `certificates`
--

LOCK TABLES `certificates` WRITE;
/*!40000 ALTER TABLE `certificates` DISABLE KEYS */;
/*!40000 ALTER TABLE `certificates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `children`
--

DROP TABLE IF EXISTS `children`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `children` (
  `id` int NOT NULL AUTO_INCREMENT,
  `employeeId` varchar(50) DEFAULT NULL,
  `childrenName` varchar(100) DEFAULT NULL,
  `childrenAge` int DEFAULT NULL,
  `childrenOccupation` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `children`
--

LOCK TABLES `children` WRITE;
/*!40000 ALTER TABLE `children` DISABLE KEYS */;
/*!40000 ALTER TABLE `children` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `coedetails`
--

DROP TABLE IF EXISTS `coedetails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `coedetails` (
  `id` int NOT NULL AUTO_INCREMENT,
  `employeeNo` varchar(50) DEFAULT NULL,
  `fullName` varchar(100) DEFAULT NULL,
  `dateHired` date DEFAULT NULL,
  `dateRequest` date DEFAULT NULL,
  `status` varchar(15) DEFAULT NULL,
  `dateCreated` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `coedetails`
--

LOCK TABLES `coedetails` WRITE;
/*!40000 ALTER TABLE `coedetails` DISABLE KEYS */;
/*!40000 ALTER TABLE `coedetails` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `departments`
--

DROP TABLE IF EXISTS `departments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `departments` (
  `id` int NOT NULL AUTO_INCREMENT,
  `lastModifiedDate` datetime DEFAULT CURRENT_TIMESTAMP,
  `isActive` bit(1) DEFAULT b'1',
  `classificationName` varchar(30) NOT NULL,
  `departmentName` varchar(80) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `departments`
--

LOCK TABLES `departments` WRITE;
/*!40000 ALTER TABLE `departments` DISABLE KEYS */;
INSERT INTO `departments` VALUES (1,'2022-01-08 15:20:25',_binary '','Teaching','Information Technology'),(2,'2022-01-08 15:20:32',_binary '','Teaching','Business Administration'),(3,'2022-01-08 15:20:44',_binary '','Non-Teaching','Human resource'),(4,'2022-01-08 18:30:48',_binary '','Non-Teaching','Operations');
/*!40000 ALTER TABLE `departments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `details`
--

DROP TABLE IF EXISTS `details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `details` (
  `employeeNo` varchar(50) NOT NULL,
  `lastName` varchar(25) DEFAULT NULL,
  `firstName` varchar(25) DEFAULT NULL,
  `middleName` varchar(25) DEFAULT NULL,
  `fullName` varchar(100) DEFAULT NULL,
  `department` varchar(50) DEFAULT NULL,
  `position` varchar(50) DEFAULT NULL,
  `classification` varchar(50) DEFAULT NULL,
  `rankEmployee` varchar(50) DEFAULT NULL,
  `salaryRate` varchar(50) DEFAULT NULL,
  `dateAppointment` date DEFAULT NULL,
  `statusOfEmployement` varchar(50) DEFAULT NULL,
  `newDateAppointment` date DEFAULT NULL,
  `newDepartment` varchar(50) DEFAULT NULL,
  `newPosition` varchar(50) DEFAULT NULL,
  `dateSeparation` date DEFAULT NULL,
  `natureOfSeparation` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`employeeNo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `details`
--

LOCK TABLES `details` WRITE;
/*!40000 ALTER TABLE `details` DISABLE KEYS */;
/*!40000 ALTER TABLE `details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `educationalbackground`
--

DROP TABLE IF EXISTS `educationalbackground`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `educationalbackground` (
  `id` int NOT NULL AUTO_INCREMENT,
  `fullName` varchar(100) DEFAULT NULL,
  `employeeId` varchar(50) DEFAULT NULL,
  `elementaryName` varchar(100) DEFAULT NULL,
  `elementaryCourse` varchar(100) DEFAULT NULL,
  `elementaryDate` varchar(100) DEFAULT NULL,
  `elementaryAward` varchar(100) DEFAULT NULL,
  `highSchoolName` varchar(100) DEFAULT NULL,
  `highSchoolCourse` varchar(100) DEFAULT NULL,
  `highSchoolDate` varchar(100) DEFAULT NULL,
  `highSchoolAward` varchar(100) DEFAULT NULL,
  `vocationalName` varchar(100) DEFAULT NULL,
  `vocationalCourse` varchar(100) DEFAULT NULL,
  `vocationalDate` varchar(100) DEFAULT NULL,
  `vocationalAward` varchar(100) DEFAULT NULL,
  `bachelorsName` varchar(100) DEFAULT NULL,
  `bachelorsCourse` varchar(100) DEFAULT NULL,
  `bachelorsDate` varchar(100) DEFAULT NULL,
  `bachelorsAward` varchar(100) DEFAULT NULL,
  `mastersName` varchar(100) DEFAULT NULL,
  `mastersCourse` varchar(100) DEFAULT NULL,
  `mastersDate` varchar(100) DEFAULT NULL,
  `mastersAward` varchar(100) DEFAULT NULL,
  `doctorsName` varchar(100) DEFAULT NULL,
  `doctorsCourse` varchar(100) DEFAULT NULL,
  `doctorsDate` varchar(100) DEFAULT NULL,
  `doctorsAward` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `educationalbackground`
--

LOCK TABLES `educationalbackground` WRITE;
/*!40000 ALTER TABLE `educationalbackground` DISABLE KEYS */;
INSERT INTO `educationalbackground` VALUES (1,'School, Bustos Elementary','APPLICANT','Bustos Elementary School','Primary','2008','N/A','Holy Child','Secondary','2014','N/A',NULL,NULL,NULL,NULL,'BSU','BSED','2018','N/A',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `educationalbackground` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `eligibility`
--

DROP TABLE IF EXISTS `eligibility`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `eligibility` (
  `id` int NOT NULL AUTO_INCREMENT,
  `employeeId` varchar(50) DEFAULT NULL,
  `typeLicense` varchar(50) DEFAULT NULL,
  `licenseNo` varchar(50) DEFAULT NULL,
  `dateValid` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eligibility`
--

LOCK TABLES `eligibility` WRITE;
/*!40000 ALTER TABLE `eligibility` DISABLE KEYS */;
/*!40000 ALTER TABLE `eligibility` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employeebatchscheduleplans`
--

DROP TABLE IF EXISTS `employeebatchscheduleplans`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employeebatchscheduleplans` (
  `id` int NOT NULL AUTO_INCREMENT,
  `batchId` varchar(100) NOT NULL,
  `uploadedBy` varchar(150) NOT NULL,
  `isActive` bit(1) DEFAULT b'1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employeebatchscheduleplans`
--

LOCK TABLES `employeebatchscheduleplans` WRITE;
/*!40000 ALTER TABLE `employeebatchscheduleplans` DISABLE KEYS */;
/*!40000 ALTER TABLE `employeebatchscheduleplans` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employeedetails`
--

DROP TABLE IF EXISTS `employeedetails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employeedetails` (
  `employeeNo` varchar(50) NOT NULL,
  `lastName` varchar(25) DEFAULT NULL,
  `firstName` varchar(25) DEFAULT NULL,
  `middleName` varchar(25) DEFAULT NULL,
  `fullName` varchar(100) DEFAULT NULL,
  `department` varchar(50) DEFAULT NULL,
  `position` varchar(50) DEFAULT NULL,
  `classification` varchar(50) DEFAULT NULL,
  `rankEmployee` varchar(50) DEFAULT NULL,
  `salaryRate` varchar(50) DEFAULT NULL,
  `points` int DEFAULT NULL,
  `dateAppointment` date DEFAULT NULL,
  `statusOfEmployement` varchar(50) DEFAULT NULL,
  `employmentType` varchar(50) DEFAULT NULL,
  `newDateAppointment` date DEFAULT NULL,
  `newDepartment` varchar(50) DEFAULT NULL,
  `newPosition` varchar(50) DEFAULT NULL,
  `dateSeparation` date DEFAULT NULL,
  `natureOfSeparation` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`employeeNo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employeedetails`
--

LOCK TABLES `employeedetails` WRITE;
/*!40000 ALTER TABLE `employeedetails` DISABLE KEYS */;
INSERT INTO `employeedetails` VALUES ('BLG0001F','Manuel','Christian Reymond','Vidad','Manuel, Christian Reymond Vidad','Human resource','Clerk','Non-Teaching','N/A','20000',0,'2022-01-08','Probationary','Full Time','2022-01-08',NULL,NULL,'0001-01-01',NULL),('BLG0002P','Dela Cruz','Juan','','Dela Cruz, Juan','Business Administration','Program Head','Teaching','Assistant Professor','200',40,'2022-01-08','Probationary','Part Time','2022-01-08',NULL,NULL,'0001-01-01',NULL),('BLG0003P','Vidad','Soledad','','Vidad, Soledad','Business Administration','Instructor','Teaching','Associate Professor','250.00',40,'2022-01-08','Probationary','Part Time','2022-01-08',NULL,NULL,'0001-01-01',NULL);
/*!40000 ALTER TABLE `employeedetails` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employeefiles`
--

DROP TABLE IF EXISTS `employeefiles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employeefiles` (
  `id` int NOT NULL AUTO_INCREMENT,
  `employeeNo` varchar(50) DEFAULT NULL,
  `employeeName` varchar(100) DEFAULT NULL,
  `resume` varchar(1000) DEFAULT NULL,
  `resumeDate` date DEFAULT NULL,
  `diploma` varchar(1000) DEFAULT NULL,
  `diplomaDate` date DEFAULT NULL,
  `tor` varchar(1000) DEFAULT NULL,
  `torDate` date DEFAULT NULL,
  `certificates` varchar(1000) DEFAULT NULL,
  `certificatesDate` date DEFAULT NULL,
  `coe` varchar(1000) DEFAULT NULL,
  `coeDate` date DEFAULT NULL,
  `ctc` varchar(1000) DEFAULT NULL,
  `ctcDate` date DEFAULT NULL,
  `sssId` varchar(1000) DEFAULT NULL,
  `sssIdDate` date DEFAULT NULL,
  `philHealthId` varchar(1000) DEFAULT NULL,
  `philHealthIdDate` date DEFAULT NULL,
  `pagIbigId` varchar(1000) DEFAULT NULL,
  `pagIbigIdDate` date DEFAULT NULL,
  `tinId` varchar(1000) DEFAULT NULL,
  `tinIdDate` date DEFAULT NULL,
  `medicalResult` varchar(1000) DEFAULT NULL,
  `medicalResultDate` date DEFAULT NULL,
  `healthId` varchar(1000) DEFAULT NULL,
  `healthIdDate` date DEFAULT NULL,
  `dateCompleted` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employeefiles`
--

LOCK TABLES `employeefiles` WRITE;
/*!40000 ALTER TABLE `employeefiles` DISABLE KEYS */;
/*!40000 ALTER TABLE `employeefiles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employeeleavecredits`
--

DROP TABLE IF EXISTS `employeeleavecredits`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employeeleavecredits` (
  `id` int NOT NULL AUTO_INCREMENT,
  `employeeNo` varchar(25) NOT NULL,
  `leaveTypeCode` varchar(10) NOT NULL,
  `usedCredits` int DEFAULT '0',
  `aquiredCredits` int DEFAULT '0',
  `lastUsedCreditReset` datetime DEFAULT CURRENT_TIMESTAMP,
  `lastModifiedDate` datetime DEFAULT CURRENT_TIMESTAMP,
  `isActive` bit(1) NOT NULL DEFAULT b'1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employeeleavecredits`
--

LOCK TABLES `employeeleavecredits` WRITE;
/*!40000 ALTER TABLE `employeeleavecredits` DISABLE KEYS */;
INSERT INTO `employeeleavecredits` VALUES (1,'BLG0003P','SL',9,10,'2022-01-09 00:01:27','2022-01-10 10:55:57',_binary '');
/*!40000 ALTER TABLE `employeeleavecredits` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employeenotes`
--

DROP TABLE IF EXISTS `employeenotes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employeenotes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `EmployeeNumber` varchar(50) NOT NULL,
  `title` varchar(100) NOT NULL,
  `message` varchar(255) NOT NULL,
  `isActive` bit(1) DEFAULT b'1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employeenotes`
--

LOCK TABLES `employeenotes` WRITE;
/*!40000 ALTER TABLE `employeenotes` DISABLE KEYS */;
/*!40000 ALTER TABLE `employeenotes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employeeresignationapplications`
--

DROP TABLE IF EXISTS `employeeresignationapplications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employeeresignationapplications` (
  `id` int NOT NULL AUTO_INCREMENT,
  `employeeNo` varchar(25) DEFAULT NULL,
  `employeeName` varchar(100) DEFAULT NULL,
  `deliverTo` varchar(50) DEFAULT NULL,
  `message` varchar(1000) DEFAULT NULL,
  `effectivityDate` date DEFAULT NULL,
  `modifiedDate` date DEFAULT NULL,
  `status` varchar(20) DEFAULT NULL,
  `approver` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employeeresignationapplications`
--

LOCK TABLES `employeeresignationapplications` WRITE;
/*!40000 ALTER TABLE `employeeresignationapplications` DISABLE KEYS */;
/*!40000 ALTER TABLE `employeeresignationapplications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employeescheduleplans`
--

DROP TABLE IF EXISTS `employeescheduleplans`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employeescheduleplans` (
  `id` int NOT NULL AUTO_INCREMENT,
  `employeeNumber` varchar(150) NOT NULL,
  `subjectName` varchar(255) DEFAULT NULL,
  `dayOfWeekNo` int NOT NULL,
  `dayOfWeekName` varchar(15) DEFAULT NULL,
  `periodFrom` time NOT NULL,
  `periodTo` time NOT NULL,
  `section` varchar(30) DEFAULT NULL,
  `originalFileName` varchar(255) NOT NULL,
  `uploadFileName` varchar(255) NOT NULL,
  `uploadedDate` datetime NOT NULL,
  `isLocked` bit(1) DEFAULT b'0',
  `isActive` bit(1) DEFAULT b'1',
  `schoolYear` int DEFAULT '0',
  `semisterBatch` varchar(10) DEFAULT 'FIRST',
  `semisterStartDate` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employeescheduleplans`
--

LOCK TABLES `employeescheduleplans` WRITE;
/*!40000 ALTER TABLE `employeescheduleplans` DISABLE KEYS */;
INSERT INTO `employeescheduleplans` VALUES (1,'BLG0001F',NULL,1,'Monday','08:00:00','18:00:00',NULL,'-','-','2022-01-08 15:53:11',_binary '\0',_binary '',0,'FIRST',NULL),(2,'BLG0001F',NULL,2,'Tuesday','08:00:00','18:00:00',NULL,'-','-','2022-01-08 15:53:11',_binary '\0',_binary '',0,'FIRST',NULL),(3,'BLG0001F',NULL,3,'Wednesday','08:00:00','18:00:00',NULL,'-','-','2022-01-08 15:53:11',_binary '\0',_binary '',0,'FIRST',NULL),(4,'BLG0001F',NULL,4,'Thursday','08:00:00','18:00:00',NULL,'-','-','2022-01-08 15:53:11',_binary '\0',_binary '',0,'FIRST',NULL),(5,'BLG0001F',NULL,5,'Friday','08:00:00','18:00:00',NULL,'-','-','2022-01-08 15:53:11',_binary '\0',_binary '',0,'FIRST',NULL),(6,'BLG0002P','Readings in Philippine History',1,'Monday','08:00:00','09:00:00',NULL,'Schedule (1).xlsx','3804c7d5bd2b45198bffe5373d4f8fe2.xlsx','2022-01-08 16:25:06',_binary '\0',_binary '',2021,'FIRST','2021-08-10'),(7,'BLG0002P','Computer Programming',1,'Monday','09:00:00','12:00:00',NULL,'Schedule (1).xlsx','3804c7d5bd2b45198bffe5373d4f8fe2.xlsx','2022-01-08 16:25:06',_binary '\0',_binary '',2021,'FIRST','2021-08-10'),(8,'BLG0002P','Art Appreciation',1,'Monday','13:00:00','15:00:00',NULL,'Schedule (1).xlsx','3804c7d5bd2b45198bffe5373d4f8fe2.xlsx','2022-01-08 16:25:06',_binary '\0',_binary '',2021,'FIRST','2021-08-10'),(9,'BLG0002P','Principles of Communication',1,'Monday','15:00:00','16:30:00',NULL,'Schedule (1).xlsx','3804c7d5bd2b45198bffe5373d4f8fe2.xlsx','2022-01-08 16:25:06',_binary '\0',_binary '',2021,'FIRST','2021-08-10'),(10,'BLG0002P','Computer Programming',2,'Tuesday','09:00:00','10:30:00',NULL,'Schedule (1).xlsx','3804c7d5bd2b45198bffe5373d4f8fe2.xlsx','2022-01-08 16:25:06',_binary '\0',_binary '',2021,'FIRST','2021-08-10'),(11,'BLG0002P','Art Appreciation',2,'Tuesday','13:00:00','14:30:00',NULL,'Schedule (1).xlsx','3804c7d5bd2b45198bffe5373d4f8fe2.xlsx','2022-01-08 16:25:06',_binary '\0',_binary '',2021,'FIRST','2021-08-10'),(12,'BLG0002P','Principles of Communication',2,'Tuesday','15:30:00','17:00:00',NULL,'Schedule (1).xlsx','3804c7d5bd2b45198bffe5373d4f8fe2.xlsx','2022-01-08 16:25:06',_binary '\0',_binary '',2021,'FIRST','2021-08-10'),(13,'BLG0002P','Art Appreciation',3,'Wednesday','08:30:00','10:00:00',NULL,'Schedule (1).xlsx','3804c7d5bd2b45198bffe5373d4f8fe2.xlsx','2022-01-08 16:25:06',_binary '\0',_binary '',2021,'FIRST','2021-08-10'),(14,'BLG0002P','System Admin and Maintenance',3,'Wednesday','10:00:00','12:00:00',NULL,'Schedule (1).xlsx','3804c7d5bd2b45198bffe5373d4f8fe2.xlsx','2022-01-08 16:25:06',_binary '\0',_binary '',2021,'FIRST','2021-08-10'),(15,'BLG0002P','Euthenics',3,'Wednesday','14:30:00','16:30:00',NULL,'Schedule (1).xlsx','3804c7d5bd2b45198bffe5373d4f8fe2.xlsx','2022-01-08 16:25:06',_binary '\0',_binary '',2021,'FIRST','2021-08-10'),(16,'BLG0002P','Discrete Mathematics',4,'Thursday','08:00:00','09:30:00',NULL,'Schedule (1).xlsx','3804c7d5bd2b45198bffe5373d4f8fe2.xlsx','2022-01-08 16:25:06',_binary '\0',_binary '',2021,'FIRST','2021-08-10'),(17,'BLG0002P','Euthenics',4,'Thursday','09:30:00','11:00:00',NULL,'Schedule (1).xlsx','3804c7d5bd2b45198bffe5373d4f8fe2.xlsx','2022-01-08 16:25:06',_binary '\0',_binary '',2021,'FIRST','2021-08-10'),(18,'BLG0002P','Discrete Mathematics',4,'Thursday','13:00:00','17:00:00',NULL,'Schedule (1).xlsx','3804c7d5bd2b45198bffe5373d4f8fe2.xlsx','2022-01-08 16:25:06',_binary '\0',_binary '',2021,'FIRST','2021-08-10');
/*!40000 ALTER TABLE `employeescheduleplans` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employeetimelog`
--

DROP TABLE IF EXISTS `employeetimelog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employeetimelog` (
  `batchId` varchar(36) NOT NULL,
  `employeeNo` varchar(25) NOT NULL,
  `timeLog` date NOT NULL,
  `dayOfWeek` varchar(15) NOT NULL,
  `subject` varchar(150) DEFAULT NULL,
  `subjectTimeIn` time DEFAULT NULL,
  `subjectTimeOut` time DEFAULT NULL,
  `employeeTimeIn` time DEFAULT NULL,
  `employeeTimeOut` time DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employeetimelog`
--

LOCK TABLES `employeetimelog` WRITE;
/*!40000 ALTER TABLE `employeetimelog` DISABLE KEYS */;
INSERT INTO `employeetimelog` VALUES ('3BD12F94033E498D8C3B3388B96D0753','BLG0001F','2021-08-26','Thursday','','08:00:00','18:00:00','08:00:00','16:01:39'),('3BD12F94033E498D8C3B3388B96D0753','BLG0001F','2021-08-27','Friday','','08:00:00','18:00:00','08:00:00','16:02:15'),('3BD12F94033E498D8C3B3388B96D0753','BLG0001F','2021-08-28','Saturday','','00:00:00','00:00:00','00:00:00','00:00:00'),('3BD12F94033E498D8C3B3388B96D0753','BLG0001F','2021-08-29','Sunday','','00:00:00','00:00:00','00:00:00','00:00:00'),('3BD12F94033E498D8C3B3388B96D0753','BLG0001F','2021-08-30','Monday','','08:00:00','18:00:00','00:00:00','00:00:00'),('3BD12F94033E498D8C3B3388B96D0753','BLG0001F','2021-08-31','Tuesday','','08:00:00','18:00:00','00:00:00','00:00:00'),('3BD12F94033E498D8C3B3388B96D0753','BLG0001F','2021-09-01','Wednesday','','08:00:00','18:00:00','08:11:38','16:01:40'),('3BD12F94033E498D8C3B3388B96D0753','BLG0001F','2021-09-02','Thursday','','08:00:00','18:00:00','08:00:00','16:54:38'),('3BD12F94033E498D8C3B3388B96D0753','BLG0001F','2021-09-03','Friday','','08:00:00','18:00:00','08:00:00','16:49:00'),('3BD12F94033E498D8C3B3388B96D0753','BLG0001F','2021-09-04','Saturday','','00:00:00','00:00:00','00:00:00','00:00:00'),('3BD12F94033E498D8C3B3388B96D0753','BLG0001F','2021-09-05','Sunday','','00:00:00','00:00:00','00:00:00','00:00:00'),('3BD12F94033E498D8C3B3388B96D0753','BLG0001F','2021-09-06','Monday','','08:00:00','18:00:00','08:00:00','16:28:30'),('3BD12F94033E498D8C3B3388B96D0753','BLG0001F','2021-09-07','Tuesday','','08:00:00','18:00:00','08:06:33','16:26:32'),('3BD12F94033E498D8C3B3388B96D0753','BLG0001F','2021-09-08','Wednesday','','08:00:00','18:00:00','08:14:46','14:02:59'),('3BD12F94033E498D8C3B3388B96D0753','BLG0001F','2021-09-09','Thursday','','08:00:00','18:00:00','08:01:17','16:55:49'),('3BD12F94033E498D8C3B3388B96D0753','BLG0001F','2021-09-10','Friday','','08:00:00','18:00:00','00:00:00','00:00:00'),('803E824EEE4D461181AE7405BBE3F871','BLG0001F','2021-08-26','Thursday','','08:00:00','18:00:00','08:00:00','16:01:39'),('803E824EEE4D461181AE7405BBE3F871','BLG0001F','2021-08-27','Friday','','08:00:00','18:00:00','08:00:00','16:02:15'),('803E824EEE4D461181AE7405BBE3F871','BLG0001F','2021-08-28','Saturday','','00:00:00','00:00:00','00:00:00','00:00:00'),('803E824EEE4D461181AE7405BBE3F871','BLG0001F','2021-08-29','Sunday','','00:00:00','00:00:00','00:00:00','00:00:00'),('803E824EEE4D461181AE7405BBE3F871','BLG0001F','2021-08-30','Monday','','08:00:00','18:00:00','00:00:00','00:00:00'),('803E824EEE4D461181AE7405BBE3F871','BLG0001F','2021-08-31','Tuesday','','08:00:00','18:00:00','00:00:00','00:00:00'),('803E824EEE4D461181AE7405BBE3F871','BLG0001F','2021-09-01','Wednesday','','08:00:00','18:00:00','08:11:38','16:01:40'),('803E824EEE4D461181AE7405BBE3F871','BLG0001F','2021-09-02','Thursday','','08:00:00','18:00:00','08:00:00','16:54:38'),('803E824EEE4D461181AE7405BBE3F871','BLG0001F','2021-09-03','Friday','','08:00:00','18:00:00','08:00:00','16:49:00'),('803E824EEE4D461181AE7405BBE3F871','BLG0001F','2021-09-04','Saturday','','00:00:00','00:00:00','00:00:00','00:00:00'),('803E824EEE4D461181AE7405BBE3F871','BLG0001F','2021-09-05','Sunday','','00:00:00','00:00:00','00:00:00','00:00:00'),('803E824EEE4D461181AE7405BBE3F871','BLG0001F','2021-09-06','Monday','','08:00:00','18:00:00','08:00:00','16:28:30'),('803E824EEE4D461181AE7405BBE3F871','BLG0001F','2021-09-07','Tuesday','','08:00:00','18:00:00','08:06:33','16:26:32'),('803E824EEE4D461181AE7405BBE3F871','BLG0001F','2021-09-08','Wednesday','','08:00:00','18:00:00','08:14:46','14:02:59'),('803E824EEE4D461181AE7405BBE3F871','BLG0001F','2021-09-09','Thursday','','08:00:00','18:00:00','08:01:17','16:55:49'),('803E824EEE4D461181AE7405BBE3F871','BLG0001F','2021-09-10','Friday','','08:00:00','18:00:00','00:00:00','00:00:00'),('500FB2257078424CBD0C824601F42D9F','BLG0001F','2021-08-26','Thursday','','08:00:00','18:00:00','08:00:00','16:01:39'),('500FB2257078424CBD0C824601F42D9F','BLG0001F','2021-08-27','Friday','','08:00:00','18:00:00','08:00:00','16:02:15'),('500FB2257078424CBD0C824601F42D9F','BLG0001F','2021-08-28','Saturday','','00:00:00','00:00:00','00:00:00','00:00:00'),('500FB2257078424CBD0C824601F42D9F','BLG0001F','2021-08-29','Sunday','','00:00:00','00:00:00','00:00:00','00:00:00'),('500FB2257078424CBD0C824601F42D9F','BLG0001F','2021-08-30','Monday','','08:00:00','18:00:00','00:00:00','00:00:00'),('500FB2257078424CBD0C824601F42D9F','BLG0001F','2021-08-31','Tuesday','','08:00:00','18:00:00','00:00:00','00:00:00'),('500FB2257078424CBD0C824601F42D9F','BLG0001F','2021-09-01','Wednesday','','08:00:00','18:00:00','08:11:38','16:01:40'),('500FB2257078424CBD0C824601F42D9F','BLG0001F','2021-09-02','Thursday','','08:00:00','18:00:00','08:00:00','16:54:38'),('500FB2257078424CBD0C824601F42D9F','BLG0001F','2021-09-03','Friday','','08:00:00','18:00:00','08:00:00','16:49:00'),('500FB2257078424CBD0C824601F42D9F','BLG0001F','2021-09-04','Saturday','','00:00:00','00:00:00','00:00:00','00:00:00'),('500FB2257078424CBD0C824601F42D9F','BLG0001F','2021-09-05','Sunday','','00:00:00','00:00:00','00:00:00','00:00:00'),('500FB2257078424CBD0C824601F42D9F','BLG0001F','2021-09-06','Monday','','08:00:00','18:00:00','08:00:00','16:28:30'),('500FB2257078424CBD0C824601F42D9F','BLG0001F','2021-09-07','Tuesday','','08:00:00','18:00:00','08:06:33','16:26:32'),('500FB2257078424CBD0C824601F42D9F','BLG0001F','2021-09-08','Wednesday','','08:00:00','18:00:00','08:14:46','14:02:59'),('500FB2257078424CBD0C824601F42D9F','BLG0001F','2021-09-09','Thursday','','08:00:00','18:00:00','08:01:17','16:55:49'),('500FB2257078424CBD0C824601F42D9F','BLG0001F','2021-09-10','Friday','','08:00:00','18:00:00','00:00:00','00:00:00');
/*!40000 ALTER TABLE `employeetimelog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `familybackground`
--

DROP TABLE IF EXISTS `familybackground`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `familybackground` (
  `id` int NOT NULL AUTO_INCREMENT,
  `employeeNo` varchar(50) DEFAULT NULL,
  `fatherName` varchar(50) DEFAULT NULL,
  `fatherAge` varchar(50) DEFAULT NULL,
  `fatherOccupation` varchar(50) DEFAULT NULL,
  `motherName` varchar(50) DEFAULT NULL,
  `motherAge` varchar(50) DEFAULT NULL,
  `motherOccupation` varchar(50) DEFAULT NULL,
  `spouseName` varchar(50) DEFAULT NULL,
  `spouseAge` varchar(50) DEFAULT NULL,
  `spouseOccupation` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `familybackground`
--

LOCK TABLES `familybackground` WRITE;
/*!40000 ALTER TABLE `familybackground` DISABLE KEYS */;
/*!40000 ALTER TABLE `familybackground` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `faqmaintenance`
--

DROP TABLE IF EXISTS `faqmaintenance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `faqmaintenance` (
  `id` int NOT NULL AUTO_INCREMENT,
  `groupFaq` varchar(25) DEFAULT NULL,
  `question` varchar(255) DEFAULT NULL,
  `answer` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `faqmaintenance`
--

LOCK TABLES `faqmaintenance` WRITE;
/*!40000 ALTER TABLE `faqmaintenance` DISABLE KEYS */;
/*!40000 ALTER TABLE `faqmaintenance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jobs`
--

DROP TABLE IF EXISTS `jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jobs` (
  `JobID` int NOT NULL AUTO_INCREMENT,
  `Job_Title` varchar(45) DEFAULT NULL,
  `Job_Description` varchar(1000) DEFAULT NULL,
  `Job_Category` varchar(45) DEFAULT NULL,
  `Job_Type` varchar(45) DEFAULT NULL,
  `Job_Qualification` varchar(45) DEFAULT NULL,
  `Job_MinimumReq` varchar(45) DEFAULT NULL,
  `Job_GeneralQuali` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`JobID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jobs`
--

LOCK TABLES `jobs` WRITE;
/*!40000 ALTER TABLE `jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `leaveapplications`
--

DROP TABLE IF EXISTS `leaveapplications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `leaveapplications` (
  `id` int NOT NULL AUTO_INCREMENT,
  `typeOfLeave` varchar(50) NOT NULL,
  `employeeNo` varchar(50) DEFAULT NULL,
  `employeeName` varchar(100) DEFAULT NULL,
  `department` varchar(50) DEFAULT NULL,
  `reasons` varchar(1000) DEFAULT NULL,
  `startDate` date DEFAULT NULL,
  `endDate` date DEFAULT NULL,
  `status` varchar(25) DEFAULT NULL,
  `approver` varchar(100) DEFAULT NULL,
  `lastModifiedDate` datetime DEFAULT CURRENT_TIMESTAMP,
  `isActive` bit(1) DEFAULT b'1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `leaveapplications`
--

LOCK TABLES `leaveapplications` WRITE;
/*!40000 ALTER TABLE `leaveapplications` DISABLE KEYS */;
INSERT INTO `leaveapplications` VALUES (1,'SL','BLG0001F','Manuel, Christian Reymond','Human Resource','Covid','2022-01-11','2022-01-13','PENDING',NULL,'2022-01-08 22:22:34',_binary ''),(3,'SL','BLG0003P','Vidad, Soledad','Business Administration','Covid','2022-01-11','2022-01-14','APPROVED','Dela Cruz, Juan','2022-01-08 23:49:29',_binary ''),(4,'SL','BLG0003P','Vidad, Soledad','Business Administration','Fever','2022-01-10','2022-01-12','APPROVED','Dela Cruz, Juan','2022-01-10 10:55:24',_binary ''),(5,'SL','BLG0003P','Vidad, Soledad','Business Administration','Sore throat','2022-01-14','2022-01-15','APPROVED','Dela Cruz, Juan','2022-01-10 11:07:18',_binary '');
/*!40000 ALTER TABLE `leaveapplications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `leavetypes`
--

DROP TABLE IF EXISTS `leavetypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `leavetypes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `leaveTypeCode` varchar(10) NOT NULL,
  `leaveTypeName` varchar(100) NOT NULL,
  `leaveTypeDescription` varchar(1000) DEFAULT NULL,
  `maximumAllottedDays` int DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `leaveTypeCode` (`leaveTypeCode`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `leavetypes`
--

LOCK TABLES `leavetypes` WRITE;
/*!40000 ALTER TABLE `leavetypes` DISABLE KEYS */;
INSERT INTO `leavetypes` VALUES (1,'SL','Sick Leave','Sick leave (or paid sick days or sick pay) is paid time off from work that workers can use to stay home to address their health needs without losing pay. It differs from paid vacation time or time off work to deal with personal matters, because sick leave is intended for health-related purposes.',15);
/*!40000 ALTER TABLE `leavetypes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `memorandum`
--

DROP TABLE IF EXISTS `memorandum`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `memorandum` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `memoNumber` varchar(50) NOT NULL,
  `deliverTo` varchar(1000) NOT NULL,
  `ccTo` varchar(1000) DEFAULT NULL,
  `issuedFrom` varchar(150) NOT NULL,
  `asOfDate` date NOT NULL,
  `subject` varchar(100) NOT NULL,
  `message` varchar(1000) NOT NULL,
  `attachedFileName` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `memorandum`
--

LOCK TABLES `memorandum` WRITE;
/*!40000 ALTER TABLE `memorandum` DISABLE KEYS */;
/*!40000 ALTER TABLE `memorandum` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notification`
--

DROP TABLE IF EXISTS `notification`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `notification` (
  `id` int NOT NULL AUTO_INCREMENT,
  `message` varchar(1000) DEFAULT NULL,
  `dateTime` datetime DEFAULT NULL,
  `isRead` varchar(25) DEFAULT NULL,
  `fullName` varchar(50) DEFAULT NULL,
  `deliverTo` varchar(25) DEFAULT NULL,
  `userType` varchar(25) DEFAULT NULL,
  `employeeNo` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notification`
--

LOCK TABLES `notification` WRITE;
/*!40000 ALTER TABLE `notification` DISABLE KEYS */;
INSERT INTO `notification` VALUES (1,'New Applicant Applied','2022-01-08 15:30:42','FALSE','Manuel, Christian Reymond ','','ADMINISTRATOR',''),(2,'New Applicant Applied','2022-01-08 16:21:49','FALSE','Dela Cruz, Juan ','','ADMINISTRATOR',''),(3,'Leave Applied By: Manuel, Christian Reymond','2022-01-08 22:22:35','FALSE','Manuel, Christian Reymond ','','ADMINISTRATOR',''),(4,'New Applicant Applied','2022-01-08 23:31:14','FALSE','Vidad, Soledad ','','ADMINISTRATOR',''),(5,'Leave Applied By: Vidad, Soledad','2022-01-08 23:41:40','FALSE','Vidad, Soledad ','','ADMINISTRATOR',''),(6,'Leave Applied By: Vidad, Soledad','2022-01-08 23:49:29','FALSE','Vidad, Soledad ','','ADMINISTRATOR',''),(7,'Leave Applied By: Vidad, Soledad','2022-01-10 10:55:25','FALSE','Vidad, Soledad ','','ADMINISTRATOR',''),(8,'Leave Applied By: Vidad, Soledad','2022-01-10 11:07:18','FALSE','Vidad, Soledad ','','ADMINISTRATOR','');
/*!40000 ALTER TABLE `notification` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `officedocuments`
--

DROP TABLE IF EXISTS `officedocuments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `officedocuments` (
  `id` int NOT NULL AUTO_INCREMENT,
  `type` varchar(25) DEFAULT NULL,
  `fileName` varchar(100) DEFAULT NULL,
  `active` bit(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `officedocuments`
--

LOCK TABLES `officedocuments` WRITE;
/*!40000 ALTER TABLE `officedocuments` DISABLE KEYS */;
/*!40000 ALTER TABLE `officedocuments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `persons`
--

DROP TABLE IF EXISTS `persons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `persons` (
  `id` int NOT NULL AUTO_INCREMENT,
  `employeeNo` varchar(20) DEFAULT NULL,
  `fullName` varchar(150) DEFAULT NULL,
  `address` varchar(150) DEFAULT NULL,
  `contactNumber` varchar(25) DEFAULT NULL,
  `emailAddress` varchar(50) DEFAULT NULL,
  `birthPlace` varchar(50) DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `citizenship` varchar(50) DEFAULT NULL,
  `civilStatus` varchar(50) DEFAULT NULL,
  `religion` varchar(50) DEFAULT NULL,
  `gender` varchar(10) DEFAULT NULL,
  `height` decimal(10,0) DEFAULT NULL,
  `weight` decimal(10,0) DEFAULT NULL,
  `tinId` varchar(25) DEFAULT NULL,
  `philHealthId` varchar(25) DEFAULT NULL,
  `sssId` varchar(25) DEFAULT NULL,
  `hdmfId` varchar(25) DEFAULT NULL,
  `contactPerson` varchar(100) DEFAULT NULL,
  `relationship` varchar(25) DEFAULT NULL,
  `contactPersonNumber` varchar(25) DEFAULT NULL,
  `picture` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `persons`
--

LOCK TABLES `persons` WRITE;
/*!40000 ALTER TABLE `persons` DISABLE KEYS */;
INSERT INTO `persons` VALUES (1,'APPLICANT','School, Bustos Elementary','San Pedro Bustos Bulacan','09283384132','christianreymanuel23@gmail.com',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `persons` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `position`
--

DROP TABLE IF EXISTS `position`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `position` (
  `id` int NOT NULL AUTO_INCREMENT,
  `classificationName` varchar(50) DEFAULT NULL,
  `departmentName` varchar(50) DEFAULT NULL,
  `positionName` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `position`
--

LOCK TABLES `position` WRITE;
/*!40000 ALTER TABLE `position` DISABLE KEYS */;
INSERT INTO `position` VALUES (1,'Teaching','Information Technology','Instructor'),(2,'Non-Teaching','Human resource','Clerk'),(3,'Non-Teaching','Operations','Registrar'),(4,'Teaching','Business Administration','Instructor'),(5,'Teaching','Information Technology','Program Head'),(6,'Teaching','Business Administration','Program Head');
/*!40000 ALTER TABLE `position` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `postedjobs`
--

DROP TABLE IF EXISTS `postedjobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `postedjobs` (
  `id` int NOT NULL AUTO_INCREMENT,
  `lastModifiedDate` datetime DEFAULT CURRENT_TIMESTAMP,
  `isActive` bit(1) DEFAULT b'1',
  `title` varchar(50) NOT NULL,
  `classification` varchar(20) NOT NULL,
  `department` varchar(80) DEFAULT NULL,
  `jobType` varchar(45) DEFAULT NULL,
  `postDuration` datetime NOT NULL,
  `educationalQualification` varchar(150) DEFAULT NULL,
  `yearExperience` varchar(80) DEFAULT NULL,
  `generalQualifiacation` varchar(1000) DEFAULT NULL,
  `jobResponsibilities` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `postedjobs`
--

LOCK TABLES `postedjobs` WRITE;
/*!40000 ALTER TABLE `postedjobs` DISABLE KEYS */;
INSERT INTO `postedjobs` VALUES (1,'2022-01-08 15:23:24',_binary '','Instructor','Teaching','Business Administration','Part Time','2022-01-11 00:00:00','Bachelor\'s degree','1-3 years','Must know in Accounting<br />Good in Communication Skills','Teach BA Students'),(2,'2022-01-08 15:24:59',_binary '','Instructor','Teaching','Information Technology','Full Time','2022-01-14 00:00:00','Bachelor\'s degree','1-3 years','Must Know Java<br />Know about HTML, CSS, JavaScript','Teach IT Students'),(3,'2022-01-08 15:25:58',_binary '','Clerk','Non-Teaching','Human resource','Full Time','2022-01-10 00:00:00','Bachelor\'s degree','1-3 years','Computer Literate','Do reports');
/*!40000 ALTER TABLE `postedjobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rankmaintenance`
--

DROP TABLE IF EXISTS `rankmaintenance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rankmaintenance` (
  `id` int NOT NULL AUTO_INCREMENT,
  `classificationName` varchar(50) DEFAULT NULL,
  `startPoints` int DEFAULT NULL,
  `endPoint` int DEFAULT NULL,
  `type` varchar(15) DEFAULT NULL,
  `rankName` varchar(50) DEFAULT NULL,
  `salaryRate` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rankmaintenance`
--

LOCK TABLES `rankmaintenance` WRITE;
/*!40000 ALTER TABLE `rankmaintenance` DISABLE KEYS */;
INSERT INTO `rankmaintenance` VALUES (1,'Teaching',20,39,'Full Time','Assistant Professor',32000.00),(2,'Teaching',40,49,'Full Time','Associate Professor',40000.00),(3,'Teaching',50,59,'Full Time','Full Professor',48000.00),(4,'Teaching',20,39,'Part Time','Assistant Professor',200.00),(5,'Teaching',40,49,'Part Time','Associate Professor',250.00);
/*!40000 ALTER TABLE `rankmaintenance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `registration`
--

DROP TABLE IF EXISTS `registration`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `registration` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `firstName` varchar(50) NOT NULL,
  `lastName` varchar(50) NOT NULL,
  `fullName` varchar(150) NOT NULL,
  `email` varchar(100) NOT NULL,
  `activationCode` varchar(100) NOT NULL,
  `isActivate` bit(1) DEFAULT b'0',
  `expiryDate` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `registration`
--

LOCK TABLES `registration` WRITE;
/*!40000 ALTER TABLE `registration` DISABLE KEYS */;
/*!40000 ALTER TABLE `registration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `registrations`
--

DROP TABLE IF EXISTS `registrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `registrations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `firstName` varchar(50) NOT NULL,
  `lastName` varchar(50) NOT NULL,
  `middleName` varchar(50) DEFAULT NULL,
  `fullName` varchar(150) NOT NULL,
  `email` varchar(100) NOT NULL,
  `activationCode` varchar(100) NOT NULL,
  `isActivate` bit(1) DEFAULT b'0',
  `expiryDate` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `registrations`
--

LOCK TABLES `registrations` WRITE;
/*!40000 ALTER TABLE `registrations` DISABLE KEYS */;
INSERT INTO `registrations` VALUES (1,'Christian Reymond','Manuel','Elementary','Manuel, Christian Reymond','christianreymanuel23@gmail.com','584d6e31',_binary '','2022-01-09'),(2,'Juan','Dela Cruz',NULL,'Dela Cruz, Juan','xenada3886@veb34.com','cb45c30d',_binary '','2022-01-09'),(3,'Soledad','Vidad',NULL,'Vidad, Soledad','vidadsoledad@gmail.com','6e46aab9',_binary '','2022-01-09');
/*!40000 ALTER TABLE `registrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `resignationapplications`
--

DROP TABLE IF EXISTS `resignationapplications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `resignationapplications` (
  `id` int NOT NULL AUTO_INCREMENT,
  `lastModifiedDate` datetime DEFAULT CURRENT_TIMESTAMP,
  `isActive` bit(1) DEFAULT b'1',
  `employeeNo` varchar(25) DEFAULT NULL,
  `employeeName` varchar(100) DEFAULT NULL,
  `deliverTo` varchar(50) DEFAULT NULL,
  `message` varchar(1000) DEFAULT NULL,
  `effectivityDate` date DEFAULT NULL,
  `status` varchar(20) DEFAULT NULL,
  `approver` varchar(100) DEFAULT NULL,
  `fileName` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `resignationapplications`
--

LOCK TABLES `resignationapplications` WRITE;
/*!40000 ALTER TABLE `resignationapplications` DISABLE KEYS */;
/*!40000 ALTER TABLE `resignationapplications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `seminar`
--

DROP TABLE IF EXISTS `seminar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `seminar` (
  `employeeId` varchar(50) DEFAULT NULL,
  `typeSeminar` varchar(50) DEFAULT NULL,
  `institution` varchar(50) DEFAULT NULL,
  `inclusiveDates` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `seminar`
--

LOCK TABLES `seminar` WRITE;
/*!40000 ALTER TABLE `seminar` DISABLE KEYS */;
/*!40000 ALTER TABLE `seminar` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `signatoryofficers`
--

DROP TABLE IF EXISTS `signatoryofficers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `signatoryofficers` (
  `id` int NOT NULL AUTO_INCREMENT,
  `lastModifiedDate` datetime DEFAULT CURRENT_TIMESTAMP,
  `isActive` bit(1) DEFAULT b'1',
  `abbrPosition` varchar(10) NOT NULL,
  `officerName` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `abbrPosition` (`abbrPosition`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `signatoryofficers`
--

LOCK TABLES `signatoryofficers` WRITE;
/*!40000 ALTER TABLE `signatoryofficers` DISABLE KEYS */;
/*!40000 ALTER TABLE `signatoryofficers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `timekeepingbatchrecords`
--

DROP TABLE IF EXISTS `timekeepingbatchrecords`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `timekeepingbatchrecords` (
  `id` int NOT NULL AUTO_INCREMENT,
  `employeeNumber` varchar(150) NOT NULL,
  `batchId` varchar(100) NOT NULL,
  `originalFileName` varchar(255) NOT NULL,
  `uploadFileName` varchar(150) NOT NULL,
  `uploadedDate` datetime DEFAULT CURRENT_TIMESTAMP,
  `uploadedBy` varchar(255) NOT NULL,
  `processBy` varchar(255) DEFAULT NULL,
  `isProcess` bit(1) DEFAULT b'0',
  `isActive` bit(1) DEFAULT b'1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `timekeepingbatchrecords`
--

LOCK TABLES `timekeepingbatchrecords` WRITE;
/*!40000 ALTER TABLE `timekeepingbatchrecords` DISABLE KEYS */;
/*!40000 ALTER TABLE `timekeepingbatchrecords` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `timekeepingrecords`
--

DROP TABLE IF EXISTS `timekeepingrecords`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `timekeepingrecords` (
  `id` int NOT NULL AUTO_INCREMENT,
  `batchId` varchar(100) NOT NULL,
  `departmentName` varchar(150) NOT NULL,
  `employeeNumber` varchar(150) NOT NULL,
  `employeeName` varchar(50) DEFAULT NULL,
  `recordDateTime` datetime DEFAULT NULL,
  `timeRecordType` varchar(100) NOT NULL,
  `machineTerminalNo` varchar(100) NOT NULL,
  `originalFileName` varchar(255) NOT NULL,
  `uploadFileName` varchar(255) NOT NULL,
  `uploadedDate` datetime DEFAULT CURRENT_TIMESTAMP,
  `isExtracted` bit(1) DEFAULT b'0',
  `errorExtrationMessage` varchar(255) DEFAULT NULL,
  `isActive` bit(1) DEFAULT b'1',
  `recordDate` date NOT NULL,
  `recordTime` time NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `timekeepingrecords`
--

LOCK TABLES `timekeepingrecords` WRITE;
/*!40000 ALTER TABLE `timekeepingrecords` DISABLE KEYS */;
INSERT INTO `timekeepingrecords` VALUES (1,'1c040fe247ba4285bf7785edf4b63144','Staff','BLG0001F','Manuel, Christian Reymond Vidad','2021-08-26 07:18:04','TimeIn','1','Nonteaching.xlsx','1c040fe247ba4285bf7785edf4b63144.xlsx','2022-01-10 10:51:00',_binary '\0',NULL,_binary '','2021-08-26','07:18:04'),(2,'1c040fe247ba4285bf7785edf4b63144','Staff','BLG0001F','Manuel, Christian Reymond Vidad','2021-08-26 16:01:39','TimeOut','1','Nonteaching.xlsx','1c040fe247ba4285bf7785edf4b63144.xlsx','2022-01-10 10:51:00',_binary '\0',NULL,_binary '','2021-08-26','16:01:39'),(3,'1c040fe247ba4285bf7785edf4b63144','Staff','BLG0001F','Manuel, Christian Reymond Vidad','2021-08-27 07:27:04','TimeIn','1','Nonteaching.xlsx','1c040fe247ba4285bf7785edf4b63144.xlsx','2022-01-10 10:51:00',_binary '\0',NULL,_binary '','2021-08-27','07:27:04'),(4,'1c040fe247ba4285bf7785edf4b63144','Staff','BLG0001F','Manuel, Christian Reymond Vidad','2021-08-27 16:02:15','TimeOut','1','Nonteaching.xlsx','1c040fe247ba4285bf7785edf4b63144.xlsx','2022-01-10 10:51:00',_binary '\0',NULL,_binary '','2021-08-27','16:02:15'),(5,'1c040fe247ba4285bf7785edf4b63144','Staff','BLG0001F','Manuel, Christian Reymond Vidad','2021-09-01 08:11:38','TimeIn','1','Nonteaching.xlsx','1c040fe247ba4285bf7785edf4b63144.xlsx','2022-01-10 10:51:00',_binary '\0',NULL,_binary '','2021-09-01','08:11:38'),(6,'1c040fe247ba4285bf7785edf4b63144','Staff','BLG0001F','Manuel, Christian Reymond Vidad','2021-09-01 16:01:40','TimeOut','1','Nonteaching.xlsx','1c040fe247ba4285bf7785edf4b63144.xlsx','2022-01-10 10:51:00',_binary '\0',NULL,_binary '','2021-09-01','16:01:40'),(7,'1c040fe247ba4285bf7785edf4b63144','Staff','BLG0001F','Manuel, Christian Reymond Vidad','2021-09-02 07:53:58','TimeIn','1','Nonteaching.xlsx','1c040fe247ba4285bf7785edf4b63144.xlsx','2022-01-10 10:51:00',_binary '\0',NULL,_binary '','2021-09-02','07:53:58'),(8,'1c040fe247ba4285bf7785edf4b63144','Staff','BLG0001F','Manuel, Christian Reymond Vidad','2021-09-02 16:54:38','TimeOut','1','Nonteaching.xlsx','1c040fe247ba4285bf7785edf4b63144.xlsx','2022-01-10 10:51:00',_binary '\0',NULL,_binary '','2021-09-02','16:54:38'),(9,'1c040fe247ba4285bf7785edf4b63144','Staff','BLG0001F','Manuel, Christian Reymond Vidad','2021-09-03 07:52:17','TimeIn','1','Nonteaching.xlsx','1c040fe247ba4285bf7785edf4b63144.xlsx','2022-01-10 10:51:00',_binary '\0',NULL,_binary '','2021-09-03','07:52:17'),(10,'1c040fe247ba4285bf7785edf4b63144','Staff','BLG0001F','Manuel, Christian Reymond Vidad','2021-09-03 16:49:00','TimeOut','1','Nonteaching.xlsx','1c040fe247ba4285bf7785edf4b63144.xlsx','2022-01-10 10:51:00',_binary '\0',NULL,_binary '','2021-09-03','16:49:00'),(11,'1c040fe247ba4285bf7785edf4b63144','Staff','BLG0001F','Manuel, Christian Reymond Vidad','2021-09-06 07:55:48','TimeIn','1','Nonteaching.xlsx','1c040fe247ba4285bf7785edf4b63144.xlsx','2022-01-10 10:51:00',_binary '\0',NULL,_binary '','2021-09-06','07:55:48'),(12,'1c040fe247ba4285bf7785edf4b63144','Staff','BLG0001F','Manuel, Christian Reymond Vidad','2021-09-06 16:28:30','TimeOut','1','Nonteaching.xlsx','1c040fe247ba4285bf7785edf4b63144.xlsx','2022-01-10 10:51:00',_binary '\0',NULL,_binary '','2021-09-06','16:28:30'),(13,'1c040fe247ba4285bf7785edf4b63144','Staff','BLG0001F','Manuel, Christian Reymond Vidad','2021-09-07 08:06:33','TimeIn','1','Nonteaching.xlsx','1c040fe247ba4285bf7785edf4b63144.xlsx','2022-01-10 10:51:00',_binary '\0',NULL,_binary '','2021-09-07','08:06:33'),(14,'1c040fe247ba4285bf7785edf4b63144','Staff','BLG0001F','Manuel, Christian Reymond Vidad','2021-09-07 16:26:32','TimeOut','1','Nonteaching.xlsx','1c040fe247ba4285bf7785edf4b63144.xlsx','2022-01-10 10:51:00',_binary '\0',NULL,_binary '','2021-09-07','16:26:32'),(15,'1c040fe247ba4285bf7785edf4b63144','Staff','BLG0001F','Manuel, Christian Reymond Vidad','2021-09-08 08:14:46','TimeIn','1','Nonteaching.xlsx','1c040fe247ba4285bf7785edf4b63144.xlsx','2022-01-10 10:51:00',_binary '\0',NULL,_binary '','2021-09-08','08:14:46'),(16,'1c040fe247ba4285bf7785edf4b63144','Staff','BLG0001F','Manuel, Christian Reymond Vidad','2021-09-08 14:02:59','TimeOut','1','Nonteaching.xlsx','1c040fe247ba4285bf7785edf4b63144.xlsx','2022-01-10 10:51:00',_binary '\0',NULL,_binary '','2021-09-08','14:02:59'),(17,'1c040fe247ba4285bf7785edf4b63144','Staff','BLG0001F','Manuel, Christian Reymond Vidad','2021-09-09 08:01:17','TimeIn','1','Nonteaching.xlsx','1c040fe247ba4285bf7785edf4b63144.xlsx','2022-01-10 10:51:00',_binary '\0',NULL,_binary '','2021-09-09','08:01:17'),(18,'1c040fe247ba4285bf7785edf4b63144','Staff','BLG0001F','Manuel, Christian Reymond Vidad','2021-09-09 16:55:49','TimeOut','1','Nonteaching.xlsx','1c040fe247ba4285bf7785edf4b63144.xlsx','2022-01-10 10:51:00',_binary '\0',NULL,_binary '','2021-09-09','16:55:49');
/*!40000 ALTER TABLE `timekeepingrecords` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `useractivity`
--

DROP TABLE IF EXISTS `useractivity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `useractivity` (
  `id` int NOT NULL AUTO_INCREMENT,
  `employeeNo` varchar(50) DEFAULT NULL,
  `fullName` varchar(50) DEFAULT NULL,
  `activity` varchar(100) DEFAULT NULL,
  `dateOfActivity` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=214 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `useractivity`
--

LOCK TABLES `useractivity` WRITE;
/*!40000 ALTER TABLE `useractivity` DISABLE KEYS */;
INSERT INTO `useractivity` VALUES (1,'00000','Delara, Julie','Admin logged-in in the system','2022-01-08 15:20:08'),(2,'00000','Delara, Julie','Department modified','2022-01-08 15:20:21'),(3,'00000','Delara, Julie','Department modified','2022-01-08 15:20:21'),(4,'00000','Delara, Julie','Department modified','2022-01-08 15:20:27'),(5,'00000','Delara, Julie','Department modified','2022-01-08 15:20:27'),(6,'00000','Delara, Julie','Department modified','2022-01-08 15:20:34'),(7,'00000','Delara, Julie','Department modified','2022-01-08 15:20:34'),(8,'00000','Delara, Julie','Department modified','2022-01-08 15:20:45'),(9,'00000','Delara, Julie','Department modified','2022-01-08 15:20:45'),(10,'00000','Delara, Julie','New Position Added','2022-01-08 15:20:57'),(11,'00000','Delara, Julie','New Position Added','2022-01-08 15:21:06'),(12,'00000','Delara, Julie','Position Updated','2022-01-08 15:21:29'),(13,'00000','Delara, Julie','New Job Posted','2022-01-08 15:23:24'),(14,'00000','Delara, Julie','New Job Posted','2022-01-08 15:24:59'),(15,'00000','Delara, Julie','New Job Posted','2022-01-08 15:25:58'),(16,'christianreymanuel23@gmail.com','Manuel, Christian Reymond','Applicant has been applied for vacant position','2022-01-08 15:30:39'),(17,'00000','Delara, Julie','Admin logged-in in the system','2022-01-08 15:30:57'),(18,'00000','Delara, Julie','New employee added','2022-01-08 15:31:36'),(19,'00000','Delara, Julie','Employee viewed','2022-01-08 15:31:40'),(20,'BLG0001F','Manuel, Christian Reymond','Employee logged-in in the system','2022-01-08 15:33:05'),(21,'BLG0001F','Manuel, Christian Reymond','Employee logged-in in the system','2022-01-08 15:42:57'),(22,'BLG0001F','Manuel, Christian Reymond','Employee logged-in in the system','2022-01-08 15:43:39'),(23,'BLG0001F','Manuel, Christian Reymond','Employee logged-in in the system','2022-01-08 15:51:26'),(24,'00000','Delara, Julie','Admin logged-in in the system','2022-01-08 15:52:01'),(25,'00000','Delara, Julie','COE Multipurpose Approved','2022-01-08 15:52:12'),(26,'00000','Delara, Julie','Coe Multipurpose Print','2022-01-08 15:52:14'),(27,'00000','Delara, Julie','Non-Teaching schedule created','2022-01-08 15:53:11'),(28,'00000','Delara, Julie','Timesheet viewed','2022-01-08 15:53:19'),(29,'00000','Delara, Julie','Timesheet viewed','2022-01-08 15:53:19'),(30,'00000','Delara, Julie','Timesheet uploaded','2022-01-08 15:54:02'),(31,'00000','Delara, Julie','Timesheet viewed','2022-01-08 15:54:03'),(32,'00000','Delara, Julie','Timesheet searched','2022-01-08 15:54:28'),(33,'00000','Delara, Julie','Timesheet viewed','2022-01-08 15:55:05'),(34,'00000','Delara, Julie','Timesheet viewed','2022-01-08 15:55:05'),(35,'BLG0001F','Manuel, Christian Reymond','Employee logged-in in the system','2022-01-08 16:00:00'),(36,'00000','Delara, Julie','Admin logged-in in the system','2022-01-08 16:00:11'),(37,'00000','Delara, Julie','Timesheet viewed','2022-01-08 16:00:14'),(38,'00000','Delara, Julie','Timesheet viewed','2022-01-08 16:00:14'),(39,'00000','Delara, Julie','Timesheet uploaded','2022-01-08 16:00:22'),(40,'00000','Delara, Julie','Timesheet viewed','2022-01-08 16:00:23'),(41,'00000','Delara, Julie','Timesheet uploaded','2022-01-08 16:00:41'),(42,'00000','Delara, Julie','Timesheet viewed','2022-01-08 16:00:42'),(43,'00000','Delara, Julie','Timesheet searched','2022-01-08 16:01:04'),(44,'00000','Delara, Julie','Timesheet print','2022-01-08 16:01:09'),(45,'xenada3886@veb34.com','Dela Cruz, Juan','Applicant has been applied for vacant position','2022-01-08 16:21:47'),(46,'00000','Delara, Julie','Admin logged-in in the system','2022-01-08 16:22:04'),(47,'00000','Delara, Julie','New employee added','2022-01-08 16:23:11'),(48,'00000','Delara, Julie','Timesheet viewed','2022-01-08 16:23:25'),(49,'00000','Delara, Julie','Timesheet viewed','2022-01-08 16:23:26'),(50,'00000','Delara, Julie','Timesheet uploaded','2022-01-08 16:23:57'),(51,'00000','Delara, Julie','Timesheet viewed','2022-01-08 16:23:59'),(52,'BLG0002P','Dela Cruz, Juan','Employee logged-in in the system','2022-01-08 16:24:21'),(53,'BLG0002P','Dela Cruz, Juan','Upload Schedule','2022-01-08 16:25:07'),(54,'00000','Delara, Julie','Admin logged-in in the system','2022-01-08 18:27:10'),(55,'00000','Delara, Julie','Employee viewed','2022-01-08 18:27:18'),(56,'00000','Delara, Julie','Employee viewed','2022-01-08 18:27:33'),(57,'00000','Delara, Julie','Admin logged-in in the system','2022-01-08 18:28:44'),(58,'00000','Delara, Julie','Department modified','2022-01-08 18:29:06'),(59,'00000','Delara, Julie','Department modified','2022-01-08 18:29:06'),(60,'00000','Delara, Julie','Department modified','2022-01-08 18:29:11'),(61,'00000','Delara, Julie','Department modified','2022-01-08 18:29:11'),(62,'00000','Delara, Julie','Admin logged-in in the system','2022-01-08 18:30:23'),(63,'00000','Delara, Julie','Department modified','2022-01-08 18:30:40'),(64,'00000','Delara, Julie','Department modified','2022-01-08 18:30:40'),(65,'00000','Delara, Julie','Department modified','2022-01-08 18:30:59'),(66,'00000','Delara, Julie','Department modified','2022-01-08 18:31:00'),(67,'00000','Delara, Julie','New Position Added','2022-01-08 18:31:13'),(68,'00000','Delara, Julie','Position Updated','2022-01-08 18:31:25'),(69,'00000','Delara, Julie','Employee viewed','2022-01-08 18:31:31'),(70,'00000','Delara, Julie','Admin logged-in in the system','2022-01-08 18:33:49'),(71,'00000','Delara, Julie','Employee viewed','2022-01-08 18:33:54'),(72,'00000','Delara, Julie','New Position Added','2022-01-08 18:34:44'),(73,'00000','Delara, Julie','Employee viewed','2022-01-08 18:35:05'),(74,'00000','Delara, Julie','Admin logged-in in the system','2022-01-08 18:37:27'),(75,'00000','Delara, Julie','Employee viewed','2022-01-08 18:39:08'),(76,'00000','Delara, Julie','New Position Added','2022-01-08 18:39:24'),(77,'00000','Delara, Julie','New Position Added','2022-01-08 18:39:34'),(78,'00000','Delara, Julie','Employee viewed','2022-01-08 18:39:40'),(79,'00000','Delara, Julie','Employee viewed','2022-01-08 18:40:02'),(80,'00000','Delara, Julie','Admin logged-in in the system','2022-01-08 18:41:57'),(81,'00000','Delara, Julie','Employee viewed','2022-01-08 18:42:04'),(82,'00000','Delara, Julie','Admin logged-in in the system','2022-01-08 18:47:11'),(83,'00000','Delara, Julie','Employee viewed','2022-01-08 18:47:18'),(84,'00000','Delara, Julie','Employee viewed','2022-01-08 18:48:25'),(85,'00000','Delara, Julie','Employee viewed','2022-01-08 18:48:31'),(86,'00000','Delara, Julie','Admin logged-in in the system','2022-01-08 18:50:27'),(87,'00000','Delara, Julie','Employee viewed','2022-01-08 18:50:31'),(88,'00000','Delara, Julie','Admin logged-in in the system','2022-01-08 18:52:04'),(89,'00000','Delara, Julie','Employee viewed','2022-01-08 18:52:09'),(90,'00000','Delara, Julie','Employee viewed','2022-01-08 18:52:10'),(91,'00000','Delara, Julie','Employee viewed','2022-01-08 18:52:22'),(92,'00000','Delara, Julie','Admin logged-in in the system','2022-01-08 18:53:50'),(93,'00000','Delara, Julie','Employee viewed','2022-01-08 18:53:57'),(94,'00000','Delara, Julie','Admin logged-in in the system','2022-01-08 18:56:36'),(95,'00000','Delara, Julie','Employee viewed','2022-01-08 18:56:41'),(96,'00000','Delara, Julie','Employee viewed','2022-01-08 18:56:47'),(97,'00000','Delara, Julie','Employee viewed','2022-01-08 18:58:11'),(98,'00000','Delara, Julie','Admin logged-in in the system','2022-01-08 18:59:49'),(99,'00000','Delara, Julie','Employee viewed','2022-01-08 18:59:55'),(100,'00000','Delara, Julie','Admin logged-in in the system','2022-01-08 19:06:28'),(101,'00000','Delara, Julie','Employee viewed','2022-01-08 19:06:33'),(102,'00000','Delara, Julie','Admin logged-in in the system','2022-01-08 19:07:33'),(103,'00000','Delara, Julie','Employee viewed','2022-01-08 19:07:46'),(104,'00000','Delara, Julie','Employee viewed','2022-01-08 19:07:55'),(105,'00000','Delara, Julie','Admin logged-in in the system','2022-01-08 19:08:57'),(106,'00000','Delara, Julie','Employee viewed','2022-01-08 19:09:15'),(107,'00000','Delara, Julie','Employee viewed','2022-01-08 19:09:23'),(108,'00000','Delara, Julie','Admin logged-in in the system','2022-01-08 19:10:21'),(109,'00000','Delara, Julie','Employee viewed','2022-01-08 19:10:42'),(110,'00000','Delara, Julie','Employee viewed','2022-01-08 19:10:47'),(111,'00000','Delara, Julie','Employee viewed','2022-01-08 19:10:51'),(112,'BLG0001F','Manuel, Christian Reymond','Employee logged-in in the system','2022-01-08 19:29:18'),(113,'00000','Delara, Julie','Admin logged-in in the system','2022-01-08 22:20:03'),(114,'BLG0001F','Manuel, Christian Reymond','Employee logged-in in the system','2022-01-08 22:20:32'),(115,'00000','Delara, Julie','Admin logged-in in the system','2022-01-08 22:21:18'),(116,'00000','Delara, Julie','Leave classification added','2022-01-08 22:21:25'),(117,'BLG0001F','Manuel, Christian Reymond','Employee logged-in in the system','2022-01-08 22:22:15'),(118,'BLG0001F','Manuel, Christian Reymond','Leave Application Sent','2022-01-08 22:22:35'),(119,'00000','Delara, Julie','Admin logged-in in the system','2022-01-08 22:22:46'),(120,'BLG0001F','Manuel, Christian Reymond','Employee logged-in in the system','2022-01-08 23:15:08'),(121,'BLG0001F','Manuel, Christian Reymond','Employee logged-in in the system','2022-01-08 23:21:53'),(122,'BLG0002P','Dela Cruz, Juan','Employee logged-in in the system','2022-01-08 23:22:07'),(123,'vidadsoledad@gmail.com','Vidad, Soledad','Applicant has been applied for vacant position','2022-01-08 23:31:11'),(124,'00000','Delara, Julie','Admin logged-in in the system','2022-01-08 23:31:27'),(125,'00000','Delara, Julie','Admin logged-in in the system','2022-01-08 23:36:43'),(126,'00000','Delara, Julie','Admin logged-in in the system','2022-01-08 23:39:56'),(127,'00000','Delara, Julie','New employee added','2022-01-08 23:40:16'),(128,'BLG0001F','Manuel, Christian Reymond','Employee logged-in in the system','2022-01-08 23:40:36'),(129,'BLG0002P','Dela Cruz, Juan','Employee logged-in in the system','2022-01-08 23:40:55'),(130,'BLG0003P','Vidad, Soledad','Employee logged-in in the system','2022-01-08 23:41:20'),(131,'BLG0003P','Vidad, Soledad','Leave Application Sent','2022-01-08 23:41:40'),(132,'BLG0002P','Dela Cruz, Juan','Employee logged-in in the system','2022-01-08 23:41:53'),(133,'BLG0003P','Vidad, Soledad','Employee logged-in in the system','2022-01-08 23:49:13'),(134,'BLG0003P','Vidad, Soledad','Leave Application Sent','2022-01-08 23:49:29'),(135,'BLG0001F','Manuel, Christian Reymond','Employee logged-in in the system','2022-01-08 23:49:49'),(136,'BLG0002P','Dela Cruz, Juan','Employee logged-in in the system','2022-01-08 23:50:13'),(137,'BLG0002P','Dela Cruz, Juan','Employee logged-in in the system','2022-01-08 23:55:23'),(138,'BLG0002P','Dela Cruz, Juan','Employee logged-in in the system','2022-01-08 23:58:41'),(139,'00000','Delara, Julie','Admin logged-in in the system','2022-01-09 00:01:05'),(140,'BLG0002P','Dela Cruz, Juan','Employee logged-in in the system','2022-01-09 00:01:53'),(141,'BLG0002P','Dela Cruz, Juan','Leave Approved','2022-01-09 00:03:02'),(142,'BLG0003P','Vidad, Soledad','Employee logged-in in the system','2022-01-09 01:27:23'),(143,'BLG0002P','Dela Cruz, Juan','Employee logged-in in the system','2022-01-09 01:28:03'),(144,'BLG0002P','Dela Cruz, Juan','Employee logged-in in the system','2022-01-09 01:33:49'),(145,'BLG0002P','Dela Cruz, Juan','Employee logged-in in the system','2022-01-09 01:35:46'),(146,'BLG0002P','Dela Cruz, Juan','Employee logged-in in the system','2022-01-09 01:46:46'),(147,'BLG0002P','Dela Cruz, Juan','COE Multipurpose Approved','2022-01-09 01:46:55'),(148,'BLG0002P','Dela Cruz, Juan','Coe Multipurpose Print','2022-01-09 01:46:57'),(149,'00000','Delara, Julie','Admin logged-in in the system','2022-01-10 09:03:05'),(150,'00000','Delara, Julie','Timesheet searched','2022-01-10 09:03:37'),(151,'00000','Delara, Julie','Timesheet print','2022-01-10 09:03:39'),(152,'00000','Delara, Julie','Admin logged-in in the system','2022-01-10 09:22:41'),(153,'00000','Delara, Julie','Admin logged-in in the system','2022-01-10 09:22:49'),(154,'00000','Delara, Julie','Timesheet searched','2022-01-10 09:23:04'),(155,'00000','Delara, Julie','Timesheet print','2022-01-10 09:23:06'),(156,'00000','Delara, Julie','Admin logged-in in the system','2022-01-10 09:24:08'),(157,'00000','Delara, Julie','Timesheet searched','2022-01-10 09:24:23'),(158,'00000','Delara, Julie','Timesheet searched','2022-01-10 09:24:29'),(159,'00000','Delara, Julie','Timesheet print','2022-01-10 09:24:30'),(160,'00000','Delara, Julie','Admin logged-in in the system','2022-01-10 09:26:18'),(161,'00000','Delara, Julie','Timesheet searched','2022-01-10 09:26:38'),(162,'00000','Delara, Julie','Timesheet print','2022-01-10 09:26:39'),(163,'00000','Delara, Julie','Admin logged-in in the system','2022-01-10 09:27:53'),(164,'00000','Delara, Julie','Timesheet searched','2022-01-10 09:28:10'),(165,'00000','Delara, Julie','Timesheet print','2022-01-10 09:28:12'),(166,'00000','Delara, Julie','Admin logged-in in the system','2022-01-10 09:41:57'),(167,'00000','Delara, Julie','Timesheet searched','2022-01-10 09:42:14'),(168,'00000','Delara, Julie','Timesheet print','2022-01-10 09:42:16'),(169,'00000','Delara, Julie','Admin logged-in in the system','2022-01-10 09:57:21'),(170,'00000','Delara, Julie','Timesheet viewed','2022-01-10 09:57:30'),(171,'00000','Delara, Julie','Timesheet viewed','2022-01-10 09:57:31'),(172,'00000','Delara, Julie','Timesheet uploaded','2022-01-10 09:57:36'),(173,'00000','Delara, Julie','Timesheet viewed','2022-01-10 09:57:37'),(174,'00000','Delara, Julie','Timesheet searched','2022-01-10 09:57:53'),(175,'00000','Delara, Julie','Timesheet print','2022-01-10 09:57:58'),(176,'00000','Delara, Julie','Admin logged-in in the system','2022-01-10 10:05:30'),(177,'00000','Delara, Julie','Admin logged-in in the system','2022-01-10 10:07:08'),(178,'00000','Delara, Julie','Admin logged-in in the system','2022-01-10 10:09:21'),(179,'00000','Delara, Julie','Admin logged-in in the system','2022-01-10 10:46:36'),(180,'00000','Delara, Julie','Timesheet viewed','2022-01-10 10:50:47'),(181,'00000','Delara, Julie','Timesheet viewed','2022-01-10 10:50:48'),(182,'00000','Delara, Julie','Timesheet uploaded','2022-01-10 10:51:00'),(183,'00000','Delara, Julie','Timesheet viewed','2022-01-10 10:51:02'),(184,'00000','Delara, Julie','Timesheet searched','2022-01-10 10:51:13'),(185,'BLG0002P','Dela Cruz, Juan','Employee logged-in in the system','2022-01-10 10:52:04'),(186,'BLG0003P','Vidad, Soledad','Employee logged-in in the system','2022-01-10 10:52:32'),(187,'BLG0002P','Dela Cruz, Juan','COE Multipurpose Approved','2022-01-10 10:53:22'),(188,'BLG0002P','Dela Cruz, Juan','Coe Multipurpose Print','2022-01-10 10:53:24'),(189,'BLG0002P','Dela Cruz, Juan','Coe Multipurpose Print','2022-01-10 10:53:59'),(190,'00000','Delara, Julie','Admin logged-in in the system','2022-01-10 10:54:31'),(191,'00000','Delara, Julie','Coe Multipurpose Print','2022-01-10 10:54:46'),(192,'BLG0003P','Vidad, Soledad','Employee logged-in in the system','2022-01-10 10:55:07'),(193,'BLG0003P','Vidad, Soledad','Leave Application Sent','2022-01-10 10:55:25'),(194,'00000','Delara, Julie','Admin logged-in in the system','2022-01-10 10:55:43'),(195,'BLG0002P','Dela Cruz, Juan','Leave Approved','2022-01-10 10:56:22'),(196,'00000','Delara, Julie','Employee viewed','2022-01-10 10:58:35'),(197,'00000','Delara, Julie','Employee viewed','2022-01-10 10:59:18'),(198,'00000','Delara, Julie','Employee viewed','2022-01-10 11:00:12'),(199,'00000','Delara, Julie','Employee viewed','2022-01-10 11:00:26'),(200,'00000','Delara, Julie','Timesheet searched','2022-01-10 11:02:47'),(201,'BLG0002P','Dela Cruz, Juan','Employee logged-in in the system','2022-01-10 11:03:19'),(202,'00000','Delara, Julie','Admin logged-in in the system','2022-01-10 11:03:52'),(203,'00000','Delara, Julie','Employee viewed','2022-01-10 11:03:56'),(204,'BLG0002P','Dela Cruz, Juan','Employee logged-in in the system','2022-01-10 11:04:50'),(205,'00000','Delara, Julie','Admin logged-in in the system','2022-01-10 11:05:19'),(206,'00000','Delara, Julie','Timesheet searched','2022-01-10 11:05:43'),(207,'00000','Delara, Julie','Timesheet viewed','2022-01-10 11:05:53'),(208,'BLG0003P','Vidad, Soledad','Employee logged-in in the system','2022-01-10 11:06:38'),(209,'BLG0003P','Vidad, Soledad','Leave Application Sent','2022-01-10 11:07:18'),(210,'BLG0002P','Dela Cruz, Juan','Leave Approved','2022-01-10 11:07:32'),(211,'00000','Delara, Julie','Admin logged-in in the system','2022-01-10 11:07:43'),(212,'BLG0002P','Dela Cruz, Juan','Coe Multipurpose Print','2022-01-10 11:08:19'),(213,'BLG0002P','Dela Cruz, Juan','Coe Multipurpose Print','2022-01-10 11:08:50');
/*!40000 ALTER TABLE `useractivity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `userName` varchar(150) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  `userType` varchar(50) DEFAULT NULL,
  `firstName` varchar(100) NOT NULL,
  `lastName` varchar(100) NOT NULL,
  `middleName` varchar(50) DEFAULT NULL,
  `isActive` bit(1) DEFAULT b'1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'00000','00000','ADMINISTRATOR','Julie','Delara',NULL,_binary ''),(2,'christianreymanuel23@gmail.com','','APPLICANT','Christian Reymond','Manuel','Elementary',_binary '\0'),(3,'BLG0001F','KkYyE3sg','EMPLOYEE','Christian Reymond','Manuel',NULL,_binary ''),(4,'xenada3886@veb34.com','','APPLICANT','Juan','Dela Cruz',NULL,_binary '\0'),(5,'BLG0002P','H6Vvj0OD','EMPLOYEE','Juan','Dela Cruz',NULL,_binary ''),(6,'vidadsoledad@gmail.com','','APPLICANT','Soledad','Vidad',NULL,_binary '\0'),(7,'BLG0003P','k1yEeSs9','EMPLOYEE','Soledad','Vidad',NULL,_binary '');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `workexperience`
--

DROP TABLE IF EXISTS `workexperience`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `workexperience` (
  `id` int NOT NULL AUTO_INCREMENT,
  `employeeId` varchar(50) DEFAULT NULL,
  `fullName` varchar(100) DEFAULT NULL,
  `company` varchar(50) DEFAULT NULL,
  `position` varchar(50) DEFAULT NULL,
  `inclusiveDates` varchar(50) DEFAULT NULL,
  `natureOfSeparation` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `workexperience`
--

LOCK TABLES `workexperience` WRITE;
/*!40000 ALTER TABLE `workexperience` DISABLE KEYS */;
INSERT INTO `workexperience` VALUES (1,'BLG0001F','Manuel, Christian Reymond Vidad','Jolibee','Crew','2018','Resigned');
/*!40000 ALTER TABLE `workexperience` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-01-11 15:56:07
