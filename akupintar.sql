-- MySQL dump 10.13  Distrib 8.0.30, for Win64 (x86_64)
--
-- Host: localhost    Database: akupintar
-- ------------------------------------------------------
-- Server version	8.0.30

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
-- Table structure for table `alumni`
--

DROP TABLE IF EXISTS `alumni`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `alumni` (
  `id` int NOT NULL AUTO_INCREMENT,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `name` text NOT NULL,
  `position` text NOT NULL,
  `image` text,
  `campusId` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `campusId` (`campusId`),
  CONSTRAINT `alumni_ibfk_1` FOREIGN KEY (`campusId`) REFERENCES `campus` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `campus`
--

DROP TABLE IF EXISTS `campus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `campus` (
  `id` int NOT NULL AUTO_INCREMENT,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `accreditation` varchar(1) NOT NULL,
  `category` text NOT NULL,
  `status` text NOT NULL,
  `profile` text,
  `history` text,
  `achievement` text,
  `location` text NOT NULL,
  `image` text,
  `phone_number` text,
  `fax` text,
  `rangking` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `campus_entrance`
--

DROP TABLE IF EXISTS `campus_entrance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `campus_entrance` (
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `entranceId` int NOT NULL,
  `campusId` int NOT NULL,
  PRIMARY KEY (`entranceId`,`campusId`),
  KEY `campusId` (`campusId`),
  CONSTRAINT `campus_entrance_ibfk_1` FOREIGN KEY (`entranceId`) REFERENCES `entrance` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `campus_entrance_ibfk_2` FOREIGN KEY (`campusId`) REFERENCES `campus` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `campus_scholarship`
--

DROP TABLE IF EXISTS `campus_scholarship`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `campus_scholarship` (
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `scholarshipId` int NOT NULL,
  `campusId` int NOT NULL,
  PRIMARY KEY (`scholarshipId`,`campusId`),
  KEY `campusId` (`campusId`),
  CONSTRAINT `campus_scholarship_ibfk_1` FOREIGN KEY (`scholarshipId`) REFERENCES `scholarship` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `campus_scholarship_ibfk_2` FOREIGN KEY (`campusId`) REFERENCES `campus` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `comment`
--

DROP TABLE IF EXISTS `comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comment` (
  `id` int NOT NULL AUTO_INCREMENT,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `text` text NOT NULL,
  `discussionId` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `discussionId` (`discussionId`),
  CONSTRAINT `comment_ibfk_1` FOREIGN KEY (`discussionId`) REFERENCES `discussion` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `discussion`
--

DROP TABLE IF EXISTS `discussion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `discussion` (
  `id` int NOT NULL AUTO_INCREMENT,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `text` text NOT NULL,
  `userId` int DEFAULT NULL,
  `campusId` int DEFAULT NULL,
  `scholarshipId` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `userId` (`userId`),
  KEY `campusId` (`campusId`),
  KEY `scholarshipId` (`scholarshipId`),
  CONSTRAINT `discussion_ibfk_12` FOREIGN KEY (`userId`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `discussion_ibfk_13` FOREIGN KEY (`campusId`) REFERENCES `campus` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `discussion_ibfk_14` FOREIGN KEY (`scholarshipId`) REFERENCES `scholarship` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `entrance`
--

DROP TABLE IF EXISTS `entrance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `entrance` (
  `id` int NOT NULL AUTO_INCREMENT,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `registration_from` datetime DEFAULT NULL,
  `registration_to` datetime DEFAULT NULL,
  `level` varchar(255) DEFAULT NULL,
  `fees` int DEFAULT NULL,
  `website` text,
  `condition` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `faculty`
--

DROP TABLE IF EXISTS `faculty`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `faculty` (
  `id` int NOT NULL AUTO_INCREMENT,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `campusId` int DEFAULT NULL,
  `name` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `campusId` (`campusId`),
  CONSTRAINT `faculty_ibfk_1` FOREIGN KEY (`campusId`) REFERENCES `campus` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `follow_list`
--

DROP TABLE IF EXISTS `follow_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `follow_list` (
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `campusId` int NOT NULL,
  `userId` int NOT NULL,
  PRIMARY KEY (`campusId`,`userId`),
  KEY `userId` (`userId`),
  CONSTRAINT `follow_list_ibfk_1` FOREIGN KEY (`campusId`) REFERENCES `campus` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `follow_list_ibfk_2` FOREIGN KEY (`userId`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `major`
--

DROP TABLE IF EXISTS `major`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `major` (
  `id` int NOT NULL AUTO_INCREMENT,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `accreditation` varchar(1) DEFAULT NULL,
  `ukt_maximum` bigint DEFAULT NULL,
  `ukt_minimum` bigint DEFAULT NULL,
  `website` text,
  `prospect` text,
  `learned` text,
  `facultyId` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `facultyId` (`facultyId`),
  CONSTRAINT `major_ibfk_1` FOREIGN KEY (`facultyId`) REFERENCES `faculty` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `news`
--

DROP TABLE IF EXISTS `news`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `news` (
  `id` int NOT NULL AUTO_INCREMENT,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `title` text NOT NULL,
  `text` text,
  `campusId` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `campusId` (`campusId`),
  CONSTRAINT `news_ibfk_1` FOREIGN KEY (`campusId`) REFERENCES `campus` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `scholarship`
--

DROP TABLE IF EXISTS `scholarship`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `scholarship` (
  `id` int NOT NULL AUTO_INCREMENT,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `by` text,
  `country` text,
  `education` text,
  `deadline_from` datetime DEFAULT NULL,
  `deadline_to` datetime DEFAULT NULL,
  `selection` datetime DEFAULT NULL,
  `announcement` datetime DEFAULT NULL,
  `description` text,
  `document` text,
  `procedure` text,
  `schedule` text,
  `scholarship` text,
  `condition` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `subject`
--

DROP TABLE IF EXISTS `subject`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `subject` (
  `id` int NOT NULL AUTO_INCREMENT,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `name` text NOT NULL,
  `sks` int NOT NULL,
  `majorId` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `majorId` (`majorId`),
  CONSTRAINT `subject_ibfk_1` FOREIGN KEY (`majorId`) REFERENCES `major` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `name` text,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-10-11 22:41:30