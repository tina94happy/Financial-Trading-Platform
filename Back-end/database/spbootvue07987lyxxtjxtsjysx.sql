/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50553
Source Host           : localhost:3306
Source Database       : spbootvue07987lyxxtjxtsjysx

Target Server Type    : MYSQL
Target Server Version : 50553
File Encoding         : 65001

Date: 2021-04-23 18:14:45
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for `admins`
-- ----------------------------
DROP TABLE IF EXISTS `admins`;
CREATE TABLE `admins` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL COMMENT '帐号',
  `pwd` varchar(50) NOT NULL COMMENT '密码',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '添加时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='管理员';

-- ----------------------------
-- Records of admins
-- ----------------------------
INSERT INTO `admins` VALUES ('1', 'admin', 'admin', '2021-04-23 16:53:57');

-- ----------------------------
-- Table structure for `difangmeishi`
-- ----------------------------
DROP TABLE IF EXISTS `difangmeishi`;
CREATE TABLE `difangmeishi` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `meishibianhao` varchar(50) NOT NULL COMMENT '美食编号',
  `mingcheng` varchar(255) NOT NULL COMMENT '名称',
  `fujinjingdian` varchar(255) NOT NULL COMMENT '附近景点',
  `fenlei` int(10) unsigned NOT NULL COMMENT '分类',
  `tupian` text NOT NULL COMMENT '图片',
  `jiage` decimal(18,2) NOT NULL COMMENT '价格',
  `meishijianjie` text NOT NULL COMMENT '美食简介',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '添加时间',
  PRIMARY KEY (`id`),
  KEY `difangmeishi_fenlei_index` (`fenlei`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='地方美食';

-- ----------------------------
-- Records of difangmeishi
-- ----------------------------
INSERT INTO `difangmeishi` VALUES ('1', '2104231633490', 'Crypto-currency','Crypto-currency', '1', 'upload/Crypto-currency.png,upload/Crypto-currency.png', '288.28', '美食简介美食简介美食简介美食简介美食简介美食简介美食简介美食简介美食简介美食简介', '2021-04-23 19:13:02');
INSERT INTO `difangmeishi` VALUES ('2', '2104231635533', 'Napoleon-X','Napoleon-X', '1', 'upload/Napoleon-X.png,upload/Napoleon-X.png', '218.21', '美食简介美食简介美食简介美食简介美食简介美食简介美食简介', '2021-04-23 19:03:48');
INSERT INTO `difangmeishi` VALUES ('3', '2104231636571', 'Big-Crypto','Big-Crypto', '4', 'upload/Big-Crypto.png,upload/Big-Crypto.png', '177.66', '美食简介美食简介美食简介美食简介美食简介美食简介美食简介美食简介美食简介', '2021-04-23 18:54:04');
INSERT INTO `difangmeishi` VALUES ('4', '2104231637402', 'VBOLD-Index','VBOLD-Index', '2', 'upload/VBOLD-Index.png,upload/VBOLD-Index.png', '59.28', '美食简介美食简介美食简介美食简介美食简介美食简介美食简介美食简介美食简介美食简介美食简介美食简介美食简介美食简介美食简介美食简介美食简介美食简介美食简介美食简介美食简介美食简介美食简介美食简介美食简介美食简介美食简介美食简介美食简介美食简介美食简介美食简介美食简介美食简介美食简介美食简介美食简介美食简介美食简介美食简介美食简介美食简介美食简介美食简介美食简介美食简介美食简介美食简介', '2021-04-23 18:42:26');

-- ----------------------------
-- Table structure for `diqu`
-- ----------------------------
DROP TABLE IF EXISTS `diqu`;
CREATE TABLE `diqu` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `diqumingcheng` varchar(255) NOT NULL COMMENT '地区名称',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '添加时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='地区';

-- ----------------------------
-- Records of diqu
-- ----------------------------
INSERT INTO `diqu` VALUES ('1', '本地', '2021-04-23 18:24:34');
INSERT INTO `diqu` VALUES ('2', '境内', '2021-04-23 18:33:52');
INSERT INTO `diqu` VALUES ('6', '境外', '2021-04-23 18:12:25');

-- ----------------------------
-- Table structure for `jingdianxinxi`
-- ----------------------------
DROP TABLE IF EXISTS `jingdianxinxi`;
CREATE TABLE `jingdianxinxi` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `jingdianbianhao` varchar(50) NOT NULL COMMENT '景点编号',
  `jingdianmingcheng` varchar(255) NOT NULL COMMENT '景点名称',
  `suoshudiqu` int(10) unsigned NOT NULL COMMENT '所属地区',
  `tupian` text NOT NULL COMMENT '图片',
  `kaifangshijian` varchar(255) NOT NULL COMMENT '开放时间',
  `fujinmeishi` text NOT NULL COMMENT '附近美食',
  `dizhi` varchar(255) NOT NULL COMMENT '地址',
  `piaojia` decimal(18,2) NOT NULL COMMENT '票价',
  `liulanliang` int(11) NOT NULL COMMENT '浏览量',
  `miaoshu` longtext NOT NULL COMMENT '描述',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '添加时间',
  PRIMARY KEY (`id`),
  KEY `jingdianxinxi_suoshudiqu_index` (`suoshudiqu`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='景点信息';

-- ----------------------------
-- Records of jingdianxinxi
-- ----------------------------
INSERT INTO `jingdianxinxi` VALUES ('1', '2101091137481', 'InTheGame', '2', 'upload/InTheGame.png,upload/d506cc960ccd3d9aaf88146ed10d5f53.png,upload/c46cc0ff88af3292cc864dc46df1fa61.png', '全天开放', '红烧系列,美味中餐', '广西桂林', 16.85, 3, '<p>桂林漓江风景区游览胜地繁多...</p>', '2021-04-23 17:50:49');
INSERT INTO `jingdianxinxi` VALUES ('2', '2101091142120', 'AI-Revolution', '2', 'upload/AI-Revolution.png,upload/50a521e09e3009741329113dd9c765f7.png,upload/73c46ea394ac0184a3181f77851e4b65.png', '全天开放', '特色美食,红烧系列', '云南xx路', 13.0, 11, '<p>西双版纳傣族自治州，是云南省...</p>', '2021-04-23 18:02:30');
INSERT INTO `jingdianxinxi` VALUES ('3', '2101091147333', 'BigTech', '1', 'upload/BigTech.png,upload/57677818acbfddc07ed2483713cac2f7.png,upload/7526b5302d5410b9b992b61a1b6cfe55.png', '全天开发', '美味中餐,红烧系列', '广东深圳', 12.65, 0, '<p>世界之窗位于深圳湾畔...</p>', '2021-04-23 17:42:17');
INSERT INTO `jingdianxinxi` VALUES ('4', '2101091151440', 'WarrenBuffet-CF', '6', 'upload/WarrenBuffet-CF.png,upload/508325a5f7c0c4a4ddb91048647752a2.png,upload/5f33344eef6ef2a23ddeb22689b46e1f.png', '全天开放', '美味中餐,红烧系列', '北京', 11.62, 9, '<p>颐和园是我国清朝时期修建的皇家园林...</p>', '2021-04-23 17:22:58');
INSERT INTO `jingdianxinxi` VALUES ('5', '2101091420274', 'StanleyDruck13F', '1', 'upload/20210423/StanleyDruck13F.png,upload/20210423/14f9ad4b-c4ac-45a7-a55a-0a26498b7288.jpg', '全天开放', '红烧系列,特色美食222', '上海浦东', 11.62, 0, '<p>上海城隍庙位于上海市黄浦区方浜中路...</p>', '2021-04-23 17:31:38');

-- ----------------------------
-- Table structure for `liuyanban`
-- ----------------------------
DROP TABLE IF EXISTS `liuyanban`;
CREATE TABLE `liuyanban` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `xingming` varchar(50) NOT NULL COMMENT '姓名',
  `lianxidianhua` varchar(50) NOT NULL COMMENT '联系电话',
  `liuyanneirong` text NOT NULL COMMENT '留言内容',
  `liuyanren` varchar(50) NOT NULL COMMENT '留言人',
  `huifuneirong` text NOT NULL COMMENT '回复内容',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '添加时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='留言板';

-- ----------------------------
-- Records of liuyanban
-- ----------------------------
INSERT INTO `liuyanban` VALUES ('1', '大大', '13245678910', '留言内容', '111', '收到', '2021-04-23 17:58:45');
INSERT INTO `liuyanban` VALUES ('2', 'xx小小', '12345678910', '留言内容', '333', 'sd收到', '2021-04-23 18:10:36');

-- ----------------------------
-- Table structure for `lunbotu`
-- ----------------------------
DROP TABLE IF EXISTS `lunbotu`;
CREATE TABLE `lunbotu` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(50) NOT NULL COMMENT '标题',
  `image` varchar(255) NOT NULL COMMENT '图片',
  `url` varchar(255) NOT NULL COMMENT '连接地址',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '添加时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='轮播图';

-- ----------------------------
-- Records of lunbotu
-- ----------------------------
INSERT INTO `lunbotu` VALUES ('1', '1', 'upload/20210423/testla.png', '#', '2021-04-23 17:10:22');
INSERT INTO `lunbotu` VALUES ('2', '2', 'upload/20210423/CopyTrader.png', '#', '2021-04-23 17:10:32');

-- ----------------------------
-- Table structure for `lvyouxianlu`
-- ----------------------------
DROP TABLE IF EXISTS `lvyouxianlu`;
CREATE TABLE `lvyouxianlu` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `xianlubianhao` varchar(50) NOT NULL COMMENT '线路编号',
  `xianlumingcheng` varchar(255) NOT NULL COMMENT '线路名称',
  `tupian` text NOT NULL COMMENT '图片',
  `chufadi` varchar(255) NOT NULL COMMENT '出发地',
  `tujingdi` varchar(255) NOT NULL COMMENT '途经地',
  `zhongdian` varchar(255) NOT NULL COMMENT '终点',
  `jiage` decimal(18,2) NOT NULL COMMENT '价格',
  `liulanliang` int(11) NOT NULL COMMENT '浏览量',
  `xianlutese` longtext NOT NULL COMMENT '线路特色',
  `xianlujianjie` longtext NOT NULL COMMENT '线路简介',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '添加时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='旅游线路';

-- ----------------------------
-- Records of lvyouxianlu
-- ----------------------------
INSERT INTO `lvyouxianlu` VALUES ('1', '042317345975', 'VOO', 'upload/20210423/VOO.png,upload/20210423/VOO.png', '北京', '安徽', '上海', '523.21', '1', '<p>线路特色线路特色线路特色线路特色线路特色线路特色线路特色线路特色线路特色线路特色线路特色线路特色线路特色线路特色线路特色线路特色线路特色线路特色线路特色线路特色线路特色线路特色线路特色线路特色线路特色线路特色线路特色线路特色线路特色线路特色线路特色线路特色线路特色线路特色线路特色线路特色线路特色线路特色线路特色</p>', '<p>线路简介线路简介线路简介线路简介线路简介线路简介线路简介线路简介线路简介线路简介线路简介线路简介线路简介线路简介线路简介线路简介线路简介线路简介线路简介线路简介线路简介线路简介线路简介线路简介线路简介线路简介线路简介线路简介线路简介线路简介线路简介线路简介线路简介线路简介线路简介线路简介线路简介线路简介线路简介线路简介线路简介线路简介线路简介线路简介线路简介</p>', '2021-04-23 17:37:51');
INSERT INTO `lvyouxianlu` VALUES ('2', '042317383995', 'SPY', 'upload/20210423/SPY.png,upload/20210423/afe0acf7-e78a-4350-8ecd-bfc258d63309.jpg', '广东', '安徽', '北京', '145.21', '4', '<p>线路特色线路特色线路特色线路特色线路特色线路特色线路特色线路特色线路特色线路特色线路特色线路特色线路特色线路特色线路特色线路特色线路特色线路特色线路特色线路特色线路特色线路特色线路特色线路特色线路特色线路特色线路特色线路特色线路特色线路特色线路特色线路特色线路特色线路特色线路特色线路特色线路特色线路特色线路特色线路特色线路特色线路特色线路特色线路特色线路特色线路特色线路特色</p>', '<p>线路简介线路简介线路简介线路简介线路简介线路简介线路简介线路简介线路简介线路简介线路简介线路简介线路简介线路简介线路简介线路简介线路简介线路简介线路简介线路简介线路简介线路简介线路简介线路简介线路简介线路简介线路简介线路简介线路简介线路简介线路简介线路简介线路简介线路简介线路简介线路简介线路简介线路简介线路简介</p>', '2021-04-23 17:39:19');
INSERT INTO `lvyouxianlu` VALUES ('3', '042317396310', 'IVV', 'upload/20210423/IVV.png,upload/20210423/3aa28ed5-31ed-4fbc-a9f5-28080da37841.jpg', '云南', '广西', '海南', '324.21', '0', '<p>线路特色线路特色线路特色线路特色线路特色线路特色线路特色线路特色线路特色线路特色线路特色线路特色线路特色线路特色线路特色线路特色线路特色线路特色线路特色线路特色线路特色线路特色线路特色线路特色线路特色线路特色线路特色线路特色线路特色线路特色线路特色线路特色线路特色线路特色线路特色线路特色线路特色线路特色线路特色线路特色线路特色线路特色线路特色线路特色线路特色线路特色线路特色线路特色线路特色线路特色线路特色线路特色线路特色</p>', '<p>线路简介线路简介线路简介线路简介线路简介线路简介线路简介线路简介线路简介线路简介线路简介线路简介线路简介线路简介线路简介线路简介线路简介线路简介线路简介线路简介线路简介线路简介线路简介线路简介线路简介线路简介线路简介线路简介线路简介线路简介线路简介线路简介线路简介线路简介线路简介线路简介线路简介线路简介线路简介线路简介线路简介线路简介线路简介线路简介线路简介线路简介线路简介线路简介线路简介</p>', '2021-04-23 17:40:35');
INSERT INTO `lvyouxianlu` VALUES ('4', '042317404470', 'QQQ', 'upload/20210423/QQQ.png,upload/20210423/535def89-8d21-4305-88cd-2fd3aa8ecae4.jpg,upload/20210423/79fc129b-9668-48a5-8ade-eb8ce5927f9d.jpg', '广东', '湖南', '新疆', '444.18', '5', '<p>线路特色线路特色线路特色线路特色线路特色线路特色线路特色线路特色线路特色线路特色线路特色线路特色线路特色线路特色线路特色线路特色线路特色线路特色线路特色线路特色线路特色线路特色线路特色线路特色线路特色线路特色线路特色线路特色线路特色线路特色线路特色线路特色线路特色线路特色线路特色线路特色线路特色线路特色线路特色线路特色线路特色线路特色线路特色线路特色</p>', '<p>线路简介线路简介线路简介线路简介线路简介线路简介线路简介线路简介线路简介线路简介线路简介线路简介线路简介线路简介线路简介线路简介线路简介线路简介线路简介线路简介线路简介线路简介线路简介线路简介线路简介线路简介线路简介线路简介线路简介线路简介线路简介线路简介线路简介线路简介线路简介线路简介线路简介线路简介线路简介线路简介线路简介线路简介线路简介线路简介线路简介线路简介线路简介</p>', '2021-04-23 17:41:38');
INSERT INTO `lvyouxianlu` VALUES ('5', '042318054243', 'GLD', 'upload/20210423/GLD.png,upload/20210423/d6f35748-1019-4639-8516-a36e89158bb1.jpg', '安徽', '湖南，广西，', '广西', '307.47', '1', '<p>线路特色线路特色线路特色线路特色线路特色线路特色线路特色线路特色线路特色线路特色线路特色线路特色线路特色线路特色线路特色线路特色线路特色线路特色线路特色线路特色线路特色线路特色线路特色线路特色线路特色线路特色线路特色线路特色线路特色线路特色线路特色线路特色线路特色线路特色线路特色线路特色线路特色线路特色线路特色</p>', '<p>线路简介线路简介线路简介线路简介线路简介线路简介线路简介线路简介线路简介线路简介线路简介线路简介线路简介线路简介线路简介线路简介线路简介线路简介线路简介线路简介线路简介线路简介线路简介线路简介线路简介线路简介线路简介线路简介线路简介线路简介线路简介线路简介线路简介线路简介线路简介线路简介线路简介</p>', '2021-04-23 18:06:31');

-- ----------------------------
-- Table structure for `meishifenlei`
-- ----------------------------
DROP TABLE IF EXISTS `meishifenlei`;
CREATE TABLE `meishifenlei` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `fenleimingcheng` varchar(255) NOT NULL COMMENT '分类名称',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '添加时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='美食分类';

-- ----------------------------
-- Records of meishifenlei
-- ----------------------------
INSERT INTO `meishifenlei` VALUES ('1', '川菜', '2021-04-23 19:54:22');
INSERT INTO `meishifenlei` VALUES ('2', '粤菜', '2021-04-23 19:45:53');
INSERT INTO `meishifenlei` VALUES ('3', '西餐', '2021-04-23 19:37:14');
INSERT INTO `meishifenlei` VALUES ('4', '中餐', '2021-04-23 19:24:08');

-- ----------------------------
-- Table structure for `shoucangjilu`
-- ----------------------------
DROP TABLE IF EXISTS `shoucangjilu`;
CREATE TABLE `shoucangjilu` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL COMMENT '收藏用户',
  `xwid` int(10) unsigned NOT NULL COMMENT '对应模块id',
  `biao` varchar(255) NOT NULL COMMENT '收藏得模块',
  `biaoti` varchar(255) NOT NULL COMMENT '显示的标题',
  `url` varchar(512) NOT NULL COMMENT '收藏URL',
  `ziduan` varchar(255) NOT NULL COMMENT '对应模块字段',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '添加时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='收藏记录';

-- ----------------------------
-- Records of shoucangjilu
-- ----------------------------
INSERT INTO `shoucangjilu` VALUES ('1', 'admin', '4', 'jingdianxinxi', '颐和园', 'http://192.168.0.38:8080/', 'jingdianmingcheng', '2021-04-23 17:43:13');
INSERT INTO `shoucangjilu` VALUES ('2', '111', '2', 'lvyouxianlu', '广东-北京', 'http://192.168.0.38:8080/', 'xianlumingcheng', '2021-04-23 17:53:05');
INSERT INTO `shoucangjilu` VALUES ('3', '333', '4', 'lvyouxianlu', '广东-新疆', 'http://192.168.0.38:8080/', 'xianlumingcheng', '2021-04-23 18:10:47');

-- ----------------------------
-- Table structure for `token`
-- ----------------------------
DROP TABLE IF EXISTS `token`;
CREATE TABLE `token` (
  `token` char(32) NOT NULL COMMENT '唯一值',
  `session` text NOT NULL COMMENT '保存得数据',
  `cx` varchar(50) NOT NULL COMMENT '登录权限',
  `login` varchar(50) NOT NULL COMMENT '登录模块',
  `username` varchar(50) NOT NULL COMMENT '登录用户',
  `valueid` varchar(50) NOT NULL COMMENT '用户id',
  `token_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '当前时间',
  PRIMARY KEY (`token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='前端登录凭证';

-- ----------------------------
-- Records of token
-- ----------------------------
INSERT INTO `token` VALUES ('C9LU6U1GGCF78WLR3LOZ8433FKDZ3TG3', '{\"addtime\":\"2021-04-23 16:53:57.0\",\"id\":1,\"pwd\":\"admin\",\"username\":\"admin\"}', '管理员', '管理员', 'admin', '1', '2021-05-03 17:48:08');
INSERT INTO `token` VALUES ('EZ6W9HN4DPVOIG3PK2F90ZZ92BUWK6BQ', '{\"cx\":\"管理员\",\"addtime\":\"2021-04-23 16:53:57.0\",\"id\":1,\"pwd\":\"admin\",\"login\":\"管理员\",\"username\":\"admin\"}', '管理员', '管理员', 'admin', '1', '2021-05-03 18:11:44');
INSERT INTO `token` VALUES ('G8PWUERDB7HK755WRBTL6RSG6UIOCNBG', '{\"touxiang\":\"upload/20210423/f50d111c-1492-4664-9953-81a2f9d2a6b9.png\",\"mima\":\"333\",\"xingbie\":\"女\",\"login\":\"用户\",\"xingming\":\"小小\",\"yonghuming\":\"333\",\"shouji\":\"13245679810\",\"cx\":\"用户\",\"addtime\":\"2021-04-23 18:10:07.0\",\"id\":2,\"shenfenzheng\":\"132456789415610\",\"youxiang\":\"15641@qq.com\",\"username\":\"333\"}', '用户', '用户', '333', '2', '2021-05-03 18:10:17');
INSERT INTO `token` VALUES ('QM0KIZGEKIB0VDT8Z84VCEUYOVM8ACEI', '{\"cx\":\"管理员\",\"addtime\":\"2021-04-23 16:53:57.0\",\"id\":1,\"pwd\":\"admin\",\"login\":\"管理员\",\"username\":\"admin\"}', '管理员', '管理员', 'admin', '1', '2021-05-03 18:02:37');
INSERT INTO `token` VALUES ('S2GGPZMUQLGVUD8VB1YRD9XRXAAF9MO5', '{\"addtime\":\"2021-04-23 17:52:05.0\",\"id\":1,\"mima\":\"111\",\"shenfenzheng\":\"123456789123456\",\"shouji\":\"13245678910\",\"touxiang\":\"upload/20210423/f0617774-faba-4377-8efa-8946d00ad807.png\",\"xingbie\":\"男\",\"xingming\":\"大大\",\"yonghuming\":\"111\",\"youxiang\":\"15641@qq.com\"}', '用户', '用户', '111', '1', '2021-05-03 17:56:54');

-- ----------------------------
-- Table structure for `xinwenfenlei`
-- ----------------------------
DROP TABLE IF EXISTS `xinwenfenlei`;
CREATE TABLE `xinwenfenlei` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `fenleimingcheng` varchar(50) NOT NULL COMMENT '分类名称',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '添加时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='新闻分类';

-- ----------------------------
-- Records of xinwenfenlei
-- ----------------------------
INSERT INTO `xinwenfenlei` VALUES ('1', '站内新闻', '2021-04-23 17:05:48');
INSERT INTO `xinwenfenlei` VALUES ('2', '行业资讯', '2021-04-23 17:14:37');

-- ----------------------------
-- Table structure for `xinwenxinxi`
-- ----------------------------
DROP TABLE IF EXISTS `xinwenxinxi`;
CREATE TABLE `xinwenxinxi` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `biaoti` varchar(255) NOT NULL COMMENT '标题',
  `fenlei` int(10) unsigned NOT NULL COMMENT '分类',
  `tupian` varchar(255) NOT NULL COMMENT '图片',
  `tianjiaren` varchar(50) NOT NULL COMMENT '添加人',
  `dianjilv` int(11) NOT NULL COMMENT '点击率',
  `neirong` longtext NOT NULL COMMENT '内容',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '添加时间',
  PRIMARY KEY (`id`),
  KEY `xinwenxinxi_fenlei_index` (`fenlei`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='新闻信息';

-- ----------------------------
-- Records of xinwenxinxi
-- ----------------------------
INSERT INTO `xinwenxinxi` VALUES ('1', 'Stock futures rise after major averages tumble in tech sector sell-off: Live updates', '2', 'upload/20210423/news1.png', 'admin', '1', '<p class="yf-1090901">Stocks hit session lows on Wednesday afternoon as Powell <a data-i13n="cpos:8;pos:1" href="https://finance.yahoo.com/news/powell-sees-challenging-scenario-for-fed-if-trump-tariffs-stoke-inflation-and-slow-growth-173002914.html" data-ylk="slk:said during a speech in Chicago;cpos:8;pos:1;elm:context_link;itc:0;sec:content-canvas;outcm:mb_qualified_link;_E:mb_qualified_link;ct:story;" class="link  yahoo-link" data-rapid_p="28" data-v9y="1">said during a speech in Chicago</a> that the central bank will "wait for greater clarity" before considering any interest rate adjustments. He said he expects Trump’s tariffs to generate "higher inflation and slower growth."</p>', '2021-04-23 17:44:31');
INSERT INTO `xinwenxinxi` VALUES ('2', 'Stock market today: Dow, S&P 500, Nasdaq smoked as Powell warns of \'challenging\' tariff impact, Nvidia plunges 7%', '2', 'upload/20210423/news2.png', 'admin', '2', '<p class="yf-1090901">US stocks tumbled on Wednesday with tariff fears returning to Wall Street in earnest, as Nvidia (<a data-i13n="cpos:1;pos:1" href="https://finance.yahoo.com/quote/NVDA/" data-ylk="slk:NVDA;cpos:1;pos:1;elm:context_link;itc:0;sec:content-canvas" class="link " data-rapid_p="21" data-v9y="1">NVDA</a>) <a data-i13n="cpos:2;pos:1" href="https://finance.yahoo.com/news/nvidia-stock-dives-as-chipmaker-sees-55-billion-hit-from-surprise-china-chip-controls-130319576.html" data-ylk="slk:revealed costly new curbs on chip exports to China;cpos:2;pos:1;elm:context_link;itc:0;sec:content-canvas;outcm:mb_qualified_link;_E:mb_qualified_link;ct:story;" class="link  yahoo-link" data-rapid_p="22" data-v9y="1">revealed costly new curbs on chip exports to China</a> and Fed Chair Jerome Powell <a data-i13n="cpos:3;pos:1" href="https://finance.yahoo.com/news/powell-sees-challenging-scenario-for-fed-if-trump-tariffs-stoke-inflation-and-slow-growth-173002914.html" data-ylk="slk:warned of the &quot;challenging&quot; impacts;cpos:3;pos:1;elm:context_link;itc:0;sec:content-canvas;outcm:mb_qualified_link;_E:mb_qualified_link;ct:story;" class="link  yahoo-link" data-rapid_p="23" data-v9y="1">warned of the "challenging" impacts</a> to come from the uncertainty around <a data-i13n="cpos:4;pos:1" href="https://finance.yahoo.com/news/live/trump-tariffs-live-updates-china-signals-readiness-for-talks-if-us-shows-respect-amid-numbers-game-191201017.html" data-ylk="slk:President Trump\'s trade policy;cpos:4;pos:1;elm:context_link;itc:0;sec:content-canvas;outcm:mb_qualified_link;_E:mb_qualified_link;ct:story;" class="link  yahoo-link" data-rapid_p="24" data-v9y="1">President Trump\'s trade policy</a>.</p><p class="yf-1090901">The benchmark S&amp;P 500 (<a data-i13n="cpos:5;pos:1" href="https://finance.yahoo.com/quote/%5EGSPC" data-ylk="slk:^GSPC;cpos:5;pos:1;elm:context_link;itc:0;sec:content-canvas" class="link " data-rapid_p="25" data-v9y="1">^GSPC</a>) dropped more than 2.2% while the Dow Jones Industrial Average (<a data-i13n="cpos:6;pos:1" href="https://finance.yahoo.com/quote/%5EDJI" data-ylk="slk:^DJI;cpos:6;pos:1;elm:context_link;itc:0;sec:content-canvas" class="link " data-rapid_p="26" data-v9y="1">^DJI</a>) shed roughly 700 points, or around 1.7%. The tech-heavy Nasdaq Composite (<a data-i13n="cpos:7;pos:1" href="https://finance.yahoo.com/quote/%5EIXIC" data-ylk="slk:^IXIC;cpos:7;pos:1;elm:context_link;itc:0;sec:content-canvas" class="link " data-rapid_p="27" data-v9y="1">^IXIC</a>) fell over 3% as the new chip provisions weighed on the tech sector.</p>', '2021-04-23 17:45:21');
INSERT INTO `xinwenxinxi` VALUES ('3', 'Dow drops nearly 700 points, Nasdaq tumbles 3% in tech-driven sell-off: Live updates', '1', 'upload/20210423/news3.png', 'admin', '2', '<p>Stocks fell sharply on Wednesday as a stark warning from <span class="QuoteInBody-quoteNameContainer" data-test="QuoteInBody" id="LiveBlogArticle-QuoteInBody-1"><a href="/quotes/NVDA/">Nvidia</a><span class="QuoteInBody-inlineButton"><span class="AddToWatchlistButton-watchlistContainer" id="-WatchlistDropdown" data-analytics-id="-WatchlistDropdown"><button class="AddToWatchlistButton-watchlistButton" aria-label="Add To Watchlist" data-testid="dropdown-btn"><span class="AddToWatchlistButton-addWatchListFromTag"></span></button></span></span></span> roiled global tech and concerns from Federal Reserve Chair <a href="https://www.cnbc.com/jay-powell/">Jerome Powell</a> about the economic impact of tariffs raised alarm among skittish investors.</p>', '2021-04-23 17:46:09');

-- ----------------------------
-- Table structure for `yonghu`
-- ----------------------------
DROP TABLE IF EXISTS `yonghu`;
CREATE TABLE `yonghu` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `yonghuming` varchar(50) NOT NULL COMMENT '用户名',
  `mima` varchar(50) NOT NULL COMMENT '密码',
  `xingming` varchar(50) NOT NULL COMMENT '姓名',
  `xingbie` varchar(255) NOT NULL COMMENT '性别',
  `shouji` varchar(50) NOT NULL COMMENT '手机',
  `youxiang` varchar(50) NOT NULL COMMENT '邮箱',
  `shenfenzheng` varchar(50) NOT NULL COMMENT '身份证',
  `touxiang` varchar(255) NOT NULL COMMENT '头像',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '添加时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='用户';

-- ----------------------------
-- Records of yonghu
-- ----------------------------
INSERT INTO `yonghu` VALUES ('1', '111', '111', '大大', '男', '13245678910', '15641@qq.com', '123456789123456', 'upload/20210423/f0617774-faba-4377-8efa-8946d00ad807.png', '2021-04-23 17:52:05');
INSERT INTO `yonghu` VALUES ('2', '333', '333', '小小', '女', '13245679810', '15641@qq.com', '132456789415610', 'upload/20210423/f50d111c-1492-4664-9953-81a2f9d2a6b9.png', '2021-04-23 18:10:07');

-- ----------------------------
-- Table structure for `youqinglianjie`
-- ----------------------------
DROP TABLE IF EXISTS `youqinglianjie`;
CREATE TABLE `youqinglianjie` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `wangzhanmingcheng` varchar(50) NOT NULL COMMENT '网站名称',
  `wangzhi` varchar(50) NOT NULL COMMENT '网址',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '添加时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='友情链接';

-- ----------------------------
-- Records of youqinglianjie
-- ----------------------------
INSERT INTO `youqinglianjie` VALUES ('1', '百度', 'http://www.baidu.com', '2021-04-23 16:43:58');
INSERT INTO `youqinglianjie` VALUES ('2', '谷歌', 'http://www.google.cn', '2021-04-23 16:43:58');
INSERT INTO `youqinglianjie` VALUES ('3', '新浪', 'http://www.sina.com', '2021-04-23 16:43:58');
INSERT INTO `youqinglianjie` VALUES ('4', 'QQ', 'http://www.qq.com', '2021-04-23 16:43:58');
INSERT INTO `youqinglianjie` VALUES ('5', '网易', 'http://www.163.com', '2021-04-23 16:43:58');

-- ----------------------------
-- Table structure for `yuding`
-- ----------------------------
DROP TABLE IF EXISTS `yuding`;
CREATE TABLE `yuding` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `lvyouxianluid` int(10) unsigned NOT NULL COMMENT '旅游线路id',
  `xianlubianhao` varchar(50) NOT NULL COMMENT '线路编号',
  `xianlumingcheng` varchar(255) NOT NULL COMMENT '线路名称',
  `chufadi` varchar(255) NOT NULL COMMENT '出发地',
  `tujingdi` varchar(255) NOT NULL COMMENT '途经地',
  `zhongdian` varchar(255) NOT NULL COMMENT '终点',
  `jiage` decimal(18,2) NOT NULL COMMENT '价格',
  `dingdanhao` varchar(50) NOT NULL COMMENT '订单号',
  `yudingshijian` varchar(25) NOT NULL COMMENT '预订时间',
  `yudingrenxingming` varchar(50) NOT NULL COMMENT '预订人姓名',
  `lianxifangshi` varchar(50) NOT NULL COMMENT '联系方式',
  `zhuangtai` varchar(50) NOT NULL COMMENT '状态',
  `beizhu` text NOT NULL COMMENT '备注',
  `yudingren` varchar(50) NOT NULL COMMENT '预订人',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '添加时间',
  `iszf` varchar(10) NOT NULL DEFAULT '否' COMMENT '是否支付',
  PRIMARY KEY (`id`),
  KEY `yuding_lvyouxianluid_index` (`lvyouxianluid`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='预定';

-- ----------------------------
-- Records of yuding
-- ----------------------------
INSERT INTO `yuding` VALUES ('1', '2', '042317383995', '广东-北京', '广东', '安徽', '北京', '1200.00', '042317536352', '2021-04-23 17:53:14', '小小', '13245678910', '预定成功', '备注备注', '111', '2021-04-23 17:53:26', '是');
INSERT INTO `yuding` VALUES ('2', '4', '042317404470', '广东-新疆', '广东', '湖南', '新疆', '3000.00', '042318101743', '2021-04-23 18:10:53', '小小', '12345679810', '预定成功', '备注备注备注备注', '333', '2021-04-23 18:11:01', '是');
