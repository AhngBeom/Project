-- MySQL dump 10.13  Distrib 8.0.19, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: shopdb
-- ------------------------------------------------------
-- Server version	8.0.19

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
-- Table structure for table `pdt_order`
--

DROP TABLE IF EXISTS `pdt_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pdt_order` (
  `order_number` varchar(50) NOT NULL,
  `userid` varchar(50) DEFAULT NULL,
  `orderer` varchar(100) DEFAULT NULL,
  `orderer_contact` varchar(100) DEFAULT NULL,
  `receiver` varchar(100) DEFAULT NULL,
  `receiver_address` varchar(1000) DEFAULT NULL,
  `order_date` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`order_number`),
  KEY `fk_order_userid` (`userid`),
  CONSTRAINT `fk_order_userid` FOREIGN KEY (`userid`) REFERENCES `members` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pdt_order`
--

LOCK TABLES `pdt_order` WRITE;
/*!40000 ALTER TABLE `pdt_order` DISABLE KEYS */;
INSERT INTO `pdt_order` VALUES ('202005230211','member1','회원1','01048428167','회원2','경기도 고양시 일산서구','2020-05-23 14:00:04'),('202005230752','member1','회원1','01048428167','회원2','경기도 고양시 일산서구','2020-05-23 14:54:24'),('202005231863','member1','회원1','01048428167','회원2','경기도 고양시 일산서구','2020-05-23 13:41:46'),('202005233221','member1','회원1','01048428167','회원2','경기도 고양시 일산서구','2020-05-23 13:59:49'),('202005233304','member1','회원1','01048428167','회원2','경기도 고양시 일산서구','2020-05-23 15:24:39'),('202005233483','member1','회원1','01048428167','회원2','경기도 고양시 일산서구','2020-05-23 16:02:57'),('202005233669','member1','회원1','01048428167','회원2','경기도 고양시 일산서구','2020-05-23 13:26:31'),('202005234805','member1','회원1','01048428167','회원2','경기도 고양시 일산서구','2020-05-23 14:05:38'),('202005235083','member1','회원1','01048428167','회원2','경기도 고양시 일산서구','2020-05-23 14:03:11'),('202005235504','member1','회원1','01048428167','회원2','경기도 고양시 일산서구','2020-05-23 14:02:56'),('202005236694','member1','회원1','01048428167','회원2','경기도 고양시 일산서구','2020-05-23 15:21:57'),('202005237880','member1','회원1','01048428167','회원2','경기도 고양시 일산서구','2020-05-23 14:50:01'),('202005238357','member1','회원1','01048428167','회원2','경기도 고양시 일산서구','2020-05-23 13:41:52'),('202005238412','member1','회원1','01048428167','회원2','경기도 고양시 일산서구','2020-05-23 14:04:38'),('202005238453','member1','회원1','01048428167','회원2','경기도 고양시 일산서구','2020-05-23 13:59:54'),('202005238471','member1','회원1','01048428167','회원2','경기도 고양시 일산서구','2020-05-23 14:54:29'),('202005238790','member1','회원1','01048428167','회원2','경기도 고양시 일산서구','2020-05-23 13:37:23'),('202005239655','member1','회원1','01048428167','회원2','경기도 고양시 일산서구','2020-05-23 13:37:28');
/*!40000 ALTER TABLE `pdt_order` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-05-23 16:12:24
