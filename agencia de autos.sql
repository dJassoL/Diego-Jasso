-- Proyecto: Creación de una base de datos desde 0 para una agencia de autos


-- MySQL dump 10.13  Distrib 8.0.39, for Win64 (x86_64)
--
-- Host: localhost    Database: rapidos_furiosos
-- ------------------------------------------------------
-- Server version	8.0.39

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
-- Current Database: `rapidos_furiosos`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `rapidos_furiosos` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `rapidos_furiosos`;

--
-- Table structure for table `auto`
--

DROP TABLE IF EXISTS `auto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auto` (
  `id_auto` smallint unsigned NOT NULL AUTO_INCREMENT,
  `id_marca` smallint unsigned NOT NULL,
  `id_modelo` smallint unsigned NOT NULL,
  `color` varchar(20) NOT NULL,
  `precio` decimal(10,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`id_auto`),
  UNIQUE KEY `id_auto` (`id_auto`,`id_marca`,`id_modelo`),
  KEY `fk_au_mar` (`id_marca`),
  KEY `fk_au_mod` (`id_modelo`),
  CONSTRAINT `fk_au_mar` FOREIGN KEY (`id_marca`) REFERENCES `marca` (`id_marca`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `fk_au_mod` FOREIGN KEY (`id_modelo`) REFERENCES `modelo` (`id_modelo`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auto`
--

LOCK TABLES `auto` WRITE;
/*!40000 ALTER TABLE `auto` DISABLE KEYS */;
INSERT INTO `auto` VALUES (1,1,1,'Indigo',557953.10),(2,2,2,'Goldenrod',624422.12),(3,1,3,'Violet',903435.07),(4,3,4,'Teal',788900.46),(5,4,5,'Turquoise',233550.79),(6,6,6,'Puce',903023.13),(7,8,7,'Fuscia',799172.63),(8,7,8,'Orange',613008.12),(9,7,9,'Mauv',124573.09),(10,9,10,'Crimson',932232.49),(11,10,11,'Crimson',800656.33),(12,11,12,'Puce',194849.71),(13,12,13,'Blue',855650.63),(14,13,14,'Maroon',779942.92),(15,13,15,'Mauv',945116.27),(16,14,16,'Indigo',466081.70),(17,15,17,'Mauv',386970.48),(18,16,18,'Aquamarine',625958.90),(19,13,19,'Orange',437205.98),(20,16,20,'Yellow',396544.69),(21,9,21,'Teal',926672.90),(22,18,22,'Aquamarine',238443.58),(23,20,23,'Khaki',939579.11),(24,9,24,'Purple',807148.09),(25,8,25,'Red',190326.91),(26,21,26,'Crimson',770040.53),(27,18,27,'Aquamarine',491314.84),(28,19,28,'Crimson',305153.34),(29,9,29,'Blue',676610.89),(30,9,30,'Orange',239722.52),(31,9,31,'Blue',664639.93),(32,4,32,'Maroon',826716.17),(33,9,33,'Fuscia',289589.59),(34,18,34,'Red',790433.53),(35,22,35,'Turquoise',126838.33),(36,7,36,'Aquamarine',503743.57),(37,3,37,'Crimson',312529.13),(38,18,38,'Red',377432.96),(39,23,39,'Red',919891.82),(40,18,40,'Green',967409.55),(41,7,41,'Pink',825983.91),(42,11,42,'Yellow',312059.32),(43,24,43,'Orange',954783.80),(44,23,44,'Pink',722480.38),(45,25,45,'Orange',933164.69),(46,26,46,'Turquoise',185654.27),(47,27,47,'Maroon',262655.61),(48,7,48,'Yellow',424814.80),(49,18,49,'Blue',775640.96),(50,4,50,'Green',468608.44),(51,16,51,'Pink',161130.12),(52,16,52,'Crimson',446107.73),(53,7,53,'Indigo',561616.49),(54,18,54,'Goldenrod',471802.02),(55,29,55,'Aquamarine',820458.79),(56,30,56,'Turquoise',195233.35),(57,31,57,'Yellow',324667.17),(58,7,58,'Yellow',266352.92),(59,13,59,'Turquoise',574980.69),(60,26,60,'Turquoise',300030.80),(61,12,61,'Khaki',530257.48),(62,11,62,'Goldenrod',997384.51),(63,18,63,'Indigo',721769.01),(64,9,64,'Turquoise',393464.15),(65,15,65,'Green',366638.97),(66,17,66,'Purple',756279.97),(67,4,67,'Pink',941250.35),(68,32,68,'Violet',717101.59),(69,7,69,'Orange',726993.34),(70,8,70,'Maroon',948932.78),(71,33,71,'Red',856058.86),(72,34,72,'Aquamarine',923109.90),(73,7,73,'Khaki',408876.64),(74,35,74,'Turquoise',381087.06),(75,13,75,'Crimson',809016.89),(76,21,76,'Teal',147086.77),(77,32,77,'Yellow',851556.08),(78,36,78,'Goldenrod',811337.23),(79,5,79,'Mauv',312144.50),(80,28,80,'Turquoise',127786.64),(81,7,81,'Khaki',186851.20),(82,7,82,'Indigo',694734.74),(83,2,83,'Crimson',129377.09),(84,16,84,'Teal',255663.03),(85,37,85,'Red',563756.49),(86,9,86,'Pink',580517.52),(87,2,87,'Teal',956601.62),(88,17,88,'Teal',233736.43),(89,38,89,'Puce',142800.61),(90,32,90,'Violet',835823.32),(91,39,91,'Puce',622059.39),(92,6,92,'Pink',333955.37),(93,40,93,'Turquoise',764733.59),(94,25,94,'Maroon',871859.94),(95,2,95,'Purple',438168.84),(96,41,96,'Khaki',843350.02),(97,25,97,'Puce',319732.98),(98,14,98,'Indigo',643734.83),(99,17,99,'Aquamarine',980687.69),(100,42,100,'Maroon',726073.63);
/*!40000 ALTER TABLE `auto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cliente` (
  `id_cliente` smallint unsigned NOT NULL AUTO_INCREMENT,
  `id_direccion` smallint unsigned NOT NULL,
  `nombre` varchar(30) NOT NULL,
  `apellido_pa` varchar(30) NOT NULL,
  `apellido_ma` varchar(30) DEFAULT NULL,
  `fecha_nacimiento` date NOT NULL,
  PRIMARY KEY (`id_cliente`),
  KEY `fk_cli_dir` (`id_direccion`),
  CONSTRAINT `fk_cli_dir` FOREIGN KEY (`id_direccion`) REFERENCES `direccion` (`id_direccion`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` VALUES (1,101,'Juan','Pérez','González','1990-01-15'),(2,102,'María','López','Hernández','1985-05-20'),(3,103,'Carlos','Sánchez','Ramírez','1988-09-12'),(4,104,'Ana','Torres','Martínez','1992-03-25'),(5,105,'Luis','Martínez','Cruz','1987-07-30'),(6,106,'Laura','García','Morales','1995-11-10'),(7,107,'José','Díaz','Fernández','1984-12-05'),(8,108,'Patricia','Jiménez','Vázquez','1993-02-18'),(9,109,'Francisco','Ramírez','Salazar','1986-06-22'),(10,110,'Jessica','Mendoza','Ortiz','1991-10-28'),(11,111,'David','Hernández','Ríos','1990-08-15'),(12,112,'Elena','Rojas','Núñez','1992-04-19'),(13,113,'Marco','Vega','Córdova','1989-01-30'),(14,114,'Cecilia','Cruz','Alvarado','1994-09-23'),(15,115,'Andrés','Reyes','Moreno','1985-10-12'),(16,116,'Sofía','Cárdenas','Aguilar','1990-02-27'),(17,117,'Diego','Martinez','Castillo','1993-03-14'),(18,118,'Verónica','Mora','Ramírez','1988-07-11'),(19,119,'Fernando','Soto','Zúñiga','1982-12-02'),(20,120,'Sandra','Rojas','Pérez','1991-11-15'),(21,121,'Alejandro','Torres','Vargas','1984-05-10'),(22,122,'Gabriela','González','Méndez','1995-08-20'),(23,123,'Jorge','Alvarez','Duarte','1983-01-25'),(24,124,'Mariana','Olivares','López','1994-02-22'),(25,125,'Hugo','Salinas','Nava','1989-07-28'),(26,126,'Diana','Reyes','Solís','1990-04-05'),(27,127,'Rafael','Maldonado','Cruz','1986-09-19'),(28,128,'Fernanda','Vega','Cisneros','1993-06-18'),(29,129,'Pablo','Cabrera','Morales','1991-12-27'),(30,130,'Lorena','Zamora','Salazar','1987-03-16'),(31,131,'Cristian','Salgado','Jiménez','1990-11-11'),(32,132,'Tania','Núñez','Cáceres','1995-08-30'),(33,133,'Julio','Ríos','Serrano','1984-02-03'),(34,134,'Camila','Soto','Hernández','1988-10-14'),(35,135,'Ricardo','Marín','Hernández','1992-05-21'),(36,136,'Susana','González','Madrigal','1990-06-02'),(37,137,'Esteban','Pineda','Cervantes','1985-01-17'),(38,138,'Carmen','Pérez','Mendoza','1993-02-11'),(39,139,'Oscar','Velasco','Riviera','1988-09-26'),(40,140,'Natalia','Paniagua','Salas','1990-04-24'),(41,141,'Raúl','Ibarra','Olivares','1986-03-15'),(42,142,'María','Rios','Martínez','1994-12-08'),(43,143,'Juliana','Mendoza','Hernández','1985-07-01'),(44,144,'Ricardo','Salinas','Aguilar','1987-11-20'),(45,145,'Vanessa','Pérez','Aragón','1992-08-18'),(46,146,'Manuel','Torres','Alva','1991-06-15'),(47,147,'Paulina','Zambrano','Cruz','1993-09-09'),(48,148,'Saúl','Vargas','Salgado','1994-01-23'),(49,149,'Emilia','Téllez','Martínez','1989-10-10'),(50,150,'Felipe','Pérez','Gómez','1986-02-07'),(51,151,'Fabiola','Hernández','Mendoza','1991-04-12'),(52,152,'Alfredo','Ortega','Vázquez','1993-11-05'),(53,153,'Verónica','Córdova','Peña','1988-05-16'),(54,154,'Luis','Aguilar','Cervantes','1990-07-04'),(55,155,'Adriana','Salazar','Serrano','1992-12-09'),(56,156,'Joaquín','Rios','Hernández','1984-03-14'),(57,157,'Patricia','Díaz','Cruz','1993-08-01'),(58,158,'Diego','Martínez','Arce','1989-11-10'),(59,159,'Sandra','González','Cano','1990-01-21'),(60,160,'Rosa','Mendoza','Pérez','1986-04-02'),(61,161,'Héctor','Castillo','Moreno','1991-05-29'),(62,162,'Marisol','Ortega','Aguilar','1994-06-17'),(63,163,'José','Jiménez','Cervantes','1985-07-22'),(64,164,'Gloria','Sánchez','Hernández','1988-08-12'),(65,165,'Jorge','Pérez','Gómez','1991-09-30'),(66,166,'Cristina','Flores','Salas','1992-02-23'),(67,167,'Felipe','Zamora','Martínez','1990-03-19'),(68,168,'Pilar','Rojas','Sánchez','1995-10-15'),(69,169,'Victor','Cruz','Aguilar','1987-11-07'),(70,170,'Fernando','Hernández','Serrano','1988-12-28'),(71,171,'Luisa','Díaz','Pérez','1984-01-09'),(72,172,'María','Salinas','Cáceres','1993-02-14'),(73,173,'Mario','Núñez','Olivares','1989-05-10'),(74,174,'Claudia','Ramírez','González','1991-03-11'),(75,175,'Ernesto','Mora','Duarte','1986-06-18'),(76,176,'Angélica','Vega','Ríos','1985-12-22'),(77,177,'Alba','Martínez','Hernández','1990-07-15'),(78,178,'Marco','Cabrera','Hernández','1988-02-20'),(79,179,'Nina','Alvarez','Peña','1991-10-30'),(80,180,'Rafael','García','Serrano','1986-11-18'),(81,181,'Laura','Soto','Martínez','1993-12-01'),(82,182,'Sergio','Duarte','Morales','1985-10-11'),(83,183,'Rosario','Zambrano','Núñez','1991-09-23'),(84,184,'Cristian','Flores','Cruz','1989-05-12'),(85,185,'Mónica','Rivas','Cervantes','1986-08-20'),(86,186,'Javier','González','Ríos','1993-04-24'),(87,187,'Carmen','Madrigal','Hernández','1984-03-30'),(88,188,'Gabriel','Salinas','Martínez','1990-05-17'),(89,189,'María','Pérez','Olivares','1991-01-01'),(90,190,'Ricardo','Martínez','Vázquez','1985-02-22'),(91,191,'Diana','Hernández','Córdova','1990-09-15'),(92,192,'Victor','Alvarez','González','1988-06-12'),(93,193,'Sofía','Morales','Sánchez','1994-11-10'),(94,194,'Alejandro','Rivas','Duarte','1989-07-29'),(95,195,'Paulina','González','Salazar','1993-12-30'),(96,196,'Santiago','López','García','1986-09-11'),(97,197,'Esteban','Pérez','Moreno','1985-05-25'),(98,198,'Natalia','Reyes','Hernández','1991-04-30'),(99,199,'Arturo','Cabrera','Aguilar','1988-02-13'),(100,200,'Verónica','Salinas','Martínez','1989-10-22');
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `direccion`
--

DROP TABLE IF EXISTS `direccion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `direccion` (
  `id_direccion` smallint unsigned NOT NULL AUTO_INCREMENT,
  `id_municipio` smallint unsigned NOT NULL,
  `calle` varchar(150) NOT NULL,
  `colonia` varchar(100) NOT NULL,
  `cp` char(5) NOT NULL,
  `numero_ext` varchar(10) NOT NULL,
  `numero_int` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id_direccion`),
  KEY `fk_dir_mun` (`id_municipio`),
  CONSTRAINT `fk_dir_mun` FOREIGN KEY (`id_municipio`) REFERENCES `municipio` (`id_municipio`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=223 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `direccion`
--

LOCK TABLES `direccion` WRITE;
/*!40000 ALTER TABLE `direccion` DISABLE KEYS */;
INSERT INTO `direccion` VALUES (1,1,'Av. Convención','Centro','20000','123','A'),(2,1,'Calle Zaragoza','Los Arcos','20010','45',NULL),(3,2,'Blvd. Díaz Ordaz','Playas','22010','900',NULL),(4,2,'Calle Madero','Centro','22015','150','B'),(5,3,'Malecón Costero','Centro','23000','78','1A'),(6,3,'Calle Forjadores','Miramar','23060','20',NULL),(7,4,'Calle 10','Centro','24000','250',NULL),(8,4,'Avenida Juárez','Carmen','24100','300','C'),(9,5,'Boulevard Belisario Domínguez','Centro','29000','678',NULL),(10,5,'Calle Real','San Cristóbal','29200','456',NULL),(11,6,'Avenida Universidad','Centro','31000','789','D'),(12,6,'Calle Libertad','Juárez','32000','34','5B'),(13,7,'Boulevard Venustiano Carranza','Saltillo Centro','25000','980',NULL),(14,7,'Calle Colón','Torreón Centro','27000','15','4C'),(15,8,'Avenida Tecnológico','Centro','28000','76',NULL),(16,8,'Calle Revolución','Manzanillo Centro','28200','89','A'),(17,9,'Avenida 20 de Noviembre','Centro','34000','567',NULL),(18,9,'Calle Independencia','Gómez Palacio','35000','111',NULL),(19,10,'Boulevard Aeropuerto','Centro','37000','222','B'),(20,10,'Calle Hidalgo','Irapuato Centro','36500','987',NULL),(21,11,'Avenida Cuauhtémoc','Centro','39300','333','D'),(22,11,'Calle Vicente Guerrero','Chilpancingo Centro','39000','654',NULL),(23,12,'Boulevard Felipe Ángeles','Centro','42000','12','B'),(24,12,'Calle 5 de Mayo','Tula Centro','42800','45','1C'),(25,13,'Avenida Vallarta','Zapopan Centro','45000','88',NULL),(26,13,'Calle López Mateos','Guadalajara Centro','44100','123','A'),(27,14,'Paseo Tollocan','Centro','50000','999',NULL),(28,14,'Avenida Central','Ecatepec Centro','55000','333','5B'),(29,15,'Calle Madero','Morelia Centro','58000','666','A'),(30,15,'Calle Lázaro Cárdenas','Uruapan Centro','60000','444',NULL),(31,16,'Boulevard Cuauhnáhuac','Centro','62000','100','2A'),(32,16,'Calle Plan de Ayala','Jiutepec Centro','62500','567',NULL),(33,17,'Calle Morelos','Centro','63000','213','C'),(34,17,'Avenida Insurgentes','Xalisco Centro','63100','345',NULL),(35,18,'Avenida Constitución','Monterrey Centro','64000','567','B'),(36,18,'Avenida Universidad','San Nicolás Centro','66400','678',NULL),(37,19,'Avenida Benito Juárez','Oaxaca Centro','68000','123','1D'),(38,19,'Calle Morelos','Salina Cruz Centro','70600','890',NULL),(39,20,'Boulevard 5 de Mayo','Puebla Centro','72000','345','C'),(40,20,'Calle Independencia','Tehuacán Centro','75700','567',NULL),(41,21,'Avenida Constituyentes','Querétaro Centro','76000','999',NULL),(42,21,'Calle Corregidora','San Juan del Río Centro','76800','111','B'),(43,22,'Boulevard Kukulkán','Centro','77500','222','C'),(44,22,'Calle Rafael E. Melgar','Cozumel Centro','77600','333',NULL),(45,23,'Avenida Carranza','San Luis Centro','78000','444','A'),(46,23,'Calle Hidalgo','Ciudad Valles Centro','79000','555',NULL),(47,24,'Boulevard Emiliano Zapata','Centro','80000','666',NULL),(48,24,'Calle Aquiles Serdán','Mazatlán Centro','82000','777','B'),(49,25,'Boulevard Luis Encinas','Hermosillo Centro','83000','888','D'),(50,25,'Calle Obregón','Nogales Centro','84000','999',NULL),(51,26,'Avenida Universidad','Villahermosa Centro','86000','100',NULL),(52,26,'Calle Hidalgo','Comalcalco Centro','86300','200','1B'),(53,27,'Boulevard Hidalgo','Reynosa Centro','88500','300','C'),(54,27,'Calle Sexta','Matamoros Centro','87400','400',NULL),(55,28,'Boulevard Revolución','Tlaxcala Centro','90000','500',NULL),(56,28,'Calle Benito Juárez','Apizaco Centro','90300','600','A'),(57,29,'Boulevard Ruiz Cortines','Veracruz Centro','91700','700','B'),(58,29,'Calle Morelos','Córdoba Centro','94500','800',NULL),(59,30,'Calle 60','Mérida Centro','97000','900','C'),(60,30,'Avenida Cancún','Valladolid Centro','97700','101','D'),(61,31,'Calle García Salinas','Zacatecas Centro','98000','102',NULL),(62,31,'Calle Morelos','Fresnillo Centro','99000','103','B'),(63,32,'Avenida Reforma','Centro','01000','104',NULL),(64,32,'Calle 16 de Septiembre','Xochimilco Centro','16000','105','A'),(65,1,'Calle 2 de Abril','Barrio Alto','20001','200','4'),(66,1,'Calle Venustiano Carranza','Centro','20002','150','B'),(67,2,'Calle Del Mar','Los Pinos','22011','12',NULL),(68,2,'Calle del Sol','La Playa','22012','23','5A'),(69,3,'Calle del Farero','Bello Horizonte','23001','45',NULL),(70,3,'Calle Coral','Los Arcos','23002','67','3'),(71,4,'Calle del Viento','La Esperanza','24001','89',NULL),(72,4,'Calle del Río','Las Flores','24002','90','2B'),(73,5,'Calle de la Paz','El Jardín','29001','12',NULL),(74,5,'Calle de los Santos','El Paraíso','29002','34','A'),(75,6,'Calle de la Libertad','Las Margaritas','31001','56','1C'),(76,6,'Calle de la Unión','Jardines','31002','78',NULL),(77,7,'Calle del Amor','San José','25001','90','5A'),(78,7,'Calle de los Héroes','Las Palmas','25002','100',NULL),(79,8,'Calle de la Independencia','Hacienda','28001','23','B'),(80,8,'Calle de los Ángeles','La Paz','28002','45',NULL),(81,9,'Calle de los Sueños','El Cielo','34001','34',NULL),(82,9,'Calle de los Olivos','Pradera','34002','56','4'),(83,10,'Calle de los Árboles','El Sol','37001','78',NULL),(84,10,'Calle de la Esperanza','Río Verde','37002','90','B'),(85,11,'Calle de los Músicos','Centro','39301','12','C'),(86,11,'Calle de la Luz','Los Ángeles','39302','45',NULL),(87,12,'Calle del Sol','La Luz','42001','67','3'),(88,12,'Calle de las Estrellas','Las Flores','42002','89',NULL),(89,13,'Calle de la Mariposa','Las Flores','45001','12',NULL),(90,13,'Calle de los Templos','El Centro','45002','34','2A'),(91,14,'Calle de las Palmas','El Paraíso','50001','56','1B'),(92,14,'Calle de la Libertad','Las Flores','50002','78',NULL),(93,15,'Calle de la Esperanza','Las Torres','58001','90','3'),(94,15,'Calle de los Cielos','Las Lomas','58002','12',NULL),(95,16,'Calle de la Fe','Las Flores','62001','34','5A'),(96,16,'Calle de los Ángeles','Los Jardines','62002','67',NULL),(97,17,'Calle de los Colores','Centro','63001','89',NULL),(98,17,'Calle de la Esperanza','Los Arcos','63002','12',NULL),(99,18,'Calle del Amanecer','Las Flores','64001','34','1A'),(100,18,'Calle de la Luna','Los Angeles','64002','56',NULL),(101,19,'Calle de la Vida','El Jardín','68001','78','2B'),(102,19,'Calle del Cielo','Centro','68002','90',NULL),(103,20,'Calle del Río','Las Flores','72001','12','C'),(104,20,'Calle de la Tierra','Los Bosques','72002','34',NULL),(105,21,'Calle de los Ríos','El Sol','76001','56',NULL),(106,21,'Calle de la Luz','Las Lomas','76002','78','1B'),(107,22,'Calle del Mar','Centro','77501','90',NULL),(108,22,'Calle de la Vida','Las Torres','77502','12',NULL),(109,23,'Calle de la Esperanza','El Jardín','78001','34','5A'),(110,23,'Calle de la Luz','Los Ángeles','78002','67',NULL),(111,24,'Calle del Sol','La Playa','80001','89','3'),(112,24,'Calle de los Ríos','Centro','80002','90',NULL),(113,25,'Calle de la Esperanza','Los Bosques','83001','12',NULL),(114,25,'Calle de la Tierra','Las Flores','83002','34',NULL),(115,26,'Calle del Río','Centro','86001','56',NULL),(116,26,'Calle de la Luz','Las Torres','86002','78','2A'),(117,27,'Calle del Sol','El Jardín','88501','90','3B'),(118,27,'Calle de los Ángeles','Las Flores','88502','12',NULL),(119,28,'Calle de los Ríos','Los Bosques','90001','34','4'),(120,28,'Calle de la Tierra','Centro','90002','56',NULL),(121,29,'Calle del Mar','El Sol','91701','78','1A'),(122,29,'Calle de la Luz','Las Flores','91702','90',NULL),(123,30,'Calle de los Ángeles','Centro','97001','12','B'),(124,30,'Calle de la Esperanza','Los Jardines','97002','34',NULL),(125,31,'Calle del Amanecer','El Cielo','98001','56',NULL),(126,31,'Calle de la Vida','Las Lomas','98002','78','1B'),(127,32,'Calle de los Templos','Centro','01001','90',NULL),(128,32,'Calle de las Mariposas','Las Torres','01002','12','C'),(129,1,'Calle del Alba','San Miguel','20003','13','1A'),(130,1,'Calle de las Rosas','El Paraíso','20004','25','2B'),(131,2,'Avenida del Parque','San Juan','22003','48','3C'),(132,2,'Calle de los Cedros','Vista Hermosa','22004','67',NULL),(133,3,'Boulevard del Mar','San Pedro','23003','89','4A'),(134,3,'Calle del Sol','Las Dunas','23004','90','5B'),(135,4,'Avenida de los Olivos','Los Jardines','24003','12','2C'),(136,4,'Calle de los Pinos','La Paz','24004','34',NULL),(137,5,'Calle del Bosque','El Mirador','29003','56','3A'),(138,5,'Calle del Arroyo','Colinas Verdes','29004','78',NULL),(139,6,'Calle de la Cascada','San Martín','31003','90','1B'),(140,6,'Calle de la Montaña','Altos de San Juan','31004','100',NULL),(141,7,'Calle de los Naranjos','El Rincón','25003','23','4A'),(142,7,'Calle de los Robles','Las Haciendas','25004','45',NULL),(143,8,'Calle de los Fresnos','Bosques de La Luna','28003','34','5B'),(144,8,'Calle del Sauce','Prados Verdes','28004','56',NULL),(145,9,'Avenida de la Colina','Colinas del Sol','34003','78','3C'),(146,9,'Calle del Horizonte','El Alba','34004','90',NULL),(147,10,'Calle del Amanecer','San Felipe','37003','12','1D'),(148,10,'Calle de las Estrellas','La Esperanza','37004','45',NULL),(149,11,'Calle del Río','Las Lomas','39303','67',NULL),(150,11,'Calle del Lago','Vistas del Bosque','39304','89',NULL),(151,12,'Calle de la Luna','Vista Hermosa','42003','23','2A'),(152,12,'Calle del Sol','Prados Verdes','42004','45',NULL),(153,13,'Calle de los Pinos','Altos del Río','45003','56',NULL),(154,13,'Calle de los Robles','Colinas del Sol','45004','78','3B'),(155,14,'Calle de los Naranjos','El Alba','50003','89',NULL),(156,14,'Calle de los Cedros','La Esperanza','50004','100','4C'),(157,15,'Calle del Mar','San Felipe','58003','12','5A'),(158,15,'Calle del Río','Prados del Sol','58004','34',NULL),(159,16,'Calle de los Robles','Colinas Verdes','62003','56','2A'),(160,16,'Calle de la Cascada','Vista Hermosa','62004','78',NULL),(161,17,'Calle del Bosque','Altos del Río','63003','90','3C'),(162,17,'Calle del Lago','Prados del Alba','63004','100',NULL),(163,18,'Calle del Sauce','Colinas del Sol','64003','23','1A'),(164,18,'Calle del Horizonte','San Felipe','64004','45',NULL),(165,19,'Calle de la Cascada','Vista del Río','68003','67','2B'),(166,19,'Calle del Sol','Prados del Mar','68004','89',NULL),(167,20,'Calle del Alba','El Alba','72003','12','5C'),(168,20,'Calle del Río','Vista Hermosa','72004','34',NULL),(169,21,'Calle de los Fresnos','Prados del Río','76003','56','4A'),(170,21,'Calle de los Cedros','Colinas del Sol','76004','78',NULL),(171,22,'Calle de los Robles','Altos del Mar','77503','90','1B'),(172,22,'Calle del Lago','San Felipe','77504','100',NULL),(173,23,'Calle del Horizonte','Vista del Río','78003','12',NULL),(174,23,'Calle del Sauce','Prados del Sol','78004','34','2C'),(175,24,'Calle del Alba','El Alba','80003','56',NULL),(176,24,'Calle de los Cedros','Vista Hermosa','80004','78','3A'),(177,25,'Calle del Bosque','San Felipe','83003','90',NULL),(178,25,'Calle del Lago','Prados del Mar','83004','100','4B'),(179,26,'Calle de los Naranjos','Vista del Río','86003','23',NULL),(180,26,'Calle del Río','Altos del Alba','86004','45','5A'),(181,27,'Calle de la Luna','San Felipe','88503','67',NULL),(182,27,'Calle del Sol','Prados Verdes','88504','89','3C'),(183,28,'Calle del Sauce','Vista Hermosa','90003','12','4B'),(184,28,'Calle del Alba','Altos del Río','90004','34',NULL),(185,29,'Calle del Lago','Colinas del Sol','91703','56','1C'),(186,29,'Calle del Horizonte','Prados del Mar','91704','78',NULL),(187,30,'Calle de los Cedros','El Alba','97003','90','2B'),(188,30,'Calle de los Naranjos','Vista Hermosa','97004','100',NULL),(189,31,'Calle del Sauce','Prados del Río','98003','12','4A'),(190,31,'Calle del Alba','Vista del Sol','98004','34',NULL),(191,32,'Calle de los Pinos','Altos del Alba','01003','56','1A'),(192,32,'Calle del Río','Prados del Río','01004','78',NULL),(193,1,'Calle del Arroyo','San Miguel','20005','101','1B'),(194,1,'Calle de los Pinos','Centro','20006','102',NULL),(195,2,'Avenida del Río','El Paraíso','22005','103','3C'),(196,2,'Calle del Horizonte','Los Jardines','22006','104',NULL),(197,3,'Calle del Alba','Las Haciendas','23005','105','4A'),(198,3,'Calle de los Cedros','Vista Hermosa','23006','106',NULL),(199,4,'Avenida del Sol','El Jardín','24005','107','2B'),(200,4,'Calle del Bosque','La Esperanza','24006','108',NULL),(201,5,'Calle de los Naranjos','Altos del Río','29005','109','3C'),(202,5,'Calle de los Robles','Prados Verdes','29006','110',NULL),(203,6,'Calle de los Fresnos','San Martín','31005','111','1D'),(204,6,'Calle del Río','Las Lomas','31006','112',NULL),(205,7,'Calle del Sauce','El Alba','25005','113','5A'),(206,7,'Calle del Lago','Prados del Sol','25006','114',NULL),(207,8,'Calle del Horizonte','Colinas del Sol','28005','115','4B'),(208,8,'Calle del Arroyo','Vista del Río','28006','116',NULL),(209,9,'Calle de los Pinos','San Felipe','34005','117','1C'),(210,9,'Calle del Sol','Altos del Alba','34006','118',NULL),(211,10,'Calle del Alba','Prados del Río','37005','119','2A'),(212,10,'Calle del Bosque','Vista Hermosa','37006','120',NULL),(213,11,'Calle del Río','El Paraíso','39305','121','3B'),(214,11,'Calle del Horizonte','Altos del Río','39306','122',NULL),(215,12,'Calle de los Naranjos','Las Flores','42005','123','4C'),(216,12,'Calle de los Robles','El Jardín','42006','124',NULL),(217,13,'Calle del Sauce','San Felipe','45005','125','2B'),(218,13,'Calle del Lago','La Esperanza','45006','126',NULL),(219,14,'Calle del Horizonte','Vista del Sol','50005','127','3C'),(220,14,'Calle del Arroyo','El Alba','50006','128',NULL),(221,15,'Calle del Bosque','Altos del Río','58005','129','1D'),(222,15,'Calle del Río','Prados del Río','58006','130',NULL);
/*!40000 ALTER TABLE `direccion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `empleado`
--

DROP TABLE IF EXISTS `empleado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `empleado` (
  `id_empleado` smallint unsigned NOT NULL AUTO_INCREMENT,
  `id_sucursal` smallint unsigned NOT NULL,
  `fecha_ingreso` date NOT NULL,
  PRIMARY KEY (`id_empleado`),
  KEY `fk_em_suc` (`id_sucursal`),
  CONSTRAINT `fk_em_suc` FOREIGN KEY (`id_sucursal`) REFERENCES `sucursal` (`id_sucursal`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empleado`
--

LOCK TABLES `empleado` WRITE;
/*!40000 ALTER TABLE `empleado` DISABLE KEYS */;
INSERT INTO `empleado` VALUES (1,1,'2022-01-01'),(2,1,'2022-01-15'),(3,2,'2022-02-01'),(4,2,'2022-02-10'),(5,3,'2022-03-01'),(6,3,'2022-03-15'),(7,4,'2022-04-01'),(8,4,'2022-04-10'),(9,5,'2022-05-01'),(10,5,'2022-05-15'),(11,6,'2022-06-01'),(12,6,'2022-06-10'),(13,7,'2022-07-01'),(14,7,'2022-07-15'),(15,8,'2022-08-01'),(16,8,'2022-08-10'),(17,9,'2022-09-01'),(18,9,'2022-09-15'),(19,10,'2022-10-01'),(20,10,'2022-10-10'),(21,11,'2022-11-01'),(22,11,'2022-11-15'),(23,12,'2022-12-01'),(24,12,'2022-12-10'),(25,13,'2022-01-02'),(26,13,'2022-01-16'),(27,14,'2022-02-02'),(28,14,'2022-02-11'),(29,15,'2022-03-02'),(30,15,'2022-03-16'),(31,16,'2022-04-02'),(32,16,'2022-04-11'),(33,17,'2022-05-02'),(34,17,'2022-05-16'),(35,18,'2022-06-02'),(36,18,'2022-06-11'),(37,19,'2022-07-02'),(38,19,'2022-07-16'),(39,20,'2022-08-02'),(40,20,'2022-08-11'),(41,21,'2022-09-02'),(42,21,'2022-09-16'),(43,22,'2022-10-02'),(44,22,'2022-10-11'),(45,23,'2022-11-02'),(46,23,'2022-11-16'),(47,24,'2022-12-02'),(48,24,'2022-12-11'),(49,25,'2022-01-03'),(50,25,'2022-01-17'),(51,26,'2022-02-03'),(52,26,'2022-02-12'),(53,27,'2022-03-03'),(54,27,'2022-03-17'),(55,28,'2022-04-03'),(56,28,'2022-04-12'),(57,29,'2022-05-03'),(58,29,'2022-05-17'),(59,30,'2022-06-03'),(60,30,'2022-06-12'),(61,31,'2022-07-03'),(62,31,'2022-07-17'),(63,32,'2022-08-03'),(64,32,'2022-08-12'),(65,33,'2022-09-03'),(66,33,'2022-09-17'),(67,34,'2022-10-03'),(68,34,'2022-10-12'),(69,35,'2022-11-03'),(70,35,'2022-11-17'),(71,36,'2022-12-03'),(72,36,'2022-12-12'),(73,37,'2022-01-04'),(74,37,'2022-01-18'),(75,38,'2022-02-04'),(76,38,'2022-02-13'),(77,39,'2022-03-04'),(78,39,'2022-03-18'),(79,40,'2022-04-04'),(80,40,'2022-04-13'),(81,41,'2022-05-04'),(82,41,'2022-05-18'),(83,42,'2022-06-04'),(84,42,'2022-06-13'),(85,43,'2022-07-04'),(86,43,'2022-07-18'),(87,44,'2022-08-04'),(88,44,'2022-08-13'),(89,45,'2022-09-04'),(90,45,'2022-09-18'),(91,46,'2022-10-04'),(92,46,'2022-10-13'),(93,47,'2022-11-04'),(94,47,'2022-11-18'),(95,48,'2022-12-04'),(96,48,'2022-12-13'),(97,49,'2022-01-05'),(98,49,'2022-01-19'),(99,50,'2022-02-05'),(100,50,'2022-02-14');
/*!40000 ALTER TABLE `empleado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estado`
--

DROP TABLE IF EXISTS `estado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `estado` (
  `id_estado` smallint unsigned NOT NULL AUTO_INCREMENT,
  `estado` varchar(100) NOT NULL,
  PRIMARY KEY (`id_estado`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estado`
--

LOCK TABLES `estado` WRITE;
/*!40000 ALTER TABLE `estado` DISABLE KEYS */;
INSERT INTO `estado` VALUES (1,'Aguascalientes'),(2,'Baja California'),(3,'Baja California Sur'),(4,'Campeche'),(5,'Chiapas'),(6,'Chihuahua'),(7,'Coahuila'),(8,'Colima'),(9,'Durango'),(10,'Guanajuato'),(11,'Guerrero'),(12,'Hidalgo'),(13,'Jalisco'),(14,'México'),(15,'Michoacán'),(16,'Morelos'),(17,'Nayarit'),(18,'Nuevo León'),(19,'Oaxaca'),(20,'Puebla'),(21,'Querétaro'),(22,'Quintana Roo'),(23,'San Luis Potosí'),(24,'Sinaloa'),(25,'Sonora'),(26,'Tabasco'),(27,'Tamaulipas'),(28,'Tlaxcala'),(29,'Veracruz'),(30,'Yucatán'),(31,'Zacatecas'),(32,'Ciudad de México');
/*!40000 ALTER TABLE `estado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `marca`
--

DROP TABLE IF EXISTS `marca`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `marca` (
  `id_marca` smallint unsigned NOT NULL AUTO_INCREMENT,
  `marca` varchar(50) NOT NULL,
  PRIMARY KEY (`id_marca`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `marca`
--

LOCK TABLES `marca` WRITE;
/*!40000 ALTER TABLE `marca` DISABLE KEYS */;
INSERT INTO `marca` VALUES (1,'Chrysler'),(2,'Isuzu'),(3,'Oldsmobile'),(4,'Dodge'),(5,'Saab'),(6,'Mercury'),(7,'Chevrolet'),(8,'Aston Martin'),(9,'Ford'),(10,'Land Rover'),(11,'Subaru'),(12,'Daewoo'),(13,'BMW'),(14,'Maserati'),(15,'Pontiac'),(16,'Mazda'),(17,'Honda'),(18,'Toyota'),(19,'Porsche'),(20,'Volvo'),(21,'Cadillac'),(22,'Spyker'),(23,'Lotus'),(24,'Lincoln'),(25,'Volkswagen'),(26,'Audi'),(27,'Rolls-Royce'),(28,'Lexus'),(29,'Acura'),(30,'Mercedes-Benz'),(31,'Jaguar'),(32,'Nissan'),(33,'Lamborghini'),(34,'MINI'),(35,'Bentley'),(36,'GMC'),(37,'Mitsubishi'),(38,'Maybach'),(39,'Buick'),(40,'Jeep'),(41,'Infiniti'),(42,'Hummer');
/*!40000 ALTER TABLE `marca` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `modelo`
--

DROP TABLE IF EXISTS `modelo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `modelo` (
  `id_modelo` smallint unsigned NOT NULL AUTO_INCREMENT,
  `modelo` varchar(50) NOT NULL,
  PRIMARY KEY (`id_modelo`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `modelo`
--

LOCK TABLES `modelo` WRITE;
/*!40000 ALTER TABLE `modelo` DISABLE KEYS */;
INSERT INTO `modelo` VALUES (1,'Town & Country'),(2,'i-Series'),(3,'Voyager'),(4,'Bravada'),(5,'Ram 2500 Club'),(6,'900'),(7,'Villager'),(8,'Camaro'),(9,'DBS'),(10,'Lumina APV'),(11,'Equinox'),(12,'Explorer'),(13,'Range Rover'),(14,'SVX'),(15,'Nubira'),(16,'525'),(17,'M3'),(18,'Biturbo'),(19,'6000'),(20,'B-Series'),(21,'3 Series'),(22,'Miata MX-5'),(23,'F-Series Super Duty'),(24,'Accord'),(25,'Camry'),(26,'Mustang'),(27,'Boxster'),(28,'S80'),(29,'HHR'),(30,'Expedition'),(31,'DB9'),(32,'Escalade EXT'),(33,'Avalon'),(34,'Explorer Sport'),(35,'F150'),(36,'Taurus'),(37,'Spirit'),(38,'Flex'),(39,'F-Series'),(40,'Celica'),(41,'C8'),(42,'Express 3500'),(43,'Silhouette'),(44,'Land Cruiser'),(45,'Exige'),(46,'Venture'),(47,'Camry Solara'),(48,'Cavalier'),(49,'Forester'),(50,'Continental'),(51,'Elan'),(52,'GTI'),(53,'5000S'),(54,'Phantom'),(55,'Sienna'),(56,'Ram 3500'),(57,'CX-7'),(58,'LS'),(59,'Mazdaspeed6'),(60,'Sequoia'),(61,'RL'),(62,'S-Class'),(63,'S-Type'),(64,'Cruze'),(65,'745'),(66,'100'),(67,'Lanos'),(68,'Impreza'),(69,'Corolla'),(70,'Firebird'),(71,'Ram 2500'),(72,'Sentra'),(73,'Beretta'),(74,'V8 Vantage'),(75,'Gallardo'),(76,'Countryman'),(77,'Continental GT'),(78,'Z8'),(79,'DTS'),(80,'Frontier'),(81,'Sonoma Club Coupe'),(82,'G-Series 2500'),(83,'G-Series G20'),(84,'Rodeo'),(85,'MX-5'),(86,'Pajero'),(87,'Trooper'),(88,'S2000'),(89,'62'),(90,'Altima'),(91,'Regal'),(92,'Sable'),(93,'Wrangler'),(94,'Tiguan'),(95,'Ascender'),(96,'M'),(97,'R32'),(98,'430'),(99,'CR-V'),(100,'H1');
/*!40000 ALTER TABLE `modelo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `municipio`
--

DROP TABLE IF EXISTS `municipio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `municipio` (
  `id_municipio` smallint unsigned NOT NULL AUTO_INCREMENT,
  `id_estado` smallint unsigned NOT NULL,
  `municipio` varchar(100) NOT NULL,
  PRIMARY KEY (`id_municipio`),
  KEY `fk_mun_edo` (`id_estado`),
  CONSTRAINT `fk_mun_edo` FOREIGN KEY (`id_estado`) REFERENCES `estado` (`id_estado`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `municipio`
--

LOCK TABLES `municipio` WRITE;
/*!40000 ALTER TABLE `municipio` DISABLE KEYS */;
INSERT INTO `municipio` VALUES (1,1,'Aguascalientes'),(2,1,'Calvillo'),(3,2,'Tijuana'),(4,2,'Mexicali'),(5,3,'La Paz'),(6,3,'Los Cabos'),(7,4,'Campeche'),(8,4,'Carmen'),(9,5,'Tuxtla Gutiérrez'),(10,5,'San Cristóbal de las Casas'),(11,6,'Chihuahua'),(12,6,'Juárez'),(13,7,'Saltillo'),(14,7,'Torreón'),(15,8,'Colima'),(16,8,'Manzanillo'),(17,9,'Durango'),(18,9,'Gómez Palacio'),(19,10,'León'),(20,10,'Irapuato'),(21,11,'Acapulco'),(22,11,'Chilpancingo'),(23,12,'Pachuca'),(24,12,'Tula de Allende'),(25,13,'Guadalajara'),(26,13,'Zapopan'),(27,14,'Toluca'),(28,14,'Ecatepec de Morelos'),(29,15,'Morelia'),(30,15,'Uruapan'),(31,16,'Cuernavaca'),(32,16,'Jiutepec'),(33,17,'Tepic'),(34,17,'Xalisco'),(35,18,'Monterrey'),(36,18,'San Nicolás de los Garza'),(37,19,'Oaxaca de Juárez'),(38,19,'Salina Cruz'),(39,20,'Puebla'),(40,20,'Tehuacán'),(41,21,'Santiago de Querétaro'),(42,21,'San Juan del Río'),(43,22,'Cancún'),(44,22,'Cozumel'),(45,23,'San Luis Potosí'),(46,23,'Ciudad Valles'),(47,24,'Culiacán'),(48,24,'Mazatlán'),(49,25,'Hermosillo'),(50,25,'Nogales'),(51,26,'Villahermosa'),(52,26,'Comalcalco'),(53,27,'Reynosa'),(54,27,'Matamoros'),(55,28,'Tlaxcala'),(56,28,'Apizaco'),(57,29,'Veracruz'),(58,29,'Córdoba'),(59,30,'Mérida'),(60,30,'Valladolid'),(61,31,'Zacatecas'),(62,31,'Fresnillo'),(63,32,'Ciudad de México'),(64,32,'Xochimilco'),(65,1,'Jesús María'),(66,2,'Ensenada'),(67,3,'Mulegé'),(68,4,'Champotón'),(69,5,'Tapachula'),(70,6,'Delicias'),(71,7,'Piedras Negras'),(72,8,'Tecomán'),(73,9,'Nuevo Ideal'),(74,10,'Salamanca'),(75,11,'Zihuatanejo'),(76,12,'Mineral de la Reforma'),(77,13,'Tlaquepaque'),(78,14,'Naucalpan de Juárez'),(79,15,'Zamora'),(80,16,'Cuautla'),(81,17,'Santiago Ixcuintla'),(82,18,'Guadalupe'),(83,19,'Tehuantepec'),(84,20,'Atlixco'),(85,21,'El Marqués'),(86,22,'Tulum'),(87,23,'Soledad de Graciano Sánchez'),(88,24,'Guasave'),(89,25,'San Luis Río Colorado'),(90,26,'Tenosique'),(91,27,'Nuevo Laredo'),(92,28,'Huamantla'),(93,29,'Coatzacoalcos'),(94,30,'Tizimín'),(95,31,'Jerez'),(96,32,'Iztapalapa'),(97,1,'Pabellón de Arteaga'),(98,2,'Rosarito'),(99,3,'Loreto'),(100,4,'Hecelchakán');
/*!40000 ALTER TABLE `municipio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `premio`
--

DROP TABLE IF EXISTS `premio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `premio` (
  `id_premio` smallint unsigned NOT NULL AUTO_INCREMENT,
  `id_empleado` smallint unsigned NOT NULL,
  `fecha` date NOT NULL,
  `monto` decimal(10,2) NOT NULL DEFAULT '1000.00',
  PRIMARY KEY (`id_premio`),
  UNIQUE KEY `id_empleado` (`id_empleado`),
  CONSTRAINT `fk_pr_em` FOREIGN KEY (`id_empleado`) REFERENCES `empleado` (`id_empleado`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `premio`
--

LOCK TABLES `premio` WRITE;
/*!40000 ALTER TABLE `premio` DISABLE KEYS */;
INSERT INTO `premio` VALUES (1,1,'2022-02-01',1500.00),(2,2,'2022-03-05',1200.00),(3,3,'2022-04-10',2000.00),(4,5,'2022-05-15',1800.00),(5,6,'2022-06-20',1300.00),(6,7,'2022-07-25',1700.00),(7,10,'2022-08-30',1600.00),(8,11,'2022-09-04',1400.00),(9,12,'2022-10-15',2200.00),(10,14,'2022-11-01',1100.00),(11,15,'2022-12-10',1900.00),(12,17,'2022-01-20',1250.00),(13,19,'2022-02-25',1550.00),(14,20,'2022-03-30',1450.00),(15,21,'2022-04-14',1350.00),(16,22,'2022-05-21',1750.00),(17,24,'2022-06-05',1500.00),(18,25,'2022-07-18',1150.00),(19,27,'2022-08-11',1650.00),(20,29,'2022-09-22',2050.00),(21,30,'2022-10-12',2250.00),(22,32,'2022-11-03',2150.00),(23,34,'2022-12-14',1300.00),(24,35,'2022-01-05',1400.00),(25,37,'2022-02-20',1500.00),(26,38,'2022-03-15',1600.00),(27,41,'2022-04-17',1800.00),(28,42,'2022-05-22',1900.00),(29,43,'2022-06-13',1100.00),(30,45,'2022-07-09',1350.00),(31,46,'2022-08-01',1450.00),(32,49,'2022-09-05',1550.00),(33,50,'2022-10-18',1250.00);
/*!40000 ALTER TABLE `premio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sucursal`
--

DROP TABLE IF EXISTS `sucursal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sucursal` (
  `id_sucursal` smallint unsigned NOT NULL AUTO_INCREMENT,
  `nombre_sucursal` varchar(100) NOT NULL,
  PRIMARY KEY (`id_sucursal`),
  UNIQUE KEY `nombre_sucursal` (`nombre_sucursal`),
  CONSTRAINT `fk_suc_dir` FOREIGN KEY (`id_sucursal`) REFERENCES `direccion` (`id_direccion`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sucursal`
--

LOCK TABLES `sucursal` WRITE;
/*!40000 ALTER TABLE `sucursal` DISABLE KEYS */;
INSERT INTO `sucursal` VALUES (21,'Sucursal Acapulco Centro'),(1,'Sucursal Aguascalientes Centro'),(2,'Sucursal Aguascalientes Sur'),(56,'Sucursal Apizaco Norte'),(89,'Sucursal Atlixco Centro'),(66,'Sucursal Calvillo Norte'),(7,'Sucursal Campeche Centro'),(8,'Sucursal Campeche Norte'),(43,'Sucursal Cancún Centro'),(71,'Sucursal Carmen Centro'),(72,'Sucursal Champotón Sur'),(11,'Sucursal Chihuahua Centro'),(12,'Sucursal Chihuahua Norte'),(22,'Sucursal Chilpancingo Norte'),(63,'Sucursal Ciudad de México Centro'),(46,'Sucursal Ciudad Valles Sur'),(98,'Sucursal Coatzacoalcos Norte'),(15,'Sucursal Colima Centro'),(52,'Sucursal Comalcalco Norte'),(58,'Sucursal Córdoba Norte'),(44,'Sucursal Cozumel Norte'),(85,'Sucursal Cuautla Centro'),(31,'Sucursal Cuernavaca Centro'),(47,'Sucursal Culiacán Centro'),(75,'Sucursal Delicias Centro'),(17,'Sucursal Durango Centro'),(28,'Sucursal Ecatepec Norte'),(90,'Sucursal El Marqués Sur'),(67,'Sucursal Ensenada Centro'),(62,'Sucursal Fresnillo Norte'),(18,'Sucursal Gómez Palacio Sur'),(25,'Sucursal Guadalajara Centro'),(87,'Sucursal Guadalupe Centro'),(93,'Sucursal Guasave Centro'),(49,'Sucursal Hermosillo Centro'),(97,'Sucursal Huamantla Centro'),(20,'Sucursal Irapuato Norte'),(100,'Sucursal Jerez Norte'),(65,'Sucursal Jesús María Centro'),(32,'Sucursal Jiutepec Norte'),(76,'Sucursal Juárez Norte'),(5,'Sucursal La Paz Centro'),(6,'Sucursal La Paz Sur'),(19,'Sucursal León Centro'),(70,'Sucursal Los Cabos Norte'),(16,'Sucursal Manzanillo Sur'),(54,'Sucursal Matamoros Sur'),(48,'Sucursal Mazatlán Norte'),(59,'Sucursal Mérida Centro'),(68,'Sucursal Mexicali Norte'),(81,'Sucursal Mineral de la Reforma Centro'),(35,'Sucursal Monterrey Centro'),(29,'Sucursal Morelia Centro'),(69,'Sucursal Mulegé Centro'),(83,'Sucursal Naucalpan de Juárez Centro'),(50,'Sucursal Nogales Sur'),(96,'Sucursal Nuevo Laredo Norte'),(37,'Sucursal Oaxaca de Juárez Centro'),(23,'Sucursal Pachuca Centro'),(77,'Sucursal Piedras Negras Centro'),(39,'Sucursal Puebla Centro'),(53,'Sucursal Reynosa Centro'),(79,'Sucursal Salamanca Centro'),(38,'Sucursal Salina Cruz Sur'),(13,'Sucursal Saltillo Centro'),(74,'Sucursal San Cristóbal de las Casas Norte'),(42,'Sucursal San Juan del Río Sur'),(45,'Sucursal San Luis Potosí Centro'),(94,'Sucursal San Luis Río Colorado Sur'),(36,'Sucursal San Nicolás Norte'),(41,'Sucursal Santiago de Querétaro Centro'),(86,'Sucursal Santiago Ixcuintla Sur'),(92,'Sucursal Soledad de Graciano Sánchez Norte'),(73,'Sucursal Tapachula Centro'),(40,'Sucursal Tehuacán Norte'),(88,'Sucursal Tehuantepec Norte'),(95,'Sucursal Tenosique Centro'),(33,'Sucursal Tepic Centro'),(3,'Sucursal Tijuana Centro'),(4,'Sucursal Tijuana Norte'),(99,'Sucursal Tizimín Centro'),(82,'Sucursal Tlaquepaque Sur'),(55,'Sucursal Tlaxcala Centro'),(27,'Sucursal Toluca Centro'),(14,'Sucursal Torreón Norte'),(78,'Sucursal Torreón Sur'),(24,'Sucursal Tula de Allende Sur'),(91,'Sucursal Tulum Centro'),(9,'Sucursal Tuxtla Gutiérrez Centro'),(10,'Sucursal Tuxtla Gutiérrez Sur'),(30,'Sucursal Uruapan Sur'),(60,'Sucursal Valladolid Sur'),(57,'Sucursal Veracruz Centro'),(51,'Sucursal Villahermosa Centro'),(34,'Sucursal Xalisco Sur'),(64,'Sucursal Xochimilco Sur'),(61,'Sucursal Zacatecas Centro'),(84,'Sucursal Zamora Norte'),(26,'Sucursal Zapopan Norte'),(80,'Sucursal Zihuatanejo Norte');
/*!40000 ALTER TABLE `sucursal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ventas`
--

DROP TABLE IF EXISTS `ventas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ventas` (
  `id_venta` smallint unsigned NOT NULL AUTO_INCREMENT,
  `id_cliente` smallint unsigned NOT NULL,
  `id_empleado` smallint unsigned NOT NULL,
  `fecha` timestamp NOT NULL,
  PRIMARY KEY (`id_venta`),
  UNIQUE KEY `id_cliente` (`id_cliente`,`id_empleado`,`fecha`),
  KEY `fk_vent_em` (`id_empleado`),
  CONSTRAINT `fk_ven_cli` FOREIGN KEY (`id_cliente`) REFERENCES `cliente` (`id_cliente`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `fk_vent_em` FOREIGN KEY (`id_empleado`) REFERENCES `empleado` (`id_empleado`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ventas`
--

LOCK TABLES `ventas` WRITE;
/*!40000 ALTER TABLE `ventas` DISABLE KEYS */;
INSERT INTO `ventas` VALUES (1,1,1,'2022-01-05 06:00:00'),(2,1,2,'2022-01-10 06:00:00'),(65,1,3,'2022-09-05 06:00:00'),(66,1,4,'2022-09-10 06:00:00'),(3,2,3,'2022-02-15 06:00:00'),(4,2,4,'2022-02-20 06:00:00'),(67,2,5,'2022-10-15 06:00:00'),(68,2,6,'2022-10-20 06:00:00'),(5,3,5,'2022-03-25 06:00:00'),(6,3,6,'2022-03-30 06:00:00'),(69,3,7,'2022-11-25 06:00:00'),(70,3,8,'2022-11-30 06:00:00'),(7,4,7,'2022-04-05 06:00:00'),(8,4,8,'2022-04-10 06:00:00'),(71,4,9,'2022-12-05 06:00:00'),(72,4,10,'2022-12-10 06:00:00'),(9,5,9,'2022-05-15 06:00:00'),(10,5,10,'2022-05-20 06:00:00'),(73,5,11,'2022-01-05 06:00:00'),(74,5,12,'2022-01-10 06:00:00'),(11,6,11,'2022-06-25 06:00:00'),(12,6,12,'2022-06-30 06:00:00'),(75,6,13,'2022-02-15 06:00:00'),(76,6,14,'2022-02-20 06:00:00'),(13,7,13,'2022-07-15 06:00:00'),(14,7,14,'2022-07-20 06:00:00'),(77,7,15,'2022-03-25 06:00:00'),(78,7,16,'2022-03-30 06:00:00'),(15,8,15,'2022-08-25 06:00:00'),(16,8,16,'2022-08-30 06:00:00'),(79,8,17,'2022-04-05 06:00:00'),(80,8,18,'2022-04-10 06:00:00'),(17,9,17,'2022-09-05 06:00:00'),(18,9,18,'2022-09-10 06:00:00'),(81,9,19,'2022-05-15 06:00:00'),(82,9,20,'2022-05-20 06:00:00'),(19,10,19,'2022-10-15 06:00:00'),(20,10,20,'2022-10-20 06:00:00'),(83,10,21,'2022-06-25 06:00:00'),(84,10,22,'2022-06-30 06:00:00'),(21,11,21,'2022-11-25 06:00:00'),(22,11,22,'2022-11-30 06:00:00'),(85,11,23,'2022-07-15 06:00:00'),(86,11,24,'2022-07-20 06:00:00'),(23,12,23,'2022-12-05 06:00:00'),(24,12,24,'2022-12-10 06:00:00'),(87,12,25,'2022-08-25 06:00:00'),(88,12,26,'2022-08-30 06:00:00'),(25,13,25,'2022-01-05 06:00:00'),(26,13,26,'2022-01-10 06:00:00'),(89,13,27,'2022-09-05 06:00:00'),(90,13,28,'2022-09-10 06:00:00'),(27,14,27,'2022-02-15 06:00:00'),(28,14,28,'2022-02-20 06:00:00'),(91,14,29,'2022-10-15 06:00:00'),(92,14,30,'2022-10-20 06:00:00'),(29,15,29,'2022-03-25 06:00:00'),(30,15,30,'2022-03-30 06:00:00'),(93,15,31,'2022-11-25 06:00:00'),(94,15,32,'2022-11-30 06:00:00'),(95,16,1,'2022-12-05 06:00:00'),(96,16,2,'2022-12-10 06:00:00'),(31,16,31,'2022-04-05 06:00:00'),(32,16,32,'2022-04-10 06:00:00'),(33,17,1,'2022-05-15 06:00:00'),(34,17,2,'2022-05-20 06:00:00'),(97,17,3,'2022-01-05 06:00:00'),(98,17,4,'2022-01-10 06:00:00'),(35,18,3,'2022-06-25 06:00:00'),(36,18,4,'2022-06-30 06:00:00'),(99,18,5,'2022-02-15 06:00:00'),(100,18,6,'2022-02-20 06:00:00'),(37,19,5,'2022-07-15 06:00:00'),(38,19,6,'2022-07-20 06:00:00'),(39,20,7,'2022-08-25 06:00:00'),(40,20,8,'2022-08-30 06:00:00'),(41,21,9,'2022-09-05 06:00:00'),(42,21,10,'2022-09-10 06:00:00'),(43,22,11,'2022-10-15 06:00:00'),(44,22,12,'2022-10-20 06:00:00'),(45,23,13,'2022-11-25 06:00:00'),(46,23,14,'2022-11-30 06:00:00'),(47,24,15,'2022-12-05 06:00:00'),(48,24,16,'2022-12-10 06:00:00'),(49,25,17,'2022-01-05 06:00:00'),(50,25,18,'2022-01-10 06:00:00'),(51,26,19,'2022-02-15 06:00:00'),(52,26,20,'2022-02-20 06:00:00'),(53,27,21,'2022-03-25 06:00:00'),(54,27,22,'2022-03-30 06:00:00'),(55,28,23,'2022-04-05 06:00:00'),(56,28,24,'2022-04-10 06:00:00'),(57,29,25,'2022-05-15 06:00:00'),(58,29,26,'2022-05-20 06:00:00'),(59,30,27,'2022-06-25 06:00:00'),(60,30,28,'2022-06-30 06:00:00'),(61,31,29,'2022-07-15 06:00:00'),(62,31,30,'2022-07-20 06:00:00'),(63,32,31,'2022-08-25 06:00:00'),(64,32,32,'2022-08-30 06:00:00');
/*!40000 ALTER TABLE `ventas` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-11-30 19:07:13
