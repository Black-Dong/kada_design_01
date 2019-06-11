/*
SQLyog Ultimate v11.33 (64 bit)
MySQL - 5.5.40 : Database - student_db
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`student_db` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `student_db`;

/*Table structure for table `tbl_bedroom` */

DROP TABLE IF EXISTS `tbl_bedroom`;

CREATE TABLE `tbl_bedroom` (
  `bed_id` int(11) NOT NULL AUTO_INCREMENT,
  `room_bed_name` varchar(32) DEFAULT NULL,
  `is_flag` varchar(10) DEFAULT 'N',
  `stu_id` int(11) DEFAULT '0',
  `room_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`bed_id`)
) ENGINE=InnoDB AUTO_INCREMENT=91 DEFAULT CHARSET=utf8;

/*Data for the table `tbl_bedroom` */

insert  into `tbl_bedroom`(`bed_id`,`room_bed_name`,`is_flag`,`stu_id`,`room_id`) values (1,'01','N',0,1),(2,'02','N',0,1),(3,'03','N',0,1),(4,'04','N',0,1),(5,'05','N',0,1),(6,'06','N',0,1),(7,'01','N',0,2),(8,'02','N',0,2),(9,'03','N',0,2),(10,'04','N',0,2),(11,'05','N',0,2),(12,'06','N',0,2),(13,'01','N',0,3),(14,'02','N',0,3),(15,'03','N',0,3),(16,'04','N',0,3),(17,'05','N',0,3),(18,'06','N',0,3),(19,'01','N',0,4),(20,'02','N',0,4),(21,'03','N',0,4),(22,'04','N',0,4),(23,'05','N',0,4),(24,'06','N',0,4),(25,'01','N',0,5),(26,'02','N',0,5),(27,'03','N',0,5),(28,'04','N',0,5),(29,'05','N',0,5),(30,'06','N',0,5),(31,'01','N',0,6),(32,'02','N',0,6),(33,'03','N',0,6),(34,'04','N',0,6),(35,'05','N',0,6),(36,'06','N',0,6),(37,'01','N',0,7),(38,'02','N',0,7),(39,'03','N',0,7),(40,'04','N',0,7),(41,'05','N',0,7),(42,'06','N',0,7),(43,'01','N',0,8),(44,'02','N',0,8),(45,'03','N',0,8),(46,'04','N',0,8),(47,'05','N',0,8),(48,'06','N',0,8),(49,'01','N',0,9),(50,'02','N',0,9),(51,'03','N',0,9),(52,'04','N',0,9),(53,'05','N',0,9),(54,'06','N',0,9),(55,'01','N',0,10),(56,'02','N',0,10),(57,'03','N',0,10),(58,'04','N',0,10),(59,'05','N',0,10),(60,'06','N',0,10),(61,'01','N',0,11),(62,'02','N',0,11),(63,'03','N',0,11),(64,'04','N',0,11),(65,'05','N',0,11),(66,'06','N',0,11),(67,'01','N',0,12),(68,'02','N',0,12),(69,'03','N',0,12),(70,'04','N',0,12),(71,'05','N',0,12),(72,'06','N',0,12),(73,'01','N',0,13),(74,'02','N',0,13),(75,'03','N',0,13),(76,'04','N',0,13),(77,'05','N',0,13),(78,'06','N',0,13),(79,'01','N',0,14),(80,'02','N',0,14),(81,'03','N',0,14),(82,'04','N',0,14),(83,'05','N',0,14),(84,'06','N',0,14),(85,'01','N',0,15),(86,'02','N',0,15),(87,'03','N',0,15),(88,'04','N',0,15),(89,'05','N',0,15),(90,'06','N',0,15);

/*Table structure for table `tbl_dormitory` */

DROP TABLE IF EXISTS `tbl_dormitory`;

CREATE TABLE `tbl_dormitory` (
  `dor_id` int(11) NOT NULL AUTO_INCREMENT,
  `dor_name` varchar(32) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`dor_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

/*Data for the table `tbl_dormitory` */

insert  into `tbl_dormitory`(`dor_id`,`dor_name`,`user_id`) values (1,'王子楼',1),(4,'公主楼',3);

/*Table structure for table `tbl_room` */

DROP TABLE IF EXISTS `tbl_room`;

CREATE TABLE `tbl_room` (
  `room_id` int(11) NOT NULL AUTO_INCREMENT,
  `room_name` varchar(32) DEFAULT NULL,
  `room_dor_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`room_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

/*Data for the table `tbl_room` */

insert  into `tbl_room`(`room_id`,`room_name`,`room_dor_id`) values (1,'101',1),(2,'102',1),(3,'103',1),(4,'104',1),(5,'105',1),(6,'201',1),(7,'202',1),(8,'203',1),(9,'204',1),(10,'205',1),(11,'301',1),(12,'302',1),(13,'303',1),(14,'304',1),(15,'305',1);

/*Table structure for table `tbl_student` */

DROP TABLE IF EXISTS `tbl_student`;

CREATE TABLE `tbl_student` (
  `stu_id` int(11) NOT NULL AUTO_INCREMENT,
  `stu_name` varchar(32) DEFAULT NULL,
  `stu_phone` varchar(32) DEFAULT NULL,
  `stu_family_phone` varchar(32) DEFAULT NULL,
  `stu_teacher_name` varchar(32) DEFAULT NULL,
  `stu_teacher_phone` varchar(32) DEFAULT NULL,
  `stu_gender` varchar(10) DEFAULT NULL,
  `stu_address` varchar(64) DEFAULT NULL,
  `room_name` varchar(32) DEFAULT NULL,
  `bed_room_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`stu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

/*Data for the table `tbl_student` */

/*Table structure for table `tbl_user` */

DROP TABLE IF EXISTS `tbl_user`;

CREATE TABLE `tbl_user` (
  `uid` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(32) DEFAULT NULL,
  `NAME` varchar(32) DEFAULT NULL,
  `PASSWORD` varchar(32) DEFAULT NULL,
  `STATUS` varchar(10) DEFAULT NULL,
  `create_date` varchar(32) DEFAULT NULL,
  `gender` varchar(10) DEFAULT NULL,
  `email` varchar(32) DEFAULT NULL,
  `telephone` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Data for the table `tbl_user` */

insert  into `tbl_user`(`uid`,`username`,`NAME`,`PASSWORD`,`STATUS`,`create_date`,`gender`,`email`,`telephone`) values (1,'jack','jack','1234','1','2019-03-04',NULL,NULL,NULL),(3,'rose','rose','1234','2',NULL,NULL,NULL,NULL);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
