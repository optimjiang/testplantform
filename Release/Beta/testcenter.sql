-- MySQL dump 10.13  Distrib 8.0.25, for macos11 (x86_64)
--
-- Host: 127.0.0.1    Database: testcenter
-- ------------------------------------------------------
-- Server version	5.7.28

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
-- Table structure for table `account`
--

DROP TABLE IF EXISTS `account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `account` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户Id',
  `email` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '邮箱',
  `name` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '用户名',
  `password` varchar(512) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '密码',
  `register_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '注册时间',
  `login_time` datetime DEFAULT NULL COMMENT '上一次登录时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `ix_account_name` (`name`),
  UNIQUE KEY `ix_account_email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COMMENT='用户表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account`
--

LOCK TABLES `account` WRITE;
/*!40000 ALTER TABLE `account` DISABLE KEYS */;
INSERT INTO `account` VALUES (1,'admin@qq.com','admin','$2a$10$wg0f10n.30UbU.9hPpucbef/ya62LdTKs72xJfjxvTFsL0Xaewbra','2019-07-01 00:00:00','2021-09-26 12:04:30'),(2,'editor@qq.com','editor','$2a$10$/m4SgZ.ZFVZ7rcbQpJW2tezmuhf/UzQtpAtXb0WZiAE3TeHxq2DYu','2019-07-02 00:00:00','2019-07-02 00:00:00'),(3,'test@qq.com','test','$2a$10$NGJEkH3bl7rwgk0ZYChT4.tWTm28jOY9GaeMfj2kYZ2qFB4Ed9sW2','2019-07-03 00:00:00','2021-04-23 15:14:05'),(4,'2712066939@qq.com','test2','$2a$10$vnmEvOON9w9RxTiT1kfcY.DHtBuuZ6ebqZVI92B9lZyeRPhnzEW96','2020-03-28 16:21:32','2020-04-21 22:20:22'),(5,'test@123.com','testttt','$2a$10$PYJn21dsOACyhPmI02HAD.3Jm.oo.h2xEXUnj0wkmZr4PoSPFWHTa','2020-04-20 14:46:51',NULL),(6,'123@133.com','testaaa','$2a$10$QzffPC8b8zaxH867/KeV1eTTdMXNY/0ikWskcN51ETGMe2YsMxdlK','2020-04-20 14:48:19',NULL),(7,'123@123.com','aaa','$2a$10$HPKeTNj7TGKcZmqtUVMgmOSbRnyTxfQM8obo47hL2kzuEnzdzI19S','2020-04-20 14:56:04',NULL),(8,'q@1.com','q11111','$2a$10$bGkDt6OtQ4xfDxk8DxL1fudo/WLTqjUo/vnxIzvDkeUCwNfAwfU7.','2020-04-20 15:47:37',NULL),(10,'22223333@123.com','22222','$2a$10$XqfUMYIMClikSnZTQAhNMOYKcGddYHQXItS4UbSkvQTWTJH5BkLsa','2020-04-20 15:48:03',NULL),(11,'12121@12121.COM','2121212','$2a$10$QP5CFuA80yEiC4oGWc8rv.U01dr1YRXOLFKzpjxY0fDO.Vj7knBcW','2020-04-21 18:12:34',NULL),(12,'123131@123213.com','test001','$2a$10$ftjsgs9xyWeQomGSUwfVL.0jM88E13WKzKX0P1rSBDPIXJKEBCH6a','2020-04-21 18:59:10','2020-04-21 22:21:01'),(13,'1211@1231.com','xxxx','$2a$10$Fx4zpCfum/1.AhZNXCCLe.nQqof5LXzRWr8tsR/jP1rUJLcs0.T.y','2020-04-22 22:38:59',NULL),(14,'admin@123.com','newtest','$2a$10$dvTjUy/M2QNrnFT5PK9JUueBbIL5/CmuOjG1dfRyol4kg8Css/fuG','2020-12-22 11:49:36','2020-12-22 11:50:03'),(15,'admin@1111.com','12121','$2a$10$aMX8d4JhE/uEh7ZMrUps9OgVogUUHaI.b74n5BqP5/xC.tChfzfp6','2021-09-23 12:22:59',NULL);
/*!40000 ALTER TABLE `account` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `account_role`
--

DROP TABLE IF EXISTS `account_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `account_role` (
  `account_id` bigint(20) unsigned NOT NULL COMMENT '用户Id',
  `role_id` bigint(20) unsigned NOT NULL COMMENT '角色Id',
  PRIMARY KEY (`account_id`,`role_id`),
  KEY `role_id` (`role_id`),
  CONSTRAINT `account_role_fk_1` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `account_role_fk_2` FOREIGN KEY (`account_id`) REFERENCES `account` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='用户角色表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account_role`
--

LOCK TABLES `account_role` WRITE;
/*!40000 ALTER TABLE `account_role` DISABLE KEYS */;
INSERT INTO `account_role` VALUES (1,1),(2,2),(5,2),(6,2),(7,2),(10,2),(11,2),(15,2);
/*!40000 ALTER TABLE `account_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `api`
--

DROP TABLE IF EXISTS `api`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `api` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Id',
  `deployunitid` bigint(20) unsigned NOT NULL COMMENT 'DeployUnitId',
  `deployunitname` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '发布单元名',
  `apiname` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '接口名',
  `visittype` varchar(10) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '访问方式，字典表获取',
  `apistyle` varchar(10) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT 'restful,普通方式',
  `path` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT 'url访问路径',
  `requestcontenttype` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '请求数据格式，form表单，json',
  `responecontenttype` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '响应数据格式，form表单，json',
  `memo` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '备注',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `lastmodify_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '上一次修改时间',
  `creator` varchar(20) DEFAULT NULL COMMENT '创建者',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COMMENT='发布单元表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `api`
--

LOCK TABLES `api` WRITE;
/*!40000 ALTER TABLE `api` DISABLE KEYS */;
INSERT INTO `api` VALUES (1,22,'marketingservice','获取短链','get','普通方式','redeem/ui/retrySendSmsOrFindShortUrl','','json','','2020-12-07 16:06:15','2021-04-26 16:04:27','admin'),(2,1,'accountservice','新获取短链','get','普通方式','redeem/ui/retrySendSmsOrFindShortUrl','','json','','2021-04-02 19:10:52','2021-04-26 16:04:34','admin'),(3,19,'cornerservice','新获取短链','get','普通方式','111','','json','','2021-04-18 23:06:49','2021-04-18 23:06:49',NULL),(5,1,'accountservice','test1','get','普通方式','redeem/ui/retrySendSmsOrFindShortUrl','','json','','2021-04-02 19:10:52','2021-04-19 23:04:30',NULL),(6,2,'paymentservice','test1','get','普通方式','redeem/ui/retrySendSmsOrFindShortUrl','','json','','2021-04-02 19:10:52','2021-04-02 19:04:09',NULL),(7,19,'cornerservice','test10','get','普通方式','redeem/ui/retrySendSmsOrFindShortUrl','','json','','2021-04-02 19:10:52','2021-04-02 19:04:09',NULL),(8,1,'accountservice','testnopara','get','restful','/test','','json','','2021-04-19 23:55:06','2021-04-19 23:55:06',NULL),(9,19,'cornerservice','copynopara','get','restful','/test','','json','','2021-04-19 23:55:06','2021-04-19 23:55:06',NULL),(10,20,'regressionservice','x','get','restful','x','','json','','2021-04-26 16:34:28','2021-04-26 16:34:28','admin'),(11,22,'marketingservice','执行力登陆','post','restful','/login','json','json','','2021-07-14 16:18:54','2021-07-14 16:18:54','admin'),(12,27,'testcenterservice','测试中心登陆','post','普通方式','/account/token','json','json','登陆','2021-07-15 16:42:08','2021-07-15 16:42:08','admin'),(13,27,'testcenterservice','获取执行计划统计数据','get','普通方式','/executeplan/getstaticsplan','','json','获取执行计划统计数据','2021-07-15 16:48:54','2021-07-15 16:48:54','admin');
/*!40000 ALTER TABLE `api` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `api_casedata`
--

DROP TABLE IF EXISTS `api_casedata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `api_casedata` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Id',
  `caseid` bigint(20) unsigned NOT NULL COMMENT '用例Id',
  `casename` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '用例名',
  `apiparam` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT 'api参数',
  `apiparamvalue` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '用例参数值',
  `propertytype` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT 'api属性类型，header，body',
  `memo` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '备注',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `lastmodify_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '上一次修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=67 DEFAULT CHARSET=utf8mb4 COMMENT='api用例数据表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `api_casedata`
--

LOCK TABLES `api_casedata` WRITE;
/*!40000 ALTER TABLE `api_casedata` DISABLE KEYS */;
INSERT INTO `api_casedata` VALUES (1,1,'获取用户信息正确','goodsThirdPartyType','ALIPAY','Params','memo','2020-12-07 16:12:05','2020-12-07 16:12:05'),(2,1,'获取用户信息正确','orderId','2012030033263636700','Params','memo','2020-12-07 16:12:05','2020-12-07 16:12:05'),(3,1,'获取用户信息正确','status','OFF','Params','memo','2020-12-07 16:12:05','2020-12-07 16:12:05'),(4,2,'获取用户信息性能','goodsThirdPartyType','ALIPAY','Params','memo','2020-12-07 16:12:38','2020-12-07 16:12:38'),(5,2,'获取用户信息性能','orderId','2012030033263636700','Params','memo','2020-12-07 16:12:38','2020-12-07 16:12:38'),(6,2,'获取用户信息性能','status','OFF','Params','memo','2020-12-07 16:12:38','2020-12-07 16:12:38'),(58,39,'获取用户信息正确','goodsThirdPartyType','ALIPAY','Params','memo','2020-12-07 16:12:05','2020-12-07 16:12:05'),(59,39,'获取用户信息正确','orderId','2012030033263636700','Params','memo','2020-12-07 16:12:05','2020-12-07 16:12:05'),(60,39,'获取用户信息正确','status','OFF','Params','memo','2020-12-07 16:12:05','2020-12-07 16:12:05'),(61,43,'正确用户名密码登陆','name','admin','Params','memo','2021-07-15 16:07:40','2021-07-15 16:07:40'),(62,43,'正确用户名密码登陆','password','admin123','Params','memo','2021-07-15 16:07:40','2021-07-15 16:07:40'),(65,44,'获取执行计划统计数据列表','Authorization','$logintoken','Header','memo','2021-07-21 15:07:44','2021-07-21 15:07:44'),(66,2,'获取用户信息性能111','token','1','Header','memo','2021-09-22 11:09:50','2021-09-22 11:09:50');
/*!40000 ALTER TABLE `api_casedata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `api_params`
--

DROP TABLE IF EXISTS `api_params`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `api_params` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Id',
  `apiid` bigint(20) unsigned NOT NULL COMMENT 'apiId',
  `apiname` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT 'api名',
  `deployunitid` bigint(20) unsigned NOT NULL COMMENT '发布单元Id',
  `deployunitname` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '发布单元名',
  `propertytype` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT 'api属性类型，header，body',
  `keyname` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT 'key名',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `lastmodify_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '上一次修改时间',
  `creator` varchar(20) DEFAULT NULL COMMENT '创建者',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COMMENT='api参数表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `api_params`
--

LOCK TABLES `api_params` WRITE;
/*!40000 ALTER TABLE `api_params` DISABLE KEYS */;
INSERT INTO `api_params` VALUES (1,1,'获取短链',22,'marketingservice','Params','goodsThirdPartyType,orderId,status','2020-12-07 16:06:41','2021-04-26 16:04:40','admin'),(2,2,'新获取短链',1,'accountservice','Params','goodsThirdPartyType,orderId,status','2021-04-02 19:11:30','2021-04-26 19:04:09','admin'),(4,5,'test1',1,'accountservice','Params','goodsThirdPartyType,orderId,status','2021-04-02 19:11:30','2021-04-02 19:11:30',NULL),(5,6,'test1',1,'accountservice','Params','goodsThirdPartyType,orderId,status','2021-04-02 19:11:30','2021-04-02 19:11:30',NULL),(6,7,'test10',19,'cornerservice','Params','goodsThirdPartyType,orderId,status','2021-04-02 19:11:30','2021-04-02 19:11:30',NULL),(7,6,'test1',2,'paymentservice','Header','1,2','2021-04-26 16:46:56','2021-04-26 16:46:56','admin'),(8,11,'执行力登陆',22,'marketingservice','Header','token','2021-07-14 16:19:17','2021-07-14 16:19:17','admin'),(9,1,'获取短链',22,'marketingservice','Header','token','2021-07-14 16:21:12','2021-07-14 16:21:12','admin'),(10,12,'测试中心登陆',27,'testcenterservice','Params','name,password','2021-07-15 16:42:46','2021-07-15 16:42:46','admin'),(11,13,'获取执行计划统计数据',27,'testcenterservice','Header','Authorization','2021-07-15 16:49:34','2021-07-15 16:49:34','admin');
/*!40000 ALTER TABLE `api_params` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `apicases`
--

DROP TABLE IF EXISTS `apicases`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `apicases` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Id',
  `apiid` bigint(20) unsigned NOT NULL COMMENT 'apiid',
  `apiname` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT 'API',
  `deployunitid` bigint(20) unsigned NOT NULL COMMENT '发布单元id',
  `deployunitname` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '发布单元',
  `casename` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '用例名',
  `casejmxname` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '用例jmx名，和jmx文件名对齐',
  `casetype` varchar(10) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '类型，功能，性能',
  `threadnum` bigint(20) unsigned NOT NULL COMMENT '线程数',
  `loops` bigint(20) unsigned NOT NULL COMMENT '循环数',
  `casecontent` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '用例内容，以英文逗号分开，提供jar获取自定义期望结果A：1的值，入参为冒号左边的内容',
  `expect` varchar(500) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '期望值',
  `middleparam` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '中间变量',
  `level` varchar(10) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '优先级',
  `memo` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '备注',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `lastmodify_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '上一次修改时间',
  `creator` varchar(10) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '创建者',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8mb4 COMMENT='api用例表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `apicases`
--

LOCK TABLES `apicases` WRITE;
/*!40000 ALTER TABLE `apicases` DISABLE KEYS */;
INSERT INTO `apicases` VALUES (1,1,'获取短链',22,'marketingservice','获取用户信息正确','httpapi','功能',1,1,'获取用户信息正确','$.message=Success|$.result=http://b6i.cn/4Vgxk|$.code=0','','','','2020-12-07 16:07:39','2021-05-26 23:05:18','admin'),(2,1,'获取短链',22,'marketingservice','获取用户信息性能111','httpapi','性能',3,4,'获取用户信息正确','$.code=500|$.message=服务器伐开心,我们正在想办法','','','','2020-12-07 16:36:06','2021-07-18 11:07:45','admin'),(39,1,'获取短链',22,'marketingservice','复制用户信息正确','httpapi','功能',1,1,'获取用户信息正确','$.message=Success|$.result=http://b6i.cn/4Vgxk|$.code=0','','','','2020-12-07 16:07:39','2021-05-26 23:05:18','admin'),(40,1,'获取短链',22,'marketingservice','测试获取短链接','httpapi','功能',1,1,'测试获取短链接','1','','','','2021-07-14 16:20:34','2021-07-14 16:20:34','admin'),(41,1,'获取短链',22,'marketingservice','ceshi','httpapi','功能',1,1,'test','1','','1221','33','2021-07-15 16:31:42','2021-07-15 16:07:41','admin'),(42,11,'执行力登陆',22,'marketingservice','login','httpapi','功能',1,1,'login','login','','22','cccc','2021-07-15 16:32:32','2021-07-15 16:07:34','admin'),(43,12,'测试中心登陆',27,'testcenterservice','正确用户名密码登陆','httpapi','功能',1,1,'正确用户名密码登陆返回token','$.code=200','','1','正确用户名密码登陆返回token','2021-07-15 16:44:22','2021-07-15 16:44:22','admin'),(44,13,'获取执行计划统计数据',27,'testcenterservice','获取执行计划统计数据列表','httpapi','功能',1,1,'获取执行计划统计数据列表','$.code=200|$.data[0]=兑换服务回归测试','','1','兑换服务回归测试','2021-07-15 16:51:32','2021-07-21 18:07:33','admin');
/*!40000 ALTER TABLE `apicases` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `apicases_condition`
--

DROP TABLE IF EXISTS `apicases_condition`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `apicases_condition` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Id',
  `execplanid` bigint(20) unsigned DEFAULT NULL COMMENT '执行计划Id',
  `execplanname` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '执行计划名',
  `target` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '条件目标',
  `caseid` bigint(20) unsigned DEFAULT NULL COMMENT '用例id',
  `envassemid` bigint(20) unsigned DEFAULT NULL COMMENT '环境组件id',
  `casedeployunitname` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '用例所属发布单元',
  `caseapiname` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '用例所属api',
  `casename` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '用例名',
  `basetype` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '前置，后置',
  `conditionbasetype` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '数据库，接口',
  `conditiontype` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '数据库：mysql，oracle，sqlserver，接口：http,https,dubbo',
  `deployunitname` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '包含调用接口的发布单元',
  `apiname` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '调用接口的api',
  `conditionvalue` varchar(500) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '条件值，如果是数据库为sql，如果是接口为用例名',
  `conditioncaseid` bigint(20) unsigned DEFAULT NULL COMMENT '条件值id，如果是数据库为空，如果是接口为用例id',
  `connectstr` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '连接字',
  `memo` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '备注',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `lastmodify_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '上一次修改时间',
  `creator` varchar(10) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '创建者',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='api用例条件表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `apicases_condition`
--

LOCK TABLES `apicases_condition` WRITE;
/*!40000 ALTER TABLE `apicases_condition` DISABLE KEYS */;
/*!40000 ALTER TABLE `apicases_condition` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `apicases_condition_report`
--

DROP TABLE IF EXISTS `apicases_condition_report`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `apicases_condition_report` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Id',
  `caseid` bigint(20) unsigned NOT NULL COMMENT '用例id',
  `testplanid` bigint(20) unsigned NOT NULL COMMENT '执行计划id',
  `batchid` bigint(20) unsigned NOT NULL COMMENT '批次id',
  `batchname` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '批次',
  `slaverid` bigint(20) unsigned NOT NULL COMMENT '执行机id',
  `conditiontype` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '前置，后置',
  `casetype` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '功能，性能',
  `status` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '运行结果，成功，失败，异常',
  `errorinfo` varchar(500) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '错误信息',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `lastmodify_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '上一次修改时间',
  `creator` varchar(10) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '创建者',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=205 DEFAULT CHARSET=utf8mb4 COMMENT='api用例前后置条件运行报告表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `apicases_condition_report`
--

LOCK TABLES `apicases_condition_report` WRITE;
/*!40000 ALTER TABLE `apicases_condition_report` DISABLE KEYS */;
INSERT INTO `apicases_condition_report` VALUES (1,1,12,1,'2021-3-16-000001',5,'前置','功能','成功','','2021-03-16 11:23:58','2021-03-16 11:23:58','admin'),(2,1,12,1,'2021-3-16-000001',5,'前置','功能','成功','','2021-03-16 11:23:58','2021-03-16 11:23:58','admin'),(3,1,12,1,'2021-3-16-000001',5,'后置','功能','成功','','2021-03-16 11:24:02','2021-03-16 11:24:02','admin'),(4,1,12,1,'2021-3-16-000001',5,'后置','功能','成功','','2021-03-16 11:24:02','2021-03-16 11:24:02','admin'),(5,1,12,2,'2021-3-16-0000002',5,'前置','功能','成功','','2021-03-16 11:37:41','2021-03-16 11:37:41','admin'),(6,1,12,2,'2021-3-16-0000002',5,'前置','功能','成功','','2021-03-16 11:37:41','2021-03-16 11:37:41','admin'),(7,1,12,2,'2021-3-16-0000002',5,'后置','功能','成功','','2021-03-16 11:37:44','2021-03-16 11:37:44','admin'),(8,1,12,2,'2021-3-16-0000002',5,'后置','功能','成功','','2021-03-16 11:37:44','2021-03-16 11:37:44','admin'),(9,1,12,2,'xxxxxxxxxxxxxxxxxxxxx',5,'后置','性能','成功','','2021-03-16 12:42:24','2021-03-16 12:42:24','admin'),(10,1,12,2,'xxxxxxxxxxxxxxxxxxxxx',5,'后置','性能','成功','','2021-03-16 12:42:24','2021-03-16 12:42:24','admin'),(11,1,12,2,'xxxxxxxxxxxxxxxxxxxxx',5,'后置','性能','成功','','2021-03-16 12:53:04','2021-03-16 12:53:04','admin'),(12,1,12,2,'xxxxxxxxxxxxxxxxxxxxx',5,'后置','性能','成功','','2021-03-16 12:53:04','2021-03-16 12:53:04','admin'),(13,1,12,3,'2021-3-16-000003',5,'前置','功能','成功','','2021-03-16 12:55:33','2021-03-16 12:55:33','admin'),(14,1,12,3,'2021-3-16-000003',5,'前置','功能','成功','','2021-03-16 12:55:33','2021-03-16 12:55:33','admin'),(15,1,12,3,'2021-3-16-000003',5,'后置','功能','成功','','2021-03-16 12:55:39','2021-03-16 12:55:39','admin'),(16,1,12,3,'2021-3-16-000003',5,'后置','功能','成功','','2021-03-16 12:55:39','2021-03-16 12:55:39','admin'),(17,1,12,4,'2021-3-16-00000004',5,'前置','功能','成功','','2021-03-16 13:00:24','2021-03-16 13:00:24','admin'),(18,1,12,4,'2021-3-16-00000004',5,'前置','功能','成功','','2021-03-16 13:00:24','2021-03-16 13:00:24','admin'),(19,1,12,4,'2021-3-16-00000004',5,'后置','功能','成功','','2021-03-16 13:00:27','2021-03-16 13:00:27','admin'),(20,1,12,4,'2021-3-16-00000004',5,'后置','功能','成功','','2021-03-16 13:00:27','2021-03-16 13:00:27','admin'),(21,1,12,5,'2021-3-17-0000001',5,'前置','功能','成功','','2021-03-17 10:08:12','2021-03-17 10:08:12','admin'),(22,1,12,5,'2021-3-17-0000001',5,'前置','功能','成功','','2021-03-17 10:08:12','2021-03-17 10:08:12','admin'),(23,1,12,5,'2021-3-17-0000001',5,'后置','功能','成功','','2021-03-17 10:08:15','2021-03-17 10:08:15','admin'),(24,1,12,5,'2021-3-17-0000001',5,'后置','功能','成功','','2021-03-17 10:08:15','2021-03-17 10:08:15','admin'),(25,1,12,6,'2021-3-17-0000002',5,'前置','功能','成功','','2021-03-17 11:04:05','2021-03-17 11:04:05','admin'),(26,1,12,6,'2021-3-17-0000002',5,'前置','功能','成功','','2021-03-17 11:04:05','2021-03-17 11:04:05','admin'),(27,1,12,6,'2021-3-17-0000002',5,'后置','功能','成功','','2021-03-17 11:04:09','2021-03-17 11:04:09','admin'),(28,1,12,6,'2021-3-17-0000002',5,'后置','功能','成功','','2021-03-17 11:04:09','2021-03-17 11:04:09','admin'),(29,1,12,7,'2021-3-19-00001',5,'前置','功能','成功','','2021-03-19 15:43:23','2021-03-19 15:43:23','admin'),(30,1,12,7,'2021-3-19-00001',5,'前置','功能','成功','','2021-03-19 15:43:23','2021-03-19 15:43:23','admin'),(31,1,12,7,'2021-3-19-00001',5,'后置','功能','成功','','2021-03-19 15:43:27','2021-03-19 15:43:27','admin'),(32,1,12,7,'2021-3-19-00001',5,'后置','功能','成功','','2021-03-19 15:43:27','2021-03-19 15:43:27','admin'),(33,1,12,11,'2021-3-20-00004',5,'前置','功能','成功','','2021-03-20 14:45:11','2021-03-20 14:45:11','admin'),(34,1,12,11,'2021-3-20-00004',5,'前置','功能','成功','','2021-03-20 14:45:11','2021-03-20 14:45:11','admin'),(35,1,12,11,'2021-3-20-00004',5,'后置','功能','成功','','2021-03-20 14:45:13','2021-03-20 14:45:13','admin'),(36,1,12,11,'2021-3-20-00004',5,'后置','功能','成功','','2021-03-20 14:45:13','2021-03-20 14:45:13','admin'),(37,1,12,12,'2021-3-20-000005',5,'前置','功能','成功','','2021-03-20 14:55:44','2021-03-20 14:55:44','admin'),(38,1,12,12,'2021-3-20-000005',5,'前置','功能','成功','','2021-03-20 14:55:44','2021-03-20 14:55:44','admin'),(39,1,12,12,'2021-3-20-000005',5,'后置','功能','成功','','2021-03-20 14:55:48','2021-03-20 14:55:48','admin'),(40,1,12,12,'2021-3-20-000005',5,'后置','功能','成功','','2021-03-20 14:55:48','2021-03-20 14:55:48','admin'),(41,1,12,13,'2021-3-22-00001',5,'前置','功能','成功','','2021-03-21 14:44:45','2021-03-21 14:44:45','admin'),(42,1,12,13,'2021-3-22-00001',5,'前置','功能','成功','','2021-03-21 14:44:45','2021-03-21 14:44:45','admin'),(43,6,12,13,'2021-3-22-00001',5,'前置','功能','成功','','2021-03-21 14:44:46','2021-03-21 14:44:46','admin'),(44,6,12,13,'2021-3-22-00001',5,'前置','功能','成功','','2021-03-21 14:44:46','2021-03-21 14:44:46','admin'),(45,7,12,13,'2021-3-22-00001',5,'前置','功能','成功','','2021-03-21 14:44:50','2021-03-21 14:44:50','admin'),(46,7,12,13,'2021-3-22-00001',5,'前置','功能','成功','','2021-03-21 14:44:50','2021-03-21 14:44:50','admin'),(47,1,12,13,'2021-3-22-00001',5,'后置','功能','成功','','2021-03-21 14:44:56','2021-03-21 14:44:56','admin'),(48,1,12,13,'2021-3-22-00001',5,'后置','功能','成功','','2021-03-21 14:44:56','2021-03-21 14:44:56','admin'),(49,6,12,13,'2021-3-22-00001',5,'后置','功能','成功','','2021-03-21 14:44:57','2021-03-21 14:44:57','admin'),(50,6,12,13,'2021-3-22-00001',5,'后置','功能','成功','','2021-03-21 14:44:57','2021-03-21 14:44:57','admin'),(51,7,12,13,'2021-3-22-00001',5,'后置','功能','成功','','2021-03-21 14:44:58','2021-03-21 14:44:58','admin'),(52,7,12,13,'2021-3-22-00001',5,'后置','功能','成功','','2021-03-21 14:44:58','2021-03-21 14:44:58','admin'),(53,6,12,14,'2021-3-22-000002',5,'前置','功能','成功','','2021-03-21 15:02:29','2021-03-21 15:02:29','admin'),(54,6,12,14,'2021-3-22-000002',5,'前置','功能','成功','','2021-03-21 15:02:29','2021-03-21 15:02:29','admin'),(55,1,12,14,'2021-3-22-000002',5,'前置','功能','成功','','2021-03-21 15:02:31','2021-03-21 15:02:31','admin'),(56,1,12,14,'2021-3-22-000002',5,'前置','功能','成功','','2021-03-21 15:02:31','2021-03-21 15:02:31','admin'),(57,7,12,14,'2021-3-22-000002',5,'前置','功能','成功','','2021-03-21 15:02:35','2021-03-21 15:02:35','admin'),(58,7,12,14,'2021-3-22-000002',5,'前置','功能','成功','','2021-03-21 15:02:35','2021-03-21 15:02:35','admin'),(59,6,12,14,'2021-3-22-000002',5,'后置','功能','成功','','2021-03-21 15:02:37','2021-03-21 15:02:37','admin'),(60,6,12,14,'2021-3-22-000002',5,'后置','功能','成功','','2021-03-21 15:02:37','2021-03-21 15:02:37','admin'),(61,1,12,14,'2021-3-22-000002',5,'后置','功能','成功','','2021-03-21 15:02:39','2021-03-21 15:02:39','admin'),(62,1,12,14,'2021-3-22-000002',5,'后置','功能','成功','','2021-03-21 15:02:39','2021-03-21 15:02:39','admin'),(63,7,12,14,'2021-3-22-000002',5,'后置','功能','成功','','2021-03-21 15:02:41','2021-03-21 15:02:41','admin'),(64,7,12,14,'2021-3-22-000002',5,'后置','功能','成功','','2021-03-21 15:02:41','2021-03-21 15:02:41','admin'),(65,1,12,15,'2021-3-22-000000003',5,'前置','功能','成功','','2021-03-21 15:05:34','2021-03-21 15:05:34','admin'),(66,1,12,15,'2021-3-22-000000003',5,'前置','功能','成功','','2021-03-21 15:05:34','2021-03-21 15:05:34','admin'),(67,1,12,15,'2021-3-22-000000003',5,'后置','功能','成功','','2021-03-21 15:05:38','2021-03-21 15:05:38','admin'),(68,1,12,15,'2021-3-22-000000003',5,'后置','功能','成功','','2021-03-21 15:05:38','2021-03-21 15:05:38','admin'),(69,2,13,29,'2021-4-6-00002xn',5,'前置','性能','成功','','2021-04-06 09:36:54','2021-04-06 09:36:54','admin'),(70,2,13,29,'2021-4-6-00002xn',5,'前置','性能','成功','','2021-04-06 09:36:54','2021-04-06 09:36:54','admin'),(71,2,13,29,'2021-4-6-00002xn',5,'后置','性能','成功','','2021-04-06 09:36:58','2021-04-06 09:36:58','admin'),(72,2,13,29,'2021-4-6-00002xn',5,'后置','性能','成功','','2021-04-06 09:36:58','2021-04-06 09:36:58','admin'),(73,2,13,30,'2021-4-6-00003xn',5,'前置','性能','成功','','2021-04-06 09:45:45','2021-04-06 09:45:45','admin'),(74,2,13,30,'2021-4-6-00003xn',5,'前置','性能','成功','','2021-04-06 09:45:45','2021-04-06 09:45:45','admin'),(75,2,13,30,'2021-4-6-00003xn',5,'后置','性能','成功','','2021-04-06 09:45:49','2021-04-06 09:45:49','admin'),(76,2,13,30,'2021-4-6-00003xn',5,'后置','性能','成功','','2021-04-06 09:45:49','2021-04-06 09:45:49','admin'),(77,2,13,33,'2021-4-006xn',5,'前置','性能','成功','','2021-04-06 10:01:14','2021-04-06 10:01:14','admin'),(78,2,13,33,'2021-4-006xn',5,'前置','性能','成功','','2021-04-06 10:01:14','2021-04-06 10:01:14','admin'),(79,2,13,33,'2021-4-006xn',5,'后置','性能','成功','','2021-04-06 10:01:19','2021-04-06 10:01:19','admin'),(80,2,13,33,'2021-4-006xn',5,'后置','性能','成功','','2021-04-06 10:01:19','2021-04-06 10:01:19','admin'),(81,2,13,34,'2021-4-6-00007xn',5,'前置','性能','成功','','2021-04-06 10:09:21','2021-04-06 10:09:21','admin'),(82,2,13,34,'2021-4-6-00007xn',5,'前置','性能','成功','','2021-04-06 10:09:21','2021-04-06 10:09:21','admin'),(83,2,13,34,'2021-4-6-00007xn',5,'后置','性能','成功','','2021-04-06 10:09:25','2021-04-06 10:09:25','admin'),(84,2,13,34,'2021-4-6-00007xn',5,'后置','性能','成功','','2021-04-06 10:09:25','2021-04-06 10:09:25','admin'),(85,8,13,35,'2021-4-6-2deploy',5,'前置','性能','成功','','2021-04-06 10:33:52','2021-04-06 10:33:52','admin'),(86,8,13,35,'2021-4-6-2deploy',5,'前置','性能','成功','','2021-04-06 10:33:52','2021-04-06 10:33:52','admin'),(87,2,13,35,'2021-4-6-2deploy',5,'前置','性能','成功','','2021-04-06 10:33:53','2021-04-06 10:33:53','admin'),(88,2,13,35,'2021-4-6-2deploy',5,'前置','性能','成功','','2021-04-06 10:33:53','2021-04-06 10:33:53','admin'),(89,8,13,35,'2021-4-6-2deploy',5,'后置','性能','成功','','2021-04-06 10:34:03','2021-04-06 10:34:03','admin'),(90,8,13,35,'2021-4-6-2deploy',5,'后置','性能','成功','','2021-04-06 10:34:03','2021-04-06 10:34:03','admin'),(91,2,13,35,'2021-4-6-2deploy',5,'后置','性能','成功','','2021-04-06 10:34:03','2021-04-06 10:34:03','admin'),(92,2,13,35,'2021-4-6-2deploy',5,'后置','性能','成功','','2021-04-06 10:34:03','2021-04-06 10:34:03','admin'),(93,2,13,36,'2021-4-6-00008-2deploy',5,'前置','性能','成功','','2021-04-06 11:39:56','2021-04-06 11:39:56','admin'),(94,2,13,36,'2021-4-6-00008-2deploy',5,'前置','性能','成功','','2021-04-06 11:39:56','2021-04-06 11:39:56','admin'),(95,2,13,36,'2021-4-6-00008-2deploy',5,'后置','性能','成功','','2021-04-06 11:40:02','2021-04-06 11:40:02','admin'),(96,2,13,36,'2021-4-6-00008-2deploy',5,'后置','性能','成功','','2021-04-06 11:40:02','2021-04-06 11:40:02','admin'),(97,8,13,36,'2021-4-6-00008-2deploy',5,'前置','性能','成功','','2021-04-06 11:53:19','2021-04-06 11:53:19','admin'),(98,8,13,36,'2021-4-6-00008-2deploy',5,'前置','性能','成功','','2021-04-06 11:53:19','2021-04-06 11:53:19','admin'),(99,8,13,36,'2021-4-6-00008-2deploy',5,'后置','性能','成功','','2021-04-06 11:53:23','2021-04-06 11:53:23','admin'),(100,8,13,36,'2021-4-6-00008-2deploy',5,'后置','性能','成功','','2021-04-06 11:53:23','2021-04-06 11:53:23','admin'),(101,2,13,37,'2021-4-6-0000009-2-dep',5,'前置','性能','成功','','2021-04-06 15:07:24','2021-04-06 15:07:24','admin'),(102,2,13,37,'2021-4-6-0000009-2-dep',5,'前置','性能','成功','','2021-04-06 15:07:24','2021-04-06 15:07:24','admin'),(103,2,13,37,'2021-4-6-0000009-2-dep',5,'后置','性能','成功','','2021-04-06 15:07:35','2021-04-06 15:07:35','admin'),(104,2,13,37,'2021-4-6-0000009-2-dep',5,'后置','性能','成功','','2021-04-06 15:07:35','2021-04-06 15:07:35','admin'),(105,8,13,37,'2021-4-6-0000009-2-dep',5,'前置','性能','成功','','2021-04-06 15:07:52','2021-04-06 15:07:52','admin'),(106,8,13,37,'2021-4-6-0000009-2-dep',5,'前置','性能','成功','','2021-04-06 15:07:52','2021-04-06 15:07:52','admin'),(107,8,13,37,'2021-4-6-0000009-2-dep',5,'后置','性能','成功','','2021-04-06 15:07:57','2021-04-06 15:07:57','admin'),(108,8,13,37,'2021-4-6-0000009-2-dep',5,'后置','性能','成功','','2021-04-06 15:07:57','2021-04-06 15:07:57','admin'),(109,2,13,38,'2021-4-6-100001-2deploy',5,'前置','性能','成功','','2021-04-06 15:43:08','2021-04-06 15:43:08','admin'),(110,2,13,38,'2021-4-6-100001-2deploy',5,'前置','性能','成功','','2021-04-06 15:43:08','2021-04-06 15:43:08','admin'),(111,2,13,38,'2021-4-6-100001-2deploy',5,'后置','性能','成功','','2021-04-06 15:43:15','2021-04-06 15:43:15','admin'),(112,2,13,38,'2021-4-6-100001-2deploy',5,'后置','性能','成功','','2021-04-06 15:43:15','2021-04-06 15:43:15','admin'),(113,8,13,38,'2021-4-6-100001-2deploy',5,'前置','性能','成功','','2021-04-06 15:43:26','2021-04-06 15:43:26','admin'),(114,8,13,38,'2021-4-6-100001-2deploy',5,'前置','性能','成功','','2021-04-06 15:43:26','2021-04-06 15:43:26','admin'),(115,8,13,38,'2021-4-6-100001-2deploy',5,'后置','性能','成功','','2021-04-06 15:43:30','2021-04-06 15:43:30','admin'),(116,8,13,38,'2021-4-6-100001-2deploy',5,'后置','性能','成功','','2021-04-06 15:43:30','2021-04-06 15:43:30','admin'),(117,2,13,39,'2021-4-6-1000010-1de',5,'前置','性能','成功','','2021-04-06 16:06:32','2021-04-06 16:06:32','admin'),(118,2,13,39,'2021-4-6-1000010-1de',5,'前置','性能','成功','','2021-04-06 16:06:32','2021-04-06 16:06:32','admin'),(119,2,13,39,'2021-4-6-1000010-1de',5,'后置','性能','成功','','2021-04-06 16:06:42','2021-04-06 16:06:42','admin'),(120,2,13,39,'2021-4-6-1000010-1de',5,'后置','性能','成功','','2021-04-06 16:06:42','2021-04-06 16:06:42','admin'),(121,2,13,40,'2021-4-6-100020-1de',5,'前置','性能','成功','','2021-04-06 16:29:51','2021-04-06 16:29:51','admin'),(122,2,13,40,'2021-4-6-100020-1de',5,'前置','性能','成功','','2021-04-06 16:29:51','2021-04-06 16:29:51','admin'),(123,2,13,40,'2021-4-6-100020-1de',5,'后置','性能','成功','','2021-04-06 16:29:59','2021-04-06 16:29:59','admin'),(124,2,13,40,'2021-4-6-100020-1de',5,'后置','性能','成功','','2021-04-06 16:29:59','2021-04-06 16:29:59','admin'),(125,2,13,41,'2021-4-6-1000030-1de',5,'前置','性能','成功','','2021-04-06 16:50:28','2021-04-06 16:50:28','admin'),(126,2,13,41,'2021-4-6-1000030-1de',5,'前置','性能','成功','','2021-04-06 16:50:28','2021-04-06 16:50:28','admin'),(127,2,13,41,'2021-4-6-1000030-1de',5,'后置','性能','成功','','2021-04-06 16:50:35','2021-04-06 16:50:35','admin'),(128,2,13,41,'2021-4-6-1000030-1de',5,'后置','性能','成功','','2021-04-06 16:50:35','2021-04-06 16:50:35','admin'),(129,2,13,42,'2021-4-6-10000040',5,'前置','性能','成功','','2021-04-06 16:55:13','2021-04-06 16:55:13','admin'),(130,2,13,42,'2021-4-6-10000040',5,'前置','性能','成功','','2021-04-06 16:55:13','2021-04-06 16:55:13','admin'),(131,2,13,42,'2021-4-6-10000040',5,'后置','性能','成功','','2021-04-06 16:55:17','2021-04-06 16:55:17','admin'),(132,2,13,42,'2021-4-6-10000040',5,'后置','性能','成功','','2021-04-06 16:55:17','2021-04-06 16:55:17','admin'),(133,2,13,43,'2021-4-6-10000060',5,'前置','性能','成功','','2021-04-06 17:00:59','2021-04-06 17:00:59','admin'),(134,2,13,43,'2021-4-6-10000060',5,'前置','性能','成功','','2021-04-06 17:00:59','2021-04-06 17:00:59','admin'),(135,2,13,43,'2021-4-6-10000060',5,'后置','性能','成功','','2021-04-06 17:01:04','2021-04-06 17:01:04','admin'),(136,2,13,43,'2021-4-6-10000060',5,'后置','性能','成功','','2021-04-06 17:01:04','2021-04-06 17:01:04','admin'),(137,2,13,44,'2021-4-6-10000070',5,'前置','性能','成功','','2021-04-06 17:12:00','2021-04-06 17:12:00','admin'),(138,2,13,44,'2021-4-6-10000070',5,'前置','性能','成功','','2021-04-06 17:12:00','2021-04-06 17:12:00','admin'),(139,2,13,44,'2021-4-6-10000070',5,'后置','性能','成功','','2021-04-06 17:12:03','2021-04-06 17:12:03','admin'),(140,2,13,44,'2021-4-6-10000070',5,'后置','性能','成功','','2021-04-06 17:12:03','2021-04-06 17:12:03','admin'),(141,2,13,45,'xxxxxx',5,'前置','性能','成功','','2021-04-06 17:20:26','2021-04-06 17:20:26','admin'),(142,2,13,45,'xxxxxx',5,'前置','性能','成功','','2021-04-06 17:20:26','2021-04-06 17:20:26','admin'),(143,2,13,45,'xxxxxx',5,'后置','性能','成功','','2021-04-06 17:20:35','2021-04-06 17:20:35','admin'),(144,2,13,45,'xxxxxx',5,'后置','性能','成功','','2021-04-06 17:20:35','2021-04-06 17:20:35','admin'),(145,2,13,46,'xxxxx11',5,'前置','性能','成功','','2021-04-06 17:24:02','2021-04-06 17:24:02','admin'),(146,2,13,46,'xxxxx11',5,'前置','性能','成功','','2021-04-06 17:24:02','2021-04-06 17:24:02','admin'),(147,2,13,46,'xxxxx11',5,'后置','性能','成功','','2021-04-06 17:24:06','2021-04-06 17:24:06','admin'),(148,2,13,46,'xxxxx11',5,'后置','性能','成功','','2021-04-06 17:24:06','2021-04-06 17:24:06','admin'),(149,2,13,47,'4-7-00001',5,'前置','性能','成功','','2021-04-07 09:09:51','2021-04-07 09:09:51','admin'),(150,2,13,47,'4-7-00001',5,'前置','性能','成功','','2021-04-07 09:09:51','2021-04-07 09:09:51','admin'),(151,2,13,47,'4-7-00001',5,'后置','性能','成功','','2021-04-07 09:09:57','2021-04-07 09:09:57','admin'),(152,2,13,47,'4-7-00001',5,'后置','性能','成功','','2021-04-07 09:09:57','2021-04-07 09:09:57','admin'),(153,2,13,48,'4-7-0002',5,'前置','性能','成功','','2021-04-07 09:14:36','2021-04-07 09:14:36','admin'),(154,2,13,48,'4-7-0002',5,'前置','性能','成功','','2021-04-07 09:14:36','2021-04-07 09:14:36','admin'),(155,2,13,48,'4-7-0002',5,'后置','性能','成功','','2021-04-07 09:14:44','2021-04-07 09:14:44','admin'),(156,2,13,48,'4-7-0002',5,'后置','性能','成功','','2021-04-07 09:14:44','2021-04-07 09:14:44','admin'),(157,8,13,49,'4-7-00001-2de',5,'前置','性能','成功','','2021-04-07 09:51:31','2021-04-07 09:51:31','admin'),(158,8,13,49,'4-7-00001-2de',5,'前置','性能','成功','','2021-04-07 09:51:31','2021-04-07 09:51:31','admin'),(159,2,13,49,'4-7-00001-2de',5,'前置','性能','成功','','2021-04-07 09:51:31','2021-04-07 09:51:31','admin'),(160,2,13,49,'4-7-00001-2de',5,'前置','性能','成功','','2021-04-07 09:51:31','2021-04-07 09:51:31','admin'),(161,8,13,49,'4-7-00001-2de',5,'后置','性能','成功','','2021-04-07 09:51:41','2021-04-07 09:51:41','admin'),(162,8,13,49,'4-7-00001-2de',5,'后置','性能','成功','','2021-04-07 09:51:41','2021-04-07 09:51:41','admin'),(163,2,13,49,'4-7-00001-2de',5,'后置','性能','成功','','2021-04-07 09:51:43','2021-04-07 09:51:43','admin'),(164,2,13,49,'4-7-00001-2de',5,'后置','性能','成功','','2021-04-07 09:51:43','2021-04-07 09:51:43','admin'),(165,2,17,20,'xn0003',5,'前置','性能','成功','','2021-04-28 14:36:07','2021-04-28 14:36:07','admin'),(166,2,17,20,'xn0003',5,'前置','性能','成功','','2021-04-28 14:36:07','2021-04-28 14:36:07','admin'),(167,2,17,20,'xn0003',5,'后置','性能','成功','','2021-04-28 14:36:14','2021-04-28 14:36:14','admin'),(168,2,17,20,'xn0003',5,'后置','性能','成功','','2021-04-28 14:36:14','2021-04-28 14:36:14','admin'),(169,2,13,24,'2021-5-7-0005',5,'前置','性能','成功','','2021-05-07 17:09:17','2021-05-07 17:09:17','admin'),(170,2,13,24,'2021-5-7-0005',5,'前置','性能','成功','','2021-05-07 17:09:17','2021-05-07 17:09:17','admin'),(171,2,13,24,'2021-5-7-0005',5,'后置','性能','成功','','2021-05-07 17:09:23','2021-05-07 17:09:23','admin'),(172,2,13,24,'2021-5-7-0005',5,'后置','性能','成功','','2021-05-07 17:09:23','2021-05-07 17:09:23','admin'),(173,2,13,4,'2021-9-8-0001',12,'后置','性能','成功','','2021-09-08 18:32:02','2021-09-08 18:32:02','admin'),(174,2,13,4,'2021-9-8-0001',12,'后置','性能','成功','','2021-09-08 18:32:02','2021-09-08 18:32:02','admin'),(175,2,13,4,'2021-9-8-0001',12,'后置','性能','成功','','2021-09-09 10:22:22','2021-09-09 10:22:22','admin'),(176,2,13,4,'2021-9-8-0001',12,'后置','性能','成功','','2021-09-09 10:22:22','2021-09-09 10:22:22','admin'),(177,2,13,5,'2021-9-9-000001',12,'后置','性能','成功','','2021-09-09 10:25:16','2021-09-09 10:25:16','admin'),(178,2,13,5,'2021-9-9-000001',12,'后置','性能','成功','','2021-09-09 10:25:16','2021-09-09 10:25:16','admin'),(179,2,13,6,'2021-9-22-0001',12,'后置','性能','成功','','2021-09-22 09:40:42','2021-09-22 09:40:42','admin'),(180,2,13,6,'2021-9-22-0001',12,'后置','性能','成功','','2021-09-22 09:40:42','2021-09-22 09:40:42','admin'),(181,2,13,7,'2021-9-22-00000002',12,'后置','性能','成功','','2021-09-22 09:50:56','2021-09-22 09:50:56','admin'),(182,2,13,7,'2021-9-22-00000002',12,'后置','性能','成功','','2021-09-22 09:50:56','2021-09-22 09:50:56','admin'),(183,2,13,8,'2021-9-22-0000003',12,'后置','性能','成功','','2021-09-22 10:11:47','2021-09-22 10:11:47','admin'),(184,2,13,8,'2021-9-22-0000003',12,'后置','性能','成功','','2021-09-22 10:11:47','2021-09-22 10:11:47','admin'),(185,2,13,9,'2021-9-22-000004',12,'后置','性能','成功','','2021-09-22 11:35:30','2021-09-22 11:35:30','admin'),(186,2,13,9,'2021-9-22-000004',12,'后置','性能','成功','','2021-09-22 11:35:30','2021-09-22 11:35:30','admin'),(187,2,13,9,'2021-9-22-000004',12,'后置','性能','成功','','2021-09-22 11:35:30','2021-09-22 11:35:30','admin'),(188,2,13,9,'2021-9-22-000004',12,'后置','性能','成功','','2021-09-22 11:35:30','2021-09-22 11:35:30','admin'),(189,2,13,9,'2021-9-22-000004',12,'后置','性能','成功','','2021-09-22 11:35:30','2021-09-22 11:35:30','admin'),(190,2,13,9,'2021-9-22-000004',12,'后置','性能','成功','','2021-09-22 11:35:30','2021-09-22 11:35:30','admin'),(191,2,13,9,'2021-9-22-000004',12,'后置','性能','成功','','2021-09-22 11:35:30','2021-09-22 11:35:30','admin'),(192,2,13,9,'2021-9-22-000004',12,'后置','性能','成功','','2021-09-22 11:35:30','2021-09-22 11:35:30','admin'),(193,2,13,9,'2021-9-22-000004',12,'后置','性能','成功','','2021-09-22 11:35:30','2021-09-22 11:35:30','admin'),(194,2,13,9,'2021-9-22-000004',12,'后置','性能','成功','','2021-09-22 11:35:30','2021-09-22 11:35:30','admin'),(195,2,13,9,'2021-9-22-000004',12,'后置','性能','成功','','2021-09-22 11:35:30','2021-09-22 11:35:30','admin'),(196,2,13,9,'2021-9-22-000004',12,'后置','性能','成功','','2021-09-22 11:35:30','2021-09-22 11:35:30','admin'),(197,2,13,10,'2021-9-22-00005',12,'后置','性能','成功','','2021-09-22 11:38:37','2021-09-22 11:38:37','admin'),(198,2,13,10,'2021-9-22-00005',12,'后置','性能','成功','','2021-09-22 11:38:37','2021-09-22 11:38:37','admin'),(199,2,13,11,'2021-9-22-00000006',12,'后置','性能','成功','','2021-09-22 11:41:38','2021-09-22 11:41:38','admin'),(200,2,13,11,'2021-9-22-00000006',12,'后置','性能','成功','','2021-09-22 11:41:38','2021-09-22 11:41:38','admin'),(201,2,13,12,'2021-9-22-00000xx1',12,'后置','性能','成功','','2021-09-22 11:47:47','2021-09-22 11:47:47','admin'),(202,2,13,12,'2021-9-22-00000xx1',12,'后置','性能','成功','','2021-09-22 11:47:47','2021-09-22 11:47:47','admin'),(203,2,13,13,'2021-9-22-00000xx2',12,'后置','性能','成功','','2021-09-22 11:48:01','2021-09-22 11:48:01','admin'),(204,2,13,13,'2021-9-22-00000xx2',12,'后置','性能','成功','','2021-09-22 11:48:01','2021-09-22 11:48:01','admin');
/*!40000 ALTER TABLE `apicases_condition_report` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `apicases_performanceapdex`
--

DROP TABLE IF EXISTS `apicases_performanceapdex`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `apicases_performanceapdex` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Id',
  `caseid` bigint(20) unsigned NOT NULL COMMENT '用例id',
  `testplanid` bigint(20) unsigned NOT NULL COMMENT '执行计划id',
  `batchname` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '批次',
  `slaverid` bigint(20) unsigned NOT NULL COMMENT '执行机id',
  `apdex` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT 'apdex',
  `toleration` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT 'toleration',
  `frustration` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT 'frustration',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `lastmodify_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '上一次修改时间',
  `creator` varchar(10) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '创建者',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='api用例性能apdex表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `apicases_performanceapdex`
--

LOCK TABLES `apicases_performanceapdex` WRITE;
/*!40000 ALTER TABLE `apicases_performanceapdex` DISABLE KEYS */;
/*!40000 ALTER TABLE `apicases_performanceapdex` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `apicases_performancestatistics`
--

DROP TABLE IF EXISTS `apicases_performancestatistics`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `apicases_performancestatistics` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Id',
  `caseid` bigint(20) unsigned NOT NULL COMMENT '用例id',
  `testplanid` bigint(20) unsigned NOT NULL COMMENT '执行计划id',
  `batchname` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '批次',
  `runtime` double(11,2) NOT NULL COMMENT '运行时长,秒',
  `slaverid` bigint(20) unsigned NOT NULL COMMENT '执行机id',
  `samples` bigint(20) unsigned NOT NULL COMMENT '样本',
  `errorcount` bigint(20) unsigned NOT NULL COMMENT '错误次数',
  `errorrate` double(11,2) NOT NULL COMMENT '错误率',
  `average` double(11,2) NOT NULL COMMENT '平均数',
  `min` double(11,2) NOT NULL COMMENT '最小值',
  `max` double(11,2) NOT NULL COMMENT '最大值',
  `median` double(11,2) NOT NULL COMMENT '中间值',
  `nzpct` double(11,2) NOT NULL COMMENT '90pct',
  `nfpct` double(11,2) NOT NULL COMMENT '95pct',
  `nnpct` double(11,2) NOT NULL COMMENT '99pct',
  `tps` double(11,2) NOT NULL COMMENT 'tps',
  `receivekbsec` double(11,2) NOT NULL COMMENT '每秒接受Kb数',
  `sendkbsec` double(11,2) NOT NULL COMMENT '每秒发送Kb数',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `lastmodify_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '上一次修改时间',
  `creator` varchar(10) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '创建者',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8mb4 COMMENT='api用例性能统计表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `apicases_performancestatistics`
--

LOCK TABLES `apicases_performancestatistics` WRITE;
/*!40000 ALTER TABLE `apicases_performancestatistics` DISABLE KEYS */;
INSERT INTO `apicases_performancestatistics` VALUES (4,2,13,'xn100000001',2.02,5,4,4,100.00,655.50,185.00,1366.00,535.50,1366.00,1366.00,1366.00,2.50,0.00,0.00,'2020-12-17 11:34:50','2020-12-17 11:34:50',NULL),(5,2,13,'xn10000003',3.96,5,4,4,100.00,1430.50,143.00,2934.00,1322.50,2934.00,2934.00,2934.00,1.20,0.00,0.00,'2020-12-17 11:39:40','2020-12-17 11:39:40',NULL),(6,2,13,'xn100000004',1.48,5,9,9,100.00,262.33,134.00,844.00,142.00,844.00,844.00,844.00,8.00,0.00,0.00,'2020-12-17 11:43:20','2020-12-17 11:43:20',NULL),(7,2,13,'xn100000004',1.48,5,9,9,100.00,436.78,98.00,1407.00,120.00,1407.00,1407.00,1407.00,5.40,0.00,0.00,'2020-12-21 08:47:15','2020-12-21 08:47:15',NULL),(8,2,13,'2021-4-6-00007xn',1.79,5,9,9,100.00,342.44,110.00,1091.00,142.00,1091.00,1091.00,1091.00,6.40,0.00,0.00,'2021-04-06 10:25:40','2021-04-06 10:25:40',NULL),(9,8,13,'2021-4-6-2deploy',6.60,5,4,4,100.00,2773.00,244.00,5560.00,2644.00,5560.00,5560.00,5560.00,0.60,0.00,0.00,'2021-04-06 10:34:20','2021-04-06 10:34:20',NULL),(10,2,13,'2021-4-6-2deploy',5.43,5,9,9,100.00,1147.67,246.00,3186.00,417.00,3186.00,3186.00,3186.00,2.20,0.00,0.00,'2021-04-06 10:34:20','2021-04-06 10:34:20',NULL),(11,2,13,'2021-4-6-00008-2deploy',3.84,5,9,9,100.00,1038.44,116.00,3204.00,129.00,3204.00,3204.00,3204.00,2.60,0.00,0.00,'2021-04-06 15:05:48','2021-04-06 15:05:48',NULL),(12,8,13,'2021-4-6-00008-2deploy',1.91,5,4,4,100.00,582.50,155.00,1178.00,498.50,1178.00,1178.00,1178.00,2.60,0.00,0.00,'2021-04-06 15:05:48','2021-04-06 15:05:48',NULL),(13,2,13,'2021-4-6-0000009-2-dep',5.08,5,9,9,100.00,1360.22,145.00,4040.00,241.00,4040.00,4040.00,4040.00,1.90,0.00,0.00,'2021-04-06 15:07:40','2021-04-06 15:07:40',NULL),(14,8,13,'2021-4-6-0000009-2-dep',1.64,5,4,4,100.00,464.25,139.00,1037.00,340.50,1037.00,1037.00,1037.00,3.30,0.00,0.00,'2021-04-06 15:08:20','2021-04-06 15:08:20',NULL),(15,2,13,'2021-4-6-100001-2deploy',4.34,5,9,9,100.00,1110.22,123.00,3329.00,137.00,3329.00,3329.00,3329.00,2.40,0.00,0.00,'2021-04-06 15:43:20','2021-04-06 15:43:20',NULL),(16,8,13,'2021-4-6-100001-2deploy',1.69,5,4,4,100.00,495.00,139.00,1058.00,391.50,1058.00,1058.00,1058.00,3.10,0.00,0.00,'2021-04-06 15:43:40','2021-04-06 15:43:40',NULL),(17,2,13,'2021-4-6-1000010-1de',4.73,5,9,9,100.00,1178.33,121.00,3522.00,171.00,3522.00,3522.00,3522.00,2.20,0.00,0.00,'2021-04-06 16:07:00','2021-04-06 16:07:00',NULL),(18,2,13,'2021-4-6-100020-1de',4.57,5,9,9,100.00,1174.33,145.00,3506.00,167.00,3506.00,3506.00,3506.00,2.20,0.00,0.00,'2021-04-06 16:30:20','2021-04-06 16:30:20',NULL),(19,2,13,'2021-4-6-1000030-1de',4.03,5,9,9,100.00,1043.11,124.00,3172.00,146.00,3172.00,3172.00,3172.00,2.50,0.00,0.00,'2021-04-06 16:50:40','2021-04-06 16:50:40',NULL),(20,2,13,'2021-4-6-10000040',2.02,5,9,9,100.00,391.67,121.00,1118.00,238.00,1118.00,1118.00,1118.00,5.60,0.00,0.00,'2021-04-06 16:55:20','2021-04-06 16:55:20',NULL),(21,2,13,'2021-4-6-10000060',1.94,5,1,1,100.00,1319.00,1319.00,1319.00,1319.00,1319.00,1319.00,1319.00,0.70,0.00,0.00,'2021-04-06 17:01:20','2021-04-06 17:01:20',NULL),(22,2,13,'xxxxxx',4.11,5,1,1,100.00,3666.00,3666.00,3666.00,3666.00,3666.00,3666.00,3666.00,0.20,0.00,0.00,'2021-04-06 17:20:40','2021-04-06 17:20:40',NULL),(23,2,13,'xxxxx11',1.68,5,1,0,0.00,1267.00,1267.00,1267.00,1267.00,1267.00,1267.00,1267.00,0.70,0.00,0.00,'2021-04-06 17:24:20','2021-04-06 17:24:20',NULL),(24,2,13,'4-7-00001',2.34,5,1,0,0.00,1755.00,1755.00,1755.00,1755.00,1755.00,1755.00,1755.00,0.50,0.00,0.00,'2021-04-07 09:10:00','2021-04-07 09:10:00',NULL),(25,2,13,'4-7-0002',3.34,5,12,0,0.00,541.25,157.00,1855.00,235.50,1743.40,1855.00,1855.00,4.70,0.00,0.00,'2021-04-07 09:15:00','2021-04-07 09:15:00',NULL),(26,8,13,'4-7-00001-2de',4.40,5,4,4,100.00,1602.50,167.00,3316.00,1463.50,3316.00,3316.00,3316.00,1.10,0.00,0.00,'2021-04-07 09:52:00','2021-04-07 09:52:00',NULL),(27,2,13,'4-7-00001-2de',4.31,5,12,0,0.00,702.17,148.00,2419.00,232.50,2332.00,2419.00,2419.00,3.70,0.00,0.00,'2021-04-07 09:52:00','2021-04-07 09:52:00',NULL),(28,2,17,'xn0003',5.03,5,12,0,0.00,1038.50,144.00,4049.00,208.00,3873.80,4049.00,4049.00,2.60,0.00,0.00,'2021-04-28 14:36:20','2021-04-28 14:36:20',NULL),(29,2,13,'2021-5-7-0005',2.19,5,12,0,0.00,343.17,126.00,1234.00,163.00,1143.70,1234.00,1234.00,6.90,0.00,0.00,'2021-05-07 17:09:40','2021-05-07 17:09:40',NULL),(30,2,13,'2021-9-8-0001',0.90,12,12,12,100.00,27.17,7.00,202.00,11.00,146.50,202.00,202.00,16.70,0.00,0.00,'2021-09-09 10:22:40','2021-09-09 10:22:40',NULL),(31,2,13,'2021-9-8-0001',0.74,12,12,12,100.00,27.17,7.00,202.00,11.00,146.50,202.00,202.00,16.70,0.00,0.00,'2021-09-09 10:22:40','2021-09-09 10:22:40',NULL),(32,2,13,'2021-9-9-000001',0.75,12,12,12,100.00,24.75,7.00,166.00,9.50,127.00,166.00,166.00,16.70,0.00,0.00,'2021-09-09 10:25:20','2021-09-09 10:25:20',NULL),(33,2,13,'2021-9-22-0001',0.73,12,12,12,100.00,22.42,6.00,173.00,8.50,125.30,173.00,173.00,16.90,0.00,0.00,'2021-09-22 09:41:00','2021-09-22 09:41:00',NULL),(34,2,13,'2021-9-22-00000002',0.73,12,12,12,100.00,30.08,5.00,281.00,8.00,199.70,281.00,281.00,17.00,0.00,0.00,'2021-09-22 09:51:00','2021-09-22 09:51:00',NULL),(35,2,13,'2021-9-22-0000003',0.72,12,12,12,100.00,37.83,6.00,355.00,8.00,255.10,355.00,355.00,17.10,0.00,0.00,'2021-09-22 10:12:00','2021-09-22 10:12:00',NULL),(36,2,13,'2021-9-22-000004',0.77,12,12,12,100.00,54.25,5.00,421.00,16.50,322.30,421.00,421.00,17.40,0.00,0.00,'2021-09-22 11:35:45','2021-09-22 11:35:45',NULL),(37,2,13,'2021-9-22-000004',0.69,12,12,12,100.00,54.25,5.00,421.00,16.50,322.30,421.00,421.00,17.40,0.00,0.00,'2021-09-22 11:35:45','2021-09-22 11:35:45',NULL),(38,2,13,'2021-9-22-000004',0.76,12,12,12,100.00,54.25,5.00,421.00,16.50,322.30,421.00,421.00,17.40,0.00,0.00,'2021-09-22 11:35:45','2021-09-22 11:35:45',NULL),(39,2,13,'2021-9-22-000004',0.77,12,12,12,100.00,54.25,5.00,421.00,16.50,322.30,421.00,421.00,17.40,0.00,0.00,'2021-09-22 11:35:45','2021-09-22 11:35:45',NULL),(40,2,13,'2021-9-22-000004',0.74,12,12,12,100.00,54.25,5.00,421.00,16.50,322.30,421.00,421.00,17.40,0.00,0.00,'2021-09-22 11:35:45','2021-09-22 11:35:45',NULL),(41,2,13,'2021-9-22-000004',0.76,12,12,12,100.00,54.25,5.00,421.00,16.50,322.30,421.00,421.00,17.40,0.00,0.00,'2021-09-22 11:35:45','2021-09-22 11:35:45',NULL),(42,2,13,'2021-9-22-00005',0.72,12,12,12,100.00,34.67,5.00,311.00,8.00,225.20,311.00,311.00,17.00,0.00,0.00,'2021-09-22 11:38:40','2021-09-22 11:38:40',NULL),(43,2,13,'2021-9-22-00000006',0.72,12,12,12,100.00,60.58,5.00,437.00,21.00,337.40,437.00,437.00,17.20,0.00,0.00,'2021-09-22 11:41:40','2021-09-22 11:41:40',NULL),(44,2,13,'2021-9-22-00000xx1',0.71,12,12,12,100.00,61.33,5.00,503.00,7.00,401.30,503.00,503.00,17.10,0.00,0.00,'2021-09-22 11:48:00','2021-09-22 11:48:00',NULL),(45,2,13,'2021-9-22-00000xx2',0.71,12,12,12,100.00,67.42,5.00,539.00,6.50,437.90,539.00,539.00,17.20,0.00,0.00,'2021-09-22 11:48:20','2021-09-22 11:48:20',NULL),(46,2,13,'2021-performance002',0.62,12,12,12,100.00,59.33,5.00,479.00,9.00,379.10,479.00,479.00,17.10,0.00,0.00,'2021-09-22 18:34:00','2021-09-22 18:34:00',NULL),(47,2,13,'xx1',0.72,12,12,12,100.00,66.58,6.00,446.00,27.50,344.00,446.00,446.00,17.00,0.00,0.00,'2021-09-24 16:41:00','2021-09-24 16:41:00',NULL);
/*!40000 ALTER TABLE `apicases_performancestatistics` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `apicases_report`
--

DROP TABLE IF EXISTS `apicases_report`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `apicases_report` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Id',
  `caseid` bigint(20) unsigned NOT NULL COMMENT '用例id',
  `testplanid` bigint(20) unsigned NOT NULL COMMENT '执行计划id',
  `batchname` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '批次',
  `slaverid` bigint(20) unsigned NOT NULL COMMENT '执行机id',
  `status` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '运行结果，成功，失败，异常',
  `respone` varchar(5000) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '返回结果',
  `assertvalue` varchar(5000) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '断言详细经过',
  `runtime` bigint(20) NOT NULL COMMENT '运行时长',
  `expect` varchar(500) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '期望值',
  `errorinfo` varchar(5000) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '错误信息',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `lastmodify_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '上一次修改时间',
  `creator` varchar(10) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '创建者',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='api用例报告表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `apicases_report`
--

LOCK TABLES `apicases_report` WRITE;
/*!40000 ALTER TABLE `apicases_report` DISABLE KEYS */;
/*!40000 ALTER TABLE `apicases_report` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `apicases_report_performance`
--

DROP TABLE IF EXISTS `apicases_report_performance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `apicases_report_performance` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Id',
  `caseid` bigint(20) unsigned NOT NULL COMMENT '用例id',
  `testplanid` bigint(20) unsigned NOT NULL COMMENT '执行计划id',
  `batchname` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '批次',
  `slaverid` bigint(20) unsigned NOT NULL COMMENT '执行机id',
  `status` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '运行结果，成功，失败，异常',
  `respone` varchar(5000) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '返回结果',
  `assertvalue` varchar(5000) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '断言详细经过',
  `runtime` bigint(20) NOT NULL COMMENT '运行时长',
  `expect` varchar(500) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '期望值',
  `errorinfo` varchar(500) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '错误信息',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `lastmodify_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '上一次修改时间',
  `creator` varchar(10) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '创建者',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=204 DEFAULT CHARSET=utf8mb4 COMMENT='api用例报告表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `apicases_report_performance`
--

LOCK TABLES `apicases_report_performance` WRITE;
/*!40000 ALTER TABLE `apicases_report_performance` DISABLE KEYS */;
INSERT INTO `apicases_report_performance` VALUES (1,2,13,'2021-9-8-0001',12,'失败','','',13,'$.code=500|$.message=服务器伐开心,我们正在想办法','API的Header参数无测试用例数据，请完成数据后再运行','2021-09-09 10:22:21','2021-09-09 10:22:21','admin'),(2,2,13,'2021-9-8-0001',12,'失败','','',0,'$.code=500|$.message=服务器伐开心,我们正在想办法','API的Header参数无测试用例数据，请完成数据后再运行','2021-09-09 10:22:21','2021-09-09 10:22:21','admin'),(3,2,13,'2021-9-8-0001',12,'失败','','',0,'$.code=500|$.message=服务器伐开心,我们正在想办法','API的Header参数无测试用例数据，请完成数据后再运行','2021-09-09 10:22:21','2021-09-09 10:22:21','admin'),(4,2,13,'2021-9-8-0001',12,'失败','','',1,'$.code=500|$.message=服务器伐开心,我们正在想办法','API的Header参数无测试用例数据，请完成数据后再运行','2021-09-09 10:22:21','2021-09-09 10:22:21','admin'),(5,2,13,'2021-9-8-0001',12,'失败','','',1,'$.code=500|$.message=服务器伐开心,我们正在想办法','API的Header参数无测试用例数据，请完成数据后再运行','2021-09-09 10:22:21','2021-09-09 10:22:21','admin'),(6,2,13,'2021-9-8-0001',12,'失败','','',0,'$.code=500|$.message=服务器伐开心,我们正在想办法','API的Header参数无测试用例数据，请完成数据后再运行','2021-09-09 10:22:21','2021-09-09 10:22:21','admin'),(7,2,13,'2021-9-8-0001',12,'失败','','',1,'$.code=500|$.message=服务器伐开心,我们正在想办法','API的Header参数无测试用例数据，请完成数据后再运行','2021-09-09 10:22:21','2021-09-09 10:22:21','admin'),(8,2,13,'2021-9-8-0001',12,'失败','','',0,'$.code=500|$.message=服务器伐开心,我们正在想办法','API的Header参数无测试用例数据，请完成数据后再运行','2021-09-09 10:22:21','2021-09-09 10:22:21','admin'),(9,2,13,'2021-9-8-0001',12,'失败','','',2,'$.code=500|$.message=服务器伐开心,我们正在想办法','API的Header参数无测试用例数据，请完成数据后再运行','2021-09-09 10:22:22','2021-09-09 10:22:22','admin'),(10,2,13,'2021-9-8-0001',12,'失败','','',1,'$.code=500|$.message=服务器伐开心,我们正在想办法','API的Header参数无测试用例数据，请完成数据后再运行','2021-09-09 10:22:22','2021-09-09 10:22:22','admin'),(11,2,13,'2021-9-8-0001',12,'失败','','',1,'$.code=500|$.message=服务器伐开心,我们正在想办法','API的Header参数无测试用例数据，请完成数据后再运行','2021-09-09 10:22:22','2021-09-09 10:22:22','admin'),(12,2,13,'2021-9-8-0001',12,'失败','','',1,'$.code=500|$.message=服务器伐开心,我们正在想办法','API的Header参数无测试用例数据，请完成数据后再运行','2021-09-09 10:22:22','2021-09-09 10:22:22','admin'),(13,2,13,'2021-9-9-000001',12,'失败','','',9,'$.code=500|$.message=服务器伐开心,我们正在想办法','API的Header参数无测试用例数据，请完成数据后再运行','2021-09-09 10:25:16','2021-09-09 10:25:16','admin'),(14,2,13,'2021-9-9-000001',12,'失败','','',0,'$.code=500|$.message=服务器伐开心,我们正在想办法','API的Header参数无测试用例数据，请完成数据后再运行','2021-09-09 10:25:16','2021-09-09 10:25:16','admin'),(15,2,13,'2021-9-9-000001',12,'失败','','',0,'$.code=500|$.message=服务器伐开心,我们正在想办法','API的Header参数无测试用例数据，请完成数据后再运行','2021-09-09 10:25:16','2021-09-09 10:25:16','admin'),(16,2,13,'2021-9-9-000001',12,'失败','','',0,'$.code=500|$.message=服务器伐开心,我们正在想办法','API的Header参数无测试用例数据，请完成数据后再运行','2021-09-09 10:25:16','2021-09-09 10:25:16','admin'),(17,2,13,'2021-9-9-000001',12,'失败','','',2,'$.code=500|$.message=服务器伐开心,我们正在想办法','API的Header参数无测试用例数据，请完成数据后再运行','2021-09-09 10:25:16','2021-09-09 10:25:16','admin'),(18,2,13,'2021-9-9-000001',12,'失败','','',2,'$.code=500|$.message=服务器伐开心,我们正在想办法','API的Header参数无测试用例数据，请完成数据后再运行','2021-09-09 10:25:16','2021-09-09 10:25:16','admin'),(19,2,13,'2021-9-9-000001',12,'失败','','',0,'$.code=500|$.message=服务器伐开心,我们正在想办法','API的Header参数无测试用例数据，请完成数据后再运行','2021-09-09 10:25:16','2021-09-09 10:25:16','admin'),(20,2,13,'2021-9-9-000001',12,'失败','','',1,'$.code=500|$.message=服务器伐开心,我们正在想办法','API的Header参数无测试用例数据，请完成数据后再运行','2021-09-09 10:25:16','2021-09-09 10:25:16','admin'),(21,2,13,'2021-9-9-000001',12,'失败','','',1,'$.code=500|$.message=服务器伐开心,我们正在想办法','API的Header参数无测试用例数据，请完成数据后再运行','2021-09-09 10:25:16','2021-09-09 10:25:16','admin'),(22,2,13,'2021-9-9-000001',12,'失败','','',2,'$.code=500|$.message=服务器伐开心,我们正在想办法','API的Header参数无测试用例数据，请完成数据后再运行','2021-09-09 10:25:16','2021-09-09 10:25:16','admin'),(23,2,13,'2021-9-9-000001',12,'失败','','',1,'$.code=500|$.message=服务器伐开心,我们正在想办法','API的Header参数无测试用例数据，请完成数据后再运行','2021-09-09 10:25:16','2021-09-09 10:25:16','admin'),(24,2,13,'2021-9-9-000001',12,'失败','','',1,'$.code=500|$.message=服务器伐开心,我们正在想办法','API的Header参数无测试用例数据，请完成数据后再运行','2021-09-09 10:25:16','2021-09-09 10:25:16','admin'),(25,2,13,'2021-9-22-0001',12,'失败','','',12,'$.code=500|$.message=服务器伐开心,我们正在想办法','API的Header参数无测试用例数据，请完成数据后再运行','2021-09-22 09:40:41','2021-09-22 09:40:41','admin'),(26,2,13,'2021-9-22-0001',12,'失败','','',0,'$.code=500|$.message=服务器伐开心,我们正在想办法','API的Header参数无测试用例数据，请完成数据后再运行','2021-09-22 09:40:41','2021-09-22 09:40:41','admin'),(27,2,13,'2021-9-22-0001',12,'失败','','',1,'$.code=500|$.message=服务器伐开心,我们正在想办法','API的Header参数无测试用例数据，请完成数据后再运行','2021-09-22 09:40:41','2021-09-22 09:40:41','admin'),(28,2,13,'2021-9-22-0001',12,'失败','','',1,'$.code=500|$.message=服务器伐开心,我们正在想办法','API的Header参数无测试用例数据，请完成数据后再运行','2021-09-22 09:40:41','2021-09-22 09:40:41','admin'),(29,2,13,'2021-9-22-0001',12,'失败','','',1,'$.code=500|$.message=服务器伐开心,我们正在想办法','API的Header参数无测试用例数据，请完成数据后再运行','2021-09-22 09:40:41','2021-09-22 09:40:41','admin'),(30,2,13,'2021-9-22-0001',12,'失败','','',1,'$.code=500|$.message=服务器伐开心,我们正在想办法','API的Header参数无测试用例数据，请完成数据后再运行','2021-09-22 09:40:41','2021-09-22 09:40:41','admin'),(31,2,13,'2021-9-22-0001',12,'失败','','',0,'$.code=500|$.message=服务器伐开心,我们正在想办法','API的Header参数无测试用例数据，请完成数据后再运行','2021-09-22 09:40:41','2021-09-22 09:40:41','admin'),(32,2,13,'2021-9-22-0001',12,'失败','','',1,'$.code=500|$.message=服务器伐开心,我们正在想办法','API的Header参数无测试用例数据，请完成数据后再运行','2021-09-22 09:40:41','2021-09-22 09:40:41','admin'),(33,2,13,'2021-9-22-0001',12,'失败','','',1,'$.code=500|$.message=服务器伐开心,我们正在想办法','API的Header参数无测试用例数据，请完成数据后再运行','2021-09-22 09:40:42','2021-09-22 09:40:42','admin'),(34,2,13,'2021-9-22-0001',12,'失败','','',0,'$.code=500|$.message=服务器伐开心,我们正在想办法','API的Header参数无测试用例数据，请完成数据后再运行','2021-09-22 09:40:42','2021-09-22 09:40:42','admin'),(35,2,13,'2021-9-22-0001',12,'失败','','',0,'$.code=500|$.message=服务器伐开心,我们正在想办法','API的Header参数无测试用例数据，请完成数据后再运行','2021-09-22 09:40:42','2021-09-22 09:40:42','admin'),(36,2,13,'2021-9-22-0001',12,'失败','','',1,'$.code=500|$.message=服务器伐开心,我们正在想办法','API的Header参数无测试用例数据，请完成数据后再运行','2021-09-22 09:40:42','2021-09-22 09:40:42','admin'),(37,2,13,'2021-9-22-00000002',12,'失败','','',20,'$.code=500|$.message=服务器伐开心,我们正在想办法','API的Header参数无测试用例数据，请完成数据后再运行','2021-09-22 09:50:56','2021-09-22 09:50:56','admin'),(38,2,13,'2021-9-22-00000002',12,'失败','','',1,'$.code=500|$.message=服务器伐开心,我们正在想办法','API的Header参数无测试用例数据，请完成数据后再运行','2021-09-22 09:50:56','2021-09-22 09:50:56','admin'),(39,2,13,'2021-9-22-00000002',12,'失败','','',0,'$.code=500|$.message=服务器伐开心,我们正在想办法','API的Header参数无测试用例数据，请完成数据后再运行','2021-09-22 09:50:56','2021-09-22 09:50:56','admin'),(40,2,13,'2021-9-22-00000002',12,'失败','','',0,'$.code=500|$.message=服务器伐开心,我们正在想办法','API的Header参数无测试用例数据，请完成数据后再运行','2021-09-22 09:50:56','2021-09-22 09:50:56','admin'),(41,2,13,'2021-9-22-00000002',12,'失败','','',1,'$.code=500|$.message=服务器伐开心,我们正在想办法','API的Header参数无测试用例数据，请完成数据后再运行','2021-09-22 09:50:56','2021-09-22 09:50:56','admin'),(42,2,13,'2021-9-22-00000002',12,'失败','','',1,'$.code=500|$.message=服务器伐开心,我们正在想办法','API的Header参数无测试用例数据，请完成数据后再运行','2021-09-22 09:50:56','2021-09-22 09:50:56','admin'),(43,2,13,'2021-9-22-00000002',12,'失败','','',0,'$.code=500|$.message=服务器伐开心,我们正在想办法','API的Header参数无测试用例数据，请完成数据后再运行','2021-09-22 09:50:56','2021-09-22 09:50:56','admin'),(44,2,13,'2021-9-22-00000002',12,'失败','','',1,'$.code=500|$.message=服务器伐开心,我们正在想办法','API的Header参数无测试用例数据，请完成数据后再运行','2021-09-22 09:50:56','2021-09-22 09:50:56','admin'),(45,2,13,'2021-9-22-00000002',12,'失败','','',1,'$.code=500|$.message=服务器伐开心,我们正在想办法','API的Header参数无测试用例数据，请完成数据后再运行','2021-09-22 09:50:56','2021-09-22 09:50:56','admin'),(46,2,13,'2021-9-22-00000002',12,'失败','','',0,'$.code=500|$.message=服务器伐开心,我们正在想办法','API的Header参数无测试用例数据，请完成数据后再运行','2021-09-22 09:50:56','2021-09-22 09:50:56','admin'),(47,2,13,'2021-9-22-00000002',12,'失败','','',0,'$.code=500|$.message=服务器伐开心,我们正在想办法','API的Header参数无测试用例数据，请完成数据后再运行','2021-09-22 09:50:56','2021-09-22 09:50:56','admin'),(48,2,13,'2021-9-22-00000002',12,'失败','','',1,'$.code=500|$.message=服务器伐开心,我们正在想办法','API的Header参数无测试用例数据，请完成数据后再运行','2021-09-22 09:50:56','2021-09-22 09:50:56','admin'),(49,2,13,'2021-9-22-0000003',12,'失败','','',0,'$.code=500|$.message=服务器伐开心,我们正在想办法','API的Header参数无测试用例数据，请完成数据后再运行','2021-09-22 10:11:46','2021-09-22 10:11:46','admin'),(50,2,13,'2021-9-22-0000003',12,'失败','','',12,'$.code=500|$.message=服务器伐开心,我们正在想办法','API的Header参数无测试用例数据，请完成数据后再运行','2021-09-22 10:11:46','2021-09-22 10:11:46','admin'),(51,2,13,'2021-9-22-0000003',12,'失败','','',0,'$.code=500|$.message=服务器伐开心,我们正在想办法','API的Header参数无测试用例数据，请完成数据后再运行','2021-09-22 10:11:46','2021-09-22 10:11:46','admin'),(52,2,13,'2021-9-22-0000003',12,'失败','','',0,'$.code=500|$.message=服务器伐开心,我们正在想办法','API的Header参数无测试用例数据，请完成数据后再运行','2021-09-22 10:11:46','2021-09-22 10:11:46','admin'),(53,2,13,'2021-9-22-0000003',12,'失败','','',1,'$.code=500|$.message=服务器伐开心,我们正在想办法','API的Header参数无测试用例数据，请完成数据后再运行','2021-09-22 10:11:46','2021-09-22 10:11:46','admin'),(54,2,13,'2021-9-22-0000003',12,'失败','','',1,'$.code=500|$.message=服务器伐开心,我们正在想办法','API的Header参数无测试用例数据，请完成数据后再运行','2021-09-22 10:11:46','2021-09-22 10:11:46','admin'),(55,2,13,'2021-9-22-0000003',12,'失败','','',1,'$.code=500|$.message=服务器伐开心,我们正在想办法','API的Header参数无测试用例数据，请完成数据后再运行','2021-09-22 10:11:46','2021-09-22 10:11:46','admin'),(56,2,13,'2021-9-22-0000003',12,'失败','','',1,'$.code=500|$.message=服务器伐开心,我们正在想办法','API的Header参数无测试用例数据，请完成数据后再运行','2021-09-22 10:11:46','2021-09-22 10:11:46','admin'),(57,2,13,'2021-9-22-0000003',12,'失败','','',1,'$.code=500|$.message=服务器伐开心,我们正在想办法','API的Header参数无测试用例数据，请完成数据后再运行','2021-09-22 10:11:47','2021-09-22 10:11:47','admin'),(58,2,13,'2021-9-22-0000003',12,'失败','','',1,'$.code=500|$.message=服务器伐开心,我们正在想办法','API的Header参数无测试用例数据，请完成数据后再运行','2021-09-22 10:11:47','2021-09-22 10:11:47','admin'),(59,2,13,'2021-9-22-0000003',12,'失败','','',1,'$.code=500|$.message=服务器伐开心,我们正在想办法','API的Header参数无测试用例数据，请完成数据后再运行','2021-09-22 10:11:47','2021-09-22 10:11:47','admin'),(60,2,13,'2021-9-22-0000003',12,'失败','','',1,'$.code=500|$.message=服务器伐开心,我们正在想办法','API的Header参数无测试用例数据，请完成数据后再运行','2021-09-22 10:11:47','2021-09-22 10:11:47','admin'),(61,2,13,'2021-9-22-000004',12,'失败','','',1,'$.code=500|$.message=服务器伐开心,我们正在想办法','API的Header参数无测试用例数据，请完成数据后再运行','2021-09-22 11:35:30','2021-09-22 11:35:30','admin'),(62,2,13,'2021-9-22-000004',12,'失败','','',14,'$.code=500|$.message=服务器伐开心,我们正在想办法','API的Header参数无测试用例数据，请完成数据后再运行','2021-09-22 11:35:29','2021-09-22 11:35:29','admin'),(63,2,13,'2021-9-22-000004',12,'失败','','',2,'$.code=500|$.message=服务器伐开心,我们正在想办法','API的Header参数无测试用例数据，请完成数据后再运行','2021-09-22 11:35:30','2021-09-22 11:35:30','admin'),(64,2,13,'2021-9-22-000004',12,'失败','','',4,'$.code=500|$.message=服务器伐开心,我们正在想办法','API的Header参数无测试用例数据，请完成数据后再运行','2021-09-22 11:35:30','2021-09-22 11:35:30','admin'),(65,2,13,'2021-9-22-000004',12,'失败','','',2,'$.code=500|$.message=服务器伐开心,我们正在想办法','API的Header参数无测试用例数据，请完成数据后再运行','2021-09-22 11:35:30','2021-09-22 11:35:30','admin'),(66,2,13,'2021-9-22-000004',12,'失败','','',1,'$.code=500|$.message=服务器伐开心,我们正在想办法','API的Header参数无测试用例数据，请完成数据后再运行','2021-09-22 11:35:30','2021-09-22 11:35:30','admin'),(67,2,13,'2021-9-22-000004',12,'失败','','',0,'$.code=500|$.message=服务器伐开心,我们正在想办法','API的Header参数无测试用例数据，请完成数据后再运行','2021-09-22 11:35:30','2021-09-22 11:35:30','admin'),(68,2,13,'2021-9-22-000004',12,'失败','','',0,'$.code=500|$.message=服务器伐开心,我们正在想办法','API的Header参数无测试用例数据，请完成数据后再运行','2021-09-22 11:35:30','2021-09-22 11:35:30','admin'),(69,2,13,'2021-9-22-000004',12,'失败','','',1,'$.code=500|$.message=服务器伐开心,我们正在想办法','API的Header参数无测试用例数据，请完成数据后再运行','2021-09-22 11:35:30','2021-09-22 11:35:30','admin'),(70,2,13,'2021-9-22-000004',12,'失败','','',16,'$.code=500|$.message=服务器伐开心,我们正在想办法','API的Header参数无测试用例数据，请完成数据后再运行','2021-09-22 11:35:29','2021-09-22 11:35:29','admin'),(71,2,13,'2021-9-22-000004',12,'失败','','',1,'$.code=500|$.message=服务器伐开心,我们正在想办法','API的Header参数无测试用例数据，请完成数据后再运行','2021-09-22 11:35:30','2021-09-22 11:35:30','admin'),(72,2,13,'2021-9-22-000004',12,'失败','','',1,'$.code=500|$.message=服务器伐开心,我们正在想办法','API的Header参数无测试用例数据，请完成数据后再运行','2021-09-22 11:35:30','2021-09-22 11:35:30','admin'),(73,2,13,'2021-9-22-000004',12,'失败','','',1,'$.code=500|$.message=服务器伐开心,我们正在想办法','API的Header参数无测试用例数据，请完成数据后再运行','2021-09-22 11:35:30','2021-09-22 11:35:30','admin'),(74,2,13,'2021-9-22-000004',12,'失败','','',1,'$.code=500|$.message=服务器伐开心,我们正在想办法','API的Header参数无测试用例数据，请完成数据后再运行','2021-09-22 11:35:30','2021-09-22 11:35:30','admin'),(75,2,13,'2021-9-22-000004',12,'失败','','',1,'$.code=500|$.message=服务器伐开心,我们正在想办法','API的Header参数无测试用例数据，请完成数据后再运行','2021-09-22 11:35:30','2021-09-22 11:35:30','admin'),(76,2,13,'2021-9-22-000004',12,'失败','','',0,'$.code=500|$.message=服务器伐开心,我们正在想办法','API的Header参数无测试用例数据，请完成数据后再运行','2021-09-22 11:35:30','2021-09-22 11:35:30','admin'),(77,2,13,'2021-9-22-000004',12,'失败','','',10,'$.code=500|$.message=服务器伐开心,我们正在想办法','API的Header参数无测试用例数据，请完成数据后再运行','2021-09-22 11:35:29','2021-09-22 11:35:29','admin'),(78,2,13,'2021-9-22-000004',12,'失败','','',1,'$.code=500|$.message=服务器伐开心,我们正在想办法','API的Header参数无测试用例数据，请完成数据后再运行','2021-09-22 11:35:30','2021-09-22 11:35:30','admin'),(79,2,13,'2021-9-22-000004',12,'失败','','',13,'$.code=500|$.message=服务器伐开心,我们正在想办法','API的Header参数无测试用例数据，请完成数据后再运行','2021-09-22 11:35:29','2021-09-22 11:35:29','admin'),(80,2,13,'2021-9-22-000004',12,'失败','','',2,'$.code=500|$.message=服务器伐开心,我们正在想办法','API的Header参数无测试用例数据，请完成数据后再运行','2021-09-22 11:35:30','2021-09-22 11:35:30','admin'),(81,2,13,'2021-9-22-000004',12,'失败','','',11,'$.code=500|$.message=服务器伐开心,我们正在想办法','API的Header参数无测试用例数据，请完成数据后再运行','2021-09-22 11:35:29','2021-09-22 11:35:29','admin'),(82,2,13,'2021-9-22-000004',12,'失败','','',1,'$.code=500|$.message=服务器伐开心,我们正在想办法','API的Header参数无测试用例数据，请完成数据后再运行','2021-09-22 11:35:30','2021-09-22 11:35:30','admin'),(83,2,13,'2021-9-22-000004',12,'失败','','',1,'$.code=500|$.message=服务器伐开心,我们正在想办法','API的Header参数无测试用例数据，请完成数据后再运行','2021-09-22 11:35:30','2021-09-22 11:35:30','admin'),(84,2,13,'2021-9-22-000004',12,'失败','','',0,'$.code=500|$.message=服务器伐开心,我们正在想办法','API的Header参数无测试用例数据，请完成数据后再运行','2021-09-22 11:35:30','2021-09-22 11:35:30','admin'),(85,2,13,'2021-9-22-000004',12,'失败','','',1,'$.code=500|$.message=服务器伐开心,我们正在想办法','API的Header参数无测试用例数据，请完成数据后再运行','2021-09-22 11:35:30','2021-09-22 11:35:30','admin'),(86,2,13,'2021-9-22-000004',12,'失败','','',0,'$.code=500|$.message=服务器伐开心,我们正在想办法','API的Header参数无测试用例数据，请完成数据后再运行','2021-09-22 11:35:30','2021-09-22 11:35:30','admin'),(87,2,13,'2021-9-22-000004',12,'失败','','',0,'$.code=500|$.message=服务器伐开心,我们正在想办法','API的Header参数无测试用例数据，请完成数据后再运行','2021-09-22 11:35:30','2021-09-22 11:35:30','admin'),(88,2,13,'2021-9-22-000004',12,'失败','','',0,'$.code=500|$.message=服务器伐开心,我们正在想办法','API的Header参数无测试用例数据，请完成数据后再运行','2021-09-22 11:35:30','2021-09-22 11:35:30','admin'),(89,2,13,'2021-9-22-000004',12,'失败','','',2,'$.code=500|$.message=服务器伐开心,我们正在想办法','API的Header参数无测试用例数据，请完成数据后再运行','2021-09-22 11:35:30','2021-09-22 11:35:30','admin'),(90,2,13,'2021-9-22-000004',12,'失败','','',0,'$.code=500|$.message=服务器伐开心,我们正在想办法','API的Header参数无测试用例数据，请完成数据后再运行','2021-09-22 11:35:30','2021-09-22 11:35:30','admin'),(91,2,13,'2021-9-22-000004',12,'失败','','',0,'$.code=500|$.message=服务器伐开心,我们正在想办法','API的Header参数无测试用例数据，请完成数据后再运行','2021-09-22 11:35:30','2021-09-22 11:35:30','admin'),(92,2,13,'2021-9-22-000004',12,'失败','','',0,'$.code=500|$.message=服务器伐开心,我们正在想办法','API的Header参数无测试用例数据，请完成数据后再运行','2021-09-22 11:35:30','2021-09-22 11:35:30','admin'),(93,2,13,'2021-9-22-000004',12,'失败','','',2,'$.code=500|$.message=服务器伐开心,我们正在想办法','API的Header参数无测试用例数据，请完成数据后再运行','2021-09-22 11:35:30','2021-09-22 11:35:30','admin'),(94,2,13,'2021-9-22-000004',12,'失败','','',0,'$.code=500|$.message=服务器伐开心,我们正在想办法','API的Header参数无测试用例数据，请完成数据后再运行','2021-09-22 11:35:30','2021-09-22 11:35:30','admin'),(95,2,13,'2021-9-22-000004',12,'失败','','',1,'$.code=500|$.message=服务器伐开心,我们正在想办法','API的Header参数无测试用例数据，请完成数据后再运行','2021-09-22 11:35:30','2021-09-22 11:35:30','admin'),(96,2,13,'2021-9-22-000004',12,'失败','','',1,'$.code=500|$.message=服务器伐开心,我们正在想办法','API的Header参数无测试用例数据，请完成数据后再运行','2021-09-22 11:35:30','2021-09-22 11:35:30','admin'),(97,2,13,'2021-9-22-000004',12,'失败','','',1,'$.code=500|$.message=服务器伐开心,我们正在想办法','API的Header参数无测试用例数据，请完成数据后再运行','2021-09-22 11:35:30','2021-09-22 11:35:30','admin'),(98,2,13,'2021-9-22-000004',12,'失败','','',0,'$.code=500|$.message=服务器伐开心,我们正在想办法','API的Header参数无测试用例数据，请完成数据后再运行','2021-09-22 11:35:30','2021-09-22 11:35:30','admin'),(99,2,13,'2021-9-22-000004',12,'失败','','',0,'$.code=500|$.message=服务器伐开心,我们正在想办法','API的Header参数无测试用例数据，请完成数据后再运行','2021-09-22 11:35:30','2021-09-22 11:35:30','admin'),(100,2,13,'2021-9-22-000004',12,'失败','','',0,'$.code=500|$.message=服务器伐开心,我们正在想办法','API的Header参数无测试用例数据，请完成数据后再运行','2021-09-22 11:35:30','2021-09-22 11:35:30','admin'),(101,2,13,'2021-9-22-000004',12,'失败','','',19,'$.code=500|$.message=服务器伐开心,我们正在想办法','API的Header参数无测试用例数据，请完成数据后再运行','2021-09-22 11:35:30','2021-09-22 11:35:30','admin'),(102,2,13,'2021-9-22-000004',12,'失败','','',0,'$.code=500|$.message=服务器伐开心,我们正在想办法','API的Header参数无测试用例数据，请完成数据后再运行','2021-09-22 11:35:30','2021-09-22 11:35:30','admin'),(103,2,13,'2021-9-22-000004',12,'失败','','',1,'$.code=500|$.message=服务器伐开心,我们正在想办法','API的Header参数无测试用例数据，请完成数据后再运行','2021-09-22 11:35:30','2021-09-22 11:35:30','admin'),(104,2,13,'2021-9-22-000004',12,'失败','','',0,'$.code=500|$.message=服务器伐开心,我们正在想办法','API的Header参数无测试用例数据，请完成数据后再运行','2021-09-22 11:35:30','2021-09-22 11:35:30','admin'),(105,2,13,'2021-9-22-000004',12,'失败','','',1,'$.code=500|$.message=服务器伐开心,我们正在想办法','API的Header参数无测试用例数据，请完成数据后再运行','2021-09-22 11:35:30','2021-09-22 11:35:30','admin'),(106,2,13,'2021-9-22-000004',12,'失败','','',0,'$.code=500|$.message=服务器伐开心,我们正在想办法','API的Header参数无测试用例数据，请完成数据后再运行','2021-09-22 11:35:30','2021-09-22 11:35:30','admin'),(107,2,13,'2021-9-22-000004',12,'失败','','',1,'$.code=500|$.message=服务器伐开心,我们正在想办法','API的Header参数无测试用例数据，请完成数据后再运行','2021-09-22 11:35:30','2021-09-22 11:35:30','admin'),(108,2,13,'2021-9-22-000004',12,'失败','','',3,'$.code=500|$.message=服务器伐开心,我们正在想办法','API的Header参数无测试用例数据，请完成数据后再运行','2021-09-22 11:35:30','2021-09-22 11:35:30','admin'),(109,2,13,'2021-9-22-000004',12,'失败','','',1,'$.code=500|$.message=服务器伐开心,我们正在想办法','API的Header参数无测试用例数据，请完成数据后再运行','2021-09-22 11:35:30','2021-09-22 11:35:30','admin'),(110,2,13,'2021-9-22-000004',12,'失败','','',0,'$.code=500|$.message=服务器伐开心,我们正在想办法','API的Header参数无测试用例数据，请完成数据后再运行','2021-09-22 11:35:30','2021-09-22 11:35:30','admin'),(111,2,13,'2021-9-22-000004',12,'失败','','',1,'$.code=500|$.message=服务器伐开心,我们正在想办法','API的Header参数无测试用例数据，请完成数据后再运行','2021-09-22 11:35:30','2021-09-22 11:35:30','admin'),(112,2,13,'2021-9-22-000004',12,'失败','','',1,'$.code=500|$.message=服务器伐开心,我们正在想办法','API的Header参数无测试用例数据，请完成数据后再运行','2021-09-22 11:35:30','2021-09-22 11:35:30','admin'),(113,2,13,'2021-9-22-000004',12,'失败','','',0,'$.code=500|$.message=服务器伐开心,我们正在想办法','API的Header参数无测试用例数据，请完成数据后再运行','2021-09-22 11:35:30','2021-09-22 11:35:30','admin'),(114,2,13,'2021-9-22-000004',12,'失败','','',1,'$.code=500|$.message=服务器伐开心,我们正在想办法','API的Header参数无测试用例数据，请完成数据后再运行','2021-09-22 11:35:30','2021-09-22 11:35:30','admin'),(115,2,13,'2021-9-22-000004',12,'失败','','',0,'$.code=500|$.message=服务器伐开心,我们正在想办法','API的Header参数无测试用例数据，请完成数据后再运行','2021-09-22 11:35:30','2021-09-22 11:35:30','admin'),(116,2,13,'2021-9-22-000004',12,'失败','','',1,'$.code=500|$.message=服务器伐开心,我们正在想办法','API的Header参数无测试用例数据，请完成数据后再运行','2021-09-22 11:35:30','2021-09-22 11:35:30','admin'),(117,2,13,'2021-9-22-000004',12,'失败','','',0,'$.code=500|$.message=服务器伐开心,我们正在想办法','API的Header参数无测试用例数据，请完成数据后再运行','2021-09-22 11:35:30','2021-09-22 11:35:30','admin'),(118,2,13,'2021-9-22-000004',12,'失败','','',1,'$.code=500|$.message=服务器伐开心,我们正在想办法','API的Header参数无测试用例数据，请完成数据后再运行','2021-09-22 11:35:30','2021-09-22 11:35:30','admin'),(119,2,13,'2021-9-22-000004',12,'失败','','',1,'$.code=500|$.message=服务器伐开心,我们正在想办法','API的Header参数无测试用例数据，请完成数据后再运行','2021-09-22 11:35:30','2021-09-22 11:35:30','admin'),(120,2,13,'2021-9-22-000004',12,'失败','','',0,'$.code=500|$.message=服务器伐开心,我们正在想办法','API的Header参数无测试用例数据，请完成数据后再运行','2021-09-22 11:35:30','2021-09-22 11:35:30','admin'),(121,2,13,'2021-9-22-000004',12,'失败','','',1,'$.code=500|$.message=服务器伐开心,我们正在想办法','API的Header参数无测试用例数据，请完成数据后再运行','2021-09-22 11:35:30','2021-09-22 11:35:30','admin'),(122,2,13,'2021-9-22-000004',12,'失败','','',1,'$.code=500|$.message=服务器伐开心,我们正在想办法','API的Header参数无测试用例数据，请完成数据后再运行','2021-09-22 11:35:30','2021-09-22 11:35:30','admin'),(123,2,13,'2021-9-22-000004',12,'失败','','',1,'$.code=500|$.message=服务器伐开心,我们正在想办法','API的Header参数无测试用例数据，请完成数据后再运行','2021-09-22 11:35:30','2021-09-22 11:35:30','admin'),(124,2,13,'2021-9-22-000004',12,'失败','','',1,'$.code=500|$.message=服务器伐开心,我们正在想办法','API的Header参数无测试用例数据，请完成数据后再运行','2021-09-22 11:35:30','2021-09-22 11:35:30','admin'),(125,2,13,'2021-9-22-000004',12,'失败','','',0,'$.code=500|$.message=服务器伐开心,我们正在想办法','API的Header参数无测试用例数据，请完成数据后再运行','2021-09-22 11:35:30','2021-09-22 11:35:30','admin'),(126,2,13,'2021-9-22-000004',12,'失败','','',1,'$.code=500|$.message=服务器伐开心,我们正在想办法','API的Header参数无测试用例数据，请完成数据后再运行','2021-09-22 11:35:30','2021-09-22 11:35:30','admin'),(127,2,13,'2021-9-22-000004',12,'失败','','',1,'$.code=500|$.message=服务器伐开心,我们正在想办法','API的Header参数无测试用例数据，请完成数据后再运行','2021-09-22 11:35:30','2021-09-22 11:35:30','admin'),(128,2,13,'2021-9-22-000004',12,'失败','','',1,'$.code=500|$.message=服务器伐开心,我们正在想办法','API的Header参数无测试用例数据，请完成数据后再运行','2021-09-22 11:35:30','2021-09-22 11:35:30','admin'),(129,2,13,'2021-9-22-000004',12,'失败','','',2,'$.code=500|$.message=服务器伐开心,我们正在想办法','API的Header参数无测试用例数据，请完成数据后再运行','2021-09-22 11:35:30','2021-09-22 11:35:30','admin'),(130,2,13,'2021-9-22-000004',12,'失败','','',1,'$.code=500|$.message=服务器伐开心,我们正在想办法','API的Header参数无测试用例数据，请完成数据后再运行','2021-09-22 11:35:30','2021-09-22 11:35:30','admin'),(131,2,13,'2021-9-22-000004',12,'失败','','',1,'$.code=500|$.message=服务器伐开心,我们正在想办法','API的Header参数无测试用例数据，请完成数据后再运行','2021-09-22 11:35:30','2021-09-22 11:35:30','admin'),(132,2,13,'2021-9-22-000004',12,'失败','','',0,'$.code=500|$.message=服务器伐开心,我们正在想办法','API的Header参数无测试用例数据，请完成数据后再运行','2021-09-22 11:35:30','2021-09-22 11:35:30','admin'),(133,2,13,'2021-9-22-00005',12,'失败','','',11,'$.code=500|$.message=服务器伐开心,我们正在想办法','API的Header参数无测试用例数据，请完成数据后再运行','2021-09-22 11:38:36','2021-09-22 11:38:36','admin'),(134,2,13,'2021-9-22-00005',12,'失败','','',1,'$.code=500|$.message=服务器伐开心,我们正在想办法','API的Header参数无测试用例数据，请完成数据后再运行','2021-09-22 11:38:36','2021-09-22 11:38:36','admin'),(135,2,13,'2021-9-22-00005',12,'失败','','',1,'$.code=500|$.message=服务器伐开心,我们正在想办法','API的Header参数无测试用例数据，请完成数据后再运行','2021-09-22 11:38:36','2021-09-22 11:38:36','admin'),(136,2,13,'2021-9-22-00005',12,'失败','','',0,'$.code=500|$.message=服务器伐开心,我们正在想办法','API的Header参数无测试用例数据，请完成数据后再运行','2021-09-22 11:38:36','2021-09-22 11:38:36','admin'),(137,2,13,'2021-9-22-00005',12,'失败','','',0,'$.code=500|$.message=服务器伐开心,我们正在想办法','API的Header参数无测试用例数据，请完成数据后再运行','2021-09-22 11:38:36','2021-09-22 11:38:36','admin'),(138,2,13,'2021-9-22-00005',12,'失败','','',1,'$.code=500|$.message=服务器伐开心,我们正在想办法','API的Header参数无测试用例数据，请完成数据后再运行','2021-09-22 11:38:36','2021-09-22 11:38:36','admin'),(139,2,13,'2021-9-22-00005',12,'失败','','',1,'$.code=500|$.message=服务器伐开心,我们正在想办法','API的Header参数无测试用例数据，请完成数据后再运行','2021-09-22 11:38:36','2021-09-22 11:38:36','admin'),(140,2,13,'2021-9-22-00005',12,'失败','','',1,'$.code=500|$.message=服务器伐开心,我们正在想办法','API的Header参数无测试用例数据，请完成数据后再运行','2021-09-22 11:38:36','2021-09-22 11:38:36','admin'),(141,2,13,'2021-9-22-00005',12,'失败','','',1,'$.code=500|$.message=服务器伐开心,我们正在想办法','API的Header参数无测试用例数据，请完成数据后再运行','2021-09-22 11:38:37','2021-09-22 11:38:37','admin'),(142,2,13,'2021-9-22-00005',12,'失败','','',3,'$.code=500|$.message=服务器伐开心,我们正在想办法','API的Header参数无测试用例数据，请完成数据后再运行','2021-09-22 11:38:37','2021-09-22 11:38:37','admin'),(143,2,13,'2021-9-22-00005',12,'失败','','',0,'$.code=500|$.message=服务器伐开心,我们正在想办法','API的Header参数无测试用例数据，请完成数据后再运行','2021-09-22 11:38:37','2021-09-22 11:38:37','admin'),(144,2,13,'2021-9-22-00005',12,'失败','','',1,'$.code=500|$.message=服务器伐开心,我们正在想办法','API的Header参数无测试用例数据，请完成数据后再运行','2021-09-22 11:38:37','2021-09-22 11:38:37','admin'),(145,2,13,'2021-9-22-00000006',12,'失败','','',265,'$.code=500|$.message=服务器伐开心,我们正在想办法','请求url:https://marketing-ui.confucius.mobiredeem/ui/retrySendSmsOrFindShortUrl?orderId=2012030033263636700&goodsThirdPartyType=ALIPAY&status=OFF发生异常，原因：marketing-ui.confucius.mobiredeem: nodename nor servname provided, or not known','2021-09-22 11:41:38','2021-09-22 11:41:38','admin'),(146,2,13,'2021-9-22-00000006',12,'失败','','',2,'$.code=500|$.message=服务器伐开心,我们正在想办法','请求url:https://marketing-ui.confucius.mobiredeem/ui/retrySendSmsOrFindShortUrl?orderId=2012030033263636700&goodsThirdPartyType=ALIPAY&status=OFF发生异常，原因：marketing-ui.confucius.mobiredeem','2021-09-22 11:41:38','2021-09-22 11:41:38','admin'),(147,2,13,'2021-9-22-00000006',12,'失败','','',5,'$.code=500|$.message=服务器伐开心,我们正在想办法','请求url:https://marketing-ui.confucius.mobiredeem/ui/retrySendSmsOrFindShortUrl?orderId=2012030033263636700&goodsThirdPartyType=ALIPAY&status=OFF发生异常，原因：marketing-ui.confucius.mobiredeem','2021-09-22 11:41:38','2021-09-22 11:41:38','admin'),(148,2,13,'2021-9-22-00000006',12,'失败','','',5,'$.code=500|$.message=服务器伐开心,我们正在想办法','请求url:https://marketing-ui.confucius.mobiredeem/ui/retrySendSmsOrFindShortUrl?orderId=2012030033263636700&goodsThirdPartyType=ALIPAY&status=OFF发生异常，原因：marketing-ui.confucius.mobiredeem','2021-09-22 11:41:38','2021-09-22 11:41:38','admin'),(149,2,13,'2021-9-22-00000006',12,'失败','','',6,'$.code=500|$.message=服务器伐开心,我们正在想办法','请求url:https://marketing-ui.confucius.mobiredeem/ui/retrySendSmsOrFindShortUrl?orderId=2012030033263636700&goodsThirdPartyType=ALIPAY&status=OFF发生异常，原因：marketing-ui.confucius.mobiredeem','2021-09-22 11:41:38','2021-09-22 11:41:38','admin'),(150,2,13,'2021-9-22-00000006',12,'失败','','',6,'$.code=500|$.message=服务器伐开心,我们正在想办法','请求url:https://marketing-ui.confucius.mobiredeem/ui/retrySendSmsOrFindShortUrl?orderId=2012030033263636700&goodsThirdPartyType=ALIPAY&status=OFF发生异常，原因：marketing-ui.confucius.mobiredeem','2021-09-22 11:41:38','2021-09-22 11:41:38','admin'),(151,2,13,'2021-9-22-00000006',12,'失败','','',3,'$.code=500|$.message=服务器伐开心,我们正在想办法','请求url:https://marketing-ui.confucius.mobiredeem/ui/retrySendSmsOrFindShortUrl?orderId=2012030033263636700&goodsThirdPartyType=ALIPAY&status=OFF发生异常，原因：marketing-ui.confucius.mobiredeem','2021-09-22 11:41:38','2021-09-22 11:41:38','admin'),(152,2,13,'2021-9-22-00000006',12,'失败','','',18,'$.code=500|$.message=服务器伐开心,我们正在想办法','请求url:https://marketing-ui.confucius.mobiredeem/ui/retrySendSmsOrFindShortUrl?orderId=2012030033263636700&goodsThirdPartyType=ALIPAY&status=OFF发生异常，原因：marketing-ui.confucius.mobiredeem','2021-09-22 11:41:38','2021-09-22 11:41:38','admin'),(153,2,13,'2021-9-22-00000006',12,'失败','','',2,'$.code=500|$.message=服务器伐开心,我们正在想办法','请求url:https://marketing-ui.confucius.mobiredeem/ui/retrySendSmsOrFindShortUrl?orderId=2012030033263636700&goodsThirdPartyType=ALIPAY&status=OFF发生异常，原因：marketing-ui.confucius.mobiredeem','2021-09-22 11:41:38','2021-09-22 11:41:38','admin'),(154,2,13,'2021-9-22-00000006',12,'失败','','',2,'$.code=500|$.message=服务器伐开心,我们正在想办法','请求url:https://marketing-ui.confucius.mobiredeem/ui/retrySendSmsOrFindShortUrl?orderId=2012030033263636700&goodsThirdPartyType=ALIPAY&status=OFF发生异常，原因：marketing-ui.confucius.mobiredeem','2021-09-22 11:41:38','2021-09-22 11:41:38','admin'),(155,2,13,'2021-9-22-00000006',12,'失败','','',1,'$.code=500|$.message=服务器伐开心,我们正在想办法','请求url:https://marketing-ui.confucius.mobiredeem/ui/retrySendSmsOrFindShortUrl?orderId=2012030033263636700&goodsThirdPartyType=ALIPAY&status=OFF发生异常，原因：marketing-ui.confucius.mobiredeem','2021-09-22 11:41:38','2021-09-22 11:41:38','admin'),(156,2,13,'2021-9-22-00000006',12,'失败','','',1,'$.code=500|$.message=服务器伐开心,我们正在想办法','请求url:https://marketing-ui.confucius.mobiredeem/ui/retrySendSmsOrFindShortUrl?orderId=2012030033263636700&goodsThirdPartyType=ALIPAY&status=OFF发生异常，原因：marketing-ui.confucius.mobiredeem','2021-09-22 11:41:38','2021-09-22 11:41:38','admin'),(157,2,13,'2021-9-22-00000xx1',12,'失败','','',70,'$.code=500|$.message=服务器伐开心,我们正在想办法','请求url:https://marketing-ui.confucius.mobiredeem/ui/retrySendSmsOrFindShortUrl?orderId=2012030033263636700&goodsThirdPartyType=ALIPAY&status=OFF发生异常，原因：marketing-ui.confucius.mobiredeem','2021-09-22 11:47:46','2021-09-22 11:47:46','admin'),(158,2,13,'2021-9-22-00000xx1',12,'失败','','',198,'$.code=500|$.message=服务器伐开心,我们正在想办法','请求url:https://marketing-ui.confucius.mobiredeem/ui/retrySendSmsOrFindShortUrl?orderId=2012030033263636700&goodsThirdPartyType=ALIPAY&status=OFF发生异常，原因：marketing-ui.confucius.mobiredeem: nodename nor servname provided, or not known','2021-09-22 11:47:46','2021-09-22 11:47:46','admin'),(159,2,13,'2021-9-22-00000xx1',12,'失败','','',1,'$.code=500|$.message=服务器伐开心,我们正在想办法','请求url:https://marketing-ui.confucius.mobiredeem/ui/retrySendSmsOrFindShortUrl?orderId=2012030033263636700&goodsThirdPartyType=ALIPAY&status=OFF发生异常，原因：marketing-ui.confucius.mobiredeem','2021-09-22 11:47:46','2021-09-22 11:47:46','admin'),(160,2,13,'2021-9-22-00000xx1',12,'失败','','',2,'$.code=500|$.message=服务器伐开心,我们正在想办法','请求url:https://marketing-ui.confucius.mobiredeem/ui/retrySendSmsOrFindShortUrl?orderId=2012030033263636700&goodsThirdPartyType=ALIPAY&status=OFF发生异常，原因：marketing-ui.confucius.mobiredeem','2021-09-22 11:47:46','2021-09-22 11:47:46','admin'),(161,2,13,'2021-9-22-00000xx1',12,'失败','','',1,'$.code=500|$.message=服务器伐开心,我们正在想办法','请求url:https://marketing-ui.confucius.mobiredeem/ui/retrySendSmsOrFindShortUrl?orderId=2012030033263636700&goodsThirdPartyType=ALIPAY&status=OFF发生异常，原因：marketing-ui.confucius.mobiredeem','2021-09-22 11:47:46','2021-09-22 11:47:46','admin'),(162,2,13,'2021-9-22-00000xx1',12,'失败','','',1,'$.code=500|$.message=服务器伐开心,我们正在想办法','请求url:https://marketing-ui.confucius.mobiredeem/ui/retrySendSmsOrFindShortUrl?orderId=2012030033263636700&goodsThirdPartyType=ALIPAY&status=OFF发生异常，原因：marketing-ui.confucius.mobiredeem','2021-09-22 11:47:46','2021-09-22 11:47:46','admin'),(163,2,13,'2021-9-22-00000xx1',12,'失败','','',1,'$.code=500|$.message=服务器伐开心,我们正在想办法','请求url:https://marketing-ui.confucius.mobiredeem/ui/retrySendSmsOrFindShortUrl?orderId=2012030033263636700&goodsThirdPartyType=ALIPAY&status=OFF发生异常，原因：marketing-ui.confucius.mobiredeem','2021-09-22 11:47:46','2021-09-22 11:47:46','admin'),(164,2,13,'2021-9-22-00000xx1',12,'失败','','',1,'$.code=500|$.message=服务器伐开心,我们正在想办法','请求url:https://marketing-ui.confucius.mobiredeem/ui/retrySendSmsOrFindShortUrl?orderId=2012030033263636700&goodsThirdPartyType=ALIPAY&status=OFF发生异常，原因：marketing-ui.confucius.mobiredeem','2021-09-22 11:47:46','2021-09-22 11:47:46','admin'),(165,2,13,'2021-9-22-00000xx1',12,'失败','','',2,'$.code=500|$.message=服务器伐开心,我们正在想办法','请求url:https://marketing-ui.confucius.mobiredeem/ui/retrySendSmsOrFindShortUrl?orderId=2012030033263636700&goodsThirdPartyType=ALIPAY&status=OFF发生异常，原因：marketing-ui.confucius.mobiredeem','2021-09-22 11:47:47','2021-09-22 11:47:47','admin'),(166,2,13,'2021-9-22-00000xx1',12,'失败','','',2,'$.code=500|$.message=服务器伐开心,我们正在想办法','请求url:https://marketing-ui.confucius.mobiredeem/ui/retrySendSmsOrFindShortUrl?orderId=2012030033263636700&goodsThirdPartyType=ALIPAY&status=OFF发生异常，原因：marketing-ui.confucius.mobiredeem','2021-09-22 11:47:47','2021-09-22 11:47:47','admin'),(167,2,13,'2021-9-22-00000xx1',12,'失败','','',2,'$.code=500|$.message=服务器伐开心,我们正在想办法','请求url:https://marketing-ui.confucius.mobiredeem/ui/retrySendSmsOrFindShortUrl?orderId=2012030033263636700&goodsThirdPartyType=ALIPAY&status=OFF发生异常，原因：marketing-ui.confucius.mobiredeem','2021-09-22 11:47:47','2021-09-22 11:47:47','admin'),(168,2,13,'2021-9-22-00000xx1',12,'失败','','',1,'$.code=500|$.message=服务器伐开心,我们正在想办法','请求url:https://marketing-ui.confucius.mobiredeem/ui/retrySendSmsOrFindShortUrl?orderId=2012030033263636700&goodsThirdPartyType=ALIPAY&status=OFF发生异常，原因：marketing-ui.confucius.mobiredeem','2021-09-22 11:47:47','2021-09-22 11:47:47','admin'),(169,2,13,'2021-9-22-00000xx2',12,'失败','','',35,'$.code=500|$.message=服务器伐开心,我们正在想办法','请求url:https://marketing-ui.confucius.mobiredeem/ui/retrySendSmsOrFindShortUrl?orderId=2012030033263636700&goodsThirdPartyType=ALIPAY&status=OFF发生异常，原因：marketing-ui.confucius.mobiredeem: nodename nor servname provided, or not known','2021-09-22 11:48:01','2021-09-22 11:48:01','admin'),(170,2,13,'2021-9-22-00000xx2',12,'失败','','',372,'$.code=500|$.message=服务器伐开心,我们正在想办法','请求url:https://marketing-ui.confucius.mobiredeem/ui/retrySendSmsOrFindShortUrl?orderId=2012030033263636700&goodsThirdPartyType=ALIPAY&status=OFF发生异常，原因：marketing-ui.confucius.mobiredeem','2021-09-22 11:48:01','2021-09-22 11:48:01','admin'),(171,2,13,'2021-9-22-00000xx2',12,'失败','','',2,'$.code=500|$.message=服务器伐开心,我们正在想办法','请求url:https://marketing-ui.confucius.mobiredeem/ui/retrySendSmsOrFindShortUrl?orderId=2012030033263636700&goodsThirdPartyType=ALIPAY&status=OFF发生异常，原因：marketing-ui.confucius.mobiredeem','2021-09-22 11:48:01','2021-09-22 11:48:01','admin'),(172,2,13,'2021-9-22-00000xx2',12,'失败','','',3,'$.code=500|$.message=服务器伐开心,我们正在想办法','请求url:https://marketing-ui.confucius.mobiredeem/ui/retrySendSmsOrFindShortUrl?orderId=2012030033263636700&goodsThirdPartyType=ALIPAY&status=OFF发生异常，原因：marketing-ui.confucius.mobiredeem','2021-09-22 11:48:01','2021-09-22 11:48:01','admin'),(173,2,13,'2021-9-22-00000xx2',12,'失败','','',2,'$.code=500|$.message=服务器伐开心,我们正在想办法','请求url:https://marketing-ui.confucius.mobiredeem/ui/retrySendSmsOrFindShortUrl?orderId=2012030033263636700&goodsThirdPartyType=ALIPAY&status=OFF发生异常，原因：marketing-ui.confucius.mobiredeem','2021-09-22 11:48:01','2021-09-22 11:48:01','admin'),(174,2,13,'2021-9-22-00000xx2',12,'失败','','',2,'$.code=500|$.message=服务器伐开心,我们正在想办法','请求url:https://marketing-ui.confucius.mobiredeem/ui/retrySendSmsOrFindShortUrl?orderId=2012030033263636700&goodsThirdPartyType=ALIPAY&status=OFF发生异常，原因：marketing-ui.confucius.mobiredeem','2021-09-22 11:48:01','2021-09-22 11:48:01','admin'),(175,2,13,'2021-9-22-00000xx2',12,'失败','','',1,'$.code=500|$.message=服务器伐开心,我们正在想办法','请求url:https://marketing-ui.confucius.mobiredeem/ui/retrySendSmsOrFindShortUrl?orderId=2012030033263636700&goodsThirdPartyType=ALIPAY&status=OFF发生异常，原因：marketing-ui.confucius.mobiredeem','2021-09-22 11:48:01','2021-09-22 11:48:01','admin'),(176,2,13,'2021-9-22-00000xx2',12,'失败','','',1,'$.code=500|$.message=服务器伐开心,我们正在想办法','请求url:https://marketing-ui.confucius.mobiredeem/ui/retrySendSmsOrFindShortUrl?orderId=2012030033263636700&goodsThirdPartyType=ALIPAY&status=OFF发生异常，原因：marketing-ui.confucius.mobiredeem','2021-09-22 11:48:01','2021-09-22 11:48:01','admin'),(177,2,13,'2021-9-22-00000xx2',12,'失败','','',2,'$.code=500|$.message=服务器伐开心,我们正在想办法','请求url:https://marketing-ui.confucius.mobiredeem/ui/retrySendSmsOrFindShortUrl?orderId=2012030033263636700&goodsThirdPartyType=ALIPAY&status=OFF发生异常，原因：marketing-ui.confucius.mobiredeem','2021-09-22 11:48:01','2021-09-22 11:48:01','admin'),(178,2,13,'2021-9-22-00000xx2',12,'失败','','',1,'$.code=500|$.message=服务器伐开心,我们正在想办法','请求url:https://marketing-ui.confucius.mobiredeem/ui/retrySendSmsOrFindShortUrl?orderId=2012030033263636700&goodsThirdPartyType=ALIPAY&status=OFF发生异常，原因：marketing-ui.confucius.mobiredeem','2021-09-22 11:48:01','2021-09-22 11:48:01','admin'),(179,2,13,'2021-9-22-00000xx2',12,'失败','','',1,'$.code=500|$.message=服务器伐开心,我们正在想办法','请求url:https://marketing-ui.confucius.mobiredeem/ui/retrySendSmsOrFindShortUrl?orderId=2012030033263636700&goodsThirdPartyType=ALIPAY&status=OFF发生异常，原因：marketing-ui.confucius.mobiredeem','2021-09-22 11:48:01','2021-09-22 11:48:01','admin'),(180,2,13,'2021-9-22-00000xx2',12,'失败','','',1,'$.code=500|$.message=服务器伐开心,我们正在想办法','请求url:https://marketing-ui.confucius.mobiredeem/ui/retrySendSmsOrFindShortUrl?orderId=2012030033263636700&goodsThirdPartyType=ALIPAY&status=OFF发生异常，原因：marketing-ui.confucius.mobiredeem','2021-09-22 11:48:01','2021-09-22 11:48:01','admin'),(181,2,13,'2021-performance002',12,'失败','','',3,'$.code=500|$.message=服务器伐开心,我们正在想办法','请求url:https://marketing-ui.confucius.mobiredeem/ui/retrySendSmsOrFindShortUrl?orderId=2012030033263636700&goodsThirdPartyType=ALIPAY&status=OFF发生异常，原因：marketing-ui.confucius.mobiredeem','2021-09-22 18:33:56','2021-09-22 18:33:56','admin'),(182,2,13,'2021-performance002',12,'失败','','',322,'$.code=500|$.message=服务器伐开心,我们正在想办法','请求url:https://marketing-ui.confucius.mobiredeem/ui/retrySendSmsOrFindShortUrl?orderId=2012030033263636700&goodsThirdPartyType=ALIPAY&status=OFF发生异常，原因：marketing-ui.confucius.mobiredeem: nodename nor servname provided, or not known','2021-09-22 18:33:56','2021-09-22 18:33:56','admin'),(183,2,13,'2021-performance002',12,'失败','','',3,'$.code=500|$.message=服务器伐开心,我们正在想办法','请求url:https://marketing-ui.confucius.mobiredeem/ui/retrySendSmsOrFindShortUrl?orderId=2012030033263636700&goodsThirdPartyType=ALIPAY&status=OFF发生异常，原因：marketing-ui.confucius.mobiredeem','2021-09-22 18:33:56','2021-09-22 18:33:56','admin'),(184,2,13,'2021-performance002',12,'失败','','',2,'$.code=500|$.message=服务器伐开心,我们正在想办法','请求url:https://marketing-ui.confucius.mobiredeem/ui/retrySendSmsOrFindShortUrl?orderId=2012030033263636700&goodsThirdPartyType=ALIPAY&status=OFF发生异常，原因：marketing-ui.confucius.mobiredeem','2021-09-22 18:33:56','2021-09-22 18:33:56','admin'),(185,2,13,'2021-performance002',12,'失败','','',1,'$.code=500|$.message=服务器伐开心,我们正在想办法','请求url:https://marketing-ui.confucius.mobiredeem/ui/retrySendSmsOrFindShortUrl?orderId=2012030033263636700&goodsThirdPartyType=ALIPAY&status=OFF发生异常，原因：marketing-ui.confucius.mobiredeem','2021-09-22 18:33:56','2021-09-22 18:33:56','admin'),(186,2,13,'2021-performance002',12,'失败','','',2,'$.code=500|$.message=服务器伐开心,我们正在想办法','请求url:https://marketing-ui.confucius.mobiredeem/ui/retrySendSmsOrFindShortUrl?orderId=2012030033263636700&goodsThirdPartyType=ALIPAY&status=OFF发生异常，原因：marketing-ui.confucius.mobiredeem','2021-09-22 18:33:56','2021-09-22 18:33:56','admin'),(187,2,13,'2021-performance002',12,'失败','','',2,'$.code=500|$.message=服务器伐开心,我们正在想办法','请求url:https://marketing-ui.confucius.mobiredeem/ui/retrySendSmsOrFindShortUrl?orderId=2012030033263636700&goodsThirdPartyType=ALIPAY&status=OFF发生异常，原因：marketing-ui.confucius.mobiredeem','2021-09-22 18:33:56','2021-09-22 18:33:56','admin'),(188,2,13,'2021-performance002',12,'失败','','',3,'$.code=500|$.message=服务器伐开心,我们正在想办法','请求url:https://marketing-ui.confucius.mobiredeem/ui/retrySendSmsOrFindShortUrl?orderId=2012030033263636700&goodsThirdPartyType=ALIPAY&status=OFF发生异常，原因：marketing-ui.confucius.mobiredeem','2021-09-22 18:33:56','2021-09-22 18:33:56','admin'),(189,2,13,'2021-performance002',12,'失败','','',1,'$.code=500|$.message=服务器伐开心,我们正在想办法','请求url:https://marketing-ui.confucius.mobiredeem/ui/retrySendSmsOrFindShortUrl?orderId=2012030033263636700&goodsThirdPartyType=ALIPAY&status=OFF发生异常，原因：marketing-ui.confucius.mobiredeem','2021-09-22 18:33:56','2021-09-22 18:33:56','admin'),(190,2,13,'2021-performance002',12,'失败','','',1,'$.code=500|$.message=服务器伐开心,我们正在想办法','请求url:https://marketing-ui.confucius.mobiredeem/ui/retrySendSmsOrFindShortUrl?orderId=2012030033263636700&goodsThirdPartyType=ALIPAY&status=OFF发生异常，原因：marketing-ui.confucius.mobiredeem','2021-09-22 18:33:56','2021-09-22 18:33:56','admin'),(191,2,13,'2021-performance002',12,'失败','','',1,'$.code=500|$.message=服务器伐开心,我们正在想办法','请求url:https://marketing-ui.confucius.mobiredeem/ui/retrySendSmsOrFindShortUrl?orderId=2012030033263636700&goodsThirdPartyType=ALIPAY&status=OFF发生异常，原因：marketing-ui.confucius.mobiredeem','2021-09-22 18:33:56','2021-09-22 18:33:56','admin'),(192,2,13,'2021-performance002',12,'失败','','',1,'$.code=500|$.message=服务器伐开心,我们正在想办法','请求url:https://marketing-ui.confucius.mobiredeem/ui/retrySendSmsOrFindShortUrl?orderId=2012030033263636700&goodsThirdPartyType=ALIPAY&status=OFF发生异常，原因：marketing-ui.confucius.mobiredeem','2021-09-22 18:33:56','2021-09-22 18:33:56','admin'),(193,2,13,'xx1',12,'失败','','',5,'$.code=500|$.message=服务器伐开心,我们正在想办法','请求url:https://marketing-ui.confucius.mobiredeem/ui/retrySendSmsOrFindShortUrl?orderId=2012030033263636700&goodsThirdPartyType=ALIPAY&status=OFF发生异常，原因：marketing-ui.confucius.mobiredeem','2021-09-24 16:40:46','2021-09-24 16:40:46','admin'),(194,2,13,'xx1',12,'失败','','',7,'$.code=500|$.message=服务器伐开心,我们正在想办法','请求url:https://marketing-ui.confucius.mobiredeem/ui/retrySendSmsOrFindShortUrl?orderId=2012030033263636700&goodsThirdPartyType=ALIPAY&status=OFF发生异常，原因：marketing-ui.confucius.mobiredeem','2021-09-24 16:40:46','2021-09-24 16:40:46','admin'),(195,2,13,'xx1',12,'失败','','',21,'$.code=500|$.message=服务器伐开心,我们正在想办法','请求url:https://marketing-ui.confucius.mobiredeem/ui/retrySendSmsOrFindShortUrl?orderId=2012030033263636700&goodsThirdPartyType=ALIPAY&status=OFF发生异常，原因：marketing-ui.confucius.mobiredeem','2021-09-24 16:40:46','2021-09-24 16:40:46','admin'),(196,2,13,'xx1',12,'失败','','',3,'$.code=500|$.message=服务器伐开心,我们正在想办法','请求url:https://marketing-ui.confucius.mobiredeem/ui/retrySendSmsOrFindShortUrl?orderId=2012030033263636700&goodsThirdPartyType=ALIPAY&status=OFF发生异常，原因：marketing-ui.confucius.mobiredeem','2021-09-24 16:40:46','2021-09-24 16:40:46','admin'),(197,2,13,'xx1',12,'失败','','',5,'$.code=500|$.message=服务器伐开心,我们正在想办法','请求url:https://marketing-ui.confucius.mobiredeem/ui/retrySendSmsOrFindShortUrl?orderId=2012030033263636700&goodsThirdPartyType=ALIPAY&status=OFF发生异常，原因：marketing-ui.confucius.mobiredeem','2021-09-24 16:40:46','2021-09-24 16:40:46','admin'),(198,2,13,'xx1',12,'失败','','',4,'$.code=500|$.message=服务器伐开心,我们正在想办法','请求url:https://marketing-ui.confucius.mobiredeem/ui/retrySendSmsOrFindShortUrl?orderId=2012030033263636700&goodsThirdPartyType=ALIPAY&status=OFF发生异常，原因：marketing-ui.confucius.mobiredeem','2021-09-24 16:40:46','2021-09-24 16:40:46','admin'),(199,2,13,'xx1',12,'失败','','',27,'$.code=500|$.message=服务器伐开心,我们正在想办法','请求url:https://marketing-ui.confucius.mobiredeem/ui/retrySendSmsOrFindShortUrl?orderId=2012030033263636700&goodsThirdPartyType=ALIPAY&status=OFF发生异常，原因：marketing-ui.confucius.mobiredeem','2021-09-24 16:40:47','2021-09-24 16:40:47','admin'),(200,2,13,'xx1',12,'失败','','',1,'$.code=500|$.message=服务器伐开心,我们正在想办法','请求url:https://marketing-ui.confucius.mobiredeem/ui/retrySendSmsOrFindShortUrl?orderId=2012030033263636700&goodsThirdPartyType=ALIPAY&status=OFF发生异常，原因：marketing-ui.confucius.mobiredeem','2021-09-24 16:40:47','2021-09-24 16:40:47','admin'),(201,2,13,'xx1',12,'失败','','',1,'$.code=500|$.message=服务器伐开心,我们正在想办法','请求url:https://marketing-ui.confucius.mobiredeem/ui/retrySendSmsOrFindShortUrl?orderId=2012030033263636700&goodsThirdPartyType=ALIPAY&status=OFF发生异常，原因：marketing-ui.confucius.mobiredeem','2021-09-24 16:40:47','2021-09-24 16:40:47','admin'),(202,2,13,'xx1',12,'失败','','',1,'$.code=500|$.message=服务器伐开心,我们正在想办法','请求url:https://marketing-ui.confucius.mobiredeem/ui/retrySendSmsOrFindShortUrl?orderId=2012030033263636700&goodsThirdPartyType=ALIPAY&status=OFF发生异常，原因：marketing-ui.confucius.mobiredeem','2021-09-24 16:40:47','2021-09-24 16:40:47','admin'),(203,2,13,'xx1',12,'失败','','',0,'$.code=500|$.message=服务器伐开心,我们正在想办法','请求url:https://marketing-ui.confucius.mobiredeem/ui/retrySendSmsOrFindShortUrl?orderId=2012030033263636700&goodsThirdPartyType=ALIPAY&status=OFF发生异常，原因：marketing-ui.confucius.mobiredeem','2021-09-24 16:40:47','2021-09-24 16:40:47','admin');
/*!40000 ALTER TABLE `apicases_report_performance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `apicases_reportstatics`
--

DROP TABLE IF EXISTS `apicases_reportstatics`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `apicases_reportstatics` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Id',
  `testplanid` bigint(20) unsigned NOT NULL COMMENT '执行计划id',
  `deployunitid` bigint(20) unsigned NOT NULL COMMENT '发单单元id',
  `batchname` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '批次',
  `slaverid` bigint(20) unsigned NOT NULL COMMENT '执行机id',
  `totalcases` bigint(20) NOT NULL COMMENT '用例总数',
  `totalpasscases` bigint(20) NOT NULL COMMENT '用例总数',
  `totalfailcases` bigint(20) NOT NULL COMMENT '用例总数',
  `runtime` bigint(20) NOT NULL COMMENT '运行时长',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `lastmodify_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '上一次修改时间',
  `creator` varchar(10) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '创建者',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COMMENT='api计划批量用例统计报告表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `apicases_reportstatics`
--

LOCK TABLES `apicases_reportstatics` WRITE;
/*!40000 ALTER TABLE `apicases_reportstatics` DISABLE KEYS */;
INSERT INTO `apicases_reportstatics` VALUES (1,12,22,'502',8,1,0,1,42174,'2021-05-26 16:47:59','2021-05-26 16:47:59','admin'),(2,12,22,'521',8,1,0,1,43312,'2021-05-26 16:56:53','2021-05-26 16:56:53','admin'),(3,12,22,'521',8,1,0,1,42116,'2021-05-26 16:56:54','2021-05-26 16:56:54','admin'),(4,22,27,'7-21-00001',11,1,0,1,135,'2021-07-21 15:42:51','2021-07-21 15:42:51','admin'),(5,22,27,'7-21-000000002',11,1,0,1,280,'2021-07-21 16:34:11','2021-07-21 16:34:11','admin'),(6,22,27,'7-21-00000000004',11,1,0,1,171,'2021-07-21 16:43:51','2021-07-21 16:43:51','admin'),(7,22,27,'7-21-000000006',11,1,0,1,244,'2021-07-21 17:29:20','2021-07-21 17:29:20','admin'),(8,22,27,'7-21-0000007',11,1,1,0,142,'2021-07-21 17:42:17','2021-07-21 17:42:17','admin'),(9,22,27,'7-28-0000008',11,1,1,0,240,'2021-07-22 11:14:47','2021-07-22 11:14:47','admin'),(10,22,27,'7-28-0000008',11,1,1,0,143,'2021-07-22 11:15:17','2021-07-22 11:15:17','admin'),(11,22,27,'7-28-00000001',11,1,1,0,146,'2021-07-22 11:21:28','2021-07-22 11:21:28','admin'),(12,22,27,'7-22-000000001',11,1,1,0,151,'2021-07-22 17:21:56','2021-07-22 17:21:56','admin'),(13,22,27,'7-22-000000000003',11,1,1,0,148,'2021-07-22 17:28:06','2021-07-22 17:28:06','admin'),(14,22,27,'7-22-00000008',11,1,1,0,244,'2021-07-22 17:33:46','2021-07-22 17:33:46','admin'),(15,22,27,'7-22-000009',11,1,1,0,147,'2021-07-22 17:37:16','2021-07-22 17:37:16','admin'),(16,22,27,'xxxxx',11,1,1,0,160,'2021-07-22 17:44:16','2021-07-22 17:44:16','admin'),(17,22,27,'zzzzzz',11,1,1,0,145,'2021-07-22 17:45:26','2021-07-22 17:45:26','admin'),(18,22,27,'001',11,1,1,0,142,'2021-07-26 23:03:22','2021-07-26 23:03:22','admin'),(19,22,27,'2021-9-22-funtion00001',12,1,1,0,230,'2021-09-22 18:24:41','2021-09-22 18:24:41','admin'),(20,22,27,'2021-fun0001',12,1,1,0,239,'2021-09-22 18:32:21','2021-09-22 18:32:21','admin');
/*!40000 ALTER TABLE `apicases_reportstatics` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `apicases_variables`
--

DROP TABLE IF EXISTS `apicases_variables`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `apicases_variables` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Id',
  `caseid` bigint(20) unsigned NOT NULL COMMENT '用例Id',
  `casename` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '用例名',
  `variablesid` bigint(20) unsigned NOT NULL COMMENT '变量Id',
  `variablesname` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '变量名',
  `memo` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '备注',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `lastmodify_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '上一次修改时间',
  `creator` varchar(20) DEFAULT NULL COMMENT '创建者',
  `deployunitname` varchar(64) DEFAULT NULL COMMENT '发布单元',
  `apiname` varchar(64) DEFAULT NULL COMMENT 'api',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='api用例变量表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `apicases_variables`
--

LOCK TABLES `apicases_variables` WRITE;
/*!40000 ALTER TABLE `apicases_variables` DISABLE KEYS */;
/*!40000 ALTER TABLE `apicases_variables` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `condition_api`
--

DROP TABLE IF EXISTS `condition_api`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `condition_api` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Id',
  `conditionid` bigint(20) unsigned DEFAULT NULL COMMENT '条件id',
  `deployunitid` bigint(20) unsigned DEFAULT NULL COMMENT '发布单元id',
  `caseid` bigint(20) unsigned DEFAULT NULL COMMENT '接口caseid',
  `memo` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '备注',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `lastmodify_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '上一次修改时间',
  `creator` varchar(10) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '创建者',
  `apiid` int(11) NOT NULL COMMENT 'apiid',
  `conditionname` varchar(64) DEFAULT NULL COMMENT '条件名',
  `deployunitname` varchar(64) DEFAULT NULL COMMENT '发布单元名',
  `apiname` varchar(64) DEFAULT NULL COMMENT 'api名',
  `casename` varchar(64) DEFAULT NULL COMMENT '接口名',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COMMENT='接口条件表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `condition_api`
--

LOCK TABLES `condition_api` WRITE;
/*!40000 ALTER TABLE `condition_api` DISABLE KEYS */;
/*!40000 ALTER TABLE `condition_api` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `condition_db`
--

DROP TABLE IF EXISTS `condition_db`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `condition_db` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Id',
  `conditionid` bigint(20) unsigned DEFAULT NULL COMMENT '条件id',
  `enviromentid` bigint(20) unsigned DEFAULT NULL COMMENT '环境id',
  `dbtype` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '数据库类型',
  `dbcontent` bigint(20) unsigned DEFAULT NULL COMMENT 'db执行内容',
  `connectstr` bigint(20) unsigned DEFAULT NULL COMMENT 'db连接字',
  `memo` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '备注',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `lastmodify_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '上一次修改时间',
  `creator` varchar(10) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '创建者',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COMMENT='db条件表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `condition_db`
--

LOCK TABLES `condition_db` WRITE;
/*!40000 ALTER TABLE `condition_db` DISABLE KEYS */;
/*!40000 ALTER TABLE `condition_db` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `deployunit`
--

DROP TABLE IF EXISTS `deployunit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `deployunit` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Id',
  `deployunitname` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '发布单元名',
  `protocal` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '协议',
  `port` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '访问端口',
  `memo` varchar(512) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '描述',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `lastmodify_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '上一次修改时间',
  `creator` varchar(20) DEFAULT NULL COMMENT '创建者',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COMMENT='发布单元表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `deployunit`
--

LOCK TABLES `deployunit` WRITE;
/*!40000 ALTER TABLE `deployunit` DISABLE KEYS */;
INSERT INTO `deployunit` VALUES (1,'accountservice','https','8080','账务服务','2019-07-01 00:00:00','2021-04-26 19:04:33','admin'),(2,'paymentservice','rpc','8081','支付服务','2019-07-01 00:00:00','2021-05-27 03:05:00','admin'),(15,'testservice','https','8080','测试中心','2020-10-17 17:46:17','2021-05-27 03:05:04','admin'),(19,'cornerservice','https','80','cornerservice','2020-11-16 20:26:10','2021-05-27 03:05:12','admin'),(20,'regressionservice','python','8081','regressionservice','2020-12-01 14:06:08','2021-05-27 03:05:24','admin'),(22,'marketingservice','https','80','市场服务','2020-12-07 16:05:33','2021-05-27 03:05:35','admin'),(27,'testcenterservice','http','8080','测试中心服务','2021-07-15 16:40:16','2021-09-26 12:09:34','admin');
/*!40000 ALTER TABLE `deployunit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dictionary`
--

DROP TABLE IF EXISTS `dictionary`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dictionary` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户Id',
  `dicname` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '字典类名',
  `diccode` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '字典编码',
  `dicitemname` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '字典项名',
  `dicitmevalue` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '字典项值',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `lastmodify_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '上一次修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8mb4 COMMENT='字典表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dictionary`
--

LOCK TABLES `dictionary` WRITE;
/*!40000 ALTER TABLE `dictionary` DISABLE KEYS */;
INSERT INTO `dictionary` VALUES (1,'测试环境','testenviroment1','功能测试环境1','te112','2019-07-01 00:00:00','2020-04-21 17:04:47'),(2,'测试环境','testenviroment','功能测试环境2','te2','2019-07-01 00:00:00','2020-04-22 22:04:11'),(5,'http请求方式','httpmethod','查询','get','2020-04-17 17:57:30','2019-07-01 00:00:00'),(6,'http请求方式','httpmethod','提交数据','post','2020-04-17 17:59:02','2020-11-15 15:11:35'),(9,'测试环境','测试环境','测试环境','测试环境','2020-04-20 15:42:10','2021-09-24 16:09:53'),(17,'访问方式','httpvisittype','http访问方式','get','2020-05-18 21:05:24','2021-09-24 16:09:55'),(18,'访问方式','httpvisittype','http访问方式','post','2020-05-18 21:05:55','2021-09-24 16:09:57'),(19,'服务器作用','machineuse','部署','部署发布单元','2020-09-09 12:26:21','2020-09-09 12:09:53'),(20,'服务器作用','machineuse','执行测试','功能测试用例执行机','2020-09-09 12:27:40','2020-09-09 12:09:26'),(21,'服务器作用','machineuse','执行测试','性能测试执行机','2020-09-09 12:29:25','2021-09-24 16:09:01'),(27,'数据库类型','DBType','用例前后置数据库类型','Mysql','2020-11-02 08:29:29','2021-09-24 16:09:59'),(28,'数据库类型','DBType','用例前后置数据库类型','Oracle','2020-11-02 08:30:29','2021-09-24 16:09:01'),(29,'数据库类型','DBType','用例前后置数据库类型','Sqlserver','2020-11-02 08:31:05','2021-09-24 16:09:03'),(34,'环境部署内容','machinedeploy','数据库','mysql','2020-11-06 15:43:18','2021-09-24 16:09:06'),(35,'环境部署内容','machinedeploy','数据库','oracle','2020-11-06 15:43:36','2021-09-24 16:09:08'),(36,'环境部署内容','machinedeploy','nosql','redis','2020-11-06 15:43:54','2021-09-24 16:09:10'),(37,'环境部署内容','machinedeploy','nosql','mongodb','2020-11-06 15:44:15','2021-09-24 16:09:13'),(39,'api请求格式','requestcontentype','请求数据格式','form表单','2020-11-10 08:43:55','2021-09-24 16:09:15'),(40,'api请求格式','requestcontentype','请求数据格式','json','2020-11-10 08:44:19','2021-09-24 16:09:17'),(41,'api响应格式','responecontenttype','响应数据格式','json','2020-11-10 08:50:28','2021-09-24 16:09:19'),(42,'api响应格式','responecontenttype','响应数据格式','html','2020-11-10 08:55:14','2021-09-24 16:09:33'),(43,'http请求方式','httpmethod','更新','put','2020-11-15 15:41:55','2021-09-24 16:09:35'),(44,'http请求方式','httpmethod','删除','delete','2020-11-15 15:42:14','2021-09-24 16:09:37'),(45,'访问方式','httpvisittype','更新','put','2020-11-15 15:47:03','2021-09-24 16:09:39'),(46,'访问方式','httpvisittype','删除','delete','2020-11-15 15:47:20','2021-09-24 16:09:41'),(47,'功能执行机最大并发数','FunctionJmeterProcess','功能执行机并发Jmeter进程','2','2020-11-28 17:02:39','2021-04-02 12:04:57'),(52,'性能执行机Jmeter并发数','PerformanceJmeterProcess','性能测试Jmeter并行数','1','2021-04-07 09:08:10','2021-05-26 23:05:05'),(53,'执行计划业务类型','planbusinesstype','执行计划业务类型','常规测试','2021-04-20 17:24:17','2021-09-24 16:09:08'),(54,'执行计划业务类型','planbusinesstype','执行计划业务类型','CI自动化测试','2021-04-20 17:24:48','2021-09-24 16:09:10');
/*!40000 ALTER TABLE `dictionary` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dispatch`
--

DROP TABLE IF EXISTS `dispatch`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dispatch` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '环境Id',
  `execplanid` bigint(20) unsigned NOT NULL COMMENT '执行计划Id',
  `execplanname` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '执行计划名',
  `batchid` bigint(20) unsigned NOT NULL COMMENT '批次Id',
  `batchname` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '批次名',
  `slaverid` bigint(20) unsigned NOT NULL COMMENT '执行机Id',
  `slavername` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '执行机名',
  `testcaseid` bigint(20) unsigned NOT NULL COMMENT '用例Id',
  `testcasename` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '用例名',
  `casejmxname` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT 'jmeter-class',
  `deployunitname` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '发布单元',
  `expect` varchar(500) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT 'jmeter-class',
  `status` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '待分配，已分配，已结束，调度异常',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `lastmodify_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '上一次修改时间',
  `plantype` varchar(20) DEFAULT NULL COMMENT '计划类型',
  `threadnum` bigint(20) DEFAULT NULL COMMENT '线程数',
  `loops` bigint(20) DEFAULT NULL COMMENT '循环数',
  `memo` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='调度表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dispatch`
--

LOCK TABLES `dispatch` WRITE;
/*!40000 ALTER TABLE `dispatch` DISABLE KEYS */;
/*!40000 ALTER TABLE `dispatch` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `enviroment`
--

DROP TABLE IF EXISTS `enviroment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `enviroment` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '环境Id',
  `enviromentname` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '环境名',
  `envtype` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '环境类型',
  `memo` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '环境描述',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `lastmodify_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '上一次修改时间',
  `creator` varchar(20) DEFAULT NULL COMMENT '创建者',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8mb4 COMMENT='环境表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enviroment`
--

LOCK TABLES `enviroment` WRITE;
/*!40000 ALTER TABLE `enviroment` DISABLE KEYS */;
INSERT INTO `enviroment` VALUES (5,'功能测试环境','功能','测试部门功能测试环境','2020-11-20 16:37:39','2021-04-23 19:04:31','test'),(19,'性能测试环境','性能','测试部门性能测试环境','2020-12-07 16:36:59','2021-04-26 19:04:22','admin');
/*!40000 ALTER TABLE `enviroment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `enviroment_assemble`
--

DROP TABLE IF EXISTS `enviroment_assemble`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `enviroment_assemble` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '环境Id',
  `assemblename` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '环境组件名',
  `assembletype` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT 'mysql，oracle，redis',
  `connectstr` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '连接字',
  `memo` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '环境描述',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `lastmodify_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '上一次修改时间',
  `creator` varchar(10) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '创建者',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COMMENT='环境组件表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enviroment_assemble`
--

LOCK TABLES `enviroment_assemble` WRITE;
/*!40000 ALTER TABLE `enviroment_assemble` DISABLE KEYS */;
INSERT INTO `enviroment_assemble` VALUES (1,'账户mysql数据库','mysql','username=root,password=root,db=admin_test,port=3306','test','2019-07-01 00:00:00','2020-11-29 20:11:08','admin');
/*!40000 ALTER TABLE `enviroment_assemble` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `envmachine`
--

DROP TABLE IF EXISTS `envmachine`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `envmachine` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Id',
  `envid` bigint(20) unsigned NOT NULL COMMENT '环境Id',
  `enviromentname` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '环境名',
  `machineid` bigint(20) unsigned NOT NULL COMMENT '服务器Id',
  `machinename` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '机器名',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `lastmodify_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '上一次修改时间',
  `creator` varchar(20) DEFAULT NULL COMMENT '创建者',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COMMENT='环境服务器表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `envmachine`
--

LOCK TABLES `envmachine` WRITE;
/*!40000 ALTER TABLE `envmachine` DISABLE KEYS */;
INSERT INTO `envmachine` VALUES (20,19,'性能测试环境',7,'测试服务器','2020-12-07 16:37:11','2021-09-26 12:09:16','admin'),(21,5,'功能测试环境',11,'4','2021-04-23 19:38:48','2021-04-23 19:38:48',NULL),(22,19,'性能测试环境',12,'6','2021-04-26 19:24:51','2021-04-26 19:24:51','admin'),(23,5,'功能测试环境',7,'测试服务器','2021-05-13 09:53:38','2021-05-13 09:53:38','admin'),(24,5,'功能测试环境',25,'1111','2021-09-24 15:38:23','2021-09-24 15:38:23','admin');
/*!40000 ALTER TABLE `envmachine` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `executeplan`
--

DROP TABLE IF EXISTS `executeplan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `executeplan` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '执行计划Id',
  `envid` bigint(20) unsigned NOT NULL COMMENT '环境Id',
  `enviromentname` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '环境名',
  `executeplanname` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '执行计划名',
  `status` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '状态，new，waiting，running，pause，finish',
  `usetype` varchar(512) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '运行类型，function，performance，来区分分配什么slaver',
  `memo` varchar(512) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '备注',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `lastmodify_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '上一次修改时间',
  `businesstype` varchar(80) DEFAULT NULL COMMENT '业务类型，常规测试，CI自动化测试',
  `creator` varchar(20) DEFAULT NULL COMMENT '创建者',
  `runmode` varchar(20) DEFAULT NULL COMMENT '运行模式，单机运行，多机并发',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COMMENT='执行计划表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `executeplan`
--

LOCK TABLES `executeplan` WRITE;
/*!40000 ALTER TABLE `executeplan` DISABLE KEYS */;
INSERT INTO `executeplan` VALUES (12,5,'功能测试环境','兑换服务回归测试','finish','功能','兑换服务回归测试','2020-12-07 16:08:46','2021-05-27 03:05:22','CI自动化测试','admin','多机执行'),(13,5,'性能测试环境1','兑换服务性能测试','finish','性能','兑换服务性能测试','2020-12-07 16:38:32','2021-05-27 03:05:31','常规测试','admin','单机运行'),(22,5,'功能测试环境','测试中心测试api','new','功能','测试中心测试api','2021-07-15 16:52:41','2021-07-15 16:52:41','常规测试','admin','多机执行');
/*!40000 ALTER TABLE `executeplan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `executeplan_testcase`
--

DROP TABLE IF EXISTS `executeplan_testcase`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `executeplan_testcase` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键Id',
  `executeplanid` bigint(20) unsigned NOT NULL COMMENT '执行计划id',
  `apiid` bigint(20) unsigned NOT NULL COMMENT 'apiid',
  `deployunitid` bigint(20) unsigned NOT NULL COMMENT '发布单元id',
  `deployunitname` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '发布单元',
  `apiname` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'API名',
  `testcaseid` bigint(20) unsigned NOT NULL COMMENT '用例id',
  `casename` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '用例名',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `lastmodify_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '上一次修改时间',
  `creator` varchar(20) DEFAULT NULL COMMENT '操作人',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8mb4 COMMENT='执行计划用例表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `executeplan_testcase`
--

LOCK TABLES `executeplan_testcase` WRITE;
/*!40000 ALTER TABLE `executeplan_testcase` DISABLE KEYS */;
INSERT INTO `executeplan_testcase` VALUES (10,17,1,22,'marketingservice','获取短链',2,'获取用户信息性能','2021-04-28 14:04:12','2021-04-28 14:04:12',NULL),(11,20,1,22,'marketingservice','获取短链',1,'获取用户信息正确111','2021-05-15 23:05:39','2021-05-15 23:05:39',NULL),(13,20,1,22,'marketingservice','获取短链',38,'掉地1','2021-05-16 09:05:45','2021-05-16 09:05:45',NULL),(14,20,3,19,'cornerservice','新获取短链',22,'2','2021-05-16 09:05:36','2021-05-16 09:05:36',NULL),(15,20,3,19,'cornerservice','新获取短链',23,'3','2021-05-16 10:05:28','2021-05-16 10:05:28',NULL),(16,20,3,19,'cornerservice','新获取短链',24,'4','2021-05-16 10:05:28','2021-05-16 10:05:28',NULL),(17,20,3,19,'cornerservice','新获取短链',25,'5','2021-05-16 10:05:28','2021-05-16 10:05:28',NULL),(22,20,2,1,'accountservice','新获取短链',8,'新获取短链正确','2021-05-16 11:05:33','2021-05-16 11:05:33','admin'),(23,20,2,1,'accountservice','新获取短链',28,'测试创建者','2021-05-16 11:05:33','2021-05-16 11:05:33','admin'),(24,20,2,1,'accountservice','新获取短链',29,'creator','2021-05-16 11:05:33','2021-05-16 11:05:33','admin'),(25,20,2,1,'accountservice','新获取短链',30,'1111122','2021-05-16 11:05:33','2021-05-16 11:05:33','admin'),(26,20,2,1,'accountservice','新获取短链',31,'xxxxz','2021-05-16 11:05:33','2021-05-16 11:05:33','admin'),(27,20,2,1,'accountservice','新获取短链',32,'cccccccc','2021-05-16 11:05:33','2021-05-16 11:05:33','admin'),(28,20,2,1,'accountservice','新获取短链',33,'vvvvv','2021-05-16 11:05:33','2021-05-16 11:05:33','admin'),(29,20,2,1,'accountservice','新获取短链',34,'copy1','2021-05-16 11:05:33','2021-05-16 11:05:33','admin'),(30,20,2,1,'accountservice','新获取短链',35,'copy2','2021-05-16 11:05:33','2021-05-16 11:05:33','admin'),(31,20,2,1,'accountservice','新获取短链',36,'copy3','2021-05-16 11:05:33','2021-05-16 11:05:33','admin'),(32,20,2,1,'accountservice','新获取短链',37,'copy4','2021-05-16 11:05:07','2021-05-16 11:05:07','admin'),(33,21,2,1,'accountservice','新获取短链',8,'新获取短链正确','2021-05-16 11:05:33','2021-05-16 11:05:33','admin'),(34,12,1,22,'marketingservice','获取短链',1,'获取用户信息正确','2021-05-26 23:05:09','2021-05-26 23:05:09','admin'),(35,12,1,22,'marketingservice','获取短链',39,'复制用户信息正确','2021-05-27 00:05:46','2021-05-27 00:05:46','admin'),(36,22,13,27,'testcenterservice','获取执行计划统计数据',44,'获取执行计划统计数据列表','2021-07-15 16:07:17','2021-07-15 16:07:17','admin'),(39,13,1,22,'marketingservice','获取短链',2,'获取用户信息性能111','2021-07-18 15:07:20','2021-07-18 15:07:20','admin');
/*!40000 ALTER TABLE `executeplan_testcase` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `executeplanbatch`
--

DROP TABLE IF EXISTS `executeplanbatch`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `executeplanbatch` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '执行计划Id',
  `executeplanid` bigint(20) unsigned NOT NULL COMMENT '执行计划id',
  `batchname` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '批次名',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `lastmodify_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '上一次修改时间',
  `creator` varchar(10) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '创建者',
  `status` varchar(10) DEFAULT NULL COMMENT '状态，new，waiting，running，pause，finish',
  `source` varchar(10) DEFAULT NULL COMMENT '来源，平台，ci,其他',
  `executeplanname` varchar(100) DEFAULT NULL COMMENT '计划名',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='执行计划表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `executeplanbatch`
--

LOCK TABLES `executeplanbatch` WRITE;
/*!40000 ALTER TABLE `executeplanbatch` DISABLE KEYS */;
/*!40000 ALTER TABLE `executeplanbatch` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `macdepunit`
--

DROP TABLE IF EXISTS `macdepunit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `macdepunit` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Id',
  `depunitid` bigint(20) unsigned DEFAULT NULL COMMENT '发布单元Id',
  `assembleid` bigint(20) unsigned DEFAULT NULL COMMENT '组件Id',
  `deployunitname` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '发布单元名',
  `assembletype` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '组件类型',
  `machineid` bigint(20) unsigned NOT NULL COMMENT '服务器Id',
  `machinename` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '机器名',
  `envid` bigint(20) unsigned NOT NULL COMMENT '环境Id',
  `enviromentname` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '环境名',
  `visittype` varchar(10) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '访问方式，ip,域名',
  `domain` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '服务域名',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `lastmodify_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '上一次修改时间',
  `creator` varchar(20) DEFAULT NULL COMMENT '创建者',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COMMENT='服务器发布单元表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `macdepunit`
--

LOCK TABLES `macdepunit` WRITE;
/*!40000 ALTER TABLE `macdepunit` DISABLE KEYS */;
INSERT INTO `macdepunit` VALUES (8,1,NULL,'accountservice','发布单元',7,'自己的测试服务器',5,'功能测试环境','域名','marketing-ui.confucius.mobi','2020-11-16 10:16:33','2021-04-26 19:04:35','admin'),(9,19,NULL,'cornerservice','发布单元',7,'测试服务器',5,'功能测试环境','域名','api.cdmtzz.com','2020-11-16 20:54:52','2021-04-02 19:04:37',NULL),(10,NULL,1,'账户mysql数据库','组件',7,'自己的测试服务器',5,'功能测试环境','','','2020-11-29 15:32:24','2021-04-02 19:04:27',NULL),(11,22,NULL,'marketingservice','发布单元',7,'自己的测试服务器',5,'功能测试环境','域名','marketing-ui.confucius.mobi','2020-12-07 16:10:06','2021-04-02 19:04:35',NULL),(12,22,NULL,'marketingservice','发布单元',7,'自己的测试服务器',19,'性能测试环境','域名','marketing-ui.confucius.mobi','2020-12-07 16:37:58','2021-04-02 19:04:48',NULL),(21,27,NULL,'testcenterservice','发布单元',7,'测试服务器',5,'功能测试环境','ip','','2021-07-15 16:52:15','2021-07-15 16:52:15','admin');
/*!40000 ALTER TABLE `macdepunit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `machine`
--

DROP TABLE IF EXISTS `machine`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `machine` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户Id',
  `machinename` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '机器名',
  `ip` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'ip',
  `cpu` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'cpu',
  `disk` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'disk',
  `mem` varchar(512) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '内存',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `lastmodify_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '上一次修改时间',
  `creator` varchar(20) DEFAULT NULL COMMENT '创建者',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COMMENT='服务器表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `machine`
--

LOCK TABLES `machine` WRITE;
/*!40000 ALTER TABLE `machine` DISABLE KEYS */;
INSERT INTO `machine` VALUES (7,'测试服务器','127.0.0.1','4','100G','8G','2020-10-17 17:53:43','2020-10-17 17:53:43',NULL);
/*!40000 ALTER TABLE `machine` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `performancereportsource`
--

DROP TABLE IF EXISTS `performancereportsource`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `performancereportsource` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '环境Id',
  `planid` bigint(20) unsigned NOT NULL COMMENT '执行计划Id',
  `batchid` bigint(20) unsigned NOT NULL COMMENT '批次Id',
  `batchname` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '批次',
  `slaverid` bigint(20) unsigned NOT NULL COMMENT '执行机Id',
  `caseid` bigint(20) unsigned NOT NULL COMMENT '用例Id',
  `testclass` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '解析文件匹配sample',
  `runtime` double(11,2) NOT NULL COMMENT '运行时长',
  `source` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '解析文件目录',
  `status` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '待解析，已解析',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `lastmodify_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '上一次修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=utf8mb4 COMMENT='性能报告路径表';
/*!40101 SET character_set_client = @saved_cs_client */;


