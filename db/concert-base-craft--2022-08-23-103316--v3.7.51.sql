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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
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
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-08-23 10:33:16
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
/*!40000 ALTER TABLE `cc1_categories` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `cc1_categorygroups`
--

LOCK TABLES `cc1_categorygroups` WRITE;
/*!40000 ALTER TABLE `cc1_categorygroups` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `cc1_categorygroups` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `cc1_categorygroups_sites`
--

LOCK TABLES `cc1_categorygroups_sites` WRITE;
/*!40000 ALTER TABLE `cc1_categorygroups_sites` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `cc1_categorygroups_sites` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `cc1_changedattributes`
--

LOCK TABLES `cc1_changedattributes` WRITE;
/*!40000 ALTER TABLE `cc1_changedattributes` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `cc1_changedattributes` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `cc1_changedfields`
--

LOCK TABLES `cc1_changedfields` WRITE;
/*!40000 ALTER TABLE `cc1_changedfields` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `cc1_changedfields` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `cc1_content`
--

LOCK TABLES `cc1_content` WRITE;
/*!40000 ALTER TABLE `cc1_content` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `cc1_content` VALUES (1,1,1,NULL,'2022-08-22 16:17:34','2022-08-22 16:17:34','77dd2235-e4ee-4e75-87f8-fceb1db1a17b');
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
INSERT INTO `cc1_elements` VALUES (1,NULL,NULL,NULL,NULL,'craft\\elements\\User',1,0,'2022-08-22 16:17:34','2022-08-22 16:17:34',NULL,NULL,'110340f7-6ea6-4065-a692-1e26b48842be');
/*!40000 ALTER TABLE `cc1_elements` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `cc1_elements_sites`
--

LOCK TABLES `cc1_elements_sites` WRITE;
/*!40000 ALTER TABLE `cc1_elements_sites` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `cc1_elements_sites` VALUES (1,1,1,NULL,NULL,1,'2022-08-22 16:17:34','2022-08-22 16:17:34','0b346d02-89a8-44c7-ba9b-296b8979946a');
/*!40000 ALTER TABLE `cc1_elements_sites` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `cc1_entries`
--

LOCK TABLES `cc1_entries` WRITE;
/*!40000 ALTER TABLE `cc1_entries` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `cc1_entries` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `cc1_entrytypes`
--

LOCK TABLES `cc1_entrytypes` WRITE;
/*!40000 ALTER TABLE `cc1_entrytypes` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `cc1_entrytypes` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `cc1_fieldgroups`
--

LOCK TABLES `cc1_fieldgroups` WRITE;
/*!40000 ALTER TABLE `cc1_fieldgroups` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `cc1_fieldgroups` VALUES (1,'Common','2022-08-22 16:17:34','2022-08-22 16:17:34',NULL,'02ae1ee2-06d8-4df2-9fd3-b8f86587e78e');
/*!40000 ALTER TABLE `cc1_fieldgroups` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `cc1_fieldlayoutfields`
--

LOCK TABLES `cc1_fieldlayoutfields` WRITE;
/*!40000 ALTER TABLE `cc1_fieldlayoutfields` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `cc1_fieldlayoutfields` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `cc1_fieldlayouts`
--

LOCK TABLES `cc1_fieldlayouts` WRITE;
/*!40000 ALTER TABLE `cc1_fieldlayouts` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `cc1_fieldlayouts` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `cc1_fieldlayouttabs`
--

LOCK TABLES `cc1_fieldlayouttabs` WRITE;
/*!40000 ALTER TABLE `cc1_fieldlayouttabs` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `cc1_fieldlayouttabs` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `cc1_fields`
--

LOCK TABLES `cc1_fields` WRITE;
/*!40000 ALTER TABLE `cc1_fields` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `cc1_fields` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `cc1_globalsets`
--

LOCK TABLES `cc1_globalsets` WRITE;
/*!40000 ALTER TABLE `cc1_globalsets` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `cc1_globalsets` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `cc1_gqlschemas`
--

LOCK TABLES `cc1_gqlschemas` WRITE;
/*!40000 ALTER TABLE `cc1_gqlschemas` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `cc1_gqlschemas` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `cc1_gqltokens`
--

LOCK TABLES `cc1_gqltokens` WRITE;
/*!40000 ALTER TABLE `cc1_gqltokens` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `cc1_gqltokens` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `cc1_info`
--

LOCK TABLES `cc1_info` WRITE;
/*!40000 ALTER TABLE `cc1_info` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `cc1_info` VALUES (1,'3.7.51','3.7.33',0,'mrpnejunzpho','3@cdrhuolhfe','2022-08-22 16:17:34','2022-08-22 17:13:01','20734c82-6db4-4fec-967c-d559dd3f8ec9');
/*!40000 ALTER TABLE `cc1_info` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `cc1_matrixblocks`
--

LOCK TABLES `cc1_matrixblocks` WRITE;
/*!40000 ALTER TABLE `cc1_matrixblocks` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `cc1_matrixblocks` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `cc1_matrixblocktypes`
--

LOCK TABLES `cc1_matrixblocktypes` WRITE;
/*!40000 ALTER TABLE `cc1_matrixblocktypes` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `cc1_matrixblocktypes` ENABLE KEYS */;
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
INSERT INTO `cc1_plugins` VALUES (1,'redactor','2.10.10','2.3.0','unknown',NULL,'2022-08-22 16:38:27','2022-08-22 16:38:27','2022-08-22 22:49:17','816545ad-6ff5-4d6b-bfbd-1184673fa21b'),(2,'field-manager','2.2.5','1.0.0','unknown',NULL,'2022-08-22 16:42:59','2022-08-22 16:42:59','2022-08-22 22:49:17','2b42cd51-f500-4dec-98dd-a9fb95e8a516'),(3,'cookies','1.1.15','1.0.0','unknown',NULL,'2022-08-22 17:11:38','2022-08-22 17:11:38','2022-08-22 22:49:17','0678e7ea-ff73-4915-8978-0b848d81053c'),(4,'kint','2.0.0','1.0.0','unknown',NULL,'2022-08-22 17:13:01','2022-08-22 17:13:01','2022-08-22 22:49:17','5b86e9d1-b520-4730-8440-bfebb5d55414');
/*!40000 ALTER TABLE `cc1_plugins` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `cc1_projectconfig`
--

LOCK TABLES `cc1_projectconfig` WRITE;
/*!40000 ALTER TABLE `cc1_projectconfig` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `cc1_projectconfig` VALUES ('dateModified','1661188381'),('email.fromEmail','\"dylan.hughes@buck.com\"'),('email.fromName','\"Concert Base Craft\"'),('email.transportType','\"craft\\\\mail\\\\transportadapters\\\\Sendmail\"'),('fieldGroups.02ae1ee2-06d8-4df2-9fd3-b8f86587e78e.name','\"Common\"'),('meta.__names__.02ae1ee2-06d8-4df2-9fd3-b8f86587e78e','\"Common\"'),('meta.__names__.14eaedf3-c926-4a00-a4d2-e2bf862932e4','\"Concert Base Craft\"'),('meta.__names__.c2c2c3ff-8c88-483b-9945-9b90bcaff583','\"Concert Base Craft\"'),('plugins.cookies.edition','\"standard\"'),('plugins.cookies.enabled','true'),('plugins.cookies.schemaVersion','\"1.0.0\"'),('plugins.field-manager.edition','\"standard\"'),('plugins.field-manager.enabled','true'),('plugins.field-manager.schemaVersion','\"1.0.0\"'),('plugins.kint.edition','\"standard\"'),('plugins.kint.enabled','true'),('plugins.kint.schemaVersion','\"1.0.0\"'),('plugins.redactor.edition','\"standard\"'),('plugins.redactor.enabled','true'),('plugins.redactor.schemaVersion','\"2.3.0\"'),('siteGroups.14eaedf3-c926-4a00-a4d2-e2bf862932e4.name','\"Concert Base Craft\"'),('sites.c2c2c3ff-8c88-483b-9945-9b90bcaff583.baseUrl','\"$PRIMARY_SITE_URL\"'),('sites.c2c2c3ff-8c88-483b-9945-9b90bcaff583.handle','\"default\"'),('sites.c2c2c3ff-8c88-483b-9945-9b90bcaff583.hasUrls','true'),('sites.c2c2c3ff-8c88-483b-9945-9b90bcaff583.language','\"en-GB\"'),('sites.c2c2c3ff-8c88-483b-9945-9b90bcaff583.name','\"Concert Base Craft\"'),('sites.c2c2c3ff-8c88-483b-9945-9b90bcaff583.primary','true'),('sites.c2c2c3ff-8c88-483b-9945-9b90bcaff583.siteGroup','\"14eaedf3-c926-4a00-a4d2-e2bf862932e4\"'),('sites.c2c2c3ff-8c88-483b-9945-9b90bcaff583.sortOrder','1'),('system.edition','\"pro\"'),('system.live','true'),('system.name','\"Concert Base Craft\"'),('system.schemaVersion','\"3.7.33\"'),('system.timeZone','\"America/Los_Angeles\"'),('users.allowPublicRegistration','false'),('users.defaultGroup','null'),('users.photoSubpath','null'),('users.photoVolumeUid','null'),('users.requireEmailVerification','true');
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
/*!40000 ALTER TABLE `cc1_relations` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `cc1_revisions`
--

LOCK TABLES `cc1_revisions` WRITE;
/*!40000 ALTER TABLE `cc1_revisions` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `cc1_revisions` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `cc1_searchindex`
--

LOCK TABLES `cc1_searchindex` WRITE;
/*!40000 ALTER TABLE `cc1_searchindex` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `cc1_searchindex` VALUES (1,'username',0,1,' dylan hughes buck com '),(1,'firstname',0,1,''),(1,'lastname',0,1,''),(1,'fullname',0,1,''),(1,'email',0,1,' dylan hughes buck com '),(1,'slug',0,1,'');
/*!40000 ALTER TABLE `cc1_searchindex` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `cc1_sections`
--

LOCK TABLES `cc1_sections` WRITE;
/*!40000 ALTER TABLE `cc1_sections` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `cc1_sections` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `cc1_sections_sites`
--

LOCK TABLES `cc1_sections_sites` WRITE;
/*!40000 ALTER TABLE `cc1_sections_sites` DISABLE KEYS */;
set autocommit=0;
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
/*!40000 ALTER TABLE `cc1_structureelements` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `cc1_structures`
--

LOCK TABLES `cc1_structures` WRITE;
/*!40000 ALTER TABLE `cc1_structures` DISABLE KEYS */;
set autocommit=0;
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
INSERT INTO `cc1_users` VALUES (1,'dylan.hughes@buck.com',NULL,NULL,NULL,'dylan.hughes@buck.com','$2y$13$aOEhgnb.VyX6mENTVm4lwu.U.WoSSSvde.4Zbe/BZ9Y3.4onFrMKK',1,0,0,0,'2022-08-23 10:22:00',NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,0,'2022-08-22 16:17:35','2022-08-22 16:17:35','2022-08-23 10:22:00','7587b6c1-ecd6-49a5-aa64-2c6d8ea6d7e6');
/*!40000 ALTER TABLE `cc1_users` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `cc1_volumefolders`
--

LOCK TABLES `cc1_volumefolders` WRITE;
/*!40000 ALTER TABLE `cc1_volumefolders` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `cc1_volumefolders` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `cc1_volumes`
--

LOCK TABLES `cc1_volumes` WRITE;
/*!40000 ALTER TABLE `cc1_volumes` DISABLE KEYS */;
set autocommit=0;
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

-- Dump completed on 2022-08-23 10:33:16
