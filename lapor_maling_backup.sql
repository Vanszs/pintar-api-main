-- MySQL dump 10.13  Distrib 8.0.42, for Linux (x86_64)
--
-- Host: localhost    Database: lapor_maling
-- ------------------------------------------------------
-- Server version	8.0.42-0ubuntu0.22.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `activity_logs`
--

DROP TABLE IF EXISTS `activity_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `activity_logs` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL,
  `user_role` varchar(20) DEFAULT NULL,
  `user_name` varchar(100) DEFAULT NULL,
  `action` varchar(50) NOT NULL,
  `table_name` varchar(50) DEFAULT NULL,
  `record_id` int DEFAULT NULL,
  `old_data` json DEFAULT NULL,
  `new_data` json DEFAULT NULL,
  `description` text,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `idx_user_id` (`user_id`),
  KEY `idx_action` (`action`),
  KEY `idx_table_name` (`table_name`),
  KEY `idx_created_at` (`created_at`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `activity_logs`
--

LOCK TABLES `activity_logs` WRITE;
/*!40000 ALTER TABLE `activity_logs` DISABLE KEYS */;
INSERT INTO `activity_logs` VALUES (1,1,'superadmin','Super Admin','LOGIN',NULL,NULL,NULL,NULL,'User logged into the system',NULL,NULL,'2025-07-25 01:40:30'),(2,2,'admin1','Admin Satu','CREATE','users',5,NULL,NULL,'Created new user account',NULL,NULL,'2025-07-25 01:40:30'),(3,1,'superadmin','Super Admin','UPDATE','laporan',3,NULL,NULL,'Changed report status from pending to approved',NULL,NULL,'2025-07-25 01:40:30'),(4,3,'admin2','Admin Dua','UPDATE','laporan',7,NULL,NULL,'Updated report status to rejected',NULL,NULL,'2025-07-25 01:40:30'),(5,2,'admin1','Admin Satu','DELETE','admin',8,NULL,NULL,'Deleted admin account',NULL,NULL,'2025-07-25 01:40:30'),(6,4,'petugas','Petugas Kelurahan','CREATE','users',12,NULL,NULL,'Added new citizen data',NULL,NULL,'2025-07-25 01:40:30'),(7,15,'admin1','testt','LOGIN',NULL,NULL,NULL,NULL,'User testt logged into the system','::ffff:127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36','2025-07-25 01:42:40'),(8,15,'admin1','testt','LOGIN',NULL,NULL,NULL,NULL,'User testt logged into the system','::ffff:127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36','2025-07-25 01:44:00'),(9,15,'admin1','testt','LOGIN',NULL,NULL,NULL,NULL,'User testt logged into the system','::ffff:127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36','2025-07-25 01:44:28'),(10,15,'admin1','testt','LOGIN',NULL,NULL,NULL,NULL,'User testt logged into the system','::ffff:127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36','2025-07-25 02:15:10'),(11,15,'admin1','testt','LOGIN',NULL,NULL,NULL,NULL,'User testt logged into the system','::ffff:127.0.0.1','Mozilla/5.0 (X11; Linux x86_64; rv:141.0) Gecko/20100101 Firefox/141.0','2025-07-26 07:12:48'),(12,15,'admin1','testt','LOGIN',NULL,NULL,NULL,NULL,'User testt logged into the system','::ffff:127.0.0.1','Mozilla/5.0 (X11; Linux x86_64; rv:141.0) Gecko/20100101 Firefox/141.0','2025-07-26 07:12:58'),(13,19,'petugas','Petugas','LOGIN',NULL,NULL,NULL,NULL,'User Petugas logged into the system','::ffff:127.0.0.1','Mozilla/5.0 (X11; Linux x86_64; rv:141.0) Gecko/20100101 Firefox/141.0','2025-07-26 07:13:22'),(14,15,'admin1','testt','LOGIN',NULL,NULL,NULL,NULL,'User testt logged into the system','::ffff:127.0.0.1','Mozilla/5.0 (X11; Linux x86_64; rv:141.0) Gecko/20100101 Firefox/141.0','2025-07-26 07:16:17'),(15,15,'admin1','testt','LOGIN',NULL,NULL,NULL,NULL,'User testt logged into the system','::ffff:127.0.0.1','Mozilla/5.0 (X11; Linux x86_64; rv:141.0) Gecko/20100101 Firefox/141.0','2025-07-26 07:16:36'),(16,15,'admin1','testt','LOGIN',NULL,NULL,NULL,NULL,'User testt logged into the system','::ffff:127.0.0.1','Mozilla/5.0 (X11; Linux x86_64; rv:141.0) Gecko/20100101 Firefox/141.0','2025-07-26 07:17:22'),(17,15,'admin1','testt','LOGIN',NULL,NULL,NULL,NULL,'User testt logged into the system','::ffff:127.0.0.1','Mozilla/5.0 (X11; Linux x86_64; rv:141.0) Gecko/20100101 Firefox/141.0','2025-07-26 07:18:56'),(18,15,'admin1','testt','LOGIN',NULL,NULL,NULL,NULL,'User testt logged into the system','::ffff:127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36','2025-07-26 22:28:21'),(19,15,'admin1','testt','LOGIN',NULL,NULL,NULL,NULL,'User testt logged into the system','::ffff:127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36','2025-07-26 22:43:42'),(20,1,'superadmin','Admin Simokerto','LOGIN',NULL,NULL,NULL,NULL,'User Admin Simokerto logged into the system','::ffff:127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36','2025-07-27 02:42:44');
/*!40000 ALTER TABLE `activity_logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `fcm_token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `session_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `session_start` datetime DEFAULT NULL,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `role` enum('superadmin','admin1','admin2','petugas') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'admin1',
  `pending` tinyint(1) DEFAULT '0',
  `phone` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin`
--

LOCK TABLES `admin` WRITE;
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
INSERT INTO `admin` VALUES (1,'admin_kelurahan1','$2b$12$1GYwIhE9rdtX/7Db11Moi.ir4gNzVFR3xqoSDnV82Rs3nLWggyieW','fPA93-bNQIOaEbb67zOdhu:APA91bGNZbknGro3HZO4Ps3qypLIL5JPm07fhm7Jn5Apj8tOm5fzW0Ry7VbznwUhZrVZShL1uZHGzU5MkIe_3emZxEzpo_JBRYo4ljUOTi2vWkE-DJsPp54','session_1752175486012_1','2025-07-11 04:24:46','Admin Simokerto',NULL,'2025-07-02 14:21:23','superadmin',0,NULL),(5,'admin','$2b$12$u.nPXKO4Wx79SpuNPp7rWOi8kdarEQFqexKsUdDF91puBLXKwCf7y',NULL,NULL,NULL,'Bevantyo Satria Pinandhita',NULL,'2025-07-05 04:54:07','admin1',0,NULL),(7,'bu_lurah','$2b$12$2K3/EmFrVlJu8AmT0H2dYe9u5OWboP2MjS4dK3iE87mV/2bNPJNHq',NULL,NULL,NULL,'Bu lurah',NULL,'2025-07-07 04:47:54','superadmin',0,NULL),(10,'melisa_admin','$2b$12$4EIgxg04RcJzHLmkU993quFHKjA5vi06FnHVNgGxKfGYGl48RjdxK',NULL,NULL,NULL,'Melisasa',NULL,'2025-07-10 19:27:56','petugas',0,NULL),(13,'kapolsek_simokerto','$2b$12$RjID2lMW/UZYnGBSPqGcx.SMn3wsBU/tlRNgO6XdD4MByvgCiHLxW',NULL,NULL,NULL,'Didik Hermanto',NULL,'2025-07-11 08:05:11','admin1',0,NULL),(14,'babinsa_simokerto','$2b$12$TRMlVq3HCAuWAKRHjq8cB.98ZI8Ywp0Whl8t4XEX.4cy4.vWMJWry',NULL,NULL,NULL,'Muthohar',NULL,'2025-07-11 08:05:46','petugas',0,NULL),(15,'admin1','$2b$12$i0AI7F6iamuFymJ1RoBjrOD8UUQQ5GyH5SWNVgumj8oI68.53k7mO',NULL,NULL,NULL,'testt','alamat,RW 01,RT 01','2025-07-11 14:18:52','admin1',0,NULL),(16,'admin2','$2b$12$WlzlPmcf.YokD.MndQhE4.fB1yNoLYI9R1.bUCyrd3fqO6h3ujxp.',NULL,'session_1752254516984_16','2025-07-12 02:21:57','admin','gatau,RW 01,RT 01','2025-07-11 15:14:57','admin2',0,NULL),(19,'petugas1','$2b$12$bEItcyR8ijy/atBF/or1J.iwFS0lRejhRrMly6XvPGMm7XXhzPDqS',NULL,NULL,NULL,'Petugas','simokerto,RW 13,RT 01','2025-07-24 05:50:03','petugas',0,NULL),(20,'rt1','$2b$12$DVY6H48s07cH21ficwSeO.9d7mvsMrnfjuwHSTXZs0fUQ/UNNcNX2','dnrJSG-9O9EttYpaaK4-Zx:APA91bF3W0PCAdqYH-WOQvKYbIbvBtMjkStX01wxz-C4BBB8YGNl9yGy2FxHbSzWwwBB09VsQgs-IhqcMtuyjPV2UkeEz1lI61BBppSq9mCB1OPQiNRKdG4','session_1753364713264_20','2025-07-24 15:45:13','Akun RT Sementara','simokerto,RW 13,RT 01','2025-07-24 13:43:53','petugas',0,NULL),(21,'rt2','$2b$12$8WskNPdi5buxVZmVQyC71en44/.rAouz4PlZtCWt0tfVfR/bZ0ReO','fhDKCcGiT7OQVCq7c078p2:APA91bHHaQcuZTn0MfN-pA9mPVueYNOL8VA9jUpVzux8aW-lcriAsQDmk_mHGFs5viV8PVJlF0zDm_EM8IgmJGgNoyFdI7NuJNM4XqkkKPEVtQksNpC7bS8','session_1753365360600_21','2025-07-24 15:56:01','Akun RT Sementara','simokerto,RW 13,RT 01','2025-07-24 13:44:23','petugas',0,NULL),(22,'rt3','$2b$12$.SHFKFFQBYIzbNjvM75rKuWaaBnfyJUcliuAVTHKXMP5IQ0hXuZGW','fkml7O8SQyiuY0qSZ9cljK:APA91bGNvoHVVg5PKKpxbeBwtgN7HC1N5EDgGnaBdCRRbchaS1S5C8mpobuMXh-t1Z6NrbTC5ybZPPvd0ttxVD3HuR8zEDOEnYbFiZ_cdRbha6zLKoYWlfo','session_1753366033183_22','2025-07-24 16:07:13','Akun RT Sementara','simokerto,RW 13,RT 01','2025-07-24 13:45:05','petugas',0,NULL),(23,'rt4','$2b$12$FhWtPbN3BDwJxKy/XcN/OOmIXtNIy2qC8ZGP1I8rLsnp.SPCuyqe2',NULL,NULL,NULL,'Akun RT Sementara','simokerto,RW 13,RT 01','2025-07-24 13:45:35','petugas',0,NULL),(24,'rt5','$2b$12$Yp9a0ON0affqwi3zn9C/E.C2EPvPO6myohrYDJLF3nljM8OYgJ1/u','eJeoDvhlRruX558NUlzb3m:APA91bEXd6QXGTnfzv7qeu0bgYDhoxLXvI6lLLFb5DqGl8_KfVq1ag5R6LAqOIXVnyMmaxTvrgTov0mLvEb9N1K6KmJkxuwjLSIjQCYgAe5CoRXxz3yTek8','session_1753365113331_24','2025-07-24 15:51:53','Akun RT Sementara','simokerto,RW 13,RT 01','2025-07-24 13:46:01','petugas',0,NULL),(25,'rw13','$2b$12$9jPFDs2N9R.qNjKGlD7KqusKA43QkGFUHf9IuXepH788plY1ENB7.','eSaP0eLER7aBrYKsy3N35h:APA91bHg0sT0p-pbmvQZC3TR5yCFqQMUgHy1LQmTMngajw9z_9hSSdJzKDDauU6XFxGb8g-3h8tOCWAgNHMqSK5O7K-hztJ7DK8N_2A5vrAVYz8EHZAXREY','session_1753366525126_25','2025-07-24 16:15:25','Akun RW Sementara','simokerto,RW 13,RT 01','2025-07-24 13:46:44','petugas',0,NULL),(26,'babinkamtibmas1','$2b$12$uO90H/H.LEYXnuq7Ep1SduETBmaZYnnijYARRBXygynZeO7IdNVOS',NULL,NULL,NULL,'Akun Sementara','simokerto','2025-07-24 13:47:14','admin2',0,NULL);
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jenis_laporan_master`
--

