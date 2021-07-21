-- MariaDB dump 10.19  Distrib 10.6.3-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: craft-node
-- ------------------------------------------------------
-- Server version	10.6.3-MariaDB-1:10.6.3+maria~focal

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
-- Current Database: `craft-node`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `craft-node` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;

USE `craft-node`;

--
-- Table structure for table `craft_announcements`
--

DROP TABLE IF EXISTS `craft_announcements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_announcements` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `pluginId` int(11) DEFAULT NULL,
  `heading` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `body` text COLLATE utf8mb3_unicode_ci NOT NULL,
  `unread` tinyint(1) NOT NULL DEFAULT 1,
  `dateRead` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `craft_idx_xpdcoyvxeeyhmwbepgerhqqbcctmbqirbana` (`userId`,`unread`,`dateRead`,`dateCreated`),
  KEY `craft_idx_shhhueuwwcgzlhjkazymtzvjboqggbmrxaes` (`dateRead`),
  KEY `craft_fk_wuevyxaxcyqlgkszixguoiegaskcrnizuawk` (`pluginId`),
  CONSTRAINT `craft_fk_vtgxktwtmoyfwkdmudsblejdyldnowilqdxc` FOREIGN KEY (`userId`) REFERENCES `craft_users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_fk_wuevyxaxcyqlgkszixguoiegaskcrnizuawk` FOREIGN KEY (`pluginId`) REFERENCES `craft_plugins` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_announcements`
--

LOCK TABLES `craft_announcements` WRITE;
/*!40000 ALTER TABLE `craft_announcements` DISABLE KEYS */;
/*!40000 ALTER TABLE `craft_announcements` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craft_assetindexdata`
--

DROP TABLE IF EXISTS `craft_assetindexdata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_assetindexdata` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sessionId` varchar(36) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `volumeId` int(11) NOT NULL,
  `uri` text COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `size` bigint(20) unsigned DEFAULT NULL,
  `timestamp` datetime DEFAULT NULL,
  `recordId` int(11) DEFAULT NULL,
  `inProgress` tinyint(1) DEFAULT 0,
  `completed` tinyint(1) DEFAULT 0,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `craft_idx_dzkkgdmqammzqntsuyzvrfkixrpzzcpwbnrt` (`sessionId`,`volumeId`),
  KEY `craft_idx_rfstehnmmvbugeqavugptuwnbdqjargdoegg` (`volumeId`),
  CONSTRAINT `craft_fk_affkgmpnzoujywkxgeoctmxudlxdsfbtfgep` FOREIGN KEY (`volumeId`) REFERENCES `craft_volumes` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_assetindexdata`
--

