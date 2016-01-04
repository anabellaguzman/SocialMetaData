CREATE DATABASE  IF NOT EXISTS `socialdata` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `socialdata`;
-- MySQL dump 10.13  Distrib 5.6.22, for osx10.8 (x86_64)
--
-- Host: localhost    Database: socialdata
-- ------------------------------------------------------
-- Server version	5.6.25

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `atributoitem`
--

DROP TABLE IF EXISTS `atributoitem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `atributoitem` (
  `idAtributoItem` int(11) NOT NULL AUTO_INCREMENT,
  `idTipoItem` int(11) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  PRIMARY KEY (`idAtributoItem`),
  KEY `idTipoItem` (`idTipoItem`),
  CONSTRAINT `idTipoItem` FOREIGN KEY (`idTipoItem`) REFERENCES `tipoitem` (`idTipoItem`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `atributoitem`
--

LOCK TABLES `atributoitem` WRITE;
/*!40000 ALTER TABLE `atributoitem` DISABLE KEYS */;
INSERT INTO `atributoitem` VALUES (1,1,'ISBN'),(2,1,'Editorial'),(3,3,'Minutos'),(4,2,'ISSN'),(5,2,'Numero de serie'),(6,2,'Editorial');
/*!40000 ALTER TABLE `atributoitem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `autor`
--

DROP TABLE IF EXISTS `autor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `autor` (
  `idAutor` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  `apellido` varchar(45) NOT NULL,
  PRIMARY KEY (`idAutor`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `autor`
--

LOCK TABLES `autor` WRITE;
/*!40000 ALTER TABLE `autor` DISABLE KEYS */;
INSERT INTO `autor` VALUES (1,'Daniel','Goleman'),(2,'Paulo ','Coelho'),(3,'Jorge','Rial'),(4,'Josep','Artigas-Pallares'),(5,'Juan','Narbona'),(6,'Rhonda','Byrne');
/*!40000 ALTER TABLE `autor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `idioma`
--