DROP TABLE IF EXISTS `jenis_laporan_master`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jenis_laporan_master` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nama` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `nama` (`nama`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jenis_laporan_master`
--

LOCK TABLES `jenis_laporan_master` WRITE;
/*!40000 ALTER TABLE `jenis_laporan_master` DISABLE KEYS */;
INSERT INTO `jenis_laporan_master` VALUES (1,'Kebakaran'),(9,'Kecelakaan'),(2,'Kemalingan'),(8,'Orang meninggal'),(7,'Orang sakit'),(3,'Tawuran');
/*!40000 ALTER TABLE `jenis_laporan_master` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notifications`
--

DROP TABLE IF EXISTS `notifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `notifications` (
  `id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `message` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `is_read` tinyint(1) DEFAULT '0',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `user_role` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notifications`
--

LOCK TABLES `notifications` WRITE;
/*!40000 ALTER TABLE `notifications` DISABLE KEYS */;
/*!40000 ALTER TABLE `notifications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reports`
--

DROP TABLE IF EXISTS `reports`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reports` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `pelapor` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `jenis_laporan` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `reporter_type` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'user',
  `status` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'pending',
  `isSirine` tinyint(1) NOT NULL DEFAULT '0',
  `phone` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=314 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reports`
--

LOCK TABLES `reports` WRITE;
/*!40000 ALTER TABLE `reports` DISABLE KEYS */;
INSERT INTO `reports` VALUES (206,'15','maksidid',NULL,'2025-07-12 18:50:50',NULL,'kemalingan','admin','pending',0,'8454343'),(207,'1','Jl. Melati No.10, Surabaya',NULL,'2025-07-12 11:55:58',NULL,'kemalingan','user','pending',0,'-'),(208,'15','fgre',NULL,'2025-07-12 11:59:00',NULL,'kemalingan','admin','pending',1,'576567'),(209,'1','Jl. Melati No.10, Surabaya',NULL,'2025-07-12 12:29:06',NULL,'kebakaran','user','pending',0,'-'),(210,'1','Jl. Melati No.10, Surabaya',NULL,'2025-07-12 12:38:08',NULL,'kemalingan','user','pending',1,'-'),(211,'1','dgdgrdgrg RW 1',NULL,'2025-07-12 12:38:32',NULL,'kemalingan','user','pending',1,'-'),(212,'1','Disnaa RW 1',NULL,'2025-07-12 12:57:36',NULL,'kemalingan','user','pending',1,'-'),(213,'1','hajsis RW 3',NULL,'2025-07-12 13:00:59',NULL,'kebakaran','user','pending',0,'-'),(214,'1','hshshs RW 3',NULL,'2025-07-12 13:01:11',NULL,'kemalingan','user','pending',1,'-'),(215,'1','Jl. Melati No.10, Surabaya',NULL,'2025-07-12 13:01:21',NULL,'kemalingan','user','pending',0,'-'),(216,'1','Jl. Melati No.10, Surabaya',NULL,'2025-07-13 07:48:37',NULL,'tawuran','user','pending',0,'-'),(217,'1','Jl. Melati No.10, Surabaya',NULL,'2025-07-13 07:49:59',NULL,'kemalingan','user','pending',0,'-'),(218,'1','Jl. Melati No.10, Surabaya',NULL,'2025-07-13 07:50:09',NULL,'kemalingan','user','pending',1,'-'),(219,'1','bsjsjs RW 3',NULL,'2025-07-13 07:50:23',NULL,'kemalingan','user','completed',1,'-'),(220,'1','Jl. Melati No.10, Surabaya',NULL,'2025-07-13 08:43:31',NULL,'kemalingan','user','pending',0,'-'),(221,'1','Jl. Melati No.10, Surabaya',NULL,'2025-07-13 09:32:27',NULL,'kemalingan','user','pending',0,'-'),(222,'1','Jl. Melati No.10, Surabaya',NULL,'2025-07-13 10:05:26',NULL,'kemalingan','user','pending',0,'-'),(223,'1','Jl. Melati No.10, Surabaya',NULL,'2025-07-13 10:15:13',NULL,'kemalingan','user','pending',0,'-'),(224,'1','jwaijwz RW 3',NULL,'2025-07-13 10:37:39',NULL,'kemalingan','user','pending',0,'-'),(225,'1','jjajs RW 3',NULL,'2025-07-13 10:37:54',NULL,'kemalingan','user','pending',1,'-'),(226,'1','bsns RW 3',NULL,'2025-07-13 10:39:02',NULL,'kemalingan','user','pending',0,'-'),(227,'1','jsisks RW 3',NULL,'2025-07-13 10:39:56',NULL,'kemalingan','user','pending',1,'-'),(228,'1','jsjsjs RW 3',NULL,'2025-07-13 10:41:16',NULL,'kebakaran','user','pending',1,'-'),(229,'1','ushjs RW 3',NULL,'2025-07-13 10:59:05',NULL,'kebakaran','user','pending',1,'-'),(230,'1','bshs RW 3',NULL,'2025-07-13 10:59:30',NULL,'kemalingan','user','pending',1,'-'),(231,'1','ugguv RW 13',NULL,'2025-07-13 12:51:39',NULL,'kemalingan','user','pending',1,'-'),(232,'1','jdjxjd RW 3',NULL,'2025-07-13 12:53:05',NULL,'kemalingan','user','pending',1,'-'),(233,'1','kenjeran 1 RW 3',NULL,'2025-07-14 04:32:29',NULL,'ditemukan orang meninggal','user','pending',1,'-'),(234,'1','iUOAAOSDI RW 3',NULL,'2025-07-14 04:33:39',NULL,'kebakaran','user','pending',1,'-'),(235,'1','bshs RW 3',NULL,'2025-07-14 04:46:26',NULL,'kemalingan','user','pending',1,'-'),(236,'1','bbsbs RW 3',NULL,'2025-07-14 04:47:14',NULL,'tawuran','user','pending',1,'-'),(237,'1','hshshs RW 3',NULL,'2025-07-14 04:48:02',NULL,'kebakaran','user','pending',1,'-'),(238,'1','jdjd RW 3',NULL,'2025-07-14 04:48:43',NULL,'kebakaran','user','pending',1,'-'),(239,'1','Simokerto RW 3',NULL,'2025-07-14 04:57:45',NULL,'kebakaran','user','pending',1,'-'),(240,'1','ADIYDu RW 3',NULL,'2025-07-14 04:59:36',NULL,'kemalingan','user','pending',1,'-'),(241,'1','simokerto RW 3',NULL,'2025-07-14 05:11:36',NULL,'kemalingan','user','pending',1,'-'),(242,'12','warlok',NULL,'2025-07-14 09:27:21',NULL,'lainnya','user','pending',0,'-'),(243,'1','Jl. Melati No.10, Surabaya',NULL,'2025-07-14 09:28:51',NULL,'lainnya','user','pending',0,'-'),(244,'2','Jl. Kenanga No.22, Sidoarjo',NULL,'2025-07-14 09:58:11',NULL,'kemalingan','user','pending',0,'-'),(245,'2','Jl. Kenanga No.22, Sidoarjo',NULL,'2025-07-14 09:59:41',NULL,'kemalingan','user','pending',0,'-'),(246,'2','Jl. Kenanga No.22, Sidoarjo',NULL,'2025-07-15 04:20:34',NULL,'kemalingan','user','pending',0,'-'),(247,'2','Jl. Kenanga No.22, Sidoarjo',NULL,'2025-07-15 04:20:43',NULL,'kemalingan','user','pending',0,'-'),(248,'2','Jl. Kenanga No.22, Sidoarjo',NULL,'2025-07-15 04:20:54',NULL,'kemalingan','user','pending',0,'-'),(249,'2','Jl. Kenanga No.22, Sidoarjo',NULL,'2025-07-15 04:24:45',NULL,'kemalingan','user','pending',0,'-'),(250,'1','Jl. Melati No.10, Surabaya',NULL,'2025-07-15 11:10:24',NULL,'kemalingan','user','processing',0,'-'),(251,'9','surabaya',NULL,'2025-07-24 04:50:52',NULL,'Orang meninggal','user','pending',1,'085381568989'),(252,'15','hhh',NULL,'2025-07-24 04:52:18',NULL,'kemalingan','admin','pending',1,'999'),(253,'15','fdgdfgdfgfdgdf, RW 01',NULL,'2025-07-24 04:53:02',NULL,'kemalingan','admin','pending',1,'4645645'),(254,'1','Jl. Melati No.10, Surabaya',NULL,'2025-07-24 05:02:18',NULL,'Kemalingan','user','pending',0,'085381568989'),(255,'9','nnn RT 01 RW 13',NULL,'2025-07-24 05:05:47',NULL,'Kebakaran','user','pending',1,'085381568989'),(256,'15','vvv',NULL,'2025-07-24 05:06:06',NULL,'kemalingan','admin','pending',1,'668'),(257,'15','dfgdfgdfg, RW 13',NULL,'2025-07-24 05:08:47',NULL,'kemalingan','admin','completed',1,'44444'),(258,'9','surabaya',NULL,'2025-07-24 05:18:12',NULL,'Kebakaran','user','pending',1,'085381568989'),(259,'9','surabaya',NULL,'2025-07-24 05:18:53',NULL,'Kebakaran','user','pending',1,'085381568989'),(260,'15','fefe445, RW 01',NULL,'2025-07-24 05:25:04',NULL,'kemalingan','admin','completed',1,'4545'),(261,'13','19, Jl. Kuta III No.19, Gn. Anyar, Kec. Gn. Anyar, Surabaya,,RW 13,RT 03',NULL,'2025-07-24 05:51:25',NULL,'Kebakaran','user','completed',0,'0'),(262,'13','19, Jl. Kuta III No.19, Gn. Anyar, Kec. Gn. Anyar, Surabaya,,RW 13,RT 03',NULL,'2025-07-24 06:03:37',NULL,'Kebakaran','user','completed',1,'0'),(263,'13','19, Jl. Kuta III No.19, Gn. Anyar, Kec. Gn. Anyar, Surabaya,,RW 13,RT 03',NULL,'2025-07-24 06:07:13',NULL,'Kebakaran','user','pending',1,'0'),(264,'1','mmm RT 01 RW 01',NULL,'2025-07-24 07:56:15',NULL,'Kebakaran','user','completed',0,'085381568989'),(265,'15','ndnd, RW 13',NULL,'2025-07-24 10:58:04',NULL,'kemalingan','admin','pending',1,'9565'),(266,'15','jfjd, RW 13',NULL,'2025-07-24 11:01:53',NULL,'kemalingan','admin','pending',1,'6865'),(267,'13','19, Jl. Kuta III No.19, Gn. Anyar, Kec. Gn. Anyar, Surabaya,,RW 13,RT 03',NULL,'2025-07-24 11:02:13',NULL,'Kebakaran','user','pending',1,'0'),(268,'13','19, Jl. Kuta III No.19, Gn. Anyar, Kec. Gn. Anyar, Surabaya,,RW 13,RT 03',NULL,'2025-07-24 11:34:41',NULL,'Kebakaran','user','pending',1,'0'),(269,'15','hdhd, RW 13',NULL,'2025-07-24 11:35:14',NULL,'kemalingan','admin','pending',1,'86535'),(270,'15','bdbd, RW 13',NULL,'2025-07-24 11:35:44',NULL,'kemalingan','admin','pending',1,'5454'),(271,'13','19, Jl. Kuta III No.19, Gn. Anyar, Kec. Gn. Anyar, Surabaya,,RW 13,RT 03',NULL,'2025-07-24 12:28:52',NULL,'Kebakaran','user','pending',1,'0'),(272,'6','bcl RT 01 RW 13',NULL,'2025-07-24 13:39:58',NULL,'Kebakaran','user','pending',1,'-'),(273,'1','Simokerto RW 13',NULL,'2025-07-24 13:53:47',NULL,'kebakaran','user','pending',1,'085381568989'),(274,'22','Sidoyoso 3/8',NULL,'2025-07-24 13:55:19',NULL,'tawuran','admin','pending',1,'85656493203'),(275,'25','Jl.Sidoyoso wetan37, RW 13',NULL,'2025-07-24 13:55:29',NULL,'kemalingan','admin','pending',1,'85236692810'),(276,'1','Simokerto RW 13',NULL,'2025-07-24 13:56:37',NULL,'tawuran','user','pending',1,'085381568989'),(277,'24','Sidoyoso',NULL,'2025-07-24 13:57:45',NULL,'kemalingan','admin','pending',1,'8562008893'),(278,'21','Sidoyoso wetan RT 02 ',NULL,'2025-07-24 13:58:15',NULL,'kemalingan','admin','pending',0,'2139684150'),(279,'23','Sidoyoso wetan no.42',NULL,'2025-07-24 13:59:36',NULL,'tawuran','admin','pending',1,'8572365944'),(280,'25','Jl.sidoyoso wetan 49, RW 13',NULL,'2025-07-24 13:59:56',NULL,'orang sakit','admin','pending',1,'85236692810'),(281,'1','ygyguyug RT 01 RW 13',NULL,'2025-07-24 14:01:28',NULL,'Kemalingan','user','pending',1,'085381568989'),(282,'6','gapunya alamat',NULL,'2025-07-24 14:01:53',NULL,'Kebakaran','user','completed',1,'-'),(283,'23','Sidoyoso wetan 001',NULL,'2025-07-24 14:02:25',NULL,'orang meninggal','admin','completed',1,'346487879494'),(284,'21','Sidoyoso wetan RT 02',NULL,'2025-07-24 14:03:00',NULL,'tawuran','admin','completed',1,'82139684150'),(285,'21','Sidoyoso wetan ',NULL,'2025-07-24 14:04:42',NULL,'kecelakaan','admin','completed',1,'821'),(286,'21','Hhgg',NULL,'2025-07-24 14:05:19',NULL,'kemalingan','admin','pending',1,'55826'),(287,'13','19, Jl. Kuta III No.19, Gn. Anyar, Kec. Gn. Anyar, Surabaya,,RW 13,RT 03',NULL,'2025-07-24 14:06:07',NULL,'Kebakaran','user','pending',1,'0'),(288,'21','Sghk',NULL,'2025-07-24 14:09:49',NULL,'kemalingan','admin','pending',1,'2569'),(289,'13','19, Jl. Kuta III No.19, Gn. Anyar, Kec. Gn. Anyar, Surabaya,,RW 13,RT 03',NULL,'2025-07-24 14:11:13',NULL,'Kebakaran','user','pending',1,'0'),(290,'21','Sdhyu',NULL,'2025-07-24 14:11:54',NULL,'kemalingan','admin','pending',1,'82459'),(291,'16','tdfftfy',NULL,'2025-07-24 14:13:32',NULL,'kemalingan','admin','pending',1,'8786'),(292,'15','hdjjdd, RW 13',NULL,'2025-07-24 14:13:51',NULL,'kemalingan','admin','pending',1,'9565'),(293,'22','Sidoyoso wetan',NULL,'2025-07-24 14:14:40',NULL,'kebakaran','admin','pending',1,'35911649999'),(294,'21','Hgbki',NULL,'2025-07-24 14:15:05',NULL,'kecelakaan','admin','pending',1,'85639'),(295,'16','EEUTFTAFDUGGCUZ, RW 13',NULL,'2025-07-24 14:15:09',NULL,'kemalingan','admin','completed',1,'7676589'),(296,'25','Jl.Sidoyoso wetan 49, RW 13',NULL,'2025-07-24 14:16:40',NULL,'kebakaran','admin','processing',1,'85236692810'),(297,'25','Ggh, RW 13',NULL,'2025-07-24 14:17:03',NULL,'kemalingan','admin','processing',1,'666'),(298,'15','hdndjd, RW 13',NULL,'2025-07-24 14:17:57',NULL,'kemalingan','admin','processing',1,'959595'),(299,'21','Sdys',NULL,'2025-07-24 14:18:05',NULL,'orang meninggal','admin','processing',1,'82156'),(300,'13','19, Jl. Kuta III No.19, Gn. Anyar, Kec. Gn. Anyar, Surabaya,,RW 13,RT 03',NULL,'2025-07-24 14:19:47',NULL,'Kebakaran','user','processing',1,'0'),(301,'14','sidoyoso wetan  no 57,RW 13,RT 01',NULL,'2025-07-24 14:28:25',NULL,'Orang sakit','user','pending',1,'08100000000'),(302,'14','sidoyoso wetan  no 57,RW 13,RT 01',NULL,'2025-07-24 14:30:47',NULL,'Kebakaran','user','pending',1,'08100000000'),(303,'13','19, Jl. Kuta III No.19, Gn. Anyar, Kec. Gn. Anyar, Surabaya,,RW 13,RT 03',NULL,'2025-07-26 22:56:32',NULL,'Tawuran','user','pending',1,'0'),(304,'15','hdbd, RW 13',NULL,'2025-07-26 22:56:47',NULL,'kemalingan','admin','pending',1,'565'),(305,'13','19, Jl. Kuta III No.19, Gn. Anyar, Kec. Gn. Anyar, Surabaya,,RW 13,RT 03',NULL,'2025-07-27 01:20:51',NULL,'Kebakaran','user','pending',1,'0'),(306,'13','19, Jl. Kuta III No.19, Gn. Anyar, Kec. Gn. Anyar, Surabaya,,RW 13,RT 03',NULL,'2025-07-27 02:33:57',NULL,'Kebakaran','user','pending',1,'0'),(307,'1','Jl. Melati No.10, Surabaya',NULL,'2025-07-27 02:44:30',NULL,'Kebakaran','user','pending',1,'085381568989'),(308,'1','Jl. Melati No.10, Surabaya',NULL,'2025-07-27 02:44:53',NULL,'Kebakaran','user','pending',1,'085381568989'),(309,'1','sidoyosowetan42 RT 04 RW 13',NULL,'2025-07-27 02:45:45',NULL,'Kebakaran','user','pending',0,'085381568989'),(310,'1','Jl. Melati No.10, Surabaya',NULL,'2025-07-27 02:45:56',NULL,'Kebakaran','user','pending',1,'085381568989'),(311,'1','sidoyoso wetan RT 04 RW 13',NULL,'2025-07-27 02:46:33',NULL,'Kebakaran','user','pending',1,'085381568989'),(312,'1','sidoyoso RT 04 RW 13',NULL,'2025-07-27 02:47:37',NULL,'Pencurian','user','pending',1,'085381568989'),(313,'25','Jl\nSidoyoso wetan 42, RW 13',NULL,'2025-07-27 02:50:08',NULL,'tawuran','admin','pending',1,'85236692810');
/*!40000 ALTER TABLE `reports` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `phone` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `fcm_token` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `session_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `session_start` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'user1','pass1','Siti Aminahhhhh','Jl. Melati No.10, Surabaya','2025-07-01 12:45:07','085381568989',NULL,NULL,NULL),(2,'user2','pass2','Budi Santoso','Jl. Kenanga No.22, Sidoarjo','2025-07-01 12:45:07',NULL,NULL,NULL,NULL),(3,'warga3','123456','Rina Wija','Jl. Anggrek No.5, Gresik','2025-07-01 12:45:07',NULL,NULL,NULL,NULL),(6,'melisa','1234567890','Meylisa Elvioraa','gapunya alamat','2025-07-06 07:02:56',NULL,NULL,NULL,NULL),(7,'bu_lurah','12345678','Bu lurah','-','2025-07-07 04:35:18',NULL,NULL,NULL,NULL),(8,'warga4','pass4','Vanszs','rw 3 rt 1','2025-07-09 15:57:08',NULL,NULL,NULL,NULL),(9,'warga5','pass5','vannn satria','surabaya','2025-07-10 13:33:47','085381568989',NULL,NULL,NULL),(11,'yuliaimut','avriskalucu','yuliaaaaaaaaaa','gatau plis','2025-07-11 04:12:31','-',NULL,NULL,NULL),(12,'irfinnstay','fanelek23','irfan romadhon :v','warlok','2025-07-11 04:14:44','-',NULL,NULL,NULL),(13,'warga6','pass6','warga6','19, Jl. Kuta III No.19, Gn. Anyar, Kec. Gn. Anyar, Surabaya,,RW 13,RT 03','2025-07-24 05:50:48','0',NULL,NULL,NULL),(14,'rt1_rw13_57','12345678','rudi','sidoyoso wetan  no 57,RW 13,RT 01','2025-07-24 14:23:13','08100000000',NULL,NULL,NULL);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-07-27  4:59:14
