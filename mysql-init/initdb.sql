-- MySQL dump 10.13  Distrib 8.0.23, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: hierarchy_cm
-- ------------------------------------------------------
-- Server version	8.0.32

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
-- Table structure for table `app_config`
--

DROP TABLE IF EXISTS `app_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `app_config` (
  `key` varchar(255) NOT NULL,
  `value` varchar(255) NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cache_gen_time`
--

DROP TABLE IF EXISTS `cache_gen_time`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cache_gen_time` (
  `table_nm` varchar(255) NOT NULL,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`table_nm`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cache_login_personality_types`
--

DROP TABLE IF EXISTS `cache_login_personality_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cache_login_personality_types` (
  `object_type_ky` int NOT NULL,
  PRIMARY KEY (`object_type_ky`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cache_obj_profile`
--

DROP TABLE IF EXISTS `cache_obj_profile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cache_obj_profile` (
  `profile_obj_ky` int NOT NULL,
  `instance_obj_ky` int NOT NULL,
  `TIMESTAMP` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`profile_obj_ky`,`instance_obj_ky`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Temporary view structure for view `englishfeed`
--

DROP TABLE IF EXISTS `englishfeed`;
/*!50001 DROP VIEW IF EXISTS `englishfeed`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `englishfeed` AS SELECT 
 1 AS `Name_exp_1`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `feed`
--

DROP TABLE IF EXISTS `feed`;
/*!50001 DROP VIEW IF EXISTS `feed`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `feed` AS SELECT 
 1 AS `oil_is_deleted`,
 1 AS `prnt_object_type_ky`,
 1 AS `chld_object_type_ky`,
 1 AS `parentOwnerName`,
 1 AS `childOwnerName`,
 1 AS `linkOwnerName`,
 1 AS `parentTypeName`,
 1 AS `childTypeName`,
 1 AS `src_object_ky`,
 1 AS `dest_object_ky`,
 1 AS `object_link_type_ky`,
 1 AS `object_inst_link_ky`,
 1 AS `owner_ky`,
 1 AS `srcApproved`,
 1 AS `destApproved`,
 1 AS `oil_when_updated`,
 1 AS `oil_when_created`,
 1 AS `object_link_type_nm`,
 1 AS `prntName`,
 1 AS `prntOwnerKy`,
 1 AS `chld_when_updated`,
 1 AS `prnt_when_updated`,
 1 AS `chld_when_created`,
 1 AS `prnt_when_created`,
 1 AS `chldName`,
 1 AS `chldOwnerKy`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `feedwithprofile`
--

DROP TABLE IF EXISTS `feedwithprofile`;
/*!50001 DROP VIEW IF EXISTS `feedwithprofile`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `feedwithprofile` AS SELECT 
 1 AS `oil_is_deleted`,
 1 AS `prnt_object_type_ky`,
 1 AS `chld_object_type_ky`,
 1 AS `parentOwnerName`,
 1 AS `childOwnerName`,
 1 AS `linkOwnerName`,
 1 AS `parentTypeName`,
 1 AS `childTypeName`,
 1 AS `src_object_ky`,
 1 AS `dest_object_ky`,
 1 AS `object_link_type_ky`,
 1 AS `object_inst_link_ky`,
 1 AS `owner_ky`,
 1 AS `srcApproved`,
 1 AS `destApproved`,
 1 AS `oil_when_updated`,
 1 AS `oil_when_created`,
 1 AS `object_link_type_nm`,
 1 AS `prntName`,
 1 AS `prntOwnerKy`,
 1 AS `chld_when_updated`,
 1 AS `prnt_when_updated`,
 1 AS `chld_when_created`,
 1 AS `prnt_when_created`,
 1 AS `chldName`,
 1 AS `chldOwnerKy`,
 1 AS `profile_obj_ky`,
 1 AS `profile_nm`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `feedwithprofilefriends`
--

DROP TABLE IF EXISTS `feedwithprofilefriends`;
/*!50001 DROP VIEW IF EXISTS `feedwithprofilefriends`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `feedwithprofilefriends` AS SELECT 
 1 AS `oil_is_deleted`,
 1 AS `prnt_object_type_ky`,
 1 AS `chld_object_type_ky`,
 1 AS `parentOwnerName`,
 1 AS `childOwnerName`,
 1 AS `linkOwnerName`,
 1 AS `parentTypeName`,
 1 AS `childTypeName`,
 1 AS `src_object_ky`,
 1 AS `dest_object_ky`,
 1 AS `object_link_type_ky`,
 1 AS `object_inst_link_ky`,
 1 AS `owner_ky`,
 1 AS `srcApproved`,
 1 AS `destApproved`,
 1 AS `oil_when_updated`,
 1 AS `oil_when_created`,
 1 AS `object_link_type_nm`,
 1 AS `prntName`,
 1 AS `prntOwnerKy`,
 1 AS `chld_when_updated`,
 1 AS `prnt_when_updated`,
 1 AS `chld_when_created`,
 1 AS `prnt_when_created`,
 1 AS `chldName`,
 1 AS `chldOwnerKy`,
 1 AS `profile_obj_ky`,
 1 AS `profile_nm`,
 1 AS `feed_login_id`,
 1 AS `feed_personality`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `feedwithprofilefriendsapproved`
--

DROP TABLE IF EXISTS `feedwithprofilefriendsapproved`;
/*!50001 DROP VIEW IF EXISTS `feedwithprofilefriendsapproved`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `feedwithprofilefriendsapproved` AS SELECT 
 1 AS `oil_is_deleted`,
 1 AS `prnt_object_type_ky`,
 1 AS `chld_object_type_ky`,
 1 AS `parentOwnerName`,
 1 AS `childOwnerName`,
 1 AS `linkOwnerName`,
 1 AS `parentTypeName`,
 1 AS `childTypeName`,
 1 AS `src_object_ky`,
 1 AS `dest_object_ky`,
 1 AS `object_link_type_ky`,
 1 AS `object_inst_link_ky`,
 1 AS `owner_ky`,
 1 AS `srcApproved`,
 1 AS `destApproved`,
 1 AS `oil_when_updated`,
 1 AS `oil_when_created`,
 1 AS `object_link_type_nm`,
 1 AS `prntName`,
 1 AS `prntOwnerKy`,
 1 AS `chld_when_updated`,
 1 AS `prnt_when_updated`,
 1 AS `chld_when_created`,
 1 AS `prnt_when_created`,
 1 AS `chldName`,
 1 AS `chldOwnerKy`,
 1 AS `profile_obj_ky`,
 1 AS `profile_nm`,
 1 AS `feed_login_id`,
 1 AS `feed_personality`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `feedwithprofilefriendspending`
--

DROP TABLE IF EXISTS `feedwithprofilefriendspending`;
/*!50001 DROP VIEW IF EXISTS `feedwithprofilefriendspending`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `feedwithprofilefriendspending` AS SELECT 
 1 AS `oil_is_deleted`,
 1 AS `prnt_object_type_ky`,
 1 AS `chld_object_type_ky`,
 1 AS `parentOwnerName`,
 1 AS `childOwnerName`,
 1 AS `linkOwnerName`,
 1 AS `parentTypeName`,
 1 AS `childTypeName`,
 1 AS `src_object_ky`,
 1 AS `dest_object_ky`,
 1 AS `object_link_type_ky`,
 1 AS `object_inst_link_ky`,
 1 AS `owner_ky`,
 1 AS `srcApproved`,
 1 AS `destApproved`,
 1 AS `oil_when_updated`,
 1 AS `oil_when_created`,
 1 AS `object_link_type_nm`,
 1 AS `prntName`,
 1 AS `prntOwnerKy`,
 1 AS `chld_when_updated`,
 1 AS `prnt_when_updated`,
 1 AS `chld_when_created`,
 1 AS `prnt_when_created`,
 1 AS `chldName`,
 1 AS `chldOwnerKy`,
 1 AS `profile_obj_ky`,
 1 AS `profile_nm`,
 1 AS `feed_login_id`,
 1 AS `feed_personality`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `friends`
--

DROP TABLE IF EXISTS `friends`;
/*!50001 DROP VIEW IF EXISTS `friends`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `friends` AS SELECT 
 1 AS `login_id`,
 1 AS `src_frnd_personality`,
 1 AS `dest_frnd_personality`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `loginfriends`
--

DROP TABLE IF EXISTS `loginfriends`;
/*!50001 DROP VIEW IF EXISTS `loginfriends`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `loginfriends` AS SELECT 
 1 AS `login_id`,
 1 AS `dest_frnd_personality`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `loginpersonalities`
--

DROP TABLE IF EXISTS `loginpersonalities`;
/*!50001 DROP VIEW IF EXISTS `loginpersonalities`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `loginpersonalities` AS SELECT 
 1 AS `login_id`,
 1 AS `personality_id`,
 1 AS `object_inst_link_ky`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `logins`
--

DROP TABLE IF EXISTS `logins`;
/*!50001 DROP VIEW IF EXISTS `logins`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `logins` AS SELECT 
 1 AS `login_id`,
 1 AS `name_nm`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `mytest`
--

DROP TABLE IF EXISTS `mytest`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mytest` (
  `object_ky` int unsigned NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`object_ky`),
  CONSTRAINT `FK_mytest_obj_ky` FOREIGN KEY (`object_ky`) REFERENCES `object_instance` (`object_ky`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `obj_comment`
--

DROP TABLE IF EXISTS `obj_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `obj_comment` (
  `object_ky` int unsigned NOT NULL AUTO_INCREMENT,
  `comment_text` longtext,
  PRIMARY KEY (`object_ky`),
  CONSTRAINT `FK_obj_comment_obj_ky` FOREIGN KEY (`object_ky`) REFERENCES `object_instance` (`object_ky`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=590 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `obj_group`
--

DROP TABLE IF EXISTS `obj_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `obj_group` (
  `object_ky` int unsigned NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`object_ky`),
  CONSTRAINT `FK_obj_group_obj_ky` FOREIGN KEY (`object_ky`) REFERENCES `object_instance` (`object_ky`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `obj_login`
--

DROP TABLE IF EXISTS `obj_login`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `obj_login` (
  `login` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `object_ky` int unsigned NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`object_ky`) USING BTREE,
  UNIQUE KEY `email_UNIQUE` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `obj_person`
--

DROP TABLE IF EXISTS `obj_person`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `obj_person` (
  `object_ky` int unsigned NOT NULL AUTO_INCREMENT,
  `first_name` varchar(45) DEFAULT NULL,
  `last_name` varchar(45) DEFAULT NULL,
  `profile_photo` longblob,
  `profile_photo_filename` varchar(45) DEFAULT NULL,
  `profile_photo_height` varchar(45) DEFAULT NULL,
  `profile_photo_width` varchar(45) DEFAULT NULL,
  `date_of_birth` date DEFAULT NULL,
  PRIMARY KEY (`object_ky`),
  CONSTRAINT `FK_obj_person_obj_ky` FOREIGN KEY (`object_ky`) REFERENCES `object_instance` (`object_ky`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=678 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `obj_photo`
--

DROP TABLE IF EXISTS `obj_photo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `obj_photo` (
  `object_ky` int unsigned NOT NULL AUTO_INCREMENT,
  `file` longblob,
  `height` int DEFAULT NULL,
  `width` int DEFAULT NULL,
  PRIMARY KEY (`object_ky`),
  CONSTRAINT `FK_obj_photo_obj_ky` FOREIGN KEY (`object_ky`) REFERENCES `object_instance` (`object_ky`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=642 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `obj_photoalbum`
--

DROP TABLE IF EXISTS `obj_photoalbum`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `obj_photoalbum` (
  `object_ky` int unsigned NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`object_ky`),
  CONSTRAINT `FK_obj_photoalbum_obj_ky` FOREIGN KEY (`object_ky`) REFERENCES `object_instance` (`object_ky`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=636 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `obj_video`
--

DROP TABLE IF EXISTS `obj_video`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `obj_video` (
  `object_ky` int unsigned NOT NULL AUTO_INCREMENT,
  `file` longblob,
  `genre` varchar(45) DEFAULT NULL,
  `audioCodec` varchar(45) DEFAULT NULL,
  `audioBitRate` varchar(45) DEFAULT NULL,
  `videoBitRate` varchar(45) DEFAULT NULL,
  `frameCount` varchar(45) DEFAULT NULL,
  `trackNumber` varchar(45) DEFAULT NULL,
  `audioChannels` varchar(45) DEFAULT NULL,
  `pixelFormat` varchar(45) DEFAULT NULL,
  `author` varchar(45) DEFAULT NULL,
  `duration` varchar(45) DEFAULT NULL,
  `title` varchar(45) DEFAULT NULL,
  `copyRight` varchar(45) DEFAULT NULL,
  `hasVideo` varchar(45) DEFAULT NULL,
  `hasAudio` varchar(45) DEFAULT NULL,
  `fileName` varchar(45) DEFAULT NULL,
  `width` varchar(45) DEFAULT NULL,
  `frameRate` varchar(45) DEFAULT NULL,
  `year` varchar(45) DEFAULT NULL,
  `audioSampleRate` varchar(45) DEFAULT NULL,
  `artist` varchar(45) DEFAULT NULL,
  `bitRate` varchar(45) DEFAULT NULL,
  `videoCodec` varchar(45) DEFAULT NULL,
  `height` varchar(45) DEFAULT NULL,
  `vic` longblob,
  `mp4Transcode` longblob,
  `webmTranscode` longblob,
  `status_ky` varchar(45) DEFAULT 'P',
  PRIMARY KEY (`object_ky`)
) ENGINE=MyISAM AUTO_INCREMENT=674 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `obj_wallpost`
--

DROP TABLE IF EXISTS `obj_wallpost`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `obj_wallpost` (
  `object_ky` int unsigned NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`object_ky`),
  CONSTRAINT `FK_obj_wallpost_obj_ky` FOREIGN KEY (`object_ky`) REFERENCES `object_instance` (`object_ky`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `obj_web_link`
--

DROP TABLE IF EXISTS `obj_web_link`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `obj_web_link` (
  `object_ky` int unsigned NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`object_ky`),
  CONSTRAINT `FK_obj_web_link_obj_ky` FOREIGN KEY (`object_ky`) REFERENCES `object_instance` (`object_ky`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `object_instance`
--

DROP TABLE IF EXISTS `object_instance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `object_instance` (
  `object_ky` int unsigned NOT NULL AUTO_INCREMENT,
  `object_type_ky` int unsigned NOT NULL,
  `name_nm` varchar(255) NOT NULL,
  `owner_ky` int unsigned DEFAULT NULL,
  `when_updated` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `when_created` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`object_ky`),
  KEY `FK_object_type_ky` (`object_type_ky`),
  CONSTRAINT `FK_object_type_ky` FOREIGN KEY (`object_type_ky`) REFERENCES `object_type` (`object_type_ky`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=678 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `object_instance_link`
--

DROP TABLE IF EXISTS `object_instance_link`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `object_instance_link` (
  `src_object_ky` int unsigned NOT NULL,
  `dest_object_ky` int unsigned NOT NULL,
  `object_link_type_ky` int unsigned NOT NULL,
  `object_inst_link_ky` int unsigned NOT NULL AUTO_INCREMENT,
  `owner_ky` int unsigned DEFAULT NULL,
  `srcApproved` tinyint(1) DEFAULT NULL,
  `destApproved` tinyint(1) DEFAULT NULL,
  `when_updated` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `when_created` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `isDeleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`object_inst_link_ky`) USING BTREE,
  UNIQUE KEY `unique_ix` (`src_object_ky`,`dest_object_ky`,`object_link_type_ky`) USING BTREE,
  KEY `fk_src_object_ky` (`src_object_ky`),
  KEY `fk_dest_object_ky` (`dest_object_ky`),
  KEY `FK_object_link_link_type` (`object_link_type_ky`),
  CONSTRAINT `FK_object_link_dest` FOREIGN KEY (`dest_object_ky`) REFERENCES `object_instance` (`object_ky`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_object_link_link_type` FOREIGN KEY (`object_link_type_ky`) REFERENCES `object_link_type` (`object_link_type_ky`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_object_link_src` FOREIGN KEY (`src_object_ky`) REFERENCES `object_instance` (`object_ky`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=563 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `object_link_type`
--

DROP TABLE IF EXISTS `object_link_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `object_link_type` (
  `src_object_type_ky` int unsigned NOT NULL,
  `dest_object_type_ky` int unsigned NOT NULL,
  `object_link_type_ky` int unsigned NOT NULL AUTO_INCREMENT,
  `object_link_type_nm` varchar(45) NOT NULL,
  `table_nm` varchar(45) DEFAULT NULL,
  `permCreatorR` tinyint(1) DEFAULT NULL,
  `permCreaFrndsR` tinyint(1) DEFAULT NULL,
  `permCreaPrivFrndsR` tinyint(1) DEFAULT NULL,
  `permCreaRestFrndsR` tinyint(1) DEFAULT NULL,
  `permPrntR` tinyint(1) DEFAULT NULL,
  `permPrntFrndsR` tinyint(1) DEFAULT NULL,
  `permPrntPrivFrndsR` tinyint(1) DEFAULT NULL,
  `permPrntRestFrndsR` tinyint(1) DEFAULT NULL,
  `allowChldCreation` tinyint(1) DEFAULT NULL,
  `allowChldLink` tinyint(1) DEFAULT NULL,
  `allowMultiChld` tinyint(1) DEFAULT NULL,
  `permCreatorW` tinyint(1) DEFAULT NULL,
  `permCreaFrndsW` tinyint(1) DEFAULT NULL,
  `permCreaPrivFrndsW` tinyint(1) DEFAULT NULL,
  `permCreaRestFrndsW` tinyint(1) DEFAULT NULL,
  `permPrntW` tinyint(1) DEFAULT NULL,
  `permPrntFrndsW` tinyint(1) DEFAULT NULL,
  `permPrntPrivFrndsW` tinyint(1) DEFAULT NULL,
  `permPrntRestFrndsW` tinyint(1) DEFAULT NULL,
  `permCreatorD` tinyint(1) DEFAULT NULL,
  `permCreaFrndsD` tinyint(1) DEFAULT NULL,
  `permCreaPrivFrndsD` tinyint(1) DEFAULT NULL,
  `permCreaRestFrndsD` tinyint(1) DEFAULT NULL,
  `permPrntD` tinyint(1) DEFAULT NULL,
  `permPrntFrndsD` tinyint(1) DEFAULT NULL,
  `permPrntPrivFrndsD` tinyint(1) DEFAULT NULL,
  `permPrntRestFrndsD` tinyint(1) DEFAULT NULL,
  `parentApprovalRequired` tinyint(1) DEFAULT NULL,
  `childApprovalRequired` tinyint(1) DEFAULT NULL,
  `createRecipUponApproval` tinyint(1) DEFAULT NULL,
  `createText` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`object_link_type_ky`) USING BTREE,
  KEY `FK_object_link_type_srcot` (`src_object_type_ky`),
  KEY `FK_object_link_type_dstot` (`dest_object_type_ky`),
  CONSTRAINT `FK_object_link_type_dstot` FOREIGN KEY (`dest_object_type_ky`) REFERENCES `object_type` (`object_type_ky`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_object_link_type_srcot` FOREIGN KEY (`src_object_type_ky`) REFERENCES `object_type` (`object_type_ky`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=60 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `object_type`
--

DROP TABLE IF EXISTS `object_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `object_type` (
  `table_nm` varchar(45) NOT NULL,
  `schema_nm` varchar(45) NOT NULL,
  `object_type_ky` int unsigned NOT NULL AUTO_INCREMENT,
  `name_nm` varchar(45) NOT NULL,
  `isFile` tinyint(1) DEFAULT '0',
  `object_type_category_ky` int NOT NULL DEFAULT '3',
  `default_icon` longblob,
  `icon_height` int DEFAULT NULL,
  `icon_width` int DEFAULT NULL,
  `icon_mimetype` varchar(45) DEFAULT NULL,
  `icon_filename` varchar(45) DEFAULT NULL COMMENT 'Test',
  PRIMARY KEY (`object_type_ky`),
  UNIQUE KEY `object_type_unique_nm` (`name_nm`),
  KEY `object_type_unique_table_nm` (`table_nm`),
  KEY `FK_OBJ_TYPE_TYPE_CAT` (`object_type_category_ky`),
  CONSTRAINT `FK_OBJ_TYPE_TYPE_CAT` FOREIGN KEY (`object_type_category_ky`) REFERENCES `object_type_category` (`object_type_category_ky`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `object_type_category`
--

DROP TABLE IF EXISTS `object_type_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `object_type_category` (
  `object_type_category_ky` int NOT NULL,
  `object_type_category_desc` varchar(45) CHARACTER SET latin1 DEFAULT NULL,
  PRIMARY KEY (`object_type_category_ky`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `objlnk_person_person`
--

DROP TABLE IF EXISTS `objlnk_person_person`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `objlnk_person_person` (
  `object_inst_link_ky` int unsigned NOT NULL,
  `relation_notes` varchar(45) NOT NULL,
  PRIMARY KEY (`object_inst_link_ky`) USING BTREE,
  CONSTRAINT `FK_objlnk_person_person_oilk` FOREIGN KEY (`object_inst_link_ky`) REFERENCES `object_instance_link` (`object_inst_link_ky`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Temporary view structure for view `personality_types`
--

DROP TABLE IF EXISTS `personality_types`;
/*!50001 DROP VIEW IF EXISTS `personality_types`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `personality_types` AS SELECT 
 1 AS `value`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `shopping_cart`
--

DROP TABLE IF EXISTS `shopping_cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shopping_cart` (
  `object_ky` int unsigned NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`object_ky`),
  CONSTRAINT `FK_shopping_cart_obj_ky` FOREIGN KEY (`object_ky`) REFERENCES `object_instance` (`object_ky`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping events for database 'hierarchy_cm'
--

--
-- Dumping routines for database 'hierarchy_cm'
--
/*!50003 DROP FUNCTION IF EXISTS `createObjInstByTblNm` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `createObjInstByTblNm`(
ipTableName varchar(255),
ipInstanceName varchar(255)

) RETURNS int
BEGIN


  declare lv_object_type_ky int(11);
  declare result int(11);


  select getObjTypeFromTblNm(ipTableName) into lv_object_type_ky;

  select createObjInst(lv_object_type_ky, ipInstanceName) into result;

  return result;




END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `emailExists` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `emailExists`(

  ipEmail varchar(255)

) RETURNS int
BEGIN



  DECLARE notFound INT DEFAULT 0;

  DECLARE CONTINUE HANDLER FOR NOT FOUND SET notFound = 1;





  select object_ky into @objectId

  from obj_login ol

  where upper(ol.email) = upper(ipEmail);



  if notFound then

    return 0;

  else

    return @objectId;

  end if;



END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `getAppConfigVal` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `getAppConfigVal`(
  ipKey varchar(255)
) RETURNS varchar(255) CHARSET latin1
BEGIN

  declare   result varchar(255);

  select ac.value into result
  from app_config ac
  where
    upper(ac.key) = Upper(ipKey);

  return result;


END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `getDefaultPersonalityTypeId` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `getDefaultPersonalityTypeId`() RETURNS int
BEGIN

  declare result int(11);
  
  select value into result from app_config ac where ac.key = "DEFAULT_PERSONALITY_TYPE";
  
  return result;


END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `getObjectLinkOwnerId` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `getObjectLinkOwnerId`(
  ip_src_object_ky int(11),
  ip_dest_object_ky int(11)
) RETURNS int
BEGIN

  declare result int(11);

  select owner_ky into result
  from
  -- object_instance oi,
  object_instance_link oil
  where oil.src_object_ky = ip_src_object_ky and
        oil.dest_object_ky = ip_dest_object_ky;

  return result;


END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `getObjectOwnerId` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `getObjectOwnerId`(
  ip_object_ky int(11)
) RETURNS int
BEGIN

  declare result int(11);

  select owner_ky into result
  from
  -- object_instance oi,
  object_instance oi
  where oi.object_ky = ip_object_ky;

  return result;


END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `getObjInstanceTypeId` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `getObjInstanceTypeId`(
  ip_object_ky int(11)

) RETURNS int
BEGIN

  declare result int(11);

  select object_type_ky into result from
  object_instance oi
  where oi.object_ky = ip_object_ky;

  return result;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `getObjInstanceTypeNm` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `getObjInstanceTypeNm`(
  ip_object_ky int(11)

) RETURNS varchar(255) CHARSET latin1
BEGIN

  declare result varchar(255);

  select ot.name_nm into result from
  object_instance oi, object_type ot
  where oi.object_ky = ip_object_ky and
        oi.object_type_ky = ot.object_type_ky;

  return result;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `getObjInstanceTypeTbl` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `getObjInstanceTypeTbl`(
  ip_object_ky int(11)
) RETURNS varchar(255) CHARSET utf8mb3
BEGIN

  declare result varchar(255) CHARSET utf8 ;

  select table_nm into result
  from
  object_instance oi, object_type ot
  where oi.object_ky = ip_object_ky and
   ot.object_type_ky = oi.object_type_ky;

  return result;


END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `getObjInstCategory` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `getObjInstCategory`(
  ip_object_ky int(11)
) RETURNS varchar(255) CHARSET latin1
BEGIN

  declare result varchar(255);

  select object_type_category_desc into result
  from
  -- object_instance oi,
  object_instance oi, object_type ot, object_type_category otc
  where oi.object_ky = ip_object_ky and 
  oi.object_type_ky = ot.object_type_ky and 
  otc.object_type_category_ky = ot.object_type_category_ky;

  return result;


END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `getObjInstLinkTable` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `getObjInstLinkTable`(
  ipSrcObjKy int(11),
  ipDestObjKy int(11)
) RETURNS varchar(255) CHARSET utf8mb3
BEGIN

  declare  result varchar(255) CHARSET utf8;


  declare lvSrcTypeKy int(11);
  declare lvDestTypeKy int(11);

  -- a. get the object type of id1 as id1objtype (call GetObjTypeId)
  select getObjInstanceTypeId(ipSrcObjKy) into lvSrcTypeKy;

  -- b. get the object type of id2 as id2objtype (call GetObjTypeId)
  select getObjInstanceTypeId(ipDestObjKy) into lvDestTypeKy;

  -- c. check in object_link_type to see if id1objtype to id2objtype linking is allowed and find the linktable.
  select getObjLinkTable(lvSrcTypeKy, lvDestTypeKy) into result;

  return result;


END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `getObjInstLinkTypeKy` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `getObjInstLinkTypeKy`(
  ipSrcObjKy int(11),
  ipDestObjKy int(11)
) RETURNS int
BEGIN

  declare   result int(11);
  declare lvSrcTypeKy int(11);
  declare lvDestTypeKy int(11);

  -- a. get the object type of id1 as id1objtype (call GetObjTypeId)
  select getObjInstanceTypeId(ipSrcObjKy) into lvSrcTypeKy;

  -- select lvSrcTypeKy;

  -- b. get the object type of id2 as id2objtype (call GetObjTypeId)
  select getObjInstanceTypeId(ipDestObjKy) into lvDestTypeKy;

  -- select lvDestTypeKy;

  -- c. check in object_link_type to see if id1objtype to id2objtype linking is allowed and find the linktable.
  select getObjLinkTypeKy(lvSrcTypeKy, lvDestTypeKy) into result;

  -- select result;

  return result;


END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `getObjInstName` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `getObjInstName`(
  ip_object_ky int(11)
) RETURNS varchar(255) CHARSET utf8mb3
BEGIN

  declare result varchar(255);

  select name_nm into result
  from
  -- object_instance oi,
  object_instance oi
  where oi.object_ky = ip_object_ky;

  return result;


END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `getObjLinkTable` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `getObjLinkTable`(
  ipSrcObjTypeKy int(11),
  ipDestObjTypeKy int(11)
) RETURNS varchar(255) CHARSET utf8mb3
BEGIN

  declare   result varchar(255) CHARSET utf8;

  select olt.table_nm into result
  from object_link_type olt
  where
    olt.dest_object_type_ky = ipDestObjTypeKy   and
    olt.src_object_type_ky = ipSrcObjTypeKy;

  return result;


END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `getObjLinkTypeKy` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `getObjLinkTypeKy`(
  ipSrcObjTypeKy int(11),
  ipDestObjTypeKy int(11)
) RETURNS int
BEGIN

  declare   result int(11);

  select olt.object_link_type_ky into result
  from object_link_type olt -- , object_instance oiSrc, object_instance oiDest
  where
    -- oiSrc.object_ky = ipSrcObjKy and
    -- oiDest.object_ky = ipDestObjKy and
    olt.dest_object_type_ky = ipDestObjTypeKy   and
    olt.src_object_type_ky = ipSrcObjTypeKy;

  return result;


END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `getObjTypeFromTblNm` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `getObjTypeFromTblNm`(
  ipTableNm varchar(255)
) RETURNS int
BEGIN
  declare result int(11);

  select object_type_ky into result
  from object_type ot
  where ot.table_nm = ipTableNm;

  return result;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `getObjTypeId` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `getObjTypeId`(
  ip_object_type_tbl varchar(255)

) RETURNS int
BEGIN

  declare result int(11);

  select object_type_ky into result from
  object_type ot
  where ot.table_nm = ip_object_type_tbl;

  return result;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `getObjTypeName` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `getObjTypeName`(
  ip_object_type_ky int(11)
) RETURNS varchar(255) CHARSET latin1
BEGIN

  declare result varchar(255);

  select name_nm into result
  from
  -- object_instance oi,
  object_type ot
  where ot.object_type_ky = ip_object_type_ky;

  return result;


END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `getObjTypeTbl` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `getObjTypeTbl`(
  ip_object_type_ky int(11)
) RETURNS varchar(255) CHARSET latin1
BEGIN

  declare result varchar(255);

  select table_nm into result
  from
  -- object_instance oi,
  object_type ot
  where ot.object_type_ky = ip_object_type_ky;

  return result;


END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `getParentCount` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `getParentCount`(
    objectKy int(11)
) RETURNS int
BEGIN
    DECLARE lvResultCount int(11);
    
    select count(*) into lvResultCount 
    from 
    object_instance_link oil
    where oil.dest_object_ky = objectKy;
    
    return lvResultCount;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `getParentCountWithOwner` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `getParentCountWithOwner`(
    objectKy int(11), 
    ownerKy int(11)
) RETURNS int
BEGIN
    DECLARE lvResultCount int(11);
    
    select count(*) into lvResultCount 
    from 
    object_instance_link oil, object_instance poi
    where oil.dest_object_ky = objectKy and
    poi.object_ky = oil.src_object_ky and 
    isPartOfSameLogin(ownerKy, poi.owner_ky)    
    ;
    
    return lvResultCount;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `getPersLogin` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `getPersLogin`(
    ipPersonalityId int(11)
) RETURNS int
BEGIN
    DECLARE loginId int(11);
    DECLARE notFound INT DEFAULT 0;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET notFound = 1;
    

    select login_id into loginId
    from loginpersonalities
    where personality_id = ipPersonalityId;
    
    if notFound then
        set notFound = 0;
        
        select login_id into loginId
        from logins
        where login_id = ipPersonalityId;
        
         if notFound then
            set notFound = 0;
            set loginId = null;
         end if;
   
     end if;
     
     return loginId;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `getRootTypeId` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `getRootTypeId`() RETURNS int
BEGIN

  declare  result int(11);
  
  select value into result from app_config ac where ac.key = "IDENTITY_ROOT";

  
  return result;


END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `isLoginType` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `isLoginType`(
  ip_object_type_ky1 int(11)
) RETURNS tinyint(1)
BEGIN
    
    DECLARE lvResult int(11);
    DECLARE lvResultBoolean int(1);
    
    select count(*) into lvResult
    from personality_types pt where pt.value = ip_object_type_ky1;
    
    if (lvResult > 0) then 
        return 1;
    else     
        return 0;
    end if;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `isObjectInstOwner` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `isObjectInstOwner`(
    ipLoginId int(11), 
    ipObjectId int(11)
) RETURNS tinyint(1)
BEGIN

DECLARE lvResultBoolean int(1);
DECLARE lvOwnerKy int(11);
DECLARE personalityOwnerCount int(11);

    select sum(cnt) into personalityOwnerCount from 
        (
        select count(*) cnt
        from object_instance oi , loginPersonalities lp
        where oi.object_ky = ipObjectId
        and lp.login_id = ipLoginId
        and oi.owner_ky = lp.personality_id    
        union
        select 1 cnt from 
        object_instance oi 
        where oi.object_ky = ipObjectId and 
        oi.owner_ky = ipLoginId        
        ) sumation
    ;
    
    if (personalityOwnerCount > 0) then 
        return 1 ;    
    else 
        return 0;    
    end if;
    
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `isPartOfSameLogin` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `isPartOfSameLogin`(
  ip_object_ky1 int(11),
  ip_object_ky2 int(11)
) RETURNS tinyint(1)
BEGIN
    
    DECLARE lvResult int(11);
    DECLARE lvIdRoot int(11);

    if ip_object_ky1 = ip_object_ky2 then
        return 1;
    end if;

    select value into lvIdRoot    
    from app_config ac
    where ac.key = 'IDENTITY_ROOT';
    
    select count(*) into lvResult 
    from loginpersonalities lp1, loginpersonalities lp2
    where lp1.login_id = lp2.login_id and 
    lp1.personality_id = ip_object_ky1 and
    lp2.personality_id = ip_object_ky2;
    
    if lvResult>0 then 
        return 1;
    end if;
    
    select count(*) into lvResult
    from loginpersonalities 
    where login_id = ip_object_ky1 and 
    personality_id = ip_object_ky2;
    
    if lvResult>0 then 
        return 1;
    end if;
    
    select count(*) into lvResult
    from loginpersonalities 
    where login_id = ip_object_ky2 and 
    personality_id = ip_object_ky1;
    
    if lvResult>0 then 
        return 1;
    end if;
    
    return 0;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `isPersonalityInstLink` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `isPersonalityInstLink`(
    id1 int(11),
    id2 int(11)
) RETURNS tinyint(1)
BEGIN

    DECLARE countOfRecords1 int(11);
    DECLARE countOfRecords2 int(11);
    
    DECLARE idType1 int(11);
    DECLARE idType2 int (11);
    
    set idType1 = getObjInstanceTypeId(id1);
    set idType2= getObjInstanceTypeId(id2);
    
    select count(*) into countOfRecords1
    from personality_types pt where pt.value = idType1;
    
    select count(*) into countOfRecords2
    from personality_types pt where pt.value = idType2;
    
    if(countOfRecords1 > 0 AND countOfRecords2 > 0)  then
        return 1;
    else 
        return 0;
    end if;
    
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `loginExists` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `loginExists`(
  ipLogin varchar(255)
) RETURNS int
BEGIN

  DECLARE notFound INT DEFAULT 0;
  DECLARE CONTINUE HANDLER FOR NOT FOUND SET notFound = 1;


  select object_ky into @objectId
  from obj_login ol
  where upper(ol.login) = upper(ipLogin);

  if notFound then
    return 0;
  else
    return @objectId;
  end if;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `loginPwExists` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `loginPwExists`(

ip_login varchar(255),

ip_password varchar(255)

) RETURNS int
BEGIN



  DECLARE notFound INT DEFAULT 0;

  DECLARE CONTINUE HANDLER FOR NOT FOUND SET notFound = 1;





  select object_ky into @objectId

  from obj_login ol

  where upper(ol.login) = upper(ip_login) and 
        ol.password = ip_password
  ;



  if notFound then

    return 0;

  else

    return @objectId;

  end if;



END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `updObjInst` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `updObjInst`() RETURNS int
BEGIN
  Return 1;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `updObjLnkType` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `updObjLnkType`() RETURNS int
BEGIN
  Return 1;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `updObjType` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `updObjType`() RETURNS int
BEGIN
 Return 1;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `approveInstanceLink` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `approveInstanceLink`(
ipOilId int(11),
ipApprover int(11), 
out result tinyint(1)
)
BEGIN


    DECLARE lvPersLogin int(11);
    
    set lvPersLogin = getPersLogin(ipApprover);
    
    -- parent
    insert into object_instance_link (src_object_ky, dest_object_ky, object_link_type_ky, owner_ky, srcApproved, destApproved, isDeleted, when_created)     
    select dest_object_ky, src_object_ky, oil.object_link_type_ky, ipApprover, 1, 1, 0, null
    from object_instance_link oil, object_instance oi, object_link_type olt
    where oi.object_ky = oil.src_object_ky and     
    oil.object_link_type_ky = olt.object_link_type_ky and
    olt.parentApprovalRequired = 1     and
    (
        -- this is a bad call improve on it
        isPartOfSameLogin(oi.owner_ky, lvPersLogin)
        
        /*
        oi.owner_ky = lvPersLogin or 
        (oi.owner_ky in (select personality_id from loginpersonalities where login_id = lvPersLogin))
        */
    )  
    and (oil.srcApproved = 0 or oil.srcApproved is null)
    and (
            (olt.childApprovalRequired = 0 or  olt.childApprovalRequired is null) or 
            oil.destApproved = 1
        )
    and  (isDeleted = 0 or isDeleted is null)
    and (oil.dest_object_ky, oil.src_object_ky, oil.object_link_type_ky ) not in (select src_object_ky, dest_object_ky, object_link_type_ky 
                                                                                    from object_instance_link oil2
                                                                                    where oil2.isDeleted = 0
                                                                                  )    
    and olt.createRecipUponApproval = 1
    and oil.object_inst_link_ky = ipOilId
    ;
    
    
    -- child
    insert into object_instance_link (src_object_ky, dest_object_ky, object_link_type_ky, owner_ky, srcApproved, destApproved, isDeleted, when_created)     
    select dest_object_ky, src_object_ky, oil.object_link_type_ky, ipApprover, 1, 1, 0, null
    from object_instance_link oil, object_instance oi, object_link_type olt
    where oi.object_ky = oil.dest_object_ky and     
    oil.object_link_type_ky = olt.object_link_type_ky and
    olt.childApprovalRequired = 1     and
    (
        isPartOfSameLogin(oi.owner_ky, lvPersLogin)
        /*
        oi.owner_ky = lvPersLogin or 
        (oi.owner_ky in (select personality_id from loginpersonalities where login_id = lvPersLogin))
        */
    )  
    and (oil.destApproved = 0 or oil.destApproved is null)
    and (
            (olt.parentApprovalRequired = 0 or  olt.parentApprovalRequired is null) or 
            oil.srcApproved = 1
        )
    and (isDeleted = 0 or isDeleted is null)
    and (oil.dest_object_ky, oil.src_object_ky, oil.object_link_type_ky ) not in (select src_object_ky, dest_object_ky, object_link_type_ky 
                                                                                    from object_instance_link oil2
                                                                                    where oil2.isDeleted = 0
                                                                                  )    
    and olt.createRecipUponApproval = 1
    and oil.object_inst_link_ky = ipOilId
    ;
    

    -- parent
    update object_instance_link oil
    set srcApproved = 1 
    where exists (select object_ky 
                  from object_instance oi, object_link_type olt
                  where
                  oi.object_ky = oil.src_object_ky and     
                  oil.object_link_type_ky = olt.object_link_type_ky and
                  olt.childApprovalRequired = 1       and
                  (
                      isPartOfSameLogin(oi.owner_ky, lvPersLogin)
                      /*
                        oi.owner_ky = lvPersLogin or 
                        (oi.owner_ky in (select personality_id from loginpersonalities where login_id = lvPersLogin))
                       */
                  )                  
                  and (isDeleted = 0 or isDeleted is null)
                  and (oil.srcApproved = 0 or oil.srcApproved is null)
                  and oil.object_inst_link_ky = ipOilId
                  )
    ;

    -- child
    update object_instance_link oil
    set destApproved = 1 
    where exists (select object_ky 
                  from object_instance oi, object_link_type olt
                  where
                  oi.object_ky = oil.dest_object_ky and     
                  oil.object_link_type_ky = olt.object_link_type_ky and
                  olt.childApprovalRequired = 1       and
                  (
                        isPartOfSameLogin(oi.owner_ky, lvPersLogin)
                        /*
                        oi.owner_ky = lvPersLogin or 
                        (oi.owner_ky in (select personality_id from loginpersonalities where login_id = lvPersLogin))
                        */
                  )
                  and (isDeleted = 0 or isDeleted is null)
                  and (oil.destApproved = 0 or oil.destApproved is null)
                  and oil.object_inst_link_ky = ipOilId
                  )
    ;
                  
                        
    set result = 1;                        
                                

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `cacheClearDeletedLinks` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `cacheClearDeletedLinks`()
BEGIN

    DECLARE done INT DEFAULT 0;
    DECLARE lvSrcObjectKy int(11);
    DECLARE lvDestObjectKy int(11);
    DECLARE lvSrcObjectType int(11);
      
    DECLARE  currentRunTs TIMESTAMP;     

    DECLARE feedCur CURSOR FOR 
    select src_object_ky, dest_object_ky, prnt_object_type_ky 
    from feed
    where feed.oil_when_updated > (select time from cache_gen_time cgt where cgt.table_nm = 'cache_obj_profile') and
    feed.oil_is_deleted = 1
    group by src_object_ky, prnt_object_type_ky;     

    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1; 
    OPEN feedCur; 

    read_loop: LOOP        
        fetch feedCur into lvSrcObjectKy, lvSrcObjectType, lvDestObjectKy;
            
        IF done THEN
            set done = 0;
            LEAVE read_loop;
        END IF;

        delete from cache_obj_profile where instance_obj_ky = dest_object_ky;
    end loop;


END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `cacheGen` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `cacheGen`()
BEGIN

     DECLARE done INT DEFAULT 0;
     DECLARE lvSrcObjectKy int(11);
     DECLARE lvDestObjectKy int(11);
     DECLARE lvSrcObjectType int(11);
     DECLARE srcCacheCount int(11);
     
     DECLARE loopEntered tinyint(1);
          
     DECLARE  currentRunTs TIMESTAMP;     

     DECLARE feedCur CURSOR FOR 
     select src_object_ky, dest_object_ky, prnt_object_type_ky 
     from feed
     where feed.oil_when_created > (select time from cache_gen_time cgt where cgt.table_nm = 'cache_obj_profile')
     group by src_object_ky, prnt_object_type_ky;     
     
     DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1; 
     
     CALL cacheClearDeletedLinks();
     
     OPEN feedCur; 

     SET currentRunTs = NOW();
     SET loopEntered = 0;

     read_loop: LOOP
            
            fetch feedCur into lvSrcObjectKy, lvDestObjectKy, lvSrcObjectType;
            
            
            IF done THEN
                set done = 0;
                LEAVE read_loop;
            END IF;
            SET loopEntered = 1;
            -- if (!isLoginType(lvSrcObjectType)) then 
                
                -- Don't need to grab the parent details if they are alreay in the cache
                select count(*) into srcCacheCount
                from cache_obj_profile 
                where instance_obj_ky = lvSrcObjectKy;
                
                if srcCacheCount = 0 then
                    call getParentUserIdsTmpTbl(lvSrcObjectKy);
                end if;
                call getParentUserIdsTmpTbl(lvDestObjectKy);
            -- end if;   
   end loop;

   if loopEntered then 
        call tmpTableToCache();     
        drop table tmp_hierarchy;
   end if;

   update cache_gen_time 
   SET time = currentRunTs 
   where cache_gen_time.table_nm =  'cache_obj_profile';
 
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `createLogin` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `createLogin`(

in ip_login varchar(255),

in ip_password varchar(255), 

in ip_email varchar(255),

out op_objid int(11)

)
BEGIN



  DECLARE lv_loginObjTypeId INT(11);

  DECLARE lv_objectKy INT(11);



  SET lv_loginObjTypeId = 3;



  call createObjInst (lv_loginObjTypeId, ip_login, null, lv_objectKy );
  
  set op_objid = lv_objectKy;


  update object_instance 
  set owner_ky = lv_objectKy 
  where object_ky = lv_objectKy;

  -- insert into obj_login  (object_Ky, login, password, email) values (lv_objectKy, ip_login, ip_password, ip_email );
  
  update obj_login ol 
  set login = ip_login, 
      password = ip_password,
      email= ip_email
  where ol.object_Ky = lv_objectKy;



  -- return lv_objectKy;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `createObjInst` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `createObjInst`(
 IN ip_object_type_ky INT(10),
 IN ip_object_instance_nm varchar(255) charset utf8,
 IN ip_owner_ky int(11),
 out newInstanceId int(11)
)
BEGIN

  declare tableNm Varchar(255);

  -- declare exit handler for not found rollback;
  -- declare exit handler for sqlexception rollback;
  -- declare exit handler for sqlwarning rollback;

  -- start transaction;

    -- declare newInstanceId int(11);

  select getObjTypeTbl(ip_object_type_ky) into tableNm;

  insert into object_instance (object_type_ky, name_nm, owner_ky, when_created) values (ip_object_type_ky, ip_object_instance_nm, ip_owner_ky, null);

  set newInstanceId =  LAST_INSERT_ID();

  -- select Concat('insert into ' , tableNm , ' (object_ky) values (', newInstanceId ,');');

  set @onFlySql = Concat('insert into ' , tableNm , ' (object_ky) values (', newInstanceId ,');');

  PREPARE createStatement FROM @onFlySql;

  EXECUTE createStatement;

  DEALLOCATE PREPARE createStatement;

  -- select Concat('insert into ' + tableNm + ' (object_ky) values ('+ newInstanceId +');');

  -- return newInstanceId;
  -- commit;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `createObjInstLink` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `createObjInstLink`(
  IN ipSrcObjectKy int(11),
  IN ipDestObjectKy int(11),
  IN ipOltKy int(11),
  IN ip_owner_ky int(11),
  out lvResult int(11) 
)
BEGIN

declare lvSrcTypeKy int(11);
declare lvDestTypeKy int(11);
declare lvLinkTable varchar(255) charset utf8;
declare lvObjLinkTypeKy int(11);
declare lvObectInstLinkKy int(11);
declare lvOnTheFlySql varchar(255) charset utf8;

declare lvParentApprovalRequired tinyint(1);
declare lvChildApprovalRequired tinyint(1);

declare lvParentApproved tinyint(1);
declare lvChildApproved tinyint(1);

declare lvParentOwnerKy int(11);
declare lvChildOwnerKy int(11);

--  declare exit handler for not found rollback;
--  declare exit handler for sqlexception rollback;
--  declare exit handler for sqlwarning rollback;

--  start transaction;

-- declare lvResult int(11);

                -- 1) First check to see if association is allowed:
                
                set lvParentApproved =0;
                set lvChildApproved = 0;
                
                /*
                   get lvObjLinkTypeKy
                   This was the wrong thing to do as the same two object types can be linked multiple ways
                   Such as a person to person relationship that is designated "is the offspring of" versus 
                   "is the parent of"
                   select getObjInstLinkTypeKy(ipSrcObjectKy, ipDestObjectKy) into lvObjLinkTypeKy;
                */
                set lvObjLinkTypeKy = ipOltKy;

                if (lvObjLinkTypeKy = 0) then
                    -- relationship not allowed
                    -- return 0;
                    set lvResult = 0;
                else
                
                    -- get lvParentApprovalRequired and lvChildApprovalRequired
                    select parentApprovalRequired,  childApprovalRequired into lvParentApprovalRequired, lvChildApprovalRequired
                    from object_link_type olt 
                    where object_link_type_ky = lvObjLinkTypeKy;
                    
                    -- get lvParentOwnerKy
                    select owner_ky into lvParentOwnerKy 
                    from object_instance oi 
                    where oi.object_ky = ipSrcObjectKy;
                    
                    
                    
                    -- get lvChildOwnerKy
                    select owner_ky into lvChildOwnerKy 
                    from object_instance oi 
                    where oi.object_ky = ipDestObjectKy;
                    
                    if not lvParentApprovalRequired then 
                        set lvParentApproved =1 ;
                    end if;
                    
                    if not lvChildApprovalRequired then
                        set lvChildApproved  = 1;
                    end if;
                    
                    if not lvParentApproved then 
                        if ip_owner_ky = lvParentOwnerKy then 
                            set lvParentApproved=1;
                        end if;
                        
                        if not lvParentApproved then
                            set lvParentApproved = isPartOfSameLogin(ip_owner_ky, lvParentOwnerKy);
                        end if;
                        
                    end if; 
                    
                    if not lvChildApproved then 
                        if ip_owner_ky = lvChildOwnerKy then 
                           set  lvChildApproved=1;
                        end if;
                        
                        if not lvChildApproved then
                            set lvChildApproved = isPartOfSameLogin(ip_owner_ky, lvChildOwnerKy);
                        end if;
                    end if; 
                    
                    select getObjInstLinkTable(ipSrcObjectKy, ipDestObjectKy)  into lvLinkTable;

                    insert into  object_instance_link (src_object_ky, dest_object_ky, object_link_type_ky, owner_ky, srcApproved, destApproved, when_created)
                    values (ipSrcObjectKy, ipDestObjectKy, lvObjLinkTypeKy, ip_owner_ky, lvParentApproved, lvChildApproved, null);

                      set lvObectInstLinkKy = LAST_INSERT_ID();
                      set lvResult = lvObectInstLinkKy;

                      if not lvLinkTable is null then

                          set lvOnTheFlySql = concat(
                          'insert into ',
                          lvLinkTable,
                          ' (object_inst_link_ky) values (',
                          lvObectInstLinkKy,
                          ')');

                      end if;

                end if;
                
                call cachegen();
--  commit;

                -- return lvResult;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `createObjLnkType` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `createObjLnkType`(
IN ipSrcObjTypeKy int(11),
IN ipDestObjTypeKy int(11),
IN ipTableNm varchar(255),

IN ipChldCrtRd TINYINT(1),
IN ipChildCrtWr TINYINT(1),
IN ipChildCrtDel TINYINT(1),

IN ipFrndOfChldCrtRd TINYINT(1),
IN ipFrndOfChldCrtWr TINYINT(1),
IN ipFrndOfChldCrtDel TINYINT(1),

IN ipPrivFrndOfChldCrtRd TINYINT(1),
IN ipPrivFrndOfChldCrtWr TINYINT(1),
IN ipPrivFrndOfChldCrtDel TINYINT(1),

IN ipRestFrndOfChldCrtRd TINYINT(1),
IN ipRestFrndOfChldCrtWr TINYINT(1),
IN ipRestFrndOfChldCrtDel TINYINT(1),

IN ipParentsOfChldRecRd TINYINT(1),
IN ipParentsOfChldRecWr TINYINT(1),
IN ipParentsOfChldRecDel TINYINT(1),

IN ipFrndOfPrntsOfChldRecRd TINYINT(1),
IN ipFrndOfPrntsOfChldRecWr TINYINT(1),
IN ipFrndOfPrntsOfChldRecDel TINYINT(1),

IN ipPrivFrndOfPrntsOfChldRecRd TINYINT(1),
IN ipPrivFrndOfPrntsOfChldRecWr TINYINT(1),
IN ipPrivFrndOfPrntsOfChldRecDel TINYINT(1),

IN ipRestFrndOfPrntsOfChldRecRd TINYINT(1),
IN ipRestFrndOfPrntsOfChldRecWr TINYINT(1),
IN ipRestFrndOfPrntsOfChldRecDel TINYINT(1),

IN ipAllowChldCreate TINYINT(1),
IN ipAllowChldLink TINYINT(1),

IN ipForceSingleChild TINYINT(1),

OUT opObjLnkTypeId int(11)

)
BEGIN

  -- declare result varchar(255);

  declare  lvSrcName varchar(255);
  declare  lvDestName varchar(255);
  declare  lvObjLnkTypeNm varchar(255);

  set lvSrcName = getObjTypeTbl(ipSrcObjTypeKy) ;
  set lvDestName = getObjTypeTbl(ipDestObjTypeKy);
  set lvObjLnkTypeNm = concat (lvSrcName, ' to ', lvDestName);

  -- select concat (lvSrcName, ' to ', lvDestName) into @gvObjLnkTypeNm;

  insert into object_link_type (
                    src_object_type_ky,
                    dest_object_type_ky,
                    object_link_type_nm,
                    table_nm,
                    -- Read block
                    permCreatorR,
                    permCreaFrndsR,
                    permCreaPrivFrndsR,
                    permCreaRestFrndsR,
                    permPrntR,
                    permPrntFrndsR,
                    permPrntPrivFrndsR,
                    permPrntRestFrndsR,

                    -- Write block
                    permCreatorW,
                    permCreaFrndsW,
                    permCreaPrivFrndsW,
                    permCreaRestFrndsW,
                    permPrntW,
                    permPrntFrndsW,
                    permPrntPrivFrndsW,
                    permPrntRestFrndsW,

                    -- Delete block
                    permCreatorD,
                    permCreaFrndsD,
                    permCreaPrivFrndsD,
                    permCreaRestFrndsD,
                    permPrntD,
                    permPrntFrndsD,
                    permPrntPrivFrndsD,
                    permPrntRestFrndsD,

                    allowChldCreation,
                    allowChldLink,
                    allowMultiChld
          )
          values (ipSrcObjTypeKy,
                  ipDestObjTypeKy,
                  lvObjLnkTypeNm,
                  ipTableNm,

                -- Read block
								ipChldCrtRd,
								ipFrndOfChldCrtRd,
								ipPrivFrndOfChldCrtRd,
								ipRestFrndOfChldCrtRd,
								ipParentsOfChldRecRd,
								ipFrndOfPrntsOfChldRecRd,
								ipPrivFrndOfPrntsOfChldRecRd,
								ipRestFrndOfPrntsOfChldRecRd,

                -- Write block
								ipChildCrtWr,
								ipFrndOfChldCrtWr,
								ipPrivFrndOfChldCrtWr,
								ipRestFrndOfChldCrtWr,
								ipParentsOfChldRecWr,
								ipFrndOfPrntsOfChldRecWr,
								ipPrivFrndOfPrntsOfChldRecWr,
								ipRestFrndOfPrntsOfChldRecWr,

                -- Delete block
                ipChildCrtDel,
								ipFrndOfChldCrtDel,
								ipPrivFrndOfChldCrtDel,
								ipRestFrndOfChldCrtDel,
								ipParentsOfChldRecDel,
								ipFrndOfPrntsOfChldRecDel,
								ipPrivFrndOfPrntsOfChldRecDel,
								ipRestFrndOfPrntsOfChldRecDel,

                ipAllowChldCreate,
                ipAllowChldLink,

                ipForceSingleChild
          );

  set opObjLnkTypeId = LAST_INSERT_ID();

    --
    -- create table
    -- DROP TABLE IF EXISTS `hierarchy_cm`.`obj_car`;

    if not ipTableNm is null AND ipTableNm <> '' then
        set @onFlySql = Concat( 'CREATE TABLE  `', ip_schema_nm, '`.`', ipTableNm,
                    '` (
                    `object_inst_link_ky` int(10) unsigned NOT NULL,
                    `relation_notes` varchar(45) NOT NULL,
                    PRIMARY KEY (`object_inst_link_ky`) USING BTREE,
                    CONSTRAINT `FK_objlnk_person_person_oilk` FOREIGN KEY (`object_inst_link_ky`) REFERENCES `object_instance_link` (`object_inst_link_ky`)
                    ) ENGINE=InnoDB DEFAULT CHARSET=latin1;'
                    );

        PREPARE createStatement FROM @onFlySql;

        EXECUTE createStatement;

        DEALLOCATE PREPARE createStatement;

        /*
        CREATE TABLE  ip_schema_nm.ip_table_nm  ( -- ip_schema_nm.ip_table_nm
        `object_ky` int(10) unsigned NOT NULL AUTO_INCREMENT,
        PRIMARY KEY (`object_ky`),
        CONSTRAINT `FK_obj_car_obj_ky` FOREIGN KEY (`object_ky`) REFERENCES `object_instance` (`object_ky`)
      ) ENGINE=InnoDB DEFAULT CHARSET=latin1;
        */

    end if;

  -- return result;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `createObjType` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `createObjType`(

  IN ip_table_nm varchar (255),
  IN ip_schema_nm varchar (255),
  IN ip_name_nm varchar(255),
  OUT op_object_type_id int

)
BEGIN
  declare lastInsertId int;
  -- declare onFlySql Varchar(255);

  -- create the object_type record
  insert into object_type (table_nm, schema_nm, name_nm) values (ip_table_nm, ip_schema_nm, ip_name_nm);

  set lastInsertId = LAST_INSERT_ID();

  -- if not ip_table_nm is null AND ip_table_nm <> '' then
    -- create table
    -- DROP TABLE IF EXISTS `hierarchy_cm`.`obj_car`;

    set @onFlySql = Concat(
    'CREATE TABLE  ', ip_schema_nm, '.', ip_table_nm, '  ( -- ip_schema_nm.ip_table_nm
      `object_ky` int(10) unsigned NOT NULL AUTO_INCREMENT,
      PRIMARY KEY (`object_ky`),
      CONSTRAINT `FK_',ip_table_nm,'_obj_ky` FOREIGN KEY (`object_ky`) REFERENCES `object_instance` (`object_ky`)
    ) ENGINE=InnoDB DEFAULT CHARSET=latin1;
     -- end if'
     );


    PREPARE createStatement FROM @onFlySql;

    EXECUTE createStatement;

    DEALLOCATE PREPARE createStatement;


    set op_object_type_id = lastInsertId;
    -- returning lastInsertId into op_object_type_id;


END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `createPersonality` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `createPersonality`(

in ip_loginId varchar(255),

in ip_firstName varchar(255), 

in ip_lastName varchar(255),

out op_objid int(11)

)
BEGIN

  DECLARE lv_loginObjTypeId INT(11);
  DECLARE lv_dfltPersonTypeId INT(11);
  
  DECLARE lv_dfltPersonTableNm VARCHAR(255);

  DECLARE lv_objectKy INT(11);
  
  DECLARE lv_newPersonId INT(11);
  
  DECLARE lv_newOilId INT(11);
  
  DECLARE lv_defPersType INT(11);

  SET lv_loginObjTypeId = getRootTypeId();
  SET lv_dfltPersonTypeId= getDefaultPersonalityTypeId();
  SET lv_dfltPersonTableNm = getObjTypeTbl(lv_dfltPersonTypeId);

  call createObjInst (lv_dfltPersonTypeId, concat(ip_firstName, ' ', ip_lastName), ip_loginId, lv_objectKy ); 
  set op_objid = lv_objectKy;

  set @onFlySql = Concat('update ' , lv_dfltPersonTableNm , ' SET first_name = ''', ip_firstName, ''', last_name =''', ip_lastName, ''' where object_ky = ', op_objid,';');
  PREPARE createStatement FROM @onFlySql;
  EXECUTE createStatement;
  DEALLOCATE PREPARE createStatement;      
  set lv_newPersonId =  LAST_INSERT_ID();
  
  set lv_defPersType = getAppConfigVal('DEFAULT_PERSONALITY_LINK_TYPE_ID');
  
  call createObjInstLink(ip_loginId,lv_newPersonId, lv_defPersType,  ip_loginId, lv_newOilId);

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `delLogin` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `delLogin`(
  login  varchar(255)
)
BEGIN

  select object_ky into @lObjectKy
  from obj_login ol
  where
    ol.login = login;

  call delObj(@lObjectKy, @lObjectKy);

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `delObj` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `delObj`(
objectId int, 
ipLoginId int(11)
)
BEGIN

  DECLARE lChildObjKey int;
  DECLARE countOfChildRelRecords int;

  DECLARE tableNm varchar(255);
  
  DECLARE lvInstLinkKy int;
  DECLARE lvInstLinkTypeKy int;
  
  DECLARE isAllowedToDelete boolean;

  DECLARE done INT DEFAULT 0;

  DECLARE lRelObjCur CURSOR FOR
  select dest_object_ky, oil.object_inst_link_ky, oil.object_link_type_ky
  from object_instance_link oil where
  oil.src_object_ky = objectId;

  DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;

  set @@max_sp_recursion_depth=200;

  -- first get the table where the src object lives:

  if (isObjectInstOwner(ipLoginId, objectId) = 1) then 

      select ot.table_nm into tableNm
      from object_type ot, object_instance oi
      where oi.object_ky = objectId and
            ot.object_type_ky = oi.object_type_ky;


      -- select @srcTable;

      -- now get all the tables where related data lives:
      /*
      select destOt.table_nm
      from object_instance_link oil,
           object_link_type olt,
           object_type destOt,
           object_type srcOt

      where oil.object_link_type_ky = olt.object_link_type_ky and
            olt.src_object_type_ky = srcOt.object_type_ky and
            olt.dest_object_type_ky = destOt.object_tyle_ky and
            srcOt.table_nm = @srcTable;
      */


      OPEN lRelObjCur;

      -- select 'opened table';

      -- recursively delete all the related orphaned objects
      read_loop: LOOP

        fetch lRelObjCur into lChildObjKey, lvInstLinkKy, lvInstLinkTypeKy;

        IF done THEN
          LEAVE read_loop;
        END IF;


        select sum(1) into countOfChildRelRecords
         from (
          select count(*)
          from object_instance_link oil
          where oil.dest_object_ky = lChildObjKey
    /*
          union
          select count(*)
          from object_instance_link oil
          where oil.src_object_ky = lDestObjKey
    */

          ) relCountTbl;

          -- check to see if the related records are orphans
          IF countOfChildRelRecords = 1  THEN
            -- if orphan delete the related record
            call delObj(lChildObjKey, ipLoginId);
          END IF;

          -- SELECT countOfDestRelRecords;


      end loop;

      -- first delete the link records
      delete from object_instance_link
      where src_object_ky = objectId 
      ;

      delete from object_instance_link
      where dest_object_ky = objectId
      ;

      -- delete the instance table record

      set @ontheflysql = concat(
      'delete from ',
      tableNm,
      ' where object_ky = ',
      objectId);


      PREPARE s1 from @ontheflysql;

      EXECUTE s1;

      -- delete the object instance record
      delete from object_instance
      where object_ky  = objectId;
  
  end if;


END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `delObjInstLnk` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `delObjInstLnk`(
instLinkId int(10),
loginId int(10)
)
BEGIN

    DECLARE lvOwnerKy int(10);
    DECLARE lvDestObjInstId int(10);
    DECLARE lvSrcObjInstId int(10);
    DECLARE lvOiTypeKy int(10);
    
    DECLARE lvDoubleLink int(1);
    DECLARE lvLinkTypeKy int(10);
    
    select oi.owner_ky, oil.dest_object_ky, oil.src_object_ky,  oi.object_type_ky, olt.createRecipUponApproval, oil.object_link_type_ky
    into lvOwnerKy, lvDestObjInstId ,lvSrcObjInstId, lvOiTypeKy, lvDoubleLink, lvLinkTypeKy
    from object_instance oi, object_instance_link oil, object_link_type olt
    where oil.object_inst_link_ky = instLinkId and 
    oil.dest_object_ky = oi.object_ky and 
    oil.object_link_type_ky = olt.object_link_type_ky;    
    
    if (isPartOfSameLogin(loginId, lvOwnerKy) and getParentCountWithOwner(lvDestObjInstId, loginId) = 1 and isLoginType(lvOiTypeKy) = 0) then             
            call delObj(lvDestObjInstId, loginId);        
    else 
        delete 
        from object_instance_link 
        where object_inst_link_ky = instLinkId;
        
        if (lvDoubleLink = 1) then 
            delete 
            from object_instance_link 
            where dest_object_ky = lvSrcObjInstId and 
            src_object_ky = lvDestObjInstId and
            object_link_type_ky = lvLinkTypeKy;
        
        end if;
    end if;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `delObjLnkType` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `delObjLnkType`(
  oltId int(11)
)
BEGIN

  delete
  from object_link_type
  where object_link_type_ky = oltId;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `delObjType` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `delObjType`(
  IN ipObjTypeKy int(11)
)
BEGIN

  declare lvTableNm varchar(255);
  declare lvLinkTableNm varchar(255);
  declare lvLinkTypeKy int(11);
  DECLARE done INT DEFAULT 0;


  DECLARE lRelObjCur CURSOR FOR
  select table_nm, olt.object_link_type_ky
  from object_link_type olt where
  olt.src_object_type_ky = ipObjTypeKy
  UNION
  select table_nm, olt.object_link_type_ky
  from object_link_type olt where
  olt.dest_object_type_ky = ipObjTypeKy
  ;

  DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;

  OPEN lRelObjCur;

  read_loop: LOOP

    fetch lRelObjCur into lvLinkTableNm, lvLinkTypeKy;

    IF done THEN
      LEAVE read_loop;
    END IF;

    if not lvLinkTableNm is null and lvLinkTableNm <> ''then

      delete from object_instance_link where object_link_type_ky = lvLinkTypeKy;
      -- delete from object_instance_link where object_link_type_ky = lvLinkTypeKy;

       set @foo = 'bar';

       set @onFlySql = Concat(
       'drop table if exists ', lvLinkTableNm, ';'
       );
      PREPARE createStatement FROM @onFlySql;
      EXECUTE createStatement;
      DEALLOCATE PREPARE createStatement;



    end if;

  end loop;



  delete from object_instance where object_type_ky = ipObjTypeKy;

  delete from object_link_type
  where src_object_type_ky = ipObjTypeKy;

  delete from object_link_type
  where dest_object_type_ky = ipObjTypeKy;





  set  lvTableNm = getObjTypeTbl(ipObjTypeKy);

  set @onFlySql = Concat(
       'drop table if exists ', lvTableNm, ';'
  );
  PREPARE createStatement FROM @onFlySql;
  EXECUTE createStatement;
  DEALLOCATE PREPARE createStatement;


  delete from object_type
  where object_type_ky = ipObjTypeKy;


END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `denyInstanceLink` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `denyInstanceLink`(
    ipOilKy int(11),
    ownerKy int(11),    
    out result tinyint(1)
)
BEGIN

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getAllAncesInstances` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getAllAncesInstances`(
childObjId int -- ,
-- firstcall boolean
)
BEGIN
    call getAllAncesInstancesTmpTbl(childObjId, true, 1, 5, false, false, 0, childObjId);
    select * from tmp_hierarchy;
    drop table tmp_hierarchy;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getAllAncesInstancesTmpTbl` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getAllAncesInstancesTmpTbl`(
childObjId int,
firstcall boolean,
ipdepth int, 
ipdepthlimit int, 
only_personalities boolean, 
only_logins boolean , 
lastIdentity int, 
ipRootId int
)
BEGIN

  DECLARE lParentObjectKy int;
  DECLARE lParentObjectTypeKy int;
  DECLARE countOfChildRecords int;

  DECLARE parentName varchar(255)  CHARSET utf8;
  DECLARE childName varchar(255)  CHARSET utf8;
  DECLARE childTypeId int;

  -- DECLARE ontheflysql varchar(255);

  DECLARE done INT DEFAULT 0;
  
  DECLARE myRecordId int;
  
  DECLARE lvLoginFound tinyint(1);

  DECLARE rootTypeId int(11);
  

  DECLARE lRelObjCur CURSOR FOR
  select src_object_ky, olt.src_object_type_ky
  from object_link_type olt, object_instance_link oil where
  oil.dest_object_ky = childObjId and
  oil.object_link_type_ky = olt.object_link_type_ky and olt.src_object_type_ky = getRootTypeId() and
  oil.isDeleted <> 1
  union
  select src_object_ky, olt.src_object_type_ky
  from object_link_type olt, object_instance_link oil where
  oil.dest_object_ky = childObjId and
  oil.object_link_type_ky = olt.object_link_type_ky  and not olt.src_object_type_ky = getRootTypeId() and
  oil.isDeleted <> 1
  ;


  DECLARE lRelObjCurPersOnly CURSOR FOR
  select src_object_ky, olt.src_object_type_ky
  from object_link_type olt, object_instance_link oil where
  oil.dest_object_ky = childObjId and
  oil.object_link_type_ky = olt.object_link_type_ky and 
  olt.src_object_type_ky in (select value from personality_types) and
  olt.dest_object_type_ky in (select value from personality_types) and
  oil.isDeleted <> 1;


  DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;

  set rootTypeId = getRootTypeId();

  create temporary table if not exists tmp_hierarchy (
    breadcrumb longtext,
    recordId int(10) unsigned not null AUTO_INCREMENT,
    parentId int(10),
    childParent int(10),
    childId int(10),
    typeId int(10),
    tableNm varchar(255)  CHARSET utf8,
    parentNm varchar(255)  CHARSET utf8,
    depth int,
    rootId int(11),

   PRIMARY KEY (`recordId`)
  )
 ;

  set @@max_sp_recursion_depth=200;

  set lvLoginFound = 0;
  set childName = getObjInstName(childObjId);
  set childTypeId = getObjInstanceTypeId(childObjId);

main: begin

  if (firstCall) then
    if (only_logins and childTypeId = getRootTypeId()) or not only_logins then 
        insert into tmp_hierarchy (breadcrumb, childId, parentId, typeId, depth, rootId) values ( childName, childObjId, 0, childTypeId, ipdepth, ipRootId);  
        set lvLoginFound = 1;
        SELECT @@IDENTITY into myRecordId;
    end if;
    
    set ipdepth = ipdepth + 1;
    if ipdepth > ipdepthlimit and ipdepthlimit <> 0 then 
      leave main   ;
    end if;
  end if;

    if only_personalities then
        OPEN lRelObjCurPersOnly;
    else 
        OPEN lRelObjCur;
    end if;

  -- loop through the children
  read_loop: LOOP
        
      
      if only_personalities then
        fetch lRelObjCurPersOnly into lParentObjectKy, lParentObjectTypeKy;
      else 
        fetch lRelObjCur into lParentObjectKy, lParentObjectTypeKy;
      end if;

      IF done THEN
        LEAVE read_loop;
      END IF;


      set parentName = getObjInstName(lParentObjectKy);
      if (only_logins and lParentObjectTypeKy = getRootTypeId()) or not only_logins then 
        insert into tmp_hierarchy (breadcrumb, childId, typeId, parentId, childParent, parentNm, depth, rootId) values ( parentName, lParentObjectKy, lParentObjectTypeKy, childObjId, childObjId, parentName, ipdepth, ipRootId);
        SELECT @@IDENTITY into myRecordId;
        set lvLoginFound = 1;
      end if;

      


      select count(*) into countOfChildRecords
      from object_link_type olt, object_instance_link oil
      where oil.dest_object_ky = childObjId and
            oil.object_link_type_ky = olt.object_link_type_ky
            ;

      -- check to see if the related records are leifs
      IF countOfChildRecords > 0 and lParentObjectKy <> childObjId THEN
        
        -- if not leaf, recurse down the child.        
        if ((ipdepthlimit = 0 OR ipdepthlimit > ipdepth) and ((only_logins and not lvLoginFound) or (not only_logins)) ) then 
        
            call getAllAncesInstancesTmpTbl(lParentObjectKy, false, ipdepth +1, ipdepthlimit, only_personalities, only_logins, myRecordId, ipRootId);
        end if;
        
        update tmp_hierarchy
        set breadcrumb = concat(parentName, '->', breadcrumb) ,
           parentId = childObjId
        where parentId = lParentObjectKy
        and recordId > myRecordId
        ;
      END IF;

  end loop;

  if (firstCall) then

    update tmp_hierarchy
    set breadcrumb = concat(childName, '->', breadcrumb)
    where parentId = childObjId;
    -- select * from tmp_hierarchy;
    -- drop table tmp_hierarchy;
  end if;
  
   end main;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getAllAncestors` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getAllAncestors`(
childObjTypeId int
)
BEGIN

     call getAllAncestorsTmpTbl(childObjTypeId, true, 1);

     select * from tmp_hierarchy;
     drop table tmp_hierarchy;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getAllAncestorsTmpTbl` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getAllAncestorsTmpTbl`(
childObjTypeId int,
firstcall boolean,
ipdepth int
)
BEGIN

  DECLARE lParentObjectTypeKy int;
  DECLARE countOfParentRecords int;

  DECLARE lvChildTblName varchar(255);
  DECLARE lvParentTblName varchar(255);

  -- DECLARE ontheflysql varchar(255);

  DECLARE done INT DEFAULT 0;

  -- get all parents
  DECLARE lRelObjCur CURSOR FOR
  select src_object_type_ky
  from object_link_type oil where
  oil.dest_object_type_ky = childObjTypeId;

  DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;


  create temporary table if not exists tmp_hierarchy (
    breadcrumb varchar(255),
    recordId int(10) unsigned not null AUTO_INCREMENT,
    parentId int(10),
    childId int(10),
    typeId int(10),
    depth int(10),
   PRIMARY KEY (`recordId`)
  )
 ;

  set @@max_sp_recursion_depth=200;


  set lvChildTblName = getObjTypeTbl(childObjTypeId);


  if (firstCall) then
    insert into tmp_hierarchy (breadcrumb, childId, parentId, depth) values ( lvChildTblName, childObjTypeId, 0, ipdepth);
    set ipdepth = ipdepth + 1;
  end if;



  OPEN lRelObjCur;

  -- loop through the children
  read_loop: LOOP

      fetch lRelObjCur into lParentObjectTypeKy;

      IF done THEN
        LEAVE read_loop;
      END IF;


      set lvParentTblName = getObjTypeTbl(lParentObjectTypeKy);

      -- insert into tmp_hierarchy (breadcrumb, childId, parentId) values ( childTblName, lChildObjectTypeKy, parentObjTypeId);

      insert into tmp_hierarchy (breadcrumb, childId, parentId, depth) values ( lvParentTblName, lParentObjectTypeKy, childObjTypeId, ipdepth);

      select count(*) into countOfParentRecords
      from object_link_type olt
      where olt.dest_object_type_ky = childObjTypeId;

      -- check to see if the related records are leafs
      IF countOfParentRecords > 0 and lParentObjectTypeKy <> childObjTypeId THEN
        -- if orphan delete the related record
        set ipdepth = ipdepth + 1;
        call getAllAncestorsTmpTbl(lParentObjectTypeKy, false, ipdepth);
        set ipdepth = ipdepth -1;
        update tmp_hierarchy
        set breadcrumb = concat(lvParentTblName, '->', breadcrumb) ,
           parentId = childObjTypeId
        where parentId = lParentObjectTypeKy
        ;
      END IF;



  end loop;

  if (firstCall) then

    update tmp_hierarchy
    set breadcrumb = concat(lvChildTblName, '->', breadcrumb)
    where parentId = childObjTypeId;


    -- select * from tmp_hierarchy;
    -- drop table tmp_hierarchy;
  end if;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getAllAppConfig` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getAllAppConfig`()
BEGIN

  
  select ac.key, ac.value
  from app_config ac;



END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getAllDescendents` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getAllDescendents`(
parentObjTypeId int,-- ,
maxdepth int, 
loginid int
-- firstcall boolean
)
BEGIN

    call getAllDescendentsTmpTbl(parentObjTypeId, null, true, 1, maxdepth, loginid);

    select * from tmp_hierarchy;
    drop table tmp_hierarchy;


END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getAllDescendentsTmpTbl` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getAllDescendentsTmpTbl`(
parentObjTypeId int,
parentObjLnkTypeId int,
firstcall boolean,
ipdepth int, 
maxdepth int, 
loginid int

)
BEGIN

  DECLARE lChildObjectTypeKy int;
  DECLARE lObjectInstanceLinkId int;
  
  DECLARE lObjectLinkTypeNm varchar(255);
  
  DECLARE countOfChildRecords int;
  
  DECLARE typeCategory int;

  DECLARE childName varchar(255);
  DECLARE parentName varchar(255);

  DECLARE childTblName varchar(255);
  DECLARE parentTblName varchar(255);

  DECLARE typeName varchar(255);
  
  DECLARE myRecordId int;

  -- DECLARE ontheflysql varchar(255);

  DECLARE done INT DEFAULT 0;


  DECLARE lRelObjCur CURSOR FOR
  select dest_object_type_ky, olt.object_link_type_ky, ot.name_nm, ot.table_nm, olt.object_link_type_nm, ot.object_type_category_ky
  from object_link_type olt, object_type ot where
  olt.src_object_type_ky = parentObjTypeId and
  ot.object_type_ky = olt.dest_object_type_ky;

  DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;


  create temporary table if not exists tmp_hierarchy (
    breadcrumbIds varchar(255),
    breadcrumb varchar(255),
    recordId int(10) unsigned not null AUTO_INCREMENT,
    parentId int(10),
    childParent int(10),
    childId int(10),
    typeId int(10),
    tableNm varchar(255),
    parentNm varchar(255),
    depth int,
    oltid int,
    typeName varchar(255),
    linkTypeName varchar(255),
    oilid int,
    typeCategory int,
    chldOwnerKy int,
    chldOwnerNm varchar(255),
    whenUpdated timestamp,

   PRIMARY KEY (`recordId`)
  )
 ;

  set @@max_sp_recursion_depth=200;

main: begin

  set parentName = getObjTypeName(parentObjTypeId);
  set parentTblName = getObjTypeTbl(parentObjTypeId);
  -- set objectTypeCategory = getObjTypeCategory(parentObjTypeId);

  if (firstCall) then
    insert into tmp_hierarchy (breadcrumbIds, breadcrumb, childId, parentId, tableNm, typeid, depth, oltid, typeName, linkTypeName, oilid, typeCategory) values (parentObjTypeId, parentName, parentObjTypeId, 0, parentTblName, parentObjTypeId, ipdepth, null, parentName, null, null, 1);
    set ipdepth = ipdepth+1;
    
     if ipdepth > maxdepth and maxdepth <> 0 then 
      leave main   ;
    end if;

  end if;

  OPEN lRelObjCur;

  -- loop through the children
  read_loop: LOOP

      fetch lRelObjCur into lChildObjectTypeKy, lObjectInstanceLinkId, childName, childTblName, lObjectLinkTypeNm, typeCategory;

      IF done THEN
        LEAVE read_loop;
      END IF;

      -- set childName = getObjTypeName(lChildObjectTypeKy);
      -- set childTblName = getObjTypeTbl(lChildObjectTypeKy);



      insert into tmp_hierarchy 
      (breadcrumbIds, breadcrumb, childId, parentId, childParent, tableNm, typeId, parentNm, depth, oltid, typeName, linkTypeName, oilid, typeCategory) 
      values 
      (concat(lObjectInstanceLinkId, '>>' ,lChildObjectTypeKy), childName, lChildObjectTypeKy, parentObjTypeId, parentObjTypeId, childTblName, lChildObjectTypeKy, parentTblName, ipdepth, lObjectInstanceLinkId, childName, lObjectLinkTypeNm, null, typeCategory);

      SELECT @@IDENTITY into myRecordId;

      select count(*) into countOfChildRecords
      from object_link_type olt
      where olt.src_object_type_ky = parentObjTypeId;

      -- check to see if the related records are leifs
      -- and lObjectInstanceLinkId <> parentObjLnkTypeId 
      IF countOfChildRecords > 0 and (parentObjLnkTypeId is null or lObjectInstanceLinkId <> parentObjLnkTypeId) THEN
        -- if not leaf, recurse down the child.
        
        if (ipdepth <= maxdepth OR maxdepth = 0) then 
            call getAllDescendentsTmpTbl(lChildObjectTypeKy, lObjectInstanceLinkId,  false, ipdepth+1, maxdepth, loginid);
        end if;
        
        update tmp_hierarchy
        set breadcrumb = concat(childName, '->', breadcrumb) ,
            breadcrumbIds = concat(lObjectInstanceLinkId,'>>',lChildObjectTypeKy ,'->', breadcrumbIds) ,
            parentId = parentObjTypeId
        where parentId = lChildObjectTypeKy and 
        recordId > myRecordId              
        ;
      END IF;

  end loop;

  if (firstCall) then

    update tmp_hierarchy
    set breadcrumb = concat(parentName, '->', breadcrumb), 
    breadcrumbIds = concat(parentObjTypeId, '->', breadcrumbIds)
    where parentId = parentObjTypeId;

    -- select * from tmp_hierarchy;
    -- drop table tmp_hierarchy;
  end if;
  
  end main;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getAllDescInstances` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getAllDescInstances`(
parentObjId int, 
ipdepthlimit int, 
loginId int,
personalityId int, 
byTypeId int
-- ,
-- firstcall boolean
)
BEGIN
    call getAllDescInstancesTmpTbl(parentObjId, true, 1, ipdepthlimit, loginId, byTypeId);
    if byTypeId is null then 
        select * from tmp_hierarchy order by recordId;
    else 
        select * from tmp_hierarchy where typeId = byTypeId order by recordId;
    end if;
    drop table tmp_hierarchy;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getAllDescInstancesTmpTbl` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getAllDescInstancesTmpTbl`(
parentObjId int,
firstcall boolean,
ipdepth int, 
ipdepthlimit int, 
loginid int, 
byTypeId int
)
BEGIN

  DECLARE lChildObjectKy int;
  DECLARE lObjectLinkTypeId int;
  DECLARE lObjectInstanceLinkId int;
  DECLARE lObjectLinkTypeNm varchar(255)  CHARSET utf8;
  DECLARE lChildObjectTypeKy int;
  DECLARE countOfChildRecords int;
  
  DECLARE isFile tinyint(1);

  DECLARE childName varchar(255)  CHARSET utf8;
  DECLARE childTypeName varchar(255)  CHARSET utf8;
  DECLARE parentName varchar(255)  CHARSET utf8;
  DECLARE parentTypeId int ;
  DECLARE typeCategory int;
  DECLARE parentTypeName varchar(255)  CHARSET utf8;
  DECLARE chldOwnerKy int;
  DECLARE prntOwnerKy int;
  DECLARE chldOwnerNm varchar(255)  CHARSET utf8;
  DECLARE whenUpdatedTs TIMESTAMP ;
  
  DECLARE myRecordId int;

  -- DECLARE ontheflysql varchar(255);

  DECLARE done INT DEFAULT 0;


  DECLARE lRelObjCur CURSOR FOR
  select dest_object_ky, olt.dest_object_type_ky, olt.object_link_type_ky, destot.name_nm, 
  olt.object_link_type_nm, oil.object_inst_link_ky, destot.object_type_category_ky, destoi.owner_ky chldOwner, srcoi.owner_ky, destoi.name_nm, 
  chldowneroi.name_nm chldOwnerNm, oil.when_updated
  from object_link_type olt, object_instance_link oil, object_type destot, object_instance srcoi, object_instance destoi, object_instance chldowneroi
  where
  oil.src_object_ky = parentObjId and
  oil.object_link_type_ky = olt.object_link_type_ky and 
  destot.object_type_ky = olt.dest_object_type_ky and
  destoi.object_ky = oil.dest_object_ky and
  srcoi.object_ky = oil.src_object_ky and
  destoi.owner_ky = chldowneroi.object_ky
  and
  oil.isDeleted <> 1
  and 
  (
      olt.src_object_type_ky not in (select value from personality_types) 
      or
      (
        olt.src_object_type_ky in (select value from personality_types) and 
        src_object_ky in (-- my login   
                          select loginid
                          union
                          -- my personalities
                          select personality_id from 
                          loginPersonalities where login_id = loginid
                          union
                          -- my friends personalities
                          select dest_frnd_personality 
                          from loginFriends where login_id = loginid
                          )
      )
  )

  ;
  


  DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;


  create temporary table if not exists tmp_hierarchy (
    breadcrumbIds varchar(255)  CHARSET utf8,
    breadcrumb varchar(255)  CHARSET utf8,
    recordId int(10) unsigned not null AUTO_INCREMENT,
    parentId int(10),
    childParent int(10),
    childId int(10),
    typeId int(10),
    tableNm varchar(255)  CHARSET utf8,
    parentNm varchar(255)  CHARSET utf8,
    depth int,
    oltid int,
    typeName varchar(255)  CHARSET utf8,    
    linkTypeName varchar(255)  CHARSET utf8,
    oilid int,
    typeCategory int(10),
    chldOwnerKy int(10),
    prntOwnerKy int(10),
    chldOwnerNm varchar(255)  CHARSET utf8,
    whenUpdated TIMESTAMP DEFAULT 0,
    

   PRIMARY KEY (`recordId`)
  )
 ;

  set @@max_sp_recursion_depth=200;


  set parentName = getObjInstName(parentObjId);

main: begin
  

  if (firstCall) then
    
    -- set parentTypeId = getObjInstanceTypeId(parentObjId);
    -- set parentTypeName = getObjInstanceTypeNm(parentObjId);
    
    select ot.name_nm, ot.object_type_ky, oi.owner_ky, ot.object_type_category_ky, owneroi.name_nm, oi.when_updated 
    into parentTypeName, parentTypeId, chldOwnerKy, typeCategory, chldOwnerNm, whenUpdatedTs
    from object_type ot , object_instance oi , object_instance owneroi 
    where
    oi.object_ky = parentObjId and
    oi.object_type_ky  = ot.object_Type_ky and
    oi.owner_ky = owneroi.object_ky;
    
    insert into tmp_hierarchy (
        breadcrumbIds, breadcrumb, childId, parentId, typeId, depth, oltid, typeName, linkTypeName, oilid, typeCategory, 
        chldOwnerKy, prntOwnerKy, chldOwnerNm, whenUpdated
    ) values ( 
        parentObjId, parentName, parentObjId, 0, parentTypeId, ipdepth, null, parentTypeName , null, null, typeCategory, 
        chldOwnerKy, prntOwnerKy, chldOwnerNm, whenUpdatedTs
    );
    set ipdepth = ipdepth + 1;
    if ipdepth > ipdepthlimit and ipdepthlimit <> 0 then 
      leave main   ;
    end if;
        
  end if;

    OPEN lRelObjCur;


  -- loop through the children
  read_loop: LOOP

      fetch lRelObjCur into lChildObjectKy, lChildObjectTypeKy, lObjectLinkTypeId, childTypeName, lObjectLinkTypeNm, lObjectInstanceLinkId, typeCategory, chldOwnerKy, prntOwnerKy, childName, chldOwnerNm, whenUpdatedTs;


      IF done THEN
        LEAVE read_loop;
      END IF;

      -- set childName = getObjInstName(lChildObjectKy);

      insert into tmp_hierarchy (breadcrumbIds, breadcrumb, childId, typeId, parentId, childParent, parentNm, depth, oltid, typeName, linkTypeName, oilid, typeCategory, chldOwnerKy, prntOwnerKy, chldOwnerNm, whenUpdated) values ( lChildObjectKy, childName, lChildObjectKy, lChildObjectTypeKy, parentObjId, parentObjId, parentName, ipdepth, lObjectLinkTypeId, childTypeName, lObjectLinkTypeNm, lObjectInstanceLinkId, typeCategory, chldOwnerKy, prntOwnerKy, chldOwnerNm, whenUpdatedTs);

      SELECT @@IDENTITY into myRecordId;

      select count(*) into countOfChildRecords
      from object_link_type olt, object_instance_link oil
      where oil.src_object_ky = parentObjId and
            oil.object_link_type_ky = olt.object_link_type_ky
            ;

      -- check to see if the related records are leifs
      IF countOfChildRecords > 0 and lChildObjectKy <> parentObjId THEN
        -- if not leaf, recurse down the child.
        
        if (ipdepthlimit = 0 OR ipdepthlimit > ipdepth) then             
            call getAllDescInstancesTmpTbl(lChildObjectKy, false, ipdepth+1, ipdepthlimit, loginid, byTypeId);            
        end if;
        
        update tmp_hierarchy
        set breadcrumb = concat(childName, '->', breadcrumb) ,
            breadcrumbIds =  concat(lChildObjectKy, '->', breadcrumbIds), 
            parentId = parentObjId
        where parentId = lChildObjectKy and 
        recordId > myRecordId              
        ;
        
      END IF;

  end loop;

  if (firstCall) then

    update tmp_hierarchy
    set breadcrumb = concat(parentName, '->', breadcrumb),
        breadcrumbIds =  concat(parentObjId, '->', breadcrumbIds)
    where parentId = parentObjId;

    -- select * from tmp_hierarchy;
    -- drop table tmp_hierarchy;
  end if;
  
  end main;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getAllObjectTypes` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getAllObjectTypes`()
BEGIN
  select name_nm as name ,
      object_type_ky as value, table_nm as table_nm  from object_type;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getCategoryTypes` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getCategoryTypes`(
catKy int -- ,
-- firstcall boolean
)
BEGIN
    select * from object_type ot where ot.object_type_category_ky = catKy;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getExistRelTblOfObj` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getExistRelTblOfObj`(
  ip_object_ky INT
)
BEGIN

  select  srcot.table_nm src_object_table, destot.table_nm dest_object_table,
          olt.table_nm link_table, olt.object_link_type_nm
  from object_link_type olt,
       object_instance oisrc,
       object_type destot,
       object_type srcot,
       object_instance oidest,
       object_instance_link oil
  where oisrc.object_ky = ip_object_ky and
        oisrc.object_type_ky = olt.src_object_type_ky and
        olt.src_object_type_ky = srcot.object_type_ky and
        olt.dest_object_type_ky = destot.object_type_ky and
        oidest.object_ky = oil.dest_object_ky and
        oisrc.object_ky = oil.src_object_ky and
        olt.object_link_type_ky = oil.object_link_type_ky
     ;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getFeedByUserPersonality` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getFeedByUserPersonality`(
loginId int(11),
personalityId int(11)
)
BEGIN

    select * 
    from feedwithprofilefriendsapproved 
    where feed_login_id = loginId and
    feed_personality = personalityId
    order by oil_when_updated desc;
    
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getFeedWithProfiles` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getFeedWithProfiles`(
    pending boolean
)
BEGIN

    call cacheGen();

    if (not pending)  then 
            select object_inst_link_ky, concat(
                '', linkOwnerName,  ' added a ', lcase(childTypeName), ' record named ' , chldName, ' owned by ', 
                childOwnerName ,' as ' , object_link_type_nm, ' to a ' , lcase(parentTypeName), ' record named ' , 
                prntName ,  ' owned by ', parentOwnerName, ' and located under ' , oiProfile.name_nm,  '''s profile '    
                
            )       
                
            from cache_obj_profile tt, object_instance oiProfile, approvedfeed f 
            where 
            tt.profile_obj_ky = oiProfile.object_ky and 
            f.src_object_ky = tt.instance_obj_ky
            order by object_inst_link_ky desc;
    else 
        select object_inst_link_ky, concat(
            '', linkOwnerName,  ' added a ', lcase(childTypeName), ' record named ' , chldName, ' owned by ', 
            childOwnerName ,' as ' , object_link_type_nm, ' to a ' , lcase(parentTypeName), ' record named ' , 
            prntName ,  ' owned by ', parentOwnerName, ' and located under ' , oiProfile.name_nm,  '''s profile ',   
            
            CASE  srcApproved 
            WHEN 1 THEN
                CASE destApproved
                    WHEN 1 then ''
                ELSE 
                    ' but '
                END
            ELSE ' but '
            END, 
            
            CASE srcApproved 
                WHEN 0 THEN
                    concat (parentOwnerName , ' needs to approve it')         
            ELSE ''
            END,
            
            CASE  srcApproved 
            WHEN 0 THEN
                CASE destApproved
                    WHEN 0 then ' and '
                ELSE 
                    '.'
                END
            ELSE 
                CASE destApproved
                    WHEN 0 then ''
                ELSE 
                    '.'
                END
            END
            
            ,CASE destApproved 
                WHEN 0 THEN
                    concat (childOwnerName , ' needs to approve it.')         
            ELSE ''
            END
            
            
        )
           
            
        from cache_obj_profile tt, object_instance oiProfile, pendingfeed f 
        where 
        tt.profile_obj_ky = oiProfile.object_ky and 
        f.src_object_ky = tt.instance_obj_ky
        order by object_inst_link_ky desc;

    end if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getObjIdPrincipals` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getObjIdPrincipals`(
childObjId int
)
BEGIN


    call getObjIdPrincipalsTmpTbl(childObjId);
    select * from tmp_hierarchy th;
    drop table tmp_hierarchy;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getObjIdPrincipalsTmpTbl` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getObjIdPrincipalsTmpTbl`(
childObjId int
)
BEGIN
    declare closestParent int;
    declare identityRoot int;


    select getAppConfigVal('IDENTITY_ROOT') into identityRoot;

    call getAllAncesInstancesTmpTbl(childObjId, true, 1);

    delete from  tmp_hierarchy where typeid not in (
                         select olt.dest_object_type_ky
                         from object_link_type olt
                         where olt.src_object_type_ky = identityRoot
                         );

    select min(depth) into closestParent
    from tmp_hierarchy th;


    delete from tmp_hierarchy where depth > closestParent;

    -- select * from tmp_hierarchy th;

    -- drop table tmp_hierarchy;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getObjInstAllowedActivities` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getObjInstAllowedActivities`(
ipCurrentIdentity int,
ipObjectInstanceId int -- ,
-- destObjectId int
)
BEGIN

  declare ownerId int(11);
  declare lvTypeId int(11);

  select getObjInstanceTypeId(ipObjectInstanceId) into lvTypeId;



  call getObjIdPrincipalsTmpTbl(ipObjectInstanceId);

  select distinct destOt.name_nm name_nm, destOt.object_type_ky id , destOt.table_nm
  from
  Object_link_type olt, object_Type destOt -- , tmp_hierarchy
  where olt.src_object_type_ky = lvTypeId and
  destOt.object_type_ky = olt.dest_object_type_ky and
  (
    (
      olt.permCreatorW = 1 and (currentIdentity = getObjectLinkOwnerId(ipTypeId, destOt.type_id ))
    ) or
    (
      olt.permPrntW = 1 and (currentIdentity in (select childId from tmp_hierarchy))
    )/* or
    (
      olt.permPrntFrndsW = 1 and currentIdentity in
    )*/
  );


END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getObjInstColumnInfo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `getObjInstColumnInfo`(
  instId int(11)
)
BEGIN

    DECLARE typeId int(11);
    
    SET typeId = getObjInstanceTypeId(instId);
    
    call getObjTypeColumnInfo(typeId);
    

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getObjInstLinkKy` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getObjInstLinkKy`(
  IN ipSrcObjectKy int(11),
  IN ipDestObjectKy int(11),
  out lvResult int(11)
)
BEGIN


--  declare exit handler for not found rollback;
--  declare exit handler for sqlexception rollback;
--  declare exit handler for sqlwarning rollback;

--  start transaction;

-- declare lvResult int(11);

                -- 1) First check to see if association is allowed:

                select object_inst_link_ky into lvResult
                from object_instance_link 
                where src_object_ky =  ipSrcObjectKy and 
                dest_object_ky = ipDestObjectKy;
              
--  commit;

                -- return lvResult;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getObjInstLnkDetails` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `getObjInstLnkDetails`(
    IN objInstLnkId VARCHAR(255) charset utf8
)
BEGIN

    select     
        chldOT.table_nm   childTblName,
        chldOT.name_nm   childTypeName,
        chldOT.object_type_ky   childTypeId,
        chldOI.name_nm   childName,
        chldOI.object_ky   childId,
        prntOT.table_nm   parentTblName,
        prntOT.name_nm  parentTypeName,         
        prntOT.object_type_ky  parentTypeid,
        prntOI.name_nm   parentName,
        prntOI.object_ky   parentId,
        olt.object_link_type_nm   linkTypeName,
        olt.table_nm   linkTblName,
        olt.object_link_type_ky   linkTypeId,
        oil.object_inst_link_ky  instanceLinkId,

        olt.permCreatorR,
        olt.permCreaFrndsR,
        olt.permCreaPrivFrndsR,
        olt.permCreaRestFrndsR,
        olt.permPrntR,
        olt.permPrntFrndsR,
        olt.permPrntPrivFrndsR,
        olt.permPrntRestFrndsR,
        olt.allowChldCreation,
        olt.allowChldLink,
        olt.allowMultiChld,
        olt.permCreatorW,
        olt.permCreaFrndsW,
        olt.permCreaPrivFrndsW,
        olt.permCreaRestFrndsW,
        olt.permPrntW,
        olt.permPrntFrndsW,
        olt.permPrntPrivFrndsW,
        olt.permPrntRestFrndsW,
        olt.permCreatorD,
        olt.permCreaFrndsD,
        olt.permCreaPrivFrndsD,
        olt.permCreaRestFrndsD,
        olt.permPrntD,
        olt.permPrntFrndsD,
        olt.permPrntPrivFrndsD,
        olt.permPrntRestFrndsD,
        
        olt.childApprovalRequired, 
        olt.parentApprovalRequired, 
        
        olt.createRecipUponApproval,
        
        prntOT.object_type_category_ky parentCategoryId, 
        chldOT.object_type_category_ky childCategoryId, 
        
        potc.object_type_category_desc parentCategory, 
        cotc.object_type_category_desc childCategory, 
        
        prntOI.owner_ky parentOwner, 
        chldOI.owner_ky childOwner,
        
        oil.srcApproved parentApproved, 
        oil.destApproved childApproved


    from 
         object_instance chldOI, 
         object_instance prntOI, 
         object_type chldOT, 
         object_type prntOT, 
         object_instance_link oil, 
         object_link_type olt, 
         object_type_category potc, 
         object_type_category cotc
    
    where 
        oil.object_inst_link_ky = objInstLnkId and
        oil.src_object_ky = prntOI.object_ky and
        oil.dest_object_ky = chldOI.object_ky and
        chldOI.object_type_ky = chldOT.object_type_ky and
        prntOI.object_type_ky = prntOT.object_type_ky and
        oil.object_link_type_ky = olt.object_link_type_ky and 
        prntOT.object_type_category_ky = potc.object_type_category_ky and 
        chldOT.object_type_category_ky = cotc.object_type_category_ky
        
        ;
    
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getObjInstUniqueDetails` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `getObjInstUniqueDetails`(
IN objInstId int(11)
)
BEGIN
    DECLARE uniqueTable varchar(255);

    select * from uniqueTable;

    SET @sql = concat('select * from ', @uniqueTable );

    PREPARE stmt FROM @sql;
    EXECUTE stmt;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getObjLnkTypeByKy` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `getObjLnkTypeByKy`(
    IN ip_object_link_type_ky INT(10)
)
BEGIN

    select olt.*, otsrc.name_nm src_name, otdest.name_nm dest_name, otsrc.object_type_category_ky parent_category, otdest.object_type_category_ky child_category
    from object_link_type olt , object_type otsrc, object_type otdest
    where 
    olt.object_link_type_ky = ip_object_link_type_ky and
    olt.src_object_type_ky = otsrc.object_type_ky and 
    olt.dest_object_type_ky = otdest.object_type_ky
    
    ;
    

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getObjTypeColumnInfo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `getObjTypeColumnInfo`(
  ipTypeId int(11)
)
BEGIN

    DECLARE tableName varchar(255);
    
    
    SET @tableName = getObjTypeTbl(ipTypeId);
    
    
    
    SET @sql = concat('show columns in ', @tableName);
    


PREPARE stmt FROM @sql;
EXECUTE stmt;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getParentUserIds` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getParentUserIds`(
childObjId int -- ,
-- firstcall boolean
)
BEGIN
    call getAllAncesInstancesTmpTbl(childObjId, true, 1, 5, false, true, 0, childObjId);
    select childId from tmp_hierarchy;
    drop table tmp_hierarchy;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getParentUserIdsTmpTbl` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getParentUserIdsTmpTbl`(
childObjId int -- ,
-- firstcall boolean
)
BEGIN
    call getAllAncesInstancesTmpTbl(childObjId, true, 1, 6, false, true, 0, childObjId);
    -- select childId from tmp_hierarchy;
    -- drop table tmp_hierarchy;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getRelationWithTables` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getRelationWithTables`(
  srctbl varchar(50),
  desttbl varchar(50),
  lnktbl varchar(50)

)
BEGIN


SET @srctbl = srctbl;
SET @desttbl = desttbl;
SET @lnktbl = lnktbl;

SET @sql = concat(
'
select *
from ',
      @srctbl, ' src, ' ,
      @desttbl , ' dest, ' ,
      @lnktbl ,'  lnkchld,
object_instance_link lnkmstr
where
      lnkmstr.object_inst_link_ky = lnkchld.object_inst_link_ky and
      lnkmstr.src_object_ky = src.object_ky and
      lnkmstr.dest_object_ky = dest.object_ky
'
);

PREPARE stmt FROM @sql;
EXECUTE stmt;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getRelTblOfObj` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getRelTblOfObj`(
  ip_object_ky INT
)
BEGIN

  select  srcot.table_nm src_object_table, destot.table_nm dest_object_table,
          olt.table_nm link_table, olt.object_link_type_nm
  from object_link_type olt,
       object_instance oi,
       object_type destot,
       object_type srcot
  where oi.object_ky = ip_object_ky and
        oi.object_type_ky = olt.src_object_type_ky and
        olt.src_object_type_ky = srcot.object_type_ky and
        olt.dest_object_type_ky = destot.object_type_ky
     ;





END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getRequests` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getRequests`(
    ipLoginId int(11), 
    ipPersonalityId int(11)
)
BEGIN
        select * from feedwithprofile f 
        where 
        (srcApproved = 0 and 
            (
                prntOwnerKy in (select personality_id from loginpersonalities lp where lp.login_id =ipLoginId) or
                prntOwnerKy = ipLoginId
            )
        )
        or 
        (destApproved = 0 and 
            (
                 chldOwnerKy in (select personality_id from loginpersonalities lp where lp.login_id =ipLoginId) or
                 chldOwnerKy = ipLoginId
            ) 
        );
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getTypeInstances` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `getTypeInstances`(
IN ipObjTypeId int(11)
)
BEGIN

    DECLARE objTypeTable VARCHAR(255);
    
    SET objTypeTable = getObjTypeTbl(ipObjTypeId);
    
    SET @objTypeTable = objTypeTable;
    SET @ipObjTypeId = ipObjTypeId;
   
 
    
    
    SET @sql = concat(
    '
    select ot.table_nm,
    ot.schema_nm,
    ot.object_type_ky,
    ot.name_nm objTypeNm, 
    ott.*, 
    oi.name_nm objInstNm,
    oi.owner_ky
    from object_type ot, ',
    @objTypeTable, ' ott , 
    object_instance oi
    where ot.object_type_ky = ', @ipObjTypeId , 
    ' and oi.object_type_ky = ot.object_type_ky 
      and oi.object_ky = ott.object_ky'
    );
    
    
    PREPARE stmt FROM @sql;
    EXECUTE stmt;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getTypeSubtypes` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getTypeSubtypes`(
  ipTypeId int(11)
)
BEGIN
  select olt.object_link_type_ky , destOt.name_nm name_nm, destOt.object_type_ky id ,
  destOt.table_nm , olt.allowMultiChld, olt.allowChldCreation,
  olt.allowChldLink, destOt.object_type_category_ky, olt.object_link_type_nm, olt.createText createText
  from
  Object_link_type olt, object_Type destOt
  where olt.src_object_type_ky = ipTypeId and
  destOt.object_type_ky = olt.dest_object_type_ky;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getUserPersonalities` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getUserPersonalities`(
userId int(11)
)
BEGIN

    select personality_id personality_id, oi.name_nm personality_name, oi.object_type_ky, object_inst_link_ky
    from loginpersonalities lp, object_instance oi    
    where lp.login_id = userID and 
    oi.object_ky = lp.personality_id;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `hasFileColumn` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `hasFileColumn`(
  ipTypeId int(11)
)
BEGIN

    DECLARE tableName varchar(255);
    
    SET tableName = getObjTypeTbl(ipTypeId);
    
    show columns in `tableName`;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `loginPwExistsV2` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `loginPwExistsV2`(

ip_login varchar(255),

ip_password varchar(255)

)
BEGIN



  DECLARE notFound INT DEFAULT 0;

  DECLARE CONTINUE HANDLER FOR NOT FOUND SET notFound = 1;


  select object_ky into @objectId
  from obj_login ol
  where upper(ol.login) = upper(ip_login) and 
        ol.password = ip_password
  ;


  if not notFound then

    select oil.dest_object_ky into @personalityId
    from object_instance_link oil, object_link_type olt 
    where 
    oil.object_link_type_ky = olt.object_link_type_ky and
    src_object_ky = @objectId and 
    oil.object_inst_link_ky = 
        (select min(object_inst_link_ky) 
        from object_instance_link oil2 where 
        oil2.src_object_ky = @objectId
        )
    ;
    
    if notFound then
        select @objectId userId, null personalityId;
    else 
        select @objectId userId, @personalityId personalityId;
    end if;
        

  end if;

   


END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `tmpTableToCache` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `tmpTableToCache`()
BEGIN

/*
     DECLARE holdingProfiles  CURSOR FOR 
     select rootId, childParent from tmp_hierarchy
     group by rootId, childParent;
*/     

    insert into cache_obj_profile (profile_obj_ky, instance_obj_ky) 
    select childParent, rootId 
    from tmp_hierarchy 
    where     
    (childParent, rootId) not in 
    (select profile_obj_ky, instance_obj_ky 
    from cache_obj_profile)
    and childParent is not null
    and rootId is not null
    group by childParent, rootId;
    
    
    
    /*
    OPEN holdingProfiles;
    
    set loopedTimes = 0;
    read_loop: LOOP            
            fetch holdingProfiles into rootId, childParent; 
            
            
            IF done THEN
                LEAVE read_loop;
            END IF;
            
            -- set loopedTimes = loopedTimes + 1;
            
            select count(*) into foundRecords 
            from cache_obj_profile 
            where 
            (childParent is not null and             
            profile_obj_ky = childParent ) and            
            (rootId is not null and 
            instance_obj_ky = rootID); 
            
            -- select count(*) into loopedTimes from tmp_hierarchy;
            
            if foundRecords = 0 then
                 -- set loopedTimes = loopedTimes + 1;     
                if (childParent is not NULL and rootId is not NULL ) then 
                     set loopedTimes = loopedTimes + 1;      
                    select rootId, childParent;
                    
                    insert into cache_obj_profile (profile_obj_ky, instance_obj_ky) values (childParent, rootId); -- (childParent, rootId);
                end if;
            end if;            
    end loop;
    */
    
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `updObjInstLnk` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `updObjInstLnk`()
BEGIN

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `upSertObjLnkType` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `upSertObjLnkType`(
IN ipObjLnkTypeKy int(11),
IN ipSrcObjTypeKy int(11),
IN ipDestObjTypeKy int(11),
IN ipTableNm varchar(255),

IN ipChldCrtRd TINYINT(1),
IN ipChildCrtWr TINYINT(1),
IN ipChildCrtDel TINYINT(1),

IN ipFrndOfChldCrtRd TINYINT(1),
IN ipFrndOfChldCrtWr TINYINT(1),
IN ipFrndOfChldCrtDel TINYINT(1),

IN ipPrivFrndOfChldCrtRd TINYINT(1),
IN ipPrivFrndOfChldCrtWr TINYINT(1),
IN ipPrivFrndOfChldCrtDel TINYINT(1),

IN ipRestFrndOfChldCrtRd TINYINT(1),
IN ipRestFrndOfChldCrtWr TINYINT(1),
IN ipRestFrndOfChldCrtDel TINYINT(1),

IN ipParentsOfChldRecRd TINYINT(1),
IN ipParentsOfChldRecWr TINYINT(1),
IN ipParentsOfChldRecDel TINYINT(1),

IN ipFrndOfPrntsOfChldRecRd TINYINT(1),
IN ipFrndOfPrntsOfChldRecWr TINYINT(1),
IN ipFrndOfPrntsOfChldRecDel TINYINT(1),

IN ipPrivFrndOfPrntsOfChldRecRd TINYINT(1),
IN ipPrivFrndOfPrntsOfChldRecWr TINYINT(1),
IN ipPrivFrndOfPrntsOfChldRecDel TINYINT(1),

IN ipRestFrndOfPrntsOfChldRecRd TINYINT(1),
IN ipRestFrndOfPrntsOfChldRecWr TINYINT(1),
IN ipRestFrndOfPrntsOfChldRecDel TINYINT(1),

IN ipAllowChldCreate TINYINT(1),
IN ipAllowChldLink TINYINT(1),

IN ipForceSingleChild TINYINT(1),

IN ipChildApprovalRequired TINYINT(1),
IN ipParentApprovalRequired TINYINT(1),

IN ipObjLnkTypeNm varchar(255),

IN ipCreateRecip TINYINT(1),
in ipCreateText varchar(255),

OUT opObjLnkTypeId int(11)

)
BEGIN

  -- declare result varchar(255);

  declare  lvSrcName varchar(255);
  declare  lvDestName varchar(255);
  declare  lvObjLnkTypeNm varchar(255);

  set lvSrcName = getObjTypeTbl(ipSrcObjTypeKy) ;
  set lvDestName = getObjTypeTbl(ipDestObjTypeKy);
  -- set lvObjLnkTypeNm = concat (lvSrcName, ' to ', lvDestName);

  -- select concat (lvSrcName, ' to ', lvDestName) into @gvObjLnkTypeNm;
 
  if ipObjLnkTypeKy = 0 then 
        insert into object_link_type (
                        src_object_type_ky,
                        dest_object_type_ky,
                        object_link_type_nm,
                        table_nm,
                        -- Read block
                        permCreatorR,
                        permCreaFrndsR,
                        permCreaPrivFrndsR,
                        permCreaRestFrndsR,
                        permPrntR,
                        permPrntFrndsR,
                        permPrntPrivFrndsR,
                        permPrntRestFrndsR,

                        -- Write block
                        permCreatorW,
                        permCreaFrndsW,
                        permCreaPrivFrndsW,
                        permCreaRestFrndsW,
                        permPrntW,
                        permPrntFrndsW,
                        permPrntPrivFrndsW,
                        permPrntRestFrndsW,

                        -- Delete block
                        permCreatorD,
                        permCreaFrndsD,
                        permCreaPrivFrndsD,
                        permCreaRestFrndsD,
                        permPrntD,
                        permPrntFrndsD,
                        permPrntPrivFrndsD,
                        permPrntRestFrndsD,

                        allowChldCreation,
                        allowChldLink,
                        allowMultiChld, 
                        
                        parentApprovalRequired,
                        childApprovalRequired, 
                        
                        createRecipUponApproval, 
                        
                        createText
                        
                        
                        
              )
              values (ipSrcObjTypeKy,
                      ipDestObjTypeKy,
                      ipObjLnkTypeNm,
                      ipTableNm,

                    -- Read block
                    ipChldCrtRd,
                    ipFrndOfChldCrtRd,
                    ipPrivFrndOfChldCrtRd,
                    ipRestFrndOfChldCrtRd,
                    ipParentsOfChldRecRd,
                    ipFrndOfPrntsOfChldRecRd,
                    ipPrivFrndOfPrntsOfChldRecRd,
                    ipRestFrndOfPrntsOfChldRecRd,

                    -- Write block
                    ipChildCrtWr,
                    ipFrndOfChldCrtWr,
                    ipPrivFrndOfChldCrtWr,
                    ipRestFrndOfChldCrtWr,
                    ipParentsOfChldRecWr,
                    ipFrndOfPrntsOfChldRecWr,
                    ipPrivFrndOfPrntsOfChldRecWr,
                    ipRestFrndOfPrntsOfChldRecWr,

                    -- Delete block
                    ipChildCrtDel,
                    ipFrndOfChldCrtDel,
                    ipPrivFrndOfChldCrtDel,
                    ipRestFrndOfChldCrtDel,
                    ipParentsOfChldRecDel,
                    ipFrndOfPrntsOfChldRecDel,
                    ipPrivFrndOfPrntsOfChldRecDel,
                    ipRestFrndOfPrntsOfChldRecDel,

                    ipAllowChldCreate,
                    ipAllowChldLink,

                    ipForceSingleChild,
                    
                    ipParentApprovalRequired,
                    ipChildApprovalRequired, 
                    
                    ipCreateRecip, 
                    ipCreateText

              );

        set opObjLnkTypeId = LAST_INSERT_ID();

        --
        -- create table
        -- DROP TABLE IF EXISTS `hierarchy_cm`.`obj_car`;

        if not ipTableNm is null AND ipTableNm <> '' then
            set @onFlySql = Concat( 'CREATE TABLE  `', ip_schema_nm, '`.`', ipTableNm,
                        '` (
                        `object_inst_link_ky` int(10) unsigned NOT NULL,
                        `relation_notes` varchar(45) NOT NULL,
                        PRIMARY KEY (`object_inst_link_ky`) USING BTREE,
                        CONSTRAINT `FK_objlnk_person_person_oilk` FOREIGN KEY (`object_inst_link_ky`) REFERENCES `object_instance_link` (`object_inst_link_ky`)
                        ) ENGINE=InnoDB DEFAULT CHARSET=latin1;'
                        );

            PREPARE createStatement FROM @onFlySql;

            EXECUTE createStatement;

            DEALLOCATE PREPARE createStatement;

            /*
            CREATE TABLE  ip_schema_nm.ip_table_nm  ( -- ip_schema_nm.ip_table_nm
            `object_ky` int(10) unsigned NOT NULL AUTO_INCREMENT,
            PRIMARY KEY (`object_ky`),
            CONSTRAINT `FK_obj_car_obj_ky` FOREIGN KEY (`object_ky`) REFERENCES `object_instance` (`object_ky`)
          ) ENGINE=InnoDB DEFAULT CHARSET=latin1;
            */

        end if;
    
    else
    
           
            
              update object_link_type
              
              set  src_object_type_ky =ipSrcObjTypeKy,
                        dest_object_type_ky=ipDestObjTypeKy,
                        object_link_type_nm=ipObjLnkTypeNm,
                        table_nm=ipTableNm,
                        -- Read block
                        permCreatorR=ipChldCrtRd,
                        permCreaFrndsR=ipFrndOfChldCrtRd,
                        permCreaPrivFrndsR=ipPrivFrndOfChldCrtRd,
                        permCreaRestFrndsR=ipRestFrndOfChldCrtRd,
                        permPrntR=ipParentsOfChldRecRd,
                        permPrntFrndsR=ipFrndOfPrntsOfChldRecRd,
                        permPrntPrivFrndsR=ipPrivFrndOfPrntsOfChldRecRd,
                        permPrntRestFrndsR=ipRestFrndOfPrntsOfChldRecRd,

                        -- Write block
                        permCreatorW=ipChildCrtWr,
                        permCreaFrndsW=ipFrndOfChldCrtWr,
                        permCreaPrivFrndsW=ipPrivFrndOfChldCrtWr,
                        permCreaRestFrndsW=ipRestFrndOfChldCrtWr,
                        permPrntW=ipParentsOfChldRecWr,
                        permPrntFrndsW=ipFrndOfPrntsOfChldRecWr,
                        permPrntPrivFrndsW=ipPrivFrndOfPrntsOfChldRecWr,
                        permPrntRestFrndsW=ipRestFrndOfPrntsOfChldRecWr,

                        -- Delete block
                        permCreatorD=ipChildCrtDel,
                        permCreaFrndsD=ipFrndOfChldCrtDel,
                        permCreaPrivFrndsD=ipPrivFrndOfChldCrtDel,
                        permCreaRestFrndsD=ipRestFrndOfChldCrtDel,
                        permPrntD=ipParentsOfChldRecDel,
                        permPrntFrndsD=ipFrndOfPrntsOfChldRecDel,
                        permPrntPrivFrndsD=ipPrivFrndOfPrntsOfChldRecDel,
                        permPrntRestFrndsD=ipRestFrndOfPrntsOfChldRecDel,

                        allowChldCreation=ipAllowChldCreate,
                        allowChldLink=ipAllowChldLink,
                        allowMultiChld=ipForceSingleChild,
                                                
                        childApprovalRequired = ipChildApprovalRequired,
                        parentApprovalRequired = ipParentApprovalRequired, 
                        
                        createRecipUponApproval = ipCreateRecip, 
                        createText = ipCreateText
                        
              where object_link_type_ky = ipObjLnkTypeKy;
              

    
    end if;

  -- return result;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `englishfeed`
--

/*!50001 DROP VIEW IF EXISTS `englishfeed`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb3 */;
/*!50001 SET character_set_results     = utf8mb3 */;
/*!50001 SET collation_connection      = utf8mb3_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `englishfeed` AS select concat('',`feed`.`linkOwnerName`,' added a ',lower(`feed`.`childTypeName`),' record named ',`feed`.`chldName`,' owned by ',`feed`.`childOwnerName`,' as ',`feed`.`object_link_type_nm`,' to a ',lower(`feed`.`parentTypeName`),' record named ',`feed`.`prntName`,' owned by ',`feed`.`parentOwnerName`) AS `Name_exp_1` from `feed` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `feed`
--

/*!50001 DROP VIEW IF EXISTS `feed`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb3 */;
/*!50001 SET character_set_results     = utf8mb3 */;
/*!50001 SET collation_connection      = utf8mb3_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `feed` AS select `oil`.`isDeleted` AS `oil_is_deleted`,`prntot`.`object_type_ky` AS `prnt_object_type_ky`,`chldot`.`object_type_ky` AS `chld_object_type_ky`,`prntowner`.`name_nm` AS `parentOwnerName`,`chldowner`.`name_nm` AS `childOwnerName`,`linkowner`.`name_nm` AS `linkOwnerName`,`prntot`.`name_nm` AS `parentTypeName`,`chldot`.`name_nm` AS `childTypeName`,`oil`.`src_object_ky` AS `src_object_ky`,`oil`.`dest_object_ky` AS `dest_object_ky`,`oil`.`object_link_type_ky` AS `object_link_type_ky`,`oil`.`object_inst_link_ky` AS `object_inst_link_ky`,`oil`.`owner_ky` AS `owner_ky`,`oil`.`srcApproved` AS `srcApproved`,`oil`.`destApproved` AS `destApproved`,`oil`.`when_updated` AS `oil_when_updated`,`oil`.`when_created` AS `oil_when_created`,`olt`.`object_link_type_nm` AS `object_link_type_nm`,`prnt`.`name_nm` AS `prntName`,`prnt`.`owner_ky` AS `prntOwnerKy`,`chld`.`when_updated` AS `chld_when_updated`,`prnt`.`when_updated` AS `prnt_when_updated`,`chld`.`when_created` AS `chld_when_created`,`prnt`.`when_created` AS `prnt_when_created`,`chld`.`name_nm` AS `chldName`,`chld`.`owner_ky` AS `chldOwnerKy` from ((((((((`object_instance_link` `oil` join `object_link_type` `olt`) join `object_instance` `prnt`) join `object_instance` `chld`) join `object_instance` `prntowner`) join `object_instance` `chldowner`) join `object_instance` `linkowner`) join `object_type` `prntot`) join `object_type` `chldot`) where ((`oil`.`dest_object_ky` = `chld`.`object_ky`) and (`oil`.`src_object_ky` = `prnt`.`object_ky`) and (`oil`.`object_link_type_ky` = `olt`.`object_link_type_ky`) and (`prntowner`.`object_ky` = `prnt`.`owner_ky`) and (`chldowner`.`object_ky` = `chld`.`owner_ky`) and (`linkowner`.`object_ky` = `oil`.`owner_ky`) and (`prntot`.`object_type_ky` = `olt`.`src_object_type_ky`) and (`chldot`.`object_type_ky` = `olt`.`dest_object_type_ky`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `feedwithprofile`
--

/*!50001 DROP VIEW IF EXISTS `feedwithprofile`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb3 */;
/*!50001 SET character_set_results     = utf8mb3 */;
/*!50001 SET collation_connection      = utf8mb3_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `feedwithprofile` AS select `f`.`oil_is_deleted` AS `oil_is_deleted`,`f`.`prnt_object_type_ky` AS `prnt_object_type_ky`,`f`.`chld_object_type_ky` AS `chld_object_type_ky`,`f`.`parentOwnerName` AS `parentOwnerName`,`f`.`childOwnerName` AS `childOwnerName`,`f`.`linkOwnerName` AS `linkOwnerName`,`f`.`parentTypeName` AS `parentTypeName`,`f`.`childTypeName` AS `childTypeName`,`f`.`src_object_ky` AS `src_object_ky`,`f`.`dest_object_ky` AS `dest_object_ky`,`f`.`object_link_type_ky` AS `object_link_type_ky`,`f`.`object_inst_link_ky` AS `object_inst_link_ky`,`f`.`owner_ky` AS `owner_ky`,`f`.`srcApproved` AS `srcApproved`,`f`.`destApproved` AS `destApproved`,`f`.`oil_when_updated` AS `oil_when_updated`,`f`.`oil_when_created` AS `oil_when_created`,`f`.`object_link_type_nm` AS `object_link_type_nm`,`f`.`prntName` AS `prntName`,`f`.`prntOwnerKy` AS `prntOwnerKy`,`f`.`chld_when_updated` AS `chld_when_updated`,`f`.`prnt_when_updated` AS `prnt_when_updated`,`f`.`chld_when_created` AS `chld_when_created`,`f`.`prnt_when_created` AS `prnt_when_created`,`f`.`chldName` AS `chldName`,`f`.`chldOwnerKy` AS `chldOwnerKy`,`cop`.`profile_obj_ky` AS `profile_obj_ky`,`oi`.`name_nm` AS `profile_nm` from ((`feed` `f` join `cache_obj_profile` `cop`) join `object_instance` `oi`) where ((`f`.`src_object_ky` = `cop`.`instance_obj_ky`) and (`cop`.`profile_obj_ky` = `oi`.`object_ky`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `feedwithprofilefriends`
--

/*!50001 DROP VIEW IF EXISTS `feedwithprofilefriends`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb3 */;
/*!50001 SET character_set_results     = utf8mb3 */;
/*!50001 SET collation_connection      = utf8mb3_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `feedwithprofilefriends` AS select `fwp`.`oil_is_deleted` AS `oil_is_deleted`,`fwp`.`prnt_object_type_ky` AS `prnt_object_type_ky`,`fwp`.`chld_object_type_ky` AS `chld_object_type_ky`,`fwp`.`parentOwnerName` AS `parentOwnerName`,`fwp`.`childOwnerName` AS `childOwnerName`,`fwp`.`linkOwnerName` AS `linkOwnerName`,`fwp`.`parentTypeName` AS `parentTypeName`,`fwp`.`childTypeName` AS `childTypeName`,`fwp`.`src_object_ky` AS `src_object_ky`,`fwp`.`dest_object_ky` AS `dest_object_ky`,`fwp`.`object_link_type_ky` AS `object_link_type_ky`,`fwp`.`object_inst_link_ky` AS `object_inst_link_ky`,`fwp`.`owner_ky` AS `owner_ky`,`fwp`.`srcApproved` AS `srcApproved`,`fwp`.`destApproved` AS `destApproved`,`fwp`.`oil_when_updated` AS `oil_when_updated`,`fwp`.`oil_when_created` AS `oil_when_created`,`fwp`.`object_link_type_nm` AS `object_link_type_nm`,`fwp`.`prntName` AS `prntName`,`fwp`.`prntOwnerKy` AS `prntOwnerKy`,`fwp`.`chld_when_updated` AS `chld_when_updated`,`fwp`.`prnt_when_updated` AS `prnt_when_updated`,`fwp`.`chld_when_created` AS `chld_when_created`,`fwp`.`prnt_when_created` AS `prnt_when_created`,`fwp`.`chldName` AS `chldName`,`fwp`.`chldOwnerKy` AS `chldOwnerKy`,`fwp`.`profile_obj_ky` AS `profile_obj_ky`,`fwp`.`profile_nm` AS `profile_nm`,`frnd`.`login_id` AS `feed_login_id`,`frnd`.`src_frnd_personality` AS `feed_personality` from (`feedwithprofile` `fwp` join `friends` `frnd`) where (`fwp`.`profile_obj_ky` = `frnd`.`dest_frnd_personality`) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `feedwithprofilefriendsapproved`
--

/*!50001 DROP VIEW IF EXISTS `feedwithprofilefriendsapproved`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb3 */;
/*!50001 SET character_set_results     = utf8mb3 */;
/*!50001 SET collation_connection      = utf8mb3_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `feedwithprofilefriendsapproved` AS select `feedwithprofilefriends`.`oil_is_deleted` AS `oil_is_deleted`,`feedwithprofilefriends`.`prnt_object_type_ky` AS `prnt_object_type_ky`,`feedwithprofilefriends`.`chld_object_type_ky` AS `chld_object_type_ky`,`feedwithprofilefriends`.`parentOwnerName` AS `parentOwnerName`,`feedwithprofilefriends`.`childOwnerName` AS `childOwnerName`,`feedwithprofilefriends`.`linkOwnerName` AS `linkOwnerName`,`feedwithprofilefriends`.`parentTypeName` AS `parentTypeName`,`feedwithprofilefriends`.`childTypeName` AS `childTypeName`,`feedwithprofilefriends`.`src_object_ky` AS `src_object_ky`,`feedwithprofilefriends`.`dest_object_ky` AS `dest_object_ky`,`feedwithprofilefriends`.`object_link_type_ky` AS `object_link_type_ky`,`feedwithprofilefriends`.`object_inst_link_ky` AS `object_inst_link_ky`,`feedwithprofilefriends`.`owner_ky` AS `owner_ky`,`feedwithprofilefriends`.`srcApproved` AS `srcApproved`,`feedwithprofilefriends`.`destApproved` AS `destApproved`,`feedwithprofilefriends`.`oil_when_updated` AS `oil_when_updated`,`feedwithprofilefriends`.`oil_when_created` AS `oil_when_created`,`feedwithprofilefriends`.`object_link_type_nm` AS `object_link_type_nm`,`feedwithprofilefriends`.`prntName` AS `prntName`,`feedwithprofilefriends`.`prntOwnerKy` AS `prntOwnerKy`,`feedwithprofilefriends`.`chld_when_updated` AS `chld_when_updated`,`feedwithprofilefriends`.`prnt_when_updated` AS `prnt_when_updated`,`feedwithprofilefriends`.`chld_when_created` AS `chld_when_created`,`feedwithprofilefriends`.`prnt_when_created` AS `prnt_when_created`,`feedwithprofilefriends`.`chldName` AS `chldName`,`feedwithprofilefriends`.`chldOwnerKy` AS `chldOwnerKy`,`feedwithprofilefriends`.`profile_obj_ky` AS `profile_obj_ky`,`feedwithprofilefriends`.`profile_nm` AS `profile_nm`,`feedwithprofilefriends`.`feed_login_id` AS `feed_login_id`,`feedwithprofilefriends`.`feed_personality` AS `feed_personality` from `feedwithprofilefriends` where ((`feedwithprofilefriends`.`srcApproved` = 1) and (`feedwithprofilefriends`.`destApproved` = 1)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `feedwithprofilefriendspending`
--

/*!50001 DROP VIEW IF EXISTS `feedwithprofilefriendspending`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb3 */;
/*!50001 SET character_set_results     = utf8mb3 */;
/*!50001 SET collation_connection      = utf8mb3_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `feedwithprofilefriendspending` AS select `feedwithprofilefriends`.`oil_is_deleted` AS `oil_is_deleted`,`feedwithprofilefriends`.`prnt_object_type_ky` AS `prnt_object_type_ky`,`feedwithprofilefriends`.`chld_object_type_ky` AS `chld_object_type_ky`,`feedwithprofilefriends`.`parentOwnerName` AS `parentOwnerName`,`feedwithprofilefriends`.`childOwnerName` AS `childOwnerName`,`feedwithprofilefriends`.`linkOwnerName` AS `linkOwnerName`,`feedwithprofilefriends`.`parentTypeName` AS `parentTypeName`,`feedwithprofilefriends`.`childTypeName` AS `childTypeName`,`feedwithprofilefriends`.`src_object_ky` AS `src_object_ky`,`feedwithprofilefriends`.`dest_object_ky` AS `dest_object_ky`,`feedwithprofilefriends`.`object_link_type_ky` AS `object_link_type_ky`,`feedwithprofilefriends`.`object_inst_link_ky` AS `object_inst_link_ky`,`feedwithprofilefriends`.`owner_ky` AS `owner_ky`,`feedwithprofilefriends`.`srcApproved` AS `srcApproved`,`feedwithprofilefriends`.`destApproved` AS `destApproved`,`feedwithprofilefriends`.`oil_when_updated` AS `oil_when_updated`,`feedwithprofilefriends`.`oil_when_created` AS `oil_when_created`,`feedwithprofilefriends`.`object_link_type_nm` AS `object_link_type_nm`,`feedwithprofilefriends`.`prntName` AS `prntName`,`feedwithprofilefriends`.`prntOwnerKy` AS `prntOwnerKy`,`feedwithprofilefriends`.`chld_when_updated` AS `chld_when_updated`,`feedwithprofilefriends`.`prnt_when_updated` AS `prnt_when_updated`,`feedwithprofilefriends`.`chld_when_created` AS `chld_when_created`,`feedwithprofilefriends`.`prnt_when_created` AS `prnt_when_created`,`feedwithprofilefriends`.`chldName` AS `chldName`,`feedwithprofilefriends`.`chldOwnerKy` AS `chldOwnerKy`,`feedwithprofilefriends`.`profile_obj_ky` AS `profile_obj_ky`,`feedwithprofilefriends`.`profile_nm` AS `profile_nm`,`feedwithprofilefriends`.`feed_login_id` AS `feed_login_id`,`feedwithprofilefriends`.`feed_personality` AS `feed_personality` from `feedwithprofilefriends` where ((`feedwithprofilefriends`.`srcApproved` = 0) or (`feedwithprofilefriends`.`destApproved` = 0)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `friends`
--

/*!50001 DROP VIEW IF EXISTS `friends`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb3 */;
/*!50001 SET character_set_results     = utf8mb3 */;
/*!50001 SET collation_connection      = utf8mb3_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `friends` AS select `oil1`.`src_object_ky` AS `login_id`,`oil2`.`src_object_ky` AS `src_frnd_personality`,`oil2`.`dest_object_ky` AS `dest_frnd_personality` from (((`object_instance_link` `oil1` join `object_link_type` `olt1`) join `object_instance_link` `oil2`) join `object_link_type` `olt2`) where (`olt1`.`src_object_type_ky` in (select `ac`.`value` AS `value` from `app_config` `ac` where (`ac`.`key` = 'IDENTITY_ROOT')) and (`oil1`.`object_link_type_ky` = `olt1`.`object_link_type_ky`) and (`oil1`.`dest_object_ky` = `oil2`.`src_object_ky`) and (`oil2`.`object_link_type_ky` = `olt2`.`object_link_type_ky`) and `olt2`.`dest_object_type_ky` in (select `personality_types`.`value` AS `value` from `personality_types`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `loginfriends`
--

/*!50001 DROP VIEW IF EXISTS `loginfriends`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb3 */;
/*!50001 SET character_set_results     = utf8mb3 */;
/*!50001 SET collation_connection      = utf8mb3_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `loginfriends` AS select `oil1`.`src_object_ky` AS `login_id`,`oil2`.`dest_object_ky` AS `dest_frnd_personality` from (((`object_instance_link` `oil1` join `object_link_type` `olt1`) join `object_instance_link` `oil2`) join `object_link_type` `olt2`) where (`olt1`.`src_object_type_ky` in (select `ac`.`value` AS `value` from `app_config` `ac` where (`ac`.`key` = 'IDENTITY_ROOT')) and (`oil1`.`object_link_type_ky` = `olt1`.`object_link_type_ky`) and (`oil1`.`dest_object_ky` = `oil2`.`src_object_ky`) and (`oil2`.`object_link_type_ky` = `olt2`.`object_link_type_ky`) and `olt2`.`dest_object_type_ky` in (select `personality_types`.`value` AS `value` from `personality_types`) and (`oil2`.`srcApproved` = 1) and (`oil2`.`destApproved` = 1)) group by `oil1`.`src_object_ky`,`oil2`.`dest_object_ky` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `loginpersonalities`
--

/*!50001 DROP VIEW IF EXISTS `loginpersonalities`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb3 */;
/*!50001 SET character_set_results     = utf8mb3 */;
/*!50001 SET collation_connection      = utf8mb3_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `loginpersonalities` AS select `oil1`.`src_object_ky` AS `login_id`,`oil1`.`dest_object_ky` AS `personality_id`,`oil1`.`object_inst_link_ky` AS `object_inst_link_ky` from (`object_instance_link` `oil1` join `object_link_type` `olt1`) where (`olt1`.`src_object_type_ky` in (select `ac`.`value` AS `value` from `app_config` `ac` where (`ac`.`key` = 'IDENTITY_ROOT')) and (`oil1`.`object_link_type_ky` = `olt1`.`object_link_type_ky`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `logins`
--

/*!50001 DROP VIEW IF EXISTS `logins`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb3 */;
/*!50001 SET character_set_results     = utf8mb3 */;
/*!50001 SET collation_connection      = utf8mb3_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `logins` AS select `oi`.`object_ky` AS `login_id`,`oi`.`name_nm` AS `name_nm` from `object_instance` `oi` where `oi`.`object_type_ky` in (select `ac`.`value` AS `value` from `app_config` `ac` where (`ac`.`key` = 'IDENTITY_ROOT')) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `personality_types`
--

/*!50001 DROP VIEW IF EXISTS `personality_types`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb3 */;
/*!50001 SET character_set_results     = utf8mb3 */;
/*!50001 SET collation_connection      = utf8mb3_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `personality_types` AS select `ac`.`value` AS `value` from `app_config` `ac` where (`ac`.`key` = 'IDENTITY_ROOT') union select `olt`.`dest_object_type_ky` AS `dest_object_type_ky` from `object_link_type` `olt` where `olt`.`src_object_type_ky` in (select `ac`.`value` AS `value` from `app_config` `ac` where (`ac`.`key` = 'IDENTITY_ROOT')) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-02-22 23:06:03
