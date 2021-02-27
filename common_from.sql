-- MySQL dump 10.13  Distrib 5.7.25, for Linux (x86_64)
--
-- Host: localhost    Database: common_from
-- ------------------------------------------------------
-- Server version	5.7.25-0ubuntu0.18.04.2

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `admin_menu`
--

DROP TABLE IF EXISTS `admin_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin_menu` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) NOT NULL DEFAULT '0',
  `order` int(11) NOT NULL DEFAULT '0',
  `title` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `uri` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `permission` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_menu`
--

LOCK TABLES `admin_menu` WRITE;
/*!40000 ALTER TABLE `admin_menu` DISABLE KEYS */;
INSERT INTO `admin_menu` VALUES (1,0,1,'仪表盘','fa-bar-chart','/',NULL,NULL,'2020-03-19 17:34:23'),(2,0,3,'Admin','fa-tasks','',NULL,NULL,'2020-03-16 18:01:38'),(3,2,4,'Users','fa-users','auth/users',NULL,NULL,'2020-03-16 18:01:38'),(4,2,5,'Roles','fa-user','auth/roles',NULL,NULL,'2020-03-16 18:01:38'),(5,2,6,'Permission','fa-ban','auth/permissions',NULL,NULL,'2020-03-16 18:01:38'),(6,2,7,'Menu','fa-bars','auth/menu',NULL,NULL,'2020-03-16 18:01:38'),(7,2,8,'Operation log','fa-history','auth/logs',NULL,NULL,'2020-03-16 18:01:38'),(8,0,2,'客户健康报告','fa-bars','/customer-healths',NULL,'2020-03-16 18:01:33','2020-03-16 18:01:38'),(9,0,0,'头条-测试表单','fa-bars','/tt_test-forms',NULL,'2020-04-27 01:24:11','2020-04-27 01:24:11'),(10,0,0,'综合表单/问卷数据','fa-bars','/base-common-forms',NULL,'2020-10-17 08:42:27','2020-10-17 08:42:27');
/*!40000 ALTER TABLE `admin_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admin_operation_log`
--

DROP TABLE IF EXISTS `admin_operation_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin_operation_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `path` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `method` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ip` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `input` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `admin_operation_log_user_id_index` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=164 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_operation_log`
--