--
-- Table structure for table `permission`
--

DROP TABLE IF EXISTS `permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `permission` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '权限Id',
  `resource` varchar(256) NOT NULL COMMENT '权限对应的资源',
  `code` varchar(256) NOT NULL COMMENT '权限的代码/通配符,对应代码中@hasAuthority(xx)',
  `handle` varchar(256) NOT NULL COMMENT '对应的资源操作',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=166 DEFAULT CHARSET=utf8mb4 COMMENT='权限表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permission`
--

LOCK TABLES `permission` WRITE;
/*!40000 ALTER TABLE `permission` DISABLE KEYS */;
INSERT INTO `permission` VALUES (1,'账号','account:list','列表'),(2,'账号','account:detail','详情'),(3,'账号','account:add','添加'),(4,'账号','account:update','更新'),(5,'账号','account:delete','删除'),(6,'账号','account:search','搜索'),(7,'角色','role:list','列表'),(8,'角色','role:detail','详情'),(9,'角色','role:add','添加'),(10,'角色','role:update','更新'),(11,'角色','role:delete','删除'),(12,'角色','role:search','搜索'),(13,'测试表','table:list','列表'),(14,'字典','dictionary:list','列表'),(15,'字典','dictionary:add','添加'),(16,'字典','dictionary:search','搜索'),(17,'字典','dictionary:update','修改'),(18,'字典','dictionary:delete','删除'),(19,'发布单元','depunit:list','列表'),(20,'发布单元','depunit:detail','详情'),(21,'发布单元','depunit:add','添加'),(22,'发布单元','depunit:update','更新'),(23,'发布单元','depunit:delete','删除'),(24,'发布单元','depunit:search','搜索'),(25,'测试环境','enviroment:list','列表'),(26,'测试环境','enviroment:detail','详情'),(27,'测试环境','enviroment:add','添加'),(28,'测试环境','enviroment:update','更新'),(29,'测试环境','enviroment:delete','删除'),(30,'测试环境','enviroment:search','搜索'),(31,'服务器','machine:list','列表'),(32,'服务器','machine:detail','详情'),(33,'服务器','machine:add','添加'),(34,'服务器','machine:update','更新'),(35,'服务器','machine:delete','删除'),(36,'服务器','machine:search','搜索'),(37,'测试人员','tester:list','列表'),(38,'测试人员','tester:detail','详情'),(39,'测试人员','tester:add','添加'),(40,'测试人员','tester:update','更新'),(41,'测试人员','tester:delete','删除'),(42,'测试人员','tester:search','搜索'),(43,'api','api:list','列表'),(44,'api','api:detail','详情'),(45,'api','api:add','添加'),(46,'api','api:update','更新'),(47,'api','api:delete','删除'),(48,'api','api:search','搜索'),(49,'api参数','apiparams:list','列表'),(50,'api参数','apiparams:detail','详情'),(51,'api参数','apiparams:add','添加'),(52,'api参数','apiparams:update','更新'),(53,'api参数','apiparams:delete','删除'),(54,'api参数','apiparams:search','搜索'),(55,'环境服务器','envmachine:list','列表'),(56,'环境服务器','envmachine:detail','详情'),(57,'环境服务器','envmachine:add','添加'),(58,'环境服务器','envmachine:update','更新'),(59,'环境服务器','envmachine:delete','删除'),(60,'环境服务器','envmachine:search','搜索'),(61,'服务器发布单元','macdepunit:list','列表'),(62,'服务器发布单元','macdepunit:detail','详情'),(63,'服务器发布单元','macdepunit:add','添加'),(64,'服务器发布单元','macdepunit:update','更新'),(65,'服务器发布单元','macdepunit:delete','删除'),(66,'服务器发布单元','macdepunit:search','搜索'),(67,'API用例库','apicases:list','列表'),(68,'API用例库','apicases:detail','详情'),(69,'API用例库','apicases:add','增加'),(70,'API用例库','apicases:update','更新'),(71,'API用例库','apicases:delete','删除'),(72,'API用例库','apicases:search','查询'),(73,'执行机','slaver:list','列表'),(74,'执行机','slaver:detail','详情'),(75,'执行机','slaver:add','增加'),(76,'执行机','slaver:update','更新'),(77,'执行机','slaver:delete','删除'),(78,'执行机','slaver:search','查询'),(79,'执行计划','executeplan:list','列表'),(80,'执行计划','executeplan:detail','详情'),(81,'执行计划','executeplan:add','增加'),(82,'执行计划','executeplan:update','更新'),(83,'执行计划','executeplan:delete','删除'),(84,'执行计划','executeplan:search','查询'),(85,'api报告','apireport:list','列表'),(86,'api报告','apireport:detail','详情'),(87,'api报告','apireport:add','增加'),(88,'api报告','apireport:update','更新'),(89,'api报告','apireport:delete','删除'),(90,'api报告','apireport:search','查询'),(91,'API用例库','apicases:params','参数'),(92,'用例前后条件','apicases_condition:list','列表'),(93,'用例前后条件','apicases_condition:detail','详情'),(94,'用例前后条件','apicases_condition:add','增加'),(95,'用例前后条件','apicases_condition:update','更新'),(96,'用例前后条件','apicases_condition:delete','删除'),(97,'用例前后条件','apicases_condition:search','查询'),(98,'环境组件','enviroment_assemble:list','列表'),(99,'环境组件','enviroment_assemble:detail','详情'),(100,'环境组件','enviroment_assemble:add','增加'),(101,'环境组件','enviroment_assemble:update','更新'),(102,'环境组件','enviroment_assemble:delete','删除'),(103,'环境组件','enviroment_assemble:search','查询'),(104,'调度','dispatch:list','列表'),(105,'调度','dispatch:detail','详情'),(106,'调度','dispatch:add','增加'),(107,'调度','dispatch:update','更新'),(108,'调度','dispatch:delete','删除'),(109,'调度','dispatch:search','查询'),(110,'性能报告','apiperformancereport:list','列表'),(111,'性能报告','apiperformancereport:detail','列表'),(112,'性能报告','apiperformancereport:add','列表'),(113,'性能报告','apiperformancereport:update','列表'),(114,'性能报告','apiperformancereport:delete','列表'),(115,'性能报告','apiperformancereport:search','列表'),(116,'性能报告','apiperformancestatistics:list','列表'),(117,'性能报告','apiperformancestatistics:detail','详情'),(118,'性能报告','apiperformancestatistics:add','增加'),(119,'性能报告','apiperformancestatistics:update','更新'),(120,'性能报告','apiperformancestatistics:delete','删除'),(121,'性能报告','apiperformancestatistics:search','查询'),(122,'功能报告统计','apireportstatics:list','列表'),(123,'功能报告统计','apireportstatics:search','查询'),(124,'执行计划批次','executeplanbatch:list','列表'),(125,'执行计划批次','executeplanbatch:detail','详情'),(126,'执行计划批次','executeplanbatch:add','增加'),(127,'执行计划批次','executeplanbatch:update','更新'),(128,'执行计划批次','executeplanbatch:delete','删除'),(129,'执行计划批次','executeplanbatch:search','查询'),(130,'条件管理','condition:list','列表'),(131,'条件管理','condition:search','查询'),(132,'条件管理','condition:add','增加'),(133,'条件管理','condition:detail','详情'),(134,'条件管理','condition:update','更新'),(135,'条件管理','condition:delete','删除'),(136,'api条件','apicondition:list','列表'),(137,'api条件','apicondition:search','查询'),(138,'api条件','apicondition:add','增加'),(139,'api条件','apicondition:detail','详情'),(140,'api条件','apicondition:update','更新'),(141,'api条件','apicondition:delete','删除'),(142,'变量管理','testvariables:list','列表'),(143,'变量管理','testvariables:search','查询'),(144,'变量管理','testvariables:add','增加'),(145,'变量管理','testvariables:detail','详情'),(146,'变量管理','testvariables:update','更新'),(147,'变量管理','testvariables:delete','删除'),(148,'用例变量','ApicasesVariables:list','列表'),(149,'用例变量','ApicasesVariables:search','查询'),(150,'用例变量','ApicasesVariables:add','增加'),(151,'用例变量','ApicasesVariables:detail','详情'),(152,'用例变量','ApicasesVariables:update','更新'),(153,'用例变量','ApicasesVariables:delete','删除'),(154,'变量值','testvariablesvalue:list','列表'),(155,'变量值','testvariablesvalue:search','查询'),(156,'变量值','testvariablesvalue:add','增加'),(157,'变量值','testvariablesvalue:detail','详情'),(158,'变量值','testvariablesvalue:update','更新'),(159,'变量值','testvariablesvalue:delete','删除'),(160,'条件报告','testconditionreport:list','列表'),(161,'条件报告','testconditionreport:search','查询'),(162,'条件报告','testconditionreport:add','增加'),(163,'条件报告','testconditionreport:detail','详情'),(164,'条件报告','testconditionreport:update','更新'),(165,'条件报告','testconditionreport:delete','删除');
/*!40000 ALTER TABLE `permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `role` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '角色Id',
  `name` varchar(64) DEFAULT NULL COMMENT '角色名称',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COMMENT='角色表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` VALUES (1,'超级管理员','2019-07-01 00:00:00','2019-07-01 00:00:00'),(2,'普通用户','2019-07-01 00:00:00','2019-07-01 00:00:00'),(3,'测试','2019-07-01 00:00:00','2019-07-01 00:00:00');
/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role_permission`
--

DROP TABLE IF EXISTS `role_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `role_permission` (
  `role_id` bigint(20) unsigned NOT NULL COMMENT '角色Id',
  `permission_id` bigint(20) unsigned NOT NULL COMMENT '权限Id',
  PRIMARY KEY (`role_id`,`permission_id`),
  KEY `permission_id` (`permission_id`),
  CONSTRAINT `role_permission_fk_1` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `role_permission_fk_2` FOREIGN KEY (`permission_id`) REFERENCES `permission` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='角色权限表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role_permission`
--

LOCK TABLES `role_permission` WRITE;
/*!40000 ALTER TABLE `role_permission` DISABLE KEYS */;
INSERT INTO `role_permission` VALUES (3,1),(3,5);
/*!40000 ALTER TABLE `role_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `slaver`
--

DROP TABLE IF EXISTS `slaver`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `slaver` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '执行机Id',
  `slavername` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '执行机器名',
  `ip` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'ip',
  `port` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '端口',
  `status` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '状态，idle，running',
  `stype` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '执行机类型，功能机，性能机',
  `memo` varchar(512) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '备注',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `lastmodify_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '上一次修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COMMENT='服务器表';
/*!40101 SET character_set_client = @saved_cs_client */;


