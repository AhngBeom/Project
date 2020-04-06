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
-- Table structure for table `cart`
--

DROP TABLE IF EXISTS `cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cart` (
  `userid` varchar(100) DEFAULT NULL,
  `pno` bigint unsigned DEFAULT NULL,
  `amount` int DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart`
--

LOCK TABLES `cart` WRITE;
/*!40000 ALTER TABLE `cart` DISABLE KEYS */;
INSERT INTO `cart` VALUES ('unknown',13,6),('unknown',32,1);
/*!40000 ALTER TABLE `cart` ENABLE KEYS */;
UNLOCK TABLES;

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

--
-- Table structure for table `product_attach`
--

DROP TABLE IF EXISTS `product_attach`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_attach` (
  `uuid` varchar(100) NOT NULL,
  `uploadPath` varchar(200) NOT NULL,
  `filename` varchar(100) NOT NULL,
  `filetype` char(1) DEFAULT (_utf8mb4'I'),
  `pno` bigint unsigned NOT NULL,
  `sequence` int unsigned DEFAULT NULL,
  PRIMARY KEY (`uuid`),
  KEY `fk_product_attach` (`pno`),
  CONSTRAINT `fk_product_attach` FOREIGN KEY (`pno`) REFERENCES `product` (`pno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_attach`
--

LOCK TABLES `product_attach` WRITE;
/*!40000 ALTER TABLE `product_attach` DISABLE KEYS */;
INSERT INTO `product_attach` VALUES ('24898b6f-c553-4e15-be2e-54ed8eca4612','2020\\03\\30','iPhone_11wh.jpg','1',34,0),('2fe6ae4e-19ff-41e1-a946-b865aac8c809','2020\\03\\30','iPhone_11bk.jpg','1',35,0),('49bf4450-c658-40cb-af49-371237852bf1','2020\\03\\26','circus.png','1',16,0),('52529911-eaf5-4651-aa83-db00a3a91d67','2020\\03\\30','cake.png','1',25,0),('6d9e389f-7b96-4526-8745-57e9fa8a7b11','2020\\03\\30','game.png','1',30,0),('6f69e029-9f9d-435b-a5d1-9119e2d9dbea','2020\\03\\16','safe.png','1',15,1),('79e23f3b-80c7-4e8f-9f8c-2d51d3043d1d','2020\\03\\26','cabin.png','1',17,0),('79f8b12d-f899-4b2e-a7ec-5c866c003040','2020\\03\\30','submarine.png','1',24,0),('85532ba5-e96f-424b-ae7a-b364aa868c04','2020\\03\\30','iPhone_11yw.jpg','1',33,0),('8d70631a-2511-465e-bd29-bbbbe70a0e92','2020\\03\\16','game.png','1',15,0),('9e2ea777-851b-4796-8b66-858e3ae7f771','2020\\03\\20','42-black-3_GEO_KR.jpg','1',13,2),('ac8047cd-8875-44dc-8d0a-64a2b9f42e0c','2020\\03\\30','iPhone_11bk.jpg','1',37,0),('aca08844-c112-4cbb-815f-b7d6290daa05','2020\\03\\20','42-black-2_GEO_KR.jpg','1',13,1),('be441def-59cf-455d-853d-a0ea057fc03f','2020\\03\\30','safe.png','1',23,0),('c1c8c461-674e-46be-8606-38a4aac44203','2020\\03\\20','42-black-1_GEO_KR.jpg','1',13,0),('c2ff8fc9-6210-4e04-8118-1c42f2aa7d76','2020\\03\\30','iPhone_11wh.jpg','1',26,0),('c83ad8a7-501d-4bcf-91d8-e0a91413bbb2','2020\\03\\30','safe.png','1',16,1),('e20c8b51-d54c-4391-863d-0341e7622492','2020\\03\\30','iPhone_11yw.jpg','1',32,0),('f1953541-9520-47c1-b4bf-0a35fcb5d476','2020\\03\\30','submarine.png','1',18,0);
/*!40000 ALTER TABLE `product_attach` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-04-06 21:20:30
