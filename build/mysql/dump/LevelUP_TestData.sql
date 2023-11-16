CREATE DATABASE  IF NOT EXISTS `levelup` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `levelup`;
-- MySQL dump 10.13  Distrib 8.0.20, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: levelup
-- ------------------------------------------------------
-- Server version	8.0.20

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
-- Table structure for table `benutzer`
--

DROP TABLE IF EXISTS `benutzer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `benutzer` (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `vorname` varchar(45) DEFAULT NULL,
  `passwort` varchar(45) DEFAULT NULL,
  `klasse_id` int DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  KEY `klasse_id2_idx` (`klasse_id`),
  CONSTRAINT `klasse_id2` FOREIGN KEY (`klasse_id`) REFERENCES `klasse` (`klasse_id`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `benutzer`
--

LOCK TABLES `benutzer` WRITE;
/*!40000 ALTER TABLE `benutzer` DISABLE KEYS */;
INSERT INTO `benutzer` VALUES (1,'Mustermann','Max','12345',1),(2,'Doe','John','54321',1),(3,'Doe','Jane','12345',1),(4,'Lorem','Ipsum','54321',1),(5,'Smith','John','password123',1),(6,'Johnson','Alice','securepass',2),(7,'Doe','Bob','p@ssw0rd',1),(8,'Brown','Emma','qwerty',3),(9,'Miller','Daniel','letmein',2),(10,'Wilson','Olivia','123456',1),(11,'Moore','Liam','iloveyou',3),(12,'Anderson','Sophia','admin123',2),(13,'Jackson','Ethan','welcome1',1),(14,'White','Ava','pass123',3),(15,'Harris','Noah','testpass',2),(16,'Hall','Isabella','changeme',1),(17,'Lopez','Mia','password01',3),(18,'Young','James','newpass',2),(19,'King','Emily','userpass',1),(20,'Hill','Matthew','letsgo',3),(21,'Lee','Amelia','secret',2),(22,'Baker','Michael','mypassword',1),(23,'Green','Abigail','hello123',3),(24,'Turner','David','pass1234',2);
/*!40000 ALTER TABLE `benutzer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `benutzer_item`
--

DROP TABLE IF EXISTS `benutzer_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `benutzer_item` (
  `user_id` int NOT NULL,
  `item_id` int NOT NULL,
  `anzahl` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`user_id`,`item_id`),
  KEY `item_id_idx` (`item_id`),
  CONSTRAINT `item_id` FOREIGN KEY (`item_id`) REFERENCES `item` (`item_id`),
  CONSTRAINT `user_id3` FOREIGN KEY (`user_id`) REFERENCES `benutzer` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `benutzer_item`
--

LOCK TABLES `benutzer_item` WRITE;
/*!40000 ALTER TABLE `benutzer_item` DISABLE KEYS */;
/*!40000 ALTER TABLE `benutzer_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `benutzer_kurs`
--

DROP TABLE IF EXISTS `benutzer_kurs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `benutzer_kurs` (
  `user_id` int NOT NULL,
  `kurs_id` int NOT NULL,
  `exp` int DEFAULT '0',
  PRIMARY KEY (`user_id`,`kurs_id`),
  KEY `kurs_id_idx` (`kurs_id`),
  CONSTRAINT `kurs_id` FOREIGN KEY (`kurs_id`) REFERENCES `kurs` (`kurs_id`),
  CONSTRAINT `user_id` FOREIGN KEY (`user_id`) REFERENCES `benutzer` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `benutzer_kurs`
--

LOCK TABLES `benutzer_kurs` WRITE;
/*!40000 ALTER TABLE `benutzer_kurs` DISABLE KEYS */;
/*!40000 ALTER TABLE `benutzer_kurs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `item`
--

