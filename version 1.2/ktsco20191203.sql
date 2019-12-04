CREATE DATABASE  IF NOT EXISTS `ktscodb` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `ktscodb`;
-- MySQL dump 10.13  Distrib 8.0.16, for macos10.14 (x86_64)
--
-- Host: 127.0.0.1    Database: ktscodb
-- ------------------------------------------------------
-- Server version	8.0.17

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Temporary view structure for view `accountreceivable`
--

DROP TABLE IF EXISTS `accountreceivable`;
/*!50001 DROP VIEW IF EXISTS `accountreceivable`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
/*!50001 CREATE VIEW `accountreceivable` AS SELECT 
 1 AS `bill_id`,
 1 AS `customer_id`,
 1 AS `billdate`,
 1 AS `duedate`,
 1 AS `billtotal`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `accounts`
--

DROP TABLE IF EXISTS `accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `accounts` (
  `account_id` int(11) NOT NULL AUTO_INCREMENT,
  `bank_Accnt` varchar(45) COLLATE utf8mb4_general_ci NOT NULL,
  `bank_name` varchar(45) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `accnt_crt_date` date DEFAULT NULL,
  `opening_balance` decimal(15,3) NOT NULL,
  `currency` varchar(45) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`account_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `BANKDEPOSIT`
--

DROP TABLE IF EXISTS `BANKDEPOSIT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `BANKDEPOSIT` (
  `BANKDEPOID` int(11) NOT NULL AUTO_INCREMENT,
  `AMOUNT` decimal(15,3) NOT NULL,
  `VOUCHERNO` varchar(45) NOT NULL,
  `TRANSACTIONDATE` date DEFAULT NULL,
  `received_RECEIVE_ID` int(11) NOT NULL,
  `banks_bank_id` int(11) NOT NULL,
  `employee_employee_id` int(11) NOT NULL,
  PRIMARY KEY (`BANKDEPOID`),
  KEY `fk_BANKDEPOSIT_employee1_idx` (`employee_employee_id`),
  KEY `fk_BANKDEPOSIT_received1_idx` (`received_RECEIVE_ID`),
  KEY `fk_BANKDEPOSIT_bankID_idx` (`banks_bank_id`),
  CONSTRAINT `fk_BANKDEPOSIT_bankID` FOREIGN KEY (`banks_bank_id`) REFERENCES `accounts` (`account_id`) ON DELETE RESTRICT,
  CONSTRAINT `fk_BANKDEPOSIT_employee1` FOREIGN KEY (`employee_employee_id`) REFERENCES `employee` (`employee_id`),
  CONSTRAINT `fk_BANKDEPOSIT_received1` FOREIGN KEY (`received_RECEIVE_ID`) REFERENCES `received` (`RECEIVE_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Temporary view structure for view `bankreceivetotalview`
--

DROP TABLE IF EXISTS `bankreceivetotalview`;
/*!50001 DROP VIEW IF EXISTS `bankreceivetotalview`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
/*!50001 CREATE VIEW `bankreceivetotalview` AS SELECT 
 1 AS `banks_bank_id`,
 1 AS `totalAmount`,
 1 AS `totalPaid`,
 1 AS `accountBalance`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `category` (
  `category_id` int(11) NOT NULL AUTO_INCREMENT,
  `category` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `mainCategory_id` int(11) NOT NULL,
  PRIMARY KEY (`category_id`),
  KEY `id_maincategory_idx` (`mainCategory_id`),
  CONSTRAINT `id_maincategory` FOREIGN KEY (`mainCategory_id`) REFERENCES `maincategory` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `currencies`
--

DROP TABLE IF EXISTS `currencies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `currencies` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `currency` varchar(45) COLLATE utf8mb4_general_ci NOT NULL,
  `entryDate` date NOT NULL,
  `rate` decimal(11,9) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `customers`
--

DROP TABLE IF EXISTS `customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `customers` (
  `customer_id` int(11) NOT NULL,
  `company` varchar(45) COLLATE utf8mb4_general_ci NOT NULL,
  `poc` varchar(45) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `phone` varchar(45) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `address` varchar(45) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `currency` varchar(45) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Temporary view structure for view `directdepositview`
--

DROP TABLE IF EXISTS `directdepositview`;
/*!50001 DROP VIEW IF EXISTS `directdepositview`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
/*!50001 CREATE VIEW `directdepositview` AS SELECT 
 1 AS `receive_ID`,
 1 AS `BILL_ID`,
 1 AS `AMOUNT`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `employee` (
  `employee_id` int(11) NOT NULL,
  `fullname` varchar(45) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `position` varchar(45) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`employee_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `expenseBill`
--

DROP TABLE IF EXISTS `expenseBill`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `expenseBill` (
  `expns_id` int(11) NOT NULL,
  `expns_date` varchar(45) COLLATE utf8mb4_general_ci NOT NULL,
  `currency` varchar(45) COLLATE utf8mb4_general_ci NOT NULL,
  `memo` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `paidflag` tinyint(4) DEFAULT '0',
  `vendor_id` int(11) NOT NULL,
  PRIMARY KEY (`expns_id`),
  KEY `fk_vendor_vendor_id_idx` (`vendor_id`),
  CONSTRAINT `fk_vendor_vendor_id` FOREIGN KEY (`vendor_id`) REFERENCES `vendors` (`vendor_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `expenseDetail`
--

DROP TABLE IF EXISTS `expenseDetail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `expenseDetail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `quantity` decimal(15,3) NOT NULL DEFAULT '0.000',
  `unitprice` decimal(15,3) NOT NULL DEFAULT '0.000',
  `expns_id` int(11) NOT NULL,
  `inv_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_expenseDetail_expenseBill1_idx` (`expns_id`),
  KEY `fk_expenseDetail_inventory1_idx` (`inv_id`),
  CONSTRAINT `fk_expenseDetail_expenseBill1` FOREIGN KEY (`expns_id`) REFERENCES `expensebill` (`expns_id`) ON DELETE CASCADE,
  CONSTRAINT `fk_expenseDetail_inventory1` FOREIGN KEY (`inv_id`) REFERENCES `inventory` (`inv_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Temporary view structure for view `expnsbilltotal`
--

DROP TABLE IF EXISTS `expnsbilltotal`;
/*!50001 DROP VIEW IF EXISTS `expnsbilltotal`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
/*!50001 CREATE VIEW `expnsbilltotal` AS SELECT 
 1 AS `expns_id`,
 1 AS `billtotal`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `expnspaytotal`
--

DROP TABLE IF EXISTS `expnspaytotal`;
/*!50001 DROP VIEW IF EXISTS `expnspaytotal`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
/*!50001 CREATE VIEW `expnspaytotal` AS SELECT 
 1 AS `expns_id`,
 1 AS `totalPaid`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `inventory`
--

DROP TABLE IF EXISTS `inventory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `inventory` (
  `inv_id` int(11) NOT NULL AUTO_INCREMENT,
  `category_id` int(11) DEFAULT NULL,
  `inv_name` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `inv_um` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`inv_id`),
  KEY `category_id_idx` (`category_id`),
  CONSTRAINT `inventory_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `category` (`category_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `invImport`
--

DROP TABLE IF EXISTS `invImport`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `invImport` (
  `import_id` int(11) NOT NULL,
  `import_date` date NOT NULL,
  `employee_id` int(11) NOT NULL,
  PRIMARY KEY (`import_id`),
  KEY `employee_id_idx` (`employee_id`),
  CONSTRAINT `employee_id` FOREIGN KEY (`employee_id`) REFERENCES `employee` (`employee_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `invImportDetail`
--

DROP TABLE IF EXISTS `invImportDetail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `invImportDetail` (
  `detail_id` int(11) NOT NULL AUTO_INCREMENT,
  `inv_item` int(11) DEFAULT NULL,
  `import_qty` decimal(10,2) DEFAULT NULL,
  `invImportID` int(11) DEFAULT NULL,
  PRIMARY KEY (`detail_id`),
  KEY `inv_Item_idx` (`inv_item`),
  KEY `import_id_idx` (`invImportID`),
  CONSTRAINT `import_id` FOREIGN KEY (`invImportID`) REFERENCES `invimport` (`import_id`) ON DELETE CASCADE,
  CONSTRAINT `inv_Item` FOREIGN KEY (`inv_item`) REFERENCES `inventory` (`inv_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `maincategory`
--

DROP TABLE IF EXISTS `maincategory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `maincategory` (
  `id` int(11) NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `paybills`
--

DROP TABLE IF EXISTS `paybills`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `paybills` (
  `pay_id` int(11) NOT NULL AUTO_INCREMENT,
  `expns_id` int(11) NOT NULL,
  `account_id` int(11) NOT NULL,
  `employee` int(11) NOT NULL,
  `paydate` date NOT NULL,
  `amount` decimal(15,3) NOT NULL,
  PRIMARY KEY (`pay_id`),
  KEY `expns_expns_id_idx` (`expns_id`),
  KEY `accnt_account_id_idx` (`account_id`),
  KEY `employee_emp_id_idx` (`employee`),
  CONSTRAINT `accnt_account_id` FOREIGN KEY (`account_id`) REFERENCES `accounts` (`account_id`),
  CONSTRAINT `employee_emp_id` FOREIGN KEY (`employee`) REFERENCES `employee` (`employee_id`),
  CONSTRAINT `expns_expns_id` FOREIGN KEY (`expns_id`) REFERENCES `expensebill` (`expns_id`) ON DELETE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `prod_prc_hst`
--

DROP TABLE IF EXISTS `prod_prc_hst`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `prod_prc_hst` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `prod_id` int(11) NOT NULL,
  `price` decimal(11,2) NOT NULL,
  `dttm_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `prd_id_idx` (`prod_id`),
  CONSTRAINT `prd_id` FOREIGN KEY (`prod_id`) REFERENCES `products` (`prod_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `productDetail`
--

DROP TABLE IF EXISTS `productDetail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `productDetail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `prod_id` int(11) DEFAULT NULL,
  `inv_id` int(11) DEFAULT NULL,
  `req_qty` decimal(10,4) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `inv_id_idx` (`inv_id`),
  KEY `prod_id_idx` (`prod_id`),
  CONSTRAINT `inv_id` FOREIGN KEY (`inv_id`) REFERENCES `inventory` (`inv_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `prod_id` FOREIGN KEY (`prod_id`) REFERENCES `products` (`prod_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `productExport`
--

DROP TABLE IF EXISTS `productExport`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `productExport` (
  `export_id` int(11) NOT NULL,
  `date` date DEFAULT NULL,
  `memo` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `employee_id` int(11) NOT NULL,
  PRIMARY KEY (`export_id`),
  KEY `fk_productExport_employee1_idx` (`employee_id`),
  CONSTRAINT `fk_productExport_employee1` FOREIGN KEY (`employee_id`) REFERENCES `employee` (`employee_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `productExportDetail`
--

DROP TABLE IF EXISTS `productExportDetail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `productExportDetail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `export_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `quantity` decimal(6,2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_productExportDetail_productExport1_idx` (`export_id`),
  CONSTRAINT `export_id` FOREIGN KEY (`export_id`) REFERENCES `productexport` (`export_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `productionDetail`
--

DROP TABLE IF EXISTS `productionDetail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `productionDetail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `production_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `quantity` decimal(6,2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index2` (`production_id`),
  KEY `index3` (`product_id`),
  CONSTRAINT `product_id` FOREIGN KEY (`product_id`) REFERENCES `products` (`prod_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `production_id` FOREIGN KEY (`production_id`) REFERENCES `productionlist` (`production_id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Temporary view structure for view `productionexporttotalview`
--

DROP TABLE IF EXISTS `productionexporttotalview`;
/*!50001 DROP VIEW IF EXISTS `productionexporttotalview`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
/*!50001 CREATE VIEW `productionexporttotalview` AS SELECT 
 1 AS `prod_id`,
 1 AS `prod_name`,
 1 AS `prod_um`,
 1 AS `exportTotal`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `productionList`
--

DROP TABLE IF EXISTS `productionList`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `productionList` (
  `production_id` int(11) NOT NULL,
  `date` date NOT NULL,
  `employee_id` int(11) NOT NULL,
  PRIMARY KEY (`production_id`),
  KEY `emp_id_idx` (`employee_id`),
  CONSTRAINT `emp_id` FOREIGN KEY (`employee_id`) REFERENCES `employee` (`employee_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Temporary view structure for view `productionrawmaterial`
--

DROP TABLE IF EXISTS `productionrawmaterial`;
/*!50001 DROP VIEW IF EXISTS `productionrawmaterial`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
/*!50001 CREATE VIEW `productionrawmaterial` AS SELECT 
 1 AS `product_id`,
 1 AS `quantity`,
 1 AS `inv_id`,
 1 AS `req_qty`,
 1 AS `lineTotal`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `productiontotalview`
--

DROP TABLE IF EXISTS `productiontotalview`;
/*!50001 DROP VIEW IF EXISTS `productiontotalview`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
/*!50001 CREATE VIEW `productiontotalview` AS SELECT 
 1 AS `prod_id`,
 1 AS `prod_name`,
 1 AS `prod_um`,
 1 AS `productionTotal`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `products` (
  `prod_id` int(11) NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  `prod_name` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `prod_um` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `factory_prod` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`prod_id`),
  KEY `category_id_idx` (`category_id`),
  CONSTRAINT `category_id` FOREIGN KEY (`category_id`) REFERENCES `category` (`category_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Temporary view structure for view `rawmaterialimport`
--

DROP TABLE IF EXISTS `rawmaterialimport`;
/*!50001 DROP VIEW IF EXISTS `rawmaterialimport`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
/*!50001 CREATE VIEW `rawmaterialimport` AS SELECT 
 1 AS `inv_id`,
 1 AS `totalImport`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `received`
--

DROP TABLE IF EXISTS `received`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `received` (
  `RECEIVE_ID` int(11) NOT NULL AUTO_INCREMENT,
  `bill_id` int(11) NOT NULL,
  `receive_date` date NOT NULL,
  `emp_id` int(11) NOT NULL,
  `amount` decimal(15,3) NOT NULL,
  `depositType` tinyint(4) NOT NULL,
  `received_flag` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`RECEIVE_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `salebills`
--

DROP TABLE IF EXISTS `salebills`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `salebills` (
  `bill_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `billdate` date NOT NULL,
  `duedate` date DEFAULT NULL,
  `currencyType` varchar(45) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `billmemo` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `paidflag` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`bill_id`),
  KEY `customer_id_ind` (`customer_id`),
  CONSTRAINT `customer_id` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`customer_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `saledetail`
--

DROP TABLE IF EXISTS `saledetail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `saledetail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `bill_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity` decimal(15,3) NOT NULL,
  `unitprice` decimal(15,3) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `bill_id_idx` (`bill_id`),
  KEY `products_id_idx` (`product_id`),
  CONSTRAINT `bill_id` FOREIGN KEY (`bill_id`) REFERENCES `salebills` (`bill_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `products_id` FOREIGN KEY (`product_id`) REFERENCES `products` (`prod_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Temporary view structure for view `salesbilltotal`
--

DROP TABLE IF EXISTS `salesbilltotal`;
/*!50001 DROP VIEW IF EXISTS `salesbilltotal`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
/*!50001 CREATE VIEW `salesbilltotal` AS SELECT 
 1 AS `bill_id`,
 1 AS `company`,
 1 AS `billdate`,
 1 AS `currencyType`,
 1 AS `billTotal`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `salestotalquantity`
--

DROP TABLE IF EXISTS `salestotalquantity`;
/*!50001 DROP VIEW IF EXISTS `salestotalquantity`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
/*!50001 CREATE VIEW `salestotalquantity` AS SELECT 
 1 AS `PRODUCT_ID`,
 1 AS `TOTALSALES`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `tatalproductionraw`
--

DROP TABLE IF EXISTS `tatalproductionraw`;
/*!50001 DROP VIEW IF EXISTS `tatalproductionraw`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
/*!50001 CREATE VIEW `tatalproductionraw` AS SELECT 
 1 AS `inv_id`,
 1 AS `totalUsage`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `undefinddeposit`
--

DROP TABLE IF EXISTS `undefinddeposit`;
/*!50001 DROP VIEW IF EXISTS `undefinddeposit`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
/*!50001 CREATE VIEW `undefinddeposit` AS SELECT 
 1 AS `receive_ID`,
 1 AS `BILL_ID`,
 1 AS `AMOUNT`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `usdsalesdetail`
--

DROP TABLE IF EXISTS `usdsalesdetail`;
/*!50001 DROP VIEW IF EXISTS `usdsalesdetail`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
/*!50001 CREATE VIEW `usdsalesdetail` AS SELECT 
 1 AS `id`,
 1 AS `bill_id`,
 1 AS `product_id`,
 1 AS `quantity`,
 1 AS `unitprice`,
 1 AS `currencyRate`,
 1 AS `usdLineTotal`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `users` (
  `user_ID` int(11) NOT NULL AUTO_INCREMENT,
  `fullname` varchar(45) COLLATE utf8mb4_general_ci NOT NULL,
  `username` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `password` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `admin_access` tinyint(4) NOT NULL DEFAULT '0',
  `csr_access` tinyint(4) NOT NULL DEFAULT '0',
  `factory_access` tinyint(4) NOT NULL DEFAULT '0',
  `mgmt_access` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`user_ID`),
  UNIQUE KEY `user_ID_UNIQUE` (`user_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `vendors`
--

DROP TABLE IF EXISTS `vendors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `vendors` (
  `vendor_id` int(11) NOT NULL,
  `company` varchar(45) NOT NULL,
  `poc` varchar(45) DEFAULT NULL,
  `phone` varchar(45) DEFAULT NULL,
  `address` varchar(45) DEFAULT NULL,
  `currency` varchar(45) NOT NULL,
  PRIMARY KEY (`vendor_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Final view structure for view `accountreceivable`
--

/*!50001 DROP VIEW IF EXISTS `accountreceivable`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `accountreceivable` AS select `sb`.`bill_id` AS `bill_id`,`sb`.`customer_id` AS `customer_id`,`sb`.`billdate` AS `billdate`,`sb`.`duedate` AS `duedate`,sum((`sd`.`quantity` * `sd`.`unitprice`)) AS `billtotal` from (`salebills` `sb` join `saledetail` `sd` on((`sb`.`bill_id` = `sd`.`bill_id`))) where (`sb`.`paidflag` = 0) group by `sb`.`bill_id` order by `sb`.`duedate` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `bankreceivetotalview`
--

/*!50001 DROP VIEW IF EXISTS `bankreceivetotalview`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `bankreceivetotalview` AS select `bankdeposit`.`banks_bank_id` AS `banks_bank_id`,sum(`bankdeposit`.`AMOUNT`) AS `totalAmount`,(select sum(`paybills`.`amount`) from `paybills` where (`paybills`.`account_id` = `bankdeposit`.`banks_bank_id`)) AS `totalPaid`,(sum(`bankdeposit`.`AMOUNT`) - (select sum(`paybills`.`amount`) from `paybills` where (`paybills`.`account_id` = `bankdeposit`.`banks_bank_id`))) AS `accountBalance` from `bankdeposit` group by `bankdeposit`.`banks_bank_id` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `directdepositview`
--

/*!50001 DROP VIEW IF EXISTS `directdepositview`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `directdepositview` AS select `received`.`RECEIVE_ID` AS `receive_ID`,`received`.`bill_id` AS `BILL_ID`,`received`.`amount` AS `AMOUNT` from `received` where ((`received`.`depositType` = 0) and (`received`.`received_flag` = 0)) order by `received`.`receive_date` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `expnsbilltotal`
--

/*!50001 DROP VIEW IF EXISTS `expnsbilltotal`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `expnsbilltotal` AS select `eb`.`expns_id` AS `expns_id`,sum((`ed`.`unitprice` * `ed`.`quantity`)) AS `billtotal` from (`expensebill` `eb` join `expensedetail` `ed` on((`eb`.`expns_id` = `ed`.`expns_id`))) group by `eb`.`expns_id` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `expnspaytotal`
--

/*!50001 DROP VIEW IF EXISTS `expnspaytotal`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `expnspaytotal` AS select `paybills`.`expns_id` AS `expns_id`,sum(`paybills`.`amount`) AS `totalPaid` from `paybills` group by `paybills`.`expns_id` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `productionexporttotalview`
--

/*!50001 DROP VIEW IF EXISTS `productionexporttotalview`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `productionexporttotalview` AS select `prod`.`prod_id` AS `prod_id`,`prod`.`prod_name` AS `prod_name`,`prod`.`prod_um` AS `prod_um`,ifnull(sum(`prodExport`.`quantity`),0) AS `exportTotal` from (`products` `prod` left join `productexportdetail` `prodExport` on((`prod`.`prod_id` = `prodExport`.`product_id`))) where (`prod`.`factory_prod` = 1) group by `prod`.`prod_id` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `productionrawmaterial`
--

/*!50001 DROP VIEW IF EXISTS `productionrawmaterial`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `productionrawmaterial` AS select `pdetail`.`product_id` AS `product_id`,`pdetail`.`quantity` AS `quantity`,`proddetail`.`inv_id` AS `inv_id`,`proddetail`.`req_qty` AS `req_qty`,(`pdetail`.`quantity` * `proddetail`.`req_qty`) AS `lineTotal` from (`productiondetail` `pdetail` join `productdetail` `proddetail` on((`pdetail`.`product_id` = `proddetail`.`prod_id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `productiontotalview`
--

/*!50001 DROP VIEW IF EXISTS `productiontotalview`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `productiontotalview` AS select `prod`.`prod_id` AS `prod_id`,`prod`.`prod_name` AS `prod_name`,`prod`.`prod_um` AS `prod_um`,sum(`prodDetail`.`quantity`) AS `productionTotal` from (`products` `prod` left join `productiondetail` `prodDetail` on((`prod`.`prod_id` = `prodDetail`.`product_id`))) where (`prod`.`factory_prod` = 1) group by `prod`.`prod_id` order by `prod`.`prod_id` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `rawmaterialimport`
--

/*!50001 DROP VIEW IF EXISTS `rawmaterialimport`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `rawmaterialimport` AS select `invimpdet`.`inv_item` AS `inv_id`,sum(`invimpdet`.`import_qty`) AS `totalImport` from `invimportdetail` `invimpdet` group by `invimpdet`.`inv_item` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `salesbilltotal`
--

/*!50001 DROP VIEW IF EXISTS `salesbilltotal`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `salesbilltotal` AS select `sb`.`bill_id` AS `bill_id`,`c`.`company` AS `company`,`sb`.`billdate` AS `billdate`,`sb`.`currencyType` AS `currencyType`,sum((`sd`.`quantity` * `sd`.`unitprice`)) AS `billTotal` from ((`salebills` `sb` join `customers` `c` on((`sb`.`customer_id` = `c`.`customer_id`))) join `saledetail` `sd` on((`sb`.`bill_id` = `sd`.`bill_id`))) group by `sb`.`bill_id` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `salestotalquantity`
--

/*!50001 DROP VIEW IF EXISTS `salestotalquantity`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `salestotalquantity` AS select `saledetail`.`product_id` AS `PRODUCT_ID`,sum(`saledetail`.`quantity`) AS `TOTALSALES` from `saledetail` group by `saledetail`.`product_id` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `tatalproductionraw`
--

/*!50001 DROP VIEW IF EXISTS `tatalproductionraw`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `tatalproductionraw` AS select `prm`.`inv_id` AS `inv_id`,sum(`prm`.`lineTotal`) AS `totalUsage` from `productionrawmaterial` `prm` group by `prm`.`inv_id` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `undefinddeposit`
--

/*!50001 DROP VIEW IF EXISTS `undefinddeposit`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `undefinddeposit` AS select `received`.`RECEIVE_ID` AS `receive_ID`,`received`.`bill_id` AS `BILL_ID`,`received`.`amount` AS `AMOUNT` from `received` where ((`received`.`depositType` = 1) and (`received`.`received_flag` = 0)) order by `received`.`receive_date` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `usdsalesdetail`
--

/*!50001 DROP VIEW IF EXISTS `usdsalesdetail`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `usdsalesdetail` AS select `sd`.`id` AS `id`,`sd`.`bill_id` AS `bill_id`,`sd`.`product_id` AS `product_id`,`sd`.`quantity` AS `quantity`,`sd`.`unitprice` AS `unitprice`,(select `c`.`rate` from `currencies` `c` where ((`c`.`entryDate` = (select `salebills`.`billdate` from `salebills` where (`salebills`.`bill_id` = `sd`.`bill_id`))) and (`c`.`currency` = (select `salebills`.`currencyType` from `salebills` where (`salebills`.`bill_id` = `sd`.`bill_id`))))) AS `currencyRate`,(`sd`.`quantity` * (`sd`.`unitprice` * (select `c`.`rate` from `currencies` `c` where ((`c`.`entryDate` = (select `salebills`.`billdate` from `salebills` where (`salebills`.`bill_id` = `sd`.`bill_id`))) and (`c`.`currency` = (select `salebills`.`currencyType` from `salebills` where (`salebills`.`bill_id` = `sd`.`bill_id`))))))) AS `usdLineTotal` from `saledetail` `sd` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-12-03 20:33:59
