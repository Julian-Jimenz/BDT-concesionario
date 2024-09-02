-- MySQL dump 10.13  Distrib 8.0.19, for Win64 (x86_64)
--
-- Host: localhost    Database: concesionario
-- ------------------------------------------------------
-- Server version	5.5.5-10.4.32-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `clientes`
--

DROP TABLE IF EXISTS `clientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clientes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `vendedor_id` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `ciudad` varchar(100) NOT NULL,
  `gastos` float NOT NULL,
  `fecha_alta` datetime NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `vendedor_id` (`vendedor_id`),
  CONSTRAINT `clientes_ibfk_1` FOREIGN KEY (`vendedor_id`) REFERENCES `vendedores` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clientes`
--

LOCK TABLES `clientes` WRITE;
/*!40000 ALTER TABLE `clientes` DISABLE KEYS */;
INSERT INTO `clientes` VALUES (1,4,'Juan López','Bogotá',55150800,'2024-01-10 10:15:00'),(2,8,'Marta Pérez','Medellín',23000500,'2023-12-05 14:30:00'),(3,2,'Luis García','Cali',170000000,'2024-02-20 09:45:00'),(4,4,'Ana Martínez','Barranquilla',20800200,'2023-11-15 11:30:00'),(5,3,'Pedro Hernández','Cartagena',15500300,'2024-01-25 16:00:00'),(6,2,'Laura Sánchez','Bucaramanga',200000000,'2023-10-05 13:20:00'),(7,7,'Carmen Fernández','Pereira',125040000,'2024-03-10 08:50:00'),(8,1,'José Ruiz','Manizales',300000000,'2023-09-12 12:40:00'),(9,9,'Lucía Gómez','Santa Marta',90000000,'2024-01-17 10:00:00'),(10,10,'Carlos Díaz','Ibagué',220060000,'2023-11-27 17:30:00'),(12,10,'Carlos Díaz','Ibagué',220060000,'2023-11-27 17:30:00');
/*!40000 ALTER TABLE `clientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `coches`
--

DROP TABLE IF EXISTS `coches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `coches` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `modelo` varchar(50) NOT NULL,
  `marca` varchar(50) NOT NULL,
  `precio` float NOT NULL,
  `stock` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `coches`
--

LOCK TABLES `coches` WRITE;
/*!40000 ALTER TABLE `coches` DISABLE KEYS */;
INSERT INTO `coches` VALUES (1,'Civic','Honda',102000000,5),(2,'Corolla','Toyota',76500000,8),(3,'Model 3','Tesla',51000000,12),(4,'Titan','MegaAuto',125000000,3),(5,'Mustang','Ford',86700500,6),(6,'A4','Audi',97278900,7),(7,'Camry','Toyota',200000000,2);
/*!40000 ALTER TABLE `coches` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `encargos`
--

DROP TABLE IF EXISTS `encargos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `encargos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cliente_id` int(11) NOT NULL,
  `coche_id` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `fecha_alta` datetime NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `cliente_id` (`cliente_id`),
  KEY `coche_id` (`coche_id`),
  CONSTRAINT `encargos_ibfk_1` FOREIGN KEY (`cliente_id`) REFERENCES `clientes` (`id`),
  CONSTRAINT `encargos_ibfk_2` FOREIGN KEY (`coche_id`) REFERENCES `coches` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `encargos`
--

LOCK TABLES `encargos` WRITE;
/*!40000 ALTER TABLE `encargos` DISABLE KEYS */;
INSERT INTO `encargos` VALUES (1,1,2,3,'2024-01-12 11:30:00'),(2,2,1,1,'2024-02-15 14:00:00'),(3,3,4,2,'2024-03-20 09:45:00'),(4,4,3,5,'2024-01-18 16:00:00'),(5,5,5,1,'2024-02-10 12:20:00'),(6,6,2,4,'2024-03-05 10:00:00'),(7,7,1,2,'2024-01-30 08:50:00'),(8,8,4,3,'2024-02-25 14:30:00'),(9,9,3,2,'2024-02-05 10:15:00'),(10,10,5,1,'2024-03-01 15:45:00'),(11,10,2,3,'2024-03-01 15:45:00'),(12,10,4,3,'2024-03-01 15:45:00');
/*!40000 ALTER TABLE `encargos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grupos`
--

DROP TABLE IF EXISTS `grupos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `grupos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  `ciudad` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grupos`
--

LOCK TABLES `grupos` WRITE;
/*!40000 ALTER TABLE `grupos` DISABLE KEYS */;
INSERT INTO `grupos` VALUES (1,'Vendedores A','Madrid'),(2,'Director mecanico','Madrid'),(3,'Vendedores C','Valencia'),(4,'Vendedores D','Sevilla'),(5,'Vendedores C','Bilbao'),(6,'Vendedores C','Zaragoza'),(7,'Vendedores D','Málaga'),(8,'Vendedores C','Murcia'),(9,'Vendedores A','Palma'),(10,'Vendedores D','Granada');
/*!40000 ALTER TABLE `grupos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vendedores`
--

DROP TABLE IF EXISTS `vendedores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vendedores` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `grupo_id` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `apellidos` varchar(50) NOT NULL,
  `cargo` mediumtext NOT NULL,
  `fecha_alta` datetime NOT NULL DEFAULT current_timestamp(),
  `sueldo` float NOT NULL,
  `comision` float NOT NULL,
  `jefe` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `grupo_id` (`grupo_id`),
  CONSTRAINT `vendedores_ibfk_1` FOREIGN KEY (`grupo_id`) REFERENCES `grupos` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vendedores`
--

LOCK TABLES `vendedores` WRITE;
/*!40000 ALTER TABLE `vendedores` DISABLE KEYS */;
INSERT INTO `vendedores` VALUES (1,1,'Carlos','Pérez','Gerente de Ventas','2024-01-15 09:30:00',5550000,5,0),(2,2,'María','Rodríguez','Asistente de Ventas','2023-11-22 11:00:00',3000000,2,1),(3,4,'Juan','García','Vendedor Senior','2023-05-10 14:45:00',4055000,2,1),(4,3,'Ana','Martínez','Vendedor Junior','2024-03-01 10:15:00',1355000,2,3),(5,5,'Luis','López','Gerente de Área','2022-07-19 08:00:00',5550000,4,0),(6,6,'Elena','Hernández','Especialista en Ventas','2023-09-25 16:30:00',4000000,10,1),(7,7,'José','González','Vendedor Senior','2024-01-10 13:20:00',4700000,2,3),(8,8,'Sara','Díaz','Vendedor Junior','2023-12-15 09:50:00',1355000,2,2),(9,9,'Miguel','Sánchez','Asistente de Ventas','2023-02-14 12:10:00',1355000,0,3),(10,3,'Julian','Sánchez','Asistente de Ventas','2023-02-14 12:10:00',1355000,0,3),(11,10,'Laura','Gómez','Gerente de Zona','2022-04-05 10:00:00',7500000,10,0);
/*!40000 ALTER TABLE `vendedores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'concesionario'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-09-02 16:15:15