--
-- Table structure for table `statics_deployunitandcases`
--

DROP TABLE IF EXISTS `statics_deployunitandcases`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `statics_deployunitandcases` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Id',
  `deployunitid` bigint(20) unsigned NOT NULL COMMENT '执行计划id',
  `deployunitname` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '计划名',
  `passrate` double(11,2) NOT NULL COMMENT '成功率',
  `totalcases` bigint(20) NOT NULL COMMENT '用例总数',
  `totalpasscases` bigint(20) NOT NULL COMMENT '用例成功总数',
  `totalfailcases` bigint(20) NOT NULL COMMENT '用例失败总数',
  `runtime` bigint(50) NOT NULL COMMENT '运行时长',
  `statics_date` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '统计日期',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `lastmodify_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '上一次修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COMMENT='api发布单元用例统计报告表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `statics_deployunitandcases`
--

LOCK TABLES `statics_deployunitandcases` WRITE;
/*!40000 ALTER TABLE `statics_deployunitandcases` DISABLE KEYS */;
INSERT INTO `statics_deployunitandcases` VALUES (1,22,'marketingservice',0.00,3,0,3,127602,'2021-05-25 00:00:00','2021-05-27 10:05:59','2021-05-27 10:05:59'),(2,27,'testcenterservice',20.00,5,1,4,972,'2021-07-21 00:00:00','2021-07-22 03:07:44','2021-07-22 03:07:44');
/*!40000 ALTER TABLE `statics_deployunitandcases` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `statics_planandcases`
--

DROP TABLE IF EXISTS `statics_planandcases`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `statics_planandcases` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Id',
  `testplanid` bigint(20) unsigned NOT NULL COMMENT '执行计划id',
  `testplanname` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '计划名',
  `passrate` double(11,2) NOT NULL COMMENT '成功率',
  `totalcases` bigint(20) NOT NULL COMMENT '用例总数',
  `totalpasscases` bigint(20) NOT NULL COMMENT '用例成功总数',
  `totalfailcases` bigint(20) NOT NULL COMMENT '用例失败总数',
  `runtime` bigint(50) NOT NULL COMMENT '运行时长',
  `statics_date` date NOT NULL COMMENT '统计日期',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `lastmodify_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '上一次修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COMMENT='api计划用例统计报告表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `statics_planandcases`
