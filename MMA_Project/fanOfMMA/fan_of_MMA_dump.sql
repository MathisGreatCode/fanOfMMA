-- MySQL dump 10.13  Distrib 8.0.32, for Win64 (x86_64)
--
-- Host: localhost    Database: fanofmma
-- ------------------------------------------------------
-- Server version	8.0.32

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
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add user',4,'add_user'),(14,'Can change user',4,'change_user'),(15,'Can delete user',4,'delete_user'),(16,'Can view user',4,'view_user'),(17,'Can add content type',5,'add_contenttype'),(18,'Can change content type',5,'change_contenttype'),(19,'Can delete content type',5,'delete_contenttype'),(20,'Can view content type',5,'view_contenttype'),(21,'Can add session',6,'add_session'),(22,'Can change session',6,'change_session'),(23,'Can delete session',6,'delete_session'),(24,'Can view session',6,'view_session'),(25,'Can add fighter',7,'add_fighter'),(26,'Can change fighter',7,'change_fighter'),(27,'Can delete fighter',7,'delete_fighter'),(28,'Can view fighter',7,'view_fighter'),(29,'Can add organization',8,'add_organization'),(30,'Can change organization',8,'change_organization'),(31,'Can delete organization',8,'delete_organization'),(32,'Can view organization',8,'view_organization'),(33,'Can add profile',9,'add_profile'),(34,'Can change profile',9,'change_profile'),(35,'Can delete profile',9,'delete_profile'),(36,'Can view profile',9,'view_profile'),(37,'Can add publication',10,'add_publication'),(38,'Can change publication',10,'change_publication'),(39,'Can delete publication',10,'delete_publication'),(40,'Can view publication',10,'view_publication'),(41,'Can add categroty',11,'add_categroty'),(42,'Can change categroty',11,'change_categroty'),(43,'Can delete categroty',11,'delete_categroty'),(44,'Can view categroty',11,'view_categroty'),(45,'Can add event',12,'add_event'),(46,'Can change event',12,'change_event'),(47,'Can delete event',12,'delete_event'),(48,'Can view event',12,'view_event'),(49,'Can add fight',13,'add_fight'),(50,'Can change fight',13,'change_fight'),(51,'Can delete fight',13,'delete_fight'),(52,'Can view fight',13,'view_fight'),(53,'Can add category',14,'add_category'),(54,'Can change category',14,'change_category'),(55,'Can delete category',14,'delete_category'),(56,'Can view category',14,'view_category');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$600000$aG0emc1XSbFTHeQiKfPtVy$s82bWShxOyH+6u495fv52oS3TIix64OD/SMiKKaUSuA=','2023-04-13 15:45:56.354054',1,'admin','','','admin@fom.com',1,1,'2023-03-25 13:02:03.382253'),(19,'',NULL,0,'Joe','','','',0,1,'2023-03-25 16:13:54.349691'),(20,'',NULL,0,'Daniel','','','',0,1,'2023-03-27 15:25:51.130801'),(23,'pbkdf2_sha256$600000$rJRPFNClEIgUvzlKRuOt1p$h/ULgLD9G8HImJ0sj4eyaMNXzHTZDkTS9e13+Um2ooo=','2023-04-12 14:07:58.359654',0,'user_0808','','','user@gmail.com',0,1,'2023-04-05 12:57:09.863526'),(24,'pbkdf2_sha256$600000$MVtwasqDYjfcNVykuA3hQz$7niTpYbTqESr7JzoF9zC8ijmNSg9Tdwg7qRmyJxcrvM=','2023-04-07 14:54:25.944784',0,'Marc','','','marc@mma.com',0,1,'2023-04-07 14:54:15.466948');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_groups` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=87 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2023-03-25 15:03:48.485794','1','Jon Jones',1,'[{\"added\": {}}]',7,1),(2,'2023-03-25 15:04:49.236942','2','Jamahal Hill',1,'[{\"added\": {}}]',7,1),(3,'2023-03-25 15:05:29.060044','3','Alex Pereira',1,'[{\"added\": {}}]',7,1),(4,'2023-03-25 15:05:49.837744','4','Leon Edwards',1,'[{\"added\": {}}]',7,1),(5,'2023-03-25 15:20:06.506546','5','Islam Makhachev',1,'[{\"added\": {}}]',7,1),(6,'2023-03-25 15:21:29.253908','6','Alexander Volkanovski',1,'[{\"added\": {}}]',7,1),(7,'2023-03-25 15:22:02.308662','7','Aljamain Sterling',1,'[{\"added\": {}}]',7,1),(8,'2023-03-25 15:22:56.261259','8','Brandon Moreno',1,'[{\"added\": {}}]',7,1),(9,'2023-03-25 15:25:50.629505','1','UFC',1,'[{\"added\": {}}]',8,1),(10,'2023-03-25 15:28:11.090948','2','Bellator',1,'[{\"added\": {}}]',8,1),(11,'2023-03-25 15:29:52.898200','3','One Championship',1,'[{\"added\": {}}]',8,1),(12,'2023-03-25 16:13:54.360818','19','Joe',1,'[{\"added\": {}}, {\"added\": {\"name\": \"profile\", \"object\": \"Joe\"}}]',4,1),(13,'2023-03-27 14:07:54.346750','19','Joe',2,'[{\"changed\": {\"name\": \"profile\", \"object\": \"Joe\", \"fields\": [\"Fav fighters\"]}}]',4,1),(14,'2023-03-27 14:15:53.011987','19','Joe',2,'[{\"changed\": {\"name\": \"profile\", \"object\": \"Joe\", \"fields\": [\"Fav fighters\"]}}]',4,1),(15,'2023-03-27 14:22:32.138181','19','Joe',2,'[]',4,1),(16,'2023-03-27 14:24:09.192642','19','Joe',2,'[]',4,1),(17,'2023-03-27 14:26:28.726311','19','Joe',2,'[]',4,1),(18,'2023-03-27 14:28:04.408805','19','Joe',2,'[]',4,1),(19,'2023-03-27 14:37:36.925865','19','Joe',2,'[]',4,1),(20,'2023-03-27 14:41:19.078219','19','Joe',2,'[]',4,1),(21,'2023-03-27 14:43:59.677668','19','Joe',2,'[]',4,1),(22,'2023-03-27 14:44:24.333178','19','Joe',2,'[{\"changed\": {\"name\": \"profile\", \"object\": \"Joe\", \"fields\": [\"Fav fighters\"]}}]',4,1),(23,'2023-03-27 14:46:36.315464','19','Joe',2,'[]',4,1),(24,'2023-03-27 15:09:22.573361','19','Joe',2,'[{\"changed\": {\"name\": \"profile\", \"object\": \"Joe\", \"fields\": [\"Fav fighter\"]}}]',4,1),(25,'2023-03-27 15:09:51.330419','1','admin',2,'[{\"added\": {\"name\": \"profile\", \"object\": \"admin\"}}]',4,1),(26,'2023-03-27 15:25:51.137806','20','Daniel',1,'[{\"added\": {}}, {\"added\": {\"name\": \"profile\", \"object\": \"Daniel\"}}]',4,1),(27,'2023-03-27 15:26:03.929548','19','Joe',2,'[{\"changed\": {\"name\": \"profile\", \"object\": \"Joe\", \"fields\": [\"Fav fighter\"]}}]',4,1),(28,'2023-03-29 14:36:25.820825','3','One Championship',2,'[{\"changed\": {\"fields\": [\"Description\"]}}]',8,1),(29,'2023-03-31 13:04:52.309689','1','admin2023-03-31 13:04:52.308688+00:00first publicatiopn',1,'[{\"added\": {}}]',10,1),(30,'2023-03-31 13:07:05.297283','1','admin31.03.2023 13:04first publication',2,'[{\"changed\": {\"fields\": [\"Body\"]}}]',10,1),(31,'2023-03-31 13:50:24.715434','2','Joe  31.03.2023 13:50  hey guys',1,'[{\"added\": {}}]',10,1),(32,'2023-03-31 14:42:15.408000','3','admin  31.03.2023 14:42  other publication',1,'[{\"added\": {}}]',10,1),(33,'2023-03-31 14:43:24.042530','3','admin  31.03.2023 14:42  other publication',3,'',10,1),(34,'2023-04-05 12:45:40.334398','21','user_0808',3,'',4,1),(35,'2023-04-05 12:56:26.816765','22','user_0808',3,'',4,1),(36,'2023-04-06 14:04:27.056864','1','Category object (1)',1,'[{\"added\": {}}]',14,1),(37,'2023-04-06 15:07:51.348520','2','Bantamweight',1,'[{\"added\": {}}]',14,1),(38,'2023-04-06 15:08:06.116988','3','Featherweight',1,'[{\"added\": {}}]',14,1),(39,'2023-04-06 15:08:19.714819','4','Lightweight',1,'[{\"added\": {}}]',14,1),(40,'2023-04-06 15:08:32.300590','5','Welterweight',1,'[{\"added\": {}}]',14,1),(41,'2023-04-06 15:08:52.339671','6','Middleweight',1,'[{\"added\": {}}]',14,1),(42,'2023-04-06 15:09:05.148751','7','Light Heavyweight',1,'[{\"added\": {}}]',14,1),(43,'2023-04-06 15:09:17.202374','8','Heavyweight',1,'[{\"added\": {}}]',14,1),(44,'2023-04-06 15:56:15.676121','1','UFC 287',1,'[{\"added\": {}}]',12,1),(45,'2023-04-06 16:02:01.602699','2','BELLATOR 296',1,'[{\"added\": {}}]',12,1),(46,'2023-04-06 17:04:42.148005','3','UFC 286',1,'[{\"added\": {}}]',12,1),(47,'2023-04-07 13:29:11.927873','9','Israel Adesanya',1,'[{\"added\": {}}]',7,1),(48,'2023-04-07 13:39:20.131051','10','Gilbert Burns',1,'[{\"added\": {}}]',7,1),(49,'2023-04-07 13:39:56.382980','11','Jorge Masvidal',1,'[{\"added\": {}}]',7,1),(50,'2023-04-07 13:40:42.336739','12','Rob Font',1,'[{\"added\": {}}]',7,1),(51,'2023-04-07 13:41:18.072667','13','Adrian Yanez',1,'[{\"added\": {}}]',7,1),(52,'2023-04-07 13:41:53.944803','14','Kevin Holland',1,'[{\"added\": {}}]',7,1),(53,'2023-04-07 13:42:26.616025','15','Santiago Ponzinibbio',1,'[{\"added\": {}}]',7,1),(54,'2023-04-07 13:43:02.962430','16','Raul Rosas Jr.',1,'[{\"added\": {}}]',7,1),(55,'2023-04-07 13:43:28.952000','17','Christian',1,'[{\"added\": {}}]',7,1),(56,'2023-04-07 13:44:10.919229','18','Chris Curtis',1,'[{\"added\": {}}]',7,1),(57,'2023-04-07 13:44:34.312056','19','Kevin Gastelum',1,'[{\"added\": {}}]',7,1),(58,'2023-04-07 13:45:11.676148','1','Alex Pereira vs Israel Adesanya ',1,'[{\"added\": {}}]',13,1),(59,'2023-04-07 13:45:29.138944','2','Gilbert Burns vs Jorge Masvidal ',1,'[{\"added\": {}}]',13,1),(60,'2023-04-07 13:45:46.979219','3','Rob Font vs Adrian Yanez ',1,'[{\"added\": {}}]',13,1),(61,'2023-04-07 13:46:20.409877','4','Kevin Holland vs Santiago Ponzinibbio ',1,'[{\"added\": {}}]',13,1),(62,'2023-04-07 13:48:49.279146','17','Christian Rodriguez',2,'[{\"changed\": {\"fields\": [\"Name\", \"Nickname\"]}}]',7,1),(63,'2023-04-07 13:49:22.383680','5','Raul Rosas Jr. vs Christian Rodriguez ',1,'[{\"added\": {}}]',13,1),(64,'2023-04-07 13:49:51.095555','6','Chris Curtis vs Kevin Gastelum ',1,'[{\"added\": {}}]',13,1),(65,'2023-04-07 14:06:47.117861','20','Kamaru Usman',1,'[{\"added\": {}}]',7,1),(66,'2023-04-07 14:07:19.605180','21','Justin Gaethje',1,'[{\"added\": {}}]',7,1),(67,'2023-04-07 14:07:52.115860','22','Rafael Fiziev',1,'[{\"added\": {}}]',7,1),(68,'2023-04-07 14:08:35.053109','23','Muhammad Mokaev',1,'[{\"added\": {}}]',7,1),(69,'2023-04-07 14:09:20.115680','24','Jafel Filho',1,'[{\"added\": {}}]',7,1),(70,'2023-04-07 14:09:44.374975','7','Leon Edwards vs Kamaru Usman ',1,'[{\"added\": {}}]',13,1),(71,'2023-04-07 14:10:01.542959','8','Justin Gaethje vs Rafael Fiziev ',1,'[{\"added\": {}}]',13,1),(72,'2023-04-07 14:10:25.505109','9','Muhammad Mokaev vs Jafel Filho ',1,'[{\"added\": {}}]',13,1),(73,'2023-04-13 15:49:00.246879','4','ONE Fight Night 10',1,'[{\"added\": {}}]',12,1),(74,'2023-04-13 15:51:10.665624','25','Demetrious Johnson',1,'[{\"added\": {}}]',7,1),(75,'2023-04-13 15:52:51.871078','26','Adriano Moraes',1,'[{\"added\": {}}]',7,1),(76,'2023-04-13 15:55:56.571535','10','Demetrious Johnson vs Adriano Moraes ',1,'[{\"added\": {}}]',13,1),(77,'2023-04-13 15:59:13.782757','5','Bellator 295',1,'[{\"added\": {}}]',12,1),(78,'2023-04-13 15:59:53.467249','27','RAUFEON STOTS',1,'[{\"added\": {}}]',7,1),(79,'2023-04-13 16:00:06.531584','28','PATCHY MIX',1,'[{\"added\": {}}]',7,1),(80,'2023-04-13 16:37:02.018349','11','RAUFEON STOTS vs PATCHY MIX ',1,'[{\"added\": {}}]',13,1),(81,'2023-04-13 16:39:39.837435','29','Gerard Mousasi',1,'[{\"added\": {}}]',7,1),(82,'2023-04-13 16:40:40.381288','30','Fabian Edwards',1,'[{\"added\": {}}]',7,1),(83,'2023-04-13 16:41:31.204703','31','Brent Primus',1,'[{\"added\": {}}]',7,1),(84,'2023-04-13 16:43:22.563775','32','Mansour Barnaoui',1,'[{\"added\": {}}]',7,1),(85,'2023-04-13 16:44:24.264171','12','Gerard Mousasi vs Fabian Edwards ',1,'[{\"added\": {}}]',13,1),(86,'2023-04-13 16:44:38.430727','13','Brent Primus vs Mansour Barnaoui ',1,'[{\"added\": {}}]',13,1);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(5,'contenttypes','contenttype'),(14,'firstApp','category'),(11,'firstApp','categroty'),(12,'firstApp','event'),(13,'firstApp','fight'),(7,'firstApp','fighter'),(8,'firstApp','organization'),(9,'firstApp','profile'),(10,'firstApp','publication'),(6,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_migrations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2023-03-10 13:47:28.520824'),(2,'auth','0001_initial','2023-03-10 13:47:28.821770'),(3,'admin','0001_initial','2023-03-10 13:47:28.900022'),(4,'admin','0002_logentry_remove_auto_add','2023-03-10 13:47:28.907028'),(5,'admin','0003_logentry_add_action_flag_choices','2023-03-10 13:47:28.913134'),(6,'contenttypes','0002_remove_content_type_name','2023-03-10 13:47:28.966955'),(7,'auth','0002_alter_permission_name_max_length','2023-03-10 13:47:29.005569'),(8,'auth','0003_alter_user_email_max_length','2023-03-10 13:47:29.025589'),(9,'auth','0004_alter_user_username_opts','2023-03-10 13:47:29.031598'),(10,'auth','0005_alter_user_last_login_null','2023-03-10 13:47:29.073142'),(11,'auth','0006_require_contenttypes_0002','2023-03-10 13:47:29.076145'),(12,'auth','0007_alter_validators_add_error_messages','2023-03-10 13:47:29.082465'),(13,'auth','0008_alter_user_username_max_length','2023-03-10 13:47:29.123501'),(14,'auth','0009_alter_user_last_name_max_length','2023-03-10 13:47:29.176199'),(15,'auth','0010_alter_group_name_max_length','2023-03-10 13:47:29.192925'),(16,'auth','0011_update_proxy_permissions','2023-03-10 13:47:29.199703'),(17,'auth','0012_alter_user_first_name_max_length','2023-03-10 13:47:29.236740'),(18,'firstApp','0001_initial','2023-03-10 13:47:29.262068'),(19,'sessions','0001_initial','2023-03-10 13:47:29.291094'),(20,'firstApp','0002_profile','2023-03-25 14:16:10.774128'),(21,'firstApp','0003_fighter_loss_fighter_win','2023-03-25 15:03:07.883086'),(22,'firstApp','0004_alter_fighter_nickname','2023-03-25 15:10:47.671179'),(23,'firstApp','0005_alter_profile_fav_org','2023-03-25 16:12:33.066855'),(24,'firstApp','0006_remove_profile_fav_fighters_profile_fav_fighter','2023-03-27 15:08:35.336277'),(25,'firstApp','0007_profile_last_update','2023-03-27 15:55:27.643415'),(26,'firstApp','0008_publication','2023-03-31 12:43:10.094495'),(27,'firstApp','0009_alter_publication_body','2023-04-03 13:22:30.432383'),(28,'firstApp','0010_categroty_event_fight','2023-04-04 14:27:54.238419'),(29,'firstApp','0011_category_alter_fight_category_delete_categroty','2023-04-06 13:56:16.608950'),(30,'firstApp','0012_alter_category_kg','2023-04-06 14:04:09.656912');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('lyj1yehz09xxlt728f3rt5f1vi351isy','.eJxVjEsOAiEQBe_C2hD5NDQu3c8ZSAONjBommc_KeHedZBa6fVX1XiLStra4LTzHsYiLUOL0uyXKD-47KHfqt0nmqa_zmOSuyIMucpgKP6-H-3fQaGnf2ljOGp0Bi6E4hoAVmB1qzF4VQlCEPgR_LlSVRUSnqgatkwkKoGrx_gDCWDaz:1pmz92:apFS3JcUf4BZt68Xx4ymNXAiKUwpyis0EUOgqlHVq80','2023-04-27 15:45:56.356751'),('xzj79rwj15dx8bxmebiz2gndln3wy38s','.eJxVjEEOwiAQRe_C2hDaAtNx6d4zkIGZStVAUtqV8e7apAvd_vfef6lA25rD1mQJM6uz6q06_Y6R0kPKTvhO5VZ1qmVd5qh3RR-06WtleV4O9-8gU8vf2hEAecBuYhkHAEsETGPvjdg4IDvsDGHiGBmjRRTwxlnBwfpkJiH1_gALvThR:1pknTt:ZZatLd5SoBl-VgnOsMS2_vxrzcj2ZzBR2gjDR--V9Rg','2023-04-21 14:54:25.946440');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `firstapp_category`
--

DROP TABLE IF EXISTS `firstapp_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `firstapp_category` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `kg` decimal(4,1) NOT NULL,
  `lbs` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `firstapp_category`