DROP TABLE IF EXISTS `idioma`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `idioma` (
  `idIdioma` int(11) NOT NULL AUTO_INCREMENT,
  `idioma` varchar(45) NOT NULL,
  PRIMARY KEY (`idIdioma`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `idioma`
--

LOCK TABLES `idioma` WRITE;
/*!40000 ALTER TABLE `idioma` DISABLE KEYS */;
INSERT INTO `idioma` VALUES (1,'Español'),(2,'Inglés'),(3,'Portugués');
/*!40000 ALTER TABLE `idioma` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `item`
--

DROP TABLE IF EXISTS `item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `item` (
  `idItem` int(11) NOT NULL AUTO_INCREMENT,
  `titulo` varchar(45) NOT NULL,
  `año` year(4) NOT NULL,
  `puntaje` decimal(2,0) DEFAULT NULL,
  `cantidadVotos` int(11) DEFAULT '0',
  `imagen` varchar(100) DEFAULT NULL,
  `descripcion` varchar(5000) DEFAULT NULL,
  `idioma` int(11) NOT NULL,
  `tipo` int(11) NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `creator` int(11) NOT NULL,
  PRIMARY KEY (`idItem`),
  KEY `fk_Libro_Idioma_idx` (`idioma`),
  KEY `tipo` (`tipo`),
  KEY `item_creator` (`creator`),
  CONSTRAINT `fk_Libro_Idioma` FOREIGN KEY (`idioma`) REFERENCES `idioma` (`idIdioma`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_item_creator` FOREIGN KEY (`creator`) REFERENCES `usuario` (`idUsuario`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `tipo` FOREIGN KEY (`tipo`) REFERENCES `tipoitem` (`idTipoItem`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item`
--

LOCK TABLES `item` WRITE;
/*!40000 ALTER TABLE `item` DISABLE KEYS */;
INSERT INTO `item` VALUES (5,'Yo, El Peor de Todos',2014,NULL,0,'5.jpg','Yo, para algunos, soy el peor de todos. El mafioso. El apretador. El que se caga en todo el mundo. El que hace periodismo basura. El que se mete en la vida privada de los demás pero al que no le gusta que hagan lo mismo con la suya. El que se enganchó con una pendeja refuerte porque está lleno de plata y de poder. El que co bró seiscientos mil dólares para entrevistar a Fariña y farandulizar la ruta del dinero K. El periodista elegido por el gobierno para entrevistar a la Presidenta. El que es capaz de hacer cualquier cosa por medio punto de rating. El que echó a su amigo Ventura porque es un hijo de puta que no tiene corazón. El que no se arrepiente de nada Por todo esto, para muchos, soy el peor de todos. Allá ellos. No me conocen nada. Soy algo de eso. Pero también un tipo que recibió los peores golpes en su niñez. Que se crió en la calle. Que se abrió camino en esta picadora de carne de los medios sin padrinos. A pura prepotencia de trabajo. Al que un día le explotó el corazón y se dio cuenta de que estaba solo. El que a los cincuenta años perdió todo y tuvo que volver a empezar. El que tuvo la milagrosa dicha de ser elegido por sus hijas en un acto de amor y de adopción de ida y vuelta. El que encontró el amor cuando ya estaba desahuciado en el amor. El que se bancó tapas de revistas, extorsiones, apretadas y amenazas. Uno de los pocos que desde hace quince años mantiene Intrusos como programa líder de audiencia y la revista Paparazzi como primera en ventas. Soy todo eso. Y mucho más. Por eso decidí hacer mi autobiografía. Escrita a corazón abierto. Sin especular en lo más mínimo. A favor y también en contra mío. Sin pensar en las consecuencias. Brutal, honesta y descarnada. Es decir: como me gusta hacer las cosas a mí. Jorge Rial',1,1,1,2),(6,'El Alquimista',2012,NULL,0,'6.jpg',NULL,3,1,1,2),(7,'Trastornos del Neurodesarrollo',2011,NULL,0,'7.jpg',NULL,1,1,1,2),(8,'The Secret',2006,NULL,0,NULL,NULL,2,3,1,2),(9,'La Fuerza de la Compasión',2015,NULL,0,'9.jpg',NULL,1,1,1,2),(10,'Infortambo ',1999,NULL,0,NULL,NULL,1,2,1,2),(11,'Yo el peor de todos 2',2015,NULL,NULL,NULL,NULL,1,1,1,2),(17,'TEST 1',2015,NULL,NULL,NULL,NULL,2,2,1,2),(18,'test2',2015,NULL,NULL,NULL,NULL,1,2,1,2),(19,'tituloooooo',2015,NULL,NULL,NULL,NULL,1,1,1,2),(20,'jjjjj',2015,NULL,NULL,NULL,NULL,3,3,1,2),(21,'El tema eliminar',2015,NULL,NULL,NULL,NULL,1,1,1,2),(22,'EL GGGGGG',2005,NULL,NULL,NULL,NULL,1,3,1,2),(23,'Nuevo 13 oct',2015,NULL,NULL,NULL,'asdfghjkl',1,1,1,2),(24,'21 oct',2010,NULL,NULL,NULL,'probando post con usuario',1,1,0,2),(25,'21 oct annie1',2015,NULL,NULL,NULL,'fsdfsdfs',1,1,0,6),(26,'24 oct',2014,NULL,NULL,NULL,'probando redirect',1,2,0,2),(27,'24 oct 2',2015,NULL,NULL,NULL,'probando redict ',1,3,0,2),(28,'24 oct 3',2015,NULL,NULL,NULL,'probando redict ',1,3,0,2),(29,'24 oct 4 ',2015,NULL,NULL,NULL,'fsdf',1,1,0,2),(30,'24 oct 4 ',2015,NULL,NULL,NULL,'fsdf',1,1,0,2),(31,'24 oct 4 ',2015,NULL,NULL,NULL,'fsdf',1,1,0,2),(32,'24 oct 5',2015,NULL,NULL,NULL,'werw',1,3,0,2),(33,'Titulo 4 noviembre',2000,NULL,NULL,NULL,'descripcion 4 noviembre',2,3,0,2),(34,'5 nov',2015,NULL,NULL,NULL,'fdff',1,1,0,2);
/*!40000 ALTER TABLE `item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `itemautor`
--

DROP TABLE IF EXISTS `itemautor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `itemautor` (
  `idItem` int(11) NOT NULL,
  `idAutor` int(11) NOT NULL,
  PRIMARY KEY (`idItem`,`idAutor`),
  KEY `idAutor` (`idAutor`),
  KEY `idLibro` (`idItem`),
  CONSTRAINT `idAutor` FOREIGN KEY (`idAutor`) REFERENCES `autor` (`idAutor`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `idLibro` FOREIGN KEY (`idItem`) REFERENCES `item` (`idItem`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `itemautor`
--

LOCK TABLES `itemautor` WRITE;
/*!40000 ALTER TABLE `itemautor` DISABLE KEYS */;
INSERT INTO `itemautor` VALUES (9,1),(23,1),(27,1),(28,1),(6,2),(27,2),(28,2),(5,3),(17,3),(20,3),(22,3),(24,3),(26,3),(32,3),(7,4),(17,4),(18,4),(19,4),(26,4),(29,4),(30,4),(31,4),(34,4),(7,5),(17,5),(18,5),(21,5),(22,5),(23,5),(26,5),(33,5),(8,6),(18,6),(22,6),(23,6),(25,6);
/*!40000 ALTER TABLE `itemautor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `itemfavorito`
--

DROP TABLE IF EXISTS `itemfavorito`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `itemfavorito` (
  `idUsuario` int(11) NOT NULL,
  `idItem` int(11) NOT NULL,
  PRIMARY KEY (`idUsuario`,`idItem`),
  KEY `fk_itemfavorito_usuario1_idx` (`idUsuario`),
  KEY `fk_itemfavorito_item1_idx` (`idItem`),
  CONSTRAINT `fk_itemfavorito_item1` FOREIGN KEY (`idItem`) REFERENCES `item` (`idItem`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_itemfavorito_usuario1` FOREIGN KEY (`idUsuario`) REFERENCES `usuario` (`idUsuario`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `itemfavorito`
--

LOCK TABLES `itemfavorito` WRITE;
/*!40000 ALTER TABLE `itemfavorito` DISABLE KEYS */;
/*!40000 ALTER TABLE `itemfavorito` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `itemtema`
--

DROP TABLE IF EXISTS `itemtema`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `itemtema` (
  `idItem` int(11) NOT NULL,
  `idTema` int(11) NOT NULL,
  PRIMARY KEY (`idItem`,`idTema`),
  KEY `fk_itemtema_item1_idx` (`idItem`),
  KEY `fk_itemtema_tema1_idx` (`idTema`),
  CONSTRAINT `fk_itemtema_item1` FOREIGN KEY (`idItem`) REFERENCES `item` (`idItem`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_itemtema_tema1` FOREIGN KEY (`idTema`) REFERENCES `tema` (`idTema`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `itemtema`
--

LOCK TABLES `itemtema` WRITE;
/*!40000 ALTER TABLE `itemtema` DISABLE KEYS */;
INSERT INTO `itemtema` VALUES (5,3),(5,5),(6,4),(7,1),(8,6),(9,2),(9,6),(17,1),(17,3),(17,5),(18,5),(19,4),(20,4),(21,3),(21,4),(22,3),(22,6),(23,4),(23,6),(24,3),(25,4),(26,1),(26,2),(26,6),(27,1),(28,1),(29,5),(30,5),(31,5),(32,2),(33,1),(33,3),(34,3);
/*!40000 ALTER TABLE `itemtema` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `posteo`
--

DROP TABLE IF EXISTS `posteo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `posteo` (
  `idPosteo` int(11) NOT NULL AUTO_INCREMENT,
  `titulo` varchar(45) NOT NULL,
  `comentario` text NOT NULL,
  `fecha` datetime NOT NULL,
  `tipo` int(11) NOT NULL COMMENT '1 comentario\n2 error ',
  `idItem` int(11) NOT NULL,
  `idUsuario` int(11) NOT NULL,
  PRIMARY KEY (`idPosteo`),
  KEY `fk_posteo_item1_idx` (`idItem`),
  KEY `fk_posteo_usuario1_idx` (`idUsuario`),
  CONSTRAINT `fk_posteo_item1` FOREIGN KEY (`idItem`) REFERENCES `item` (`idItem`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_posteo_usuario1` FOREIGN KEY (`idUsuario`) REFERENCES `usuario` (`idUsuario`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `posteo`
--

LOCK TABLES `posteo` WRITE;
/*!40000 ALTER TABLE `posteo` DISABLE KEYS */;
INSERT INTO `posteo` VALUES (1,'Titulo de admin','Comenten, soy el admin','2015-10-28 11:30:00',1,5,1),(2,'Muy bueno','Es genial el libro, me encanto!','2015-10-28 11:40:00',1,5,2),(7,'tititiitititit','comcomcomcocmcomo','2015-11-03 21:31:48',1,5,2);
/*!40000 ALTER TABLE `posteo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rol`
--

DROP TABLE IF EXISTS `rol`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rol` (
  `idRol` int(11) NOT NULL,
  `descripcion` varchar(100) DEFAULT NULL,
  `rol` varchar(45) NOT NULL,
  PRIMARY KEY (`idRol`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rol`
--

LOCK TABLES `rol` WRITE;
/*!40000 ALTER TABLE `rol` DISABLE KEYS */;
INSERT INTO `rol` VALUES (1,'Funcionalidades para usuarios basicos','ROLE_USER'),(2,'Funcionalidades para el admin de la plataforma','ROLE_ADMIN');
/*!40000 ALTER TABLE `rol` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tema`
--

DROP TABLE IF EXISTS `tema`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tema` (
  `idTema` int(11) NOT NULL AUTO_INCREMENT,
  `tema` varchar(45) NOT NULL,
  PRIMARY KEY (`idTema`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tema`
--

LOCK TABLES `tema` WRITE;
/*!40000 ALTER TABLE `tema` DISABLE KEYS */;
INSERT INTO `tema` VALUES (1,'medicina'),(2,'religion'),(3,'farandula'),(4,'literatura'),(5,'chismes'),(6,'espiritualidad');
/*!40000 ALTER TABLE `tema` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipoitem`
--

DROP TABLE IF EXISTS `tipoitem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipoitem` (
  `idTipoItem` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(45) NOT NULL,
  PRIMARY KEY (`idTipoItem`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipoitem`
--

LOCK TABLES `tipoitem` WRITE;
/*!40000 ALTER TABLE `tipoitem` DISABLE KEYS */;
INSERT INTO `tipoitem` VALUES (1,'Libro'),(2,'Revista'),(3,'DVD');
/*!40000 ALTER TABLE `tipoitem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `username` varchar(45) NOT NULL,
  `password` varchar(60) NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES ('admin','adminn',1),('user','userr',1);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `userroles`
--

DROP TABLE IF EXISTS `userroles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `userroles` (
  `idUserRoles` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(45) NOT NULL,
  `role` varchar(45) NOT NULL,
  PRIMARY KEY (`idUserRoles`),
  KEY `k_username` (`username`),
  CONSTRAINT `k_username` FOREIGN KEY (`username`) REFERENCES `user` (`username`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userroles`
--

LOCK TABLES `userroles` WRITE;
/*!40000 ALTER TABLE `userroles` DISABLE KEYS */;
INSERT INTO `userroles` VALUES (1,'admin','ROLE_ADMIN'),(2,'user','ROLE_USER'),(3,'admin','ROLE_USER');
/*!40000 ALTER TABLE `userroles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuario` (
  `idUsuario` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) DEFAULT NULL,
  `apellido` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `password` varchar(100) NOT NULL,
  `username` varchar(100) NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  PRIMARY KEY (`idUsuario`),
  UNIQUE KEY `username_UNIQUE` (`username`),
  UNIQUE KEY `email_UNIQUE` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES (1,'nManager','aManager','manager@manager.com','manager','manager',1),(2,'Annie','Guzman','annie@annie.com','annie','annie',1),(6,'Annie',NULL,'Annie@','annie','annie1',1);
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarioitempuntaje`
--

DROP TABLE IF EXISTS `usuarioitempuntaje`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuarioitempuntaje` (
  `idUsuario` int(11) NOT NULL,
  `idItem` int(11) NOT NULL,
  `puntaje` decimal(2,0) NOT NULL,
  PRIMARY KEY (`idUsuario`,`idItem`),
  KEY `idUsuario` (`idUsuario`),
  KEY `idItem` (`idItem`),
  CONSTRAINT `idItem` FOREIGN KEY (`idItem`) REFERENCES `item` (`idItem`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `idUsuario` FOREIGN KEY (`idUsuario`) REFERENCES `usuario` (`idUsuario`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarioitempuntaje`
--

LOCK TABLES `usuarioitempuntaje` WRITE;
/*!40000 ALTER TABLE `usuarioitempuntaje` DISABLE KEYS */;
/*!40000 ALTER TABLE `usuarioitempuntaje` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuariorol`
--

DROP TABLE IF EXISTS `usuariorol`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuariorol` (
  `idRol` int(11) NOT NULL,
  `idUsuario` int(11) NOT NULL,
  PRIMARY KEY (`idRol`,`idUsuario`),
  KEY `idRol` (`idRol`),
  KEY `idUsuario` (`idUsuario`),
  CONSTRAINT `fk_usuarioRol_idRol` FOREIGN KEY (`idRol`) REFERENCES `rol` (`idRol`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_usuarioRol_idUsuario` FOREIGN KEY (`idUsuario`) REFERENCES `usuario` (`idUsuario`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuariorol`
--

LOCK TABLES `usuariorol` WRITE;
/*!40000 ALTER TABLE `usuariorol` DISABLE KEYS */;
INSERT INTO `usuariorol` VALUES (1,2),(1,6),(2,1);
/*!40000 ALTER TABLE `usuariorol` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `valoratributoitem`
--

DROP TABLE IF EXISTS `valoratributoitem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `valoratributoitem` (
  `valor` varchar(45) NOT NULL,
  `idItem` int(11) NOT NULL,
  `idAtributoItem` int(11) NOT NULL,
  PRIMARY KEY (`idItem`,`idAtributoItem`),
  KEY `fk_valoratributoitem_item1_idx` (`idItem`),
  KEY `fk_valoratributoitem_atributoitem1_idx` (`idAtributoItem`),
  CONSTRAINT `fk_valoratributoitem_atributoitem1` FOREIGN KEY (`idAtributoItem`) REFERENCES `atributoitem` (`idAtributoItem`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_valoratributoitem_item1` FOREIGN KEY (`idItem`) REFERENCES `item` (`idItem`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `valoratributoitem`
--

LOCK TABLES `valoratributoitem` WRITE;
/*!40000 ALTER TABLE `valoratributoitem` DISABLE KEYS */;
INSERT INTO `valoratributoitem` VALUES ('9789504943136',5,1),('Planeta',5,2),('9788408019060',6,1),('Planeta',6,2),('9788492931033',7,1),('Viguera Editores',7,2),('80',8,3),('9788499884561',9,1),('Kairos',9,2),('0328-4808 ',10,4),('308',10,5),('Inforcampo S.A.',10,6),('1231231231',17,4),('12345',17,5),('PLLLLLLL',17,6),('0303456',18,4),('112233',18,5),('pllll',18,6),('t',19,1),('t',19,2),('8000',20,3),('1231231',21,1),('12fadga',21,2),('800000000',22,3),('12345678',23,1),('23456ui',23,2),('12312',24,1),('123123131',24,2),('12121',25,1),('2121',25,2),('32131231',26,4),('12312312',26,5),('31231',26,6),('34',27,3),('34',28,3),('fdsfds',29,1),('fsdfs',29,2),('fdsfds',30,1),('fsdfs',30,2),('fdsfds',31,1),('fsdfs',31,2),('rwerw',32,3);
/*!40000 ALTER TABLE `valoratributoitem` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-12-17 12:30:54
