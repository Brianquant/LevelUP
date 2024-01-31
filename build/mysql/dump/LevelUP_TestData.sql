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
-- Table structure for table `action`
--

DROP TABLE IF EXISTS `action`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `action` (
  `action_id` int NOT NULL,
  `bezeichnung` varchar(45) DEFAULT NULL,
  `beschreibung` varchar(300) DEFAULT NULL,
  `xp` int DEFAULT NULL,
  PRIMARY KEY (`action_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `action`
--

LOCK TABLES `action` WRITE;
/*!40000 ALTER TABLE `action` DISABLE KEYS */;
INSERT INTO `action` VALUES (1,'Täglicher Login','Du hast dich erfolgreich eingeloggt.',100),(2,'Positive Mitarbeit','Der/die Schüler/-in hat aktiv und positiv am Unterricht teilgenommen.',100),(3,'Wortmeldung','Der/die Schüler/-in hat sich gemeldet.',100),(4,'Wortmeldung mit Qualität','Der/die Schüler/-in hat sich gemeldet und korrekt geantwortet.',100),(5,'Abgabe','Der/die Schüler/-in hat eine geforderte bewertete Abgabe eingereicht.',100),(6,'Präsentation / Vortrag','Der/die Schüler/-in hat eine Präsentation / einen Vortrag gehalten.',100),(7,'Selbstständiges Arbeiten','Der/die Schüler/-in hat die aktuelle Aufgabe selbstständig',100),(8,'Arbeitsmaterial vollständig','Der/die Schüler/-in hat das geforderte Arbeitsmaterial',100),(9,'Negative Mitarbeit','Der/die Schüler/-in hat im Unterricht nicht mitgearbeitet.',-100),(10,'Störung','Der/die Schüler/-in hat im Unterricht gestört. Kann für jeden einzelnen Vorfall innerhalb des Unterrichts benutzt werden.',-100),(11,'Kein Arbeitsmaterial','Der/die Schüler/-in hat kein eigenes oder vollständiges',-100),(12,'Im Unterricht Spielen','Der/die Schüler/-in hat im Unterricht nicht vorgesehene Aktivitäten ausgeführt (z.B. Videospiele spielen)',-100),(13,'Fehlende Abgabe','Der/die Schüler/-in hat eine geforderte Abgabe wurde eingereicht',-100),(14,'Fehlende bewertete Abgabe','Der/die Schüler/-in hat eine geforderte bewertete Abgabe',-100),(15,'Verspätung','Der/die Schüler/-in ist zu spät zum Unterricht erschienen.',-100),(16,'Unentschuldigtes Fehlen','Der/die Schüer/-in hat seine Fehlzeit nicht Entschuldigt.',-100),(17,'Kein Selbstständiges Arbeiten','Der/die Schüler/-in hat nicht selbstständig gearbeitet. (z.B. nach Erklärung der Aufgabenstellung gefragt was gemacht werden muss)',-100);
/*!40000 ALTER TABLE `action` ENABLE KEYS */;
UNLOCK TABLES;

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
  `beschreibung` varchar(300) DEFAULT NULL,
  `bezeichnung` varchar(45) DEFAULT NULL,
  `lootbox_id` int DEFAULT NULL,
  `dropchance` float DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  KEY `lootbox_id_idx` (`lootbox_id`),
  CONSTRAINT `lootbox` FOREIGN KEY (`lootbox_id`) REFERENCES `lootbox` (`lootbox_id`)
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item`
--

LOCK TABLES `item` WRITE;
/*!40000 ALTER TABLE `item` DISABLE KEYS */;
INSERT INTO `item` VALUES (1,'Mündliche Mitarbeit im Unterricht darf nicht vom Lehrer gefordert werden und fehlende Mitarbeit darf nicht negativ vom Lehrer vermerkt werden.','Mantel des Schweigens',NULL,NULL),(2,'Gib die Frage an den Lehrer zurück, sodass er diese selbst beantworten muss.','No you!',NULL,NULL),(3,'Gib die Frage des Lehreres weiter. Der Lehrer muss einen anderen Schüler wählen.','Weiß ich doch nicht.',NULL,NULL),(4,'Lasse dir eine kleine Verspätung (max. 5min) pro Woche entschuldigen. In Maßen benutzen.','Gelber Pass',NULL,NULL),(5,'Erzwinge für die aktuelle Aufgabe einen frontalen Unterricht zur Erklärung der Aufgabe.','Teach me Master',NULL,NULL),(6,'Nur für Doppelblöcke. Die Lehrkraft bitten die Pause zu verschieben, sodass kein Stau in der Mensa entsteht.','Kaffe Pause!',NULL,NULL),(7,'Nur bei zufälliger Gruppenzusammenstellung. Alle die dieses Ticket spielen dürfen untereinander die Plätze tauschen.','I choose you.',NULL,NULL),(8,'Erbitte max. 24h mehr Zeit bei einer Abgabe deiner Wahl. (Keine Klausurersatzleistung, max. 1 mal pro Halbjahr)','Kann ich auch morgen abgeben?',NULL,NULL),(9,'Erkaufe dir das Recht, bei stiller Arbeit, deine Kopfhörer zum Musik hören zu benutzern.','Do not Disturb.',NULL,NULL),(10,'Der Unterricht darf verlassen werden, um in der Cafeteria sich ein Getränk zu holen.','I need a coffee!',NULL,NULL),(11,'Darf den Unterricht kurz zum Telefonieren verlassen.','Immer erreichbar.',NULL,NULL),(12,'Darf im Unterricht kurz auf Messengernachrichten linsen.','Wirklich immer erreichbar',NULL,NULL),(13,'Darf im Unterricht Messenger nutzen.','Wirklich immer erreichbar und antworte auch.',2,NULL),(14,'Darf draußen telefonieren und Messenger im Unterricht nutzen.','Bin ich weg?',1,NULL),(15,'Darf einen Tag im HomeOffice am Unterricht teilnehmen.','Freiwache!',1,NULL),(16,'Hat für einen Test/Klausur eine inhaltliche Frage im Unfang von einem Punkt frei.','Joker!',NULL,NULL),(17,'Darf sich Schullineale ohne Konsequenzen ausleihen.','Where is my ruler?',NULL,NULL),(18,'S. hat einen “dringenden” Termin und darf früher nach Hause gehen (außer an Klausuren)','Freiblock.',2,NULL),(19,'Darf 10min später kommen oder 10 min eher gehen.','Tschüß ihr Looser!',NULL,NULL),(20,'Darf 5min später kommen oder 5 min eher gehen.','Bin dann mal weg.',NULL,NULL),(21,'ucht sich die Lehrkraft für 10 min individuelle Hilfe. Lehrkraft bemüht sich hilfreich zu sein.','WHAT?',1,NULL),(22,'Bucht sich die Lehrkraft für 5 min individuelle Hilfe. Lehrkraft bemüht sich hilfreich zu sein.','WHAT?',2,NULL),(23,'Bucht sich die Lehrkraft für 5 min individuelle Hilfe. Lehrkraft leitet den lernenden an sich selbst zu helfen.','WHAT?',NULL,NULL),(24,'Bucht sich die Lehrkraft für 2 min individuelle Hilfe. Lehrkraft leitet den Lernenden an sich selbst zu helfen und gibt sarkastische Kommentare.','WHAT?',5,NULL),(25,'Sie bekommen mit der Lehrkraft ein Selfie.','Selfie mit dem Star!',5,NULL),(26,'Lernender darf sich einen Block lang frei im Raum bewegen und jedem anderen Lernenden still über die Schulter zu schauen.','Wandertag.',NULL,NULL),(27,'Lernender darf einen Block lang sich frei im Raum bewegen und leise mit anderen Lernenden über den Unterricht austauschen.','Wandertag.',2,NULL),(28,'Lernender darf ein Tafelbild abfotografieren und muss es nicht abschreiben','No Fotos please!',NULL,NULL),(29,'Lernender darf einen Block lang jedes Tafelbild und jede Musterlösung abfotografieren','No Fotos please!',2,NULL),(30,'Lernender darf immer jedes Tafelbild und jede Musterlösung abfotografieren.','No Fotos please!',1,NULL),(31,'Darf die Lehrkraft zwingen, ein gelenktes Unterrichtsgespräch, á la \"Was bedeutet eigentlich Softwarequalität?\" in einen Frontalvortrag umzuwandeln','Osterhasenpädagogik',NULL,NULL),(32,'Lehrkraft muss bei einer Meldung den Karteninhaber drannehmen','I choose me!',NULL,NULL),(33,'Lehrkraft muss bei einer Meldung einen Block lang den Karteninhaber drannehmen.','I choose me!',2,NULL),(34,'Ich darf eine Lösung eines Lernenden als meine Lösung einreichen. (ohne Bewertung)','Hausaufgabenservice!',NULL,NULL),(35,'Ich darf eine Lösung eines Lernenden als meine Lösung einreichen. (mit Bewertung, im guten wie im schlechten)','Hausaufgabenservice!',1,NULL),(36,'Lernender darf sich eine Woche lang mit Papier aus dem Drucker versorgen.','Rettet die Bäume.',NULL,NULL),(37,'Lernender darf einen Gast mit in den Unterricht bringen.','It’s my friend.',NULL,NULL),(38,'Lehrkraft muss die Rolos herunterlassen.','Vampir.',NULL,NULL),(39,'Lehrkraft muss das Licht 15min ausgeschaltet lassen.','Licht aus.',NULL,NULL),(40,'Lernender darf statt in einer Gruppenarbeit lieber alleine arbeiten.','Kein Bock auf Gruppenarbeit!',NULL,NULL),(41,'Lehrkraft wandelt einen Lehrerteil in eine Recherche/praktische Arbeitsaufgabe um.','Kein Bock auf Frontalunterricht!',NULL,NULL),(42,'Keine Konsequenzen bei nicht gemachter Hausaufgabe','Hausaufgaben? Die hat der Hund gefressen',2,NULL),(43,'24h Nachreichfrist ohne Konsequenz','Hausaufgaben? Die hat der Hund gefressen',NULL,NULL),(44,'Darf in Stillarbeiten (keine Tests) auf das Blatt des Nachbarn schauen.','Spicken erlaubt.',NULL,NULL),(45,'Darf in Stillarbeiten (auch Tests) auf das Blatt des Nachbarn schauen.','Spicken erlaubt.',1,NULL),(46,'5min Pause während die anderen Arbeiten müssen.','Ich brauche mal ne Pause',NULL,NULL),(47,'Nö, ich bleibe da sitzen wo ich will.','Kommt mal alle nach vorne!',NULL,NULL),(48,'Zufällig eingesammelte Hausarbeit/Stundenarbeit abwehren und jemand anderen auswählen lassen','And the winner is…',NULL,NULL),(49,'Ich darf in diesem Block sitzen wo ich will (außer am Lehrerplatz)','Mein Lieblingsplatz ist…',NULL,NULL),(50,'Nope, ich schreibe nicht mit (keine Bewertung).','Überraschung! Test!',NULL,NULL),(51,'Ich kann entscheiden, ob ich mitschreiben will oder ob ich am Ende abgeben will.','Überraschung! Test!',2,NULL),(52,'Ich kann vorher entscheiden, ob ich den Test vorläufig bewertet haben möchte. Wenn mir die Note nicht gefällt, dann gilt der Test als entschuldigt gefehlt und wird aus der Bewertung rausgerechnet.','Überraschung! Test!',1,NULL),(53,'Ich kann irgendeine Testnote abwehren, der Test gilt dann als entschuldigt gefehlt und wird aus der Bewertung rausgerechnet.','Überraschung! Test!',3,NULL),(54,'Die Hausaufgabe wird individuell auf einen späteren Termin verschoben.','No homework today!',NULL,NULL),(55,'Die Hausaufgabe wird für alle auf einen späteren Termin verschoben.','No homework today!',3,NULL),(56,'Heute gibt es keine Hausaufgabe. Die Hausaufgabe kann aber in einer anderen Stunde aufgegeben werden','No homework today!',2,NULL),(57,'Es gibt heute keine Hausaufgabe, es hat sie nie gegeben und wird sie auch nicht geben','No homework today!',1,NULL);
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
