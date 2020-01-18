/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50724
Source Host           : localhost:3306
Source Database       : ares

Target Server Type    : MYSQL
Target Server Version : 50724
File Encoding         : 65001

Date: 2020-01-17 22:00:23
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for consumers
-- ----------------------------
DROP TABLE IF EXISTS `consumers`;
CREATE TABLE `consumers` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `created_at` datetime DEFAULT NULL COMMENT '创建时间',
  `username` varchar(200) DEFAULT NULL COMMENT '消费者名称',
  `custom_id` varchar(1024) DEFAULT NULL COMMENT '消费者ID',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uniq_consumer_name` (`username`),
  UNIQUE KEY `uniq_consumer_custom_id` (`custom_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for routes
-- ----------------------------
DROP TABLE IF EXISTS `routes`;
CREATE TABLE `routes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `name` varchar(200) DEFAULT NULL COMMENT '路由名称',
  `created_at` datetime DEFAULT NULL COMMENT '创建时间',
  `updated_at` datetime DEFAULT NULL COMMENT '更新时间',
  `service_id` int(11) DEFAULT NULL COMMENT '服务ID',
  `protocols` varchar(200) DEFAULT 'http' COMMENT '协议',
  `methods` varchar(200) DEFAULT 'GET' COMMENT '方法',
  `hosts` varchar(200) DEFAULT NULL COMMENT '浏览器访问域名，主机名',
  `paths` varchar(200) DEFAULT NULL COMMENT '访问路径',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uniq_route_name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for services
-- ----------------------------
DROP TABLE IF EXISTS `services`;
CREATE TABLE `services` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `created_at` datetime DEFAULT NULL COMMENT '创建时间',
  `updated_at` datetime DEFAULT NULL COMMENT '更新时间',
  `name` varchar(200) DEFAULT NULL COMMENT '服务名称',
  `protocol` varchar(200) DEFAULT 'http' COMMENT '协议',
  `host` varchar(200) DEFAULT NULL COMMENT '主机地址',
  `port` varchar(200) DEFAULT '80' COMMENT '端口',
  `path` varchar(200) DEFAULT '/' COMMENT '路径',
  `connect_timeout` int(11) DEFAULT '60000' COMMENT '连接超时时间',
  `write_timeout` int(11) DEFAULT '60000' COMMENT '写数据超时时间',
  `read_timeout` int(11) DEFAULT '60000' COMMENT '读数据超时时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uniq_service_name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
