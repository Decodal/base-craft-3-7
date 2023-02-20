-- MariaDB dump 10.19  Distrib 10.5.9-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: 127.0.0.1    Database: base-craft-3-7
-- ------------------------------------------------------
-- Server version	10.5.9-MariaDB-1:10.5.9+maria~focal

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
-- Table structure for table `cc1_announcements`
--

DROP TABLE IF EXISTS `cc1_announcements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cc1_announcements` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `pluginId` int(11) DEFAULT NULL,
  `heading` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `body` text COLLATE utf8_unicode_ci NOT NULL,
  `unread` tinyint(1) NOT NULL DEFAULT 1,
  `dateRead` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `cc1_idx_hcedhtqutapxgkkjgacjrngnaokfipvyeadm` (`userId`,`unread`,`dateRead`,`dateCreated`),
  KEY `cc1_idx_sfvowdcjkzsrncrouepartsigvayzdupmwxy` (`dateRead`),
  KEY `cc1_fk_rleagsnszdserwuyzxpfjwxfaoynbsmxilrj` (`pluginId`),
  CONSTRAINT `cc1_fk_alnulxkhdulwtpxysvjufmmbulcpwepwxchs` FOREIGN KEY (`userId`) REFERENCES `cc1_users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `cc1_fk_rleagsnszdserwuyzxpfjwxfaoynbsmxilrj` FOREIGN KEY (`pluginId`) REFERENCES `cc1_plugins` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cc1_assetindexdata`
--

DROP TABLE IF EXISTS `cc1_assetindexdata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cc1_assetindexdata` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sessionId` varchar(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `volumeId` int(11) NOT NULL,
  `uri` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `size` bigint(20) unsigned DEFAULT NULL,
  `timestamp` datetime DEFAULT NULL,
  `recordId` int(11) DEFAULT NULL,
  `inProgress` tinyint(1) DEFAULT 0,
  `completed` tinyint(1) DEFAULT 0,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `cc1_idx_yueicuyiunvmhzptueqzifinzjymntshzugz` (`sessionId`,`volumeId`),
  KEY `cc1_idx_ypeiwgeugatetpkvmlizbubekwizynecqxyq` (`volumeId`),
  CONSTRAINT `cc1_fk_pislbyetnmjmbtqlsmeildygmgpxzpgapndq` FOREIGN KEY (`volumeId`) REFERENCES `cc1_volumes` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cc1_assets`
--

DROP TABLE IF EXISTS `cc1_assets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cc1_assets` (
  `id` int(11) NOT NULL,
  `volumeId` int(11) DEFAULT NULL,
  `folderId` int(11) NOT NULL,
  `uploaderId` int(11) DEFAULT NULL,
  `filename` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `kind` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'unknown',
  `width` int(11) unsigned DEFAULT NULL,
  `height` int(11) unsigned DEFAULT NULL,
  `size` bigint(20) unsigned DEFAULT NULL,
  `focalPoint` varchar(13) COLLATE utf8_unicode_ci DEFAULT NULL,
  `deletedWithVolume` tinyint(1) DEFAULT NULL,
  `keptFile` tinyint(1) DEFAULT NULL,
  `dateModified` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `cc1_idx_oapypkdejegyxzxwdkiknxuywzboxlpbrqrk` (`filename`,`folderId`),
  KEY `cc1_idx_pjraaryzkavabjtifypkcehqtdhpmcirbqbt` (`folderId`),
  KEY `cc1_idx_nxrrzjrpdugicttktuyfeyvhwcmuwpkaguxb` (`volumeId`),
  KEY `cc1_fk_xddmhhfawktxmpasaeydzwrtjkindxismmbk` (`uploaderId`),
  CONSTRAINT `cc1_fk_dohyvsbkejqlshbfpknwswnuatpbstjmowxz` FOREIGN KEY (`id`) REFERENCES `cc1_elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `cc1_fk_lmxtdsegwggcplnmupoukipffmhbmfhsokuc` FOREIGN KEY (`volumeId`) REFERENCES `cc1_volumes` (`id`) ON DELETE CASCADE,
  CONSTRAINT `cc1_fk_sekljsgckkwjipytigdkyxsidbcngbqbcrew` FOREIGN KEY (`folderId`) REFERENCES `cc1_volumefolders` (`id`) ON DELETE CASCADE,
  CONSTRAINT `cc1_fk_xddmhhfawktxmpasaeydzwrtjkindxismmbk` FOREIGN KEY (`uploaderId`) REFERENCES `cc1_users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cc1_assettransformindex`
--

DROP TABLE IF EXISTS `cc1_assettransformindex`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cc1_assettransformindex` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `assetId` int(11) NOT NULL,
  `filename` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `format` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `location` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `volumeId` int(11) DEFAULT NULL,
  `fileExists` tinyint(1) NOT NULL DEFAULT 0,
  `inProgress` tinyint(1) NOT NULL DEFAULT 0,
  `error` tinyint(1) NOT NULL DEFAULT 0,
  `dateIndexed` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `cc1_idx_yufdscyxjcbwifesaypkxxedshrqsfftaovv` (`volumeId`,`assetId`,`location`),
  KEY `cc1_idx_mooxffrttdwmjtliaifladvhqmczrwhlliju` (`assetId`,`format`,`location`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cc1_assettransforms`
--

DROP TABLE IF EXISTS `cc1_assettransforms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cc1_assettransforms` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `mode` enum('stretch','fit','crop') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'crop',
  `position` enum('top-left','top-center','top-right','center-left','center-center','center-right','bottom-left','bottom-center','bottom-right') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'center-center',
  `width` int(11) unsigned DEFAULT NULL,
  `height` int(11) unsigned DEFAULT NULL,
  `format` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `quality` int(11) DEFAULT NULL,
  `interlace` enum('none','line','plane','partition') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'none',
  `dimensionChangeTime` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `cc1_idx_aocwnefxhlnlmlofsjdvgrkfyqwvdsdikspu` (`name`),
  KEY `cc1_idx_qoupqdtgqpfrulxkycauevlxfhpaeldipkya` (`handle`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cc1_categories`
--

DROP TABLE IF EXISTS `cc1_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cc1_categories` (
  `id` int(11) NOT NULL,
  `groupId` int(11) NOT NULL,
  `parentId` int(11) DEFAULT NULL,
  `deletedWithGroup` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `cc1_idx_hmqqexualggdmqpbcmuoafaeqmrjjnjzvvue` (`groupId`),
  KEY `cc1_fk_kecnjuoprmziryvwaflzdpinxyousobiuhqq` (`parentId`),
  CONSTRAINT `cc1_fk_innbwudxfvgiwssbqymvkodxogrhcrhsdicq` FOREIGN KEY (`id`) REFERENCES `cc1_elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `cc1_fk_kecnjuoprmziryvwaflzdpinxyousobiuhqq` FOREIGN KEY (`parentId`) REFERENCES `cc1_categories` (`id`) ON DELETE SET NULL,
  CONSTRAINT `cc1_fk_wbcmberiecshaznbnwffcamqbcoujsroeifk` FOREIGN KEY (`groupId`) REFERENCES `cc1_categorygroups` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cc1_categorygroups`
--

DROP TABLE IF EXISTS `cc1_categorygroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cc1_categorygroups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `structureId` int(11) NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `defaultPlacement` enum('beginning','end') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'end',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `cc1_idx_jouhibykiktgnzsxfzjrhkzcfnaxekwvuego` (`name`),
  KEY `cc1_idx_exijgetrdprtgoizgonxsyeadhxtumharifx` (`handle`),
  KEY `cc1_idx_lydkpzbmlfmvcyfgbdqgyixpbsafagxitcbj` (`structureId`),
  KEY `cc1_idx_qgxqsdlagzmhwbmrdgbvifzhzvoxzseqqysg` (`fieldLayoutId`),
  KEY `cc1_idx_ciutflsgtheaoxbadnzvqejfgcwiagsrtols` (`dateDeleted`),
  CONSTRAINT `cc1_fk_fwhquyaolpzclwyijvbjbaaruyovfwphvzuv` FOREIGN KEY (`structureId`) REFERENCES `cc1_structures` (`id`) ON DELETE CASCADE,
  CONSTRAINT `cc1_fk_pdpjaulrrwqzelhjcdiieifgnzmbukvdcadh` FOREIGN KEY (`fieldLayoutId`) REFERENCES `cc1_fieldlayouts` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cc1_categorygroups_sites`
--

DROP TABLE IF EXISTS `cc1_categorygroups_sites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cc1_categorygroups_sites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `groupId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `hasUrls` tinyint(1) NOT NULL DEFAULT 1,
  `uriFormat` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `template` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `cc1_idx_rlydecqlqadtlactgdayvoodmwjrykzookei` (`groupId`,`siteId`),
  KEY `cc1_idx_pcyhwnalrwvcvqeakhgwfqzrkzqbmztkppyd` (`siteId`),
  CONSTRAINT `cc1_fk_bvjiqlltfzhakzsfkifjmfpntlsqcjdfobuh` FOREIGN KEY (`groupId`) REFERENCES `cc1_categorygroups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `cc1_fk_nvqswjjyykbwnuuzoylsfrwtkgpgoyelgotv` FOREIGN KEY (`siteId`) REFERENCES `cc1_sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cc1_changedattributes`
--

DROP TABLE IF EXISTS `cc1_changedattributes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cc1_changedattributes` (
  `elementId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `attribute` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `propagated` tinyint(1) NOT NULL,
  `userId` int(11) DEFAULT NULL,
  PRIMARY KEY (`elementId`,`siteId`,`attribute`),
  KEY `cc1_idx_zqnlowqoaksekuxceajkoikoepzforirivmw` (`elementId`,`siteId`,`dateUpdated`),
  KEY `cc1_fk_rricjztlsshqajurqoncffvaqvyrqmizdsli` (`siteId`),
  KEY `cc1_fk_nolktztxpoedgpqezsipuluxhbypnauwatma` (`userId`),
  CONSTRAINT `cc1_fk_aromcrmlicxohlnwijcwgvzboqkadnmfrpmo` FOREIGN KEY (`elementId`) REFERENCES `cc1_elements` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `cc1_fk_nolktztxpoedgpqezsipuluxhbypnauwatma` FOREIGN KEY (`userId`) REFERENCES `cc1_users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `cc1_fk_rricjztlsshqajurqoncffvaqvyrqmizdsli` FOREIGN KEY (`siteId`) REFERENCES `cc1_sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cc1_changedfields`
--

DROP TABLE IF EXISTS `cc1_changedfields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cc1_changedfields` (
  `elementId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `fieldId` int(11) NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `propagated` tinyint(1) NOT NULL,
  `userId` int(11) DEFAULT NULL,
  PRIMARY KEY (`elementId`,`siteId`,`fieldId`),
  KEY `cc1_idx_weohtlpiayaurwenrsvynqgokxybsllbljhw` (`elementId`,`siteId`,`dateUpdated`),
  KEY `cc1_fk_lyxtfnqrpdyosotiobtvlwckezjdxlrmazvn` (`siteId`),
  KEY `cc1_fk_smzqdtfvtpmkvdnmfalnqztwbbzibsswjhbt` (`fieldId`),
  KEY `cc1_fk_aiwtcvbfbapktrxocmrmfdqveoaaxjmxuooo` (`userId`),
  CONSTRAINT `cc1_fk_aiwtcvbfbapktrxocmrmfdqveoaaxjmxuooo` FOREIGN KEY (`userId`) REFERENCES `cc1_users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `cc1_fk_idooscfpcqydxzzjepcdgbwuyhkwmxpgkyme` FOREIGN KEY (`elementId`) REFERENCES `cc1_elements` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `cc1_fk_lyxtfnqrpdyosotiobtvlwckezjdxlrmazvn` FOREIGN KEY (`siteId`) REFERENCES `cc1_sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `cc1_fk_smzqdtfvtpmkvdnmfalnqztwbbzibsswjhbt` FOREIGN KEY (`fieldId`) REFERENCES `cc1_fields` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cc1_content`
--

DROP TABLE IF EXISTS `cc1_content`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cc1_content` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `elementId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `field_googleAnalyticsKey_kzjsmnwd` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `field_metaDescription_udaibbfd` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `field_metaRobots_iktjjput` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `field_metaTitle_bunquboh` text COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `cc1_idx_chxllvhkrgiyjqzlgfpmeqolibhavhjegzkf` (`elementId`,`siteId`),
  KEY `cc1_idx_tpnrupzyqwljdqibuunctzubyzzxshucilva` (`siteId`),
  KEY `cc1_idx_nkcfahxbsjvtkidwmwwsxvgkfqvkzyuejllw` (`title`),
  CONSTRAINT `cc1_fk_dbdvipdtubolmvuekmvzefoulkjclbjlifgi` FOREIGN KEY (`siteId`) REFERENCES `cc1_sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `cc1_fk_pifednpejataujahpsrkcstpslagaqbcggra` FOREIGN KEY (`elementId`) REFERENCES `cc1_elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cc1_craftidtokens`
--

DROP TABLE IF EXISTS `cc1_craftidtokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cc1_craftidtokens` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `accessToken` text COLLATE utf8_unicode_ci NOT NULL,
  `expiryDate` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `cc1_fk_tumhatysoiaaijzcwimbxkobgruelamtacld` (`userId`),
  CONSTRAINT `cc1_fk_tumhatysoiaaijzcwimbxkobgruelamtacld` FOREIGN KEY (`userId`) REFERENCES `cc1_users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cc1_deprecationerrors`
--

DROP TABLE IF EXISTS `cc1_deprecationerrors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cc1_deprecationerrors` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `key` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `fingerprint` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `lastOccurrence` datetime NOT NULL,
  `file` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `line` smallint(6) unsigned DEFAULT NULL,
  `message` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `traces` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `cc1_idx_ygmxoyqdeghhgenxuajgcssjqkoazddzuhtg` (`key`,`fingerprint`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cc1_drafts`
--

DROP TABLE IF EXISTS `cc1_drafts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cc1_drafts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sourceId` int(11) DEFAULT NULL,
  `creatorId` int(11) DEFAULT NULL,
  `provisional` tinyint(1) NOT NULL DEFAULT 0,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `notes` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `trackChanges` tinyint(1) NOT NULL DEFAULT 0,
  `dateLastMerged` datetime DEFAULT NULL,
  `saved` tinyint(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`),
  KEY `cc1_idx_oehvqfbsxbdfzlcbskikvgqiwfrnxghtmhrn` (`creatorId`,`provisional`),
  KEY `cc1_idx_baidenbvsltqbfdwudzwxyxfzdhlmspohoif` (`saved`),
  KEY `cc1_fk_tlzpiudtahwfawnxcgesbenrrxkdxdvzrcnm` (`sourceId`),
  CONSTRAINT `cc1_fk_qumxcnynqhhvgjflayhfybiibztnhkqlfwoc` FOREIGN KEY (`creatorId`) REFERENCES `cc1_users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `cc1_fk_tlzpiudtahwfawnxcgesbenrrxkdxdvzrcnm` FOREIGN KEY (`sourceId`) REFERENCES `cc1_elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cc1_elementindexsettings`
--

DROP TABLE IF EXISTS `cc1_elementindexsettings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cc1_elementindexsettings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `settings` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `cc1_idx_yuthqccgibdelxkuhwsrhxejqrvtexuipdsb` (`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cc1_elements`
--

DROP TABLE IF EXISTS `cc1_elements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cc1_elements` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `canonicalId` int(11) DEFAULT NULL,
  `draftId` int(11) DEFAULT NULL,
  `revisionId` int(11) DEFAULT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT 1,
  `archived` tinyint(1) NOT NULL DEFAULT 0,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateLastMerged` datetime DEFAULT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `cc1_idx_ihnpgpomsrigzbubcwxaatsgylunfhuxjdgd` (`dateDeleted`),
  KEY `cc1_idx_frgcyxltfdoirzluxoirbiwrkrlfbtzghwvj` (`fieldLayoutId`),
  KEY `cc1_idx_vkqozusiqpyrfwopnielkalwqtmcnxurefcu` (`type`),
  KEY `cc1_idx_ivlafdagicrvsdwacttyyafbgzevuoiynuve` (`enabled`),
  KEY `cc1_idx_ykgjmmcdqggfukvwbtfgkpqbkpufdrcuvjlk` (`archived`,`dateCreated`),
  KEY `cc1_idx_rnkewwmosckbixaanvbmqcsoevbzwgabsbct` (`archived`,`dateDeleted`,`draftId`,`revisionId`,`canonicalId`),
  KEY `cc1_idx_cbqbfutycnxudgawegaumozdejazqgcyfevz` (`archived`,`dateDeleted`,`draftId`,`revisionId`,`canonicalId`,`enabled`),
  KEY `cc1_fk_lussqhmtietowtytddykgzkasrbsjwhgpgfm` (`canonicalId`),
  KEY `cc1_fk_ghxurxgdggqdmaldmpqwxbfvklmihncfqjqx` (`draftId`),
  KEY `cc1_fk_vawvxbwxaldcaayktumfriccuisijaxkicms` (`revisionId`),
  CONSTRAINT `cc1_fk_ghxurxgdggqdmaldmpqwxbfvklmihncfqjqx` FOREIGN KEY (`draftId`) REFERENCES `cc1_drafts` (`id`) ON DELETE CASCADE,
  CONSTRAINT `cc1_fk_lussqhmtietowtytddykgzkasrbsjwhgpgfm` FOREIGN KEY (`canonicalId`) REFERENCES `cc1_elements` (`id`) ON DELETE SET NULL,
  CONSTRAINT `cc1_fk_vawvxbwxaldcaayktumfriccuisijaxkicms` FOREIGN KEY (`revisionId`) REFERENCES `cc1_revisions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `cc1_fk_yksiejbpyhojxhancmbgphzvmjvjenibpsbg` FOREIGN KEY (`fieldLayoutId`) REFERENCES `cc1_fieldlayouts` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cc1_elements_sites`
--

DROP TABLE IF EXISTS `cc1_elements_sites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cc1_elements_sites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `elementId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `uri` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT 1,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `cc1_idx_sbmxshzbkjcxksxeignkdttgrznhomxtlxmh` (`elementId`,`siteId`),
  KEY `cc1_idx_odfnsnszknevyraqvweodwbplzvulyypjggn` (`siteId`),
  KEY `cc1_idx_tjsegyjtwfcpduweukwfhshfqulraggusxam` (`slug`,`siteId`),
  KEY `cc1_idx_fioctltegbntcikyczwetbaxaldhlbrfkhkp` (`enabled`),
  KEY `cc1_idx_busogwifjezecnmogevwwkufivgwzhjxdqbv` (`uri`,`siteId`),
  CONSTRAINT `cc1_fk_hvzeigzcqefqmiijozqxtnfacckxhsucdtac` FOREIGN KEY (`siteId`) REFERENCES `cc1_sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `cc1_fk_vwocmqoqhbcxxgsmkntfdqeruoeqfrgeaxsh` FOREIGN KEY (`elementId`) REFERENCES `cc1_elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cc1_entries`
--

DROP TABLE IF EXISTS `cc1_entries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cc1_entries` (
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
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `cc1_idx_rfrxxfjkmbeueqsipyoiepgzqlxjoskvlzrg` (`postDate`),
  KEY `cc1_idx_nemrxlwythiiyopmcstvcgdtptizwsepedca` (`expiryDate`),
  KEY `cc1_idx_apkqmfiyhlvtdahurdnddnjksxlftdvcpyiz` (`authorId`),
  KEY `cc1_idx_jlosxtqjacojjrnnqrtxxfpspqmhgtoozfrq` (`sectionId`),
  KEY `cc1_idx_zzofhfgsjbeawipysdllixgvcygtjayktnnr` (`typeId`),
  KEY `cc1_fk_ggchkaqljckmicbvtzkjqhydjdlyllijxlco` (`parentId`),
  CONSTRAINT `cc1_fk_csbhlngzlovbgdszjszkfjtdcgbtgcbekmog` FOREIGN KEY (`typeId`) REFERENCES `cc1_entrytypes` (`id`) ON DELETE CASCADE,
  CONSTRAINT `cc1_fk_eqfctkcebcmaamrxjxqcgyqdkdmewfumljrs` FOREIGN KEY (`id`) REFERENCES `cc1_elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `cc1_fk_fiyofjzqlfxonbtxvdzlooachkkwmcfvgrgn` FOREIGN KEY (`sectionId`) REFERENCES `cc1_sections` (`id`) ON DELETE CASCADE,
  CONSTRAINT `cc1_fk_ggchkaqljckmicbvtzkjqhydjdlyllijxlco` FOREIGN KEY (`parentId`) REFERENCES `cc1_entries` (`id`) ON DELETE SET NULL,
  CONSTRAINT `cc1_fk_nzumyvilsyrfsdoxwhtbvdtyavmqvxqpeodw` FOREIGN KEY (`authorId`) REFERENCES `cc1_users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cc1_entrytypes`
--

DROP TABLE IF EXISTS `cc1_entrytypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cc1_entrytypes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sectionId` int(11) NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `hasTitleField` tinyint(1) NOT NULL DEFAULT 1,
  `titleTranslationMethod` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'site',
  `titleTranslationKeyFormat` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `titleFormat` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `cc1_idx_mcenrkeakbujpxbfyxrpnlfqieuqyqiehbio` (`name`,`sectionId`),
  KEY `cc1_idx_rqembrgfwxyiucqjdsrxudxvjkhwihpalogd` (`handle`,`sectionId`),
  KEY `cc1_idx_iogkpmiwkignynmgkeynqbgsnpgwlgojcxwl` (`sectionId`),
  KEY `cc1_idx_ipvnvsqfqtcqnddmhxmqpqgyowogkgnwhrnf` (`fieldLayoutId`),
  KEY `cc1_idx_dhwyqwxetjuggqzaaisdfzvlkydqnhezxdae` (`dateDeleted`),
  CONSTRAINT `cc1_fk_jtsjqjirbcfdwbaxhhikpcfjlbmxukjjvxoi` FOREIGN KEY (`fieldLayoutId`) REFERENCES `cc1_fieldlayouts` (`id`) ON DELETE SET NULL,
  CONSTRAINT `cc1_fk_rweanydcoqcyqirgqiqnqrdpueqwgvwkihdd` FOREIGN KEY (`sectionId`) REFERENCES `cc1_sections` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cc1_fieldgroups`
--

DROP TABLE IF EXISTS `cc1_fieldgroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cc1_fieldgroups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `cc1_idx_vwxrkvqaerwjnrztlojbmyrdwctubwvvwvzy` (`name`),
  KEY `cc1_idx_nmwdkixrdkrxocfurvaljsdvlsendgffyecc` (`dateDeleted`,`name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cc1_fieldlayoutfields`
--

DROP TABLE IF EXISTS `cc1_fieldlayoutfields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cc1_fieldlayoutfields` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `layoutId` int(11) NOT NULL,
  `tabId` int(11) NOT NULL,
  `fieldId` int(11) NOT NULL,
  `required` tinyint(1) NOT NULL DEFAULT 0,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `cc1_idx_syigtpaoquwnqszqsxkzilzzsqoyjdkcnzfy` (`layoutId`,`fieldId`),
  KEY `cc1_idx_jwrczdkydpgarmrfimlbeydkrgzmbkqijbrb` (`sortOrder`),
  KEY `cc1_idx_fmzvtkbqpwzsodpzbvagkqqanaiafqgeyogi` (`tabId`),
  KEY `cc1_idx_porenmdvdyhmskjuixanfyejwpijtbfedlvj` (`fieldId`),
  CONSTRAINT `cc1_fk_dkbnfnnoskznrazrlncluuoaeubpxwtndodh` FOREIGN KEY (`fieldId`) REFERENCES `cc1_fields` (`id`) ON DELETE CASCADE,
  CONSTRAINT `cc1_fk_hrugiwyutxfzpsocpwqastjhxpwfkdiouugf` FOREIGN KEY (`tabId`) REFERENCES `cc1_fieldlayouttabs` (`id`) ON DELETE CASCADE,
  CONSTRAINT `cc1_fk_lrjnhrjihrbiwohzxhqrheocsdvvaeglgkou` FOREIGN KEY (`layoutId`) REFERENCES `cc1_fieldlayouts` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=74 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cc1_fieldlayouts`
--

DROP TABLE IF EXISTS `cc1_fieldlayouts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cc1_fieldlayouts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `cc1_idx_uighbwwjsekhhvxsijhxhpkgybqwunfvodur` (`dateDeleted`),
  KEY `cc1_idx_xeucjtlhlomsxmlxdlgaaafyrhfecnxkohrj` (`type`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cc1_fieldlayouttabs`
--

DROP TABLE IF EXISTS `cc1_fieldlayouttabs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cc1_fieldlayouttabs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `layoutId` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `elements` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `cc1_idx_icmihqzwffejfqxmetnnmoyofjyaqvqnaihz` (`sortOrder`),
  KEY `cc1_idx_iffjaduaabvhtggattsetixpszfctwtreoxk` (`layoutId`),
  CONSTRAINT `cc1_fk_pnkppibqlbqwnacibpkqtrximerttevwcmpm` FOREIGN KEY (`layoutId`) REFERENCES `cc1_fieldlayouts` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cc1_fields`
--

DROP TABLE IF EXISTS `cc1_fields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cc1_fields` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `groupId` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `context` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'global',
  `columnSuffix` char(8) COLLATE utf8_unicode_ci DEFAULT NULL,
  `instructions` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `searchable` tinyint(1) NOT NULL DEFAULT 1,
  `translationMethod` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'none',
  `translationKeyFormat` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `settings` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `cc1_idx_wwehovwlyatwmbgklltrcdjmcibhsjdbijxe` (`handle`,`context`),
  KEY `cc1_idx_klgxjcsmlyelpgxuysovopxgjvakjahmpycd` (`groupId`),
  KEY `cc1_idx_ysvjsjjgmiupzgtvtgvbgvbpfhfmtvyferev` (`context`),
  CONSTRAINT `cc1_fk_mbiiwxzwbgtqikzuzubmvtmfbfzxscsxjink` FOREIGN KEY (`groupId`) REFERENCES `cc1_fieldgroups` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cc1_globalsets`
--

DROP TABLE IF EXISTS `cc1_globalsets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cc1_globalsets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `cc1_idx_pjoflgpdkrtwsaphhkynefhnbkunqoqbsyel` (`name`),
  KEY `cc1_idx_ezhvrfpytfejtsgfybyubzhlhyoaitalkyok` (`handle`),
  KEY `cc1_idx_sqkijlfebkdrplmariulllmqfdqzwgaljtfl` (`fieldLayoutId`),
  KEY `cc1_idx_cxkcgwualrvkkxkjdliizvsipkhjqaxzotpj` (`sortOrder`),
  CONSTRAINT `cc1_fk_fjqhtltffojncdygqcoznhwbyrxippipbiar` FOREIGN KEY (`fieldLayoutId`) REFERENCES `cc1_fieldlayouts` (`id`) ON DELETE SET NULL,
  CONSTRAINT `cc1_fk_qmtuaevhqxxhriitydjzktvdnlwapsccceuh` FOREIGN KEY (`id`) REFERENCES `cc1_elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cc1_gqlschemas`
--

DROP TABLE IF EXISTS `cc1_gqlschemas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cc1_gqlschemas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `scope` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `isPublic` tinyint(1) NOT NULL DEFAULT 0,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cc1_gqltokens`
--

DROP TABLE IF EXISTS `cc1_gqltokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cc1_gqltokens` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `accessToken` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT 1,
  `expiryDate` datetime DEFAULT NULL,
  `lastUsed` datetime DEFAULT NULL,
  `schemaId` int(11) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `cc1_idx_hcvhgmrakojyzdjnpzenijbzbjauihiospaf` (`accessToken`),
  UNIQUE KEY `cc1_idx_inyjhuspzuhjskvtfpeduldsczbxuvkawpwc` (`name`),
  KEY `cc1_fk_jgstmsshclxqggbsyitcvcodngmtuhlprejn` (`schemaId`),
  CONSTRAINT `cc1_fk_jgstmsshclxqggbsyitcvcodngmtuhlprejn` FOREIGN KEY (`schemaId`) REFERENCES `cc1_gqlschemas` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cc1_info`
--

DROP TABLE IF EXISTS `cc1_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cc1_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `version` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `schemaVersion` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `maintenance` tinyint(1) NOT NULL DEFAULT 0,
  `configVersion` char(12) COLLATE utf8_unicode_ci NOT NULL DEFAULT '000000000000',
  `fieldVersion` char(12) COLLATE utf8_unicode_ci NOT NULL DEFAULT '000000000000',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cc1_matrixblocks`
--

DROP TABLE IF EXISTS `cc1_matrixblocks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cc1_matrixblocks` (
  `id` int(11) NOT NULL,
  `ownerId` int(11) NOT NULL,
  `fieldId` int(11) NOT NULL,
  `typeId` int(11) NOT NULL,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `deletedWithOwner` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `cc1_idx_deqbibuuztyxrchrhfhlpbgzkjaaelvxydck` (`ownerId`),
  KEY `cc1_idx_royfkclykjzsswulqwklqqcarcqdfygqrzro` (`fieldId`),
  KEY `cc1_idx_xgkljchnbtmjthxxredplcvemajcxtgdqyvt` (`typeId`),
  KEY `cc1_idx_noxfwknjaqvvxxumqkgqgcgrynqpcmvobjcy` (`sortOrder`),
  CONSTRAINT `cc1_fk_dakzjhntvgwxwwvdozteozxsitactwhsikkk` FOREIGN KEY (`ownerId`) REFERENCES `cc1_elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `cc1_fk_keboilkywhnzzobvelrjqkjavlopayawjhna` FOREIGN KEY (`typeId`) REFERENCES `cc1_matrixblocktypes` (`id`) ON DELETE CASCADE,
  CONSTRAINT `cc1_fk_rfuwfndbwgwygallggigzwlkezjsiimpobbs` FOREIGN KEY (`id`) REFERENCES `cc1_elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `cc1_fk_rsgorpgzxmzlpqkvattnapevptpzzdgdcfzy` FOREIGN KEY (`fieldId`) REFERENCES `cc1_fields` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cc1_matrixblocktypes`
--

DROP TABLE IF EXISTS `cc1_matrixblocktypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cc1_matrixblocktypes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fieldId` int(11) NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `cc1_idx_jreytbtntvgxxhakmxgyumulfkmdjedzdyzb` (`name`,`fieldId`),
  KEY `cc1_idx_ttltqbummyhqdmltciupwtcpkacfxzweslsa` (`handle`,`fieldId`),
  KEY `cc1_idx_wmobycwgtjipswwzwphvhwhhepwrkxecrahu` (`fieldId`),
  KEY `cc1_idx_inrigktosqwysetqnrowzhmwjrsfzummdnqr` (`fieldLayoutId`),
  CONSTRAINT `cc1_fk_hmhfzmogqnbkwwsdpxmyjsurjouuwncggofk` FOREIGN KEY (`fieldId`) REFERENCES `cc1_fields` (`id`) ON DELETE CASCADE,
  CONSTRAINT `cc1_fk_lrlgvtkggmdrwuqhbnyrhgclzysdmkutdxfx` FOREIGN KEY (`fieldLayoutId`) REFERENCES `cc1_fieldlayouts` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cc1_matrixcontent_contentblocks`
--

DROP TABLE IF EXISTS `cc1_matrixcontent_contentblocks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cc1_matrixcontent_contentblocks` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `elementId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `field_column_columnClass_jatdtiol` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `field_expander_expanderAttributes_grdejgvk` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `field_expander_expanderHeading_njokbjtg` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `field_regularCopy_customClass_fgviknbj` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `field_sectionHeading_customClass_kbmzzrla` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `field_sectionHeading_headingLevel_gaekoolf` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `field_sectionHeading_headingText_rmifqbic` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `field_regularImage_caption_bkzlphcn` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `field_regularImage_customClass_hnehkpux` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `field_regularImage_altTag_pcjsopjy` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `field_address_website_jprpimdt` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `field_address_postalAddress_olijfakl` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `field_address_telephone_szzhvqiw` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `field_address_customClass_jtmaqxlc` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `field_address_email_vvwczkro` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `field_table_customClass_hquyacjy` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `field_staticBlock_customClass_ymxfkyke` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `field_staticBlock_templateName_zkhyubqj` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `field_complexBlock_customClass_mlxaxmwx` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `field_regularCopy_text_mcxqzuzy` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `field_table_tableData` text COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `cc1_idx_lpjrudmcpeigngantkxqubdzlcricizwhcae` (`elementId`,`siteId`),
  KEY `cc1_fk_zjhoevvzipwdndcmenskwrfvdtlwiomnprch` (`siteId`),
  CONSTRAINT `cc1_fk_qhidhcidkuvffjhwwjmbonhqsnqvvkaqmqtv` FOREIGN KEY (`elementId`) REFERENCES `cc1_elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `cc1_fk_zjhoevvzipwdndcmenskwrfvdtlwiomnprch` FOREIGN KEY (`siteId`) REFERENCES `cc1_sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cc1_migrations`
--

DROP TABLE IF EXISTS `cc1_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cc1_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `track` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `applyTime` datetime NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `cc1_idx_gdbvmdghveoaoibbkvyhclbbvhbthwuuayht` (`track`,`name`)
) ENGINE=InnoDB AUTO_INCREMENT=197 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cc1_plugins`
--

DROP TABLE IF EXISTS `cc1_plugins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cc1_plugins` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `handle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `version` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `schemaVersion` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `licenseKeyStatus` enum('valid','trial','invalid','mismatched','astray','unknown') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'unknown',
  `licensedEdition` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `installDate` datetime NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `cc1_idx_rnmnhvqfraecrcfunsmhsftyufgihvluykcp` (`handle`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cc1_projectconfig`
--

DROP TABLE IF EXISTS `cc1_projectconfig`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cc1_projectconfig` (
  `path` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `value` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`path`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cc1_queue`
--

DROP TABLE IF EXISTS `cc1_queue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cc1_queue` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `channel` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'queue',
  `job` longblob NOT NULL,
  `description` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `timePushed` int(11) NOT NULL,
  `ttr` int(11) NOT NULL,
  `delay` int(11) NOT NULL DEFAULT 0,
  `priority` int(11) unsigned NOT NULL DEFAULT 1024,
  `dateReserved` datetime DEFAULT NULL,
  `timeUpdated` int(11) DEFAULT NULL,
  `progress` smallint(6) NOT NULL DEFAULT 0,
  `progressLabel` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `attempt` int(11) DEFAULT NULL,
  `fail` tinyint(1) DEFAULT 0,
  `dateFailed` datetime DEFAULT NULL,
  `error` text COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cc1_idx_locbolzoxxarqhezdqansmnmlpdlgojdtcmp` (`channel`,`fail`,`timeUpdated`,`timePushed`),
  KEY `cc1_idx_pvloziegpxyqujqktsddhgbnvnppxwncdjjh` (`channel`,`fail`,`timeUpdated`,`delay`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cc1_relations`
--

DROP TABLE IF EXISTS `cc1_relations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cc1_relations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fieldId` int(11) NOT NULL,
  `sourceId` int(11) NOT NULL,
  `sourceSiteId` int(11) DEFAULT NULL,
  `targetId` int(11) NOT NULL,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `cc1_idx_jmogxyiocsusncgugjarqnaievemrjtbagzo` (`fieldId`,`sourceId`,`sourceSiteId`,`targetId`),
  KEY `cc1_idx_qlnjimobxjkyavfbewiydrevenqhaqjovahj` (`sourceId`),
  KEY `cc1_idx_fvknohynipihbgdfoqgkobrrljffqgcrnlii` (`targetId`),
  KEY `cc1_idx_alzbqdzypuxsqmtydcnojvnoyngngfiqvodd` (`sourceSiteId`),
  CONSTRAINT `cc1_fk_pumbixgrhbonumiogoabrstvluapqkopvnnl` FOREIGN KEY (`targetId`) REFERENCES `cc1_elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `cc1_fk_qepwwvjvqkjzchfelzvxgrtzzaiyouknbfpm` FOREIGN KEY (`sourceSiteId`) REFERENCES `cc1_sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `cc1_fk_qgxjsecnsspjxoowzzdxvegxyrmiylgcdzbh` FOREIGN KEY (`sourceId`) REFERENCES `cc1_elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `cc1_fk_uhklpdmtbofkbpppejvyaxkpjhpfuqrmpduo` FOREIGN KEY (`fieldId`) REFERENCES `cc1_fields` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cc1_resourcepaths`
--

DROP TABLE IF EXISTS `cc1_resourcepaths`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cc1_resourcepaths` (
  `hash` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `path` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`hash`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cc1_revisions`
--

DROP TABLE IF EXISTS `cc1_revisions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cc1_revisions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sourceId` int(11) NOT NULL,
  `creatorId` int(11) DEFAULT NULL,
  `num` int(11) NOT NULL,
  `notes` text COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `cc1_idx_oyrhpnvnmosxccyobmpztxcropzoelnxgcrc` (`sourceId`,`num`),
  KEY `cc1_fk_zblkltffygmptkgbmsdqbtilatslxegvwsrc` (`creatorId`),
  CONSTRAINT `cc1_fk_iupajjpfmhvgzvvxhrzxaqzqqwbkdeyhbwzy` FOREIGN KEY (`sourceId`) REFERENCES `cc1_elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `cc1_fk_zblkltffygmptkgbmsdqbtilatslxegvwsrc` FOREIGN KEY (`creatorId`) REFERENCES `cc1_users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cc1_searchindex`
--

DROP TABLE IF EXISTS `cc1_searchindex`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cc1_searchindex` (
  `elementId` int(11) NOT NULL,
  `attribute` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `fieldId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `keywords` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`elementId`,`attribute`,`fieldId`,`siteId`),
  FULLTEXT KEY `cc1_idx_ukyddexhffvhbmjjvntepblargoftvvfqyke` (`keywords`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cc1_sections`
--

DROP TABLE IF EXISTS `cc1_sections`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cc1_sections` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `structureId` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `type` enum('single','channel','structure') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'channel',
  `enableVersioning` tinyint(1) NOT NULL DEFAULT 0,
  `propagationMethod` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'all',
  `defaultPlacement` enum('beginning','end') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'end',
  `previewTargets` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `cc1_idx_rlaxzfpswucyapnfkqguzjtdzpyoevsfhjhh` (`handle`),
  KEY `cc1_idx_hltndnqmehdkxtwxncijysaogvojcnodnjsx` (`name`),
  KEY `cc1_idx_clhzllausxyawwmcssotyfmcsyffksjvwsdo` (`structureId`),
  KEY `cc1_idx_rrxwdsbmrbnshtegelkzqvrhtksnfncjrwae` (`dateDeleted`),
  CONSTRAINT `cc1_fk_mhatuxcwypacawikohnkqoxpbsbcirjmeppm` FOREIGN KEY (`structureId`) REFERENCES `cc1_structures` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cc1_sections_sites`
--

DROP TABLE IF EXISTS `cc1_sections_sites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cc1_sections_sites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sectionId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `hasUrls` tinyint(1) NOT NULL DEFAULT 1,
  `uriFormat` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `template` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `enabledByDefault` tinyint(1) NOT NULL DEFAULT 1,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `cc1_idx_uukdulsvlsxweskqdmkatorrrjqyyokiohlc` (`sectionId`,`siteId`),
  KEY `cc1_idx_iewibmrkqzzjkqpzzdswghcnxxrtzmxcmxcn` (`siteId`),
  CONSTRAINT `cc1_fk_iedbklipmjuosofhzjvkhoyjgoseulrmhoee` FOREIGN KEY (`siteId`) REFERENCES `cc1_sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `cc1_fk_mqveuyigkoijdkjebvqrprxanqntjygzaxhk` FOREIGN KEY (`sectionId`) REFERENCES `cc1_sections` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cc1_sequences`
--

DROP TABLE IF EXISTS `cc1_sequences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cc1_sequences` (
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `next` int(11) unsigned NOT NULL DEFAULT 1,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cc1_sessions`
--

DROP TABLE IF EXISTS `cc1_sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cc1_sessions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `token` char(100) COLLATE utf8_unicode_ci NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `cc1_idx_ekzkyzrsvpfxxxyhtldogaqntleiiprkvbtr` (`uid`),
  KEY `cc1_idx_pqlsneozhwbtztxugnmbltkpgwqaozskocly` (`token`),
  KEY `cc1_idx_cufoxvmvuhlzipcbskfubgqumbkpmuodonpn` (`dateUpdated`),
  KEY `cc1_idx_fhlaxvsayfzdbmkinbuqpatutwbvxazrsdcm` (`userId`),
  CONSTRAINT `cc1_fk_brgytzstmigvtcezsidookrxepbdvqolrarn` FOREIGN KEY (`userId`) REFERENCES `cc1_users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cc1_shunnedmessages`
--

DROP TABLE IF EXISTS `cc1_shunnedmessages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cc1_shunnedmessages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `message` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `expiryDate` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `cc1_idx_ejyoguceayhjnuiefjrkpxbeaevhhfcrlzgm` (`userId`,`message`),
  CONSTRAINT `cc1_fk_nuvydguszbjqaibmkifcpstabiurslapkdcz` FOREIGN KEY (`userId`) REFERENCES `cc1_users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cc1_sitegroups`
--

DROP TABLE IF EXISTS `cc1_sitegroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cc1_sitegroups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `cc1_idx_plszfkjzxaofziwvdfwwztryprsrxbydwhru` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cc1_sites`
--

DROP TABLE IF EXISTS `cc1_sites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cc1_sites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `groupId` int(11) NOT NULL,
  `primary` tinyint(1) NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT 1,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `language` varchar(12) COLLATE utf8_unicode_ci NOT NULL,
  `hasUrls` tinyint(1) NOT NULL DEFAULT 0,
  `baseUrl` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `cc1_idx_aqbnbdayhttendihywhbvnzluqhclciliwcp` (`dateDeleted`),
  KEY `cc1_idx_fvcoicktaaodrvnkujkjcmnazpynyouytras` (`handle`),
  KEY `cc1_idx_xfvavdhgzjolisnijrphadkcixqpmubzamez` (`sortOrder`),
  KEY `cc1_fk_hesbfnlqvgvllqwtzrpnntaypncghavoghwh` (`groupId`),
  CONSTRAINT `cc1_fk_hesbfnlqvgvllqwtzrpnntaypncghavoghwh` FOREIGN KEY (`groupId`) REFERENCES `cc1_sitegroups` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cc1_structureelements`
--

DROP TABLE IF EXISTS `cc1_structureelements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cc1_structureelements` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `structureId` int(11) NOT NULL,
  `elementId` int(11) DEFAULT NULL,
  `root` int(11) unsigned DEFAULT NULL,
  `lft` int(11) unsigned NOT NULL,
  `rgt` int(11) unsigned NOT NULL,
  `level` smallint(6) unsigned NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `cc1_idx_mezflmnquisprijeyhoeadvzesgmsbgkbedy` (`structureId`,`elementId`),
  KEY `cc1_idx_owtdcdiujxmypaxghrbqgvcxfmijiwzbbvnv` (`root`),
  KEY `cc1_idx_lwrxitceuqwrkbxozcvhfwbnenosqvmygiaf` (`lft`),
  KEY `cc1_idx_jqmwpnnprxkowaguearghflvxngwsrknlbig` (`rgt`),
  KEY `cc1_idx_irofdhxjhgfmwwbirlarjclgftodteisyzbl` (`level`),
  KEY `cc1_idx_ssismjkrnwwcjlgapublqrtjdrjvxjcdcceq` (`elementId`),
  CONSTRAINT `cc1_fk_cyvpjrjrzepcexrqwitzcxwpfawrxwcqwwzi` FOREIGN KEY (`elementId`) REFERENCES `cc1_elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `cc1_fk_lhtsgdozmyvzwzughamwffvxudoxyggbpxmx` FOREIGN KEY (`structureId`) REFERENCES `cc1_structures` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cc1_structures`
--

DROP TABLE IF EXISTS `cc1_structures`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cc1_structures` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `maxLevels` smallint(6) unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `cc1_idx_nsmarquzdxvdgatsmspznlykcbhelwahizuv` (`dateDeleted`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cc1_systemmessages`
--

DROP TABLE IF EXISTS `cc1_systemmessages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cc1_systemmessages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `language` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `key` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `subject` text COLLATE utf8_unicode_ci NOT NULL,
  `body` text COLLATE utf8_unicode_ci NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `cc1_idx_birdighsinetgqylosgccqjhlisgowptcdvp` (`key`,`language`),
  KEY `cc1_idx_vdhbjynhevtkyiztgxgmpdopvnyzycxydvfv` (`language`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cc1_taggroups`
--

DROP TABLE IF EXISTS `cc1_taggroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cc1_taggroups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `cc1_idx_pcfpglqdnseqqzrudmlqxjssdrgiqscdllaw` (`name`),
  KEY `cc1_idx_txnbnvcifjpevkkjrvapcgkhwcfnzjoqutpm` (`handle`),
  KEY `cc1_idx_ykfyrbftjbvcdteejupqpocepgwpqssddnmn` (`dateDeleted`),
  KEY `cc1_fk_lolqkbhnpuhavvuphimoimlbejjvzwnergdb` (`fieldLayoutId`),
  CONSTRAINT `cc1_fk_lolqkbhnpuhavvuphimoimlbejjvzwnergdb` FOREIGN KEY (`fieldLayoutId`) REFERENCES `cc1_fieldlayouts` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cc1_tags`
--

DROP TABLE IF EXISTS `cc1_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cc1_tags` (
  `id` int(11) NOT NULL,
  `groupId` int(11) NOT NULL,
  `deletedWithGroup` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `cc1_idx_ptlxkwauhgwgqbxzjjspxcdvopaijicxfpkk` (`groupId`),
  CONSTRAINT `cc1_fk_giefzdoxpxxxrxnbjspxacudtwncsxrdlmzc` FOREIGN KEY (`id`) REFERENCES `cc1_elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `cc1_fk_iksjqzprwnirsbwdudynwvlklnybbxhmklod` FOREIGN KEY (`groupId`) REFERENCES `cc1_taggroups` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cc1_templatecacheelements`
--

DROP TABLE IF EXISTS `cc1_templatecacheelements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cc1_templatecacheelements` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cacheId` int(11) NOT NULL,
  `elementId` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `cc1_idx_slslmsyyxjrgojspgttkrfeyhyfriwomkyig` (`cacheId`),
  KEY `cc1_idx_zlliztljepydoqlzmbyqekyvuzmntzumezbw` (`elementId`),
  CONSTRAINT `cc1_fk_ecknauougxwgrxxsybsybzmmhmfgvbmhwaim` FOREIGN KEY (`cacheId`) REFERENCES `cc1_templatecaches` (`id`) ON DELETE CASCADE,
  CONSTRAINT `cc1_fk_uwvqmcwvjuqkwamtyagcablxuevaofcdgmma` FOREIGN KEY (`elementId`) REFERENCES `cc1_elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cc1_templatecachequeries`
--

DROP TABLE IF EXISTS `cc1_templatecachequeries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cc1_templatecachequeries` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cacheId` int(11) NOT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `query` longtext COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `cc1_idx_xniltyokkmjszcfwgxkysgbopeqekhlvwpxf` (`cacheId`),
  KEY `cc1_idx_ybgrtahnmbtbkznaetcoequjzepprfljnyyq` (`type`),
  CONSTRAINT `cc1_fk_xywjiuxrxlwvkeibadrpfvosuektkqepfhsb` FOREIGN KEY (`cacheId`) REFERENCES `cc1_templatecaches` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cc1_templatecaches`
--

DROP TABLE IF EXISTS `cc1_templatecaches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cc1_templatecaches` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `siteId` int(11) NOT NULL,
  `cacheKey` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `path` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `expiryDate` datetime NOT NULL,
  `body` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `cc1_idx_zfmavfqatqzllvygofedczyxzetxlbujqujy` (`cacheKey`,`siteId`,`expiryDate`,`path`),
  KEY `cc1_idx_xmirqtjiitomixxzjyfitujitcrynsuqnsif` (`cacheKey`,`siteId`,`expiryDate`),
  KEY `cc1_idx_nkfgfsbjmdsugqvrbgaaplxawjaecqgcketm` (`siteId`),
  CONSTRAINT `cc1_fk_schgrhqfvtrdsyfxbgvpeiwkbmwtmjztblfm` FOREIGN KEY (`siteId`) REFERENCES `cc1_sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cc1_tokens`
--

DROP TABLE IF EXISTS `cc1_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cc1_tokens` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `token` char(32) COLLATE utf8_unicode_ci NOT NULL,
  `route` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `usageLimit` tinyint(3) unsigned DEFAULT NULL,
  `usageCount` tinyint(3) unsigned DEFAULT NULL,
  `expiryDate` datetime NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `cc1_idx_nwcrwvcrhbvrkviqwvdadkoyyigtznkdmukz` (`token`),
  KEY `cc1_idx_vwaopihygbfljtfpmkoheosqbiswbawefrwh` (`expiryDate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cc1_usergroups`
--

DROP TABLE IF EXISTS `cc1_usergroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cc1_usergroups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `cc1_idx_oylzzimimbhqppywywfehaniwfrmqdlqyigw` (`handle`),
  KEY `cc1_idx_byhbnmmapwygorwyeasigniobusfwfhbenhh` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cc1_usergroups_users`
--

DROP TABLE IF EXISTS `cc1_usergroups_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cc1_usergroups_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `groupId` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `cc1_idx_enpovnrxdcbqanrpsbwtahezgwjhixqwgtre` (`groupId`,`userId`),
  KEY `cc1_idx_zpmhbulrfwiqkpksxzhbscocqwtpajjpxjgw` (`userId`),
  CONSTRAINT `cc1_fk_gfrzfravaokzxzjtwjxelvlsoqgnbuiczbfx` FOREIGN KEY (`groupId`) REFERENCES `cc1_usergroups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `cc1_fk_kkglootpjzomzznjmcuxuzcxlsgiaxagxzyt` FOREIGN KEY (`userId`) REFERENCES `cc1_users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cc1_userpermissions`
--

DROP TABLE IF EXISTS `cc1_userpermissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cc1_userpermissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `cc1_idx_pdefsntzszvfyiahwirmjcahcirrsabndmdc` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cc1_userpermissions_usergroups`
--

DROP TABLE IF EXISTS `cc1_userpermissions_usergroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cc1_userpermissions_usergroups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `permissionId` int(11) NOT NULL,
  `groupId` int(11) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `cc1_idx_eceiqidmrfmsnxjliivrvitcgzvyepctnyfz` (`permissionId`,`groupId`),
  KEY `cc1_idx_zpfdqiqkxmnoaezemwsnakiieeoggomeuvnr` (`groupId`),
  CONSTRAINT `cc1_fk_aiqjorilfnwmwdeeeiviafqznfijfubgahho` FOREIGN KEY (`groupId`) REFERENCES `cc1_usergroups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `cc1_fk_cpeuanbwzbdrnyxtwoxhzaomcwmdwifgvuxu` FOREIGN KEY (`permissionId`) REFERENCES `cc1_userpermissions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cc1_userpermissions_users`
--

DROP TABLE IF EXISTS `cc1_userpermissions_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cc1_userpermissions_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `permissionId` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `cc1_idx_rohwnlxgggqtrypradwaohjyjayppmsckwdy` (`permissionId`,`userId`),
  KEY `cc1_idx_wmjtjpojvownfgucsleztmuamnosuujvyeza` (`userId`),
  CONSTRAINT `cc1_fk_ocaxmfguyuzljzletdcvhruedfmalmpyidhe` FOREIGN KEY (`permissionId`) REFERENCES `cc1_userpermissions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `cc1_fk_qkfbizibuinomtqklcruyaxzkzunaebmjldu` FOREIGN KEY (`userId`) REFERENCES `cc1_users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cc1_userpreferences`
--

DROP TABLE IF EXISTS `cc1_userpreferences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cc1_userpreferences` (
  `userId` int(11) NOT NULL AUTO_INCREMENT,
  `preferences` text COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`userId`),
  CONSTRAINT `cc1_fk_eczndggfrnpeqaqfhshwqyioepgdzossyzwg` FOREIGN KEY (`userId`) REFERENCES `cc1_users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cc1_users`
--

DROP TABLE IF EXISTS `cc1_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cc1_users` (
  `id` int(11) NOT NULL,
  `username` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `photoId` int(11) DEFAULT NULL,
  `firstName` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lastName` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `admin` tinyint(1) NOT NULL DEFAULT 0,
  `locked` tinyint(1) NOT NULL DEFAULT 0,
  `suspended` tinyint(1) NOT NULL DEFAULT 0,
  `pending` tinyint(1) NOT NULL DEFAULT 0,
  `lastLoginDate` datetime DEFAULT NULL,
  `lastLoginAttemptIp` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `invalidLoginWindowStart` datetime DEFAULT NULL,
  `invalidLoginCount` tinyint(3) unsigned DEFAULT NULL,
  `lastInvalidLoginDate` datetime DEFAULT NULL,
  `lockoutDate` datetime DEFAULT NULL,
  `hasDashboard` tinyint(1) NOT NULL DEFAULT 0,
  `verificationCode` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `verificationCodeIssuedDate` datetime DEFAULT NULL,
  `unverifiedEmail` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `passwordResetRequired` tinyint(1) NOT NULL DEFAULT 0,
  `lastPasswordChangeDate` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `cc1_idx_drdmvrtposurwjbprswyagtaowhdpbjrxjvz` (`uid`),
  KEY `cc1_idx_xflkwmvqahkppiycsxciurwvnhilepvwyqfp` (`verificationCode`),
  KEY `cc1_idx_hqdludobnrpewfcnamrfcoxiqsuuonqqudwv` (`email`),
  KEY `cc1_idx_pxplfcchhnpukrpuuqxeylpqypjbtugwtqyv` (`username`),
  KEY `cc1_fk_dlnbnzckubfhyylmnvlyrouhajyyubzhigpy` (`photoId`),
  CONSTRAINT `cc1_fk_dlnbnzckubfhyylmnvlyrouhajyyubzhigpy` FOREIGN KEY (`photoId`) REFERENCES `cc1_assets` (`id`) ON DELETE SET NULL,
  CONSTRAINT `cc1_fk_eojtemnisyttvbwrntkyjcgzcmyfcorjcpti` FOREIGN KEY (`id`) REFERENCES `cc1_elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cc1_volumefolders`
--

DROP TABLE IF EXISTS `cc1_volumefolders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cc1_volumefolders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parentId` int(11) DEFAULT NULL,
  `volumeId` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `path` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `cc1_idx_jirvsplhnmnpieniruaerokehdvflnvmazhu` (`name`,`parentId`,`volumeId`),
  KEY `cc1_idx_fgitylbrpqryulhphunpdmpsejkepfxvmhhs` (`parentId`),
  KEY `cc1_idx_pucptmbuncuaiydhbddztieppltxkitebhnq` (`volumeId`),
  CONSTRAINT `cc1_fk_elyiryfccqszdxrgaftmryyfeyccsbsytmki` FOREIGN KEY (`volumeId`) REFERENCES `cc1_volumes` (`id`) ON DELETE CASCADE,
  CONSTRAINT `cc1_fk_zecltaodkwpeszoplxawhhaasiskmwkuwbev` FOREIGN KEY (`parentId`) REFERENCES `cc1_volumefolders` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cc1_volumes`
--

DROP TABLE IF EXISTS `cc1_volumes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cc1_volumes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `hasUrls` tinyint(1) NOT NULL DEFAULT 1,
  `url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `titleTranslationMethod` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'site',
  `titleTranslationKeyFormat` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `settings` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `cc1_idx_crmwookliyzerrzkuxrzllseuxcistjmjiui` (`name`),
  KEY `cc1_idx_edwlfkuweknwbczqonzbntqiadeazsjpemck` (`handle`),
  KEY `cc1_idx_rrguivtjsmeudmqfnnancxnztcpgyqgffrzq` (`fieldLayoutId`),
  KEY `cc1_idx_vpcuztzovcydsflpywlamxphbvfxloisptbv` (`dateDeleted`),
  CONSTRAINT `cc1_fk_drbnbsjctbqonhwljtgithnebqbwxslgdsdg` FOREIGN KEY (`fieldLayoutId`) REFERENCES `cc1_fieldlayouts` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cc1_widgets`
--

DROP TABLE IF EXISTS `cc1_widgets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cc1_widgets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `colspan` tinyint(3) DEFAULT NULL,
  `settings` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT 1,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `cc1_idx_uixjvjmoqmqztjarmzpgqlwmswxslqossxbj` (`userId`),
  CONSTRAINT `cc1_fk_caogfqgihgryrxrnflxuwqueyzpesypdonjq` FOREIGN KEY (`userId`) REFERENCES `cc1_users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping routines for database 'base-craft-3-7'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-08-23 14:59:04
-- MariaDB dump 10.19  Distrib 10.5.9-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: 127.0.0.1    Database: base-craft-3-7
-- ------------------------------------------------------
-- Server version	10.5.9-MariaDB-1:10.5.9+maria~focal

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Dumping data for table `cc1_announcements`
--

LOCK TABLES `cc1_announcements` WRITE;
/*!40000 ALTER TABLE `cc1_announcements` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `cc1_announcements` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `cc1_assets`
--

LOCK TABLES `cc1_assets` WRITE;
/*!40000 ALTER TABLE `cc1_assets` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `cc1_assets` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `cc1_assettransforms`
--

LOCK TABLES `cc1_assettransforms` WRITE;
/*!40000 ALTER TABLE `cc1_assettransforms` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `cc1_assettransforms` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `cc1_categories`
--

LOCK TABLES `cc1_categories` WRITE;
/*!40000 ALTER TABLE `cc1_categories` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `cc1_categories` VALUES (4,1,NULL,NULL,'2022-08-23 12:59:33','2022-08-23 12:59:33','f0b4e7e7-aab2-44d5-98d9-911c347b9e4e');
/*!40000 ALTER TABLE `cc1_categories` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `cc1_categorygroups`
--

LOCK TABLES `cc1_categorygroups` WRITE;
/*!40000 ALTER TABLE `cc1_categorygroups` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `cc1_categorygroups` VALUES (1,1,1,'User type','userType','end','2022-08-23 11:12:14','2022-08-23 11:12:14',NULL,'83e3ba4a-e673-4499-bad1-7b8a299d1fcd');
/*!40000 ALTER TABLE `cc1_categorygroups` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `cc1_categorygroups_sites`
--

LOCK TABLES `cc1_categorygroups_sites` WRITE;
/*!40000 ALTER TABLE `cc1_categorygroups_sites` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `cc1_categorygroups_sites` VALUES (1,1,1,0,NULL,NULL,'2022-08-23 11:12:14','2022-08-23 11:12:14','f9439577-e80b-4e6a-b4fb-a79cc51b869c');
/*!40000 ALTER TABLE `cc1_categorygroups_sites` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `cc1_changedattributes`
--

LOCK TABLES `cc1_changedattributes` WRITE;
/*!40000 ALTER TABLE `cc1_changedattributes` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `cc1_changedattributes` VALUES (6,1,'slug','2022-08-23 13:45:37',0,1),(6,1,'title','2022-08-23 13:45:37',0,1),(6,1,'uri','2022-08-23 13:45:37',0,1);
/*!40000 ALTER TABLE `cc1_changedattributes` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `cc1_changedfields`
--

LOCK TABLES `cc1_changedfields` WRITE;
/*!40000 ALTER TABLE `cc1_changedfields` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `cc1_changedfields` VALUES (6,1,6,'2022-08-23 13:47:44',0,1),(6,1,7,'2022-08-23 13:48:20',0,1);
/*!40000 ALTER TABLE `cc1_changedfields` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `cc1_content`
--

LOCK TABLES `cc1_content` WRITE;
/*!40000 ALTER TABLE `cc1_content` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `cc1_content` VALUES (1,1,1,NULL,'2022-08-22 16:17:34','2022-08-22 16:17:34','77dd2235-e4ee-4e75-87f8-fceb1db1a17b',NULL,NULL,NULL,NULL),(2,2,1,'Homepage','2022-08-23 12:55:37','2022-08-23 12:55:37','38b72486-f130-4b78-b1b6-c678de82b502',NULL,NULL,NULL,NULL),(3,3,1,'Homepage','2022-08-23 12:55:37','2022-08-23 12:55:37','8407f804-ef03-4ccf-a2db-4cfa02008c63',NULL,NULL,NULL,NULL),(4,4,1,'Default','2022-08-23 12:59:33','2022-08-23 12:59:33','6a98666c-666e-4cb5-bda9-b4cb7caef33e',NULL,NULL,NULL,NULL),(5,5,1,NULL,'2022-08-23 13:20:33','2022-08-23 13:20:33','841644b7-fa44-4d7a-8fe5-35696d050b16',NULL,NULL,NULL,NULL),(6,6,1,'An page','2022-08-23 13:45:34','2022-08-23 13:48:23','935ab61b-0264-499b-b0f5-11710a0979b6',NULL,NULL,NULL,NULL),(7,10,1,'An page','2022-08-23 13:48:23','2022-08-23 13:48:23','9d2fc4ec-3646-41a0-8afc-03364502ec4a',NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `cc1_content` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `cc1_craftidtokens`
--

LOCK TABLES `cc1_craftidtokens` WRITE;
/*!40000 ALTER TABLE `cc1_craftidtokens` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `cc1_craftidtokens` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `cc1_deprecationerrors`
--

LOCK TABLES `cc1_deprecationerrors` WRITE;
/*!40000 ALTER TABLE `cc1_deprecationerrors` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `cc1_deprecationerrors` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `cc1_drafts`
--

LOCK TABLES `cc1_drafts` WRITE;
/*!40000 ALTER TABLE `cc1_drafts` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `cc1_drafts` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `cc1_elementindexsettings`
--

LOCK TABLES `cc1_elementindexsettings` WRITE;
/*!40000 ALTER TABLE `cc1_elementindexsettings` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `cc1_elementindexsettings` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `cc1_elements`
--

LOCK TABLES `cc1_elements` WRITE;
/*!40000 ALTER TABLE `cc1_elements` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `cc1_elements` VALUES (1,NULL,NULL,NULL,NULL,'craft\\elements\\User',1,0,'2022-08-22 16:17:34','2022-08-22 16:17:34',NULL,NULL,'110340f7-6ea6-4065-a692-1e26b48842be'),(2,NULL,NULL,NULL,5,'craft\\elements\\Entry',1,0,'2022-08-23 12:55:37','2022-08-23 12:55:37',NULL,NULL,'8cb67754-601c-4550-beca-021e4e39fd7e'),(3,2,NULL,1,5,'craft\\elements\\Entry',1,0,'2022-08-23 12:55:37','2022-08-23 12:55:37',NULL,NULL,'9063bd59-6da7-4a7a-ba88-6c3a2ac898de'),(4,NULL,NULL,NULL,1,'craft\\elements\\Category',1,0,'2022-08-23 12:59:33','2022-08-23 12:59:33',NULL,NULL,'a433131b-5d81-4101-9d25-da36df341a9d'),(5,NULL,NULL,NULL,17,'craft\\elements\\GlobalSet',1,0,'2022-08-23 13:20:33','2022-08-23 13:20:33',NULL,NULL,'dbd7d37e-0873-49b0-98f1-55781824edef'),(6,NULL,NULL,NULL,6,'craft\\elements\\Entry',1,0,'2022-08-23 13:45:34','2022-08-23 13:48:23',NULL,NULL,'df715ada-b034-4b0c-ac43-d203979df6bf'),(7,NULL,NULL,NULL,9,'craft\\elements\\MatrixBlock',1,0,'2022-08-23 13:47:38','2022-08-23 13:47:38',NULL,'2022-08-23 13:47:58','896149b3-3f03-422c-94cd-3acf89056fc9'),(8,NULL,NULL,NULL,9,'craft\\elements\\MatrixBlock',1,0,'2022-08-23 13:47:58','2022-08-23 13:47:58',NULL,'2022-08-23 13:48:20','4aada779-b434-4962-910d-0da6ef524afe'),(9,NULL,NULL,NULL,9,'craft\\elements\\MatrixBlock',1,0,'2022-08-23 13:48:20','2022-08-23 13:48:20',NULL,NULL,'ba31aa02-e250-448f-835a-dfae6bd60a10'),(10,6,NULL,2,6,'craft\\elements\\Entry',1,0,'2022-08-23 13:48:23','2022-08-23 13:48:23',NULL,NULL,'333637a6-809b-4c46-954a-5ebb4201be0d'),(11,9,NULL,NULL,9,'craft\\elements\\MatrixBlock',1,0,'2022-08-23 13:48:23','2022-08-23 13:48:23',NULL,NULL,'8dde170a-3f2c-4ca0-b00e-8d6718be1ca9');
/*!40000 ALTER TABLE `cc1_elements` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `cc1_elements_sites`
--

LOCK TABLES `cc1_elements_sites` WRITE;
/*!40000 ALTER TABLE `cc1_elements_sites` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `cc1_elements_sites` VALUES (1,1,1,NULL,NULL,1,'2022-08-22 16:17:34','2022-08-22 16:17:34','0b346d02-89a8-44c7-ba9b-296b8979946a'),(2,2,1,'homepage','__home__',1,'2022-08-23 12:55:37','2022-08-23 12:55:37','beb4e6e5-3780-4da4-869e-85a39bd22046'),(3,3,1,'homepage','__home__',1,'2022-08-23 12:55:37','2022-08-23 12:55:37','80e8cada-aca2-499a-9aa0-0f32de62c6f4'),(4,4,1,'default',NULL,1,'2022-08-23 12:59:33','2022-08-23 12:59:34','d5f6f75d-7589-4257-ac50-6ff833016fad'),(5,5,1,NULL,NULL,1,'2022-08-23 13:20:33','2022-08-23 13:20:33','96d0798a-72e7-4361-8f11-02a8aff6e4a8'),(6,6,1,'an-page','an-page',1,'2022-08-23 13:45:34','2022-08-23 13:45:37','3e2b7544-06ee-4d58-8f60-f10ec97b2e82'),(7,7,1,NULL,NULL,1,'2022-08-23 13:47:38','2022-08-23 13:47:38','4cefa114-40ea-4280-bc2b-18d959e910d9'),(8,8,1,NULL,NULL,1,'2022-08-23 13:47:58','2022-08-23 13:47:58','54fcae69-45ac-4bf8-8a08-9505a055fdea'),(9,9,1,NULL,NULL,1,'2022-08-23 13:48:20','2022-08-23 13:48:20','8d233640-d584-4698-9e30-b93b12df57f2'),(10,10,1,'an-page','an-page',1,'2022-08-23 13:48:23','2022-08-23 13:48:23','424c0cb8-7340-4122-af62-0a45753c6359'),(11,11,1,NULL,NULL,1,'2022-08-23 13:48:23','2022-08-23 13:48:23','30e27863-a597-458d-8c62-04db2d9e855a');
/*!40000 ALTER TABLE `cc1_elements_sites` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `cc1_entries`
--

LOCK TABLES `cc1_entries` WRITE;
/*!40000 ALTER TABLE `cc1_entries` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `cc1_entries` VALUES (2,1,NULL,1,NULL,'2022-08-23 12:55:00',NULL,NULL,'2022-08-23 12:55:37','2022-08-23 12:55:37','14774a42-29f4-4974-a672-ba2a976f143a'),(3,1,NULL,1,NULL,'2022-08-23 12:55:00',NULL,NULL,'2022-08-23 12:55:37','2022-08-23 12:55:37','4a33433a-ba8c-4e3f-aba9-85a05f1170cd'),(6,2,NULL,2,1,'2022-08-23 13:45:00',NULL,NULL,'2022-08-23 13:45:34','2022-08-23 13:45:34','b79a6017-0d6d-4cf6-a769-f70affac39c3'),(10,2,NULL,2,1,'2022-08-23 13:45:00',NULL,NULL,'2022-08-23 13:48:23','2022-08-23 13:48:23','72bb7ccf-423c-4786-a322-b6b2f4fb99ce');
/*!40000 ALTER TABLE `cc1_entries` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `cc1_entrytypes`
--

LOCK TABLES `cc1_entrytypes` WRITE;
/*!40000 ALTER TABLE `cc1_entrytypes` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `cc1_entrytypes` VALUES (1,1,5,'Homepage','homepage',0,'site',NULL,'{section.name|raw}',1,'2022-08-23 12:55:37','2022-08-23 12:55:37',NULL,'54fed815-9bb9-483f-a524-5b5463b9d832'),(2,2,6,'Default','default',1,'site',NULL,NULL,1,'2022-08-23 12:58:58','2022-08-23 12:58:58',NULL,'ea4ed368-2494-42d5-b84c-8beb1242dff5');
/*!40000 ALTER TABLE `cc1_entrytypes` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `cc1_fieldgroups`
--

LOCK TABLES `cc1_fieldgroups` WRITE;
/*!40000 ALTER TABLE `cc1_fieldgroups` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `cc1_fieldgroups` VALUES (1,'Common','2022-08-22 16:17:34','2022-08-22 16:17:34',NULL,'02ae1ee2-06d8-4df2-9fd3-b8f86587e78e'),(2,'Meta','2022-08-23 11:08:19','2022-08-23 11:08:19',NULL,'a448fcce-1054-44de-ae1d-54931eab4ed5');
/*!40000 ALTER TABLE `cc1_fieldgroups` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `cc1_fieldlayoutfields`
--

LOCK TABLES `cc1_fieldlayoutfields` WRITE;
/*!40000 ALTER TABLE `cc1_fieldlayoutfields` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `cc1_fieldlayoutfields` VALUES (35,7,18,9,1,0,'2022-08-23 13:19:33','2022-08-23 13:19:33','3be58a5b-d54f-454d-8fd7-62bd9b35a42a'),(36,7,18,8,1,1,'2022-08-23 13:19:33','2022-08-23 13:19:33','f6ea3070-17ee-4189-a807-9d29c7f2318b'),(37,8,19,10,1,0,'2022-08-23 13:19:33','2022-08-23 13:19:33','fd242db9-c2b1-4714-9f59-a0a0ac9c4b53'),(38,8,19,12,0,1,'2022-08-23 13:19:33','2022-08-23 13:19:33','fd11588c-3931-47ed-836e-ebf3d108ea84'),(39,8,19,11,1,2,'2022-08-23 13:19:33','2022-08-23 13:19:33','27d1b758-79be-4c7c-82f2-ecb1812f849d'),(40,9,20,14,1,0,'2022-08-23 13:19:33','2022-08-23 13:19:33','f1378c66-ffe2-4301-a0ca-2e5e1d5998a7'),(41,9,20,42,1,1,'2022-08-23 13:19:33','2022-08-23 13:19:33','dbc3a276-f8af-483e-ad19-2d93a8b8f7f0'),(42,9,20,13,0,2,'2022-08-23 13:19:33','2022-08-23 13:19:33','251166a6-e900-481c-b5d4-46ca82bb315d'),(43,10,21,15,1,0,'2022-08-23 13:19:33','2022-08-23 13:19:33','f7b1da73-b791-45e2-8f9a-1d5cbd30a57a'),(44,10,21,18,1,1,'2022-08-23 13:19:33','2022-08-23 13:19:33','dde29efc-f593-4ccf-ae00-1fed928251a2'),(45,10,21,17,1,2,'2022-08-23 13:19:33','2022-08-23 13:19:33','f5e4e727-aab4-4928-9e84-a433c2c972a1'),(46,10,21,16,0,3,'2022-08-23 13:19:33','2022-08-23 13:19:33','6319cd78-7090-48ef-8c2d-f75ac08928e2'),(47,11,22,20,1,0,'2022-08-23 13:19:33','2022-08-23 13:19:33','6723c992-515f-4eef-a0f0-4c1fd50caac8'),(48,11,22,21,1,1,'2022-08-23 13:19:33','2022-08-23 13:19:33','b76db0f3-bcba-43e9-9cad-06469f925f90'),(49,11,22,23,1,2,'2022-08-23 13:19:33','2022-08-23 13:19:33','e469f17e-ab6e-46da-ae40-63874e4bce27'),(50,11,22,19,0,3,'2022-08-23 13:19:33','2022-08-23 13:19:33','db53d95d-03be-48da-9af0-c1e823adb041'),(51,11,22,22,0,4,'2022-08-23 13:19:33','2022-08-23 13:19:33','c328ead2-991e-4483-b543-a35f74f4833b'),(52,12,23,24,1,0,'2022-08-23 13:19:33','2022-08-23 13:19:33','83b5ff8f-3ecd-497d-855e-6e98068d22e5'),(53,12,23,29,0,1,'2022-08-23 13:19:33','2022-08-23 13:19:33','d418e5cb-9321-4a36-94fd-02e15a5855a7'),(54,12,23,26,0,2,'2022-08-23 13:19:33','2022-08-23 13:19:33','aa469090-a315-46f7-8135-524c5f665e71'),(55,12,23,27,0,3,'2022-08-23 13:19:33','2022-08-23 13:19:33','987e5bb8-63ef-40d6-beef-6787a04b88cd'),(56,12,23,25,0,4,'2022-08-23 13:19:33','2022-08-23 13:19:33','518ea190-4627-462a-af01-0c5c9ae9a1f9'),(57,12,23,28,0,5,'2022-08-23 13:19:33','2022-08-23 13:19:33','59e969d0-b2cf-462d-87d3-9f1336abecc5'),(58,13,24,30,1,0,'2022-08-23 13:19:33','2022-08-23 13:19:33','b287431a-7e36-41f1-911d-84d539525920'),(59,13,24,31,1,1,'2022-08-23 13:19:33','2022-08-23 13:19:33','5801bc8a-4f0c-4339-9d3b-674285dc004a'),(60,13,24,32,0,2,'2022-08-23 13:19:33','2022-08-23 13:19:33','458d710a-3899-4527-83e9-1f68535e8374'),(61,15,25,38,1,0,'2022-08-23 13:19:33','2022-08-23 13:19:33','682daa6d-9759-43db-bdab-ab81d4947021'),(62,15,25,37,1,1,'2022-08-23 13:19:33','2022-08-23 13:19:33','1ca4f6de-feb2-4711-8e16-c71a88d9ff52'),(63,15,25,36,0,2,'2022-08-23 13:19:33','2022-08-23 13:19:33','88ee1437-e59e-4450-9f9f-64faf0b1a981'),(64,16,26,41,1,0,'2022-08-23 13:19:33','2022-08-23 13:19:33','9b02a625-b16d-454b-9c7d-f9cba0a643fd'),(65,16,26,40,1,1,'2022-08-23 13:19:33','2022-08-23 13:19:33','d65b1eb0-48aa-4091-ae42-dfa78035f8c6'),(66,16,26,39,0,2,'2022-08-23 13:19:33','2022-08-23 13:19:33','c2994fdb-3c72-4216-b38e-26a2923fc56a'),(67,17,27,1,0,0,'2022-08-23 13:20:33','2022-08-23 13:20:33','9d026317-2f1c-4323-b89b-24babde9172a'),(68,6,28,7,0,1,'2022-08-23 13:46:47','2022-08-23 13:46:47','7e5f9d3f-1524-46b1-a139-dbcc964794fc'),(69,6,28,6,0,2,'2022-08-23 13:46:47','2022-08-23 13:46:47','115ce809-4958-416a-a0f7-e2e5e894b9c8'),(70,6,29,4,0,0,'2022-08-23 13:46:47','2022-08-23 13:46:47','c9625a73-998a-4b46-a8be-5c8d1a9617dd'),(71,6,29,2,0,1,'2022-08-23 13:46:47','2022-08-23 13:46:47','0f422c11-04e6-4976-a6c2-f6549ccc49df'),(72,6,29,3,0,2,'2022-08-23 13:46:47','2022-08-23 13:46:47','48edd082-6b23-4272-848f-d36ebf4adc8d'),(73,6,29,5,0,3,'2022-08-23 13:46:47','2022-08-23 13:46:47','815a1d16-f624-468f-8984-4f6ed3a296db');
/*!40000 ALTER TABLE `cc1_fieldlayoutfields` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `cc1_fieldlayouts`
--

LOCK TABLES `cc1_fieldlayouts` WRITE;
/*!40000 ALTER TABLE `cc1_fieldlayouts` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `cc1_fieldlayouts` VALUES (1,'craft\\elements\\Category','2022-08-23 11:12:14','2022-08-23 11:12:14',NULL,'ab6f49ac-dd9d-4e51-bd45-3bd8b96a8f61'),(2,'craft\\elements\\Asset','2022-08-23 11:20:24','2022-08-23 11:20:24',NULL,'cd2c5243-28d7-4a4a-8b22-97c4f6b8a046'),(3,'craft\\elements\\Asset','2022-08-23 12:52:41','2022-08-23 12:52:41',NULL,'2f9920f1-3d2a-48c3-96c1-2c56ea8ddb4f'),(4,'craft\\elements\\Asset','2022-08-23 12:53:48','2022-08-23 12:53:48',NULL,'3f07e9c3-c2b1-4b04-8587-5ac1af9c43c3'),(5,'craft\\elements\\Entry','2022-08-23 12:55:37','2022-08-23 12:55:37',NULL,'b3acc2e5-325e-4815-9c5e-74409e6d6ef2'),(6,'craft\\elements\\Entry','2022-08-23 12:58:58','2022-08-23 12:58:58',NULL,'877fddc6-e24c-4f2f-b694-40cda55d7cce'),(7,'craft\\elements\\MatrixBlock','2022-08-23 13:10:48','2022-08-23 13:10:48',NULL,'294472ca-be68-4e8f-8e5c-da291a90c918'),(8,'craft\\elements\\MatrixBlock','2022-08-23 13:10:48','2022-08-23 13:10:48',NULL,'3dff6724-0d2e-42af-a8b9-f5d9513ae3ef'),(9,'craft\\elements\\MatrixBlock','2022-08-23 13:10:48','2022-08-23 13:10:48',NULL,'8b7f0b54-ce93-4615-847e-039794f3ec57'),(10,'craft\\elements\\MatrixBlock','2022-08-23 13:10:48','2022-08-23 13:10:48',NULL,'737c9845-37bd-4b93-9d31-fd4c3e428a8d'),(11,'craft\\elements\\MatrixBlock','2022-08-23 13:10:48','2022-08-23 13:10:48',NULL,'e82eee47-f866-49ad-bbd4-8108d09e11b2'),(12,'craft\\elements\\MatrixBlock','2022-08-23 13:10:49','2022-08-23 13:10:49',NULL,'e504e0b8-00fd-449e-92d9-963e62f32e3b'),(13,'craft\\elements\\MatrixBlock','2022-08-23 13:10:49','2022-08-23 13:10:49',NULL,'144f3c22-3170-4ad3-8eb2-3d2f12cc6f19'),(14,'craft\\elements\\MatrixBlock','2022-08-23 13:10:49','2022-08-23 13:10:49','2022-08-23 13:19:33','f0866511-0250-491a-a44c-b2f7b6e97a3d'),(15,'craft\\elements\\MatrixBlock','2022-08-23 13:10:49','2022-08-23 13:10:49',NULL,'4ad2d562-7edb-4800-9f5e-743ccc4bd6d3'),(16,'craft\\elements\\MatrixBlock','2022-08-23 13:10:49','2022-08-23 13:10:49',NULL,'451bb070-c3f9-460c-97fe-e82f279bdadf'),(17,'craft\\elements\\GlobalSet','2022-08-23 13:20:33','2022-08-23 13:20:33',NULL,'9b32d9a9-a7a7-4255-98a1-8a73316100c8');
/*!40000 ALTER TABLE `cc1_fieldlayouts` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `cc1_fieldlayouttabs`
--

LOCK TABLES `cc1_fieldlayouttabs` WRITE;
/*!40000 ALTER TABLE `cc1_fieldlayouttabs` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `cc1_fieldlayouttabs` VALUES (1,1,'Content','[{\"type\":\"craft\\\\fieldlayoutelements\\\\TitleField\",\"autocomplete\":false,\"class\":null,\"size\":null,\"name\":null,\"autocorrect\":true,\"autocapitalize\":true,\"disabled\":false,\"readonly\":false,\"title\":null,\"placeholder\":null,\"step\":null,\"min\":null,\"max\":null,\"requirable\":false,\"id\":null,\"containerAttributes\":[],\"inputContainerAttributes\":[],\"labelAttributes\":[],\"orientation\":null,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"width\":100}]',1,'2022-08-23 11:12:14','2022-08-23 11:12:14','02fc1202-1136-47ec-9d45-a49f91ebfeff'),(2,2,'Content','[{\"type\":\"craft\\\\fieldlayoutelements\\\\AssetTitleField\",\"autocomplete\":false,\"class\":null,\"size\":null,\"name\":null,\"autocorrect\":true,\"autocapitalize\":true,\"disabled\":false,\"readonly\":false,\"title\":null,\"placeholder\":null,\"step\":null,\"min\":null,\"max\":null,\"requirable\":false,\"id\":null,\"containerAttributes\":[],\"inputContainerAttributes\":[],\"labelAttributes\":[],\"orientation\":null,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"width\":100}]',1,'2022-08-23 11:20:24','2022-08-23 11:20:24','60ff264f-a0d9-49ea-bf76-ac86479b0efc'),(4,4,'Content','[{\"type\":\"craft\\\\fieldlayoutelements\\\\AssetTitleField\",\"autocomplete\":false,\"class\":null,\"size\":null,\"name\":null,\"autocorrect\":true,\"autocapitalize\":true,\"disabled\":false,\"readonly\":false,\"title\":null,\"placeholder\":null,\"step\":null,\"min\":null,\"max\":null,\"requirable\":false,\"id\":null,\"containerAttributes\":[],\"inputContainerAttributes\":[],\"labelAttributes\":[],\"orientation\":null,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"width\":100}]',1,'2022-08-23 12:53:48','2022-08-23 12:53:48','50003a28-cd05-47e1-a173-0bc286f1b200'),(5,3,'Content','[{\"type\":\"craft\\\\fieldlayoutelements\\\\AssetTitleField\",\"autocomplete\":false,\"class\":null,\"size\":null,\"name\":null,\"autocorrect\":true,\"autocapitalize\":true,\"disabled\":false,\"readonly\":false,\"title\":null,\"placeholder\":null,\"step\":null,\"min\":null,\"max\":null,\"requirable\":false,\"id\":null,\"containerAttributes\":[],\"inputContainerAttributes\":[],\"labelAttributes\":[],\"orientation\":null,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"width\":100}]',1,'2022-08-23 12:54:07','2022-08-23 12:54:07','d7e7de8f-ed6c-4e71-837f-9e81cc9b93f7'),(6,5,'Content','[{\"type\":\"craft\\\\fieldlayoutelements\\\\EntryTitleField\",\"autocomplete\":false,\"class\":null,\"size\":null,\"name\":null,\"autocorrect\":true,\"autocapitalize\":true,\"disabled\":false,\"readonly\":false,\"title\":null,\"placeholder\":null,\"step\":null,\"min\":null,\"max\":null,\"requirable\":false,\"id\":null,\"containerAttributes\":[],\"inputContainerAttributes\":[],\"labelAttributes\":[],\"orientation\":null,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"width\":100}]',1,'2022-08-23 12:55:37','2022-08-23 12:55:37','c023f566-0a4b-4cd6-bb47-7c0e18222b8e'),(15,14,'Content','[{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":true,\"width\":100,\"fieldUid\":\"524e99c9-ec21-4c44-a82b-e9a5a50e87f7\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"c8f56181-ee4f-48ff-9f39-0c43c1e1ff9e\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"bf0b1bf7-8d2f-4617-be38-8620e347009f\"}]',1,'2022-08-23 13:10:49','2022-08-23 13:10:49','6b678450-520a-4bf8-b70a-d410995b7fed'),(18,7,'Content','[{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":true,\"width\":100,\"fieldUid\":\"aa3c0a64-212a-41e0-8de7-b38bea6cd6d5\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":true,\"width\":100,\"fieldUid\":\"3befc80f-8166-44e4-af10-24bb521cd51a\"}]',1,'2022-08-23 13:19:33','2022-08-23 13:19:33','5519709f-6589-4842-91f1-94fed4d9c71c'),(19,8,'Content','[{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":true,\"width\":100,\"fieldUid\":\"a3389b6c-3c44-4d2e-92b7-9acea68eb89a\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"fe7f27d0-4eb4-4b8e-b7f2-2811cb5ec628\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":true,\"width\":100,\"fieldUid\":\"b6ed882c-7f7d-4f25-a47b-1582b73222eb\"}]',1,'2022-08-23 13:19:33','2022-08-23 13:19:33','48789ad5-11a5-4b52-984c-76c672e200a9'),(20,9,'Content','[{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":true,\"width\":100,\"fieldUid\":\"c14b2c7a-f075-42ac-a27a-626b0354f3dd\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":true,\"width\":100,\"fieldUid\":\"ea33628d-a48f-4bd5-9b85-71027daf9e78\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"7ed32bef-623e-42e1-9d39-f0d17d46e90e\"}]',1,'2022-08-23 13:19:33','2022-08-23 13:19:33','2b1a6f35-825a-423f-bbe9-2359397b54c4'),(21,10,'Content','[{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":true,\"width\":100,\"fieldUid\":\"98ba90d6-c4e0-4165-8a65-cfe75da45067\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":true,\"width\":100,\"fieldUid\":\"eeea89ef-7322-4496-8d2c-fbfcd389a19a\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":true,\"width\":100,\"fieldUid\":\"b2855976-f3ec-4276-9d7e-59ddee4961f2\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"23957a29-2d27-416d-8e13-e090279313f3\"}]',1,'2022-08-23 13:19:33','2022-08-23 13:19:33','7d37b805-8838-4ac6-ae31-5ab43893a192'),(22,11,'Content','[{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":true,\"width\":100,\"fieldUid\":\"7de3ab69-d443-4205-8f66-2a048e8e1ed2\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":true,\"width\":100,\"fieldUid\":\"919ad539-6911-45ac-bc4b-042df36b0ab2\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":true,\"width\":100,\"fieldUid\":\"cafd3db0-3c9e-4eac-a922-f672ad5ef6d1\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"00ae21ee-87ea-48ed-990e-409f6da72d17\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"a9870b66-a3e3-4fe6-b828-0c252b0e4187\"}]',1,'2022-08-23 13:19:33','2022-08-23 13:19:33','e130a694-680b-48ee-abd3-5ee79a68b91b'),(23,12,'Content','[{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":true,\"width\":100,\"fieldUid\":\"1ea724df-ade0-49e2-af62-b1a2a65c08cc\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"cfedab0d-6899-463e-a413-aad6ae194e73\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"6f1f8583-ac69-4eee-9a18-b836be8d0c7a\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"039c016d-2191-4827-bd8f-5ba356dc009f\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"6e658ce8-9b41-4d68-8472-d17816861e32\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"737dbb58-826d-411f-9708-03124661ee3b\"}]',1,'2022-08-23 13:19:33','2022-08-23 13:19:33','1b7e54e3-531c-4f5f-9cf0-e909c949183e'),(24,13,'Content','[{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":true,\"width\":100,\"fieldUid\":\"0c534d0c-c78f-413b-9525-0435ae1dc0e1\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":true,\"width\":100,\"fieldUid\":\"8f0cb1cd-4bd3-41db-85e3-fd7868cf17ff\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"d02b1c70-59a5-4c84-bbc4-ba09ea0b50d3\"}]',1,'2022-08-23 13:19:33','2022-08-23 13:19:33','fe58c98b-7855-4c0d-8896-b1961d2d78b3'),(25,15,'Content','[{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":true,\"width\":100,\"fieldUid\":\"3748f7bb-9550-4669-9be0-c771a7d47f6d\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":true,\"width\":100,\"fieldUid\":\"537c59a7-3dfb-4e2c-9ca1-74c8fa834cf3\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"19b73e72-72de-4895-ae29-6dd3671e0ef1\"}]',1,'2022-08-23 13:19:33','2022-08-23 13:19:33','a708b66a-50ce-4ef9-9df6-513b3f33430b'),(26,16,'Content','[{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":true,\"width\":100,\"fieldUid\":\"e64e80d6-6ff4-417f-817c-9af8c0f34d3e\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":true,\"width\":100,\"fieldUid\":\"75e9cb54-9d9f-469f-ba67-8efd8e45a8b1\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"2f8b915c-c957-4e3b-87f9-e26e50f68bfe\"}]',1,'2022-08-23 13:19:33','2022-08-23 13:19:33','aef467f5-f817-4278-a03c-9276e94772f0'),(27,17,'Default','[{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"1f6b9b21-7a47-49f5-8b5b-cc04eaf5a698\"}]',1,'2022-08-23 13:20:33','2022-08-23 13:20:33','1acba155-7ec3-41c2-b1b8-0a4eac721a90'),(28,6,'Content','[{\"type\":\"craft\\\\fieldlayoutelements\\\\EntryTitleField\",\"autocomplete\":false,\"class\":null,\"size\":null,\"name\":null,\"autocorrect\":true,\"autocapitalize\":true,\"disabled\":false,\"readonly\":false,\"title\":null,\"placeholder\":null,\"step\":null,\"min\":null,\"max\":null,\"requirable\":false,\"id\":null,\"containerAttributes\":[],\"inputContainerAttributes\":[],\"labelAttributes\":[],\"orientation\":null,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"width\":100},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"157f1dd3-6182-4ac8-b27f-1119802aa09c\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"b541b12e-a2a1-4306-ae4c-e9f81c5ac527\"}]',1,'2022-08-23 13:46:47','2022-08-23 13:46:47','fd508318-cd6a-41a5-a20e-0ebbe1e23b5e'),(29,6,'Meta','[{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"8fa978ce-5d99-438e-9d4b-00e1b997eb00\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"79971a57-3c66-489d-8525-5fe7b382b60e\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"2c888abb-0df7-4e6b-901e-38785688e035\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"fb9f5d17-da5f-4281-83fe-daac141b28c1\"}]',2,'2022-08-23 13:46:47','2022-08-23 13:46:47','6293b867-e797-4a4e-80fe-4af145a20225');
/*!40000 ALTER TABLE `cc1_fieldlayouttabs` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `cc1_fields`
--

LOCK TABLES `cc1_fields` WRITE;
/*!40000 ALTER TABLE `cc1_fields` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `cc1_fields` VALUES (1,2,'GA Key','googleAnalyticsKey','global','kzjsmnwd','',0,'none',NULL,'craft\\fields\\PlainText','{\"byteLimit\":null,\"charLimit\":null,\"code\":\"\",\"columnType\":null,\"initialRows\":4,\"multiline\":\"\",\"placeholder\":null,\"uiMode\":\"normal\"}','2022-08-23 13:08:06','2022-08-23 13:08:06','1f6b9b21-7a47-49f5-8b5b-cc04eaf5a698'),(2,2,'Meta Description','metaDescription','global','udaibbfd','',1,'none',NULL,'craft\\fields\\PlainText','{\"byteLimit\":null,\"charLimit\":null,\"code\":\"\",\"columnType\":\"text\",\"initialRows\":4,\"multiline\":\"\",\"placeholder\":null,\"uiMode\":\"normal\"}','2022-08-23 13:08:06','2022-08-23 13:08:06','79971a57-3c66-489d-8525-5fe7b382b60e'),(3,2,'Meta Robots','metaRobots','global','iktjjput','',1,'none',NULL,'craft\\fields\\PlainText','{\"byteLimit\":null,\"charLimit\":null,\"code\":\"\",\"columnType\":\"text\",\"initialRows\":4,\"multiline\":\"\",\"placeholder\":null,\"uiMode\":\"normal\"}','2022-08-23 13:08:06','2022-08-23 13:08:06','2c888abb-0df7-4e6b-901e-38785688e035'),(4,2,'Meta Title','metaTitle','global','bunquboh','',1,'none',NULL,'craft\\fields\\PlainText','{\"byteLimit\":null,\"charLimit\":null,\"code\":\"\",\"columnType\":\"text\",\"initialRows\":4,\"multiline\":\"\",\"placeholder\":null,\"uiMode\":\"normal\"}','2022-08-23 13:08:06','2022-08-23 13:08:06','8fa978ce-5d99-438e-9d4b-00e1b997eb00'),(5,2,'Open Graph Image','openGraphImage','global',NULL,'',1,'site',NULL,'craft\\fields\\Assets','{\"allowSelfRelations\":false,\"allowUploads\":true,\"allowedKinds\":null,\"defaultUploadLocationSource\":\"\",\"defaultUploadLocationSubpath\":\"\",\"limit\":\"\",\"localizeRelations\":false,\"previewMode\":\"full\",\"restrictFiles\":\"\",\"selectionLabel\":\"\",\"showSiteMenu\":true,\"showUnpermittedFiles\":false,\"showUnpermittedVolumes\":true,\"singleUploadLocationSource\":\"\",\"singleUploadLocationSubpath\":\"\",\"source\":null,\"sources\":\"*\",\"targetSiteId\":null,\"useSingleFolder\":false,\"validateRelatedElements\":false,\"viewMode\":\"list\"}','2022-08-23 13:08:06','2022-08-23 13:08:06','fb9f5d17-da5f-4281-83fe-daac141b28c1'),(6,1,'Page Audience','pageAudience','global',NULL,'',1,'site',NULL,'craft\\fields\\Categories','{\"allowLimit\":false,\"allowMultipleSources\":false,\"allowSelfRelations\":false,\"branchLimit\":\"\",\"limit\":null,\"localizeRelations\":false,\"selectionLabel\":\"\",\"showSiteMenu\":true,\"source\":\"group:83e3ba4a-e673-4499-bad1-7b8a299d1fcd\",\"sources\":\"*\",\"targetSiteId\":null,\"validateRelatedElements\":false,\"viewMode\":null}','2022-08-23 13:08:42','2022-08-23 13:47:25','b541b12e-a2a1-4306-ae4c-e9f81c5ac527'),(7,1,'Content Blocks','contentBlocks','global',NULL,'',1,'site',NULL,'craft\\fields\\Matrix','{\"contentTable\":\"{{%matrixcontent_contentblocks}}\",\"maxBlocks\":\"\",\"minBlocks\":\"\",\"propagationKeyFormat\":null,\"propagationMethod\":\"all\"}','2022-08-23 13:10:48','2022-08-23 13:10:48','157f1dd3-6182-4ac8-b27f-1119802aa09c'),(8,NULL,'Column Class','columnClass','matrixBlockType:6c426c81-0c6b-4950-a2a4-64e97d8b6e05','jatdtiol','Input a class or string of classes in Bootstrap 12-grid syntax to define this column',1,'none',NULL,'craft\\fields\\PlainText','{\"byteLimit\":null,\"charLimit\":null,\"code\":\"\",\"columnType\":\"text\",\"initialRows\":\"4\",\"multiline\":\"\",\"placeholder\":\".col-md-6 .col-lg-4\",\"uiMode\":\"normal\"}','2022-08-23 13:10:48','2022-08-23 13:19:33','3befc80f-8166-44e4-af10-24bb521cd51a'),(9,NULL,'Audience','audience','matrixBlockType:6c426c81-0c6b-4950-a2a4-64e97d8b6e05',NULL,'',1,'site',NULL,'craft\\fields\\Categories','{\"allowLimit\":false,\"allowMultipleSources\":false,\"allowSelfRelations\":false,\"branchLimit\":\"\",\"limit\":null,\"localizeRelations\":false,\"selectionLabel\":\"\",\"showSiteMenu\":true,\"source\":\"group:83e3ba4a-e673-4499-bad1-7b8a299d1fcd\",\"sources\":\"*\",\"targetSiteId\":null,\"validateRelatedElements\":false,\"viewMode\":null}','2022-08-23 13:10:48','2022-08-23 13:19:33','aa3c0a64-212a-41e0-8de7-b38bea6cd6d5'),(10,NULL,'Audience','audience','matrixBlockType:eeec7060-b13e-40ad-8565-21374c64a879',NULL,'Choose who can see this',1,'site',NULL,'craft\\fields\\Categories','{\"allowLimit\":false,\"allowMultipleSources\":false,\"allowSelfRelations\":false,\"branchLimit\":\"\",\"limit\":null,\"localizeRelations\":false,\"selectionLabel\":\"\",\"showSiteMenu\":true,\"source\":\"group:83e3ba4a-e673-4499-bad1-7b8a299d1fcd\",\"sources\":\"*\",\"targetSiteId\":null,\"validateRelatedElements\":false,\"viewMode\":null}','2022-08-23 13:10:48','2022-08-23 13:19:33','a3389b6c-3c44-4d2e-92b7-9acea68eb89a'),(11,NULL,'Expander Attributes','expanderAttributes','matrixBlockType:eeec7060-b13e-40ad-8565-21374c64a879','grdejgvk','',1,'none',NULL,'craft\\fields\\MultiSelect','{\"multi\":true,\"optgroups\":true,\"options\":[{\"label\":\"Closes others\",\"value\":\"closesOthers\",\"default\":\"1\"},{\"label\":\"Defaults open\",\"value\":\"defaultsOpen\",\"default\":\"\"},{\"label\":\"Is endcap\",\"value\":\"isEndcap\",\"default\":\"\"}]}','2022-08-23 13:10:48','2022-08-23 13:19:33','b6ed882c-7f7d-4f25-a47b-1582b73222eb'),(12,NULL,'Expander heading','expanderHeading','matrixBlockType:eeec7060-b13e-40ad-8565-21374c64a879','njokbjtg','Heading for the expander',1,'none',NULL,'craft\\fields\\PlainText','{\"byteLimit\":null,\"charLimit\":null,\"code\":\"\",\"columnType\":\"text\",\"initialRows\":\"4\",\"multiline\":\"\",\"placeholder\":null,\"uiMode\":\"normal\"}','2022-08-23 13:10:48','2022-08-23 13:19:33','fe7f27d0-4eb4-4b8e-b7f2-2811cb5ec628'),(13,NULL,'Custom Class','customClass','matrixBlockType:9b05b02e-f98b-449e-b40f-47f0b266affd','fgviknbj','Attach one or more classes to this element separated by spaces',1,'none',NULL,'craft\\fields\\PlainText','{\"byteLimit\":null,\"charLimit\":null,\"code\":\"\",\"columnType\":\"text\",\"initialRows\":\"4\",\"multiline\":\"\",\"placeholder\":\"class-1 class-2\",\"uiMode\":\"normal\"}','2022-08-23 13:10:48','2022-08-23 13:19:33','7ed32bef-623e-42e1-9d39-f0d17d46e90e'),(14,NULL,'Audience','audience','matrixBlockType:9b05b02e-f98b-449e-b40f-47f0b266affd',NULL,'Choose who can see this',1,'site',NULL,'craft\\fields\\Categories','{\"allowLimit\":false,\"allowMultipleSources\":false,\"allowSelfRelations\":false,\"branchLimit\":\"\",\"limit\":null,\"localizeRelations\":false,\"selectionLabel\":\"\",\"showSiteMenu\":true,\"source\":\"group:83e3ba4a-e673-4499-bad1-7b8a299d1fcd\",\"sources\":\"*\",\"targetSiteId\":null,\"validateRelatedElements\":false,\"viewMode\":null}','2022-08-23 13:10:48','2022-08-23 13:19:33','c14b2c7a-f075-42ac-a27a-626b0354f3dd'),(15,NULL,'Audience','audience','matrixBlockType:affd0670-6a09-4d9a-ace6-4cb4c4087185',NULL,'Choose who can see this',1,'site',NULL,'craft\\fields\\Categories','{\"allowLimit\":false,\"allowMultipleSources\":false,\"allowSelfRelations\":false,\"branchLimit\":\"\",\"limit\":null,\"localizeRelations\":false,\"selectionLabel\":\"\",\"showSiteMenu\":true,\"source\":\"group:83e3ba4a-e673-4499-bad1-7b8a299d1fcd\",\"sources\":\"*\",\"targetSiteId\":null,\"validateRelatedElements\":false,\"viewMode\":null}','2022-08-23 13:10:48','2022-08-23 13:19:33','98ba90d6-c4e0-4165-8a65-cfe75da45067'),(16,NULL,'Custom Class','customClass','matrixBlockType:affd0670-6a09-4d9a-ace6-4cb4c4087185','kbmzzrla','Attach one or more classes to this element separated by spaces',1,'none',NULL,'craft\\fields\\PlainText','{\"byteLimit\":null,\"charLimit\":null,\"code\":\"\",\"columnType\":\"text\",\"initialRows\":\"4\",\"multiline\":\"\",\"placeholder\":\"class-1 class-2\",\"uiMode\":\"normal\"}','2022-08-23 13:10:48','2022-08-23 13:19:33','23957a29-2d27-416d-8e13-e090279313f3'),(17,NULL,'Heading Level','headingLevel','matrixBlockType:affd0670-6a09-4d9a-ace6-4cb4c4087185','gaekoolf','Choose a level from 2-6 (the page title is Heading Level 1). Sections and sub sections should be nested, e.g., Level 3s will be considered subsections of the previous Level 2.',1,'none',NULL,'craft\\fields\\Dropdown','{\"optgroups\":true,\"options\":[{\"label\":\"Level 2\",\"value\":\"h2\",\"default\":\"1\"},{\"label\":\"Level 3\",\"value\":\"h3\",\"default\":\"\"},{\"label\":\"Level 4\",\"value\":\"h4\",\"default\":\"\"},{\"label\":\"Level 5\",\"value\":\"h5\",\"default\":\"\"},{\"label\":\"Level 6\",\"value\":\"h6\",\"default\":\"\"}]}','2022-08-23 13:10:48','2022-08-23 13:19:33','b2855976-f3ec-4276-9d7e-59ddee4961f2'),(18,NULL,'Heading Text','headingText','matrixBlockType:affd0670-6a09-4d9a-ace6-4cb4c4087185','rmifqbic','',1,'none',NULL,'craft\\fields\\PlainText','{\"byteLimit\":null,\"charLimit\":null,\"code\":\"\",\"columnType\":\"text\",\"initialRows\":\"4\",\"multiline\":\"\",\"placeholder\":null,\"uiMode\":\"normal\"}','2022-08-23 13:10:48','2022-08-23 13:19:33','eeea89ef-7322-4496-8d2c-fbfcd389a19a'),(19,NULL,'Caption','caption','matrixBlockType:4bfd8fdd-073c-4e41-98dc-0970eaa3323f','bkzlphcn','Show a caption under the image. Leave blank if not required.',1,'none',NULL,'craft\\fields\\PlainText','{\"byteLimit\":null,\"charLimit\":null,\"code\":\"\",\"columnType\":\"text\",\"initialRows\":\"4\",\"multiline\":\"\",\"placeholder\":null,\"uiMode\":\"normal\"}','2022-08-23 13:10:48','2022-08-23 13:19:33','00ae21ee-87ea-48ed-990e-409f6da72d17'),(20,NULL,'Audience','audience','matrixBlockType:4bfd8fdd-073c-4e41-98dc-0970eaa3323f',NULL,'Choose who can see this',1,'site',NULL,'craft\\fields\\Categories','{\"allowLimit\":false,\"allowMultipleSources\":false,\"allowSelfRelations\":false,\"branchLimit\":\"\",\"limit\":null,\"localizeRelations\":false,\"selectionLabel\":\"\",\"showSiteMenu\":true,\"source\":\"group:83e3ba4a-e673-4499-bad1-7b8a299d1fcd\",\"sources\":\"*\",\"targetSiteId\":null,\"validateRelatedElements\":false,\"viewMode\":null}','2022-08-23 13:10:48','2022-08-23 13:19:33','7de3ab69-d443-4205-8f66-2a048e8e1ed2'),(21,NULL,'Image','image','matrixBlockType:4bfd8fdd-073c-4e41-98dc-0970eaa3323f',NULL,'',1,'site',NULL,'craft\\fields\\Assets','{\"allowSelfRelations\":false,\"allowUploads\":true,\"allowedKinds\":[\"image\"],\"defaultUploadLocationSource\":\"volume:96c744fc-87db-44dc-a086-5ae952f73fad\",\"defaultUploadLocationSubpath\":\"\",\"limit\":\"1\",\"localizeRelations\":false,\"previewMode\":\"full\",\"restrictFiles\":\"1\",\"selectionLabel\":\"\",\"showSiteMenu\":true,\"showUnpermittedFiles\":false,\"showUnpermittedVolumes\":true,\"singleUploadLocationSource\":\"volume:96c744fc-87db-44dc-a086-5ae952f73fad\",\"singleUploadLocationSubpath\":\"\",\"source\":null,\"sources\":\"*\",\"targetSiteId\":null,\"useSingleFolder\":false,\"validateRelatedElements\":false,\"viewMode\":\"large\"}','2022-08-23 13:10:48','2022-08-23 13:19:33','919ad539-6911-45ac-bc4b-042df36b0ab2'),(22,NULL,'Custom Class','customClass','matrixBlockType:4bfd8fdd-073c-4e41-98dc-0970eaa3323f','hnehkpux','Attach one or more classes to this element separated by spaces',1,'none',NULL,'craft\\fields\\PlainText','{\"byteLimit\":null,\"charLimit\":null,\"code\":\"\",\"columnType\":\"text\",\"initialRows\":\"4\",\"multiline\":\"\",\"placeholder\":\"class-1 class-2\",\"uiMode\":\"normal\"}','2022-08-23 13:10:48','2022-08-23 13:19:33','a9870b66-a3e3-4fe6-b828-0c252b0e4187'),(23,NULL,'Description','altTag','matrixBlockType:4bfd8fdd-073c-4e41-98dc-0970eaa3323f','pcjsopjy','A short description of what\'s in the image for visually impaired members.',1,'none',NULL,'craft\\fields\\PlainText','{\"byteLimit\":null,\"charLimit\":null,\"code\":\"\",\"columnType\":\"text\",\"initialRows\":\"4\",\"multiline\":\"\",\"placeholder\":null,\"uiMode\":\"normal\"}','2022-08-23 13:10:48','2022-08-23 13:19:33','cafd3db0-3c9e-4eac-a922-f672ad5ef6d1'),(24,NULL,'Audience','audience','matrixBlockType:5298d815-6445-46e7-bafa-318ec948122e',NULL,'Choose who can see this',1,'site',NULL,'craft\\fields\\Categories','{\"allowLimit\":false,\"allowMultipleSources\":false,\"allowSelfRelations\":false,\"branchLimit\":\"\",\"limit\":null,\"localizeRelations\":false,\"selectionLabel\":\"\",\"showSiteMenu\":true,\"source\":\"group:83e3ba4a-e673-4499-bad1-7b8a299d1fcd\",\"sources\":\"*\",\"targetSiteId\":null,\"validateRelatedElements\":false,\"viewMode\":null}','2022-08-23 13:10:48','2022-08-23 13:19:33','1ea724df-ade0-49e2-af62-b1a2a65c08cc'),(25,NULL,'Website','website','matrixBlockType:5298d815-6445-46e7-bafa-318ec948122e','jprpimdt','',1,'none',NULL,'craft\\fields\\PlainText','{\"byteLimit\":null,\"charLimit\":null,\"code\":\"\",\"columnType\":\"text\",\"initialRows\":\"4\",\"multiline\":\"\",\"placeholder\":null,\"uiMode\":\"normal\"}','2022-08-23 13:10:48','2022-08-23 13:19:33','6e658ce8-9b41-4d68-8472-d17816861e32'),(26,NULL,'Postal Address','postalAddress','matrixBlockType:5298d815-6445-46e7-bafa-318ec948122e','olijfakl','',1,'none',NULL,'craft\\fields\\PlainText','{\"byteLimit\":null,\"charLimit\":null,\"code\":\"\",\"columnType\":\"text\",\"initialRows\":\"5\",\"multiline\":\"1\",\"placeholder\":null,\"uiMode\":\"normal\"}','2022-08-23 13:10:48','2022-08-23 13:19:33','6f1f8583-ac69-4eee-9a18-b836be8d0c7a'),(27,NULL,'Telephone','telephone','matrixBlockType:5298d815-6445-46e7-bafa-318ec948122e','szzhvqiw','',1,'none',NULL,'craft\\fields\\PlainText','{\"byteLimit\":null,\"charLimit\":null,\"code\":\"\",\"columnType\":\"text\",\"initialRows\":\"4\",\"multiline\":\"\",\"placeholder\":null,\"uiMode\":\"normal\"}','2022-08-23 13:10:49','2022-08-23 13:19:33','039c016d-2191-4827-bd8f-5ba356dc009f'),(28,NULL,'Custom Class','customClass','matrixBlockType:5298d815-6445-46e7-bafa-318ec948122e','jtmaqxlc','Attach one or more classes to this element separated by spaces',1,'none',NULL,'craft\\fields\\PlainText','{\"byteLimit\":null,\"charLimit\":null,\"code\":\"\",\"columnType\":\"text\",\"initialRows\":\"4\",\"multiline\":\"\",\"placeholder\":\"class-1 class-2\",\"uiMode\":\"normal\"}','2022-08-23 13:10:49','2022-08-23 13:19:33','737dbb58-826d-411f-9708-03124661ee3b'),(29,NULL,'Email','email','matrixBlockType:5298d815-6445-46e7-bafa-318ec948122e','vvwczkro','',1,'none',NULL,'craft\\fields\\PlainText','{\"byteLimit\":null,\"charLimit\":null,\"code\":\"\",\"columnType\":\"text\",\"initialRows\":\"4\",\"multiline\":\"\",\"placeholder\":null,\"uiMode\":\"normal\"}','2022-08-23 13:10:49','2022-08-23 13:19:33','cfedab0d-6899-463e-a413-aad6ae194e73'),(30,NULL,'Audience','audience','matrixBlockType:8353cd85-1982-4c68-bd49-460886567421',NULL,'',1,'site',NULL,'craft\\fields\\Categories','{\"allowLimit\":false,\"allowMultipleSources\":false,\"allowSelfRelations\":false,\"branchLimit\":\"\",\"limit\":null,\"localizeRelations\":false,\"selectionLabel\":\"\",\"showSiteMenu\":true,\"source\":\"group:83e3ba4a-e673-4499-bad1-7b8a299d1fcd\",\"sources\":\"*\",\"targetSiteId\":null,\"validateRelatedElements\":false,\"viewMode\":null}','2022-08-23 13:10:49','2022-08-23 13:19:33','0c534d0c-c78f-413b-9525-0435ae1dc0e1'),(31,NULL,'Table Data','tableData','matrixBlockType:8353cd85-1982-4c68-bd49-460886567421',NULL,'Enter your table data; you can use \"null\" to merge with the preceding cell, or \"blank\" to leave a cutout where a cell would be.',1,'none',NULL,'craft\\fields\\Table','{\"addRowLabel\":\"Add a row\",\"columnType\":\"text\",\"columns\":{\"col1\":{\"heading\":\"\",\"handle\":\"\",\"width\":\"\",\"type\":\"singleline\"}},\"defaults\":[{\"col1\":\"\"}],\"maxRows\":\"\",\"minRows\":\"\"}','2022-08-23 13:10:49','2022-08-23 13:19:33','8f0cb1cd-4bd3-41db-85e3-fd7868cf17ff'),(32,NULL,'Custom Class','customClass','matrixBlockType:8353cd85-1982-4c68-bd49-460886567421','hquyacjy','Attach one or more classes to this element separated by spaces',1,'none',NULL,'craft\\fields\\PlainText','{\"byteLimit\":null,\"charLimit\":null,\"code\":\"\",\"columnType\":\"text\",\"initialRows\":\"4\",\"multiline\":\"\",\"placeholder\":\"class-1 class-2\",\"uiMode\":\"normal\"}','2022-08-23 13:10:49','2022-08-23 13:19:33','d02b1c70-59a5-4c84-bbc4-ba09ea0b50d3'),(36,NULL,'Custom Class','customClass','matrixBlockType:ddb3d9a1-9ad7-4d62-9112-c8d10720570d','ymxfkyke','Attach one or more classes to this element separated by spaces',1,'none',NULL,'craft\\fields\\PlainText','{\"byteLimit\":null,\"charLimit\":null,\"code\":\"\",\"columnType\":\"text\",\"initialRows\":\"4\",\"multiline\":\"\",\"placeholder\":\"class-1 class-2\",\"uiMode\":\"normal\"}','2022-08-23 13:10:49','2022-08-23 13:19:33','19b73e72-72de-4895-ae29-6dd3671e0ef1'),(37,NULL,'Template Name','templateName','matrixBlockType:ddb3d9a1-9ad7-4d62-9112-c8d10720570d','zkhyubqj','The file name of the desired twig template, located in templates/_custom-blocks',1,'none',NULL,'craft\\fields\\PlainText','{\"byteLimit\":null,\"charLimit\":null,\"code\":\"\",\"columnType\":\"text\",\"initialRows\":\"4\",\"multiline\":\"\",\"placeholder\":\"template-name.twig\",\"uiMode\":\"normal\"}','2022-08-23 13:10:49','2022-08-23 13:19:33','537c59a7-3dfb-4e2c-9ca1-74c8fa834cf3'),(38,NULL,'Audience','audience','matrixBlockType:ddb3d9a1-9ad7-4d62-9112-c8d10720570d',NULL,'',1,'site',NULL,'craft\\fields\\Categories','{\"allowLimit\":false,\"allowMultipleSources\":false,\"allowSelfRelations\":false,\"branchLimit\":\"\",\"limit\":null,\"localizeRelations\":false,\"selectionLabel\":\"\",\"showSiteMenu\":true,\"source\":\"group:83e3ba4a-e673-4499-bad1-7b8a299d1fcd\",\"sources\":\"*\",\"targetSiteId\":null,\"validateRelatedElements\":false,\"viewMode\":null}','2022-08-23 13:10:49','2022-08-23 13:19:33','3748f7bb-9550-4669-9be0-c771a7d47f6d'),(39,NULL,'Custom Class','customClass','matrixBlockType:7f471968-3e65-4fc9-9d7e-3dfc722653a6','mlxaxmwx','',1,'none',NULL,'craft\\fields\\PlainText','{\"byteLimit\":null,\"charLimit\":null,\"code\":\"\",\"columnType\":\"text\",\"initialRows\":\"4\",\"multiline\":\"\",\"placeholder\":null,\"uiMode\":\"normal\"}','2022-08-23 13:10:49','2022-08-23 13:19:33','2f8b915c-c957-4e3b-87f9-e26e50f68bfe'),(40,NULL,'Complex Entry','complexEntry','matrixBlockType:7f471968-3e65-4fc9-9d7e-3dfc722653a6',NULL,'',1,'site',NULL,'craft\\fields\\Entries','{\"allowSelfRelations\":false,\"limit\":\"1\",\"localizeRelations\":false,\"selectionLabel\":\"\",\"showSiteMenu\":true,\"source\":null,\"sources\":\"*\",\"targetSiteId\":null,\"validateRelatedElements\":false,\"viewMode\":null}','2022-08-23 13:10:49','2022-08-23 13:19:33','75e9cb54-9d9f-469f-ba67-8efd8e45a8b1'),(41,NULL,'Audience','audience','matrixBlockType:7f471968-3e65-4fc9-9d7e-3dfc722653a6',NULL,'',1,'site',NULL,'craft\\fields\\Categories','{\"allowLimit\":false,\"allowMultipleSources\":false,\"allowSelfRelations\":false,\"branchLimit\":\"\",\"limit\":null,\"localizeRelations\":false,\"selectionLabel\":\"\",\"showSiteMenu\":true,\"source\":\"group:83e3ba4a-e673-4499-bad1-7b8a299d1fcd\",\"sources\":\"*\",\"targetSiteId\":null,\"validateRelatedElements\":false,\"viewMode\":null}','2022-08-23 13:10:49','2022-08-23 13:19:33','e64e80d6-6ff4-417f-817c-9af8c0f34d3e'),(42,NULL,'Text','text','matrixBlockType:9b05b02e-f98b-449e-b40f-47f0b266affd','mcxqzuzy','',0,'none',NULL,'craft\\redactor\\Field','{\"availableTransforms\":\"*\",\"availableVolumes\":\"*\",\"columnType\":\"text\",\"configSelectionMode\":\"choose\",\"defaultTransform\":\"\",\"manualConfig\":\"\",\"purifierConfig\":\"\",\"purifyHtml\":\"1\",\"redactorConfig\":\"\",\"removeEmptyTags\":\"1\",\"removeInlineStyles\":\"1\",\"removeNbsp\":\"1\",\"showHtmlButtonForNonAdmins\":\"\",\"showUnpermittedFiles\":false,\"showUnpermittedVolumes\":false,\"uiMode\":\"enlarged\"}','2022-08-23 13:19:33','2022-08-23 13:19:33','ea33628d-a48f-4bd5-9b85-71027daf9e78');
/*!40000 ALTER TABLE `cc1_fields` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `cc1_globalsets`
--

LOCK TABLES `cc1_globalsets` WRITE;
/*!40000 ALTER TABLE `cc1_globalsets` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `cc1_globalsets` VALUES (5,'Global meta','globalMeta',17,1,'2022-08-23 13:20:34','2022-08-23 13:20:34','073ddf07-6d76-4737-b35b-b279ec2cc328');
/*!40000 ALTER TABLE `cc1_globalsets` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `cc1_gqlschemas`
--

LOCK TABLES `cc1_gqlschemas` WRITE;
/*!40000 ALTER TABLE `cc1_gqlschemas` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `cc1_gqlschemas` VALUES (1,'Public Schema','[]',1,'2022-08-23 14:47:45','2022-08-23 14:47:45','e2d52a34-67e1-43fb-bc4a-f58b1c1d008f');
/*!40000 ALTER TABLE `cc1_gqlschemas` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `cc1_gqltokens`
--

LOCK TABLES `cc1_gqltokens` WRITE;
/*!40000 ALTER TABLE `cc1_gqltokens` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `cc1_gqltokens` VALUES (1,'Public Token','__PUBLIC__',1,NULL,NULL,1,'2022-08-23 14:47:45','2022-08-23 14:47:45','a4833bda-e17f-4183-af70-9497e5e84623');
/*!40000 ALTER TABLE `cc1_gqltokens` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `cc1_info`
--

LOCK TABLES `cc1_info` WRITE;
/*!40000 ALTER TABLE `cc1_info` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `cc1_info` VALUES (1,'3.7.51','3.7.33',0,'ajvwkdvtddbw','3@axybkbaydq','2022-08-22 16:17:34','2022-08-23 14:48:44','20734c82-6db4-4fec-967c-d559dd3f8ec9');
/*!40000 ALTER TABLE `cc1_info` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `cc1_matrixblocks`
--

LOCK TABLES `cc1_matrixblocks` WRITE;
/*!40000 ALTER TABLE `cc1_matrixblocks` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `cc1_matrixblocks` VALUES (7,6,7,3,1,0,'2022-08-23 13:47:38','2022-08-23 13:47:38','f8fc62e6-7473-4e6d-8f23-6c53e7add5c5'),(8,6,7,3,1,0,'2022-08-23 13:47:58','2022-08-23 13:47:58','c865a8a5-28b4-4f70-ba7b-4142c41106ce'),(9,6,7,3,1,NULL,'2022-08-23 13:48:20','2022-08-23 13:48:20','dc896f77-f776-43af-b56e-07020a44acc6'),(11,10,7,3,1,NULL,'2022-08-23 13:48:23','2022-08-23 13:48:23','c0d63a87-5a12-40a9-a75a-9664dc45cec5');
/*!40000 ALTER TABLE `cc1_matrixblocks` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `cc1_matrixblocktypes`
--

LOCK TABLES `cc1_matrixblocktypes` WRITE;
/*!40000 ALTER TABLE `cc1_matrixblocktypes` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `cc1_matrixblocktypes` VALUES (1,7,7,'Column','column',1,'2022-08-23 13:10:48','2022-08-23 13:10:48','6c426c81-0c6b-4950-a2a4-64e97d8b6e05'),(2,7,8,'Expander','expander',2,'2022-08-23 13:10:48','2022-08-23 13:10:48','eeec7060-b13e-40ad-8565-21374c64a879'),(3,7,9,'Regular Copy','regularCopy',3,'2022-08-23 13:10:48','2022-08-23 13:10:48','9b05b02e-f98b-449e-b40f-47f0b266affd'),(4,7,10,'Section Heading','sectionHeading',4,'2022-08-23 13:10:48','2022-08-23 13:10:48','affd0670-6a09-4d9a-ace6-4cb4c4087185'),(5,7,11,'Regular Image','regularImage',5,'2022-08-23 13:10:48','2022-08-23 13:10:48','4bfd8fdd-073c-4e41-98dc-0970eaa3323f'),(6,7,12,'Address','address',6,'2022-08-23 13:10:49','2022-08-23 13:10:49','5298d815-6445-46e7-bafa-318ec948122e'),(7,7,13,'Table','table',7,'2022-08-23 13:10:49','2022-08-23 13:10:49','8353cd85-1982-4c68-bd49-460886567421'),(9,7,15,'Static Block','staticBlock',8,'2022-08-23 13:10:49','2022-08-23 13:19:33','ddb3d9a1-9ad7-4d62-9112-c8d10720570d'),(10,7,16,'Complex Block','complexBlock',9,'2022-08-23 13:10:49','2022-08-23 13:19:33','7f471968-3e65-4fc9-9d7e-3dfc722653a6');
/*!40000 ALTER TABLE `cc1_matrixblocktypes` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `cc1_matrixcontent_contentblocks`
--

LOCK TABLES `cc1_matrixcontent_contentblocks` WRITE;
/*!40000 ALTER TABLE `cc1_matrixcontent_contentblocks` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `cc1_matrixcontent_contentblocks` VALUES (1,7,1,'2022-08-23 13:47:38','2022-08-23 13:47:38','bc3a5dfd-5eb7-4f0a-a988-6784fc7cc702',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(2,8,1,'2022-08-23 13:47:58','2022-08-23 13:47:58','d0c7e172-d77c-4295-88c6-257e13e307da',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(3,9,1,'2022-08-23 13:48:20','2022-08-23 13:48:20','02612f9e-9faa-4673-8f16-e5a6178035e2',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>',NULL),(4,11,1,'2022-08-23 13:48:23','2022-08-23 13:48:23','c4093044-8ebb-4664-ad57-68179933babd',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>',NULL);
/*!40000 ALTER TABLE `cc1_matrixcontent_contentblocks` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `cc1_migrations`
--

LOCK TABLES `cc1_migrations` WRITE;
/*!40000 ALTER TABLE `cc1_migrations` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `cc1_migrations` VALUES (1,'craft','Install','2022-08-22 16:17:35','2022-08-22 16:17:35','2022-08-22 16:17:35','8c635eea-dcec-45f4-adc1-97dd30f5f980'),(2,'craft','m150403_183908_migrations_table_changes','2022-08-22 16:17:35','2022-08-22 16:17:35','2022-08-22 16:17:35','2c0df5e8-deaa-43f3-a9dd-016a983c5f11'),(3,'craft','m150403_184247_plugins_table_changes','2022-08-22 16:17:35','2022-08-22 16:17:35','2022-08-22 16:17:35','0f2e5a13-fa36-4cec-940a-8a9287ba6999'),(4,'craft','m150403_184533_field_version','2022-08-22 16:17:35','2022-08-22 16:17:35','2022-08-22 16:17:35','9d78d866-a5ad-47ad-bc3b-c24c33126e12'),(5,'craft','m150403_184729_type_columns','2022-08-22 16:17:35','2022-08-22 16:17:35','2022-08-22 16:17:35','61f06617-cc98-46fb-9e14-47514b3a4253'),(6,'craft','m150403_185142_volumes','2022-08-22 16:17:35','2022-08-22 16:17:35','2022-08-22 16:17:35','6c8bc23c-842a-4c8a-bacb-2af55ed2c9a9'),(7,'craft','m150428_231346_userpreferences','2022-08-22 16:17:35','2022-08-22 16:17:35','2022-08-22 16:17:35','c5b0d1e3-0785-4b6a-83b5-f63f8d01dcc5'),(8,'craft','m150519_150900_fieldversion_conversion','2022-08-22 16:17:35','2022-08-22 16:17:35','2022-08-22 16:17:35','41f6653f-6049-414e-b416-150365837477'),(9,'craft','m150617_213829_update_email_settings','2022-08-22 16:17:35','2022-08-22 16:17:35','2022-08-22 16:17:35','418ca811-03e7-49a0-90a9-d601a8156ef2'),(10,'craft','m150721_124739_templatecachequeries','2022-08-22 16:17:35','2022-08-22 16:17:35','2022-08-22 16:17:35','855157e8-f928-42fc-9f49-3abd186b7e4a'),(11,'craft','m150724_140822_adjust_quality_settings','2022-08-22 16:17:35','2022-08-22 16:17:35','2022-08-22 16:17:35','5613a9a1-e5d9-49e7-a73c-a8379b67b7af'),(12,'craft','m150815_133521_last_login_attempt_ip','2022-08-22 16:17:35','2022-08-22 16:17:35','2022-08-22 16:17:35','4a3952c7-9d10-4fd5-a434-96a56de9d588'),(13,'craft','m151002_095935_volume_cache_settings','2022-08-22 16:17:35','2022-08-22 16:17:35','2022-08-22 16:17:35','c9d25e7a-973b-466f-a4d2-e695f2a3a68e'),(14,'craft','m151005_142750_volume_s3_storage_settings','2022-08-22 16:17:35','2022-08-22 16:17:35','2022-08-22 16:17:35','22f564ef-a45f-4d35-ac8d-c833a7f8ed92'),(15,'craft','m151016_133600_delete_asset_thumbnails','2022-08-22 16:17:35','2022-08-22 16:17:35','2022-08-22 16:17:35','ac3d216a-ed6c-4085-8992-3d3686c66c9f'),(16,'craft','m151209_000000_move_logo','2022-08-22 16:17:35','2022-08-22 16:17:35','2022-08-22 16:17:35','7907eb5d-99b3-432a-aa99-8273719f0d0e'),(17,'craft','m151211_000000_rename_fileId_to_assetId','2022-08-22 16:17:35','2022-08-22 16:17:35','2022-08-22 16:17:35','012dc99a-9e7b-4b38-ad06-e53991773374'),(18,'craft','m151215_000000_rename_asset_permissions','2022-08-22 16:17:35','2022-08-22 16:17:35','2022-08-22 16:17:35','cff3208f-5b72-4c21-81b0-6826de35a501'),(19,'craft','m160707_000001_rename_richtext_assetsource_setting','2022-08-22 16:17:35','2022-08-22 16:17:35','2022-08-22 16:17:35','b649bd7b-1223-4516-8e56-e6fe29867e39'),(20,'craft','m160708_185142_volume_hasUrls_setting','2022-08-22 16:17:35','2022-08-22 16:17:35','2022-08-22 16:17:35','3bdaf4a9-0265-4ce7-9e34-f0a6b152be32'),(21,'craft','m160714_000000_increase_max_asset_filesize','2022-08-22 16:17:35','2022-08-22 16:17:35','2022-08-22 16:17:35','cf9cd8ec-84d7-47f9-beef-ecbad28e13bd'),(22,'craft','m160727_194637_column_cleanup','2022-08-22 16:17:35','2022-08-22 16:17:35','2022-08-22 16:17:35','0565e407-a9ed-46c2-b767-52c0a8f2593b'),(23,'craft','m160804_110002_userphotos_to_assets','2022-08-22 16:17:35','2022-08-22 16:17:35','2022-08-22 16:17:35','944ff1bb-24eb-4ed0-b1bb-3a2d8b179c7e'),(24,'craft','m160807_144858_sites','2022-08-22 16:17:35','2022-08-22 16:17:35','2022-08-22 16:17:35','debd6dfe-639c-46ed-a73a-ca4a1d40ba2c'),(25,'craft','m160829_000000_pending_user_content_cleanup','2022-08-22 16:17:35','2022-08-22 16:17:35','2022-08-22 16:17:35','32bb364a-62ae-4e07-b590-1f3de48f52e6'),(26,'craft','m160830_000000_asset_index_uri_increase','2022-08-22 16:17:35','2022-08-22 16:17:35','2022-08-22 16:17:35','1f51c4ed-d44c-4518-be9b-1859023d5dde'),(27,'craft','m160912_230520_require_entry_type_id','2022-08-22 16:17:35','2022-08-22 16:17:35','2022-08-22 16:17:35','1f1c9e42-6acd-4bb5-aa08-f63565730993'),(28,'craft','m160913_134730_require_matrix_block_type_id','2022-08-22 16:17:35','2022-08-22 16:17:35','2022-08-22 16:17:35','15977276-94b8-495d-82f3-cf2d5891aee5'),(29,'craft','m160920_174553_matrixblocks_owner_site_id_nullable','2022-08-22 16:17:35','2022-08-22 16:17:35','2022-08-22 16:17:35','04cc980d-4a9d-4ecf-94df-26a17105b7d2'),(30,'craft','m160920_231045_usergroup_handle_title_unique','2022-08-22 16:17:35','2022-08-22 16:17:35','2022-08-22 16:17:35','f5df2a55-6e06-4061-8bd8-4a045ca27dc5'),(31,'craft','m160925_113941_route_uri_parts','2022-08-22 16:17:35','2022-08-22 16:17:35','2022-08-22 16:17:35','7af5755b-2fc5-4a66-a23c-0f99c5dcfdb0'),(32,'craft','m161006_205918_schemaVersion_not_null','2022-08-22 16:17:35','2022-08-22 16:17:35','2022-08-22 16:17:35','bfebd1d2-1fce-44c8-af42-837bf2585dd9'),(33,'craft','m161007_130653_update_email_settings','2022-08-22 16:17:35','2022-08-22 16:17:35','2022-08-22 16:17:35','0937595c-be44-4182-a629-0a71e6e1329a'),(34,'craft','m161013_175052_newParentId','2022-08-22 16:17:35','2022-08-22 16:17:35','2022-08-22 16:17:35','b4d7aa74-a035-48f0-92a1-7c9df7aafc4c'),(35,'craft','m161021_102916_fix_recent_entries_widgets','2022-08-22 16:17:35','2022-08-22 16:17:35','2022-08-22 16:17:35','e076abf9-0dd5-4205-9ea4-4e2a6a96aca5'),(36,'craft','m161021_182140_rename_get_help_widget','2022-08-22 16:17:35','2022-08-22 16:17:35','2022-08-22 16:17:35','e76f0a94-3b3d-474f-8265-b46f986dcf84'),(37,'craft','m161025_000000_fix_char_columns','2022-08-22 16:17:35','2022-08-22 16:17:35','2022-08-22 16:17:35','edd030e7-4e0a-4088-b905-04e42b3c5b5f'),(38,'craft','m161029_124145_email_message_languages','2022-08-22 16:17:35','2022-08-22 16:17:35','2022-08-22 16:17:35','ea576a32-c642-4120-b6da-c725d019b250'),(39,'craft','m161108_000000_new_version_format','2022-08-22 16:17:35','2022-08-22 16:17:35','2022-08-22 16:17:35','3925c602-4891-4481-99bc-e569494fa539'),(40,'craft','m161109_000000_index_shuffle','2022-08-22 16:17:35','2022-08-22 16:17:35','2022-08-22 16:17:35','95ac5f8b-a727-44d9-a271-9453793356a8'),(41,'craft','m161122_185500_no_craft_app','2022-08-22 16:17:35','2022-08-22 16:17:35','2022-08-22 16:17:35','da63d795-a83c-4d90-a074-e9b666092ca5'),(42,'craft','m161125_150752_clear_urlmanager_cache','2022-08-22 16:17:35','2022-08-22 16:17:35','2022-08-22 16:17:35','a742d958-896d-434a-b908-35f76148a99d'),(43,'craft','m161220_000000_volumes_hasurl_notnull','2022-08-22 16:17:35','2022-08-22 16:17:35','2022-08-22 16:17:35','09f22d97-cda0-4919-95ed-3ae16812afc6'),(44,'craft','m170114_161144_udates_permission','2022-08-22 16:17:35','2022-08-22 16:17:35','2022-08-22 16:17:35','550d8a1c-e303-48a7-87b5-ef48182eb7c9'),(45,'craft','m170120_000000_schema_cleanup','2022-08-22 16:17:35','2022-08-22 16:17:35','2022-08-22 16:17:35','cdaecf1c-4569-42f9-bbc5-a74c656e1e28'),(46,'craft','m170126_000000_assets_focal_point','2022-08-22 16:17:35','2022-08-22 16:17:35','2022-08-22 16:17:35','784d67cd-24ec-473f-97c0-cd980b5770c3'),(47,'craft','m170206_142126_system_name','2022-08-22 16:17:35','2022-08-22 16:17:35','2022-08-22 16:17:35','504e77fb-838e-48c6-875c-b39e9cba9ad6'),(48,'craft','m170217_044740_category_branch_limits','2022-08-22 16:17:35','2022-08-22 16:17:35','2022-08-22 16:17:35','74abac08-c82e-4214-a2a4-53fdced1b132'),(49,'craft','m170217_120224_asset_indexing_columns','2022-08-22 16:17:35','2022-08-22 16:17:35','2022-08-22 16:17:35','63149451-c227-48b8-9a3d-fdba0bfecd5e'),(50,'craft','m170223_224012_plain_text_settings','2022-08-22 16:17:35','2022-08-22 16:17:35','2022-08-22 16:17:35','d4030758-3975-4df7-a8d1-d0979340e69c'),(51,'craft','m170227_120814_focal_point_percentage','2022-08-22 16:17:35','2022-08-22 16:17:35','2022-08-22 16:17:35','c07f927d-65aa-40f1-bc01-a95ded6c8ddd'),(52,'craft','m170228_171113_system_messages','2022-08-22 16:17:35','2022-08-22 16:17:35','2022-08-22 16:17:35','d02cb461-ebc0-462f-8f32-5707e215be49'),(53,'craft','m170303_140500_asset_field_source_settings','2022-08-22 16:17:35','2022-08-22 16:17:35','2022-08-22 16:17:35','7776d430-735c-45b5-a07d-f581fe074bdc'),(54,'craft','m170306_150500_asset_temporary_uploads','2022-08-22 16:17:35','2022-08-22 16:17:35','2022-08-22 16:17:35','c887a906-40f5-4e45-9ed0-fd4e91aacdd4'),(55,'craft','m170523_190652_element_field_layout_ids','2022-08-22 16:17:35','2022-08-22 16:17:35','2022-08-22 16:17:35','7ded4899-e00a-457b-80e5-61620b131a33'),(56,'craft','m170621_195237_format_plugin_handles','2022-08-22 16:17:35','2022-08-22 16:17:35','2022-08-22 16:17:35','abc96110-0a2e-44ae-8320-498654bd3f03'),(57,'craft','m170630_161027_deprecation_line_nullable','2022-08-22 16:17:35','2022-08-22 16:17:35','2022-08-22 16:17:35','8ef11f07-3e57-4c7b-b7d7-5308f801faa8'),(58,'craft','m170630_161028_deprecation_changes','2022-08-22 16:17:35','2022-08-22 16:17:35','2022-08-22 16:17:35','7e3a9846-242b-4eb5-8b4c-1b4bf7590606'),(59,'craft','m170703_181539_plugins_table_tweaks','2022-08-22 16:17:35','2022-08-22 16:17:35','2022-08-22 16:17:35','ade1c0f5-8549-4d00-b03b-ac0c35d9057c'),(60,'craft','m170704_134916_sites_tables','2022-08-22 16:17:35','2022-08-22 16:17:35','2022-08-22 16:17:35','62edd86b-fafe-4742-868e-c64ff5224066'),(61,'craft','m170706_183216_rename_sequences','2022-08-22 16:17:35','2022-08-22 16:17:35','2022-08-22 16:17:35','b4903e1d-407e-456d-9a3f-31a3436cedaa'),(62,'craft','m170707_094758_delete_compiled_traits','2022-08-22 16:17:35','2022-08-22 16:17:35','2022-08-22 16:17:35','be9dc126-bf60-4dd1-a314-36ee37bb0070'),(63,'craft','m170731_190138_drop_asset_packagist','2022-08-22 16:17:35','2022-08-22 16:17:35','2022-08-22 16:17:35','51c8953b-f6ec-4604-99a0-947f1b67085c'),(64,'craft','m170810_201318_create_queue_table','2022-08-22 16:17:35','2022-08-22 16:17:35','2022-08-22 16:17:35','3bc37060-828f-4f7a-9645-2771002ea294'),(65,'craft','m170903_192801_longblob_for_queue_jobs','2022-08-22 16:17:35','2022-08-22 16:17:35','2022-08-22 16:17:35','7f6b327e-c028-4582-9c37-9d1e08618ca0'),(66,'craft','m170914_204621_asset_cache_shuffle','2022-08-22 16:17:35','2022-08-22 16:17:35','2022-08-22 16:17:35','9f99ac95-0c87-43b2-bf79-96ee810899cc'),(67,'craft','m171011_214115_site_groups','2022-08-22 16:17:35','2022-08-22 16:17:35','2022-08-22 16:17:35','710a5ad4-c336-4879-8a77-f127362fee56'),(68,'craft','m171012_151440_primary_site','2022-08-22 16:17:35','2022-08-22 16:17:35','2022-08-22 16:17:35','ce91a2eb-4266-4410-a5e5-1849f45eda0a'),(69,'craft','m171013_142500_transform_interlace','2022-08-22 16:17:35','2022-08-22 16:17:35','2022-08-22 16:17:35','e94455ee-d497-484d-b2ed-f828365836d4'),(70,'craft','m171016_092553_drop_position_select','2022-08-22 16:17:35','2022-08-22 16:17:35','2022-08-22 16:17:35','d404c0d4-64df-46a8-a7b1-73ce24ccde51'),(71,'craft','m171016_221244_less_strict_translation_method','2022-08-22 16:17:35','2022-08-22 16:17:35','2022-08-22 16:17:35','58df0e85-b44c-402f-a5f4-82a4b33791d3'),(72,'craft','m171107_000000_assign_group_permissions','2022-08-22 16:17:35','2022-08-22 16:17:35','2022-08-22 16:17:35','ee401e72-a47c-4252-a7b3-8480be269b1c'),(73,'craft','m171117_000001_templatecache_index_tune','2022-08-22 16:17:35','2022-08-22 16:17:35','2022-08-22 16:17:35','033f058e-c335-4f98-b6a3-1570133e1f1d'),(74,'craft','m171126_105927_disabled_plugins','2022-08-22 16:17:35','2022-08-22 16:17:35','2022-08-22 16:17:35','5cebf2d6-a30a-4f1f-8165-b163b1319efd'),(75,'craft','m171130_214407_craftidtokens_table','2022-08-22 16:17:35','2022-08-22 16:17:35','2022-08-22 16:17:35','0750e946-9188-41c4-8ac4-3c66e22e1bc7'),(76,'craft','m171202_004225_update_email_settings','2022-08-22 16:17:35','2022-08-22 16:17:35','2022-08-22 16:17:35','3e01add1-d0b6-44c9-9fd4-52b2ff93551d'),(77,'craft','m171204_000001_templatecache_index_tune_deux','2022-08-22 16:17:35','2022-08-22 16:17:35','2022-08-22 16:17:35','9bd56c92-23f0-495e-a8fb-6faed574c972'),(78,'craft','m171205_130908_remove_craftidtokens_refreshtoken_column','2022-08-22 16:17:35','2022-08-22 16:17:35','2022-08-22 16:17:35','3d8a15ff-60e1-43ec-bf95-39d8e68a8349'),(79,'craft','m171218_143135_longtext_query_column','2022-08-22 16:17:35','2022-08-22 16:17:35','2022-08-22 16:17:35','b0f49ea9-b8c5-4fe4-a123-aae14af68207'),(80,'craft','m171231_055546_environment_variables_to_aliases','2022-08-22 16:17:35','2022-08-22 16:17:35','2022-08-22 16:17:35','5ad982e9-319d-4588-bf42-55f3f87b062f'),(81,'craft','m180113_153740_drop_users_archived_column','2022-08-22 16:17:35','2022-08-22 16:17:35','2022-08-22 16:17:35','0e3e4fa5-cec0-49dc-bff2-f65ed657fc90'),(82,'craft','m180122_213433_propagate_entries_setting','2022-08-22 16:17:35','2022-08-22 16:17:35','2022-08-22 16:17:35','c33abeb0-c9d4-444b-9b28-502cbef76d16'),(83,'craft','m180124_230459_fix_propagate_entries_values','2022-08-22 16:17:35','2022-08-22 16:17:35','2022-08-22 16:17:35','979ba828-3c3d-4389-b16b-bde0dcd4b5eb'),(84,'craft','m180128_235202_set_tag_slugs','2022-08-22 16:17:35','2022-08-22 16:17:35','2022-08-22 16:17:35','85556eff-3fb3-455a-abd2-0e547d2af9af'),(85,'craft','m180202_185551_fix_focal_points','2022-08-22 16:17:35','2022-08-22 16:17:35','2022-08-22 16:17:35','192042a7-2a0a-4694-ab7d-1279c9c3c62c'),(86,'craft','m180217_172123_tiny_ints','2022-08-22 16:17:35','2022-08-22 16:17:35','2022-08-22 16:17:35','c0823811-bca4-4920-a58d-dd0442e2105f'),(87,'craft','m180321_233505_small_ints','2022-08-22 16:17:35','2022-08-22 16:17:35','2022-08-22 16:17:35','5a4f4c34-6370-474c-a104-f0ed440d4e2e'),(88,'craft','m180404_182320_edition_changes','2022-08-22 16:17:35','2022-08-22 16:17:35','2022-08-22 16:17:35','407f7cef-6822-4027-8b7a-8ff5124eb11f'),(89,'craft','m180411_102218_fix_db_routes','2022-08-22 16:17:35','2022-08-22 16:17:35','2022-08-22 16:17:35','6fd401e2-0fb9-4df5-b85a-b196fce5da8e'),(90,'craft','m180416_205628_resourcepaths_table','2022-08-22 16:17:35','2022-08-22 16:17:35','2022-08-22 16:17:35','55f01699-2267-4cb7-aa46-49ce223efc5e'),(91,'craft','m180418_205713_widget_cleanup','2022-08-22 16:17:35','2022-08-22 16:17:35','2022-08-22 16:17:35','11de003a-c86f-4502-8a60-a8469d3b5a86'),(92,'craft','m180425_203349_searchable_fields','2022-08-22 16:17:35','2022-08-22 16:17:35','2022-08-22 16:17:35','dff3421d-4c94-43d4-a650-8d85b1a12f9a'),(93,'craft','m180516_153000_uids_in_field_settings','2022-08-22 16:17:35','2022-08-22 16:17:35','2022-08-22 16:17:35','bb9c1b40-e728-4403-9463-2ad698b3c562'),(94,'craft','m180517_173000_user_photo_volume_to_uid','2022-08-22 16:17:35','2022-08-22 16:17:35','2022-08-22 16:17:35','e0dfba20-2596-4f9b-830f-fd43b8740fde'),(95,'craft','m180518_173000_permissions_to_uid','2022-08-22 16:17:35','2022-08-22 16:17:35','2022-08-22 16:17:35','1d73827c-059b-4ce5-88e3-d435567eae90'),(96,'craft','m180520_173000_matrix_context_to_uids','2022-08-22 16:17:35','2022-08-22 16:17:35','2022-08-22 16:17:35','07681a0e-c755-4aaf-b78c-206e31fd9889'),(97,'craft','m180521_172900_project_config_table','2022-08-22 16:17:35','2022-08-22 16:17:35','2022-08-22 16:17:35','f7b59934-d4af-45b9-9a4a-87bbe167c9e5'),(98,'craft','m180521_173000_initial_yml_and_snapshot','2022-08-22 16:17:35','2022-08-22 16:17:35','2022-08-22 16:17:35','d2cdf9ee-a565-4267-9b76-047546cb9ef5'),(99,'craft','m180731_162030_soft_delete_sites','2022-08-22 16:17:35','2022-08-22 16:17:35','2022-08-22 16:17:35','8dca442a-cd5f-4221-b9de-53053d59e972'),(100,'craft','m180810_214427_soft_delete_field_layouts','2022-08-22 16:17:35','2022-08-22 16:17:35','2022-08-22 16:17:35','23a8f8c9-33b7-4efb-ae60-06df230caca8'),(101,'craft','m180810_214439_soft_delete_elements','2022-08-22 16:17:35','2022-08-22 16:17:35','2022-08-22 16:17:35','28627de1-86aa-4c2b-a5bc-b383edeaaea1'),(102,'craft','m180824_193422_case_sensitivity_fixes','2022-08-22 16:17:35','2022-08-22 16:17:35','2022-08-22 16:17:35','7415e649-a373-4428-a99c-3df3fdafff39'),(103,'craft','m180901_151639_fix_matrixcontent_tables','2022-08-22 16:17:35','2022-08-22 16:17:35','2022-08-22 16:17:35','36c8ce5f-a6e5-42ec-9eca-b545a9fb7d53'),(104,'craft','m180904_112109_permission_changes','2022-08-22 16:17:35','2022-08-22 16:17:35','2022-08-22 16:17:35','f4056726-4cbb-46c2-8a89-0133d5718eba'),(105,'craft','m180910_142030_soft_delete_sitegroups','2022-08-22 16:17:35','2022-08-22 16:17:35','2022-08-22 16:17:35','66be739b-c6d6-4401-be91-9245967c8151'),(106,'craft','m181011_160000_soft_delete_asset_support','2022-08-22 16:17:35','2022-08-22 16:17:35','2022-08-22 16:17:35','19b9ae1b-796f-4fe7-a371-88b4cffd1910'),(107,'craft','m181016_183648_set_default_user_settings','2022-08-22 16:17:35','2022-08-22 16:17:35','2022-08-22 16:17:35','e1ab181a-66a0-456f-9c9d-38ba95d5d559'),(108,'craft','m181017_225222_system_config_settings','2022-08-22 16:17:35','2022-08-22 16:17:35','2022-08-22 16:17:35','96b7b25c-1c9b-47b9-815a-27185d46aa5a'),(109,'craft','m181018_222343_drop_userpermissions_from_config','2022-08-22 16:17:35','2022-08-22 16:17:35','2022-08-22 16:17:35','93bbdb63-3faa-4fb7-af2c-399e0bd78406'),(110,'craft','m181029_130000_add_transforms_routes_to_config','2022-08-22 16:17:35','2022-08-22 16:17:35','2022-08-22 16:17:35','cf69e919-ae38-46fb-9227-e319eae1ed31'),(111,'craft','m181112_203955_sequences_table','2022-08-22 16:17:35','2022-08-22 16:17:35','2022-08-22 16:17:35','2858521f-aa1f-42ce-a0ed-b404ba5838c6'),(112,'craft','m181121_001712_cleanup_field_configs','2022-08-22 16:17:35','2022-08-22 16:17:35','2022-08-22 16:17:35','0811e5cc-dcec-44e4-97cc-df5731a935ee'),(113,'craft','m181128_193942_fix_project_config','2022-08-22 16:17:35','2022-08-22 16:17:35','2022-08-22 16:17:35','4f158256-f42b-4ab7-907f-5c651d6c9eed'),(114,'craft','m181130_143040_fix_schema_version','2022-08-22 16:17:35','2022-08-22 16:17:35','2022-08-22 16:17:35','eeaf37b8-678b-48b1-bf58-63dfc952ed7d'),(115,'craft','m181211_143040_fix_entry_type_uids','2022-08-22 16:17:35','2022-08-22 16:17:35','2022-08-22 16:17:35','bd00a3ae-8c77-4059-8da6-07f9cffb33c8'),(116,'craft','m181217_153000_fix_structure_uids','2022-08-22 16:17:35','2022-08-22 16:17:35','2022-08-22 16:17:35','097d5c09-4c9e-4481-8e47-e216ec71aec1'),(117,'craft','m190104_152725_store_licensed_plugin_editions','2022-08-22 16:17:35','2022-08-22 16:17:35','2022-08-22 16:17:35','eedeb478-2e96-48bf-a900-65f9ce770335'),(118,'craft','m190108_110000_cleanup_project_config','2022-08-22 16:17:35','2022-08-22 16:17:35','2022-08-22 16:17:35','cdb6c5a6-a451-4c90-b2a0-18b7cc2f8a2b'),(119,'craft','m190108_113000_asset_field_setting_change','2022-08-22 16:17:35','2022-08-22 16:17:35','2022-08-22 16:17:35','48735ca3-d251-4318-91af-34820ef707ed'),(120,'craft','m190109_172845_fix_colspan','2022-08-22 16:17:35','2022-08-22 16:17:35','2022-08-22 16:17:35','d09f17d4-693d-4a02-9ac8-41b4af50137e'),(121,'craft','m190110_150000_prune_nonexisting_sites','2022-08-22 16:17:35','2022-08-22 16:17:35','2022-08-22 16:17:35','87ec5cb8-6b39-45d0-b05c-ac58e5a48ced'),(122,'craft','m190110_214819_soft_delete_volumes','2022-08-22 16:17:35','2022-08-22 16:17:35','2022-08-22 16:17:35','40cbfdaa-6c56-49b3-9dea-dc85b33b5218'),(123,'craft','m190112_124737_fix_user_settings','2022-08-22 16:17:35','2022-08-22 16:17:35','2022-08-22 16:17:35','b99cc74a-191c-43f5-aa80-40b83c40834d'),(124,'craft','m190112_131225_fix_field_layouts','2022-08-22 16:17:35','2022-08-22 16:17:35','2022-08-22 16:17:35','e343e373-0eeb-4922-a90c-c5ddb29e8a80'),(125,'craft','m190112_201010_more_soft_deletes','2022-08-22 16:17:35','2022-08-22 16:17:35','2022-08-22 16:17:35','9737458d-84fc-4e1f-97cb-3289117241e4'),(126,'craft','m190114_143000_more_asset_field_setting_changes','2022-08-22 16:17:35','2022-08-22 16:17:35','2022-08-22 16:17:35','05fd3505-403f-4e1c-9e00-4762099ac275'),(127,'craft','m190121_120000_rich_text_config_setting','2022-08-22 16:17:35','2022-08-22 16:17:35','2022-08-22 16:17:35','00e74b65-b43b-4a0a-84e8-269d5fbd2e40'),(128,'craft','m190125_191628_fix_email_transport_password','2022-08-22 16:17:35','2022-08-22 16:17:35','2022-08-22 16:17:35','00df98fa-fabb-4434-9735-687527f2add8'),(129,'craft','m190128_181422_cleanup_volume_folders','2022-08-22 16:17:35','2022-08-22 16:17:35','2022-08-22 16:17:35','995132f9-d050-4a04-97c3-676d28a3b327'),(130,'craft','m190205_140000_fix_asset_soft_delete_index','2022-08-22 16:17:35','2022-08-22 16:17:35','2022-08-22 16:17:35','4aad50fd-221b-433f-b6de-410cae015503'),(131,'craft','m190218_143000_element_index_settings_uid','2022-08-22 16:17:35','2022-08-22 16:17:35','2022-08-22 16:17:35','d0357740-d31a-4136-931c-52567fd1c749'),(132,'craft','m190312_152740_element_revisions','2022-08-22 16:17:35','2022-08-22 16:17:35','2022-08-22 16:17:35','fb914fcd-b739-4ce8-9b46-3ee3a450e7a0'),(133,'craft','m190327_235137_propagation_method','2022-08-22 16:17:35','2022-08-22 16:17:35','2022-08-22 16:17:35','fae11c00-121c-4fb7-a3b1-8f151f832c78'),(134,'craft','m190401_223843_drop_old_indexes','2022-08-22 16:17:35','2022-08-22 16:17:35','2022-08-22 16:17:35','5f80dab8-132c-4dd0-a61c-f355ec927cab'),(135,'craft','m190416_014525_drop_unique_global_indexes','2022-08-22 16:17:35','2022-08-22 16:17:35','2022-08-22 16:17:35','8fb1381d-dc10-42ca-b09c-8f2700a7360f'),(136,'craft','m190417_085010_add_image_editor_permissions','2022-08-22 16:17:35','2022-08-22 16:17:35','2022-08-22 16:17:35','7533d183-fcfa-4a48-9747-3466066cf043'),(137,'craft','m190502_122019_store_default_user_group_uid','2022-08-22 16:17:35','2022-08-22 16:17:35','2022-08-22 16:17:35','99054ded-d376-4ed7-8f31-07b04a52027c'),(138,'craft','m190504_150349_preview_targets','2022-08-22 16:17:35','2022-08-22 16:17:35','2022-08-22 16:17:35','c4821e3b-d401-4e23-a50e-dd749c0620d7'),(139,'craft','m190516_184711_job_progress_label','2022-08-22 16:17:35','2022-08-22 16:17:35','2022-08-22 16:17:35','35e7fc9b-f719-4a0f-bb32-60329e3d62ee'),(140,'craft','m190523_190303_optional_revision_creators','2022-08-22 16:17:35','2022-08-22 16:17:35','2022-08-22 16:17:35','2dc617d7-a3c2-470f-8f7e-c1dbf5cd0deb'),(141,'craft','m190529_204501_fix_duplicate_uids','2022-08-22 16:17:35','2022-08-22 16:17:35','2022-08-22 16:17:35','148e1f7f-e3d6-4918-924c-fd61728569d7'),(142,'craft','m190605_223807_unsaved_drafts','2022-08-22 16:17:35','2022-08-22 16:17:35','2022-08-22 16:17:35','0c4213f9-3cae-45d8-9f43-3e3899978743'),(143,'craft','m190607_230042_entry_revision_error_tables','2022-08-22 16:17:35','2022-08-22 16:17:35','2022-08-22 16:17:35','e4663b9c-e23f-498b-8e2e-5c9471d50eff'),(144,'craft','m190608_033429_drop_elements_uid_idx','2022-08-22 16:17:35','2022-08-22 16:17:35','2022-08-22 16:17:35','caf55376-4f11-46e3-9b46-86c3f85324eb'),(145,'craft','m190617_164400_add_gqlschemas_table','2022-08-22 16:17:35','2022-08-22 16:17:35','2022-08-22 16:17:35','df3649d1-44a4-4223-a4a9-3ec66a2e5bb0'),(146,'craft','m190624_234204_matrix_propagation_method','2022-08-22 16:17:35','2022-08-22 16:17:35','2022-08-22 16:17:35','db7a9e00-36de-42fd-95ee-f2a65d40cc77'),(147,'craft','m190711_153020_drop_snapshots','2022-08-22 16:17:35','2022-08-22 16:17:35','2022-08-22 16:17:35','5037fddf-0e62-4fad-af5e-64e497167935'),(148,'craft','m190712_195914_no_draft_revisions','2022-08-22 16:17:35','2022-08-22 16:17:35','2022-08-22 16:17:35','dc834f5e-44a9-458b-b504-0973e79b9a82'),(149,'craft','m190723_140314_fix_preview_targets_column','2022-08-22 16:17:35','2022-08-22 16:17:35','2022-08-22 16:17:35','3aa51fec-3acc-461d-b112-135e16ffe006'),(150,'craft','m190820_003519_flush_compiled_templates','2022-08-22 16:17:35','2022-08-22 16:17:35','2022-08-22 16:17:35','96437eed-d8db-4b12-badb-9072e7644642'),(151,'craft','m190823_020339_optional_draft_creators','2022-08-22 16:17:35','2022-08-22 16:17:35','2022-08-22 16:17:35','8a255ee1-2666-4aef-a30a-2e7068d6ac39'),(152,'craft','m190913_152146_update_preview_targets','2022-08-22 16:17:35','2022-08-22 16:17:35','2022-08-22 16:17:35','ea1ef88e-68f2-4e17-b98b-e797a434a471'),(153,'craft','m191107_122000_add_gql_project_config_support','2022-08-22 16:17:35','2022-08-22 16:17:35','2022-08-22 16:17:35','3ec8caf1-207a-4e28-bab8-5ffceebefc37'),(154,'craft','m191204_085100_pack_savable_component_settings','2022-08-22 16:17:35','2022-08-22 16:17:35','2022-08-22 16:17:35','51aaaafb-1e38-4e4b-bd63-acb1aee9a922'),(155,'craft','m191206_001148_change_tracking','2022-08-22 16:17:35','2022-08-22 16:17:35','2022-08-22 16:17:35','e55135b7-0cf5-4261-b930-8f20925d582c'),(156,'craft','m191216_191635_asset_upload_tracking','2022-08-22 16:17:35','2022-08-22 16:17:35','2022-08-22 16:17:35','684d3440-22c2-4992-a7c3-a54678493563'),(157,'craft','m191222_002848_peer_asset_permissions','2022-08-22 16:17:35','2022-08-22 16:17:35','2022-08-22 16:17:35','ffaf6a34-2c31-44fd-bd0b-d8cf0adb03e7'),(158,'craft','m200127_172522_queue_channels','2022-08-22 16:17:35','2022-08-22 16:17:35','2022-08-22 16:17:35','b7a6bbf6-dc59-4c50-9f80-433595dd491b'),(159,'craft','m200211_175048_truncate_element_query_cache','2022-08-22 16:17:35','2022-08-22 16:17:35','2022-08-22 16:17:35','f722e16b-e33d-45be-8d08-fc6e2109fab5'),(160,'craft','m200213_172522_new_elements_index','2022-08-22 16:17:35','2022-08-22 16:17:35','2022-08-22 16:17:35','d905bd6a-200b-4952-9a8a-6ad6a8a722c9'),(161,'craft','m200228_195211_long_deprecation_messages','2022-08-22 16:17:35','2022-08-22 16:17:35','2022-08-22 16:17:35','2792cdfb-a348-4ef7-a059-1112c5e6c33f'),(162,'craft','m200306_054652_disabled_sites','2022-08-22 16:17:35','2022-08-22 16:17:35','2022-08-22 16:17:35','579e6edc-c20f-4e59-bd25-f1384a35889d'),(163,'craft','m200522_191453_clear_template_caches','2022-08-22 16:17:35','2022-08-22 16:17:35','2022-08-22 16:17:35','c312c68f-7c56-466b-9ace-e862c7b5f3ff'),(164,'craft','m200606_231117_migration_tracks','2022-08-22 16:17:35','2022-08-22 16:17:35','2022-08-22 16:17:35','bbf338c9-988b-4742-9aa5-26019dfa6e56'),(165,'craft','m200619_215137_title_translation_method','2022-08-22 16:17:35','2022-08-22 16:17:35','2022-08-22 16:17:35','6cb06176-ec51-4fbb-a3c5-083919d8e577'),(166,'craft','m200620_005028_user_group_descriptions','2022-08-22 16:17:35','2022-08-22 16:17:35','2022-08-22 16:17:35','87a43246-3d5a-4af0-9f5b-4f274f57934e'),(167,'craft','m200620_230205_field_layout_changes','2022-08-22 16:17:35','2022-08-22 16:17:35','2022-08-22 16:17:35','c90a0a86-50ee-4aea-b464-cfd42e4e892a'),(168,'craft','m200625_131100_move_entrytypes_to_top_project_config','2022-08-22 16:17:35','2022-08-22 16:17:35','2022-08-22 16:17:35','87d05471-532a-441a-a88d-088fd8c4500d'),(169,'craft','m200629_112700_remove_project_config_legacy_files','2022-08-22 16:17:35','2022-08-22 16:17:35','2022-08-22 16:17:35','ff9b384e-93b7-493a-82f2-1e3e0da72d05'),(170,'craft','m200630_183000_drop_configmap','2022-08-22 16:17:35','2022-08-22 16:17:35','2022-08-22 16:17:35','3d32c6c5-5c5b-4faf-af5a-727a143f974b'),(171,'craft','m200715_113400_transform_index_error_flag','2022-08-22 16:17:35','2022-08-22 16:17:35','2022-08-22 16:17:35','847a0a05-2994-4507-9ebd-fd5f302a293a'),(172,'craft','m200716_110900_replace_file_asset_permissions','2022-08-22 16:17:35','2022-08-22 16:17:35','2022-08-22 16:17:35','f730cef8-c5fb-4d66-b86b-3eb569f82a5d'),(173,'craft','m200716_153800_public_token_settings_in_project_config','2022-08-22 16:17:35','2022-08-22 16:17:35','2022-08-22 16:17:35','ce548db9-5d9c-4960-9782-7cda2bde912f'),(174,'craft','m200720_175543_drop_unique_constraints','2022-08-22 16:17:35','2022-08-22 16:17:35','2022-08-22 16:17:35','3e861d65-4f7f-4f6b-b52f-d395bd677499'),(175,'craft','m200825_051217_project_config_version','2022-08-22 16:17:35','2022-08-22 16:17:35','2022-08-22 16:17:35','28d6f811-9f90-475b-b2a5-8dca67d5ba30'),(176,'craft','m201116_190500_asset_title_translation_method','2022-08-22 16:17:35','2022-08-22 16:17:35','2022-08-22 16:17:35','15064d5e-feec-47c0-a5d0-a0045ee69dc1'),(177,'craft','m201124_003555_plugin_trials','2022-08-22 16:17:35','2022-08-22 16:17:35','2022-08-22 16:17:35','e6e37689-189f-4778-9507-7768754eef15'),(178,'craft','m210209_135503_soft_delete_field_groups','2022-08-22 16:17:35','2022-08-22 16:17:35','2022-08-22 16:17:35','6c46511f-799b-4540-9233-658ef3218f04'),(179,'craft','m210212_223539_delete_invalid_drafts','2022-08-22 16:17:35','2022-08-22 16:17:35','2022-08-22 16:17:35','03f12f59-912d-4d89-832b-d779d08cfec2'),(180,'craft','m210214_202731_track_saved_drafts','2022-08-22 16:17:35','2022-08-22 16:17:35','2022-08-22 16:17:35','dff631e0-0866-4f38-a66a-446cf82f875d'),(181,'craft','m210223_150900_add_new_element_gql_schema_components','2022-08-22 16:17:35','2022-08-22 16:17:35','2022-08-22 16:17:35','328e0634-5f3e-458a-960c-29c7f1f03610'),(182,'craft','m210302_212318_canonical_elements','2022-08-22 16:17:35','2022-08-22 16:17:35','2022-08-22 16:17:35','62db3233-601d-4e77-bf38-08cc0ac3806d'),(183,'craft','m210326_132000_invalidate_projectconfig_cache','2022-08-22 16:17:35','2022-08-22 16:17:35','2022-08-22 16:17:35','0525c9d2-df06-42f0-89d3-ab82505d76f9'),(184,'craft','m210329_214847_field_column_suffixes','2022-08-22 16:17:35','2022-08-22 16:17:35','2022-08-22 16:17:35','c988c7ab-302f-4974-8f61-013f85c9d974'),(185,'craft','m210331_220322_null_author','2022-08-22 16:17:35','2022-08-22 16:17:35','2022-08-22 16:17:35','96c3c941-b59d-4013-abb8-11dd63ab2ae8'),(186,'craft','m210405_231315_provisional_drafts','2022-08-22 16:17:35','2022-08-22 16:17:35','2022-08-22 16:17:35','16b0fa10-e2d6-4916-9a99-0b85a5289967'),(187,'craft','m210602_111300_project_config_names_in_config','2022-08-22 16:17:35','2022-08-22 16:17:35','2022-08-22 16:17:35','0389ea81-8754-452c-a051-5e8d5a2ebf6b'),(188,'craft','m210611_233510_default_placement_settings','2022-08-22 16:17:35','2022-08-22 16:17:35','2022-08-22 16:17:35','de16259b-d9df-40ad-851f-bebbbfdf5c1e'),(189,'craft','m210613_145522_sortable_global_sets','2022-08-22 16:17:35','2022-08-22 16:17:35','2022-08-22 16:17:35','01238a0e-5382-4135-bffe-34c47a753e3f'),(190,'craft','m210613_184103_announcements','2022-08-22 16:17:35','2022-08-22 16:17:35','2022-08-22 16:17:35','03aa920a-b830-467a-a4d6-91c1a026f36d'),(191,'craft','m210829_000000_element_index_tweak','2022-08-22 16:17:35','2022-08-22 16:17:35','2022-08-22 16:17:35','781a00cb-8b66-48e4-9c3f-20a9cd8b05ef'),(192,'craft','m220209_095604_add_indexes','2022-08-22 16:17:35','2022-08-22 16:17:35','2022-08-22 16:17:35','53dbfd1e-557d-4e91-9b61-9078ef10c9ca'),(193,'craft','m220214_000000_truncate_sessions','2022-08-22 16:17:35','2022-08-22 16:17:35','2022-08-22 16:17:35','b128fe3c-faee-40a8-ad74-43a91f798203'),(194,'plugin:redactor','m180430_204710_remove_old_plugins','2022-08-22 16:38:27','2022-08-22 16:38:27','2022-08-22 16:38:27','da22fd1b-9e41-4f98-9fe3-ac2d623e219e'),(195,'plugin:redactor','Install','2022-08-22 16:38:27','2022-08-22 16:38:27','2022-08-22 16:38:27','2612dcac-40e1-4b1b-ba1d-174bfca5950e'),(196,'plugin:redactor','m190225_003922_split_cleanup_html_settings','2022-08-22 16:38:27','2022-08-22 16:38:27','2022-08-22 16:38:27','fa60c50e-545f-474b-932e-c643c892398f');
/*!40000 ALTER TABLE `cc1_migrations` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `cc1_plugins`
--

LOCK TABLES `cc1_plugins` WRITE;
/*!40000 ALTER TABLE `cc1_plugins` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `cc1_plugins` VALUES (1,'redactor','2.10.10','2.3.0','unknown',NULL,'2022-08-22 16:38:27','2022-08-22 16:38:27','2022-08-23 12:51:05','816545ad-6ff5-4d6b-bfbd-1184673fa21b'),(2,'field-manager','2.2.5','1.0.0','unknown',NULL,'2022-08-22 16:42:59','2022-08-22 16:42:59','2022-08-23 12:51:05','2b42cd51-f500-4dec-98dd-a9fb95e8a516'),(3,'cookies','1.1.15','1.0.0','unknown',NULL,'2022-08-22 17:11:38','2022-08-22 17:11:38','2022-08-23 12:51:05','0678e7ea-ff73-4915-8978-0b848d81053c'),(4,'kint','2.0.0','1.0.0','unknown',NULL,'2022-08-22 17:13:01','2022-08-22 17:13:01','2022-08-23 12:51:05','5b86e9d1-b520-4730-8440-bfebb5d55414');
/*!40000 ALTER TABLE `cc1_plugins` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `cc1_projectconfig`
--

LOCK TABLES `cc1_projectconfig` WRITE;
/*!40000 ALTER TABLE `cc1_projectconfig` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `cc1_projectconfig` VALUES ('categoryGroups.83e3ba4a-e673-4499-bad1-7b8a299d1fcd.defaultPlacement','\"end\"'),('categoryGroups.83e3ba4a-e673-4499-bad1-7b8a299d1fcd.fieldLayouts.ab6f49ac-dd9d-4e51-bd45-3bd8b96a8f61.tabs.0.elements.0.autocapitalize','true'),('categoryGroups.83e3ba4a-e673-4499-bad1-7b8a299d1fcd.fieldLayouts.ab6f49ac-dd9d-4e51-bd45-3bd8b96a8f61.tabs.0.elements.0.autocomplete','false'),('categoryGroups.83e3ba4a-e673-4499-bad1-7b8a299d1fcd.fieldLayouts.ab6f49ac-dd9d-4e51-bd45-3bd8b96a8f61.tabs.0.elements.0.autocorrect','true'),('categoryGroups.83e3ba4a-e673-4499-bad1-7b8a299d1fcd.fieldLayouts.ab6f49ac-dd9d-4e51-bd45-3bd8b96a8f61.tabs.0.elements.0.class','null'),('categoryGroups.83e3ba4a-e673-4499-bad1-7b8a299d1fcd.fieldLayouts.ab6f49ac-dd9d-4e51-bd45-3bd8b96a8f61.tabs.0.elements.0.disabled','false'),('categoryGroups.83e3ba4a-e673-4499-bad1-7b8a299d1fcd.fieldLayouts.ab6f49ac-dd9d-4e51-bd45-3bd8b96a8f61.tabs.0.elements.0.id','null'),('categoryGroups.83e3ba4a-e673-4499-bad1-7b8a299d1fcd.fieldLayouts.ab6f49ac-dd9d-4e51-bd45-3bd8b96a8f61.tabs.0.elements.0.instructions','null'),('categoryGroups.83e3ba4a-e673-4499-bad1-7b8a299d1fcd.fieldLayouts.ab6f49ac-dd9d-4e51-bd45-3bd8b96a8f61.tabs.0.elements.0.label','null'),('categoryGroups.83e3ba4a-e673-4499-bad1-7b8a299d1fcd.fieldLayouts.ab6f49ac-dd9d-4e51-bd45-3bd8b96a8f61.tabs.0.elements.0.max','null'),('categoryGroups.83e3ba4a-e673-4499-bad1-7b8a299d1fcd.fieldLayouts.ab6f49ac-dd9d-4e51-bd45-3bd8b96a8f61.tabs.0.elements.0.min','null'),('categoryGroups.83e3ba4a-e673-4499-bad1-7b8a299d1fcd.fieldLayouts.ab6f49ac-dd9d-4e51-bd45-3bd8b96a8f61.tabs.0.elements.0.name','null'),('categoryGroups.83e3ba4a-e673-4499-bad1-7b8a299d1fcd.fieldLayouts.ab6f49ac-dd9d-4e51-bd45-3bd8b96a8f61.tabs.0.elements.0.orientation','null'),('categoryGroups.83e3ba4a-e673-4499-bad1-7b8a299d1fcd.fieldLayouts.ab6f49ac-dd9d-4e51-bd45-3bd8b96a8f61.tabs.0.elements.0.placeholder','null'),('categoryGroups.83e3ba4a-e673-4499-bad1-7b8a299d1fcd.fieldLayouts.ab6f49ac-dd9d-4e51-bd45-3bd8b96a8f61.tabs.0.elements.0.readonly','false'),('categoryGroups.83e3ba4a-e673-4499-bad1-7b8a299d1fcd.fieldLayouts.ab6f49ac-dd9d-4e51-bd45-3bd8b96a8f61.tabs.0.elements.0.requirable','false'),('categoryGroups.83e3ba4a-e673-4499-bad1-7b8a299d1fcd.fieldLayouts.ab6f49ac-dd9d-4e51-bd45-3bd8b96a8f61.tabs.0.elements.0.size','null'),('categoryGroups.83e3ba4a-e673-4499-bad1-7b8a299d1fcd.fieldLayouts.ab6f49ac-dd9d-4e51-bd45-3bd8b96a8f61.tabs.0.elements.0.step','null'),('categoryGroups.83e3ba4a-e673-4499-bad1-7b8a299d1fcd.fieldLayouts.ab6f49ac-dd9d-4e51-bd45-3bd8b96a8f61.tabs.0.elements.0.tip','null'),('categoryGroups.83e3ba4a-e673-4499-bad1-7b8a299d1fcd.fieldLayouts.ab6f49ac-dd9d-4e51-bd45-3bd8b96a8f61.tabs.0.elements.0.title','null'),('categoryGroups.83e3ba4a-e673-4499-bad1-7b8a299d1fcd.fieldLayouts.ab6f49ac-dd9d-4e51-bd45-3bd8b96a8f61.tabs.0.elements.0.type','\"craft\\\\fieldlayoutelements\\\\TitleField\"'),('categoryGroups.83e3ba4a-e673-4499-bad1-7b8a299d1fcd.fieldLayouts.ab6f49ac-dd9d-4e51-bd45-3bd8b96a8f61.tabs.0.elements.0.warning','null'),('categoryGroups.83e3ba4a-e673-4499-bad1-7b8a299d1fcd.fieldLayouts.ab6f49ac-dd9d-4e51-bd45-3bd8b96a8f61.tabs.0.elements.0.width','100'),('categoryGroups.83e3ba4a-e673-4499-bad1-7b8a299d1fcd.fieldLayouts.ab6f49ac-dd9d-4e51-bd45-3bd8b96a8f61.tabs.0.name','\"Content\"'),('categoryGroups.83e3ba4a-e673-4499-bad1-7b8a299d1fcd.fieldLayouts.ab6f49ac-dd9d-4e51-bd45-3bd8b96a8f61.tabs.0.sortOrder','1'),('categoryGroups.83e3ba4a-e673-4499-bad1-7b8a299d1fcd.handle','\"userType\"'),('categoryGroups.83e3ba4a-e673-4499-bad1-7b8a299d1fcd.name','\"User type\"'),('categoryGroups.83e3ba4a-e673-4499-bad1-7b8a299d1fcd.siteSettings.c2c2c3ff-8c88-483b-9945-9b90bcaff583.hasUrls','false'),('categoryGroups.83e3ba4a-e673-4499-bad1-7b8a299d1fcd.siteSettings.c2c2c3ff-8c88-483b-9945-9b90bcaff583.template','null'),('categoryGroups.83e3ba4a-e673-4499-bad1-7b8a299d1fcd.siteSettings.c2c2c3ff-8c88-483b-9945-9b90bcaff583.uriFormat','null'),('categoryGroups.83e3ba4a-e673-4499-bad1-7b8a299d1fcd.structure.maxLevels','1'),('categoryGroups.83e3ba4a-e673-4499-bad1-7b8a299d1fcd.structure.uid','\"755d7784-39ae-4331-8688-2530850577e0\"'),('dateModified','1661266124'),('email.fromEmail','\"dylan.hughes@buck.com\"'),('email.fromName','\"Concert Base Craft\"'),('email.transportType','\"craft\\\\mail\\\\transportadapters\\\\Sendmail\"'),('entryTypes.54fed815-9bb9-483f-a524-5b5463b9d832.fieldLayouts.b3acc2e5-325e-4815-9c5e-74409e6d6ef2.tabs.0.elements.0.autocapitalize','true'),('entryTypes.54fed815-9bb9-483f-a524-5b5463b9d832.fieldLayouts.b3acc2e5-325e-4815-9c5e-74409e6d6ef2.tabs.0.elements.0.autocomplete','false'),('entryTypes.54fed815-9bb9-483f-a524-5b5463b9d832.fieldLayouts.b3acc2e5-325e-4815-9c5e-74409e6d6ef2.tabs.0.elements.0.autocorrect','true'),('entryTypes.54fed815-9bb9-483f-a524-5b5463b9d832.fieldLayouts.b3acc2e5-325e-4815-9c5e-74409e6d6ef2.tabs.0.elements.0.class','null'),('entryTypes.54fed815-9bb9-483f-a524-5b5463b9d832.fieldLayouts.b3acc2e5-325e-4815-9c5e-74409e6d6ef2.tabs.0.elements.0.disabled','false'),('entryTypes.54fed815-9bb9-483f-a524-5b5463b9d832.fieldLayouts.b3acc2e5-325e-4815-9c5e-74409e6d6ef2.tabs.0.elements.0.id','null'),('entryTypes.54fed815-9bb9-483f-a524-5b5463b9d832.fieldLayouts.b3acc2e5-325e-4815-9c5e-74409e6d6ef2.tabs.0.elements.0.instructions','null'),('entryTypes.54fed815-9bb9-483f-a524-5b5463b9d832.fieldLayouts.b3acc2e5-325e-4815-9c5e-74409e6d6ef2.tabs.0.elements.0.label','null'),('entryTypes.54fed815-9bb9-483f-a524-5b5463b9d832.fieldLayouts.b3acc2e5-325e-4815-9c5e-74409e6d6ef2.tabs.0.elements.0.max','null'),('entryTypes.54fed815-9bb9-483f-a524-5b5463b9d832.fieldLayouts.b3acc2e5-325e-4815-9c5e-74409e6d6ef2.tabs.0.elements.0.min','null'),('entryTypes.54fed815-9bb9-483f-a524-5b5463b9d832.fieldLayouts.b3acc2e5-325e-4815-9c5e-74409e6d6ef2.tabs.0.elements.0.name','null'),('entryTypes.54fed815-9bb9-483f-a524-5b5463b9d832.fieldLayouts.b3acc2e5-325e-4815-9c5e-74409e6d6ef2.tabs.0.elements.0.orientation','null'),('entryTypes.54fed815-9bb9-483f-a524-5b5463b9d832.fieldLayouts.b3acc2e5-325e-4815-9c5e-74409e6d6ef2.tabs.0.elements.0.placeholder','null'),('entryTypes.54fed815-9bb9-483f-a524-5b5463b9d832.fieldLayouts.b3acc2e5-325e-4815-9c5e-74409e6d6ef2.tabs.0.elements.0.readonly','false'),('entryTypes.54fed815-9bb9-483f-a524-5b5463b9d832.fieldLayouts.b3acc2e5-325e-4815-9c5e-74409e6d6ef2.tabs.0.elements.0.requirable','false'),('entryTypes.54fed815-9bb9-483f-a524-5b5463b9d832.fieldLayouts.b3acc2e5-325e-4815-9c5e-74409e6d6ef2.tabs.0.elements.0.size','null'),('entryTypes.54fed815-9bb9-483f-a524-5b5463b9d832.fieldLayouts.b3acc2e5-325e-4815-9c5e-74409e6d6ef2.tabs.0.elements.0.step','null'),('entryTypes.54fed815-9bb9-483f-a524-5b5463b9d832.fieldLayouts.b3acc2e5-325e-4815-9c5e-74409e6d6ef2.tabs.0.elements.0.tip','null'),('entryTypes.54fed815-9bb9-483f-a524-5b5463b9d832.fieldLayouts.b3acc2e5-325e-4815-9c5e-74409e6d6ef2.tabs.0.elements.0.title','null'),('entryTypes.54fed815-9bb9-483f-a524-5b5463b9d832.fieldLayouts.b3acc2e5-325e-4815-9c5e-74409e6d6ef2.tabs.0.elements.0.type','\"craft\\\\fieldlayoutelements\\\\EntryTitleField\"'),('entryTypes.54fed815-9bb9-483f-a524-5b5463b9d832.fieldLayouts.b3acc2e5-325e-4815-9c5e-74409e6d6ef2.tabs.0.elements.0.warning','null'),('entryTypes.54fed815-9bb9-483f-a524-5b5463b9d832.fieldLayouts.b3acc2e5-325e-4815-9c5e-74409e6d6ef2.tabs.0.elements.0.width','100'),('entryTypes.54fed815-9bb9-483f-a524-5b5463b9d832.fieldLayouts.b3acc2e5-325e-4815-9c5e-74409e6d6ef2.tabs.0.name','\"Content\"'),('entryTypes.54fed815-9bb9-483f-a524-5b5463b9d832.fieldLayouts.b3acc2e5-325e-4815-9c5e-74409e6d6ef2.tabs.0.sortOrder','1'),('entryTypes.54fed815-9bb9-483f-a524-5b5463b9d832.handle','\"homepage\"'),('entryTypes.54fed815-9bb9-483f-a524-5b5463b9d832.hasTitleField','false'),('entryTypes.54fed815-9bb9-483f-a524-5b5463b9d832.name','\"Homepage\"'),('entryTypes.54fed815-9bb9-483f-a524-5b5463b9d832.section','\"90daf6c4-c1b7-4fca-9b3f-81cd5e44288d\"'),('entryTypes.54fed815-9bb9-483f-a524-5b5463b9d832.sortOrder','1'),('entryTypes.54fed815-9bb9-483f-a524-5b5463b9d832.titleFormat','\"{section.name|raw}\"'),('entryTypes.54fed815-9bb9-483f-a524-5b5463b9d832.titleTranslationKeyFormat','null'),('entryTypes.54fed815-9bb9-483f-a524-5b5463b9d832.titleTranslationMethod','\"site\"'),('entryTypes.ea4ed368-2494-42d5-b84c-8beb1242dff5.fieldLayouts.877fddc6-e24c-4f2f-b694-40cda55d7cce.tabs.0.elements.0.autocapitalize','true'),('entryTypes.ea4ed368-2494-42d5-b84c-8beb1242dff5.fieldLayouts.877fddc6-e24c-4f2f-b694-40cda55d7cce.tabs.0.elements.0.autocomplete','false'),('entryTypes.ea4ed368-2494-42d5-b84c-8beb1242dff5.fieldLayouts.877fddc6-e24c-4f2f-b694-40cda55d7cce.tabs.0.elements.0.autocorrect','true'),('entryTypes.ea4ed368-2494-42d5-b84c-8beb1242dff5.fieldLayouts.877fddc6-e24c-4f2f-b694-40cda55d7cce.tabs.0.elements.0.class','null'),('entryTypes.ea4ed368-2494-42d5-b84c-8beb1242dff5.fieldLayouts.877fddc6-e24c-4f2f-b694-40cda55d7cce.tabs.0.elements.0.disabled','false'),('entryTypes.ea4ed368-2494-42d5-b84c-8beb1242dff5.fieldLayouts.877fddc6-e24c-4f2f-b694-40cda55d7cce.tabs.0.elements.0.id','null'),('entryTypes.ea4ed368-2494-42d5-b84c-8beb1242dff5.fieldLayouts.877fddc6-e24c-4f2f-b694-40cda55d7cce.tabs.0.elements.0.instructions','null'),('entryTypes.ea4ed368-2494-42d5-b84c-8beb1242dff5.fieldLayouts.877fddc6-e24c-4f2f-b694-40cda55d7cce.tabs.0.elements.0.label','null'),('entryTypes.ea4ed368-2494-42d5-b84c-8beb1242dff5.fieldLayouts.877fddc6-e24c-4f2f-b694-40cda55d7cce.tabs.0.elements.0.max','null'),('entryTypes.ea4ed368-2494-42d5-b84c-8beb1242dff5.fieldLayouts.877fddc6-e24c-4f2f-b694-40cda55d7cce.tabs.0.elements.0.min','null'),('entryTypes.ea4ed368-2494-42d5-b84c-8beb1242dff5.fieldLayouts.877fddc6-e24c-4f2f-b694-40cda55d7cce.tabs.0.elements.0.name','null'),('entryTypes.ea4ed368-2494-42d5-b84c-8beb1242dff5.fieldLayouts.877fddc6-e24c-4f2f-b694-40cda55d7cce.tabs.0.elements.0.orientation','null'),('entryTypes.ea4ed368-2494-42d5-b84c-8beb1242dff5.fieldLayouts.877fddc6-e24c-4f2f-b694-40cda55d7cce.tabs.0.elements.0.placeholder','null'),('entryTypes.ea4ed368-2494-42d5-b84c-8beb1242dff5.fieldLayouts.877fddc6-e24c-4f2f-b694-40cda55d7cce.tabs.0.elements.0.readonly','false'),('entryTypes.ea4ed368-2494-42d5-b84c-8beb1242dff5.fieldLayouts.877fddc6-e24c-4f2f-b694-40cda55d7cce.tabs.0.elements.0.requirable','false'),('entryTypes.ea4ed368-2494-42d5-b84c-8beb1242dff5.fieldLayouts.877fddc6-e24c-4f2f-b694-40cda55d7cce.tabs.0.elements.0.size','null'),('entryTypes.ea4ed368-2494-42d5-b84c-8beb1242dff5.fieldLayouts.877fddc6-e24c-4f2f-b694-40cda55d7cce.tabs.0.elements.0.step','null'),('entryTypes.ea4ed368-2494-42d5-b84c-8beb1242dff5.fieldLayouts.877fddc6-e24c-4f2f-b694-40cda55d7cce.tabs.0.elements.0.tip','null'),('entryTypes.ea4ed368-2494-42d5-b84c-8beb1242dff5.fieldLayouts.877fddc6-e24c-4f2f-b694-40cda55d7cce.tabs.0.elements.0.title','null'),('entryTypes.ea4ed368-2494-42d5-b84c-8beb1242dff5.fieldLayouts.877fddc6-e24c-4f2f-b694-40cda55d7cce.tabs.0.elements.0.type','\"craft\\\\fieldlayoutelements\\\\EntryTitleField\"'),('entryTypes.ea4ed368-2494-42d5-b84c-8beb1242dff5.fieldLayouts.877fddc6-e24c-4f2f-b694-40cda55d7cce.tabs.0.elements.0.warning','null'),('entryTypes.ea4ed368-2494-42d5-b84c-8beb1242dff5.fieldLayouts.877fddc6-e24c-4f2f-b694-40cda55d7cce.tabs.0.elements.0.width','100'),('entryTypes.ea4ed368-2494-42d5-b84c-8beb1242dff5.fieldLayouts.877fddc6-e24c-4f2f-b694-40cda55d7cce.tabs.0.elements.1.fieldUid','\"157f1dd3-6182-4ac8-b27f-1119802aa09c\"'),('entryTypes.ea4ed368-2494-42d5-b84c-8beb1242dff5.fieldLayouts.877fddc6-e24c-4f2f-b694-40cda55d7cce.tabs.0.elements.1.instructions','null'),('entryTypes.ea4ed368-2494-42d5-b84c-8beb1242dff5.fieldLayouts.877fddc6-e24c-4f2f-b694-40cda55d7cce.tabs.0.elements.1.label','null'),('entryTypes.ea4ed368-2494-42d5-b84c-8beb1242dff5.fieldLayouts.877fddc6-e24c-4f2f-b694-40cda55d7cce.tabs.0.elements.1.required','false'),('entryTypes.ea4ed368-2494-42d5-b84c-8beb1242dff5.fieldLayouts.877fddc6-e24c-4f2f-b694-40cda55d7cce.tabs.0.elements.1.tip','null'),('entryTypes.ea4ed368-2494-42d5-b84c-8beb1242dff5.fieldLayouts.877fddc6-e24c-4f2f-b694-40cda55d7cce.tabs.0.elements.1.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('entryTypes.ea4ed368-2494-42d5-b84c-8beb1242dff5.fieldLayouts.877fddc6-e24c-4f2f-b694-40cda55d7cce.tabs.0.elements.1.warning','null'),('entryTypes.ea4ed368-2494-42d5-b84c-8beb1242dff5.fieldLayouts.877fddc6-e24c-4f2f-b694-40cda55d7cce.tabs.0.elements.1.width','100'),('entryTypes.ea4ed368-2494-42d5-b84c-8beb1242dff5.fieldLayouts.877fddc6-e24c-4f2f-b694-40cda55d7cce.tabs.0.elements.2.fieldUid','\"b541b12e-a2a1-4306-ae4c-e9f81c5ac527\"'),('entryTypes.ea4ed368-2494-42d5-b84c-8beb1242dff5.fieldLayouts.877fddc6-e24c-4f2f-b694-40cda55d7cce.tabs.0.elements.2.instructions','null'),('entryTypes.ea4ed368-2494-42d5-b84c-8beb1242dff5.fieldLayouts.877fddc6-e24c-4f2f-b694-40cda55d7cce.tabs.0.elements.2.label','null'),('entryTypes.ea4ed368-2494-42d5-b84c-8beb1242dff5.fieldLayouts.877fddc6-e24c-4f2f-b694-40cda55d7cce.tabs.0.elements.2.required','false'),('entryTypes.ea4ed368-2494-42d5-b84c-8beb1242dff5.fieldLayouts.877fddc6-e24c-4f2f-b694-40cda55d7cce.tabs.0.elements.2.tip','null'),('entryTypes.ea4ed368-2494-42d5-b84c-8beb1242dff5.fieldLayouts.877fddc6-e24c-4f2f-b694-40cda55d7cce.tabs.0.elements.2.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('entryTypes.ea4ed368-2494-42d5-b84c-8beb1242dff5.fieldLayouts.877fddc6-e24c-4f2f-b694-40cda55d7cce.tabs.0.elements.2.warning','null'),('entryTypes.ea4ed368-2494-42d5-b84c-8beb1242dff5.fieldLayouts.877fddc6-e24c-4f2f-b694-40cda55d7cce.tabs.0.elements.2.width','100'),('entryTypes.ea4ed368-2494-42d5-b84c-8beb1242dff5.fieldLayouts.877fddc6-e24c-4f2f-b694-40cda55d7cce.tabs.0.name','\"Content\"'),('entryTypes.ea4ed368-2494-42d5-b84c-8beb1242dff5.fieldLayouts.877fddc6-e24c-4f2f-b694-40cda55d7cce.tabs.0.sortOrder','1'),('entryTypes.ea4ed368-2494-42d5-b84c-8beb1242dff5.fieldLayouts.877fddc6-e24c-4f2f-b694-40cda55d7cce.tabs.1.elements.0.fieldUid','\"8fa978ce-5d99-438e-9d4b-00e1b997eb00\"'),('entryTypes.ea4ed368-2494-42d5-b84c-8beb1242dff5.fieldLayouts.877fddc6-e24c-4f2f-b694-40cda55d7cce.tabs.1.elements.0.instructions','null'),('entryTypes.ea4ed368-2494-42d5-b84c-8beb1242dff5.fieldLayouts.877fddc6-e24c-4f2f-b694-40cda55d7cce.tabs.1.elements.0.label','null'),('entryTypes.ea4ed368-2494-42d5-b84c-8beb1242dff5.fieldLayouts.877fddc6-e24c-4f2f-b694-40cda55d7cce.tabs.1.elements.0.required','false'),('entryTypes.ea4ed368-2494-42d5-b84c-8beb1242dff5.fieldLayouts.877fddc6-e24c-4f2f-b694-40cda55d7cce.tabs.1.elements.0.tip','null'),('entryTypes.ea4ed368-2494-42d5-b84c-8beb1242dff5.fieldLayouts.877fddc6-e24c-4f2f-b694-40cda55d7cce.tabs.1.elements.0.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('entryTypes.ea4ed368-2494-42d5-b84c-8beb1242dff5.fieldLayouts.877fddc6-e24c-4f2f-b694-40cda55d7cce.tabs.1.elements.0.warning','null'),('entryTypes.ea4ed368-2494-42d5-b84c-8beb1242dff5.fieldLayouts.877fddc6-e24c-4f2f-b694-40cda55d7cce.tabs.1.elements.0.width','100'),('entryTypes.ea4ed368-2494-42d5-b84c-8beb1242dff5.fieldLayouts.877fddc6-e24c-4f2f-b694-40cda55d7cce.tabs.1.elements.1.fieldUid','\"79971a57-3c66-489d-8525-5fe7b382b60e\"'),('entryTypes.ea4ed368-2494-42d5-b84c-8beb1242dff5.fieldLayouts.877fddc6-e24c-4f2f-b694-40cda55d7cce.tabs.1.elements.1.instructions','null'),('entryTypes.ea4ed368-2494-42d5-b84c-8beb1242dff5.fieldLayouts.877fddc6-e24c-4f2f-b694-40cda55d7cce.tabs.1.elements.1.label','null'),('entryTypes.ea4ed368-2494-42d5-b84c-8beb1242dff5.fieldLayouts.877fddc6-e24c-4f2f-b694-40cda55d7cce.tabs.1.elements.1.required','false'),('entryTypes.ea4ed368-2494-42d5-b84c-8beb1242dff5.fieldLayouts.877fddc6-e24c-4f2f-b694-40cda55d7cce.tabs.1.elements.1.tip','null'),('entryTypes.ea4ed368-2494-42d5-b84c-8beb1242dff5.fieldLayouts.877fddc6-e24c-4f2f-b694-40cda55d7cce.tabs.1.elements.1.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('entryTypes.ea4ed368-2494-42d5-b84c-8beb1242dff5.fieldLayouts.877fddc6-e24c-4f2f-b694-40cda55d7cce.tabs.1.elements.1.warning','null'),('entryTypes.ea4ed368-2494-42d5-b84c-8beb1242dff5.fieldLayouts.877fddc6-e24c-4f2f-b694-40cda55d7cce.tabs.1.elements.1.width','100'),('entryTypes.ea4ed368-2494-42d5-b84c-8beb1242dff5.fieldLayouts.877fddc6-e24c-4f2f-b694-40cda55d7cce.tabs.1.elements.2.fieldUid','\"2c888abb-0df7-4e6b-901e-38785688e035\"'),('entryTypes.ea4ed368-2494-42d5-b84c-8beb1242dff5.fieldLayouts.877fddc6-e24c-4f2f-b694-40cda55d7cce.tabs.1.elements.2.instructions','null'),('entryTypes.ea4ed368-2494-42d5-b84c-8beb1242dff5.fieldLayouts.877fddc6-e24c-4f2f-b694-40cda55d7cce.tabs.1.elements.2.label','null'),('entryTypes.ea4ed368-2494-42d5-b84c-8beb1242dff5.fieldLayouts.877fddc6-e24c-4f2f-b694-40cda55d7cce.tabs.1.elements.2.required','false'),('entryTypes.ea4ed368-2494-42d5-b84c-8beb1242dff5.fieldLayouts.877fddc6-e24c-4f2f-b694-40cda55d7cce.tabs.1.elements.2.tip','null'),('entryTypes.ea4ed368-2494-42d5-b84c-8beb1242dff5.fieldLayouts.877fddc6-e24c-4f2f-b694-40cda55d7cce.tabs.1.elements.2.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('entryTypes.ea4ed368-2494-42d5-b84c-8beb1242dff5.fieldLayouts.877fddc6-e24c-4f2f-b694-40cda55d7cce.tabs.1.elements.2.warning','null'),('entryTypes.ea4ed368-2494-42d5-b84c-8beb1242dff5.fieldLayouts.877fddc6-e24c-4f2f-b694-40cda55d7cce.tabs.1.elements.2.width','100'),('entryTypes.ea4ed368-2494-42d5-b84c-8beb1242dff5.fieldLayouts.877fddc6-e24c-4f2f-b694-40cda55d7cce.tabs.1.elements.3.fieldUid','\"fb9f5d17-da5f-4281-83fe-daac141b28c1\"'),('entryTypes.ea4ed368-2494-42d5-b84c-8beb1242dff5.fieldLayouts.877fddc6-e24c-4f2f-b694-40cda55d7cce.tabs.1.elements.3.instructions','null'),('entryTypes.ea4ed368-2494-42d5-b84c-8beb1242dff5.fieldLayouts.877fddc6-e24c-4f2f-b694-40cda55d7cce.tabs.1.elements.3.label','null'),('entryTypes.ea4ed368-2494-42d5-b84c-8beb1242dff5.fieldLayouts.877fddc6-e24c-4f2f-b694-40cda55d7cce.tabs.1.elements.3.required','false'),('entryTypes.ea4ed368-2494-42d5-b84c-8beb1242dff5.fieldLayouts.877fddc6-e24c-4f2f-b694-40cda55d7cce.tabs.1.elements.3.tip','null'),('entryTypes.ea4ed368-2494-42d5-b84c-8beb1242dff5.fieldLayouts.877fddc6-e24c-4f2f-b694-40cda55d7cce.tabs.1.elements.3.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('entryTypes.ea4ed368-2494-42d5-b84c-8beb1242dff5.fieldLayouts.877fddc6-e24c-4f2f-b694-40cda55d7cce.tabs.1.elements.3.warning','null'),('entryTypes.ea4ed368-2494-42d5-b84c-8beb1242dff5.fieldLayouts.877fddc6-e24c-4f2f-b694-40cda55d7cce.tabs.1.elements.3.width','100'),('entryTypes.ea4ed368-2494-42d5-b84c-8beb1242dff5.fieldLayouts.877fddc6-e24c-4f2f-b694-40cda55d7cce.tabs.1.name','\"Meta\"'),('entryTypes.ea4ed368-2494-42d5-b84c-8beb1242dff5.fieldLayouts.877fddc6-e24c-4f2f-b694-40cda55d7cce.tabs.1.sortOrder','2'),('entryTypes.ea4ed368-2494-42d5-b84c-8beb1242dff5.handle','\"default\"'),('entryTypes.ea4ed368-2494-42d5-b84c-8beb1242dff5.hasTitleField','true'),('entryTypes.ea4ed368-2494-42d5-b84c-8beb1242dff5.name','\"Default\"'),('entryTypes.ea4ed368-2494-42d5-b84c-8beb1242dff5.section','\"b474e34b-1e23-4449-9c58-18e5e4ed6e47\"'),('entryTypes.ea4ed368-2494-42d5-b84c-8beb1242dff5.sortOrder','1'),('entryTypes.ea4ed368-2494-42d5-b84c-8beb1242dff5.titleFormat','null'),('entryTypes.ea4ed368-2494-42d5-b84c-8beb1242dff5.titleTranslationKeyFormat','null'),('entryTypes.ea4ed368-2494-42d5-b84c-8beb1242dff5.titleTranslationMethod','\"site\"'),('fieldGroups.02ae1ee2-06d8-4df2-9fd3-b8f86587e78e.name','\"Common\"'),('fieldGroups.a448fcce-1054-44de-ae1d-54931eab4ed5.name','\"Meta\"'),('fields.157f1dd3-6182-4ac8-b27f-1119802aa09c.columnSuffix','null'),('fields.157f1dd3-6182-4ac8-b27f-1119802aa09c.contentColumnType','\"string\"'),('fields.157f1dd3-6182-4ac8-b27f-1119802aa09c.fieldGroup','\"02ae1ee2-06d8-4df2-9fd3-b8f86587e78e\"'),('fields.157f1dd3-6182-4ac8-b27f-1119802aa09c.handle','\"contentBlocks\"'),('fields.157f1dd3-6182-4ac8-b27f-1119802aa09c.instructions','\"\"'),('fields.157f1dd3-6182-4ac8-b27f-1119802aa09c.name','\"Content Blocks\"'),('fields.157f1dd3-6182-4ac8-b27f-1119802aa09c.searchable','true'),('fields.157f1dd3-6182-4ac8-b27f-1119802aa09c.settings.contentTable','\"{{%matrixcontent_contentblocks}}\"'),('fields.157f1dd3-6182-4ac8-b27f-1119802aa09c.settings.maxBlocks','\"\"'),('fields.157f1dd3-6182-4ac8-b27f-1119802aa09c.settings.minBlocks','\"\"'),('fields.157f1dd3-6182-4ac8-b27f-1119802aa09c.settings.propagationKeyFormat','null'),('fields.157f1dd3-6182-4ac8-b27f-1119802aa09c.settings.propagationMethod','\"all\"'),('fields.157f1dd3-6182-4ac8-b27f-1119802aa09c.translationKeyFormat','null'),('fields.157f1dd3-6182-4ac8-b27f-1119802aa09c.translationMethod','\"site\"'),('fields.157f1dd3-6182-4ac8-b27f-1119802aa09c.type','\"craft\\\\fields\\\\Matrix\"'),('fields.1f6b9b21-7a47-49f5-8b5b-cc04eaf5a698.columnSuffix','\"kzjsmnwd\"'),('fields.1f6b9b21-7a47-49f5-8b5b-cc04eaf5a698.contentColumnType','\"text\"'),('fields.1f6b9b21-7a47-49f5-8b5b-cc04eaf5a698.fieldGroup','\"a448fcce-1054-44de-ae1d-54931eab4ed5\"'),('fields.1f6b9b21-7a47-49f5-8b5b-cc04eaf5a698.handle','\"googleAnalyticsKey\"'),('fields.1f6b9b21-7a47-49f5-8b5b-cc04eaf5a698.instructions','\"\"'),('fields.1f6b9b21-7a47-49f5-8b5b-cc04eaf5a698.name','\"GA Key\"'),('fields.1f6b9b21-7a47-49f5-8b5b-cc04eaf5a698.searchable','false'),('fields.1f6b9b21-7a47-49f5-8b5b-cc04eaf5a698.settings.byteLimit','null'),('fields.1f6b9b21-7a47-49f5-8b5b-cc04eaf5a698.settings.charLimit','null'),('fields.1f6b9b21-7a47-49f5-8b5b-cc04eaf5a698.settings.code','\"\"'),('fields.1f6b9b21-7a47-49f5-8b5b-cc04eaf5a698.settings.columnType','null'),('fields.1f6b9b21-7a47-49f5-8b5b-cc04eaf5a698.settings.initialRows','4'),('fields.1f6b9b21-7a47-49f5-8b5b-cc04eaf5a698.settings.multiline','\"\"'),('fields.1f6b9b21-7a47-49f5-8b5b-cc04eaf5a698.settings.placeholder','null'),('fields.1f6b9b21-7a47-49f5-8b5b-cc04eaf5a698.settings.uiMode','\"normal\"'),('fields.1f6b9b21-7a47-49f5-8b5b-cc04eaf5a698.translationKeyFormat','null'),('fields.1f6b9b21-7a47-49f5-8b5b-cc04eaf5a698.translationMethod','\"none\"'),('fields.1f6b9b21-7a47-49f5-8b5b-cc04eaf5a698.type','\"craft\\\\fields\\\\PlainText\"'),('fields.2c888abb-0df7-4e6b-901e-38785688e035.columnSuffix','\"iktjjput\"'),('fields.2c888abb-0df7-4e6b-901e-38785688e035.contentColumnType','\"text\"'),('fields.2c888abb-0df7-4e6b-901e-38785688e035.fieldGroup','\"a448fcce-1054-44de-ae1d-54931eab4ed5\"'),('fields.2c888abb-0df7-4e6b-901e-38785688e035.handle','\"metaRobots\"'),('fields.2c888abb-0df7-4e6b-901e-38785688e035.instructions','\"\"'),('fields.2c888abb-0df7-4e6b-901e-38785688e035.name','\"Meta Robots\"'),('fields.2c888abb-0df7-4e6b-901e-38785688e035.searchable','true'),('fields.2c888abb-0df7-4e6b-901e-38785688e035.settings.byteLimit','null'),('fields.2c888abb-0df7-4e6b-901e-38785688e035.settings.charLimit','null'),('fields.2c888abb-0df7-4e6b-901e-38785688e035.settings.code','\"\"'),('fields.2c888abb-0df7-4e6b-901e-38785688e035.settings.columnType','\"text\"'),('fields.2c888abb-0df7-4e6b-901e-38785688e035.settings.initialRows','4'),('fields.2c888abb-0df7-4e6b-901e-38785688e035.settings.multiline','\"\"'),('fields.2c888abb-0df7-4e6b-901e-38785688e035.settings.placeholder','null'),('fields.2c888abb-0df7-4e6b-901e-38785688e035.settings.uiMode','\"normal\"'),('fields.2c888abb-0df7-4e6b-901e-38785688e035.translationKeyFormat','null'),('fields.2c888abb-0df7-4e6b-901e-38785688e035.translationMethod','\"none\"'),('fields.2c888abb-0df7-4e6b-901e-38785688e035.type','\"craft\\\\fields\\\\PlainText\"'),('fields.79971a57-3c66-489d-8525-5fe7b382b60e.columnSuffix','\"udaibbfd\"'),('fields.79971a57-3c66-489d-8525-5fe7b382b60e.contentColumnType','\"text\"'),('fields.79971a57-3c66-489d-8525-5fe7b382b60e.fieldGroup','\"a448fcce-1054-44de-ae1d-54931eab4ed5\"'),('fields.79971a57-3c66-489d-8525-5fe7b382b60e.handle','\"metaDescription\"'),('fields.79971a57-3c66-489d-8525-5fe7b382b60e.instructions','\"\"'),('fields.79971a57-3c66-489d-8525-5fe7b382b60e.name','\"Meta Description\"'),('fields.79971a57-3c66-489d-8525-5fe7b382b60e.searchable','true'),('fields.79971a57-3c66-489d-8525-5fe7b382b60e.settings.byteLimit','null'),('fields.79971a57-3c66-489d-8525-5fe7b382b60e.settings.charLimit','null'),('fields.79971a57-3c66-489d-8525-5fe7b382b60e.settings.code','\"\"'),('fields.79971a57-3c66-489d-8525-5fe7b382b60e.settings.columnType','\"text\"'),('fields.79971a57-3c66-489d-8525-5fe7b382b60e.settings.initialRows','4'),('fields.79971a57-3c66-489d-8525-5fe7b382b60e.settings.multiline','\"\"'),('fields.79971a57-3c66-489d-8525-5fe7b382b60e.settings.placeholder','null'),('fields.79971a57-3c66-489d-8525-5fe7b382b60e.settings.uiMode','\"normal\"'),('fields.79971a57-3c66-489d-8525-5fe7b382b60e.translationKeyFormat','null'),('fields.79971a57-3c66-489d-8525-5fe7b382b60e.translationMethod','\"none\"'),('fields.79971a57-3c66-489d-8525-5fe7b382b60e.type','\"craft\\\\fields\\\\PlainText\"'),('fields.8fa978ce-5d99-438e-9d4b-00e1b997eb00.columnSuffix','\"bunquboh\"'),('fields.8fa978ce-5d99-438e-9d4b-00e1b997eb00.contentColumnType','\"text\"'),('fields.8fa978ce-5d99-438e-9d4b-00e1b997eb00.fieldGroup','\"a448fcce-1054-44de-ae1d-54931eab4ed5\"'),('fields.8fa978ce-5d99-438e-9d4b-00e1b997eb00.handle','\"metaTitle\"'),('fields.8fa978ce-5d99-438e-9d4b-00e1b997eb00.instructions','\"\"'),('fields.8fa978ce-5d99-438e-9d4b-00e1b997eb00.name','\"Meta Title\"'),('fields.8fa978ce-5d99-438e-9d4b-00e1b997eb00.searchable','true'),('fields.8fa978ce-5d99-438e-9d4b-00e1b997eb00.settings.byteLimit','null'),('fields.8fa978ce-5d99-438e-9d4b-00e1b997eb00.settings.charLimit','null'),('fields.8fa978ce-5d99-438e-9d4b-00e1b997eb00.settings.code','\"\"'),('fields.8fa978ce-5d99-438e-9d4b-00e1b997eb00.settings.columnType','\"text\"'),('fields.8fa978ce-5d99-438e-9d4b-00e1b997eb00.settings.initialRows','4'),('fields.8fa978ce-5d99-438e-9d4b-00e1b997eb00.settings.multiline','\"\"'),('fields.8fa978ce-5d99-438e-9d4b-00e1b997eb00.settings.placeholder','null'),('fields.8fa978ce-5d99-438e-9d4b-00e1b997eb00.settings.uiMode','\"normal\"'),('fields.8fa978ce-5d99-438e-9d4b-00e1b997eb00.translationKeyFormat','null'),('fields.8fa978ce-5d99-438e-9d4b-00e1b997eb00.translationMethod','\"none\"'),('fields.8fa978ce-5d99-438e-9d4b-00e1b997eb00.type','\"craft\\\\fields\\\\PlainText\"'),('fields.b541b12e-a2a1-4306-ae4c-e9f81c5ac527.columnSuffix','null'),('fields.b541b12e-a2a1-4306-ae4c-e9f81c5ac527.contentColumnType','\"string\"'),('fields.b541b12e-a2a1-4306-ae4c-e9f81c5ac527.fieldGroup','\"02ae1ee2-06d8-4df2-9fd3-b8f86587e78e\"'),('fields.b541b12e-a2a1-4306-ae4c-e9f81c5ac527.handle','\"pageAudience\"'),('fields.b541b12e-a2a1-4306-ae4c-e9f81c5ac527.instructions','\"\"'),('fields.b541b12e-a2a1-4306-ae4c-e9f81c5ac527.name','\"Page Audience\"'),('fields.b541b12e-a2a1-4306-ae4c-e9f81c5ac527.searchable','true'),('fields.b541b12e-a2a1-4306-ae4c-e9f81c5ac527.settings.allowLimit','false'),('fields.b541b12e-a2a1-4306-ae4c-e9f81c5ac527.settings.allowMultipleSources','false'),('fields.b541b12e-a2a1-4306-ae4c-e9f81c5ac527.settings.allowSelfRelations','false'),('fields.b541b12e-a2a1-4306-ae4c-e9f81c5ac527.settings.branchLimit','\"\"'),('fields.b541b12e-a2a1-4306-ae4c-e9f81c5ac527.settings.limit','null'),('fields.b541b12e-a2a1-4306-ae4c-e9f81c5ac527.settings.localizeRelations','false'),('fields.b541b12e-a2a1-4306-ae4c-e9f81c5ac527.settings.selectionLabel','\"\"'),('fields.b541b12e-a2a1-4306-ae4c-e9f81c5ac527.settings.showSiteMenu','true'),('fields.b541b12e-a2a1-4306-ae4c-e9f81c5ac527.settings.source','\"group:83e3ba4a-e673-4499-bad1-7b8a299d1fcd\"'),('fields.b541b12e-a2a1-4306-ae4c-e9f81c5ac527.settings.sources','\"*\"'),('fields.b541b12e-a2a1-4306-ae4c-e9f81c5ac527.settings.targetSiteId','null'),('fields.b541b12e-a2a1-4306-ae4c-e9f81c5ac527.settings.validateRelatedElements','false'),('fields.b541b12e-a2a1-4306-ae4c-e9f81c5ac527.settings.viewMode','null'),('fields.b541b12e-a2a1-4306-ae4c-e9f81c5ac527.translationKeyFormat','null'),('fields.b541b12e-a2a1-4306-ae4c-e9f81c5ac527.translationMethod','\"site\"'),('fields.b541b12e-a2a1-4306-ae4c-e9f81c5ac527.type','\"craft\\\\fields\\\\Categories\"'),('fields.fb9f5d17-da5f-4281-83fe-daac141b28c1.columnSuffix','null'),('fields.fb9f5d17-da5f-4281-83fe-daac141b28c1.contentColumnType','\"string\"'),('fields.fb9f5d17-da5f-4281-83fe-daac141b28c1.fieldGroup','\"a448fcce-1054-44de-ae1d-54931eab4ed5\"'),('fields.fb9f5d17-da5f-4281-83fe-daac141b28c1.handle','\"openGraphImage\"'),('fields.fb9f5d17-da5f-4281-83fe-daac141b28c1.instructions','\"\"'),('fields.fb9f5d17-da5f-4281-83fe-daac141b28c1.name','\"Open Graph Image\"'),('fields.fb9f5d17-da5f-4281-83fe-daac141b28c1.searchable','true'),('fields.fb9f5d17-da5f-4281-83fe-daac141b28c1.settings.allowedKinds','null'),('fields.fb9f5d17-da5f-4281-83fe-daac141b28c1.settings.allowSelfRelations','false'),('fields.fb9f5d17-da5f-4281-83fe-daac141b28c1.settings.allowUploads','true'),('fields.fb9f5d17-da5f-4281-83fe-daac141b28c1.settings.defaultUploadLocationSource','\"\"'),('fields.fb9f5d17-da5f-4281-83fe-daac141b28c1.settings.defaultUploadLocationSubpath','\"\"'),('fields.fb9f5d17-da5f-4281-83fe-daac141b28c1.settings.limit','\"\"'),('fields.fb9f5d17-da5f-4281-83fe-daac141b28c1.settings.localizeRelations','false'),('fields.fb9f5d17-da5f-4281-83fe-daac141b28c1.settings.previewMode','\"full\"'),('fields.fb9f5d17-da5f-4281-83fe-daac141b28c1.settings.restrictFiles','\"\"'),('fields.fb9f5d17-da5f-4281-83fe-daac141b28c1.settings.selectionLabel','\"\"'),('fields.fb9f5d17-da5f-4281-83fe-daac141b28c1.settings.showSiteMenu','true'),('fields.fb9f5d17-da5f-4281-83fe-daac141b28c1.settings.showUnpermittedFiles','false'),('fields.fb9f5d17-da5f-4281-83fe-daac141b28c1.settings.showUnpermittedVolumes','true'),('fields.fb9f5d17-da5f-4281-83fe-daac141b28c1.settings.singleUploadLocationSource','\"\"'),('fields.fb9f5d17-da5f-4281-83fe-daac141b28c1.settings.singleUploadLocationSubpath','\"\"'),('fields.fb9f5d17-da5f-4281-83fe-daac141b28c1.settings.source','null'),('fields.fb9f5d17-da5f-4281-83fe-daac141b28c1.settings.sources','\"*\"'),('fields.fb9f5d17-da5f-4281-83fe-daac141b28c1.settings.targetSiteId','null'),('fields.fb9f5d17-da5f-4281-83fe-daac141b28c1.settings.useSingleFolder','false'),('fields.fb9f5d17-da5f-4281-83fe-daac141b28c1.settings.validateRelatedElements','false'),('fields.fb9f5d17-da5f-4281-83fe-daac141b28c1.settings.viewMode','\"list\"'),('fields.fb9f5d17-da5f-4281-83fe-daac141b28c1.translationKeyFormat','null'),('fields.fb9f5d17-da5f-4281-83fe-daac141b28c1.translationMethod','\"site\"'),('fields.fb9f5d17-da5f-4281-83fe-daac141b28c1.type','\"craft\\\\fields\\\\Assets\"'),('globalSets.073ddf07-6d76-4737-b35b-b279ec2cc328.fieldLayouts.9b32d9a9-a7a7-4255-98a1-8a73316100c8.tabs.0.elements.0.fieldUid','\"1f6b9b21-7a47-49f5-8b5b-cc04eaf5a698\"'),('globalSets.073ddf07-6d76-4737-b35b-b279ec2cc328.fieldLayouts.9b32d9a9-a7a7-4255-98a1-8a73316100c8.tabs.0.elements.0.instructions','null'),('globalSets.073ddf07-6d76-4737-b35b-b279ec2cc328.fieldLayouts.9b32d9a9-a7a7-4255-98a1-8a73316100c8.tabs.0.elements.0.label','null'),('globalSets.073ddf07-6d76-4737-b35b-b279ec2cc328.fieldLayouts.9b32d9a9-a7a7-4255-98a1-8a73316100c8.tabs.0.elements.0.required','false'),('globalSets.073ddf07-6d76-4737-b35b-b279ec2cc328.fieldLayouts.9b32d9a9-a7a7-4255-98a1-8a73316100c8.tabs.0.elements.0.tip','null'),('globalSets.073ddf07-6d76-4737-b35b-b279ec2cc328.fieldLayouts.9b32d9a9-a7a7-4255-98a1-8a73316100c8.tabs.0.elements.0.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('globalSets.073ddf07-6d76-4737-b35b-b279ec2cc328.fieldLayouts.9b32d9a9-a7a7-4255-98a1-8a73316100c8.tabs.0.elements.0.warning','null'),('globalSets.073ddf07-6d76-4737-b35b-b279ec2cc328.fieldLayouts.9b32d9a9-a7a7-4255-98a1-8a73316100c8.tabs.0.elements.0.width','100'),('globalSets.073ddf07-6d76-4737-b35b-b279ec2cc328.fieldLayouts.9b32d9a9-a7a7-4255-98a1-8a73316100c8.tabs.0.name','\"Default\"'),('globalSets.073ddf07-6d76-4737-b35b-b279ec2cc328.fieldLayouts.9b32d9a9-a7a7-4255-98a1-8a73316100c8.tabs.0.sortOrder','1'),('globalSets.073ddf07-6d76-4737-b35b-b279ec2cc328.handle','\"globalMeta\"'),('globalSets.073ddf07-6d76-4737-b35b-b279ec2cc328.name','\"Global meta\"'),('globalSets.073ddf07-6d76-4737-b35b-b279ec2cc328.sortOrder','1'),('graphql.publicToken.enabled','true'),('graphql.publicToken.expiryDate','null'),('graphql.schemas.e2d52a34-67e1-43fb-bc4a-f58b1c1d008f.isPublic','true'),('graphql.schemas.e2d52a34-67e1-43fb-bc4a-f58b1c1d008f.name','\"Public Schema\"'),('matrixBlockTypes.4bfd8fdd-073c-4e41-98dc-0970eaa3323f.field','\"157f1dd3-6182-4ac8-b27f-1119802aa09c\"'),('matrixBlockTypes.4bfd8fdd-073c-4e41-98dc-0970eaa3323f.fieldLayouts.e82eee47-f866-49ad-bbd4-8108d09e11b2.tabs.0.elements.0.fieldUid','\"7de3ab69-d443-4205-8f66-2a048e8e1ed2\"'),('matrixBlockTypes.4bfd8fdd-073c-4e41-98dc-0970eaa3323f.fieldLayouts.e82eee47-f866-49ad-bbd4-8108d09e11b2.tabs.0.elements.0.instructions','null'),('matrixBlockTypes.4bfd8fdd-073c-4e41-98dc-0970eaa3323f.fieldLayouts.e82eee47-f866-49ad-bbd4-8108d09e11b2.tabs.0.elements.0.label','null'),('matrixBlockTypes.4bfd8fdd-073c-4e41-98dc-0970eaa3323f.fieldLayouts.e82eee47-f866-49ad-bbd4-8108d09e11b2.tabs.0.elements.0.required','true'),('matrixBlockTypes.4bfd8fdd-073c-4e41-98dc-0970eaa3323f.fieldLayouts.e82eee47-f866-49ad-bbd4-8108d09e11b2.tabs.0.elements.0.tip','null'),('matrixBlockTypes.4bfd8fdd-073c-4e41-98dc-0970eaa3323f.fieldLayouts.e82eee47-f866-49ad-bbd4-8108d09e11b2.tabs.0.elements.0.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('matrixBlockTypes.4bfd8fdd-073c-4e41-98dc-0970eaa3323f.fieldLayouts.e82eee47-f866-49ad-bbd4-8108d09e11b2.tabs.0.elements.0.warning','null'),('matrixBlockTypes.4bfd8fdd-073c-4e41-98dc-0970eaa3323f.fieldLayouts.e82eee47-f866-49ad-bbd4-8108d09e11b2.tabs.0.elements.0.width','100'),('matrixBlockTypes.4bfd8fdd-073c-4e41-98dc-0970eaa3323f.fieldLayouts.e82eee47-f866-49ad-bbd4-8108d09e11b2.tabs.0.elements.1.fieldUid','\"919ad539-6911-45ac-bc4b-042df36b0ab2\"'),('matrixBlockTypes.4bfd8fdd-073c-4e41-98dc-0970eaa3323f.fieldLayouts.e82eee47-f866-49ad-bbd4-8108d09e11b2.tabs.0.elements.1.instructions','null'),('matrixBlockTypes.4bfd8fdd-073c-4e41-98dc-0970eaa3323f.fieldLayouts.e82eee47-f866-49ad-bbd4-8108d09e11b2.tabs.0.elements.1.label','null'),('matrixBlockTypes.4bfd8fdd-073c-4e41-98dc-0970eaa3323f.fieldLayouts.e82eee47-f866-49ad-bbd4-8108d09e11b2.tabs.0.elements.1.required','true'),('matrixBlockTypes.4bfd8fdd-073c-4e41-98dc-0970eaa3323f.fieldLayouts.e82eee47-f866-49ad-bbd4-8108d09e11b2.tabs.0.elements.1.tip','null'),('matrixBlockTypes.4bfd8fdd-073c-4e41-98dc-0970eaa3323f.fieldLayouts.e82eee47-f866-49ad-bbd4-8108d09e11b2.tabs.0.elements.1.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('matrixBlockTypes.4bfd8fdd-073c-4e41-98dc-0970eaa3323f.fieldLayouts.e82eee47-f866-49ad-bbd4-8108d09e11b2.tabs.0.elements.1.warning','null'),('matrixBlockTypes.4bfd8fdd-073c-4e41-98dc-0970eaa3323f.fieldLayouts.e82eee47-f866-49ad-bbd4-8108d09e11b2.tabs.0.elements.1.width','100'),('matrixBlockTypes.4bfd8fdd-073c-4e41-98dc-0970eaa3323f.fieldLayouts.e82eee47-f866-49ad-bbd4-8108d09e11b2.tabs.0.elements.2.fieldUid','\"cafd3db0-3c9e-4eac-a922-f672ad5ef6d1\"'),('matrixBlockTypes.4bfd8fdd-073c-4e41-98dc-0970eaa3323f.fieldLayouts.e82eee47-f866-49ad-bbd4-8108d09e11b2.tabs.0.elements.2.instructions','null'),('matrixBlockTypes.4bfd8fdd-073c-4e41-98dc-0970eaa3323f.fieldLayouts.e82eee47-f866-49ad-bbd4-8108d09e11b2.tabs.0.elements.2.label','null'),('matrixBlockTypes.4bfd8fdd-073c-4e41-98dc-0970eaa3323f.fieldLayouts.e82eee47-f866-49ad-bbd4-8108d09e11b2.tabs.0.elements.2.required','true'),('matrixBlockTypes.4bfd8fdd-073c-4e41-98dc-0970eaa3323f.fieldLayouts.e82eee47-f866-49ad-bbd4-8108d09e11b2.tabs.0.elements.2.tip','null'),('matrixBlockTypes.4bfd8fdd-073c-4e41-98dc-0970eaa3323f.fieldLayouts.e82eee47-f866-49ad-bbd4-8108d09e11b2.tabs.0.elements.2.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('matrixBlockTypes.4bfd8fdd-073c-4e41-98dc-0970eaa3323f.fieldLayouts.e82eee47-f866-49ad-bbd4-8108d09e11b2.tabs.0.elements.2.warning','null'),('matrixBlockTypes.4bfd8fdd-073c-4e41-98dc-0970eaa3323f.fieldLayouts.e82eee47-f866-49ad-bbd4-8108d09e11b2.tabs.0.elements.2.width','100'),('matrixBlockTypes.4bfd8fdd-073c-4e41-98dc-0970eaa3323f.fieldLayouts.e82eee47-f866-49ad-bbd4-8108d09e11b2.tabs.0.elements.3.fieldUid','\"00ae21ee-87ea-48ed-990e-409f6da72d17\"'),('matrixBlockTypes.4bfd8fdd-073c-4e41-98dc-0970eaa3323f.fieldLayouts.e82eee47-f866-49ad-bbd4-8108d09e11b2.tabs.0.elements.3.instructions','null'),('matrixBlockTypes.4bfd8fdd-073c-4e41-98dc-0970eaa3323f.fieldLayouts.e82eee47-f866-49ad-bbd4-8108d09e11b2.tabs.0.elements.3.label','null'),('matrixBlockTypes.4bfd8fdd-073c-4e41-98dc-0970eaa3323f.fieldLayouts.e82eee47-f866-49ad-bbd4-8108d09e11b2.tabs.0.elements.3.required','false'),('matrixBlockTypes.4bfd8fdd-073c-4e41-98dc-0970eaa3323f.fieldLayouts.e82eee47-f866-49ad-bbd4-8108d09e11b2.tabs.0.elements.3.tip','null'),('matrixBlockTypes.4bfd8fdd-073c-4e41-98dc-0970eaa3323f.fieldLayouts.e82eee47-f866-49ad-bbd4-8108d09e11b2.tabs.0.elements.3.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('matrixBlockTypes.4bfd8fdd-073c-4e41-98dc-0970eaa3323f.fieldLayouts.e82eee47-f866-49ad-bbd4-8108d09e11b2.tabs.0.elements.3.warning','null'),('matrixBlockTypes.4bfd8fdd-073c-4e41-98dc-0970eaa3323f.fieldLayouts.e82eee47-f866-49ad-bbd4-8108d09e11b2.tabs.0.elements.3.width','100'),('matrixBlockTypes.4bfd8fdd-073c-4e41-98dc-0970eaa3323f.fieldLayouts.e82eee47-f866-49ad-bbd4-8108d09e11b2.tabs.0.elements.4.fieldUid','\"a9870b66-a3e3-4fe6-b828-0c252b0e4187\"'),('matrixBlockTypes.4bfd8fdd-073c-4e41-98dc-0970eaa3323f.fieldLayouts.e82eee47-f866-49ad-bbd4-8108d09e11b2.tabs.0.elements.4.instructions','null'),('matrixBlockTypes.4bfd8fdd-073c-4e41-98dc-0970eaa3323f.fieldLayouts.e82eee47-f866-49ad-bbd4-8108d09e11b2.tabs.0.elements.4.label','null'),('matrixBlockTypes.4bfd8fdd-073c-4e41-98dc-0970eaa3323f.fieldLayouts.e82eee47-f866-49ad-bbd4-8108d09e11b2.tabs.0.elements.4.required','false'),('matrixBlockTypes.4bfd8fdd-073c-4e41-98dc-0970eaa3323f.fieldLayouts.e82eee47-f866-49ad-bbd4-8108d09e11b2.tabs.0.elements.4.tip','null'),('matrixBlockTypes.4bfd8fdd-073c-4e41-98dc-0970eaa3323f.fieldLayouts.e82eee47-f866-49ad-bbd4-8108d09e11b2.tabs.0.elements.4.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('matrixBlockTypes.4bfd8fdd-073c-4e41-98dc-0970eaa3323f.fieldLayouts.e82eee47-f866-49ad-bbd4-8108d09e11b2.tabs.0.elements.4.warning','null'),('matrixBlockTypes.4bfd8fdd-073c-4e41-98dc-0970eaa3323f.fieldLayouts.e82eee47-f866-49ad-bbd4-8108d09e11b2.tabs.0.elements.4.width','100'),('matrixBlockTypes.4bfd8fdd-073c-4e41-98dc-0970eaa3323f.fieldLayouts.e82eee47-f866-49ad-bbd4-8108d09e11b2.tabs.0.name','\"Content\"'),('matrixBlockTypes.4bfd8fdd-073c-4e41-98dc-0970eaa3323f.fieldLayouts.e82eee47-f866-49ad-bbd4-8108d09e11b2.tabs.0.sortOrder','1'),('matrixBlockTypes.4bfd8fdd-073c-4e41-98dc-0970eaa3323f.fields.00ae21ee-87ea-48ed-990e-409f6da72d17.columnSuffix','\"bkzlphcn\"'),('matrixBlockTypes.4bfd8fdd-073c-4e41-98dc-0970eaa3323f.fields.00ae21ee-87ea-48ed-990e-409f6da72d17.contentColumnType','\"text\"'),('matrixBlockTypes.4bfd8fdd-073c-4e41-98dc-0970eaa3323f.fields.00ae21ee-87ea-48ed-990e-409f6da72d17.fieldGroup','null'),('matrixBlockTypes.4bfd8fdd-073c-4e41-98dc-0970eaa3323f.fields.00ae21ee-87ea-48ed-990e-409f6da72d17.handle','\"caption\"'),('matrixBlockTypes.4bfd8fdd-073c-4e41-98dc-0970eaa3323f.fields.00ae21ee-87ea-48ed-990e-409f6da72d17.instructions','\"Show a caption under the image. Leave blank if not required.\"'),('matrixBlockTypes.4bfd8fdd-073c-4e41-98dc-0970eaa3323f.fields.00ae21ee-87ea-48ed-990e-409f6da72d17.name','\"Caption\"'),('matrixBlockTypes.4bfd8fdd-073c-4e41-98dc-0970eaa3323f.fields.00ae21ee-87ea-48ed-990e-409f6da72d17.searchable','true'),('matrixBlockTypes.4bfd8fdd-073c-4e41-98dc-0970eaa3323f.fields.00ae21ee-87ea-48ed-990e-409f6da72d17.settings.byteLimit','null'),('matrixBlockTypes.4bfd8fdd-073c-4e41-98dc-0970eaa3323f.fields.00ae21ee-87ea-48ed-990e-409f6da72d17.settings.charLimit','null'),('matrixBlockTypes.4bfd8fdd-073c-4e41-98dc-0970eaa3323f.fields.00ae21ee-87ea-48ed-990e-409f6da72d17.settings.code','\"\"'),('matrixBlockTypes.4bfd8fdd-073c-4e41-98dc-0970eaa3323f.fields.00ae21ee-87ea-48ed-990e-409f6da72d17.settings.columnType','\"text\"'),('matrixBlockTypes.4bfd8fdd-073c-4e41-98dc-0970eaa3323f.fields.00ae21ee-87ea-48ed-990e-409f6da72d17.settings.initialRows','\"4\"'),('matrixBlockTypes.4bfd8fdd-073c-4e41-98dc-0970eaa3323f.fields.00ae21ee-87ea-48ed-990e-409f6da72d17.settings.multiline','\"\"'),('matrixBlockTypes.4bfd8fdd-073c-4e41-98dc-0970eaa3323f.fields.00ae21ee-87ea-48ed-990e-409f6da72d17.settings.placeholder','null'),('matrixBlockTypes.4bfd8fdd-073c-4e41-98dc-0970eaa3323f.fields.00ae21ee-87ea-48ed-990e-409f6da72d17.settings.uiMode','\"normal\"'),('matrixBlockTypes.4bfd8fdd-073c-4e41-98dc-0970eaa3323f.fields.00ae21ee-87ea-48ed-990e-409f6da72d17.translationKeyFormat','null'),('matrixBlockTypes.4bfd8fdd-073c-4e41-98dc-0970eaa3323f.fields.00ae21ee-87ea-48ed-990e-409f6da72d17.translationMethod','\"none\"'),('matrixBlockTypes.4bfd8fdd-073c-4e41-98dc-0970eaa3323f.fields.00ae21ee-87ea-48ed-990e-409f6da72d17.type','\"craft\\\\fields\\\\PlainText\"'),('matrixBlockTypes.4bfd8fdd-073c-4e41-98dc-0970eaa3323f.fields.7de3ab69-d443-4205-8f66-2a048e8e1ed2.columnSuffix','null'),('matrixBlockTypes.4bfd8fdd-073c-4e41-98dc-0970eaa3323f.fields.7de3ab69-d443-4205-8f66-2a048e8e1ed2.contentColumnType','\"string\"'),('matrixBlockTypes.4bfd8fdd-073c-4e41-98dc-0970eaa3323f.fields.7de3ab69-d443-4205-8f66-2a048e8e1ed2.fieldGroup','null'),('matrixBlockTypes.4bfd8fdd-073c-4e41-98dc-0970eaa3323f.fields.7de3ab69-d443-4205-8f66-2a048e8e1ed2.handle','\"audience\"'),('matrixBlockTypes.4bfd8fdd-073c-4e41-98dc-0970eaa3323f.fields.7de3ab69-d443-4205-8f66-2a048e8e1ed2.instructions','\"Choose who can see this\"'),('matrixBlockTypes.4bfd8fdd-073c-4e41-98dc-0970eaa3323f.fields.7de3ab69-d443-4205-8f66-2a048e8e1ed2.name','\"Audience\"'),('matrixBlockTypes.4bfd8fdd-073c-4e41-98dc-0970eaa3323f.fields.7de3ab69-d443-4205-8f66-2a048e8e1ed2.searchable','true'),('matrixBlockTypes.4bfd8fdd-073c-4e41-98dc-0970eaa3323f.fields.7de3ab69-d443-4205-8f66-2a048e8e1ed2.settings.allowLimit','false'),('matrixBlockTypes.4bfd8fdd-073c-4e41-98dc-0970eaa3323f.fields.7de3ab69-d443-4205-8f66-2a048e8e1ed2.settings.allowMultipleSources','false'),('matrixBlockTypes.4bfd8fdd-073c-4e41-98dc-0970eaa3323f.fields.7de3ab69-d443-4205-8f66-2a048e8e1ed2.settings.allowSelfRelations','false'),('matrixBlockTypes.4bfd8fdd-073c-4e41-98dc-0970eaa3323f.fields.7de3ab69-d443-4205-8f66-2a048e8e1ed2.settings.branchLimit','\"\"'),('matrixBlockTypes.4bfd8fdd-073c-4e41-98dc-0970eaa3323f.fields.7de3ab69-d443-4205-8f66-2a048e8e1ed2.settings.limit','null'),('matrixBlockTypes.4bfd8fdd-073c-4e41-98dc-0970eaa3323f.fields.7de3ab69-d443-4205-8f66-2a048e8e1ed2.settings.localizeRelations','false'),('matrixBlockTypes.4bfd8fdd-073c-4e41-98dc-0970eaa3323f.fields.7de3ab69-d443-4205-8f66-2a048e8e1ed2.settings.selectionLabel','\"\"'),('matrixBlockTypes.4bfd8fdd-073c-4e41-98dc-0970eaa3323f.fields.7de3ab69-d443-4205-8f66-2a048e8e1ed2.settings.showSiteMenu','true'),('matrixBlockTypes.4bfd8fdd-073c-4e41-98dc-0970eaa3323f.fields.7de3ab69-d443-4205-8f66-2a048e8e1ed2.settings.source','\"group:83e3ba4a-e673-4499-bad1-7b8a299d1fcd\"'),('matrixBlockTypes.4bfd8fdd-073c-4e41-98dc-0970eaa3323f.fields.7de3ab69-d443-4205-8f66-2a048e8e1ed2.settings.sources','\"*\"'),('matrixBlockTypes.4bfd8fdd-073c-4e41-98dc-0970eaa3323f.fields.7de3ab69-d443-4205-8f66-2a048e8e1ed2.settings.targetSiteId','null'),('matrixBlockTypes.4bfd8fdd-073c-4e41-98dc-0970eaa3323f.fields.7de3ab69-d443-4205-8f66-2a048e8e1ed2.settings.validateRelatedElements','false'),('matrixBlockTypes.4bfd8fdd-073c-4e41-98dc-0970eaa3323f.fields.7de3ab69-d443-4205-8f66-2a048e8e1ed2.settings.viewMode','null'),('matrixBlockTypes.4bfd8fdd-073c-4e41-98dc-0970eaa3323f.fields.7de3ab69-d443-4205-8f66-2a048e8e1ed2.translationKeyFormat','null'),('matrixBlockTypes.4bfd8fdd-073c-4e41-98dc-0970eaa3323f.fields.7de3ab69-d443-4205-8f66-2a048e8e1ed2.translationMethod','\"site\"'),('matrixBlockTypes.4bfd8fdd-073c-4e41-98dc-0970eaa3323f.fields.7de3ab69-d443-4205-8f66-2a048e8e1ed2.type','\"craft\\\\fields\\\\Categories\"'),('matrixBlockTypes.4bfd8fdd-073c-4e41-98dc-0970eaa3323f.fields.919ad539-6911-45ac-bc4b-042df36b0ab2.columnSuffix','null'),('matrixBlockTypes.4bfd8fdd-073c-4e41-98dc-0970eaa3323f.fields.919ad539-6911-45ac-bc4b-042df36b0ab2.contentColumnType','\"string\"'),('matrixBlockTypes.4bfd8fdd-073c-4e41-98dc-0970eaa3323f.fields.919ad539-6911-45ac-bc4b-042df36b0ab2.fieldGroup','null'),('matrixBlockTypes.4bfd8fdd-073c-4e41-98dc-0970eaa3323f.fields.919ad539-6911-45ac-bc4b-042df36b0ab2.handle','\"image\"'),('matrixBlockTypes.4bfd8fdd-073c-4e41-98dc-0970eaa3323f.fields.919ad539-6911-45ac-bc4b-042df36b0ab2.instructions','\"\"'),('matrixBlockTypes.4bfd8fdd-073c-4e41-98dc-0970eaa3323f.fields.919ad539-6911-45ac-bc4b-042df36b0ab2.name','\"Image\"'),('matrixBlockTypes.4bfd8fdd-073c-4e41-98dc-0970eaa3323f.fields.919ad539-6911-45ac-bc4b-042df36b0ab2.searchable','true'),('matrixBlockTypes.4bfd8fdd-073c-4e41-98dc-0970eaa3323f.fields.919ad539-6911-45ac-bc4b-042df36b0ab2.settings.allowedKinds.0','\"image\"'),('matrixBlockTypes.4bfd8fdd-073c-4e41-98dc-0970eaa3323f.fields.919ad539-6911-45ac-bc4b-042df36b0ab2.settings.allowSelfRelations','false'),('matrixBlockTypes.4bfd8fdd-073c-4e41-98dc-0970eaa3323f.fields.919ad539-6911-45ac-bc4b-042df36b0ab2.settings.allowUploads','true'),('matrixBlockTypes.4bfd8fdd-073c-4e41-98dc-0970eaa3323f.fields.919ad539-6911-45ac-bc4b-042df36b0ab2.settings.defaultUploadLocationSource','\"volume:96c744fc-87db-44dc-a086-5ae952f73fad\"'),('matrixBlockTypes.4bfd8fdd-073c-4e41-98dc-0970eaa3323f.fields.919ad539-6911-45ac-bc4b-042df36b0ab2.settings.defaultUploadLocationSubpath','\"\"'),('matrixBlockTypes.4bfd8fdd-073c-4e41-98dc-0970eaa3323f.fields.919ad539-6911-45ac-bc4b-042df36b0ab2.settings.limit','\"1\"'),('matrixBlockTypes.4bfd8fdd-073c-4e41-98dc-0970eaa3323f.fields.919ad539-6911-45ac-bc4b-042df36b0ab2.settings.localizeRelations','false'),('matrixBlockTypes.4bfd8fdd-073c-4e41-98dc-0970eaa3323f.fields.919ad539-6911-45ac-bc4b-042df36b0ab2.settings.previewMode','\"full\"'),('matrixBlockTypes.4bfd8fdd-073c-4e41-98dc-0970eaa3323f.fields.919ad539-6911-45ac-bc4b-042df36b0ab2.settings.restrictFiles','\"1\"'),('matrixBlockTypes.4bfd8fdd-073c-4e41-98dc-0970eaa3323f.fields.919ad539-6911-45ac-bc4b-042df36b0ab2.settings.selectionLabel','\"\"'),('matrixBlockTypes.4bfd8fdd-073c-4e41-98dc-0970eaa3323f.fields.919ad539-6911-45ac-bc4b-042df36b0ab2.settings.showSiteMenu','true'),('matrixBlockTypes.4bfd8fdd-073c-4e41-98dc-0970eaa3323f.fields.919ad539-6911-45ac-bc4b-042df36b0ab2.settings.showUnpermittedFiles','false'),('matrixBlockTypes.4bfd8fdd-073c-4e41-98dc-0970eaa3323f.fields.919ad539-6911-45ac-bc4b-042df36b0ab2.settings.showUnpermittedVolumes','true'),('matrixBlockTypes.4bfd8fdd-073c-4e41-98dc-0970eaa3323f.fields.919ad539-6911-45ac-bc4b-042df36b0ab2.settings.singleUploadLocationSource','\"volume:96c744fc-87db-44dc-a086-5ae952f73fad\"'),('matrixBlockTypes.4bfd8fdd-073c-4e41-98dc-0970eaa3323f.fields.919ad539-6911-45ac-bc4b-042df36b0ab2.settings.singleUploadLocationSubpath','\"\"'),('matrixBlockTypes.4bfd8fdd-073c-4e41-98dc-0970eaa3323f.fields.919ad539-6911-45ac-bc4b-042df36b0ab2.settings.source','null'),('matrixBlockTypes.4bfd8fdd-073c-4e41-98dc-0970eaa3323f.fields.919ad539-6911-45ac-bc4b-042df36b0ab2.settings.sources','\"*\"'),('matrixBlockTypes.4bfd8fdd-073c-4e41-98dc-0970eaa3323f.fields.919ad539-6911-45ac-bc4b-042df36b0ab2.settings.targetSiteId','null'),('matrixBlockTypes.4bfd8fdd-073c-4e41-98dc-0970eaa3323f.fields.919ad539-6911-45ac-bc4b-042df36b0ab2.settings.useSingleFolder','false'),('matrixBlockTypes.4bfd8fdd-073c-4e41-98dc-0970eaa3323f.fields.919ad539-6911-45ac-bc4b-042df36b0ab2.settings.validateRelatedElements','false'),('matrixBlockTypes.4bfd8fdd-073c-4e41-98dc-0970eaa3323f.fields.919ad539-6911-45ac-bc4b-042df36b0ab2.settings.viewMode','\"large\"'),('matrixBlockTypes.4bfd8fdd-073c-4e41-98dc-0970eaa3323f.fields.919ad539-6911-45ac-bc4b-042df36b0ab2.translationKeyFormat','null'),('matrixBlockTypes.4bfd8fdd-073c-4e41-98dc-0970eaa3323f.fields.919ad539-6911-45ac-bc4b-042df36b0ab2.translationMethod','\"site\"'),('matrixBlockTypes.4bfd8fdd-073c-4e41-98dc-0970eaa3323f.fields.919ad539-6911-45ac-bc4b-042df36b0ab2.type','\"craft\\\\fields\\\\Assets\"'),('matrixBlockTypes.4bfd8fdd-073c-4e41-98dc-0970eaa3323f.fields.a9870b66-a3e3-4fe6-b828-0c252b0e4187.columnSuffix','\"hnehkpux\"'),('matrixBlockTypes.4bfd8fdd-073c-4e41-98dc-0970eaa3323f.fields.a9870b66-a3e3-4fe6-b828-0c252b0e4187.contentColumnType','\"text\"'),('matrixBlockTypes.4bfd8fdd-073c-4e41-98dc-0970eaa3323f.fields.a9870b66-a3e3-4fe6-b828-0c252b0e4187.fieldGroup','null'),('matrixBlockTypes.4bfd8fdd-073c-4e41-98dc-0970eaa3323f.fields.a9870b66-a3e3-4fe6-b828-0c252b0e4187.handle','\"customClass\"'),('matrixBlockTypes.4bfd8fdd-073c-4e41-98dc-0970eaa3323f.fields.a9870b66-a3e3-4fe6-b828-0c252b0e4187.instructions','\"Attach one or more classes to this element separated by spaces\"'),('matrixBlockTypes.4bfd8fdd-073c-4e41-98dc-0970eaa3323f.fields.a9870b66-a3e3-4fe6-b828-0c252b0e4187.name','\"Custom Class\"'),('matrixBlockTypes.4bfd8fdd-073c-4e41-98dc-0970eaa3323f.fields.a9870b66-a3e3-4fe6-b828-0c252b0e4187.searchable','true'),('matrixBlockTypes.4bfd8fdd-073c-4e41-98dc-0970eaa3323f.fields.a9870b66-a3e3-4fe6-b828-0c252b0e4187.settings.byteLimit','null'),('matrixBlockTypes.4bfd8fdd-073c-4e41-98dc-0970eaa3323f.fields.a9870b66-a3e3-4fe6-b828-0c252b0e4187.settings.charLimit','null'),('matrixBlockTypes.4bfd8fdd-073c-4e41-98dc-0970eaa3323f.fields.a9870b66-a3e3-4fe6-b828-0c252b0e4187.settings.code','\"\"'),('matrixBlockTypes.4bfd8fdd-073c-4e41-98dc-0970eaa3323f.fields.a9870b66-a3e3-4fe6-b828-0c252b0e4187.settings.columnType','\"text\"'),('matrixBlockTypes.4bfd8fdd-073c-4e41-98dc-0970eaa3323f.fields.a9870b66-a3e3-4fe6-b828-0c252b0e4187.settings.initialRows','\"4\"'),('matrixBlockTypes.4bfd8fdd-073c-4e41-98dc-0970eaa3323f.fields.a9870b66-a3e3-4fe6-b828-0c252b0e4187.settings.multiline','\"\"'),('matrixBlockTypes.4bfd8fdd-073c-4e41-98dc-0970eaa3323f.fields.a9870b66-a3e3-4fe6-b828-0c252b0e4187.settings.placeholder','\"class-1 class-2\"'),('matrixBlockTypes.4bfd8fdd-073c-4e41-98dc-0970eaa3323f.fields.a9870b66-a3e3-4fe6-b828-0c252b0e4187.settings.uiMode','\"normal\"'),('matrixBlockTypes.4bfd8fdd-073c-4e41-98dc-0970eaa3323f.fields.a9870b66-a3e3-4fe6-b828-0c252b0e4187.translationKeyFormat','null'),('matrixBlockTypes.4bfd8fdd-073c-4e41-98dc-0970eaa3323f.fields.a9870b66-a3e3-4fe6-b828-0c252b0e4187.translationMethod','\"none\"'),('matrixBlockTypes.4bfd8fdd-073c-4e41-98dc-0970eaa3323f.fields.a9870b66-a3e3-4fe6-b828-0c252b0e4187.type','\"craft\\\\fields\\\\PlainText\"'),('matrixBlockTypes.4bfd8fdd-073c-4e41-98dc-0970eaa3323f.fields.cafd3db0-3c9e-4eac-a922-f672ad5ef6d1.columnSuffix','\"pcjsopjy\"'),('matrixBlockTypes.4bfd8fdd-073c-4e41-98dc-0970eaa3323f.fields.cafd3db0-3c9e-4eac-a922-f672ad5ef6d1.contentColumnType','\"text\"'),('matrixBlockTypes.4bfd8fdd-073c-4e41-98dc-0970eaa3323f.fields.cafd3db0-3c9e-4eac-a922-f672ad5ef6d1.fieldGroup','null'),('matrixBlockTypes.4bfd8fdd-073c-4e41-98dc-0970eaa3323f.fields.cafd3db0-3c9e-4eac-a922-f672ad5ef6d1.handle','\"altTag\"'),('matrixBlockTypes.4bfd8fdd-073c-4e41-98dc-0970eaa3323f.fields.cafd3db0-3c9e-4eac-a922-f672ad5ef6d1.instructions','\"A short description of what\'s in the image for visually impaired members.\"'),('matrixBlockTypes.4bfd8fdd-073c-4e41-98dc-0970eaa3323f.fields.cafd3db0-3c9e-4eac-a922-f672ad5ef6d1.name','\"Description\"'),('matrixBlockTypes.4bfd8fdd-073c-4e41-98dc-0970eaa3323f.fields.cafd3db0-3c9e-4eac-a922-f672ad5ef6d1.searchable','true'),('matrixBlockTypes.4bfd8fdd-073c-4e41-98dc-0970eaa3323f.fields.cafd3db0-3c9e-4eac-a922-f672ad5ef6d1.settings.byteLimit','null'),('matrixBlockTypes.4bfd8fdd-073c-4e41-98dc-0970eaa3323f.fields.cafd3db0-3c9e-4eac-a922-f672ad5ef6d1.settings.charLimit','null'),('matrixBlockTypes.4bfd8fdd-073c-4e41-98dc-0970eaa3323f.fields.cafd3db0-3c9e-4eac-a922-f672ad5ef6d1.settings.code','\"\"'),('matrixBlockTypes.4bfd8fdd-073c-4e41-98dc-0970eaa3323f.fields.cafd3db0-3c9e-4eac-a922-f672ad5ef6d1.settings.columnType','\"text\"'),('matrixBlockTypes.4bfd8fdd-073c-4e41-98dc-0970eaa3323f.fields.cafd3db0-3c9e-4eac-a922-f672ad5ef6d1.settings.initialRows','\"4\"'),('matrixBlockTypes.4bfd8fdd-073c-4e41-98dc-0970eaa3323f.fields.cafd3db0-3c9e-4eac-a922-f672ad5ef6d1.settings.multiline','\"\"'),('matrixBlockTypes.4bfd8fdd-073c-4e41-98dc-0970eaa3323f.fields.cafd3db0-3c9e-4eac-a922-f672ad5ef6d1.settings.placeholder','null'),('matrixBlockTypes.4bfd8fdd-073c-4e41-98dc-0970eaa3323f.fields.cafd3db0-3c9e-4eac-a922-f672ad5ef6d1.settings.uiMode','\"normal\"'),('matrixBlockTypes.4bfd8fdd-073c-4e41-98dc-0970eaa3323f.fields.cafd3db0-3c9e-4eac-a922-f672ad5ef6d1.translationKeyFormat','null'),('matrixBlockTypes.4bfd8fdd-073c-4e41-98dc-0970eaa3323f.fields.cafd3db0-3c9e-4eac-a922-f672ad5ef6d1.translationMethod','\"none\"'),('matrixBlockTypes.4bfd8fdd-073c-4e41-98dc-0970eaa3323f.fields.cafd3db0-3c9e-4eac-a922-f672ad5ef6d1.type','\"craft\\\\fields\\\\PlainText\"'),('matrixBlockTypes.4bfd8fdd-073c-4e41-98dc-0970eaa3323f.handle','\"regularImage\"'),('matrixBlockTypes.4bfd8fdd-073c-4e41-98dc-0970eaa3323f.name','\"Regular Image\"'),('matrixBlockTypes.4bfd8fdd-073c-4e41-98dc-0970eaa3323f.sortOrder','5'),('matrixBlockTypes.5298d815-6445-46e7-bafa-318ec948122e.field','\"157f1dd3-6182-4ac8-b27f-1119802aa09c\"'),('matrixBlockTypes.5298d815-6445-46e7-bafa-318ec948122e.fieldLayouts.e504e0b8-00fd-449e-92d9-963e62f32e3b.tabs.0.elements.0.fieldUid','\"1ea724df-ade0-49e2-af62-b1a2a65c08cc\"'),('matrixBlockTypes.5298d815-6445-46e7-bafa-318ec948122e.fieldLayouts.e504e0b8-00fd-449e-92d9-963e62f32e3b.tabs.0.elements.0.instructions','null'),('matrixBlockTypes.5298d815-6445-46e7-bafa-318ec948122e.fieldLayouts.e504e0b8-00fd-449e-92d9-963e62f32e3b.tabs.0.elements.0.label','null'),('matrixBlockTypes.5298d815-6445-46e7-bafa-318ec948122e.fieldLayouts.e504e0b8-00fd-449e-92d9-963e62f32e3b.tabs.0.elements.0.required','true'),('matrixBlockTypes.5298d815-6445-46e7-bafa-318ec948122e.fieldLayouts.e504e0b8-00fd-449e-92d9-963e62f32e3b.tabs.0.elements.0.tip','null'),('matrixBlockTypes.5298d815-6445-46e7-bafa-318ec948122e.fieldLayouts.e504e0b8-00fd-449e-92d9-963e62f32e3b.tabs.0.elements.0.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('matrixBlockTypes.5298d815-6445-46e7-bafa-318ec948122e.fieldLayouts.e504e0b8-00fd-449e-92d9-963e62f32e3b.tabs.0.elements.0.warning','null'),('matrixBlockTypes.5298d815-6445-46e7-bafa-318ec948122e.fieldLayouts.e504e0b8-00fd-449e-92d9-963e62f32e3b.tabs.0.elements.0.width','100'),('matrixBlockTypes.5298d815-6445-46e7-bafa-318ec948122e.fieldLayouts.e504e0b8-00fd-449e-92d9-963e62f32e3b.tabs.0.elements.1.fieldUid','\"cfedab0d-6899-463e-a413-aad6ae194e73\"'),('matrixBlockTypes.5298d815-6445-46e7-bafa-318ec948122e.fieldLayouts.e504e0b8-00fd-449e-92d9-963e62f32e3b.tabs.0.elements.1.instructions','null'),('matrixBlockTypes.5298d815-6445-46e7-bafa-318ec948122e.fieldLayouts.e504e0b8-00fd-449e-92d9-963e62f32e3b.tabs.0.elements.1.label','null'),('matrixBlockTypes.5298d815-6445-46e7-bafa-318ec948122e.fieldLayouts.e504e0b8-00fd-449e-92d9-963e62f32e3b.tabs.0.elements.1.required','false'),('matrixBlockTypes.5298d815-6445-46e7-bafa-318ec948122e.fieldLayouts.e504e0b8-00fd-449e-92d9-963e62f32e3b.tabs.0.elements.1.tip','null'),('matrixBlockTypes.5298d815-6445-46e7-bafa-318ec948122e.fieldLayouts.e504e0b8-00fd-449e-92d9-963e62f32e3b.tabs.0.elements.1.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('matrixBlockTypes.5298d815-6445-46e7-bafa-318ec948122e.fieldLayouts.e504e0b8-00fd-449e-92d9-963e62f32e3b.tabs.0.elements.1.warning','null'),('matrixBlockTypes.5298d815-6445-46e7-bafa-318ec948122e.fieldLayouts.e504e0b8-00fd-449e-92d9-963e62f32e3b.tabs.0.elements.1.width','100'),('matrixBlockTypes.5298d815-6445-46e7-bafa-318ec948122e.fieldLayouts.e504e0b8-00fd-449e-92d9-963e62f32e3b.tabs.0.elements.2.fieldUid','\"6f1f8583-ac69-4eee-9a18-b836be8d0c7a\"'),('matrixBlockTypes.5298d815-6445-46e7-bafa-318ec948122e.fieldLayouts.e504e0b8-00fd-449e-92d9-963e62f32e3b.tabs.0.elements.2.instructions','null'),('matrixBlockTypes.5298d815-6445-46e7-bafa-318ec948122e.fieldLayouts.e504e0b8-00fd-449e-92d9-963e62f32e3b.tabs.0.elements.2.label','null'),('matrixBlockTypes.5298d815-6445-46e7-bafa-318ec948122e.fieldLayouts.e504e0b8-00fd-449e-92d9-963e62f32e3b.tabs.0.elements.2.required','false'),('matrixBlockTypes.5298d815-6445-46e7-bafa-318ec948122e.fieldLayouts.e504e0b8-00fd-449e-92d9-963e62f32e3b.tabs.0.elements.2.tip','null'),('matrixBlockTypes.5298d815-6445-46e7-bafa-318ec948122e.fieldLayouts.e504e0b8-00fd-449e-92d9-963e62f32e3b.tabs.0.elements.2.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('matrixBlockTypes.5298d815-6445-46e7-bafa-318ec948122e.fieldLayouts.e504e0b8-00fd-449e-92d9-963e62f32e3b.tabs.0.elements.2.warning','null'),('matrixBlockTypes.5298d815-6445-46e7-bafa-318ec948122e.fieldLayouts.e504e0b8-00fd-449e-92d9-963e62f32e3b.tabs.0.elements.2.width','100'),('matrixBlockTypes.5298d815-6445-46e7-bafa-318ec948122e.fieldLayouts.e504e0b8-00fd-449e-92d9-963e62f32e3b.tabs.0.elements.3.fieldUid','\"039c016d-2191-4827-bd8f-5ba356dc009f\"'),('matrixBlockTypes.5298d815-6445-46e7-bafa-318ec948122e.fieldLayouts.e504e0b8-00fd-449e-92d9-963e62f32e3b.tabs.0.elements.3.instructions','null'),('matrixBlockTypes.5298d815-6445-46e7-bafa-318ec948122e.fieldLayouts.e504e0b8-00fd-449e-92d9-963e62f32e3b.tabs.0.elements.3.label','null'),('matrixBlockTypes.5298d815-6445-46e7-bafa-318ec948122e.fieldLayouts.e504e0b8-00fd-449e-92d9-963e62f32e3b.tabs.0.elements.3.required','false'),('matrixBlockTypes.5298d815-6445-46e7-bafa-318ec948122e.fieldLayouts.e504e0b8-00fd-449e-92d9-963e62f32e3b.tabs.0.elements.3.tip','null'),('matrixBlockTypes.5298d815-6445-46e7-bafa-318ec948122e.fieldLayouts.e504e0b8-00fd-449e-92d9-963e62f32e3b.tabs.0.elements.3.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('matrixBlockTypes.5298d815-6445-46e7-bafa-318ec948122e.fieldLayouts.e504e0b8-00fd-449e-92d9-963e62f32e3b.tabs.0.elements.3.warning','null'),('matrixBlockTypes.5298d815-6445-46e7-bafa-318ec948122e.fieldLayouts.e504e0b8-00fd-449e-92d9-963e62f32e3b.tabs.0.elements.3.width','100'),('matrixBlockTypes.5298d815-6445-46e7-bafa-318ec948122e.fieldLayouts.e504e0b8-00fd-449e-92d9-963e62f32e3b.tabs.0.elements.4.fieldUid','\"6e658ce8-9b41-4d68-8472-d17816861e32\"'),('matrixBlockTypes.5298d815-6445-46e7-bafa-318ec948122e.fieldLayouts.e504e0b8-00fd-449e-92d9-963e62f32e3b.tabs.0.elements.4.instructions','null'),('matrixBlockTypes.5298d815-6445-46e7-bafa-318ec948122e.fieldLayouts.e504e0b8-00fd-449e-92d9-963e62f32e3b.tabs.0.elements.4.label','null'),('matrixBlockTypes.5298d815-6445-46e7-bafa-318ec948122e.fieldLayouts.e504e0b8-00fd-449e-92d9-963e62f32e3b.tabs.0.elements.4.required','false'),('matrixBlockTypes.5298d815-6445-46e7-bafa-318ec948122e.fieldLayouts.e504e0b8-00fd-449e-92d9-963e62f32e3b.tabs.0.elements.4.tip','null'),('matrixBlockTypes.5298d815-6445-46e7-bafa-318ec948122e.fieldLayouts.e504e0b8-00fd-449e-92d9-963e62f32e3b.tabs.0.elements.4.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('matrixBlockTypes.5298d815-6445-46e7-bafa-318ec948122e.fieldLayouts.e504e0b8-00fd-449e-92d9-963e62f32e3b.tabs.0.elements.4.warning','null'),('matrixBlockTypes.5298d815-6445-46e7-bafa-318ec948122e.fieldLayouts.e504e0b8-00fd-449e-92d9-963e62f32e3b.tabs.0.elements.4.width','100'),('matrixBlockTypes.5298d815-6445-46e7-bafa-318ec948122e.fieldLayouts.e504e0b8-00fd-449e-92d9-963e62f32e3b.tabs.0.elements.5.fieldUid','\"737dbb58-826d-411f-9708-03124661ee3b\"'),('matrixBlockTypes.5298d815-6445-46e7-bafa-318ec948122e.fieldLayouts.e504e0b8-00fd-449e-92d9-963e62f32e3b.tabs.0.elements.5.instructions','null'),('matrixBlockTypes.5298d815-6445-46e7-bafa-318ec948122e.fieldLayouts.e504e0b8-00fd-449e-92d9-963e62f32e3b.tabs.0.elements.5.label','null'),('matrixBlockTypes.5298d815-6445-46e7-bafa-318ec948122e.fieldLayouts.e504e0b8-00fd-449e-92d9-963e62f32e3b.tabs.0.elements.5.required','false'),('matrixBlockTypes.5298d815-6445-46e7-bafa-318ec948122e.fieldLayouts.e504e0b8-00fd-449e-92d9-963e62f32e3b.tabs.0.elements.5.tip','null'),('matrixBlockTypes.5298d815-6445-46e7-bafa-318ec948122e.fieldLayouts.e504e0b8-00fd-449e-92d9-963e62f32e3b.tabs.0.elements.5.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('matrixBlockTypes.5298d815-6445-46e7-bafa-318ec948122e.fieldLayouts.e504e0b8-00fd-449e-92d9-963e62f32e3b.tabs.0.elements.5.warning','null'),('matrixBlockTypes.5298d815-6445-46e7-bafa-318ec948122e.fieldLayouts.e504e0b8-00fd-449e-92d9-963e62f32e3b.tabs.0.elements.5.width','100'),('matrixBlockTypes.5298d815-6445-46e7-bafa-318ec948122e.fieldLayouts.e504e0b8-00fd-449e-92d9-963e62f32e3b.tabs.0.name','\"Content\"'),('matrixBlockTypes.5298d815-6445-46e7-bafa-318ec948122e.fieldLayouts.e504e0b8-00fd-449e-92d9-963e62f32e3b.tabs.0.sortOrder','1'),('matrixBlockTypes.5298d815-6445-46e7-bafa-318ec948122e.fields.039c016d-2191-4827-bd8f-5ba356dc009f.columnSuffix','\"szzhvqiw\"'),('matrixBlockTypes.5298d815-6445-46e7-bafa-318ec948122e.fields.039c016d-2191-4827-bd8f-5ba356dc009f.contentColumnType','\"text\"'),('matrixBlockTypes.5298d815-6445-46e7-bafa-318ec948122e.fields.039c016d-2191-4827-bd8f-5ba356dc009f.fieldGroup','null'),('matrixBlockTypes.5298d815-6445-46e7-bafa-318ec948122e.fields.039c016d-2191-4827-bd8f-5ba356dc009f.handle','\"telephone\"'),('matrixBlockTypes.5298d815-6445-46e7-bafa-318ec948122e.fields.039c016d-2191-4827-bd8f-5ba356dc009f.instructions','\"\"'),('matrixBlockTypes.5298d815-6445-46e7-bafa-318ec948122e.fields.039c016d-2191-4827-bd8f-5ba356dc009f.name','\"Telephone\"'),('matrixBlockTypes.5298d815-6445-46e7-bafa-318ec948122e.fields.039c016d-2191-4827-bd8f-5ba356dc009f.searchable','true'),('matrixBlockTypes.5298d815-6445-46e7-bafa-318ec948122e.fields.039c016d-2191-4827-bd8f-5ba356dc009f.settings.byteLimit','null'),('matrixBlockTypes.5298d815-6445-46e7-bafa-318ec948122e.fields.039c016d-2191-4827-bd8f-5ba356dc009f.settings.charLimit','null'),('matrixBlockTypes.5298d815-6445-46e7-bafa-318ec948122e.fields.039c016d-2191-4827-bd8f-5ba356dc009f.settings.code','\"\"'),('matrixBlockTypes.5298d815-6445-46e7-bafa-318ec948122e.fields.039c016d-2191-4827-bd8f-5ba356dc009f.settings.columnType','\"text\"'),('matrixBlockTypes.5298d815-6445-46e7-bafa-318ec948122e.fields.039c016d-2191-4827-bd8f-5ba356dc009f.settings.initialRows','\"4\"'),('matrixBlockTypes.5298d815-6445-46e7-bafa-318ec948122e.fields.039c016d-2191-4827-bd8f-5ba356dc009f.settings.multiline','\"\"'),('matrixBlockTypes.5298d815-6445-46e7-bafa-318ec948122e.fields.039c016d-2191-4827-bd8f-5ba356dc009f.settings.placeholder','null'),('matrixBlockTypes.5298d815-6445-46e7-bafa-318ec948122e.fields.039c016d-2191-4827-bd8f-5ba356dc009f.settings.uiMode','\"normal\"'),('matrixBlockTypes.5298d815-6445-46e7-bafa-318ec948122e.fields.039c016d-2191-4827-bd8f-5ba356dc009f.translationKeyFormat','null'),('matrixBlockTypes.5298d815-6445-46e7-bafa-318ec948122e.fields.039c016d-2191-4827-bd8f-5ba356dc009f.translationMethod','\"none\"'),('matrixBlockTypes.5298d815-6445-46e7-bafa-318ec948122e.fields.039c016d-2191-4827-bd8f-5ba356dc009f.type','\"craft\\\\fields\\\\PlainText\"'),('matrixBlockTypes.5298d815-6445-46e7-bafa-318ec948122e.fields.1ea724df-ade0-49e2-af62-b1a2a65c08cc.columnSuffix','null'),('matrixBlockTypes.5298d815-6445-46e7-bafa-318ec948122e.fields.1ea724df-ade0-49e2-af62-b1a2a65c08cc.contentColumnType','\"string\"'),('matrixBlockTypes.5298d815-6445-46e7-bafa-318ec948122e.fields.1ea724df-ade0-49e2-af62-b1a2a65c08cc.fieldGroup','null'),('matrixBlockTypes.5298d815-6445-46e7-bafa-318ec948122e.fields.1ea724df-ade0-49e2-af62-b1a2a65c08cc.handle','\"audience\"'),('matrixBlockTypes.5298d815-6445-46e7-bafa-318ec948122e.fields.1ea724df-ade0-49e2-af62-b1a2a65c08cc.instructions','\"Choose who can see this\"'),('matrixBlockTypes.5298d815-6445-46e7-bafa-318ec948122e.fields.1ea724df-ade0-49e2-af62-b1a2a65c08cc.name','\"Audience\"'),('matrixBlockTypes.5298d815-6445-46e7-bafa-318ec948122e.fields.1ea724df-ade0-49e2-af62-b1a2a65c08cc.searchable','true'),('matrixBlockTypes.5298d815-6445-46e7-bafa-318ec948122e.fields.1ea724df-ade0-49e2-af62-b1a2a65c08cc.settings.allowLimit','false'),('matrixBlockTypes.5298d815-6445-46e7-bafa-318ec948122e.fields.1ea724df-ade0-49e2-af62-b1a2a65c08cc.settings.allowMultipleSources','false'),('matrixBlockTypes.5298d815-6445-46e7-bafa-318ec948122e.fields.1ea724df-ade0-49e2-af62-b1a2a65c08cc.settings.allowSelfRelations','false'),('matrixBlockTypes.5298d815-6445-46e7-bafa-318ec948122e.fields.1ea724df-ade0-49e2-af62-b1a2a65c08cc.settings.branchLimit','\"\"'),('matrixBlockTypes.5298d815-6445-46e7-bafa-318ec948122e.fields.1ea724df-ade0-49e2-af62-b1a2a65c08cc.settings.limit','null'),('matrixBlockTypes.5298d815-6445-46e7-bafa-318ec948122e.fields.1ea724df-ade0-49e2-af62-b1a2a65c08cc.settings.localizeRelations','false'),('matrixBlockTypes.5298d815-6445-46e7-bafa-318ec948122e.fields.1ea724df-ade0-49e2-af62-b1a2a65c08cc.settings.selectionLabel','\"\"'),('matrixBlockTypes.5298d815-6445-46e7-bafa-318ec948122e.fields.1ea724df-ade0-49e2-af62-b1a2a65c08cc.settings.showSiteMenu','true'),('matrixBlockTypes.5298d815-6445-46e7-bafa-318ec948122e.fields.1ea724df-ade0-49e2-af62-b1a2a65c08cc.settings.source','\"group:83e3ba4a-e673-4499-bad1-7b8a299d1fcd\"'),('matrixBlockTypes.5298d815-6445-46e7-bafa-318ec948122e.fields.1ea724df-ade0-49e2-af62-b1a2a65c08cc.settings.sources','\"*\"'),('matrixBlockTypes.5298d815-6445-46e7-bafa-318ec948122e.fields.1ea724df-ade0-49e2-af62-b1a2a65c08cc.settings.targetSiteId','null'),('matrixBlockTypes.5298d815-6445-46e7-bafa-318ec948122e.fields.1ea724df-ade0-49e2-af62-b1a2a65c08cc.settings.validateRelatedElements','false'),('matrixBlockTypes.5298d815-6445-46e7-bafa-318ec948122e.fields.1ea724df-ade0-49e2-af62-b1a2a65c08cc.settings.viewMode','null'),('matrixBlockTypes.5298d815-6445-46e7-bafa-318ec948122e.fields.1ea724df-ade0-49e2-af62-b1a2a65c08cc.translationKeyFormat','null'),('matrixBlockTypes.5298d815-6445-46e7-bafa-318ec948122e.fields.1ea724df-ade0-49e2-af62-b1a2a65c08cc.translationMethod','\"site\"'),('matrixBlockTypes.5298d815-6445-46e7-bafa-318ec948122e.fields.1ea724df-ade0-49e2-af62-b1a2a65c08cc.type','\"craft\\\\fields\\\\Categories\"'),('matrixBlockTypes.5298d815-6445-46e7-bafa-318ec948122e.fields.6e658ce8-9b41-4d68-8472-d17816861e32.columnSuffix','\"jprpimdt\"'),('matrixBlockTypes.5298d815-6445-46e7-bafa-318ec948122e.fields.6e658ce8-9b41-4d68-8472-d17816861e32.contentColumnType','\"text\"'),('matrixBlockTypes.5298d815-6445-46e7-bafa-318ec948122e.fields.6e658ce8-9b41-4d68-8472-d17816861e32.fieldGroup','null'),('matrixBlockTypes.5298d815-6445-46e7-bafa-318ec948122e.fields.6e658ce8-9b41-4d68-8472-d17816861e32.handle','\"website\"'),('matrixBlockTypes.5298d815-6445-46e7-bafa-318ec948122e.fields.6e658ce8-9b41-4d68-8472-d17816861e32.instructions','\"\"'),('matrixBlockTypes.5298d815-6445-46e7-bafa-318ec948122e.fields.6e658ce8-9b41-4d68-8472-d17816861e32.name','\"Website\"'),('matrixBlockTypes.5298d815-6445-46e7-bafa-318ec948122e.fields.6e658ce8-9b41-4d68-8472-d17816861e32.searchable','true'),('matrixBlockTypes.5298d815-6445-46e7-bafa-318ec948122e.fields.6e658ce8-9b41-4d68-8472-d17816861e32.settings.byteLimit','null'),('matrixBlockTypes.5298d815-6445-46e7-bafa-318ec948122e.fields.6e658ce8-9b41-4d68-8472-d17816861e32.settings.charLimit','null'),('matrixBlockTypes.5298d815-6445-46e7-bafa-318ec948122e.fields.6e658ce8-9b41-4d68-8472-d17816861e32.settings.code','\"\"'),('matrixBlockTypes.5298d815-6445-46e7-bafa-318ec948122e.fields.6e658ce8-9b41-4d68-8472-d17816861e32.settings.columnType','\"text\"'),('matrixBlockTypes.5298d815-6445-46e7-bafa-318ec948122e.fields.6e658ce8-9b41-4d68-8472-d17816861e32.settings.initialRows','\"4\"'),('matrixBlockTypes.5298d815-6445-46e7-bafa-318ec948122e.fields.6e658ce8-9b41-4d68-8472-d17816861e32.settings.multiline','\"\"'),('matrixBlockTypes.5298d815-6445-46e7-bafa-318ec948122e.fields.6e658ce8-9b41-4d68-8472-d17816861e32.settings.placeholder','null'),('matrixBlockTypes.5298d815-6445-46e7-bafa-318ec948122e.fields.6e658ce8-9b41-4d68-8472-d17816861e32.settings.uiMode','\"normal\"'),('matrixBlockTypes.5298d815-6445-46e7-bafa-318ec948122e.fields.6e658ce8-9b41-4d68-8472-d17816861e32.translationKeyFormat','null'),('matrixBlockTypes.5298d815-6445-46e7-bafa-318ec948122e.fields.6e658ce8-9b41-4d68-8472-d17816861e32.translationMethod','\"none\"'),('matrixBlockTypes.5298d815-6445-46e7-bafa-318ec948122e.fields.6e658ce8-9b41-4d68-8472-d17816861e32.type','\"craft\\\\fields\\\\PlainText\"'),('matrixBlockTypes.5298d815-6445-46e7-bafa-318ec948122e.fields.6f1f8583-ac69-4eee-9a18-b836be8d0c7a.columnSuffix','\"olijfakl\"'),('matrixBlockTypes.5298d815-6445-46e7-bafa-318ec948122e.fields.6f1f8583-ac69-4eee-9a18-b836be8d0c7a.contentColumnType','\"text\"'),('matrixBlockTypes.5298d815-6445-46e7-bafa-318ec948122e.fields.6f1f8583-ac69-4eee-9a18-b836be8d0c7a.fieldGroup','null'),('matrixBlockTypes.5298d815-6445-46e7-bafa-318ec948122e.fields.6f1f8583-ac69-4eee-9a18-b836be8d0c7a.handle','\"postalAddress\"'),('matrixBlockTypes.5298d815-6445-46e7-bafa-318ec948122e.fields.6f1f8583-ac69-4eee-9a18-b836be8d0c7a.instructions','\"\"'),('matrixBlockTypes.5298d815-6445-46e7-bafa-318ec948122e.fields.6f1f8583-ac69-4eee-9a18-b836be8d0c7a.name','\"Postal Address\"'),('matrixBlockTypes.5298d815-6445-46e7-bafa-318ec948122e.fields.6f1f8583-ac69-4eee-9a18-b836be8d0c7a.searchable','true'),('matrixBlockTypes.5298d815-6445-46e7-bafa-318ec948122e.fields.6f1f8583-ac69-4eee-9a18-b836be8d0c7a.settings.byteLimit','null'),('matrixBlockTypes.5298d815-6445-46e7-bafa-318ec948122e.fields.6f1f8583-ac69-4eee-9a18-b836be8d0c7a.settings.charLimit','null'),('matrixBlockTypes.5298d815-6445-46e7-bafa-318ec948122e.fields.6f1f8583-ac69-4eee-9a18-b836be8d0c7a.settings.code','\"\"'),('matrixBlockTypes.5298d815-6445-46e7-bafa-318ec948122e.fields.6f1f8583-ac69-4eee-9a18-b836be8d0c7a.settings.columnType','\"text\"'),('matrixBlockTypes.5298d815-6445-46e7-bafa-318ec948122e.fields.6f1f8583-ac69-4eee-9a18-b836be8d0c7a.settings.initialRows','\"5\"'),('matrixBlockTypes.5298d815-6445-46e7-bafa-318ec948122e.fields.6f1f8583-ac69-4eee-9a18-b836be8d0c7a.settings.multiline','\"1\"'),('matrixBlockTypes.5298d815-6445-46e7-bafa-318ec948122e.fields.6f1f8583-ac69-4eee-9a18-b836be8d0c7a.settings.placeholder','null'),('matrixBlockTypes.5298d815-6445-46e7-bafa-318ec948122e.fields.6f1f8583-ac69-4eee-9a18-b836be8d0c7a.settings.uiMode','\"normal\"'),('matrixBlockTypes.5298d815-6445-46e7-bafa-318ec948122e.fields.6f1f8583-ac69-4eee-9a18-b836be8d0c7a.translationKeyFormat','null'),('matrixBlockTypes.5298d815-6445-46e7-bafa-318ec948122e.fields.6f1f8583-ac69-4eee-9a18-b836be8d0c7a.translationMethod','\"none\"'),('matrixBlockTypes.5298d815-6445-46e7-bafa-318ec948122e.fields.6f1f8583-ac69-4eee-9a18-b836be8d0c7a.type','\"craft\\\\fields\\\\PlainText\"'),('matrixBlockTypes.5298d815-6445-46e7-bafa-318ec948122e.fields.737dbb58-826d-411f-9708-03124661ee3b.columnSuffix','\"jtmaqxlc\"'),('matrixBlockTypes.5298d815-6445-46e7-bafa-318ec948122e.fields.737dbb58-826d-411f-9708-03124661ee3b.contentColumnType','\"text\"'),('matrixBlockTypes.5298d815-6445-46e7-bafa-318ec948122e.fields.737dbb58-826d-411f-9708-03124661ee3b.fieldGroup','null'),('matrixBlockTypes.5298d815-6445-46e7-bafa-318ec948122e.fields.737dbb58-826d-411f-9708-03124661ee3b.handle','\"customClass\"'),('matrixBlockTypes.5298d815-6445-46e7-bafa-318ec948122e.fields.737dbb58-826d-411f-9708-03124661ee3b.instructions','\"Attach one or more classes to this element separated by spaces\"'),('matrixBlockTypes.5298d815-6445-46e7-bafa-318ec948122e.fields.737dbb58-826d-411f-9708-03124661ee3b.name','\"Custom Class\"'),('matrixBlockTypes.5298d815-6445-46e7-bafa-318ec948122e.fields.737dbb58-826d-411f-9708-03124661ee3b.searchable','true'),('matrixBlockTypes.5298d815-6445-46e7-bafa-318ec948122e.fields.737dbb58-826d-411f-9708-03124661ee3b.settings.byteLimit','null'),('matrixBlockTypes.5298d815-6445-46e7-bafa-318ec948122e.fields.737dbb58-826d-411f-9708-03124661ee3b.settings.charLimit','null'),('matrixBlockTypes.5298d815-6445-46e7-bafa-318ec948122e.fields.737dbb58-826d-411f-9708-03124661ee3b.settings.code','\"\"'),('matrixBlockTypes.5298d815-6445-46e7-bafa-318ec948122e.fields.737dbb58-826d-411f-9708-03124661ee3b.settings.columnType','\"text\"'),('matrixBlockTypes.5298d815-6445-46e7-bafa-318ec948122e.fields.737dbb58-826d-411f-9708-03124661ee3b.settings.initialRows','\"4\"'),('matrixBlockTypes.5298d815-6445-46e7-bafa-318ec948122e.fields.737dbb58-826d-411f-9708-03124661ee3b.settings.multiline','\"\"'),('matrixBlockTypes.5298d815-6445-46e7-bafa-318ec948122e.fields.737dbb58-826d-411f-9708-03124661ee3b.settings.placeholder','\"class-1 class-2\"'),('matrixBlockTypes.5298d815-6445-46e7-bafa-318ec948122e.fields.737dbb58-826d-411f-9708-03124661ee3b.settings.uiMode','\"normal\"'),('matrixBlockTypes.5298d815-6445-46e7-bafa-318ec948122e.fields.737dbb58-826d-411f-9708-03124661ee3b.translationKeyFormat','null'),('matrixBlockTypes.5298d815-6445-46e7-bafa-318ec948122e.fields.737dbb58-826d-411f-9708-03124661ee3b.translationMethod','\"none\"'),('matrixBlockTypes.5298d815-6445-46e7-bafa-318ec948122e.fields.737dbb58-826d-411f-9708-03124661ee3b.type','\"craft\\\\fields\\\\PlainText\"'),('matrixBlockTypes.5298d815-6445-46e7-bafa-318ec948122e.fields.cfedab0d-6899-463e-a413-aad6ae194e73.columnSuffix','\"vvwczkro\"'),('matrixBlockTypes.5298d815-6445-46e7-bafa-318ec948122e.fields.cfedab0d-6899-463e-a413-aad6ae194e73.contentColumnType','\"text\"'),('matrixBlockTypes.5298d815-6445-46e7-bafa-318ec948122e.fields.cfedab0d-6899-463e-a413-aad6ae194e73.fieldGroup','null'),('matrixBlockTypes.5298d815-6445-46e7-bafa-318ec948122e.fields.cfedab0d-6899-463e-a413-aad6ae194e73.handle','\"email\"'),('matrixBlockTypes.5298d815-6445-46e7-bafa-318ec948122e.fields.cfedab0d-6899-463e-a413-aad6ae194e73.instructions','\"\"'),('matrixBlockTypes.5298d815-6445-46e7-bafa-318ec948122e.fields.cfedab0d-6899-463e-a413-aad6ae194e73.name','\"Email\"'),('matrixBlockTypes.5298d815-6445-46e7-bafa-318ec948122e.fields.cfedab0d-6899-463e-a413-aad6ae194e73.searchable','true'),('matrixBlockTypes.5298d815-6445-46e7-bafa-318ec948122e.fields.cfedab0d-6899-463e-a413-aad6ae194e73.settings.byteLimit','null'),('matrixBlockTypes.5298d815-6445-46e7-bafa-318ec948122e.fields.cfedab0d-6899-463e-a413-aad6ae194e73.settings.charLimit','null'),('matrixBlockTypes.5298d815-6445-46e7-bafa-318ec948122e.fields.cfedab0d-6899-463e-a413-aad6ae194e73.settings.code','\"\"'),('matrixBlockTypes.5298d815-6445-46e7-bafa-318ec948122e.fields.cfedab0d-6899-463e-a413-aad6ae194e73.settings.columnType','\"text\"'),('matrixBlockTypes.5298d815-6445-46e7-bafa-318ec948122e.fields.cfedab0d-6899-463e-a413-aad6ae194e73.settings.initialRows','\"4\"'),('matrixBlockTypes.5298d815-6445-46e7-bafa-318ec948122e.fields.cfedab0d-6899-463e-a413-aad6ae194e73.settings.multiline','\"\"'),('matrixBlockTypes.5298d815-6445-46e7-bafa-318ec948122e.fields.cfedab0d-6899-463e-a413-aad6ae194e73.settings.placeholder','null'),('matrixBlockTypes.5298d815-6445-46e7-bafa-318ec948122e.fields.cfedab0d-6899-463e-a413-aad6ae194e73.settings.uiMode','\"normal\"'),('matrixBlockTypes.5298d815-6445-46e7-bafa-318ec948122e.fields.cfedab0d-6899-463e-a413-aad6ae194e73.translationKeyFormat','null'),('matrixBlockTypes.5298d815-6445-46e7-bafa-318ec948122e.fields.cfedab0d-6899-463e-a413-aad6ae194e73.translationMethod','\"none\"'),('matrixBlockTypes.5298d815-6445-46e7-bafa-318ec948122e.fields.cfedab0d-6899-463e-a413-aad6ae194e73.type','\"craft\\\\fields\\\\PlainText\"'),('matrixBlockTypes.5298d815-6445-46e7-bafa-318ec948122e.handle','\"address\"'),('matrixBlockTypes.5298d815-6445-46e7-bafa-318ec948122e.name','\"Address\"'),('matrixBlockTypes.5298d815-6445-46e7-bafa-318ec948122e.sortOrder','6'),('matrixBlockTypes.6c426c81-0c6b-4950-a2a4-64e97d8b6e05.field','\"157f1dd3-6182-4ac8-b27f-1119802aa09c\"'),('matrixBlockTypes.6c426c81-0c6b-4950-a2a4-64e97d8b6e05.fieldLayouts.294472ca-be68-4e8f-8e5c-da291a90c918.tabs.0.elements.0.fieldUid','\"aa3c0a64-212a-41e0-8de7-b38bea6cd6d5\"'),('matrixBlockTypes.6c426c81-0c6b-4950-a2a4-64e97d8b6e05.fieldLayouts.294472ca-be68-4e8f-8e5c-da291a90c918.tabs.0.elements.0.instructions','null'),('matrixBlockTypes.6c426c81-0c6b-4950-a2a4-64e97d8b6e05.fieldLayouts.294472ca-be68-4e8f-8e5c-da291a90c918.tabs.0.elements.0.label','null'),('matrixBlockTypes.6c426c81-0c6b-4950-a2a4-64e97d8b6e05.fieldLayouts.294472ca-be68-4e8f-8e5c-da291a90c918.tabs.0.elements.0.required','true'),('matrixBlockTypes.6c426c81-0c6b-4950-a2a4-64e97d8b6e05.fieldLayouts.294472ca-be68-4e8f-8e5c-da291a90c918.tabs.0.elements.0.tip','null'),('matrixBlockTypes.6c426c81-0c6b-4950-a2a4-64e97d8b6e05.fieldLayouts.294472ca-be68-4e8f-8e5c-da291a90c918.tabs.0.elements.0.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('matrixBlockTypes.6c426c81-0c6b-4950-a2a4-64e97d8b6e05.fieldLayouts.294472ca-be68-4e8f-8e5c-da291a90c918.tabs.0.elements.0.warning','null'),('matrixBlockTypes.6c426c81-0c6b-4950-a2a4-64e97d8b6e05.fieldLayouts.294472ca-be68-4e8f-8e5c-da291a90c918.tabs.0.elements.0.width','100'),('matrixBlockTypes.6c426c81-0c6b-4950-a2a4-64e97d8b6e05.fieldLayouts.294472ca-be68-4e8f-8e5c-da291a90c918.tabs.0.elements.1.fieldUid','\"3befc80f-8166-44e4-af10-24bb521cd51a\"'),('matrixBlockTypes.6c426c81-0c6b-4950-a2a4-64e97d8b6e05.fieldLayouts.294472ca-be68-4e8f-8e5c-da291a90c918.tabs.0.elements.1.instructions','null'),('matrixBlockTypes.6c426c81-0c6b-4950-a2a4-64e97d8b6e05.fieldLayouts.294472ca-be68-4e8f-8e5c-da291a90c918.tabs.0.elements.1.label','null'),('matrixBlockTypes.6c426c81-0c6b-4950-a2a4-64e97d8b6e05.fieldLayouts.294472ca-be68-4e8f-8e5c-da291a90c918.tabs.0.elements.1.required','true'),('matrixBlockTypes.6c426c81-0c6b-4950-a2a4-64e97d8b6e05.fieldLayouts.294472ca-be68-4e8f-8e5c-da291a90c918.tabs.0.elements.1.tip','null'),('matrixBlockTypes.6c426c81-0c6b-4950-a2a4-64e97d8b6e05.fieldLayouts.294472ca-be68-4e8f-8e5c-da291a90c918.tabs.0.elements.1.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('matrixBlockTypes.6c426c81-0c6b-4950-a2a4-64e97d8b6e05.fieldLayouts.294472ca-be68-4e8f-8e5c-da291a90c918.tabs.0.elements.1.warning','null'),('matrixBlockTypes.6c426c81-0c6b-4950-a2a4-64e97d8b6e05.fieldLayouts.294472ca-be68-4e8f-8e5c-da291a90c918.tabs.0.elements.1.width','100'),('matrixBlockTypes.6c426c81-0c6b-4950-a2a4-64e97d8b6e05.fieldLayouts.294472ca-be68-4e8f-8e5c-da291a90c918.tabs.0.name','\"Content\"'),('matrixBlockTypes.6c426c81-0c6b-4950-a2a4-64e97d8b6e05.fieldLayouts.294472ca-be68-4e8f-8e5c-da291a90c918.tabs.0.sortOrder','1'),('matrixBlockTypes.6c426c81-0c6b-4950-a2a4-64e97d8b6e05.fields.3befc80f-8166-44e4-af10-24bb521cd51a.columnSuffix','\"jatdtiol\"'),('matrixBlockTypes.6c426c81-0c6b-4950-a2a4-64e97d8b6e05.fields.3befc80f-8166-44e4-af10-24bb521cd51a.contentColumnType','\"text\"'),('matrixBlockTypes.6c426c81-0c6b-4950-a2a4-64e97d8b6e05.fields.3befc80f-8166-44e4-af10-24bb521cd51a.fieldGroup','null'),('matrixBlockTypes.6c426c81-0c6b-4950-a2a4-64e97d8b6e05.fields.3befc80f-8166-44e4-af10-24bb521cd51a.handle','\"columnClass\"'),('matrixBlockTypes.6c426c81-0c6b-4950-a2a4-64e97d8b6e05.fields.3befc80f-8166-44e4-af10-24bb521cd51a.instructions','\"Input a class or string of classes in Bootstrap 12-grid syntax to define this column\"'),('matrixBlockTypes.6c426c81-0c6b-4950-a2a4-64e97d8b6e05.fields.3befc80f-8166-44e4-af10-24bb521cd51a.name','\"Column Class\"'),('matrixBlockTypes.6c426c81-0c6b-4950-a2a4-64e97d8b6e05.fields.3befc80f-8166-44e4-af10-24bb521cd51a.searchable','true'),('matrixBlockTypes.6c426c81-0c6b-4950-a2a4-64e97d8b6e05.fields.3befc80f-8166-44e4-af10-24bb521cd51a.settings.byteLimit','null'),('matrixBlockTypes.6c426c81-0c6b-4950-a2a4-64e97d8b6e05.fields.3befc80f-8166-44e4-af10-24bb521cd51a.settings.charLimit','null'),('matrixBlockTypes.6c426c81-0c6b-4950-a2a4-64e97d8b6e05.fields.3befc80f-8166-44e4-af10-24bb521cd51a.settings.code','\"\"'),('matrixBlockTypes.6c426c81-0c6b-4950-a2a4-64e97d8b6e05.fields.3befc80f-8166-44e4-af10-24bb521cd51a.settings.columnType','\"text\"'),('matrixBlockTypes.6c426c81-0c6b-4950-a2a4-64e97d8b6e05.fields.3befc80f-8166-44e4-af10-24bb521cd51a.settings.initialRows','\"4\"'),('matrixBlockTypes.6c426c81-0c6b-4950-a2a4-64e97d8b6e05.fields.3befc80f-8166-44e4-af10-24bb521cd51a.settings.multiline','\"\"'),('matrixBlockTypes.6c426c81-0c6b-4950-a2a4-64e97d8b6e05.fields.3befc80f-8166-44e4-af10-24bb521cd51a.settings.placeholder','\".col-md-6 .col-lg-4\"'),('matrixBlockTypes.6c426c81-0c6b-4950-a2a4-64e97d8b6e05.fields.3befc80f-8166-44e4-af10-24bb521cd51a.settings.uiMode','\"normal\"'),('matrixBlockTypes.6c426c81-0c6b-4950-a2a4-64e97d8b6e05.fields.3befc80f-8166-44e4-af10-24bb521cd51a.translationKeyFormat','null'),('matrixBlockTypes.6c426c81-0c6b-4950-a2a4-64e97d8b6e05.fields.3befc80f-8166-44e4-af10-24bb521cd51a.translationMethod','\"none\"'),('matrixBlockTypes.6c426c81-0c6b-4950-a2a4-64e97d8b6e05.fields.3befc80f-8166-44e4-af10-24bb521cd51a.type','\"craft\\\\fields\\\\PlainText\"'),('matrixBlockTypes.6c426c81-0c6b-4950-a2a4-64e97d8b6e05.fields.aa3c0a64-212a-41e0-8de7-b38bea6cd6d5.columnSuffix','null'),('matrixBlockTypes.6c426c81-0c6b-4950-a2a4-64e97d8b6e05.fields.aa3c0a64-212a-41e0-8de7-b38bea6cd6d5.contentColumnType','\"string\"'),('matrixBlockTypes.6c426c81-0c6b-4950-a2a4-64e97d8b6e05.fields.aa3c0a64-212a-41e0-8de7-b38bea6cd6d5.fieldGroup','null'),('matrixBlockTypes.6c426c81-0c6b-4950-a2a4-64e97d8b6e05.fields.aa3c0a64-212a-41e0-8de7-b38bea6cd6d5.handle','\"audience\"'),('matrixBlockTypes.6c426c81-0c6b-4950-a2a4-64e97d8b6e05.fields.aa3c0a64-212a-41e0-8de7-b38bea6cd6d5.instructions','\"\"'),('matrixBlockTypes.6c426c81-0c6b-4950-a2a4-64e97d8b6e05.fields.aa3c0a64-212a-41e0-8de7-b38bea6cd6d5.name','\"Audience\"'),('matrixBlockTypes.6c426c81-0c6b-4950-a2a4-64e97d8b6e05.fields.aa3c0a64-212a-41e0-8de7-b38bea6cd6d5.searchable','true'),('matrixBlockTypes.6c426c81-0c6b-4950-a2a4-64e97d8b6e05.fields.aa3c0a64-212a-41e0-8de7-b38bea6cd6d5.settings.allowLimit','false'),('matrixBlockTypes.6c426c81-0c6b-4950-a2a4-64e97d8b6e05.fields.aa3c0a64-212a-41e0-8de7-b38bea6cd6d5.settings.allowMultipleSources','false'),('matrixBlockTypes.6c426c81-0c6b-4950-a2a4-64e97d8b6e05.fields.aa3c0a64-212a-41e0-8de7-b38bea6cd6d5.settings.allowSelfRelations','false'),('matrixBlockTypes.6c426c81-0c6b-4950-a2a4-64e97d8b6e05.fields.aa3c0a64-212a-41e0-8de7-b38bea6cd6d5.settings.branchLimit','\"\"'),('matrixBlockTypes.6c426c81-0c6b-4950-a2a4-64e97d8b6e05.fields.aa3c0a64-212a-41e0-8de7-b38bea6cd6d5.settings.limit','null'),('matrixBlockTypes.6c426c81-0c6b-4950-a2a4-64e97d8b6e05.fields.aa3c0a64-212a-41e0-8de7-b38bea6cd6d5.settings.localizeRelations','false'),('matrixBlockTypes.6c426c81-0c6b-4950-a2a4-64e97d8b6e05.fields.aa3c0a64-212a-41e0-8de7-b38bea6cd6d5.settings.selectionLabel','\"\"'),('matrixBlockTypes.6c426c81-0c6b-4950-a2a4-64e97d8b6e05.fields.aa3c0a64-212a-41e0-8de7-b38bea6cd6d5.settings.showSiteMenu','true'),('matrixBlockTypes.6c426c81-0c6b-4950-a2a4-64e97d8b6e05.fields.aa3c0a64-212a-41e0-8de7-b38bea6cd6d5.settings.source','\"group:83e3ba4a-e673-4499-bad1-7b8a299d1fcd\"'),('matrixBlockTypes.6c426c81-0c6b-4950-a2a4-64e97d8b6e05.fields.aa3c0a64-212a-41e0-8de7-b38bea6cd6d5.settings.sources','\"*\"'),('matrixBlockTypes.6c426c81-0c6b-4950-a2a4-64e97d8b6e05.fields.aa3c0a64-212a-41e0-8de7-b38bea6cd6d5.settings.targetSiteId','null'),('matrixBlockTypes.6c426c81-0c6b-4950-a2a4-64e97d8b6e05.fields.aa3c0a64-212a-41e0-8de7-b38bea6cd6d5.settings.validateRelatedElements','false'),('matrixBlockTypes.6c426c81-0c6b-4950-a2a4-64e97d8b6e05.fields.aa3c0a64-212a-41e0-8de7-b38bea6cd6d5.settings.viewMode','null'),('matrixBlockTypes.6c426c81-0c6b-4950-a2a4-64e97d8b6e05.fields.aa3c0a64-212a-41e0-8de7-b38bea6cd6d5.translationKeyFormat','null'),('matrixBlockTypes.6c426c81-0c6b-4950-a2a4-64e97d8b6e05.fields.aa3c0a64-212a-41e0-8de7-b38bea6cd6d5.translationMethod','\"site\"'),('matrixBlockTypes.6c426c81-0c6b-4950-a2a4-64e97d8b6e05.fields.aa3c0a64-212a-41e0-8de7-b38bea6cd6d5.type','\"craft\\\\fields\\\\Categories\"'),('matrixBlockTypes.6c426c81-0c6b-4950-a2a4-64e97d8b6e05.handle','\"column\"'),('matrixBlockTypes.6c426c81-0c6b-4950-a2a4-64e97d8b6e05.name','\"Column\"'),('matrixBlockTypes.6c426c81-0c6b-4950-a2a4-64e97d8b6e05.sortOrder','1'),('matrixBlockTypes.7f471968-3e65-4fc9-9d7e-3dfc722653a6.field','\"157f1dd3-6182-4ac8-b27f-1119802aa09c\"'),('matrixBlockTypes.7f471968-3e65-4fc9-9d7e-3dfc722653a6.fieldLayouts.451bb070-c3f9-460c-97fe-e82f279bdadf.tabs.0.elements.0.fieldUid','\"e64e80d6-6ff4-417f-817c-9af8c0f34d3e\"'),('matrixBlockTypes.7f471968-3e65-4fc9-9d7e-3dfc722653a6.fieldLayouts.451bb070-c3f9-460c-97fe-e82f279bdadf.tabs.0.elements.0.instructions','null'),('matrixBlockTypes.7f471968-3e65-4fc9-9d7e-3dfc722653a6.fieldLayouts.451bb070-c3f9-460c-97fe-e82f279bdadf.tabs.0.elements.0.label','null'),('matrixBlockTypes.7f471968-3e65-4fc9-9d7e-3dfc722653a6.fieldLayouts.451bb070-c3f9-460c-97fe-e82f279bdadf.tabs.0.elements.0.required','true'),('matrixBlockTypes.7f471968-3e65-4fc9-9d7e-3dfc722653a6.fieldLayouts.451bb070-c3f9-460c-97fe-e82f279bdadf.tabs.0.elements.0.tip','null'),('matrixBlockTypes.7f471968-3e65-4fc9-9d7e-3dfc722653a6.fieldLayouts.451bb070-c3f9-460c-97fe-e82f279bdadf.tabs.0.elements.0.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('matrixBlockTypes.7f471968-3e65-4fc9-9d7e-3dfc722653a6.fieldLayouts.451bb070-c3f9-460c-97fe-e82f279bdadf.tabs.0.elements.0.warning','null'),('matrixBlockTypes.7f471968-3e65-4fc9-9d7e-3dfc722653a6.fieldLayouts.451bb070-c3f9-460c-97fe-e82f279bdadf.tabs.0.elements.0.width','100'),('matrixBlockTypes.7f471968-3e65-4fc9-9d7e-3dfc722653a6.fieldLayouts.451bb070-c3f9-460c-97fe-e82f279bdadf.tabs.0.elements.1.fieldUid','\"75e9cb54-9d9f-469f-ba67-8efd8e45a8b1\"'),('matrixBlockTypes.7f471968-3e65-4fc9-9d7e-3dfc722653a6.fieldLayouts.451bb070-c3f9-460c-97fe-e82f279bdadf.tabs.0.elements.1.instructions','null'),('matrixBlockTypes.7f471968-3e65-4fc9-9d7e-3dfc722653a6.fieldLayouts.451bb070-c3f9-460c-97fe-e82f279bdadf.tabs.0.elements.1.label','null'),('matrixBlockTypes.7f471968-3e65-4fc9-9d7e-3dfc722653a6.fieldLayouts.451bb070-c3f9-460c-97fe-e82f279bdadf.tabs.0.elements.1.required','true'),('matrixBlockTypes.7f471968-3e65-4fc9-9d7e-3dfc722653a6.fieldLayouts.451bb070-c3f9-460c-97fe-e82f279bdadf.tabs.0.elements.1.tip','null'),('matrixBlockTypes.7f471968-3e65-4fc9-9d7e-3dfc722653a6.fieldLayouts.451bb070-c3f9-460c-97fe-e82f279bdadf.tabs.0.elements.1.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('matrixBlockTypes.7f471968-3e65-4fc9-9d7e-3dfc722653a6.fieldLayouts.451bb070-c3f9-460c-97fe-e82f279bdadf.tabs.0.elements.1.warning','null'),('matrixBlockTypes.7f471968-3e65-4fc9-9d7e-3dfc722653a6.fieldLayouts.451bb070-c3f9-460c-97fe-e82f279bdadf.tabs.0.elements.1.width','100'),('matrixBlockTypes.7f471968-3e65-4fc9-9d7e-3dfc722653a6.fieldLayouts.451bb070-c3f9-460c-97fe-e82f279bdadf.tabs.0.elements.2.fieldUid','\"2f8b915c-c957-4e3b-87f9-e26e50f68bfe\"'),('matrixBlockTypes.7f471968-3e65-4fc9-9d7e-3dfc722653a6.fieldLayouts.451bb070-c3f9-460c-97fe-e82f279bdadf.tabs.0.elements.2.instructions','null'),('matrixBlockTypes.7f471968-3e65-4fc9-9d7e-3dfc722653a6.fieldLayouts.451bb070-c3f9-460c-97fe-e82f279bdadf.tabs.0.elements.2.label','null'),('matrixBlockTypes.7f471968-3e65-4fc9-9d7e-3dfc722653a6.fieldLayouts.451bb070-c3f9-460c-97fe-e82f279bdadf.tabs.0.elements.2.required','false'),('matrixBlockTypes.7f471968-3e65-4fc9-9d7e-3dfc722653a6.fieldLayouts.451bb070-c3f9-460c-97fe-e82f279bdadf.tabs.0.elements.2.tip','null'),('matrixBlockTypes.7f471968-3e65-4fc9-9d7e-3dfc722653a6.fieldLayouts.451bb070-c3f9-460c-97fe-e82f279bdadf.tabs.0.elements.2.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('matrixBlockTypes.7f471968-3e65-4fc9-9d7e-3dfc722653a6.fieldLayouts.451bb070-c3f9-460c-97fe-e82f279bdadf.tabs.0.elements.2.warning','null'),('matrixBlockTypes.7f471968-3e65-4fc9-9d7e-3dfc722653a6.fieldLayouts.451bb070-c3f9-460c-97fe-e82f279bdadf.tabs.0.elements.2.width','100'),('matrixBlockTypes.7f471968-3e65-4fc9-9d7e-3dfc722653a6.fieldLayouts.451bb070-c3f9-460c-97fe-e82f279bdadf.tabs.0.name','\"Content\"'),('matrixBlockTypes.7f471968-3e65-4fc9-9d7e-3dfc722653a6.fieldLayouts.451bb070-c3f9-460c-97fe-e82f279bdadf.tabs.0.sortOrder','1'),('matrixBlockTypes.7f471968-3e65-4fc9-9d7e-3dfc722653a6.fields.2f8b915c-c957-4e3b-87f9-e26e50f68bfe.columnSuffix','\"mlxaxmwx\"'),('matrixBlockTypes.7f471968-3e65-4fc9-9d7e-3dfc722653a6.fields.2f8b915c-c957-4e3b-87f9-e26e50f68bfe.contentColumnType','\"text\"'),('matrixBlockTypes.7f471968-3e65-4fc9-9d7e-3dfc722653a6.fields.2f8b915c-c957-4e3b-87f9-e26e50f68bfe.fieldGroup','null'),('matrixBlockTypes.7f471968-3e65-4fc9-9d7e-3dfc722653a6.fields.2f8b915c-c957-4e3b-87f9-e26e50f68bfe.handle','\"customClass\"'),('matrixBlockTypes.7f471968-3e65-4fc9-9d7e-3dfc722653a6.fields.2f8b915c-c957-4e3b-87f9-e26e50f68bfe.instructions','\"\"'),('matrixBlockTypes.7f471968-3e65-4fc9-9d7e-3dfc722653a6.fields.2f8b915c-c957-4e3b-87f9-e26e50f68bfe.name','\"Custom Class\"'),('matrixBlockTypes.7f471968-3e65-4fc9-9d7e-3dfc722653a6.fields.2f8b915c-c957-4e3b-87f9-e26e50f68bfe.searchable','true'),('matrixBlockTypes.7f471968-3e65-4fc9-9d7e-3dfc722653a6.fields.2f8b915c-c957-4e3b-87f9-e26e50f68bfe.settings.byteLimit','null'),('matrixBlockTypes.7f471968-3e65-4fc9-9d7e-3dfc722653a6.fields.2f8b915c-c957-4e3b-87f9-e26e50f68bfe.settings.charLimit','null'),('matrixBlockTypes.7f471968-3e65-4fc9-9d7e-3dfc722653a6.fields.2f8b915c-c957-4e3b-87f9-e26e50f68bfe.settings.code','\"\"'),('matrixBlockTypes.7f471968-3e65-4fc9-9d7e-3dfc722653a6.fields.2f8b915c-c957-4e3b-87f9-e26e50f68bfe.settings.columnType','\"text\"'),('matrixBlockTypes.7f471968-3e65-4fc9-9d7e-3dfc722653a6.fields.2f8b915c-c957-4e3b-87f9-e26e50f68bfe.settings.initialRows','\"4\"'),('matrixBlockTypes.7f471968-3e65-4fc9-9d7e-3dfc722653a6.fields.2f8b915c-c957-4e3b-87f9-e26e50f68bfe.settings.multiline','\"\"'),('matrixBlockTypes.7f471968-3e65-4fc9-9d7e-3dfc722653a6.fields.2f8b915c-c957-4e3b-87f9-e26e50f68bfe.settings.placeholder','null'),('matrixBlockTypes.7f471968-3e65-4fc9-9d7e-3dfc722653a6.fields.2f8b915c-c957-4e3b-87f9-e26e50f68bfe.settings.uiMode','\"normal\"'),('matrixBlockTypes.7f471968-3e65-4fc9-9d7e-3dfc722653a6.fields.2f8b915c-c957-4e3b-87f9-e26e50f68bfe.translationKeyFormat','null'),('matrixBlockTypes.7f471968-3e65-4fc9-9d7e-3dfc722653a6.fields.2f8b915c-c957-4e3b-87f9-e26e50f68bfe.translationMethod','\"none\"'),('matrixBlockTypes.7f471968-3e65-4fc9-9d7e-3dfc722653a6.fields.2f8b915c-c957-4e3b-87f9-e26e50f68bfe.type','\"craft\\\\fields\\\\PlainText\"'),('matrixBlockTypes.7f471968-3e65-4fc9-9d7e-3dfc722653a6.fields.75e9cb54-9d9f-469f-ba67-8efd8e45a8b1.columnSuffix','null'),('matrixBlockTypes.7f471968-3e65-4fc9-9d7e-3dfc722653a6.fields.75e9cb54-9d9f-469f-ba67-8efd8e45a8b1.contentColumnType','\"string\"'),('matrixBlockTypes.7f471968-3e65-4fc9-9d7e-3dfc722653a6.fields.75e9cb54-9d9f-469f-ba67-8efd8e45a8b1.fieldGroup','null'),('matrixBlockTypes.7f471968-3e65-4fc9-9d7e-3dfc722653a6.fields.75e9cb54-9d9f-469f-ba67-8efd8e45a8b1.handle','\"complexEntry\"'),('matrixBlockTypes.7f471968-3e65-4fc9-9d7e-3dfc722653a6.fields.75e9cb54-9d9f-469f-ba67-8efd8e45a8b1.instructions','\"\"'),('matrixBlockTypes.7f471968-3e65-4fc9-9d7e-3dfc722653a6.fields.75e9cb54-9d9f-469f-ba67-8efd8e45a8b1.name','\"Complex Entry\"'),('matrixBlockTypes.7f471968-3e65-4fc9-9d7e-3dfc722653a6.fields.75e9cb54-9d9f-469f-ba67-8efd8e45a8b1.searchable','true'),('matrixBlockTypes.7f471968-3e65-4fc9-9d7e-3dfc722653a6.fields.75e9cb54-9d9f-469f-ba67-8efd8e45a8b1.settings.allowSelfRelations','false'),('matrixBlockTypes.7f471968-3e65-4fc9-9d7e-3dfc722653a6.fields.75e9cb54-9d9f-469f-ba67-8efd8e45a8b1.settings.limit','\"1\"'),('matrixBlockTypes.7f471968-3e65-4fc9-9d7e-3dfc722653a6.fields.75e9cb54-9d9f-469f-ba67-8efd8e45a8b1.settings.localizeRelations','false'),('matrixBlockTypes.7f471968-3e65-4fc9-9d7e-3dfc722653a6.fields.75e9cb54-9d9f-469f-ba67-8efd8e45a8b1.settings.selectionLabel','\"\"'),('matrixBlockTypes.7f471968-3e65-4fc9-9d7e-3dfc722653a6.fields.75e9cb54-9d9f-469f-ba67-8efd8e45a8b1.settings.showSiteMenu','true'),('matrixBlockTypes.7f471968-3e65-4fc9-9d7e-3dfc722653a6.fields.75e9cb54-9d9f-469f-ba67-8efd8e45a8b1.settings.source','null'),('matrixBlockTypes.7f471968-3e65-4fc9-9d7e-3dfc722653a6.fields.75e9cb54-9d9f-469f-ba67-8efd8e45a8b1.settings.sources','\"*\"'),('matrixBlockTypes.7f471968-3e65-4fc9-9d7e-3dfc722653a6.fields.75e9cb54-9d9f-469f-ba67-8efd8e45a8b1.settings.targetSiteId','null'),('matrixBlockTypes.7f471968-3e65-4fc9-9d7e-3dfc722653a6.fields.75e9cb54-9d9f-469f-ba67-8efd8e45a8b1.settings.validateRelatedElements','false'),('matrixBlockTypes.7f471968-3e65-4fc9-9d7e-3dfc722653a6.fields.75e9cb54-9d9f-469f-ba67-8efd8e45a8b1.settings.viewMode','null'),('matrixBlockTypes.7f471968-3e65-4fc9-9d7e-3dfc722653a6.fields.75e9cb54-9d9f-469f-ba67-8efd8e45a8b1.translationKeyFormat','null'),('matrixBlockTypes.7f471968-3e65-4fc9-9d7e-3dfc722653a6.fields.75e9cb54-9d9f-469f-ba67-8efd8e45a8b1.translationMethod','\"site\"'),('matrixBlockTypes.7f471968-3e65-4fc9-9d7e-3dfc722653a6.fields.75e9cb54-9d9f-469f-ba67-8efd8e45a8b1.type','\"craft\\\\fields\\\\Entries\"'),('matrixBlockTypes.7f471968-3e65-4fc9-9d7e-3dfc722653a6.fields.e64e80d6-6ff4-417f-817c-9af8c0f34d3e.columnSuffix','null'),('matrixBlockTypes.7f471968-3e65-4fc9-9d7e-3dfc722653a6.fields.e64e80d6-6ff4-417f-817c-9af8c0f34d3e.contentColumnType','\"string\"'),('matrixBlockTypes.7f471968-3e65-4fc9-9d7e-3dfc722653a6.fields.e64e80d6-6ff4-417f-817c-9af8c0f34d3e.fieldGroup','null'),('matrixBlockTypes.7f471968-3e65-4fc9-9d7e-3dfc722653a6.fields.e64e80d6-6ff4-417f-817c-9af8c0f34d3e.handle','\"audience\"'),('matrixBlockTypes.7f471968-3e65-4fc9-9d7e-3dfc722653a6.fields.e64e80d6-6ff4-417f-817c-9af8c0f34d3e.instructions','\"\"'),('matrixBlockTypes.7f471968-3e65-4fc9-9d7e-3dfc722653a6.fields.e64e80d6-6ff4-417f-817c-9af8c0f34d3e.name','\"Audience\"'),('matrixBlockTypes.7f471968-3e65-4fc9-9d7e-3dfc722653a6.fields.e64e80d6-6ff4-417f-817c-9af8c0f34d3e.searchable','true'),('matrixBlockTypes.7f471968-3e65-4fc9-9d7e-3dfc722653a6.fields.e64e80d6-6ff4-417f-817c-9af8c0f34d3e.settings.allowLimit','false'),('matrixBlockTypes.7f471968-3e65-4fc9-9d7e-3dfc722653a6.fields.e64e80d6-6ff4-417f-817c-9af8c0f34d3e.settings.allowMultipleSources','false'),('matrixBlockTypes.7f471968-3e65-4fc9-9d7e-3dfc722653a6.fields.e64e80d6-6ff4-417f-817c-9af8c0f34d3e.settings.allowSelfRelations','false'),('matrixBlockTypes.7f471968-3e65-4fc9-9d7e-3dfc722653a6.fields.e64e80d6-6ff4-417f-817c-9af8c0f34d3e.settings.branchLimit','\"\"'),('matrixBlockTypes.7f471968-3e65-4fc9-9d7e-3dfc722653a6.fields.e64e80d6-6ff4-417f-817c-9af8c0f34d3e.settings.limit','null'),('matrixBlockTypes.7f471968-3e65-4fc9-9d7e-3dfc722653a6.fields.e64e80d6-6ff4-417f-817c-9af8c0f34d3e.settings.localizeRelations','false'),('matrixBlockTypes.7f471968-3e65-4fc9-9d7e-3dfc722653a6.fields.e64e80d6-6ff4-417f-817c-9af8c0f34d3e.settings.selectionLabel','\"\"'),('matrixBlockTypes.7f471968-3e65-4fc9-9d7e-3dfc722653a6.fields.e64e80d6-6ff4-417f-817c-9af8c0f34d3e.settings.showSiteMenu','true'),('matrixBlockTypes.7f471968-3e65-4fc9-9d7e-3dfc722653a6.fields.e64e80d6-6ff4-417f-817c-9af8c0f34d3e.settings.source','\"group:83e3ba4a-e673-4499-bad1-7b8a299d1fcd\"'),('matrixBlockTypes.7f471968-3e65-4fc9-9d7e-3dfc722653a6.fields.e64e80d6-6ff4-417f-817c-9af8c0f34d3e.settings.sources','\"*\"'),('matrixBlockTypes.7f471968-3e65-4fc9-9d7e-3dfc722653a6.fields.e64e80d6-6ff4-417f-817c-9af8c0f34d3e.settings.targetSiteId','null'),('matrixBlockTypes.7f471968-3e65-4fc9-9d7e-3dfc722653a6.fields.e64e80d6-6ff4-417f-817c-9af8c0f34d3e.settings.validateRelatedElements','false'),('matrixBlockTypes.7f471968-3e65-4fc9-9d7e-3dfc722653a6.fields.e64e80d6-6ff4-417f-817c-9af8c0f34d3e.settings.viewMode','null'),('matrixBlockTypes.7f471968-3e65-4fc9-9d7e-3dfc722653a6.fields.e64e80d6-6ff4-417f-817c-9af8c0f34d3e.translationKeyFormat','null'),('matrixBlockTypes.7f471968-3e65-4fc9-9d7e-3dfc722653a6.fields.e64e80d6-6ff4-417f-817c-9af8c0f34d3e.translationMethod','\"site\"'),('matrixBlockTypes.7f471968-3e65-4fc9-9d7e-3dfc722653a6.fields.e64e80d6-6ff4-417f-817c-9af8c0f34d3e.type','\"craft\\\\fields\\\\Categories\"'),('matrixBlockTypes.7f471968-3e65-4fc9-9d7e-3dfc722653a6.handle','\"complexBlock\"'),('matrixBlockTypes.7f471968-3e65-4fc9-9d7e-3dfc722653a6.name','\"Complex Block\"'),('matrixBlockTypes.7f471968-3e65-4fc9-9d7e-3dfc722653a6.sortOrder','9'),('matrixBlockTypes.8353cd85-1982-4c68-bd49-460886567421.field','\"157f1dd3-6182-4ac8-b27f-1119802aa09c\"'),('matrixBlockTypes.8353cd85-1982-4c68-bd49-460886567421.fieldLayouts.144f3c22-3170-4ad3-8eb2-3d2f12cc6f19.tabs.0.elements.0.fieldUid','\"0c534d0c-c78f-413b-9525-0435ae1dc0e1\"'),('matrixBlockTypes.8353cd85-1982-4c68-bd49-460886567421.fieldLayouts.144f3c22-3170-4ad3-8eb2-3d2f12cc6f19.tabs.0.elements.0.instructions','null'),('matrixBlockTypes.8353cd85-1982-4c68-bd49-460886567421.fieldLayouts.144f3c22-3170-4ad3-8eb2-3d2f12cc6f19.tabs.0.elements.0.label','null'),('matrixBlockTypes.8353cd85-1982-4c68-bd49-460886567421.fieldLayouts.144f3c22-3170-4ad3-8eb2-3d2f12cc6f19.tabs.0.elements.0.required','true'),('matrixBlockTypes.8353cd85-1982-4c68-bd49-460886567421.fieldLayouts.144f3c22-3170-4ad3-8eb2-3d2f12cc6f19.tabs.0.elements.0.tip','null'),('matrixBlockTypes.8353cd85-1982-4c68-bd49-460886567421.fieldLayouts.144f3c22-3170-4ad3-8eb2-3d2f12cc6f19.tabs.0.elements.0.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('matrixBlockTypes.8353cd85-1982-4c68-bd49-460886567421.fieldLayouts.144f3c22-3170-4ad3-8eb2-3d2f12cc6f19.tabs.0.elements.0.warning','null'),('matrixBlockTypes.8353cd85-1982-4c68-bd49-460886567421.fieldLayouts.144f3c22-3170-4ad3-8eb2-3d2f12cc6f19.tabs.0.elements.0.width','100'),('matrixBlockTypes.8353cd85-1982-4c68-bd49-460886567421.fieldLayouts.144f3c22-3170-4ad3-8eb2-3d2f12cc6f19.tabs.0.elements.1.fieldUid','\"8f0cb1cd-4bd3-41db-85e3-fd7868cf17ff\"'),('matrixBlockTypes.8353cd85-1982-4c68-bd49-460886567421.fieldLayouts.144f3c22-3170-4ad3-8eb2-3d2f12cc6f19.tabs.0.elements.1.instructions','null'),('matrixBlockTypes.8353cd85-1982-4c68-bd49-460886567421.fieldLayouts.144f3c22-3170-4ad3-8eb2-3d2f12cc6f19.tabs.0.elements.1.label','null'),('matrixBlockTypes.8353cd85-1982-4c68-bd49-460886567421.fieldLayouts.144f3c22-3170-4ad3-8eb2-3d2f12cc6f19.tabs.0.elements.1.required','true'),('matrixBlockTypes.8353cd85-1982-4c68-bd49-460886567421.fieldLayouts.144f3c22-3170-4ad3-8eb2-3d2f12cc6f19.tabs.0.elements.1.tip','null'),('matrixBlockTypes.8353cd85-1982-4c68-bd49-460886567421.fieldLayouts.144f3c22-3170-4ad3-8eb2-3d2f12cc6f19.tabs.0.elements.1.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('matrixBlockTypes.8353cd85-1982-4c68-bd49-460886567421.fieldLayouts.144f3c22-3170-4ad3-8eb2-3d2f12cc6f19.tabs.0.elements.1.warning','null'),('matrixBlockTypes.8353cd85-1982-4c68-bd49-460886567421.fieldLayouts.144f3c22-3170-4ad3-8eb2-3d2f12cc6f19.tabs.0.elements.1.width','100'),('matrixBlockTypes.8353cd85-1982-4c68-bd49-460886567421.fieldLayouts.144f3c22-3170-4ad3-8eb2-3d2f12cc6f19.tabs.0.elements.2.fieldUid','\"d02b1c70-59a5-4c84-bbc4-ba09ea0b50d3\"'),('matrixBlockTypes.8353cd85-1982-4c68-bd49-460886567421.fieldLayouts.144f3c22-3170-4ad3-8eb2-3d2f12cc6f19.tabs.0.elements.2.instructions','null'),('matrixBlockTypes.8353cd85-1982-4c68-bd49-460886567421.fieldLayouts.144f3c22-3170-4ad3-8eb2-3d2f12cc6f19.tabs.0.elements.2.label','null'),('matrixBlockTypes.8353cd85-1982-4c68-bd49-460886567421.fieldLayouts.144f3c22-3170-4ad3-8eb2-3d2f12cc6f19.tabs.0.elements.2.required','false'),('matrixBlockTypes.8353cd85-1982-4c68-bd49-460886567421.fieldLayouts.144f3c22-3170-4ad3-8eb2-3d2f12cc6f19.tabs.0.elements.2.tip','null'),('matrixBlockTypes.8353cd85-1982-4c68-bd49-460886567421.fieldLayouts.144f3c22-3170-4ad3-8eb2-3d2f12cc6f19.tabs.0.elements.2.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('matrixBlockTypes.8353cd85-1982-4c68-bd49-460886567421.fieldLayouts.144f3c22-3170-4ad3-8eb2-3d2f12cc6f19.tabs.0.elements.2.warning','null'),('matrixBlockTypes.8353cd85-1982-4c68-bd49-460886567421.fieldLayouts.144f3c22-3170-4ad3-8eb2-3d2f12cc6f19.tabs.0.elements.2.width','100'),('matrixBlockTypes.8353cd85-1982-4c68-bd49-460886567421.fieldLayouts.144f3c22-3170-4ad3-8eb2-3d2f12cc6f19.tabs.0.name','\"Content\"'),('matrixBlockTypes.8353cd85-1982-4c68-bd49-460886567421.fieldLayouts.144f3c22-3170-4ad3-8eb2-3d2f12cc6f19.tabs.0.sortOrder','1'),('matrixBlockTypes.8353cd85-1982-4c68-bd49-460886567421.fields.0c534d0c-c78f-413b-9525-0435ae1dc0e1.columnSuffix','null'),('matrixBlockTypes.8353cd85-1982-4c68-bd49-460886567421.fields.0c534d0c-c78f-413b-9525-0435ae1dc0e1.contentColumnType','\"string\"'),('matrixBlockTypes.8353cd85-1982-4c68-bd49-460886567421.fields.0c534d0c-c78f-413b-9525-0435ae1dc0e1.fieldGroup','null'),('matrixBlockTypes.8353cd85-1982-4c68-bd49-460886567421.fields.0c534d0c-c78f-413b-9525-0435ae1dc0e1.handle','\"audience\"'),('matrixBlockTypes.8353cd85-1982-4c68-bd49-460886567421.fields.0c534d0c-c78f-413b-9525-0435ae1dc0e1.instructions','\"\"'),('matrixBlockTypes.8353cd85-1982-4c68-bd49-460886567421.fields.0c534d0c-c78f-413b-9525-0435ae1dc0e1.name','\"Audience\"'),('matrixBlockTypes.8353cd85-1982-4c68-bd49-460886567421.fields.0c534d0c-c78f-413b-9525-0435ae1dc0e1.searchable','true'),('matrixBlockTypes.8353cd85-1982-4c68-bd49-460886567421.fields.0c534d0c-c78f-413b-9525-0435ae1dc0e1.settings.allowLimit','false'),('matrixBlockTypes.8353cd85-1982-4c68-bd49-460886567421.fields.0c534d0c-c78f-413b-9525-0435ae1dc0e1.settings.allowMultipleSources','false'),('matrixBlockTypes.8353cd85-1982-4c68-bd49-460886567421.fields.0c534d0c-c78f-413b-9525-0435ae1dc0e1.settings.allowSelfRelations','false'),('matrixBlockTypes.8353cd85-1982-4c68-bd49-460886567421.fields.0c534d0c-c78f-413b-9525-0435ae1dc0e1.settings.branchLimit','\"\"'),('matrixBlockTypes.8353cd85-1982-4c68-bd49-460886567421.fields.0c534d0c-c78f-413b-9525-0435ae1dc0e1.settings.limit','null'),('matrixBlockTypes.8353cd85-1982-4c68-bd49-460886567421.fields.0c534d0c-c78f-413b-9525-0435ae1dc0e1.settings.localizeRelations','false'),('matrixBlockTypes.8353cd85-1982-4c68-bd49-460886567421.fields.0c534d0c-c78f-413b-9525-0435ae1dc0e1.settings.selectionLabel','\"\"'),('matrixBlockTypes.8353cd85-1982-4c68-bd49-460886567421.fields.0c534d0c-c78f-413b-9525-0435ae1dc0e1.settings.showSiteMenu','true'),('matrixBlockTypes.8353cd85-1982-4c68-bd49-460886567421.fields.0c534d0c-c78f-413b-9525-0435ae1dc0e1.settings.source','\"group:83e3ba4a-e673-4499-bad1-7b8a299d1fcd\"'),('matrixBlockTypes.8353cd85-1982-4c68-bd49-460886567421.fields.0c534d0c-c78f-413b-9525-0435ae1dc0e1.settings.sources','\"*\"'),('matrixBlockTypes.8353cd85-1982-4c68-bd49-460886567421.fields.0c534d0c-c78f-413b-9525-0435ae1dc0e1.settings.targetSiteId','null'),('matrixBlockTypes.8353cd85-1982-4c68-bd49-460886567421.fields.0c534d0c-c78f-413b-9525-0435ae1dc0e1.settings.validateRelatedElements','false'),('matrixBlockTypes.8353cd85-1982-4c68-bd49-460886567421.fields.0c534d0c-c78f-413b-9525-0435ae1dc0e1.settings.viewMode','null'),('matrixBlockTypes.8353cd85-1982-4c68-bd49-460886567421.fields.0c534d0c-c78f-413b-9525-0435ae1dc0e1.translationKeyFormat','null'),('matrixBlockTypes.8353cd85-1982-4c68-bd49-460886567421.fields.0c534d0c-c78f-413b-9525-0435ae1dc0e1.translationMethod','\"site\"'),('matrixBlockTypes.8353cd85-1982-4c68-bd49-460886567421.fields.0c534d0c-c78f-413b-9525-0435ae1dc0e1.type','\"craft\\\\fields\\\\Categories\"'),('matrixBlockTypes.8353cd85-1982-4c68-bd49-460886567421.fields.8f0cb1cd-4bd3-41db-85e3-fd7868cf17ff.columnSuffix','null'),('matrixBlockTypes.8353cd85-1982-4c68-bd49-460886567421.fields.8f0cb1cd-4bd3-41db-85e3-fd7868cf17ff.contentColumnType','\"text\"'),('matrixBlockTypes.8353cd85-1982-4c68-bd49-460886567421.fields.8f0cb1cd-4bd3-41db-85e3-fd7868cf17ff.fieldGroup','null'),('matrixBlockTypes.8353cd85-1982-4c68-bd49-460886567421.fields.8f0cb1cd-4bd3-41db-85e3-fd7868cf17ff.handle','\"tableData\"'),('matrixBlockTypes.8353cd85-1982-4c68-bd49-460886567421.fields.8f0cb1cd-4bd3-41db-85e3-fd7868cf17ff.instructions','\"Enter your table data; you can use \\\"null\\\" to merge with the preceding cell, or \\\"blank\\\" to leave a cutout where a cell would be.\"'),('matrixBlockTypes.8353cd85-1982-4c68-bd49-460886567421.fields.8f0cb1cd-4bd3-41db-85e3-fd7868cf17ff.name','\"Table Data\"'),('matrixBlockTypes.8353cd85-1982-4c68-bd49-460886567421.fields.8f0cb1cd-4bd3-41db-85e3-fd7868cf17ff.searchable','true'),('matrixBlockTypes.8353cd85-1982-4c68-bd49-460886567421.fields.8f0cb1cd-4bd3-41db-85e3-fd7868cf17ff.settings.addRowLabel','\"Add a row\"'),('matrixBlockTypes.8353cd85-1982-4c68-bd49-460886567421.fields.8f0cb1cd-4bd3-41db-85e3-fd7868cf17ff.settings.columns.__assoc__.0.0','\"col1\"'),('matrixBlockTypes.8353cd85-1982-4c68-bd49-460886567421.fields.8f0cb1cd-4bd3-41db-85e3-fd7868cf17ff.settings.columns.__assoc__.0.1.__assoc__.0.0','\"heading\"'),('matrixBlockTypes.8353cd85-1982-4c68-bd49-460886567421.fields.8f0cb1cd-4bd3-41db-85e3-fd7868cf17ff.settings.columns.__assoc__.0.1.__assoc__.0.1','\"\"'),('matrixBlockTypes.8353cd85-1982-4c68-bd49-460886567421.fields.8f0cb1cd-4bd3-41db-85e3-fd7868cf17ff.settings.columns.__assoc__.0.1.__assoc__.1.0','\"handle\"'),('matrixBlockTypes.8353cd85-1982-4c68-bd49-460886567421.fields.8f0cb1cd-4bd3-41db-85e3-fd7868cf17ff.settings.columns.__assoc__.0.1.__assoc__.1.1','\"\"'),('matrixBlockTypes.8353cd85-1982-4c68-bd49-460886567421.fields.8f0cb1cd-4bd3-41db-85e3-fd7868cf17ff.settings.columns.__assoc__.0.1.__assoc__.2.0','\"width\"'),('matrixBlockTypes.8353cd85-1982-4c68-bd49-460886567421.fields.8f0cb1cd-4bd3-41db-85e3-fd7868cf17ff.settings.columns.__assoc__.0.1.__assoc__.2.1','\"\"'),('matrixBlockTypes.8353cd85-1982-4c68-bd49-460886567421.fields.8f0cb1cd-4bd3-41db-85e3-fd7868cf17ff.settings.columns.__assoc__.0.1.__assoc__.3.0','\"type\"'),('matrixBlockTypes.8353cd85-1982-4c68-bd49-460886567421.fields.8f0cb1cd-4bd3-41db-85e3-fd7868cf17ff.settings.columns.__assoc__.0.1.__assoc__.3.1','\"singleline\"'),('matrixBlockTypes.8353cd85-1982-4c68-bd49-460886567421.fields.8f0cb1cd-4bd3-41db-85e3-fd7868cf17ff.settings.columnType','\"text\"'),('matrixBlockTypes.8353cd85-1982-4c68-bd49-460886567421.fields.8f0cb1cd-4bd3-41db-85e3-fd7868cf17ff.settings.defaults.0.__assoc__.0.0','\"col1\"'),('matrixBlockTypes.8353cd85-1982-4c68-bd49-460886567421.fields.8f0cb1cd-4bd3-41db-85e3-fd7868cf17ff.settings.defaults.0.__assoc__.0.1','\"\"'),('matrixBlockTypes.8353cd85-1982-4c68-bd49-460886567421.fields.8f0cb1cd-4bd3-41db-85e3-fd7868cf17ff.settings.maxRows','\"\"'),('matrixBlockTypes.8353cd85-1982-4c68-bd49-460886567421.fields.8f0cb1cd-4bd3-41db-85e3-fd7868cf17ff.settings.minRows','\"\"'),('matrixBlockTypes.8353cd85-1982-4c68-bd49-460886567421.fields.8f0cb1cd-4bd3-41db-85e3-fd7868cf17ff.translationKeyFormat','null'),('matrixBlockTypes.8353cd85-1982-4c68-bd49-460886567421.fields.8f0cb1cd-4bd3-41db-85e3-fd7868cf17ff.translationMethod','\"none\"'),('matrixBlockTypes.8353cd85-1982-4c68-bd49-460886567421.fields.8f0cb1cd-4bd3-41db-85e3-fd7868cf17ff.type','\"craft\\\\fields\\\\Table\"'),('matrixBlockTypes.8353cd85-1982-4c68-bd49-460886567421.fields.d02b1c70-59a5-4c84-bbc4-ba09ea0b50d3.columnSuffix','\"hquyacjy\"'),('matrixBlockTypes.8353cd85-1982-4c68-bd49-460886567421.fields.d02b1c70-59a5-4c84-bbc4-ba09ea0b50d3.contentColumnType','\"text\"'),('matrixBlockTypes.8353cd85-1982-4c68-bd49-460886567421.fields.d02b1c70-59a5-4c84-bbc4-ba09ea0b50d3.fieldGroup','null'),('matrixBlockTypes.8353cd85-1982-4c68-bd49-460886567421.fields.d02b1c70-59a5-4c84-bbc4-ba09ea0b50d3.handle','\"customClass\"'),('matrixBlockTypes.8353cd85-1982-4c68-bd49-460886567421.fields.d02b1c70-59a5-4c84-bbc4-ba09ea0b50d3.instructions','\"Attach one or more classes to this element separated by spaces\"'),('matrixBlockTypes.8353cd85-1982-4c68-bd49-460886567421.fields.d02b1c70-59a5-4c84-bbc4-ba09ea0b50d3.name','\"Custom Class\"'),('matrixBlockTypes.8353cd85-1982-4c68-bd49-460886567421.fields.d02b1c70-59a5-4c84-bbc4-ba09ea0b50d3.searchable','true'),('matrixBlockTypes.8353cd85-1982-4c68-bd49-460886567421.fields.d02b1c70-59a5-4c84-bbc4-ba09ea0b50d3.settings.byteLimit','null'),('matrixBlockTypes.8353cd85-1982-4c68-bd49-460886567421.fields.d02b1c70-59a5-4c84-bbc4-ba09ea0b50d3.settings.charLimit','null'),('matrixBlockTypes.8353cd85-1982-4c68-bd49-460886567421.fields.d02b1c70-59a5-4c84-bbc4-ba09ea0b50d3.settings.code','\"\"'),('matrixBlockTypes.8353cd85-1982-4c68-bd49-460886567421.fields.d02b1c70-59a5-4c84-bbc4-ba09ea0b50d3.settings.columnType','\"text\"'),('matrixBlockTypes.8353cd85-1982-4c68-bd49-460886567421.fields.d02b1c70-59a5-4c84-bbc4-ba09ea0b50d3.settings.initialRows','\"4\"'),('matrixBlockTypes.8353cd85-1982-4c68-bd49-460886567421.fields.d02b1c70-59a5-4c84-bbc4-ba09ea0b50d3.settings.multiline','\"\"'),('matrixBlockTypes.8353cd85-1982-4c68-bd49-460886567421.fields.d02b1c70-59a5-4c84-bbc4-ba09ea0b50d3.settings.placeholder','\"class-1 class-2\"'),('matrixBlockTypes.8353cd85-1982-4c68-bd49-460886567421.fields.d02b1c70-59a5-4c84-bbc4-ba09ea0b50d3.settings.uiMode','\"normal\"'),('matrixBlockTypes.8353cd85-1982-4c68-bd49-460886567421.fields.d02b1c70-59a5-4c84-bbc4-ba09ea0b50d3.translationKeyFormat','null'),('matrixBlockTypes.8353cd85-1982-4c68-bd49-460886567421.fields.d02b1c70-59a5-4c84-bbc4-ba09ea0b50d3.translationMethod','\"none\"'),('matrixBlockTypes.8353cd85-1982-4c68-bd49-460886567421.fields.d02b1c70-59a5-4c84-bbc4-ba09ea0b50d3.type','\"craft\\\\fields\\\\PlainText\"'),('matrixBlockTypes.8353cd85-1982-4c68-bd49-460886567421.handle','\"table\"'),('matrixBlockTypes.8353cd85-1982-4c68-bd49-460886567421.name','\"Table\"'),('matrixBlockTypes.8353cd85-1982-4c68-bd49-460886567421.sortOrder','7'),('matrixBlockTypes.9b05b02e-f98b-449e-b40f-47f0b266affd.field','\"157f1dd3-6182-4ac8-b27f-1119802aa09c\"'),('matrixBlockTypes.9b05b02e-f98b-449e-b40f-47f0b266affd.fieldLayouts.8b7f0b54-ce93-4615-847e-039794f3ec57.tabs.0.elements.0.fieldUid','\"c14b2c7a-f075-42ac-a27a-626b0354f3dd\"'),('matrixBlockTypes.9b05b02e-f98b-449e-b40f-47f0b266affd.fieldLayouts.8b7f0b54-ce93-4615-847e-039794f3ec57.tabs.0.elements.0.instructions','null'),('matrixBlockTypes.9b05b02e-f98b-449e-b40f-47f0b266affd.fieldLayouts.8b7f0b54-ce93-4615-847e-039794f3ec57.tabs.0.elements.0.label','null'),('matrixBlockTypes.9b05b02e-f98b-449e-b40f-47f0b266affd.fieldLayouts.8b7f0b54-ce93-4615-847e-039794f3ec57.tabs.0.elements.0.required','true'),('matrixBlockTypes.9b05b02e-f98b-449e-b40f-47f0b266affd.fieldLayouts.8b7f0b54-ce93-4615-847e-039794f3ec57.tabs.0.elements.0.tip','null'),('matrixBlockTypes.9b05b02e-f98b-449e-b40f-47f0b266affd.fieldLayouts.8b7f0b54-ce93-4615-847e-039794f3ec57.tabs.0.elements.0.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('matrixBlockTypes.9b05b02e-f98b-449e-b40f-47f0b266affd.fieldLayouts.8b7f0b54-ce93-4615-847e-039794f3ec57.tabs.0.elements.0.warning','null'),('matrixBlockTypes.9b05b02e-f98b-449e-b40f-47f0b266affd.fieldLayouts.8b7f0b54-ce93-4615-847e-039794f3ec57.tabs.0.elements.0.width','100'),('matrixBlockTypes.9b05b02e-f98b-449e-b40f-47f0b266affd.fieldLayouts.8b7f0b54-ce93-4615-847e-039794f3ec57.tabs.0.elements.1.fieldUid','\"ea33628d-a48f-4bd5-9b85-71027daf9e78\"'),('matrixBlockTypes.9b05b02e-f98b-449e-b40f-47f0b266affd.fieldLayouts.8b7f0b54-ce93-4615-847e-039794f3ec57.tabs.0.elements.1.instructions','null'),('matrixBlockTypes.9b05b02e-f98b-449e-b40f-47f0b266affd.fieldLayouts.8b7f0b54-ce93-4615-847e-039794f3ec57.tabs.0.elements.1.label','null'),('matrixBlockTypes.9b05b02e-f98b-449e-b40f-47f0b266affd.fieldLayouts.8b7f0b54-ce93-4615-847e-039794f3ec57.tabs.0.elements.1.required','true'),('matrixBlockTypes.9b05b02e-f98b-449e-b40f-47f0b266affd.fieldLayouts.8b7f0b54-ce93-4615-847e-039794f3ec57.tabs.0.elements.1.tip','null'),('matrixBlockTypes.9b05b02e-f98b-449e-b40f-47f0b266affd.fieldLayouts.8b7f0b54-ce93-4615-847e-039794f3ec57.tabs.0.elements.1.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('matrixBlockTypes.9b05b02e-f98b-449e-b40f-47f0b266affd.fieldLayouts.8b7f0b54-ce93-4615-847e-039794f3ec57.tabs.0.elements.1.warning','null'),('matrixBlockTypes.9b05b02e-f98b-449e-b40f-47f0b266affd.fieldLayouts.8b7f0b54-ce93-4615-847e-039794f3ec57.tabs.0.elements.1.width','100'),('matrixBlockTypes.9b05b02e-f98b-449e-b40f-47f0b266affd.fieldLayouts.8b7f0b54-ce93-4615-847e-039794f3ec57.tabs.0.elements.2.fieldUid','\"7ed32bef-623e-42e1-9d39-f0d17d46e90e\"'),('matrixBlockTypes.9b05b02e-f98b-449e-b40f-47f0b266affd.fieldLayouts.8b7f0b54-ce93-4615-847e-039794f3ec57.tabs.0.elements.2.instructions','null'),('matrixBlockTypes.9b05b02e-f98b-449e-b40f-47f0b266affd.fieldLayouts.8b7f0b54-ce93-4615-847e-039794f3ec57.tabs.0.elements.2.label','null'),('matrixBlockTypes.9b05b02e-f98b-449e-b40f-47f0b266affd.fieldLayouts.8b7f0b54-ce93-4615-847e-039794f3ec57.tabs.0.elements.2.required','false'),('matrixBlockTypes.9b05b02e-f98b-449e-b40f-47f0b266affd.fieldLayouts.8b7f0b54-ce93-4615-847e-039794f3ec57.tabs.0.elements.2.tip','null'),('matrixBlockTypes.9b05b02e-f98b-449e-b40f-47f0b266affd.fieldLayouts.8b7f0b54-ce93-4615-847e-039794f3ec57.tabs.0.elements.2.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('matrixBlockTypes.9b05b02e-f98b-449e-b40f-47f0b266affd.fieldLayouts.8b7f0b54-ce93-4615-847e-039794f3ec57.tabs.0.elements.2.warning','null'),('matrixBlockTypes.9b05b02e-f98b-449e-b40f-47f0b266affd.fieldLayouts.8b7f0b54-ce93-4615-847e-039794f3ec57.tabs.0.elements.2.width','100'),('matrixBlockTypes.9b05b02e-f98b-449e-b40f-47f0b266affd.fieldLayouts.8b7f0b54-ce93-4615-847e-039794f3ec57.tabs.0.name','\"Content\"'),('matrixBlockTypes.9b05b02e-f98b-449e-b40f-47f0b266affd.fieldLayouts.8b7f0b54-ce93-4615-847e-039794f3ec57.tabs.0.sortOrder','1'),('matrixBlockTypes.9b05b02e-f98b-449e-b40f-47f0b266affd.fields.7ed32bef-623e-42e1-9d39-f0d17d46e90e.columnSuffix','\"fgviknbj\"'),('matrixBlockTypes.9b05b02e-f98b-449e-b40f-47f0b266affd.fields.7ed32bef-623e-42e1-9d39-f0d17d46e90e.contentColumnType','\"text\"'),('matrixBlockTypes.9b05b02e-f98b-449e-b40f-47f0b266affd.fields.7ed32bef-623e-42e1-9d39-f0d17d46e90e.fieldGroup','null'),('matrixBlockTypes.9b05b02e-f98b-449e-b40f-47f0b266affd.fields.7ed32bef-623e-42e1-9d39-f0d17d46e90e.handle','\"customClass\"'),('matrixBlockTypes.9b05b02e-f98b-449e-b40f-47f0b266affd.fields.7ed32bef-623e-42e1-9d39-f0d17d46e90e.instructions','\"Attach one or more classes to this element separated by spaces\"'),('matrixBlockTypes.9b05b02e-f98b-449e-b40f-47f0b266affd.fields.7ed32bef-623e-42e1-9d39-f0d17d46e90e.name','\"Custom Class\"'),('matrixBlockTypes.9b05b02e-f98b-449e-b40f-47f0b266affd.fields.7ed32bef-623e-42e1-9d39-f0d17d46e90e.searchable','true'),('matrixBlockTypes.9b05b02e-f98b-449e-b40f-47f0b266affd.fields.7ed32bef-623e-42e1-9d39-f0d17d46e90e.settings.byteLimit','null'),('matrixBlockTypes.9b05b02e-f98b-449e-b40f-47f0b266affd.fields.7ed32bef-623e-42e1-9d39-f0d17d46e90e.settings.charLimit','null'),('matrixBlockTypes.9b05b02e-f98b-449e-b40f-47f0b266affd.fields.7ed32bef-623e-42e1-9d39-f0d17d46e90e.settings.code','\"\"'),('matrixBlockTypes.9b05b02e-f98b-449e-b40f-47f0b266affd.fields.7ed32bef-623e-42e1-9d39-f0d17d46e90e.settings.columnType','\"text\"'),('matrixBlockTypes.9b05b02e-f98b-449e-b40f-47f0b266affd.fields.7ed32bef-623e-42e1-9d39-f0d17d46e90e.settings.initialRows','\"4\"'),('matrixBlockTypes.9b05b02e-f98b-449e-b40f-47f0b266affd.fields.7ed32bef-623e-42e1-9d39-f0d17d46e90e.settings.multiline','\"\"'),('matrixBlockTypes.9b05b02e-f98b-449e-b40f-47f0b266affd.fields.7ed32bef-623e-42e1-9d39-f0d17d46e90e.settings.placeholder','\"class-1 class-2\"'),('matrixBlockTypes.9b05b02e-f98b-449e-b40f-47f0b266affd.fields.7ed32bef-623e-42e1-9d39-f0d17d46e90e.settings.uiMode','\"normal\"'),('matrixBlockTypes.9b05b02e-f98b-449e-b40f-47f0b266affd.fields.7ed32bef-623e-42e1-9d39-f0d17d46e90e.translationKeyFormat','null'),('matrixBlockTypes.9b05b02e-f98b-449e-b40f-47f0b266affd.fields.7ed32bef-623e-42e1-9d39-f0d17d46e90e.translationMethod','\"none\"'),('matrixBlockTypes.9b05b02e-f98b-449e-b40f-47f0b266affd.fields.7ed32bef-623e-42e1-9d39-f0d17d46e90e.type','\"craft\\\\fields\\\\PlainText\"'),('matrixBlockTypes.9b05b02e-f98b-449e-b40f-47f0b266affd.fields.c14b2c7a-f075-42ac-a27a-626b0354f3dd.columnSuffix','null'),('matrixBlockTypes.9b05b02e-f98b-449e-b40f-47f0b266affd.fields.c14b2c7a-f075-42ac-a27a-626b0354f3dd.contentColumnType','\"string\"'),('matrixBlockTypes.9b05b02e-f98b-449e-b40f-47f0b266affd.fields.c14b2c7a-f075-42ac-a27a-626b0354f3dd.fieldGroup','null'),('matrixBlockTypes.9b05b02e-f98b-449e-b40f-47f0b266affd.fields.c14b2c7a-f075-42ac-a27a-626b0354f3dd.handle','\"audience\"'),('matrixBlockTypes.9b05b02e-f98b-449e-b40f-47f0b266affd.fields.c14b2c7a-f075-42ac-a27a-626b0354f3dd.instructions','\"Choose who can see this\"'),('matrixBlockTypes.9b05b02e-f98b-449e-b40f-47f0b266affd.fields.c14b2c7a-f075-42ac-a27a-626b0354f3dd.name','\"Audience\"'),('matrixBlockTypes.9b05b02e-f98b-449e-b40f-47f0b266affd.fields.c14b2c7a-f075-42ac-a27a-626b0354f3dd.searchable','true'),('matrixBlockTypes.9b05b02e-f98b-449e-b40f-47f0b266affd.fields.c14b2c7a-f075-42ac-a27a-626b0354f3dd.settings.allowLimit','false'),('matrixBlockTypes.9b05b02e-f98b-449e-b40f-47f0b266affd.fields.c14b2c7a-f075-42ac-a27a-626b0354f3dd.settings.allowMultipleSources','false'),('matrixBlockTypes.9b05b02e-f98b-449e-b40f-47f0b266affd.fields.c14b2c7a-f075-42ac-a27a-626b0354f3dd.settings.allowSelfRelations','false'),('matrixBlockTypes.9b05b02e-f98b-449e-b40f-47f0b266affd.fields.c14b2c7a-f075-42ac-a27a-626b0354f3dd.settings.branchLimit','\"\"'),('matrixBlockTypes.9b05b02e-f98b-449e-b40f-47f0b266affd.fields.c14b2c7a-f075-42ac-a27a-626b0354f3dd.settings.limit','null'),('matrixBlockTypes.9b05b02e-f98b-449e-b40f-47f0b266affd.fields.c14b2c7a-f075-42ac-a27a-626b0354f3dd.settings.localizeRelations','false'),('matrixBlockTypes.9b05b02e-f98b-449e-b40f-47f0b266affd.fields.c14b2c7a-f075-42ac-a27a-626b0354f3dd.settings.selectionLabel','\"\"'),('matrixBlockTypes.9b05b02e-f98b-449e-b40f-47f0b266affd.fields.c14b2c7a-f075-42ac-a27a-626b0354f3dd.settings.showSiteMenu','true'),('matrixBlockTypes.9b05b02e-f98b-449e-b40f-47f0b266affd.fields.c14b2c7a-f075-42ac-a27a-626b0354f3dd.settings.source','\"group:83e3ba4a-e673-4499-bad1-7b8a299d1fcd\"'),('matrixBlockTypes.9b05b02e-f98b-449e-b40f-47f0b266affd.fields.c14b2c7a-f075-42ac-a27a-626b0354f3dd.settings.sources','\"*\"'),('matrixBlockTypes.9b05b02e-f98b-449e-b40f-47f0b266affd.fields.c14b2c7a-f075-42ac-a27a-626b0354f3dd.settings.targetSiteId','null'),('matrixBlockTypes.9b05b02e-f98b-449e-b40f-47f0b266affd.fields.c14b2c7a-f075-42ac-a27a-626b0354f3dd.settings.validateRelatedElements','false'),('matrixBlockTypes.9b05b02e-f98b-449e-b40f-47f0b266affd.fields.c14b2c7a-f075-42ac-a27a-626b0354f3dd.settings.viewMode','null'),('matrixBlockTypes.9b05b02e-f98b-449e-b40f-47f0b266affd.fields.c14b2c7a-f075-42ac-a27a-626b0354f3dd.translationKeyFormat','null'),('matrixBlockTypes.9b05b02e-f98b-449e-b40f-47f0b266affd.fields.c14b2c7a-f075-42ac-a27a-626b0354f3dd.translationMethod','\"site\"'),('matrixBlockTypes.9b05b02e-f98b-449e-b40f-47f0b266affd.fields.c14b2c7a-f075-42ac-a27a-626b0354f3dd.type','\"craft\\\\fields\\\\Categories\"'),('matrixBlockTypes.9b05b02e-f98b-449e-b40f-47f0b266affd.fields.ea33628d-a48f-4bd5-9b85-71027daf9e78.columnSuffix','\"mcxqzuzy\"'),('matrixBlockTypes.9b05b02e-f98b-449e-b40f-47f0b266affd.fields.ea33628d-a48f-4bd5-9b85-71027daf9e78.contentColumnType','\"text\"'),('matrixBlockTypes.9b05b02e-f98b-449e-b40f-47f0b266affd.fields.ea33628d-a48f-4bd5-9b85-71027daf9e78.fieldGroup','null'),('matrixBlockTypes.9b05b02e-f98b-449e-b40f-47f0b266affd.fields.ea33628d-a48f-4bd5-9b85-71027daf9e78.handle','\"text\"'),('matrixBlockTypes.9b05b02e-f98b-449e-b40f-47f0b266affd.fields.ea33628d-a48f-4bd5-9b85-71027daf9e78.instructions','\"\"'),('matrixBlockTypes.9b05b02e-f98b-449e-b40f-47f0b266affd.fields.ea33628d-a48f-4bd5-9b85-71027daf9e78.name','\"Text\"'),('matrixBlockTypes.9b05b02e-f98b-449e-b40f-47f0b266affd.fields.ea33628d-a48f-4bd5-9b85-71027daf9e78.searchable','false'),('matrixBlockTypes.9b05b02e-f98b-449e-b40f-47f0b266affd.fields.ea33628d-a48f-4bd5-9b85-71027daf9e78.settings.availableTransforms','\"*\"'),('matrixBlockTypes.9b05b02e-f98b-449e-b40f-47f0b266affd.fields.ea33628d-a48f-4bd5-9b85-71027daf9e78.settings.availableVolumes','\"*\"'),('matrixBlockTypes.9b05b02e-f98b-449e-b40f-47f0b266affd.fields.ea33628d-a48f-4bd5-9b85-71027daf9e78.settings.columnType','\"text\"'),('matrixBlockTypes.9b05b02e-f98b-449e-b40f-47f0b266affd.fields.ea33628d-a48f-4bd5-9b85-71027daf9e78.settings.configSelectionMode','\"choose\"'),('matrixBlockTypes.9b05b02e-f98b-449e-b40f-47f0b266affd.fields.ea33628d-a48f-4bd5-9b85-71027daf9e78.settings.defaultTransform','\"\"'),('matrixBlockTypes.9b05b02e-f98b-449e-b40f-47f0b266affd.fields.ea33628d-a48f-4bd5-9b85-71027daf9e78.settings.manualConfig','\"\"'),('matrixBlockTypes.9b05b02e-f98b-449e-b40f-47f0b266affd.fields.ea33628d-a48f-4bd5-9b85-71027daf9e78.settings.purifierConfig','\"\"'),('matrixBlockTypes.9b05b02e-f98b-449e-b40f-47f0b266affd.fields.ea33628d-a48f-4bd5-9b85-71027daf9e78.settings.purifyHtml','\"1\"'),('matrixBlockTypes.9b05b02e-f98b-449e-b40f-47f0b266affd.fields.ea33628d-a48f-4bd5-9b85-71027daf9e78.settings.redactorConfig','\"\"'),('matrixBlockTypes.9b05b02e-f98b-449e-b40f-47f0b266affd.fields.ea33628d-a48f-4bd5-9b85-71027daf9e78.settings.removeEmptyTags','\"1\"'),('matrixBlockTypes.9b05b02e-f98b-449e-b40f-47f0b266affd.fields.ea33628d-a48f-4bd5-9b85-71027daf9e78.settings.removeInlineStyles','\"1\"'),('matrixBlockTypes.9b05b02e-f98b-449e-b40f-47f0b266affd.fields.ea33628d-a48f-4bd5-9b85-71027daf9e78.settings.removeNbsp','\"1\"'),('matrixBlockTypes.9b05b02e-f98b-449e-b40f-47f0b266affd.fields.ea33628d-a48f-4bd5-9b85-71027daf9e78.settings.showHtmlButtonForNonAdmins','\"\"'),('matrixBlockTypes.9b05b02e-f98b-449e-b40f-47f0b266affd.fields.ea33628d-a48f-4bd5-9b85-71027daf9e78.settings.showUnpermittedFiles','false'),('matrixBlockTypes.9b05b02e-f98b-449e-b40f-47f0b266affd.fields.ea33628d-a48f-4bd5-9b85-71027daf9e78.settings.showUnpermittedVolumes','false'),('matrixBlockTypes.9b05b02e-f98b-449e-b40f-47f0b266affd.fields.ea33628d-a48f-4bd5-9b85-71027daf9e78.settings.uiMode','\"enlarged\"'),('matrixBlockTypes.9b05b02e-f98b-449e-b40f-47f0b266affd.fields.ea33628d-a48f-4bd5-9b85-71027daf9e78.translationKeyFormat','null'),('matrixBlockTypes.9b05b02e-f98b-449e-b40f-47f0b266affd.fields.ea33628d-a48f-4bd5-9b85-71027daf9e78.translationMethod','\"none\"'),('matrixBlockTypes.9b05b02e-f98b-449e-b40f-47f0b266affd.fields.ea33628d-a48f-4bd5-9b85-71027daf9e78.type','\"craft\\\\redactor\\\\Field\"'),('matrixBlockTypes.9b05b02e-f98b-449e-b40f-47f0b266affd.handle','\"regularCopy\"'),('matrixBlockTypes.9b05b02e-f98b-449e-b40f-47f0b266affd.name','\"Regular Copy\"'),('matrixBlockTypes.9b05b02e-f98b-449e-b40f-47f0b266affd.sortOrder','3'),('matrixBlockTypes.affd0670-6a09-4d9a-ace6-4cb4c4087185.field','\"157f1dd3-6182-4ac8-b27f-1119802aa09c\"'),('matrixBlockTypes.affd0670-6a09-4d9a-ace6-4cb4c4087185.fieldLayouts.737c9845-37bd-4b93-9d31-fd4c3e428a8d.tabs.0.elements.0.fieldUid','\"98ba90d6-c4e0-4165-8a65-cfe75da45067\"'),('matrixBlockTypes.affd0670-6a09-4d9a-ace6-4cb4c4087185.fieldLayouts.737c9845-37bd-4b93-9d31-fd4c3e428a8d.tabs.0.elements.0.instructions','null'),('matrixBlockTypes.affd0670-6a09-4d9a-ace6-4cb4c4087185.fieldLayouts.737c9845-37bd-4b93-9d31-fd4c3e428a8d.tabs.0.elements.0.label','null'),('matrixBlockTypes.affd0670-6a09-4d9a-ace6-4cb4c4087185.fieldLayouts.737c9845-37bd-4b93-9d31-fd4c3e428a8d.tabs.0.elements.0.required','true'),('matrixBlockTypes.affd0670-6a09-4d9a-ace6-4cb4c4087185.fieldLayouts.737c9845-37bd-4b93-9d31-fd4c3e428a8d.tabs.0.elements.0.tip','null'),('matrixBlockTypes.affd0670-6a09-4d9a-ace6-4cb4c4087185.fieldLayouts.737c9845-37bd-4b93-9d31-fd4c3e428a8d.tabs.0.elements.0.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('matrixBlockTypes.affd0670-6a09-4d9a-ace6-4cb4c4087185.fieldLayouts.737c9845-37bd-4b93-9d31-fd4c3e428a8d.tabs.0.elements.0.warning','null'),('matrixBlockTypes.affd0670-6a09-4d9a-ace6-4cb4c4087185.fieldLayouts.737c9845-37bd-4b93-9d31-fd4c3e428a8d.tabs.0.elements.0.width','100'),('matrixBlockTypes.affd0670-6a09-4d9a-ace6-4cb4c4087185.fieldLayouts.737c9845-37bd-4b93-9d31-fd4c3e428a8d.tabs.0.elements.1.fieldUid','\"eeea89ef-7322-4496-8d2c-fbfcd389a19a\"'),('matrixBlockTypes.affd0670-6a09-4d9a-ace6-4cb4c4087185.fieldLayouts.737c9845-37bd-4b93-9d31-fd4c3e428a8d.tabs.0.elements.1.instructions','null'),('matrixBlockTypes.affd0670-6a09-4d9a-ace6-4cb4c4087185.fieldLayouts.737c9845-37bd-4b93-9d31-fd4c3e428a8d.tabs.0.elements.1.label','null'),('matrixBlockTypes.affd0670-6a09-4d9a-ace6-4cb4c4087185.fieldLayouts.737c9845-37bd-4b93-9d31-fd4c3e428a8d.tabs.0.elements.1.required','true'),('matrixBlockTypes.affd0670-6a09-4d9a-ace6-4cb4c4087185.fieldLayouts.737c9845-37bd-4b93-9d31-fd4c3e428a8d.tabs.0.elements.1.tip','null'),('matrixBlockTypes.affd0670-6a09-4d9a-ace6-4cb4c4087185.fieldLayouts.737c9845-37bd-4b93-9d31-fd4c3e428a8d.tabs.0.elements.1.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('matrixBlockTypes.affd0670-6a09-4d9a-ace6-4cb4c4087185.fieldLayouts.737c9845-37bd-4b93-9d31-fd4c3e428a8d.tabs.0.elements.1.warning','null'),('matrixBlockTypes.affd0670-6a09-4d9a-ace6-4cb4c4087185.fieldLayouts.737c9845-37bd-4b93-9d31-fd4c3e428a8d.tabs.0.elements.1.width','100'),('matrixBlockTypes.affd0670-6a09-4d9a-ace6-4cb4c4087185.fieldLayouts.737c9845-37bd-4b93-9d31-fd4c3e428a8d.tabs.0.elements.2.fieldUid','\"b2855976-f3ec-4276-9d7e-59ddee4961f2\"'),('matrixBlockTypes.affd0670-6a09-4d9a-ace6-4cb4c4087185.fieldLayouts.737c9845-37bd-4b93-9d31-fd4c3e428a8d.tabs.0.elements.2.instructions','null'),('matrixBlockTypes.affd0670-6a09-4d9a-ace6-4cb4c4087185.fieldLayouts.737c9845-37bd-4b93-9d31-fd4c3e428a8d.tabs.0.elements.2.label','null'),('matrixBlockTypes.affd0670-6a09-4d9a-ace6-4cb4c4087185.fieldLayouts.737c9845-37bd-4b93-9d31-fd4c3e428a8d.tabs.0.elements.2.required','true'),('matrixBlockTypes.affd0670-6a09-4d9a-ace6-4cb4c4087185.fieldLayouts.737c9845-37bd-4b93-9d31-fd4c3e428a8d.tabs.0.elements.2.tip','null'),('matrixBlockTypes.affd0670-6a09-4d9a-ace6-4cb4c4087185.fieldLayouts.737c9845-37bd-4b93-9d31-fd4c3e428a8d.tabs.0.elements.2.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('matrixBlockTypes.affd0670-6a09-4d9a-ace6-4cb4c4087185.fieldLayouts.737c9845-37bd-4b93-9d31-fd4c3e428a8d.tabs.0.elements.2.warning','null'),('matrixBlockTypes.affd0670-6a09-4d9a-ace6-4cb4c4087185.fieldLayouts.737c9845-37bd-4b93-9d31-fd4c3e428a8d.tabs.0.elements.2.width','100'),('matrixBlockTypes.affd0670-6a09-4d9a-ace6-4cb4c4087185.fieldLayouts.737c9845-37bd-4b93-9d31-fd4c3e428a8d.tabs.0.elements.3.fieldUid','\"23957a29-2d27-416d-8e13-e090279313f3\"'),('matrixBlockTypes.affd0670-6a09-4d9a-ace6-4cb4c4087185.fieldLayouts.737c9845-37bd-4b93-9d31-fd4c3e428a8d.tabs.0.elements.3.instructions','null'),('matrixBlockTypes.affd0670-6a09-4d9a-ace6-4cb4c4087185.fieldLayouts.737c9845-37bd-4b93-9d31-fd4c3e428a8d.tabs.0.elements.3.label','null'),('matrixBlockTypes.affd0670-6a09-4d9a-ace6-4cb4c4087185.fieldLayouts.737c9845-37bd-4b93-9d31-fd4c3e428a8d.tabs.0.elements.3.required','false'),('matrixBlockTypes.affd0670-6a09-4d9a-ace6-4cb4c4087185.fieldLayouts.737c9845-37bd-4b93-9d31-fd4c3e428a8d.tabs.0.elements.3.tip','null'),('matrixBlockTypes.affd0670-6a09-4d9a-ace6-4cb4c4087185.fieldLayouts.737c9845-37bd-4b93-9d31-fd4c3e428a8d.tabs.0.elements.3.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('matrixBlockTypes.affd0670-6a09-4d9a-ace6-4cb4c4087185.fieldLayouts.737c9845-37bd-4b93-9d31-fd4c3e428a8d.tabs.0.elements.3.warning','null'),('matrixBlockTypes.affd0670-6a09-4d9a-ace6-4cb4c4087185.fieldLayouts.737c9845-37bd-4b93-9d31-fd4c3e428a8d.tabs.0.elements.3.width','100'),('matrixBlockTypes.affd0670-6a09-4d9a-ace6-4cb4c4087185.fieldLayouts.737c9845-37bd-4b93-9d31-fd4c3e428a8d.tabs.0.name','\"Content\"'),('matrixBlockTypes.affd0670-6a09-4d9a-ace6-4cb4c4087185.fieldLayouts.737c9845-37bd-4b93-9d31-fd4c3e428a8d.tabs.0.sortOrder','1'),('matrixBlockTypes.affd0670-6a09-4d9a-ace6-4cb4c4087185.fields.23957a29-2d27-416d-8e13-e090279313f3.columnSuffix','\"kbmzzrla\"'),('matrixBlockTypes.affd0670-6a09-4d9a-ace6-4cb4c4087185.fields.23957a29-2d27-416d-8e13-e090279313f3.contentColumnType','\"text\"'),('matrixBlockTypes.affd0670-6a09-4d9a-ace6-4cb4c4087185.fields.23957a29-2d27-416d-8e13-e090279313f3.fieldGroup','null'),('matrixBlockTypes.affd0670-6a09-4d9a-ace6-4cb4c4087185.fields.23957a29-2d27-416d-8e13-e090279313f3.handle','\"customClass\"'),('matrixBlockTypes.affd0670-6a09-4d9a-ace6-4cb4c4087185.fields.23957a29-2d27-416d-8e13-e090279313f3.instructions','\"Attach one or more classes to this element separated by spaces\"'),('matrixBlockTypes.affd0670-6a09-4d9a-ace6-4cb4c4087185.fields.23957a29-2d27-416d-8e13-e090279313f3.name','\"Custom Class\"'),('matrixBlockTypes.affd0670-6a09-4d9a-ace6-4cb4c4087185.fields.23957a29-2d27-416d-8e13-e090279313f3.searchable','true'),('matrixBlockTypes.affd0670-6a09-4d9a-ace6-4cb4c4087185.fields.23957a29-2d27-416d-8e13-e090279313f3.settings.byteLimit','null'),('matrixBlockTypes.affd0670-6a09-4d9a-ace6-4cb4c4087185.fields.23957a29-2d27-416d-8e13-e090279313f3.settings.charLimit','null'),('matrixBlockTypes.affd0670-6a09-4d9a-ace6-4cb4c4087185.fields.23957a29-2d27-416d-8e13-e090279313f3.settings.code','\"\"'),('matrixBlockTypes.affd0670-6a09-4d9a-ace6-4cb4c4087185.fields.23957a29-2d27-416d-8e13-e090279313f3.settings.columnType','\"text\"'),('matrixBlockTypes.affd0670-6a09-4d9a-ace6-4cb4c4087185.fields.23957a29-2d27-416d-8e13-e090279313f3.settings.initialRows','\"4\"'),('matrixBlockTypes.affd0670-6a09-4d9a-ace6-4cb4c4087185.fields.23957a29-2d27-416d-8e13-e090279313f3.settings.multiline','\"\"'),('matrixBlockTypes.affd0670-6a09-4d9a-ace6-4cb4c4087185.fields.23957a29-2d27-416d-8e13-e090279313f3.settings.placeholder','\"class-1 class-2\"'),('matrixBlockTypes.affd0670-6a09-4d9a-ace6-4cb4c4087185.fields.23957a29-2d27-416d-8e13-e090279313f3.settings.uiMode','\"normal\"'),('matrixBlockTypes.affd0670-6a09-4d9a-ace6-4cb4c4087185.fields.23957a29-2d27-416d-8e13-e090279313f3.translationKeyFormat','null'),('matrixBlockTypes.affd0670-6a09-4d9a-ace6-4cb4c4087185.fields.23957a29-2d27-416d-8e13-e090279313f3.translationMethod','\"none\"'),('matrixBlockTypes.affd0670-6a09-4d9a-ace6-4cb4c4087185.fields.23957a29-2d27-416d-8e13-e090279313f3.type','\"craft\\\\fields\\\\PlainText\"'),('matrixBlockTypes.affd0670-6a09-4d9a-ace6-4cb4c4087185.fields.98ba90d6-c4e0-4165-8a65-cfe75da45067.columnSuffix','null'),('matrixBlockTypes.affd0670-6a09-4d9a-ace6-4cb4c4087185.fields.98ba90d6-c4e0-4165-8a65-cfe75da45067.contentColumnType','\"string\"'),('matrixBlockTypes.affd0670-6a09-4d9a-ace6-4cb4c4087185.fields.98ba90d6-c4e0-4165-8a65-cfe75da45067.fieldGroup','null'),('matrixBlockTypes.affd0670-6a09-4d9a-ace6-4cb4c4087185.fields.98ba90d6-c4e0-4165-8a65-cfe75da45067.handle','\"audience\"'),('matrixBlockTypes.affd0670-6a09-4d9a-ace6-4cb4c4087185.fields.98ba90d6-c4e0-4165-8a65-cfe75da45067.instructions','\"Choose who can see this\"'),('matrixBlockTypes.affd0670-6a09-4d9a-ace6-4cb4c4087185.fields.98ba90d6-c4e0-4165-8a65-cfe75da45067.name','\"Audience\"'),('matrixBlockTypes.affd0670-6a09-4d9a-ace6-4cb4c4087185.fields.98ba90d6-c4e0-4165-8a65-cfe75da45067.searchable','true'),('matrixBlockTypes.affd0670-6a09-4d9a-ace6-4cb4c4087185.fields.98ba90d6-c4e0-4165-8a65-cfe75da45067.settings.allowLimit','false'),('matrixBlockTypes.affd0670-6a09-4d9a-ace6-4cb4c4087185.fields.98ba90d6-c4e0-4165-8a65-cfe75da45067.settings.allowMultipleSources','false'),('matrixBlockTypes.affd0670-6a09-4d9a-ace6-4cb4c4087185.fields.98ba90d6-c4e0-4165-8a65-cfe75da45067.settings.allowSelfRelations','false'),('matrixBlockTypes.affd0670-6a09-4d9a-ace6-4cb4c4087185.fields.98ba90d6-c4e0-4165-8a65-cfe75da45067.settings.branchLimit','\"\"'),('matrixBlockTypes.affd0670-6a09-4d9a-ace6-4cb4c4087185.fields.98ba90d6-c4e0-4165-8a65-cfe75da45067.settings.limit','null'),('matrixBlockTypes.affd0670-6a09-4d9a-ace6-4cb4c4087185.fields.98ba90d6-c4e0-4165-8a65-cfe75da45067.settings.localizeRelations','false'),('matrixBlockTypes.affd0670-6a09-4d9a-ace6-4cb4c4087185.fields.98ba90d6-c4e0-4165-8a65-cfe75da45067.settings.selectionLabel','\"\"'),('matrixBlockTypes.affd0670-6a09-4d9a-ace6-4cb4c4087185.fields.98ba90d6-c4e0-4165-8a65-cfe75da45067.settings.showSiteMenu','true'),('matrixBlockTypes.affd0670-6a09-4d9a-ace6-4cb4c4087185.fields.98ba90d6-c4e0-4165-8a65-cfe75da45067.settings.source','\"group:83e3ba4a-e673-4499-bad1-7b8a299d1fcd\"'),('matrixBlockTypes.affd0670-6a09-4d9a-ace6-4cb4c4087185.fields.98ba90d6-c4e0-4165-8a65-cfe75da45067.settings.sources','\"*\"'),('matrixBlockTypes.affd0670-6a09-4d9a-ace6-4cb4c4087185.fields.98ba90d6-c4e0-4165-8a65-cfe75da45067.settings.targetSiteId','null'),('matrixBlockTypes.affd0670-6a09-4d9a-ace6-4cb4c4087185.fields.98ba90d6-c4e0-4165-8a65-cfe75da45067.settings.validateRelatedElements','false'),('matrixBlockTypes.affd0670-6a09-4d9a-ace6-4cb4c4087185.fields.98ba90d6-c4e0-4165-8a65-cfe75da45067.settings.viewMode','null'),('matrixBlockTypes.affd0670-6a09-4d9a-ace6-4cb4c4087185.fields.98ba90d6-c4e0-4165-8a65-cfe75da45067.translationKeyFormat','null'),('matrixBlockTypes.affd0670-6a09-4d9a-ace6-4cb4c4087185.fields.98ba90d6-c4e0-4165-8a65-cfe75da45067.translationMethod','\"site\"'),('matrixBlockTypes.affd0670-6a09-4d9a-ace6-4cb4c4087185.fields.98ba90d6-c4e0-4165-8a65-cfe75da45067.type','\"craft\\\\fields\\\\Categories\"'),('matrixBlockTypes.affd0670-6a09-4d9a-ace6-4cb4c4087185.fields.b2855976-f3ec-4276-9d7e-59ddee4961f2.columnSuffix','\"gaekoolf\"'),('matrixBlockTypes.affd0670-6a09-4d9a-ace6-4cb4c4087185.fields.b2855976-f3ec-4276-9d7e-59ddee4961f2.contentColumnType','\"string\"'),('matrixBlockTypes.affd0670-6a09-4d9a-ace6-4cb4c4087185.fields.b2855976-f3ec-4276-9d7e-59ddee4961f2.fieldGroup','null'),('matrixBlockTypes.affd0670-6a09-4d9a-ace6-4cb4c4087185.fields.b2855976-f3ec-4276-9d7e-59ddee4961f2.handle','\"headingLevel\"'),('matrixBlockTypes.affd0670-6a09-4d9a-ace6-4cb4c4087185.fields.b2855976-f3ec-4276-9d7e-59ddee4961f2.instructions','\"Choose a level from 2-6 (the page title is Heading Level 1). Sections and sub sections should be nested, e.g., Level 3s will be considered subsections of the previous Level 2.\"'),('matrixBlockTypes.affd0670-6a09-4d9a-ace6-4cb4c4087185.fields.b2855976-f3ec-4276-9d7e-59ddee4961f2.name','\"Heading Level\"'),('matrixBlockTypes.affd0670-6a09-4d9a-ace6-4cb4c4087185.fields.b2855976-f3ec-4276-9d7e-59ddee4961f2.searchable','true'),('matrixBlockTypes.affd0670-6a09-4d9a-ace6-4cb4c4087185.fields.b2855976-f3ec-4276-9d7e-59ddee4961f2.settings.optgroups','true'),('matrixBlockTypes.affd0670-6a09-4d9a-ace6-4cb4c4087185.fields.b2855976-f3ec-4276-9d7e-59ddee4961f2.settings.options.0.__assoc__.0.0','\"label\"'),('matrixBlockTypes.affd0670-6a09-4d9a-ace6-4cb4c4087185.fields.b2855976-f3ec-4276-9d7e-59ddee4961f2.settings.options.0.__assoc__.0.1','\"Level 2\"'),('matrixBlockTypes.affd0670-6a09-4d9a-ace6-4cb4c4087185.fields.b2855976-f3ec-4276-9d7e-59ddee4961f2.settings.options.0.__assoc__.1.0','\"value\"'),('matrixBlockTypes.affd0670-6a09-4d9a-ace6-4cb4c4087185.fields.b2855976-f3ec-4276-9d7e-59ddee4961f2.settings.options.0.__assoc__.1.1','\"h2\"'),('matrixBlockTypes.affd0670-6a09-4d9a-ace6-4cb4c4087185.fields.b2855976-f3ec-4276-9d7e-59ddee4961f2.settings.options.0.__assoc__.2.0','\"default\"'),('matrixBlockTypes.affd0670-6a09-4d9a-ace6-4cb4c4087185.fields.b2855976-f3ec-4276-9d7e-59ddee4961f2.settings.options.0.__assoc__.2.1','\"1\"'),('matrixBlockTypes.affd0670-6a09-4d9a-ace6-4cb4c4087185.fields.b2855976-f3ec-4276-9d7e-59ddee4961f2.settings.options.1.__assoc__.0.0','\"label\"'),('matrixBlockTypes.affd0670-6a09-4d9a-ace6-4cb4c4087185.fields.b2855976-f3ec-4276-9d7e-59ddee4961f2.settings.options.1.__assoc__.0.1','\"Level 3\"'),('matrixBlockTypes.affd0670-6a09-4d9a-ace6-4cb4c4087185.fields.b2855976-f3ec-4276-9d7e-59ddee4961f2.settings.options.1.__assoc__.1.0','\"value\"'),('matrixBlockTypes.affd0670-6a09-4d9a-ace6-4cb4c4087185.fields.b2855976-f3ec-4276-9d7e-59ddee4961f2.settings.options.1.__assoc__.1.1','\"h3\"'),('matrixBlockTypes.affd0670-6a09-4d9a-ace6-4cb4c4087185.fields.b2855976-f3ec-4276-9d7e-59ddee4961f2.settings.options.1.__assoc__.2.0','\"default\"'),('matrixBlockTypes.affd0670-6a09-4d9a-ace6-4cb4c4087185.fields.b2855976-f3ec-4276-9d7e-59ddee4961f2.settings.options.1.__assoc__.2.1','\"\"'),('matrixBlockTypes.affd0670-6a09-4d9a-ace6-4cb4c4087185.fields.b2855976-f3ec-4276-9d7e-59ddee4961f2.settings.options.2.__assoc__.0.0','\"label\"'),('matrixBlockTypes.affd0670-6a09-4d9a-ace6-4cb4c4087185.fields.b2855976-f3ec-4276-9d7e-59ddee4961f2.settings.options.2.__assoc__.0.1','\"Level 4\"'),('matrixBlockTypes.affd0670-6a09-4d9a-ace6-4cb4c4087185.fields.b2855976-f3ec-4276-9d7e-59ddee4961f2.settings.options.2.__assoc__.1.0','\"value\"'),('matrixBlockTypes.affd0670-6a09-4d9a-ace6-4cb4c4087185.fields.b2855976-f3ec-4276-9d7e-59ddee4961f2.settings.options.2.__assoc__.1.1','\"h4\"'),('matrixBlockTypes.affd0670-6a09-4d9a-ace6-4cb4c4087185.fields.b2855976-f3ec-4276-9d7e-59ddee4961f2.settings.options.2.__assoc__.2.0','\"default\"'),('matrixBlockTypes.affd0670-6a09-4d9a-ace6-4cb4c4087185.fields.b2855976-f3ec-4276-9d7e-59ddee4961f2.settings.options.2.__assoc__.2.1','\"\"'),('matrixBlockTypes.affd0670-6a09-4d9a-ace6-4cb4c4087185.fields.b2855976-f3ec-4276-9d7e-59ddee4961f2.settings.options.3.__assoc__.0.0','\"label\"'),('matrixBlockTypes.affd0670-6a09-4d9a-ace6-4cb4c4087185.fields.b2855976-f3ec-4276-9d7e-59ddee4961f2.settings.options.3.__assoc__.0.1','\"Level 5\"'),('matrixBlockTypes.affd0670-6a09-4d9a-ace6-4cb4c4087185.fields.b2855976-f3ec-4276-9d7e-59ddee4961f2.settings.options.3.__assoc__.1.0','\"value\"'),('matrixBlockTypes.affd0670-6a09-4d9a-ace6-4cb4c4087185.fields.b2855976-f3ec-4276-9d7e-59ddee4961f2.settings.options.3.__assoc__.1.1','\"h5\"'),('matrixBlockTypes.affd0670-6a09-4d9a-ace6-4cb4c4087185.fields.b2855976-f3ec-4276-9d7e-59ddee4961f2.settings.options.3.__assoc__.2.0','\"default\"'),('matrixBlockTypes.affd0670-6a09-4d9a-ace6-4cb4c4087185.fields.b2855976-f3ec-4276-9d7e-59ddee4961f2.settings.options.3.__assoc__.2.1','\"\"'),('matrixBlockTypes.affd0670-6a09-4d9a-ace6-4cb4c4087185.fields.b2855976-f3ec-4276-9d7e-59ddee4961f2.settings.options.4.__assoc__.0.0','\"label\"'),('matrixBlockTypes.affd0670-6a09-4d9a-ace6-4cb4c4087185.fields.b2855976-f3ec-4276-9d7e-59ddee4961f2.settings.options.4.__assoc__.0.1','\"Level 6\"'),('matrixBlockTypes.affd0670-6a09-4d9a-ace6-4cb4c4087185.fields.b2855976-f3ec-4276-9d7e-59ddee4961f2.settings.options.4.__assoc__.1.0','\"value\"'),('matrixBlockTypes.affd0670-6a09-4d9a-ace6-4cb4c4087185.fields.b2855976-f3ec-4276-9d7e-59ddee4961f2.settings.options.4.__assoc__.1.1','\"h6\"'),('matrixBlockTypes.affd0670-6a09-4d9a-ace6-4cb4c4087185.fields.b2855976-f3ec-4276-9d7e-59ddee4961f2.settings.options.4.__assoc__.2.0','\"default\"'),('matrixBlockTypes.affd0670-6a09-4d9a-ace6-4cb4c4087185.fields.b2855976-f3ec-4276-9d7e-59ddee4961f2.settings.options.4.__assoc__.2.1','\"\"'),('matrixBlockTypes.affd0670-6a09-4d9a-ace6-4cb4c4087185.fields.b2855976-f3ec-4276-9d7e-59ddee4961f2.translationKeyFormat','null'),('matrixBlockTypes.affd0670-6a09-4d9a-ace6-4cb4c4087185.fields.b2855976-f3ec-4276-9d7e-59ddee4961f2.translationMethod','\"none\"'),('matrixBlockTypes.affd0670-6a09-4d9a-ace6-4cb4c4087185.fields.b2855976-f3ec-4276-9d7e-59ddee4961f2.type','\"craft\\\\fields\\\\Dropdown\"'),('matrixBlockTypes.affd0670-6a09-4d9a-ace6-4cb4c4087185.fields.eeea89ef-7322-4496-8d2c-fbfcd389a19a.columnSuffix','\"rmifqbic\"'),('matrixBlockTypes.affd0670-6a09-4d9a-ace6-4cb4c4087185.fields.eeea89ef-7322-4496-8d2c-fbfcd389a19a.contentColumnType','\"text\"'),('matrixBlockTypes.affd0670-6a09-4d9a-ace6-4cb4c4087185.fields.eeea89ef-7322-4496-8d2c-fbfcd389a19a.fieldGroup','null'),('matrixBlockTypes.affd0670-6a09-4d9a-ace6-4cb4c4087185.fields.eeea89ef-7322-4496-8d2c-fbfcd389a19a.handle','\"headingText\"'),('matrixBlockTypes.affd0670-6a09-4d9a-ace6-4cb4c4087185.fields.eeea89ef-7322-4496-8d2c-fbfcd389a19a.instructions','\"\"'),('matrixBlockTypes.affd0670-6a09-4d9a-ace6-4cb4c4087185.fields.eeea89ef-7322-4496-8d2c-fbfcd389a19a.name','\"Heading Text\"'),('matrixBlockTypes.affd0670-6a09-4d9a-ace6-4cb4c4087185.fields.eeea89ef-7322-4496-8d2c-fbfcd389a19a.searchable','true'),('matrixBlockTypes.affd0670-6a09-4d9a-ace6-4cb4c4087185.fields.eeea89ef-7322-4496-8d2c-fbfcd389a19a.settings.byteLimit','null'),('matrixBlockTypes.affd0670-6a09-4d9a-ace6-4cb4c4087185.fields.eeea89ef-7322-4496-8d2c-fbfcd389a19a.settings.charLimit','null'),('matrixBlockTypes.affd0670-6a09-4d9a-ace6-4cb4c4087185.fields.eeea89ef-7322-4496-8d2c-fbfcd389a19a.settings.code','\"\"'),('matrixBlockTypes.affd0670-6a09-4d9a-ace6-4cb4c4087185.fields.eeea89ef-7322-4496-8d2c-fbfcd389a19a.settings.columnType','\"text\"'),('matrixBlockTypes.affd0670-6a09-4d9a-ace6-4cb4c4087185.fields.eeea89ef-7322-4496-8d2c-fbfcd389a19a.settings.initialRows','\"4\"'),('matrixBlockTypes.affd0670-6a09-4d9a-ace6-4cb4c4087185.fields.eeea89ef-7322-4496-8d2c-fbfcd389a19a.settings.multiline','\"\"'),('matrixBlockTypes.affd0670-6a09-4d9a-ace6-4cb4c4087185.fields.eeea89ef-7322-4496-8d2c-fbfcd389a19a.settings.placeholder','null'),('matrixBlockTypes.affd0670-6a09-4d9a-ace6-4cb4c4087185.fields.eeea89ef-7322-4496-8d2c-fbfcd389a19a.settings.uiMode','\"normal\"'),('matrixBlockTypes.affd0670-6a09-4d9a-ace6-4cb4c4087185.fields.eeea89ef-7322-4496-8d2c-fbfcd389a19a.translationKeyFormat','null'),('matrixBlockTypes.affd0670-6a09-4d9a-ace6-4cb4c4087185.fields.eeea89ef-7322-4496-8d2c-fbfcd389a19a.translationMethod','\"none\"'),('matrixBlockTypes.affd0670-6a09-4d9a-ace6-4cb4c4087185.fields.eeea89ef-7322-4496-8d2c-fbfcd389a19a.type','\"craft\\\\fields\\\\PlainText\"'),('matrixBlockTypes.affd0670-6a09-4d9a-ace6-4cb4c4087185.handle','\"sectionHeading\"'),('matrixBlockTypes.affd0670-6a09-4d9a-ace6-4cb4c4087185.name','\"Section Heading\"'),('matrixBlockTypes.affd0670-6a09-4d9a-ace6-4cb4c4087185.sortOrder','4'),('matrixBlockTypes.ddb3d9a1-9ad7-4d62-9112-c8d10720570d.field','\"157f1dd3-6182-4ac8-b27f-1119802aa09c\"'),('matrixBlockTypes.ddb3d9a1-9ad7-4d62-9112-c8d10720570d.fieldLayouts.4ad2d562-7edb-4800-9f5e-743ccc4bd6d3.tabs.0.elements.0.fieldUid','\"3748f7bb-9550-4669-9be0-c771a7d47f6d\"'),('matrixBlockTypes.ddb3d9a1-9ad7-4d62-9112-c8d10720570d.fieldLayouts.4ad2d562-7edb-4800-9f5e-743ccc4bd6d3.tabs.0.elements.0.instructions','null'),('matrixBlockTypes.ddb3d9a1-9ad7-4d62-9112-c8d10720570d.fieldLayouts.4ad2d562-7edb-4800-9f5e-743ccc4bd6d3.tabs.0.elements.0.label','null'),('matrixBlockTypes.ddb3d9a1-9ad7-4d62-9112-c8d10720570d.fieldLayouts.4ad2d562-7edb-4800-9f5e-743ccc4bd6d3.tabs.0.elements.0.required','true'),('matrixBlockTypes.ddb3d9a1-9ad7-4d62-9112-c8d10720570d.fieldLayouts.4ad2d562-7edb-4800-9f5e-743ccc4bd6d3.tabs.0.elements.0.tip','null'),('matrixBlockTypes.ddb3d9a1-9ad7-4d62-9112-c8d10720570d.fieldLayouts.4ad2d562-7edb-4800-9f5e-743ccc4bd6d3.tabs.0.elements.0.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('matrixBlockTypes.ddb3d9a1-9ad7-4d62-9112-c8d10720570d.fieldLayouts.4ad2d562-7edb-4800-9f5e-743ccc4bd6d3.tabs.0.elements.0.warning','null'),('matrixBlockTypes.ddb3d9a1-9ad7-4d62-9112-c8d10720570d.fieldLayouts.4ad2d562-7edb-4800-9f5e-743ccc4bd6d3.tabs.0.elements.0.width','100'),('matrixBlockTypes.ddb3d9a1-9ad7-4d62-9112-c8d10720570d.fieldLayouts.4ad2d562-7edb-4800-9f5e-743ccc4bd6d3.tabs.0.elements.1.fieldUid','\"537c59a7-3dfb-4e2c-9ca1-74c8fa834cf3\"'),('matrixBlockTypes.ddb3d9a1-9ad7-4d62-9112-c8d10720570d.fieldLayouts.4ad2d562-7edb-4800-9f5e-743ccc4bd6d3.tabs.0.elements.1.instructions','null'),('matrixBlockTypes.ddb3d9a1-9ad7-4d62-9112-c8d10720570d.fieldLayouts.4ad2d562-7edb-4800-9f5e-743ccc4bd6d3.tabs.0.elements.1.label','null'),('matrixBlockTypes.ddb3d9a1-9ad7-4d62-9112-c8d10720570d.fieldLayouts.4ad2d562-7edb-4800-9f5e-743ccc4bd6d3.tabs.0.elements.1.required','true'),('matrixBlockTypes.ddb3d9a1-9ad7-4d62-9112-c8d10720570d.fieldLayouts.4ad2d562-7edb-4800-9f5e-743ccc4bd6d3.tabs.0.elements.1.tip','null'),('matrixBlockTypes.ddb3d9a1-9ad7-4d62-9112-c8d10720570d.fieldLayouts.4ad2d562-7edb-4800-9f5e-743ccc4bd6d3.tabs.0.elements.1.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('matrixBlockTypes.ddb3d9a1-9ad7-4d62-9112-c8d10720570d.fieldLayouts.4ad2d562-7edb-4800-9f5e-743ccc4bd6d3.tabs.0.elements.1.warning','null'),('matrixBlockTypes.ddb3d9a1-9ad7-4d62-9112-c8d10720570d.fieldLayouts.4ad2d562-7edb-4800-9f5e-743ccc4bd6d3.tabs.0.elements.1.width','100'),('matrixBlockTypes.ddb3d9a1-9ad7-4d62-9112-c8d10720570d.fieldLayouts.4ad2d562-7edb-4800-9f5e-743ccc4bd6d3.tabs.0.elements.2.fieldUid','\"19b73e72-72de-4895-ae29-6dd3671e0ef1\"'),('matrixBlockTypes.ddb3d9a1-9ad7-4d62-9112-c8d10720570d.fieldLayouts.4ad2d562-7edb-4800-9f5e-743ccc4bd6d3.tabs.0.elements.2.instructions','null'),('matrixBlockTypes.ddb3d9a1-9ad7-4d62-9112-c8d10720570d.fieldLayouts.4ad2d562-7edb-4800-9f5e-743ccc4bd6d3.tabs.0.elements.2.label','null'),('matrixBlockTypes.ddb3d9a1-9ad7-4d62-9112-c8d10720570d.fieldLayouts.4ad2d562-7edb-4800-9f5e-743ccc4bd6d3.tabs.0.elements.2.required','false'),('matrixBlockTypes.ddb3d9a1-9ad7-4d62-9112-c8d10720570d.fieldLayouts.4ad2d562-7edb-4800-9f5e-743ccc4bd6d3.tabs.0.elements.2.tip','null'),('matrixBlockTypes.ddb3d9a1-9ad7-4d62-9112-c8d10720570d.fieldLayouts.4ad2d562-7edb-4800-9f5e-743ccc4bd6d3.tabs.0.elements.2.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('matrixBlockTypes.ddb3d9a1-9ad7-4d62-9112-c8d10720570d.fieldLayouts.4ad2d562-7edb-4800-9f5e-743ccc4bd6d3.tabs.0.elements.2.warning','null'),('matrixBlockTypes.ddb3d9a1-9ad7-4d62-9112-c8d10720570d.fieldLayouts.4ad2d562-7edb-4800-9f5e-743ccc4bd6d3.tabs.0.elements.2.width','100'),('matrixBlockTypes.ddb3d9a1-9ad7-4d62-9112-c8d10720570d.fieldLayouts.4ad2d562-7edb-4800-9f5e-743ccc4bd6d3.tabs.0.name','\"Content\"'),('matrixBlockTypes.ddb3d9a1-9ad7-4d62-9112-c8d10720570d.fieldLayouts.4ad2d562-7edb-4800-9f5e-743ccc4bd6d3.tabs.0.sortOrder','1'),('matrixBlockTypes.ddb3d9a1-9ad7-4d62-9112-c8d10720570d.fields.19b73e72-72de-4895-ae29-6dd3671e0ef1.columnSuffix','\"ymxfkyke\"'),('matrixBlockTypes.ddb3d9a1-9ad7-4d62-9112-c8d10720570d.fields.19b73e72-72de-4895-ae29-6dd3671e0ef1.contentColumnType','\"text\"'),('matrixBlockTypes.ddb3d9a1-9ad7-4d62-9112-c8d10720570d.fields.19b73e72-72de-4895-ae29-6dd3671e0ef1.fieldGroup','null'),('matrixBlockTypes.ddb3d9a1-9ad7-4d62-9112-c8d10720570d.fields.19b73e72-72de-4895-ae29-6dd3671e0ef1.handle','\"customClass\"'),('matrixBlockTypes.ddb3d9a1-9ad7-4d62-9112-c8d10720570d.fields.19b73e72-72de-4895-ae29-6dd3671e0ef1.instructions','\"Attach one or more classes to this element separated by spaces\"'),('matrixBlockTypes.ddb3d9a1-9ad7-4d62-9112-c8d10720570d.fields.19b73e72-72de-4895-ae29-6dd3671e0ef1.name','\"Custom Class\"'),('matrixBlockTypes.ddb3d9a1-9ad7-4d62-9112-c8d10720570d.fields.19b73e72-72de-4895-ae29-6dd3671e0ef1.searchable','true'),('matrixBlockTypes.ddb3d9a1-9ad7-4d62-9112-c8d10720570d.fields.19b73e72-72de-4895-ae29-6dd3671e0ef1.settings.byteLimit','null'),('matrixBlockTypes.ddb3d9a1-9ad7-4d62-9112-c8d10720570d.fields.19b73e72-72de-4895-ae29-6dd3671e0ef1.settings.charLimit','null'),('matrixBlockTypes.ddb3d9a1-9ad7-4d62-9112-c8d10720570d.fields.19b73e72-72de-4895-ae29-6dd3671e0ef1.settings.code','\"\"'),('matrixBlockTypes.ddb3d9a1-9ad7-4d62-9112-c8d10720570d.fields.19b73e72-72de-4895-ae29-6dd3671e0ef1.settings.columnType','\"text\"'),('matrixBlockTypes.ddb3d9a1-9ad7-4d62-9112-c8d10720570d.fields.19b73e72-72de-4895-ae29-6dd3671e0ef1.settings.initialRows','\"4\"'),('matrixBlockTypes.ddb3d9a1-9ad7-4d62-9112-c8d10720570d.fields.19b73e72-72de-4895-ae29-6dd3671e0ef1.settings.multiline','\"\"'),('matrixBlockTypes.ddb3d9a1-9ad7-4d62-9112-c8d10720570d.fields.19b73e72-72de-4895-ae29-6dd3671e0ef1.settings.placeholder','\"class-1 class-2\"'),('matrixBlockTypes.ddb3d9a1-9ad7-4d62-9112-c8d10720570d.fields.19b73e72-72de-4895-ae29-6dd3671e0ef1.settings.uiMode','\"normal\"'),('matrixBlockTypes.ddb3d9a1-9ad7-4d62-9112-c8d10720570d.fields.19b73e72-72de-4895-ae29-6dd3671e0ef1.translationKeyFormat','null'),('matrixBlockTypes.ddb3d9a1-9ad7-4d62-9112-c8d10720570d.fields.19b73e72-72de-4895-ae29-6dd3671e0ef1.translationMethod','\"none\"'),('matrixBlockTypes.ddb3d9a1-9ad7-4d62-9112-c8d10720570d.fields.19b73e72-72de-4895-ae29-6dd3671e0ef1.type','\"craft\\\\fields\\\\PlainText\"'),('matrixBlockTypes.ddb3d9a1-9ad7-4d62-9112-c8d10720570d.fields.3748f7bb-9550-4669-9be0-c771a7d47f6d.columnSuffix','null'),('matrixBlockTypes.ddb3d9a1-9ad7-4d62-9112-c8d10720570d.fields.3748f7bb-9550-4669-9be0-c771a7d47f6d.contentColumnType','\"string\"'),('matrixBlockTypes.ddb3d9a1-9ad7-4d62-9112-c8d10720570d.fields.3748f7bb-9550-4669-9be0-c771a7d47f6d.fieldGroup','null'),('matrixBlockTypes.ddb3d9a1-9ad7-4d62-9112-c8d10720570d.fields.3748f7bb-9550-4669-9be0-c771a7d47f6d.handle','\"audience\"'),('matrixBlockTypes.ddb3d9a1-9ad7-4d62-9112-c8d10720570d.fields.3748f7bb-9550-4669-9be0-c771a7d47f6d.instructions','\"\"'),('matrixBlockTypes.ddb3d9a1-9ad7-4d62-9112-c8d10720570d.fields.3748f7bb-9550-4669-9be0-c771a7d47f6d.name','\"Audience\"'),('matrixBlockTypes.ddb3d9a1-9ad7-4d62-9112-c8d10720570d.fields.3748f7bb-9550-4669-9be0-c771a7d47f6d.searchable','true'),('matrixBlockTypes.ddb3d9a1-9ad7-4d62-9112-c8d10720570d.fields.3748f7bb-9550-4669-9be0-c771a7d47f6d.settings.allowLimit','false'),('matrixBlockTypes.ddb3d9a1-9ad7-4d62-9112-c8d10720570d.fields.3748f7bb-9550-4669-9be0-c771a7d47f6d.settings.allowMultipleSources','false'),('matrixBlockTypes.ddb3d9a1-9ad7-4d62-9112-c8d10720570d.fields.3748f7bb-9550-4669-9be0-c771a7d47f6d.settings.allowSelfRelations','false'),('matrixBlockTypes.ddb3d9a1-9ad7-4d62-9112-c8d10720570d.fields.3748f7bb-9550-4669-9be0-c771a7d47f6d.settings.branchLimit','\"\"'),('matrixBlockTypes.ddb3d9a1-9ad7-4d62-9112-c8d10720570d.fields.3748f7bb-9550-4669-9be0-c771a7d47f6d.settings.limit','null'),('matrixBlockTypes.ddb3d9a1-9ad7-4d62-9112-c8d10720570d.fields.3748f7bb-9550-4669-9be0-c771a7d47f6d.settings.localizeRelations','false'),('matrixBlockTypes.ddb3d9a1-9ad7-4d62-9112-c8d10720570d.fields.3748f7bb-9550-4669-9be0-c771a7d47f6d.settings.selectionLabel','\"\"'),('matrixBlockTypes.ddb3d9a1-9ad7-4d62-9112-c8d10720570d.fields.3748f7bb-9550-4669-9be0-c771a7d47f6d.settings.showSiteMenu','true'),('matrixBlockTypes.ddb3d9a1-9ad7-4d62-9112-c8d10720570d.fields.3748f7bb-9550-4669-9be0-c771a7d47f6d.settings.source','\"group:83e3ba4a-e673-4499-bad1-7b8a299d1fcd\"'),('matrixBlockTypes.ddb3d9a1-9ad7-4d62-9112-c8d10720570d.fields.3748f7bb-9550-4669-9be0-c771a7d47f6d.settings.sources','\"*\"'),('matrixBlockTypes.ddb3d9a1-9ad7-4d62-9112-c8d10720570d.fields.3748f7bb-9550-4669-9be0-c771a7d47f6d.settings.targetSiteId','null'),('matrixBlockTypes.ddb3d9a1-9ad7-4d62-9112-c8d10720570d.fields.3748f7bb-9550-4669-9be0-c771a7d47f6d.settings.validateRelatedElements','false'),('matrixBlockTypes.ddb3d9a1-9ad7-4d62-9112-c8d10720570d.fields.3748f7bb-9550-4669-9be0-c771a7d47f6d.settings.viewMode','null'),('matrixBlockTypes.ddb3d9a1-9ad7-4d62-9112-c8d10720570d.fields.3748f7bb-9550-4669-9be0-c771a7d47f6d.translationKeyFormat','null'),('matrixBlockTypes.ddb3d9a1-9ad7-4d62-9112-c8d10720570d.fields.3748f7bb-9550-4669-9be0-c771a7d47f6d.translationMethod','\"site\"'),('matrixBlockTypes.ddb3d9a1-9ad7-4d62-9112-c8d10720570d.fields.3748f7bb-9550-4669-9be0-c771a7d47f6d.type','\"craft\\\\fields\\\\Categories\"'),('matrixBlockTypes.ddb3d9a1-9ad7-4d62-9112-c8d10720570d.fields.537c59a7-3dfb-4e2c-9ca1-74c8fa834cf3.columnSuffix','\"zkhyubqj\"'),('matrixBlockTypes.ddb3d9a1-9ad7-4d62-9112-c8d10720570d.fields.537c59a7-3dfb-4e2c-9ca1-74c8fa834cf3.contentColumnType','\"text\"'),('matrixBlockTypes.ddb3d9a1-9ad7-4d62-9112-c8d10720570d.fields.537c59a7-3dfb-4e2c-9ca1-74c8fa834cf3.fieldGroup','null'),('matrixBlockTypes.ddb3d9a1-9ad7-4d62-9112-c8d10720570d.fields.537c59a7-3dfb-4e2c-9ca1-74c8fa834cf3.handle','\"templateName\"'),('matrixBlockTypes.ddb3d9a1-9ad7-4d62-9112-c8d10720570d.fields.537c59a7-3dfb-4e2c-9ca1-74c8fa834cf3.instructions','\"The file name of the desired twig template, located in templates/_custom-blocks\"'),('matrixBlockTypes.ddb3d9a1-9ad7-4d62-9112-c8d10720570d.fields.537c59a7-3dfb-4e2c-9ca1-74c8fa834cf3.name','\"Template Name\"'),('matrixBlockTypes.ddb3d9a1-9ad7-4d62-9112-c8d10720570d.fields.537c59a7-3dfb-4e2c-9ca1-74c8fa834cf3.searchable','true'),('matrixBlockTypes.ddb3d9a1-9ad7-4d62-9112-c8d10720570d.fields.537c59a7-3dfb-4e2c-9ca1-74c8fa834cf3.settings.byteLimit','null'),('matrixBlockTypes.ddb3d9a1-9ad7-4d62-9112-c8d10720570d.fields.537c59a7-3dfb-4e2c-9ca1-74c8fa834cf3.settings.charLimit','null'),('matrixBlockTypes.ddb3d9a1-9ad7-4d62-9112-c8d10720570d.fields.537c59a7-3dfb-4e2c-9ca1-74c8fa834cf3.settings.code','\"\"'),('matrixBlockTypes.ddb3d9a1-9ad7-4d62-9112-c8d10720570d.fields.537c59a7-3dfb-4e2c-9ca1-74c8fa834cf3.settings.columnType','\"text\"'),('matrixBlockTypes.ddb3d9a1-9ad7-4d62-9112-c8d10720570d.fields.537c59a7-3dfb-4e2c-9ca1-74c8fa834cf3.settings.initialRows','\"4\"'),('matrixBlockTypes.ddb3d9a1-9ad7-4d62-9112-c8d10720570d.fields.537c59a7-3dfb-4e2c-9ca1-74c8fa834cf3.settings.multiline','\"\"'),('matrixBlockTypes.ddb3d9a1-9ad7-4d62-9112-c8d10720570d.fields.537c59a7-3dfb-4e2c-9ca1-74c8fa834cf3.settings.placeholder','\"template-name.twig\"'),('matrixBlockTypes.ddb3d9a1-9ad7-4d62-9112-c8d10720570d.fields.537c59a7-3dfb-4e2c-9ca1-74c8fa834cf3.settings.uiMode','\"normal\"'),('matrixBlockTypes.ddb3d9a1-9ad7-4d62-9112-c8d10720570d.fields.537c59a7-3dfb-4e2c-9ca1-74c8fa834cf3.translationKeyFormat','null'),('matrixBlockTypes.ddb3d9a1-9ad7-4d62-9112-c8d10720570d.fields.537c59a7-3dfb-4e2c-9ca1-74c8fa834cf3.translationMethod','\"none\"'),('matrixBlockTypes.ddb3d9a1-9ad7-4d62-9112-c8d10720570d.fields.537c59a7-3dfb-4e2c-9ca1-74c8fa834cf3.type','\"craft\\\\fields\\\\PlainText\"'),('matrixBlockTypes.ddb3d9a1-9ad7-4d62-9112-c8d10720570d.handle','\"staticBlock\"'),('matrixBlockTypes.ddb3d9a1-9ad7-4d62-9112-c8d10720570d.name','\"Static Block\"'),('matrixBlockTypes.ddb3d9a1-9ad7-4d62-9112-c8d10720570d.sortOrder','8'),('matrixBlockTypes.eeec7060-b13e-40ad-8565-21374c64a879.field','\"157f1dd3-6182-4ac8-b27f-1119802aa09c\"'),('matrixBlockTypes.eeec7060-b13e-40ad-8565-21374c64a879.fieldLayouts.3dff6724-0d2e-42af-a8b9-f5d9513ae3ef.tabs.0.elements.0.fieldUid','\"a3389b6c-3c44-4d2e-92b7-9acea68eb89a\"'),('matrixBlockTypes.eeec7060-b13e-40ad-8565-21374c64a879.fieldLayouts.3dff6724-0d2e-42af-a8b9-f5d9513ae3ef.tabs.0.elements.0.instructions','null'),('matrixBlockTypes.eeec7060-b13e-40ad-8565-21374c64a879.fieldLayouts.3dff6724-0d2e-42af-a8b9-f5d9513ae3ef.tabs.0.elements.0.label','null'),('matrixBlockTypes.eeec7060-b13e-40ad-8565-21374c64a879.fieldLayouts.3dff6724-0d2e-42af-a8b9-f5d9513ae3ef.tabs.0.elements.0.required','true'),('matrixBlockTypes.eeec7060-b13e-40ad-8565-21374c64a879.fieldLayouts.3dff6724-0d2e-42af-a8b9-f5d9513ae3ef.tabs.0.elements.0.tip','null'),('matrixBlockTypes.eeec7060-b13e-40ad-8565-21374c64a879.fieldLayouts.3dff6724-0d2e-42af-a8b9-f5d9513ae3ef.tabs.0.elements.0.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('matrixBlockTypes.eeec7060-b13e-40ad-8565-21374c64a879.fieldLayouts.3dff6724-0d2e-42af-a8b9-f5d9513ae3ef.tabs.0.elements.0.warning','null'),('matrixBlockTypes.eeec7060-b13e-40ad-8565-21374c64a879.fieldLayouts.3dff6724-0d2e-42af-a8b9-f5d9513ae3ef.tabs.0.elements.0.width','100'),('matrixBlockTypes.eeec7060-b13e-40ad-8565-21374c64a879.fieldLayouts.3dff6724-0d2e-42af-a8b9-f5d9513ae3ef.tabs.0.elements.1.fieldUid','\"fe7f27d0-4eb4-4b8e-b7f2-2811cb5ec628\"'),('matrixBlockTypes.eeec7060-b13e-40ad-8565-21374c64a879.fieldLayouts.3dff6724-0d2e-42af-a8b9-f5d9513ae3ef.tabs.0.elements.1.instructions','null'),('matrixBlockTypes.eeec7060-b13e-40ad-8565-21374c64a879.fieldLayouts.3dff6724-0d2e-42af-a8b9-f5d9513ae3ef.tabs.0.elements.1.label','null'),('matrixBlockTypes.eeec7060-b13e-40ad-8565-21374c64a879.fieldLayouts.3dff6724-0d2e-42af-a8b9-f5d9513ae3ef.tabs.0.elements.1.required','false'),('matrixBlockTypes.eeec7060-b13e-40ad-8565-21374c64a879.fieldLayouts.3dff6724-0d2e-42af-a8b9-f5d9513ae3ef.tabs.0.elements.1.tip','null'),('matrixBlockTypes.eeec7060-b13e-40ad-8565-21374c64a879.fieldLayouts.3dff6724-0d2e-42af-a8b9-f5d9513ae3ef.tabs.0.elements.1.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('matrixBlockTypes.eeec7060-b13e-40ad-8565-21374c64a879.fieldLayouts.3dff6724-0d2e-42af-a8b9-f5d9513ae3ef.tabs.0.elements.1.warning','null'),('matrixBlockTypes.eeec7060-b13e-40ad-8565-21374c64a879.fieldLayouts.3dff6724-0d2e-42af-a8b9-f5d9513ae3ef.tabs.0.elements.1.width','100'),('matrixBlockTypes.eeec7060-b13e-40ad-8565-21374c64a879.fieldLayouts.3dff6724-0d2e-42af-a8b9-f5d9513ae3ef.tabs.0.elements.2.fieldUid','\"b6ed882c-7f7d-4f25-a47b-1582b73222eb\"'),('matrixBlockTypes.eeec7060-b13e-40ad-8565-21374c64a879.fieldLayouts.3dff6724-0d2e-42af-a8b9-f5d9513ae3ef.tabs.0.elements.2.instructions','null'),('matrixBlockTypes.eeec7060-b13e-40ad-8565-21374c64a879.fieldLayouts.3dff6724-0d2e-42af-a8b9-f5d9513ae3ef.tabs.0.elements.2.label','null'),('matrixBlockTypes.eeec7060-b13e-40ad-8565-21374c64a879.fieldLayouts.3dff6724-0d2e-42af-a8b9-f5d9513ae3ef.tabs.0.elements.2.required','true'),('matrixBlockTypes.eeec7060-b13e-40ad-8565-21374c64a879.fieldLayouts.3dff6724-0d2e-42af-a8b9-f5d9513ae3ef.tabs.0.elements.2.tip','null'),('matrixBlockTypes.eeec7060-b13e-40ad-8565-21374c64a879.fieldLayouts.3dff6724-0d2e-42af-a8b9-f5d9513ae3ef.tabs.0.elements.2.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('matrixBlockTypes.eeec7060-b13e-40ad-8565-21374c64a879.fieldLayouts.3dff6724-0d2e-42af-a8b9-f5d9513ae3ef.tabs.0.elements.2.warning','null'),('matrixBlockTypes.eeec7060-b13e-40ad-8565-21374c64a879.fieldLayouts.3dff6724-0d2e-42af-a8b9-f5d9513ae3ef.tabs.0.elements.2.width','100'),('matrixBlockTypes.eeec7060-b13e-40ad-8565-21374c64a879.fieldLayouts.3dff6724-0d2e-42af-a8b9-f5d9513ae3ef.tabs.0.name','\"Content\"'),('matrixBlockTypes.eeec7060-b13e-40ad-8565-21374c64a879.fieldLayouts.3dff6724-0d2e-42af-a8b9-f5d9513ae3ef.tabs.0.sortOrder','1'),('matrixBlockTypes.eeec7060-b13e-40ad-8565-21374c64a879.fields.a3389b6c-3c44-4d2e-92b7-9acea68eb89a.columnSuffix','null'),('matrixBlockTypes.eeec7060-b13e-40ad-8565-21374c64a879.fields.a3389b6c-3c44-4d2e-92b7-9acea68eb89a.contentColumnType','\"string\"'),('matrixBlockTypes.eeec7060-b13e-40ad-8565-21374c64a879.fields.a3389b6c-3c44-4d2e-92b7-9acea68eb89a.fieldGroup','null'),('matrixBlockTypes.eeec7060-b13e-40ad-8565-21374c64a879.fields.a3389b6c-3c44-4d2e-92b7-9acea68eb89a.handle','\"audience\"'),('matrixBlockTypes.eeec7060-b13e-40ad-8565-21374c64a879.fields.a3389b6c-3c44-4d2e-92b7-9acea68eb89a.instructions','\"Choose who can see this\"'),('matrixBlockTypes.eeec7060-b13e-40ad-8565-21374c64a879.fields.a3389b6c-3c44-4d2e-92b7-9acea68eb89a.name','\"Audience\"'),('matrixBlockTypes.eeec7060-b13e-40ad-8565-21374c64a879.fields.a3389b6c-3c44-4d2e-92b7-9acea68eb89a.searchable','true'),('matrixBlockTypes.eeec7060-b13e-40ad-8565-21374c64a879.fields.a3389b6c-3c44-4d2e-92b7-9acea68eb89a.settings.allowLimit','false'),('matrixBlockTypes.eeec7060-b13e-40ad-8565-21374c64a879.fields.a3389b6c-3c44-4d2e-92b7-9acea68eb89a.settings.allowMultipleSources','false'),('matrixBlockTypes.eeec7060-b13e-40ad-8565-21374c64a879.fields.a3389b6c-3c44-4d2e-92b7-9acea68eb89a.settings.allowSelfRelations','false'),('matrixBlockTypes.eeec7060-b13e-40ad-8565-21374c64a879.fields.a3389b6c-3c44-4d2e-92b7-9acea68eb89a.settings.branchLimit','\"\"'),('matrixBlockTypes.eeec7060-b13e-40ad-8565-21374c64a879.fields.a3389b6c-3c44-4d2e-92b7-9acea68eb89a.settings.limit','null'),('matrixBlockTypes.eeec7060-b13e-40ad-8565-21374c64a879.fields.a3389b6c-3c44-4d2e-92b7-9acea68eb89a.settings.localizeRelations','false'),('matrixBlockTypes.eeec7060-b13e-40ad-8565-21374c64a879.fields.a3389b6c-3c44-4d2e-92b7-9acea68eb89a.settings.selectionLabel','\"\"'),('matrixBlockTypes.eeec7060-b13e-40ad-8565-21374c64a879.fields.a3389b6c-3c44-4d2e-92b7-9acea68eb89a.settings.showSiteMenu','true'),('matrixBlockTypes.eeec7060-b13e-40ad-8565-21374c64a879.fields.a3389b6c-3c44-4d2e-92b7-9acea68eb89a.settings.source','\"group:83e3ba4a-e673-4499-bad1-7b8a299d1fcd\"'),('matrixBlockTypes.eeec7060-b13e-40ad-8565-21374c64a879.fields.a3389b6c-3c44-4d2e-92b7-9acea68eb89a.settings.sources','\"*\"'),('matrixBlockTypes.eeec7060-b13e-40ad-8565-21374c64a879.fields.a3389b6c-3c44-4d2e-92b7-9acea68eb89a.settings.targetSiteId','null'),('matrixBlockTypes.eeec7060-b13e-40ad-8565-21374c64a879.fields.a3389b6c-3c44-4d2e-92b7-9acea68eb89a.settings.validateRelatedElements','false'),('matrixBlockTypes.eeec7060-b13e-40ad-8565-21374c64a879.fields.a3389b6c-3c44-4d2e-92b7-9acea68eb89a.settings.viewMode','null'),('matrixBlockTypes.eeec7060-b13e-40ad-8565-21374c64a879.fields.a3389b6c-3c44-4d2e-92b7-9acea68eb89a.translationKeyFormat','null'),('matrixBlockTypes.eeec7060-b13e-40ad-8565-21374c64a879.fields.a3389b6c-3c44-4d2e-92b7-9acea68eb89a.translationMethod','\"site\"'),('matrixBlockTypes.eeec7060-b13e-40ad-8565-21374c64a879.fields.a3389b6c-3c44-4d2e-92b7-9acea68eb89a.type','\"craft\\\\fields\\\\Categories\"'),('matrixBlockTypes.eeec7060-b13e-40ad-8565-21374c64a879.fields.b6ed882c-7f7d-4f25-a47b-1582b73222eb.columnSuffix','\"grdejgvk\"'),('matrixBlockTypes.eeec7060-b13e-40ad-8565-21374c64a879.fields.b6ed882c-7f7d-4f25-a47b-1582b73222eb.contentColumnType','\"string\"'),('matrixBlockTypes.eeec7060-b13e-40ad-8565-21374c64a879.fields.b6ed882c-7f7d-4f25-a47b-1582b73222eb.fieldGroup','null'),('matrixBlockTypes.eeec7060-b13e-40ad-8565-21374c64a879.fields.b6ed882c-7f7d-4f25-a47b-1582b73222eb.handle','\"expanderAttributes\"'),('matrixBlockTypes.eeec7060-b13e-40ad-8565-21374c64a879.fields.b6ed882c-7f7d-4f25-a47b-1582b73222eb.instructions','\"\"'),('matrixBlockTypes.eeec7060-b13e-40ad-8565-21374c64a879.fields.b6ed882c-7f7d-4f25-a47b-1582b73222eb.name','\"Expander Attributes\"'),('matrixBlockTypes.eeec7060-b13e-40ad-8565-21374c64a879.fields.b6ed882c-7f7d-4f25-a47b-1582b73222eb.searchable','true'),('matrixBlockTypes.eeec7060-b13e-40ad-8565-21374c64a879.fields.b6ed882c-7f7d-4f25-a47b-1582b73222eb.settings.multi','true'),('matrixBlockTypes.eeec7060-b13e-40ad-8565-21374c64a879.fields.b6ed882c-7f7d-4f25-a47b-1582b73222eb.settings.optgroups','true'),('matrixBlockTypes.eeec7060-b13e-40ad-8565-21374c64a879.fields.b6ed882c-7f7d-4f25-a47b-1582b73222eb.settings.options.0.__assoc__.0.0','\"label\"'),('matrixBlockTypes.eeec7060-b13e-40ad-8565-21374c64a879.fields.b6ed882c-7f7d-4f25-a47b-1582b73222eb.settings.options.0.__assoc__.0.1','\"Closes others\"'),('matrixBlockTypes.eeec7060-b13e-40ad-8565-21374c64a879.fields.b6ed882c-7f7d-4f25-a47b-1582b73222eb.settings.options.0.__assoc__.1.0','\"value\"'),('matrixBlockTypes.eeec7060-b13e-40ad-8565-21374c64a879.fields.b6ed882c-7f7d-4f25-a47b-1582b73222eb.settings.options.0.__assoc__.1.1','\"closesOthers\"'),('matrixBlockTypes.eeec7060-b13e-40ad-8565-21374c64a879.fields.b6ed882c-7f7d-4f25-a47b-1582b73222eb.settings.options.0.__assoc__.2.0','\"default\"'),('matrixBlockTypes.eeec7060-b13e-40ad-8565-21374c64a879.fields.b6ed882c-7f7d-4f25-a47b-1582b73222eb.settings.options.0.__assoc__.2.1','\"1\"'),('matrixBlockTypes.eeec7060-b13e-40ad-8565-21374c64a879.fields.b6ed882c-7f7d-4f25-a47b-1582b73222eb.settings.options.1.__assoc__.0.0','\"label\"'),('matrixBlockTypes.eeec7060-b13e-40ad-8565-21374c64a879.fields.b6ed882c-7f7d-4f25-a47b-1582b73222eb.settings.options.1.__assoc__.0.1','\"Defaults open\"'),('matrixBlockTypes.eeec7060-b13e-40ad-8565-21374c64a879.fields.b6ed882c-7f7d-4f25-a47b-1582b73222eb.settings.options.1.__assoc__.1.0','\"value\"'),('matrixBlockTypes.eeec7060-b13e-40ad-8565-21374c64a879.fields.b6ed882c-7f7d-4f25-a47b-1582b73222eb.settings.options.1.__assoc__.1.1','\"defaultsOpen\"'),('matrixBlockTypes.eeec7060-b13e-40ad-8565-21374c64a879.fields.b6ed882c-7f7d-4f25-a47b-1582b73222eb.settings.options.1.__assoc__.2.0','\"default\"'),('matrixBlockTypes.eeec7060-b13e-40ad-8565-21374c64a879.fields.b6ed882c-7f7d-4f25-a47b-1582b73222eb.settings.options.1.__assoc__.2.1','\"\"'),('matrixBlockTypes.eeec7060-b13e-40ad-8565-21374c64a879.fields.b6ed882c-7f7d-4f25-a47b-1582b73222eb.settings.options.2.__assoc__.0.0','\"label\"'),('matrixBlockTypes.eeec7060-b13e-40ad-8565-21374c64a879.fields.b6ed882c-7f7d-4f25-a47b-1582b73222eb.settings.options.2.__assoc__.0.1','\"Is endcap\"'),('matrixBlockTypes.eeec7060-b13e-40ad-8565-21374c64a879.fields.b6ed882c-7f7d-4f25-a47b-1582b73222eb.settings.options.2.__assoc__.1.0','\"value\"'),('matrixBlockTypes.eeec7060-b13e-40ad-8565-21374c64a879.fields.b6ed882c-7f7d-4f25-a47b-1582b73222eb.settings.options.2.__assoc__.1.1','\"isEndcap\"'),('matrixBlockTypes.eeec7060-b13e-40ad-8565-21374c64a879.fields.b6ed882c-7f7d-4f25-a47b-1582b73222eb.settings.options.2.__assoc__.2.0','\"default\"'),('matrixBlockTypes.eeec7060-b13e-40ad-8565-21374c64a879.fields.b6ed882c-7f7d-4f25-a47b-1582b73222eb.settings.options.2.__assoc__.2.1','\"\"'),('matrixBlockTypes.eeec7060-b13e-40ad-8565-21374c64a879.fields.b6ed882c-7f7d-4f25-a47b-1582b73222eb.translationKeyFormat','null'),('matrixBlockTypes.eeec7060-b13e-40ad-8565-21374c64a879.fields.b6ed882c-7f7d-4f25-a47b-1582b73222eb.translationMethod','\"none\"'),('matrixBlockTypes.eeec7060-b13e-40ad-8565-21374c64a879.fields.b6ed882c-7f7d-4f25-a47b-1582b73222eb.type','\"craft\\\\fields\\\\MultiSelect\"'),('matrixBlockTypes.eeec7060-b13e-40ad-8565-21374c64a879.fields.fe7f27d0-4eb4-4b8e-b7f2-2811cb5ec628.columnSuffix','\"njokbjtg\"'),('matrixBlockTypes.eeec7060-b13e-40ad-8565-21374c64a879.fields.fe7f27d0-4eb4-4b8e-b7f2-2811cb5ec628.contentColumnType','\"text\"'),('matrixBlockTypes.eeec7060-b13e-40ad-8565-21374c64a879.fields.fe7f27d0-4eb4-4b8e-b7f2-2811cb5ec628.fieldGroup','null'),('matrixBlockTypes.eeec7060-b13e-40ad-8565-21374c64a879.fields.fe7f27d0-4eb4-4b8e-b7f2-2811cb5ec628.handle','\"expanderHeading\"'),('matrixBlockTypes.eeec7060-b13e-40ad-8565-21374c64a879.fields.fe7f27d0-4eb4-4b8e-b7f2-2811cb5ec628.instructions','\"Heading for the expander\"'),('matrixBlockTypes.eeec7060-b13e-40ad-8565-21374c64a879.fields.fe7f27d0-4eb4-4b8e-b7f2-2811cb5ec628.name','\"Expander heading\"'),('matrixBlockTypes.eeec7060-b13e-40ad-8565-21374c64a879.fields.fe7f27d0-4eb4-4b8e-b7f2-2811cb5ec628.searchable','true'),('matrixBlockTypes.eeec7060-b13e-40ad-8565-21374c64a879.fields.fe7f27d0-4eb4-4b8e-b7f2-2811cb5ec628.settings.byteLimit','null'),('matrixBlockTypes.eeec7060-b13e-40ad-8565-21374c64a879.fields.fe7f27d0-4eb4-4b8e-b7f2-2811cb5ec628.settings.charLimit','null'),('matrixBlockTypes.eeec7060-b13e-40ad-8565-21374c64a879.fields.fe7f27d0-4eb4-4b8e-b7f2-2811cb5ec628.settings.code','\"\"'),('matrixBlockTypes.eeec7060-b13e-40ad-8565-21374c64a879.fields.fe7f27d0-4eb4-4b8e-b7f2-2811cb5ec628.settings.columnType','\"text\"'),('matrixBlockTypes.eeec7060-b13e-40ad-8565-21374c64a879.fields.fe7f27d0-4eb4-4b8e-b7f2-2811cb5ec628.settings.initialRows','\"4\"'),('matrixBlockTypes.eeec7060-b13e-40ad-8565-21374c64a879.fields.fe7f27d0-4eb4-4b8e-b7f2-2811cb5ec628.settings.multiline','\"\"'),('matrixBlockTypes.eeec7060-b13e-40ad-8565-21374c64a879.fields.fe7f27d0-4eb4-4b8e-b7f2-2811cb5ec628.settings.placeholder','null'),('matrixBlockTypes.eeec7060-b13e-40ad-8565-21374c64a879.fields.fe7f27d0-4eb4-4b8e-b7f2-2811cb5ec628.settings.uiMode','\"normal\"'),('matrixBlockTypes.eeec7060-b13e-40ad-8565-21374c64a879.fields.fe7f27d0-4eb4-4b8e-b7f2-2811cb5ec628.translationKeyFormat','null'),('matrixBlockTypes.eeec7060-b13e-40ad-8565-21374c64a879.fields.fe7f27d0-4eb4-4b8e-b7f2-2811cb5ec628.translationMethod','\"none\"'),('matrixBlockTypes.eeec7060-b13e-40ad-8565-21374c64a879.fields.fe7f27d0-4eb4-4b8e-b7f2-2811cb5ec628.type','\"craft\\\\fields\\\\PlainText\"'),('matrixBlockTypes.eeec7060-b13e-40ad-8565-21374c64a879.handle','\"expander\"'),('matrixBlockTypes.eeec7060-b13e-40ad-8565-21374c64a879.name','\"Expander\"'),('matrixBlockTypes.eeec7060-b13e-40ad-8565-21374c64a879.sortOrder','2'),('meta.__names__.00ae21ee-87ea-48ed-990e-409f6da72d17','\"Caption\"'),('meta.__names__.02ae1ee2-06d8-4df2-9fd3-b8f86587e78e','\"Common\"'),('meta.__names__.039c016d-2191-4827-bd8f-5ba356dc009f','\"Telephone\"'),('meta.__names__.073ddf07-6d76-4737-b35b-b279ec2cc328','\"Global meta\"'),('meta.__names__.0c534d0c-c78f-413b-9525-0435ae1dc0e1','\"Audience\"'),('meta.__names__.0fc8f823-7b53-417a-95d5-e8dda8aeb727','\"Icons\"'),('meta.__names__.14eaedf3-c926-4a00-a4d2-e2bf862932e4','\"Concert Base Craft\"'),('meta.__names__.157f1dd3-6182-4ac8-b27f-1119802aa09c','\"Content Blocks\"'),('meta.__names__.19b73e72-72de-4895-ae29-6dd3671e0ef1','\"Custom Class\"'),('meta.__names__.1ea724df-ade0-49e2-af62-b1a2a65c08cc','\"Audience\"'),('meta.__names__.1f6b9b21-7a47-49f5-8b5b-cc04eaf5a698','\"GA Key\"'),('meta.__names__.23957a29-2d27-416d-8e13-e090279313f3','\"Custom Class\"'),('meta.__names__.2c888abb-0df7-4e6b-901e-38785688e035','\"Meta Robots\"'),('meta.__names__.2f8b915c-c957-4e3b-87f9-e26e50f68bfe','\"Custom Class\"'),('meta.__names__.3748f7bb-9550-4669-9be0-c771a7d47f6d','\"Audience\"'),('meta.__names__.3befc80f-8166-44e4-af10-24bb521cd51a','\"Column Class\"'),('meta.__names__.4bfd8fdd-073c-4e41-98dc-0970eaa3323f','\"Regular Image\"'),('meta.__names__.524e99c9-ec21-4c44-a82b-e9a5a50e87f7','\"Audience\"'),('meta.__names__.5298d815-6445-46e7-bafa-318ec948122e','\"Address\"'),('meta.__names__.537c59a7-3dfb-4e2c-9ca1-74c8fa834cf3','\"Template Name\"'),('meta.__names__.54fed815-9bb9-483f-a524-5b5463b9d832','\"Homepage\"'),('meta.__names__.6c426c81-0c6b-4950-a2a4-64e97d8b6e05','\"Column\"'),('meta.__names__.6e658ce8-9b41-4d68-8472-d17816861e32','\"Website\"'),('meta.__names__.6f1f8583-ac69-4eee-9a18-b836be8d0c7a','\"Postal Address\"'),('meta.__names__.737dbb58-826d-411f-9708-03124661ee3b','\"Custom Class\"'),('meta.__names__.75e9cb54-9d9f-469f-ba67-8efd8e45a8b1','\"Complex Entry\"'),('meta.__names__.79971a57-3c66-489d-8525-5fe7b382b60e','\"Meta Description\"'),('meta.__names__.7de3ab69-d443-4205-8f66-2a048e8e1ed2','\"Audience\"'),('meta.__names__.7ed32bef-623e-42e1-9d39-f0d17d46e90e','\"Custom Class\"'),('meta.__names__.7f471968-3e65-4fc9-9d7e-3dfc722653a6','\"Complex Block\"'),('meta.__names__.8353cd85-1982-4c68-bd49-460886567421','\"Table\"'),('meta.__names__.83e3ba4a-e673-4499-bad1-7b8a299d1fcd','\"User type\"'),('meta.__names__.8f0cb1cd-4bd3-41db-85e3-fd7868cf17ff','\"Table Data\"'),('meta.__names__.8fa978ce-5d99-438e-9d4b-00e1b997eb00','\"Meta Title\"'),('meta.__names__.90daf6c4-c1b7-4fca-9b3f-81cd5e44288d','\"Homepage\"'),('meta.__names__.919ad539-6911-45ac-bc4b-042df36b0ab2','\"Image\"'),('meta.__names__.96c744fc-87db-44dc-a086-5ae952f73fad','\"Images\"'),('meta.__names__.98ba90d6-c4e0-4165-8a65-cfe75da45067','\"Audience\"'),('meta.__names__.9b05b02e-f98b-449e-b40f-47f0b266affd','\"Regular Copy\"'),('meta.__names__.a3389b6c-3c44-4d2e-92b7-9acea68eb89a','\"Audience\"'),('meta.__names__.a448fcce-1054-44de-ae1d-54931eab4ed5','\"Meta\"'),('meta.__names__.a9870b66-a3e3-4fe6-b828-0c252b0e4187','\"Custom Class\"'),('meta.__names__.aa3c0a64-212a-41e0-8de7-b38bea6cd6d5','\"Audience\"'),('meta.__names__.affd0670-6a09-4d9a-ace6-4cb4c4087185','\"Section Heading\"'),('meta.__names__.b2855976-f3ec-4276-9d7e-59ddee4961f2','\"Heading Level\"'),('meta.__names__.b474e34b-1e23-4449-9c58-18e5e4ed6e47','\"Main Content Pages\"'),('meta.__names__.b541b12e-a2a1-4306-ae4c-e9f81c5ac527','\"Page Audience\"'),('meta.__names__.b6ed882c-7f7d-4f25-a47b-1582b73222eb','\"Expander Attributes\"'),('meta.__names__.bf0b1bf7-8d2f-4617-be38-8620e347009f','\"Custom Class\"'),('meta.__names__.c14b2c7a-f075-42ac-a27a-626b0354f3dd','\"Audience\"'),('meta.__names__.c2c2c3ff-8c88-483b-9945-9b90bcaff583','\"Concert Base Craft\"'),('meta.__names__.c8f56181-ee4f-48ff-9f39-0c43c1e1ff9e','\"Mr Table\"'),('meta.__names__.cafd3db0-3c9e-4eac-a922-f672ad5ef6d1','\"Description\"'),('meta.__names__.cec9808a-67b1-4e29-bb47-7f2b31bdfdc6','\"Documents\"'),('meta.__names__.cfedab0d-6899-463e-a413-aad6ae194e73','\"Email\"'),('meta.__names__.d02b1c70-59a5-4c84-bbc4-ba09ea0b50d3','\"Custom Class\"'),('meta.__names__.ddb3d9a1-9ad7-4d62-9112-c8d10720570d','\"Static Block\"'),('meta.__names__.e2d52a34-67e1-43fb-bc4a-f58b1c1d008f','\"Public Schema\"'),('meta.__names__.e64e80d6-6ff4-417f-817c-9af8c0f34d3e','\"Audience\"'),('meta.__names__.ea33628d-a48f-4bd5-9b85-71027daf9e78','\"Text\"'),('meta.__names__.ea4ed368-2494-42d5-b84c-8beb1242dff5','\"Default\"'),('meta.__names__.eeea89ef-7322-4496-8d2c-fbfcd389a19a','\"Heading Text\"'),('meta.__names__.eeec7060-b13e-40ad-8565-21374c64a879','\"Expander\"'),('meta.__names__.fb9f5d17-da5f-4281-83fe-daac141b28c1','\"Open Graph Image\"'),('meta.__names__.fe7f27d0-4eb4-4b8e-b7f2-2811cb5ec628','\"Expander heading\"'),('plugins.cookies.edition','\"standard\"'),('plugins.cookies.enabled','true'),('plugins.cookies.schemaVersion','\"1.0.0\"'),('plugins.field-manager.edition','\"standard\"'),('plugins.field-manager.enabled','true'),('plugins.field-manager.schemaVersion','\"1.0.0\"'),('plugins.kint.edition','\"standard\"'),('plugins.kint.enabled','true'),('plugins.kint.schemaVersion','\"1.0.0\"'),('plugins.redactor.edition','\"standard\"'),('plugins.redactor.enabled','true'),('plugins.redactor.schemaVersion','\"2.3.0\"'),('sections.90daf6c4-c1b7-4fca-9b3f-81cd5e44288d.defaultPlacement','\"end\"'),('sections.90daf6c4-c1b7-4fca-9b3f-81cd5e44288d.enableVersioning','true'),('sections.90daf6c4-c1b7-4fca-9b3f-81cd5e44288d.handle','\"homepage\"'),('sections.90daf6c4-c1b7-4fca-9b3f-81cd5e44288d.name','\"Homepage\"'),('sections.90daf6c4-c1b7-4fca-9b3f-81cd5e44288d.previewTargets.0.__assoc__.0.0','\"label\"'),('sections.90daf6c4-c1b7-4fca-9b3f-81cd5e44288d.previewTargets.0.__assoc__.0.1','\"Primary entry page\"'),('sections.90daf6c4-c1b7-4fca-9b3f-81cd5e44288d.previewTargets.0.__assoc__.1.0','\"urlFormat\"'),('sections.90daf6c4-c1b7-4fca-9b3f-81cd5e44288d.previewTargets.0.__assoc__.1.1','\"{url}\"'),('sections.90daf6c4-c1b7-4fca-9b3f-81cd5e44288d.previewTargets.0.__assoc__.2.0','\"refresh\"'),('sections.90daf6c4-c1b7-4fca-9b3f-81cd5e44288d.previewTargets.0.__assoc__.2.1','\"1\"'),('sections.90daf6c4-c1b7-4fca-9b3f-81cd5e44288d.propagationMethod','\"all\"'),('sections.90daf6c4-c1b7-4fca-9b3f-81cd5e44288d.siteSettings.c2c2c3ff-8c88-483b-9945-9b90bcaff583.enabledByDefault','true'),('sections.90daf6c4-c1b7-4fca-9b3f-81cd5e44288d.siteSettings.c2c2c3ff-8c88-483b-9945-9b90bcaff583.hasUrls','true'),('sections.90daf6c4-c1b7-4fca-9b3f-81cd5e44288d.siteSettings.c2c2c3ff-8c88-483b-9945-9b90bcaff583.template','\"index.twig\"'),('sections.90daf6c4-c1b7-4fca-9b3f-81cd5e44288d.siteSettings.c2c2c3ff-8c88-483b-9945-9b90bcaff583.uriFormat','\"__home__\"'),('sections.90daf6c4-c1b7-4fca-9b3f-81cd5e44288d.type','\"single\"'),('sections.b474e34b-1e23-4449-9c58-18e5e4ed6e47.defaultPlacement','\"end\"'),('sections.b474e34b-1e23-4449-9c58-18e5e4ed6e47.enableVersioning','true'),('sections.b474e34b-1e23-4449-9c58-18e5e4ed6e47.handle','\"mainContentPages\"'),('sections.b474e34b-1e23-4449-9c58-18e5e4ed6e47.name','\"Main Content Pages\"'),('sections.b474e34b-1e23-4449-9c58-18e5e4ed6e47.previewTargets.0.__assoc__.0.0','\"label\"'),('sections.b474e34b-1e23-4449-9c58-18e5e4ed6e47.previewTargets.0.__assoc__.0.1','\"Primary entry page\"'),('sections.b474e34b-1e23-4449-9c58-18e5e4ed6e47.previewTargets.0.__assoc__.1.0','\"urlFormat\"'),('sections.b474e34b-1e23-4449-9c58-18e5e4ed6e47.previewTargets.0.__assoc__.1.1','\"{url}\"'),('sections.b474e34b-1e23-4449-9c58-18e5e4ed6e47.previewTargets.0.__assoc__.2.0','\"refresh\"'),('sections.b474e34b-1e23-4449-9c58-18e5e4ed6e47.previewTargets.0.__assoc__.2.1','\"1\"'),('sections.b474e34b-1e23-4449-9c58-18e5e4ed6e47.propagationMethod','\"all\"'),('sections.b474e34b-1e23-4449-9c58-18e5e4ed6e47.siteSettings.c2c2c3ff-8c88-483b-9945-9b90bcaff583.enabledByDefault','true'),('sections.b474e34b-1e23-4449-9c58-18e5e4ed6e47.siteSettings.c2c2c3ff-8c88-483b-9945-9b90bcaff583.hasUrls','true'),('sections.b474e34b-1e23-4449-9c58-18e5e4ed6e47.siteSettings.c2c2c3ff-8c88-483b-9945-9b90bcaff583.template','\"_templates/entry.twig\"'),('sections.b474e34b-1e23-4449-9c58-18e5e4ed6e47.siteSettings.c2c2c3ff-8c88-483b-9945-9b90bcaff583.uriFormat','\"{parent.uri}/{slug}\"'),('sections.b474e34b-1e23-4449-9c58-18e5e4ed6e47.structure.maxLevels','null'),('sections.b474e34b-1e23-4449-9c58-18e5e4ed6e47.structure.uid','\"40e2bc45-63d5-4391-b2b0-f9e462a0127b\"'),('sections.b474e34b-1e23-4449-9c58-18e5e4ed6e47.type','\"structure\"'),('siteGroups.14eaedf3-c926-4a00-a4d2-e2bf862932e4.name','\"Concert Base Craft\"'),('sites.c2c2c3ff-8c88-483b-9945-9b90bcaff583.baseUrl','\"$PRIMARY_SITE_URL\"'),('sites.c2c2c3ff-8c88-483b-9945-9b90bcaff583.enabled','true'),('sites.c2c2c3ff-8c88-483b-9945-9b90bcaff583.handle','\"default\"'),('sites.c2c2c3ff-8c88-483b-9945-9b90bcaff583.hasUrls','true'),('sites.c2c2c3ff-8c88-483b-9945-9b90bcaff583.language','\"en-GB\"'),('sites.c2c2c3ff-8c88-483b-9945-9b90bcaff583.name','\"Concert Base Craft\"'),('sites.c2c2c3ff-8c88-483b-9945-9b90bcaff583.primary','true'),('sites.c2c2c3ff-8c88-483b-9945-9b90bcaff583.siteGroup','\"14eaedf3-c926-4a00-a4d2-e2bf862932e4\"'),('sites.c2c2c3ff-8c88-483b-9945-9b90bcaff583.sortOrder','1'),('system.edition','\"pro\"'),('system.live','true'),('system.name','\"Concert Base Craft\"'),('system.retryDuration','null'),('system.schemaVersion','\"3.7.33\"'),('system.timeZone','\"UTC\"'),('users.allowPublicRegistration','false'),('users.defaultGroup','null'),('users.photoSubpath','null'),('users.photoVolumeUid','null'),('users.requireEmailVerification','true'),('volumes.0fc8f823-7b53-417a-95d5-e8dda8aeb727.fieldLayouts.2f9920f1-3d2a-48c3-96c1-2c56ea8ddb4f.tabs.0.elements.0.autocapitalize','true'),('volumes.0fc8f823-7b53-417a-95d5-e8dda8aeb727.fieldLayouts.2f9920f1-3d2a-48c3-96c1-2c56ea8ddb4f.tabs.0.elements.0.autocomplete','false'),('volumes.0fc8f823-7b53-417a-95d5-e8dda8aeb727.fieldLayouts.2f9920f1-3d2a-48c3-96c1-2c56ea8ddb4f.tabs.0.elements.0.autocorrect','true'),('volumes.0fc8f823-7b53-417a-95d5-e8dda8aeb727.fieldLayouts.2f9920f1-3d2a-48c3-96c1-2c56ea8ddb4f.tabs.0.elements.0.class','null'),('volumes.0fc8f823-7b53-417a-95d5-e8dda8aeb727.fieldLayouts.2f9920f1-3d2a-48c3-96c1-2c56ea8ddb4f.tabs.0.elements.0.disabled','false'),('volumes.0fc8f823-7b53-417a-95d5-e8dda8aeb727.fieldLayouts.2f9920f1-3d2a-48c3-96c1-2c56ea8ddb4f.tabs.0.elements.0.id','null'),('volumes.0fc8f823-7b53-417a-95d5-e8dda8aeb727.fieldLayouts.2f9920f1-3d2a-48c3-96c1-2c56ea8ddb4f.tabs.0.elements.0.instructions','null'),('volumes.0fc8f823-7b53-417a-95d5-e8dda8aeb727.fieldLayouts.2f9920f1-3d2a-48c3-96c1-2c56ea8ddb4f.tabs.0.elements.0.label','null'),('volumes.0fc8f823-7b53-417a-95d5-e8dda8aeb727.fieldLayouts.2f9920f1-3d2a-48c3-96c1-2c56ea8ddb4f.tabs.0.elements.0.max','null'),('volumes.0fc8f823-7b53-417a-95d5-e8dda8aeb727.fieldLayouts.2f9920f1-3d2a-48c3-96c1-2c56ea8ddb4f.tabs.0.elements.0.min','null'),('volumes.0fc8f823-7b53-417a-95d5-e8dda8aeb727.fieldLayouts.2f9920f1-3d2a-48c3-96c1-2c56ea8ddb4f.tabs.0.elements.0.name','null'),('volumes.0fc8f823-7b53-417a-95d5-e8dda8aeb727.fieldLayouts.2f9920f1-3d2a-48c3-96c1-2c56ea8ddb4f.tabs.0.elements.0.orientation','null'),('volumes.0fc8f823-7b53-417a-95d5-e8dda8aeb727.fieldLayouts.2f9920f1-3d2a-48c3-96c1-2c56ea8ddb4f.tabs.0.elements.0.placeholder','null'),('volumes.0fc8f823-7b53-417a-95d5-e8dda8aeb727.fieldLayouts.2f9920f1-3d2a-48c3-96c1-2c56ea8ddb4f.tabs.0.elements.0.readonly','false'),('volumes.0fc8f823-7b53-417a-95d5-e8dda8aeb727.fieldLayouts.2f9920f1-3d2a-48c3-96c1-2c56ea8ddb4f.tabs.0.elements.0.requirable','false'),('volumes.0fc8f823-7b53-417a-95d5-e8dda8aeb727.fieldLayouts.2f9920f1-3d2a-48c3-96c1-2c56ea8ddb4f.tabs.0.elements.0.size','null'),('volumes.0fc8f823-7b53-417a-95d5-e8dda8aeb727.fieldLayouts.2f9920f1-3d2a-48c3-96c1-2c56ea8ddb4f.tabs.0.elements.0.step','null'),('volumes.0fc8f823-7b53-417a-95d5-e8dda8aeb727.fieldLayouts.2f9920f1-3d2a-48c3-96c1-2c56ea8ddb4f.tabs.0.elements.0.tip','null'),('volumes.0fc8f823-7b53-417a-95d5-e8dda8aeb727.fieldLayouts.2f9920f1-3d2a-48c3-96c1-2c56ea8ddb4f.tabs.0.elements.0.title','null'),('volumes.0fc8f823-7b53-417a-95d5-e8dda8aeb727.fieldLayouts.2f9920f1-3d2a-48c3-96c1-2c56ea8ddb4f.tabs.0.elements.0.type','\"craft\\\\fieldlayoutelements\\\\AssetTitleField\"'),('volumes.0fc8f823-7b53-417a-95d5-e8dda8aeb727.fieldLayouts.2f9920f1-3d2a-48c3-96c1-2c56ea8ddb4f.tabs.0.elements.0.warning','null'),('volumes.0fc8f823-7b53-417a-95d5-e8dda8aeb727.fieldLayouts.2f9920f1-3d2a-48c3-96c1-2c56ea8ddb4f.tabs.0.elements.0.width','100'),('volumes.0fc8f823-7b53-417a-95d5-e8dda8aeb727.fieldLayouts.2f9920f1-3d2a-48c3-96c1-2c56ea8ddb4f.tabs.0.name','\"Content\"'),('volumes.0fc8f823-7b53-417a-95d5-e8dda8aeb727.fieldLayouts.2f9920f1-3d2a-48c3-96c1-2c56ea8ddb4f.tabs.0.sortOrder','1'),('volumes.0fc8f823-7b53-417a-95d5-e8dda8aeb727.handle','\"icons\"'),('volumes.0fc8f823-7b53-417a-95d5-e8dda8aeb727.hasUrls','true'),('volumes.0fc8f823-7b53-417a-95d5-e8dda8aeb727.name','\"Icons\"'),('volumes.0fc8f823-7b53-417a-95d5-e8dda8aeb727.settings.path','\"$BASE_PATH/public/assets/uploads/icons\"'),('volumes.0fc8f823-7b53-417a-95d5-e8dda8aeb727.sortOrder','2'),('volumes.0fc8f823-7b53-417a-95d5-e8dda8aeb727.titleTranslationKeyFormat','null'),('volumes.0fc8f823-7b53-417a-95d5-e8dda8aeb727.titleTranslationMethod','\"site\"'),('volumes.0fc8f823-7b53-417a-95d5-e8dda8aeb727.type','\"craft\\\\volumes\\\\Local\"'),('volumes.0fc8f823-7b53-417a-95d5-e8dda8aeb727.url','\"/assets/uploads/icons\"'),('volumes.96c744fc-87db-44dc-a086-5ae952f73fad.fieldLayouts.cd2c5243-28d7-4a4a-8b22-97c4f6b8a046.tabs.0.elements.0.autocapitalize','true'),('volumes.96c744fc-87db-44dc-a086-5ae952f73fad.fieldLayouts.cd2c5243-28d7-4a4a-8b22-97c4f6b8a046.tabs.0.elements.0.autocomplete','false'),('volumes.96c744fc-87db-44dc-a086-5ae952f73fad.fieldLayouts.cd2c5243-28d7-4a4a-8b22-97c4f6b8a046.tabs.0.elements.0.autocorrect','true'),('volumes.96c744fc-87db-44dc-a086-5ae952f73fad.fieldLayouts.cd2c5243-28d7-4a4a-8b22-97c4f6b8a046.tabs.0.elements.0.class','null'),('volumes.96c744fc-87db-44dc-a086-5ae952f73fad.fieldLayouts.cd2c5243-28d7-4a4a-8b22-97c4f6b8a046.tabs.0.elements.0.disabled','false'),('volumes.96c744fc-87db-44dc-a086-5ae952f73fad.fieldLayouts.cd2c5243-28d7-4a4a-8b22-97c4f6b8a046.tabs.0.elements.0.id','null'),('volumes.96c744fc-87db-44dc-a086-5ae952f73fad.fieldLayouts.cd2c5243-28d7-4a4a-8b22-97c4f6b8a046.tabs.0.elements.0.instructions','null'),('volumes.96c744fc-87db-44dc-a086-5ae952f73fad.fieldLayouts.cd2c5243-28d7-4a4a-8b22-97c4f6b8a046.tabs.0.elements.0.label','null'),('volumes.96c744fc-87db-44dc-a086-5ae952f73fad.fieldLayouts.cd2c5243-28d7-4a4a-8b22-97c4f6b8a046.tabs.0.elements.0.max','null'),('volumes.96c744fc-87db-44dc-a086-5ae952f73fad.fieldLayouts.cd2c5243-28d7-4a4a-8b22-97c4f6b8a046.tabs.0.elements.0.min','null'),('volumes.96c744fc-87db-44dc-a086-5ae952f73fad.fieldLayouts.cd2c5243-28d7-4a4a-8b22-97c4f6b8a046.tabs.0.elements.0.name','null'),('volumes.96c744fc-87db-44dc-a086-5ae952f73fad.fieldLayouts.cd2c5243-28d7-4a4a-8b22-97c4f6b8a046.tabs.0.elements.0.orientation','null'),('volumes.96c744fc-87db-44dc-a086-5ae952f73fad.fieldLayouts.cd2c5243-28d7-4a4a-8b22-97c4f6b8a046.tabs.0.elements.0.placeholder','null'),('volumes.96c744fc-87db-44dc-a086-5ae952f73fad.fieldLayouts.cd2c5243-28d7-4a4a-8b22-97c4f6b8a046.tabs.0.elements.0.readonly','false'),('volumes.96c744fc-87db-44dc-a086-5ae952f73fad.fieldLayouts.cd2c5243-28d7-4a4a-8b22-97c4f6b8a046.tabs.0.elements.0.requirable','false'),('volumes.96c744fc-87db-44dc-a086-5ae952f73fad.fieldLayouts.cd2c5243-28d7-4a4a-8b22-97c4f6b8a046.tabs.0.elements.0.size','null'),('volumes.96c744fc-87db-44dc-a086-5ae952f73fad.fieldLayouts.cd2c5243-28d7-4a4a-8b22-97c4f6b8a046.tabs.0.elements.0.step','null'),('volumes.96c744fc-87db-44dc-a086-5ae952f73fad.fieldLayouts.cd2c5243-28d7-4a4a-8b22-97c4f6b8a046.tabs.0.elements.0.tip','null'),('volumes.96c744fc-87db-44dc-a086-5ae952f73fad.fieldLayouts.cd2c5243-28d7-4a4a-8b22-97c4f6b8a046.tabs.0.elements.0.title','null'),('volumes.96c744fc-87db-44dc-a086-5ae952f73fad.fieldLayouts.cd2c5243-28d7-4a4a-8b22-97c4f6b8a046.tabs.0.elements.0.type','\"craft\\\\fieldlayoutelements\\\\AssetTitleField\"'),('volumes.96c744fc-87db-44dc-a086-5ae952f73fad.fieldLayouts.cd2c5243-28d7-4a4a-8b22-97c4f6b8a046.tabs.0.elements.0.warning','null'),('volumes.96c744fc-87db-44dc-a086-5ae952f73fad.fieldLayouts.cd2c5243-28d7-4a4a-8b22-97c4f6b8a046.tabs.0.elements.0.width','100'),('volumes.96c744fc-87db-44dc-a086-5ae952f73fad.fieldLayouts.cd2c5243-28d7-4a4a-8b22-97c4f6b8a046.tabs.0.name','\"Content\"'),('volumes.96c744fc-87db-44dc-a086-5ae952f73fad.fieldLayouts.cd2c5243-28d7-4a4a-8b22-97c4f6b8a046.tabs.0.sortOrder','1'),('volumes.96c744fc-87db-44dc-a086-5ae952f73fad.handle','\"images\"'),('volumes.96c744fc-87db-44dc-a086-5ae952f73fad.hasUrls','true'),('volumes.96c744fc-87db-44dc-a086-5ae952f73fad.name','\"Images\"'),('volumes.96c744fc-87db-44dc-a086-5ae952f73fad.settings.path','\"$BASE_PATH/public/assets/uploads/images\"'),('volumes.96c744fc-87db-44dc-a086-5ae952f73fad.sortOrder','1'),('volumes.96c744fc-87db-44dc-a086-5ae952f73fad.titleTranslationKeyFormat','null'),('volumes.96c744fc-87db-44dc-a086-5ae952f73fad.titleTranslationMethod','\"site\"'),('volumes.96c744fc-87db-44dc-a086-5ae952f73fad.type','\"craft\\\\volumes\\\\Local\"'),('volumes.96c744fc-87db-44dc-a086-5ae952f73fad.url','\"/assets/uploads/images\"'),('volumes.cec9808a-67b1-4e29-bb47-7f2b31bdfdc6.fieldLayouts.3f07e9c3-c2b1-4b04-8587-5ac1af9c43c3.tabs.0.elements.0.autocapitalize','true'),('volumes.cec9808a-67b1-4e29-bb47-7f2b31bdfdc6.fieldLayouts.3f07e9c3-c2b1-4b04-8587-5ac1af9c43c3.tabs.0.elements.0.autocomplete','false'),('volumes.cec9808a-67b1-4e29-bb47-7f2b31bdfdc6.fieldLayouts.3f07e9c3-c2b1-4b04-8587-5ac1af9c43c3.tabs.0.elements.0.autocorrect','true'),('volumes.cec9808a-67b1-4e29-bb47-7f2b31bdfdc6.fieldLayouts.3f07e9c3-c2b1-4b04-8587-5ac1af9c43c3.tabs.0.elements.0.class','null'),('volumes.cec9808a-67b1-4e29-bb47-7f2b31bdfdc6.fieldLayouts.3f07e9c3-c2b1-4b04-8587-5ac1af9c43c3.tabs.0.elements.0.disabled','false'),('volumes.cec9808a-67b1-4e29-bb47-7f2b31bdfdc6.fieldLayouts.3f07e9c3-c2b1-4b04-8587-5ac1af9c43c3.tabs.0.elements.0.id','null'),('volumes.cec9808a-67b1-4e29-bb47-7f2b31bdfdc6.fieldLayouts.3f07e9c3-c2b1-4b04-8587-5ac1af9c43c3.tabs.0.elements.0.instructions','null'),('volumes.cec9808a-67b1-4e29-bb47-7f2b31bdfdc6.fieldLayouts.3f07e9c3-c2b1-4b04-8587-5ac1af9c43c3.tabs.0.elements.0.label','null'),('volumes.cec9808a-67b1-4e29-bb47-7f2b31bdfdc6.fieldLayouts.3f07e9c3-c2b1-4b04-8587-5ac1af9c43c3.tabs.0.elements.0.max','null'),('volumes.cec9808a-67b1-4e29-bb47-7f2b31bdfdc6.fieldLayouts.3f07e9c3-c2b1-4b04-8587-5ac1af9c43c3.tabs.0.elements.0.min','null'),('volumes.cec9808a-67b1-4e29-bb47-7f2b31bdfdc6.fieldLayouts.3f07e9c3-c2b1-4b04-8587-5ac1af9c43c3.tabs.0.elements.0.name','null'),('volumes.cec9808a-67b1-4e29-bb47-7f2b31bdfdc6.fieldLayouts.3f07e9c3-c2b1-4b04-8587-5ac1af9c43c3.tabs.0.elements.0.orientation','null'),('volumes.cec9808a-67b1-4e29-bb47-7f2b31bdfdc6.fieldLayouts.3f07e9c3-c2b1-4b04-8587-5ac1af9c43c3.tabs.0.elements.0.placeholder','null'),('volumes.cec9808a-67b1-4e29-bb47-7f2b31bdfdc6.fieldLayouts.3f07e9c3-c2b1-4b04-8587-5ac1af9c43c3.tabs.0.elements.0.readonly','false'),('volumes.cec9808a-67b1-4e29-bb47-7f2b31bdfdc6.fieldLayouts.3f07e9c3-c2b1-4b04-8587-5ac1af9c43c3.tabs.0.elements.0.requirable','false'),('volumes.cec9808a-67b1-4e29-bb47-7f2b31bdfdc6.fieldLayouts.3f07e9c3-c2b1-4b04-8587-5ac1af9c43c3.tabs.0.elements.0.size','null'),('volumes.cec9808a-67b1-4e29-bb47-7f2b31bdfdc6.fieldLayouts.3f07e9c3-c2b1-4b04-8587-5ac1af9c43c3.tabs.0.elements.0.step','null'),('volumes.cec9808a-67b1-4e29-bb47-7f2b31bdfdc6.fieldLayouts.3f07e9c3-c2b1-4b04-8587-5ac1af9c43c3.tabs.0.elements.0.tip','null'),('volumes.cec9808a-67b1-4e29-bb47-7f2b31bdfdc6.fieldLayouts.3f07e9c3-c2b1-4b04-8587-5ac1af9c43c3.tabs.0.elements.0.title','null'),('volumes.cec9808a-67b1-4e29-bb47-7f2b31bdfdc6.fieldLayouts.3f07e9c3-c2b1-4b04-8587-5ac1af9c43c3.tabs.0.elements.0.type','\"craft\\\\fieldlayoutelements\\\\AssetTitleField\"'),('volumes.cec9808a-67b1-4e29-bb47-7f2b31bdfdc6.fieldLayouts.3f07e9c3-c2b1-4b04-8587-5ac1af9c43c3.tabs.0.elements.0.warning','null'),('volumes.cec9808a-67b1-4e29-bb47-7f2b31bdfdc6.fieldLayouts.3f07e9c3-c2b1-4b04-8587-5ac1af9c43c3.tabs.0.elements.0.width','100'),('volumes.cec9808a-67b1-4e29-bb47-7f2b31bdfdc6.fieldLayouts.3f07e9c3-c2b1-4b04-8587-5ac1af9c43c3.tabs.0.name','\"Content\"'),('volumes.cec9808a-67b1-4e29-bb47-7f2b31bdfdc6.fieldLayouts.3f07e9c3-c2b1-4b04-8587-5ac1af9c43c3.tabs.0.sortOrder','1'),('volumes.cec9808a-67b1-4e29-bb47-7f2b31bdfdc6.handle','\"documents\"'),('volumes.cec9808a-67b1-4e29-bb47-7f2b31bdfdc6.hasUrls','true'),('volumes.cec9808a-67b1-4e29-bb47-7f2b31bdfdc6.name','\"Documents\"'),('volumes.cec9808a-67b1-4e29-bb47-7f2b31bdfdc6.settings.path','\"$BASE_PATH/public/assets/uploads/documents\"'),('volumes.cec9808a-67b1-4e29-bb47-7f2b31bdfdc6.sortOrder','3'),('volumes.cec9808a-67b1-4e29-bb47-7f2b31bdfdc6.titleTranslationKeyFormat','null'),('volumes.cec9808a-67b1-4e29-bb47-7f2b31bdfdc6.titleTranslationMethod','\"site\"'),('volumes.cec9808a-67b1-4e29-bb47-7f2b31bdfdc6.type','\"craft\\\\volumes\\\\Local\"'),('volumes.cec9808a-67b1-4e29-bb47-7f2b31bdfdc6.url','\"/public/assets/uploads/documents\"');
/*!40000 ALTER TABLE `cc1_projectconfig` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `cc1_queue`
--

LOCK TABLES `cc1_queue` WRITE;
/*!40000 ALTER TABLE `cc1_queue` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `cc1_queue` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `cc1_relations`
--

LOCK TABLES `cc1_relations` WRITE;
/*!40000 ALTER TABLE `cc1_relations` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `cc1_relations` VALUES (1,6,6,NULL,4,1,'2022-08-23 13:47:44','2022-08-23 13:47:44','8c20cf39-4494-4f52-a050-88897f6af12a'),(2,14,8,NULL,4,1,'2022-08-23 13:47:58','2022-08-23 13:47:58','05a27d5f-8b54-46ed-af5d-cce135c5e58f'),(3,14,9,NULL,4,1,'2022-08-23 13:48:20','2022-08-23 13:48:20','85ee1001-53f3-46c9-b73e-753552837e68'),(4,6,10,NULL,4,1,'2022-08-23 13:48:23','2022-08-23 13:48:23','c49dd08f-bd2e-4117-8498-51b40574d411'),(5,14,11,NULL,4,1,'2022-08-23 13:48:23','2022-08-23 13:48:23','9c396a11-9779-400c-b183-be7b35a87eb0');
/*!40000 ALTER TABLE `cc1_relations` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `cc1_revisions`
--

LOCK TABLES `cc1_revisions` WRITE;
/*!40000 ALTER TABLE `cc1_revisions` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `cc1_revisions` VALUES (1,2,1,1,NULL),(2,6,1,1,'');
/*!40000 ALTER TABLE `cc1_revisions` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `cc1_searchindex`
--

LOCK TABLES `cc1_searchindex` WRITE;
/*!40000 ALTER TABLE `cc1_searchindex` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `cc1_searchindex` VALUES (1,'username',0,1,' dylan hughes buck com '),(1,'firstname',0,1,''),(1,'lastname',0,1,''),(1,'fullname',0,1,''),(1,'email',0,1,' dylan hughes buck com '),(1,'slug',0,1,''),(2,'title',0,1,' homepage '),(2,'slug',0,1,' homepage '),(4,'slug',0,1,' default '),(4,'title',0,1,' default '),(5,'slug',0,1,''),(6,'slug',0,1,' an page '),(6,'title',0,1,' an page '),(6,'field',6,1,' default '),(9,'slug',0,1,''),(9,'field',14,1,' default '),(9,'field',13,1,''),(6,'field',7,1,' default ');
/*!40000 ALTER TABLE `cc1_searchindex` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `cc1_sections`
--

LOCK TABLES `cc1_sections` WRITE;
/*!40000 ALTER TABLE `cc1_sections` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `cc1_sections` VALUES (1,NULL,'Homepage','homepage','single',1,'all','end','[{\"label\":\"Primary entry page\",\"urlFormat\":\"{url}\",\"refresh\":\"1\"}]','2022-08-23 12:55:37','2022-08-23 12:55:37',NULL,'90daf6c4-c1b7-4fca-9b3f-81cd5e44288d'),(2,2,'Main Content Pages','mainContentPages','structure',1,'all','end','[{\"label\":\"Primary entry page\",\"urlFormat\":\"{url}\",\"refresh\":\"1\"}]','2022-08-23 12:58:58','2022-08-23 12:58:58',NULL,'b474e34b-1e23-4449-9c58-18e5e4ed6e47');
/*!40000 ALTER TABLE `cc1_sections` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `cc1_sections_sites`
--

LOCK TABLES `cc1_sections_sites` WRITE;
/*!40000 ALTER TABLE `cc1_sections_sites` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `cc1_sections_sites` VALUES (1,1,1,1,'__home__','index.twig',1,'2022-08-23 12:55:37','2022-08-23 12:55:37','b869feae-5ec3-49d3-9c1d-2218fbb31eff'),(2,2,1,1,'{parent.uri}/{slug}','_templates/entry.twig',1,'2022-08-23 12:58:58','2022-08-23 12:58:58','0ab748f5-f647-4489-808d-2f5d720a9742');
/*!40000 ALTER TABLE `cc1_sections_sites` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `cc1_sequences`
--

LOCK TABLES `cc1_sequences` WRITE;
/*!40000 ALTER TABLE `cc1_sequences` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `cc1_sequences` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `cc1_shunnedmessages`
--

LOCK TABLES `cc1_shunnedmessages` WRITE;
/*!40000 ALTER TABLE `cc1_shunnedmessages` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `cc1_shunnedmessages` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `cc1_sitegroups`
--

LOCK TABLES `cc1_sitegroups` WRITE;
/*!40000 ALTER TABLE `cc1_sitegroups` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `cc1_sitegroups` VALUES (1,'Concert Base Craft','2022-08-22 16:17:34','2022-08-22 16:17:34',NULL,'14eaedf3-c926-4a00-a4d2-e2bf862932e4');
/*!40000 ALTER TABLE `cc1_sitegroups` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `cc1_sites`
--

LOCK TABLES `cc1_sites` WRITE;
/*!40000 ALTER TABLE `cc1_sites` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `cc1_sites` VALUES (1,1,1,1,'Concert Base Craft','default','en-GB',1,'$PRIMARY_SITE_URL',1,'2022-08-22 16:17:34','2022-08-22 16:17:34',NULL,'c2c2c3ff-8c88-483b-9945-9b90bcaff583');
/*!40000 ALTER TABLE `cc1_sites` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `cc1_structureelements`
--

LOCK TABLES `cc1_structureelements` WRITE;
/*!40000 ALTER TABLE `cc1_structureelements` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `cc1_structureelements` VALUES (1,1,NULL,1,1,4,0,'2022-08-23 12:59:33','2022-08-23 12:59:33','b1b1bcdd-87cd-4eac-a978-bc968a097094'),(2,1,4,1,2,3,1,'2022-08-23 12:59:33','2022-08-23 12:59:33','b4121bfe-fbad-47ec-a542-042fe41a1ffc'),(3,2,NULL,3,1,4,0,'2022-08-23 13:45:34','2022-08-23 13:45:34','431046f2-681d-4be9-b6ee-83749de062d2'),(4,2,6,3,2,3,1,'2022-08-23 13:45:34','2022-08-23 13:45:34','deccc882-2db9-4642-835f-f4cd0b150ba8');
/*!40000 ALTER TABLE `cc1_structureelements` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `cc1_structures`
--

LOCK TABLES `cc1_structures` WRITE;
/*!40000 ALTER TABLE `cc1_structures` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `cc1_structures` VALUES (1,1,'2022-08-23 11:12:14','2022-08-23 11:12:14',NULL,'755d7784-39ae-4331-8688-2530850577e0'),(2,NULL,'2022-08-23 12:58:58','2022-08-23 12:58:58',NULL,'40e2bc45-63d5-4391-b2b0-f9e462a0127b');
/*!40000 ALTER TABLE `cc1_structures` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `cc1_systemmessages`
--

LOCK TABLES `cc1_systemmessages` WRITE;
/*!40000 ALTER TABLE `cc1_systemmessages` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `cc1_systemmessages` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `cc1_taggroups`
--

LOCK TABLES `cc1_taggroups` WRITE;
/*!40000 ALTER TABLE `cc1_taggroups` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `cc1_taggroups` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `cc1_tags`
--

LOCK TABLES `cc1_tags` WRITE;
/*!40000 ALTER TABLE `cc1_tags` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `cc1_tags` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `cc1_tokens`
--

LOCK TABLES `cc1_tokens` WRITE;
/*!40000 ALTER TABLE `cc1_tokens` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `cc1_tokens` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `cc1_usergroups`
--

LOCK TABLES `cc1_usergroups` WRITE;
/*!40000 ALTER TABLE `cc1_usergroups` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `cc1_usergroups` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `cc1_usergroups_users`
--

LOCK TABLES `cc1_usergroups_users` WRITE;
/*!40000 ALTER TABLE `cc1_usergroups_users` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `cc1_usergroups_users` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `cc1_userpermissions`
--

LOCK TABLES `cc1_userpermissions` WRITE;
/*!40000 ALTER TABLE `cc1_userpermissions` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `cc1_userpermissions` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `cc1_userpermissions_usergroups`
--

LOCK TABLES `cc1_userpermissions_usergroups` WRITE;
/*!40000 ALTER TABLE `cc1_userpermissions_usergroups` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `cc1_userpermissions_usergroups` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `cc1_userpermissions_users`
--

LOCK TABLES `cc1_userpermissions_users` WRITE;
/*!40000 ALTER TABLE `cc1_userpermissions_users` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `cc1_userpermissions_users` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `cc1_userpreferences`
--

LOCK TABLES `cc1_userpreferences` WRITE;
/*!40000 ALTER TABLE `cc1_userpreferences` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `cc1_userpreferences` VALUES (1,'{\"language\":\"en-GB\"}');
/*!40000 ALTER TABLE `cc1_userpreferences` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `cc1_users`
--

LOCK TABLES `cc1_users` WRITE;
/*!40000 ALTER TABLE `cc1_users` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `cc1_users` VALUES (1,'dylan.hughes@buck.com',NULL,NULL,NULL,'dylan.hughes@buck.com','$2y$13$aOEhgnb.VyX6mENTVm4lwu.U.WoSSSvde.4Zbe/BZ9Y3.4onFrMKK',1,0,0,0,'2022-08-23 12:50:09',NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,0,'2022-08-22 16:17:35','2022-08-22 16:17:35','2022-08-23 12:50:09','7587b6c1-ecd6-49a5-aa64-2c6d8ea6d7e6');
/*!40000 ALTER TABLE `cc1_users` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `cc1_volumefolders`
--

LOCK TABLES `cc1_volumefolders` WRITE;
/*!40000 ALTER TABLE `cc1_volumefolders` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `cc1_volumefolders` VALUES (1,NULL,1,'Images','','2022-08-23 11:20:24','2022-08-23 11:20:24','2fda80a4-d48d-4ccc-b811-2de3557253aa'),(2,NULL,NULL,'Temporary source',NULL,'2022-08-23 11:23:30','2022-08-23 11:23:30','0d22efc9-f034-41f8-9e14-afbc5f0ea54b'),(3,2,NULL,'user_1','user_1/','2022-08-23 11:23:30','2022-08-23 11:23:30','0db09d54-7acf-420c-9777-24835397412b'),(4,NULL,2,'Icons','','2022-08-23 12:52:41','2022-08-23 12:52:41','a4bc26f8-2404-47e0-8132-a7d618d17f1c'),(5,NULL,3,'Documents','','2022-08-23 12:53:48','2022-08-23 12:53:48','4059ec53-eee5-433f-a632-c5610c42f3bc');
/*!40000 ALTER TABLE `cc1_volumefolders` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `cc1_volumes`
--

LOCK TABLES `cc1_volumes` WRITE;
/*!40000 ALTER TABLE `cc1_volumes` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `cc1_volumes` VALUES (1,2,'Images','images','craft\\volumes\\Local',1,'/assets/uploads/images','site',NULL,'{\"path\":\"$BASE_PATH/public/assets/uploads/images\"}',1,'2022-08-23 11:20:24','2022-08-23 11:20:24',NULL,'96c744fc-87db-44dc-a086-5ae952f73fad'),(2,3,'Icons','icons','craft\\volumes\\Local',1,'/assets/uploads/icons','site',NULL,'{\"path\":\"$BASE_PATH/public/assets/uploads/icons\"}',2,'2022-08-23 12:52:41','2022-08-23 12:54:07',NULL,'0fc8f823-7b53-417a-95d5-e8dda8aeb727'),(3,4,'Documents','documents','craft\\volumes\\Local',1,'/public/assets/uploads/documents','site',NULL,'{\"path\":\"$BASE_PATH/public/assets/uploads/documents\"}',3,'2022-08-23 12:53:48','2022-08-23 12:53:48',NULL,'cec9808a-67b1-4e29-bb47-7f2b31bdfdc6');
/*!40000 ALTER TABLE `cc1_volumes` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `cc1_widgets`
--

LOCK TABLES `cc1_widgets` WRITE;
/*!40000 ALTER TABLE `cc1_widgets` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `cc1_widgets` VALUES (1,1,'craft\\widgets\\RecentEntries',1,NULL,'{\"siteId\":1,\"section\":\"*\",\"limit\":10}',1,'2022-08-22 16:33:40','2022-08-22 16:33:40','46e6ed1c-b2bd-42cd-b919-e24d25ec1089'),(2,1,'craft\\widgets\\CraftSupport',2,NULL,'[]',1,'2022-08-22 16:33:40','2022-08-22 16:33:40','e7c289c1-f6f5-4ea2-9a08-467c2363574d'),(3,1,'craft\\widgets\\Updates',3,NULL,'[]',1,'2022-08-22 16:33:40','2022-08-22 16:33:40','f20e6125-f06d-4c45-b084-904d5dd17a58'),(4,1,'craft\\widgets\\Feed',4,NULL,'{\"url\":\"https://craftcms.com/news.rss\",\"title\":\"Craft News\",\"limit\":5}',1,'2022-08-22 16:33:40','2022-08-22 16:33:40','b120835d-2251-4ac9-a3da-45ab67a934be');
/*!40000 ALTER TABLE `cc1_widgets` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping routines for database 'base-craft-3-7'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-08-23 14:59:04