--

LOCK TABLES `firstapp_category` WRITE;
/*!40000 ALTER TABLE `firstapp_category` DISABLE KEYS */;
INSERT INTO `firstapp_category` VALUES (1,'Flyweight',56.7,125),(2,'Bantamweight',61.2,135),(3,'Featherweight',65.8,145),(4,'Lightweight',70.3,155),(5,'Welterweight',77.1,170),(6,'Middleweight',83.9,185),(7,'Light Heavyweight',93.0,205),(8,'Heavyweight',120.2,265);
/*!40000 ALTER TABLE `firstapp_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `firstapp_event`
--

DROP TABLE IF EXISTS `firstapp_event`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `firstapp_event` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `date_time` datetime(6) NOT NULL,
  `place` varchar(40) NOT NULL,
  `orga_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `firstApp_event_orga_id_c2c87718_fk_firstApp_organization_id` (`orga_id`),
  CONSTRAINT `firstApp_event_orga_id_c2c87718_fk_firstApp_organization_id` FOREIGN KEY (`orga_id`) REFERENCES `firstapp_organization` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `firstapp_event`
--

LOCK TABLES `firstapp_event` WRITE;
/*!40000 ALTER TABLE `firstapp_event` DISABLE KEYS */;
INSERT INTO `firstapp_event` VALUES (1,'UFC 287','2023-04-09 04:00:00.000000','Miami, Florida',1),(2,'BELLATOR 296','2023-05-12 06:00:00.000000','Paris, France',2),(3,'UFC 286','2023-03-18 22:00:00.000000','London, UK',1),(4,'ONE Fight Night 10','2023-05-05 23:59:00.000000','Denver, USA',3),(5,'Bellator 295','2023-04-22 02:00:00.000000','Honolulu, USA',2);
/*!40000 ALTER TABLE `firstapp_event` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `firstapp_fight`
--

DROP TABLE IF EXISTS `firstapp_fight`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `firstapp_fight` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `category_id` bigint NOT NULL,
  `event_id` bigint NOT NULL,
  `fighter1_id` bigint NOT NULL,
  `fighter2_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `firstApp_fight_event_id_4747b579_fk_firstApp_event_id` (`event_id`),
  KEY `firstApp_fight_fighter1_id_35647ef4_fk_firstApp_fighter_id` (`fighter1_id`),
  KEY `firstApp_fight_fighter2_id_2ef55bbc_fk_firstApp_fighter_id` (`fighter2_id`),
  KEY `firstApp_fight_category_id_c859a532_fk_firstApp_category_id` (`category_id`),
  CONSTRAINT `firstApp_fight_category_id_c859a532_fk_firstApp_category_id` FOREIGN KEY (`category_id`) REFERENCES `firstapp_category` (`id`),
  CONSTRAINT `firstApp_fight_event_id_4747b579_fk_firstApp_event_id` FOREIGN KEY (`event_id`) REFERENCES `firstapp_event` (`id`),
  CONSTRAINT `firstApp_fight_fighter1_id_35647ef4_fk_firstApp_fighter_id` FOREIGN KEY (`fighter1_id`) REFERENCES `firstapp_fighter` (`id`),
  CONSTRAINT `firstApp_fight_fighter2_id_2ef55bbc_fk_firstApp_fighter_id` FOREIGN KEY (`fighter2_id`) REFERENCES `firstapp_fighter` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `firstapp_fight`
--

LOCK TABLES `firstapp_fight` WRITE;
/*!40000 ALTER TABLE `firstapp_fight` DISABLE KEYS */;
INSERT INTO `firstapp_fight` VALUES (1,6,1,3,9),(2,5,1,10,11),(3,2,1,12,13),(4,5,1,14,15),(5,2,1,16,17),(6,6,1,18,19),(7,5,3,4,20),(8,4,3,21,22),(9,1,3,23,24),(10,1,4,25,26),(11,2,5,27,28),(12,6,2,29,30),(13,4,2,31,32);
/*!40000 ALTER TABLE `firstapp_fight` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `firstapp_fighter`
--

DROP TABLE IF EXISTS `firstapp_fighter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `firstapp_fighter` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `nickname` varchar(50) NOT NULL,
  `loss` int NOT NULL,
  `win` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `firstapp_fighter`
--

LOCK TABLES `firstapp_fighter` WRITE;
/*!40000 ALTER TABLE `firstapp_fighter` DISABLE KEYS */;
INSERT INTO `firstapp_fighter` VALUES (1,'Jon Jones','Bones',1,27),(2,'Jamahal Hill','Sweet Dreams',1,12),(3,'Alex Pereira','Poatan',1,7),(4,'Leon Edwards','Rocky',3,21),(5,'Islam Makhachev','',1,24),(6,'Alexander Volkanovski','The Great',2,25),(7,'Aljamain Sterling','Funk Master',3,22),(8,'Brandon Moreno','The Assassin Baby',6,21),(9,'Israel Adesanya','THE LAST STYLEBENDER',2,23),(10,'Gilbert Burns','DURINHO',5,21),(11,'Jorge Masvidal','GAMEBRED',16,35),(12,'Rob Font','',6,19),(13,'Adrian Yanez','',3,16),(14,'Kevin Holland','TRAILBLAZER',9,23),(15,'Santiago Ponzinibbio','ARGENTINE DAGGER',6,30),(16,'Raul Rosas Jr.','EL NINO PROBLEMA',0,7),(17,'Christian Rodriguez','',1,8),(18,'Chris Curtis','ACTION-MAN',9,30),(19,'Kevin Gastelum','',8,17),(20,'Kamaru Usman','NIGERIAN NIGHTMARE',3,20),(21,'Justin Gaethje','THE HIGHLIGHT',4,25),(22,'Rafael Fiziev','ATAMAN',2,12),(23,'Muhammad Mokaev','THE PUNISHER',0,10),(24,'Jafel Filho','PASTOR',3,14),(25,'Demetrious Johnson','Mighty Mouse',3,30),(26,'Adriano Moraes','Mikinho',4,20),(27,'RAUFEON STOTS','',1,19),(28,'PATCHY MIX','',1,17),(29,'Gerard Mousasi','',8,49),(30,'Fabian Edwards','The Assassin',2,11),(31,'Brent Primus','',3,11),(32,'Mansour Barnaoui','The Afro-Samura├»',4,20);
/*!40000 ALTER TABLE `firstapp_fighter` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `firstapp_organization`
--

DROP TABLE IF EXISTS `firstapp_organization`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `firstapp_organization` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `country` varchar(50) NOT NULL,
  `description` varchar(600) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `firstapp_organization`
--

LOCK TABLES `firstapp_organization` WRITE;
/*!40000 ALTER TABLE `firstapp_organization` DISABLE KEYS */;
INSERT INTO `firstapp_organization` VALUES (1,'UFC','USA','UFC, or Ultimate Fighting Championship, is a combat sports organization that promotes mixed martial arts competitions. The fighters come from diverse martial arts backgrounds and showcase their skills in an octagonal cage. UFC has become a worldwide phenomenon, captivating audiences with its high-octane fights and producing some of the most talented and entertaining fighters in the world.'),(2,'Bellator','USA','Bellator MMA is a leading mixed martial arts organization that features some of the world\'s top fighters. Established in 2008, Bellator has grown to become a major competitor to UFC. One of Bellator\'s unique features is its tournament format, where fighters compete in a bracket-style format to determine the champion. Bellator also boasts a diverse roster of fighters from all over the world, including established veterans and up-and-coming prospects.'),(3,'One Championship','Singapore','ONE Championship is a Singapore-based mixed martial arts promotion that has quickly gained popularity throughout Asia and beyond. ONE\'s focus is not only on martial arts competition, but also on promoting values such as respect, honor, and humility. The organization has a strong commitment to safety, with stringent rules and regulations to protect the fighters. ONE features some of the world\'s top fighters, including champions from a variety of disciplines, competing in both mixed martial arts and kickboxing. With its unique blend of sport and values-driven messaging.');
/*!40000 ALTER TABLE `firstapp_organization` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `firstapp_profile`
--

DROP TABLE IF EXISTS `firstapp_profile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `firstapp_profile` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `fav_org_id` bigint NOT NULL,
  `user_id` int NOT NULL,
  `fav_fighter_id` bigint DEFAULT NULL,
  `last_update` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`),
  KEY `firstApp_profile_fav_org_id_3a63ba60_fk_firstApp_organization_id` (`fav_org_id`),
  KEY `firstApp_profile_fav_fighter_id_7b55a05f_fk_firstApp_fighter_id` (`fav_fighter_id`),
  CONSTRAINT `firstApp_profile_fav_fighter_id_7b55a05f_fk_firstApp_fighter_id` FOREIGN KEY (`fav_fighter_id`) REFERENCES `firstapp_fighter` (`id`),
  CONSTRAINT `firstApp_profile_fav_org_id_3a63ba60_fk_firstApp_organization_id` FOREIGN KEY (`fav_org_id`) REFERENCES `firstapp_organization` (`id`),
  CONSTRAINT `firstApp_profile_user_id_d3324769_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `firstapp_profile`
--

LOCK TABLES `firstapp_profile` WRITE;
/*!40000 ALTER TABLE `firstapp_profile` DISABLE KEYS */;
INSERT INTO `firstapp_profile` VALUES (1,1,19,6,'2023-03-27 15:55:27.626295'),(2,1,1,1,'2023-03-27 15:55:27.626295'),(3,1,20,5,'2023-03-27 15:55:27.626295'),(4,3,23,7,'2023-04-05 12:57:10.386252'),(5,2,24,10,'2023-04-07 14:54:16.005716');
/*!40000 ALTER TABLE `firstapp_profile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `firstapp_publication`
--

DROP TABLE IF EXISTS `firstapp_publication`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `firstapp_publication` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `body` varchar(900) NOT NULL,
  `created_time` datetime(6) NOT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `firstApp_publication_user_id_407f5f28_fk_auth_user_id` (`user_id`),
  CONSTRAINT `firstApp_publication_user_id_407f5f28_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `firstapp_publication`
--

LOCK TABLES `firstapp_publication` WRITE;
/*!40000 ALTER TABLE `firstapp_publication` DISABLE KEYS */;
INSERT INTO `firstapp_publication` VALUES (1,'first publication','2023-03-31 13:04:52.308688',1),(2,'hey guys','2023-03-31 13:50:24.714434',19),(4,'hyped by ufc 287 ! main card stackedddd','2023-04-04 16:57:50.200966',1),(5,'hello!!','2023-04-07 14:54:41.382155',24);
/*!40000 ALTER TABLE `firstapp_publication` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-04-15 17:16:09
