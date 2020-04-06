-- MySQL dump 10.13  Distrib 8.0.19, for Win64 (x86_64)
--
-- Host: localhost    Database: shopdb
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
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product` (
  `pno` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `price` bigint DEFAULT NULL,
  `category` varchar(50) DEFAULT NULL,
  `title` varchar(200) DEFAULT NULL,
  `descript` varchar(1000) DEFAULT NULL,
  `regdate` datetime DEFAULT CURRENT_TIMESTAMP,
  `uptodate` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`pno`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (13,'Apple Watch 스페이스 그레이 알루미늄 케이스와 블랙 스포츠 밴드 42mm',299000,'Category 1','Apple Watch Series 3 (GPS)','듀얼 코어 프로세서가 탑재된 S3 \r\nW2 Apple 무선 칩 , 저장 용량 8GB \r\nWi-Fi(802.11b/g/n 2.4GHz) , Bluetooth 4.2 \r\n최대 18시간의 배터리 사용 시간 , 50미터 방수\r\nwatchOS 6\r\n세로: 42.5mm 가로: 36.4mm 두께: 11.4mm 케이스 무게 (GPS): 32.3g ','2020-03-13 12:22:57','2020-03-27 20:30:35'),(15,'A',1000,'Category 2','A','A','2020-03-16 21:58:15','2020-03-27 20:33:38'),(16,'B',2000,'Category 2','B','B ','2020-03-26 19:55:25','2020-03-30 15:30:30'),(17,'C',3000,'Category 3','C','C','2020-03-26 19:55:44','2020-03-27 20:33:53'),(18,'D',4000,'Category 3','D','D ','2020-03-30 15:29:47','2020-03-30 20:24:20'),(23,'E',1000,'Category 2','E','E','2020-03-30 20:41:12','2020-03-30 20:54:28'),(24,'F',2000,'Category 2','F','F','2020-03-30 20:41:12','2020-03-30 20:54:34'),(25,'G',3000,'Category 3','G','G','2020-03-30 20:41:12','2020-03-30 20:54:40'),(26,'H',4000,'Category 3','H','H','2020-03-30 20:41:12','2020-03-30 20:54:46'),(30,'I',1000,'Category 2','I','I','2020-03-30 20:41:32','2020-03-30 20:54:51'),(31,'J',2000,'Category 2','J','J','2020-03-30 20:41:32','2020-03-30 20:55:02'),(32,'K',3000,'Category 3','K','K','2020-03-30 20:41:32','2020-03-30 20:55:10'),(33,'L',4000,'Category 3','L','L','2020-03-30 20:41:32','2020-03-30 20:55:46'),(34,'M',1000,'Category 2','M','M','2020-03-30 20:41:32','2020-03-30 20:55:54'),(35,'N',2000,'Category 2','N','N','2020-03-30 20:41:32','2020-03-30 20:56:04'),(36,'O',3000,'Category 3','O','O','2020-03-30 20:41:32','2020-03-30 20:56:12'),(37,'P',4000,'Category 3','P','P','2020-03-30 20:41:32','2020-03-30 20:56:18'),(38,'Amount Test',1000,'Category 3','Amount Test','Amount Test  ','2020-04-06 19:25:17','2020-04-06 19:25:34');
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-04-06 23:47:36
