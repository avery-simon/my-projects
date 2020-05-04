-- MySQL dump 10.14  Distrib 5.5.64-MariaDB, for Linux (x86_64)
--
-- Host: warehouse    Database: as12668_db1
-- ------------------------------------------------------
-- Server version	5.5.64-MariaDB

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
-- Table structure for table `customers`
--

DROP TABLE IF EXISTS `customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customers` (
  `customerNumber` int(11) NOT NULL,
  `customerName` varchar(50) NOT NULL,
  `contactLastName` varchar(50) NOT NULL,
  `contactFirstName` varchar(50) NOT NULL,
  `phone` varchar(50) NOT NULL,
  `addressLine1` varchar(50) NOT NULL,
  `addressLine2` varchar(50) DEFAULT NULL,
  `city` varchar(50) NOT NULL,
  `state` varchar(50) DEFAULT NULL,
  `postalCode` varchar(15) DEFAULT NULL,
  `country` varchar(50) NOT NULL,
  `salesRepEmployeeNumber` int(11) DEFAULT NULL,
  `creditLimit` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customers`
--

LOCK TABLES `customers` WRITE;
/*!40000 ALTER TABLE `customers` DISABLE KEYS */;
INSERT INTO `customers` VALUES (103,'Tire Store','Bradshaw','Carrie ','1234457582','54, Royale St.',NULL,'Paris',NULL,'44000','France',1370,21000.00),(112,'Soap Store','Hobbs','Miranda','7025551838','8489 Strong St.',NULL,'Las Vegas','NV','83030','USA',1166,71800.00),(114,'Grocery Store','York','Charolette','9182734829','636 Big Road','Level 3','Melbourne','Victoria','3004','Australia',1611,117300.00),(119,'Clothing Store','Jones','Samantha ','4071929191','67 rue des Cinquante Otages',NULL,'Paris',NULL,'44000','France',1370,118200.00),(121,'Toy Store','Brown','Henry ','9281828282','Erling Skakkes gate 78',NULL,'Stavern',NULL,'4110','Norway',1504,81700.00),(146,'Office Supply','May','Mary ','8299188282','2 rue du Commerce',NULL,'Lyon',NULL,'69004','France',1337,123900.00),(148,'Souvenier Store','Ray','Eric','192838227','Bronz Sok.','Bronz Apt. 3/6 Tesvikiye','Singapore',NULL,'079903','Singapore',1621,103800.00),(151,'Vending Machines Inc.','Young','Jeff','2125557413','4092 Furth Circle','Suite 400','NYC','NY','10022','USA',1286,138500.00),(157,'Ice Cream Shop','Long','Kelvin','2155551555','7586 Pompton St.',NULL,'Allentown','PA','70267','USA',1216,100600.00),(161,'Technology Store','Homes','Max','6505556809','9408 Furth Circle',NULL,'Burlingame','CA','94217','USA',1165,84600.00),(166,'Gift Shop','Victoria','Wendy','3822241555','106 Linden Road Sandown','2nd Floor','Singapore',NULL,'069045','Singapore',1612,97900.00),(167,'Pipe Store','Smalls','Victor','29218234737','Brehmen St. 121','PR 334 Sentrum','Bergen',NULL,'N 5804','Norway  ',1504,96800.00),(168,'American Souvenirs','Franco','Keith','2035557845','149 Spinnaker Dr.','Suite 101','New Haven','CT','97823','USA',1286,0.00),(169,'Coffee Shop','Castro','Isabel ','1823565555','Estrada da saúde n. 58',NULL,'Lisboa',NULL,'1756','Portugal',NULL,0.00),(171,'Hat Shop','Go','Martin','2023161555','184, chaussée de Tournai',NULL,'Lille',NULL,'59000','France',1370,82900.00);
/*!40000 ALTER TABLE `customers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employees`
--

DROP TABLE IF EXISTS `employees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `employees` (
  `employeeNumber` int(11) NOT NULL,
  `lastName` varchar(50) NOT NULL,
  `firstName` varchar(50) NOT NULL,
  `extension` varchar(10) NOT NULL,
  `email` varchar(100) NOT NULL,
  `officeCode` varchar(10) NOT NULL,
  `reportsTo` int(11) DEFAULT NULL,
  `jobTitle` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employees`
--

LOCK TABLES `employees` WRITE;
/*!40000 ALTER TABLE `employees` DISABLE KEYS */;
INSERT INTO `employees` VALUES (1370,'Murphy','Diane','x5800','dmurphy@gmail.com','1',1056,'President'),(1166,'Patterson','Mary','x4611','mpatterso@gmail.com','1',1002,'VP Sales'),(1611,'Firrelli','Jeff','x9273','jfirrelli@gmail.com','1',1002,'VP Marketing'),(1504,'Patterson','William','x4871','wpatterson@gmail.com','6',1056,'Sales Manager'),(1621,'Bondur','Gerard','x5408','gbondur@gmail.com','4',1056,'Sale Manager'),(1216,'Bow','Anthony','x5428','abow@gmail.com','1',1056,'Sales Manager'),(1165,'Jennings','Leslie','x3291','ljennings@gmail.com','1',1143,'Sales Rep'),(1286,'Thompson','Andy','x4065','lthompson@gmail.com','1',1143,'Sales Rep'),(1188,'Firrelli','Julie','x2173','jfirrelli@gmail.com','2',1143,'Sales Rep'),(1216,'Patterson','Steve','x4334','spatterson@gmail.com','2',1143,'Sales Rep');
/*!40000 ALTER TABLE `employees` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `offices`
--

DROP TABLE IF EXISTS `offices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `offices` (
  `officeCode` varchar(10) NOT NULL,
  `city` varchar(50) NOT NULL,
  `phone` varchar(50) NOT NULL,
  `addressLine1` varchar(50) NOT NULL,
  `addressLine2` varchar(50) DEFAULT NULL,
  `state` varchar(50) DEFAULT NULL,
  `country` varchar(50) NOT NULL,
  `postalCode` varchar(15) NOT NULL,
  `territory` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `offices`
--

LOCK TABLES `offices` WRITE;
/*!40000 ALTER TABLE `offices` DISABLE KEYS */;
INSERT INTO `offices` VALUES ('1','San Francisco','16502194782','100 Market Street','Suite 300','CA','USA','94080','NA'),('2','Boston','12158370825','1550 Court Place','Suite 102','MA','USA','02107','NA'),('3','NYC','12125553000','523 East 53rd Street','apt. 5A','NY','USA','10022','NA'),('4','Paris','33147234404','43 Rue Jouffroy','Dabbans',NULL,'France','75017','EMEA'),('5','Tokyo','81332245000','4-1 Kioicho',NULL,'Chiyoda-Ku','Japan','102-8578','Japan');
/*!40000 ALTER TABLE `offices` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orderdetails`
--

DROP TABLE IF EXISTS `orderdetails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orderdetails` (
  `orderNumber` int(11) NOT NULL,
  `productCode` varchar(15) NOT NULL,
  `quantityOrdered` int(11) NOT NULL,
  `priceEach` decimal(10,2) NOT NULL,
  `orderLineNumber` smallint(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orderdetails`
--

LOCK TABLES `orderdetails` WRITE;
/*!40000 ALTER TABLE `orderdetails` DISABLE KEYS */;
INSERT INTO `orderdetails` VALUES (10100,'S18_1749',30,136.00,3),(10100,'S18_2248',50,55.09,2),(10100,'S18_4409',22,75.46,4),(10100,'S24_3969',49,35.29,1),(10101,'S18_2325',25,108.06,4),(10101,'S18_2795',26,167.06,1),(10101,'S24_1937',45,32.53,3),(10101,'S24_2022',46,44.35,2),(10103,'S18_4600',36,98.07,5),(10104,'S24_4048',26,106.45,5),(10105,'S24_3816',50,75.47,1),(10106,'S24_1785',28,107.23,4);
/*!40000 ALTER TABLE `orderdetails` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orders` (
  `orderNumber` int(11) NOT NULL,
  `orderDate` date NOT NULL,
  `requiredDate` date NOT NULL,
  `shippedDate` date DEFAULT NULL,
  `status` varchar(15) NOT NULL,
  `comments` text,
  `customerNumber` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (10100,'2003-01-06','2003-01-13','2003-01-10','Shipped',NULL,363),(10103,'2003-01-29','2003-02-07','2003-02-02','Shipped',NULL,121),(10104,'2003-01-31','2003-02-09','2003-02-01','Shipped',NULL,141),(10105,'2003-02-11','2003-02-21','2003-02-12','Shipped',NULL,145),(10106,'2003-02-17','2003-02-24','2003-02-21','Shipped',NULL,278);
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payments`
--

DROP TABLE IF EXISTS `payments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `payments` (
  `customerNumber` int(11) NOT NULL,
  `checkNumber` varchar(50) NOT NULL,
  `paymentDate` date NOT NULL,
  `amount` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payments`
--

LOCK TABLES `payments` WRITE;
/*!40000 ALTER TABLE `payments` DISABLE KEYS */;
INSERT INTO `payments` VALUES (103,'HQ336336','2004-10-19',6066.78),(103,'JM555205','2003-06-05',14571.44),(103,'OM314933','2004-12-18',1676.14),(112,'BO864823','2004-12-17',14191.12),(112,'HQ55022','2003-06-06',32641.98),(114,'NR27552','2004-03-10',44894.74),(119,'DB933704','2004-11-14',19501.82),(121,'FD317790','2003-10-28',1491.38),(121,'KI831359','2004-11-04',17876.32),(119,'LN373447','2004-08-08',47924.19);
/*!40000 ALTER TABLE `payments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `productlines`
--

DROP TABLE IF EXISTS `productlines`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `productlines` (
  `productLine` varchar(50) NOT NULL,
  `textDescription` varchar(4000) DEFAULT NULL,
  `htmlDescription` mediumtext,
  `image` mediumblob
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productlines`
--

LOCK TABLES `productlines` WRITE;
/*!40000 ALTER TABLE `productlines` DISABLE KEYS */;
INSERT INTO `productlines` VALUES ('Tires','Description',NULL,NULL),('Soap','Description',NULL,NULL),('Groceries','Description',NULL,NULL),('Clothes','Description',NULL,NULL),('Toys','Description',NULL,NULL);
/*!40000 ALTER TABLE `productlines` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `products` (
  `productCode` varchar(15) NOT NULL,
  `productName` varchar(70) NOT NULL,
  `productLine` varchar(50) NOT NULL,
  `productScale` varchar(10) NOT NULL,
  `productVendor` varchar(50) NOT NULL,
  `productDescription` text NOT NULL,
  `quantityInStock` smallint(6) NOT NULL,
  `buyPrice` decimal(10,2) NOT NULL,
  `MSRP` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES ('S10_1678','The BEST Tire Ever','Tires','1:10','Tires4U','Description',7933,48.81,95.70),('S10_1949','The BEST Soap Ever','Soap','1:10','Soap4U','Description',7305,98.58,214.30),('S12_1666','The FRESHEST Groceries Ever','Groceries','1:12','Groceries4U','Decsription',1579,77.90,136.67),('S18_1342','The COOLEST CLothes Ever','Clothes','1:18','Clothes4U','Description',8693,60.62,102.74),('S18_1662','The BEST Toys Ever','Toys','1:18','Toys4U','Description',5330,77.27,157.69);
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-11-19 11:48:03
