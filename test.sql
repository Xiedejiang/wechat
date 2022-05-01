/*
Navicat MySQL Data Transfer

Source Server         : myself-Mysql
Source Server Version : 50540
Source Host           : localhost:3306
Source Database       : test

Target Server Type    : MYSQL
Target Server Version : 50540
File Encoding         : 65001

Date: 2022-01-19 10:21:58
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `chatmsg`
-- ----------------------------
DROP TABLE IF EXISTS `chatmsg`;
CREATE TABLE `chatmsg` (
  `lid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `fid` int(11) NOT NULL,
  `systime` bigint(20) NOT NULL,
  `msg` varchar(255) NOT NULL,
  PRIMARY KEY (`lid`)
) ENGINE=InnoDB AUTO_INCREMENT=70 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of chatmsg
-- ----------------------------
INSERT INTO `chatmsg` VALUES ('1', '4', '1', '1640654700886', '123123123');
INSERT INTO `chatmsg` VALUES ('2', '4', '1', '1640655130451', '123123');
INSERT INTO `chatmsg` VALUES ('3', '4', '1', '1640655154616', '12321321321');
INSERT INTO `chatmsg` VALUES ('4', '4', '1', '1640655192928', '12321312');
INSERT INTO `chatmsg` VALUES ('5', '4', '1', '1640655546378', 'hello~');
INSERT INTO `chatmsg` VALUES ('6', '4', '1', '1640655580797', 'hello~');
INSERT INTO `chatmsg` VALUES ('7', '4', '1', '1640655602014', 'hello~');
INSERT INTO `chatmsg` VALUES ('8', '4', '1', '1640655603101', 'hello~');
INSERT INTO `chatmsg` VALUES ('9', '4', '1', '1640655819006', '1231232132131');
INSERT INTO `chatmsg` VALUES ('10', '4', '1', '1640655819949', '1231232132131');
INSERT INTO `chatmsg` VALUES ('11', '4', '1', '1640655820108', '1231232132131');
INSERT INTO `chatmsg` VALUES ('12', '4', '1', '1640655820243', '1231232132131');
INSERT INTO `chatmsg` VALUES ('13', '4', '1', '1640655820406', '1231232132131');
INSERT INTO `chatmsg` VALUES ('14', '4', '1', '1640655820565', '1231232132131');
INSERT INTO `chatmsg` VALUES ('15', '4', '1', '1640656000519', '1231232132132');
INSERT INTO `chatmsg` VALUES ('16', '4', '1', '1640656054413', '你好~');
INSERT INTO `chatmsg` VALUES ('17', '4', '1', '1640656056003', '你好~');
INSERT INTO `chatmsg` VALUES ('18', '4', '1', '1640656115159', '你好~`');
INSERT INTO `chatmsg` VALUES ('19', '4', '1', '1640657069341', '你好');
INSERT INTO `chatmsg` VALUES ('20', '4', '1', '1640657541588', '睡得');
INSERT INTO `chatmsg` VALUES ('21', '4', '1', '1640657542163', '睡得');
INSERT INTO `chatmsg` VALUES ('22', '4', '1', '1640657546130', '睡得');
INSERT INTO `chatmsg` VALUES ('23', '4', '1', '1640657637413', '阿达');
INSERT INTO `chatmsg` VALUES ('24', '4', '1', '1640657638463', '阿达');
INSERT INTO `chatmsg` VALUES ('25', '4', '1', '1640657639594', '阿达');
INSERT INTO `chatmsg` VALUES ('26', '4', '1', '1640657643090', '阿达');
INSERT INTO `chatmsg` VALUES ('27', '4', '1', '1640658151075', '啊大啊');
INSERT INTO `chatmsg` VALUES ('28', '1', '4', '1640658216116', '12');
INSERT INTO `chatmsg` VALUES ('29', '4', '1', '1640658319770', '1111');
INSERT INTO `chatmsg` VALUES ('30', '4', '1', '1640658374009', '1');
INSERT INTO `chatmsg` VALUES ('31', '4', '1', '1640658413825', '123');
INSERT INTO `chatmsg` VALUES ('32', '4', '1', '1640658698933', 'asd');
INSERT INTO `chatmsg` VALUES ('33', '4', '1', '1640658703553', 'asd');
INSERT INTO `chatmsg` VALUES ('34', '4', '1', '1640658710650', 'asd');
INSERT INTO `chatmsg` VALUES ('35', '4', '1', '1640658710817', 'asd');
INSERT INTO `chatmsg` VALUES ('36', '4', '1', '1640658772474', '你好');
INSERT INTO `chatmsg` VALUES ('37', '4', '1', '1640658779463', '你好~');
INSERT INTO `chatmsg` VALUES ('38', '4', '1', '1640658850210', '666666');
INSERT INTO `chatmsg` VALUES ('39', '4', '1', '1640660329339', '吃饭啦');
INSERT INTO `chatmsg` VALUES ('40', '4', '1', '1640660337121', '快回来~');
INSERT INTO `chatmsg` VALUES ('41', '4', '1', '1640660354683', '你是谁');
INSERT INTO `chatmsg` VALUES ('42', '1', '4', '1640660815781', '你在干嘛');
INSERT INTO `chatmsg` VALUES ('43', '1', '4', '1640660829149', '你在吗');
INSERT INTO `chatmsg` VALUES ('44', '4', '1', '1640660946014', '请问请问');
INSERT INTO `chatmsg` VALUES ('45', '4', '1', '1640662690268', '快到时间了');
INSERT INTO `chatmsg` VALUES ('46', '4', '1', '1640662768050', 'nizaiganma');
INSERT INTO `chatmsg` VALUES ('47', '4', '1', '1640663136247', '哈哈哈哈haohao');
INSERT INTO `chatmsg` VALUES ('48', '4', '1', '1640663196335', '太好笑了');
INSERT INTO `chatmsg` VALUES ('49', '4', '1', '1640663513901', '你说啥');
INSERT INTO `chatmsg` VALUES ('50', '4', '1', '1640664009387', 'aaa');
INSERT INTO `chatmsg` VALUES ('51', '4', '1', '1640664020360', 'asad');
INSERT INTO `chatmsg` VALUES ('52', '4', '1', '1640664028901', 'asas');
INSERT INTO `chatmsg` VALUES ('53', '4', '1', '1640664301724', 'aasd');
INSERT INTO `chatmsg` VALUES ('54', '4', '1', '1640664306100', 'aaaa');
INSERT INTO `chatmsg` VALUES ('55', '4', '1', '1640664311764', '121212');
INSERT INTO `chatmsg` VALUES ('56', '4', '1', '1640670040778', '999999999??????');
INSERT INTO `chatmsg` VALUES ('57', '4', '1', '1640673609378', '12312321');
INSERT INTO `chatmsg` VALUES ('58', '4', '3', '1641432421938', '你好啊');
INSERT INTO `chatmsg` VALUES ('59', '4', '6', '1641432459758', '在哪玩耍呢');
INSERT INTO `chatmsg` VALUES ('60', '4', '6', '1641432571175', '今天是不是天气很好嫩');
INSERT INTO `chatmsg` VALUES ('61', '4', '6', '1641432742273', '这是在干嘛');
INSERT INTO `chatmsg` VALUES ('62', '4', '6', '1641432777336', '你们明天去哪玩');
INSERT INTO `chatmsg` VALUES ('63', '4', '6', '1641432890200', '今天星期四辣');
INSERT INTO `chatmsg` VALUES ('64', '4', '6', '1641433160392', '你在干嘛');
INSERT INTO `chatmsg` VALUES ('65', '4', '6', '1641433301564', '123123213');
INSERT INTO `chatmsg` VALUES ('66', '4', '6', '1641433361822', '1232132132');
INSERT INTO `chatmsg` VALUES ('67', '4', '6', '1641433408688', '你们在哪玩');
INSERT INTO `chatmsg` VALUES ('68', '4', '6', '1641433549117', '这是第一次测试');
INSERT INTO `chatmsg` VALUES ('69', '4', '6', '1641433695664', '第二次');

-- ----------------------------
-- Table structure for `friendmsg`
-- ----------------------------
DROP TABLE IF EXISTS `friendmsg`;
CREATE TABLE `friendmsg` (
  `mid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `from_a` int(11) NOT NULL COMMENT '发送好友申请的用户id',
  `to_b` int(11) NOT NULL COMMENT '接收好友申请的用户id',
  `isread` tinyint(1) NOT NULL DEFAULT '0',
  `ispass` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0:未操作 1：已接受 2：已拒绝',
  `systime` bigint(20) NOT NULL,
  PRIMARY KEY (`mid`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of friendmsg
-- ----------------------------
INSERT INTO `friendmsg` VALUES ('1', '1', '4', '1', '1', '1640570058765');
INSERT INTO `friendmsg` VALUES ('3', '3', '4', '1', '1', '1640346061392');
INSERT INTO `friendmsg` VALUES ('9', '14', '4', '1', '1', '1640692230743');
INSERT INTO `friendmsg` VALUES ('12', '8', '4', '1', '1', '1641459695045');

-- ----------------------------
-- Table structure for `product`
-- ----------------------------
DROP TABLE IF EXISTS `product`;
CREATE TABLE `product` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `price` float(11,3) NOT NULL,
  `desc` text NOT NULL,
  `category` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of product
-- ----------------------------
INSERT INTO `product` VALUES ('1', '华为P40', '5000.120', '这是手机描述', '手机');
INSERT INTO `product` VALUES ('2', '华为P30', '3000.000', '这是手机描述', '手机');
INSERT INTO `product` VALUES ('3', 'IPhone12', '3300.000', '这是手机描述哦', '手机');
INSERT INTO `product` VALUES ('4', '荣耀30', '3800.000', '这是手机描述哦', '手机');
INSERT INTO `product` VALUES ('5', 'vivo iQOO', '1598.000', '5G新品 浅蔚蓝 8+128G 性能小金刚 天玑800U 90Hz竞速屏 5000mAh大电池+18W双引擎闪充强续航 五重液冷散热 双模5G全网通', '手机');
INSERT INTO `product` VALUES ('6', 'OPPO Reno5', '3999.000', 'Pro+ 5G手机 星河入梦 8GB+128GB 全网通 65W闪充 传感器IMX766 骁龙865 轻薄机身拍照美颜游戏智能手机', '手机');
INSERT INTO `product` VALUES ('7', '华硕(ASUS)', '3999.000', 'VivoBook14 V4200 14英寸学生办公轻薄本笔记本电脑(i5-1035G1 8G 512GSSD MX330)独显银色', '笔记本电脑');
INSERT INTO `product` VALUES ('8', '雷神(THUNDEROBOT)ZERO', '9598.000', '新品旗舰游戏本发烧设计笔记本电脑（11代酷睿i7-11800H 16G RTX3060 6G 512G高速固态 165Hz飙高刷新率）', '笔记本电脑');
INSERT INTO `product` VALUES ('9', '戴尔（DELL）灵越5000-5502', '4499.000', '15.6英寸十一代英特尔酷睿i5学生商务办公高色域轻薄本笔记本电脑自营（i5-1135G7 16G内存 512G固态 锐炬Xe显卡）', '笔记本电脑');
INSERT INTO `product` VALUES ('10', '华硕a豆adolbook14s', '5199.000', '增强版 11代酷睿 高颜值全面屏轻薄本学生笔记本电脑(i5-1135G7 16G 512G MX350)千禧粉', '笔记本电脑');
INSERT INTO `product` VALUES ('11', '佳能(Canon) EOS', '9788.000', '90D 单反套机(18-135mm f/3.5-5.6 IS USM) 数码佳能单反相机', '相机');
INSERT INTO `product` VALUES ('12', '佳能（Canon）EOS-850D', '6199.000', '（EF-S 18-55mm f/4-5.6 IS STM）单反相机套机 APS-C画幅', '相机');
INSERT INTO `product` VALUES ('13', '小米手环6', '229.000', '全面彩屏 30种运动模式 24h心率检测 50米防水 智能手环', '智能数码');
INSERT INTO `product` VALUES ('14', '苹果(Apple)iPhone AirPods2代', '899.000', '(有线充电盒)苹果耳机 蓝牙耳机无线耳机 入耳式 苹果2代无线蓝牙耳机 AirPods【有线版】', '智能数码');
INSERT INTO `product` VALUES ('15', '华为路由 AX2 Pro 白色', '229.000', '华为路由 AX2 Pro 白色', '智能数码');
INSERT INTO `product` VALUES ('16', 'Apple Pencil', '678.000', '（一代）手写笔 适用于iPad 7代、8代、iPad Air3、iPad mini5', '智能数码');
INSERT INTO `product` VALUES ('17', 'HUAWEI/华为 WATCH FIT 智能手表', '639.000', '轻薄全彩大屏 动画健身私教|心理健康管理|硅胶表带|全屏触摸|多钟颜色选择|男女同款', '智能数码');
INSERT INTO `product` VALUES ('18', '苏宁极物小Biu智能摄像头', '119.000', '标准版1080P全高清360°全景家用监控器儿童看护网络摄像头摄像机双向对讲无死角', '智能数码');
INSERT INTO `product` VALUES ('19', '苏宁极物 小Biu智能体脂秤', '69.000', '电子秤体重秤智能家用女生宿舍称重健康减肥迷你可爱高精度', '智能数码');
INSERT INTO `product` VALUES ('20', '小米（MI）移动电源3', '129.000', '20000毫安mAh USB-C双向快充版支持小电流充电白色充电宝', '智能数码');

-- ----------------------------
-- Table structure for `pyq`
-- ----------------------------
DROP TABLE IF EXISTS `pyq`;
CREATE TABLE `pyq` (
  `pid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `picture` text NOT NULL,
  `pmsg` varchar(255) NOT NULL,
  `systime` bigint(20) NOT NULL,
  PRIMARY KEY (`pid`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of pyq
-- ----------------------------
INSERT INTO `pyq` VALUES ('1', '4', 'static/images/613558df93f9ea6262605bff284c1622.jpg;static/images/8dbff79411dd8910eec57aa430d95712.jpg;static/images/e74b0d29adcdbddca1e63f87e58a9eb1.jpg', '这是第一条正式朋友圈!!!!', '1641536314190');
INSERT INTO `pyq` VALUES ('2', '8', 'static/images/33840ed78c943a359eb4106db0d74de1.jpg', '大华来报道！！！', '1641536413474');
INSERT INTO `pyq` VALUES ('3', '3', 'static/images/efd7000006472acc75a99585aa5e84e6.jpg;static/images/cc93b9d5c5dfcaa5c42fe979078d006c.jpg', 'gyl来报道~~~', '1641536956915');
INSERT INTO `pyq` VALUES ('4', '4', 'static/images/20b552b9933698e85dba46f9a90d0788.jpg;static/images/538a7806139a14af780567ad8ffffddc.jpg', '这是第二条正式朋友圈！！！', '1641537034729');
INSERT INTO `pyq` VALUES ('5', '14', 'static/images/d45daedf4fbd3914cb5c2624ecbb2144.png;static/images/4047c543a957253e5175cdcc3dfd787e.png', 'xjj来报道~~~', '1641537776201');

-- ----------------------------
-- Table structure for `user`
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `uid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(12) NOT NULL,
  `password` char(32) NOT NULL,
  `nickname` varchar(20) NOT NULL,
  `pic` varchar(255) NOT NULL DEFAULT 'static/images/avatar.jpg',
  `systime` bigint(20) NOT NULL,
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', 'xdj', '202cb962ac59075b964b07152d234b70', '俺来瞅瞅你', '/static/images/pho2.jpg', '1640780344892');
INSERT INTO `user` VALUES ('2', 'xdj', '202cb962ac59075b964b07152d234b70', '俺来瞅瞅你2', '/static/images/avatar.jpg', '1640780344892');
INSERT INTO `user` VALUES ('3', 'gyl', '202cb962ac59075b964b07152d234b70', '不要来找我', '/static/images/pho4.jpg', '1640780344892');
INSERT INTO `user` VALUES ('4', 'qwe', '202cb962ac59075b964b07152d234b70', '24K纯帅', 'static/images/d8b7acabcef6ec1f5fbbf3e3534a8375.jpg', '1641520275167');
INSERT INTO `user` VALUES ('5', 'asd', '202cb962ac59075b964b07152d234b70', '小头', '/static/images/pho5.jpg', '1640780344892');
INSERT INTO `user` VALUES ('6', 'zxc', '202cb962ac59075b964b07152d234b70', '葫芦娃', '/static/images/pho.jpg', '1640780344892');
INSERT INTO `user` VALUES ('7', 'qqq', '202cb962ac59075b964b07152d234b70', '24K纯帅', '/static/images/pho3.jpg', '1640780344892');
INSERT INTO `user` VALUES ('8', 'admin', '202cb962ac59075b964b07152d234b70', '大华', '/static/images/pho6.jpg', '1640780344892');
INSERT INTO `user` VALUES ('9', 'admin2', '202cb962ac59075b964b07152d234b70', '大花', '/static/images/pho7.jpg', '1640780344892');
INSERT INTO `user` VALUES ('10', 'luhan', '202cb962ac59075b964b07152d234b70', '卢涵', '/static/images/pho2.jpg', '1640780344892');
INSERT INTO `user` VALUES ('11', 'yjl', '202cb962ac59075b964b07152d234b70', '晏家乐', '/static/images/pho4.jpg', '1640780344892');
INSERT INTO `user` VALUES ('12', 'njs', '202cb962ac59075b964b07152d234b70', '牛家砷', '/static/images/pho3.jpg', '1640780344892');
INSERT INTO `user` VALUES ('13', 'zsj', '202cb962ac59075b964b07152d234b70', '张思洁', '/static/images/pho5.jpg', '1640780344892');
INSERT INTO `user` VALUES ('14', 'xjj', '202cb962ac59075b964b07152d234b70', '谢德江', '/static/images/pho7.jpg', '1640780344892');

-- ----------------------------
-- View structure for `text1`
-- ----------------------------
DROP VIEW IF EXISTS `text1`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `text1` AS select `test`.`emp`.`empno` AS `empno`,`test`.`emp`.`ename` AS `ename`,`test`.`emp`.`job` AS `job`,`test`.`emp`.`mgr` AS `mgr`,`test`.`emp`.`hiredate` AS `hiredate`,`test`.`emp`.`sal` AS `sal`,`test`.`emp`.`comm` AS `comm`,`test`.`emp`.`deptno` AS `deptno` from `emp` ;
