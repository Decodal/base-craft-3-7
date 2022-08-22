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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
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
  PRIMARY KEY (`id`),
  UNIQUE KEY `cc1_idx_chxllvhkrgiyjqzlgfpmeqolibhavhjegzkf` (`elementId`,`siteId`),
  KEY `cc1_idx_tpnrupzyqwljdqibuunctzubyzzxshucilva` (`siteId`),
  KEY `cc1_idx_nkcfahxbsjvtkidwmwwsxvgkfqvkzyuejllw` (`title`),
  CONSTRAINT `cc1_fk_dbdvipdtubolmvuekmvzefoulkjclbjlifgi` FOREIGN KEY (`siteId`) REFERENCES `cc1_sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `cc1_fk_pifednpejataujahpsrkcstpslagaqbcggra` FOREIGN KEY (`elementId`) REFERENCES `cc1_elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
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
