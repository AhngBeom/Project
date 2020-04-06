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

-- Dump completed on 2020-04-06 23:47:36
