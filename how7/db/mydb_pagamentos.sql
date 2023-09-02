-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: mydb
-- ------------------------------------------------------
-- Server version	8.0.34
/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */
;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */
;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */
;
/*!50503 SET NAMES utf8 */
;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */
;
/*!40103 SET TIME_ZONE='+00:00' */
;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */
;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */
;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */
;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */
;
--
-- Table structure for table `pagamentos`
--
DROP TABLE IF EXISTS `pagamentos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */
;
/*!50503 SET character_set_client = utf8mb4 */
;
CREATE TABLE `pagamentos` (
    `id` int NOT NULL AUTO_INCREMENT,
    `data_do_pagamento` date NOT NULL,
    `valor_do_pagamento` float NOT NULL,
    `fk_id_imovel` int NOT NULL,
    PRIMARY KEY (`id`),
    UNIQUE KEY `id_UNIQUE` (`id`),
    KEY `fk_id_imovel_idx` (`fk_id_imovel`),
    CONSTRAINT `fk_id_imovel` FOREIGN KEY (`fk_id_imovel`) REFERENCES `imoveis` (`id`)
) ENGINE = InnoDB AUTO_INCREMENT = 51 DEFAULT CHARSET = utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */
;
--
-- Dumping data for table `pagamentos`
--
LOCK TABLES `pagamentos` WRITE;
/*!40000 ALTER TABLE `pagamentos` DISABLE KEYS */
;
INSERT INTO `pagamentos`
VALUES (1, '2023-04-15', 800, 1),
(2, '2023-05-02', 1200, 2),
(3, '2023-06-10', 950, 3),
(4, '2023-07-18', 700, 4),
(5, '2023-08-05', 550, 5),
(6, '2023-04-23', 1600, 6),
(7, '2023-05-14', 750, 7),
(8, '2023-06-29', 1100, 8),
(9, '2023-07-08', 500, 9),
(10, '2023-08-19', 950, 10),
(11, '2023-04-07', 1300, 11),
(12, '2023-05-28', 850, 12),
(13, '2023-06-15', 600, 13),
(14, '2023-07-22', 1200, 14),
(15, '2023-08-09', 700, 1),
(16, '2023-04-18', 1000, 2),
(17, '2023-05-06', 900, 3),
(18, '2023-06-12', 650, 4),
(19, '2023-07-29', 550, 5),
(20, '2023-08-14', 1500, 6),
(21, '2023-04-30', 800, 7),
(22, '2023-05-18', 1050, 8),
(23, '2023-06-27', 750, 9),
(24, '2023-07-03', 1000, 10),
(25, '2023-08-23', 850, 11),
(26, '2023-04-12', 600, 12),
(27, '2023-05-22', 1300, 13),
(28, '2023-06-20', 700, 14),
(29, '2023-07-10', 1200, 1),
(30, '2023-08-01', 950, 2),
(31, '2023-04-03', 850, 3),
(32, '2023-05-25', 550, 4),
(33, '2023-06-08', 1400, 5),
(34, '2023-07-17', 700, 6),
(35, '2023-08-12', 1100, 7),
(36, '2023-04-21', 500, 8),
(37, '2023-05-10', 950, 9),
(38, '2023-06-17', 1300, 10),
(39, '2023-07-25', 750, 11),
(40, '2023-08-06', 600, 12),
(41, '2023-03-15', 900, 13),
(42, '2023-03-22', 750, 14),
(43, '2023-03-08', 1100, 1),
(44, '2023-03-12', 800, 2),
(45, '2023-03-28', 950, 3),
(46, '2023-03-03', 600, 4),
(47, '2023-03-19', 1200, 5),
(48, '2023-03-25', 700, 6),
(49, '2023-03-14', 850, 7),
(50, '2023-03-31', 1300, 8);
/*!40000 ALTER TABLE `pagamentos` ENABLE KEYS */
;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */
;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */
;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */
;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */
;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */
;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */
;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */
;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */
;
-- Dump completed on 2023-08-31 15:14:36