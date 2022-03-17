/*
 Navicat Premium Data Transfer

 Source Server         : 本机mysql
 Source Server Type    : MySQL
 Source Server Version : 50736
 Source Host           : localhost:3306
 Source Schema         : course

 Target Server Type    : MySQL
 Target Server Version : 50736
 File Encoding         : 65001

 Date: 06/03/2022 23:03:46
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for address
-- ----------------------------
DROP TABLE IF EXISTS `address`;
CREATE TABLE `address` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL COMMENT '收件人',
  `iphone` varchar(255) DEFAULT NULL COMMENT '电话',
  `full_location` varchar(255) DEFAULT NULL COMMENT '地址',
  `address` varchar(255) DEFAULT NULL COMMENT '地址',
  `is_default` tinyint(1) DEFAULT '0' COMMENT '默认地址',
  `postal_code` varchar(255) DEFAULT NULL COMMENT '邮编号',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of address
-- ----------------------------
BEGIN;
INSERT INTO `address` VALUES (1, 2, '小明', '15607191234', '四川省 成都市 武侯区', '成都新城', 0, '', '2022-03-05 14:00:04', '2022-03-05 14:00:04');
COMMIT;

-- ----------------------------
-- Table structure for admin_user
-- ----------------------------
DROP TABLE IF EXISTS `admin_user`;
CREATE TABLE `admin_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) DEFAULT NULL,
  `password` varchar(255) NOT NULL COMMENT '管理员密码',
  `email` varchar(255) DEFAULT NULL,
  `iphone` varchar(255) DEFAULT NULL,
  `sex` varchar(255) DEFAULT '保密',
  `is_super` tinyint(1) DEFAULT '0' COMMENT '是否是超级管理员',
  `status` tinyint(1) DEFAULT '0' COMMENT '状态是否使用',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of admin_user
-- ----------------------------
BEGIN;
INSERT INTO `admin_user` VALUES (1, 'admin', '$2a$10$rnjhQHF2VbQRji3lrbOgIuJEeCgjcrieX3RMzZCCYqxP6rchShEJ2', '', '', '', 0, 1, '2022-03-01 23:52:49', '2022-03-01 23:52:49');
INSERT INTO `admin_user` VALUES (3, 'testa', '$2a$10$eF7hLeSpb74FDEHsLkqGHej2OT7OkOHHp.dMfZwDPC4GH39oGtKYi', '', '', '', 0, 1, '2022-03-02 00:11:21', '2022-03-02 00:11:21');
COMMIT;

-- ----------------------------
-- Table structure for brand
-- ----------------------------
DROP TABLE IF EXISTS `brand`;
CREATE TABLE `brand` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `name_en` varchar(255) NOT NULL COMMENT '英文名',
  `picture` varchar(255) NOT NULL COMMENT '图片地址',
  `logo` varchar(255) NOT NULL COMMENT 'logo地址',
  `place` varchar(255) DEFAULT NULL COMMENT '介绍',
  `status` tinyint(1) DEFAULT '0' COMMENT '状态是否使用',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of brand
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for by_product
-- ----------------------------
DROP TABLE IF EXISTS `by_product`;
CREATE TABLE `by_product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL COMMENT '订单号',
  `name` varchar(255) NOT NULL COMMENT '商品名字',
  `picture` json NOT NULL COMMENT '图片',
  `discount` float(10,2) DEFAULT NULL COMMENT '原价',
  `price` float(10,2) DEFAULT NULL COMMENT '支付价',
  `count` int(11) DEFAULT NULL COMMENT '商品数量',
  `specs` json DEFAULT NULL COMMENT '属性，[]',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of by_product
-- ----------------------------
BEGIN;
INSERT INTO `by_product` VALUES (1, 2, '夏季透气防臭男鞋潮流镂空网鞋男士运动休闲百搭薄款网面跑步潮鞋', '[\"https://s11.mogucdn.com/mlcdn/9620b1/220228_831hklgfh4fjdc73f35a1clk01e8i_750x1000.png\", \"https://s11.mogucdn.com/mlcdn/55cf19/210511_18d6i1aa1l375jb417ijfddjh2g36_640x960.jpg\", \"https://s10.mogucdn.com/mlcdn/55cf19/210511_2ckebk8j1le1k3k90ghi74dfe94k4_640x960.jpg\", \"https://s10.mogucdn.com/mlcdn/55cf19/210511_09d6ge0c9777feld2f23h3ch522gb_640x960.jpg\"]', 99.00, 59.00, 1, '[{\"key\": \"尺码\", \"value\": \"43\"}, {\"key\": \"颜色\", \"value\": \"白色\"}]', '2022-03-05 22:03:39', '2022-03-05 22:03:39');
INSERT INTO `by_product` VALUES (2, 2, '2021秋冬新款韩版宽松连帽时尚印花字母潮流加绒长袖T恤卫衣', '[\"https://s10.mogucdn.com/mlcdn/9620b1/220302_7517817jakhd28bd863ggc80h43f3_750x1000.png_750x1000.v1cAC.81.jpg\", \"https://s11.mogucdn.com/mlcdn/c45406/180831_5cgb8c1f370ad929fd5dk6i6adj48_640x960.jpg_750x1000.v1cAC.81.jpg\"]', 99.00, 59.50, 3, '[{\"key\": \"尺码\", \"value\": \"M\"}, {\"key\": \"颜色\", \"value\": \"黑色\"}]', '2022-03-05 22:03:39', '2022-03-05 22:03:39');
INSERT INTO `by_product` VALUES (3, 2, '纯棉2021秋季新款宽松韩版圆领长袖破洞打底衫T恤女', '[\"https://s10.mogucdn.com/mlcdn/c45406/210814_53ehl040i03162ea2f4fhe75bh66b_640x960.jpg\", \"https://s10.mogucdn.com/mlcdn/c45406/210814_65f5da5e7ic1cf5g8ia35i61lihdb_640x960.jpg\", \"https://s11.mogucdn.com/mlcdn/c45406/210814_15jk8a1f4gc7976h89156eki068bk_640x960.jpg\", \"https://s10.mogucdn.com/mlcdn/c45406/210814_1b6dhdd53gf9710h3ejb1kl1k83jc_640x960.jpg\"]', 88.00, 38.00, 2, '[{\"key\": \"颜色\", \"value\": \"白色\"}, {\"key\": \"尺码\", \"value\": \"均码\"}]', '2022-03-05 22:03:39', '2022-03-05 22:03:39');
INSERT INTO `by_product` VALUES (4, 3, '夏季透气防臭男鞋潮流镂空网鞋男士运动休闲百搭薄款网面跑步潮鞋', '[\"https://s11.mogucdn.com/mlcdn/9620b1/220228_831hklgfh4fjdc73f35a1clk01e8i_750x1000.png\", \"https://s11.mogucdn.com/mlcdn/55cf19/210511_18d6i1aa1l375jb417ijfddjh2g36_640x960.jpg\", \"https://s10.mogucdn.com/mlcdn/55cf19/210511_2ckebk8j1le1k3k90ghi74dfe94k4_640x960.jpg\", \"https://s10.mogucdn.com/mlcdn/55cf19/210511_09d6ge0c9777feld2f23h3ch522gb_640x960.jpg\"]', 99.00, 59.00, 2, '[{\"key\": \"尺码\", \"value\": \"43\"}, {\"key\": \"颜色\", \"value\": \"白色\"}]', '2022-03-05 22:37:50', '2022-03-05 22:37:50');
INSERT INTO `by_product` VALUES (5, 3, '2021秋冬新款韩版宽松连帽时尚印花字母潮流加绒长袖T恤卫衣', '[\"https://s10.mogucdn.com/mlcdn/9620b1/220302_7517817jakhd28bd863ggc80h43f3_750x1000.png_750x1000.v1cAC.81.jpg\", \"https://s11.mogucdn.com/mlcdn/c45406/180831_5cgb8c1f370ad929fd5dk6i6adj48_640x960.jpg_750x1000.v1cAC.81.jpg\"]', 99.00, 59.50, 1, '[{\"key\": \"尺码\", \"value\": \"M\"}, {\"key\": \"颜色\", \"value\": \"黑色\"}]', '2022-03-05 22:37:50', '2022-03-05 22:37:50');
INSERT INTO `by_product` VALUES (6, 3, '纯棉2021秋季新款宽松韩版圆领长袖破洞打底衫T恤女', '[\"https://s10.mogucdn.com/mlcdn/c45406/210814_53ehl040i03162ea2f4fhe75bh66b_640x960.jpg\", \"https://s10.mogucdn.com/mlcdn/c45406/210814_65f5da5e7ic1cf5g8ia35i61lihdb_640x960.jpg\", \"https://s11.mogucdn.com/mlcdn/c45406/210814_15jk8a1f4gc7976h89156eki068bk_640x960.jpg\", \"https://s10.mogucdn.com/mlcdn/c45406/210814_1b6dhdd53gf9710h3ejb1kl1k83jc_640x960.jpg\"]', 88.00, 38.00, 3, '[{\"key\": \"颜色\", \"value\": \"白色\"}, {\"key\": \"尺码\", \"value\": \"均码\"}]', '2022-03-05 22:37:50', '2022-03-05 22:37:50');
INSERT INTO `by_product` VALUES (7, 4, '夏季透气防臭男鞋潮流镂空网鞋男士运动休闲百搭薄款网面跑步潮鞋', '[\"https://s11.mogucdn.com/mlcdn/9620b1/220228_831hklgfh4fjdc73f35a1clk01e8i_750x1000.png\", \"https://s11.mogucdn.com/mlcdn/55cf19/210511_18d6i1aa1l375jb417ijfddjh2g36_640x960.jpg\", \"https://s10.mogucdn.com/mlcdn/55cf19/210511_2ckebk8j1le1k3k90ghi74dfe94k4_640x960.jpg\", \"https://s10.mogucdn.com/mlcdn/55cf19/210511_09d6ge0c9777feld2f23h3ch522gb_640x960.jpg\"]', 99.00, 59.00, 1, '[{\"key\": \"尺码\", \"value\": \"43\"}, {\"key\": \"颜色\", \"value\": \"白色\"}]', '2022-03-05 23:03:59', '2022-03-05 23:03:59');
INSERT INTO `by_product` VALUES (8, 4, '2021秋冬新款韩版宽松连帽时尚印花字母潮流加绒长袖T恤卫衣', '[\"https://s10.mogucdn.com/mlcdn/9620b1/220302_7517817jakhd28bd863ggc80h43f3_750x1000.png_750x1000.v1cAC.81.jpg\", \"https://s11.mogucdn.com/mlcdn/c45406/180831_5cgb8c1f370ad929fd5dk6i6adj48_640x960.jpg_750x1000.v1cAC.81.jpg\"]', 99.00, 59.50, 3, '[{\"key\": \"尺码\", \"value\": \"M\"}, {\"key\": \"颜色\", \"value\": \"黑色\"}]', '2022-03-05 23:03:59', '2022-03-05 23:03:59');
INSERT INTO `by_product` VALUES (9, 4, '纯棉2021秋季新款宽松韩版圆领长袖破洞打底衫T恤女', '[\"https://s10.mogucdn.com/mlcdn/c45406/210814_53ehl040i03162ea2f4fhe75bh66b_640x960.jpg\", \"https://s10.mogucdn.com/mlcdn/c45406/210814_65f5da5e7ic1cf5g8ia35i61lihdb_640x960.jpg\", \"https://s11.mogucdn.com/mlcdn/c45406/210814_15jk8a1f4gc7976h89156eki068bk_640x960.jpg\", \"https://s10.mogucdn.com/mlcdn/c45406/210814_1b6dhdd53gf9710h3ejb1kl1k83jc_640x960.jpg\"]', 88.00, 38.00, 2, '[{\"key\": \"颜色\", \"value\": \"白色\"}, {\"key\": \"尺码\", \"value\": \"均码\"}]', '2022-03-05 23:03:59', '2022-03-05 23:03:59');
INSERT INTO `by_product` VALUES (10, 5, '夏季透气防臭男鞋潮流镂空网鞋男士运动休闲百搭薄款网面跑步潮鞋', '[\"https://s11.mogucdn.com/mlcdn/9620b1/220228_831hklgfh4fjdc73f35a1clk01e8i_750x1000.png\", \"https://s11.mogucdn.com/mlcdn/55cf19/210511_18d6i1aa1l375jb417ijfddjh2g36_640x960.jpg\", \"https://s10.mogucdn.com/mlcdn/55cf19/210511_2ckebk8j1le1k3k90ghi74dfe94k4_640x960.jpg\", \"https://s10.mogucdn.com/mlcdn/55cf19/210511_09d6ge0c9777feld2f23h3ch522gb_640x960.jpg\"]', 99.00, 59.00, 1, '[{\"key\": \"尺码\", \"value\": \"43\"}, {\"key\": \"颜色\", \"value\": \"白色\"}]', '2022-03-05 23:04:18', '2022-03-05 23:04:18');
INSERT INTO `by_product` VALUES (11, 5, '2021秋冬新款韩版宽松连帽时尚印花字母潮流加绒长袖T恤卫衣', '[\"https://s10.mogucdn.com/mlcdn/9620b1/220302_7517817jakhd28bd863ggc80h43f3_750x1000.png_750x1000.v1cAC.81.jpg\", \"https://s11.mogucdn.com/mlcdn/c45406/180831_5cgb8c1f370ad929fd5dk6i6adj48_640x960.jpg_750x1000.v1cAC.81.jpg\"]', 99.00, 59.50, 3, '[{\"key\": \"尺码\", \"value\": \"M\"}, {\"key\": \"颜色\", \"value\": \"黑色\"}]', '2022-03-05 23:04:18', '2022-03-05 23:04:18');
INSERT INTO `by_product` VALUES (12, 5, '纯棉2021秋季新款宽松韩版圆领长袖破洞打底衫T恤女', '[\"https://s10.mogucdn.com/mlcdn/c45406/210814_53ehl040i03162ea2f4fhe75bh66b_640x960.jpg\", \"https://s10.mogucdn.com/mlcdn/c45406/210814_65f5da5e7ic1cf5g8ia35i61lihdb_640x960.jpg\", \"https://s11.mogucdn.com/mlcdn/c45406/210814_15jk8a1f4gc7976h89156eki068bk_640x960.jpg\", \"https://s10.mogucdn.com/mlcdn/c45406/210814_1b6dhdd53gf9710h3ejb1kl1k83jc_640x960.jpg\"]', 88.00, 38.00, 2, '[{\"key\": \"颜色\", \"value\": \"白色\"}, {\"key\": \"尺码\", \"value\": \"均码\"}]', '2022-03-05 23:04:18', '2022-03-05 23:04:18');
INSERT INTO `by_product` VALUES (13, 6, '2021秋冬新款韩版宽松连帽时尚印花字母潮流加绒长袖T恤卫衣', '[\"https://s10.mogucdn.com/mlcdn/9620b1/220302_7517817jakhd28bd863ggc80h43f3_750x1000.png_750x1000.v1cAC.81.jpg\", \"https://s11.mogucdn.com/mlcdn/c45406/180831_5cgb8c1f370ad929fd5dk6i6adj48_640x960.jpg_750x1000.v1cAC.81.jpg\"]', 99.00, 59.50, 3, '[{\"key\": \"尺码\", \"value\": \"M\"}, {\"key\": \"颜色\", \"value\": \"黑色\"}]', '2022-03-05 23:05:07', '2022-03-05 23:05:07');
INSERT INTO `by_product` VALUES (14, 6, '夏季透气防臭男鞋潮流镂空网鞋男士运动休闲百搭薄款网面跑步潮鞋', '[\"https://s11.mogucdn.com/mlcdn/9620b1/220228_831hklgfh4fjdc73f35a1clk01e8i_750x1000.png\", \"https://s11.mogucdn.com/mlcdn/55cf19/210511_18d6i1aa1l375jb417ijfddjh2g36_640x960.jpg\", \"https://s10.mogucdn.com/mlcdn/55cf19/210511_2ckebk8j1le1k3k90ghi74dfe94k4_640x960.jpg\", \"https://s10.mogucdn.com/mlcdn/55cf19/210511_09d6ge0c9777feld2f23h3ch522gb_640x960.jpg\"]', 99.00, 59.00, 1, '[{\"key\": \"尺码\", \"value\": \"43\"}, {\"key\": \"颜色\", \"value\": \"白色\"}]', '2022-03-05 23:05:07', '2022-03-05 23:05:07');
INSERT INTO `by_product` VALUES (15, 6, '纯棉2021秋季新款宽松韩版圆领长袖破洞打底衫T恤女', '[\"https://s10.mogucdn.com/mlcdn/c45406/210814_53ehl040i03162ea2f4fhe75bh66b_640x960.jpg\", \"https://s10.mogucdn.com/mlcdn/c45406/210814_65f5da5e7ic1cf5g8ia35i61lihdb_640x960.jpg\", \"https://s11.mogucdn.com/mlcdn/c45406/210814_15jk8a1f4gc7976h89156eki068bk_640x960.jpg\", \"https://s10.mogucdn.com/mlcdn/c45406/210814_1b6dhdd53gf9710h3ejb1kl1k83jc_640x960.jpg\"]', 88.00, 38.00, 2, '[{\"key\": \"颜色\", \"value\": \"白色\"}, {\"key\": \"尺码\", \"value\": \"均码\"}]', '2022-03-05 23:05:07', '2022-03-05 23:05:07');
INSERT INTO `by_product` VALUES (16, 7, '夏季透气防臭男鞋潮流镂空网鞋男士运动休闲百搭薄款网面跑步潮鞋', '[\"https://s11.mogucdn.com/mlcdn/9620b1/220228_831hklgfh4fjdc73f35a1clk01e8i_750x1000.png\", \"https://s11.mogucdn.com/mlcdn/55cf19/210511_18d6i1aa1l375jb417ijfddjh2g36_640x960.jpg\", \"https://s10.mogucdn.com/mlcdn/55cf19/210511_2ckebk8j1le1k3k90ghi74dfe94k4_640x960.jpg\", \"https://s10.mogucdn.com/mlcdn/55cf19/210511_09d6ge0c9777feld2f23h3ch522gb_640x960.jpg\"]', 99.00, 59.00, 1, '[{\"key\": \"尺码\", \"value\": \"43\"}, {\"key\": \"颜色\", \"value\": \"白色\"}]', '2022-03-05 23:09:06', '2022-03-05 23:09:06');
INSERT INTO `by_product` VALUES (17, 7, '2021秋冬新款韩版宽松连帽时尚印花字母潮流加绒长袖T恤卫衣', '[\"https://s10.mogucdn.com/mlcdn/9620b1/220302_7517817jakhd28bd863ggc80h43f3_750x1000.png_750x1000.v1cAC.81.jpg\", \"https://s11.mogucdn.com/mlcdn/c45406/180831_5cgb8c1f370ad929fd5dk6i6adj48_640x960.jpg_750x1000.v1cAC.81.jpg\"]', 99.00, 59.50, 3, '[{\"key\": \"尺码\", \"value\": \"M\"}, {\"key\": \"颜色\", \"value\": \"黑色\"}]', '2022-03-05 23:09:06', '2022-03-05 23:09:06');
INSERT INTO `by_product` VALUES (18, 7, '纯棉2021秋季新款宽松韩版圆领长袖破洞打底衫T恤女', '[\"https://s10.mogucdn.com/mlcdn/c45406/210814_53ehl040i03162ea2f4fhe75bh66b_640x960.jpg\", \"https://s10.mogucdn.com/mlcdn/c45406/210814_65f5da5e7ic1cf5g8ia35i61lihdb_640x960.jpg\", \"https://s11.mogucdn.com/mlcdn/c45406/210814_15jk8a1f4gc7976h89156eki068bk_640x960.jpg\", \"https://s10.mogucdn.com/mlcdn/c45406/210814_1b6dhdd53gf9710h3ejb1kl1k83jc_640x960.jpg\"]', 88.00, 38.00, 2, '[{\"key\": \"颜色\", \"value\": \"白色\"}, {\"key\": \"尺码\", \"value\": \"均码\"}]', '2022-03-05 23:09:06', '2022-03-05 23:09:06');
INSERT INTO `by_product` VALUES (19, 8, '夏季透气防臭男鞋潮流镂空网鞋男士运动休闲百搭薄款网面跑步潮鞋', '[\"https://s11.mogucdn.com/mlcdn/9620b1/220228_831hklgfh4fjdc73f35a1clk01e8i_750x1000.png\", \"https://s11.mogucdn.com/mlcdn/55cf19/210511_18d6i1aa1l375jb417ijfddjh2g36_640x960.jpg\", \"https://s10.mogucdn.com/mlcdn/55cf19/210511_2ckebk8j1le1k3k90ghi74dfe94k4_640x960.jpg\", \"https://s10.mogucdn.com/mlcdn/55cf19/210511_09d6ge0c9777feld2f23h3ch522gb_640x960.jpg\"]', 99.00, 59.00, 1, '[{\"key\": \"尺码\", \"value\": \"43\"}, {\"key\": \"颜色\", \"value\": \"白色\"}]', '2022-03-05 23:10:24', '2022-03-05 23:10:24');
INSERT INTO `by_product` VALUES (20, 8, '2021秋冬新款韩版宽松连帽时尚印花字母潮流加绒长袖T恤卫衣', '[\"https://s10.mogucdn.com/mlcdn/9620b1/220302_7517817jakhd28bd863ggc80h43f3_750x1000.png_750x1000.v1cAC.81.jpg\", \"https://s11.mogucdn.com/mlcdn/c45406/180831_5cgb8c1f370ad929fd5dk6i6adj48_640x960.jpg_750x1000.v1cAC.81.jpg\"]', 99.00, 59.50, 3, '[{\"key\": \"尺码\", \"value\": \"M\"}, {\"key\": \"颜色\", \"value\": \"黑色\"}]', '2022-03-05 23:10:24', '2022-03-05 23:10:24');
INSERT INTO `by_product` VALUES (21, 8, '纯棉2021秋季新款宽松韩版圆领长袖破洞打底衫T恤女', '[\"https://s10.mogucdn.com/mlcdn/c45406/210814_53ehl040i03162ea2f4fhe75bh66b_640x960.jpg\", \"https://s10.mogucdn.com/mlcdn/c45406/210814_65f5da5e7ic1cf5g8ia35i61lihdb_640x960.jpg\", \"https://s11.mogucdn.com/mlcdn/c45406/210814_15jk8a1f4gc7976h89156eki068bk_640x960.jpg\", \"https://s10.mogucdn.com/mlcdn/c45406/210814_1b6dhdd53gf9710h3ejb1kl1k83jc_640x960.jpg\"]', 88.00, 38.00, 2, '[{\"key\": \"颜色\", \"value\": \"白色\"}, {\"key\": \"尺码\", \"value\": \"均码\"}]', '2022-03-05 23:10:24', '2022-03-05 23:10:24');
INSERT INTO `by_product` VALUES (22, 9, '夏季透气防臭男鞋潮流镂空网鞋男士运动休闲百搭薄款网面跑步潮鞋', '[\"https://s11.mogucdn.com/mlcdn/9620b1/220228_831hklgfh4fjdc73f35a1clk01e8i_750x1000.png\", \"https://s11.mogucdn.com/mlcdn/55cf19/210511_18d6i1aa1l375jb417ijfddjh2g36_640x960.jpg\", \"https://s10.mogucdn.com/mlcdn/55cf19/210511_2ckebk8j1le1k3k90ghi74dfe94k4_640x960.jpg\", \"https://s10.mogucdn.com/mlcdn/55cf19/210511_09d6ge0c9777feld2f23h3ch522gb_640x960.jpg\"]', 99.00, 59.00, 1, '[{\"key\": \"尺码\", \"value\": \"43\"}, {\"key\": \"颜色\", \"value\": \"白色\"}]', '2022-03-05 23:29:00', '2022-03-05 23:29:00');
INSERT INTO `by_product` VALUES (23, 9, '2021秋冬新款韩版宽松连帽时尚印花字母潮流加绒长袖T恤卫衣', '[\"https://s10.mogucdn.com/mlcdn/9620b1/220302_7517817jakhd28bd863ggc80h43f3_750x1000.png_750x1000.v1cAC.81.jpg\", \"https://s11.mogucdn.com/mlcdn/c45406/180831_5cgb8c1f370ad929fd5dk6i6adj48_640x960.jpg_750x1000.v1cAC.81.jpg\"]', 99.00, 59.50, 3, '[{\"key\": \"尺码\", \"value\": \"M\"}, {\"key\": \"颜色\", \"value\": \"黑色\"}]', '2022-03-05 23:29:00', '2022-03-05 23:29:00');
INSERT INTO `by_product` VALUES (24, 10, '2021秋冬新款韩版宽松连帽时尚印花字母潮流加绒长袖T恤卫衣', '[\"https://s10.mogucdn.com/mlcdn/9620b1/220302_7517817jakhd28bd863ggc80h43f3_750x1000.png_750x1000.v1cAC.81.jpg\", \"https://s11.mogucdn.com/mlcdn/c45406/180831_5cgb8c1f370ad929fd5dk6i6adj48_640x960.jpg_750x1000.v1cAC.81.jpg\"]', 99.00, 59.50, 3, '[{\"key\": \"尺码\", \"value\": \"M\"}, {\"key\": \"颜色\", \"value\": \"黑色\"}]', '2022-03-05 23:33:38', '2022-03-05 23:33:38');
INSERT INTO `by_product` VALUES (25, 10, '夏季透气防臭男鞋潮流镂空网鞋男士运动休闲百搭薄款网面跑步潮鞋', '[\"https://s11.mogucdn.com/mlcdn/9620b1/220228_831hklgfh4fjdc73f35a1clk01e8i_750x1000.png\", \"https://s11.mogucdn.com/mlcdn/55cf19/210511_18d6i1aa1l375jb417ijfddjh2g36_640x960.jpg\", \"https://s10.mogucdn.com/mlcdn/55cf19/210511_2ckebk8j1le1k3k90ghi74dfe94k4_640x960.jpg\", \"https://s10.mogucdn.com/mlcdn/55cf19/210511_09d6ge0c9777feld2f23h3ch522gb_640x960.jpg\"]', 99.00, 59.00, 1, '[{\"key\": \"尺码\", \"value\": \"43\"}, {\"key\": \"颜色\", \"value\": \"白色\"}]', '2022-03-05 23:33:38', '2022-03-05 23:33:38');
INSERT INTO `by_product` VALUES (26, 11, '夏季透气防臭男鞋潮流镂空网鞋男士运动休闲百搭薄款网面跑步潮鞋', '[\"https://s11.mogucdn.com/mlcdn/9620b1/220228_831hklgfh4fjdc73f35a1clk01e8i_750x1000.png\", \"https://s11.mogucdn.com/mlcdn/55cf19/210511_18d6i1aa1l375jb417ijfddjh2g36_640x960.jpg\", \"https://s10.mogucdn.com/mlcdn/55cf19/210511_2ckebk8j1le1k3k90ghi74dfe94k4_640x960.jpg\", \"https://s10.mogucdn.com/mlcdn/55cf19/210511_09d6ge0c9777feld2f23h3ch522gb_640x960.jpg\"]', 99.00, 59.00, 1, '[{\"key\": \"尺码\", \"value\": \"43\"}, {\"key\": \"颜色\", \"value\": \"白色\"}]', '2022-03-05 23:38:24', '2022-03-05 23:38:24');
INSERT INTO `by_product` VALUES (27, 12, '夏季透气防臭男鞋潮流镂空网鞋男士运动休闲百搭薄款网面跑步潮鞋', '[\"https://s11.mogucdn.com/mlcdn/9620b1/220228_831hklgfh4fjdc73f35a1clk01e8i_750x1000.png\", \"https://s11.mogucdn.com/mlcdn/55cf19/210511_18d6i1aa1l375jb417ijfddjh2g36_640x960.jpg\", \"https://s10.mogucdn.com/mlcdn/55cf19/210511_2ckebk8j1le1k3k90ghi74dfe94k4_640x960.jpg\", \"https://s10.mogucdn.com/mlcdn/55cf19/210511_09d6ge0c9777feld2f23h3ch522gb_640x960.jpg\"]', 99.00, 59.00, 1, '[{\"key\": \"尺码\", \"value\": \"43\"}, {\"key\": \"颜色\", \"value\": \"白色\"}]', '2022-03-05 23:38:34', '2022-03-05 23:38:34');
INSERT INTO `by_product` VALUES (28, 13, '夏季透气防臭男鞋潮流镂空网鞋男士运动休闲百搭薄款网面跑步潮鞋', '[\"https://s11.mogucdn.com/mlcdn/9620b1/220228_831hklgfh4fjdc73f35a1clk01e8i_750x1000.png\", \"https://s11.mogucdn.com/mlcdn/55cf19/210511_18d6i1aa1l375jb417ijfddjh2g36_640x960.jpg\", \"https://s10.mogucdn.com/mlcdn/55cf19/210511_2ckebk8j1le1k3k90ghi74dfe94k4_640x960.jpg\", \"https://s10.mogucdn.com/mlcdn/55cf19/210511_09d6ge0c9777feld2f23h3ch522gb_640x960.jpg\"]', 99.00, 59.00, 1, '[{\"key\": \"尺码\", \"value\": \"43\"}, {\"key\": \"颜色\", \"value\": \"白色\"}]', '2022-03-05 23:39:49', '2022-03-05 23:39:49');
INSERT INTO `by_product` VALUES (29, 14, '夏季透气防臭男鞋潮流镂空网鞋男士运动休闲百搭薄款网面跑步潮鞋', '[\"https://s11.mogucdn.com/mlcdn/9620b1/220228_831hklgfh4fjdc73f35a1clk01e8i_750x1000.png\", \"https://s11.mogucdn.com/mlcdn/55cf19/210511_18d6i1aa1l375jb417ijfddjh2g36_640x960.jpg\", \"https://s10.mogucdn.com/mlcdn/55cf19/210511_2ckebk8j1le1k3k90ghi74dfe94k4_640x960.jpg\", \"https://s10.mogucdn.com/mlcdn/55cf19/210511_09d6ge0c9777feld2f23h3ch522gb_640x960.jpg\"]', 99.00, 59.00, 1, '[{\"key\": \"尺码\", \"value\": \"43\"}, {\"key\": \"颜色\", \"value\": \"白色\"}]', '2022-03-05 23:41:54', '2022-03-05 23:41:54');
INSERT INTO `by_product` VALUES (30, 15, '夏季透气防臭男鞋潮流镂空网鞋男士运动休闲百搭薄款网面跑步潮鞋', '[\"https://s11.mogucdn.com/mlcdn/9620b1/220228_831hklgfh4fjdc73f35a1clk01e8i_750x1000.png\", \"https://s11.mogucdn.com/mlcdn/55cf19/210511_18d6i1aa1l375jb417ijfddjh2g36_640x960.jpg\", \"https://s10.mogucdn.com/mlcdn/55cf19/210511_2ckebk8j1le1k3k90ghi74dfe94k4_640x960.jpg\", \"https://s10.mogucdn.com/mlcdn/55cf19/210511_09d6ge0c9777feld2f23h3ch522gb_640x960.jpg\"]', 99.00, 59.00, 1, '[{\"key\": \"尺码\", \"value\": \"43\"}, {\"key\": \"颜色\", \"value\": \"白色\"}]', '2022-03-05 23:43:44', '2022-03-05 23:43:44');
INSERT INTO `by_product` VALUES (31, 16, '夏季透气防臭男鞋潮流镂空网鞋男士运动休闲百搭薄款网面跑步潮鞋', '[\"https://s11.mogucdn.com/mlcdn/9620b1/220228_831hklgfh4fjdc73f35a1clk01e8i_750x1000.png\", \"https://s11.mogucdn.com/mlcdn/55cf19/210511_18d6i1aa1l375jb417ijfddjh2g36_640x960.jpg\", \"https://s10.mogucdn.com/mlcdn/55cf19/210511_2ckebk8j1le1k3k90ghi74dfe94k4_640x960.jpg\", \"https://s10.mogucdn.com/mlcdn/55cf19/210511_09d6ge0c9777feld2f23h3ch522gb_640x960.jpg\"]', 99.00, 59.00, 1, '[{\"key\": \"尺码\", \"value\": \"43\"}, {\"key\": \"颜色\", \"value\": \"白色\"}]', '2022-03-05 23:44:25', '2022-03-05 23:44:25');
INSERT INTO `by_product` VALUES (32, 17, '夏季透气防臭男鞋潮流镂空网鞋男士运动休闲百搭薄款网面跑步潮鞋', '[\"https://s11.mogucdn.com/mlcdn/9620b1/220228_831hklgfh4fjdc73f35a1clk01e8i_750x1000.png\", \"https://s11.mogucdn.com/mlcdn/55cf19/210511_18d6i1aa1l375jb417ijfddjh2g36_640x960.jpg\", \"https://s10.mogucdn.com/mlcdn/55cf19/210511_2ckebk8j1le1k3k90ghi74dfe94k4_640x960.jpg\", \"https://s10.mogucdn.com/mlcdn/55cf19/210511_09d6ge0c9777feld2f23h3ch522gb_640x960.jpg\"]', 99.00, 59.00, 1, '[{\"key\": \"尺码\", \"value\": \"43\"}, {\"key\": \"颜色\", \"value\": \"白色\"}]', '2022-03-05 23:44:56', '2022-03-05 23:44:56');
INSERT INTO `by_product` VALUES (33, 18, '夏季透气防臭男鞋潮流镂空网鞋男士运动休闲百搭薄款网面跑步潮鞋', '[\"https://s11.mogucdn.com/mlcdn/9620b1/220228_831hklgfh4fjdc73f35a1clk01e8i_750x1000.png\", \"https://s11.mogucdn.com/mlcdn/55cf19/210511_18d6i1aa1l375jb417ijfddjh2g36_640x960.jpg\", \"https://s10.mogucdn.com/mlcdn/55cf19/210511_2ckebk8j1le1k3k90ghi74dfe94k4_640x960.jpg\", \"https://s10.mogucdn.com/mlcdn/55cf19/210511_09d6ge0c9777feld2f23h3ch522gb_640x960.jpg\"]', 99.00, 59.00, 1, '[{\"key\": \"尺码\", \"value\": \"43\"}, {\"key\": \"颜色\", \"value\": \"白色\"}]', '2022-03-05 23:45:53', '2022-03-05 23:45:53');
INSERT INTO `by_product` VALUES (34, 19, '夏季透气防臭男鞋潮流镂空网鞋男士运动休闲百搭薄款网面跑步潮鞋', '[\"https://s11.mogucdn.com/mlcdn/9620b1/220228_831hklgfh4fjdc73f35a1clk01e8i_750x1000.png\", \"https://s11.mogucdn.com/mlcdn/55cf19/210511_18d6i1aa1l375jb417ijfddjh2g36_640x960.jpg\", \"https://s10.mogucdn.com/mlcdn/55cf19/210511_2ckebk8j1le1k3k90ghi74dfe94k4_640x960.jpg\", \"https://s10.mogucdn.com/mlcdn/55cf19/210511_09d6ge0c9777feld2f23h3ch522gb_640x960.jpg\"]', 99.00, 59.00, 1, '[{\"key\": \"尺码\", \"value\": \"43\"}, {\"key\": \"颜色\", \"value\": \"白色\"}]', '2022-03-05 23:47:14', '2022-03-05 23:47:14');
INSERT INTO `by_product` VALUES (35, 20, '夏季透气防臭男鞋潮流镂空网鞋男士运动休闲百搭薄款网面跑步潮鞋', '[\"https://s11.mogucdn.com/mlcdn/9620b1/220228_831hklgfh4fjdc73f35a1clk01e8i_750x1000.png\", \"https://s11.mogucdn.com/mlcdn/55cf19/210511_18d6i1aa1l375jb417ijfddjh2g36_640x960.jpg\", \"https://s10.mogucdn.com/mlcdn/55cf19/210511_2ckebk8j1le1k3k90ghi74dfe94k4_640x960.jpg\", \"https://s10.mogucdn.com/mlcdn/55cf19/210511_09d6ge0c9777feld2f23h3ch522gb_640x960.jpg\"]', 99.00, 59.00, 1, '[{\"key\": \"尺码\", \"value\": \"43\"}, {\"key\": \"颜色\", \"value\": \"白色\"}]', '2022-03-05 23:47:47', '2022-03-05 23:47:47');
INSERT INTO `by_product` VALUES (36, 21, '夏季透气防臭男鞋潮流镂空网鞋男士运动休闲百搭薄款网面跑步潮鞋', '[\"https://s11.mogucdn.com/mlcdn/9620b1/220228_831hklgfh4fjdc73f35a1clk01e8i_750x1000.png\", \"https://s11.mogucdn.com/mlcdn/55cf19/210511_18d6i1aa1l375jb417ijfddjh2g36_640x960.jpg\", \"https://s10.mogucdn.com/mlcdn/55cf19/210511_2ckebk8j1le1k3k90ghi74dfe94k4_640x960.jpg\", \"https://s10.mogucdn.com/mlcdn/55cf19/210511_09d6ge0c9777feld2f23h3ch522gb_640x960.jpg\"]', 99.00, 59.00, 1, '[{\"key\": \"尺码\", \"value\": \"43\"}, {\"key\": \"颜色\", \"value\": \"白色\"}]', '2022-03-05 23:49:20', '2022-03-05 23:49:20');
INSERT INTO `by_product` VALUES (37, 22, '夏季透气防臭男鞋潮流镂空网鞋男士运动休闲百搭薄款网面跑步潮鞋', '[\"https://s11.mogucdn.com/mlcdn/9620b1/220228_831hklgfh4fjdc73f35a1clk01e8i_750x1000.png\", \"https://s11.mogucdn.com/mlcdn/55cf19/210511_18d6i1aa1l375jb417ijfddjh2g36_640x960.jpg\", \"https://s10.mogucdn.com/mlcdn/55cf19/210511_2ckebk8j1le1k3k90ghi74dfe94k4_640x960.jpg\", \"https://s10.mogucdn.com/mlcdn/55cf19/210511_09d6ge0c9777feld2f23h3ch522gb_640x960.jpg\"]', 99.00, 59.00, 1, '[{\"key\": \"尺码\", \"value\": \"43\"}, {\"key\": \"颜色\", \"value\": \"白色\"}]', '2022-03-05 23:49:56', '2022-03-05 23:49:56');
INSERT INTO `by_product` VALUES (38, 23, '2021秋冬新款韩版宽松连帽时尚印花字母潮流加绒长袖T恤卫衣', '[\"https://s10.mogucdn.com/mlcdn/9620b1/220302_7517817jakhd28bd863ggc80h43f3_750x1000.png_750x1000.v1cAC.81.jpg\", \"https://s11.mogucdn.com/mlcdn/c45406/180831_5cgb8c1f370ad929fd5dk6i6adj48_640x960.jpg_750x1000.v1cAC.81.jpg\"]', 99.00, 59.50, 3, '[{\"key\": \"尺码\", \"value\": \"M\"}, {\"key\": \"颜色\", \"value\": \"黑色\"}]', '2022-03-05 23:50:31', '2022-03-05 23:50:31');
INSERT INTO `by_product` VALUES (39, 23, '纯棉2021秋季新款宽松韩版圆领长袖破洞打底衫T恤女', '[\"https://s10.mogucdn.com/mlcdn/c45406/210814_53ehl040i03162ea2f4fhe75bh66b_640x960.jpg\", \"https://s10.mogucdn.com/mlcdn/c45406/210814_65f5da5e7ic1cf5g8ia35i61lihdb_640x960.jpg\", \"https://s11.mogucdn.com/mlcdn/c45406/210814_15jk8a1f4gc7976h89156eki068bk_640x960.jpg\", \"https://s10.mogucdn.com/mlcdn/c45406/210814_1b6dhdd53gf9710h3ejb1kl1k83jc_640x960.jpg\"]', 88.00, 38.00, 2, '[{\"key\": \"颜色\", \"value\": \"白色\"}, {\"key\": \"尺码\", \"value\": \"均码\"}]', '2022-03-05 23:50:31', '2022-03-05 23:50:31');
COMMIT;

-- ----------------------------
-- Table structure for categories
-- ----------------------------
DROP TABLE IF EXISTS `categories`;
CREATE TABLE `categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `super_id` int(11) DEFAULT '0' COMMENT '父id',
  `tag_id` int(11) DEFAULT '0' COMMENT 'tag_id',
  `picture` varchar(255) NOT NULL COMMENT '图片地址',
  `desc` varchar(255) DEFAULT NULL COMMENT '描述',
  `layer` int(11) DEFAULT '0' COMMENT '排序0',
  `status` tinyint(1) DEFAULT '0' COMMENT '状态是否使用',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of categories
-- ----------------------------
BEGIN;
INSERT INTO `categories` VALUES (1, '上衣', 0, 1, '', '', 0, 1, '2022-03-01 23:25:50', '2022-03-02 00:35:40');
INSERT INTO `categories` VALUES (3, '时装套装', 1, 0, '', '', 0, 1, '2022-03-02 00:40:54', '2022-03-02 00:40:54');
INSERT INTO `categories` VALUES (4, '卫衣', 1, 0, '', '', 0, 1, '2022-03-02 00:41:03', '2022-03-02 00:41:03');
INSERT INTO `categories` VALUES (5, '裙子', 0, 1, '', '', 0, 1, '2022-03-02 00:41:22', '2022-03-02 00:41:22');
INSERT INTO `categories` VALUES (6, '裤子', 0, 1, '', '', 0, 1, '2022-03-03 22:19:45', '2022-03-03 22:30:27');
INSERT INTO `categories` VALUES (7, '女鞋', 0, 2, '', '', 0, 1, '2022-03-03 22:19:53', '2022-03-03 22:30:32');
INSERT INTO `categories` VALUES (8, '男友', 0, 3, '', '', 0, 1, '2022-03-03 22:19:59', '2022-03-03 22:30:40');
INSERT INTO `categories` VALUES (9, '配饰', 0, 4, '', '', 0, 1, '2022-03-03 22:20:09', '2022-03-03 22:30:57');
INSERT INTO `categories` VALUES (10, '美妆', 0, 4, '', '', 0, 1, '2022-03-03 22:20:16', '2022-03-03 22:30:48');
INSERT INTO `categories` VALUES (11, '食品', 0, 0, '', '', 0, 1, '2022-03-03 22:20:33', '2022-03-03 22:20:33');
INSERT INTO `categories` VALUES (12, '图书', 0, 0, '', '', 0, 1, '2022-03-03 22:20:40', '2022-03-03 22:20:40');
INSERT INTO `categories` VALUES (14, '半身裙', 5, 0, '', '', 0, 1, '2022-03-03 22:21:34', '2022-03-03 22:21:34');
INSERT INTO `categories` VALUES (15, '连衣裙', 5, 0, '', '', 0, 1, '2022-03-03 22:21:49', '2022-03-03 22:21:49');
INSERT INTO `categories` VALUES (16, '美裙套装', 5, 0, '', '', 0, 1, '2022-03-03 22:22:01', '2022-03-03 22:22:01');
INSERT INTO `categories` VALUES (17, '牛仔裤', 6, 0, '', '', 0, 1, '2022-03-03 22:22:21', '2022-03-03 22:22:21');
INSERT INTO `categories` VALUES (18, '休闲裤', 6, 0, '', '', 0, 1, '2022-03-03 22:22:29', '2022-03-03 22:22:29');
INSERT INTO `categories` VALUES (19, '运动裤', 6, 0, '', '', 0, 1, '2022-03-03 22:22:37', '2022-03-03 22:22:37');
INSERT INTO `categories` VALUES (20, '单鞋', 7, 0, '', '', 0, 1, '2022-03-03 22:22:54', '2022-03-03 22:22:54');
INSERT INTO `categories` VALUES (21, '休闲运动', 7, 0, '', '', 0, 1, '2022-03-03 22:23:04', '2022-03-03 22:23:04');
INSERT INTO `categories` VALUES (22, 'T恤', 1, 0, '', '', 0, 1, '2022-03-03 22:23:25', '2022-03-03 22:23:25');
INSERT INTO `categories` VALUES (23, '靴子', 7, 0, '', '', 0, 1, '2022-03-03 22:24:17', '2022-03-03 22:24:17');
INSERT INTO `categories` VALUES (24, 'T恤', 8, 0, '', '', 0, 1, '2022-03-03 22:24:39', '2022-03-03 22:24:39');
INSERT INTO `categories` VALUES (25, '休闲裤', 8, 0, '', '', 0, 1, '2022-03-03 22:26:49', '2022-03-03 22:26:49');
INSERT INTO `categories` VALUES (26, '护肤套装', 10, 0, '', '', 0, 1, '2022-03-03 22:27:15', '2022-03-03 22:27:15');
INSERT INTO `categories` VALUES (27, '收纳整理', 10, 0, '', '', 0, 1, '2022-03-03 22:27:33', '2022-03-03 22:27:33');
INSERT INTO `categories` VALUES (28, '面膜', 10, 0, '', '', 0, 1, '2022-03-03 22:27:47', '2022-03-03 22:27:47');
INSERT INTO `categories` VALUES (29, '护唇膏', 10, 0, '', '', 0, 1, '2022-03-03 22:28:25', '2022-03-03 22:28:25');
INSERT INTO `categories` VALUES (30, '帽子', 9, 0, '', '', 0, 1, '2022-03-03 22:28:42', '2022-03-03 22:28:42');
INSERT INTO `categories` VALUES (31, '墨镜', 9, 0, '', '', 0, 1, '2022-03-03 22:28:52', '2022-03-03 22:28:52');
INSERT INTO `categories` VALUES (32, '眼睛框', 9, 0, '', '', 0, 1, '2022-03-03 22:29:06', '2022-03-03 22:29:06');
INSERT INTO `categories` VALUES (33, '电子书', 12, 0, '', '', 0, 1, '2022-03-03 22:29:19', '2022-03-03 22:29:19');
INSERT INTO `categories` VALUES (34, '计算机', 12, 0, '', '', 0, 1, '2022-03-03 22:29:32', '2022-03-03 22:29:32');
INSERT INTO `categories` VALUES (35, '心理学', 12, 0, '', '', 0, 1, '2022-03-03 22:29:40', '2022-03-03 22:29:40');
COMMIT;

-- ----------------------------
-- Table structure for good_tag
-- ----------------------------
DROP TABLE IF EXISTS `good_tag`;
CREATE TABLE `good_tag` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `status` tinyint(1) DEFAULT '0' COMMENT '状态是否使用',
  `created_at` datetime NOT NULL,
  `picture` varchar(255) NOT NULL DEFAULT '' COMMENT '图片地址',
  `is_home` tinyint(1) DEFAULT '0' COMMENT '是否首页展示',
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of good_tag
-- ----------------------------
BEGIN;
INSERT INTO `good_tag` VALUES (1, '女装', 1, '2022-03-02 00:30:37', 'https://s10.mogucdn.com/mlcdn/c45406/190507_0dkf3lb36d9k11h9ki2i6g63jhjji_690x1872.jpg_750x9999.v1c7E.81.webp', 1, '2022-03-02 00:30:37');
INSERT INTO `good_tag` VALUES (2, '女鞋&包包', 1, '2022-03-02 00:31:15', 'https://s10.mogucdn.com/mlcdn/c45406/181031_2615dkk1cjbjei96ai87jlf725da9_690x1665.jpg_750x9999.v1c7E.81.webp', 1, '2022-03-02 00:31:15');
INSERT INTO `good_tag` VALUES (3, '男装&男鞋', 1, '2022-03-02 00:32:34', 'https://s10.mogucdn.com/mlcdn/c45406/190315_2kkha5968jbe4b2flbk90lg8ajebi_690x1872.jpg_750x9999.v1c7E.81.webp', 1, '2022-03-02 00:32:34');
INSERT INTO `good_tag` VALUES (4, '家纺&家饰', 1, '2022-03-02 00:35:19', 'https://s10.mogucdn.com/mlcdn/c45406/180516_11i31d9gh7dc4e8bi33g98e6ibbkb_690x1665.jpg_750x9999.v1c7E.81.webp', 1, '2022-03-02 00:35:19');
COMMIT;

-- ----------------------------
-- Table structure for good_user
-- ----------------------------
DROP TABLE IF EXISTS `good_user`;
CREATE TABLE `good_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) DEFAULT NULL COMMENT '管理员密码',
  `email` varchar(255) DEFAULT NULL,
  `iphone` varchar(255) DEFAULT NULL,
  `sex` varchar(255) DEFAULT '保密',
  `status` tinyint(1) DEFAULT '0' COMMENT '状态是否使用',
  `desc` text,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of good_user
-- ----------------------------
BEGIN;
INSERT INTO `good_user` VALUES (1, '小明', NULL, NULL, '15607195236', '保密', 1, '', '2022-03-02 00:24:11', '2022-03-02 00:26:16');
INSERT INTO `good_user` VALUES (2, '小米', NULL, NULL, '123456', '保密', 1, '', '2022-03-05 12:59:01', '2022-03-05 23:50:59');
COMMIT;

-- ----------------------------
-- Table structure for goods
-- ----------------------------
DROP TABLE IF EXISTS `goods`;
CREATE TABLE `goods` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL COMMENT '商品名字',
  `desc` varchar(255) DEFAULT NULL COMMENT '商品描述',
  `picture` json NOT NULL COMMENT '图片',
  `cate_id` int(11) DEFAULT '0' COMMENT '分类',
  `brand_id` int(11) DEFAULT '0' COMMENT '品牌id',
  `status` tinyint(1) DEFAULT '0' COMMENT '状态是否使用',
  `sales` int(11) DEFAULT '0' COMMENT '销量',
  `browse` int(11) DEFAULT '0' COMMENT '浏览量',
  `is_type_explain` int(11) DEFAULT '1' COMMENT '什么类型商品介绍',
  `particulars` text COMMENT '商品详情',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `part_info` json DEFAULT NULL COMMENT '商品详情json格式',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of goods
-- ----------------------------
BEGIN;
INSERT INTO `goods` VALUES (1, '西装套装女小个子2021春季韩版甜美学生外套格子百褶裙两件套', '西装套装女小个子2021春季韩版甜美学生外套格子百褶裙两件套', '[\"https://s5.mogucdn.com/mlcdn/c45406/210127_0bc7bjl5b669jeh35ed4i5i0k5k1a_640x800.jpg_750x1000.v1cAC.81.jpg\"]', 3, 0, 1, 0, 1, 1, '', '2022-03-02 00:48:23', '2022-03-06 01:43:25', NULL);
INSERT INTO `goods` VALUES (2, '2021秋冬新款韩版宽松连帽时尚印花字母潮流加绒长袖T恤卫衣', '2021秋冬新款韩版宽松连帽时尚印花字母潮流加绒长袖T恤卫衣', '[\"https://s10.mogucdn.com/mlcdn/9620b1/220302_7517817jakhd28bd863ggc80h43f3_750x1000.png_750x1000.v1cAC.81.jpg\", \"https://s11.mogucdn.com/mlcdn/c45406/180831_5cgb8c1f370ad929fd5dk6i6adj48_640x960.jpg_750x1000.v1cAC.81.jpg\"]', 4, 0, 1, 0, 3, 1, '', '2022-03-03 22:54:04', '2022-03-06 01:42:37', NULL);
INSERT INTO `goods` VALUES (3, '黑童话法式海军领黑色连衣裙夏季泡泡袖西装裙子女', '黑童话法式海军领黑色连衣裙夏季泡泡袖西装裙子女\n', '[\"https://s11.mogucdn.com/mlcdn/9620b1/220225_4jch1k5hfi0f47ia7dj9ec8hca5jh_750x1000.png_750x1000.v1cAC.81.jpg\", \"https://s11.mogucdn.com/mlcdn/c45406/210717_841457fhhlhi7gl16h6il923gaia4_640x960.jpg_750x1000.v1cAC.81.jpg\", \"https://s10.mogucdn.com/mlcdn/c45406/210717_2c7ka2ci501e35bh5cj5h57cc591l_640x960.jpg\", \"https://s10.mogucdn.com/mlcdn/55cf19/210717_6ldk2d63il7elf947f5bhhildk8ae_640x960.jpg\"]', 15, 0, 1, 0, 0, 1, '', '2022-03-03 22:57:54', '2022-03-03 23:07:24', NULL);
INSERT INTO `goods` VALUES (4, '百褶蕾丝网纱裙女韩版甜美夏A字中长款半身裙高腰松紧大裙摆长裙', '百褶蕾丝网纱裙女韩版甜美夏A字中长款半身裙高腰松紧大裙摆长裙', '[\"https://s11.mogucdn.com/mlcdn/9620b1/220224_133f7i2alkckfb8dif2656ai4i90h_750x1000.png\"]', 14, 0, 1, 0, 0, 1, '<!DOCTYPE html>\n<html>\n<head>\n</head>\n<body>\n<p><img src=\"https://s11.mogucdn.com/mlcdn/c45406/200516_35d90fifbi995k6eh7k864l48c1lg_700x400.jpg\" alt=\"\" width=\"700\" height=\"400\" /><img src=\"https://s3.mogucdn.com/mlcdn/c45406/200516_7eek9407kfcd3628h3ch5ak4ab41e_750x433.jpg\" alt=\"\" width=\"750\" height=\"433\" /><img src=\"https://s11.mogucdn.com/mlcdn/c45406/200516_2hblkh2kkidlkl22e319ld1df10e2_640x762.jpg\" alt=\"\" width=\"640\" height=\"762\" /><img src=\"https://s3.mogucdn.com/mlcdn/c45406/200516_4l1eka78ke1l4if48cablli6623dk_697x551.jpg\" alt=\"\" width=\"697\" height=\"551\" /><img src=\"https://s3.mogucdn.com/mlcdn/c45406/200516_3elc336ff7bf96f6e459la9chf905_750x1452.jpg\" alt=\"\" width=\"395\" height=\"764\" /><img src=\"https://s10.mogucdn.com/mlcdn/c45406/200516_4a3j1097e92agfc8708a46hbjig12_750x1132.jpg\" alt=\"\" width=\"506\" height=\"764\" /><img src=\"https://s3.mogucdn.com/mlcdn/c45406/200516_6f1c41gb10ca0cdgb4f4gh0272f8g_780x1500.jpg\" alt=\"\" width=\"398\" height=\"764\" /><img src=\"https://s11.mogucdn.com/mlcdn/c45406/200516_344a86kll0kajj18iijfgdc2a6g83_780x1500.jpg\" /><img src=\"https://s3.mogucdn.com/mlcdn/c45406/200516_5j6207ekk7j4b9be84k12fj5kee6f_780x1500.jpg\" /><img src=\"https://s10.mogucdn.com/mlcdn/c45406/200516_1edgfjkh41ce3h74c1ah880k0kk7k_790x1367.jpg\" /><img src=\"https://s3.mogucdn.com/mlcdn/c45406/200516_6jl2a6514dgafi3bk19066b8d63ij_780x1500.jpg\" /><img src=\"https://s11.mogucdn.com/mlcdn/c45406/200516_6ll89f6jcelllid411k297iiddh2h_762x1500.jpg\" /><img src=\"https://s11.mogucdn.com/mlcdn/c45406/200516_79hi3gic889092a227j1l044jhiae_762x1500.jpg\" /><img src=\"https://s3.mogucdn.com/mlcdn/c45406/200516_1hhkdc0b2lcdlgj6084gf7hf4hk74_790x1478.jpg\" /><img src=\"https://s11.mogucdn.com/mlcdn/c45406/200516_5a14ccgbecfc211c71dh92f1ckjki_750x1500.jpg\" /></p>\n</body>\n</html>', '2022-03-03 23:17:46', '2022-03-03 23:18:00', NULL);
INSERT INTO `goods` VALUES (5, '金丝绒阔腿短裤女高腰a字潮i休闲靴裤+百搭打底针织衫套装', '金丝绒阔腿短裤女高腰a字潮i休闲靴裤+百搭打底针织衫套装', '[\"https://s11.mogucdn.com/mlcdn/9620b1/220225_16h864c6e8dcl14045daaedel205a_750x1000.png\", \"https://s10.mogucdn.com/mlcdn/55cf19/201018_8b17i4i6490efbigai245ia665h9b_640x960.jpg\", \"https://s10.mogucdn.com/mlcdn/55cf19/201018_733al8hgi04lchk1l1lhb9bh9ligi_640x960.jpg\", \"https://s3.mogucdn.com/mlcdn/55cf19/201018_5l35lf3j5g10ci221542cgkeid77d_640x960.jpg\"]', 18, 0, 1, 0, 0, 1, '<!DOCTYPE html>\n<html>\n<head>\n</head>\n<body>\n<p><img src=\"https://s11.mogucdn.com/mlcdn/55cf19/201018_45l9ggaf0j0d2jd3ic4l5jiajcjbi_803x1041.jpg\" alt=\"\" /><img src=\"https://s11.mogucdn.com/mlcdn/55cf19/201018_7kkhcdj8a8i3dfla31dj6g7h99gjh_803x961.jpg\" alt=\"\" width=\"639\" height=\"764\" /><img src=\"https://s11.mogucdn.com/mlcdn/55cf19/201018_40c6li160e59431iaakbkf1j77kll_803x965.jpg\" alt=\"\" width=\"636\" height=\"764\" /><img src=\"https://s10.mogucdn.com/mlcdn/55cf19/201018_16eci4f04fi16j994i6jl862dl0cj_803x1013.jpg\" alt=\"\" /><img src=\"https://s11.mogucdn.com/mlcdn/55cf19/201018_1jahag6k27067ag9ch775gieki5bk_803x1249.jpg\" alt=\"\" /><img src=\"https://s11.mogucdn.com/mlcdn/55cf19/201018_7lef7dc3f4j7a160efib5eied46j7_803x897.jpg\" alt=\"\" width=\"684\" height=\"764\" /><img src=\"https://s11.mogucdn.com/mlcdn/55cf19/201018_825ehb5ckfjh891jdf2aikk1kb41j_803x1068.jpg\" alt=\"\" /><img src=\"https://s10.mogucdn.com/mlcdn/55cf19/201018_788kcf963h73acki98383kl563fda_803x1281.jpg\" alt=\"\" /><img src=\"https://s3.mogucdn.com/mlcdn/55cf19/201018_3d5i554009c394a6453efig27e2j2_803x1297.jpg\" alt=\"\" /><img src=\"https://s11.mogucdn.com/mlcdn/55cf19/201018_406abgha2ka5k8gajij549bd0l8l7_803x1175.jpg\" alt=\"\" /><img src=\"https://s11.mogucdn.com/mlcdn/55cf19/201018_78jd2f5f60c2dg75e9hc5e6h8ffgc_803x1164.jpg\" alt=\"\" /><br /><img src=\"https://s11.mogucdn.com/mlcdn/55cf19/201018_1gflc8cgj4lbj0a06141djch8flfh_803x930.jpg\" alt=\"\" /><img src=\"https://s11.mogucdn.com/mlcdn/55cf19/201018_4580l99elk9ag07kl64706e27eggh_803x1113.jpg\" alt=\"\" /><img src=\"https://s11.mogucdn.com/mlcdn/55cf19/201018_4e12jbjhh31l7e69a2kcegi0c0ji4_803x1140.jpg\" /><img src=\"https://s10.mogucdn.com/mlcdn/55cf19/201018_1id05169ic24ff1hdkick23cj305e_803x1151.jpg\" /><img src=\"https://s11.mogucdn.com/mlcdn/c45406/201018_41h9e8h6950dba0e666i8d36a229c_750x773.jpg\" /><img src=\"https://s10.mogucdn.com/mlcdn/c45406/201018_07jkhf6d3dcalea0690l60hkj4ale_750x796.jpg\" /><img src=\"https://s3.mogucdn.com/mlcdn/c45406/201018_4l08idd48chibga6he09ffd7ibg8b_750x777.jpg\" /><img src=\"https://s11.mogucdn.com/mlcdn/c45406/201018_1l92deb62a5bgeib745bk5ga9jfc9_750x774.jpg\" /><img src=\"https://s3.mogucdn.com/mlcdn/c45406/201018_0jeg5806g40fd8hi19bjkd2l1gbg3_750x811.jpg\" /><img src=\"https://s3.mogucdn.com/mlcdn/c45406/201018_549f6230kcjk3g0h90655964k74df_750x928.jpg\" /><img src=\"https://s11.mogucdn.com/mlcdn/c45406/201018_003hg6cfe6f05a5bh6fb5866fi7kc_750x778.jpg\" /><img src=\"https://s10.mogucdn.com/mlcdn/c45406/201018_0cil0h4440330e42l3874h9b9h0j0_750x792.jpg\" /><img src=\"https://s3.mogucdn.com/mlcdn/c45406/201018_6aag1i2fk8a5lb444i9f9ikj70c87_741x474.png\" /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /></p>\n</body>\n</html>', '2022-03-04 00:02:45', '2022-03-04 00:04:30', NULL);
INSERT INTO `goods` VALUES (6, '小白鞋女2021春夏新款韩版百搭学生帆布鞋港风平底休闲鞋', '小白鞋女2021春夏新款韩版百搭学生帆布鞋港风平底休闲鞋', '[\"https://s3.mogucdn.com/mlcdn/c45406/210308_6974a5aj5e233eia525k208g817fj_640x960.jpg\", \"https://s3.mogucdn.com/mlcdn/c45406/210308_19cj8beik77e8ch303cbficlla3lj_640x960.jpg\", \"https://s3.mogucdn.com/mlcdn/c45406/210308_1gki1l545jljch7b2bkfdic6jkj9h_640x960.jpg\", \"https://s3.mogucdn.com/mlcdn/c45406/210308_4dkdcgie39h5jhjlef6001939kib8_640x960.jpg\", \"https://s11.mogucdn.com/mlcdn/c45406/210308_71dg7ga0fe11kj926ghi926kbhb74_640x960.jpg\", \"https://s11.mogucdn.com/mlcdn/c45406/210308_1aia412bbe012a27d58gb28c50576_640x960.jpg\"]', 21, 0, 1, 0, 0, 1, '', '2022-03-05 12:58:49', '2022-03-05 12:58:49', '{\"detailSet\": {\"图案\": \"色块\", \"季节\": \"春季\", \"尺码\": \"35 偏小半码,37 偏小半码,38 偏小半码,36 偏小半码,39 偏小半码,40 偏小半码\", \"帮高\": \"低帮\", \"跟高\": \"平跟（小于等于1CM）\", \"颜色\": \"黑色,白色\", \"风格\": \"男友风\", \"内里材质\": \"其他材质\", \"帮面材质\": \"人造革\", \"开口深度\": \"中口（7-11cm）\", \"流行元素\": \"绑带（系带)\", \"闭合方式\": \"系带\", \"鞋头形状\": \"圆头\", \"鞋底形状\": \"平跟（无跟）\", \"鞋底材质\": \"橡胶底\", \"鞋面材质\": \"其他材质\", \"鞋面特殊工艺效果\": \"擦色\"}, \"detailImage\": [\"https://s3.mogucdn.com/mlcdn/c45406/210308_44hg78ikbbhg0b22b2ifak3i90dle_750x170.jpg\", \"https://s11.mogucdn.com/mlcdn/c45406/210308_3jj4k20cj36894d2h3ebd6e460d68_750x916.jpg\", \"https://s3.mogucdn.com/mlcdn/c45406/210308_4gai4gee9i3ad05e070e82aeeg87a_750x1166.jpg\", \"https://s11.mogucdn.com/mlcdn/c45406/210308_53lcg80bg4170bc7hflj83cd0e3l6_750x952.jpg\", \"https://s11.mogucdn.com/mlcdn/c45406/210308_3eefg59fa1lb9f05l4b9kkjj4h3cf_728x1200.jpg\", \"https://s10.mogucdn.com/mlcdn/c45406/210308_01e2jkdc5i09jh5jbbjhkje1eabcd_684x1200.jpg\", \"https://s11.mogucdn.com/mlcdn/c45406/210308_110dj6lci63hjl1e30669d9g0i5bh_750x916.jpg\", \"https://s3.mogucdn.com/mlcdn/c45406/210308_4h85cjc3l05f252hkc1b02fl85j4k_750x824.jpg\", \"https://s11.mogucdn.com/mlcdn/c45406/210308_5df4i09bf458147dklh3lcjlc2jef_750x690.jpg\", \"https://s10.mogucdn.com/mlcdn/c45406/210308_3503832ideb3l8c3192bcjdbf64jf_750x1002.jpg\", \"https://s10.mogucdn.com/mlcdn/c45406/210308_42e4k4j8hjjecg5300cid1bibae3j_750x828.jpg\", \"https://s11.mogucdn.com/mlcdn/c45406/210308_3b4211j010f4kh7bib706k0f0dg4h_640x960.jpg\", \"https://s11.mogucdn.com/mlcdn/c45406/210308_6f180h4e3ebd6k4a4k6hbgl20ad0k_642x1200.jpg\", \"https://s3.mogucdn.com/mlcdn/c45406/210308_46i6f9a405ec045iel7d2cb6ej10l_750x726.jpg\", \"https://s3.mogucdn.com/mlcdn/c45406/210308_1cid9c68j2jabcf882b0dh208bkd6_730x1198.jpg\", \"https://s3.mogucdn.com/p2/170317/77101615_6f3ak83kkl00329ged9249aa93ifb_1125x285.jpg\"]}');
INSERT INTO `goods` VALUES (7, '双面德绒半高领条纹打底衫女加厚t恤早春木耳边百搭上衣修身显瘦', '双面德绒半高领条纹打底衫女加厚t恤早春木耳边百搭上衣修身显瘦', '[\"https://s11.mogucdn.com/mlcdn/9620b1/220224_87kbdfli6e8bfk730jg1kldecha82_750x1000.png\", \"https://s11.mogucdn.com/mlcdn/c45406/211229_56jk1g2agfj28hf9868379d46e19l_640x853.jpg\", \"https://s10.mogucdn.com/mlcdn/c45406/211229_489fef73fd5k06flihb4e0beei59i_640x853.jpg\", \"https://s3.mogucdn.com/mlcdn/c45406/211229_5k9d17bhjdb23f44gkk42agbfbiga_640x853.jpg\", \"https://s3.mogucdn.com/mlcdn/c45406/211229_4fkckld6l0e4697ccdahb877ef85k_640x853.jpg\"]', 22, 0, 1, 0, 0, 1, '', '2022-03-05 13:31:47', '2022-03-05 13:31:47', '{\"detailSet\": {\"图案\": \"条纹\", \"季节\": \"春季\", \"尺码\": \"L【建议100-115斤】,M【建议100斤内】,2XL【建议130-140斤】,XL【建议115-130斤】\", \"材质\": \"聚酯纤维\", \"潮流\": \"韩系\", \"版型\": \"修身\", \"衣长\": \"常规款（51-65cm）\", \"袖型\": \"常规袖\", \"袖长\": \"长袖\", \"领型\": \"半高领\", \"颜色\": \"黑色,灰蓝色,白色,杏色,咖啡色\", \"风格\": \"通勤（OL）\", \"上衣厚度\": \"适中\"}, \"detailImage\": [\"https://s11.mogucdn.com/mlcdn/c45406/211229_6gci37b7d01l5l9i0l03b3dei6ii8_750x1237.jpg\", \"https://s11.mogucdn.com/mlcdn/c45406/211229_1kaghhe86k21ckb69h1l5b67gj65b_750x1197.jpg\", \"https://s10.mogucdn.com/mlcdn/c45406/211229_07hj50ljc32a8d0dj1d7h65f12f91_750x907.jpg\", \"https://s11.mogucdn.com/mlcdn/c45406/211229_7iijkkh0549jchkb6j0b4h4k9g5c5_750x830.jpg\", \"https://s11.mogucdn.com/mlcdn/c45406/211229_0372jhehi750570676fad0b9gl673_750x830.jpg\", \"https://s3.mogucdn.com/mlcdn/c45406/211229_603ek20jei4k34ja9de7800cf1ch9_750x959.jpg\", \"https://s11.mogucdn.com/mlcdn/c45406/211229_1iil6e2ijdi80k9if8bjj6691j6ld_750x959.jpg\", \"https://s3.mogucdn.com/mlcdn/c45406/211229_20107k36ei13iaid9l9d681fj45ae_750x923.jpg\", \"https://s11.mogucdn.com/mlcdn/c45406/211229_7l1f3jb1g373f79f73ckg8e4b52ga_750x1053.jpg\", \"https://s10.mogucdn.com/mlcdn/c45406/211229_69f195ige10ibk29dk4il57bgk2l5_750x1137.jpg\", \"https://s10.mogucdn.com/mlcdn/c45406/211229_1fa17gf9f1gfak7h6h9dk005f83kh_750x1183.jpg\", \"https://s11.mogucdn.com/mlcdn/c45406/211229_8ghd1fdglh1cg4c741jll44ca6dg7_750x1237.jpg\", \"https://s11.mogucdn.com/mlcdn/c45406/211229_472jai352gcbgjh0lic591igk961c_750x1197.jpg\", \"https://s3.mogucdn.com/mlcdn/c45406/211229_61d4a85c5j0l7l4h81048aaffilii_750x959.jpg\", \"https://s10.mogucdn.com/mlcdn/c45406/211229_8b16gd950a980fkal0h07j3edc20l_750x959.jpg\", \"https://s10.mogucdn.com/mlcdn/c45406/211229_8b5fd6li4jghi84ci98i2599e04kg_750x1017.jpg\", \"https://s3.mogucdn.com/mlcdn/c45406/211229_550jk45d0k30hb9c0l48ijikd1ehl_750x1017.jpg\", \"https://s3.mogucdn.com/mlcdn/c45406/211229_1k41kbd1lf6cek57gl98a673je62e_750x907.jpg\", \"https://s3.mogucdn.com/p2/170317/77101615_6f3ak83kkl00329ged9249aa93ifb_1125x285.jpg\"]}');
INSERT INTO `goods` VALUES (8, '纯棉2021秋季新款宽松韩版圆领长袖破洞打底衫T恤女', '纯棉2021秋季新款宽松韩版圆领长袖破洞打底衫T恤女', '[\"https://s10.mogucdn.com/mlcdn/c45406/210814_53ehl040i03162ea2f4fhe75bh66b_640x960.jpg\", \"https://s10.mogucdn.com/mlcdn/c45406/210814_65f5da5e7ic1cf5g8ia35i61lihdb_640x960.jpg\", \"https://s11.mogucdn.com/mlcdn/c45406/210814_15jk8a1f4gc7976h89156eki068bk_640x960.jpg\", \"https://s10.mogucdn.com/mlcdn/c45406/210814_1b6dhdd53gf9710h3ejb1kl1k83jc_640x960.jpg\"]', 22, 0, 1, 0, 0, 1, '', '2022-03-05 13:37:49', '2022-03-05 13:37:49', '{\"detailSet\": {\"下摆\": \"敞口\", \"图案\": \"卡通动漫\", \"季节\": \"秋季\", \"尺码\": \"均码\", \"材质\": \"棉\", \"潮流\": \"韩系\", \"版型\": \"直身\", \"衣长\": \"常规款（51-65cm）\", \"袖型\": \"常规袖\", \"袖长\": \"长袖\", \"领型\": \"圆领\", \"颜色\": \"彩色小熊,黑色字母,白色小熊,黑色饮料,白色字母小熊,白色饮料,白色南瓜,白色字母\", \"风格\": \"简约\", \"上衣厚度\": \"适中\"}, \"detailImage\": [\"https://s10.mogucdn.com/mlcdn/55cf19/210814_86a4f9f57jj2ifica3l7792gf8e76_1080x465.jpg\", \"https://s3.mogucdn.com/mlcdn/55cf19/210814_3b363cb35e1gcd8781752kjeic1ic_750x917.jpg\", \"https://s10.mogucdn.com/mlcdn/55cf19/210814_259j11ij8ka81jbe948llaklcdalc_750x1067.jpg\", \"https://s11.mogucdn.com/mlcdn/55cf19/210814_6l73d9gcc3ga0l4cd97g5d4jd48b6_750x1004.jpg\", \"https://s11.mogucdn.com/mlcdn/55cf19/210814_230k33al56bc32f514akbk8k45lf4_750x890.jpg\", \"https://s11.mogucdn.com/mlcdn/55cf19/210814_8f8abk83dah3j66afdflcbiff41k7_750x873.jpg\", \"https://s11.mogucdn.com/mlcdn/c45406/210814_21acbb8a087b7d768b933eji1eb8e_750x780.jpg\", \"https://s11.mogucdn.com/mlcdn/c45406/210814_8aaefi6d381aklh570i9ad2ef1djg_750x789.jpg\", \"https://s11.mogucdn.com/mlcdn/c45406/210814_4jfd2f22b1c61lcfle8339hfbk292_750x792.jpg\", \"https://s10.mogucdn.com/mlcdn/c45406/210814_023hbi5a62k7h633dji2867blb7gf_750x798.jpg\", \"https://s10.mogucdn.com/mlcdn/c45406/210814_5bh2chig93j8cd14j848ljcl2184f_750x780.jpg\", \"https://s3.mogucdn.com/mlcdn/c45406/210814_3ca7ehd113424192a97h0gj4bl944_790x790.jpg\", \"https://s11.mogucdn.com/mlcdn/c45406/210814_4g23ad12d9lj3jbh63b5k7ch9je80_790x790.jpg\", \"https://s11.mogucdn.com/mlcdn/c45406/210814_3kkb5f4l491ibie0lj5i7i2459108_790x790.jpg\", \"https://s10.mogucdn.com/mlcdn/c45406/210814_57b10d2d6c6c8clegi1jegi58d8bi_790x790.jpg\", \"https://s11.mogucdn.com/mlcdn/c45406/210814_45e6ja4c85ahajd9f1i3496ek3468_790x790.jpg\", \"https://s3.mogucdn.com/mlcdn/c45406/210814_441e9l6k8a364c05afbg455fc7h2a_790x790.jpg\", \"https://s10.mogucdn.com/mlcdn/c45406/210814_1cj37f0gjgh3c18iga36f99dc4k4a_790x790.jpg\", \"https://s5.mogucdn.com/mlcdn/c45406/210814_4dg7dll5k00k0gkakg5470799g99k_790x790.jpg\", \"https://s10.mogucdn.com/mlcdn/c45406/210814_75cck2kk68gc8768553966h06c2a4_790x790.jpg\", \"https://s11.mogucdn.com/mlcdn/c45406/210814_2a7ahkc4ib4kj3il123859a0f0e86_790x938.jpg\", \"https://s10.mogucdn.com/mlcdn/c45406/210814_4a46e1llj9025fdbc743gj0ah5l19_790x941.jpg\", \"https://s3.mogucdn.com/mlcdn/c45406/210814_5hdhl84e3a13h32dg9g8575a4bb73_790x864.jpg\", \"https://s10.mogucdn.com/mlcdn/c45406/210814_46hfddg0f33gji48de9j10aa63647_790x938.jpg\", \"https://s11.mogucdn.com/mlcdn/c45406/210814_461f8k29ab11k63l27chaj514dal0_790x1000.jpg\", \"https://s10.mogucdn.com/mlcdn/c45406/210814_217ak8dbeh6a47ek310c71ig4i80h_790x922.jpg\", \"https://s10.mogucdn.com/mlcdn/c45406/210814_15bb56fl57bie3f892j7eidl288b5_790x912.jpg\", \"https://s3.mogucdn.com/mlcdn/c45406/210814_05j0kgb9l6b9d6kgl43jhi25fh9lf_750x961.jpg\", \"https://s10.mogucdn.com/mlcdn/c45406/210814_79g814f521300bld754kh0203il83_800x800.jpg\", \"https://s3.mogucdn.com/mlcdn/c45406/210814_25j43325hhlhj0hk133da2lh52h55_750x951.jpg\", \"https://s11.mogucdn.com/mlcdn/c45406/210814_4ch85baba7jhlf00hdcgb64g7k45d_750x772.jpg\", \"https://s11.mogucdn.com/mlcdn/c45406/210814_4jk71dbl68k5g9k65la41b9alackg_750x871.jpg\", \"https://s3.mogucdn.com/mlcdn/c45406/210814_33diglef7fd8ik2bajc2dg6d5kcik_790x790.jpg\", \"https://s11.mogucdn.com/mlcdn/c45406/210814_824hbjgkl9lj37da7l40laaj1e3ei_790x790.jpg\", \"https://s3.mogucdn.com/mlcdn/c45406/210814_4c1h88i3954d6a2a37161gejlffk1_790x790.jpg\", \"https://s3.mogucdn.com/p2/170317/77101615_6f3ak83kkl00329ged9249aa93ifb_1125x285.jpg\"]}');
INSERT INTO `goods` VALUES (9, '夏季新款小雏菊碎花连衣裙仙女显瘦裙子超仙森系法式吊带少女裙', '夏季新款小雏菊碎花连衣裙仙女显瘦裙子超仙森系法式吊带少女裙', '[\"https://s11.mogucdn.com/mlcdn/9620b1/220224_38gjeib82al5hbe09b00i3b0aagl1_750x1000.png\", \"https://s3.mogucdn.com/mlcdn/c45406/200427_0a9l3ghchkjk99ccai63i9h2fah51_4501x5999.jpg\", \"https://s10.mogucdn.com/mlcdn/c45406/200427_8e05a2j9abd55gfil4ic4gjk0357j_4501x5999.jpg\", \"https://s3.mogucdn.com/mlcdn/c45406/200427_562d97bh67gd20hc5k4k5ge83lk6e_4501x5999.jpg\"]', 15, 0, 1, 0, 0, 1, '', '2022-03-05 13:41:41', '2022-03-05 13:41:41', '{\"detailSet\": {\"图案\": \"花色\", \"季节\": \"夏季\", \"尺码\": \"M【建议95-110斤】,S【建议80-95斤】,L【建议110-120斤】,XL【建议120-135斤】\", \"材质\": \"聚酯纤维\", \"腰型\": \"高腰\", \"袖长\": \"无袖\", \"裙型\": \"吊带裙\", \"裙长\": \"中裙（91-105cm）\", \"领型\": \"V领\", \"颜色\": \"黑色小雏菊半身裙,黑色小雏菊连衣裙,白色小雏菊连衣裙\", \"风格\": \"通勤（OL）\", \"衣门襟\": \"套头\", \"组合形式\": \"其他\"}, \"detailImage\": [\"https://s11.mogucdn.com/mlcdn/c45406/200427_3jb5ck337jgbh9b928kjh4gg7c84f_700x400.jpg\", \"https://s3.mogucdn.com/mlcdn/c45406/200427_24bib4g22d899j4e77611lgbkj3lf_750x433.jpg\", \"https://s10.mogucdn.com/mlcdn/c45406/200427_611daai14655j6e9f2ajcjed749j2_640x762.jpg\", \"https://s3.mogucdn.com/mlcdn/c45406/200427_7b4ele692bbc7iffe86g40g02k960_640x703.jpg\", \"https://s3.mogucdn.com/mlcdn/c45406/200427_2lff6de5jc76hkl5il7i8kbah8l3b_750x936.jpg\", \"https://s10.mogucdn.com/mlcdn/c45406/200427_4dj7ifkl838h4c15854aaa9e7j7ig_750x1432.jpg\", \"https://s3.mogucdn.com/mlcdn/c45406/200427_806i7479i11d81k39hb940a27h7b7_750x1400.jpg\", \"https://s10.mogucdn.com/mlcdn/c45406/200427_5j23kabg29j5elgclich8k6b67c36_750x1386.jpg\", \"https://s3.mogucdn.com/mlcdn/c45406/200427_42097kalf9c7d7e7k17h695i67h05_750x1385.jpg\", \"https://s3.mogucdn.com/mlcdn/c45406/200427_4bb74032f31ccgc0760aea10kf3h1_750x1432.jpg\", \"https://s10.mogucdn.com/mlcdn/c45406/200427_690i0hc6d2k4f2lc6ia546fecc5fi_750x1416.jpg\", \"https://s10.mogucdn.com/mlcdn/c45406/200427_462a539cahegf5g5a173878iig15g_750x1455.jpg\", \"https://s3.mogucdn.com/mlcdn/c45406/200427_3f711b1f5e5c79bcc496gbd79i9a9_750x1435.jpg\", \"https://s11.mogucdn.com/mlcdn/c45406/200427_29jj5g9cai03f2ef433h5981k597i_750x1126.jpg\", \"https://s11.mogucdn.com/mlcdn/c45406/200427_0a5kc6he1623abjc2jjljkhcd5cg0_750x1439.jpg\", \"https://s11.mogucdn.com/mlcdn/c45406/200427_4id61fh71lig5c2488eij4j93bk87_750x1442.jpg\", \"https://s11.mogucdn.com/mlcdn/c45406/200427_0g5d0l1b12f96ihii3k4cc3ghllaj_750x1440.jpg\", \"https://s11.mogucdn.com/mlcdn/c45406/200427_4l1gk8361kbg3bff8ij4a8fe43f5f_750x1432.jpg\", \"https://s11.mogucdn.com/mlcdn/c45406/200427_3fi8lj8ghhj6c1fhelkd81bdl0l01_750x1400.jpg\", \"https://s10.mogucdn.com/mlcdn/c45406/200427_7llcea556bbgkk2cag88ce2kai9gb_750x1386.jpg\", \"https://s10.mogucdn.com/mlcdn/c45406/200427_7figfif886654g0gh8b738hj65jf0_750x1385.jpg\", \"https://s11.mogucdn.com/mlcdn/c45406/200427_364184061b86jb6kck0gi103f7hki_640x703.jpg\", \"https://s3.mogucdn.com/p2/170317/77101615_6f3ak83kkl00329ged9249aa93ifb_1125x285.jpg\"]}');
INSERT INTO `goods` VALUES (10, '光腿神器女加绒加厚冬季打底裤袜内外穿裸感肉色丝袜秋裤保暖棉裤', '光腿神器女加绒加厚冬季打底裤袜内外穿裸感肉色丝袜秋裤保暖棉裤', '[\"https://s10.mogucdn.com/mlcdn/c45406/200907_06ha805ei2b7d22bfik1f1h4e8790_750x1000.jpg\", \"https://s11.mogucdn.com/mlcdn/c45406/200907_8503hcl3dk7l1d237fbj06h2ealbd_750x1000.jpg\", \"https://s3.mogucdn.com/mlcdn/c45406/200907_4cgal410i9hc7kak39a23b4343572_750x1000.jpg\", \"https://s11.mogucdn.com/mlcdn/c45406/200907_154b3bgg4a943bcii8h945929chi1_750x1000.jpg\"]', 19, 0, 1, 0, 0, 1, '', '2022-03-05 13:44:12', '2022-03-05 13:44:12', '{\"detailSet\": {\"元素\": \"松紧\", \"厚薄\": \"加绒\", \"图案\": \"纯色\", \"季节\": \"秋冬\", \"尺码\": \"均码【适合80-160斤】\", \"材质\": \"涤纶\", \"潮流\": \"韩系\", \"版型\": \"修身\", \"裤长\": \"脚踩\", \"颜色\": \"黑色连脚【350g】,肤色连脚【180g】,黑色连脚【250g】,肤色连脚【350g】,黑色连脚【180g】,黑色踩脚【350g】,肤色踩脚【250g】,黑色踩脚【250g】,黑色踩脚【180g】,肤色连脚【250g】,肤色踩脚【180g】,肤色踩脚【350g】\", \"风格\": \"通勤（OL）\", \"腰线高度\": \"高腰\", \"闭合方式\": \"皮筋腰带\"}, \"detailImage\": [\"https://s11.mogucdn.com/mlcdn/c45406/200907_83d6g9d031l141i7b80ed96819dfb_790x528.jpg\", \"https://s3.mogucdn.com/mlcdn/c45406/200907_01gg1f6lkic4ckfh76a6l9l76i7gc_790x1328.jpg\", \"https://s10.mogucdn.com/mlcdn/c45406/200907_3kf2k7h6d211k1flfifkgidk445bh_790x857.jpg\", \"https://s3.mogucdn.com/mlcdn/c45406/200907_2egg8479jeld92f74c338id9gk20g_790x844.jpg\", \"https://s3.mogucdn.com/mlcdn/c45406/200907_886kgk9jcid04ghggl2c06eaj78af_790x1015.jpg\", \"https://s11.mogucdn.com/mlcdn/c45406/200907_16i4eckf8a2laik8280cliiag8lgj_790x857.jpg\", \"https://s11.mogucdn.com/mlcdn/c45406/200907_875j358199ik95ff9dlj6e23j9gda_790x1149.jpg\", \"https://s10.mogucdn.com/mlcdn/c45406/200907_3d5a378kfg99l0jjd53f504ei8cbh_790x1056.jpg\", \"https://s11.mogucdn.com/mlcdn/c45406/200907_03d0a71h9d9jgkllf7j06e89c796f_790x1081.jpg\", \"https://s3.mogucdn.com/mlcdn/c45406/200907_72468j4dcga65h7icijc22420c3e9_790x825.jpg\", \"https://s3.mogucdn.com/mlcdn/c45406/200907_38i7d5caf8hi803311ci5h3cgaf3b_790x1155.jpg\", \"https://s10.mogucdn.com/mlcdn/c45406/200907_5kh77ah8fhag9flhcdjf481k35158_790x1073.jpg\", \"https://s3.mogucdn.com/mlcdn/c45406/200907_6ejdkf1ej7a73id55a1el39db3ggi_790x777.jpg\", \"https://s10.mogucdn.com/mlcdn/c45406/200907_65gd1b24791jlfl9a6807ej860ld1_790x548.jpg\", \"https://s10.mogucdn.com/mlcdn/c45406/200907_79lah716ggickdiee72h4lf35h6l7_790x718.jpg\", \"https://s11.mogucdn.com/mlcdn/c45406/200907_8ggl151ld1i8ihb8h3hcb4k8lje71_790x790.jpg\", \"https://s3.mogucdn.com/mlcdn/c45406/200907_1k79c3l6b2h8b55ab9fl06f7e3362_790x1093.jpg\", \"https://s10.mogucdn.com/mlcdn/c45406/200907_37159ih5f5i6dh7id8gb3lh36laci_790x660.jpg\", \"https://s10.mogucdn.com/mlcdn/c45406/200907_83i43f9gd64ejghgj5khhdgadgg25_790x800.jpg\", \"https://s11.mogucdn.com/mlcdn/c45406/200907_8bjb5ca2fc4j7542akhg8k890d2aj_790x1042.jpg\", \"https://s11.mogucdn.com/mlcdn/c45406/200907_5cij62a131lc906acleekigff4fcf_790x1062.jpg\", \"https://s11.mogucdn.com/mlcdn/c45406/200907_30ggkd5khhg3ee281blak6d9b66jh_790x1140.jpg\", \"https://s10.mogucdn.com/mlcdn/c45406/200907_5c8e22i2fade946j11f480a39a10j_790x984.jpg\", \"https://s10.mogucdn.com/mlcdn/c45406/200907_854k4ej241i93lb2hl25fi0fh4153_790x889.jpg\", \"https://s10.mogucdn.com/mlcdn/c45406/200907_3dg2dkl0gh71b7353be598lch8e7g_790x1032.jpg\", \"https://s11.mogucdn.com/mlcdn/c45406/200907_6bdk036a4ej83ii6547g83c414k6d_790x1197.jpg\", \"https://s10.mogucdn.com/mlcdn/c45406/200907_3487hec58344jbggbg423kcbefkh6_790x690.jpg\", \"https://s3.mogucdn.com/mlcdn/c45406/200907_00k2l279je4a3e84jlb86e19lb7ig_790x672.jpg\", \"https://s3.mogucdn.com/mlcdn/c45406/200907_5gd5j9jji660e5gb3a8cikbb19aaf_790x1005.jpg\", \"https://s3.mogucdn.com/mlcdn/c45406/200907_0e3ciheag1553064a6583ed9k64hc_790x1032.jpg\", \"https://s3.mogucdn.com/mlcdn/c45406/200907_38k1fia73edf8cjcfb10b365da7bh_790x1005.jpg\", \"https://s10.mogucdn.com/mlcdn/c45406/200907_3b7cg6gbel4e22achc99k6bff0d96_790x918.jpg\", \"https://s10.mogucdn.com/mlcdn/c45406/200907_6flj643bd1ie1i64e8ab0hil5gghh_790x893.jpg\", \"https://s11.mogucdn.com/mlcdn/c45406/200907_5ba5flc3j4c9dhhk3kc93g2le2622_790x1011.jpg\", \"https://s11.mogucdn.com/mlcdn/c45406/200907_02516febd701a2f6167hil0da2kcf_790x528.jpg\", \"https://s3.mogucdn.com/p2/170317/77101615_6f3ak83kkl00329ged9249aa93ifb_1125x285.jpg\"]}');
INSERT INTO `goods` VALUES (11, '秋季薄款西装裤休闲哈伦裤子宽松高腰韩版显瘦黑色新款女裤子西裤', '秋季薄款西装裤休闲哈伦裤子宽松高腰韩版显瘦黑色新款女裤子西裤', '[\"https://s11.mogucdn.com/mlcdn/c45406/200729_1kgfdh45eclc172c7el2f761ekg4d_640x960.jpg\", \"https://s10.mogucdn.com/mlcdn/c45406/200710_6fd322cjfg3k6lk0g370772c9afeh_750x1000.jpg\", \"https://s11.mogucdn.com/mlcdn/c45406/200710_4g00i0bl0hh5j55idg952llk3658f_750x1000.jpg\", \"https://s3.mogucdn.com/mlcdn/c45406/200710_6fh075iel9ea17fk4835h65iae10b_750x1000.jpg\"]', 18, 0, 1, 0, 0, 1, '', '2022-03-05 13:47:13', '2022-03-05 13:47:13', '{\"detailSet\": {\"元素\": \"松紧\", \"厚薄\": \"常规\", \"图案\": \"纯色\", \"季节\": \"秋季\", \"尺码\": \"XL【建议111-125斤】,2XL【建议126-135斤】,M【建议91-100斤】,S【建议75-90斤】,3XL【建议136-150斤】,L【建议101-110斤】\", \"材质\": \"涤纶\", \"潮流\": \"韩系\", \"腰型\": \"高腰\", \"裤型\": \"哈伦裤\", \"裤长\": \"九分裤\", \"颜色\": \"单扣【薄款-夏季穿】卷边九分,单扣【薄款-夏季穿】平脚扣九分,一粒扣平口【秋款】,平板无扣【薄款-夏季穿】九分,平板平口-【秋款】\", \"风格\": \"通勤（OL）\", \"闭合方式\": \"纽扣+拉链\"}, \"detailImage\": [\"https://s11.mogucdn.com/mlcdn/c45406/200710_0718c0idha10i4fi2afjk71412h6d_790x1077.jpg\", \"https://s10.mogucdn.com/mlcdn/c45406/200710_585icg3f52f8b598d8b6a3gijgll2_790x1024.jpg\", \"https://s3.mogucdn.com/mlcdn/c45406/200710_2ajhf6i6g29ai10ckh42j3bb2kl65_790x1185.jpg\", \"https://s11.mogucdn.com/mlcdn/c45406/200710_4h5llf9286f3eeia3lle54hb441df_790x1212.jpg\", \"https://s10.mogucdn.com/mlcdn/c45406/200710_6lelleebd17gha074dj1ci6i13721_790x1163.jpg\", \"https://s11.mogucdn.com/mlcdn/c45406/200710_7h165k73j885g3kigbhil9e67ehj9_790x1294.jpg\", \"https://s3.mogucdn.com/mlcdn/c45406/200710_78e962ij1e86f43429llf3ddg0l56_790x745.jpg\", \"https://s11.mogucdn.com/mlcdn/c45406/200710_1j278ba9bhjej0ia48f64ke65b33l_790x1003.jpg\", \"https://s11.mogucdn.com/mlcdn/c45406/200710_5jkb5dh3lk43l0kej9gk2f179j5a1_790x976.jpg\", \"https://s11.mogucdn.com/mlcdn/c45406/200710_774jicl0ka4g5kflkl8fhk75e3gd2_790x1208.jpg\", \"https://s10.mogucdn.com/mlcdn/c45406/200710_4e2bi3c83225b4h911938lc19106j_790x1003.jpg\", \"https://s11.mogucdn.com/mlcdn/c45406/200710_07lj46i892jbca53jcagdd17607cl_790x1272.jpg\", \"https://s10.mogucdn.com/mlcdn/c45406/200710_5b4ab0558f3b948di7ef4fl305iah_790x1266.jpg\", \"https://s3.mogucdn.com/mlcdn/c45406/200710_2i2053egj26j1jg14e6k2ld7i6kj2_790x1279.jpg\", \"https://s11.mogucdn.com/mlcdn/c45406/200710_8b3cab2ii59ja605bbk1je3a12i7g_790x427.jpg\", \"https://s3.mogucdn.com/mlcdn/c45406/200710_5bcad7l8ee72d38h915jk1fe59j4f_790x1104.jpg\", \"https://s11.mogucdn.com/mlcdn/c45406/200710_4k0k589a6dc80jig1hda73f1g782f_790x1005.jpg\", \"https://s10.mogucdn.com/mlcdn/c45406/200710_58907a8f0g1a787f5klab4026093l_790x1083.jpg\", \"https://s11.mogucdn.com/mlcdn/c45406/200710_337akc40j1932g2cal3525fghe2l3_790x1050.jpg\", \"https://s10.mogucdn.com/mlcdn/c45406/200710_070g5cjdla48ji415jc6805jage14_790x1152.jpg\", \"https://s11.mogucdn.com/mlcdn/c45406/200710_5k456115hk60364d888hd6916bi5a_790x1119.jpg\", \"https://s11.mogucdn.com/mlcdn/c45406/200710_32k9a5825c002lh31j5a2649il9cc_790x987.jpg\", \"https://s11.mogucdn.com/mlcdn/c45406/200710_0ea57fc82ed9khac73h99b3igff3e_790x1191.jpg\", \"https://s3.mogucdn.com/mlcdn/c45406/200710_56kh1f349b6bl5j4k75glk61dhh0g_790x1131.jpg\", \"https://s3.mogucdn.com/mlcdn/c45406/200710_62ka0hb2j75i2gg4j91hh4jhfl9fa_790x1296.jpg\", \"https://s10.mogucdn.com/mlcdn/c45406/200710_5i3d7e4448f00b44a1l492a548944_790x1258.jpg\", \"https://s11.mogucdn.com/mlcdn/c45406/200710_73c2ih57fefd3kgdalgd8d0ibfgih_790x1279.jpg\", \"https://s3.mogucdn.com/p2/170317/77101615_6f3ak83kkl00329ged9249aa93ifb_1125x285.jpg\"]}');
INSERT INTO `goods` VALUES (12, '加绒加厚港风冬季卫衣男宽松潮流休闲潮牌百搭ins套头情侣上衣', '加绒加厚港风冬季卫衣男宽松潮流休闲潮牌百搭ins套头情侣上衣', '[\"https://s11.mogucdn.com/mlcdn/9620b1/220225_1f999657cf3177hl0f60l139i82cd_750x1000.png\"]', 4, 0, 1, 0, 0, 1, '', '2022-03-05 13:51:10', '2022-03-05 13:51:10', '{\"detailSet\": {\"图案\": \"其他\", \"尺码\": \"S,XL,2XL,3XL,L,M\", \"材质\": \"复合\", \"版型\": \"宽松\", \"细节\": \"其它\", \"袖型\": \"其他袖型\", \"领型\": \"其他领型\", \"颜色\": \"灰色加绒,粉红色加绒,蓝色加绒\", \"风格\": \"男友风\", \"衣门襟\": \"其他\"}, \"detailImage\": [\"https://s10.mogucdn.com/mlcdn/c45406/211027_653e6jhallcj4i584kdgcjeligb47_882x529.jpg\", \"https://s3.mogucdn.com/mlcdn/c45406/211027_5374hd9dj8i9955j64cgi689f9cbi_750x828.jpg\", \"https://s3.mogucdn.com/mlcdn/c45406/211027_85aa0b69f122hf2d7cbf4g2cie91e_750x1019.jpg\", \"https://s3.mogucdn.com/mlcdn/c45406/211027_80bd3a3jil382jeia605kb673hhc7_750x1232.jpg\", \"https://s3.mogucdn.com/mlcdn/c45406/211027_5i3cjag61dak0hgkeidlfg916k893_750x1233.jpg\", \"https://s3.mogucdn.com/mlcdn/c45406/211027_632gjj6h2jbbh761ag507e3f4b096_750x1226.jpg\", \"https://s11.mogucdn.com/mlcdn/c45406/211027_7h89028gd8kbi6j3b9gcc89k39k01_750x1226.jpg\", \"https://s10.mogucdn.com/mlcdn/c45406/211027_7eabkgh2afadhdjlkhfjjd149965f_750x1230.jpg\", \"https://s5.mogucdn.com/mlcdn/c45406/211027_6khbc3fdi0569bg349hahg8akkg58_750x1231.jpg\", \"https://s11.mogucdn.com/mlcdn/c45406/211027_8ba051i5186h1cj55lhf32k8b819a_750x1234.jpg\", \"https://s11.mogucdn.com/mlcdn/c45406/211027_0di64cdf73ai1j4h1ldfjjh1ljd7j_750x1235.jpg\", \"https://s3.mogucdn.com/mlcdn/c45406/211027_64e9ifibeekbfg6bf87i2lhdcc44l_750x1228.jpg\", \"https://s10.mogucdn.com/mlcdn/c45406/211027_7f7l16b46ke0144c0b26j983hgg1j_750x1228.jpg\", \"https://s3.mogucdn.com/mlcdn/c45406/211027_5kche26k70lh6jkgg6i84853efg6g_750x1236.jpg\", \"https://s10.mogucdn.com/mlcdn/c45406/211027_5h1ib6dg783bl7i6lg68hfj5i576c_750x1237.jpg\", \"https://s11.mogucdn.com/mlcdn/c45406/211027_4fk467aci3elb2ihhjbiakch4c0b8_750x1101.jpg\", \"https://s10.mogucdn.com/mlcdn/c45406/211027_607120429b0cg33cl6jbf971l8ek9_750x1101.jpg\", \"https://s11.mogucdn.com/mlcdn/c45406/211027_8e11bi4ldgl11g5ha63ejc4i6lfjb_750x1101.jpg\", \"https://s3.mogucdn.com/p2/170317/77101615_6f3ak83kkl00329ged9249aa93ifb_1125x285.jpg\"]}');
INSERT INTO `goods` VALUES (13, '情侣装春秋装新款韩版宽松长袖情侣薄款款卫衣女ins超火港风', '情侣装春秋装新款韩版宽松长袖情侣薄款款卫衣女ins超火港风', '[\"https://s10.mogucdn.com/mlcdn/9620b1/220225_7544ab5k22b142afd61f3h40jl15g_750x1000.png\", \"https://s3.mogucdn.com/mlcdn/55cf19/200908_1aac1j41g7lk864ahl6bhika49ec4_640x960.jpg\", \"https://s11.mogucdn.com/mlcdn/55cf19/200908_15e424f3l5ekc393b1kf0e0c9gi0h_640x960.jpg\", \"https://s3.mogucdn.com/mlcdn/55cf19/200908_2824l4chc2g0jbac57kggkdbil4jl_640x960.jpg\"]', 24, 0, 1, 0, 0, 1, '', '2022-03-05 13:55:21', '2022-03-05 13:55:21', '{\"detailSet\": {\"图案\": \"花色\", \"尺码\": \"XL,L,M,XXL,XXXL\", \"材质\": \"针织\", \"版型\": \"宽松\", \"细节\": \"其它\", \"袖型\": \"常规袖\", \"领型\": \"其他领型\", \"颜色\": \"白色216,白色214,白色219,白色218,红色216,红色215,黑色217-1,黄色218,白色217-2,黄色219,黑色217-2,黑色219,黑色218,黑色216,黑色215,黑色214,白色217-1\", \"风格\": \"简约\", \"衣门襟\": \"其他\", \"上衣厚度\": \"适中\"}, \"detailImage\": [\"https://s10.mogucdn.com/mlcdn/55cf19/200908_0a8i2eck37d1bdcj9572eja3c4f3b_750x1013.jpg\", \"https://s11.mogucdn.com/mlcdn/55cf19/200908_3be6a3i2e9j8kf1c5df3c0k2g7eg0_1500x2322.jpg\", \"https://s11.mogucdn.com/mlcdn/55cf19/200908_8398fb7kl5ea9j2aldlked6deb2ih_1500x757.jpg\", \"https://s11.mogucdn.com/mlcdn/55cf19/200908_8ak12fcag8635gglj7b1aa9bh6bia_1500x2322.jpg\", \"https://s3.mogucdn.com/mlcdn/55cf19/200908_1b9kagdgi434e8fd0g48899da4g3l_1500x757.jpg\", \"https://s3.mogucdn.com/mlcdn/55cf19/200908_0633kljddlhk58fc9jil52485ei7g_1500x2322.jpg\", \"https://s11.mogucdn.com/mlcdn/55cf19/200908_3kjd65h65g17chj9li9k0jl4911lb_1500x757.jpg\", \"https://s11.mogucdn.com/mlcdn/55cf19/200908_25iekjkbfbi4h51ea1gddh8gl083l_750x1122.jpg\", \"https://s11.mogucdn.com/mlcdn/55cf19/200908_56hfe8lf72f5agahfl2efgcd386ad_750x1092.jpg\", \"https://s3.mogucdn.com/mlcdn/55cf19/200908_17lfkcb20hi07be7kfc2djb1g1d46_750x1092.jpg\", \"https://s3.mogucdn.com/mlcdn/55cf19/200908_28k0790j4j339ih01af039f6b481l_1500x2322.jpg\", \"https://s11.mogucdn.com/mlcdn/55cf19/200908_7l93d9c6k99l7j2725cck1f80e6ag_1500x757.jpg\", \"https://s11.mogucdn.com/mlcdn/55cf19/200908_7b5k571he52ia5abf75dff6g156h2_1500x2322.jpg\", \"https://s10.mogucdn.com/mlcdn/55cf19/200908_35keehdedgjkk6bj310027h2cfag8_1500x757.jpg\", \"https://s10.mogucdn.com/mlcdn/55cf19/200908_8072aif7fffjffdbdb02dha2dkbk3_1500x2322.jpg\", \"https://s10.mogucdn.com/mlcdn/55cf19/200908_64hi4ifa1ba92f6kf633e8ei56a4i_1500x757.jpg\", \"https://s3.mogucdn.com/mlcdn/55cf19/200908_2204cl5d1ecalk1aal1al86ch1ffe_1500x2322.jpg\", \"https://s11.mogucdn.com/mlcdn/55cf19/200908_032j502hfjd1838l18i698k79aa4c_1500x757.jpg\", \"https://s3.mogucdn.com/mlcdn/55cf19/200908_31d915i71224ekh46718g93a69j8l_1500x2322.jpg\", \"https://s3.mogucdn.com/mlcdn/55cf19/200908_1aeb68h54jcc2a42i3aceh68lilih_1500x757.jpg\", \"https://s3.mogucdn.com/mlcdn/55cf19/200908_30da9e7d1chb2kd503l3j130a5dih_750x1122.jpg\", \"https://s11.mogucdn.com/mlcdn/55cf19/200908_764651l664413jk749fegd89gkd6c_750x1092.jpg\", \"https://s3.mogucdn.com/mlcdn/55cf19/200908_619dkab19de46jc342a513f2c3lec_750x1092.jpg\", \"https://s3.mogucdn.com/mlcdn/55cf19/200908_5dc2bgkb2i1a76c19eagi4146b26h_750x1122.jpg\", \"https://s3.mogucdn.com/p2/170317/77101615_6f3ak83kkl00329ged9249aa93ifb_1125x285.jpg\"]}');
INSERT INTO `goods` VALUES (14, '夏季透气防臭男鞋潮流镂空网鞋男士运动休闲百搭薄款网面跑步潮鞋', '夏季透气防臭男鞋潮流镂空网鞋男士运动休闲百搭薄款网面跑步潮鞋', '[\"https://s11.mogucdn.com/mlcdn/9620b1/220228_831hklgfh4fjdc73f35a1clk01e8i_750x1000.png\", \"https://s11.mogucdn.com/mlcdn/55cf19/210511_18d6i1aa1l375jb417ijfddjh2g36_640x960.jpg\", \"https://s10.mogucdn.com/mlcdn/55cf19/210511_2ckebk8j1le1k3k90ghi74dfe94k4_640x960.jpg\", \"https://s10.mogucdn.com/mlcdn/55cf19/210511_09d6ge0c9777feld2f23h3ch522gb_640x960.jpg\"]', 25, 0, 1, 0, 0, 1, '', '2022-03-05 13:58:10', '2022-03-05 13:58:10', '{\"detailSet\": {\"图案\": \"色块\", \"季节\": \"夏季\", \"尺码\": \"44,39,40,41,42,43\", \"跟高\": \"其他跟高\", \"颜色\": \"ML70白色,ML70黑色,ML70米色\", \"风格\": \"运动\", \"流行元素\": \"车缝线\", \"闭合方式\": \"系带\", \"鞋垫材质\": \"PU\", \"鞋头款式\": \"圆头\", \"鞋帮高度\": \"低帮\", \"鞋底材质\": \"橡胶发泡\", \"鞋面材质\": \"网布\", \"鞋内里材质\": \"超纤\"}, \"detailImage\": [\"https://s10.mogucdn.com/mlcdn/55cf19/210511_80l1gh25327l05gjjcc0k5ekha48i_750x1106.jpg\", \"https://s3.mogucdn.com/mlcdn/55cf19/210511_5ji4f6ki8laglif73j6hbj23a93hb_750x769.jpg\", \"https://s3.mogucdn.com/mlcdn/55cf19/210511_193ckei1ckf0l515gi53fg0h09i59_750x918.jpg\", \"https://s3.mogucdn.com/mlcdn/55cf19/210511_228dc5daf5d44he3df8ad3e17624h_750x930.jpg\", \"https://s3.mogucdn.com/mlcdn/55cf19/210511_56k2cabi1dh8h28jc6610kkb90fhd_750x924.jpg\", \"https://s10.mogucdn.com/mlcdn/55cf19/210511_02c81ea0jkcjj979lake0l7j0j6b8_750x849.jpg\", \"https://s11.mogucdn.com/mlcdn/55cf19/210511_6jcja4g91dai5l6iikk01341b7557_750x940.jpg\", \"https://s11.mogucdn.com/mlcdn/55cf19/210511_2fb5agge9gj3449ec46hd8ejafhf1_750x894.jpg\", \"https://s10.mogucdn.com/mlcdn/55cf19/210511_5hce11j1d824caj7ehba1abldild5_750x779.jpg\", \"https://s10.mogucdn.com/mlcdn/55cf19/210511_12528a0eki7jf74ekld3f6f9j7gjc_750x772.jpg\", \"https://s3.mogucdn.com/mlcdn/55cf19/210511_4bkfa6dd9b4fjh2j0bheg3a6ik02j_750x796.jpg\", \"https://s10.mogucdn.com/mlcdn/55cf19/210511_57d8563004debde9bkii1jl5k9ek0_750x718.jpg\", \"https://s3.mogucdn.com/mlcdn/55cf19/210511_8g1i43flc0cd0cial06k6489ccli3_750x893.jpg\", \"https://s10.mogucdn.com/mlcdn/55cf19/210511_1cah6eg9g7ke3ekc9g24blk57fgck_750x766.jpg\", \"https://s11.mogucdn.com/mlcdn/55cf19/210511_2i3ki3j4i8hj3j0ahgek5e4d03h71_750x593.jpg\", \"https://s3.mogucdn.com/mlcdn/55cf19/210511_5j319gi309k4i521gejf1i37ealci_750x711.jpg\", \"https://s10.mogucdn.com/mlcdn/55cf19/210511_4fb479kj86dj2lkl821ba95i9085i_750x904.jpg\", \"https://s3.mogucdn.com/mlcdn/55cf19/210511_1248b49kffkdee3gll1kjdk0a5e3h_750x633.jpg\", \"https://s3.mogucdn.com/mlcdn/55cf19/210511_7h9f49bk1dlek7hk75h6h8393eic6_750x784.jpg\", \"https://s11.mogucdn.com/mlcdn/55cf19/210511_41gf5hl4c11afdi957l6ce5ba92d8_750x765.jpg\", \"https://s10.mogucdn.com/mlcdn/55cf19/210511_1ee7gfh92ikc99h56l6672k7ea851_750x727.jpg\", \"https://s3.mogucdn.com/p2/170317/77101615_6f3ak83kkl00329ged9249aa93ifb_1125x285.jpg\"]}');
INSERT INTO `goods` VALUES (15, '小白鞋女2021春夏新款韩版百搭学生帆布鞋港风平底休闲鞋1', '小白鞋女2021春夏新款韩版百搭学生帆布鞋港风平底休闲鞋12', '[\"https://s3.mogucdn.com/mlcdn/c45406/210308_6974a5aj5e233eia525k208g817fj_640x960.jpg\", \"https://s3.mogucdn.com/mlcdn/c45406/210308_19cj8beik77e8ch303cbficlla3lj_640x960.jpg\", \"https://s3.mogucdn.com/mlcdn/c45406/210308_1gki1l545jljch7b2bkfdic6jkj9h_640x960.jpg\", \"https://s3.mogucdn.com/mlcdn/c45406/210308_4dkdcgie39h5jhjlef6001939kib8_640x960.jpg\", \"https://s11.mogucdn.com/mlcdn/c45406/210308_71dg7ga0fe11kj926ghi926kbhb74_640x960.jpg\", \"https://s11.mogucdn.com/mlcdn/c45406/210308_1aia412bbe012a27d58gb28c50576_640x960.jpg\"]', 21, 0, 1, 0, 0, 1, '', '2022-03-06 00:49:14', '2022-03-06 00:49:14', '{\"detailSet\": {\"图案\": \"色块\", \"季节\": \"春季\", \"尺码\": \"35 偏小半码,37 偏小半码,38 偏小半码,36 偏小半码,39 偏小半码,40 偏小半码\", \"帮高\": \"低帮\", \"跟高\": \"平跟（小于等于1CM）\", \"颜色\": \"黑色,白色\", \"风格\": \"男友风\", \"内里材质\": \"其他材质\", \"帮面材质\": \"人造革\", \"开口深度\": \"中口（7-11cm）\", \"流行元素\": \"绑带（系带)\", \"闭合方式\": \"系带\", \"鞋头形状\": \"圆头\", \"鞋底形状\": \"平跟（无跟）\", \"鞋底材质\": \"橡胶底\", \"鞋面材质\": \"其他材质\", \"鞋面特殊工艺效果\": \"擦色\"}, \"detailImage\": [\"https://s3.mogucdn.com/mlcdn/c45406/210308_44hg78ikbbhg0b22b2ifak3i90dle_750x170.jpg\", \"https://s11.mogucdn.com/mlcdn/c45406/210308_3jj4k20cj36894d2h3ebd6e460d68_750x916.jpg\", \"https://s3.mogucdn.com/mlcdn/c45406/210308_4gai4gee9i3ad05e070e82aeeg87a_750x1166.jpg\", \"https://s11.mogucdn.com/mlcdn/c45406/210308_53lcg80bg4170bc7hflj83cd0e3l6_750x952.jpg\", \"https://s11.mogucdn.com/mlcdn/c45406/210308_3eefg59fa1lb9f05l4b9kkjj4h3cf_728x1200.jpg\", \"https://s10.mogucdn.com/mlcdn/c45406/210308_01e2jkdc5i09jh5jbbjhkje1eabcd_684x1200.jpg\", \"https://s11.mogucdn.com/mlcdn/c45406/210308_110dj6lci63hjl1e30669d9g0i5bh_750x916.jpg\", \"https://s3.mogucdn.com/mlcdn/c45406/210308_4h85cjc3l05f252hkc1b02fl85j4k_750x824.jpg\", \"https://s11.mogucdn.com/mlcdn/c45406/210308_5df4i09bf458147dklh3lcjlc2jef_750x690.jpg\", \"https://s10.mogucdn.com/mlcdn/c45406/210308_3503832ideb3l8c3192bcjdbf64jf_750x1002.jpg\", \"https://s10.mogucdn.com/mlcdn/c45406/210308_42e4k4j8hjjecg5300cid1bibae3j_750x828.jpg\", \"https://s11.mogucdn.com/mlcdn/c45406/210308_3b4211j010f4kh7bib706k0f0dg4h_640x960.jpg\", \"https://s11.mogucdn.com/mlcdn/c45406/210308_6f180h4e3ebd6k4a4k6hbgl20ad0k_642x1200.jpg\", \"https://s3.mogucdn.com/mlcdn/c45406/210308_46i6f9a405ec045iel7d2cb6ej10l_750x726.jpg\", \"https://s3.mogucdn.com/mlcdn/c45406/210308_1cid9c68j2jabcf882b0dh208bkd6_730x1198.jpg\", \"https://s3.mogucdn.com/p2/170317/77101615_6f3ak83kkl00329ged9249aa93ifb_1125x285.jpg\"]}');
INSERT INTO `goods` VALUES (16, '小白鞋女2021春夏新款韩版百搭学生帆布鞋港风平底休闲鞋34', '小白鞋女2021春夏新款韩版百搭学生帆布鞋港风平底休闲鞋14', '[\"https://s3.mogucdn.com/mlcdn/c45406/210308_6974a5aj5e233eia525k208g817fj_640x960.jpg\", \"https://s3.mogucdn.com/mlcdn/c45406/210308_19cj8beik77e8ch303cbficlla3lj_640x960.jpg\", \"https://s3.mogucdn.com/mlcdn/c45406/210308_1gki1l545jljch7b2bkfdic6jkj9h_640x960.jpg\", \"https://s3.mogucdn.com/mlcdn/c45406/210308_4dkdcgie39h5jhjlef6001939kib8_640x960.jpg\", \"https://s11.mogucdn.com/mlcdn/c45406/210308_71dg7ga0fe11kj926ghi926kbhb74_640x960.jpg\", \"https://s11.mogucdn.com/mlcdn/c45406/210308_1aia412bbe012a27d58gb28c50576_640x960.jpg\"]', 21, 0, 1, 0, 0, 1, '', '2022-03-06 00:49:25', '2022-03-06 00:49:25', '{\"detailSet\": {\"图案\": \"色块\", \"季节\": \"春季\", \"尺码\": \"35 偏小半码,37 偏小半码,38 偏小半码,36 偏小半码,39 偏小半码,40 偏小半码\", \"帮高\": \"低帮\", \"跟高\": \"平跟（小于等于1CM）\", \"颜色\": \"黑色,白色\", \"风格\": \"男友风\", \"内里材质\": \"其他材质\", \"帮面材质\": \"人造革\", \"开口深度\": \"中口（7-11cm）\", \"流行元素\": \"绑带（系带)\", \"闭合方式\": \"系带\", \"鞋头形状\": \"圆头\", \"鞋底形状\": \"平跟（无跟）\", \"鞋底材质\": \"橡胶底\", \"鞋面材质\": \"其他材质\", \"鞋面特殊工艺效果\": \"擦色\"}, \"detailImage\": [\"https://s3.mogucdn.com/mlcdn/c45406/210308_44hg78ikbbhg0b22b2ifak3i90dle_750x170.jpg\", \"https://s11.mogucdn.com/mlcdn/c45406/210308_3jj4k20cj36894d2h3ebd6e460d68_750x916.jpg\", \"https://s3.mogucdn.com/mlcdn/c45406/210308_4gai4gee9i3ad05e070e82aeeg87a_750x1166.jpg\", \"https://s11.mogucdn.com/mlcdn/c45406/210308_53lcg80bg4170bc7hflj83cd0e3l6_750x952.jpg\", \"https://s11.mogucdn.com/mlcdn/c45406/210308_3eefg59fa1lb9f05l4b9kkjj4h3cf_728x1200.jpg\", \"https://s10.mogucdn.com/mlcdn/c45406/210308_01e2jkdc5i09jh5jbbjhkje1eabcd_684x1200.jpg\", \"https://s11.mogucdn.com/mlcdn/c45406/210308_110dj6lci63hjl1e30669d9g0i5bh_750x916.jpg\", \"https://s3.mogucdn.com/mlcdn/c45406/210308_4h85cjc3l05f252hkc1b02fl85j4k_750x824.jpg\", \"https://s11.mogucdn.com/mlcdn/c45406/210308_5df4i09bf458147dklh3lcjlc2jef_750x690.jpg\", \"https://s10.mogucdn.com/mlcdn/c45406/210308_3503832ideb3l8c3192bcjdbf64jf_750x1002.jpg\", \"https://s10.mogucdn.com/mlcdn/c45406/210308_42e4k4j8hjjecg5300cid1bibae3j_750x828.jpg\", \"https://s11.mogucdn.com/mlcdn/c45406/210308_3b4211j010f4kh7bib706k0f0dg4h_640x960.jpg\", \"https://s11.mogucdn.com/mlcdn/c45406/210308_6f180h4e3ebd6k4a4k6hbgl20ad0k_642x1200.jpg\", \"https://s3.mogucdn.com/mlcdn/c45406/210308_46i6f9a405ec045iel7d2cb6ej10l_750x726.jpg\", \"https://s3.mogucdn.com/mlcdn/c45406/210308_1cid9c68j2jabcf882b0dh208bkd6_730x1198.jpg\", \"https://s3.mogucdn.com/p2/170317/77101615_6f3ak83kkl00329ged9249aa93ifb_1125x285.jpg\"]}');
INSERT INTO `goods` VALUES (17, '小白鞋女2021春夏新款韩版百搭学生帆布鞋港风平底休闲鞋5', '小白鞋女2021春夏新款韩版百搭学生帆布鞋港风平底休闲鞋12', '[\"https://s3.mogucdn.com/mlcdn/c45406/210308_6974a5aj5e233eia525k208g817fj_640x960.jpg\", \"https://s3.mogucdn.com/mlcdn/c45406/210308_19cj8beik77e8ch303cbficlla3lj_640x960.jpg\", \"https://s3.mogucdn.com/mlcdn/c45406/210308_1gki1l545jljch7b2bkfdic6jkj9h_640x960.jpg\", \"https://s3.mogucdn.com/mlcdn/c45406/210308_4dkdcgie39h5jhjlef6001939kib8_640x960.jpg\", \"https://s11.mogucdn.com/mlcdn/c45406/210308_71dg7ga0fe11kj926ghi926kbhb74_640x960.jpg\", \"https://s11.mogucdn.com/mlcdn/c45406/210308_1aia412bbe012a27d58gb28c50576_640x960.jpg\"]', 21, 0, 1, 0, 0, 1, '', '2022-03-06 00:49:35', '2022-03-06 00:49:35', '{\"detailSet\": {\"图案\": \"色块\", \"季节\": \"春季\", \"尺码\": \"35 偏小半码,37 偏小半码,38 偏小半码,36 偏小半码,39 偏小半码,40 偏小半码\", \"帮高\": \"低帮\", \"跟高\": \"平跟（小于等于1CM）\", \"颜色\": \"黑色,白色\", \"风格\": \"男友风\", \"内里材质\": \"其他材质\", \"帮面材质\": \"人造革\", \"开口深度\": \"中口（7-11cm）\", \"流行元素\": \"绑带（系带)\", \"闭合方式\": \"系带\", \"鞋头形状\": \"圆头\", \"鞋底形状\": \"平跟（无跟）\", \"鞋底材质\": \"橡胶底\", \"鞋面材质\": \"其他材质\", \"鞋面特殊工艺效果\": \"擦色\"}, \"detailImage\": [\"https://s3.mogucdn.com/mlcdn/c45406/210308_44hg78ikbbhg0b22b2ifak3i90dle_750x170.jpg\", \"https://s11.mogucdn.com/mlcdn/c45406/210308_3jj4k20cj36894d2h3ebd6e460d68_750x916.jpg\", \"https://s3.mogucdn.com/mlcdn/c45406/210308_4gai4gee9i3ad05e070e82aeeg87a_750x1166.jpg\", \"https://s11.mogucdn.com/mlcdn/c45406/210308_53lcg80bg4170bc7hflj83cd0e3l6_750x952.jpg\", \"https://s11.mogucdn.com/mlcdn/c45406/210308_3eefg59fa1lb9f05l4b9kkjj4h3cf_728x1200.jpg\", \"https://s10.mogucdn.com/mlcdn/c45406/210308_01e2jkdc5i09jh5jbbjhkje1eabcd_684x1200.jpg\", \"https://s11.mogucdn.com/mlcdn/c45406/210308_110dj6lci63hjl1e30669d9g0i5bh_750x916.jpg\", \"https://s3.mogucdn.com/mlcdn/c45406/210308_4h85cjc3l05f252hkc1b02fl85j4k_750x824.jpg\", \"https://s11.mogucdn.com/mlcdn/c45406/210308_5df4i09bf458147dklh3lcjlc2jef_750x690.jpg\", \"https://s10.mogucdn.com/mlcdn/c45406/210308_3503832ideb3l8c3192bcjdbf64jf_750x1002.jpg\", \"https://s10.mogucdn.com/mlcdn/c45406/210308_42e4k4j8hjjecg5300cid1bibae3j_750x828.jpg\", \"https://s11.mogucdn.com/mlcdn/c45406/210308_3b4211j010f4kh7bib706k0f0dg4h_640x960.jpg\", \"https://s11.mogucdn.com/mlcdn/c45406/210308_6f180h4e3ebd6k4a4k6hbgl20ad0k_642x1200.jpg\", \"https://s3.mogucdn.com/mlcdn/c45406/210308_46i6f9a405ec045iel7d2cb6ej10l_750x726.jpg\", \"https://s3.mogucdn.com/mlcdn/c45406/210308_1cid9c68j2jabcf882b0dh208bkd6_730x1198.jpg\", \"https://s3.mogucdn.com/p2/170317/77101615_6f3ak83kkl00329ged9249aa93ifb_1125x285.jpg\"]}');
INSERT INTO `goods` VALUES (18, '长裙女夏新款韩版气质收腰显瘦雪纺连衣裙红色超仙娃娃领裙子', '长裙女夏新款韩版气质收腰显瘦雪纺连衣裙红色超仙娃娃领裙子', '[\"https://s10.mogucdn.com/mlcdn/9620b1/220224_2lc6h2d847i071l72ld6637e4a941_750x1000.png\", \"https://s10.mogucdn.com/mlcdn/c45406/200516_48id48382cjhb3lkg31i4ga13f7hd_3750x4999.jpg\", \"https://s11.mogucdn.com/mlcdn/c45406/200516_893gekked43i29d6h8g5ic74b55gb_3750x4999.jpg\", \"https://s11.mogucdn.com/mlcdn/c45406/200516_6llei51ekja7ak2c67bh7bcgafg7j_3750x4999.jpg\"]', 15, 0, 1, 0, 0, 1, '', '2022-03-06 00:52:55', '2022-03-06 00:52:55', '{\"detailSet\": {\"图案\": \"纯色\", \"季节\": \"夏季\", \"尺码\": \"S【建议85-100斤】,XL【建议120-130斤】,3XL【建议140-150斤】,2XL【建议130-140斤】,L【建议110-120斤】,M【建议100-110斤】\", \"材质\": \"雪纺\", \"腰型\": \"松紧腰\", \"袖长\": \"五分袖（中袖）\", \"裙型\": \"其他\", \"裙长\": \"中长裙（106-125cm）\", \"领型\": \"娃娃领\", \"颜色\": \"蓝色,红色\", \"风格\": \"通勤（OL）\", \"组合形式\": \"单件\"}, \"detailImage\": [\"https://s3.mogucdn.com/mlcdn/c45406/200516_2idjc6lfg46457bd8516kj8flbkle_700x400.jpg\", \"https://s10.mogucdn.com/mlcdn/c45406/200516_5k5635fle8k4kl056keh67g4a443c_750x433.jpg\", \"https://s3.mogucdn.com/mlcdn/c45406/200516_77a6k06fgagh3dde73h6jdbd3j5hd_640x762.jpg\", \"https://s11.mogucdn.com/mlcdn/c45406/200516_21a21jf6gbl05hfj47e78ei44a14f_640x677.jpg\", \"https://s11.mogucdn.com/mlcdn/c45406/200516_2h5ckdja5h4ebi4781iid732309ff_750x1108.jpg\", \"https://s10.mogucdn.com/mlcdn/c45406/200516_8cc818kcbf9ijk3kgked17f8j1l14_750x1148.jpg\", \"https://s3.mogucdn.com/mlcdn/c45406/200516_7340j11ehhd2ak24l7972kkkgag49_750x971.jpg\", \"https://s10.mogucdn.com/mlcdn/c45406/200516_4d05k0l6d9a1f34e2li26efbh43h5_750x1215.jpg\", \"https://s11.mogucdn.com/mlcdn/c45406/200516_529hg6f8fdjhid1gf8id367fj2lfh_750x756.jpg\", \"https://s11.mogucdn.com/mlcdn/c45406/200516_3j9l7aah6ah2iia717204g07dh4el_750x475.jpg\", \"https://s10.mogucdn.com/mlcdn/c45406/200516_81d8i57ja6ai1ggid75hj3b44ilg0_750x926.jpg\", \"https://s11.mogucdn.com/mlcdn/c45406/200516_0i7f3i5aljadbfbk77d355l5akhj5_750x331.jpg\", \"https://s11.mogucdn.com/mlcdn/c45406/200516_84166534379c275ijlk7d05j846cd_750x805.jpg\", \"https://s3.mogucdn.com/mlcdn/c45406/200516_0cg8f47d1gb60di40jh2922h5l37g_750x1068.jpg\", \"https://s11.mogucdn.com/mlcdn/c45406/200516_06h35hf93abj3kl4f8d2013j70674_750x975.jpg\", \"https://s10.mogucdn.com/mlcdn/c45406/200516_888f48alfb6k4bfkgdhab8hka9b1b_750x1071.jpg\", \"https://s11.mogucdn.com/mlcdn/c45406/200516_7c07a0ef9bc426dh2eiab7a56hf77_750x834.jpg\", \"https://s3.mogucdn.com/mlcdn/c45406/200516_4agj6ageeg23d46fik1elib74cc58_750x920.jpg\", \"https://s11.mogucdn.com/mlcdn/c45406/200516_6e3l0i0fieigk70iaib4lf03fbi1l_750x953.jpg\", \"https://s3.mogucdn.com/mlcdn/c45406/200516_0de78fdkhk979jhbebe31h5885835_750x883.jpg\", \"https://s11.mogucdn.com/mlcdn/c45406/200516_7lidkhl60308dlch47b88di9glb12_750x1099.jpg\", \"https://s3.mogucdn.com/mlcdn/c45406/200516_1ia087b5el88gc0i6ajkbc35kk773_640x677.jpg\", \"https://s3.mogucdn.com/p2/170317/77101615_6f3ak83kkl00329ged9249aa93ifb_1125x285.jpg\"]}');
COMMIT;

-- ----------------------------
-- Table structure for goods_sku
-- ----------------------------
DROP TABLE IF EXISTS `goods_sku`;
CREATE TABLE `goods_sku` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `goods_id` int(11) DEFAULT NULL COMMENT '商品id',
  `name` varchar(255) DEFAULT NULL COMMENT '名字',
  `inventory` int(11) DEFAULT '0' COMMENT '商品数量',
  `price` float(10,2) DEFAULT NULL COMMENT '新价格',
  `old_price` float(10,2) DEFAULT NULL COMMENT '原价',
  `picture` varchar(255) DEFAULT NULL COMMENT '图片',
  `desc` varchar(255) DEFAULT NULL COMMENT '介绍',
  `specs` json DEFAULT NULL COMMENT '属性，[]',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=149 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of goods_sku
-- ----------------------------
BEGIN;
INSERT INTO `goods_sku` VALUES (1, 1, NULL, 88, 199.00, 199.00, '', NULL, '[{\"key\": \"尺码\", \"value\": \"S\"}, {\"key\": \"颜色\", \"value\": \"粉色套装 外套+裙子\"}]', '2022-03-02 00:48:23', '2022-03-02 00:48:23');
INSERT INTO `goods_sku` VALUES (2, 1, NULL, 88, 199.00, 199.00, '', NULL, '[{\"key\": \"尺码\", \"value\": \"S\"}, {\"key\": \"颜色\", \"value\": \"绿色套装 外套+裙子\"}]', '2022-03-02 00:48:23', '2022-03-02 00:48:23');
INSERT INTO `goods_sku` VALUES (3, 1, NULL, 68, 199.00, 199.00, '', NULL, '[{\"key\": \"尺码\", \"value\": \"S\"}, {\"key\": \"颜色\", \"value\": \"粉色上衣 西装外套\"}]', '2022-03-02 00:48:23', '2022-03-02 00:48:23');
INSERT INTO `goods_sku` VALUES (4, 1, NULL, 88, 199.00, 198.00, '', NULL, '[{\"key\": \"尺码\", \"value\": \"S\"}, {\"key\": \"颜色\", \"value\": \"绿色上衣 西装外套\"}]', '2022-03-02 00:48:23', '2022-03-02 00:48:23');
INSERT INTO `goods_sku` VALUES (5, 1, NULL, 88, 199.00, 199.00, '', NULL, '[{\"key\": \"尺码\", \"value\": \"M\"}, {\"key\": \"颜色\", \"value\": \"绿色上衣 西装外套\"}]', '2022-03-02 00:48:23', '2022-03-02 00:48:23');
INSERT INTO `goods_sku` VALUES (6, 1, NULL, 88, 199.00, 199.00, '', NULL, '[{\"key\": \"尺码\", \"value\": \"M\"}, {\"key\": \"颜色\", \"value\": \"粉色套装 外套+裙子\"}]', '2022-03-02 00:48:23', '2022-03-02 00:48:23');
INSERT INTO `goods_sku` VALUES (7, 1, NULL, 86, 199.00, 199.00, '', NULL, '[{\"key\": \"尺码\", \"value\": \"M\"}, {\"key\": \"颜色\", \"value\": \"绿色套装 外套+裙子\"}]', '2022-03-02 00:48:23', '2022-03-02 00:48:23');
INSERT INTO `goods_sku` VALUES (8, 1, NULL, 88, 197.00, 199.00, '', NULL, '[{\"key\": \"尺码\", \"value\": \"M\"}, {\"key\": \"颜色\", \"value\": \"粉色上衣 西装外套\"}]', '2022-03-02 00:48:23', '2022-03-02 00:48:23');
INSERT INTO `goods_sku` VALUES (9, 1, NULL, 888, 199.00, 199.00, '', NULL, '[{\"key\": \"尺码\", \"value\": \"L\"}, {\"key\": \"颜色\", \"value\": \"粉色套装 外套+裙子\"}]', '2022-03-02 00:48:23', '2022-03-02 00:48:23');
INSERT INTO `goods_sku` VALUES (10, 1, NULL, 888, 199.00, 199.00, '', NULL, '[{\"key\": \"尺码\", \"value\": \"L\"}, {\"key\": \"颜色\", \"value\": \"绿色套装 外套+裙子\"}]', '2022-03-02 00:48:23', '2022-03-02 00:48:23');
INSERT INTO `goods_sku` VALUES (11, 1, NULL, 88, 199.00, 199.00, '', NULL, '[{\"key\": \"尺码\", \"value\": \"L\"}, {\"key\": \"颜色\", \"value\": \"粉色上衣 西装外套\"}]', '2022-03-02 00:48:23', '2022-03-02 00:48:23');
INSERT INTO `goods_sku` VALUES (12, 1, NULL, 88, 199.00, 199.00, '', NULL, '[{\"key\": \"尺码\", \"value\": \"L\"}, {\"key\": \"颜色\", \"value\": \"绿色上衣 西装外套\"}]', '2022-03-02 00:48:23', '2022-03-02 00:48:23');
INSERT INTO `goods_sku` VALUES (13, 2, NULL, 200, 59.50, 99.00, '', NULL, '[{\"key\": \"尺码\", \"value\": \"M\"}, {\"key\": \"颜色\", \"value\": \"白色\"}]', '2022-03-03 22:54:04', '2022-03-03 22:54:04');
INSERT INTO `goods_sku` VALUES (14, 2, NULL, 200, 59.50, 99.00, '', NULL, '[{\"key\": \"尺码\", \"value\": \"M\"}, {\"key\": \"颜色\", \"value\": \"黑色\"}]', '2022-03-03 22:54:04', '2022-03-03 22:54:04');
INSERT INTO `goods_sku` VALUES (15, 2, NULL, 200, 59.50, 99.00, '', NULL, '[{\"key\": \"尺码\", \"value\": \"L\"}, {\"key\": \"颜色\", \"value\": \"白色\"}]', '2022-03-03 22:54:04', '2022-03-03 22:54:04');
INSERT INTO `goods_sku` VALUES (16, 2, NULL, 200, 59.50, 99.00, '', NULL, '[{\"key\": \"尺码\", \"value\": \"XXL\"}, {\"key\": \"颜色\", \"value\": \"白色\"}]', '2022-03-03 22:54:04', '2022-03-03 22:54:04');
INSERT INTO `goods_sku` VALUES (17, 2, NULL, 200, 59.50, 99.00, '', NULL, '[{\"key\": \"尺码\", \"value\": \"XL\"}, {\"key\": \"颜色\", \"value\": \"黑色\"}]', '2022-03-03 22:54:04', '2022-03-03 22:54:04');
INSERT INTO `goods_sku` VALUES (18, 2, NULL, 200, 59.50, 99.00, '', NULL, '[{\"key\": \"尺码\", \"value\": \"L\"}, {\"key\": \"颜色\", \"value\": \"黑色\"}]', '2022-03-03 22:54:04', '2022-03-03 22:54:04');
INSERT INTO `goods_sku` VALUES (19, 2, NULL, 200, 59.50, 99.00, '', NULL, '[{\"key\": \"尺码\", \"value\": \"XL\"}, {\"key\": \"颜色\", \"value\": \"白色\"}]', '2022-03-03 22:54:04', '2022-03-03 22:54:04');
INSERT INTO `goods_sku` VALUES (20, 2, NULL, 200, 59.50, 99.00, '', NULL, '[{\"key\": \"尺码\", \"value\": \"XXL\"}, {\"key\": \"颜色\", \"value\": \"黑色\"}]', '2022-03-03 22:54:04', '2022-03-03 22:54:04');
INSERT INTO `goods_sku` VALUES (21, 3, NULL, 400, 69.89, 120.00, '', NULL, '[{\"key\": \"颜色\", \"value\": \"黑色\"}, {\"key\": \"尺码\", \"value\": \"S\"}]', '2022-03-03 22:57:54', '2022-03-03 22:57:54');
INSERT INTO `goods_sku` VALUES (22, 3, NULL, 400, 69.89, 120.00, '', NULL, '[{\"key\": \"颜色\", \"value\": \"黑色\"}, {\"key\": \"尺码\", \"value\": \"M\"}]', '2022-03-03 22:57:54', '2022-03-03 22:57:54');
INSERT INTO `goods_sku` VALUES (23, 3, NULL, 400, 69.89, 120.00, '', NULL, '[{\"key\": \"颜色\", \"value\": \"黑色\"}, {\"key\": \"尺码\", \"value\": \"L\"}]', '2022-03-03 22:57:54', '2022-03-03 22:57:54');
INSERT INTO `goods_sku` VALUES (24, 3, NULL, 400, 69.89, 120.00, '', NULL, '[{\"key\": \"颜色\", \"value\": \"黑色\"}, {\"key\": \"尺码\", \"value\": \"XL\"}]', '2022-03-03 22:57:54', '2022-03-03 22:57:54');
INSERT INTO `goods_sku` VALUES (25, 4, NULL, 200, 39.90, 99.00, '', NULL, '[{\"key\": \"颜色\", \"value\": \"杏色\"}, {\"key\": \"尺码\", \"value\": \"L\"}]', '2022-03-03 23:17:46', '2022-03-03 23:17:46');
INSERT INTO `goods_sku` VALUES (26, 4, NULL, 200, 39.90, 99.00, '', NULL, '[{\"key\": \"颜色\", \"value\": \"香槟色\"}, {\"key\": \"尺码\", \"value\": \"L\"}]', '2022-03-03 23:17:46', '2022-03-03 23:17:46');
INSERT INTO `goods_sku` VALUES (27, 4, NULL, 200, 39.90, 99.00, '', NULL, '[{\"key\": \"颜色\", \"value\": \"灰色\"}, {\"key\": \"尺码\", \"value\": \"L\"}]', '2022-03-03 23:17:46', '2022-03-03 23:17:46');
INSERT INTO `goods_sku` VALUES (28, 4, NULL, 200, 39.90, 99.00, '', NULL, '[{\"key\": \"颜色\", \"value\": \"黑色\"}, {\"key\": \"尺码\", \"value\": \"L\"}]', '2022-03-03 23:17:46', '2022-03-03 23:17:46');
INSERT INTO `goods_sku` VALUES (29, 5, NULL, 333, 39.90, 69.00, '', NULL, '[{\"key\": \"颜色\", \"value\": \"黑色\"}, {\"key\": \"尺码\", \"value\": \"S\"}]', '2022-03-04 00:02:45', '2022-03-04 00:02:45');
INSERT INTO `goods_sku` VALUES (30, 5, NULL, 333, 39.90, 69.00, '', NULL, '[{\"key\": \"颜色\", \"value\": \"黑色\"}, {\"key\": \"尺码\", \"value\": \"M\"}]', '2022-03-04 00:02:45', '2022-03-04 00:02:45');
INSERT INTO `goods_sku` VALUES (31, 5, NULL, 333, 39.90, 69.00, '', NULL, '[{\"key\": \"颜色\", \"value\": \"黑色\"}, {\"key\": \"尺码\", \"value\": \"XL\"}]', '2022-03-04 00:02:45', '2022-03-04 00:02:45');
INSERT INTO `goods_sku` VALUES (32, 5, NULL, 333, 39.90, 69.00, '', NULL, '[{\"key\": \"颜色\", \"value\": \"黑色\"}, {\"key\": \"尺码\", \"value\": \"L\"}]', '2022-03-04 00:02:45', '2022-03-04 00:02:45');
INSERT INTO `goods_sku` VALUES (33, 5, NULL, 333, 39.90, 69.00, '', NULL, '[{\"key\": \"颜色\", \"value\": \"黑色\"}, {\"key\": \"尺码\", \"value\": \"XXL\"}]', '2022-03-04 00:02:45', '2022-03-04 00:02:45');
INSERT INTO `goods_sku` VALUES (34, 5, NULL, 333, 39.90, 69.00, '', NULL, '[{\"key\": \"颜色\", \"value\": \"白色\"}, {\"key\": \"尺码\", \"value\": \"S\"}]', '2022-03-04 00:02:45', '2022-03-04 00:02:45');
INSERT INTO `goods_sku` VALUES (35, 5, NULL, 333, 39.90, 69.00, '', NULL, '[{\"key\": \"颜色\", \"value\": \"白色\"}, {\"key\": \"尺码\", \"value\": \"M\"}]', '2022-03-04 00:02:45', '2022-03-04 00:02:45');
INSERT INTO `goods_sku` VALUES (36, 5, NULL, 333, 39.90, 69.00, '', NULL, '[{\"key\": \"颜色\", \"value\": \"白色\"}, {\"key\": \"尺码\", \"value\": \"L\"}]', '2022-03-04 00:02:45', '2022-03-04 00:02:45');
INSERT INTO `goods_sku` VALUES (37, 5, NULL, 333, 39.90, 69.00, '', NULL, '[{\"key\": \"颜色\", \"value\": \"黑色\"}, {\"key\": \"尺码\", \"value\": \"均码\"}]', '2022-03-04 00:02:45', '2022-03-04 00:02:45');
INSERT INTO `goods_sku` VALUES (38, 5, NULL, 333, 39.90, 69.00, '', NULL, '[{\"key\": \"颜色\", \"value\": \"白色\"}, {\"key\": \"尺码\", \"value\": \"XL\"}]', '2022-03-04 00:02:45', '2022-03-04 00:02:45');
INSERT INTO `goods_sku` VALUES (39, 5, NULL, 333, 39.90, 69.00, '', NULL, '[{\"key\": \"颜色\", \"value\": \"白色\"}, {\"key\": \"尺码\", \"value\": \"XXL\"}]', '2022-03-04 00:02:45', '2022-03-04 00:02:45');
INSERT INTO `goods_sku` VALUES (40, 5, NULL, 333, 39.90, 69.00, '', NULL, '[{\"key\": \"颜色\", \"value\": \"白色\"}, {\"key\": \"尺码\", \"value\": \"均码\"}]', '2022-03-04 00:02:45', '2022-03-04 00:02:45');
INSERT INTO `goods_sku` VALUES (41, 6, NULL, 300, 59.00, 89.00, '', NULL, '[{\"key\": \"尺码\", \"value\": \"36\"}, {\"key\": \"颜色\", \"value\": \"黑色\"}]', '2022-03-05 12:58:49', '2022-03-05 12:58:49');
INSERT INTO `goods_sku` VALUES (42, 6, NULL, 300, 59.00, 89.00, '', NULL, '[{\"key\": \"尺码\", \"value\": \"37\"}, {\"key\": \"颜色\", \"value\": \"黑色\"}]', '2022-03-05 12:58:49', '2022-03-05 12:58:49');
INSERT INTO `goods_sku` VALUES (43, 6, NULL, 300, 59.00, 89.00, '', NULL, '[{\"key\": \"尺码\", \"value\": \"36\"}, {\"key\": \"颜色\", \"value\": \"白色\"}]', '2022-03-05 12:58:49', '2022-03-05 12:58:49');
INSERT INTO `goods_sku` VALUES (44, 6, NULL, 300, 59.00, 89.00, '', NULL, '[{\"key\": \"尺码\", \"value\": \"39\"}, {\"key\": \"颜色\", \"value\": \"黑色\"}]', '2022-03-05 12:58:49', '2022-03-05 12:58:49');
INSERT INTO `goods_sku` VALUES (45, 6, NULL, 300, 59.00, 89.00, '', NULL, '[{\"key\": \"尺码\", \"value\": \"37\"}, {\"key\": \"颜色\", \"value\": \"白色\"}]', '2022-03-05 12:58:49', '2022-03-05 12:58:49');
INSERT INTO `goods_sku` VALUES (46, 6, NULL, 300, 59.00, 89.00, '', NULL, '[{\"key\": \"尺码\", \"value\": \"38\"}, {\"key\": \"颜色\", \"value\": \"黑色\"}]', '2022-03-05 12:58:49', '2022-03-05 12:58:49');
INSERT INTO `goods_sku` VALUES (47, 6, NULL, 300, 59.00, 89.00, '', NULL, '[{\"key\": \"尺码\", \"value\": \"38\"}, {\"key\": \"颜色\", \"value\": \"白色\"}]', '2022-03-05 12:58:49', '2022-03-05 12:58:49');
INSERT INTO `goods_sku` VALUES (48, 6, NULL, 300, 59.00, 89.00, '', NULL, '[{\"key\": \"尺码\", \"value\": \"39\"}, {\"key\": \"颜色\", \"value\": \"白色\"}]', '2022-03-05 12:58:49', '2022-03-05 12:58:49');
INSERT INTO `goods_sku` VALUES (49, 6, NULL, 300, 59.00, 89.00, '', NULL, '[{\"key\": \"尺码\", \"value\": \"40\"}, {\"key\": \"颜色\", \"value\": \"黑色\"}]', '2022-03-05 12:58:49', '2022-03-05 12:58:49');
INSERT INTO `goods_sku` VALUES (50, 6, NULL, 300, 59.00, 89.00, '', NULL, '[{\"key\": \"尺码\", \"value\": \"40\"}, {\"key\": \"颜色\", \"value\": \"白色\"}]', '2022-03-05 12:58:49', '2022-03-05 12:58:49');
INSERT INTO `goods_sku` VALUES (51, 7, NULL, 200, 48.90, 99.00, '', NULL, '[{\"key\": \"颜色\", \"value\": \"白色\"}, {\"key\": \"尺码\", \"value\": \"XL\"}]', '2022-03-05 13:31:47', '2022-03-05 13:31:47');
INSERT INTO `goods_sku` VALUES (52, 7, NULL, 200, 48.90, 99.00, '', NULL, '[{\"key\": \"颜色\", \"value\": \"白色\"}, {\"key\": \"尺码\", \"value\": \"L\"}]', '2022-03-05 13:31:47', '2022-03-05 13:31:47');
INSERT INTO `goods_sku` VALUES (53, 7, NULL, 200, 48.90, 99.00, '', NULL, '[{\"key\": \"颜色\", \"value\": \"白色\"}, {\"key\": \"尺码\", \"value\": \"XXL\"}]', '2022-03-05 13:31:47', '2022-03-05 13:31:47');
INSERT INTO `goods_sku` VALUES (54, 7, NULL, 200, 48.90, 99.00, '', NULL, '[{\"key\": \"颜色\", \"value\": \"白色\"}, {\"key\": \"尺码\", \"value\": \"M\"}]', '2022-03-05 13:31:47', '2022-03-05 13:31:47');
INSERT INTO `goods_sku` VALUES (55, 7, NULL, 200, 48.90, 99.00, '', NULL, '[{\"key\": \"颜色\", \"value\": \"杏色\"}, {\"key\": \"尺码\", \"value\": \"XXL\"}]', '2022-03-05 13:31:47', '2022-03-05 13:31:47');
INSERT INTO `goods_sku` VALUES (56, 7, NULL, 200, 48.90, 99.00, '', NULL, '[{\"key\": \"颜色\", \"value\": \"杏色\"}, {\"key\": \"尺码\", \"value\": \"XL\"}]', '2022-03-05 13:31:47', '2022-03-05 13:31:47');
INSERT INTO `goods_sku` VALUES (57, 7, NULL, 200, 48.90, 99.00, '', NULL, '[{\"key\": \"颜色\", \"value\": \"杏色\"}, {\"key\": \"尺码\", \"value\": \"L\"}]', '2022-03-05 13:31:47', '2022-03-05 13:31:47');
INSERT INTO `goods_sku` VALUES (58, 7, NULL, 200, 48.90, 99.00, '', NULL, '[{\"key\": \"颜色\", \"value\": \"杏色\"}, {\"key\": \"尺码\", \"value\": \"M\"}]', '2022-03-05 13:31:47', '2022-03-05 13:31:47');
INSERT INTO `goods_sku` VALUES (59, 7, NULL, 200, 48.90, 99.00, '', NULL, '[{\"key\": \"颜色\", \"value\": \"黑色\"}, {\"key\": \"尺码\", \"value\": \"XL\"}]', '2022-03-05 13:31:47', '2022-03-05 13:31:47');
INSERT INTO `goods_sku` VALUES (60, 7, NULL, 200, 48.90, 99.00, '', NULL, '[{\"key\": \"颜色\", \"value\": \"黑色\"}, {\"key\": \"尺码\", \"value\": \"L\"}]', '2022-03-05 13:31:47', '2022-03-05 13:31:47');
INSERT INTO `goods_sku` VALUES (61, 7, NULL, 200, 48.90, 99.00, '', NULL, '[{\"key\": \"颜色\", \"value\": \"黑色\"}, {\"key\": \"尺码\", \"value\": \"M\"}]', '2022-03-05 13:31:47', '2022-03-05 13:31:47');
INSERT INTO `goods_sku` VALUES (62, 7, NULL, 200, 48.90, 99.00, '', NULL, '[{\"key\": \"颜色\", \"value\": \"黑色\"}, {\"key\": \"尺码\", \"value\": \"XXL\"}]', '2022-03-05 13:31:47', '2022-03-05 13:31:47');
INSERT INTO `goods_sku` VALUES (63, 7, NULL, 200, 48.90, 99.00, '', NULL, '[{\"key\": \"颜色\", \"value\": \"灰色\"}, {\"key\": \"尺码\", \"value\": \"XL\"}]', '2022-03-05 13:31:47', '2022-03-05 13:31:47');
INSERT INTO `goods_sku` VALUES (64, 7, NULL, 200, 48.90, 99.00, '', NULL, '[{\"key\": \"颜色\", \"value\": \"灰色\"}, {\"key\": \"尺码\", \"value\": \"L\"}]', '2022-03-05 13:31:47', '2022-03-05 13:31:47');
INSERT INTO `goods_sku` VALUES (65, 7, NULL, 200, 48.90, 99.00, '', NULL, '[{\"key\": \"颜色\", \"value\": \"灰色\"}, {\"key\": \"尺码\", \"value\": \"M\"}]', '2022-03-05 13:31:47', '2022-03-05 13:31:47');
INSERT INTO `goods_sku` VALUES (66, 7, NULL, 200, 48.90, 99.00, '', NULL, '[{\"key\": \"颜色\", \"value\": \"灰色\"}, {\"key\": \"尺码\", \"value\": \"XXL\"}]', '2022-03-05 13:31:47', '2022-03-05 13:31:47');
INSERT INTO `goods_sku` VALUES (67, 8, NULL, 200, 38.00, 88.00, '', NULL, '[{\"key\": \"颜色\", \"value\": \"白色\"}, {\"key\": \"尺码\", \"value\": \"均码\"}]', '2022-03-05 13:37:49', '2022-03-05 13:37:49');
INSERT INTO `goods_sku` VALUES (68, 8, NULL, 200, 38.00, 88.00, '', NULL, '[{\"key\": \"颜色\", \"value\": \"灰色\"}, {\"key\": \"尺码\", \"value\": \"均码\"}]', '2022-03-05 13:37:49', '2022-03-05 13:37:49');
INSERT INTO `goods_sku` VALUES (69, 8, NULL, 200, 38.00, 88.00, '', NULL, '[{\"key\": \"颜色\", \"value\": \"黑色\"}, {\"key\": \"尺码\", \"value\": \"均码\"}]', '2022-03-05 13:37:49', '2022-03-05 13:37:49');
INSERT INTO `goods_sku` VALUES (70, 9, NULL, 200, 38.00, 69.00, '', NULL, '[{\"key\": \"颜色\", \"value\": \"黑色\"}, {\"key\": \"尺码\", \"value\": \"M\"}]', '2022-03-05 13:41:41', '2022-03-05 13:41:41');
INSERT INTO `goods_sku` VALUES (71, 9, NULL, 200, 38.00, 69.00, '', NULL, '[{\"key\": \"颜色\", \"value\": \"黑色\"}, {\"key\": \"尺码\", \"value\": \"S\"}]', '2022-03-05 13:41:41', '2022-03-05 13:41:41');
INSERT INTO `goods_sku` VALUES (72, 9, NULL, 200, 38.00, 69.00, '', NULL, '[{\"key\": \"颜色\", \"value\": \"白色\"}, {\"key\": \"尺码\", \"value\": \"M\"}]', '2022-03-05 13:41:41', '2022-03-05 13:41:41');
INSERT INTO `goods_sku` VALUES (73, 9, NULL, 200, 38.00, 69.00, '', NULL, '[{\"key\": \"颜色\", \"value\": \"黑色\"}, {\"key\": \"尺码\", \"value\": \"XL\"}]', '2022-03-05 13:41:41', '2022-03-05 13:41:41');
INSERT INTO `goods_sku` VALUES (74, 9, NULL, 200, 38.00, 69.00, '', NULL, '[{\"key\": \"颜色\", \"value\": \"黑色\"}, {\"key\": \"尺码\", \"value\": \"L\"}]', '2022-03-05 13:41:41', '2022-03-05 13:41:41');
INSERT INTO `goods_sku` VALUES (75, 9, NULL, 200, 38.00, 69.00, '', NULL, '[{\"key\": \"颜色\", \"value\": \"白色\"}, {\"key\": \"尺码\", \"value\": \"L\"}]', '2022-03-05 13:41:41', '2022-03-05 13:41:41');
INSERT INTO `goods_sku` VALUES (76, 9, NULL, 200, 38.00, 69.00, '', NULL, '[{\"key\": \"颜色\", \"value\": \"白色\"}, {\"key\": \"尺码\", \"value\": \"XL\"}]', '2022-03-05 13:41:41', '2022-03-05 13:41:41');
INSERT INTO `goods_sku` VALUES (77, 9, NULL, 200, 38.00, 69.00, '', NULL, '[{\"key\": \"颜色\", \"value\": \"白色\"}, {\"key\": \"尺码\", \"value\": \"S\"}]', '2022-03-05 13:41:41', '2022-03-05 13:41:41');
INSERT INTO `goods_sku` VALUES (78, 10, NULL, 30, 30.00, 49.00, '', NULL, '[{\"key\": \"颜色\", \"value\": \"白色\"}, {\"key\": \"尺码\", \"value\": \"均码\"}]', '2022-03-05 13:44:12', '2022-03-05 13:44:12');
INSERT INTO `goods_sku` VALUES (79, 10, NULL, 500, 30.00, 49.00, '', NULL, '[{\"key\": \"颜色\", \"value\": \"黑色\"}, {\"key\": \"尺码\", \"value\": \"均码\"}]', '2022-03-05 13:44:12', '2022-03-05 13:44:12');
INSERT INTO `goods_sku` VALUES (80, 11, NULL, 200, 49.00, 99.00, '', NULL, '[{\"key\": \"颜色\", \"value\": \"白色\"}, {\"key\": \"尺码\", \"value\": \"XL\"}]', '2022-03-05 13:47:13', '2022-03-05 13:47:13');
INSERT INTO `goods_sku` VALUES (81, 11, NULL, 200, 49.00, 99.00, '', NULL, '[{\"key\": \"颜色\", \"value\": \"白色\"}, {\"key\": \"尺码\", \"value\": \"L\"}]', '2022-03-05 13:47:13', '2022-03-05 13:47:13');
INSERT INTO `goods_sku` VALUES (82, 11, NULL, 200, 49.00, 99.00, '', NULL, '[{\"key\": \"颜色\", \"value\": \"黑色\"}, {\"key\": \"尺码\", \"value\": \"L\"}]', '2022-03-05 13:47:13', '2022-03-05 13:47:13');
INSERT INTO `goods_sku` VALUES (83, 11, NULL, 200, 49.00, 99.00, '', NULL, '[{\"key\": \"颜色\", \"value\": \"白色\"}, {\"key\": \"尺码\", \"value\": \"XXL\"}]', '2022-03-05 13:47:13', '2022-03-05 13:47:13');
INSERT INTO `goods_sku` VALUES (84, 11, NULL, 200, 49.00, 99.00, '', NULL, '[{\"key\": \"颜色\", \"value\": \"白色\"}, {\"key\": \"尺码\", \"value\": \"M\"}]', '2022-03-05 13:47:13', '2022-03-05 13:47:13');
INSERT INTO `goods_sku` VALUES (85, 11, NULL, 200, 49.00, 99.00, '', NULL, '[{\"key\": \"颜色\", \"value\": \"黑色\"}, {\"key\": \"尺码\", \"value\": \"XL\"}]', '2022-03-05 13:47:13', '2022-03-05 13:47:13');
INSERT INTO `goods_sku` VALUES (86, 11, NULL, 200, 49.00, 99.00, '', NULL, '[{\"key\": \"颜色\", \"value\": \"黑色\"}, {\"key\": \"尺码\", \"value\": \"M\"}]', '2022-03-05 13:47:13', '2022-03-05 13:47:13');
INSERT INTO `goods_sku` VALUES (87, 11, NULL, 200, 49.00, 99.00, '', NULL, '[{\"key\": \"颜色\", \"value\": \"黑色\"}, {\"key\": \"尺码\", \"value\": \"XXL\"}]', '2022-03-05 13:47:13', '2022-03-05 13:47:13');
INSERT INTO `goods_sku` VALUES (88, 12, NULL, 100, 59.00, 99.00, '', NULL, '[{\"key\": \"尺码\", \"value\": \"M\"}, {\"key\": \"颜色\", \"value\": \"白色\"}]', '2022-03-05 13:51:10', '2022-03-05 13:51:10');
INSERT INTO `goods_sku` VALUES (89, 12, NULL, 100, 59.00, 99.00, '', NULL, '[{\"key\": \"尺码\", \"value\": \"M\"}, {\"key\": \"颜色\", \"value\": \"黑色\"}]', '2022-03-05 13:51:10', '2022-03-05 13:51:10');
INSERT INTO `goods_sku` VALUES (90, 12, NULL, 100, 59.00, 99.00, '', NULL, '[{\"key\": \"尺码\", \"value\": \"L\"}, {\"key\": \"颜色\", \"value\": \"灰色\"}]', '2022-03-05 13:51:10', '2022-03-05 13:51:10');
INSERT INTO `goods_sku` VALUES (91, 12, NULL, 100, 59.00, 99.00, '', NULL, '[{\"key\": \"尺码\", \"value\": \"M\"}, {\"key\": \"颜色\", \"value\": \"灰色\"}]', '2022-03-05 13:51:10', '2022-03-05 13:51:10');
INSERT INTO `goods_sku` VALUES (92, 12, NULL, 100, 59.00, 99.00, '', NULL, '[{\"key\": \"尺码\", \"value\": \"L\"}, {\"key\": \"颜色\", \"value\": \"黑色\"}]', '2022-03-05 13:51:10', '2022-03-05 13:51:10');
INSERT INTO `goods_sku` VALUES (93, 12, NULL, 100, 59.00, 99.00, '', NULL, '[{\"key\": \"尺码\", \"value\": \"L\"}, {\"key\": \"颜色\", \"value\": \"白色\"}]', '2022-03-05 13:51:10', '2022-03-05 13:51:10');
INSERT INTO `goods_sku` VALUES (94, 12, NULL, 100, 59.00, 99.00, '', NULL, '[{\"key\": \"尺码\", \"value\": \"XL\"}, {\"key\": \"颜色\", \"value\": \"白色\"}]', '2022-03-05 13:51:11', '2022-03-05 13:51:11');
INSERT INTO `goods_sku` VALUES (95, 12, NULL, 100, 59.00, 99.00, '', NULL, '[{\"key\": \"尺码\", \"value\": \"XL\"}, {\"key\": \"颜色\", \"value\": \"黑色\"}]', '2022-03-05 13:51:11', '2022-03-05 13:51:11');
INSERT INTO `goods_sku` VALUES (96, 12, NULL, 100, 59.00, 99.00, '', NULL, '[{\"key\": \"尺码\", \"value\": \"XL\"}, {\"key\": \"颜色\", \"value\": \"灰色\"}]', '2022-03-05 13:51:11', '2022-03-05 13:51:11');
INSERT INTO `goods_sku` VALUES (97, 13, NULL, 290, 59.00, 99.00, '', NULL, '[{\"key\": \"颜色\", \"value\": \"黑色\"}, {\"key\": \"尺码\", \"value\": \"M\"}]', '2022-03-05 13:55:21', '2022-03-05 13:55:21');
INSERT INTO `goods_sku` VALUES (98, 13, NULL, 290, 59.00, 99.00, '', NULL, '[{\"key\": \"颜色\", \"value\": \"黑色\"}, {\"key\": \"尺码\", \"value\": \"L\"}]', '2022-03-05 13:55:21', '2022-03-05 13:55:21');
INSERT INTO `goods_sku` VALUES (99, 13, NULL, 290, 59.00, 99.00, '', NULL, '[{\"key\": \"颜色\", \"value\": \"白色\"}, {\"key\": \"尺码\", \"value\": \"L\"}]', '2022-03-05 13:55:21', '2022-03-05 13:55:21');
INSERT INTO `goods_sku` VALUES (100, 13, NULL, 290, 59.00, 99.00, '', NULL, '[{\"key\": \"颜色\", \"value\": \"白色\"}, {\"key\": \"尺码\", \"value\": \"M\"}]', '2022-03-05 13:55:21', '2022-03-05 13:55:21');
INSERT INTO `goods_sku` VALUES (101, 13, NULL, 290, 59.00, 99.00, '', NULL, '[{\"key\": \"颜色\", \"value\": \"黑色\"}, {\"key\": \"尺码\", \"value\": \"XL\"}]', '2022-03-05 13:55:21', '2022-03-05 13:55:21');
INSERT INTO `goods_sku` VALUES (102, 13, NULL, 290, 59.00, 99.00, '', NULL, '[{\"key\": \"颜色\", \"value\": \"白色\"}, {\"key\": \"尺码\", \"value\": \"XL\"}]', '2022-03-05 13:55:21', '2022-03-05 13:55:21');
INSERT INTO `goods_sku` VALUES (103, 14, NULL, 40, 59.00, 99.00, '', NULL, '[{\"key\": \"尺码\", \"value\": \"43\"}, {\"key\": \"颜色\", \"value\": \"白色\"}]', '2022-03-05 13:58:10', '2022-03-05 13:58:10');
INSERT INTO `goods_sku` VALUES (104, 14, NULL, 40, 59.00, 99.00, '', NULL, '[{\"key\": \"尺码\", \"value\": \"43\"}, {\"key\": \"颜色\", \"value\": \"黑色\"}]', '2022-03-05 13:58:10', '2022-03-05 13:58:10');
INSERT INTO `goods_sku` VALUES (105, 14, NULL, 40, 59.00, 99.00, '', NULL, '[{\"key\": \"尺码\", \"value\": \"42\"}, {\"key\": \"颜色\", \"value\": \"白色\"}]', '2022-03-05 13:58:10', '2022-03-05 13:58:10');
INSERT INTO `goods_sku` VALUES (106, 14, NULL, 40, 59.00, 99.00, '', NULL, '[{\"key\": \"尺码\", \"value\": \"41\"}, {\"key\": \"颜色\", \"value\": \"白色\"}]', '2022-03-05 13:58:10', '2022-03-05 13:58:10');
INSERT INTO `goods_sku` VALUES (107, 14, NULL, 40, 59.00, 99.00, '', NULL, '[{\"key\": \"尺码\", \"value\": \"41\"}, {\"key\": \"颜色\", \"value\": \"黑色\"}]', '2022-03-05 13:58:10', '2022-03-05 13:58:10');
INSERT INTO `goods_sku` VALUES (108, 14, NULL, 40, 59.00, 99.00, '', NULL, '[{\"key\": \"尺码\", \"value\": \"40\"}, {\"key\": \"颜色\", \"value\": \"黑色\"}]', '2022-03-05 13:58:10', '2022-03-05 13:58:10');
INSERT INTO `goods_sku` VALUES (109, 14, NULL, 40, 59.00, 99.00, '', NULL, '[{\"key\": \"尺码\", \"value\": \"39\"}, {\"key\": \"颜色\", \"value\": \"白色\"}]', '2022-03-05 13:58:10', '2022-03-05 13:58:10');
INSERT INTO `goods_sku` VALUES (110, 14, NULL, 40, 59.00, 99.00, '', NULL, '[{\"key\": \"尺码\", \"value\": \"40\"}, {\"key\": \"颜色\", \"value\": \"白色\"}]', '2022-03-05 13:58:10', '2022-03-05 13:58:10');
INSERT INTO `goods_sku` VALUES (111, 14, NULL, 40, 59.00, 99.00, '', NULL, '[{\"key\": \"尺码\", \"value\": \"42\"}, {\"key\": \"颜色\", \"value\": \"黑色\"}]', '2022-03-05 13:58:10', '2022-03-05 13:58:10');
INSERT INTO `goods_sku` VALUES (112, 14, NULL, 40, 59.00, 99.00, '', NULL, '[{\"key\": \"尺码\", \"value\": \"39\"}, {\"key\": \"颜色\", \"value\": \"黑色\"}]', '2022-03-05 13:58:10', '2022-03-05 13:58:10');
INSERT INTO `goods_sku` VALUES (113, 15, NULL, 300, 59.00, 89.00, '', NULL, '[{\"key\": \"尺码\", \"value\": \"36\"}, {\"key\": \"颜色\", \"value\": \"黑色\"}]', '2022-03-06 00:49:14', '2022-03-06 00:49:14');
INSERT INTO `goods_sku` VALUES (114, 15, NULL, 300, 59.00, 89.00, '', NULL, '[{\"key\": \"尺码\", \"value\": \"36\"}, {\"key\": \"颜色\", \"value\": \"白色\"}]', '2022-03-06 00:49:14', '2022-03-06 00:49:14');
INSERT INTO `goods_sku` VALUES (115, 15, NULL, 300, 59.00, 89.00, '', NULL, '[{\"key\": \"尺码\", \"value\": \"37\"}, {\"key\": \"颜色\", \"value\": \"黑色\"}]', '2022-03-06 00:49:14', '2022-03-06 00:49:14');
INSERT INTO `goods_sku` VALUES (116, 15, NULL, 300, 59.00, 89.00, '', NULL, '[{\"key\": \"尺码\", \"value\": \"38\"}, {\"key\": \"颜色\", \"value\": \"白色\"}]', '2022-03-06 00:49:14', '2022-03-06 00:49:14');
INSERT INTO `goods_sku` VALUES (117, 15, NULL, 300, 59.00, 89.00, '', NULL, '[{\"key\": \"尺码\", \"value\": \"37\"}, {\"key\": \"颜色\", \"value\": \"白色\"}]', '2022-03-06 00:49:14', '2022-03-06 00:49:14');
INSERT INTO `goods_sku` VALUES (118, 15, NULL, 300, 59.00, 89.00, '', NULL, '[{\"key\": \"尺码\", \"value\": \"38\"}, {\"key\": \"颜色\", \"value\": \"黑色\"}]', '2022-03-06 00:49:14', '2022-03-06 00:49:14');
INSERT INTO `goods_sku` VALUES (119, 15, NULL, 300, 59.00, 89.00, '', NULL, '[{\"key\": \"尺码\", \"value\": \"39\"}, {\"key\": \"颜色\", \"value\": \"白色\"}]', '2022-03-06 00:49:14', '2022-03-06 00:49:14');
INSERT INTO `goods_sku` VALUES (120, 15, NULL, 300, 59.00, 89.00, '', NULL, '[{\"key\": \"尺码\", \"value\": \"40\"}, {\"key\": \"颜色\", \"value\": \"黑色\"}]', '2022-03-06 00:49:14', '2022-03-06 00:49:14');
INSERT INTO `goods_sku` VALUES (121, 15, NULL, 300, 59.00, 89.00, '', NULL, '[{\"key\": \"尺码\", \"value\": \"39\"}, {\"key\": \"颜色\", \"value\": \"黑色\"}]', '2022-03-06 00:49:14', '2022-03-06 00:49:14');
INSERT INTO `goods_sku` VALUES (122, 15, NULL, 300, 59.00, 89.00, '', NULL, '[{\"key\": \"尺码\", \"value\": \"40\"}, {\"key\": \"颜色\", \"value\": \"白色\"}]', '2022-03-06 00:49:14', '2022-03-06 00:49:14');
INSERT INTO `goods_sku` VALUES (123, 16, NULL, 300, 59.00, 89.00, '', NULL, '[{\"key\": \"尺码\", \"value\": \"36\"}, {\"key\": \"颜色\", \"value\": \"黑色\"}]', '2022-03-06 00:49:25', '2022-03-06 00:49:25');
INSERT INTO `goods_sku` VALUES (124, 16, NULL, 300, 59.00, 89.00, '', NULL, '[{\"key\": \"尺码\", \"value\": \"36\"}, {\"key\": \"颜色\", \"value\": \"白色\"}]', '2022-03-06 00:49:25', '2022-03-06 00:49:25');
INSERT INTO `goods_sku` VALUES (125, 16, NULL, 300, 59.00, 89.00, '', NULL, '[{\"key\": \"尺码\", \"value\": \"37\"}, {\"key\": \"颜色\", \"value\": \"黑色\"}]', '2022-03-06 00:49:25', '2022-03-06 00:49:25');
INSERT INTO `goods_sku` VALUES (126, 16, NULL, 300, 59.00, 89.00, '', NULL, '[{\"key\": \"尺码\", \"value\": \"38\"}, {\"key\": \"颜色\", \"value\": \"黑色\"}]', '2022-03-06 00:49:25', '2022-03-06 00:49:25');
INSERT INTO `goods_sku` VALUES (127, 16, NULL, 300, 59.00, 89.00, '', NULL, '[{\"key\": \"尺码\", \"value\": \"37\"}, {\"key\": \"颜色\", \"value\": \"白色\"}]', '2022-03-06 00:49:25', '2022-03-06 00:49:25');
INSERT INTO `goods_sku` VALUES (128, 16, NULL, 300, 59.00, 89.00, '', NULL, '[{\"key\": \"尺码\", \"value\": \"38\"}, {\"key\": \"颜色\", \"value\": \"白色\"}]', '2022-03-06 00:49:25', '2022-03-06 00:49:25');
INSERT INTO `goods_sku` VALUES (129, 16, NULL, 300, 59.00, 89.00, '', NULL, '[{\"key\": \"尺码\", \"value\": \"39\"}, {\"key\": \"颜色\", \"value\": \"黑色\"}]', '2022-03-06 00:49:25', '2022-03-06 00:49:25');
INSERT INTO `goods_sku` VALUES (130, 16, NULL, 300, 59.00, 89.00, '', NULL, '[{\"key\": \"尺码\", \"value\": \"39\"}, {\"key\": \"颜色\", \"value\": \"白色\"}]', '2022-03-06 00:49:25', '2022-03-06 00:49:25');
INSERT INTO `goods_sku` VALUES (131, 16, NULL, 300, 59.00, 89.00, '', NULL, '[{\"key\": \"尺码\", \"value\": \"40\"}, {\"key\": \"颜色\", \"value\": \"黑色\"}]', '2022-03-06 00:49:25', '2022-03-06 00:49:25');
INSERT INTO `goods_sku` VALUES (132, 16, NULL, 300, 59.00, 89.00, '', NULL, '[{\"key\": \"尺码\", \"value\": \"40\"}, {\"key\": \"颜色\", \"value\": \"白色\"}]', '2022-03-06 00:49:25', '2022-03-06 00:49:25');
INSERT INTO `goods_sku` VALUES (133, 17, NULL, 300, 59.00, 89.00, '', NULL, '[{\"key\": \"尺码\", \"value\": \"36\"}, {\"key\": \"颜色\", \"value\": \"黑色\"}]', '2022-03-06 00:49:35', '2022-03-06 00:49:35');
INSERT INTO `goods_sku` VALUES (134, 17, NULL, 300, 59.00, 89.00, '', NULL, '[{\"key\": \"尺码\", \"value\": \"36\"}, {\"key\": \"颜色\", \"value\": \"白色\"}]', '2022-03-06 00:49:35', '2022-03-06 00:49:35');
INSERT INTO `goods_sku` VALUES (135, 17, NULL, 300, 59.00, 89.00, '', NULL, '[{\"key\": \"尺码\", \"value\": \"39\"}, {\"key\": \"颜色\", \"value\": \"黑色\"}]', '2022-03-06 00:49:35', '2022-03-06 00:49:35');
INSERT INTO `goods_sku` VALUES (136, 17, NULL, 300, 59.00, 89.00, '', NULL, '[{\"key\": \"尺码\", \"value\": \"37\"}, {\"key\": \"颜色\", \"value\": \"黑色\"}]', '2022-03-06 00:49:35', '2022-03-06 00:49:35');
INSERT INTO `goods_sku` VALUES (137, 17, NULL, 300, 59.00, 89.00, '', NULL, '[{\"key\": \"尺码\", \"value\": \"38\"}, {\"key\": \"颜色\", \"value\": \"白色\"}]', '2022-03-06 00:49:35', '2022-03-06 00:49:35');
INSERT INTO `goods_sku` VALUES (138, 17, NULL, 300, 59.00, 89.00, '', NULL, '[{\"key\": \"尺码\", \"value\": \"37\"}, {\"key\": \"颜色\", \"value\": \"白色\"}]', '2022-03-06 00:49:35', '2022-03-06 00:49:35');
INSERT INTO `goods_sku` VALUES (139, 17, NULL, 300, 59.00, 89.00, '', NULL, '[{\"key\": \"尺码\", \"value\": \"38\"}, {\"key\": \"颜色\", \"value\": \"黑色\"}]', '2022-03-06 00:49:35', '2022-03-06 00:49:35');
INSERT INTO `goods_sku` VALUES (140, 17, NULL, 300, 59.00, 89.00, '', NULL, '[{\"key\": \"尺码\", \"value\": \"39\"}, {\"key\": \"颜色\", \"value\": \"白色\"}]', '2022-03-06 00:49:35', '2022-03-06 00:49:35');
INSERT INTO `goods_sku` VALUES (141, 17, NULL, 300, 59.00, 89.00, '', NULL, '[{\"key\": \"尺码\", \"value\": \"40\"}, {\"key\": \"颜色\", \"value\": \"黑色\"}]', '2022-03-06 00:49:35', '2022-03-06 00:49:35');
INSERT INTO `goods_sku` VALUES (142, 17, NULL, 300, 59.00, 89.00, '', NULL, '[{\"key\": \"尺码\", \"value\": \"40\"}, {\"key\": \"颜色\", \"value\": \"白色\"}]', '2022-03-06 00:49:35', '2022-03-06 00:49:35');
INSERT INTO `goods_sku` VALUES (143, 18, NULL, 200, 59.00, 99.00, '', NULL, '[{\"key\": \"颜色\", \"value\": \"蓝色\"}, {\"key\": \"尺码\", \"value\": \"M\"}]', '2022-03-06 00:52:55', '2022-03-06 00:52:55');
INSERT INTO `goods_sku` VALUES (144, 18, NULL, 200, 59.00, 99.00, '', NULL, '[{\"key\": \"颜色\", \"value\": \"蓝色\"}, {\"key\": \"尺码\", \"value\": \"L\"}]', '2022-03-06 00:52:55', '2022-03-06 00:52:55');
INSERT INTO `goods_sku` VALUES (145, 18, NULL, 200, 59.00, 99.00, '', NULL, '[{\"key\": \"颜色\", \"value\": \"红色\"}, {\"key\": \"尺码\", \"value\": \"M\"}]', '2022-03-06 00:52:55', '2022-03-06 00:52:55');
INSERT INTO `goods_sku` VALUES (146, 18, NULL, 200, 59.00, 99.00, '', NULL, '[{\"key\": \"颜色\", \"value\": \"蓝色\"}, {\"key\": \"尺码\", \"value\": \"XL\"}]', '2022-03-06 00:52:55', '2022-03-06 00:52:55');
INSERT INTO `goods_sku` VALUES (147, 18, NULL, 200, 59.00, 99.00, '', NULL, '[{\"key\": \"颜色\", \"value\": \"红色\"}, {\"key\": \"尺码\", \"value\": \"L\"}]', '2022-03-06 00:52:55', '2022-03-06 00:52:55');
INSERT INTO `goods_sku` VALUES (148, 18, NULL, 200, 59.00, 99.00, '', NULL, '[{\"key\": \"颜色\", \"value\": \"红色\"}, {\"key\": \"尺码\", \"value\": \"XL\"}]', '2022-03-06 00:52:55', '2022-03-06 00:52:55');
COMMIT;

-- ----------------------------
-- Table structure for goods_sku_specs
-- ----------------------------
DROP TABLE IF EXISTS `goods_sku_specs`;
CREATE TABLE `goods_sku_specs` (
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `sku_id` int(11) NOT NULL,
  `specs_id` int(11) NOT NULL,
  PRIMARY KEY (`sku_id`,`specs_id`),
  KEY `specs_id` (`specs_id`),
  CONSTRAINT `goods_sku_specs_ibfk_1` FOREIGN KEY (`sku_id`) REFERENCES `goods_sku` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `goods_sku_specs_ibfk_2` FOREIGN KEY (`specs_id`) REFERENCES `specs` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of goods_sku_specs
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for img-map
-- ----------------------------
DROP TABLE IF EXISTS `img-map`;
CREATE TABLE `img-map` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `super_id` int(11) DEFAULT '0' COMMENT '父id',
  `value` varchar(255) NOT NULL COMMENT '文件名字， 只能是英文',
  `desc` varchar(255) DEFAULT NULL COMMENT '描述',
  `layer` int(11) DEFAULT '0' COMMENT '排序0',
  `status` tinyint(1) DEFAULT '0' COMMENT '状态是否使用',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of img-map
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL COMMENT '角色名',
  `desc` varchar(255) DEFAULT NULL COMMENT '介绍，权限说明',
  `super_id` int(11) DEFAULT '0' COMMENT '父id',
  `status` tinyint(1) DEFAULT '0' COMMENT '状态是否使用',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of role
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for shop-cart
-- ----------------------------
DROP TABLE IF EXISTS `shop-cart`;
CREATE TABLE `shop-cart` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `goods_id` int(11) DEFAULT NULL COMMENT '商品id',
  `sku_id` int(11) DEFAULT NULL COMMENT 'skuid',
  `user_id` int(11) NOT NULL,
  `shop_number` int(11) DEFAULT '0' COMMENT '商品数量',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `shop-cart_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `good_user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shop-cart
-- ----------------------------
BEGIN;
INSERT INTO `shop-cart` VALUES (3, 1, 2, 1, 1, '2022-03-03 21:55:30', '2022-03-03 21:55:30');
COMMIT;

-- ----------------------------
-- Table structure for specs
-- ----------------------------
DROP TABLE IF EXISTS `specs`;
CREATE TABLE `specs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL COMMENT '名字',
  `super_id` int(11) DEFAULT '0' COMMENT '父id',
  `desc` varchar(255) DEFAULT '' COMMENT '介绍',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of specs
-- ----------------------------
BEGIN;
INSERT INTO `specs` VALUES (2, 'S', 1, '', '2022-03-02 00:45:12', '2022-03-02 00:45:12');
INSERT INTO `specs` VALUES (3, 'M', 1, '', '2022-03-02 00:45:12', '2022-03-02 00:45:12');
INSERT INTO `specs` VALUES (4, 'L', 1, '', '2022-03-02 00:45:12', '2022-03-02 00:45:12');
INSERT INTO `specs` VALUES (5, '尺码', 0, 'zhe', '2022-03-02 00:45:36', '2022-03-02 00:45:36');
INSERT INTO `specs` VALUES (6, 'S', 5, '', '2022-03-02 00:45:36', '2022-03-02 00:45:36');
INSERT INTO `specs` VALUES (7, 'M', 5, '', '2022-03-02 00:45:36', '2022-03-02 00:45:36');
INSERT INTO `specs` VALUES (8, 'L', 5, '', '2022-03-02 00:45:36', '2022-03-02 00:45:36');
INSERT INTO `specs` VALUES (9, '颜色', 0, 'zhe', '2022-03-02 00:46:25', '2022-03-02 00:46:25');
INSERT INTO `specs` VALUES (10, '粉色套装 外套+裙子', 9, '', '2022-03-02 00:46:25', '2022-03-02 00:46:25');
INSERT INTO `specs` VALUES (11, '绿色套装 外套+裙子', 9, '', '2022-03-02 00:46:25', '2022-03-02 00:46:25');
INSERT INTO `specs` VALUES (12, '粉色上衣 西装外套', 9, '', '2022-03-02 00:46:25', '2022-03-02 00:46:25');
INSERT INTO `specs` VALUES (13, '绿色上衣 西装外套', 9, '', '2022-03-02 00:46:25', '2022-03-02 00:46:25');
INSERT INTO `specs` VALUES (14, 'XL', 5, '', '2022-03-03 22:46:51', '2022-03-03 22:46:51');
INSERT INTO `specs` VALUES (15, 'XXL', 5, '', '2022-03-03 22:46:51', '2022-03-03 22:46:51');
INSERT INTO `specs` VALUES (16, '白色', 9, '', '2022-03-03 22:47:07', '2022-03-03 22:47:07');
INSERT INTO `specs` VALUES (17, '黑色', 9, '', '2022-03-03 22:47:07', '2022-03-03 22:47:07');
INSERT INTO `specs` VALUES (18, '杏色', 9, '', '2022-03-03 23:12:21', '2022-03-03 23:12:21');
INSERT INTO `specs` VALUES (19, '灰色', 9, '', '2022-03-03 23:12:21', '2022-03-03 23:12:21');
INSERT INTO `specs` VALUES (20, '香槟色', 9, '', '2022-03-03 23:12:21', '2022-03-03 23:12:21');
INSERT INTO `specs` VALUES (21, '均码', 5, '', '2022-03-03 23:13:46', '2022-03-03 23:13:46');
INSERT INTO `specs` VALUES (22, '36', 5, '', '2022-03-05 12:56:00', '2022-03-05 12:56:00');
INSERT INTO `specs` VALUES (23, '37', 5, '', '2022-03-05 12:56:00', '2022-03-05 12:56:00');
INSERT INTO `specs` VALUES (24, '38', 5, '', '2022-03-05 12:56:00', '2022-03-05 12:56:00');
INSERT INTO `specs` VALUES (25, '39', 5, '', '2022-03-05 12:56:00', '2022-03-05 12:56:00');
INSERT INTO `specs` VALUES (26, '40', 5, '', '2022-03-05 12:56:00', '2022-03-05 12:56:00');
INSERT INTO `specs` VALUES (27, '41', 5, '', '2022-03-05 12:56:00', '2022-03-05 12:56:00');
INSERT INTO `specs` VALUES (28, '42', 5, '', '2022-03-05 12:56:00', '2022-03-05 12:56:00');
INSERT INTO `specs` VALUES (29, '43', 5, '', '2022-03-05 12:56:00', '2022-03-05 12:56:00');
INSERT INTO `specs` VALUES (30, '44', 5, '', '2022-03-05 12:56:00', '2022-03-05 12:56:00');
INSERT INTO `specs` VALUES (31, '45', 5, '', '2022-03-05 12:56:00', '2022-03-05 12:56:00');
INSERT INTO `specs` VALUES (32, '红色', 9, '', '2022-03-06 00:51:22', '2022-03-06 00:51:22');
INSERT INTO `specs` VALUES (33, '蓝色', 9, '', '2022-03-06 00:51:22', '2022-03-06 00:51:22');
COMMIT;

-- ----------------------------
-- Table structure for tags_goods
-- ----------------------------
DROP TABLE IF EXISTS `tags_goods`;
CREATE TABLE `tags_goods` (
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `goods_id` int(11) NOT NULL,
  `goods_tag_id` int(11) NOT NULL,
  PRIMARY KEY (`goods_id`,`goods_tag_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tags_goods
-- ----------------------------
BEGIN;
INSERT INTO `tags_goods` VALUES ('2022-03-02 00:48:23', '2022-03-02 00:48:23', 1, 1);
INSERT INTO `tags_goods` VALUES ('2022-03-03 23:09:20', '2022-03-03 23:09:20', 2, 1);
INSERT INTO `tags_goods` VALUES ('2022-03-03 23:07:24', '2022-03-03 23:07:24', 3, 1);
INSERT INTO `tags_goods` VALUES ('2022-03-03 23:18:00', '2022-03-03 23:18:00', 4, 1);
INSERT INTO `tags_goods` VALUES ('2022-03-04 00:02:46', '2022-03-04 00:02:46', 5, 1);
INSERT INTO `tags_goods` VALUES ('2022-03-05 12:58:49', '2022-03-05 12:58:49', 6, 2);
INSERT INTO `tags_goods` VALUES ('2022-03-05 13:31:48', '2022-03-05 13:31:48', 7, 1);
INSERT INTO `tags_goods` VALUES ('2022-03-05 13:37:49', '2022-03-05 13:37:49', 8, 1);
INSERT INTO `tags_goods` VALUES ('2022-03-05 13:41:41', '2022-03-05 13:41:41', 9, 1);
INSERT INTO `tags_goods` VALUES ('2022-03-05 13:44:12', '2022-03-05 13:44:12', 10, 1);
INSERT INTO `tags_goods` VALUES ('2022-03-05 13:47:13', '2022-03-05 13:47:13', 11, 1);
INSERT INTO `tags_goods` VALUES ('2022-03-05 13:51:11', '2022-03-05 13:51:11', 12, 3);
INSERT INTO `tags_goods` VALUES ('2022-03-05 13:55:21', '2022-03-05 13:55:21', 13, 3);
INSERT INTO `tags_goods` VALUES ('2022-03-05 13:58:10', '2022-03-05 13:58:10', 14, 3);
INSERT INTO `tags_goods` VALUES ('2022-03-06 00:49:14', '2022-03-06 00:49:14', 15, 2);
INSERT INTO `tags_goods` VALUES ('2022-03-06 00:49:25', '2022-03-06 00:49:25', 16, 2);
INSERT INTO `tags_goods` VALUES ('2022-03-06 00:49:35', '2022-03-06 00:49:35', 17, 2);
INSERT INTO `tags_goods` VALUES ('2022-03-06 00:52:55', '2022-03-06 00:52:55', 18, 1);
COMMIT;

-- ----------------------------
-- Table structure for user-by-shop
-- ----------------------------
DROP TABLE IF EXISTS `user-by-shop`;
CREATE TABLE `user-by-shop` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `order_id` varchar(255) DEFAULT NULL COMMENT '订单号',
  `shop_number` int(11) DEFAULT '0' COMMENT '商品数量',
  `pay_money` float(10,2) DEFAULT NULL COMMENT '总价格',
  `address` json DEFAULT NULL COMMENT '收获地址',
  `status` int(11) DEFAULT '1' COMMENT '购物状态，1 待付款，2待发货 ，3待收获，4待评价,5 已完成 ,6 以取消',
  `pay_late_time` datetime NOT NULL COMMENT '最后截止的时间',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `order_id` (`order_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `user-by-shop_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `good_user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user-by-shop
-- ----------------------------
BEGIN;
INSERT INTO `user-by-shop` VALUES (2, 2, '16464890190119087721045', 6, 3135.00, '{\"id\": 1, \"name\": \"小明\", \"iPhone\": \"15607191234\", \"userId\": 2, \"address\": \"成都新城\", \"isDefault\": false, \"created_at\": \"2022-03-05\", \"postalCode\": \"\", \"updated_at\": \"2022-03-05T06:00:04.000Z\", \"fullLocation\": \"四川省 成都市 武侯区\"}', 2, '2022-03-05 22:33:39', '2022-03-05 22:03:39', '2022-03-05 22:33:42');
INSERT INTO `user-by-shop` VALUES (3, 2, '16464910707268708141478', 6, 2915.00, '{\"id\": 1, \"name\": \"小明\", \"iPhone\": \"15607191234\", \"userId\": 2, \"address\": \"成都新城\", \"isDefault\": false, \"created_at\": \"2022-03-05\", \"postalCode\": \"\", \"updated_at\": \"2022-03-05T06:00:04.000Z\", \"fullLocation\": \"四川省 成都市 武侯区\"}', 6, '2022-03-05 23:07:50', '2022-03-05 22:37:50', '2022-03-05 22:50:31');
INSERT INTO `user-by-shop` VALUES (4, 2, '16464926391117948426313', 6, 3135.00, '{\"id\": 1, \"name\": \"小明\", \"iPhone\": \"15607191234\", \"userId\": 2, \"address\": \"成都新城\", \"isDefault\": false, \"created_at\": \"2022-03-05\", \"postalCode\": \"\", \"updated_at\": \"2022-03-05T06:00:04.000Z\", \"fullLocation\": \"四川省 成都市 武侯区\"}', 1, '2022-03-05 23:33:59', '2022-03-05 23:03:59', '2022-03-05 23:03:59');
INSERT INTO `user-by-shop` VALUES (5, 2, '16464926589115216376238', 6, 3135.00, '{\"id\": 1, \"name\": \"小明\", \"iPhone\": \"15607191234\", \"userId\": 2, \"address\": \"成都新城\", \"isDefault\": false, \"created_at\": \"2022-03-05\", \"postalCode\": \"\", \"updated_at\": \"2022-03-05T06:00:04.000Z\", \"fullLocation\": \"四川省 成都市 武侯区\"}', 1, '2022-03-05 23:34:18', '2022-03-05 23:04:18', '2022-03-05 23:04:18');
INSERT INTO `user-by-shop` VALUES (6, 2, '16464927074088276751643', 6, 3135.00, '{\"id\": 1, \"name\": \"小明\", \"iPhone\": \"15607191234\", \"userId\": 2, \"address\": \"成都新城\", \"isDefault\": false, \"created_at\": \"2022-03-05\", \"postalCode\": \"\", \"updated_at\": \"2022-03-05T06:00:04.000Z\", \"fullLocation\": \"四川省 成都市 武侯区\"}', 1, '2022-03-05 23:35:07', '2022-03-05 23:05:07', '2022-03-05 23:05:07');
INSERT INTO `user-by-shop` VALUES (7, 2, '16464929460394781879942', 6, 3135.00, '{\"id\": 1, \"name\": \"小明\", \"iPhone\": \"15607191234\", \"userId\": 2, \"address\": \"成都新城\", \"isDefault\": false, \"created_at\": \"2022-03-05\", \"postalCode\": \"\", \"updated_at\": \"2022-03-05T06:00:04.000Z\", \"fullLocation\": \"四川省 成都市 武侯区\"}', 1, '2022-03-05 23:39:06', '2022-03-05 23:09:06', '2022-03-05 23:09:06');
INSERT INTO `user-by-shop` VALUES (8, 2, '16464930240558456447222', 6, 3135.00, '{\"id\": 1, \"name\": \"小明\", \"iPhone\": \"15607191234\", \"userId\": 2, \"address\": \"成都新城\", \"isDefault\": false, \"created_at\": \"2022-03-05\", \"postalCode\": \"\", \"updated_at\": \"2022-03-05T06:00:04.000Z\", \"fullLocation\": \"四川省 成都市 武侯区\"}', 1, '2022-03-05 23:40:24', '2022-03-05 23:10:24', '2022-03-05 23:10:24');
INSERT INTO `user-by-shop` VALUES (9, 2, '16464941408706551520487', 4, 2375.00, '{\"id\": 1, \"name\": \"小明\", \"iPhone\": \"15607191234\", \"userId\": 2, \"address\": \"成都新城\", \"isDefault\": false, \"created_at\": \"2022-03-05\", \"postalCode\": \"\", \"updated_at\": \"2022-03-05T06:00:04.000Z\", \"fullLocation\": \"四川省 成都市 武侯区\"}', 1, '2022-03-05 23:59:00', '2022-03-05 23:29:00', '2022-03-05 23:29:00');
INSERT INTO `user-by-shop` VALUES (10, 2, '16464944183038703992561', 4, 2375.00, '{\"id\": 1, \"name\": \"小明\", \"iPhone\": \"15607191234\", \"userId\": 2, \"address\": \"成都新城\", \"isDefault\": false, \"created_at\": \"2022-03-05\", \"postalCode\": \"\", \"updated_at\": \"2022-03-05T06:00:04.000Z\", \"fullLocation\": \"四川省 成都市 武侯区\"}', 1, '2022-03-06 00:03:38', '2022-03-05 23:33:38', '2022-03-05 23:33:38');
INSERT INTO `user-by-shop` VALUES (11, 2, '16464947047516338231946', 1, 590.00, '{\"id\": 1, \"name\": \"小明\", \"iPhone\": \"15607191234\", \"userId\": 2, \"address\": \"成都新城\", \"isDefault\": false, \"created_at\": \"2022-03-05\", \"postalCode\": \"\", \"updated_at\": \"2022-03-05T06:00:04.000Z\", \"fullLocation\": \"四川省 成都市 武侯区\"}', 1, '2022-03-06 00:08:24', '2022-03-05 23:38:24', '2022-03-05 23:38:24');
INSERT INTO `user-by-shop` VALUES (12, 2, '16464947145229541052967', 1, 590.00, '{\"id\": 1, \"name\": \"小明\", \"iPhone\": \"15607191234\", \"userId\": 2, \"address\": \"成都新城\", \"isDefault\": false, \"created_at\": \"2022-03-05\", \"postalCode\": \"\", \"updated_at\": \"2022-03-05T06:00:04.000Z\", \"fullLocation\": \"四川省 成都市 武侯区\"}', 1, '2022-03-06 00:08:34', '2022-03-05 23:38:34', '2022-03-05 23:38:34');
INSERT INTO `user-by-shop` VALUES (13, 2, '16464947898782576844588', 1, 590.00, '{\"id\": 1, \"name\": \"小明\", \"iPhone\": \"15607191234\", \"userId\": 2, \"address\": \"成都新城\", \"isDefault\": false, \"created_at\": \"2022-03-05\", \"postalCode\": \"\", \"updated_at\": \"2022-03-05T06:00:04.000Z\", \"fullLocation\": \"四川省 成都市 武侯区\"}', 1, '2022-03-06 00:09:49', '2022-03-05 23:39:49', '2022-03-05 23:39:49');
INSERT INTO `user-by-shop` VALUES (14, 2, '16464949140723522089623', 1, 590.00, '{\"id\": 1, \"name\": \"小明\", \"iPhone\": \"15607191234\", \"userId\": 2, \"address\": \"成都新城\", \"isDefault\": false, \"created_at\": \"2022-03-05\", \"postalCode\": \"\", \"updated_at\": \"2022-03-05T06:00:04.000Z\", \"fullLocation\": \"四川省 成都市 武侯区\"}', 1, '2022-03-06 00:11:54', '2022-03-05 23:41:54', '2022-03-05 23:41:54');
INSERT INTO `user-by-shop` VALUES (15, 2, '16464949987008190078460', 1, 590.00, '{\"id\": 1, \"name\": \"小明\", \"iPhone\": \"15607191234\", \"userId\": 2, \"address\": \"成都新城\", \"isDefault\": false, \"created_at\": \"2022-03-05\", \"postalCode\": \"\", \"updated_at\": \"2022-03-05T06:00:04.000Z\", \"fullLocation\": \"四川省 成都市 武侯区\"}', 1, '2022-03-06 00:13:44', '2022-03-05 23:43:44', '2022-03-05 23:43:44');
INSERT INTO `user-by-shop` VALUES (16, 2, '16464950650535936664116', 1, 590.00, '{\"id\": 1, \"name\": \"小明\", \"iPhone\": \"15607191234\", \"userId\": 2, \"address\": \"成都新城\", \"isDefault\": false, \"created_at\": \"2022-03-05\", \"postalCode\": \"\", \"updated_at\": \"2022-03-05T06:00:04.000Z\", \"fullLocation\": \"四川省 成都市 武侯区\"}', 1, '2022-03-06 00:14:25', '2022-03-05 23:44:25', '2022-03-05 23:44:25');
INSERT INTO `user-by-shop` VALUES (17, 2, '16464950968353693190911', 1, 590.00, '{\"id\": 1, \"name\": \"小明\", \"iPhone\": \"15607191234\", \"userId\": 2, \"address\": \"成都新城\", \"isDefault\": false, \"created_at\": \"2022-03-05\", \"postalCode\": \"\", \"updated_at\": \"2022-03-05T06:00:04.000Z\", \"fullLocation\": \"四川省 成都市 武侯区\"}', 1, '2022-03-06 00:14:56', '2022-03-05 23:44:56', '2022-03-05 23:44:56');
INSERT INTO `user-by-shop` VALUES (18, 2, '16464951503211649867359', 1, 590.00, '{\"id\": 1, \"name\": \"小明\", \"iPhone\": \"15607191234\", \"userId\": 2, \"address\": \"成都新城\", \"isDefault\": false, \"created_at\": \"2022-03-05\", \"postalCode\": \"\", \"updated_at\": \"2022-03-05T06:00:04.000Z\", \"fullLocation\": \"四川省 成都市 武侯区\"}', 1, '2022-03-06 00:15:53', '2022-03-05 23:45:53', '2022-03-05 23:45:53');
INSERT INTO `user-by-shop` VALUES (19, 2, '16464952344208915886354', 1, 590.00, '{\"id\": 1, \"name\": \"小明\", \"iPhone\": \"15607191234\", \"userId\": 2, \"address\": \"成都新城\", \"isDefault\": false, \"created_at\": \"2022-03-05\", \"postalCode\": \"\", \"updated_at\": \"2022-03-05T06:00:04.000Z\", \"fullLocation\": \"四川省 成都市 武侯区\"}', 1, '2022-03-06 00:17:14', '2022-03-05 23:47:14', '2022-03-05 23:47:14');
INSERT INTO `user-by-shop` VALUES (20, 2, '16464952669972624521690', 1, 590.00, '{\"id\": 1, \"name\": \"小明\", \"iPhone\": \"15607191234\", \"userId\": 2, \"address\": \"成都新城\", \"isDefault\": false, \"created_at\": \"2022-03-05\", \"postalCode\": \"\", \"updated_at\": \"2022-03-05T06:00:04.000Z\", \"fullLocation\": \"四川省 成都市 武侯区\"}', 1, '2022-03-06 00:17:47', '2022-03-05 23:47:47', '2022-03-05 23:47:47');
INSERT INTO `user-by-shop` VALUES (21, 2, '16464953099335291877143', 1, 590.00, '{\"id\": 1, \"name\": \"小明\", \"iPhone\": \"15607191234\", \"userId\": 2, \"address\": \"成都新城\", \"isDefault\": false, \"created_at\": \"2022-03-05\", \"postalCode\": \"\", \"updated_at\": \"2022-03-05T06:00:04.000Z\", \"fullLocation\": \"四川省 成都市 武侯区\"}', 1, '2022-03-06 00:19:20', '2022-03-05 23:49:20', '2022-03-05 23:49:20');
INSERT INTO `user-by-shop` VALUES (22, 2, '16464953961403097077356', 1, 590.00, '{\"id\": 1, \"name\": \"小明\", \"iPhone\": \"15607191234\", \"userId\": 2, \"address\": \"成都新城\", \"isDefault\": false, \"created_at\": \"2022-03-05\", \"postalCode\": \"\", \"updated_at\": \"2022-03-05T06:00:04.000Z\", \"fullLocation\": \"四川省 成都市 武侯区\"}', 1, '2022-03-06 00:19:56', '2022-03-05 23:49:56', '2022-03-05 23:49:56');
INSERT INTO `user-by-shop` VALUES (23, 2, '16464954314027006915130', 5, 2545.00, '{\"id\": 1, \"name\": \"小明\", \"iPhone\": \"15607191234\", \"userId\": 2, \"address\": \"成都新城\", \"isDefault\": false, \"created_at\": \"2022-03-05\", \"postalCode\": \"\", \"updated_at\": \"2022-03-05T06:00:04.000Z\", \"fullLocation\": \"四川省 成都市 武侯区\"}', 2, '2022-03-06 00:20:31', '2022-03-05 23:50:31', '2022-03-05 23:50:41');
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
