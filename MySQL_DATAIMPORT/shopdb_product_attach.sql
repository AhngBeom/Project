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
INSERT INTO `product_attach` VALUES ('027690d7-18c9-4934-a235-811b5645e1bd','2020\\04\\15','cake.png','1',22,0),('05da4876-2b90-4108-8cb4-663d826ed35c','2020\\04\\15','airpods_pro_1.jpg','1',28,0),('0d2c267c-acc1-45d6-a062-57d65682de5f','2020\\04\\15','circus.png','1',4,0),('0facce33-63f2-4238-be0d-fa45c6d993c3','2020\\04\\15','42-black-1_GEO_KR.jpg','1',20,0),('0fcb7d79-f8be-48cb-a1e6-47d2208aa3da','2020\\04\\15','iPhone_11bk.jpg','1',27,0),('17bb3e49-4524-44e7-8ca6-d2c08888c78a','2020\\04\\14','42-black-2_GEO_KR.jpg','1',1,1),('2a39da31-0964-46ba-b23d-1674070c43f2','2020\\04\\15','airpods_pro_2.jpg','1',28,1),('2a9f2d3d-90b3-40ef-bea2-61df1ee4ca1a','2020\\04\\15','42-black-1_GEO_KR.jpg','1',10,0),('2b1f41e5-06ed-4178-97e8-d537fd4649ee','2020\\04\\15','mbp16touch-space-gallery1-201911_GEO_KR.jpg','1',14,0),('340c7c9d-b46b-4160-9e60-acf49a23ce06','2020\\04\\15','submarine.png','1',17,0),('4cb2d988-6a0a-448e-a34a-d0d78faaa837','2020\\04\\15','game.png','1',2,0),('51a88f41-66ec-45c1-84db-172c0f32a692','2020\\04\\15','airpods_pro_1.jpg','1',18,0),('60fb0b91-e6b2-4bed-9de2-30ee18943c5d','2020\\04\\15','cabin.png','1',3,0),('6b610db9-cf73-4a3e-87ec-1ab7ad513918','2020\\04\\15','mbp16touch-space-gallery1-201911_GEO_KR.jpg','1',29,0),('6d7d4b2a-ae16-4a87-8191-9d9559bb2ebb','2020\\04\\15','iPhone_11wh.jpg','1',12,0),('718714de-ab7d-49c0-a799-2e086a19d690','2020\\04\\15','safe.png','1',16,0),('74e14feb-c2bb-4d50-a17f-efa3845c6650','2020\\04\\15','iPhone_11wh.jpg','1',15,0),('7f339602-b9a9-42fa-8115-8bbfa2aa9657','2020\\04\\15','submarine.png','1',8,0),('7f6e1cc7-f653-46c0-b0c5-f71e56f57f9f','2020\\04\\15','airpods_pro_2.jpg','1',13,0),('876afa96-7d84-400f-a1a9-bae295ada42e','2020\\04\\15','submarine.png','1',23,0),('8898c486-c90d-41de-8c22-18180c0c8e32','2020\\04\\15','circus.png','1',24,0),('9cc82631-679d-4067-a1e1-9e3adf6a0ba0','2020\\04\\15','cake.png','1',5,0),('9e98603f-bdeb-4ecf-bced-9fcb38211d52','2020\\04\\15','game.png','1',11,0),('a4277fb5-0584-4014-a0ae-c2deea0b5793','2020\\04\\15','42-black-2_GEO_KR.jpg','1',25,0),('a7f2c6ff-dc23-4ac9-b861-7e22ee13de44','2020\\04\\15','mbp16touch-space-gallery1-201911_GEO_KR.jpg','1',9,0),('aa586e2f-1f4e-4534-973e-af9e8f23b3c4','2020\\04\\15','iPhone_11yw.jpg','1',7,0),('b330da03-25e9-4b11-9c4a-90c5a4002b54','2020\\04\\14','42-black-1_GEO_KR.jpg','1',1,0),('b51ab64e-1815-48ec-b101-c655f8728bbc','2020\\05\\04','circus.png','1',2,1),('d157a777-d42d-4c67-a38c-24b597fba61b','2020\\04\\15','mbp16touch-space-gallery1-201911_GEO_KR.jpg','1',21,0),('e7176231-fa0a-4b57-a933-5157cf537fa9','2020\\04\\15','airpods_pro_3.jpg','1',26,0),('f1b1e14d-2750-4a96-bd1d-073cac686ba1','2020\\04\\15','safe.png','1',6,0);
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

-- Dump completed on 2020-05-04  2:12:56
