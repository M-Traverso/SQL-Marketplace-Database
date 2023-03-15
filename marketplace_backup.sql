-- MySQL dump 10.13  Distrib 8.0.31, for Win64 (x86_64)
--
-- Host: localhost    Database: marketplace
-- ------------------------------------------------------
-- Server version	8.0.31

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
-- Table structure for table `_3pl´s`
--

DROP TABLE IF EXISTS `_3pl´s`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_3pl´s` (
  `id_3PL` int NOT NULL AUTO_INCREMENT,
  `company_name` varchar(45) DEFAULT NULL,
  `PIC_email` varchar(45) DEFAULT NULL,
  `PIC_phone` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`id_3PL`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `_3pl´s`
--

LOCK TABLES `_3pl´s` WRITE;
/*!40000 ALTER TABLE `_3pl´s` DISABLE KEYS */;
INSERT INTO `_3pl´s` VALUES (1,'Correo Argentino','mariano.paz@correoargentino.com','1145260059');
/*!40000 ALTER TABLE `_3pl´s` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bitacora`
--

DROP TABLE IF EXISTS `bitacora`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bitacora` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action` varchar(24) DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `product_id` int DEFAULT NULL,
  `new_value` varchar(60) DEFAULT NULL,
  `old_value` varchar(60) DEFAULT NULL,
  `user` varchar(24) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bitacora`
--

LOCK TABLES `bitacora` WRITE;
/*!40000 ALTER TABLE `bitacora` DISABLE KEYS */;
/*!40000 ALTER TABLE `bitacora` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `buyer_center`
--

DROP TABLE IF EXISTS `buyer_center`;
/*!50001 DROP VIEW IF EXISTS `buyer_center`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `buyer_center` AS SELECT 
 1 AS `buyer_id`,
 1 AS `buyerName`,
 1 AS `product_id`,
 1 AS `description_`,
 1 AS `purchGross_id`,
 1 AS `status01`,
 1 AS `payment_id`,
 1 AS `status02`,
 1 AS `purchNet_id`,
 1 AS `status03`,
 1 AS `gross_id`,
 1 AS `status04`,
 1 AS `shiping_id`,
 1 AS `est_date`,
 1 AS `net_id`,
 1 AS `status05`,
 1 AS `return_id`,
 1 AS `status06`,
 1 AS `refund_id`,
 1 AS `status07`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `buyers`
--

DROP TABLE IF EXISTS `buyers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `buyers` (
  `buyer_id` int NOT NULL AUTO_INCREMENT,
  `name_` varchar(25) DEFAULT NULL,
  `surname` varchar(25) DEFAULT NULL,
  `DNI` int NOT NULL,
  `email` varchar(45) DEFAULT NULL,
  `phone` varchar(15) DEFAULT NULL,
  `adress` varchar(60) NOT NULL,
  PRIMARY KEY (`buyer_id`),
  UNIQUE KEY `DNI` (`DNI`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `buyers`
--

LOCK TABLES `buyers` WRITE;
/*!40000 ALTER TABLE `buyers` DISABLE KEYS */;
INSERT INTO `buyers` VALUES (1,'Julian','Cabrera',40760578,'j.cabrera@gmail.com','1140421022','Echeverria 850');
/*!40000 ALTER TABLE `buyers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gross_purchases`
--

DROP TABLE IF EXISTS `gross_purchases`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gross_purchases` (
  `purchGross_id` int NOT NULL AUTO_INCREMENT,
  `product_id` int DEFAULT NULL,
  `buyer_id` int DEFAULT NULL,
  `date_` date DEFAULT NULL,
  `status_` varchar(100) DEFAULT NULL,
  `payment_method` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`purchGross_id`),
  KEY `product_id` (`product_id`),
  KEY `buyer_id` (`buyer_id`),
  CONSTRAINT `gross_purchases_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`) ON UPDATE CASCADE,
  CONSTRAINT `gross_purchases_ibfk_2` FOREIGN KEY (`buyer_id`) REFERENCES `buyers` (`buyer_id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gross_purchases`
--

LOCK TABLES `gross_purchases` WRITE;
/*!40000 ALTER TABLE `gross_purchases` DISABLE KEYS */;
INSERT INTO `gross_purchases` VALUES (1,1,1,'2023-02-05','pago aprobado','tarjeta de credito'),(2,2,1,'2023-02-05','pago rechazado, elige otro medio de pago','tarjeta de credito'),(3,3,1,'2023-02-05','pago pendiente',NULL),(4,4,1,'2023-02-05','pago aprobado','tarjeta de credito'),(5,5,1,'2023-02-05','pago aprobado','tarjeta de credito'),(6,6,1,'2023-02-05','pago aprobado','tarjeta de credito'),(7,4,1,'2023-02-05','pago aprobado','tarjeta de credito');
/*!40000 ALTER TABLE `gross_purchases` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gross_sales`
--

DROP TABLE IF EXISTS `gross_sales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gross_sales` (
  `gross_id` int NOT NULL AUTO_INCREMENT,
  `purchNet_id` int DEFAULT NULL,
  `shiping_id` int DEFAULT NULL,
  `status_` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`gross_id`),
  KEY `purchNet_id` (`purchNet_id`),
  KEY `shiping_id` (`shiping_id`),
  CONSTRAINT `gross_sales_ibfk_1` FOREIGN KEY (`purchNet_id`) REFERENCES `net_purchases` (`purchNet_id`) ON UPDATE CASCADE,
  CONSTRAINT `gross_sales_ibfk_2` FOREIGN KEY (`shiping_id`) REFERENCES `logistics` (`shiping_id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gross_sales`
--

LOCK TABLES `gross_sales` WRITE;
/*!40000 ALTER TABLE `gross_sales` DISABLE KEYS */;
INSERT INTO `gross_sales` VALUES (1,3,1,'el paquete fue entregado'),(2,4,2,'el paquete esta en camino');
/*!40000 ALTER TABLE `gross_sales` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inverse_log`
--

DROP TABLE IF EXISTS `inverse_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `inverse_log` (
  `inv_ship_id` int NOT NULL AUTO_INCREMENT,
  `net_id` int NOT NULL,
  `id_3PL` int NOT NULL,
  `shiping_price` decimal(10,2) NOT NULL,
  `est_date` date NOT NULL,
  `status_` varchar(100) NOT NULL,
  PRIMARY KEY (`inv_ship_id`),
  KEY `net_id` (`net_id`),
  KEY `id_3PL` (`id_3PL`),
  CONSTRAINT `inverse_log_ibfk_1` FOREIGN KEY (`net_id`) REFERENCES `net_sales` (`net_id`) ON UPDATE CASCADE,
  CONSTRAINT `inverse_log_ibfk_2` FOREIGN KEY (`id_3PL`) REFERENCES `_3pl´s` (`id_3PL`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inverse_log`
--

LOCK TABLES `inverse_log` WRITE;
/*!40000 ALTER TABLE `inverse_log` DISABLE KEYS */;
INSERT INTO `inverse_log` VALUES (1,1,1,300.50,'2023-02-15','recogido');
/*!40000 ALTER TABLE `inverse_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `logistics`
--

DROP TABLE IF EXISTS `logistics`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `logistics` (
  `shiping_id` int NOT NULL AUTO_INCREMENT,
  `purchNet_id` int DEFAULT NULL,
  `id_3PL` int DEFAULT NULL,
  `shiping_price` decimal(10,2) NOT NULL,
  `est_date` date NOT NULL,
  `status_` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`shiping_id`),
  KEY `purchNet_id` (`purchNet_id`),
  KEY `id_3PL` (`id_3PL`),
  CONSTRAINT `logistics_ibfk_1` FOREIGN KEY (`purchNet_id`) REFERENCES `net_purchases` (`purchNet_id`) ON UPDATE CASCADE,
  CONSTRAINT `logistics_ibfk_2` FOREIGN KEY (`id_3PL`) REFERENCES `_3pl´s` (`id_3PL`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `logistics`
--

LOCK TABLES `logistics` WRITE;
/*!40000 ALTER TABLE `logistics` DISABLE KEYS */;
INSERT INTO `logistics` VALUES (1,3,1,300.00,'2023-02-10','el paquete fue entregado'),(2,4,1,300.00,'2023-02-10','el paquete esta en camino'),(3,6,NULL,0.00,'2023-03-19','el paquete esta en camino');
/*!40000 ALTER TABLE `logistics` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `net_purchases`
--

DROP TABLE IF EXISTS `net_purchases`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `net_purchases` (
  `purchNet_id` int NOT NULL AUTO_INCREMENT,
  `purchGross_id` int DEFAULT NULL,
  `payment_id` int DEFAULT NULL,
  `date_` date DEFAULT NULL,
  `status_` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`purchNet_id`),
  KEY `purchGross_id` (`purchGross_id`),
  KEY `payment_id` (`payment_id`),
  CONSTRAINT `net_purchases_ibfk_1` FOREIGN KEY (`purchGross_id`) REFERENCES `gross_purchases` (`purchGross_id`) ON UPDATE CASCADE,
  CONSTRAINT `net_purchases_ibfk_2` FOREIGN KEY (`payment_id`) REFERENCES `payments` (`payment_id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `net_purchases`
--

LOCK TABLES `net_purchases` WRITE;
/*!40000 ALTER TABLE `net_purchases` DISABLE KEYS */;
INSERT INTO `net_purchases` VALUES (1,1,1,'2023-02-05','el vendedor esta preparando tu pedido'),(2,4,3,'2023-02-05','el vendedor cancelo la compra, te devolveremos tu dinero'),(3,5,4,'2023-02-05','el vendedor ya despacho tu pedido'),(4,6,5,'2023-02-05','el vendedor ya despacho tu pedido'),(6,7,6,'2023-02-05','el vendedor ya despacho tu pedido');
/*!40000 ALTER TABLE `net_purchases` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `logistics_insert` AFTER INSERT ON `net_purchases` FOR EACH ROW begin
  IF (new.status_ = "el vendedor ya despacho tu pedido")
  THEN
    insert into logistics(purchNet_id,id_3PL,shiping_price,est_date,status_) values (new.purchNet_id,id_3PL,shiping_price,date_add(now(), interval 4 day),'el paquete esta en camino');
  END IF;
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `logistics_insert_01` AFTER UPDATE ON `net_purchases` FOR EACH ROW begin
  IF (new.status_ = "el vendedor ya despacho tu pedido")
  THEN
    insert into logistics(purchNet_id,id_3PL,shiping_price,est_date,status_) values (new.purchNet_id,id_3PL,shiping_price,date_add(now(), interval 4 day),'el paquete esta en camino');
  END IF;
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `net_sales`
--

DROP TABLE IF EXISTS `net_sales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `net_sales` (
  `net_id` int NOT NULL AUTO_INCREMENT,
  `gross_id` int DEFAULT NULL,
  `shiping_id` int DEFAULT NULL,
  `status_` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`net_id`),
  KEY `gross_id` (`gross_id`),
  KEY `shiping_id` (`shiping_id`),
  CONSTRAINT `net_sales_ibfk_1` FOREIGN KEY (`gross_id`) REFERENCES `gross_sales` (`gross_id`) ON UPDATE CASCADE,
  CONSTRAINT `net_sales_ibfk_2` FOREIGN KEY (`shiping_id`) REFERENCES `logistics` (`shiping_id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `net_sales`
--

LOCK TABLES `net_sales` WRITE;
/*!40000 ALTER TABLE `net_sales` DISABLE KEYS */;
INSERT INTO `net_sales` VALUES (1,1,1,'el paquete ya fue entregado');
/*!40000 ALTER TABLE `net_sales` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payments`
--

DROP TABLE IF EXISTS `payments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payments` (
  `payment_id` int NOT NULL AUTO_INCREMENT,
  `purchGross_id` int DEFAULT NULL,
  `status_` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`payment_id`),
  KEY `purchGross_id` (`purchGross_id`),
  CONSTRAINT `payments_ibfk_1` FOREIGN KEY (`purchGross_id`) REFERENCES `gross_purchases` (`purchGross_id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payments`
--

LOCK TABLES `payments` WRITE;
/*!40000 ALTER TABLE `payments` DISABLE KEYS */;
INSERT INTO `payments` VALUES (1,1,'pago con tarjeta de credito visa: APROBADO'),(2,2,'pago con tarjeta de credito visa: RECHAZADO'),(3,4,'pago con tarjeta de credito visa: APROBADO'),(4,5,'pago con tarjeta de credito visa: APROBADO'),(5,6,'pago con tarjeta de credito visa: APROBADO'),(6,7,'pago con tarjeta de credito visa: APROBADO');
/*!40000 ALTER TABLE `payments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products` (
  `product_id` int NOT NULL AUTO_INCREMENT,
  `SKU` int DEFAULT NULL,
  `category` varchar(80) DEFAULT NULL,
  `description_` varchar(60) DEFAULT NULL,
  `price` decimal(10,2) NOT NULL,
  `quantity` int DEFAULT NULL,
  `seller_id` int DEFAULT NULL,
  PRIMARY KEY (`product_id`),
  KEY `seller_id` (`seller_id`),
  CONSTRAINT `products_ibfk_1` FOREIGN KEY (`seller_id`) REFERENCES `sellers` (`seller_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (1,1,'Electronica,audio y video','Auriculares in-ear inalambricos',10149.00,100,1),(2,2,'Autos, motos y otros','Ford Focus lii 2.0 Se Plus At6',3650000.00,0,1),(3,3,'Celulares y telefonos','Samsung Galaxy M23 5G 128 GB',88999.00,40,1),(4,4,'Ropa y accesosrios','Camisa manga corta Quiksilver',12453.00,10,1),(5,5,'Hogar, muebles y jardin','Mesa comedor 140 + 6 Sillas',36999.00,100,1),(6,6,'Electrodomesticos y aires ac.','Aire acondicionado slam split 4472 frigorias 220v',212999.00,20,1),(7,7,'Electrodomesticos y aires ac.','Aire acondicionado slam split 100000 frigorias 220v',500000.00,20,1);
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `bitacora_insert` AFTER INSERT ON `products` FOR EACH ROW begin
  insert into bitacora(action,date,product_id,new_value,old_value,user) values ('create',now(),new.product_id,new.description_,null,system_user());
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `bitacora_update` BEFORE UPDATE ON `products` FOR EACH ROW begin
  insert into bitacora(action,date,product_id,new_value,old_value,user) values ('edit',now(),new.product_id,new.description_,old.description_,system_user());
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `bitacora_delete` BEFORE DELETE ON `products` FOR EACH ROW begin
  insert into bitacora(action,date,product_id,new_value,old_value,user) values ('delete',now(),old.product_id,null,old.description_,system_user());
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Temporary view structure for view `purchase_board`
--

DROP TABLE IF EXISTS `purchase_board`;
/*!50001 DROP VIEW IF EXISTS `purchase_board`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `purchase_board` AS SELECT 
 1 AS `product_id`,
 1 AS `description_`,
 1 AS `Purchase_status`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `refunds`
--

DROP TABLE IF EXISTS `refunds`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `refunds` (
  `refund_id` int NOT NULL AUTO_INCREMENT,
  `purchNet_id` int DEFAULT NULL,
  `return_id` int DEFAULT NULL,
  `status_` varchar(100) NOT NULL,
  PRIMARY KEY (`refund_id`),
  KEY `purchNet_id` (`purchNet_id`),
  KEY `return_id` (`return_id`),
  CONSTRAINT `refunds_ibfk_1` FOREIGN KEY (`purchNet_id`) REFERENCES `net_purchases` (`purchNet_id`) ON UPDATE CASCADE,
  CONSTRAINT `refunds_ibfk_2` FOREIGN KEY (`return_id`) REFERENCES `returns_` (`return_id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `refunds`
--

LOCK TABLES `refunds` WRITE;
/*!40000 ALTER TABLE `refunds` DISABLE KEYS */;
INSERT INTO `refunds` VALUES (1,2,NULL,'tu dinero ha sido depositado en tu billetera virtual'),(2,3,1,'estamos esperando que el vendedor reciba el producto para devolver tu dinero');
/*!40000 ALTER TABLE `refunds` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `returns_`
--

DROP TABLE IF EXISTS `returns_`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `returns_` (
  `return_id` int NOT NULL AUTO_INCREMENT,
  `net_id` int NOT NULL,
  `inv_ship_id` int NOT NULL,
  `status_` varchar(100) NOT NULL,
  PRIMARY KEY (`return_id`),
  KEY `net_id` (`net_id`),
  KEY `inv_ship_id` (`inv_ship_id`),
  CONSTRAINT `returns__ibfk_1` FOREIGN KEY (`net_id`) REFERENCES `net_sales` (`net_id`) ON UPDATE CASCADE,
  CONSTRAINT `returns__ibfk_2` FOREIGN KEY (`inv_ship_id`) REFERENCES `inverse_log` (`inv_ship_id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `returns_`
--

LOCK TABLES `returns_` WRITE;
/*!40000 ALTER TABLE `returns_` DISABLE KEYS */;
INSERT INTO `returns_` VALUES (1,1,1,'el pedido ya ha sido recogido');
/*!40000 ALTER TABLE `returns_` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `revenue`
--

DROP TABLE IF EXISTS `revenue`;
/*!50001 DROP VIEW IF EXISTS `revenue`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `revenue` AS SELECT 
 1 AS `product_id`,
 1 AS `net_sales`,
 1 AS `price`,
 1 AS `net_revenue`,
 1 AS `gross_revenue`,
 1 AS `Health_ratio`,
 1 AS `Fundamentals`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `seller_center`
--

DROP TABLE IF EXISTS `seller_center`;
/*!50001 DROP VIEW IF EXISTS `seller_center`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `seller_center` AS SELECT 
 1 AS `seller_id`,
 1 AS `sellerName`,
 1 AS `product_id`,
 1 AS `description_`,
 1 AS `category`,
 1 AS `purchGross_id`,
 1 AS `purchNet_id`,
 1 AS `gross_id`,
 1 AS `net_id`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `seller_center_01`
--

DROP TABLE IF EXISTS `seller_center_01`;
/*!50001 DROP VIEW IF EXISTS `seller_center_01`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `seller_center_01` AS SELECT 
 1 AS `seller_id`,
 1 AS `sellerName`,
 1 AS `Products`,
 1 AS `Gross_purchases`,
 1 AS `Net_purchases`,
 1 AS `Gross_sales`,
 1 AS `Net_sales`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `seller_center_02`
--

DROP TABLE IF EXISTS `seller_center_02`;
/*!50001 DROP VIEW IF EXISTS `seller_center_02`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `seller_center_02` AS SELECT 
 1 AS `product_id`,
 1 AS `description_`,
 1 AS `category`,
 1 AS `seller_id`,
 1 AS `sellerName`,
 1 AS `Products`,
 1 AS `Gross_purchases`,
 1 AS `Net_purchases`,
 1 AS `Gross_sales`,
 1 AS `Net_sales`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `sellers`
--

DROP TABLE IF EXISTS `sellers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sellers` (
  `seller_id` int NOT NULL AUTO_INCREMENT,
  `name_` varchar(25) DEFAULT NULL,
  `surname` varchar(25) DEFAULT NULL,
  `DNI` int NOT NULL,
  `email` varchar(45) DEFAULT NULL,
  `phone` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`seller_id`),
  UNIQUE KEY `DNI` (`DNI`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sellers`
--

LOCK TABLES `sellers` WRITE;
/*!40000 ALTER TABLE `sellers` DISABLE KEYS */;
INSERT INTO `sellers` VALUES (1,'Manuel','Traverso',39760688,'m.traverso96@gmail.com','1130310056');
/*!40000 ALTER TABLE `sellers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'marketplace'
--

--
-- Dumping routines for database 'marketplace'
--
/*!50003 DROP FUNCTION IF EXISTS `foundations` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `foundations`(g numeric(10,2), n numeric(10,2)) RETURNS varchar(50) CHARSET utf8mb4
    DETERMINISTIC
begin
   declare f numeric(10,2);
   declare mensaje varchar(50);
   IF g <> 0
   THEN
   set f = n/g;
   ELSE
   set f = null;
   END IF;
   
   IF f >= 0.8
   THEN
   set mensaje = 'Tienes un flujo saludable';
   ELSEIF f is not null
   THEN
   set mensaje = 'Debes mejorar tu flujo de ventas';
   ELSE
   set mensaje = 'Aun no tienes ninguna venta';
   END IF;
   return mensaje;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `purchase_status` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `purchase_status`(a varchar(100), b varchar(100), c varchar(100), d varchar(100), e varchar(100), f varchar(100), g varchar(100)) RETURNS varchar(100) CHARSET utf8mb4
    DETERMINISTIC
begin
declare mensaje varchar(100);
   IF g is not null
   THEN 
   set mensaje = g;
   ELSEIF f is not null
   THEN 
   set mensaje = f;
   ELSEIF e is not null
   THEN
   set mensaje = e;
      ELSEIF d is not null
   THEN
   set mensaje = d;
      ELSEIF c is not null
   THEN
   set mensaje = c;
      ELSEIF b is not null
   THEN
   set mensaje = b;
     ELSEIF a is not null
   THEN
   set mensaje = a;   
   END IF;
   return mensaje;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `ratio` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `ratio`(g numeric(10,2), n numeric(10,2)) RETURNS decimal(10,2)
    DETERMINISTIC
begin
   declare f numeric(10,2);
   IF g <> 0
   THEN
   set f = n/g;
   ELSE
   set f = null;
   END IF;
   return f;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `revenue` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `revenue`(n numeric(10,2), p numeric(10,2)) RETURNS decimal(10,2)
    DETERMINISTIC
begin
   return n*p;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `pack_off` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `pack_off`(IN dato int, IN status varchar(100) )
begin
  update net_purchases
  set status_=status
  where purchNet_id=dato;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `shiping` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `shiping`(IN dato01 int, IN dato02 int, IN price decimal(6,2))
begin
   update logistics
   set id_3PL=dato02,
   shiping_price=price
   where shiping_id=dato01; 
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `buyer_center`
--

/*!50001 DROP VIEW IF EXISTS `buyer_center`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `buyer_center` AS select `t1`.`buyer_id` AS `buyer_id`,concat(`t1`.`name_`,' ',`t1`.`surname`) AS `buyerName`,`t3`.`product_id` AS `product_id`,`t3`.`description_` AS `description_`,`t2`.`purchGross_id` AS `purchGross_id`,`t2`.`status_` AS `status01`,`t4`.`payment_id` AS `payment_id`,`t4`.`status_` AS `status02`,`t5`.`purchNet_id` AS `purchNet_id`,`t5`.`status_` AS `status03`,`t6`.`gross_id` AS `gross_id`,`t6`.`status_` AS `status04`,`t7`.`shiping_id` AS `shiping_id`,`t7`.`est_date` AS `est_date`,`t8`.`net_id` AS `net_id`,`t8`.`status_` AS `status05`,`t9`.`return_id` AS `return_id`,`t9`.`status_` AS `status06`,`t10`.`refund_id` AS `refund_id`,`t10`.`status_` AS `status07` from (((((((((`buyers` `t1` join `gross_purchases` `t2` on((`t1`.`buyer_id` = `t2`.`buyer_id`))) join `products` `t3` on((`t2`.`product_id` = `t3`.`product_id`))) left join `payments` `t4` on((`t2`.`purchGross_id` = `t4`.`purchGross_id`))) left join `net_purchases` `t5` on((`t2`.`purchGross_id` = `t5`.`purchGross_id`))) left join `gross_sales` `t6` on((`t5`.`purchNet_id` = `t6`.`purchNet_id`))) left join `logistics` `t7` on((`t6`.`shiping_id` = `t7`.`shiping_id`))) left join `net_sales` `t8` on((`t6`.`gross_id` = `t8`.`gross_id`))) left join `returns_` `t9` on((`t8`.`net_id` = `t9`.`net_id`))) left join `refunds` `t10` on((`t5`.`purchNet_id` = `t10`.`purchNet_id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `purchase_board`
--

/*!50001 DROP VIEW IF EXISTS `purchase_board`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `purchase_board` AS select `buyer_center`.`product_id` AS `product_id`,`buyer_center`.`description_` AS `description_`,`purchase_status`(`buyer_center`.`status01`,`buyer_center`.`status02`,`buyer_center`.`status03`,`buyer_center`.`status04`,`buyer_center`.`status05`,`buyer_center`.`status06`,`buyer_center`.`status07`) AS `Purchase_status` from `buyer_center` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `revenue`
--

/*!50001 DROP VIEW IF EXISTS `revenue`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `revenue` AS select 1 AS `product_id`,1 AS `net_sales`,1 AS `price`,1 AS `net_revenue`,1 AS `gross_revenue`,1 AS `Health_ratio`,1 AS `Fundamentals` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `seller_center`
--

/*!50001 DROP VIEW IF EXISTS `seller_center`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `seller_center` AS select 1 AS `seller_id`,1 AS `sellerName`,1 AS `product_id`,1 AS `description_`,1 AS `category`,1 AS `purchGross_id`,1 AS `purchNet_id`,1 AS `gross_id`,1 AS `net_id` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `seller_center_01`
--

/*!50001 DROP VIEW IF EXISTS `seller_center_01`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `seller_center_01` AS select 1 AS `seller_id`,1 AS `sellerName`,1 AS `Products`,1 AS `Gross_purchases`,1 AS `Net_purchases`,1 AS `Gross_sales`,1 AS `Net_sales` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `seller_center_02`
--

/*!50001 DROP VIEW IF EXISTS `seller_center_02`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `seller_center_02` AS select 1 AS `product_id`,1 AS `description_`,1 AS `category`,1 AS `seller_id`,1 AS `sellerName`,1 AS `Products`,1 AS `Gross_purchases`,1 AS `Net_purchases`,1 AS `Gross_sales`,1 AS `Net_sales` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-03-15 12:17:56
