/*
 Navicat Premium Data Transfer

 Source Server         : local
 Source Server Type    : MySQL
 Source Server Version : 50734
 Source Host           : localhost:3306
 Source Schema         : spring_mp_db

 Target Server Type    : MySQL
 Target Server Version : 50734
 File Encoding         : 65001

 Date: 06/07/2022 16:14:52
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for qrtz_blob_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_blob_triggers`;
CREATE TABLE `qrtz_blob_triggers` (
  `SCHED_NAME` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `TRIGGER_NAME` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `TRIGGER_GROUP` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `BLOB_DATA` blob,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `qrtz_blob_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of qrtz_blob_triggers
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for qrtz_calendars
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_calendars`;
CREATE TABLE `qrtz_calendars` (
  `SCHED_NAME` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `CALENDAR_NAME` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `CALENDAR` blob NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`CALENDAR_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of qrtz_calendars
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for qrtz_cron_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_cron_triggers`;
CREATE TABLE `qrtz_cron_triggers` (
  `SCHED_NAME` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `TRIGGER_NAME` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `TRIGGER_GROUP` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `CRON_EXPRESSION` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `TIME_ZONE_ID` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `qrtz_cron_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of qrtz_cron_triggers
-- ----------------------------
BEGIN;
INSERT INTO `qrtz_cron_triggers` VALUES ('scheduler', 'cron_TestTask', 'TEST', '0/3 * * * * ? ', 'Asia/Shanghai');
COMMIT;

-- ----------------------------
-- Table structure for qrtz_fired_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_fired_triggers`;
CREATE TABLE `qrtz_fired_triggers` (
  `SCHED_NAME` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ENTRY_ID` varchar(95) COLLATE utf8mb4_unicode_ci NOT NULL,
  `TRIGGER_NAME` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `TRIGGER_GROUP` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `INSTANCE_NAME` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `FIRED_TIME` bigint(13) NOT NULL,
  `SCHED_TIME` bigint(13) NOT NULL,
  `PRIORITY` int(11) NOT NULL,
  `STATE` varchar(16) COLLATE utf8mb4_unicode_ci NOT NULL,
  `JOB_NAME` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `JOB_GROUP` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `IS_NONCONCURRENT` varchar(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `REQUESTS_RECOVERY` varchar(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`,`ENTRY_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of qrtz_fired_triggers
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for qrtz_job_details
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_job_details`;
CREATE TABLE `qrtz_job_details` (
  `SCHED_NAME` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `JOB_NAME` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `JOB_GROUP` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `DESCRIPTION` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `JOB_CLASS_NAME` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `IS_DURABLE` varchar(1) COLLATE utf8mb4_unicode_ci NOT NULL,
  `IS_NONCONCURRENT` varchar(1) COLLATE utf8mb4_unicode_ci NOT NULL,
  `IS_UPDATE_DATA` varchar(1) COLLATE utf8mb4_unicode_ci NOT NULL,
  `REQUESTS_RECOVERY` varchar(1) COLLATE utf8mb4_unicode_ci NOT NULL,
  `JOB_DATA` blob,
  PRIMARY KEY (`SCHED_NAME`,`JOB_NAME`,`JOB_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of qrtz_job_details
-- ----------------------------
BEGIN;
INSERT INTO `qrtz_job_details` VALUES ('scheduler', 'TestTask', 'TEST', NULL, 'com.example.spring_mp.quartz.config.QuartzJobBean', '0', '0', '0', '0', 0x230A23576564204A756C2030362031363A31333A31312043535420323032320A6265616E4E616D653D546573745461736B0A);
COMMIT;

-- ----------------------------
-- Table structure for qrtz_locks
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_locks`;
CREATE TABLE `qrtz_locks` (
  `SCHED_NAME` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `LOCK_NAME` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`LOCK_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of qrtz_locks
-- ----------------------------
BEGIN;
INSERT INTO `qrtz_locks` VALUES ('scheduler', 'TRIGGER_ACCESS');
COMMIT;

-- ----------------------------
-- Table structure for qrtz_paused_trigger_grps
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_paused_trigger_grps`;
CREATE TABLE `qrtz_paused_trigger_grps` (
  `SCHED_NAME` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `TRIGGER_GROUP` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of qrtz_paused_trigger_grps
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for qrtz_scheduler_state
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_scheduler_state`;
CREATE TABLE `qrtz_scheduler_state` (
  `SCHED_NAME` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `INSTANCE_NAME` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `LAST_CHECKIN_TIME` bigint(13) NOT NULL,
  `CHECKIN_INTERVAL` bigint(13) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`INSTANCE_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of qrtz_scheduler_state
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for qrtz_simple_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simple_triggers`;
CREATE TABLE `qrtz_simple_triggers` (
  `SCHED_NAME` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `TRIGGER_NAME` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `TRIGGER_GROUP` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `REPEAT_COUNT` bigint(7) NOT NULL,
  `REPEAT_INTERVAL` bigint(12) NOT NULL,
  `TIMES_TRIGGERED` bigint(10) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `qrtz_simple_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of qrtz_simple_triggers
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for qrtz_simprop_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simprop_triggers`;
CREATE TABLE `qrtz_simprop_triggers` (
  `SCHED_NAME` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `TRIGGER_NAME` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `TRIGGER_GROUP` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `STR_PROP_1` varchar(512) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `STR_PROP_2` varchar(512) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `STR_PROP_3` varchar(512) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `INT_PROP_1` int(11) DEFAULT NULL,
  `INT_PROP_2` int(11) DEFAULT NULL,
  `LONG_PROP_1` bigint(20) DEFAULT NULL,
  `LONG_PROP_2` bigint(20) DEFAULT NULL,
  `DEC_PROP_1` decimal(13,4) DEFAULT NULL,
  `DEC_PROP_2` decimal(13,4) DEFAULT NULL,
  `BOOL_PROP_1` varchar(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `BOOL_PROP_2` varchar(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `qrtz_simprop_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of qrtz_simprop_triggers
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for qrtz_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_triggers`;
CREATE TABLE `qrtz_triggers` (
  `SCHED_NAME` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `TRIGGER_NAME` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `TRIGGER_GROUP` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `JOB_NAME` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `JOB_GROUP` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `DESCRIPTION` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `NEXT_FIRE_TIME` bigint(13) DEFAULT NULL,
  `PREV_FIRE_TIME` bigint(13) DEFAULT NULL,
  `PRIORITY` int(11) DEFAULT NULL,
  `TRIGGER_STATE` varchar(16) COLLATE utf8mb4_unicode_ci NOT NULL,
  `TRIGGER_TYPE` varchar(8) COLLATE utf8mb4_unicode_ci NOT NULL,
  `START_TIME` bigint(13) NOT NULL,
  `END_TIME` bigint(13) DEFAULT NULL,
  `CALENDAR_NAME` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `MISFIRE_INSTR` smallint(2) DEFAULT NULL,
  `JOB_DATA` blob,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  KEY `SCHED_NAME` (`SCHED_NAME`,`JOB_NAME`,`JOB_GROUP`),
  CONSTRAINT `qrtz_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`) REFERENCES `qrtz_job_details` (`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of qrtz_triggers
-- ----------------------------
BEGIN;
INSERT INTO `qrtz_triggers` VALUES ('scheduler', 'cron_TestTask', 'TEST', 'TestTask', 'TEST', NULL, 1657095198000, 1657095195000, 5, 'WAITING', 'CRON', 1657095191000, 0, NULL, 0, '');
COMMIT;

-- ----------------------------
-- Table structure for t_job
-- ----------------------------
DROP TABLE IF EXISTS `t_job`;
CREATE TABLE `t_job` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `job_name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '任务名称',
  `job_group` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '任务分组',
  `cron` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'corn表达式',
  `last_exec_time` datetime DEFAULT NULL COMMENT '最后执行时间',
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '状态1启用；0关闭',
  `remark` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '说明',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='任务配置表';

-- ----------------------------
-- Records of t_job
-- ----------------------------
BEGIN;
INSERT INTO `t_job` VALUES (1, 'TestTask', 'TEST', '0/3 * * * * ? ', '2022-07-06 16:13:15', 1, '');
COMMIT;

-- ----------------------------
-- Table structure for t_order
-- ----------------------------
DROP TABLE IF EXISTS `t_order`;
CREATE TABLE `t_order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_no` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '订单编号',
  `pay_amount` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '支付金额',
  `data_status` int(11) NOT NULL DEFAULT '1' COMMENT '数据状态：1有效；0失效',
  `created_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='订单';

-- ----------------------------
-- Records of t_order
-- ----------------------------
BEGIN;
INSERT INTO `t_order` VALUES (1, 'NO000001', 22.00, 1, '2021-11-29 10:57:12', '2021-11-29 10:57:13');
INSERT INTO `t_order` VALUES (2, 'NO000002', 100.00, 1, '2021-11-29 02:33:28', '2021-12-13 13:49:37');
INSERT INTO `t_order` VALUES (3, 'NO000003', 100.00, 1, '2021-11-29 02:33:28', '2021-12-13 13:49:37');
INSERT INTO `t_order` VALUES (4, 'NO000004', 100.00, 1, '2021-11-29 02:33:28', '2021-12-13 13:49:37');
INSERT INTO `t_order` VALUES (5, 'NO000005', 200.00, 1, '2021-11-29 02:33:28', '2021-11-29 10:54:02');
INSERT INTO `t_order` VALUES (6, 'NO000006', 100.00, 1, '2021-11-29 02:33:28', '2021-12-13 13:49:37');
INSERT INTO `t_order` VALUES (7, 'NO000007', 100.00, 1, '2021-11-29 02:33:28', '2021-12-13 13:49:37');
INSERT INTO `t_order` VALUES (8, 'NO000008', 100.00, 1, '2021-11-29 02:33:28', '2021-12-13 13:49:37');
INSERT INTO `t_order` VALUES (9, 'NO000009', 100.00, 1, '2021-11-29 02:33:28', '2021-12-13 13:49:37');
INSERT INTO `t_order` VALUES (10, 'NO000001', 100.00, 1, '2021-12-13 05:49:37', '2021-12-13 13:51:22');
INSERT INTO `t_order` VALUES (11, 'NO000002', 100.00, 1, '2021-12-13 05:49:37', '2021-12-13 13:51:22');
INSERT INTO `t_order` VALUES (12, 'NO000003', 100.00, 1, '2021-12-13 05:49:37', '2021-12-13 13:51:22');
INSERT INTO `t_order` VALUES (13, 'NO000004', 100.00, 1, '2021-12-13 05:49:37', '2021-12-13 13:51:22');
INSERT INTO `t_order` VALUES (14, 'NO000005', 100.00, 1, '2021-12-13 05:49:37', '2021-12-13 13:51:22');
INSERT INTO `t_order` VALUES (15, 'NO000006', 100.00, 1, '2021-12-13 05:49:37', '2021-12-13 13:51:22');
INSERT INTO `t_order` VALUES (16, 'NO000007', 100.00, 1, '2021-12-13 05:49:37', '2021-12-13 13:51:22');
INSERT INTO `t_order` VALUES (17, 'NO000008', 100.00, 1, '2021-12-13 05:49:37', '2021-12-13 13:51:22');
INSERT INTO `t_order` VALUES (18, 'NO000009', 100.00, 1, '2021-12-13 05:49:37', '2021-12-13 13:51:22');
INSERT INTO `t_order` VALUES (19, 'NO000001', 100.00, 1, '2021-12-13 05:51:22', NULL);
INSERT INTO `t_order` VALUES (20, 'NO000002', 100.00, 1, '2021-12-13 05:51:22', NULL);
INSERT INTO `t_order` VALUES (21, 'NO000003', 100.00, 1, '2021-12-13 05:51:22', NULL);
INSERT INTO `t_order` VALUES (22, 'NO000004', 100.00, 1, '2021-12-13 05:51:22', NULL);
INSERT INTO `t_order` VALUES (23, 'NO000005', 100.00, 1, '2021-12-13 05:51:22', NULL);
INSERT INTO `t_order` VALUES (24, 'NO000006', 100.00, 1, '2021-12-13 05:51:22', NULL);
INSERT INTO `t_order` VALUES (25, 'NO000007', 100.00, 1, '2021-12-13 05:51:22', NULL);
INSERT INTO `t_order` VALUES (26, 'NO000008', 100.00, 1, '2021-12-13 05:51:22', NULL);
INSERT INTO `t_order` VALUES (27, 'NO000009', 100.00, 1, '2021-12-13 05:51:22', NULL);
COMMIT;

-- ----------------------------
-- Table structure for t_order_item
-- ----------------------------
DROP TABLE IF EXISTS `t_order_item`;
CREATE TABLE `t_order_item` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL COMMENT '订单ID',
  `product_name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '商品名称',
  `product_count` int(11) NOT NULL DEFAULT '0' COMMENT '商品数量',
  `data_status` int(11) NOT NULL DEFAULT '1' COMMENT '数据状态：1有效；0失效',
  `created_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='订单项';

-- ----------------------------
-- Records of t_order_item
-- ----------------------------
BEGIN;
INSERT INTO `t_order_item` VALUES (1, 1, '测试商品', 1, 1, '2021-11-29 02:33:28', NULL);
INSERT INTO `t_order_item` VALUES (2, 1, '测试商品', 2, 1, '2021-11-29 02:33:28', NULL);
INSERT INTO `t_order_item` VALUES (3, 2, '测试商品', 1, 1, '2021-11-29 02:33:28', NULL);
INSERT INTO `t_order_item` VALUES (4, 2, '测试商品', 2, 1, '2021-11-29 02:33:28', NULL);
INSERT INTO `t_order_item` VALUES (5, 3, '测试商品', 1, 1, '2021-11-29 02:33:28', NULL);
INSERT INTO `t_order_item` VALUES (6, 3, '测试商品', 2, 1, '2021-11-29 02:33:28', NULL);
INSERT INTO `t_order_item` VALUES (7, 4, '测试商品', 1, 1, '2021-11-29 02:33:28', NULL);
INSERT INTO `t_order_item` VALUES (8, 4, '测试商品', 2, 1, '2021-11-29 02:33:28', NULL);
INSERT INTO `t_order_item` VALUES (9, 5, '测试商品', 1, 1, '2021-11-29 02:33:28', NULL);
INSERT INTO `t_order_item` VALUES (10, 5, '测试商品', 2, 1, '2021-11-29 02:33:28', NULL);
INSERT INTO `t_order_item` VALUES (11, 6, '测试商品', 1, 1, '2021-11-29 02:33:28', NULL);
INSERT INTO `t_order_item` VALUES (12, 6, '测试商品', 2, 1, '2021-11-29 02:33:28', NULL);
INSERT INTO `t_order_item` VALUES (13, 7, '测试商品', 1, 1, '2021-11-29 02:33:28', NULL);
INSERT INTO `t_order_item` VALUES (14, 7, '测试商品', 2, 1, '2021-11-29 02:33:28', NULL);
INSERT INTO `t_order_item` VALUES (15, 8, '测试商品', 1, 1, '2021-11-29 02:33:28', NULL);
INSERT INTO `t_order_item` VALUES (16, 8, '测试商品', 2, 1, '2021-11-29 02:33:28', NULL);
INSERT INTO `t_order_item` VALUES (17, 9, '测试商品', 1, 1, '2021-11-29 02:33:28', NULL);
INSERT INTO `t_order_item` VALUES (18, 9, '测试商品', 2, 1, '2021-11-29 02:33:28', NULL);
INSERT INTO `t_order_item` VALUES (19, 10, '测试商品', 1, 1, '2021-12-13 05:49:37', NULL);
INSERT INTO `t_order_item` VALUES (20, 10, '测试商品', 2, 1, '2021-12-13 05:49:37', NULL);
INSERT INTO `t_order_item` VALUES (21, 11, '测试商品', 1, 1, '2021-12-13 05:49:37', NULL);
INSERT INTO `t_order_item` VALUES (22, 11, '测试商品', 2, 1, '2021-12-13 05:49:37', NULL);
INSERT INTO `t_order_item` VALUES (23, 12, '测试商品', 1, 1, '2021-12-13 05:49:37', NULL);
INSERT INTO `t_order_item` VALUES (24, 12, '测试商品', 2, 1, '2021-12-13 05:49:37', NULL);
INSERT INTO `t_order_item` VALUES (25, 13, '测试商品', 1, 1, '2021-12-13 05:49:37', NULL);
INSERT INTO `t_order_item` VALUES (26, 13, '测试商品', 2, 1, '2021-12-13 05:49:37', NULL);
INSERT INTO `t_order_item` VALUES (27, 14, '测试商品', 1, 1, '2021-12-13 05:49:37', NULL);
INSERT INTO `t_order_item` VALUES (28, 14, '测试商品', 2, 1, '2021-12-13 05:49:37', NULL);
INSERT INTO `t_order_item` VALUES (29, 15, '测试商品', 1, 1, '2021-12-13 05:49:37', NULL);
INSERT INTO `t_order_item` VALUES (30, 15, '测试商品', 2, 1, '2021-12-13 05:49:37', NULL);
INSERT INTO `t_order_item` VALUES (31, 16, '测试商品', 1, 1, '2021-12-13 05:49:37', NULL);
INSERT INTO `t_order_item` VALUES (32, 16, '测试商品', 2, 1, '2021-12-13 05:49:37', NULL);
INSERT INTO `t_order_item` VALUES (33, 17, '测试商品', 1, 1, '2021-12-13 05:49:37', NULL);
INSERT INTO `t_order_item` VALUES (34, 17, '测试商品', 2, 1, '2021-12-13 05:49:37', NULL);
INSERT INTO `t_order_item` VALUES (35, 18, '测试商品', 1, 1, '2021-12-13 05:49:37', NULL);
INSERT INTO `t_order_item` VALUES (36, 18, '测试商品', 2, 1, '2021-12-13 05:49:37', NULL);
INSERT INTO `t_order_item` VALUES (37, 19, '测试商品', 1, 1, '2021-12-13 05:51:22', NULL);
INSERT INTO `t_order_item` VALUES (38, 19, '测试商品', 2, 1, '2021-12-13 05:51:22', NULL);
INSERT INTO `t_order_item` VALUES (39, 20, '测试商品', 1, 1, '2021-12-13 05:51:22', NULL);
INSERT INTO `t_order_item` VALUES (40, 20, '测试商品', 2, 1, '2021-12-13 05:51:22', NULL);
INSERT INTO `t_order_item` VALUES (41, 21, '测试商品', 1, 1, '2021-12-13 05:51:22', NULL);
INSERT INTO `t_order_item` VALUES (42, 21, '测试商品', 2, 1, '2021-12-13 05:51:22', NULL);
INSERT INTO `t_order_item` VALUES (43, 22, '测试商品', 1, 1, '2021-12-13 05:51:22', NULL);
INSERT INTO `t_order_item` VALUES (44, 22, '测试商品', 2, 1, '2021-12-13 05:51:22', NULL);
INSERT INTO `t_order_item` VALUES (45, 23, '测试商品', 1, 1, '2021-12-13 05:51:22', NULL);
INSERT INTO `t_order_item` VALUES (46, 23, '测试商品', 2, 1, '2021-12-13 05:51:22', NULL);
INSERT INTO `t_order_item` VALUES (47, 24, '测试商品', 1, 1, '2021-12-13 05:51:22', NULL);
INSERT INTO `t_order_item` VALUES (48, 24, '测试商品', 2, 1, '2021-12-13 05:51:22', NULL);
INSERT INTO `t_order_item` VALUES (49, 25, '测试商品', 1, 1, '2021-12-13 05:51:22', NULL);
INSERT INTO `t_order_item` VALUES (50, 25, '测试商品', 2, 1, '2021-12-13 05:51:22', NULL);
INSERT INTO `t_order_item` VALUES (51, 26, '测试商品', 1, 1, '2021-12-13 05:51:22', NULL);
INSERT INTO `t_order_item` VALUES (52, 26, '测试商品', 2, 1, '2021-12-13 05:51:22', NULL);
INSERT INTO `t_order_item` VALUES (53, 27, '测试商品', 1, 1, '2021-12-13 05:51:22', NULL);
INSERT INTO `t_order_item` VALUES (54, 27, '测试商品', 2, 1, '2021-12-13 05:51:22', NULL);
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
