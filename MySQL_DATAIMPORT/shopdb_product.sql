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
  PRIMARY KEY (`pno`),
  KEY `idx_pdt` (`pno`,`uptodate`,`regdate`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (1,'Apple Watch Series 3 (GPS)',299000,'Category 1','Apple Watch 스페이스 그레이 알루미늄 케이스와 블랙 스포츠 밴드 42mm','스페이스 그레이 알루미늄 케이스 \r\nGPS/GNSS \r\n듀얼 코어 프로세서가 탑재된 S3\r\nW2 Apple 무선 칩 \r\n기압고도계 \r\n광학 심박 센서 \r\n가속도계 \r\n자이로스코프 \r\n저장 용량 8GB\r\nIon-X 강화 유리 \r\n복합소재 후면\r\nWi-Fi(802.11b/g/n 2.4GHz) \r\nBluetooth 4.2 \r\n최대 18시간의 배터리 사용 시간 \r\n50미터 방수\r\nwatchOS 6','2020-04-14 20:16:10','2020-05-02 16:53:58'),(2,'A',1,'Category 2','A',' ','2020-04-14 22:06:03','2020-05-04 00:28:27'),(3,'B',2,'Category 2','B',' ','2020-04-14 22:06:12','2020-04-15 16:13:26'),(4,'C',3,'Category 2','C','  ','2020-04-15 15:58:30','2020-04-15 16:13:31'),(5,'D',4,'Category 2','D',' ','2020-04-15 16:05:27','2020-04-15 16:13:35'),(6,'E',5,'Category 2','E',' ','2020-04-15 16:05:29','2020-04-15 16:13:42'),(7,'F',6,'Category 2','F',' ','2020-04-15 16:05:33','2020-04-15 16:12:57'),(8,'G',7,'Category 2','G',' ','2020-04-15 16:05:35','2020-04-15 16:13:47'),(9,'H',8,'Category 2','H',' ','2020-04-15 16:05:35','2020-04-15 16:35:04'),(10,'I',9,'Category 2','I',' ','2020-04-15 16:05:36','2020-04-15 16:35:11'),(11,'J',10,'Category 2','J',' ','2020-04-15 16:05:36','2020-04-15 16:35:22'),(12,'K',11,'Category 2','K',' ','2020-04-15 16:05:37','2020-04-15 16:35:34'),(13,'L',12,'Category 2','L',' ','2020-04-15 16:05:37','2020-04-15 16:35:49'),(14,'M',13,'Category 2','M',' ','2020-04-15 16:05:37','2020-04-15 16:36:02'),(15,'N',14,'Category 2','N',' ','2020-04-15 16:05:42','2020-04-15 16:13:06'),(16,'O',15,'Category 2','O',' ','2020-04-15 16:05:43','2020-04-15 16:36:15'),(17,'P',16,'Category 2','P',' ','2020-04-15 16:05:43','2020-04-15 16:36:37'),(18,'Q',17,'Category 2','Q',' ','2020-04-15 16:05:43','2020-04-15 16:37:25'),(19,'R',18,'Category 2','R',NULL,'2020-04-15 16:05:43','2020-04-15 16:05:43'),(20,'S',19,'Category 2','S',' ','2020-04-15 16:05:44','2020-04-15 16:37:08'),(21,'T',20,'Category 2','T',' ','2020-04-15 16:06:05','2020-04-15 16:36:47'),(22,'U',21,'Category 2','U',' ','2020-04-15 16:06:06','2020-04-15 16:34:26'),(23,'V',22,'Category 2','V',' ','2020-04-15 16:06:06','2020-04-15 16:34:18'),(24,'W',23,'Category 2','W',' ','2020-04-15 16:06:06','2020-04-15 16:34:07'),(25,'X',24,'Category 2','X',' ','2020-04-15 16:06:10','2020-04-15 16:22:22'),(26,'Y',25,'Category 2','Y',' ','2020-04-15 16:06:12','2020-04-15 16:22:07'),(27,'Z',26,'Category 2','Z',' ','2020-04-15 16:06:14','2020-04-15 16:12:46'),(28,'AirPods Pro',329000,'Category 1','Active Noise Cancellation','액티브 노이즈 캔슬링\r\n\r\n보다 편안한 맞춤형 핏과 밀폐 효과\r\n\r\n주변음 허용 모드\r\n\r\n적응형 EQ를 통한 놀라운 음질\r\n\r\n땀과 습기에 강한 생활 방수 디자인(IPX 4)\r\n\r\n자동으로 켜지고, 자동으로 연결\r\n\r\n간편한 설정으로 당신의 모든 Apple 기기와 셋업 완료\r\n\r\n케이스에서 급속 충전\r\n\r\nQi 인증 무선 충전기 또는 Lightning 커넥터로 케이스 충전 ','2020-04-15 16:21:13','2020-05-02 18:11:24'),(29,'MacBook Pro - 스페이스 그레이',3690000,'Category 1','16 Inch','2.3GHz 8코어 9세대 Intel Core i9 프로세서(최대 4.8GHz Turbo Boost)\r\n16GB 2666MHz DDR4 메모리\r\nAMD Radeon Pro 5500M(4GB GDDR6 메모리)\r\n1TB SSD 저장 장치\r\nTrue Tone을 지원하는 16형 Retina 디스플레이\r\nThunderbolt 3 포트 4개\r\nTouch Bar 및 Touch ID\r\n백라이트 키보드 - 한국어\r\n액세서리 키트 ','2020-04-15 16:33:47','2020-04-15 20:56:50');
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

-- Dump completed on 2020-05-04  2:12:56