--

LOCK TABLES `statics_planandcases` WRITE;
/*!40000 ALTER TABLE `statics_planandcases` DISABLE KEYS */;
INSERT INTO `statics_planandcases` VALUES (1,12,'兑换服务回归测试',0.00,3,0,3,127602,'2021-05-25','2021-05-27 10:05:59','2021-05-27 10:05:59'),(2,22,'测试中心测试api',20.00,5,1,4,972,'2021-07-21','2021-07-22 03:07:44','2021-07-22 03:07:44');
/*!40000 ALTER TABLE `statics_planandcases` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `test`
--

DROP TABLE IF EXISTS `test`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `test` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户Id',
  `email` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '邮箱',
  `name` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '用户名',
  `password` varchar(512) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '密码',
  `register_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '注册时间',
  `login_time` datetime DEFAULT NULL COMMENT '上一次登录时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `ix_account_name` (`name`),
  UNIQUE KEY `ix_account_email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COMMENT='测试表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `test`
--

LOCK TABLES `test` WRITE;
/*!40000 ALTER TABLE `test` DISABLE KEYS */;
INSERT INTO `test` VALUES (1,'admin11111@qq.com','admin','$2a$10$wg0f10n.30UbU.9hPpucbef/ya62LdTKs72xJfjxvTFsL0Xaewbra','2019-07-01 00:00:00','2019-07-01 00:00:00'),(2,'editor@qq.com','editor','$2a$10$/m4SgZ.ZFVZ7rcbQpJW2tezmuhf/UzQtpAtXb0WZiAE3TeHxq2DYu','2019-07-02 00:00:00','2019-07-02 00:00:00'),(3,'test@qq.com','test','$2a$10$.0gBYBHAtdkxUUQNg3kII.fqGOngF4BLe8JavthZFalt2QIXHlrhm','2019-07-03 00:00:00','2019-07-03 00:00:00');
/*!40000 ALTER TABLE `test` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `testcondition`
--

DROP TABLE IF EXISTS `testcondition`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `testcondition` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Id',
  `conditionname` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '条件名',
  `objectid` bigint(20) unsigned DEFAULT NULL COMMENT '目标Id，计划，用例的id',
  `objectname` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '目标名',
  `objecttype` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '目标类型',
  `conditiontype` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '条件类型，前置，后置，其他',
  `memo` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '备注',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `lastmodify_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '上一次修改时间',
  `creator` varchar(10) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '创建者',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='条件表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `testcondition`
--

LOCK TABLES `testcondition` WRITE;
/*!40000 ALTER TABLE `testcondition` DISABLE KEYS */;
/*!40000 ALTER TABLE `testcondition` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `testcondition_report`
--

DROP TABLE IF EXISTS `testcondition_report`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `testcondition_report` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Id',
  `conditionid` bigint(20) DEFAULT NULL COMMENT '条件id',
  `conditiontype` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '条件类型，接口，数据库，其他',
  `subconditionid` bigint(20) DEFAULT NULL COMMENT '子条件id，接口，db，nosql条件id',
  `conditionresult` varchar(2000) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '接口返回，数据库返回结果等等',
  `conditionstatus` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '条件完成状态，成功，失败',
  `runtime` bigint(20) NOT NULL COMMENT '运行时长',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `lastmodify_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '上一次修改时间',
  `creator` varchar(10) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '创建者',
  `batchname` varchar(64) DEFAULT NULL COMMENT '批次',
  `planname` varchar(64) DEFAULT NULL COMMENT '计划名',
  `testplanid` bigint(20) DEFAULT NULL COMMENT '计划id',
  `subconditiontype` varchar(20) DEFAULT NULL COMMENT '子条件类型',
  `status` varchar(64) DEFAULT NULL COMMENT '状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='条件报告表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `testcondition_report`
--

LOCK TABLES `testcondition_report` WRITE;
/*!40000 ALTER TABLE `testcondition_report` DISABLE KEYS */;
/*!40000 ALTER TABLE `testcondition_report` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tester`
--

DROP TABLE IF EXISTS `tester`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tester` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Id',
  `testername` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '测试人员姓名',
  `testertitle` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '测试人员职务',
  `testerorg` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '所属组织',
  `testermemo` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '备注',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `lastmodify_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '上一次修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COMMENT='测试人员表';
/*!40101 SET character_set_client = @saved_cs_client */;


