-- MySQL dump 10.13  Distrib 8.0.27, for Win64 (x86_64)
--
-- Host: localhost    Database: pa5_golf_schema
-- ------------------------------------------------------
-- Server version	5.5.5-10.4.22-MariaDB

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
-- Table structure for table `addresses`
--

DROP TABLE IF EXISTS `addresses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `addresses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `location_id` int(11) NOT NULL,
  `language` varchar(100) DEFAULT NULL,
  `suite` varchar(100) DEFAULT NULL,
  `floor` varchar(100) DEFAULT NULL,
  `building` varchar(100) DEFAULT NULL,
  `street_number` varchar(100) DEFAULT NULL,
  `street_prefix` varchar(100) DEFAULT NULL,
  `street` varchar(100) DEFAULT NULL,
  `street_suffix` varchar(100) DEFAULT NULL,
  `neighborhood` varchar(100) DEFAULT NULL,
  `district` varchar(100) DEFAULT NULL,
  `locality` varchar(100) DEFAULT NULL,
  `county` varchar(100) DEFAULT NULL,
  `region` varchar(100) DEFAULT NULL,
  `postal_code` varchar(100) DEFAULT NULL,
  `country` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_addresses_1` (`locality`),
  KEY `IDX_addresses_2` (`region`),
  KEY `IDX_addresses_3` (`postal_code`),
  KEY `IDX_FK_add_loc_id__loc_id` (`location_id`),
  CONSTRAINT `FK_add_loc_id__loc_id` FOREIGN KEY (`location_id`) REFERENCES `locations` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `addresses`
--

LOCK TABLES `addresses` WRITE;
/*!40000 ALTER TABLE `addresses` DISABLE KEYS */;
INSERT INTO `addresses` VALUES (1,1,'en-US',NULL,NULL,NULL,'15',NULL,'Breedt Street',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'South Africa'),(2,2,'en-US',NULL,NULL,NULL,'1086',NULL,'Suzuki Street',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Japan'),(3,3,'en-US',NULL,NULL,NULL,'123',NULL,'Westing',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Colombia'),(4,4,'en-US',NULL,NULL,NULL,'1224',NULL,'Midbrake',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Switzerland'),(5,5,'en-US',NULL,NULL,NULL,'235',NULL,'Gunnister',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Ethiopia'),(6,6,'en-US',NULL,NULL,NULL,'6435',NULL,'Wick',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Croatia'),(7,7,'en-US',NULL,NULL,NULL,'72',NULL,'Gloup',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'New Zealand'),(8,8,'en-US',NULL,NULL,NULL,'916',NULL,'Little Ness',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'United Kingdom'),(9,9,'en-US',NULL,NULL,NULL,'192',NULL,'North Holms',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Russia'),(10,10,'en-US',NULL,NULL,NULL,'721',NULL,'Sivatsta',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Vietnam'),(11,11,'en-US',NULL,NULL,NULL,'1023',NULL,'Sluggins',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Latvia'),(12,12,'en-US',NULL,NULL,NULL,'301',NULL,'Longa Water',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Israel'),(13,13,'en-US',NULL,NULL,NULL,'9174',NULL,'Tonga',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Greece'),(14,14,'en-US',NULL,NULL,NULL,'9612',NULL,'Blue Mull',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'United States'),(15,15,'en-US',NULL,NULL,NULL,'572',NULL,'Norby',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Malta'),(16,16,'en-US',NULL,NULL,NULL,'214',NULL,'Sadness',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Bahrain'),(17,17,'en-US',NULL,NULL,NULL,'9',NULL,'Navins',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Algeria'),(18,18,'en-US',NULL,NULL,NULL,'4',NULL,'Boddam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Spain'),(19,19,'en-US',NULL,NULL,NULL,'9828',NULL,'Hillwell',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Dominican Republic'),(20,20,'en-US',NULL,NULL,NULL,'1002',NULL,'Toab',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Ireland'),(21,21,'en-US',NULL,NULL,NULL,'18',NULL,'Scousburgh',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'United Arab Emirates'),(22,22,'en-US',NULL,NULL,NULL,'2122',NULL,'Gord',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Japan'),(23,23,'en-US',NULL,NULL,NULL,'991',NULL,'Skelberry',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Mongolia');
/*!40000 ALTER TABLE `addresses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `affiliation_phases`
--

DROP TABLE IF EXISTS `affiliation_phases`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `affiliation_phases` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `affiliation_id` int(11) NOT NULL,
  `root_id` int(11) DEFAULT NULL,
  `ancestor_affiliation_id` int(11) DEFAULT NULL,
  `start_season_id` int(11) DEFAULT NULL,
  `start_date_time` datetime DEFAULT NULL,
  `end_season_id` int(11) DEFAULT NULL,
  `end_date_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_seasons_affiliation_phases1` (`end_season_id`),
  KEY `FK_seasons_affiliation_phases` (`start_season_id`),
  KEY `FK_affiliations_affiliation_phases1` (`ancestor_affiliation_id`),
  KEY `FK_affiliations_affiliation_phases` (`affiliation_id`),
  CONSTRAINT `FK_affiliations_affiliation_phases` FOREIGN KEY (`affiliation_id`) REFERENCES `affiliations` (`id`),
  CONSTRAINT `FK_affiliations_affiliation_phases1` FOREIGN KEY (`ancestor_affiliation_id`) REFERENCES `affiliations` (`id`),
  CONSTRAINT `FK_seasons_affiliation_phases` FOREIGN KEY (`start_season_id`) REFERENCES `seasons` (`id`),
  CONSTRAINT `FK_seasons_affiliation_phases1` FOREIGN KEY (`end_season_id`) REFERENCES `seasons` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `affiliation_phases`
--

LOCK TABLES `affiliation_phases` WRITE;
/*!40000 ALTER TABLE `affiliation_phases` DISABLE KEYS */;
/*!40000 ALTER TABLE `affiliation_phases` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `affiliations`
--

DROP TABLE IF EXISTS `affiliations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `affiliations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `affiliation_key` varchar(100) NOT NULL,
  `affiliation_type` varchar(100) DEFAULT NULL,
  `publisher_id` int(11) NOT NULL,
  `manager_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_affiliations_1` (`affiliation_key`),
  KEY `IDX_affiliations_2` (`affiliation_type`),
  KEY `IDX_affiliations_3` (`affiliation_key`,`affiliation_type`,`publisher_id`),
  KEY `IDX_FK_aff_pub_id__pub_id` (`publisher_id`),
  KEY `FK_aff_manager_id__aff_id` (`manager_id`),
  CONSTRAINT `FK_aff_manager_id__aff_id` FOREIGN KEY (`manager_id`) REFERENCES `affiliations` (`id`),
  CONSTRAINT `FK_aff_pub_id__pub_id` FOREIGN KEY (`publisher_id`) REFERENCES `publishers` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `affiliations`
--

LOCK TABLES `affiliations` WRITE;
/*!40000 ALTER TABLE `affiliations` DISABLE KEYS */;
INSERT INTO `affiliations` VALUES (1,'International Golf Federation','International',1,NULL),(2,'GOLFRSA','South African',1,1),(3,'Tannie Sannie\'s Friends','South African',2,NULL),(4,'AA Golf Group','South African',2,NULL),(5,'One Shot Per Hole','South African',1,NULL);
/*!40000 ALTER TABLE `affiliations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `affiliations_documents`
--

DROP TABLE IF EXISTS `affiliations_documents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `affiliations_documents` (
  `affiliation_id` int(11) NOT NULL,
  `document_id` int(11) NOT NULL,
  KEY `FK_aff_doc_aff_id__aff_id` (`affiliation_id`),
  KEY `FK_aff_doc_doc_id__doc_id` (`document_id`),
  CONSTRAINT `FK_aff_doc_aff_id__aff_id` FOREIGN KEY (`affiliation_id`) REFERENCES `affiliations` (`id`),
  CONSTRAINT `FK_aff_doc_doc_id__doc_id` FOREIGN KEY (`document_id`) REFERENCES `documents` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `affiliations_documents`
--

LOCK TABLES `affiliations_documents` WRITE;
/*!40000 ALTER TABLE `affiliations_documents` DISABLE KEYS */;
/*!40000 ALTER TABLE `affiliations_documents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `affiliations_events`
--

DROP TABLE IF EXISTS `affiliations_events`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `affiliations_events` (
  `affiliation_id` int(11) NOT NULL,
  `event_id` int(11) NOT NULL,
  KEY `FK_aff_eve_aff_id__aff_id` (`affiliation_id`),
  KEY `FK_aff_eve_eve_id__eve_id` (`event_id`),
  CONSTRAINT `FK_aff_eve_aff_id__aff_id` FOREIGN KEY (`affiliation_id`) REFERENCES `affiliations` (`id`),
  CONSTRAINT `FK_aff_eve_eve_id__eve_id` FOREIGN KEY (`event_id`) REFERENCES `events` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `affiliations_events`
--

LOCK TABLES `affiliations_events` WRITE;
/*!40000 ALTER TABLE `affiliations_events` DISABLE KEYS */;
INSERT INTO `affiliations_events` VALUES (1,1),(2,2),(3,5),(4,4),(5,3);
/*!40000 ALTER TABLE `affiliations_events` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `affiliations_media`
--

DROP TABLE IF EXISTS `affiliations_media`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `affiliations_media` (
  `affiliation_id` int(11) NOT NULL,
  `media_id` int(11) NOT NULL,
  KEY `FK_aff_med_med_id__med_id` (`media_id`),
  KEY `FK_aff_med_aff_id__aff_id` (`affiliation_id`),
  CONSTRAINT `FK_aff_med_aff_id__aff_id` FOREIGN KEY (`affiliation_id`) REFERENCES `affiliations` (`id`),
  CONSTRAINT `FK_aff_med_med_id__med_id` FOREIGN KEY (`media_id`) REFERENCES `media` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `affiliations_media`
--

LOCK TABLES `affiliations_media` WRITE;
/*!40000 ALTER TABLE `affiliations_media` DISABLE KEYS */;
/*!40000 ALTER TABLE `affiliations_media` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `awards`
--

DROP TABLE IF EXISTS `awards`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `awards` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `participant_type` varchar(100) NOT NULL,
  `participant_id` int(11) NOT NULL,
  `award_type` varchar(100) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `total` int(11) DEFAULT NULL,
  `rank` varchar(100) DEFAULT NULL,
  `award_value` varchar(100) DEFAULT NULL,
  `currency` varchar(100) DEFAULT NULL,
  `date_coverage_type` varchar(100) DEFAULT NULL,
  `date_coverage_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `awards`
--

LOCK TABLES `awards` WRITE;
/*!40000 ALTER TABLE `awards` DISABLE KEYS */;
/*!40000 ALTER TABLE `awards` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bookmakers`
--

DROP TABLE IF EXISTS `bookmakers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bookmakers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `bookmaker_key` varchar(100) DEFAULT NULL,
  `publisher_id` int(11) NOT NULL,
  `location_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_boo_loc_id__loc_id` (`location_id`),
  KEY `FK_boo_pub_id__pub_id` (`publisher_id`),
  CONSTRAINT `FK_boo_loc_id__loc_id` FOREIGN KEY (`location_id`) REFERENCES `locations` (`id`),
  CONSTRAINT `FK_boo_pub_id__pub_id` FOREIGN KEY (`publisher_id`) REFERENCES `publishers` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bookmakers`
--

LOCK TABLES `bookmakers` WRITE;
/*!40000 ALTER TABLE `bookmakers` DISABLE KEYS */;
/*!40000 ALTER TABLE `bookmakers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_stats`
--

DROP TABLE IF EXISTS `core_stats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `core_stats` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `score` varchar(100) DEFAULT NULL,
  `score_opposing` varchar(100) DEFAULT NULL,
  `score_attempts` varchar(100) DEFAULT NULL,
  `score_attempts_opposing` varchar(100) DEFAULT NULL,
  `score_percentage` varchar(100) DEFAULT NULL,
  `score_percentage_opposing` varchar(100) DEFAULT NULL,
  `time_played_event` varchar(40) DEFAULT NULL,
  `time_played_total` varchar(40) DEFAULT NULL,
  `time_played_event_average` varchar(40) DEFAULT NULL,
  `events_played` varchar(40) DEFAULT NULL,
  `events_started` varchar(40) DEFAULT NULL,
  `position_id` int(11) DEFAULT NULL,
  `series_score` varchar(100) DEFAULT NULL,
  `series_score_opposing` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_stats`
--

LOCK TABLES `core_stats` WRITE;
/*!40000 ALTER TABLE `core_stats` DISABLE KEYS */;
/*!40000 ALTER TABLE `core_stats` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `db_info`
--

DROP TABLE IF EXISTS `db_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `db_info` (
  `version` varchar(100) NOT NULL DEFAULT '16',
  KEY `IDX_db_info_1` (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `db_info`
--

LOCK TABLES `db_info` WRITE;
/*!40000 ALTER TABLE `db_info` DISABLE KEYS */;
/*!40000 ALTER TABLE `db_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `display_names`
--

DROP TABLE IF EXISTS `display_names`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `display_names` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `language` varchar(100) NOT NULL,
  `entity_type` varchar(100) NOT NULL,
  `entity_id` int(11) NOT NULL,
  `full_name` varchar(100) DEFAULT NULL,
  `first_name` varchar(100) DEFAULT NULL,
  `middle_name` varchar(100) DEFAULT NULL,
  `last_name` varchar(100) DEFAULT NULL,
  `alias` varchar(100) DEFAULT NULL,
  `abbreviation` varchar(100) DEFAULT NULL,
  `short_name` varchar(100) DEFAULT NULL,
  `prefix` varchar(20) DEFAULT NULL,
  `suffix` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_display_names_1` (`entity_id`),
  KEY `IDX_display_names_2` (`entity_type`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `display_names`
--

LOCK TABLES `display_names` WRITE;
/*!40000 ALTER TABLE `display_names` DISABLE KEYS */;
INSERT INTO `display_names` VALUES (1,'en-US','persons',1,NULL,'Gary','Lee','Player',NULL,NULL,NULL,NULL,NULL),(2,'en-US','persons',2,NULL,'Jonelle','','Coertzee',NULL,NULL,NULL,NULL,NULL),(3,'en-US','persons',3,NULL,'Charlene','','Willems',NULL,NULL,NULL,NULL,NULL),(4,'en-US','persons',4,NULL,'Sierra','','Dietrich',NULL,NULL,NULL,NULL,NULL),(5,'en-US','persons',5,NULL,'Daniela','','Auer',NULL,NULL,NULL,NULL,NULL),(6,'en-US','persons',6,NULL,'Sandra','','Hills',NULL,NULL,NULL,NULL,NULL),(7,'en-US','persons',7,NULL,'Leila','','Bergnaum',NULL,NULL,NULL,NULL,NULL),(8,'en-US','persons',8,NULL,'Naomie','','McKenzie',NULL,NULL,NULL,NULL,NULL),(9,'en-US','persons',9,NULL,'Nicolene','','Samuels',NULL,NULL,NULL,NULL,NULL),(10,'en-US','persons',10,NULL,'Madeline','','Robel',NULL,NULL,NULL,NULL,NULL),(11,'en-US','persons',11,NULL,'Tannie','','Sannie',NULL,NULL,NULL,NULL,NULL),(12,'en-US','persons',12,NULL,'Liam','','Olson',NULL,NULL,NULL,NULL,NULL),(13,'en-US','persons',13,NULL,'Lemuel','','Quigley',NULL,NULL,NULL,NULL,NULL),(14,'en-US','persons',14,NULL,'Blaise','','Stamm',NULL,NULL,NULL,NULL,NULL),(15,'en-US','persons',15,NULL,'Kurtis','','Stiedemann',NULL,NULL,NULL,NULL,NULL),(16,'en-US','persons',16,NULL,'Brendon','','Stoltenberg',NULL,NULL,NULL,NULL,NULL),(17,'en-US','persons',17,NULL,'Jaylan','','Wolff',NULL,NULL,NULL,NULL,NULL),(18,'en-US','persons',18,NULL,'Floy','','Fadel',NULL,NULL,NULL,NULL,NULL),(19,'en-US','persons',19,NULL,'Wilfred','','Pfannerstill',NULL,NULL,NULL,NULL,NULL),(20,'en-US','persons',20,NULL,'Freddy','','Larson',NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `display_names` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `document_classes`
--

DROP TABLE IF EXISTS `document_classes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `document_classes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_document_classes_1` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `document_classes`
--

LOCK TABLES `document_classes` WRITE;
/*!40000 ALTER TABLE `document_classes` DISABLE KEYS */;
/*!40000 ALTER TABLE `document_classes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `document_contents`
--

DROP TABLE IF EXISTS `document_contents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `document_contents` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `document_id` int(11) NOT NULL,
  `sportsml` varchar(200) DEFAULT NULL,
  `sportsml_blob` text DEFAULT NULL,
  `abstract` text DEFAULT NULL,
  `abstract_blob` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_FK_doc_con_doc_id__doc_id` (`document_id`),
  CONSTRAINT `FK_doc_con_doc_id__doc_id` FOREIGN KEY (`document_id`) REFERENCES `documents` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `document_contents`
--

LOCK TABLES `document_contents` WRITE;
/*!40000 ALTER TABLE `document_contents` DISABLE KEYS */;
/*!40000 ALTER TABLE `document_contents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `document_fixtures`
--

DROP TABLE IF EXISTS `document_fixtures`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `document_fixtures` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fixture_key` varchar(100) DEFAULT NULL,
  `publisher_id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `document_class_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_document_fixtures_1` (`fixture_key`),
  KEY `IDX_FK_doc_fix_doc_cla_id__doc_cla_id` (`document_class_id`),
  KEY `IDX_FK_doc_fix_pub_id__pub_id` (`publisher_id`),
  CONSTRAINT `FK_doc_fix_doc_cla_id__doc_cla_id` FOREIGN KEY (`document_class_id`) REFERENCES `document_classes` (`id`),
  CONSTRAINT `FK_doc_fix_pub_id__pub_id` FOREIGN KEY (`publisher_id`) REFERENCES `publishers` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `document_fixtures`
--

LOCK TABLES `document_fixtures` WRITE;
/*!40000 ALTER TABLE `document_fixtures` DISABLE KEYS */;
/*!40000 ALTER TABLE `document_fixtures` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `document_fixtures_events`
--

DROP TABLE IF EXISTS `document_fixtures_events`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `document_fixtures_events` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `document_fixture_id` int(11) NOT NULL,
  `event_id` int(11) NOT NULL,
  `latest_document_id` int(11) NOT NULL,
  `last_update` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_FK_doc_fix_eve_doc_fix_id__doc_fix_id` (`document_fixture_id`),
  KEY `IDX_FK_doc_fix_eve_eve_id__eve_id` (`event_id`),
  KEY `IDX_FK_doc_fix_eve_lat_doc_id__doc_id` (`latest_document_id`),
  CONSTRAINT `FK_doc_fix_eve_doc_fix_id__doc_fix_id` FOREIGN KEY (`document_fixture_id`) REFERENCES `document_fixtures` (`id`),
  CONSTRAINT `FK_doc_fix_eve_eve_id__eve_id` FOREIGN KEY (`event_id`) REFERENCES `events` (`id`),
  CONSTRAINT `FK_doc_fix_eve_lat_doc_id__doc_id` FOREIGN KEY (`latest_document_id`) REFERENCES `documents` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `document_fixtures_events`
--

LOCK TABLES `document_fixtures_events` WRITE;
/*!40000 ALTER TABLE `document_fixtures_events` DISABLE KEYS */;
/*!40000 ALTER TABLE `document_fixtures_events` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `document_package_entry`
--

DROP TABLE IF EXISTS `document_package_entry`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `document_package_entry` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `document_package_id` int(11) NOT NULL,
  `rank` varchar(100) DEFAULT NULL,
  `document_id` int(11) NOT NULL,
  `headline` varchar(100) DEFAULT NULL,
  `short_headline` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_doc_pac_ent_doc_pac_id__doc_pac_id` (`document_package_id`),
  KEY `FK_doc_pac_ent_doc_id__doc_id` (`document_id`),
  CONSTRAINT `FK_doc_pac_ent_doc_id__doc_id` FOREIGN KEY (`document_id`) REFERENCES `documents` (`id`),
  CONSTRAINT `FK_doc_pac_ent_doc_pac_id__doc_pac_id` FOREIGN KEY (`document_package_id`) REFERENCES `document_packages` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `document_package_entry`
--

LOCK TABLES `document_package_entry` WRITE;
/*!40000 ALTER TABLE `document_package_entry` DISABLE KEYS */;
/*!40000 ALTER TABLE `document_package_entry` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `document_packages`
--

DROP TABLE IF EXISTS `document_packages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `document_packages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `package_key` varchar(100) DEFAULT NULL,
  `package_name` varchar(100) DEFAULT NULL,
  `date_time` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `document_packages`
--

LOCK TABLES `document_packages` WRITE;
/*!40000 ALTER TABLE `document_packages` DISABLE KEYS */;
/*!40000 ALTER TABLE `document_packages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `documents`
--

DROP TABLE IF EXISTS `documents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `documents` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `doc_id` varchar(75) NOT NULL,
  `publisher_id` int(11) NOT NULL,
  `date_time` datetime DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `language` varchar(100) DEFAULT NULL,
  `priority` varchar(100) DEFAULT NULL,
  `revision_id` varchar(255) DEFAULT NULL,
  `stats_coverage` varchar(100) DEFAULT NULL,
  `document_fixture_id` int(11) NOT NULL,
  `source_id` int(11) DEFAULT NULL,
  `db_loading_date_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_documents_1` (`doc_id`),
  KEY `IDX_documents_3` (`date_time`),
  KEY `IDX_documents_4` (`priority`),
  KEY `IDX_documents_5` (`revision_id`),
  KEY `IDX_FK_doc_doc_fix_id__doc_fix_id` (`document_fixture_id`),
  KEY `IDX_FK_doc_pub_id__pub_id` (`publisher_id`),
  KEY `IDX_FK_doc_sou_id__pub_id` (`source_id`),
  CONSTRAINT `FK_doc_doc_fix_id__doc_fix_id` FOREIGN KEY (`document_fixture_id`) REFERENCES `document_fixtures` (`id`),
  CONSTRAINT `FK_doc_pub_id__pub_id` FOREIGN KEY (`publisher_id`) REFERENCES `publishers` (`id`),
  CONSTRAINT `FK_doc_sou_id__pub_id` FOREIGN KEY (`source_id`) REFERENCES `publishers` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `documents`
--

LOCK TABLES `documents` WRITE;
/*!40000 ALTER TABLE `documents` DISABLE KEYS */;
/*!40000 ALTER TABLE `documents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `documents_media`
--

DROP TABLE IF EXISTS `documents_media`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `documents_media` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `document_id` int(11) NOT NULL,
  `media_id` int(11) NOT NULL,
  `media_caption_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_doc_med_med_cap_id__med_cap_id` (`media_caption_id`),
  KEY `FK_doc_med_med_id__med_id` (`media_id`),
  KEY `FK_doc_med_doc_id__doc_id` (`document_id`),
  CONSTRAINT `FK_doc_med_doc_id__doc_id` FOREIGN KEY (`document_id`) REFERENCES `documents` (`id`),
  CONSTRAINT `FK_doc_med_med_cap_id__med_cap_id` FOREIGN KEY (`media_caption_id`) REFERENCES `media_captions` (`id`),
  CONSTRAINT `FK_doc_med_med_id__med_id` FOREIGN KEY (`media_id`) REFERENCES `media` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `documents_media`
--

LOCK TABLES `documents_media` WRITE;
/*!40000 ALTER TABLE `documents_media` DISABLE KEYS */;
/*!40000 ALTER TABLE `documents_media` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `event_action_fouls`
--

DROP TABLE IF EXISTS `event_action_fouls`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `event_action_fouls` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `event_state_id` int(11) NOT NULL,
  `foul_name` varchar(100) DEFAULT NULL,
  `foul_result` varchar(100) DEFAULT NULL,
  `foul_type` varchar(100) DEFAULT NULL,
  `fouler_id` varchar(100) DEFAULT NULL,
  `recipient_type` varchar(100) DEFAULT NULL,
  `recipient_id` int(11) DEFAULT NULL,
  `comment` varchar(512) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_event_states_event_action_fouls` (`event_state_id`),
  CONSTRAINT `FK_event_states_event_action_fouls` FOREIGN KEY (`event_state_id`) REFERENCES `event_states` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `event_action_fouls`
--

LOCK TABLES `event_action_fouls` WRITE;
/*!40000 ALTER TABLE `event_action_fouls` DISABLE KEYS */;
/*!40000 ALTER TABLE `event_action_fouls` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `event_action_participants`
--

DROP TABLE IF EXISTS `event_action_participants`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `event_action_participants` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `event_state_id` int(11) NOT NULL,
  `event_action_play_id` int(11) NOT NULL,
  `person_id` int(11) NOT NULL,
  `participant_role` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_event_action_plays_event_action_participants` (`event_action_play_id`),
  KEY `FK_persons_event_action_participants` (`person_id`),
  KEY `FK_event_states_event_action_participants` (`event_state_id`),
  CONSTRAINT `FK_event_action_plays_event_action_participants` FOREIGN KEY (`event_action_play_id`) REFERENCES `event_action_plays` (`id`),
  CONSTRAINT `FK_event_states_event_action_participants` FOREIGN KEY (`event_state_id`) REFERENCES `event_states` (`id`),
  CONSTRAINT `FK_persons_event_action_participants` FOREIGN KEY (`person_id`) REFERENCES `persons` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `event_action_participants`
--

LOCK TABLES `event_action_participants` WRITE;
/*!40000 ALTER TABLE `event_action_participants` DISABLE KEYS */;
/*!40000 ALTER TABLE `event_action_participants` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `event_action_penalties`
--

DROP TABLE IF EXISTS `event_action_penalties`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `event_action_penalties` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `event_state_id` int(11) NOT NULL,
  `penalty_type` varchar(100) DEFAULT NULL,
  `penalty_level` varchar(100) DEFAULT NULL,
  `caution_level` varchar(100) DEFAULT NULL,
  `recipient_type` varchar(100) DEFAULT NULL,
  `recipient_id` int(11) DEFAULT NULL,
  `comment` varchar(512) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_event_states_event_action_penalties` (`event_state_id`),
  CONSTRAINT `FK_event_states_event_action_penalties` FOREIGN KEY (`event_state_id`) REFERENCES `event_states` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `event_action_penalties`
--

LOCK TABLES `event_action_penalties` WRITE;
/*!40000 ALTER TABLE `event_action_penalties` DISABLE KEYS */;
/*!40000 ALTER TABLE `event_action_penalties` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `event_action_plays`
--

DROP TABLE IF EXISTS `event_action_plays`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `event_action_plays` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `event_state_id` int(11) NOT NULL,
  `play_type` varchar(100) DEFAULT NULL,
  `score_attempt_type` varchar(100) DEFAULT NULL,
  `play_result` varchar(100) DEFAULT NULL,
  `comment` varchar(512) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_event_states_event_action_plays` (`event_state_id`),
  CONSTRAINT `FK_event_states_event_action_plays` FOREIGN KEY (`event_state_id`) REFERENCES `event_states` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `event_action_plays`
--

LOCK TABLES `event_action_plays` WRITE;
/*!40000 ALTER TABLE `event_action_plays` DISABLE KEYS */;
/*!40000 ALTER TABLE `event_action_plays` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `event_action_substitutions`
--

DROP TABLE IF EXISTS `event_action_substitutions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `event_action_substitutions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `event_state_id` int(11) NOT NULL,
  `person_original_id` int(11) NOT NULL,
  `person_original_position_id` int(11) NOT NULL,
  `person_replacing_id` int(11) NOT NULL,
  `person_replacing_position_id` int(11) NOT NULL,
  `substitution_reason` varchar(100) DEFAULT NULL,
  `comment` varchar(512) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_persons_event_action_substitutions1` (`person_replacing_id`),
  KEY `FK_persons_event_action_substitutions` (`person_original_id`),
  KEY `FK_event_states_event_action_substitutions` (`event_state_id`),
  KEY `FK_positions_event_action_substitutions1` (`person_replacing_position_id`),
  KEY `FK_positions_event_action_substitutions` (`person_original_position_id`),
  CONSTRAINT `FK_event_states_event_action_substitutions` FOREIGN KEY (`event_state_id`) REFERENCES `event_states` (`id`),
  CONSTRAINT `FK_persons_event_action_substitutions` FOREIGN KEY (`person_original_id`) REFERENCES `persons` (`id`),
  CONSTRAINT `FK_persons_event_action_substitutions1` FOREIGN KEY (`person_replacing_id`) REFERENCES `persons` (`id`),
  CONSTRAINT `FK_positions_event_action_substitutions` FOREIGN KEY (`person_original_position_id`) REFERENCES `positions` (`id`),
  CONSTRAINT `FK_positions_event_action_substitutions1` FOREIGN KEY (`person_replacing_position_id`) REFERENCES `positions` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `event_action_substitutions`
--

LOCK TABLES `event_action_substitutions` WRITE;
/*!40000 ALTER TABLE `event_action_substitutions` DISABLE KEYS */;
/*!40000 ALTER TABLE `event_action_substitutions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `event_states`
--

DROP TABLE IF EXISTS `event_states`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `event_states` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `event_id` int(11) NOT NULL,
  `current_state` int(11) DEFAULT NULL,
  `sequence_number` int(11) DEFAULT NULL,
  `period_value` varchar(100) DEFAULT NULL,
  `period_time_elapsed` varchar(100) DEFAULT NULL,
  `period_time_remaining` varchar(100) DEFAULT NULL,
  `minutes_elapsed` varchar(100) DEFAULT NULL,
  `period_minutes_elapsed` varchar(100) DEFAULT NULL,
  `context` varchar(40) DEFAULT NULL,
  `document_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_events_event_states` (`event_id`),
  KEY `IDX_event_states_context` (`context`),
  KEY `IDX_event_states_seq_num` (`sequence_number`),
  CONSTRAINT `FK_events_event_states` FOREIGN KEY (`event_id`) REFERENCES `events` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `event_states`
--

LOCK TABLES `event_states` WRITE;
/*!40000 ALTER TABLE `event_states` DISABLE KEYS */;
/*!40000 ALTER TABLE `event_states` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `events`
--

DROP TABLE IF EXISTS `events`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `events` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `event_key` varchar(100) NOT NULL,
  `publisher_id` int(11) NOT NULL,
  `start_date_time` datetime DEFAULT NULL,
  `end_date_time` datetime DEFAULT NULL,
  `site_id` int(11) DEFAULT NULL,
  `site_alignment` varchar(100) DEFAULT NULL,
  `event_status` varchar(100) DEFAULT NULL,
  `duration` varchar(100) DEFAULT NULL,
  `attendance` varchar(100) DEFAULT NULL,
  `last_update` datetime DEFAULT NULL,
  `event_number` varchar(32) DEFAULT NULL,
  `round_number` varchar(32) DEFAULT NULL,
  `time_certainty` varchar(100) DEFAULT NULL,
  `broadcast_listing` varchar(255) DEFAULT NULL,
  `start_date_time_local` datetime DEFAULT NULL,
  `medal_event` varchar(100) DEFAULT NULL,
  `series_index` varchar(40) DEFAULT NULL,
  `gender` set('Men','Women') NOT NULL,
  `tour_id` int(11) DEFAULT NULL,
  `year` year(4) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_events_1` (`event_key`),
  KEY `IDX_FK_eve_pub_id__pub_id` (`publisher_id`),
  KEY `IDX_FK_eve_sit_id__sit_id` (`site_id`),
  KEY `FK_events_tour_id__tours_id` (`tour_id`),
  CONSTRAINT `FK_eve_pub_id__pub_id` FOREIGN KEY (`publisher_id`) REFERENCES `publishers` (`id`),
  CONSTRAINT `FK_eve_sit_id__sit_id` FOREIGN KEY (`site_id`) REFERENCES `sites` (`id`),
  CONSTRAINT `FK_events_tour_id__tours_id` FOREIGN KEY (`tour_id`) REFERENCES `tours` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `events`
--

LOCK TABLES `events` WRITE;
/*!40000 ALTER TABLE `events` DISABLE KEYS */;
INSERT INTO `events` VALUES (1,'U.S. Open Championship',2,'2022-05-01 13:00:00','2022-05-04 17:00:00',3,NULL,'Completed',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Women',2,2022),(2,'Yokahama Open',2,'2022-06-01 13:00:00','2022-06-04 17:00:00',2,NULL,'Cancelled','4',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Women',NULL,2022),(3,'Master\'s tournament',1,'2022-01-01 13:00:00','2022-01-04 17:00:00',5,NULL,'Completed',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Women',NULL,2022),(4,'The Open Championship',1,'2020-04-01 13:00:00','2020-04-04 17:00:00',4,NULL,'Completed',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Men',3,2020),(5,'Pretoria Classic',1,'2022-06-01 13:00:00','2022-06-01 17:00:00',1,NULL,'Scheduled','4',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Men',1,2022);
/*!40000 ALTER TABLE `events` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `events_documents`
--

DROP TABLE IF EXISTS `events_documents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `events_documents` (
  `event_id` int(11) NOT NULL,
  `document_id` int(11) NOT NULL,
  KEY `FK_eve_doc_doc_id__doc_id` (`document_id`),
  KEY `FK_eve_doc_eve_id__eve_id` (`event_id`),
  CONSTRAINT `FK_eve_doc_doc_id__doc_id` FOREIGN KEY (`document_id`) REFERENCES `documents` (`id`),
  CONSTRAINT `FK_eve_doc_eve_id__eve_id` FOREIGN KEY (`event_id`) REFERENCES `events` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `events_documents`
--

LOCK TABLES `events_documents` WRITE;
/*!40000 ALTER TABLE `events_documents` DISABLE KEYS */;
/*!40000 ALTER TABLE `events_documents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `events_media`
--

DROP TABLE IF EXISTS `events_media`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `events_media` (
  `event_id` int(11) NOT NULL,
  `media_id` int(11) NOT NULL,
  KEY `FK_eve_med_med_id__med_id` (`media_id`),
  KEY `FK_eve_med_eve_id__eve_id` (`event_id`),
  CONSTRAINT `FK_eve_med_eve_id__eve_id` FOREIGN KEY (`event_id`) REFERENCES `events` (`id`),
  CONSTRAINT `FK_eve_med_med_id__med_id` FOREIGN KEY (`media_id`) REFERENCES `media` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `events_media`
--

LOCK TABLES `events_media` WRITE;
/*!40000 ALTER TABLE `events_media` DISABLE KEYS */;
/*!40000 ALTER TABLE `events_media` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `events_sub_seasons`
--

DROP TABLE IF EXISTS `events_sub_seasons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `events_sub_seasons` (
  `event_id` int(11) NOT NULL,
  `sub_season_id` int(11) NOT NULL,
  KEY `FK_eve_sub_sea_sub_sea_id__sub_sea_id` (`sub_season_id`),
  KEY `FK_eve_sub_sea_eve_id__eve_id` (`event_id`),
  CONSTRAINT `FK_eve_sub_sea_eve_id__eve_id` FOREIGN KEY (`event_id`) REFERENCES `events` (`id`),
  CONSTRAINT `FK_eve_sub_sea_sub_sea_id__sub_sea_id` FOREIGN KEY (`sub_season_id`) REFERENCES `sub_seasons` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `events_sub_seasons`
--

LOCK TABLES `events_sub_seasons` WRITE;
/*!40000 ALTER TABLE `events_sub_seasons` DISABLE KEYS */;
/*!40000 ALTER TABLE `events_sub_seasons` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `golf_statistics`
--

DROP TABLE IF EXISTS `golf_statistics`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `golf_statistics` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `entity_type` varchar(100) NOT NULL,
  `entity_id` int(11) NOT NULL,
  `person_id` int(11) DEFAULT NULL,
  `tour_ind` tinyint(1) DEFAULT NULL,
  `event_ind` tinyint(1) DEFAULT NULL,
  `round_ind` tinyint(1) DEFAULT NULL,
  `player_ind` tinyint(1) DEFAULT NULL,
  `winner_id` int(11) DEFAULT NULL,
  `leader_id` int(11) DEFAULT NULL,
  `no_of_eagles` int(3) DEFAULT NULL,
  `no_of_birdies` int(3) DEFAULT NULL,
  `no_of_bogeys` int(3) DEFAULT NULL,
  `no_of_double_bogeys` int(3) DEFAULT NULL,
  `max_drive` decimal(10,2) DEFAULT NULL,
  `top10_cnt` int(6) DEFAULT NULL,
  `avg_net_score` int(6) DEFAULT NULL,
  `win_cnt` int(6) DEFAULT NULL,
  `position` int(6) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `entity_type` (`entity_type`,`entity_id`,`person_id`),
  KEY `FK_golf_statistics_person_id__persons_id` (`person_id`),
  KEY `FK_golf_statistics_winner_id__persons_id` (`winner_id`),
  KEY `FK_golf_statistics_leader_id__persons_id` (`leader_id`),
  CONSTRAINT `FK_golf_statistics_leader_id__persons_id` FOREIGN KEY (`leader_id`) REFERENCES `persons` (`id`),
  CONSTRAINT `FK_golf_statistics_person_id__persons_id` FOREIGN KEY (`person_id`) REFERENCES `persons` (`id`),
  CONSTRAINT `FK_golf_statistics_winner_id__persons_id` FOREIGN KEY (`winner_id`) REFERENCES `persons` (`id`),
  CONSTRAINT `CHK_no_of_eagles` CHECK (`no_of_eagles` >= 0),
  CONSTRAINT `CHK_no_of_birdies` CHECK (`no_of_birdies` >= 0),
  CONSTRAINT `CHK_no_of_bogeys` CHECK (`no_of_bogeys` >= 0),
  CONSTRAINT `CHK_no_of_double_bogeys` CHECK (`no_of_double_bogeys` >= 0),
  CONSTRAINT `CHK_max_drive` CHECK (`max_drive` >= 0),
  CONSTRAINT `CHK_top10_cnt` CHECK (`top10_cnt` >= 0),
  CONSTRAINT `CHK_win_cnt` CHECK (`win_cnt` >= 0),
  CONSTRAINT `CHK_position` CHECK (`position` >= 0)
) ENGINE=InnoDB AUTO_INCREMENT=201 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `golf_statistics`
--

LOCK TABLES `golf_statistics` WRITE;
/*!40000 ALTER TABLE `golf_statistics` DISABLE KEYS */;
INSERT INTO `golf_statistics` VALUES (1,'rounds',1,7,NULL,NULL,1,1,NULL,NULL,0,0,1,4,16.67,NULL,5,NULL,1),(2,'rounds',1,6,NULL,NULL,1,1,NULL,NULL,0,1,0,2,34.00,NULL,5,NULL,2),(3,'rounds',1,4,NULL,NULL,1,1,NULL,NULL,1,0,1,0,43.33,NULL,5,NULL,3),(4,'rounds',1,10,NULL,NULL,1,1,NULL,NULL,0,0,1,2,17.25,NULL,5,NULL,4),(5,'rounds',1,9,NULL,NULL,1,1,NULL,NULL,0,1,0,2,25.00,NULL,5,NULL,5),(6,'rounds',1,2,NULL,NULL,1,1,NULL,NULL,0,1,1,0,60.00,NULL,5,NULL,6),(7,'rounds',1,3,NULL,NULL,1,1,NULL,NULL,0,2,1,0,28.33,NULL,5,NULL,7),(8,'rounds',1,5,NULL,NULL,1,1,NULL,NULL,0,0,0,0,14.57,NULL,6,NULL,8),(9,'rounds',1,8,NULL,NULL,1,1,NULL,NULL,0,0,0,2,21.75,NULL,6,NULL,9),(10,'rounds',1,1,NULL,NULL,1,1,NULL,NULL,0,0,0,0,17.25,NULL,6,NULL,10),(11,'rounds',2,10,NULL,NULL,1,1,NULL,NULL,0,0,2,1,26.00,NULL,5,NULL,1),(12,'rounds',2,4,NULL,NULL,1,1,NULL,NULL,1,0,0,1,130.00,NULL,5,NULL,2),(13,'rounds',2,5,NULL,NULL,1,1,NULL,NULL,0,2,0,1,32.50,NULL,5,NULL,3),(14,'rounds',2,3,NULL,NULL,1,1,NULL,NULL,0,0,1,1,85.00,NULL,5,NULL,4),(15,'rounds',2,1,NULL,NULL,1,1,NULL,NULL,0,0,1,3,21.50,NULL,5,NULL,5),(16,'rounds',2,7,NULL,NULL,1,1,NULL,NULL,0,0,1,0,13.50,NULL,6,NULL,6),(17,'rounds',2,8,NULL,NULL,1,1,NULL,NULL,0,0,0,2,17.00,NULL,6,NULL,7),(18,'rounds',2,2,NULL,NULL,1,1,NULL,NULL,0,0,0,1,20.00,NULL,6,NULL,8),(19,'rounds',2,9,NULL,NULL,1,1,NULL,NULL,0,0,0,1,18.57,NULL,6,NULL,9),(20,'rounds',2,6,NULL,NULL,1,1,NULL,NULL,0,0,1,0,18.00,NULL,6,NULL,10),(21,'rounds',3,2,NULL,NULL,1,1,NULL,NULL,1,0,0,4,86.00,NULL,4,NULL,1),(22,'rounds',3,8,NULL,NULL,1,1,NULL,NULL,0,0,1,2,21.60,NULL,5,NULL,2),(23,'rounds',3,10,NULL,NULL,1,1,NULL,NULL,0,0,0,1,21.25,NULL,5,NULL,3),(24,'rounds',3,6,NULL,NULL,1,1,NULL,NULL,0,1,1,1,21.67,NULL,5,NULL,4),(25,'rounds',3,1,NULL,NULL,1,1,NULL,NULL,0,0,0,0,87.00,NULL,5,NULL,5),(26,'rounds',3,7,NULL,NULL,1,1,NULL,NULL,0,1,1,0,23.00,NULL,6,NULL,6),(27,'rounds',3,3,NULL,NULL,1,1,NULL,NULL,0,0,1,1,18.57,NULL,6,NULL,7),(28,'rounds',3,5,NULL,NULL,1,1,NULL,NULL,0,0,0,1,16.00,NULL,6,NULL,8),(29,'rounds',3,9,NULL,NULL,1,1,NULL,NULL,0,0,1,0,16.50,NULL,6,NULL,9),(30,'rounds',3,4,NULL,NULL,1,1,NULL,NULL,0,0,0,2,15.43,NULL,6,NULL,10),(31,'rounds',4,5,NULL,NULL,1,1,NULL,NULL,0,3,1,1,35.33,NULL,4,NULL,1),(32,'rounds',4,10,NULL,NULL,1,1,NULL,NULL,0,0,1,2,106.00,NULL,4,NULL,2),(33,'rounds',4,1,NULL,NULL,1,1,NULL,NULL,0,0,2,2,28.67,NULL,4,NULL,3),(34,'rounds',4,3,NULL,NULL,1,1,NULL,NULL,0,0,1,2,100.00,NULL,5,NULL,4),(35,'rounds',4,9,NULL,NULL,1,1,NULL,NULL,0,1,0,5,17.00,NULL,5,NULL,5),(36,'rounds',4,7,NULL,NULL,1,1,NULL,NULL,0,0,1,1,24.50,NULL,5,NULL,6),(37,'rounds',4,8,NULL,NULL,1,1,NULL,NULL,0,1,0,1,24.75,NULL,6,NULL,7),(38,'rounds',4,2,NULL,NULL,1,1,NULL,NULL,1,0,0,0,43.33,NULL,6,NULL,8),(39,'rounds',4,6,NULL,NULL,1,1,NULL,NULL,0,1,0,2,18.57,NULL,6,NULL,9),(40,'rounds',4,4,NULL,NULL,1,1,NULL,NULL,0,0,0,0,14.50,NULL,6,NULL,10),(41,'rounds',5,2,NULL,NULL,1,1,NULL,NULL,1,0,1,2,36.33,NULL,4,NULL,1),(42,'rounds',5,1,NULL,NULL,1,1,NULL,NULL,0,1,1,1,40.00,NULL,5,NULL,2),(43,'rounds',5,10,NULL,NULL,1,1,NULL,NULL,0,0,0,3,27.00,NULL,5,NULL,3),(44,'rounds',5,6,NULL,NULL,1,1,NULL,NULL,0,1,1,1,29.00,NULL,5,NULL,4),(45,'rounds',5,3,NULL,NULL,1,1,NULL,NULL,1,0,1,0,36.33,NULL,5,NULL,5),(46,'rounds',5,9,NULL,NULL,1,1,NULL,NULL,0,0,2,2,22.75,NULL,5,NULL,6),(47,'rounds',5,5,NULL,NULL,1,1,NULL,NULL,0,1,1,0,29.33,NULL,5,NULL,7),(48,'rounds',5,7,NULL,NULL,1,1,NULL,NULL,0,0,1,2,30.00,NULL,6,NULL,8),(49,'rounds',5,8,NULL,NULL,1,1,NULL,NULL,0,0,0,0,16.67,NULL,6,NULL,9),(50,'rounds',5,4,NULL,NULL,1,1,NULL,NULL,0,1,0,1,27.67,NULL,6,NULL,10),(51,'rounds',6,4,NULL,NULL,1,1,NULL,NULL,0,1,0,0,33.33,NULL,5,NULL,1),(52,'rounds',6,1,NULL,NULL,1,1,NULL,NULL,0,0,0,3,25.00,NULL,5,NULL,2),(53,'rounds',6,3,NULL,NULL,1,1,NULL,NULL,0,1,1,1,26.33,NULL,5,NULL,3),(54,'rounds',6,2,NULL,NULL,1,1,NULL,NULL,0,1,0,1,27.25,NULL,5,NULL,4),(55,'rounds',6,5,NULL,NULL,1,1,NULL,NULL,0,0,0,1,30.33,NULL,5,NULL,5),(56,'rounds',6,7,NULL,NULL,1,1,NULL,NULL,0,1,1,2,29.33,NULL,5,NULL,6),(57,'rounds',6,9,NULL,NULL,1,1,NULL,NULL,0,0,0,0,22.75,NULL,6,NULL,7),(58,'rounds',6,8,NULL,NULL,1,1,NULL,NULL,0,0,0,1,16.67,NULL,6,NULL,8),(59,'rounds',6,10,NULL,NULL,1,1,NULL,NULL,0,0,1,0,25.00,NULL,6,NULL,9),(60,'rounds',6,6,NULL,NULL,1,1,NULL,NULL,0,0,0,0,150.00,NULL,6,NULL,10),(61,'rounds',7,10,NULL,NULL,1,1,NULL,NULL,0,0,0,3,37.50,NULL,5,NULL,1),(62,'rounds',7,9,NULL,NULL,1,1,NULL,NULL,0,0,2,1,25.00,NULL,5,NULL,2),(63,'rounds',7,1,NULL,NULL,1,1,NULL,NULL,0,0,0,0,79.00,NULL,5,NULL,3),(64,'rounds',7,6,NULL,NULL,1,1,NULL,NULL,1,0,0,0,36.33,NULL,5,NULL,4),(65,'rounds',7,2,NULL,NULL,1,1,NULL,NULL,1,0,0,2,40.00,NULL,6,NULL,5),(66,'rounds',7,7,NULL,NULL,1,1,NULL,NULL,0,0,0,0,21.50,NULL,6,NULL,6),(67,'rounds',7,8,NULL,NULL,1,1,NULL,NULL,0,0,0,0,21.80,NULL,6,NULL,7),(68,'rounds',7,3,NULL,NULL,1,1,NULL,NULL,0,0,0,2,21.43,NULL,6,NULL,8),(69,'rounds',7,4,NULL,NULL,1,1,NULL,NULL,0,0,0,0,22.00,NULL,6,NULL,9),(70,'rounds',7,5,NULL,NULL,1,1,NULL,NULL,0,1,0,1,29.33,NULL,6,NULL,10),(71,'rounds',8,10,NULL,NULL,1,1,NULL,NULL,0,2,1,1,37.50,NULL,4,NULL,1),(72,'rounds',8,3,NULL,NULL,1,1,NULL,NULL,0,0,0,3,22.75,NULL,5,NULL,2),(73,'rounds',8,1,NULL,NULL,1,1,NULL,NULL,0,1,0,3,27.25,NULL,5,NULL,3),(74,'rounds',8,8,NULL,NULL,1,1,NULL,NULL,0,0,1,1,21.43,NULL,5,NULL,4),(75,'rounds',8,9,NULL,NULL,1,1,NULL,NULL,0,0,0,1,22.00,NULL,5,NULL,5),(76,'rounds',8,4,NULL,NULL,1,1,NULL,NULL,0,0,2,0,24.50,NULL,5,NULL,6),(77,'rounds',8,7,NULL,NULL,1,1,NULL,NULL,0,1,1,1,29.33,NULL,6,NULL,7),(78,'rounds',8,6,NULL,NULL,1,1,NULL,NULL,1,0,0,0,40.33,NULL,6,NULL,8),(79,'rounds',8,5,NULL,NULL,1,1,NULL,NULL,0,1,0,0,50.00,NULL,6,NULL,9),(80,'rounds',8,2,NULL,NULL,1,1,NULL,NULL,0,0,0,2,14.17,NULL,7,NULL,10),(81,'rounds',9,7,NULL,NULL,1,1,NULL,NULL,0,2,1,2,93.33,NULL,3,NULL,1),(82,'rounds',9,8,NULL,NULL,1,1,NULL,NULL,0,0,1,2,70.00,NULL,4,NULL,2),(83,'rounds',9,2,NULL,NULL,1,1,NULL,NULL,0,0,0,2,50.91,NULL,5,NULL,3),(84,'rounds',9,9,NULL,NULL,1,1,NULL,NULL,1,0,0,1,70.00,NULL,5,NULL,4),(85,'rounds',9,6,NULL,NULL,1,1,NULL,NULL,1,0,1,0,62.22,NULL,5,NULL,5),(86,'rounds',9,4,NULL,NULL,1,1,NULL,NULL,0,0,0,0,62.22,NULL,6,NULL,6),(87,'rounds',9,1,NULL,NULL,1,1,NULL,NULL,0,1,0,1,80.00,NULL,6,NULL,7),(88,'rounds',9,3,NULL,NULL,1,1,NULL,NULL,0,0,0,1,116.00,NULL,6,NULL,8),(89,'rounds',9,10,NULL,NULL,1,1,NULL,NULL,0,0,0,1,50.91,NULL,6,NULL,9),(90,'rounds',9,5,NULL,NULL,1,1,NULL,NULL,0,0,0,0,70.00,NULL,6,NULL,10),(91,'rounds',10,5,NULL,NULL,1,1,NULL,NULL,1,1,0,2,70.00,NULL,5,NULL,1),(92,'rounds',10,3,NULL,NULL,1,1,NULL,NULL,0,0,0,1,93.33,NULL,5,NULL,2),(93,'rounds',10,8,NULL,NULL,1,1,NULL,NULL,0,0,1,0,125.00,NULL,5,NULL,3),(94,'rounds',10,7,NULL,NULL,1,1,NULL,NULL,0,1,0,3,50.91,NULL,5,NULL,4),(95,'rounds',10,9,NULL,NULL,1,1,NULL,NULL,0,0,1,2,62.22,NULL,5,NULL,5),(96,'rounds',10,1,NULL,NULL,1,1,NULL,NULL,0,2,0,2,56.00,NULL,5,NULL,6),(97,'rounds',10,6,NULL,NULL,1,1,NULL,NULL,0,0,0,0,56.00,NULL,6,NULL,7),(98,'rounds',10,10,NULL,NULL,1,1,NULL,NULL,0,0,0,3,56.00,NULL,6,NULL,8),(99,'rounds',10,4,NULL,NULL,1,1,NULL,NULL,0,0,0,1,56.00,NULL,6,NULL,9),(100,'rounds',10,2,NULL,NULL,1,1,NULL,NULL,0,0,0,1,93.33,NULL,6,NULL,10),(101,'rounds',11,9,NULL,NULL,1,1,NULL,NULL,0,0,1,1,56.00,NULL,5,NULL,1),(102,'rounds',11,7,NULL,NULL,1,1,NULL,NULL,1,1,0,0,70.00,NULL,5,NULL,2),(103,'rounds',11,4,NULL,NULL,1,1,NULL,NULL,0,0,1,0,62.22,NULL,5,NULL,3),(104,'rounds',11,3,NULL,NULL,1,1,NULL,NULL,0,0,1,2,46.67,NULL,5,NULL,4),(105,'rounds',11,1,NULL,NULL,1,1,NULL,NULL,0,2,2,0,62.22,NULL,5,NULL,5),(106,'rounds',11,5,NULL,NULL,1,1,NULL,NULL,0,1,0,2,56.00,NULL,5,NULL,6),(107,'rounds',11,8,NULL,NULL,1,1,NULL,NULL,0,0,0,2,70.00,NULL,6,NULL,7),(108,'rounds',11,6,NULL,NULL,1,1,NULL,NULL,0,0,1,1,62.22,NULL,6,NULL,8),(109,'rounds',11,10,NULL,NULL,1,1,NULL,NULL,0,0,1,0,93.33,NULL,6,NULL,9),(110,'rounds',11,2,NULL,NULL,1,1,NULL,NULL,0,0,1,2,50.91,NULL,6,NULL,10),(111,'rounds',12,9,NULL,NULL,1,1,NULL,NULL,0,0,1,2,116.00,NULL,4,NULL,1),(112,'rounds',12,5,NULL,NULL,1,1,NULL,NULL,1,0,1,0,56.00,NULL,4,NULL,2),(113,'rounds',12,4,NULL,NULL,1,1,NULL,NULL,0,2,0,1,140.00,NULL,5,NULL,3),(114,'rounds',12,8,NULL,NULL,1,1,NULL,NULL,2,0,0,1,186.67,NULL,5,NULL,4),(115,'rounds',12,6,NULL,NULL,1,1,NULL,NULL,0,1,3,0,50.91,NULL,5,NULL,5),(116,'rounds',12,2,NULL,NULL,1,1,NULL,NULL,0,1,0,2,66.00,NULL,5,NULL,6),(117,'rounds',12,10,NULL,NULL,1,1,NULL,NULL,0,1,0,0,56.00,NULL,6,NULL,7),(118,'rounds',12,7,NULL,NULL,1,1,NULL,NULL,0,0,2,2,46.67,NULL,6,NULL,8),(119,'rounds',12,1,NULL,NULL,1,1,NULL,NULL,0,1,0,0,50.91,NULL,6,NULL,9),(120,'rounds',12,3,NULL,NULL,1,1,NULL,NULL,0,1,0,1,140.00,NULL,6,NULL,10),(121,'rounds',13,10,NULL,NULL,1,1,NULL,NULL,0,2,0,2,29.75,NULL,5,NULL,1),(122,'rounds',13,1,NULL,NULL,1,1,NULL,NULL,0,0,2,0,26.50,NULL,5,NULL,2),(123,'rounds',13,6,NULL,NULL,1,1,NULL,NULL,0,0,1,0,21.60,NULL,5,NULL,3),(124,'rounds',13,3,NULL,NULL,1,1,NULL,NULL,0,0,0,2,30.25,NULL,5,NULL,4),(125,'rounds',13,2,NULL,NULL,1,1,NULL,NULL,0,0,2,1,25.75,NULL,5,NULL,5),(126,'rounds',13,5,NULL,NULL,1,1,NULL,NULL,0,0,2,1,20.60,NULL,6,NULL,6),(127,'rounds',13,4,NULL,NULL,1,1,NULL,NULL,0,1,0,2,46.67,NULL,6,NULL,7),(128,'rounds',13,9,NULL,NULL,1,1,NULL,NULL,0,0,0,1,17.67,NULL,6,NULL,8),(129,'rounds',13,8,NULL,NULL,1,1,NULL,NULL,0,0,0,0,27.00,NULL,6,NULL,9),(130,'rounds',13,7,NULL,NULL,1,1,NULL,NULL,0,0,0,1,15.57,NULL,6,NULL,10),(131,'rounds',14,8,NULL,NULL,1,1,NULL,NULL,0,2,1,3,103.00,NULL,4,NULL,1),(132,'rounds',14,7,NULL,NULL,1,1,NULL,NULL,0,2,1,0,104.00,NULL,4,NULL,2),(133,'rounds',14,10,NULL,NULL,1,1,NULL,NULL,0,1,0,1,106.00,NULL,5,NULL,3),(134,'rounds',14,2,NULL,NULL,1,1,NULL,NULL,1,0,0,1,36.33,NULL,5,NULL,4),(135,'rounds',14,9,NULL,NULL,1,1,NULL,NULL,0,0,1,0,20.17,NULL,5,NULL,5),(136,'rounds',14,4,NULL,NULL,1,1,NULL,NULL,0,1,1,0,27.25,NULL,6,NULL,6),(137,'rounds',14,1,NULL,NULL,1,1,NULL,NULL,0,0,0,1,24.20,NULL,6,NULL,7),(138,'rounds',14,6,NULL,NULL,1,1,NULL,NULL,0,0,1,2,20.17,NULL,6,NULL,8),(139,'rounds',14,5,NULL,NULL,1,1,NULL,NULL,0,0,1,0,20.80,NULL,6,NULL,9),(140,'rounds',14,3,NULL,NULL,1,1,NULL,NULL,0,0,1,0,17.75,NULL,7,NULL,10),(141,'rounds',15,8,NULL,NULL,1,1,NULL,NULL,1,1,0,1,36.33,NULL,5,NULL,1),(142,'rounds',15,1,NULL,NULL,1,1,NULL,NULL,0,0,0,2,22.25,NULL,5,NULL,2),(143,'rounds',15,6,NULL,NULL,1,1,NULL,NULL,0,0,1,0,23.33,NULL,5,NULL,3),(144,'rounds',15,2,NULL,NULL,1,1,NULL,NULL,0,0,0,0,22.25,NULL,5,NULL,4),(145,'rounds',15,7,NULL,NULL,1,1,NULL,NULL,0,2,0,0,27.00,NULL,5,NULL,5),(146,'rounds',15,10,NULL,NULL,1,1,NULL,NULL,0,1,1,2,35.33,NULL,6,NULL,6),(147,'rounds',15,5,NULL,NULL,1,1,NULL,NULL,0,0,1,1,17.50,NULL,6,NULL,7),(148,'rounds',15,3,NULL,NULL,1,1,NULL,NULL,0,0,0,2,20.17,NULL,6,NULL,8),(149,'rounds',15,4,NULL,NULL,1,1,NULL,NULL,0,0,1,1,17.00,NULL,6,NULL,9),(150,'rounds',15,9,NULL,NULL,1,1,NULL,NULL,0,0,1,0,16.75,NULL,6,NULL,10),(151,'rounds',16,10,NULL,NULL,1,1,NULL,NULL,1,0,0,3,39.67,NULL,5,NULL,1),(152,'rounds',16,7,NULL,NULL,1,1,NULL,NULL,1,0,2,0,103.00,NULL,5,NULL,2),(153,'rounds',16,5,NULL,NULL,1,1,NULL,NULL,0,1,2,1,35.33,NULL,5,NULL,3),(154,'rounds',16,6,NULL,NULL,1,1,NULL,NULL,0,0,1,1,24.20,NULL,5,NULL,4),(155,'rounds',16,9,NULL,NULL,1,1,NULL,NULL,0,0,0,0,27.00,NULL,6,NULL,5),(156,'rounds',16,4,NULL,NULL,1,1,NULL,NULL,0,0,0,0,25.75,NULL,6,NULL,6),(157,'rounds',16,2,NULL,NULL,1,1,NULL,NULL,0,0,1,1,18.00,NULL,6,NULL,7),(158,'rounds',16,1,NULL,NULL,1,1,NULL,NULL,0,0,1,1,17.75,NULL,6,NULL,8),(159,'rounds',16,3,NULL,NULL,1,1,NULL,NULL,0,0,1,1,22.33,NULL,6,NULL,9),(160,'rounds',16,8,NULL,NULL,1,1,NULL,NULL,1,0,0,0,70.00,NULL,6,NULL,10),(161,'rounds',17,10,NULL,NULL,1,1,NULL,NULL,1,1,2,2,512.00,NULL,4,NULL,1),(162,'rounds',17,5,NULL,NULL,1,1,NULL,NULL,0,1,0,3,64.00,NULL,5,NULL,2),(163,'rounds',17,1,NULL,NULL,1,1,NULL,NULL,0,0,0,1,110.00,NULL,5,NULL,3),(164,'rounds',17,4,NULL,NULL,1,1,NULL,NULL,0,1,1,2,160.00,NULL,5,NULL,4),(165,'rounds',17,9,NULL,NULL,1,1,NULL,NULL,0,2,1,0,128.00,NULL,5,NULL,5),(166,'rounds',17,7,NULL,NULL,1,1,NULL,NULL,0,0,0,0,42.67,NULL,6,NULL,6),(167,'rounds',17,6,NULL,NULL,1,1,NULL,NULL,0,0,2,0,51.20,NULL,6,NULL,7),(168,'rounds',17,3,NULL,NULL,1,1,NULL,NULL,0,0,0,3,46.55,NULL,6,NULL,8),(169,'rounds',17,2,NULL,NULL,1,1,NULL,NULL,0,0,1,0,45.50,NULL,7,NULL,9),(170,'rounds',17,8,NULL,NULL,1,1,NULL,NULL,0,0,0,0,51.20,NULL,7,NULL,10),(171,'rounds',18,6,NULL,NULL,1,1,NULL,NULL,0,2,1,0,160.00,NULL,5,NULL,1),(172,'rounds',18,4,NULL,NULL,1,1,NULL,NULL,0,1,0,1,64.00,NULL,5,NULL,2),(173,'rounds',18,9,NULL,NULL,1,1,NULL,NULL,0,1,4,0,51.20,NULL,5,NULL,3),(174,'rounds',18,3,NULL,NULL,1,1,NULL,NULL,0,0,0,1,90.00,NULL,5,NULL,4),(175,'rounds',18,1,NULL,NULL,1,1,NULL,NULL,0,1,1,1,56.89,NULL,5,NULL,5),(176,'rounds',18,2,NULL,NULL,1,1,NULL,NULL,0,0,1,1,51.20,NULL,6,NULL,6),(177,'rounds',18,5,NULL,NULL,1,1,NULL,NULL,0,1,0,2,42.67,NULL,6,NULL,7),(178,'rounds',18,10,NULL,NULL,1,1,NULL,NULL,0,0,1,2,85.33,NULL,6,NULL,8),(179,'rounds',18,7,NULL,NULL,1,1,NULL,NULL,0,0,0,1,73.14,NULL,6,NULL,9),(180,'rounds',18,8,NULL,NULL,1,1,NULL,NULL,0,0,1,1,56.89,NULL,6,NULL,10),(181,'rounds',19,3,NULL,NULL,1,1,NULL,NULL,1,0,0,1,170.67,NULL,4,NULL,1),(182,'rounds',19,9,NULL,NULL,1,1,NULL,NULL,0,2,1,1,46.55,NULL,5,NULL,2),(183,'rounds',19,1,NULL,NULL,1,1,NULL,NULL,0,0,2,1,56.89,NULL,5,NULL,3),(184,'rounds',19,10,NULL,NULL,1,1,NULL,NULL,0,0,2,1,51.20,NULL,5,NULL,4),(185,'rounds',19,6,NULL,NULL,1,1,NULL,NULL,0,1,0,3,102.40,NULL,6,NULL,5),(186,'rounds',19,2,NULL,NULL,1,1,NULL,NULL,0,1,0,1,56.89,NULL,6,NULL,6),(187,'rounds',19,7,NULL,NULL,1,1,NULL,NULL,0,0,0,4,51.20,NULL,6,NULL,7),(188,'rounds',19,4,NULL,NULL,1,1,NULL,NULL,0,0,0,0,56.89,NULL,6,NULL,8),(189,'rounds',19,5,NULL,NULL,1,1,NULL,NULL,0,0,0,0,46.55,NULL,6,NULL,9),(190,'rounds',19,8,NULL,NULL,1,1,NULL,NULL,0,0,0,0,46.55,NULL,7,NULL,10),(191,'rounds',20,1,NULL,NULL,1,1,NULL,NULL,0,1,1,0,45.50,NULL,5,NULL,1),(192,'rounds',20,10,NULL,NULL,1,1,NULL,NULL,1,0,0,1,56.89,NULL,6,NULL,2),(193,'rounds',20,8,NULL,NULL,1,1,NULL,NULL,0,1,0,0,42.67,NULL,6,NULL,3),(194,'rounds',20,3,NULL,NULL,1,1,NULL,NULL,0,1,0,1,46.55,NULL,6,NULL,4),(195,'rounds',20,7,NULL,NULL,1,1,NULL,NULL,0,1,1,0,60.67,NULL,6,NULL,5),(196,'rounds',20,4,NULL,NULL,1,1,NULL,NULL,0,1,0,0,86.00,NULL,6,NULL,6),(197,'rounds',20,2,NULL,NULL,1,1,NULL,NULL,0,2,0,0,56.89,NULL,6,NULL,7),(198,'rounds',20,6,NULL,NULL,1,1,NULL,NULL,0,0,1,0,56.89,NULL,7,NULL,8),(199,'rounds',20,9,NULL,NULL,1,1,NULL,NULL,0,0,0,1,46.55,NULL,7,NULL,9),(200,'rounds',20,5,NULL,NULL,1,1,NULL,NULL,0,0,0,0,51.20,NULL,7,NULL,10);
/*!40000 ALTER TABLE `golf_statistics` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `holes`
--

DROP TABLE IF EXISTS `holes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `holes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `hole_no` int(2) NOT NULL,
  `site_id` int(11) NOT NULL,
  `par` int(2) NOT NULL,
  `length` decimal(10,2) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `hole_no` (`hole_no`,`site_id`),
  KEY `site_id` (`site_id`),
  CONSTRAINT `holes_ibfk_1` FOREIGN KEY (`site_id`) REFERENCES `sites` (`id`),
  CONSTRAINT `CHK_hole_no` CHECK (`hole_no` > 0),
  CONSTRAINT `CHK_par` CHECK (`par` > 0),
  CONSTRAINT `CHK_length` CHECK (`length` > 0)
) ENGINE=InnoDB AUTO_INCREMENT=91 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `holes`
--

LOCK TABLES `holes` WRITE;
/*!40000 ALTER TABLE `holes` DISABLE KEYS */;
INSERT INTO `holes` VALUES (1,1,1,5,512.00),(2,2,1,3,182.00),(3,3,1,4,89.00),(4,4,1,3,79.00),(5,5,1,4,80.00),(6,6,1,4,88.00),(7,7,1,4,86.00),(8,8,1,3,84.00),(9,9,1,4,90.00),(10,10,1,4,99.00),(11,11,1,4,70.00),(12,12,1,4,73.00),(13,13,1,4,86.00),(14,14,1,5,110.00),(15,15,1,5,119.00),(16,16,1,5,123.00),(17,17,1,5,140.00),(18,18,1,5,160.00),(19,1,2,3,62.00),(20,2,2,4,88.00),(21,3,2,4,84.00),(22,4,2,4,98.00),(23,5,2,4,100.00),(24,6,2,4,87.00),(25,7,2,4,86.00),(26,8,2,4,83.00),(27,9,2,4,85.00),(28,10,2,3,91.00),(29,11,2,4,79.00),(30,12,2,3,81.00),(31,13,2,3,70.00),(32,14,2,4,91.00),(33,15,2,5,121.00),(34,16,2,5,109.00),(35,17,2,5,120.00),(36,18,2,5,150.00),(37,1,3,3,59.00),(38,2,3,4,96.00),(39,3,3,4,102.00),(40,4,3,4,83.00),(41,5,3,4,69.00),(42,6,3,3,58.00),(43,7,3,4,85.00),(44,8,3,4,86.00),(45,9,3,3,58.00),(46,10,3,3,60.00),(47,11,3,4,87.00),(48,12,3,4,78.00),(49,13,3,4,98.00),(50,14,3,4,100.00),(51,15,3,5,106.00),(52,16,3,5,99.00),(53,17,3,5,108.00),(54,18,3,5,130.00),(55,1,4,3,67.00),(56,2,4,3,68.00),(57,3,4,3,69.00),(58,4,4,3,70.00),(59,5,4,3,71.00),(60,6,4,3,72.00),(61,7,4,4,103.00),(62,8,4,4,104.00),(63,9,4,4,106.00),(64,10,4,4,108.00),(65,11,4,4,103.00),(66,12,4,4,89.00),(67,13,4,5,105.00),(68,14,4,5,108.00),(69,15,4,5,109.00),(70,16,4,5,119.00),(71,17,4,5,121.00),(72,18,4,5,140.00),(73,1,5,3,70.00),(74,2,5,3,68.00),(75,3,5,3,65.00),(76,4,5,3,66.00),(77,5,5,3,69.00),(78,6,5,3,60.00),(79,7,5,4,78.00),(80,8,5,4,79.00),(81,9,5,4,96.00),(82,10,5,4,98.00),(83,11,5,4,97.00),(84,12,5,4,93.00),(85,13,5,5,115.00),(86,14,5,5,116.00),(87,15,5,5,119.00),(88,16,5,5,125.00),(89,17,5,5,130.00),(90,18,5,2,560.00);
/*!40000 ALTER TABLE `holes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `injury_phases`
--

DROP TABLE IF EXISTS `injury_phases`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `injury_phases` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `person_id` int(11) NOT NULL,
  `injury_status` varchar(100) DEFAULT NULL,
  `injury_type` varchar(100) DEFAULT NULL,
  `injury_comment` varchar(100) DEFAULT NULL,
  `disabled_list` varchar(100) DEFAULT NULL,
  `start_date_time` datetime DEFAULT NULL,
  `end_date_time` datetime DEFAULT NULL,
  `season_id` int(11) DEFAULT NULL,
  `phase_type` varchar(100) DEFAULT NULL,
  `injury_side` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_FK_inj_pha_per_id__per_id` (`person_id`),
  KEY `IDX_FK_inj_pha_sea_id__sea_id` (`season_id`),
  KEY `IDX_injury_phases_2` (`injury_status`),
  KEY `IDX_injury_phases_3` (`start_date_time`),
  KEY `IDX_injury_phases_4` (`end_date_time`),
  CONSTRAINT `FK_inj_pha_per_id__per_id` FOREIGN KEY (`person_id`) REFERENCES `persons` (`id`),
  CONSTRAINT `FK_inj_pha_sea_id__sea_id` FOREIGN KEY (`season_id`) REFERENCES `seasons` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `injury_phases`
--

LOCK TABLES `injury_phases` WRITE;
/*!40000 ALTER TABLE `injury_phases` DISABLE KEYS */;
/*!40000 ALTER TABLE `injury_phases` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `key_aliases`
--

DROP TABLE IF EXISTS `key_aliases`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `key_aliases` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `key_id` int(11) NOT NULL,
  `key_root_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_key_roots_key_aliases` (`key_root_id`),
  KEY `IDX_key_aliases_2` (`key_id`),
  CONSTRAINT `FK_key_roots_key_aliases` FOREIGN KEY (`key_root_id`) REFERENCES `key_roots` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `key_aliases`
--

LOCK TABLES `key_aliases` WRITE;
/*!40000 ALTER TABLE `key_aliases` DISABLE KEYS */;
/*!40000 ALTER TABLE `key_aliases` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `key_roots`
--

DROP TABLE IF EXISTS `key_roots`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `key_roots` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `key_type` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_key_aliases_1` (`key_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `key_roots`
--

LOCK TABLES `key_roots` WRITE;
/*!40000 ALTER TABLE `key_roots` DISABLE KEYS */;
/*!40000 ALTER TABLE `key_roots` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `latest_revisions`
--

DROP TABLE IF EXISTS `latest_revisions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `latest_revisions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `revision_id` varchar(255) NOT NULL,
  `latest_document_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_FK_lat_rev_lat_doc_id__doc_id` (`latest_document_id`),
  KEY `IDX_latest_revisions_1` (`revision_id`),
  CONSTRAINT `FK_lat_rev_lat_doc_id__doc_id` FOREIGN KEY (`latest_document_id`) REFERENCES `documents` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `latest_revisions`
--

LOCK TABLES `latest_revisions` WRITE;
/*!40000 ALTER TABLE `latest_revisions` DISABLE KEYS */;
/*!40000 ALTER TABLE `latest_revisions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `locations`
--

DROP TABLE IF EXISTS `locations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `locations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `city` varchar(100) DEFAULT NULL,
  `state` varchar(100) DEFAULT NULL,
  `area` varchar(100) DEFAULT NULL,
  `country` varchar(100) DEFAULT NULL,
  `timezone` varchar(100) DEFAULT NULL,
  `latitude` varchar(100) DEFAULT NULL,
  `longitude` varchar(100) DEFAULT NULL,
  `country_code` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_locations_1` (`country_code`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `locations`
--

LOCK TABLES `locations` WRITE;
/*!40000 ALTER TABLE `locations` DISABLE KEYS */;
INSERT INTO `locations` VALUES (1,'Pretoria',NULL,NULL,'South Africa','UTC+2','-25.7313','28.2184',NULL),(2,'Tokyo',NULL,NULL,'Japan','UTC+9','35.6528','139.8395',NULL),(3,'Bogota',NULL,NULL,'Colombia','UTC-5','4.6243','-74.0636',NULL),(4,'Thun',NULL,NULL,'Switzerland','UTC+2','46.7484','7.6263',NULL),(5,'Addis Abbaba',NULL,NULL,'Ethiopia','UTC+3','9.0054','38.7636',NULL),(6,'Split',NULL,NULL,'Croatia','UTC+2','43.5081','16.4402',NULL),(7,'Auckland',NULL,NULL,'New Zealand','UTC+13','-36.8485','174.7633',NULL),(8,'Glasgow',NULL,NULL,'United Kingdom','UTC+0','-36.8485','174.7633',NULL),(9,'Moscow',NULL,NULL,'Russia','UTC+3','55.7512','37.6184',NULL),(10,'Ho Chi Minh City',NULL,NULL,'Vietnam','UTC+7','10.7626','106.6602',NULL),(11,'Riga',NULL,NULL,'Latvia','UTC+3','56.9463','24.1051',NULL),(12,'Tel Aviv',NULL,NULL,'Israel','UTC+3','34.8555','32.1093',NULL),(13,'Thessaloniki',NULL,NULL,'Greece','UTC+3','40.6293','22.9474',NULL),(14,'Minneapolis',NULL,NULL,'United States','UTC-5','44.9867','-93.2581',NULL),(15,'Valletta',NULL,NULL,'Malta','UTC+2','35.8963','14.5130',NULL),(16,'Manama',NULL,NULL,'Bahrain','UTC+3','26.2010','50.6070',NULL),(17,'Algiers',NULL,NULL,'Algeria','UTC+1','36.7372','3.0865',NULL),(18,'Valencia',NULL,NULL,'Spain','UTC+2','39.4667','-0.3750',NULL),(19,'Santo Domingo',NULL,NULL,'Dominican Republic','UTC-4','18.4834','-69.9296',NULL),(20,'Dublin',NULL,NULL,'Ireland','UTC+1','53.3501','-6.2665',NULL),(21,'Abu Dabi',NULL,NULL,'United Arab Emirates','UTC+4','24.4667','54.3667',NULL),(22,'Kyoto',NULL,NULL,'Japan','UTC+9','35.0117','135.7683',NULL),(23,'Ulaanbaatar',NULL,NULL,'Mongolia','UTC+8','47.9212','106.9186',NULL);
/*!40000 ALTER TABLE `locations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `media`
--

DROP TABLE IF EXISTS `media`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `media` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `object_id` int(11) DEFAULT NULL,
  `source_id` int(11) DEFAULT NULL,
  `revision_id` int(11) DEFAULT NULL,
  `media_type` varchar(100) DEFAULT NULL,
  `publisher_id` int(11) NOT NULL,
  `date_time` varchar(100) DEFAULT NULL,
  `credit_id` int(11) NOT NULL,
  `db_loading_date_time` datetime DEFAULT NULL,
  `creation_location_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_med_cre_id__per_id` (`credit_id`),
  KEY `FK_med_pub_id__pub_id` (`publisher_id`),
  KEY `FK_med_cre_loc_id__loc_id` (`creation_location_id`),
  CONSTRAINT `FK_med_cre_id__per_id` FOREIGN KEY (`credit_id`) REFERENCES `persons` (`id`),
  CONSTRAINT `FK_med_cre_loc_id__loc_id` FOREIGN KEY (`creation_location_id`) REFERENCES `locations` (`id`),
  CONSTRAINT `FK_med_pub_id__pub_id` FOREIGN KEY (`publisher_id`) REFERENCES `publishers` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `media`
--

LOCK TABLES `media` WRITE;
/*!40000 ALTER TABLE `media` DISABLE KEYS */;
/*!40000 ALTER TABLE `media` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `media_captions`
--

DROP TABLE IF EXISTS `media_captions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `media_captions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `media_id` int(11) NOT NULL,
  `caption_type` varchar(100) DEFAULT NULL,
  `caption` varchar(100) DEFAULT NULL,
  `caption_author_id` int(11) NOT NULL,
  `language` varchar(100) DEFAULT NULL,
  `caption_size` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_med_cap_med_id__med_id` (`media_id`),
  KEY `FK_med_cap_cap_aut_id__per_id` (`caption_author_id`),
  CONSTRAINT `FK_med_cap_cap_aut_id__per_id` FOREIGN KEY (`caption_author_id`) REFERENCES `persons` (`id`),
  CONSTRAINT `FK_med_cap_med_id__med_id` FOREIGN KEY (`media_id`) REFERENCES `media` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `media_captions`
--

LOCK TABLES `media_captions` WRITE;
/*!40000 ALTER TABLE `media_captions` DISABLE KEYS */;
/*!40000 ALTER TABLE `media_captions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `media_contents`
--

DROP TABLE IF EXISTS `media_contents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `media_contents` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `media_id` int(11) NOT NULL,
  `object` varchar(100) DEFAULT NULL,
  `format` varchar(100) DEFAULT NULL,
  `mime_type` varchar(100) DEFAULT NULL,
  `height` varchar(100) DEFAULT NULL,
  `width` varchar(100) DEFAULT NULL,
  `duration` varchar(100) DEFAULT NULL,
  `file_size` varchar(100) DEFAULT NULL,
  `resolution` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_med_con_med_id__med_id` (`media_id`),
  CONSTRAINT `FK_med_con_med_id__med_id` FOREIGN KEY (`media_id`) REFERENCES `media` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `media_contents`
--

LOCK TABLES `media_contents` WRITE;
/*!40000 ALTER TABLE `media_contents` DISABLE KEYS */;
/*!40000 ALTER TABLE `media_contents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `media_keywords`
--

DROP TABLE IF EXISTS `media_keywords`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `media_keywords` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `keyword` varchar(100) DEFAULT NULL,
  `media_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_med_key_med_id__med_id` (`media_id`),
  CONSTRAINT `FK_med_key_med_id__med_id` FOREIGN KEY (`media_id`) REFERENCES `media` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `media_keywords`
--

LOCK TABLES `media_keywords` WRITE;
/*!40000 ALTER TABLE `media_keywords` DISABLE KEYS */;
/*!40000 ALTER TABLE `media_keywords` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `outcome_totals`
--

DROP TABLE IF EXISTS `outcome_totals`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `outcome_totals` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `standing_subgroup_id` int(11) NOT NULL,
  `outcome_holder_type` varchar(100) DEFAULT NULL,
  `outcome_holder_id` int(11) DEFAULT NULL,
  `rank` varchar(100) DEFAULT NULL,
  `wins` varchar(100) DEFAULT NULL,
  `losses` varchar(100) DEFAULT NULL,
  `ties` varchar(100) DEFAULT NULL,
  `wins_overtime` int(11) DEFAULT NULL,
  `losses_overtime` int(11) DEFAULT NULL,
  `undecideds` varchar(100) DEFAULT NULL,
  `winning_percentage` varchar(100) DEFAULT NULL,
  `points_scored_for` varchar(100) DEFAULT NULL,
  `points_scored_against` varchar(100) DEFAULT NULL,
  `points_difference` varchar(100) DEFAULT NULL,
  `standing_points` varchar(100) DEFAULT NULL,
  `streak_type` varchar(100) DEFAULT NULL,
  `streak_duration` varchar(100) DEFAULT NULL,
  `streak_total` varchar(100) DEFAULT NULL,
  `streak_start` datetime DEFAULT NULL,
  `streak_end` datetime DEFAULT NULL,
  `events_played` int(11) DEFAULT NULL,
  `games_back` varchar(100) DEFAULT NULL,
  `result_effect` varchar(100) DEFAULT NULL,
  `sets_against` varchar(100) DEFAULT NULL,
  `sets_for` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_out_tot_sta_sub_id__sta_sub_id` (`standing_subgroup_id`),
  CONSTRAINT `FK_out_tot_sta_sub_id__sta_sub_id` FOREIGN KEY (`standing_subgroup_id`) REFERENCES `standing_subgroups` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `outcome_totals`
--

LOCK TABLES `outcome_totals` WRITE;
/*!40000 ALTER TABLE `outcome_totals` DISABLE KEYS */;
/*!40000 ALTER TABLE `outcome_totals` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `participants_events`
--

DROP TABLE IF EXISTS `participants_events`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `participants_events` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `participant_type` varchar(100) NOT NULL,
  `participant_id` int(11) NOT NULL,
  `event_id` int(11) NOT NULL,
  `alignment` varchar(100) DEFAULT NULL,
  `score` varchar(100) DEFAULT NULL,
  `event_outcome` varchar(100) DEFAULT NULL,
  `rank` int(11) DEFAULT NULL,
  `result_effect` varchar(100) DEFAULT NULL,
  `score_attempts` int(11) DEFAULT NULL,
  `sort_order` varchar(100) DEFAULT NULL,
  `score_type` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_FK_par_eve_eve_id__eve_id` (`event_id`),
  KEY `IDX_participants_events_1` (`participant_type`),
  KEY `IDX_participants_events_2` (`participant_id`),
  KEY `IDX_participants_events_3` (`alignment`),
  KEY `IDX_participants_events_4` (`event_outcome`),
  CONSTRAINT `FK_par_eve_eve_id__eve_id` FOREIGN KEY (`event_id`) REFERENCES `events` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `participants_events`
--

LOCK TABLES `participants_events` WRITE;
/*!40000 ALTER TABLE `participants_events` DISABLE KEYS */;
/*!40000 ALTER TABLE `participants_events` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `penalty_stats`
--

DROP TABLE IF EXISTS `penalty_stats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `penalty_stats` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `count` int(11) DEFAULT NULL,
  `type` varchar(100) DEFAULT NULL,
  `value` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `penalty_stats`
--

LOCK TABLES `penalty_stats` WRITE;
/*!40000 ALTER TABLE `penalty_stats` DISABLE KEYS */;
/*!40000 ALTER TABLE `penalty_stats` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `periods`
--

DROP TABLE IF EXISTS `periods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `periods` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `participant_event_id` int(11) NOT NULL,
  `period_value` varchar(100) DEFAULT NULL,
  `score` varchar(100) DEFAULT NULL,
  `score_attempts` int(11) DEFAULT NULL,
  `rank` varchar(100) DEFAULT NULL,
  `sub_score_key` varchar(100) DEFAULT NULL,
  `sub_score_type` varchar(100) DEFAULT NULL,
  `sub_score_name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_FK_per_par_eve_id__par_eve_id` (`participant_event_id`),
  CONSTRAINT `FK_per_par_eve_id__par_eve_id` FOREIGN KEY (`participant_event_id`) REFERENCES `participants_events` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `periods`
--

LOCK TABLES `periods` WRITE;
/*!40000 ALTER TABLE `periods` DISABLE KEYS */;
/*!40000 ALTER TABLE `periods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `person_event_metadata`
--

DROP TABLE IF EXISTS `person_event_metadata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `person_event_metadata` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `person_id` int(11) NOT NULL,
  `event_id` int(11) NOT NULL,
  `status` varchar(100) DEFAULT NULL,
  `health` varchar(100) DEFAULT NULL,
  `weight` varchar(100) DEFAULT NULL,
  `role_id` int(11) DEFAULT NULL,
  `position_id` int(11) DEFAULT NULL,
  `team_id` int(11) DEFAULT NULL,
  `lineup_slot` int(11) DEFAULT NULL,
  `lineup_slot_sequence` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_FK_per_eve_met_eve_id__eve_id` (`event_id`),
  KEY `IDX_FK_per_eve_met_per_id__per_id` (`person_id`),
  KEY `IDX_FK_per_eve_met_pos_id__pos_id` (`position_id`),
  KEY `IDX_FK_per_eve_met_rol_id__rol_id` (`role_id`),
  KEY `IDX_FK_teams_person_event_metadata` (`team_id`),
  KEY `IDX_person_event_metadata_1` (`status`),
  CONSTRAINT `FK_per_eve_met_eve_id__eve_id` FOREIGN KEY (`event_id`) REFERENCES `events` (`id`),
  CONSTRAINT `FK_per_eve_met_per_id__per_id` FOREIGN KEY (`person_id`) REFERENCES `persons` (`id`),
  CONSTRAINT `FK_per_eve_met_pos_id__pos_id` FOREIGN KEY (`position_id`) REFERENCES `positions` (`id`),
  CONSTRAINT `FK_per_eve_met_rol_id__rol_id` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`),
  CONSTRAINT `FK_per_eve_met_tea_id__tea_id` FOREIGN KEY (`team_id`) REFERENCES `teams` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `person_event_metadata`
--

LOCK TABLES `person_event_metadata` WRITE;
/*!40000 ALTER TABLE `person_event_metadata` DISABLE KEYS */;
/*!40000 ALTER TABLE `person_event_metadata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `person_phases`
--

DROP TABLE IF EXISTS `person_phases`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `person_phases` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `person_id` int(11) NOT NULL,
  `membership_type` varchar(40) NOT NULL,
  `membership_id` int(11) NOT NULL,
  `role_id` int(11) DEFAULT NULL,
  `role_status` varchar(40) DEFAULT NULL,
  `phase_status` varchar(40) DEFAULT NULL,
  `uniform_number` varchar(20) DEFAULT NULL,
  `regular_position_id` int(11) DEFAULT NULL,
  `regular_position_depth` varchar(40) DEFAULT NULL,
  `height` varchar(100) DEFAULT NULL,
  `weight` varchar(100) DEFAULT NULL,
  `start_date_time` datetime DEFAULT NULL,
  `start_season_id` int(11) DEFAULT NULL,
  `end_date_time` datetime DEFAULT NULL,
  `end_season_id` int(11) DEFAULT NULL,
  `entry_reason` varchar(40) DEFAULT NULL,
  `exit_reason` varchar(40) DEFAULT NULL,
  `selection_level` int(11) DEFAULT NULL,
  `selection_sublevel` int(11) DEFAULT NULL,
  `selection_overall` int(11) DEFAULT NULL,
  `duration` varchar(32) DEFAULT NULL,
  `phase_type` varchar(40) DEFAULT NULL,
  `subphase_type` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_per_pha_rol_id__rol_id` (`role_id`),
  KEY `FK_per_pha_sta_sea_id__sea_id` (`start_season_id`),
  KEY `FK_per_pha_end_sea_id__sea_id` (`end_season_id`),
  KEY `IDX_FK_per_pha_per_id__per_id` (`person_id`),
  KEY `IDX_FK_per_pha_reg_pos_id__pos_id` (`regular_position_id`),
  KEY `IDX_person_phases_1` (`membership_type`),
  KEY `IDX_person_phases_2` (`membership_id`),
  KEY `IDX_person_phases_3` (`phase_status`),
  CONSTRAINT `FK_per_pha_end_sea_id__sea_id` FOREIGN KEY (`end_season_id`) REFERENCES `seasons` (`id`),
  CONSTRAINT `FK_per_pha_per_id__per_id` FOREIGN KEY (`person_id`) REFERENCES `persons` (`id`),
  CONSTRAINT `FK_per_pha_reg_pos_id__pos_id` FOREIGN KEY (`regular_position_id`) REFERENCES `positions` (`id`),
  CONSTRAINT `FK_per_pha_rol_id__rol_id` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`),
  CONSTRAINT `FK_per_pha_sta_sea_id__sea_id` FOREIGN KEY (`start_season_id`) REFERENCES `seasons` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `person_phases`
--

LOCK TABLES `person_phases` WRITE;
/*!40000 ALTER TABLE `person_phases` DISABLE KEYS */;
/*!40000 ALTER TABLE `person_phases` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `persons`
--

DROP TABLE IF EXISTS `persons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `persons` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `person_key` varchar(100) NOT NULL,
  `publisher_id` int(11) NOT NULL,
  `gender` varchar(20) DEFAULT NULL,
  `birth_date` varchar(30) DEFAULT NULL,
  `death_date` varchar(30) DEFAULT NULL,
  `final_resting_location_id` int(11) DEFAULT NULL,
  `birth_location_id` int(11) DEFAULT NULL,
  `hometown_location_id` int(11) DEFAULT NULL,
  `residence_location_id` int(11) DEFAULT NULL,
  `death_location_id` int(11) DEFAULT NULL,
  `age` int(4) NOT NULL,
  `handicap` int(4) NOT NULL,
  `affiliation_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_persons_final_resting_location_id_locations_id` (`final_resting_location_id`),
  KEY `FK_per_bir_loc_id__loc_id` (`birth_location_id`),
  KEY `FK_per_dea_loc_id__loc_id` (`death_location_id`),
  KEY `FK_per_res_loc_id__loc_id` (`residence_location_id`),
  KEY `FK_per_hom_loc_id__loc_id` (`hometown_location_id`),
  KEY `IDX_FK_per_pub_id__pub_id` (`publisher_id`),
  KEY `IDX_persons_1` (`person_key`),
  KEY `FK_persons_aff_id__aff_id` (`affiliation_id`),
  CONSTRAINT `FK_per_bir_loc_id__loc_id` FOREIGN KEY (`birth_location_id`) REFERENCES `locations` (`id`),
  CONSTRAINT `FK_per_dea_loc_id__loc_id` FOREIGN KEY (`death_location_id`) REFERENCES `locations` (`id`),
  CONSTRAINT `FK_per_hom_loc_id__loc_id` FOREIGN KEY (`hometown_location_id`) REFERENCES `locations` (`id`),
  CONSTRAINT `FK_per_pub_id__pub_id` FOREIGN KEY (`publisher_id`) REFERENCES `publishers` (`id`),
  CONSTRAINT `FK_per_res_loc_id__loc_id` FOREIGN KEY (`residence_location_id`) REFERENCES `locations` (`id`),
  CONSTRAINT `FK_persons_aff_id__aff_id` FOREIGN KEY (`affiliation_id`) REFERENCES `affiliations` (`id`),
  CONSTRAINT `FK_persons_final_resting_location_id_locations_id` FOREIGN KEY (`final_resting_location_id`) REFERENCES `locations` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `persons`
--

LOCK TABLES `persons` WRITE;
/*!40000 ALTER TABLE `persons` DISABLE KEYS */;
INSERT INTO `persons` VALUES (1,'7205160067090',1,'M','1972/05/16',NULL,NULL,1,1,1,NULL,50,0,1),(2,'9901084800085',1,'F','1999/01/08',NULL,NULL,1,1,1,NULL,23,0,3),(3,'8706034800080',2,'F','1987/06/03',NULL,NULL,2,2,2,NULL,23,2,2),(4,'8311104800084',1,'F','1983/11/10',NULL,NULL,3,3,3,NULL,38,4,3),(5,'9704144800081',2,'F','1997/04/14',NULL,NULL,4,4,4,NULL,25,0,2),(6,'9705044800089',1,'F','1997/05/04',NULL,NULL,5,5,5,NULL,25,0,1),(7,'9401134800086',2,'F','1994/01/13',NULL,NULL,6,6,6,NULL,28,0,3),(8,'9203284800084',1,'F','1992/03/28',NULL,NULL,7,21,21,NULL,30,0,3),(9,'9005184800084',2,'F','1990/05/18',NULL,NULL,8,2,2,NULL,32,2,2),(10,'0209130060086',1,'F','2002/09/13',NULL,NULL,1,1,1,NULL,20,3,1),(11,'2012274800088',1,'F','1920/12/27',NULL,NULL,9,17,17,NULL,101,0,3),(12,'9802085800084',2,'M','1998/02/08',NULL,NULL,10,2,2,NULL,24,1,2),(13,'9301155800082',1,'M','1993/01/15',NULL,NULL,14,14,14,NULL,29,0,1),(14,'9908025800082',2,'M','1999/08/02',NULL,NULL,21,21,21,NULL,22,0,2),(15,'9112105800084',1,'M','1991/12/10',NULL,NULL,19,19,19,NULL,30,0,1),(16,'9710315800081',2,'M','1997/10/31',NULL,NULL,16,16,16,NULL,24,1,2),(17,'9603125800088',1,'M','1996/03/12',NULL,NULL,16,22,22,NULL,26,0,1),(18,'9206165800081',2,'M','1992/06/16',NULL,NULL,22,14,14,NULL,29,0,2),(19,'9401015800080',1,'M','1994/01/01',NULL,NULL,11,18,18,NULL,28,0,1),(20,'9908095800087',2,'M','1999/08/09',NULL,NULL,18,20,20,NULL,22,0,2);
/*!40000 ALTER TABLE `persons` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `persons_documents`
--

DROP TABLE IF EXISTS `persons_documents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `persons_documents` (
  `person_id` int(11) NOT NULL,
  `document_id` int(11) NOT NULL,
  KEY `FK_per_doc_per_id__per_id` (`person_id`),
  KEY `FK_per_doc_doc_id__doc_id` (`document_id`),
  CONSTRAINT `FK_per_doc_doc_id__doc_id` FOREIGN KEY (`document_id`) REFERENCES `documents` (`id`),
  CONSTRAINT `FK_per_doc_per_id__per_id` FOREIGN KEY (`person_id`) REFERENCES `persons` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `persons_documents`
--

LOCK TABLES `persons_documents` WRITE;
/*!40000 ALTER TABLE `persons_documents` DISABLE KEYS */;
/*!40000 ALTER TABLE `persons_documents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `persons_media`
--

DROP TABLE IF EXISTS `persons_media`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `persons_media` (
  `person_id` int(11) NOT NULL,
  `media_id` int(11) NOT NULL,
  KEY `FK_per_med_med_id__med_id` (`media_id`),
  KEY `FK_per_med_per_id__per_id` (`person_id`),
  CONSTRAINT `FK_per_med_med_id__med_id` FOREIGN KEY (`media_id`) REFERENCES `media` (`id`),
  CONSTRAINT `FK_per_med_per_id__per_id` FOREIGN KEY (`person_id`) REFERENCES `persons` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `persons_media`
--

LOCK TABLES `persons_media` WRITE;
/*!40000 ALTER TABLE `persons_media` DISABLE KEYS */;
/*!40000 ALTER TABLE `persons_media` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `positions`
--

DROP TABLE IF EXISTS `positions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `positions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `affiliation_id` int(11) NOT NULL,
  `abbreviation` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_FK_pos_aff_id__aff_id` (`affiliation_id`),
  KEY `IDX_positions_1` (`abbreviation`),
  CONSTRAINT `FK_pos_aff_id__aff_id` FOREIGN KEY (`affiliation_id`) REFERENCES `affiliations` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `positions`
--

LOCK TABLES `positions` WRITE;
/*!40000 ALTER TABLE `positions` DISABLE KEYS */;
/*!40000 ALTER TABLE `positions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `publishers`
--

DROP TABLE IF EXISTS `publishers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `publishers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `publisher_key` varchar(100) NOT NULL,
  `publisher_name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_publishers_1` (`publisher_key`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `publishers`
--

LOCK TABLES `publishers` WRITE;
/*!40000 ALTER TABLE `publishers` DISABLE KEYS */;
INSERT INTO `publishers` VALUES (1,'admin@google.com',NULL),(2,'pietie@icloud.com',NULL),(3,'address@wordpress.com',NULL);
/*!40000 ALTER TABLE `publishers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rankings`
--

DROP TABLE IF EXISTS `rankings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rankings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `document_fixture_id` int(11) DEFAULT NULL,
  `participant_type` varchar(100) DEFAULT NULL,
  `participant_id` int(11) DEFAULT NULL,
  `issuer` varchar(100) DEFAULT NULL,
  `ranking_type` varchar(100) DEFAULT NULL,
  `ranking_value` varchar(100) DEFAULT NULL,
  `ranking_value_previous` varchar(100) DEFAULT NULL,
  `date_coverage_type` varchar(100) DEFAULT NULL,
  `date_coverage_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rankings`
--

LOCK TABLES `rankings` WRITE;
/*!40000 ALTER TABLE `rankings` DISABLE KEYS */;
/*!40000 ALTER TABLE `rankings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `records`
--

DROP TABLE IF EXISTS `records`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `records` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `participant_type` varchar(100) DEFAULT NULL,
  `participant_id` int(11) DEFAULT NULL,
  `record_type` varchar(100) DEFAULT NULL,
  `record_label` varchar(100) DEFAULT NULL,
  `record_value` varchar(100) DEFAULT NULL,
  `previous_value` varchar(100) DEFAULT NULL,
  `date_coverage_type` varchar(100) DEFAULT NULL,
  `date_coverage_id` int(11) DEFAULT NULL,
  `comment` varchar(512) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `records`
--

LOCK TABLES `records` WRITE;
/*!40000 ALTER TABLE `records` DISABLE KEYS */;
/*!40000 ALTER TABLE `records` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_key` varchar(100) NOT NULL,
  `role_name` varchar(100) DEFAULT NULL,
  `comment` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_roles_1` (`role_key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rounds`
--

DROP TABLE IF EXISTS `rounds`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rounds` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `round_no` int(2) NOT NULL,
  `event_id` int(11) NOT NULL,
  `leader_id` int(11) DEFAULT NULL,
  `state` set('Scheduled','In progress','Finished','Cancelled','Postponed') NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `round_no` (`round_no`,`event_id`),
  KEY `FK_rounds_event_id__events_id` (`event_id`),
  KEY `FK_rounds_leader_id__persons_id` (`leader_id`),
  CONSTRAINT `FK_rounds_event_id__events_id` FOREIGN KEY (`event_id`) REFERENCES `events` (`id`),
  CONSTRAINT `FK_rounds_leader_id__persons_id` FOREIGN KEY (`leader_id`) REFERENCES `persons` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rounds`
--

LOCK TABLES `rounds` WRITE;
/*!40000 ALTER TABLE `rounds` DISABLE KEYS */;
INSERT INTO `rounds` VALUES (1,1,1,1,'Scheduled'),(2,2,1,12,'Scheduled'),(3,3,1,1,'Scheduled'),(4,4,1,1,'Scheduled'),(5,1,2,NULL,'Cancelled'),(6,2,2,NULL,'Cancelled'),(7,3,2,NULL,'Cancelled'),(8,4,2,NULL,'Cancelled'),(9,1,3,11,'Finished'),(10,2,3,11,'Finished'),(11,3,3,11,'Finished'),(12,4,3,11,'Finished'),(13,1,4,11,'Finished'),(14,2,4,11,'Finished'),(15,3,4,11,'Finished'),(16,4,4,11,'Finished'),(17,1,5,12,'Finished'),(18,2,5,1,'Finished'),(19,3,5,14,'Finished'),(20,4,5,20,'Finished');
/*!40000 ALTER TABLE `rounds` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `scores`
--

DROP TABLE IF EXISTS `scores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `scores` (
  `person_id` int(11) NOT NULL,
  `round_id` int(11) NOT NULL,
  `hole_id` int(11) NOT NULL,
  `net_score` int(3) DEFAULT NULL,
  `stroke_count` int(2) DEFAULT NULL,
  `birdie` tinyint(1) DEFAULT NULL,
  `eagle` tinyint(1) DEFAULT NULL,
  `bogey` tinyint(1) DEFAULT NULL,
  `double_bogey` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`person_id`,`round_id`,`hole_id`),
  KEY `FK_scores_round_id__rounds_id` (`round_id`),
  KEY `FK_scores_hole_id__holes_id` (`hole_id`),
  CONSTRAINT `FK_scores_hole_id__holes_id` FOREIGN KEY (`hole_id`) REFERENCES `holes` (`id`),
  CONSTRAINT `FK_scores_person_id__persons_id` FOREIGN KEY (`person_id`) REFERENCES `persons` (`id`),
  CONSTRAINT `FK_scores_round_id__rounds_id` FOREIGN KEY (`round_id`) REFERENCES `rounds` (`id`),
  CONSTRAINT `CHK_strokes` CHECK (`stroke_count` >= 0)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `scores`
--

LOCK TABLES `scores` WRITE;
/*!40000 ALTER TABLE `scores` DISABLE KEYS */;
INSERT INTO `scores` VALUES (1,1,1,9,14,0,0,0,0),(1,1,2,8,11,0,0,0,0),(1,1,3,6,10,0,0,0,0),(1,1,4,8,11,0,0,0,0),(1,1,5,0,4,0,0,0,0),(1,1,6,8,12,0,0,0,0),(1,1,7,5,9,0,0,0,0),(1,1,8,9,12,0,0,0,0),(1,1,9,7,11,0,0,0,0),(1,1,10,7,11,0,0,0,0),(1,1,11,6,10,0,0,0,0),(1,1,12,4,8,0,0,0,0),(1,1,13,8,12,0,0,0,0),(1,1,14,7,12,0,0,0,0),(1,1,15,8,13,0,0,0,0),(1,1,16,3,8,0,0,0,0),(1,1,17,7,12,0,0,0,0),(1,1,18,3,8,0,0,0,0),(1,2,1,5,10,0,0,0,0),(1,2,2,7,10,0,0,0,0),(1,2,3,5,9,0,0,0,0),(1,2,4,7,10,0,0,0,0),(1,2,5,7,11,0,0,0,0),(1,2,6,9,13,0,0,0,0),(1,2,7,2,6,0,0,0,1),(1,2,8,1,4,0,0,1,0),(1,2,9,6,10,0,0,0,0),(1,2,10,7,11,0,0,0,0),(1,2,11,6,10,0,0,0,0),(1,2,12,7,11,0,0,0,0),(1,2,13,3,7,0,0,0,0),(1,2,14,2,7,0,0,0,1),(1,2,15,2,7,0,0,0,1),(1,2,16,8,13,0,0,0,0),(1,2,17,5,10,0,0,0,0),(1,2,18,5,10,0,0,0,0),(1,3,1,4,9,0,0,0,0),(1,3,2,7,10,0,0,0,0),(1,3,3,4,8,0,0,0,0),(1,3,4,8,11,0,0,0,0),(1,3,5,7,11,0,0,0,0),(1,3,6,8,12,0,0,0,0),(1,3,7,7,11,0,0,0,0),(1,3,8,0,3,0,0,0,0),(1,3,9,6,10,0,0,0,0),(1,3,10,5,9,0,0,0,0),(1,3,11,-3,1,0,0,0,0),(1,3,12,4,8,0,0,0,0),(1,3,13,9,13,0,0,0,0),(1,3,14,7,12,0,0,0,0),(1,3,15,6,11,0,0,0,0),(1,3,16,6,11,0,0,0,0),(1,3,17,7,12,0,0,0,0),(1,3,18,4,9,0,0,0,0),(1,4,1,1,6,0,0,1,0),(1,4,2,8,11,0,0,0,0),(1,4,3,7,11,0,0,0,0),(1,4,4,5,8,0,0,0,0),(1,4,5,0,4,0,0,0,0),(1,4,6,9,13,0,0,0,0),(1,4,7,4,8,0,0,0,0),(1,4,8,0,3,0,0,0,0),(1,4,9,3,7,0,0,0,0),(1,4,10,2,6,0,0,0,1),(1,4,11,1,5,0,0,1,0),(1,4,12,6,10,0,0,0,0),(1,4,13,8,12,0,0,0,0),(1,4,14,6,11,0,0,0,0),(1,4,15,5,10,0,0,0,0),(1,4,16,2,7,0,0,0,1),(1,4,17,6,11,0,0,0,0),(1,4,18,7,12,0,0,0,0),(1,5,19,1,4,0,0,1,0),(1,5,20,0,4,0,0,0,0),(1,5,21,3,7,0,0,0,0),(1,5,22,6,10,0,0,0,0),(1,5,23,6,10,0,0,0,0),(1,5,24,7,11,0,0,0,0),(1,5,25,7,11,0,0,0,0),(1,5,26,5,9,0,0,0,0),(1,5,27,5,9,0,0,0,0),(1,5,28,7,10,0,0,0,0),(1,5,29,7,11,0,0,0,0),(1,5,30,11,14,0,0,0,0),(1,5,31,9,12,0,0,0,0),(1,5,32,3,7,0,0,0,0),(1,5,33,2,7,0,0,0,1),(1,5,34,7,12,0,0,0,0),(1,5,35,-1,4,1,0,0,0),(1,5,36,0,5,0,0,0,0),(1,6,19,2,5,0,0,0,1),(1,6,20,3,7,0,0,0,0),(1,6,21,0,4,0,0,0,0),(1,6,22,7,11,0,0,0,0),(1,6,23,2,6,0,0,0,1),(1,6,24,7,11,0,0,0,0),(1,6,25,8,12,0,0,0,0),(1,6,26,8,12,0,0,0,0),(1,6,27,8,12,0,0,0,0),(1,6,28,11,14,0,0,0,0),(1,6,29,3,7,0,0,0,0),(1,6,30,4,7,0,0,0,0),(1,6,31,6,9,0,0,0,0),(1,6,32,3,7,0,0,0,0),(1,6,33,2,7,0,0,0,1),(1,6,34,4,9,0,0,0,0),(1,6,35,7,12,0,0,0,0),(1,6,36,3,8,0,0,0,0),(1,7,19,8,11,0,0,0,0),(1,7,20,0,4,0,0,0,0),(1,7,21,6,10,0,0,0,0),(1,7,22,6,10,0,0,0,0),(1,7,23,7,11,0,0,0,0),(1,7,24,5,9,0,0,0,0),(1,7,25,5,9,0,0,0,0),(1,7,26,5,9,0,0,0,0),(1,7,27,4,8,0,0,0,0),(1,7,28,7,10,0,0,0,0),(1,7,29,-3,1,0,0,0,0),(1,7,30,11,14,0,0,0,0),(1,7,31,6,9,0,0,0,0),(1,7,32,7,11,0,0,0,0),(1,7,33,3,8,0,0,0,0),(1,7,34,7,12,0,0,0,0),(1,7,35,6,11,0,0,0,0),(1,7,36,7,12,0,0,0,0),(1,8,19,4,7,0,0,0,0),(1,8,20,7,11,0,0,0,0),(1,8,21,4,8,0,0,0,0),(1,8,22,7,11,0,0,0,0),(1,8,23,2,6,0,0,0,1),(1,8,24,5,9,0,0,0,0),(1,8,25,2,6,0,0,0,1),(1,8,26,7,11,0,0,0,0),(1,8,27,10,14,0,0,0,0),(1,8,28,2,5,0,0,0,1),(1,8,29,7,11,0,0,0,0),(1,8,30,7,10,0,0,0,0),(1,8,31,4,7,0,0,0,0),(1,8,32,7,11,0,0,0,0),(1,8,33,4,9,0,0,0,0),(1,8,34,-1,4,1,0,0,0),(1,8,35,6,11,0,0,0,0),(1,8,36,5,10,0,0,0,0),(1,9,37,9,12,0,0,0,0),(1,9,38,9,13,0,0,0,0),(1,9,39,8,12,0,0,0,0),(1,9,40,7,11,0,0,0,0),(1,9,41,7,11,0,0,0,0),(1,9,42,4,7,0,0,0,0),(1,9,43,7,11,0,0,0,0),(1,9,44,7,11,0,0,0,0),(1,9,45,6,9,0,0,0,0),(1,9,46,9,12,0,0,0,0),(1,9,47,7,11,0,0,0,0),(1,9,48,2,6,0,0,0,1),(1,9,49,4,8,0,0,0,0),(1,9,50,-1,3,1,0,0,0),(1,9,51,4,9,0,0,0,0),(1,9,52,6,11,0,0,0,0),(1,9,53,6,11,0,0,0,0),(1,9,54,3,8,0,0,0,0),(1,10,37,5,8,0,0,0,0),(1,10,38,9,13,0,0,0,0),(1,10,39,6,10,0,0,0,0),(1,10,40,8,12,0,0,0,0),(1,10,41,9,13,0,0,0,0),(1,10,42,9,12,0,0,0,0),(1,10,43,5,9,0,0,0,0),(1,10,44,6,10,0,0,0,0),(1,10,45,6,9,0,0,0,0),(1,10,46,7,10,0,0,0,0),(1,10,47,-1,3,1,0,0,0),(1,10,48,2,6,0,0,0,1),(1,10,49,2,6,0,0,0,1),(1,10,50,6,10,0,0,0,0),(1,10,51,7,12,0,0,0,0),(1,10,52,4,9,0,0,0,0),(1,10,53,-1,4,1,0,0,0),(1,10,54,6,11,0,0,0,0),(1,11,37,0,3,0,0,0,0),(1,11,38,9,13,0,0,0,0),(1,11,39,7,11,0,0,0,0),(1,11,40,9,13,0,0,0,0),(1,11,41,8,12,0,0,0,0),(1,11,42,7,10,0,0,0,0),(1,11,43,-1,3,1,0,0,0),(1,11,44,8,12,0,0,0,0),(1,11,45,8,11,0,0,0,0),(1,11,46,8,11,0,0,0,0),(1,11,47,5,9,0,0,0,0),(1,11,48,1,5,0,0,1,0),(1,11,49,8,12,0,0,0,0),(1,11,50,8,12,0,0,0,0),(1,11,51,-1,4,1,0,0,0),(1,11,52,6,11,0,0,0,0),(1,11,53,1,6,0,0,1,0),(1,11,54,5,10,0,0,0,0),(1,12,37,8,11,0,0,0,0),(1,12,38,8,12,0,0,0,0),(1,12,39,7,11,0,0,0,0),(1,12,40,4,8,0,0,0,0),(1,12,41,0,4,0,0,0,0),(1,12,42,7,10,0,0,0,0),(1,12,43,4,8,0,0,0,0),(1,12,44,7,11,0,0,0,0),(1,12,45,9,12,0,0,0,0),(1,12,46,9,12,0,0,0,0),(1,12,47,10,14,0,0,0,0),(1,12,48,4,8,0,0,0,0),(1,12,49,5,9,0,0,0,0),(1,12,50,5,9,0,0,0,0),(1,12,51,3,8,0,0,0,0),(1,12,52,-1,4,1,0,0,0),(1,12,53,5,10,0,0,0,0),(1,12,54,7,12,0,0,0,0),(1,13,55,9,12,0,0,0,0),(1,13,56,5,8,0,0,0,0),(1,13,57,5,8,0,0,0,0),(1,13,58,1,4,0,0,1,0),(1,13,59,9,12,0,0,0,0),(1,13,60,9,12,0,0,0,0),(1,13,61,3,7,0,0,0,0),(1,13,62,3,7,0,0,0,0),(1,13,63,0,4,0,0,0,0),(1,13,64,4,8,0,0,0,0),(1,13,65,3,7,0,0,0,0),(1,13,66,8,12,0,0,0,0),(1,13,67,1,6,0,0,1,0),(1,13,68,5,10,0,0,0,0),(1,13,69,6,11,0,0,0,0),(1,13,70,5,10,0,0,0,0),(1,13,71,4,9,0,0,0,0),(1,13,72,7,12,0,0,0,0),(1,14,55,3,6,0,0,0,0),(1,14,56,5,8,0,0,0,0),(1,14,57,7,10,0,0,0,0),(1,14,58,5,8,0,0,0,0),(1,14,59,8,11,0,0,0,0),(1,14,60,8,11,0,0,0,0),(1,14,61,9,13,0,0,0,0),(1,14,62,8,12,0,0,0,0),(1,14,63,6,10,0,0,0,0),(1,14,64,7,11,0,0,0,0),(1,14,65,9,13,0,0,0,0),(1,14,66,2,6,0,0,0,1),(1,14,67,4,9,0,0,0,0),(1,14,68,7,12,0,0,0,0),(1,14,69,6,11,0,0,0,0),(1,14,70,4,9,0,0,0,0),(1,14,71,0,5,0,0,0,0),(1,14,72,3,8,0,0,0,0),(1,15,55,7,10,0,0,0,0),(1,15,56,3,6,0,0,0,0),(1,15,57,7,10,0,0,0,0),(1,15,58,8,11,0,0,0,0),(1,15,59,4,7,0,0,0,0),(1,15,60,8,11,0,0,0,0),(1,15,61,7,11,0,0,0,0),(1,15,62,5,9,0,0,0,0),(1,15,63,7,11,0,0,0,0),(1,15,64,7,11,0,0,0,0),(1,15,65,8,12,0,0,0,0),(1,15,66,0,4,0,0,0,0),(1,15,67,5,10,0,0,0,0),(1,15,68,4,9,0,0,0,0),(1,15,69,2,7,0,0,0,1),(1,15,70,4,9,0,0,0,0),(1,15,71,7,12,0,0,0,0),(1,15,72,2,7,0,0,0,1),(1,16,55,9,12,0,0,0,0),(1,16,56,8,11,0,0,0,0),(1,16,57,9,12,0,0,0,0),(1,16,58,8,11,0,0,0,0),(1,16,59,1,4,0,0,1,0),(1,16,60,8,11,0,0,0,0),(1,16,61,6,10,0,0,0,0),(1,16,62,7,11,0,0,0,0),(1,16,63,2,6,0,0,0,1),(1,16,64,8,12,0,0,0,0),(1,16,65,5,9,0,0,0,0),(1,16,66,6,10,0,0,0,0),(1,16,67,7,12,0,0,0,0),(1,16,68,7,12,0,0,0,0),(1,16,69,3,8,0,0,0,0),(1,16,70,6,11,0,0,0,0),(1,16,71,6,11,0,0,0,0),(1,16,72,4,9,0,0,0,0),(1,17,73,8,11,0,0,0,0),(1,17,74,8,11,0,0,0,0),(1,17,75,7,10,0,0,0,0),(1,17,76,8,11,0,0,0,0),(1,17,77,4,7,0,0,0,0),(1,17,78,8,11,0,0,0,0),(1,17,79,4,8,0,0,0,0),(1,17,80,9,13,0,0,0,0),(1,17,81,6,10,0,0,0,0),(1,17,82,8,12,0,0,0,0),(1,17,83,4,8,0,0,0,0),(1,17,84,4,8,0,0,0,0),(1,17,85,0,5,0,0,0,0),(1,17,86,-4,1,0,0,0,0),(1,17,87,4,9,0,0,0,0),(1,17,88,2,7,0,0,0,1),(1,17,89,4,9,0,0,0,0),(1,17,90,5,7,0,0,0,0),(1,18,73,7,10,0,0,0,0),(1,18,74,8,11,0,0,0,0),(1,18,75,4,7,0,0,0,0),(1,18,76,0,3,0,0,0,0),(1,18,77,9,12,0,0,0,0),(1,18,78,7,10,0,0,0,0),(1,18,79,6,10,0,0,0,0),(1,18,80,8,12,0,0,0,0),(1,18,81,7,11,0,0,0,0),(1,18,82,2,6,0,0,0,1),(1,18,83,3,7,0,0,0,0),(1,18,84,6,10,0,0,0,0),(1,18,85,-1,4,1,0,0,0),(1,18,86,5,10,0,0,0,0),(1,18,87,5,10,0,0,0,0),(1,18,88,8,13,0,0,0,0),(1,18,89,1,6,0,0,1,0),(1,18,90,10,12,0,0,0,0),(1,19,73,6,9,0,0,0,0),(1,19,74,6,9,0,0,0,0),(1,19,75,7,10,0,0,0,0),(1,19,76,3,6,0,0,0,0),(1,19,77,5,8,0,0,0,0),(1,19,78,6,9,0,0,0,0),(1,19,79,5,9,0,0,0,0),(1,19,80,1,5,0,0,1,0),(1,19,81,8,12,0,0,0,0),(1,19,82,0,4,0,0,0,0),(1,19,83,9,13,0,0,0,0),(1,19,84,3,7,0,0,0,0),(1,19,85,2,7,0,0,0,1),(1,19,86,7,12,0,0,0,0),(1,19,87,5,10,0,0,0,0),(1,19,88,1,6,0,0,1,0),(1,19,89,3,8,0,0,0,0),(1,19,90,12,14,0,0,0,0),(1,20,73,9,12,0,0,0,0),(1,20,74,1,4,0,0,1,0),(1,20,75,9,12,0,0,0,0),(1,20,76,6,9,0,0,0,0),(1,20,77,8,11,0,0,0,0),(1,20,78,5,8,0,0,0,0),(1,20,79,6,10,0,0,0,0),(1,20,80,5,9,0,0,0,0),(1,20,81,5,9,0,0,0,0),(1,20,82,7,11,0,0,0,0),(1,20,83,7,11,0,0,0,0),(1,20,84,0,4,0,0,0,0),(1,20,85,5,10,0,0,0,0),(1,20,86,5,10,0,0,0,0),(1,20,87,-1,4,1,0,0,0),(1,20,88,3,8,0,0,0,0),(1,20,89,3,8,0,0,0,0),(1,20,90,8,10,0,0,0,0),(2,1,1,7,12,0,0,0,0),(2,1,2,10,13,0,0,0,0),(2,1,3,7,11,0,0,0,0),(2,1,4,9,12,0,0,0,0),(2,1,5,8,12,0,0,0,0),(2,1,6,1,5,0,0,1,0),(2,1,7,7,11,0,0,0,0),(2,1,8,4,7,0,0,0,0),(2,1,9,7,11,0,0,0,0),(2,1,10,-3,1,0,0,0,0),(2,1,11,8,12,0,0,0,0),(2,1,12,-1,3,1,0,0,0),(2,1,13,4,8,0,0,0,0),(2,1,14,5,10,0,0,0,0),(2,1,15,6,11,0,0,0,0),(2,1,16,6,11,0,0,0,0),(2,1,17,5,10,0,0,0,0),(2,1,18,5,10,0,0,0,0),(2,2,1,3,8,0,0,0,0),(2,2,2,8,11,0,0,0,0),(2,2,3,8,12,0,0,0,0),(2,2,4,7,10,0,0,0,0),(2,2,5,7,11,0,0,0,0),(2,2,6,2,6,0,0,0,1),(2,2,7,6,10,0,0,0,0),(2,2,8,10,13,0,0,0,0),(2,2,9,6,10,0,0,0,0),(2,2,10,4,8,0,0,0,0),(2,2,11,8,12,0,0,0,0),(2,2,12,7,11,0,0,0,0),(2,2,13,7,11,0,0,0,0),(2,2,14,0,5,0,0,0,0),(2,2,15,6,11,0,0,0,0),(2,2,16,7,12,0,0,0,0),(2,2,17,4,9,0,0,0,0),(2,2,18,7,12,0,0,0,0),(2,3,1,4,9,0,0,0,0),(2,3,2,5,8,0,0,0,0),(2,3,3,7,11,0,0,0,0),(2,3,4,5,8,0,0,0,0),(2,3,5,5,9,0,0,0,0),(2,3,6,-3,1,0,0,0,0),(2,3,7,7,11,0,0,0,0),(2,3,8,-2,1,0,1,0,0),(2,3,9,2,6,0,0,0,1),(2,3,10,5,9,0,0,0,0),(2,3,11,2,6,0,0,0,1),(2,3,12,2,6,0,0,0,1),(2,3,13,7,11,0,0,0,0),(2,3,14,4,9,0,0,0,0),(2,3,15,3,8,0,0,0,0),(2,3,16,4,9,0,0,0,0),(2,3,17,5,10,0,0,0,0),(2,3,18,2,7,0,0,0,1),(2,4,1,9,14,0,0,0,0),(2,4,2,4,7,0,0,0,0),(2,4,3,5,9,0,0,0,0),(2,4,4,8,11,0,0,0,0),(2,4,5,7,11,0,0,0,0),(2,4,6,8,12,0,0,0,0),(2,4,7,6,10,0,0,0,0),(2,4,8,6,9,0,0,0,0),(2,4,9,7,11,0,0,0,0),(2,4,10,6,10,0,0,0,0),(2,4,11,7,11,0,0,0,0),(2,4,12,7,11,0,0,0,0),(2,4,13,7,11,0,0,0,0),(2,4,14,4,9,0,0,0,0),(2,4,15,0,5,0,0,0,0),(2,4,16,6,11,0,0,0,0),(2,4,17,5,10,0,0,0,0),(2,4,18,-2,3,0,1,0,0),(2,5,19,2,5,0,0,0,1),(2,5,20,5,9,0,0,0,0),(2,5,21,8,12,0,0,0,0),(2,5,22,3,7,0,0,0,0),(2,5,23,7,11,0,0,0,0),(2,5,24,4,8,0,0,0,0),(2,5,25,3,7,0,0,0,0),(2,5,26,7,11,0,0,0,0),(2,5,27,7,11,0,0,0,0),(2,5,28,5,8,0,0,0,0),(2,5,29,3,7,0,0,0,0),(2,5,30,2,5,0,0,0,1),(2,5,31,1,4,0,0,1,0),(2,5,32,8,12,0,0,0,0),(2,5,33,4,9,0,0,0,0),(2,5,34,-2,3,0,1,0,0),(2,5,35,6,11,0,0,0,0),(2,5,36,6,11,0,0,0,0),(2,6,19,7,10,0,0,0,0),(2,6,20,3,7,0,0,0,0),(2,6,21,7,11,0,0,0,0),(2,6,22,6,10,0,0,0,0),(2,6,23,6,10,0,0,0,0),(2,6,24,8,12,0,0,0,0),(2,6,25,5,9,0,0,0,0),(2,6,26,7,11,0,0,0,0),(2,6,27,5,9,0,0,0,0),(2,6,28,5,8,0,0,0,0),(2,6,29,5,9,0,0,0,0),(2,6,30,6,9,0,0,0,0),(2,6,31,8,11,0,0,0,0),(2,6,32,9,13,0,0,0,0),(2,6,33,5,10,0,0,0,0),(2,6,34,-1,4,1,0,0,0),(2,6,35,0,5,0,0,0,0),(2,6,36,2,7,0,0,0,1),(2,7,19,8,11,0,0,0,0),(2,7,20,5,9,0,0,0,0),(2,7,21,7,11,0,0,0,0),(2,7,22,6,10,0,0,0,0),(2,7,23,8,12,0,0,0,0),(2,7,24,2,6,0,0,0,1),(2,7,25,8,12,0,0,0,0),(2,7,26,9,13,0,0,0,0),(2,7,27,6,10,0,0,0,0),(2,7,28,6,9,0,0,0,0),(2,7,29,5,9,0,0,0,0),(2,7,30,10,13,0,0,0,0),(2,7,31,4,7,0,0,0,0),(2,7,32,6,10,0,0,0,0),(2,7,33,2,7,0,0,0,1),(2,7,34,4,9,0,0,0,0),(2,7,35,-2,3,0,1,0,0),(2,7,36,7,12,0,0,0,0),(2,8,19,2,5,0,0,0,1),(2,8,20,5,9,0,0,0,0),(2,8,21,6,10,0,0,0,0),(2,8,22,8,12,0,0,0,0),(2,8,23,4,8,0,0,0,0),(2,8,24,7,11,0,0,0,0),(2,8,25,9,13,0,0,0,0),(2,8,26,10,14,0,0,0,0),(2,8,27,2,6,0,0,0,1),(2,8,28,7,10,0,0,0,0),(2,8,29,9,13,0,0,0,0),(2,8,30,7,10,0,0,0,0),(2,8,31,10,13,0,0,0,0),(2,8,32,5,9,0,0,0,0),(2,8,33,7,12,0,0,0,0),(2,8,34,7,12,0,0,0,0),(2,8,35,5,10,0,0,0,0),(2,8,36,8,13,0,0,0,0),(2,9,37,4,7,0,0,0,0),(2,9,38,8,12,0,0,0,0),(2,9,39,2,6,0,0,0,1),(2,9,40,5,9,0,0,0,0),(2,9,41,8,12,0,0,0,0),(2,9,42,8,11,0,0,0,0),(2,9,43,6,10,0,0,0,0),(2,9,44,5,9,0,0,0,0),(2,9,45,5,8,0,0,0,0),(2,9,46,8,11,0,0,0,0),(2,9,47,5,9,0,0,0,0),(2,9,48,0,4,0,0,0,0),(2,9,49,0,4,0,0,0,0),(2,9,50,2,6,0,0,0,1),(2,9,51,4,9,0,0,0,0),(2,9,52,4,9,0,0,0,0),(2,9,53,7,12,0,0,0,0),(2,9,54,6,11,0,0,0,0),(2,10,37,11,14,0,0,0,0),(2,10,38,8,12,0,0,0,0),(2,10,39,0,4,0,0,0,0),(2,10,40,0,4,0,0,0,0),(2,10,41,7,11,0,0,0,0),(2,10,42,7,10,0,0,0,0),(2,10,43,7,11,0,0,0,0),(2,10,44,4,8,0,0,0,0),(2,10,45,9,12,0,0,0,0),(2,10,46,11,14,0,0,0,0),(2,10,47,8,12,0,0,0,0),(2,10,48,8,12,0,0,0,0),(2,10,49,4,8,0,0,0,0),(2,10,50,5,9,0,0,0,0),(2,10,51,7,12,0,0,0,0),(2,10,52,7,12,0,0,0,0),(2,10,53,5,10,0,0,0,0),(2,10,54,2,7,0,0,0,1),(2,11,37,8,11,0,0,0,0),(2,11,38,7,11,0,0,0,0),(2,11,39,9,13,0,0,0,0),(2,11,40,7,11,0,0,0,0),(2,11,41,5,9,0,0,0,0),(2,11,42,9,12,0,0,0,0),(2,11,43,2,6,0,0,0,1),(2,11,44,7,11,0,0,0,0),(2,11,45,7,10,0,0,0,0),(2,11,46,2,5,0,0,0,1),(2,11,47,7,11,0,0,0,0),(2,11,48,9,13,0,0,0,0),(2,11,49,6,10,0,0,0,0),(2,11,50,7,11,0,0,0,0),(2,11,51,6,11,0,0,0,0),(2,11,52,1,6,0,0,1,0),(2,11,53,6,11,0,0,0,0),(2,11,54,7,12,0,0,0,0),(2,12,37,8,11,0,0,0,0),(2,12,38,7,11,0,0,0,0),(2,12,39,2,6,0,0,0,1),(2,12,40,-3,1,0,0,0,0),(2,12,41,6,10,0,0,0,0),(2,12,42,9,12,0,0,0,0),(2,12,43,7,11,0,0,0,0),(2,12,44,8,12,0,0,0,0),(2,12,45,3,6,0,0,0,0),(2,12,46,10,13,0,0,0,0),(2,12,47,8,12,0,0,0,0),(2,12,48,5,9,0,0,0,0),(2,12,49,5,9,0,0,0,0),(2,12,50,2,6,0,0,0,1),(2,12,51,6,11,0,0,0,0),(2,12,52,8,13,0,0,0,0),(2,12,53,-1,4,1,0,0,0),(2,12,54,7,12,0,0,0,0),(2,13,55,8,11,0,0,0,0),(2,13,56,9,12,0,0,0,0),(2,13,57,9,12,0,0,0,0),(2,13,58,5,8,0,0,0,0),(2,13,59,7,10,0,0,0,0),(2,13,60,5,8,0,0,0,0),(2,13,61,7,11,0,0,0,0),(2,13,62,4,8,0,0,0,0),(2,13,63,1,5,0,0,1,0),(2,13,64,2,6,0,0,0,1),(2,13,65,0,4,0,0,0,0),(2,13,66,9,13,0,0,0,0),(2,13,67,6,11,0,0,0,0),(2,13,68,1,6,0,0,1,0),(2,13,69,7,12,0,0,0,0),(2,13,70,7,12,0,0,0,0),(2,13,71,5,10,0,0,0,0),(2,13,72,6,11,0,0,0,0),(2,14,55,5,8,0,0,0,0),(2,14,56,4,7,0,0,0,0),(2,14,57,7,10,0,0,0,0),(2,14,58,6,9,0,0,0,0),(2,14,59,3,6,0,0,0,0),(2,14,60,9,12,0,0,0,0),(2,14,61,8,12,0,0,0,0),(2,14,62,2,6,0,0,0,1),(2,14,63,9,13,0,0,0,0),(2,14,64,7,11,0,0,0,0),(2,14,65,6,10,0,0,0,0),(2,14,66,8,12,0,0,0,0),(2,14,67,6,11,0,0,0,0),(2,14,68,3,8,0,0,0,0),(2,14,69,-2,3,0,1,0,0),(2,14,70,5,10,0,0,0,0),(2,14,71,4,9,0,0,0,0),(2,14,72,5,10,0,0,0,0),(2,15,55,8,11,0,0,0,0),(2,15,56,5,8,0,0,0,0),(2,15,57,9,12,0,0,0,0),(2,15,58,5,8,0,0,0,0),(2,15,59,3,6,0,0,0,0),(2,15,60,4,7,0,0,0,0),(2,15,61,4,8,0,0,0,0),(2,15,62,7,11,0,0,0,0),(2,15,63,7,11,0,0,0,0),(2,15,64,7,11,0,0,0,0),(2,15,65,6,10,0,0,0,0),(2,15,66,0,4,0,0,0,0),(2,15,67,3,8,0,0,0,0),(2,15,68,4,9,0,0,0,0),(2,15,69,5,10,0,0,0,0),(2,15,70,6,11,0,0,0,0),(2,15,71,7,12,0,0,0,0),(2,15,72,6,11,0,0,0,0),(2,16,55,5,8,0,0,0,0),(2,16,56,2,5,0,0,0,1),(2,16,57,7,10,0,0,0,0),(2,16,58,8,11,0,0,0,0),(2,16,59,6,9,0,0,0,0),(2,16,60,1,4,0,0,1,0),(2,16,61,3,7,0,0,0,0),(2,16,62,10,14,0,0,0,0),(2,16,63,8,12,0,0,0,0),(2,16,64,8,12,0,0,0,0),(2,16,65,6,10,0,0,0,0),(2,16,66,4,8,0,0,0,0),(2,16,67,5,10,0,0,0,0),(2,16,68,5,10,0,0,0,0),(2,16,69,8,13,0,0,0,0),(2,16,70,8,13,0,0,0,0),(2,16,71,6,11,0,0,0,0),(2,16,72,8,13,0,0,0,0),(2,17,73,9,12,0,0,0,0),(2,17,74,1,4,0,0,1,0),(2,17,75,8,11,0,0,0,0),(2,17,76,7,10,0,0,0,0),(2,17,77,3,6,0,0,0,0),(2,17,78,9,12,0,0,0,0),(2,17,79,6,10,0,0,0,0),(2,17,80,7,11,0,0,0,0),(2,17,81,7,11,0,0,0,0),(2,17,82,3,7,0,0,0,0),(2,17,83,9,13,0,0,0,0),(2,17,84,5,9,0,0,0,0),(2,17,85,6,11,0,0,0,0),(2,17,86,6,11,0,0,0,0),(2,17,87,8,13,0,0,0,0),(2,17,88,6,11,0,0,0,0),(2,17,89,7,12,0,0,0,0),(2,17,90,10,12,0,0,0,0),(2,18,73,8,11,0,0,0,0),(2,18,74,8,11,0,0,0,0),(2,18,75,5,8,0,0,0,0),(2,18,76,4,7,0,0,0,0),(2,18,77,8,11,0,0,0,0),(2,18,78,8,11,0,0,0,0),(2,18,79,2,6,0,0,0,1),(2,18,80,5,9,0,0,0,0),(2,18,81,4,8,0,0,0,0),(2,18,82,1,5,0,0,1,0),(2,18,83,7,11,0,0,0,0),(2,18,84,7,11,0,0,0,0),(2,18,85,4,9,0,0,0,0),(2,18,86,6,11,0,0,0,0),(2,18,87,5,10,0,0,0,0),(2,18,88,5,10,0,0,0,0),(2,18,89,6,11,0,0,0,0),(2,18,90,9,11,0,0,0,0),(2,19,73,7,10,0,0,0,0),(2,19,74,8,11,0,0,0,0),(2,19,75,7,10,0,0,0,0),(2,19,76,9,12,0,0,0,0),(2,19,77,6,9,0,0,0,0),(2,19,78,4,7,0,0,0,0),(2,19,79,2,6,0,0,0,1),(2,19,80,7,11,0,0,0,0),(2,19,81,5,9,0,0,0,0),(2,19,82,3,7,0,0,0,0),(2,19,83,8,12,0,0,0,0),(2,19,84,8,12,0,0,0,0),(2,19,85,-1,4,1,0,0,0),(2,19,86,5,10,0,0,0,0),(2,19,87,4,9,0,0,0,0),(2,19,88,5,10,0,0,0,0),(2,19,89,7,12,0,0,0,0),(2,19,90,8,10,0,0,0,0),(2,20,73,6,9,0,0,0,0),(2,20,74,10,13,0,0,0,0),(2,20,75,7,10,0,0,0,0),(2,20,76,8,11,0,0,0,0),(2,20,77,9,12,0,0,0,0),(2,20,78,9,12,0,0,0,0),(2,20,79,0,4,0,0,0,0),(2,20,80,-1,3,1,0,0,0),(2,20,81,-1,3,1,0,0,0),(2,20,82,7,11,0,0,0,0),(2,20,83,9,13,0,0,0,0),(2,20,84,9,13,0,0,0,0),(2,20,85,7,12,0,0,0,0),(2,20,86,7,12,0,0,0,0),(2,20,87,5,10,0,0,0,0),(2,20,88,6,11,0,0,0,0),(2,20,89,9,14,0,0,0,0),(2,20,90,9,11,0,0,0,0),(3,1,1,4,9,0,0,0,0),(3,1,2,6,9,0,0,0,0),(3,1,3,11,15,0,0,0,0),(3,1,4,8,11,0,0,0,0),(3,1,5,7,11,0,0,0,0),(3,1,6,1,5,0,0,1,0),(3,1,7,-1,3,1,0,0,0),(3,1,8,8,11,0,0,0,0),(3,1,9,7,11,0,0,0,0),(3,1,10,7,11,0,0,0,0),(3,1,11,3,7,0,0,0,0),(3,1,12,6,10,0,0,0,0),(3,1,13,3,7,0,0,0,0),(3,1,14,7,12,0,0,0,0),(3,1,15,8,13,0,0,0,0),(3,1,16,-1,4,1,0,0,0),(3,1,17,7,12,0,0,0,0),(3,1,18,6,11,0,0,0,0),(3,2,1,1,6,0,0,1,0),(3,2,2,7,10,0,0,0,0),(3,2,3,7,11,0,0,0,0),(3,2,4,9,12,0,0,0,0),(3,2,5,7,11,0,0,0,0),(3,2,6,6,10,0,0,0,0),(3,2,7,-3,1,0,0,0,0),(3,2,8,9,12,0,0,0,0),(3,2,9,5,9,0,0,0,0),(3,2,10,8,12,0,0,0,0),(3,2,11,6,10,0,0,0,0),(3,2,12,2,6,0,0,0,1),(3,2,13,8,12,0,0,0,0),(3,2,14,0,5,0,0,0,0),(3,2,15,3,8,0,0,0,0),(3,2,16,6,11,0,0,0,0),(3,2,17,6,11,0,0,0,0),(3,2,18,5,10,0,0,0,0),(3,3,1,8,13,0,0,0,0),(3,3,2,11,14,0,0,0,0),(3,3,3,7,11,0,0,0,0),(3,3,4,7,10,0,0,0,0),(3,3,5,5,9,0,0,0,0),(3,3,6,1,5,0,0,1,0),(3,3,7,3,7,0,0,0,0),(3,3,8,8,11,0,0,0,0),(3,3,9,5,9,0,0,0,0),(3,3,10,5,9,0,0,0,0),(3,3,11,7,11,0,0,0,0),(3,3,12,6,10,0,0,0,0),(3,3,13,7,11,0,0,0,0),(3,3,14,7,12,0,0,0,0),(3,3,15,4,9,0,0,0,0),(3,3,16,3,8,0,0,0,0),(3,3,17,6,11,0,0,0,0),(3,3,18,2,7,0,0,0,1),(3,4,1,3,8,0,0,0,0),(3,4,2,9,12,0,0,0,0),(3,4,3,6,10,0,0,0,0),(3,4,4,8,11,0,0,0,0),(3,4,5,5,9,0,0,0,0),(3,4,6,7,11,0,0,0,0),(3,4,7,7,11,0,0,0,0),(3,4,8,7,10,0,0,0,0),(3,4,9,5,9,0,0,0,0),(3,4,10,3,7,0,0,0,0),(3,4,11,5,9,0,0,0,0),(3,4,12,8,12,0,0,0,0),(3,4,13,6,10,0,0,0,0),(3,4,14,-4,1,0,0,0,0),(3,4,15,2,7,0,0,0,1),(3,4,16,1,6,0,0,1,0),(3,4,17,2,7,0,0,0,1),(3,4,18,4,9,0,0,0,0),(3,5,19,6,9,0,0,0,0),(3,5,20,7,11,0,0,0,0),(3,5,21,8,12,0,0,0,0),(3,5,22,0,4,0,0,0,0),(3,5,23,8,12,0,0,0,0),(3,5,24,4,8,0,0,0,0),(3,5,25,4,8,0,0,0,0),(3,5,26,5,9,0,0,0,0),(3,5,27,5,9,0,0,0,0),(3,5,28,6,9,0,0,0,0),(3,5,29,5,9,0,0,0,0),(3,5,30,1,4,0,0,1,0),(3,5,31,9,12,0,0,0,0),(3,5,32,8,12,0,0,0,0),(3,5,33,8,13,0,0,0,0),(3,5,34,-2,3,0,1,0,0),(3,5,35,3,8,0,0,0,0),(3,5,36,7,12,0,0,0,0),(3,6,19,8,11,0,0,0,0),(3,6,20,3,7,0,0,0,0),(3,6,21,3,7,0,0,0,0),(3,6,22,9,13,0,0,0,0),(3,6,23,5,9,0,0,0,0),(3,6,24,5,9,0,0,0,0),(3,6,25,1,5,0,0,1,0),(3,6,26,5,9,0,0,0,0),(3,6,27,9,13,0,0,0,0),(3,6,28,4,7,0,0,0,0),(3,6,29,-1,3,1,0,0,0),(3,6,30,6,9,0,0,0,0),(3,6,31,7,10,0,0,0,0),(3,6,32,8,12,0,0,0,0),(3,6,33,2,7,0,0,0,1),(3,6,34,4,9,0,0,0,0),(3,6,35,6,11,0,0,0,0),(3,6,36,7,12,0,0,0,0),(3,7,19,8,11,0,0,0,0),(3,7,20,6,10,0,0,0,0),(3,7,21,2,6,0,0,0,1),(3,7,22,6,10,0,0,0,0),(3,7,23,6,10,0,0,0,0),(3,7,24,8,12,0,0,0,0),(3,7,25,8,12,0,0,0,0),(3,7,26,5,9,0,0,0,0),(3,7,27,10,14,0,0,0,0),(3,7,28,6,9,0,0,0,0),(3,7,29,3,7,0,0,0,0),(3,7,30,7,10,0,0,0,0),(3,7,31,10,13,0,0,0,0),(3,7,32,4,8,0,0,0,0),(3,7,33,4,9,0,0,0,0),(3,7,34,4,9,0,0,0,0),(3,7,35,6,11,0,0,0,0),(3,7,36,2,7,0,0,0,1),(3,8,19,9,12,0,0,0,0),(3,8,20,5,9,0,0,0,0),(3,8,21,8,12,0,0,0,0),(3,8,22,6,10,0,0,0,0),(3,8,23,3,7,0,0,0,0),(3,8,24,8,12,0,0,0,0),(3,8,25,6,10,0,0,0,0),(3,8,26,2,6,0,0,0,1),(3,8,27,4,8,0,0,0,0),(3,8,28,9,12,0,0,0,0),(3,8,29,6,10,0,0,0,0),(3,8,30,4,7,0,0,0,0),(3,8,31,4,7,0,0,0,0),(3,8,32,0,4,0,0,0,0),(3,8,33,3,8,0,0,0,0),(3,8,34,5,10,0,0,0,0),(3,8,35,2,7,0,0,0,1),(3,8,36,2,7,0,0,0,1),(3,9,37,8,11,0,0,0,0),(3,9,38,10,14,0,0,0,0),(3,9,39,7,11,0,0,0,0),(3,9,40,6,10,0,0,0,0),(3,9,41,9,13,0,0,0,0),(3,9,42,9,12,0,0,0,0),(3,9,43,2,6,0,0,0,1),(3,9,44,3,7,0,0,0,0),(3,9,45,9,12,0,0,0,0),(3,9,46,13,16,0,0,0,0),(3,9,47,5,9,0,0,0,0),(3,9,48,4,8,0,0,0,0),(3,9,49,6,10,0,0,0,0),(3,9,50,-3,1,0,0,0,0),(3,9,51,6,11,0,0,0,0),(3,9,52,5,10,0,0,0,0),(3,9,53,6,11,0,0,0,0),(3,9,54,7,12,0,0,0,0),(3,10,37,3,6,0,0,0,0),(3,10,38,3,7,0,0,0,0),(3,10,39,-3,1,0,0,0,0),(3,10,40,7,11,0,0,0,0),(3,10,41,3,7,0,0,0,0),(3,10,42,7,10,0,0,0,0),(3,10,43,7,11,0,0,0,0),(3,10,44,9,13,0,0,0,0),(3,10,45,8,11,0,0,0,0),(3,10,46,4,7,0,0,0,0),(3,10,47,5,9,0,0,0,0),(3,10,48,3,7,0,0,0,0),(3,10,49,8,12,0,0,0,0),(3,10,50,5,9,0,0,0,0),(3,10,51,10,15,0,0,0,0),(3,10,52,0,5,0,0,0,0),(3,10,53,4,9,0,0,0,0),(3,10,54,2,7,0,0,0,1),(3,11,37,7,10,0,0,0,0),(3,11,38,0,4,0,0,0,0),(3,11,39,7,11,0,0,0,0),(3,11,40,5,9,0,0,0,0),(3,11,41,4,8,0,0,0,0),(3,11,42,7,10,0,0,0,0),(3,11,43,7,11,0,0,0,0),(3,11,44,5,9,0,0,0,0),(3,11,45,9,12,0,0,0,0),(3,11,46,5,8,0,0,0,0),(3,11,47,3,7,0,0,0,0),(3,11,48,2,6,0,0,0,1),(3,11,49,2,6,0,0,0,1),(3,11,50,8,12,0,0,0,0),(3,11,51,8,13,0,0,0,0),(3,11,52,3,8,0,0,0,0),(3,11,53,1,6,0,0,1,0),(3,11,54,9,14,0,0,0,0),(3,12,37,9,12,0,0,0,0),(3,12,38,7,11,0,0,0,0),(3,12,39,4,8,0,0,0,0),(3,12,40,7,11,0,0,0,0),(3,12,41,6,10,0,0,0,0),(3,12,42,10,13,0,0,0,0),(3,12,43,3,7,0,0,0,0),(3,12,44,8,12,0,0,0,0),(3,12,45,9,12,0,0,0,0),(3,12,46,8,11,0,0,0,0),(3,12,47,8,12,0,0,0,0),(3,12,48,8,12,0,0,0,0),(3,12,49,8,12,0,0,0,0),(3,12,50,4,8,0,0,0,0),(3,12,51,6,11,0,0,0,0),(3,12,52,7,12,0,0,0,0),(3,12,53,2,7,0,0,0,1),(3,12,54,-1,4,1,0,0,0),(3,13,55,9,12,0,0,0,0),(3,13,56,2,5,0,0,0,1),(3,13,57,5,8,0,0,0,0),(3,13,58,8,11,0,0,0,0),(3,13,59,6,9,0,0,0,0),(3,13,60,8,11,0,0,0,0),(3,13,61,9,13,0,0,0,0),(3,13,62,3,7,0,0,0,0),(3,13,63,7,11,0,0,0,0),(3,13,64,8,12,0,0,0,0),(3,13,65,6,10,0,0,0,0),(3,13,66,8,12,0,0,0,0),(3,13,67,5,10,0,0,0,0),(3,13,68,2,7,0,0,0,1),(3,13,69,4,9,0,0,0,0),(3,13,70,3,8,0,0,0,0),(3,13,71,0,5,0,0,0,0),(3,13,72,4,9,0,0,0,0),(3,14,55,9,12,0,0,0,0),(3,14,56,8,11,0,0,0,0),(3,14,57,5,8,0,0,0,0),(3,14,58,8,11,0,0,0,0),(3,14,59,1,4,0,0,1,0),(3,14,60,8,11,0,0,0,0),(3,14,61,7,11,0,0,0,0),(3,14,62,5,9,0,0,0,0),(3,14,63,7,11,0,0,0,0),(3,14,64,7,11,0,0,0,0),(3,14,65,9,13,0,0,0,0),(3,14,66,9,13,0,0,0,0),(3,14,67,4,9,0,0,0,0),(3,14,68,6,11,0,0,0,0),(3,14,69,8,13,0,0,0,0),(3,14,70,8,13,0,0,0,0),(3,14,71,6,11,0,0,0,0),(3,14,72,5,10,0,0,0,0),(3,15,55,4,7,0,0,0,0),(3,15,56,8,11,0,0,0,0),(3,15,57,7,10,0,0,0,0),(3,15,58,8,11,0,0,0,0),(3,15,59,9,12,0,0,0,0),(3,15,60,9,12,0,0,0,0),(3,15,61,5,9,0,0,0,0),(3,15,62,5,9,0,0,0,0),(3,15,63,7,11,0,0,0,0),(3,15,64,6,10,0,0,0,0),(3,15,65,6,10,0,0,0,0),(3,15,66,6,10,0,0,0,0),(3,15,67,6,11,0,0,0,0),(3,15,68,2,7,0,0,0,1),(3,15,69,5,10,0,0,0,0),(3,15,70,9,14,0,0,0,0),(3,15,71,2,7,0,0,0,1),(3,15,72,3,8,0,0,0,0),(3,16,55,0,3,0,0,0,0),(3,16,56,10,13,0,0,0,0),(3,16,57,9,12,0,0,0,0),(3,16,58,10,13,0,0,0,0),(3,16,59,1,4,0,0,1,0),(3,16,60,8,11,0,0,0,0),(3,16,61,2,6,0,0,0,1),(3,16,62,7,11,0,0,0,0),(3,16,63,7,11,0,0,0,0),(3,16,64,9,13,0,0,0,0),(3,16,65,4,8,0,0,0,0),(3,16,66,8,12,0,0,0,0),(3,16,67,4,9,0,0,0,0),(3,16,68,7,12,0,0,0,0),(3,16,69,7,12,0,0,0,0),(3,16,70,6,11,0,0,0,0),(3,16,71,9,14,0,0,0,0),(3,16,72,4,9,0,0,0,0),(3,17,73,8,11,0,0,0,0),(3,17,74,9,12,0,0,0,0),(3,17,75,8,11,0,0,0,0),(3,17,76,8,11,0,0,0,0),(3,17,77,7,10,0,0,0,0),(3,17,78,8,11,0,0,0,0),(3,17,79,7,11,0,0,0,0),(3,17,80,7,11,0,0,0,0),(3,17,81,8,12,0,0,0,0),(3,17,82,8,12,0,0,0,0),(3,17,83,7,11,0,0,0,0),(3,17,84,3,7,0,0,0,0),(3,17,85,2,7,0,0,0,1),(3,17,86,2,7,0,0,0,1),(3,17,87,5,10,0,0,0,0),(3,17,88,7,12,0,0,0,0),(3,17,89,2,7,0,0,0,1),(3,17,90,9,11,0,0,0,0),(3,18,73,8,11,0,0,0,0),(3,18,74,7,10,0,0,0,0),(3,18,75,7,10,0,0,0,0),(3,18,76,7,10,0,0,0,0),(3,18,77,2,5,0,0,0,1),(3,18,78,5,8,0,0,0,0),(3,18,79,3,7,0,0,0,0),(3,18,80,6,10,0,0,0,0),(3,18,81,-3,1,0,0,0,0),(3,18,82,7,11,0,0,0,0),(3,18,83,7,11,0,0,0,0),(3,18,84,7,11,0,0,0,0),(3,18,85,8,13,0,0,0,0),(3,18,86,0,5,0,0,0,0),(3,18,87,4,9,0,0,0,0),(3,18,88,6,11,0,0,0,0),(3,18,89,4,9,0,0,0,0),(3,18,90,9,11,0,0,0,0),(3,19,73,0,3,0,0,0,0),(3,19,74,6,9,0,0,0,0),(3,19,75,3,6,0,0,0,0),(3,19,76,7,10,0,0,0,0),(3,19,77,10,13,0,0,0,0),(3,19,78,-2,1,0,1,0,0),(3,19,79,7,11,0,0,0,0),(3,19,80,7,11,0,0,0,0),(3,19,81,6,10,0,0,0,0),(3,19,82,6,10,0,0,0,0),(3,19,83,8,12,0,0,0,0),(3,19,84,5,9,0,0,0,0),(3,19,85,-4,1,0,0,0,0),(3,19,86,4,9,0,0,0,0),(3,19,87,3,8,0,0,0,0),(3,19,88,0,5,0,0,0,0),(3,19,89,2,7,0,0,0,1),(3,19,90,4,6,0,0,0,0),(3,20,73,9,12,0,0,0,0),(3,20,74,8,11,0,0,0,0),(3,20,75,5,8,0,0,0,0),(3,20,76,9,12,0,0,0,0),(3,20,77,8,11,0,0,0,0),(3,20,78,6,9,0,0,0,0),(3,20,79,7,11,0,0,0,0),(3,20,80,8,12,0,0,0,0),(3,20,81,3,7,0,0,0,0),(3,20,82,6,10,0,0,0,0),(3,20,83,2,6,0,0,0,1),(3,20,84,8,12,0,0,0,0),(3,20,85,4,9,0,0,0,0),(3,20,86,5,10,0,0,0,0),(3,20,87,7,12,0,0,0,0),(3,20,88,-1,4,1,0,0,0),(3,20,89,7,12,0,0,0,0),(3,20,90,11,13,0,0,0,0),(4,1,1,6,11,0,0,0,0),(4,1,2,8,11,0,0,0,0),(4,1,3,6,10,0,0,0,0),(4,1,4,8,11,0,0,0,0),(4,1,5,6,10,0,0,0,0),(4,1,6,6,10,0,0,0,0),(4,1,7,8,12,0,0,0,0),(4,1,8,4,7,0,0,0,0),(4,1,9,6,10,0,0,0,0),(4,1,10,4,8,0,0,0,0),(4,1,11,5,9,0,0,0,0),(4,1,12,6,10,0,0,0,0),(4,1,13,4,8,0,0,0,0),(4,1,14,5,10,0,0,0,0),(4,1,15,7,12,0,0,0,0),(4,1,16,1,6,0,0,1,0),(4,1,17,4,9,0,0,0,0),(4,1,18,-2,3,0,1,0,0),(4,2,1,4,9,0,0,0,0),(4,2,2,7,10,0,0,0,0),(4,2,3,5,9,0,0,0,0),(4,2,4,10,13,0,0,0,0),(4,2,5,8,12,0,0,0,0),(4,2,6,4,8,0,0,0,0),(4,2,7,7,11,0,0,0,0),(4,2,8,10,13,0,0,0,0),(4,2,9,8,12,0,0,0,0),(4,2,10,3,7,0,0,0,0),(4,2,11,9,13,0,0,0,0),(4,2,12,5,9,0,0,0,0),(4,2,13,4,8,0,0,0,0),(4,2,14,2,7,0,0,0,1),(4,2,15,5,10,0,0,0,0),(4,2,16,0,5,0,0,0,0),(4,2,17,-2,3,0,1,0,0),(4,2,18,-4,1,0,0,0,0),(4,3,1,3,8,0,0,0,0),(4,3,2,9,12,0,0,0,0),(4,3,3,6,10,0,0,0,0),(4,3,4,10,13,0,0,0,0),(4,3,5,6,10,0,0,0,0),(4,3,6,5,9,0,0,0,0),(4,3,7,4,8,0,0,0,0),(4,3,8,8,11,0,0,0,0),(4,3,9,6,10,0,0,0,0),(4,3,10,5,9,0,0,0,0),(4,3,11,7,11,0,0,0,0),(4,3,12,7,11,0,0,0,0),(4,3,13,8,12,0,0,0,0),(4,3,14,6,11,0,0,0,0),(4,3,15,6,11,0,0,0,0),(4,3,16,2,7,0,0,0,1),(4,3,17,2,7,0,0,0,1),(4,3,18,7,12,0,0,0,0),(4,4,1,4,9,0,0,0,0),(4,4,2,8,11,0,0,0,0),(4,4,3,5,9,0,0,0,0),(4,4,4,8,11,0,0,0,0),(4,4,5,5,9,0,0,0,0),(4,4,6,6,10,0,0,0,0),(4,4,7,5,9,0,0,0,0),(4,4,8,9,12,0,0,0,0),(4,4,9,6,10,0,0,0,0),(4,4,10,6,10,0,0,0,0),(4,4,11,4,8,0,0,0,0),(4,4,12,7,11,0,0,0,0),(4,4,13,6,10,0,0,0,0),(4,4,14,5,10,0,0,0,0),(4,4,15,5,10,0,0,0,0),(4,4,16,7,12,0,0,0,0),(4,4,17,5,10,0,0,0,0),(4,4,18,4,9,0,0,0,0),(4,5,19,3,6,0,0,0,0),(4,5,20,8,12,0,0,0,0),(4,5,21,7,11,0,0,0,0),(4,5,22,7,11,0,0,0,0),(4,5,23,7,11,0,0,0,0),(4,5,24,2,6,0,0,0,1),(4,5,25,8,12,0,0,0,0),(4,5,26,-1,3,1,0,0,0),(4,5,27,8,12,0,0,0,0),(4,5,28,9,12,0,0,0,0),(4,5,29,8,12,0,0,0,0),(4,5,30,6,9,0,0,0,0),(4,5,31,9,12,0,0,0,0),(4,5,32,5,9,0,0,0,0),(4,5,33,6,11,0,0,0,0),(4,5,34,8,13,0,0,0,0),(4,5,35,6,11,0,0,0,0),(4,5,36,7,12,0,0,0,0),(4,6,19,6,9,0,0,0,0),(4,6,20,7,11,0,0,0,0),(4,6,21,8,12,0,0,0,0),(4,6,22,7,11,0,0,0,0),(4,6,23,-1,3,1,0,0,0),(4,6,24,3,7,0,0,0,0),(4,6,25,8,12,0,0,0,0),(4,6,26,6,10,0,0,0,0),(4,6,27,6,10,0,0,0,0),(4,6,28,4,7,0,0,0,0),(4,6,29,4,8,0,0,0,0),(4,6,30,0,3,0,0,0,0),(4,6,31,3,6,0,0,0,0),(4,6,32,6,10,0,0,0,0),(4,6,33,6,11,0,0,0,0),(4,6,34,5,10,0,0,0,0),(4,6,35,4,9,0,0,0,0),(4,6,36,6,11,0,0,0,0),(4,7,19,8,11,0,0,0,0),(4,7,20,0,4,0,0,0,0),(4,7,21,8,12,0,0,0,0),(4,7,22,5,9,0,0,0,0),(4,7,23,8,12,0,0,0,0),(4,7,24,5,9,0,0,0,0),(4,7,25,7,11,0,0,0,0),(4,7,26,6,10,0,0,0,0),(4,7,27,6,10,0,0,0,0),(4,7,28,7,10,0,0,0,0),(4,7,29,6,10,0,0,0,0),(4,7,30,6,9,0,0,0,0),(4,7,31,10,13,0,0,0,0),(4,7,32,3,7,0,0,0,0),(4,7,33,4,9,0,0,0,0),(4,7,34,7,12,0,0,0,0),(4,7,35,4,9,0,0,0,0),(4,7,36,6,11,0,0,0,0),(4,8,19,10,13,0,0,0,0),(4,8,20,4,8,0,0,0,0),(4,8,21,8,12,0,0,0,0),(4,8,22,0,4,0,0,0,0),(4,8,23,8,12,0,0,0,0),(4,8,24,1,5,0,0,1,0),(4,8,25,3,7,0,0,0,0),(4,8,26,7,11,0,0,0,0),(4,8,27,3,7,0,0,0,0),(4,8,28,9,12,0,0,0,0),(4,8,29,4,8,0,0,0,0),(4,8,30,6,9,0,0,0,0),(4,8,31,9,12,0,0,0,0),(4,8,32,4,8,0,0,0,0),(4,8,33,5,10,0,0,0,0),(4,8,34,6,11,0,0,0,0),(4,8,35,1,6,0,0,1,0),(4,8,36,7,12,0,0,0,0),(4,9,37,5,8,0,0,0,0),(4,9,38,7,11,0,0,0,0),(4,9,39,7,11,0,0,0,0),(4,9,40,6,10,0,0,0,0),(4,9,41,6,10,0,0,0,0),(4,9,42,8,11,0,0,0,0),(4,9,43,4,8,0,0,0,0),(4,9,44,4,8,0,0,0,0),(4,9,45,9,12,0,0,0,0),(4,9,46,11,14,0,0,0,0),(4,9,47,3,7,0,0,0,0),(4,9,48,5,9,0,0,0,0),(4,9,49,7,11,0,0,0,0),(4,9,50,0,4,0,0,0,0),(4,9,51,6,11,0,0,0,0),(4,9,52,6,11,0,0,0,0),(4,9,53,6,11,0,0,0,0),(4,9,54,4,9,0,0,0,0),(4,10,37,3,6,0,0,0,0),(4,10,38,3,7,0,0,0,0),(4,10,39,7,11,0,0,0,0),(4,10,40,7,11,0,0,0,0),(4,10,41,7,11,0,0,0,0),(4,10,42,4,7,0,0,0,0),(4,10,43,6,10,0,0,0,0),(4,10,44,9,13,0,0,0,0),(4,10,45,7,10,0,0,0,0),(4,10,46,10,13,0,0,0,0),(4,10,47,4,8,0,0,0,0),(4,10,48,2,6,0,0,0,1),(4,10,49,5,9,0,0,0,0),(4,10,50,11,15,0,0,0,0),(4,10,51,5,10,0,0,0,0),(4,10,52,6,11,0,0,0,0),(4,10,53,8,13,0,0,0,0),(4,10,54,6,11,0,0,0,0),(4,11,37,3,6,0,0,0,0),(4,11,38,1,5,0,0,1,0),(4,11,39,6,10,0,0,0,0),(4,11,40,6,10,0,0,0,0),(4,11,41,4,8,0,0,0,0),(4,11,42,5,8,0,0,0,0),(4,11,43,8,12,0,0,0,0),(4,11,44,5,9,0,0,0,0),(4,11,45,4,7,0,0,0,0),(4,11,46,8,11,0,0,0,0),(4,11,47,5,9,0,0,0,0),(4,11,48,3,7,0,0,0,0),(4,11,49,7,11,0,0,0,0),(4,11,50,8,12,0,0,0,0),(4,11,51,4,9,0,0,0,0),(4,11,52,4,9,0,0,0,0),(4,11,53,7,12,0,0,0,0),(4,11,54,4,9,0,0,0,0),(4,12,37,5,8,0,0,0,0),(4,12,38,7,11,0,0,0,0),(4,12,39,5,9,0,0,0,0),(4,12,40,7,11,0,0,0,0),(4,12,41,2,6,0,0,0,1),(4,12,42,0,3,0,0,0,0),(4,12,43,6,10,0,0,0,0),(4,12,44,5,9,0,0,0,0),(4,12,45,8,11,0,0,0,0),(4,12,46,5,8,0,0,0,0),(4,12,47,5,9,0,0,0,0),(4,12,48,6,10,0,0,0,0),(4,12,49,4,8,0,0,0,0),(4,12,50,7,11,0,0,0,0),(4,12,51,8,13,0,0,0,0),(4,12,52,5,10,0,0,0,0),(4,12,53,-1,4,1,0,0,0),(4,12,54,-1,4,1,0,0,0),(4,13,55,4,7,0,0,0,0),(4,13,56,9,12,0,0,0,0),(4,13,57,7,10,0,0,0,0),(4,13,58,8,11,0,0,0,0),(4,13,59,8,11,0,0,0,0),(4,13,60,10,13,0,0,0,0),(4,13,61,2,6,0,0,0,1),(4,13,62,3,7,0,0,0,0),(4,13,63,7,11,0,0,0,0),(4,13,64,7,11,0,0,0,0),(4,13,65,2,6,0,0,0,1),(4,13,66,8,12,0,0,0,0),(4,13,67,6,11,0,0,0,0),(4,13,68,5,10,0,0,0,0),(4,13,69,6,11,0,0,0,0),(4,13,70,6,11,0,0,0,0),(4,13,71,7,12,0,0,0,0),(4,13,72,-1,4,1,0,0,0),(4,14,55,3,6,0,0,0,0),(4,14,56,6,9,0,0,0,0),(4,14,57,8,11,0,0,0,0),(4,14,58,10,13,0,0,0,0),(4,14,59,8,11,0,0,0,0),(4,14,60,5,8,0,0,0,0),(4,14,61,8,12,0,0,0,0),(4,14,62,7,11,0,0,0,0),(4,14,63,1,5,0,0,1,0),(4,14,64,6,10,0,0,0,0),(4,14,65,5,9,0,0,0,0),(4,14,66,4,8,0,0,0,0),(4,14,67,7,12,0,0,0,0),(4,14,68,7,12,0,0,0,0),(4,14,69,-1,4,1,0,0,0),(4,14,70,7,12,0,0,0,0),(4,14,71,4,9,0,0,0,0),(4,14,72,5,10,0,0,0,0),(4,15,55,5,8,0,0,0,0),(4,15,56,1,4,0,0,1,0),(4,15,57,6,9,0,0,0,0),(4,15,58,5,8,0,0,0,0),(4,15,59,6,9,0,0,0,0),(4,15,60,8,11,0,0,0,0),(4,15,61,9,13,0,0,0,0),(4,15,62,8,12,0,0,0,0),(4,15,63,5,9,0,0,0,0),(4,15,64,8,12,0,0,0,0),(4,15,65,9,13,0,0,0,0),(4,15,66,6,10,0,0,0,0),(4,15,67,2,7,0,0,0,1),(4,15,68,4,9,0,0,0,0),(4,15,69,6,11,0,0,0,0),(4,15,70,7,12,0,0,0,0),(4,15,71,5,10,0,0,0,0),(4,15,72,8,13,0,0,0,0),(4,16,55,7,10,0,0,0,0),(4,16,56,10,13,0,0,0,0),(4,16,57,8,11,0,0,0,0),(4,16,58,9,12,0,0,0,0),(4,16,59,9,12,0,0,0,0),(4,16,60,0,3,0,0,0,0),(4,16,61,0,4,0,0,0,0),(4,16,62,7,11,0,0,0,0),(4,16,63,8,12,0,0,0,0),(4,16,64,5,9,0,0,0,0),(4,16,65,7,11,0,0,0,0),(4,16,66,7,11,0,0,0,0),(4,16,67,8,13,0,0,0,0),(4,16,68,5,10,0,0,0,0),(4,16,69,3,8,0,0,0,0),(4,16,70,4,9,0,0,0,0),(4,16,71,5,10,0,0,0,0),(4,16,72,5,10,0,0,0,0),(4,17,73,2,5,0,0,0,1),(4,17,74,2,5,0,0,0,1),(4,17,75,7,10,0,0,0,0),(4,17,76,8,11,0,0,0,0),(4,17,77,8,11,0,0,0,0),(4,17,78,7,10,0,0,0,0),(4,17,79,3,7,0,0,0,0),(4,17,80,8,12,0,0,0,0),(4,17,81,8,12,0,0,0,0),(4,17,82,1,5,0,0,1,0),(4,17,83,6,10,0,0,0,0),(4,17,84,4,8,0,0,0,0),(4,17,85,7,12,0,0,0,0),(4,17,86,3,8,0,0,0,0),(4,17,87,5,10,0,0,0,0),(4,17,88,5,10,0,0,0,0),(4,17,89,7,12,0,0,0,0),(4,17,90,-1,1,1,0,0,0),(4,18,73,5,8,0,0,0,0),(4,18,74,4,7,0,0,0,0),(4,18,75,2,5,0,0,0,1),(4,18,76,5,8,0,0,0,0),(4,18,77,7,10,0,0,0,0),(4,18,78,3,6,0,0,0,0),(4,18,79,8,12,0,0,0,0),(4,18,80,7,11,0,0,0,0),(4,18,81,7,11,0,0,0,0),(4,18,82,8,12,0,0,0,0),(4,18,83,5,9,0,0,0,0),(4,18,84,-1,3,1,0,0,0),(4,18,85,0,5,0,0,0,0),(4,18,86,7,12,0,0,0,0),(4,18,87,6,11,0,0,0,0),(4,18,88,5,10,0,0,0,0),(4,18,89,3,8,0,0,0,0),(4,18,90,7,9,0,0,0,0),(4,19,73,6,9,0,0,0,0),(4,19,74,5,8,0,0,0,0),(4,19,75,3,6,0,0,0,0),(4,19,76,8,11,0,0,0,0),(4,19,77,8,11,0,0,0,0),(4,19,78,7,10,0,0,0,0),(4,19,79,7,11,0,0,0,0),(4,19,80,3,7,0,0,0,0),(4,19,81,8,12,0,0,0,0),(4,19,82,3,7,0,0,0,0),(4,19,83,8,12,0,0,0,0),(4,19,84,8,12,0,0,0,0),(4,19,85,6,11,0,0,0,0),(4,19,86,5,10,0,0,0,0),(4,19,87,5,10,0,0,0,0),(4,19,88,5,10,0,0,0,0),(4,19,89,6,11,0,0,0,0),(4,19,90,4,6,0,0,0,0),(4,20,73,9,12,0,0,0,0),(4,20,74,7,10,0,0,0,0),(4,20,75,10,13,0,0,0,0),(4,20,76,8,11,0,0,0,0),(4,20,77,7,10,0,0,0,0),(4,20,78,6,9,0,0,0,0),(4,20,79,-1,3,1,0,0,0),(4,20,80,7,11,0,0,0,0),(4,20,81,9,13,0,0,0,0),(4,20,82,6,10,0,0,0,0),(4,20,83,10,14,0,0,0,0),(4,20,84,5,9,0,0,0,0),(4,20,85,-4,1,0,0,0,0),(4,20,86,6,11,0,0,0,0),(4,20,87,6,11,0,0,0,0),(4,20,88,7,12,0,0,0,0),(4,20,89,6,11,0,0,0,0),(4,20,90,10,12,0,0,0,0),(5,1,1,7,12,0,0,0,0),(5,1,2,5,8,0,0,0,0),(5,1,3,3,7,0,0,0,0),(5,1,4,5,8,0,0,0,0),(5,1,5,5,9,0,0,0,0),(5,1,6,7,11,0,0,0,0),(5,1,7,7,11,0,0,0,0),(5,1,8,4,7,0,0,0,0),(5,1,9,7,11,0,0,0,0),(5,1,10,7,11,0,0,0,0),(5,1,11,5,9,0,0,0,0),(5,1,12,4,8,0,0,0,0),(5,1,13,6,10,0,0,0,0),(5,1,14,3,8,0,0,0,0),(5,1,15,8,13,0,0,0,0),(5,1,16,4,9,0,0,0,0),(5,1,17,5,10,0,0,0,0),(5,1,18,7,12,0,0,0,0),(5,2,1,2,7,0,0,0,1),(5,2,2,7,10,0,0,0,0),(5,2,3,5,9,0,0,0,0),(5,2,4,9,12,0,0,0,0),(5,2,5,5,9,0,0,0,0),(5,2,6,5,9,0,0,0,0),(5,2,7,5,9,0,0,0,0),(5,2,8,4,7,0,0,0,0),(5,2,9,8,12,0,0,0,0),(5,2,10,6,10,0,0,0,0),(5,2,11,8,12,0,0,0,0),(5,2,12,3,7,0,0,0,0),(5,2,13,7,11,0,0,0,0),(5,2,14,6,11,0,0,0,0),(5,2,15,7,12,0,0,0,0),(5,2,16,-1,4,1,0,0,0),(5,2,17,4,9,0,0,0,0),(5,2,18,-1,4,1,0,0,0),(5,3,1,5,10,0,0,0,0),(5,3,2,3,6,0,0,0,0),(5,3,3,7,11,0,0,0,0),(5,3,4,8,11,0,0,0,0),(5,3,5,7,11,0,0,0,0),(5,3,6,3,7,0,0,0,0),(5,3,7,7,11,0,0,0,0),(5,3,8,10,13,0,0,0,0),(5,3,9,9,13,0,0,0,0),(5,3,10,7,11,0,0,0,0),(5,3,11,2,6,0,0,0,1),(5,3,12,4,8,0,0,0,0),(5,3,13,8,12,0,0,0,0),(5,3,14,4,9,0,0,0,0),(5,3,15,7,12,0,0,0,0),(5,3,16,3,8,0,0,0,0),(5,3,17,4,9,0,0,0,0),(5,3,18,6,11,0,0,0,0),(5,4,1,4,9,0,0,0,0),(5,4,2,8,11,0,0,0,0),(5,4,3,3,7,0,0,0,0),(5,4,4,1,4,0,0,1,0),(5,4,5,7,11,0,0,0,0),(5,4,6,2,6,0,0,0,1),(5,4,7,6,10,0,0,0,0),(5,4,8,9,12,0,0,0,0),(5,4,9,6,10,0,0,0,0),(5,4,10,6,10,0,0,0,0),(5,4,11,3,7,0,0,0,0),(5,4,12,7,11,0,0,0,0),(5,4,13,3,7,0,0,0,0),(5,4,14,-1,4,1,0,0,0),(5,4,15,-1,4,1,0,0,0),(5,4,16,-1,4,1,0,0,0),(5,4,17,3,8,0,0,0,0),(5,4,18,7,12,0,0,0,0),(5,5,19,7,10,0,0,0,0),(5,5,20,-1,3,1,0,0,0),(5,5,21,7,11,0,0,0,0),(5,5,22,5,9,0,0,0,0),(5,5,23,4,8,0,0,0,0),(5,5,24,0,4,0,0,0,0),(5,5,25,7,11,0,0,0,0),(5,5,26,8,12,0,0,0,0),(5,5,27,8,12,0,0,0,0),(5,5,28,7,10,0,0,0,0),(5,5,29,5,9,0,0,0,0),(5,5,30,1,4,0,0,1,0),(5,5,31,6,9,0,0,0,0),(5,5,32,7,11,0,0,0,0),(5,5,33,7,12,0,0,0,0),(5,5,34,6,11,0,0,0,0),(5,5,35,7,12,0,0,0,0),(5,5,36,4,9,0,0,0,0),(5,6,19,9,12,0,0,0,0),(5,6,20,5,9,0,0,0,0),(5,6,21,8,12,0,0,0,0),(5,6,22,7,11,0,0,0,0),(5,6,23,8,12,0,0,0,0),(5,6,24,5,9,0,0,0,0),(5,6,25,5,9,0,0,0,0),(5,6,26,8,12,0,0,0,0),(5,6,27,0,4,0,0,0,0),(5,6,28,0,3,0,0,0,0),(5,6,29,2,6,0,0,0,1),(5,6,30,3,6,0,0,0,0),(5,6,31,10,13,0,0,0,0),(5,6,32,7,11,0,0,0,0),(5,6,33,4,9,0,0,0,0),(5,6,34,5,10,0,0,0,0),(5,6,35,5,10,0,0,0,0),(5,6,36,6,11,0,0,0,0),(5,7,19,10,13,0,0,0,0),(5,7,20,-1,3,1,0,0,0),(5,7,21,8,12,0,0,0,0),(5,7,22,7,11,0,0,0,0),(5,7,23,7,11,0,0,0,0),(5,7,24,8,12,0,0,0,0),(5,7,25,7,11,0,0,0,0),(5,7,26,10,14,0,0,0,0),(5,7,27,7,11,0,0,0,0),(5,7,28,5,8,0,0,0,0),(5,7,29,5,9,0,0,0,0),(5,7,30,10,13,0,0,0,0),(5,7,31,2,5,0,0,0,1),(5,7,32,8,12,0,0,0,0),(5,7,33,5,10,0,0,0,0),(5,7,34,4,9,0,0,0,0),(5,7,35,5,10,0,0,0,0),(5,7,36,3,8,0,0,0,0),(5,8,19,5,8,0,0,0,0),(5,8,20,7,11,0,0,0,0),(5,8,21,7,11,0,0,0,0),(5,8,22,6,10,0,0,0,0),(5,8,23,6,10,0,0,0,0),(5,8,24,7,11,0,0,0,0),(5,8,25,6,10,0,0,0,0),(5,8,26,8,12,0,0,0,0),(5,8,27,7,11,0,0,0,0),(5,8,28,8,11,0,0,0,0),(5,8,29,8,12,0,0,0,0),(5,8,30,8,11,0,0,0,0),(5,8,31,9,12,0,0,0,0),(5,8,32,5,9,0,0,0,0),(5,8,33,7,12,0,0,0,0),(5,8,34,6,11,0,0,0,0),(5,8,35,6,11,0,0,0,0),(5,8,36,-1,4,1,0,0,0),(5,9,37,8,11,0,0,0,0),(5,9,38,7,11,0,0,0,0),(5,9,39,4,8,0,0,0,0),(5,9,40,8,12,0,0,0,0),(5,9,41,7,11,0,0,0,0),(5,9,42,3,6,0,0,0,0),(5,9,43,6,10,0,0,0,0),(5,9,44,6,10,0,0,0,0),(5,9,45,9,12,0,0,0,0),(5,9,46,8,11,0,0,0,0),(5,9,47,0,4,0,0,0,0),(5,9,48,7,11,0,0,0,0),(5,9,49,9,13,0,0,0,0),(5,9,50,11,15,0,0,0,0),(5,9,51,7,12,0,0,0,0),(5,9,52,6,11,0,0,0,0),(5,9,53,5,10,0,0,0,0),(5,9,54,3,8,0,0,0,0),(5,10,37,-2,1,0,1,0,0),(5,10,38,8,12,0,0,0,0),(5,10,39,9,13,0,0,0,0),(5,10,40,-3,1,0,0,0,0),(5,10,41,4,8,0,0,0,0),(5,10,42,8,11,0,0,0,0),(5,10,43,2,6,0,0,0,1),(5,10,44,7,11,0,0,0,0),(5,10,45,6,9,0,0,0,0),(5,10,46,8,11,0,0,0,0),(5,10,47,7,11,0,0,0,0),(5,10,48,3,7,0,0,0,0),(5,10,49,6,10,0,0,0,0),(5,10,50,-1,3,1,0,0,0),(5,10,51,2,7,0,0,0,1),(5,10,52,5,10,0,0,0,0),(5,10,53,7,12,0,0,0,0),(5,10,54,7,12,0,0,0,0),(5,11,37,5,8,0,0,0,0),(5,11,38,8,12,0,0,0,0),(5,11,39,7,11,0,0,0,0),(5,11,40,6,10,0,0,0,0),(5,11,41,5,9,0,0,0,0),(5,11,42,8,11,0,0,0,0),(5,11,43,2,6,0,0,0,1),(5,11,44,6,10,0,0,0,0),(5,11,45,4,7,0,0,0,0),(5,11,46,7,10,0,0,0,0),(5,11,47,2,6,0,0,0,1),(5,11,48,8,12,0,0,0,0),(5,11,49,9,13,0,0,0,0),(5,11,50,5,9,0,0,0,0),(5,11,51,-1,4,1,0,0,0),(5,11,52,7,12,0,0,0,0),(5,11,53,5,10,0,0,0,0),(5,11,54,5,10,0,0,0,0),(5,12,37,1,4,0,0,1,0),(5,12,38,3,7,0,0,0,0),(5,12,39,4,8,0,0,0,0),(5,12,40,7,11,0,0,0,0),(5,12,41,6,10,0,0,0,0),(5,12,42,0,3,0,0,0,0),(5,12,43,6,10,0,0,0,0),(5,12,44,4,8,0,0,0,0),(5,12,45,8,11,0,0,0,0),(5,12,46,6,9,0,0,0,0),(5,12,47,8,12,0,0,0,0),(5,12,48,0,4,0,0,0,0),(5,12,49,7,11,0,0,0,0),(5,12,50,8,12,0,0,0,0),(5,12,51,-2,3,0,1,0,0),(5,12,52,5,10,0,0,0,0),(5,12,53,3,8,0,0,0,0),(5,12,54,5,10,0,0,0,0),(5,13,55,5,8,0,0,0,0),(5,13,56,8,11,0,0,0,0),(5,13,57,7,10,0,0,0,0),(5,13,58,7,10,0,0,0,0),(5,13,59,8,11,0,0,0,0),(5,13,60,6,9,0,0,0,0),(5,13,61,1,5,0,0,1,0),(5,13,62,5,9,0,0,0,0),(5,13,63,7,11,0,0,0,0),(5,13,64,6,10,0,0,0,0),(5,13,65,7,11,0,0,0,0),(5,13,66,5,9,0,0,0,0),(5,13,67,8,13,0,0,0,0),(5,13,68,7,12,0,0,0,0),(5,13,69,2,7,0,0,0,1),(5,13,70,1,6,0,0,1,0),(5,13,71,7,12,0,0,0,0),(5,13,72,5,10,0,0,0,0),(5,14,55,8,11,0,0,0,0),(5,14,56,8,11,0,0,0,0),(5,14,57,6,9,0,0,0,0),(5,14,58,4,7,0,0,0,0),(5,14,59,10,13,0,0,0,0),(5,14,60,5,8,0,0,0,0),(5,14,61,6,10,0,0,0,0),(5,14,62,1,5,0,0,1,0),(5,14,63,8,12,0,0,0,0),(5,14,64,9,13,0,0,0,0),(5,14,65,8,12,0,0,0,0),(5,14,66,5,9,0,0,0,0),(5,14,67,7,12,0,0,0,0),(5,14,68,7,12,0,0,0,0),(5,14,69,5,10,0,0,0,0),(5,14,70,5,10,0,0,0,0),(5,14,71,4,9,0,0,0,0),(5,14,72,7,12,0,0,0,0),(5,15,55,6,9,0,0,0,0),(5,15,56,7,10,0,0,0,0),(5,15,57,1,4,0,0,1,0),(5,15,58,6,9,0,0,0,0),(5,15,59,2,5,0,0,0,1),(5,15,60,10,13,0,0,0,0),(5,15,61,9,13,0,0,0,0),(5,15,62,6,10,0,0,0,0),(5,15,63,6,10,0,0,0,0),(5,15,64,7,11,0,0,0,0),(5,15,65,8,12,0,0,0,0),(5,15,66,6,10,0,0,0,0),(5,15,67,6,11,0,0,0,0),(5,15,68,7,12,0,0,0,0),(5,15,69,5,10,0,0,0,0),(5,15,70,6,11,0,0,0,0),(5,15,71,5,10,0,0,0,0),(5,15,72,3,8,0,0,0,0),(5,16,55,4,7,0,0,0,0),(5,16,56,10,13,0,0,0,0),(5,16,57,10,13,0,0,0,0),(5,16,58,4,7,0,0,0,0),(5,16,59,8,11,0,0,0,0),(5,16,60,0,3,0,0,0,0),(5,16,61,7,11,0,0,0,0),(5,16,62,6,10,0,0,0,0),(5,16,63,-1,3,1,0,0,0),(5,16,64,7,11,0,0,0,0),(5,16,65,1,5,0,0,1,0),(5,16,66,7,11,0,0,0,0),(5,16,67,4,9,0,0,0,0),(5,16,68,8,13,0,0,0,0),(5,16,69,1,6,0,0,1,0),(5,16,70,7,12,0,0,0,0),(5,16,71,2,7,0,0,0,1),(5,16,72,7,12,0,0,0,0),(5,17,73,5,8,0,0,0,0),(5,17,74,4,7,0,0,0,0),(5,17,75,7,10,0,0,0,0),(5,17,76,2,5,0,0,0,1),(5,17,77,8,11,0,0,0,0),(5,17,78,6,9,0,0,0,0),(5,17,79,4,8,0,0,0,0),(5,17,80,4,8,0,0,0,0),(5,17,81,8,12,0,0,0,0),(5,17,82,2,6,0,0,0,1),(5,17,83,7,11,0,0,0,0),(5,17,84,6,10,0,0,0,0),(5,17,85,-1,4,1,0,0,0),(5,17,86,4,9,0,0,0,0),(5,17,87,6,11,0,0,0,0),(5,17,88,6,11,0,0,0,0),(5,17,89,4,9,0,0,0,0),(5,17,90,2,4,0,0,0,1),(5,18,73,10,13,0,0,0,0),(5,18,74,9,12,0,0,0,0),(5,18,75,6,9,0,0,0,0),(5,18,76,8,11,0,0,0,0),(5,18,77,7,10,0,0,0,0),(5,18,78,2,5,0,0,0,1),(5,18,79,3,7,0,0,0,0),(5,18,80,10,14,0,0,0,0),(5,18,81,7,11,0,0,0,0),(5,18,82,3,7,0,0,0,0),(5,18,83,4,8,0,0,0,0),(5,18,84,2,6,0,0,0,1),(5,18,85,7,12,0,0,0,0),(5,18,86,4,9,0,0,0,0),(5,18,87,-1,4,1,0,0,0),(5,18,88,5,10,0,0,0,0),(5,18,89,8,13,0,0,0,0),(5,18,90,9,11,0,0,0,0),(5,19,73,8,11,0,0,0,0),(5,19,74,7,10,0,0,0,0),(5,19,75,8,11,0,0,0,0),(5,19,76,8,11,0,0,0,0),(5,19,77,8,11,0,0,0,0),(5,19,78,5,8,0,0,0,0),(5,19,79,0,4,0,0,0,0),(5,19,80,0,4,0,0,0,0),(5,19,81,7,11,0,0,0,0),(5,19,82,7,11,0,0,0,0),(5,19,83,5,9,0,0,0,0),(5,19,84,8,12,0,0,0,0),(5,19,85,4,9,0,0,0,0),(5,19,86,7,12,0,0,0,0),(5,19,87,7,12,0,0,0,0),(5,19,88,5,10,0,0,0,0),(5,19,89,6,11,0,0,0,0),(5,19,90,10,12,0,0,0,0),(5,20,73,7,10,0,0,0,0),(5,20,74,8,11,0,0,0,0),(5,20,75,10,13,0,0,0,0),(5,20,76,9,12,0,0,0,0),(5,20,77,8,11,0,0,0,0),(5,20,78,10,13,0,0,0,0),(5,20,79,7,11,0,0,0,0),(5,20,80,7,11,0,0,0,0),(5,20,81,6,10,0,0,0,0),(5,20,82,0,4,0,0,0,0),(5,20,83,8,12,0,0,0,0),(5,20,84,7,11,0,0,0,0),(5,20,85,7,12,0,0,0,0),(5,20,86,3,8,0,0,0,0),(5,20,87,5,10,0,0,0,0),(5,20,88,7,12,0,0,0,0),(5,20,89,6,11,0,0,0,0),(5,20,90,6,8,0,0,0,0),(6,1,1,6,11,0,0,0,0),(6,1,2,11,14,0,0,0,0),(6,1,3,-1,3,1,0,0,0),(6,1,4,8,11,0,0,0,0),(6,1,5,6,10,0,0,0,0),(6,1,6,4,8,0,0,0,0),(6,1,7,3,7,0,0,0,0),(6,1,8,6,9,0,0,0,0),(6,1,9,4,8,0,0,0,0),(6,1,10,6,10,0,0,0,0),(6,1,11,4,8,0,0,0,0),(6,1,12,0,4,0,0,0,0),(6,1,13,6,10,0,0,0,0),(6,1,14,2,7,0,0,0,1),(6,1,15,6,11,0,0,0,0),(6,1,16,6,11,0,0,0,0),(6,1,17,7,12,0,0,0,0),(6,1,18,2,7,0,0,0,1),(6,2,1,4,9,0,0,0,0),(6,2,2,9,12,0,0,0,0),(6,2,3,4,8,0,0,0,0),(6,2,4,9,12,0,0,0,0),(6,2,5,0,4,0,0,0,0),(6,2,6,7,11,0,0,0,0),(6,2,7,9,13,0,0,0,0),(6,2,8,5,8,0,0,0,0),(6,2,9,8,12,0,0,0,0),(6,2,10,8,12,0,0,0,0),(6,2,11,8,12,0,0,0,0),(6,2,12,8,12,0,0,0,0),(6,2,13,7,11,0,0,0,0),(6,2,14,7,12,0,0,0,0),(6,2,15,6,11,0,0,0,0),(6,2,16,8,13,0,0,0,0),(6,2,17,1,6,0,0,1,0),(6,2,18,7,12,0,0,0,0),(6,3,1,3,8,0,0,0,0),(6,3,2,8,11,0,0,0,0),(6,3,3,5,9,0,0,0,0),(6,3,4,7,10,0,0,0,0),(6,3,5,2,6,0,0,0,1),(6,3,6,3,7,0,0,0,0),(6,3,7,7,11,0,0,0,0),(6,3,8,9,12,0,0,0,0),(6,3,9,-1,3,1,0,0,0),(6,3,10,7,11,0,0,0,0),(6,3,11,8,12,0,0,0,0),(6,3,12,6,10,0,0,0,0),(6,3,13,5,9,0,0,0,0),(6,3,14,7,12,0,0,0,0),(6,3,15,6,11,0,0,0,0),(6,3,16,4,9,0,0,0,0),(6,3,17,6,11,0,0,0,0),(6,3,18,1,6,0,0,1,0),(6,4,1,-1,4,1,0,0,0),(6,4,2,10,13,0,0,0,0),(6,4,3,7,11,0,0,0,0),(6,4,4,5,8,0,0,0,0),(6,4,5,2,6,0,0,0,1),(6,4,6,8,12,0,0,0,0),(6,4,7,6,10,0,0,0,0),(6,4,8,11,14,0,0,0,0),(6,4,9,4,8,0,0,0,0),(6,4,10,8,12,0,0,0,0),(6,4,11,7,11,0,0,0,0),(6,4,12,5,9,0,0,0,0),(6,4,13,5,9,0,0,0,0),(6,4,14,4,9,0,0,0,0),(6,4,15,8,13,0,0,0,0),(6,4,16,5,10,0,0,0,0),(6,4,17,7,12,0,0,0,0),(6,4,18,2,7,0,0,0,1),(6,5,19,9,12,0,0,0,0),(6,5,20,6,10,0,0,0,0),(6,5,21,7,11,0,0,0,0),(6,5,22,2,6,0,0,0,1),(6,5,23,7,11,0,0,0,0),(6,5,24,-1,3,1,0,0,0),(6,5,25,3,7,0,0,0,0),(6,5,26,6,10,0,0,0,0),(6,5,27,5,9,0,0,0,0),(6,5,28,7,10,0,0,0,0),(6,5,29,7,11,0,0,0,0),(6,5,30,5,8,0,0,0,0),(6,5,31,10,13,0,0,0,0),(6,5,32,3,7,0,0,0,0),(6,5,33,6,11,0,0,0,0),(6,5,34,4,9,0,0,0,0),(6,5,35,1,6,0,0,1,0),(6,5,36,5,10,0,0,0,0),(6,6,19,8,11,0,0,0,0),(6,6,20,6,10,0,0,0,0),(6,6,21,7,11,0,0,0,0),(6,6,22,7,11,0,0,0,0),(6,6,23,6,10,0,0,0,0),(6,6,24,8,12,0,0,0,0),(6,6,25,9,13,0,0,0,0),(6,6,26,6,10,0,0,0,0),(6,6,27,6,10,0,0,0,0),(6,6,28,8,11,0,0,0,0),(6,6,29,8,12,0,0,0,0),(6,6,30,6,9,0,0,0,0),(6,6,31,9,12,0,0,0,0),(6,6,32,8,12,0,0,0,0),(6,6,33,9,14,0,0,0,0),(6,6,34,6,11,0,0,0,0),(6,6,35,3,8,0,0,0,0),(6,6,36,-4,1,0,0,0,0),(6,7,19,6,9,0,0,0,0),(6,7,20,7,11,0,0,0,0),(6,7,21,5,9,0,0,0,0),(6,7,22,6,10,0,0,0,0),(6,7,23,6,10,0,0,0,0),(6,7,24,5,9,0,0,0,0),(6,7,25,3,7,0,0,0,0),(6,7,26,7,11,0,0,0,0),(6,7,27,7,11,0,0,0,0),(6,7,28,4,7,0,0,0,0),(6,7,29,5,9,0,0,0,0),(6,7,30,8,11,0,0,0,0),(6,7,31,3,6,0,0,0,0),(6,7,32,9,13,0,0,0,0),(6,7,33,6,11,0,0,0,0),(6,7,34,-2,3,0,1,0,0),(6,7,35,6,11,0,0,0,0),(6,7,36,6,11,0,0,0,0),(6,8,19,9,12,0,0,0,0),(6,8,20,7,11,0,0,0,0),(6,8,21,8,12,0,0,0,0),(6,8,22,8,12,0,0,0,0),(6,8,23,7,11,0,0,0,0),(6,8,24,10,14,0,0,0,0),(6,8,25,3,7,0,0,0,0),(6,8,26,7,11,0,0,0,0),(6,8,27,5,9,0,0,0,0),(6,8,28,9,12,0,0,0,0),(6,8,29,6,10,0,0,0,0),(6,8,30,6,9,0,0,0,0),(6,8,31,9,12,0,0,0,0),(6,8,32,3,7,0,0,0,0),(6,8,33,-2,3,0,1,0,0),(6,8,34,6,11,0,0,0,0),(6,8,35,8,13,0,0,0,0),(6,8,36,3,8,0,0,0,0),(6,9,37,8,11,0,0,0,0),(6,9,38,5,9,0,0,0,0),(6,9,39,8,12,0,0,0,0),(6,9,40,5,9,0,0,0,0),(6,9,41,7,11,0,0,0,0),(6,9,42,10,13,0,0,0,0),(6,9,43,3,7,0,0,0,0),(6,9,44,7,11,0,0,0,0),(6,9,45,8,11,0,0,0,0),(6,9,46,8,11,0,0,0,0),(6,9,47,5,9,0,0,0,0),(6,9,48,6,10,0,0,0,0),(6,9,49,4,8,0,0,0,0),(6,9,50,5,9,0,0,0,0),(6,9,51,1,6,0,0,1,0),(6,9,52,3,8,0,0,0,0),(6,9,53,-2,3,0,1,0,0),(6,9,54,6,11,0,0,0,0),(6,10,37,7,10,0,0,0,0),(6,10,38,4,8,0,0,0,0),(6,10,39,7,11,0,0,0,0),(6,10,40,7,11,0,0,0,0),(6,10,41,6,10,0,0,0,0),(6,10,42,7,10,0,0,0,0),(6,10,43,4,8,0,0,0,0),(6,10,44,3,7,0,0,0,0),(6,10,45,7,10,0,0,0,0),(6,10,46,8,11,0,0,0,0),(6,10,47,5,9,0,0,0,0),(6,10,48,7,11,0,0,0,0),(6,10,49,7,11,0,0,0,0),(6,10,50,6,10,0,0,0,0),(6,10,51,4,9,0,0,0,0),(6,10,52,4,9,0,0,0,0),(6,10,53,8,13,0,0,0,0),(6,10,54,5,10,0,0,0,0),(6,11,37,8,11,0,0,0,0),(6,11,38,8,12,0,0,0,0),(6,11,39,5,9,0,0,0,0),(6,11,40,6,10,0,0,0,0),(6,11,41,4,8,0,0,0,0),(6,11,42,9,12,0,0,0,0),(6,11,43,8,12,0,0,0,0),(6,11,44,6,10,0,0,0,0),(6,11,45,2,5,0,0,0,1),(6,11,46,6,9,0,0,0,0),(6,11,47,7,11,0,0,0,0),(6,11,48,8,12,0,0,0,0),(6,11,49,6,10,0,0,0,0),(6,11,50,4,8,0,0,0,0),(6,11,51,6,11,0,0,0,0),(6,11,52,8,13,0,0,0,0),(6,11,53,1,6,0,0,1,0),(6,11,54,6,11,0,0,0,0),(6,12,37,6,9,0,0,0,0),(6,12,38,1,5,0,0,1,0),(6,12,39,-1,3,1,0,0,0),(6,12,40,8,12,0,0,0,0),(6,12,41,9,13,0,0,0,0),(6,12,42,6,9,0,0,0,0),(6,12,43,0,4,0,0,0,0),(6,12,44,6,10,0,0,0,0),(6,12,45,8,11,0,0,0,0),(6,12,46,1,4,0,0,1,0),(6,12,47,6,10,0,0,0,0),(6,12,48,8,12,0,0,0,0),(6,12,49,7,11,0,0,0,0),(6,12,50,5,9,0,0,0,0),(6,12,51,5,10,0,0,0,0),(6,12,52,1,6,0,0,1,0),(6,12,53,5,10,0,0,0,0),(6,12,54,6,11,0,0,0,0),(6,13,55,8,11,0,0,0,0),(6,13,56,6,9,0,0,0,0),(6,13,57,6,9,0,0,0,0),(6,13,58,5,8,0,0,0,0),(6,13,59,6,9,0,0,0,0),(6,13,60,3,6,0,0,0,0),(6,13,61,3,7,0,0,0,0),(6,13,62,3,7,0,0,0,0),(6,13,63,5,9,0,0,0,0),(6,13,64,1,5,0,0,1,0),(6,13,65,4,8,0,0,0,0),(6,13,66,7,11,0,0,0,0),(6,13,67,4,9,0,0,0,0),(6,13,68,6,11,0,0,0,0),(6,13,69,5,10,0,0,0,0),(6,13,70,6,11,0,0,0,0),(6,13,71,7,12,0,0,0,0),(6,13,72,4,9,0,0,0,0),(6,14,55,7,10,0,0,0,0),(6,14,56,4,7,0,0,0,0),(6,14,57,6,9,0,0,0,0),(6,14,58,8,11,0,0,0,0),(6,14,59,9,12,0,0,0,0),(6,14,60,6,9,0,0,0,0),(6,14,61,7,11,0,0,0,0),(6,14,62,7,11,0,0,0,0),(6,14,63,8,12,0,0,0,0),(6,14,64,6,10,0,0,0,0),(6,14,65,9,13,0,0,0,0),(6,14,66,4,8,0,0,0,0),(6,14,67,6,11,0,0,0,0),(6,14,68,5,10,0,0,0,0),(6,14,69,7,12,0,0,0,0),(6,14,70,1,6,0,0,1,0),(6,14,71,2,7,0,0,0,1),(6,14,72,2,7,0,0,0,1),(6,15,55,4,7,0,0,0,0),(6,15,56,8,11,0,0,0,0),(6,15,57,4,7,0,0,0,0),(6,15,58,7,10,0,0,0,0),(6,15,59,7,10,0,0,0,0),(6,15,60,8,11,0,0,0,0),(6,15,61,8,12,0,0,0,0),(6,15,62,8,12,0,0,0,0),(6,15,63,3,7,0,0,0,0),(6,15,64,7,11,0,0,0,0),(6,15,65,4,8,0,0,0,0),(6,15,66,10,14,0,0,0,0),(6,15,67,3,8,0,0,0,0),(6,15,68,3,8,0,0,0,0),(6,15,69,4,9,0,0,0,0),(6,15,70,3,8,0,0,0,0),(6,15,71,3,8,0,0,0,0),(6,15,72,1,6,0,0,1,0),(6,16,55,8,11,0,0,0,0),(6,16,56,7,10,0,0,0,0),(6,16,57,4,7,0,0,0,0),(6,16,58,5,8,0,0,0,0),(6,16,59,6,9,0,0,0,0),(6,16,60,2,5,0,0,0,1),(6,16,61,3,7,0,0,0,0),(6,16,62,4,8,0,0,0,0),(6,16,63,4,8,0,0,0,0),(6,16,64,7,11,0,0,0,0),(6,16,65,7,11,0,0,0,0),(6,16,66,9,13,0,0,0,0),(6,16,67,5,10,0,0,0,0),(6,16,68,6,11,0,0,0,0),(6,16,69,4,9,0,0,0,0),(6,16,70,7,12,0,0,0,0),(6,16,71,1,6,0,0,1,0),(6,16,72,4,9,0,0,0,0),(6,17,73,8,11,0,0,0,0),(6,17,74,7,10,0,0,0,0),(6,17,75,6,9,0,0,0,0),(6,17,76,10,13,0,0,0,0),(6,17,77,7,10,0,0,0,0),(6,17,78,6,9,0,0,0,0),(6,17,79,4,8,0,0,0,0),(6,17,80,7,11,0,0,0,0),(6,17,81,7,11,0,0,0,0),(6,17,82,6,10,0,0,0,0),(6,17,83,6,10,0,0,0,0),(6,17,84,6,10,0,0,0,0),(6,17,85,1,6,0,0,1,0),(6,17,86,5,10,0,0,0,0),(6,17,87,8,13,0,0,0,0),(6,17,88,7,12,0,0,0,0),(6,17,89,1,6,0,0,1,0),(6,17,90,8,10,0,0,0,0),(6,18,73,4,7,0,0,0,0),(6,18,74,1,4,0,0,1,0),(6,18,75,8,11,0,0,0,0),(6,18,76,8,11,0,0,0,0),(6,18,77,10,13,0,0,0,0),(6,18,78,0,3,0,0,0,0),(6,18,79,10,14,0,0,0,0),(6,18,80,5,9,0,0,0,0),(6,18,81,5,9,0,0,0,0),(6,18,82,-1,3,1,0,0,0),(6,18,83,3,7,0,0,0,0),(6,18,84,5,9,0,0,0,0),(6,18,85,7,12,0,0,0,0),(6,18,86,7,12,0,0,0,0),(6,18,87,4,9,0,0,0,0),(6,18,88,4,9,0,0,0,0),(6,18,89,4,9,0,0,0,0),(6,18,90,-1,1,1,0,0,0),(6,19,73,3,6,0,0,0,0),(6,19,74,4,7,0,0,0,0),(6,19,75,7,10,0,0,0,0),(6,19,76,5,8,0,0,0,0),(6,19,77,10,13,0,0,0,0),(6,19,78,9,12,0,0,0,0),(6,19,79,-1,3,1,0,0,0),(6,19,80,10,14,0,0,0,0),(6,19,81,7,11,0,0,0,0),(6,19,82,2,6,0,0,0,1),(6,19,83,10,14,0,0,0,0),(6,19,84,2,6,0,0,0,1),(6,19,85,6,11,0,0,0,0),(6,19,86,2,7,0,0,0,1),(6,19,87,7,12,0,0,0,0),(6,19,88,3,8,0,0,0,0),(6,19,89,4,9,0,0,0,0),(6,19,90,10,12,0,0,0,0),(6,20,73,6,9,0,0,0,0),(6,20,74,9,12,0,0,0,0),(6,20,75,6,9,0,0,0,0),(6,20,76,1,4,0,0,1,0),(6,20,77,4,7,0,0,0,0),(6,20,78,8,11,0,0,0,0),(6,20,79,6,10,0,0,0,0),(6,20,80,7,11,0,0,0,0),(6,20,81,8,12,0,0,0,0),(6,20,82,6,10,0,0,0,0),(6,20,83,7,11,0,0,0,0),(6,20,84,8,12,0,0,0,0),(6,20,85,7,12,0,0,0,0),(6,20,86,8,13,0,0,0,0),(6,20,87,7,12,0,0,0,0),(6,20,88,7,12,0,0,0,0),(6,20,89,4,9,0,0,0,0),(6,20,90,8,10,0,0,0,0),(7,1,1,1,6,0,0,1,0),(7,1,2,9,12,0,0,0,0),(7,1,3,6,10,0,0,0,0),(7,1,4,7,10,0,0,0,0),(7,1,5,7,11,0,0,0,0),(7,1,6,8,12,0,0,0,0),(7,1,7,6,10,0,0,0,0),(7,1,8,4,7,0,0,0,0),(7,1,9,2,6,0,0,0,1),(7,1,10,4,8,0,0,0,0),(7,1,11,8,12,0,0,0,0),(7,1,12,3,7,0,0,0,0),(7,1,13,3,7,0,0,0,0),(7,1,14,2,7,0,0,0,1),(7,1,15,2,7,0,0,0,1),(7,1,16,2,7,0,0,0,1),(7,1,17,4,9,0,0,0,0),(7,1,18,7,12,0,0,0,0),(7,2,1,6,11,0,0,0,0),(7,2,2,7,10,0,0,0,0),(7,2,3,7,11,0,0,0,0),(7,2,4,8,11,0,0,0,0),(7,2,5,6,10,0,0,0,0),(7,2,6,1,5,0,0,1,0),(7,2,7,5,9,0,0,0,0),(7,2,8,7,10,0,0,0,0),(7,2,9,4,8,0,0,0,0),(7,2,10,6,10,0,0,0,0),(7,2,11,7,11,0,0,0,0),(7,2,12,3,7,0,0,0,0),(7,2,13,6,10,0,0,0,0),(7,2,14,7,12,0,0,0,0),(7,2,15,6,11,0,0,0,0),(7,2,16,6,11,0,0,0,0),(7,2,17,3,8,0,0,0,0),(7,2,18,5,10,0,0,0,0),(7,3,1,4,9,0,0,0,0),(7,3,2,8,11,0,0,0,0),(7,3,3,8,12,0,0,0,0),(7,3,4,8,11,0,0,0,0),(7,3,5,-1,3,1,0,0,0),(7,3,6,5,9,0,0,0,0),(7,3,7,7,11,0,0,0,0),(7,3,8,7,10,0,0,0,0),(7,3,9,7,11,0,0,0,0),(7,3,10,5,9,0,0,0,0),(7,3,11,5,9,0,0,0,0),(7,3,12,7,11,0,0,0,0),(7,3,13,7,11,0,0,0,0),(7,3,14,6,11,0,0,0,0),(7,3,15,1,6,0,0,1,0),(7,3,16,5,10,0,0,0,0),(7,3,17,3,8,0,0,0,0),(7,3,18,7,12,0,0,0,0),(7,4,1,4,9,0,0,0,0),(7,4,2,8,11,0,0,0,0),(7,4,3,7,11,0,0,0,0),(7,4,4,4,7,0,0,0,0),(7,4,5,6,10,0,0,0,0),(7,4,6,5,9,0,0,0,0),(7,4,7,9,13,0,0,0,0),(7,4,8,7,10,0,0,0,0),(7,4,9,7,11,0,0,0,0),(7,4,10,2,6,0,0,0,1),(7,4,11,5,9,0,0,0,0),(7,4,12,6,10,0,0,0,0),(7,4,13,0,4,0,0,0,0),(7,4,14,7,12,0,0,0,0),(7,4,15,4,9,0,0,0,0),(7,4,16,1,6,0,0,1,0),(7,4,17,6,11,0,0,0,0),(7,4,18,8,13,0,0,0,0),(7,5,19,8,11,0,0,0,0),(7,5,20,9,13,0,0,0,0),(7,5,21,1,5,0,0,1,0),(7,5,22,7,11,0,0,0,0),(7,5,23,7,11,0,0,0,0),(7,5,24,4,8,0,0,0,0),(7,5,25,8,12,0,0,0,0),(7,5,26,8,12,0,0,0,0),(7,5,27,2,6,0,0,0,1),(7,5,28,8,11,0,0,0,0),(7,5,29,8,12,0,0,0,0),(7,5,30,9,12,0,0,0,0),(7,5,31,5,8,0,0,0,0),(7,5,32,2,6,0,0,0,1),(7,5,33,4,9,0,0,0,0),(7,5,34,4,9,0,0,0,0),(7,5,35,7,12,0,0,0,0),(7,5,36,0,5,0,0,0,0),(7,6,19,5,8,0,0,0,0),(7,6,20,-1,3,1,0,0,0),(7,6,21,2,6,0,0,0,1),(7,6,22,7,11,0,0,0,0),(7,6,23,6,10,0,0,0,0),(7,6,24,9,13,0,0,0,0),(7,6,25,5,9,0,0,0,0),(7,6,26,1,5,0,0,1,0),(7,6,27,5,9,0,0,0,0),(7,6,28,8,11,0,0,0,0),(7,6,29,2,6,0,0,0,1),(7,6,30,9,12,0,0,0,0),(7,6,31,8,11,0,0,0,0),(7,6,32,7,11,0,0,0,0),(7,6,33,8,13,0,0,0,0),(7,6,34,6,11,0,0,0,0),(7,6,35,7,12,0,0,0,0),(7,6,36,4,9,0,0,0,0),(7,7,19,8,11,0,0,0,0),(7,7,20,7,11,0,0,0,0),(7,7,21,5,9,0,0,0,0),(7,7,22,8,12,0,0,0,0),(7,7,23,3,7,0,0,0,0),(7,7,24,7,11,0,0,0,0),(7,7,25,0,4,0,0,0,0),(7,7,26,6,10,0,0,0,0),(7,7,27,7,11,0,0,0,0),(7,7,28,8,11,0,0,0,0),(7,7,29,7,11,0,0,0,0),(7,7,30,7,10,0,0,0,0),(7,7,31,4,7,0,0,0,0),(7,7,32,8,12,0,0,0,0),(7,7,33,4,9,0,0,0,0),(7,7,34,3,8,0,0,0,0),(7,7,35,6,11,0,0,0,0),(7,7,36,5,10,0,0,0,0),(7,8,19,5,8,0,0,0,0),(7,8,20,-1,3,1,0,0,0),(7,8,21,6,10,0,0,0,0),(7,8,22,8,12,0,0,0,0),(7,8,23,8,12,0,0,0,0),(7,8,24,7,11,0,0,0,0),(7,8,25,2,6,0,0,0,1),(7,8,26,7,11,0,0,0,0),(7,8,27,10,14,0,0,0,0),(7,8,28,9,12,0,0,0,0),(7,8,29,4,8,0,0,0,0),(7,8,30,6,9,0,0,0,0),(7,8,31,7,10,0,0,0,0),(7,8,32,7,11,0,0,0,0),(7,8,33,1,6,0,0,1,0),(7,8,34,7,12,0,0,0,0),(7,8,35,4,9,0,0,0,0),(7,8,36,4,9,0,0,0,0),(7,9,37,9,12,0,0,0,0),(7,9,38,4,8,0,0,0,0),(7,9,39,5,9,0,0,0,0),(7,9,40,3,7,0,0,0,0),(7,9,41,-1,3,1,0,0,0),(7,9,42,4,7,0,0,0,0),(7,9,43,2,6,0,0,0,1),(7,9,44,7,11,0,0,0,0),(7,9,45,6,9,0,0,0,0),(7,9,46,6,9,0,0,0,0),(7,9,47,-1,3,1,0,0,0),(7,9,48,0,4,0,0,0,0),(7,9,49,0,4,0,0,0,0),(7,9,50,2,6,0,0,0,1),(7,9,51,6,11,0,0,0,0),(7,9,52,3,8,0,0,0,0),(7,9,53,3,8,0,0,0,0),(7,9,54,1,6,0,0,1,0),(7,10,37,5,8,0,0,0,0),(7,10,38,2,6,0,0,0,1),(7,10,39,8,12,0,0,0,0),(7,10,40,-1,3,1,0,0,0),(7,10,41,2,6,0,0,0,1),(7,10,42,7,10,0,0,0,0),(7,10,43,8,12,0,0,0,0),(7,10,44,6,10,0,0,0,0),(7,10,45,5,8,0,0,0,0),(7,10,46,8,11,0,0,0,0),(7,10,47,6,10,0,0,0,0),(7,10,48,4,8,0,0,0,0),(7,10,49,2,6,0,0,0,1),(7,10,50,8,12,0,0,0,0),(7,10,51,5,10,0,0,0,0),(7,10,52,7,12,0,0,0,0),(7,10,53,4,9,0,0,0,0),(7,10,54,6,11,0,0,0,0),(7,11,37,4,7,0,0,0,0),(7,11,38,8,12,0,0,0,0),(7,11,39,4,8,0,0,0,0),(7,11,40,7,11,0,0,0,0),(7,11,41,7,11,0,0,0,0),(7,11,42,7,10,0,0,0,0),(7,11,43,6,10,0,0,0,0),(7,11,44,7,11,0,0,0,0),(7,11,45,5,8,0,0,0,0),(7,11,46,8,11,0,0,0,0),(7,11,47,-1,3,1,0,0,0),(7,11,48,7,11,0,0,0,0),(7,11,49,4,8,0,0,0,0),(7,11,50,4,8,0,0,0,0),(7,11,51,5,10,0,0,0,0),(7,11,52,8,13,0,0,0,0),(7,11,53,-2,3,0,1,0,0),(7,11,54,3,8,0,0,0,0),(7,12,37,1,4,0,0,1,0),(7,12,38,8,12,0,0,0,0),(7,12,39,1,5,0,0,1,0),(7,12,40,9,13,0,0,0,0),(7,12,41,2,6,0,0,0,1),(7,12,42,8,11,0,0,0,0),(7,12,43,7,11,0,0,0,0),(7,12,44,4,8,0,0,0,0),(7,12,45,10,13,0,0,0,0),(7,12,46,9,12,0,0,0,0),(7,12,47,7,11,0,0,0,0),(7,12,48,5,9,0,0,0,0),(7,12,49,6,10,0,0,0,0),(7,12,50,3,7,0,0,0,0),(7,12,51,2,7,0,0,0,1),(7,12,52,7,12,0,0,0,0),(7,12,53,5,10,0,0,0,0),(7,12,54,7,12,0,0,0,0),(7,13,55,9,12,0,0,0,0),(7,13,56,9,12,0,0,0,0),(7,13,57,3,6,0,0,0,0),(7,13,58,8,11,0,0,0,0),(7,13,59,7,10,0,0,0,0),(7,13,60,9,12,0,0,0,0),(7,13,61,8,12,0,0,0,0),(7,13,62,7,11,0,0,0,0),(7,13,63,9,13,0,0,0,0),(7,13,64,3,7,0,0,0,0),(7,13,65,4,8,0,0,0,0),(7,13,66,3,7,0,0,0,0),(7,13,67,3,8,0,0,0,0),(7,13,68,7,12,0,0,0,0),(7,13,69,2,7,0,0,0,1),(7,13,70,4,9,0,0,0,0),(7,13,71,7,12,0,0,0,0),(7,13,72,7,12,0,0,0,0),(7,14,55,5,8,0,0,0,0),(7,14,56,11,14,0,0,0,0),(7,14,57,0,3,0,0,0,0),(7,14,58,5,8,0,0,0,0),(7,14,59,8,11,0,0,0,0),(7,14,60,5,8,0,0,0,0),(7,14,61,6,10,0,0,0,0),(7,14,62,-3,1,0,0,0,0),(7,14,63,7,11,0,0,0,0),(7,14,64,6,10,0,0,0,0),(7,14,65,4,8,0,0,0,0),(7,14,66,8,12,0,0,0,0),(7,14,67,3,8,0,0,0,0),(7,14,68,5,10,0,0,0,0),(7,14,69,8,13,0,0,0,0),(7,14,70,-1,4,1,0,0,0),(7,14,71,1,6,0,0,1,0),(7,14,72,-1,4,1,0,0,0),(7,15,55,3,6,0,0,0,0),(7,15,56,9,12,0,0,0,0),(7,15,57,7,10,0,0,0,0),(7,15,58,8,11,0,0,0,0),(7,15,59,9,12,0,0,0,0),(7,15,60,6,9,0,0,0,0),(7,15,61,5,9,0,0,0,0),(7,15,62,7,11,0,0,0,0),(7,15,63,5,9,0,0,0,0),(7,15,64,3,7,0,0,0,0),(7,15,65,5,9,0,0,0,0),(7,15,66,6,10,0,0,0,0),(7,15,67,-1,4,1,0,0,0),(7,15,68,-1,4,1,0,0,0),(7,15,69,6,11,0,0,0,0),(7,15,70,8,13,0,0,0,0),(7,15,71,7,12,0,0,0,0),(7,15,72,6,11,0,0,0,0),(7,16,55,11,14,0,0,0,0),(7,16,56,7,10,0,0,0,0),(7,16,57,9,12,0,0,0,0),(7,16,58,7,10,0,0,0,0),(7,16,59,-2,1,0,1,0,0),(7,16,60,0,3,0,0,0,0),(7,16,61,-3,1,0,0,0,0),(7,16,62,9,13,0,0,0,0),(7,16,63,1,5,0,0,1,0),(7,16,64,7,11,0,0,0,0),(7,16,65,5,9,0,0,0,0),(7,16,66,6,10,0,0,0,0),(7,16,67,5,10,0,0,0,0),(7,16,68,1,6,0,0,1,0),(7,16,69,7,12,0,0,0,0),(7,16,70,6,11,0,0,0,0),(7,16,71,5,10,0,0,0,0),(7,16,72,5,10,0,0,0,0),(7,17,73,12,15,0,0,0,0),(7,17,74,8,11,0,0,0,0),(7,17,75,0,3,0,0,0,0),(7,17,76,8,11,0,0,0,0),(7,17,77,8,11,0,0,0,0),(7,17,78,7,10,0,0,0,0),(7,17,79,0,4,0,0,0,0),(7,17,80,0,4,0,0,0,0),(7,17,81,7,11,0,0,0,0),(7,17,82,7,11,0,0,0,0),(7,17,83,4,8,0,0,0,0),(7,17,84,9,13,0,0,0,0),(7,17,85,5,10,0,0,0,0),(7,17,86,4,9,0,0,0,0),(7,17,87,5,10,0,0,0,0),(7,17,88,6,11,0,0,0,0),(7,17,89,6,11,0,0,0,0),(7,17,90,9,11,0,0,0,0),(7,18,73,5,8,0,0,0,0),(7,18,74,8,11,0,0,0,0),(7,18,75,9,12,0,0,0,0),(7,18,76,7,10,0,0,0,0),(7,18,77,9,12,0,0,0,0),(7,18,78,6,9,0,0,0,0),(7,18,79,6,10,0,0,0,0),(7,18,80,6,10,0,0,0,0),(7,18,81,7,11,0,0,0,0),(7,18,82,7,11,0,0,0,0),(7,18,83,7,11,0,0,0,0),(7,18,84,4,8,0,0,0,0),(7,18,85,2,7,0,0,0,1),(7,18,86,0,5,0,0,0,0),(7,18,87,5,10,0,0,0,0),(7,18,88,7,12,0,0,0,0),(7,18,89,6,11,0,0,0,0),(7,18,90,7,9,0,0,0,0),(7,19,73,10,13,0,0,0,0),(7,19,74,9,12,0,0,0,0),(7,19,75,2,5,0,0,0,1),(7,19,76,8,11,0,0,0,0),(7,19,77,9,12,0,0,0,0),(7,19,78,10,13,0,0,0,0),(7,19,79,6,10,0,0,0,0),(7,19,80,7,11,0,0,0,0),(7,19,81,6,10,0,0,0,0),(7,19,82,2,6,0,0,0,1),(7,19,83,6,10,0,0,0,0),(7,19,84,2,6,0,0,0,1),(7,19,85,3,8,0,0,0,0),(7,19,86,2,7,0,0,0,1),(7,19,87,5,10,0,0,0,0),(7,19,88,4,9,0,0,0,0),(7,19,89,5,10,0,0,0,0),(7,19,90,8,10,0,0,0,0),(7,20,73,9,12,0,0,0,0),(7,20,74,1,4,0,0,1,0),(7,20,75,10,13,0,0,0,0),(7,20,76,8,11,0,0,0,0),(7,20,77,8,11,0,0,0,0),(7,20,78,4,7,0,0,0,0),(7,20,79,9,13,0,0,0,0),(7,20,80,-1,3,1,0,0,0),(7,20,81,7,11,0,0,0,0),(7,20,82,5,9,0,0,0,0),(7,20,83,5,9,0,0,0,0),(7,20,84,9,13,0,0,0,0),(7,20,85,7,12,0,0,0,0),(7,20,86,5,10,0,0,0,0),(7,20,87,7,12,0,0,0,0),(7,20,88,6,11,0,0,0,0),(7,20,89,4,9,0,0,0,0),(7,20,90,11,13,0,0,0,0),(8,1,1,6,11,0,0,0,0),(8,1,2,9,12,0,0,0,0),(8,1,3,3,7,0,0,0,0),(8,1,4,8,11,0,0,0,0),(8,1,5,8,12,0,0,0,0),(8,1,6,5,9,0,0,0,0),(8,1,7,2,6,0,0,0,1),(8,1,8,9,12,0,0,0,0),(8,1,9,5,9,0,0,0,0),(8,1,10,7,11,0,0,0,0),(8,1,11,2,6,0,0,0,1),(8,1,12,7,11,0,0,0,0),(8,1,13,5,9,0,0,0,0),(8,1,14,6,11,0,0,0,0),(8,1,15,6,11,0,0,0,0),(8,1,16,7,12,0,0,0,0),(8,1,17,4,9,0,0,0,0),(8,1,18,3,8,0,0,0,0),(8,2,1,6,11,0,0,0,0),(8,2,2,6,9,0,0,0,0),(8,2,3,4,8,0,0,0,0),(8,2,4,8,11,0,0,0,0),(8,2,5,4,8,0,0,0,0),(8,2,6,5,9,0,0,0,0),(8,2,7,2,6,0,0,0,1),(8,2,8,8,11,0,0,0,0),(8,2,9,7,11,0,0,0,0),(8,2,10,6,10,0,0,0,0),(8,2,11,7,11,0,0,0,0),(8,2,12,6,10,0,0,0,0),(8,2,13,7,11,0,0,0,0),(8,2,14,6,11,0,0,0,0),(8,2,15,5,10,0,0,0,0),(8,2,16,2,7,0,0,0,1),(8,2,17,8,13,0,0,0,0),(8,2,18,5,10,0,0,0,0),(8,3,1,1,6,0,0,1,0),(8,3,2,2,5,0,0,0,1),(8,3,3,8,12,0,0,0,0),(8,3,4,3,6,0,0,0,0),(8,3,5,8,12,0,0,0,0),(8,3,6,5,9,0,0,0,0),(8,3,7,4,8,0,0,0,0),(8,3,8,6,9,0,0,0,0),(8,3,9,7,11,0,0,0,0),(8,3,10,2,6,0,0,0,1),(8,3,11,6,10,0,0,0,0),(8,3,12,7,11,0,0,0,0),(8,3,13,6,10,0,0,0,0),(8,3,14,5,10,0,0,0,0),(8,3,15,7,12,0,0,0,0),(8,3,16,6,11,0,0,0,0),(8,3,17,0,5,0,0,0,0),(8,3,18,7,12,0,0,0,0),(8,4,1,7,12,0,0,0,0),(8,4,2,7,10,0,0,0,0),(8,4,3,7,11,0,0,0,0),(8,4,4,9,12,0,0,0,0),(8,4,5,6,10,0,0,0,0),(8,4,6,5,9,0,0,0,0),(8,4,7,6,10,0,0,0,0),(8,4,8,10,13,0,0,0,0),(8,4,9,4,8,0,0,0,0),(8,4,10,8,12,0,0,0,0),(8,4,11,2,6,0,0,0,1),(8,4,12,3,7,0,0,0,0),(8,4,13,6,10,0,0,0,0),(8,4,14,6,11,0,0,0,0),(8,4,15,3,8,0,0,0,0),(8,4,16,-1,4,1,0,0,0),(8,4,17,6,11,0,0,0,0),(8,4,18,6,11,0,0,0,0),(8,5,19,8,11,0,0,0,0),(8,5,20,8,12,0,0,0,0),(8,5,21,8,12,0,0,0,0),(8,5,22,3,7,0,0,0,0),(8,5,23,3,7,0,0,0,0),(8,5,24,6,10,0,0,0,0),(8,5,25,7,11,0,0,0,0),(8,5,26,8,12,0,0,0,0),(8,5,27,6,10,0,0,0,0),(8,5,28,6,9,0,0,0,0),(8,5,29,3,7,0,0,0,0),(8,5,30,10,13,0,0,0,0),(8,5,31,10,13,0,0,0,0),(8,5,32,5,9,0,0,0,0),(8,5,33,6,11,0,0,0,0),(8,5,34,3,8,0,0,0,0),(8,5,35,5,10,0,0,0,0),(8,5,36,6,11,0,0,0,0),(8,6,19,6,9,0,0,0,0),(8,6,20,3,7,0,0,0,0),(8,6,21,5,9,0,0,0,0),(8,6,22,5,9,0,0,0,0),(8,6,23,7,11,0,0,0,0),(8,6,24,6,10,0,0,0,0),(8,6,25,5,9,0,0,0,0),(8,6,26,6,10,0,0,0,0),(8,6,27,2,6,0,0,0,1),(8,6,28,10,13,0,0,0,0),(8,6,29,6,10,0,0,0,0),(8,6,30,6,9,0,0,0,0),(8,6,31,10,13,0,0,0,0),(8,6,32,7,11,0,0,0,0),(8,6,33,6,11,0,0,0,0),(8,6,34,5,10,0,0,0,0),(8,6,35,5,10,0,0,0,0),(8,6,36,4,9,0,0,0,0),(8,7,19,3,6,0,0,0,0),(8,7,20,5,9,0,0,0,0),(8,7,21,9,13,0,0,0,0),(8,7,22,7,11,0,0,0,0),(8,7,23,7,11,0,0,0,0),(8,7,24,8,12,0,0,0,0),(8,7,25,8,12,0,0,0,0),(8,7,26,0,4,0,0,0,0),(8,7,27,8,12,0,0,0,0),(8,7,28,7,10,0,0,0,0),(8,7,29,7,11,0,0,0,0),(8,7,30,8,11,0,0,0,0),(8,7,31,7,10,0,0,0,0),(8,7,32,4,8,0,0,0,0),(8,7,33,4,9,0,0,0,0),(8,7,34,0,5,0,0,0,0),(8,7,35,5,10,0,0,0,0),(8,7,36,6,11,0,0,0,0),(8,8,19,6,9,0,0,0,0),(8,8,20,6,10,0,0,0,0),(8,8,21,3,7,0,0,0,0),(8,8,22,8,12,0,0,0,0),(8,8,23,5,9,0,0,0,0),(8,8,24,6,10,0,0,0,0),(8,8,25,1,5,0,0,1,0),(8,8,26,4,8,0,0,0,0),(8,8,27,9,13,0,0,0,0),(8,8,28,5,8,0,0,0,0),(8,8,29,3,7,0,0,0,0),(8,8,30,4,7,0,0,0,0),(8,8,31,9,12,0,0,0,0),(8,8,32,7,11,0,0,0,0),(8,8,33,3,8,0,0,0,0),(8,8,34,7,12,0,0,0,0),(8,8,35,6,11,0,0,0,0),(8,8,36,2,7,0,0,0,1),(8,9,37,9,12,0,0,0,0),(8,9,38,6,10,0,0,0,0),(8,9,39,0,4,0,0,0,0),(8,9,40,5,9,0,0,0,0),(8,9,41,4,8,0,0,0,0),(8,9,42,6,9,0,0,0,0),(8,9,43,7,11,0,0,0,0),(8,9,44,6,10,0,0,0,0),(8,9,45,4,7,0,0,0,0),(8,9,46,7,10,0,0,0,0),(8,9,47,0,4,0,0,0,0),(8,9,48,6,10,0,0,0,0),(8,9,49,2,6,0,0,0,1),(8,9,50,6,10,0,0,0,0),(8,9,51,4,9,0,0,0,0),(8,9,52,2,7,0,0,0,1),(8,9,53,1,6,0,0,1,0),(8,9,54,3,8,0,0,0,0),(8,10,37,9,12,0,0,0,0),(8,10,38,9,13,0,0,0,0),(8,10,39,6,10,0,0,0,0),(8,10,40,7,11,0,0,0,0),(8,10,41,3,7,0,0,0,0),(8,10,42,4,7,0,0,0,0),(8,10,43,4,8,0,0,0,0),(8,10,44,5,9,0,0,0,0),(8,10,45,8,11,0,0,0,0),(8,10,46,1,4,0,0,1,0),(8,10,47,6,10,0,0,0,0),(8,10,48,7,11,0,0,0,0),(8,10,49,5,9,0,0,0,0),(8,10,50,8,12,0,0,0,0),(8,10,51,4,9,0,0,0,0),(8,10,52,-4,1,0,0,0,0),(8,10,53,3,8,0,0,0,0),(8,10,54,3,8,0,0,0,0),(8,11,37,10,13,0,0,0,0),(8,11,38,8,12,0,0,0,0),(8,11,39,7,11,0,0,0,0),(8,11,40,3,7,0,0,0,0),(8,11,41,5,9,0,0,0,0),(8,11,42,7,10,0,0,0,0),(8,11,43,6,10,0,0,0,0),(8,11,44,6,10,0,0,0,0),(8,11,45,9,12,0,0,0,0),(8,11,46,4,7,0,0,0,0),(8,11,47,4,8,0,0,0,0),(8,11,48,6,10,0,0,0,0),(8,11,49,7,11,0,0,0,0),(8,11,50,6,10,0,0,0,0),(8,11,51,2,7,0,0,0,1),(8,11,52,2,7,0,0,0,1),(8,11,53,8,13,0,0,0,0),(8,11,54,4,9,0,0,0,0),(8,12,37,10,13,0,0,0,0),(8,12,38,8,12,0,0,0,0),(8,12,39,0,4,0,0,0,0),(8,12,40,6,10,0,0,0,0),(8,12,41,7,11,0,0,0,0),(8,12,42,4,7,0,0,0,0),(8,12,43,3,7,0,0,0,0),(8,12,44,5,9,0,0,0,0),(8,12,45,9,12,0,0,0,0),(8,12,46,7,10,0,0,0,0),(8,12,47,9,13,0,0,0,0),(8,12,48,3,7,0,0,0,0),(8,12,49,7,11,0,0,0,0),(8,12,50,2,6,0,0,0,1),(8,12,51,-2,3,0,1,0,0),(8,12,52,3,8,0,0,0,0),(8,12,53,4,9,0,0,0,0),(8,12,54,-2,3,0,1,0,0),(8,13,55,7,10,0,0,0,0),(8,13,56,8,11,0,0,0,0),(8,13,57,10,13,0,0,0,0),(8,13,58,4,7,0,0,0,0),(8,13,59,9,12,0,0,0,0),(8,13,60,7,10,0,0,0,0),(8,13,61,7,11,0,0,0,0),(8,13,62,3,7,0,0,0,0),(8,13,63,6,10,0,0,0,0),(8,13,64,0,4,0,0,0,0),(8,13,65,7,11,0,0,0,0),(8,13,66,5,9,0,0,0,0),(8,13,67,7,12,0,0,0,0),(8,13,68,6,11,0,0,0,0),(8,13,69,3,8,0,0,0,0),(8,13,70,8,13,0,0,0,0),(8,13,71,5,10,0,0,0,0),(8,13,72,6,11,0,0,0,0),(8,14,55,9,12,0,0,0,0),(8,14,56,9,12,0,0,0,0),(8,14,57,4,7,0,0,0,0),(8,14,58,2,5,0,0,0,1),(8,14,59,8,11,0,0,0,0),(8,14,60,0,3,0,0,0,0),(8,14,61,-3,1,0,0,0,0),(8,14,62,7,11,0,0,0,0),(8,14,63,7,11,0,0,0,0),(8,14,64,2,6,0,0,0,1),(8,14,65,7,11,0,0,0,0),(8,14,66,-1,3,1,0,0,0),(8,14,67,-1,4,1,0,0,0),(8,14,68,8,13,0,0,0,0),(8,14,69,2,7,0,0,0,1),(8,14,70,4,9,0,0,0,0),(8,14,71,1,6,0,0,1,0),(8,14,72,8,13,0,0,0,0),(8,15,55,9,12,0,0,0,0),(8,15,56,4,7,0,0,0,0),(8,15,57,7,10,0,0,0,0),(8,15,58,2,5,0,0,0,1),(8,15,59,5,8,0,0,0,0),(8,15,60,4,7,0,0,0,0),(8,15,61,7,11,0,0,0,0),(8,15,62,7,11,0,0,0,0),(8,15,63,7,11,0,0,0,0),(8,15,64,3,7,0,0,0,0),(8,15,65,7,11,0,0,0,0),(8,15,66,3,7,0,0,0,0),(8,15,67,3,8,0,0,0,0),(8,15,68,7,12,0,0,0,0),(8,15,69,-2,3,0,1,0,0),(8,15,70,7,12,0,0,0,0),(8,15,71,4,9,0,0,0,0),(8,15,72,-1,4,1,0,0,0),(8,16,55,9,12,0,0,0,0),(8,16,56,10,13,0,0,0,0),(8,16,57,8,11,0,0,0,0),(8,16,58,-2,1,0,1,0,0),(8,16,59,7,10,0,0,0,0),(8,16,60,7,10,0,0,0,0),(8,16,61,7,11,0,0,0,0),(8,16,62,5,9,0,0,0,0),(8,16,63,7,11,0,0,0,0),(8,16,64,7,11,0,0,0,0),(8,16,65,7,11,0,0,0,0),(8,16,66,8,12,0,0,0,0),(8,16,67,6,11,0,0,0,0),(8,16,68,5,10,0,0,0,0),(8,16,69,7,12,0,0,0,0),(8,16,70,6,11,0,0,0,0),(8,16,71,5,10,0,0,0,0),(8,16,72,4,9,0,0,0,0),(8,17,73,7,10,0,0,0,0),(8,17,74,8,11,0,0,0,0),(8,17,75,9,12,0,0,0,0),(8,17,76,9,12,0,0,0,0),(8,17,77,6,9,0,0,0,0),(8,17,78,4,7,0,0,0,0),(8,17,79,4,8,0,0,0,0),(8,17,80,5,9,0,0,0,0),(8,17,81,6,10,0,0,0,0),(8,17,82,5,9,0,0,0,0),(8,17,83,4,8,0,0,0,0),(8,17,84,7,11,0,0,0,0),(8,17,85,6,11,0,0,0,0),(8,17,86,7,12,0,0,0,0),(8,17,87,8,13,0,0,0,0),(8,17,88,8,13,0,0,0,0),(8,17,89,6,11,0,0,0,0),(8,17,90,10,12,0,0,0,0),(8,18,73,7,10,0,0,0,0),(8,18,74,9,12,0,0,0,0),(8,18,75,8,11,0,0,0,0),(8,18,76,5,8,0,0,0,0),(8,18,77,4,7,0,0,0,0),(8,18,78,8,11,0,0,0,0),(8,18,79,6,10,0,0,0,0),(8,18,80,9,13,0,0,0,0),(8,18,81,5,9,0,0,0,0),(8,18,82,7,11,0,0,0,0),(8,18,83,2,6,0,0,0,1),(8,18,84,6,10,0,0,0,0),(8,18,85,6,11,0,0,0,0),(8,18,86,9,14,0,0,0,0),(8,18,87,5,10,0,0,0,0),(8,18,88,4,9,0,0,0,0),(8,18,89,1,6,0,0,1,0),(8,18,90,10,12,0,0,0,0),(8,19,73,9,12,0,0,0,0),(8,19,74,7,10,0,0,0,0),(8,19,75,7,10,0,0,0,0),(8,19,76,8,11,0,0,0,0),(8,19,77,8,11,0,0,0,0),(8,19,78,6,9,0,0,0,0),(8,19,79,7,11,0,0,0,0),(8,19,80,7,11,0,0,0,0),(8,19,81,8,12,0,0,0,0),(8,19,82,7,11,0,0,0,0),(8,19,83,6,10,0,0,0,0),(8,19,84,5,9,0,0,0,0),(8,19,85,8,13,0,0,0,0),(8,19,86,7,12,0,0,0,0),(8,19,87,3,8,0,0,0,0),(8,19,88,7,12,0,0,0,0),(8,19,89,4,9,0,0,0,0),(8,19,90,8,10,0,0,0,0),(8,20,73,10,13,0,0,0,0),(8,20,74,6,9,0,0,0,0),(8,20,75,6,9,0,0,0,0),(8,20,76,6,9,0,0,0,0),(8,20,77,8,11,0,0,0,0),(8,20,78,11,14,0,0,0,0),(8,20,79,7,11,0,0,0,0),(8,20,80,3,7,0,0,0,0),(8,20,81,-1,3,1,0,0,0),(8,20,82,6,10,0,0,0,0),(8,20,83,6,10,0,0,0,0),(8,20,84,7,11,0,0,0,0),(8,20,85,4,9,0,0,0,0),(8,20,86,6,11,0,0,0,0),(8,20,87,6,11,0,0,0,0),(8,20,88,6,11,0,0,0,0),(8,20,89,6,11,0,0,0,0),(8,20,90,8,10,0,0,0,0),(9,1,1,2,7,0,0,0,1),(9,1,2,7,10,0,0,0,0),(9,1,3,5,9,0,0,0,0),(9,1,4,9,12,0,0,0,0),(9,1,5,5,9,0,0,0,0),(9,1,6,6,10,0,0,0,0),(9,1,7,7,11,0,0,0,0),(9,1,8,9,12,0,0,0,0),(9,1,9,2,6,0,0,0,1),(9,1,10,0,4,0,0,0,0),(9,1,11,7,11,0,0,0,0),(9,1,12,7,11,0,0,0,0),(9,1,13,4,8,0,0,0,0),(9,1,14,-1,4,1,0,0,0),(9,1,15,6,11,0,0,0,0),(9,1,16,6,11,0,0,0,0),(9,1,17,6,11,0,0,0,0),(9,1,18,7,12,0,0,0,0),(9,2,1,5,10,0,0,0,0),(9,2,2,3,6,0,0,0,0),(9,2,3,7,11,0,0,0,0),(9,2,4,9,12,0,0,0,0),(9,2,5,7,11,0,0,0,0),(9,2,6,9,13,0,0,0,0),(9,2,7,7,11,0,0,0,0),(9,2,8,8,11,0,0,0,0),(9,2,9,8,12,0,0,0,0),(9,2,10,4,8,0,0,0,0),(9,2,11,6,10,0,0,0,0),(9,2,12,4,8,0,0,0,0),(9,2,13,2,6,0,0,0,1),(9,2,14,6,11,0,0,0,0),(9,2,15,7,12,0,0,0,0),(9,2,16,5,10,0,0,0,0),(9,2,17,7,12,0,0,0,0),(9,2,18,3,8,0,0,0,0),(9,3,1,6,11,0,0,0,0),(9,3,2,6,9,0,0,0,0),(9,3,3,7,11,0,0,0,0),(9,3,4,5,8,0,0,0,0),(9,3,5,3,7,0,0,0,0),(9,3,6,4,8,0,0,0,0),(9,3,7,6,10,0,0,0,0),(9,3,8,8,11,0,0,0,0),(9,3,9,4,8,0,0,0,0),(9,3,10,7,11,0,0,0,0),(9,3,11,7,11,0,0,0,0),(9,3,12,4,8,0,0,0,0),(9,3,13,7,11,0,0,0,0),(9,3,14,6,11,0,0,0,0),(9,3,15,8,13,0,0,0,0),(9,3,16,1,6,0,0,1,0),(9,3,17,6,11,0,0,0,0),(9,3,18,9,14,0,0,0,0),(9,4,1,-1,4,1,0,0,0),(9,4,2,8,11,0,0,0,0),(9,4,3,2,6,0,0,0,1),(9,4,4,8,11,0,0,0,0),(9,4,5,2,6,0,0,0,1),(9,4,6,7,11,0,0,0,0),(9,4,7,7,11,0,0,0,0),(9,4,8,10,13,0,0,0,0),(9,4,9,7,11,0,0,0,0),(9,4,10,2,6,0,0,0,1),(9,4,11,5,9,0,0,0,0),(9,4,12,5,9,0,0,0,0),(9,4,13,4,8,0,0,0,0),(9,4,14,2,7,0,0,0,1),(9,4,15,4,9,0,0,0,0),(9,4,16,2,7,0,0,0,1),(9,4,17,6,11,0,0,0,0),(9,4,18,5,10,0,0,0,0),(9,5,19,7,10,0,0,0,0),(9,5,20,1,5,0,0,1,0),(9,5,21,8,12,0,0,0,0),(9,5,22,9,13,0,0,0,0),(9,5,23,7,11,0,0,0,0),(9,5,24,8,12,0,0,0,0),(9,5,25,7,11,0,0,0,0),(9,5,26,5,9,0,0,0,0),(9,5,27,5,9,0,0,0,0),(9,5,28,4,7,0,0,0,0),(9,5,29,7,11,0,0,0,0),(9,5,30,5,8,0,0,0,0),(9,5,31,5,8,0,0,0,0),(9,5,32,1,5,0,0,1,0),(9,5,33,2,7,0,0,0,1),(9,5,34,2,7,0,0,0,1),(9,5,35,5,10,0,0,0,0),(9,5,36,5,10,0,0,0,0),(9,6,19,5,8,0,0,0,0),(9,6,20,5,9,0,0,0,0),(9,6,21,5,9,0,0,0,0),(9,6,22,4,8,0,0,0,0),(9,6,23,6,10,0,0,0,0),(9,6,24,7,11,0,0,0,0),(9,6,25,4,8,0,0,0,0),(9,6,26,6,10,0,0,0,0),(9,6,27,5,9,0,0,0,0),(9,6,28,9,12,0,0,0,0),(9,6,29,6,10,0,0,0,0),(9,6,30,9,12,0,0,0,0),(9,6,31,8,11,0,0,0,0),(9,6,32,0,4,0,0,0,0),(9,6,33,6,11,0,0,0,0),(9,6,34,6,11,0,0,0,0),(9,6,35,6,11,0,0,0,0),(9,6,36,4,9,0,0,0,0),(9,7,19,4,7,0,0,0,0),(9,7,20,5,9,0,0,0,0),(9,7,21,7,11,0,0,0,0),(9,7,22,5,9,0,0,0,0),(9,7,23,1,5,0,0,1,0),(9,7,24,2,6,0,0,0,1),(9,7,25,6,10,0,0,0,0),(9,7,26,7,11,0,0,0,0),(9,7,27,0,4,0,0,0,0),(9,7,28,4,7,0,0,0,0),(9,7,29,7,11,0,0,0,0),(9,7,30,8,11,0,0,0,0),(9,7,31,7,10,0,0,0,0),(9,7,32,3,7,0,0,0,0),(9,7,33,7,12,0,0,0,0),(9,7,34,5,10,0,0,0,0),(9,7,35,8,13,0,0,0,0),(9,7,36,1,6,0,0,1,0),(9,8,19,6,9,0,0,0,0),(9,8,20,0,4,0,0,0,0),(9,8,21,6,10,0,0,0,0),(9,8,22,5,9,0,0,0,0),(9,8,23,7,11,0,0,0,0),(9,8,24,9,13,0,0,0,0),(9,8,25,5,9,0,0,0,0),(9,8,26,6,10,0,0,0,0),(9,8,27,0,4,0,0,0,0),(9,8,28,7,10,0,0,0,0),(9,8,29,3,7,0,0,0,0),(9,8,30,9,12,0,0,0,0),(9,8,31,4,7,0,0,0,0),(9,8,32,6,10,0,0,0,0),(9,8,33,6,11,0,0,0,0),(9,8,34,2,7,0,0,0,1),(9,8,35,6,11,0,0,0,0),(9,8,36,7,12,0,0,0,0),(9,9,37,9,12,0,0,0,0),(9,9,38,7,11,0,0,0,0),(9,9,39,5,9,0,0,0,0),(9,9,40,0,4,0,0,0,0),(9,9,41,6,10,0,0,0,0),(9,9,42,-2,1,0,1,0,0),(9,9,43,5,9,0,0,0,0),(9,9,44,6,10,0,0,0,0),(9,9,45,10,13,0,0,0,0),(9,9,46,8,11,0,0,0,0),(9,9,47,2,6,0,0,0,1),(9,9,48,7,11,0,0,0,0),(9,9,49,8,12,0,0,0,0),(9,9,50,3,7,0,0,0,0),(9,9,51,3,8,0,0,0,0),(9,9,52,6,11,0,0,0,0),(9,9,53,6,11,0,0,0,0),(9,9,54,4,9,0,0,0,0),(9,10,37,1,4,0,0,1,0),(9,10,38,2,6,0,0,0,1),(9,10,39,6,10,0,0,0,0),(9,10,40,4,8,0,0,0,0),(9,10,41,3,7,0,0,0,0),(9,10,42,2,5,0,0,0,1),(9,10,43,6,10,0,0,0,0),(9,10,44,6,10,0,0,0,0),(9,10,45,10,13,0,0,0,0),(9,10,46,8,11,0,0,0,0),(9,10,47,5,9,0,0,0,0),(9,10,48,3,7,0,0,0,0),(9,10,49,6,10,0,0,0,0),(9,10,50,9,13,0,0,0,0),(9,10,51,4,9,0,0,0,0),(9,10,52,7,12,0,0,0,0),(9,10,53,7,12,0,0,0,0),(9,10,54,4,9,0,0,0,0),(9,11,37,6,9,0,0,0,0),(9,11,38,7,11,0,0,0,0),(9,11,39,8,12,0,0,0,0),(9,11,40,7,11,0,0,0,0),(9,11,41,8,12,0,0,0,0),(9,11,42,1,4,0,0,1,0),(9,11,43,0,4,0,0,0,0),(9,11,44,0,4,0,0,0,0),(9,11,45,8,11,0,0,0,0),(9,11,46,5,8,0,0,0,0),(9,11,47,7,11,0,0,0,0),(9,11,48,7,11,0,0,0,0),(9,11,49,0,4,0,0,0,0),(9,11,50,2,6,0,0,0,1),(9,11,51,7,12,0,0,0,0),(9,11,52,6,11,0,0,0,0),(9,11,53,4,9,0,0,0,0),(9,11,54,6,11,0,0,0,0),(9,12,37,6,9,0,0,0,0),(9,12,38,3,7,0,0,0,0),(9,12,39,4,8,0,0,0,0),(9,12,40,7,11,0,0,0,0),(9,12,41,0,4,0,0,0,0),(9,12,42,8,11,0,0,0,0),(9,12,43,4,8,0,0,0,0),(9,12,44,5,9,0,0,0,0),(9,12,45,8,11,0,0,0,0),(9,12,46,3,6,0,0,0,0),(9,12,47,8,12,0,0,0,0),(9,12,48,2,6,0,0,0,1),(9,12,49,3,7,0,0,0,0),(9,12,50,-3,1,0,0,0,0),(9,12,51,1,6,0,0,1,0),(9,12,52,6,11,0,0,0,0),(9,12,53,6,11,0,0,0,0),(9,12,54,2,7,0,0,0,1),(9,13,55,8,11,0,0,0,0),(9,13,56,7,10,0,0,0,0),(9,13,57,3,6,0,0,0,0),(9,13,58,6,9,0,0,0,0),(9,13,59,8,11,0,0,0,0),(9,13,60,5,8,0,0,0,0),(9,13,61,8,12,0,0,0,0),(9,13,62,8,12,0,0,0,0),(9,13,63,2,6,0,0,0,1),(9,13,64,7,11,0,0,0,0),(9,13,65,6,10,0,0,0,0),(9,13,66,7,11,0,0,0,0),(9,13,67,4,9,0,0,0,0),(9,13,68,8,13,0,0,0,0),(9,13,69,6,11,0,0,0,0),(9,13,70,5,10,0,0,0,0),(9,13,71,3,8,0,0,0,0),(9,13,72,4,9,0,0,0,0),(9,14,55,4,7,0,0,0,0),(9,14,56,3,6,0,0,0,0),(9,14,57,6,9,0,0,0,0),(9,14,58,4,7,0,0,0,0),(9,14,59,6,9,0,0,0,0),(9,14,60,9,12,0,0,0,0),(9,14,61,4,8,0,0,0,0),(9,14,62,8,12,0,0,0,0),(9,14,63,7,11,0,0,0,0),(9,14,64,7,11,0,0,0,0),(9,14,65,4,8,0,0,0,0),(9,14,66,6,10,0,0,0,0),(9,14,67,4,9,0,0,0,0),(9,14,68,7,12,0,0,0,0),(9,14,69,5,10,0,0,0,0),(9,14,70,6,11,0,0,0,0),(9,14,71,1,6,0,0,1,0),(9,14,72,6,11,0,0,0,0),(9,15,55,1,4,0,0,1,0),(9,15,56,10,13,0,0,0,0),(9,15,57,8,11,0,0,0,0),(9,15,58,3,6,0,0,0,0),(9,15,59,10,13,0,0,0,0),(9,15,60,8,11,0,0,0,0),(9,15,61,6,10,0,0,0,0),(9,15,62,7,11,0,0,0,0),(9,15,63,9,13,0,0,0,0),(9,15,64,7,11,0,0,0,0),(9,15,65,6,10,0,0,0,0),(9,15,66,5,9,0,0,0,0),(9,15,67,4,9,0,0,0,0),(9,15,68,7,12,0,0,0,0),(9,15,69,5,10,0,0,0,0),(9,15,70,5,10,0,0,0,0),(9,15,71,4,9,0,0,0,0),(9,15,72,6,11,0,0,0,0),(9,16,55,7,10,0,0,0,0),(9,16,56,8,11,0,0,0,0),(9,16,57,9,12,0,0,0,0),(9,16,58,5,8,0,0,0,0),(9,16,59,4,7,0,0,0,0),(9,16,60,7,10,0,0,0,0),(9,16,61,6,10,0,0,0,0),(9,16,62,7,11,0,0,0,0),(9,16,63,5,9,0,0,0,0),(9,16,64,0,4,0,0,0,0),(9,16,65,5,9,0,0,0,0),(9,16,66,4,8,0,0,0,0),(9,16,67,7,12,0,0,0,0),(9,16,68,6,11,0,0,0,0),(9,16,69,4,9,0,0,0,0),(9,16,70,5,10,0,0,0,0),(9,16,71,6,11,0,0,0,0),(9,16,72,5,10,0,0,0,0),(9,17,73,1,4,0,0,1,0),(9,17,74,9,12,0,0,0,0),(9,17,75,6,9,0,0,0,0),(9,17,76,9,12,0,0,0,0),(9,17,77,5,8,0,0,0,0),(9,17,78,3,6,0,0,0,0),(9,17,79,6,10,0,0,0,0),(9,17,80,-1,3,1,0,0,0),(9,17,81,7,11,0,0,0,0),(9,17,82,8,12,0,0,0,0),(9,17,83,9,13,0,0,0,0),(9,17,84,6,10,0,0,0,0),(9,17,85,-1,4,1,0,0,0),(9,17,86,4,9,0,0,0,0),(9,17,87,6,11,0,0,0,0),(9,17,88,3,8,0,0,0,0),(9,17,89,6,11,0,0,0,0),(9,17,90,9,11,0,0,0,0),(9,18,73,7,10,0,0,0,0),(9,18,74,9,12,0,0,0,0),(9,18,75,6,9,0,0,0,0),(9,18,76,1,4,0,0,1,0),(9,18,77,9,12,0,0,0,0),(9,18,78,10,13,0,0,0,0),(9,18,79,8,12,0,0,0,0),(9,18,80,1,5,0,0,1,0),(9,18,81,0,4,0,0,0,0),(9,18,82,6,10,0,0,0,0),(9,18,83,6,10,0,0,0,0),(9,18,84,3,7,0,0,0,0),(9,18,85,1,6,0,0,1,0),(9,18,86,5,10,0,0,0,0),(9,18,87,-1,4,1,0,0,0),(9,18,88,7,12,0,0,0,0),(9,18,89,1,6,0,0,1,0),(9,18,90,9,11,0,0,0,0),(9,19,73,9,12,0,0,0,0),(9,19,74,3,6,0,0,0,0),(9,19,75,1,4,0,0,1,0),(9,19,76,8,11,0,0,0,0),(9,19,77,6,9,0,0,0,0),(9,19,78,4,7,0,0,0,0),(9,19,79,7,11,0,0,0,0),(9,19,80,3,7,0,0,0,0),(9,19,81,-1,3,1,0,0,0),(9,19,82,5,9,0,0,0,0),(9,19,83,8,12,0,0,0,0),(9,19,84,5,9,0,0,0,0),(9,19,85,-1,4,1,0,0,0),(9,19,86,2,7,0,0,0,1),(9,19,87,3,8,0,0,0,0),(9,19,88,6,11,0,0,0,0),(9,19,89,5,10,0,0,0,0),(9,19,90,10,12,0,0,0,0),(9,20,73,8,11,0,0,0,0),(9,20,74,7,10,0,0,0,0),(9,20,75,8,11,0,0,0,0),(9,20,76,6,9,0,0,0,0),(9,20,77,5,8,0,0,0,0),(9,20,78,6,9,0,0,0,0),(9,20,79,6,10,0,0,0,0),(9,20,80,9,13,0,0,0,0),(9,20,81,8,12,0,0,0,0),(9,20,82,9,13,0,0,0,0),(9,20,83,2,6,0,0,0,1),(9,20,84,7,11,0,0,0,0),(9,20,85,5,10,0,0,0,0),(9,20,86,6,11,0,0,0,0),(9,20,87,4,9,0,0,0,0),(9,20,88,7,12,0,0,0,0),(9,20,89,6,11,0,0,0,0),(9,20,90,9,11,0,0,0,0),(10,1,1,3,8,0,0,0,0),(10,1,2,5,8,0,0,0,0),(10,1,3,7,11,0,0,0,0),(10,1,4,8,11,0,0,0,0),(10,1,5,0,4,0,0,0,0),(10,1,6,2,6,0,0,0,1),(10,1,7,2,6,0,0,0,1),(10,1,8,9,12,0,0,0,0),(10,1,9,7,11,0,0,0,0),(10,1,10,8,12,0,0,0,0),(10,1,11,5,9,0,0,0,0),(10,1,12,8,12,0,0,0,0),(10,1,13,7,11,0,0,0,0),(10,1,14,1,6,0,0,1,0),(10,1,15,4,9,0,0,0,0),(10,1,16,7,12,0,0,0,0),(10,1,17,6,11,0,0,0,0),(10,1,18,5,10,0,0,0,0),(10,2,1,3,8,0,0,0,0),(10,2,2,10,13,0,0,0,0),(10,2,3,8,12,0,0,0,0),(10,2,4,1,4,0,0,1,0),(10,2,5,6,10,0,0,0,0),(10,2,6,5,9,0,0,0,0),(10,2,7,7,11,0,0,0,0),(10,2,8,7,10,0,0,0,0),(10,2,9,3,7,0,0,0,0),(10,2,10,6,10,0,0,0,0),(10,2,11,6,10,0,0,0,0),(10,2,12,8,12,0,0,0,0),(10,2,13,6,10,0,0,0,0),(10,2,14,0,5,0,0,0,0),(10,2,15,3,8,0,0,0,0),(10,2,16,2,7,0,0,0,1),(10,2,17,1,6,0,0,1,0),(10,2,18,0,5,0,0,0,0),(10,3,1,9,14,0,0,0,0),(10,3,2,4,7,0,0,0,0),(10,3,3,6,10,0,0,0,0),(10,3,4,8,11,0,0,0,0),(10,3,5,4,8,0,0,0,0),(10,3,6,4,8,0,0,0,0),(10,3,7,0,4,0,0,0,0),(10,3,8,7,10,0,0,0,0),(10,3,9,5,9,0,0,0,0),(10,3,10,6,10,0,0,0,0),(10,3,11,6,10,0,0,0,0),(10,3,12,4,8,0,0,0,0),(10,3,13,5,9,0,0,0,0),(10,3,14,4,9,0,0,0,0),(10,3,15,4,9,0,0,0,0),(10,3,16,2,7,0,0,0,1),(10,3,17,5,10,0,0,0,0),(10,3,18,8,13,0,0,0,0),(10,4,1,7,12,0,0,0,0),(10,4,2,6,9,0,0,0,0),(10,4,3,5,9,0,0,0,0),(10,4,4,7,10,0,0,0,0),(10,4,5,1,5,0,0,1,0),(10,4,6,3,7,0,0,0,0),(10,4,7,7,11,0,0,0,0),(10,4,8,9,12,0,0,0,0),(10,4,9,2,6,0,0,0,1),(10,4,10,0,4,0,0,0,0),(10,4,11,6,10,0,0,0,0),(10,4,12,6,10,0,0,0,0),(10,4,13,5,9,0,0,0,0),(10,4,14,5,10,0,0,0,0),(10,4,15,-4,1,0,0,0,0),(10,4,16,3,8,0,0,0,0),(10,4,17,2,7,0,0,0,1),(10,4,18,8,13,0,0,0,0),(10,5,19,2,5,0,0,0,1),(10,5,20,5,9,0,0,0,0),(10,5,21,5,9,0,0,0,0),(10,5,22,2,6,0,0,0,1),(10,5,23,8,12,0,0,0,0),(10,5,24,7,11,0,0,0,0),(10,5,25,7,11,0,0,0,0),(10,5,26,4,8,0,0,0,0),(10,5,27,5,9,0,0,0,0),(10,5,28,3,6,0,0,0,0),(10,5,29,5,9,0,0,0,0),(10,5,30,0,3,0,0,0,0),(10,5,31,10,13,0,0,0,0),(10,5,32,7,11,0,0,0,0),(10,5,33,6,11,0,0,0,0),(10,5,34,5,10,0,0,0,0),(10,5,35,6,11,0,0,0,0),(10,5,36,2,7,0,0,0,1),(10,6,19,9,12,0,0,0,0),(10,6,20,3,7,0,0,0,0),(10,6,21,7,11,0,0,0,0),(10,6,22,7,11,0,0,0,0),(10,6,23,4,8,0,0,0,0),(10,6,24,5,9,0,0,0,0),(10,6,25,6,10,0,0,0,0),(10,6,26,7,11,0,0,0,0),(10,6,27,6,10,0,0,0,0),(10,6,28,8,11,0,0,0,0),(10,6,29,4,8,0,0,0,0),(10,6,30,9,12,0,0,0,0),(10,6,31,8,11,0,0,0,0),(10,6,32,8,12,0,0,0,0),(10,6,33,4,9,0,0,0,0),(10,6,34,7,12,0,0,0,0),(10,6,35,4,9,0,0,0,0),(10,6,36,1,6,0,0,1,0),(10,7,19,10,13,0,0,0,0),(10,7,20,3,7,0,0,0,0),(10,7,21,8,12,0,0,0,0),(10,7,22,6,10,0,0,0,0),(10,7,23,2,6,0,0,0,1),(10,7,24,3,7,0,0,0,0),(10,7,25,8,12,0,0,0,0),(10,7,26,4,8,0,0,0,0),(10,7,27,6,10,0,0,0,0),(10,7,28,4,7,0,0,0,0),(10,7,29,3,7,0,0,0,0),(10,7,30,2,5,0,0,0,1),(10,7,31,4,7,0,0,0,0),(10,7,32,7,11,0,0,0,0),(10,7,33,6,11,0,0,0,0),(10,7,34,2,7,0,0,0,1),(10,7,35,6,11,0,0,0,0),(10,7,36,0,5,0,0,0,0),(10,8,19,5,8,0,0,0,0),(10,8,20,5,9,0,0,0,0),(10,8,21,7,11,0,0,0,0),(10,8,22,6,10,0,0,0,0),(10,8,23,2,6,0,0,0,1),(10,8,24,4,8,0,0,0,0),(10,8,25,-1,3,1,0,0,0),(10,8,26,6,10,0,0,0,0),(10,8,27,5,9,0,0,0,0),(10,8,28,1,4,0,0,1,0),(10,8,29,6,10,0,0,0,0),(10,8,30,9,12,0,0,0,0),(10,8,31,4,7,0,0,0,0),(10,8,32,7,11,0,0,0,0),(10,8,33,7,12,0,0,0,0),(10,8,34,0,5,0,0,0,0),(10,8,35,5,10,0,0,0,0),(10,8,36,-1,4,1,0,0,0),(10,9,37,6,9,0,0,0,0),(10,9,38,8,12,0,0,0,0),(10,9,39,5,9,0,0,0,0),(10,9,40,8,12,0,0,0,0),(10,9,41,7,11,0,0,0,0),(10,9,42,10,13,0,0,0,0),(10,9,43,5,9,0,0,0,0),(10,9,44,2,6,0,0,0,1),(10,9,45,8,11,0,0,0,0),(10,9,46,7,10,0,0,0,0),(10,9,47,9,13,0,0,0,0),(10,9,48,7,11,0,0,0,0),(10,9,49,6,10,0,0,0,0),(10,9,50,8,12,0,0,0,0),(10,9,51,3,8,0,0,0,0),(10,9,52,5,10,0,0,0,0),(10,9,53,3,8,0,0,0,0),(10,9,54,6,11,0,0,0,0),(10,10,37,7,10,0,0,0,0),(10,10,38,8,12,0,0,0,0),(10,10,39,7,11,0,0,0,0),(10,10,40,8,12,0,0,0,0),(10,10,41,5,9,0,0,0,0),(10,10,42,5,8,0,0,0,0),(10,10,43,7,11,0,0,0,0),(10,10,44,8,12,0,0,0,0),(10,10,45,10,13,0,0,0,0),(10,10,46,9,12,0,0,0,0),(10,10,47,4,8,0,0,0,0),(10,10,48,2,6,0,0,0,1),(10,10,49,7,11,0,0,0,0),(10,10,50,2,6,0,0,0,1),(10,10,51,5,10,0,0,0,0),(10,10,52,2,7,0,0,0,1),(10,10,53,7,12,0,0,0,0),(10,10,54,7,12,0,0,0,0),(10,11,37,4,7,0,0,0,0),(10,11,38,9,13,0,0,0,0),(10,11,39,9,13,0,0,0,0),(10,11,40,7,11,0,0,0,0),(10,11,41,4,8,0,0,0,0),(10,11,42,10,13,0,0,0,0),(10,11,43,10,14,0,0,0,0),(10,11,44,7,11,0,0,0,0),(10,11,45,9,12,0,0,0,0),(10,11,46,8,11,0,0,0,0),(10,11,47,4,8,0,0,0,0),(10,11,48,4,8,0,0,0,0),(10,11,49,6,10,0,0,0,0),(10,11,50,5,9,0,0,0,0),(10,11,51,4,9,0,0,0,0),(10,11,52,3,8,0,0,0,0),(10,11,53,5,10,0,0,0,0),(10,11,54,1,6,0,0,1,0),(10,12,37,5,8,0,0,0,0),(10,12,38,5,9,0,0,0,0),(10,12,39,7,11,0,0,0,0),(10,12,40,9,13,0,0,0,0),(10,12,41,7,11,0,0,0,0),(10,12,42,7,10,0,0,0,0),(10,12,43,5,9,0,0,0,0),(10,12,44,3,7,0,0,0,0),(10,12,45,6,9,0,0,0,0),(10,12,46,7,10,0,0,0,0),(10,12,47,6,10,0,0,0,0),(10,12,48,9,13,0,0,0,0),(10,12,49,5,9,0,0,0,0),(10,12,50,-1,3,1,0,0,0),(10,12,51,4,9,0,0,0,0),(10,12,52,7,12,0,0,0,0),(10,12,53,3,8,0,0,0,0),(10,12,54,5,10,0,0,0,0),(10,13,55,9,12,0,0,0,0),(10,13,56,9,12,0,0,0,0),(10,13,57,7,10,0,0,0,0),(10,13,58,6,9,0,0,0,0),(10,13,59,7,10,0,0,0,0),(10,13,60,4,7,0,0,0,0),(10,13,61,6,10,0,0,0,0),(10,13,62,2,6,0,0,0,1),(10,13,63,2,6,0,0,0,1),(10,13,64,5,9,0,0,0,0),(10,13,65,5,9,0,0,0,0),(10,13,66,3,7,0,0,0,0),(10,13,67,-1,4,1,0,0,0),(10,13,68,4,9,0,0,0,0),(10,13,69,6,11,0,0,0,0),(10,13,70,-1,4,1,0,0,0),(10,13,71,7,12,0,0,0,0),(10,13,72,5,10,0,0,0,0),(10,14,55,6,9,0,0,0,0),(10,14,56,3,6,0,0,0,0),(10,14,57,9,12,0,0,0,0),(10,14,58,8,11,0,0,0,0),(10,14,59,5,8,0,0,0,0),(10,14,60,9,12,0,0,0,0),(10,14,61,9,13,0,0,0,0),(10,14,62,7,11,0,0,0,0),(10,14,63,-3,1,0,0,0,0),(10,14,64,-1,3,1,0,0,0),(10,14,65,5,9,0,0,0,0),(10,14,66,5,9,0,0,0,0),(10,14,67,0,5,0,0,0,0),(10,14,68,6,11,0,0,0,0),(10,14,69,7,12,0,0,0,0),(10,14,70,2,7,0,0,0,1),(10,14,71,6,11,0,0,0,0),(10,14,72,8,13,0,0,0,0),(10,15,55,8,11,0,0,0,0),(10,15,56,8,11,0,0,0,0),(10,15,57,9,12,0,0,0,0),(10,15,58,6,9,0,0,0,0),(10,15,59,4,7,0,0,0,0),(10,15,60,9,12,0,0,0,0),(10,15,61,2,6,0,0,0,1),(10,15,62,7,11,0,0,0,0),(10,15,63,-1,3,1,0,0,0),(10,15,64,8,12,0,0,0,0),(10,15,65,7,11,0,0,0,0),(10,15,66,6,10,0,0,0,0),(10,15,67,2,7,0,0,0,1),(10,15,68,6,11,0,0,0,0),(10,15,69,7,12,0,0,0,0),(10,15,70,1,6,0,0,1,0),(10,15,71,8,13,0,0,0,0),(10,15,72,4,9,0,0,0,0),(10,16,55,8,11,0,0,0,0),(10,16,56,9,12,0,0,0,0),(10,16,57,2,5,0,0,0,1),(10,16,58,4,7,0,0,0,0),(10,16,59,4,7,0,0,0,0),(10,16,60,4,7,0,0,0,0),(10,16,61,6,10,0,0,0,0),(10,16,62,6,10,0,0,0,0),(10,16,63,6,10,0,0,0,0),(10,16,64,6,10,0,0,0,0),(10,16,65,6,10,0,0,0,0),(10,16,66,2,6,0,0,0,1),(10,16,67,5,10,0,0,0,0),(10,16,68,2,7,0,0,0,1),(10,16,69,4,9,0,0,0,0),(10,16,70,-2,3,0,1,0,0),(10,16,71,4,9,0,0,0,0),(10,16,72,6,11,0,0,0,0),(10,17,73,-2,1,0,1,0,0),(10,17,74,5,8,0,0,0,0),(10,17,75,4,7,0,0,0,0),(10,17,76,6,9,0,0,0,0),(10,17,77,8,11,0,0,0,0),(10,17,78,9,12,0,0,0,0),(10,17,79,7,11,0,0,0,0),(10,17,80,6,10,0,0,0,0),(10,17,81,8,12,0,0,0,0),(10,17,82,0,4,0,0,0,0),(10,17,83,1,5,0,0,1,0),(10,17,84,8,12,0,0,0,0),(10,17,85,1,6,0,0,1,0),(10,17,86,-1,4,1,0,0,0),(10,17,87,2,7,0,0,0,1),(10,17,88,4,9,0,0,0,0),(10,17,89,7,12,0,0,0,0),(10,17,90,2,4,0,0,0,1),(10,18,73,3,6,0,0,0,0),(10,18,74,5,8,0,0,0,0),(10,18,75,6,9,0,0,0,0),(10,18,76,9,12,0,0,0,0),(10,18,77,8,11,0,0,0,0),(10,18,78,9,12,0,0,0,0),(10,18,79,11,15,0,0,0,0),(10,18,80,7,11,0,0,0,0),(10,18,81,8,12,0,0,0,0),(10,18,82,4,8,0,0,0,0),(10,18,83,1,5,0,0,1,0),(10,18,84,8,12,0,0,0,0),(10,18,85,4,9,0,0,0,0),(10,18,86,2,7,0,0,0,1),(10,18,87,6,11,0,0,0,0),(10,18,88,5,10,0,0,0,0),(10,18,89,2,7,0,0,0,1),(10,18,90,9,11,0,0,0,0),(10,19,73,7,10,0,0,0,0),(10,19,74,1,4,0,0,1,0),(10,19,75,8,11,0,0,0,0),(10,19,76,5,8,0,0,0,0),(10,19,77,3,6,0,0,0,0),(10,19,78,8,11,0,0,0,0),(10,19,79,3,7,0,0,0,0),(10,19,80,7,11,0,0,0,0),(10,19,81,5,9,0,0,0,0),(10,19,82,7,11,0,0,0,0),(10,19,83,7,11,0,0,0,0),(10,19,84,2,6,0,0,0,1),(10,19,85,8,13,0,0,0,0),(10,19,86,5,10,0,0,0,0),(10,19,87,3,8,0,0,0,0),(10,19,88,7,12,0,0,0,0),(10,19,89,1,6,0,0,1,0),(10,19,90,7,9,0,0,0,0),(10,20,73,6,9,0,0,0,0),(10,20,74,3,6,0,0,0,0),(10,20,75,9,12,0,0,0,0),(10,20,76,5,8,0,0,0,0),(10,20,77,9,12,0,0,0,0),(10,20,78,9,12,0,0,0,0),(10,20,79,3,7,0,0,0,0),(10,20,80,2,6,0,0,0,1),(10,20,81,6,10,0,0,0,0),(10,20,82,6,10,0,0,0,0),(10,20,83,5,9,0,0,0,0),(10,20,84,7,11,0,0,0,0),(10,20,85,5,10,0,0,0,0),(10,20,86,-2,3,0,1,0,0),(10,20,87,6,11,0,0,0,0),(10,20,88,7,12,0,0,0,0),(10,20,89,5,10,0,0,0,0),(10,20,90,9,11,0,0,0,0);
/*!40000 ALTER TABLE `scores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `seasons`
--

DROP TABLE IF EXISTS `seasons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `seasons` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `season_key` int(11) NOT NULL,
  `publisher_id` int(11) NOT NULL,
  `league_id` int(11) DEFAULT NULL,
  `start_date_time` datetime DEFAULT NULL,
  `end_date_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_FK_sea_lea_id__aff_id` (`league_id`),
  KEY `IDX_FK_sea_pub_id__pub_id` (`publisher_id`),
  KEY `IDX_seasons_1` (`season_key`),
  CONSTRAINT `FK_sea_lea_id__aff_id` FOREIGN KEY (`league_id`) REFERENCES `affiliations` (`id`),
  CONSTRAINT `FK_sea_pub_id__pub_id` FOREIGN KEY (`publisher_id`) REFERENCES `publishers` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `seasons`
--

LOCK TABLES `seasons` WRITE;
/*!40000 ALTER TABLE `seasons` DISABLE KEYS */;
/*!40000 ALTER TABLE `seasons` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sites`
--

DROP TABLE IF EXISTS `sites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `site_key` varchar(128) NOT NULL,
  `publisher_id` int(11) NOT NULL,
  `location_id` int(11) DEFAULT NULL,
  `address_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_FK_sit_loc_id__loc_id` (`location_id`),
  KEY `IDX_FK_sit_pub_id__pub_id` (`publisher_id`),
  KEY `IDX_sites_1` (`site_key`),
  KEY `FK_sites_address_id__addresses_id` (`address_id`),
  CONSTRAINT `FK_sit_loc_id__loc_id` FOREIGN KEY (`location_id`) REFERENCES `locations` (`id`),
  CONSTRAINT `FK_sit_pub_id__pub_id` FOREIGN KEY (`publisher_id`) REFERENCES `publishers` (`id`),
  CONSTRAINT `FK_sites_address_id__addresses_id` FOREIGN KEY (`address_id`) REFERENCES `addresses` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sites`
--

LOCK TABLES `sites` WRITE;
/*!40000 ALTER TABLE `sites` DISABLE KEYS */;
INSERT INTO `sites` VALUES (1,'Pretoria Country club',1,1,1),(2,'Tokyo Yokahama',2,2,2),(3,'Ridgeview Country Club',1,3,2),(4,'Willowmoore Views',2,2,1),(5,'Greencrest Golf Course',3,1,4);
/*!40000 ALTER TABLE `sites` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sports_property`
--

DROP TABLE IF EXISTS `sports_property`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sports_property` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sports_property_type` varchar(100) DEFAULT NULL,
  `sports_property_id` int(11) DEFAULT NULL,
  `formal_name` varchar(100) NOT NULL,
  `value` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sports_property`
--

LOCK TABLES `sports_property` WRITE;
/*!40000 ALTER TABLE `sports_property` DISABLE KEYS */;
/*!40000 ALTER TABLE `sports_property` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `standing_subgroups`
--

DROP TABLE IF EXISTS `standing_subgroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `standing_subgroups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `standing_id` int(11) NOT NULL,
  `affiliation_id` int(11) NOT NULL,
  `alignment_scope` varchar(100) DEFAULT NULL,
  `competition_scope` varchar(100) DEFAULT NULL,
  `competition_scope_id` varchar(100) DEFAULT NULL,
  `duration_scope` varchar(100) DEFAULT NULL,
  `scoping_label` varchar(100) DEFAULT NULL,
  `site_scope` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_sta_sub_sta_id__sta_id` (`standing_id`),
  KEY `FK_sta_sub_aff_id__aff_id` (`affiliation_id`),
  CONSTRAINT `FK_sta_sub_aff_id__aff_id` FOREIGN KEY (`affiliation_id`) REFERENCES `affiliations` (`id`),
  CONSTRAINT `FK_sta_sub_sta_id__sta_id` FOREIGN KEY (`standing_id`) REFERENCES `standings` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `standing_subgroups`
--

LOCK TABLES `standing_subgroups` WRITE;
/*!40000 ALTER TABLE `standing_subgroups` DISABLE KEYS */;
/*!40000 ALTER TABLE `standing_subgroups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `standings`
--

DROP TABLE IF EXISTS `standings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `standings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `affiliation_id` int(11) NOT NULL,
  `standing_type` varchar(100) DEFAULT NULL,
  `sub_season_id` int(11) NOT NULL,
  `last_updated` varchar(100) DEFAULT NULL,
  `source` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_sta_aff_id__aff_id` (`affiliation_id`),
  KEY `FK_sta_sub_sea_id__sub_sea_id` (`sub_season_id`),
  CONSTRAINT `FK_sta_aff_id__aff_id` FOREIGN KEY (`affiliation_id`) REFERENCES `affiliations` (`id`),
  CONSTRAINT `FK_sta_sub_sea_id__sub_sea_id` FOREIGN KEY (`sub_season_id`) REFERENCES `sub_seasons` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `standings`
--

LOCK TABLES `standings` WRITE;
/*!40000 ALTER TABLE `standings` DISABLE KEYS */;
/*!40000 ALTER TABLE `standings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stats`
--

DROP TABLE IF EXISTS `stats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stats` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `stat_repository_type` varchar(100) DEFAULT NULL,
  `stat_repository_id` int(11) NOT NULL,
  `stat_holder_type` varchar(100) DEFAULT NULL,
  `stat_holder_id` int(11) DEFAULT NULL,
  `stat_coverage_type` varchar(100) DEFAULT NULL,
  `stat_coverage_id` int(11) DEFAULT NULL,
  `stat_membership_type` varchar(40) DEFAULT NULL,
  `stat_membership_id` int(11) DEFAULT NULL,
  `context` varchar(40) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_stats_1` (`stat_repository_type`),
  KEY `IDX_stats_2` (`stat_repository_id`),
  KEY `IDX_stats_3` (`stat_holder_type`),
  KEY `IDX_stats_4` (`stat_holder_id`),
  KEY `IDX_stats_5` (`stat_coverage_type`),
  KEY `IDX_stats_6` (`stat_coverage_id`),
  KEY `IDX_stats_7` (`context`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stats`
--

LOCK TABLES `stats` WRITE;
/*!40000 ALTER TABLE `stats` DISABLE KEYS */;
/*!40000 ALTER TABLE `stats` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `strokes`
--

DROP TABLE IF EXISTS `strokes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `strokes` (
  `stroke_no` int(2) NOT NULL,
  `round_id` int(11) NOT NULL,
  `hole_id` int(11) NOT NULL,
  `person_id` int(11) NOT NULL,
  `club_used` varchar(100) NOT NULL,
  `distance` decimal(10,2) DEFAULT NULL,
  `landing` set('Penalty','Fairway','Rough','Bunker','Green','Hole') NOT NULL,
  PRIMARY KEY (`stroke_no`,`round_id`,`hole_id`,`person_id`),
  KEY `FK_strokes_person_id__persons_id` (`person_id`),
  KEY `FK_strokes_round_id__rounds_id` (`round_id`),
  KEY `FK_strokes_hole_id__holes_id` (`hole_id`),
  CONSTRAINT `FK_strokes_hole_id__holes_id` FOREIGN KEY (`hole_id`) REFERENCES `holes` (`id`),
  CONSTRAINT `FK_strokes_person_id__persons_id` FOREIGN KEY (`person_id`) REFERENCES `persons` (`id`),
  CONSTRAINT `FK_strokes_round_id__rounds_id` FOREIGN KEY (`round_id`) REFERENCES `rounds` (`id`),
  CONSTRAINT `CHK_stroke_no` CHECK (`stroke_no` > 0)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `strokes`
--

LOCK TABLES `strokes` WRITE;
/*!40000 ALTER TABLE `strokes` DISABLE KEYS */;
INSERT INTO `strokes` VALUES (9,15,59,9,'Putter',5.92,'Bunker'),(9,15,60,1,'7-Iron',6.55,'Fairway'),(9,15,60,3,'3-Wood',0.00,'Penalty'),(9,15,60,4,'9-Iron',7.20,'Fairway'),(9,15,60,5,'4-Iron',6.00,'Bunker'),(9,15,60,6,'6-Iron',6.55,'Fairway'),(9,15,60,7,'5-Wood',8.00,'Hole'),(9,15,60,9,'Wedge',6.55,'Fairway'),(9,15,60,10,'3-Wood',6.00,'Bunker'),(9,15,61,1,'Wedge',9.36,'Bunker'),(9,15,61,3,'Putter',11.44,'Hole'),(9,15,61,4,'3-Iron',8.58,'Bunker'),(9,15,61,5,'4-Hybrid',8.58,'Fairway'),(9,15,61,6,'Wedge',10.30,'Fairway'),(9,15,61,7,'5-Wood',11.44,'Hole'),(9,15,61,8,'4-Iron',9.36,'Fairway'),(9,15,61,9,'5-Iron',10.30,'Bunker'),(9,15,62,1,'',13.00,'Hole'),(9,15,62,2,'1-Iron',9.45,'Fairway'),(9,15,62,3,'Putter',11.56,'Hole'),(9,15,62,4,'3-Iron',8.67,'Bunker'),(9,15,62,5,'',10.40,'Fairway'),(9,15,62,6,'9-Iron',9.45,'Fairway'),(9,15,62,7,'4-Iron',9.45,'Fairway'),(9,15,62,8,'4-Hybrid',9.45,'Fairway'),(9,15,62,9,'6-Iron',9.45,'Bunker'),(9,15,62,10,'9-Iron',10.40,'Fairway'),(9,15,63,1,'4-Iron',9.64,'Fairway'),(9,15,63,2,'7-Iron',9.64,'Fairway'),(9,15,63,3,'4-Hybrid',9.64,'Fairway'),(9,15,63,4,'3-Wood',11.78,'Hole'),(9,15,63,5,'5-Wood',11.78,'Fairway'),(9,15,63,7,'Putter',13.25,'Hole'),(9,15,63,8,'4-Iron',9.64,'Bunker'),(9,15,63,9,'5-Iron',0.00,'Penalty'),(9,15,64,1,'9-Iron',10.80,'Fairway'),(9,15,64,2,'4-Hybrid',9.82,'Fairway'),(9,15,64,3,'',10.80,'Fairway'),(9,15,64,4,'3-Iron',9.82,'Fairway'),(9,15,64,5,'5-Wood',9.82,'Fairway'),(9,15,64,6,'7-Iron',9.82,'Fairway'),(9,15,64,9,'9-Iron',9.82,'Fairway'),(9,15,64,10,'5-Hybrid',9.82,'Penalty'),(9,15,65,1,'4-Iron',9.36,'Fairway'),(9,15,65,2,'8-Iron',10.30,'Bunker'),(9,15,65,3,'3-Wood',11.44,'Bunker'),(9,15,65,4,'4-Iron',8.58,'Fairway'),(9,15,65,5,'',8.58,'Bunker'),(9,15,65,7,'6-Iron',11.44,'Hole'),(9,15,65,8,'5-Iron',9.36,'Fairway'),(9,15,65,9,'1-Iron',12.88,'Fairway'),(9,15,65,10,'3-Iron',10.30,'Penalty'),(9,15,66,3,'4-Hybrid',9.89,'Fairway'),(9,15,66,4,'1-Iron',9.89,'Fairway'),(9,15,66,5,'Wedge',9.89,'Fairway'),(9,15,66,6,'5-Iron',0.00,'Penalty'),(9,15,66,7,'3-Iron',8.90,'Bunker'),(9,15,66,9,'1-Iron',11.13,'Hole'),(9,15,66,10,'Putter',8.90,'Fairway'),(9,15,67,1,'2-Iron',11.67,'Fairway'),(9,15,67,3,'9-Iron',9.55,'Fairway'),(9,15,67,5,'3-Wood',9.55,'Fairway'),(9,15,67,9,'7-Iron',11.67,'Hole'),(9,15,68,1,'4-Hybrid',12.00,'Hole'),(9,15,68,2,'3-Iron',12.00,'Hole'),(9,15,68,4,'5-Iron',13.50,'Hole'),(9,15,68,5,'6-Iron',9.00,'Bunker'),(9,15,68,8,'3-Hybrid',9.82,'Fairway'),(9,15,68,9,'7-Iron',9.82,'Fairway'),(9,15,68,10,'7-Iron',10.80,'Fairway'),(9,15,69,2,'4-Hybrid',10.90,'Fairway'),(9,15,69,3,'Putter',10.90,'Fairway'),(9,15,69,4,'5-Hybrid',9.91,'Bunker'),(9,15,69,5,'9-Iron',10.90,'Fairway'),(9,15,69,6,'3-Wood',13.63,'Hole'),(9,15,69,7,'3-Wood',9.91,'Fairway'),(9,15,69,9,'6-Iron',10.90,'Fairway'),(9,15,69,10,'9-Iron',10.90,'Fairway'),(9,15,70,1,'5-Hybrid',17.00,'Hole'),(9,15,70,2,'5-Hybrid',10.82,'Fairway'),(9,15,70,3,'5-Hybrid',10.82,'Fairway'),(9,15,70,4,'9-Iron',9.92,'Bunker'),(9,15,70,5,'3-Hybrid',10.82,'Bunker'),(9,15,70,7,'5-Iron',0.00,'Penalty'),(9,15,70,8,'3-Hybrid',9.92,'Fairway'),(9,15,70,9,'Putter',11.90,'Bunker'),(9,15,71,1,'Wedge',11.00,'Fairway'),(9,15,71,2,'5-Hybrid',0.00,'Penalty'),(9,15,71,4,'2-Iron',0.00,'Penalty'),(9,15,71,5,'1-Iron',12.10,'Bunker'),(9,15,71,7,'5-Iron',11.00,'Penalty'),(9,15,71,8,'5-Iron',13.44,'Hole'),(9,15,71,9,'8-Iron',13.44,'Hole'),(9,15,71,10,'5-Iron',10.08,'Penalty'),(9,15,72,2,'3-Wood',14.00,'Bunker'),(9,15,72,4,'9-Iron',11.67,'Bunker'),(9,15,72,7,'4-Iron',12.73,'Fairway'),(9,15,72,9,'Putter',14.00,'Fairway'),(9,15,72,10,'3-Hybrid',15.56,'Hole'),(9,16,55,1,'5-Hybrid',6.09,'Fairway'),(9,16,55,4,'5-Wood',7.44,'Bunker'),(9,16,55,6,'5-Iron',6.09,'Fairway'),(9,16,55,7,'',0.00,'Penalty'),(9,16,55,8,'3-Iron',0.00,'Penalty'),(9,16,55,9,'7-Iron',0.00,'Penalty'),(9,16,55,10,'4-Iron',6.70,'Fairway'),(9,16,56,1,'5-Iron',6.18,'Fairway'),(9,16,56,3,'Driver',5.67,'Penalty'),(9,16,56,4,'4-Iron',6.18,'Bunker'),(9,16,56,5,'1-Iron',6.18,'Fairway'),(9,16,56,6,'2-Iron',6.80,'Fairway'),(9,16,56,7,'5-Hybrid',0.00,'Penalty'),(9,16,56,8,'2-Iron',5.67,'Fairway'),(9,16,56,9,'2-Iron',6.18,'Fairway'),(9,16,56,10,'2-Iron',6.18,'Fairway'),(9,16,57,1,'5-Hybrid',6.27,'Fairway'),(9,16,57,2,'7-Iron',6.90,'Fairway'),(9,16,57,3,'5-Iron',5.75,'Bunker'),(9,16,57,4,'3-Iron',6.27,'Bunker'),(9,16,57,5,'9-Iron',6.27,'Fairway'),(9,16,57,7,'3-Iron',6.27,'Fairway'),(9,16,57,8,'Wedge',6.27,'Bunker'),(9,16,57,9,'3-Iron',6.27,'Bunker'),(9,16,58,1,'5-Hybrid',7.00,'Bunker'),(9,16,58,2,'4-Hybrid',6.36,'Fairway'),(9,16,58,3,'5-Wood',6.36,'Penalty'),(9,16,58,4,'Wedge',6.36,'Fairway'),(9,16,58,7,'3-Hybrid',7.00,'Fairway'),(9,16,59,2,'Putter',7.89,'Hole'),(9,16,59,4,'4-Iron',6.45,'Fairway'),(9,16,59,5,'3-Hybrid',6.45,'Bunker'),(9,16,59,6,'5-Iron',7.89,'Hole'),(9,16,59,8,'4-Hybrid',7.10,'Fairway'),(9,16,60,1,'8-Iron',6.55,'Fairway'),(9,16,60,3,'3-Iron',7.20,'Fairway'),(9,16,60,8,'8-Iron',7.20,'Fairway'),(9,16,60,9,'7-Iron',7.20,'Bunker'),(9,16,61,1,'8-Iron',10.30,'Bunker'),(9,16,61,5,'4-Iron',9.36,'Fairway'),(9,16,61,8,'6-Iron',9.36,'Fairway'),(9,16,61,9,'1-Iron',10.30,'Bunker'),(9,16,61,10,'3-Hybrid',10.30,'Fairway'),(9,16,62,1,'5-Hybrid',9.45,'Bunker'),(9,16,62,2,'6-Iron',8.67,'Bunker'),(9,16,62,3,'5-Hybrid',10.40,'Bunker'),(9,16,62,4,'9-Iron',0.00,'Penalty'),(9,16,62,5,'Wedge',10.40,'Fairway'),(9,16,62,7,'',8.67,'Bunker'),(9,16,62,8,'1-Iron',11.56,'Hole'),(9,16,62,9,'Wedge',9.45,'Bunker'),(9,16,62,10,'5-Hybrid',10.40,'Fairway'),(9,16,63,2,'1-Iron',0.00,'Penalty'),(9,16,63,3,'5-Wood',10.60,'Bunker'),(9,16,63,4,'5-Hybrid',9.64,'Fairway'),(9,16,63,8,'5-Wood',0.00,'Penalty'),(9,16,63,9,'3-Wood',13.25,'Hole'),(9,16,63,10,'5-Wood',10.60,'Fairway'),(9,16,64,1,'5-Iron',9.00,'Bunker'),(9,16,64,2,'5-Wood',9.82,'Fairway'),(9,16,64,3,'9-Iron',9.00,'Fairway'),(9,16,64,4,'',13.50,'Hole'),(9,16,64,5,'8-Iron',9.82,'Bunker'),(9,16,64,6,'Driver',9.82,'Bunker'),(9,16,64,7,'7-Iron',10.80,'Penalty'),(9,16,64,8,'4-Iron',10.80,'Fairway'),(9,16,64,10,'4-Hybrid',10.80,'Bunker'),(9,16,65,1,'1-Iron',11.44,'Hole'),(9,16,65,2,'5-Iron',11.44,'Fairway'),(9,16,65,4,'9-Iron',9.36,'Bunker'),(9,16,65,6,'2-Iron',9.36,'Bunker'),(9,16,65,7,'9-Iron',11.44,'Hole'),(9,16,65,8,'9-Iron',11.44,'Penalty'),(9,16,65,9,'',12.88,'Hole'),(9,16,65,10,'9-Iron',10.30,'Fairway'),(9,16,66,1,'9-Iron',8.90,'Fairway'),(9,16,66,3,'',8.09,'Fairway'),(9,16,66,4,'7-Iron',8.09,'Bunker'),(9,16,66,5,'5-Hybrid',8.09,'Fairway'),(9,16,66,6,'6-Iron',7.42,'Fairway'),(9,16,66,7,'2-Iron',8.90,'Bunker'),(9,16,66,8,'6-Iron',8.09,'Fairway'),(9,16,67,1,'5-Iron',8.75,'Fairway'),(9,16,67,2,'3-Hybrid',11.67,'Fairway'),(9,16,67,3,'1-Iron',11.67,'Hole'),(9,16,67,4,'3-Wood',9.55,'Bunker'),(9,16,67,5,'9-Iron',11.67,'Hole'),(9,16,67,6,'5-Wood',10.50,'Fairway'),(9,16,67,7,'3-Wood',10.50,'Fairway'),(9,16,67,8,'8-Iron',9.55,'Fairway'),(9,16,67,9,'4-Iron',8.75,'Fairway'),(9,16,67,10,'2-Iron',10.50,'Bunker'),(9,16,68,1,'2-Iron',9.00,'Fairway'),(9,16,68,2,'5-Wood',10.80,'Bunker'),(9,16,68,3,'6-Iron',9.00,'Fairway'),(9,16,68,4,'3-Wood',12.00,'Fairway'),(9,16,68,5,'4-Iron',9.82,'Bunker'),(9,16,68,6,'2-Iron',9.82,'Fairway'),(9,16,68,8,'2-Iron',10.80,'Bunker'),(9,16,68,9,'Driver',9.82,'Fairway'),(9,16,69,2,'Wedge',9.08,'Bunker'),(9,16,69,3,'Putter',9.91,'Penalty'),(9,16,69,6,'Wedge',12.11,'Hole'),(9,16,69,7,'3-Iron',9.91,'Fairway'),(9,16,69,8,'5-Wood',9.08,'Fairway'),(9,16,69,9,'2-Iron',13.63,'Hole'),(9,16,69,10,'3-Wood',12.11,'Hole'),(9,16,70,1,'7-Iron',10.82,'Fairway'),(9,16,70,2,'',9.92,'Fairway'),(9,16,70,3,'8-Iron',10.82,'Fairway'),(9,16,70,4,'8-Iron',13.22,'Hole'),(9,16,70,5,'5-Hybrid',10.82,'Penalty'),(9,16,70,6,'3-Iron',9.92,'Bunker'),(9,16,70,7,'5-Iron',11.90,'Fairway'),(9,16,70,8,'4-Iron',10.82,'Bunker'),(9,16,70,9,'5-Hybrid',13.22,'Fairway'),(9,16,71,1,'Putter',12.10,'Fairway'),(9,16,71,2,'7-Iron',11.00,'Fairway'),(9,16,71,3,'3-Iron',11.00,'Fairway'),(9,16,71,4,'3-Wood',12.10,'Fairway'),(9,16,71,7,'Putter',12.10,'Fairway'),(9,16,71,8,'2-Iron',12.10,'Fairway'),(9,16,71,9,'5-Wood',13.44,'Penalty'),(9,16,71,10,'Wedge',13.44,'Hole'),(9,16,72,1,'3-Wood',15.56,'Hole'),(9,16,72,2,'1-Iron',12.73,'Fairway'),(9,16,72,3,'9-Iron',15.56,'Hole'),(9,16,72,4,'Wedge',15.56,'Fairway'),(9,16,72,5,'5-Iron',12.73,'Fairway'),(9,16,72,6,'7-Iron',15.56,'Hole'),(9,16,72,7,'3-Hybrid',14.00,'Fairway'),(9,16,72,8,'2-Iron',15.56,'Hole'),(9,16,72,9,'Driver',14.00,'Bunker'),(9,16,72,10,'Wedge',12.73,'Fairway'),(9,17,73,1,'9-Iron',46.55,'Bunker'),(9,17,73,2,'1-Iron',42.67,'Fairway'),(9,17,73,3,'3-Hybrid',46.55,'Fairway'),(9,17,73,6,'5-Hybrid',51.20,'Bunker'),(9,17,73,7,'3-Wood',42.67,'Penalty'),(9,17,73,8,'',51.20,'Fairway'),(9,17,74,1,'',16.55,'Fairway'),(9,17,74,3,'4-Hybrid',16.55,'Fairway'),(9,17,74,6,'7-Iron',18.20,'Fairway'),(9,17,74,7,'Putter',18.20,'Fairway'),(9,17,74,8,'5-Wood',18.20,'Fairway'),(9,17,74,9,'9-Iron',0.00,'Penalty'),(9,17,75,1,'8-Iron',9.89,'Bunker'),(9,17,75,2,'Wedge',8.09,'Fairway'),(9,17,75,3,'5-Iron',8.09,'Fairway'),(9,17,75,4,'7-Iron',9.89,'Fairway'),(9,17,75,5,'Putter',8.90,'Fairway'),(9,17,75,6,'Putter',9.89,'Hole'),(9,17,75,8,'Putter',8.09,'Penalty'),(9,17,75,9,'4-Iron',9.89,'Hole'),(9,17,76,1,'7-Iron',7.18,'Fairway'),(9,17,76,2,'3-Hybrid',7.90,'Fairway'),(9,17,76,3,'5-Iron',7.90,'Fairway'),(9,17,76,4,'4-Hybrid',7.18,'Fairway'),(9,17,76,6,'5-Iron',6.58,'Fairway'),(9,17,76,7,'3-Hybrid',7.90,'Bunker'),(9,17,76,8,'8-Iron',6.58,'Fairway'),(9,17,76,9,'5-Wood',7.18,'Fairway'),(9,17,76,10,'5-Hybrid',8.78,'Hole'),(9,17,77,3,'4-Hybrid',8.00,'Fairway'),(9,17,77,4,'1-Iron',7.27,'Fairway'),(9,17,77,5,'5-Wood',8.00,'Bunker'),(9,17,77,6,'3-Hybrid',8.00,'Fairway'),(9,17,77,7,'7-Iron',7.27,'Bunker'),(9,17,77,8,'Wedge',8.89,'Hole'),(9,17,77,10,'1-Iron',7.27,'Bunker'),(9,17,78,1,'3-Wood',8.00,'Fairway'),(9,17,78,2,'5-Wood',8.00,'Fairway'),(9,17,78,3,'Wedge',8.00,'Bunker'),(9,17,78,4,'3-Hybrid',8.80,'Fairway'),(9,17,78,5,'Wedge',9.78,'Hole'),(9,17,78,6,'9-Iron',9.78,'Hole'),(9,17,78,7,'8-Iron',8.80,'Fairway'),(9,17,78,10,'3-Iron',8.00,'Bunker'),(9,17,79,2,'3-Hybrid',8.60,'Fairway'),(9,17,79,3,'3-Hybrid',7.82,'Fairway'),(9,17,79,9,'3-Wood',10.75,'Bunker'),(9,17,79,10,'Wedge',7.82,'Fairway'),(9,17,80,1,'5-Iron',7.00,'Fairway'),(9,17,80,2,'9-Iron',7.64,'Bunker'),(9,17,80,3,'5-Wood',7.64,'Fairway'),(9,17,80,4,'2-Iron',7.64,'Bunker'),(9,17,80,6,'2-Iron',7.64,'Fairway'),(9,17,80,8,'Putter',12.00,'Hole'),(9,17,80,10,'6-Iron',9.33,'Fairway'),(9,17,81,1,'3-Iron',10.00,'Fairway'),(9,17,81,2,'2-Iron',0.00,'Penalty'),(9,17,81,3,'Putter',8.18,'Penalty'),(9,17,81,4,'3-Hybrid',8.18,'Fairway'),(9,17,81,5,'4-Hybrid',0.00,'Penalty'),(9,17,81,6,'3-Iron',8.18,'Fairway'),(9,17,81,7,'5-Iron',8.18,'Fairway'),(9,17,81,8,'6-Iron',10.00,'Bunker'),(9,17,81,9,'9-Iron',8.18,'Bunker'),(9,17,81,10,'4-Iron',7.50,'Fairway'),(9,17,82,1,'',9.00,'Penalty'),(9,17,82,3,'Putter',0.00,'Penalty'),(9,17,82,6,'5-Wood',9.90,'Fairway'),(9,17,82,7,'5-Iron',9.90,'Fairway'),(9,17,82,8,'3-Wood',12.38,'Hole'),(9,17,82,9,'8-Iron',9.00,'Fairway'),(9,17,83,2,'3-Wood',5.83,'Penalty'),(9,17,83,3,'6-Iron',7.00,'Penalty'),(9,17,83,4,'3-Wood',7.00,'Fairway'),(9,17,83,5,'',6.36,'Bunker'),(9,17,83,6,'Wedge',7.78,'Fairway'),(9,17,83,9,'2-Iron',7.00,'Fairway'),(9,17,84,2,'4-Iron',8.11,'Hole'),(9,17,84,5,'5-Wood',7.30,'Fairway'),(9,17,84,6,'3-Iron',0.00,'Penalty'),(9,17,84,7,'9-Iron',6.64,'Bunker'),(9,17,84,8,'Wedge',6.64,'Fairway'),(9,17,84,9,'9-Iron',7.30,'Bunker'),(9,17,84,10,'3-Iron',6.64,'Fairway'),(9,17,85,2,'4-Hybrid',8.60,'Bunker'),(9,17,85,4,'7-Iron',7.82,'Fairway'),(9,17,85,7,'3-Iron',8.60,'Bunker'),(9,17,85,8,'9-Iron',7.82,'Bunker'),(9,17,86,2,'Putter',10.00,'Fairway'),(9,17,86,5,'5-Hybrid',12.22,'Hole'),(9,17,86,6,'8-Iron',11.00,'Fairway'),(9,17,86,7,'3-Iron',12.22,'Hole'),(9,17,86,8,'3-Hybrid',10.00,'Bunker'),(9,17,86,9,'5-Iron',12.22,'Hole'),(9,17,87,1,'5-Iron',14.88,'Hole'),(9,17,87,2,'9-Iron',10.82,'Penalty'),(9,17,87,3,'3-Wood',14.88,'Bunker'),(9,17,87,4,'5-Hybrid',11.90,'Fairway'),(9,17,87,5,'3-Iron',10.82,'Bunker'),(9,17,87,6,'5-Hybrid',9.92,'Fairway'),(9,17,87,7,'4-Hybrid',11.90,'Fairway'),(9,17,87,8,'2-Iron',10.82,'Fairway'),(9,17,87,9,'3-Iron',10.82,'Fairway'),(9,17,88,2,'4-Hybrid',11.18,'Fairway'),(9,17,88,3,'4-Hybrid',11.18,'Penalty'),(9,17,88,4,'8-Iron',12.30,'Bunker'),(9,17,88,5,'2-Iron',11.18,'Fairway'),(9,17,88,6,'5-Wood',10.25,'Bunker'),(9,17,88,7,'3-Wood',11.18,'Bunker'),(9,17,88,8,'Putter',10.25,'Penalty'),(9,17,88,10,'Wedge',17.57,'Hole'),(9,17,89,1,'3-Iron',15.56,'Hole'),(9,17,89,2,'3-Wood',12.73,'Fairway'),(9,17,89,4,'8-Iron',0.00,'Penalty'),(9,17,89,5,'3-Wood',15.56,'Hole'),(9,17,89,7,'',15.56,'Fairway'),(9,17,89,8,'4-Hybrid',12.73,'Fairway'),(9,17,89,9,'2-Iron',12.73,'Fairway'),(9,17,89,10,'4-Hybrid',11.67,'Bunker'),(9,17,90,2,'7-Iron',14.55,'Bunker'),(9,17,90,3,'7-Iron',14.55,'Fairway'),(9,17,90,6,'7-Iron',17.78,'Bunker'),(9,17,90,7,'6-Iron',16.00,'Fairway'),(9,17,90,8,'4-Iron',14.55,'Bunker'),(9,17,90,9,'2-Iron',14.55,'Fairway'),(9,18,73,1,'3-Iron',56.89,'Fairway'),(9,18,73,2,'4-Iron',51.20,'Fairway'),(9,18,73,3,'7-Iron',46.55,'Fairway'),(9,18,73,5,'3-Wood',42.67,'Bunker'),(9,18,73,8,'3-Wood',56.89,'Fairway'),(9,18,73,9,'2-Iron',51.20,'Bunker'),(9,18,74,1,'3-Wood',16.55,'Fairway'),(9,18,74,2,'Putter',16.55,'Fairway'),(9,18,74,3,'6-Iron',0.00,'Penalty'),(9,18,74,5,'Wedge',16.55,'Bunker'),(9,18,74,7,'6-Iron',16.55,'Bunker'),(9,18,74,8,'6-Iron',16.55,'Bunker'),(9,18,74,9,'4-Hybrid',16.55,'Fairway'),(9,18,75,3,'Driver',9.89,'Fairway'),(9,18,75,5,'3-Iron',11.13,'Hole'),(9,18,75,6,'5-Wood',8.09,'Fairway'),(9,18,75,7,'1-Iron',8.09,'Fairway'),(9,18,75,8,'',8.09,'Bunker'),(9,18,75,9,'Putter',9.89,'Hole'),(9,18,75,10,'3-Iron',9.89,'Hole'),(9,18,76,3,'4-Iron',8.78,'Fairway'),(9,18,76,5,'Driver',7.18,'Fairway'),(9,18,76,6,'Driver',7.18,'Fairway'),(9,18,76,7,'5-Iron',7.90,'Fairway'),(9,18,76,10,'2-Iron',7.18,'Fairway'),(9,18,77,1,'7-Iron',6.67,'Fairway'),(9,18,77,2,'8-Iron',7.27,'Fairway'),(9,18,77,4,'6-Iron',8.00,'Fairway'),(9,18,77,5,'Wedge',8.00,'Fairway'),(9,18,77,6,'5-Iron',6.67,'Fairway'),(9,18,77,7,'8-Iron',7.27,'Bunker'),(9,18,77,9,'7-Iron',7.27,'Fairway'),(9,18,77,10,'1-Iron',7.27,'Bunker'),(9,18,78,1,'3-Wood',9.78,'Bunker'),(9,18,78,2,'3-Iron',8.80,'Fairway'),(9,18,78,7,'3-Iron',9.78,'Hole'),(9,18,78,8,'5-Hybrid',8.00,'Bunker'),(9,18,78,9,'3-Iron',8.00,'Bunker'),(9,18,78,10,'Wedge',8.00,'Bunker'),(9,18,79,1,'6-Iron',10.75,'Fairway'),(9,18,79,4,'8-Iron',7.17,'Fairway'),(9,18,79,6,'3-Wood',7.17,'Penalty'),(9,18,79,7,'5-Wood',8.60,'Bunker'),(9,18,79,8,'3-Wood',8.60,'Fairway'),(9,18,79,9,'5-Iron',7.82,'Bunker'),(9,18,79,10,'3-Hybrid',7.82,'Bunker'),(9,18,80,1,'3-Hybrid',7.64,'Fairway'),(9,18,80,2,'8-Iron',10.50,'Hole'),(9,18,80,3,'4-Iron',8.40,'Fairway'),(9,18,80,4,'4-Iron',7.64,'Bunker'),(9,18,80,5,'6-Iron',0.00,'Penalty'),(9,18,80,6,'Wedge',9.33,'Hole'),(9,18,80,7,'6-Iron',8.40,'Fairway'),(9,18,80,8,'5-Wood',7.64,'Fairway'),(9,18,80,10,'9-Iron',7.64,'Fairway'),(9,18,81,1,'Putter',8.18,'Fairway'),(9,18,81,4,'Putter',9.00,'Fairway'),(9,18,81,5,'4-Hybrid',0.00,'Penalty'),(9,18,81,6,'3-Hybrid',11.25,'Hole'),(9,18,81,7,'4-Iron',9.00,'Fairway'),(9,18,81,8,'4-Hybrid',10.00,'Hole'),(9,18,81,10,'8-Iron',8.18,'Fairway'),(9,18,82,3,'3-Wood',9.00,'Fairway'),(9,18,82,4,'6-Iron',9.90,'Penalty'),(9,18,82,7,'5-Wood',9.00,'Fairway'),(9,18,82,8,'5-Iron',11.00,'Bunker'),(9,18,82,9,'Putter',9.90,'Bunker'),(9,18,83,2,'4-Hybrid',7.00,'Bunker'),(9,18,83,3,'5-Wood',6.36,'Fairway'),(9,18,83,4,'9-Iron',7.78,'Hole'),(9,18,83,7,'2-Iron',6.36,'Fairway'),(9,18,83,9,'6-Iron',7.78,'Fairway'),(9,18,84,1,'5-Iron',8.11,'Fairway'),(9,18,84,2,'9-Iron',6.64,'Fairway'),(9,18,84,3,'Wedge',6.64,'Fairway'),(9,18,84,6,'3-Hybrid',8.11,'Hole'),(9,18,84,8,'3-Wood',7.30,'Fairway'),(9,18,84,10,'7-Iron',6.08,'Fairway'),(9,18,85,2,'8-Iron',9.56,'Hole'),(9,18,85,3,'8-Iron',0.00,'Penalty'),(9,18,85,5,'1-Iron',7.17,'Fairway'),(9,18,85,6,'Wedge',8.60,'Fairway'),(9,18,85,8,'3-Hybrid',7.82,'Fairway'),(9,18,85,10,'3-Wood',9.56,'Hole'),(9,18,86,1,'',11.00,'Fairway'),(9,18,86,2,'8-Iron',12.22,'Penalty'),(9,18,86,4,'1-Iron',10.00,'Fairway'),(9,18,86,5,'7-Iron',12.22,'Hole'),(9,18,86,6,'3-Wood',10.00,'Fairway'),(9,18,86,8,'Putter',0.00,'Penalty'),(9,18,86,9,'3-Hybrid',0.00,'Penalty'),(9,18,87,1,'5-Hybrid',11.90,'Fairway'),(9,18,87,2,'6-Iron',11.90,'Fairway'),(9,18,87,3,'',17.00,'Hole'),(9,18,87,4,'6-Iron',10.82,'Bunker'),(9,18,87,6,'7-Iron',13.22,'Hole'),(9,18,87,7,'3-Wood',11.90,'Fairway'),(9,18,87,8,'5-Iron',11.90,'Fairway'),(9,18,87,10,'6-Iron',10.82,'Fairway'),(9,18,88,1,'4-Hybrid',0.00,'Penalty'),(9,18,88,2,'3-Wood',12.30,'Fairway'),(9,18,88,3,'Wedge',11.18,'Bunker'),(9,18,88,4,'9-Iron',12.30,'Bunker'),(9,18,88,5,'4-Hybrid',12.30,'Bunker'),(9,18,88,6,'2-Iron',13.67,'Hole'),(9,18,88,7,'3-Hybrid',10.25,'Fairway'),(9,18,88,8,'8-Iron',13.67,'Hole'),(9,18,88,9,'4-Iron',11.18,'Fairway'),(9,18,88,10,'',12.30,'Bunker'),(9,18,89,2,'9-Iron',12.73,'Fairway'),(9,18,89,3,'Putter',17.50,'Hole'),(9,18,89,5,'Wedge',12.73,'Penalty'),(9,18,89,6,'Putter',17.50,'Hole'),(9,18,89,7,'',12.73,'Fairway'),(9,18,90,1,'4-Hybrid',13.33,'Fairway'),(9,18,90,2,'Putter',14.55,'Fairway'),(9,18,90,3,'5-Hybrid',14.55,'Fairway'),(9,18,90,4,'Putter',17.78,'Hole'),(9,18,90,5,'Driver',14.55,'Fairway'),(9,18,90,7,'Wedge',17.78,'Hole'),(9,18,90,8,'4-Iron',16.00,'Fairway'),(9,18,90,9,'2-Iron',16.00,'Bunker'),(9,18,90,10,'8-Iron',14.55,'Fairway'),(9,19,73,1,'4-Iron',56.89,'Hole'),(9,19,73,2,'4-Iron',56.89,'Fairway'),(9,19,73,4,'4-Hybrid',56.89,'Hole'),(9,19,73,5,'5-Wood',46.55,'Fairway'),(9,19,73,7,'6-Iron',51.20,'Fairway'),(9,19,73,8,'4-Hybrid',46.55,'Penalty'),(9,19,73,9,'Putter',46.55,'Penalty'),(9,19,73,10,'3-Iron',51.20,'Fairway'),(9,19,74,1,'5-Wood',22.75,'Hole'),(9,19,74,2,'3-Iron',18.20,'Fairway'),(9,19,74,3,'6-Iron',20.22,'Hole'),(9,19,74,5,'3-Iron',20.22,'Fairway'),(9,19,74,7,'2-Iron',16.55,'Fairway'),(9,19,74,8,'5-Wood',18.20,'Bunker'),(9,19,75,1,'Driver',8.90,'Fairway'),(9,19,75,2,'Driver',0.00,'Penalty'),(9,19,75,5,'8-Iron',8.09,'Fairway'),(9,19,75,6,'6-Iron',8.90,'Fairway'),(9,19,75,8,'',9.89,'Fairway'),(9,19,75,10,'5-Hybrid',8.09,'Fairway'),(9,19,76,2,'4-Iron',6.58,'Fairway'),(9,19,76,3,'Wedge',8.78,'Fairway'),(9,19,76,4,'Putter',8.78,'Penalty'),(9,19,76,5,'2-Iron',7.18,'Fairway'),(9,19,76,7,'2-Iron',7.90,'Penalty'),(9,19,76,8,'4-Hybrid',7.18,'Bunker'),(9,19,76,9,'Putter',7.18,'Fairway'),(9,19,77,2,'Wedge',8.89,'Hole'),(9,19,77,3,'7-Iron',6.67,'Penalty'),(9,19,77,4,'9-Iron',7.27,'Fairway'),(9,19,77,5,'5-Iron',7.27,'Fairway'),(9,19,77,6,'5-Iron',6.67,'Fairway'),(9,19,77,7,'3-Wood',7.27,'Fairway'),(9,19,77,8,'5-Iron',8.00,'Fairway'),(9,19,77,9,'5-Wood',8.89,'Hole'),(9,19,78,1,'Wedge',9.78,'Hole'),(9,19,78,4,'5-Iron',8.80,'Fairway'),(9,19,78,6,'1-Iron',8.00,'Fairway'),(9,19,78,7,'7-Iron',7.33,'Fairway'),(9,19,78,8,'Wedge',9.78,'Hole'),(9,19,78,10,'3-Iron',8.00,'Fairway'),(9,19,79,1,'5-Wood',9.56,'Hole'),(9,19,79,3,'8-Iron',8.60,'Penalty'),(9,19,79,4,'4-Hybrid',7.82,'Bunker'),(9,19,79,7,'5-Hybrid',8.60,'Bunker'),(9,19,79,8,'5-Iron',7.82,'Fairway'),(9,19,79,9,'7-Iron',7.82,'Bunker'),(9,19,80,2,'3-Hybrid',7.64,'Bunker'),(9,19,80,3,'2-Iron',7.64,'Bunker'),(9,19,80,6,'5-Hybrid',7.00,'Fairway'),(9,19,80,7,'8-Iron',8.40,'Penalty'),(9,19,80,8,'4-Hybrid',7.64,'Fairway'),(9,19,80,10,'5-Iron',7.64,'Fairway'),(9,19,81,1,'2-Iron',7.50,'Fairway'),(9,19,81,2,'Driver',10.00,'Hole'),(9,19,81,3,'3-Wood',9.00,'Fairway'),(9,19,81,4,'7-Iron',7.50,'Fairway'),(9,19,81,5,'Putter',8.18,'Fairway'),(9,19,81,6,'Driver',9.00,'Fairway'),(9,19,81,7,'5-Wood',9.00,'Fairway'),(9,19,81,8,'8-Iron',8.18,'Fairway'),(9,19,81,10,'5-Hybrid',11.25,'Hole'),(9,19,82,3,'Wedge',9.90,'Bunker'),(9,19,82,5,'Putter',0.00,'Penalty'),(9,19,82,8,'3-Iron',9.00,'Fairway'),(9,19,82,9,'9-Iron',12.38,'Hole'),(9,19,82,10,'5-Hybrid',9.90,'Bunker'),(9,19,83,1,'',6.36,'Bunker'),(9,19,83,2,'9-Iron',0.00,'Penalty'),(9,19,83,3,'4-Hybrid',6.36,'Fairway'),(9,19,83,4,'4-Iron',0.00,'Penalty'),(9,19,83,5,'8-Iron',7.78,'Hole'),(9,19,83,6,'8-Iron',5.83,'Fairway'),(9,19,83,7,'Wedge',7.00,'Bunker'),(9,19,83,8,'5-Iron',7.78,'Bunker'),(9,19,83,9,'5-Hybrid',5.83,'Fairway'),(9,19,83,10,'7-Iron',7.00,'Fairway'),(9,19,84,2,'2-Iron',6.64,'Fairway'),(9,19,84,3,'8-Iron',8.11,'Hole'),(9,19,84,4,'',6.64,'Fairway'),(9,19,84,5,'3-Iron',6.08,'Fairway'),(9,19,84,8,'5-Wood',8.11,'Hole'),(9,19,84,9,'8-Iron',8.11,'Hole'),(9,19,85,4,'4-Hybrid',7.82,'Bunker'),(9,19,85,5,'5-Wood',9.56,'Hole'),(9,19,85,6,'3-Iron',8.60,'Bunker'),(9,19,85,8,'3-Hybrid',7.82,'Bunker'),(9,19,85,10,'9-Iron',7.17,'Bunker'),(9,19,86,1,'7-Iron',10.00,'Bunker'),(9,19,86,2,'8-Iron',11.00,'Bunker'),(9,19,86,3,'1-Iron',13.75,'Hole'),(9,19,86,4,'3-Iron',11.00,'Bunker'),(9,19,86,5,'Putter',10.00,'Fairway'),(9,19,86,8,'1-Iron',11.00,'Penalty'),(9,19,86,10,'9-Iron',0.00,'Penalty'),(9,19,87,1,'Wedge',11.90,'Bunker'),(9,19,87,2,'4-Hybrid',14.88,'Hole'),(9,19,87,4,'Putter',11.90,'Fairway'),(9,19,87,5,'7-Iron',9.92,'Bunker'),(9,19,87,6,'Wedge',0.00,'Penalty'),(9,19,87,7,'Wedge',11.90,'Fairway'),(9,19,88,2,'7-Iron',12.30,'Fairway'),(9,19,88,4,'',13.67,'Fairway'),(9,19,88,5,'5-Wood',12.30,'Fairway'),(9,19,88,7,'3-Wood',13.67,'Hole'),(9,19,88,8,'6-Iron',10.25,'Fairway'),(9,19,88,9,'5-Hybrid',11.18,'Bunker'),(9,19,88,10,'3-Wood',11.18,'Bunker'),(9,19,89,2,'5-Hybrid',12.73,'Penalty'),(9,19,89,4,'9-Iron',14.00,'Fairway'),(9,19,89,5,'4-Iron',12.73,'Fairway'),(9,19,89,6,'3-Wood',17.50,'Hole'),(9,19,89,7,'4-Iron',15.56,'Fairway'),(9,19,89,8,'9-Iron',15.56,'Hole'),(9,19,89,9,'8-Iron',14.00,'Fairway'),(9,19,90,1,'4-Iron',14.55,'Bunker'),(9,19,90,2,'3-Iron',16.00,'Fairway'),(9,19,90,5,'2-Iron',14.55,'Bunker'),(9,19,90,6,'9-Iron',13.33,'Bunker'),(9,19,90,7,'9-Iron',16.00,'Fairway'),(9,19,90,8,'5-Hybrid',16.00,'Fairway'),(9,19,90,9,'5-Hybrid',14.55,'Fairway'),(9,19,90,10,'3-Wood',17.78,'Hole'),(9,20,73,1,'6-Iron',42.67,'Bunker'),(9,20,73,2,'3-Hybrid',56.89,'Hole'),(9,20,73,3,'6-Iron',46.55,'Penalty'),(9,20,73,4,'',42.67,'Fairway'),(9,20,73,5,'7-Iron',51.20,'Fairway'),(9,20,73,6,'4-Hybrid',56.89,'Hole'),(9,20,73,7,'3-Wood',46.55,'Fairway'),(9,20,73,8,'4-Hybrid',42.67,'Bunker'),(9,20,73,9,'Wedge',46.55,'Bunker'),(9,20,73,10,'7-Iron',56.89,'Hole'),(9,20,74,2,'',15.17,'Bunker'),(9,20,74,3,'5-Hybrid',16.55,'Fairway'),(9,20,74,4,'2-Iron',20.22,'Bunker'),(9,20,74,5,'',16.55,'Fairway'),(9,20,74,6,'4-Hybrid',16.55,'Bunker'),(9,20,74,8,'9-Iron',20.22,'Hole'),(9,20,74,9,'4-Hybrid',20.22,'Fairway'),(9,20,75,1,'',8.90,'Fairway'),(9,20,75,2,'4-Iron',8.90,'Fairway'),(9,20,75,4,'Wedge',0.00,'Penalty'),(9,20,75,5,'Wedge',8.09,'Fairway'),(9,20,75,6,'',9.89,'Hole'),(9,20,75,7,'8-Iron',8.09,'Penalty'),(9,20,75,8,'5-Hybrid',9.89,'Hole'),(9,20,75,9,'6-Iron',8.90,'Fairway'),(9,20,75,10,'4-Iron',8.09,'Fairway'),(9,20,76,1,'4-Hybrid',8.78,'Hole'),(9,20,76,2,'3-Wood',7.90,'Bunker'),(9,20,76,3,'3-Iron',7.18,'Bunker'),(9,20,76,4,'Wedge',7.18,'Bunker'),(9,20,76,5,'9-Iron',7.18,'Fairway'),(9,20,76,7,'5-Hybrid',7.18,'Fairway'),(9,20,76,8,'1-Iron',8.78,'Hole'),(9,20,76,9,'1-Iron',8.78,'Hole'),(9,20,77,1,'2-Iron',8.00,'Bunker'),(9,20,77,2,'4-Iron',7.27,'Fairway'),(9,20,77,3,'1-Iron',8.00,'Fairway'),(9,20,77,4,'2-Iron',0.00,'Penalty'),(9,20,77,5,'Wedge',8.00,'Bunker'),(9,20,77,7,'5-Hybrid',7.27,'Fairway'),(9,20,77,8,'2-Iron',7.27,'Fairway'),(9,20,77,10,'5-Wood',7.27,'Bunker'),(9,20,78,2,'5-Iron',8.80,'Penalty'),(9,20,78,3,'3-Iron',9.78,'Hole'),(9,20,78,4,'3-Hybrid',9.78,'Hole'),(9,20,78,5,'6-Iron',7.33,'Fairway'),(9,20,78,6,'5-Wood',8.80,'Bunker'),(9,20,78,8,'Driver',7.33,'Fairway'),(9,20,78,9,'5-Hybrid',11.00,'Hole'),(9,20,78,10,'3-Wood',7.33,'Bunker'),(9,20,79,1,'7-Iron',8.60,'Fairway'),(9,20,79,3,'3-Iron',7.82,'Fairway'),(9,20,79,5,'',7.82,'Fairway'),(9,20,79,6,'6-Iron',8.60,'Bunker'),(9,20,79,7,'',7.17,'Fairway'),(9,20,79,8,'2-Iron',7.82,'Fairway'),(9,20,79,9,'1-Iron',0.00,'Penalty'),(9,20,80,1,'3-Wood',9.33,'Hole'),(9,20,80,3,'4-Iron',7.64,'Fairway'),(9,20,80,4,'4-Hybrid',7.64,'Fairway'),(9,20,80,5,'9-Iron',8.40,'Fairway'),(9,20,80,6,'5-Hybrid',8.40,'Fairway'),(9,20,80,9,'Wedge',7.00,'Fairway'),(9,20,81,1,'Driver',10.00,'Hole'),(9,20,81,4,'3-Wood',8.18,'Fairway'),(9,20,81,5,'2-Iron',10.00,'Bunker'),(9,20,81,6,'6-Iron',8.18,'Bunker'),(9,20,81,7,'3-Hybrid',0.00,'Penalty'),(9,20,81,9,'3-Wood',7.50,'Bunker'),(9,20,81,10,'7-Iron',9.00,'Bunker'),(9,20,82,1,'8-Iron',9.00,'Bunker'),(9,20,82,2,'5-Hybrid',9.00,'Fairway'),(9,20,82,3,'2-Iron',11.00,'Fairway'),(9,20,82,4,'3-Hybrid',9.90,'Fairway'),(9,20,82,6,'6-Iron',9.90,'Bunker'),(9,20,82,7,'5-Hybrid',12.38,'Hole'),(9,20,82,8,'Wedge',9.90,'Fairway'),(9,20,82,9,'9-Iron',9.00,'Fairway'),(9,20,82,10,'3-Hybrid',11.00,'Fairway'),(9,20,83,1,'3-Iron',7.00,'Fairway'),(9,20,83,2,'2-Iron',7.00,'Fairway'),(9,20,83,4,'2-Iron',0.00,'Penalty'),(9,20,83,5,'5-Hybrid',6.36,'Fairway'),(9,20,83,6,'1-Iron',6.36,'Fairway'),(9,20,83,7,'6-Iron',7.78,'Hole'),(9,20,83,8,'Driver',7.00,'Fairway'),(9,20,83,10,'2-Iron',7.78,'Hole'),(9,20,84,2,'5-Iron',0.00,'Penalty'),(9,20,84,3,'8-Iron',6.08,'Bunker'),(9,20,84,4,'6-Iron',8.11,'Hole'),(9,20,84,5,'9-Iron',6.64,'Bunker'),(9,20,84,6,'Wedge',6.64,'Bunker'),(9,20,84,7,'5-Hybrid',6.64,'Fairway'),(9,20,84,8,'5-Hybrid',6.64,'Fairway'),(9,20,84,9,'5-Iron',6.64,'Fairway'),(9,20,84,10,'2-Iron',6.64,'Fairway'),(9,20,85,1,'4-Hybrid',8.60,'Fairway'),(9,20,85,2,'9-Iron',7.82,'Fairway'),(9,20,85,3,'1-Iron',9.56,'Hole'),(9,20,85,5,'3-Iron',8.60,'Penalty'),(9,20,85,6,'6-Iron',7.82,'Fairway'),(9,20,85,7,'3-Hybrid',7.82,'Fairway'),(9,20,85,8,'5-Iron',9.56,'Hole'),(9,20,85,9,'3-Iron',8.60,'Bunker'),(9,20,85,10,'1-Iron',8.60,'Fairway'),(9,20,86,1,'5-Iron',11.00,'Fairway'),(9,20,86,2,'5-Iron',9.17,'Fairway'),(9,20,86,3,'Wedge',11.00,'Bunker'),(9,20,86,4,'3-Wood',10.00,'Fairway'),(9,20,86,6,'Putter',9.17,'Fairway'),(9,20,86,7,'2-Iron',12.22,'Fairway'),(9,20,86,8,'Driver',10.00,'Fairway'),(9,20,86,9,'5-Hybrid',10.00,'Fairway'),(9,20,87,2,'Putter',11.90,'Fairway'),(9,20,87,3,'7-Iron',10.82,'Penalty'),(9,20,87,4,'Driver',10.82,'Fairway'),(9,20,87,5,'5-Hybrid',11.90,'Fairway'),(9,20,87,6,'3-Iron',11.90,'Fairway'),(9,20,87,7,'5-Iron',10.82,'Fairway'),(9,20,87,8,'4-Hybrid',10.82,'Fairway'),(9,20,87,9,'3-Iron',14.88,'Hole'),(9,20,87,10,'4-Hybrid',10.82,'Fairway'),(9,20,88,2,'5-Iron',12.30,'Bunker'),(9,20,88,4,'5-Iron',10.25,'Fairway'),(9,20,88,5,'4-Iron',11.18,'Fairway'),(9,20,88,6,'2-Iron',10.25,'Fairway'),(9,20,88,7,'1-Iron',11.18,'Fairway'),(9,20,88,8,'3-Iron',11.18,'Bunker'),(9,20,88,9,'3-Hybrid',11.18,'Bunker'),(9,20,88,10,'4-Iron',0.00,'Penalty'),(9,20,89,2,'7-Iron',12.73,'Fairway'),(9,20,89,3,'',12.73,'Bunker'),(9,20,89,4,'5-Hybrid',14.00,'Penalty'),(9,20,89,5,'7-Iron',12.73,'Bunker'),(9,20,89,6,'8-Iron',15.56,'Hole'),(9,20,89,7,'3-Hybrid',15.56,'Hole'),(9,20,89,8,'6-Iron',14.00,'Fairway'),(9,20,89,9,'3-Wood',12.73,'Bunker'),(9,20,89,10,'3-Hybrid',0.00,'Penalty'),(9,20,90,1,'5-Hybrid',16.00,'Fairway'),(9,20,90,2,'',14.55,'Fairway'),(9,20,90,3,'3-Iron',13.33,'Fairway'),(9,20,90,4,'2-Iron',0.00,'Penalty'),(9,20,90,6,'8-Iron',16.00,'Fairway'),(9,20,90,7,'2-Iron',13.33,'Fairway'),(9,20,90,8,'9-Iron',16.00,'Fairway'),(9,20,90,9,'9-Iron',16.00,'Bunker'),(9,20,90,10,'Putter',14.55,'Fairway'),(10,1,1,1,'Putter',5.36,'Fairway'),(10,1,1,2,'Wedge',4.92,'Bunker'),(10,1,1,4,'8-Iron',0.00,'Penalty'),(10,1,1,5,'4-Iron',5.36,'Fairway'),(10,1,1,6,'4-Iron',5.90,'Fairway'),(10,1,1,8,'Wedge',5.90,'Fairway'),(10,1,2,1,'1-Iron',8.73,'Bunker'),(10,1,2,2,'5-Wood',8.00,'Bunker'),(10,1,2,4,'9-Iron',8.73,'Fairway'),(10,1,2,6,'Wedge',8.00,'Bunker'),(10,1,2,7,'5-Hybrid',8.73,'Fairway'),(10,1,2,8,'9-Iron',0.00,'Penalty'),(10,1,2,9,'9-Iron',9.60,'Hole'),(10,1,3,1,'2-Iron',10.20,'Hole'),(10,1,3,2,'Driver',9.27,'Bunker'),(10,1,3,3,'3-Iron',8.50,'Penalty'),(10,1,3,4,'8-Iron',10.20,'Hole'),(10,1,3,7,'4-Iron',10.20,'Hole'),(10,1,3,10,'2-Iron',10.20,'Bunker'),(10,1,4,1,'2-Iron',7.55,'Bunker'),(10,1,4,2,'5-Hybrid',0.00,'Penalty'),(10,1,4,3,'3-Hybrid',7.55,'Fairway'),(10,1,4,4,'5-Wood',7.55,'Bunker'),(10,1,4,6,'Wedge',8.30,'Bunker'),(10,1,4,7,'Driver',8.30,'Hole'),(10,1,4,8,'Putter',7.55,'Fairway'),(10,1,4,9,'3-Hybrid',7.55,'Fairway'),(10,1,4,10,'Putter',7.55,'Fairway'),(10,1,5,2,'6-Iron',6.27,'Fairway'),(10,1,5,3,'4-Iron',6.27,'Fairway'),(10,1,5,4,'7-Iron',7.67,'Hole'),(10,1,5,6,'',6.90,'Hole'),(10,1,5,7,'8-Iron',7.67,'Bunker'),(10,1,5,8,'2-Iron',6.90,'Bunker'),(10,1,6,1,'3-Hybrid',4.83,'Bunker'),(10,1,6,4,'1-Iron',6.44,'Hole'),(10,1,6,5,'7-Iron',5.27,'Fairway'),(10,1,6,7,'',5.27,'Bunker'),(10,1,6,9,'5-Hybrid',6.44,'Hole'),(10,1,7,2,'Driver',8.50,'Bunker'),(10,1,7,4,'Putter',7.73,'Bunker'),(10,1,7,5,'5-Hybrid',8.50,'Bunker'),(10,1,7,7,'4-Iron',8.50,'Hole'),(10,1,7,9,'Putter',7.73,'Fairway'),(10,1,8,1,'Driver',7.82,'Bunker'),(10,1,8,3,'8-Iron',7.82,'Fairway'),(10,1,8,8,'3-Wood',7.82,'Fairway'),(10,1,8,9,'1-Iron',7.82,'Fairway'),(10,1,8,10,'5-Wood',7.82,'Fairway'),(10,1,9,1,'3-Wood',5.80,'Fairway'),(10,1,9,2,'3-Hybrid',5.80,'Fairway'),(10,1,9,3,'5-Iron',5.27,'Bunker'),(10,1,9,4,'3-Iron',5.80,'Hole'),(10,1,9,5,'Putter',5.27,'Fairway'),(10,1,9,10,'3-Iron',5.80,'Fairway'),(10,1,10,1,'3-Iron',5.45,'Fairway'),(10,1,10,3,'5-Hybrid',6.00,'Bunker'),(10,1,10,5,'3-Wood',5.45,'Fairway'),(10,1,10,6,'4-Hybrid',6.00,'Hole'),(10,1,10,8,'3-Hybrid',6.00,'Fairway'),(10,1,10,10,'3-Wood',5.00,'Fairway'),(10,1,11,1,'6-Iron',9.67,'Hole'),(10,1,11,2,'4-Iron',7.25,'Fairway'),(10,1,11,7,'4-Iron',7.91,'Fairway'),(10,1,11,9,'7-Iron',7.91,'Fairway'),(10,1,12,3,'5-Wood',7.80,'Hole'),(10,1,12,4,'5-Wood',8.67,'Hole'),(10,1,12,8,'9-Iron',7.09,'Fairway'),(10,1,12,9,'3-Wood',7.09,'Fairway'),(10,1,12,10,'6-Iron',6.50,'Fairway'),(10,1,13,1,'2-Iron',8.91,'Fairway'),(10,1,13,5,'2-Iron',9.80,'Hole'),(10,1,13,6,'Wedge',9.80,'Hole'),(10,1,13,10,'4-Hybrid',8.91,'Bunker'),(10,1,14,1,'3-Wood',9.09,'Fairway'),(10,1,14,2,'2-Iron',11.11,'Hole'),(10,1,14,3,'6-Iron',0.00,'Penalty'),(10,1,14,4,'Driver',10.00,'Hole'),(10,1,14,8,'8-Iron',10.00,'Bunker'),(10,1,15,1,'9-Iron',8.83,'Bunker'),(10,1,15,2,'2-Iron',9.64,'Fairway'),(10,1,15,3,'9-Iron',9.64,'Bunker'),(10,1,15,4,'Putter',8.83,'Fairway'),(10,1,15,5,'9-Iron',9.64,'Fairway'),(10,1,15,6,'3-Iron',9.64,'Fairway'),(10,1,15,8,'5-Iron',9.64,'Fairway'),(10,1,15,9,'3-Hybrid',11.78,'Fairway'),(10,1,16,2,'7-Iron',9.90,'Fairway'),(10,1,16,6,'3-Hybrid',9.00,'Bunker'),(10,1,16,8,'3-Wood',8.25,'Fairway'),(10,1,16,9,'5-Wood',9.00,'Fairway'),(10,1,16,10,'8-Iron',9.00,'Fairway'),(10,1,17,1,'5-Iron',9.00,'Fairway'),(10,1,17,2,'Putter',10.80,'Hole'),(10,1,17,3,'Putter',0.00,'Penalty'),(10,1,17,5,'9-Iron',12.00,'Hole'),(10,1,17,6,'3-Iron',9.82,'Fairway'),(10,1,17,9,'6-Iron',10.80,'Fairway'),(10,1,17,10,'5-Iron',9.82,'Fairway'),(10,1,18,2,'5-Hybrid',13.00,'Hole'),(10,1,18,3,'5-Wood',13.00,'Bunker'),(10,1,18,5,'3-Hybrid',11.82,'Fairway'),(10,1,18,7,'9-Iron',11.82,'Bunker'),(10,1,18,9,'9-Iron',10.83,'Fairway'),(10,1,18,10,'5-Hybrid',13.00,'Hole'),(10,2,1,1,'2-Iron',6.56,'Hole'),(10,2,1,7,'2-Iron',5.36,'Bunker'),(10,2,1,8,'9-Iron',5.36,'Fairway'),(10,2,1,9,'',5.90,'Hole'),(10,2,2,1,'Wedge',10.67,'Hole'),(10,2,2,2,'4-Hybrid',0.00,'Penalty'),(10,2,2,3,'7-Iron',9.60,'Hole'),(10,2,2,4,'4-Iron',9.60,'Hole'),(10,2,2,5,'7-Iron',9.60,'Hole'),(10,2,2,6,'4-Hybrid',8.73,'Bunker'),(10,2,2,7,'7-Iron',10.67,'Hole'),(10,2,2,10,'6-Iron',8.73,'Fairway'),(10,2,3,2,'9-Iron',9.27,'Fairway'),(10,2,3,3,'Wedge',9.27,'Fairway'),(10,2,3,7,'1-Iron',9.27,'Bunker'),(10,2,3,9,'5-Iron',9.27,'Bunker'),(10,2,3,10,'6-Iron',8.50,'Fairway'),(10,2,4,1,'3-Wood',8.30,'Hole'),(10,2,4,2,'4-Hybrid',8.30,'Hole'),(10,2,4,3,'2-Iron',7.55,'Penalty'),(10,2,4,4,'3-Wood',6.92,'Fairway'),(10,2,4,5,'3-Hybrid',7.55,'Fairway'),(10,2,4,6,'7-Iron',6.92,'Fairway'),(10,2,4,7,'8-Iron',7.55,'Fairway'),(10,2,4,8,'3-Wood',8.30,'Fairway'),(10,2,4,9,'3-Hybrid',6.92,'Bunker'),(10,2,5,1,'6-Iron',6.90,'Fairway'),(10,2,5,2,'3-Hybrid',6.27,'Bunker'),(10,2,5,3,'2-Iron',6.90,'Fairway'),(10,2,5,4,'1-Iron',5.75,'Fairway'),(10,2,5,7,'4-Iron',6.90,'Hole'),(10,2,5,9,'Wedge',0.00,'Penalty'),(10,2,5,10,'2-Iron',6.90,'Hole'),(10,2,6,1,'',5.27,'Bunker'),(10,2,6,3,'9-Iron',6.44,'Hole'),(10,2,6,6,'9-Iron',5.27,'Fairway'),(10,2,6,9,'4-Iron',0.00,'Penalty'),(10,2,7,2,'3-Iron',8.50,'Hole'),(10,2,7,4,'4-Hybrid',7.73,'Fairway'),(10,2,7,6,'3-Wood',7.08,'Fairway'),(10,2,7,9,'1-Iron',7.73,'Fairway'),(10,2,7,10,'5-Wood',7.73,'Fairway'),(10,2,8,2,'Driver',7.82,'Fairway'),(10,2,8,3,'3-Hybrid',7.17,'Fairway'),(10,2,8,4,'6-Iron',7.82,'Fairway'),(10,2,8,7,'2-Iron',8.60,'Hole'),(10,2,8,8,'3-Wood',0.00,'Penalty'),(10,2,8,9,'Wedge',7.82,'Bunker'),(10,2,8,10,'5-Hybrid',9.56,'Hole'),(10,2,9,1,'8-Iron',5.80,'Hole'),(10,2,9,2,'2-Iron',5.80,'Hole'),(10,2,9,4,'3-Hybrid',5.80,'Fairway'),(10,2,9,5,'6-Iron',5.27,'Fairway'),(10,2,9,6,'1-Iron',5.27,'Fairway'),(10,2,9,8,'4-Iron',5.27,'Bunker'),(10,2,9,9,'4-Hybrid',5.27,'Bunker'),(10,2,10,1,'3-Hybrid',5.45,'Fairway'),(10,2,10,3,'7-Iron',5.00,'Bunker'),(10,2,10,5,'5-Iron',6.00,'Hole'),(10,2,10,6,'6-Iron',5.00,'Bunker'),(10,2,10,7,'4-Hybrid',6.67,'Hole'),(10,2,10,8,'5-Iron',6.67,'Hole'),(10,2,10,10,'7-Iron',6.67,'Hole'),(10,2,11,1,'9-Iron',8.70,'Hole'),(10,2,11,2,'7-Iron',7.25,'Bunker'),(10,2,11,3,'2-Iron',8.70,'Hole'),(10,2,11,4,'9-Iron',0.00,'Penalty'),(10,2,11,5,'4-Iron',7.91,'Fairway'),(10,2,11,6,'Driver',0.00,'Penalty'),(10,2,11,7,'3-Wood',7.91,'Fairway'),(10,2,11,8,'Wedge',8.70,'Fairway'),(10,2,11,9,'',9.67,'Hole'),(10,2,11,10,'5-Wood',8.70,'Hole'),(10,2,12,1,'7-Iron',7.09,'Fairway'),(10,2,12,2,'4-Iron',7.09,'Bunker'),(10,2,12,6,'5-Wood',0.00,'Penalty'),(10,2,12,8,'4-Iron',8.67,'Hole'),(10,2,12,10,'Putter',7.09,'Penalty'),(10,2,13,2,'Driver',8.91,'Fairway'),(10,2,13,3,'5-Wood',8.91,'Penalty'),(10,2,13,5,'Wedge',8.91,'Fairway'),(10,2,13,6,'2-Iron',8.91,'Fairway'),(10,2,13,7,'7-Iron',9.80,'Hole'),(10,2,13,8,'8-Iron',10.89,'Fairway'),(10,2,13,10,'5-Wood',10.89,'Hole'),(10,2,14,5,'9-Iron',9.09,'Bunker'),(10,2,14,6,'5-Hybrid',0.00,'Penalty'),(10,2,14,7,'4-Iron',9.09,'Fairway'),(10,2,14,8,'2-Iron',9.09,'Bunker'),(10,2,14,9,'2-Iron',9.09,'Fairway'),(10,2,15,2,'3-Hybrid',9.64,'Bunker'),(10,2,15,4,'Putter',10.60,'Hole'),(10,2,15,5,'1-Iron',9.64,'Bunker'),(10,2,15,6,'3-Wood',11.78,'Bunker'),(10,2,15,7,'Driver',10.60,'Fairway'),(10,2,15,8,'7-Iron',10.60,'Hole'),(10,2,15,9,'9-Iron',8.83,'Fairway'),(10,2,16,1,'8-Iron',8.25,'Fairway'),(10,2,16,2,'9-Iron',9.00,'Penalty'),(10,2,16,3,'5-Wood',9.90,'Bunker'),(10,2,16,6,'5-Hybrid',9.00,'Fairway'),(10,2,16,7,'5-Hybrid',9.90,'Fairway'),(10,2,16,9,'Putter',11.00,'Hole'),(10,2,17,1,'Putter',12.00,'Hole'),(10,2,17,3,'5-Iron',9.82,'Bunker'),(10,2,17,8,'5-Wood',9.00,'Penalty'),(10,2,17,9,'Putter',9.82,'Fairway'),(10,2,18,1,'3-Hybrid',13.00,'Hole'),(10,2,18,2,'Putter',0.00,'Penalty'),(10,2,18,3,'3-Hybrid',14.44,'Hole'),(10,2,18,6,'6-Iron',11.82,'Bunker'),(10,2,18,7,'Wedge',13.00,'Hole'),(10,2,18,8,'6-Iron',13.00,'Hole'),(10,3,1,3,'5-Wood',4.92,'Fairway'),(10,3,1,5,'3-Wood',6.56,'Hole'),(10,3,1,9,'5-Iron',0.00,'Penalty'),(10,3,1,10,'5-Hybrid',4.92,'Fairway'),(10,3,2,1,'Driver',9.60,'Hole'),(10,3,2,3,'Wedge',8.00,'Bunker'),(10,3,2,4,'7-Iron',9.60,'Bunker'),(10,3,2,6,'Putter',8.73,'Bunker'),(10,3,2,7,'4-Hybrid',8.73,'Bunker'),(10,3,3,2,'1-Iron',9.27,'Fairway'),(10,3,3,3,'3-Hybrid',9.27,'Bunker'),(10,3,3,4,'3-Iron',10.20,'Hole'),(10,3,3,5,'5-Hybrid',9.27,'Bunker'),(10,3,3,7,'5-Iron',9.27,'Fairway'),(10,3,3,8,'3-Wood',9.27,'Fairway'),(10,3,3,9,'5-Iron',9.27,'Fairway'),(10,3,3,10,'Wedge',10.20,'Hole'),(10,3,4,1,'3-Iron',7.55,'Fairway'),(10,3,4,3,'3-Hybrid',8.30,'Hole'),(10,3,4,4,'4-Iron',7.55,'Penalty'),(10,3,4,5,'4-Iron',0.00,'Penalty'),(10,3,4,6,'Wedge',9.22,'Hole'),(10,3,4,7,'2-Iron',7.55,'Bunker'),(10,3,4,10,'4-Hybrid',7.55,'Fairway'),(10,3,5,1,'',6.27,'Bunker'),(10,3,5,4,'5-Hybrid',8.63,'Hole'),(10,3,5,5,'3-Iron',6.90,'Fairway'),(10,3,5,8,'Putter',6.27,'Fairway'),(10,3,6,1,'9-Iron',4.83,'Bunker'),(10,3,7,1,'5-Hybrid',7.73,'Fairway'),(10,3,7,2,'3-Hybrid',7.73,'Bunker'),(10,3,7,5,'4-Hybrid',8.50,'Bunker'),(10,3,7,6,'6-Iron',7.73,'Fairway'),(10,3,7,7,'5-Hybrid',7.73,'Fairway'),(10,3,7,9,'7-Iron',8.50,'Hole'),(10,3,8,3,'7-Iron',7.82,'Bunker'),(10,3,8,4,'4-Iron',7.82,'Bunker'),(10,3,8,5,'9-Iron',7.17,'Fairway'),(10,3,8,6,'5-Hybrid',8.60,'Fairway'),(10,3,8,7,'Putter',8.60,'Hole'),(10,3,8,9,'1-Iron',8.60,'Fairway'),(10,3,8,10,'5-Wood',8.60,'Hole'),(10,3,9,1,'3-Iron',5.80,'Hole'),(10,3,9,4,'5-Wood',5.80,'Hole'),(10,3,9,5,'Wedge',4.83,'Penalty'),(10,3,9,7,'Putter',5.27,'Fairway'),(10,3,9,8,'4-Iron',5.27,'Bunker'),(10,3,10,5,'5-Hybrid',6.00,'Fairway'),(10,3,10,6,'3-Wood',0.00,'Penalty'),(10,3,10,9,'2-Iron',5.45,'Fairway'),(10,3,10,10,'Wedge',6.67,'Hole'),(10,3,11,3,'4-Iron',9.67,'Bunker'),(10,3,11,4,'8-Iron',7.91,'Fairway'),(10,3,11,6,'Wedge',7.91,'Fairway'),(10,3,11,8,'3-Iron',9.67,'Hole'),(10,3,11,9,'9-Iron',7.91,'Fairway'),(10,3,11,10,'3-Wood',9.67,'Hole'),(10,3,12,3,'1-Iron',7.80,'Hole'),(10,3,12,4,'Putter',7.09,'Fairway'),(10,3,12,6,'Putter',7.80,'Hole'),(10,3,12,7,'2-Iron',7.09,'Bunker'),(10,3,12,8,'5-Wood',7.80,'Fairway'),(10,3,13,1,'',8.91,'Fairway'),(10,3,13,2,'8-Iron',8.91,'Fairway'),(10,3,13,3,'3-Iron',8.91,'Fairway'),(10,3,13,4,'5-Hybrid',8.91,'Fairway'),(10,3,13,5,'2-Iron',8.17,'Fairway'),(10,3,13,7,'Putter',9.80,'Bunker'),(10,3,13,8,'5-Iron',9.80,'Hole'),(10,3,13,9,'3-Wood',8.91,'Fairway'),(10,3,14,1,'4-Hybrid',8.33,'Fairway'),(10,3,14,3,'1-Iron',0.00,'Penalty'),(10,3,14,4,'3-Hybrid',9.09,'Fairway'),(10,3,14,6,'4-Hybrid',8.33,'Bunker'),(10,3,14,7,'9-Iron',9.09,'Fairway'),(10,3,14,8,'7-Iron',11.11,'Hole'),(10,3,14,9,'8-Iron',10.00,'Fairway'),(10,3,15,1,'3-Iron',9.64,'Fairway'),(10,3,15,4,'4-Iron',9.64,'Fairway'),(10,3,15,5,'9-Iron',9.64,'Fairway'),(10,3,15,6,'Putter',9.64,'Fairway'),(10,3,15,8,'5-Iron',9.64,'Fairway'),(10,3,15,9,'4-Iron',8.83,'Penalty'),(10,3,16,1,'4-Hybrid',9.00,'Fairway'),(10,3,16,7,'4-Hybrid',9.90,'Hole'),(10,3,16,8,'Driver',9.90,'Fairway'),(10,3,17,1,'4-Hybrid',9.82,'Fairway'),(10,3,17,2,'8-Iron',10.80,'Hole'),(10,3,17,3,'5-Wood',9.82,'Fairway'),(10,3,17,6,'9-Iron',9.82,'Fairway'),(10,3,17,9,'3-Wood',9.82,'Bunker'),(10,3,17,10,'3-Wood',10.80,'Hole'),(10,3,18,4,'3-Hybrid',11.82,'Bunker'),(10,3,18,5,'Wedge',11.82,'Fairway'),(10,3,18,7,'1-Iron',11.82,'Fairway'),(10,3,18,8,'2-Iron',11.82,'Bunker'),(10,3,18,9,'Putter',11.82,'Penalty'),(10,3,18,10,'2-Iron',0.00,'Penalty'),(10,4,1,2,'7-Iron',5.36,'Bunker'),(10,4,1,8,'4-Hybrid',5.36,'Fairway'),(10,4,1,10,'Wedge',5.36,'Penalty'),(10,4,2,1,'3-Hybrid',8.73,'Bunker'),(10,4,2,3,'Wedge',8.00,'Bunker'),(10,4,2,4,'Driver',9.60,'Fairway'),(10,4,2,5,'3-Wood',9.60,'Fairway'),(10,4,2,6,'9-Iron',8.00,'Fairway'),(10,4,2,7,'1-Iron',8.73,'Bunker'),(10,4,2,8,'Driver',9.60,'Hole'),(10,4,2,9,'2-Iron',8.73,'Bunker'),(10,4,3,1,'5-Wood',9.27,'Fairway'),(10,4,3,3,'7-Iron',10.20,'Hole'),(10,4,3,6,'1-Iron',9.27,'Fairway'),(10,4,3,7,'5-Hybrid',9.27,'Fairway'),(10,4,3,8,'3-Hybrid',11.33,'Fairway'),(10,4,4,2,'8-Iron',0.00,'Penalty'),(10,4,4,3,'3-Hybrid',8.30,'Fairway'),(10,4,4,4,'Wedge',7.55,'Bunker'),(10,4,4,8,'2-Iron',6.92,'Fairway'),(10,4,4,9,'3-Wood',8.30,'Fairway'),(10,4,4,10,'9-Iron',8.30,'Hole'),(10,4,5,2,'8-Iron',6.90,'Fairway'),(10,4,5,5,'4-Iron',6.27,'Bunker'),(10,4,5,7,'3-Hybrid',6.90,'Hole'),(10,4,5,8,'5-Wood',6.90,'Hole'),(10,4,6,1,'3-Hybrid',4.83,'Fairway'),(10,4,6,2,'Putter',4.83,'Bunker'),(10,4,6,3,'2-Iron',5.80,'Fairway'),(10,4,6,4,'4-Hybrid',5.80,'Hole'),(10,4,6,6,'8-Iron',5.27,'Fairway'),(10,4,6,9,'7-Iron',5.80,'Bunker'),(10,4,7,2,'5-Hybrid',8.50,'Hole'),(10,4,7,3,'1-Iron',7.73,'Bunker'),(10,4,7,5,'3-Wood',8.50,'Hole'),(10,4,7,6,'4-Iron',9.44,'Hole'),(10,4,7,7,'2-Iron',7.73,'Fairway'),(10,4,7,8,'5-Iron',9.44,'Hole'),(10,4,7,9,'',7.73,'Fairway'),(10,4,7,10,'5-Iron',8.50,'Bunker'),(10,4,8,3,'3-Iron',8.60,'Hole'),(10,4,8,4,'1-Iron',7.82,'Fairway'),(10,4,8,5,'1-Iron',0.00,'Penalty'),(10,4,8,6,'Driver',7.82,'Penalty'),(10,4,8,7,'5-Iron',8.60,'Hole'),(10,4,8,8,'3-Iron',7.17,'Fairway'),(10,4,8,9,'4-Hybrid',7.82,'Fairway'),(10,4,8,10,'3-Hybrid',7.17,'Bunker'),(10,4,9,2,'9-Iron',5.27,'Fairway'),(10,4,9,4,'3-Wood',5.80,'Hole'),(10,4,9,5,'8-Iron',5.80,'Hole'),(10,4,9,7,'9-Iron',5.27,'Bunker'),(10,4,9,9,'3-Hybrid',5.27,'Fairway'),(10,4,10,2,'3-Hybrid',6.00,'Hole'),(10,4,10,4,'8-Iron',6.00,'Hole'),(10,4,10,5,'5-Hybrid',6.67,'Hole'),(10,4,10,6,'4-Hybrid',5.00,'Fairway'),(10,4,10,8,'7-Iron',5.00,'Bunker'),(10,4,11,2,'8-Iron',7.91,'Fairway'),(10,4,11,6,'Putter',7.91,'Bunker'),(10,4,11,10,'Putter',8.70,'Hole'),(10,4,12,1,'3-Hybrid',7.80,'Hole'),(10,4,12,2,'2-Iron',7.09,'Fairway'),(10,4,12,3,'7-Iron',7.09,'Fairway'),(10,4,12,4,'4-Iron',7.09,'Fairway'),(10,4,12,5,'Driver',7.09,'Bunker'),(10,4,12,7,'3-Iron',7.80,'Hole'),(10,4,12,10,'4-Hybrid',7.80,'Hole'),(10,4,13,1,'4-Hybrid',0.00,'Penalty'),(10,4,13,2,'8-Iron',8.91,'Fairway'),(10,4,13,3,'3-Wood',9.80,'Hole'),(10,4,13,4,'2-Iron',9.80,'Hole'),(10,4,13,8,'6-Iron',9.80,'Hole'),(10,4,14,1,'5-Hybrid',9.09,'Fairway'),(10,4,14,4,'5-Wood',10.00,'Hole'),(10,4,14,7,'9-Iron',8.33,'Fairway'),(10,4,14,8,'6-Iron',9.09,'Fairway'),(10,4,14,10,'9-Iron',10.00,'Hole'),(10,4,15,1,'3-Iron',10.60,'Hole'),(10,4,15,4,'3-Wood',10.60,'Hole'),(10,4,15,6,'Wedge',9.64,'Fairway'),(10,4,16,2,'9-Iron',9.90,'Fairway'),(10,4,16,4,'Wedge',8.25,'Fairway'),(10,4,16,6,'4-Iron',9.90,'Hole'),(10,4,17,1,'2-Iron',9.82,'Fairway'),(10,4,17,2,'8-Iron',10.80,'Hole'),(10,4,17,4,'',10.80,'Hole'),(10,4,17,6,'Putter',9.82,'Bunker'),(10,4,17,7,'Wedge',10.80,'Fairway'),(10,4,17,8,'7-Iron',9.82,'Fairway'),(10,4,17,9,'5-Hybrid',9.82,'Fairway'),(10,4,18,1,'8-Iron',11.82,'Fairway'),(10,4,18,5,'3-Iron',0.00,'Penalty'),(10,4,18,7,'8-Iron',11.82,'Fairway'),(10,4,18,8,'6-Iron',13.00,'Bunker'),(10,4,18,9,'Putter',14.44,'Hole'),(10,4,18,10,'9-Iron',11.82,'Bunker'),(10,5,19,5,'Putter',6.20,'Hole'),(10,5,19,6,'2-Iron',5.64,'Fairway'),(10,5,19,7,'5-Iron',5.64,'Fairway'),(10,5,19,8,'7-Iron',5.64,'Bunker'),(10,5,19,9,'9-Iron',6.20,'Hole'),(10,5,20,3,'3-Wood',8.00,'Fairway'),(10,5,20,4,'7-Iron',8.00,'Fairway'),(10,5,20,6,'3-Wood',9.78,'Hole'),(10,5,20,7,'Putter',7.33,'Fairway'),(10,5,20,8,'5-Wood',8.00,'Fairway'),(10,5,21,2,'4-Hybrid',8.40,'Bunker'),(10,5,21,3,'8-Iron',7.64,'Fairway'),(10,5,21,4,'8-Iron',8.40,'Bunker'),(10,5,21,5,'5-Wood',7.64,'Fairway'),(10,5,21,6,'6-Iron',7.64,'Fairway'),(10,5,21,8,'8-Iron',7.64,'Penalty'),(10,5,21,9,'3-Wood',0.00,'Penalty'),(10,5,22,1,'8-Iron',9.80,'Hole'),(10,5,22,4,'9-Iron',8.91,'Bunker'),(10,5,22,7,'9-Iron',9.80,'Fairway'),(10,5,22,9,'1-Iron',0.00,'Penalty'),(10,5,23,1,'5-Wood',10.00,'Hole'),(10,5,23,2,'Putter',9.09,'Bunker'),(10,5,23,3,'Putter',9.09,'Fairway'),(10,5,23,4,'6-Iron',10.00,'Fairway'),(10,5,23,6,'3-Hybrid',10.00,'Fairway'),(10,5,23,7,'3-Iron',9.09,'Bunker'),(10,5,23,9,'Putter',9.09,'Bunker'),(10,5,23,10,'5-Wood',9.09,'Bunker'),(10,5,24,1,'3-Wood',8.70,'Bunker'),(10,5,24,8,'3-Hybrid',8.70,'Hole'),(10,5,24,9,'3-Hybrid',0.00,'Penalty'),(10,5,24,10,'5-Iron',7.91,'Fairway'),(10,5,25,1,'4-Hybrid',7.82,'Fairway'),(10,5,25,4,'',7.82,'Fairway'),(10,5,25,5,'7-Iron',0.00,'Penalty'),(10,5,25,7,'3-Iron',7.17,'Fairway'),(10,5,25,8,'2-Iron',9.56,'Fairway'),(10,5,25,9,'5-Hybrid',8.60,'Fairway'),(10,5,25,10,'3-Wood',7.82,'Bunker'),(10,5,26,2,'Wedge',8.30,'Bunker'),(10,5,26,5,'Wedge',7.55,'Penalty'),(10,5,26,6,'5-Wood',9.22,'Hole'),(10,5,26,7,'5-Hybrid',7.55,'Fairway'),(10,5,26,8,'3-Wood',7.55,'Fairway'),(10,5,27,2,'5-Wood',7.73,'Fairway'),(10,5,27,4,'5-Iron',7.73,'Bunker'),(10,5,27,5,'4-Iron',7.73,'Fairway'),(10,5,27,8,'9-Iron',8.50,'Hole'),(10,5,28,1,'8-Iron',9.10,'Hole'),(10,5,28,4,'3-Wood',0.00,'Penalty'),(10,5,28,5,'3-Hybrid',10.11,'Hole'),(10,5,28,6,'6-Iron',9.10,'Hole'),(10,5,28,7,'5-Hybrid',9.10,'Bunker'),(10,5,29,1,'6-Iron',7.18,'Fairway'),(10,5,29,4,'2-Iron',7.18,'Fairway'),(10,5,29,6,'3-Hybrid',7.18,'Fairway'),(10,5,29,7,'3-Wood',0.00,'Penalty'),(10,5,29,9,'8-Iron',7.90,'Bunker'),(10,5,30,1,'5-Wood',0.00,'Penalty'),(10,5,30,7,'4-Iron',6.75,'Bunker'),(10,5,30,8,'1-Iron',7.36,'Penalty'),(10,5,31,1,'2-Iron',5.83,'Fairway'),(10,5,31,3,'7-Iron',6.36,'Fairway'),(10,5,31,4,'Driver',5.83,'Bunker'),(10,5,31,6,'Putter',6.36,'Penalty'),(10,5,31,8,'1-Iron',6.36,'Bunker'),(10,5,31,10,'Wedge',0.00,'Penalty'),(10,5,32,2,'5-Hybrid',8.27,'Bunker'),(10,5,32,3,'3-Hybrid',7.58,'Bunker'),(10,5,32,5,'5-Iron',8.27,'Fairway'),(10,5,32,10,'Putter',8.27,'Fairway'),(10,5,33,3,'Wedge',11.00,'Penalty'),(10,5,33,4,'5-Wood',11.00,'Bunker'),(10,5,33,5,'3-Hybrid',10.08,'Bunker'),(10,5,33,6,'7-Iron',11.00,'Fairway'),(10,5,33,8,'5-Wood',11.00,'Fairway'),(10,5,33,10,'8-Iron',11.00,'Bunker'),(10,5,34,1,'7-Iron',9.91,'Fairway'),(10,5,34,4,'4-Hybrid',9.91,'Fairway'),(10,5,34,5,'Wedge',10.90,'Fairway'),(10,5,34,10,'Wedge',10.90,'Hole'),(10,5,35,2,'9-Iron',10.91,'Fairway'),(10,5,35,4,'6-Iron',10.91,'Bunker'),(10,5,35,5,'3-Iron',10.91,'Bunker'),(10,5,35,7,'5-Hybrid',12.00,'Penalty'),(10,5,35,8,'',12.00,'Hole'),(10,5,35,9,'6-Iron',12.00,'Hole'),(10,5,35,10,'1-Iron',10.91,'Fairway'),(10,5,36,2,'3-Hybrid',13.64,'Fairway'),(10,5,36,3,'9-Iron',13.64,'Bunker'),(10,5,36,4,'Wedge',15.00,'Bunker'),(10,5,36,6,'7-Iron',15.00,'Hole'),(10,5,36,8,'Wedge',13.64,'Bunker'),(10,5,36,9,'9-Iron',15.00,'Hole'),(10,6,19,2,'3-Hybrid',6.89,'Hole'),(10,6,19,3,'7-Iron',5.64,'Fairway'),(10,6,19,5,'3-Wood',5.17,'Fairway'),(10,6,19,6,'',5.64,'Bunker'),(10,6,19,10,'Wedge',5.64,'Fairway'),(10,6,20,4,'8-Iron',8.00,'Bunker'),(10,6,20,6,'4-Iron',8.80,'Hole'),(10,6,21,2,'8-Iron',7.64,'Fairway'),(10,6,21,4,'1-Iron',7.64,'Fairway'),(10,6,21,5,'Putter',7.00,'Fairway'),(10,6,21,6,'4-Iron',8.40,'Bunker'),(10,6,21,10,'7-Iron',7.64,'Bunker'),(10,6,22,1,'8-Iron',8.91,'Fairway'),(10,6,22,2,'3-Hybrid',9.80,'Hole'),(10,6,22,3,'5-Hybrid',8.17,'Fairway'),(10,6,22,4,'3-Hybrid',8.91,'Bunker'),(10,6,22,5,'4-Iron',9.80,'Bunker'),(10,6,22,6,'3-Hybrid',0.00,'Penalty'),(10,6,22,7,'8-Iron',8.91,'Fairway'),(10,6,22,10,'5-Iron',9.80,'Fairway'),(10,6,23,2,'',10.00,'Hole'),(10,6,23,5,'5-Wood',8.33,'Fairway'),(10,6,23,6,'9-Iron',12.50,'Hole'),(10,6,23,7,'6-Iron',10.00,'Hole'),(10,6,23,8,'Wedge',9.09,'Fairway'),(10,6,23,9,'1-Iron',10.00,'Hole'),(10,6,24,1,'5-Iron',7.91,'Fairway'),(10,6,24,2,'3-Hybrid',7.25,'Fairway'),(10,6,24,6,'6-Iron',7.91,'Fairway'),(10,6,24,7,'',7.91,'Fairway'),(10,6,24,8,'3-Wood',8.70,'Hole'),(10,6,24,9,'Driver',7.91,'Fairway'),(10,6,25,1,'8-Iron',7.17,'Bunker'),(10,6,25,4,'Wedge',7.17,'Fairway'),(10,6,25,6,'1-Iron',7.17,'Penalty'),(10,6,25,10,'1-Iron',9.56,'Hole'),(10,6,26,1,'4-Iron',6.92,'Bunker'),(10,6,26,2,'5-Iron',9.22,'Fairway'),(10,6,26,4,'3-Wood',9.22,'Hole'),(10,6,26,5,'9-Iron',6.92,'Fairway'),(10,6,26,6,'3-Wood',9.22,'Hole'),(10,6,26,8,'5-Wood',9.22,'Hole'),(10,6,26,9,'5-Wood',8.30,'Hole'),(10,6,26,10,'1-Iron',7.55,'Fairway'),(10,6,27,1,'Putter',7.73,'Fairway'),(10,6,27,3,'6-Iron',7.08,'Bunker'),(10,6,27,4,'8-Iron',8.50,'Hole'),(10,6,27,6,'8-Iron',8.50,'Hole'),(10,6,27,10,'',9.44,'Hole'),(10,6,28,1,'1-Iron',8.27,'Penalty'),(10,6,28,6,'8-Iron',8.27,'Fairway'),(10,6,28,7,'Wedge',8.27,'Fairway'),(10,6,28,8,'5-Hybrid',8.27,'Fairway'),(10,6,28,9,'Wedge',8.27,'Fairway'),(10,6,28,10,'Wedge',8.27,'Fairway'),(10,6,29,6,'3-Iron',7.90,'Penalty'),(10,6,29,8,'8-Iron',7.90,'Hole'),(10,6,29,9,'5-Iron',9.88,'Hole'),(10,6,30,7,'',8.10,'Penalty'),(10,6,30,9,'4-Iron',6.75,'Bunker'),(10,6,30,10,'',7.36,'Bunker'),(10,6,31,2,'Putter',6.36,'Fairway'),(10,6,31,3,'5-Hybrid',7.00,'Hole'),(10,6,31,5,'3-Wood',0.00,'Penalty'),(10,6,31,6,'Wedge',6.36,'Fairway'),(10,6,31,7,'2-Iron',6.36,'Fairway'),(10,6,31,8,'3-Iron',0.00,'Penalty'),(10,6,31,9,'4-Iron',6.36,'Fairway'),(10,6,31,10,'4-Iron',6.36,'Fairway'),(10,6,32,2,'5-Iron',8.27,'Fairway'),(10,6,32,3,'6-Iron',7.58,'Fairway'),(10,6,32,4,'8-Iron',10.11,'Hole'),(10,6,32,5,'Wedge',9.10,'Fairway'),(10,6,32,6,'Putter',7.58,'Fairway'),(10,6,32,7,'3-Iron',10.11,'Fairway'),(10,6,32,8,'3-Hybrid',9.10,'Fairway'),(10,6,32,10,'7-Iron',7.58,'Fairway'),(10,6,33,2,'8-Iron',12.10,'Hole'),(10,6,33,4,'4-Hybrid',12.10,'Bunker'),(10,6,33,6,'3-Wood',10.08,'Fairway'),(10,6,33,7,'7-Iron',10.08,'Fairway'),(10,6,33,8,'2-Iron',11.00,'Bunker'),(10,6,33,9,'4-Hybrid',11.00,'Fairway'),(10,6,34,4,'4-Hybrid',12.11,'Hole'),(10,6,34,5,'5-Wood',10.90,'Hole'),(10,6,34,6,'Putter',10.90,'Fairway'),(10,6,34,7,'5-Iron',9.91,'Bunker'),(10,6,34,8,'4-Iron',12.11,'Hole'),(10,6,34,9,'3-Wood',10.90,'Fairway'),(10,6,34,10,'Driver',9.08,'Bunker'),(10,6,35,1,'5-Wood',12.00,'Fairway'),(10,6,35,3,'5-Hybrid',10.91,'Bunker'),(10,6,35,5,'5-Hybrid',12.00,'Hole'),(10,6,35,7,'9-Iron',10.91,'Fairway'),(10,6,35,8,'9-Iron',12.00,'Hole'),(10,6,35,9,'5-Iron',13.33,'Bunker'),(10,6,36,3,'4-Hybrid',13.64,'Bunker'),(10,6,36,4,'Putter',13.64,'Fairway'),(10,6,36,5,'3-Hybrid',13.64,'Bunker'),(10,7,19,1,'8-Iron',5.64,'Fairway'),(10,7,19,2,'3-Wood',6.89,'Bunker'),(10,7,19,3,'Driver',5.64,'Fairway'),(10,7,19,4,'2-Iron',5.64,'Fairway'),(10,7,19,5,'4-Hybrid',5.64,'Penalty'),(10,7,19,7,'3-Iron',6.20,'Bunker'),(10,7,19,10,'Putter',0.00,'Penalty'),(10,7,20,3,'',8.80,'Hole'),(10,7,20,6,'3-Hybrid',8.80,'Bunker'),(10,7,20,7,'Putter',8.00,'Bunker'),(10,7,21,1,'3-Hybrid',8.40,'Hole'),(10,7,21,2,'9-Iron',8.40,'Fairway'),(10,7,21,4,'3-Iron',7.64,'Bunker'),(10,7,21,5,'Driver',0.00,'Penalty'),(10,7,21,8,'5-Wood',7.64,'Fairway'),(10,7,21,9,'',7.64,'Fairway'),(10,7,21,10,'3-Iron',7.00,'Bunker'),(10,7,22,1,'6-Iron',9.80,'Hole'),(10,7,22,2,'3-Wood',9.80,'Hole'),(10,7,22,3,'Putter',10.89,'Hole'),(10,7,22,5,'6-Iron',10.89,'Bunker'),(10,7,22,6,'',10.89,'Hole'),(10,7,22,7,'',8.91,'Fairway'),(10,7,22,8,'3-Hybrid',8.91,'Fairway'),(10,7,22,10,'Putter',14.00,'Hole'),(10,7,23,1,'5-Wood',9.09,'Fairway'),(10,7,23,2,'Putter',8.33,'Bunker'),(10,7,23,3,'4-Iron',10.00,'Hole'),(10,7,23,4,'9-Iron',9.09,'Bunker'),(10,7,23,5,'2-Iron',9.09,'Fairway'),(10,7,23,6,'Putter',10.00,'Hole'),(10,7,23,8,'8-Iron',9.09,'Fairway'),(10,7,24,3,'4-Hybrid',7.91,'Fairway'),(10,7,24,5,'2-Iron',7.25,'Fairway'),(10,7,24,7,'Wedge',7.91,'Bunker'),(10,7,24,8,'7-Iron',7.91,'Fairway'),(10,7,25,2,'4-Iron',7.82,'Fairway'),(10,7,25,3,'Putter',7.82,'Fairway'),(10,7,25,4,'Putter',7.82,'Fairway'),(10,7,25,5,'7-Iron',7.82,'Bunker'),(10,7,25,8,'7-Iron',7.17,'Fairway'),(10,7,25,9,'3-Wood',8.60,'Hole'),(10,7,25,10,'5-Hybrid',7.82,'Fairway'),(10,7,26,2,'4-Hybrid',6.92,'Fairway'),(10,7,26,4,'3-Iron',8.30,'Hole'),(10,7,26,5,'7-Iron',6.92,'Fairway'),(10,7,26,6,'9-Iron',7.55,'Fairway'),(10,7,26,7,'9-Iron',9.22,'Hole'),(10,7,26,9,'2-Iron',8.30,'Fairway'),(10,7,27,2,'3-Iron',8.50,'Hole'),(10,7,27,3,'6-Iron',7.08,'Fairway'),(10,7,27,4,'Wedge',8.50,'Hole'),(10,7,27,5,'Wedge',8.50,'Fairway'),(10,7,27,6,'3-Iron',7.73,'Fairway'),(10,7,27,7,'',8.50,'Bunker'),(10,7,27,8,'5-Iron',7.08,'Fairway'),(10,7,27,10,'2-Iron',8.50,'Hole'),(10,7,28,1,'Wedge',10.11,'Hole'),(10,7,28,4,'5-Iron',9.10,'Hole'),(10,7,28,7,'1-Iron',9.10,'Fairway'),(10,7,28,8,'5-Iron',9.10,'Hole'),(10,7,29,4,'1-Iron',7.90,'Hole'),(10,7,29,7,'5-Wood',0.00,'Penalty'),(10,7,29,8,'6-Iron',7.90,'Fairway'),(10,7,29,9,'6-Iron',0.00,'Penalty'),(10,7,30,1,'2-Iron',0.00,'Penalty'),(10,7,30,2,'1-Iron',6.75,'Fairway'),(10,7,30,3,'9-Iron',8.10,'Hole'),(10,7,30,5,'2-Iron',8.10,'Penalty'),(10,7,30,6,'3-Hybrid',7.36,'Fairway'),(10,7,30,7,'5-Wood',8.10,'Hole'),(10,7,30,8,'5-Hybrid',8.10,'Fairway'),(10,7,30,9,'5-Hybrid',7.36,'Fairway'),(10,7,31,3,'6-Iron',0.00,'Penalty'),(10,7,31,4,'Putter',6.36,'Fairway'),(10,7,31,8,'3-Iron',7.00,'Hole'),(10,7,31,9,'6-Iron',7.78,'Hole'),(10,7,32,1,'3-Iron',9.10,'Bunker'),(10,7,32,2,'7-Iron',10.11,'Hole'),(10,7,32,5,'',7.58,'Bunker'),(10,7,32,6,'3-Hybrid',8.27,'Penalty'),(10,7,32,7,'3-Wood',8.27,'Fairway'),(10,7,32,10,'2-Iron',8.27,'Fairway'),(10,7,33,5,'6-Iron',13.44,'Hole'),(10,7,33,6,'4-Hybrid',11.00,'Fairway'),(10,7,33,9,'3-Wood',11.00,'Fairway'),(10,7,33,10,'8-Iron',12.10,'Fairway'),(10,7,34,1,'6-Iron',9.91,'Bunker'),(10,7,34,4,'4-Iron',9.91,'Fairway'),(10,7,34,9,'3-Iron',10.90,'Hole'),(10,7,35,1,'4-Iron',12.00,'Bunker'),(10,7,35,3,'2-Iron',10.91,'Bunker'),(10,7,35,5,'8-Iron',12.00,'Hole'),(10,7,35,6,'6-Iron',10.91,'Fairway'),(10,7,35,7,'5-Wood',12.00,'Fairway'),(10,7,35,8,'4-Hybrid',12.00,'Hole'),(10,7,35,9,'7-Iron',10.91,'Fairway'),(10,7,35,10,'8-Iron',10.91,'Bunker'),(10,7,36,1,'7-Iron',13.64,'Bunker'),(10,7,36,2,'8-Iron',13.64,'Fairway'),(10,7,36,4,'4-Hybrid',15.00,'Fairway'),(10,7,36,6,'8-Iron',13.64,'Fairway'),(10,7,36,7,'5-Hybrid',16.67,'Hole'),(10,7,36,8,'1-Iron',0.00,'Penalty'),(10,8,19,3,'5-Hybrid',5.17,'Fairway'),(10,8,19,4,'5-Iron',5.17,'Bunker'),(10,8,19,6,'3-Hybrid',5.64,'Bunker'),(10,8,20,1,'9-Iron',8.00,'Bunker'),(10,8,20,5,'9-Iron',0.00,'Penalty'),(10,8,20,6,'9-Iron',8.80,'Fairway'),(10,8,20,8,'8-Iron',8.80,'Hole'),(10,8,21,2,'Putter',8.40,'Hole'),(10,8,21,3,'5-Iron',8.40,'Fairway'),(10,8,21,4,'3-Hybrid',0.00,'Penalty'),(10,8,21,5,'3-Wood',7.64,'Fairway'),(10,8,21,6,'',7.64,'Bunker'),(10,8,21,7,'5-Wood',8.40,'Hole'),(10,8,21,9,'Putter',9.33,'Hole'),(10,8,21,10,'Putter',8.40,'Fairway'),(10,8,22,1,'6-Iron',0.00,'Penalty'),(10,8,22,2,'4-Hybrid',0.00,'Penalty'),(10,8,22,3,'8-Iron',9.80,'Hole'),(10,8,22,5,'1-Iron',9.80,'Hole'),(10,8,22,6,'4-Iron',8.91,'Penalty'),(10,8,22,7,'Driver',8.17,'Fairway'),(10,8,22,8,'6-Iron',8.91,'Bunker'),(10,8,22,10,'4-Iron',9.80,'Hole'),(10,8,23,4,'8-Iron',9.09,'Fairway'),(10,8,23,5,'9-Iron',10.00,'Hole'),(10,8,23,6,'5-Wood',10.00,'Fairway'),(10,8,23,7,'4-Iron',8.33,'Bunker'),(10,8,23,9,'5-Iron',10.00,'Fairway'),(10,8,24,2,'Driver',7.91,'Fairway'),(10,8,24,3,'3-Iron',7.91,'Bunker'),(10,8,24,5,'6-Iron',7.91,'Fairway'),(10,8,24,6,'6-Iron',7.91,'Penalty'),(10,8,24,7,'Putter',7.91,'Fairway'),(10,8,24,8,'5-Hybrid',8.70,'Hole'),(10,8,24,9,'Putter',7.25,'Fairway'),(10,8,25,2,'3-Iron',7.17,'Fairway'),(10,8,25,3,'5-Wood',8.60,'Hole'),(10,8,25,5,'Driver',8.60,'Hole'),(10,8,26,1,'7-Iron',7.55,'Fairway'),(10,8,26,2,'3-Iron',0.00,'Penalty'),(10,8,26,4,'6-Iron',7.55,'Bunker'),(10,8,26,5,'6-Iron',6.92,'Bunker'),(10,8,26,6,'3-Iron',7.55,'Fairway'),(10,8,26,7,'7-Iron',7.55,'Bunker'),(10,8,26,9,'7-Iron',8.30,'Hole'),(10,8,26,10,'',8.30,'Hole'),(10,8,27,1,'Wedge',7.08,'Bunker'),(10,8,27,5,'9-Iron',7.73,'Bunker'),(10,8,27,7,'7-Iron',7.08,'Fairway'),(10,8,27,8,'5-Iron',0.00,'Penalty'),(10,8,28,2,'3-Hybrid',10.11,'Hole'),(10,8,28,3,'1-Iron',8.27,'Fairway'),(10,8,28,4,'5-Hybrid',7.58,'Fairway'),(10,8,28,5,'9-Iron',8.27,'Fairway'),(10,8,28,6,'3-Hybrid',8.27,'Fairway'),(10,8,28,7,'3-Hybrid',8.27,'Fairway'),(10,8,28,9,'Putter',9.10,'Hole'),(10,8,29,1,'5-Iron',7.18,'Bunker'),(10,8,29,2,'5-Iron',0.00,'Penalty'),(10,8,29,3,'Wedge',7.90,'Hole'),(10,8,29,5,'3-Iron',7.18,'Fairway'),(10,8,29,6,'4-Iron',7.90,'Hole'),(10,8,29,10,'5-Wood',7.90,'Hole'),(10,8,30,1,'9-Iron',10.13,'Hole'),(10,8,30,2,'Putter',8.10,'Hole'),(10,8,30,5,'9-Iron',7.36,'Fairway'),(10,8,30,9,'1-Iron',6.75,'Fairway'),(10,8,30,10,'2-Iron',6.75,'Bunker'),(10,8,31,2,'Wedge',5.83,'Fairway'),(10,8,31,4,'7-Iron',6.36,'Fairway'),(10,8,31,5,'4-Iron',6.36,'Bunker'),(10,8,31,6,'4-Iron',5.83,'Fairway'),(10,8,31,7,'7-Iron',7.00,'Hole'),(10,8,31,8,'7-Iron',0.00,'Penalty'),(10,8,32,1,'8-Iron',8.27,'Fairway'),(10,8,32,7,'3-Wood',8.27,'Fairway'),(10,8,32,8,'5-Wood',9.10,'Fairway'),(10,8,32,9,'7-Iron',10.11,'Hole'),(10,8,32,10,'3-Hybrid',0.00,'Penalty'),(10,8,33,2,'5-Wood',10.08,'Bunker'),(10,8,33,4,'3-Iron',13.44,'Hole'),(10,8,33,5,'5-Hybrid',10.08,'Fairway'),(10,8,33,9,'6-Iron',11.00,'Fairway'),(10,8,33,10,'9-Iron',11.00,'Bunker'),(10,8,34,2,'5-Iron',9.08,'Fairway'),(10,8,34,3,'5-Hybrid',12.11,'Hole'),(10,8,34,4,'5-Iron',9.91,'Bunker'),(10,8,34,5,'5-Iron',9.91,'Fairway'),(10,8,34,6,'7-Iron',9.91,'Bunker'),(10,8,34,7,'5-Iron',9.91,'Fairway'),(10,8,34,8,'5-Wood',9.91,'Fairway'),(10,8,35,1,'1-Iron',12.00,'Fairway'),(10,8,35,2,'3-Wood',12.00,'Hole'),(10,8,35,5,'4-Hybrid',12.00,'Bunker'),(10,8,35,6,'5-Hybrid',10.00,'Bunker'),(10,8,35,8,'5-Hybrid',12.00,'Bunker'),(10,8,35,9,'7-Iron',12.00,'Bunker'),(10,8,35,10,'Putter',12.00,'Hole'),(10,8,36,1,'5-Hybrid',16.67,'Hole'),(10,8,36,2,'Putter',12.50,'Bunker'),(10,8,36,4,'5-Wood',13.64,'Bunker'),(10,8,36,9,'Putter',12.50,'Fairway'),(10,9,37,1,'5-Iron',5.83,'Bunker'),(10,9,37,3,'Wedge',6.36,'Bunker'),(10,9,37,5,'8-Iron',6.36,'Bunker'),(10,9,37,6,'6-Iron',6.36,'Fairway'),(10,9,37,7,'9-Iron',6.36,'Fairway'),(10,9,37,8,'3-Iron',6.36,'Fairway'),(10,9,37,9,'7-Iron',6.36,'Fairway'),(10,9,38,1,'5-Hybrid',6.18,'Fairway'),(10,9,38,2,'5-Wood',6.18,'Bunker'),(10,9,38,3,'5-Wood',5.67,'Fairway'),(10,9,38,4,'8-Iron',6.18,'Bunker'),(10,9,38,5,'7-Iron',6.18,'Fairway'),(10,9,38,8,'2-Iron',8.50,'Hole'),(10,9,38,9,'1-Iron',6.80,'Fairway'),(10,9,38,10,'3-Iron',5.67,'Fairway'),(10,9,39,1,'9-Iron',5.91,'Fairway'),(10,9,39,3,'4-Iron',6.50,'Bunker'),(10,9,39,4,'Putter',5.91,'Fairway'),(10,9,39,6,'4-Hybrid',5.91,'Penalty'),(10,9,40,1,'5-Hybrid',6.00,'Fairway'),(10,9,40,3,'Wedge',6.60,'Hole'),(10,9,40,4,'5-Iron',7.33,'Hole'),(10,9,40,5,'4-Hybrid',0.00,'Penalty'),(10,9,40,10,'7-Iron',6.60,'Penalty'),(10,9,41,1,'6-Iron',6.90,'Bunker'),(10,9,41,2,'5-Wood',6.27,'Fairway'),(10,9,41,3,'3-Wood',5.75,'Fairway'),(10,9,41,4,'Wedge',6.90,'Hole'),(10,9,41,5,'9-Iron',6.27,'Bunker'),(10,9,41,6,'3-Wood',6.27,'Fairway'),(10,9,41,9,'3-Iron',7.67,'Hole'),(10,9,41,10,'Putter',6.90,'Bunker'),(10,9,42,2,'5-Iron',6.00,'Fairway'),(10,9,42,3,'9-Iron',5.00,'Fairway'),(10,9,42,4,'5-Wood',5.45,'Fairway'),(10,9,42,6,'8-Iron',5.45,'Fairway'),(10,9,42,10,'Putter',5.45,'Penalty'),(10,9,43,1,'Wedge',7.09,'Fairway'),(10,9,43,2,'5-Wood',7.80,'Hole'),(10,9,43,5,'5-Hybrid',8.67,'Hole'),(10,9,43,8,'7-Iron',7.80,'Fairway'),(10,9,44,1,'4-Hybrid',7.90,'Bunker'),(10,9,44,5,'5-Wood',8.78,'Hole'),(10,9,44,6,'9-Iron',7.90,'Fairway'),(10,9,44,7,'3-Hybrid',7.18,'Fairway'),(10,9,44,8,'5-Hybrid',8.78,'Hole'),(10,9,44,9,'Putter',7.90,'Hole'),(10,9,45,3,'4-Iron',8.73,'Fairway'),(10,9,45,4,'Wedge',0.00,'Penalty'),(10,9,45,5,'3-Hybrid',9.60,'Penalty'),(10,9,45,6,'8-Iron',8.73,'Fairway'),(10,9,45,9,'5-Hybrid',8.73,'Penalty'),(10,9,45,10,'4-Hybrid',8.73,'Fairway'),(10,9,46,1,'6-Iron',8.91,'Fairway'),(10,9,46,2,'8-Iron',8.91,'Bunker'),(10,9,46,3,'9-Iron',8.17,'Bunker'),(10,9,46,4,'9-Iron',8.17,'Bunker'),(10,9,46,5,'1-Iron',0.00,'Penalty'),(10,9,46,6,'6-Iron',8.91,'Bunker'),(10,9,46,8,'3-Wood',9.80,'Hole'),(10,9,46,9,'3-Wood',8.91,'Bunker'),(10,9,46,10,'9-Iron',9.80,'Hole'),(10,9,47,1,'5-Iron',9.70,'Fairway'),(10,9,47,10,'5-Hybrid',8.08,'Penalty'),(10,9,48,5,'4-Iron',8.45,'Bunker'),(10,9,48,6,'1-Iron',10.33,'Hole'),(10,9,48,8,'2-Iron',9.30,'Hole'),(10,9,48,9,'6-Iron',8.45,'Fairway'),(10,9,48,10,'8-Iron',8.45,'Bunker'),(10,9,49,3,'8-Iron',12.78,'Hole'),(10,9,49,4,'5-Wood',11.50,'Fairway'),(10,9,49,5,'2-Iron',9.58,'Fairway'),(10,9,49,9,'6-Iron',10.45,'Penalty'),(10,9,49,10,'5-Iron',11.50,'Hole'),(10,9,50,5,'3-Wood',0.00,'Penalty'),(10,9,50,8,'3-Hybrid',12.89,'Hole'),(10,9,50,10,'5-Iron',10.55,'Fairway'),(10,9,51,3,'6-Iron',10.82,'Bunker'),(10,9,51,4,'',10.82,'Fairway'),(10,9,51,5,'5-Iron',10.82,'Bunker'),(10,9,51,7,'5-Wood',10.82,'Bunker'),(10,9,52,1,'5-Hybrid',11.36,'Bunker'),(10,9,52,3,'Putter',13.89,'Hole'),(10,9,52,4,'Wedge',11.36,'Fairway'),(10,9,52,5,'3-Wood',11.36,'Fairway'),(10,9,52,9,'2-Iron',13.89,'Bunker'),(10,9,52,10,'3-Hybrid',12.50,'Hole'),(10,9,53,1,'8-Iron',11.82,'Fairway'),(10,9,53,2,'2-Iron',11.82,'Fairway'),(10,9,53,3,'Wedge',0.00,'Penalty'),(10,9,53,4,'9-Iron',13.00,'Bunker'),(10,9,53,5,'4-Iron',14.44,'Hole'),(10,9,53,9,'5-Wood',11.82,'Bunker'),(10,9,54,2,'1-Iron',50.91,'Fairway'),(10,9,54,3,'3-Wood',50.91,'Fairway'),(10,9,54,6,'4-Iron',0.00,'Penalty'),(10,9,54,10,'2-Iron',50.91,'Fairway'),(10,10,37,2,'1-Iron',6.36,'Bunker'),(10,10,37,6,'4-Iron',7.00,'Hole'),(10,10,37,8,'9-Iron',5.83,'Bunker'),(10,10,37,10,'3-Wood',7.00,'Hole'),(10,10,38,1,'8-Iron',5.67,'Penalty'),(10,10,38,2,'Driver',5.67,'Fairway'),(10,10,38,5,'5-Hybrid',5.67,'Fairway'),(10,10,38,8,'3-Wood',6.18,'Fairway'),(10,10,38,10,'5-Wood',0.00,'Penalty'),(10,10,39,1,'3-Hybrid',7.22,'Hole'),(10,10,39,4,'5-Hybrid',0.00,'Penalty'),(10,10,39,5,'Putter',0.00,'Penalty'),(10,10,39,6,'Putter',5.91,'Bunker'),(10,10,39,7,'3-Wood',5.91,'Fairway'),(10,10,39,8,'Putter',6.50,'Hole'),(10,10,39,9,'Putter',7.22,'Hole'),(10,10,39,10,'Wedge',5.91,'Fairway'),(10,10,40,1,'3-Wood',6.00,'Bunker'),(10,10,40,3,'1-Iron',6.60,'Bunker'),(10,10,40,4,'Wedge',6.60,'Fairway'),(10,10,40,6,'5-Wood',6.00,'Fairway'),(10,10,40,8,'5-Wood',6.60,'Fairway'),(10,10,40,10,'5-Hybrid',6.00,'Fairway'),(10,10,41,1,'Wedge',5.75,'Penalty'),(10,10,41,2,'5-Iron',6.90,'Bunker'),(10,10,41,4,'6-Iron',6.27,'Fairway'),(10,10,41,6,'3-Iron',6.90,'Hole'),(10,10,42,1,'3-Wood',5.00,'Bunker'),(10,10,42,2,'Putter',6.00,'Hole'),(10,10,42,3,'3-Wood',6.00,'Hole'),(10,10,42,5,'4-Iron',5.45,'Bunker'),(10,10,42,6,'4-Iron',6.67,'Hole'),(10,10,42,7,'Putter',6.00,'Hole'),(10,10,43,2,'Wedge',7.09,'Fairway'),(10,10,43,3,'2-Iron',7.09,'Bunker'),(10,10,43,4,'Driver',7.80,'Hole'),(10,10,43,7,'Driver',6.50,'Bunker'),(10,10,43,9,'Putter',7.80,'Hole'),(10,10,43,10,'Driver',7.09,'Fairway'),(10,10,44,1,'3-Iron',7.90,'Hole'),(10,10,44,3,'Putter',0.00,'Penalty'),(10,10,44,4,'1-Iron',7.18,'Penalty'),(10,10,44,5,'5-Hybrid',0.00,'Penalty'),(10,10,44,7,'Putter',7.90,'Hole'),(10,10,44,9,'Driver',7.90,'Hole'),(10,10,44,10,'Wedge',7.18,'Bunker'),(10,10,45,2,'3-Wood',8.73,'Fairway'),(10,10,45,3,'8-Iron',8.73,'Fairway'),(10,10,45,4,'Wedge',9.60,'Hole'),(10,10,45,6,'5-Wood',9.60,'Hole'),(10,10,45,8,'4-Iron',8.73,'Fairway'),(10,10,45,9,'4-Iron',0.00,'Penalty'),(10,10,45,10,'3-Hybrid',8.00,'Fairway'),(10,10,46,1,'5-Hybrid',9.80,'Hole'),(10,10,46,2,'Wedge',8.91,'Penalty'),(10,10,46,4,'5-Hybrid',8.91,'Fairway'),(10,10,46,5,'3-Iron',8.91,'Bunker'),(10,10,46,6,'Putter',8.91,'Fairway'),(10,10,46,7,'8-Iron',8.91,'Bunker'),(10,10,46,9,'2-Iron',8.91,'Fairway'),(10,10,46,10,'8-Iron',9.80,'Fairway'),(10,10,47,2,'4-Iron',8.82,'Penalty'),(10,10,47,5,'3-Iron',9.70,'Fairway'),(10,10,47,7,'3-Hybrid',10.78,'Hole'),(10,10,47,8,'8-Iron',9.70,'Hole'),(10,10,48,2,'3-Hybrid',7.75,'Bunker'),(10,10,48,6,'6-Iron',9.30,'Fairway'),(10,10,48,8,'2-Iron',0.00,'Penalty'),(10,10,49,3,'Driver',10.45,'Fairway'),(10,10,49,5,'Wedge',11.50,'Hole'),(10,10,49,6,'3-Wood',11.50,'Fairway'),(10,10,49,9,'2-Iron',12.78,'Hole'),(10,10,49,10,'1-Iron',10.45,'Fairway'),(10,10,50,1,'2-Iron',11.60,'Hole'),(10,10,50,4,'6-Iron',9.67,'Penalty'),(10,10,50,6,'3-Wood',11.60,'Hole'),(10,10,50,7,'6-Iron',9.67,'Fairway'),(10,10,50,8,'5-Wood',9.67,'Fairway'),(10,10,50,9,'6-Iron',9.67,'Bunker'),(10,10,51,1,'8-Iron',9.92,'Fairway'),(10,10,51,2,'3-Iron',10.82,'Fairway'),(10,10,51,3,'3-Wood',9.92,'Bunker'),(10,10,51,4,'6-Iron',13.22,'Hole'),(10,10,51,7,'4-Hybrid',11.90,'Hole'),(10,10,51,10,'Wedge',11.90,'Hole'),(10,10,52,2,'Putter',11.36,'Fairway'),(10,10,52,4,'4-Hybrid',11.36,'Fairway'),(10,10,52,5,'5-Hybrid',12.50,'Hole'),(10,10,52,7,'Wedge',12.50,'Penalty'),(10,10,52,9,'5-Wood',11.36,'Fairway'),(10,10,53,2,'9-Iron',13.00,'Hole'),(10,10,53,4,'',11.82,'Fairway'),(10,10,53,5,'3-Hybrid',11.82,'Bunker'),(10,10,53,6,'3-Wood',10.83,'Fairway'),(10,10,53,9,'6-Iron',11.82,'Bunker'),(10,10,53,10,'5-Hybrid',11.82,'Penalty'),(10,10,54,1,'6-Iron',56.00,'Fairway'),(10,10,54,4,'Wedge',56.00,'Fairway'),(10,10,54,5,'4-Iron',50.91,'Fairway'),(10,10,54,6,'6-Iron',56.00,'Hole'),(10,10,54,7,'5-Iron',50.91,'Fairway'),(10,10,54,10,'5-Iron',56.00,'Bunker'),(10,11,37,2,'3-Hybrid',6.36,'Fairway'),(10,11,37,3,'5-Hybrid',7.00,'Hole'),(10,11,37,6,'7-Iron',6.36,'Fairway'),(10,11,37,8,'6-Iron',6.36,'Bunker'),(10,11,38,1,'3-Hybrid',6.18,'Penalty'),(10,11,38,2,'9-Iron',6.18,'Bunker'),(10,11,38,5,'3-Wood',6.18,'Bunker'),(10,11,38,6,'5-Hybrid',6.18,'Penalty'),(10,11,38,7,'1-Iron',5.67,'Fairway'),(10,11,38,8,'2-Iron',6.18,'Fairway'),(10,11,38,9,'5-Wood',6.18,'Fairway'),(10,11,38,10,'8-Iron',6.18,'Fairway'),(10,11,39,1,'Wedge',5.91,'Fairway'),(10,11,39,2,'1-Iron',5.42,'Fairway'),(10,11,39,3,'',5.91,'Fairway'),(10,11,39,4,'3-Wood',6.50,'Hole'),(10,11,39,5,'9-Iron',5.91,'Fairway'),(10,11,39,8,'Driver',5.91,'Fairway'),(10,11,39,9,'5-Wood',5.91,'Fairway'),(10,11,39,10,'4-Hybrid',5.42,'Fairway'),(10,11,40,1,'8-Iron',5.50,'Fairway'),(10,11,40,2,'2-Iron',6.00,'Fairway'),(10,11,40,4,'4-Iron',7.33,'Hole'),(10,11,40,5,'3-Hybrid',6.60,'Hole'),(10,11,40,6,'4-Iron',6.60,'Hole'),(10,11,40,7,'5-Hybrid',6.00,'Bunker'),(10,11,40,9,'4-Iron',6.60,'Fairway'),(10,11,40,10,'5-Hybrid',6.60,'Fairway'),(10,11,41,1,'7-Iron',6.27,'Fairway'),(10,11,41,7,'1-Iron',6.27,'Fairway'),(10,11,41,9,'Putter',6.27,'Fairway'),(10,11,42,1,'7-Iron',6.00,'Hole'),(10,11,42,2,'3-Wood',5.45,'Bunker'),(10,11,42,3,'5-Iron',6.00,'Hole'),(10,11,42,5,'4-Iron',5.45,'Fairway'),(10,11,42,6,'3-Wood',5.00,'Fairway'),(10,11,42,7,'3-Hybrid',6.00,'Hole'),(10,11,42,8,'4-Hybrid',6.00,'Hole'),(10,11,42,10,'2-Iron',5.45,'Fairway'),(10,11,43,3,'3-Hybrid',7.09,'Bunker'),(10,11,43,4,'3-Iron',7.09,'Penalty'),(10,11,43,6,'3-Hybrid',7.80,'Fairway'),(10,11,43,7,'3-Iron',7.80,'Hole'),(10,11,43,8,'7-Iron',8.67,'Hole'),(10,11,43,10,'2-Iron',6.50,'Fairway'),(10,11,44,1,'5-Iron',7.18,'Penalty'),(10,11,44,2,'Driver',7.18,'Fairway'),(10,11,44,5,'4-Hybrid',8.78,'Hole'),(10,11,44,6,'4-Iron',7.90,'Hole'),(10,11,44,7,'7-Iron',7.90,'Fairway'),(10,11,44,8,'5-Wood',8.78,'Hole'),(10,11,44,10,'2-Iron',0.00,'Penalty'),(10,11,45,1,'6-Iron',8.73,'Fairway'),(10,11,45,2,'4-Hybrid',10.67,'Hole'),(10,11,45,3,'4-Iron',8.73,'Bunker'),(10,11,45,8,'6-Iron',8.73,'Penalty'),(10,11,45,9,'1-Iron',8.73,'Fairway'),(10,11,45,10,'1-Iron',8.73,'Fairway'),(10,11,46,1,'5-Iron',9.80,'Bunker'),(10,11,46,4,'4-Iron',9.80,'Fairway'),(10,11,46,5,'7-Iron',9.80,'Hole'),(10,11,46,7,'4-Hybrid',10.89,'Bunker'),(10,11,46,10,'7-Iron',0.00,'Penalty'),(10,11,47,2,'3-Hybrid',8.82,'Fairway'),(10,11,47,6,'Driver',8.82,'Fairway'),(10,11,47,9,'9-Iron',8.82,'Fairway'),(10,11,48,2,'Putter',0.00,'Penalty'),(10,11,48,5,'7-Iron',8.45,'Fairway'),(10,11,48,6,'Wedge',7.75,'Fairway'),(10,11,48,7,'',8.45,'Fairway'),(10,11,48,8,'Driver',9.30,'Hole'),(10,11,48,9,'5-Iron',8.45,'Bunker'),(10,11,49,1,'4-Hybrid',9.58,'Fairway'),(10,11,49,2,'Driver',11.50,'Hole'),(10,11,49,4,'6-Iron',10.45,'Fairway'),(10,11,49,5,'1-Iron',10.45,'Penalty'),(10,11,49,6,'4-Hybrid',11.50,'Hole'),(10,11,49,8,'2-Iron',11.50,'Bunker'),(10,11,49,10,'1-Iron',11.50,'Hole'),(10,11,50,1,'3-Hybrid',10.55,'Fairway'),(10,11,50,2,'7-Iron',11.60,'Fairway'),(10,11,50,3,'4-Hybrid',10.55,'Fairway'),(10,11,50,4,'3-Iron',10.55,'Fairway'),(10,11,50,8,'5-Wood',12.89,'Hole'),(10,11,51,2,'5-Hybrid',10.82,'Fairway'),(10,11,51,3,'3-Iron',10.82,'Penalty'),(10,11,51,6,'5-Iron',10.82,'Bunker'),(10,11,51,7,'4-Iron',11.90,'Hole'),(10,11,51,9,'3-Hybrid',9.92,'Fairway'),(10,11,52,1,'9-Iron',12.50,'Fairway'),(10,11,52,5,'3-Hybrid',11.36,'Fairway'),(10,11,52,6,'6-Iron',10.42,'Fairway'),(10,11,52,7,'7-Iron',10.42,'Fairway'),(10,11,52,9,'4-Iron',11.36,'Fairway'),(10,11,53,2,'5-Iron',13.00,'Fairway'),(10,11,53,4,'2-Iron',11.82,'Fairway'),(10,11,53,5,'9-Iron',16.25,'Hole'),(10,11,53,8,'3-Hybrid',10.83,'Bunker'),(10,11,53,10,'Wedge',14.44,'Hole'),(10,11,54,1,'5-Iron',62.22,'Hole'),(10,11,54,2,'1-Iron',50.91,'Penalty'),(10,11,54,3,'5-Iron',0.00,'Penalty'),(10,11,54,5,'',56.00,'Hole'),(10,11,54,6,'5-Hybrid',62.22,'Fairway'),(10,11,54,9,'Driver',56.00,'Fairway'),(10,12,37,1,'Driver',6.36,'Bunker'),(10,12,37,2,'3-Hybrid',7.78,'Fairway'),(10,12,37,3,'7-Iron',6.36,'Fairway'),(10,12,37,8,'Putter',0.00,'Penalty'),(10,12,38,1,'',6.18,'Fairway'),(10,12,38,2,'2-Iron',7.56,'Fairway'),(10,12,38,3,'9-Iron',6.18,'Fairway'),(10,12,38,4,'5-Hybrid',6.18,'Bunker'),(10,12,38,7,'3-Wood',6.18,'Fairway'),(10,12,38,8,'9-Iron',6.18,'Bunker'),(10,12,39,1,'Putter',5.91,'Bunker'),(10,12,39,10,'3-Wood',5.91,'Fairway'),(10,12,40,3,'',6.00,'Fairway'),(10,12,40,4,'1-Iron',6.00,'Fairway'),(10,12,40,5,'7-Iron',6.00,'Bunker'),(10,12,40,6,'7-Iron',6.00,'Fairway'),(10,12,40,7,'8-Iron',5.50,'Fairway'),(10,12,40,8,'5-Iron',6.60,'Hole'),(10,12,40,9,'9-Iron',6.60,'Fairway'),(10,12,40,10,'Wedge',6.00,'Fairway'),(10,12,41,2,'5-Iron',6.90,'Hole'),(10,12,41,3,'4-Hybrid',6.90,'Hole'),(10,12,41,5,'Putter',6.90,'Hole'),(10,12,41,6,'8-Iron',6.27,'Bunker'),(10,12,41,8,'1-Iron',6.27,'Fairway'),(10,12,41,10,'4-Hybrid',6.27,'Fairway'),(10,12,42,1,'5-Wood',6.00,'Hole'),(10,12,42,2,'5-Wood',5.00,'Bunker'),(10,12,42,3,'7-Iron',5.00,'Fairway'),(10,12,42,7,'3-Wood',5.45,'Fairway'),(10,12,42,9,'5-Hybrid',6.00,'Fairway'),(10,12,42,10,'3-Hybrid',6.00,'Hole'),(10,12,43,2,'Putter',7.09,'Fairway'),(10,12,43,4,'5-Iron',8.67,'Hole'),(10,12,43,5,'9-Iron',7.80,'Hole'),(10,12,43,7,'4-Hybrid',7.09,'Fairway'),(10,12,44,1,'Wedge',7.18,'Fairway'),(10,12,44,2,'9-Iron',6.58,'Bunker'),(10,12,44,3,'Putter',7.18,'Bunker'),(10,12,44,6,'3-Wood',7.90,'Hole'),(10,12,45,1,'6-Iron',8.00,'Fairway'),(10,12,45,3,'5-Wood',8.73,'Fairway'),(10,12,45,4,'9-Iron',8.73,'Fairway'),(10,12,45,5,'5-Wood',9.60,'Fairway'),(10,12,45,6,'1-Iron',8.73,'Fairway'),(10,12,45,7,'3-Iron',8.73,'Fairway'),(10,12,45,8,'3-Hybrid',0.00,'Penalty'),(10,12,45,9,'Wedge',8.73,'Fairway'),(10,12,46,1,'4-Iron',9.80,'Bunker'),(10,12,46,2,'4-Iron',8.91,'Bunker'),(10,12,46,3,'6-Iron',8.91,'Fairway'),(10,12,46,7,'3-Iron',8.91,'Penalty'),(10,12,46,8,'5-Wood',10.89,'Hole'),(10,12,46,10,'3-Wood',9.80,'Hole'),(10,12,47,1,'Putter',8.08,'Bunker'),(10,12,47,2,'4-Iron',8.82,'Bunker'),(10,12,47,3,'4-Iron',8.08,'Fairway'),(10,12,47,5,'Putter',8.08,'Bunker'),(10,12,47,6,'9-Iron',9.70,'Hole'),(10,12,47,7,'2-Iron',9.70,'Fairway'),(10,12,47,8,'5-Wood',8.82,'Penalty'),(10,12,47,9,'4-Iron',0.00,'Penalty'),(10,12,47,10,'3-Wood',9.70,'Hole'),(10,12,48,3,'Putter',8.45,'Penalty'),(10,12,48,4,'5-Wood',9.30,'Hole'),(10,12,48,6,'5-Wood',8.45,'Bunker'),(10,12,48,10,'6-Iron',8.45,'Bunker'),(10,12,49,3,'2-Iron',10.45,'Fairway'),(10,12,49,5,'4-Hybrid',11.50,'Bunker'),(10,12,49,6,'Wedge',10.45,'Fairway'),(10,12,49,7,'Putter',11.50,'Hole'),(10,12,49,8,'',10.45,'Fairway'),(10,12,50,4,'5-Wood',10.55,'Fairway'),(10,12,50,5,'6-Iron',9.67,'Fairway'),(10,12,51,2,'Driver',11.90,'Bunker'),(10,12,51,3,'8-Iron',10.82,'Fairway'),(10,12,51,4,'Wedge',9.92,'Fairway'),(10,12,51,6,'5-Hybrid',11.90,'Hole'),(10,12,52,2,'1-Iron',0.00,'Penalty'),(10,12,52,3,'Putter',11.36,'Fairway'),(10,12,52,4,'8-Iron',12.50,'Hole'),(10,12,52,5,'7-Iron',12.50,'Hole'),(10,12,52,7,'4-Iron',11.36,'Penalty'),(10,12,52,9,'7-Iron',11.36,'Bunker'),(10,12,52,10,'Putter',10.42,'Fairway'),(10,12,53,1,'1-Iron',14.44,'Hole'),(10,12,53,6,'8-Iron',14.44,'Hole'),(10,12,53,7,'5-Hybrid',13.00,'Hole'),(10,12,53,9,'7-Iron',13.00,'Bunker'),(10,12,54,1,'3-Wood',50.91,'Fairway'),(10,12,54,2,'5-Hybrid',50.91,'Fairway'),(10,12,54,5,'4-Hybrid',56.00,'Hole'),(10,12,54,6,'3-Wood',50.91,'Fairway'),(10,12,54,7,'4-Hybrid',46.67,'Fairway'),(10,12,54,10,'4-Hybrid',56.00,'Hole'),(10,13,55,1,'8-Iron',6.09,'Fairway'),(10,13,55,2,'Putter',6.09,'Fairway'),(10,13,55,3,'Driver',6.09,'Fairway'),(10,13,55,6,'1-Iron',0.00,'Penalty'),(10,13,55,7,'6-Iron',0.00,'Penalty'),(10,13,55,8,'3-Hybrid',6.70,'Hole'),(10,13,55,9,'5-Hybrid',6.09,'Fairway'),(10,13,55,10,'',6.09,'Fairway'),(10,13,56,2,'5-Hybrid',6.18,'Fairway'),(10,13,56,4,'7-Iron',6.18,'Bunker'),(10,13,56,5,'Putter',6.18,'Fairway'),(10,13,56,7,'8-Iron',6.18,'Penalty'),(10,13,56,8,'Wedge',6.18,'Fairway'),(10,13,56,9,'2-Iron',6.80,'Hole'),(10,13,56,10,'4-Iron',6.18,'Fairway'),(10,13,57,2,'8-Iron',6.90,'Fairway'),(10,13,57,4,'2-Iron',6.90,'Hole'),(10,13,57,5,'Putter',6.90,'Hole'),(10,13,57,8,'Driver',6.90,'Bunker'),(10,13,57,10,'5-Wood',6.90,'Hole'),(10,13,58,3,'4-Hybrid',6.36,'Fairway'),(10,13,58,4,'8-Iron',6.36,'Fairway'),(10,13,58,5,'3-Iron',7.00,'Hole'),(10,13,58,7,'Wedge',6.36,'Fairway'),(10,13,59,1,'6-Iron',0.00,'Penalty'),(10,13,59,2,'5-Hybrid',7.89,'Hole'),(10,13,59,4,'5-Hybrid',6.45,'Fairway'),(10,13,59,5,'5-Hybrid',6.45,'Fairway'),(10,13,59,7,'9-Iron',7.10,'Hole'),(10,13,59,8,'',0.00,'Penalty'),(10,13,59,9,'3-Iron',6.45,'Fairway'),(10,13,59,10,'Putter',7.10,'Hole'),(10,13,60,1,'5-Iron',6.55,'Penalty'),(10,13,60,3,'3-Iron',6.55,'Bunker'),(10,13,60,4,'4-Iron',6.00,'Fairway'),(10,13,60,7,'5-Iron',6.00,'Fairway'),(10,13,60,8,'5-Wood',7.20,'Hole'),(10,13,61,2,'Driver',10.30,'Bunker'),(10,13,61,3,'6-Iron',0.00,'Penalty'),(10,13,61,7,'3-Hybrid',9.36,'Bunker'),(10,13,61,8,'Wedge',10.30,'Fairway'),(10,13,61,9,'7-Iron',9.36,'Bunker'),(10,13,61,10,'5-Hybrid',11.44,'Hole'),(10,13,62,7,'Wedge',10.40,'Bunker'),(10,13,62,9,'5-Hybrid',9.45,'Bunker'),(10,13,63,3,'3-Hybrid',9.64,'Bunker'),(10,13,63,4,'3-Iron',11.78,'Bunker'),(10,13,63,5,'Driver',9.64,'Bunker'),(10,13,63,7,'5-Hybrid',8.83,'Bunker'),(10,13,63,8,'7-Iron',11.78,'Hole'),(10,13,64,3,'3-Hybrid',9.00,'Bunker'),(10,13,64,4,'5-Iron',12.00,'Fairway'),(10,13,64,5,'1-Iron',10.80,'Hole'),(10,13,64,9,'5-Wood',12.00,'Fairway'),(10,13,65,3,'Wedge',10.30,'Hole'),(10,13,65,5,'5-Iron',10.30,'Fairway'),(10,13,65,8,'5-Wood',10.30,'Fairway'),(10,13,65,9,'3-Wood',11.44,'Hole'),(10,13,66,1,'9-Iron',8.09,'Fairway'),(10,13,66,2,'Driver',7.42,'Fairway'),(10,13,66,3,'3-Wood',8.90,'Fairway'),(10,13,66,4,'4-Hybrid',8.09,'Penalty'),(10,13,66,6,'3-Wood',8.09,'Fairway'),(10,13,66,9,'3-Iron',8.09,'Fairway'),(10,13,67,2,'',10.50,'Fairway'),(10,13,67,3,'6-Iron',10.50,'Hole'),(10,13,67,4,'Putter',9.55,'Fairway'),(10,13,67,5,'3-Iron',8.75,'Bunker'),(10,13,67,8,'1-Iron',9.55,'Fairway'),(10,13,68,1,'Wedge',10.80,'Hole'),(10,13,68,4,'4-Hybrid',10.80,'Hole'),(10,13,68,5,'9-Iron',9.82,'Fairway'),(10,13,68,6,'8-Iron',10.80,'Fairway'),(10,13,68,7,'',9.00,'Bunker'),(10,13,68,8,'5-Iron',10.80,'Fairway'),(10,13,68,9,'4-Hybrid',9.00,'Penalty'),(10,13,69,1,'5-Iron',10.90,'Fairway'),(10,13,69,2,'3-Wood',0.00,'Penalty'),(10,13,69,4,'4-Iron',9.91,'Fairway'),(10,13,69,6,'3-Wood',10.90,'Hole'),(10,13,69,9,'3-Iron',10.90,'Fairway'),(10,13,69,10,'3-Wood',9.91,'Bunker'),(10,13,70,1,'5-Wood',13.22,'Hole'),(10,13,70,2,'5-Hybrid',9.92,'Fairway'),(10,13,70,4,'Driver',10.82,'Bunker'),(10,13,70,6,'9-Iron',10.82,'Bunker'),(10,13,70,8,'',10.82,'Fairway'),(10,13,70,9,'3-Hybrid',11.90,'Hole'),(10,13,71,2,'1-Iron',12.10,'Hole'),(10,13,71,4,'4-Iron',10.08,'Fairway'),(10,13,71,5,'8-Iron',11.00,'Bunker'),(10,13,71,6,'4-Hybrid',0.00,'Penalty'),(10,13,71,7,'6-Iron',10.08,'Fairway'),(10,13,71,8,'5-Wood',13.44,'Hole'),(10,13,71,10,'2-Iron',10.08,'Fairway'),(10,13,72,1,'4-Hybrid',14.00,'Penalty'),(10,13,72,2,'5-Wood',12.73,'Fairway'),(10,13,72,5,'9-Iron',15.56,'Hole'),(10,13,72,7,'4-Iron',0.00,'Penalty'),(10,13,72,8,'Putter',12.73,'Fairway'),(10,13,72,10,'5-Wood',15.56,'Hole'),(10,14,55,3,'5-Iron',6.09,'Fairway'),(10,14,55,5,'Putter',6.70,'Fairway'),(10,14,55,6,'5-Wood',7.44,'Hole'),(10,14,55,8,'5-Hybrid',6.09,'Fairway'),(10,14,56,3,'4-Hybrid',6.18,'Fairway'),(10,14,56,5,'7-Iron',6.18,'Fairway'),(10,14,56,7,'4-Hybrid',0.00,'Penalty'),(10,14,56,8,'5-Wood',6.18,'Fairway'),(10,14,57,1,'3-Iron',7.67,'Hole'),(10,14,57,2,'7-Iron',6.90,'Hole'),(10,14,57,4,'5-Iron',6.27,'Bunker'),(10,14,57,10,'2-Iron',5.75,'Fairway'),(10,14,58,3,'7-Iron',7.78,'Fairway'),(10,14,58,4,'9-Iron',6.36,'Penalty'),(10,14,58,6,'1-Iron',6.36,'Bunker'),(10,14,58,10,'8-Iron',6.36,'Fairway'),(10,14,59,1,'3-Wood',6.45,'Fairway'),(10,14,59,4,'9-Iron',6.45,'Fairway'),(10,14,59,5,'5-Iron',5.92,'Bunker'),(10,14,59,6,'1-Iron',6.45,'Fairway'),(10,14,59,7,'2-Iron',6.45,'Bunker'),(10,14,59,8,'5-Wood',6.45,'Fairway'),(10,14,60,1,'5-Iron',6.55,'Bunker'),(10,14,60,2,'3-Hybrid',6.00,'Fairway'),(10,14,60,3,'3-Wood',6.55,'Fairway'),(10,14,60,9,'3-Hybrid',0.00,'Penalty'),(10,14,60,10,'4-Iron',6.00,'Bunker'),(10,14,61,1,'3-Hybrid',8.58,'Fairway'),(10,14,61,2,'2-Iron',9.36,'Fairway'),(10,14,61,3,'3-Iron',9.36,'Bunker'),(10,14,61,4,'Wedge',8.58,'Fairway'),(10,14,61,5,'9-Iron',10.30,'Hole'),(10,14,61,6,'6-Iron',9.36,'Bunker'),(10,14,61,7,'8-Iron',10.30,'Hole'),(10,14,61,10,'Putter',8.58,'Bunker'),(10,14,62,1,'3-Iron',0.00,'Penalty'),(10,14,62,4,'3-Wood',9.45,'Fairway'),(10,14,62,6,'4-Hybrid',9.45,'Fairway'),(10,14,62,8,'Wedge',9.45,'Fairway'),(10,14,62,9,'3-Hybrid',9.45,'Fairway'),(10,14,62,10,'Wedge',9.45,'Fairway'),(10,14,63,1,'3-Iron',10.60,'Hole'),(10,14,63,2,'5-Wood',8.83,'Fairway'),(10,14,63,3,'4-Iron',10.60,'Bunker'),(10,14,63,5,'3-Iron',9.64,'Fairway'),(10,14,63,6,'7-Iron',11.78,'Fairway'),(10,14,63,7,'8-Iron',9.64,'Fairway'),(10,14,63,8,'7-Iron',9.64,'Fairway'),(10,14,63,9,'3-Wood',9.64,'Bunker'),(10,14,64,1,'8-Iron',9.82,'Fairway'),(10,14,64,2,'4-Iron',9.82,'Bunker'),(10,14,64,3,'3-Iron',10.80,'Fairway'),(10,14,64,4,'3-Hybrid',10.80,'Hole'),(10,14,64,5,'Putter',9.00,'Bunker'),(10,14,64,6,'4-Hybrid',10.80,'Hole'),(10,14,64,7,'9-Iron',12.00,'Hole'),(10,14,64,9,'8-Iron',9.82,'Fairway'),(10,14,65,1,'2-Iron',9.36,'Fairway'),(10,14,65,2,'2-Iron',11.44,'Hole'),(10,14,65,3,'',8.58,'Fairway'),(10,14,65,5,'3-Hybrid',8.58,'Fairway'),(10,14,65,6,'4-Iron',9.36,'Bunker'),(10,14,65,8,'7-Iron',10.30,'Fairway'),(10,14,66,2,'7-Iron',8.09,'Fairway'),(10,14,66,3,'5-Hybrid',7.42,'Bunker'),(10,14,66,7,'1-Iron',8.09,'Penalty'),(10,14,66,9,'4-Hybrid',8.90,'Hole'),(10,14,67,2,'8-Iron',9.55,'Fairway'),(10,14,67,4,'7-Iron',9.55,'Penalty'),(10,14,67,5,'5-Iron',9.55,'Fairway'),(10,14,67,6,'4-Hybrid',9.55,'Bunker'),(10,14,68,1,'5-Wood',9.00,'Fairway'),(10,14,68,3,'',9.82,'Fairway'),(10,14,68,4,'2-Iron',9.82,'Fairway'),(10,14,68,5,'8-Iron',0.00,'Penalty'),(10,14,68,6,'5-Iron',10.80,'Hole'),(10,14,68,7,'8-Iron',10.80,'Hole'),(10,14,68,8,'Wedge',9.82,'Fairway'),(10,14,68,9,'3-Iron',9.82,'Fairway'),(10,14,68,10,'6-Iron',9.82,'Fairway'),(10,14,69,1,'3-Iron',10.90,'Fairway'),(10,14,69,3,'3-Iron',9.08,'Bunker'),(10,14,69,5,'Wedge',10.90,'Hole'),(10,14,69,6,'7-Iron',9.91,'Fairway'),(10,14,69,7,'7-Iron',9.08,'Fairway'),(10,14,69,9,'5-Hybrid',10.90,'Hole'),(10,14,69,10,'',0.00,'Penalty'),(10,14,70,2,'3-Hybrid',11.90,'Hole'),(10,14,70,3,'1-Iron',10.82,'Penalty'),(10,14,70,4,'3-Hybrid',10.82,'Bunker'),(10,14,70,5,'5-Iron',11.90,'Hole'),(10,14,70,9,'Driver',10.82,'Fairway'),(10,14,71,3,'Putter',11.00,'Bunker'),(10,14,71,10,'1-Iron',11.00,'Fairway'),(10,14,72,2,'6-Iron',15.56,'Hole'),(10,14,72,3,'4-Hybrid',14.00,'Hole'),(10,14,72,4,'5-Wood',15.56,'Hole'),(10,14,72,5,'5-Wood',12.73,'Fairway'),(10,14,72,8,'7-Iron',11.67,'Bunker'),(10,14,72,9,'2-Iron',12.73,'Fairway'),(10,14,72,10,'7-Iron',11.67,'Bunker'),(10,15,55,1,'4-Hybrid',6.70,'Hole'),(10,15,55,2,'5-Iron',6.09,'Fairway'),(10,15,55,8,'7-Iron',6.09,'Fairway'),(10,15,55,10,'1-Iron',6.70,'Fairway'),(10,15,56,3,'5-Wood',6.80,'Fairway'),(10,15,56,5,'5-Wood',6.80,'Hole'),(10,15,56,6,'Putter',6.18,'Fairway'),(10,15,56,7,'Putter',6.18,'Fairway'),(10,15,56,9,'Putter',5.67,'Fairway'),(10,15,56,10,'1-Iron',6.80,'Fairway'),(10,15,57,1,'8-Iron',6.90,'Hole'),(10,15,57,2,'2-Iron',5.75,'Bunker'),(10,15,57,3,'Wedge',8.63,'Hole'),(10,15,57,7,'4-Iron',6.90,'Hole'),(10,15,57,8,'3-Hybrid',7.67,'Hole'),(10,15,57,9,'4-Hybrid',6.27,'Bunker'),(10,15,57,10,'4-Iron',6.90,'Bunker'),(10,15,58,1,'Wedge',7.00,'Fairway'),(10,15,58,3,'5-Hybrid',6.36,'Bunker'),(10,15,58,6,'6-Iron',7.00,'Hole'),(10,15,58,7,'4-Iron',6.36,'Fairway'),(10,15,59,3,'2-Iron',6.45,'Fairway'),(10,15,59,6,'9-Iron',7.10,'Hole'),(10,15,59,7,'3-Hybrid',5.92,'Fairway'),(10,15,59,9,'5-Wood',5.92,'Fairway'),(10,15,60,1,'5-Wood',6.55,'Fairway'),(10,15,60,3,'4-Hybrid',6.55,'Bunker'),(10,15,60,4,'3-Hybrid',7.20,'Bunker'),(10,15,60,5,'3-Wood',6.00,'Fairway'),(10,15,60,6,'4-Iron',6.55,'Fairway'),(10,15,60,9,'1-Iron',6.55,'Fairway'),(10,15,60,10,'7-Iron',6.00,'Bunker'),(10,15,61,1,'5-Wood',9.36,'Fairway'),(10,15,61,4,'5-Hybrid',8.58,'Bunker'),(10,15,61,5,'5-Hybrid',8.58,'Bunker'),(10,15,61,6,'4-Hybrid',10.30,'Bunker'),(10,15,61,8,'3-Iron',9.36,'Bunker'),(10,15,61,9,'2-Iron',10.30,'Hole'),(10,15,62,2,'8-Iron',9.45,'Bunker'),(10,15,62,4,'4-Hybrid',8.67,'Fairway'),(10,15,62,5,'7-Iron',10.40,'Hole'),(10,15,62,6,'4-Iron',9.45,'Penalty'),(10,15,62,7,'1-Iron',9.45,'Bunker'),(10,15,62,8,'Driver',9.45,'Fairway'),(10,15,62,9,'Driver',9.45,'Fairway'),(10,15,62,10,'8-Iron',10.40,'Fairway'),(10,15,63,1,'3-Hybrid',9.64,'Bunker'),(10,15,63,2,'4-Hybrid',9.64,'Fairway'),(10,15,63,3,'3-Hybrid',9.64,'Fairway'),(10,15,63,5,'5-Iron',11.78,'Hole'),(10,15,63,8,'5-Iron',9.64,'Bunker'),(10,15,63,9,'9-Iron',9.64,'Bunker'),(10,15,64,1,'6-Iron',10.80,'Bunker'),(10,15,64,2,'3-Iron',9.82,'Bunker'),(10,15,64,3,'9-Iron',10.80,'Hole'),(10,15,64,4,'4-Iron',9.82,'Penalty'),(10,15,64,5,'5-Wood',9.82,'Bunker'),(10,15,64,6,'3-Wood',9.82,'Bunker'),(10,15,64,9,'8-Iron',9.82,'Fairway'),(10,15,64,10,'5-Hybrid',0.00,'Penalty'),(10,15,65,1,'2-Iron',9.36,'Fairway'),(10,15,65,2,'5-Hybrid',10.30,'Hole'),(10,15,65,3,'Driver',11.44,'Hole'),(10,15,65,4,'3-Wood',8.58,'Bunker'),(10,15,65,5,'8-Iron',8.58,'Fairway'),(10,15,65,8,'2-Iron',9.36,'Fairway'),(10,15,65,9,'Driver',12.88,'Hole'),(10,15,65,10,'3-Iron',0.00,'Penalty'),(10,15,66,3,'3-Iron',9.89,'Hole'),(10,15,66,4,'4-Iron',9.89,'Hole'),(10,15,66,5,'Wedge',9.89,'Hole'),(10,15,66,6,'9-Iron',8.09,'Bunker'),(10,15,66,7,'7-Iron',8.90,'Hole'),(10,15,66,10,'3-Wood',8.90,'Hole'),(10,15,67,1,'4-Iron',11.67,'Hole'),(10,15,67,3,'3-Hybrid',9.55,'Bunker'),(10,15,67,5,'6-Iron',9.55,'Bunker'),(10,15,68,5,'5-Wood',9.00,'Fairway'),(10,15,68,8,'Putter',9.82,'Fairway'),(10,15,68,9,'5-Hybrid',9.82,'Penalty'),(10,15,68,10,'8-Iron',10.80,'Bunker'),(10,15,69,2,'Wedge',10.90,'Hole'),(10,15,69,3,'3-Iron',10.90,'Hole'),(10,15,69,4,'9-Iron',9.91,'Bunker'),(10,15,69,5,'Putter',10.90,'Hole'),(10,15,69,7,'3-Wood',9.91,'Fairway'),(10,15,69,9,'1-Iron',10.90,'Hole'),(10,15,69,10,'5-Iron',10.90,'Fairway'),(10,15,70,2,'5-Wood',10.82,'Fairway'),(10,15,70,3,'4-Hybrid',10.82,'Fairway'),(10,15,70,4,'5-Hybrid',9.92,'Fairway'),(10,15,70,5,'5-Wood',10.82,'Bunker'),(10,15,70,7,'8-Iron',10.82,'Fairway'),(10,15,70,8,'5-Wood',9.92,'Bunker'),(10,15,70,9,'1-Iron',11.90,'Hole'),(10,15,71,1,'6-Iron',11.00,'Fairway'),(10,15,71,2,'8-Iron',11.00,'Fairway'),(10,15,71,4,'5-Hybrid',15.13,'Hole'),(10,15,71,5,'4-Iron',12.10,'Hole'),(10,15,71,7,'5-Iron',0.00,'Penalty'),(10,15,71,10,'5-Iron',0.00,'Penalty'),(10,15,72,2,'',14.00,'Fairway'),(10,15,72,4,'1-Iron',11.67,'Fairway'),(10,15,72,7,'3-Wood',12.73,'Fairway'),(10,15,72,9,'7-Iron',14.00,'Bunker'),(10,16,55,1,'3-Hybrid',6.09,'Fairway'),(10,16,55,4,'4-Hybrid',7.44,'Hole'),(10,16,55,6,'8-Iron',6.09,'Bunker'),(10,16,55,7,'Wedge',5.58,'Bunker'),(10,16,55,8,'4-Iron',6.09,'Bunker'),(10,16,55,9,'3-Hybrid',7.44,'Hole'),(10,16,55,10,'3-Wood',6.70,'Fairway'),(10,16,56,1,'1-Iron',6.18,'Fairway'),(10,16,56,3,'Driver',0.00,'Penalty'),(10,16,56,4,'3-Wood',6.18,'Fairway'),(10,16,56,5,'Wedge',6.18,'Fairway'),(10,16,56,6,'3-Wood',6.80,'Hole'),(10,16,56,7,'5-Hybrid',7.56,'Hole'),(10,16,56,8,'2-Iron',5.67,'Fairway'),(10,16,56,9,'6-Iron',6.18,'Fairway'),(10,16,56,10,'8-Iron',6.18,'Fairway'),(10,16,57,1,'5-Wood',6.27,'Penalty'),(10,16,57,2,'7-Iron',6.90,'Hole'),(10,16,57,3,'2-Iron',5.75,'Fairway'),(10,16,57,4,'7-Iron',6.27,'Fairway'),(10,16,57,5,'8-Iron',6.27,'Fairway'),(10,16,57,7,'Putter',6.27,'Fairway'),(10,16,57,8,'4-Hybrid',6.27,'Bunker'),(10,16,57,9,'',6.27,'Fairway'),(10,16,58,1,'Putter',7.00,'Fairway'),(10,16,58,2,'3-Iron',6.36,'Bunker'),(10,16,58,3,'5-Wood',0.00,'Penalty'),(10,16,58,4,'5-Hybrid',6.36,'Fairway'),(10,16,58,7,'3-Wood',7.00,'Hole'),(10,16,59,4,'1-Iron',6.45,'Fairway'),(10,16,59,5,'6-Iron',6.45,'Bunker'),(10,16,59,8,'2-Iron',7.10,'Hole'),(10,16,60,1,'3-Wood',6.55,'Fairway'),(10,16,60,3,'3-Wood',7.20,'Bunker'),(10,16,60,8,'6-Iron',7.20,'Hole'),(10,16,60,9,'8-Iron',7.20,'Hole'),(10,16,61,1,'3-Iron',10.30,'Hole'),(10,16,61,5,'4-Iron',9.36,'Fairway'),(10,16,61,8,'5-Hybrid',9.36,'Fairway'),(10,16,61,9,'2-Iron',10.30,'Hole'),(10,16,61,10,'4-Iron',10.30,'Hole'),(10,16,62,1,'7-Iron',9.45,'Fairway'),(10,16,62,2,'3-Hybrid',8.67,'Fairway'),(10,16,62,3,'Wedge',10.40,'Fairway'),(10,16,62,4,'5-Wood',10.40,'Bunker'),(10,16,62,5,'6-Iron',10.40,'Hole'),(10,16,62,7,'6-Iron',8.67,'Fairway'),(10,16,62,9,'2-Iron',9.45,'Bunker'),(10,16,62,10,'5-Wood',10.40,'Hole'),(10,16,63,2,'1-Iron',10.60,'Fairway'),(10,16,63,3,'5-Hybrid',10.60,'Bunker'),(10,16,63,4,'3-Iron',9.64,'Fairway'),(10,16,63,8,'',10.60,'Fairway'),(10,16,63,10,'3-Wood',10.60,'Hole'),(10,16,64,1,'2-Iron',9.00,'Bunker'),(10,16,64,2,'3-Iron',9.82,'Fairway'),(10,16,64,3,'4-Iron',9.00,'Penalty'),(10,16,64,5,'5-Iron',9.82,'Fairway'),(10,16,64,6,'Putter',9.82,'Bunker'),(10,16,64,7,'7-Iron',0.00,'Penalty'),(10,16,64,8,'',10.80,'Fairway'),(10,16,64,10,'2-Iron',10.80,'Hole'),(10,16,65,2,'7-Iron',11.44,'Hole'),(10,16,65,4,'5-Hybrid',9.36,'Bunker'),(10,16,65,6,'Driver',9.36,'Bunker'),(10,16,65,8,'9-Iron',0.00,'Penalty'),(10,16,65,10,'9-Iron',10.30,'Hole'),(10,16,66,1,'6-Iron',8.90,'Hole'),(10,16,66,3,'9-Iron',8.09,'Bunker'),(10,16,66,4,'',8.09,'Fairway'),(10,16,66,5,'4-Hybrid',8.09,'Fairway'),(10,16,66,6,'7-Iron',7.42,'Bunker'),(10,16,66,7,'6-Iron',8.90,'Hole'),(10,16,66,8,'4-Iron',8.09,'Fairway'),(10,16,67,1,'2-Iron',8.75,'Bunker'),(10,16,67,2,'5-Hybrid',11.67,'Hole'),(10,16,67,4,'8-Iron',9.55,'Fairway'),(10,16,67,6,'Driver',10.50,'Hole'),(10,16,67,7,'2-Iron',10.50,'Hole'),(10,16,67,8,'5-Hybrid',9.55,'Bunker'),(10,16,67,9,'1-Iron',8.75,'Fairway'),(10,16,67,10,'Driver',10.50,'Hole'),(10,16,68,1,'4-Hybrid',9.00,'Fairway'),(10,16,68,2,'Putter',10.80,'Hole'),(10,16,68,3,'1-Iron',9.00,'Bunker'),(10,16,68,4,'4-Hybrid',12.00,'Hole'),(10,16,68,5,'3-Wood',9.82,'Fairway'),(10,16,68,6,'1-Iron',9.82,'Bunker'),(10,16,68,8,'Wedge',10.80,'Hole'),(10,16,68,9,'5-Wood',9.82,'Fairway'),(10,16,69,2,'6-Iron',9.08,'Penalty'),(10,16,69,3,'Putter',0.00,'Penalty'),(10,16,69,7,'3-Iron',9.91,'Fairway'),(10,16,69,8,'3-Iron',9.08,'Fairway'),(10,16,70,1,'7-Iron',10.82,'Bunker'),(10,16,70,2,'',9.92,'Fairway'),(10,16,70,3,'3-Wood',10.82,'Bunker'),(10,16,70,5,'5-Hybrid',0.00,'Penalty'),(10,16,70,6,'8-Iron',9.92,'Fairway'),(10,16,70,7,'5-Iron',11.90,'Fairway'),(10,16,70,8,'8-Iron',10.82,'Fairway'),(10,16,70,9,'Putter',13.22,'Hole'),(10,16,71,1,'Driver',12.10,'Fairway'),(10,16,71,2,'4-Iron',11.00,'Fairway'),(10,16,71,3,'2-Iron',11.00,'Fairway'),(10,16,71,4,'4-Iron',12.10,'Hole'),(10,16,71,7,'8-Iron',12.10,'Hole'),(10,16,71,8,'3-Wood',12.10,'Hole'),(10,16,71,9,'5-Wood',0.00,'Penalty'),(10,16,72,2,'7-Iron',12.73,'Fairway'),(10,16,72,4,'7-Iron',15.56,'Hole'),(10,16,72,5,'3-Hybrid',12.73,'Fairway'),(10,16,72,7,'4-Iron',14.00,'Hole'),(10,16,72,9,'3-Wood',14.00,'Hole'),(10,16,72,10,'3-Wood',12.73,'Fairway'),(10,17,73,1,'5-Hybrid',46.55,'Fairway'),(10,17,73,2,'3-Hybrid',42.67,'Bunker'),(10,17,73,3,'9-Iron',46.55,'Fairway'),(10,17,73,6,'',51.20,'Fairway'),(10,17,73,7,'3-Wood',0.00,'Penalty'),(10,17,73,8,'Putter',51.20,'Hole'),(10,17,74,1,'7-Iron',16.55,'Bunker'),(10,17,74,3,'5-Iron',16.55,'Fairway'),(10,17,74,6,'4-Iron',18.20,'Hole'),(10,17,74,7,'Wedge',18.20,'Fairway'),(10,17,74,8,'7-Iron',18.20,'Fairway'),(10,17,74,9,'8-Iron',16.55,'Fairway'),(10,17,75,1,'5-Iron',9.89,'Hole'),(10,17,75,2,'2-Iron',8.09,'Fairway'),(10,17,75,3,'',8.09,'Fairway'),(10,17,75,4,'5-Iron',9.89,'Hole'),(10,17,75,5,'3-Hybrid',8.90,'Hole'),(10,17,75,8,'Putter',0.00,'Penalty'),(10,17,76,1,'3-Wood',7.18,'Fairway'),(10,17,76,2,'5-Wood',7.90,'Hole'),(10,17,76,3,'4-Iron',7.90,'Fairway'),(10,17,76,4,'6-Iron',7.18,'Fairway'),(10,17,76,6,'Driver',6.58,'Fairway'),(10,17,76,7,'9-Iron',7.90,'Fairway'),(10,17,76,8,'5-Wood',6.58,'Fairway'),(10,17,76,9,'5-Iron',7.18,'Fairway'),(10,17,77,3,'5-Iron',8.00,'Hole'),(10,17,77,4,'5-Iron',7.27,'Fairway'),(10,17,77,5,'4-Iron',8.00,'Bunker'),(10,17,77,6,'Putter',8.00,'Hole'),(10,17,77,7,'7-Iron',7.27,'Fairway'),(10,17,77,10,'5-Wood',7.27,'Fairway'),(10,17,78,1,'8-Iron',8.00,'Fairway'),(10,17,78,2,'5-Hybrid',8.00,'Bunker'),(10,17,78,3,'5-Hybrid',8.00,'Fairway'),(10,17,78,4,'3-Hybrid',8.80,'Hole'),(10,17,78,7,'3-Iron',8.80,'Hole'),(10,17,78,10,'8-Iron',8.00,'Fairway'),(10,17,79,2,'5-Iron',8.60,'Hole'),(10,17,79,3,'Driver',7.82,'Fairway'),(10,17,79,9,'4-Hybrid',10.75,'Hole'),(10,17,79,10,'3-Wood',7.82,'Fairway'),(10,17,80,1,'Putter',7.00,'Bunker'),(10,17,80,2,'4-Iron',7.64,'Bunker'),(10,17,80,3,'3-Iron',7.64,'Bunker'),(10,17,80,4,'4-Iron',7.64,'Fairway'),(10,17,80,6,'3-Iron',7.64,'Bunker'),(10,17,80,10,'4-Iron',9.33,'Hole'),(10,17,81,1,'5-Iron',10.00,'Hole'),(10,17,81,2,'1-Iron',9.00,'Bunker'),(10,17,81,3,'Putter',0.00,'Penalty'),(10,17,81,4,'4-Iron',8.18,'Bunker'),(10,17,81,5,'7-Iron',8.18,'Fairway'),(10,17,81,6,'3-Wood',8.18,'Fairway'),(10,17,81,7,'3-Wood',8.18,'Fairway'),(10,17,81,8,'5-Iron',10.00,'Hole'),(10,17,81,9,'9-Iron',8.18,'Fairway'),(10,17,81,10,'8-Iron',7.50,'Fairway'),(10,17,82,1,'',0.00,'Penalty'),(10,17,82,3,'Putter',9.00,'Bunker'),(10,17,82,6,'4-Iron',9.90,'Hole'),(10,17,82,7,'Putter',9.90,'Fairway'),(10,17,82,9,'3-Iron',9.00,'Penalty'),(10,17,83,2,'3-Wood',0.00,'Penalty'),(10,17,83,3,'6-Iron',0.00,'Penalty'),(10,17,83,4,'8-Iron',7.00,'Hole'),(10,17,83,5,'Putter',6.36,'Bunker'),(10,17,83,6,'4-Hybrid',7.78,'Hole'),(10,17,83,9,'6-Iron',7.00,'Fairway'),(10,17,84,5,'5-Iron',7.30,'Hole'),(10,17,84,6,'5-Iron',9.13,'Hole'),(10,17,84,7,'3-Iron',6.64,'Fairway'),(10,17,84,8,'5-Hybrid',6.64,'Bunker'),(10,17,84,9,'1-Iron',7.30,'Hole'),(10,17,84,10,'5-Iron',6.64,'Fairway'),(10,17,85,2,'Putter',8.60,'Bunker'),(10,17,85,4,'5-Hybrid',7.82,'Penalty'),(10,17,85,7,'9-Iron',8.60,'Hole'),(10,17,85,8,'Driver',7.82,'Bunker'),(10,17,86,2,'3-Hybrid',10.00,'Fairway'),(10,17,86,6,'9-Iron',11.00,'Hole'),(10,17,86,8,'Driver',10.00,'Bunker'),(10,17,87,2,'9-Iron',0.00,'Penalty'),(10,17,87,3,'5-Hybrid',14.88,'Hole'),(10,17,87,4,'3-Hybrid',11.90,'Hole'),(10,17,87,5,'3-Iron',10.82,'Fairway'),(10,17,87,6,'5-Wood',9.92,'Fairway'),(10,17,87,7,'5-Hybrid',11.90,'Hole'),(10,17,87,8,'1-Iron',10.82,'Fairway'),(10,17,87,9,'5-Iron',10.82,'Bunker'),(10,17,88,2,'4-Iron',11.18,'Fairway'),(10,17,88,3,'4-Hybrid',0.00,'Penalty'),(10,17,88,4,'5-Hybrid',12.30,'Hole'),(10,17,88,5,'8-Iron',11.18,'Bunker'),(10,17,88,6,'Putter',10.25,'Bunker'),(10,17,88,7,'5-Hybrid',11.18,'Fairway'),(10,17,88,8,'Putter',0.00,'Penalty'),(10,17,89,2,'5-Hybrid',12.73,'Fairway'),(10,17,89,4,'1-Iron',12.73,'Fairway'),(10,17,89,7,'Driver',15.56,'Bunker'),(10,17,89,8,'Wedge',12.73,'Bunker'),(10,17,89,9,'9-Iron',12.73,'Fairway'),(10,17,89,10,'5-Wood',11.67,'Bunker'),(10,17,90,2,'5-Hybrid',14.55,'Fairway'),(10,17,90,3,'7-Iron',14.55,'Fairway'),(10,17,90,6,'6-Iron',17.78,'Hole'),(10,17,90,7,'7-Iron',16.00,'Fairway'),(10,17,90,8,'2-Iron',14.55,'Bunker'),(10,17,90,9,'5-Hybrid',14.55,'Bunker'),(10,18,73,1,'9-Iron',56.89,'Hole'),(10,18,73,2,'2-Iron',51.20,'Fairway'),(10,18,73,3,'9-Iron',46.55,'Bunker'),(10,18,73,5,'2-Iron',42.67,'Bunker'),(10,18,73,8,'5-Iron',56.89,'Hole'),(10,18,73,9,'Putter',51.20,'Hole'),(10,18,74,1,'4-Hybrid',16.55,'Bunker'),(10,18,74,2,'3-Wood',16.55,'Fairway'),(10,18,74,3,'3-Wood',20.22,'Hole'),(10,18,74,5,'9-Iron',16.55,'Fairway'),(10,18,74,7,'5-Hybrid',16.55,'Bunker'),(10,18,74,8,'Putter',16.55,'Fairway'),(10,18,74,9,'7-Iron',16.55,'Fairway'),(10,18,75,3,'9-Iron',9.89,'Hole'),(10,18,75,6,'7-Iron',8.09,'Fairway'),(10,18,75,7,'1-Iron',8.09,'Fairway'),(10,18,75,8,'1-Iron',8.09,'Bunker'),(10,18,76,3,'Putter',8.78,'Hole'),(10,18,76,5,'3-Iron',7.18,'Bunker'),(10,18,76,6,'3-Iron',7.18,'Fairway'),(10,18,76,7,'3-Wood',7.90,'Hole'),(10,18,76,10,'5-Hybrid',7.18,'Fairway'),(10,18,77,1,'3-Wood',6.67,'Fairway'),(10,18,77,2,'7-Iron',7.27,'Bunker'),(10,18,77,4,'6-Iron',8.00,'Hole'),(10,18,77,5,'Wedge',8.00,'Hole'),(10,18,77,6,'8-Iron',6.67,'Fairway'),(10,18,77,7,'7-Iron',7.27,'Fairway'),(10,18,77,9,'5-Wood',7.27,'Bunker'),(10,18,77,10,'3-Iron',7.27,'Fairway'),(10,18,78,1,'',9.78,'Hole'),(10,18,78,2,'4-Hybrid',8.80,'Fairway'),(10,18,78,8,'Driver',8.00,'Fairway'),(10,18,78,9,'2-Iron',8.00,'Penalty'),(10,18,78,10,'3-Hybrid',8.00,'Fairway'),(10,18,79,1,'7-Iron',10.75,'Hole'),(10,18,79,4,'2-Iron',7.17,'Bunker'),(10,18,79,6,'3-Wood',0.00,'Penalty'),(10,18,79,7,'3-Iron',8.60,'Hole'),(10,18,79,8,'Driver',8.60,'Hole'),(10,18,79,9,'3-Wood',7.82,'Fairway'),(10,18,79,10,'3-Wood',7.82,'Penalty'),(10,18,80,1,'6-Iron',7.64,'Fairway'),(10,18,80,3,'Putter',8.40,'Hole'),(10,18,80,4,'2-Iron',7.64,'Fairway'),(10,18,80,5,'5-Hybrid',7.64,'Fairway'),(10,18,80,7,'6-Iron',8.40,'Hole'),(10,18,80,8,'8-Iron',7.64,'Bunker'),(10,18,80,10,'Putter',7.64,'Fairway'),(10,18,81,1,'5-Iron',8.18,'Fairway'),(10,18,81,4,'Wedge',9.00,'Bunker'),(10,18,81,5,'9-Iron',9.00,'Fairway'),(10,18,81,7,'5-Hybrid',9.00,'Fairway'),(10,18,81,10,'Putter',8.18,'Fairway'),(10,18,82,3,'5-Hybrid',9.00,'Fairway'),(10,18,82,4,'6-Iron',0.00,'Penalty'),(10,18,82,7,'4-Hybrid',9.00,'Fairway'),(10,18,82,8,'6-Iron',11.00,'Bunker'),(10,18,82,9,'6-Iron',9.90,'Hole'),(10,18,83,2,'5-Hybrid',7.00,'Fairway'),(10,18,83,3,'5-Wood',6.36,'Bunker'),(10,18,83,7,'6-Iron',6.36,'Fairway'),(10,18,83,9,'Wedge',7.78,'Hole'),(10,18,84,1,'5-Iron',8.11,'Hole'),(10,18,84,2,'Driver',6.64,'Fairway'),(10,18,84,3,'3-Wood',6.64,'Bunker'),(10,18,84,8,'3-Hybrid',7.30,'Hole'),(10,18,84,10,'',6.08,'Fairway'),(10,18,85,3,'Putter',7.82,'Penalty'),(10,18,85,5,'3-Wood',7.17,'Bunker'),(10,18,85,6,'1-Iron',8.60,'Bunker'),(10,18,85,8,'7-Iron',7.82,'Fairway'),(10,18,86,1,'1-Iron',11.00,'Hole'),(10,18,86,2,'8-Iron',0.00,'Penalty'),(10,18,86,4,'Putter',10.00,'Bunker'),(10,18,86,6,'3-Wood',10.00,'Fairway'),(10,18,86,8,'9-Iron',9.17,'Bunker'),(10,18,86,9,'Wedge',13.75,'Hole'),(10,18,87,1,'4-Hybrid',11.90,'Hole'),(10,18,87,2,'5-Hybrid',11.90,'Hole'),(10,18,87,4,'5-Iron',10.82,'Fairway'),(10,18,87,7,'Wedge',11.90,'Hole'),(10,18,87,8,'9-Iron',11.90,'Hole'),(10,18,87,10,'3-Iron',10.82,'Bunker'),(10,18,88,1,'4-Iron',12.30,'Penalty'),(10,18,88,2,'3-Hybrid',12.30,'Hole'),(10,18,88,3,'Wedge',11.18,'Bunker'),(10,18,88,4,'4-Iron',12.30,'Hole'),(10,18,88,5,'1-Iron',12.30,'Hole'),(10,18,88,7,'7-Iron',10.25,'Fairway'),(10,18,88,9,'9-Iron',11.18,'Fairway'),(10,18,88,10,'3-Wood',12.30,'Hole'),(10,18,89,2,'8-Iron',12.73,'Fairway'),(10,18,89,5,'Wedge',0.00,'Penalty'),(10,18,89,7,'8-Iron',12.73,'Bunker'),(10,18,90,1,'',13.33,'Fairway'),(10,18,90,2,'9-Iron',14.55,'Fairway'),(10,18,90,3,'4-Hybrid',14.55,'Fairway'),(10,18,90,5,'3-Iron',14.55,'Fairway'),(10,18,90,8,'Putter',16.00,'Penalty'),(10,18,90,9,'7-Iron',16.00,'Bunker'),(10,18,90,10,'4-Hybrid',14.55,'Bunker'),(10,19,73,2,'8-Iron',56.89,'Hole'),(10,19,73,5,'3-Hybrid',46.55,'Bunker'),(10,19,73,7,'1-Iron',51.20,'Penalty'),(10,19,73,8,'4-Hybrid',0.00,'Penalty'),(10,19,73,9,'Putter',0.00,'Penalty'),(10,19,73,10,'6-Iron',51.20,'Hole'),(10,19,74,2,'7-Iron',18.20,'Fairway'),(10,19,74,5,'1-Iron',20.22,'Hole'),(10,19,74,7,'4-Iron',16.55,'Fairway'),(10,19,74,8,'3-Hybrid',18.20,'Hole'),(10,19,75,1,'4-Hybrid',8.90,'Hole'),(10,19,75,2,'3-Hybrid',9.89,'Hole'),(10,19,75,5,'2-Iron',8.09,'Bunker'),(10,19,75,6,'5-Iron',8.90,'Hole'),(10,19,75,8,'9-Iron',9.89,'Hole'),(10,19,75,10,'5-Hybrid',8.09,'Fairway'),(10,19,76,2,'8-Iron',6.58,'Bunker'),(10,19,76,3,'3-Iron',8.78,'Hole'),(10,19,76,4,'Putter',0.00,'Penalty'),(10,19,76,5,'9-Iron',7.18,'Fairway'),(10,19,76,7,'2-Iron',0.00,'Penalty'),(10,19,76,8,'8-Iron',7.18,'Bunker'),(10,19,76,9,'7-Iron',7.18,'Fairway'),(10,19,77,3,'7-Iron',0.00,'Penalty'),(10,19,77,4,'5-Iron',7.27,'Fairway'),(10,19,77,5,'7-Iron',7.27,'Fairway'),(10,19,77,6,'8-Iron',6.67,'Fairway'),(10,19,77,7,'2-Iron',7.27,'Fairway'),(10,19,77,8,'Driver',8.00,'Bunker'),(10,19,78,4,'5-Hybrid',8.80,'Hole'),(10,19,78,6,'3-Hybrid',8.00,'Fairway'),(10,19,78,7,'2-Iron',7.33,'Fairway'),(10,19,78,10,'7-Iron',8.00,'Fairway'),(10,19,79,3,'8-Iron',0.00,'Penalty'),(10,19,79,4,'5-Iron',7.82,'Fairway'),(10,19,79,7,'Driver',8.60,'Hole'),(10,19,79,8,'7-Iron',7.82,'Fairway'),(10,19,79,9,'3-Hybrid',7.82,'Fairway'),(10,19,80,2,'Wedge',7.64,'Bunker'),(10,19,80,3,'',7.64,'Fairway'),(10,19,80,6,'1-Iron',7.00,'Fairway'),(10,19,80,7,'8-Iron',0.00,'Penalty'),(10,19,80,8,'1-Iron',7.64,'Bunker'),(10,19,80,10,'3-Hybrid',7.64,'Bunker'),(10,19,81,1,'3-Wood',7.50,'Bunker'),(10,19,81,3,'6-Iron',9.00,'Hole'),(10,19,81,4,'1-Iron',7.50,'Bunker'),(10,19,81,5,'6-Iron',8.18,'Bunker'),(10,19,81,6,'',9.00,'Bunker'),(10,19,81,7,'Wedge',9.00,'Hole'),(10,19,81,8,'Putter',8.18,'Penalty'),(10,19,82,3,'5-Hybrid',9.90,'Hole'),(10,19,82,5,'1-Iron',9.90,'Fairway'),(10,19,82,8,'7-Iron',9.00,'Bunker'),(10,19,82,10,'5-Hybrid',9.90,'Fairway'),(10,19,83,1,'2-Iron',6.36,'Bunker'),(10,19,83,2,'Putter',6.36,'Bunker'),(10,19,83,3,'5-Hybrid',6.36,'Bunker'),(10,19,83,4,'5-Wood',6.36,'Fairway'),(10,19,83,6,'4-Hybrid',5.83,'Penalty'),(10,19,83,7,'8-Iron',7.00,'Hole'),(10,19,83,8,'4-Iron',7.78,'Hole'),(10,19,83,9,'Wedge',5.83,'Fairway'),(10,19,83,10,'4-Iron',7.00,'Bunker'),(10,19,84,2,'3-Wood',6.64,'Fairway'),(10,19,84,4,'5-Iron',6.64,'Fairway'),(10,19,84,5,'7-Iron',6.08,'Bunker'),(10,19,85,4,'4-Iron',7.82,'Fairway'),(10,19,85,6,'4-Iron',8.60,'Bunker'),(10,19,85,8,'',7.82,'Penalty'),(10,19,85,10,'9-Iron',7.17,'Penalty'),(10,19,86,1,'5-Wood',10.00,'Bunker'),(10,19,86,2,'7-Iron',11.00,'Hole'),(10,19,86,4,'Wedge',11.00,'Hole'),(10,19,86,5,'3-Hybrid',10.00,'Fairway'),(10,19,86,8,'1-Iron',0.00,'Penalty'),(10,19,86,10,'7-Iron',12.22,'Hole'),(10,19,87,1,'4-Iron',11.90,'Hole'),(10,19,87,4,'4-Hybrid',11.90,'Hole'),(10,19,87,5,'Putter',9.92,'Fairway'),(10,19,87,6,'2-Iron',11.90,'Fairway'),(10,19,87,7,'Putter',11.90,'Hole'),(10,19,88,2,'3-Hybrid',12.30,'Hole'),(10,19,88,4,'5-Hybrid',13.67,'Hole'),(10,19,88,5,'7-Iron',12.30,'Hole'),(10,19,88,8,'4-Hybrid',10.25,'Fairway'),(10,19,88,9,'5-Hybrid',11.18,'Fairway'),(10,19,88,10,'Wedge',11.18,'Bunker'),(10,19,89,2,'5-Hybrid',0.00,'Penalty'),(10,19,89,4,'4-Hybrid',14.00,'Bunker'),(10,19,89,5,'3-Hybrid',12.73,'Fairway'),(10,19,89,7,'3-Iron',15.56,'Hole'),(10,19,89,9,'3-Hybrid',14.00,'Hole'),(10,19,90,1,'1-Iron',14.55,'Penalty'),(10,19,90,2,'2-Iron',16.00,'Hole'),(10,19,90,5,'5-Wood',14.55,'Fairway'),(10,19,90,6,'1-Iron',13.33,'Bunker'),(10,19,90,7,'',16.00,'Hole'),(10,19,90,8,'5-Iron',16.00,'Hole'),(10,19,90,9,'3-Iron',14.55,'Penalty'),(10,20,73,1,'8-Iron',42.67,'Fairway'),(10,20,73,3,'6-Iron',0.00,'Penalty'),(10,20,73,4,'3-Iron',42.67,'Bunker'),(10,20,73,5,'',51.20,'Hole'),(10,20,73,7,'3-Wood',46.55,'Fairway'),(10,20,73,8,'3-Hybrid',42.67,'Fairway'),(10,20,73,9,'3-Hybrid',46.55,'Fairway'),(10,20,74,2,'2-Iron',15.17,'Fairway'),(10,20,74,3,'Putter',16.55,'Bunker'),(10,20,74,4,'',20.22,'Hole'),(10,20,74,5,'4-Iron',16.55,'Bunker'),(10,20,74,6,'Wedge',16.55,'Fairway'),(10,20,74,9,'5-Wood',20.22,'Hole'),(10,20,75,1,'3-Hybrid',8.90,'Bunker'),(10,20,75,2,'Putter',8.90,'Hole'),(10,20,75,4,'6-Iron',8.90,'Fairway'),(10,20,75,5,'3-Iron',8.09,'Penalty'),(10,20,75,7,'8-Iron',0.00,'Penalty'),(10,20,75,9,'',8.90,'Bunker'),(10,20,75,10,'3-Wood',8.09,'Bunker'),(10,20,76,2,'7-Iron',7.90,'Fairway'),(10,20,76,3,'',7.18,'Fairway'),(10,20,76,4,'4-Iron',7.18,'Bunker'),(10,20,76,5,'7-Iron',7.18,'Penalty'),(10,20,76,7,'4-Hybrid',7.18,'Fairway'),(10,20,77,1,'5-Hybrid',8.00,'Fairway'),(10,20,77,2,'3-Hybrid',7.27,'Fairway'),(10,20,77,3,'3-Iron',8.00,'Fairway'),(10,20,77,4,'1-Iron',10.00,'Hole'),(10,20,77,5,'4-Hybrid',8.00,'Fairway'),(10,20,77,7,'3-Hybrid',7.27,'Fairway'),(10,20,77,8,'6-Iron',7.27,'Fairway'),(10,20,77,10,'5-Hybrid',7.27,'Fairway'),(10,20,78,2,'5-Iron',0.00,'Penalty'),(10,20,78,5,'Driver',7.33,'Bunker'),(10,20,78,6,'2-Iron',8.80,'Fairway'),(10,20,78,8,'Driver',7.33,'Penalty'),(10,20,78,10,'Driver',7.33,'Fairway'),(10,20,79,1,'3-Hybrid',8.60,'Hole'),(10,20,79,3,'3-Wood',7.82,'Fairway'),(10,20,79,5,'Wedge',7.82,'Fairway'),(10,20,79,6,'9-Iron',8.60,'Hole'),(10,20,79,7,'Wedge',7.17,'Fairway'),(10,20,79,8,'',7.82,'Bunker'),(10,20,79,9,'5-Wood',10.75,'Hole'),(10,20,80,3,'Putter',7.64,'Fairway'),(10,20,80,4,'9-Iron',7.64,'Fairway'),(10,20,80,5,'9-Iron',8.40,'Bunker'),(10,20,80,6,'9-Iron',8.40,'Fairway'),(10,20,80,9,'4-Iron',7.00,'Fairway'),(10,20,81,4,'4-Iron',8.18,'Bunker'),(10,20,81,5,'3-Hybrid',10.00,'Hole'),(10,20,81,6,'2-Iron',8.18,'Fairway'),(10,20,81,7,'5-Hybrid',9.00,'Fairway'),(10,20,81,9,'6-Iron',7.50,'Fairway'),(10,20,81,10,'9-Iron',9.00,'Hole'),(10,20,82,1,'3-Hybrid',9.00,'Fairway'),(10,20,82,2,'2-Iron',9.00,'Fairway'),(10,20,82,3,'Wedge',11.00,'Hole'),(10,20,82,4,'',9.90,'Hole'),(10,20,82,6,'Wedge',9.90,'Hole'),(10,20,82,8,'8-Iron',9.90,'Hole'),(10,20,82,9,'7-Iron',9.00,'Fairway'),(10,20,82,10,'2-Iron',11.00,'Hole'),(10,20,83,1,'2-Iron',7.00,'Fairway'),(10,20,83,2,'5-Hybrid',7.00,'Fairway'),(10,20,83,4,'5-Iron',5.83,'Bunker'),(10,20,83,5,'8-Iron',6.36,'Fairway'),(10,20,83,6,'7-Iron',6.36,'Fairway'),(10,20,83,8,'1-Iron',7.00,'Hole'),(10,20,84,2,'5-Wood',6.64,'Fairway'),(10,20,84,3,'4-Iron',6.08,'Fairway'),(10,20,84,5,'1-Iron',6.64,'Fairway'),(10,20,84,6,'5-Iron',6.64,'Fairway'),(10,20,84,7,'Wedge',6.64,'Penalty'),(10,20,84,8,'Wedge',6.64,'Fairway'),(10,20,84,9,'9-Iron',6.64,'Fairway'),(10,20,84,10,'3-Hybrid',6.64,'Fairway'),(10,20,85,1,'5-Wood',8.60,'Hole'),(10,20,85,2,'1-Iron',7.82,'Fairway'),(10,20,85,5,'3-Iron',0.00,'Penalty'),(10,20,85,6,'5-Iron',7.82,'Penalty'),(10,20,85,7,'4-Iron',7.82,'Fairway'),(10,20,85,9,'2-Iron',8.60,'Hole'),(10,20,85,10,'Putter',8.60,'Hole'),(10,20,86,1,'5-Wood',11.00,'Hole'),(10,20,86,2,'Putter',9.17,'Fairway'),(10,20,86,3,'Putter',11.00,'Hole'),(10,20,86,4,'2-Iron',10.00,'Fairway'),(10,20,86,6,'Putter',9.17,'Bunker'),(10,20,86,7,'5-Hybrid',12.22,'Hole'),(10,20,86,8,'Wedge',10.00,'Fairway'),(10,20,86,9,'5-Hybrid',10.00,'Fairway'),(10,20,87,2,'4-Hybrid',11.90,'Hole'),(10,20,87,3,'7-Iron',0.00,'Penalty'),(10,20,87,4,'5-Hybrid',10.82,'Fairway'),(10,20,87,5,'',11.90,'Hole'),(10,20,87,6,'3-Wood',11.90,'Fairway'),(10,20,87,7,'',10.82,'Penalty'),(10,20,87,8,'8-Iron',10.82,'Fairway'),(10,20,87,10,'6-Iron',10.82,'Bunker'),(10,20,88,2,'1-Iron',12.30,'Bunker'),(10,20,88,4,'Wedge',10.25,'Fairway'),(10,20,88,5,'6-Iron',11.18,'Fairway'),(10,20,88,6,'7-Iron',10.25,'Fairway'),(10,20,88,7,'2-Iron',11.18,'Bunker'),(10,20,88,8,'3-Hybrid',11.18,'Fairway'),(10,20,88,9,'Wedge',11.18,'Penalty'),(10,20,88,10,'3-Iron',11.18,'Bunker'),(10,20,89,2,'5-Wood',12.73,'Penalty'),(10,20,89,3,'5-Hybrid',12.73,'Fairway'),(10,20,89,4,'5-Hybrid',0.00,'Penalty'),(10,20,89,5,'7-Iron',12.73,'Bunker'),(10,20,89,8,'3-Hybrid',14.00,'Fairway'),(10,20,89,9,'8-Iron',12.73,'Fairway'),(10,20,89,10,'9-Iron',15.56,'Hole'),(10,20,90,1,'3-Iron',16.00,'Hole'),(10,20,90,2,'7-Iron',14.55,'Bunker'),(10,20,90,3,'3-Hybrid',13.33,'Fairway'),(10,20,90,4,'9-Iron',14.55,'Fairway'),(10,20,90,6,'6-Iron',16.00,'Hole'),(10,20,90,7,'7-Iron',13.33,'Bunker'),(10,20,90,8,'1-Iron',16.00,'Hole'),(10,20,90,9,'4-Iron',16.00,'Fairway'),(10,20,90,10,'Driver',14.55,'Fairway'),(11,1,1,1,'5-Iron',5.36,'Penalty'),(11,1,1,2,'',4.92,'Fairway'),(11,1,1,4,'5-Iron',5.90,'Hole'),(11,1,1,5,'5-Iron',5.36,'Fairway'),(11,1,1,6,'',5.90,'Hole'),(11,1,1,8,'6-Iron',5.90,'Hole'),(11,1,2,1,'1-Iron',8.73,'Hole'),(11,1,2,2,'3-Wood',8.00,'Bunker'),(11,1,2,4,'3-Iron',8.73,'Hole'),(11,1,2,6,'3-Iron',8.00,'Fairway'),(11,1,2,7,'',8.73,'Fairway'),(11,1,2,8,'3-Hybrid',8.73,'Fairway'),(11,1,3,2,'Wedge',9.27,'Hole'),(11,1,3,3,'3-Iron',0.00,'Penalty'),(11,1,3,10,'4-Hybrid',10.20,'Hole'),(11,1,4,1,'3-Hybrid',7.55,'Hole'),(11,1,4,2,'9-Iron',8.30,'Fairway'),(11,1,4,3,'3-Iron',7.55,'Hole'),(11,1,4,4,'3-Wood',7.55,'Hole'),(11,1,4,6,'9-Iron',8.30,'Hole'),(11,1,4,8,'9-Iron',7.55,'Hole'),(11,1,4,9,'9-Iron',7.55,'Fairway'),(11,1,4,10,'2-Iron',7.55,'Hole'),(11,1,5,2,'1-Iron',6.27,'Fairway'),(11,1,5,3,'5-Hybrid',6.27,'Hole'),(11,1,5,7,'5-Iron',7.67,'Hole'),(11,1,5,8,'3-Iron',6.90,'Fairway'),(11,1,6,1,'6-Iron',4.83,'Bunker'),(11,1,6,5,'4-Hybrid',5.27,'Hole'),(11,1,6,7,'8-Iron',5.27,'Fairway'),(11,1,7,2,'6-Iron',8.50,'Hole'),(11,1,7,4,'1-Iron',7.73,'Fairway'),(11,1,7,5,'5-Hybrid',8.50,'Hole'),(11,1,7,9,'9-Iron',7.73,'Hole'),(11,1,8,1,'3-Wood',7.82,'Bunker'),(11,1,8,3,'4-Hybrid',7.82,'Hole'),(11,1,8,8,'5-Hybrid',7.82,'Bunker'),(11,1,8,9,'1-Iron',7.82,'Fairway'),(11,1,8,10,'7-Iron',7.82,'Fairway'),(11,1,9,1,'3-Wood',5.80,'Hole'),(11,1,9,2,'5-Wood',5.80,'Hole'),(11,1,9,3,'3-Wood',5.27,'Hole'),(11,1,9,5,'5-Wood',5.27,'Hole'),(11,1,9,10,'5-Iron',5.80,'Hole'),(11,1,10,1,'3-Iron',5.45,'Hole'),(11,1,10,3,'8-Iron',6.00,'Hole'),(11,1,10,5,'4-Hybrid',5.45,'Hole'),(11,1,10,8,'7-Iron',6.00,'Hole'),(11,1,10,10,'5-Hybrid',5.00,'Bunker'),(11,1,11,2,'3-Iron',7.25,'Fairway'),(11,1,11,7,'7-Iron',7.91,'Bunker'),(11,1,11,9,'7-Iron',7.91,'Hole'),(11,1,12,8,'7-Iron',7.09,'Hole'),(11,1,12,9,'Driver',7.09,'Hole'),(11,1,12,10,'7-Iron',6.50,'Bunker'),(11,1,13,1,'2-Iron',8.91,'Fairway'),(11,1,13,10,'2-Iron',8.91,'Hole'),(11,1,14,1,'5-Iron',9.09,'Fairway'),(11,1,14,3,'4-Hybrid',9.09,'Bunker'),(11,1,14,8,'',10.00,'Hole'),(11,1,15,1,'3-Hybrid',8.83,'Penalty'),(11,1,15,2,'3-Hybrid',9.64,'Hole'),(11,1,15,3,'',9.64,'Penalty'),(11,1,15,4,'3-Wood',8.83,'Fairway'),(11,1,15,5,'2-Iron',9.64,'Fairway'),(11,1,15,6,'5-Hybrid',9.64,'Hole'),(11,1,15,8,'3-Wood',9.64,'Hole'),(11,1,15,9,'',11.78,'Hole'),(11,1,16,2,'',9.90,'Hole'),(11,1,16,6,'Wedge',9.00,'Hole'),(11,1,16,8,'5-Hybrid',8.25,'Fairway'),(11,1,16,9,'5-Iron',9.00,'Hole'),(11,1,16,10,'2-Iron',9.00,'Fairway'),(11,1,17,1,'5-Hybrid',9.00,'Fairway'),(11,1,17,3,'3-Iron',9.82,'Fairway'),(11,1,17,6,'5-Wood',9.82,'Fairway'),(11,1,17,9,'5-Iron',10.80,'Hole'),(11,1,17,10,'5-Hybrid',9.82,'Hole'),(11,1,18,3,'9-Iron',13.00,'Hole'),(11,1,18,5,'1-Iron',11.82,'Fairway'),(11,1,18,7,'3-Hybrid',11.82,'Fairway'),(11,1,18,9,'2-Iron',10.83,'Fairway'),(11,2,1,7,'1-Iron',5.36,'Hole'),(11,2,1,8,'9-Iron',5.36,'Hole'),(11,2,2,2,'9-Iron',9.60,'Hole'),(11,2,2,6,'5-Iron',8.73,'Bunker'),(11,2,2,10,'9-Iron',8.73,'Penalty'),(11,2,3,2,'6-Iron',9.27,'Bunker'),(11,2,3,3,'1-Iron',9.27,'Hole'),(11,2,3,7,'4-Hybrid',9.27,'Hole'),(11,2,3,9,'8-Iron',9.27,'Hole'),(11,2,3,10,'6-Iron',8.50,'Bunker'),(11,2,4,3,'2-Iron',0.00,'Penalty'),(11,2,4,4,'Wedge',6.92,'Penalty'),(11,2,4,5,'Driver',7.55,'Fairway'),(11,2,4,6,'5-Hybrid',6.92,'Bunker'),(11,2,4,7,'7-Iron',7.55,'Hole'),(11,2,4,8,'7-Iron',8.30,'Hole'),(11,2,4,9,'',6.92,'Fairway'),(11,2,5,1,'3-Wood',6.90,'Hole'),(11,2,5,2,'1-Iron',6.27,'Hole'),(11,2,5,3,'1-Iron',6.90,'Hole'),(11,2,5,4,'3-Hybrid',5.75,'Fairway'),(11,2,5,9,'Wedge',6.90,'Hole'),(11,2,6,1,'1-Iron',5.27,'Fairway'),(11,2,6,6,'5-Hybrid',5.27,'Hole'),(11,2,6,9,'9-Iron',5.27,'Bunker'),(11,2,7,4,'5-Wood',7.73,'Hole'),(11,2,7,6,'5-Hybrid',7.08,'Penalty'),(11,2,7,9,'3-Iron',7.73,'Hole'),(11,2,7,10,'Wedge',7.73,'Hole'),(11,2,8,2,'3-Hybrid',7.82,'Bunker'),(11,2,8,3,'4-Hybrid',7.17,'Bunker'),(11,2,8,4,'9-Iron',7.82,'Penalty'),(11,2,8,8,'Wedge',8.60,'Hole'),(11,2,8,9,'6-Iron',7.82,'Hole'),(11,2,9,4,'Wedge',5.80,'Fairway'),(11,2,9,5,'8-Iron',5.27,'Bunker'),(11,2,9,6,'5-Hybrid',5.27,'Bunker'),(11,2,9,8,'5-Iron',5.27,'Hole'),(11,2,9,9,'4-Hybrid',5.27,'Bunker'),(11,2,10,1,'Putter',5.45,'Hole'),(11,2,10,3,'5-Hybrid',5.00,'Fairway'),(11,2,10,6,'4-Hybrid',5.00,'Bunker'),(11,2,11,2,'8-Iron',7.25,'Bunker'),(11,2,11,4,'3-Wood',7.91,'Fairway'),(11,2,11,5,'Driver',7.91,'Bunker'),(11,2,11,6,'5-Wood',7.91,'Bunker'),(11,2,11,7,'5-Iron',7.91,'Hole'),(11,2,11,8,'3-Iron',8.70,'Hole'),(11,2,12,1,'Putter',7.09,'Hole'),(11,2,12,2,'8-Iron',7.09,'Hole'),(11,2,12,6,'7-Iron',7.09,'Fairway'),(11,2,12,10,'Putter',0.00,'Penalty'),(11,2,13,2,'3-Hybrid',8.91,'Hole'),(11,2,13,3,'5-Wood',0.00,'Penalty'),(11,2,13,5,'7-Iron',8.91,'Hole'),(11,2,13,6,'9-Iron',8.91,'Hole'),(11,2,13,8,'4-Iron',10.89,'Hole'),(11,2,14,5,'4-Iron',9.09,'Hole'),(11,2,14,6,'9-Iron',9.09,'Bunker'),(11,2,14,7,'9-Iron',9.09,'Fairway'),(11,2,14,8,'1-Iron',9.09,'Hole'),(11,2,14,9,'Putter',9.09,'Hole'),(11,2,15,2,'Wedge',9.64,'Hole'),(11,2,15,5,'4-Iron',9.64,'Fairway'),(11,2,15,6,'3-Hybrid',11.78,'Hole'),(11,2,15,7,'8-Iron',10.60,'Hole'),(11,2,15,9,'3-Wood',8.83,'Bunker'),(11,2,16,1,'Putter',8.25,'Fairway'),(11,2,16,2,'9-Iron',0.00,'Penalty'),(11,2,16,3,'7-Iron',9.90,'Hole'),(11,2,16,6,'2-Iron',9.00,'Penalty'),(11,2,16,7,'Driver',9.90,'Hole'),(11,2,17,3,'4-Iron',9.82,'Hole'),(11,2,17,8,'5-Wood',0.00,'Penalty'),(11,2,17,9,'3-Wood',9.82,'Fairway'),(11,2,18,2,'8-Iron',11.82,'Fairway'),(11,2,18,6,'3-Wood',11.82,'Fairway'),(11,3,1,3,'5-Iron',4.92,'Bunker'),(11,3,1,9,'5-Wood',5.90,'Hole'),(11,3,1,10,'7-Iron',4.92,'Bunker'),(11,3,2,3,'7-Iron',8.00,'Fairway'),(11,3,2,4,'3-Hybrid',9.60,'Fairway'),(11,3,2,6,'4-Hybrid',8.73,'Hole'),(11,3,2,7,'',8.73,'Hole'),(11,3,3,2,'8-Iron',9.27,'Hole'),(11,3,3,3,'Wedge',9.27,'Hole'),(11,3,3,5,'Driver',9.27,'Hole'),(11,3,3,7,'3-Wood',9.27,'Fairway'),(11,3,3,8,'5-Hybrid',9.27,'Bunker'),(11,3,3,9,'4-Iron',9.27,'Hole'),(11,3,4,1,'3-Hybrid',7.55,'Hole'),(11,3,4,4,'4-Iron',0.00,'Penalty'),(11,3,4,5,'Wedge',8.30,'Hole'),(11,3,4,7,'9-Iron',7.55,'Hole'),(11,3,4,10,'3-Hybrid',7.55,'Hole'),(11,3,5,1,'8-Iron',6.27,'Hole'),(11,3,5,5,'4-Hybrid',6.90,'Hole'),(11,3,5,8,'6-Iron',6.27,'Bunker'),(11,3,6,1,'Putter',4.83,'Fairway'),(11,3,7,1,'1-Iron',7.73,'Hole'),(11,3,7,2,'7-Iron',7.73,'Hole'),(11,3,7,5,'Putter',8.50,'Hole'),(11,3,7,6,'7-Iron',7.73,'Hole'),(11,3,7,7,'9-Iron',7.73,'Hole'),(11,3,8,3,'3-Wood',7.82,'Hole'),(11,3,8,4,'9-Iron',7.82,'Hole'),(11,3,8,5,'4-Hybrid',7.17,'Bunker'),(11,3,8,6,'9-Iron',8.60,'Fairway'),(11,3,8,9,'5-Hybrid',8.60,'Hole'),(11,3,9,5,'Wedge',0.00,'Penalty'),(11,3,9,7,'Driver',5.27,'Hole'),(11,3,9,8,'4-Iron',5.27,'Hole'),(11,3,10,5,'3-Wood',6.00,'Hole'),(11,3,10,6,'Putter',6.00,'Hole'),(11,3,10,9,'5-Hybrid',5.45,'Hole'),(11,3,11,3,'5-Wood',9.67,'Hole'),(11,3,11,4,'7-Iron',7.91,'Hole'),(11,3,11,6,'5-Wood',7.91,'Fairway'),(11,3,11,9,'7-Iron',7.91,'Hole'),(11,3,12,4,'8-Iron',7.09,'Hole'),(11,3,12,7,'1-Iron',7.09,'Hole'),(11,3,12,8,'7-Iron',7.80,'Hole'),(11,3,13,1,'9-Iron',8.91,'Fairway'),(11,3,13,2,'4-Iron',8.91,'Hole'),(11,3,13,3,'4-Hybrid',8.91,'Hole'),(11,3,13,4,'5-Iron',8.91,'Bunker'),(11,3,13,5,'8-Iron',8.17,'Fairway'),(11,3,13,7,'4-Hybrid',9.80,'Hole'),(11,3,13,9,'Driver',8.91,'Hole'),(11,3,14,1,'Wedge',8.33,'Bunker'),(11,3,14,3,'5-Hybrid',9.09,'Fairway'),(11,3,14,4,'6-Iron',9.09,'Hole'),(11,3,14,6,'7-Iron',8.33,'Fairway'),(11,3,14,7,'6-Iron',9.09,'Hole'),(11,3,14,9,'1-Iron',10.00,'Hole'),(11,3,15,1,'5-Hybrid',9.64,'Hole'),(11,3,15,4,'5-Iron',9.64,'Hole'),(11,3,15,5,'5-Iron',9.64,'Bunker'),(11,3,15,6,'5-Iron',9.64,'Hole'),(11,3,15,8,'1-Iron',9.64,'Bunker'),(11,3,15,9,'4-Iron',0.00,'Penalty'),(11,3,16,1,'1-Iron',9.00,'Hole'),(11,3,16,8,'1-Iron',9.90,'Hole'),(11,3,17,1,'4-Iron',9.82,'Bunker'),(11,3,17,3,'Putter',9.82,'Hole'),(11,3,17,6,'Putter',9.82,'Hole'),(11,3,17,9,'3-Hybrid',9.82,'Hole'),(11,3,18,4,'5-Wood',11.82,'Fairway'),(11,3,18,5,'3-Wood',11.82,'Hole'),(11,3,18,7,'5-Iron',11.82,'Fairway'),(11,3,18,8,'Putter',11.82,'Fairway'),(11,3,18,9,'Putter',0.00,'Penalty'),(11,3,18,10,'6-Iron',11.82,'Fairway'),(11,4,1,2,'5-Hybrid',5.36,'Fairway'),(11,4,1,8,'3-Wood',5.36,'Bunker'),(11,4,1,10,'Wedge',0.00,'Penalty'),(11,4,2,1,'6-Iron',8.73,'Hole'),(11,4,2,3,'Wedge',8.00,'Fairway'),(11,4,2,4,'2-Iron',9.60,'Hole'),(11,4,2,5,'5-Iron',9.60,'Hole'),(11,4,2,6,'6-Iron',8.00,'Bunker'),(11,4,2,7,'Wedge',8.73,'Hole'),(11,4,2,9,'5-Hybrid',8.73,'Hole'),(11,4,3,1,'5-Hybrid',9.27,'Hole'),(11,4,3,6,'Wedge',9.27,'Hole'),(11,4,3,7,'4-Iron',9.27,'Hole'),(11,4,3,8,'4-Iron',11.33,'Hole'),(11,4,4,2,'9-Iron',9.22,'Hole'),(11,4,4,3,'3-Iron',8.30,'Hole'),(11,4,4,4,'5-Iron',7.55,'Hole'),(11,4,4,8,'8-Iron',6.92,'Fairway'),(11,4,4,9,'7-Iron',8.30,'Hole'),(11,4,5,2,'5-Wood',6.90,'Hole'),(11,4,5,5,'5-Wood',6.27,'Hole'),(11,4,6,1,'5-Hybrid',4.83,'Penalty'),(11,4,6,2,'3-Iron',4.83,'Fairway'),(11,4,6,3,'3-Iron',5.80,'Hole'),(11,4,6,6,'Driver',5.27,'Bunker'),(11,4,6,9,'6-Iron',5.80,'Hole'),(11,4,7,3,'3-Wood',7.73,'Hole'),(11,4,7,7,'3-Wood',7.73,'Bunker'),(11,4,7,9,'4-Hybrid',7.73,'Hole'),(11,4,7,10,'5-Iron',8.50,'Hole'),(11,4,8,4,'1-Iron',7.82,'Fairway'),(11,4,8,5,'7-Iron',7.82,'Fairway'),(11,4,8,6,'Driver',0.00,'Penalty'),(11,4,8,8,'5-Wood',7.17,'Fairway'),(11,4,8,9,'Wedge',7.82,'Penalty'),(11,4,8,10,'1-Iron',7.17,'Bunker'),(11,4,9,2,'6-Iron',5.27,'Hole'),(11,4,9,7,'',5.27,'Hole'),(11,4,9,9,'3-Hybrid',5.27,'Hole'),(11,4,10,6,'1-Iron',5.00,'Bunker'),(11,4,10,8,'5-Hybrid',5.00,'Fairway'),(11,4,11,2,'6-Iron',7.91,'Hole'),(11,4,11,6,'',7.91,'Hole'),(11,4,12,2,'5-Iron',7.09,'Hole'),(11,4,12,3,'5-Wood',7.09,'Fairway'),(11,4,12,4,'6-Iron',7.09,'Hole'),(11,4,12,5,'7-Iron',7.09,'Hole'),(11,4,13,1,'Wedge',8.91,'Fairway'),(11,4,13,2,'3-Wood',8.91,'Hole'),(11,4,14,1,'8-Iron',9.09,'Hole'),(11,4,14,7,'5-Wood',8.33,'Bunker'),(11,4,14,8,'4-Iron',9.09,'Hole'),(11,4,15,6,'1-Iron',9.64,'Penalty'),(11,4,16,2,'9-Iron',9.90,'Hole'),(11,4,16,4,'3-Hybrid',8.25,'Fairway'),(11,4,17,1,'4-Hybrid',9.82,'Hole'),(11,4,17,6,'',9.82,'Fairway'),(11,4,17,7,'3-Iron',10.80,'Hole'),(11,4,17,8,'8-Iron',9.82,'Hole'),(11,4,17,9,'4-Hybrid',9.82,'Hole'),(11,4,18,1,'4-Hybrid',11.82,'Bunker'),(11,4,18,5,'3-Wood',11.82,'Fairway'),(11,4,18,7,'3-Wood',11.82,'Fairway'),(11,4,18,8,'5-Wood',13.00,'Hole'),(11,4,18,10,'8-Iron',11.82,'Fairway'),(11,5,19,6,'4-Iron',5.64,'Fairway'),(11,5,19,7,'Putter',5.64,'Hole'),(11,5,19,8,'7-Iron',5.64,'Hole'),(11,5,20,3,'3-Hybrid',8.00,'Hole'),(11,5,20,4,'3-Iron',8.00,'Fairway'),(11,5,20,7,'Wedge',7.33,'Penalty'),(11,5,20,8,'5-Iron',8.00,'Fairway'),(11,5,21,2,'',8.40,'Bunker'),(11,5,21,3,'2-Iron',7.64,'Bunker'),(11,5,21,4,'3-Iron',8.40,'Hole'),(11,5,21,5,'Putter',7.64,'Hole'),(11,5,21,6,'Wedge',7.64,'Hole'),(11,5,21,8,'8-Iron',0.00,'Penalty'),(11,5,21,9,'5-Wood',8.40,'Bunker'),(11,5,22,4,'5-Iron',8.91,'Hole'),(11,5,22,7,'3-Wood',9.80,'Hole'),(11,5,22,9,'3-Hybrid',8.91,'Fairway'),(11,5,23,2,'5-Hybrid',9.09,'Hole'),(11,5,23,3,'3-Wood',9.09,'Bunker'),(11,5,23,4,'5-Iron',10.00,'Hole'),(11,5,23,6,'Wedge',10.00,'Hole'),(11,5,23,7,'2-Iron',9.09,'Hole'),(11,5,23,9,'7-Iron',9.09,'Hole'),(11,5,23,10,'8-Iron',9.09,'Fairway'),(11,5,24,1,'5-Wood',8.70,'Hole'),(11,5,24,9,'Wedge',8.70,'Fairway'),(11,5,24,10,'2-Iron',7.91,'Hole'),(11,5,25,1,'Wedge',7.82,'Hole'),(11,5,25,4,'6-Iron',7.82,'Bunker'),(11,5,25,5,'3-Wood',8.60,'Hole'),(11,5,25,7,'5-Wood',7.17,'Bunker'),(11,5,25,8,'8-Iron',9.56,'Hole'),(11,5,25,9,'3-Iron',8.60,'Hole'),(11,5,25,10,'3-Iron',7.82,'Hole'),(11,5,26,2,'9-Iron',8.30,'Hole'),(11,5,26,5,'Wedge',0.00,'Penalty'),(11,5,26,7,'3-Iron',7.55,'Bunker'),(11,5,26,8,'5-Wood',7.55,'Bunker'),(11,5,27,2,'3-Wood',7.73,'Hole'),(11,5,27,4,'',7.73,'Bunker'),(11,5,27,5,'4-Iron',7.73,'Bunker'),(11,5,28,4,'3-Hybrid',9.10,'Fairway'),(11,5,28,7,'Putter',9.10,'Hole'),(11,5,29,1,'8-Iron',7.18,'Hole'),(11,5,29,4,'3-Iron',7.18,'Fairway'),(11,5,29,6,'Putter',7.18,'Hole'),(11,5,29,7,'6-Iron',7.18,'Bunker'),(11,5,29,9,'3-Iron',7.90,'Hole'),(11,5,30,1,'4-Iron',7.36,'Penalty'),(11,5,30,7,'7-Iron',6.75,'Fairway'),(11,5,30,8,'1-Iron',0.00,'Penalty'),(11,5,31,1,'1-Iron',5.83,'Bunker'),(11,5,31,3,'4-Iron',6.36,'Fairway'),(11,5,31,4,'5-Wood',5.83,'Fairway'),(11,5,31,6,'Putter',0.00,'Penalty'),(11,5,31,8,'Putter',6.36,'Penalty'),(11,5,31,10,'8-Iron',5.83,'Bunker'),(11,5,32,2,'3-Hybrid',8.27,'Fairway'),(11,5,32,3,'5-Hybrid',7.58,'Bunker'),(11,5,32,5,'5-Wood',8.27,'Hole'),(11,5,32,10,'9-Iron',8.27,'Hole'),(11,5,33,3,'Wedge',0.00,'Penalty'),(11,5,33,4,'4-Iron',11.00,'Hole'),(11,5,33,5,'5-Hybrid',10.08,'Bunker'),(11,5,33,6,'4-Iron',11.00,'Hole'),(11,5,33,8,'Putter',11.00,'Hole'),(11,5,33,10,'3-Iron',11.00,'Hole'),(11,5,34,1,'9-Iron',9.91,'Fairway'),(11,5,34,4,'1-Iron',9.91,'Penalty'),(11,5,34,5,'5-Wood',10.90,'Hole'),(11,5,35,2,'5-Hybrid',10.91,'Hole'),(11,5,35,4,'5-Hybrid',10.91,'Hole'),(11,5,35,5,'2-Iron',10.91,'Fairway'),(11,5,35,7,'5-Hybrid',0.00,'Penalty'),(11,5,35,10,'9-Iron',10.91,'Hole'),(11,5,36,2,'3-Iron',13.64,'Hole'),(11,5,36,3,'3-Hybrid',13.64,'Fairway'),(11,5,36,4,'5-Iron',15.00,'Fairway'),(11,5,36,8,'5-Wood',13.64,'Hole'),(11,6,19,3,'',5.64,'Hole'),(11,6,19,5,'3-Hybrid',5.17,'Fairway'),(11,6,19,6,'3-Wood',5.64,'Hole'),(11,6,19,10,'5-Iron',5.64,'Bunker'),(11,6,20,4,'3-Wood',8.00,'Hole'),(11,6,21,2,'4-Hybrid',7.64,'Hole'),(11,6,21,4,'Wedge',7.64,'Fairway'),(11,6,21,5,'Driver',7.00,'Fairway'),(11,6,21,6,'Putter',8.40,'Hole'),(11,6,21,10,'Driver',7.64,'Hole'),(11,6,22,1,'7-Iron',8.91,'Hole'),(11,6,22,3,'3-Iron',8.17,'Fairway'),(11,6,22,4,'Putter',8.91,'Hole'),(11,6,22,5,'Putter',9.80,'Hole'),(11,6,22,6,'1-Iron',9.80,'Hole'),(11,6,22,7,'6-Iron',8.91,'Hole'),(11,6,22,10,'Putter',9.80,'Hole'),(11,6,23,5,'1-Iron',8.33,'Bunker'),(11,6,23,8,'9-Iron',9.09,'Hole'),(11,6,24,1,'4-Iron',7.91,'Hole'),(11,6,24,2,'1-Iron',7.25,'Fairway'),(11,6,24,6,'1-Iron',7.91,'Fairway'),(11,6,24,7,'Putter',7.91,'Fairway'),(11,6,24,9,'Wedge',7.91,'Hole'),(11,6,25,1,'1-Iron',7.17,'Fairway'),(11,6,25,4,'3-Hybrid',7.17,'Fairway'),(11,6,25,6,'1-Iron',0.00,'Penalty'),(11,6,26,1,'7-Iron',6.92,'Fairway'),(11,6,26,2,'Driver',9.22,'Hole'),(11,6,26,5,'5-Wood',6.92,'Bunker'),(11,6,26,10,'5-Hybrid',7.55,'Hole'),(11,6,27,1,'Putter',7.73,'Fairway'),(11,6,27,3,'4-Iron',7.08,'Fairway'),(11,6,28,1,'1-Iron',0.00,'Penalty'),(11,6,28,6,'5-Iron',8.27,'Hole'),(11,6,28,7,'7-Iron',8.27,'Hole'),(11,6,28,8,'6-Iron',8.27,'Fairway'),(11,6,28,9,'7-Iron',8.27,'Fairway'),(11,6,28,10,'3-Hybrid',8.27,'Hole'),(11,6,29,6,'3-Iron',0.00,'Penalty'),(11,6,30,7,'',0.00,'Penalty'),(11,6,30,9,'3-Iron',6.75,'Fairway'),(11,6,30,10,'4-Iron',7.36,'Fairway'),(11,6,31,2,'3-Wood',6.36,'Hole'),(11,6,31,5,'4-Iron',6.36,'Fairway'),(11,6,31,6,'4-Iron',6.36,'Fairway'),(11,6,31,7,'5-Hybrid',6.36,'Hole'),(11,6,31,8,'3-Wood',6.36,'Fairway'),(11,6,31,9,'7-Iron',6.36,'Hole'),(11,6,31,10,'7-Iron',6.36,'Hole'),(11,6,32,2,'1-Iron',8.27,'Fairway'),(11,6,32,3,'Putter',7.58,'Bunker'),(11,6,32,5,'3-Hybrid',9.10,'Hole'),(11,6,32,6,'1-Iron',7.58,'Bunker'),(11,6,32,7,'2-Iron',10.11,'Hole'),(11,6,32,8,'Wedge',9.10,'Hole'),(11,6,32,10,'4-Hybrid',7.58,'Fairway'),(11,6,33,4,'3-Wood',12.10,'Hole'),(11,6,33,6,'Wedge',10.08,'Penalty'),(11,6,33,7,'5-Hybrid',10.08,'Fairway'),(11,6,33,8,'Putter',11.00,'Hole'),(11,6,33,9,'4-Hybrid',11.00,'Hole'),(11,6,34,6,'',10.90,'Hole'),(11,6,34,7,'Driver',9.91,'Hole'),(11,6,34,9,'3-Iron',10.90,'Hole'),(11,6,34,10,'1-Iron',9.08,'Fairway'),(11,6,35,1,'4-Hybrid',12.00,'Fairway'),(11,6,35,3,'5-Wood',10.91,'Hole'),(11,6,35,7,'Putter',10.91,'Fairway'),(11,6,35,9,'9-Iron',13.33,'Hole'),(11,6,36,3,'3-Hybrid',13.64,'Fairway'),(11,6,36,4,'Putter',13.64,'Hole'),(11,6,36,5,'Wedge',13.64,'Hole'),(11,7,19,1,'8-Iron',5.64,'Hole'),(11,7,19,2,'6-Iron',6.89,'Hole'),(11,7,19,3,'5-Iron',5.64,'Hole'),(11,7,19,4,'9-Iron',5.64,'Hole'),(11,7,19,5,'4-Hybrid',0.00,'Penalty'),(11,7,19,7,'9-Iron',6.20,'Hole'),(11,7,19,10,'9-Iron',5.17,'Fairway'),(11,7,20,6,'5-Iron',8.80,'Hole'),(11,7,20,7,'',8.00,'Hole'),(11,7,21,2,'2-Iron',8.40,'Hole'),(11,7,21,4,'4-Iron',7.64,'Bunker'),(11,7,21,5,'1-Iron',7.64,'Fairway'),(11,7,21,8,'2-Iron',7.64,'Bunker'),(11,7,21,9,'7-Iron',7.64,'Hole'),(11,7,21,10,'Putter',7.00,'Fairway'),(11,7,22,5,'8-Iron',10.89,'Hole'),(11,7,22,7,'6-Iron',8.91,'Fairway'),(11,7,22,8,'3-Hybrid',8.91,'Hole'),(11,7,23,1,'3-Iron',9.09,'Hole'),(11,7,23,2,'7-Iron',8.33,'Bunker'),(11,7,23,4,'4-Hybrid',9.09,'Fairway'),(11,7,23,5,'3-Iron',9.09,'Hole'),(11,7,23,8,'',9.09,'Hole'),(11,7,24,3,'Wedge',7.91,'Bunker'),(11,7,24,5,'4-Iron',7.25,'Fairway'),(11,7,24,7,'9-Iron',7.91,'Hole'),(11,7,24,8,'7-Iron',7.91,'Fairway'),(11,7,25,2,'3-Iron',7.82,'Fairway'),(11,7,25,3,'1-Iron',7.82,'Fairway'),(11,7,25,4,'4-Hybrid',7.82,'Hole'),(11,7,25,5,'4-Hybrid',7.82,'Hole'),(11,7,25,8,'7-Iron',7.17,'Bunker'),(11,7,25,10,'7-Iron',7.82,'Fairway'),(11,7,26,2,'3-Wood',6.92,'Penalty'),(11,7,26,5,'6-Iron',6.92,'Penalty'),(11,7,26,6,'4-Hybrid',7.55,'Hole'),(11,7,26,9,'9-Iron',8.30,'Hole'),(11,7,27,3,'5-Iron',7.08,'Fairway'),(11,7,27,5,'2-Iron',8.50,'Hole'),(11,7,27,6,'Putter',7.73,'Hole'),(11,7,27,7,'4-Hybrid',8.50,'Hole'),(11,7,27,8,'7-Iron',7.08,'Fairway'),(11,7,28,7,'5-Hybrid',9.10,'Hole'),(11,7,29,7,'1-Iron',8.78,'Hole'),(11,7,29,8,'3-Hybrid',7.90,'Hole'),(11,7,29,9,'5-Wood',8.78,'Hole'),(11,7,30,1,'8-Iron',6.75,'Fairway'),(11,7,30,2,'4-Iron',6.75,'Fairway'),(11,7,30,5,'2-Iron',0.00,'Penalty'),(11,7,30,6,'9-Iron',7.36,'Hole'),(11,7,30,8,'4-Hybrid',8.10,'Hole'),(11,7,30,9,'6-Iron',7.36,'Hole'),(11,7,31,3,'9-Iron',6.36,'Fairway'),(11,7,31,4,'3-Iron',6.36,'Bunker'),(11,7,32,1,'6-Iron',9.10,'Hole'),(11,7,32,5,'1-Iron',7.58,'Bunker'),(11,7,32,6,'3-Hybrid',0.00,'Penalty'),(11,7,32,7,'2-Iron',8.27,'Fairway'),(11,7,32,10,'5-Iron',8.27,'Hole'),(11,7,33,6,'1-Iron',11.00,'Hole'),(11,7,33,9,'6-Iron',11.00,'Fairway'),(11,7,33,10,'Wedge',12.10,'Hole'),(11,7,34,1,'7-Iron',9.91,'Fairway'),(11,7,34,4,'Driver',9.91,'Bunker'),(11,7,35,1,'8-Iron',12.00,'Hole'),(11,7,35,3,'4-Iron',10.91,'Hole'),(11,7,35,6,'6-Iron',10.91,'Hole'),(11,7,35,7,'7-Iron',12.00,'Hole'),(11,7,35,9,'9-Iron',10.91,'Bunker'),(11,7,35,10,'5-Iron',10.91,'Hole'),(11,7,36,1,'5-Wood',13.64,'Fairway'),(11,7,36,2,'Wedge',13.64,'Fairway'),(11,7,36,4,'5-Wood',15.00,'Hole'),(11,7,36,6,'1-Iron',13.64,'Hole'),(11,7,36,8,'2-Iron',15.00,'Hole'),(11,8,19,3,'7-Iron',5.17,'Bunker'),(11,8,19,4,'4-Hybrid',5.17,'Fairway'),(11,8,19,6,'1-Iron',5.64,'Bunker'),(11,8,20,1,'Putter',8.00,'Hole'),(11,8,20,5,'5-Iron',8.80,'Hole'),(11,8,20,6,'Wedge',8.80,'Hole'),(11,8,21,3,'9-Iron',8.40,'Fairway'),(11,8,21,4,'9-Iron',7.64,'Fairway'),(11,8,21,5,'4-Hybrid',7.64,'Hole'),(11,8,21,6,'4-Hybrid',7.64,'Fairway'),(11,8,21,10,'9-Iron',8.40,'Hole'),(11,8,22,1,'8-Iron',9.80,'Hole'),(11,8,22,2,'9-Iron',9.80,'Fairway'),(11,8,22,6,'4-Iron',0.00,'Penalty'),(11,8,22,7,'9-Iron',8.17,'Fairway'),(11,8,22,8,'5-Iron',8.91,'Fairway'),(11,8,23,4,'5-Iron',9.09,'Fairway'),(11,8,23,6,'5-Wood',10.00,'Hole'),(11,8,23,7,'7-Iron',8.33,'Fairway'),(11,8,23,9,'9-Iron',10.00,'Hole'),(11,8,24,2,'2-Iron',7.91,'Hole'),(11,8,24,3,'4-Iron',7.91,'Bunker'),(11,8,24,5,'4-Hybrid',7.91,'Hole'),(11,8,24,6,'6-Iron',0.00,'Penalty'),(11,8,24,7,'4-Hybrid',7.91,'Hole'),(11,8,24,9,'4-Hybrid',7.25,'Fairway'),(11,8,25,2,'Wedge',7.17,'Bunker'),(11,8,26,1,'2-Iron',7.55,'Hole'),(11,8,26,2,'4-Hybrid',6.92,'Fairway'),(11,8,26,4,'9-Iron',7.55,'Hole'),(11,8,26,5,'3-Iron',6.92,'Fairway'),(11,8,26,6,'7-Iron',7.55,'Hole'),(11,8,26,7,'4-Hybrid',7.55,'Hole'),(11,8,27,1,'5-Iron',7.08,'Fairway'),(11,8,27,5,'7-Iron',7.73,'Hole'),(11,8,27,7,'5-Hybrid',7.08,'Bunker'),(11,8,27,8,'6-Iron',7.73,'Fairway'),(11,8,28,3,'Wedge',8.27,'Fairway'),(11,8,28,4,'4-Hybrid',7.58,'Fairway'),(11,8,28,5,'5-Hybrid',8.27,'Hole'),(11,8,28,6,'7-Iron',8.27,'Bunker'),(11,8,28,7,'5-Iron',8.27,'Fairway'),(11,8,29,1,'7-Iron',7.18,'Hole'),(11,8,29,2,'5-Wood',7.18,'Bunker'),(11,8,29,5,'9-Iron',7.18,'Fairway'),(11,8,30,5,'5-Iron',7.36,'Hole'),(11,8,30,9,'3-Wood',6.75,'Fairway'),(11,8,30,10,'3-Wood',6.75,'Fairway'),(11,8,31,2,'4-Iron',5.83,'Fairway'),(11,8,31,4,'4-Iron',6.36,'Fairway'),(11,8,31,5,'Putter',6.36,'Fairway'),(11,8,31,6,'5-Hybrid',5.83,'Fairway'),(11,8,31,8,'3-Wood',6.36,'Fairway'),(11,8,32,1,'6-Iron',8.27,'Hole'),(11,8,32,7,'8-Iron',8.27,'Hole'),(11,8,32,8,'5-Hybrid',9.10,'Hole'),(11,8,32,10,'4-Hybrid',9.10,'Hole'),(11,8,33,2,'9-Iron',10.08,'Fairway'),(11,8,33,5,'5-Hybrid',10.08,'Bunker'),(11,8,33,9,'4-Hybrid',11.00,'Hole'),(11,8,33,10,'5-Wood',11.00,'Fairway'),(11,8,34,2,'3-Hybrid',9.08,'Fairway'),(11,8,34,4,'Putter',9.91,'Hole'),(11,8,34,5,'4-Iron',9.91,'Hole'),(11,8,34,6,'5-Wood',9.91,'Hole'),(11,8,34,7,'1-Iron',9.91,'Fairway'),(11,8,34,8,'9-Iron',9.91,'Fairway'),(11,8,35,1,'Putter',12.00,'Hole'),(11,8,35,5,'9-Iron',12.00,'Hole'),(11,8,35,6,'Wedge',10.00,'Fairway'),(11,8,35,8,'4-Hybrid',12.00,'Hole'),(11,8,35,9,'3-Hybrid',12.00,'Hole'),(11,8,36,2,'5-Wood',12.50,'Fairway'),(11,8,36,4,'Wedge',13.64,'Fairway'),(11,8,36,9,'5-Iron',12.50,'Fairway'),(11,9,37,1,'5-Iron',5.83,'Bunker'),(11,9,37,3,'3-Iron',6.36,'Hole'),(11,9,37,5,'',6.36,'Hole'),(11,9,37,6,'',6.36,'Hole'),(11,9,37,7,'9-Iron',6.36,'Fairway'),(11,9,37,8,'2-Iron',6.36,'Fairway'),(11,9,37,9,'Wedge',6.36,'Bunker'),(11,9,38,1,'6-Iron',6.18,'Penalty'),(11,9,38,2,'4-Iron',6.18,'Fairway'),(11,9,38,3,'Putter',5.67,'Bunker'),(11,9,38,4,'8-Iron',6.18,'Hole'),(11,9,38,5,'5-Hybrid',6.18,'Hole'),(11,9,38,9,'Wedge',6.80,'Hole'),(11,9,38,10,'2-Iron',5.67,'Bunker'),(11,9,39,1,'Putter',5.91,'Fairway'),(11,9,39,3,'5-Hybrid',6.50,'Hole'),(11,9,39,4,'3-Hybrid',5.91,'Hole'),(11,9,39,6,'4-Hybrid',0.00,'Penalty'),(11,9,40,1,'Putter',6.00,'Hole'),(11,9,40,5,'5-Hybrid',6.00,'Fairway'),(11,9,40,10,'7-Iron',0.00,'Penalty'),(11,9,41,1,'5-Hybrid',6.90,'Hole'),(11,9,41,2,'7-Iron',6.27,'Fairway'),(11,9,41,3,'9-Iron',5.75,'Fairway'),(11,9,41,5,'3-Wood',6.27,'Hole'),(11,9,41,6,'4-Iron',6.27,'Hole'),(11,9,41,10,'5-Hybrid',6.90,'Hole'),(11,9,42,2,'6-Iron',6.00,'Hole'),(11,9,42,3,'2-Iron',5.00,'Bunker'),(11,9,42,4,'2-Iron',5.45,'Hole'),(11,9,42,6,'3-Hybrid',5.45,'Fairway'),(11,9,42,10,'Putter',0.00,'Penalty'),(11,9,43,1,'4-Hybrid',7.09,'Hole'),(11,9,43,8,'3-Iron',7.80,'Hole'),(11,9,44,1,'5-Hybrid',7.90,'Hole'),(11,9,44,6,'5-Iron',7.90,'Hole'),(11,9,44,7,'7-Iron',7.18,'Hole'),(11,9,45,3,'9-Iron',8.73,'Fairway'),(11,9,45,4,'8-Iron',10.67,'Fairway'),(11,9,45,5,'3-Hybrid',0.00,'Penalty'),(11,9,45,6,'Putter',8.73,'Hole'),(11,9,45,9,'5-Hybrid',0.00,'Penalty'),(11,9,45,10,'1-Iron',8.73,'Hole'),(11,9,46,1,'3-Iron',8.91,'Fairway'),(11,9,46,2,'3-Iron',8.91,'Hole'),(11,9,46,3,'Driver',8.17,'Penalty'),(11,9,46,4,'9-Iron',8.17,'Bunker'),(11,9,46,5,'1-Iron',9.80,'Hole'),(11,9,46,6,'4-Iron',8.91,'Hole'),(11,9,46,9,'6-Iron',8.91,'Hole'),(11,9,47,1,'5-Hybrid',9.70,'Hole'),(11,9,47,10,'5-Hybrid',0.00,'Penalty'),(11,9,48,5,'3-Wood',8.45,'Hole'),(11,9,48,9,'1-Iron',8.45,'Hole'),(11,9,48,10,'7-Iron',8.45,'Hole'),(11,9,49,4,'3-Hybrid',11.50,'Hole'),(11,9,49,5,'6-Iron',9.58,'Fairway'),(11,9,49,9,'6-Iron',0.00,'Penalty'),(11,9,50,5,'8-Iron',9.67,'Penalty'),(11,9,50,10,'3-Wood',10.55,'Fairway'),(11,9,51,3,'6-Iron',10.82,'Hole'),(11,9,51,4,'5-Hybrid',10.82,'Hole'),(11,9,51,5,'4-Hybrid',10.82,'Fairway'),(11,9,51,7,'1-Iron',10.82,'Hole'),(11,9,52,1,'5-Hybrid',11.36,'Hole'),(11,9,52,4,'Wedge',11.36,'Hole'),(11,9,52,5,'9-Iron',11.36,'Hole'),(11,9,52,9,'4-Hybrid',13.89,'Hole'),(11,9,53,1,'4-Hybrid',11.82,'Hole'),(11,9,53,2,'3-Hybrid',11.82,'Fairway'),(11,9,53,3,'Driver',13.00,'Hole'),(11,9,53,4,'5-Hybrid',13.00,'Hole'),(11,9,53,9,'1-Iron',11.82,'Hole'),(11,9,54,2,'Driver',50.91,'Hole'),(11,9,54,3,'4-Hybrid',50.91,'Fairway'),(11,9,54,6,'7-Iron',62.22,'Hole'),(11,9,54,10,'8-Iron',50.91,'Hole'),(11,10,37,2,'3-Wood',6.36,'Bunker'),(11,10,37,8,'4-Iron',5.83,'Fairway'),(11,10,38,1,'8-Iron',0.00,'Penalty'),(11,10,38,2,'Wedge',5.67,'Fairway'),(11,10,38,5,'Putter',5.67,'Fairway'),(11,10,38,8,'Putter',6.18,'Fairway'),(11,10,38,10,'7-Iron',6.18,'Fairway'),(11,10,39,4,'3-Iron',6.50,'Hole'),(11,10,39,5,'1-Iron',5.42,'Fairway'),(11,10,39,6,'5-Hybrid',5.91,'Hole'),(11,10,39,7,'4-Iron',5.91,'Bunker'),(11,10,39,10,'Driver',5.91,'Hole'),(11,10,40,1,'4-Hybrid',6.00,'Fairway'),(11,10,40,3,'9-Iron',6.60,'Hole'),(11,10,40,4,'3-Iron',6.60,'Hole'),(11,10,40,6,'Wedge',6.00,'Hole'),(11,10,40,8,'4-Iron',6.60,'Hole'),(11,10,40,10,'3-Hybrid',6.00,'Fairway'),(11,10,41,1,'Wedge',0.00,'Penalty'),(11,10,41,2,'1-Iron',6.90,'Hole'),(11,10,41,4,'8-Iron',6.27,'Hole'),(11,10,42,1,'Driver',5.00,'Fairway'),(11,10,42,5,'2-Iron',5.45,'Hole'),(11,10,43,2,'1-Iron',7.09,'Hole'),(11,10,43,3,'3-Iron',7.09,'Hole'),(11,10,43,7,'3-Hybrid',6.50,'Fairway'),(11,10,43,10,'7-Iron',7.09,'Hole'),(11,10,44,3,'5-Iron',7.18,'Bunker'),(11,10,44,4,'1-Iron',0.00,'Penalty'),(11,10,44,5,'1-Iron',7.90,'Hole'),(11,10,44,10,'3-Hybrid',7.18,'Fairway'),(11,10,45,2,'4-Hybrid',8.73,'Bunker'),(11,10,45,3,'3-Wood',8.73,'Hole'),(11,10,45,8,'5-Wood',8.73,'Hole'),(11,10,45,9,'5-Wood',8.73,'Fairway'),(11,10,45,10,'4-Hybrid',8.00,'Fairway'),(11,10,46,2,'Wedge',0.00,'Penalty'),(11,10,46,4,'4-Hybrid',8.91,'Penalty'),(11,10,46,5,'8-Iron',8.91,'Hole'),(11,10,46,6,'3-Iron',8.91,'Hole'),(11,10,46,7,'2-Iron',8.91,'Hole'),(11,10,46,9,'1-Iron',8.91,'Hole'),(11,10,46,10,'3-Wood',9.80,'Fairway'),(11,10,47,2,'4-Iron',0.00,'Penalty'),(11,10,47,5,'3-Wood',9.70,'Hole'),(11,10,48,2,'3-Iron',7.75,'Fairway'),(11,10,48,6,'7-Iron',9.30,'Hole'),(11,10,48,8,'6-Iron',9.30,'Hole'),(11,10,49,3,'3-Iron',10.45,'Bunker'),(11,10,49,6,'4-Iron',11.50,'Hole'),(11,10,49,10,'Driver',10.45,'Hole'),(11,10,50,4,'6-Iron',0.00,'Penalty'),(11,10,50,7,'5-Hybrid',9.67,'Fairway'),(11,10,50,8,'5-Iron',9.67,'Bunker'),(11,10,50,9,'4-Hybrid',9.67,'Bunker'),(11,10,51,1,'5-Hybrid',9.92,'Bunker'),(11,10,51,2,'Wedge',10.82,'Bunker'),(11,10,51,3,'4-Hybrid',9.92,'Penalty'),(11,10,52,2,'4-Hybrid',11.36,'Fairway'),(11,10,52,4,'',11.36,'Hole'),(11,10,52,7,'Wedge',0.00,'Penalty'),(11,10,52,9,'1-Iron',11.36,'Fairway'),(11,10,53,4,'Driver',11.82,'Fairway'),(11,10,53,5,'2-Iron',11.82,'Fairway'),(11,10,53,6,'2-Iron',10.83,'Fairway'),(11,10,53,9,'6-Iron',11.82,'Fairway'),(11,10,53,10,'5-Hybrid',0.00,'Penalty'),(11,10,54,1,'Wedge',56.00,'Hole'),(11,10,54,4,'5-Wood',56.00,'Hole'),(11,10,54,5,'',50.91,'Bunker'),(11,10,54,7,'2-Iron',50.91,'Hole'),(11,10,54,10,'7-Iron',56.00,'Bunker'),(11,11,37,2,'5-Wood',6.36,'Hole'),(11,11,37,6,'1-Iron',6.36,'Hole'),(11,11,37,8,'6-Iron',6.36,'Fairway'),(11,11,38,1,'3-Hybrid',0.00,'Penalty'),(11,11,38,2,'8-Iron',6.18,'Hole'),(11,11,38,5,'Wedge',6.18,'Fairway'),(11,11,38,6,'5-Hybrid',0.00,'Penalty'),(11,11,38,7,'5-Iron',5.67,'Bunker'),(11,11,38,8,'3-Wood',6.18,'Fairway'),(11,11,38,9,'4-Iron',6.18,'Hole'),(11,11,38,10,'1-Iron',6.18,'Penalty'),(11,11,39,1,'8-Iron',5.91,'Hole'),(11,11,39,2,'Putter',5.42,'Fairway'),(11,11,39,3,'6-Iron',5.91,'Hole'),(11,11,39,5,'1-Iron',5.91,'Hole'),(11,11,39,8,'5-Hybrid',5.91,'Hole'),(11,11,39,9,'7-Iron',5.91,'Fairway'),(11,11,39,10,'Wedge',5.42,'Penalty'),(11,11,40,1,'5-Hybrid',5.50,'Fairway'),(11,11,40,2,'8-Iron',6.00,'Hole'),(11,11,40,7,'7-Iron',6.00,'Hole'),(11,11,40,9,'2-Iron',6.60,'Hole'),(11,11,40,10,'5-Wood',6.60,'Hole'),(11,11,41,1,'5-Iron',6.27,'Bunker'),(11,11,41,7,'9-Iron',6.27,'Hole'),(11,11,41,9,'Wedge',6.27,'Fairway'),(11,11,42,2,'5-Iron',5.45,'Fairway'),(11,11,42,5,'5-Wood',5.45,'Hole'),(11,11,42,6,'7-Iron',5.00,'Bunker'),(11,11,42,10,'3-Wood',5.45,'Bunker'),(11,11,43,3,'4-Hybrid',7.09,'Hole'),(11,11,43,4,'3-Iron',0.00,'Penalty'),(11,11,43,6,'2-Iron',7.80,'Fairway'),(11,11,43,10,'1-Iron',6.50,'Fairway'),(11,11,44,1,'5-Iron',0.00,'Penalty'),(11,11,44,2,'1-Iron',7.18,'Hole'),(11,11,44,7,'8-Iron',7.90,'Hole'),(11,11,44,10,'4-Iron',7.90,'Hole'),(11,11,45,1,'6-Iron',8.73,'Hole'),(11,11,45,3,'5-Iron',8.73,'Fairway'),(11,11,45,8,'6-Iron',0.00,'Penalty'),(11,11,45,9,'2-Iron',8.73,'Hole'),(11,11,45,10,'3-Wood',8.73,'Bunker'),(11,11,46,1,'Wedge',9.80,'Hole'),(11,11,46,4,'2-Iron',9.80,'Hole'),(11,11,46,7,'7-Iron',10.89,'Hole'),(11,11,46,10,'3-Wood',10.89,'Hole'),(11,11,47,2,'4-Iron',8.82,'Hole'),(11,11,47,6,'Wedge',8.82,'Hole'),(11,11,47,9,'Putter',8.82,'Hole'),(11,11,48,2,'4-Iron',7.75,'Fairway'),(11,11,48,5,'1-Iron',8.45,'Fairway'),(11,11,48,6,'8-Iron',7.75,'Fairway'),(11,11,48,7,'5-Hybrid',8.45,'Hole'),(11,11,48,9,'7-Iron',8.45,'Hole'),(11,11,49,1,'4-Iron',9.58,'Bunker'),(11,11,49,4,'5-Wood',10.45,'Hole'),(11,11,49,5,'1-Iron',0.00,'Penalty'),(11,11,49,8,'2-Iron',11.50,'Hole'),(11,11,50,1,'3-Hybrid',10.55,'Fairway'),(11,11,50,2,'4-Hybrid',11.60,'Hole'),(11,11,50,3,'4-Iron',10.55,'Fairway'),(11,11,50,4,'4-Iron',10.55,'Bunker'),(11,11,51,2,'3-Iron',10.82,'Hole'),(11,11,51,3,'3-Iron',0.00,'Penalty'),(11,11,51,6,'5-Iron',10.82,'Hole'),(11,11,51,9,'1-Iron',9.92,'Bunker'),(11,11,52,1,'7-Iron',12.50,'Hole'),(11,11,52,5,'3-Iron',11.36,'Fairway'),(11,11,52,6,'5-Hybrid',10.42,'Fairway'),(11,11,52,7,'5-Wood',10.42,'Fairway'),(11,11,52,9,'4-Hybrid',11.36,'Hole'),(11,11,53,2,'5-Wood',13.00,'Hole'),(11,11,53,4,'5-Hybrid',11.82,'Bunker'),(11,11,53,8,'4-Iron',10.83,'Fairway'),(11,11,54,2,'1-Iron',0.00,'Penalty'),(11,11,54,3,'1-Iron',46.67,'Fairway'),(11,11,54,6,'7-Iron',62.22,'Hole'),(11,11,54,9,'5-Hybrid',56.00,'Hole'),(11,12,37,1,'5-Iron',6.36,'Hole'),(11,12,37,2,'5-Wood',7.78,'Hole'),(11,12,37,3,'4-Hybrid',6.36,'Fairway'),(11,12,37,8,'4-Hybrid',6.36,'Bunker'),(11,12,38,1,'4-Iron',6.18,'Fairway'),(11,12,38,2,'6-Iron',7.56,'Hole'),(11,12,38,3,'3-Wood',6.18,'Hole'),(11,12,38,4,'9-Iron',6.18,'Hole'),(11,12,38,7,'3-Wood',6.18,'Fairway'),(11,12,38,8,'9-Iron',6.18,'Bunker'),(11,12,39,1,'1-Iron',5.91,'Hole'),(11,12,39,10,'Putter',5.91,'Hole'),(11,12,40,3,'Wedge',6.00,'Hole'),(11,12,40,4,'Wedge',6.00,'Hole'),(11,12,40,5,'4-Iron',6.00,'Hole'),(11,12,40,6,'2-Iron',6.00,'Fairway'),(11,12,40,7,'3-Hybrid',5.50,'Fairway'),(11,12,40,9,'2-Iron',6.60,'Hole'),(11,12,40,10,'Putter',6.00,'Bunker'),(11,12,41,6,'3-Hybrid',6.27,'Fairway'),(11,12,41,8,'1-Iron',6.27,'Hole'),(11,12,41,10,'6-Iron',6.27,'Hole'),(11,12,42,2,'8-Iron',5.00,'Fairway'),(11,12,42,3,'9-Iron',5.00,'Fairway'),(11,12,42,7,'5-Wood',5.45,'Hole'),(11,12,42,9,'8-Iron',6.00,'Hole'),(11,12,43,2,'2-Iron',7.09,'Hole'),(11,12,43,7,'3-Wood',7.09,'Hole'),(11,12,44,1,'5-Hybrid',7.18,'Hole'),(11,12,44,2,'9-Iron',6.58,'Fairway'),(11,12,44,3,'2-Iron',7.18,'Bunker'),(11,12,45,1,'Putter',8.00,'Bunker'),(11,12,45,3,'3-Hybrid',8.73,'Fairway'),(11,12,45,4,'1-Iron',8.73,'Hole'),(11,12,45,5,'3-Iron',9.60,'Hole'),(11,12,45,6,'3-Wood',8.73,'Hole'),(11,12,45,7,'',8.73,'Fairway'),(11,12,45,8,'4-Iron',9.60,'Bunker'),(11,12,45,9,'',8.73,'Hole'),(11,12,46,1,'7-Iron',9.80,'Bunker'),(11,12,46,2,'5-Hybrid',8.91,'Penalty'),(11,12,46,3,'8-Iron',8.91,'Hole'),(11,12,46,7,'3-Iron',0.00,'Penalty'),(11,12,47,1,'3-Iron',8.08,'Bunker'),(11,12,47,2,'8-Iron',8.82,'Fairway'),(11,12,47,3,'6-Iron',8.08,'Bunker'),(11,12,47,5,'9-Iron',8.08,'Fairway'),(11,12,47,7,'Driver',9.70,'Hole'),(11,12,47,8,'5-Wood',0.00,'Penalty'),(11,12,47,9,'3-Iron',9.70,'Fairway'),(11,12,48,3,'Putter',0.00,'Penalty'),(11,12,48,6,'2-Iron',8.45,'Fairway'),(11,12,48,10,'',8.45,'Fairway'),(11,12,49,3,'3-Wood',10.45,'Fairway'),(11,12,49,5,'3-Wood',11.50,'Hole'),(11,12,49,6,'Wedge',10.45,'Hole'),(11,12,49,8,'3-Iron',10.45,'Hole'),(11,12,50,4,'4-Iron',10.55,'Hole'),(11,12,50,5,'9-Iron',9.67,'Bunker'),(11,12,51,2,'8-Iron',11.90,'Hole'),(11,12,51,3,'3-Hybrid',10.82,'Hole'),(11,12,51,4,'3-Iron',9.92,'Fairway'),(11,12,52,2,'2-Iron',12.50,'Fairway'),(11,12,52,3,'Driver',11.36,'Fairway'),(11,12,52,7,'4-Iron',0.00,'Penalty'),(11,12,52,9,'6-Iron',11.36,'Hole'),(11,12,52,10,'1-Iron',10.42,'Fairway'),(11,12,53,9,'Putter',13.00,'Hole'),(11,12,54,1,'5-Iron',50.91,'Bunker'),(11,12,54,2,'1-Iron',50.91,'Fairway'),(11,12,54,6,'3-Iron',50.91,'Hole'),(11,12,54,7,'1-Iron',46.67,'Bunker'),(11,13,55,1,'2-Iron',6.09,'Fairway'),(11,13,55,2,'1-Iron',6.09,'Hole'),(11,13,55,3,'2-Iron',6.09,'Fairway'),(11,13,55,6,'5-Wood',6.70,'Hole'),(11,13,55,7,'Putter',6.09,'Fairway'),(11,13,55,9,'1-Iron',6.09,'Hole'),(11,13,55,10,'4-Hybrid',6.09,'Fairway'),(11,13,56,2,'3-Iron',6.18,'Fairway'),(11,13,56,4,'Putter',6.18,'Fairway'),(11,13,56,5,'5-Hybrid',6.18,'Hole'),(11,13,56,7,'8-Iron',0.00,'Penalty'),(11,13,56,8,'1-Iron',6.18,'Hole'),(11,13,56,10,'8-Iron',6.18,'Fairway'),(11,13,57,2,'9-Iron',6.90,'Fairway'),(11,13,57,8,'1-Iron',6.90,'Fairway'),(11,13,58,3,'5-Wood',6.36,'Hole'),(11,13,58,4,'3-Iron',6.36,'Hole'),(11,13,58,7,'5-Hybrid',6.36,'Hole'),(11,13,59,1,'8-Iron',6.45,'Fairway'),(11,13,59,4,'5-Iron',6.45,'Hole'),(11,13,59,5,'3-Hybrid',6.45,'Hole'),(11,13,59,8,'4-Hybrid',7.10,'Fairway'),(11,13,59,9,'1-Iron',6.45,'Hole'),(11,13,60,1,'5-Iron',0.00,'Penalty'),(11,13,60,3,'4-Iron',6.55,'Hole'),(11,13,60,4,'5-Iron',6.00,'Fairway'),(11,13,60,7,'Wedge',6.00,'Fairway'),(11,13,61,2,'5-Iron',10.30,'Hole'),(11,13,61,3,'3-Hybrid',8.58,'Fairway'),(11,13,61,7,'Wedge',9.36,'Fairway'),(11,13,61,8,'',10.30,'Hole'),(11,13,61,9,'1-Iron',9.36,'Bunker'),(11,13,62,7,'3-Iron',10.40,'Hole'),(11,13,62,9,'4-Hybrid',9.45,'Fairway'),(11,13,63,3,'7-Iron',9.64,'Hole'),(11,13,63,4,'9-Iron',11.78,'Hole'),(11,13,63,5,'6-Iron',9.64,'Hole'),(11,13,63,7,'Driver',8.83,'Bunker'),(11,13,64,3,'2-Iron',9.00,'Bunker'),(11,13,64,4,'Wedge',12.00,'Hole'),(11,13,64,9,'Wedge',12.00,'Hole'),(11,13,65,5,'5-Hybrid',10.30,'Hole'),(11,13,65,8,'4-Hybrid',10.30,'Hole'),(11,13,66,1,'Wedge',8.09,'Fairway'),(11,13,66,2,'5-Iron',7.42,'Fairway'),(11,13,66,3,'5-Hybrid',8.90,'Fairway'),(11,13,66,4,'4-Hybrid',0.00,'Penalty'),(11,13,66,6,'7-Iron',8.09,'Hole'),(11,13,66,9,'6-Iron',8.09,'Hole'),(11,13,67,2,'5-Iron',10.50,'Hole'),(11,13,67,4,'8-Iron',9.55,'Hole'),(11,13,67,5,'3-Hybrid',8.75,'Fairway'),(11,13,67,8,'3-Hybrid',9.55,'Fairway'),(11,13,68,5,'5-Wood',9.82,'Fairway'),(11,13,68,6,'3-Hybrid',10.80,'Hole'),(11,13,68,7,'8-Iron',9.00,'Fairway'),(11,13,68,8,'Driver',10.80,'Hole'),(11,13,68,9,'4-Hybrid',0.00,'Penalty'),(11,13,69,1,'6-Iron',10.90,'Hole'),(11,13,69,2,'5-Hybrid',9.91,'Bunker'),(11,13,69,4,'7-Iron',9.91,'Hole'),(11,13,69,9,'3-Iron',10.90,'Hole'),(11,13,69,10,'5-Wood',9.91,'Hole'),(11,13,70,2,'',9.92,'Bunker'),(11,13,70,4,'4-Hybrid',10.82,'Hole'),(11,13,70,6,'Putter',10.82,'Hole'),(11,13,70,8,'1-Iron',10.82,'Fairway'),(11,13,71,4,'Wedge',10.08,'Fairway'),(11,13,71,5,'2-Iron',11.00,'Fairway'),(11,13,71,6,'5-Hybrid',12.10,'Fairway'),(11,13,71,7,'',10.08,'Fairway'),(11,13,71,10,'4-Hybrid',10.08,'Bunker'),(11,13,72,1,'4-Hybrid',0.00,'Penalty'),(11,13,72,2,'5-Hybrid',12.73,'Hole'),(11,13,72,7,'6-Iron',12.73,'Bunker'),(11,13,72,8,'8-Iron',12.73,'Hole'),(11,14,55,3,'1-Iron',6.09,'Bunker'),(11,14,55,5,'9-Iron',6.70,'Hole'),(11,14,55,8,'9-Iron',6.09,'Fairway'),(11,14,56,3,'5-Hybrid',6.18,'Hole'),(11,14,56,5,'Putter',6.18,'Hole'),(11,14,56,7,'8-Iron',6.18,'Fairway'),(11,14,56,8,'7-Iron',6.18,'Fairway'),(11,14,57,4,'5-Iron',6.27,'Hole'),(11,14,57,10,'5-Iron',5.75,'Fairway'),(11,14,58,3,'1-Iron',7.78,'Hole'),(11,14,58,4,'9-Iron',0.00,'Penalty'),(11,14,58,6,'Putter',6.36,'Hole'),(11,14,58,10,'4-Hybrid',6.36,'Hole'),(11,14,59,1,'8-Iron',6.45,'Hole'),(11,14,59,4,'4-Iron',6.45,'Hole'),(11,14,59,5,'2-Iron',5.92,'Fairway'),(11,14,59,6,'Driver',6.45,'Bunker'),(11,14,59,7,'1-Iron',6.45,'Hole'),(11,14,59,8,'5-Wood',6.45,'Hole'),(11,14,60,1,'Putter',6.55,'Hole'),(11,14,60,2,'1-Iron',6.00,'Fairway'),(11,14,60,3,'Wedge',6.55,'Hole'),(11,14,60,9,'5-Wood',6.55,'Fairway'),(11,14,60,10,'3-Iron',6.00,'Fairway'),(11,14,61,1,'4-Iron',8.58,'Fairway'),(11,14,61,2,'',9.36,'Bunker'),(11,14,61,3,'',9.36,'Hole'),(11,14,61,4,'3-Wood',8.58,'Bunker'),(11,14,61,6,'5-Wood',9.36,'Hole'),(11,14,61,10,'5-Wood',8.58,'Penalty'),(11,14,62,1,'7-Iron',9.45,'Bunker'),(11,14,62,4,'4-Hybrid',9.45,'Hole'),(11,14,62,6,'Wedge',9.45,'Hole'),(11,14,62,8,'2-Iron',9.45,'Hole'),(11,14,62,9,'1-Iron',9.45,'Fairway'),(11,14,62,10,'2-Iron',9.45,'Hole'),(11,14,63,2,'3-Iron',8.83,'Fairway'),(11,14,63,3,'3-Wood',10.60,'Hole'),(11,14,63,5,'7-Iron',9.64,'Fairway'),(11,14,63,6,'',11.78,'Bunker'),(11,14,63,7,'Wedge',9.64,'Hole'),(11,14,63,8,'5-Hybrid',9.64,'Hole'),(11,14,63,9,'3-Wood',9.64,'Hole'),(11,14,64,1,'3-Iron',9.82,'Hole'),(11,14,64,2,'',9.82,'Hole'),(11,14,64,3,'1-Iron',10.80,'Hole'),(11,14,64,5,'5-Iron',9.00,'Penalty'),(11,14,64,9,'7-Iron',9.82,'Hole'),(11,14,65,1,'1-Iron',9.36,'Fairway'),(11,14,65,3,'6-Iron',8.58,'Bunker'),(11,14,65,5,'3-Wood',8.58,'Bunker'),(11,14,65,6,'3-Iron',9.36,'Penalty'),(11,14,65,8,'',10.30,'Hole'),(11,14,66,2,'7-Iron',8.09,'Bunker'),(11,14,66,3,'4-Iron',7.42,'Bunker'),(11,14,66,7,'1-Iron',0.00,'Penalty'),(11,14,67,2,'5-Iron',9.55,'Hole'),(11,14,67,4,'7-Iron',0.00,'Penalty'),(11,14,67,5,'9-Iron',9.55,'Fairway'),(11,14,67,6,'6-Iron',9.55,'Hole'),(11,14,68,1,'3-Iron',9.00,'Fairway'),(11,14,68,3,'4-Iron',9.82,'Hole'),(11,14,68,4,'6-Iron',9.82,'Fairway'),(11,14,68,5,'2-Iron',9.82,'Bunker'),(11,14,68,8,'3-Wood',9.82,'Penalty'),(11,14,68,9,'8-Iron',9.82,'Bunker'),(11,14,68,10,'5-Iron',9.82,'Hole'),(11,14,69,1,'2-Iron',10.90,'Hole'),(11,14,69,3,'4-Hybrid',9.08,'Fairway'),(11,14,69,6,'3-Wood',9.91,'Bunker'),(11,14,69,7,'9-Iron',9.08,'Fairway'),(11,14,69,10,'Wedge',10.90,'Fairway'),(11,14,70,3,'1-Iron',0.00,'Penalty'),(11,14,70,4,'3-Iron',10.82,'Fairway'),(11,14,70,9,'5-Hybrid',10.82,'Hole'),(11,14,71,3,'Putter',11.00,'Hole'),(11,14,71,10,'5-Wood',11.00,'Hole'),(11,14,72,5,'5-Hybrid',12.73,'Bunker'),(11,14,72,8,'3-Wood',11.67,'Penalty'),(11,14,72,9,'4-Hybrid',12.73,'Hole'),(11,14,72,10,'3-Wood',11.67,'Fairway'),(11,15,55,2,'4-Iron',6.09,'Hole'),(11,15,55,8,'3-Iron',6.09,'Fairway'),(11,15,55,10,'2-Iron',6.70,'Hole'),(11,15,56,3,'Putter',6.80,'Hole'),(11,15,56,6,'2-Iron',6.18,'Hole'),(11,15,56,7,'5-Wood',6.18,'Fairway'),(11,15,56,9,'4-Hybrid',5.67,'Bunker'),(11,15,56,10,'Wedge',6.80,'Hole'),(11,15,57,2,'5-Wood',5.75,'Fairway'),(11,15,57,9,'7-Iron',6.27,'Hole'),(11,15,57,10,'3-Iron',6.90,'Bunker'),(11,15,58,1,'5-Wood',7.00,'Hole'),(11,15,58,3,'1-Iron',6.36,'Hole'),(11,15,58,7,'',6.36,'Hole'),(11,15,59,3,'Putter',6.45,'Fairway'),(11,15,59,7,'6-Iron',5.92,'Bunker'),(11,15,59,9,'4-Hybrid',5.92,'Fairway'),(11,15,60,1,'Wedge',6.55,'Hole'),(11,15,60,3,'',6.55,'Fairway'),(11,15,60,4,'5-Iron',7.20,'Hole'),(11,15,60,5,'6-Iron',6.00,'Fairway'),(11,15,60,6,'3-Hybrid',6.55,'Hole'),(11,15,60,9,'3-Hybrid',6.55,'Hole'),(11,15,60,10,'7-Iron',6.00,'Fairway'),(11,15,61,1,'1-Iron',9.36,'Hole'),(11,15,61,4,'5-Hybrid',8.58,'Fairway'),(11,15,61,5,'3-Iron',8.58,'Fairway'),(11,15,61,6,'3-Hybrid',10.30,'Bunker'),(11,15,61,8,'3-Wood',9.36,'Hole'),(11,15,62,2,'5-Hybrid',9.45,'Hole'),(11,15,62,4,'3-Hybrid',8.67,'Fairway'),(11,15,62,6,'4-Iron',0.00,'Penalty'),(11,15,62,7,'6-Iron',9.45,'Hole'),(11,15,62,8,'7-Iron',9.45,'Hole'),(11,15,62,9,'5-Hybrid',9.45,'Hole'),(11,15,62,10,'Wedge',10.40,'Hole'),(11,15,63,1,'Putter',9.64,'Hole'),(11,15,63,2,'5-Wood',9.64,'Hole'),(11,15,63,3,'Driver',9.64,'Hole'),(11,15,63,8,'1-Iron',9.64,'Hole'),(11,15,63,9,'',9.64,'Fairway'),(11,15,64,1,'6-Iron',10.80,'Hole'),(11,15,64,2,'3-Hybrid',9.82,'Hole'),(11,15,64,4,'4-Iron',0.00,'Penalty'),(11,15,64,5,'2-Iron',9.82,'Hole'),(11,15,64,6,'8-Iron',9.82,'Hole'),(11,15,64,9,'6-Iron',9.82,'Hole'),(11,15,64,10,'4-Hybrid',9.82,'Fairway'),(11,15,65,1,'1-Iron',9.36,'Bunker'),(11,15,65,4,'8-Iron',8.58,'Fairway'),(11,15,65,5,'3-Iron',8.58,'Bunker'),(11,15,65,8,'6-Iron',9.36,'Hole'),(11,15,65,10,'4-Hybrid',10.30,'Hole'),(11,15,66,6,'8-Iron',8.09,'Fairway'),(11,15,67,3,'5-Wood',9.55,'Hole'),(11,15,67,5,'3-Wood',9.55,'Hole'),(11,15,68,5,'3-Iron',9.00,'Fairway'),(11,15,68,8,'1-Iron',9.82,'Fairway'),(11,15,68,9,'5-Hybrid',0.00,'Penalty'),(11,15,68,10,'4-Hybrid',10.80,'Hole'),(11,15,69,4,'Driver',9.91,'Hole'),(11,15,69,7,'8-Iron',9.91,'Hole'),(11,15,69,10,'Putter',10.90,'Fairway'),(11,15,70,2,'3-Hybrid',10.82,'Hole'),(11,15,70,3,'8-Iron',10.82,'Fairway'),(11,15,70,4,'5-Hybrid',9.92,'Bunker'),(11,15,70,5,'5-Wood',10.82,'Hole'),(11,15,70,7,'2-Iron',10.82,'Bunker'),(11,15,70,8,'1-Iron',9.92,'Bunker'),(11,15,71,1,'9-Iron',11.00,'Fairway'),(11,15,71,2,'Wedge',11.00,'Fairway'),(11,15,71,7,'5-Wood',11.00,'Fairway'),(11,15,71,10,'4-Hybrid',10.08,'Bunker'),(11,15,72,2,'7-Iron',14.00,'Hole'),(11,15,72,4,'3-Hybrid',11.67,'Fairway'),(11,15,72,7,'4-Hybrid',12.73,'Hole'),(11,15,72,9,'2-Iron',14.00,'Hole'),(11,16,55,1,'Putter',6.09,'Bunker'),(11,16,55,6,'4-Hybrid',6.09,'Hole'),(11,16,55,7,'5-Iron',5.58,'Fairway'),(11,16,55,8,'4-Iron',6.09,'Bunker'),(11,16,55,10,'8-Iron',6.70,'Hole'),(11,16,56,1,'5-Wood',6.18,'Hole'),(11,16,56,3,'9-Iron',5.67,'Bunker'),(11,16,56,4,'3-Iron',6.18,'Penalty'),(11,16,56,5,'8-Iron',6.18,'Bunker'),(11,16,56,8,'4-Hybrid',5.67,'Fairway'),(11,16,56,9,'3-Hybrid',6.18,'Hole'),(11,16,56,10,'7-Iron',6.18,'Fairway'),(11,16,57,1,'5-Wood',0.00,'Penalty'),(11,16,57,3,'8-Iron',5.75,'Bunker'),(11,16,57,4,'4-Hybrid',6.27,'Hole'),(11,16,57,5,'3-Wood',6.27,'Fairway'),(11,16,57,7,'Putter',6.27,'Fairway'),(11,16,57,8,'2-Iron',6.27,'Hole'),(11,16,57,9,'5-Hybrid',6.27,'Bunker'),(11,16,58,1,'8-Iron',7.00,'Hole'),(11,16,58,2,'6-Iron',6.36,'Hole'),(11,16,58,3,'2-Iron',6.36,'Fairway'),(11,16,58,4,'Putter',6.36,'Bunker'),(11,16,59,4,'',6.45,'Fairway'),(11,16,59,5,'6-Iron',6.45,'Hole'),(11,16,60,1,'8-Iron',6.55,'Hole'),(11,16,60,3,'3-Hybrid',7.20,'Hole'),(11,16,61,5,'Putter',9.36,'Hole'),(11,16,61,8,'4-Hybrid',9.36,'Hole'),(11,16,62,1,'5-Iron',9.45,'Hole'),(11,16,62,2,'8-Iron',8.67,'Bunker'),(11,16,62,3,'3-Iron',10.40,'Hole'),(11,16,62,4,'5-Wood',10.40,'Hole'),(11,16,62,7,'3-Iron',8.67,'Bunker'),(11,16,62,9,'4-Hybrid',9.45,'Hole'),(11,16,63,2,'5-Wood',10.60,'Fairway'),(11,16,63,3,'',10.60,'Hole'),(11,16,63,4,'4-Hybrid',9.64,'Fairway'),(11,16,63,8,'3-Iron',10.60,'Hole'),(11,16,64,1,'3-Hybrid',9.00,'Fairway'),(11,16,64,2,'9-Iron',9.82,'Fairway'),(11,16,64,3,'4-Iron',0.00,'Penalty'),(11,16,64,5,'5-Wood',9.82,'Hole'),(11,16,64,6,'4-Iron',9.82,'Hole'),(11,16,64,7,'6-Iron',10.80,'Hole'),(11,16,64,8,'9-Iron',10.80,'Hole'),(11,16,65,4,'3-Wood',9.36,'Hole'),(11,16,65,6,'5-Hybrid',9.36,'Hole'),(11,16,65,8,'4-Hybrid',11.44,'Hole'),(11,16,66,3,'6-Iron',8.09,'Fairway'),(11,16,66,4,'',8.09,'Hole'),(11,16,66,5,'4-Iron',8.09,'Hole'),(11,16,66,6,'6-Iron',7.42,'Fairway'),(11,16,66,8,'Driver',8.09,'Bunker'),(11,16,67,1,'5-Wood',8.75,'Bunker'),(11,16,67,4,'3-Iron',9.55,'Fairway'),(11,16,67,8,'Putter',9.55,'Hole'),(11,16,67,9,'3-Hybrid',8.75,'Fairway'),(11,16,68,1,'3-Wood',9.00,'Fairway'),(11,16,68,3,'1-Iron',9.00,'Fairway'),(11,16,68,5,'7-Iron',9.82,'Penalty'),(11,16,68,6,'2-Iron',9.82,'Hole'),(11,16,68,9,'4-Hybrid',9.82,'Hole'),(11,16,69,2,'6-Iron',0.00,'Penalty'),(11,16,69,3,'9-Iron',9.91,'Bunker'),(11,16,69,7,'7-Iron',9.91,'Bunker'),(11,16,69,8,'7-Iron',9.08,'Fairway'),(11,16,70,1,'3-Iron',10.82,'Hole'),(11,16,70,2,'8-Iron',9.92,'Bunker'),(11,16,70,3,'5-Hybrid',10.82,'Hole'),(11,16,70,5,'5-Wood',10.82,'Fairway'),(11,16,70,6,'Wedge',9.92,'Bunker'),(11,16,70,7,'4-Hybrid',11.90,'Hole'),(11,16,70,8,'3-Hybrid',10.82,'Hole'),(11,16,71,1,'7-Iron',12.10,'Hole'),(11,16,71,2,'8-Iron',11.00,'Hole'),(11,16,71,3,'5-Wood',11.00,'Penalty'),(11,16,71,9,'3-Hybrid',13.44,'Hole'),(11,16,72,2,'6-Iron',12.73,'Fairway'),(11,16,72,5,'3-Wood',12.73,'Bunker'),(11,16,72,10,'Driver',12.73,'Hole'),(11,17,73,1,'1-Iron',46.55,'Hole'),(11,17,73,2,'8-Iron',42.67,'Fairway'),(11,17,73,3,'9-Iron',46.55,'Hole'),(11,17,73,6,'9-Iron',51.20,'Hole'),(11,17,73,7,'8-Iron',42.67,'Fairway'),(11,17,74,1,'4-Hybrid',16.55,'Hole'),(11,17,74,3,'2-Iron',16.55,'Fairway'),(11,17,74,7,'4-Iron',18.20,'Hole'),(11,17,74,8,'7-Iron',18.20,'Hole'),(11,17,74,9,'9-Iron',16.55,'Bunker'),(11,17,75,2,'9-Iron',8.09,'Hole'),(11,17,75,3,'Putter',8.09,'Hole'),(11,17,75,8,'Putter',8.09,'Fairway'),(11,17,76,1,'2-Iron',7.18,'Hole'),(11,17,76,3,'Driver',7.90,'Hole'),(11,17,76,4,'3-Iron',7.18,'Hole'),(11,17,76,6,'2-Iron',6.58,'Bunker'),(11,17,76,7,'Putter',7.90,'Hole'),(11,17,76,8,'2-Iron',6.58,'Bunker'),(11,17,76,9,'3-Iron',7.18,'Fairway'),(11,17,77,4,'7-Iron',7.27,'Hole'),(11,17,77,5,'5-Wood',8.00,'Hole'),(11,17,77,7,'7-Iron',7.27,'Hole'),(11,17,77,10,'5-Hybrid',7.27,'Hole'),(11,17,78,1,'Driver',8.00,'Hole'),(11,17,78,2,'6-Iron',8.00,'Fairway'),(11,17,78,3,'Wedge',8.00,'Hole'),(11,17,78,10,'4-Iron',8.00,'Fairway'),(11,17,79,3,'Driver',7.82,'Hole'),(11,17,79,10,'4-Hybrid',7.82,'Hole'),(11,17,80,1,'5-Wood',7.00,'Bunker'),(11,17,80,2,'3-Hybrid',7.64,'Hole'),(11,17,80,3,'Putter',7.64,'Hole'),(11,17,80,4,'5-Iron',7.64,'Fairway'),(11,17,80,6,'6-Iron',7.64,'Hole'),(11,17,81,2,'3-Hybrid',9.00,'Hole'),(11,17,81,3,'Putter',8.18,'Fairway'),(11,17,81,4,'Putter',8.18,'Bunker'),(11,17,81,5,'4-Hybrid',8.18,'Fairway'),(11,17,81,6,'Putter',8.18,'Hole'),(11,17,81,7,'8-Iron',8.18,'Hole'),(11,17,81,9,'Putter',8.18,'Hole'),(11,17,81,10,'7-Iron',7.50,'Fairway'),(11,17,82,1,'Wedge',9.00,'Bunker'),(11,17,82,3,'6-Iron',9.00,'Bunker'),(11,17,82,7,'6-Iron',9.90,'Hole'),(11,17,82,9,'3-Iron',0.00,'Penalty'),(11,17,83,2,'3-Hybrid',5.83,'Bunker'),(11,17,83,3,'1-Iron',7.00,'Hole'),(11,17,83,5,'Wedge',6.36,'Hole'),(11,17,83,9,'8-Iron',7.00,'Penalty'),(11,17,84,7,'6-Iron',6.64,'Fairway'),(11,17,84,8,'4-Hybrid',6.64,'Hole'),(11,17,84,10,'1-Iron',6.64,'Bunker'),(11,17,85,2,'3-Hybrid',8.60,'Hole'),(11,17,85,4,'5-Hybrid',0.00,'Penalty'),(11,17,85,8,'6-Iron',7.82,'Hole'),(11,17,86,2,'Wedge',10.00,'Hole'),(11,17,86,8,'3-Hybrid',10.00,'Bunker'),(11,17,87,2,'4-Iron',10.82,'Penalty'),(11,17,87,5,'9-Iron',10.82,'Hole'),(11,17,87,6,'Driver',9.92,'Bunker'),(11,17,87,8,'2-Iron',10.82,'Fairway'),(11,17,87,9,'2-Iron',10.82,'Hole'),(11,17,88,2,'2-Iron',11.18,'Hole'),(11,17,88,3,'5-Hybrid',11.18,'Fairway'),(11,17,88,5,'3-Wood',11.18,'Hole'),(11,17,88,6,'9-Iron',10.25,'Bunker'),(11,17,88,7,'3-Hybrid',11.18,'Hole'),(11,17,88,8,'4-Iron',10.25,'Fairway'),(11,17,89,2,'Putter',12.73,'Bunker'),(11,17,89,4,'Wedge',12.73,'Fairway'),(11,17,89,7,'Wedge',15.56,'Hole'),(11,17,89,8,'4-Hybrid',12.73,'Hole'),(11,17,89,9,'9-Iron',12.73,'Hole'),(11,17,89,10,'3-Hybrid',11.67,'Fairway'),(11,17,90,2,'3-Wood',14.55,'Bunker'),(11,17,90,3,'4-Iron',14.55,'Hole'),(11,17,90,7,'7-Iron',16.00,'Hole'),(11,17,90,8,'3-Wood',14.55,'Fairway'),(11,17,90,9,'3-Hybrid',14.55,'Hole'),(11,18,73,2,'Driver',51.20,'Hole'),(11,18,73,3,'7-Iron',46.55,'Hole'),(11,18,73,5,'Wedge',42.67,'Fairway'),(11,18,74,1,'Wedge',16.55,'Hole'),(11,18,74,2,'4-Iron',16.55,'Hole'),(11,18,74,5,'5-Iron',16.55,'Fairway'),(11,18,74,7,'5-Hybrid',16.55,'Hole'),(11,18,74,8,'Putter',16.55,'Fairway'),(11,18,74,9,'4-Iron',16.55,'Fairway'),(11,18,75,6,'8-Iron',8.09,'Hole'),(11,18,75,7,'Putter',8.09,'Fairway'),(11,18,75,8,'8-Iron',8.09,'Hole'),(11,18,76,5,'Putter',7.18,'Hole'),(11,18,76,6,'Putter',7.18,'Hole'),(11,18,76,10,'8-Iron',7.18,'Fairway'),(11,18,77,1,'7-Iron',6.67,'Fairway'),(11,18,77,2,'Driver',7.27,'Hole'),(11,18,77,6,'Wedge',6.67,'Fairway'),(11,18,77,7,'4-Hybrid',7.27,'Fairway'),(11,18,77,9,'6-Iron',7.27,'Bunker'),(11,18,77,10,'Wedge',7.27,'Hole'),(11,18,78,2,'9-Iron',8.80,'Hole'),(11,18,78,8,'4-Iron',8.00,'Hole'),(11,18,78,9,'2-Iron',0.00,'Penalty'),(11,18,78,10,'4-Hybrid',8.00,'Fairway'),(11,18,79,4,'Wedge',7.17,'Bunker'),(11,18,79,6,'6-Iron',7.17,'Fairway'),(11,18,79,9,'1-Iron',7.82,'Bunker'),(11,18,79,10,'3-Wood',0.00,'Penalty'),(11,18,80,1,'3-Iron',7.64,'Fairway'),(11,18,80,4,'8-Iron',7.64,'Hole'),(11,18,80,5,'5-Wood',7.64,'Fairway'),(11,18,80,8,'5-Iron',7.64,'Bunker'),(11,18,80,10,'9-Iron',7.64,'Hole'),(11,18,81,1,'5-Wood',8.18,'Hole'),(11,18,81,4,'8-Iron',9.00,'Hole'),(11,18,81,5,'5-Iron',9.00,'Hole'),(11,18,81,7,'Putter',9.00,'Hole'),(11,18,81,10,'Driver',8.18,'Bunker'),(11,18,82,3,'8-Iron',9.00,'Hole'),(11,18,82,4,'5-Iron',9.90,'Fairway'),(11,18,82,7,'3-Hybrid',9.00,'Hole'),(11,18,82,8,'9-Iron',11.00,'Hole'),(11,18,83,2,'1-Iron',7.00,'Hole'),(11,18,83,3,'2-Iron',6.36,'Hole'),(11,18,83,7,'3-Iron',6.36,'Hole'),(11,18,84,2,'Wedge',6.64,'Hole'),(11,18,84,3,'3-Iron',6.64,'Hole'),(11,18,84,10,'7-Iron',6.08,'Bunker'),(11,18,85,3,'Putter',0.00,'Penalty'),(11,18,85,5,'2-Iron',7.17,'Fairway'),(11,18,85,6,'4-Iron',8.60,'Bunker'),(11,18,85,8,'5-Wood',7.82,'Hole'),(11,18,86,2,'9-Iron',12.22,'Hole'),(11,18,86,4,'7-Iron',10.00,'Bunker'),(11,18,86,6,'Wedge',10.00,'Fairway'),(11,18,86,8,'3-Wood',9.17,'Fairway'),(11,18,87,4,'9-Iron',10.82,'Hole'),(11,18,87,10,'3-Hybrid',10.82,'Hole'),(11,18,88,1,'4-Iron',0.00,'Penalty'),(11,18,88,3,'1-Iron',11.18,'Hole'),(11,18,88,7,'6-Iron',10.25,'Fairway'),(11,18,88,9,'',11.18,'Bunker'),(11,18,89,2,'4-Iron',12.73,'Hole'),(11,18,89,5,'2-Iron',12.73,'Fairway'),(11,18,89,7,'5-Wood',12.73,'Hole'),(11,18,90,1,'1-Iron',13.33,'Bunker'),(11,18,90,2,'3-Wood',14.55,'Hole'),(11,18,90,3,'Putter',14.55,'Hole'),(11,18,90,5,'9-Iron',14.55,'Hole'),(11,18,90,8,'Putter',0.00,'Penalty'),(11,18,90,9,'4-Hybrid',16.00,'Hole'),(11,18,90,10,'3-Iron',14.55,'Hole'),(11,19,73,5,'3-Wood',46.55,'Hole'),(11,19,73,7,'1-Iron',0.00,'Penalty'),(11,19,73,8,'8-Iron',46.55,'Fairway'),(11,19,73,9,'2-Iron',46.55,'Fairway'),(11,19,74,2,'3-Hybrid',18.20,'Hole'),(11,19,74,7,'Wedge',16.55,'Bunker'),(11,19,75,5,'3-Iron',8.09,'Hole'),(11,19,75,10,'4-Iron',8.09,'Hole'),(11,19,76,2,'3-Iron',6.58,'Fairway'),(11,19,76,4,'3-Iron',8.78,'Hole'),(11,19,76,5,'1-Iron',7.18,'Hole'),(11,19,76,7,'5-Iron',7.90,'Hole'),(11,19,76,8,'6-Iron',7.18,'Hole'),(11,19,76,9,'Putter',7.18,'Hole'),(11,19,77,3,'Driver',6.67,'Fairway'),(11,19,77,4,'4-Hybrid',7.27,'Hole'),(11,19,77,5,'4-Hybrid',7.27,'Hole'),(11,19,77,6,'4-Hybrid',6.67,'Bunker'),(11,19,77,7,'3-Wood',7.27,'Bunker'),(11,19,77,8,'Wedge',8.00,'Hole'),(11,19,78,6,'Wedge',8.00,'Bunker'),(11,19,78,7,'3-Wood',7.33,'Bunker'),(11,19,78,10,'1-Iron',8.00,'Hole'),(11,19,79,3,'5-Wood',8.60,'Hole'),(11,19,79,4,'3-Wood',7.82,'Hole'),(11,19,79,8,'5-Iron',7.82,'Hole'),(11,19,79,9,'3-Wood',7.82,'Hole'),(11,19,80,2,'9-Iron',7.64,'Hole'),(11,19,80,3,'Wedge',7.64,'Hole'),(11,19,80,6,'3-Iron',7.00,'Fairway'),(11,19,80,7,'8-Iron',8.40,'Hole'),(11,19,80,8,'4-Iron',7.64,'Hole'),(11,19,80,10,'3-Wood',7.64,'Hole'),(11,19,81,1,'5-Hybrid',7.50,'Bunker'),(11,19,81,4,'3-Hybrid',7.50,'Fairway'),(11,19,81,5,'Wedge',8.18,'Hole'),(11,19,81,6,'4-Hybrid',9.00,'Hole'),(11,19,81,8,'Putter',0.00,'Penalty'),(11,19,82,5,'6-Iron',9.90,'Hole'),(11,19,82,8,'3-Hybrid',9.00,'Hole'),(11,19,82,10,'9-Iron',9.90,'Hole'),(11,19,83,1,'Putter',6.36,'Fairway'),(11,19,83,2,'Driver',6.36,'Fairway'),(11,19,83,3,'5-Wood',6.36,'Bunker'),(11,19,83,4,'5-Hybrid',6.36,'Fairway'),(11,19,83,6,'4-Hybrid',0.00,'Penalty'),(11,19,83,9,'6-Iron',5.83,'Fairway'),(11,19,83,10,'1-Iron',7.00,'Hole'),(11,19,84,2,'5-Wood',6.64,'Fairway'),(11,19,84,4,'3-Wood',6.64,'Fairway'),(11,19,84,5,'4-Hybrid',6.08,'Fairway'),(11,19,85,4,'Putter',7.82,'Hole'),(11,19,85,6,'2-Iron',8.60,'Hole'),(11,19,85,8,'',0.00,'Penalty'),(11,19,85,10,'9-Iron',0.00,'Penalty'),(11,19,86,1,'9-Iron',10.00,'Fairway'),(11,19,86,5,'5-Iron',10.00,'Bunker'),(11,19,86,8,'2-Iron',11.00,'Bunker'),(11,19,87,5,'3-Wood',9.92,'Fairway'),(11,19,87,6,'5-Hybrid',11.90,'Bunker'),(11,19,88,8,'9-Iron',10.25,'Bunker'),(11,19,88,9,'7-Iron',11.18,'Hole'),(11,19,88,10,'',11.18,'Bunker'),(11,19,89,2,'3-Iron',12.73,'Bunker'),(11,19,89,4,'Wedge',14.00,'Hole'),(11,19,89,5,'6-Iron',12.73,'Hole'),(11,19,90,1,'1-Iron',0.00,'Penalty'),(11,19,90,5,'8-Iron',14.55,'Bunker'),(11,19,90,6,'5-Iron',13.33,'Fairway'),(11,19,90,9,'3-Iron',0.00,'Penalty'),(11,20,73,1,'6-Iron',42.67,'Fairway'),(11,20,73,3,'Putter',46.55,'Fairway'),(11,20,73,4,'5-Iron',42.67,'Fairway'),(11,20,73,7,'3-Wood',46.55,'Bunker'),(11,20,73,8,'Putter',42.67,'Penalty'),(11,20,73,9,'3-Hybrid',46.55,'Hole'),(11,20,74,2,'Putter',15.17,'Penalty'),(11,20,74,3,'9-Iron',16.55,'Hole'),(11,20,74,5,'4-Hybrid',16.55,'Hole'),(11,20,74,6,'6-Iron',16.55,'Bunker'),(11,20,75,1,'2-Iron',8.90,'Fairway'),(11,20,75,4,'9-Iron',8.90,'Fairway'),(11,20,75,5,'3-Iron',0.00,'Penalty'),(11,20,75,7,'4-Iron',8.09,'Fairway'),(11,20,75,9,'9-Iron',8.90,'Hole'),(11,20,75,10,'6-Iron',8.09,'Bunker'),(11,20,76,2,'4-Hybrid',7.90,'Hole'),(11,20,76,3,'Wedge',7.18,'Fairway'),(11,20,76,4,'4-Hybrid',7.18,'Hole'),(11,20,76,5,'7-Iron',0.00,'Penalty'),(11,20,76,7,'4-Hybrid',7.18,'Hole'),(11,20,77,1,'8-Iron',8.00,'Hole'),(11,20,77,2,'Wedge',7.27,'Bunker'),(11,20,77,3,'7-Iron',8.00,'Hole'),(11,20,77,5,'4-Iron',8.00,'Hole'),(11,20,77,7,'4-Hybrid',7.27,'Hole'),(11,20,77,8,'3-Hybrid',7.27,'Hole'),(11,20,77,10,'6-Iron',7.27,'Fairway'),(11,20,78,2,'3-Hybrid',8.80,'Fairway'),(11,20,78,5,'4-Iron',7.33,'Penalty'),(11,20,78,6,'1-Iron',8.80,'Hole'),(11,20,78,8,'Driver',0.00,'Penalty'),(11,20,78,10,'1-Iron',7.33,'Bunker'),(11,20,79,3,'6-Iron',7.82,'Hole'),(11,20,79,5,'3-Iron',7.82,'Hole'),(11,20,79,7,'6-Iron',7.17,'Penalty'),(11,20,79,8,'5-Iron',7.82,'Hole'),(11,20,80,3,'1-Iron',7.64,'Fairway'),(11,20,80,4,'3-Wood',7.64,'Hole'),(11,20,80,5,'3-Iron',8.40,'Hole'),(11,20,80,6,'3-Wood',8.40,'Hole'),(11,20,80,9,'4-Hybrid',7.00,'Fairway'),(11,20,81,4,'4-Hybrid',8.18,'Fairway'),(11,20,81,6,'3-Wood',8.18,'Bunker'),(11,20,81,7,'2-Iron',9.00,'Hole'),(11,20,81,9,'8-Iron',7.50,'Fairway'),(11,20,82,1,'5-Hybrid',9.00,'Hole'),(11,20,82,2,'4-Iron',9.00,'Hole'),(11,20,82,9,'2-Iron',9.00,'Fairway'),(11,20,83,1,'9-Iron',7.00,'Hole'),(11,20,83,2,'6-Iron',7.00,'Penalty'),(11,20,83,4,'9-Iron',5.83,'Bunker'),(11,20,83,5,'1-Iron',6.36,'Bunker'),(11,20,83,6,'4-Hybrid',6.36,'Hole'),(11,20,84,2,'3-Hybrid',6.64,'Bunker'),(11,20,84,3,'2-Iron',6.08,'Fairway'),(11,20,84,5,'5-Iron',6.64,'Hole'),(11,20,84,6,'1-Iron',6.64,'Fairway'),(11,20,84,7,'Wedge',0.00,'Penalty'),(11,20,84,8,'4-Iron',6.64,'Hole'),(11,20,84,9,'1-Iron',6.64,'Hole'),(11,20,84,10,'2-Iron',6.64,'Hole'),(11,20,85,2,'5-Wood',7.82,'Fairway'),(11,20,85,5,'5-Hybrid',8.60,'Fairway'),(11,20,85,6,'5-Iron',0.00,'Penalty'),(11,20,85,7,'5-Iron',7.82,'Bunker'),(11,20,86,2,'4-Hybrid',9.17,'Bunker'),(11,20,86,4,'6-Iron',10.00,'Hole'),(11,20,86,6,'4-Iron',9.17,'Fairway'),(11,20,86,8,'7-Iron',10.00,'Hole'),(11,20,86,9,'4-Iron',10.00,'Hole'),(11,20,87,3,'3-Hybrid',10.82,'Bunker'),(11,20,87,4,'3-Hybrid',10.82,'Hole'),(11,20,87,6,'1-Iron',11.90,'Fairway'),(11,20,87,7,'',0.00,'Penalty'),(11,20,87,8,'5-Iron',10.82,'Hole'),(11,20,87,10,'1-Iron',10.82,'Hole'),(11,20,88,2,'1-Iron',12.30,'Hole'),(11,20,88,4,'6-Iron',10.25,'Fairway'),(11,20,88,5,'9-Iron',11.18,'Bunker'),(11,20,88,6,'1-Iron',10.25,'Fairway'),(11,20,88,7,'5-Iron',11.18,'Hole'),(11,20,88,8,'2-Iron',11.18,'Hole'),(11,20,88,9,'Wedge',0.00,'Penalty'),(11,20,88,10,'7-Iron',11.18,'Bunker'),(11,20,89,2,'5-Wood',0.00,'Penalty'),(11,20,89,3,'7-Iron',12.73,'Bunker'),(11,20,89,4,'3-Hybrid',14.00,'Hole'),(11,20,89,5,'2-Iron',12.73,'Hole'),(11,20,89,8,'2-Iron',14.00,'Hole'),(11,20,89,9,'Putter',12.73,'Hole'),(11,20,90,2,'1-Iron',14.55,'Hole'),(11,20,90,3,'9-Iron',13.33,'Bunker'),(11,20,90,4,'9-Iron',14.55,'Fairway'),(11,20,90,7,'',13.33,'Fairway'),(11,20,90,9,'1-Iron',16.00,'Hole'),(11,20,90,10,'5-Hybrid',14.55,'Hole'),(12,1,1,1,'5-Iron',0.00,'Penalty'),(12,1,1,2,'Wedge',4.92,'Hole'),(12,1,1,5,'3-Hybrid',5.36,'Hole'),(12,1,2,2,'3-Hybrid',8.00,'Fairway'),(12,1,2,6,'2-Iron',8.00,'Penalty'),(12,1,2,7,'3-Iron',8.73,'Hole'),(12,1,2,8,'5-Iron',8.73,'Hole'),(12,1,3,3,'9-Iron',8.50,'Fairway'),(12,1,4,2,'9-Iron',8.30,'Hole'),(12,1,4,9,'Wedge',7.55,'Hole'),(12,1,5,2,'2-Iron',6.27,'Hole'),(12,1,5,8,'8-Iron',6.90,'Hole'),(12,1,6,1,'Putter',4.83,'Hole'),(12,1,6,7,'3-Iron',5.27,'Hole'),(12,1,7,4,'1-Iron',7.73,'Hole'),(12,1,8,1,'7-Iron',7.82,'Hole'),(12,1,8,8,'Wedge',7.82,'Hole'),(12,1,8,9,'6-Iron',7.82,'Hole'),(12,1,8,10,'1-Iron',7.82,'Hole'),(12,1,10,10,'7-Iron',5.00,'Hole'),(12,1,11,2,'Wedge',7.25,'Hole'),(12,1,11,7,'Wedge',7.91,'Hole'),(12,1,12,10,'2-Iron',6.50,'Hole'),(12,1,13,1,'3-Wood',8.91,'Hole'),(12,1,14,1,'5-Wood',9.09,'Hole'),(12,1,14,3,'8-Iron',9.09,'Hole'),(12,1,15,1,'3-Hybrid',0.00,'Penalty'),(12,1,15,3,'',0.00,'Penalty'),(12,1,15,4,'8-Iron',8.83,'Hole'),(12,1,15,5,'2-Iron',9.64,'Fairway'),(12,1,16,8,'9-Iron',8.25,'Hole'),(12,1,16,10,'5-Hybrid',9.00,'Hole'),(12,1,17,1,'4-Iron',9.00,'Hole'),(12,1,17,3,'5-Wood',9.82,'Hole'),(12,1,17,6,'Putter',9.82,'Hole'),(12,1,18,5,'5-Iron',11.82,'Hole'),(12,1,18,7,'5-Hybrid',11.82,'Hole'),(12,1,18,9,'5-Hybrid',10.83,'Hole'),(12,2,2,6,'7-Iron',8.73,'Hole'),(12,2,2,10,'9-Iron',0.00,'Penalty'),(12,2,3,2,'3-Hybrid',9.27,'Hole'),(12,2,3,10,'4-Iron',8.50,'Hole'),(12,2,4,3,'Driver',7.55,'Hole'),(12,2,4,4,'Wedge',0.00,'Penalty'),(12,2,4,5,'3-Wood',7.55,'Hole'),(12,2,4,6,'3-Wood',6.92,'Hole'),(12,2,4,9,'3-Iron',6.92,'Hole'),(12,2,5,4,'Wedge',5.75,'Hole'),(12,2,6,1,'3-Iron',5.27,'Bunker'),(12,2,6,9,'1-Iron',5.27,'Fairway'),(12,2,7,6,'5-Hybrid',0.00,'Penalty'),(12,2,8,2,'3-Wood',7.82,'Bunker'),(12,2,8,3,'3-Wood',7.17,'Hole'),(12,2,8,4,'9-Iron',0.00,'Penalty'),(12,2,9,4,'Putter',5.80,'Hole'),(12,2,9,5,'5-Hybrid',5.27,'Hole'),(12,2,9,6,'4-Iron',5.27,'Hole'),(12,2,9,9,'5-Hybrid',5.27,'Hole'),(12,2,10,3,'6-Iron',5.00,'Hole'),(12,2,10,6,'5-Wood',5.00,'Hole'),(12,2,11,2,'5-Hybrid',7.25,'Hole'),(12,2,11,4,'3-Iron',7.91,'Fairway'),(12,2,11,5,'5-Hybrid',7.91,'Hole'),(12,2,11,6,'1-Iron',7.91,'Hole'),(12,2,12,6,'4-Hybrid',7.09,'Hole'),(12,2,12,10,'3-Wood',7.09,'Hole'),(12,2,13,3,'Wedge',8.91,'Hole'),(12,2,14,6,'3-Iron',9.09,'Hole'),(12,2,14,7,'5-Iron',9.09,'Hole'),(12,2,15,5,'2-Iron',9.64,'Hole'),(12,2,15,9,'5-Iron',8.83,'Hole'),(12,2,16,1,'5-Iron',8.25,'Bunker'),(12,2,16,2,'2-Iron',9.00,'Hole'),(12,2,16,6,'2-Iron',0.00,'Penalty'),(12,2,17,8,'5-Wood',9.00,'Bunker'),(12,2,17,9,'3-Hybrid',9.82,'Hole'),(12,2,18,2,'3-Hybrid',11.82,'Hole'),(12,2,18,6,'Putter',11.82,'Hole'),(12,3,1,3,'4-Hybrid',4.92,'Bunker'),(12,3,1,10,'5-Iron',4.92,'Penalty'),(12,3,2,3,'2-Iron',8.00,'Bunker'),(12,3,2,4,'4-Iron',9.60,'Hole'),(12,3,3,7,'3-Hybrid',9.27,'Hole'),(12,3,3,8,'6-Iron',9.27,'Hole'),(12,3,4,4,'3-Wood',7.55,'Bunker'),(12,3,5,8,'5-Hybrid',6.27,'Hole'),(12,3,6,1,'2-Iron',4.83,'Hole'),(12,3,8,5,'3-Wood',7.17,'Fairway'),(12,3,8,6,'4-Iron',8.60,'Hole'),(12,3,9,5,'3-Hybrid',4.83,'Fairway'),(12,3,11,6,'3-Wood',7.91,'Hole'),(12,3,13,1,'4-Iron',8.91,'Fairway'),(12,3,13,4,'Putter',8.91,'Hole'),(12,3,13,5,'5-Wood',8.17,'Hole'),(12,3,14,1,'4-Hybrid',8.33,'Hole'),(12,3,14,3,'7-Iron',9.09,'Hole'),(12,3,14,6,'3-Iron',8.33,'Hole'),(12,3,15,5,'Putter',9.64,'Hole'),(12,3,15,8,'3-Iron',9.64,'Hole'),(12,3,15,9,'5-Wood',8.83,'Fairway'),(12,3,17,1,'8-Iron',9.82,'Hole'),(12,3,18,4,'5-Iron',11.82,'Hole'),(12,3,18,7,'Putter',11.82,'Hole'),(12,3,18,8,'4-Iron',11.82,'Hole'),(12,3,18,9,'2-Iron',11.82,'Fairway'),(12,3,18,10,'2-Iron',11.82,'Fairway'),(12,4,1,2,'5-Iron',5.36,'Penalty'),(12,4,1,8,'4-Hybrid',5.36,'Hole'),(12,4,1,10,'3-Iron',5.36,'Hole'),(12,4,2,3,'2-Iron',8.00,'Hole'),(12,4,2,6,'5-Wood',8.00,'Fairway'),(12,4,4,8,'3-Hybrid',6.92,'Hole'),(12,4,6,1,'5-Hybrid',0.00,'Penalty'),(12,4,6,2,'7-Iron',4.83,'Hole'),(12,4,6,6,'3-Iron',5.27,'Hole'),(12,4,7,7,'9-Iron',7.73,'Bunker'),(12,4,8,4,'8-Iron',7.82,'Hole'),(12,4,8,5,'5-Iron',7.82,'Hole'),(12,4,8,6,'5-Hybrid',7.82,'Fairway'),(12,4,8,8,'3-Iron',7.17,'Fairway'),(12,4,8,9,'Wedge',0.00,'Penalty'),(12,4,8,10,'1-Iron',7.17,'Hole'),(12,4,10,6,'5-Wood',5.00,'Hole'),(12,4,10,8,'Wedge',5.00,'Hole'),(12,4,12,3,'7-Iron',7.09,'Hole'),(12,4,13,1,'Putter',8.91,'Hole'),(12,4,14,7,'9-Iron',8.33,'Hole'),(12,4,15,6,'1-Iron',0.00,'Penalty'),(12,4,16,4,'4-Hybrid',8.25,'Hole'),(12,4,17,6,'5-Wood',9.82,'Hole'),(12,4,18,1,'7-Iron',11.82,'Hole'),(12,4,18,5,'4-Hybrid',11.82,'Hole'),(12,4,18,7,'5-Iron',11.82,'Fairway'),(12,4,18,10,'3-Hybrid',11.82,'Fairway'),(12,5,19,6,'Putter',5.64,'Hole'),(12,5,20,4,'',8.00,'Hole'),(12,5,20,7,'Wedge',0.00,'Penalty'),(12,5,20,8,'9-Iron',8.00,'Hole'),(12,5,21,2,'5-Hybrid',8.40,'Hole'),(12,5,21,3,'2-Iron',7.64,'Hole'),(12,5,21,8,'5-Iron',7.64,'Hole'),(12,5,21,9,'5-Hybrid',8.40,'Hole'),(12,5,22,9,'4-Iron',8.91,'Bunker'),(12,5,23,3,'8-Iron',9.09,'Hole'),(12,5,23,10,'2-Iron',9.09,'Hole'),(12,5,24,9,'7-Iron',8.70,'Hole'),(12,5,25,4,'2-Iron',7.82,'Hole'),(12,5,25,7,'4-Hybrid',7.17,'Hole'),(12,5,26,5,'1-Iron',7.55,'Hole'),(12,5,26,7,'5-Wood',7.55,'Hole'),(12,5,26,8,'5-Iron',7.55,'Hole'),(12,5,27,4,'3-Iron',7.73,'Hole'),(12,5,27,5,'1-Iron',7.73,'Hole'),(12,5,28,4,'Wedge',9.10,'Hole'),(12,5,29,4,'3-Iron',7.18,'Hole'),(12,5,29,7,'2-Iron',7.18,'Hole'),(12,5,30,1,'4-Iron',0.00,'Penalty'),(12,5,30,7,'7-Iron',6.75,'Hole'),(12,5,30,8,'9-Iron',7.36,'Fairway'),(12,5,31,1,'Putter',5.83,'Hole'),(12,5,31,3,'3-Hybrid',6.36,'Hole'),(12,5,31,4,'3-Hybrid',5.83,'Hole'),(12,5,31,6,'Putter',6.36,'Fairway'),(12,5,31,8,'Putter',0.00,'Penalty'),(12,5,31,10,'Wedge',5.83,'Bunker'),(12,5,32,2,'9-Iron',8.27,'Hole'),(12,5,32,3,'5-Hybrid',7.58,'Hole'),(12,5,33,3,'7-Iron',11.00,'Fairway'),(12,5,33,5,'Driver',10.08,'Hole'),(12,5,34,1,'3-Hybrid',9.91,'Hole'),(12,5,34,4,'1-Iron',0.00,'Penalty'),(12,5,35,5,'7-Iron',10.91,'Hole'),(12,5,35,7,'6-Iron',12.00,'Hole'),(12,5,36,3,'1-Iron',13.64,'Hole'),(12,5,36,4,'8-Iron',15.00,'Hole'),(12,6,19,5,'Driver',5.17,'Hole'),(12,6,19,10,'1-Iron',5.64,'Hole'),(12,6,21,4,'5-Hybrid',7.64,'Hole'),(12,6,21,5,'5-Hybrid',7.00,'Hole'),(12,6,22,3,'6-Iron',8.17,'Bunker'),(12,6,23,5,'2-Iron',8.33,'Hole'),(12,6,24,2,'6-Iron',7.25,'Hole'),(12,6,24,6,'5-Hybrid',7.91,'Hole'),(12,6,24,7,'1-Iron',7.91,'Fairway'),(12,6,25,1,'5-Wood',7.17,'Hole'),(12,6,25,4,'4-Hybrid',7.17,'Hole'),(12,6,25,6,'4-Iron',7.17,'Fairway'),(12,6,26,1,'4-Iron',6.92,'Hole'),(12,6,26,5,'6-Iron',6.92,'Hole'),(12,6,27,1,'3-Iron',7.73,'Hole'),(12,6,27,3,'2-Iron',7.08,'Fairway'),(12,6,28,1,'9-Iron',8.27,'Fairway'),(12,6,28,8,'3-Iron',8.27,'Bunker'),(12,6,28,9,'5-Iron',8.27,'Hole'),(12,6,29,6,'3-Wood',7.90,'Hole'),(12,6,30,7,'5-Wood',8.10,'Hole'),(12,6,30,9,'Wedge',6.75,'Hole'),(12,6,30,10,'3-Hybrid',7.36,'Hole'),(12,6,31,5,'Wedge',6.36,'Bunker'),(12,6,31,6,'7-Iron',6.36,'Hole'),(12,6,31,8,'5-Iron',6.36,'Bunker'),(12,6,32,2,'4-Hybrid',8.27,'Bunker'),(12,6,32,3,'2-Iron',7.58,'Hole'),(12,6,32,6,'2-Iron',7.58,'Hole'),(12,6,32,10,'Putter',7.58,'Hole'),(12,6,33,6,'Wedge',0.00,'Penalty'),(12,6,33,7,'9-Iron',10.08,'Fairway'),(12,6,34,10,'Putter',9.08,'Hole'),(12,6,35,1,'5-Iron',12.00,'Hole'),(12,6,35,7,'3-Wood',10.91,'Hole'),(12,6,36,3,'5-Wood',13.64,'Hole'),(12,7,19,5,'4-Hybrid',5.64,'Bunker'),(12,7,19,10,'4-Iron',5.17,'Fairway'),(12,7,21,4,'',7.64,'Hole'),(12,7,21,5,'5-Hybrid',7.64,'Hole'),(12,7,21,8,'Wedge',7.64,'Fairway'),(12,7,21,10,'5-Iron',7.00,'Hole'),(12,7,22,7,'4-Iron',8.91,'Hole'),(12,7,23,2,'3-Hybrid',8.33,'Hole'),(12,7,23,4,'',9.09,'Hole'),(12,7,24,3,'7-Iron',7.91,'Hole'),(12,7,24,5,'2-Iron',7.25,'Hole'),(12,7,24,8,'6-Iron',7.91,'Hole'),(12,7,25,2,'Driver',7.82,'Hole'),(12,7,25,3,'9-Iron',7.82,'Hole'),(12,7,25,8,'Wedge',7.17,'Hole'),(12,7,25,10,'Putter',7.82,'Hole'),(12,7,26,2,'3-Wood',0.00,'Penalty'),(12,7,26,5,'6-Iron',0.00,'Penalty'),(12,7,27,3,'Putter',7.08,'Fairway'),(12,7,27,8,'3-Hybrid',7.08,'Hole'),(12,7,30,1,'4-Iron',6.75,'Penalty'),(12,7,30,2,'8-Iron',6.75,'Bunker'),(12,7,30,5,'5-Wood',8.10,'Bunker'),(12,7,31,3,'5-Hybrid',6.36,'Fairway'),(12,7,31,4,'Wedge',6.36,'Bunker'),(12,7,32,5,'5-Iron',7.58,'Hole'),(12,7,32,6,'Wedge',8.27,'Bunker'),(12,7,32,7,'5-Hybrid',8.27,'Hole'),(12,7,33,9,'8-Iron',11.00,'Hole'),(12,7,34,1,'5-Wood',9.91,'Hole'),(12,7,34,4,'8-Iron',9.91,'Hole'),(12,7,35,9,'2-Iron',10.91,'Bunker'),(12,7,36,1,'5-Iron',13.64,'Hole'),(12,7,36,2,'Driver',13.64,'Hole'),(12,8,19,3,'3-Wood',5.17,'Hole'),(12,8,19,4,'8-Iron',5.17,'Fairway'),(12,8,19,6,'4-Iron',5.64,'Hole'),(12,8,21,3,'1-Iron',8.40,'Hole'),(12,8,21,4,'7-Iron',7.64,'Hole'),(12,8,21,6,'Driver',7.64,'Hole'),(12,8,22,2,'',9.80,'Hole'),(12,8,22,6,'4-Hybrid',8.91,'Hole'),(12,8,22,7,'8-Iron',8.17,'Hole'),(12,8,22,8,'5-Wood',8.91,'Hole'),(12,8,23,4,'4-Hybrid',9.09,'Hole'),(12,8,23,7,'9-Iron',8.33,'Hole'),(12,8,24,3,'7-Iron',7.91,'Hole'),(12,8,24,6,'Putter',7.91,'Fairway'),(12,8,24,9,'5-Hybrid',7.25,'Fairway'),(12,8,25,2,'7-Iron',7.17,'Fairway'),(12,8,26,2,'7-Iron',6.92,'Penalty'),(12,8,26,5,'4-Hybrid',6.92,'Hole'),(12,8,27,1,'1-Iron',7.08,'Penalty'),(12,8,27,7,'9-Iron',7.08,'Fairway'),(12,8,27,8,'9-Iron',7.73,'Bunker'),(12,8,28,3,'',8.27,'Hole'),(12,8,28,4,'3-Hybrid',7.58,'Hole'),(12,8,28,6,'8-Iron',8.27,'Hole'),(12,8,28,7,'3-Wood',8.27,'Hole'),(12,8,29,2,'3-Wood',7.18,'Fairway'),(12,8,29,5,'3-Iron',7.18,'Hole'),(12,8,30,9,'7-Iron',6.75,'Hole'),(12,8,30,10,'5-Wood',6.75,'Hole'),(12,8,31,2,'Putter',5.83,'Fairway'),(12,8,31,4,'4-Hybrid',6.36,'Hole'),(12,8,31,5,'4-Hybrid',6.36,'Hole'),(12,8,31,6,'4-Hybrid',5.83,'Hole'),(12,8,31,8,'2-Iron',6.36,'Hole'),(12,8,33,2,'Driver',10.08,'Hole'),(12,8,33,5,'Wedge',10.08,'Hole'),(12,8,33,10,'1-Iron',11.00,'Hole'),(12,8,34,2,'3-Hybrid',9.08,'Hole'),(12,8,34,7,'4-Hybrid',9.91,'Hole'),(12,8,34,8,'Wedge',9.91,'Hole'),(12,8,35,6,'5-Wood',10.00,'Bunker'),(12,8,36,2,'3-Wood',12.50,'Fairway'),(12,8,36,4,'3-Wood',13.64,'Hole'),(12,8,36,9,'5-Wood',12.50,'Hole'),(12,9,37,1,'2-Iron',5.83,'Hole'),(12,9,37,7,'5-Wood',6.36,'Hole'),(12,9,37,8,'7-Iron',6.36,'Hole'),(12,9,37,9,'6-Iron',6.36,'Hole'),(12,9,38,1,'6-Iron',0.00,'Penalty'),(12,9,38,2,'5-Hybrid',6.18,'Hole'),(12,9,38,3,'Driver',5.67,'Fairway'),(12,9,38,10,'Putter',5.67,'Hole'),(12,9,39,1,'1-Iron',5.91,'Hole'),(12,9,39,6,'1-Iron',5.91,'Hole'),(12,9,40,5,'3-Iron',6.00,'Hole'),(12,9,40,10,'3-Wood',6.60,'Hole'),(12,9,41,2,'5-Hybrid',6.27,'Hole'),(12,9,41,3,'Wedge',5.75,'Fairway'),(12,9,42,3,'9-Iron',5.00,'Hole'),(12,9,42,6,'5-Iron',5.45,'Fairway'),(12,9,42,10,'5-Iron',5.45,'Bunker'),(12,9,45,3,'3-Wood',8.73,'Hole'),(12,9,45,4,'Putter',10.67,'Hole'),(12,9,45,5,'1-Iron',9.60,'Hole'),(12,9,45,9,'8-Iron',8.73,'Fairway'),(12,9,46,1,'3-Wood',8.91,'Hole'),(12,9,46,3,'Driver',0.00,'Penalty'),(12,9,46,4,'8-Iron',8.17,'Bunker'),(12,9,47,10,'3-Hybrid',8.08,'Fairway'),(12,9,49,5,'3-Iron',9.58,'Fairway'),(12,9,49,9,'Wedge',10.45,'Hole'),(12,9,50,5,'8-Iron',0.00,'Penalty'),(12,9,50,10,'3-Wood',10.55,'Hole'),(12,9,51,5,'4-Iron',10.82,'Hole'),(12,9,53,2,'7-Iron',11.82,'Hole'),(12,9,54,3,'4-Iron',50.91,'Hole'),(12,10,37,2,'1-Iron',6.36,'Fairway'),(12,10,37,8,'5-Hybrid',5.83,'Hole'),(12,10,38,1,'Putter',5.67,'Bunker'),(12,10,38,2,'3-Hybrid',5.67,'Hole'),(12,10,38,5,'7-Iron',5.67,'Hole'),(12,10,38,8,'Wedge',6.18,'Bunker'),(12,10,38,10,'4-Hybrid',6.18,'Hole'),(12,10,39,5,'8-Iron',5.42,'Fairway'),(12,10,39,7,'4-Iron',5.91,'Hole'),(12,10,40,1,'Driver',6.00,'Hole'),(12,10,40,10,'Putter',6.00,'Hole'),(12,10,41,1,'7-Iron',5.75,'Bunker'),(12,10,42,1,'9-Iron',5.00,'Hole'),(12,10,43,7,'1-Iron',6.50,'Hole'),(12,10,44,3,'8-Iron',7.18,'Fairway'),(12,10,44,4,'7-Iron',7.18,'Bunker'),(12,10,44,10,'6-Iron',7.18,'Hole'),(12,10,45,2,'5-Hybrid',8.73,'Hole'),(12,10,45,9,'5-Hybrid',8.73,'Bunker'),(12,10,45,10,'Wedge',8.00,'Fairway'),(12,10,46,2,'4-Hybrid',8.91,'Fairway'),(12,10,46,4,'4-Hybrid',0.00,'Penalty'),(12,10,46,10,'2-Iron',9.80,'Hole'),(12,10,47,2,'1-Iron',8.82,'Hole'),(12,10,48,2,'5-Iron',7.75,'Hole'),(12,10,49,3,'Putter',10.45,'Hole'),(12,10,50,4,'6-Iron',9.67,'Fairway'),(12,10,50,7,'Wedge',9.67,'Hole'),(12,10,50,8,'5-Hybrid',9.67,'Hole'),(12,10,50,9,'3-Hybrid',9.67,'Fairway'),(12,10,51,1,'2-Iron',9.92,'Hole'),(12,10,51,2,'3-Iron',10.82,'Hole'),(12,10,51,3,'4-Hybrid',0.00,'Penalty'),(12,10,52,2,'5-Iron',11.36,'Hole'),(12,10,52,7,'3-Wood',12.50,'Hole'),(12,10,52,9,'3-Hybrid',11.36,'Hole'),(12,10,53,4,'3-Wood',11.82,'Fairway'),(12,10,53,5,'4-Hybrid',11.82,'Hole'),(12,10,53,6,'6-Iron',10.83,'Fairway'),(12,10,53,9,'9-Iron',11.82,'Hole'),(12,10,53,10,'3-Hybrid',11.82,'Hole'),(12,10,54,5,'7-Iron',50.91,'Hole'),(12,10,54,10,'3-Wood',56.00,'Hole'),(12,11,37,8,'5-Wood',6.36,'Fairway'),(12,11,38,1,'4-Iron',6.18,'Fairway'),(12,11,38,5,'1-Iron',6.18,'Hole'),(12,11,38,6,'3-Hybrid',6.18,'Hole'),(12,11,38,7,'',5.67,'Hole'),(12,11,38,8,'3-Wood',6.18,'Hole'),(12,11,38,10,'1-Iron',0.00,'Penalty'),(12,11,39,2,'4-Iron',5.42,'Fairway'),(12,11,39,9,'5-Hybrid',5.91,'Hole'),(12,11,39,10,'Wedge',0.00,'Penalty'),(12,11,40,1,'Wedge',5.50,'Fairway'),(12,11,41,1,'Putter',6.27,'Hole'),(12,11,41,9,'4-Iron',6.27,'Hole'),(12,11,42,2,'9-Iron',5.45,'Hole'),(12,11,42,6,'3-Hybrid',5.00,'Hole'),(12,11,42,10,'1-Iron',5.45,'Fairway'),(12,11,43,4,'4-Hybrid',7.09,'Hole'),(12,11,43,6,'5-Iron',7.80,'Hole'),(12,11,43,10,'3-Wood',6.50,'Bunker'),(12,11,44,1,'9-Iron',7.18,'Hole'),(12,11,45,3,'5-Wood',8.73,'Hole'),(12,11,45,8,'5-Hybrid',8.73,'Hole'),(12,11,45,10,'5-Hybrid',8.73,'Hole'),(12,11,48,2,'3-Wood',7.75,'Bunker'),(12,11,48,5,'Putter',8.45,'Hole'),(12,11,48,6,'Putter',7.75,'Hole'),(12,11,49,1,'4-Iron',9.58,'Hole'),(12,11,49,5,'3-Iron',10.45,'Fairway'),(12,11,50,1,'',10.55,'Hole'),(12,11,50,3,'9-Iron',10.55,'Hole'),(12,11,50,4,'Wedge',10.55,'Hole'),(12,11,51,3,'7-Iron',10.82,'Fairway'),(12,11,51,9,'7-Iron',9.92,'Hole'),(12,11,52,5,'8-Iron',11.36,'Hole'),(12,11,52,6,'5-Wood',10.42,'Fairway'),(12,11,52,7,'3-Hybrid',10.42,'Bunker'),(12,11,53,4,'Putter',11.82,'Hole'),(12,11,53,8,'9-Iron',10.83,'Fairway'),(12,11,54,2,'9-Iron',50.91,'Hole'),(12,11,54,3,'6-Iron',46.67,'Fairway'),(12,12,37,3,'9-Iron',6.36,'Hole'),(12,12,37,8,'Putter',6.36,'Fairway'),(12,12,38,1,'5-Iron',6.18,'Hole'),(12,12,38,7,'Putter',6.18,'Hole'),(12,12,38,8,'4-Hybrid',6.18,'Hole'),(12,12,40,6,'9-Iron',6.00,'Hole'),(12,12,40,7,'1-Iron',5.50,'Fairway'),(12,12,40,10,'4-Iron',6.00,'Fairway'),(12,12,41,6,'Putter',6.27,'Fairway'),(12,12,42,2,'9-Iron',5.00,'Hole'),(12,12,42,3,'4-Hybrid',5.00,'Bunker'),(12,12,44,2,'Wedge',6.58,'Hole'),(12,12,44,3,'7-Iron',7.18,'Hole'),(12,12,45,1,'',8.00,'Hole'),(12,12,45,3,'4-Iron',8.73,'Hole'),(12,12,45,7,'5-Hybrid',8.73,'Fairway'),(12,12,45,8,'4-Hybrid',9.60,'Hole'),(12,12,46,1,'4-Hybrid',9.80,'Hole'),(12,12,46,2,'5-Hybrid',0.00,'Penalty'),(12,12,46,7,'4-Iron',8.91,'Hole'),(12,12,47,1,'5-Hybrid',8.08,'Bunker'),(12,12,47,2,'3-Hybrid',8.82,'Hole'),(12,12,47,3,'9-Iron',8.08,'Hole'),(12,12,47,5,'Putter',8.08,'Hole'),(12,12,47,8,'3-Wood',8.82,'Fairway'),(12,12,47,9,'4-Iron',9.70,'Hole'),(12,12,48,3,'5-Wood',8.45,'Hole'),(12,12,48,6,'',8.45,'Hole'),(12,12,48,10,'1-Iron',8.45,'Fairway'),(12,12,49,3,'5-Hybrid',10.45,'Hole'),(12,12,50,5,'4-Hybrid',9.67,'Hole'),(12,12,51,4,'3-Wood',9.92,'Bunker'),(12,12,52,2,'1-Iron',12.50,'Fairway'),(12,12,52,3,'5-Wood',11.36,'Hole'),(12,12,52,7,'3-Hybrid',11.36,'Hole'),(12,12,52,10,'3-Wood',10.42,'Hole'),(12,12,54,1,'',50.91,'Hole'),(12,12,54,2,'5-Iron',50.91,'Hole'),(12,12,54,7,'8-Iron',46.67,'Hole'),(12,13,55,1,'5-Hybrid',6.09,'Hole'),(12,13,55,3,'Putter',6.09,'Hole'),(12,13,55,7,'6-Iron',6.09,'Hole'),(12,13,55,10,'6-Iron',6.09,'Hole'),(12,13,56,2,'9-Iron',6.18,'Hole'),(12,13,56,4,'5-Wood',6.18,'Hole'),(12,13,56,7,'Putter',6.18,'Hole'),(12,13,56,10,'4-Iron',6.18,'Hole'),(12,13,57,2,'',6.90,'Hole'),(12,13,57,8,'4-Hybrid',6.90,'Fairway'),(12,13,59,1,'5-Hybrid',6.45,'Hole'),(12,13,59,8,'5-Iron',7.10,'Hole'),(12,13,60,1,'3-Wood',6.55,'Hole'),(12,13,60,4,'4-Hybrid',6.00,'Fairway'),(12,13,60,7,'4-Hybrid',6.00,'Hole'),(12,13,61,3,'5-Wood',8.58,'Bunker'),(12,13,61,7,'2-Iron',9.36,'Hole'),(12,13,61,9,'8-Iron',9.36,'Hole'),(12,13,62,9,'2-Iron',9.45,'Hole'),(12,13,63,7,'5-Iron',8.83,'Fairway'),(12,13,64,3,'4-Iron',9.00,'Hole'),(12,13,66,1,'5-Hybrid',8.09,'Hole'),(12,13,66,2,'3-Iron',7.42,'Fairway'),(12,13,66,3,'Driver',8.90,'Hole'),(12,13,66,4,'8-Iron',8.09,'Hole'),(12,13,67,5,'6-Iron',8.75,'Fairway'),(12,13,67,8,'5-Iron',9.55,'Hole'),(12,13,68,5,'2-Iron',9.82,'Hole'),(12,13,68,7,'5-Iron',9.00,'Hole'),(12,13,68,9,'5-Wood',9.00,'Fairway'),(12,13,69,2,'3-Wood',9.91,'Hole'),(12,13,70,2,'1-Iron',9.92,'Hole'),(12,13,70,8,'2-Iron',10.82,'Fairway'),(12,13,71,4,'5-Wood',10.08,'Hole'),(12,13,71,5,'3-Wood',11.00,'Hole'),(12,13,71,6,'6-Iron',12.10,'Hole'),(12,13,71,7,'9-Iron',10.08,'Hole'),(12,13,71,10,'8-Iron',10.08,'Hole'),(12,13,72,1,'3-Hybrid',14.00,'Hole'),(12,13,72,7,'Wedge',12.73,'Hole'),(12,14,55,3,'5-Hybrid',6.09,'Hole'),(12,14,55,8,'8-Iron',6.09,'Hole'),(12,14,56,7,'4-Hybrid',6.18,'Fairway'),(12,14,56,8,'6-Iron',6.18,'Hole'),(12,14,57,10,'3-Iron',5.75,'Hole'),(12,14,58,4,'Wedge',6.36,'Bunker'),(12,14,59,5,'5-Iron',5.92,'Bunker'),(12,14,59,6,'1-Iron',6.45,'Hole'),(12,14,60,2,'3-Wood',6.00,'Hole'),(12,14,60,9,'Wedge',6.55,'Hole'),(12,14,60,10,'7-Iron',6.00,'Hole'),(12,14,61,1,'7-Iron',8.58,'Fairway'),(12,14,61,2,'5-Wood',9.36,'Hole'),(12,14,61,4,'1-Iron',8.58,'Hole'),(12,14,61,10,'5-Wood',0.00,'Penalty'),(12,14,62,1,'2-Iron',9.45,'Hole'),(12,14,62,9,'7-Iron',9.45,'Hole'),(12,14,63,2,'8-Iron',8.83,'Fairway'),(12,14,63,5,'5-Iron',9.64,'Hole'),(12,14,63,6,'Wedge',11.78,'Hole'),(12,14,64,5,'5-Iron',0.00,'Penalty'),(12,14,65,1,'6-Iron',9.36,'Bunker'),(12,14,65,3,'5-Wood',8.58,'Fairway'),(12,14,65,5,'5-Iron',8.58,'Hole'),(12,14,65,6,'3-Iron',0.00,'Penalty'),(12,14,66,2,'',8.09,'Hole'),(12,14,66,3,'1-Iron',7.42,'Bunker'),(12,14,66,7,'5-Hybrid',8.09,'Hole'),(12,14,67,4,'',9.55,'Hole'),(12,14,67,5,'7-Iron',9.55,'Hole'),(12,14,68,1,'4-Iron',9.00,'Hole'),(12,14,68,4,'Putter',9.82,'Hole'),(12,14,68,5,'6-Iron',9.82,'Hole'),(12,14,68,8,'3-Wood',0.00,'Penalty'),(12,14,68,9,'2-Iron',9.82,'Hole'),(12,14,69,3,'Driver',9.08,'Fairway'),(12,14,69,6,'2-Iron',9.91,'Hole'),(12,14,69,7,'4-Iron',9.08,'Fairway'),(12,14,69,10,'Wedge',10.90,'Hole'),(12,14,70,3,'5-Wood',10.82,'Fairway'),(12,14,70,4,'9-Iron',10.82,'Hole'),(12,14,72,5,'2-Iron',12.73,'Hole'),(12,14,72,8,'3-Wood',0.00,'Penalty'),(12,14,72,10,'5-Hybrid',11.67,'Bunker'),(12,15,55,8,'5-Hybrid',6.09,'Hole'),(12,15,56,7,'3-Iron',6.18,'Hole'),(12,15,56,9,'1-Iron',5.67,'Bunker'),(12,15,57,2,'4-Iron',5.75,'Hole'),(12,15,57,10,'3-Hybrid',6.90,'Hole'),(12,15,59,3,'4-Iron',6.45,'Hole'),(12,15,59,7,'9-Iron',5.92,'Hole'),(12,15,59,9,'8-Iron',5.92,'Fairway'),(12,15,60,3,'',6.55,'Hole'),(12,15,60,5,'',6.00,'Bunker'),(12,15,60,10,'2-Iron',6.00,'Hole'),(12,15,61,4,'Driver',8.58,'Fairway'),(12,15,61,5,'Putter',8.58,'Fairway'),(12,15,61,6,'8-Iron',10.30,'Hole'),(12,15,62,4,'6-Iron',8.67,'Hole'),(12,15,62,6,'Wedge',9.45,'Hole'),(12,15,63,9,'4-Iron',9.64,'Bunker'),(12,15,64,4,'7-Iron',9.82,'Hole'),(12,15,64,10,'6-Iron',9.82,'Hole'),(12,15,65,1,'5-Hybrid',9.36,'Hole'),(12,15,65,4,'2-Iron',8.58,'Fairway'),(12,15,65,5,'4-Iron',8.58,'Hole'),(12,15,66,6,'4-Hybrid',8.09,'Penalty'),(12,15,68,5,'5-Iron',9.00,'Hole'),(12,15,68,8,'',9.82,'Hole'),(12,15,68,9,'Putter',9.82,'Hole'),(12,15,69,10,'Putter',10.90,'Hole'),(12,15,70,3,'2-Iron',10.82,'Penalty'),(12,15,70,4,'5-Hybrid',9.92,'Hole'),(12,15,70,7,'2-Iron',10.82,'Fairway'),(12,15,70,8,'8-Iron',9.92,'Hole'),(12,15,71,1,'9-Iron',11.00,'Hole'),(12,15,71,2,'4-Hybrid',11.00,'Hole'),(12,15,71,7,'5-Iron',11.00,'Hole'),(12,15,71,10,'5-Iron',10.08,'Fairway'),(12,15,72,4,'5-Hybrid',11.67,'Fairway'),(12,16,55,1,'',6.09,'Hole'),(12,16,55,7,'1-Iron',5.58,'Fairway'),(12,16,55,8,'5-Wood',6.09,'Hole'),(12,16,56,3,'4-Hybrid',5.67,'Fairway'),(12,16,56,4,'3-Iron',0.00,'Penalty'),(12,16,56,5,'2-Iron',6.18,'Fairway'),(12,16,56,8,'5-Wood',5.67,'Fairway'),(12,16,56,10,'1-Iron',6.18,'Hole'),(12,16,57,1,'',6.27,'Hole'),(12,16,57,3,'4-Iron',5.75,'Hole'),(12,16,57,5,'',6.27,'Fairway'),(12,16,57,7,'8-Iron',6.27,'Hole'),(12,16,57,9,'3-Hybrid',6.27,'Hole'),(12,16,58,3,'3-Hybrid',6.36,'Fairway'),(12,16,58,4,'5-Hybrid',6.36,'Hole'),(12,16,59,4,'7-Iron',6.45,'Hole'),(12,16,62,2,'2-Iron',8.67,'Fairway'),(12,16,62,7,'4-Iron',8.67,'Fairway'),(12,16,63,2,'Wedge',10.60,'Hole'),(12,16,63,4,'9-Iron',9.64,'Hole'),(12,16,64,1,'2-Iron',9.00,'Hole'),(12,16,64,2,'4-Iron',9.82,'Hole'),(12,16,64,3,'8-Iron',9.00,'Fairway'),(12,16,66,3,'3-Hybrid',8.09,'Hole'),(12,16,66,6,'6-Iron',7.42,'Fairway'),(12,16,66,8,'9-Iron',8.09,'Hole'),(12,16,67,1,'1-Iron',8.75,'Hole'),(12,16,67,4,'2-Iron',9.55,'Fairway'),(12,16,67,9,'Driver',8.75,'Hole'),(12,16,68,1,'5-Hybrid',9.00,'Hole'),(12,16,68,3,'3-Wood',9.00,'Hole'),(12,16,68,5,'7-Iron',0.00,'Penalty'),(12,16,69,2,'7-Iron',9.08,'Fairway'),(12,16,69,3,'5-Iron',9.91,'Hole'),(12,16,69,7,'7-Iron',9.91,'Hole'),(12,16,69,8,'7-Iron',9.08,'Hole'),(12,16,70,2,'2-Iron',9.92,'Fairway'),(12,16,70,5,'5-Hybrid',10.82,'Hole'),(12,16,70,6,'6-Iron',9.92,'Hole'),(12,16,71,3,'5-Wood',0.00,'Penalty'),(12,16,72,2,'6-Iron',12.73,'Fairway'),(12,16,72,5,'5-Hybrid',12.73,'Hole'),(12,17,73,2,'Putter',42.67,'Hole'),(12,17,73,7,'8-Iron',42.67,'Fairway'),(12,17,74,3,'6-Iron',16.55,'Hole'),(12,17,74,9,'Wedge',16.55,'Hole'),(12,17,75,8,'5-Iron',8.09,'Hole'),(12,17,76,6,'5-Wood',6.58,'Fairway'),(12,17,76,8,'2-Iron',6.58,'Hole'),(12,17,76,9,'4-Iron',7.18,'Hole'),(12,17,78,2,'8-Iron',8.00,'Hole'),(12,17,78,10,'1-Iron',8.00,'Hole'),(12,17,80,1,'Wedge',7.00,'Fairway'),(12,17,80,4,'5-Iron',7.64,'Hole'),(12,17,81,3,'7-Iron',8.18,'Hole'),(12,17,81,4,'4-Hybrid',8.18,'Hole'),(12,17,81,5,'7-Iron',8.18,'Hole'),(12,17,81,10,'7-Iron',7.50,'Hole'),(12,17,82,1,'3-Hybrid',9.00,'Hole'),(12,17,82,3,'3-Iron',9.00,'Hole'),(12,17,82,9,'Driver',9.00,'Hole'),(12,17,83,2,'4-Iron',5.83,'Bunker'),(12,17,83,9,'8-Iron',0.00,'Penalty'),(12,17,84,7,'7-Iron',6.64,'Bunker'),(12,17,84,10,'8-Iron',6.64,'Hole'),(12,17,85,4,'5-Iron',7.82,'Hole'),(12,17,86,8,'1-Iron',10.00,'Hole'),(12,17,87,2,'4-Iron',0.00,'Penalty'),(12,17,87,6,'3-Hybrid',9.92,'Fairway'),(12,17,87,8,'8-Iron',10.82,'Fairway'),(12,17,88,3,'3-Hybrid',11.18,'Hole'),(12,17,88,6,'6-Iron',10.25,'Hole'),(12,17,88,8,'9-Iron',10.25,'Fairway'),(12,17,89,2,'3-Wood',12.73,'Hole'),(12,17,89,4,'',12.73,'Hole'),(12,17,89,10,'3-Iron',11.67,'Hole'),(12,17,90,2,'',14.55,'Hole'),(12,17,90,8,'3-Hybrid',14.55,'Hole'),(12,18,73,5,'3-Hybrid',42.67,'Bunker'),(12,18,74,5,'Putter',16.55,'Hole'),(12,18,74,8,'3-Iron',16.55,'Hole'),(12,18,74,9,'6-Iron',16.55,'Hole'),(12,18,75,7,'3-Wood',8.09,'Hole'),(12,18,76,10,'7-Iron',7.18,'Hole'),(12,18,77,1,'3-Wood',6.67,'Hole'),(12,18,77,6,'3-Hybrid',6.67,'Fairway'),(12,18,77,7,'7-Iron',7.27,'Hole'),(12,18,77,9,'3-Wood',7.27,'Hole'),(12,18,78,9,'6-Iron',8.00,'Fairway'),(12,18,78,10,'3-Iron',8.00,'Hole'),(12,18,79,4,'8-Iron',7.17,'Hole'),(12,18,79,6,'2-Iron',7.17,'Fairway'),(12,18,79,9,'',7.82,'Hole'),(12,18,79,10,'Wedge',7.82,'Penalty'),(12,18,80,1,'4-Iron',7.64,'Hole'),(12,18,80,5,'5-Iron',7.64,'Bunker'),(12,18,80,8,'9-Iron',7.64,'Bunker'),(12,18,81,10,'5-Hybrid',8.18,'Hole'),(12,18,82,4,'1-Iron',9.90,'Hole'),(12,18,84,10,'Wedge',6.08,'Hole'),(12,18,85,3,'1-Iron',7.82,'Fairway'),(12,18,85,5,'8-Iron',7.17,'Hole'),(12,18,85,6,'5-Wood',8.60,'Hole'),(12,18,86,4,'3-Hybrid',10.00,'Hole'),(12,18,86,6,'1-Iron',10.00,'Hole'),(12,18,86,8,'5-Wood',9.17,'Fairway'),(12,18,88,1,'1-Iron',12.30,'Bunker'),(12,18,88,7,'5-Wood',10.25,'Hole'),(12,18,88,9,'4-Iron',11.18,'Hole'),(12,18,89,5,'4-Iron',12.73,'Fairway'),(12,18,90,1,'Wedge',13.33,'Hole'),(12,18,90,8,'9-Iron',16.00,'Hole'),(12,19,73,7,'Wedge',51.20,'Bunker'),(12,19,73,8,'4-Iron',46.55,'Hole'),(12,19,73,9,'Wedge',46.55,'Hole'),(12,19,74,7,'1-Iron',16.55,'Hole'),(12,19,76,2,'9-Iron',6.58,'Hole'),(12,19,77,3,'5-Wood',6.67,'Fairway'),(12,19,77,6,'4-Hybrid',6.67,'Fairway'),(12,19,77,7,'3-Iron',7.27,'Hole'),(12,19,78,6,'5-Iron',8.00,'Hole'),(12,19,78,7,'5-Wood',7.33,'Bunker'),(12,19,80,6,'Wedge',7.00,'Fairway'),(12,19,81,1,'4-Iron',7.50,'Hole'),(12,19,81,4,'Putter',7.50,'Hole'),(12,19,81,8,'Wedge',8.18,'Hole'),(12,19,83,1,'Putter',6.36,'Fairway'),(12,19,83,2,'5-Hybrid',6.36,'Hole'),(12,19,83,3,'Wedge',6.36,'Hole'),(12,19,83,4,'5-Iron',6.36,'Hole'),(12,19,83,6,'4-Hybrid',5.83,'Bunker'),(12,19,83,9,'4-Hybrid',5.83,'Hole'),(12,19,84,2,'7-Iron',6.64,'Hole'),(12,19,84,4,'Wedge',6.64,'Hole'),(12,19,84,5,'6-Iron',6.08,'Hole'),(12,19,85,8,'6-Iron',7.82,'Fairway'),(12,19,85,10,'5-Iron',7.17,'Fairway'),(12,19,86,1,'8-Iron',10.00,'Hole'),(12,19,86,5,'7-Iron',10.00,'Hole'),(12,19,86,8,'3-Iron',11.00,'Hole'),(12,19,87,5,'1-Iron',9.92,'Hole'),(12,19,87,6,'3-Wood',11.90,'Hole'),(12,19,88,8,'4-Iron',10.25,'Hole'),(12,19,88,10,'5-Wood',11.18,'Hole'),(12,19,89,2,'5-Iron',12.73,'Hole'),(12,19,90,1,'5-Hybrid',14.55,'Fairway'),(12,19,90,5,'8-Iron',14.55,'Hole'),(12,19,90,6,'3-Iron',13.33,'Hole'),(12,19,90,9,'5-Wood',14.55,'Hole'),(12,20,73,1,'4-Hybrid',42.67,'Hole'),(12,20,73,3,'5-Wood',46.55,'Hole'),(12,20,73,4,'1-Iron',42.67,'Hole'),(12,20,73,7,'7-Iron',46.55,'Hole'),(12,20,73,8,'Putter',0.00,'Penalty'),(12,20,74,2,'Putter',0.00,'Penalty'),(12,20,74,6,'5-Iron',16.55,'Hole'),(12,20,75,1,'1-Iron',8.90,'Hole'),(12,20,75,4,'4-Hybrid',8.90,'Bunker'),(12,20,75,5,'Driver',8.09,'Fairway'),(12,20,75,7,'4-Iron',8.09,'Fairway'),(12,20,75,10,'3-Iron',8.09,'Hole'),(12,20,76,3,'3-Hybrid',7.18,'Hole'),(12,20,76,5,'2-Iron',7.18,'Hole'),(12,20,77,2,'5-Hybrid',7.27,'Hole'),(12,20,77,10,'3-Hybrid',7.27,'Hole'),(12,20,78,2,'3-Iron',8.80,'Hole'),(12,20,78,5,'4-Iron',0.00,'Penalty'),(12,20,78,8,'4-Iron',7.33,'Fairway'),(12,20,78,10,'3-Wood',7.33,'Hole'),(12,20,79,7,'6-Iron',0.00,'Penalty'),(12,20,80,3,'6-Iron',7.64,'Hole'),(12,20,80,9,'8-Iron',7.00,'Fairway'),(12,20,81,4,'5-Iron',8.18,'Fairway'),(12,20,81,6,'Driver',8.18,'Hole'),(12,20,81,9,'3-Wood',7.50,'Hole'),(12,20,82,9,'1-Iron',9.00,'Fairway'),(12,20,83,2,'6-Iron',0.00,'Penalty'),(12,20,83,4,'Wedge',5.83,'Bunker'),(12,20,83,5,'7-Iron',6.36,'Hole'),(12,20,84,2,'5-Wood',6.64,'Bunker'),(12,20,84,3,'1-Iron',6.08,'Hole'),(12,20,84,6,'5-Wood',6.64,'Hole'),(12,20,84,7,'',6.64,'Fairway'),(12,20,85,2,'1-Iron',7.82,'Hole'),(12,20,85,5,'3-Wood',8.60,'Hole'),(12,20,85,6,'5-Hybrid',7.82,'Hole'),(12,20,85,7,'6-Iron',7.82,'Hole'),(12,20,86,2,'5-Iron',9.17,'Hole'),(12,20,86,6,'3-Hybrid',9.17,'Fairway'),(12,20,87,3,'5-Wood',10.82,'Hole'),(12,20,87,6,'5-Wood',11.90,'Hole'),(12,20,87,7,'5-Wood',10.82,'Hole'),(12,20,88,4,'Driver',10.25,'Hole'),(12,20,88,5,'5-Hybrid',11.18,'Hole'),(12,20,88,6,'9-Iron',10.25,'Hole'),(12,20,88,9,'7-Iron',11.18,'Hole'),(12,20,88,10,'1-Iron',11.18,'Hole'),(12,20,89,2,'3-Wood',12.73,'Bunker'),(12,20,89,3,'8-Iron',12.73,'Hole'),(12,20,90,3,'1-Iron',13.33,'Bunker'),(12,20,90,4,'5-Hybrid',14.55,'Hole'),(12,20,90,7,'4-Iron',13.33,'Fairway'),(13,1,1,1,'3-Hybrid',5.36,'Bunker'),(13,1,2,2,'5-Iron',8.00,'Hole'),(13,1,2,6,'2-Iron',0.00,'Penalty'),(13,1,3,3,'3-Wood',8.50,'Penalty'),(13,1,15,1,'6-Iron',8.83,'Hole'),(13,1,15,3,'3-Iron',9.64,'Hole'),(13,1,15,5,'2-Iron',9.64,'Hole'),(13,2,2,10,'Wedge',8.73,'Hole'),(13,2,4,4,'3-Hybrid',6.92,'Hole'),(13,2,6,1,'1-Iron',5.27,'Hole'),(13,2,6,9,'1-Iron',5.27,'Hole'),(13,2,7,6,'4-Iron',7.08,'Hole'),(13,2,8,2,'5-Hybrid',7.82,'Hole'),(13,2,8,4,'5-Wood',7.82,'Hole'),(13,2,11,4,'4-Iron',7.91,'Hole'),(13,2,16,1,'4-Hybrid',8.25,'Hole'),(13,2,16,6,'4-Hybrid',9.00,'Hole'),(13,2,17,8,'6-Iron',9.00,'Hole'),(13,3,1,3,'5-Wood',4.92,'Hole'),(13,3,1,10,'5-Iron',0.00,'Penalty'),(13,3,2,3,'3-Hybrid',8.00,'Bunker'),(13,3,4,4,'5-Wood',7.55,'Hole'),(13,3,8,5,'7-Iron',7.17,'Hole'),(13,3,9,5,'3-Wood',4.83,'Hole'),(13,3,13,1,'3-Wood',8.91,'Hole'),(13,3,15,9,'8-Iron',8.83,'Hole'),(13,3,18,9,'8-Iron',11.82,'Fairway'),(13,3,18,10,'Driver',11.82,'Hole'),(13,4,1,2,'5-Iron',0.00,'Penalty'),(13,4,2,6,'2-Iron',8.00,'Hole'),(13,4,6,1,'Putter',4.83,'Hole'),(13,4,7,7,'5-Wood',7.73,'Hole'),(13,4,8,6,'4-Iron',7.82,'Fairway'),(13,4,8,8,'9-Iron',7.17,'Hole'),(13,4,8,9,'3-Hybrid',7.82,'Hole'),(13,4,15,6,'3-Iron',9.64,'Hole'),(13,4,18,7,'5-Wood',11.82,'Hole'),(13,4,18,10,'Putter',11.82,'Hole'),(13,5,20,7,'4-Hybrid',7.33,'Hole'),(13,5,22,9,'1-Iron',8.91,'Hole'),(13,5,30,1,'5-Wood',7.36,'Bunker'),(13,5,30,8,'7-Iron',7.36,'Hole'),(13,5,31,6,'3-Wood',6.36,'Hole'),(13,5,31,8,'8-Iron',6.36,'Hole'),(13,5,31,10,'6-Iron',5.83,'Hole'),(13,5,33,3,'6-Iron',11.00,'Hole'),(13,5,34,4,'Putter',9.91,'Hole'),(13,6,22,3,'7-Iron',8.17,'Hole'),(13,6,24,7,'3-Wood',7.91,'Hole'),(13,6,25,6,'3-Wood',7.17,'Hole'),(13,6,27,3,'3-Hybrid',7.08,'Hole'),(13,6,28,1,'5-Wood',8.27,'Fairway'),(13,6,28,8,'3-Wood',8.27,'Hole'),(13,6,31,5,'Driver',6.36,'Hole'),(13,6,31,8,'5-Wood',6.36,'Hole'),(13,6,32,2,'8-Iron',8.27,'Hole'),(13,6,33,6,'8-Iron',10.08,'Fairway'),(13,6,33,7,'8-Iron',10.08,'Hole'),(13,7,19,5,'5-Iron',5.64,'Hole'),(13,7,19,10,'9-Iron',5.17,'Hole'),(13,7,21,8,'2-Iron',7.64,'Hole'),(13,7,26,2,'6-Iron',6.92,'Hole'),(13,7,26,5,'Wedge',6.92,'Bunker'),(13,7,27,3,'6-Iron',7.08,'Fairway'),(13,7,30,1,'4-Iron',0.00,'Penalty'),(13,7,30,2,'Putter',6.75,'Hole'),(13,7,30,5,'4-Iron',8.10,'Hole'),(13,7,31,3,'1-Iron',6.36,'Hole'),(13,7,31,4,'1-Iron',6.36,'Hole'),(13,7,32,6,'Driver',8.27,'Hole'),(13,7,35,9,'6-Iron',10.91,'Hole'),(13,8,19,4,'5-Iron',5.17,'Hole'),(13,8,24,6,'Wedge',7.91,'Bunker'),(13,8,24,9,'Wedge',7.25,'Hole'),(13,8,25,2,'4-Hybrid',7.17,'Hole'),(13,8,26,2,'7-Iron',0.00,'Penalty'),(13,8,27,1,'1-Iron',0.00,'Penalty'),(13,8,27,7,'Wedge',7.08,'Fairway'),(13,8,27,8,'3-Wood',7.73,'Hole'),(13,8,29,2,'4-Iron',7.18,'Hole'),(13,8,31,2,'6-Iron',5.83,'Hole'),(13,8,35,6,'6-Iron',10.00,'Hole'),(13,8,36,2,'',12.50,'Hole'),(13,9,38,1,'4-Hybrid',6.18,'Hole'),(13,9,38,3,'4-Hybrid',5.67,'Fairway'),(13,9,41,3,'6-Iron',5.75,'Hole'),(13,9,42,6,'9-Iron',5.45,'Hole'),(13,9,42,10,'3-Wood',5.45,'Hole'),(13,9,45,9,'4-Hybrid',8.73,'Hole'),(13,9,46,3,'1-Iron',8.17,'Bunker'),(13,9,46,4,'7-Iron',8.17,'Bunker'),(13,9,47,10,'3-Hybrid',8.08,'Hole'),(13,9,49,5,'Putter',9.58,'Hole'),(13,9,50,5,'7-Iron',9.67,'Fairway'),(13,10,37,2,'3-Iron',6.36,'Fairway'),(13,10,38,1,'1-Iron',5.67,'Hole'),(13,10,38,8,'4-Hybrid',6.18,'Hole'),(13,10,39,5,'4-Hybrid',5.42,'Hole'),(13,10,41,1,'7-Iron',5.75,'Hole'),(13,10,44,3,'5-Iron',7.18,'Hole'),(13,10,44,4,'9-Iron',7.18,'Hole'),(13,10,45,9,'3-Hybrid',8.73,'Hole'),(13,10,45,10,'3-Iron',8.00,'Hole'),(13,10,46,2,'5-Hybrid',8.91,'Fairway'),(13,10,46,4,'6-Iron',8.91,'Hole'),(13,10,50,4,'6-Iron',9.67,'Fairway'),(13,10,50,9,'5-Wood',9.67,'Hole'),(13,10,51,3,'7-Iron',9.92,'Fairway'),(13,10,53,4,'7-Iron',11.82,'Hole'),(13,10,53,6,'Putter',10.83,'Hole'),(13,11,37,8,'3-Iron',6.36,'Hole'),(13,11,38,1,'5-Wood',6.18,'Hole'),(13,11,38,10,'4-Hybrid',6.18,'Hole'),(13,11,39,2,'1-Iron',5.42,'Hole'),(13,11,39,10,'5-Wood',5.42,'Hole'),(13,11,40,1,'3-Wood',5.50,'Hole'),(13,11,42,10,'Wedge',5.45,'Hole'),(13,11,43,10,'',6.50,'Fairway'),(13,11,48,2,'5-Hybrid',7.75,'Hole'),(13,11,49,5,'4-Hybrid',10.45,'Hole'),(13,11,51,3,'3-Iron',10.82,'Hole'),(13,11,52,6,'7-Iron',10.42,'Hole'),(13,11,52,7,'4-Hybrid',10.42,'Hole'),(13,11,53,8,'6-Iron',10.83,'Hole'),(13,11,54,3,'3-Wood',46.67,'Fairway'),(13,12,37,8,'Putter',6.36,'Hole'),(13,12,40,7,'5-Wood',5.50,'Hole'),(13,12,40,10,'3-Wood',6.00,'Hole'),(13,12,41,6,'6-Iron',6.27,'Hole'),(13,12,42,3,'Putter',5.00,'Hole'),(13,12,45,7,'2-Iron',8.73,'Hole'),(13,12,46,2,'3-Iron',8.91,'Hole'),(13,12,47,1,'4-Iron',8.08,'Bunker'),(13,12,47,8,'5-Iron',8.82,'Hole'),(13,12,48,10,'3-Iron',8.45,'Hole'),(13,12,51,4,'1-Iron',9.92,'Hole'),(13,12,52,2,'8-Iron',12.50,'Hole'),(13,13,57,8,'7-Iron',6.90,'Hole'),(13,13,60,4,'7-Iron',6.00,'Hole'),(13,13,61,3,'4-Iron',8.58,'Hole'),(13,13,63,7,'Wedge',8.83,'Hole'),(13,13,66,2,'3-Hybrid',7.42,'Hole'),(13,13,67,5,'Driver',8.75,'Hole'),(13,13,68,9,'7-Iron',9.00,'Hole'),(13,13,70,8,'',10.82,'Hole'),(13,14,56,7,'6-Iron',6.18,'Bunker'),(13,14,58,4,'3-Hybrid',6.36,'Hole'),(13,14,59,5,'4-Hybrid',5.92,'Hole'),(13,14,61,1,'4-Iron',8.58,'Hole'),(13,14,61,10,'4-Hybrid',8.58,'Hole'),(13,14,63,2,'6-Iron',8.83,'Hole'),(13,14,64,5,'Putter',9.00,'Hole'),(13,14,65,1,'5-Hybrid',9.36,'Hole'),(13,14,65,3,'5-Hybrid',8.58,'Hole'),(13,14,65,6,'9-Iron',9.36,'Hole'),(13,14,66,3,'3-Hybrid',7.42,'Hole'),(13,14,68,8,'9-Iron',9.82,'Hole'),(13,14,69,3,'5-Hybrid',9.08,'Hole'),(13,14,69,7,'8-Iron',9.08,'Hole'),(13,14,70,3,'2-Iron',10.82,'Hole'),(13,14,72,8,'Putter',11.67,'Hole'),(13,14,72,10,'9-Iron',11.67,'Hole'),(13,15,56,9,'3-Hybrid',5.67,'Hole'),(13,15,59,9,'Wedge',5.92,'Hole'),(13,15,60,5,'Putter',6.00,'Hole'),(13,15,61,4,'5-Hybrid',8.58,'Hole'),(13,15,61,5,'4-Hybrid',8.58,'Hole'),(13,15,63,9,'Driver',9.64,'Hole'),(13,15,65,4,'5-Iron',8.58,'Hole'),(13,15,66,6,'4-Hybrid',0.00,'Penalty'),(13,15,70,3,'2-Iron',0.00,'Penalty'),(13,15,70,7,'',10.82,'Hole'),(13,15,71,10,'5-Iron',10.08,'Hole'),(13,15,72,4,'6-Iron',11.67,'Hole'),(13,16,55,7,'3-Hybrid',5.58,'Fairway'),(13,16,56,3,'5-Wood',5.67,'Hole'),(13,16,56,4,'7-Iron',6.18,'Hole'),(13,16,56,5,'2-Iron',6.18,'Hole'),(13,16,56,8,'5-Wood',5.67,'Hole'),(13,16,57,5,'8-Iron',6.27,'Hole'),(13,16,58,3,'3-Iron',6.36,'Hole'),(13,16,62,2,'5-Iron',8.67,'Fairway'),(13,16,62,7,'5-Wood',8.67,'Hole'),(13,16,64,3,'Putter',9.00,'Hole'),(13,16,66,6,'Putter',7.42,'Hole'),(13,16,67,4,'4-Iron',9.55,'Hole'),(13,16,68,5,'6-Iron',9.82,'Hole'),(13,16,69,2,'1-Iron',9.08,'Hole'),(13,16,70,2,'4-Iron',9.92,'Hole'),(13,16,71,3,'Wedge',11.00,'Fairway'),(13,16,72,2,'1-Iron',12.73,'Hole'),(13,17,73,7,'4-Iron',42.67,'Penalty'),(13,17,76,6,'3-Wood',6.58,'Hole'),(13,17,80,1,'9-Iron',7.00,'Hole'),(13,17,83,2,'5-Wood',5.83,'Hole'),(13,17,83,9,'3-Hybrid',7.00,'Hole'),(13,17,84,7,'7-Iron',6.64,'Hole'),(13,17,87,2,'3-Hybrid',10.82,'Hole'),(13,17,87,6,'Wedge',9.92,'Hole'),(13,17,87,8,'2-Iron',10.82,'Hole'),(13,17,88,8,'5-Iron',10.25,'Hole'),(13,18,73,5,'1-Iron',42.67,'Hole'),(13,18,77,6,'4-Iron',6.67,'Hole'),(13,18,78,9,'Driver',8.00,'Hole'),(13,18,79,6,'9-Iron',7.17,'Fairway'),(13,18,79,10,'Wedge',0.00,'Penalty'),(13,18,80,5,'5-Wood',7.64,'Fairway'),(13,18,80,8,'3-Wood',7.64,'Hole'),(13,18,85,3,'5-Hybrid',7.82,'Hole'),(13,18,86,8,'3-Iron',9.17,'Bunker'),(13,18,88,1,'9-Iron',12.30,'Hole'),(13,18,89,5,'Wedge',12.73,'Hole'),(13,19,73,7,'3-Iron',51.20,'Hole'),(13,19,77,3,'5-Iron',6.67,'Hole'),(13,19,77,6,'2-Iron',6.67,'Hole'),(13,19,78,7,'2-Iron',7.33,'Hole'),(13,19,80,6,'3-Iron',7.00,'Fairway'),(13,19,83,1,'3-Iron',6.36,'Hole'),(13,19,83,6,'8-Iron',5.83,'Fairway'),(13,19,85,8,'8-Iron',7.82,'Hole'),(13,19,85,10,'2-Iron',7.17,'Hole'),(13,19,90,1,'3-Wood',14.55,'Fairway'),(13,20,73,8,'3-Iron',42.67,'Hole'),(13,20,74,2,'7-Iron',15.17,'Hole'),(13,20,75,4,'5-Iron',8.90,'Hole'),(13,20,75,5,'5-Wood',8.09,'Hole'),(13,20,75,7,'5-Wood',8.09,'Hole'),(13,20,78,5,'4-Hybrid',7.33,'Hole'),(13,20,78,8,'9-Iron',7.33,'Bunker'),(13,20,79,7,'1-Iron',7.17,'Hole'),(13,20,80,9,'8-Iron',7.00,'Hole'),(13,20,81,4,'2-Iron',8.18,'Hole'),(13,20,82,9,'1-Iron',9.00,'Hole'),(13,20,83,2,'Driver',7.00,'Hole'),(13,20,83,4,'7-Iron',5.83,'Bunker'),(13,20,84,2,'5-Wood',6.64,'Hole'),(13,20,84,7,'9-Iron',6.64,'Hole'),(13,20,86,6,'1-Iron',9.17,'Hole'),(13,20,89,2,'5-Hybrid',12.73,'Fairway'),(13,20,90,3,'5-Hybrid',13.33,'Hole'),(13,20,90,7,'6-Iron',13.33,'Hole'),(14,1,1,1,'Wedge',5.36,'Hole'),(14,1,2,6,'8-Iron',8.00,'Hole'),(14,1,3,3,'3-Wood',0.00,'Penalty'),(14,3,1,10,'Wedge',4.92,'Hole'),(14,3,2,3,'9-Iron',8.00,'Hole'),(14,3,18,9,'3-Wood',11.82,'Hole'),(14,4,1,2,'4-Hybrid',5.36,'Hole'),(14,4,8,6,'1-Iron',7.82,'Hole'),(14,5,30,1,'3-Hybrid',7.36,'Hole'),(14,6,28,1,'2-Iron',8.27,'Hole'),(14,6,33,6,'7-Iron',10.08,'Hole'),(14,7,26,5,'8-Iron',6.92,'Hole'),(14,7,27,3,'',7.08,'Hole'),(14,7,30,1,'4-Iron',6.75,'Hole'),(14,8,24,6,'4-Hybrid',7.91,'Hole'),(14,8,26,2,'7-Iron',6.92,'Hole'),(14,8,27,1,'Driver',7.08,'Hole'),(14,8,27,7,'2-Iron',7.08,'Hole'),(14,9,38,3,'1-Iron',5.67,'Hole'),(14,9,46,3,'5-Hybrid',8.17,'Penalty'),(14,9,46,4,'2-Iron',8.17,'Hole'),(14,9,50,5,'9-Iron',9.67,'Bunker'),(14,10,37,2,'4-Iron',6.36,'Hole'),(14,10,46,2,'1-Iron',8.91,'Hole'),(14,10,50,4,'7-Iron',9.67,'Fairway'),(14,10,51,3,'3-Iron',9.92,'Fairway'),(14,11,43,10,'5-Hybrid',6.50,'Hole'),(14,11,54,3,'',46.67,'Hole'),(14,12,47,1,'6-Iron',8.08,'Hole'),(14,14,56,7,'3-Hybrid',6.18,'Hole'),(14,15,66,6,'6-Iron',8.09,'Hole'),(14,15,70,3,'1-Iron',10.82,'Hole'),(14,16,55,7,'Putter',5.58,'Hole'),(14,16,62,2,'Wedge',8.67,'Hole'),(14,16,71,3,'5-Wood',11.00,'Hole'),(14,17,73,7,'4-Iron',0.00,'Penalty'),(14,18,79,6,'Putter',7.17,'Hole'),(14,18,79,10,'4-Hybrid',7.82,'Fairway'),(14,18,80,5,'3-Iron',7.64,'Hole'),(14,18,86,8,'8-Iron',9.17,'Hole'),(14,19,80,6,'4-Hybrid',7.00,'Hole'),(14,19,83,6,'7-Iron',5.83,'Hole'),(14,19,90,1,'7-Iron',14.55,'Hole'),(14,20,78,8,'3-Wood',7.33,'Hole'),(14,20,83,4,'3-Hybrid',5.83,'Hole'),(14,20,89,2,'1-Iron',12.73,'Hole'),(15,1,3,3,'4-Hybrid',8.50,'Hole'),(15,9,46,3,'5-Hybrid',0.00,'Penalty'),(15,9,50,5,'2-Iron',9.67,'Hole'),(15,10,50,4,'5-Wood',9.67,'Hole'),(15,10,51,3,'9-Iron',9.92,'Hole'),(15,17,73,7,'2-Iron',42.67,'Hole'),(15,18,79,10,'Putter',7.82,'Hole'),(16,9,46,3,'1-Iron',8.17,'Hole');
/*!40000 ALTER TABLE `strokes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sub_periods`
--

DROP TABLE IF EXISTS `sub_periods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sub_periods` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `period_id` int(11) NOT NULL,
  `sub_period_value` varchar(100) DEFAULT NULL,
  `score` varchar(100) DEFAULT NULL,
  `score_attempts` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_FK_sub_per_per_id__per_id` (`period_id`),
  CONSTRAINT `FK_sub_per_per_id__per_id` FOREIGN KEY (`period_id`) REFERENCES `periods` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sub_periods`
--

LOCK TABLES `sub_periods` WRITE;
/*!40000 ALTER TABLE `sub_periods` DISABLE KEYS */;
/*!40000 ALTER TABLE `sub_periods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sub_seasons`
--

DROP TABLE IF EXISTS `sub_seasons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sub_seasons` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sub_season_key` varchar(100) NOT NULL,
  `season_id` int(11) NOT NULL,
  `sub_season_type` varchar(100) NOT NULL,
  `start_date_time` datetime DEFAULT NULL,
  `end_date_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_FK_sub_sea_sea_id__sea_id` (`season_id`),
  KEY `IDX_sub_seasons_1` (`sub_season_key`),
  KEY `IDX_sub_seasons_2` (`sub_season_type`),
  CONSTRAINT `FK_sub_sea_sea_id__sea_id` FOREIGN KEY (`season_id`) REFERENCES `seasons` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sub_seasons`
--

LOCK TABLES `sub_seasons` WRITE;
/*!40000 ALTER TABLE `sub_seasons` DISABLE KEYS */;
/*!40000 ALTER TABLE `sub_seasons` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `team_phases`
--

DROP TABLE IF EXISTS `team_phases`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `team_phases` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `team_id` int(11) NOT NULL,
  `start_season_id` int(11) DEFAULT NULL,
  `end_season_id` int(11) DEFAULT NULL,
  `affiliation_id` int(11) NOT NULL,
  `start_date_time` varchar(100) DEFAULT NULL,
  `end_date_time` varchar(100) DEFAULT NULL,
  `phase_status` varchar(40) DEFAULT NULL,
  `role_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_tea_aff_pha_rol_id__rol_id` (`role_id`),
  KEY `FK_tea_aff_pha_end_sea_id__sea_id` (`end_season_id`),
  KEY `FK_tea_aff_pha_sta_sea_id__sea_id` (`start_season_id`),
  KEY `FK_tea_aff_pha_aff_id__aff_id` (`affiliation_id`),
  KEY `FK_tea_aff_pha_tea_id__tea_id` (`team_id`),
  CONSTRAINT `FK_tea_aff_pha_aff_id__aff_id` FOREIGN KEY (`affiliation_id`) REFERENCES `affiliations` (`id`),
  CONSTRAINT `FK_tea_aff_pha_end_sea_id__sea_id` FOREIGN KEY (`end_season_id`) REFERENCES `seasons` (`id`),
  CONSTRAINT `FK_tea_aff_pha_rol_id__rol_id` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`),
  CONSTRAINT `FK_tea_aff_pha_sta_sea_id__sea_id` FOREIGN KEY (`start_season_id`) REFERENCES `seasons` (`id`),
  CONSTRAINT `FK_tea_aff_pha_tea_id__tea_id` FOREIGN KEY (`team_id`) REFERENCES `teams` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `team_phases`
--

LOCK TABLES `team_phases` WRITE;
/*!40000 ALTER TABLE `team_phases` DISABLE KEYS */;
/*!40000 ALTER TABLE `team_phases` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teams`
--

DROP TABLE IF EXISTS `teams`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `teams` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `team_key` varchar(100) NOT NULL,
  `publisher_id` int(11) NOT NULL,
  `home_site_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_tea_pub_id__pub_id` (`publisher_id`),
  KEY `FK_tea_hom_sit_id__sit_id` (`home_site_id`),
  KEY `IDX_teams_team_key` (`team_key`),
  CONSTRAINT `FK_tea_hom_sit_id__sit_id` FOREIGN KEY (`home_site_id`) REFERENCES `sites` (`id`),
  CONSTRAINT `FK_tea_pub_id__pub_id` FOREIGN KEY (`publisher_id`) REFERENCES `publishers` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teams`
--

LOCK TABLES `teams` WRITE;
/*!40000 ALTER TABLE `teams` DISABLE KEYS */;
/*!40000 ALTER TABLE `teams` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teams_documents`
--

DROP TABLE IF EXISTS `teams_documents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `teams_documents` (
  `team_id` int(11) NOT NULL,
  `document_id` int(11) NOT NULL,
  KEY `FK_tea_doc_tea_id__tea_id` (`team_id`),
  KEY `FK_tea_doc_doc_id__doc_id` (`document_id`),
  CONSTRAINT `FK_tea_doc_doc_id__doc_id` FOREIGN KEY (`document_id`) REFERENCES `documents` (`id`),
  CONSTRAINT `FK_tea_doc_tea_id__tea_id` FOREIGN KEY (`team_id`) REFERENCES `teams` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teams_documents`
--

LOCK TABLES `teams_documents` WRITE;
/*!40000 ALTER TABLE `teams_documents` DISABLE KEYS */;
/*!40000 ALTER TABLE `teams_documents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teams_media`
--

DROP TABLE IF EXISTS `teams_media`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `teams_media` (
  `team_id` int(11) NOT NULL,
  `media_id` int(11) NOT NULL,
  KEY `FK_tea_med_med_id__med_id` (`media_id`),
  KEY `FK_tea_med_tea_id__tea_id` (`team_id`),
  CONSTRAINT `FK_tea_med_med_id__med_id` FOREIGN KEY (`media_id`) REFERENCES `media` (`id`),
  CONSTRAINT `FK_tea_med_tea_id__tea_id` FOREIGN KEY (`team_id`) REFERENCES `teams` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teams_media`
--

LOCK TABLES `teams_media` WRITE;
/*!40000 ALTER TABLE `teams_media` DISABLE KEYS */;
/*!40000 ALTER TABLE `teams_media` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tournament_schedules`
--

DROP TABLE IF EXISTS `tournament_schedules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tournament_schedules` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `event_id` int(11) NOT NULL,
  `date` date NOT NULL,
  `start_time` time NOT NULL,
  `end_time` time NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `event_id` (`event_id`,`date`),
  CONSTRAINT `FK_tourn_sched_event_id__events_id` FOREIGN KEY (`event_id`) REFERENCES `events` (`id`),
  CONSTRAINT `CHK_time` CHECK (`start_time` < `end_time`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tournament_schedules`
--

LOCK TABLES `tournament_schedules` WRITE;
/*!40000 ALTER TABLE `tournament_schedules` DISABLE KEYS */;
INSERT INTO `tournament_schedules` VALUES (1,1,'2022-06-01','13:00:00','17:00:00'),(2,1,'2022-06-02','13:00:00','17:00:00'),(3,1,'2022-06-03','13:00:00','17:00:00'),(4,1,'2022-06-04','13:00:00','17:00:00'),(5,2,'2022-06-01','13:00:00','17:00:00'),(6,2,'2022-06-02','13:00:00','17:00:00'),(7,2,'2022-06-03','13:00:00','17:00:00'),(8,2,'2022-06-04','13:00:00','17:00:00'),(9,3,'2022-01-01','13:00:00','17:00:00'),(10,3,'2022-01-02','13:00:00','17:00:00'),(11,3,'2022-01-03','13:00:00','17:00:00'),(12,3,'2022-01-04','13:00:00','17:00:00'),(13,4,'2022-05-01','13:00:00','17:00:00'),(14,4,'2022-05-02','13:00:00','17:00:00'),(15,4,'2022-05-03','13:00:00','17:00:00'),(16,4,'2022-05-04','13:00:00','17:00:00'),(17,5,'2020-04-01','13:00:00','17:00:00'),(18,5,'2020-04-02','13:00:00','17:00:00'),(19,5,'2020-04-03','13:00:00','17:00:00'),(20,5,'2020-04-04','13:00:00','17:00:00');
/*!40000 ALTER TABLE `tournament_schedules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tours`
--

DROP TABLE IF EXISTS `tours`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tours` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tour_name` varchar(100) NOT NULL,
  `affiliation_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `tour_name` (`tour_name`),
  KEY `FK_tours_aff_id__aff_id` (`affiliation_id`),
  CONSTRAINT `FK_tours_aff_id__aff_id` FOREIGN KEY (`affiliation_id`) REFERENCES `affiliations` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tours`
--

LOCK TABLES `tours` WRITE;
/*!40000 ALTER TABLE `tours` DISABLE KEYS */;
INSERT INTO `tours` VALUES (1,'Sunshine Tour',2),(2,'PGA',1),(3,'ZA Tour',1),(4,'Green Tour',2),(5,'A Golf Tour',3);
/*!40000 ALTER TABLE `tours` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(320) NOT NULL,
  `password` varchar(100) NOT NULL,
  `tel_no` char(10) NOT NULL,
  `user_type` varchar(6) NOT NULL,
  `first_name` varchar(100) NOT NULL,
  `init` varchar(5) DEFAULT NULL,
  `last_name` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  CONSTRAINT `CHK_tel` CHECK (`tel_no` regexp '0[0-9]{9}'),
  CONSTRAINT `CHK_type` CHECK (`user_type` regexp '(admin|normal)')
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wagering_moneylines`
--

DROP TABLE IF EXISTS `wagering_moneylines`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wagering_moneylines` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `bookmaker_id` int(11) NOT NULL,
  `event_id` int(11) NOT NULL,
  `date_time` datetime DEFAULT NULL,
  `team_id` int(11) NOT NULL,
  `person_id` int(11) DEFAULT NULL,
  `rotation_key` varchar(100) DEFAULT NULL,
  `comment` varchar(255) DEFAULT NULL,
  `vigorish` varchar(100) DEFAULT NULL,
  `line` varchar(100) DEFAULT NULL,
  `line_opening` varchar(100) DEFAULT NULL,
  `prediction` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_wag_mon_boo_id__boo_id` (`bookmaker_id`),
  KEY `FK_wag_mon_tea_id__tea_id` (`team_id`),
  KEY `FK_wag_mon_eve_id__eve_id` (`event_id`),
  CONSTRAINT `FK_wag_mon_boo_id__boo_id` FOREIGN KEY (`bookmaker_id`) REFERENCES `bookmakers` (`id`),
  CONSTRAINT `FK_wag_mon_eve_id__eve_id` FOREIGN KEY (`event_id`) REFERENCES `events` (`id`),
  CONSTRAINT `FK_wag_mon_tea_id__tea_id` FOREIGN KEY (`team_id`) REFERENCES `teams` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wagering_moneylines`
--

LOCK TABLES `wagering_moneylines` WRITE;
/*!40000 ALTER TABLE `wagering_moneylines` DISABLE KEYS */;
/*!40000 ALTER TABLE `wagering_moneylines` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wagering_odds_lines`
--

DROP TABLE IF EXISTS `wagering_odds_lines`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wagering_odds_lines` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `bookmaker_id` int(11) NOT NULL,
  `event_id` int(11) NOT NULL,
  `date_time` datetime DEFAULT NULL,
  `team_id` int(11) NOT NULL,
  `person_id` int(11) DEFAULT NULL,
  `rotation_key` varchar(100) DEFAULT NULL,
  `comment` varchar(255) DEFAULT NULL,
  `numerator` varchar(100) DEFAULT NULL,
  `denominator` varchar(100) DEFAULT NULL,
  `prediction` varchar(100) DEFAULT NULL,
  `payout_calculation` varchar(100) DEFAULT NULL,
  `payout_amount` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_wag_odd_lin_tea_id__tea_id` (`team_id`),
  KEY `FK_wag_odd_lin_eve_id__eve_id` (`event_id`),
  KEY `FK_wag_odd_lin_boo_id__boo_id` (`bookmaker_id`),
  CONSTRAINT `FK_wag_odd_lin_boo_id__boo_id` FOREIGN KEY (`bookmaker_id`) REFERENCES `bookmakers` (`id`),
  CONSTRAINT `FK_wag_odd_lin_eve_id__eve_id` FOREIGN KEY (`event_id`) REFERENCES `events` (`id`),
  CONSTRAINT `FK_wag_odd_lin_tea_id__tea_id` FOREIGN KEY (`team_id`) REFERENCES `teams` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wagering_odds_lines`
--

LOCK TABLES `wagering_odds_lines` WRITE;
/*!40000 ALTER TABLE `wagering_odds_lines` DISABLE KEYS */;
/*!40000 ALTER TABLE `wagering_odds_lines` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wagering_runlines`
--

DROP TABLE IF EXISTS `wagering_runlines`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wagering_runlines` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `bookmaker_id` int(11) NOT NULL,
  `event_id` int(11) NOT NULL,
  `date_time` datetime DEFAULT NULL,
  `team_id` int(11) NOT NULL,
  `person_id` int(11) DEFAULT NULL,
  `rotation_key` varchar(100) DEFAULT NULL,
  `comment` varchar(255) DEFAULT NULL,
  `vigorish` varchar(100) DEFAULT NULL,
  `line` varchar(100) DEFAULT NULL,
  `line_opening` varchar(100) DEFAULT NULL,
  `line_value` varchar(100) DEFAULT NULL,
  `prediction` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_wag_run_boo_id__boo_id` (`bookmaker_id`),
  KEY `FK_wag_run_tea_id__tea_id` (`team_id`),
  KEY `FK_wag_run_eve_id__eve_id` (`event_id`),
  CONSTRAINT `FK_wag_run_boo_id__boo_id` FOREIGN KEY (`bookmaker_id`) REFERENCES `bookmakers` (`id`),
  CONSTRAINT `FK_wag_run_eve_id__eve_id` FOREIGN KEY (`event_id`) REFERENCES `events` (`id`),
  CONSTRAINT `FK_wag_run_tea_id__tea_id` FOREIGN KEY (`team_id`) REFERENCES `teams` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wagering_runlines`
--

LOCK TABLES `wagering_runlines` WRITE;
/*!40000 ALTER TABLE `wagering_runlines` DISABLE KEYS */;
/*!40000 ALTER TABLE `wagering_runlines` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wagering_straight_spread_lines`
--

DROP TABLE IF EXISTS `wagering_straight_spread_lines`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wagering_straight_spread_lines` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `bookmaker_id` int(11) NOT NULL,
  `event_id` int(11) NOT NULL,
  `date_time` datetime DEFAULT NULL,
  `team_id` int(11) NOT NULL,
  `person_id` int(11) DEFAULT NULL,
  `rotation_key` varchar(100) DEFAULT NULL,
  `comment` varchar(255) DEFAULT NULL,
  `vigorish` varchar(100) DEFAULT NULL,
  `line_value` varchar(100) DEFAULT NULL,
  `line_value_opening` varchar(100) DEFAULT NULL,
  `prediction` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_wag_str_spr_lin_tea_id__tea_id` (`team_id`),
  KEY `FK_wag_str_spr_lin_eve_id__eve_id` (`event_id`),
  KEY `FK_wag_str_spr_lin_boo_id__boo_id` (`bookmaker_id`),
  CONSTRAINT `FK_wag_str_spr_lin_boo_id__boo_id` FOREIGN KEY (`bookmaker_id`) REFERENCES `bookmakers` (`id`),
  CONSTRAINT `FK_wag_str_spr_lin_eve_id__eve_id` FOREIGN KEY (`event_id`) REFERENCES `events` (`id`),
  CONSTRAINT `FK_wag_str_spr_lin_tea_id__tea_id` FOREIGN KEY (`team_id`) REFERENCES `teams` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wagering_straight_spread_lines`
--

LOCK TABLES `wagering_straight_spread_lines` WRITE;
/*!40000 ALTER TABLE `wagering_straight_spread_lines` DISABLE KEYS */;
/*!40000 ALTER TABLE `wagering_straight_spread_lines` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wagering_total_score_lines`
--

DROP TABLE IF EXISTS `wagering_total_score_lines`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wagering_total_score_lines` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `bookmaker_id` int(11) NOT NULL,
  `event_id` int(11) NOT NULL,
  `date_time` datetime DEFAULT NULL,
  `team_id` int(11) NOT NULL,
  `person_id` int(11) DEFAULT NULL,
  `rotation_key` varchar(100) DEFAULT NULL,
  `comment` varchar(255) DEFAULT NULL,
  `vigorish` varchar(100) DEFAULT NULL,
  `line_over` varchar(100) DEFAULT NULL,
  `line_under` varchar(100) DEFAULT NULL,
  `total` varchar(100) DEFAULT NULL,
  `total_opening` varchar(100) DEFAULT NULL,
  `prediction` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_wag_tot_sco_lin_boo_id__boo_id` (`bookmaker_id`),
  KEY `FK_wag_tot_sco_lin_eve_id__eve_id` (`event_id`),
  KEY `FK_wag_tot_sco_lin_tea_id__tea_id` (`team_id`),
  CONSTRAINT `FK_wag_tot_sco_lin_boo_id__boo_id` FOREIGN KEY (`bookmaker_id`) REFERENCES `bookmakers` (`id`),
  CONSTRAINT `FK_wag_tot_sco_lin_eve_id__eve_id` FOREIGN KEY (`event_id`) REFERENCES `events` (`id`),
  CONSTRAINT `FK_wag_tot_sco_lin_tea_id__tea_id` FOREIGN KEY (`team_id`) REFERENCES `teams` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wagering_total_score_lines`
--

LOCK TABLES `wagering_total_score_lines` WRITE;
/*!40000 ALTER TABLE `wagering_total_score_lines` DISABLE KEYS */;
/*!40000 ALTER TABLE `wagering_total_score_lines` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `weather_conditions`
--

DROP TABLE IF EXISTS `weather_conditions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `weather_conditions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `event_id` int(11) NOT NULL,
  `temperature` varchar(100) DEFAULT NULL,
  `temperature_units` varchar(40) DEFAULT NULL,
  `humidity` varchar(100) DEFAULT NULL,
  `clouds` varchar(100) DEFAULT NULL,
  `wind_direction` varchar(100) DEFAULT NULL,
  `wind_velocity` varchar(100) DEFAULT NULL,
  `weather_code` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_FK_wea_con_eve_id__eve_id` (`event_id`),
  CONSTRAINT `FK_wea_con_eve_id__eve_id` FOREIGN KEY (`event_id`) REFERENCES `events` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `weather_conditions`
--

LOCK TABLES `weather_conditions` WRITE;
/*!40000 ALTER TABLE `weather_conditions` DISABLE KEYS */;
/*!40000 ALTER TABLE `weather_conditions` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-06-08  1:02:10