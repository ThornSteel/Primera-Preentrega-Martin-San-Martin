-- MySQL dump 10.13  Distrib 8.0.41, for Win64 (x86_64)
--
-- Host: localhost    Database: martin-san-martin-segunda-preentrega
-- ------------------------------------------------------
-- Server version	8.0.40

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
-- Table structure for table `productos`
--

DROP TABLE IF EXISTS `productos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `productos` (
  `ProductoID` int NOT NULL AUTO_INCREMENT,
  `NombreProducto` varchar(100) NOT NULL,
  `Stock` int NOT NULL,
  `PrecioUnitario` decimal(10,2) NOT NULL,
  PRIMARY KEY (`ProductoID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productos`
--

LOCK TABLES `productos` WRITE;
/*!40000 ALTER TABLE `productos` DISABLE KEYS */;
INSERT INTO `productos` VALUES (1,'Laptop HP',20,750.00),(2,'Mouse Logitech',50,25.99),(3,'Teclado Mecánico Redragon',30,45.50),(4,'Monitor Samsung 24\"',15,180.75),(5,'Silla Gamer Corsair',10,350.00);
/*!40000 ALTER TABLE `productos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proveedor_productos`
--

DROP TABLE IF EXISTS `proveedor_productos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `proveedor_productos` (
  `ProveedorID` int NOT NULL,
  `ProductoID` int NOT NULL,
  PRIMARY KEY (`ProveedorID`,`ProductoID`),
  KEY `ProductoID` (`ProductoID`),
  CONSTRAINT `proveedor_productos_ibfk_1` FOREIGN KEY (`ProveedorID`) REFERENCES `proveedores` (`ProveedorID`),
  CONSTRAINT `proveedor_productos_ibfk_2` FOREIGN KEY (`ProductoID`) REFERENCES `productos` (`ProductoID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proveedor_productos`
--

LOCK TABLES `proveedor_productos` WRITE;
/*!40000 ALTER TABLE `proveedor_productos` DISABLE KEYS */;
INSERT INTO `proveedor_productos` VALUES (1,1),(2,2),(3,3),(4,4),(5,5);
/*!40000 ALTER TABLE `proveedor_productos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proveedores`
--

DROP TABLE IF EXISTS `proveedores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `proveedores` (
  `ProveedorID` int NOT NULL AUTO_INCREMENT,
  `NombreProveedor` varchar(100) NOT NULL,
  `Contacto` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`ProveedorID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proveedores`
--

LOCK TABLES `proveedores` WRITE;
/*!40000 ALTER TABLE `proveedores` DISABLE KEYS */;
INSERT INTO `proveedores` VALUES (1,'Tech Distribuidora','contacto@techdistribuidora.com'),(2,'Electro Import','ventas@electroimport.com'),(3,'Gamer Zone','info@gamerzone.com'),(4,'Office Solutions','soporte@officesolutions.com'),(5,'Distribuidora Digital','ventas@distribuidoradigital.com');
/*!40000 ALTER TABLE `proveedores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `re_stock`
--

DROP TABLE IF EXISTS `re_stock`;
/*!50001 DROP VIEW IF EXISTS `re_stock`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `re_stock` AS SELECT 
 1 AS `Contacto`,
 1 AS `NombreProducto`,
 1 AS `Stock`,
 1 AS `VentaID`,
 1 AS `MontoTotal`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `vendedores`
--

DROP TABLE IF EXISTS `vendedores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vendedores` (
  `VendedorID` int NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(100) NOT NULL,
  `Contacto` varchar(100) DEFAULT NULL,
  `FechaIngreso` date DEFAULT NULL,
  PRIMARY KEY (`VendedorID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vendedores`
--

LOCK TABLES `vendedores` WRITE;
/*!40000 ALTER TABLE `vendedores` DISABLE KEYS */;
INSERT INTO `vendedores` VALUES (1,'Juan Pérez','juan.perez@email.com','2022-01-15'),(2,'María Gómez','maria.gomez@email.com','2021-07-10'),(3,'Carlos López','carlos.lopez@email.com','2023-03-05'),(4,'Ana Fernández','ana.fernandez@email.com','2020-12-20'),(5,'Pedro Martínez','pedro.martinez@email.com','2019-06-25');
/*!40000 ALTER TABLE `vendedores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ventas`
--

DROP TABLE IF EXISTS `ventas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ventas` (
  `VentaID` int NOT NULL AUTO_INCREMENT,
  `Fecha` date NOT NULL,
  `ProductoID` int NOT NULL,
  `Cantidad` int NOT NULL,
  `MontoTotal` decimal(10,2) NOT NULL,
  `VendedorID` int NOT NULL,
  PRIMARY KEY (`VentaID`),
  KEY `ProductoID` (`ProductoID`),
  KEY `VendedorID` (`VendedorID`),
  CONSTRAINT `ventas_ibfk_1` FOREIGN KEY (`ProductoID`) REFERENCES `productos` (`ProductoID`),
  CONSTRAINT `ventas_ibfk_2` FOREIGN KEY (`VendedorID`) REFERENCES `vendedores` (`VendedorID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ventas`
--

LOCK TABLES `ventas` WRITE;
/*!40000 ALTER TABLE `ventas` DISABLE KEYS */;
INSERT INTO `ventas` VALUES (1,'2024-02-15',1,2,1500.00,1),(2,'2024-02-16',2,5,129.95,2),(3,'2024-02-17',3,3,136.50,3),(4,'2024-02-18',4,1,180.75,4),(5,'2024-02-19',5,2,700.00,5);
/*!40000 ALTER TABLE `ventas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `vista_proveedor_ventas`
--

DROP TABLE IF EXISTS `vista_proveedor_ventas`;
/*!50001 DROP VIEW IF EXISTS `vista_proveedor_ventas`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vista_proveedor_ventas` AS SELECT 
 1 AS `ProveedorID`,
 1 AS `NombreProveedor`,
 1 AS `NombreProducto`,
 1 AS `Stock`,
 1 AS `VentaID`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `re_stock`
--

/*!50001 DROP VIEW IF EXISTS `re_stock`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `re_stock` AS select `p`.`Contacto` AS `Contacto`,`pr`.`NombreProducto` AS `NombreProducto`,`pr`.`Stock` AS `Stock`,`v`.`VentaID` AS `VentaID`,`v`.`MontoTotal` AS `MontoTotal` from (((`proveedores` `p` join `proveedor_productos` `pp` on((`p`.`ProveedorID` = `pp`.`ProveedorID`))) join `productos` `pr` on((`pp`.`ProductoID` = `pr`.`ProductoID`))) left join `ventas` `v` on((`pr`.`ProductoID` = `v`.`ProductoID`))) order by `pr`.`NombreProducto`,`v`.`Fecha` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vista_proveedor_ventas`
--

/*!50001 DROP VIEW IF EXISTS `vista_proveedor_ventas`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_proveedor_ventas` AS select `p`.`ProveedorID` AS `ProveedorID`,`p`.`NombreProveedor` AS `NombreProveedor`,`pr`.`NombreProducto` AS `NombreProducto`,`pr`.`Stock` AS `Stock`,`v`.`VentaID` AS `VentaID` from (((`proveedores` `p` join `proveedor_productos` `pp` on((`p`.`ProveedorID` = `pp`.`ProveedorID`))) join `productos` `pr` on((`pp`.`ProductoID` = `pr`.`ProductoID`))) left join `ventas` `v` on((`pr`.`ProductoID` = `v`.`ProductoID`))) order by `p`.`ProveedorID`,`v`.`Fecha` desc */;
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

-- Dump completed on 2025-03-01 21:48:43
