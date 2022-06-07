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
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

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
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

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
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

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
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

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
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

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
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

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
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

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
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

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
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

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
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

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
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

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
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

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
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

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
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

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
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-06-07 16:04:47
