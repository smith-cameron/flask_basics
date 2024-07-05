-- MySQL dump 10.13  Distrib 8.0.30, for Win64 (x86_64)
--
-- Host: localhost    Database: exam_db
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
-- Table structure for table `message_likes`
--

DROP TABLE IF EXISTS `message_likes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `message_likes` (
  `user_id` int NOT NULL,
  `message_id` int NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `id` int NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`),
  KEY `fk_table1_users1_idx` (`user_id`),
  KEY `fk_table1_messages1_idx` (`message_id`),
  CONSTRAINT `fk_table1_messages1` FOREIGN KEY (`message_id`) REFERENCES `messages` (`id`),
  CONSTRAINT `fk_table1_users1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `message_likes`
--

LOCK TABLES `message_likes` WRITE;
/*!40000 ALTER TABLE `message_likes` DISABLE KEYS */;
/*!40000 ALTER TABLE `message_likes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `messages`
--

DROP TABLE IF EXISTS `messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `messages` (
  `id` int NOT NULL AUTO_INCREMENT,
  `content` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `creator_id` int NOT NULL,
  `ride_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_messages_users1_idx` (`creator_id`),
  KEY `fk_messages_rides1_idx` (`ride_id`),
  CONSTRAINT `fk_messages_rides1` FOREIGN KEY (`ride_id`) REFERENCES `rides` (`id`),
  CONSTRAINT `fk_messages_users1` FOREIGN KEY (`creator_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `messages`
--

LOCK TABLES `messages` WRITE;
/*!40000 ALTER TABLE `messages` DISABLE KEYS */;
/*!40000 ALTER TABLE `messages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rides`
--

DROP TABLE IF EXISTS `rides`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rides` (
  `id` int NOT NULL AUTO_INCREMENT,
  `destination` varchar(255) DEFAULT NULL,
  `pick_up` varchar(255) DEFAULT NULL,
  `ride_date` date DEFAULT NULL,
  `details` text,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `rider_id` int NOT NULL,
  `driver_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_rides_users_idx` (`rider_id`),
  KEY `fk_rides_users1_idx` (`driver_id`),
  CONSTRAINT `fk_rides_users` FOREIGN KEY (`rider_id`) REFERENCES `users` (`id`),
  CONSTRAINT `fk_rides_users1` FOREIGN KEY (`driver_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rides`
--

LOCK TABLES `rides` WRITE;
/*!40000 ALTER TABLE `rides` DISABLE KEYS */;
INSERT INTO `rides` VALUES (1,'Danny\'s Truck and Auto','Highway 79','2024-06-20','Stranded between Banner Grade and Julian','2024-06-25 16:44:31','2024-07-02 11:35:37',1,2),(2,'The Beach','My House','2024-07-22','i live in Julian. Does 11 am work?','2024-07-02 11:21:25','2024-07-02 11:33:26',6,NULL),(3,'School','123 Thermal Ave','2024-07-22','I will be there at 11','2024-07-02 11:21:25',NULL,3,5),(4,'Grocery Store','123 Thermal Ave','2024-07-22','Im Hungry','2024-07-02 11:21:25','2024-07-02 11:35:37',2,NULL),(5,'School','123 Thermal Ave','2024-07-22','I will be there at 11','2024-07-02 11:21:25',NULL,7,2),(6,'School','123 Thermal Ave','2024-07-22','I will be there at 11','2024-07-02 11:21:25',NULL,6,8);
/*!40000 ALTER TABLE `rides` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Ben','Jammin','bj@email.com','$2b$12$myDXjJr/r.TiXiLwErbPq.kLaVrPLS9p/oc/9dTTk3sQekYkE7SJu','2024-06-25 16:41:46',NULL),(2,'cam','smith','cs@email.com','$2b$12$OZRbRPmniX4MkQhYfM1nTuYIUCSQSrX.tfe8audEpbLaQHzGc4TUi','2024-06-25 17:56:00',NULL),(3,'Billy','Bob','bb@email.com','1234567890','2024-07-02 11:17:03',NULL),(4,'Timmy','Jimmy-Jam','tjj@email.com','1234567890','2024-07-02 11:17:03',NULL),(5,'Ben','Jammin','bj@email.com','1234567890','2024-07-02 11:17:03',NULL),(6,'Test','McTesterson','tmt@email.com','1234567890','2024-07-02 11:17:03',NULL),(7,'DB','Cooper','db@email.com','1234567890','2024-07-02 11:17:03',NULL),(8,'Clint','Eastwood','ce@email.com','1234567890','2024-07-02 11:17:03',NULL);
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

-- Dump completed on 2024-07-02 16:37:26
