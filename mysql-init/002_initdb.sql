SET GLOBAL log_bin_trust_function_creators = 1;

CREATE DATABASE  IF NOT EXISTS `hierarchy_cm` /*!40100 DEFAULT CHARACTER SET utf8mb3 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `hierarchy_cm`;
-- MySQL dump 10.13  Distrib 8.0.32, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: hierarchy_cm
-- ------------------------------------------------------
-- Server version 8.0.32

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
  `when_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ,
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
  `when_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ,
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

  insert into object_instance (object_type_ky, name_nm, owner_ky) values (ip_object_type_ky, ip_object_instance_nm, ip_owner_ky);

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

                    insert into  object_instance_link (src_object_ky, dest_object_ky, object_link_type_ky, owner_ky, srcApproved, destApproved)
                    values (ipSrcObjectKy, ipDestObjectKy, lvObjLinkTypeKy, ip_owner_ky, lvParentApproved, lvChildApproved);

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

-- Dump completed on 2023-02-22 23:13:01


LOCK TABLES `app_config` WRITE;
/*!40000 ALTER TABLE `app_config` DISABLE KEYS */;
INSERT INTO `app_config` VALUES ('currentEjabberSchema','ejabberd'),('DEFAULT_IMAGE','/var/lib/tomcat6/webapps/ROOT/images/defaultFolder.png'),('DEFAULT_PERSONALITY_LINK_TYPE_ID','9'),('DEFAULT_PERSONALITY_TYPE','1'),('DEFAULT_POPUP_HEIGHT','600'),('DEFAULT_POPUP_WIDTH','600'),('ejabberConnectionParams','?zeroDateTimeBehavior=convertToNull'),('ejabberDbConnectionUrl','jdbc:mysql://localhost:3306/'),('ejabberDbPassword','mysqlpass'),('ejabberDbUser','root'),('IDENTITY_ROOT','3'),('OBJ_INSTANCE_FETCH_DEPTH','5'),('xmppAdminLogin','admin'),('xmppAdminPassword','password1234'),('xmppServer','localhost');
/*!40000 ALTER TABLE `app_config` ENABLE KEYS */;
UNLOCK TABLES;

LOCK TABLES `object_type_category` WRITE;
/*!40000 ALTER TABLE `object_type_category` DISABLE KEYS */;
INSERT INTO `object_type_category` VALUES (1,'Photo'),(2,'Video'),(3,'Generic'),(4,'File'),(5,'Album'),(6,'Profile'),(7,'Comment');
/*!40000 ALTER TABLE `object_type_category` ENABLE KEYS */;
UNLOCK TABLES;

