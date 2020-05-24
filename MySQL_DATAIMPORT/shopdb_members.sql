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
-- Table structure for table `members`
--

DROP TABLE IF EXISTS `members`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `members` (
  `userid` varchar(50) NOT NULL,
  `userpw` varchar(100) NOT NULL,
  `username` varchar(100) NOT NULL,
  `regdate` datetime DEFAULT CURRENT_TIMESTAMP,
  `uptodate` datetime DEFAULT CURRENT_TIMESTAMP,
  `enabled` char(1) DEFAULT '1',
  PRIMARY KEY (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `members`
--

LOCK TABLES `members` WRITE;
/*!40000 ALTER TABLE `members` DISABLE KEYS */;
INSERT INTO `members` VALUES ('admin0','$2a$10$IocX7iGyL0MssBBPfG2UyOduz96FvZu9h.8Z522k7T7bQ7u94fDSq','관리자0','2020-05-18 21:25:08','2020-05-18 21:25:08','1'),('member1','$2a$10$4hT4fvqeAhSmYQXFYdh0beCcA/DwWaAqqQ9cm2aQkA7zW.Wp6Fy/i','회원1','2020-05-18 21:25:08','2020-05-18 21:25:08','1'),('member2','$2a$10$m5WhB9zWopkZZBp9JpHF2OygvCsYYalSnzoSz/PDQMobvGlpSR/bS','회원2','2020-05-18 21:25:08','2020-05-18 21:25:08','1'),('member3','$2a$10$dwpXvoV6sMyxzPrNpvMw5uPkpOoQnKRNyBAN6ZkyaAPsvJ/31sIfq','회원3','2020-05-18 21:25:08','2020-05-18 21:25:08','1'),('member4','$2a$10$J4By.J/GgOF.q8YjkEAuE.zucv16Qi/IN29d0YaITLrdY/Tmnpd9e','회원4','2020-05-18 21:25:09','2020-05-18 21:25:09','1'),('member5','$2a$10$dJil9z/URE1d/zp8DLHJv.W4MQb4P4qgAAfyeUC3vfrR33Md5jIoa','회원5','2020-05-18 21:25:09','2020-05-18 21:25:09','1'),('member6','$2a$10$dE8OimE/hZbWQsN43CucfOt78TxkFYUwC/UcChKluvIsH6X0nLC.q','회원6','2020-05-18 21:25:09','2020-05-18 21:25:09','1'),('member7','$2a$10$6j0CROof8JCil9nqXsnKR.j.ufcnWmG5mBc2cpPcFIyXP45s1Wn16','회원7','2020-05-18 21:25:09','2020-05-18 21:25:09','1'),('member8','$2a$10$2TKdwYtSgMM2zXEaCJgNiuzxV5S2ENcy1m/SX8U4VOCpKy1MHwY3a','회원8','2020-05-18 21:25:09','2020-05-18 21:25:09','1'),('member9','$2a$10$EV48lF/DxjryauLYtsjj/.kcDnaoJ8PBmpKyfrv4MWkZ1Sgt4meHa','회원9','2020-05-18 21:25:09','2020-05-18 21:25:09','1'),('test','$2a$10$IU0E1mbA/hS/1qcbAhH5cO4rMj9jc31OWnSl2cq4RhJrf3BEFxIha','Tester','2020-05-19 21:13:46','2020-05-19 21:13:46','1');
/*!40000 ALTER TABLE `members` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-05-23 16:12:25
