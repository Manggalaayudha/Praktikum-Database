/*M!999999\- enable the sandbox mode */ 
-- MariaDB dump 10.19-12.3.2-MariaDB, for Linux (x86_64)
--
-- Host: localhost    Database: mediumdotcom
-- ------------------------------------------------------
-- Server version	12.3.2-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*M!100616 SET @OLD_NOTE_VERBOSITY=@@NOTE_VERBOSITY, NOTE_VERBOSITY=0 */;

--
-- Table structure for table `article`
--

DROP TABLE IF EXISTS `article`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `article` (
  `article_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `status` enum('draft','published') NOT NULL,
  `body` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`article_id`),
  UNIQUE KEY `slug` (`slug`),
  KEY `user_id` (`user_id`),
  KEY `idx_article_status` (`status`),
  CONSTRAINT `1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `article`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `article` WRITE;
/*!40000 ALTER TABLE `article` DISABLE KEYS */;
INSERT INTO `article` VALUES
(1,70,'tips-awm-di-ff','draft','Konten untuk tips awm di ff...','2026-06-12 14:32:36','2026-06-12 14:32:36'),
(2,70,'how-to-get-better-at-coding','published','Konten untuk how to get better at coding...','2026-06-12 14:32:36','2026-06-12 14:32:36'),
(3,70,'tutorial-coding','published','Konten untuk tutorial coding...','2026-06-12 14:32:36','2026-06-12 14:32:36'),
(4,44,'tips-and-trick-bermain-r6','published','Konten untuk tips and trick bermain r6...','2026-06-12 14:32:36','2026-06-12 14:32:36'),
(5,41,'sinergi-terbaik-di-mcgg','published','Konten untuk sinergi terbaik di mcgg...','2026-06-12 14:32:36','2026-06-12 14:32:36'),
(6,57,'meta-push-rank-di-ml','published','Konten untuk meta push rank di ml...','2026-06-12 14:32:36','2026-06-12 14:32:36'),
(7,57,'hero-wajib-ban-dan-counternya-di-ml','draft','Konten untuk hero wajib ban dan counternya di ml...','2026-06-12 14:32:36','2026-06-12 14:32:36'),
(8,43,'cara-tebak-arah-rotasi-zona-di-pubg','draft','Konten untuk cara tebak arah rotasi zona di pubg...','2026-06-12 14:32:36','2026-06-12 14:32:36'),
(9,43,'tips-menjadi-igl-yang-baik-di-pubg','published','Konten untuk tips menjadi igl yang baik di pubg...','2026-06-12 14:32:36','2026-06-12 14:32:36');
/*!40000 ALTER TABLE `article` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `claps`
--

DROP TABLE IF EXISTS `claps`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `claps` (
  `clap_id` int(11) NOT NULL AUTO_INCREMENT,
  `article_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `count` int(11) NOT NULL CHECK (`count` between 1 and 50),
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`clap_id`),
  UNIQUE KEY `article_id` (`article_id`,`user_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `1` FOREIGN KEY (`article_id`) REFERENCES `article` (`article_id`) ON DELETE CASCADE,
  CONSTRAINT `2` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `claps`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `claps` WRITE;
/*!40000 ALTER TABLE `claps` DISABLE KEYS */;
INSERT INTO `claps` VALUES
(1,2,44,25,'2026-06-12 14:35:34','2026-06-12 14:35:34'),
(2,6,41,50,'2026-06-12 14:35:34','2026-06-12 14:35:34'),
(3,9,57,10,'2026-06-12 14:35:34','2026-06-12 14:35:34'),
(4,4,70,5,'2026-06-12 14:35:34','2026-06-12 14:35:34');
/*!40000 ALTER TABLE `claps` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `comment`
--

DROP TABLE IF EXISTS `comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `comment` (
  `comment_id` int(11) NOT NULL AUTO_INCREMENT,
  `article_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `body` text NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`comment_id`),
  KEY `fk_comment_article` (`article_id`),
  KEY `fk_comment_user` (`user_id`),
  CONSTRAINT `fk_comment_article` FOREIGN KEY (`article_id`) REFERENCES `article` (`article_id`) ON DELETE CASCADE,
  CONSTRAINT `fk_comment_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comment`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `comment` WRITE;
/*!40000 ALTER TABLE `comment` DISABLE KEYS */;
INSERT INTO `comment` VALUES
(1,2,44,'Joss bang, sangat membantu buat beginner kayak saya, daging semua kontennya','2026-06-12 14:34:51'),
(2,6,41,'Setuju sih, hero tank sekarang lagi OP banget di update akhir akhir ini','2026-06-12 14:34:51'),
(3,2,70,'Sipp bang! Intinya kalo konsisten jangan kosong dua hari berturut-turut.','2026-06-12 14:34:51'),
(4,8,43,'Wkwkwk Zona pubg emang gampang ketebak arahnya','2026-06-12 14:34:51'),
(8,5,41,'Artikel yang sangat informatif!','2026-06-23 06:56:41');
/*!40000 ALTER TABLE `comment` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_uca1400_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER trg_after_comment_insert
AFTER INSERT ON comment
FOR EACH ROW
BEGIN
    INSERT INTO comment_log (comment_id, article_id, user_id, action)
    VALUES (NEW.comment_id, NEW.article_id, NEW.user_id, 'INSERT');
END 
*/;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `comment_log`
--

DROP TABLE IF EXISTS `comment_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `comment_log` (
  `log_id` int(11) NOT NULL AUTO_INCREMENT,
  `comment_id` int(11) NOT NULL,
  `article_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `action` varchar(50) DEFAULT 'INSERT',
  `logged_at` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`log_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comment_log`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `comment_log` WRITE;
/*!40000 ALTER TABLE `comment_log` DISABLE KEYS */;
INSERT INTO `comment_log` VALUES
(1,8,5,41,'INSERT','2026-06-23 06:56:41');
/*!40000 ALTER TABLE `comment_log` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `payment`
--

DROP TABLE IF EXISTS `payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `payment` (
  `payment_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `amount` int(11) NOT NULL,
  `payment_status` enum('pending','success','failed') NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `expired_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`payment_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `payment` WRITE;
/*!40000 ALTER TABLE `payment` DISABLE KEYS */;
INSERT INTO `payment` VALUES
(1,70,15000,'pending','2026-06-12 14:33:38',NULL),
(2,70,15000,'success','2026-06-12 14:33:38',NULL),
(3,57,15000,'success','2026-06-12 14:33:38',NULL),
(4,57,10000,'pending','2026-06-12 14:33:38',NULL),
(5,43,20000,'pending','2026-06-12 14:33:38',NULL),
(6,43,30000,'success','2026-06-12 14:33:38',NULL);
/*!40000 ALTER TABLE `payment` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password_hash` varchar(255) NOT NULL,
  `membership` tinyint(1) DEFAULT 0,
  `role` enum('user','admin') NOT NULL DEFAULT 'user',
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=71 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES
(41,'Zuyi','Yi@gmail.com','$2y$10$KumpulanAnakRajin',0,'admin','2026-06-12 12:25:02','2026-06-12 12:25:02'),
(43,'Jaya','Jaya@gmail.com','$2y$10$presentasiahhbasisdata',1,'user','2026-06-12 12:25:02','2026-06-12 12:25:02'),
(44,'Adung','Dung@gmail.com','$2y$10$StickerMemeCukurukuk',0,'user','2026-06-12 12:25:02','2026-06-12 12:25:02'),
(57,'Mangga','Angga@gmail.com','$2y$10$OndeMande',1,'admin','2026-06-12 12:25:02','2026-06-12 12:25:02'),
(70,'Udin','Udin@gmail.com','$2y$10$tintingtungtingtingtung',1,'admin','2026-06-12 12:25:02','2026-06-12 12:25:02');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Temporary table structure for view `vw_article_summary`
--

DROP TABLE IF EXISTS `vw_article_summary`;
/*!50001 DROP VIEW IF EXISTS `vw_article_summary`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
/*!50001 CREATE VIEW `vw_article_summary` AS SELECT
 NULL AS `article_id`,
 NULL AS `author`,
 NULL AS `slug`,
 NULL AS `status`,
 NULL AS `created_at`,
 NULL AS `total_claps`,
 NULL AS `total_comments` */;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `vw_article_summary`
--

/*!50001 DROP VIEW IF EXISTS `vw_article_summary`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_uca1400_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_article_summary` AS select `a`.`article_id` AS `article_id`,`u`.`username` AS `author`,`a`.`slug` AS `slug`,`a`.`status` AS `status`,`a`.`created_at` AS `created_at`,count(distinct `cl`.`clap_id`) AS `total_claps`,count(distinct `co`.`comment_id`) AS `total_comments` from (((`article` `a` join `user` `u` on(`a`.`user_id` = `u`.`user_id`)) left join `claps` `cl` on(`a`.`article_id` = `cl`.`article_id`)) left join `comment` `co` on(`a`.`article_id` = `co`.`article_id`)) group by `a`.`article_id`,`u`.`username`,`a`.`slug`,`a`.`status`,`a`.`created_at` */;
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
/*M!100616 SET NOTE_VERBOSITY=@OLD_NOTE_VERBOSITY */;

-- Dump completed on 2026-06-23 20:01:32