LOCK TABLES `object_type` WRITE;
/*!40000 ALTER TABLE `object_type` DISABLE KEYS */;
INSERT INTO `object_type` VALUES ('obj_person','hierarchy_cm',1,'Person',0,6,_binary '‰PNG\r\n\Z\n\0\0\0\rIHDR\0\0\0d\0\0\0d\0\0\0p\â•T\0\03/IDATx\Ú\å\Ý  œ]ey?ð;™™L’™\ì  L„% AEDQe“\ÍP\n¢ˆ\n.©\"R1Š[[[[m­JkµZ\ëT­K]ª¶\Õj\ëFµµb]H23÷ôùžœgþo.w‚\Ë\Ç\Ïÿ\æó\äœ{\î9\ïy\ß\ç÷\ì\ï{Î´zzzZ>ýýýõvÖ¬Y½±\éš\Ñj>q\Î\ì\æXž“\×ô5¿ÏˆOoPž\Ò\ßPýs7\ÊO·c\å§ó÷¸\ÇN\Çó\ãx\ço\ÝÚœ¨}¦\ê3\ê\ë\ëócM\ÉGÇƒO=\rZ½3gÎœ\å\Ü<g` ÿÞœñ\Z\Zª¯\ë\í\ím¡\Î\Ïüùós·oñ\â\ÅC%Xoû\Û\×þùŸÿùI\ï~÷»¯ºùæ›¯ÿË¿ü\Ë\ëÿ\ê¯þ\êº÷½\ï}›ÿ\æoþ\æ\Ú|\à›“>øÁ\Öô·û·\ãô¡}hœ\Ê\ãÈ¹û\Ø\Ç6ô£\Ýü\áx§sÿ\î\ïþ®>f[RyÒ÷¿ÿýúR·\ç\í}ü\ã\ß|\Ë-·\Üëž\äºr¾kO»(\Ú|ÅŸüÉŸ\\ûg¿ô¥/\Ý0oÞ¼A|‰mÍŸ’Y«\á9@³gÏ®eû^$Á\èž„Fz\Ù9\åñ¸Aÿk_û\Ú\á?û³?»\àOÿôO?t{\0²=\0©ˆ\ê¯ÿú¯\ïŽN\ßƒ©‚aU0e\'\n†\Ô\ä7Ì©\é#ùHMŽ\å9H;1\è*˜1N¾;^¶\×yl?_·\ï˜\ë¢oU0tœò¾Qgÿ³/®\rœ3ò{¿÷{\Õ{\Þóž*„\ç›o~ó›\ßöñO¿\á†\ÖeÑ¢E­ þ\0¡¿`eÿœ9szº)HOajz\0_z¢ivV¯^={\îÜ¹ý/zÑ‹¿\æ5¯yF\0ð\Å7½\éM\Õ[\ßú\Ö\ê\ïxGõ\Îw¾³\îPh\ÇX²=@DÇ·\ÚG\Ñùš\âøNš”œ\íŒ3Fcð£Á\Üz®0£Á¤šœg\ë˜ßœ“¿•\Çó7\äš\éPö\ÅbŒ£1\Ö\Ñ³\ï\Ú¿\ßùû¿ÿû\Õõ\×__ýÁüAõ¶·½\íÓ¯|\å+_t\á…®\Þc=ZL\\,X\Ðjø½\0½% }K—.Í“f„\ëTg¦¬þ<\ïy\Ï;$\ÐÏ7\ÞX‘ˆ?ú£?º§c[h\Çö\è\à\ry\ï{\ßKKj\é‰Nn-¥:‰t\'•¿\å±N©,µ$%\Ó=Pþ\ÞIymö©\éÏ¸†¸\Öñ\Î{M¤\ÑyŸ\ìƒ\ëµ<¹\Û6, Ú±\ç»\Þõ®»nºé¦­ox\Ã\îú\Ã?ü\Ãw]y\å•Ç„6Œ›ý†zg½aýû\Z²\Ï4\Í,üD‚6D/¿üò^÷º\×}9\Ø\Zh%Ô²ý\Æ7¾±–†?þ\ã?®\Ât\é\ÔöÐž{\â·\í\Æ\èt;)PSfœâœšº‡\Â\ì´Œú¸{Fûõ6üU},|XM!5Ù¾´Ã®·CJ\ÛD;\ØF\Ö\í ûL}¼\ìK7\Ê~¸—~Æ¸\ÚÁðvböe4\Æ=\ZÛ‘Ø¶YŽ0\éUQÑ˜-[¶T/{\ÙË¾\Ö\å\Ô†\Z+\Ô\ê\ï9»7 (ÿñø\ã^<Pœ‘q\Æ½ñ\Û\Â¼\à\ç\Â¾úê««·¼\å-\ÕUW]UðªW½j!w\ÆÀ·b\Ó«Bcj•ÎtcôD\ÆhƒŽ6j\nMl\Çýj\æb4F8CCjÛ·\Ýv[ûŸøDû“ŸüdûSŸúT½u,|G;L\ÛN\0\ÙúŽ‘˜\ê>eÿ&£²o% ±?\Îü\èc‚;úú×¿~k|}õ«_]…Ùª\Â\ÌW—\\rÉ—®¸âŠ“\áñ”§<¥6a=­}\0\é\r\Ï\Ð\×PÚ¶VøˆqŸÌ®\í\Ýe—]¶.\è\ëa·bó\æ\Í[C;¶ÓŒ8\Öm\Ù”Z2ƒ®5%]«°N\'‘\ê$JJ\æ§ô\ã\0\0R~£ýù\Ï¾ýÿñ\í;î¸£}\×]wµ·m\Û\ÖiŽŽ¶\Ç\Æ\Æ\ÚUU“\ãw\ß}wû\Î;\ï¬\Ïÿ\Þ÷¾\×þ\ÊW¾Ò¾õ\Ö[k! \É\Úaj—}\ìFe¿‘c®/6Þ‘\è\ï6 Ð0W@½\îº\ëªW¼\â#Á«ŸGV…–|ù\Ïx\ÆÑ˜û\â¿xvOOo\ÒWPz›Ì¢§ Á2fœ|ò\É\Ë/º\è¢„v\ÔZ\rT\Z\rP*7\âG¨fHC-!´‡“\'%@I`hŒmT0¾\Þ\"¿\Ó8ƒ \ÞÀe\ï*\0¨‚ñ\Õö\íÛ«`zu?\Ú0«ÿü\Ïÿ¬¾ð…/\Ô\Ñ\Ò÷\0‡_\ï\'ÿ¨Ÿú§Ÿù\ÝVkk\Ì%\Æ@#B¨«\ßý\Ýß­®¹\æš\ê%/y  0\Æ~\çw~§\nóÿ¡G?úÑ»aõ\ëþ£ g\ÖÀPohÌŒŒ\ÇM×š5kf\í½÷\ÞsžúÔ§^\rü04¤\nU«A‰F«k¯½¶zù\Ë_^ƒB%ùÐ™\Ô\Ô\á’41x\ç9X×“4!*B²«ò\ZZPµ\Û\í{1¸Û±‰\Ð^¶c{\Ï=÷T?û\ÙÏªÿþ\ïÿ®>ó™\Ï\Ôý2\ã\Èþ\êgš\" \Ù\æoÀ0@Hcp}„»5o. ^ø\ÂŽ\áÁŽˆ«z\Îsžsû“žô¤gx\àƒ\ë7nO\ÞÓš5o¨‡ýš¿xQO™_ÔŽý\àƒžû°‡=lÿó\Ï?ÿs\Ï|\æ3\ëF \rÕ†O\×@\0C*\Â~Öc\Òtù\ÝÀ(¥\È@lµ\áx\Ä\ï\Õw¾ój\ëÖ­÷b&\æu\Ó\Çü6\Ý@P\ç\'ÿ\éOZk\rf‡™©m?\íO\"liŒ‡VÀ1c\îOŒð*¨B=\Z>¤zúÓŸ^]pÁUûgþð‡¯?\è\ÐMý3\æ„6Dº±(¢°™;\'=k×®\í\ÙgŸ}>þñ\Òé§Ÿ~g Y7˜0_Õ¥—^Zk\ËóŸÿ|Èk‹N\è\é\Ð9L\Òq\Çi‚Aù\Z“(¡\äý\×\í\æ\Ð¦j\"-H)¿/¸&Û²N§\0\0\ç‡?üaõ\éOºfº~b4\Æ“±ò;ðh ðo\"M¨y&ªzÖ³ž5ú\ìg?{[ðrôœsÎ©‚FŽ;\î¸óW¬Y9tÈ±GôµE,¿o\0#‡Ùš`\ÌPV \ï8é¤“\Æ\Î>û\ì\ê\ÉO~2D«pFU4:®-nHtZ\'\"´«%0´\")Mš\ã©]´\âk_ûZÍ’@(˜ŒÔŽ\é\0R\Ñ\rT\æ\ëÿ÷w\Ò ¦S\îc|úL\èR0&p Œ‘%a\êñ\n\ß\Î;\ï¼\êiO{Úøx\æ™gn;÷\Üs«SN9\åkö[³\Ç\à^f|\ái}­P\Þ=ûw™«\È&g.[¶lÁ!ñyÔ£õ­\Ð×¤ÀD£\ãÀPA\è»9\ë8p\ØÎ¤ô=\0\ÔiIÇšÚŒÁŒ©|B2 I÷ECœ\ßy`”ÇœC8ò\Ø?þ\ã?\Ö\ÚB1\Ø\Ë\0\0c3v\ã{\îsŸ;~Sß˜§–&øx\ÏYgU=ö±½û\ÔSO‹´\â›\ë\Ûx\È\àºówù³Z{†\Ú\á;úšò\È\Ìð!=ôÐ³Â¾\ÝVI\ÑÀ80\ZOqS¦L\ÒùH\ç’H³GŠhE~\",­·f#\ë´÷`L$ù“’ÀO$Lôùö·¿]ûc¼ø\â‹k `ß˜¼óT…ÿ­\"×¨žø\Ä\'VOx\Â¶Ú†\Å\Å\ËG>ò‘cá£«ˆ´\î<ðð\r\ç\Î\Úwh\ÉCŸq\Ü\Ðo|^ok^\ã\Ïý·\Ûn»-X²d\É\îa½0\ì\Û\èCò\ê\Øc\Ý\ÚRx\â‰\Õ\ã÷¸Š\Ö@9nR«!F»y\'8´\' LÔ~ô£q  ,m\é;&2A÷fp2\ÓVú£nšÂŸe;ª¬ƒ±7!l½uŒŸ\Å\ÂÊšð\Æ|ÛŽgÁÇ±H%~ò˜\Ç<¦zðƒŒ·[¶\Öô/{\Ø%\'Ì»\â\Í/\èk\í\Ñ\Ìe„S˜9s\æÂ¡¡¡\á\0\ä|\à·>\èAªúÐ‡V¡-\Õ#ñˆBy\\cB\å\êºyøœ\ZŒ²CÀ¤p¶4\é/Êw3=\ÝUš¤l3.\Û/Á\ï¦</53ý\Ê\ßK\Æ\á“~|¡/<ø@\Ði§V\05‚#x×´ƒ¯cGuTu\ÄGŒ\îuÐ¾/o­µf\Ý9G-<÷%\Îh5¥\Ã\'½½½‹#A\\¦\ëºM›6m\ÓUš  D©[\rŒ›$0@¢!nÎœ5ö²>O8Û© LU®3º\Ê$°Sú;CV\ç$¸…¿\Úv¯ŒÖº\n\Ú\ä\Ï:\Ï)??ÿù\Ï\Çû—föŸÿùŸkó…7YªŽ?þøZ O8\á\ÚPƒ„Žs\Ì1#A\Îo‡°v\ØaU¸\ê±\å¬\Þ\Ü\Úk`\ïõO}ø’\'_wY_knH__ŸT}Y$‡û,_¾ü†ý÷\ßdÃ†\rU\ä$\í¸°\Ò\0pŽ>úhƒCýC\Z\0\ä;0H\nh2M(™\ÉX  \ÂD\ÑS\æ¥öt\æ$˜\î\Ú’HI¢\×  vgˆëš¼wg{yžk´\×\ÙO\0ú\íSŸúTm–.f¾ƒ\æ\0\á\Óøá‡9·|Ý¸qc‰\á\Ø\âµ{¼¢µ°µßŠS7.;ù\ê\'\r´r0´C¼g8øÂ—\Üfkl\ß}÷­8\àv\\Xi À©o®aOs–R\0 [¿KüJS“·Áä±”¶‰r\n\ÇK\Éõûw\ÜQ}÷»ß­CR\Â?ý\Ó?U_ü\â«\Ï}\îsõ\ÑJü\Ío~³N6o¿ýö\ê?øAøu¶?]öý\ï¨2\×ÿý\ßÿ}mð‡@\0O¬}\Â\ZQt\ÐA£AU\Ñ¾Ž®[·®\n·\ç\í¹ðºðÖŸÿ\à=Oº\æœÙ­\Å\ÍLlh\ë5þdC8ö-a¶\Æö\Úk¯*.\Ö@µ\ß~ûATƒ\Z¯o”À4m¡Yu8\èó“Ÿüd§tJ£\çñn\Î\×w\Òÿ­o}«úú×¿^Ó—¾ô¥šH½K¹\Åq‹ùŸý\ìgkP„«Ÿü\ä\'«\Ûn»­(\ßø\Æ7j² \È/~ñ‹ÀÿŸÿùŸ\ê\ßÿý\ß\ëk\Ê\à \Ô\î\ÝÍ•¬Zµª;Á‚„ \×@``ÿFýˆ5kÖŒD®W\á\ï\Ðó¯6\í{Þ¦\á‡>\ïQƒ­U;¦>Ô±X¯\ÕA/^¼%n0 T.D&p\ê³~ýú*üL}\Ã<\àõ¾ó\Ø\ÓN¦gæƒ\Ç \É\â¿ýÛ¿uMþ|w>©$\å¤C1“&\0Dq\Ð\ï_ý\êWk°|w-¿ò•¯Ôš\ä<\ç\Ð\Z•Z…\×\éü\ÓDþø\Ç?®\'¢\äPrm•ÀÐ–¼Ö¾s\"‡«ùCHñÃ™zü\nÞŒ\á!\nÞŽø-©†–Ï½¡µ´uð\Æg2|\âõ§.Âª\ÞÔy  \ÈÂ…_»r\åÊ‘\á\á\áú\"À\Øja|dôµ\Ð 54&%ª\Ì12l\Ä¶–\ä¨w9\ÇoŽtb>F\"v®-¿÷½\ï\Õ\×ÐœO|\â\ãN—6\Ø\'\í´\0˜˜¦4 ZDªi¬}š¤}Àtóo®So3NRo\Í\0Àõ%…®ô9¢\Ì\æšuÅŠµ\Ö\àYð²p¼ÝŽŸ\r ¯i-j¼÷“÷~\Ð5\\yÁš¹\Úd\ÜÄ…u\Ô•û\ZŠ’yó\æ\ÕÓ¡š‘•Q\ZšX—X\0‘*_Jf+ð‘öt\Î4‹i\Âüô$ø_ÿõ_k³’¾J8š\às\Æ\ÎO³  ¤ù—©AH¡q?@9\æ¾i²:‰_˜ò*Rƒºxšm–>N  ‘„\Ïy„–\Ò\ZüŠ@i?  ùž{\îYrckE˜¬§¬>ø‡\ÌYþ\Ì\ã‹j“N}c0wK40\ê\âØ¶£*üJ\r\0\Ôw\ß}÷Zõö\Øcz¡r]\"HF\ä‡)!\Å\æ\"P¨¢ý:\"K JÁ$ü–[n©\ÍC–Q0ã™¹¼“&ðiµ\åú”X\Çidš\Å<‡f0{™¤ŠF\ß)£Á¼m£\Ùú?w\îÜº’­?fGŸZ¥}‰#~\0Ïg¹\rjlZ|³û\à–Ö²Ö¦\ÕO\Ükø\È\ÍG\r.»h\Þ \Ñ@l]´t\é\ÒZ\ÚùK\í?¨w±\Ð…EvxÑ¢EU´+ª™˜&&?4!M\n\"\é¤\rH¤\Z Ñ\ß1œFd¨\Ì\×`J&ŽüÇ­·\ÞZKt™÷\Ð*@\ÑÀ\0\È}µG;™º\Î\à£%v@ÁXkø¥“\Ôd×¸—\Ä\Øyü~•\Ïj~6Z3:g·9[Z» \ç®>|óƒ—^¼\ìÞ„ŒZPktmiu\ßS\Ïq¤”û(Ic¾\"¢\ähÎœ95\åyQ\00ƒm\Æx\æƒ¾ü\å/\×\ëªLe®\0û\ÌL2Â‡)#µ´2£µ4u|O\ÓG\í*û[sÅ‡R³\ï~üJ‚˜\ÂÀ\ì\Z?³+;\'l\Î:Ð²ü\è›ób‚‘$?}Kmi- @\ÎY7|ø\Ë<¸\ä\â=ºŽfiÝ ±uãƒƒƒuÌ)Q–Æ°¡j<KR¨0!‰ió9[Œ2xL(K#™Hb°6hƒ¨H¤D“´Á\Ä\0.sep’y\Ê)§Ô“e4‹¶0¤\Þ=\0hve¿3\Â½ ™\Ý7?4›_S2vf<4\Ä) `U/­‹\ëXœ 4ý£ƒ»\Í\ÛN}\Ó\ê³ö>\ìeG.¾hùÎ„ó\Ú844´\Å\É\Û6Ÿ¡>\Ã1\ès\â\ì©fžAú\Ä\Ü:bZiˆ\æH0B‚9)Ñ˜†Á\é@µ“NYu•  \Ê\ß2¹£\Ú\à/\ì\ß|ó\ÍuT£Àg\îBN\äþ’2\ìÀ2Q|A©ULšû§/\É0(46\Ãk}ÐŽ\â*?c^ƒM-ð\'4Æ¸  L~þ\áþ¡6\ë±\Ö<Ks\Ïd\áe\Ã\ÛÑ¡eó·´´6­zü\Æ\á¾\ä˜Á%\Ï^\ÑÐŠQÆ¶Ý˜®ZKrKš\r\Öa[N3hf(Q›a#¥\à˜\0‘útœ’’~©[\Õ‰TwO•V¾I$\"\Z¨}hCgD—a-\Æe\ÝYS\\dX\í^\Ê\êÆ¯r\Í7™V°H‚\ÐEð\Â\\9—p™\Ò7Mš)\ØGx<¸Û‚-­y­MÃ§o\Z>\ì\Úc?køÞ„)\Z$\Zk7¦+m`\Íðk\éð\Ñq¶\Þ|Í‘±³\Ëcµ\ç¦cž u\Ï\ì˜d–Ž>s¿;£˜4‹À$¹i\"…—\îíž„bþüù5(”~$£§²@˜\æ‰Æ•õ« úM»>Ì›¨Ø¦hP\åb‘6\ÔS¹ò}Êª0\ë¢? Jš,|_<:{I\02·g\Óði~\à5\Ç «\'\ÄE\0†9sÇ¨!p0Ã˜&¦C¼Žñ\ìªÁšYm«#0Cùner\â\ÐIv©5iŸµAªùŸ4g\Âbž80”r0Ñ¦2ù+\ï\éZþÀ~,—1yy½¥¤Lµ1\Ñz`™\Úõ\ÝT.\í\éó«ò\Í\ß\Ð\"<\ä“mñ4’\ÈÑ™\çni\r…\É:\å\Ð\á\\{ü\à‚÷\ê\Í5½5 ô\Æh`KhÀ¨F‚\ÚbfŽ’7\'!9½\éw\ÎYD\0Ò©!QW&S\ÌWF5õ¤Œùµ•9H9×‘%Ú¥½Ô˜”n‘“ûñ\'),Ú¡‘\î\ÛY\"É\ßø¤Nó˜\çñ]LTú7š¯®\ç^A¦‘\Éb¢\Õ\ÕX  Y½hŸ\ZB ñ6´wh œz\ï¦\áS7\ïu\Åaƒó/];5 \0DdEýR-1žm4 \Z\â\\³g †%&\ê\á°\'ª°ú­tô™c`\à˜ˆ,‘”Œ%é¦‹6;K\æL`jd‚T³ö5Q¥W°\âwHj\n_Á\É£\Ò\nSf\Ò\Ê}h„©\î4¯ò4\á[ð§…ðŽ\Î\\0+\0 “u\êú\á\Õ\Ï=tp\è²i\0B\ê5\Æd\éPWÜ)j6Ž‘2Q”Œ3,UZa[IF1Q\Ì\'ˆI¢! ¤\Öt¯²d‘É¡¹üô-   ¶1“O\ÊÜ¤SC,À\Èð=—\Ñd\Ú\å7þH\Éd«hô\ß\ÄŸ‚V£Á\åf\ÊI\Æ#“V|¾„ö´Õ»\0¦otö\âÁû•†\ÙgŒ\Ç@Nƒ\ÒvXxkH:m•\"óA\Ât\Î\àH V\Z»a\Ú\â;ˆ\ÙJ\r\è\\ð p~ H:i\å˜\ÒO¸OYB)5/™\Ï¢Œ\àDyY%N•\Ù3\Äd¾’È±Œ›©f\ì\ÓÂˆOÖ¥±,(„»M¸²Ë@ TÑ¾$C8;ö\Òq\á\Ôøù…\á\Ìÿ‘y\Í(£)Œ\ÃL\çÌ ]™À1Gò\Ñ©un‚ke\Ïò¢\Ò\ï8! 6\ÐX¡m\Ò0:®?\Î+CeÚ“¥mŸ&˜\Â&HÌµ0Xþ\æ]Ä§/ø¤\ÒA“B¸k§Ž7\0X8û¾\"ªÐˆº•’ Ç•ó\Z\é+\ä4Â´­º›  4\0±Ÿ’\Ù\É\Ð\\˜¸\Î1Ž\ÞV”\ÃÁ\n&|\Ïy¥\Zý\Ð?&\rh\Â]Lw. ‹¡Ž\Ñ\0À§‰´\íô#¥\Ë\àÁu©fH™\"¾C¥›•öf2»¶ó\\>„p$„y´þÀ}„\Ó\ÜÈ¼\0‰£Šü\0)ñ;\'–\ÕN7v\\nñŽ3E‰^®\ì0@ƒÆ¨r\"(?\Â_\ÚA»0Püs\á|f\Å\êRhq§¯$³3Šr\r°õ§S \Ãl÷)y—÷\"ŒÌ–ñK\nÓ¯\Z?\r\ÌD•%‘³\0L\Ó\Í\ÜK´ñ‹\É\Â\ã]r\ê\ÐÔYÀÀ„°ó$U>\â8•¥þB;76ßžÌ¥\îR–\Ý\Ëp57\ée\ÚÊšP§c\Ç4\ç”\É[FjLDFS\Õdf¥\\\ØP®ñÊ¢#\Ð\ÊÜ§\ÌGòxúºLVùS–#\Ã{u4\ÂH\Æ/%ý+@„ÀM\è\ÛÝ‡t&†‘slqr\î¶9sÑ“…–˜ \æ\'õ\".\æ\É\Z,Eû\ì\'Ó•Khr\")™\×iRKHF]\ç\ä\Ì\"††n\Ëvø1+\ÏY#\Óv–\áó\Ú\Ô\Ì\\‘\Â\ÇeF_®û\Í\àÁ1¦” L\í1.;ð\Æ\"ù\Øwž%§4“9O~\ÚE-«5g\Æô¡Ž\Z`!.üµØ˜jr`l¦­Îˆ:R[˜*Òž´Ž13S.ó\É\ÒHš%~¢tú¹r°”X\ç”U\Øsi\éM0RÓ˜-þ¤ôš§?\0-5t{‚Àh‹†0~‚f‰ªŒ\Ý4¶­*­D\Ñ\'>FqQØ‹¯xª¢>c¨\ï¾’Q–\ÍVtAŠ”&D6»(+\'oH‡jC2Ž)\ë\æJ  „¶Ê•*Ý¤ƒd‚J01\è\æ_\0–÷\Ê\Ì\Zó8ð\\ha›\át\'\Ø^jn¶“5.÷v/Â¦¯’\Ör\æ–\ÉfQ&wd0[Æ¦¦¼­\ÃÞ¦”2\Ú7ofw@ˆñù¨³$ n\"d\ãŒD+ „b\Å;ma¶\0¦\n\Ì4(ƒ[0–Œ\r‘\ÒÌ’seb–\í\r\Ö\àh\\\Ú\æn\ëvId:\ÕT»|™U\ç§Š²¹‘\\\"”\Z!‚\Â\ìn\å‘\Ô\çcx~\ï\Ö\à°¬U™œ²X\Î=\ì\ã‘U\'ø\"i\Äý-Òž\ào\rHC“TÂ©¤A²Ž›1œ\í\Ë\'” NR\ä%´ƒƒ\ÃPÚ£3i¯1ƒ¶\è$\ímÀ~®4^:À2_ \í¹\Ø\Í>\rÑ–|ƒ÷Ý½0‚\í\Ö!¦~r¤¦Y3„Ö¶ûdÛ¢\ßs&2µ\Ëý1\Üo\Æ\ã!\0¨¾œ4\Çr/÷fZ‘–ód\ë|o\Î\Ç\0*Î­MV“v\Äó…D\rHFYÁü\Ñ\æ¢:L£†\ÂJ\ÉG&Š\Ò5-÷[™Y+)M-m‘s…\ÛJb\ìSŒ u’I’\í8p\Ë\Ù>\Ä$\Çhƒb§gUòL©0\æ r¢\È1ý¶ö\Øs‚\Ñw÷\Ä@meŽ“\É,ivo}D~Cy¾þ°©mò¢,2Ö’ZS\Ã‹s\Ü$U\Î\Óy\ä‘5 q\ÓDù½¤©Á\Ôö\äéŒ¸\Û\r\r\Ö`h Ir£\Ì\Ü\ÓYg~A­I  \äŒm…ÄŽ\Ùb„m.ñ\ÌÚ“kij‰¦û\n­žN]T\ç¸|$Xk\Ë\nK\Ç1\Ê9´¢ô]ú”\å–LJ\Ó\åº1&6gý¨œs\'„œµ{\06hG>\äÁ%L4DI)B\âq‚\Ç]ó$¨+ \êU|ˆ(ŠDè¤\Ý\ÜH!²À(Ú‚¹\éP\r ¬ðfô“¡¤mÂ¹3¤P\\/Ì¶v–‰\ä4\Åøî¡¾fýpVzÍƒ˜ÁdFó¡ Œ6‘\0‰­~2y´£ô]\Òdu>fW.‡ej1<“\\ÀY>*\áW}§!\î%AöH`\Ö\î„\ÂÁ³z~©)G\ÎZ4§; ¥S7…\Ë\áð\0\É  )LP«ñÁŒœ¨1A…¡i õ²z‹¨{ªxJt9@;\í‹\å1Y\Ê\ÒL25\'¼\Ìa“¼\Ì0R.$,þ\æ\Çcy-Ê¶00\ç»ù< e¦žý\î|¦8ü\nTN\Ñ\Ôl\×XÍµ\Û\'<*À>L=§~®M£šz\Öh\ï\Üþû\rÁ\æˆZfV\r$\ë­Ô¬\ØeuÿŒÁsNB§™4L+“²|@\ÖÀùK\ÒKHZù\Ý\ÖrÔœ¤J\r£\î]V‡­\Ì/\Û)AÁ0’lŸóU•\í\\3V>¤]B\ë¿r¡„ð–\ÔkŸ¯\â+\Ü\Ç\âZd¹\n“‚0^\Ë\Â\ã]\Òˆ`\Ø=ó\è¤Cd$\Ì4eC\"1¦­y‡\Ôøœy®\éö,a¹e²Lõ¦ wJ·¾\0­¼–\ÃM_‘‚À¬\ä*\í\0 ·$\æ\×Ggž\Ôù¤WV¢‹©´¨B°Búµ\í‘?s\ì9•\Í\Ç\0P¸Þ˜\Ý\Ú\'\ã\å.\âb¨\æJ¨g™œ\Ú;Ž)\Ò\éLÑ•A\é8s”9FY/Í—H$\ç\å1¯\ã’y-MÄ„úTf¶M\ãÒ©T›\éƒ\Êö’m>FQ&\ÄŸq23cr\íð.º\"$dYº„`g¢M£øžÁ\Þ]ó!f\0s¾\Ú@•J8*â¸•’ 6›ÿ\àˆ… \é7\Ø\ÖdTiÊ™A\ê/\ÉLŸ3q%sŸÿRO\ËAq¾@„³\Î9’\\S\ìºR\Ûò{©1²\înÏ³d ‡9\Ë\\\ÉG\Ì:L\á?¡M> ¹ù5f\Êû¹,‡\Ò\ç$W\ì \Íê“ºó’.­ˆl|La S\"\Ü\Õ\àˆ\Ä2OÈµ³=K*ùN6”ö½d\Z&¦\Ùòö„dZ&h¤rA^Ÿ\×u#ZC\ë¬\Èbc·>f‰&CsþB\ÛÌ¬1zôK\ÅW;VRr\à4E²H`¢õ,\rÁ\ã®T\Ó¤™r¬sI%Ì’\n@G:ùû–QgšÀl óù¼2W q\âzIYFniš:™—Œ58\á&_¦=\à\çq\ÒI¢õ±¼f2¢1\Ì\r\æe5‰M“¨=E³®\Å,»VTLf˜3BÎ“h<,Tx\ÙLiŒ.»k&‹ý\Ó’‹xÛŠ½\ÍôQeKc”3˜\n¿aXù\È\Z\Ç<L”M#\Ñ»l\ß\ä•\ZA\ëÒ—¤C.\Í\æ‹p|d\ílxJ,­\Ô\çn¾@i¾Ê¶˜œ\nsùI~r¨|cP\æS@\ÉI\'[@‰ü0Ÿ)K\Íô²có›¾xÀ\ÇÐ”©\çC\åšX¹„f`V:?7ö¸¦I9\ä|¥Sbò’4S\ì/- Q¤\Ð\àhK®L÷agu:kR¶u“j\æI¨‹9|šs™9BÁl¥Ÿ˜J;’\Ø\ã\È )\Úkœü¢Á¦ë·¤/ó.‘\ÆK8i9\Â×«BûN`,”ð=\Ò5™\nþ\ÝC\ZQ1A™a¾£™¢œ\Ë\æ\"5&\r\ÎU\ë9—d„\Õ\É\ÄÎ7·U\Òñ˜C®#<$ÖƒA9“7e”`\æ¸8P&­”\Ð@Z\rý±>Ë¸Æ¬O\ÚŽq`\æ—@[(—&Kù½k\éd:@ªiºt„[uQ†¢´³\Ë\å@´FX  | \ÃÞŒb˜¸dz§y)\É\è+‰\ÙT\ÜK3\'\äLA™ \é«\0¯¿ewZž¥ &yú$§¯™mL\Î>f\å\ÛX\Õ\ßô+W.6u¬Ú‡\ÌY2t\ßa\åBk\È6rh>’¤¬ü\"µ#Ó•öE9ižBXDÒ•%d\ÃF>”¡©ý ô\'  RjO\Éü2*›®–$\åÂŒr16?\ç¡1\'º\Äh¡~V¶\Óiûn?\'º˜+\0\äcn\æ\Ô 4\ÞZ·0T?²ÐŒœñDb0\â2\Ã@\Ã~ú.\âõ¸†ƒË•‚$eœ dd\é3›(»J™¯\äy¶yl²³³-\×1w©!\Ì2\á\ÉEv÷“„\æ\Êv„«¡e;Lg>\'/\Â4Chòiª°2uù\Ý>@ºFYSÒ Y›[¾„¶p\à†óJ\Î\0qN\î  i @ñÊ‚ 3QXFf>£¤‰ÀÁ¤RS\î«V”\ç{¸3³u%\Ñ\Í`’šZT0˜¤\ÂX50\ãT\Ï\ã\äù%d>–¿7v\Ô\Z\Âô³»H³t¾Ä±,-‹ó3\Æ\ÖA\ÇÜœ&Qa\Ù:õN\Ñ\Ùt\ä\"ß¾Œ?K¥i\ê”\â‰À*Á\ì–\ÙO¥¹\ï}%\n£\0Ð¿œ\ãW\å6&‹\Ìy\ä,)S\Äté¿j³™A¾(M\îQ\ÐT<j@RCv\Éd\ÙrH¢Qi0@\Ñ¹\0­§´«x’V£\"6¡•U¹“ &eÞ£[n\Ð\É\à’‰\0–IeFN\Ó5Yy/\Ñ\"!QY\ÈE\ZLj>m<´†C\×\ÉoF_’S÷³lŠ Küüþ\ïj>d®G\Ú·6­8\íÀ\áUW>`pð9k¦§!P¥%ùT)-±¥>\é\ØùXbx\Ú@«„D(>R\á\\³•‹Ø*\Ã\í4O÷5¸¿\ÄÔº\Ê\\ƒÐˆ™[çˆ°ž\È\É\ÊD\æŒ\ãö\ÔXf\æB\åŒ4ñ\rÿ˜ø|\0*12kÉœœ³ÿð\î—oœs\å4\0¡nY>q(\nu\ä\Ø\Ë,ŸPk¥\ÆÁ©v\æ+{*q”d¥Fù\äcaYz¿¯~\àþR®\Ì$\ÉBú|\0ˆ´{IöÝ£Ñœ<“D„ýE©t3u~—\å<Ë”,Èº\áÝ¯8pz\Øj$\å#”ƒP¡%\âxVX\ÍY˜c üDjó¥ŒBª²\ß\\,9A®þuQÎ¿0/‚‹RiÏd)(krªÚ¥ö2\Ñ|sl\ê\Ù1|\Ë\Ç\×&dö\â\0dakÓª3÷^~\ÙúÁ¡\Ë÷š\Zù¤‡™\Ê)]\å\Z\Âþ*{\âœrú\ÕrfËƒ¡\Ê,Ž seôošS¸˜\Ìk§›\Ø\Ý_b\Z1+Ÿ f^×“½2wf\Ç\Ìmˆ\Z3ñÌ¾Ê±R«˜±f\Åg&‚S2¿µi¯\Ç\ï7¼ò’\rƒó/\Û{j@2;OÿA¢8ñ|‰\0©³w\Êôœó0\Ú9’FsŽy)$gn \Ú2\æJò,=üº©4™úLS˜W\Çô=+ ,FŽœ“\ÏU•´ÀxCù\Ð\É\04c8·µi\íiû_´qp\á%ûL\rˆF³\ÒÛ¼`\ÜY\åº:¨˜˜o\ë\áI>ß&ñHa¢¢ ?’\ÏS\äóÜ\åŒ_‡–\0\"}–¾b¨\éW&\Èx16µB+š3¿Á\æcn\Âc‘\">\0ƒ\å?š\Ücr@†S÷^yÑ\È4\Â\Þ|6]\ÇlDS\ì7o$¨ÁrL”%Ž§\Âž\Ñ™­•)œ~‚šÓ­EÚ’\ÌO¿‘@t›ùU™­¬E™aRõK?•0—–¨$ûM \ÃLóüŠ<%\ÍyF ø£\Í\é\0²\æÔµ\Ã+.>`pþ¥\Óp\êLL¾\Å!g»\ÒN\æ{<|\Ç<ò)‹x~›)\"Iùª$1¾ˆKB\ÉÜ¹¢«C:‰¿N\Ê\\G\ÔD˜”>h¯¾ó#ú.·¥s\Ú*–°C\éHd©\r|\Èõ$&÷!³v<§~ú\ê\á\å\ï38÷Ò•½ù\"e\ï\Ã\\9\"\0¹.)M\ÓD\çJ\Óôˆ\Íù…8f™ò\è—R´J&UVmIœÐ˜s\äS2©\Ë)\ÜûK\ÑZiù‡\\•)ùÖ’zL\ç\ïi·\Ñ2§¬ùMÅ— \å«GJó”\ÎoJšGó\Æò·\0\ä&y\È\î\Ýmx\åûÎ¾t\Ç\ë™z\Z\rYž4(ŽM\íÉ¥ø@ÁP\0\ÈEø&+_8Pú ‰X–bÔ‰òÍ¦ùp\ÛÞ¹X\îþh@¹¨!\ëKöi=@ø5\Ì\Äð\Î\nsfÿByOÛšJ\ÄHsñtò,)‰\ß\Ç\n@\Æ@\Æf-\Z¸\ÑÛ–œ¼dxøy\ë\\µr\ÜdyM\ìò\èøaq\ãW•jU,Ÿ\ïJe\Òt\âòŒüs\Ì\0IK@òZR‹q$Ñ£s\êJ¿\æ£<&o ?f\Ê÷ô!\Ù \Ø\Ò\Ú\\‚j’`&-\×77k¬\Æß˜”\ÏôgM+\nk\ÒN‰ý‘\0\äQ\Ö\ÐñCÃ»_²fpþ•+\Ç5¤\äú¼(Ÿ™Œ\ÒV\æ³\ì:¡S±OC‚ø…9QŠEeBI\æ@\Ù\Û\ÊLF2¢–_–H`\Ó|!­ H\É\Ò&Ky˜,«F¼¡\"Í«ù&UE[\É\Ô(§\"R3rŠ\"\ËL\Í\ê\Äq+\Ó\ìÐ×´öhmZzÂ²\á\á\Ëö\\|\å\Þ\ã>„\É\Ú !¹¯J5´Žh*@2\Ê\Ê(,_\Ú\å;  \ÓQ\0p\èbûü\ÛU\æJ8DN=\r0\ç\îwEÈœ\ÃÿeR©qÌ¡JR*D—\Ô\Ñ\0™¸~˜h\ãK#D\×O\Z¥ÀÈ—0{ù\î\ÉtJó\Õ<r0L\ÈH~Ç³\Ùf½V¦¾\ìøÃ«#Yr\éº\Z\ÞÆ©¯\ZlN$I>\Ï0\åó‡\áO\\\ãf|\r\É9N[¶NÂ˜$\ÕP+ÿ¨¾(‹=f\ÇÈ´\ï÷÷/gË…åœˆh1\ßEœoñfvi•‡þ6ŠrJ\Îd6O)§\àV¹D4{‚’\04šS2:{Á\ìW·Â©3<¼\ïE‡\r.¿ô\àzPFY+ƒ@^\'\ß\Å¹I&…¦¹I&Œ\åû¡rv\Ìy|[M\ÊÔŠD`œ2¿t\à¿\ìü£³„¯/©\Ù\î r™‘±˜\Û\Ée rôC­˜k\r\Ò:d‰)µ$)5Œ% qþs\æ^\Ó\Z\ìÙ´ß£\Þxñ\Ã—<m}o«ùs\Ô \ÈA\ÑÁ«\âÂŸÄ…Û§ˆsH„\åKÏ—\Öø\Îi\ç\ï¶\æ\Äø\Ëw(9\ÐQŒ\çE\\\Ð-\Ú\Ù3•¦*CjL1½j *\ÍòÊ™lùÁˆð—\áÔ–ÏŸS–…²¬”AP§¶4 ´@ \ïøQ\0rEkNï¦½ºaxù [\ëz\Æ5¤¿y‘ò¦P\ß\Óù¯5\rn+Ô­¾I¾\ïi* :5(\ßù›Rh>š–\0†³\Ç\0\0\çj.%«\ÉÓœ®–jÚ~\Éü‡{\ÓZ‹\0}\çð\Íñ\ÌOAJK\ÉO^LFùz«\0i$Áhö=½\ç´f¶9\ä¤cVz\Æqùvvü]\ï>\äÀ\è\ÄiÑ‰›ó¥3ù<C³~,Žm‹ý‘\é\0\Ât\Ñf(\Ã\ã\æõDu‡-\å—õ*?È„1\Ç÷Rº»=–0]J“Ô™ z0(ÿ6!¿¦,\"”\é#­v­~ªdnò£\Î\É(Æ¼=ß‘û[›§›™\Íw·ú{\ÝZ0°iÕ‘\ë÷\Üx\ìƒf\îøÓž;žÂƒ\Þ-h]HÏ‰Ñ™«C*~šN©ÑŽñ—o¹\É\èTAYr18’–“\Ë}\Òg(<šg`\Â,T.\çFrÁô®‚\Ò\éÀ$Ô¦‘\Ê\ê\"-‚‘9”{ÐŒ4\É\Ý\ßH}Uð¤+Å¹% ?o¬\Æ]Ñ«#¾=®µxÎ\Ë]·û\'\×_âº,Œ¯‹Ý£cû”@ð³MC\í@’¦\êHR‚@2\ì§\Ô\åz/\Ç1)\Ëô²\æ\\£5•¹š8\é¬3\ÏÊ®\0C$\'\É\ç_²š›¹BJs @®¼)y15üd\Ç\ì\ÏF¿ž\Z\ß\Z\ê\Ý{Ÿ£7-9ñ¼3û~/  @\æ$¾oˆ<!:xSt\îöf\éXÐˆ\åôe§¼ÿ)—™ND\ÌUJXY¨\íN/\×\ì|Œ\í—Q~Ï¶:‹—ÀOpòoYö Å„G\ß\Ów\æ˜G9¾i’<iøñ\Ý\×õ1\Î3£Zƒ½+WvÀü#óðù‡%k@¢Sþž\ášø¾6\èô\0\è\Ù\Ñ\éD#¤¦\é`¶\'\ÞÝ‘œŒ²ó¹Ÿš“ö\Ý1÷À¤\\·d\Ël¤‰\é¶~W\n@&  \æ\Z¼O\nPö/5££\Û\Ø&¢\â\ÚQ\ã‰1~8úq~ô\ç±È3\ÎY¶pŸ\åƒ3—\Î\ë©C«\0¡ ¬V|]´w\ì\Ç\Î\nlŽF¾üY\Êö\ì\\®ôžŒ²\Óù¼;¦7oW/\æeM,_\Ì\âX\ÎLún\ß`0(%;A²Œ˜\Ëd²>\ØOß¨} \çv²\ä\ã@\ë\Æð\é`\'`¶\Ñÿ»¢\Ý\ÏEŸ_ü=\'øü°\0dÍŒù³®Ø°v £\ÇßŸ\ÆÌ¦¦5;ö÷0\Ö\ÆöŒø~7;Dc_*˜;R±}*@ò\å5ùŠÀ\æ©\ã¥lLòsRžŸ*\ßm\Ó„$\0\02ýûf»yŸ4O\Í{\Ç#«ˆR°JPòø°0£1\Æ\ÛC@®kÀ8+¶›Z}­Aó\ä\Ñ3{\ÌnEN\Ò\Ê\âbng6I\"\Ó\å±Ÿtq\\ü\æ`\ÞW£³[\ÓwPÁðÔžŒ¢\ß(MÕ¿ ±É¨xÁ%+¤U\ÆB+>‚ÿúº\ç/\Ïmx»*8>¿.\\õ”\é³¤¯©üú›“›‚\\]\r¿6@ùXH\ÛSŠ\Z)\Ø¤#c\r\Ù\ß\Þ\ß>]ÿò›¢ûj‚º\Ð=)œš¹-\èŽ\à\Û\Ç·Ÿ¼<;\0y„À)h÷\àø‚šû}ME±wg@²\ÐHK\æ\Õ¶ZEƒ\'DƒgEc—\Ýû\ï\r`¾Rñƒ¸ñ/\Z\0&\ëð\èd\äÑ®\ß$MÕ¿iô¿ôu\í\à\Ëö\Ú…¿øBð\é}Á¯‚ž¼;\'À8^½\ÐTG\ÐPp~V\Íý\Þ…­LV‚“ ,T\ß\n@\ÖºŒ\Æ.ˆ\ïÏ\íµqƒ\ãf7Ç?øv\Ð÷ƒ~tg\Ð\ÝA÷\Ôþ-§j2b\Æcû“ð\ß  ~|5øò\éðS¾½1øô¢\à\ÝeA\ç 1½\ÑD±\ÜBŸ\×\Ì\ÔÜŸÑ PªFH‚\â¯.ŒFü}\ÃõAy]\äF×³‹q\ã·½+\èýA º%\èÖ \Û\Zú\Èo9}t\nr\Îñ \0xk\ÐM\ro®Â«Ó‚Žõ¶¾\Æ\ê,m\Ü@z\î\å\Å\'\0$ýÉœ \Å|J4¨¬rT\Ð)qƒ§\Ç÷K\ã8U¼&hs\Ð\rA¯º)\è\r\Åö“Q´ó¥©úô¦\É(Ú¸\Åþ«\Z^<·\Ú\'C\å\Ã\ìl\ÌÔ¼F\Ðg*\êöL\0DO@òxš/š7\Ø7hCÐ‘A\'Ä±³c{~Ð…¹2\èùAW5ô‚ «\'£h\ã7JSõ¯\Ãdte\Â\ÅAO\r:o‚\är\ãûù+ªA\Z~\ÎhªU-ôtQŒû=]À\êo\Ð]\Z\r-\íšò ‡Šôˆ ƒN\r:#\èÌ ³ƒ\Îi¶R´ñ¥©ú\' ™‚N:9\èøhO°\Z´_Ðž¿jûÿ1¶ÖžÞž\î–j\ÒOO\árú3¶¨ !¯þµÊ‰ \r:¬ #~\Ë\é°)\è&E8P•£™\è[\Öðh~\ëWð™\Ñ\áv8ü\Æ1\Ím|\Ì\Ò:®nE\æ¹¤U\rÿ–Óª)\0{6\ã_\ÜX’9\rúôLC{z››\ÏjœÖœ†fÿ@óûº˜ý_é§§µº\ä1½Eº\Óû[N3¦ \ÉxsŸù?\r\ÜVò”\0\0\0\0IEND®B`‚',NULL,NULL,NULL,'anonymous.png'),('obj_login','hierarchy_cm',3,'Login',0,3,NULL,NULL,NULL,NULL,NULL),('obj_comment','hierarchy_cm',12,'Comment',0,7,NULL,NULL,NULL,NULL,NULL),('obj_photoalbum','hierarchy_cm',13,'Photo Album',0,5,_binary '‰PNG\r\n\Z\n\0\0\0\rIHDR\0\0\0\0\0\0\0\0\0L\\öœ\0\0\0tRNS\0\0\0\0\0¡7\0\0 \0IDATxœÜ½wœ\\gu7þ}\Ê-Swfvg«¤U¯.r\Å]ll\Û\ì\Øt\ç%”„B `J\Þ7?Ò\0N ƒlc\ã.¸I²Š\Õ\ÛJ\Ú\Õö6}\æ\Þû´\ß÷Î¬\ìPd’#}VW;³;s\ÏyNÿž3\ÄƒW›^x\èž\ç~t\ÛÄ½\0Iwõ®½\äMg]ó67™zµ\ß\×+A\äUÀ½_ø\ÔÖ‡\ï±\Ú\ÖmDxº8&Úºú®ú\ë¿]xò\é¯\î{{\èUÀ·~\í\É[ožRü\Ä7d‰ª¨F\ÙJ¶g\â/<P(Ž‰\×\\ó¶×¾\ëýÿ»U\á\Õ@qbô\ë\ï»&\Û+Ï¸:SÚ¿¹>5k» n®+6\ï¤Ý¿h\ì¦Òµd\ÅUÿ\Û\î¥+Œ1„W\ë­?z5p\ëG\ß3²÷ùu\ïé”³{ü™QP£A˜\Å\Ó\ËN©”s\ë0]ŸU\ë\Þõ¾×¾ûýÿ+e@_­\Þû\Ì\Ï·oX~n\Ò\â5oz0\ZJ\Âhh)K{6:r\çþ¤«oMüñ[þ\ã;~oib\Ìóª;­cK¯ŽxµÊ¿½ýb;\Þ8÷\í\Ù\Â\Îõ~Å³(  \Û!O¹Q\à6(·2«ÏžŽ=w\çc‰×¾ûý¯¹\æzc¥¯\Ú\Ñ9¶ô\ê\ÜÆ“\ßýŠ_+Ÿø†tcbX¡ –\r\0J@x\0 \0%Š;ž\Ì\Äö_ùñ\Þt·|ð+ÿt\çMõkU­õÿUx4\àðnû«w÷¯-?\Ë*\ìZOHd÷…\Ë¥\0c‘*\rcÀ-ðX¼m\Õ\Ù›É¶‡\nŒ%®ú\ëÏ­8wÿ\é^\áUÀ\×\ß÷¦ò\ÌÀ9\×\ç\Z£»DyWG< c\"¾‡A–\rBa4¬¦iJ-Y«œþ\'¿51;\Z¬½ôŠ\Ëþô£N\"ù?Z¯´ z\ì–/MÞ·â¼„ª\Ï4ffü\0¸1\0\Ñy\×\nA\0¸\ÊA¸\r\00Õƒ[\Õ\Ø3—~({ò¥Ù­\Þwó]?ø\Âf\0ÿs\Í\Ñ+ª\Åñ\áo|ðªtgp\Ò%\É\â®\rJ*0£Á8œƒ[\ã\ÑðXS\n\áÁr@(„‡X²©\n\ËÎ¨\ËÞ§¿7Yö\Ïz\Ë\r—}è£¯\Ø][zEð\Þ0±\Ë97d½\ÉAqªe\åƒ\0ñÄœ  \Ò\ZŒEñ¨ƒ`ÖœWhù§½\×\î;uû£õÝ—º—.ó\ß|¶{\éòW\ì^Ž½r&h\Ï\Ó\ìÜ¼ðTª\æ¦\0ˆ\0\"\0¡p\Ü\è9ºi‚Œc\à\0ð\Ð3JBIƒ ­ÌŽ\Ö÷<tòkýKþ¼ov\äÀ\Í7\ÞðØ·¿þŠ\ÝÎ±¢WH\Z\ÕòW\ßua,\í|i¢<°Í«øNJ3P\0”\"ðÀ8,;²H­ó®”„‡ðA),0 „FOp:Ú½§>ýý™Á­µ…kO½úŸ\Ít÷¼7uL\èÀÿñ/wýü¾S¯L15VŸ•n<bŸ’±´gsl5Âƒ‡1/\n„¢LÍ2hhX.(·R«×Šÿ\â–q\Ê\â—}è£§\\vù+p_¿?½8ô\Âs·ÿ\Í;œ\ä\Î_CJ¶µ˜ø°m tÅ­\ïûu81P\n­`9\0šJ‚Û†\à&¡Œ‚\å6U¡g™IŸø‹\ïN\ïk¬<\ïµW\â3n2y¼\ï\î÷¤WB\0_y\ç:¿1~\Ê“ñýªQ`4¸¿1§„@ø ¶Àr@i}Â‡o\ÊÆŽm\é˜›H¯Y·w=\Ù|\ï4¥ñ7\â3«\Î_w¼oð÷¡\ã\î„¿õ_+Ó£\Ë\ÎrµW”õ\nÀ‡R0N\0”‚\0 ,H\0Ñ©7­`L\ä{)ƒ‹\Ã-„\'GKh\0AJ@ûµ\â\æ–¬šz\ã\ÇÄ³\âöO|\ì/ÿ«W­\ï\Û|\Ùt|5 81|ófû\Øò³­ò\á\Ý~M\ÅQZË† d®G¤\0c`<²EG[\'4¼\n@(,2ô\Ì.Œ! \ÍeeºR+\Îy\áoó=\ÓmÝ½W\âÓ‹N9õø\Ý\éË¦\ã+[?v\ÝøþÍ§¼1\îŽøÅ‚VsŒ\Ö*ò½GG;„‚1øu\Ø¸ý\"óBHT/\"¶-AÈ‹žÓªG%À8EzÕ¹51\ï\á®L‰o|\ï\ënü?\Ç\ïf_G´õ\á»Gvm\ê[mY\åB«\Þ\é7 Ud\î­@ŠÈ˜¸q>\Æ£^\Ñ\0 |ÆR0\0\Ì³¢\nJ+ø5h(¨ò\î§yñ™7²\ç\ÄKr}\ë_}÷;\Æö\ï?~·ü2\èxi@£Z¾ù\Æ\ìx}\åyV\å\È~#E\è$C\ê4MyÀ‰\ÍE÷\ãƒ%ð<\ä:±\â°%\Ã\0tHv”Aú\àöœš»In·­>wv6ÿ\àu}ÙŸ}øœkÿðx\ÜõË \ã¥ÿ\Çgƒzeþ‰\Ü+Li!\0>´¥pb‘|\0s\0B‚z÷À÷1\ÔKØ³õjäŸ\0Àh(£A\è\Ó-7º0&R%\à× ƒ ¸\í±¸\Üô¶Z´\è´\ÔO¿ü\Åo~\èƒ\Åñ±\ãt\ï¿~\á\ÙÝ\ÝÓ³‚91Ñ˜ž\nƒnE¥…°\Ó\"¨\ÖrM\nH‰\á\0hË®û\Ë.8õõa†¼ï†’P\"úAB\ç\ØMyôºZE\âiuuHh²\0x\ã\Å\çðº÷8—~dÁ\èÞ­_}÷;¶<pÿñ¸ýß‰Ž‹ ú\ê{\Îókc+/°ý™¡F©N\éœ\ï\r\ë9±ÐŒg´%`^•F‚¼\æ½_Ý»ð†|œ¶\ï½cû÷>Ö¨”¥D¾VÀMDn`\Î{K\0°\È\0Z\ÂID\ÉsX\ähQ\ØÛ¡‰«I\î\äŸcbtwm\Õù\\ý\ÉO¿ŠùÚ±×\'¾û\Ï\Õ\é\Ñ\'1\íWd£nÙ°l¿y$\Ãÿ¶(L\0X\Æ {\Å\Ù\å•o­\n=RU^wúg6ôœp~,†Fû7c\êHô\ãÂƒ\0 U\ä«-v@2…$E¤2ˆÔ¢6´«±÷¾\Ë?œ9ï½»ñ\ä?¿\åªC[6s>ü–\Ä>û\Ù\Ï\Ã_Wœ8r\Ï\ß \ÝIóM}b0­ƒ¯58¥‘û\ršV>ÌªÁ\Ð~\Ô+\à¶{ÚŸ\Ýù|½ƒ0J\r\ÈRý\ç¿#³J\×%§\ÆP›E*u.)‹\"¢—£A#:\ïJ\0,|i\Þt2¨\ÙÝ»º}\ÅEKGvž¾ý¯Z™¿\æDn\ÛÇ¿\rc\ÜýÿO­8ºø\'u\àð\ê ŒG\\\Ö:Šv”·@i$ƒj  ûvÀœú\æ\ï\î»Ê“`”PJ%ŒÐª]x\Þ\Ò3¯¬\ÞT™\Z£@e–ƒdö¨D\Âu2(  Â¢—ž3YM…`\Ìaj\ê´?<\Ú\îú»\×oô‘E§œ–jo?†ùt,°õ\á;·>pK\×R\ê&|ov\Z00}T\Ñ&ð\"¦‡\Üó^\0û·¡\Ñ@\ç\Â\åÉ·~õP3±žQ\Â¡Úš“_t\Þ\r)\Ö(^ƒj\Õ’Y@x\Ñ\×*JÁ˜5g…\Â_kŠGRPÕ¨V\ï\è?£w\Ñ\ÙýÖ?ýý\0x%s\æcæ„½j\é\ß\ß{·*ý§\ÚØW×¶\Ëq97CQ\ZeU”¢Q\Ãô¦FA\Îù\È\íÏ´]¬\rlF,FmF,J,F,Jxó:\í0gð\É·½¯4r\Ð(¤³\è[†D¶•²Cjùa­ <X.(ƒð^$˜Â¬\Ð\í\êO.;ÿù{J[\ïŸ\ì^º\ì\êO~ºgÙ²cÂ™_O\Ç\Ì ?òõ\Ïõr\×R\åŒ\æœG\\\0 dt\ÃÂŽ1Q>l@0=\0KÎ¹zw\ç<ˆ&\'›ÿB\ZRWæ¿\æ\Ï÷žõ‡Ü‚’ÞƒñM‘ž\Ë\0¢H”Ys‰B\È}c\"\ÍÅ£¼‰Á™\ç\î:ý\Ò\àò/)ŒüÖ‡>ð\Ì]w+\æü\Z:6\Zpx\Û3w\Ýt}û´\Ï©±V\Õ,@\\w\ÎC\Ê \nü¥\ã‚\ì}\Õ\ÜDz\Å\ßü\â™FÍ©M‰\ÍH›µº\ÃöfDcƒ¹o&Ø’T=+\è\äùM½\në§‹\ä\Î{\ßñUŸ1–…ù«\à&ÀŽA+he-j}SP\"\nXC¥lQbþŠ\ä²sý\Ú\ÈÀ†\â\ÂSN½\æ“7\×þ\Ú1W-}û\Ï/iTG—œovR>\0­aY\ÖQýt­!|¸±¨\ZJŠ3Øµ\Ç9ø\Ê]\×*CFg\ìsú\ÜmV Qð?*~_};j0“@\ÍðTL´7‡EÝ¥úŒS½µ…»ÿbø\ÙûŽ‹l7òý°\Ü½C%ñ¨\Ûü«\é\0w@-»ó\ì\Ën³Ÿø\æ!±«?ù\éU\ç_pœ Á\Ç@\0O~ïŸž»û\Ëó\ÖÛ®û¥\Ùð\àSð0Dñ=8106910\Øüj5,<\á4\ç}÷\í,3‡\Ñ7.Iœ\Ú\írJ”Á¡òð­ûþ³x@\Æ„1  À”1\íÀ„I¨Ü‚ô\âeC\ãÅŸ}ž\é*l=+\È@ ”Á¯²¨d\r¼´X4@9¸\éG\Þ;¤\Ô\ây\×\é|õ\ÈðŽÊªó/xó\'nr“\Çöû\n`|`\Çw?zYª‹e}j\"Œ\ëB©(\äµ;4¸n\ìE¸’À\Ç\Ä¦\Æ@¹ýš\Ï<ñ“úb›‘\ëV¥N\ît@ )øõ\ÚöùBc\Æ0 \Ó0`¤\ãø0#\'{]\ç¹ü¡/ùƒ\Ï(\ÛFn>2\à6˜EAG³.X\ÃG…\Ê_d…Z–Š\ÇS]\ç\\¾óIõøº\É\ä\rŸÿ\Â1~_\'ü³o~†r´/P~¹(„ \ï‘ó\È\àø~0  \'a“+¼¨U05B°ü’?~\\.p\î¼\Ø\Ú.‡eð\Üä³“\É@I\á\ÉÀ“Â—B(A¥””¤JJ%„ªV+÷=¸ÿu\ïL¼öc†X\ÔBi£û#OÛ‚yi¿•¬ ó\Ì!÷\ÃEx–7d½2ò\è\íK\×L¾\ãK\'¦òú[ú\à1Ï™/l¸\çë£»7\ä\æ+£\éyœG%þ ˆB‘\Ü\Ù\Ô1%¡4\00Ž±a\0ˆ\çz+\çÿõLC\Ç,z\Ñ\Â\0eH \á+lž\Þ,””T ­¤”R) %)•’¾’¾”’R  )¥”B)i\ä¦\á§’–\äm_µ»O`Œ\Â\ÈÇ¡Dw\ßI\Èú°‚\rD°—\è\í  \0\à6\ìXô|)0½\åq\Ì>w\Ý\çW;  ö£¿û¿¿\Çþ;½|x\ÕÒ³wÿ«›\ÔÉ¬ô‹³hFŽJAŠH\å9\0)\à\Õ1¸.\0Œ\r£Zeoûç§¦9~,Æ©6\ZB)ÀžÙ\ÒVR+H)•PJ:RP%„R\n¡„”BJaK‘‘‚I¡\ä\Ô\ìøG~\\ûÄ™jˆeò4\Æ¢r\ãp\â\Ñû4:r  aD[°[±f,>T9´C\ÕFO}SOq|l÷/ž|\ÙLû\ïôòpÿ—þ\\\Ô+\í„¨\ÕBG\â5 (À¶h†­8/<z¾‡\ÃûQ«c\Ñk®x:ý:BHœ“uó]hC„†¯\à)L !ƒ†\røRBøR()”F\n\"%¤„”–)}\ÙT)ª\ê…\á\ç2—ÿ³{\Õ\í$\Õ\Ë,PŠò4j\Å\èÍ„z4¢·\Ç\í&ø…\Î\Æ\Ã‚ñH$ZÁ›™œB\ZÀ\Øþ}/›iÿøo~\Ê/£Á\íO\ÚôHºSQ*¼z=´øar‹¦*ø^ThG\ï\Ðtnƒû!%R¹ö\ê>?\\\Ñ.\'göº1Nµ!\Z\ZžBC™\Þô²Á\É]ð\0&00`\Ã\0c(@`¨„ñzš\Âdq¬\Ôü\ÓH½÷_ø3?uoA½•B\ßËšˆÇ£\ë¦*“\0¥ M‘h\È\0Z\àØ—\î_Žx\Õ\ÒOÿ\í\Ã\Ì6\éNT«¾Áicq\à(˜Iˆ3<šD™)ˆ¹Xsý§ž«µƒ\àŒ÷\Í\ËÐ\Ð4<…j`‚¸’ž\r%|)%”’‰\Ð)\È P\"PACŠš\n<%|))|)„Rñ J\'ƒ][‹O?\Ô\Û[<\ëË¾jcV=\n8¼Y“P\"\Ê\0¢4,\áAd»,m‹WyU  \à\Ø6^Ž\06\ÞûÕ™‘lO }_KIHt”Z½õðœ„‘(\0¯DU‡©1XºWù|ÿ\ruiV¶\Û×¬HP\Ðøxu…º4\å@§ƒå¢®„\'…PR\"+-…/e „/¥B)¥ô¥œÒ“Â—RJ!¤ôU\Æïœµž/ŒM÷\îú÷\á\'«+\ß\ZV­­¦:¶\ì{h\î0+šEP2r\Úa¿@þŒ\×S\'¶ù\Þq\0«/8–H¯\ß\ÙÜ¾\á‡_Œ§¥åŠ R!=\0‚\0FÃÁ²Á\0H  \ÆÀ´Žl\ë\Ì$`»½\â_vÍˆö¿aUJjø\n&÷g\ëÒ›²„%—5°a| 0\ÆŒ0P0\n\\šye7 ”AF\Ò\ÈÔ¡‘Brx|vªP)ù\Ó2«zÆ¿\Ì,\Ø1(E¥2\0\å`˜K›\Ã\Æ³`tttB=p;úóV<W\ÞQ9û\Ú\ëŽme\âwÀÏ¿ua&•D½Ž°\èh\".‡µ\Ï\Öøb\à\Ãv@)bq¿\é)0Š…½\ïŽú\"Jp\Ñ\Â¥\0!R“ <þ•À”<5Yc\ÕÉ”I˜X“û>À  (m^3.§\ÄÌ  ¬h\íwe!Ez\ÇF\Æf\'§\Ë\Åz-\É\Û\×U·Ú¬\Î-0\á\Ù\àÖ‹:øaZ‚YZz\0@ ¹“\×ù5ùð—eº{^w\ã{ \ß[ô» `\ã½ÿ1¶g}:\ï-´”\0Du¦g\Î÷\ÚvÔ\áGýú©  hl\ï\âõ\Ëÿ¢V61‹ž\Ýks(%4Ð¨ T*\Ò<=U““• \äJB\Æ7` ¼4F\ÊL Ÿš”CúR¶­\ã\ë\nloœj\Ñ\É\ât¹Ró½k3óû§\ï±Š8p´\ïõa\ì\Ø\ß[\Ýc%\Ðõšu,–zðùuõ¶¸\é˜wx\Õ\Òs?ü\'Ë•N2ju\á\ÃqAYdpŒ(´n–…M¤0ð<\Ôkbq¤\ßôÏ›\n\Ök\ç»\ï=¹-gJCHaS\rt\ÑSc%¿Ô1)”1Œ \0Ï˜\00\Ò@\Ã(@›ŠvŠ\×2›q:¯–ÎŠñŒ\îOVJq\ï\Üü\Ùg”¿É›A\à¨\ÓÝ¬ü„õjU#>eH\Í\ëN.XqpC\é\à\Æ\Ò\Ù\×^w<\Z5¿ƒ\0~úoõJ¶·¡<?rªÍªƒ1ð\Zpc\ànl.š!´R¢^·?\í\Í?g¾m\êš\åI\rÀ\æD\r\05aJ¾ž¬³5I(Y\Ò~\Òh\éY(c@a´\ã\Ú(e a†¥q›j­\Ñ:©\ébµ\æ§S=—\ÛÛœÙ£\ï\"ž’°\'\ê\0ˆ¾\â\èjh³4”=ñ¿&ù\Ú\àñ0>!ý¶Q\Ð\àö§m~(–ö‘R\ÈV\ÕA\Ê(`,\êsµò\á ˆ9œ¾s’©}§þý»OH_½<i\0\Ä9¡BU¢\"L\Ù7\ã1Zôk:¹/¹¶\ç|!¥Jp%ˆ5%jJ–¤ð”aB  ¥¤’B1¿ž‘‚(%•V ²Ñ®\íM\Ékr‹Vð‡Â 3Lzµ‚j§  oQM|u\ØF¢öu\æ„X,õ\è\ÍG‚º¾ú“\Ç\Þø„ô[ À«•úÚŸQ¦c)Oøð¢¢f\Ødo•\Û\Z\r ‰w£A\0)Á-¤.úÿb\éŽ\Ë\'\0‡Á\0R£.Qf\Ö3S59YŠ\risjY”PH¥S\ÒHYQ²*e]Š@IO\n)„³b!´HV•òl\Úo0x‡ê¥‡\Óê¼®s/·\Òf-6\n+ ˜ýK\Ú\0a\0Š$œ\Ì\ám=nÏ’ƒÏ—=_>N\Æ\'¤\ß\Ê=\ß\ÍÕ™\ád®®¤2\Ú?œ\ç²\à¸Q¹-\ÌÅ¤Œ²EB\"P«B*ô,=÷G±«¿tr[T.%\0ˆ¯BÇ‹¢™†\Z)\ãe?P&é²¤\Í÷N\n)ª0% \Ö@¹`TÁ$mgC•\â[\ëýAŸHòž·\ØûzFKM\à Œë›‘OP:”Ìž«††s\áZ!³úl¿¦~þ\Ã\Ç\Ïø„ô›0qp\Û\Æý‹\íŒÂ—!NV©-ÖB ‘\ç\ßÃ©Š„\Âžþ¥Ui7eS\0„@\"\r|…’@Á7\Ó\r5Vc%¿â«Ž”-´Ú´Å–¥Œ<c\Z@Œ\0 ÿ n0mIñž“¸nŒùò¯\æ­^m1¨Cp(¤¹nÁ\è)DmK£\çz÷ù\Ó\Ïe±Ô£_\êú\í\Í\È\ç8u\Ä~³ z\ì;Ÿ\ÕN¢¦¤\n|H  \0ñ(…\Ösx7û¨a.\0R\Â÷¡5\Ü²\ëþò{\ãù+–$\0h\0¾B%Œ;f\Zz²ª\Æ\ÊÁl]8«xª/\ãx\ÒH\Ã\Ê?—\r)\ê‘\ÑJ \"…R‚(‘”‚+¡•˜–A úÖ´\ÊÒŽd\áÂ®.¢·\rÚ‡ô’\ê&ep\â‘\î\n/Š;Y8˜\ß\Ö\ét->´©rxsõ\ìk¯[¸ö)eÇ˜ñMú\r\ZðÂ½ßšØ³\ÑMU\rc8Ÿ\ÓV\Ê e\ä\ÐZAž”\Ð*j~9@@  óÏ¤#dE\Î«YRO£ *\Ã\ã¯G\ËÁh\Ñ”Iºt¦&ò)§\Z(O\è\ËÖ¼\ã\äEg~a\ì=õZ\Ù<fd†\ZPÀÀ(ƒiX[zNGþd­ÜÞ·¥gb³0PM¦  FÃŽE,nU)kN8‘¨N µül¿¦ÿ\æ¨\ÝÞ•Zw\å\áÃ‡S©T.—;N)~\0‚jµð\ã§«g\Èz©}`\Þ\ì{‘Á!¦©± (››y\ßsõ\á?ú\ë>O\È¥†2Du‰ºD)0\Óu=RG\n^\ÉW\Ýig²,\éŒ mªžJ8”¬Î®ü‡\ÔŸ«>šš\ß3vxv¤P-\ì(mJ:,\Ùf\ê3•FZœó\ÖELV\n¢(n\\}òÉ‰¯ŠF\ÒkFúM5¡\ÌEIHN”\Ãf\Ñ|Ž\Ñh[su“}m4h\è7~ò\ã\åT\ï\Ö\Â\ÌR¿\Çc±\ØñÁ¯Àþ\Ûnó§§½½#©Ä¢úI\ã¾3\ã{´öh°\0\Ýi–ºB·lY0\0TEnø\Ó\rÁ\à —~^ƒùu‰ªD\Ñ3“59Rògj\"f±²§@°¬3^¬KOê¾Œ\rs\'¶L.9yÛ¾\Ë]‹œ\ÙÏ»O°\ãoK\Úu‰\Ñ\ê\ï<ý)\Ä\'&fŠc•‚_ò\Þ0\ï\Ò+\âw\nÑô¡$˜\ré‡½F\î\0¦™|‘z$\Ø\ÙN;¿hpKepkõ\Ô7½e\å©\'kc»\íË¢ppruw2“\Épþ2ø¿Š~eS~zÛ¶MŸúTP*=ù$Ä¼yú|\Ì\Ð\á\ØQƒ¥R@k\Ä\âP2\ÂÉ¶”B\" Ba»\à„\Â\ê¹dù·úNg9À”g\Æ*r\ßT\ãÀd½¨\î´sd¶qÁò¬k±Š\'\Ò.\ïi³OúñW–}\ã+\Ï>´\í‚Eq¬\nJ\êÒ î—Ÿ\Z¾ù¾·Œ\Õ\nùš¯¬®.¢\ë¥¯E\É-VX\í \Z \äE )¢Ic­9\í\n‰\Ü4\è$óoÿò7\ÜTŠJJ>\ÝS‚_--{zò\ÇV~¹ª\Õ_ü\"\é­[\Ã\ïÔ†‡\åý\å¾úš°÷ºb­›[M\Ôq¼\Ô-‡#D¡‘myhÿ/¬Œn,K3\ÛÐ£q¤\à•2\åòñ’¿(O8¼\ê+mÐž´3c{V\Þý¯ôL÷g»†% ð«0\Ò@¶“~Ý’;\Én3+ß¹ ™»žYð›3©-,¼¹\æW¨\r­~¤–‘uJ,;“:‰§n\Zj\Óòwlž\á\Ñv:ƒŒc\Î\ÈcaWf?z\Öš™ššB_\ì»\í6oz:¨\ìM\Ì/·D”Ë¸ÿü\íË•\Ï\Ãûq\Ü¨TT\Ò\ÍB®Õ¬\Ä)…F^R‚qÆ®\Ò\Ï^o¾³!\Õh\Ñ/T…Í©”À²\îD5P¾Ôi‡2r\Ê÷?$ 2*Sžœ¨+r¸ó™©þû\Þ\ã\r©¡4\î\Úþ‡¶^±\ìº7¥\ï$*n\ÎÞ„˜Ã£…\ÑòÀAS$¡gf©»½h[mh[m_\çºÍ\Þs÷\ß\Þ;2[S\ÚcÀˆY”4gv\Z¤»\ÖO³½ƒ£µZM‡ù\Û1ÀÔ¶m\Ã<”\Ê#O\ìwr˜wq\Ô`q\Z¥\rù+’4f-\Z¢ûqÝ¨J%ü\Z\Ö*üZ\ä¨9©˜\Í\×/:ò÷1H!M\Ê\á³Uq\âü”/u\ÍW®\Í\â.[ñ\ì—‡·Ë…\\ühºk`÷PA  )±k¨ñ\'§F*òs·x|\Ë\ìÁ™m?|ú\ïúc«>²to:Q#•‰(­\r0†\Ô@„Ž!”k†ÿ\0\Üþ\Óýºzú{“5\'·£\çRc`´¹ï¹±¾´ó±\ÝƒP\ä8+\ÅùôaÚ»þ\à±Q…—\ÂÓƒju\ãg>£\êõñ•\ïW‡Àc\è:õA$$P6\ÆŸ\êžl\'Ý‰\n©¶\Æ.øQ#\áü…V\Ýj>¤´‚›„°J¯Œ\Ê,¸x\ë¨iOÚ‹:•†T\Ò\ÌËº\Ùòž\Ó\ïû­™\Zl\è>«\ZOŽ¯¼x~\Æö$\Þÿƒ“œ\æ²VÂ¡¿\Ø<ó\ìÈ‡\Ä\Ôð_qùymwP†\Ò(ü2T\Í³f\Îp‡d!P7\Ä‡\È\ÜÄ²\Óx*ÿ\Ôw§Š£Á/\ßXr:6FcPm\È7M÷NZ˜J¹,Ü‡s\Ñ\'\ÓH*+U™N8\çüe{…—jÀž\Ûnó¦§g÷ð+Cˆ!df\'™zž,¿NUÀ\01À¥?õ²…\åa\Þ\Û\Ê|¾u\çy3Ìˆ\ânz\r*J\0`»p‹?8m\ä\Þ\Ü?v\êÂ¶J]y¾Î§\nzò¶Š‚\n¨J\Ó}÷]#\Ã3¡\\sng\Âe\Ð\è\Î9ó¬¯Ï®ÿƒ\åo¿<÷Mx%ø\0`\Í-¡[\n…QjX\ÙždGmxGmo\Çùñ%\Ð&\"ý}x\Ó\ä?÷ü\ÏLFNÁ \É\ÍYfI>u˜\Ï[hflr*‚—‡1|‘\0\nƒü\Ô+W§jB5!\Z\Ä¢\Æ0q/:¯\ï\âŠÅ¢øùx\ïzüÖ\0\0 \0IDAT®%Ds@ˆ(\Ø`Í‚bx\ÑÊ–M³F$|T¦!‡\ì:e\ìõk\ä\Ã.16¥1Î‚}xLh&Ku±Ð‘UyñbŸ\ÚB@¼~eöÓ¯Ÿ7?\íøjx¤ü\×\â\'|x\Õ@›[Wf‡\0\Ùs¶%,/‡Ù–@ýŠ*±xm\Ð\Ð\Ï\Ý1]µ³\Û:/6Ji¥›¬Ÿ…\ç\Ë\ÏÞº\çmÿ²mhª\ÑZ»$º\á¶\Ï\Û\\N\ì<<V©T^†Wx‘  \Úð_ð¦§Ç·\ïž‡ha@FK2¸ô^ˆLþ*â¾‘r\Ü,md…\á>c\àÿ-\ÕTJÁ²¢úh«ŒZ/Fj‚œwG\Æ\É[¹³\Í(Hü\àÁ„÷¼–\\ù¾V\ä{—\ÜÜµôDaˆE\á p\Æ\ç\åä¶]Lø´«Öµ\ß\Í(\Ê\Íi\04¬m\Ûje\ïÂŸ\Ã=P\nk\ÞZš\èxöû\Ó\Å1ù\äüw–¬|Xb2MÎ£iŽŒ1fdªþ½Ç†)Á\Ë3¡Å±(\æ%a\ÛöœqTÝµm\Æ\Øoo‘\æ4 :11»{wal¼R*kB5¥šRMH0 B4\ÈÄ½„]\×B\0`R“\Ï\ïM­\Ïe¼v\å–Aœ\âº/}U¿ 0†\â8,œc~õ/VN½3ƒ†Vfh\Ý[…–‚+QŸûGñ\ç\Æ,2V\Ñ{¦U\ÕWP\ß\áFoj÷%\Ë\Þ}Eû·9ƒ_Em&ú\ÍÂ‹~©U\îî™qxŽµ\Í\ÙY\Ù\Õ\Ø\×y~}ñ\ÚÜ‚\\~ig[o[[wº­«-–N¸)—ÛŒP\Ú2G/ÿñ®}WÞ´~\ïp5¬¬þ$\Î\ë2\É|\ïµô\Î\Ãã¿“*\ÌiÀ¶\ï~¯°ÿÀ\è\ÞRˆ\èôƒ¸Ð®1‚¥HSC¡\ÅW\Ãì…–¨\0pfŠÉ±\É\çk¼žw0\Þ,H„[  \0¯ÑœO\Ò,Gxð«H\çÁgºö_\r\ç{Eú…§,:X£]­û’ã¸‘c—¦\â\ë­\ã÷\Üÿ\ìÿ›\çœô¹3üþô£0}Â‹\Ö(nG<|\Ý(%­(0\Î\Â\×Áÿ\æT\Ín\ßy\ÖI,F1\ÊJ% „ÛŒYŒ;–\å\ÚvÌ¦œJ\0heÆ¦\ß{t¨Rg¬\È\Ú`Q2?Il+T…\é\ß^\æ4`|\ÇöZ­Vó<E™¢Tf(µ\r$¡\Æ4!qc4A…\Ð\ê¿ó¯z °ò\ädõÁ\Ù\Ü\ÐJ‹r\0œƒ±H!B·¬›\ÊÀv£\ÖZ ƒ/À«\Â(´‘=«§OÎ–>t\ÕM¢”øé©Ÿ[¾°ó\Ûú\â\ÃS¥†”r²zð;Ï¼E¼c\Õ\Ù+“k…ò8‚\ÆÉŽG‰•Ñ–!`®\åKšU\Þ{\"¬ø\Æ\Í\nOo;ñ]uµPZ(%¤–\áW©¤\ÒRký%4”G\Ìú\æx\ÝGv\ç4\Ðh-L™ó{\Ì÷½PKo;<Y*•”Røµ4\'\â\ÐH¡P–”K\Æ%\ãŠ1\ËEH•1E˜PB\ê„\nB8õ\ÈÁ»:\ík4Pd¹ŒG÷wm\é§\"Ö‚zK  ¥¢®YX\ÄÆ‹-• †w¡^¥Hð\ê\Ú\à-ž\Ùp\î\ß:§^4<Y=RhøJM••”wlyŸ7^ºh\Ù;®ì¹•h\ÔfQ™Š6ù½d›wXÀ\È„\0Ø¹\Ïô\înŒ\íi^p\áLf©–!Ç¥–R©¥\n¿£Õ‹d ¥\ÖR\rfqÀC£\Õ+>þä§¾þB¥&Ã›Š1œÝ…\Óû³ñùÏ\É#£cž\çýš\0i\Îm¹ý\Îñ±\É  Q…\ÊURR\âQ\Î`Zk‚\Z¥\0ÚŒ!eE\nûH\ïrdV`ü ,c*#W­P\í\ÚG#\ìJ†Ö¦•\"„\ÜQ*JZ~»Q‚Vˆ·R\äñˆÊ¦¬\ìÅ¹¶XÂ¢¥¢ÿú“:Ÿ\ZºyÃŽ\ïô9\'ü\Í\Ú`yvÀLˆ~g\äù\r‚Ft\Ý28a\ï%\\\î\æ|\Þ\éBð§n™)¡m\ãŠw\Zfm¥\Ìb0PBi¥µ2F\Z­Œ\ÑZK3¾{lj`²<VªL”k3• \æ+¡ŒÖ¡{Ø°k\æ\î\ÇOZ’\í\ïN„Ó„Iý)THü +O¦lbY\Ö/\Ýø>\'M·\ß5[,QjG¸VLkŸYš¸VÔ˜\Zcš¤1Ì˜¡!.Œ‚Ž!}6üA\Ä%P¼±©üHÊ™—“\ÉrÈ‹M^9fÍ©yU\áIsšÞ¯Ã¯\ÂI‚qt:\ÛQüÙ¨|]>Ÿ_ÓŸž©Þµñ\å¤ÿÞµW^\Ö÷_œ£2  ¿6gUB›¦u\Ä\å–H„…¡\Ñv§ü\Z\Ë>ÿ_¥Ò„üYû5µd7\ãL+­„\"„p‡;I—qF(UB*¡´2Zi$r‰X[\ÌI8”3­”lˆ 5_xÅ²\Û‡&\ê¬\írmNAoi‡\rª\ìðl\Õö‹®óK¼Âœ\06\Þ~\çt©\â\Ög¹\0\Ëb\Æ8Z””Z\ÆÄŒ–„\Ô(¥Æ¤`@\È\ä‘,½\Þ(Š4P«ùƒˆw.‰‚hF@Q<úß£U­ø\à”WF\"n£Íšhó:V[\áñy\ß\ßú\î™Á\ßðweRx˜œC´…s÷¤•\ÒeÍ•Œ­YI\'Cr\Ë\Ç÷û{Ÿª\íHœ¾;~\n\åœ\Ù\Ü(c´‘¾4\ÚÀŠ\ÙVÜŽg\â±Lœq@+C¥”N¹\ÍB·\ÌÀ#}Aƒ1\Û¿þ_ûVô§W.l_0T…Yô¹*\Ì \à¹\Ûïš®\Ô)\Ãõ,ð\çš2KIjL\Ã\â$¡$*Œ eª„(«‚`\0ùkP™ªˆ¨ø¾\ØW\È\Ó%•Ž³5¥°\í¹]ˆ!ï¤sùA„2Ò¨`¹`SZ\ì\Þ?6\Ûöüèž˜H\ä”\à„Îƒ\0¦\àU£jGˆ¬¢\ÍX‹h­sj%!Î™õ\"{\æûÅ²Iÿ<}¹4Œ;³™Q\Ú(m´ž\ÐR‹†\à®E)¥Œ:  §£;}\ÂI½\Ë\æúû\Ò+\åú{\Ó#£%\ßSFkP\Ê8#œim%\ÆÀó\äÚºg\æ/Y±˜ \Ý\Å\á\Z«’x\íð¶L&\ã˜Ïµ„AÀx`Ù†4\çœ3\ã£Á-I©k„&¤J¹$$¦%ðõÆ…  <²\ã,¼Ò°6!,  Ç¥¬?½7[_%\ÏQ¬<÷Z>\0¸ñ¹‰\Ép’ z4˜@º\Ù^pV¿¬óobò†új§wÞ¡Ê“\r\0‘\Ùi…7JBp“\ÍHŸÌÖµ\Â0w\ëO\Ê\Ò×·]\â\Ã2Z3‹†~5\\\Õ\ZC\Û&³IÛ\é<qsâœ´\'x.Îº{“=mn6a=ýÜ c1a³º¡²¸Šc.8¥\ëÏ®_}´±B¨¯\å\ìÙ³§¯¯¯­­­õÐœ.Ÿ[>·n–\åQ\îsK‚x”yÜ–ŒSme\rnBmc$h…2†§@…M\Èô½ @\çµP@\à@\0Lm\ÙM\î\Í\Äfº½F”…å°£KF@\Ô\Þ  /¢o“˜Œ\n\Ýëº¿ù\æw¸~\ÅQ\0°]´@WªÕŸhEœ!:¯Yþ\ä©IuO\ì÷\'\ÛÝµ£¬W+m´&\Íh\'Œ‚T£X­k™Œ[;8žvh>iu$¬ö\Ï\Åù\èpá£Ÿ~ðù}\ÓôþsO8±\Û3ð•\Ñ\é:Ò„\Óßøú\'\Ïy\äk—¬;µ»ù]\0\Øÿ\ÔýA¼$G›Ó\Ì\ÒÅª°\Ý\ç2¬ÁùÌŠ3‹C)#¶Í¥”„ŒkB\å+B\ëŒ( ¦4©ƒŽ6\È\Ä&£Æ°ò]˜½\ÒC \Z\"?jK^´\Æ\ï\ß  ¼hp#4\ßZE‹¼Ã‘Ê°±LjE\È}\È/¡H9 ¥±Èª´Px\"ˆ(4eÀÜ¬]kC·-“ž\ÞöP¥BR\Ï;g\Z­!\0‚š\Ç»uüF\ß\ÉŒ\ÆL¹±¼?7/N)Þž\ä¥\Éò}?\ÚVôõkÞ°¦§#~ßƒ{7lA\"†L\Å\n¦K¹¤ýÁ\ëOø“·®Ê¦mcH”\Ê*c_ B›-?þO^Ÿ^}\Úi\étúh\Ìù©‰É{g›«\Z|\ßg¶Õ¤l‡)I´–\rÀUR\Ò`\Ü2&n´ª”tž\ZTaö`Áµ˜„WE°ª\ï\×Ws\Î\ÙUÑ‘ÿ”As™\ÏQ…\ëV\\$|P‚\ê´‚ôQ\Zƒ_‹\ÞzÐŒ©Hs%¹–V\äš8Ý¶\Ü8™mV+S\êÁ\Øeš \'À\È  +£•i^h­\Ì\ÔL½8S[³´\ãþŸ\ì|z\ãpnY÷šS\æšý¯ûv\rMT1¯6G©F*w\\´\à\Û7{ùó]‡\áJ2RÃ¦i\ÏVrÁ4o[tbÒµV,\è\é\ì\ì<º±<\'Tg~Ë£O{Ò \áÜ¶\Ã\"±m\"„!Ð–\ÅUžrMiLK\nS¥\\’4šÁ4„\Ä`l‰™½\È\\\0›ƒOA5\0RÚƒÅ„¿\Ø\ËK_ù\á\rƒ\"B\æj\Ú\á\'0A\Õ8¤¿\ZùÒ°\Ì\Ð\ê7´\ÙP$­AaÕ\Æ\Ò:µh\ê \Ø\ÐxÁ:i\'_m~’ÊŠ\Ùßµ6\Ú/\0ˆV\Æ(])û““•Ì¼\\~EžxòÀý\ÓJh´% -\Ö.X”øÚŸ­ýÀ[Vd’šµ÷‚\ì¯Ù±¡~hg[Œ/\ëJO\"ie{ôø¾ööö_\î„sùŽ\ß~\Í\áÿþtƒBªÌŽY–VJrE˜eÓ„0\Æ,ø>eÂ¶l)\0\âQP\ê(Å\Ð\Z!–1®\"¤\ä£t/–g¬‹±ÿ˜0<Uj\êùývuQêœ¤JŽR\Z\áa(e,‚U‡–ª…±-UxZ°\Ö\ìŸð\ç¶2µ ˆh\Íý¦–JO\ïøY­L’Ù©FkC\0b@`LP÷\ç¡\Z\ß=N\Í-\ì4\nZ›tO\ÖZo0vh\×\Ø\ÄX\ÚÀ\æhKðŠ\×\Ï\ÄGßµ\ìúKRBZ¨¹ºÄ®\"¦«þ\äÀ®Ò‘ýq\Ç\Îd\Ò1\×v,J\Z„ZÎ¾}ûúûû3™\Ì/\0\çü5]8°w\àžŸmðõ\ÝXƒ3\É5WÚ²,\Å,ÍŒMi\0¢,”\ÙF\nB=Î‰1¶’Š\Ð*¥Æ˜˜–\Z¤Fˆ†IÀ\Ì<w\rz¯À\Ì#°<À\äžC©‰¬u\É<ñ°¢ƒ\îb,\Ú*\ZR\ë\Ó4¢§8Mø{\Ø=p\è{C‘ƒ 7Ja:—\ê\ì|¤.}ý3~g8Ì‹`”/´PÂ“µ™\Z\å$–‰k©œ„›_\ÖcÇœ‰©ê‘‘²4\0*\ã,;6ùž\Ë¿÷MK²)\ÛhÒ˜eŒ70¶\Çô®k\åR\Éölª«³=Ÿ\Ïï®º„`ÿS÷»RþJ\'LI¥Ro¾ñm“•\Ú\Ãv\Ëx¢,EÊùJ¹\Ü³4%”s\Î(!\ZhpK2\æJ¡AjŒBJB|B|À6p`\È\è.$fÉ•˜x…\0$\0¯PðP‰×­Qó÷2.8Í•­T1ða4\Üx„m\æ\0ZCx\Ñfi\ÛmN *0%šzã¤µ\Û1s(˜>,^ «‡\Ñ­bL2 0(\Ï4Šu\Æò\Ëz,\×\î^Ú\Ê%±u÷¸×Ð„ù>o¨«\Öfnºñ\Ì\\\Úa”†ý1¥1\ÒÀHŒ\Ü7±›Et{[<\ÓÖ–\Ïeºò¹2\Ï\îô l\Ï\ã?\Æö­:ýô—8\áÁŒc7~ð=<÷\ã{xzv¦`9–W­\',G3\ÛM9ÕŒÛ–m+\áSJ ´Á8ÓŠ\Ã(B*„Rc\âFi*È¨½×¡ò0\ÌXž\Ö\Êeù“½=k{½ó:Q™C‘ø0ˆða\ÓJßŒ†\àÄ£=|!¸³epdXr\Î!\ËøB\é\ë\ÝO4\ÊH¬\Ç\ÉFk d}(ƒ\âK(#\í‹ò\Æf[óµ÷-\ê¬øz\ÛÞ©™“˜­ò]VÍƒ4§­\È}ü\í+OX’eŒm™lƒLŒ\îyAÖŠ\éd2Û–\îl\Ïtu¶7s\Ð$ƒj­“¦³xý[\Z#û:cu÷\Åí‘—\â¼,\Ë\ê\é\éy÷\rWS\ÆoûÁ\Ï\êP¾kp[rDsNƒh\È\ÊPÊ‰es%%¡‚3E‰«•\"´N\ÃðThÓšƒxvÜŠ%W:‚\ÙMQx\Z—²òüñ–9&¼\Øxy\áF\ÆDY.š;l\'š  ­<o6Ü…ˆ¶ñ¶ö\Þ\Ã@¦\Zj\ïyÌ“yÄœ\ín\ê>ˆ1M_\r¤\'SmF¥u¥Tß¸kb\ìð,\n5(m\Ç«T\ë\Ê\Å>r\Ýò‹\Î\ì\æœ5t(ø\äp\Åryÿ\Æ_\ÕB*oÏ·w\æ²]\ív*7fRÕº,\rnaõÙŽóúz³G*&1o\ÅÈ¶Ÿôõõ%‰_)P\Ý\Ý\Ý7¾\í\êù=ù¸ùn\ÄE£m7F•°9•Ì¢\Ü6ZÊ¹e¥|\Ê\ç\Ìh”y”\ÙZq@Z£„i\ãŠ ˜™{‘?\r×¢pR\0\ê@c\Çþö\én÷‚N±dGy\×\Ö¦\Ñ\'MZ6ˆe\0¡[V\Í\Õs˜Ÿh,a¬\Üì œ[ô\Ê#º\Ð\0¢z Œ‹†¨\ÏÖ¤¯²»”T\ÒWž›žõQ,\"\Ð \ÄqLÊ¹z]\ß_µÔ²¡„B©J2Z!3u`\Ëså±¡D\"Þ“\Ïe³\Ù\î|.•\ÍM#]ñYqx_}t “Š\ç;\Ú;r™š¶\0\"ý\Æ\È\Ð\Ð\êÕ«;;;\0\0p\Î;::.{Ã…–m\ákw\Ì\Ë97\î×ª®e{Ì¶¹e´’ŒÇ˜E‰O‡e³À”J\ÊA¨\rFµ1IHCˆ¢šhþñM\ÐcXõ.L\ß \á¡¦\ã\ã\ã\ê\'qûª5f\Ñ^p²Xø\0‹ñ\æ\Õ\ê\ìK-£uÈ¤9]BQ…Nõ«À\ì}\Ê+›\Äsj\r³»”…\ÍEx¯Qª\Õgjv2–\ì\ÊJ\ê\Z^&­*ü\0\ZœQÛ¢Ÿ\Þù§o]–M9”RJ(£T‚\rV\Ùt5Ú·c\ê\Ð>\×\â\í¹lG®­+ß‘\Ée+<3ˆøÔõ‰¡dŒ÷uµ\çsÙ®\Îvž\Ì\î¬:õ\ÒÌŽû¿³¤/oY/Z£ö+¡¦œó\\.w\éE\ëzº\Ú?õ…oW§gøm¶ScvÌ²•ÒŒÌ²ešÛŒqŽÀ§\\X\Íð”qŸÐ˜’\Ä\'¨j\í\ZhBª 5“wš\×b\à`\áðU¹^÷\ï\Ú;\ïüe\Þ\ÚC\Úñ\Ü\æG7 \é\Â4\Ü|L)hkª´)­(Á\Î\Ì7\Ô\Þ÷¤¯Vg’t›kñz¡V™(\Ë@©@”\ÙVª«Çœ \è8«\Û\Ê\r(X 5\'.Lÿñ›¯\\\Ø\Æ9gŒ1\Ê@Ù¸Ç§|:2°\ç\à›g’ñ\\¶-\ß\Þ\ÞÑ‘“±\Ü(\â3\ÃC…Á=q†®l[¾=Ó•o\ç©Ì¨J4\Z–4\æ\Ðú‡:’öÊ•+ŽAñ7fi­kµ\Ú\Î\Ý{>ó\ß\Z8p$o].g-\â>ª•\\2F\Ë%\ÆfÔ­–9‹û˜>cÄ˜6\á[ZW)%Æ´iiiS#D\0i£cdÙ‹@\ì„\0\Ê\0ÚÄš¥Á¥“,]n¥\Ä\á–Û‰Ž¹u\Ô\ç6ŒÛ‘±2<!K\n£fÏ“Áfµ|}\â\\\ÊX\á\ÈLu¢Ë¥™m1\Ë\â1›R^)6üš0 X\ÔG¤±e)Ó‘¶\ßóý\ç\Üi[Ì¶,Ë²\ç%m\Ïtt\èðþ-\ë)t*oÏ¤;Ú³Ý*ž+’d¥0;±w+3A6\îÈ¶uuµ·er3HMúTL÷§t¬c\Þ™¬n{ô\Ì5K,Xpt&ü›W–c\Z\Æ\áÃ‡ÿ\îK·lÜ´\'i„+‚6ªE¡Ø™Š¡\\ta\\F\ír\ÑbŒR’¬W¹Ñ‚sWˆ¤ô%¡ˆ+™\ÐJu\Ç\è´\ÑÆ D@YzXû\Ú\0”{Þ¼ü\å\"\èš\Ð–U{œ£¶/¶vGŸÁ\ÚJ†Ë¥v¶ü$˜ñ\ãw\ÛWH7µ™ª\å:Üµ\rˆV¨WüZM\Zi Àz:,B\í@»Žué™xñ|\Û\æ¶e9–\Å-\îÁ™|llt`û\æz©N&r\Ùt¾=\×Ý™\'\ÉL…¤<!‡¶¯G£Ò–J¶\ç2]ù\\G{{‘¦&U¼<z¸0°½½-¾lñ‚KúŸ.¦f÷¬_\Ý\ÎW¯^\Ç[\ìýÍ›s  !œót:}\ê  K\'ggö\rO7\Ùu/ˆ\Ç\Ý `ŒY\\ù>‡ÀP!$·4e®\0\ZÜ¢@BKRaŒ¤Œ!@…\r’ü!ˆrgÁK@`å²µ—òd¿lŸ\rW†\å\nhJ!ƒh–z˜ÝNõi–<ðœ¬—\Ì¸ leC,‰\åX„3\0\"P…‚\çû\Z†@ƒQž°-ªp\Î  ¹¿ºa\É\é«\ÚÛ¶mÛ±mÅœñÀ-Ö¶o|ö\à¶M#ù\\¶·«³~o{wO#\Ö1\ãaxÏ¶‰½[\âœu\ç\Û\ç\Ï\ëž\××«’#¦mr¦8¼\éqUË¤Ý\í=]y\ã¤&>¾ùi‹\Ý\Ý\ÝG\à·\Z7 „¸®\Û\ß\ßÿñ?}WG¶\íö{ž¨r\ã\ÛnYšÛ„‹\Ã,0\Ë\0”qjY\\+Aˆ JIBJ\Ð\Ú\0uJ3šCfv¡­`]‰‰G0[\0b@P©\ÌþTf\ëkÉ™\Ûa+£A?ªñf~n\èÎŽI\ÖV\ZQ…Q½Y,‹u¥a¢lKUO\Ô\ë\n&\Ô C)gK{“\×_Ô·d~›c[®c;Ž\rnO)«T•û_xf\ä\à¾x\Ì\Éw\äò¹lWgG{G{•·Mh6±woaôPÒ±úº:ó¹®|NÇ²#&^œœ<ø,k”Ó©T{®£³=Óo÷œ\ì@Ù–\ãOŒ|÷\ï\ë+O[¶lY*•²›[\Â‡yÛ¶{{{\ßÿ\î·\æ2©ÿÞƒ4–,CÛ±„ <›s\É,Æ£i n9$h”)\ËbZÃ˜²ã¶’”V µŒv\0T!\05£÷\"*ƒE\á©\ßhTÙž\é ..\éxÅG+(Z…\è0/3\ëU9¸I–tl=\Öh6\ã  `\ê/0š0Ml—÷´\'®Y\×{\Æ\êœ\ãØ®c»Ž\Í§bœÙ²Ø½\éÈ=¥\í\ÙL.\Û\Ö\ÝÙ‘\ïh÷\Ý\Ì4KŽ\Ú;qpOÜµºsmùŽ\\wg‡“\ÊN™D¹Œ\ï\ß\àÏŒ·%\â¹\î®|G¶»#G™#*>:<:ð\ØßºÃ·,X\ÚfmÛ°!“\Étvv†\Í\á\ßm\àÆ²¬\Î\Î\Î\ë¯ycG®\í\ï¾z\×tµ\Ö\î\Ä|©\â–\ís\Û\â6‘Œ»\Ü\"O7ÜŽ~@™b\Ô\0\Öÿ_Ý™\Ëuœ÷ý\ë\Óg\ë³ôÙ—Y\î:—H\0”¨ˆ‘Š‰,o+\ÒC*%GU)»\\\å$vU\ì—]~ðC¬TÊŠKrbIeI1M\Ñ2$\Ñ!eŠŒLŠ´h‰\0 \Ûq7\Ü¸û~g\æ\Î>s¶\Î\Ã\0 ¤($ ô¯©™Ç®úþ}\æüúûº¿NY‚P‡\ã3`$IBm@  \Æ2¨\Óe3O¢\ÒGÚ„ý\ÐÀ\0rš\Ö&\×Y4¬ÿ²\Êú\Íæ’½6ˆ2`\"„ \'„„¥i\Z\Ã\í\ã±*£,cˆ‹3T²$C\00\0\Æ <6©øcö‡\Í\Ý½(J‘ \ìGxyqnþòd)\ÕÇ²<\Çö©v\rk\ÛkK[3¾E}\×\n<O5­*Ò·zhsþRck‰*j>p}\Ûò=K7\í\ÕD+t¦¾ó\'3\ßþ\Ï>…!D\Òc\0Ë³³‡\ßõ.Û¶û<úcŸxº¾Dø¥Ÿ³Lú\É\Ï½Q>\è±.¥6eA„8A\0Ž\Ïx\ày>‰£ˆ\Ã  /i\Â\0õ0q\×ñ4B¨…\È2‘¡±pX\åypÿW¡ö·\×ñ´Ð[ölý_õ\ÆWú×¯×¼pRŽ$­oeµ\í\ì|{h<c p­u3\Ä†\â$‹½{Œþ«ž3)‘%Q–%Yc^-3~wu\ë\Âë¯²$\ÖÅ¶lßµ\ÃÀu»É©µjy\í\ÊI·iQÝ±\Í\\\àZ¶\Ó\âõM&¯]™<X»ª\ÊB\à:¾c‡¾CM«\ÚjO>÷\Ücó\ßûBVó(8L²º\Ä\ê¤I«\ÕJ\Óô\'4\0\00Æ–e=ú¾÷þ  \Õ~ÿ_jv\ã†¨-@@E^L1ŸˆXÀ2Až’$B8\Æ±Œg,A¨…10FÒŒ!h\0—P\ÆÀ\æ-x\à\×a÷o¡×….\0U*\Íg»ð\ãü{®$ý\Õrÿ„Wjøi\ÄV.±ƒL>\Õ:„M±\Ép\n8p˜WE\Ì\'0`K~Ÿ?R 2‘ˆ$I’ˆ$µby·ü\æ\ÙÓjESˆ\á9ž\ë\äW7¯7¢ø\ê\å×š\Õ}“\êù|øŽçº±D7A\Ù[¾¶³8-\"ðmÝµ-\ßs\ÇnñôjJ¦_ÿ\êÄ·þk­˜\n\n¸\ZxH©<;=˜˜¦\âù’$\Ý\Üñ“w\ÎeŒµ\Û\í¥¥¥\æ\Ë—uH\ä82¹,®V=@­&¥±\"  b\í@À‡9­\Õ\à‹yž$‘\ZG  B1BZ“,MZIYFY\Æ\0\ê\0˜-³_……—¡µõž&<\ïÿ\Ü}\Ê?]K„zÿ®\çXô˜DW& ¶\'*\ï\Ý@!\Òõ\áf†y„Œq*‡>ò~\ï¾!JˆLdY!2/+1–*õ\ÖôÄ…\Í\åeE•Mª¹®úža;‰¤÷^xó\ÂÁö:\Õ5Ç¶\Ï}7#F\ri\å½\ÕÉ‹(\íº\æ\ÚV\à»9\ßiót7U\Ö\æ_¿ð÷ÿµ¶üªNÀRÁ\ÖÀÑ\Ê\Ü\Ö|±¼\æ%A^9ü\àñ‡~\ä‘Gòù|ßƒŸªu1c¬\Û\í®­­}ü3O\\xsµZyw÷+9JÒƒªœÆº,\âjE!KI»\Éa\ÑnKH\Ó\ÏóYf\Æ=Ž±&\Ça–™iŠk ”33\Æ\ëp’kÐ›† qc\\óØ¸öóu)·qR\Ï7ö\Ñ\Ê%t¶9ô\ÖœªFDAÀ+˜\ã\ÆQú\È}úû;D–Y&DVT5\æI«—\Ì\ÏL]™¼¬‰jšk[a\è9®²\Ñ¼:?·³z•H¼cYž\ë\äC+fƒSkõ\Æ\ÊÔ…¨u`Rj[4ðœ\Ðsb\ì¤J¥²ý\'\ë`ù¤.ƒ©££ƒ)s\ÕMog)ˆhŒ»ÅññCGŽ¸™½Í»£(Z__üÄ³_}\î”#¡¨R\r\Z\r)\î™D„JY‘D1¥V<ŸeZ§…8”pœù).\0\0iIDATõ\ä4‰8”\èI\"±,\è\0¨Y¦\0K\ÔŒ•ŽÀ\Ü\Ë\ß\×3R-\Ý  ñ}QšŠs¯¡J—<Qù@\É\Ø4dA\0$d1;\n³MªYRˆLT…#Zü\Ô\Ä\Å\Å+³1]W-\Ó\n}\×ó=^5cA\ÝZ]ZœšÁ²ŒÀu\ÂÀU\r»\Ãk\íhuör}wMW5Ç²\ß=W\Ô\Í\n([{;\ç¾õÉ•ó\'4¦\n®®.…Ú–»¹‹e‡\rŒ\Ú#¥‘‘‘±±±b±hÛ¶(Š7÷\ÇÝ™û¢(\Ú\Ù\Ùù\Êÿú\ßO~\ã»\\§CQ*\Ç]\Ü\é8Šì—©,Hi\"4\ë‚,‹½\éu\æ9`F·\Í1\ÖÁX\ÊR\ZGXq\Ë\Ì4\ÆÀd\à\02\n/C\Ú}kPR\ãÃ¥M¡\ÖÜ‡\Õ÷¯¥!p¼\âZñž?Œú¶JˆDˆ¬*DPõŒ“¦/]H\âXS\Ë4\ß\r|OÒ­T\Ò*\åý™óg8–š†\á»N8–\ã4±\Þ\Í\Ð\ÚÂ•\Í\ÅYª©ŽmøŽú.µ¬*hû­\î¥W¾0û½¿¡fª\àh\àQpu\èVÌ­«¹^B\Ó\Ò\Æ\àðÀÀ@©T\Z\îWƒ`‡\è»\Â$I’ýýý—^9ù\É/ü]\Òj:<cÍ¦¯½½=K¥4\Æõ\ZQˆ\ØiË½“$9\ê)Q\'\ãp†F=1M»—3“D`Y¡–e„± @Í±Ü£°þ2DÕ·\Ý}ðpl+“\Øy¥ó\ÂB¼›·‡CU!2Qd•I£Œ—v¶·\'\'.T*D‘-\Ãð=\'ô=Í²3Q/W*‹Ó“\íF\Í24\×qr\ëºN$\ÒGVf7fd‘·-\Ãw\í\\\àÙ¶]Cj\ä\é3O½þôIP3°tðuð( ®²{-¬µ¼$7¢Ž\n…ñññ~\èEÁÿ\ßq»c\ïûxú¡_þ $Iÿý‰o6\ê\ë\Z‚\Ô\æe™\çB‹XY·\Ë cž‡^„p\"ˆb\Ò\ÇS\Ü\ã0Ic@\ÐC\\!1\Ë\Ä[\n  ­-´ü<+}6^†ö\0@#öZO¤×“\ã/¿{L{\è~½?\åBˆ¦s\"i´Z§_}¹¼¿Oˆ\ä:¶\çZ\ïYŽ„6£xþüÙ½\Í5ªëƒ…0<\ßs9\Åhò\ÊÚµk«sSJ=\Ûô+ô]\Çq\"Q\ßy~â¥“\Ïük®9*8:¸<\nr*m\Ì\ä[53ö\å£\n¥Ridd$UUh\èûº\Ã7\éeYV¯\×\'§¦ÿ±\ÇË»“®\Ù\ÐQ¦¡,;¨^Ïž¦‰(\nr³.°xA\éu\ä$Š1FŒ™Q³¬\Åqˆ1+M0c-¤¿¢½Q\Ä\Zú\Û>­–¸qü(ø\ç¸÷\ì ÷pQyø05©ª(²¢M\×yIi´\ÚoN\\\\YZ’e‘jªc;¹Ð·]—#4Ax~\êòúµEJû¯\'ð=I3;¼Z\Ùß¿6óf¯\Ù0M\Ýs\ì\\\àž\Ë$ý\0ä¥¹³o¼ø§\Õ\å\×¶¾¾\ZöWüò–—øC\âÈ¸Ÿ/”J¥R©†¡®\ë?²·Ä¿Ê°ŸÁž¹2÷©ÏŸ˜˜^¶0Ã¶Å³¸RõujR\ZIkUs¸§Y‰#5Ž2Bjš(iš\0k#±Œc¬ß¦ C\0\Ø\êý‡{\ÇC+\Îñ÷¥®E…¨ª¢iš¬h½8™ž»r\ÓUÕ¶­À÷<Ï•t#þ\Úü\Ü\êµI\à-\Ë\n<\'ô=Å°\"Akwz“gOµ5“\êžm‡øŽ¤e¦T\Ë\Û\ß}\æ?mÏ¾ ptpu0 \×\Øv6¯†©rÃ‡\Ãá‘¾r¹œiš?Px¹{Àö\ê\ê\ê\Çÿ\ì\Ë&¯B«•W…\Î\Þ~¨V;\ÒX—\\­H(\Í\Ç!ÀX\ï´\Ä,\íažc©õñ_>cˆeý\è#`û^¸30\Ä)J\ç½r<]’e•UU4\Ã@X¸º¸pþ\Üy™B\Ë0|\ß\r_¡H\Ê\Ú\Êòü\ÌJS\Ó4}\Ï}:.µn\Ó\Î\îo®Ts,3¼\\\àÉš\Ù\ÂJ­\Ýù\î\Ó¿v\á)]KO‡À\0›p\Í]{ÍE7;\î†‡‡ûcšæ­ó\Î\Ð÷ Š¢/>ù\Ì×¾uÚ‘¹¸Zõ‰ tÚ¸\Û1‰\0•2\á±Lj5\Þ\ÂS  ‡µ¸G’8\â¸c\Ç2”±þC‹anüA\Æó\ÚE-J’¬ªD§T¥\ÕÕµó\ç\Îu:]BdË¤¾\ç¾§›&Z¥\\ž¼x±\×i\Z\Ôt]+ô]\×õÑ»Œ[ž›]½º J¢m¡\ïk˜fW+\í\î\Åü«\Ë\'ÿRbõ›¡÷\rˆªtg\Ù\ï 0-Œ™C¥¡¡¡ñññþ¾óz\æÿ£;\Üý\æ¦B’$‹\Å\ßùw\Óuõ¯Ÿ})ZRYp’AL±ˆ0‡\Ë8^$ˆº=3ž\çA=Œ»˜\ç²®\ï`À2Ž\0,‡C]\à\éýG\í\Ò!I–¨®‹²¼³³{i\â\ÒþÞžDdÇ¶=\×Ï´]Q\Ñ­\æ\å3¯ÔªUCWŠ…\\xž\Ãš\Ê\ÚòµÙ‰ó’$øŽún.ðl\ÛJEµÌ¤©\Ó\ß8÷âŸ±Öº£‚g@`@h\0kk«Aœ˜QqœŽ\Ü?88X*•=\Ïû  B=Po\ëòpž~\â/ž‰›m_\æ²Z-Ð¤\Þ\îž.p*\Êp½NYì´¥ndYŽzJ¯\Ó?¢Œ³g\Ç2®ÿÍ²%§¸m\Ä\Ð\ïÿµ\ß\ÐM‹(¤\ÕjŸ}\ã\ìúÆ†$Š”\ê–m‡¾\ç¸\Ñh7Jf¦&\×\×V©¦Ø¶“ó]\Ïse\Ýb\"\Ù\ÜXŸ™¸\0Yf[†\ç9¹À\\\'‘ô’VÏ½ô7¶\×M<|r&ð1)¯zÍº\Ù\Ëß§Ž.\nccc\Ã\ÃÃž\çý¿øò6õv=o\rpOQü\Ì\ãÏ¶š\í  :/F’\ÌcÀÀ\0XY¿…§N»~\ç\êÿƒ%š[£$H|\ì\ß\Úa\Ç\ÉÉ“¯---  <o†m™A\à{®CtqxvvnþÊ´B”|¾¾JM&)»ûå¹©×šµªiRÏ±sø.Gô&–—ÎŸyñ\Ï\Ë+g<r&h¿·\ä\×*N\ì\n<t\è\Ð\ÈÈˆ\ïûš¦ýô\r´\Þö\' ¯[ñ´R®Q.\ãš\r\re:\Ê\Òj\Õ\Ö¾\Õ¢®$\nr³!d \"Ÿ&8Ko|²\ZO.¹#²\"\à·ÿ=q\Ýé™™\Ù\Ù\Ù,cŠ¢˜&õ=\Ï÷<Ý°D…,\Î/\ÌLMñ˜7\r\Zn\ày†m!I\ëöz³““[\ë«&¥®k\ç\ß÷E7ºÙ¯nŸ~á³‹\Ïô´  ¡ †\È\×6\ê¦\ÙxôXX\Í\çó”\Ò;Õ»\ì.\0·\à\é\'?{bbf\Å\×n\Û$•ªG  \×l\n½Ž\Ò\ÇSaŒù,\á\Ó§ \Î2>K/\ê5Q5Œ¹\Ç\\X\\L\ÓT–‰I©\ç»~\à†Aueeuzj*IƒRÏ±\ÃÐ·G z039¹|ujš\ë\Øa\à…§Q\Za¥\Ù\í^|õ\És/–ptM\È[`+\\g\ß\Ü[³»\Ú\0+ñŠC}´\ï‡þÇ‚œ©»g\0Ü‚§üé¿º8½œµZy]\ì\î\îyª\Äw\Ú|·C‰\ÈU\Ê2\Ìñirý“¥5$^TŠX\â\Ó#%Œ9Q5Mw];ð}Û¶U«T+S“SÕªNuÛ²û\Ô/k4ahq~\î\Úüœ$‰Žm…¾¾aš™¨\ÄH<õ\â\ç/ŸzR„†­A`BÞ‚À„Ö¶UÞ°#\ÑMŠÇœÁÑ‘‘‘R©T,-Ëº³¡\ï\ë®\Z\0ß§O½ðQV«¹2ºm¾\Ó1‰•}\Âc sBšðI\Ìg©&3œ½\Íkb\Ñ‡rªªÚ¦\åûž\ãØº®\Çq|ú\Ì•JEUUÇ¶B\ßw=G\Õ\r^\"KKKWf¦ \Í,‹¾Ÿ\Ë29Y@¸|þù7^ú|\ÚÙ°\Ô\ë¡\ÏYÖ´½5·—Ù½Âƒ\æ\à¡ÁÁÁ±±±ÁÁÁ~\í\èúv\èV<U5\å+Ï\ä5½žD„—x>•o\â)\Ï1„\0K\0l0•¥\Í\Ðw]\×u]\×‡ÎŸ¿°²²JT%ô}\ß÷\ÂÀ\×ƒ—Iy¯|öÌ·³4µ,#ð\ÜÀ÷\\\×ˆs\â\êÕ‰\ï>û©fùŠ¥‚\\½”Ê»W\Üv×Š‚qu\ä\èh±x\èÐ¡>_B~2¾¼M\ÝmúE1—\Ëý‡_û\×¡ûØ—þ®\ÒK<¢¶»±*H=,bžã„¾ˆ!\Ôa|\'\æd\"{\ï\Ã2!T\×8Ž›››Ÿ››\ç0\ïy®\ç{ï›†!©Z½QŸx\ít\í jP\Ýw\Ý\\.ðGTÔŒ—×·¿ó\ì\Û_;oñ¡`C\Î9“ª\ËöN\Óèº‡\ä£\æó7“h?%_Þ¦\Þ\àž~\äW~A’¤O}\é™f7Jx©-H Q;(\ãy®}†P3eq\n²\"\ï\ï\ïs·\Ð\îlnnN©\ç\ØA\à[–¥hZE\çÎ¾±¾ºF©><X|\ßw]…R\äruçµ—¾¸p\é9ªÀ°¡  ,7·­=»g\àcG‹…±±±\Ñ\Ñ\Ñ0\ï_Þ¦\îö;\à\Ô\Ç\Ó7\'§þ\à±\Ç+•º\În5U–š\'&‘˜Db7»l¢&+¶b- IUE³-\Ó÷=\×q4]„\æ\æ\ç¯L\Ïhšf\ÛVø~\àQJ‘@:Q\ç\ÂÉ¯]~ý«j8\Z\ä,(\Øàª¨¾\å\Ôwõž^„\á÷„\ÅÁþ¬\Ï\år”\Ò\ÛL¢\Ý)½\ÃÀ\r<šžý½O|as\çÀj5U”\â¾\Ñz•­6¸\ÂtØ‘DÑ²L\Ïó\\\Ç\Ñ4M–å©©\é…\ÅAm\Ë\n\Ï÷\\\Ó4xIaþ\ÔSg^ù¢Èš¶y\Å5z°eô\ä|\\|·[\Z+\nwœ/oS\ï¼pO—––þø\ÓO\\š[K[­¢I\ä¸\×÷ \\öa\àPþø/½KS5×µ)¥²,///OM\ÏfY?µ\éoš†$+…É‹/œþ‡ÿ™u¶LŠ\äL¶²·\êÄ‚\ßóXC÷\ß,\ÒZ–%I\Ò\Ý}_÷„p\Ë‹Ç¿úÍ§þþ\rM\âLr\Ü“¨S\ïM­Ä£÷\rü›\ßý¨(\n²,\ï\î\íMNN\×j5ƒR\ÏwCß·,KQUÀü\Úò›§ÿ\áñýõ‹†z}\Ö\ç-\àºJ}ËŒ˜\Ñ\Î=L‹\ãCCC£££CCCŽ\ã¼M=\Ño_÷Š}õ‹ûŸxö\Äó§U”\âHŠ{Ýƒ\Î\ìb\Ûtµò/\ÚA\r\Òu\Õq\ÜÀ÷\\\ÇV5\róB£¾÷Ê·þ|}\áUG¡`AÁbs\×l¶­®{˜/\n\ã\ã\ãýÐ«ªú¶ò\åm\ê£ ª>žþöo|t¨\àÿ\é\ã\Ï3I\Ê’-.\ÎÚ•½&F\\»\Û\ÑtÍ¶m\Ïsl\Ë\ÖuM”¤8\ê¾ôÜ§.¿@  º³ o‚­\àÚ†½\Û\Ò{f d¤\ï\ç/d‘ö.\ë\Þ2\0¾O?÷•ç»Bz\í8nBi|D’e\Ë2uM“$)Ž;¯ÿ\ã\×\ß<ó´\Ír,°\îUô½5½eÝ‡Žƒ¥Rill\ì.ó\åm\ê\Þúº©›xú‰\Ï}­|\Ð,¯l-TÇþ\Ö~Œ\çyQ1\æ&/~ûä‹Ÿ\ã¡i©\×\Ñ\Þ\×P\Ö\Ô¶H‚‡üR\ís¹œaw™/oS÷¨p\Ëñ´\Ï>ñô\Ôü\æÌ«k,\Í~ó?~pd\Ü\Þ\ÚX¼púé¸µm«\à7Á§\Új»¬G‚\ÛÎ¿\ß-Œ\ÜL¢ý¸EÚ»¬{\×\0¸%{ú\Ø\ç¾ò\ê÷®¬N\í1ùg\ÏpB\r\\Ÿøð1i\í\ëm.Œ\Üc´xÿ\Ð\ÐÐ¡C‡,\Ëzû’hwJ÷´pKöô\Ë_ÿ\æ_\í\Ô\ê\Ô\0<8º3\Ú=E\êU¥Ú¶‡Ž©Gû|y3‰v‡¾¯{Ý¾úxz\êô¹\ßx\åÜ™\ån½‡Y\Æ064üÀý\î{)‹×‹´®\ë\Þ#|y›ú\Ù0\0\0’$©V«++«“\Ó33ó×¢N\ÛÐ‰®©Ž\ã\r\rõ‹´÷_Þ¦~f«\åjµZ.—›\Í&BHUUJ©a÷ _Þ¦~–\è‹1–$I’$\0 ÂÕ¬ÿ\Ôÿþ\Òk- ¤²¥\0\0\0\0IEND®B`‚',NULL,NULL,NULL,'album.png'),('obj_photo','hierarchy_cm',14,'Photo',1,1,NULL,NULL,NULL,NULL,NULL),('obj_video','hierarchy_cm',15,'Video',0,2,NULL,NULL,NULL,NULL,NULL),('obj_group','hierarchy_cm',16,'Group',0,3,NULL,NULL,NULL,NULL,NULL),('obj_wallpost','hierarchy_cm',19,'Wallpost',0,3,NULL,NULL,NULL,NULL,NULL),('obj_web_link','hierarchy_cm',20,'Web Link',0,3,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `object_type` ENABLE KEYS */;
UNLOCK TABLES;

LOCK TABLES `object_link_type` WRITE;
/*!40000 ALTER TABLE `object_link_type` DISABLE KEYS */;
INSERT INTO `object_link_type` VALUES (1,1,1,'Friends','',1,1,1,0,1,1,1,0,0,1,0,1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0,1,1,1,'Add a friend'),(3,1,9,'a person personality','',0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,NULL,NULL),(1,13,18,'Photo Albums','',0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'Create a photo Album'),(13,12,19,'Comment record under Album','',0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'Post a comment'),(13,14,21,'Photo under Album','',0,0,0,0,0,0,0,0,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'Upload photo(s)'),(13,15,22,'Video under Album','',0,0,0,0,0,0,0,0,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'Upload video(s)'),(3,16,23,'a group personality','',0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'Create a group personality'),(14,12,24,'obj_photo to obj_comment','',0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'Comment on the Photo'),(1,12,25,'Wall','',0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'Make a wall post'),(12,12,26,'obj_comment to obj_comment','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(16,19,35,'obj_group to obj_wallpost','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(16,12,37,'obj_group to obj_comment','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1,16,55,'Group Memberships','',0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'Join a group'),(13,13,56,'Sub Album under Album','',0,0,0,0,0,0,0,0,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'Create a sub Album'),(14,1,57,'Photo Tag','',0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,'Tag a Person'),(12,20,59,'Comment Web Link','',0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'Add a web link to this comment');
/*!40000 ALTER TABLE `object_link_type` ENABLE KEYS */;
UNLOCK TABLES;