DROP TABLE IF EXISTS `item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `item` (
  `item_id` int NOT NULL AUTO_INCREMENT,
  `beschreibung` varchar(45) DEFAULT NULL,
  `bezeichnung` varchar(45) DEFAULT NULL,
  `seltenheit` varchar(45) DEFAULT NULL,
  `dropchance` float DEFAULT NULL,
  PRIMARY KEY (`item_id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item`
--

LOCK TABLES `item` WRITE;
/*!40000 ALTER TABLE `item` DISABLE KEYS */;
INSERT INTO `item` VALUES (1,'30 Minuten früher gehen dürfen','Early Dismissal Pass','Gold',0.05),(2,'1 Verspätung erlassen','Late Pass','Bronze',0.2),(3,'Hausaufgabenfrei für einen Tag','Homework-Free Day','Diamant',0.02),(4,'Zusätzliche Mittagspause','Extra Lunch Break','Silber',0.1),(5,'2 Verspätungen erlassen','Double Late Pass','Gold',0.05),(6,'Wahl des Sitzplatzes für einen Tag','Choose Your Seat','Bronze',0.2),(7,'Freistunde gewinnen','Free Period','Diamant',0.02),(8,'Hausaufgaben für eine Woche erlassen','No Homework Week','Silber',0.1),(9,'10 Minuten länger Pause','Extended Break','Gold',0.05),(10,'Vorzeitiger Schulabschluss','Early Graduation','Platin',0.01),(11,'Freie Themenwahl für ein Referat','Choose Your Presentation Topic','Silber',0.1),(12,'Klassenarbeitsbefreiung für einen Tag','Test-Free Day','Gold',0.05),(13,'Klassenraumdekoration nach eigener Wahl','Custom Classroom Decor','Diamant',0.02),(14,'1 Stunde Nachhilfe von Lehrer/in','Teacher Tutoring','Gold',0.05),(15,'Freie Kurswahl für einen Tag','Choose Your Classes','Silber',0.1),(16,'Persönliche Bibliotheksnutzung','Library Privileges','Bronze',0.2),(17,'Freier Zugang zum Lehrerzimmer','Teacher\'s Lounge Access','Gold',0.05),(18,'Besuch der Schulverwaltung vermeiden','Avoid Admin Office Visit','Silber',0.1),(19,'Längeres Wochenende','Extended Weekend','Diamant',0.02),(20,'1 Woche schulfrei gewinnen','One Week Off School','Platin',0.01),(21,'Exklusiver Klassenraum für einen Tag','Exclusive Classroom','Diamant',0.02),(22,'Gutschein für Schulmaterial','School Supplies Voucher','Bronze',0.2),(23,'Freie Wahl des Schulsports','Choose Your PE Activity','Platin',0.01),(24,'Picknick im Schulgarten','Picnic in the School Garden','Silber',0.1),(25,'VIP-Zugang zur Schulbibliothek','VIP Library Access','Gold',0.05),(26,'Einladung zur Schülerkonferenz','Student Council Invitation','Diamant',0.02),(27,'Einmalige Nutzung des Lehrerparkplatzes','Teacher Parking Pass','Bronze',0.2),(28,'Exklusiver Zugang zur Schuldachterrasse','Rooftop Terrace Access','Platin',0.01),(29,'Fotograf für den Schuljahresabschluss','Yearbook Photographer','Silber',0.1),(30,'Schullogo-T-Shirt nach Wahl','Custom School Logo T-Shirt','Gold',0.05),(31,'Freie Platzwahl bei Schulveranstaltungen','Open Seating at School Events','Diamant',0.02),(32,'Einmalige Nutzung des Lehrerbadezimmers','Teacher\'s Lounge Bathroom Pass','Bronze',0.2),(33,'Schuljahreskalender mit eigenen Fotos','Personalized School Calendar','Platin',0.01),(34,'Eigener Spind im Schülerflur','Personal Locker in Student Hallway','Silber',0.1),(35,'Kostenlose Teilnahme am Schüleraustausch','Free Student Exchange Program','Gold',0.05),(36,'Schullogo-Tattoo nach eigener Wahl','Custom School Logo Tattoo','Diamant',0.02),(37,'VIP-Gast bei Schulveranstaltungen','VIP Guest at School Events','Bronze',0.2),(38,'Eigener Schulhofbereich für einen Tag','Private Courtyard Area','Platin',0.01),(39,'Autogrammstunde mit Schulleitung','Autograph Session with School Leadership','Silber',0.1),(40,'Freie Platzwahl im Schulbus','Choose Your Seat on the School Bus','Gold',0.05);
/*!40000 ALTER TABLE `item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `klasse`
--

