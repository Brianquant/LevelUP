CREATE DATABASE  IF NOT EXISTS `levelup` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `levelup`;
-- MySQL dump 10.13  Distrib 8.0.20, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: levelup
-- ------------------------------------------------------
-- Server version	8.0.35

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
  `passwort` varchar(100) DEFAULT NULL,
  `klasse_id` int DEFAULT NULL,
  `username` varchar(20) DEFAULT NULL,
  `rolle` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `username_UNIQUE` (`username`),
  KEY `klasse_id2_idx` (`klasse_id`),
  CONSTRAINT `klasse_id2` FOREIGN KEY (`klasse_id`) REFERENCES `klasse` (`klasse_id`)
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `benutzer`
--

LOCK TABLES `benutzer` WRITE;
/*!40000 ALTER TABLE `benutzer` DISABLE KEYS */;
INSERT INTO `benutzer` VALUES (1,'Mustermann','Max','12345',1,'max_musterman',NULL),(2,'Doe','John','$2a$12$qWyBhmH68TRYle9DBlJWIuqLwVO6KKuhu/c34lbKjmq8wxWQ9O29i',1,'john_doe',NULL),(3,'Doe','Jane','$2a$12$8MQ1EJaBBYpU.bby4ypeqe/mvjJUC8JSJ8yvd2.dz42RTdZ9MV0MG',1,'jane_doe',NULL),(4,'Lorem','Ipsum','54321',1,'ipsum_lorem',NULL),(5,'Smith','John','password123',1,'john_smith',NULL),(6,'Johnson','Alice','securepass',2,'alice_johnson',NULL),(7,'Doe','Bob','p@ssw0rd',1,'bob_doe',NULL),(8,'Brown','Emma','qwerty',3,'emma_brown',NULL),(9,'Miller','Daniel','letmein',2,'daniel_miller',NULL),(10,'Wilson','Olivia','123456',1,'olivia_wilson',NULL),(11,'Moore','Liam','iloveyou',3,'liam_moore',NULL),(12,'Anderson','Sophia','admin123',2,'sophia_anderson',NULL),(13,'Jackson','Ethan','welcome1',1,'ethan_jackson',NULL),(14,'White','Ava','pass123',3,'ava_white',NULL),(15,'Harris','Noah','testpass',2,'noah_harris',NULL),(16,'Hall','Isabella','changeme',1,'isabella_hall',NULL),(17,'Lopez','Mia','password01',3,'mia_lopez',NULL),(18,'Young','James','newpass',2,'james_young',NULL),(19,'King','Emily','userpass',1,'emily_king',NULL),(20,'Hill','Matthew','letsgo',3,'matthew_hill',NULL),(21,'Lee','Amelia','secret',2,'amelia_lee',NULL),(22,'Baker','Michael','mypassword',1,'michael_baker',NULL),(23,'Green','Abigail','hello123',3,'abigail_green',NULL),(24,'Turner','David','pass1234',2,'david_turner',NULL),(56,'Asd','Asd','$2b$12$i9BnLVWgPejGZtfKvgegQugN19uLlLUDkhQqxFnKocSBiAXDldB.2',2,'asd_asd',NULL);
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
INSERT INTO `benutzer_kurs` VALUES (1,1,50),(1,2,30),(1,3,20),(2,1,40),(2,2,10),(2,3,25),(3,1,75),(3,2,81),(3,3,77),(3,4,67),(3,5,20),(3,6,12),(3,7,46),(3,8,7),(3,9,63),(3,10,2),(3,11,17),(3,12,60),(3,13,29),(3,14,94),(3,15,48),(3,16,15),(3,17,76),(3,18,55),(3,19,0),(3,20,48),(4,1,19),(4,2,18),(4,3,57),(4,4,56),(4,5,41),(4,6,16),(4,7,47),(4,8,6),(4,9,28),(4,10,78),(4,11,20),(4,12,41),(4,13,96),(4,14,79),(4,15,34),(4,16,63),(4,17,94),(4,18,3),(4,19,40),(4,20,33),(5,1,59),(5,2,27),(5,3,26),(5,4,68),(5,5,37),(5,6,73),(5,7,43),(5,8,48),(5,9,66),(5,10,94),(5,11,1),(5,12,4),(5,13,73),(5,14,20),(5,15,76),(5,16,20),(5,17,42),(5,18,63),(5,19,58),(5,20,43),(6,1,78),(6,2,61),(6,3,42),(6,4,83),(6,5,25),(6,6,47),(6,7,71),(6,8,69),(6,9,58),(6,10,74),(6,11,71),(6,12,61),(6,13,12),(6,14,32),(6,15,84),(6,16,62),(6,17,9),(6,18,28),(6,19,78),(6,20,87),(7,1,19),(7,2,0),(7,3,60),(7,4,0),(7,5,13),(7,6,22),(7,7,66),(7,8,69),(7,9,60),(7,10,77),(7,11,76),(7,12,1),(7,13,10),(7,14,49),(7,15,79),(7,16,15),(7,17,99),(7,18,61),(7,19,2),(7,20,16),(8,1,48),(8,2,99),(8,3,83),(8,4,39),(8,5,38),(8,6,83),(8,7,26),(8,8,16),(8,9,85),(8,10,36),(8,11,65),(8,12,97),(8,13,7),(8,14,79),(8,15,96),(8,16,34),(8,17,25),(8,18,30),(8,19,9),(8,20,72),(9,1,81),(9,2,30),(9,3,56),(9,4,17),(9,5,76),(9,6,88),(9,7,21),(9,8,39),(9,9,25),(9,10,29),(9,11,40),(9,12,25),(9,13,28),(9,14,5),(9,15,65),(9,16,74),(9,17,35),(9,18,34),(9,19,12),(9,20,9),(10,1,18),(10,2,92),(10,3,14),(10,4,93),(10,5,50),(10,6,86),(10,7,93),(10,8,27),(10,9,14),(10,10,49),(10,11,43),(10,12,22),(10,13,89),(10,14,9),(10,15,18),(10,16,27),(10,17,39),(10,18,90),(10,19,37),(10,20,99),(11,1,87),(11,2,88),(11,3,17),(11,4,33),(11,5,49),(11,6,38),(11,7,80),(11,8,88),(11,9,86),(11,10,15),(11,11,63),(11,12,34),(11,13,2),(11,14,59),(11,15,31),(11,16,32),(11,17,76),(11,18,16),(11,19,69),(11,20,42),(12,1,80),(12,2,80),(12,3,6),(12,4,51),(12,5,16),(12,6,43),(12,7,34),(12,8,75),(12,9,81),(12,10,43),(12,11,78),(12,12,49),(12,13,23),(12,14,89),(12,15,7),(12,16,82),(12,17,35),(12,18,97),(12,19,51),(12,20,19),(13,1,37),(13,2,63),(13,3,92),(13,4,33),(13,5,58),(13,6,19),(13,7,12),(13,8,81),(13,9,98),(13,10,3),(13,11,39),(13,12,64),(13,13,60),(13,14,46),(13,15,90),(13,16,34),(13,17,27),(13,18,34),(13,19,15),(13,20,13),(14,1,35),(14,2,31),(14,3,6),(14,4,33),(14,5,21),(14,6,23),(14,7,99),(14,8,90),(14,9,84),(14,10,11),(14,11,57),(14,12,24),(14,13,55),(14,14,84),(14,15,55),(14,16,30),(14,17,32),(14,18,10),(14,19,6),(14,20,73),(15,1,92),(15,2,70),(15,3,86),(15,4,20),(15,5,72),(15,6,80),(15,7,77),(15,8,1),(15,9,10),(15,10,83),(15,11,35),(15,12,64),(15,13,63),(15,14,50),(15,15,95),(15,16,76),(15,17,28),(15,18,21),(15,19,60),(15,20,60),(16,1,0),(16,2,1),(16,3,1),(16,4,68),(16,5,14),(16,6,34),(16,7,52),(16,8,75),(16,9,42),(16,10,45),(16,11,27),(16,12,31),(16,13,9),(16,14,5),(16,15,72),(16,16,18),(16,17,40),(16,18,94),(16,19,77),(16,20,98),(17,1,40),(17,2,45),(17,3,95),(17,4,10),(17,5,52),(17,6,17),(17,7,78),(17,8,58),(17,9,37),(17,10,43),(17,11,26),(17,12,96),(17,13,85),(17,14,77),(17,15,66),(17,16,85),(17,17,87),(17,18,50),(17,19,21),(17,20,85),(18,1,17),(18,2,53),(18,3,82),(18,4,53),(18,5,62),(18,6,85),(18,7,21),(18,8,74),(18,9,50),(18,10,92),(18,11,70),(18,12,53),(18,13,98),(18,14,13),(18,15,89),(18,16,44),(18,17,44),(18,18,58),(18,19,83),(18,20,52),(19,1,25),(19,2,74),(19,3,15),(19,4,33),(19,5,84),(19,6,29),(19,7,20),(19,8,58),(19,9,90),(19,10,97),(19,11,66),(19,12,77),(19,13,74),(19,14,98),(19,15,72),(19,16,54),(19,17,66),(19,18,92),(19,19,98),(19,20,0),(20,1,26),(20,2,79),(20,3,22),(20,4,11),(20,5,11),(20,6,49),(20,7,44),(20,8,91),(20,9,4),(20,10,43),(20,11,37),(20,12,80),(20,13,55),(20,14,32),(20,15,69),(20,16,38),(20,17,40),(20,18,54),(20,19,10),(20,20,66),(21,1,84),(21,2,49),(21,3,21),(21,4,19),(21,5,91),(21,6,13),(21,7,57),(21,8,25),(21,9,23),(21,10,96),(21,11,86),(21,12,45),(21,13,80),(21,14,85),(21,15,49),(21,16,20),(21,17,18),(21,18,56),(21,19,88),(21,20,28),(22,1,85),(22,2,80),(22,3,6),(22,4,16),(22,5,59),(22,6,92),(22,7,68),(22,8,83),(22,9,82),(22,10,9),(22,11,55),(22,12,88),(22,13,62),(22,14,8),(22,15,92),(22,16,52),(22,17,55),(22,18,42),(22,19,51),(22,20,5),(23,1,98),(23,2,4),(23,3,7),(23,4,11),(23,5,49),(23,6,12),(23,7,37),(23,8,91),(23,9,7),(23,10,81),(23,11,33),(23,12,28),(23,13,36),(23,14,18),(23,15,18),(23,16,91),(23,17,12),(23,18,24),(23,19,2),(23,20,96),(24,18,15),(24,19,5),(24,20,30);
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
  `secret` varchar(90) DEFAULT NULL,
  PRIMARY KEY (`klasse_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `klasse`
--

LOCK TABLES `klasse` WRITE;
/*!40000 ALTER TABLE `klasse` DISABLE KEYS */;
INSERT INTO `klasse` VALUES (1,'FA-A-11','Fr. Glass-Becker','$2a$12$1o/nVTI5HxHHQYjoDn.pxeQUeWYU5UzMDE8Grcuadj/tFrQVFTqXO'),(2,'FI-A-11','Herr. Bartel','$2a$12$5XPheLxxrV/hM4s9pHmMCe6lwNPiCgbo1NU4SPgTDnMNMv6vvORSi'),(3,'FS-A-11','Herr. Freese','$2a$12$jrduMXM5e3vzpaCNWRDFTeZfG9bQdJMfv2Htu5bk/2/7LXBYBcFZS');
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

--
-- Dumping routines for database 'levelup'
--
/*!50003 DROP PROCEDURE IF EXISTS `UpdateUsernames` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`locahost` PROCEDURE `UpdateUsernames`()
BEGIN
    UPDATE benutzer AS b1
    SET username = 
        CASE 
            WHEN (
                SELECT COUNT(*) 
                FROM (SELECT * FROM benutzer) AS b2 
                WHERE b2.username = CONCAT(LEFT(LOWER(IFNULL(b1.vorname, '')), 10), '_', LEFT(LOWER(IFNULL(b1.name, '')), 9))
            ) > 1
            THEN
                CONCAT(LEFT(LOWER(IFNULL(b1.vorname, '')), 10), '_', LEFT(LOWER(IFNULL(b1.name, '')), 9), 
                       (SELECT COUNT(*) FROM (SELECT * FROM benutzer) AS b2 WHERE b2.username LIKE 
                           CONCAT(LEFT(LOWER(IFNULL(b1.vorname, '')), 10), '_', LEFT(LOWER(IFNULL(b1.name, '')), 9), '%')
                       )
                )
            ELSE
                CONCAT(LEFT(LOWER(IFNULL(b1.vorname, '')), 10), '_', LEFT(LOWER(IFNULL(b1.name, '')), 9))
        END;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-01-30  8:43:28
