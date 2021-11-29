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

 Date: 29/11/2021 15:42:10
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for t_order
-- ----------------------------
DROP TABLE IF EXISTS `t_order`;
CREATE TABLE `t_order`
(
    `id`           int(11)                                NOT NULL AUTO_INCREMENT,
    `order_no`     varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '订单编号',
    `pay_amount`   decimal(10, 2)                         NOT NULL DEFAULT '0.00' COMMENT '支付金额',
    `data_status`  int(11)                                NOT NULL DEFAULT '1' COMMENT '数据状态：1有效；0失效',
    `created_date` datetime                               NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `updated_date` datetime                                        DEFAULT NULL,
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 10
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_unicode_ci COMMENT ='订单';

-- ----------------------------
-- Table structure for t_order_item
-- ----------------------------
DROP TABLE IF EXISTS `t_order_item`;
CREATE TABLE `t_order_item`
(
    `id`            int(11)                                 NOT NULL AUTO_INCREMENT,
    `order_id`      int(11)                                 NOT NULL COMMENT '订单ID',
    `product_name`  varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '商品名称',
    `product_count` int(11)                                 NOT NULL DEFAULT '0' COMMENT '商品数量',
    `data_status`   int(11)                                 NOT NULL DEFAULT '1' COMMENT '数据状态：1有效；0失效',
    `created_date`  datetime                                NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `updated_date`  datetime                                         DEFAULT NULL,
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 19
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_unicode_ci COMMENT ='订单项';

SET FOREIGN_KEY_CHECKS = 1;
