/*
 Navicat Premium Data Transfer

 Source Server         : io
 Source Server Type    : MySQL
 Source Server Version : 50726
 Source Host           : localhost:3306
 Source Schema         : shop

 Target Server Type    : MySQL
 Target Server Version : 50726
 File Encoding         : 65001

 Date: 04/01/2022 22:31:15
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for address
-- ----------------------------
DROP TABLE IF EXISTS `address`;
CREATE TABLE `address`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '收件人',
  `iphone` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '电话',
  `full_location` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '地址',
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '地址',
  `is_default` tinyint(1) NULL DEFAULT 0 COMMENT '默认地址',
  `postal_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮编号',
  `created_at` datetime(0) NOT NULL,
  `updated_at` datetime(0) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of address
-- ----------------------------
INSERT INTO `address` VALUES (1, 3, '小明', '15607191234', '湖北省 武汉市 江岸区', '成都新城', 0, '00000', '2022-01-02 01:59:02', '2022-01-02 01:59:02');
INSERT INTO `address` VALUES (2, 3, '小明4', '15607191234', '江苏省 扬州市 蜀岗-瘦西湖风景名胜区', '成都新城', 0, '00000', '2022-01-02 01:59:10', '2022-01-02 01:59:10');
INSERT INTO `address` VALUES (3, 3, '小明12', '15607191234', '四川省 成都市 锦江区', '成都新城', 0, '00000', '2022-01-02 01:59:20', '2022-01-02 01:59:20');
INSERT INTO `address` VALUES (4, 3, '小明77', '15607191234', '湖北省 武汉市 江岸区', '成都新城', 0, '65656', '2022-01-02 13:02:19', '2022-01-02 13:02:19');
INSERT INTO `address` VALUES (5, 3, '小明00', '15607191234', '湖北省 武汉市 江岸区', '成都新城', 0, '', '2022-01-02 13:05:31', '2022-01-02 13:05:31');
INSERT INTO `address` VALUES (6, 3, '小明888', '15607191234', '湖北省 武汉市 江岸区', '成都新城', 0, '', '2022-01-02 13:37:33', '2022-01-02 13:37:33');
INSERT INTO `address` VALUES (7, 3, '小明999', '15607191234', '湖北省 武汉市 江岸区', '成都新城', 0, '', '2022-01-02 13:37:45', '2022-01-02 13:37:45');
INSERT INTO `address` VALUES (8, 3, '小明32', '15607191234', '湖北省 武汉市 江岸区', '成都新城', 0, '', '2022-01-02 13:45:43', '2022-01-02 13:45:43');

-- ----------------------------
-- Table structure for brand
-- ----------------------------
DROP TABLE IF EXISTS `brand`;
CREATE TABLE `brand`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `name_en` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '英文名',
  `picture` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '图片地址',
  `logo` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'logo地址',
  `place` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '介绍',
  `status` tinyint(1) NULL DEFAULT 0 COMMENT '状态是否使用',
  `created_at` datetime(0) NOT NULL,
  `updated_at` datetime(0) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of brand
-- ----------------------------

-- ----------------------------
-- Table structure for by_product
-- ----------------------------
DROP TABLE IF EXISTS `by_product`;
CREATE TABLE `by_product`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL COMMENT '订单号',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '商品名字',
  `picture` json NOT NULL COMMENT '图片',
  `discount` float(10, 2) NULL DEFAULT NULL COMMENT '支付价格',
  `price` float(10, 2) NULL DEFAULT NULL COMMENT '原价格',
  `count` int(11) NULL DEFAULT NULL COMMENT '库存量',
  `specs` json NULL COMMENT '属性，[]',
  `created_at` datetime(0) NOT NULL,
  `updated_at` datetime(0) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of by_product
-- ----------------------------
INSERT INTO `by_product` VALUES (9, 9, '2021年春季新品', '[\"https://yanxuan-item.nosdn.127.net/33ce94abe337dfd442ce8640401af5fe.jpg\", \"https://yanxuan-item.nosdn.127.net/79af992a7fb44c8b4a264ccbe9ee3cd7.png\", \"https://yanxuan-item.nosdn.127.net/8b264d41218197b674edae66eefa5247.jpg\", \"https://yanxuan-item.nosdn.127.net/32152974e6dafccda9481f97fb6f0da0.jpg\", \"https://yanxuan-item.nosdn.127.net/ddd7e14a4c48b17416698a3ac26d9b89.jpg\"]', 120.00, 56.34, 4, '[{\"key\": \"颜色\", \"value\": \"黑色\"}, {\"key\": \"尺码\", \"value\": \"37\"}]', '2022-01-02 17:03:41', '2022-01-02 17:03:41');
INSERT INTO `by_product` VALUES (10, 10, '2021年春季新品', '[\"https://yanxuan-item.nosdn.127.net/33ce94abe337dfd442ce8640401af5fe.jpg\", \"https://yanxuan-item.nosdn.127.net/79af992a7fb44c8b4a264ccbe9ee3cd7.png\", \"https://yanxuan-item.nosdn.127.net/8b264d41218197b674edae66eefa5247.jpg\", \"https://yanxuan-item.nosdn.127.net/32152974e6dafccda9481f97fb6f0da0.jpg\", \"https://yanxuan-item.nosdn.127.net/ddd7e14a4c48b17416698a3ac26d9b89.jpg\"]', 120.00, 56.34, 4, '[{\"key\": \"颜色\", \"value\": \"黑色\"}, {\"key\": \"尺码\", \"value\": \"37\"}]', '2022-01-02 17:17:27', '2022-01-02 17:17:27');
INSERT INTO `by_product` VALUES (11, 11, '2021年春季新品', '[\"https://yanxuan-item.nosdn.127.net/33ce94abe337dfd442ce8640401af5fe.jpg\", \"https://yanxuan-item.nosdn.127.net/79af992a7fb44c8b4a264ccbe9ee3cd7.png\", \"https://yanxuan-item.nosdn.127.net/8b264d41218197b674edae66eefa5247.jpg\", \"https://yanxuan-item.nosdn.127.net/32152974e6dafccda9481f97fb6f0da0.jpg\", \"https://yanxuan-item.nosdn.127.net/ddd7e14a4c48b17416698a3ac26d9b89.jpg\"]', 120.00, 56.34, 4, '[{\"key\": \"颜色\", \"value\": \"黑色\"}, {\"key\": \"尺码\", \"value\": \"37\"}]', '2022-01-02 17:33:04', '2022-01-02 17:33:04');
INSERT INTO `by_product` VALUES (12, 12, '2021年春季新品', '[\"https://yanxuan-item.nosdn.127.net/33ce94abe337dfd442ce8640401af5fe.jpg\", \"https://yanxuan-item.nosdn.127.net/79af992a7fb44c8b4a264ccbe9ee3cd7.png\", \"https://yanxuan-item.nosdn.127.net/8b264d41218197b674edae66eefa5247.jpg\", \"https://yanxuan-item.nosdn.127.net/32152974e6dafccda9481f97fb6f0da0.jpg\", \"https://yanxuan-item.nosdn.127.net/ddd7e14a4c48b17416698a3ac26d9b89.jpg\"]', 120.00, 56.34, 4, '[{\"key\": \"颜色\", \"value\": \"黑色\"}, {\"key\": \"尺码\", \"value\": \"37\"}]', '2022-01-02 17:35:02', '2022-01-02 17:35:02');
INSERT INTO `by_product` VALUES (13, 13, '2021年春季新品，儿童纯棉长袖T恤73-130cm', '[\"http://192.168.0.102:6452/show/public/img/fenshangjian/default/02ccbbf8-e882-474e-967a-47f9571a2290.jpg\", \"http://192.168.0.102:6452/show/public/img/fenshangjian/default/7-T3.jpg\", \"http://192.168.0.102:6452/show/public/img/fenshangjian/default/fde720f3-8dec-4b2d-814d-d123a594a906.jpg\", \"http://192.168.0.102:6452/show/public/img/fenshangjian/default/3-T1.jpg\"]', 90.00, 100.03, 1, '[{\"key\": \"颜色\", \"value\": \"黑色\"}]', '2022-01-02 21:09:57', '2022-01-02 21:09:57');
INSERT INTO `by_product` VALUES (14, 14, '2021年春季新品，儿童纯棉长袖T恤73-130cm', '[\"http://192.168.0.102:6452/show/public/img/fenshangjian/default/02ccbbf8-e882-474e-967a-47f9571a2290.jpg\", \"http://192.168.0.102:6452/show/public/img/fenshangjian/default/7-T3.jpg\", \"http://192.168.0.102:6452/show/public/img/fenshangjian/default/fde720f3-8dec-4b2d-814d-d123a594a906.jpg\", \"http://192.168.0.102:6452/show/public/img/fenshangjian/default/3-T1.jpg\"]', 90.00, 100.03, 1, '[{\"key\": \"颜色\", \"value\": \"黑色\"}]', '2022-01-02 23:51:48', '2022-01-02 23:51:48');
INSERT INTO `by_product` VALUES (15, 15, '2021年春季新品，儿童纯棉长袖T恤73-130cm', '[\"http://192.168.0.102:6452/show/public/img/fenshangjian/default/02ccbbf8-e882-474e-967a-47f9571a2290.jpg\", \"http://192.168.0.102:6452/show/public/img/fenshangjian/default/7-T3.jpg\", \"http://192.168.0.102:6452/show/public/img/fenshangjian/default/fde720f3-8dec-4b2d-814d-d123a594a906.jpg\", \"http://192.168.0.102:6452/show/public/img/fenshangjian/default/3-T1.jpg\"]', 90.00, 100.03, 1, '[{\"key\": \"颜色\", \"value\": \"黑色\"}]', '2022-01-03 00:10:15', '2022-01-03 00:10:15');

-- ----------------------------
-- Table structure for categories
-- ----------------------------
DROP TABLE IF EXISTS `categories`;
CREATE TABLE `categories`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `super_id` int(11) NULL DEFAULT 0 COMMENT '父id',
  `picture` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '图片地址',
  `desc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '描述',
  `layer` int(11) NULL DEFAULT 0 COMMENT '排序0',
  `status` tinyint(1) NULL DEFAULT 0 COMMENT '状态是否使用',
  `created_at` datetime(0) NOT NULL,
  `updated_at` datetime(0) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 21 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of categories
-- ----------------------------
INSERT INTO `categories` VALUES (1, '潮流服装', 0, 'http://192.168.0.102:6452/show/public/img/fenshangjian/default/5-T1.jpg', '的说法都是发放', 0, 1, '2021-12-28 00:44:39', '2021-12-28 00:44:39');
INSERT INTO `categories` VALUES (2, '智慧图书', 0, 'http://192.168.0.102:6452/show/public/img/fenshangjian/default/5-T1.jpg', '智慧图书', 0, 1, '2021-12-28 03:28:55', '2021-12-28 03:28:55');
INSERT INTO `categories` VALUES (3, '数码电器', 0, 'http://192.168.0.102:6452/show/public/img/fenshangjian/default/5-T1.jpg', '时尚套装', 0, 1, '2021-12-28 14:08:49', '2021-12-28 14:08:51');
INSERT INTO `categories` VALUES (4, '美妆日常', 0, 'http://192.168.0.102:6452/show/public/img/fenshangjian/default/5-T1.jpg', '发货都是覅是', 0, 1, '2021-12-28 00:52:55', '2021-12-28 00:52:55');
INSERT INTO `categories` VALUES (11, '毛衣', 1, 'http://192.168.0.102:6452/show/public/img/fenshangjian/default/5-T1.jpg', '的说法都是发放', 0, 1, '2021-12-28 00:44:39', '2021-12-28 00:44:39');
INSERT INTO `categories` VALUES (12, '羽绒服', 1, 'http://192.168.0.102:6452/show/public/img/fenshangjian/default/5-T1.jpg', '的说法都是发放', 0, 1, '2021-12-28 00:44:39', '2021-12-28 00:44:39');
INSERT INTO `categories` VALUES (13, '保暖棉衣', 1, 'http://192.168.0.102:6452/show/public/img/fenshangjian/default/5-T1.jpg', '的说法都是发放', 0, 1, '2021-12-28 00:44:39', '2021-12-28 00:44:39');
INSERT INTO `categories` VALUES (14, '连衣群套装', 1, 'http://192.168.0.102:6452/show/public/img/fenshangjian/default/5-T1.jpg', '的说法都是发放', 0, 1, '2021-12-28 00:44:39', '2021-12-28 00:44:39');
INSERT INTO `categories` VALUES (15, 'T血套装', 1, 'http://192.168.0.102:6452/show/public/img/fenshangjian/default/5-T1.jpg', '的说法都是发放', 0, 1, '2021-12-28 00:44:39', '2021-12-28 00:44:39');
INSERT INTO `categories` VALUES (16, '历史文学', 2, 'http://192.168.0.102:6452/show/public/img/fenshangjian/default/5-T1.jpg', '的说法都是发放', 0, 1, '2021-12-28 00:44:39', '2021-12-28 00:44:39');
INSERT INTO `categories` VALUES (17, '青春文学', 2, 'http://192.168.0.102:6452/show/public/img/fenshangjian/default/5-T1.jpg', '的说法都是发放', 0, 1, '2021-12-28 00:44:39', '2021-12-28 00:44:39');
INSERT INTO `categories` VALUES (18, '手机', 3, 'http://192.168.0.102:6452/show/public/img/fenshangjian/default/5-T1.jpg', '的说法都是发放', 0, 1, '2021-12-28 00:44:39', '2021-12-28 00:44:39');
INSERT INTO `categories` VALUES (19, '电脑', 3, 'http://192.168.0.102:6452/show/public/img/fenshangjian/default/5-T1.jpg', '的说法都是发放', 0, 1, '2021-12-28 00:44:39', '2021-12-28 00:44:39');
INSERT INTO `categories` VALUES (20, '护肤套装', 4, 'http://192.168.0.102:6452/show/public/img/fenshangjian/default/5-T1.jpg', '的说法都是发放', 0, 1, '2021-12-28 00:44:39', '2021-12-28 00:44:39');

-- ----------------------------
-- Table structure for good_tag
-- ----------------------------
DROP TABLE IF EXISTS `good_tag`;
CREATE TABLE `good_tag`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `status` tinyint(1) NULL DEFAULT 0 COMMENT '状态是否使用',
  `created_at` datetime(0) NOT NULL,
  `updated_at` datetime(0) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of good_tag
-- ----------------------------
INSERT INTO `good_tag` VALUES (1, '秋季新款', 0, '2021-12-31 22:25:46', '2021-12-31 22:25:48');
INSERT INTO `good_tag` VALUES (2, '冬季新款', 0, '2021-12-31 22:26:00', '2021-12-31 22:26:04');

-- ----------------------------
-- Table structure for good_user
-- ----------------------------
DROP TABLE IF EXISTS `good_user`;
CREATE TABLE `good_user`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '管理员密码',
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `iphone` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sex` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '保密',
  `status` tinyint(1) NULL DEFAULT 0 COMMENT '状态是否使用',
  `created_at` datetime(0) NOT NULL,
  `updated_at` datetime(0) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of good_user
-- ----------------------------
INSERT INTO `good_user` VALUES (3, '小明', '$2a$10$Cf0vRair1930PgFFEPt0SOKo.OM7afQFIaL5XqAHyt9uLFQRoA0yK', '1010@qq.com', NULL, '保密', 1, '2022-01-01 15:32:12', '2022-01-01 15:32:12');
INSERT INTO `good_user` VALUES (4, '小花', '$2a$10$lH0c4CIbg7D3qgTDY8wWb.4LQ.3vOd8wNPXgyh5.Mv..0ilz00lPu', '1011@qq.com', NULL, '保密', 1, '2022-01-01 15:37:34', '2022-01-01 15:37:34');

-- ----------------------------
-- Table structure for goods
-- ----------------------------
DROP TABLE IF EXISTS `goods`;
CREATE TABLE `goods`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '商品名字',
  `desc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品描述',
  `picture` json NOT NULL COMMENT '图片',
  `cate_id` int(11) NULL DEFAULT 0 COMMENT '分类',
  `brand_id` int(11) NULL DEFAULT 0 COMMENT '品牌id',
  `status` tinyint(1) NULL DEFAULT 0 COMMENT '状态是否使用',
  `is_type_explain` int(11) NULL DEFAULT 1 COMMENT '什么类型商品介绍',
  `particulars` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '商品详情',
  `created_at` datetime(0) NOT NULL,
  `updated_at` datetime(0) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of goods
-- ----------------------------
INSERT INTO `goods` VALUES (9, '2021年春季新品，儿童纯棉长袖T恤73-130cm', '爱上放假啊函数即可打开就', '[\"http://192.168.0.102:6452/show/public/img/fenshangjian/default/02ccbbf8-e882-474e-967a-47f9571a2290.jpg\", \"http://192.168.0.102:6452/show/public/img/fenshangjian/default/7-T3.jpg\", \"http://192.168.0.102:6452/show/public/img/fenshangjian/default/fde720f3-8dec-4b2d-814d-d123a594a906.jpg\", \"http://192.168.0.102:6452/show/public/img/fenshangjian/default/3-T1.jpg\"]', 13, 0, 1, 1, '<!DOCTYPE html>\n<html>\n<head>\n</head>\n<body>\n<table style=\"border-collapse: collapse; width: 100%;\" border=\"1\">\n<tbody>\n<tr>\n<td style=\"width: 49.5916%;\">颜色</td>\n<td style=\"width: 49.5916%;\">&nbsp;</td>\n</tr>\n<tr>\n<td style=\"width: 49.5916%;\">尺寸</td>\n<td style=\"width: 49.5916%;\">&nbsp;</td>\n</tr>\n</tbody>\n</table>\n<p><img src=\"http://192.168.0.102:6452/show/public/img/fenshangjian/default/02ccbbf8-e882-474e-967a-47f9571a2290.jpg\" alt=\"\" width=\"1409\" height=\"563\" /></p>\n<p><img src=\"http://192.168.0.102:6452/show/public/img/fenshangjian/default/fde720f3-8dec-4b2d-814d-d123a594a906.jpg\" alt=\"\" width=\"1158\" height=\"463\" /></p>\n<p><img src=\"http://192.168.0.102:6452/show/public/img/fenshangjian/default/7-T3.jpg\" alt=\"\" width=\"1409\" height=\"563\" /></p>\n</body>\n</html>', '2021-12-31 23:34:58', '2021-12-31 23:34:58');
INSERT INTO `goods` VALUES (10, '2021年春季新品，儿童纯棉长袖T恤73-130cm', '爱上放假啊函数即可打开就', '[\"http://192.168.0.102:6452/show/public/img/fenshangjian/default/02ccbbf8-e882-474e-967a-47f9571a2290.jpg\", \"http://192.168.0.102:6452/show/public/img/fenshangjian/default/7-T3.jpg\", \"http://192.168.0.102:6452/show/public/img/fenshangjian/default/fde720f3-8dec-4b2d-814d-d123a594a906.jpg\", \"http://192.168.0.102:6452/show/public/img/fenshangjian/default/3-T1.jpg\"]', 13, 0, 1, 1, '<!DOCTYPE html>\n<html>\n<head>\n</head>\n<body>\n<table style=\"border-collapse: collapse; width: 100%;\" border=\"1\">\n<tbody>\n<tr>\n<td style=\"width: 49.5916%;\">颜色</td>\n<td style=\"width: 49.5916%;\">&nbsp;</td>\n</tr>\n<tr>\n<td style=\"width: 49.5916%;\">尺寸</td>\n<td style=\"width: 49.5916%;\">&nbsp;</td>\n</tr>\n</tbody>\n</table>\n<p><img src=\"http://192.168.0.102:6452/show/public/img/fenshangjian/default/02ccbbf8-e882-474e-967a-47f9571a2290.jpg\" alt=\"\" width=\"1409\" height=\"563\" /></p>\n<p><img src=\"http://192.168.0.102:6452/show/public/img/fenshangjian/default/fde720f3-8dec-4b2d-814d-d123a594a906.jpg\" alt=\"\" width=\"1158\" height=\"463\" /></p>\n<p><img src=\"http://192.168.0.102:6452/show/public/img/fenshangjian/default/7-T3.jpg\" alt=\"\" width=\"1409\" height=\"563\" /></p>\n</body>\n</html>', '2021-12-31 23:36:25', '2021-12-31 23:36:25');
INSERT INTO `goods` VALUES (11, '2021年春季新品，儿童纯棉长袖T恤73-130cm', '爱上放假啊函数即可打开就', '[\"http://192.168.0.102:6452/show/public/img/fenshangjian/default/02ccbbf8-e882-474e-967a-47f9571a2290.jpg\", \"http://192.168.0.102:6452/show/public/img/fenshangjian/default/7-T3.jpg\", \"http://192.168.0.102:6452/show/public/img/fenshangjian/default/fde720f3-8dec-4b2d-814d-d123a594a906.jpg\", \"http://192.168.0.102:6452/show/public/img/fenshangjian/default/3-T1.jpg\"]', 13, 0, 1, 1, '<!DOCTYPE html>\n<html>\n<head>\n</head>\n<body>\n<table style=\"border-collapse: collapse; width: 100%;\" border=\"1\">\n<tbody>\n<tr>\n<td style=\"width: 49.5916%;\">颜色</td>\n<td style=\"width: 49.5916%;\">&nbsp;</td>\n</tr>\n<tr>\n<td style=\"width: 49.5916%;\">尺寸</td>\n<td style=\"width: 49.5916%;\">&nbsp;</td>\n</tr>\n</tbody>\n</table>\n<p><img src=\"http://192.168.0.102:6452/show/public/img/fenshangjian/default/02ccbbf8-e882-474e-967a-47f9571a2290.jpg\" alt=\"\" width=\"1409\" height=\"563\" /></p>\n<p><img src=\"http://192.168.0.102:6452/show/public/img/fenshangjian/default/fde720f3-8dec-4b2d-814d-d123a594a906.jpg\" alt=\"\" width=\"1158\" height=\"463\" /></p>\n<p><img src=\"http://192.168.0.102:6452/show/public/img/fenshangjian/default/7-T3.jpg\" alt=\"\" width=\"1409\" height=\"563\" /></p>\n</body>\n</html>', '2021-12-31 23:37:30', '2021-12-31 23:37:30');
INSERT INTO `goods` VALUES (12, '2021年春季新品', '爱上放假啊函数即可打开就', '[\"https://yanxuan-item.nosdn.127.net/33ce94abe337dfd442ce8640401af5fe.jpg\", \"https://yanxuan-item.nosdn.127.net/79af992a7fb44c8b4a264ccbe9ee3cd7.png\", \"https://yanxuan-item.nosdn.127.net/8b264d41218197b674edae66eefa5247.jpg\", \"https://yanxuan-item.nosdn.127.net/32152974e6dafccda9481f97fb6f0da0.jpg\", \"https://yanxuan-item.nosdn.127.net/ddd7e14a4c48b17416698a3ac26d9b89.jpg\"]', 13, 0, 1, 1, '<!DOCTYPE html>\n<html>\n<head>\n</head>\n<body>\n<table style=\"border-collapse: collapse; width: 100%;\" border=\"1\">\n<tbody>\n<tr>\n<td style=\"width: 49.5916%;\">颜色</td>\n<td style=\"width: 49.5916%;\">&nbsp;</td>\n</tr>\n<tr>\n<td style=\"width: 49.5916%;\">尺寸</td>\n<td style=\"width: 49.5916%;\">&nbsp;</td>\n</tr>\n</tbody>\n</table>\n<p><img src=\"http://192.168.0.102:6452/show/public/img/fenshangjian/default/02ccbbf8-e882-474e-967a-47f9571a2290.jpg\" alt=\"\" width=\"1409\" height=\"563\" /></p>\n<p><img src=\"http://192.168.0.102:6452/show/public/img/fenshangjian/default/fde720f3-8dec-4b2d-814d-d123a594a906.jpg\" alt=\"\" width=\"1158\" height=\"463\" /></p>\n<p><img src=\"http://192.168.0.102:6452/show/public/img/fenshangjian/default/7-T3.jpg\" alt=\"\" width=\"1409\" height=\"563\" /></p>\n</body>\n</html>', '2022-01-01 00:58:20', '2022-01-01 00:58:20');
INSERT INTO `goods` VALUES (13, '2021年春季新品', '爱上放假啊函数即可打开就', '[\"http://192.168.0.102:6452/show/public/img/fenshangjian/default/02ccbbf8-e882-474e-967a-47f9571a2290.jpg\", \"http://192.168.0.102:6452/show/public/img/fenshangjian/default/7-T3.jpg\", \"http://192.168.0.102:6452/show/public/img/fenshangjian/default/fde720f3-8dec-4b2d-814d-d123a594a906.jpg\", \"http://192.168.0.102:6452/show/public/img/fenshangjian/default/3-T1.jpg\"]', 13, 0, 1, 1, '<!DOCTYPE html>\n<html>\n<head>\n</head>\n<body>\n<table style=\"border-collapse: collapse; width: 100%;\" border=\"1\">\n<tbody>\n<tr>\n<td style=\"width: 49.5916%;\">颜色</td>\n<td style=\"width: 49.5916%;\">&nbsp;</td>\n</tr>\n<tr>\n<td style=\"width: 49.5916%;\">尺寸</td>\n<td style=\"width: 49.5916%;\">&nbsp;</td>\n</tr>\n</tbody>\n</table>\n<p><img src=\"http://192.168.0.102:6452/show/public/img/fenshangjian/default/02ccbbf8-e882-474e-967a-47f9571a2290.jpg\" alt=\"\" width=\"1409\" height=\"563\" /></p>\n<p><img src=\"http://192.168.0.102:6452/show/public/img/fenshangjian/default/fde720f3-8dec-4b2d-814d-d123a594a906.jpg\" alt=\"\" width=\"1158\" height=\"463\" /></p>\n<p><img src=\"http://192.168.0.102:6452/show/public/img/fenshangjian/default/7-T3.jpg\" alt=\"\" width=\"1409\" height=\"563\" /></p>\n</body>\n</html>', '2022-01-01 01:17:25', '2022-01-01 01:17:25');

-- ----------------------------
-- Table structure for goods_sku
-- ----------------------------
DROP TABLE IF EXISTS `goods_sku`;
CREATE TABLE `goods_sku`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `goods_id` int(11) NULL DEFAULT NULL COMMENT '商品id',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '名字',
  `inventory` int(11) NULL DEFAULT 0 COMMENT '商品数量',
  `price` float(10, 2) NULL DEFAULT NULL COMMENT '新价格',
  `old_price` float(10, 2) NULL DEFAULT NULL COMMENT '原价',
  `picture` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图片',
  `desc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '介绍',
  `specs` json NULL COMMENT '属性，[]',
  `created_at` datetime(0) NOT NULL,
  `updated_at` datetime(0) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of goods_sku
-- ----------------------------
INSERT INTO `goods_sku` VALUES (1, 10, NULL, 80, 110.00, 99.00, 'http://192.168.0.102:6452/show/public/img/fenshangjian/default/02ccbbf8-e882-474e-967a-47f9571a2290.jpg', NULL, '[{\"key\": \"颜色\", \"value\": \"白色\"}]', '2021-12-31 23:36:25', '2021-12-31 23:36:25');
INSERT INTO `goods_sku` VALUES (2, 10, NULL, 70, 100.00, 99.00, 'http://192.168.0.102:6452/show/public/img/fenshangjian/default/5-T1.jpg', NULL, '[{\"key\": \"颜色\", \"value\": \"黑色\"}]', '2021-12-31 23:36:25', '2021-12-31 23:36:25');
INSERT INTO `goods_sku` VALUES (3, 11, NULL, 80, 100.00, 90.00, '', NULL, '[{\"key\": \"颜色\", \"value\": \"白色\"}]', '2021-12-31 23:37:30', '2021-12-31 23:37:30');
INSERT INTO `goods_sku` VALUES (4, 11, NULL, 80, 100.03, 90.00, '', NULL, '[{\"key\": \"颜色\", \"value\": \"黑色\"}]', '2021-12-31 23:37:30', '2021-12-31 23:37:30');
INSERT INTO `goods_sku` VALUES (5, 12, NULL, 0, 0.00, 0.00, '', NULL, '[{\"key\": \"颜色\", \"value\": \"白色\"}, {\"key\": \"尺码\", \"value\": \"36\"}]', '2022-01-01 00:58:20', '2022-01-01 00:58:20');
INSERT INTO `goods_sku` VALUES (6, 12, NULL, 0, 0.00, 0.00, '', NULL, '[{\"key\": \"颜色\", \"value\": \"白色\"}, {\"key\": \"尺码\", \"value\": \"37\"}]', '2022-01-01 00:58:20', '2022-01-01 00:58:20');
INSERT INTO `goods_sku` VALUES (7, 12, NULL, 0, 0.00, 0.00, '', NULL, '[{\"key\": \"颜色\", \"value\": \"黑色\"}, {\"key\": \"尺码\", \"value\": \"36\"}]', '2022-01-01 00:58:20', '2022-01-01 00:58:20');
INSERT INTO `goods_sku` VALUES (8, 12, NULL, 300, 56.34, 120.00, '', NULL, '[{\"key\": \"颜色\", \"value\": \"黑色\"}, {\"key\": \"尺码\", \"value\": \"37\"}]', '2022-01-01 00:58:20', '2022-01-01 00:58:20');
INSERT INTO `goods_sku` VALUES (9, 13, NULL, 0, 0.00, 0.00, '', NULL, '[{\"key\": \"颜色\", \"value\": \"白色\"}, {\"key\": \"尺码\", \"value\": \"36\"}]', '2022-01-01 01:17:25', '2022-01-01 01:17:25');
INSERT INTO `goods_sku` VALUES (10, 13, NULL, 0, 0.00, 0.00, '', NULL, '[{\"key\": \"颜色\", \"value\": \"白色\"}, {\"key\": \"尺码\", \"value\": \"37\"}]', '2022-01-01 01:17:25', '2022-01-01 01:17:25');
INSERT INTO `goods_sku` VALUES (11, 13, NULL, 0, 0.00, 0.00, '', NULL, '[{\"key\": \"颜色\", \"value\": \"黑色\"}, {\"key\": \"尺码\", \"value\": \"36\"}]', '2022-01-01 01:17:25', '2022-01-01 01:17:25');
INSERT INTO `goods_sku` VALUES (12, 13, NULL, 0, 0.00, 0.00, '', NULL, '[{\"key\": \"颜色\", \"value\": \"黑色\"}, {\"key\": \"尺码\", \"value\": \"37\"}]', '2022-01-01 01:17:25', '2022-01-01 01:17:25');

-- ----------------------------
-- Table structure for goods_sku_specs
-- ----------------------------
DROP TABLE IF EXISTS `goods_sku_specs`;
CREATE TABLE `goods_sku_specs`  (
  `created_at` datetime(0) NOT NULL,
  `updated_at` datetime(0) NOT NULL,
  `sku_id` int(11) NOT NULL,
  `specs_id` int(11) NOT NULL,
  PRIMARY KEY (`sku_id`, `specs_id`) USING BTREE,
  INDEX `specs_id`(`specs_id`) USING BTREE,
  CONSTRAINT `goods_sku_specs_ibfk_1` FOREIGN KEY (`sku_id`) REFERENCES `goods_sku` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `goods_sku_specs_ibfk_2` FOREIGN KEY (`specs_id`) REFERENCES `specs` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of goods_sku_specs
-- ----------------------------

-- ----------------------------
-- Table structure for img-map
-- ----------------------------
DROP TABLE IF EXISTS `img-map`;
CREATE TABLE `img-map`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `super_id` int(11) NULL DEFAULT 0 COMMENT '父id',
  `value` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '文件名字， 只能是英文',
  `desc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '描述',
  `layer` int(11) NULL DEFAULT 0 COMMENT '排序0',
  `status` tinyint(1) NULL DEFAULT 0 COMMENT '状态是否使用',
  `created_at` datetime(0) NOT NULL,
  `updated_at` datetime(0) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of img-map
-- ----------------------------
INSERT INTO `img-map` VALUES (1, '风尚间', 0, 'fenshangjian', '默认地址', 0, 0, '2021-12-31 17:19:37', '2021-12-31 17:19:40');
INSERT INTO `img-map` VALUES (2, '默认图片', 1, 'default', '默认图片地址路径', 0, 0, '2021-12-31 17:20:10', '2021-12-31 17:20:14');

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '角色名',
  `desc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '介绍，权限说明',
  `super_id` int(11) NULL DEFAULT 0 COMMENT '父id',
  `status` tinyint(1) NULL DEFAULT 0 COMMENT '状态是否使用',
  `created_at` datetime(0) NOT NULL,
  `updated_at` datetime(0) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of role
-- ----------------------------

-- ----------------------------
-- Table structure for shop-cart
-- ----------------------------
DROP TABLE IF EXISTS `shop-cart`;
CREATE TABLE `shop-cart`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `goods_id` int(11) NULL DEFAULT NULL COMMENT '商品id',
  `sku_id` int(11) NULL DEFAULT NULL COMMENT 'skuid',
  `user_id` int(11) NOT NULL,
  `shop_number` int(11) NULL DEFAULT 0 COMMENT '商品数量',
  `created_at` datetime(0) NOT NULL,
  `updated_at` datetime(0) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE,
  CONSTRAINT `shop-cart_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `good_user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of shop-cart
-- ----------------------------
INSERT INTO `shop-cart` VALUES (1, 12, 8, 3, 4, '2022-01-01 16:45:45', '2022-01-01 16:46:04');
INSERT INTO `shop-cart` VALUES (2, 11, 4, 3, 1, '2022-01-01 17:40:57', '2022-01-01 17:40:57');

-- ----------------------------
-- Table structure for specs
-- ----------------------------
DROP TABLE IF EXISTS `specs`;
CREATE TABLE `specs`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '名字',
  `super_id` int(11) NULL DEFAULT 0 COMMENT '父id',
  `desc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '介绍',
  `created_at` datetime(0) NOT NULL,
  `updated_at` datetime(0) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of specs
-- ----------------------------
INSERT INTO `specs` VALUES (1, '颜色', 0, 'zhe', '2021-12-31 22:39:05', '2021-12-31 22:39:05');
INSERT INTO `specs` VALUES (2, '白色', 1, '', '2021-12-31 22:39:05', '2021-12-31 22:39:05');
INSERT INTO `specs` VALUES (3, '黑色', 1, '', '2021-12-31 22:39:05', '2021-12-31 22:39:05');
INSERT INTO `specs` VALUES (4, '红色', 1, '', '2021-12-31 22:39:05', '2021-12-31 22:39:05');
INSERT INTO `specs` VALUES (5, '尺码', 0, 'zhe', '2021-12-31 22:39:26', '2021-12-31 22:39:26');
INSERT INTO `specs` VALUES (6, '36', 5, '', '2021-12-31 22:39:26', '2021-12-31 22:39:26');
INSERT INTO `specs` VALUES (7, '37', 5, '', '2021-12-31 22:39:26', '2021-12-31 22:39:26');

-- ----------------------------
-- Table structure for tags_goods
-- ----------------------------
DROP TABLE IF EXISTS `tags_goods`;
CREATE TABLE `tags_goods`  (
  `created_at` datetime(0) NOT NULL,
  `updated_at` datetime(0) NOT NULL,
  `goods_id` int(11) NOT NULL,
  `goods_tag_id` int(11) NOT NULL,
  PRIMARY KEY (`goods_id`, `goods_tag_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tags_goods
-- ----------------------------
INSERT INTO `tags_goods` VALUES ('2021-12-31 23:04:57', '2021-12-31 23:04:57', 8, 1);
INSERT INTO `tags_goods` VALUES ('2021-12-31 23:36:26', '2021-12-31 23:36:26', 10, 1);
INSERT INTO `tags_goods` VALUES ('2021-12-31 23:37:30', '2021-12-31 23:37:30', 11, 1);
INSERT INTO `tags_goods` VALUES ('2022-01-01 00:58:20', '2022-01-01 00:58:20', 12, 1);
INSERT INTO `tags_goods` VALUES ('2022-01-01 01:17:25', '2022-01-01 01:17:25', 13, 1);

-- ----------------------------
-- Table structure for user-by-shop
-- ----------------------------
DROP TABLE IF EXISTS `user-by-shop`;
CREATE TABLE `user-by-shop`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `order_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '订单号',
  `shop_number` int(11) NULL DEFAULT 0 COMMENT '商品数量',
  `address` json NULL COMMENT '收获地址',
  `status` int(11) NULL DEFAULT 1 COMMENT '购物状态，0 待付款，1已完成 ，2退款中，3退款完成',
  `created_at` datetime(0) NOT NULL,
  `updated_at` datetime(0) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `order_id`(`order_id`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE,
  CONSTRAINT `user-by-shop_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `good_user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user-by-shop
-- ----------------------------
INSERT INTO `user-by-shop` VALUES (9, 3, '16411142211874040891758', 4, '{\"id\": 1, \"name\": \"小明\", \"iPhone\": \"15607191234\", \"userId\": 3, \"address\": \"成都新城\", \"isDefault\": false, \"created_at\": \"2022-01-02\", \"postalCode\": \"00000\", \"updated_at\": \"2022-01-01T17:59:02.000Z\", \"fullLocation\": \"湖北省 武汉市 江岸区\"}', 0, '2022-01-02 17:03:41', '2022-01-02 17:03:41');
INSERT INTO `user-by-shop` VALUES (10, 3, '16411150478595458455279', 4, '{\"id\": 1, \"name\": \"小明\", \"iPhone\": \"15607191234\", \"userId\": 3, \"address\": \"成都新城\", \"isDefault\": false, \"created_at\": \"2022-01-02\", \"postalCode\": \"00000\", \"updated_at\": \"2022-01-01T17:59:02.000Z\", \"fullLocation\": \"湖北省 武汉市 江岸区\"}', 0, '2022-01-02 17:17:27', '2022-01-02 17:17:27');
INSERT INTO `user-by-shop` VALUES (11, 3, '16411159841448134986775', 4, '{\"id\": 1, \"name\": \"小明\", \"iPhone\": \"15607191234\", \"userId\": 3, \"address\": \"成都新城\", \"isDefault\": false, \"created_at\": \"2022-01-02\", \"postalCode\": \"00000\", \"updated_at\": \"2022-01-01T17:59:02.000Z\", \"fullLocation\": \"湖北省 武汉市 江岸区\"}', 0, '2022-01-02 17:33:04', '2022-01-02 17:33:04');
INSERT INTO `user-by-shop` VALUES (12, 3, '16411161027094422140798', 4, '{\"id\": 1, \"name\": \"小明\", \"iPhone\": \"15607191234\", \"userId\": 3, \"address\": \"成都新城\", \"isDefault\": false, \"created_at\": \"2022-01-02\", \"postalCode\": \"00000\", \"updated_at\": \"2022-01-01T17:59:02.000Z\", \"fullLocation\": \"湖北省 武汉市 江岸区\"}', 0, '2022-01-02 17:35:02', '2022-01-02 17:35:02');
INSERT INTO `user-by-shop` VALUES (13, 3, '16411289977229098745672', 1, '{\"id\": 1, \"name\": \"小明\", \"iPhone\": \"15607191234\", \"userId\": 3, \"address\": \"成都新城\", \"isDefault\": false, \"created_at\": \"2022-01-02\", \"postalCode\": \"00000\", \"updated_at\": \"2022-01-01T17:59:02.000Z\", \"fullLocation\": \"湖北省 武汉市 江岸区\"}', 0, '2022-01-02 21:09:57', '2022-01-02 21:09:57');
INSERT INTO `user-by-shop` VALUES (14, 3, '16411387087309607165549', 1, '{\"id\": 1, \"name\": \"小明\", \"iPhone\": \"15607191234\", \"userId\": 3, \"address\": \"成都新城\", \"isDefault\": false, \"created_at\": \"2022-01-02\", \"postalCode\": \"00000\", \"updated_at\": \"2022-01-01T17:59:02.000Z\", \"fullLocation\": \"湖北省 武汉市 江岸区\"}', 0, '2022-01-02 23:51:48', '2022-01-02 23:51:48');
INSERT INTO `user-by-shop` VALUES (15, 3, '16411398155668212805636', 1, '{\"id\": 1, \"name\": \"小明\", \"iPhone\": \"15607191234\", \"userId\": 3, \"address\": \"成都新城\", \"isDefault\": false, \"created_at\": \"2022-01-02\", \"postalCode\": \"00000\", \"updated_at\": \"2022-01-01T17:59:02.000Z\", \"fullLocation\": \"湖北省 武汉市 江岸区\"}', 0, '2022-01-03 00:10:15', '2022-01-03 00:10:15');

SET FOREIGN_KEY_CHECKS = 1;
