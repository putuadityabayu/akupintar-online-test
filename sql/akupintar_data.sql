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
-- Dumping data for table `alumni`
--

LOCK TABLES `alumni` WRITE;
/*!40000 ALTER TABLE `alumni` DISABLE KEYS */;
/*!40000 ALTER TABLE `alumni` ENABLE KEYS */;
UNLOCK TABLES;

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
  `name` text,
  `accreditation` varchar(1) DEFAULT NULL,
  `profile` text,
  `history` text,
  `achievement` text,
  `location` text NOT NULL,
  `image` text,
  `phone_number` text,
  `fax` text,
  `rangking` int DEFAULT NULL,
  `politeknik` tinyint(1) DEFAULT '0',
  `statusId` int DEFAULT NULL,
  `categoryId` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `statusId` (`statusId`),
  KEY `categoryId` (`categoryId`),
  CONSTRAINT `campus_ibfk_131` FOREIGN KEY (`statusId`) REFERENCES `status` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `campus_ibfk_132` FOREIGN KEY (`categoryId`) REFERENCES `category` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `campus`
--

LOCK TABLES `campus` WRITE;
/*!40000 ALTER TABLE `campus` DISABLE KEYS */;
INSERT INTO `campus` VALUES (1,'2022-10-12 19:51:15','2022-10-12 19:51:15','AKADEMI PARIWISATA NUSANTARA','B','Profil \n\nUniversitas Brawijaya merupakan saah satu universitas terkemuka di Indonesia yang didirikan oleh Presiden Republik Indonesia melalui kawat no. 258/K/61 dikirim pada tanggal 11 Juli 1961. Nama Brawijaya ini diambil dari gelar Raja-Raja Majapahit, sebuah kerajaan besar di Indonesia dari abad ke-12 hingga ke-15. UB telah terakreditasi secara nasional dan internasional dengan tingkat nilai A baik dari BAN-PT dan juga IATUL Universitas Brawijaya berusaha untuk terus memberikan fasilitas yang dapat menunjang setiap mahasiswa didalamnya.',NULL,'Webometrics :\nMeraih peringkat 5 dalam hasil penilaian perguruan tinggi se-Indonesia pada periode Januari 2013\n\n4ICU :\nMeraih peringkat 4 dalam hasil penilaian situs perguruan tinggi se-Indonesia pada periode Januari 2013\n\nQS-Stars :\nJurusan Teknik Sipil UB meraih peringkat 4 dalam kategori jurusan Teknik Sipil terbaik se-Indonesia\nJurusan Ilmu Akuntansi UB meraih peringkat 2 dalam kategori jurusan Ilmu Akuntansi terbaik se-Indonesia\nJurusan Ilmu Komunikasi UB meraih peringkat 3 dalam kategori jurusan Ilmu Komunikasi terbaik se-Indonesia','Kota Tangerang Selatan, Banten','https://image','0812345678','021-23456',398,0,3,1),(2,'2022-10-12 19:51:15','2022-10-12 19:51:15','Universitas Brawijaya (UB)','A','Profil \n\nUniversitas Brawijaya merupakan saah satu universitas terkemuka di Indonesia yang didirikan oleh Presiden Republik Indonesia melalui kawat no. 258/K/61 dikirim pada tanggal 11 Juli 1961. Nama Brawijaya ini diambil dari gelar Raja-Raja Majapahit, sebuah kerajaan besar di Indonesia dari abad ke-12 hingga ke-15. UB telah terakreditasi secara nasional dan internasional dengan tingkat nilai A baik dari BAN-PT dan juga IATUL Universitas Brawijaya berusaha untuk terus memberikan fasilitas yang dapat menunjang setiap mahasiswa didalamnya.',NULL,'Webometrics :\nMeraih peringkat 5 dalam hasil penilaian perguruan tinggi se-Indonesia pada periode Januari 2013\n\n4ICU :\nMeraih peringkat 4 dalam hasil penilaian situs perguruan tinggi se-Indonesia pada periode Januari 2013\n\nQS-Stars :\nJurusan Teknik Sipil UB meraih peringkat 4 dalam kategori jurusan Teknik Sipil terbaik se-Indonesia\nJurusan Ilmu Akuntansi UB meraih peringkat 2 dalam kategori jurusan Ilmu Akuntansi terbaik se-Indonesia\nJurusan Ilmu Komunikasi UB meraih peringkat 3 dalam kategori jurusan Ilmu Komunikasi terbaik se-Indonesia','Kota Malang, Jawa Timur','https://image','0812345678','021-23456',428,0,3,2),(3,'2022-10-12 19:51:15','2022-10-12 19:51:15','Akademi Komunitas Industri Tekstil dan Produk Tekstil Surakarta',NULL,'Profil \n\nUniversitas Brawijaya merupakan saah satu universitas terkemuka di Indonesia yang didirikan oleh Presiden Republik Indonesia melalui kawat no. 258/K/61 dikirim pada tanggal 11 Juli 1961. Nama Brawijaya ini diambil dari gelar Raja-Raja Majapahit, sebuah kerajaan besar di Indonesia dari abad ke-12 hingga ke-15. UB telah terakreditasi secara nasional dan internasional dengan tingkat nilai A baik dari BAN-PT dan juga IATUL Universitas Brawijaya berusaha untuk terus memberikan fasilitas yang dapat menunjang setiap mahasiswa didalamnya.',NULL,'Webometrics :\nMeraih peringkat 5 dalam hasil penilaian perguruan tinggi se-Indonesia pada periode Januari 2013\n\n4ICU :\nMeraih peringkat 4 dalam hasil penilaian situs perguruan tinggi se-Indonesia pada periode Januari 2013\n\nQS-Stars :\nJurusan Teknik Sipil UB meraih peringkat 4 dalam kategori jurusan Teknik Sipil terbaik se-Indonesia\nJurusan Ilmu Akuntansi UB meraih peringkat 2 dalam kategori jurusan Ilmu Akuntansi terbaik se-Indonesia\nJurusan Ilmu Komunikasi UB meraih peringkat 3 dalam kategori jurusan Ilmu Komunikasi terbaik se-Indonesia','Kota Surakarta, Jawa Tengah','https://image','0812345678','021-23456',89,1,3,2),(4,'2022-10-12 19:51:15','2022-10-12 19:51:15','AKADEMI PARIWISATA NUSANTARA','B','Profil \n\nUniversitas Brawijaya merupakan saah satu universitas terkemuka di Indonesia yang didirikan oleh Presiden Republik Indonesia melalui kawat no. 258/K/61 dikirim pada tanggal 11 Juli 1961. Nama Brawijaya ini diambil dari gelar Raja-Raja Majapahit, sebuah kerajaan besar di Indonesia dari abad ke-12 hingga ke-15. UB telah terakreditasi secara nasional dan internasional dengan tingkat nilai A baik dari BAN-PT dan juga IATUL Universitas Brawijaya berusaha untuk terus memberikan fasilitas yang dapat menunjang setiap mahasiswa didalamnya.',NULL,'Webometrics :\nMeraih peringkat 5 dalam hasil penilaian perguruan tinggi se-Indonesia pada periode Januari 2013\n\n4ICU :\nMeraih peringkat 4 dalam hasil penilaian situs perguruan tinggi se-Indonesia pada periode Januari 2013\n\nQS-Stars :\nJurusan Teknik Sipil UB meraih peringkat 4 dalam kategori jurusan Teknik Sipil terbaik se-Indonesia\nJurusan Ilmu Akuntansi UB meraih peringkat 2 dalam kategori jurusan Ilmu Akuntansi terbaik se-Indonesia\nJurusan Ilmu Komunikasi UB meraih peringkat 3 dalam kategori jurusan Ilmu Komunikasi terbaik se-Indonesia','Kota Tangerang Selatan, Banten','https://image','0812345678','021-23456',404,0,3,1),(5,'2022-10-12 19:51:15','2022-10-12 19:51:15','Politeknik APP Jakarta','B','Profil \n\nUniversitas Brawijaya merupakan saah satu universitas terkemuka di Indonesia yang didirikan oleh Presiden Republik Indonesia melalui kawat no. 258/K/61 dikirim pada tanggal 11 Juli 1961. Nama Brawijaya ini diambil dari gelar Raja-Raja Majapahit, sebuah kerajaan besar di Indonesia dari abad ke-12 hingga ke-15. UB telah terakreditasi secara nasional dan internasional dengan tingkat nilai A baik dari BAN-PT dan juga IATUL Universitas Brawijaya berusaha untuk terus memberikan fasilitas yang dapat menunjang setiap mahasiswa didalamnya.',NULL,'Webometrics :\nMeraih peringkat 5 dalam hasil penilaian perguruan tinggi se-Indonesia pada periode Januari 2013\n\n4ICU :\nMeraih peringkat 4 dalam hasil penilaian situs perguruan tinggi se-Indonesia pada periode Januari 2013\n\nQS-Stars :\nJurusan Teknik Sipil UB meraih peringkat 4 dalam kategori jurusan Teknik Sipil terbaik se-Indonesia\nJurusan Ilmu Akuntansi UB meraih peringkat 2 dalam kategori jurusan Ilmu Akuntansi terbaik se-Indonesia\nJurusan Ilmu Komunikasi UB meraih peringkat 3 dalam kategori jurusan Ilmu Komunikasi terbaik se-Indonesia','Kota Jakarta Selatan, DKI Jakarta','https://image','0812345678','021-23456',181,1,3,2);
/*!40000 ALTER TABLE `campus` ENABLE KEYS */;
UNLOCK TABLES;

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
-- Dumping data for table `campus_entrance`
--

