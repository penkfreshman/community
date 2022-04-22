# ************************************************************
# Antares - SQL Client
# Version 0.5.1
# 
# https://antares-sql.app/
# https://github.com/Fabio286/antares
# 
# Host: 127.0.0.1 (MySQL Community Server - GPL 8.0.28)
# Database: community
# Generation time: 2022-04-08T16:23:58+08:00
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
SET NAMES utf8mb4;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table building
# ------------------------------------------------------------

DROP TABLE IF EXISTS `building`;

CREATE TABLE `building` (
  `id` int NOT NULL AUTO_INCREMENT,
  `numbers` varchar(50) DEFAULT NULL,
  `uints` varchar(50) DEFAULT NULL,
  `remarks` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb3;

LOCK TABLES `building` WRITE;
/*!40000 ALTER TABLE `building` DISABLE KEYS */;

INSERT INTO `building` (`id`, `numbers`, `uints`, `remarks`) VALUES
	(1, '16栋', '1单元', '无1'),
	(7, '17栋', '2单元', '无1'),
	(11, '18栋', '2单元', '无'),
	(12, '19栋', '1单元', '无'),
	(13, '20栋', '2单元', '无');

/*!40000 ALTER TABLE `building` ENABLE KEYS */;
UNLOCK TABLES;



# Dump of table carcharge
# ------------------------------------------------------------

DROP TABLE IF EXISTS `carcharge`;

CREATE TABLE `carcharge` (
  `id` int NOT NULL AUTO_INCREMENT,
  `pay_date` datetime DEFAULT NULL,
  `end_date` varchar(25) DEFAULT NULL,
  `money` double(10,2) DEFAULT NULL,
  `status` int DEFAULT NULL,
  `owner_id` int DEFAULT NULL,
  `remarks` varchar(255) DEFAULT NULL,
  `type` varchar(10) DEFAULT NULL COMMENT '收费类型',
  `park_id` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb3;

LOCK TABLES `carcharge` WRITE;
/*!40000 ALTER TABLE `carcharge` DISABLE KEYS */;

INSERT INTO `carcharge` (`id`, `pay_date`, `end_date`, `money`, `status`, `owner_id`, `remarks`, `type`, `park_id`) VALUES
	(2, '2021-09-30 16:00:00', '2021-12-31', 1200, 1, 1, '221', '停车费', 1),
	(3, '2021-09-30 16:00:00', '2021-12-31', 1200, 1, 2, '221', '停车费', 2),
	(8, '2021-10-31 16:00:00', '2021-11-30', 300, 0, 1, '112', '停车费', 1),
	(9, '2022-02-24 16:00:00', '2022-06-26', 50, 0, 1, '11', '停车费', 1),
	(10, '2022-02-24 16:00:00', '2022-06-26', 50, 0, 2, '11', '停车费', 2);

/*!40000 ALTER TABLE `carcharge` ENABLE KEYS */;
UNLOCK TABLES;



# Dump of table clockin
# ------------------------------------------------------------

DROP TABLE IF EXISTS `clockin`;

CREATE TABLE `clockin` (
  `id` int NOT NULL AUTO_INCREMENT,
  `clock_in_time` datetime DEFAULT NULL,
  `owner_id` int DEFAULT NULL,
  `house_id` int DEFAULT NULL,
  `building_id` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb3;

LOCK TABLES `clockin` WRITE;
/*!40000 ALTER TABLE `clockin` DISABLE KEYS */;

INSERT INTO `clockin` (`id`, `clock_in_time`, `owner_id`, `house_id`, `building_id`) VALUES
	(1, '2021-04-01 02:42:55', 1, 1, 1),
	(4, '2021-04-20 14:59:13', 2, 2, 7),
	(11, '2021-04-25 07:22:02', 1, 1, 1),
	(12, '2021-04-26 07:22:29', 2, 2, 7),
	(14, '2021-04-27 07:34:24', 1, 1, 1),
	(15, '2021-04-27 07:35:23', 2, 2, 7),
	(16, '2022-03-21 06:35:22', 1, 1, 1),
	(17, '2022-03-29 08:24:34', 1, 1, 1);

/*!40000 ALTER TABLE `clockin` ENABLE KEYS */;
UNLOCK TABLES;



# Dump of table clockinnew
# ------------------------------------------------------------

DROP TABLE IF EXISTS `clockinnew`;

CREATE TABLE `clockinnew` (
  `id` int NOT NULL AUTO_INCREMENT,
  `report_date` datetime DEFAULT NULL,
  `owner_id` int DEFAULT NULL,
  `type1` int DEFAULT NULL COMMENT '是否为疑似病例如咳嗽，发热（0或1）',
  `type2` int DEFAULT NULL COMMENT '是否确诊为肺炎病例',
  `today_address` varchar(100) DEFAULT NULL,
  `remarks` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb3;

LOCK TABLES `clockinnew` WRITE;
/*!40000 ALTER TABLE `clockinnew` DISABLE KEYS */;

INSERT INTO `clockinnew` (`id`, `report_date`, `owner_id`, `type1`, `type2`, `today_address`, `remarks`) VALUES
	(1, '2021-04-26 13:20:32', 2, 0, 0, '江西省南昌市御景花园小区16栋1单元601', '无'),
	(6, '2021-04-26 16:00:00', 2, 0, 0, '测试', ''),
	(16, '2021-04-27 16:00:00', 2, 0, 0, '测试', '无'),
	(18, '2021-10-29 16:00:00', 2, 0, 0, '江苏盐城', '无'),
	(19, '2021-10-29 16:00:00', 9, 0, 0, '深圳宝安', '无'),
	(20, '2022-03-28 16:00:00', 1, 0, 0, 'cq', '');

/*!40000 ALTER TABLE `clockinnew` ENABLE KEYS */;
UNLOCK TABLES;



# Dump of table complaint
# ------------------------------------------------------------

DROP TABLE IF EXISTS `complaint`;

CREATE TABLE `complaint` (
  `id` int NOT NULL AUTO_INCREMENT,
  `com_id` varchar(25) DEFAULT NULL,
  `com_date` datetime DEFAULT NULL,
  `handle_date` datetime DEFAULT NULL,
  `owner_id` int DEFAULT NULL,
  `status` int DEFAULT NULL,
  `clr` int DEFAULT NULL COMMENT '处理人',
  `remarks` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3;

LOCK TABLES `complaint` WRITE;
/*!40000 ALTER TABLE `complaint` DISABLE KEYS */;

INSERT INTO `complaint` (`id`, `com_id`, `com_date`, `handle_date`, `owner_id`, `status`, `clr`, `remarks`) VALUES
	(1, '1', '2021-11-22 11:47:46', NULL, 1, 1, NULL, '垃圾经常乱放'),
	(2, '2', '2021-11-17 11:48:15', '2021-11-21 11:48:21', 1, 1, 111, '绿植被拔了'),
	(4, '1', '2021-11-24 14:21:01', NULL, 2, 0, NULL, '垃圾乱放没解决'),
	(5, '1', '2022-03-29 08:42:09', NULL, 1, 0, NULL, '这条用于测试');

/*!40000 ALTER TABLE `complaint` ENABLE KEYS */;
UNLOCK TABLES;



# Dump of table complaint_type
# ------------------------------------------------------------

DROP TABLE IF EXISTS `complaint_type`;

CREATE TABLE `complaint_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `remarks` varchar(250) DEFAULT NULL,
  `status` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;

LOCK TABLES `complaint_type` WRITE;
/*!40000 ALTER TABLE `complaint_type` DISABLE KEYS */;

INSERT INTO `complaint_type` (`id`, `name`, `remarks`, `status`) VALUES
	(1, '垃圾乱放', NULL, NULL),
	(2, '绿植太差', NULL, NULL);

/*!40000 ALTER TABLE `complaint_type` ENABLE KEYS */;
UNLOCK TABLES;



# Dump of table house
# ------------------------------------------------------------

DROP TABLE IF EXISTS `house`;

CREATE TABLE `house` (
  `id` int NOT NULL AUTO_INCREMENT,
  `storey` int DEFAULT NULL,
  `numbers` varchar(50) DEFAULT NULL,
  `status` int DEFAULT NULL,
  `into_date` datetime DEFAULT NULL,
  `building_id` int DEFAULT NULL,
  `remarks` varchar(50) DEFAULT NULL,
  `area` double(10,2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3;

LOCK TABLES `house` WRITE;
/*!40000 ALTER TABLE `house` DISABLE KEYS */;

INSERT INTO `house` (`id`, `storey`, `numbers`, `status`, `into_date`, `building_id`, `remarks`, `area`) VALUES
	(1, 111, '401', 1, '2021-10-01 09:27:52', 1, NULL, 80),
	(2, NULL, '402', 1, '2021-11-04 16:00:00', 7, '', 90),
	(3, NULL, '201', 1, '2021-11-17 15:52:58', 1, NULL, 100),
	(4, NULL, '602', 1, '2021-05-05 16:00:00', 11, '', 98),
	(6, NULL, '101', 1, '2022-04-07 16:00:00', 7, '', 50);

/*!40000 ALTER TABLE `house` ENABLE KEYS */;
UNLOCK TABLES;



# Dump of table owner
# ------------------------------------------------------------

DROP TABLE IF EXISTS `owner`;

CREATE TABLE `owner` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(25) DEFAULT NULL,
  `tel` varchar(25) DEFAULT NULL,
  `sex` varchar(5) DEFAULT NULL,
  `identity` varchar(25) DEFAULT NULL,
  `house_id` int DEFAULT NULL,
  `remarks` varchar(255) DEFAULT NULL,
  `password` varchar(28) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb3;

LOCK TABLES `owner` WRITE;
/*!40000 ALTER TABLE `owner` DISABLE KEYS */;

INSERT INTO `owner` (`id`, `username`, `tel`, `sex`, `identity`, `house_id`, `remarks`, `password`) VALUES
	(1, 'mary', '15270892323', '女', '12345678910', 1, NULL, '12345'),
	(2, 'yx5411', '13767134678', '男', '10987654321', 2, NULL, '12345'),
	(9, 'yx7845', '15270839876', '男', '11111111111', 4, '', '12345'),
	(10, 'pk145', '15270839876', '男', '00000000000', 4, '', '12345'),
	(13, '彭库', '17347982200', '男', '2222222222222', 3, '', '123456'),
	(15, 'pk145', '15270839876', '男', '00000000000', 6, '', '123456');

/*!40000 ALTER TABLE `owner` ENABLE KEYS */;
UNLOCK TABLES;



# Dump of table parking
# ------------------------------------------------------------

DROP TABLE IF EXISTS `parking`;

CREATE TABLE `parking` (
  `id` int NOT NULL AUTO_INCREMENT,
  `numbers` varchar(25) DEFAULT NULL,
  `status` int DEFAULT NULL,
  `owner_id` int DEFAULT NULL,
  `remarks` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;

LOCK TABLES `parking` WRITE;
/*!40000 ALTER TABLE `parking` DISABLE KEYS */;

INSERT INTO `parking` (`id`, `numbers`, `status`, `owner_id`, `remarks`) VALUES
	(1, 'A11111', 1, 1, ''),
	(2, 'A10002', 1, 2, '');

/*!40000 ALTER TABLE `parking` ENABLE KEYS */;
UNLOCK TABLES;



# Dump of table property_info
# ------------------------------------------------------------

DROP TABLE IF EXISTS `property_info`;

CREATE TABLE `property_info` (
  `id` int NOT NULL AUTO_INCREMENT,
  `type_id` int DEFAULT NULL,
  `money` double(10,2) DEFAULT NULL,
  `start_date` datetime DEFAULT NULL,
  `end_date` datetime DEFAULT NULL,
  `status` int DEFAULT NULL,
  `house_id` int DEFAULT NULL,
  `remarks` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=75 DEFAULT CHARSET=utf8mb3;

LOCK TABLES `property_info` WRITE;
/*!40000 ALTER TABLE `property_info` DISABLE KEYS */;

INSERT INTO `property_info` (`id`, `type_id`, `money`, `start_date`, `end_date`, `status`, `house_id`, `remarks`) VALUES
	(63, 1, 208, '2022-02-28 16:00:00', '2022-05-31 16:00:00', 0, 1, ''),
	(64, 1, 234, '2022-02-28 16:00:00', '2022-05-31 16:00:00', 0, 2, ''),
	(65, 1, 260, '2022-02-28 16:00:00', '2022-05-31 16:00:00', 0, 3, ''),
	(66, 1, 254.8, '2022-02-28 16:00:00', '2022-05-31 16:00:00', 0, 4, ''),
	(68, 3, 106, '2022-04-07 16:00:00', '2022-04-07 16:00:00', 0, 1, ''),
	(69, 3, 55.5, '2022-04-07 16:00:00', '2022-04-07 16:00:00', 0, 2, ''),
	(70, 4, 5460, '2022-04-13 16:00:00', '2022-04-13 16:00:00', 0, 4, ''),
	(71, 2, 99, '2022-04-07 16:00:00', '2022-04-07 16:00:00', 0, 2, ''),
	(72, 2, 99, '2022-04-07 16:00:00', '2022-04-07 16:00:00', 0, 4, ''),
	(73, 3, 51, '2022-04-07 16:00:00', '2022-04-07 16:00:00', 0, 6, ''),
	(74, 4, 2860, '2022-04-07 16:00:00', '2022-04-07 16:00:00', 0, 6, '');

/*!40000 ALTER TABLE `property_info` ENABLE KEYS */;
UNLOCK TABLES;



# Dump of table property_type
# ------------------------------------------------------------

DROP TABLE IF EXISTS `property_type`;

CREATE TABLE `property_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(25) DEFAULT NULL,
  `price` double(10,2) DEFAULT NULL,
  `unit` varchar(25) DEFAULT NULL,
  `remarks` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3;

LOCK TABLES `property_type` WRITE;
/*!40000 ALTER TABLE `property_type` DISABLE KEYS */;

INSERT INTO `property_type` (`id`, `name`, `price`, `unit`, `remarks`) VALUES
	(1, '物业费', 2.6, '一平方', NULL),
	(2, '水费', 4.5, '一吨', NULL),
	(3, '电费', 0.5, '一度', NULL),
	(4, '车位费', 260, '一个', NULL);

/*!40000 ALTER TABLE `property_type` ENABLE KEYS */;
UNLOCK TABLES;



# Dump of table records
# ------------------------------------------------------------

DROP TABLE IF EXISTS `records`;

CREATE TABLE `records` (
  `id` int NOT NULL AUTO_INCREMENT,
  `type_id` int DEFAULT NULL,
  `num` double(5,2) DEFAULT NULL,
  `num2` double(5,2) DEFAULT NULL,
  `house_id` int DEFAULT NULL,
  `up_time` datetime DEFAULT NULL,
  `on_time` datetime DEFAULT NULL,
  `check_time` datetime DEFAULT NULL,
  `meter` varchar(25) DEFAULT NULL,
  `remarks` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb3;

LOCK TABLES `records` WRITE;
/*!40000 ALTER TABLE `records` DISABLE KEYS */;

INSERT INTO `records` (`id`, `type_id`, `num`, `num2`, `house_id`, `up_time`, `on_time`, `check_time`, `meter`, `remarks`) VALUES
	(13, 3, 0, 212, 1, '2022-04-07 16:00:00', '2022-04-07 16:00:00', '2022-04-08 07:28:54', 'pk', ''),
	(14, 3, 0, 111, 2, '2022-04-07 16:00:00', '2022-04-07 16:00:00', '2022-04-08 07:29:12', 'pk', ''),
	(16, 2, 0, 22, 2, '2022-04-07 16:00:00', '2022-04-07 16:00:00', '2022-04-08 07:31:05', 'pk', ''),
	(18, 3, 0, 102, 6, '2022-04-07 16:00:00', '2022-04-07 16:00:00', '2022-04-08 07:33:29', '张三', ''),
	(19, 4, 0, 11, 6, '2022-04-07 16:00:00', '2022-04-07 16:00:00', '2022-04-08 07:33:58', '张三', '');

/*!40000 ALTER TABLE `records` ENABLE KEYS */;
UNLOCK TABLES;



# Dump of table repair
# ------------------------------------------------------------

DROP TABLE IF EXISTS `repair`;

CREATE TABLE `repair` (
  `id` int NOT NULL AUTO_INCREMENT,
  `com_id` varchar(25) DEFAULT NULL,
  `com_date` datetime DEFAULT NULL,
  `handle_date` datetime DEFAULT NULL,
  `owner_id` int DEFAULT NULL,
  `status` int DEFAULT NULL,
  `clr` int DEFAULT NULL,
  `remarks` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb3;

LOCK TABLES `repair` WRITE;
/*!40000 ALTER TABLE `repair` DISABLE KEYS */;

INSERT INTO `repair` (`id`, `com_id`, `com_date`, `handle_date`, `owner_id`, `status`, `clr`, `remarks`) VALUES
	(1, '1', '2021-11-19 11:47:37', '2021-11-21 11:47:41', 1, 1, 1, '11'),
	(2, '1', '2021-11-18 11:48:02', '2021-11-27 11:48:06', 1, 0, 1, '11'),
	(3, '2', '2021-11-10 11:48:45', '2021-11-27 11:48:48', 1, 1, 1, '11'),
	(4, '3', '2021-11-11 14:56:31', '2021-11-27 14:56:35', 1, 0, 1, '22'),
	(6, '3', '2021-11-11 14:56:31', '2021-11-22 06:14:52', 1, 0, 1, '22'),
	(7, '3', '2021-11-11 14:56:31', '2021-11-27 14:56:35', 1, 1, 1, '22'),
	(8, '4', '2021-11-23 10:00:07', '2021-11-25 10:00:13', 1, 1, 1, '33'),
	(9, '4', '2021-11-23 10:00:07', '2021-11-25 10:00:13', 2, 1, 1, '33'),
	(10, '4', '2021-11-23 10:00:07', '2021-11-25 10:00:13', 1, 1, 1, '33'),
	(13, '7', '2021-11-05 10:00:59', '2021-11-28 10:01:03', 1, 1, 1, '22'),
	(14, '3', '2021-04-29 10:54:02', NULL, 2, 0, NULL, '电梯坏了');

/*!40000 ALTER TABLE `repair` ENABLE KEYS */;
UNLOCK TABLES;



# Dump of table repairtype
# ------------------------------------------------------------

DROP TABLE IF EXISTS `repairtype`;

CREATE TABLE `repairtype` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `remarks` varchar(250) DEFAULT NULL,
  `status` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb3;

LOCK TABLES `repairtype` WRITE;
/*!40000 ALTER TABLE `repairtype` DISABLE KEYS */;

INSERT INTO `repairtype` (`id`, `name`, `remarks`, `status`) VALUES
	(1, '公共部位维修', NULL, 1),
	(2, '共用设施设备 ', NULL, 1),
	(3, '电梯', NULL, 1),
	(4, '自用部位维修', NULL, 1),
	(5, '门窗维修', NULL, 1),
	(6, '电话维修', NULL, 1),
	(7, '电路维修', NULL, 1);

/*!40000 ALTER TABLE `repairtype` ENABLE KEYS */;
UNLOCK TABLES;



# Dump of table userinfo
# ------------------------------------------------------------

DROP TABLE IF EXISTS `userinfo`;

CREATE TABLE `userinfo` (
  `id` int NOT NULL AUTO_INCREMENT,
  `password` varchar(20) NOT NULL,
  `type` bit(1) NOT NULL,
  `remarks` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `username` varchar(20) NOT NULL,
  `identity` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

LOCK TABLES `userinfo` WRITE;
/*!40000 ALTER TABLE `userinfo` DISABLE KEYS */;

INSERT INTO `userinfo` (`id`, `password`, `type`, `remarks`, `username`, `identity`) VALUES
	(1, '12345', b'00000000', NULL, 'penk', '12345678910'),
	(2, '12345', b'00000000', NULL, 'penk2', '10987654321'),
	(3, '12345', b'00000000', NULL, 'pengkun', '11111111111'),
	(4, '12345', b'00000000', NULL, 'pengkun2', '00000000000'),
	(5, '12345', b'00000001', NULL, 'admin', ''),
	(9, '123456', b'00000000', '', 'pk145', '00000000000');

/*!40000 ALTER TABLE `userinfo` ENABLE KEYS */;
UNLOCK TABLES;



# Dump of table userinfo2
# ------------------------------------------------------------

DROP TABLE IF EXISTS `userinfo2`;

CREATE TABLE `userinfo2` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(20) DEFAULT NULL,
  `password` varchar(20) DEFAULT NULL,
  `type` int DEFAULT NULL,
  `remarks` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb3;

LOCK TABLES `userinfo2` WRITE;
/*!40000 ALTER TABLE `userinfo2` DISABLE KEYS */;

INSERT INTO `userinfo2` (`id`, `username`, `password`, `type`, `remarks`) VALUES
	(1, 'admin', '12345', 1, NULL),
	(2, 'yx5411', '12345', 0, NULL),
	(3, 'mary', '12345', 0, NULL),
	(12, 'yx7845', '12345', 0, ''),
	(13, 'pk145', '123456', 0, ''),
	(14, 'admin', '12345', 1, NULL);

/*!40000 ALTER TABLE `userinfo2` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

# Dump completed on 2022-04-08T16:23:58+08:00