--
-- Table structure for table `testvariables`
--

DROP TABLE IF EXISTS `testvariables`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `testvariables` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Id',
  `testvariablesname` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '变量名',
  `testvariablestype` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '变量类型，用例变量，全局变量',
  `variablesexpress` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '变量表达',
  `memo` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '备注',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `lastmodify_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '上一次修改时间',
  `creator` varchar(20) DEFAULT NULL COMMENT '创建者',
  `variablesdes` varchar(100) DEFAULT NULL COMMENT '变量描述',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='变量表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `testvariables`
--

LOCK TABLES `testvariables` WRITE;
/*!40000 ALTER TABLE `testvariables` DISABLE KEYS */;
/*!40000 ALTER TABLE `testvariables` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `testvariables_value`
--

DROP TABLE IF EXISTS `testvariables_value`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `testvariables_value` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Id',
  `planid` bigint(20) unsigned NOT NULL COMMENT '计划Id',
  `planname` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '计划名',
  `caseid` bigint(20) unsigned NOT NULL COMMENT '用例Id',
  `casename` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '用例名',
  `variablesid` bigint(20) unsigned NOT NULL COMMENT '变量Id',
  `variablesname` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '变量名',
  `variablesvalue` varchar(2000) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '变量值',
  `memo` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '备注',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `lastmodify_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '上一次修改时间',
  `batchname` varchar(64) DEFAULT NULL COMMENT '批次',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='变量值表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `testvariables_value`
--

LOCK TABLES `testvariables_value` WRITE;
/*!40000 ALTER TABLE `testvariables_value` DISABLE KEYS */;
/*!40000 ALTER TABLE `testvariables_value` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-09-26 13:01:22
