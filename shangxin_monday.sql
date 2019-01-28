/*
Navicat MySQL Data Transfer

Source Server         : test
Source Server Version : 80013
Source Host           : localhost:3306
Source Database       : shangxin

Target Server Type    : MYSQL
Target Server Version : 80013
File Encoding         : 65001

Date: 2018-12-10 22:23:38
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `manager_message`
-- ----------------------------
DROP TABLE IF EXISTS `manager_message`;
CREATE TABLE `manager_message` (
  `ID` int(11) NOT NULL,
  `ACCOUNT` varchar(255) NOT NULL,
  `PASSWORD` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of manager_message
-- ----------------------------
INSERT INTO `manager_message` VALUES ('1', 'root', 'root');

-- ----------------------------
-- Table structure for `personal_cart`
-- ----------------------------
DROP TABLE IF EXISTS `personal_cart`;
CREATE TABLE `personal_cart` (
  `ID` int(11) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `PRICE` varchar(255) NOT NULL,
  `AMOUNT` int(11) NOT NULL,
  `SELLER` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `CLIENT` varchar(255) NOT NULL,
  `PRODUCTID` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of personal_cart
-- ----------------------------

-- ----------------------------
-- Table structure for `personal_order`
-- ----------------------------
DROP TABLE IF EXISTS `personal_order`;
CREATE TABLE `personal_order` (
  `ID` int(11) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `PRICE` double NOT NULL,
  `TRADE-TIME` varchar(255) DEFAULT NULL,
  `SUBMIT-TIME` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `SELLER_ACCOUNT` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `BUYER_ACCOUNT` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `AMOUNT` int(11) NOT NULL,
  `PRODUCTID` int(11) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of personal_order
-- ----------------------------
INSERT INTO `personal_order` VALUES ('280779', '飞科剃须刀', '20', '2018-12-10', '2018-12-10', '777', 'skr', '1', '121319');
INSERT INTO `personal_order` VALUES ('359085', '神仙水', '50', '', '2018-12-10', '777', '', '50', '249491');
INSERT INTO `personal_order` VALUES ('423021', '神仙水', '50', '2018-12-10', '2018-12-10', '777', 'skr', '2', '249491');
INSERT INTO `personal_order` VALUES ('438010', '飞科剃须刀', '20', '', '2018-12-10', '777', '', '1', '121319');
INSERT INTO `personal_order` VALUES ('466511', '神仙水', '50', '2018-12-10', '2018-12-10', '777', 'WANG', '1', '249491');
INSERT INTO `personal_order` VALUES ('649146', '神仙水', '50', '2018-12-10', '2018-12-10', '777', 'skr', '2', '249491');

-- ----------------------------
-- Table structure for `product_message`
-- ----------------------------
DROP TABLE IF EXISTS `product_message`;
CREATE TABLE `product_message` (
  `ID` int(255) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `PRICE` double NOT NULL,
  `TYPE` varchar(255) NOT NULL,
  `SUB` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `SUBMITTIME` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `REGION` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `AMOUNT` int(11) NOT NULL,
  `INTRODUCTION` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of product_message
-- ----------------------------
INSERT INTO `product_message` VALUES ('249491', '神仙水', '50', '运动美妆', '777', '2018-12-10', '四川广元', '40', '75ml 90%');
INSERT INTO `product_message` VALUES ('415119', '算法导论', '10', '其他', 'WANG', '2018-12-10', '成都', '3', '7成新 学姐留下来的');

-- ----------------------------
-- Table structure for `product_remark`
-- ----------------------------
DROP TABLE IF EXISTS `product_remark`;
CREATE TABLE `product_remark` (
  `ID` int(11) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `PRICE` double(11,0) DEFAULT NULL,
  `POINT` varchar(255) NOT NULL,
  `MESSAGE` varchar(255) DEFAULT NULL,
  `AMOUNTS` int(11) DEFAULT NULL,
  `REMARKTIME` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRADETIME` varchar(255) DEFAULT NULL,
  `SUBMITTTIME` varchar(255) NOT NULL,
  `CLIENT` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `SELLER` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `PRODUCTID` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of product_remark
-- ----------------------------
INSERT INTO `product_remark` VALUES ('225700', '飞科剃须刀', '20', '1', '我觉得不行', '1', '2018-12-10', '2018-12-10', '2018-12-10', 'skr', '777', '121319');
INSERT INTO `product_remark` VALUES ('298975', '神仙水', '50', '3', '我觉得OK', '2', '2018-12-10', '2018-12-10', '2018-12-10', 'skr', '777', '249491');
INSERT INTO `product_remark` VALUES ('603890', '神仙水', '50', '2', '我觉得不行', '1', '2018-12-10', '2018-12-10', '2018-12-10', 'WANG', '777', '249491');

-- ----------------------------
-- Table structure for `user_message`
-- ----------------------------
DROP TABLE IF EXISTS `user_message`;
CREATE TABLE `user_message` (
  `ID` int(11) NOT NULL,
  `ACCOUNT` varchar(255) NOT NULL,
  `PASSWORD` varchar(255) NOT NULL,
  `BALANCE` double NOT NULL,
  `CITY` varchar(255) NOT NULL,
  `PHONENUMBER` varchar(255) NOT NULL,
  `ADDRESS` varchar(255) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_message
-- ----------------------------
INSERT INTO `user_message` VALUES ('321582', 'skr', 'skr', '80', '北京', '15788889999', '中国青年政治学院');
INSERT INTO `user_message` VALUES ('465148', 'WANG', '666666', '0', '河北霸州', '15879596555', '家里蹲大学');
INSERT INTO `user_message` VALUES ('517481', '1', '1', '50', '1', '11111111111', '1');