LOCK TABLES `campus_entrance` WRITE;
/*!40000 ALTER TABLE `campus_entrance` DISABLE KEYS */;
/*!40000 ALTER TABLE `campus_entrance` ENABLE KEYS */;
UNLOCK TABLES;

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
-- Dumping data for table `campus_scholarship`
--

LOCK TABLES `campus_scholarship` WRITE;
/*!40000 ALTER TABLE `campus_scholarship` DISABLE KEYS */;
/*!40000 ALTER TABLE `campus_scholarship` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category` (
  `id` int NOT NULL AUTO_INCREMENT,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `name` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (1,'2022-10-12 20:37:14','2022-10-12 20:37:14','NEGERI'),(2,'2022-10-12 20:37:14','2022-10-12 20:37:14','SWASTA'),(3,'2022-10-12 20:37:14','2022-10-12 20:37:14','KEDINASAN');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

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
  `userId` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `comment_userId_foreign_idx` (`userId`),
  KEY `discussionId` (`discussionId`),
  CONSTRAINT `comment_ibfk_1` FOREIGN KEY (`discussionId`) REFERENCES `discussion` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `comment_userId_foreign_idx` FOREIGN KEY (`userId`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comment`
--

LOCK TABLES `comment` WRITE;
/*!40000 ALTER TABLE `comment` DISABLE KEYS */;
/*!40000 ALTER TABLE `comment` ENABLE KEYS */;
UNLOCK TABLES;

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
  CONSTRAINT `discussion_ibfk_196` FOREIGN KEY (`userId`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `discussion_ibfk_197` FOREIGN KEY (`campusId`) REFERENCES `campus` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `discussion_ibfk_198` FOREIGN KEY (`scholarshipId`) REFERENCES `scholarship` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `discussion`
--

LOCK TABLES `discussion` WRITE;
/*!40000 ALTER TABLE `discussion` DISABLE KEYS */;
/*!40000 ALTER TABLE `discussion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `discussion_votes`
--

DROP TABLE IF EXISTS `discussion_votes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `discussion_votes` (
  `type` varchar(4) NOT NULL,
  `discussionId` int NOT NULL,
  `userId` int NOT NULL,
  PRIMARY KEY (`discussionId`,`userId`),
  KEY `userId` (`userId`),
  CONSTRAINT `discussion_votes_ibfk_1` FOREIGN KEY (`discussionId`) REFERENCES `discussion` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `discussion_votes_ibfk_2` FOREIGN KEY (`userId`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `discussion_votes`
--

LOCK TABLES `discussion_votes` WRITE;
/*!40000 ALTER TABLE `discussion_votes` DISABLE KEYS */;
/*!40000 ALTER TABLE `discussion_votes` ENABLE KEYS */;
UNLOCK TABLES;

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
-- Dumping data for table `entrance`
--

LOCK TABLES `entrance` WRITE;
/*!40000 ALTER TABLE `entrance` DISABLE KEYS */;
/*!40000 ALTER TABLE `entrance` ENABLE KEYS */;
UNLOCK TABLES;

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
  `name` text NOT NULL,
  `campusId` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `campusId` (`campusId`),
  CONSTRAINT `faculty_ibfk_1` FOREIGN KEY (`campusId`) REFERENCES `campus` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1039 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `faculty`
--

LOCK TABLES `faculty` WRITE;
/*!40000 ALTER TABLE `faculty` DISABLE KEYS */;
INSERT INTO `faculty` VALUES (1026,'2022-10-12 22:01:18','2022-10-12 22:01:18','Fakultas Ilmu Administrasi',1),(1027,'2022-10-12 22:01:18','2022-10-12 22:01:18','Fakultas Ilmu Administrasi',2),(1028,'2022-10-12 22:01:18','2022-10-12 22:01:18','Program Studi Diluar Kampus Utama (psdku) Kediri',2),(1029,'2022-10-12 22:01:18','2022-10-12 22:01:18','Fakultas Perikanan dan Ilmu Kelautan',2),(1030,'2022-10-12 22:01:18','2022-10-12 22:01:18','Fakultas Pertanian',2),(1031,'2022-10-12 22:01:18','2022-10-12 22:01:18','Fakultas Pertanian',3),(1032,'2022-10-12 22:01:18','2022-10-12 22:01:18','Program Studi Diluar Kampus Utama (psdku) Kediri',3),(1033,'2022-10-12 22:01:18','2022-10-12 22:01:18','Fakultas Pertanian',3),(1034,'2022-10-12 22:01:18','2022-10-12 22:01:18','Program Studi Diluar Kampus Utama (psdku) Kediri',4),(1035,'2022-10-12 22:01:18','2022-10-12 22:01:18','Program Studi Diluar Kampus Utama (psdku) Kediri',4),(1036,'2022-10-12 22:01:18','2022-10-12 22:01:18','Fakultas Ilmu Administrasi',5),(1037,'2022-10-12 22:01:18','2022-10-12 22:01:18','Fakultas Pertanian',5),(1038,'2022-10-12 22:01:18','2022-10-12 22:01:18','Program Studi Diluar Kampus Utama (psdku) Kediri',5);
/*!40000 ALTER TABLE `faculty` ENABLE KEYS */;
UNLOCK TABLES;

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
-- Dumping data for table `follow_list`
--

LOCK TABLES `follow_list` WRITE;
/*!40000 ALTER TABLE `follow_list` DISABLE KEYS */;
/*!40000 ALTER TABLE `follow_list` ENABLE KEYS */;
UNLOCK TABLES;

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
  `name` text,
  `accreditation` varchar(1) DEFAULT NULL,
  `ukt_maximum` bigint DEFAULT NULL,
  `ukt_minimum` bigint DEFAULT NULL,
  `website` text,
  `prospect` text,
  `learned` text,
  `strataId` int DEFAULT NULL,
  `facultyId` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `strataId` (`strataId`),
  KEY `facultyId` (`facultyId`),
  CONSTRAINT `major_ibfk_131` FOREIGN KEY (`strataId`) REFERENCES `strata` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `major_ibfk_132` FOREIGN KEY (`facultyId`) REFERENCES `faculty` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=15739 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `major`
--

LOCK TABLES `major` WRITE;
/*!40000 ALTER TABLE `major` DISABLE KEYS */;
INSERT INTO `major` VALUES (15637,'2022-10-12 22:01:18','2022-10-12 22:01:18','Aktuaria','B',23200000,1400000,'https://','Lembaga Keuangan, Akuntan Pemerintah, Akuntan Publik/Perusahaan, Account Officer, Tenaga Pendidik, Wirausaha','Ilmu menganalisis dan melaporkan',1,1026),(15638,'2022-10-12 22:01:18','2022-10-12 22:01:18','Akuakultur','B',25500000,200000,'https://','Lembaga Keuangan, Akuntan Pemerintah, Akuntan Publik/Perusahaan, Account Officer, Tenaga Pendidik, Wirausaha','Ilmu menganalisis dan melaporkan',1,1026),(15639,'2022-10-12 22:01:18','2022-10-12 22:01:18','Akuakultur','A',21100000,100000,'https://','Lembaga Keuangan, Akuntan Pemerintah, Akuntan Publik/Perusahaan, Account Officer, Tenaga Pendidik, Wirausaha','Ilmu menganalisis dan melaporkan',2,1026),(15640,'2022-10-12 22:01:18','2022-10-12 22:01:18','Akuntansi','C',18800000,1700000,'https://','Lembaga Keuangan, Akuntan Pemerintah, Akuntan Publik/Perusahaan, Account Officer, Tenaga Pendidik, Wirausaha','Ilmu menganalisis dan melaporkan',1,1026),(15641,'2022-10-12 22:01:18','2022-10-12 22:01:18','Antropologi','B',22600000,1500000,'https://','Lembaga Keuangan, Akuntan Pemerintah, Akuntan Publik/Perusahaan, Account Officer, Tenaga Pendidik, Wirausaha','Ilmu menganalisis dan melaporkan',1,1026),(15642,'2022-10-12 22:01:18','2022-10-12 22:01:18','Arsitektur','B',28500000,1000000,'https://','Lembaga Keuangan, Akuntan Pemerintah, Akuntan Publik/Perusahaan, Account Officer, Tenaga Pendidik, Wirausaha','Ilmu menganalisis dan melaporkan',1,1026),(15643,'2022-10-12 22:01:18','2022-10-12 22:01:18','Bahasa dan Sastra Prancis','A',22400000,1800000,'https://','Lembaga Keuangan, Akuntan Pemerintah, Akuntan Publik/Perusahaan, Account Officer, Tenaga Pendidik, Wirausaha','Ilmu menganalisis dan melaporkan',1,1026),(15644,'2022-10-12 22:01:18','2022-10-12 22:01:18','Bahasa dan Sastra Prancis','A',15500000,1600000,'https://','Lembaga Keuangan, Akuntan Pemerintah, Akuntan Publik/Perusahaan, Account Officer, Tenaga Pendidik, Wirausaha','Ilmu menganalisis dan melaporkan',2,1026),(15645,'2022-10-12 22:01:18','2022-10-12 22:01:18','Aktuaria','C',20100000,1800000,'https://','Lembaga Keuangan, Akuntan Pemerintah, Akuntan Publik/Perusahaan, Account Officer, Tenaga Pendidik, Wirausaha','Ilmu menganalisis dan melaporkan',1,1027),(15646,'2022-10-12 22:01:18','2022-10-12 22:01:18','Akuakultur','B',11200000,1500000,'https://','Lembaga Keuangan, Akuntan Pemerintah, Akuntan Publik/Perusahaan, Account Officer, Tenaga Pendidik, Wirausaha','Ilmu menganalisis dan melaporkan',1,1027),(15647,'2022-10-12 22:01:18','2022-10-12 22:01:18','Akuakultur','C',17900000,700000,'https://','Lembaga Keuangan, Akuntan Pemerintah, Akuntan Publik/Perusahaan, Account Officer, Tenaga Pendidik, Wirausaha','Ilmu menganalisis dan melaporkan',2,1027),(15648,'2022-10-12 22:01:18','2022-10-12 22:01:18','Akuntansi','C',27400000,300000,'https://','Lembaga Keuangan, Akuntan Pemerintah, Akuntan Publik/Perusahaan, Account Officer, Tenaga Pendidik, Wirausaha','Ilmu menganalisis dan melaporkan',1,1027),(15649,'2022-10-12 22:01:18','2022-10-12 22:01:18','Akuntansi','B',26200000,1800000,'https://','Lembaga Keuangan, Akuntan Pemerintah, Akuntan Publik/Perusahaan, Account Officer, Tenaga Pendidik, Wirausaha','Ilmu menganalisis dan melaporkan',2,1027),(15650,'2022-10-12 22:01:18','2022-10-12 22:01:18','Antropologi','A',21100000,900000,'https://','Lembaga Keuangan, Akuntan Pemerintah, Akuntan Publik/Perusahaan, Account Officer, Tenaga Pendidik, Wirausaha','Ilmu menganalisis dan melaporkan',1,1027),(15651,'2022-10-12 22:01:18','2022-10-12 22:01:18','Antropologi','C',24100000,1400000,'https://','Lembaga Keuangan, Akuntan Pemerintah, Akuntan Publik/Perusahaan, Account Officer, Tenaga Pendidik, Wirausaha','Ilmu menganalisis dan melaporkan',2,1027),(15652,'2022-10-12 22:01:18','2022-10-12 22:01:18','Arsitektur','B',26300000,700000,'https://','Lembaga Keuangan, Akuntan Pemerintah, Akuntan Publik/Perusahaan, Account Officer, Tenaga Pendidik, Wirausaha','Ilmu menganalisis dan melaporkan',1,1027),(15653,'2022-10-12 22:01:18','2022-10-12 22:01:18','Bahasa dan Sastra Prancis','B',29000000,1100000,'https://','Lembaga Keuangan, Akuntan Pemerintah, Akuntan Publik/Perusahaan, Account Officer, Tenaga Pendidik, Wirausaha','Ilmu menganalisis dan melaporkan',1,1027),(15654,'2022-10-12 22:01:18','2022-10-12 22:01:18','Aktuaria','A',10900000,300000,'https://','Lembaga Keuangan, Akuntan Pemerintah, Akuntan Publik/Perusahaan, Account Officer, Tenaga Pendidik, Wirausaha','Ilmu menganalisis dan melaporkan',1,1028),(15655,'2022-10-12 22:01:18','2022-10-12 22:01:18','Akuakultur','B',29700000,900000,'https://','Lembaga Keuangan, Akuntan Pemerintah, Akuntan Publik/Perusahaan, Account Officer, Tenaga Pendidik, Wirausaha','Ilmu menganalisis dan melaporkan',1,1028),(15656,'2022-10-12 22:01:18','2022-10-12 22:01:18','Akuakultur','C',21800000,700000,'https://','Lembaga Keuangan, Akuntan Pemerintah, Akuntan Publik/Perusahaan, Account Officer, Tenaga Pendidik, Wirausaha','Ilmu menganalisis dan melaporkan',2,1028),(15657,'2022-10-12 22:01:18','2022-10-12 22:01:18','Akuntansi','C',29800000,1700000,'https://','Lembaga Keuangan, Akuntan Pemerintah, Akuntan Publik/Perusahaan, Account Officer, Tenaga Pendidik, Wirausaha','Ilmu menganalisis dan melaporkan',1,1028),(15658,'2022-10-12 22:01:18','2022-10-12 22:01:18','Antropologi','C',12900000,2000000,'https://','Lembaga Keuangan, Akuntan Pemerintah, Akuntan Publik/Perusahaan, Account Officer, Tenaga Pendidik, Wirausaha','Ilmu menganalisis dan melaporkan',1,1028),(15659,'2022-10-12 22:01:18','2022-10-12 22:01:18','Arsitektur','C',21500000,1600000,'https://','Lembaga Keuangan, Akuntan Pemerintah, Akuntan Publik/Perusahaan, Account Officer, Tenaga Pendidik, Wirausaha','Ilmu menganalisis dan melaporkan',1,1028),(15660,'2022-10-12 22:01:18','2022-10-12 22:01:18','Bahasa dan Sastra Prancis','C',14900000,1900000,'https://','Lembaga Keuangan, Akuntan Pemerintah, Akuntan Publik/Perusahaan, Account Officer, Tenaga Pendidik, Wirausaha','Ilmu menganalisis dan melaporkan',1,1028),(15661,'2022-10-12 22:01:18','2022-10-12 22:01:18','Bahasa dan Sastra Prancis','B',11800000,1700000,'https://','Lembaga Keuangan, Akuntan Pemerintah, Akuntan Publik/Perusahaan, Account Officer, Tenaga Pendidik, Wirausaha','Ilmu menganalisis dan melaporkan',2,1028),(15662,'2022-10-12 22:01:18','2022-10-12 22:01:18','Aktuaria','A',26800000,1500000,'https://','Lembaga Keuangan, Akuntan Pemerintah, Akuntan Publik/Perusahaan, Account Officer, Tenaga Pendidik, Wirausaha','Ilmu menganalisis dan melaporkan',1,1029),(15663,'2022-10-12 22:01:18','2022-10-12 22:01:18','Akuakultur','A',11800000,400000,'https://','Lembaga Keuangan, Akuntan Pemerintah, Akuntan Publik/Perusahaan, Account Officer, Tenaga Pendidik, Wirausaha','Ilmu menganalisis dan melaporkan',1,1029),(15664,'2022-10-12 22:01:18','2022-10-12 22:01:18','Akuntansi','C',25000000,900000,'https://','Lembaga Keuangan, Akuntan Pemerintah, Akuntan Publik/Perusahaan, Account Officer, Tenaga Pendidik, Wirausaha','Ilmu menganalisis dan melaporkan',1,1029),(15665,'2022-10-12 22:01:18','2022-10-12 22:01:18','Antropologi','A',21500000,1300000,'https://','Lembaga Keuangan, Akuntan Pemerintah, Akuntan Publik/Perusahaan, Account Officer, Tenaga Pendidik, Wirausaha','Ilmu menganalisis dan melaporkan',1,1029),(15666,'2022-10-12 22:01:18','2022-10-12 22:01:18','Arsitektur','A',16900000,300000,'https://','Lembaga Keuangan, Akuntan Pemerintah, Akuntan Publik/Perusahaan, Account Officer, Tenaga Pendidik, Wirausaha','Ilmu menganalisis dan melaporkan',1,1029),(15667,'2022-10-12 22:01:18','2022-10-12 22:01:18','Bahasa dan Sastra Prancis','A',27600000,1100000,'https://','Lembaga Keuangan, Akuntan Pemerintah, Akuntan Publik/Perusahaan, Account Officer, Tenaga Pendidik, Wirausaha','Ilmu menganalisis dan melaporkan',1,1029),(15668,'2022-10-12 22:01:18','2022-10-12 22:01:18','Bahasa dan Sastra Prancis','B',25100000,1100000,'https://','Lembaga Keuangan, Akuntan Pemerintah, Akuntan Publik/Perusahaan, Account Officer, Tenaga Pendidik, Wirausaha','Ilmu menganalisis dan melaporkan',2,1029),(15669,'2022-10-12 22:01:18','2022-10-12 22:01:18','Aktuaria','A',13600000,900000,'https://','Lembaga Keuangan, Akuntan Pemerintah, Akuntan Publik/Perusahaan, Account Officer, Tenaga Pendidik, Wirausaha','Ilmu menganalisis dan melaporkan',1,1030),(15670,'2022-10-12 22:01:18','2022-10-12 22:01:18','Akuakultur','C',14200000,0,'https://','Lembaga Keuangan, Akuntan Pemerintah, Akuntan Publik/Perusahaan, Account Officer, Tenaga Pendidik, Wirausaha','Ilmu menganalisis dan melaporkan',1,1030),(15671,'2022-10-12 22:01:18','2022-10-12 22:01:18','Akuakultur','C',19600000,1400000,'https://','Lembaga Keuangan, Akuntan Pemerintah, Akuntan Publik/Perusahaan, Account Officer, Tenaga Pendidik, Wirausaha','Ilmu menganalisis dan melaporkan',2,1030),(15672,'2022-10-12 22:01:18','2022-10-12 22:01:18','Akuntansi','C',27200000,1200000,'https://','Lembaga Keuangan, Akuntan Pemerintah, Akuntan Publik/Perusahaan, Account Officer, Tenaga Pendidik, Wirausaha','Ilmu menganalisis dan melaporkan',1,1030),(15673,'2022-10-12 22:01:18','2022-10-12 22:01:18','Antropologi','A',21600000,1500000,'https://','Lembaga Keuangan, Akuntan Pemerintah, Akuntan Publik/Perusahaan, Account Officer, Tenaga Pendidik, Wirausaha','Ilmu menganalisis dan melaporkan',1,1030),(15674,'2022-10-12 22:01:18','2022-10-12 22:01:18','Arsitektur','A',16500000,1600000,'https://','Lembaga Keuangan, Akuntan Pemerintah, Akuntan Publik/Perusahaan, Account Officer, Tenaga Pendidik, Wirausaha','Ilmu menganalisis dan melaporkan',1,1030),(15675,'2022-10-12 22:01:18','2022-10-12 22:01:18','Bahasa dan Sastra Prancis','B',26100000,1500000,'https://','Lembaga Keuangan, Akuntan Pemerintah, Akuntan Publik/Perusahaan, Account Officer, Tenaga Pendidik, Wirausaha','Ilmu menganalisis dan melaporkan',1,1030);
/*!40000 ALTER TABLE `major` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `major_likes`
--

DROP TABLE IF EXISTS `major_likes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `major_likes` (
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `majorId` int NOT NULL,
  `userId` int NOT NULL,
  PRIMARY KEY (`majorId`,`userId`),
  KEY `userId` (`userId`),
  CONSTRAINT `major_likes_ibfk_1` FOREIGN KEY (`majorId`) REFERENCES `major` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `major_likes_ibfk_2` FOREIGN KEY (`userId`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `major_likes`
--

LOCK TABLES `major_likes` WRITE;
/*!40000 ALTER TABLE `major_likes` DISABLE KEYS */;
/*!40000 ALTER TABLE `major_likes` ENABLE KEYS */;
UNLOCK TABLES;

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
  `authorId` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `campusId` (`campusId`),
  KEY `authorId` (`authorId`),
  CONSTRAINT `news_ibfk_131` FOREIGN KEY (`campusId`) REFERENCES `campus` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `news_ibfk_132` FOREIGN KEY (`authorId`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `news`
--

LOCK TABLES `news` WRITE;
/*!40000 ALTER TABLE `news` DISABLE KEYS */;
/*!40000 ALTER TABLE `news` ENABLE KEYS */;
UNLOCK TABLES;

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
  `scholarship` text,
  `condition` text,
  `document` text,
  `procedure` text,
  `schedule` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `scholarship`
--

LOCK TABLES `scholarship` WRITE;
/*!40000 ALTER TABLE `scholarship` DISABLE KEYS */;
/*!40000 ALTER TABLE `scholarship` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `status`
--

DROP TABLE IF EXISTS `status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `status` (
  `id` int NOT NULL AUTO_INCREMENT,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `name` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `status`
--

LOCK TABLES `status` WRITE;
/*!40000 ALTER TABLE `status` DISABLE KEYS */;
INSERT INTO `status` VALUES (1,'2022-10-12 20:38:11','2022-10-12 20:38:11','PTN'),(2,'2022-10-12 20:38:11','2022-10-12 20:38:11','PTS'),(3,'2022-10-12 20:38:11','2022-10-12 20:38:11','PTN-BLU'),(4,'2022-10-12 20:38:11','2022-10-12 20:38:11','PTN-BH');
/*!40000 ALTER TABLE `status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `strata`
--

DROP TABLE IF EXISTS `strata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `strata` (
  `id` int NOT NULL AUTO_INCREMENT,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `name` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `strata`
--

LOCK TABLES `strata` WRITE;
/*!40000 ALTER TABLE `strata` DISABLE KEYS */;
INSERT INTO `strata` VALUES (1,'2022-10-12 22:27:01','2022-10-12 22:27:01','Sarjana'),(2,'2022-10-12 22:27:01','2022-10-12 22:27:01','Pasca Sarjana');
/*!40000 ALTER TABLE `strata` ENABLE KEYS */;
UNLOCK TABLES;

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
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subject`
--

LOCK TABLES `subject` WRITE;
/*!40000 ALTER TABLE `subject` DISABLE KEYS */;
INSERT INTO `subject` VALUES (1,'2022-10-12 22:10:04','2022-10-12 22:10:04','Bioanalisis Farmasi',2,15637),(2,'2022-10-12 22:10:04','2022-10-12 22:10:04','Etika dan Hukum dalam Bidang Kesehatan',2,15637),(3,'2022-10-12 22:10:04','2022-10-12 22:10:04','Ilmu Biomedik Dasar',4,15637),(4,'2022-10-12 22:10:04','2022-10-12 22:10:04','ILMU BIOMEDIK DASAR 1',2,15637),(5,'2022-10-12 22:10:04','2022-10-12 22:10:04','ILMU BIOMEDIK DASAR 2',2,15637),(6,'2022-10-12 22:10:04','2022-10-12 22:10:04','KOLABORASI DAN KERJASAMA TIM KESEHATAN 1',2,15637),(7,'2022-10-12 22:10:04','2022-10-12 22:10:04','KOLABORASI DAN KERJASAMA TIM KESEHATAN I',2,15637),(8,'2022-10-12 22:10:04','2022-10-12 22:10:04','KOMUNIKASI KESEHATAN',2,15637),(9,'2022-10-12 22:10:04','2022-10-12 22:10:04','Metodologi Penelitian Kesehatan',3,15637),(10,'2022-10-12 22:10:04','2022-10-12 22:10:04','PENGELOLAAN BENCANA',2,15637),(11,'2022-10-12 22:10:04','2022-10-12 22:10:04','Bioanalisis Farmasi',2,15638),(12,'2022-10-12 22:10:04','2022-10-12 22:10:04','Etika dan Hukum dalam Bidang Kesehatan',2,15638),(13,'2022-10-12 22:10:04','2022-10-12 22:10:04','Ilmu Biomedik Dasar',4,15638),(14,'2022-10-12 22:10:04','2022-10-12 22:10:04','ILMU BIOMEDIK DASAR 1',2,15638),(15,'2022-10-12 22:10:04','2022-10-12 22:10:04','ILMU BIOMEDIK DASAR 2',2,15638),(16,'2022-10-12 22:10:04','2022-10-12 22:10:04','KOLABORASI DAN KERJASAMA TIM KESEHATAN 1',2,15638),(17,'2022-10-12 22:10:04','2022-10-12 22:10:04','KOLABORASI DAN KERJASAMA TIM KESEHATAN I',2,15638),(18,'2022-10-12 22:10:04','2022-10-12 22:10:04','KOMUNIKASI KESEHATAN',2,15638),(19,'2022-10-12 22:10:04','2022-10-12 22:10:04','Metodologi Penelitian Kesehatan',3,15638),(20,'2022-10-12 22:10:04','2022-10-12 22:10:04','PENGELOLAAN BENCANA',2,15638),(21,'2022-10-12 22:10:04','2022-10-12 22:10:04','Bioanalisis Farmasi',2,15639),(22,'2022-10-12 22:10:04','2022-10-12 22:10:04','Etika dan Hukum dalam Bidang Kesehatan',2,15639),(23,'2022-10-12 22:10:04','2022-10-12 22:10:04','Ilmu Biomedik Dasar',4,15639),(24,'2022-10-12 22:10:04','2022-10-12 22:10:04','ILMU BIOMEDIK DASAR 1',2,15639),(25,'2022-10-12 22:10:04','2022-10-12 22:10:04','ILMU BIOMEDIK DASAR 2',2,15639),(26,'2022-10-12 22:10:04','2022-10-12 22:10:04','KOLABORASI DAN KERJASAMA TIM KESEHATAN 1',2,15639),(27,'2022-10-12 22:10:04','2022-10-12 22:10:04','KOLABORASI DAN KERJASAMA TIM KESEHATAN I',2,15639),(28,'2022-10-12 22:10:04','2022-10-12 22:10:04','KOMUNIKASI KESEHATAN',2,15639),(29,'2022-10-12 22:10:04','2022-10-12 22:10:04','Metodologi Penelitian Kesehatan',3,15639),(30,'2022-10-12 22:10:04','2022-10-12 22:10:04','PENGELOLAAN BENCANA',2,15639),(31,'2022-10-12 22:10:04','2022-10-12 22:10:04','Bioanalisis Farmasi',2,15640),(32,'2022-10-12 22:10:04','2022-10-12 22:10:04','Etika dan Hukum dalam Bidang Kesehatan',2,15640),(33,'2022-10-12 22:10:04','2022-10-12 22:10:04','Ilmu Biomedik Dasar',4,15640),(34,'2022-10-12 22:10:04','2022-10-12 22:10:04','ILMU BIOMEDIK DASAR 1',2,15640),(35,'2022-10-12 22:10:04','2022-10-12 22:10:04','ILMU BIOMEDIK DASAR 2',2,15640),(36,'2022-10-12 22:10:04','2022-10-12 22:10:04','KOLABORASI DAN KERJASAMA TIM KESEHATAN 1',2,15640),(37,'2022-10-12 22:10:04','2022-10-12 22:10:04','KOLABORASI DAN KERJASAMA TIM KESEHATAN I',2,15640),(38,'2022-10-12 22:10:04','2022-10-12 22:10:04','KOMUNIKASI KESEHATAN',2,15640),(39,'2022-10-12 22:10:04','2022-10-12 22:10:04','Metodologi Penelitian Kesehatan',3,15640),(40,'2022-10-12 22:10:04','2022-10-12 22:10:04','PENGELOLAAN BENCANA',2,15640),(41,'2022-10-12 22:10:04','2022-10-12 22:10:04','Bioanalisis Farmasi',2,15641),(42,'2022-10-12 22:10:04','2022-10-12 22:10:04','Etika dan Hukum dalam Bidang Kesehatan',2,15641),(43,'2022-10-12 22:10:04','2022-10-12 22:10:04','Ilmu Biomedik Dasar',4,15641),(44,'2022-10-12 22:10:04','2022-10-12 22:10:04','ILMU BIOMEDIK DASAR 1',2,15641),(45,'2022-10-12 22:10:04','2022-10-12 22:10:04','ILMU BIOMEDIK DASAR 2',2,15641),(46,'2022-10-12 22:10:04','2022-10-12 22:10:04','KOLABORASI DAN KERJASAMA TIM KESEHATAN 1',2,15641),(47,'2022-10-12 22:10:04','2022-10-12 22:10:04','KOLABORASI DAN KERJASAMA TIM KESEHATAN I',2,15641),(48,'2022-10-12 22:10:04','2022-10-12 22:10:04','KOMUNIKASI KESEHATAN',2,15641),(49,'2022-10-12 22:10:04','2022-10-12 22:10:04','Metodologi Penelitian Kesehatan',3,15641),(50,'2022-10-12 22:10:04','2022-10-12 22:10:04','PENGELOLAAN BENCANA',2,15641),(51,'2022-10-12 22:10:04','2022-10-12 22:10:04','Bioanalisis Farmasi',2,15642),(52,'2022-10-12 22:10:04','2022-10-12 22:10:04','Etika dan Hukum dalam Bidang Kesehatan',2,15642),(53,'2022-10-12 22:10:04','2022-10-12 22:10:04','Ilmu Biomedik Dasar',4,15642),(54,'2022-10-12 22:10:04','2022-10-12 22:10:04','ILMU BIOMEDIK DASAR 1',2,15642),(55,'2022-10-12 22:10:04','2022-10-12 22:10:04','ILMU BIOMEDIK DASAR 2',2,15642),(56,'2022-10-12 22:10:04','2022-10-12 22:10:04','KOLABORASI DAN KERJASAMA TIM KESEHATAN 1',2,15642),(57,'2022-10-12 22:10:04','2022-10-12 22:10:04','KOLABORASI DAN KERJASAMA TIM KESEHATAN I',2,15642),(58,'2022-10-12 22:10:04','2022-10-12 22:10:04','KOMUNIKASI KESEHATAN',2,15642),(59,'2022-10-12 22:10:04','2022-10-12 22:10:04','Metodologi Penelitian Kesehatan',3,15642),(60,'2022-10-12 22:10:04','2022-10-12 22:10:04','PENGELOLAAN BENCANA',2,15642),(61,'2022-10-12 22:10:05','2022-10-12 22:10:05','Bioanalisis Farmasi',2,15643),(62,'2022-10-12 22:10:05','2022-10-12 22:10:05','Etika dan Hukum dalam Bidang Kesehatan',2,15643),(63,'2022-10-12 22:10:05','2022-10-12 22:10:05','Ilmu Biomedik Dasar',4,15643),(64,'2022-10-12 22:10:05','2022-10-12 22:10:05','ILMU BIOMEDIK DASAR 1',2,15643),(65,'2022-10-12 22:10:05','2022-10-12 22:10:05','ILMU BIOMEDIK DASAR 2',2,15643),(66,'2022-10-12 22:10:05','2022-10-12 22:10:05','KOLABORASI DAN KERJASAMA TIM KESEHATAN 1',2,15643),(67,'2022-10-12 22:10:05','2022-10-12 22:10:05','KOLABORASI DAN KERJASAMA TIM KESEHATAN I',2,15643),(68,'2022-10-12 22:10:05','2022-10-12 22:10:05','KOMUNIKASI KESEHATAN',2,15643),(69,'2022-10-12 22:10:05','2022-10-12 22:10:05','Metodologi Penelitian Kesehatan',3,15643),(70,'2022-10-12 22:10:05','2022-10-12 22:10:05','PENGELOLAAN BENCANA',2,15643),(71,'2022-10-12 22:10:05','2022-10-12 22:10:05','Bioanalisis Farmasi',2,15644),(72,'2022-10-12 22:10:05','2022-10-12 22:10:05','Etika dan Hukum dalam Bidang Kesehatan',2,15644),(73,'2022-10-12 22:10:05','2022-10-12 22:10:05','Ilmu Biomedik Dasar',4,15644),(74,'2022-10-12 22:10:05','2022-10-12 22:10:05','ILMU BIOMEDIK DASAR 1',2,15644),(75,'2022-10-12 22:10:05','2022-10-12 22:10:05','ILMU BIOMEDIK DASAR 2',2,15644),(76,'2022-10-12 22:10:05','2022-10-12 22:10:05','KOLABORASI DAN KERJASAMA TIM KESEHATAN 1',2,15644),(77,'2022-10-12 22:10:05','2022-10-12 22:10:05','KOLABORASI DAN KERJASAMA TIM KESEHATAN I',2,15644),(78,'2022-10-12 22:10:05','2022-10-12 22:10:05','KOMUNIKASI KESEHATAN',2,15644),(79,'2022-10-12 22:10:05','2022-10-12 22:10:05','Metodologi Penelitian Kesehatan',3,15644),(80,'2022-10-12 22:10:05','2022-10-12 22:10:05','PENGELOLAAN BENCANA',2,15644),(81,'2022-10-12 22:10:05','2022-10-12 22:10:05','Bioanalisis Farmasi',2,15645),(82,'2022-10-12 22:10:05','2022-10-12 22:10:05','Etika dan Hukum dalam Bidang Kesehatan',2,15645),(83,'2022-10-12 22:10:05','2022-10-12 22:10:05','Ilmu Biomedik Dasar',4,15645),(84,'2022-10-12 22:10:05','2022-10-12 22:10:05','ILMU BIOMEDIK DASAR 1',2,15645),(85,'2022-10-12 22:10:05','2022-10-12 22:10:05','ILMU BIOMEDIK DASAR 2',2,15645),(86,'2022-10-12 22:10:05','2022-10-12 22:10:05','KOLABORASI DAN KERJASAMA TIM KESEHATAN 1',2,15645),(87,'2022-10-12 22:10:05','2022-10-12 22:10:05','KOLABORASI DAN KERJASAMA TIM KESEHATAN I',2,15645),(88,'2022-10-12 22:10:05','2022-10-12 22:10:05','KOMUNIKASI KESEHATAN',2,15645),(89,'2022-10-12 22:10:05','2022-10-12 22:10:05','Metodologi Penelitian Kesehatan',3,15645),(90,'2022-10-12 22:10:05','2022-10-12 22:10:05','PENGELOLAAN BENCANA',2,15645),(91,'2022-10-12 22:10:05','2022-10-12 22:10:05','Bioanalisis Farmasi',2,15646),(92,'2022-10-12 22:10:05','2022-10-12 22:10:05','Etika dan Hukum dalam Bidang Kesehatan',2,15646),(93,'2022-10-12 22:10:05','2022-10-12 22:10:05','Ilmu Biomedik Dasar',4,15646),(94,'2022-10-12 22:10:05','2022-10-12 22:10:05','ILMU BIOMEDIK DASAR 1',2,15646),(95,'2022-10-12 22:10:05','2022-10-12 22:10:05','ILMU BIOMEDIK DASAR 2',2,15646),(96,'2022-10-12 22:10:05','2022-10-12 22:10:05','KOLABORASI DAN KERJASAMA TIM KESEHATAN 1',2,15646),(97,'2022-10-12 22:10:05','2022-10-12 22:10:05','KOLABORASI DAN KERJASAMA TIM KESEHATAN I',2,15646),(98,'2022-10-12 22:10:05','2022-10-12 22:10:05','KOMUNIKASI KESEHATAN',2,15646),(99,'2022-10-12 22:10:05','2022-10-12 22:10:05','Metodologi Penelitian Kesehatan',3,15646),(100,'2022-10-12 22:10:05','2022-10-12 22:10:05','PENGELOLAAN BENCANA',2,15646);
/*!40000 ALTER TABLE `subject` ENABLE KEYS */;
UNLOCK TABLES;

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
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `username_2` (`username`),
  UNIQUE KEY `username_3` (`username`),
  UNIQUE KEY `username_4` (`username`),
  UNIQUE KEY `username_5` (`username`),
  UNIQUE KEY `username_6` (`username`),
  UNIQUE KEY `username_7` (`username`),
  UNIQUE KEY `username_8` (`username`),
  UNIQUE KEY `username_9` (`username`),
  UNIQUE KEY `username_10` (`username`),
  UNIQUE KEY `username_11` (`username`),
  UNIQUE KEY `username_12` (`username`),
  UNIQUE KEY `username_13` (`username`),
  UNIQUE KEY `username_14` (`username`),
  UNIQUE KEY `username_15` (`username`),
  UNIQUE KEY `username_16` (`username`),
  UNIQUE KEY `username_17` (`username`),
  UNIQUE KEY `username_18` (`username`),
  UNIQUE KEY `username_19` (`username`),
  UNIQUE KEY `username_20` (`username`),
  UNIQUE KEY `username_21` (`username`),
  UNIQUE KEY `username_22` (`username`),
  UNIQUE KEY `username_23` (`username`),
  UNIQUE KEY `username_24` (`username`),
  UNIQUE KEY `username_25` (`username`),
  UNIQUE KEY `username_26` (`username`),
  UNIQUE KEY `username_27` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'2022-10-12 22:45:46','2022-10-12 22:45:46','Aku Pintar','akupintar','a5fbee8ff4525837dad09741aeb0384d'),(2,'2022-10-12 22:20:14','2022-10-12 22:20:14','User 1','user1','24c9e15e52afc47c225b757e7bee1f9d'),(3,'2022-10-12 22:20:26','2022-10-12 22:20:26','User 2','user2','7e58d63b60197ceb55a1c487989a3720');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-10-13  1:43:05
