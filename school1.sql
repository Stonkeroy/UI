-- MySQL dump 10.13  Distrib 8.0.40, for Win64 (x86_64)
--
-- Host: localhost    Database: school
-- ------------------------------------------------------
-- Server version	8.0.40

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
-- Table structure for table `classes`
--

DROP TABLE IF EXISTS `classes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `classes` (
  `ClassID` int NOT NULL AUTO_INCREMENT,
  `ClassName` varchar(50) NOT NULL,
  PRIMARY KEY (`ClassID`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `classes`
--

LOCK TABLES `classes` WRITE;
/*!40000 ALTER TABLE `classes` DISABLE KEYS */;
INSERT INTO `classes` VALUES (1,'1A'),(2,'1B'),(3,'2A'),(4,'2B'),(5,'3A'),(6,'3B'),(7,'4A'),(8,'4B'),(9,'5A'),(10,'5B'),(11,'6A'),(12,'6B'),(13,'7A'),(14,'7B'),(15,'8A'),(16,'8B'),(17,'9A'),(18,'9B'),(19,'10A'),(20,'10B'),(21,'11A'),(22,'11B');
/*!40000 ALTER TABLE `classes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `students`
--

DROP TABLE IF EXISTS `students`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `students` (
  `StudentID` int NOT NULL AUTO_INCREMENT,
  `FirstName` varchar(100) NOT NULL,
  `LastName` varchar(100) NOT NULL,
  `BirthDate` date NOT NULL,
  `ClassID` int DEFAULT NULL,
  `Address` varchar(255) DEFAULT NULL,
  `PhoneNumber` varchar(20) DEFAULT NULL,
  `Email` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`StudentID`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `students`
--

LOCK TABLES `students` WRITE;
/*!40000 ALTER TABLE `students` DISABLE KEYS */;
INSERT INTO `students` VALUES (1,'Ivan','Petrov','2005-05-10',1,'Kyiv, ul. Shevchenka, 12','0661234567','ivan.petrov@example.com'),(2,'Olga','Ivanova','2006-04-12',2,'Kyiv, ul. Velyka, 34','0672345678','olga.ivanova@example.com'),(3,'Serhiy','Kovalenko','2005-07-23',3,'Kyiv, ul. Tsentralna, 5','0683456789','serhiy.kovalenko@example.com'),(4,'Anna','Semenova','2005-03-15',1,'Kyiv, ul. Khreshchatyk, 22','0664567890','anna.semenova@example.com'),(5,'Petr','Kuzmenko','2006-06-17',2,'Kyiv, ul. Pivdenna, 10','0675678901','petr.kuzmenko@example.com'),(6,'Daria','Vasylenko','2005-11-30',3,'Kyiv, ul. Tsentralna, 7','0686789012','daria.vasylenko@example.com'),(7,'Yevhen','Sydorenko','2006-02-20',1,'Kyiv, ul. Lvivska, 9','0667890123','yevhen.sydorenko@example.com'),(8,'Nadiya','Matsenko','2005-10-25',2,'Kyiv, ul. Krymska, 15','0678901234','nadiya.matsenko@example.com'),(9,'Oleh','Melnyk','2005-09-14',3,'Kyiv, ul. Zelenyi Sad, 8','0689012345','oleh.melnyk@example.com'),(10,'Kateryna','Tkachenko','2006-01-05',1,'Kyiv, ul. Frunze, 3','0660123456','kateryna.tkachenko@example.com'),(11,'Mykola','Petrenko','2005-12-13',2,'Kyiv, ul. Pochayna, 18','0671234560','mykola.petrenko@example.com'),(12,'Irina','Krut','2006-07-02',3,'Kyiv, ul. Ivan Franka, 6','0682345671','irina.krut@example.com'),(13,'Roman','Danylenko','2005-08-29',1,'Kyiv, ul. Gorkogo, 4','0663456782','roman.danylenko@example.com'),(14,'Marta','Golub','2006-05-11',2,'Kyiv, ul. Zhylianska, 20','0674567893','marta.golub@example.com'),(15,'Ivan','Petrov','2005-05-10',1,'Kyiv, ul. Shevchenka, 12','0661234567','ivan.petrov@example.com'),(16,'Olga','Ivanova','2006-04-12',2,'Kyiv, ul. Velyka, 34','0672345678','olga.ivanova@example.com'),(17,'Serhiy','Kovalenko','2005-07-23',3,'Kyiv, ul. Tsentralna, 5','0683456789','serhiy.kovalenko@example.com'),(18,'Anna','Semenova','2005-03-15',4,'Kyiv, ul. Khreshchatyk, 22','0664567890','anna.semenova@example.com'),(19,'Petr','Kuzmenko','2006-06-17',5,'Kyiv, ul. Pivdenna, 10','0675678901','petr.kuzmenko@example.com'),(20,'Daria','Vasylenko','2005-11-30',6,'Kyiv, ul. Tsentralna, 7','0686789012','daria.vasylenko@example.com'),(21,'Yevhen','Sydorenko','2006-02-20',7,'Kyiv, ul. Lvivska, 9','0667890123','yevhen.sydorenko@example.com'),(22,'Nadiya','Matsenko','2005-10-25',8,'Kyiv, ul. Krymska, 15','0678901234','nadiya.matsenko@example.com'),(23,'Oleh','Melnyk','2005-09-14',9,'Kyiv, ul. Zelenyi Sad, 8','0689012345','oleh.melnyk@example.com'),(24,'Kateryna','Tkachenko','2006-01-05',10,'Kyiv, ul. Frunze, 3','0660123456','kateryna.tkachenko@example.com'),(25,'Mykola','Petrenko','2005-12-13',11,'Kyiv, ul. Pochayna, 18','0671234560','mykola.petrenko@example.com'),(26,'Irina','Krut','2006-07-02',12,'Kyiv, ul. Ivan Franka, 6','0682345671','irina.krut@example.com'),(27,'Roman','Danylenko','2005-08-29',13,'Kyiv, ul. Gorkogo, 4','0663456782','roman.danylenko@example.com'),(28,'Marta','Golub','2006-05-11',14,'Kyiv, ul. Zhylianska, 20','0674567893','marta.golub@example.com'),(29,'Ivan','Stepanov','2005-01-10',15,'Kyiv, ul. Naberezhna, 9','0661122334','ivan.stepanov@example.com'),(30,'Olena','Kovaleva','2005-04-05',16,'Kyiv, ul. Kyivska, 27','0672233445','olena.kovaleva@example.com'),(31,'Serhiy','Pavlenko','2006-02-28',17,'Kyiv, ul. Poltavska, 3','0683344556','serhiy.pavlenko@example.com'),(32,'Olga','Baran','2005-09-13',18,'Kyiv, ul. Dniprovska, 5','0674455667','olga.baran@example.com'),(33,'Daria','Kravets','2005-06-18',19,'Kyiv, ul. Chernihivska, 12','0685566778','daria.kravets@example.com'),(34,'Yevhen','Petryk','2005-08-22',20,'Kyiv, ul. Starokyivska, 8','0666677889','yevhen.petryk@example.com'),(35,'Nadiya','Shvets','2005-12-30',21,'Kyiv, ul. Malinska, 4','0677788990','nadiya.shvets@example.com'),(36,'Mykola','Melnychuk','2005-07-09',22,'Kyiv, ul. Holosiyivska, 6','0688899001','mykola.melnychuk@example.com');
/*!40000 ALTER TABLE `students` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teachers`
--

DROP TABLE IF EXISTS `teachers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `teachers` (
  `TeacherID` int NOT NULL AUTO_INCREMENT,
  `FullName` varchar(255) NOT NULL,
  `BirthDate` date NOT NULL,
  `PhoneNumber` varchar(20) DEFAULT NULL,
  `Email` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`TeacherID`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teachers`
--

LOCK TABLES `teachers` WRITE;
/*!40000 ALTER TABLE `teachers` DISABLE KEYS */;
INSERT INTO `teachers` VALUES (1,'Sergiy Tymoshenko','1980-12-01','0669876543','serhiy.tymoshenko@example.com'),(2,'Olena Fedorova','1985-03-15','0678765432','olena.fedorova@example.com'),(3,'Mykhailo Dyatrenko','1978-07-30','0687654321','mykhailo.dyatrenko@example.com'),(4,'Irina Sydorenko','1982-09-10','0662345678','irina.sydorenko@example.com'),(5,'Dmytro Melnyk','1975-06-25','0673456789','dmytro.melnyk@example.com'),(6,'Kateryna Kovalchuk','1990-01-18','0681234567','kateryna.kovalchuk@example.com'),(7,'Roman Petrenko','1987-11-03','0665432109','roman.petrenko@example.com'),(8,'Marta Golub','1992-04-05','0676543210','marta.golub@example.com');
/*!40000 ALTER TABLE `teachers` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-12-01 23:32:04