DROP TABLE IF EXISTS `klasse`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `klasse` (
  `klasse_id` int NOT NULL AUTO_INCREMENT,
  `bezeichnung` varchar(45) DEFAULT NULL,
  `klassenlehrer` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`klasse_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `klasse`
--

LOCK TABLES `klasse` WRITE;
/*!40000 ALTER TABLE `klasse` DISABLE KEYS */;
INSERT INTO `klasse` VALUES (1,'FA-A-11','Fr. Glass-Becker'),(2,'FI-A-11','Herr. Bartel'),(3,'FS-A-11','Herr. Freese');
/*!40000 ALTER TABLE `klasse` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `klasse_kurs`
--

DROP TABLE IF EXISTS `klasse_kurs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `klasse_kurs` (
  `klasse_id` int NOT NULL,
  `kurs_id` int NOT NULL,
  PRIMARY KEY (`klasse_id`,`kurs_id`),
  KEY `kurs_id_idx` (`kurs_id`),
  CONSTRAINT `klasse_id` FOREIGN KEY (`klasse_id`) REFERENCES `klasse` (`klasse_id`),
  CONSTRAINT `kurs_id2` FOREIGN KEY (`kurs_id`) REFERENCES `kurs` (`kurs_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `klasse_kurs`
--

LOCK TABLES `klasse_kurs` WRITE;
/*!40000 ALTER TABLE `klasse_kurs` DISABLE KEYS */;
INSERT INTO `klasse_kurs` VALUES (1,1),(1,2),(1,3),(1,4),(1,5),(1,6),(1,7),(2,8),(2,9),(2,10),(2,11),(2,12),(2,13),(2,14),(3,15),(3,16),(3,17),(3,18),(3,19),(3,20);
/*!40000 ALTER TABLE `klasse_kurs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kurs`
--

DROP TABLE IF EXISTS `kurs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `kurs` (
  `kurs_id` int NOT NULL AUTO_INCREMENT,
  `bezeichnung` varchar(45) DEFAULT NULL,
  `anz_der_klausuren` int DEFAULT NULL,
  PRIMARY KEY (`kurs_id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kurs`
--

LOCK TABLES `kurs` WRITE;
/*!40000 ALTER TABLE `kurs` DISABLE KEYS */;
INSERT INTO `kurs` VALUES (1,'Mathematik I',2),(2,'Informatik Grundkurs',1),(3,'Englisch für Fortgeschrittene',3),(4,'Biologie Basics',2),(5,'Geschichte der Kunst',1),(6,'Chemie für Einsteiger',2),(7,'Physik für Nichtphysiker',1),(8,'Literatur und Kreatives Schreiben',3),(9,'Einführung in die Wirtschaft',2),(10,'Musikgeschichte',1),(11,'Erdkunde für Weltreisende',2),(12,'Psychologie 101',1),(13,'Programmieren in Java',3),(14,'Politik und Gesellschaft',2),(15,'Filmgeschichte',1),(16,'Philosophie für Einsteiger',2),(17,'Kochen leicht gemacht',1),(18,'Sport und Fitness',2),(19,'Schauspielkunst',1),(20,'Astrophysik für Neugierige',3);
/*!40000 ALTER TABLE `kurs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lootbox`
--

DROP TABLE IF EXISTS `lootbox`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lootbox` (
  `lootbox_id` int NOT NULL AUTO_INCREMENT,
  `seltenheit` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`lootbox_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lootbox`
--

LOCK TABLES `lootbox` WRITE;
/*!40000 ALTER TABLE `lootbox` DISABLE KEYS */;
INSERT INTO `lootbox` VALUES (1,'Diamant'),(2,'Platin'),(3,'Gold'),(4,'Silber'),(5,'Bronze');
/*!40000 ALTER TABLE `lootbox` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lootbox_benutzer`
--

DROP TABLE IF EXISTS `lootbox_benutzer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lootbox_benutzer` (
  `user_id` int NOT NULL,
  `lootbox_id` int NOT NULL,
  `anzahl` int DEFAULT '0',
  PRIMARY KEY (`user_id`,`lootbox_id`),
  KEY `lootbox_id_idx` (`lootbox_id`),
  CONSTRAINT `lootbox_id` FOREIGN KEY (`lootbox_id`) REFERENCES `lootbox` (`lootbox_id`),
  CONSTRAINT `user_id2` FOREIGN KEY (`user_id`) REFERENCES `benutzer` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lootbox_benutzer`
--

LOCK TABLES `lootbox_benutzer` WRITE;
/*!40000 ALTER TABLE `lootbox_benutzer` DISABLE KEYS */;
/*!40000 ALTER TABLE `lootbox_benutzer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `verspaetung`
--

DROP TABLE IF EXISTS `verspaetung`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `verspaetung` (
  `zeitpunkt` datetime NOT NULL,
  `user_id` int NOT NULL,
  `entschuldigt` tinyint DEFAULT NULL,
  PRIMARY KEY (`zeitpunkt`,`user_id`),
  KEY `user_id_idx` (`user_id`),
  CONSTRAINT `schueler` FOREIGN KEY (`user_id`) REFERENCES `benutzer` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `verspaetung`
--

LOCK TABLES `verspaetung` WRITE;
/*!40000 ALTER TABLE `verspaetung` DISABLE KEYS */;
/*!40000 ALTER TABLE `verspaetung` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-11-15 12:22:21
