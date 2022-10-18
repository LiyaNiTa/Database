-- MySQL dump 10.13  Distrib 8.0.29, for Win64 (x86_64)
--
-- Host: localhost    Database: shop1
-- ------------------------------------------------------
-- Server version	8.0.29

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
-- Table structure for table `brend`
--

DROP TABLE IF EXISTS `brend`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `brend` (
  `idBrend` int NOT NULL AUTO_INCREMENT,
  `Brand_type` varchar(128) NOT NULL,
  PRIMARY KEY (`idBrend`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `brend`
--

LOCK TABLES `brend` WRITE;
/*!40000 ALTER TABLE `brend` DISABLE KEYS */;
INSERT INTO `brend` VALUES (11,'Adidas'),(12,'MISLISTUDIO'),(13,'Portal'),(14,'12 STOREEZ'),(15,'MISLISTUDIO');
/*!40000 ALTER TABLE `brend` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category` (
  `idCategory` int NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL,
  `skidka` tinyint NOT NULL,
  `English_name` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`idCategory`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (1,'Женская одежда',5,'female'),(2,'Мужская одежда',3,NULL),(3,'Женская обувь',10,NULL),(4,'Мужская обувь',15,'Man\'s shoes'),(12,'Шляпы',3,NULL),(13,'Мужские головные уборы',3,NULL);
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_product`
--

DROP TABLE IF EXISTS `order_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_product` (
  `order_id` int NOT NULL,
  `product_id` int NOT NULL,
  `count` int NOT NULL,
  PRIMARY KEY (`order_id`,`product_id`),
  KEY `fk_order_product_product_idx` (`product_id`),
  KEY `fk_order_product_order` (`order_id`),
  CONSTRAINT `fk_order_product_order` FOREIGN KEY (`order_id`) REFERENCES `order_shop1` (`idorder`) ON DELETE CASCADE,
  CONSTRAINT `fk_order_product_product` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_product`
--

LOCK TABLES `order_product` WRITE;
/*!40000 ALTER TABLE `order_product` DISABLE KEYS */;
INSERT INTO `order_product` VALUES (6,12,2),(6,13,1);
/*!40000 ALTER TABLE `order_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_shop1`
--

DROP TABLE IF EXISTS `order_shop1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_shop1` (
  `idorder` int NOT NULL AUTO_INCREMENT,
  `user_name` varchar(128) NOT NULL,
  `phone` varchar(32) NOT NULL,
  `date_time` datetime NOT NULL,
  PRIMARY KEY (`idorder`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_shop1`
--

LOCK TABLES `order_shop1` WRITE;
/*!40000 ALTER TABLE `order_shop1` DISABLE KEYS */;
INSERT INTO `order_shop1` VALUES (6,'Иванов Иван Сергеевич','+79155647895','2022-10-09 13:20:00');
/*!40000 ALTER TABLE `order_shop1` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product` (
  `id` int NOT NULL AUTO_INCREMENT,
  `idCategory` int NOT NULL,
  `idBrend` int NOT NULL,
  `idtype_of_product` int NOT NULL,
  `price` decimal(10,2) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_brend_product_idx` (`idBrend`),
  KEY `fk_category_product_idx` (`idCategory`),
  KEY `fk_type_of_product_product_idx` (`idtype_of_product`),
  CONSTRAINT `fk_brend_product` FOREIGN KEY (`idBrend`) REFERENCES `brend` (`idBrend`) ON DELETE CASCADE,
  CONSTRAINT `fk_category_product` FOREIGN KEY (`idCategory`) REFERENCES `category` (`idCategory`) ON DELETE CASCADE,
  CONSTRAINT `fk_type_of_product_product` FOREIGN KEY (`idtype_of_product`) REFERENCES `type_of_product` (`idtype_of_product`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (12,3,12,12,8990.00),(13,4,14,13,2500.00),(14,4,11,10,5890.00),(15,1,15,12,7890.00),(16,2,11,10,10890.00);
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `type_of_product`
--

DROP TABLE IF EXISTS `type_of_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `type_of_product` (
  `idtype_of_product` int NOT NULL AUTO_INCREMENT,
  `product` varchar(128) NOT NULL,
  PRIMARY KEY (`idtype_of_product`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `type_of_product`
--

LOCK TABLES `type_of_product` WRITE;
/*!40000 ALTER TABLE `type_of_product` DISABLE KEYS */;
INSERT INTO `type_of_product` VALUES (10,'обувь'),(11,'платье'),(12,'брюки'),(13,'шляпы');
/*!40000 ALTER TABLE `type_of_product` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-10-18 20:42:06
