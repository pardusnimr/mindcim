-- MySQL dump 10.13  Distrib 5.1.66, for debian-linux-gnu (i686)
--
-- Host: localhost    Database: dev_openDCIM
-- ------------------------------------------------------
-- Server version	5.1.66-0ubuntu0.11.10.3

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
-- Table structure for table `fac_BinAudits`
--

DROP TABLE IF EXISTS `fac_BinAudits`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fac_BinAudits` (
  `BinID` int(11) NOT NULL,
  `UserID` int(11) NOT NULL,
  `AuditStamp` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fac_BinAudits`
--

LOCK TABLES `fac_BinAudits` WRITE;
/*!40000 ALTER TABLE `fac_BinAudits` DISABLE KEYS */;
/*!40000 ALTER TABLE `fac_BinAudits` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fac_BinContents`
--

DROP TABLE IF EXISTS `fac_BinContents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fac_BinContents` (
  `BinID` int(11) NOT NULL,
  `SupplyID` int(11) NOT NULL,
  `Count` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fac_BinContents`
--

LOCK TABLES `fac_BinContents` WRITE;
/*!40000 ALTER TABLE `fac_BinContents` DISABLE KEYS */;
/*!40000 ALTER TABLE `fac_BinContents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fac_CDUTemplate`
--

DROP TABLE IF EXISTS `fac_CDUTemplate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fac_CDUTemplate` (
  `TemplateID` int(11) NOT NULL AUTO_INCREMENT,
  `ManufacturerID` int(11) NOT NULL,
  `Model` varchar(80) NOT NULL,
  `Managed` int(1) NOT NULL,
  `VersionOID` varchar(80) NOT NULL,
  `Multiplier` enum('1','10','100') DEFAULT NULL,
  `OID1` varchar(80) NOT NULL,
  `OID2` varchar(80) NOT NULL,
  `OID3` varchar(80) NOT NULL,
  `ProcessingProfile` enum('SingleOIDWatts','SingleOIDAmperes','Combine3OIDWatts','Combine3OIDAmperes','Convert3PhAmperes') DEFAULT NULL,
  `Voltage` int(11) NOT NULL,
  `Amperage` int(11) NOT NULL,
  `NumOutlets` int(11) NOT NULL,
  PRIMARY KEY (`TemplateID`),
  UNIQUE KEY `ManufacturerID_2` (`ManufacturerID`,`Model`),
  KEY `ManufacturerID` (`ManufacturerID`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fac_CDUTemplate`
--

LOCK TABLES `fac_CDUTemplate` WRITE;
/*!40000 ALTER TABLE `fac_CDUTemplate` DISABLE KEYS */;
INSERT INTO `fac_CDUTemplate` VALUES (1,1,'Unmanaged CDU',0,'','1','','','','SingleOIDAmperes',0,0,0),(2,2,'Generic Single-Phase CDU',1,'.1.3.6.1.4.1.318.1.1.4.1.2.0','','.1.3.6.1.4.1.318.1.1.12.2.3.1.1.2.1','','','SingleOIDAmperes',0,0,0),(3,3,'Generic Delta/Single-Phase CDU',1,'.1.3.6.1.4.1.21239.2.1.2.0','','.1.3.6.1.4.1.21239.2.25.1.10.1','','','SingleOIDWatts',0,0,0),(4,3,'Generic Wye 3-Phase CDU',1,'.1.3.6.1.4.1.21239.2.1.2.0','','.1.3.6.1.4.1.21239.2.6.1.10.1','','','SingleOIDWatts',0,0,0),(5,4,'Generic Single-Phase CDU',1,'.1.3.6.1.4.1.1718.3.1.1.0','','.1.3.6.1.4.1.1718.3.2.2.1.7.1.1','','','SingleOIDAmperes',0,0,0),(6,4,'Generic 3-Phase CDU',1,'.1.3.6.1.4.1.1718.3.1.1.0','','.1.3.6.1.4.1.1718.3.2.2.1.7.1.1','.1.3.6.1.4.1.1718.3.2.2.1.7.1.2','.1.3.6.1.4.1.1718.3.2.2.1.7.1.3','Convert3PhAmperes',0,0,0);
/*!40000 ALTER TABLE `fac_CDUTemplate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fac_Cabinet`
--

DROP TABLE IF EXISTS `fac_Cabinet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fac_Cabinet` (
  `CabinetID` int(11) NOT NULL AUTO_INCREMENT,
  `DataCenterID` int(11) NOT NULL,
  `Location` varchar(20) NOT NULL,
  `AssignedTo` int(11) NOT NULL,
  `ZoneID` int(11) NOT NULL,
  `CabinetHeight` int(11) NOT NULL,
  `Model` varchar(80) NOT NULL,
  `Keylock` varchar(30) NOT NULL,
  `MaxKW` float NOT NULL,
  `MaxWeight` int(11) NOT NULL,
  `InstallationDate` date NOT NULL,
  `SensorIPAddress` varchar(20) NOT NULL,
  `SensorCommunity` varchar(40) NOT NULL,
  `SensorOID` varchar(80) NOT NULL,
  `MapX1` int(11) NOT NULL,
  `MapX2` int(11) NOT NULL,
  `MapY1` int(11) NOT NULL,
  `MapY2` int(11) NOT NULL,
  PRIMARY KEY (`CabinetID`)
) ENGINE=MyISAM AUTO_INCREMENT=41 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fac_Cabinet`
--

LOCK TABLES `fac_Cabinet` WRITE;
/*!40000 ALTER TABLE `fac_Cabinet` DISABLE KEYS */;
INSERT INTO `fac_Cabinet` VALUES (1,1,'C01',0,0,42,'','',0,0,'2013-01-23','','','',1391,1483,279,431),(2,1,'C02',0,0,42,'','',0,0,'2013-01-23','','','',1574,1663,280,432),(3,1,'C03',0,0,42,'','',0,0,'2013-01-23','','','',1755,1842,279,431),(4,1,'C04',0,0,42,'','',0,0,'2013-01-23','','','',1844,1934,280,431),(5,1,'C05',0,0,42,'','',0,0,'2013-01-23','','','',1874,2027,794,883),(6,1,'C06',0,0,42,'','',0,0,'2013-01-23','','','',1876,2025,884,974),(7,1,'C07',0,0,42,'','',0,0,'2013-01-23','','','',1876,2026,976,1065),(8,1,'C08',0,0,42,'','',0,0,'2013-01-23','','','',1420,1571,657,750),(9,1,'C09',0,0,42,'','',0,0,'2013-01-24','','','',1407,1558,914,1004),(10,1,'C10',0,0,42,'','',0,0,'2013-01-24','','','',1420,1574,1064,1157),(11,1,'C11',0,0,42,'','',0,0,'2013-01-24','','','',1422,1573,1199,1291),(12,1,'C12',0,0,42,'','',0,0,'2013-01-24','','','',1118,1270,1338,1429),(13,1,'C13',0,0,42,'','',0,0,'2013-01-24','','','',1120,1272,1200,1292),(14,1,'C14',0,0,42,'','',0,0,'2013-01-24','','','',1119,1272,1020,1111),(15,1,'C15',0,0,42,'','',0,0,'2013-01-24','','','',1120,1271,840,929),(16,1,'C16',0,0,36,'','',0,0,'2013-01-24','','','',1119,1270,748,838),(17,1,'C17',0,0,42,'','',0,0,'2013-01-24','','','',1119,1270,656,748),(18,1,'C18',0,0,42,'','',0,0,'2013-01-24','','','',756,909,838,930),(19,1,'C19',0,0,42,'','',0,0,'2013-01-24','','','',756,909,1065,1157),(20,1,'C21',0,0,42,'','',0,0,'2013-01-24','','','',756,908,1383,1474),(21,1,'C22',0,0,42,'','',0,0,'2013-01-24','','','',573,666,369,521),(22,1,'C23',0,0,42,'','',0,0,'2013-01-24','','','',437,531,368,521),(23,1,'C24',0,0,42,'','',0,0,'2013-01-24','','','',304,394,369,520),(24,1,'C25',0,0,42,'','',0,0,'2013-01-24','','','',212,302,369,522),(25,1,'C26',0,0,42,'','',0,0,'2013-01-24','','','',121,273,883,976),(26,1,'C27',0,0,42,'','',0,0,'2013-01-24','','','',272,425,671,764),(27,1,'C28',0,0,42,'','',0,0,'2013-01-24','','','',332,486,974,1066),(28,3,'C01',0,0,42,'','',0,0,'2013-01-29','','','',0,0,0,0),(29,3,'C02',0,0,42,'','',0,0,'2013-01-29','','','',0,0,0,0),(30,3,'C03',0,0,42,'','',0,0,'2013-01-29','','','',0,0,0,0),(31,3,'c04',0,0,42,'','',0,0,'2013-01-29','','','',0,0,0,0),(32,3,'C05',0,0,42,'','',0,0,'2013-01-29','','','',0,0,0,0),(33,3,'C06',0,0,42,'','',0,0,'2013-01-29','','','',0,0,0,0),(34,3,'C07',0,0,42,'','',0,0,'2013-01-29','','','',0,0,0,0),(35,3,'C08',0,0,42,'','',0,0,'2013-01-29','','','',0,0,0,0),(36,3,'C09',0,0,42,'','',0,0,'2013-01-29','','','',0,0,0,0),(37,3,'C10',0,0,42,'','',0,0,'2013-01-29','','','',0,0,0,0),(38,3,'C11',0,0,42,'','',0,0,'2013-02-02','','','',0,0,0,0),(39,3,'C12',0,0,42,'','',0,0,'2013-02-02','','','',0,0,0,0),(40,3,'C13',0,0,42,'','',0,0,'2013-02-02','','','',0,0,0,0);
/*!40000 ALTER TABLE `fac_Cabinet` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fac_CabinetAudit`
--

DROP TABLE IF EXISTS `fac_CabinetAudit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fac_CabinetAudit` (
  `CabinetID` int(11) NOT NULL,
  `UserID` varchar(80) NOT NULL,
  `AuditStamp` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fac_CabinetAudit`
--

LOCK TABLES `fac_CabinetAudit` WRITE;
/*!40000 ALTER TABLE `fac_CabinetAudit` DISABLE KEYS */;
/*!40000 ALTER TABLE `fac_CabinetAudit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fac_CabinetTemps`
--

DROP TABLE IF EXISTS `fac_CabinetTemps`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fac_CabinetTemps` (
  `CabinetID` int(11) NOT NULL,
  `LastRead` datetime NOT NULL,
  `Temp` int(11) NOT NULL,
  PRIMARY KEY (`CabinetID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fac_CabinetTemps`
--

LOCK TABLES `fac_CabinetTemps` WRITE;
/*!40000 ALTER TABLE `fac_CabinetTemps` DISABLE KEYS */;
/*!40000 ALTER TABLE `fac_CabinetTemps` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fac_Config`
--

DROP TABLE IF EXISTS `fac_Config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fac_Config` (
  `Parameter` varchar(40) NOT NULL,
  `Value` varchar(200) NOT NULL,
  `UnitOfMeasure` varchar(40) NOT NULL,
  `ValType` varchar(40) NOT NULL,
  `DefaultVal` varchar(200) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fac_Config`
--

LOCK TABLES `fac_Config` WRITE;
/*!40000 ALTER TABLE `fac_Config` DISABLE KEYS */;
INSERT INTO `fac_Config` VALUES ('OrgName','MoER','Name','string','openDCIM Computer Facilities'),('ClassList','ITS, Internal, Customer','List','string','ITS, Internal, Customer'),('SpaceRed','80','percentage','float','80'),('SpaceYellow','60','percentage','float','60'),('WeightRed','80','percentage','float','80'),('WeightYellow','60','percentage','float','60'),('PowerRed','80','percentage','float','80'),('PowerYellow','60','percentage','float','60'),('RackWarningHours','4','Hours','integer','4'),('RackOverdueHours','1','Hours','integer','1'),('CriticalColor','#CC0000','HexColor','string','#cc0000'),('CautionColor','#CCCC00','HexColor','string','#cccc00'),('GoodColor','#00AA00','HexColor','string','#0a0'),('DefaultPanelVoltage','208','Volts','int','208'),('annualCostPerUYear','200','Dollars','float','200'),('annualCostPerWattYear','0.7884','Dollars','float','0.7884'),('Locale','en_US.utf8','TextLocale','string','en_US.utf8'),('timezone','Africa/Asmara','string','string','America/Chicago'),('PDFLogoFile','logo.png','Filename','string','logo.png'),('PDFfont','Arial','Font','string','Arial'),('SMTPServer','smtp.your.domain','Server','string','smtp.your.domain'),('SMTPPort','25','Port','int','25'),('SMTPHelo','your.domain','Helo','string','your.domain'),('SMTPUser','','Username','string',''),('SMTPPassword','','Password','string',''),('MailFromAddr','DataCenterTeamAddr@your.domain','Email','string','DataCenterTeamAddr@your.domain'),('MailSubject','ITS Facilities Rack Request','EmailSub','string','ITS Facilities Rack Request'),('MailToAddr','DataCenterTeamAddr@your.domain','Email','string','DataCenterTeamAddr@your.domain'),('ComputerFacMgr','DataCenterMgr Name','Name','string','DataCenterMgr Name'),('FacMgrMail','DataCenterMgr@your.domain','Email','string','DataCenterMgr@your.domain'),('InstallURL','','URL','string','https://dcim.your.domain'),('Version','2.0.1','','',''),('UserLookupURL','https://','URL','string','https://'),('ReservedColor','#00FFFF','HexColor','string','#FFFFFF'),('FreeSpaceColor','#FFFFFF','HexColor','string','#FFFFFF'),('HeaderColor','#006633','HexColor','string','#006633'),('BodyColor','#F0E0B2','HexColor','string','#F0E0B2'),('LinkColor','#000000','HexColor','string','#000000'),('VisitedLinkColor','#8D90B3','HexColor','string','#8D90B3'),('LabelCase','','string','string','upper'),('mDate','blank','string','string','blank'),('wDate','blank','string','string','blank'),('NewInstallsPeriod','','Days','int','7'),('VMExpirationTime','7','Days','int','7');
/*!40000 ALTER TABLE `fac_Config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fac_Contact`
--

DROP TABLE IF EXISTS `fac_Contact`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fac_Contact` (
  `ContactID` int(11) NOT NULL AUTO_INCREMENT,
  `UserID` varchar(80) NOT NULL,
  `LastName` varchar(40) NOT NULL,
  `FirstName` varchar(40) NOT NULL,
  `Phone1` varchar(20) NOT NULL,
  `Phone2` varchar(20) NOT NULL,
  `Phone3` varchar(20) NOT NULL,
  `Email` varchar(80) NOT NULL,
  PRIMARY KEY (`ContactID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fac_Contact`
--

LOCK TABLES `fac_Contact` WRITE;
/*!40000 ALTER TABLE `fac_Contact` DISABLE KEYS */;
/*!40000 ALTER TABLE `fac_Contact` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fac_DataCenter`
--

DROP TABLE IF EXISTS `fac_DataCenter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fac_DataCenter` (
  `DataCenterID` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(255) NOT NULL,
  `SquareFootage` int(11) NOT NULL,
  `DeliveryAddress` varchar(255) NOT NULL,
  `Administrator` varchar(80) NOT NULL,
  `MaxkW` int(11) NOT NULL,
  `DrawingFileName` varchar(255) NOT NULL,
  `EntryLogging` tinyint(1) NOT NULL,
  PRIMARY KEY (`DataCenterID`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fac_DataCenter`
--

LOCK TABLES `fac_DataCenter` WRITE;
/*!40000 ALTER TABLE `fac_DataCenter` DISABLE KEYS */;
INSERT INTO `fac_DataCenter` VALUES (1,'Main Data Center',1218,'Municipality of the Eastern Region Main Campus','Ahmed AlOtaibi',0,'FloorPlan1.jpg',0),(2,'',0,'','',0,'',0),(3,'Redundant Data Center',0,'','Ahmed AlOtaibi',0,'',0);
/*!40000 ALTER TABLE `fac_DataCenter` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fac_Decommission`
--

DROP TABLE IF EXISTS `fac_Decommission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fac_Decommission` (
  `SurplusDate` date NOT NULL,
  `Label` varchar(80) NOT NULL,
  `SerialNo` varchar(40) NOT NULL,
  `AssetTag` varchar(20) NOT NULL,
  `UserID` varchar(80) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fac_Decommission`
--

LOCK TABLES `fac_Decommission` WRITE;
/*!40000 ALTER TABLE `fac_Decommission` DISABLE KEYS */;
/*!40000 ALTER TABLE `fac_Decommission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fac_Department`
--

DROP TABLE IF EXISTS `fac_Department`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fac_Department` (
  `DeptID` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(255) NOT NULL,
  `ExecSponsor` varchar(80) NOT NULL,
  `SDM` varchar(80) NOT NULL,
  `Classification` varchar(80) NOT NULL,
  `DeptColor` varchar(7) NOT NULL DEFAULT '#FFFFFF',
  PRIMARY KEY (`DeptID`),
  UNIQUE KEY `Name` (`Name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fac_Department`
--

LOCK TABLES `fac_Department` WRITE;
/*!40000 ALTER TABLE `fac_Department` DISABLE KEYS */;
/*!40000 ALTER TABLE `fac_Department` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fac_DeptContacts`
--

DROP TABLE IF EXISTS `fac_DeptContacts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fac_DeptContacts` (
  `DeptID` int(11) NOT NULL,
  `ContactID` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fac_DeptContacts`
--

LOCK TABLES `fac_DeptContacts` WRITE;
/*!40000 ALTER TABLE `fac_DeptContacts` DISABLE KEYS */;
/*!40000 ALTER TABLE `fac_DeptContacts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fac_Device`
--

DROP TABLE IF EXISTS `fac_Device`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fac_Device` (
  `DeviceID` int(11) NOT NULL AUTO_INCREMENT,
  `Label` varchar(80) NOT NULL,
  `SerialNo` varchar(40) NOT NULL,
  `AssetTag` varchar(20) NOT NULL,
  `PrimaryIP` varchar(20) NOT NULL,
  `SNMPCommunity` varchar(80) NOT NULL,
  `ESX` tinyint(1) NOT NULL,
  `Owner` int(11) NOT NULL,
  `EscalationTimeID` int(11) NOT NULL,
  `EscalationID` int(11) NOT NULL,
  `PrimaryContact` int(11) NOT NULL,
  `Cabinet` int(11) NOT NULL,
  `Position` int(11) NOT NULL,
  `Height` int(11) NOT NULL,
  `Ports` int(11) NOT NULL,
  `TemplateID` int(11) NOT NULL,
  `NominalWatts` int(11) NOT NULL,
  `PowerSupplyCount` int(11) NOT NULL,
  `DeviceType` enum('Server','Appliance','Storage Array','Switch','Chassis','Patch Panel','Physical Infrastructure') NOT NULL,
  `ChassisSlots` smallint(6) NOT NULL,
  `RearChassisSlots` smallint(6) NOT NULL,
  `ParentDevice` int(11) NOT NULL,
  `MfgDate` date NOT NULL,
  `InstallDate` date NOT NULL,
  `WarrantyCo` varchar(80) NOT NULL,
  `WarrantyExpire` date DEFAULT NULL,
  `Notes` text,
  `Reservation` tinyint(1) NOT NULL,
  PRIMARY KEY (`DeviceID`),
  KEY `SerialNo` (`SerialNo`,`AssetTag`,`PrimaryIP`)
) ENGINE=MyISAM AUTO_INCREMENT=137 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fac_Device`
--

LOCK TABLES `fac_Device` WRITE;
/*!40000 ALTER TABLE `fac_Device` DISABLE KEYS */;
INSERT INTO `fac_Device` VALUES (1,'HP Blade c7000','','','','',0,0,0,0,0,1,4,10,27,1,2872,6,'Chassis',16,0,0,'1970-01-01','2013-01-23','','1970-01-01','',0),(2,'EMC CX4 1','','','','',0,0,0,0,0,2,4,10,0,2,2000,2,'Chassis',0,0,0,'1970-01-01','2013-01-23','','1970-01-01','',0),(3,'HP Proliant DL580','','','','',0,0,0,0,0,3,16,4,2,3,0,2,'Server',0,0,0,'1970-01-01','2013-01-23','','1970-01-01','',0),(4,'HP Proliant DL580 (2)','','','','',0,0,0,0,0,3,20,4,2,3,0,2,'Server',0,0,0,'1970-01-01','2013-01-23','','1970-01-01','',0),(5,'QualysGuard','','','','',0,0,0,0,0,4,31,2,2,4,800,1,'Appliance',0,0,0,'1970-01-01','2013-01-23','','1970-01-01','',0),(6,'CISCO Catalyst 3750 (1)','','','','',0,0,0,0,0,4,35,2,24,7,0,1,'Switch',0,0,0,'1970-01-01','2013-01-23','','1970-01-01','',0),(7,'CISCO 3800 (2)','','','','',0,0,0,0,0,4,27,4,6,5,500,1,'Switch',0,0,0,'1970-01-01','2013-01-23','','1970-01-01','',0),(8,'CISCO 3800 (1)','','','','',0,0,0,0,0,4,23,4,6,5,0,1,'Switch',0,0,0,'1970-01-01','2013-01-23','','1970-01-01','',0),(9,'CISCO ASA 5540 (1)','','','','',0,0,0,0,0,4,19,4,6,6,0,1,'Appliance',0,0,0,'1970-01-01','2013-01-23','','1970-01-01','',0),(10,'CISCO ASA 5540 (2)','','','','',0,0,0,0,0,4,15,4,6,6,0,1,'Appliance',0,0,0,'1970-01-01','2013-01-23','','1970-01-01','',0),(11,'CISCO ASA 5525X','','','','',0,0,0,0,0,4,11,4,6,6,0,1,'Appliance',0,0,0,'1970-01-01','2013-01-23','','1970-01-01','',0),(12,'RiverBed StealHead ','','','','',0,0,0,0,0,4,33,2,2,4,0,1,'Appliance',0,0,0,'1970-01-01','2013-01-23','','1970-01-01','',0),(13,'CISCO Catalyst 3500 (1)','','','','',0,0,0,0,0,5,37,2,24,7,0,1,'Switch',0,0,0,'1970-01-01','2013-01-23','','1970-01-01','',0),(14,'CISCO Catalyst 3500 (2)','','','','',0,0,0,0,0,5,35,2,24,7,0,1,'Switch',0,0,0,'1970-01-01','2013-01-23','','1970-01-01','',0),(15,'CISCO Catalyst 3500 (3)','','','','',0,0,0,0,0,5,33,2,24,7,0,1,'Switch',0,0,0,'1970-01-01','2013-01-23','','1970-01-01','',0),(16,'CISCO Catalyst 2950','','','','',0,0,0,0,0,5,31,2,24,7,0,1,'Switch',0,0,0,'1970-01-01','2013-01-23','','1970-01-01','',0),(17,'CISCO 1800','','','','',0,0,0,0,0,6,37,4,6,5,0,1,'Switch',0,0,0,'1970-01-01','2013-01-23','','1970-01-01','',0),(18,'PaloAlto PA-2050','','','','',0,0,0,0,0,6,35,2,2,4,0,1,'Appliance',0,0,0,'1970-01-01','2013-01-23','','1970-01-01','',0),(19,'CISCO Catalyst Core Switch ws-c6509-E (1)','','','','',0,0,0,0,0,6,31,10,0,7,0,2,'Switch',0,0,0,'1970-01-01','2013-01-23','','1970-01-01','',0),(20,'CISCO Core Switch ws-c6509-E (2)','','','','',0,0,0,0,0,7,6,10,24,7,0,1,'Switch',0,0,0,'1970-01-01','2013-01-23','','1970-01-01','',0),(21,'HP Proliant DL380 G5 (1)','','','','',0,0,0,0,0,8,8,4,2,3,500,2,'Server',0,0,0,'1970-01-01','2013-01-23','','1970-01-01','',0),(22,'HP Proliant DL380 G5 (2)','','','','',0,0,0,0,0,8,12,4,2,3,0,2,'Server',0,0,0,'1970-01-01','2013-01-24','','1970-01-01','',0),(23,'IBM System x3650 M2','','','','',0,0,0,0,0,8,18,1,0,22,0,0,'Server',0,0,0,'1970-01-01','2013-01-24','','1970-01-01','',0),(24,'ARUBA Wireless Controller 5004','','','','',0,0,0,0,0,9,33,4,12,8,0,2,'Appliance',0,0,0,'1970-01-01','2013-01-24','','1970-01-01','',0),(25,'ARUBA 3400 (1)','','','','',0,0,0,0,0,9,31,2,8,9,0,1,'Appliance',0,0,0,'1970-01-01','2013-01-24','','1970-01-01','',0),(26,'ARUBA 3400 (2)','','','','',0,0,0,0,0,9,29,2,8,9,0,1,'Appliance',0,0,0,'1970-01-01','2013-01-24','','1970-01-01','',0),(27,'HP Proliant DL380 (1)','','','','',0,0,0,0,0,9,25,4,2,3,0,2,'Server',0,0,0,'1970-01-01','2013-01-24','','1970-01-01','',0),(28,'HP Proliant DL380 (2)','','','','',0,0,0,0,0,9,20,4,2,3,0,2,'Server',0,0,0,'1970-01-01','2013-01-24','','1970-01-01','',0),(29,'HP StorageWorks 1000','','','','',0,0,0,0,0,9,16,4,0,10,0,2,'Server',0,0,0,'1970-01-01','2013-01-24','','1970-01-01','',0),(30,'JUNIPER J2350 (1)','','','','',0,0,0,0,0,10,33,2,0,11,0,1,'Appliance',0,0,0,'1970-01-01','2013-01-24','','1970-01-01','',0),(31,'JUNIPER J2350 (2)','','','','',0,0,0,0,0,10,31,2,0,11,0,1,'Appliance',0,0,0,'1970-01-01','2013-01-24','','1970-01-01','',0),(32,'JUNIPER SSG350M (1)','','','','',0,0,0,0,0,10,27,2,0,12,0,0,'Appliance',0,0,0,'1970-01-01','2013-01-24','','1970-01-01','',0),(33,'JUNIPER SSG350M (2)','','','','',0,0,0,0,0,10,25,2,0,12,0,0,'Appliance',0,0,0,'1970-01-01','2013-01-24','','1970-01-01','',0),(34,'JUNIPER EX4200 (1)','','','','',0,0,0,0,0,10,29,1,0,13,600,0,'Switch',0,0,0,'1970-01-01','2013-01-24','','1970-01-01','',0),(35,'JUNIPER EX4200 (2)','','','','',0,0,0,0,0,10,30,1,0,13,0,0,'Switch',0,0,0,'1970-01-01','2013-01-24','','1970-01-01','',0),(36,'Cisco CSS 11500 SCS Switche (1)','','','','',0,0,0,0,0,11,34,1,0,14,0,0,'Switch',0,0,0,'1970-01-01','2013-01-24','','1970-01-01','',0),(37,'Cisco CSS 11500 SCS Switche (2)','','','','',0,0,0,0,0,11,28,4,0,14,0,0,'Switch',0,0,0,'1970-01-01','2013-01-24','','1970-01-01','',0),(38,'HP Blade c7000','','','','',0,0,0,0,0,11,9,10,27,1,0,6,'Chassis',0,0,0,'1970-01-01','2013-01-24','','1970-01-01','',0),(39,'IBM x255 (1)','','','','',0,0,0,0,0,12,26,2,0,15,0,0,'Server',0,0,0,'1970-01-01','2013-01-24','','1970-01-01','',0),(40,'IBM x255 (2)','','','','',0,0,0,0,0,12,23,2,0,15,0,0,'Server',0,0,0,'1970-01-01','2013-01-24','','1970-01-01','',0),(41,'HP Proliant DL380 G7 (1)','','','','',0,0,0,0,0,13,29,4,2,3,0,2,'Server',0,0,0,'1970-01-01','2013-01-24','','1970-01-01','',0),(42,'HP Proliant DL380 G7 (2)','','','','',0,0,0,0,0,13,25,4,2,3,0,2,'Server',0,0,0,'1970-01-01','2013-01-24','','1970-01-01','',0),(43,'HP Proliant DL380 G7 (3)','','','','',0,0,0,0,0,13,21,4,2,3,0,2,'Server',0,0,0,'1970-01-01','2013-01-24','','1970-01-01','',0),(44,'CISCO 1121 SACS','','','','',0,0,0,0,0,14,33,2,0,16,0,0,'Appliance',0,0,0,'1970-01-01','2013-01-24','','1970-01-01','',0),(45,'CISCO 3315 SISE','','','','',0,0,0,0,0,14,32,1,0,17,0,0,'Appliance',0,0,0,'1970-01-01','2013-01-24','','1970-01-01','',0),(46,'CISCO ISE 3395','','','','',0,0,0,0,0,14,31,1,0,18,0,0,'Appliance',0,0,0,'1970-01-01','2013-01-24','','1970-01-01','',0),(47,'AirTight Networks Spectraguard (1)','','','','',0,0,0,0,0,14,29,2,2,4,0,1,'Appliance',0,0,0,'1970-01-01','2013-01-24','','1970-01-01','',0),(48,'AirTight Networks Spectraguard (2)','','','','',0,0,0,0,0,14,27,2,2,4,0,1,'Appliance',0,0,0,'1970-01-01','2013-01-24','','1970-01-01','',0),(49,'HP Proliant DL380 G7 (1)','','','','',0,0,0,0,0,14,23,4,2,3,0,2,'Server',0,0,0,'1970-01-01','2013-01-24','','1970-01-01','',0),(50,'HP Proliant DL380 G7 (2)','','','','',0,0,0,0,0,14,19,4,2,3,0,2,'Server',0,0,0,'1970-01-01','2013-01-24','','1970-01-01','',0),(51,'HP Proliant DL380 G7 (3)','','','','',0,0,0,0,0,14,15,4,2,3,0,2,'Server',0,0,0,'1970-01-01','2013-01-24','','1970-01-01','',0),(52,'CISCO MARS-20','','','','',0,0,0,0,0,15,36,1,0,19,0,0,'Server',0,0,0,'1970-01-01','2013-01-24','','1970-01-01','',0),(53,'CISCO IPS 4255 (1)','','','','',0,0,0,0,0,15,35,1,0,20,0,0,'Appliance',0,0,0,'1970-01-01','2013-01-24','','1970-01-01','',0),(54,'CISCO IPS 4255 (2)','','','','',0,0,0,0,0,15,34,1,0,20,0,0,'Appliance',0,0,0,'1970-01-01','2013-01-24','','1970-01-01','',0),(55,'TopLayer IDS Balancer','','','','',0,0,0,0,0,15,32,2,2,4,0,1,'Appliance',0,0,0,'1970-01-01','2013-01-24','','1970-01-01','',0),(56,'DELL PowerEdge 1800 (1)','','','','',0,0,0,0,0,15,22,4,2,3,0,2,'Server',0,0,0,'1970-01-01','2013-01-24','','1970-01-01','',0),(57,'DELL PowerEdge 1800 (2)','','','','',0,0,0,0,0,15,26,4,2,3,0,2,'Server',0,0,0,'1970-01-01','2013-01-24','','1970-01-01','',0),(58,'IBM System i5','','','','',0,0,0,0,0,16,16,10,0,21,0,0,'Server',0,0,0,'1970-01-01','2013-01-24','','1970-01-01','',0),(59,'IBM System x3550','','','','',0,0,0,0,0,16,26,1,0,22,0,0,'Server',0,0,0,'1970-01-01','2013-01-24','','1970-01-01','',0),(60,'IronPort C360 (1)','','','','',0,0,0,0,0,17,35,2,2,4,0,1,'Appliance',0,0,0,'1970-01-01','2013-01-24','','1970-01-01','',0),(61,'IronPort C360 (2)','','','','',0,0,0,0,0,17,33,2,2,4,0,1,'Appliance',0,0,0,'1970-01-01','2013-01-24','','1970-01-01','',0),(62,'HP StorageWorks 1000','','','','',0,0,0,0,0,17,29,4,0,10,0,2,'Server',0,0,0,'1970-01-01','2013-01-24','','1970-01-01','',0),(63,'CISCO IPS 4255','','','','',0,0,0,0,0,17,28,1,0,20,0,0,'Appliance',0,0,0,'1970-01-01','2013-01-24','','1970-01-01','',0),(64,'HP Proliant DL380 (1)','','','','',0,0,0,0,0,17,24,4,2,3,0,2,'Server',0,0,0,'1970-01-01','2013-01-24','','1970-01-01','',0),(65,'HP Proliant DL380 (2)','','','','',0,0,0,0,0,17,20,4,2,3,0,2,'Server',0,0,0,'1970-01-01','2013-01-24','','1970-01-01','',0),(66,'HP Proliant DL380 G5 (1)','','','','',0,0,0,0,0,17,16,4,2,3,0,2,'Server',0,0,0,'1970-01-01','2013-01-24','','1970-01-01','',0),(67,'HP Proliant DL380 G5 (2)','','','','',0,0,0,0,0,17,12,4,2,3,0,2,'Server',0,0,0,'1970-01-01','2013-01-24','','1970-01-01','',0),(68,'IBM xSeries 360 (1)','','','','',0,0,0,0,0,18,12,4,2,3,0,2,'Server',0,0,0,'1970-01-01','2013-01-24','','1970-01-01','',0),(69,'IBM xSeries 360 (2)','','','','',0,0,0,0,0,18,16,4,2,3,0,2,'Server',0,0,0,'1970-01-01','2013-01-24','','1970-01-01','',0),(70,'HP Proliant DL380 G7 (1)','','','','',0,0,0,0,0,19,7,4,2,3,0,2,'Server',0,0,0,'1970-01-01','2013-01-24','','1970-01-01','',0),(71,'HP Proliant DL380 G7 (2)','','','','',0,0,0,0,0,19,11,4,2,3,0,2,'Server',0,0,0,'1970-01-01','2013-01-24','','1970-01-01','',0),(72,'HP Proliant DL380 G7 (3)','','','','',0,0,0,0,0,19,15,4,2,3,0,2,'Server',0,0,0,'1970-01-01','2013-01-24','','1970-01-01','',0),(73,'HP Proliant DL380 G7 (4)','','','','',0,0,0,0,0,19,19,4,2,3,0,2,'Server',0,0,0,'1970-01-01','2013-01-24','','1970-01-01','',0),(74,'CISCO PIX 523 (1)','','','','',0,0,0,0,0,20,34,2,2,4,800,1,'Appliance',0,0,0,'1970-01-01','2013-01-24','','1970-01-01','',0),(75,'CISCO PIX 523 (2)','','','','',0,0,0,0,0,20,32,2,2,4,0,1,'Appliance',0,0,0,'1970-01-01','2013-01-24','','1970-01-01','',0),(76,'CISCO Catalyst 3750 (1)','','','','',0,0,0,0,0,20,30,2,24,7,0,1,'Switch',0,0,0,'1970-01-01','2013-01-24','','1970-01-01','',0),(77,'CISCO Catalyst 3750 (2)','','','','',0,0,0,0,0,20,28,2,24,7,0,1,'Switch',0,0,0,'1970-01-01','2013-01-24','','1970-01-01','',0),(78,'CISCO Catalyst 3750 (3)','','','','',0,0,0,0,0,20,26,2,24,7,0,1,'Switch',0,0,0,'1970-01-01','2013-01-24','','1970-01-01','',0),(79,'CISCO 1113 SACS','','','','',0,0,0,0,0,20,24,2,2,4,0,1,'Appliance',0,0,0,'1970-01-01','2013-01-24','','1970-01-01','',0),(80,'IBM xSeries 360 (1)','','','','',0,0,0,0,0,20,20,4,2,3,0,2,'Server',0,0,0,'1970-01-01','2013-01-24','','1970-01-01','',0),(81,'IBM xSeries 360 (2)','','','','',0,0,0,0,0,20,16,4,2,3,0,2,'Server',0,0,0,'1970-01-01','2013-01-24','','1970-01-01','',0),(82,'HP Proliant ML370 G5 (1)','','','','',0,0,0,0,0,21,32,4,2,3,0,2,'Server',0,0,0,'1970-01-01','2013-01-24','','1970-01-01','',0),(83,'HP Proliant ML370 G5 (2)','','','','',0,0,0,0,0,21,28,4,2,3,0,2,'Server',0,0,0,'1970-01-01','2013-01-24','','1970-01-01','',0),(84,'HP Proliant DL380 G5','','','','',0,0,0,0,0,21,24,4,2,3,0,2,'Server',0,0,0,'1970-01-01','2013-01-24','','1970-01-01','',0),(85,'DELL PowerEdge 6850 (1)','','','','',0,0,0,0,0,22,14,4,2,3,0,2,'Server',0,0,0,'1970-01-01','2013-01-24','','1970-01-01','',0),(86,'DELL PowerEdge 6850 (2)','','','','',0,0,0,0,0,22,18,4,2,3,0,2,'Server',0,0,0,'1970-01-01','2013-01-24','','1970-01-01','',0),(87,'DELL PowerEdge 6850 (3)','','','','',0,0,0,0,0,22,22,4,2,3,0,2,'Server',0,0,0,'1970-01-01','2013-01-24','','1970-01-01','',0),(88,'HP Proliant ML370','','','','',0,0,0,0,0,23,25,4,2,3,0,2,'Server',0,0,0,'1970-01-01','2013-01-24','','1970-01-01','',0),(89,'CISCO ME3400','','','','',0,0,0,0,0,24,34,2,24,7,0,1,'Switch',0,0,0,'1970-01-01','2013-01-24','','1970-01-01','',0),(90,'CISCO 3800','','','','',0,0,0,0,0,24,30,4,6,5,0,1,'Switch',0,0,0,'1970-01-01','2013-01-24','','1970-01-01','',0),(91,'COMPAQ Proliant (1)','','','','',0,0,0,0,0,25,26,4,2,3,0,2,'Server',0,0,0,'1970-01-01','2013-01-24','','1970-01-01','',0),(92,'COMPAQ Proliant (2)','','','','',0,0,0,0,0,25,22,4,2,3,0,2,'Server',0,0,0,'1970-01-01','2013-01-24','','1970-01-01','',0),(93,'DELL PowerEdge 2950 (1)','','','','',0,0,0,0,0,26,35,4,2,3,0,2,'Server',0,0,0,'1970-01-01','2013-01-24','','1970-01-01','',0),(94,'DELL PowerEdge 2950 (2)','','','','',0,0,0,0,0,26,31,4,2,3,0,2,'Server',0,0,0,'1970-01-01','2013-01-24','','1970-01-01','',0),(95,'DELL PowerEdge 2950 (3)','','','','',0,0,0,0,0,26,27,4,2,3,0,2,'Server',0,0,0,'1970-01-01','2013-01-24','','1970-01-01','',0),(96,'CISCO 1900','','','','',0,0,0,0,0,27,34,4,6,5,0,1,'Switch',0,0,0,'1970-01-01','2013-01-24','','1970-01-01','',0),(97,'HP Proliant DL380 G7 (1)','','','','',0,0,0,0,0,27,28,4,2,3,0,2,'Server',0,0,0,'1970-01-01','2013-01-24','','1970-01-01','',0),(98,'HP Proliant DL380 G7 (2)','','','','',0,0,0,0,0,27,24,4,2,3,0,2,'Server',0,0,0,'1970-01-01','2013-01-24','','1970-01-01','',0),(99,'HP Proliant DL380 G7 (3)','','','','',0,0,0,0,0,27,20,4,2,3,0,2,'Server',0,0,0,'1970-01-01','2013-01-24','','1970-01-01','',0),(100,'CISCO Catalyst 3750G','','','','',0,0,0,0,0,28,34,2,24,7,0,1,'Switch',0,0,0,'1970-01-01','2013-01-29','','1970-01-01','',0),(101,'JUNIPER ISG1000','','','','',0,0,0,0,0,28,0,4,6,5,0,1,'Switch',0,0,0,'1970-01-01','2013-01-29','','1970-01-01','',0),(102,'CITRIX NetScalar PMX','','','','',0,0,0,0,0,28,27,2,2,4,0,1,'Appliance',0,0,0,'1970-01-01','2013-01-29','','1970-01-01','',0),(103,'EMC CX4','','','','',0,0,0,0,0,29,0,10,0,2,0,2,'Chassis',0,0,0,'1970-01-01','2013-01-29','','1970-01-01','',0),(104,'JUNIPER EX3200 (1)','','','','',0,0,0,0,0,30,38,1,0,13,0,0,'Switch',0,0,0,'1970-01-01','2013-01-29','','1970-01-01','',0),(105,'JUNIPER EX3200 (2)','','','','',0,0,0,0,0,30,37,1,0,13,0,0,'Switch',0,0,0,'1970-01-01','2013-01-29','','1970-01-01','',0),(106,'JUNIPER J2320 (1)','','','','',0,0,0,0,0,30,0,2,0,11,0,1,'Appliance',0,0,0,'1970-01-01','2013-01-29','','1970-01-01','',0),(107,'JUNIPER J2320 (2)','','','','',0,0,0,0,0,30,0,2,0,11,0,1,'Appliance',0,0,0,'1970-01-01','2013-01-29','','1970-01-01','',0),(108,'JUNIPER ISG1000 (1)','','','','',0,0,0,0,0,30,32,4,6,5,0,1,'Switch',0,0,0,'1970-01-01','2013-01-29','','1970-01-01','',0),(109,'JUNIPER ISG1000 (2)','','','','',0,0,0,0,0,30,28,4,6,5,0,1,'Switch',0,0,0,'1970-01-01','2013-01-29','','1970-01-01','',0),(110,'JUNIPER NSMXPRESS','','','','',0,0,0,0,0,30,0,2,2,4,0,1,'Appliance',0,0,0,'1970-01-01','2013-01-29','','1970-01-01','',0),(111,'CISCO 2900','','','','',0,0,0,0,0,30,23,4,6,5,0,1,'Switch',0,0,0,'1970-01-01','2013-01-29','','1970-01-01','',0),(112,'ARBOR Pravail APS2100','','','','',0,0,0,0,0,30,19,2,2,4,0,1,'Appliance',0,0,0,'1970-01-01','2013-01-29','','1970-01-01','',0),(113,'HP Blade c7000','','','','',0,0,0,0,0,31,5,10,27,1,0,6,'Chassis',0,0,0,'1970-01-01','2013-01-29','','1970-01-01','',0),(114,'IBM System x3650 M3 (1)','','','','',0,0,0,0,0,32,8,4,2,3,0,2,'Server',0,0,0,'1970-01-01','2013-01-29','','1970-01-01','',0),(115,'IBM System x3650 M3 (2)','','','','',0,0,0,0,0,32,13,4,2,3,0,2,'Server',0,0,0,'1970-01-01','2013-01-29','','1970-01-01','',0),(116,'HP Proliant DL580 G5 (1)','','','','',0,0,0,0,0,32,19,4,2,3,0,2,'Server',0,0,0,'1970-01-01','2013-01-29','','1970-01-01','',0),(117,'HP Proliant DL580 G5 (2)','','','','',0,0,0,0,0,32,24,4,2,3,0,2,'Server',0,0,0,'1970-01-01','2013-01-29','','1970-01-01','',0),(118,'IBM BladeCenter E','','','','',0,0,0,0,0,33,9,10,0,23,0,4,'Chassis',0,0,0,'1970-01-01','2013-01-29','','1970-01-01','',0),(119,'SUN SunFire V890 (1)','','','','',0,0,0,0,0,34,10,4,0,24,0,0,'Server',0,0,0,'1970-01-01','2013-01-29','','1970-01-01','',0),(120,'SUN SunFire V890 (2)','','','','',0,0,0,0,0,34,15,4,0,24,0,0,'Server',0,0,0,'1970-01-01','2013-01-29','','1970-01-01','',0),(121,'SUN SunFire V890 (1)','','','','',0,0,0,0,0,35,7,4,0,24,0,0,'Server',0,0,0,'1970-01-01','2013-01-29','','1970-01-01','',0),(122,'SUN SunFire V890 (2)','','','','',0,0,0,0,0,35,12,4,0,24,0,0,'Server',0,0,0,'1970-01-01','2013-01-29','','1970-01-01','',0),(123,'IBM BladeCenter E (1)','','','','',0,0,0,0,0,36,3,10,0,23,0,4,'Chassis',0,0,0,'1970-01-01','2013-01-29','','1970-01-01','',0),(124,'IBM BladeCenter E (2)','','','','',0,0,0,0,0,36,18,10,0,23,0,4,'Chassis',0,0,0,'1970-01-01','2013-01-29','','1970-01-01','',0),(125,'SUN N2120 Switch (1)','','','','',0,0,0,0,0,37,36,2,24,7,0,1,'Switch',0,0,0,'1970-01-01','2013-02-02','','1970-01-01','',0),(126,'SUN N2120 Switch (2)','','','','',0,0,0,0,0,37,33,2,24,7,0,1,'Switch',0,0,0,'1970-01-01','2013-02-02','','1970-01-01','',0),(127,'SUN StoeEdge 3500','','','','',0,0,0,0,0,37,27,4,0,10,0,2,'Server',0,0,0,'1970-01-01','2013-02-02','','1970-01-01','',0),(128,'SUN SunFire V890','','','','',0,0,0,0,0,37,22,4,0,24,0,0,'Server',0,0,0,'1970-01-01','2013-02-02','','1970-01-01','',0),(129,'SUN SunFire V890 (1)','','','','',0,0,0,0,0,38,35,4,0,24,0,0,'Server',0,0,0,'1970-01-01','2013-02-02','','1970-01-01','',0),(130,'SUN SunFire V890 (2)','','','','',0,0,0,0,0,38,29,4,0,24,0,0,'Server',0,0,0,'1970-01-01','2013-02-02','','1970-01-01','',0),(131,'SUN SunFire V890 (1)','','','','',0,0,0,0,0,39,17,4,0,24,0,0,'Server',0,0,0,'1970-01-01','2013-02-02','','1970-01-01','',0),(132,'SUN SunFire V890 (2)','','','','',0,0,0,0,0,39,24,4,0,24,0,0,'Server',0,0,0,'1970-01-01','2013-02-02','','1970-01-01','',0),(133,'CISCO Catalyst 4507R-E','','','','',0,0,0,0,0,40,9,6,0,0,3000,2,'Server',0,0,0,'1970-01-01','2013-02-02','','1970-01-01','',0),(134,'CISCO 2900','','','','',0,0,0,0,0,40,32,4,6,5,0,1,'Switch',0,0,0,'1970-01-01','2013-02-02','','1970-01-01','',0),(135,'EverFocus EDVR16D2','','','','',0,0,0,0,0,40,17,2,2,4,0,1,'Appliance',0,0,0,'1970-01-01','2013-02-02','','1970-01-01','',0),(136,'SensorProp8-X20','','','','',0,0,0,0,0,40,15,2,2,4,0,1,'Appliance',0,0,0,'1970-01-01','2013-02-02','','1970-01-01','',0);
/*!40000 ALTER TABLE `fac_Device` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fac_DeviceTags`
--

DROP TABLE IF EXISTS `fac_DeviceTags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fac_DeviceTags` (
  `DeviceID` int(11) NOT NULL,
  `TagID` int(11) NOT NULL,
  PRIMARY KEY (`DeviceID`,`TagID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fac_DeviceTags`
--

LOCK TABLES `fac_DeviceTags` WRITE;
/*!40000 ALTER TABLE `fac_DeviceTags` DISABLE KEYS */;
/*!40000 ALTER TABLE `fac_DeviceTags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fac_DeviceTemplate`
--

DROP TABLE IF EXISTS `fac_DeviceTemplate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fac_DeviceTemplate` (
  `TemplateID` int(11) NOT NULL AUTO_INCREMENT,
  `ManufacturerID` int(11) NOT NULL,
  `Model` varchar(80) NOT NULL,
  `Height` int(11) NOT NULL,
  `Weight` int(11) NOT NULL,
  `Wattage` int(11) NOT NULL,
  `DeviceType` enum('Server','Appliance','Storage Array','Switch','Chassis','Patch Panel','Physical Infrastructure') NOT NULL DEFAULT 'Server',
  `PSCount` int(11) NOT NULL,
  `NumPorts` int(11) NOT NULL,
  PRIMARY KEY (`TemplateID`),
  KEY `ManufacturerID` (`ManufacturerID`)
) ENGINE=MyISAM AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fac_DeviceTemplate`
--

LOCK TABLES `fac_DeviceTemplate` WRITE;
/*!40000 ALTER TABLE `fac_DeviceTemplate` DISABLE KEYS */;
INSERT INTO `fac_DeviceTemplate` VALUES (1,1,'HP c7000',10,340,2872,'Chassis',6,27),(2,1,'EMC CX4',10,0,2000,'Chassis',2,0),(3,1,'HP Proliant',4,0,500,'Server',2,2),(4,1,'Security Appliance',2,0,800,'Appliance',1,2),(5,1,'CISCO Router',4,0,500,'Switch',1,6),(6,1,'CISCO ASA',4,0,500,'Appliance',1,6),(7,1,'CISCO Catalyst Switch',2,0,500,'Switch',1,24),(8,1,'ARUBA Wireless Controller 5004',4,0,400,'Appliance',2,12),(9,1,'ARUBA Wireless Controller 3400',2,0,35,'Appliance',1,8),(10,1,'HP StorageWorks 1000',4,0,550,'Server',2,0),(11,1,'JUNIPER Router J2350',2,0,30,'Appliance',1,0),(12,1,'JUNIPER SSG 350 M',2,0,300,'Appliance',0,0),(13,1,'GUNIPER EX4200 Switch',1,0,600,'Switch',0,0),(14,1,'Cisco CSS11506',0,5,800,'Switch',0,0),(15,1,'IBM X225',2,0,400,'Server',0,0),(16,1,'Cisco Secure Access Control Server 1121',2,0,400,'Appliance',0,0),(17,1,'Cisco NAC Appliance 3315',1,0,350,'Appliance',0,0),(18,1,'Cisco Identity Services Engine Appliance 3395 ',1,0,600,'Appliance',0,0),(19,1,'CISCO MARS-20',1,0,300,'Server',0,0),(20,1,'cisco ips 4255',1,0,500,'Appliance',0,0),(21,1,'IBM System i5',10,0,650,'Server',0,0),(22,1,'IBM System x3350',1,0,300,'Server',0,0),(23,1,'IBM BladeCenter E',10,0,2500,'Chassis',4,0),(24,1,'SUN sunFire ',4,0,2100,'Server',0,0);
/*!40000 ALTER TABLE `fac_DeviceTemplate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fac_EscalationTimes`
--

DROP TABLE IF EXISTS `fac_EscalationTimes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fac_EscalationTimes` (
  `EscalationTimeID` int(11) NOT NULL AUTO_INCREMENT,
  `TimePeriod` varchar(80) NOT NULL,
  PRIMARY KEY (`EscalationTimeID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fac_EscalationTimes`
--

LOCK TABLES `fac_EscalationTimes` WRITE;
/*!40000 ALTER TABLE `fac_EscalationTimes` DISABLE KEYS */;
/*!40000 ALTER TABLE `fac_EscalationTimes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fac_Escalations`
--

DROP TABLE IF EXISTS `fac_Escalations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fac_Escalations` (
  `EscalationID` int(11) NOT NULL AUTO_INCREMENT,
  `Details` varchar(80) DEFAULT NULL,
  PRIMARY KEY (`EscalationID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fac_Escalations`
--

LOCK TABLES `fac_Escalations` WRITE;
/*!40000 ALTER TABLE `fac_Escalations` DISABLE KEYS */;
/*!40000 ALTER TABLE `fac_Escalations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fac_Manufacturer`
--

DROP TABLE IF EXISTS `fac_Manufacturer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fac_Manufacturer` (
  `ManufacturerID` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(80) NOT NULL,
  PRIMARY KEY (`ManufacturerID`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fac_Manufacturer`
--

LOCK TABLES `fac_Manufacturer` WRITE;
/*!40000 ALTER TABLE `fac_Manufacturer` DISABLE KEYS */;
INSERT INTO `fac_Manufacturer` VALUES (1,'Generic'),(2,'APC'),(3,'Geist'),(4,'ServerTech');
/*!40000 ALTER TABLE `fac_Manufacturer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fac_PDUStats`
--

DROP TABLE IF EXISTS `fac_PDUStats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fac_PDUStats` (
  `PDUID` int(11) NOT NULL,
  `Wattage` int(11) NOT NULL,
  PRIMARY KEY (`PDUID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fac_PDUStats`
--

LOCK TABLES `fac_PDUStats` WRITE;
/*!40000 ALTER TABLE `fac_PDUStats` DISABLE KEYS */;
/*!40000 ALTER TABLE `fac_PDUStats` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fac_PanelSchedule`
--

DROP TABLE IF EXISTS `fac_PanelSchedule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fac_PanelSchedule` (
  `PanelID` int(11) NOT NULL AUTO_INCREMENT,
  `PolePosition` int(11) NOT NULL,
  `NumPoles` int(11) NOT NULL,
  `Label` varchar(80) NOT NULL,
  PRIMARY KEY (`PanelID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fac_PanelSchedule`
--

LOCK TABLES `fac_PanelSchedule` WRITE;
/*!40000 ALTER TABLE `fac_PanelSchedule` DISABLE KEYS */;
/*!40000 ALTER TABLE `fac_PanelSchedule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fac_PatchConnection`
--

DROP TABLE IF EXISTS `fac_PatchConnection`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fac_PatchConnection` (
  `PanelDeviceID` int(11) NOT NULL,
  `PanelPortNumber` int(11) NOT NULL,
  `FrontEndpointDeviceID` int(11) DEFAULT NULL,
  `FrontEndpointPort` int(11) DEFAULT NULL,
  `RearEndpointDeviceID` int(11) DEFAULT NULL,
  `RearEndpointPort` int(11) DEFAULT NULL,
  `FrontNotes` varchar(80) DEFAULT NULL,
  `RearNotes` varchar(80) DEFAULT NULL,
  PRIMARY KEY (`PanelDeviceID`,`PanelPortNumber`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fac_PatchConnection`
--

LOCK TABLES `fac_PatchConnection` WRITE;
/*!40000 ALTER TABLE `fac_PatchConnection` DISABLE KEYS */;
/*!40000 ALTER TABLE `fac_PatchConnection` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fac_PowerConnection`
--

DROP TABLE IF EXISTS `fac_PowerConnection`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fac_PowerConnection` (
  `PDUID` int(11) NOT NULL,
  `PDUPosition` int(11) NOT NULL,
  `DeviceID` int(11) NOT NULL,
  `DeviceConnNumber` int(11) NOT NULL,
  UNIQUE KEY `PDUID` (`PDUID`,`PDUPosition`),
  UNIQUE KEY `DeviceID` (`DeviceID`,`DeviceConnNumber`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fac_PowerConnection`
--

LOCK TABLES `fac_PowerConnection` WRITE;
/*!40000 ALTER TABLE `fac_PowerConnection` DISABLE KEYS */;
/*!40000 ALTER TABLE `fac_PowerConnection` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fac_PowerDistribution`
--

DROP TABLE IF EXISTS `fac_PowerDistribution`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fac_PowerDistribution` (
  `PDUID` int(11) NOT NULL AUTO_INCREMENT,
  `Label` varchar(40) NOT NULL,
  `CabinetID` int(11) NOT NULL,
  `TemplateID` int(11) NOT NULL,
  `IPAddress` varchar(16) NOT NULL,
  `SNMPCommunity` varchar(50) NOT NULL,
  `FirmwareVersion` varchar(40) NOT NULL,
  `PanelID` int(11) NOT NULL,
  `BreakerSize` int(11) NOT NULL,
  `PanelPole` int(11) NOT NULL,
  `InputAmperage` int(11) NOT NULL,
  `FailSafe` tinyint(1) NOT NULL,
  `PanelID2` int(11) NOT NULL,
  `PanelPole2` int(11) NOT NULL,
  PRIMARY KEY (`PDUID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fac_PowerDistribution`
--

LOCK TABLES `fac_PowerDistribution` WRITE;
/*!40000 ALTER TABLE `fac_PowerDistribution` DISABLE KEYS */;
/*!40000 ALTER TABLE `fac_PowerDistribution` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fac_PowerPanel`
--

DROP TABLE IF EXISTS `fac_PowerPanel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fac_PowerPanel` (
  `PanelID` int(11) NOT NULL AUTO_INCREMENT,
  `PowerSourceID` int(11) NOT NULL,
  `PanelLabel` varchar(20) NOT NULL,
  `NumberOfPoles` int(11) NOT NULL,
  `MainBreakerSize` int(11) NOT NULL,
  `PanelVoltage` int(11) NOT NULL,
  `NumberScheme` enum('Odd/Even','Sequential') NOT NULL,
  PRIMARY KEY (`PanelID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fac_PowerPanel`
--

LOCK TABLES `fac_PowerPanel` WRITE;
/*!40000 ALTER TABLE `fac_PowerPanel` DISABLE KEYS */;
/*!40000 ALTER TABLE `fac_PowerPanel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fac_PowerSource`
--

DROP TABLE IF EXISTS `fac_PowerSource`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fac_PowerSource` (
  `PowerSourceID` int(11) NOT NULL AUTO_INCREMENT,
  `SourceName` varchar(80) NOT NULL,
  `DataCenterID` int(11) NOT NULL,
  `IPAddress` varchar(20) NOT NULL,
  `Community` varchar(40) NOT NULL,
  `LoadOID` varchar(80) NOT NULL,
  `Capacity` int(11) NOT NULL,
  PRIMARY KEY (`PowerSourceID`),
  KEY `DataCenterID` (`DataCenterID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fac_PowerSource`
--

LOCK TABLES `fac_PowerSource` WRITE;
/*!40000 ALTER TABLE `fac_PowerSource` DISABLE KEYS */;
/*!40000 ALTER TABLE `fac_PowerSource` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fac_RackRequest`
--

DROP TABLE IF EXISTS `fac_RackRequest`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fac_RackRequest` (
  `RequestID` int(11) NOT NULL AUTO_INCREMENT,
  `RequestorID` int(11) NOT NULL,
  `RequestTime` datetime NOT NULL,
  `CompleteTime` datetime NOT NULL,
  `Label` varchar(40) NOT NULL,
  `SerialNo` varchar(40) NOT NULL,
  `MfgDate` date NOT NULL,
  `AssetTag` varchar(40) NOT NULL,
  `ESX` tinyint(1) NOT NULL,
  `Owner` int(11) NOT NULL,
  `DeviceHeight` int(11) NOT NULL,
  `EthernetCount` int(11) NOT NULL,
  `VLANList` varchar(80) NOT NULL,
  `SANCount` int(11) NOT NULL,
  `SANList` varchar(80) NOT NULL,
  `DeviceClass` varchar(80) NOT NULL,
  `DeviceType` enum('Server','Appliance','Storage Array','Switch','Chassis','Patch Panel','Physical Infrastructure') NOT NULL,
  `LabelColor` varchar(80) NOT NULL,
  `CurrentLocation` varchar(120) NOT NULL,
  `SpecialInstructions` text NOT NULL,
  PRIMARY KEY (`RequestID`),
  KEY `RequestorID` (`RequestorID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fac_RackRequest`
--

LOCK TABLES `fac_RackRequest` WRITE;
/*!40000 ALTER TABLE `fac_RackRequest` DISABLE KEYS */;
/*!40000 ALTER TABLE `fac_RackRequest` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fac_Supplies`
--

DROP TABLE IF EXISTS `fac_Supplies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fac_Supplies` (
  `SupplyID` int(11) NOT NULL AUTO_INCREMENT,
  `PartNum` varchar(40) NOT NULL,
  `PartName` varchar(80) NOT NULL,
  `MinQty` int(11) NOT NULL,
  `MaxQty` int(11) NOT NULL,
  PRIMARY KEY (`SupplyID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fac_Supplies`
--

LOCK TABLES `fac_Supplies` WRITE;
/*!40000 ALTER TABLE `fac_Supplies` DISABLE KEYS */;
/*!40000 ALTER TABLE `fac_Supplies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fac_SupplyBin`
--

DROP TABLE IF EXISTS `fac_SupplyBin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fac_SupplyBin` (
  `BinID` int(11) NOT NULL AUTO_INCREMENT,
  `Location` varchar(40) NOT NULL,
  PRIMARY KEY (`BinID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fac_SupplyBin`
--

LOCK TABLES `fac_SupplyBin` WRITE;
/*!40000 ALTER TABLE `fac_SupplyBin` DISABLE KEYS */;
/*!40000 ALTER TABLE `fac_SupplyBin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fac_SwitchConnection`
--

DROP TABLE IF EXISTS `fac_SwitchConnection`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fac_SwitchConnection` (
  `SwitchDeviceID` int(11) NOT NULL,
  `SwitchPortNumber` int(11) NOT NULL,
  `EndpointDeviceID` int(11) NOT NULL,
  `EndpointPort` int(11) NOT NULL,
  `Notes` varchar(80) NOT NULL,
  PRIMARY KEY (`SwitchDeviceID`,`SwitchPortNumber`),
  UNIQUE KEY `EndpointDeviceID` (`EndpointDeviceID`,`EndpointPort`),
  UNIQUE KEY `SwitchDeviceID` (`SwitchDeviceID`,`SwitchPortNumber`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fac_SwitchConnection`
--

LOCK TABLES `fac_SwitchConnection` WRITE;
/*!40000 ALTER TABLE `fac_SwitchConnection` DISABLE KEYS */;
/*!40000 ALTER TABLE `fac_SwitchConnection` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fac_Tags`
--

DROP TABLE IF EXISTS `fac_Tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fac_Tags` (
  `TagID` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(128) NOT NULL,
  PRIMARY KEY (`TagID`),
  UNIQUE KEY `Name` (`Name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fac_Tags`
--

LOCK TABLES `fac_Tags` WRITE;
/*!40000 ALTER TABLE `fac_Tags` DISABLE KEYS */;
/*!40000 ALTER TABLE `fac_Tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fac_User`
--

DROP TABLE IF EXISTS `fac_User`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fac_User` (
  `UserID` varchar(80) NOT NULL,
  `Name` varchar(80) NOT NULL,
  `ReadAccess` tinyint(1) NOT NULL,
  `WriteAccess` tinyint(1) NOT NULL,
  `DeleteAccess` tinyint(1) NOT NULL,
  `ContactAdmin` tinyint(1) NOT NULL,
  `RackRequest` tinyint(1) NOT NULL,
  `RackAdmin` tinyint(1) NOT NULL,
  `SiteAdmin` tinyint(1) NOT NULL,
  `Disabled` tinyint(1) NOT NULL,
  PRIMARY KEY (`UserID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fac_User`
--

LOCK TABLES `fac_User` WRITE;
/*!40000 ALTER TABLE `fac_User` DISABLE KEYS */;
INSERT INTO `fac_User` VALUES ('ahmed','Default Admin',1,1,1,1,1,1,1,0);
/*!40000 ALTER TABLE `fac_User` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fac_VMInventory`
--

DROP TABLE IF EXISTS `fac_VMInventory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fac_VMInventory` (
  `VMIndex` int(11) NOT NULL AUTO_INCREMENT,
  `DeviceID` int(11) NOT NULL,
  `LastUpdated` datetime NOT NULL,
  `vmID` int(11) NOT NULL,
  `vmName` varchar(80) NOT NULL,
  `vmState` varchar(80) NOT NULL,
  `Owner` int(11) NOT NULL,
  PRIMARY KEY (`VMIndex`),
  KEY `ValidDevice` (`DeviceID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fac_VMInventory`
--

LOCK TABLES `fac_VMInventory` WRITE;
/*!40000 ALTER TABLE `fac_VMInventory` DISABLE KEYS */;
/*!40000 ALTER TABLE `fac_VMInventory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fac_Zone`
--

DROP TABLE IF EXISTS `fac_Zone`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fac_Zone` (
  `ZoneID` int(11) NOT NULL AUTO_INCREMENT,
  `DataCenterID` int(11) NOT NULL,
  `Description` varchar(120) NOT NULL,
  PRIMARY KEY (`ZoneID`),
  KEY `DataCenterID` (`DataCenterID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fac_Zone`
--

LOCK TABLES `fac_Zone` WRITE;
/*!40000 ALTER TABLE `fac_Zone` DISABLE KEYS */;
/*!40000 ALTER TABLE `fac_Zone` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2013-02-02 16:52:56
