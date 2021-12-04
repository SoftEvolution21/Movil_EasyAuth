-- MariaDB dump 10.19  Distrib 10.4.21-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: db_permisos2
-- ------------------------------------------------------
-- Server version	10.4.21-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `carrera`
--

DROP TABLE IF EXISTS `carrera`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `carrera` (
  `idcarrera` int(10) NOT NULL AUTO_INCREMENT,
  `tx_carrera` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`idcarrera`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `carrera`
--

LOCK TABLES `carrera` WRITE;
/*!40000 ALTER TABLE `carrera` DISABLE KEYS */;
INSERT INTO `carrera` VALUES (1,'Ing. en Desarrollo y Gestión de Software'),(2,'Lic. en Gestión y Desarrollo Turístico'),(3,'Lic. en Contabilidad'),(4,'Ing. en Construcción');
/*!40000 ALTER TABLE `carrera` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ctg_tipousuario`
--

DROP TABLE IF EXISTS `ctg_tipousuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ctg_tipousuario` (
  `idctg_tipousuario` int(10) NOT NULL AUTO_INCREMENT,
  `tx_tipousuario` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idctg_tipousuario`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ctg_tipousuario`
--

LOCK TABLES `ctg_tipousuario` WRITE;
/*!40000 ALTER TABLE `ctg_tipousuario` DISABLE KEYS */;
INSERT INTO `ctg_tipousuario` VALUES (1,'Administrador'),(2,'Tutor'),(3,'Alumno'),(4,'Docente');
/*!40000 ALTER TABLE `ctg_tipousuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cuatrimestre`
--

DROP TABLE IF EXISTS `cuatrimestre`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cuatrimestre` (
  `idcuatrimestre` int(10) NOT NULL AUTO_INCREMENT,
  `tx_cuatrimestre` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idcuatrimestre`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cuatrimestre`
--

LOCK TABLES `cuatrimestre` WRITE;
/*!40000 ALTER TABLE `cuatrimestre` DISABLE KEYS */;
INSERT INTO `cuatrimestre` VALUES (1,'Primer Cuatrimestre'),(2,'Segundo Cuatrimestre'),(3,'Tercer Cuatrimestre'),(4,'Cuarto Cuatrimestre'),(5,'Quinto Cuatrimestre'),(6,'Sexto Cuatrimestre'),(7,'Séptimo Cuatrimestre'),(8,'Octavo Cuatrimestre'),(9,'Noveno Cuatrimestre'),(10,'Décimo Cuatrimestre'),(11,'Onceavo Cuatrimestre');
/*!40000 ALTER TABLE `cuatrimestre` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grupo`
--

DROP TABLE IF EXISTS `grupo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grupo` (
  `idgrupo` int(10) NOT NULL AUTO_INCREMENT,
  `tx_grupo` varchar(5) DEFAULT NULL,
  PRIMARY KEY (`idgrupo`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grupo`
--

LOCK TABLES `grupo` WRITE;
/*!40000 ALTER TABLE `grupo` DISABLE KEYS */;
INSERT INTO `grupo` VALUES (1,'A'),(2,'B'),(3,'C');
/*!40000 ALTER TABLE `grupo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `solicitudpermiso_tbl_user`
--

DROP TABLE IF EXISTS `solicitudpermiso_tbl_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `solicitudpermiso_tbl_user` (
  `idsolicitudpermiso` int(11) NOT NULL AUTO_INCREMENT,
  `observaciones` varchar(999) DEFAULT NULL,
  `No_permiso` int(5) DEFAULT NULL,
  `motivo` varchar(500) DEFAULT NULL,
  `dias` varchar(300) DEFAULT NULL,
  `mes` varchar(20) DEFAULT NULL,
  `anio` varchar(10) DEFAULT NULL,
  `horario` varchar(300) DEFAULT NULL,
  `dt_solicitud` datetime DEFAULT NULL,
  `tx_statuspermiso` varchar(40) DEFAULT NULL,
  `dt_notificado` datetime DEFAULT NULL,
  `idtbl_user` int(10) DEFAULT NULL,
  PRIMARY KEY (`idsolicitudpermiso`),
  KEY `idtbl_user` (`idtbl_user`),
  CONSTRAINT `solicitudpermiso_tbl_user_ibfk_1` FOREIGN KEY (`idtbl_user`) REFERENCES `tbl_user` (`idtbl_user`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `solicitudpermiso_tbl_user`
--

LOCK TABLES `solicitudpermiso_tbl_user` WRITE;
/*!40000 ALTER TABLE `solicitudpermiso_tbl_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `solicitudpermiso_tbl_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_user`
--

DROP TABLE IF EXISTS `tbl_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_user` (
  `idtbl_user` int(10) NOT NULL AUTO_INCREMENT,
  `matriculauser` varchar(50) DEFAULT NULL,
  `tx_nombreuser` varchar(100) DEFAULT NULL,
  `tx_appaterno` varchar(100) DEFAULT NULL,
  `tx_apmaterno` varchar(100) DEFAULT NULL,
  `tx_password` varchar(100) DEFAULT NULL,
  `turno` varchar(100) DEFAULT NULL,
  `dt_registro` datetime DEFAULT NULL,
  `tutor` varchar(100) DEFAULT NULL,
  `idctg_tipousuario` int(10) DEFAULT NULL,
  `idcarrera` int(10) DEFAULT NULL,
  `idcuatrimestre` int(10) DEFAULT NULL,
  `idgrupo` int(10) DEFAULT NULL,
  PRIMARY KEY (`idtbl_user`),
  KEY `idctg_tipousuario` (`idctg_tipousuario`),
  KEY `idcarrera` (`idcarrera`),
  KEY `idcuatrimestre` (`idcuatrimestre`),
  KEY `idgrupo` (`idgrupo`),
  CONSTRAINT `tbl_user_ibfk_1` FOREIGN KEY (`idctg_tipousuario`) REFERENCES `ctg_tipousuario` (`idctg_tipousuario`),
  CONSTRAINT `tbl_user_ibfk_2` FOREIGN KEY (`idcarrera`) REFERENCES `carrera` (`idcarrera`),
  CONSTRAINT `tbl_user_ibfk_3` FOREIGN KEY (`idcuatrimestre`) REFERENCES `cuatrimestre` (`idcuatrimestre`),
  CONSTRAINT `tbl_user_ibfk_4` FOREIGN KEY (`idgrupo`) REFERENCES `grupo` (`idgrupo`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_user`
--

LOCK TABLES `tbl_user` WRITE;
/*!40000 ALTER TABLE `tbl_user` DISABLE KEYS */;
INSERT INTO `tbl_user` VALUES (1,'091810777','José Luis','Solórzano','López','123456','Vespertino','2021-11-21 17:01:19',NULL,3,1,10,1),(2,'091810123','Kevin','Mazariegos','Gómez','123456','Vespertino','2021-11-21 17:01:19',NULL,3,1,7,1),(3,'123456','Héctor Hugo','Herrera','Escobar','123456',NULL,'2021-11-21 17:01:19',NULL,4,NULL,NULL,NULL),(4,'123123','Juan Carlos','Crúz','Rodríguez','123456',NULL,'2021-11-21 17:01:19',NULL,4,NULL,NULL,NULL),(5,'12345678','Admin1','Admin','Admin','12345678',NULL,'2021-12-01 11:14:04',NULL,1,NULL,NULL,NULL),(6,'123456789','Admin2','Admin','Admin','123456789',NULL,'2021-12-01 11:14:27',NULL,1,NULL,NULL,NULL);
/*!40000 ALTER TABLE `tbl_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tutor`
--

DROP TABLE IF EXISTS `tutor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tutor` (
  `id_tutor` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `cedula` varchar(50) DEFAULT NULL,
  `tx_nombreuser` varchar(50) DEFAULT NULL,
  `tx_appaterno` varchar(50) DEFAULT NULL,
  `tx_apmaterno` varchar(50) DEFAULT NULL,
  `tx_password` varchar(50) DEFAULT NULL,
  `dt_registro` datetime DEFAULT NULL,
  `idctg_tipousuario` int(10) DEFAULT NULL,
  `idcarrera` int(10) DEFAULT NULL,
  `idcuatrimestre` int(10) DEFAULT NULL,
  `idgrupo` int(10) DEFAULT NULL,
  PRIMARY KEY (`id_tutor`),
  KEY `idctg_tipousuario` (`idctg_tipousuario`),
  KEY `idcarrera` (`idcarrera`),
  KEY `idcuatrimestre` (`idcuatrimestre`),
  KEY `idgrupo` (`idgrupo`),
  CONSTRAINT `tutor_ibfk_1` FOREIGN KEY (`idctg_tipousuario`) REFERENCES `ctg_tipousuario` (`idctg_tipousuario`),
  CONSTRAINT `tutor_ibfk_2` FOREIGN KEY (`idcarrera`) REFERENCES `carrera` (`idcarrera`),
  CONSTRAINT `tutor_ibfk_3` FOREIGN KEY (`idcuatrimestre`) REFERENCES `cuatrimestre` (`idcuatrimestre`),
  CONSTRAINT `tutor_ibfk_4` FOREIGN KEY (`idgrupo`) REFERENCES `grupo` (`idgrupo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tutor`
--

LOCK TABLES `tutor` WRITE;
/*!40000 ALTER TABLE `tutor` DISABLE KEYS */;
/*!40000 ALTER TABLE `tutor` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-12-01 23:42:32