LOCK TABLES `craft_assetindexdata` WRITE;
/*!40000 ALTER TABLE `craft_assetindexdata` DISABLE KEYS */;
/*!40000 ALTER TABLE `craft_assetindexdata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craft_assets`
--

DROP TABLE IF EXISTS `craft_assets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_assets` (
  `id` int(11) NOT NULL,
  `volumeId` int(11) DEFAULT NULL,
  `folderId` int(11) NOT NULL,
  `uploaderId` int(11) DEFAULT NULL,
  `filename` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `kind` varchar(50) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'unknown',
  `width` int(11) unsigned DEFAULT NULL,
  `height` int(11) unsigned DEFAULT NULL,
  `size` bigint(20) unsigned DEFAULT NULL,
  `focalPoint` varchar(13) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `deletedWithVolume` tinyint(1) DEFAULT NULL,
  `keptFile` tinyint(1) DEFAULT NULL,
  `dateModified` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `craft_idx_wwheupqvpfitpjbsqxcuumtiupltbofkqllq` (`filename`,`folderId`),
  KEY `craft_idx_qnmbsczcbwyptkszaynsqshsucorccdgkrgj` (`folderId`),
  KEY `craft_idx_iszvazjjsrdlltqiutirvrezmrbnwzrzmhfn` (`volumeId`),
  KEY `craft_fk_fcpxglnrrprxyoxhhztkaxfgfloyvglvaflm` (`uploaderId`),
  CONSTRAINT `craft_fk_ckifwbiuvcbxiapzgdnihclllbrywyuaxmue` FOREIGN KEY (`folderId`) REFERENCES `craft_volumefolders` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_fk_fcpxglnrrprxyoxhhztkaxfgfloyvglvaflm` FOREIGN KEY (`uploaderId`) REFERENCES `craft_users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `craft_fk_hylkrosdzirzcmtrncpfgxqakkejlhkoetxw` FOREIGN KEY (`id`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_fk_jotnuytupbewoowlrhbiezmyqjcfpsifdnyr` FOREIGN KEY (`volumeId`) REFERENCES `craft_volumes` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_assets`
--

LOCK TABLES `craft_assets` WRITE;
/*!40000 ALTER TABLE `craft_assets` DISABLE KEYS */;
/*!40000 ALTER TABLE `craft_assets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craft_assettransformindex`
--

DROP TABLE IF EXISTS `craft_assettransformindex`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_assettransformindex` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `assetId` int(11) NOT NULL,
  `filename` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `format` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `location` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `volumeId` int(11) DEFAULT NULL,
  `fileExists` tinyint(1) NOT NULL DEFAULT 0,
  `inProgress` tinyint(1) NOT NULL DEFAULT 0,
  `error` tinyint(1) NOT NULL DEFAULT 0,
  `dateIndexed` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `craft_idx_cfpwosnpsirzqywtvrkudzwgclovmvtywwsp` (`volumeId`,`assetId`,`location`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_assettransformindex`
--

LOCK TABLES `craft_assettransformindex` WRITE;
/*!40000 ALTER TABLE `craft_assettransformindex` DISABLE KEYS */;
/*!40000 ALTER TABLE `craft_assettransformindex` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craft_assettransforms`
--

DROP TABLE IF EXISTS `craft_assettransforms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_assettransforms` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `mode` enum('stretch','fit','crop') COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'crop',
  `position` enum('top-left','top-center','top-right','center-left','center-center','center-right','bottom-left','bottom-center','bottom-right') COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'center-center',
  `width` int(11) unsigned DEFAULT NULL,
  `height` int(11) unsigned DEFAULT NULL,
  `format` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `quality` int(11) DEFAULT NULL,
  `interlace` enum('none','line','plane','partition') COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'none',
  `dimensionChangeTime` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `craft_idx_dgqbmbfusbjbbraruifintodhezgkbvsemln` (`name`),
  KEY `craft_idx_nohoimlxgetlfkzzmbkonmmoprtytirszzrf` (`handle`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_assettransforms`
--

LOCK TABLES `craft_assettransforms` WRITE;
/*!40000 ALTER TABLE `craft_assettransforms` DISABLE KEYS */;
/*!40000 ALTER TABLE `craft_assettransforms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craft_categories`
--

DROP TABLE IF EXISTS `craft_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_categories` (
  `id` int(11) NOT NULL,
  `groupId` int(11) NOT NULL,
  `parentId` int(11) DEFAULT NULL,
  `deletedWithGroup` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `craft_idx_jfjapjvtdhjqnbmvpxqbbyapqobvwqfwepvx` (`groupId`),
  KEY `craft_fk_wvazooqkusakqrouszstnokmuiuxxdmtruhv` (`parentId`),
  CONSTRAINT `craft_fk_hhxfhhxaelekgdcsuaotygjsdnjrfbblwdpv` FOREIGN KEY (`groupId`) REFERENCES `craft_categorygroups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_fk_pcfxrzdiytgwfjuprsurkxhonpagswyuffmz` FOREIGN KEY (`id`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_fk_wvazooqkusakqrouszstnokmuiuxxdmtruhv` FOREIGN KEY (`parentId`) REFERENCES `craft_categories` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_categories`
--

LOCK TABLES `craft_categories` WRITE;
/*!40000 ALTER TABLE `craft_categories` DISABLE KEYS */;
/*!40000 ALTER TABLE `craft_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craft_categorygroups`
--

DROP TABLE IF EXISTS `craft_categorygroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_categorygroups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `structureId` int(11) NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `defaultPlacement` enum('beginning','end') COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'end',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `craft_idx_zsxzmkjgguxdyrdpeoauoadlkazmmnkrxfag` (`name`),
  KEY `craft_idx_xphsfvrglgmgiigcpdfvtirpyfbimmoygqzi` (`handle`),
  KEY `craft_idx_nknjspdkwfgtatmcshmyzacutlcurzsuizdl` (`structureId`),
  KEY `craft_idx_uyggeuxqwjrxrwnqizpzfwxvkhhtlanmabgl` (`fieldLayoutId`),
  KEY `craft_idx_zmeqntawtyfwkqymwwdguqruafvdcxmeaghv` (`dateDeleted`),
  CONSTRAINT `craft_fk_qvvxhvgenqkfjtboxvwcwismfwbmzfpyfhca` FOREIGN KEY (`fieldLayoutId`) REFERENCES `craft_fieldlayouts` (`id`) ON DELETE SET NULL,
  CONSTRAINT `craft_fk_zrtyfimhqmthncszoewayxsohxwqakzriczp` FOREIGN KEY (`structureId`) REFERENCES `craft_structures` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_categorygroups`
--

LOCK TABLES `craft_categorygroups` WRITE;
/*!40000 ALTER TABLE `craft_categorygroups` DISABLE KEYS */;
/*!40000 ALTER TABLE `craft_categorygroups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craft_categorygroups_sites`
--

DROP TABLE IF EXISTS `craft_categorygroups_sites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_categorygroups_sites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `groupId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `hasUrls` tinyint(1) NOT NULL DEFAULT 1,
  `uriFormat` text COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `template` varchar(500) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_idx_whwyslhznuxwmedsrgrgljcgxkesvxshanvp` (`groupId`,`siteId`),
  KEY `craft_idx_yfgxliwbrwctuvckvtdoygdlxmebvuxswxwc` (`siteId`),
  CONSTRAINT `craft_fk_gwreitbnpkoorzikxucfgfqjhjoxbuubtqxs` FOREIGN KEY (`groupId`) REFERENCES `craft_categorygroups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_fk_moxlplcrcujlmhswkylodwtrtlcnodhkkeha` FOREIGN KEY (`siteId`) REFERENCES `craft_sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_categorygroups_sites`
--

LOCK TABLES `craft_categorygroups_sites` WRITE;
/*!40000 ALTER TABLE `craft_categorygroups_sites` DISABLE KEYS */;
/*!40000 ALTER TABLE `craft_categorygroups_sites` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craft_changedattributes`
--

DROP TABLE IF EXISTS `craft_changedattributes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_changedattributes` (
  `elementId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `attribute` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `propagated` tinyint(1) NOT NULL,
  `userId` int(11) DEFAULT NULL,
  PRIMARY KEY (`elementId`,`siteId`,`attribute`),
  KEY `craft_idx_tjwwnwhvsremjtwygkwrbrxtfnhmfzxqscvd` (`elementId`,`siteId`,`dateUpdated`),
  KEY `craft_fk_wdwvsaltkrldafuqfxmpgjijhtbbgufursse` (`siteId`),
  KEY `craft_fk_axhcqumsqstjbjcllmqtlebjumdryqrcxvuw` (`userId`),
  CONSTRAINT `craft_fk_axhcqumsqstjbjcllmqtlebjumdryqrcxvuw` FOREIGN KEY (`userId`) REFERENCES `craft_users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `craft_fk_qygzqhmhtnqtfonmgnrtanswujeryxpjaodh` FOREIGN KEY (`elementId`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `craft_fk_wdwvsaltkrldafuqfxmpgjijhtbbgufursse` FOREIGN KEY (`siteId`) REFERENCES `craft_sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_changedattributes`
--

LOCK TABLES `craft_changedattributes` WRITE;
/*!40000 ALTER TABLE `craft_changedattributes` DISABLE KEYS */;
/*!40000 ALTER TABLE `craft_changedattributes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craft_changedfields`
--

DROP TABLE IF EXISTS `craft_changedfields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_changedfields` (
  `elementId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `fieldId` int(11) NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `propagated` tinyint(1) NOT NULL,
  `userId` int(11) DEFAULT NULL,
  PRIMARY KEY (`elementId`,`siteId`,`fieldId`),
  KEY `craft_idx_xcfvchjzrjwqtenhzjwxeyzidsirgbyzddoy` (`elementId`,`siteId`,`dateUpdated`),
  KEY `craft_fk_cgwxqsacoygnnwytjbotulrmxmkmwvhhtakx` (`siteId`),
  KEY `craft_fk_wlzivarzqnrvfrhjtkboguvattynfkdfamgz` (`fieldId`),
  KEY `craft_fk_oevuagsvxyyojrlixwihgxvcmldsazipmkrw` (`userId`),
  CONSTRAINT `craft_fk_cgwxqsacoygnnwytjbotulrmxmkmwvhhtakx` FOREIGN KEY (`siteId`) REFERENCES `craft_sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `craft_fk_oevuagsvxyyojrlixwihgxvcmldsazipmkrw` FOREIGN KEY (`userId`) REFERENCES `craft_users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `craft_fk_rieqivzyjswhicxwtqlhvpcqraffchydmcbd` FOREIGN KEY (`elementId`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `craft_fk_wlzivarzqnrvfrhjtkboguvattynfkdfamgz` FOREIGN KEY (`fieldId`) REFERENCES `craft_fields` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_changedfields`
--

LOCK TABLES `craft_changedfields` WRITE;
/*!40000 ALTER TABLE `craft_changedfields` DISABLE KEYS */;
/*!40000 ALTER TABLE `craft_changedfields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craft_content`
--

DROP TABLE IF EXISTS `craft_content`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_content` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `elementId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `title` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_idx_yzoyamqbugnuprdbwrxhmeuspywufdardnje` (`elementId`,`siteId`),
  KEY `craft_idx_jqrfwelwhwcxkstulscedfexihhnkyxjtcrp` (`siteId`),
  KEY `craft_idx_mvdavoqjvssophllxdcmhxtfhyyrvokmnudd` (`title`),
  CONSTRAINT `craft_fk_pwvoadwyywgezzvzsxhtxznalzgfmiwdwnws` FOREIGN KEY (`elementId`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_fk_qnffligcxynnmyerwdzxodmntvgwcqseqsdb` FOREIGN KEY (`siteId`) REFERENCES `craft_sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_content`
--

LOCK TABLES `craft_content` WRITE;
/*!40000 ALTER TABLE `craft_content` DISABLE KEYS */;
INSERT INTO `craft_content` VALUES (1,1,1,NULL,'2021-07-21 20:47:21','2021-07-21 20:47:21','0226ff5d-a905-45c0-a493-b7efb3c7b9a5');
/*!40000 ALTER TABLE `craft_content` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craft_craftidtokens`
--

DROP TABLE IF EXISTS `craft_craftidtokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_craftidtokens` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `accessToken` text COLLATE utf8mb3_unicode_ci NOT NULL,
  `expiryDate` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `craft_fk_oooafhupqwbdkmnkeupksatphynwdsjiepia` (`userId`),
  CONSTRAINT `craft_fk_oooafhupqwbdkmnkeupksatphynwdsjiepia` FOREIGN KEY (`userId`) REFERENCES `craft_users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_craftidtokens`
--

LOCK TABLES `craft_craftidtokens` WRITE;
/*!40000 ALTER TABLE `craft_craftidtokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `craft_craftidtokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craft_deprecationerrors`
--

DROP TABLE IF EXISTS `craft_deprecationerrors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_deprecationerrors` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `key` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `fingerprint` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `lastOccurrence` datetime NOT NULL,
  `file` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `line` smallint(6) unsigned DEFAULT NULL,
  `message` text COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `traces` text COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_idx_fjyqbkwyekpbszdvtokahxrktjrtmoqqrjvh` (`key`,`fingerprint`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_deprecationerrors`
--

LOCK TABLES `craft_deprecationerrors` WRITE;
/*!40000 ALTER TABLE `craft_deprecationerrors` DISABLE KEYS */;
/*!40000 ALTER TABLE `craft_deprecationerrors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craft_drafts`
--

DROP TABLE IF EXISTS `craft_drafts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_drafts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sourceId` int(11) DEFAULT NULL,
  `creatorId` int(11) DEFAULT NULL,
  `provisional` tinyint(1) NOT NULL DEFAULT 0,
  `name` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `notes` text COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `trackChanges` tinyint(1) NOT NULL DEFAULT 0,
  `dateLastMerged` datetime DEFAULT NULL,
  `saved` tinyint(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`),
  KEY `craft_idx_cbuopnljtgtfybocaakwfcqethfxnpwfxifi` (`creatorId`,`provisional`),
  KEY `craft_idx_tgkcmpclulbiksjxrjkwtkjgbybygpezovvq` (`saved`),
  KEY `craft_fk_ipzuqdvkompdbesnzqvdelfkxqbhmwkhzlhd` (`sourceId`),
  CONSTRAINT `craft_fk_ipzuqdvkompdbesnzqvdelfkxqbhmwkhzlhd` FOREIGN KEY (`sourceId`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_fk_weozijajmyztvwsdznhtgvbufwgmqyyyxuza` FOREIGN KEY (`creatorId`) REFERENCES `craft_users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_drafts`
--

LOCK TABLES `craft_drafts` WRITE;
/*!40000 ALTER TABLE `craft_drafts` DISABLE KEYS */;
/*!40000 ALTER TABLE `craft_drafts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craft_elementindexsettings`
--

DROP TABLE IF EXISTS `craft_elementindexsettings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_elementindexsettings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `settings` text COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_idx_fhegmqtwbxgitchcprgfkbfhzvjqkaxcfbdd` (`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_elementindexsettings`
--

LOCK TABLES `craft_elementindexsettings` WRITE;
/*!40000 ALTER TABLE `craft_elementindexsettings` DISABLE KEYS */;
/*!40000 ALTER TABLE `craft_elementindexsettings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craft_elements`
--

DROP TABLE IF EXISTS `craft_elements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_elements` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `canonicalId` int(11) DEFAULT NULL,
  `draftId` int(11) DEFAULT NULL,
  `revisionId` int(11) DEFAULT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `type` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT 1,
  `archived` tinyint(1) NOT NULL DEFAULT 0,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateLastMerged` datetime DEFAULT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `craft_idx_ionabdgsibuccffpbgpfgttyvuemlrkfbpfk` (`dateDeleted`),
  KEY `craft_idx_utpzykofdoicsojikrubezncfhjtpwncuojv` (`fieldLayoutId`),
  KEY `craft_idx_flfbgknainqnudnphudwafuxjrhxtajngrcu` (`type`),
  KEY `craft_idx_nlhtygfbaeynisojqwgseciwenyebytkvacb` (`enabled`),
  KEY `craft_idx_bjjteefeyiywnoaidzclnrkkzovufdounols` (`archived`,`dateCreated`),
  KEY `craft_idx_pffyimqxiwdfiyklqnncaofrdbjhzhqyxhds` (`archived`,`dateDeleted`,`draftId`,`revisionId`),
  KEY `craft_fk_rcqdtbayfeqwmdugjfgsjtyoxreeqdfyzvyt` (`canonicalId`),
  KEY `craft_fk_hywrtmaiwtrkgzipamklezyofdmvgebaohfc` (`draftId`),
  KEY `craft_fk_bygvvryrugrisajsulapxhcvdyybgmqnukqv` (`revisionId`),
  CONSTRAINT `craft_fk_bygvvryrugrisajsulapxhcvdyybgmqnukqv` FOREIGN KEY (`revisionId`) REFERENCES `craft_revisions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_fk_hywrtmaiwtrkgzipamklezyofdmvgebaohfc` FOREIGN KEY (`draftId`) REFERENCES `craft_drafts` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_fk_khbjngnsofmncgknweausmidvpzfikjpnnqv` FOREIGN KEY (`fieldLayoutId`) REFERENCES `craft_fieldlayouts` (`id`) ON DELETE SET NULL,
  CONSTRAINT `craft_fk_rcqdtbayfeqwmdugjfgsjtyoxreeqdfyzvyt` FOREIGN KEY (`canonicalId`) REFERENCES `craft_elements` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_elements`
--

LOCK TABLES `craft_elements` WRITE;
/*!40000 ALTER TABLE `craft_elements` DISABLE KEYS */;
INSERT INTO `craft_elements` VALUES (1,NULL,NULL,NULL,NULL,'craft\\elements\\User',1,0,'2021-07-21 20:47:21','2021-07-21 20:47:21',NULL,NULL,'ead20ee5-01f5-464b-b3af-cb5735566a63');
/*!40000 ALTER TABLE `craft_elements` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craft_elements_sites`
--

DROP TABLE IF EXISTS `craft_elements_sites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_elements_sites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `elementId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `slug` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `uri` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT 1,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_idx_kyvyxcdbsmoktzhfiinevzensupakbuvtjyb` (`elementId`,`siteId`),
  KEY `craft_idx_vfxxkhpxkevwkpczvrmhlrcagubnbscczgga` (`siteId`),
  KEY `craft_idx_pbrrynnptjqwzwrvwljsijyzrmjvmuptxhnh` (`slug`,`siteId`),
  KEY `craft_idx_vuetlkkoplltlprfwfdfusqehmrincsyylei` (`enabled`),
  KEY `craft_idx_mihptfrmnyoskhxqaztmuwwtfnjdvxrmoljd` (`uri`,`siteId`),
  CONSTRAINT `craft_fk_gadsfjgtrbnkdorcykkflffevzabrrpnwghq` FOREIGN KEY (`elementId`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_fk_qcfonioxtltwutfesnmlnzozftbpllieipwi` FOREIGN KEY (`siteId`) REFERENCES `craft_sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_elements_sites`
--

LOCK TABLES `craft_elements_sites` WRITE;
/*!40000 ALTER TABLE `craft_elements_sites` DISABLE KEYS */;
INSERT INTO `craft_elements_sites` VALUES (1,1,1,NULL,NULL,1,'2021-07-21 20:47:21','2021-07-21 20:47:21','ccb21633-18e6-4b7e-b800-454b993e123c');
/*!40000 ALTER TABLE `craft_elements_sites` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craft_entries`
--

DROP TABLE IF EXISTS `craft_entries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_entries` (
  `id` int(11) NOT NULL,
  `sectionId` int(11) NOT NULL,
  `parentId` int(11) DEFAULT NULL,
  `typeId` int(11) NOT NULL,
  `authorId` int(11) DEFAULT NULL,
  `postDate` datetime DEFAULT NULL,
  `expiryDate` datetime DEFAULT NULL,
  `deletedWithEntryType` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `craft_idx_jeimaxeumhllaligiqndikiddmuhigytvfye` (`postDate`),
  KEY `craft_idx_aspqvxoegtenpjwvhmujdmomnhsmzvxpqxtk` (`expiryDate`),
  KEY `craft_idx_gtucdqvfqviifxepegtyyqctsqbpiajefgdm` (`authorId`),
  KEY `craft_idx_ucrnyrprewcrqtrtepvozhyqjfbynamtyduq` (`sectionId`),
  KEY `craft_idx_wrxfqqkxpnqfxgamjbmzcbslycietjmeelhf` (`typeId`),
  KEY `craft_fk_hthahtcvgrjjhqghknftkvugyptypvrgjeix` (`parentId`),
  CONSTRAINT `craft_fk_czhewcdcvoqurgjwxiwtuhmmldkezsvkvpmt` FOREIGN KEY (`typeId`) REFERENCES `craft_entrytypes` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_fk_hthahtcvgrjjhqghknftkvugyptypvrgjeix` FOREIGN KEY (`parentId`) REFERENCES `craft_entries` (`id`) ON DELETE SET NULL,
  CONSTRAINT `craft_fk_lkbgyqfcolwizftcqjedlzrcgnlvqqjquwax` FOREIGN KEY (`sectionId`) REFERENCES `craft_sections` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_fk_npklwqvldzzqmxuuicsnalnmjqxrnjhizyqb` FOREIGN KEY (`authorId`) REFERENCES `craft_users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `craft_fk_onceoqdzokozymqkhnreoxmvuretasrmxwxm` FOREIGN KEY (`id`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_entries`
--

LOCK TABLES `craft_entries` WRITE;
/*!40000 ALTER TABLE `craft_entries` DISABLE KEYS */;
/*!40000 ALTER TABLE `craft_entries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craft_entrytypes`
--

DROP TABLE IF EXISTS `craft_entrytypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_entrytypes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sectionId` int(11) NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `hasTitleField` tinyint(1) NOT NULL DEFAULT 1,
  `titleTranslationMethod` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'site',
  `titleTranslationKeyFormat` text COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `titleFormat` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `craft_idx_mxeoleibqultjckajnzhorwujitjmnutawao` (`name`,`sectionId`),
  KEY `craft_idx_qjeweftuwsnyvajwkdfizvmdeuprvbcjxhwn` (`handle`,`sectionId`),
  KEY `craft_idx_elwscqzyurdetpwtnymoywfnypvrrppabkxq` (`sectionId`),
  KEY `craft_idx_uglpsigbmqjufwnvkzwlkzcfnnaibhngmtfk` (`fieldLayoutId`),
  KEY `craft_idx_mgjvjttfjdumhgffwjinfcfqmjkgtyhcdyds` (`dateDeleted`),
  CONSTRAINT `craft_fk_hkfvgktfqtzemlgzsgmgmbnixpybjzuzmyzq` FOREIGN KEY (`sectionId`) REFERENCES `craft_sections` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_fk_spylpopcppfbtlvahowbypnxxfctziatsxpk` FOREIGN KEY (`fieldLayoutId`) REFERENCES `craft_fieldlayouts` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_entrytypes`
--

LOCK TABLES `craft_entrytypes` WRITE;
/*!40000 ALTER TABLE `craft_entrytypes` DISABLE KEYS */;
/*!40000 ALTER TABLE `craft_entrytypes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craft_fieldgroups`
--

DROP TABLE IF EXISTS `craft_fieldgroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_fieldgroups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `craft_idx_dmalnkynstrdztfkrxpaayomiubziwyogiql` (`name`),
  KEY `craft_idx_puhzkubcssfbwtkpeoawqvfyamobhksktuse` (`dateDeleted`,`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_fieldgroups`
--

LOCK TABLES `craft_fieldgroups` WRITE;
/*!40000 ALTER TABLE `craft_fieldgroups` DISABLE KEYS */;
INSERT INTO `craft_fieldgroups` VALUES (1,'Common','2021-07-21 20:47:21','2021-07-21 20:47:21',NULL,'342015e1-54e2-41cb-8dda-08558be0fb30');
/*!40000 ALTER TABLE `craft_fieldgroups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craft_fieldlayoutfields`
--

DROP TABLE IF EXISTS `craft_fieldlayoutfields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_fieldlayoutfields` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `layoutId` int(11) NOT NULL,
  `tabId` int(11) NOT NULL,
  `fieldId` int(11) NOT NULL,
  `required` tinyint(1) NOT NULL DEFAULT 0,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_idx_wapeuelsylxqpnayoyojctoeoycnqkcwncrc` (`layoutId`,`fieldId`),
  KEY `craft_idx_lpgaszkunwvpfllalxhuscuosjkpucvkyidf` (`sortOrder`),
  KEY `craft_idx_ramoxlmpkvivnnonkdizezbeaiaipcduyqul` (`tabId`),
  KEY `craft_idx_zvzaxygrdztewadcbtxhdiqpvgnhgowjmgiw` (`fieldId`),
  CONSTRAINT `craft_fk_feuxbysnzcrniixtlwrrlbcjysohjphdfmxd` FOREIGN KEY (`tabId`) REFERENCES `craft_fieldlayouttabs` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_fk_lyrkfpjtodfvljelndcjmhjnpfyzvydyoxbo` FOREIGN KEY (`layoutId`) REFERENCES `craft_fieldlayouts` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_fk_qnuopiywtegnroeqlzlqqpbdgxysbcndpbxf` FOREIGN KEY (`fieldId`) REFERENCES `craft_fields` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_fieldlayoutfields`
--

LOCK TABLES `craft_fieldlayoutfields` WRITE;
/*!40000 ALTER TABLE `craft_fieldlayoutfields` DISABLE KEYS */;
/*!40000 ALTER TABLE `craft_fieldlayoutfields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craft_fieldlayouts`
--

DROP TABLE IF EXISTS `craft_fieldlayouts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_fieldlayouts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `craft_idx_crpcixcgtceesjoqghimhtjqoujraarfrtxz` (`dateDeleted`),
  KEY `craft_idx_xkszezodtaaeogrhaleavgrdeviubrbtipdx` (`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_fieldlayouts`
--

LOCK TABLES `craft_fieldlayouts` WRITE;
/*!40000 ALTER TABLE `craft_fieldlayouts` DISABLE KEYS */;
/*!40000 ALTER TABLE `craft_fieldlayouts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craft_fieldlayouttabs`
--

DROP TABLE IF EXISTS `craft_fieldlayouttabs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_fieldlayouttabs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `layoutId` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `elements` text COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `craft_idx_yulftyqbvrciomikxezgbwppcstjlqfpdxlr` (`sortOrder`),
  KEY `craft_idx_ygoamlykpwaedrdfpdjbmflreadnfdutdjue` (`layoutId`),
  CONSTRAINT `craft_fk_qnjvsrnquigvhfhgngoymmetavkurpqbkkhl` FOREIGN KEY (`layoutId`) REFERENCES `craft_fieldlayouts` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_fieldlayouttabs`
--

LOCK TABLES `craft_fieldlayouttabs` WRITE;
/*!40000 ALTER TABLE `craft_fieldlayouttabs` DISABLE KEYS */;
/*!40000 ALTER TABLE `craft_fieldlayouttabs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craft_fields`
--

DROP TABLE IF EXISTS `craft_fields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_fields` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `groupId` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `handle` varchar(64) COLLATE utf8mb3_unicode_ci NOT NULL,
  `context` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'global',
  `columnSuffix` char(8) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `instructions` text COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `searchable` tinyint(1) NOT NULL DEFAULT 1,
  `translationMethod` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'none',
  `translationKeyFormat` text COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `type` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `settings` text COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `craft_idx_pmsxpdsdxvdfnldobuirtewovixedqwkkrhn` (`handle`,`context`),
  KEY `craft_idx_ajymkmelxnbvdhksxuzxztorapnojgzqkraa` (`groupId`),
  KEY `craft_idx_dngbuboghlfqfduzfsnuuzkcxbkkoyxewpqm` (`context`),
  CONSTRAINT `craft_fk_byvwfqgozmypwspwbojjpssygwwqtimuhjlp` FOREIGN KEY (`groupId`) REFERENCES `craft_fieldgroups` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_fields`
--

LOCK TABLES `craft_fields` WRITE;
/*!40000 ALTER TABLE `craft_fields` DISABLE KEYS */;
/*!40000 ALTER TABLE `craft_fields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craft_globalsets`
--

DROP TABLE IF EXISTS `craft_globalsets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_globalsets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `craft_idx_cfcemfdwbqamrqrfijsukcfxickjsucjjzas` (`name`),
  KEY `craft_idx_qhhkxddccqedlizidqnlrgdajbfnnuwkhzlm` (`handle`),
  KEY `craft_idx_zdtvuscqptdlgrjmppkakhenxpmyrwrpodgw` (`fieldLayoutId`),
  KEY `craft_idx_tpniauxququhtlbkehdzkhphsvdlcvdvwtxl` (`sortOrder`),
  CONSTRAINT `craft_fk_espazqdurkazezfsxlkwpquleofnfbqajzne` FOREIGN KEY (`fieldLayoutId`) REFERENCES `craft_fieldlayouts` (`id`) ON DELETE SET NULL,
  CONSTRAINT `craft_fk_lgznuhwofqrkyzgoljrvdfxqjttxismnhvtb` FOREIGN KEY (`id`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_globalsets`
--

LOCK TABLES `craft_globalsets` WRITE;
/*!40000 ALTER TABLE `craft_globalsets` DISABLE KEYS */;
/*!40000 ALTER TABLE `craft_globalsets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craft_gqlschemas`
--

DROP TABLE IF EXISTS `craft_gqlschemas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_gqlschemas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `scope` text COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `isPublic` tinyint(1) NOT NULL DEFAULT 0,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_gqlschemas`
--

LOCK TABLES `craft_gqlschemas` WRITE;
/*!40000 ALTER TABLE `craft_gqlschemas` DISABLE KEYS */;
/*!40000 ALTER TABLE `craft_gqlschemas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craft_gqltokens`
--

DROP TABLE IF EXISTS `craft_gqltokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_gqltokens` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `accessToken` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT 1,
  `expiryDate` datetime DEFAULT NULL,
  `lastUsed` datetime DEFAULT NULL,
  `schemaId` int(11) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_idx_lwjtezsfcuqaanmgfdgsmyaofazujwpghfrb` (`accessToken`),
  UNIQUE KEY `craft_idx_nwealmcrfhzoyftmymfvjowbtsnngdhcbslv` (`name`),
  KEY `craft_fk_xurvzyhdwjknimlqajhwiijqiqnowlmgqncc` (`schemaId`),
  CONSTRAINT `craft_fk_xurvzyhdwjknimlqajhwiijqiqnowlmgqncc` FOREIGN KEY (`schemaId`) REFERENCES `craft_gqlschemas` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_gqltokens`
--

LOCK TABLES `craft_gqltokens` WRITE;
/*!40000 ALTER TABLE `craft_gqltokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `craft_gqltokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craft_info`
--

DROP TABLE IF EXISTS `craft_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `version` varchar(50) COLLATE utf8mb3_unicode_ci NOT NULL,
  `schemaVersion` varchar(15) COLLATE utf8mb3_unicode_ci NOT NULL,
  `maintenance` tinyint(1) NOT NULL DEFAULT 0,
  `configVersion` char(12) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '000000000000',
  `fieldVersion` char(12) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '000000000000',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_info`
--

LOCK TABLES `craft_info` WRITE;
/*!40000 ALTER TABLE `craft_info` DISABLE KEYS */;
INSERT INTO `craft_info` VALUES (1,'3.7.4','3.7.7',0,'oympyrlitzyb','dogvsptpmfxx','2021-07-21 20:47:21','2021-07-21 23:05:14','308c36e9-5ff5-4a35-b637-af1bf7ce6ccb');
/*!40000 ALTER TABLE `craft_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craft_matrixblocks`
--

DROP TABLE IF EXISTS `craft_matrixblocks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_matrixblocks` (
  `id` int(11) NOT NULL,
  `ownerId` int(11) NOT NULL,
  `fieldId` int(11) NOT NULL,
  `typeId` int(11) NOT NULL,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `deletedWithOwner` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `craft_idx_kogueiovedwsjwqogvuvzyfxxqsmaccyxcgn` (`ownerId`),
  KEY `craft_idx_cpubakffnaawvguzghclyiwzlniysiyzokml` (`fieldId`),
  KEY `craft_idx_kkugeodpjeoqstmbprytnzkukpqljoyqjpdi` (`typeId`),
  KEY `craft_idx_pvojdbdgrvtdnquuajpilpjqkorecgmwggfa` (`sortOrder`),
  CONSTRAINT `craft_fk_ajsgcqshawsycbfzlrmhovtdgsigovwsznba` FOREIGN KEY (`ownerId`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_fk_aowkuhamstoubxlqkxcqbirrwzwvoxbqhopr` FOREIGN KEY (`typeId`) REFERENCES `craft_matrixblocktypes` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_fk_nmkxttovpsdosggvsimnuqcqwgenqwngydsj` FOREIGN KEY (`id`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_fk_xmuptdebpxvwltepqxlqyjpnqzmunrwaqrud` FOREIGN KEY (`fieldId`) REFERENCES `craft_fields` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_matrixblocks`
--

LOCK TABLES `craft_matrixblocks` WRITE;
/*!40000 ALTER TABLE `craft_matrixblocks` DISABLE KEYS */;
/*!40000 ALTER TABLE `craft_matrixblocks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craft_matrixblocktypes`
--

DROP TABLE IF EXISTS `craft_matrixblocktypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_matrixblocktypes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fieldId` int(11) NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `craft_idx_pvwkhjrpfwemjwprqkqqazrhsenlmtaulfai` (`name`,`fieldId`),
  KEY `craft_idx_wrdifnludageaxbacwozfkfdffkqtrdnsnkq` (`handle`,`fieldId`),
  KEY `craft_idx_rzgrbqoxgotlwqxdnzdipzkcqsjaglktuddx` (`fieldId`),
  KEY `craft_idx_dczdujzyfazvvhikurmmjkdwddexriuqgzsj` (`fieldLayoutId`),
  CONSTRAINT `craft_fk_hziwkufglftshixqhqmxbfjbzqayckuzadel` FOREIGN KEY (`fieldId`) REFERENCES `craft_fields` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_fk_rkphgqadxcgmouxwifyeuctfsodynyciklar` FOREIGN KEY (`fieldLayoutId`) REFERENCES `craft_fieldlayouts` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_matrixblocktypes`
--

LOCK TABLES `craft_matrixblocktypes` WRITE;
/*!40000 ALTER TABLE `craft_matrixblocktypes` DISABLE KEYS */;
/*!40000 ALTER TABLE `craft_matrixblocktypes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craft_migrations`
--

DROP TABLE IF EXISTS `craft_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `track` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `applyTime` datetime NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_idx_joulihrdsbwdpfonvmhdzaxgtxqllnlsrupx` (`track`,`name`)
) ENGINE=InnoDB AUTO_INCREMENT=198 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_migrations`
--

LOCK TABLES `craft_migrations` WRITE;
/*!40000 ALTER TABLE `craft_migrations` DISABLE KEYS */;
INSERT INTO `craft_migrations` VALUES (1,'craft','Install','2021-07-21 20:47:22','2021-07-21 20:47:22','2021-07-21 20:47:22','67223ed6-cbe9-45e6-a5ef-e4ea39fbe617'),(2,'craft','m150403_183908_migrations_table_changes','2021-07-21 20:47:22','2021-07-21 20:47:22','2021-07-21 20:47:22','327c4060-f23a-4b0f-9594-eae5ecd80e7a'),(3,'craft','m150403_184247_plugins_table_changes','2021-07-21 20:47:22','2021-07-21 20:47:22','2021-07-21 20:47:22','47b20276-3b05-496b-8be4-7dd27a724f06'),(4,'craft','m150403_184533_field_version','2021-07-21 20:47:22','2021-07-21 20:47:22','2021-07-21 20:47:22','9d0b5eb9-381f-483e-a1ac-d9124df32812'),(5,'craft','m150403_184729_type_columns','2021-07-21 20:47:22','2021-07-21 20:47:22','2021-07-21 20:47:22','7b4614e5-d57c-48a5-8c51-d4b850f8a8df'),(6,'craft','m150403_185142_volumes','2021-07-21 20:47:22','2021-07-21 20:47:22','2021-07-21 20:47:22','527f37bc-7aa5-434f-868f-6fe890043437'),(7,'craft','m150428_231346_userpreferences','2021-07-21 20:47:22','2021-07-21 20:47:22','2021-07-21 20:47:22','8ae3e290-3220-40ea-a24a-8214ea1dc602'),(8,'craft','m150519_150900_fieldversion_conversion','2021-07-21 20:47:22','2021-07-21 20:47:22','2021-07-21 20:47:22','7423ac19-a356-4bbc-8c47-9edc9dad47a5'),(9,'craft','m150617_213829_update_email_settings','2021-07-21 20:47:22','2021-07-21 20:47:22','2021-07-21 20:47:22','9d3c6721-371c-4c47-bd8a-66f90137f032'),(10,'craft','m150721_124739_templatecachequeries','2021-07-21 20:47:22','2021-07-21 20:47:22','2021-07-21 20:47:22','9f6b8db0-6bde-4b97-aeb9-3a9da3908fc5'),(11,'craft','m150724_140822_adjust_quality_settings','2021-07-21 20:47:22','2021-07-21 20:47:22','2021-07-21 20:47:22','266d0b9b-3023-4a53-9121-41343add20ea'),(12,'craft','m150815_133521_last_login_attempt_ip','2021-07-21 20:47:22','2021-07-21 20:47:22','2021-07-21 20:47:22','f404c6b4-6493-4629-bc46-eb60f27fc794'),(13,'craft','m151002_095935_volume_cache_settings','2021-07-21 20:47:22','2021-07-21 20:47:22','2021-07-21 20:47:22','10f540b7-a4b1-480c-933e-00e42e61d6b7'),(14,'craft','m151005_142750_volume_s3_storage_settings','2021-07-21 20:47:22','2021-07-21 20:47:22','2021-07-21 20:47:22','a59dbb3f-a471-4000-baae-2120173ac0ee'),(15,'craft','m151016_133600_delete_asset_thumbnails','2021-07-21 20:47:22','2021-07-21 20:47:22','2021-07-21 20:47:22','5bf4bb36-1c53-4918-a9f1-2c75586f6ee5'),(16,'craft','m151209_000000_move_logo','2021-07-21 20:47:22','2021-07-21 20:47:22','2021-07-21 20:47:22','5ff1ebe1-6f16-4da5-865b-b5822c5e057a'),(17,'craft','m151211_000000_rename_fileId_to_assetId','2021-07-21 20:47:22','2021-07-21 20:47:22','2021-07-21 20:47:22','4eacac60-b4a5-4b73-9d91-ec3dd5d02f06'),(18,'craft','m151215_000000_rename_asset_permissions','2021-07-21 20:47:22','2021-07-21 20:47:22','2021-07-21 20:47:22','e591326a-6db6-4dfd-a6c9-b3e10c3d3244'),(19,'craft','m160707_000001_rename_richtext_assetsource_setting','2021-07-21 20:47:22','2021-07-21 20:47:22','2021-07-21 20:47:22','9efa2b06-309a-4b44-b26c-539c2244934b'),(20,'craft','m160708_185142_volume_hasUrls_setting','2021-07-21 20:47:22','2021-07-21 20:47:22','2021-07-21 20:47:22','ac109978-9416-4054-8584-a26a4904d38c'),(21,'craft','m160714_000000_increase_max_asset_filesize','2021-07-21 20:47:22','2021-07-21 20:47:22','2021-07-21 20:47:22','91b5284e-0ab6-49b5-ab42-475f24a54fc1'),(22,'craft','m160727_194637_column_cleanup','2021-07-21 20:47:22','2021-07-21 20:47:22','2021-07-21 20:47:22','dfa4bf99-8e19-474a-b27e-2dac0559c7de'),(23,'craft','m160804_110002_userphotos_to_assets','2021-07-21 20:47:22','2021-07-21 20:47:22','2021-07-21 20:47:22','fc405add-9d80-4139-94e6-aea8b902de1f'),(24,'craft','m160807_144858_sites','2021-07-21 20:47:22','2021-07-21 20:47:22','2021-07-21 20:47:22','52a5d9fc-9457-4852-8d71-8aafb43856f1'),(25,'craft','m160829_000000_pending_user_content_cleanup','2021-07-21 20:47:22','2021-07-21 20:47:22','2021-07-21 20:47:22','3f388859-0aab-46d3-acc0-75ec2006ab26'),(26,'craft','m160830_000000_asset_index_uri_increase','2021-07-21 20:47:22','2021-07-21 20:47:22','2021-07-21 20:47:22','38b5abc3-1e12-4a88-a549-d4cfabe4f181'),(27,'craft','m160912_230520_require_entry_type_id','2021-07-21 20:47:22','2021-07-21 20:47:22','2021-07-21 20:47:22','fdfb8389-3e89-42bd-bfc3-fdf9cdc106dd'),(28,'craft','m160913_134730_require_matrix_block_type_id','2021-07-21 20:47:22','2021-07-21 20:47:22','2021-07-21 20:47:22','63365a2a-93f2-4d8b-8474-acec4a039e7e'),(29,'craft','m160920_174553_matrixblocks_owner_site_id_nullable','2021-07-21 20:47:22','2021-07-21 20:47:22','2021-07-21 20:47:22','d1231b02-d802-4b50-bbcb-4b16c5463bb2'),(30,'craft','m160920_231045_usergroup_handle_title_unique','2021-07-21 20:47:22','2021-07-21 20:47:22','2021-07-21 20:47:22','7bf4b0b8-f454-4c46-8eca-06a6a182b703'),(31,'craft','m160925_113941_route_uri_parts','2021-07-21 20:47:22','2021-07-21 20:47:22','2021-07-21 20:47:22','70e9151f-d432-4df5-b468-cf64a3b91a66'),(32,'craft','m161006_205918_schemaVersion_not_null','2021-07-21 20:47:22','2021-07-21 20:47:22','2021-07-21 20:47:22','5122a22c-c95e-459c-b9f4-83cc0bf61bd3'),(33,'craft','m161007_130653_update_email_settings','2021-07-21 20:47:22','2021-07-21 20:47:22','2021-07-21 20:47:22','7f3e7ebc-237b-420c-90f4-cf5ea7750f90'),(34,'craft','m161013_175052_newParentId','2021-07-21 20:47:22','2021-07-21 20:47:22','2021-07-21 20:47:22','6068c283-3baf-430c-80a1-59802757d3bd'),(35,'craft','m161021_102916_fix_recent_entries_widgets','2021-07-21 20:47:22','2021-07-21 20:47:22','2021-07-21 20:47:22','6ba9e0a7-c21c-4bff-a8d5-8ec4b2bb4a61'),(36,'craft','m161021_182140_rename_get_help_widget','2021-07-21 20:47:22','2021-07-21 20:47:22','2021-07-21 20:47:22','ebce978a-e48e-458d-b016-bb859c69d675'),(37,'craft','m161025_000000_fix_char_columns','2021-07-21 20:47:22','2021-07-21 20:47:22','2021-07-21 20:47:22','fca1bd7a-e2cd-4148-ac2d-921d523f7767'),(38,'craft','m161029_124145_email_message_languages','2021-07-21 20:47:22','2021-07-21 20:47:22','2021-07-21 20:47:22','7f640500-17db-4740-984d-a4296778470e'),(39,'craft','m161108_000000_new_version_format','2021-07-21 20:47:22','2021-07-21 20:47:22','2021-07-21 20:47:22','11f0e09d-5a65-423c-86ee-6217d995a050'),(40,'craft','m161109_000000_index_shuffle','2021-07-21 20:47:22','2021-07-21 20:47:22','2021-07-21 20:47:22','b498e865-78c6-41d1-90be-d3bc787586d5'),(41,'craft','m161122_185500_no_craft_app','2021-07-21 20:47:22','2021-07-21 20:47:22','2021-07-21 20:47:22','300157bd-2bf2-4d50-ac73-c9e6b1a06001'),(42,'craft','m161125_150752_clear_urlmanager_cache','2021-07-21 20:47:22','2021-07-21 20:47:22','2021-07-21 20:47:22','f7b4b0a5-1669-424a-8fad-7a515c6155a8'),(43,'craft','m161220_000000_volumes_hasurl_notnull','2021-07-21 20:47:22','2021-07-21 20:47:22','2021-07-21 20:47:22','75f6205d-9b45-4ef9-b366-4f8fb3157f92'),(44,'craft','m170114_161144_udates_permission','2021-07-21 20:47:22','2021-07-21 20:47:22','2021-07-21 20:47:22','afa1324c-6d76-47a6-8893-27ea79730984'),(45,'craft','m170120_000000_schema_cleanup','2021-07-21 20:47:22','2021-07-21 20:47:22','2021-07-21 20:47:22','aa0a738b-20b7-4e83-b205-a86de93fd0bd'),(46,'craft','m170126_000000_assets_focal_point','2021-07-21 20:47:22','2021-07-21 20:47:22','2021-07-21 20:47:22','f046744e-be3d-4fd8-8326-9d0d311e8cd8'),(47,'craft','m170206_142126_system_name','2021-07-21 20:47:22','2021-07-21 20:47:22','2021-07-21 20:47:22','4543b41c-8210-4bb3-acc4-8100e02b1cc2'),(48,'craft','m170217_044740_category_branch_limits','2021-07-21 20:47:22','2021-07-21 20:47:22','2021-07-21 20:47:22','d5d91db0-18a8-4b8d-82b3-eb4f21973491'),(49,'craft','m170217_120224_asset_indexing_columns','2021-07-21 20:47:22','2021-07-21 20:47:22','2021-07-21 20:47:22','91411327-e62d-4332-8222-38a34bdf183b'),(50,'craft','m170223_224012_plain_text_settings','2021-07-21 20:47:22','2021-07-21 20:47:22','2021-07-21 20:47:22','3add374a-c31b-4445-b4ff-babbcf862c61'),(51,'craft','m170227_120814_focal_point_percentage','2021-07-21 20:47:22','2021-07-21 20:47:22','2021-07-21 20:47:22','d80d38bf-444f-4edb-9779-e32c0096c1e9'),(52,'craft','m170228_171113_system_messages','2021-07-21 20:47:23','2021-07-21 20:47:23','2021-07-21 20:47:23','a7187003-adcb-4524-aff6-28a74f8b1b68'),(53,'craft','m170303_140500_asset_field_source_settings','2021-07-21 20:47:23','2021-07-21 20:47:23','2021-07-21 20:47:23','d9662377-4f75-4b6a-9348-ebc3b2abdf27'),(54,'craft','m170306_150500_asset_temporary_uploads','2021-07-21 20:47:23','2021-07-21 20:47:23','2021-07-21 20:47:23','ea213a73-1367-4824-b670-5990f894d322'),(55,'craft','m170523_190652_element_field_layout_ids','2021-07-21 20:47:23','2021-07-21 20:47:23','2021-07-21 20:47:23','51b92a1e-b73e-4b93-a463-b5856158a7af'),(56,'craft','m170621_195237_format_plugin_handles','2021-07-21 20:47:23','2021-07-21 20:47:23','2021-07-21 20:47:23','69e0e8cf-3b3e-46ed-91ac-d5eaef6fda65'),(57,'craft','m170630_161027_deprecation_line_nullable','2021-07-21 20:47:23','2021-07-21 20:47:23','2021-07-21 20:47:23','6846dea8-f5e9-4e32-a8ed-4d78c1e9eb0f'),(58,'craft','m170630_161028_deprecation_changes','2021-07-21 20:47:23','2021-07-21 20:47:23','2021-07-21 20:47:23','7254777f-8570-4e3a-b1c7-77b1529c388e'),(59,'craft','m170703_181539_plugins_table_tweaks','2021-07-21 20:47:23','2021-07-21 20:47:23','2021-07-21 20:47:23','0a34746f-426c-413b-96c1-daf356fbce01'),(60,'craft','m170704_134916_sites_tables','2021-07-21 20:47:23','2021-07-21 20:47:23','2021-07-21 20:47:23','1f4ef005-9d4c-4725-8e25-5e0a8a18efc7'),(61,'craft','m170706_183216_rename_sequences','2021-07-21 20:47:23','2021-07-21 20:47:23','2021-07-21 20:47:23','c0386084-3109-41b9-abcd-c981889e4a8d'),(62,'craft','m170707_094758_delete_compiled_traits','2021-07-21 20:47:23','2021-07-21 20:47:23','2021-07-21 20:47:23','d4a7d38f-3887-45c8-bf92-db8034fbb2fb'),(63,'craft','m170731_190138_drop_asset_packagist','2021-07-21 20:47:23','2021-07-21 20:47:23','2021-07-21 20:47:23','2a4a24ef-d8e0-4fab-91d1-3fc03bd55cb3'),(64,'craft','m170810_201318_create_queue_table','2021-07-21 20:47:23','2021-07-21 20:47:23','2021-07-21 20:47:23','b2776fec-8910-4d08-ad27-ba3d4cf5d6b9'),(65,'craft','m170903_192801_longblob_for_queue_jobs','2021-07-21 20:47:23','2021-07-21 20:47:23','2021-07-21 20:47:23','9dff23f0-9ac0-450b-b0c1-ca02af4ba729'),(66,'craft','m170914_204621_asset_cache_shuffle','2021-07-21 20:47:23','2021-07-21 20:47:23','2021-07-21 20:47:23','0ee9796b-1937-4142-97cf-36d5aac9552e'),(67,'craft','m171011_214115_site_groups','2021-07-21 20:47:23','2021-07-21 20:47:23','2021-07-21 20:47:23','33e08966-5360-4d2d-93b4-99fb03c7cd50'),(68,'craft','m171012_151440_primary_site','2021-07-21 20:47:23','2021-07-21 20:47:23','2021-07-21 20:47:23','ce8841d5-9167-45b5-affd-9b3f9100eb30'),(69,'craft','m171013_142500_transform_interlace','2021-07-21 20:47:23','2021-07-21 20:47:23','2021-07-21 20:47:23','b36f3f49-b99f-4b1d-b83f-ca7167e78986'),(70,'craft','m171016_092553_drop_position_select','2021-07-21 20:47:23','2021-07-21 20:47:23','2021-07-21 20:47:23','54a784dd-a8eb-4ec1-8beb-54f82f7fdbf7'),(71,'craft','m171016_221244_less_strict_translation_method','2021-07-21 20:47:23','2021-07-21 20:47:23','2021-07-21 20:47:23','804990e6-9b19-42f2-9b3e-f7e9c16f7d80'),(72,'craft','m171107_000000_assign_group_permissions','2021-07-21 20:47:23','2021-07-21 20:47:23','2021-07-21 20:47:23','4c6f83c1-2048-466f-bdda-172b4244e177'),(73,'craft','m171117_000001_templatecache_index_tune','2021-07-21 20:47:23','2021-07-21 20:47:23','2021-07-21 20:47:23','858db5f8-1d69-4ebf-a96e-720b2fcb9bba'),(74,'craft','m171126_105927_disabled_plugins','2021-07-21 20:47:23','2021-07-21 20:47:23','2021-07-21 20:47:23','11299c10-bd47-44ab-8bd5-a095ef49078a'),(75,'craft','m171130_214407_craftidtokens_table','2021-07-21 20:47:23','2021-07-21 20:47:23','2021-07-21 20:47:23','46a46478-0a0d-4c94-a8fe-354277e7082f'),(76,'craft','m171202_004225_update_email_settings','2021-07-21 20:47:23','2021-07-21 20:47:23','2021-07-21 20:47:23','eb2ba55b-b9a1-4126-8dfb-e4b6f91ab6ef'),(77,'craft','m171204_000001_templatecache_index_tune_deux','2021-07-21 20:47:23','2021-07-21 20:47:23','2021-07-21 20:47:23','227050e9-7ff8-4881-8ac3-e164758dd08f'),(78,'craft','m171205_130908_remove_craftidtokens_refreshtoken_column','2021-07-21 20:47:23','2021-07-21 20:47:23','2021-07-21 20:47:23','c4080d65-a1df-4c56-bf88-b8bae9c3f4cc'),(79,'craft','m171218_143135_longtext_query_column','2021-07-21 20:47:23','2021-07-21 20:47:23','2021-07-21 20:47:23','5001aa08-f4b0-412f-aad8-fc9747b8b6d4'),(80,'craft','m171231_055546_environment_variables_to_aliases','2021-07-21 20:47:23','2021-07-21 20:47:23','2021-07-21 20:47:23','83cbc27f-11f7-422a-9e23-d9c13a971d05'),(81,'craft','m180113_153740_drop_users_archived_column','2021-07-21 20:47:23','2021-07-21 20:47:23','2021-07-21 20:47:23','99a955bc-2e43-4d96-a4cc-89627450c0c3'),(82,'craft','m180122_213433_propagate_entries_setting','2021-07-21 20:47:23','2021-07-21 20:47:23','2021-07-21 20:47:23','085f0350-68bf-4ade-bf74-6117d48df45f'),(83,'craft','m180124_230459_fix_propagate_entries_values','2021-07-21 20:47:23','2021-07-21 20:47:23','2021-07-21 20:47:23','c10081a5-c106-4e81-bf15-ec9aac750687'),(84,'craft','m180128_235202_set_tag_slugs','2021-07-21 20:47:23','2021-07-21 20:47:23','2021-07-21 20:47:23','04455bfb-b626-41c9-b0f1-62500cb04283'),(85,'craft','m180202_185551_fix_focal_points','2021-07-21 20:47:23','2021-07-21 20:47:23','2021-07-21 20:47:23','975c7426-6736-492c-8492-8bbceb3e7211'),(86,'craft','m180217_172123_tiny_ints','2021-07-21 20:47:23','2021-07-21 20:47:23','2021-07-21 20:47:23','f4358fdd-6be0-4a1e-b258-5ee6fc994ae1'),(87,'craft','m180321_233505_small_ints','2021-07-21 20:47:23','2021-07-21 20:47:23','2021-07-21 20:47:23','97175a30-77fa-4abc-898a-484e80a0a3e5'),(88,'craft','m180404_182320_edition_changes','2021-07-21 20:47:23','2021-07-21 20:47:23','2021-07-21 20:47:23','c6d2dff6-cc4f-467d-b5b2-058362b2731c'),(89,'craft','m180411_102218_fix_db_routes','2021-07-21 20:47:23','2021-07-21 20:47:23','2021-07-21 20:47:23','1a56765a-7ed6-4725-846c-fd8f5f8d17eb'),(90,'craft','m180416_205628_resourcepaths_table','2021-07-21 20:47:23','2021-07-21 20:47:23','2021-07-21 20:47:23','43d89c42-b163-4b16-b84b-7932042ad3a1'),(91,'craft','m180418_205713_widget_cleanup','2021-07-21 20:47:23','2021-07-21 20:47:23','2021-07-21 20:47:23','714830f7-1212-4e3f-902f-97fdebc98c93'),(92,'craft','m180425_203349_searchable_fields','2021-07-21 20:47:23','2021-07-21 20:47:23','2021-07-21 20:47:23','6b8de22c-cbb4-44ca-bd16-3d8e2b3ec3a5'),(93,'craft','m180516_153000_uids_in_field_settings','2021-07-21 20:47:23','2021-07-21 20:47:23','2021-07-21 20:47:23','0ff75ec0-c245-40b9-bc3a-4854415051b7'),(94,'craft','m180517_173000_user_photo_volume_to_uid','2021-07-21 20:47:23','2021-07-21 20:47:23','2021-07-21 20:47:23','2a04f5a8-ae38-474f-b2a3-9992ff086876'),(95,'craft','m180518_173000_permissions_to_uid','2021-07-21 20:47:23','2021-07-21 20:47:23','2021-07-21 20:47:23','c8489367-8ae4-4fd7-a5d1-cef2095801f0'),(96,'craft','m180520_173000_matrix_context_to_uids','2021-07-21 20:47:23','2021-07-21 20:47:23','2021-07-21 20:47:23','659cd46a-f9cf-40e0-8922-e580391f1440'),(97,'craft','m180521_172900_project_config_table','2021-07-21 20:47:23','2021-07-21 20:47:23','2021-07-21 20:47:23','8c1028ca-c1f2-4951-9d18-a91685a21811'),(98,'craft','m180521_173000_initial_yml_and_snapshot','2021-07-21 20:47:23','2021-07-21 20:47:23','2021-07-21 20:47:23','bb5a5aaf-939e-49e8-906d-89cded3cf5fa'),(99,'craft','m180731_162030_soft_delete_sites','2021-07-21 20:47:23','2021-07-21 20:47:23','2021-07-21 20:47:23','d8f502a7-2dbb-4529-bdc0-bb45fcb9a43c'),(100,'craft','m180810_214427_soft_delete_field_layouts','2021-07-21 20:47:23','2021-07-21 20:47:23','2021-07-21 20:47:23','acc4df5d-d970-460b-9fcd-9f902c38092a'),(101,'craft','m180810_214439_soft_delete_elements','2021-07-21 20:47:23','2021-07-21 20:47:23','2021-07-21 20:47:23','4cc03fe0-e741-4e89-8d91-4508858ae2fa'),(102,'craft','m180824_193422_case_sensitivity_fixes','2021-07-21 20:47:23','2021-07-21 20:47:23','2021-07-21 20:47:23','eee8ab81-3043-4891-967a-37e7801c15e1'),(103,'craft','m180901_151639_fix_matrixcontent_tables','2021-07-21 20:47:23','2021-07-21 20:47:23','2021-07-21 20:47:23','d7789888-d405-43a9-828f-5836e8386db8'),(104,'craft','m180904_112109_permission_changes','2021-07-21 20:47:23','2021-07-21 20:47:23','2021-07-21 20:47:23','9ad9ad52-c7e8-40f0-bf13-085e120c9283'),(105,'craft','m180910_142030_soft_delete_sitegroups','2021-07-21 20:47:23','2021-07-21 20:47:23','2021-07-21 20:47:23','955a22c0-ce79-4c26-8ecd-85126045900a'),(106,'craft','m181011_160000_soft_delete_asset_support','2021-07-21 20:47:23','2021-07-21 20:47:23','2021-07-21 20:47:23','3f96020f-3d51-4b36-af24-85af2181baa0'),(107,'craft','m181016_183648_set_default_user_settings','2021-07-21 20:47:23','2021-07-21 20:47:23','2021-07-21 20:47:23','d014456e-853c-49ae-a4e8-a80290d073e2'),(108,'craft','m181017_225222_system_config_settings','2021-07-21 20:47:23','2021-07-21 20:47:23','2021-07-21 20:47:23','35f7c431-ae4c-4726-ae37-ad835543b152'),(109,'craft','m181018_222343_drop_userpermissions_from_config','2021-07-21 20:47:23','2021-07-21 20:47:23','2021-07-21 20:47:23','1015a3e9-91ed-40bd-90c6-ed1f90720e2e'),(110,'craft','m181029_130000_add_transforms_routes_to_config','2021-07-21 20:47:23','2021-07-21 20:47:23','2021-07-21 20:47:23','cfb66536-a6aa-420f-8ab2-c7bb227f1ffe'),(111,'craft','m181112_203955_sequences_table','2021-07-21 20:47:23','2021-07-21 20:47:23','2021-07-21 20:47:23','47668ab4-4ddd-4560-b0bd-9f62c9a8df71'),(112,'craft','m181121_001712_cleanup_field_configs','2021-07-21 20:47:23','2021-07-21 20:47:23','2021-07-21 20:47:23','1ed1fcd0-6f15-4314-a578-765fd32c763a'),(113,'craft','m181128_193942_fix_project_config','2021-07-21 20:47:23','2021-07-21 20:47:23','2021-07-21 20:47:23','cb67d5a0-baa2-4b9c-b862-7242969c3509'),(114,'craft','m181130_143040_fix_schema_version','2021-07-21 20:47:23','2021-07-21 20:47:23','2021-07-21 20:47:23','2c8d753d-eed4-4f9c-8b77-313b742e9461'),(115,'craft','m181211_143040_fix_entry_type_uids','2021-07-21 20:47:23','2021-07-21 20:47:23','2021-07-21 20:47:23','75c1d245-3495-45df-ad2d-43ba09f00e59'),(116,'craft','m181217_153000_fix_structure_uids','2021-07-21 20:47:23','2021-07-21 20:47:23','2021-07-21 20:47:23','e4201554-e528-4e5b-b5b0-311b2759c4aa'),(117,'craft','m190104_152725_store_licensed_plugin_editions','2021-07-21 20:47:23','2021-07-21 20:47:23','2021-07-21 20:47:23','5d1364d4-cd5b-420f-8b1d-74794d8a2b62'),(118,'craft','m190108_110000_cleanup_project_config','2021-07-21 20:47:23','2021-07-21 20:47:23','2021-07-21 20:47:23','89541120-aa96-46a3-a802-8f368577fd1c'),(119,'craft','m190108_113000_asset_field_setting_change','2021-07-21 20:47:23','2021-07-21 20:47:23','2021-07-21 20:47:23','558eef4e-327e-4820-bcf4-009d8fdfa0a8'),(120,'craft','m190109_172845_fix_colspan','2021-07-21 20:47:23','2021-07-21 20:47:23','2021-07-21 20:47:23','3bc1bd34-16be-41c5-ab9b-96972857a31d'),(121,'craft','m190110_150000_prune_nonexisting_sites','2021-07-21 20:47:23','2021-07-21 20:47:23','2021-07-21 20:47:23','accbb194-09f9-4b05-b243-dd4b272f8443'),(122,'craft','m190110_214819_soft_delete_volumes','2021-07-21 20:47:24','2021-07-21 20:47:24','2021-07-21 20:47:24','7efd7d3a-78ef-4e0d-bd99-758c4982b5fa'),(123,'craft','m190112_124737_fix_user_settings','2021-07-21 20:47:24','2021-07-21 20:47:24','2021-07-21 20:47:24','b61c57f4-a7c8-41c0-907e-a12e13d007a9'),(124,'craft','m190112_131225_fix_field_layouts','2021-07-21 20:47:24','2021-07-21 20:47:24','2021-07-21 20:47:24','302070dd-9019-47ba-861f-6364e71c2723'),(125,'craft','m190112_201010_more_soft_deletes','2021-07-21 20:47:24','2021-07-21 20:47:24','2021-07-21 20:47:24','c6a0835b-1e34-425b-a81f-8e232324fac1'),(126,'craft','m190114_143000_more_asset_field_setting_changes','2021-07-21 20:47:24','2021-07-21 20:47:24','2021-07-21 20:47:24','e1afc665-57d9-439d-b9fd-745353eec9bb'),(127,'craft','m190121_120000_rich_text_config_setting','2021-07-21 20:47:24','2021-07-21 20:47:24','2021-07-21 20:47:24','fa536780-6ab6-42dd-8439-058364176071'),(128,'craft','m190125_191628_fix_email_transport_password','2021-07-21 20:47:24','2021-07-21 20:47:24','2021-07-21 20:47:24','6e2ca452-8244-4c8a-941d-9102ea1385bf'),(129,'craft','m190128_181422_cleanup_volume_folders','2021-07-21 20:47:24','2021-07-21 20:47:24','2021-07-21 20:47:24','3d78d6d0-f54d-457a-b2b4-310ea505b18a'),(130,'craft','m190205_140000_fix_asset_soft_delete_index','2021-07-21 20:47:24','2021-07-21 20:47:24','2021-07-21 20:47:24','29baffc6-81e4-478a-a44c-7324d8e5185d'),(131,'craft','m190218_143000_element_index_settings_uid','2021-07-21 20:47:24','2021-07-21 20:47:24','2021-07-21 20:47:24','43f1d14e-f4a6-4969-bb07-0925c94d1963'),(132,'craft','m190312_152740_element_revisions','2021-07-21 20:47:24','2021-07-21 20:47:24','2021-07-21 20:47:24','9a83349b-455e-44a6-8514-f32a06b9db7e'),(133,'craft','m190327_235137_propagation_method','2021-07-21 20:47:24','2021-07-21 20:47:24','2021-07-21 20:47:24','efb736fd-7f67-4af9-9d67-32dabfbcdb52'),(134,'craft','m190401_223843_drop_old_indexes','2021-07-21 20:47:24','2021-07-21 20:47:24','2021-07-21 20:47:24','204da272-316f-44b3-b342-a097664cc97c'),(135,'craft','m190416_014525_drop_unique_global_indexes','2021-07-21 20:47:24','2021-07-21 20:47:24','2021-07-21 20:47:24','f84cc27c-d8b4-4bb1-9060-a5688d984704'),(136,'craft','m190417_085010_add_image_editor_permissions','2021-07-21 20:47:24','2021-07-21 20:47:24','2021-07-21 20:47:24','0e0d5328-681d-42df-8dbb-815149433d5c'),(137,'craft','m190502_122019_store_default_user_group_uid','2021-07-21 20:47:24','2021-07-21 20:47:24','2021-07-21 20:47:24','afe8072a-f0e9-463c-93b7-426dffcc7b81'),(138,'craft','m190504_150349_preview_targets','2021-07-21 20:47:24','2021-07-21 20:47:24','2021-07-21 20:47:24','115f6e02-c6e2-4f25-a918-b893827921e0'),(139,'craft','m190516_184711_job_progress_label','2021-07-21 20:47:24','2021-07-21 20:47:24','2021-07-21 20:47:24','844be7c3-407f-43b3-81f4-83063a29f985'),(140,'craft','m190523_190303_optional_revision_creators','2021-07-21 20:47:24','2021-07-21 20:47:24','2021-07-21 20:47:24','43cc9f3b-7d87-4a08-9459-3d21e9777aa9'),(141,'craft','m190529_204501_fix_duplicate_uids','2021-07-21 20:47:24','2021-07-21 20:47:24','2021-07-21 20:47:24','cfbafc94-b667-49b0-9402-efc430092d35'),(142,'craft','m190605_223807_unsaved_drafts','2021-07-21 20:47:24','2021-07-21 20:47:24','2021-07-21 20:47:24','a578c29f-d411-40fc-831f-cbf903b08824'),(143,'craft','m190607_230042_entry_revision_error_tables','2021-07-21 20:47:24','2021-07-21 20:47:24','2021-07-21 20:47:24','6acc9b2f-4901-4693-a6a7-aee82282ec4e'),(144,'craft','m190608_033429_drop_elements_uid_idx','2021-07-21 20:47:24','2021-07-21 20:47:24','2021-07-21 20:47:24','6a92fd79-593b-47b4-8acd-3983ef221859'),(145,'craft','m190617_164400_add_gqlschemas_table','2021-07-21 20:47:24','2021-07-21 20:47:24','2021-07-21 20:47:24','b20ce7d6-d172-491f-b174-1adccc19180e'),(146,'craft','m190624_234204_matrix_propagation_method','2021-07-21 20:47:24','2021-07-21 20:47:24','2021-07-21 20:47:24','80df2c5c-9a05-4463-b770-ee276d06cd25'),(147,'craft','m190711_153020_drop_snapshots','2021-07-21 20:47:24','2021-07-21 20:47:24','2021-07-21 20:47:24','4ce28ab8-9a4b-4106-8beb-9690ae75b389'),(148,'craft','m190712_195914_no_draft_revisions','2021-07-21 20:47:24','2021-07-21 20:47:24','2021-07-21 20:47:24','ebb9fb4b-7f59-4384-9752-fae47849ba8f'),(149,'craft','m190723_140314_fix_preview_targets_column','2021-07-21 20:47:24','2021-07-21 20:47:24','2021-07-21 20:47:24','83b84590-3df9-45f8-be4b-b1b5b1131604'),(150,'craft','m190820_003519_flush_compiled_templates','2021-07-21 20:47:24','2021-07-21 20:47:24','2021-07-21 20:47:24','366e9de9-1b2b-4247-bdef-56aecba59a64'),(151,'craft','m190823_020339_optional_draft_creators','2021-07-21 20:47:24','2021-07-21 20:47:24','2021-07-21 20:47:24','bca712ea-90fb-461b-bb19-b431bd52061f'),(152,'craft','m190913_152146_update_preview_targets','2021-07-21 20:47:24','2021-07-21 20:47:24','2021-07-21 20:47:24','89984cf8-f3a1-4ee8-ab2a-d99a5eceb3f1'),(153,'craft','m191107_122000_add_gql_project_config_support','2021-07-21 20:47:24','2021-07-21 20:47:24','2021-07-21 20:47:24','c00a9cc1-e2f5-46c4-a418-e49c4dd4c933'),(154,'craft','m191204_085100_pack_savable_component_settings','2021-07-21 20:47:24','2021-07-21 20:47:24','2021-07-21 20:47:24','045222fa-bcac-4bc8-b1d7-de5e2e3ce2bc'),(155,'craft','m191206_001148_change_tracking','2021-07-21 20:47:24','2021-07-21 20:47:24','2021-07-21 20:47:24','3ea415ed-9123-4ff9-a29e-59557756d2f3'),(156,'craft','m191216_191635_asset_upload_tracking','2021-07-21 20:47:24','2021-07-21 20:47:24','2021-07-21 20:47:24','37929b2e-7758-4d48-8aff-3cc7eb523690'),(157,'craft','m191222_002848_peer_asset_permissions','2021-07-21 20:47:24','2021-07-21 20:47:24','2021-07-21 20:47:24','852fa30b-e327-441f-b31c-bff92caec132'),(158,'craft','m200127_172522_queue_channels','2021-07-21 20:47:24','2021-07-21 20:47:24','2021-07-21 20:47:24','fe168bb8-d0cf-45c0-ad57-ea9bc078002f'),(159,'craft','m200211_175048_truncate_element_query_cache','2021-07-21 20:47:24','2021-07-21 20:47:24','2021-07-21 20:47:24','ce74c08c-182e-43da-9df6-9c42293ec04c'),(160,'craft','m200213_172522_new_elements_index','2021-07-21 20:47:24','2021-07-21 20:47:24','2021-07-21 20:47:24','0a8c8402-2a37-4391-9bfd-f8800b1a1f2f'),(161,'craft','m200228_195211_long_deprecation_messages','2021-07-21 20:47:24','2021-07-21 20:47:24','2021-07-21 20:47:24','6477345b-7179-4e18-8172-5cd19c683f86'),(162,'craft','m200306_054652_disabled_sites','2021-07-21 20:47:24','2021-07-21 20:47:24','2021-07-21 20:47:24','ba8d82c7-0cf4-465c-80b1-fb3c0214fa21'),(163,'craft','m200522_191453_clear_template_caches','2021-07-21 20:47:24','2021-07-21 20:47:24','2021-07-21 20:47:24','62ff06bb-b460-440a-b4b4-923e13e60406'),(164,'craft','m200606_231117_migration_tracks','2021-07-21 20:47:24','2021-07-21 20:47:24','2021-07-21 20:47:24','e05ff0f3-2112-409f-948b-1ab8ded905ff'),(165,'craft','m200619_215137_title_translation_method','2021-07-21 20:47:24','2021-07-21 20:47:24','2021-07-21 20:47:24','83f84d87-0a8b-4877-abab-61f593eeb708'),(166,'craft','m200620_005028_user_group_descriptions','2021-07-21 20:47:24','2021-07-21 20:47:24','2021-07-21 20:47:24','fd11cadf-6384-4391-b952-26519db06a3c'),(167,'craft','m200620_230205_field_layout_changes','2021-07-21 20:47:24','2021-07-21 20:47:24','2021-07-21 20:47:24','f8e125f5-6ab1-4533-b048-ce0f43c7eace'),(168,'craft','m200625_131100_move_entrytypes_to_top_project_config','2021-07-21 20:47:24','2021-07-21 20:47:24','2021-07-21 20:47:24','80a6ec8d-a0b4-4961-8653-5f5377838b44'),(169,'craft','m200629_112700_remove_project_config_legacy_files','2021-07-21 20:47:24','2021-07-21 20:47:24','2021-07-21 20:47:24','dcd71004-fa77-4aad-8280-ddc41b560069'),(170,'craft','m200630_183000_drop_configmap','2021-07-21 20:47:24','2021-07-21 20:47:24','2021-07-21 20:47:24','6d964f46-6752-4ba8-8174-c64e8da58eeb'),(171,'craft','m200715_113400_transform_index_error_flag','2021-07-21 20:47:24','2021-07-21 20:47:24','2021-07-21 20:47:24','5b112169-f15b-46c1-b052-085919c88220'),(172,'craft','m200716_110900_replace_file_asset_permissions','2021-07-21 20:47:24','2021-07-21 20:47:24','2021-07-21 20:47:24','667c7610-5fa5-43f5-93f0-3fe8e22fe90f'),(173,'craft','m200716_153800_public_token_settings_in_project_config','2021-07-21 20:47:24','2021-07-21 20:47:24','2021-07-21 20:47:24','49b9fbef-0290-4bd9-9ff7-8f2868f7848b'),(174,'craft','m200720_175543_drop_unique_constraints','2021-07-21 20:47:24','2021-07-21 20:47:24','2021-07-21 20:47:24','a6b195a6-0f33-43dc-b1ed-454bc6d8256c'),(175,'craft','m200825_051217_project_config_version','2021-07-21 20:47:24','2021-07-21 20:47:24','2021-07-21 20:47:24','1ef3dab1-3e48-4b0a-9dba-e63de070a8a8'),(176,'craft','m201116_190500_asset_title_translation_method','2021-07-21 20:47:24','2021-07-21 20:47:24','2021-07-21 20:47:24','86d74641-d658-4e0b-9e82-c0784f9a4a00'),(177,'craft','m201124_003555_plugin_trials','2021-07-21 20:47:24','2021-07-21 20:47:24','2021-07-21 20:47:24','58e24d68-0338-488e-a418-2018ea6e33ab'),(178,'craft','m210209_135503_soft_delete_field_groups','2021-07-21 20:47:24','2021-07-21 20:47:24','2021-07-21 20:47:24','ef56278a-541d-4e44-83bd-e3c32282addf'),(179,'craft','m210212_223539_delete_invalid_drafts','2021-07-21 20:47:24','2021-07-21 20:47:24','2021-07-21 20:47:24','251b1c71-31db-4d88-b537-cf52b99ca76f'),(180,'craft','m210214_202731_track_saved_drafts','2021-07-21 20:47:24','2021-07-21 20:47:24','2021-07-21 20:47:24','d0c5929d-05d5-4063-a916-f43807b3ed95'),(181,'craft','m210223_150900_add_new_element_gql_schema_components','2021-07-21 20:47:24','2021-07-21 20:47:24','2021-07-21 20:47:24','5fc65809-af9f-46c5-988d-63b583870939'),(182,'craft','m210302_212318_canonical_elements','2021-07-21 20:47:24','2021-07-21 20:47:24','2021-07-21 20:47:24','8105a0c9-116b-4f57-9669-c07b3b926ce0'),(183,'craft','m210326_132000_invalidate_projectconfig_cache','2021-07-21 20:47:24','2021-07-21 20:47:24','2021-07-21 20:47:24','ac0e2296-3195-49cb-a7e8-8d187429332b'),(184,'craft','m210329_214847_field_column_suffixes','2021-07-21 20:47:24','2021-07-21 20:47:24','2021-07-21 20:47:24','05914646-8f5a-4e51-93bf-bed87394103d'),(185,'craft','m210331_220322_null_author','2021-07-21 20:47:24','2021-07-21 20:47:24','2021-07-21 20:47:24','1d65cd2e-7287-4bef-be8e-2021f424cc3b'),(186,'craft','m210405_231315_provisional_drafts','2021-07-21 20:47:24','2021-07-21 20:47:24','2021-07-21 20:47:24','c6729cba-3b73-47ba-abf1-10ad5beebe8e'),(187,'craft','m210602_111300_project_config_names_in_config','2021-07-21 20:47:24','2021-07-21 20:47:24','2021-07-21 20:47:24','118b4068-e76d-4312-9df7-fcce46aae580'),(188,'craft','m210611_233510_default_placement_settings','2021-07-21 20:47:25','2021-07-21 20:47:25','2021-07-21 20:47:25','b53fc58a-37c6-469e-8a51-a841b6e9bb0d'),(189,'craft','m210613_145522_sortable_global_sets','2021-07-21 20:47:25','2021-07-21 20:47:25','2021-07-21 20:47:25','34bcd5d4-9b75-4307-821e-d44f7a3de5ac'),(190,'craft','m210613_184103_announcements','2021-07-21 20:47:25','2021-07-21 20:47:25','2021-07-21 20:47:25','3b3969d7-463b-4484-a1ff-8c34b03e4813'),(191,'plugin:aws-s3','Install','2021-07-21 23:05:12','2021-07-21 23:05:12','2021-07-21 23:05:12','cf180664-5754-47c3-a10c-492ced8da39b'),(192,'plugin:aws-s3','m180929_165000_remove_storageclass_setting','2021-07-21 23:05:12','2021-07-21 23:05:12','2021-07-21 23:05:12','04fe4916-5cec-44b3-91eb-03fea9b65ae1'),(193,'plugin:aws-s3','m190131_214300_cleanup_config','2021-07-21 23:05:12','2021-07-21 23:05:12','2021-07-21 23:05:12','37f330c4-f499-4ae7-a449-20ea72efab29'),(194,'plugin:aws-s3','m190305_133000_cleanup_expires_config','2021-07-21 23:05:12','2021-07-21 23:05:12','2021-07-21 23:05:12','7e64dda9-70ba-458a-9046-67533a056963'),(195,'plugin:redactor','m180430_204710_remove_old_plugins','2021-07-21 23:05:14','2021-07-21 23:05:14','2021-07-21 23:05:14','bd251c6a-fb67-4689-a1a5-e4b7f7207783'),(196,'plugin:redactor','Install','2021-07-21 23:05:14','2021-07-21 23:05:14','2021-07-21 23:05:14','f48cb23f-ec4d-4cdc-88f4-128f6295f722'),(197,'plugin:redactor','m190225_003922_split_cleanup_html_settings','2021-07-21 23:05:14','2021-07-21 23:05:14','2021-07-21 23:05:14','bcfeae82-8d0a-4a45-86ab-2bcbf52418ec');
/*!40000 ALTER TABLE `craft_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craft_plugins`
--

DROP TABLE IF EXISTS `craft_plugins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_plugins` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `handle` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `version` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `schemaVersion` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `licenseKeyStatus` enum('valid','trial','invalid','mismatched','astray','unknown') COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'unknown',
  `licensedEdition` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `installDate` datetime NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_idx_whqymrpcukuuhctvlqsrakpsdaithlpuuusu` (`handle`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_plugins`
--

LOCK TABLES `craft_plugins` WRITE;
/*!40000 ALTER TABLE `craft_plugins` DISABLE KEYS */;
INSERT INTO `craft_plugins` VALUES (1,'aws-s3','1.2.12','1.2','unknown',NULL,'2021-07-21 23:05:12','2021-07-21 23:05:12','2021-07-21 23:05:24','c1f59dab-3b7c-4792-9ed9-be2b91a6f289'),(2,'redactor','2.8.7','2.3.0','unknown',NULL,'2021-07-21 23:05:14','2021-07-21 23:05:14','2021-07-21 23:05:24','25996753-1adc-4e01-aa40-85dd9733ff93');
/*!40000 ALTER TABLE `craft_plugins` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craft_projectconfig`
--

DROP TABLE IF EXISTS `craft_projectconfig`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_projectconfig` (
  `path` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb3_unicode_ci NOT NULL,
  PRIMARY KEY (`path`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_projectconfig`
--

LOCK TABLES `craft_projectconfig` WRITE;
/*!40000 ALTER TABLE `craft_projectconfig` DISABLE KEYS */;
INSERT INTO `craft_projectconfig` VALUES ('dateModified','1626908714'),('email.fromEmail','\"maximemasson2@hotmail.com\"'),('email.fromName','\"Craft node app\"'),('email.transportType','\"craft\\\\mail\\\\transportadapters\\\\Sendmail\"'),('fieldGroups.342015e1-54e2-41cb-8dda-08558be0fb30.name','\"Common\"'),('meta.__names__.342015e1-54e2-41cb-8dda-08558be0fb30','\"Common\"'),('meta.__names__.9311f960-4e69-44b2-aa64-2fedfe0abad2','\"Craft node app\"'),('meta.__names__.df674e07-1dac-4435-abe4-85d1ceab6d7b','\"Craft node app\"'),('plugins.aws-s3.edition','\"standard\"'),('plugins.aws-s3.enabled','true'),('plugins.aws-s3.schemaVersion','\"1.2\"'),('plugins.redactor.edition','\"standard\"'),('plugins.redactor.enabled','true'),('plugins.redactor.schemaVersion','\"2.3.0\"'),('siteGroups.df674e07-1dac-4435-abe4-85d1ceab6d7b.name','\"Craft node app\"'),('sites.9311f960-4e69-44b2-aa64-2fedfe0abad2.baseUrl','\"$PRIMARY_SITE_URL\"'),('sites.9311f960-4e69-44b2-aa64-2fedfe0abad2.enabled','true'),('sites.9311f960-4e69-44b2-aa64-2fedfe0abad2.handle','\"default\"'),('sites.9311f960-4e69-44b2-aa64-2fedfe0abad2.hasUrls','true'),('sites.9311f960-4e69-44b2-aa64-2fedfe0abad2.language','\"en-US\"'),('sites.9311f960-4e69-44b2-aa64-2fedfe0abad2.name','\"Craft node app\"'),('sites.9311f960-4e69-44b2-aa64-2fedfe0abad2.primary','true'),('sites.9311f960-4e69-44b2-aa64-2fedfe0abad2.siteGroup','\"df674e07-1dac-4435-abe4-85d1ceab6d7b\"'),('sites.9311f960-4e69-44b2-aa64-2fedfe0abad2.sortOrder','1'),('system.edition','\"solo\"'),('system.live','true'),('system.name','\"Craft node app\"'),('system.schemaVersion','\"3.7.7\"'),('system.timeZone','\"America/Los_Angeles\"'),('users.allowPublicRegistration','false'),('users.defaultGroup','null'),('users.photoSubpath','null'),('users.photoVolumeUid','null'),('users.requireEmailVerification','true');
/*!40000 ALTER TABLE `craft_projectconfig` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craft_queue`
--

DROP TABLE IF EXISTS `craft_queue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_queue` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `channel` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'queue',
  `job` longblob NOT NULL,
  `description` text COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `timePushed` int(11) NOT NULL,
  `ttr` int(11) NOT NULL,
  `delay` int(11) NOT NULL DEFAULT 0,
  `priority` int(11) unsigned NOT NULL DEFAULT 1024,
  `dateReserved` datetime DEFAULT NULL,
  `timeUpdated` int(11) DEFAULT NULL,
  `progress` smallint(6) NOT NULL DEFAULT 0,
  `progressLabel` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `attempt` int(11) DEFAULT NULL,
  `fail` tinyint(1) DEFAULT 0,
  `dateFailed` datetime DEFAULT NULL,
  `error` text COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `craft_idx_xylgjoxttlvftmgubloqnzlkdzjeieomxwdj` (`channel`,`fail`,`timeUpdated`,`timePushed`),
  KEY `craft_idx_gxchbynxdnyxtrfykescjkbfiwyrqhscbjzo` (`channel`,`fail`,`timeUpdated`,`delay`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_queue`
--

LOCK TABLES `craft_queue` WRITE;
/*!40000 ALTER TABLE `craft_queue` DISABLE KEYS */;
/*!40000 ALTER TABLE `craft_queue` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craft_relations`
--

DROP TABLE IF EXISTS `craft_relations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_relations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fieldId` int(11) NOT NULL,
  `sourceId` int(11) NOT NULL,
  `sourceSiteId` int(11) DEFAULT NULL,
  `targetId` int(11) NOT NULL,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_idx_klwpvoblyytamwuijuxhepvteouxdlmyqdzd` (`fieldId`,`sourceId`,`sourceSiteId`,`targetId`),
  KEY `craft_idx_zcppewawrrlmkcwosmbuqavxaaacpkaausyd` (`sourceId`),
  KEY `craft_idx_hematovtwmkomyjdttxygumhokzueqdsfkmv` (`targetId`),
  KEY `craft_idx_lqxnzppbasbnxxtpnetfrplxgkquopuqioki` (`sourceSiteId`),
  CONSTRAINT `craft_fk_ekbyabtjkpnuzadguaaorozegbmjvtdyyjsx` FOREIGN KEY (`fieldId`) REFERENCES `craft_fields` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_fk_ngpxgmqkfidgdbdvauosnfpacifuvjuretgn` FOREIGN KEY (`sourceId`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_fk_wkgplqnjkhbanlezranzmsthpxqveyfbjuxj` FOREIGN KEY (`targetId`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_fk_zluemhtqqvlttjffazvdexddcsncwwoaopdb` FOREIGN KEY (`sourceSiteId`) REFERENCES `craft_sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_relations`
--

LOCK TABLES `craft_relations` WRITE;
/*!40000 ALTER TABLE `craft_relations` DISABLE KEYS */;
/*!40000 ALTER TABLE `craft_relations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craft_resourcepaths`
--

DROP TABLE IF EXISTS `craft_resourcepaths`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_resourcepaths` (
  `hash` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `path` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  PRIMARY KEY (`hash`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_resourcepaths`
--

LOCK TABLES `craft_resourcepaths` WRITE;
/*!40000 ALTER TABLE `craft_resourcepaths` DISABLE KEYS */;
INSERT INTO `craft_resourcepaths` VALUES ('1213eaec','@app/web/assets/updateswidget/dist'),('14f79881','@craft/web/assets/plugins/dist'),('1c81462d','@app/web/assets/craftsupport/dist'),('2ca9a882','@app/web/assets/recententries/dist'),('2d75ca0c','@lib/vue'),('31e48f0f','@app/web/assets/cp/dist'),('36465e3a','@craft/web/assets/craftsupport/dist'),('44e0b295','@lib/velocity'),('48ffc4b1','@app/web/assets/feed/dist'),('49c11ae3','@craft/web/assets/updates/dist'),('556f45e8','@bower/jquery/dist'),('58c71d7d','@lib/jquery.payment'),('701045b5','@craft/web/assets/dashboard/dist'),('7affee1d','@lib/element-resize-detector'),('82ef41df','@craft/web/assets/pluginstore/dist'),('87d71061','@lib/xregexp'),('8b9471a2','@craft/web/assets/cp/dist'),('8dbb54eb','@lib/selectize'),('91eaa833','@craft/web/assets/updateswidget/dist'),('9418f3f7','@lib/datepicker-i18n'),('94aa306','@craft/web/assets/clearcaches/dist'),('953637e','@craft/web/assets/feed/dist'),('9e6979','@lib/axios'),('a492930','@lib/jquery-ui'),('af50ea5d','@craft/web/assets/recententries/dist'),('b0228c50','@app/web/assets/plugins/dist'),('c12d7891','@lib/fileupload'),('cd8e4786','@lib/iframe-resizer'),('d1664968','@craft/web/assets/utilities/dist'),('d760593e','@lib/d3'),('d9c5796f','@lib/picturefill'),('de6145ad','@lib/jquery-touch-events'),('e4dd4eb8','@lib/garnishjs'),('f19b9a86','@lib/fabric'),('f2e9c143','@app/web/assets/dashboard/dist'),('f870abbe','@craft/web/assets/admintable/dist');
/*!40000 ALTER TABLE `craft_resourcepaths` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craft_revisions`
--

DROP TABLE IF EXISTS `craft_revisions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_revisions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sourceId` int(11) NOT NULL,
  `creatorId` int(11) DEFAULT NULL,
  `num` int(11) NOT NULL,
  `notes` text COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_idx_wohocilseqrhytwnyxnqynyqrxetlnvavdeu` (`sourceId`,`num`),
  KEY `craft_fk_ykhnnpierzdfufwbedlmijmbklfetvghvtxk` (`creatorId`),
  CONSTRAINT `craft_fk_ragsenhhnbdzolvtobuehlsksmjjxtpneexh` FOREIGN KEY (`sourceId`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_fk_ykhnnpierzdfufwbedlmijmbklfetvghvtxk` FOREIGN KEY (`creatorId`) REFERENCES `craft_users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_revisions`
--

LOCK TABLES `craft_revisions` WRITE;
/*!40000 ALTER TABLE `craft_revisions` DISABLE KEYS */;
/*!40000 ALTER TABLE `craft_revisions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craft_searchindex`
--

DROP TABLE IF EXISTS `craft_searchindex`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_searchindex` (
  `elementId` int(11) NOT NULL,
  `attribute` varchar(25) COLLATE utf8mb3_unicode_ci NOT NULL,
  `fieldId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `keywords` text COLLATE utf8mb3_unicode_ci NOT NULL,
  PRIMARY KEY (`elementId`,`attribute`,`fieldId`,`siteId`),
  FULLTEXT KEY `craft_idx_xclguilubrfgzllfuojnjyydpvaxxspkqacp` (`keywords`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_searchindex`
--

LOCK TABLES `craft_searchindex` WRITE;
/*!40000 ALTER TABLE `craft_searchindex` DISABLE KEYS */;
INSERT INTO `craft_searchindex` VALUES (1,'username',0,1,' admin '),(1,'firstname',0,1,''),(1,'lastname',0,1,''),(1,'fullname',0,1,''),(1,'email',0,1,' maximemasson2 hotmail com '),(1,'slug',0,1,'');
/*!40000 ALTER TABLE `craft_searchindex` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craft_sections`
--

DROP TABLE IF EXISTS `craft_sections`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_sections` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `structureId` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `type` enum('single','channel','structure') COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'channel',
  `enableVersioning` tinyint(1) NOT NULL DEFAULT 0,
  `propagationMethod` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'all',
  `defaultPlacement` enum('beginning','end') COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'end',
  `previewTargets` text COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `craft_idx_swztekgstwsvzbscivbxwmdqgnvarrvybkeh` (`handle`),
  KEY `craft_idx_evnpkqbktcclwlaydmuuklkganuyempbyofx` (`name`),
  KEY `craft_idx_qkcbzjarlnlgfictuebnkqqqcaiellnlxrwr` (`structureId`),
  KEY `craft_idx_pjtljewtpfnjjwwuixjqewydxscvigofydcf` (`dateDeleted`),
  CONSTRAINT `craft_fk_lklamdelniroygmsuwlkmqawfhrgxskdkddy` FOREIGN KEY (`structureId`) REFERENCES `craft_structures` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_sections`
--

LOCK TABLES `craft_sections` WRITE;
/*!40000 ALTER TABLE `craft_sections` DISABLE KEYS */;
/*!40000 ALTER TABLE `craft_sections` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craft_sections_sites`
--

DROP TABLE IF EXISTS `craft_sections_sites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_sections_sites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sectionId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `hasUrls` tinyint(1) NOT NULL DEFAULT 1,
  `uriFormat` text COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `template` varchar(500) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `enabledByDefault` tinyint(1) NOT NULL DEFAULT 1,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_idx_gkskfedzyqfatbbficwacwutlcwarsggkuox` (`sectionId`,`siteId`),
  KEY `craft_idx_yaqdijvargrjoeircswtscnbcwyphltqbgsk` (`siteId`),
  CONSTRAINT `craft_fk_exvksjwwgoqjxxmcbehtjsvenjdupfybslbf` FOREIGN KEY (`sectionId`) REFERENCES `craft_sections` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_fk_xwghmvrvynzrgyvpgojerxmhdsbqageuuotq` FOREIGN KEY (`siteId`) REFERENCES `craft_sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_sections_sites`
--

LOCK TABLES `craft_sections_sites` WRITE;
/*!40000 ALTER TABLE `craft_sections_sites` DISABLE KEYS */;
/*!40000 ALTER TABLE `craft_sections_sites` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craft_sequences`
--

DROP TABLE IF EXISTS `craft_sequences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_sequences` (
  `name` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `next` int(11) unsigned NOT NULL DEFAULT 1,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_sequences`
--

LOCK TABLES `craft_sequences` WRITE;
/*!40000 ALTER TABLE `craft_sequences` DISABLE KEYS */;
/*!40000 ALTER TABLE `craft_sequences` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craft_sessions`
--

DROP TABLE IF EXISTS `craft_sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_sessions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `token` char(100) COLLATE utf8mb3_unicode_ci NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `craft_idx_nujoicwndqhtdijtghlvqobbxbnmtwcqortp` (`uid`),
  KEY `craft_idx_lduufgelhkfdcrwvnhmfdeutejpmrofulwke` (`token`),
  KEY `craft_idx_rnahylytwdyrotdrtcjwexppkynlvrpbhawn` (`dateUpdated`),
  KEY `craft_idx_gemktubmheriohctgbymbcytujsjjmpfnsme` (`userId`),
  CONSTRAINT `craft_fk_eqadbolrqpmybrftdenkadyenarbrmesjwfz` FOREIGN KEY (`userId`) REFERENCES `craft_users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_sessions`
--

LOCK TABLES `craft_sessions` WRITE;
/*!40000 ALTER TABLE `craft_sessions` DISABLE KEYS */;
INSERT INTO `craft_sessions` VALUES (1,1,'C9pB5FdweuQlsb9invzko7pg9O0ALuON8EBnH491hC3zMWH-Mk-Hw_VD1nRC4h4zXQRfk7OPKKkNvci8Ndhs9oLe02xEF2LAu6Nu','2021-07-21 20:47:22','2021-07-21 21:45:40','47219849-d888-4454-aa17-e82010f9b524'),(2,1,'hMPhXJH3L_pek1OLM83SbzuTF95JcY10sWapRxdUSjyivpNXgbf-8ZmSVVTXLXYmvVhL6NKeTGTNYb_1fCJgmoEvnt3zeWo2SIaE','2021-07-21 21:08:24','2021-07-21 21:45:14','8375ba59-7dde-4811-a29e-bef02afef701'),(3,1,'TBRKIYaERiGUz-xIv2UYP5QwobVP3MP2MMvoej6AnwIX87uq8pSSv3fUNwxzexRNSOszxAAk63v9TBEGAnttAn7CJheq96Oo5RpB','2021-07-21 21:45:40','2021-07-21 22:41:35','f6ac5226-eb84-4a72-a56b-724c8802ff93'),(4,1,'xmd7BHI2T0HQxf1RmxlrMkB2b2iqJHaRDKBFvZt3JkLnjNMgVGPlgj2J_9WyjaW2WEwT0s-G03LRRfiCDhmvDgidazfHLbjk6LdX','2021-07-21 22:13:07','2021-07-21 22:13:07','fba3d7f7-1245-4713-84f3-874e775a80f9'),(5,1,'0Sutc9fJyZkfMnt932NjJp4gVpdrNCiyq6cbprXHjlVCNs3FCcQOjx0opc52vKRptd1OveFr3_19UNZQ69X-WOpz8uiqiDUCBaIc','2021-07-21 22:39:33','2021-07-21 22:39:33','45f35284-d50e-4ce6-9de6-636668fc6166'),(6,1,'UniiLa5Auprs7OtPrWGzx9vs7DGb3CbizMjVtu7DkPp9BIz2JXFqq0Izs4lqLiCD8_Q9GpwwrSubpLpRgOZ1P2fjvn7XrF4281Kr','2021-07-21 22:41:35','2021-07-21 23:09:44','f0351ec3-ee35-4da8-81b8-8b0cdd95f526');
/*!40000 ALTER TABLE `craft_sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craft_shunnedmessages`
--

DROP TABLE IF EXISTS `craft_shunnedmessages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_shunnedmessages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `message` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `expiryDate` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_idx_qczofwuvzhpphmwfsntrokilmmqllvlyvnme` (`userId`,`message`),
  CONSTRAINT `craft_fk_tcsyejenuqccngudplmyhbkwviliadpdghzo` FOREIGN KEY (`userId`) REFERENCES `craft_users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_shunnedmessages`
--

LOCK TABLES `craft_shunnedmessages` WRITE;
/*!40000 ALTER TABLE `craft_shunnedmessages` DISABLE KEYS */;
/*!40000 ALTER TABLE `craft_shunnedmessages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craft_sitegroups`
--

DROP TABLE IF EXISTS `craft_sitegroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_sitegroups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `craft_idx_aygppnhdebrczmmgctnowhhvoxfzkwfexazm` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_sitegroups`
--

LOCK TABLES `craft_sitegroups` WRITE;
/*!40000 ALTER TABLE `craft_sitegroups` DISABLE KEYS */;
INSERT INTO `craft_sitegroups` VALUES (1,'Craft node app','2021-07-21 20:47:21','2021-07-21 20:47:21',NULL,'df674e07-1dac-4435-abe4-85d1ceab6d7b');
/*!40000 ALTER TABLE `craft_sitegroups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craft_sites`
--

DROP TABLE IF EXISTS `craft_sites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_sites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `groupId` int(11) NOT NULL,
  `primary` tinyint(1) NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT 1,
  `name` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `language` varchar(12) COLLATE utf8mb3_unicode_ci NOT NULL,
  `hasUrls` tinyint(1) NOT NULL DEFAULT 0,
  `baseUrl` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `craft_idx_abdhfrblwwdyxpoomjbijfbitirdirjpossj` (`dateDeleted`),
  KEY `craft_idx_mkkkowjqfimlxpctmzqohyllfipziqmbxxpf` (`handle`),
  KEY `craft_idx_ffxatgyullsdgffsyviyydmdstpifgqfknps` (`sortOrder`),
  KEY `craft_fk_bpkirlvvimguxegmcovszrprrtdcjfmwivti` (`groupId`),
  CONSTRAINT `craft_fk_bpkirlvvimguxegmcovszrprrtdcjfmwivti` FOREIGN KEY (`groupId`) REFERENCES `craft_sitegroups` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_sites`
--

LOCK TABLES `craft_sites` WRITE;
/*!40000 ALTER TABLE `craft_sites` DISABLE KEYS */;
INSERT INTO `craft_sites` VALUES (1,1,1,1,'Craft node app','default','en-US',1,'$PRIMARY_SITE_URL',1,'2021-07-21 20:47:21','2021-07-21 20:47:21',NULL,'9311f960-4e69-44b2-aa64-2fedfe0abad2');
/*!40000 ALTER TABLE `craft_sites` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craft_structureelements`
--

DROP TABLE IF EXISTS `craft_structureelements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_structureelements` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `structureId` int(11) NOT NULL,
  `elementId` int(11) DEFAULT NULL,
  `root` int(11) unsigned DEFAULT NULL,
  `lft` int(11) unsigned NOT NULL,
  `rgt` int(11) unsigned NOT NULL,
  `level` smallint(6) unsigned NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_idx_sjpmvhmvgqjrwmpfghitqjaqneatjkvdrebf` (`structureId`,`elementId`),
  KEY `craft_idx_sulhjpnspgqdeonbcjwsefoxvopcnydrzmvq` (`root`),
  KEY `craft_idx_engiipptxqpvcnrnjovnvcqgmhepnqmeudxy` (`lft`),
  KEY `craft_idx_mbqntalvrqmzqafnviaklfihjqqsbrgnqqxc` (`rgt`),
  KEY `craft_idx_biqspkiekofinxfyfjgekhcldewdypvlqvlf` (`level`),
  KEY `craft_idx_kepseifbglsdhbhybqiofxpcikbpherkerjg` (`elementId`),
  CONSTRAINT `craft_fk_hxtahgziisurtrhddbnjrwewuncvqpllmtcy` FOREIGN KEY (`elementId`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_fk_pxxrkhcvuvigxalronydywhrjdkcmqrctsic` FOREIGN KEY (`structureId`) REFERENCES `craft_structures` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_structureelements`
--

LOCK TABLES `craft_structureelements` WRITE;
/*!40000 ALTER TABLE `craft_structureelements` DISABLE KEYS */;
/*!40000 ALTER TABLE `craft_structureelements` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craft_structures`
--

DROP TABLE IF EXISTS `craft_structures`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_structures` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `maxLevels` smallint(6) unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `craft_idx_mjqpaanavhjgzelomghzwsmowounaroucxhd` (`dateDeleted`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_structures`
--

LOCK TABLES `craft_structures` WRITE;
/*!40000 ALTER TABLE `craft_structures` DISABLE KEYS */;
/*!40000 ALTER TABLE `craft_structures` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craft_systemmessages`
--

DROP TABLE IF EXISTS `craft_systemmessages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_systemmessages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `language` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `key` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `subject` text COLLATE utf8mb3_unicode_ci NOT NULL,
  `body` text COLLATE utf8mb3_unicode_ci NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_idx_bzwgnedbnheqcioroeskbuzqrytxvxhiyoqk` (`key`,`language`),
  KEY `craft_idx_khdozdnlgsglhstnyzfayhthpbkxgxkwmehs` (`language`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_systemmessages`
--

LOCK TABLES `craft_systemmessages` WRITE;
/*!40000 ALTER TABLE `craft_systemmessages` DISABLE KEYS */;
/*!40000 ALTER TABLE `craft_systemmessages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craft_taggroups`
--

DROP TABLE IF EXISTS `craft_taggroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_taggroups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `craft_idx_xdvkmezczvtptzxaucpbxuqnixhsozkqzvxa` (`name`),
  KEY `craft_idx_rgqyxheadivnrnbaqmverzkongkphremycwm` (`handle`),
  KEY `craft_idx_jevxxibajrkvzzicnlopmlbcjpqcwwoildbp` (`dateDeleted`),
  KEY `craft_fk_hajuhfwtgsyrfttlyvjomihtkidazxcbvoie` (`fieldLayoutId`),
  CONSTRAINT `craft_fk_hajuhfwtgsyrfttlyvjomihtkidazxcbvoie` FOREIGN KEY (`fieldLayoutId`) REFERENCES `craft_fieldlayouts` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_taggroups`
--

LOCK TABLES `craft_taggroups` WRITE;
/*!40000 ALTER TABLE `craft_taggroups` DISABLE KEYS */;
/*!40000 ALTER TABLE `craft_taggroups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craft_tags`
--

DROP TABLE IF EXISTS `craft_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_tags` (
  `id` int(11) NOT NULL,
  `groupId` int(11) NOT NULL,
  `deletedWithGroup` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `craft_idx_mbruluthdthupuempbvketydqpodvnydbtfe` (`groupId`),
  CONSTRAINT `craft_fk_towkvomkskcpoaquzkxlzsbafmvbkouuqnif` FOREIGN KEY (`id`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_fk_viowuueaqkbhcdwbwhhqhddpgabttfysoccd` FOREIGN KEY (`groupId`) REFERENCES `craft_taggroups` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_tags`
--

LOCK TABLES `craft_tags` WRITE;
/*!40000 ALTER TABLE `craft_tags` DISABLE KEYS */;
/*!40000 ALTER TABLE `craft_tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craft_templatecacheelements`
--

DROP TABLE IF EXISTS `craft_templatecacheelements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_templatecacheelements` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cacheId` int(11) NOT NULL,
  `elementId` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `craft_idx_vgqwhournhdhijnykbcqggkmnmauwtcjuskk` (`cacheId`),
  KEY `craft_idx_wvukeizvknvnrlohevgyozlzemipnkqlnlkb` (`elementId`),
  CONSTRAINT `craft_fk_ezkofetfdgevqkhqzozuxkeukbisyauxviyw` FOREIGN KEY (`cacheId`) REFERENCES `craft_templatecaches` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_fk_pnyryueygvirtkrxsnkoutkehlpvtpkijrbi` FOREIGN KEY (`elementId`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_templatecacheelements`
--

LOCK TABLES `craft_templatecacheelements` WRITE;
/*!40000 ALTER TABLE `craft_templatecacheelements` DISABLE KEYS */;
/*!40000 ALTER TABLE `craft_templatecacheelements` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craft_templatecachequeries`
--

DROP TABLE IF EXISTS `craft_templatecachequeries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_templatecachequeries` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cacheId` int(11) NOT NULL,
  `type` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `query` longtext COLLATE utf8mb3_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `craft_idx_zqnmpyktklhogdpknvvqucccugxehwikymzz` (`cacheId`),
  KEY `craft_idx_sntnxlvhkjriqlaqjdhgfmauzxguqiingsrv` (`type`),
  CONSTRAINT `craft_fk_mauadixhmbtajwouicxdflicxfizbixkyaxe` FOREIGN KEY (`cacheId`) REFERENCES `craft_templatecaches` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_templatecachequeries`
--

LOCK TABLES `craft_templatecachequeries` WRITE;
/*!40000 ALTER TABLE `craft_templatecachequeries` DISABLE KEYS */;
/*!40000 ALTER TABLE `craft_templatecachequeries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craft_templatecaches`
--

DROP TABLE IF EXISTS `craft_templatecaches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_templatecaches` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `siteId` int(11) NOT NULL,
  `cacheKey` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `path` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `expiryDate` datetime NOT NULL,
  `body` mediumtext COLLATE utf8mb3_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `craft_idx_tejyzvohctlaqqtecoggdtlldvwblcqzziab` (`cacheKey`,`siteId`,`expiryDate`,`path`),
  KEY `craft_idx_jnohabdvvsbrkubmwtzpbowbbaklwiqtsgzr` (`cacheKey`,`siteId`,`expiryDate`),
  KEY `craft_idx_tmpglfvxiyxgkclebhjahgblxsmtgsdyrigf` (`siteId`),
  CONSTRAINT `craft_fk_khwrfbgnvvbbhiaxxcytijnxnhdohhoglpmi` FOREIGN KEY (`siteId`) REFERENCES `craft_sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_templatecaches`
--

LOCK TABLES `craft_templatecaches` WRITE;
/*!40000 ALTER TABLE `craft_templatecaches` DISABLE KEYS */;
/*!40000 ALTER TABLE `craft_templatecaches` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craft_tokens`
--

DROP TABLE IF EXISTS `craft_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_tokens` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `token` char(32) COLLATE utf8mb3_unicode_ci NOT NULL,
  `route` text COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `usageLimit` tinyint(3) unsigned DEFAULT NULL,
  `usageCount` tinyint(3) unsigned DEFAULT NULL,
  `expiryDate` datetime NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_idx_sgsaidvrmjuvmzulvwnegowjcqdsrdzrmgaf` (`token`),
  KEY `craft_idx_iplwzwnbmyucibapukikuhcjjstzsexwvoqj` (`expiryDate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_tokens`
--

LOCK TABLES `craft_tokens` WRITE;
/*!40000 ALTER TABLE `craft_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `craft_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craft_usergroups`
--

DROP TABLE IF EXISTS `craft_usergroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_usergroups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `craft_idx_ccnohcnhabdkpgifspfsnqedxgawnslujcqa` (`handle`),
  KEY `craft_idx_cyjpmlcirprohwgvdtzytbmgcfsxvdoyjpne` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_usergroups`
--

LOCK TABLES `craft_usergroups` WRITE;
/*!40000 ALTER TABLE `craft_usergroups` DISABLE KEYS */;
/*!40000 ALTER TABLE `craft_usergroups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craft_usergroups_users`
--

DROP TABLE IF EXISTS `craft_usergroups_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_usergroups_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `groupId` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_idx_snlprzngfwvsnqznwuwmatxhkiapfmnawbqx` (`groupId`,`userId`),
  KEY `craft_idx_ijinqleqxbcwioguudrvbfjtjkuyfxykvppj` (`userId`),
  CONSTRAINT `craft_fk_jjenvlwhmhbxkbpjelqmcwlnmawatgrjsvzx` FOREIGN KEY (`userId`) REFERENCES `craft_users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_fk_ulqpjsfzimgbnifsmxcfamlgvbbkgcnxlldw` FOREIGN KEY (`groupId`) REFERENCES `craft_usergroups` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_usergroups_users`
--

LOCK TABLES `craft_usergroups_users` WRITE;
/*!40000 ALTER TABLE `craft_usergroups_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `craft_usergroups_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craft_userpermissions`
--

DROP TABLE IF EXISTS `craft_userpermissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_userpermissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_idx_yjetfyordsbnuulixvacamjlcelcrfzieers` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_userpermissions`
--

LOCK TABLES `craft_userpermissions` WRITE;
/*!40000 ALTER TABLE `craft_userpermissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `craft_userpermissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craft_userpermissions_usergroups`
--

DROP TABLE IF EXISTS `craft_userpermissions_usergroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_userpermissions_usergroups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `permissionId` int(11) NOT NULL,
  `groupId` int(11) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_idx_ykbeqzkkyzfbrguoyigfbplxowldrjmsudbj` (`permissionId`,`groupId`),
  KEY `craft_idx_lijlhzqyzuejftyhsljmptfwnqpntclehrlg` (`groupId`),
  CONSTRAINT `craft_fk_clnwrjiyvzqnrnukhllhrtyespoxcwakcahg` FOREIGN KEY (`groupId`) REFERENCES `craft_usergroups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_fk_dybdcnzygalpvxnxjmvgmdlrwcfgtxkhwrdj` FOREIGN KEY (`permissionId`) REFERENCES `craft_userpermissions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_userpermissions_usergroups`
--

LOCK TABLES `craft_userpermissions_usergroups` WRITE;
/*!40000 ALTER TABLE `craft_userpermissions_usergroups` DISABLE KEYS */;
/*!40000 ALTER TABLE `craft_userpermissions_usergroups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craft_userpermissions_users`
--

DROP TABLE IF EXISTS `craft_userpermissions_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_userpermissions_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `permissionId` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_idx_nfvppzffmlbdkywhsouzocbzkaqbcfemtgux` (`permissionId`,`userId`),
  KEY `craft_idx_iobmtjoxuisexrgmnztrqvynqwmlnsoybfkj` (`userId`),
  CONSTRAINT `craft_fk_moogmxkojuymgztkmzwzmfmmxdpwhhylcemk` FOREIGN KEY (`permissionId`) REFERENCES `craft_userpermissions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_fk_xhaojtrcgxzuzukgrqfbtmxhkzsdsegfvjwc` FOREIGN KEY (`userId`) REFERENCES `craft_users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_userpermissions_users`
--

LOCK TABLES `craft_userpermissions_users` WRITE;
/*!40000 ALTER TABLE `craft_userpermissions_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `craft_userpermissions_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craft_userpreferences`
--

DROP TABLE IF EXISTS `craft_userpreferences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_userpreferences` (
  `userId` int(11) NOT NULL AUTO_INCREMENT,
  `preferences` text COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`userId`),
  CONSTRAINT `craft_fk_xuepvdywnjfyiizycdaemdilkliettyyadyb` FOREIGN KEY (`userId`) REFERENCES `craft_users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_userpreferences`
--

LOCK TABLES `craft_userpreferences` WRITE;
/*!40000 ALTER TABLE `craft_userpreferences` DISABLE KEYS */;
INSERT INTO `craft_userpreferences` VALUES (1,'{\"language\":\"en-US\"}');
/*!40000 ALTER TABLE `craft_userpreferences` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craft_users`
--

DROP TABLE IF EXISTS `craft_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_users` (
  `id` int(11) NOT NULL,
  `username` varchar(100) COLLATE utf8mb3_unicode_ci NOT NULL,
  `photoId` int(11) DEFAULT NULL,
  `firstName` varchar(100) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `lastName` varchar(100) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `admin` tinyint(1) NOT NULL DEFAULT 0,
  `locked` tinyint(1) NOT NULL DEFAULT 0,
  `suspended` tinyint(1) NOT NULL DEFAULT 0,
  `pending` tinyint(1) NOT NULL DEFAULT 0,
  `lastLoginDate` datetime DEFAULT NULL,
  `lastLoginAttemptIp` varchar(45) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `invalidLoginWindowStart` datetime DEFAULT NULL,
  `invalidLoginCount` tinyint(3) unsigned DEFAULT NULL,
  `lastInvalidLoginDate` datetime DEFAULT NULL,
  `lockoutDate` datetime DEFAULT NULL,
  `hasDashboard` tinyint(1) NOT NULL DEFAULT 0,
  `verificationCode` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `verificationCodeIssuedDate` datetime DEFAULT NULL,
  `unverifiedEmail` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `passwordResetRequired` tinyint(1) NOT NULL DEFAULT 0,
  `lastPasswordChangeDate` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `craft_idx_buwfjgxmdjaidjuhotmilkoxeuisyjyyjonb` (`uid`),
  KEY `craft_idx_feckyxpymspzqopktqcvnrtguookxcurvmnx` (`verificationCode`),
  KEY `craft_idx_mzhyojffkammoaczzpzmejujrwuzhygpwaja` (`email`),
  KEY `craft_idx_bjprhkwzwvslxuzgyryqcketqybwxdcjorfr` (`username`),
  KEY `craft_fk_vbwzazdzkheqajaurvvyrgmypgfwibbxsezm` (`photoId`),
  CONSTRAINT `craft_fk_habjzmsebdegnexsqtoucbiyizptajopvbce` FOREIGN KEY (`id`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_fk_vbwzazdzkheqajaurvvyrgmypgfwibbxsezm` FOREIGN KEY (`photoId`) REFERENCES `craft_assets` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_users`
--

LOCK TABLES `craft_users` WRITE;
/*!40000 ALTER TABLE `craft_users` DISABLE KEYS */;
INSERT INTO `craft_users` VALUES (1,'admin',NULL,NULL,NULL,'maximemasson2@hotmail.com','$2y$13$0/Hd8hEKX47nNv9cgS2em.3TK7DxQuq4UsRlVOVfOz65AMCQnz65i',1,0,0,0,'2021-07-21 22:41:35',NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,0,'2021-07-21 20:47:21','2021-07-21 20:47:21','2021-07-21 22:41:35','e3777578-587f-4e56-858e-e0ae2f74c9e7');
/*!40000 ALTER TABLE `craft_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craft_volumefolders`
--

DROP TABLE IF EXISTS `craft_volumefolders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_volumefolders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parentId` int(11) DEFAULT NULL,
  `volumeId` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `path` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_idx_bihwflvwaoglfqjtpwukcmmagxduervncyym` (`name`,`parentId`,`volumeId`),
  KEY `craft_idx_dyazyyzyuiikdlqvxgxzprqzjzqzfhiqjuyc` (`parentId`),
  KEY `craft_idx_qjpcjxraupzeqigdgadzztjpntytewybjloo` (`volumeId`),
  CONSTRAINT `craft_fk_dszzycxcorofsaetxyxgjzebfqeadgmqlsck` FOREIGN KEY (`parentId`) REFERENCES `craft_volumefolders` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_fk_uwrzdqyucrgixngxnlurrpayifhweuokqyub` FOREIGN KEY (`volumeId`) REFERENCES `craft_volumes` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_volumefolders`
--

LOCK TABLES `craft_volumefolders` WRITE;
/*!40000 ALTER TABLE `craft_volumefolders` DISABLE KEYS */;
/*!40000 ALTER TABLE `craft_volumefolders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craft_volumes`
--

DROP TABLE IF EXISTS `craft_volumes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_volumes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `hasUrls` tinyint(1) NOT NULL DEFAULT 1,
  `url` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `titleTranslationMethod` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'site',
  `titleTranslationKeyFormat` text COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `settings` text COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `craft_idx_oyvapwjwchukyesaqgmpzlmeaaecvopwdyhr` (`name`),
  KEY `craft_idx_vcehdrwqeahvpsyclyzpxrrxajtbruhpkylt` (`handle`),
  KEY `craft_idx_dlbxnsjqgdetrqsndmbwjngnmdibttnfjdzn` (`fieldLayoutId`),
  KEY `craft_idx_fhtiptkkmdsyizkdulmbkngehpzonxehnhrw` (`dateDeleted`),
  CONSTRAINT `craft_fk_vmbrajgvxgzhohenwtduqxxuugvsnamsagqq` FOREIGN KEY (`fieldLayoutId`) REFERENCES `craft_fieldlayouts` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_volumes`
--

LOCK TABLES `craft_volumes` WRITE;
/*!40000 ALTER TABLE `craft_volumes` DISABLE KEYS */;
/*!40000 ALTER TABLE `craft_volumes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craft_widgets`
--

DROP TABLE IF EXISTS `craft_widgets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_widgets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `type` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `colspan` tinyint(3) DEFAULT NULL,
  `settings` text COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT 1,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `craft_idx_ojsnbrjqxcilpllgghriprynvofofhamnbya` (`userId`),
  CONSTRAINT `craft_fk_nzwavlvnpwoavurorxwvycfuhuqcncqtorsg` FOREIGN KEY (`userId`) REFERENCES `craft_users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_widgets`
--

LOCK TABLES `craft_widgets` WRITE;
/*!40000 ALTER TABLE `craft_widgets` DISABLE KEYS */;
INSERT INTO `craft_widgets` VALUES (1,1,'craft\\widgets\\RecentEntries',1,NULL,'{\"siteId\":1,\"section\":\"*\",\"limit\":10}',1,'2021-07-21 20:47:26','2021-07-21 20:47:26','8d1e0265-7d7a-4ddf-bc89-908147e7be23'),(2,1,'craft\\widgets\\CraftSupport',2,NULL,'[]',1,'2021-07-21 20:47:26','2021-07-21 20:47:26','71453329-fd91-4c28-b45e-2bb4fad2d207'),(3,1,'craft\\widgets\\Updates',3,NULL,'[]',1,'2021-07-21 20:47:26','2021-07-21 20:47:26','1451ee5f-373c-4086-a75b-fff158f5ba9a'),(4,1,'craft\\widgets\\Feed',4,NULL,'{\"url\":\"https://craftcms.com/news.rss\",\"title\":\"Craft News\",\"limit\":5}',1,'2021-07-21 20:47:26','2021-07-21 20:47:26','e2a864a0-f353-4d0b-904d-7012f78be71f');
/*!40000 ALTER TABLE `craft_widgets` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-07-21 23:10:45