LOCK TABLES `admin_operation_log` WRITE;
/*!40000 ALTER TABLE `admin_operation_log` DISABLE KEYS */;
INSERT INTO `admin_operation_log` VALUES (1,1,'admin','GET','192.168.10.1','[]','2020-03-16 15:16:02','2020-03-16 15:16:02'),(2,1,'admin','GET','192.168.10.1','[]','2020-03-16 17:36:48','2020-03-16 17:36:48'),(3,1,'admin','GET','192.168.10.1','[]','2020-03-16 17:37:11','2020-03-16 17:37:11'),(4,1,'admin','GET','192.168.10.1','[]','2020-03-16 17:37:14','2020-03-16 17:37:14'),(5,1,'admin','GET','192.168.10.1','[]','2020-03-16 17:58:28','2020-03-16 17:58:28'),(6,1,'admin/auth/menu','GET','192.168.10.1','{\"_pjax\":\"#pjax-container\"}','2020-03-16 18:00:42','2020-03-16 18:00:42'),(7,1,'admin/auth/menu','POST','192.168.10.1','{\"parent_id\":\"0\",\"title\":\"\\u5ba2\\u6237\\u5065\\u5eb7\\u62a5\\u544a\",\"icon\":\"fa-bars\",\"uri\":\"\\/customer-healths\",\"roles\":[null],\"permission\":null,\"_token\":\"Fa5D9Kgjva681wz5z22FhqlLb2kzHcU2fbpII5wF\"}','2020-03-16 18:01:33','2020-03-16 18:01:33'),(8,1,'admin/auth/menu','GET','192.168.10.1','[]','2020-03-16 18:01:33','2020-03-16 18:01:33'),(9,1,'admin/auth/menu','POST','192.168.10.1','{\"_token\":\"Fa5D9Kgjva681wz5z22FhqlLb2kzHcU2fbpII5wF\",\"_order\":\"[{\\\"id\\\":1},{\\\"id\\\":8},{\\\"id\\\":2,\\\"children\\\":[{\\\"id\\\":3},{\\\"id\\\":4},{\\\"id\\\":5},{\\\"id\\\":6},{\\\"id\\\":7}]}]\"}','2020-03-16 18:01:38','2020-03-16 18:01:38'),(10,1,'admin/auth/menu','GET','192.168.10.1','{\"_pjax\":\"#pjax-container\"}','2020-03-16 18:01:38','2020-03-16 18:01:38'),(11,1,'admin/auth/menu','GET','192.168.10.1','[]','2020-03-16 18:01:41','2020-03-16 18:01:41'),(12,1,'admin/customer-healths','GET','192.168.10.1','[]','2020-03-16 18:02:11','2020-03-16 18:02:11'),(13,1,'admin/customer-healths','GET','192.168.10.1','[]','2020-03-16 18:02:54','2020-03-16 18:02:54'),(14,1,'admin/customer-healths','GET','192.168.10.1','[]','2020-03-16 18:03:27','2020-03-16 18:03:27'),(15,1,'admin/customer-healths','GET','192.168.10.1','[]','2020-03-16 18:04:49','2020-03-16 18:04:49'),(16,1,'admin/customer-healths','GET','192.168.10.1','[]','2020-03-16 18:05:00','2020-03-16 18:05:00'),(17,1,'admin/customer-healths','GET','192.168.10.1','[]','2020-03-16 18:33:41','2020-03-16 18:33:41'),(18,1,'admin/auth/roles','GET','192.168.10.1','{\"_pjax\":\"#pjax-container\"}','2020-03-16 18:38:41','2020-03-16 18:38:41'),(19,1,'admin/customer-healths','GET','192.168.10.1','{\"_pjax\":\"#pjax-container\"}','2020-03-16 18:39:33','2020-03-16 18:39:33'),(20,1,'admin/customer-healths','GET','192.168.10.1','[]','2020-03-16 18:39:36','2020-03-16 18:39:36'),(21,1,'admin/customer-healths','GET','192.168.10.1','[]','2020-03-16 18:40:10','2020-03-16 18:40:10'),(22,1,'admin/customer-healths','GET','192.168.10.1','[]','2020-03-16 18:40:35','2020-03-16 18:40:35'),(23,1,'admin/auth/roles','GET','192.168.10.1','{\"_pjax\":\"#pjax-container\"}','2020-03-16 18:40:41','2020-03-16 18:40:41'),(24,1,'admin/customer-healths','GET','192.168.10.1','{\"_pjax\":\"#pjax-container\"}','2020-03-16 18:40:56','2020-03-16 18:40:56'),(25,1,'admin/customer-healths','GET','192.168.10.1','[]','2020-03-16 18:59:07','2020-03-16 18:59:07'),(26,1,'admin/customer-healths','GET','192.168.10.1','{\"_export_\":\"page:1\"}','2020-03-16 18:59:13','2020-03-16 18:59:13'),(27,1,'admin/customer-healths','GET','192.168.10.1','{\"_export_\":\"page:1\"}','2020-03-16 19:03:15','2020-03-16 19:03:15'),(28,1,'admin','GET','192.168.10.1','[]','2020-03-17 07:44:17','2020-03-17 07:44:17'),(29,1,'admin/customer-healths','GET','192.168.10.1','{\"_pjax\":\"#pjax-container\"}','2020-03-17 07:44:22','2020-03-17 07:44:22'),(30,1,'admin/customer-healths','GET','192.168.10.1','[]','2020-03-18 06:40:50','2020-03-18 06:40:50'),(31,1,'admin/auth/logout','GET','192.168.10.1','{\"_pjax\":\"#pjax-container\"}','2020-03-18 06:40:56','2020-03-18 06:40:56'),(32,1,'admin','GET','192.168.10.1','[]','2020-03-18 15:04:00','2020-03-18 15:04:00'),(33,1,'admin','GET','192.168.10.1','[]','2020-03-18 15:11:20','2020-03-18 15:11:20'),(34,1,'admin','GET','192.168.10.1','[]','2020-03-18 15:11:36','2020-03-18 15:11:36'),(35,1,'admin','GET','192.168.10.1','[]','2020-03-18 15:11:45','2020-03-18 15:11:45'),(36,1,'admin','GET','192.168.10.1','[]','2020-03-18 15:12:46','2020-03-18 15:12:46'),(37,1,'admin','GET','192.168.10.1','[]','2020-03-18 15:13:04','2020-03-18 15:13:04'),(38,1,'admin','GET','192.168.10.1','[]','2020-03-18 15:13:52','2020-03-18 15:13:52'),(39,1,'admin','GET','192.168.10.1','[]','2020-03-18 15:13:55','2020-03-18 15:13:55'),(40,1,'admin','GET','192.168.10.1','[]','2020-03-18 15:14:20','2020-03-18 15:14:20'),(41,1,'admin','GET','192.168.10.1','[]','2020-03-18 15:14:36','2020-03-18 15:14:36'),(42,1,'admin','GET','192.168.10.1','[]','2020-03-18 15:15:16','2020-03-18 15:15:16'),(43,1,'admin','GET','192.168.10.1','[]','2020-03-18 15:17:10','2020-03-18 15:17:10'),(44,1,'admin/customer-healths','GET','192.168.10.1','{\"_pjax\":\"#pjax-container\"}','2020-03-18 15:17:13','2020-03-18 15:17:13'),(45,1,'admin/customer-healths','GET','192.168.10.1','[]','2020-03-18 15:17:52','2020-03-18 15:17:52'),(46,1,'admin/customer-healths','GET','192.168.10.1','[]','2020-03-18 15:18:55','2020-03-18 15:18:55'),(47,1,'admin/customer-healths','GET','192.168.10.1','[]','2020-03-18 15:34:29','2020-03-18 15:34:29'),(48,1,'admin/customer-healths','GET','192.168.10.1','[]','2020-03-18 15:35:17','2020-03-18 15:35:17'),(49,1,'admin/customer-healths','GET','192.168.10.1','[]','2020-03-18 15:35:43','2020-03-18 15:35:43'),(50,1,'admin/customer-healths','GET','192.168.10.1','[]','2020-03-18 15:36:02','2020-03-18 15:36:02'),(51,1,'admin/customer-healths','GET','192.168.10.1','[]','2020-03-18 15:37:22','2020-03-18 15:37:22'),(52,1,'admin/customer-healths','GET','192.168.10.1','[]','2020-03-18 15:38:04','2020-03-18 15:38:04'),(53,1,'admin/customer-healths','GET','192.168.10.1','[]','2020-03-18 15:38:46','2020-03-18 15:38:46'),(54,1,'admin/customer-healths','GET','192.168.10.1','[]','2020-03-18 15:39:06','2020-03-18 15:39:06'),(55,1,'admin/customer-healths','GET','192.168.10.1','[]','2020-03-18 15:41:35','2020-03-18 15:41:35'),(56,1,'admin/customer-healths','GET','192.168.10.1','[]','2020-03-18 15:41:48','2020-03-18 15:41:48'),(57,1,'admin/customer-healths','GET','192.168.10.1','[]','2020-03-18 15:41:57','2020-03-18 15:41:57'),(58,1,'admin/customer-healths','GET','192.168.10.1','[]','2020-03-18 15:43:04','2020-03-18 15:43:04'),(59,1,'admin/customer-healths','GET','192.168.10.1','[]','2020-03-18 15:43:20','2020-03-18 15:43:20'),(60,1,'admin/customer-healths','GET','192.168.10.1','[]','2020-03-18 15:44:14','2020-03-18 15:44:14'),(61,1,'admin/customer-healths','GET','192.168.10.1','[]','2020-03-18 15:45:36','2020-03-18 15:45:36'),(62,1,'admin/customer-healths','GET','192.168.10.1','[]','2020-03-18 15:45:40','2020-03-18 15:45:40'),(63,1,'admin/customer-healths','GET','192.168.10.1','[]','2020-03-18 15:46:09','2020-03-18 15:46:09'),(64,1,'admin/customer-healths','GET','192.168.10.1','[]','2020-03-18 15:46:11','2020-03-18 15:46:11'),(65,1,'admin/customer-healths','GET','192.168.10.1','[]','2020-03-18 15:46:28','2020-03-18 15:46:28'),(66,1,'admin/_handle_action_','POST','192.168.10.1','{\"_key\":\"1\",\"_model\":\"App_Models_CustomerHealth\",\"_token\":\"IU7CHOr1ZYGlb8Hy5BtuDCdXAAFOZw6lLvEozXli\",\"_action\":\"Encore_Admin_Grid_Actions_Delete\",\"_input\":\"true\"}','2020-03-18 15:46:36','2020-03-18 15:46:36'),(67,1,'admin/customer-healths','GET','192.168.10.1','{\"_pjax\":\"#pjax-container\"}','2020-03-18 15:46:37','2020-03-18 15:46:37'),(68,1,'admin/customer-healths','GET','192.168.10.1','[]','2020-03-18 15:46:59','2020-03-18 15:46:59'),(69,1,'admin/customer-healths','GET','192.168.10.1','[]','2020-03-18 15:47:54','2020-03-18 15:47:54'),(70,1,'admin','GET','192.168.10.1','{\"_pjax\":\"#pjax-container\"}','2020-03-18 15:49:30','2020-03-18 15:49:30'),(71,1,'admin/customer-healths','GET','192.168.10.1','{\"_pjax\":\"#pjax-container\"}','2020-03-18 15:49:33','2020-03-18 15:49:33'),(72,1,'admin/customer-healths','GET','192.168.10.1','[]','2020-03-18 15:53:46','2020-03-18 15:53:46'),(73,1,'admin/customer-healths','GET','192.168.10.1','{\"_export_\":\"page:1\"}','2020-03-18 15:53:52','2020-03-18 15:53:52'),(74,1,'admin/customer-healths','GET','192.168.10.1','[]','2020-03-18 15:54:22','2020-03-18 15:54:22'),(75,1,'admin/customer-healths','GET','192.168.10.1','{\"_export_\":\"page:1\"}','2020-03-18 15:54:29','2020-03-18 15:54:29'),(76,1,'admin/customer-healths','GET','192.168.10.1','{\"_export_\":\"page:1\"}','2020-03-18 15:55:04','2020-03-18 15:55:04'),(77,1,'admin/customer-healths','GET','192.168.10.1','{\"_export_\":\"page:1\"}','2020-03-18 15:56:16','2020-03-18 15:56:16'),(78,1,'admin/customer-healths','GET','192.168.10.1','{\"_export_\":\"page:1\"}','2020-03-18 15:56:18','2020-03-18 15:56:18'),(79,1,'admin/customer-healths','GET','192.168.10.1','{\"_export_\":\"page:1\"}','2020-03-18 15:56:30','2020-03-18 15:56:30'),(80,1,'admin/customer-healths','GET','192.168.10.1','{\"_export_\":\"page:1\"}','2020-03-18 15:56:38','2020-03-18 15:56:38'),(81,1,'admin','GET','192.168.10.1','[]','2020-03-18 16:00:19','2020-03-18 16:00:19'),(82,1,'admin/customer-healths','GET','192.168.10.1','{\"_pjax\":\"#pjax-container\"}','2020-03-18 16:00:24','2020-03-18 16:00:24'),(83,1,'admin/customer-healths','GET','192.168.10.1','[]','2020-03-18 16:58:23','2020-03-18 16:58:23'),(84,1,'admin','GET','192.168.10.1','[]','2020-03-19 16:57:04','2020-03-19 16:57:04'),(85,1,'admin','GET','192.168.10.1','[]','2020-03-19 16:57:41','2020-03-19 16:57:41'),(86,1,'admin','GET','192.168.10.1','[]','2020-03-19 16:57:54','2020-03-19 16:57:54'),(87,1,'admin','GET','192.168.10.1','[]','2020-03-19 16:59:20','2020-03-19 16:59:20'),(88,1,'admin/customer-healths','GET','192.168.10.1','{\"_pjax\":\"#pjax-container\"}','2020-03-19 16:59:25','2020-03-19 16:59:25'),(89,1,'admin/customer-healths','GET','192.168.10.1','[]','2020-03-19 17:33:48','2020-03-19 17:33:48'),(90,1,'admin/auth/menu','GET','192.168.10.1','{\"_pjax\":\"#pjax-container\"}','2020-03-19 17:34:02','2020-03-19 17:34:02'),(91,1,'admin/auth/menu','GET','192.168.10.1','{\"_pjax\":\"#pjax-container\"}','2020-03-19 17:34:05','2020-03-19 17:34:05'),(92,1,'admin/auth/menu/1/edit','GET','192.168.10.1','{\"_pjax\":\"#pjax-container\"}','2020-03-19 17:34:14','2020-03-19 17:34:14'),(93,1,'admin/auth/menu/1','PUT','192.168.10.1','{\"parent_id\":\"0\",\"title\":\"\\u4eea\\u8868\\u76d8\",\"icon\":\"fa-bar-chart\",\"uri\":\"\\/\",\"roles\":[null],\"permission\":null,\"_token\":\"CElzo8GD6VZnE0zDdxKkjW9BpJilZvlZ7S40jvuJ\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/form.common.test\\/admin\\/auth\\/menu\"}','2020-03-19 17:34:23','2020-03-19 17:34:23'),(94,1,'admin/auth/menu','GET','192.168.10.1','[]','2020-03-19 17:34:24','2020-03-19 17:34:24'),(95,1,'admin/auth/menu','GET','192.168.10.1','[]','2020-03-19 17:34:27','2020-03-19 17:34:27'),(96,1,'admin','GET','192.168.10.1','{\"_pjax\":\"#pjax-container\"}','2020-03-19 17:34:31','2020-03-19 17:34:31'),(97,1,'admin/customer-healths','GET','192.168.10.1','{\"_pjax\":\"#pjax-container\"}','2020-03-19 17:34:33','2020-03-19 17:34:33'),(98,1,'admin/customer-healths','GET','192.168.10.1','[]','2020-03-19 17:36:45','2020-03-19 17:36:45'),(99,1,'admin','GET','192.168.10.1','{\"_pjax\":\"#pjax-container\"}','2020-03-19 17:37:38','2020-03-19 17:37:38'),(100,1,'admin/customer-healths','GET','192.168.10.1','{\"_pjax\":\"#pjax-container\"}','2020-03-19 17:39:18','2020-03-19 17:39:18'),(101,1,'admin/customer-healths','GET','192.168.10.1','[]','2020-03-19 17:39:56','2020-03-19 17:39:56'),(102,1,'admin/customer-healths','GET','192.168.10.1','[]','2020-03-19 17:40:44','2020-03-19 17:40:44'),(103,1,'admin/customer-healths','GET','192.168.10.1','[]','2020-03-19 17:42:05','2020-03-19 17:42:05'),(104,1,'admin/customer-healths','GET','192.168.10.1','[]','2020-03-19 17:42:09','2020-03-19 17:42:09'),(105,1,'admin/customer-healths','GET','192.168.10.1','[]','2020-03-19 17:42:53','2020-03-19 17:42:53'),(106,1,'admin','GET','192.168.10.1','[]','2020-04-27 01:23:28','2020-04-27 01:23:28'),(107,1,'admin/auth/menu','GET','192.168.10.1','{\"_pjax\":\"#pjax-container\"}','2020-04-27 01:23:37','2020-04-27 01:23:37'),(108,1,'admin/auth/menu','POST','192.168.10.1','{\"parent_id\":\"0\",\"title\":\"\\u5934\\u6761-\\u6d4b\\u8bd5\\u8868\\u5355\",\"icon\":\"fa-bars\",\"uri\":\"\\/tt_test-forms\",\"roles\":[null],\"permission\":null,\"_token\":\"OoNdH5QgGg3tYi71CXwOLoIQrlFn5LmF2zKyBEAR\"}','2020-04-27 01:24:11','2020-04-27 01:24:11'),(109,1,'admin/auth/menu','GET','192.168.10.1','[]','2020-04-27 01:24:12','2020-04-27 01:24:12'),(110,1,'admin/auth/menu','GET','192.168.10.1','[]','2020-04-27 01:24:17','2020-04-27 01:24:17'),(111,1,'admin/tt_test-forms','GET','192.168.10.1','{\"_pjax\":\"#pjax-container\"}','2020-04-27 01:24:19','2020-04-27 01:24:19'),(112,1,'admin/tt_test-forms','GET','192.168.10.1','[]','2020-04-27 01:25:39','2020-04-27 01:25:39'),(113,1,'admin/tt_test-forms','GET','192.168.10.1','[]','2020-04-27 03:59:34','2020-04-27 03:59:34'),(114,1,'admin/tt_test-forms','GET','192.168.10.1','[]','2020-04-27 06:05:40','2020-04-27 06:05:40'),(115,1,'admin/tt_test-forms','GET','192.168.10.1','[]','2020-04-27 06:06:08','2020-04-27 06:06:08'),(116,1,'admin/tt_test-forms','GET','192.168.10.1','[]','2020-05-01 01:15:06','2020-05-01 01:15:06'),(117,1,'admin/tt_test-forms','GET','192.168.10.1','[]','2020-05-01 01:15:22','2020-05-01 01:15:22'),(118,1,'admin/tt_test-forms','GET','192.168.10.1','{\"_export_\":\"page:1\"}','2020-05-01 01:15:41','2020-05-01 01:15:41'),(119,1,'admin/tt_test-forms','GET','192.168.10.1','{\"_export_\":\"page:1\"}','2020-05-01 01:17:00','2020-05-01 01:17:00'),(120,1,'admin/tt_test-forms','GET','192.168.10.1','{\"_export_\":\"page:1\"}','2020-05-01 01:21:19','2020-05-01 01:21:19'),(121,1,'admin/tt_test-forms','GET','192.168.10.1','{\"_export_\":\"page:1\"}','2020-05-01 01:28:01','2020-05-01 01:28:01'),(122,1,'admin/tt_test-forms','GET','192.168.10.1','[]','2020-05-01 01:28:36','2020-05-01 01:28:36'),(123,1,'admin/tt_test-forms','GET','192.168.10.1','{\"_export_\":\"page:1\"}','2020-05-01 01:28:39','2020-05-01 01:28:39'),(124,1,'admin/tt_test-forms','GET','192.168.10.1','[]','2020-05-01 01:31:39','2020-05-01 01:31:39'),(125,1,'admin','GET','192.168.10.1','[]','2020-06-09 05:39:31','2020-06-09 05:39:31'),(126,1,'admin/tt_test-forms','GET','192.168.10.1','{\"_pjax\":\"#pjax-container\"}','2020-06-09 05:39:35','2020-06-09 05:39:35'),(127,1,'admin/tt_test-forms','GET','192.168.10.1','[]','2020-06-09 05:40:43','2020-06-09 05:40:43'),(128,1,'admin/_handle_action_','POST','192.168.10.1','{\"_key\":\"30\",\"_model\":\"App_Models_XXlBaseForm\",\"_token\":\"FNqqUWSdkhPH1pDxH5DVdCw7mNsa57dAdzqNeqOY\",\"_action\":\"Encore_Admin_Grid_Actions_Delete\",\"_input\":\"true\"}','2020-06-09 05:40:51','2020-06-09 05:40:51'),(129,1,'admin/tt_test-forms','GET','192.168.10.1','{\"_pjax\":\"#pjax-container\"}','2020-06-09 05:40:51','2020-06-09 05:40:51'),(130,1,'admin','GET','192.168.10.1','[]','2020-06-09 05:47:56','2020-06-09 05:47:56'),(131,1,'admin/tt_test-forms','GET','192.168.10.1','{\"_pjax\":\"#pjax-container\"}','2020-06-09 05:48:00','2020-06-09 05:48:00'),(132,1,'admin/tt_test-forms','GET','192.168.10.1','[]','2020-06-09 05:48:14','2020-06-09 05:48:14'),(133,1,'admin/tt_test-forms','GET','192.168.10.1','[]','2020-06-09 05:49:11','2020-06-09 05:49:11'),(134,1,'admin/tt_test-forms','GET','192.168.10.1','[]','2020-06-09 05:49:19','2020-06-09 05:49:19'),(135,1,'admin/tt_test-forms','GET','192.168.10.1','[]','2020-06-09 05:49:28','2020-06-09 05:49:28'),(136,1,'admin/tt_test-forms','GET','192.168.10.1','[]','2020-06-09 05:49:47','2020-06-09 05:49:47'),(137,1,'admin/tt_test-forms/31/edit','GET','192.168.10.1','{\"_pjax\":\"#pjax-container\"}','2020-06-09 05:50:34','2020-06-09 05:50:34'),(138,1,'admin/tt_test-forms/31','PUT','192.168.10.1','{\"name\":\"131\",\"phone\":\"13112343123\",\"channel\":\"123\",\"url\":\"https:\\/\\/topsaleyme.icu\",\"_token\":\"FNqqUWSdkhPH1pDxH5DVdCw7mNsa57dAdzqNeqOY\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/form.common.test\\/admin\\/tt_test-forms\"}','2020-06-09 05:50:41','2020-06-09 05:50:41'),(139,1,'admin/tt_test-forms','GET','192.168.10.1','[]','2020-06-09 05:50:42','2020-06-09 05:50:42'),(140,1,'admin/tt_test-forms','GET','192.168.10.1','[]','2020-06-09 05:54:24','2020-06-09 05:54:24'),(141,1,'admin','GET','192.168.10.1','[]','2020-06-09 06:07:09','2020-06-09 06:07:09'),(142,1,'admin','GET','192.168.10.1','[]','2020-06-09 06:09:04','2020-06-09 06:09:04'),(143,1,'admin/tt_test-forms','GET','192.168.10.1','{\"_pjax\":\"#pjax-container\"}','2020-06-09 06:09:08','2020-06-09 06:09:08'),(144,1,'admin/tt_test-forms','GET','192.168.10.1','{\"_pjax\":\"#pjax-container\",\"created_at\":{\"start\":\"2020-06-07\",\"end\":\"2020-06-07\"}}','2020-06-09 06:09:20','2020-06-09 06:09:20'),(145,1,'admin/tt_test-forms','GET','192.168.10.1','{\"_pjax\":\"#pjax-container\",\"created_at\":{\"start\":\"2020-06-01\",\"end\":\"2020-06-01\"}}','2020-06-09 06:09:32','2020-06-09 06:09:32'),(146,1,'admin','GET','192.168.10.1','[]','2020-06-09 10:25:31','2020-06-09 10:25:31'),(147,1,'admin','GET','192.168.10.1','[]','2020-06-20 06:40:19','2020-06-20 06:40:19'),(148,1,'admin','GET','192.168.10.1','[]','2020-06-22 07:15:55','2020-06-22 07:15:55'),(149,1,'admin','GET','192.168.10.1','[]','2020-10-17 07:41:45','2020-10-17 07:41:45'),(150,1,'admin/customer-healths','GET','192.168.10.1','{\"_pjax\":\"#pjax-container\"}','2020-10-17 07:42:19','2020-10-17 07:42:19'),(151,1,'admin/tt_test-forms','GET','192.168.10.1','{\"_pjax\":\"#pjax-container\"}','2020-10-17 07:42:24','2020-10-17 07:42:24'),(152,1,'admin/customer-healths','GET','192.168.10.1','{\"_pjax\":\"#pjax-container\"}','2020-10-17 07:42:34','2020-10-17 07:42:34'),(153,1,'admin/customer-healths','GET','192.168.10.1','{\"_pjax\":\"#pjax-container\"}','2020-10-17 08:18:02','2020-10-17 08:18:02'),(154,1,'admin/auth/menu','GET','192.168.10.1','{\"_pjax\":\"#pjax-container\"}','2020-10-17 08:42:08','2020-10-17 08:42:08'),(155,1,'admin/auth/menu','POST','192.168.10.1','{\"parent_id\":\"0\",\"title\":\"\\u7efc\\u5408\\u8868\\u5355\\/\\u95ee\\u5377\\u6570\\u636e\",\"icon\":\"fa-bars\",\"uri\":\"\\/base-common-forms\",\"roles\":[null],\"permission\":null,\"_token\":\"hErO0mgpjwZfcmqowvd5HiJDyJmpEAqi1VqBNYYp\"}','2020-10-17 08:42:26','2020-10-17 08:42:26'),(156,1,'admin/auth/menu','GET','192.168.10.1','[]','2020-10-17 08:42:27','2020-10-17 08:42:27'),(157,1,'admin/auth/menu','GET','192.168.10.1','[]','2020-10-17 08:42:31','2020-10-17 08:42:31'),(158,1,'admin/base-common-forms','GET','192.168.10.1','{\"_pjax\":\"#pjax-container\"}','2020-10-17 08:42:33','2020-10-17 08:42:33'),(159,1,'admin/base-common-forms','GET','192.168.10.1','[]','2020-10-17 08:43:17','2020-10-17 08:43:17'),(160,1,'admin/base-common-forms','GET','192.168.10.1','[]','2020-10-17 08:51:05','2020-10-17 08:51:05'),(161,1,'admin/base-common-forms','GET','192.168.10.1','[]','2020-10-18 01:10:35','2020-10-18 01:10:35'),(162,1,'admin/base-common-forms','GET','192.168.10.1','[]','2020-10-18 01:10:39','2020-10-18 01:10:39'),(163,1,'admin/base-common-forms','GET','192.168.10.1','[]','2020-10-18 01:44:41','2020-10-18 01:44:41');
/*!40000 ALTER TABLE `admin_operation_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admin_permissions`
--

DROP TABLE IF EXISTS `admin_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin_permissions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `http_method` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `http_path` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `admin_permissions_name_unique` (`name`),
  UNIQUE KEY `admin_permissions_slug_unique` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_permissions`
--

LOCK TABLES `admin_permissions` WRITE;
/*!40000 ALTER TABLE `admin_permissions` DISABLE KEYS */;
INSERT INTO `admin_permissions` VALUES (1,'All permission','*','','*',NULL,NULL),(2,'Dashboard','dashboard','GET','/',NULL,NULL),(3,'Login','auth.login','','/auth/login\r\n/auth/logout',NULL,NULL),(4,'User setting','auth.setting','GET,PUT','/auth/setting',NULL,NULL),(5,'Auth management','auth.management','','/auth/roles\r\n/auth/permissions\r\n/auth/menu\r\n/auth/logs',NULL,NULL);
/*!40000 ALTER TABLE `admin_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admin_role_menu`
--

DROP TABLE IF EXISTS `admin_role_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin_role_menu` (
  `role_id` int(11) NOT NULL,
  `menu_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  KEY `admin_role_menu_role_id_menu_id_index` (`role_id`,`menu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_role_menu`
--

LOCK TABLES `admin_role_menu` WRITE;
/*!40000 ALTER TABLE `admin_role_menu` DISABLE KEYS */;
INSERT INTO `admin_role_menu` VALUES (1,2,NULL,NULL);
/*!40000 ALTER TABLE `admin_role_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admin_role_permissions`
--

DROP TABLE IF EXISTS `admin_role_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin_role_permissions` (
  `role_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  KEY `admin_role_permissions_role_id_permission_id_index` (`role_id`,`permission_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_role_permissions`
--

LOCK TABLES `admin_role_permissions` WRITE;
/*!40000 ALTER TABLE `admin_role_permissions` DISABLE KEYS */;
INSERT INTO `admin_role_permissions` VALUES (1,1,NULL,NULL);
/*!40000 ALTER TABLE `admin_role_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admin_role_users`
--

DROP TABLE IF EXISTS `admin_role_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin_role_users` (
  `role_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  KEY `admin_role_users_role_id_user_id_index` (`role_id`,`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_role_users`
--

LOCK TABLES `admin_role_users` WRITE;
/*!40000 ALTER TABLE `admin_role_users` DISABLE KEYS */;
INSERT INTO `admin_role_users` VALUES (1,1,NULL,NULL);
/*!40000 ALTER TABLE `admin_role_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admin_roles`
--

DROP TABLE IF EXISTS `admin_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin_roles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `admin_roles_name_unique` (`name`),
  UNIQUE KEY `admin_roles_slug_unique` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_roles`
--

LOCK TABLES `admin_roles` WRITE;
/*!40000 ALTER TABLE `admin_roles` DISABLE KEYS */;
INSERT INTO `admin_roles` VALUES (1,'Administrator','administrator','2020-03-16 14:40:31','2020-03-16 14:40:31');
/*!40000 ALTER TABLE `admin_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admin_user_permissions`
--

DROP TABLE IF EXISTS `admin_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin_user_permissions` (
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  KEY `admin_user_permissions_user_id_permission_id_index` (`user_id`,`permission_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_user_permissions`
--

LOCK TABLES `admin_user_permissions` WRITE;
/*!40000 ALTER TABLE `admin_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `admin_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admin_users`
--

DROP TABLE IF EXISTS `admin_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin_users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `admin_users_username_unique` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_users`
--

LOCK TABLES `admin_users` WRITE;
/*!40000 ALTER TABLE `admin_users` DISABLE KEYS */;
INSERT INTO `admin_users` VALUES (1,'admin','$2y$10$nqwMGen1RU0xp/C3mDd48uDktwn9Ly5hcYtMjkDeeTe0fj8IKj4bK','Administrator',NULL,'9kv3ZzjPYpCvOn1MOhl6yAlOqC71Fx6oJfQL3oUwtCHcdD6RzZ8p9boIB73S','2020-03-16 14:40:31','2020-03-16 14:40:31');
/*!40000 ALTER TABLE `admin_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `base_common_forms`
--

DROP TABLE IF EXISTS `base_common_forms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `base_common_forms` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `other_data` json DEFAULT NULL,
  `url` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `base_common_forms_title_index` (`title`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `base_common_forms`
--

LOCK TABLES `base_common_forms` WRITE;
/*!40000 ALTER TABLE `base_common_forms` DISABLE KEYS */;
INSERT INTO `base_common_forms` VALUES (1,'氐殊','测试','13112344312',NULL,NULL,'2020-10-17 10:12:57','2020-10-17 10:12:57'),(2,'氐殊','131','13112344321',NULL,'http://localhost:8080/','2020-10-18 01:43:36','2020-10-18 01:43:36');
/*!40000 ALTER TABLE `base_common_forms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_healths`
--

DROP TABLE IF EXISTS `customer_healths`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer_healths` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_card` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sex` int(11) NOT NULL DEFAULT '0',
  `body_temperature` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `question_data` json DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_healths`
--

LOCK TABLES `customer_healths` WRITE;
/*!40000 ALTER TABLE `customer_healths` DISABLE KEYS */;
INSERT INTO `customer_healths` VALUES (2,'312','13112345678','441702199806013818',1,'35','\"[{\\\"question\\\":\\\"近两周内是否曾去过湖北、温州或其他有病例报告的社区?\\\",\\\"value\\\":\\\"1\\\",\\\"type\\\":\\\"radio\\\"},{\\\"question\\\":\\\"近两周内是否接触过疫点的发热或有呼吸道症状的患者?\\\",\\\"value\\\":\\\"1\\\",\\\"type\\\":\\\"radio\\\"},{\\\"question\\\":\\\"近两周内是否接触过新冠病毒感染者?\\\",\\\"value\\\":\\\"1\\\",\\\"type\\\":\\\"radio\\\"},{\\\"question\\\":\\\"近两周内是否有出现过发热?\\\",\\\"value\\\":\\\"1\\\",\\\"type\\\":\\\"radio\\\"},{\\\"question\\\":\\\"有无聚集性发病?\\\",\\\"value\\\":\\\"1\\\",\\\"type\\\":\\\"radio\\\"}]\"','2020-03-17 07:37:14','2020-03-17 07:37:14'),(3,'123','18592071704','441702199806013818',2,'35','\"[{\\\"question\\\":\\\"近两周内是否曾去过湖北、温州或其他有病例报告的社区?\\\",\\\"value\\\":\\\"1\\\",\\\"type\\\":\\\"radio\\\"},{\\\"question\\\":\\\"近两周内是否接触过疫点的发热或有呼吸道症状的患者?\\\",\\\"value\\\":\\\"1\\\",\\\"type\\\":\\\"radio\\\"},{\\\"question\\\":\\\"近两周内是否接触过新冠病毒感染者?\\\",\\\"value\\\":\\\"1\\\",\\\"type\\\":\\\"radio\\\"},{\\\"question\\\":\\\"近两周内是否有出现过发热?\\\",\\\"value\\\":\\\"1\\\",\\\"type\\\":\\\"radio\\\"},{\\\"question\\\":\\\"有无聚集性发病?\\\",\\\"value\\\":\\\"1\\\",\\\"type\\\":\\\"radio\\\"}]\"','2020-03-19 16:59:05','2020-03-19 16:59:05'),(4,'123','18592071704','441702199806013818',2,'35','\"[{\\\"question\\\":\\\"近两周内是否曾去过湖北、温州或其他有病例报告的社区?\\\",\\\"value\\\":\\\"1\\\",\\\"type\\\":\\\"radio\\\"},{\\\"question\\\":\\\"近两周内是否接触过疫点的发热或有呼吸道症状的患者?\\\",\\\"value\\\":\\\"1\\\",\\\"type\\\":\\\"radio\\\"},{\\\"question\\\":\\\"近两周内是否接触过新冠病毒感染者?\\\",\\\"value\\\":\\\"1\\\",\\\"type\\\":\\\"radio\\\"},{\\\"question\\\":\\\"近两周内是否有出现过发热?\\\",\\\"value\\\":\\\"1\\\",\\\"type\\\":\\\"radio\\\"},{\\\"question\\\":\\\"有无聚集性发病?\\\",\\\"value\\\":\\\"1\\\",\\\"type\\\":\\\"radio\\\"}]\"','2020-03-19 16:59:05','2020-03-19 16:59:05'),(5,'2321','18592071704','441702199806013818',2,'34','\"[{\\\"question\\\":\\\"近两周内是否曾去过湖北、温州或其他有病例报告的社区?\\\",\\\"value\\\":\\\"1\\\",\\\"type\\\":\\\"radio\\\"},{\\\"question\\\":\\\"近两周内是否接触过疫点的发热或有呼吸道症状的患者?\\\",\\\"value\\\":\\\"1\\\",\\\"type\\\":\\\"radio\\\"},{\\\"question\\\":\\\"近两周内是否接触过新冠病毒感染者?\\\",\\\"value\\\":\\\"1\\\",\\\"type\\\":\\\"radio\\\"},{\\\"question\\\":\\\"近两周内是否有出现过发热?\\\",\\\"value\\\":\\\"1\\\",\\\"type\\\":\\\"radio\\\"},{\\\"question\\\":\\\"有无聚集性发病?\\\",\\\"value\\\":\\\"1\\\",\\\"type\\\":\\\"radio\\\"}]\"','2020-03-19 17:08:17','2020-03-19 17:08:17'),(6,'213','18592071704','441702199806013818',1,'35','\"[{\\\"question\\\":\\\"近两周内是否曾去过湖北、温州或其他有病例报告的社区?\\\",\\\"value\\\":\\\"1\\\",\\\"type\\\":\\\"radio\\\"},{\\\"question\\\":\\\"近两周内是否接触过疫点的发热或有呼吸道症状的患者?\\\",\\\"value\\\":\\\"1\\\",\\\"type\\\":\\\"radio\\\"},{\\\"question\\\":\\\"近两周内是否接触过新冠病毒感染者?\\\",\\\"value\\\":\\\"1\\\",\\\"type\\\":\\\"radio\\\"},{\\\"question\\\":\\\"近两周内是否有出现过发热?\\\",\\\"value\\\":\\\"1\\\",\\\"type\\\":\\\"radio\\\"},{\\\"question\\\":\\\"有无聚集性发病?\\\",\\\"value\\\":\\\"1\\\",\\\"type\\\":\\\"radio\\\"}]\"','2020-03-19 17:09:18','2020-03-19 17:09:18'),(7,'132','18592071704','441702199806013818',2,'36','\"[{\\\"question\\\":\\\"近两周内是否曾去过湖北、温州或其他有病例报告的社区?\\\",\\\"value\\\":\\\"1\\\",\\\"type\\\":\\\"radio\\\"},{\\\"question\\\":\\\"近两周内是否接触过疫点的发热或有呼吸道症状的患者?\\\",\\\"value\\\":\\\"1\\\",\\\"type\\\":\\\"radio\\\"},{\\\"question\\\":\\\"近两周内是否接触过新冠病毒感染者?\\\",\\\"value\\\":\\\"1\\\",\\\"type\\\":\\\"radio\\\"},{\\\"question\\\":\\\"近两周内是否有出现过发热?\\\",\\\"value\\\":\\\"1\\\",\\\"type\\\":\\\"radio\\\"},{\\\"question\\\":\\\"有无聚集性发病?\\\",\\\"value\\\":\\\"1\\\",\\\"type\\\":\\\"radio\\\"}]\"','2020-03-19 17:10:25','2020-03-19 17:10:25'),(8,'132','18592071704','441702199806013818',2,'36','\"[{\\\"question\\\":\\\"近两周内是否曾去过湖北、温州或其他有病例报告的社区?\\\",\\\"value\\\":\\\"1\\\",\\\"type\\\":\\\"radio\\\"},{\\\"question\\\":\\\"近两周内是否接触过疫点的发热或有呼吸道症状的患者?\\\",\\\"value\\\":\\\"1\\\",\\\"type\\\":\\\"radio\\\"},{\\\"question\\\":\\\"近两周内是否接触过新冠病毒感染者?\\\",\\\"value\\\":\\\"1\\\",\\\"type\\\":\\\"radio\\\"},{\\\"question\\\":\\\"近两周内是否有出现过发热?\\\",\\\"value\\\":\\\"1\\\",\\\"type\\\":\\\"radio\\\"},{\\\"question\\\":\\\"有无聚集性发病?\\\",\\\"value\\\":\\\"1\\\",\\\"type\\\":\\\"radio\\\"}]\"','2020-03-19 17:10:33','2020-03-19 17:10:33'),(9,'312','18592071704','441702199806013818',2,'35','\"[{\\\"question\\\":\\\"近两周内是否曾去过湖北、温州或其他有病例报告的社区?\\\",\\\"value\\\":\\\"1\\\",\\\"type\\\":\\\"radio\\\"},{\\\"question\\\":\\\"近两周内是否接触过疫点的发热或有呼吸道症状的患者?\\\",\\\"value\\\":\\\"1\\\",\\\"type\\\":\\\"radio\\\"},{\\\"question\\\":\\\"近两周内是否接触过新冠病毒感染者?\\\",\\\"value\\\":\\\"1\\\",\\\"type\\\":\\\"radio\\\"},{\\\"question\\\":\\\"近两周内是否有出现过发热?\\\",\\\"value\\\":\\\"1\\\",\\\"type\\\":\\\"radio\\\"},{\\\"question\\\":\\\"有无聚集性发病?\\\",\\\"value\\\":\\\"1\\\",\\\"type\\\":\\\"radio\\\"}]\"','2020-03-19 17:19:47','2020-03-19 17:19:47'),(10,'123','18592071704','441702199806013818',2,'34','\"[{\\\"question\\\":\\\"近两周内是否曾去过湖北、温州或其他有病例报告的社区?\\\",\\\"value\\\":\\\"1\\\",\\\"type\\\":\\\"radio\\\"},{\\\"question\\\":\\\"近两周内是否接触过疫点的发热或有呼吸道症状的患者?\\\",\\\"value\\\":\\\"1\\\",\\\"type\\\":\\\"radio\\\"},{\\\"question\\\":\\\"近两周内是否接触过新冠病毒感染者?\\\",\\\"value\\\":\\\"1\\\",\\\"type\\\":\\\"radio\\\"},{\\\"question\\\":\\\"近两周内是否有出现过发热?\\\",\\\"value\\\":\\\"1\\\",\\\"type\\\":\\\"radio\\\"},{\\\"question\\\":\\\"有无聚集性发病?\\\",\\\"value\\\":\\\"1\\\",\\\"type\\\":\\\"radio\\\"}]\"','2020-03-19 17:24:44','2020-03-19 17:24:44'),(11,'213','18592071704','441702199806013818',2,'35','\"[{\\\"question\\\":\\\"近两周内是否曾去过湖北、温州或其他有病例报告的社区?\\\",\\\"value\\\":\\\"1\\\",\\\"type\\\":\\\"radio\\\"},{\\\"question\\\":\\\"近两周内是否接触过疫点的发热或有呼吸道症状的患者?\\\",\\\"value\\\":\\\"1\\\",\\\"type\\\":\\\"radio\\\"},{\\\"question\\\":\\\"近两周内是否接触过新冠病毒感染者?\\\",\\\"value\\\":\\\"1\\\",\\\"type\\\":\\\"radio\\\"},{\\\"question\\\":\\\"近两周内是否有出现过发热?\\\",\\\"value\\\":\\\"1\\\",\\\"type\\\":\\\"radio\\\"},{\\\"question\\\":\\\"有无聚集性发病?\\\",\\\"value\\\":\\\"1\\\",\\\"type\\\":\\\"radio\\\"}]\"','2020-03-19 17:26:25','2020-03-19 17:26:25'),(12,'213','18592071704','441702199806013818',2,'35','\"[{\\\"question\\\":\\\"近两周内是否曾去过湖北、温州或其他有病例报告的社区?\\\",\\\"value\\\":\\\"1\\\",\\\"type\\\":\\\"radio\\\"},{\\\"question\\\":\\\"近两周内是否接触过疫点的发热或有呼吸道症状的患者?\\\",\\\"value\\\":\\\"1\\\",\\\"type\\\":\\\"radio\\\"},{\\\"question\\\":\\\"近两周内是否接触过新冠病毒感染者?\\\",\\\"value\\\":\\\"1\\\",\\\"type\\\":\\\"radio\\\"},{\\\"question\\\":\\\"近两周内是否有出现过发热?\\\",\\\"value\\\":\\\"1\\\",\\\"type\\\":\\\"radio\\\"},{\\\"question\\\":\\\"有无聚集性发病?\\\",\\\"value\\\":\\\"1\\\",\\\"type\\\":\\\"radio\\\"}]\"','2020-03-19 17:26:32','2020-03-19 17:26:32'),(13,'否测试','18592071704','441702199806013818',2,'35','\"[{\\\"question\\\":\\\"近两周内是否曾去过湖北、温州或其他有病例报告的社区?\\\",\\\"value\\\":\\\"1\\\",\\\"type\\\":\\\"radio\\\"},{\\\"question\\\":\\\"近两周内是否接触过疫点的发热或有呼吸道症状的患者?\\\",\\\"value\\\":\\\"1\\\",\\\"type\\\":\\\"radio\\\"},{\\\"question\\\":\\\"近两周内是否接触过新冠病毒感染者?\\\",\\\"value\\\":\\\"1\\\",\\\"type\\\":\\\"radio\\\"},{\\\"question\\\":\\\"近两周内是否有出现过发热?\\\",\\\"value\\\":\\\"1\\\",\\\"type\\\":\\\"radio\\\"},{\\\"question\\\":\\\"有无聚集性发病?\\\",\\\"value\\\":\\\"1\\\",\\\"type\\\":\\\"radio\\\"}]\"','2020-03-19 17:39:53','2020-03-19 17:39:53'),(14,'是否测试','18592071704','441702199806013818',2,'35','\"[{\\\"question\\\":\\\"近两周内是否曾去过湖北、温州或其他有病例报告的社区?\\\",\\\"value\\\":\\\"0\\\",\\\"type\\\":\\\"radio\\\"},{\\\"question\\\":\\\"近两周内是否接触过疫点的发热或有呼吸道症状的患者?\\\",\\\"value\\\":\\\"0\\\",\\\"type\\\":\\\"radio\\\"},{\\\"question\\\":\\\"近两周内是否接触过新冠病毒感染者?\\\",\\\"value\\\":\\\"0\\\",\\\"type\\\":\\\"radio\\\"},{\\\"question\\\":\\\"近两周内是否有出现过发热?\\\",\\\"value\\\":\\\"1\\\",\\\"type\\\":\\\"radio\\\"},{\\\"question\\\":\\\"有无聚集性发病?\\\",\\\"value\\\":\\\"1\\\",\\\"type\\\":\\\"radio\\\"}]\"','2020-03-19 17:42:51','2020-03-19 17:42:51');
/*!40000 ALTER TABLE `customer_healths` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `failed_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `failed_jobs`
--

LOCK TABLES `failed_jobs` WRITE;
/*!40000 ALTER TABLE `failed_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `failed_jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'2014_10_12_000000_create_users_table',1),(2,'2014_10_12_100000_create_password_resets_table',1),(3,'2016_01_04_173148_create_admin_tables',1),(4,'2019_08_19_000000_create_failed_jobs_table',1),(5,'2020_03_17_013832_create_customer_healths_table',2),(7,'2020_04_27_091311_create_t_t__test_forms_table',3),(8,'2020_06_09_111451_change_test_forms_table_add_url',4),(9,'2020_08_17_094218_change_test_form_table_name',5),(10,'2020_08_18_105311_change_test_form_table_url_field',6),(12,'2020_10_17_162206_create_base_common_forms_table',7);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_resets`
--

LOCK TABLES `password_resets` WRITE;
/*!40000 ALTER TABLE `password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_resets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_t__test_forms`
--

DROP TABLE IF EXISTS `t_t__test_forms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_t__test_forms` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `channel` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `question_data` json DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `url` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_t__test_forms`
--

LOCK TABLES `t_t__test_forms` WRITE;
/*!40000 ALTER TABLE `t_t__test_forms` DISABLE KEYS */;
INSERT INTO `t_t__test_forms` VALUES (1,'131','13111111111',NULL,NULL,'2020-04-27 06:03:19','2020-04-27 06:03:19',NULL),(2,'131','13111111111','toutiao',NULL,'2020-04-27 06:03:58','2020-04-27 06:03:58',NULL),(3,'131','13111111111','toutiao',NULL,'2020-04-27 06:04:07','2020-04-27 06:04:07',NULL),(4,'1311','13111111111','toutiao',NULL,'2020-04-27 06:05:02','2020-04-27 06:05:02',NULL),(5,'`123','13112344321',NULL,'{\"您多大年龄了呢?\": \"35-45岁\", \"您的牙齿目前情况?\": \"牙齿修复\", \"目前您的牙齿情况是？\": \"烂牙\"}','2020-06-04 03:42:53','2020-06-04 03:42:53',NULL),(6,'123','13112343214',NULL,'{\"您多大年龄了呢?\": \"35-45岁\", \"您的牙齿目前情况?\": \"牙齿修复\", \"目前您的牙齿情况是？\": \"烂牙\"}','2020-06-04 03:43:58','2020-06-04 03:43:58',NULL),(7,'123','13112344321',NULL,'{\"您多大年龄了呢?\": \"35-45岁\", \"您的牙齿目前情况?\": \"牙齿修复\", \"目前您的牙齿情况是？\": \"烂牙\"}','2020-06-04 03:44:33','2020-06-04 03:44:33',NULL),(8,'123','13112344321',NULL,'{\"您多大年龄了呢?\": \"35-45岁\", \"您的牙齿目前情况?\": \"牙齿修复\", \"目前您的牙齿情况是？\": \"烂牙\"}','2020-06-04 03:44:49','2020-06-04 03:44:49',NULL),(9,'123','13112344321',NULL,'{\"您多大年龄了呢?\": \"35-45岁\", \"您的牙齿目前情况?\": \"牙齿修复\", \"目前您的牙齿情况是？\": \"烂牙\"}','2020-06-04 03:45:46','2020-06-04 03:45:46',NULL),(10,'123','13112344312',NULL,'{\"您多大年龄了呢?\": \"35-45岁\", \"您的牙齿目前情况?\": \"牙齿修复\", \"目前您的牙齿情况是？\": \"烂牙\"}','2020-06-04 03:46:08','2020-06-04 03:46:08',NULL),(11,'131','13112344321',NULL,'{\"您多大年龄了呢?\": \"35-45岁\", \"您的牙齿目前情况?\": \"牙齿修复\", \"目前您的牙齿情况是？\": \"烂牙\"}','2020-06-04 03:47:16','2020-06-04 03:47:16',NULL),(12,'123','13112344321',NULL,'{\"您多大年龄了呢?\": \"35-45岁\", \"您的牙齿目前情况?\": \"牙齿修复\", \"目前您的牙齿情况是？\": \"烂牙\"}','2020-06-05 09:16:43','2020-06-05 09:16:43',NULL),(13,'123','13112344321',NULL,'{\"您多大年龄了呢?\": \"35-45岁\", \"您的牙齿目前情况?\": \"牙齿修复\", \"目前您的牙齿情况是？\": \"烂牙\"}','2020-06-05 09:17:23','2020-06-05 09:17:23',NULL),(14,'123','13112344312',NULL,'{\"您多大年龄了呢?\": \"18-35岁\", \"您的牙齿目前情况?\": \"牙齿修复\", \"目前您的牙齿情况是？\": \"烂牙\"}','2020-06-05 09:18:45','2020-06-05 09:18:45',NULL),(15,'131','13112344321',NULL,'{\"留言\": null}','2020-06-05 09:19:21','2020-06-05 09:19:21',NULL),(16,'131','13112344312',NULL,'{\"留言\": null}','2020-06-05 09:19:38','2020-06-05 09:19:38',NULL),(17,'131','13112344312',NULL,'{\"留言\": null}','2020-06-05 11:57:15','2020-06-05 11:57:15',NULL),(18,'131','13112344312',NULL,'{\"留言\": null}','2020-06-05 11:57:19','2020-06-05 11:57:19',NULL),(19,'13','13112344321',NULL,'{\"留言\": null}','2020-06-05 12:00:33','2020-06-05 12:00:33',NULL),(20,'31','13112344321',NULL,'{\"留言\": null}','2020-06-05 12:01:21','2020-06-05 12:01:21',NULL),(21,'123','13112344312',NULL,'{\"年龄\": \"24-34岁\", \"性别\": \"男\", \"项目\": \"下巴\"}','2020-06-06 13:12:48','2020-06-06 13:12:48',NULL),(22,'123131','13112344321',NULL,'{\"您的性别是?\": \"女\", \"您多大年龄了呢?\": \"35-45岁\", \"您是想填充那个部位呢?\": \"太阳穴\"}','2020-06-07 01:01:29','2020-06-07 01:01:29',NULL),(23,'131','13112344321',NULL,'{\"您的性别是?\": \"女\", \"您多大年龄了呢?\": \"35-45岁\", \"您是想填充那个部位呢?\": \"太阳穴\"}','2020-06-07 01:01:55','2020-06-07 01:01:55',NULL),(24,'1231','13112344321',NULL,'{\"您的性别是?\": \"女\", \"您多大年龄了呢?\": \"35-45岁\", \"您是想填充那个部位呢?\": \"太阳穴\"}','2020-06-07 01:07:47','2020-06-07 01:07:47',NULL),(25,'131','13112343214',NULL,'{\"您的性别是?\": \"女\", \"您多大年龄了呢?\": \"35-45岁\", \"您是想填充那个部位呢?\": \"太阳穴\"}','2020-06-07 01:28:39','2020-06-07 01:28:39',NULL),(26,'131','13112344321',NULL,'{\"您的性别是?\": \"女\", \"您多大年龄了呢?\": \"35-45岁\", \"您是想填充那个部位呢?\": \"太阳穴\"}','2020-06-07 02:33:32','2020-06-07 02:33:32',NULL),(27,'131','13112343121',NULL,'{\"您的性别是?\": \"女\", \"您多大年龄了呢?\": \"35-45岁\", \"您是想填充那个部位呢?\": \"太阳穴\"}','2020-06-07 02:36:31','2020-06-07 02:36:31',NULL),(28,'131','13112344312',NULL,'{\"您的性别是?\": \"女\", \"您多大年龄了呢?\": \"35-45岁\", \"您是想填充那个部位呢?\": \"太阳穴\"}','2020-06-07 02:40:00','2020-06-07 02:40:00',NULL),(29,'131','13112344321',NULL,'{\"您的性别是?\": \"女\", \"您多大年龄了呢?\": \"35-45岁\", \"您是想填充那个部位呢?\": \"太阳穴\"}','2020-06-07 02:40:14','2020-06-07 02:40:14',NULL),(31,'131','13112343123','123','{\"您的性别是?\": \"女\", \"您多大年龄了呢?\": \"35-45岁\", \"您当前皮肤存在什么问题?\": \"红血丝\", \"您想咨询哪方面的问题呢?\": \"皮肤\", \"您想咨询皮肤的哪些问题呢?\": \"美白嫩肤\"}','2020-06-07 02:54:54','2020-06-09 05:50:41','https://topsaleyme.icu'),(32,'123','13112344321',NULL,'{\"您的性别是?\": \"男\", \"您多大年龄了呢?\": \"18以下\", \"您希望用哪种方式呢?\": \"埋线\", \"您想咨询哪方面的问题呢?\": \"眼部\", \"您想咨询眼部的什么问题呢?\": \"双眼皮\"}','2020-06-18 12:05:56','2020-06-18 12:05:56','http://localhost:8080/#/'),(33,'131','13112344321',NULL,'\"123\"','2020-06-18 12:41:28','2020-06-18 12:41:28','http://localhost:8080/#/concat'),(34,'1231','13112344321',NULL,NULL,'2020-06-18 12:42:24','2020-06-18 12:42:24','http://localhost:8080/#/concat'),(35,'132','13112344321',NULL,'{\"您多大年龄了呢?\": \"18-35岁\", \"您希望的改善方式？\": \"切开\", \"您目前的眼部问题？\": \"内双\"}','2020-06-20 01:59:52','2020-06-20 01:59:52','http://localhost:8080/#/price'),(36,'1231','13112344321',NULL,'{\"name\": \"1231\", \"phone\": \"13112344321\", \"年龄\": \"石原里美\", \"关键字\": \"牙齿不齐\"}','2020-07-06 10:14:47','2020-07-06 10:14:47','http://localhost:8080/#/chat/'),(37,NULL,'13112344321','123','{\"phone\": \"13112344321\", \"年龄\": \"23-35\", \"关键字\": \"开始检测\", \"您目前的眼部情况是?\\u000b\": \"单眼皮\", \"关于双眼皮你更关心哪一方面\": \"医院规模\", \"您之前有在其他医院面诊过吗？\": \"有\"}','2020-08-17 01:45:52','2020-08-17 01:45:52','http://localhost:8080/?channel=123#/'),(38,NULL,'13112344321','123','{\"phone\": \"13112344321\", \"年龄\": \"18以下\", \"关键字\": \"开始检测\", \"您目前的眼部情况是?\\u000b\": \"肿泡眼\", \"关于双眼皮你更关心哪一方面\": \"医院规模\", \"您之前有在其他医院面诊过吗？\": \"有\"}','2020-08-17 01:50:05','2020-08-17 01:50:05','http://localhost:8080/?channel=123#/'),(39,NULL,'13112344312','美柚','{\"phone\": \"13112344312\", \"年龄\": \"18以下\", \"关键字\": \"开始检测\", \"您目前的眼部情况是?\\u000b\": \"单眼皮\", \"关于双眼皮你更关心哪一方面\": \"医院规模\", \"您之前有在其他医院面诊过吗？\": \"有\"}','2020-08-17 01:51:55','2020-08-17 01:51:55','http://localhost:8080/#/');
/*!40000 ALTER TABLE `t_t__test_forms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
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

-- Dump completed on 2021-02-25 16:09:30
