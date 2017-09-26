/*
Navicat MySQL Data Transfer

Source Server         : 127.0.0.1
Source Server Version : 50623
Source Host           : localhost:3306
Source Database       : layui

Target Server Type    : MYSQL
Target Server Version : 50623
File Encoding         : 65001

Date: 2017-09-19 09:51:13
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for appointment
-- ----------------------------
DROP TABLE IF EXISTS `appointment`;
CREATE TABLE `appointment` (
  `book_id` bigint(20) NOT NULL COMMENT '图书ID',
  `student_id` bigint(20) NOT NULL COMMENT '学号',
  `appoint_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '预约时间',
  PRIMARY KEY (`book_id`,`student_id`),
  KEY `idx_appoint_time` (`appoint_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='预约图书表';

-- ----------------------------
-- Records of appointment
-- ----------------------------

-- ----------------------------
-- Table structure for article
-- ----------------------------
DROP TABLE IF EXISTS `article`;
CREATE TABLE `article` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '文章id 自增',
  `qkid` int(10) NOT NULL COMMENT '关联期刊id 参考 periocal表id',
  `title` varchar(200) NOT NULL COMMENT '文章标题',
  `wzimage` varchar(100) DEFAULT NULL COMMENT '文章主图',
  `wzinfo` text COMMENT '文章内容',
  `type` int(5) DEFAULT NULL COMMENT '文章分类(参见板块管理表)',
  `writetime` datetime DEFAULT NULL COMMENT '录入时间',
  `istop` enum('N','Y') NOT NULL DEFAULT 'N' COMMENT '是否置顶 Y 是 N 否',
  PRIMARY KEY (`id`,`qkid`)
) ENGINE=InnoDB AUTO_INCREMENT=198 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of article
-- ----------------------------
INSERT INTO `article` VALUES ('197', '32', '1212', '/layui/images/resources/20170617094718891.png', '<img src=\"/layui/images/resources/20170617095807767.png\" alt=\"20170617095807767.png\"></img>', '100', '2017-06-17 09:58:14', 'N');

-- ----------------------------
-- Table structure for artype
-- ----------------------------
DROP TABLE IF EXISTS `artype`;
CREATE TABLE `artype` (
  `code` int(3) NOT NULL COMMENT '板块类型编码',
  `type` varchar(10) DEFAULT NULL COMMENT '板块类型名称',
  PRIMARY KEY (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of artype
-- ----------------------------
INSERT INTO `artype` VALUES ('100', '头条版');
INSERT INTO `artype` VALUES ('200', '资讯版');
INSERT INTO `artype` VALUES ('300', '分享版');
INSERT INTO `artype` VALUES ('400', '综合版');

-- ----------------------------
-- Table structure for book
-- ----------------------------
DROP TABLE IF EXISTS `book`;
CREATE TABLE `book` (
  `book_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '图书ID',
  `name` varchar(100) NOT NULL COMMENT '图书名称',
  `number` int(11) NOT NULL COMMENT '馆藏数量',
  PRIMARY KEY (`book_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1004 DEFAULT CHARSET=utf8 COMMENT='图书表';

-- ----------------------------
-- Records of book
-- ----------------------------
INSERT INTO `book` VALUES ('1000', 'Java程序设计', '10');
INSERT INTO `book` VALUES ('1001', '数据结构', '10');
INSERT INTO `book` VALUES ('1002', '设计模式', '10');
INSERT INTO `book` VALUES ('1003', '编译原理', '10');

-- ----------------------------
-- Table structure for periodcal
-- ----------------------------
DROP TABLE IF EXISTS `periodcal`;
CREATE TABLE `periodcal` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '报刊ID',
  `qknum` int(8) NOT NULL COMMENT '报刊期号',
  `qkname` varchar(100) DEFAULT NULL COMMENT '期刊名称',
  `isnew` enum('Y','N') DEFAULT NULL COMMENT '是否设置为最新 Y 是 N 否',
  `releasetime` date DEFAULT NULL COMMENT '期刊发布时间',
  `createtime` date DEFAULT NULL COMMENT '期刊添加时间',
  `isrelease` enum('N','Y') DEFAULT NULL COMMENT '是否已发布 Y 是 N 否',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of periodcal
-- ----------------------------
INSERT INTO `periodcal` VALUES ('32', '123', '123', 'N', null, '2017-06-17', 'N');

-- ----------------------------
-- Table structure for sysimages
-- ----------------------------
DROP TABLE IF EXISTS `sysimages`;
CREATE TABLE `sysimages` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `sys_logo` varchar(100) DEFAULT NULL COMMENT '系统通用顶部log图片',
  `sydb_logo` varchar(100) DEFAULT NULL COMMENT '首页底部LOGO',
  `tc_twocode` varchar(100) DEFAULT NULL COMMENT '弹出二维码',
  `qywh_info` varchar(100) DEFAULT NULL COMMENT '企业文化整张图片',
  `fmtp_info` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sysimages
-- ----------------------------
INSERT INTO `sysimages` VALUES ('1', '20170623174257688.png', '20170623174305713.png', '20170623174308161.png', '20170623174312996.png', '20170623174251033.png');

-- ----------------------------
-- Table structure for sysparams
-- ----------------------------
DROP TABLE IF EXISTS `sysparams`;
CREATE TABLE `sysparams` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `sydb_zcan` varchar(100) DEFAULT NULL COMMENT '首页下方左侧按钮',
  `sydb_ycan` varchar(100) DEFAULT NULL COMMENT '首页下方右侧按钮',
  `sydb_bqwz` varchar(100) DEFAULT NULL COMMENT '首页底部版权文字',
  `qywh_dban` varchar(100) DEFAULT NULL COMMENT '企业文化页面底部按钮文字',
  `qkxq_dban` varchar(100) DEFAULT NULL COMMENT '期刊详情页面底部按钮',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sysparams
-- ----------------------------
INSERT INTO `sysparams` VALUES ('1', '邀请分享', '欢迎投稿', '深圳市心感力量文化传播有限公司', '精彩内容 指尖呈现', '查看更多期刊');

-- ----------------------------
-- Table structure for tbl_dept
-- ----------------------------
DROP TABLE IF EXISTS `tbl_dept`;
CREATE TABLE `tbl_dept` (
  `dept_id` int(11) NOT NULL,
  `dept_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`dept_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tbl_dept
-- ----------------------------
INSERT INTO `tbl_dept` VALUES ('1', '开发部');
INSERT INTO `tbl_dept` VALUES ('2', '测试部');

-- ----------------------------
-- Table structure for tbl_emp
-- ----------------------------
DROP TABLE IF EXISTS `tbl_emp`;
CREATE TABLE `tbl_emp` (
  `emp_id` int(11) NOT NULL AUTO_INCREMENT,
  `emp_name` varchar(255) DEFAULT NULL,
  `gender` char(1) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `d_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`emp_id`),
  KEY `fk_emp_dept` (`d_id`),
  CONSTRAINT `fk_emp_dept` FOREIGN KEY (`d_id`) REFERENCES `tbl_dept` (`dept_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1006 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tbl_emp
-- ----------------------------
INSERT INTO `tbl_emp` VALUES ('8', '1a5044', 'M', '1a5044@atguigu.com', '2');
INSERT INTO `tbl_emp` VALUES ('9', '0c5895', 'M', '0c5895@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('10', '973d06', 'M', '973d06@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('11', 'ef97d7', 'M', 'ef97d7@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('12', '7ab2a8', 'M', '7ab2a8@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('13', '877f49', 'M', '877f49@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('14', 'feff610', 'M', 'feff610@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('15', 'b3b4811', 'M', 'b3b4811@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('16', '115c712', 'M', '115c712@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('17', 'f6f1013', 'M', 'f6f1013@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('18', '2574614', 'M', '2574614@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('19', 'a92c815', 'M', 'a92c815@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('20', 'ab92c16', 'M', 'ab92c16@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('21', '702b317', 'M', '702b317@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('22', '85c4418', 'M', '85c4418@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('23', 'e2b9319', 'M', 'e2b9319@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('24', 'fbc3620', 'M', 'fbc3620@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('25', '6678121', 'M', '6678121@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('26', '3828022', 'M', '3828022@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('28', 'b4b1824', 'M', 'b4b1824@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('29', '5317d25', 'M', '5317d25@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('30', 'baf3526', 'M', 'baf3526@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('31', '107c627', 'M', '107c627@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('32', '87b2728', 'M', '87b2728@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('33', 'e6f3c29', 'M', 'e6f3c29@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('34', '9018b30', 'M', '9018b30@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('35', '0298931', 'M', '0298931@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('36', 'ab37632', 'M', 'ab37632@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('37', '818c133', 'M', '818c133@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('38', '2e6ee34', 'M', '2e6ee34@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('39', 'a731d35', 'M', 'a731d35@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('40', '33f0436', 'M', '33f0436@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('41', 'ef23737', 'M', 'ef23737@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('42', '0b0fc38', 'M', '0b0fc38@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('43', 'e238239', 'M', 'e238239@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('44', '5fd5840', 'M', '5fd5840@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('45', 'd650941', 'M', 'd650941@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('46', '1b71942', 'M', '1b71942@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('47', 'cf48143', 'M', 'cf48143@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('48', 'f0a7b44', 'M', 'f0a7b44@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('49', '35b1a45', 'M', '35b1a45@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('50', 'be15346', 'M', 'be15346@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('51', '3cbc247', 'M', '3cbc247@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('52', '4c11848', 'M', '4c11848@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('53', '3041b49', 'M', '3041b49@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('54', '6151f50', 'M', '6151f50@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('55', '7e26651', 'M', '7e26651@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('56', '2004e52', 'M', '2004e52@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('57', 'da30d53', 'M', 'da30d53@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('58', 'ae3e454', 'M', 'ae3e454@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('59', 'b866a55', 'M', 'b866a55@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('60', '6e9e156', 'M', '6e9e156@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('61', 'c100f57', 'M', 'c100f57@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('62', 'e1e3758', 'M', 'e1e3758@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('63', 'cbc0259', 'M', 'cbc0259@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('64', 'e8f1360', 'M', 'e8f1360@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('65', 'ef3f761', 'M', 'ef3f761@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('66', '818b962', 'M', '818b962@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('67', 'c15e763', 'M', 'c15e763@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('68', '3a93e64', 'M', '3a93e64@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('69', '12d0665', 'M', '12d0665@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('70', 'b6f2c66', 'M', 'b6f2c66@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('71', '6e75367', 'M', '6e75367@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('72', 'ac94168', 'M', 'ac94168@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('73', '724b669', 'M', '724b669@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('74', '9086970', 'M', '9086970@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('75', 'b437071', 'M', 'b437071@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('76', '8132b72', 'M', '8132b72@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('77', '2970d73', 'M', '2970d73@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('78', '6cd8074', 'M', '6cd8074@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('79', '2dfaf75', 'M', '2dfaf75@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('80', '0a69776', 'M', '0a69776@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('81', 'cc4e277', 'M', 'cc4e277@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('82', '1cdb178', 'M', '1cdb178@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('83', 'f8fe279', 'M', 'f8fe279@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('84', 'e247880', 'M', 'e247880@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('85', 'bcdb381', 'M', 'bcdb381@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('86', 'be51c82', 'M', 'be51c82@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('87', '57aad83', 'M', '57aad83@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('88', '5575284', 'M', '5575284@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('89', '3ba7785', 'M', '3ba7785@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('90', 'ed2d386', 'M', 'ed2d386@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('91', 'efdb487', 'M', 'efdb487@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('92', '190d888', 'M', '190d888@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('93', 'ce2c189', 'M', 'ce2c189@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('94', '0872890', 'M', '0872890@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('95', '09fd291', 'M', '09fd291@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('96', 'd45ab92', 'M', 'd45ab92@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('97', '11bac93', 'M', '11bac93@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('98', '498d894', 'M', '498d894@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('99', 'e7ba395', 'M', 'e7ba395@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('100', 'e9ea896', 'M', 'e9ea896@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('101', '1663497', 'M', '1663497@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('102', '8442098', 'M', '8442098@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('103', '8d38299', 'M', '8d38299@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('104', '335aa100', 'M', '335aa100@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('105', '96d5c101', 'M', '96d5c101@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('106', '15898102', 'M', '15898102@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('107', '8151d103', 'M', '8151d103@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('108', '9ac90104', 'M', '9ac90104@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('109', '33b82105', 'M', '33b82105@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('110', '5fe5e106', 'M', '5fe5e106@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('111', '1cf68107', 'M', '1cf68107@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('112', 'ba5b2108', 'M', 'ba5b2108@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('113', '7d0e6109', 'M', '7d0e6109@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('114', '59c02110', 'M', '59c02110@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('115', '64a42111', 'M', '64a42111@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('116', '27b98112', 'M', '27b98112@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('117', '26feb113', 'M', '26feb113@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('118', '4a86c114', 'M', '4a86c114@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('119', 'eaaa2115', 'M', 'eaaa2115@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('120', 'ceed8116', 'M', 'ceed8116@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('121', 'ddaee117', 'M', 'ddaee117@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('122', '857e2118', 'M', '857e2118@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('123', '06283119', 'M', '06283119@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('124', '291d7120', 'M', '291d7120@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('125', 'cf746121', 'M', 'cf746121@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('126', 'a6ea2122', 'M', 'a6ea2122@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('127', '4e271123', 'M', '4e271123@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('128', '95b59124', 'M', '95b59124@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('129', '5c380125', 'M', '5c380125@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('130', 'e287e126', 'M', 'e287e126@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('131', '9f9c6127', 'M', '9f9c6127@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('132', '2d3bc128', 'M', '2d3bc128@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('133', 'f3e49129', 'M', 'f3e49129@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('134', 'a1d09130', 'M', 'a1d09130@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('135', '5250d131', 'M', '5250d131@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('136', '3d436132', 'M', '3d436132@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('137', '31e87133', 'M', '31e87133@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('138', '29fa0134', 'M', '29fa0134@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('139', '37117135', 'M', '37117135@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('140', 'e6ace136', 'M', 'e6ace136@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('141', '5b531137', 'M', '5b531137@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('142', '73231138', 'M', '73231138@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('143', 'b7d2d139', 'M', 'b7d2d139@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('144', '0ab9d140', 'M', '0ab9d140@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('145', '70b46141', 'M', '70b46141@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('146', '937ab142', 'M', '937ab142@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('147', '79309143', 'M', '79309143@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('148', '629d1144', 'M', '629d1144@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('149', 'a6635145', 'M', 'a6635145@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('150', '045c3146', 'M', '045c3146@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('151', 'a2da2147', 'M', 'a2da2147@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('152', 'd22fe148', 'M', 'd22fe148@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('153', '47de6149', 'M', '47de6149@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('154', '4a5b0150', 'M', '4a5b0150@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('155', 'e8631151', 'M', 'e8631151@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('156', '9a441152', 'M', '9a441152@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('157', '7e664153', 'M', '7e664153@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('158', 'c4007154', 'M', 'c4007154@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('159', 'df46b155', 'M', 'df46b155@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('160', 'b0fae156', 'M', 'b0fae156@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('161', '9f658157', 'M', '9f658157@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('162', '9df72158', 'M', '9df72158@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('163', 'f308c159', 'M', 'f308c159@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('164', '4e90d160', 'M', '4e90d160@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('165', 'a7321161', 'M', 'a7321161@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('166', '6bc46162', 'M', '6bc46162@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('167', '3a557163', 'M', '3a557163@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('168', 'e6a08164', 'M', 'e6a08164@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('169', '273ce165', 'M', '273ce165@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('170', 'e37fd166', 'M', 'e37fd166@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('171', 'dba3f167', 'M', 'dba3f167@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('172', '9eb7f168', 'M', '9eb7f168@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('173', '47bb3169', 'M', '47bb3169@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('174', '45fa3170', 'M', '45fa3170@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('175', '3e92a171', 'M', '3e92a171@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('176', '8c226172', 'M', '8c226172@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('177', '6ce8c173', 'M', '6ce8c173@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('178', '2ac74174', 'M', '2ac74174@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('179', 'be760175', 'M', 'be760175@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('180', '33023176', 'M', '33023176@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('181', '97da6177', 'M', '97da6177@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('182', '79e08178', 'M', '79e08178@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('183', 'a00b5179', 'M', 'a00b5179@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('184', '3eef6180', 'M', '3eef6180@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('185', 'c433b181', 'M', 'c433b181@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('186', 'be803182', 'M', 'be803182@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('187', '669ca183', 'M', '669ca183@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('188', 'c57fb184', 'M', 'c57fb184@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('189', '543d3185', 'M', '543d3185@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('190', '6641e186', 'M', '6641e186@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('191', '962a3187', 'M', '962a3187@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('192', '0d84c188', 'M', '0d84c188@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('193', 'a14b2189', 'M', 'a14b2189@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('194', '0d1a3190', 'M', '0d1a3190@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('195', 'f7218191', 'M', 'f7218191@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('196', 'c116d192', 'M', 'c116d192@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('197', '8cc1a193', 'M', '8cc1a193@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('198', 'a7212194', 'M', 'a7212194@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('199', '07a86195', 'M', '07a86195@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('200', '6b171196', 'M', '6b171196@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('201', 'dd2a5197', 'M', 'dd2a5197@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('202', 'c1f0b198', 'M', 'c1f0b198@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('203', '8526d199', 'M', '8526d199@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('204', '1bfec200', 'M', '1bfec200@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('205', '78751201', 'M', '78751201@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('206', '6580f202', 'M', '6580f202@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('207', '25c43203', 'M', '25c43203@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('208', 'c9bb9204', 'M', 'c9bb9204@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('209', '40b68205', 'M', '40b68205@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('210', 'd30ae206', 'M', 'd30ae206@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('211', '78b04207', 'M', '78b04207@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('212', '26b9a208', 'M', '26b9a208@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('213', '7164b209', 'M', '7164b209@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('214', '75c25210', 'M', '75c25210@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('215', 'b0edc211', 'M', 'b0edc211@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('216', 'e9466212', 'M', 'e9466212@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('217', 'eb908213', 'M', 'eb908213@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('218', '75c80214', 'M', '75c80214@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('219', 'a7ca3215', 'M', 'a7ca3215@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('220', 'fe697216', 'M', 'fe697216@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('221', '6b148217', 'M', '6b148217@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('222', '3b769218', 'M', '3b769218@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('223', 'ccb61219', 'M', 'ccb61219@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('224', '9cd20220', 'M', '9cd20220@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('225', '957c7221', 'M', '957c7221@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('226', '9b986222', 'M', '9b986222@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('227', 'fb1cd223', 'M', 'fb1cd223@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('228', 'd9624224', 'M', 'd9624224@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('229', '7cbd3225', 'M', '7cbd3225@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('230', '777ad226', 'M', '777ad226@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('231', 'c92a4227', 'M', 'c92a4227@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('232', '7888d228', 'M', '7888d228@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('233', '02516229', 'M', '02516229@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('234', '0f350230', 'M', '0f350230@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('235', '0aa19231', 'M', '0aa19231@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('236', '2a59d232', 'M', '2a59d232@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('237', 'f02df233', 'M', 'f02df233@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('238', 'af47d234', 'M', 'af47d234@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('239', 'ae46d235', 'M', 'ae46d235@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('240', '45294236', 'M', '45294236@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('241', 'b4f4a237', 'M', 'b4f4a237@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('242', 'a9579238', 'M', 'a9579238@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('243', '349a1239', 'M', '349a1239@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('244', '52118240', 'M', '52118240@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('245', 'df0a6241', 'M', 'df0a6241@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('246', 'e1485242', 'M', 'e1485242@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('247', '49d4a243', 'M', '49d4a243@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('248', '8c983244', 'M', '8c983244@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('249', '7dae7245', 'M', '7dae7245@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('250', '8c0c2246', 'M', '8c0c2246@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('251', '6af68247', 'M', '6af68247@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('252', 'e5047248', 'M', 'e5047248@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('253', 'ef055249', 'M', 'ef055249@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('254', '28b60250', 'M', '28b60250@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('255', 'a4c6f251', 'M', 'a4c6f251@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('256', 'e21f9252', 'M', 'e21f9252@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('257', '201f0253', 'M', '201f0253@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('258', '3cff4254', 'M', '3cff4254@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('259', '17048255', 'M', '17048255@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('260', '702f0256', 'M', '702f0256@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('261', '10980257', 'M', '10980257@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('262', 'b31ad258', 'M', 'b31ad258@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('263', '2bfdd259', 'M', '2bfdd259@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('264', 'da7e9260', 'M', 'da7e9260@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('265', '3d051261', 'M', '3d051261@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('266', '0a892262', 'M', '0a892262@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('267', '4960a263', 'M', '4960a263@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('268', '7944f264', 'M', '7944f264@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('269', '8b9df265', 'M', '8b9df265@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('270', '15530266', 'M', '15530266@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('271', 'a202a267', 'M', 'a202a267@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('272', '7795c268', 'M', '7795c268@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('273', '5615a269', 'M', '5615a269@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('274', '1faf3270', 'M', '1faf3270@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('275', 'b5773271', 'M', 'b5773271@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('276', 'cb624272', 'M', 'cb624272@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('277', '1f3ca273', 'M', '1f3ca273@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('278', '1915e274', 'M', '1915e274@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('279', 'bcdfe275', 'M', 'bcdfe275@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('280', '17678276', 'M', '17678276@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('281', 'c3024277', 'M', 'c3024277@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('282', '309ef278', 'M', '309ef278@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('283', 'e4a61279', 'M', 'e4a61279@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('284', 'a90a2280', 'M', 'a90a2280@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('285', '4885b281', 'M', '4885b281@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('286', 'c22e8282', 'M', 'c22e8282@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('287', 'c6404283', 'M', 'c6404283@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('288', 'dc991284', 'M', 'dc991284@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('289', 'b1c45285', 'M', 'b1c45285@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('290', '96ff8286', 'M', '96ff8286@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('291', '170d3287', 'M', '170d3287@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('292', '49312288', 'M', '49312288@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('293', 'b4cd9289', 'M', 'b4cd9289@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('294', '08927290', 'M', '08927290@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('295', 'c34b4291', 'M', 'c34b4291@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('296', 'e5d71292', 'M', 'e5d71292@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('297', '597c1293', 'M', '597c1293@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('298', 'd6830294', 'M', 'd6830294@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('299', '8c7fd295', 'M', '8c7fd295@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('300', 'bbeca296', 'M', 'bbeca296@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('301', '577bd297', 'M', '577bd297@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('302', '05fc6298', 'M', '05fc6298@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('303', '20a6d299', 'M', '20a6d299@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('304', '428cf300', 'M', '428cf300@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('305', '162ee301', 'M', '162ee301@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('306', 'bb310302', 'M', 'bb310302@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('307', '57f07303', 'M', '57f07303@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('308', '52bc3304', 'M', '52bc3304@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('309', 'da08a305', 'M', 'da08a305@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('310', '53828306', 'M', '53828306@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('311', '78d16307', 'M', '78d16307@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('312', 'b037c308', 'M', 'b037c308@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('313', '7fbd3309', 'M', '7fbd3309@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('314', 'c6a4a310', 'M', 'c6a4a310@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('315', '5dfec311', 'M', '5dfec311@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('316', 'd65f1312', 'M', 'd65f1312@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('317', '5c473313', 'M', '5c473313@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('318', 'bdaf0314', 'M', 'bdaf0314@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('319', 'c4746315', 'M', 'c4746315@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('320', '1766a316', 'M', '1766a316@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('321', '1a421317', 'M', '1a421317@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('322', '4e55c318', 'M', '4e55c318@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('323', '0523a319', 'M', '0523a319@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('324', '358e6320', 'M', '358e6320@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('325', 'b4836321', 'M', 'b4836321@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('326', '341f7322', 'M', '341f7322@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('327', '16e55323', 'M', '16e55323@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('328', '06d13324', 'M', '06d13324@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('329', '67a3d325', 'M', '67a3d325@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('330', '7ea98326', 'M', '7ea98326@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('331', 'fb2a3327', 'M', 'fb2a3327@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('332', '072dc328', 'M', '072dc328@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('333', 'eb376329', 'M', 'eb376329@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('334', 'fce2b330', 'M', 'fce2b330@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('335', '9eb7c331', 'M', '9eb7c331@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('336', 'b6ca2332', 'M', 'b6ca2332@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('337', 'd9cd1333', 'M', 'd9cd1333@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('338', '8477d334', 'M', '8477d334@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('339', '2219a335', 'M', '2219a335@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('340', '8d00f336', 'M', '8d00f336@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('341', '1f2c3337', 'M', '1f2c3337@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('342', '07f05338', 'M', '07f05338@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('343', 'd345d339', 'M', 'd345d339@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('344', 'bf4c6340', 'M', 'bf4c6340@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('345', '2a6b8341', 'M', '2a6b8341@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('346', '3967c342', 'M', '3967c342@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('347', '068aa343', 'M', '068aa343@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('348', 'fb71e344', 'M', 'fb71e344@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('349', '5f7ae345', 'M', '5f7ae345@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('350', '4aed2346', 'M', '4aed2346@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('351', '51ad5347', 'M', '51ad5347@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('352', '5436e348', 'M', '5436e348@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('353', '743ef349', 'M', '743ef349@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('354', '40ada350', 'M', '40ada350@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('355', 'c8e04351', 'M', 'c8e04351@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('356', '12b4a352', 'M', '12b4a352@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('357', 'a7a8c353', 'M', 'a7a8c353@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('358', '97eac354', 'M', '97eac354@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('359', '00246355', 'M', '00246355@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('360', '1be31356', 'M', '1be31356@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('361', '5b914357', 'M', '5b914357@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('362', '7dd5a358', 'M', '7dd5a358@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('363', 'de0ae359', 'M', 'de0ae359@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('364', '51aee360', 'M', '51aee360@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('365', '28576361', 'M', '28576361@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('366', 'be17b362', 'M', 'be17b362@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('367', '2e5f6363', 'M', '2e5f6363@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('368', '25519364', 'M', '25519364@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('369', '29160365', 'M', '29160365@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('370', 'f004f366', 'M', 'f004f366@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('371', '65f93367', 'M', '65f93367@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('372', '1ed96368', 'M', '1ed96368@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('373', '41e1a369', 'M', '41e1a369@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('374', '56668370', 'M', '56668370@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('375', '6e09e371', 'M', '6e09e371@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('376', 'b98a7372', 'M', 'b98a7372@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('377', '11819373', 'M', '11819373@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('378', '7c001374', 'M', '7c001374@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('379', 'c80c9375', 'M', 'c80c9375@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('380', '0e370376', 'M', '0e370376@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('381', 'b0859377', 'M', 'b0859377@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('382', 'c0265378', 'M', 'c0265378@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('383', '7c0ce379', 'M', '7c0ce379@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('384', '866bf380', 'M', '866bf380@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('385', '321a0381', 'M', '321a0381@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('386', '01316382', 'M', '01316382@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('387', 'f4be8383', 'M', 'f4be8383@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('388', '32f53384', 'M', '32f53384@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('389', 'facf0385', 'M', 'facf0385@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('390', 'adeb0386', 'M', 'adeb0386@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('391', '8c34b387', 'M', '8c34b387@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('392', '551db388', 'M', '551db388@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('393', '830b7389', 'M', '830b7389@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('394', '771ac390', 'M', '771ac390@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('395', 'd1872391', 'M', 'd1872391@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('396', 'bfddf392', 'M', 'bfddf392@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('397', '09963393', 'M', '09963393@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('398', 'eeff1394', 'M', 'eeff1394@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('399', '59bc8395', 'M', '59bc8395@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('400', '5af9f396', 'M', '5af9f396@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('401', '896e4397', 'M', '896e4397@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('402', '7750a398', 'M', '7750a398@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('403', '122a0399', 'M', '122a0399@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('404', '0fb09400', 'M', '0fb09400@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('405', '4ce04401', 'M', '4ce04401@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('406', '947dd402', 'M', '947dd402@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('407', '4fb2a403', 'M', '4fb2a403@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('408', 'b9a4c404', 'M', 'b9a4c404@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('409', '8b0d2405', 'M', '8b0d2405@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('410', '2b8cf406', 'M', '2b8cf406@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('411', '7625f407', 'M', '7625f407@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('412', 'b7d94408', 'M', 'b7d94408@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('413', '7573e409', 'M', '7573e409@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('414', 'a07de410', 'M', 'a07de410@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('415', '470ec411', 'M', '470ec411@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('416', '32d87412', 'M', '32d87412@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('417', '75e5b413', 'M', '75e5b413@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('418', '76f70414', 'M', '76f70414@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('419', '9e068415', 'M', '9e068415@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('420', 'ac581416', 'M', 'ac581416@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('421', '02316417', 'M', '02316417@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('422', 'cba11418', 'M', 'cba11418@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('423', '4726b419', 'M', '4726b419@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('424', 'f119c420', 'M', 'f119c420@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('425', 'c7938421', 'M', 'c7938421@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('426', '02cb1422', 'M', '02cb1422@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('427', 'c4a90423', 'M', 'c4a90423@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('428', '77fc5424', 'M', '77fc5424@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('429', '9645e425', 'M', '9645e425@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('430', 'f295c426', 'M', 'f295c426@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('431', 'ed9c4427', 'M', 'ed9c4427@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('432', 'c215a428', 'M', 'c215a428@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('433', '6be2b429', 'M', '6be2b429@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('434', '74e26430', 'M', '74e26430@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('435', '9983c431', 'M', '9983c431@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('436', 'afc80432', 'M', 'afc80432@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('437', 'dd055433', 'M', 'dd055433@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('438', 'e1e12434', 'M', 'e1e12434@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('439', '2f4fc435', 'M', '2f4fc435@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('440', '36c24436', 'M', '36c24436@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('441', 'b1201437', 'M', 'b1201437@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('442', '439f4438', 'M', '439f4438@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('443', '00ec6439', 'M', '00ec6439@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('444', 'caa7d440', 'M', 'caa7d440@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('445', 'd1b04441', 'M', 'd1b04441@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('446', 'f1551442', 'M', 'f1551442@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('447', '2e418443', 'M', '2e418443@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('448', '1439c444', 'M', '1439c444@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('449', 'e0a81445', 'M', 'e0a81445@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('450', '623ef446', 'M', '623ef446@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('451', '8433b447', 'M', '8433b447@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('452', '2f04a448', 'M', '2f04a448@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('453', '0bc83449', 'M', '0bc83449@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('454', '3328b450', 'M', '3328b450@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('455', '9b849451', 'M', '9b849451@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('456', '80c38452', 'M', '80c38452@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('457', '70a5b453', 'M', '70a5b453@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('458', 'eee2e454', 'M', 'eee2e454@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('459', 'b7b35455', 'M', 'b7b35455@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('460', 'f4953456', 'M', 'f4953456@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('461', 'd817c457', 'M', 'd817c457@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('462', '853ab458', 'M', '853ab458@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('463', '9d8db459', 'M', '9d8db459@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('464', 'f3fc0460', 'M', 'f3fc0460@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('465', '8eda6461', 'M', '8eda6461@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('466', '66b46462', 'M', '66b46462@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('467', '512b1463', 'M', '512b1463@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('468', '12b61464', 'M', '12b61464@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('469', '6227d465', 'M', '6227d465@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('470', '1f3b5466', 'M', '1f3b5466@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('471', '8ed5f467', 'M', '8ed5f467@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('472', 'ba11c468', 'M', 'ba11c468@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('473', '02bb7469', 'M', '02bb7469@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('474', '53d57470', 'M', '53d57470@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('475', '10ab8471', 'M', '10ab8471@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('476', '6a0f3472', 'M', '6a0f3472@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('477', '13353473', 'M', '13353473@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('478', 'e05e5474', 'M', 'e05e5474@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('479', 'ff61b475', 'M', 'ff61b475@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('480', '42974476', 'M', '42974476@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('481', '64825477', 'M', '64825477@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('482', '526a3478', 'M', '526a3478@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('483', '7fb41479', 'M', '7fb41479@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('484', 'f10b7480', 'M', 'f10b7480@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('485', '06715481', 'M', '06715481@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('486', '6ea5a482', 'M', '6ea5a482@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('487', '7da55483', 'M', '7da55483@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('488', '4315c484', 'M', '4315c484@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('489', 'f37d1485', 'M', 'f37d1485@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('490', '01059486', 'M', '01059486@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('491', 'c7759487', 'M', 'c7759487@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('492', '428c7488', 'M', '428c7488@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('493', 'be432489', 'M', 'be432489@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('494', '7a2e4490', 'M', '7a2e4490@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('495', 'f98ac491', 'M', 'f98ac491@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('496', 'abd6a492', 'M', 'abd6a492@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('497', '7d30d493', 'M', '7d30d493@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('498', 'c8de2494', 'M', 'c8de2494@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('499', 'acf85495', 'M', 'acf85495@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('500', '0433e496', 'M', '0433e496@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('501', 'ea1de497', 'M', 'ea1de497@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('502', 'a10e0498', 'M', 'a10e0498@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('503', '58c39499', 'M', '58c39499@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('504', '82ef9500', 'M', '82ef9500@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('505', 'fa31b501', 'M', 'fa31b501@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('506', '82304502', 'M', '82304502@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('507', '97516503', 'M', '97516503@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('508', '4ef8e504', 'M', '4ef8e504@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('509', '185dd505', 'M', '185dd505@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('510', '87c0c506', 'M', '87c0c506@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('511', '1c147507', 'M', '1c147507@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('512', '8bafc508', 'M', '8bafc508@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('513', 'ed8d5509', 'M', 'ed8d5509@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('514', '3b287510', 'M', '3b287510@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('515', '511ad511', 'M', '511ad511@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('516', '97662512', 'M', '97662512@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('517', '64c53513', 'M', '64c53513@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('518', '2940f514', 'M', '2940f514@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('519', '8fd95515', 'M', '8fd95515@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('520', '79d9b516', 'M', '79d9b516@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('521', 'ea185517', 'M', 'ea185517@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('522', '832cb518', 'M', '832cb518@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('523', 'd1b22519', 'M', 'd1b22519@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('524', 'd2c08520', 'M', 'd2c08520@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('525', 'f6e60521', 'M', 'f6e60521@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('526', '06b99522', 'M', '06b99522@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('527', 'd8a63523', 'M', 'd8a63523@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('528', 'f6e84524', 'M', 'f6e84524@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('529', '7ffef525', 'M', '7ffef525@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('530', '3df4d526', 'M', '3df4d526@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('531', '68ac9527', 'M', '68ac9527@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('532', '190d7528', 'M', '190d7528@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('533', 'd8e03529', 'M', 'd8e03529@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('534', '975ef530', 'M', '975ef530@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('535', '76f81531', 'M', '76f81531@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('536', '0b194532', 'M', '0b194532@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('537', '39de5533', 'M', '39de5533@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('538', 'd330b534', 'M', 'd330b534@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('539', 'c7475535', 'M', 'c7475535@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('540', 'a9a13536', 'M', 'a9a13536@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('541', 'ff77f537', 'M', 'ff77f537@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('542', '53f81538', 'M', '53f81538@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('543', '61424539', 'M', '61424539@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('544', '4b2e8540', 'M', '4b2e8540@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('545', 'f789a541', 'M', 'f789a541@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('546', '24469542', 'M', '24469542@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('547', '62fc6543', 'M', '62fc6543@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('548', 'bba01544', 'M', 'bba01544@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('549', '73f18545', 'M', '73f18545@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('550', 'b4fbc546', 'M', 'b4fbc546@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('551', '5248e547', 'M', '5248e547@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('552', '864b5548', 'M', '864b5548@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('553', '02784549', 'M', '02784549@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('554', '2941f550', 'M', '2941f550@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('555', '357e3551', 'M', '357e3551@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('556', 'b11a8552', 'M', 'b11a8552@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('557', '8adea553', 'M', '8adea553@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('558', '7423f554', 'M', '7423f554@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('559', '9f81b555', 'M', '9f81b555@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('560', '15e5f556', 'M', '15e5f556@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('561', '71ad3557', 'M', '71ad3557@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('562', 'f951d558', 'M', 'f951d558@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('563', '46795559', 'M', '46795559@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('564', 'fb0cb560', 'M', 'fb0cb560@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('565', 'fb79c561', 'M', 'fb79c561@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('566', '98f55562', 'M', '98f55562@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('567', 'f69eb563', 'M', 'f69eb563@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('568', '1ac19564', 'M', '1ac19564@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('569', '992a7565', 'M', '992a7565@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('570', 'c9d9d566', 'M', 'c9d9d566@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('571', '83749567', 'M', '83749567@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('572', '999c3568', 'M', '999c3568@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('573', 'd2514569', 'M', 'd2514569@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('574', 'cc836570', 'M', 'cc836570@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('575', '890ef571', 'M', '890ef571@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('576', '980ce572', 'M', '980ce572@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('577', 'f6680573', 'M', 'f6680573@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('578', '7cece574', 'M', '7cece574@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('579', '98702575', 'M', '98702575@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('580', '316b6576', 'M', '316b6576@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('581', 'c0a7d577', 'M', 'c0a7d577@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('582', 'f756a578', 'M', 'f756a578@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('583', '8c524579', 'M', '8c524579@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('584', '206a5580', 'M', '206a5580@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('585', 'f4709581', 'M', 'f4709581@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('586', 'e6c79582', 'M', 'e6c79582@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('587', '26b3c583', 'M', '26b3c583@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('588', 'b385f584', 'M', 'b385f584@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('589', '3becd585', 'M', '3becd585@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('590', 'cda6e586', 'M', 'cda6e586@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('591', '0ef9a587', 'M', '0ef9a587@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('592', 'c7faa588', 'M', 'c7faa588@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('593', '26b59589', 'M', '26b59589@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('594', '7fab4590', 'M', '7fab4590@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('595', '88451591', 'M', '88451591@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('596', '9e84d592', 'M', '9e84d592@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('597', '442d3593', 'M', '442d3593@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('598', '78154594', 'M', '78154594@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('599', '0298f595', 'M', '0298f595@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('600', '257e9596', 'M', '257e9596@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('601', 'a5204597', 'M', 'a5204597@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('602', '2dd34598', 'M', '2dd34598@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('603', '39dc8599', 'M', '39dc8599@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('604', '69c1a600', 'M', '69c1a600@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('605', '85165601', 'M', '85165601@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('606', '75d29602', 'M', '75d29602@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('607', '6646e603', 'M', '6646e603@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('608', 'c45cd604', 'M', 'c45cd604@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('609', '6750d605', 'M', '6750d605@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('610', 'bd4c4606', 'M', 'bd4c4606@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('611', 'b1912607', 'M', 'b1912607@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('612', '2197d608', 'M', '2197d608@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('613', '2c81a609', 'M', '2c81a609@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('614', '4d08b610', 'M', '4d08b610@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('615', '73ddd611', 'M', '73ddd611@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('616', '9035f612', 'M', '9035f612@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('617', '1e029613', 'M', '1e029613@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('618', '6ee47614', 'M', '6ee47614@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('619', '0c955615', 'M', '0c955615@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('620', 'b4ef6616', 'M', 'b4ef6616@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('621', 'a174f617', 'M', 'a174f617@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('622', '3a9e6618', 'M', '3a9e6618@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('623', 'a59ac619', 'M', 'a59ac619@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('624', '5b425620', 'M', '5b425620@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('625', 'dde2f621', 'M', 'dde2f621@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('626', 'a2b84622', 'M', 'a2b84622@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('627', 'd3a84623', 'M', 'd3a84623@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('628', '94ebe624', 'M', '94ebe624@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('629', '9099c625', 'M', '9099c625@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('630', '0e1f7626', 'M', '0e1f7626@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('631', 'f922a627', 'M', 'f922a627@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('632', '660c6628', 'M', '660c6628@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('633', 'dc459629', 'M', 'dc459629@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('634', '779dc630', 'M', '779dc630@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('635', '6dcfd631', 'M', '6dcfd631@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('636', '91c1b632', 'M', '91c1b632@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('637', '31b69633', 'M', '31b69633@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('638', '8cf80634', 'M', '8cf80634@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('639', '62b52635', 'M', '62b52635@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('640', 'fee1f636', 'M', 'fee1f636@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('641', '9d895637', 'M', '9d895637@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('642', 'a7df6638', 'M', 'a7df6638@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('643', 'f3768639', 'M', 'f3768639@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('644', 'f3927640', 'M', 'f3927640@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('645', '861d1641', 'M', '861d1641@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('646', '12dad642', 'M', '12dad642@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('647', 'a5491643', 'M', 'a5491643@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('648', '08569644', 'M', '08569644@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('649', '1aeaf645', 'M', '1aeaf645@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('650', 'e2f9b646', 'M', 'e2f9b646@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('651', 'f14aa647', 'M', 'f14aa647@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('652', 'ffaa3648', 'M', 'ffaa3648@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('653', '59c5f649', 'M', '59c5f649@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('654', '59bef650', 'M', '59bef650@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('655', '7db08651', 'M', '7db08651@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('656', '1a01b652', 'M', '1a01b652@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('657', '2fa27653', 'M', '2fa27653@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('658', '43a19654', 'M', '43a19654@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('659', '1ee69655', 'M', '1ee69655@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('660', 'a9f8c656', 'M', 'a9f8c656@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('661', '55800657', 'M', '55800657@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('662', '27485658', 'M', '27485658@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('663', '7d7df659', 'M', '7d7df659@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('664', 'c7e31660', 'M', 'c7e31660@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('665', '9c267661', 'M', '9c267661@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('666', 'f9203662', 'M', 'f9203662@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('667', '62c6f663', 'M', '62c6f663@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('668', '957d5664', 'M', '957d5664@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('669', '1c433665', 'M', '1c433665@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('670', '1c5b7666', 'M', '1c5b7666@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('671', '1cfac667', 'M', '1cfac667@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('672', 'b531e668', 'M', 'b531e668@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('673', '163bd669', 'M', '163bd669@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('674', '08d22670', 'M', '08d22670@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('675', '60c7e671', 'M', '60c7e671@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('676', '00c75672', 'M', '00c75672@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('677', '681ac673', 'M', '681ac673@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('678', '69909674', 'M', '69909674@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('679', '8025f675', 'M', '8025f675@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('680', 'eab9f676', 'M', 'eab9f676@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('681', '70e55677', 'M', '70e55677@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('682', '7fe57678', 'M', '7fe57678@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('683', '3cfa4679', 'M', '3cfa4679@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('684', 'e22bd680', 'M', 'e22bd680@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('685', 'f63ab681', 'M', 'f63ab681@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('686', 'c04c1682', 'M', 'c04c1682@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('687', 'bd8c0683', 'M', 'bd8c0683@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('688', 'cf2f4684', 'M', 'cf2f4684@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('689', '1b632685', 'M', '1b632685@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('690', '93080686', 'M', '93080686@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('691', '442f3687', 'M', '442f3687@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('692', '91978688', 'M', '91978688@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('693', '8b8aa689', 'M', '8b8aa689@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('694', '103da690', 'M', '103da690@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('695', '89cb2691', 'M', '89cb2691@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('696', '5d39f692', 'M', '5d39f692@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('697', 'efa01693', 'M', 'efa01693@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('698', '88912694', 'M', '88912694@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('699', '2d9e8695', 'M', '2d9e8695@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('700', '2d0f6696', 'M', '2d0f6696@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('701', '3c9c3697', 'M', '3c9c3697@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('702', 'ba3ab698', 'M', 'ba3ab698@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('703', 'be8c4699', 'M', 'be8c4699@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('704', 'f20fd700', 'M', 'f20fd700@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('705', '3fb61701', 'M', '3fb61701@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('706', '7bdca702', 'M', '7bdca702@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('707', '66ecf703', 'M', '66ecf703@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('708', '094ba704', 'M', '094ba704@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('709', 'a78f6705', 'M', 'a78f6705@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('710', 'f5033706', 'M', 'f5033706@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('711', '9e558707', 'M', '9e558707@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('712', '3142c708', 'M', '3142c708@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('713', '106f3709', 'M', '106f3709@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('714', '081ae710', 'M', '081ae710@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('715', 'e7097711', 'M', 'e7097711@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('716', 'b6b46712', 'M', 'b6b46712@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('717', 'ba7fe713', 'M', 'ba7fe713@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('718', 'a0d21714', 'M', 'a0d21714@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('719', 'ed9cf715', 'M', 'ed9cf715@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('720', 'e58f9716', 'M', 'e58f9716@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('721', '5d255717', 'M', '5d255717@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('722', 'a2634718', 'M', 'a2634718@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('723', '79059719', 'M', '79059719@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('724', 'f6a72720', 'M', 'f6a72720@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('725', 'f79de721', 'M', 'f79de721@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('726', '403cc722', 'M', '403cc722@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('727', '75d0e723', 'M', '75d0e723@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('728', '9d029724', 'M', '9d029724@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('729', 'fbeaf725', 'M', 'fbeaf725@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('730', '649ec726', 'M', '649ec726@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('731', '9822b727', 'M', '9822b727@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('732', '6bafa728', 'M', '6bafa728@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('733', '05dfd729', 'M', '05dfd729@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('734', 'e9de9730', 'M', 'e9de9730@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('735', '9fe60731', 'M', '9fe60731@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('736', '37779732', 'M', '37779732@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('737', '220bf733', 'M', '220bf733@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('738', 'd303f734', 'M', 'd303f734@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('739', '7afb0735', 'M', '7afb0735@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('740', '2d5f2736', 'M', '2d5f2736@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('741', '28259737', 'M', '28259737@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('742', '84477738', 'M', '84477738@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('743', 'cb0cf739', 'M', 'cb0cf739@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('744', '2998d740', 'M', '2998d740@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('745', 'c866e741', 'M', 'c866e741@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('746', '6449f742', 'M', '6449f742@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('747', '1ff94743', 'M', '1ff94743@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('748', 'b170b744', 'M', 'b170b744@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('749', '44bb0745', 'M', '44bb0745@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('750', 'df4a7746', 'M', 'df4a7746@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('751', '7fce0747', 'M', '7fce0747@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('752', '519b2748', 'M', '519b2748@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('753', 'abd96749', 'M', 'abd96749@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('754', '11b35750', 'M', '11b35750@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('755', '77c8d751', 'M', '77c8d751@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('756', 'a8010752', 'M', 'a8010752@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('757', 'a8c0b753', 'M', 'a8c0b753@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('758', '0cfa6754', 'M', '0cfa6754@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('759', '46531755', 'M', '46531755@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('760', '09a98756', 'M', '09a98756@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('761', 'b5d30757', 'M', 'b5d30757@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('762', '89a36758', 'M', '89a36758@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('763', '4896d759', 'M', '4896d759@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('764', '2d77a760', 'M', '2d77a760@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('765', '2ea2e761', 'M', '2ea2e761@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('766', '3903c762', 'M', '3903c762@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('767', '43ef0763', 'M', '43ef0763@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('768', '3a38e764', 'M', '3a38e764@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('769', '21d84765', 'M', '21d84765@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('770', '0b6b7766', 'M', '0b6b7766@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('771', '18803767', 'M', '18803767@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('772', '2bb0a768', 'M', '2bb0a768@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('773', '8f1dc769', 'M', '8f1dc769@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('774', 'eab77770', 'M', 'eab77770@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('775', '0b48f771', 'M', '0b48f771@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('776', '1657f772', 'M', '1657f772@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('777', '929ec773', 'M', '929ec773@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('778', 'd2a89774', 'M', 'd2a89774@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('779', 'd0db2775', 'M', 'd0db2775@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('780', '08363776', 'M', '08363776@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('781', 'b8c3c777', 'M', 'b8c3c777@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('782', 'adcca778', 'M', 'adcca778@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('783', 'fade9779', 'M', 'fade9779@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('784', 'b4c7a780', 'M', 'b4c7a780@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('785', '7896a781', 'M', '7896a781@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('786', 'f2b62782', 'M', 'f2b62782@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('787', '78ed5783', 'M', '78ed5783@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('788', '73120784', 'M', '73120784@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('789', '96d90785', 'M', '96d90785@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('790', '5c4d1786', 'M', '5c4d1786@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('791', '7ff12787', 'M', '7ff12787@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('792', '8a58d788', 'M', '8a58d788@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('793', 'b5778789', 'M', 'b5778789@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('794', '95883790', 'M', '95883790@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('795', 'd3354791', 'M', 'd3354791@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('796', 'fec06792', 'M', 'fec06792@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('797', 'c2dbd793', 'M', 'c2dbd793@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('798', '318cf794', 'M', '318cf794@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('799', '58fbd795', 'M', '58fbd795@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('800', 'af1eb796', 'M', 'af1eb796@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('801', '6f9f0797', 'M', '6f9f0797@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('802', '4693a798', 'M', '4693a798@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('803', 'd403b799', 'M', 'd403b799@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('804', '75f4c800', 'M', '75f4c800@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('805', 'e7095801', 'M', 'e7095801@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('806', '2695e802', 'M', '2695e802@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('807', 'af6ee803', 'M', 'af6ee803@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('808', '1d943804', 'M', '1d943804@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('809', '8dbcd805', 'M', '8dbcd805@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('810', '53b7c806', 'M', '53b7c806@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('811', '8b508807', 'M', '8b508807@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('812', '9b275808', 'M', '9b275808@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('813', '41288809', 'M', '41288809@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('814', '79e6b810', 'M', '79e6b810@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('815', '0141c811', 'M', '0141c811@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('816', '1bc1a812', 'M', '1bc1a812@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('817', 'e025b813', 'M', 'e025b813@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('818', '7e2a4814', 'M', '7e2a4814@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('819', '12ab0815', 'M', '12ab0815@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('820', 'a9607816', 'M', 'a9607816@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('821', 'b6d1c817', 'M', 'b6d1c817@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('822', 'eadd3818', 'M', 'eadd3818@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('823', '58c14819', 'M', '58c14819@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('824', 'e07a5820', 'M', 'e07a5820@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('825', '1d3a3821', 'M', '1d3a3821@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('826', '4de0c822', 'M', '4de0c822@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('827', '483b5823', 'M', '483b5823@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('828', 'e1dff824', 'M', 'e1dff824@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('829', '0f8d3825', 'M', '0f8d3825@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('830', 'c87e9826', 'M', 'c87e9826@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('831', '2b95e827', 'M', '2b95e827@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('832', '3547e828', 'M', '3547e828@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('833', 'a05ea829', 'M', 'a05ea829@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('834', '54865830', 'M', '54865830@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('835', '15f21831', 'M', '15f21831@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('836', '6751b832', 'M', '6751b832@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('837', 'c1a5f833', 'M', 'c1a5f833@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('838', '3da9d834', 'M', '3da9d834@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('839', 'b4eb1835', 'M', 'b4eb1835@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('840', '45c54836', 'M', '45c54836@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('841', '6f189837', 'M', '6f189837@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('842', '32d12838', 'M', '32d12838@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('843', '32193839', 'M', '32193839@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('844', '0a91a840', 'M', '0a91a840@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('845', 'c740a841', 'M', 'c740a841@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('846', '0612c842', 'M', '0612c842@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('847', 'fd428843', 'M', 'fd428843@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('848', 'ee466844', 'M', 'ee466844@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('849', '623a8845', 'M', '623a8845@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('850', 'd60fe846', 'M', 'd60fe846@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('851', 'af179847', 'M', 'af179847@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('852', 'ac85c848', 'M', 'ac85c848@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('853', '44ea5849', 'M', '44ea5849@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('854', '2638c850', 'M', '2638c850@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('855', 'a7410851', 'M', 'a7410851@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('856', '27425852', 'M', '27425852@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('857', 'd1f81853', 'M', 'd1f81853@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('858', '586c1854', 'M', '586c1854@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('859', '797d0855', 'M', '797d0855@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('860', 'f2a25856', 'M', 'f2a25856@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('861', '55218857', 'M', '55218857@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('862', '12ecb858', 'M', '12ecb858@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('863', '3ae52859', 'M', '3ae52859@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('864', 'ba004860', 'M', 'ba004860@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('865', 'b3081861', 'M', 'b3081861@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('866', 'a32c1862', 'M', 'a32c1862@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('867', 'ffce6863', 'M', 'ffce6863@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('868', '117ae864', 'M', '117ae864@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('869', '0cef6865', 'M', '0cef6865@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('870', '1537f866', 'M', '1537f866@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('871', '7bcf3867', 'M', '7bcf3867@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('872', 'fc90a868', 'M', 'fc90a868@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('873', '4d27e869', 'M', '4d27e869@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('874', '60a4c870', 'M', '60a4c870@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('875', 'a6800871', 'M', 'a6800871@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('876', '000a0872', 'M', '000a0872@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('877', '2905f873', 'M', '2905f873@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('878', 'e9cd7874', 'M', 'e9cd7874@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('879', 'fc76d875', 'M', 'fc76d875@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('880', '0a3ce876', 'M', '0a3ce876@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('881', '0dd9c877', 'M', '0dd9c877@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('882', 'a64c3878', 'M', 'a64c3878@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('883', '6ea16879', 'M', '6ea16879@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('884', '35e98880', 'M', '35e98880@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('885', '2e0d9881', 'M', '2e0d9881@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('886', '347e7882', 'M', '347e7882@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('887', 'bbcc6883', 'M', 'bbcc6883@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('888', 'f9615884', 'M', 'f9615884@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('889', '763c3885', 'M', '763c3885@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('890', '6aedb886', 'M', '6aedb886@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('891', 'd195f887', 'M', 'd195f887@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('892', '60e74888', 'M', '60e74888@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('893', '64946889', 'M', '64946889@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('894', '1671e890', 'M', '1671e890@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('895', '23cd5891', 'M', '23cd5891@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('896', 'b69ae892', 'M', 'b69ae892@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('897', 'e6a15893', 'M', 'e6a15893@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('898', '3c5b6894', 'M', '3c5b6894@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('899', '57593895', 'M', '57593895@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('900', '5dd53896', 'M', '5dd53896@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('901', 'e69fb897', 'M', 'e69fb897@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('902', '08668898', 'M', '08668898@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('903', '7ab72899', 'M', '7ab72899@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('904', 'c9b55900', 'M', 'c9b55900@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('905', '1a357901', 'M', '1a357901@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('906', 'e7296902', 'M', 'e7296902@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('907', '4c5fd903', 'M', '4c5fd903@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('908', 'd6ee1904', 'M', 'd6ee1904@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('909', '732ec905', 'M', '732ec905@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('910', '1a1f6906', 'M', '1a1f6906@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('911', '58616907', 'M', '58616907@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('912', 'd5843908', 'M', 'd5843908@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('913', 'a66cf909', 'M', 'a66cf909@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('914', '1a003910', 'M', '1a003910@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('915', '44d9f911', 'M', '44d9f911@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('916', 'd2f78912', 'M', 'd2f78912@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('917', '71e6f913', 'M', '71e6f913@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('918', 'b2707914', 'M', 'b2707914@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('919', 'fb6d0915', 'M', 'fb6d0915@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('920', '1ba9b916', 'M', '1ba9b916@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('921', '04430917', 'M', '04430917@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('922', 'cdb2a918', 'M', 'cdb2a918@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('923', 'ee69a919', 'M', 'ee69a919@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('924', '70ac2920', 'M', '70ac2920@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('925', '94396921', 'M', '94396921@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('926', '9640a922', 'M', '9640a922@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('927', 'dab27923', 'M', 'dab27923@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('928', '9260f924', 'M', '9260f924@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('929', 'a9e70925', 'M', 'a9e70925@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('930', '26983926', 'M', '26983926@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('931', 'ba29d927', 'M', 'ba29d927@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('932', '465a1928', 'M', '465a1928@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('933', '6488b929', 'M', '6488b929@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('934', '811a1930', 'M', '811a1930@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('935', '81cb8931', 'M', '81cb8931@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('936', 'cff46932', 'M', 'cff46932@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('937', 'a89a7933', 'M', 'a89a7933@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('938', 'c8b2c934', 'M', 'c8b2c934@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('939', 'babb9935', 'M', 'babb9935@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('940', 'd5353936', 'M', 'd5353936@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('941', '039e8937', 'M', '039e8937@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('942', '4f0a9938', 'M', '4f0a9938@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('943', '9296f939', 'M', '9296f939@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('944', '0b26e940', 'M', '0b26e940@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('945', '7a019941', 'M', '7a019941@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('946', '85992942', 'M', '85992942@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('947', '77111943', 'M', '77111943@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('948', 'ebbc0944', 'M', 'ebbc0944@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('949', '3b544945', 'M', '3b544945@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('950', 'f411d946', 'M', 'f411d946@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('951', 'c2eb9947', 'M', 'c2eb9947@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('952', 'b0eb5948', 'M', 'b0eb5948@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('953', 'c5128949', 'M', 'c5128949@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('954', '8704d950', 'M', '8704d950@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('955', '82179951', 'M', '82179951@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('956', 'a7ee2952', 'M', 'a7ee2952@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('957', 'c136f953', 'M', 'c136f953@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('958', 'f917e954', 'M', 'f917e954@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('959', '7500a955', 'M', '7500a955@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('960', '8c611956', 'M', '8c611956@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('961', '874c1957', 'M', '874c1957@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('962', '64371958', 'M', '64371958@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('963', 'b2b73959', 'M', 'b2b73959@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('964', 'cdd57960', 'M', 'cdd57960@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('965', '77e5d961', 'M', '77e5d961@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('966', '28493962', 'M', '28493962@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('967', 'c65e3963', 'M', 'c65e3963@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('968', '801db964', 'M', '801db964@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('969', '6a931965', 'M', '6a931965@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('970', '1d8e2966', 'M', '1d8e2966@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('971', '2688f967', 'M', '2688f967@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('972', 'a832f968', 'M', 'a832f968@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('973', 'd4188969', 'M', 'd4188969@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('974', '4987e970', 'M', '4987e970@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('975', 'f6b5d971', 'M', 'f6b5d971@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('976', 'f55a4972', 'M', 'f55a4972@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('977', 'f1b66973', 'M', 'f1b66973@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('978', '113eb974', 'M', '113eb974@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('979', 'b441f975', 'M', 'b441f975@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('980', 'd6786976', 'M', 'd6786976@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('981', 'c25b1977', 'M', 'c25b1977@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('982', 'a0666978', 'M', 'a0666978@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('983', 'db743979', 'M', 'db743979@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('984', 'cabb2980', 'M', 'cabb2980@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('985', '0c80a981', 'M', '0c80a981@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('986', 'a169d982', 'M', 'a169d982@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('987', '9ae09983', 'M', '9ae09983@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('988', '298d8984', 'M', '298d8984@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('989', '1f37e985', 'M', '1f37e985@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('990', '32746986', 'M', '32746986@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('991', 'ee6b1987', 'M', 'ee6b1987@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('992', '35a1d988', 'M', '35a1d988@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('993', '53563989', 'M', '53563989@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('994', 'a3ef0990', 'M', 'a3ef0990@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('995', 'a778b991', 'M', 'a778b991@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('996', 'd6325992', 'M', 'd6325992@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('997', 'a24cc993', 'M', 'a24cc993@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('998', '46be5994', 'M', '46be5994@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('999', '9cd5c995', 'M', '9cd5c995@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('1000', '135b0996', 'M', '135b0996@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('1001', '5327d997', 'M', '5327d997@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('1002', '24aa1998', 'M', '24aa1998@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('1003', '9419c999', 'M', '9419c999@atguigu.com', '1');
INSERT INTO `tbl_emp` VALUES ('1004', '1111111111', 'M', 'flyljxin@163.com', '1');
INSERT INTO `tbl_emp` VALUES ('1005', '123465', 'M', '123@163.com', '1');

-- ----------------------------
-- Table structure for userinfo
-- ----------------------------
DROP TABLE IF EXISTS `userinfo`;
CREATE TABLE `userinfo` (
  `id` int(5) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(100) NOT NULL COMMENT '用户名',
  `password` varchar(100) DEFAULT NULL COMMENT '密码',
  `tell` varchar(11) DEFAULT NULL COMMENT '手机号',
  `mail` varchar(50) DEFAULT NULL COMMENT '邮箱',
  `company` enum('BDKJT','BDKJR','BDKDQ','XGLLWHGS') DEFAULT NULL COMMENT '所属公司',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of userinfo
-- ----------------------------
INSERT INTO `userinfo` VALUES ('1', 'chenquan', 'cdqWajX.i3psA', '123', '1231', 'XGLLWHGS');
INSERT INTO `userinfo` VALUES ('5', 'flyljxin', 'cdqWajX.i3psA', '13590427665', 'flyljxin@163.com', 'XGLLWHGS');
INSERT INTO `userinfo` VALUES ('6', '123adda', 'cdqWajX.i3psA', '13590427665', 'flyljxin@163.com', 'XGLLWHGS');
INSERT INTO `userinfo` VALUES ('7', 'fdaf123', 'cdqWajX.i3psA', '13590427665', 'flyljxin@163.com', 'BDKJR');
