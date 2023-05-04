-- MySQL dump 10.13  Distrib 8.0.32, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: ssafytrip
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
-- Table structure for table `accommodations`
--

DROP TABLE IF EXISTS `accommodations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `accommodations` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `description` varchar(45) NOT NULL,
  `address` varchar(45) NOT NULL,
  `phone_number_1` int NOT NULL,
  `phone_number_2` int NOT NULL,
  `phone_number_3` int NOT NULL,
  `email` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accommodations`
--

LOCK TABLES `accommodations` WRITE;
/*!40000 ALTER TABLE `accommodations` DISABLE KEYS */;
/*!40000 ALTER TABLE `accommodations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `accommodations_rating`
--

DROP TABLE IF EXISTS `accommodations_rating`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `accommodations_rating` (
  `accommodations_id` int NOT NULL,
  `user_email` varchar(45) NOT NULL,
  `rating` int NOT NULL,
  PRIMARY KEY (`accommodations_id`,`user_email`),
  KEY `fk_accommodations_has_user_user1_idx` (`user_email`),
  KEY `fk_accommodations_has_user_accommodations1_idx` (`accommodations_id`),
  CONSTRAINT `fk_accommodations_has_user_accommodations1` FOREIGN KEY (`accommodations_id`) REFERENCES `accommodations` (`id`),
  CONSTRAINT `fk_accommodations_has_user_user1` FOREIGN KEY (`user_email`) REFERENCES `user` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accommodations_rating`
--

LOCK TABLES `accommodations_rating` WRITE;
/*!40000 ALTER TABLE `accommodations_rating` DISABLE KEYS */;
/*!40000 ALTER TABLE `accommodations_rating` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `attractions`
--

DROP TABLE IF EXISTS `attractions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `attractions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `description` varchar(45) NOT NULL,
  `phone_number_1` int NOT NULL,
  `phone_number_2` int NOT NULL,
  `phone_number_3` int NOT NULL,
  `business_hours` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attractions`
--

LOCK TABLES `attractions` WRITE;
/*!40000 ALTER TABLE `attractions` DISABLE KEYS */;
/*!40000 ALTER TABLE `attractions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `attractions_rating`
--

DROP TABLE IF EXISTS `attractions_rating`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `attractions_rating` (
  `user_email` varchar(45) NOT NULL,
  `restaurants_id` int NOT NULL,
  `value` int NOT NULL,
  PRIMARY KEY (`user_email`,`restaurants_id`),
  KEY `fk_user_has_attractions_user1_idx` (`user_email`),
  KEY `fk_user_has_attractions_attractions1_idx` (`restaurants_id`),
  CONSTRAINT `fk_user_has_attractions_user1` FOREIGN KEY (`user_email`) REFERENCES `user` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attractions_rating`
--

LOCK TABLES `attractions_rating` WRITE;
/*!40000 ALTER TABLE `attractions_rating` DISABLE KEYS */;
/*!40000 ALTER TABLE `attractions_rating` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `board`
--

DROP TABLE IF EXISTS `board`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `board` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_email` varchar(45) NOT NULL,
  `title` varchar(45) NOT NULL,
  `content` text NOT NULL,
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `view_count` int NOT NULL DEFAULT '0',
  `board_category_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_board_user1_idx` (`user_email`),
  KEY `fk_board_board_category1_idx` (`board_category_id`),
  CONSTRAINT `fk_board_board_category1` FOREIGN KEY (`board_category_id`) REFERENCES `board_category` (`id`),
  CONSTRAINT `fk_board_user1` FOREIGN KEY (`user_email`) REFERENCES `user` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `board`
--

LOCK TABLES `board` WRITE;
/*!40000 ALTER TABLE `board` DISABLE KEYS */;
INSERT INTO `board` VALUES (2,'ssafy@gmail.com','제목','컨텐츠 입니다.','2023-05-02 00:29:31','2023-05-02 00:29:31',0,1),(4,'ssafy@gmail.com','test','test content','2023-05-02 00:55:35','2023-05-02 00:55:35',0,1);
/*!40000 ALTER TABLE `board` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `board_category`
--

DROP TABLE IF EXISTS `board_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `board_category` (
  `id` int NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `board_category`
--

LOCK TABLES `board_category` WRITE;
/*!40000 ALTER TABLE `board_category` DISABLE KEYS */;
INSERT INTO `board_category` VALUES (1,'게시판');
/*!40000 ALTER TABLE `board_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comment`
--

DROP TABLE IF EXISTS `comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comment` (
  `id` int NOT NULL AUTO_INCREMENT,
  `board_id` int NOT NULL,
  `user_email` varchar(45) NOT NULL,
  `content` text,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`,`board_id`,`user_email`),
  KEY `fk_board_has_user_user2_idx` (`user_email`),
  KEY `fk_board_has_user_board2_idx` (`board_id`),
  CONSTRAINT `fk_board_has_user_board2` FOREIGN KEY (`board_id`) REFERENCES `board` (`id`),
  CONSTRAINT `fk_board_has_user_user2` FOREIGN KEY (`user_email`) REFERENCES `user` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comment`
--

LOCK TABLES `comment` WRITE;
/*!40000 ALTER TABLE `comment` DISABLE KEYS */;
/*!40000 ALTER TABLE `comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grade`
--

DROP TABLE IF EXISTS `grade`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `grade` (
  `id` tinyint(1) NOT NULL,
  `grade` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grade`
--

LOCK TABLES `grade` WRITE;
/*!40000 ALTER TABLE `grade` DISABLE KEYS */;
INSERT INTO `grade` VALUES (0,'admin'),(1,'bronze');
/*!40000 ALTER TABLE `grade` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `image`
--

DROP TABLE IF EXISTS `image`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `image` (
  `id` int NOT NULL AUTO_INCREMENT,
  `url` varchar(255) NOT NULL,
  `board_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_image_board1_idx` (`board_id`),
  CONSTRAINT `fk_image_board1` FOREIGN KEY (`board_id`) REFERENCES `board` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `image`
--

LOCK TABLES `image` WRITE;
/*!40000 ALTER TABLE `image` DISABLE KEYS */;
/*!40000 ALTER TABLE `image` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `restaurants`
--

DROP TABLE IF EXISTS `restaurants`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `restaurants` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `description` varchar(255) NOT NULL,
  `address` varchar(45) NOT NULL,
  `phone_number_1` int NOT NULL,
  `phone_number_2` int NOT NULL,
  `phone_number_3` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `restaurants`
--

LOCK TABLES `restaurants` WRITE;
/*!40000 ALTER TABLE `restaurants` DISABLE KEYS */;
/*!40000 ALTER TABLE `restaurants` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `restaurants_rating`
--

DROP TABLE IF EXISTS `restaurants_rating`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `restaurants_rating` (
  `user_email` varchar(45) NOT NULL,
  `restaurants_id` int NOT NULL,
  `rating` int NOT NULL,
  PRIMARY KEY (`user_email`,`restaurants_id`),
  KEY `fk_user_has_restaurants_restaurants1_idx` (`restaurants_id`),
  KEY `fk_user_has_restaurants_user1_idx` (`user_email`),
  CONSTRAINT `fk_user_has_restaurants_restaurants1` FOREIGN KEY (`restaurants_id`) REFERENCES `restaurants` (`id`),
  CONSTRAINT `fk_user_has_restaurants_user1` FOREIGN KEY (`user_email`) REFERENCES `user` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `restaurants_rating`
--

LOCK TABLES `restaurants_rating` WRITE;
/*!40000 ALTER TABLE `restaurants_rating` DISABLE KEYS */;
/*!40000 ALTER TABLE `restaurants_rating` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `star`
--

DROP TABLE IF EXISTS `star`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `star` (
  `board_id` int NOT NULL,
  `user_email` varchar(45) NOT NULL,
  PRIMARY KEY (`board_id`,`user_email`),
  KEY `fk_board_has_user_user1_idx` (`user_email`),
  KEY `fk_board_has_user_board1_idx` (`board_id`),
  CONSTRAINT `fk_board_has_user_board1` FOREIGN KEY (`board_id`) REFERENCES `board` (`id`),
  CONSTRAINT `fk_board_has_user_user1` FOREIGN KEY (`user_email`) REFERENCES `user` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `star`
--

LOCK TABLES `star` WRITE;
/*!40000 ALTER TABLE `star` DISABLE KEYS */;
/*!40000 ALTER TABLE `star` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `email` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  `img` varchar(45) DEFAULT NULL,
  `gender` char(1) DEFAULT NULL,
  `grade_id` tinyint(1) NOT NULL,
  `nickname` varchar(45) DEFAULT NULL,
  `age` int DEFAULT NULL,
  `join_at` timestamp NULL DEFAULT NULL,
  `last_login` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`),
  KEY `fk_user_grade_idx` (`grade_id`),
  CONSTRAINT `fk_user_grade` FOREIGN KEY (`grade_id`) REFERENCES `grade` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES ('ssafy@gmail.com','1234',NULL,'M',1,'싸돌이',25,NULL,NULL);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'ssafytrip'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-05-02 10:32:51


-- insert into SampleData (attractions)
INSERT INTO attractions  (`name`, `description`, `phone_number_1`, `phone_number_2`, `phone_number_3`, `business_hours`)
VALUES  ("ssafyTrip1","ssafyTrip_description1","010","1111","1111","10:00~15:00"),
		("ssafyTrip2","ssafyTrip_description2","010","2222","2222","11:00~16:00"),
		("ssafyTrip3","ssafyTrip_description3","010","3333","3333","12:00~17:00"),
		("ssafyTrip4","ssafyTrip_description4","010","4444","4444","13:00~18:00"),
		("ssafyTrip5","ssafyTrip_description5","010","5555","5555","14:00~19:00");

-- insert into SampleData (accommodations)
INSERT INTO accommodations (`name`, `description`, `address`, `phone_number_1`, `phone_number_2`, `phone_number_3`, `email`)
VALUES  ("가경재 [한국관광 품질인증/Korea Quality]","ssafyTrip_description1","경상북도 안동시 하회남촌길 69-5","054","855","8552","-"),
		("가락관광호텔","ssafyTrip_description2","서울특별시 송파구 송파대로28길 5 가락동","02","400","6641","-"),
		("가락청","ssafyTrip_description3","전라북도 전주시 완산구 한지길 68 풍남동3가","033","562","1665","-"),
		("가람나무","ssafyTrip_description4","경기도 파주시 소라지로327번길 126-21 송촌동","031","400","6641","-"),
		("가름게스트하우스","ssafyTrip_description5","제주특별자치도 서귀포시 법환하로9번길 10","064","658","7700","-"),
		("가람초연재[한국관광 품질인증/Korea Quality]","ssafyTrip_description6","경상북도 안동시 풍천면 하회종가길 76-6 풍천면","010","3849","7542","-");


