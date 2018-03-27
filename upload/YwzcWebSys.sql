/*
Navicat MySQL Data Transfer

Source Server         : qnap.imchs.com
Source Server Version : 50557
Source Host           : qnap.imchs.com:33060
Source Database       : YwzcWebSys

Target Server Type    : MYSQL
Target Server Version : 50557
File Encoding         : 65001

Date: 2018-03-27 13:29:46
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for auth_group
-- ----------------------------
DROP TABLE IF EXISTS `auth_group`;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_group
-- ----------------------------
INSERT INTO `auth_group` VALUES ('1', '业务支持组');

-- ----------------------------
-- Table structure for auth_group_permissions
-- ----------------------------
DROP TABLE IF EXISTS `auth_group_permissions`;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissions_group_id_b120cbf9` (`group_id`),
  KEY `auth_group_permissions_permission_id_84c5c92e` (`permission_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_group_permissions
-- ----------------------------

-- ----------------------------
-- Table structure for auth_permission
-- ----------------------------
DROP TABLE IF EXISTS `auth_permission`;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  KEY `auth_permission_content_type_id_2f476e4b` (`content_type_id`)
) ENGINE=MyISAM AUTO_INCREMENT=128 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_permission
-- ----------------------------
INSERT INTO `auth_permission` VALUES ('1', 'Can add log entry', '1', 'add_logentry');
INSERT INTO `auth_permission` VALUES ('2', 'Can change log entry', '1', 'change_logentry');
INSERT INTO `auth_permission` VALUES ('3', 'Can delete log entry', '1', 'delete_logentry');
INSERT INTO `auth_permission` VALUES ('4', 'Can view log entry', '1', 'view_logentry');
INSERT INTO `auth_permission` VALUES ('5', 'Can add group', '2', 'add_group');
INSERT INTO `auth_permission` VALUES ('6', 'Can change group', '2', 'change_group');
INSERT INTO `auth_permission` VALUES ('7', 'Can delete group', '2', 'delete_group');
INSERT INTO `auth_permission` VALUES ('8', 'Can add permission', '3', 'add_permission');
INSERT INTO `auth_permission` VALUES ('9', 'Can change permission', '3', 'change_permission');
INSERT INTO `auth_permission` VALUES ('10', 'Can delete permission', '3', 'delete_permission');
INSERT INTO `auth_permission` VALUES ('11', 'Can view group', '2', 'view_group');
INSERT INTO `auth_permission` VALUES ('12', 'Can view permission', '3', 'view_permission');
INSERT INTO `auth_permission` VALUES ('13', 'Can add content type', '4', 'add_contenttype');
INSERT INTO `auth_permission` VALUES ('14', 'Can change content type', '4', 'change_contenttype');
INSERT INTO `auth_permission` VALUES ('15', 'Can delete content type', '4', 'delete_contenttype');
INSERT INTO `auth_permission` VALUES ('16', 'Can view content type', '4', 'view_contenttype');
INSERT INTO `auth_permission` VALUES ('17', 'Can add session', '5', 'add_session');
INSERT INTO `auth_permission` VALUES ('18', 'Can change session', '5', 'change_session');
INSERT INTO `auth_permission` VALUES ('19', 'Can delete session', '5', 'delete_session');
INSERT INTO `auth_permission` VALUES ('20', 'Can view session', '5', 'view_session');
INSERT INTO `auth_permission` VALUES ('21', 'Can add 系统字典维护', '6', 'add_sysdictitem');
INSERT INTO `auth_permission` VALUES ('22', 'Can change 系统字典维护', '6', 'change_sysdictitem');
INSERT INTO `auth_permission` VALUES ('23', 'Can delete 系统字典维护', '6', 'delete_sysdictitem');
INSERT INTO `auth_permission` VALUES ('24', 'Can add 系统字典', '7', 'add_sysdictname');
INSERT INTO `auth_permission` VALUES ('25', 'Can change 系统字典', '7', 'change_sysdictname');
INSERT INTO `auth_permission` VALUES ('26', 'Can delete 系统字典', '7', 'delete_sysdictname');
INSERT INTO `auth_permission` VALUES ('27', 'Can add 用户信息', '8', 'add_userprofile');
INSERT INTO `auth_permission` VALUES ('28', 'Can change 用户信息', '8', 'change_userprofile');
INSERT INTO `auth_permission` VALUES ('29', 'Can delete 用户信息', '8', 'delete_userprofile');
INSERT INTO `auth_permission` VALUES ('30', 'Can view 系统字典维护', '6', 'view_sysdictitem');
INSERT INTO `auth_permission` VALUES ('31', 'Can view 系统字典', '7', 'view_sysdictname');
INSERT INTO `auth_permission` VALUES ('32', 'Can view 用户信息', '8', 'view_userprofile');
INSERT INTO `auth_permission` VALUES ('33', 'Can add log entry', '9', 'add_log');
INSERT INTO `auth_permission` VALUES ('34', 'Can change log entry', '9', 'change_log');
INSERT INTO `auth_permission` VALUES ('35', 'Can delete log entry', '9', 'delete_log');
INSERT INTO `auth_permission` VALUES ('36', 'Can add User Setting', '10', 'add_usersettings');
INSERT INTO `auth_permission` VALUES ('37', 'Can change User Setting', '10', 'change_usersettings');
INSERT INTO `auth_permission` VALUES ('38', 'Can delete User Setting', '10', 'delete_usersettings');
INSERT INTO `auth_permission` VALUES ('39', 'Can add Bookmark', '11', 'add_bookmark');
INSERT INTO `auth_permission` VALUES ('40', 'Can change Bookmark', '11', 'change_bookmark');
INSERT INTO `auth_permission` VALUES ('41', 'Can delete Bookmark', '11', 'delete_bookmark');
INSERT INTO `auth_permission` VALUES ('42', 'Can add User Widget', '12', 'add_userwidget');
INSERT INTO `auth_permission` VALUES ('43', 'Can change User Widget', '12', 'change_userwidget');
INSERT INTO `auth_permission` VALUES ('44', 'Can delete User Widget', '12', 'delete_userwidget');
INSERT INTO `auth_permission` VALUES ('45', 'Can view log entry', '9', 'view_log');
INSERT INTO `auth_permission` VALUES ('46', 'Can view User Setting', '10', 'view_usersettings');
INSERT INTO `auth_permission` VALUES ('47', 'Can view Bookmark', '11', 'view_bookmark');
INSERT INTO `auth_permission` VALUES ('48', 'Can view User Widget', '12', 'view_userwidget');
INSERT INTO `auth_permission` VALUES ('64', 'Can view 192.168.169.0', '17', 'view_test169netmanage');
INSERT INTO `auth_permission` VALUES ('63', 'Can view ywzctestipmanage', '16', 'view_ywzctestipmanage');
INSERT INTO `auth_permission` VALUES ('66', 'Can change 10.0.10.0', '15', 'change_net10manage');
INSERT INTO `auth_permission` VALUES ('65', 'Can add 10.0.10.0', '15', 'add_net10manage');
INSERT INTO `auth_permission` VALUES ('62', 'Can view groupadmin', '14', 'view_groupadmin');
INSERT INTO `auth_permission` VALUES ('61', 'Can view usergroup', '13', 'view_usergroup');
INSERT INTO `auth_permission` VALUES ('57', 'Can add IP地址管理', '15', 'add_ipmanage');
INSERT INTO `auth_permission` VALUES ('58', 'Can change IP地址管理', '15', 'change_ipmanage');
INSERT INTO `auth_permission` VALUES ('59', 'Can delete IP地址管理', '15', 'delete_ipmanage');
INSERT INTO `auth_permission` VALUES ('60', 'Can view IP地址管理', '15', 'view_ipmanage');
INSERT INTO `auth_permission` VALUES ('67', 'Can delete 10.0.10.0', '15', 'delete_net10manage');
INSERT INTO `auth_permission` VALUES ('68', 'Can add 10.0.5.0', '15', 'add_net5manage');
INSERT INTO `auth_permission` VALUES ('69', 'Can change 10.0.5.0', '15', 'change_net5manage');
INSERT INTO `auth_permission` VALUES ('70', 'Can delete 10.0.5.0', '15', 'delete_net5manage');
INSERT INTO `auth_permission` VALUES ('71', 'Can add 192.168.170.0', '15', 'add_test170netmanage');
INSERT INTO `auth_permission` VALUES ('72', 'Can change 192.168.170.0', '15', 'change_test170netmanage');
INSERT INTO `auth_permission` VALUES ('73', 'Can delete 192.168.170.0', '15', 'delete_test170netmanage');
INSERT INTO `auth_permission` VALUES ('74', 'Can add 192.168.171.0', '15', 'add_test171netmanage');
INSERT INTO `auth_permission` VALUES ('75', 'Can change 192.168.171.0', '15', 'change_test171netmanage');
INSERT INTO `auth_permission` VALUES ('76', 'Can delete 192.168.171.0', '15', 'delete_test171netmanage');
INSERT INTO `auth_permission` VALUES ('77', 'Can add 10.0.2.0', '15', 'add_net2manage');
INSERT INTO `auth_permission` VALUES ('78', 'Can change 10.0.2.0', '15', 'change_net2manage');
INSERT INTO `auth_permission` VALUES ('79', 'Can delete 10.0.2.0', '15', 'delete_net2manage');
INSERT INTO `auth_permission` VALUES ('80', 'Can add 10.0.9.0', '15', 'add_net9manage');
INSERT INTO `auth_permission` VALUES ('81', 'Can change 10.0.9.0', '15', 'change_net9manage');
INSERT INTO `auth_permission` VALUES ('82', 'Can delete 10.0.9.0', '15', 'delete_net9manage');
INSERT INTO `auth_permission` VALUES ('83', 'Can add 192.168.169.0', '15', 'add_test169netmanage');
INSERT INTO `auth_permission` VALUES ('84', 'Can change 192.168.169.0', '15', 'change_test169netmanage');
INSERT INTO `auth_permission` VALUES ('85', 'Can delete 192.168.169.0', '15', 'delete_test169netmanage');
INSERT INTO `auth_permission` VALUES ('86', 'Can add 192.168.168.0', '15', 'add_test168netmanage');
INSERT INTO `auth_permission` VALUES ('87', 'Can change 192.168.168.0', '15', 'change_test168netmanage');
INSERT INTO `auth_permission` VALUES ('88', 'Can delete 192.168.168.0', '15', 'delete_test168netmanage');
INSERT INTO `auth_permission` VALUES ('89', 'Can add 10.0.12.0', '15', 'add_net12manage');
INSERT INTO `auth_permission` VALUES ('90', 'Can change 10.0.12.0', '15', 'change_net12manage');
INSERT INTO `auth_permission` VALUES ('91', 'Can delete 10.0.12.0', '15', 'delete_net12manage');
INSERT INTO `auth_permission` VALUES ('92', 'Can add 10.0.16.64', '15', 'add_net16manage');
INSERT INTO `auth_permission` VALUES ('93', 'Can change 10.0.16.64', '15', 'change_net16manage');
INSERT INTO `auth_permission` VALUES ('94', 'Can delete 10.0.16.64', '15', 'delete_net16manage');
INSERT INTO `auth_permission` VALUES ('95', 'Can view 10.0.9.0', '18', 'view_net9manage');
INSERT INTO `auth_permission` VALUES ('96', 'Can view 10.0.12.0', '19', 'view_net12manage');
INSERT INTO `auth_permission` VALUES ('97', 'Can view 10.0.2.0', '20', 'view_net2manage');
INSERT INTO `auth_permission` VALUES ('98', 'Can view 192.168.168.0', '21', 'view_test168netmanage');
INSERT INTO `auth_permission` VALUES ('99', 'Can view 10.0.5.0', '22', 'view_net5manage');
INSERT INTO `auth_permission` VALUES ('100', 'Can view 192.168.171.0', '23', 'view_test171netmanage');
INSERT INTO `auth_permission` VALUES ('101', 'Can view 10.0.10.0', '24', 'view_net10manage');
INSERT INTO `auth_permission` VALUES ('102', 'Can view 10.0.16.64', '25', 'view_net16manage');
INSERT INTO `auth_permission` VALUES ('103', 'Can view 192.168.170.0', '26', 'view_test170netmanage');
INSERT INTO `auth_permission` VALUES ('104', 'Can add 10.0.91.0', '15', 'add_net91manage');
INSERT INTO `auth_permission` VALUES ('105', 'Can change 10.0.91.0', '15', 'change_net91manage');
INSERT INTO `auth_permission` VALUES ('106', 'Can delete 10.0.91.0', '15', 'delete_net91manage');
INSERT INTO `auth_permission` VALUES ('107', 'Can view 10.0.91.0', '27', 'view_net91manage');
INSERT INTO `auth_permission` VALUES ('108', 'Can add 数据库备份任务', '28', 'add_dbbacktaskset');
INSERT INTO `auth_permission` VALUES ('109', 'Can change 数据库备份任务', '28', 'change_dbbacktaskset');
INSERT INTO `auth_permission` VALUES ('110', 'Can delete 数据库备份任务', '28', 'delete_dbbacktaskset');
INSERT INTO `auth_permission` VALUES ('111', 'Can view 数据库备份任务', '28', 'view_dbbacktaskset');
INSERT INTO `auth_permission` VALUES ('112', 'Can add 数据库备份日志', '29', 'add_dbbacktasklog');
INSERT INTO `auth_permission` VALUES ('113', 'Can change 数据库备份日志', '29', 'change_dbbacktasklog');
INSERT INTO `auth_permission` VALUES ('114', 'Can delete 数据库备份日志', '29', 'delete_dbbacktasklog');
INSERT INTO `auth_permission` VALUES ('115', 'Can view 数据库备份日志', '29', 'view_dbbacktasklog');
INSERT INTO `auth_permission` VALUES ('116', 'Can add 系统参数', '30', 'add_sysparam');
INSERT INTO `auth_permission` VALUES ('117', 'Can change 系统参数', '30', 'change_sysparam');
INSERT INTO `auth_permission` VALUES ('118', 'Can delete 系统参数', '30', 'delete_sysparam');
INSERT INTO `auth_permission` VALUES ('119', 'Can view 系统参数', '30', 'view_sysparam');
INSERT INTO `auth_permission` VALUES ('120', 'Can add 新增营业部信息', '31', 'add_inserneworginfo');
INSERT INTO `auth_permission` VALUES ('121', 'Can change 新增营业部信息', '31', 'change_inserneworginfo');
INSERT INTO `auth_permission` VALUES ('122', 'Can delete 新增营业部信息', '31', 'delete_inserneworginfo');
INSERT INTO `auth_permission` VALUES ('123', 'Can view 新增营业部信息', '31', 'view_inserneworginfo');
INSERT INTO `auth_permission` VALUES ('124', 'Can add 营业部添加日志', '32', 'add_inserneworginfolog');
INSERT INTO `auth_permission` VALUES ('125', 'Can change 营业部添加日志', '32', 'change_inserneworginfolog');
INSERT INTO `auth_permission` VALUES ('126', 'Can delete 营业部添加日志', '32', 'delete_inserneworginfolog');
INSERT INTO `auth_permission` VALUES ('127', 'Can view 营业部添加日志', '32', 'view_inserneworginfolog');

-- ----------------------------
-- Table structure for backtaskmget_dbbacktasklog
-- ----------------------------
DROP TABLE IF EXISTS `backtaskmget_dbbacktasklog`;
CREATE TABLE `backtaskmget_dbbacktasklog` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `task_name` varchar(128) NOT NULL,
  `task_run_date` date NOT NULL,
  `task_run_time` time NOT NULL,
  `host_ip` char(39) NOT NULL,
  `db_type` varchar(8) NOT NULL,
  `names_of_backdb` varchar(512) NOT NULL,
  `file_name` varchar(100) NOT NULL,
  `compre_type` varchar(8) NOT NULL,
  `file_save_path` varchar(255) NOT NULL,
  `arch_nas_path` varchar(255) NOT NULL,
  `compre_passwd` varchar(32) NOT NULL,
  `file_siz` varchar(100) NOT NULL,
  `md5_string` varchar(64) NOT NULL,
  `remark` longtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of backtaskmget_dbbacktasklog
-- ----------------------------

-- ----------------------------
-- Table structure for backtaskmget_dbbacktaskset
-- ----------------------------
DROP TABLE IF EXISTS `backtaskmget_dbbacktaskset`;
CREATE TABLE `backtaskmget_dbbacktaskset` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `task_name` varchar(128) NOT NULL,
  `host_ip` char(39) NOT NULL,
  `host_user` varchar(32) NOT NULL,
  `host_user_passwd` varchar(128) NOT NULL,
  `db_type` varchar(8) DEFAULT NULL,
  `db_sid` varchar(16) NOT NULL,
  `db_user` varchar(16) NOT NULL,
  `db_user_passwd` varchar(32) NOT NULL,
  `is_compre` varchar(1) NOT NULL,
  `compre_type` varchar(8) NOT NULL,
  `file_save_path` varchar(255) NOT NULL,
  `names_of_backdb` varchar(512) NOT NULL,
  `reserved_day` int(11) NOT NULL,
  `proc_flag` varchar(1) NOT NULL,
  `task_run_time` time NOT NULL,
  `enforce_flag` varchar(4) NOT NULL,
  `is_compre_passwd` varchar(32) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of backtaskmget_dbbacktaskset
-- ----------------------------
INSERT INTO `backtaskmget_dbbacktaskset` VALUES ('1', '统一账户系统数据库备份', '10.0.10.34', 'root', '25465465', 'ORACLE', 'safd', 'sadf', 'asdfasdasfdasf', 'Y', 'RAR', 'd:\\sadfasd\\asdf\\asdf\\asdf.dump', 'kbssuser,ddd,chdb', '10', 'Y', '23:30:00', 'N', 'Y');

-- ----------------------------
-- Table structure for commset_sysdictitem
-- ----------------------------
DROP TABLE IF EXISTS `commset_sysdictitem`;
CREATE TABLE `commset_sysdictitem` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dict_item` varchar(64) NOT NULL,
  `dict_item_name` varchar(128) NOT NULL,
  `org_id` varchar(4) NOT NULL,
  `remark` longtext,
  `dict_name_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `commset_sysdictitem_dict_name_id_aea4f800` (`dict_name_id`)
) ENGINE=MyISAM AUTO_INCREMENT=34 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of commset_sysdictitem
-- ----------------------------
INSERT INTO `commset_sysdictitem` VALUES ('1', '0', '保密', '0000', '', '1');
INSERT INTO `commset_sysdictitem` VALUES ('2', '1', '男', '0000', '', '1');
INSERT INTO `commset_sysdictitem` VALUES ('3', '2', '女', '0000', '', '1');
INSERT INTO `commset_sysdictitem` VALUES ('31', '1', '全部完成', '0000', '', '11');
INSERT INTO `commset_sysdictitem` VALUES ('30', '0', '待处理', '0000', '', '11');
INSERT INTO `commset_sysdictitem` VALUES ('29', '5', '机构业务', '0000', '', '10');
INSERT INTO `commset_sysdictitem` VALUES ('28', '4', '备份任务管理', '0000', 'fa fa-tasks', '10');
INSERT INTO `commset_sysdictitem` VALUES ('9', 'ORACLE', 'ORACLE', '0000', '', '4');
INSERT INTO `commset_sysdictitem` VALUES ('10', 'MSSQL', 'MSSQL', '0000', '', '4');
INSERT INTO `commset_sysdictitem` VALUES ('11', 'MYSQL', 'MYSQL', '0000', '', '4');
INSERT INTO `commset_sysdictitem` VALUES ('12', 'Y', '是', '0000', '', '5');
INSERT INTO `commset_sysdictitem` VALUES ('13', 'N', '否', '0000', '', '5');
INSERT INTO `commset_sysdictitem` VALUES ('14', 'RAR', '使用RAR压缩', '0000', '', '6');
INSERT INTO `commset_sysdictitem` VALUES ('15', 'ZIP', '使用zip压缩', '0000', '', '6');
INSERT INTO `commset_sysdictitem` VALUES ('16', 'TAR', '使用TAR压缩', '0000', '', '6');
INSERT INTO `commset_sysdictitem` VALUES ('17', 'Y', '允许处理', '0000', '', '7');
INSERT INTO `commset_sysdictitem` VALUES ('18', 'N', '暂停处理', '0000', '', '7');
INSERT INTO `commset_sysdictitem` VALUES ('19', 'Y', '需要', '0000', '', '8');
INSERT INTO `commset_sysdictitem` VALUES ('20', 'N', '不需要', '0000', '', '8');
INSERT INTO `commset_sysdictitem` VALUES ('21', '1', '可见', '0000', '', '9');
INSERT INTO `commset_sysdictitem` VALUES ('22', '2', '可修改', '0000', '', '9');
INSERT INTO `commset_sysdictitem` VALUES ('23', '3', '可删除', '0000', '', '9');
INSERT INTO `commset_sysdictitem` VALUES ('24', '0', '隐藏', '0000', '', '9');
INSERT INTO `commset_sysdictitem` VALUES ('25', '1', '全局参数', '0000', '', '10');
INSERT INTO `commset_sysdictitem` VALUES ('26', '2', '系统管理', '0000', 'fa fa-cogs', '10');
INSERT INTO `commset_sysdictitem` VALUES ('27', '3', 'IP地址管理', '0000', 'fa fa-sitemap', '10');
INSERT INTO `commset_sysdictitem` VALUES ('32', '2', '暂不处理', '0000', '', '11');
INSERT INTO `commset_sysdictitem` VALUES ('33', '3', '账户系统已处理', '0000', '', '11');

-- ----------------------------
-- Table structure for commset_sysdictname
-- ----------------------------
DROP TABLE IF EXISTS `commset_sysdictname`;
CREATE TABLE `commset_sysdictname` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dict_en_name` varchar(16) DEFAULT NULL,
  `dict_name` varchar(128) DEFAULT NULL,
  `dict_proc_flag` varchar(4) DEFAULT NULL,
  `dict_cls` varchar(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of commset_sysdictname
-- ----------------------------
INSERT INTO `commset_sysdictname` VALUES ('1', 'SEX', '性别', '3', '1');
INSERT INTO `commset_sysdictname` VALUES ('11', 'INSERT_ORG_FLAG', '新增机构处理标志', '3', '5');
INSERT INTO `commset_sysdictname` VALUES ('4', 'DB_TYPE', '数据库类型', '3', '4');
INSERT INTO `commset_sysdictname` VALUES ('5', 'IS_COMPRE', '是否压缩', '3', '4');
INSERT INTO `commset_sysdictname` VALUES ('6', 'COMPRE_TYPE', '压缩方式', '3', '4');
INSERT INTO `commset_sysdictname` VALUES ('7', 'PROC_FLAG', '可处理标识', '3', '1');
INSERT INTO `commset_sysdictname` VALUES ('8', 'IS_COMPRE_PASSED', '压缩是否需要密码', '3', '4');
INSERT INTO `commset_sysdictname` VALUES ('9', 'OPER_TYPE', '操作类型', '3', '1');
INSERT INTO `commset_sysdictname` VALUES ('10', 'MODEL_CLS', '模块分类', '3', '1');

-- ----------------------------
-- Table structure for commset_sysparam
-- ----------------------------
DROP TABLE IF EXISTS `commset_sysparam`;
CREATE TABLE `commset_sysparam` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `param_en_name` varchar(32) NOT NULL,
  `param_name` varchar(128) NOT NULL,
  `param_value` varchar(128) NOT NULL,
  `param_type` varchar(8) NOT NULL,
  `param_cls` varchar(2) NOT NULL,
  `param_status` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of commset_sysparam
-- ----------------------------
INSERT INTO `commset_sysparam` VALUES ('1', 'SYS_NAME', '系统名称', '业务支持管理系统', '3', '1', 'Y');
INSERT INTO `commset_sysparam` VALUES ('2', 'FOOT_INFO', '页尾版权信息', '© SlovEnt 提供技术支持', '3', '1', 'Y');

-- ----------------------------
-- Table structure for commset_userprofile
-- ----------------------------
DROP TABLE IF EXISTS `commset_userprofile`;
CREATE TABLE `commset_userprofile` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime NOT NULL,
  `user_id` int(11) NOT NULL,
  `role_id` varchar(11) NOT NULL,
  `sex` varchar(8) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of commset_userprofile
-- ----------------------------
INSERT INTO `commset_userprofile` VALUES ('1', 'pbkdf2_sha256$100000$BOW6I3hbk3D3$BGKdnhBjbYhYwGPkqFEIo45zR8kYmdjLiOTj097OlLg=', '2018-03-26 12:36:51', '1', 'admin', '', '', 'slovent@163.com', '1', '1', '2018-03-25 18:34:00', '0', '1', '0');
INSERT INTO `commset_userprofile` VALUES ('2', 'pbkdf2_sha256$100000$wQ5iOmgzU64a$VXk8TypLM3La7U8tEGweK5Tga4sk5+//leoQ9rGerVw=', '2018-03-26 00:08:04', '0', 'ywzc', '业务支持管理员', '', '', '1', '1', '2018-03-25 23:41:00', '0', '无', '0');

-- ----------------------------
-- Table structure for commset_userprofile_groups
-- ----------------------------
DROP TABLE IF EXISTS `commset_userprofile_groups`;
CREATE TABLE `commset_userprofile_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userprofile_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `commset_userprofile_groups_userprofile_id_group_id_edfec25d_uniq` (`userprofile_id`,`group_id`),
  KEY `commset_userprofile_groups_userprofile_id_fb491a3b` (`userprofile_id`),
  KEY `commset_userprofile_groups_group_id_599c8667` (`group_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of commset_userprofile_groups
-- ----------------------------
INSERT INTO `commset_userprofile_groups` VALUES ('1', '2', '1');

-- ----------------------------
-- Table structure for commset_userprofile_user_permissions
-- ----------------------------
DROP TABLE IF EXISTS `commset_userprofile_user_permissions`;
CREATE TABLE `commset_userprofile_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userprofile_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `commset_userprofile_user_userprofile_id_permissio_21797204_uniq` (`userprofile_id`,`permission_id`),
  KEY `commset_userprofile_user_permissions_userprofile_id_98fde9d2` (`userprofile_id`),
  KEY `commset_userprofile_user_permissions_permission_id_342028cf` (`permission_id`)
) ENGINE=MyISAM AUTO_INCREMENT=32 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of commset_userprofile_user_permissions
-- ----------------------------
INSERT INTO `commset_userprofile_user_permissions` VALUES ('1', '2', '32');
INSERT INTO `commset_userprofile_user_permissions` VALUES ('2', '2', '4');
INSERT INTO `commset_userprofile_user_permissions` VALUES ('20', '2', '69');
INSERT INTO `commset_userprofile_user_permissions` VALUES ('19', '2', '98');
INSERT INTO `commset_userprofile_user_permissions` VALUES ('18', '2', '99');
INSERT INTO `commset_userprofile_user_permissions` VALUES ('17', '2', '66');
INSERT INTO `commset_userprofile_user_permissions` VALUES ('16', '2', '97');
INSERT INTO `commset_userprofile_user_permissions` VALUES ('15', '2', '96');
INSERT INTO `commset_userprofile_user_permissions` VALUES ('9', '2', '11');
INSERT INTO `commset_userprofile_user_permissions` VALUES ('10', '2', '12');
INSERT INTO `commset_userprofile_user_permissions` VALUES ('11', '2', '58');
INSERT INTO `commset_userprofile_user_permissions` VALUES ('12', '2', '60');
INSERT INTO `commset_userprofile_user_permissions` VALUES ('13', '2', '30');
INSERT INTO `commset_userprofile_user_permissions` VALUES ('14', '2', '31');
INSERT INTO `commset_userprofile_user_permissions` VALUES ('21', '2', '101');
INSERT INTO `commset_userprofile_user_permissions` VALUES ('22', '2', '102');
INSERT INTO `commset_userprofile_user_permissions` VALUES ('23', '2', '64');
INSERT INTO `commset_userprofile_user_permissions` VALUES ('24', '2', '103');
INSERT INTO `commset_userprofile_user_permissions` VALUES ('25', '2', '100');
INSERT INTO `commset_userprofile_user_permissions` VALUES ('26', '2', '78');
INSERT INTO `commset_userprofile_user_permissions` VALUES ('27', '2', '81');
INSERT INTO `commset_userprofile_user_permissions` VALUES ('28', '2', '87');
INSERT INTO `commset_userprofile_user_permissions` VALUES ('29', '2', '90');
INSERT INTO `commset_userprofile_user_permissions` VALUES ('30', '2', '93');
INSERT INTO `commset_userprofile_user_permissions` VALUES ('31', '2', '95');

-- ----------------------------
-- Table structure for django_admin_log
-- ----------------------------
DROP TABLE IF EXISTS `django_admin_log`;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of django_admin_log
-- ----------------------------

-- ----------------------------
-- Table structure for django_content_type
-- ----------------------------
DROP TABLE IF EXISTS `django_content_type`;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=MyISAM AUTO_INCREMENT=33 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of django_content_type
-- ----------------------------
INSERT INTO `django_content_type` VALUES ('1', 'admin', 'logentry');
INSERT INTO `django_content_type` VALUES ('2', 'auth', 'group');
INSERT INTO `django_content_type` VALUES ('3', 'auth', 'permission');
INSERT INTO `django_content_type` VALUES ('4', 'contenttypes', 'contenttype');
INSERT INTO `django_content_type` VALUES ('5', 'sessions', 'session');
INSERT INTO `django_content_type` VALUES ('6', 'commset', 'sysdictitem');
INSERT INTO `django_content_type` VALUES ('7', 'commset', 'sysdictname');
INSERT INTO `django_content_type` VALUES ('8', 'commset', 'userprofile');
INSERT INTO `django_content_type` VALUES ('9', 'xadmin', 'log');
INSERT INTO `django_content_type` VALUES ('10', 'xadmin', 'usersettings');
INSERT INTO `django_content_type` VALUES ('11', 'xadmin', 'bookmark');
INSERT INTO `django_content_type` VALUES ('12', 'xadmin', 'userwidget');
INSERT INTO `django_content_type` VALUES ('13', 'commset', 'usergroup');
INSERT INTO `django_content_type` VALUES ('14', 'commset', 'groupadmin');
INSERT INTO `django_content_type` VALUES ('15', 'netmget', 'ipmanage');
INSERT INTO `django_content_type` VALUES ('16', 'netmget', 'ywzctestipmanage');
INSERT INTO `django_content_type` VALUES ('17', 'netmget', 'test169netmanage');
INSERT INTO `django_content_type` VALUES ('18', 'netmget', 'net9manage');
INSERT INTO `django_content_type` VALUES ('19', 'netmget', 'net12manage');
INSERT INTO `django_content_type` VALUES ('20', 'netmget', 'net2manage');
INSERT INTO `django_content_type` VALUES ('21', 'netmget', 'test168netmanage');
INSERT INTO `django_content_type` VALUES ('22', 'netmget', 'net5manage');
INSERT INTO `django_content_type` VALUES ('23', 'netmget', 'test171netmanage');
INSERT INTO `django_content_type` VALUES ('24', 'netmget', 'net10manage');
INSERT INTO `django_content_type` VALUES ('25', 'netmget', 'net16manage');
INSERT INTO `django_content_type` VALUES ('26', 'netmget', 'test170netmanage');
INSERT INTO `django_content_type` VALUES ('27', 'netmget', 'net91manage');
INSERT INTO `django_content_type` VALUES ('28', 'backtaskmget', 'dbbacktaskset');
INSERT INTO `django_content_type` VALUES ('29', 'backtaskmget', 'dbbacktasklog');
INSERT INTO `django_content_type` VALUES ('30', 'commset', 'sysparam');
INSERT INTO `django_content_type` VALUES ('31', 'insbusi', 'inserneworginfo');
INSERT INTO `django_content_type` VALUES ('32', 'insbusi', 'inserneworginfolog');

-- ----------------------------
-- Table structure for django_migrations
-- ----------------------------
DROP TABLE IF EXISTS `django_migrations`;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=41 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of django_migrations
-- ----------------------------
INSERT INTO `django_migrations` VALUES ('1', 'contenttypes', '0001_initial', '2018-03-25 18:31:39');
INSERT INTO `django_migrations` VALUES ('2', 'contenttypes', '0002_remove_content_type_name', '2018-03-25 18:31:39');
INSERT INTO `django_migrations` VALUES ('3', 'auth', '0001_initial', '2018-03-25 18:31:40');
INSERT INTO `django_migrations` VALUES ('4', 'auth', '0002_alter_permission_name_max_length', '2018-03-25 18:31:40');
INSERT INTO `django_migrations` VALUES ('5', 'auth', '0003_alter_user_email_max_length', '2018-03-25 18:31:40');
INSERT INTO `django_migrations` VALUES ('6', 'auth', '0004_alter_user_username_opts', '2018-03-25 18:31:40');
INSERT INTO `django_migrations` VALUES ('7', 'auth', '0005_alter_user_last_login_null', '2018-03-25 18:31:40');
INSERT INTO `django_migrations` VALUES ('8', 'auth', '0006_require_contenttypes_0002', '2018-03-25 18:31:40');
INSERT INTO `django_migrations` VALUES ('9', 'auth', '0007_alter_validators_add_error_messages', '2018-03-25 18:31:40');
INSERT INTO `django_migrations` VALUES ('10', 'auth', '0008_alter_user_username_max_length', '2018-03-25 18:31:40');
INSERT INTO `django_migrations` VALUES ('11', 'auth', '0009_alter_user_last_name_max_length', '2018-03-25 18:31:40');
INSERT INTO `django_migrations` VALUES ('12', 'commset', '0001_initial', '2018-03-25 18:31:40');
INSERT INTO `django_migrations` VALUES ('13', 'admin', '0001_initial', '2018-03-25 18:31:40');
INSERT INTO `django_migrations` VALUES ('14', 'admin', '0002_logentry_remove_auto_add', '2018-03-25 18:31:40');
INSERT INTO `django_migrations` VALUES ('15', 'sessions', '0001_initial', '2018-03-25 18:31:40');
INSERT INTO `django_migrations` VALUES ('16', 'xadmin', '0001_initial', '2018-03-25 18:31:40');
INSERT INTO `django_migrations` VALUES ('17', 'xadmin', '0002_log', '2018-03-25 18:31:40');
INSERT INTO `django_migrations` VALUES ('18', 'xadmin', '0003_auto_20160715_0100', '2018-03-25 18:31:40');
INSERT INTO `django_migrations` VALUES ('19', 'commset', '0002_sysdictname_dict_en_name', '2018-03-25 18:39:51');
INSERT INTO `django_migrations` VALUES ('21', 'commset', '0003_auto_20180325_2143', '2018-03-25 21:43:05');
INSERT INTO `django_migrations` VALUES ('22', 'commset', '0004_auto_20180325_2211', '2018-03-25 22:11:54');
INSERT INTO `django_migrations` VALUES ('23', 'netmget', '0001_initial', '2018-03-25 22:30:33');
INSERT INTO `django_migrations` VALUES ('24', 'netmget', '0002_auto_20180326_0006', '2018-03-26 00:06:44');
INSERT INTO `django_migrations` VALUES ('25', 'backtaskmget', '0001_initial', '2018-03-26 13:19:56');
INSERT INTO `django_migrations` VALUES ('26', 'backtaskmget', '0002_auto_20180326_1319', '2018-03-26 13:19:57');
INSERT INTO `django_migrations` VALUES ('27', 'netmget', '0003_net91manage', '2018-03-26 13:19:57');
INSERT INTO `django_migrations` VALUES ('28', 'backtaskmget', '0003_auto_20180326_1412', '2018-03-26 14:13:06');
INSERT INTO `django_migrations` VALUES ('29', 'backtaskmget', '0004_auto_20180326_1425', '2018-03-26 14:26:26');
INSERT INTO `django_migrations` VALUES ('30', 'backtaskmget', '0005_auto_20180326_1426', '2018-03-26 14:26:39');
INSERT INTO `django_migrations` VALUES ('31', 'backtaskmget', '0006_auto_20180326_1524', '2018-03-26 15:24:08');
INSERT INTO `django_migrations` VALUES ('32', 'backtaskmget', '0007_auto_20180326_1547', '2018-03-26 15:48:05');
INSERT INTO `django_migrations` VALUES ('33', 'backtaskmget', '0008_auto_20180326_2029', '2018-03-26 20:29:44');
INSERT INTO `django_migrations` VALUES ('34', 'commset', '0005_auto_20180326_2029', '2018-03-26 20:29:44');
INSERT INTO `django_migrations` VALUES ('35', 'commset', '0006_auto_20180326_2040', '2018-03-26 20:40:10');
INSERT INTO `django_migrations` VALUES ('36', 'commset', '0007_auto_20180327_1101', '2018-03-27 11:01:25');
INSERT INTO `django_migrations` VALUES ('37', 'insbusi', '0001_initial', '2018-03-27 11:01:25');
INSERT INTO `django_migrations` VALUES ('38', 'insbusi', '0002_auto_20180327_1112', '2018-03-27 11:12:48');
INSERT INTO `django_migrations` VALUES ('39', 'insbusi', '0003_auto_20180327_1256', '2018-03-27 12:56:50');
INSERT INTO `django_migrations` VALUES ('40', 'insbusi', '0004_remove_inserneworginfolog_insert_org_flag', '2018-03-27 12:56:50');

-- ----------------------------
-- Table structure for django_session
-- ----------------------------
DROP TABLE IF EXISTS `django_session`;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of django_session
-- ----------------------------
INSERT INTO `django_session` VALUES ('chyqrtu1caltzh0a8dphc2va1m18zaux', 'MWIyNjRhYjRlMmIzMmQ1NGVhNWQ5M2EwZTk2NzMzMDhiYThlMzkzOTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiTElTVF9RVUVSWSI6W1sibmV0bWdldCIsIm5ldDEwbWFuYWdlIl0sIiJdLCJfYXV0aF91c2VyX2hhc2giOiIyYzUwODVlZDE5OGJhNjY1NGQyNmRjMmRjMTVmZTY4NmNmZTc3YTQ4IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQifQ==', '2018-04-10 07:43:08');
INSERT INTO `django_session` VALUES ('drflapb1im2l9ac8mfxc06jlff0owg7u', 'NWM5N2Y1YmRlZTRiMTI2OWVhOTZmM2FmY2U0ZTNhYmFkMmJhMTFhZjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIyYzUwODVlZDE5OGJhNjY1NGQyNmRjMmRjMTVmZTY4NmNmZTc3YTQ4IiwiTElTVF9RVUVSWSI6W1siaW5zYnVzaSIsImluc2VybmV3b3JnaW5mbyJdLCIiXX0=', '2018-04-10 12:45:28');
INSERT INTO `django_session` VALUES ('bvxgl9wqcipxzcirqdf1epvxtdy611vd', 'NjBmZGEzYzAwMWVlMjI0ZTNiYzMzYzRlNTZmMTFjOGE2NjI3MDk5NTp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiMmM1MDg1ZWQxOThiYTY2NTRkMjZkYzJkYzE1ZmU2ODZjZmU3N2E0OCIsIkxJU1RfUVVFUlkiOltbIm5ldG1nZXQiLCJuZXQ1bWFuYWdlIl0sIiJdLCJfYXV0aF91c2VyX2lkIjoiMSJ9', '2018-04-09 12:37:02');

-- ----------------------------
-- Table structure for insbusi_inserneworginfo
-- ----------------------------
DROP TABLE IF EXISTS `insbusi_inserneworginfo`;
CREATE TABLE `insbusi_inserneworginfo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `insert_org_flag` varchar(1) NOT NULL,
  `org_code` varchar(8) NOT NULL,
  `org_name` varchar(64) NOT NULL,
  `org_fname` varchar(64) NOT NULL,
  `area_code` varchar(8) NOT NULL,
  `post_code` varchar(16) NOT NULL,
  `address` varchar(255) NOT NULL,
  `tel` varchar(16) NOT NULL,
  `sfc_code` varchar(8) NOT NULL,
  `sse_code` varchar(8) NOT NULL,
  `sza_ic` varchar(4) NOT NULL,
  `sza_unit` varchar(8) NOT NULL,
  `sza_trd_interval` varchar(32) NOT NULL,
  `szb_trd_interval` varchar(32) NOT NULL,
  `sta_trd_interval` varchar(32) NOT NULL,
  `szhk_trd_interval` varchar(32) NOT NULL,
  `sha_ic` varchar(4) NOT NULL,
  `sha_unit` varchar(8) NOT NULL,
  `sha_trd_interval` varchar(32) NOT NULL,
  `shb_trd_interval` varchar(32) NOT NULL,
  `central_org` varchar(8) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of insbusi_inserneworginfo
-- ----------------------------
INSERT INTO `insbusi_inserneworginfo` VALUES ('1', '0', '0169', '阿斯顿飞健康路', '奥斯卡积分卡是阿斯顿飞就爱神的箭', '0551', '230001', '是大家付款了sad会计法啊三大块计略府爱神的箭', '0', '1211212', '12123', '12', '12121', '1212121212-15465156456', '1212121212-15465156456', '1212121212-15465156456', '1212121212-15465156456', 'lk', '12541', '1212121212-15465156456', '1212121212-15465156456', '124');

-- ----------------------------
-- Table structure for insbusi_inserneworginfolog
-- ----------------------------
DROP TABLE IF EXISTS `insbusi_inserneworginfolog`;
CREATE TABLE `insbusi_inserneworginfolog` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `oper_sys` varchar(32) NOT NULL,
  `insert_datetime` datetime NOT NULL,
  `log_txt` blob NOT NULL,
  `org_code_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `insbusi_inserneworginfolog_org_code_id_f5d340b8` (`org_code_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of insbusi_inserneworginfolog
-- ----------------------------

-- ----------------------------
-- Table structure for netmget_ipmanage
-- ----------------------------
DROP TABLE IF EXISTS `netmget_ipmanage`;
CREATE TABLE `netmget_ipmanage` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ip_addr` char(39) NOT NULL,
  `net_tags` char(39) NOT NULL,
  `sub_mask` char(39) NOT NULL,
  `gateway` char(39) NOT NULL,
  `use_object` varchar(255) NOT NULL,
  `remark` longtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3111 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of netmget_ipmanage
-- ----------------------------
INSERT INTO `netmget_ipmanage` VALUES ('1', '10.0.10.1', '10.0.10.0', '255.255.255.0', '10.0.10.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2', '10.0.10.2', '10.0.10.0', '255.255.255.0', '10.0.10.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('3', '10.0.16.126', '10.0.16.64', '255.255.255.192', '10.0.16.126', '默认网关地址', '');
INSERT INTO `netmget_ipmanage` VALUES ('4', '10.0.16.124', '10.0.16.64', '255.255.255.192', '10.0.16.126', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('5', '10.0.16.125', '10.0.16.64', '255.255.255.192', '10.0.16.126', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('6', '10.0.16.123', '10.0.16.64', '255.255.255.192', '10.0.16.126', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('7', '10.0.16.121', '10.0.16.64', '255.255.255.192', '10.0.16.126', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('8', '10.0.16.122', '10.0.16.64', '255.255.255.192', '10.0.16.126', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('9', '10.0.16.120', '10.0.16.64', '255.255.255.192', '10.0.16.126', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('10', '10.0.16.118', '10.0.16.64', '255.255.255.192', '10.0.16.126', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('11', '10.0.16.119', '10.0.16.64', '255.255.255.192', '10.0.16.126', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('12', '10.0.16.117', '10.0.16.64', '255.255.255.192', '10.0.16.126', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('13', '10.0.16.115', '10.0.16.64', '255.255.255.192', '10.0.16.126', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('14', '10.0.16.116', '10.0.16.64', '255.255.255.192', '10.0.16.126', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('15', '10.0.16.114', '10.0.16.64', '255.255.255.192', '10.0.16.126', '1', '');
INSERT INTO `netmget_ipmanage` VALUES ('16', '10.0.16.112', '10.0.16.64', '255.255.255.192', '10.0.16.126', '1', '');
INSERT INTO `netmget_ipmanage` VALUES ('17', '10.0.16.113', '10.0.16.64', '255.255.255.192', '10.0.16.126', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('18', '10.0.16.111', '10.0.16.64', '255.255.255.192', '10.0.16.126', '1', '');
INSERT INTO `netmget_ipmanage` VALUES ('19', '10.0.16.109', '10.0.16.64', '255.255.255.192', '10.0.16.126', '1', '');
INSERT INTO `netmget_ipmanage` VALUES ('20', '10.0.16.110', '10.0.16.64', '255.255.255.192', '10.0.16.126', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('21', '10.0.16.108', '10.0.16.64', '255.255.255.192', '10.0.16.126', '1', '');
INSERT INTO `netmget_ipmanage` VALUES ('22', '10.0.16.107', '10.0.16.64', '255.255.255.192', '10.0.16.126', '1', '');
INSERT INTO `netmget_ipmanage` VALUES ('23', '10.0.16.106', '10.0.16.64', '255.255.255.192', '10.0.16.126', '1', '');
INSERT INTO `netmget_ipmanage` VALUES ('24', '10.0.16.105', '10.0.16.64', '255.255.255.192', '10.0.16.126', '1', '');
INSERT INTO `netmget_ipmanage` VALUES ('25', '10.0.16.104', '10.0.16.64', '255.255.255.192', '10.0.16.126', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('26', '10.0.16.103', '10.0.16.64', '255.255.255.192', '10.0.16.126', '1', '');
INSERT INTO `netmget_ipmanage` VALUES ('27', '10.0.16.102', '10.0.16.64', '255.255.255.192', '10.0.16.126', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('28', '10.0.16.101', '10.0.16.64', '255.255.255.192', '10.0.16.126', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('29', '10.0.16.100', '10.0.16.64', '255.255.255.192', '10.0.16.126', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('30', '10.0.16.99', '10.0.16.64', '255.255.255.192', '10.0.16.126', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('31', '10.0.16.98', '10.0.16.64', '255.255.255.192', '10.0.16.126', '1', '');
INSERT INTO `netmget_ipmanage` VALUES ('32', '10.0.16.97', '10.0.16.64', '255.255.255.192', '10.0.16.126', '1', '');
INSERT INTO `netmget_ipmanage` VALUES ('33', '10.0.16.96', '10.0.16.64', '255.255.255.192', '10.0.16.126', '1', '');
INSERT INTO `netmget_ipmanage` VALUES ('34', '10.0.16.95', '10.0.16.64', '255.255.255.192', '10.0.16.126', '1', '');
INSERT INTO `netmget_ipmanage` VALUES ('35', '10.0.16.94', '10.0.16.64', '255.255.255.192', '10.0.16.126', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('36', '10.0.16.93', '10.0.16.64', '255.255.255.192', '10.0.16.126', '1', '');
INSERT INTO `netmget_ipmanage` VALUES ('37', '10.0.16.92', '10.0.16.64', '255.255.255.192', '10.0.16.126', '1', '');
INSERT INTO `netmget_ipmanage` VALUES ('38', '10.0.16.91', '10.0.16.64', '255.255.255.192', '10.0.16.126', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('39', '10.0.16.90', '10.0.16.64', '255.255.255.192', '10.0.16.126', '1', '');
INSERT INTO `netmget_ipmanage` VALUES ('40', '10.0.16.89', '10.0.16.64', '255.255.255.192', '10.0.16.126', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('41', '10.0.16.88', '10.0.16.64', '255.255.255.192', '10.0.16.126', '1', '');
INSERT INTO `netmget_ipmanage` VALUES ('42', '10.0.16.87', '10.0.16.64', '255.255.255.192', '10.0.16.126', '1', '');
INSERT INTO `netmget_ipmanage` VALUES ('43', '10.0.16.86', '10.0.16.64', '255.255.255.192', '10.0.16.126', '1', '');
INSERT INTO `netmget_ipmanage` VALUES ('44', '10.0.16.85', '10.0.16.64', '255.255.255.192', '10.0.16.126', '1', '');
INSERT INTO `netmget_ipmanage` VALUES ('45', '10.0.16.84', '10.0.16.64', '255.255.255.192', '10.0.16.126', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('46', '10.0.16.83', '10.0.16.64', '255.255.255.192', '10.0.16.126', '1', '');
INSERT INTO `netmget_ipmanage` VALUES ('47', '10.0.16.82', '10.0.16.64', '255.255.255.192', '10.0.16.126', '1', '');
INSERT INTO `netmget_ipmanage` VALUES ('48', '10.0.16.81', '10.0.16.64', '255.255.255.192', '10.0.16.126', '1', '');
INSERT INTO `netmget_ipmanage` VALUES ('49', '10.0.16.80', '10.0.16.64', '255.255.255.192', '10.0.16.126', '1', '');
INSERT INTO `netmget_ipmanage` VALUES ('50', '10.0.16.79', '10.0.16.64', '255.255.255.192', '10.0.16.126', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('51', '10.0.16.78', '10.0.16.64', '255.255.255.192', '10.0.16.126', '1', '');
INSERT INTO `netmget_ipmanage` VALUES ('52', '10.0.16.77', '10.0.16.64', '255.255.255.192', '10.0.16.126', '1', '');
INSERT INTO `netmget_ipmanage` VALUES ('53', '10.0.16.76', '10.0.16.64', '255.255.255.192', '10.0.16.126', '1', '');
INSERT INTO `netmget_ipmanage` VALUES ('54', '10.0.16.75', '10.0.16.64', '255.255.255.192', '10.0.16.126', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('55', '10.0.16.74', '10.0.16.64', '255.255.255.192', '10.0.16.126', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('56', '10.0.16.73', '10.0.16.64', '255.255.255.192', '10.0.16.126', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('57', '10.0.16.72', '10.0.16.64', '255.255.255.192', '10.0.16.126', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('58', '10.0.16.71', '10.0.16.64', '255.255.255.192', '10.0.16.126', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('59', '10.0.16.70', '10.0.16.64', '255.255.255.192', '10.0.16.126', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('60', '10.0.16.69', '10.0.16.64', '255.255.255.192', '10.0.16.126', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('61', '10.0.16.68', '10.0.16.64', '255.255.255.192', '10.0.16.126', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('62', '10.0.16.67', '10.0.16.64', '255.255.255.192', '10.0.16.126', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('63', '10.0.16.66', '10.0.16.64', '255.255.255.192', '10.0.16.126', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('64', '10.0.16.65', '10.0.16.64', '255.255.255.192', '10.0.16.126', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('65', '10.0.10.3', '10.0.10.0', '255.255.255.0', '10.0.10.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('66', '10.0.10.4', '10.0.10.0', '255.255.255.0', '10.0.10.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('67', '10.0.10.5', '10.0.10.0', '255.255.255.0', '10.0.10.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('68', '10.0.10.6', '10.0.10.0', '255.255.255.0', '10.0.10.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('69', '10.0.10.7', '10.0.10.0', '255.255.255.0', '10.0.10.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('70', '10.0.10.8', '10.0.10.0', '255.255.255.0', '10.0.10.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('71', '10.0.10.9', '10.0.10.0', '255.255.255.0', '10.0.10.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('72', '10.0.10.10', '10.0.10.0', '255.255.255.0', '10.0.10.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('73', '10.0.10.11', '10.0.10.0', '255.255.255.0', '10.0.10.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('74', '10.0.10.12', '10.0.10.0', '255.255.255.0', '10.0.10.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('75', '10.0.10.13', '10.0.10.0', '255.255.255.0', '10.0.10.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('76', '10.0.10.14', '10.0.10.0', '255.255.255.0', '10.0.10.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('77', '10.0.10.15', '10.0.10.0', '255.255.255.0', '10.0.10.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('78', '10.0.10.16', '10.0.10.0', '255.255.255.0', '10.0.10.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('79', '10.0.10.17', '10.0.10.0', '255.255.255.0', '10.0.10.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('80', '10.0.10.18', '10.0.10.0', '255.255.255.0', '10.0.10.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('81', '10.0.10.19', '10.0.10.0', '255.255.255.0', '10.0.10.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('82', '10.0.10.20', '10.0.10.0', '255.255.255.0', '10.0.10.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('83', '10.0.10.21', '10.0.10.0', '255.255.255.0', '10.0.10.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('84', '10.0.10.22', '10.0.10.0', '255.255.255.0', '10.0.10.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('85', '10.0.10.23', '10.0.10.0', '255.255.255.0', '10.0.10.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('86', '10.0.10.24', '10.0.10.0', '255.255.255.0', '10.0.10.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('87', '10.0.10.25', '10.0.10.0', '255.255.255.0', '10.0.10.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('88', '10.0.10.26', '10.0.10.0', '255.255.255.0', '10.0.10.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('89', '10.0.10.27', '10.0.10.0', '255.255.255.0', '10.0.10.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('90', '10.0.10.28', '10.0.10.0', '255.255.255.0', '10.0.10.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('91', '10.0.10.29', '10.0.10.0', '255.255.255.0', '10.0.10.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('92', '10.0.10.30', '10.0.10.0', '255.255.255.0', '10.0.10.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('93', '10.0.10.31', '10.0.10.0', '255.255.255.0', '10.0.10.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('94', '10.0.10.32', '10.0.10.0', '255.255.255.0', '10.0.10.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('95', '10.0.10.33', '10.0.10.0', '255.255.255.0', '10.0.10.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('96', '10.0.10.34', '10.0.10.0', '255.255.255.0', '10.0.10.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('97', '10.0.10.35', '10.0.10.0', '255.255.255.0', '10.0.10.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('98', '10.0.10.36', '10.0.10.0', '255.255.255.0', '10.0.10.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('99', '10.0.10.37', '10.0.10.0', '255.255.255.0', '10.0.10.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('100', '10.0.10.38', '10.0.10.0', '255.255.255.0', '10.0.10.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('101', '10.0.10.39', '10.0.10.0', '255.255.255.0', '10.0.10.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('102', '10.0.10.40', '10.0.10.0', '255.255.255.0', '10.0.10.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('103', '10.0.10.41', '10.0.10.0', '255.255.255.0', '10.0.10.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('104', '10.0.10.42', '10.0.10.0', '255.255.255.0', '10.0.10.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('105', '10.0.10.43', '10.0.10.0', '255.255.255.0', '10.0.10.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('106', '10.0.10.44', '10.0.10.0', '255.255.255.0', '10.0.10.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('107', '10.0.10.45', '10.0.10.0', '255.255.255.0', '10.0.10.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('108', '10.0.10.46', '10.0.10.0', '255.255.255.0', '10.0.10.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('109', '10.0.10.47', '10.0.10.0', '255.255.255.0', '10.0.10.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('110', '10.0.10.48', '10.0.10.0', '255.255.255.0', '10.0.10.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('111', '10.0.10.49', '10.0.10.0', '255.255.255.0', '10.0.10.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('112', '10.0.10.50', '10.0.10.0', '255.255.255.0', '10.0.10.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('113', '10.0.10.51', '10.0.10.0', '255.255.255.0', '10.0.10.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('114', '10.0.10.52', '10.0.10.0', '255.255.255.0', '10.0.10.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('115', '10.0.10.53', '10.0.10.0', '255.255.255.0', '10.0.10.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('116', '10.0.10.54', '10.0.10.0', '255.255.255.0', '10.0.10.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('117', '10.0.10.55', '10.0.10.0', '255.255.255.0', '10.0.10.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('118', '10.0.10.56', '10.0.10.0', '255.255.255.0', '10.0.10.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('119', '10.0.10.57', '10.0.10.0', '255.255.255.0', '10.0.10.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('120', '10.0.10.58', '10.0.10.0', '255.255.255.0', '10.0.10.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('121', '10.0.10.59', '10.0.10.0', '255.255.255.0', '10.0.10.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('122', '10.0.10.60', '10.0.10.0', '255.255.255.0', '10.0.10.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('123', '10.0.10.61', '10.0.10.0', '255.255.255.0', '10.0.10.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('124', '10.0.10.62', '10.0.10.0', '255.255.255.0', '10.0.10.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('125', '10.0.10.63', '10.0.10.0', '255.255.255.0', '10.0.10.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('126', '10.0.10.64', '10.0.10.0', '255.255.255.0', '10.0.10.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('127', '10.0.10.65', '10.0.10.0', '255.255.255.0', '10.0.10.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('128', '10.0.10.66', '10.0.10.0', '255.255.255.0', '10.0.10.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('129', '10.0.10.67', '10.0.10.0', '255.255.255.0', '10.0.10.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('130', '10.0.10.68', '10.0.10.0', '255.255.255.0', '10.0.10.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('131', '10.0.10.69', '10.0.10.0', '255.255.255.0', '10.0.10.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('132', '10.0.10.70', '10.0.10.0', '255.255.255.0', '10.0.10.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('133', '10.0.10.71', '10.0.10.0', '255.255.255.0', '10.0.10.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('134', '10.0.10.72', '10.0.10.0', '255.255.255.0', '10.0.10.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('135', '10.0.10.73', '10.0.10.0', '255.255.255.0', '10.0.10.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('136', '10.0.10.74', '10.0.10.0', '255.255.255.0', '10.0.10.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('137', '10.0.10.75', '10.0.10.0', '255.255.255.0', '10.0.10.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('138', '10.0.10.76', '10.0.10.0', '255.255.255.0', '10.0.10.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('139', '10.0.10.77', '10.0.10.0', '255.255.255.0', '10.0.10.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('140', '10.0.10.78', '10.0.10.0', '255.255.255.0', '10.0.10.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('141', '10.0.10.79', '10.0.10.0', '255.255.255.0', '10.0.10.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('142', '10.0.10.80', '10.0.10.0', '255.255.255.0', '10.0.10.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('143', '10.0.10.81', '10.0.10.0', '255.255.255.0', '10.0.10.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('144', '10.0.10.82', '10.0.10.0', '255.255.255.0', '10.0.10.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('145', '10.0.10.83', '10.0.10.0', '255.255.255.0', '10.0.10.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('146', '10.0.10.84', '10.0.10.0', '255.255.255.0', '10.0.10.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('147', '10.0.10.85', '10.0.10.0', '255.255.255.0', '10.0.10.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('148', '10.0.10.86', '10.0.10.0', '255.255.255.0', '10.0.10.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('149', '10.0.10.87', '10.0.10.0', '255.255.255.0', '10.0.10.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('150', '10.0.10.88', '10.0.10.0', '255.255.255.0', '10.0.10.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('151', '10.0.10.89', '10.0.10.0', '255.255.255.0', '10.0.10.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('152', '10.0.10.90', '10.0.10.0', '255.255.255.0', '10.0.10.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('153', '10.0.10.91', '10.0.10.0', '255.255.255.0', '10.0.10.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('154', '10.0.10.92', '10.0.10.0', '255.255.255.0', '10.0.10.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('155', '10.0.10.93', '10.0.10.0', '255.255.255.0', '10.0.10.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('156', '10.0.10.94', '10.0.10.0', '255.255.255.0', '10.0.10.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('157', '10.0.10.95', '10.0.10.0', '255.255.255.0', '10.0.10.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('158', '10.0.10.96', '10.0.10.0', '255.255.255.0', '10.0.10.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('159', '10.0.10.97', '10.0.10.0', '255.255.255.0', '10.0.10.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('160', '10.0.10.98', '10.0.10.0', '255.255.255.0', '10.0.10.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('161', '10.0.10.99', '10.0.10.0', '255.255.255.0', '10.0.10.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('162', '10.0.10.100', '10.0.10.0', '255.255.255.0', '10.0.10.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('163', '10.0.10.101', '10.0.10.0', '255.255.255.0', '10.0.10.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('164', '10.0.10.102', '10.0.10.0', '255.255.255.0', '10.0.10.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('165', '10.0.10.103', '10.0.10.0', '255.255.255.0', '10.0.10.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('166', '10.0.10.104', '10.0.10.0', '255.255.255.0', '10.0.10.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('167', '10.0.10.105', '10.0.10.0', '255.255.255.0', '10.0.10.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('168', '10.0.10.106', '10.0.10.0', '255.255.255.0', '10.0.10.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('169', '10.0.10.107', '10.0.10.0', '255.255.255.0', '10.0.10.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('170', '10.0.10.108', '10.0.10.0', '255.255.255.0', '10.0.10.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('171', '10.0.10.109', '10.0.10.0', '255.255.255.0', '10.0.10.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('172', '10.0.10.110', '10.0.10.0', '255.255.255.0', '10.0.10.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('173', '10.0.10.111', '10.0.10.0', '255.255.255.0', '10.0.10.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('174', '10.0.10.112', '10.0.10.0', '255.255.255.0', '10.0.10.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('175', '10.0.10.113', '10.0.10.0', '255.255.255.0', '10.0.10.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('176', '10.0.10.114', '10.0.10.0', '255.255.255.0', '10.0.10.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('177', '10.0.10.115', '10.0.10.0', '255.255.255.0', '10.0.10.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('178', '10.0.10.116', '10.0.10.0', '255.255.255.0', '10.0.10.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('179', '10.0.10.117', '10.0.10.0', '255.255.255.0', '10.0.10.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('180', '10.0.10.118', '10.0.10.0', '255.255.255.0', '10.0.10.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('181', '10.0.10.119', '10.0.10.0', '255.255.255.0', '10.0.10.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('182', '10.0.10.120', '10.0.10.0', '255.255.255.0', '10.0.10.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('183', '10.0.10.121', '10.0.10.0', '255.255.255.0', '10.0.10.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('184', '10.0.10.122', '10.0.10.0', '255.255.255.0', '10.0.10.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('185', '10.0.10.123', '10.0.10.0', '255.255.255.0', '10.0.10.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('186', '10.0.10.124', '10.0.10.0', '255.255.255.0', '10.0.10.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('187', '10.0.10.125', '10.0.10.0', '255.255.255.0', '10.0.10.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('188', '10.0.10.126', '10.0.10.0', '255.255.255.0', '10.0.10.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('189', '10.0.10.127', '10.0.10.0', '255.255.255.0', '10.0.10.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('190', '10.0.10.128', '10.0.10.0', '255.255.255.0', '10.0.10.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('191', '10.0.10.129', '10.0.10.0', '255.255.255.0', '10.0.10.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('192', '10.0.10.130', '10.0.10.0', '255.255.255.0', '10.0.10.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('193', '10.0.10.131', '10.0.10.0', '255.255.255.0', '10.0.10.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('194', '10.0.10.132', '10.0.10.0', '255.255.255.0', '10.0.10.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('195', '10.0.10.133', '10.0.10.0', '255.255.255.0', '10.0.10.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('196', '10.0.10.134', '10.0.10.0', '255.255.255.0', '10.0.10.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('197', '10.0.10.135', '10.0.10.0', '255.255.255.0', '10.0.10.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('198', '10.0.10.136', '10.0.10.0', '255.255.255.0', '10.0.10.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('199', '10.0.10.137', '10.0.10.0', '255.255.255.0', '10.0.10.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('200', '10.0.10.138', '10.0.10.0', '255.255.255.0', '10.0.10.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('201', '10.0.10.139', '10.0.10.0', '255.255.255.0', '10.0.10.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('202', '10.0.10.140', '10.0.10.0', '255.255.255.0', '10.0.10.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('203', '10.0.10.141', '10.0.10.0', '255.255.255.0', '10.0.10.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('204', '10.0.10.142', '10.0.10.0', '255.255.255.0', '10.0.10.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('205', '10.0.10.143', '10.0.10.0', '255.255.255.0', '10.0.10.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('206', '10.0.10.144', '10.0.10.0', '255.255.255.0', '10.0.10.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('207', '10.0.10.145', '10.0.10.0', '255.255.255.0', '10.0.10.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('208', '10.0.10.146', '10.0.10.0', '255.255.255.0', '10.0.10.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('209', '10.0.10.147', '10.0.10.0', '255.255.255.0', '10.0.10.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('210', '10.0.10.148', '10.0.10.0', '255.255.255.0', '10.0.10.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('211', '10.0.10.149', '10.0.10.0', '255.255.255.0', '10.0.10.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('212', '10.0.10.150', '10.0.10.0', '255.255.255.0', '10.0.10.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('213', '10.0.10.151', '10.0.10.0', '255.255.255.0', '10.0.10.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('214', '10.0.10.152', '10.0.10.0', '255.255.255.0', '10.0.10.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('215', '10.0.10.153', '10.0.10.0', '255.255.255.0', '10.0.10.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('216', '10.0.10.154', '10.0.10.0', '255.255.255.0', '10.0.10.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('217', '10.0.10.155', '10.0.10.0', '255.255.255.0', '10.0.10.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('218', '10.0.10.156', '10.0.10.0', '255.255.255.0', '10.0.10.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('219', '10.0.10.157', '10.0.10.0', '255.255.255.0', '10.0.10.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('220', '10.0.10.158', '10.0.10.0', '255.255.255.0', '10.0.10.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('221', '10.0.10.159', '10.0.10.0', '255.255.255.0', '10.0.10.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('222', '10.0.10.160', '10.0.10.0', '255.255.255.0', '10.0.10.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('223', '10.0.10.161', '10.0.10.0', '255.255.255.0', '10.0.10.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('224', '10.0.10.162', '10.0.10.0', '255.255.255.0', '10.0.10.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('225', '10.0.10.163', '10.0.10.0', '255.255.255.0', '10.0.10.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('226', '10.0.10.164', '10.0.10.0', '255.255.255.0', '10.0.10.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('227', '10.0.10.165', '10.0.10.0', '255.255.255.0', '10.0.10.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('228', '10.0.10.166', '10.0.10.0', '255.255.255.0', '10.0.10.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('229', '10.0.10.167', '10.0.10.0', '255.255.255.0', '10.0.10.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('230', '10.0.10.168', '10.0.10.0', '255.255.255.0', '10.0.10.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('231', '10.0.10.169', '10.0.10.0', '255.255.255.0', '10.0.10.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('232', '10.0.10.170', '10.0.10.0', '255.255.255.0', '10.0.10.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('233', '10.0.10.171', '10.0.10.0', '255.255.255.0', '10.0.10.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('234', '10.0.10.172', '10.0.10.0', '255.255.255.0', '10.0.10.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('235', '10.0.10.173', '10.0.10.0', '255.255.255.0', '10.0.10.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('236', '10.0.10.174', '10.0.10.0', '255.255.255.0', '10.0.10.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('237', '10.0.10.175', '10.0.10.0', '255.255.255.0', '10.0.10.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('238', '10.0.10.176', '10.0.10.0', '255.255.255.0', '10.0.10.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('239', '10.0.10.177', '10.0.10.0', '255.255.255.0', '10.0.10.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('240', '10.0.10.178', '10.0.10.0', '255.255.255.0', '10.0.10.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('241', '10.0.10.179', '10.0.10.0', '255.255.255.0', '10.0.10.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('242', '10.0.10.180', '10.0.10.0', '255.255.255.0', '10.0.10.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('243', '10.0.10.181', '10.0.10.0', '255.255.255.0', '10.0.10.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('244', '10.0.10.182', '10.0.10.0', '255.255.255.0', '10.0.10.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('245', '10.0.10.183', '10.0.10.0', '255.255.255.0', '10.0.10.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('246', '10.0.10.184', '10.0.10.0', '255.255.255.0', '10.0.10.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('247', '10.0.10.185', '10.0.10.0', '255.255.255.0', '10.0.10.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('248', '10.0.10.186', '10.0.10.0', '255.255.255.0', '10.0.10.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('249', '10.0.10.187', '10.0.10.0', '255.255.255.0', '10.0.10.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('250', '10.0.10.188', '10.0.10.0', '255.255.255.0', '10.0.10.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('251', '10.0.10.189', '10.0.10.0', '255.255.255.0', '10.0.10.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('252', '10.0.10.190', '10.0.10.0', '255.255.255.0', '10.0.10.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('253', '10.0.10.191', '10.0.10.0', '255.255.255.0', '10.0.10.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('254', '10.0.10.192', '10.0.10.0', '255.255.255.0', '10.0.10.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('255', '10.0.10.193', '10.0.10.0', '255.255.255.0', '10.0.10.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('256', '10.0.10.194', '10.0.10.0', '255.255.255.0', '10.0.10.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('257', '10.0.10.195', '10.0.10.0', '255.255.255.0', '10.0.10.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('258', '10.0.10.196', '10.0.10.0', '255.255.255.0', '10.0.10.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('259', '10.0.10.197', '10.0.10.0', '255.255.255.0', '10.0.10.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('260', '10.0.10.198', '10.0.10.0', '255.255.255.0', '10.0.10.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('261', '10.0.10.199', '10.0.10.0', '255.255.255.0', '10.0.10.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('262', '10.0.10.200', '10.0.10.0', '255.255.255.0', '10.0.10.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('263', '10.0.10.201', '10.0.10.0', '255.255.255.0', '10.0.10.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('264', '10.0.10.202', '10.0.10.0', '255.255.255.0', '10.0.10.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('265', '10.0.10.203', '10.0.10.0', '255.255.255.0', '10.0.10.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('266', '10.0.10.204', '10.0.10.0', '255.255.255.0', '10.0.10.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('267', '10.0.10.205', '10.0.10.0', '255.255.255.0', '10.0.10.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('268', '10.0.10.206', '10.0.10.0', '255.255.255.0', '10.0.10.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('269', '10.0.10.207', '10.0.10.0', '255.255.255.0', '10.0.10.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('270', '10.0.10.208', '10.0.10.0', '255.255.255.0', '10.0.10.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('271', '10.0.10.209', '10.0.10.0', '255.255.255.0', '10.0.10.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('272', '10.0.10.210', '10.0.10.0', '255.255.255.0', '10.0.10.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('273', '10.0.10.211', '10.0.10.0', '255.255.255.0', '10.0.10.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('274', '10.0.10.212', '10.0.10.0', '255.255.255.0', '10.0.10.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('275', '10.0.10.213', '10.0.10.0', '255.255.255.0', '10.0.10.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('276', '10.0.10.214', '10.0.10.0', '255.255.255.0', '10.0.10.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('277', '10.0.10.215', '10.0.10.0', '255.255.255.0', '10.0.10.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('278', '10.0.10.216', '10.0.10.0', '255.255.255.0', '10.0.10.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('279', '10.0.10.217', '10.0.10.0', '255.255.255.0', '10.0.10.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('280', '10.0.10.218', '10.0.10.0', '255.255.255.0', '10.0.10.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('281', '10.0.10.219', '10.0.10.0', '255.255.255.0', '10.0.10.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('282', '10.0.10.220', '10.0.10.0', '255.255.255.0', '10.0.10.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('283', '10.0.10.221', '10.0.10.0', '255.255.255.0', '10.0.10.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('284', '10.0.10.222', '10.0.10.0', '255.255.255.0', '10.0.10.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('285', '10.0.10.223', '10.0.10.0', '255.255.255.0', '10.0.10.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('286', '10.0.10.224', '10.0.10.0', '255.255.255.0', '10.0.10.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('287', '10.0.10.225', '10.0.10.0', '255.255.255.0', '10.0.10.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('288', '10.0.10.226', '10.0.10.0', '255.255.255.0', '10.0.10.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('289', '10.0.10.227', '10.0.10.0', '255.255.255.0', '10.0.10.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('290', '10.0.10.228', '10.0.10.0', '255.255.255.0', '10.0.10.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('291', '10.0.10.229', '10.0.10.0', '255.255.255.0', '10.0.10.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('292', '10.0.10.230', '10.0.10.0', '255.255.255.0', '10.0.10.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('293', '10.0.10.231', '10.0.10.0', '255.255.255.0', '10.0.10.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('294', '10.0.10.232', '10.0.10.0', '255.255.255.0', '10.0.10.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('295', '10.0.10.233', '10.0.10.0', '255.255.255.0', '10.0.10.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('296', '10.0.10.234', '10.0.10.0', '255.255.255.0', '10.0.10.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('297', '10.0.10.235', '10.0.10.0', '255.255.255.0', '10.0.10.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('298', '10.0.10.236', '10.0.10.0', '255.255.255.0', '10.0.10.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('299', '10.0.10.237', '10.0.10.0', '255.255.255.0', '10.0.10.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('300', '10.0.10.238', '10.0.10.0', '255.255.255.0', '10.0.10.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('301', '10.0.10.239', '10.0.10.0', '255.255.255.0', '10.0.10.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('302', '10.0.10.240', '10.0.10.0', '255.255.255.0', '10.0.10.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('303', '10.0.10.241', '10.0.10.0', '255.255.255.0', '10.0.10.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('304', '10.0.10.242', '10.0.10.0', '255.255.255.0', '10.0.10.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('305', '10.0.10.243', '10.0.10.0', '255.255.255.0', '10.0.10.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('306', '10.0.10.244', '10.0.10.0', '255.255.255.0', '10.0.10.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('307', '10.0.10.245', '10.0.10.0', '255.255.255.0', '10.0.10.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('308', '10.0.10.246', '10.0.10.0', '255.255.255.0', '10.0.10.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('309', '10.0.10.247', '10.0.10.0', '255.255.255.0', '10.0.10.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('310', '10.0.10.248', '10.0.10.0', '255.255.255.0', '10.0.10.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('311', '10.0.10.249', '10.0.10.0', '255.255.255.0', '10.0.10.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('312', '10.0.10.250', '10.0.10.0', '255.255.255.0', '10.0.10.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('313', '10.0.10.251', '10.0.10.0', '255.255.255.0', '10.0.10.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('314', '10.0.10.252', '10.0.10.0', '255.255.255.0', '10.0.10.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('315', '10.0.10.253', '10.0.10.0', '255.255.255.0', '10.0.10.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('316', '10.0.10.254', '10.0.10.0', '255.255.255.0', '10.0.10.254', '默认网关地址', '');
INSERT INTO `netmget_ipmanage` VALUES ('317', '192.168.168.254', '192.168.168.0', '255.255.255.0', '192.168.168.1', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('318', '192.168.168.253', '192.168.168.0', '255.255.255.0', '192.168.168.1', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('319', '192.168.168.252', '192.168.168.0', '255.255.255.0', '192.168.168.1', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('320', '192.168.168.251', '192.168.168.0', '255.255.255.0', '192.168.168.1', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('321', '192.168.168.250', '192.168.168.0', '255.255.255.0', '192.168.168.1', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('322', '192.168.168.249', '192.168.168.0', '255.255.255.0', '192.168.168.1', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('323', '192.168.168.248', '192.168.168.0', '255.255.255.0', '192.168.168.1', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('324', '192.168.168.247', '192.168.168.0', '255.255.255.0', '192.168.168.1', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('325', '192.168.168.246', '192.168.168.0', '255.255.255.0', '192.168.168.1', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('326', '192.168.168.245', '192.168.168.0', '255.255.255.0', '192.168.168.1', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('327', '192.168.168.244', '192.168.168.0', '255.255.255.0', '192.168.168.1', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('328', '192.168.168.243', '192.168.168.0', '255.255.255.0', '192.168.168.1', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('329', '192.168.168.242', '192.168.168.0', '255.255.255.0', '192.168.168.1', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('330', '192.168.168.241', '192.168.168.0', '255.255.255.0', '192.168.168.1', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('331', '192.168.168.240', '192.168.168.0', '255.255.255.0', '192.168.168.1', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('332', '192.168.168.239', '192.168.168.0', '255.255.255.0', '192.168.168.1', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('333', '192.168.168.238', '192.168.168.0', '255.255.255.0', '192.168.168.1', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('334', '192.168.168.237', '192.168.168.0', '255.255.255.0', '192.168.168.1', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('335', '192.168.168.236', '192.168.168.0', '255.255.255.0', '192.168.168.1', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('336', '192.168.168.235', '192.168.168.0', '255.255.255.0', '192.168.168.1', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('337', '192.168.168.234', '192.168.168.0', '255.255.255.0', '192.168.168.1', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('338', '192.168.168.233', '192.168.168.0', '255.255.255.0', '192.168.168.1', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('339', '192.168.168.232', '192.168.168.0', '255.255.255.0', '192.168.168.1', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('340', '192.168.168.231', '192.168.168.0', '255.255.255.0', '192.168.168.1', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('341', '192.168.168.230', '192.168.168.0', '255.255.255.0', '192.168.168.1', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('342', '192.168.168.229', '192.168.168.0', '255.255.255.0', '192.168.168.1', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('343', '192.168.168.228', '192.168.168.0', '255.255.255.0', '192.168.168.1', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('344', '192.168.168.227', '192.168.168.0', '255.255.255.0', '192.168.168.1', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('345', '192.168.168.226', '192.168.168.0', '255.255.255.0', '192.168.168.1', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('346', '192.168.168.225', '192.168.168.0', '255.255.255.0', '192.168.168.1', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('347', '192.168.168.224', '192.168.168.0', '255.255.255.0', '192.168.168.1', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('348', '192.168.168.223', '192.168.168.0', '255.255.255.0', '192.168.168.1', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('349', '192.168.168.222', '192.168.168.0', '255.255.255.0', '192.168.168.1', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('350', '192.168.168.221', '192.168.168.0', '255.255.255.0', '192.168.168.1', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('351', '192.168.168.220', '192.168.168.0', '255.255.255.0', '192.168.168.1', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('352', '192.168.168.219', '192.168.168.0', '255.255.255.0', '192.168.168.1', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('353', '192.168.168.218', '192.168.168.0', '255.255.255.0', '192.168.168.1', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('354', '192.168.168.217', '192.168.168.0', '255.255.255.0', '192.168.168.1', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('355', '192.168.168.216', '192.168.168.0', '255.255.255.0', '192.168.168.1', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('356', '192.168.168.215', '192.168.168.0', '255.255.255.0', '192.168.168.1', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('357', '192.168.168.214', '192.168.168.0', '255.255.255.0', '192.168.168.1', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('358', '192.168.168.213', '192.168.168.0', '255.255.255.0', '192.168.168.1', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('359', '192.168.168.212', '192.168.168.0', '255.255.255.0', '192.168.168.1', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('360', '192.168.168.211', '192.168.168.0', '255.255.255.0', '192.168.168.1', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('361', '192.168.168.210', '192.168.168.0', '255.255.255.0', '192.168.168.1', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('362', '192.168.168.209', '192.168.168.0', '255.255.255.0', '192.168.168.1', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('363', '192.168.168.208', '192.168.168.0', '255.255.255.0', '192.168.168.1', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('364', '192.168.168.207', '192.168.168.0', '255.255.255.0', '192.168.168.1', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('365', '192.168.168.206', '192.168.168.0', '255.255.255.0', '192.168.168.1', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('366', '192.168.168.205', '192.168.168.0', '255.255.255.0', '192.168.168.1', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('367', '192.168.168.204', '192.168.168.0', '255.255.255.0', '192.168.168.1', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('368', '192.168.168.203', '192.168.168.0', '255.255.255.0', '192.168.168.1', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('369', '192.168.168.202', '192.168.168.0', '255.255.255.0', '192.168.168.1', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('370', '192.168.168.201', '192.168.168.0', '255.255.255.0', '192.168.168.1', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('371', '192.168.168.200', '192.168.168.0', '255.255.255.0', '192.168.168.1', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('372', '192.168.168.199', '192.168.168.0', '255.255.255.0', '192.168.168.1', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('373', '192.168.168.198', '192.168.168.0', '255.255.255.0', '192.168.168.1', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('374', '192.168.168.197', '192.168.168.0', '255.255.255.0', '192.168.168.1', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('375', '192.168.168.196', '192.168.168.0', '255.255.255.0', '192.168.168.1', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('376', '192.168.168.195', '192.168.168.0', '255.255.255.0', '192.168.168.1', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('377', '192.168.168.194', '192.168.168.0', '255.255.255.0', '192.168.168.1', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('378', '192.168.168.193', '192.168.168.0', '255.255.255.0', '192.168.168.1', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('379', '192.168.168.192', '192.168.168.0', '255.255.255.0', '192.168.168.1', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('380', '192.168.168.191', '192.168.168.0', '255.255.255.0', '192.168.168.1', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('381', '192.168.168.190', '192.168.168.0', '255.255.255.0', '192.168.168.1', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('382', '192.168.168.189', '192.168.168.0', '255.255.255.0', '192.168.168.1', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('383', '192.168.168.188', '192.168.168.0', '255.255.255.0', '192.168.168.1', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('384', '192.168.168.187', '192.168.168.0', '255.255.255.0', '192.168.168.1', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('385', '192.168.168.186', '192.168.168.0', '255.255.255.0', '192.168.168.1', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('386', '192.168.168.185', '192.168.168.0', '255.255.255.0', '192.168.168.1', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('387', '192.168.168.184', '192.168.168.0', '255.255.255.0', '192.168.168.1', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('388', '192.168.168.183', '192.168.168.0', '255.255.255.0', '192.168.168.1', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('389', '192.168.168.182', '192.168.168.0', '255.255.255.0', '192.168.168.1', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('390', '192.168.168.181', '192.168.168.0', '255.255.255.0', '192.168.168.1', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('391', '192.168.168.180', '192.168.168.0', '255.255.255.0', '192.168.168.1', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('392', '192.168.168.179', '192.168.168.0', '255.255.255.0', '192.168.168.1', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('393', '192.168.168.178', '192.168.168.0', '255.255.255.0', '192.168.168.1', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('394', '192.168.168.177', '192.168.168.0', '255.255.255.0', '192.168.168.1', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('395', '192.168.168.176', '192.168.168.0', '255.255.255.0', '192.168.168.1', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('396', '192.168.168.175', '192.168.168.0', '255.255.255.0', '192.168.168.1', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('397', '192.168.168.174', '192.168.168.0', '255.255.255.0', '192.168.168.1', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('398', '192.168.168.173', '192.168.168.0', '255.255.255.0', '192.168.168.1', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('399', '192.168.168.172', '192.168.168.0', '255.255.255.0', '192.168.168.1', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('400', '192.168.168.171', '192.168.168.0', '255.255.255.0', '192.168.168.1', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('401', '192.168.168.170', '192.168.168.0', '255.255.255.0', '192.168.168.1', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('402', '192.168.168.169', '192.168.168.0', '255.255.255.0', '192.168.168.1', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('403', '192.168.168.168', '192.168.168.0', '255.255.255.0', '192.168.168.1', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('404', '192.168.168.167', '192.168.168.0', '255.255.255.0', '192.168.168.1', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('405', '192.168.168.166', '192.168.168.0', '255.255.255.0', '192.168.168.1', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('406', '192.168.168.165', '192.168.168.0', '255.255.255.0', '192.168.168.1', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('407', '192.168.168.164', '192.168.168.0', '255.255.255.0', '192.168.168.1', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('408', '192.168.168.163', '192.168.168.0', '255.255.255.0', '192.168.168.1', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('409', '192.168.168.162', '192.168.168.0', '255.255.255.0', '192.168.168.1', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('410', '192.168.168.161', '192.168.168.0', '255.255.255.0', '192.168.168.1', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('411', '192.168.168.160', '192.168.168.0', '255.255.255.0', '192.168.168.1', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('412', '192.168.168.159', '192.168.168.0', '255.255.255.0', '192.168.168.1', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('413', '192.168.168.158', '192.168.168.0', '255.255.255.0', '192.168.168.1', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('414', '192.168.168.157', '192.168.168.0', '255.255.255.0', '192.168.168.1', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('415', '192.168.168.156', '192.168.168.0', '255.255.255.0', '192.168.168.1', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('416', '192.168.168.155', '192.168.168.0', '255.255.255.0', '192.168.168.1', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('417', '192.168.168.154', '192.168.168.0', '255.255.255.0', '192.168.168.1', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('418', '192.168.168.153', '192.168.168.0', '255.255.255.0', '192.168.168.1', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('419', '192.168.168.152', '192.168.168.0', '255.255.255.0', '192.168.168.1', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('420', '192.168.168.151', '192.168.168.0', '255.255.255.0', '192.168.168.1', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('421', '192.168.168.150', '192.168.168.0', '255.255.255.0', '192.168.168.1', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('422', '192.168.168.149', '192.168.168.0', '255.255.255.0', '192.168.168.1', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('423', '192.168.168.148', '192.168.168.0', '255.255.255.0', '192.168.168.1', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('424', '192.168.168.147', '192.168.168.0', '255.255.255.0', '192.168.168.1', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('425', '192.168.168.146', '192.168.168.0', '255.255.255.0', '192.168.168.1', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('426', '192.168.168.145', '192.168.168.0', '255.255.255.0', '192.168.168.1', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('427', '192.168.168.144', '192.168.168.0', '255.255.255.0', '192.168.168.1', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('428', '192.168.168.143', '192.168.168.0', '255.255.255.0', '192.168.168.1', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('429', '192.168.168.142', '192.168.168.0', '255.255.255.0', '192.168.168.1', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('430', '192.168.168.141', '192.168.168.0', '255.255.255.0', '192.168.168.1', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('431', '192.168.168.140', '192.168.168.0', '255.255.255.0', '192.168.168.1', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('432', '192.168.168.139', '192.168.168.0', '255.255.255.0', '192.168.168.1', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('433', '192.168.168.138', '192.168.168.0', '255.255.255.0', '192.168.168.1', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('434', '192.168.168.137', '192.168.168.0', '255.255.255.0', '192.168.168.1', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('435', '192.168.168.136', '192.168.168.0', '255.255.255.0', '192.168.168.1', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('436', '192.168.168.135', '192.168.168.0', '255.255.255.0', '192.168.168.1', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('437', '192.168.168.134', '192.168.168.0', '255.255.255.0', '192.168.168.1', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('438', '192.168.168.133', '192.168.168.0', '255.255.255.0', '192.168.168.1', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('439', '192.168.168.132', '192.168.168.0', '255.255.255.0', '192.168.168.1', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('440', '192.168.168.131', '192.168.168.0', '255.255.255.0', '192.168.168.1', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('441', '192.168.168.130', '192.168.168.0', '255.255.255.0', '192.168.168.1', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('442', '192.168.168.129', '192.168.168.0', '255.255.255.0', '192.168.168.1', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('443', '192.168.168.128', '192.168.168.0', '255.255.255.0', '192.168.168.1', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('444', '192.168.168.127', '192.168.168.0', '255.255.255.0', '192.168.168.1', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('445', '192.168.168.126', '192.168.168.0', '255.255.255.0', '192.168.168.1', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('446', '192.168.168.125', '192.168.168.0', '255.255.255.0', '192.168.168.1', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('447', '192.168.168.124', '192.168.168.0', '255.255.255.0', '192.168.168.1', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('448', '192.168.168.123', '192.168.168.0', '255.255.255.0', '192.168.168.1', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('449', '192.168.168.122', '192.168.168.0', '255.255.255.0', '192.168.168.1', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('450', '192.168.168.121', '192.168.168.0', '255.255.255.0', '192.168.168.1', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('451', '192.168.168.120', '192.168.168.0', '255.255.255.0', '192.168.168.1', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('452', '192.168.168.119', '192.168.168.0', '255.255.255.0', '192.168.168.1', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('453', '192.168.168.118', '192.168.168.0', '255.255.255.0', '192.168.168.1', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('454', '192.168.168.117', '192.168.168.0', '255.255.255.0', '192.168.168.1', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('455', '192.168.168.116', '192.168.168.0', '255.255.255.0', '192.168.168.1', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('456', '192.168.168.115', '192.168.168.0', '255.255.255.0', '192.168.168.1', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('457', '192.168.168.114', '192.168.168.0', '255.255.255.0', '192.168.168.1', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('458', '192.168.168.113', '192.168.168.0', '255.255.255.0', '192.168.168.1', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('459', '192.168.168.112', '192.168.168.0', '255.255.255.0', '192.168.168.1', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('460', '192.168.168.111', '192.168.168.0', '255.255.255.0', '192.168.168.1', '中登TA测试', '20180303 中登TA新接口测试\r\n已进行');
INSERT INTO `netmget_ipmanage` VALUES ('461', '192.168.168.110', '192.168.168.0', '255.255.255.0', '192.168.168.1', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('462', '192.168.168.109', '192.168.168.0', '255.255.255.0', '192.168.168.1', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('463', '192.168.168.108', '192.168.168.0', '255.255.255.0', '192.168.168.1', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('464', '192.168.168.107', '192.168.168.0', '255.255.255.0', '192.168.168.1', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('465', '192.168.168.106', '192.168.168.0', '255.255.255.0', '192.168.168.1', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('466', '192.168.168.105', '192.168.168.0', '255.255.255.0', '192.168.168.1', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('467', '192.168.168.104', '192.168.168.0', '255.255.255.0', '192.168.168.1', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('468', '192.168.168.103', '192.168.168.0', '255.255.255.0', '192.168.168.1', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('469', '192.168.168.102', '192.168.168.0', '255.255.255.0', '192.168.168.1', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('470', '192.168.168.101', '192.168.168.0', '255.255.255.0', '192.168.168.1', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('471', '192.168.168.100', '192.168.168.0', '255.255.255.0', '192.168.168.1', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('472', '192.168.168.99', '192.168.168.0', '255.255.255.0', '192.168.168.1', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('473', '192.168.168.98', '192.168.168.0', '255.255.255.0', '192.168.168.1', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('474', '192.168.168.97', '192.168.168.0', '255.255.255.0', '192.168.168.1', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('475', '192.168.168.96', '192.168.168.0', '255.255.255.0', '192.168.168.1', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('476', '192.168.168.95', '192.168.168.0', '255.255.255.0', '192.168.168.1', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('477', '192.168.168.94', '192.168.168.0', '255.255.255.0', '192.168.168.1', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('478', '192.168.168.93', '192.168.168.0', '255.255.255.0', '192.168.168.1', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('479', '192.168.168.92', '192.168.168.0', '255.255.255.0', '192.168.168.1', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('480', '192.168.168.91', '192.168.168.0', '255.255.255.0', '192.168.168.1', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('481', '192.168.168.90', '192.168.168.0', '255.255.255.0', '192.168.168.1', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('482', '192.168.168.89', '192.168.168.0', '255.255.255.0', '192.168.168.1', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('483', '192.168.168.88', '192.168.168.0', '255.255.255.0', '192.168.168.1', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('484', '192.168.168.87', '192.168.168.0', '255.255.255.0', '192.168.168.1', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('485', '192.168.168.86', '192.168.168.0', '255.255.255.0', '192.168.168.1', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('486', '192.168.168.85', '192.168.168.0', '255.255.255.0', '192.168.168.1', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('487', '192.168.168.84', '192.168.168.0', '255.255.255.0', '192.168.168.1', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('488', '192.168.168.83', '192.168.168.0', '255.255.255.0', '192.168.168.1', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('489', '192.168.168.82', '192.168.168.0', '255.255.255.0', '192.168.168.1', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('490', '192.168.168.81', '192.168.168.0', '255.255.255.0', '192.168.168.1', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('491', '192.168.168.80', '192.168.168.0', '255.255.255.0', '192.168.168.1', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('492', '192.168.168.79', '192.168.168.0', '255.255.255.0', '192.168.168.1', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('493', '192.168.168.78', '192.168.168.0', '255.255.255.0', '192.168.168.1', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('494', '192.168.168.77', '192.168.168.0', '255.255.255.0', '192.168.168.1', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('495', '192.168.168.76', '192.168.168.0', '255.255.255.0', '192.168.168.1', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('496', '192.168.168.75', '192.168.168.0', '255.255.255.0', '192.168.168.1', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('497', '192.168.168.74', '192.168.168.0', '255.255.255.0', '192.168.168.1', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('498', '192.168.168.73', '192.168.168.0', '255.255.255.0', '192.168.168.1', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('499', '192.168.168.72', '192.168.168.0', '255.255.255.0', '192.168.168.1', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('500', '192.168.168.71', '192.168.168.0', '255.255.255.0', '192.168.168.1', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('501', '192.168.168.70', '192.168.168.0', '255.255.255.0', '192.168.168.1', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('502', '192.168.168.69', '192.168.168.0', '255.255.255.0', '192.168.168.1', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('503', '192.168.168.68', '192.168.168.0', '255.255.255.0', '192.168.168.1', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('504', '192.168.168.67', '192.168.168.0', '255.255.255.0', '192.168.168.1', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('505', '192.168.168.66', '192.168.168.0', '255.255.255.0', '192.168.168.1', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('506', '192.168.168.65', '192.168.168.0', '255.255.255.0', '192.168.168.1', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('507', '192.168.168.64', '192.168.168.0', '255.255.255.0', '192.168.168.1', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('508', '192.168.168.63', '192.168.168.0', '255.255.255.0', '192.168.168.1', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('509', '192.168.168.62', '192.168.168.0', '255.255.255.0', '192.168.168.1', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('510', '192.168.168.61', '192.168.168.0', '255.255.255.0', '192.168.168.1', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('511', '192.168.168.60', '192.168.168.0', '255.255.255.0', '192.168.168.1', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('512', '192.168.168.59', '192.168.168.0', '255.255.255.0', '192.168.168.1', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('513', '192.168.168.58', '192.168.168.0', '255.255.255.0', '192.168.168.1', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('514', '192.168.168.57', '192.168.168.0', '255.255.255.0', '192.168.168.1', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('515', '192.168.168.56', '192.168.168.0', '255.255.255.0', '192.168.168.1', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('516', '192.168.168.55', '192.168.168.0', '255.255.255.0', '192.168.168.1', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('517', '192.168.168.54', '192.168.168.0', '255.255.255.0', '192.168.168.1', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('518', '192.168.168.53', '192.168.168.0', '255.255.255.0', '192.168.168.1', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('519', '192.168.168.52', '192.168.168.0', '255.255.255.0', '192.168.168.1', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('520', '192.168.168.51', '192.168.168.0', '255.255.255.0', '192.168.168.1', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('521', '192.168.168.50', '192.168.168.0', '255.255.255.0', '192.168.168.1', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('522', '192.168.168.49', '192.168.168.0', '255.255.255.0', '192.168.168.1', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('523', '192.168.168.48', '192.168.168.0', '255.255.255.0', '192.168.168.1', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('524', '192.168.168.47', '192.168.168.0', '255.255.255.0', '192.168.168.1', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('525', '192.168.168.46', '192.168.168.0', '255.255.255.0', '192.168.168.1', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('526', '192.168.168.45', '192.168.168.0', '255.255.255.0', '192.168.168.1', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('527', '192.168.168.44', '192.168.168.0', '255.255.255.0', '192.168.168.1', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('528', '192.168.168.43', '192.168.168.0', '255.255.255.0', '192.168.168.1', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('529', '192.168.168.42', '192.168.168.0', '255.255.255.0', '192.168.168.1', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('530', '192.168.168.41', '192.168.168.0', '255.255.255.0', '192.168.168.1', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('531', '192.168.168.40', '192.168.168.0', '255.255.255.0', '192.168.168.1', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('532', '192.168.168.39', '192.168.168.0', '255.255.255.0', '192.168.168.1', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('533', '192.168.168.38', '192.168.168.0', '255.255.255.0', '192.168.168.1', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('534', '192.168.168.37', '192.168.168.0', '255.255.255.0', '192.168.168.1', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('535', '192.168.168.36', '192.168.168.0', '255.255.255.0', '192.168.168.1', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('536', '192.168.168.35', '192.168.168.0', '255.255.255.0', '192.168.168.1', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('537', '192.168.168.34', '192.168.168.0', '255.255.255.0', '192.168.168.1', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('538', '192.168.168.33', '192.168.168.0', '255.255.255.0', '192.168.168.1', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('539', '192.168.168.32', '192.168.168.0', '255.255.255.0', '192.168.168.1', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('540', '192.168.168.31', '192.168.168.0', '255.255.255.0', '192.168.168.1', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('541', '192.168.168.30', '192.168.168.0', '255.255.255.0', '192.168.168.1', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('542', '192.168.168.29', '192.168.168.0', '255.255.255.0', '192.168.168.1', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('543', '192.168.168.28', '192.168.168.0', '255.255.255.0', '192.168.168.1', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('544', '192.168.168.27', '192.168.168.0', '255.255.255.0', '192.168.168.1', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('545', '192.168.168.26', '192.168.168.0', '255.255.255.0', '192.168.168.1', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('546', '192.168.168.25', '192.168.168.0', '255.255.255.0', '192.168.168.1', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('547', '192.168.168.24', '192.168.168.0', '255.255.255.0', '192.168.168.1', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('548', '192.168.168.23', '192.168.168.0', '255.255.255.0', '192.168.168.1', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('549', '192.168.168.22', '192.168.168.0', '255.255.255.0', '192.168.168.1', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('550', '192.168.168.21', '192.168.168.0', '255.255.255.0', '192.168.168.1', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('551', '192.168.168.20', '192.168.168.0', '255.255.255.0', '192.168.168.1', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('552', '192.168.168.19', '192.168.168.0', '255.255.255.0', '192.168.168.1', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('553', '192.168.168.18', '192.168.168.0', '255.255.255.0', '192.168.168.1', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('554', '192.168.168.17', '192.168.168.0', '255.255.255.0', '192.168.168.1', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('555', '192.168.168.16', '192.168.168.0', '255.255.255.0', '192.168.168.1', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('556', '192.168.168.15', '192.168.168.0', '255.255.255.0', '192.168.168.1', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('557', '192.168.168.14', '192.168.168.0', '255.255.255.0', '192.168.168.1', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('558', '192.168.168.13', '192.168.168.0', '255.255.255.0', '192.168.168.1', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('559', '192.168.168.12', '192.168.168.0', '255.255.255.0', '192.168.168.1', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('560', '192.168.168.11', '192.168.168.0', '255.255.255.0', '192.168.168.1', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('561', '192.168.168.10', '192.168.168.0', '255.255.255.0', '192.168.168.1', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('562', '192.168.168.9', '192.168.168.0', '255.255.255.0', '192.168.168.1', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('563', '192.168.168.8', '192.168.168.0', '255.255.255.0', '192.168.168.1', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('564', '192.168.168.7', '192.168.168.0', '255.255.255.0', '192.168.168.1', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('565', '192.168.168.6', '192.168.168.0', '255.255.255.0', '192.168.168.1', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('566', '192.168.168.5', '192.168.168.0', '255.255.255.0', '192.168.168.1', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('567', '192.168.168.4', '192.168.168.0', '255.255.255.0', '192.168.168.1', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('568', '192.168.168.3', '192.168.168.0', '255.255.255.0', '192.168.168.1', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('569', '192.168.168.2', '192.168.168.0', '255.255.255.0', '192.168.168.1', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('570', '192.168.168.1', '192.168.168.0', '255.255.255.0', '192.168.168.1', '默认网关地址', '');
INSERT INTO `netmget_ipmanage` VALUES ('571', '10.0.5.1', '10.0.5.0', '255.255.255.0', '10.0.5.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('572', '10.0.5.2', '10.0.5.0', '255.255.255.0', '10.0.5.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('573', '10.0.5.3', '10.0.5.0', '255.255.255.0', '10.0.5.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('574', '10.0.5.4', '10.0.5.0', '255.255.255.0', '10.0.5.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('575', '10.0.5.5', '10.0.5.0', '255.255.255.0', '10.0.5.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('576', '10.0.5.6', '10.0.5.0', '255.255.255.0', '10.0.5.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('577', '10.0.5.7', '10.0.5.0', '255.255.255.0', '10.0.5.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('578', '10.0.5.8', '10.0.5.0', '255.255.255.0', '10.0.5.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('579', '10.0.5.9', '10.0.5.0', '255.255.255.0', '10.0.5.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('580', '10.0.5.10', '10.0.5.0', '255.255.255.0', '10.0.5.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('581', '10.0.5.11', '10.0.5.0', '255.255.255.0', '10.0.5.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('582', '10.0.5.12', '10.0.5.0', '255.255.255.0', '10.0.5.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('583', '10.0.5.13', '10.0.5.0', '255.255.255.0', '10.0.5.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('584', '10.0.5.14', '10.0.5.0', '255.255.255.0', '10.0.5.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('585', '10.0.5.15', '10.0.5.0', '255.255.255.0', '10.0.5.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('586', '10.0.5.16', '10.0.5.0', '255.255.255.0', '10.0.5.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('587', '10.0.5.17', '10.0.5.0', '255.255.255.0', '10.0.5.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('588', '10.0.5.18', '10.0.5.0', '255.255.255.0', '10.0.5.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('589', '10.0.5.19', '10.0.5.0', '255.255.255.0', '10.0.5.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('590', '10.0.5.20', '10.0.5.0', '255.255.255.0', '10.0.5.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('591', '10.0.5.21', '10.0.5.0', '255.255.255.0', '10.0.5.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('592', '10.0.5.22', '10.0.5.0', '255.255.255.0', '10.0.5.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('593', '10.0.5.23', '10.0.5.0', '255.255.255.0', '10.0.5.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('594', '10.0.5.24', '10.0.5.0', '255.255.255.0', '10.0.5.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('595', '10.0.5.25', '10.0.5.0', '255.255.255.0', '10.0.5.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('596', '10.0.5.26', '10.0.5.0', '255.255.255.0', '10.0.5.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('597', '10.0.5.27', '10.0.5.0', '255.255.255.0', '10.0.5.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('598', '10.0.5.28', '10.0.5.0', '255.255.255.0', '10.0.5.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('599', '10.0.5.29', '10.0.5.0', '255.255.255.0', '10.0.5.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('600', '10.0.5.30', '10.0.5.0', '255.255.255.0', '10.0.5.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('601', '10.0.5.31', '10.0.5.0', '255.255.255.0', '10.0.5.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('602', '10.0.5.32', '10.0.5.0', '255.255.255.0', '10.0.5.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('603', '10.0.5.33', '10.0.5.0', '255.255.255.0', '10.0.5.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('604', '10.0.5.34', '10.0.5.0', '255.255.255.0', '10.0.5.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('605', '10.0.5.35', '10.0.5.0', '255.255.255.0', '10.0.5.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('606', '10.0.5.36', '10.0.5.0', '255.255.255.0', '10.0.5.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('607', '10.0.5.37', '10.0.5.0', '255.255.255.0', '10.0.5.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('608', '10.0.5.38', '10.0.5.0', '255.255.255.0', '10.0.5.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('609', '10.0.5.39', '10.0.5.0', '255.255.255.0', '10.0.5.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('610', '10.0.5.40', '10.0.5.0', '255.255.255.0', '10.0.5.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('611', '10.0.5.41', '10.0.5.0', '255.255.255.0', '10.0.5.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('612', '10.0.5.42', '10.0.5.0', '255.255.255.0', '10.0.5.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('613', '10.0.5.43', '10.0.5.0', '255.255.255.0', '10.0.5.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('614', '10.0.5.44', '10.0.5.0', '255.255.255.0', '10.0.5.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('615', '10.0.5.45', '10.0.5.0', '255.255.255.0', '10.0.5.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('616', '10.0.5.46', '10.0.5.0', '255.255.255.0', '10.0.5.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('617', '10.0.5.47', '10.0.5.0', '255.255.255.0', '10.0.5.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('618', '10.0.5.48', '10.0.5.0', '255.255.255.0', '10.0.5.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('619', '10.0.5.49', '10.0.5.0', '255.255.255.0', '10.0.5.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('620', '10.0.5.50', '10.0.5.0', '255.255.255.0', '10.0.5.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('621', '10.0.5.51', '10.0.5.0', '255.255.255.0', '10.0.5.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('622', '10.0.5.52', '10.0.5.0', '255.255.255.0', '10.0.5.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('623', '10.0.5.53', '10.0.5.0', '255.255.255.0', '10.0.5.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('624', '10.0.5.54', '10.0.5.0', '255.255.255.0', '10.0.5.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('625', '10.0.5.55', '10.0.5.0', '255.255.255.0', '10.0.5.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('626', '10.0.5.56', '10.0.5.0', '255.255.255.0', '10.0.5.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('627', '10.0.5.57', '10.0.5.0', '255.255.255.0', '10.0.5.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('628', '10.0.5.58', '10.0.5.0', '255.255.255.0', '10.0.5.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('629', '10.0.5.59', '10.0.5.0', '255.255.255.0', '10.0.5.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('630', '10.0.5.60', '10.0.5.0', '255.255.255.0', '10.0.5.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('631', '10.0.5.61', '10.0.5.0', '255.255.255.0', '10.0.5.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('632', '10.0.5.62', '10.0.5.0', '255.255.255.0', '10.0.5.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('633', '10.0.5.63', '10.0.5.0', '255.255.255.0', '10.0.5.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('634', '10.0.5.64', '10.0.5.0', '255.255.255.0', '10.0.5.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('635', '10.0.5.65', '10.0.5.0', '255.255.255.0', '10.0.5.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('636', '10.0.5.66', '10.0.5.0', '255.255.255.0', '10.0.5.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('637', '10.0.5.67', '10.0.5.0', '255.255.255.0', '10.0.5.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('638', '10.0.5.68', '10.0.5.0', '255.255.255.0', '10.0.5.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('639', '10.0.5.69', '10.0.5.0', '255.255.255.0', '10.0.5.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('640', '10.0.5.70', '10.0.5.0', '255.255.255.0', '10.0.5.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('641', '10.0.5.71', '10.0.5.0', '255.255.255.0', '10.0.5.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('642', '10.0.5.72', '10.0.5.0', '255.255.255.0', '10.0.5.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('643', '10.0.5.73', '10.0.5.0', '255.255.255.0', '10.0.5.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('644', '10.0.5.74', '10.0.5.0', '255.255.255.0', '10.0.5.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('645', '10.0.5.75', '10.0.5.0', '255.255.255.0', '10.0.5.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('646', '10.0.5.76', '10.0.5.0', '255.255.255.0', '10.0.5.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('647', '10.0.5.77', '10.0.5.0', '255.255.255.0', '10.0.5.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('648', '10.0.5.78', '10.0.5.0', '255.255.255.0', '10.0.5.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('649', '10.0.5.79', '10.0.5.0', '255.255.255.0', '10.0.5.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('650', '10.0.5.80', '10.0.5.0', '255.255.255.0', '10.0.5.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('651', '10.0.5.81', '10.0.5.0', '255.255.255.0', '10.0.5.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('652', '10.0.5.82', '10.0.5.0', '255.255.255.0', '10.0.5.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('653', '10.0.5.83', '10.0.5.0', '255.255.255.0', '10.0.5.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('654', '10.0.5.84', '10.0.5.0', '255.255.255.0', '10.0.5.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('655', '10.0.5.85', '10.0.5.0', '255.255.255.0', '10.0.5.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('656', '10.0.5.86', '10.0.5.0', '255.255.255.0', '10.0.5.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('657', '10.0.5.87', '10.0.5.0', '255.255.255.0', '10.0.5.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('658', '10.0.5.88', '10.0.5.0', '255.255.255.0', '10.0.5.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('659', '10.0.5.89', '10.0.5.0', '255.255.255.0', '10.0.5.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('660', '10.0.5.90', '10.0.5.0', '255.255.255.0', '10.0.5.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('661', '10.0.5.91', '10.0.5.0', '255.255.255.0', '10.0.5.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('662', '10.0.5.92', '10.0.5.0', '255.255.255.0', '10.0.5.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('663', '10.0.5.93', '10.0.5.0', '255.255.255.0', '10.0.5.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('664', '10.0.5.94', '10.0.5.0', '255.255.255.0', '10.0.5.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('665', '10.0.5.95', '10.0.5.0', '255.255.255.0', '10.0.5.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('666', '10.0.5.96', '10.0.5.0', '255.255.255.0', '10.0.5.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('667', '10.0.5.97', '10.0.5.0', '255.255.255.0', '10.0.5.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('668', '10.0.5.98', '10.0.5.0', '255.255.255.0', '10.0.5.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('669', '10.0.5.99', '10.0.5.0', '255.255.255.0', '10.0.5.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('670', '10.0.5.100', '10.0.5.0', '255.255.255.0', '10.0.5.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('671', '10.0.5.101', '10.0.5.0', '255.255.255.0', '10.0.5.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('672', '10.0.5.102', '10.0.5.0', '255.255.255.0', '10.0.5.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('673', '10.0.5.103', '10.0.5.0', '255.255.255.0', '10.0.5.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('674', '10.0.5.104', '10.0.5.0', '255.255.255.0', '10.0.5.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('675', '10.0.5.105', '10.0.5.0', '255.255.255.0', '10.0.5.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('676', '10.0.5.106', '10.0.5.0', '255.255.255.0', '10.0.5.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('677', '10.0.5.107', '10.0.5.0', '255.255.255.0', '10.0.5.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('678', '10.0.5.108', '10.0.5.0', '255.255.255.0', '10.0.5.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('679', '10.0.5.109', '10.0.5.0', '255.255.255.0', '10.0.5.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('680', '10.0.5.110', '10.0.5.0', '255.255.255.0', '10.0.5.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('681', '10.0.5.111', '10.0.5.0', '255.255.255.0', '10.0.5.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('682', '10.0.5.112', '10.0.5.0', '255.255.255.0', '10.0.5.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('683', '10.0.5.113', '10.0.5.0', '255.255.255.0', '10.0.5.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('684', '10.0.5.114', '10.0.5.0', '255.255.255.0', '10.0.5.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('685', '10.0.5.115', '10.0.5.0', '255.255.255.0', '10.0.5.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('686', '10.0.5.116', '10.0.5.0', '255.255.255.0', '10.0.5.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('687', '10.0.5.117', '10.0.5.0', '255.255.255.0', '10.0.5.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('688', '10.0.5.118', '10.0.5.0', '255.255.255.0', '10.0.5.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('689', '10.0.5.119', '10.0.5.0', '255.255.255.0', '10.0.5.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('690', '10.0.5.120', '10.0.5.0', '255.255.255.0', '10.0.5.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('691', '10.0.5.121', '10.0.5.0', '255.255.255.0', '10.0.5.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('692', '10.0.5.122', '10.0.5.0', '255.255.255.0', '10.0.5.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('693', '10.0.5.123', '10.0.5.0', '255.255.255.0', '10.0.5.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('694', '10.0.5.124', '10.0.5.0', '255.255.255.0', '10.0.5.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('695', '10.0.5.125', '10.0.5.0', '255.255.255.0', '10.0.5.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('696', '10.0.5.126', '10.0.5.0', '255.255.255.0', '10.0.5.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('697', '10.0.5.127', '10.0.5.0', '255.255.255.0', '10.0.5.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('698', '10.0.5.128', '10.0.5.0', '255.255.255.0', '10.0.5.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('699', '10.0.5.129', '10.0.5.0', '255.255.255.0', '10.0.5.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('700', '10.0.5.130', '10.0.5.0', '255.255.255.0', '10.0.5.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('701', '10.0.5.131', '10.0.5.0', '255.255.255.0', '10.0.5.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('702', '10.0.5.132', '10.0.5.0', '255.255.255.0', '10.0.5.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('703', '10.0.5.133', '10.0.5.0', '255.255.255.0', '10.0.5.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('704', '10.0.5.134', '10.0.5.0', '255.255.255.0', '10.0.5.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('705', '10.0.5.135', '10.0.5.0', '255.255.255.0', '10.0.5.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('706', '10.0.5.136', '10.0.5.0', '255.255.255.0', '10.0.5.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('707', '10.0.5.137', '10.0.5.0', '255.255.255.0', '10.0.5.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('708', '10.0.5.138', '10.0.5.0', '255.255.255.0', '10.0.5.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('709', '10.0.5.139', '10.0.5.0', '255.255.255.0', '10.0.5.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('710', '10.0.5.140', '10.0.5.0', '255.255.255.0', '10.0.5.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('711', '10.0.5.141', '10.0.5.0', '255.255.255.0', '10.0.5.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('712', '10.0.5.142', '10.0.5.0', '255.255.255.0', '10.0.5.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('713', '10.0.5.143', '10.0.5.0', '255.255.255.0', '10.0.5.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('714', '10.0.5.144', '10.0.5.0', '255.255.255.0', '10.0.5.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('715', '10.0.5.145', '10.0.5.0', '255.255.255.0', '10.0.5.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('716', '10.0.5.146', '10.0.5.0', '255.255.255.0', '10.0.5.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('717', '10.0.5.147', '10.0.5.0', '255.255.255.0', '10.0.5.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('718', '10.0.5.148', '10.0.5.0', '255.255.255.0', '10.0.5.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('719', '10.0.5.149', '10.0.5.0', '255.255.255.0', '10.0.5.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('720', '10.0.5.150', '10.0.5.0', '255.255.255.0', '10.0.5.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('721', '10.0.5.151', '10.0.5.0', '255.255.255.0', '10.0.5.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('722', '10.0.5.152', '10.0.5.0', '255.255.255.0', '10.0.5.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('723', '10.0.5.153', '10.0.5.0', '255.255.255.0', '10.0.5.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('724', '10.0.5.154', '10.0.5.0', '255.255.255.0', '10.0.5.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('725', '10.0.5.155', '10.0.5.0', '255.255.255.0', '10.0.5.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('726', '10.0.5.156', '10.0.5.0', '255.255.255.0', '10.0.5.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('727', '10.0.5.157', '10.0.5.0', '255.255.255.0', '10.0.5.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('728', '10.0.5.158', '10.0.5.0', '255.255.255.0', '10.0.5.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('729', '10.0.5.159', '10.0.5.0', '255.255.255.0', '10.0.5.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('730', '10.0.5.160', '10.0.5.0', '255.255.255.0', '10.0.5.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('731', '10.0.5.161', '10.0.5.0', '255.255.255.0', '10.0.5.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('732', '10.0.5.162', '10.0.5.0', '255.255.255.0', '10.0.5.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('733', '10.0.5.163', '10.0.5.0', '255.255.255.0', '10.0.5.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('734', '10.0.5.164', '10.0.5.0', '255.255.255.0', '10.0.5.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('735', '10.0.5.165', '10.0.5.0', '255.255.255.0', '10.0.5.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('736', '10.0.5.166', '10.0.5.0', '255.255.255.0', '10.0.5.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('737', '10.0.5.167', '10.0.5.0', '255.255.255.0', '10.0.5.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('738', '10.0.5.168', '10.0.5.0', '255.255.255.0', '10.0.5.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('739', '10.0.5.169', '10.0.5.0', '255.255.255.0', '10.0.5.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('740', '10.0.5.170', '10.0.5.0', '255.255.255.0', '10.0.5.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('741', '10.0.5.171', '10.0.5.0', '255.255.255.0', '10.0.5.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('742', '10.0.5.172', '10.0.5.0', '255.255.255.0', '10.0.5.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('743', '10.0.5.173', '10.0.5.0', '255.255.255.0', '10.0.5.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('744', '10.0.5.174', '10.0.5.0', '255.255.255.0', '10.0.5.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('745', '10.0.5.175', '10.0.5.0', '255.255.255.0', '10.0.5.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('746', '10.0.5.176', '10.0.5.0', '255.255.255.0', '10.0.5.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('747', '10.0.5.177', '10.0.5.0', '255.255.255.0', '10.0.5.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('748', '10.0.5.178', '10.0.5.0', '255.255.255.0', '10.0.5.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('749', '10.0.5.179', '10.0.5.0', '255.255.255.0', '10.0.5.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('750', '10.0.5.180', '10.0.5.0', '255.255.255.0', '10.0.5.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('751', '10.0.5.181', '10.0.5.0', '255.255.255.0', '10.0.5.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('752', '10.0.5.182', '10.0.5.0', '255.255.255.0', '10.0.5.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('753', '10.0.5.183', '10.0.5.0', '255.255.255.0', '10.0.5.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('754', '10.0.5.184', '10.0.5.0', '255.255.255.0', '10.0.5.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('755', '10.0.5.185', '10.0.5.0', '255.255.255.0', '10.0.5.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('756', '10.0.5.186', '10.0.5.0', '255.255.255.0', '10.0.5.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('757', '10.0.5.187', '10.0.5.0', '255.255.255.0', '10.0.5.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('758', '10.0.5.188', '10.0.5.0', '255.255.255.0', '10.0.5.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('759', '10.0.5.189', '10.0.5.0', '255.255.255.0', '10.0.5.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('760', '10.0.5.190', '10.0.5.0', '255.255.255.0', '10.0.5.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('761', '10.0.5.191', '10.0.5.0', '255.255.255.0', '10.0.5.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('762', '10.0.5.192', '10.0.5.0', '255.255.255.0', '10.0.5.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('763', '10.0.5.193', '10.0.5.0', '255.255.255.0', '10.0.5.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('764', '10.0.5.194', '10.0.5.0', '255.255.255.0', '10.0.5.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('765', '10.0.5.195', '10.0.5.0', '255.255.255.0', '10.0.5.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('766', '10.0.5.196', '10.0.5.0', '255.255.255.0', '10.0.5.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('767', '10.0.5.197', '10.0.5.0', '255.255.255.0', '10.0.5.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('768', '10.0.5.198', '10.0.5.0', '255.255.255.0', '10.0.5.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('769', '10.0.5.199', '10.0.5.0', '255.255.255.0', '10.0.5.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('770', '10.0.5.200', '10.0.5.0', '255.255.255.0', '10.0.5.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('771', '10.0.5.201', '10.0.5.0', '255.255.255.0', '10.0.5.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('772', '10.0.5.202', '10.0.5.0', '255.255.255.0', '10.0.5.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('773', '10.0.5.203', '10.0.5.0', '255.255.255.0', '10.0.5.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('774', '10.0.5.204', '10.0.5.0', '255.255.255.0', '10.0.5.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('775', '10.0.5.205', '10.0.5.0', '255.255.255.0', '10.0.5.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('776', '10.0.5.206', '10.0.5.0', '255.255.255.0', '10.0.5.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('777', '10.0.5.207', '10.0.5.0', '255.255.255.0', '10.0.5.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('778', '10.0.5.208', '10.0.5.0', '255.255.255.0', '10.0.5.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('779', '10.0.5.209', '10.0.5.0', '255.255.255.0', '10.0.5.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('780', '10.0.5.210', '10.0.5.0', '255.255.255.0', '10.0.5.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('781', '10.0.5.211', '10.0.5.0', '255.255.255.0', '10.0.5.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('782', '10.0.5.212', '10.0.5.0', '255.255.255.0', '10.0.5.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('783', '10.0.5.213', '10.0.5.0', '255.255.255.0', '10.0.5.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('784', '10.0.5.214', '10.0.5.0', '255.255.255.0', '10.0.5.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('785', '10.0.5.215', '10.0.5.0', '255.255.255.0', '10.0.5.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('786', '10.0.5.216', '10.0.5.0', '255.255.255.0', '10.0.5.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('787', '10.0.5.217', '10.0.5.0', '255.255.255.0', '10.0.5.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('788', '10.0.5.218', '10.0.5.0', '255.255.255.0', '10.0.5.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('789', '10.0.5.219', '10.0.5.0', '255.255.255.0', '10.0.5.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('790', '10.0.5.220', '10.0.5.0', '255.255.255.0', '10.0.5.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('791', '10.0.5.221', '10.0.5.0', '255.255.255.0', '10.0.5.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('792', '10.0.5.222', '10.0.5.0', '255.255.255.0', '10.0.5.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('793', '10.0.5.223', '10.0.5.0', '255.255.255.0', '10.0.5.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('794', '10.0.5.224', '10.0.5.0', '255.255.255.0', '10.0.5.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('795', '10.0.5.225', '10.0.5.0', '255.255.255.0', '10.0.5.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('796', '10.0.5.226', '10.0.5.0', '255.255.255.0', '10.0.5.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('797', '10.0.5.227', '10.0.5.0', '255.255.255.0', '10.0.5.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('798', '10.0.5.228', '10.0.5.0', '255.255.255.0', '10.0.5.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('799', '10.0.5.229', '10.0.5.0', '255.255.255.0', '10.0.5.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('800', '10.0.5.230', '10.0.5.0', '255.255.255.0', '10.0.5.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('801', '10.0.5.231', '10.0.5.0', '255.255.255.0', '10.0.5.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('802', '10.0.5.232', '10.0.5.0', '255.255.255.0', '10.0.5.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('803', '10.0.5.233', '10.0.5.0', '255.255.255.0', '10.0.5.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('804', '10.0.5.234', '10.0.5.0', '255.255.255.0', '10.0.5.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('805', '10.0.5.235', '10.0.5.0', '255.255.255.0', '10.0.5.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('806', '10.0.5.236', '10.0.5.0', '255.255.255.0', '10.0.5.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('807', '10.0.5.237', '10.0.5.0', '255.255.255.0', '10.0.5.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('808', '10.0.5.238', '10.0.5.0', '255.255.255.0', '10.0.5.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('809', '10.0.5.239', '10.0.5.0', '255.255.255.0', '10.0.5.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('810', '10.0.5.240', '10.0.5.0', '255.255.255.0', '10.0.5.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('811', '10.0.5.241', '10.0.5.0', '255.255.255.0', '10.0.5.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('812', '10.0.5.242', '10.0.5.0', '255.255.255.0', '10.0.5.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('813', '10.0.5.243', '10.0.5.0', '255.255.255.0', '10.0.5.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('814', '10.0.5.244', '10.0.5.0', '255.255.255.0', '10.0.5.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('815', '10.0.5.245', '10.0.5.0', '255.255.255.0', '10.0.5.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('816', '10.0.5.246', '10.0.5.0', '255.255.255.0', '10.0.5.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('817', '10.0.5.247', '10.0.5.0', '255.255.255.0', '10.0.5.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('818', '10.0.5.248', '10.0.5.0', '255.255.255.0', '10.0.5.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('819', '10.0.5.249', '10.0.5.0', '255.255.255.0', '10.0.5.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('820', '10.0.5.250', '10.0.5.0', '255.255.255.0', '10.0.5.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('821', '10.0.5.251', '10.0.5.0', '255.255.255.0', '10.0.5.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('822', '10.0.5.252', '10.0.5.0', '255.255.255.0', '10.0.5.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('823', '10.0.5.253', '10.0.5.0', '255.255.255.0', '10.0.5.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('824', '10.0.5.254', '10.0.5.0', '255.255.255.0', '10.0.5.254', '默认网关地址', '');
INSERT INTO `netmget_ipmanage` VALUES ('825', '10.0.2.1', '10.0.2.0', '255.255.255.0', '10.0.2.254', '预留地址', '');
INSERT INTO `netmget_ipmanage` VALUES ('826', '10.0.2.2', '10.0.2.0', '255.255.255.0', '10.0.2.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('827', '10.0.2.3', '10.0.2.0', '255.255.255.0', '10.0.2.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('828', '10.0.2.4', '10.0.2.0', '255.255.255.0', '10.0.2.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('829', '10.0.2.5', '10.0.2.0', '255.255.255.0', '10.0.2.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('830', '10.0.2.6', '10.0.2.0', '255.255.255.0', '10.0.2.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('831', '10.0.2.7', '10.0.2.0', '255.255.255.0', '10.0.2.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('832', '10.0.2.8', '10.0.2.0', '255.255.255.0', '10.0.2.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('833', '10.0.2.9', '10.0.2.0', '255.255.255.0', '10.0.2.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('834', '10.0.2.10', '10.0.2.0', '255.255.255.0', '10.0.2.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('835', '10.0.2.11', '10.0.2.0', '255.255.255.0', '10.0.2.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('836', '10.0.2.12', '10.0.2.0', '255.255.255.0', '10.0.2.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('837', '10.0.2.13', '10.0.2.0', '255.255.255.0', '10.0.2.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('838', '10.0.2.14', '10.0.2.0', '255.255.255.0', '10.0.2.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('839', '10.0.2.15', '10.0.2.0', '255.255.255.0', '10.0.2.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('840', '10.0.2.16', '10.0.2.0', '255.255.255.0', '10.0.2.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('841', '10.0.2.17', '10.0.2.0', '255.255.255.0', '10.0.2.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('842', '10.0.2.18', '10.0.2.0', '255.255.255.0', '10.0.2.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('843', '10.0.2.19', '10.0.2.0', '255.255.255.0', '10.0.2.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('844', '10.0.2.20', '10.0.2.0', '255.255.255.0', '10.0.2.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('845', '10.0.2.21', '10.0.2.0', '255.255.255.0', '10.0.2.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('846', '10.0.2.22', '10.0.2.0', '255.255.255.0', '10.0.2.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('847', '10.0.2.23', '10.0.2.0', '255.255.255.0', '10.0.2.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('848', '10.0.2.24', '10.0.2.0', '255.255.255.0', '10.0.2.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('849', '10.0.2.25', '10.0.2.0', '255.255.255.0', '10.0.2.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('850', '10.0.2.26', '10.0.2.0', '255.255.255.0', '10.0.2.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('851', '10.0.2.27', '10.0.2.0', '255.255.255.0', '10.0.2.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('852', '10.0.2.28', '10.0.2.0', '255.255.255.0', '10.0.2.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('853', '10.0.2.29', '10.0.2.0', '255.255.255.0', '10.0.2.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('854', '10.0.2.30', '10.0.2.0', '255.255.255.0', '10.0.2.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('855', '10.0.2.31', '10.0.2.0', '255.255.255.0', '10.0.2.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('856', '10.0.2.32', '10.0.2.0', '255.255.255.0', '10.0.2.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('857', '10.0.2.33', '10.0.2.0', '255.255.255.0', '10.0.2.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('858', '10.0.2.34', '10.0.2.0', '255.255.255.0', '10.0.2.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('859', '10.0.2.35', '10.0.2.0', '255.255.255.0', '10.0.2.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('860', '10.0.2.36', '10.0.2.0', '255.255.255.0', '10.0.2.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('861', '10.0.2.37', '10.0.2.0', '255.255.255.0', '10.0.2.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('862', '10.0.2.38', '10.0.2.0', '255.255.255.0', '10.0.2.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('863', '10.0.2.39', '10.0.2.0', '255.255.255.0', '10.0.2.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('864', '10.0.2.40', '10.0.2.0', '255.255.255.0', '10.0.2.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('865', '10.0.2.41', '10.0.2.0', '255.255.255.0', '10.0.2.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('866', '10.0.2.42', '10.0.2.0', '255.255.255.0', '10.0.2.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('867', '10.0.2.43', '10.0.2.0', '255.255.255.0', '10.0.2.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('868', '10.0.2.44', '10.0.2.0', '255.255.255.0', '10.0.2.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('869', '10.0.2.45', '10.0.2.0', '255.255.255.0', '10.0.2.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('870', '10.0.2.46', '10.0.2.0', '255.255.255.0', '10.0.2.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('871', '10.0.2.47', '10.0.2.0', '255.255.255.0', '10.0.2.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('872', '10.0.2.48', '10.0.2.0', '255.255.255.0', '10.0.2.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('873', '10.0.2.49', '10.0.2.0', '255.255.255.0', '10.0.2.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('874', '10.0.2.50', '10.0.2.0', '255.255.255.0', '10.0.2.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('875', '10.0.2.51', '10.0.2.0', '255.255.255.0', '10.0.2.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('876', '10.0.2.52', '10.0.2.0', '255.255.255.0', '10.0.2.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('877', '10.0.2.53', '10.0.2.0', '255.255.255.0', '10.0.2.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('878', '10.0.2.54', '10.0.2.0', '255.255.255.0', '10.0.2.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('879', '10.0.2.55', '10.0.2.0', '255.255.255.0', '10.0.2.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('880', '10.0.2.56', '10.0.2.0', '255.255.255.0', '10.0.2.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('881', '10.0.2.57', '10.0.2.0', '255.255.255.0', '10.0.2.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('882', '10.0.2.58', '10.0.2.0', '255.255.255.0', '10.0.2.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('883', '10.0.2.59', '10.0.2.0', '255.255.255.0', '10.0.2.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('884', '10.0.2.60', '10.0.2.0', '255.255.255.0', '10.0.2.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('885', '10.0.2.61', '10.0.2.0', '255.255.255.0', '10.0.2.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('886', '10.0.2.62', '10.0.2.0', '255.255.255.0', '10.0.2.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('887', '10.0.2.63', '10.0.2.0', '255.255.255.0', '10.0.2.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('888', '10.0.2.64', '10.0.2.0', '255.255.255.0', '10.0.2.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('889', '10.0.2.65', '10.0.2.0', '255.255.255.0', '10.0.2.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('890', '10.0.2.66', '10.0.2.0', '255.255.255.0', '10.0.2.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('891', '10.0.2.67', '10.0.2.0', '255.255.255.0', '10.0.2.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('892', '10.0.2.68', '10.0.2.0', '255.255.255.0', '10.0.2.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('893', '10.0.2.69', '10.0.2.0', '255.255.255.0', '10.0.2.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('894', '10.0.2.70', '10.0.2.0', '255.255.255.0', '10.0.2.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('895', '10.0.2.71', '10.0.2.0', '255.255.255.0', '10.0.2.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('896', '10.0.2.72', '10.0.2.0', '255.255.255.0', '10.0.2.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('897', '10.0.2.73', '10.0.2.0', '255.255.255.0', '10.0.2.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('898', '10.0.2.74', '10.0.2.0', '255.255.255.0', '10.0.2.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('899', '10.0.2.75', '10.0.2.0', '255.255.255.0', '10.0.2.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('900', '10.0.2.76', '10.0.2.0', '255.255.255.0', '10.0.2.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('901', '10.0.2.77', '10.0.2.0', '255.255.255.0', '10.0.2.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('902', '10.0.2.78', '10.0.2.0', '255.255.255.0', '10.0.2.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('903', '10.0.2.79', '10.0.2.0', '255.255.255.0', '10.0.2.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('904', '10.0.2.80', '10.0.2.0', '255.255.255.0', '10.0.2.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('905', '10.0.2.81', '10.0.2.0', '255.255.255.0', '10.0.2.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('906', '10.0.2.82', '10.0.2.0', '255.255.255.0', '10.0.2.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('907', '10.0.2.83', '10.0.2.0', '255.255.255.0', '10.0.2.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('908', '10.0.2.84', '10.0.2.0', '255.255.255.0', '10.0.2.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('909', '10.0.2.85', '10.0.2.0', '255.255.255.0', '10.0.2.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('910', '10.0.2.86', '10.0.2.0', '255.255.255.0', '10.0.2.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('911', '10.0.2.87', '10.0.2.0', '255.255.255.0', '10.0.2.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('912', '10.0.2.88', '10.0.2.0', '255.255.255.0', '10.0.2.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('913', '10.0.2.89', '10.0.2.0', '255.255.255.0', '10.0.2.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('914', '10.0.2.90', '10.0.2.0', '255.255.255.0', '10.0.2.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('915', '10.0.2.91', '10.0.2.0', '255.255.255.0', '10.0.2.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('916', '10.0.2.92', '10.0.2.0', '255.255.255.0', '10.0.2.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('917', '10.0.2.93', '10.0.2.0', '255.255.255.0', '10.0.2.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('918', '10.0.2.94', '10.0.2.0', '255.255.255.0', '10.0.2.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('919', '10.0.2.95', '10.0.2.0', '255.255.255.0', '10.0.2.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('920', '10.0.2.96', '10.0.2.0', '255.255.255.0', '10.0.2.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('921', '10.0.2.97', '10.0.2.0', '255.255.255.0', '10.0.2.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('922', '10.0.2.98', '10.0.2.0', '255.255.255.0', '10.0.2.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('923', '10.0.2.99', '10.0.2.0', '255.255.255.0', '10.0.2.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('924', '10.0.2.100', '10.0.2.0', '255.255.255.0', '10.0.2.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('925', '10.0.2.101', '10.0.2.0', '255.255.255.0', '10.0.2.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('926', '10.0.2.102', '10.0.2.0', '255.255.255.0', '10.0.2.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('927', '10.0.2.103', '10.0.2.0', '255.255.255.0', '10.0.2.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('928', '10.0.2.104', '10.0.2.0', '255.255.255.0', '10.0.2.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('929', '10.0.2.105', '10.0.2.0', '255.255.255.0', '10.0.2.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('930', '10.0.2.106', '10.0.2.0', '255.255.255.0', '10.0.2.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('931', '10.0.2.107', '10.0.2.0', '255.255.255.0', '10.0.2.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('932', '10.0.2.108', '10.0.2.0', '255.255.255.0', '10.0.2.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('933', '10.0.2.109', '10.0.2.0', '255.255.255.0', '10.0.2.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('934', '10.0.2.110', '10.0.2.0', '255.255.255.0', '10.0.2.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('935', '10.0.2.111', '10.0.2.0', '255.255.255.0', '10.0.2.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('936', '10.0.2.112', '10.0.2.0', '255.255.255.0', '10.0.2.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('937', '10.0.2.113', '10.0.2.0', '255.255.255.0', '10.0.2.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('938', '10.0.2.114', '10.0.2.0', '255.255.255.0', '10.0.2.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('939', '10.0.2.115', '10.0.2.0', '255.255.255.0', '10.0.2.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('940', '10.0.2.116', '10.0.2.0', '255.255.255.0', '10.0.2.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('941', '10.0.2.117', '10.0.2.0', '255.255.255.0', '10.0.2.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('942', '10.0.2.118', '10.0.2.0', '255.255.255.0', '10.0.2.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('943', '10.0.2.119', '10.0.2.0', '255.255.255.0', '10.0.2.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('944', '10.0.2.120', '10.0.2.0', '255.255.255.0', '10.0.2.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('945', '10.0.2.121', '10.0.2.0', '255.255.255.0', '10.0.2.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('946', '10.0.2.122', '10.0.2.0', '255.255.255.0', '10.0.2.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('947', '10.0.2.123', '10.0.2.0', '255.255.255.0', '10.0.2.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('948', '10.0.2.124', '10.0.2.0', '255.255.255.0', '10.0.2.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('949', '10.0.2.125', '10.0.2.0', '255.255.255.0', '10.0.2.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('950', '10.0.2.126', '10.0.2.0', '255.255.255.0', '10.0.2.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('951', '10.0.2.127', '10.0.2.0', '255.255.255.0', '10.0.2.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('952', '10.0.2.128', '10.0.2.0', '255.255.255.0', '10.0.2.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('953', '10.0.2.129', '10.0.2.0', '255.255.255.0', '10.0.2.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('954', '10.0.2.130', '10.0.2.0', '255.255.255.0', '10.0.2.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('955', '10.0.2.131', '10.0.2.0', '255.255.255.0', '10.0.2.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('956', '10.0.2.132', '10.0.2.0', '255.255.255.0', '10.0.2.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('957', '10.0.2.133', '10.0.2.0', '255.255.255.0', '10.0.2.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('958', '10.0.2.134', '10.0.2.0', '255.255.255.0', '10.0.2.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('959', '10.0.2.135', '10.0.2.0', '255.255.255.0', '10.0.2.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('960', '10.0.2.136', '10.0.2.0', '255.255.255.0', '10.0.2.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('961', '10.0.2.137', '10.0.2.0', '255.255.255.0', '10.0.2.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('962', '10.0.2.138', '10.0.2.0', '255.255.255.0', '10.0.2.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('963', '10.0.2.139', '10.0.2.0', '255.255.255.0', '10.0.2.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('964', '10.0.2.140', '10.0.2.0', '255.255.255.0', '10.0.2.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('965', '10.0.2.141', '10.0.2.0', '255.255.255.0', '10.0.2.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('966', '10.0.2.142', '10.0.2.0', '255.255.255.0', '10.0.2.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('967', '10.0.2.143', '10.0.2.0', '255.255.255.0', '10.0.2.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('968', '10.0.2.144', '10.0.2.0', '255.255.255.0', '10.0.2.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('969', '10.0.2.145', '10.0.2.0', '255.255.255.0', '10.0.2.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('970', '10.0.2.146', '10.0.2.0', '255.255.255.0', '10.0.2.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('971', '10.0.2.147', '10.0.2.0', '255.255.255.0', '10.0.2.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('972', '10.0.2.148', '10.0.2.0', '255.255.255.0', '10.0.2.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('973', '10.0.2.149', '10.0.2.0', '255.255.255.0', '10.0.2.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('974', '10.0.2.150', '10.0.2.0', '255.255.255.0', '10.0.2.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('975', '10.0.2.151', '10.0.2.0', '255.255.255.0', '10.0.2.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('976', '10.0.2.152', '10.0.2.0', '255.255.255.0', '10.0.2.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('977', '10.0.2.153', '10.0.2.0', '255.255.255.0', '10.0.2.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('978', '10.0.2.154', '10.0.2.0', '255.255.255.0', '10.0.2.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('979', '10.0.2.155', '10.0.2.0', '255.255.255.0', '10.0.2.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('980', '10.0.2.156', '10.0.2.0', '255.255.255.0', '10.0.2.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('981', '10.0.2.157', '10.0.2.0', '255.255.255.0', '10.0.2.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('982', '10.0.2.158', '10.0.2.0', '255.255.255.0', '10.0.2.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('983', '10.0.2.159', '10.0.2.0', '255.255.255.0', '10.0.2.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('984', '10.0.2.160', '10.0.2.0', '255.255.255.0', '10.0.2.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('985', '10.0.2.161', '10.0.2.0', '255.255.255.0', '10.0.2.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('986', '10.0.2.162', '10.0.2.0', '255.255.255.0', '10.0.2.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('987', '10.0.2.163', '10.0.2.0', '255.255.255.0', '10.0.2.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('988', '10.0.2.164', '10.0.2.0', '255.255.255.0', '10.0.2.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('989', '10.0.2.165', '10.0.2.0', '255.255.255.0', '10.0.2.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('990', '10.0.2.166', '10.0.2.0', '255.255.255.0', '10.0.2.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('991', '10.0.2.167', '10.0.2.0', '255.255.255.0', '10.0.2.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('992', '10.0.2.168', '10.0.2.0', '255.255.255.0', '10.0.2.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('993', '10.0.2.169', '10.0.2.0', '255.255.255.0', '10.0.2.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('994', '10.0.2.170', '10.0.2.0', '255.255.255.0', '10.0.2.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('995', '10.0.2.171', '10.0.2.0', '255.255.255.0', '10.0.2.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('996', '10.0.2.172', '10.0.2.0', '255.255.255.0', '10.0.2.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('997', '10.0.2.173', '10.0.2.0', '255.255.255.0', '10.0.2.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('998', '10.0.2.174', '10.0.2.0', '255.255.255.0', '10.0.2.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('999', '10.0.2.175', '10.0.2.0', '255.255.255.0', '10.0.2.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1000', '10.0.2.176', '10.0.2.0', '255.255.255.0', '10.0.2.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1001', '10.0.2.177', '10.0.2.0', '255.255.255.0', '10.0.2.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1002', '10.0.2.178', '10.0.2.0', '255.255.255.0', '10.0.2.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1003', '10.0.2.179', '10.0.2.0', '255.255.255.0', '10.0.2.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1004', '10.0.2.180', '10.0.2.0', '255.255.255.0', '10.0.2.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1005', '10.0.2.181', '10.0.2.0', '255.255.255.0', '10.0.2.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1006', '10.0.2.182', '10.0.2.0', '255.255.255.0', '10.0.2.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1007', '10.0.2.183', '10.0.2.0', '255.255.255.0', '10.0.2.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1008', '10.0.2.184', '10.0.2.0', '255.255.255.0', '10.0.2.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1009', '10.0.2.185', '10.0.2.0', '255.255.255.0', '10.0.2.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1010', '10.0.2.186', '10.0.2.0', '255.255.255.0', '10.0.2.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1011', '10.0.2.187', '10.0.2.0', '255.255.255.0', '10.0.2.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1012', '10.0.2.188', '10.0.2.0', '255.255.255.0', '10.0.2.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1013', '10.0.2.189', '10.0.2.0', '255.255.255.0', '10.0.2.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1014', '10.0.2.190', '10.0.2.0', '255.255.255.0', '10.0.2.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1015', '10.0.2.191', '10.0.2.0', '255.255.255.0', '10.0.2.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1016', '10.0.2.192', '10.0.2.0', '255.255.255.0', '10.0.2.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1017', '10.0.2.193', '10.0.2.0', '255.255.255.0', '10.0.2.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1018', '10.0.2.194', '10.0.2.0', '255.255.255.0', '10.0.2.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1019', '10.0.2.195', '10.0.2.0', '255.255.255.0', '10.0.2.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1020', '10.0.2.196', '10.0.2.0', '255.255.255.0', '10.0.2.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1021', '10.0.2.197', '10.0.2.0', '255.255.255.0', '10.0.2.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1022', '10.0.2.198', '10.0.2.0', '255.255.255.0', '10.0.2.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1023', '10.0.2.199', '10.0.2.0', '255.255.255.0', '10.0.2.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1024', '10.0.2.200', '10.0.2.0', '255.255.255.0', '10.0.2.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1025', '10.0.2.201', '10.0.2.0', '255.255.255.0', '10.0.2.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1026', '10.0.2.202', '10.0.2.0', '255.255.255.0', '10.0.2.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1027', '10.0.2.203', '10.0.2.0', '255.255.255.0', '10.0.2.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1028', '10.0.2.204', '10.0.2.0', '255.255.255.0', '10.0.2.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1029', '10.0.2.205', '10.0.2.0', '255.255.255.0', '10.0.2.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1030', '10.0.2.206', '10.0.2.0', '255.255.255.0', '10.0.2.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1031', '10.0.2.207', '10.0.2.0', '255.255.255.0', '10.0.2.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1032', '10.0.2.208', '10.0.2.0', '255.255.255.0', '10.0.2.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1033', '10.0.2.209', '10.0.2.0', '255.255.255.0', '10.0.2.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1034', '10.0.2.210', '10.0.2.0', '255.255.255.0', '10.0.2.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1035', '10.0.2.211', '10.0.2.0', '255.255.255.0', '10.0.2.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1036', '10.0.2.212', '10.0.2.0', '255.255.255.0', '10.0.2.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1037', '10.0.2.213', '10.0.2.0', '255.255.255.0', '10.0.2.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1038', '10.0.2.214', '10.0.2.0', '255.255.255.0', '10.0.2.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1039', '10.0.2.215', '10.0.2.0', '255.255.255.0', '10.0.2.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1040', '10.0.2.216', '10.0.2.0', '255.255.255.0', '10.0.2.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1041', '10.0.2.217', '10.0.2.0', '255.255.255.0', '10.0.2.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1042', '10.0.2.218', '10.0.2.0', '255.255.255.0', '10.0.2.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1043', '10.0.2.219', '10.0.2.0', '255.255.255.0', '10.0.2.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1044', '10.0.2.220', '10.0.2.0', '255.255.255.0', '10.0.2.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1045', '10.0.2.221', '10.0.2.0', '255.255.255.0', '10.0.2.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1046', '10.0.2.222', '10.0.2.0', '255.255.255.0', '10.0.2.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1047', '10.0.2.223', '10.0.2.0', '255.255.255.0', '10.0.2.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1048', '10.0.2.224', '10.0.2.0', '255.255.255.0', '10.0.2.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1049', '10.0.2.225', '10.0.2.0', '255.255.255.0', '10.0.2.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1050', '10.0.2.226', '10.0.2.0', '255.255.255.0', '10.0.2.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1051', '10.0.2.227', '10.0.2.0', '255.255.255.0', '10.0.2.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1052', '10.0.2.228', '10.0.2.0', '255.255.255.0', '10.0.2.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1053', '10.0.2.229', '10.0.2.0', '255.255.255.0', '10.0.2.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1054', '10.0.2.230', '10.0.2.0', '255.255.255.0', '10.0.2.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1055', '10.0.2.231', '10.0.2.0', '255.255.255.0', '10.0.2.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1056', '10.0.2.232', '10.0.2.0', '255.255.255.0', '10.0.2.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1057', '10.0.2.233', '10.0.2.0', '255.255.255.0', '10.0.2.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1058', '10.0.2.234', '10.0.2.0', '255.255.255.0', '10.0.2.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1059', '10.0.2.235', '10.0.2.0', '255.255.255.0', '10.0.2.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1060', '10.0.2.236', '10.0.2.0', '255.255.255.0', '10.0.2.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1061', '10.0.2.237', '10.0.2.0', '255.255.255.0', '10.0.2.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1062', '10.0.2.238', '10.0.2.0', '255.255.255.0', '10.0.2.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1063', '10.0.2.239', '10.0.2.0', '255.255.255.0', '10.0.2.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1064', '10.0.2.240', '10.0.2.0', '255.255.255.0', '10.0.2.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1065', '10.0.2.241', '10.0.2.0', '255.255.255.0', '10.0.2.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1066', '10.0.2.242', '10.0.2.0', '255.255.255.0', '10.0.2.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1067', '10.0.2.243', '10.0.2.0', '255.255.255.0', '10.0.2.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1068', '10.0.2.244', '10.0.2.0', '255.255.255.0', '10.0.2.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1069', '10.0.2.245', '10.0.2.0', '255.255.255.0', '10.0.2.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1070', '10.0.2.246', '10.0.2.0', '255.255.255.0', '10.0.2.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1071', '10.0.2.247', '10.0.2.0', '255.255.255.0', '10.0.2.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1072', '10.0.2.248', '10.0.2.0', '255.255.255.0', '10.0.2.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1073', '10.0.2.249', '10.0.2.0', '255.255.255.0', '10.0.2.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1074', '10.0.2.250', '10.0.2.0', '255.255.255.0', '10.0.2.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1075', '10.0.2.251', '10.0.2.0', '255.255.255.0', '10.0.2.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1076', '10.0.2.252', '10.0.2.0', '255.255.255.0', '10.0.2.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1077', '10.0.2.253', '10.0.2.0', '255.255.255.0', '10.0.2.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1078', '10.0.2.254', '10.0.2.0', '255.255.255.0', '10.0.2.254', '默认网关地址', '');
INSERT INTO `netmget_ipmanage` VALUES ('1079', '10.0.4.1', '10.0.4.0', '255.255.255.0', '10.0.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1080', '10.0.4.2', '10.0.4.0', '255.255.255.0', '10.0.4.254', '老金蝶财务服务器', '系统已下线，仅供数据查询使用。');
INSERT INTO `netmget_ipmanage` VALUES ('1081', '10.0.4.3', '10.0.4.0', '255.255.255.0', '10.0.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1082', '10.0.4.4', '10.0.4.0', '255.255.255.0', '10.0.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1083', '10.0.4.5', '10.0.4.0', '255.255.255.0', '10.0.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1084', '10.0.4.6', '10.0.4.0', '255.255.255.0', '10.0.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1085', '10.0.4.7', '10.0.4.0', '255.255.255.0', '10.0.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1086', '10.0.4.8', '10.0.4.0', '255.255.255.0', '10.0.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1087', '10.0.4.9', '10.0.4.0', '255.255.255.0', '10.0.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1088', '10.0.4.10', '10.0.4.0', '255.255.255.0', '10.0.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1089', '10.0.4.11', '10.0.4.0', '255.255.255.0', '10.0.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1090', '10.0.4.12', '10.0.4.0', '255.255.255.0', '10.0.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1091', '10.0.4.13', '10.0.4.0', '255.255.255.0', '10.0.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1092', '10.0.4.14', '10.0.4.0', '255.255.255.0', '10.0.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1093', '10.0.4.15', '10.0.4.0', '255.255.255.0', '10.0.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1094', '10.0.4.16', '10.0.4.0', '255.255.255.0', '10.0.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1095', '10.0.4.17', '10.0.4.0', '255.255.255.0', '10.0.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1096', '10.0.4.18', '10.0.4.0', '255.255.255.0', '10.0.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1097', '10.0.4.19', '10.0.4.0', '255.255.255.0', '10.0.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1098', '10.0.4.20', '10.0.4.0', '255.255.255.0', '10.0.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1099', '10.0.4.21', '10.0.4.0', '255.255.255.0', '10.0.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1100', '10.0.4.22', '10.0.4.0', '255.255.255.0', '10.0.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1101', '10.0.4.23', '10.0.4.0', '255.255.255.0', '10.0.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1102', '10.0.4.24', '10.0.4.0', '255.255.255.0', '10.0.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1103', '10.0.4.25', '10.0.4.0', '255.255.255.0', '10.0.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1104', '10.0.4.26', '10.0.4.0', '255.255.255.0', '10.0.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1105', '10.0.4.27', '10.0.4.0', '255.255.255.0', '10.0.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1106', '10.0.4.28', '10.0.4.0', '255.255.255.0', '10.0.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1107', '10.0.4.29', '10.0.4.0', '255.255.255.0', '10.0.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1108', '10.0.4.30', '10.0.4.0', '255.255.255.0', '10.0.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1109', '10.0.4.31', '10.0.4.0', '255.255.255.0', '10.0.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1110', '10.0.4.32', '10.0.4.0', '255.255.255.0', '10.0.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1111', '10.0.4.33', '10.0.4.0', '255.255.255.0', '10.0.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1112', '10.0.4.34', '10.0.4.0', '255.255.255.0', '10.0.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1113', '10.0.4.35', '10.0.4.0', '255.255.255.0', '10.0.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1114', '10.0.4.36', '10.0.4.0', '255.255.255.0', '10.0.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1115', '10.0.4.37', '10.0.4.0', '255.255.255.0', '10.0.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1116', '10.0.4.38', '10.0.4.0', '255.255.255.0', '10.0.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1117', '10.0.4.39', '10.0.4.0', '255.255.255.0', '10.0.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1118', '10.0.4.40', '10.0.4.0', '255.255.255.0', '10.0.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1119', '10.0.4.41', '10.0.4.0', '255.255.255.0', '10.0.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1120', '10.0.4.42', '10.0.4.0', '255.255.255.0', '10.0.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1121', '10.0.4.43', '10.0.4.0', '255.255.255.0', '10.0.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1122', '10.0.4.44', '10.0.4.0', '255.255.255.0', '10.0.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1123', '10.0.4.45', '10.0.4.0', '255.255.255.0', '10.0.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1124', '10.0.4.46', '10.0.4.0', '255.255.255.0', '10.0.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1125', '10.0.4.47', '10.0.4.0', '255.255.255.0', '10.0.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1126', '10.0.4.48', '10.0.4.0', '255.255.255.0', '10.0.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1127', '10.0.4.49', '10.0.4.0', '255.255.255.0', '10.0.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1128', '10.0.4.50', '10.0.4.0', '255.255.255.0', '10.0.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1129', '10.0.4.51', '10.0.4.0', '255.255.255.0', '10.0.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1130', '10.0.4.52', '10.0.4.0', '255.255.255.0', '10.0.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1131', '10.0.4.53', '10.0.4.0', '255.255.255.0', '10.0.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1132', '10.0.4.54', '10.0.4.0', '255.255.255.0', '10.0.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1133', '10.0.4.55', '10.0.4.0', '255.255.255.0', '10.0.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1134', '10.0.4.56', '10.0.4.0', '255.255.255.0', '10.0.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1135', '10.0.4.57', '10.0.4.0', '255.255.255.0', '10.0.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1136', '10.0.4.58', '10.0.4.0', '255.255.255.0', '10.0.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1137', '10.0.4.59', '10.0.4.0', '255.255.255.0', '10.0.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1138', '10.0.4.60', '10.0.4.0', '255.255.255.0', '10.0.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1139', '10.0.4.61', '10.0.4.0', '255.255.255.0', '10.0.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1140', '10.0.4.62', '10.0.4.0', '255.255.255.0', '10.0.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1141', '10.0.4.63', '10.0.4.0', '255.255.255.0', '10.0.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1142', '10.0.4.64', '10.0.4.0', '255.255.255.0', '10.0.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1143', '10.0.4.65', '10.0.4.0', '255.255.255.0', '10.0.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1144', '10.0.4.66', '10.0.4.0', '255.255.255.0', '10.0.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1145', '10.0.4.67', '10.0.4.0', '255.255.255.0', '10.0.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1146', '10.0.4.68', '10.0.4.0', '255.255.255.0', '10.0.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1147', '10.0.4.69', '10.0.4.0', '255.255.255.0', '10.0.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1148', '10.0.4.70', '10.0.4.0', '255.255.255.0', '10.0.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1149', '10.0.4.71', '10.0.4.0', '255.255.255.0', '10.0.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1150', '10.0.4.72', '10.0.4.0', '255.255.255.0', '10.0.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1151', '10.0.4.73', '10.0.4.0', '255.255.255.0', '10.0.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1152', '10.0.4.74', '10.0.4.0', '255.255.255.0', '10.0.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1153', '10.0.4.75', '10.0.4.0', '255.255.255.0', '10.0.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1154', '10.0.4.76', '10.0.4.0', '255.255.255.0', '10.0.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1155', '10.0.4.77', '10.0.4.0', '255.255.255.0', '10.0.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1156', '10.0.4.78', '10.0.4.0', '255.255.255.0', '10.0.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1157', '10.0.4.79', '10.0.4.0', '255.255.255.0', '10.0.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1158', '10.0.4.80', '10.0.4.0', '255.255.255.0', '10.0.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1159', '10.0.4.81', '10.0.4.0', '255.255.255.0', '10.0.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1160', '10.0.4.82', '10.0.4.0', '255.255.255.0', '10.0.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1161', '10.0.4.83', '10.0.4.0', '255.255.255.0', '10.0.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1162', '10.0.4.84', '10.0.4.0', '255.255.255.0', '10.0.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1163', '10.0.4.85', '10.0.4.0', '255.255.255.0', '10.0.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1164', '10.0.4.86', '10.0.4.0', '255.255.255.0', '10.0.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1165', '10.0.4.87', '10.0.4.0', '255.255.255.0', '10.0.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1166', '10.0.4.88', '10.0.4.0', '255.255.255.0', '10.0.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1167', '10.0.4.89', '10.0.4.0', '255.255.255.0', '10.0.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1168', '10.0.4.90', '10.0.4.0', '255.255.255.0', '10.0.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1169', '10.0.4.91', '10.0.4.0', '255.255.255.0', '10.0.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1170', '10.0.4.92', '10.0.4.0', '255.255.255.0', '10.0.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1171', '10.0.4.93', '10.0.4.0', '255.255.255.0', '10.0.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1172', '10.0.4.94', '10.0.4.0', '255.255.255.0', '10.0.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1173', '10.0.4.95', '10.0.4.0', '255.255.255.0', '10.0.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1174', '10.0.4.96', '10.0.4.0', '255.255.255.0', '10.0.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1175', '10.0.4.97', '10.0.4.0', '255.255.255.0', '10.0.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1176', '10.0.4.98', '10.0.4.0', '255.255.255.0', '10.0.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1177', '10.0.4.99', '10.0.4.0', '255.255.255.0', '10.0.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1178', '10.0.4.100', '10.0.4.0', '255.255.255.0', '10.0.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1179', '10.0.4.101', '10.0.4.0', '255.255.255.0', '10.0.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1180', '10.0.4.102', '10.0.4.0', '255.255.255.0', '10.0.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1181', '10.0.4.103', '10.0.4.0', '255.255.255.0', '10.0.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1182', '10.0.4.104', '10.0.4.0', '255.255.255.0', '10.0.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1183', '10.0.4.105', '10.0.4.0', '255.255.255.0', '10.0.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1184', '10.0.4.106', '10.0.4.0', '255.255.255.0', '10.0.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1185', '10.0.4.107', '10.0.4.0', '255.255.255.0', '10.0.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1186', '10.0.4.108', '10.0.4.0', '255.255.255.0', '10.0.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1187', '10.0.4.109', '10.0.4.0', '255.255.255.0', '10.0.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1188', '10.0.4.110', '10.0.4.0', '255.255.255.0', '10.0.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1189', '10.0.4.111', '10.0.4.0', '255.255.255.0', '10.0.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1190', '10.0.4.112', '10.0.4.0', '255.255.255.0', '10.0.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1191', '10.0.4.113', '10.0.4.0', '255.255.255.0', '10.0.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1192', '10.0.4.114', '10.0.4.0', '255.255.255.0', '10.0.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1193', '10.0.4.115', '10.0.4.0', '255.255.255.0', '10.0.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1194', '10.0.4.116', '10.0.4.0', '255.255.255.0', '10.0.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1195', '10.0.4.117', '10.0.4.0', '255.255.255.0', '10.0.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1196', '10.0.4.118', '10.0.4.0', '255.255.255.0', '10.0.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1197', '10.0.4.119', '10.0.4.0', '255.255.255.0', '10.0.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1198', '10.0.4.120', '10.0.4.0', '255.255.255.0', '10.0.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1199', '10.0.4.121', '10.0.4.0', '255.255.255.0', '10.0.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1200', '10.0.4.122', '10.0.4.0', '255.255.255.0', '10.0.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1201', '10.0.4.123', '10.0.4.0', '255.255.255.0', '10.0.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1202', '10.0.4.124', '10.0.4.0', '255.255.255.0', '10.0.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1203', '10.0.4.125', '10.0.4.0', '255.255.255.0', '10.0.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1204', '10.0.4.126', '10.0.4.0', '255.255.255.0', '10.0.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1205', '10.0.4.127', '10.0.4.0', '255.255.255.0', '10.0.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1206', '10.0.4.128', '10.0.4.0', '255.255.255.0', '10.0.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1207', '10.0.4.129', '10.0.4.0', '255.255.255.0', '10.0.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1208', '10.0.4.130', '10.0.4.0', '255.255.255.0', '10.0.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1209', '10.0.4.131', '10.0.4.0', '255.255.255.0', '10.0.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1210', '10.0.4.132', '10.0.4.0', '255.255.255.0', '10.0.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1211', '10.0.4.133', '10.0.4.0', '255.255.255.0', '10.0.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1212', '10.0.4.134', '10.0.4.0', '255.255.255.0', '10.0.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1213', '10.0.4.135', '10.0.4.0', '255.255.255.0', '10.0.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1214', '10.0.4.136', '10.0.4.0', '255.255.255.0', '10.0.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1215', '10.0.4.137', '10.0.4.0', '255.255.255.0', '10.0.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1216', '10.0.4.138', '10.0.4.0', '255.255.255.0', '10.0.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1217', '10.0.4.139', '10.0.4.0', '255.255.255.0', '10.0.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1218', '10.0.4.140', '10.0.4.0', '255.255.255.0', '10.0.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1219', '10.0.4.141', '10.0.4.0', '255.255.255.0', '10.0.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1220', '10.0.4.142', '10.0.4.0', '255.255.255.0', '10.0.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1221', '10.0.4.143', '10.0.4.0', '255.255.255.0', '10.0.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1222', '10.0.4.144', '10.0.4.0', '255.255.255.0', '10.0.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1223', '10.0.4.145', '10.0.4.0', '255.255.255.0', '10.0.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1224', '10.0.4.146', '10.0.4.0', '255.255.255.0', '10.0.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1225', '10.0.4.147', '10.0.4.0', '255.255.255.0', '10.0.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1226', '10.0.4.148', '10.0.4.0', '255.255.255.0', '10.0.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1227', '10.0.4.149', '10.0.4.0', '255.255.255.0', '10.0.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1228', '10.0.4.150', '10.0.4.0', '255.255.255.0', '10.0.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1229', '10.0.4.151', '10.0.4.0', '255.255.255.0', '10.0.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1230', '10.0.4.152', '10.0.4.0', '255.255.255.0', '10.0.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1231', '10.0.4.153', '10.0.4.0', '255.255.255.0', '10.0.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1232', '10.0.4.154', '10.0.4.0', '255.255.255.0', '10.0.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1233', '10.0.4.155', '10.0.4.0', '255.255.255.0', '10.0.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1234', '10.0.4.156', '10.0.4.0', '255.255.255.0', '10.0.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1235', '10.0.4.157', '10.0.4.0', '255.255.255.0', '10.0.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1236', '10.0.4.158', '10.0.4.0', '255.255.255.0', '10.0.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1237', '10.0.4.159', '10.0.4.0', '255.255.255.0', '10.0.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1238', '10.0.4.160', '10.0.4.0', '255.255.255.0', '10.0.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1239', '10.0.4.161', '10.0.4.0', '255.255.255.0', '10.0.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1240', '10.0.4.162', '10.0.4.0', '255.255.255.0', '10.0.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1241', '10.0.4.163', '10.0.4.0', '255.255.255.0', '10.0.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1242', '10.0.4.164', '10.0.4.0', '255.255.255.0', '10.0.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1243', '10.0.4.165', '10.0.4.0', '255.255.255.0', '10.0.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1244', '10.0.4.166', '10.0.4.0', '255.255.255.0', '10.0.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1245', '10.0.4.167', '10.0.4.0', '255.255.255.0', '10.0.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1246', '10.0.4.168', '10.0.4.0', '255.255.255.0', '10.0.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1247', '10.0.4.169', '10.0.4.0', '255.255.255.0', '10.0.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1248', '10.0.4.170', '10.0.4.0', '255.255.255.0', '10.0.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1249', '10.0.4.171', '10.0.4.0', '255.255.255.0', '10.0.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1250', '10.0.4.172', '10.0.4.0', '255.255.255.0', '10.0.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1251', '10.0.4.173', '10.0.4.0', '255.255.255.0', '10.0.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1252', '10.0.4.174', '10.0.4.0', '255.255.255.0', '10.0.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1253', '10.0.4.175', '10.0.4.0', '255.255.255.0', '10.0.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1254', '10.0.4.176', '10.0.4.0', '255.255.255.0', '10.0.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1255', '10.0.4.177', '10.0.4.0', '255.255.255.0', '10.0.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1256', '10.0.4.178', '10.0.4.0', '255.255.255.0', '10.0.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1257', '10.0.4.179', '10.0.4.0', '255.255.255.0', '10.0.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1258', '10.0.4.180', '10.0.4.0', '255.255.255.0', '10.0.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1259', '10.0.4.181', '10.0.4.0', '255.255.255.0', '10.0.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1260', '10.0.4.182', '10.0.4.0', '255.255.255.0', '10.0.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1261', '10.0.4.183', '10.0.4.0', '255.255.255.0', '10.0.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1262', '10.0.4.184', '10.0.4.0', '255.255.255.0', '10.0.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1263', '10.0.4.185', '10.0.4.0', '255.255.255.0', '10.0.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1264', '10.0.4.186', '10.0.4.0', '255.255.255.0', '10.0.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1265', '10.0.4.187', '10.0.4.0', '255.255.255.0', '10.0.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1266', '10.0.4.188', '10.0.4.0', '255.255.255.0', '10.0.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1267', '10.0.4.189', '10.0.4.0', '255.255.255.0', '10.0.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1268', '10.0.4.190', '10.0.4.0', '255.255.255.0', '10.0.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1269', '10.0.4.191', '10.0.4.0', '255.255.255.0', '10.0.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1270', '10.0.4.192', '10.0.4.0', '255.255.255.0', '10.0.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1271', '10.0.4.193', '10.0.4.0', '255.255.255.0', '10.0.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1272', '10.0.4.194', '10.0.4.0', '255.255.255.0', '10.0.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1273', '10.0.4.195', '10.0.4.0', '255.255.255.0', '10.0.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1274', '10.0.4.196', '10.0.4.0', '255.255.255.0', '10.0.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1275', '10.0.4.197', '10.0.4.0', '255.255.255.0', '10.0.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1276', '10.0.4.198', '10.0.4.0', '255.255.255.0', '10.0.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1277', '10.0.4.199', '10.0.4.0', '255.255.255.0', '10.0.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1278', '10.0.4.200', '10.0.4.0', '255.255.255.0', '10.0.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1279', '10.0.4.201', '10.0.4.0', '255.255.255.0', '10.0.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1280', '10.0.4.202', '10.0.4.0', '255.255.255.0', '10.0.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1281', '10.0.4.203', '10.0.4.0', '255.255.255.0', '10.0.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1282', '10.0.4.204', '10.0.4.0', '255.255.255.0', '10.0.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1283', '10.0.4.205', '10.0.4.0', '255.255.255.0', '10.0.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1284', '10.0.4.206', '10.0.4.0', '255.255.255.0', '10.0.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1285', '10.0.4.207', '10.0.4.0', '255.255.255.0', '10.0.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1286', '10.0.4.208', '10.0.4.0', '255.255.255.0', '10.0.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1287', '10.0.4.209', '10.0.4.0', '255.255.255.0', '10.0.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1288', '10.0.4.210', '10.0.4.0', '255.255.255.0', '10.0.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1289', '10.0.4.211', '10.0.4.0', '255.255.255.0', '10.0.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1290', '10.0.4.212', '10.0.4.0', '255.255.255.0', '10.0.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1291', '10.0.4.213', '10.0.4.0', '255.255.255.0', '10.0.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1292', '10.0.4.214', '10.0.4.0', '255.255.255.0', '10.0.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1293', '10.0.4.215', '10.0.4.0', '255.255.255.0', '10.0.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1294', '10.0.4.216', '10.0.4.0', '255.255.255.0', '10.0.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1295', '10.0.4.217', '10.0.4.0', '255.255.255.0', '10.0.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1296', '10.0.4.218', '10.0.4.0', '255.255.255.0', '10.0.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1297', '10.0.4.219', '10.0.4.0', '255.255.255.0', '10.0.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1298', '10.0.4.220', '10.0.4.0', '255.255.255.0', '10.0.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1299', '10.0.4.221', '10.0.4.0', '255.255.255.0', '10.0.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1300', '10.0.4.222', '10.0.4.0', '255.255.255.0', '10.0.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1301', '10.0.4.223', '10.0.4.0', '255.255.255.0', '10.0.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1302', '10.0.4.224', '10.0.4.0', '255.255.255.0', '10.0.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1303', '10.0.4.225', '10.0.4.0', '255.255.255.0', '10.0.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1304', '10.0.4.226', '10.0.4.0', '255.255.255.0', '10.0.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1305', '10.0.4.227', '10.0.4.0', '255.255.255.0', '10.0.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1306', '10.0.4.228', '10.0.4.0', '255.255.255.0', '10.0.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1307', '10.0.4.229', '10.0.4.0', '255.255.255.0', '10.0.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1308', '10.0.4.230', '10.0.4.0', '255.255.255.0', '10.0.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1309', '10.0.4.231', '10.0.4.0', '255.255.255.0', '10.0.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1310', '10.0.4.232', '10.0.4.0', '255.255.255.0', '10.0.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1311', '10.0.4.233', '10.0.4.0', '255.255.255.0', '10.0.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1312', '10.0.4.234', '10.0.4.0', '255.255.255.0', '10.0.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1313', '10.0.4.235', '10.0.4.0', '255.255.255.0', '10.0.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1314', '10.0.4.236', '10.0.4.0', '255.255.255.0', '10.0.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1315', '10.0.4.237', '10.0.4.0', '255.255.255.0', '10.0.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1316', '10.0.4.238', '10.0.4.0', '255.255.255.0', '10.0.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1317', '10.0.4.239', '10.0.4.0', '255.255.255.0', '10.0.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1318', '10.0.4.240', '10.0.4.0', '255.255.255.0', '10.0.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1319', '10.0.4.241', '10.0.4.0', '255.255.255.0', '10.0.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1320', '10.0.4.242', '10.0.4.0', '255.255.255.0', '10.0.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1321', '10.0.4.243', '10.0.4.0', '255.255.255.0', '10.0.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1322', '10.0.4.244', '10.0.4.0', '255.255.255.0', '10.0.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1323', '10.0.4.245', '10.0.4.0', '255.255.255.0', '10.0.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1324', '10.0.4.246', '10.0.4.0', '255.255.255.0', '10.0.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1325', '10.0.4.247', '10.0.4.0', '255.255.255.0', '10.0.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1326', '10.0.4.248', '10.0.4.0', '255.255.255.0', '10.0.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1327', '10.0.4.249', '10.0.4.0', '255.255.255.0', '10.0.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1328', '10.0.4.250', '10.0.4.0', '255.255.255.0', '10.0.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1329', '10.0.4.251', '10.0.4.0', '255.255.255.0', '10.0.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1330', '10.0.4.252', '10.0.4.0', '255.255.255.0', '10.0.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1331', '10.0.4.253', '10.0.4.0', '255.255.255.0', '10.0.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1332', '10.0.4.254', '10.0.4.0', '255.255.255.0', '10.0.4.254', '默认网关地址', '');
INSERT INTO `netmget_ipmanage` VALUES ('1333', '10.5.4.1', '10.5.4.0', '255.255.255.0', '10.5.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1334', '10.5.4.2', '10.5.4.0', '255.255.255.0', '10.5.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1335', '10.5.4.3', '10.5.4.0', '255.255.255.0', '10.5.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1336', '10.5.4.4', '10.5.4.0', '255.255.255.0', '10.5.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1337', '10.5.4.5', '10.5.4.0', '255.255.255.0', '10.5.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1338', '10.5.4.6', '10.5.4.0', '255.255.255.0', '10.5.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1339', '10.5.4.7', '10.5.4.0', '255.255.255.0', '10.5.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1340', '10.5.4.8', '10.5.4.0', '255.255.255.0', '10.5.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1341', '10.5.4.9', '10.5.4.0', '255.255.255.0', '10.5.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1342', '10.5.4.10', '10.5.4.0', '255.255.255.0', '10.5.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1343', '10.5.4.11', '10.5.4.0', '255.255.255.0', '10.5.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1344', '10.5.4.12', '10.5.4.0', '255.255.255.0', '10.5.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1345', '10.5.4.13', '10.5.4.0', '255.255.255.0', '10.5.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1346', '10.5.4.14', '10.5.4.0', '255.255.255.0', '10.5.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1347', '10.5.4.15', '10.5.4.0', '255.255.255.0', '10.5.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1348', '10.5.4.16', '10.5.4.0', '255.255.255.0', '10.5.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1349', '10.5.4.17', '10.5.4.0', '255.255.255.0', '10.5.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1350', '10.5.4.18', '10.5.4.0', '255.255.255.0', '10.5.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1351', '10.5.4.19', '10.5.4.0', '255.255.255.0', '10.5.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1352', '10.5.4.20', '10.5.4.0', '255.255.255.0', '10.5.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1353', '10.5.4.21', '10.5.4.0', '255.255.255.0', '10.5.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1354', '10.5.4.22', '10.5.4.0', '255.255.255.0', '10.5.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1355', '10.5.4.23', '10.5.4.0', '255.255.255.0', '10.5.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1356', '10.5.4.24', '10.5.4.0', '255.255.255.0', '10.5.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1357', '10.5.4.25', '10.5.4.0', '255.255.255.0', '10.5.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1358', '10.5.4.26', '10.5.4.0', '255.255.255.0', '10.5.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1359', '10.5.4.27', '10.5.4.0', '255.255.255.0', '10.5.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1360', '10.5.4.28', '10.5.4.0', '255.255.255.0', '10.5.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1361', '10.5.4.29', '10.5.4.0', '255.255.255.0', '10.5.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1362', '10.5.4.30', '10.5.4.0', '255.255.255.0', '10.5.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1363', '10.5.4.31', '10.5.4.0', '255.255.255.0', '10.5.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1364', '10.5.4.32', '10.5.4.0', '255.255.255.0', '10.5.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1365', '10.5.4.33', '10.5.4.0', '255.255.255.0', '10.5.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1366', '10.5.4.34', '10.5.4.0', '255.255.255.0', '10.5.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1367', '10.5.4.35', '10.5.4.0', '255.255.255.0', '10.5.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1368', '10.5.4.36', '10.5.4.0', '255.255.255.0', '10.5.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1369', '10.5.4.37', '10.5.4.0', '255.255.255.0', '10.5.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1370', '10.5.4.38', '10.5.4.0', '255.255.255.0', '10.5.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1371', '10.5.4.39', '10.5.4.0', '255.255.255.0', '10.5.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1372', '10.5.4.40', '10.5.4.0', '255.255.255.0', '10.5.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1373', '10.5.4.41', '10.5.4.0', '255.255.255.0', '10.5.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1374', '10.5.4.42', '10.5.4.0', '255.255.255.0', '10.5.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1375', '10.5.4.43', '10.5.4.0', '255.255.255.0', '10.5.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1376', '10.5.4.44', '10.5.4.0', '255.255.255.0', '10.5.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1377', '10.5.4.45', '10.5.4.0', '255.255.255.0', '10.5.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1378', '10.5.4.46', '10.5.4.0', '255.255.255.0', '10.5.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1379', '10.5.4.47', '10.5.4.0', '255.255.255.0', '10.5.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1380', '10.5.4.48', '10.5.4.0', '255.255.255.0', '10.5.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1381', '10.5.4.49', '10.5.4.0', '255.255.255.0', '10.5.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1382', '10.5.4.50', '10.5.4.0', '255.255.255.0', '10.5.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1383', '10.5.4.51', '10.5.4.0', '255.255.255.0', '10.5.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1384', '10.5.4.52', '10.5.4.0', '255.255.255.0', '10.5.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1385', '10.5.4.53', '10.5.4.0', '255.255.255.0', '10.5.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1386', '10.5.4.54', '10.5.4.0', '255.255.255.0', '10.5.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1387', '10.5.4.55', '10.5.4.0', '255.255.255.0', '10.5.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1388', '10.5.4.56', '10.5.4.0', '255.255.255.0', '10.5.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1389', '10.5.4.57', '10.5.4.0', '255.255.255.0', '10.5.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1390', '10.5.4.58', '10.5.4.0', '255.255.255.0', '10.5.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1391', '10.5.4.59', '10.5.4.0', '255.255.255.0', '10.5.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1392', '10.5.4.60', '10.5.4.0', '255.255.255.0', '10.5.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1393', '10.5.4.61', '10.5.4.0', '255.255.255.0', '10.5.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1394', '10.5.4.62', '10.5.4.0', '255.255.255.0', '10.5.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1395', '10.5.4.63', '10.5.4.0', '255.255.255.0', '10.5.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1396', '10.5.4.64', '10.5.4.0', '255.255.255.0', '10.5.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1397', '10.5.4.65', '10.5.4.0', '255.255.255.0', '10.5.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1398', '10.5.4.66', '10.5.4.0', '255.255.255.0', '10.5.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1399', '10.5.4.67', '10.5.4.0', '255.255.255.0', '10.5.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1400', '10.5.4.68', '10.5.4.0', '255.255.255.0', '10.5.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1401', '10.5.4.69', '10.5.4.0', '255.255.255.0', '10.5.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1402', '10.5.4.70', '10.5.4.0', '255.255.255.0', '10.5.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1403', '10.5.4.71', '10.5.4.0', '255.255.255.0', '10.5.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1404', '10.5.4.72', '10.5.4.0', '255.255.255.0', '10.5.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1405', '10.5.4.73', '10.5.4.0', '255.255.255.0', '10.5.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1406', '10.5.4.74', '10.5.4.0', '255.255.255.0', '10.5.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1407', '10.5.4.75', '10.5.4.0', '255.255.255.0', '10.5.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1408', '10.5.4.76', '10.5.4.0', '255.255.255.0', '10.5.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1409', '10.5.4.77', '10.5.4.0', '255.255.255.0', '10.5.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1410', '10.5.4.78', '10.5.4.0', '255.255.255.0', '10.5.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1411', '10.5.4.79', '10.5.4.0', '255.255.255.0', '10.5.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1412', '10.5.4.80', '10.5.4.0', '255.255.255.0', '10.5.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1413', '10.5.4.81', '10.5.4.0', '255.255.255.0', '10.5.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1414', '10.5.4.82', '10.5.4.0', '255.255.255.0', '10.5.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1415', '10.5.4.83', '10.5.4.0', '255.255.255.0', '10.5.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1416', '10.5.4.84', '10.5.4.0', '255.255.255.0', '10.5.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1417', '10.5.4.85', '10.5.4.0', '255.255.255.0', '10.5.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1418', '10.5.4.86', '10.5.4.0', '255.255.255.0', '10.5.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1419', '10.5.4.87', '10.5.4.0', '255.255.255.0', '10.5.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1420', '10.5.4.88', '10.5.4.0', '255.255.255.0', '10.5.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1421', '10.5.4.89', '10.5.4.0', '255.255.255.0', '10.5.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1422', '10.5.4.90', '10.5.4.0', '255.255.255.0', '10.5.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1423', '10.5.4.91', '10.5.4.0', '255.255.255.0', '10.5.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1424', '10.5.4.92', '10.5.4.0', '255.255.255.0', '10.5.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1425', '10.5.4.93', '10.5.4.0', '255.255.255.0', '10.5.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1426', '10.5.4.94', '10.5.4.0', '255.255.255.0', '10.5.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1427', '10.5.4.95', '10.5.4.0', '255.255.255.0', '10.5.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1428', '10.5.4.96', '10.5.4.0', '255.255.255.0', '10.5.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1429', '10.5.4.97', '10.5.4.0', '255.255.255.0', '10.5.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1430', '10.5.4.98', '10.5.4.0', '255.255.255.0', '10.5.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1431', '10.5.4.99', '10.5.4.0', '255.255.255.0', '10.5.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1432', '10.5.4.100', '10.5.4.0', '255.255.255.0', '10.5.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1433', '10.5.4.101', '10.5.4.0', '255.255.255.0', '10.5.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1434', '10.5.4.102', '10.5.4.0', '255.255.255.0', '10.5.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1435', '10.5.4.103', '10.5.4.0', '255.255.255.0', '10.5.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1436', '10.5.4.104', '10.5.4.0', '255.255.255.0', '10.5.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1437', '10.5.4.105', '10.5.4.0', '255.255.255.0', '10.5.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1438', '10.5.4.106', '10.5.4.0', '255.255.255.0', '10.5.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1439', '10.5.4.107', '10.5.4.0', '255.255.255.0', '10.5.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1440', '10.5.4.108', '10.5.4.0', '255.255.255.0', '10.5.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1441', '10.5.4.109', '10.5.4.0', '255.255.255.0', '10.5.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1442', '10.5.4.110', '10.5.4.0', '255.255.255.0', '10.5.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1443', '10.5.4.111', '10.5.4.0', '255.255.255.0', '10.5.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1444', '10.5.4.112', '10.5.4.0', '255.255.255.0', '10.5.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1445', '10.5.4.113', '10.5.4.0', '255.255.255.0', '10.5.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1446', '10.5.4.114', '10.5.4.0', '255.255.255.0', '10.5.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1447', '10.5.4.115', '10.5.4.0', '255.255.255.0', '10.5.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1448', '10.5.4.116', '10.5.4.0', '255.255.255.0', '10.5.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1449', '10.5.4.117', '10.5.4.0', '255.255.255.0', '10.5.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1450', '10.5.4.118', '10.5.4.0', '255.255.255.0', '10.5.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1451', '10.5.4.119', '10.5.4.0', '255.255.255.0', '10.5.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1452', '10.5.4.120', '10.5.4.0', '255.255.255.0', '10.5.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1453', '10.5.4.121', '10.5.4.0', '255.255.255.0', '10.5.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1454', '10.5.4.122', '10.5.4.0', '255.255.255.0', '10.5.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1455', '10.5.4.123', '10.5.4.0', '255.255.255.0', '10.5.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1456', '10.5.4.124', '10.5.4.0', '255.255.255.0', '10.5.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1457', '10.5.4.125', '10.5.4.0', '255.255.255.0', '10.5.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1458', '10.5.4.126', '10.5.4.0', '255.255.255.0', '10.5.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1459', '10.5.4.127', '10.5.4.0', '255.255.255.0', '10.5.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1460', '10.5.4.128', '10.5.4.0', '255.255.255.0', '10.5.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1461', '10.5.4.129', '10.5.4.0', '255.255.255.0', '10.5.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1462', '10.5.4.130', '10.5.4.0', '255.255.255.0', '10.5.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1463', '10.5.4.131', '10.5.4.0', '255.255.255.0', '10.5.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1464', '10.5.4.132', '10.5.4.0', '255.255.255.0', '10.5.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1465', '10.5.4.133', '10.5.4.0', '255.255.255.0', '10.5.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1466', '10.5.4.134', '10.5.4.0', '255.255.255.0', '10.5.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1467', '10.5.4.135', '10.5.4.0', '255.255.255.0', '10.5.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1468', '10.5.4.136', '10.5.4.0', '255.255.255.0', '10.5.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1469', '10.5.4.137', '10.5.4.0', '255.255.255.0', '10.5.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1470', '10.5.4.138', '10.5.4.0', '255.255.255.0', '10.5.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1471', '10.5.4.139', '10.5.4.0', '255.255.255.0', '10.5.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1472', '10.5.4.140', '10.5.4.0', '255.255.255.0', '10.5.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1473', '10.5.4.141', '10.5.4.0', '255.255.255.0', '10.5.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1474', '10.5.4.142', '10.5.4.0', '255.255.255.0', '10.5.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1475', '10.5.4.143', '10.5.4.0', '255.255.255.0', '10.5.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1476', '10.5.4.144', '10.5.4.0', '255.255.255.0', '10.5.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1477', '10.5.4.145', '10.5.4.0', '255.255.255.0', '10.5.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1478', '10.5.4.146', '10.5.4.0', '255.255.255.0', '10.5.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1479', '10.5.4.147', '10.5.4.0', '255.255.255.0', '10.5.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1480', '10.5.4.148', '10.5.4.0', '255.255.255.0', '10.5.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1481', '10.5.4.149', '10.5.4.0', '255.255.255.0', '10.5.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1482', '10.5.4.150', '10.5.4.0', '255.255.255.0', '10.5.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1483', '10.5.4.151', '10.5.4.0', '255.255.255.0', '10.5.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1484', '10.5.4.152', '10.5.4.0', '255.255.255.0', '10.5.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1485', '10.5.4.153', '10.5.4.0', '255.255.255.0', '10.5.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1486', '10.5.4.154', '10.5.4.0', '255.255.255.0', '10.5.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1487', '10.5.4.155', '10.5.4.0', '255.255.255.0', '10.5.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1488', '10.5.4.156', '10.5.4.0', '255.255.255.0', '10.5.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1489', '10.5.4.157', '10.5.4.0', '255.255.255.0', '10.5.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1490', '10.5.4.158', '10.5.4.0', '255.255.255.0', '10.5.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1491', '10.5.4.159', '10.5.4.0', '255.255.255.0', '10.5.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1492', '10.5.4.160', '10.5.4.0', '255.255.255.0', '10.5.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1493', '10.5.4.161', '10.5.4.0', '255.255.255.0', '10.5.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1494', '10.5.4.162', '10.5.4.0', '255.255.255.0', '10.5.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1495', '10.5.4.163', '10.5.4.0', '255.255.255.0', '10.5.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1496', '10.5.4.164', '10.5.4.0', '255.255.255.0', '10.5.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1497', '10.5.4.165', '10.5.4.0', '255.255.255.0', '10.5.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1498', '10.5.4.166', '10.5.4.0', '255.255.255.0', '10.5.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1499', '10.5.4.167', '10.5.4.0', '255.255.255.0', '10.5.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1500', '10.5.4.168', '10.5.4.0', '255.255.255.0', '10.5.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1501', '10.5.4.169', '10.5.4.0', '255.255.255.0', '10.5.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1502', '10.5.4.170', '10.5.4.0', '255.255.255.0', '10.5.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1503', '10.5.4.171', '10.5.4.0', '255.255.255.0', '10.5.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1504', '10.5.4.172', '10.5.4.0', '255.255.255.0', '10.5.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1505', '10.5.4.173', '10.5.4.0', '255.255.255.0', '10.5.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1506', '10.5.4.174', '10.5.4.0', '255.255.255.0', '10.5.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1507', '10.5.4.175', '10.5.4.0', '255.255.255.0', '10.5.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1508', '10.5.4.176', '10.5.4.0', '255.255.255.0', '10.5.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1509', '10.5.4.177', '10.5.4.0', '255.255.255.0', '10.5.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1510', '10.5.4.178', '10.5.4.0', '255.255.255.0', '10.5.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1511', '10.5.4.179', '10.5.4.0', '255.255.255.0', '10.5.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1512', '10.5.4.180', '10.5.4.0', '255.255.255.0', '10.5.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1513', '10.5.4.181', '10.5.4.0', '255.255.255.0', '10.5.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1514', '10.5.4.182', '10.5.4.0', '255.255.255.0', '10.5.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1515', '10.5.4.183', '10.5.4.0', '255.255.255.0', '10.5.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1516', '10.5.4.184', '10.5.4.0', '255.255.255.0', '10.5.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1517', '10.5.4.185', '10.5.4.0', '255.255.255.0', '10.5.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1518', '10.5.4.186', '10.5.4.0', '255.255.255.0', '10.5.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1519', '10.5.4.187', '10.5.4.0', '255.255.255.0', '10.5.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1520', '10.5.4.188', '10.5.4.0', '255.255.255.0', '10.5.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1521', '10.5.4.189', '10.5.4.0', '255.255.255.0', '10.5.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1522', '10.5.4.190', '10.5.4.0', '255.255.255.0', '10.5.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1523', '10.5.4.191', '10.5.4.0', '255.255.255.0', '10.5.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1524', '10.5.4.192', '10.5.4.0', '255.255.255.0', '10.5.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1525', '10.5.4.193', '10.5.4.0', '255.255.255.0', '10.5.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1526', '10.5.4.194', '10.5.4.0', '255.255.255.0', '10.5.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1527', '10.5.4.195', '10.5.4.0', '255.255.255.0', '10.5.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1528', '10.5.4.196', '10.5.4.0', '255.255.255.0', '10.5.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1529', '10.5.4.197', '10.5.4.0', '255.255.255.0', '10.5.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1530', '10.5.4.198', '10.5.4.0', '255.255.255.0', '10.5.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1531', '10.5.4.199', '10.5.4.0', '255.255.255.0', '10.5.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1532', '10.5.4.200', '10.5.4.0', '255.255.255.0', '10.5.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1533', '10.5.4.201', '10.5.4.0', '255.255.255.0', '10.5.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1534', '10.5.4.202', '10.5.4.0', '255.255.255.0', '10.5.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1535', '10.5.4.203', '10.5.4.0', '255.255.255.0', '10.5.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1536', '10.5.4.204', '10.5.4.0', '255.255.255.0', '10.5.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1537', '10.5.4.205', '10.5.4.0', '255.255.255.0', '10.5.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1538', '10.5.4.206', '10.5.4.0', '255.255.255.0', '10.5.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1539', '10.5.4.207', '10.5.4.0', '255.255.255.0', '10.5.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1540', '10.5.4.208', '10.5.4.0', '255.255.255.0', '10.5.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1541', '10.5.4.209', '10.5.4.0', '255.255.255.0', '10.5.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1542', '10.5.4.210', '10.5.4.0', '255.255.255.0', '10.5.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1543', '10.5.4.211', '10.5.4.0', '255.255.255.0', '10.5.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1544', '10.5.4.212', '10.5.4.0', '255.255.255.0', '10.5.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1545', '10.5.4.213', '10.5.4.0', '255.255.255.0', '10.5.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1546', '10.5.4.214', '10.5.4.0', '255.255.255.0', '10.5.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1547', '10.5.4.215', '10.5.4.0', '255.255.255.0', '10.5.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1548', '10.5.4.216', '10.5.4.0', '255.255.255.0', '10.5.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1549', '10.5.4.217', '10.5.4.0', '255.255.255.0', '10.5.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1550', '10.5.4.218', '10.5.4.0', '255.255.255.0', '10.5.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1551', '10.5.4.219', '10.5.4.0', '255.255.255.0', '10.5.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1552', '10.5.4.220', '10.5.4.0', '255.255.255.0', '10.5.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1553', '10.5.4.221', '10.5.4.0', '255.255.255.0', '10.5.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1554', '10.5.4.222', '10.5.4.0', '255.255.255.0', '10.5.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1555', '10.5.4.223', '10.5.4.0', '255.255.255.0', '10.5.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1556', '10.5.4.224', '10.5.4.0', '255.255.255.0', '10.5.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1557', '10.5.4.225', '10.5.4.0', '255.255.255.0', '10.5.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1558', '10.5.4.226', '10.5.4.0', '255.255.255.0', '10.5.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1559', '10.5.4.227', '10.5.4.0', '255.255.255.0', '10.5.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1560', '10.5.4.228', '10.5.4.0', '255.255.255.0', '10.5.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1561', '10.5.4.229', '10.5.4.0', '255.255.255.0', '10.5.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1562', '10.5.4.230', '10.5.4.0', '255.255.255.0', '10.5.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1563', '10.5.4.231', '10.5.4.0', '255.255.255.0', '10.5.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1564', '10.5.4.232', '10.5.4.0', '255.255.255.0', '10.5.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1565', '10.5.4.233', '10.5.4.0', '255.255.255.0', '10.5.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1566', '10.5.4.234', '10.5.4.0', '255.255.255.0', '10.5.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1567', '10.5.4.235', '10.5.4.0', '255.255.255.0', '10.5.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1568', '10.5.4.236', '10.5.4.0', '255.255.255.0', '10.5.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1569', '10.5.4.237', '10.5.4.0', '255.255.255.0', '10.5.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1570', '10.5.4.238', '10.5.4.0', '255.255.255.0', '10.5.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1571', '10.5.4.239', '10.5.4.0', '255.255.255.0', '10.5.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1572', '10.5.4.240', '10.5.4.0', '255.255.255.0', '10.5.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1573', '10.5.4.241', '10.5.4.0', '255.255.255.0', '10.5.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1574', '10.5.4.242', '10.5.4.0', '255.255.255.0', '10.5.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1575', '10.5.4.243', '10.5.4.0', '255.255.255.0', '10.5.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1576', '10.5.4.244', '10.5.4.0', '255.255.255.0', '10.5.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1577', '10.5.4.245', '10.5.4.0', '255.255.255.0', '10.5.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1578', '10.5.4.246', '10.5.4.0', '255.255.255.0', '10.5.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1579', '10.5.4.247', '10.5.4.0', '255.255.255.0', '10.5.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1580', '10.5.4.248', '10.5.4.0', '255.255.255.0', '10.5.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1581', '10.5.4.249', '10.5.4.0', '255.255.255.0', '10.5.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1582', '10.5.4.250', '10.5.4.0', '255.255.255.0', '10.5.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1583', '10.5.4.251', '10.5.4.0', '255.255.255.0', '10.5.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1584', '10.5.4.252', '10.5.4.0', '255.255.255.0', '10.5.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1585', '10.5.4.253', '10.5.4.0', '255.255.255.0', '10.5.4.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1586', '10.5.4.254', '10.5.4.0', '255.255.255.0', '10.5.4.254', '默认网关地址', '');
INSERT INTO `netmget_ipmanage` VALUES ('1587', '10.0.12.1', '10.0.12.0', '255.255.255.0', '	10.0.12.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1588', '10.0.12.2', '10.0.12.0', '255.255.255.0', '	10.0.12.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1589', '10.0.12.3', '10.0.12.0', '255.255.255.0', '	10.0.12.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1590', '10.0.12.4', '10.0.12.0', '255.255.255.0', '	10.0.12.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1591', '10.0.12.5', '10.0.12.0', '255.255.255.0', '	10.0.12.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1592', '10.0.12.6', '10.0.12.0', '255.255.255.0', '	10.0.12.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1593', '10.0.12.7', '10.0.12.0', '255.255.255.0', '	10.0.12.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1594', '10.0.12.8', '10.0.12.0', '255.255.255.0', '	10.0.12.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1595', '10.0.12.9', '10.0.12.0', '255.255.255.0', '	10.0.12.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1596', '10.0.12.10', '10.0.12.0', '255.255.255.0', '	10.0.12.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1597', '10.0.12.11', '10.0.12.0', '255.255.255.0', '	10.0.12.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1598', '10.0.12.12', '10.0.12.0', '255.255.255.0', '	10.0.12.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1599', '10.0.12.13', '10.0.12.0', '255.255.255.0', '	10.0.12.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1600', '10.0.12.14', '10.0.12.0', '255.255.255.0', '	10.0.12.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1601', '10.0.12.15', '10.0.12.0', '255.255.255.0', '	10.0.12.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1602', '10.0.12.16', '10.0.12.0', '255.255.255.0', '	10.0.12.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1603', '10.0.12.17', '10.0.12.0', '255.255.255.0', '	10.0.12.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1604', '10.0.12.18', '10.0.12.0', '255.255.255.0', '	10.0.12.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1605', '10.0.12.19', '10.0.12.0', '255.255.255.0', '	10.0.12.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1606', '10.0.12.20', '10.0.12.0', '255.255.255.0', '	10.0.12.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1607', '10.0.12.21', '10.0.12.0', '255.255.255.0', '	10.0.12.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1608', '10.0.12.22', '10.0.12.0', '255.255.255.0', '	10.0.12.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1609', '10.0.12.23', '10.0.12.0', '255.255.255.0', '	10.0.12.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1610', '10.0.12.24', '10.0.12.0', '255.255.255.0', '	10.0.12.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1611', '10.0.12.25', '10.0.12.0', '255.255.255.0', '	10.0.12.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1612', '10.0.12.26', '10.0.12.0', '255.255.255.0', '	10.0.12.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1613', '10.0.12.27', '10.0.12.0', '255.255.255.0', '	10.0.12.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1614', '10.0.12.28', '10.0.12.0', '255.255.255.0', '	10.0.12.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1615', '10.0.12.29', '10.0.12.0', '255.255.255.0', '	10.0.12.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1616', '10.0.12.30', '10.0.12.0', '255.255.255.0', '	10.0.12.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1617', '10.0.12.31', '10.0.12.0', '255.255.255.0', '	10.0.12.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1618', '10.0.12.32', '10.0.12.0', '255.255.255.0', '	10.0.12.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1619', '10.0.12.33', '10.0.12.0', '255.255.255.0', '	10.0.12.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1620', '10.0.12.34', '10.0.12.0', '255.255.255.0', '	10.0.12.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1621', '10.0.12.35', '10.0.12.0', '255.255.255.0', '	10.0.12.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1622', '10.0.12.36', '10.0.12.0', '255.255.255.0', '	10.0.12.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1623', '10.0.12.37', '10.0.12.0', '255.255.255.0', '	10.0.12.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1624', '10.0.12.38', '10.0.12.0', '255.255.255.0', '	10.0.12.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1625', '10.0.12.39', '10.0.12.0', '255.255.255.0', '	10.0.12.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1626', '10.0.12.40', '10.0.12.0', '255.255.255.0', '	10.0.12.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1627', '10.0.12.41', '10.0.12.0', '255.255.255.0', '	10.0.12.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1628', '10.0.12.42', '10.0.12.0', '255.255.255.0', '	10.0.12.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1629', '10.0.12.43', '10.0.12.0', '255.255.255.0', '	10.0.12.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1630', '10.0.12.44', '10.0.12.0', '255.255.255.0', '	10.0.12.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1631', '10.0.12.45', '10.0.12.0', '255.255.255.0', '	10.0.12.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1632', '10.0.12.46', '10.0.12.0', '255.255.255.0', '	10.0.12.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1633', '10.0.12.47', '10.0.12.0', '255.255.255.0', '	10.0.12.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1634', '10.0.12.48', '10.0.12.0', '255.255.255.0', '	10.0.12.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1635', '10.0.12.49', '10.0.12.0', '255.255.255.0', '	10.0.12.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1636', '10.0.12.50', '10.0.12.0', '255.255.255.0', '	10.0.12.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1637', '10.0.12.51', '10.0.12.0', '255.255.255.0', '	10.0.12.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1638', '10.0.12.52', '10.0.12.0', '255.255.255.0', '	10.0.12.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1639', '10.0.12.53', '10.0.12.0', '255.255.255.0', '	10.0.12.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1640', '10.0.12.54', '10.0.12.0', '255.255.255.0', '	10.0.12.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1641', '10.0.12.55', '10.0.12.0', '255.255.255.0', '	10.0.12.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1642', '10.0.12.56', '10.0.12.0', '255.255.255.0', '	10.0.12.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1643', '10.0.12.57', '10.0.12.0', '255.255.255.0', '	10.0.12.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1644', '10.0.12.58', '10.0.12.0', '255.255.255.0', '	10.0.12.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1645', '10.0.12.59', '10.0.12.0', '255.255.255.0', '	10.0.12.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1646', '10.0.12.60', '10.0.12.0', '255.255.255.0', '	10.0.12.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1647', '10.0.12.61', '10.0.12.0', '255.255.255.0', '	10.0.12.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1648', '10.0.12.62', '10.0.12.0', '255.255.255.0', '	10.0.12.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1649', '10.0.12.63', '10.0.12.0', '255.255.255.0', '	10.0.12.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1650', '10.0.12.64', '10.0.12.0', '255.255.255.0', '	10.0.12.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1651', '10.0.12.65', '10.0.12.0', '255.255.255.0', '	10.0.12.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1652', '10.0.12.66', '10.0.12.0', '255.255.255.0', '	10.0.12.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1653', '10.0.12.67', '10.0.12.0', '255.255.255.0', '	10.0.12.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1654', '10.0.12.68', '10.0.12.0', '255.255.255.0', '	10.0.12.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1655', '10.0.12.69', '10.0.12.0', '255.255.255.0', '	10.0.12.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1656', '10.0.12.70', '10.0.12.0', '255.255.255.0', '	10.0.12.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1657', '10.0.12.71', '10.0.12.0', '255.255.255.0', '	10.0.12.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1658', '10.0.12.72', '10.0.12.0', '255.255.255.0', '	10.0.12.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1659', '10.0.12.73', '10.0.12.0', '255.255.255.0', '	10.0.12.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1660', '10.0.12.74', '10.0.12.0', '255.255.255.0', '	10.0.12.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1661', '10.0.12.75', '10.0.12.0', '255.255.255.0', '	10.0.12.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1662', '10.0.12.76', '10.0.12.0', '255.255.255.0', '	10.0.12.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1663', '10.0.12.77', '10.0.12.0', '255.255.255.0', '	10.0.12.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1664', '10.0.12.78', '10.0.12.0', '255.255.255.0', '	10.0.12.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1665', '10.0.12.79', '10.0.12.0', '255.255.255.0', '	10.0.12.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1666', '10.0.12.80', '10.0.12.0', '255.255.255.0', '	10.0.12.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1667', '10.0.12.81', '10.0.12.0', '255.255.255.0', '	10.0.12.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1668', '10.0.12.82', '10.0.12.0', '255.255.255.0', '	10.0.12.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1669', '10.0.12.83', '10.0.12.0', '255.255.255.0', '	10.0.12.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1670', '10.0.12.84', '10.0.12.0', '255.255.255.0', '	10.0.12.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1671', '10.0.12.85', '10.0.12.0', '255.255.255.0', '	10.0.12.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1672', '10.0.12.86', '10.0.12.0', '255.255.255.0', '	10.0.12.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1673', '10.0.12.87', '10.0.12.0', '255.255.255.0', '	10.0.12.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1674', '10.0.12.88', '10.0.12.0', '255.255.255.0', '	10.0.12.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1675', '10.0.12.89', '10.0.12.0', '255.255.255.0', '	10.0.12.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1676', '10.0.12.90', '10.0.12.0', '255.255.255.0', '	10.0.12.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1677', '10.0.12.91', '10.0.12.0', '255.255.255.0', '	10.0.12.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1678', '10.0.12.92', '10.0.12.0', '255.255.255.0', '	10.0.12.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1679', '10.0.12.93', '10.0.12.0', '255.255.255.0', '	10.0.12.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1680', '10.0.12.94', '10.0.12.0', '255.255.255.0', '	10.0.12.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1681', '10.0.12.95', '10.0.12.0', '255.255.255.0', '	10.0.12.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1682', '10.0.12.96', '10.0.12.0', '255.255.255.0', '	10.0.12.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1683', '10.0.12.97', '10.0.12.0', '255.255.255.0', '	10.0.12.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1684', '10.0.12.98', '10.0.12.0', '255.255.255.0', '	10.0.12.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1685', '10.0.12.99', '10.0.12.0', '255.255.255.0', '	10.0.12.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1686', '10.0.12.100', '10.0.12.0', '255.255.255.0', '	10.0.12.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1687', '10.0.12.101', '10.0.12.0', '255.255.255.0', '	10.0.12.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1688', '10.0.12.102', '10.0.12.0', '255.255.255.0', '	10.0.12.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1689', '10.0.12.103', '10.0.12.0', '255.255.255.0', '	10.0.12.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1690', '10.0.12.104', '10.0.12.0', '255.255.255.0', '	10.0.12.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1691', '10.0.12.105', '10.0.12.0', '255.255.255.0', '	10.0.12.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1692', '10.0.12.106', '10.0.12.0', '255.255.255.0', '	10.0.12.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1693', '10.0.12.107', '10.0.12.0', '255.255.255.0', '	10.0.12.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1694', '10.0.12.108', '10.0.12.0', '255.255.255.0', '	10.0.12.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1695', '10.0.12.109', '10.0.12.0', '255.255.255.0', '	10.0.12.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1696', '10.0.12.110', '10.0.12.0', '255.255.255.0', '	10.0.12.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1697', '10.0.12.111', '10.0.12.0', '255.255.255.0', '	10.0.12.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1698', '10.0.12.112', '10.0.12.0', '255.255.255.0', '	10.0.12.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1699', '10.0.12.113', '10.0.12.0', '255.255.255.0', '	10.0.12.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1700', '10.0.12.114', '10.0.12.0', '255.255.255.0', '	10.0.12.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1701', '10.0.12.115', '10.0.12.0', '255.255.255.0', '	10.0.12.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1702', '10.0.12.116', '10.0.12.0', '255.255.255.0', '	10.0.12.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1703', '10.0.12.117', '10.0.12.0', '255.255.255.0', '	10.0.12.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1704', '10.0.12.118', '10.0.12.0', '255.255.255.0', '	10.0.12.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1705', '10.0.12.119', '10.0.12.0', '255.255.255.0', '	10.0.12.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1706', '10.0.12.120', '10.0.12.0', '255.255.255.0', '	10.0.12.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1707', '10.0.12.121', '10.0.12.0', '255.255.255.0', '	10.0.12.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1708', '10.0.12.122', '10.0.12.0', '255.255.255.0', '	10.0.12.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1709', '10.0.12.123', '10.0.12.0', '255.255.255.0', '	10.0.12.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1710', '10.0.12.124', '10.0.12.0', '255.255.255.0', '	10.0.12.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1711', '10.0.12.125', '10.0.12.0', '255.255.255.0', '	10.0.12.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1712', '10.0.12.126', '10.0.12.0', '255.255.255.0', '	10.0.12.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1713', '10.0.12.127', '10.0.12.0', '255.255.255.0', '	10.0.12.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1714', '10.0.12.128', '10.0.12.0', '255.255.255.0', '	10.0.12.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1715', '10.0.12.129', '10.0.12.0', '255.255.255.0', '	10.0.12.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1716', '10.0.12.130', '10.0.12.0', '255.255.255.0', '	10.0.12.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1717', '10.0.12.131', '10.0.12.0', '255.255.255.0', '	10.0.12.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1718', '10.0.12.132', '10.0.12.0', '255.255.255.0', '	10.0.12.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1719', '10.0.12.133', '10.0.12.0', '255.255.255.0', '	10.0.12.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1720', '10.0.12.134', '10.0.12.0', '255.255.255.0', '	10.0.12.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1721', '10.0.12.135', '10.0.12.0', '255.255.255.0', '	10.0.12.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1722', '10.0.12.136', '10.0.12.0', '255.255.255.0', '	10.0.12.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1723', '10.0.12.137', '10.0.12.0', '255.255.255.0', '	10.0.12.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1724', '10.0.12.138', '10.0.12.0', '255.255.255.0', '	10.0.12.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1725', '10.0.12.139', '10.0.12.0', '255.255.255.0', '	10.0.12.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1726', '10.0.12.140', '10.0.12.0', '255.255.255.0', '	10.0.12.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1727', '10.0.12.141', '10.0.12.0', '255.255.255.0', '	10.0.12.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1728', '10.0.12.142', '10.0.12.0', '255.255.255.0', '	10.0.12.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1729', '10.0.12.143', '10.0.12.0', '255.255.255.0', '	10.0.12.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1730', '10.0.12.144', '10.0.12.0', '255.255.255.0', '	10.0.12.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1731', '10.0.12.145', '10.0.12.0', '255.255.255.0', '	10.0.12.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1732', '10.0.12.146', '10.0.12.0', '255.255.255.0', '	10.0.12.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1733', '10.0.12.147', '10.0.12.0', '255.255.255.0', '	10.0.12.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1734', '10.0.12.148', '10.0.12.0', '255.255.255.0', '	10.0.12.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1735', '10.0.12.149', '10.0.12.0', '255.255.255.0', '	10.0.12.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1736', '10.0.12.150', '10.0.12.0', '255.255.255.0', '	10.0.12.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1737', '10.0.12.151', '10.0.12.0', '255.255.255.0', '	10.0.12.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1738', '10.0.12.152', '10.0.12.0', '255.255.255.0', '	10.0.12.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1739', '10.0.12.153', '10.0.12.0', '255.255.255.0', '	10.0.12.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1740', '10.0.12.154', '10.0.12.0', '255.255.255.0', '	10.0.12.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1741', '10.0.12.155', '10.0.12.0', '255.255.255.0', '	10.0.12.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1742', '10.0.12.156', '10.0.12.0', '255.255.255.0', '	10.0.12.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1743', '10.0.12.157', '10.0.12.0', '255.255.255.0', '	10.0.12.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1744', '10.0.12.158', '10.0.12.0', '255.255.255.0', '	10.0.12.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1745', '10.0.12.159', '10.0.12.0', '255.255.255.0', '	10.0.12.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1746', '10.0.12.160', '10.0.12.0', '255.255.255.0', '	10.0.12.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1747', '10.0.12.161', '10.0.12.0', '255.255.255.0', '	10.0.12.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1748', '10.0.12.162', '10.0.12.0', '255.255.255.0', '	10.0.12.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1749', '10.0.12.163', '10.0.12.0', '255.255.255.0', '	10.0.12.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1750', '10.0.12.164', '10.0.12.0', '255.255.255.0', '	10.0.12.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1751', '10.0.12.165', '10.0.12.0', '255.255.255.0', '	10.0.12.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1752', '10.0.12.166', '10.0.12.0', '255.255.255.0', '	10.0.12.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1753', '10.0.12.167', '10.0.12.0', '255.255.255.0', '	10.0.12.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1754', '10.0.12.168', '10.0.12.0', '255.255.255.0', '	10.0.12.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1755', '10.0.12.169', '10.0.12.0', '255.255.255.0', '	10.0.12.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1756', '10.0.12.170', '10.0.12.0', '255.255.255.0', '	10.0.12.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1757', '10.0.12.171', '10.0.12.0', '255.255.255.0', '	10.0.12.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1758', '10.0.12.172', '10.0.12.0', '255.255.255.0', '	10.0.12.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1759', '10.0.12.173', '10.0.12.0', '255.255.255.0', '	10.0.12.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1760', '10.0.12.174', '10.0.12.0', '255.255.255.0', '	10.0.12.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1761', '10.0.12.175', '10.0.12.0', '255.255.255.0', '	10.0.12.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1762', '10.0.12.176', '10.0.12.0', '255.255.255.0', '	10.0.12.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1763', '10.0.12.177', '10.0.12.0', '255.255.255.0', '	10.0.12.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1764', '10.0.12.178', '10.0.12.0', '255.255.255.0', '	10.0.12.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1765', '10.0.12.179', '10.0.12.0', '255.255.255.0', '	10.0.12.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1766', '10.0.12.180', '10.0.12.0', '255.255.255.0', '	10.0.12.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1767', '10.0.12.181', '10.0.12.0', '255.255.255.0', '	10.0.12.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1768', '10.0.12.182', '10.0.12.0', '255.255.255.0', '	10.0.12.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1769', '10.0.12.183', '10.0.12.0', '255.255.255.0', '	10.0.12.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1770', '10.0.12.184', '10.0.12.0', '255.255.255.0', '	10.0.12.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1771', '10.0.12.185', '10.0.12.0', '255.255.255.0', '	10.0.12.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1772', '10.0.12.186', '10.0.12.0', '255.255.255.0', '	10.0.12.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1773', '10.0.12.187', '10.0.12.0', '255.255.255.0', '	10.0.12.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1774', '10.0.12.188', '10.0.12.0', '255.255.255.0', '	10.0.12.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1775', '10.0.12.189', '10.0.12.0', '255.255.255.0', '	10.0.12.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1776', '10.0.12.190', '10.0.12.0', '255.255.255.0', '	10.0.12.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1777', '10.0.12.191', '10.0.12.0', '255.255.255.0', '	10.0.12.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1778', '10.0.12.192', '10.0.12.0', '255.255.255.0', '	10.0.12.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1779', '10.0.12.193', '10.0.12.0', '255.255.255.0', '	10.0.12.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1780', '10.0.12.194', '10.0.12.0', '255.255.255.0', '	10.0.12.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1781', '10.0.12.195', '10.0.12.0', '255.255.255.0', '	10.0.12.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1782', '10.0.12.196', '10.0.12.0', '255.255.255.0', '	10.0.12.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1783', '10.0.12.197', '10.0.12.0', '255.255.255.0', '	10.0.12.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1784', '10.0.12.198', '10.0.12.0', '255.255.255.0', '	10.0.12.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1785', '10.0.12.199', '10.0.12.0', '255.255.255.0', '	10.0.12.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1786', '10.0.12.200', '10.0.12.0', '255.255.255.0', '	10.0.12.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1787', '10.0.12.201', '10.0.12.0', '255.255.255.0', '	10.0.12.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1788', '10.0.12.202', '10.0.12.0', '255.255.255.0', '	10.0.12.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1789', '10.0.12.203', '10.0.12.0', '255.255.255.0', '	10.0.12.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1790', '10.0.12.204', '10.0.12.0', '255.255.255.0', '	10.0.12.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1791', '10.0.12.205', '10.0.12.0', '255.255.255.0', '	10.0.12.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1792', '10.0.12.206', '10.0.12.0', '255.255.255.0', '	10.0.12.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1793', '10.0.12.207', '10.0.12.0', '255.255.255.0', '	10.0.12.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1794', '10.0.12.208', '10.0.12.0', '255.255.255.0', '	10.0.12.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1795', '10.0.12.209', '10.0.12.0', '255.255.255.0', '	10.0.12.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1796', '10.0.12.210', '10.0.12.0', '255.255.255.0', '	10.0.12.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1797', '10.0.12.211', '10.0.12.0', '255.255.255.0', '	10.0.12.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1798', '10.0.12.212', '10.0.12.0', '255.255.255.0', '	10.0.12.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1799', '10.0.12.213', '10.0.12.0', '255.255.255.0', '	10.0.12.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1800', '10.0.12.214', '10.0.12.0', '255.255.255.0', '	10.0.12.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1801', '10.0.12.215', '10.0.12.0', '255.255.255.0', '	10.0.12.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1802', '10.0.12.216', '10.0.12.0', '255.255.255.0', '	10.0.12.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1803', '10.0.12.217', '10.0.12.0', '255.255.255.0', '	10.0.12.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1804', '10.0.12.218', '10.0.12.0', '255.255.255.0', '	10.0.12.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1805', '10.0.12.219', '10.0.12.0', '255.255.255.0', '	10.0.12.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1806', '10.0.12.220', '10.0.12.0', '255.255.255.0', '	10.0.12.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1807', '10.0.12.221', '10.0.12.0', '255.255.255.0', '	10.0.12.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1808', '10.0.12.222', '10.0.12.0', '255.255.255.0', '	10.0.12.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1809', '10.0.12.223', '10.0.12.0', '255.255.255.0', '	10.0.12.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1810', '10.0.12.224', '10.0.12.0', '255.255.255.0', '	10.0.12.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1811', '10.0.12.225', '10.0.12.0', '255.255.255.0', '	10.0.12.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1812', '10.0.12.226', '10.0.12.0', '255.255.255.0', '	10.0.12.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1813', '10.0.12.227', '10.0.12.0', '255.255.255.0', '	10.0.12.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1814', '10.0.12.228', '10.0.12.0', '255.255.255.0', '	10.0.12.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1815', '10.0.12.229', '10.0.12.0', '255.255.255.0', '	10.0.12.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1816', '10.0.12.230', '10.0.12.0', '255.255.255.0', '	10.0.12.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1817', '10.0.12.231', '10.0.12.0', '255.255.255.0', '	10.0.12.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1818', '10.0.12.232', '10.0.12.0', '255.255.255.0', '	10.0.12.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1819', '10.0.12.233', '10.0.12.0', '255.255.255.0', '	10.0.12.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1820', '10.0.12.234', '10.0.12.0', '255.255.255.0', '	10.0.12.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1821', '10.0.12.235', '10.0.12.0', '255.255.255.0', '	10.0.12.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1822', '10.0.12.236', '10.0.12.0', '255.255.255.0', '	10.0.12.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1823', '10.0.12.237', '10.0.12.0', '255.255.255.0', '	10.0.12.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1824', '10.0.12.238', '10.0.12.0', '255.255.255.0', '	10.0.12.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1825', '10.0.12.239', '10.0.12.0', '255.255.255.0', '	10.0.12.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1826', '10.0.12.240', '10.0.12.0', '255.255.255.0', '	10.0.12.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1827', '10.0.12.241', '10.0.12.0', '255.255.255.0', '	10.0.12.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1828', '10.0.12.242', '10.0.12.0', '255.255.255.0', '	10.0.12.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1829', '10.0.12.243', '10.0.12.0', '255.255.255.0', '	10.0.12.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1830', '10.0.12.244', '10.0.12.0', '255.255.255.0', '	10.0.12.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1831', '10.0.12.245', '10.0.12.0', '255.255.255.0', '	10.0.12.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1832', '10.0.12.246', '10.0.12.0', '255.255.255.0', '	10.0.12.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1833', '10.0.12.247', '10.0.12.0', '255.255.255.0', '	10.0.12.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1834', '10.0.12.248', '10.0.12.0', '255.255.255.0', '	10.0.12.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1835', '10.0.12.249', '10.0.12.0', '255.255.255.0', '	10.0.12.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1836', '10.0.12.250', '10.0.12.0', '255.255.255.0', '	10.0.12.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1837', '10.0.12.251', '10.0.12.0', '255.255.255.0', '	10.0.12.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1838', '10.0.12.252', '10.0.12.0', '255.255.255.0', '	10.0.12.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1839', '10.0.12.253', '10.0.12.0', '255.255.255.0', '	10.0.12.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1840', '10.0.12.254', '10.0.12.0', '255.255.255.0', '	10.0.12.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1841', '10.0.9.1', '10.0.9.0', '255.255.255.0', '	10.0.9.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1842', '10.0.9.2', '10.0.9.0', '255.255.255.0', '	10.0.9.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1843', '10.0.9.3', '10.0.9.0', '255.255.255.0', '	10.0.9.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1844', '10.0.9.4', '10.0.9.0', '255.255.255.0', '	10.0.9.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1845', '10.0.9.5', '10.0.9.0', '255.255.255.0', '	10.0.9.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1846', '10.0.9.6', '10.0.9.0', '255.255.255.0', '	10.0.9.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1847', '10.0.9.7', '10.0.9.0', '255.255.255.0', '	10.0.9.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1848', '10.0.9.8', '10.0.9.0', '255.255.255.0', '	10.0.9.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1849', '10.0.9.9', '10.0.9.0', '255.255.255.0', '	10.0.9.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1850', '10.0.9.10', '10.0.9.0', '255.255.255.0', '	10.0.9.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1851', '10.0.9.11', '10.0.9.0', '255.255.255.0', '	10.0.9.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1852', '10.0.9.12', '10.0.9.0', '255.255.255.0', '	10.0.9.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1853', '10.0.9.13', '10.0.9.0', '255.255.255.0', '	10.0.9.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1854', '10.0.9.14', '10.0.9.0', '255.255.255.0', '	10.0.9.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1855', '10.0.9.15', '10.0.9.0', '255.255.255.0', '	10.0.9.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1856', '10.0.9.16', '10.0.9.0', '255.255.255.0', '	10.0.9.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1857', '10.0.9.17', '10.0.9.0', '255.255.255.0', '	10.0.9.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1858', '10.0.9.18', '10.0.9.0', '255.255.255.0', '	10.0.9.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1859', '10.0.9.19', '10.0.9.0', '255.255.255.0', '	10.0.9.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1860', '10.0.9.20', '10.0.9.0', '255.255.255.0', '	10.0.9.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1861', '10.0.9.21', '10.0.9.0', '255.255.255.0', '	10.0.9.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1862', '10.0.9.22', '10.0.9.0', '255.255.255.0', '	10.0.9.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1863', '10.0.9.23', '10.0.9.0', '255.255.255.0', '	10.0.9.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1864', '10.0.9.24', '10.0.9.0', '255.255.255.0', '	10.0.9.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1865', '10.0.9.25', '10.0.9.0', '255.255.255.0', '	10.0.9.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1866', '10.0.9.26', '10.0.9.0', '255.255.255.0', '	10.0.9.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1867', '10.0.9.27', '10.0.9.0', '255.255.255.0', '	10.0.9.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1868', '10.0.9.28', '10.0.9.0', '255.255.255.0', '	10.0.9.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1869', '10.0.9.29', '10.0.9.0', '255.255.255.0', '	10.0.9.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1870', '10.0.9.30', '10.0.9.0', '255.255.255.0', '	10.0.9.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1871', '10.0.9.31', '10.0.9.0', '255.255.255.0', '	10.0.9.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1872', '10.0.9.32', '10.0.9.0', '255.255.255.0', '	10.0.9.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1873', '10.0.9.33', '10.0.9.0', '255.255.255.0', '	10.0.9.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1874', '10.0.9.34', '10.0.9.0', '255.255.255.0', '	10.0.9.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1875', '10.0.9.35', '10.0.9.0', '255.255.255.0', '	10.0.9.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1876', '10.0.9.36', '10.0.9.0', '255.255.255.0', '	10.0.9.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1877', '10.0.9.37', '10.0.9.0', '255.255.255.0', '	10.0.9.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1878', '10.0.9.38', '10.0.9.0', '255.255.255.0', '	10.0.9.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1879', '10.0.9.39', '10.0.9.0', '255.255.255.0', '	10.0.9.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1880', '10.0.9.40', '10.0.9.0', '255.255.255.0', '	10.0.9.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1881', '10.0.9.41', '10.0.9.0', '255.255.255.0', '	10.0.9.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1882', '10.0.9.42', '10.0.9.0', '255.255.255.0', '	10.0.9.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1883', '10.0.9.43', '10.0.9.0', '255.255.255.0', '	10.0.9.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1884', '10.0.9.44', '10.0.9.0', '255.255.255.0', '	10.0.9.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1885', '10.0.9.45', '10.0.9.0', '255.255.255.0', '	10.0.9.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1886', '10.0.9.46', '10.0.9.0', '255.255.255.0', '	10.0.9.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1887', '10.0.9.47', '10.0.9.0', '255.255.255.0', '	10.0.9.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1888', '10.0.9.48', '10.0.9.0', '255.255.255.0', '	10.0.9.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1889', '10.0.9.49', '10.0.9.0', '255.255.255.0', '	10.0.9.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1890', '10.0.9.50', '10.0.9.0', '255.255.255.0', '	10.0.9.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1891', '10.0.9.51', '10.0.9.0', '255.255.255.0', '	10.0.9.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1892', '10.0.9.52', '10.0.9.0', '255.255.255.0', '	10.0.9.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1893', '10.0.9.53', '10.0.9.0', '255.255.255.0', '	10.0.9.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1894', '10.0.9.54', '10.0.9.0', '255.255.255.0', '	10.0.9.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1895', '10.0.9.55', '10.0.9.0', '255.255.255.0', '	10.0.9.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1896', '10.0.9.56', '10.0.9.0', '255.255.255.0', '	10.0.9.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1897', '10.0.9.57', '10.0.9.0', '255.255.255.0', '	10.0.9.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1898', '10.0.9.58', '10.0.9.0', '255.255.255.0', '	10.0.9.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1899', '10.0.9.59', '10.0.9.0', '255.255.255.0', '	10.0.9.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1900', '10.0.9.60', '10.0.9.0', '255.255.255.0', '	10.0.9.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1901', '10.0.9.61', '10.0.9.0', '255.255.255.0', '	10.0.9.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1902', '10.0.9.62', '10.0.9.0', '255.255.255.0', '	10.0.9.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1903', '10.0.9.63', '10.0.9.0', '255.255.255.0', '	10.0.9.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1904', '10.0.9.64', '10.0.9.0', '255.255.255.0', '	10.0.9.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1905', '10.0.9.65', '10.0.9.0', '255.255.255.0', '	10.0.9.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1906', '10.0.9.66', '10.0.9.0', '255.255.255.0', '	10.0.9.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1907', '10.0.9.67', '10.0.9.0', '255.255.255.0', '	10.0.9.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1908', '10.0.9.68', '10.0.9.0', '255.255.255.0', '	10.0.9.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1909', '10.0.9.69', '10.0.9.0', '255.255.255.0', '	10.0.9.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1910', '10.0.9.70', '10.0.9.0', '255.255.255.0', '	10.0.9.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1911', '10.0.9.71', '10.0.9.0', '255.255.255.0', '	10.0.9.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1912', '10.0.9.72', '10.0.9.0', '255.255.255.0', '	10.0.9.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1913', '10.0.9.73', '10.0.9.0', '255.255.255.0', '	10.0.9.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1914', '10.0.9.74', '10.0.9.0', '255.255.255.0', '	10.0.9.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1915', '10.0.9.75', '10.0.9.0', '255.255.255.0', '	10.0.9.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1916', '10.0.9.76', '10.0.9.0', '255.255.255.0', '	10.0.9.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1917', '10.0.9.77', '10.0.9.0', '255.255.255.0', '	10.0.9.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1918', '10.0.9.78', '10.0.9.0', '255.255.255.0', '	10.0.9.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1919', '10.0.9.79', '10.0.9.0', '255.255.255.0', '	10.0.9.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1920', '10.0.9.80', '10.0.9.0', '255.255.255.0', '	10.0.9.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1921', '10.0.9.81', '10.0.9.0', '255.255.255.0', '	10.0.9.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1922', '10.0.9.82', '10.0.9.0', '255.255.255.0', '	10.0.9.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1923', '10.0.9.83', '10.0.9.0', '255.255.255.0', '	10.0.9.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1924', '10.0.9.84', '10.0.9.0', '255.255.255.0', '	10.0.9.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1925', '10.0.9.85', '10.0.9.0', '255.255.255.0', '	10.0.9.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1926', '10.0.9.86', '10.0.9.0', '255.255.255.0', '	10.0.9.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1927', '10.0.9.87', '10.0.9.0', '255.255.255.0', '	10.0.9.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1928', '10.0.9.88', '10.0.9.0', '255.255.255.0', '	10.0.9.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1929', '10.0.9.89', '10.0.9.0', '255.255.255.0', '	10.0.9.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1930', '10.0.9.90', '10.0.9.0', '255.255.255.0', '	10.0.9.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1931', '10.0.9.91', '10.0.9.0', '255.255.255.0', '	10.0.9.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1932', '10.0.9.92', '10.0.9.0', '255.255.255.0', '	10.0.9.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1933', '10.0.9.93', '10.0.9.0', '255.255.255.0', '	10.0.9.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1934', '10.0.9.94', '10.0.9.0', '255.255.255.0', '	10.0.9.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1935', '10.0.9.95', '10.0.9.0', '255.255.255.0', '	10.0.9.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1936', '10.0.9.96', '10.0.9.0', '255.255.255.0', '	10.0.9.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1937', '10.0.9.97', '10.0.9.0', '255.255.255.0', '	10.0.9.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1938', '10.0.9.98', '10.0.9.0', '255.255.255.0', '	10.0.9.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1939', '10.0.9.99', '10.0.9.0', '255.255.255.0', '	10.0.9.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1940', '10.0.9.100', '10.0.9.0', '255.255.255.0', '	10.0.9.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1941', '10.0.9.101', '10.0.9.0', '255.255.255.0', '	10.0.9.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1942', '10.0.9.102', '10.0.9.0', '255.255.255.0', '	10.0.9.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1943', '10.0.9.103', '10.0.9.0', '255.255.255.0', '	10.0.9.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1944', '10.0.9.104', '10.0.9.0', '255.255.255.0', '	10.0.9.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1945', '10.0.9.105', '10.0.9.0', '255.255.255.0', '	10.0.9.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1946', '10.0.9.106', '10.0.9.0', '255.255.255.0', '	10.0.9.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1947', '10.0.9.107', '10.0.9.0', '255.255.255.0', '	10.0.9.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1948', '10.0.9.108', '10.0.9.0', '255.255.255.0', '	10.0.9.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1949', '10.0.9.109', '10.0.9.0', '255.255.255.0', '	10.0.9.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1950', '10.0.9.110', '10.0.9.0', '255.255.255.0', '	10.0.9.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1951', '10.0.9.111', '10.0.9.0', '255.255.255.0', '	10.0.9.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1952', '10.0.9.112', '10.0.9.0', '255.255.255.0', '	10.0.9.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1953', '10.0.9.113', '10.0.9.0', '255.255.255.0', '	10.0.9.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1954', '10.0.9.114', '10.0.9.0', '255.255.255.0', '	10.0.9.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1955', '10.0.9.115', '10.0.9.0', '255.255.255.0', '	10.0.9.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1956', '10.0.9.116', '10.0.9.0', '255.255.255.0', '	10.0.9.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1957', '10.0.9.117', '10.0.9.0', '255.255.255.0', '	10.0.9.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1958', '10.0.9.118', '10.0.9.0', '255.255.255.0', '	10.0.9.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1959', '10.0.9.119', '10.0.9.0', '255.255.255.0', '	10.0.9.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1960', '10.0.9.120', '10.0.9.0', '255.255.255.0', '	10.0.9.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1961', '10.0.9.121', '10.0.9.0', '255.255.255.0', '	10.0.9.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1962', '10.0.9.122', '10.0.9.0', '255.255.255.0', '	10.0.9.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1963', '10.0.9.123', '10.0.9.0', '255.255.255.0', '	10.0.9.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1964', '10.0.9.124', '10.0.9.0', '255.255.255.0', '	10.0.9.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1965', '10.0.9.125', '10.0.9.0', '255.255.255.0', '	10.0.9.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1966', '10.0.9.126', '10.0.9.0', '255.255.255.0', '	10.0.9.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1967', '10.0.9.127', '10.0.9.0', '255.255.255.0', '	10.0.9.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1968', '10.0.9.128', '10.0.9.0', '255.255.255.0', '	10.0.9.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1969', '10.0.9.129', '10.0.9.0', '255.255.255.0', '	10.0.9.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1970', '10.0.9.130', '10.0.9.0', '255.255.255.0', '	10.0.9.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1971', '10.0.9.131', '10.0.9.0', '255.255.255.0', '	10.0.9.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1972', '10.0.9.132', '10.0.9.0', '255.255.255.0', '	10.0.9.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1973', '10.0.9.133', '10.0.9.0', '255.255.255.0', '	10.0.9.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1974', '10.0.9.134', '10.0.9.0', '255.255.255.0', '	10.0.9.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1975', '10.0.9.135', '10.0.9.0', '255.255.255.0', '	10.0.9.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1976', '10.0.9.136', '10.0.9.0', '255.255.255.0', '	10.0.9.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1977', '10.0.9.137', '10.0.9.0', '255.255.255.0', '	10.0.9.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1978', '10.0.9.138', '10.0.9.0', '255.255.255.0', '	10.0.9.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1979', '10.0.9.139', '10.0.9.0', '255.255.255.0', '	10.0.9.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1980', '10.0.9.140', '10.0.9.0', '255.255.255.0', '	10.0.9.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1981', '10.0.9.141', '10.0.9.0', '255.255.255.0', '	10.0.9.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1982', '10.0.9.142', '10.0.9.0', '255.255.255.0', '	10.0.9.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1983', '10.0.9.143', '10.0.9.0', '255.255.255.0', '	10.0.9.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1984', '10.0.9.144', '10.0.9.0', '255.255.255.0', '	10.0.9.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1985', '10.0.9.145', '10.0.9.0', '255.255.255.0', '	10.0.9.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1986', '10.0.9.146', '10.0.9.0', '255.255.255.0', '	10.0.9.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1987', '10.0.9.147', '10.0.9.0', '255.255.255.0', '	10.0.9.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1988', '10.0.9.148', '10.0.9.0', '255.255.255.0', '	10.0.9.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1989', '10.0.9.149', '10.0.9.0', '255.255.255.0', '	10.0.9.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1990', '10.0.9.150', '10.0.9.0', '255.255.255.0', '	10.0.9.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1991', '10.0.9.151', '10.0.9.0', '255.255.255.0', '	10.0.9.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1992', '10.0.9.152', '10.0.9.0', '255.255.255.0', '	10.0.9.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1993', '10.0.9.153', '10.0.9.0', '255.255.255.0', '	10.0.9.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1994', '10.0.9.154', '10.0.9.0', '255.255.255.0', '	10.0.9.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1995', '10.0.9.155', '10.0.9.0', '255.255.255.0', '	10.0.9.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1996', '10.0.9.156', '10.0.9.0', '255.255.255.0', '	10.0.9.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1997', '10.0.9.157', '10.0.9.0', '255.255.255.0', '	10.0.9.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1998', '10.0.9.158', '10.0.9.0', '255.255.255.0', '	10.0.9.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('1999', '10.0.9.159', '10.0.9.0', '255.255.255.0', '	10.0.9.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2000', '10.0.9.160', '10.0.9.0', '255.255.255.0', '	10.0.9.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2001', '10.0.9.161', '10.0.9.0', '255.255.255.0', '	10.0.9.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2002', '10.0.9.162', '10.0.9.0', '255.255.255.0', '	10.0.9.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2003', '10.0.9.163', '10.0.9.0', '255.255.255.0', '	10.0.9.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2004', '10.0.9.164', '10.0.9.0', '255.255.255.0', '	10.0.9.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2005', '10.0.9.165', '10.0.9.0', '255.255.255.0', '	10.0.9.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2006', '10.0.9.166', '10.0.9.0', '255.255.255.0', '	10.0.9.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2007', '10.0.9.167', '10.0.9.0', '255.255.255.0', '	10.0.9.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2008', '10.0.9.168', '10.0.9.0', '255.255.255.0', '	10.0.9.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2009', '10.0.9.169', '10.0.9.0', '255.255.255.0', '	10.0.9.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2010', '10.0.9.170', '10.0.9.0', '255.255.255.0', '	10.0.9.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2011', '10.0.9.171', '10.0.9.0', '255.255.255.0', '	10.0.9.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2012', '10.0.9.172', '10.0.9.0', '255.255.255.0', '	10.0.9.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2013', '10.0.9.173', '10.0.9.0', '255.255.255.0', '	10.0.9.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2014', '10.0.9.174', '10.0.9.0', '255.255.255.0', '	10.0.9.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2015', '10.0.9.175', '10.0.9.0', '255.255.255.0', '	10.0.9.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2016', '10.0.9.176', '10.0.9.0', '255.255.255.0', '	10.0.9.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2017', '10.0.9.177', '10.0.9.0', '255.255.255.0', '	10.0.9.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2018', '10.0.9.178', '10.0.9.0', '255.255.255.0', '	10.0.9.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2019', '10.0.9.179', '10.0.9.0', '255.255.255.0', '	10.0.9.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2020', '10.0.9.180', '10.0.9.0', '255.255.255.0', '	10.0.9.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2021', '10.0.9.181', '10.0.9.0', '255.255.255.0', '	10.0.9.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2022', '10.0.9.182', '10.0.9.0', '255.255.255.0', '	10.0.9.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2023', '10.0.9.183', '10.0.9.0', '255.255.255.0', '	10.0.9.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2024', '10.0.9.184', '10.0.9.0', '255.255.255.0', '	10.0.9.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2025', '10.0.9.185', '10.0.9.0', '255.255.255.0', '	10.0.9.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2026', '10.0.9.186', '10.0.9.0', '255.255.255.0', '	10.0.9.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2027', '10.0.9.187', '10.0.9.0', '255.255.255.0', '	10.0.9.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2028', '10.0.9.188', '10.0.9.0', '255.255.255.0', '	10.0.9.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2029', '10.0.9.189', '10.0.9.0', '255.255.255.0', '	10.0.9.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2030', '10.0.9.190', '10.0.9.0', '255.255.255.0', '	10.0.9.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2031', '10.0.9.191', '10.0.9.0', '255.255.255.0', '	10.0.9.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2032', '10.0.9.192', '10.0.9.0', '255.255.255.0', '	10.0.9.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2033', '10.0.9.193', '10.0.9.0', '255.255.255.0', '	10.0.9.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2034', '10.0.9.194', '10.0.9.0', '255.255.255.0', '	10.0.9.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2035', '10.0.9.195', '10.0.9.0', '255.255.255.0', '	10.0.9.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2036', '10.0.9.196', '10.0.9.0', '255.255.255.0', '	10.0.9.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2037', '10.0.9.197', '10.0.9.0', '255.255.255.0', '	10.0.9.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2038', '10.0.9.198', '10.0.9.0', '255.255.255.0', '	10.0.9.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2039', '10.0.9.199', '10.0.9.0', '255.255.255.0', '	10.0.9.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2040', '10.0.9.200', '10.0.9.0', '255.255.255.0', '	10.0.9.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2041', '10.0.9.201', '10.0.9.0', '255.255.255.0', '	10.0.9.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2042', '10.0.9.202', '10.0.9.0', '255.255.255.0', '	10.0.9.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2043', '10.0.9.203', '10.0.9.0', '255.255.255.0', '	10.0.9.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2044', '10.0.9.204', '10.0.9.0', '255.255.255.0', '	10.0.9.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2045', '10.0.9.205', '10.0.9.0', '255.255.255.0', '	10.0.9.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2046', '10.0.9.206', '10.0.9.0', '255.255.255.0', '	10.0.9.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2047', '10.0.9.207', '10.0.9.0', '255.255.255.0', '	10.0.9.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2048', '10.0.9.208', '10.0.9.0', '255.255.255.0', '	10.0.9.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2049', '10.0.9.209', '10.0.9.0', '255.255.255.0', '	10.0.9.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2050', '10.0.9.210', '10.0.9.0', '255.255.255.0', '	10.0.9.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2051', '10.0.9.211', '10.0.9.0', '255.255.255.0', '	10.0.9.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2052', '10.0.9.212', '10.0.9.0', '255.255.255.0', '	10.0.9.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2053', '10.0.9.213', '10.0.9.0', '255.255.255.0', '	10.0.9.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2054', '10.0.9.214', '10.0.9.0', '255.255.255.0', '	10.0.9.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2055', '10.0.9.215', '10.0.9.0', '255.255.255.0', '	10.0.9.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2056', '10.0.9.216', '10.0.9.0', '255.255.255.0', '	10.0.9.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2057', '10.0.9.217', '10.0.9.0', '255.255.255.0', '	10.0.9.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2058', '10.0.9.218', '10.0.9.0', '255.255.255.0', '	10.0.9.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2059', '10.0.9.219', '10.0.9.0', '255.255.255.0', '	10.0.9.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2060', '10.0.9.220', '10.0.9.0', '255.255.255.0', '	10.0.9.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2061', '10.0.9.221', '10.0.9.0', '255.255.255.0', '	10.0.9.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2062', '10.0.9.222', '10.0.9.0', '255.255.255.0', '	10.0.9.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2063', '10.0.9.223', '10.0.9.0', '255.255.255.0', '	10.0.9.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2064', '10.0.9.224', '10.0.9.0', '255.255.255.0', '	10.0.9.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2065', '10.0.9.225', '10.0.9.0', '255.255.255.0', '	10.0.9.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2066', '10.0.9.226', '10.0.9.0', '255.255.255.0', '	10.0.9.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2067', '10.0.9.227', '10.0.9.0', '255.255.255.0', '	10.0.9.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2068', '10.0.9.228', '10.0.9.0', '255.255.255.0', '	10.0.9.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2069', '10.0.9.229', '10.0.9.0', '255.255.255.0', '	10.0.9.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2070', '10.0.9.230', '10.0.9.0', '255.255.255.0', '	10.0.9.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2071', '10.0.9.231', '10.0.9.0', '255.255.255.0', '	10.0.9.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2072', '10.0.9.232', '10.0.9.0', '255.255.255.0', '	10.0.9.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2073', '10.0.9.233', '10.0.9.0', '255.255.255.0', '	10.0.9.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2074', '10.0.9.234', '10.0.9.0', '255.255.255.0', '	10.0.9.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2075', '10.0.9.235', '10.0.9.0', '255.255.255.0', '	10.0.9.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2076', '10.0.9.236', '10.0.9.0', '255.255.255.0', '	10.0.9.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2077', '10.0.9.237', '10.0.9.0', '255.255.255.0', '	10.0.9.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2078', '10.0.9.238', '10.0.9.0', '255.255.255.0', '	10.0.9.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2079', '10.0.9.239', '10.0.9.0', '255.255.255.0', '	10.0.9.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2080', '10.0.9.240', '10.0.9.0', '255.255.255.0', '	10.0.9.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2081', '10.0.9.241', '10.0.9.0', '255.255.255.0', '	10.0.9.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2082', '10.0.9.242', '10.0.9.0', '255.255.255.0', '	10.0.9.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2083', '10.0.9.243', '10.0.9.0', '255.255.255.0', '	10.0.9.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2084', '10.0.9.244', '10.0.9.0', '255.255.255.0', '	10.0.9.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2085', '10.0.9.245', '10.0.9.0', '255.255.255.0', '	10.0.9.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2086', '10.0.9.246', '10.0.9.0', '255.255.255.0', '	10.0.9.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2087', '10.0.9.247', '10.0.9.0', '255.255.255.0', '	10.0.9.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2088', '10.0.9.248', '10.0.9.0', '255.255.255.0', '	10.0.9.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2089', '10.0.9.249', '10.0.9.0', '255.255.255.0', '	10.0.9.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2090', '10.0.9.250', '10.0.9.0', '255.255.255.0', '	10.0.9.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2091', '10.0.9.251', '10.0.9.0', '255.255.255.0', '	10.0.9.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2092', '10.0.9.252', '10.0.9.0', '255.255.255.0', '	10.0.9.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2093', '10.0.9.253', '10.0.9.0', '255.255.255.0', '	10.0.9.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2094', '10.0.9.254', '10.0.9.0', '255.255.255.0', '	10.0.9.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2095', '192.168.169.1', '192.168.169.0', '255.255.255.0', '	192.168.169.254', '默认网关', '请勿修改');
INSERT INTO `netmget_ipmanage` VALUES ('2096', '192.168.169.2', '192.168.169.0', '255.255.255.0', '	192.168.169.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2097', '192.168.169.3', '192.168.169.0', '255.255.255.0', '	192.168.169.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2098', '192.168.169.4', '192.168.169.0', '255.255.255.0', '	192.168.169.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2099', '192.168.169.5', '192.168.169.0', '255.255.255.0', '	192.168.169.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2100', '192.168.169.6', '192.168.169.0', '255.255.255.0', '	192.168.169.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2101', '192.168.169.7', '192.168.169.0', '255.255.255.0', '	192.168.169.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2102', '192.168.169.8', '192.168.169.0', '255.255.255.0', '	192.168.169.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2103', '192.168.169.9', '192.168.169.0', '255.255.255.0', '	192.168.169.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2104', '192.168.169.10', '192.168.169.0', '255.255.255.0', '	192.168.169.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2105', '192.168.169.11', '192.168.169.0', '255.255.255.0', '	192.168.169.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2106', '192.168.169.12', '192.168.169.0', '255.255.255.0', '	192.168.169.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2107', '192.168.169.13', '192.168.169.0', '255.255.255.0', '	192.168.169.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2108', '192.168.169.14', '192.168.169.0', '255.255.255.0', '	192.168.169.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2109', '192.168.169.15', '192.168.169.0', '255.255.255.0', '	192.168.169.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2110', '192.168.169.16', '192.168.169.0', '255.255.255.0', '	192.168.169.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2111', '192.168.169.17', '192.168.169.0', '255.255.255.0', '	192.168.169.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2112', '192.168.169.18', '192.168.169.0', '255.255.255.0', '	192.168.169.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2113', '192.168.169.19', '192.168.169.0', '255.255.255.0', '	192.168.169.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2114', '192.168.169.20', '192.168.169.0', '255.255.255.0', '	192.168.169.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2115', '192.168.169.21', '192.168.169.0', '255.255.255.0', '	192.168.169.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2116', '192.168.169.22', '192.168.169.0', '255.255.255.0', '	192.168.169.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2117', '192.168.169.23', '192.168.169.0', '255.255.255.0', '	192.168.169.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2118', '192.168.169.24', '192.168.169.0', '255.255.255.0', '	192.168.169.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2119', '192.168.169.25', '192.168.169.0', '255.255.255.0', '	192.168.169.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2120', '192.168.169.26', '192.168.169.0', '255.255.255.0', '	192.168.169.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2121', '192.168.169.27', '192.168.169.0', '255.255.255.0', '	192.168.169.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2122', '192.168.169.28', '192.168.169.0', '255.255.255.0', '	192.168.169.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2123', '192.168.169.29', '192.168.169.0', '255.255.255.0', '	192.168.169.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2124', '192.168.169.30', '192.168.169.0', '255.255.255.0', '	192.168.169.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2125', '192.168.169.31', '192.168.169.0', '255.255.255.0', '	192.168.169.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2126', '192.168.169.32', '192.168.169.0', '255.255.255.0', '	192.168.169.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2127', '192.168.169.33', '192.168.169.0', '255.255.255.0', '	192.168.169.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2128', '192.168.169.34', '192.168.169.0', '255.255.255.0', '	192.168.169.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2129', '192.168.169.35', '192.168.169.0', '255.255.255.0', '	192.168.169.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2130', '192.168.169.36', '192.168.169.0', '255.255.255.0', '	192.168.169.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2131', '192.168.169.37', '192.168.169.0', '255.255.255.0', '	192.168.169.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2132', '192.168.169.38', '192.168.169.0', '255.255.255.0', '	192.168.169.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2133', '192.168.169.39', '192.168.169.0', '255.255.255.0', '	192.168.169.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2134', '192.168.169.40', '192.168.169.0', '255.255.255.0', '	192.168.169.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2135', '192.168.169.41', '192.168.169.0', '255.255.255.0', '	192.168.169.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2136', '192.168.169.42', '192.168.169.0', '255.255.255.0', '	192.168.169.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2137', '192.168.169.43', '192.168.169.0', '255.255.255.0', '	192.168.169.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2138', '192.168.169.44', '192.168.169.0', '255.255.255.0', '	192.168.169.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2139', '192.168.169.45', '192.168.169.0', '255.255.255.0', '	192.168.169.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2140', '192.168.169.46', '192.168.169.0', '255.255.255.0', '	192.168.169.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2141', '192.168.169.47', '192.168.169.0', '255.255.255.0', '	192.168.169.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2142', '192.168.169.48', '192.168.169.0', '255.255.255.0', '	192.168.169.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2143', '192.168.169.49', '192.168.169.0', '255.255.255.0', '	192.168.169.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2144', '192.168.169.50', '192.168.169.0', '255.255.255.0', '	192.168.169.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2145', '192.168.169.51', '192.168.169.0', '255.255.255.0', '	192.168.169.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2146', '192.168.169.52', '192.168.169.0', '255.255.255.0', '	192.168.169.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2147', '192.168.169.53', '192.168.169.0', '255.255.255.0', '	192.168.169.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2148', '192.168.169.54', '192.168.169.0', '255.255.255.0', '	192.168.169.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2149', '192.168.169.55', '192.168.169.0', '255.255.255.0', '	192.168.169.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2150', '192.168.169.56', '192.168.169.0', '255.255.255.0', '	192.168.169.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2151', '192.168.169.57', '192.168.169.0', '255.255.255.0', '	192.168.169.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2152', '192.168.169.58', '192.168.169.0', '255.255.255.0', '	192.168.169.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2153', '192.168.169.59', '192.168.169.0', '255.255.255.0', '	192.168.169.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2154', '192.168.169.60', '192.168.169.0', '255.255.255.0', '	192.168.169.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2155', '192.168.169.61', '192.168.169.0', '255.255.255.0', '	192.168.169.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2156', '192.168.169.62', '192.168.169.0', '255.255.255.0', '	192.168.169.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2157', '192.168.169.63', '192.168.169.0', '255.255.255.0', '	192.168.169.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2158', '192.168.169.64', '192.168.169.0', '255.255.255.0', '	192.168.169.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2159', '192.168.169.65', '192.168.169.0', '255.255.255.0', '	192.168.169.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2160', '192.168.169.66', '192.168.169.0', '255.255.255.0', '	192.168.169.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2161', '192.168.169.67', '192.168.169.0', '255.255.255.0', '	192.168.169.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2162', '192.168.169.68', '192.168.169.0', '255.255.255.0', '	192.168.169.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2163', '192.168.169.69', '192.168.169.0', '255.255.255.0', '	192.168.169.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2164', '192.168.169.70', '192.168.169.0', '255.255.255.0', '	192.168.169.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2165', '192.168.169.71', '192.168.169.0', '255.255.255.0', '	192.168.169.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2166', '192.168.169.72', '192.168.169.0', '255.255.255.0', '	192.168.169.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2167', '192.168.169.73', '192.168.169.0', '255.255.255.0', '	192.168.169.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2168', '192.168.169.74', '192.168.169.0', '255.255.255.0', '	192.168.169.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2169', '192.168.169.75', '192.168.169.0', '255.255.255.0', '	192.168.169.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2170', '192.168.169.76', '192.168.169.0', '255.255.255.0', '	192.168.169.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2171', '192.168.169.77', '192.168.169.0', '255.255.255.0', '	192.168.169.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2172', '192.168.169.78', '192.168.169.0', '255.255.255.0', '	192.168.169.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2173', '192.168.169.79', '192.168.169.0', '255.255.255.0', '	192.168.169.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2174', '192.168.169.80', '192.168.169.0', '255.255.255.0', '	192.168.169.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2175', '192.168.169.81', '192.168.169.0', '255.255.255.0', '	192.168.169.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2176', '192.168.169.82', '192.168.169.0', '255.255.255.0', '	192.168.169.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2177', '192.168.169.83', '192.168.169.0', '255.255.255.0', '	192.168.169.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2178', '192.168.169.84', '192.168.169.0', '255.255.255.0', '	192.168.169.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2179', '192.168.169.85', '192.168.169.0', '255.255.255.0', '	192.168.169.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2180', '192.168.169.86', '192.168.169.0', '255.255.255.0', '	192.168.169.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2181', '192.168.169.87', '192.168.169.0', '255.255.255.0', '	192.168.169.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2182', '192.168.169.88', '192.168.169.0', '255.255.255.0', '	192.168.169.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2183', '192.168.169.89', '192.168.169.0', '255.255.255.0', '	192.168.169.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2184', '192.168.169.90', '192.168.169.0', '255.255.255.0', '	192.168.169.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2185', '192.168.169.91', '192.168.169.0', '255.255.255.0', '	192.168.169.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2186', '192.168.169.92', '192.168.169.0', '255.255.255.0', '	192.168.169.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2187', '192.168.169.93', '192.168.169.0', '255.255.255.0', '	192.168.169.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2188', '192.168.169.94', '192.168.169.0', '255.255.255.0', '	192.168.169.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2189', '192.168.169.95', '192.168.169.0', '255.255.255.0', '	192.168.169.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2190', '192.168.169.96', '192.168.169.0', '255.255.255.0', '	192.168.169.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2191', '192.168.169.97', '192.168.169.0', '255.255.255.0', '	192.168.169.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2192', '192.168.169.98', '192.168.169.0', '255.255.255.0', '	192.168.169.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2193', '192.168.169.99', '192.168.169.0', '255.255.255.0', '	192.168.169.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2194', '192.168.169.100', '192.168.169.0', '255.255.255.0', '	192.168.169.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2195', '192.168.169.101', '192.168.169.0', '255.255.255.0', '	192.168.169.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2196', '192.168.169.102', '192.168.169.0', '255.255.255.0', '	192.168.169.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2197', '192.168.169.103', '192.168.169.0', '255.255.255.0', '	192.168.169.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2198', '192.168.169.104', '192.168.169.0', '255.255.255.0', '	192.168.169.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2199', '192.168.169.105', '192.168.169.0', '255.255.255.0', '	192.168.169.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2200', '192.168.169.106', '192.168.169.0', '255.255.255.0', '	192.168.169.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2201', '192.168.169.107', '192.168.169.0', '255.255.255.0', '	192.168.169.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2202', '192.168.169.108', '192.168.169.0', '255.255.255.0', '	192.168.169.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2203', '192.168.169.109', '192.168.169.0', '255.255.255.0', '	192.168.169.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2204', '192.168.169.110', '192.168.169.0', '255.255.255.0', '	192.168.169.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2205', '192.168.169.111', '192.168.169.0', '255.255.255.0', '	192.168.169.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2206', '192.168.169.112', '192.168.169.0', '255.255.255.0', '	192.168.169.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2207', '192.168.169.113', '192.168.169.0', '255.255.255.0', '	192.168.169.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2208', '192.168.169.114', '192.168.169.0', '255.255.255.0', '	192.168.169.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2209', '192.168.169.115', '192.168.169.0', '255.255.255.0', '	192.168.169.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2210', '192.168.169.116', '192.168.169.0', '255.255.255.0', '	192.168.169.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2211', '192.168.169.117', '192.168.169.0', '255.255.255.0', '	192.168.169.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2212', '192.168.169.118', '192.168.169.0', '255.255.255.0', '	192.168.169.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2213', '192.168.169.119', '192.168.169.0', '255.255.255.0', '	192.168.169.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2214', '192.168.169.120', '192.168.169.0', '255.255.255.0', '	192.168.169.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2215', '192.168.169.121', '192.168.169.0', '255.255.255.0', '	192.168.169.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2216', '192.168.169.122', '192.168.169.0', '255.255.255.0', '	192.168.169.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2217', '192.168.169.123', '192.168.169.0', '255.255.255.0', '	192.168.169.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2218', '192.168.169.124', '192.168.169.0', '255.255.255.0', '	192.168.169.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2219', '192.168.169.125', '192.168.169.0', '255.255.255.0', '	192.168.169.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2220', '192.168.169.126', '192.168.169.0', '255.255.255.0', '	192.168.169.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2221', '192.168.169.127', '192.168.169.0', '255.255.255.0', '	192.168.169.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2222', '192.168.169.128', '192.168.169.0', '255.255.255.0', '	192.168.169.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2223', '192.168.169.129', '192.168.169.0', '255.255.255.0', '	192.168.169.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2224', '192.168.169.130', '192.168.169.0', '255.255.255.0', '	192.168.169.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2225', '192.168.169.131', '192.168.169.0', '255.255.255.0', '	192.168.169.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2226', '192.168.169.132', '192.168.169.0', '255.255.255.0', '	192.168.169.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2227', '192.168.169.133', '192.168.169.0', '255.255.255.0', '	192.168.169.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2228', '192.168.169.134', '192.168.169.0', '255.255.255.0', '	192.168.169.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2229', '192.168.169.135', '192.168.169.0', '255.255.255.0', '	192.168.169.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2230', '192.168.169.136', '192.168.169.0', '255.255.255.0', '	192.168.169.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2231', '192.168.169.137', '192.168.169.0', '255.255.255.0', '	192.168.169.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2232', '192.168.169.138', '192.168.169.0', '255.255.255.0', '	192.168.169.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2233', '192.168.169.139', '192.168.169.0', '255.255.255.0', '	192.168.169.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2234', '192.168.169.140', '192.168.169.0', '255.255.255.0', '	192.168.169.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2235', '192.168.169.141', '192.168.169.0', '255.255.255.0', '	192.168.169.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2236', '192.168.169.142', '192.168.169.0', '255.255.255.0', '	192.168.169.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2237', '192.168.169.143', '192.168.169.0', '255.255.255.0', '	192.168.169.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2238', '192.168.169.144', '192.168.169.0', '255.255.255.0', '	192.168.169.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2239', '192.168.169.145', '192.168.169.0', '255.255.255.0', '	192.168.169.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2240', '192.168.169.146', '192.168.169.0', '255.255.255.0', '	192.168.169.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2241', '192.168.169.147', '192.168.169.0', '255.255.255.0', '	192.168.169.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2242', '192.168.169.148', '192.168.169.0', '255.255.255.0', '	192.168.169.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2243', '192.168.169.149', '192.168.169.0', '255.255.255.0', '	192.168.169.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2244', '192.168.169.150', '192.168.169.0', '255.255.255.0', '	192.168.169.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2245', '192.168.169.151', '192.168.169.0', '255.255.255.0', '	192.168.169.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2246', '192.168.169.152', '192.168.169.0', '255.255.255.0', '	192.168.169.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2247', '192.168.169.153', '192.168.169.0', '255.255.255.0', '	192.168.169.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2248', '192.168.169.154', '192.168.169.0', '255.255.255.0', '	192.168.169.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2249', '192.168.169.155', '192.168.169.0', '255.255.255.0', '	192.168.169.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2250', '192.168.169.156', '192.168.169.0', '255.255.255.0', '	192.168.169.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2251', '192.168.169.157', '192.168.169.0', '255.255.255.0', '	192.168.169.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2252', '192.168.169.158', '192.168.169.0', '255.255.255.0', '	192.168.169.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2253', '192.168.169.159', '192.168.169.0', '255.255.255.0', '	192.168.169.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2254', '192.168.169.160', '192.168.169.0', '255.255.255.0', '	192.168.169.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2255', '192.168.169.161', '192.168.169.0', '255.255.255.0', '	192.168.169.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2256', '192.168.169.162', '192.168.169.0', '255.255.255.0', '	192.168.169.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2257', '192.168.169.163', '192.168.169.0', '255.255.255.0', '	192.168.169.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2258', '192.168.169.164', '192.168.169.0', '255.255.255.0', '	192.168.169.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2259', '192.168.169.165', '192.168.169.0', '255.255.255.0', '	192.168.169.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2260', '192.168.169.166', '192.168.169.0', '255.255.255.0', '	192.168.169.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2261', '192.168.169.167', '192.168.169.0', '255.255.255.0', '	192.168.169.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2262', '192.168.169.168', '192.168.169.0', '255.255.255.0', '	192.168.169.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2263', '192.168.169.169', '192.168.169.0', '255.255.255.0', '	192.168.169.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2264', '192.168.169.170', '192.168.169.0', '255.255.255.0', '	192.168.169.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2265', '192.168.169.171', '192.168.169.0', '255.255.255.0', '	192.168.169.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2266', '192.168.169.172', '192.168.169.0', '255.255.255.0', '	192.168.169.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2267', '192.168.169.173', '192.168.169.0', '255.255.255.0', '	192.168.169.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2268', '192.168.169.174', '192.168.169.0', '255.255.255.0', '	192.168.169.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2269', '192.168.169.175', '192.168.169.0', '255.255.255.0', '	192.168.169.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2270', '192.168.169.176', '192.168.169.0', '255.255.255.0', '	192.168.169.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2271', '192.168.169.177', '192.168.169.0', '255.255.255.0', '	192.168.169.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2272', '192.168.169.178', '192.168.169.0', '255.255.255.0', '	192.168.169.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2273', '192.168.169.179', '192.168.169.0', '255.255.255.0', '	192.168.169.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2274', '192.168.169.180', '192.168.169.0', '255.255.255.0', '	192.168.169.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2275', '192.168.169.181', '192.168.169.0', '255.255.255.0', '	192.168.169.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2276', '192.168.169.182', '192.168.169.0', '255.255.255.0', '	192.168.169.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2277', '192.168.169.183', '192.168.169.0', '255.255.255.0', '	192.168.169.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2278', '192.168.169.184', '192.168.169.0', '255.255.255.0', '	192.168.169.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2279', '192.168.169.185', '192.168.169.0', '255.255.255.0', '	192.168.169.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2280', '192.168.169.186', '192.168.169.0', '255.255.255.0', '	192.168.169.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2281', '192.168.169.187', '192.168.169.0', '255.255.255.0', '	192.168.169.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2282', '192.168.169.188', '192.168.169.0', '255.255.255.0', '	192.168.169.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2283', '192.168.169.189', '192.168.169.0', '255.255.255.0', '	192.168.169.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2284', '192.168.169.190', '192.168.169.0', '255.255.255.0', '	192.168.169.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2285', '192.168.169.191', '192.168.169.0', '255.255.255.0', '	192.168.169.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2286', '192.168.169.192', '192.168.169.0', '255.255.255.0', '	192.168.169.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2287', '192.168.169.193', '192.168.169.0', '255.255.255.0', '	192.168.169.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2288', '192.168.169.194', '192.168.169.0', '255.255.255.0', '	192.168.169.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2289', '192.168.169.195', '192.168.169.0', '255.255.255.0', '	192.168.169.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2290', '192.168.169.196', '192.168.169.0', '255.255.255.0', '	192.168.169.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2291', '192.168.169.197', '192.168.169.0', '255.255.255.0', '	192.168.169.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2292', '192.168.169.198', '192.168.169.0', '255.255.255.0', '	192.168.169.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2293', '192.168.169.199', '192.168.169.0', '255.255.255.0', '	192.168.169.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2294', '192.168.169.200', '192.168.169.0', '255.255.255.0', '	192.168.169.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2295', '192.168.169.201', '192.168.169.0', '255.255.255.0', '	192.168.169.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2296', '192.168.169.202', '192.168.169.0', '255.255.255.0', '	192.168.169.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2297', '192.168.169.203', '192.168.169.0', '255.255.255.0', '	192.168.169.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2298', '192.168.169.204', '192.168.169.0', '255.255.255.0', '	192.168.169.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2299', '192.168.169.205', '192.168.169.0', '255.255.255.0', '	192.168.169.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2300', '192.168.169.206', '192.168.169.0', '255.255.255.0', '	192.168.169.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2301', '192.168.169.207', '192.168.169.0', '255.255.255.0', '	192.168.169.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2302', '192.168.169.208', '192.168.169.0', '255.255.255.0', '	192.168.169.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2303', '192.168.169.209', '192.168.169.0', '255.255.255.0', '	192.168.169.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2304', '192.168.169.210', '192.168.169.0', '255.255.255.0', '	192.168.169.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2305', '192.168.169.211', '192.168.169.0', '255.255.255.0', '	192.168.169.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2306', '192.168.169.212', '192.168.169.0', '255.255.255.0', '	192.168.169.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2307', '192.168.169.213', '192.168.169.0', '255.255.255.0', '	192.168.169.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2308', '192.168.169.214', '192.168.169.0', '255.255.255.0', '	192.168.169.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2309', '192.168.169.215', '192.168.169.0', '255.255.255.0', '	192.168.169.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2310', '192.168.169.216', '192.168.169.0', '255.255.255.0', '	192.168.169.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2311', '192.168.169.217', '192.168.169.0', '255.255.255.0', '	192.168.169.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2312', '192.168.169.218', '192.168.169.0', '255.255.255.0', '	192.168.169.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2313', '192.168.169.219', '192.168.169.0', '255.255.255.0', '	192.168.169.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2314', '192.168.169.220', '192.168.169.0', '255.255.255.0', '	192.168.169.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2315', '192.168.169.221', '192.168.169.0', '255.255.255.0', '	192.168.169.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2316', '192.168.169.222', '192.168.169.0', '255.255.255.0', '	192.168.169.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2317', '192.168.169.223', '192.168.169.0', '255.255.255.0', '	192.168.169.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2318', '192.168.169.224', '192.168.169.0', '255.255.255.0', '	192.168.169.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2319', '192.168.169.225', '192.168.169.0', '255.255.255.0', '	192.168.169.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2320', '192.168.169.226', '192.168.169.0', '255.255.255.0', '	192.168.169.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2321', '192.168.169.227', '192.168.169.0', '255.255.255.0', '	192.168.169.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2322', '192.168.169.228', '192.168.169.0', '255.255.255.0', '	192.168.169.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2323', '192.168.169.229', '192.168.169.0', '255.255.255.0', '	192.168.169.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2324', '192.168.169.230', '192.168.169.0', '255.255.255.0', '	192.168.169.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2325', '192.168.169.231', '192.168.169.0', '255.255.255.0', '	192.168.169.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2326', '192.168.169.232', '192.168.169.0', '255.255.255.0', '	192.168.169.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2327', '192.168.169.233', '192.168.169.0', '255.255.255.0', '	192.168.169.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2328', '192.168.169.234', '192.168.169.0', '255.255.255.0', '	192.168.169.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2329', '192.168.169.235', '192.168.169.0', '255.255.255.0', '	192.168.169.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2330', '192.168.169.236', '192.168.169.0', '255.255.255.0', '	192.168.169.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2331', '192.168.169.237', '192.168.169.0', '255.255.255.0', '	192.168.169.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2332', '192.168.169.238', '192.168.169.0', '255.255.255.0', '	192.168.169.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2333', '192.168.169.239', '192.168.169.0', '255.255.255.0', '	192.168.169.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2334', '192.168.169.240', '192.168.169.0', '255.255.255.0', '	192.168.169.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2335', '192.168.169.241', '192.168.169.0', '255.255.255.0', '	192.168.169.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2336', '192.168.169.242', '192.168.169.0', '255.255.255.0', '	192.168.169.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2337', '192.168.169.243', '192.168.169.0', '255.255.255.0', '	192.168.169.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2338', '192.168.169.244', '192.168.169.0', '255.255.255.0', '	192.168.169.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2339', '192.168.169.245', '192.168.169.0', '255.255.255.0', '	192.168.169.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2340', '192.168.169.246', '192.168.169.0', '255.255.255.0', '	192.168.169.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2341', '192.168.169.247', '192.168.169.0', '255.255.255.0', '	192.168.169.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2342', '192.168.169.248', '192.168.169.0', '255.255.255.0', '	192.168.169.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2343', '192.168.169.249', '192.168.169.0', '255.255.255.0', '	192.168.169.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2344', '192.168.169.250', '192.168.169.0', '255.255.255.0', '	192.168.169.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2345', '192.168.169.251', '192.168.169.0', '255.255.255.0', '	192.168.169.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2346', '192.168.169.252', '192.168.169.0', '255.255.255.0', '	192.168.169.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2347', '192.168.169.253', '192.168.169.0', '255.255.255.0', '	192.168.169.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2348', '192.168.169.254', '192.168.169.0', '255.255.255.0', '	192.168.169.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2349', '192.168.170.1', '192.168.170.0', '255.255.255.0', '	192.168.170.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2350', '192.168.170.2', '192.168.170.0', '255.255.255.0', '	192.168.170.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2351', '192.168.170.3', '192.168.170.0', '255.255.255.0', '	192.168.170.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2352', '192.168.170.4', '192.168.170.0', '255.255.255.0', '	192.168.170.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2353', '192.168.170.5', '192.168.170.0', '255.255.255.0', '	192.168.170.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2354', '192.168.170.6', '192.168.170.0', '255.255.255.0', '	192.168.170.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2355', '192.168.170.7', '192.168.170.0', '255.255.255.0', '	192.168.170.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2356', '192.168.170.8', '192.168.170.0', '255.255.255.0', '	192.168.170.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2357', '192.168.170.9', '192.168.170.0', '255.255.255.0', '	192.168.170.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2358', '192.168.170.10', '192.168.170.0', '255.255.255.0', '	192.168.170.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2359', '192.168.170.11', '192.168.170.0', '255.255.255.0', '	192.168.170.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2360', '192.168.170.12', '192.168.170.0', '255.255.255.0', '	192.168.170.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2361', '192.168.170.13', '192.168.170.0', '255.255.255.0', '	192.168.170.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2362', '192.168.170.14', '192.168.170.0', '255.255.255.0', '	192.168.170.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2363', '192.168.170.15', '192.168.170.0', '255.255.255.0', '	192.168.170.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2364', '192.168.170.16', '192.168.170.0', '255.255.255.0', '	192.168.170.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2365', '192.168.170.17', '192.168.170.0', '255.255.255.0', '	192.168.170.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2366', '192.168.170.18', '192.168.170.0', '255.255.255.0', '	192.168.170.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2367', '192.168.170.19', '192.168.170.0', '255.255.255.0', '	192.168.170.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2368', '192.168.170.20', '192.168.170.0', '255.255.255.0', '	192.168.170.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2369', '192.168.170.21', '192.168.170.0', '255.255.255.0', '	192.168.170.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2370', '192.168.170.22', '192.168.170.0', '255.255.255.0', '	192.168.170.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2371', '192.168.170.23', '192.168.170.0', '255.255.255.0', '	192.168.170.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2372', '192.168.170.24', '192.168.170.0', '255.255.255.0', '	192.168.170.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2373', '192.168.170.25', '192.168.170.0', '255.255.255.0', '	192.168.170.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2374', '192.168.170.26', '192.168.170.0', '255.255.255.0', '	192.168.170.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2375', '192.168.170.27', '192.168.170.0', '255.255.255.0', '	192.168.170.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2376', '192.168.170.28', '192.168.170.0', '255.255.255.0', '	192.168.170.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2377', '192.168.170.29', '192.168.170.0', '255.255.255.0', '	192.168.170.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2378', '192.168.170.30', '192.168.170.0', '255.255.255.0', '	192.168.170.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2379', '192.168.170.31', '192.168.170.0', '255.255.255.0', '	192.168.170.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2380', '192.168.170.32', '192.168.170.0', '255.255.255.0', '	192.168.170.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2381', '192.168.170.33', '192.168.170.0', '255.255.255.0', '	192.168.170.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2382', '192.168.170.34', '192.168.170.0', '255.255.255.0', '	192.168.170.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2383', '192.168.170.35', '192.168.170.0', '255.255.255.0', '	192.168.170.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2384', '192.168.170.36', '192.168.170.0', '255.255.255.0', '	192.168.170.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2385', '192.168.170.37', '192.168.170.0', '255.255.255.0', '	192.168.170.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2386', '192.168.170.38', '192.168.170.0', '255.255.255.0', '	192.168.170.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2387', '192.168.170.39', '192.168.170.0', '255.255.255.0', '	192.168.170.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2388', '192.168.170.40', '192.168.170.0', '255.255.255.0', '	192.168.170.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2389', '192.168.170.41', '192.168.170.0', '255.255.255.0', '	192.168.170.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2390', '192.168.170.42', '192.168.170.0', '255.255.255.0', '	192.168.170.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2391', '192.168.170.43', '192.168.170.0', '255.255.255.0', '	192.168.170.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2392', '192.168.170.44', '192.168.170.0', '255.255.255.0', '	192.168.170.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2393', '192.168.170.45', '192.168.170.0', '255.255.255.0', '	192.168.170.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2394', '192.168.170.46', '192.168.170.0', '255.255.255.0', '	192.168.170.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2395', '192.168.170.47', '192.168.170.0', '255.255.255.0', '	192.168.170.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2396', '192.168.170.48', '192.168.170.0', '255.255.255.0', '	192.168.170.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2397', '192.168.170.49', '192.168.170.0', '255.255.255.0', '	192.168.170.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2398', '192.168.170.50', '192.168.170.0', '255.255.255.0', '	192.168.170.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2399', '192.168.170.51', '192.168.170.0', '255.255.255.0', '	192.168.170.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2400', '192.168.170.52', '192.168.170.0', '255.255.255.0', '	192.168.170.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2401', '192.168.170.53', '192.168.170.0', '255.255.255.0', '	192.168.170.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2402', '192.168.170.54', '192.168.170.0', '255.255.255.0', '	192.168.170.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2403', '192.168.170.55', '192.168.170.0', '255.255.255.0', '	192.168.170.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2404', '192.168.170.56', '192.168.170.0', '255.255.255.0', '	192.168.170.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2405', '192.168.170.57', '192.168.170.0', '255.255.255.0', '	192.168.170.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2406', '192.168.170.58', '192.168.170.0', '255.255.255.0', '	192.168.170.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2407', '192.168.170.59', '192.168.170.0', '255.255.255.0', '	192.168.170.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2408', '192.168.170.60', '192.168.170.0', '255.255.255.0', '	192.168.170.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2409', '192.168.170.61', '192.168.170.0', '255.255.255.0', '	192.168.170.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2410', '192.168.170.62', '192.168.170.0', '255.255.255.0', '	192.168.170.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2411', '192.168.170.63', '192.168.170.0', '255.255.255.0', '	192.168.170.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2412', '192.168.170.64', '192.168.170.0', '255.255.255.0', '	192.168.170.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2413', '192.168.170.65', '192.168.170.0', '255.255.255.0', '	192.168.170.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2414', '192.168.170.66', '192.168.170.0', '255.255.255.0', '	192.168.170.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2415', '192.168.170.67', '192.168.170.0', '255.255.255.0', '	192.168.170.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2416', '192.168.170.68', '192.168.170.0', '255.255.255.0', '	192.168.170.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2417', '192.168.170.69', '192.168.170.0', '255.255.255.0', '	192.168.170.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2418', '192.168.170.70', '192.168.170.0', '255.255.255.0', '	192.168.170.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2419', '192.168.170.71', '192.168.170.0', '255.255.255.0', '	192.168.170.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2420', '192.168.170.72', '192.168.170.0', '255.255.255.0', '	192.168.170.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2421', '192.168.170.73', '192.168.170.0', '255.255.255.0', '	192.168.170.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2422', '192.168.170.74', '192.168.170.0', '255.255.255.0', '	192.168.170.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2423', '192.168.170.75', '192.168.170.0', '255.255.255.0', '	192.168.170.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2424', '192.168.170.76', '192.168.170.0', '255.255.255.0', '	192.168.170.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2425', '192.168.170.77', '192.168.170.0', '255.255.255.0', '	192.168.170.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2426', '192.168.170.78', '192.168.170.0', '255.255.255.0', '	192.168.170.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2427', '192.168.170.79', '192.168.170.0', '255.255.255.0', '	192.168.170.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2428', '192.168.170.80', '192.168.170.0', '255.255.255.0', '	192.168.170.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2429', '192.168.170.81', '192.168.170.0', '255.255.255.0', '	192.168.170.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2430', '192.168.170.82', '192.168.170.0', '255.255.255.0', '	192.168.170.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2431', '192.168.170.83', '192.168.170.0', '255.255.255.0', '	192.168.170.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2432', '192.168.170.84', '192.168.170.0', '255.255.255.0', '	192.168.170.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2433', '192.168.170.85', '192.168.170.0', '255.255.255.0', '	192.168.170.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2434', '192.168.170.86', '192.168.170.0', '255.255.255.0', '	192.168.170.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2435', '192.168.170.87', '192.168.170.0', '255.255.255.0', '	192.168.170.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2436', '192.168.170.88', '192.168.170.0', '255.255.255.0', '	192.168.170.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2437', '192.168.170.89', '192.168.170.0', '255.255.255.0', '	192.168.170.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2438', '192.168.170.90', '192.168.170.0', '255.255.255.0', '	192.168.170.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2439', '192.168.170.91', '192.168.170.0', '255.255.255.0', '	192.168.170.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2440', '192.168.170.92', '192.168.170.0', '255.255.255.0', '	192.168.170.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2441', '192.168.170.93', '192.168.170.0', '255.255.255.0', '	192.168.170.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2442', '192.168.170.94', '192.168.170.0', '255.255.255.0', '	192.168.170.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2443', '192.168.170.95', '192.168.170.0', '255.255.255.0', '	192.168.170.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2444', '192.168.170.96', '192.168.170.0', '255.255.255.0', '	192.168.170.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2445', '192.168.170.97', '192.168.170.0', '255.255.255.0', '	192.168.170.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2446', '192.168.170.98', '192.168.170.0', '255.255.255.0', '	192.168.170.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2447', '192.168.170.99', '192.168.170.0', '255.255.255.0', '	192.168.170.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2448', '192.168.170.100', '192.168.170.0', '255.255.255.0', '	192.168.170.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2449', '192.168.170.101', '192.168.170.0', '255.255.255.0', '	192.168.170.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2450', '192.168.170.102', '192.168.170.0', '255.255.255.0', '	192.168.170.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2451', '192.168.170.103', '192.168.170.0', '255.255.255.0', '	192.168.170.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2452', '192.168.170.104', '192.168.170.0', '255.255.255.0', '	192.168.170.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2453', '192.168.170.105', '192.168.170.0', '255.255.255.0', '	192.168.170.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2454', '192.168.170.106', '192.168.170.0', '255.255.255.0', '	192.168.170.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2455', '192.168.170.107', '192.168.170.0', '255.255.255.0', '	192.168.170.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2456', '192.168.170.108', '192.168.170.0', '255.255.255.0', '	192.168.170.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2457', '192.168.170.109', '192.168.170.0', '255.255.255.0', '	192.168.170.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2458', '192.168.170.110', '192.168.170.0', '255.255.255.0', '	192.168.170.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2459', '192.168.170.111', '192.168.170.0', '255.255.255.0', '	192.168.170.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2460', '192.168.170.112', '192.168.170.0', '255.255.255.0', '	192.168.170.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2461', '192.168.170.113', '192.168.170.0', '255.255.255.0', '	192.168.170.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2462', '192.168.170.114', '192.168.170.0', '255.255.255.0', '	192.168.170.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2463', '192.168.170.115', '192.168.170.0', '255.255.255.0', '	192.168.170.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2464', '192.168.170.116', '192.168.170.0', '255.255.255.0', '	192.168.170.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2465', '192.168.170.117', '192.168.170.0', '255.255.255.0', '	192.168.170.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2466', '192.168.170.118', '192.168.170.0', '255.255.255.0', '	192.168.170.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2467', '192.168.170.119', '192.168.170.0', '255.255.255.0', '	192.168.170.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2468', '192.168.170.120', '192.168.170.0', '255.255.255.0', '	192.168.170.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2469', '192.168.170.121', '192.168.170.0', '255.255.255.0', '	192.168.170.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2470', '192.168.170.122', '192.168.170.0', '255.255.255.0', '	192.168.170.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2471', '192.168.170.123', '192.168.170.0', '255.255.255.0', '	192.168.170.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2472', '192.168.170.124', '192.168.170.0', '255.255.255.0', '	192.168.170.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2473', '192.168.170.125', '192.168.170.0', '255.255.255.0', '	192.168.170.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2474', '192.168.170.126', '192.168.170.0', '255.255.255.0', '	192.168.170.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2475', '192.168.170.127', '192.168.170.0', '255.255.255.0', '	192.168.170.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2476', '192.168.170.128', '192.168.170.0', '255.255.255.0', '	192.168.170.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2477', '192.168.170.129', '192.168.170.0', '255.255.255.0', '	192.168.170.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2478', '192.168.170.130', '192.168.170.0', '255.255.255.0', '	192.168.170.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2479', '192.168.170.131', '192.168.170.0', '255.255.255.0', '	192.168.170.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2480', '192.168.170.132', '192.168.170.0', '255.255.255.0', '	192.168.170.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2481', '192.168.170.133', '192.168.170.0', '255.255.255.0', '	192.168.170.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2482', '192.168.170.134', '192.168.170.0', '255.255.255.0', '	192.168.170.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2483', '192.168.170.135', '192.168.170.0', '255.255.255.0', '	192.168.170.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2484', '192.168.170.136', '192.168.170.0', '255.255.255.0', '	192.168.170.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2485', '192.168.170.137', '192.168.170.0', '255.255.255.0', '	192.168.170.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2486', '192.168.170.138', '192.168.170.0', '255.255.255.0', '	192.168.170.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2487', '192.168.170.139', '192.168.170.0', '255.255.255.0', '	192.168.170.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2488', '192.168.170.140', '192.168.170.0', '255.255.255.0', '	192.168.170.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2489', '192.168.170.141', '192.168.170.0', '255.255.255.0', '	192.168.170.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2490', '192.168.170.142', '192.168.170.0', '255.255.255.0', '	192.168.170.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2491', '192.168.170.143', '192.168.170.0', '255.255.255.0', '	192.168.170.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2492', '192.168.170.144', '192.168.170.0', '255.255.255.0', '	192.168.170.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2493', '192.168.170.145', '192.168.170.0', '255.255.255.0', '	192.168.170.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2494', '192.168.170.146', '192.168.170.0', '255.255.255.0', '	192.168.170.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2495', '192.168.170.147', '192.168.170.0', '255.255.255.0', '	192.168.170.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2496', '192.168.170.148', '192.168.170.0', '255.255.255.0', '	192.168.170.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2497', '192.168.170.149', '192.168.170.0', '255.255.255.0', '	192.168.170.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2498', '192.168.170.150', '192.168.170.0', '255.255.255.0', '	192.168.170.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2499', '192.168.170.151', '192.168.170.0', '255.255.255.0', '	192.168.170.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2500', '192.168.170.152', '192.168.170.0', '255.255.255.0', '	192.168.170.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2501', '192.168.170.153', '192.168.170.0', '255.255.255.0', '	192.168.170.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2502', '192.168.170.154', '192.168.170.0', '255.255.255.0', '	192.168.170.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2503', '192.168.170.155', '192.168.170.0', '255.255.255.0', '	192.168.170.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2504', '192.168.170.156', '192.168.170.0', '255.255.255.0', '	192.168.170.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2505', '192.168.170.157', '192.168.170.0', '255.255.255.0', '	192.168.170.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2506', '192.168.170.158', '192.168.170.0', '255.255.255.0', '	192.168.170.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2507', '192.168.170.159', '192.168.170.0', '255.255.255.0', '	192.168.170.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2508', '192.168.170.160', '192.168.170.0', '255.255.255.0', '	192.168.170.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2509', '192.168.170.161', '192.168.170.0', '255.255.255.0', '	192.168.170.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2510', '192.168.170.162', '192.168.170.0', '255.255.255.0', '	192.168.170.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2511', '192.168.170.163', '192.168.170.0', '255.255.255.0', '	192.168.170.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2512', '192.168.170.164', '192.168.170.0', '255.255.255.0', '	192.168.170.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2513', '192.168.170.165', '192.168.170.0', '255.255.255.0', '	192.168.170.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2514', '192.168.170.166', '192.168.170.0', '255.255.255.0', '	192.168.170.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2515', '192.168.170.167', '192.168.170.0', '255.255.255.0', '	192.168.170.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2516', '192.168.170.168', '192.168.170.0', '255.255.255.0', '	192.168.170.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2517', '192.168.170.169', '192.168.170.0', '255.255.255.0', '	192.168.170.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2518', '192.168.170.170', '192.168.170.0', '255.255.255.0', '	192.168.170.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2519', '192.168.170.171', '192.168.170.0', '255.255.255.0', '	192.168.170.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2520', '192.168.170.172', '192.168.170.0', '255.255.255.0', '	192.168.170.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2521', '192.168.170.173', '192.168.170.0', '255.255.255.0', '	192.168.170.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2522', '192.168.170.174', '192.168.170.0', '255.255.255.0', '	192.168.170.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2523', '192.168.170.175', '192.168.170.0', '255.255.255.0', '	192.168.170.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2524', '192.168.170.176', '192.168.170.0', '255.255.255.0', '	192.168.170.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2525', '192.168.170.177', '192.168.170.0', '255.255.255.0', '	192.168.170.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2526', '192.168.170.178', '192.168.170.0', '255.255.255.0', '	192.168.170.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2527', '192.168.170.179', '192.168.170.0', '255.255.255.0', '	192.168.170.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2528', '192.168.170.180', '192.168.170.0', '255.255.255.0', '	192.168.170.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2529', '192.168.170.181', '192.168.170.0', '255.255.255.0', '	192.168.170.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2530', '192.168.170.182', '192.168.170.0', '255.255.255.0', '	192.168.170.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2531', '192.168.170.183', '192.168.170.0', '255.255.255.0', '	192.168.170.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2532', '192.168.170.184', '192.168.170.0', '255.255.255.0', '	192.168.170.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2533', '192.168.170.185', '192.168.170.0', '255.255.255.0', '	192.168.170.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2534', '192.168.170.186', '192.168.170.0', '255.255.255.0', '	192.168.170.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2535', '192.168.170.187', '192.168.170.0', '255.255.255.0', '	192.168.170.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2536', '192.168.170.188', '192.168.170.0', '255.255.255.0', '	192.168.170.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2537', '192.168.170.189', '192.168.170.0', '255.255.255.0', '	192.168.170.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2538', '192.168.170.190', '192.168.170.0', '255.255.255.0', '	192.168.170.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2539', '192.168.170.191', '192.168.170.0', '255.255.255.0', '	192.168.170.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2540', '192.168.170.192', '192.168.170.0', '255.255.255.0', '	192.168.170.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2541', '192.168.170.193', '192.168.170.0', '255.255.255.0', '	192.168.170.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2542', '192.168.170.194', '192.168.170.0', '255.255.255.0', '	192.168.170.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2543', '192.168.170.195', '192.168.170.0', '255.255.255.0', '	192.168.170.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2544', '192.168.170.196', '192.168.170.0', '255.255.255.0', '	192.168.170.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2545', '192.168.170.197', '192.168.170.0', '255.255.255.0', '	192.168.170.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2546', '192.168.170.198', '192.168.170.0', '255.255.255.0', '	192.168.170.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2547', '192.168.170.199', '192.168.170.0', '255.255.255.0', '	192.168.170.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2548', '192.168.170.200', '192.168.170.0', '255.255.255.0', '	192.168.170.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2549', '192.168.170.201', '192.168.170.0', '255.255.255.0', '	192.168.170.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2550', '192.168.170.202', '192.168.170.0', '255.255.255.0', '	192.168.170.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2551', '192.168.170.203', '192.168.170.0', '255.255.255.0', '	192.168.170.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2552', '192.168.170.204', '192.168.170.0', '255.255.255.0', '	192.168.170.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2553', '192.168.170.205', '192.168.170.0', '255.255.255.0', '	192.168.170.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2554', '192.168.170.206', '192.168.170.0', '255.255.255.0', '	192.168.170.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2555', '192.168.170.207', '192.168.170.0', '255.255.255.0', '	192.168.170.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2556', '192.168.170.208', '192.168.170.0', '255.255.255.0', '	192.168.170.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2557', '192.168.170.209', '192.168.170.0', '255.255.255.0', '	192.168.170.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2558', '192.168.170.210', '192.168.170.0', '255.255.255.0', '	192.168.170.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2559', '192.168.170.211', '192.168.170.0', '255.255.255.0', '	192.168.170.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2560', '192.168.170.212', '192.168.170.0', '255.255.255.0', '	192.168.170.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2561', '192.168.170.213', '192.168.170.0', '255.255.255.0', '	192.168.170.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2562', '192.168.170.214', '192.168.170.0', '255.255.255.0', '	192.168.170.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2563', '192.168.170.215', '192.168.170.0', '255.255.255.0', '	192.168.170.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2564', '192.168.170.216', '192.168.170.0', '255.255.255.0', '	192.168.170.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2565', '192.168.170.217', '192.168.170.0', '255.255.255.0', '	192.168.170.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2566', '192.168.170.218', '192.168.170.0', '255.255.255.0', '	192.168.170.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2567', '192.168.170.219', '192.168.170.0', '255.255.255.0', '	192.168.170.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2568', '192.168.170.220', '192.168.170.0', '255.255.255.0', '	192.168.170.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2569', '192.168.170.221', '192.168.170.0', '255.255.255.0', '	192.168.170.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2570', '192.168.170.222', '192.168.170.0', '255.255.255.0', '	192.168.170.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2571', '192.168.170.223', '192.168.170.0', '255.255.255.0', '	192.168.170.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2572', '192.168.170.224', '192.168.170.0', '255.255.255.0', '	192.168.170.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2573', '192.168.170.225', '192.168.170.0', '255.255.255.0', '	192.168.170.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2574', '192.168.170.226', '192.168.170.0', '255.255.255.0', '	192.168.170.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2575', '192.168.170.227', '192.168.170.0', '255.255.255.0', '	192.168.170.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2576', '192.168.170.228', '192.168.170.0', '255.255.255.0', '	192.168.170.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2577', '192.168.170.229', '192.168.170.0', '255.255.255.0', '	192.168.170.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2578', '192.168.170.230', '192.168.170.0', '255.255.255.0', '	192.168.170.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2579', '192.168.170.231', '192.168.170.0', '255.255.255.0', '	192.168.170.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2580', '192.168.170.232', '192.168.170.0', '255.255.255.0', '	192.168.170.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2581', '192.168.170.233', '192.168.170.0', '255.255.255.0', '	192.168.170.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2582', '192.168.170.234', '192.168.170.0', '255.255.255.0', '	192.168.170.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2583', '192.168.170.235', '192.168.170.0', '255.255.255.0', '	192.168.170.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2584', '192.168.170.236', '192.168.170.0', '255.255.255.0', '	192.168.170.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2585', '192.168.170.237', '192.168.170.0', '255.255.255.0', '	192.168.170.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2586', '192.168.170.238', '192.168.170.0', '255.255.255.0', '	192.168.170.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2587', '192.168.170.239', '192.168.170.0', '255.255.255.0', '	192.168.170.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2588', '192.168.170.240', '192.168.170.0', '255.255.255.0', '	192.168.170.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2589', '192.168.170.241', '192.168.170.0', '255.255.255.0', '	192.168.170.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2590', '192.168.170.242', '192.168.170.0', '255.255.255.0', '	192.168.170.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2591', '192.168.170.243', '192.168.170.0', '255.255.255.0', '	192.168.170.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2592', '192.168.170.244', '192.168.170.0', '255.255.255.0', '	192.168.170.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2593', '192.168.170.245', '192.168.170.0', '255.255.255.0', '	192.168.170.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2594', '192.168.170.246', '192.168.170.0', '255.255.255.0', '	192.168.170.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2595', '192.168.170.247', '192.168.170.0', '255.255.255.0', '	192.168.170.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2596', '192.168.170.248', '192.168.170.0', '255.255.255.0', '	192.168.170.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2597', '192.168.170.249', '192.168.170.0', '255.255.255.0', '	192.168.170.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2598', '192.168.170.250', '192.168.170.0', '255.255.255.0', '	192.168.170.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2599', '192.168.170.251', '192.168.170.0', '255.255.255.0', '	192.168.170.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2600', '192.168.170.252', '192.168.170.0', '255.255.255.0', '	192.168.170.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2601', '192.168.170.253', '192.168.170.0', '255.255.255.0', '	192.168.170.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2602', '192.168.170.254', '192.168.170.0', '255.255.255.0', '	192.168.170.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2603', '192.168.171.1', '192.168.171.0', '255.255.255.0', '	192.168.171.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2604', '192.168.171.2', '192.168.171.0', '255.255.255.0', '	192.168.171.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2605', '192.168.171.3', '192.168.171.0', '255.255.255.0', '	192.168.171.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2606', '192.168.171.4', '192.168.171.0', '255.255.255.0', '	192.168.171.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2607', '192.168.171.5', '192.168.171.0', '255.255.255.0', '	192.168.171.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2608', '192.168.171.6', '192.168.171.0', '255.255.255.0', '	192.168.171.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2609', '192.168.171.7', '192.168.171.0', '255.255.255.0', '	192.168.171.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2610', '192.168.171.8', '192.168.171.0', '255.255.255.0', '	192.168.171.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2611', '192.168.171.9', '192.168.171.0', '255.255.255.0', '	192.168.171.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2612', '192.168.171.10', '192.168.171.0', '255.255.255.0', '	192.168.171.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2613', '192.168.171.11', '192.168.171.0', '255.255.255.0', '	192.168.171.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2614', '192.168.171.12', '192.168.171.0', '255.255.255.0', '	192.168.171.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2615', '192.168.171.13', '192.168.171.0', '255.255.255.0', '	192.168.171.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2616', '192.168.171.14', '192.168.171.0', '255.255.255.0', '	192.168.171.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2617', '192.168.171.15', '192.168.171.0', '255.255.255.0', '	192.168.171.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2618', '192.168.171.16', '192.168.171.0', '255.255.255.0', '	192.168.171.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2619', '192.168.171.17', '192.168.171.0', '255.255.255.0', '	192.168.171.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2620', '192.168.171.18', '192.168.171.0', '255.255.255.0', '	192.168.171.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2621', '192.168.171.19', '192.168.171.0', '255.255.255.0', '	192.168.171.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2622', '192.168.171.20', '192.168.171.0', '255.255.255.0', '	192.168.171.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2623', '192.168.171.21', '192.168.171.0', '255.255.255.0', '	192.168.171.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2624', '192.168.171.22', '192.168.171.0', '255.255.255.0', '	192.168.171.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2625', '192.168.171.23', '192.168.171.0', '255.255.255.0', '	192.168.171.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2626', '192.168.171.24', '192.168.171.0', '255.255.255.0', '	192.168.171.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2627', '192.168.171.25', '192.168.171.0', '255.255.255.0', '	192.168.171.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2628', '192.168.171.26', '192.168.171.0', '255.255.255.0', '	192.168.171.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2629', '192.168.171.27', '192.168.171.0', '255.255.255.0', '	192.168.171.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2630', '192.168.171.28', '192.168.171.0', '255.255.255.0', '	192.168.171.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2631', '192.168.171.29', '192.168.171.0', '255.255.255.0', '	192.168.171.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2632', '192.168.171.30', '192.168.171.0', '255.255.255.0', '	192.168.171.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2633', '192.168.171.31', '192.168.171.0', '255.255.255.0', '	192.168.171.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2634', '192.168.171.32', '192.168.171.0', '255.255.255.0', '	192.168.171.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2635', '192.168.171.33', '192.168.171.0', '255.255.255.0', '	192.168.171.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2636', '192.168.171.34', '192.168.171.0', '255.255.255.0', '	192.168.171.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2637', '192.168.171.35', '192.168.171.0', '255.255.255.0', '	192.168.171.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2638', '192.168.171.36', '192.168.171.0', '255.255.255.0', '	192.168.171.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2639', '192.168.171.37', '192.168.171.0', '255.255.255.0', '	192.168.171.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2640', '192.168.171.38', '192.168.171.0', '255.255.255.0', '	192.168.171.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2641', '192.168.171.39', '192.168.171.0', '255.255.255.0', '	192.168.171.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2642', '192.168.171.40', '192.168.171.0', '255.255.255.0', '	192.168.171.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2643', '192.168.171.41', '192.168.171.0', '255.255.255.0', '	192.168.171.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2644', '192.168.171.42', '192.168.171.0', '255.255.255.0', '	192.168.171.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2645', '192.168.171.43', '192.168.171.0', '255.255.255.0', '	192.168.171.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2646', '192.168.171.44', '192.168.171.0', '255.255.255.0', '	192.168.171.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2647', '192.168.171.45', '192.168.171.0', '255.255.255.0', '	192.168.171.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2648', '192.168.171.46', '192.168.171.0', '255.255.255.0', '	192.168.171.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2649', '192.168.171.47', '192.168.171.0', '255.255.255.0', '	192.168.171.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2650', '192.168.171.48', '192.168.171.0', '255.255.255.0', '	192.168.171.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2651', '192.168.171.49', '192.168.171.0', '255.255.255.0', '	192.168.171.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2652', '192.168.171.50', '192.168.171.0', '255.255.255.0', '	192.168.171.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2653', '192.168.171.51', '192.168.171.0', '255.255.255.0', '	192.168.171.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2654', '192.168.171.52', '192.168.171.0', '255.255.255.0', '	192.168.171.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2655', '192.168.171.53', '192.168.171.0', '255.255.255.0', '	192.168.171.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2656', '192.168.171.54', '192.168.171.0', '255.255.255.0', '	192.168.171.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2657', '192.168.171.55', '192.168.171.0', '255.255.255.0', '	192.168.171.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2658', '192.168.171.56', '192.168.171.0', '255.255.255.0', '	192.168.171.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2659', '192.168.171.57', '192.168.171.0', '255.255.255.0', '	192.168.171.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2660', '192.168.171.58', '192.168.171.0', '255.255.255.0', '	192.168.171.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2661', '192.168.171.59', '192.168.171.0', '255.255.255.0', '	192.168.171.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2662', '192.168.171.60', '192.168.171.0', '255.255.255.0', '	192.168.171.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2663', '192.168.171.61', '192.168.171.0', '255.255.255.0', '	192.168.171.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2664', '192.168.171.62', '192.168.171.0', '255.255.255.0', '	192.168.171.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2665', '192.168.171.63', '192.168.171.0', '255.255.255.0', '	192.168.171.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2666', '192.168.171.64', '192.168.171.0', '255.255.255.0', '	192.168.171.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2667', '192.168.171.65', '192.168.171.0', '255.255.255.0', '	192.168.171.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2668', '192.168.171.66', '192.168.171.0', '255.255.255.0', '	192.168.171.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2669', '192.168.171.67', '192.168.171.0', '255.255.255.0', '	192.168.171.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2670', '192.168.171.68', '192.168.171.0', '255.255.255.0', '	192.168.171.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2671', '192.168.171.69', '192.168.171.0', '255.255.255.0', '	192.168.171.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2672', '192.168.171.70', '192.168.171.0', '255.255.255.0', '	192.168.171.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2673', '192.168.171.71', '192.168.171.0', '255.255.255.0', '	192.168.171.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2674', '192.168.171.72', '192.168.171.0', '255.255.255.0', '	192.168.171.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2675', '192.168.171.73', '192.168.171.0', '255.255.255.0', '	192.168.171.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2676', '192.168.171.74', '192.168.171.0', '255.255.255.0', '	192.168.171.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2677', '192.168.171.75', '192.168.171.0', '255.255.255.0', '	192.168.171.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2678', '192.168.171.76', '192.168.171.0', '255.255.255.0', '	192.168.171.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2679', '192.168.171.77', '192.168.171.0', '255.255.255.0', '	192.168.171.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2680', '192.168.171.78', '192.168.171.0', '255.255.255.0', '	192.168.171.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2681', '192.168.171.79', '192.168.171.0', '255.255.255.0', '	192.168.171.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2682', '192.168.171.80', '192.168.171.0', '255.255.255.0', '	192.168.171.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2683', '192.168.171.81', '192.168.171.0', '255.255.255.0', '	192.168.171.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2684', '192.168.171.82', '192.168.171.0', '255.255.255.0', '	192.168.171.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2685', '192.168.171.83', '192.168.171.0', '255.255.255.0', '	192.168.171.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2686', '192.168.171.84', '192.168.171.0', '255.255.255.0', '	192.168.171.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2687', '192.168.171.85', '192.168.171.0', '255.255.255.0', '	192.168.171.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2688', '192.168.171.86', '192.168.171.0', '255.255.255.0', '	192.168.171.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2689', '192.168.171.87', '192.168.171.0', '255.255.255.0', '	192.168.171.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2690', '192.168.171.88', '192.168.171.0', '255.255.255.0', '	192.168.171.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2691', '192.168.171.89', '192.168.171.0', '255.255.255.0', '	192.168.171.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2692', '192.168.171.90', '192.168.171.0', '255.255.255.0', '	192.168.171.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2693', '192.168.171.91', '192.168.171.0', '255.255.255.0', '	192.168.171.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2694', '192.168.171.92', '192.168.171.0', '255.255.255.0', '	192.168.171.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2695', '192.168.171.93', '192.168.171.0', '255.255.255.0', '	192.168.171.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2696', '192.168.171.94', '192.168.171.0', '255.255.255.0', '	192.168.171.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2697', '192.168.171.95', '192.168.171.0', '255.255.255.0', '	192.168.171.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2698', '192.168.171.96', '192.168.171.0', '255.255.255.0', '	192.168.171.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2699', '192.168.171.97', '192.168.171.0', '255.255.255.0', '	192.168.171.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2700', '192.168.171.98', '192.168.171.0', '255.255.255.0', '	192.168.171.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2701', '192.168.171.99', '192.168.171.0', '255.255.255.0', '	192.168.171.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2702', '192.168.171.100', '192.168.171.0', '255.255.255.0', '	192.168.171.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2703', '192.168.171.101', '192.168.171.0', '255.255.255.0', '	192.168.171.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2704', '192.168.171.102', '192.168.171.0', '255.255.255.0', '	192.168.171.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2705', '192.168.171.103', '192.168.171.0', '255.255.255.0', '	192.168.171.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2706', '192.168.171.104', '192.168.171.0', '255.255.255.0', '	192.168.171.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2707', '192.168.171.105', '192.168.171.0', '255.255.255.0', '	192.168.171.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2708', '192.168.171.106', '192.168.171.0', '255.255.255.0', '	192.168.171.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2709', '192.168.171.107', '192.168.171.0', '255.255.255.0', '	192.168.171.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2710', '192.168.171.108', '192.168.171.0', '255.255.255.0', '	192.168.171.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2711', '192.168.171.109', '192.168.171.0', '255.255.255.0', '	192.168.171.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2712', '192.168.171.110', '192.168.171.0', '255.255.255.0', '	192.168.171.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2713', '192.168.171.111', '192.168.171.0', '255.255.255.0', '	192.168.171.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2714', '192.168.171.112', '192.168.171.0', '255.255.255.0', '	192.168.171.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2715', '192.168.171.113', '192.168.171.0', '255.255.255.0', '	192.168.171.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2716', '192.168.171.114', '192.168.171.0', '255.255.255.0', '	192.168.171.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2717', '192.168.171.115', '192.168.171.0', '255.255.255.0', '	192.168.171.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2718', '192.168.171.116', '192.168.171.0', '255.255.255.0', '	192.168.171.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2719', '192.168.171.117', '192.168.171.0', '255.255.255.0', '	192.168.171.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2720', '192.168.171.118', '192.168.171.0', '255.255.255.0', '	192.168.171.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2721', '192.168.171.119', '192.168.171.0', '255.255.255.0', '	192.168.171.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2722', '192.168.171.120', '192.168.171.0', '255.255.255.0', '	192.168.171.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2723', '192.168.171.121', '192.168.171.0', '255.255.255.0', '	192.168.171.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2724', '192.168.171.122', '192.168.171.0', '255.255.255.0', '	192.168.171.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2725', '192.168.171.123', '192.168.171.0', '255.255.255.0', '	192.168.171.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2726', '192.168.171.124', '192.168.171.0', '255.255.255.0', '	192.168.171.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2727', '192.168.171.125', '192.168.171.0', '255.255.255.0', '	192.168.171.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2728', '192.168.171.126', '192.168.171.0', '255.255.255.0', '	192.168.171.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2729', '192.168.171.127', '192.168.171.0', '255.255.255.0', '	192.168.171.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2730', '192.168.171.128', '192.168.171.0', '255.255.255.0', '	192.168.171.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2731', '192.168.171.129', '192.168.171.0', '255.255.255.0', '	192.168.171.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2732', '192.168.171.130', '192.168.171.0', '255.255.255.0', '	192.168.171.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2733', '192.168.171.131', '192.168.171.0', '255.255.255.0', '	192.168.171.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2734', '192.168.171.132', '192.168.171.0', '255.255.255.0', '	192.168.171.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2735', '192.168.171.133', '192.168.171.0', '255.255.255.0', '	192.168.171.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2736', '192.168.171.134', '192.168.171.0', '255.255.255.0', '	192.168.171.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2737', '192.168.171.135', '192.168.171.0', '255.255.255.0', '	192.168.171.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2738', '192.168.171.136', '192.168.171.0', '255.255.255.0', '	192.168.171.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2739', '192.168.171.137', '192.168.171.0', '255.255.255.0', '	192.168.171.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2740', '192.168.171.138', '192.168.171.0', '255.255.255.0', '	192.168.171.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2741', '192.168.171.139', '192.168.171.0', '255.255.255.0', '	192.168.171.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2742', '192.168.171.140', '192.168.171.0', '255.255.255.0', '	192.168.171.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2743', '192.168.171.141', '192.168.171.0', '255.255.255.0', '	192.168.171.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2744', '192.168.171.142', '192.168.171.0', '255.255.255.0', '	192.168.171.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2745', '192.168.171.143', '192.168.171.0', '255.255.255.0', '	192.168.171.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2746', '192.168.171.144', '192.168.171.0', '255.255.255.0', '	192.168.171.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2747', '192.168.171.145', '192.168.171.0', '255.255.255.0', '	192.168.171.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2748', '192.168.171.146', '192.168.171.0', '255.255.255.0', '	192.168.171.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2749', '192.168.171.147', '192.168.171.0', '255.255.255.0', '	192.168.171.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2750', '192.168.171.148', '192.168.171.0', '255.255.255.0', '	192.168.171.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2751', '192.168.171.149', '192.168.171.0', '255.255.255.0', '	192.168.171.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2752', '192.168.171.150', '192.168.171.0', '255.255.255.0', '	192.168.171.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2753', '192.168.171.151', '192.168.171.0', '255.255.255.0', '	192.168.171.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2754', '192.168.171.152', '192.168.171.0', '255.255.255.0', '	192.168.171.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2755', '192.168.171.153', '192.168.171.0', '255.255.255.0', '	192.168.171.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2756', '192.168.171.154', '192.168.171.0', '255.255.255.0', '	192.168.171.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2757', '192.168.171.155', '192.168.171.0', '255.255.255.0', '	192.168.171.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2758', '192.168.171.156', '192.168.171.0', '255.255.255.0', '	192.168.171.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2759', '192.168.171.157', '192.168.171.0', '255.255.255.0', '	192.168.171.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2760', '192.168.171.158', '192.168.171.0', '255.255.255.0', '	192.168.171.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2761', '192.168.171.159', '192.168.171.0', '255.255.255.0', '	192.168.171.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2762', '192.168.171.160', '192.168.171.0', '255.255.255.0', '	192.168.171.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2763', '192.168.171.161', '192.168.171.0', '255.255.255.0', '	192.168.171.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2764', '192.168.171.162', '192.168.171.0', '255.255.255.0', '	192.168.171.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2765', '192.168.171.163', '192.168.171.0', '255.255.255.0', '	192.168.171.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2766', '192.168.171.164', '192.168.171.0', '255.255.255.0', '	192.168.171.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2767', '192.168.171.165', '192.168.171.0', '255.255.255.0', '	192.168.171.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2768', '192.168.171.166', '192.168.171.0', '255.255.255.0', '	192.168.171.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2769', '192.168.171.167', '192.168.171.0', '255.255.255.0', '	192.168.171.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2770', '192.168.171.168', '192.168.171.0', '255.255.255.0', '	192.168.171.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2771', '192.168.171.169', '192.168.171.0', '255.255.255.0', '	192.168.171.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2772', '192.168.171.170', '192.168.171.0', '255.255.255.0', '	192.168.171.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2773', '192.168.171.171', '192.168.171.0', '255.255.255.0', '	192.168.171.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2774', '192.168.171.172', '192.168.171.0', '255.255.255.0', '	192.168.171.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2775', '192.168.171.173', '192.168.171.0', '255.255.255.0', '	192.168.171.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2776', '192.168.171.174', '192.168.171.0', '255.255.255.0', '	192.168.171.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2777', '192.168.171.175', '192.168.171.0', '255.255.255.0', '	192.168.171.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2778', '192.168.171.176', '192.168.171.0', '255.255.255.0', '	192.168.171.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2779', '192.168.171.177', '192.168.171.0', '255.255.255.0', '	192.168.171.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2780', '192.168.171.178', '192.168.171.0', '255.255.255.0', '	192.168.171.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2781', '192.168.171.179', '192.168.171.0', '255.255.255.0', '	192.168.171.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2782', '192.168.171.180', '192.168.171.0', '255.255.255.0', '	192.168.171.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2783', '192.168.171.181', '192.168.171.0', '255.255.255.0', '	192.168.171.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2784', '192.168.171.182', '192.168.171.0', '255.255.255.0', '	192.168.171.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2785', '192.168.171.183', '192.168.171.0', '255.255.255.0', '	192.168.171.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2786', '192.168.171.184', '192.168.171.0', '255.255.255.0', '	192.168.171.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2787', '192.168.171.185', '192.168.171.0', '255.255.255.0', '	192.168.171.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2788', '192.168.171.186', '192.168.171.0', '255.255.255.0', '	192.168.171.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2789', '192.168.171.187', '192.168.171.0', '255.255.255.0', '	192.168.171.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2790', '192.168.171.188', '192.168.171.0', '255.255.255.0', '	192.168.171.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2791', '192.168.171.189', '192.168.171.0', '255.255.255.0', '	192.168.171.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2792', '192.168.171.190', '192.168.171.0', '255.255.255.0', '	192.168.171.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2793', '192.168.171.191', '192.168.171.0', '255.255.255.0', '	192.168.171.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2794', '192.168.171.192', '192.168.171.0', '255.255.255.0', '	192.168.171.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2795', '192.168.171.193', '192.168.171.0', '255.255.255.0', '	192.168.171.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2796', '192.168.171.194', '192.168.171.0', '255.255.255.0', '	192.168.171.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2797', '192.168.171.195', '192.168.171.0', '255.255.255.0', '	192.168.171.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2798', '192.168.171.196', '192.168.171.0', '255.255.255.0', '	192.168.171.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2799', '192.168.171.197', '192.168.171.0', '255.255.255.0', '	192.168.171.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2800', '192.168.171.198', '192.168.171.0', '255.255.255.0', '	192.168.171.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2801', '192.168.171.199', '192.168.171.0', '255.255.255.0', '	192.168.171.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2802', '192.168.171.200', '192.168.171.0', '255.255.255.0', '	192.168.171.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2803', '192.168.171.201', '192.168.171.0', '255.255.255.0', '	192.168.171.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2804', '192.168.171.202', '192.168.171.0', '255.255.255.0', '	192.168.171.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2805', '192.168.171.203', '192.168.171.0', '255.255.255.0', '	192.168.171.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2806', '192.168.171.204', '192.168.171.0', '255.255.255.0', '	192.168.171.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2807', '192.168.171.205', '192.168.171.0', '255.255.255.0', '	192.168.171.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2808', '192.168.171.206', '192.168.171.0', '255.255.255.0', '	192.168.171.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2809', '192.168.171.207', '192.168.171.0', '255.255.255.0', '	192.168.171.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2810', '192.168.171.208', '192.168.171.0', '255.255.255.0', '	192.168.171.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2811', '192.168.171.209', '192.168.171.0', '255.255.255.0', '	192.168.171.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2812', '192.168.171.210', '192.168.171.0', '255.255.255.0', '	192.168.171.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2813', '192.168.171.211', '192.168.171.0', '255.255.255.0', '	192.168.171.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2814', '192.168.171.212', '192.168.171.0', '255.255.255.0', '	192.168.171.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2815', '192.168.171.213', '192.168.171.0', '255.255.255.0', '	192.168.171.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2816', '192.168.171.214', '192.168.171.0', '255.255.255.0', '	192.168.171.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2817', '192.168.171.215', '192.168.171.0', '255.255.255.0', '	192.168.171.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2818', '192.168.171.216', '192.168.171.0', '255.255.255.0', '	192.168.171.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2819', '192.168.171.217', '192.168.171.0', '255.255.255.0', '	192.168.171.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2820', '192.168.171.218', '192.168.171.0', '255.255.255.0', '	192.168.171.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2821', '192.168.171.219', '192.168.171.0', '255.255.255.0', '	192.168.171.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2822', '192.168.171.220', '192.168.171.0', '255.255.255.0', '	192.168.171.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2823', '192.168.171.221', '192.168.171.0', '255.255.255.0', '	192.168.171.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2824', '192.168.171.222', '192.168.171.0', '255.255.255.0', '	192.168.171.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2825', '192.168.171.223', '192.168.171.0', '255.255.255.0', '	192.168.171.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2826', '192.168.171.224', '192.168.171.0', '255.255.255.0', '	192.168.171.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2827', '192.168.171.225', '192.168.171.0', '255.255.255.0', '	192.168.171.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2828', '192.168.171.226', '192.168.171.0', '255.255.255.0', '	192.168.171.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2829', '192.168.171.227', '192.168.171.0', '255.255.255.0', '	192.168.171.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2830', '192.168.171.228', '192.168.171.0', '255.255.255.0', '	192.168.171.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2831', '192.168.171.229', '192.168.171.0', '255.255.255.0', '	192.168.171.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2832', '192.168.171.230', '192.168.171.0', '255.255.255.0', '	192.168.171.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2833', '192.168.171.231', '192.168.171.0', '255.255.255.0', '	192.168.171.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2834', '192.168.171.232', '192.168.171.0', '255.255.255.0', '	192.168.171.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2835', '192.168.171.233', '192.168.171.0', '255.255.255.0', '	192.168.171.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2836', '192.168.171.234', '192.168.171.0', '255.255.255.0', '	192.168.171.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2837', '192.168.171.235', '192.168.171.0', '255.255.255.0', '	192.168.171.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2838', '192.168.171.236', '192.168.171.0', '255.255.255.0', '	192.168.171.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2839', '192.168.171.237', '192.168.171.0', '255.255.255.0', '	192.168.171.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2840', '192.168.171.238', '192.168.171.0', '255.255.255.0', '	192.168.171.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2841', '192.168.171.239', '192.168.171.0', '255.255.255.0', '	192.168.171.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2842', '192.168.171.240', '192.168.171.0', '255.255.255.0', '	192.168.171.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2843', '192.168.171.241', '192.168.171.0', '255.255.255.0', '	192.168.171.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2844', '192.168.171.242', '192.168.171.0', '255.255.255.0', '	192.168.171.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2845', '192.168.171.243', '192.168.171.0', '255.255.255.0', '	192.168.171.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2846', '192.168.171.244', '192.168.171.0', '255.255.255.0', '	192.168.171.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2847', '192.168.171.245', '192.168.171.0', '255.255.255.0', '	192.168.171.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2848', '192.168.171.246', '192.168.171.0', '255.255.255.0', '	192.168.171.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2849', '192.168.171.247', '192.168.171.0', '255.255.255.0', '	192.168.171.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2850', '192.168.171.248', '192.168.171.0', '255.255.255.0', '	192.168.171.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2851', '192.168.171.249', '192.168.171.0', '255.255.255.0', '	192.168.171.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2852', '192.168.171.250', '192.168.171.0', '255.255.255.0', '	192.168.171.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2853', '192.168.171.251', '192.168.171.0', '255.255.255.0', '	192.168.171.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2854', '192.168.171.252', '192.168.171.0', '255.255.255.0', '	192.168.171.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2855', '192.168.171.253', '192.168.171.0', '255.255.255.0', '	192.168.171.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2856', '192.168.171.254', '192.168.171.0', '255.255.255.0', '	192.168.171.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2857', '10.0.91.1', '10.0.91.0', '255.255.255.0', '10.0.91.254', '预留地址', '');
INSERT INTO `netmget_ipmanage` VALUES ('2858', '10.0.91.2', '10.0.91.0', '255.255.255.0', '10.0.91.254', '预留地址', '');
INSERT INTO `netmget_ipmanage` VALUES ('2859', '10.0.91.3', '10.0.91.0', '255.255.255.0', '10.0.91.254', '预留地址', '');
INSERT INTO `netmget_ipmanage` VALUES ('2860', '10.0.91.4', '10.0.91.0', '255.255.255.0', '10.0.91.254', '预留地址', '');
INSERT INTO `netmget_ipmanage` VALUES ('2861', '10.0.91.5', '10.0.91.0', '255.255.255.0', '10.0.91.254', '预留地址', '');
INSERT INTO `netmget_ipmanage` VALUES ('2862', '10.0.91.6', '10.0.91.0', '255.255.255.0', '10.0.91.254', '预留地址', '');
INSERT INTO `netmget_ipmanage` VALUES ('2863', '10.0.91.7', '10.0.91.0', '255.255.255.0', '10.0.91.254', '预留地址', '');
INSERT INTO `netmget_ipmanage` VALUES ('2864', '10.0.91.8', '10.0.91.0', '255.255.255.0', '10.0.91.254', '预留地址', '');
INSERT INTO `netmget_ipmanage` VALUES ('2865', '10.0.91.9', '10.0.91.0', '255.255.255.0', '10.0.91.254', '预留地址', '');
INSERT INTO `netmget_ipmanage` VALUES ('2866', '10.0.91.10', '10.0.91.0', '255.255.255.0', '10.0.91.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2867', '10.0.91.11', '10.0.91.0', '255.255.255.0', '10.0.91.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2868', '10.0.91.12', '10.0.91.0', '255.255.255.0', '10.0.91.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2869', '10.0.91.13', '10.0.91.0', '255.255.255.0', '10.0.91.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2870', '10.0.91.14', '10.0.91.0', '255.255.255.0', '10.0.91.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2871', '10.0.91.15', '10.0.91.0', '255.255.255.0', '10.0.91.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2872', '10.0.91.16', '10.0.91.0', '255.255.255.0', '10.0.91.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2873', '10.0.91.17', '10.0.91.0', '255.255.255.0', '10.0.91.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2874', '10.0.91.18', '10.0.91.0', '255.255.255.0', '10.0.91.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2875', '10.0.91.19', '10.0.91.0', '255.255.255.0', '10.0.91.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2876', '10.0.91.20', '10.0.91.0', '255.255.255.0', '10.0.91.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2877', '10.0.91.21', '10.0.91.0', '255.255.255.0', '10.0.91.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2878', '10.0.91.22', '10.0.91.0', '255.255.255.0', '10.0.91.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2879', '10.0.91.23', '10.0.91.0', '255.255.255.0', '10.0.91.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2880', '10.0.91.24', '10.0.91.0', '255.255.255.0', '10.0.91.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2881', '10.0.91.25', '10.0.91.0', '255.255.255.0', '10.0.91.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2882', '10.0.91.26', '10.0.91.0', '255.255.255.0', '10.0.91.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2883', '10.0.91.27', '10.0.91.0', '255.255.255.0', '10.0.91.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2884', '10.0.91.28', '10.0.91.0', '255.255.255.0', '10.0.91.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2885', '10.0.91.29', '10.0.91.0', '255.255.255.0', '10.0.91.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2886', '10.0.91.30', '10.0.91.0', '255.255.255.0', '10.0.91.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2887', '10.0.91.31', '10.0.91.0', '255.255.255.0', '10.0.91.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2888', '10.0.91.32', '10.0.91.0', '255.255.255.0', '10.0.91.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2889', '10.0.91.33', '10.0.91.0', '255.255.255.0', '10.0.91.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2890', '10.0.91.34', '10.0.91.0', '255.255.255.0', '10.0.91.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2891', '10.0.91.35', '10.0.91.0', '255.255.255.0', '10.0.91.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2892', '10.0.91.36', '10.0.91.0', '255.255.255.0', '10.0.91.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2893', '10.0.91.37', '10.0.91.0', '255.255.255.0', '10.0.91.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2894', '10.0.91.38', '10.0.91.0', '255.255.255.0', '10.0.91.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2895', '10.0.91.39', '10.0.91.0', '255.255.255.0', '10.0.91.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2896', '10.0.91.40', '10.0.91.0', '255.255.255.0', '10.0.91.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2897', '10.0.91.41', '10.0.91.0', '255.255.255.0', '10.0.91.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2898', '10.0.91.42', '10.0.91.0', '255.255.255.0', '10.0.91.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2899', '10.0.91.43', '10.0.91.0', '255.255.255.0', '10.0.91.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2900', '10.0.91.44', '10.0.91.0', '255.255.255.0', '10.0.91.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2901', '10.0.91.45', '10.0.91.0', '255.255.255.0', '10.0.91.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2902', '10.0.91.46', '10.0.91.0', '255.255.255.0', '10.0.91.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2903', '10.0.91.47', '10.0.91.0', '255.255.255.0', '10.0.91.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2904', '10.0.91.48', '10.0.91.0', '255.255.255.0', '10.0.91.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2905', '10.0.91.49', '10.0.91.0', '255.255.255.0', '10.0.91.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2906', '10.0.91.50', '10.0.91.0', '255.255.255.0', '10.0.91.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2907', '10.0.91.51', '10.0.91.0', '255.255.255.0', '10.0.91.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2908', '10.0.91.52', '10.0.91.0', '255.255.255.0', '10.0.91.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2909', '10.0.91.53', '10.0.91.0', '255.255.255.0', '10.0.91.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2910', '10.0.91.54', '10.0.91.0', '255.255.255.0', '10.0.91.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2911', '10.0.91.55', '10.0.91.0', '255.255.255.0', '10.0.91.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2912', '10.0.91.56', '10.0.91.0', '255.255.255.0', '10.0.91.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2913', '10.0.91.57', '10.0.91.0', '255.255.255.0', '10.0.91.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2914', '10.0.91.58', '10.0.91.0', '255.255.255.0', '10.0.91.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2915', '10.0.91.59', '10.0.91.0', '255.255.255.0', '10.0.91.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2916', '10.0.91.60', '10.0.91.0', '255.255.255.0', '10.0.91.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2917', '10.0.91.61', '10.0.91.0', '255.255.255.0', '10.0.91.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2918', '10.0.91.62', '10.0.91.0', '255.255.255.0', '10.0.91.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2919', '10.0.91.63', '10.0.91.0', '255.255.255.0', '10.0.91.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2920', '10.0.91.64', '10.0.91.0', '255.255.255.0', '10.0.91.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2921', '10.0.91.65', '10.0.91.0', '255.255.255.0', '10.0.91.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2922', '10.0.91.66', '10.0.91.0', '255.255.255.0', '10.0.91.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2923', '10.0.91.67', '10.0.91.0', '255.255.255.0', '10.0.91.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2924', '10.0.91.68', '10.0.91.0', '255.255.255.0', '10.0.91.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2925', '10.0.91.69', '10.0.91.0', '255.255.255.0', '10.0.91.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2926', '10.0.91.70', '10.0.91.0', '255.255.255.0', '10.0.91.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2927', '10.0.91.71', '10.0.91.0', '255.255.255.0', '10.0.91.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2928', '10.0.91.72', '10.0.91.0', '255.255.255.0', '10.0.91.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2929', '10.0.91.73', '10.0.91.0', '255.255.255.0', '10.0.91.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2930', '10.0.91.74', '10.0.91.0', '255.255.255.0', '10.0.91.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2931', '10.0.91.75', '10.0.91.0', '255.255.255.0', '10.0.91.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2932', '10.0.91.76', '10.0.91.0', '255.255.255.0', '10.0.91.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2933', '10.0.91.77', '10.0.91.0', '255.255.255.0', '10.0.91.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2934', '10.0.91.78', '10.0.91.0', '255.255.255.0', '10.0.91.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2935', '10.0.91.79', '10.0.91.0', '255.255.255.0', '10.0.91.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2936', '10.0.91.80', '10.0.91.0', '255.255.255.0', '10.0.91.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2937', '10.0.91.81', '10.0.91.0', '255.255.255.0', '10.0.91.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2938', '10.0.91.82', '10.0.91.0', '255.255.255.0', '10.0.91.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2939', '10.0.91.83', '10.0.91.0', '255.255.255.0', '10.0.91.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2940', '10.0.91.84', '10.0.91.0', '255.255.255.0', '10.0.91.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2941', '10.0.91.85', '10.0.91.0', '255.255.255.0', '10.0.91.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2942', '10.0.91.86', '10.0.91.0', '255.255.255.0', '10.0.91.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2943', '10.0.91.87', '10.0.91.0', '255.255.255.0', '10.0.91.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2944', '10.0.91.88', '10.0.91.0', '255.255.255.0', '10.0.91.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2945', '10.0.91.89', '10.0.91.0', '255.255.255.0', '10.0.91.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2946', '10.0.91.90', '10.0.91.0', '255.255.255.0', '10.0.91.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2947', '10.0.91.91', '10.0.91.0', '255.255.255.0', '10.0.91.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2948', '10.0.91.92', '10.0.91.0', '255.255.255.0', '10.0.91.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2949', '10.0.91.93', '10.0.91.0', '255.255.255.0', '10.0.91.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2950', '10.0.91.94', '10.0.91.0', '255.255.255.0', '10.0.91.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2951', '10.0.91.95', '10.0.91.0', '255.255.255.0', '10.0.91.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2952', '10.0.91.96', '10.0.91.0', '255.255.255.0', '10.0.91.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2953', '10.0.91.97', '10.0.91.0', '255.255.255.0', '10.0.91.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2954', '10.0.91.98', '10.0.91.0', '255.255.255.0', '10.0.91.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2955', '10.0.91.99', '10.0.91.0', '255.255.255.0', '10.0.91.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2956', '10.0.91.100', '10.0.91.0', '255.255.255.0', '10.0.91.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2957', '10.0.91.101', '10.0.91.0', '255.255.255.0', '10.0.91.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2958', '10.0.91.102', '10.0.91.0', '255.255.255.0', '10.0.91.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2959', '10.0.91.103', '10.0.91.0', '255.255.255.0', '10.0.91.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2960', '10.0.91.104', '10.0.91.0', '255.255.255.0', '10.0.91.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2961', '10.0.91.105', '10.0.91.0', '255.255.255.0', '10.0.91.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2962', '10.0.91.106', '10.0.91.0', '255.255.255.0', '10.0.91.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2963', '10.0.91.107', '10.0.91.0', '255.255.255.0', '10.0.91.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2964', '10.0.91.108', '10.0.91.0', '255.255.255.0', '10.0.91.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2965', '10.0.91.109', '10.0.91.0', '255.255.255.0', '10.0.91.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2966', '10.0.91.110', '10.0.91.0', '255.255.255.0', '10.0.91.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2967', '10.0.91.111', '10.0.91.0', '255.255.255.0', '10.0.91.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2968', '10.0.91.112', '10.0.91.0', '255.255.255.0', '10.0.91.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2969', '10.0.91.113', '10.0.91.0', '255.255.255.0', '10.0.91.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2970', '10.0.91.114', '10.0.91.0', '255.255.255.0', '10.0.91.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2971', '10.0.91.115', '10.0.91.0', '255.255.255.0', '10.0.91.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2972', '10.0.91.116', '10.0.91.0', '255.255.255.0', '10.0.91.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2973', '10.0.91.117', '10.0.91.0', '255.255.255.0', '10.0.91.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2974', '10.0.91.118', '10.0.91.0', '255.255.255.0', '10.0.91.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2975', '10.0.91.119', '10.0.91.0', '255.255.255.0', '10.0.91.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2976', '10.0.91.120', '10.0.91.0', '255.255.255.0', '10.0.91.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2977', '10.0.91.121', '10.0.91.0', '255.255.255.0', '10.0.91.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2978', '10.0.91.122', '10.0.91.0', '255.255.255.0', '10.0.91.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2979', '10.0.91.123', '10.0.91.0', '255.255.255.0', '10.0.91.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2980', '10.0.91.124', '10.0.91.0', '255.255.255.0', '10.0.91.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2981', '10.0.91.125', '10.0.91.0', '255.255.255.0', '10.0.91.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2982', '10.0.91.126', '10.0.91.0', '255.255.255.0', '10.0.91.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2983', '10.0.91.127', '10.0.91.0', '255.255.255.0', '10.0.91.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2984', '10.0.91.128', '10.0.91.0', '255.255.255.0', '10.0.91.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2985', '10.0.91.129', '10.0.91.0', '255.255.255.0', '10.0.91.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2986', '10.0.91.130', '10.0.91.0', '255.255.255.0', '10.0.91.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2987', '10.0.91.131', '10.0.91.0', '255.255.255.0', '10.0.91.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2988', '10.0.91.132', '10.0.91.0', '255.255.255.0', '10.0.91.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2989', '10.0.91.133', '10.0.91.0', '255.255.255.0', '10.0.91.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2990', '10.0.91.134', '10.0.91.0', '255.255.255.0', '10.0.91.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2991', '10.0.91.135', '10.0.91.0', '255.255.255.0', '10.0.91.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2992', '10.0.91.136', '10.0.91.0', '255.255.255.0', '10.0.91.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2993', '10.0.91.137', '10.0.91.0', '255.255.255.0', '10.0.91.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2994', '10.0.91.138', '10.0.91.0', '255.255.255.0', '10.0.91.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2995', '10.0.91.139', '10.0.91.0', '255.255.255.0', '10.0.91.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2996', '10.0.91.140', '10.0.91.0', '255.255.255.0', '10.0.91.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2997', '10.0.91.141', '10.0.91.0', '255.255.255.0', '10.0.91.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2998', '10.0.91.142', '10.0.91.0', '255.255.255.0', '10.0.91.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('2999', '10.0.91.143', '10.0.91.0', '255.255.255.0', '10.0.91.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('3000', '10.0.91.144', '10.0.91.0', '255.255.255.0', '10.0.91.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('3001', '10.0.91.145', '10.0.91.0', '255.255.255.0', '10.0.91.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('3002', '10.0.91.146', '10.0.91.0', '255.255.255.0', '10.0.91.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('3003', '10.0.91.147', '10.0.91.0', '255.255.255.0', '10.0.91.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('3004', '10.0.91.148', '10.0.91.0', '255.255.255.0', '10.0.91.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('3005', '10.0.91.149', '10.0.91.0', '255.255.255.0', '10.0.91.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('3006', '10.0.91.150', '10.0.91.0', '255.255.255.0', '10.0.91.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('3007', '10.0.91.151', '10.0.91.0', '255.255.255.0', '10.0.91.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('3008', '10.0.91.152', '10.0.91.0', '255.255.255.0', '10.0.91.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('3009', '10.0.91.153', '10.0.91.0', '255.255.255.0', '10.0.91.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('3010', '10.0.91.154', '10.0.91.0', '255.255.255.0', '10.0.91.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('3011', '10.0.91.155', '10.0.91.0', '255.255.255.0', '10.0.91.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('3012', '10.0.91.156', '10.0.91.0', '255.255.255.0', '10.0.91.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('3013', '10.0.91.157', '10.0.91.0', '255.255.255.0', '10.0.91.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('3014', '10.0.91.158', '10.0.91.0', '255.255.255.0', '10.0.91.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('3015', '10.0.91.159', '10.0.91.0', '255.255.255.0', '10.0.91.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('3016', '10.0.91.160', '10.0.91.0', '255.255.255.0', '10.0.91.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('3017', '10.0.91.161', '10.0.91.0', '255.255.255.0', '10.0.91.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('3018', '10.0.91.162', '10.0.91.0', '255.255.255.0', '10.0.91.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('3019', '10.0.91.163', '10.0.91.0', '255.255.255.0', '10.0.91.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('3020', '10.0.91.164', '10.0.91.0', '255.255.255.0', '10.0.91.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('3021', '10.0.91.165', '10.0.91.0', '255.255.255.0', '10.0.91.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('3022', '10.0.91.166', '10.0.91.0', '255.255.255.0', '10.0.91.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('3023', '10.0.91.167', '10.0.91.0', '255.255.255.0', '10.0.91.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('3024', '10.0.91.168', '10.0.91.0', '255.255.255.0', '10.0.91.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('3025', '10.0.91.169', '10.0.91.0', '255.255.255.0', '10.0.91.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('3026', '10.0.91.170', '10.0.91.0', '255.255.255.0', '10.0.91.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('3027', '10.0.91.171', '10.0.91.0', '255.255.255.0', '10.0.91.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('3028', '10.0.91.172', '10.0.91.0', '255.255.255.0', '10.0.91.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('3029', '10.0.91.173', '10.0.91.0', '255.255.255.0', '10.0.91.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('3030', '10.0.91.174', '10.0.91.0', '255.255.255.0', '10.0.91.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('3031', '10.0.91.175', '10.0.91.0', '255.255.255.0', '10.0.91.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('3032', '10.0.91.176', '10.0.91.0', '255.255.255.0', '10.0.91.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('3033', '10.0.91.177', '10.0.91.0', '255.255.255.0', '10.0.91.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('3034', '10.0.91.178', '10.0.91.0', '255.255.255.0', '10.0.91.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('3035', '10.0.91.179', '10.0.91.0', '255.255.255.0', '10.0.91.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('3036', '10.0.91.180', '10.0.91.0', '255.255.255.0', '10.0.91.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('3037', '10.0.91.181', '10.0.91.0', '255.255.255.0', '10.0.91.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('3038', '10.0.91.182', '10.0.91.0', '255.255.255.0', '10.0.91.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('3039', '10.0.91.183', '10.0.91.0', '255.255.255.0', '10.0.91.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('3040', '10.0.91.184', '10.0.91.0', '255.255.255.0', '10.0.91.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('3041', '10.0.91.185', '10.0.91.0', '255.255.255.0', '10.0.91.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('3042', '10.0.91.186', '10.0.91.0', '255.255.255.0', '10.0.91.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('3043', '10.0.91.187', '10.0.91.0', '255.255.255.0', '10.0.91.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('3044', '10.0.91.188', '10.0.91.0', '255.255.255.0', '10.0.91.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('3045', '10.0.91.189', '10.0.91.0', '255.255.255.0', '10.0.91.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('3046', '10.0.91.190', '10.0.91.0', '255.255.255.0', '10.0.91.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('3047', '10.0.91.191', '10.0.91.0', '255.255.255.0', '10.0.91.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('3048', '10.0.91.192', '10.0.91.0', '255.255.255.0', '10.0.91.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('3049', '10.0.91.193', '10.0.91.0', '255.255.255.0', '10.0.91.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('3050', '10.0.91.194', '10.0.91.0', '255.255.255.0', '10.0.91.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('3051', '10.0.91.195', '10.0.91.0', '255.255.255.0', '10.0.91.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('3052', '10.0.91.196', '10.0.91.0', '255.255.255.0', '10.0.91.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('3053', '10.0.91.197', '10.0.91.0', '255.255.255.0', '10.0.91.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('3054', '10.0.91.198', '10.0.91.0', '255.255.255.0', '10.0.91.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('3055', '10.0.91.199', '10.0.91.0', '255.255.255.0', '10.0.91.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('3056', '10.0.91.200', '10.0.91.0', '255.255.255.0', '10.0.91.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('3057', '10.0.91.201', '10.0.91.0', '255.255.255.0', '10.0.91.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('3058', '10.0.91.202', '10.0.91.0', '255.255.255.0', '10.0.91.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('3059', '10.0.91.203', '10.0.91.0', '255.255.255.0', '10.0.91.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('3060', '10.0.91.204', '10.0.91.0', '255.255.255.0', '10.0.91.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('3061', '10.0.91.205', '10.0.91.0', '255.255.255.0', '10.0.91.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('3062', '10.0.91.206', '10.0.91.0', '255.255.255.0', '10.0.91.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('3063', '10.0.91.207', '10.0.91.0', '255.255.255.0', '10.0.91.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('3064', '10.0.91.208', '10.0.91.0', '255.255.255.0', '10.0.91.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('3065', '10.0.91.209', '10.0.91.0', '255.255.255.0', '10.0.91.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('3066', '10.0.91.210', '10.0.91.0', '255.255.255.0', '10.0.91.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('3067', '10.0.91.211', '10.0.91.0', '255.255.255.0', '10.0.91.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('3068', '10.0.91.212', '10.0.91.0', '255.255.255.0', '10.0.91.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('3069', '10.0.91.213', '10.0.91.0', '255.255.255.0', '10.0.91.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('3070', '10.0.91.214', '10.0.91.0', '255.255.255.0', '10.0.91.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('3071', '10.0.91.215', '10.0.91.0', '255.255.255.0', '10.0.91.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('3072', '10.0.91.216', '10.0.91.0', '255.255.255.0', '10.0.91.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('3073', '10.0.91.217', '10.0.91.0', '255.255.255.0', '10.0.91.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('3074', '10.0.91.218', '10.0.91.0', '255.255.255.0', '10.0.91.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('3075', '10.0.91.219', '10.0.91.0', '255.255.255.0', '10.0.91.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('3076', '10.0.91.220', '10.0.91.0', '255.255.255.0', '10.0.91.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('3077', '10.0.91.221', '10.0.91.0', '255.255.255.0', '10.0.91.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('3078', '10.0.91.222', '10.0.91.0', '255.255.255.0', '10.0.91.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('3079', '10.0.91.223', '10.0.91.0', '255.255.255.0', '10.0.91.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('3080', '10.0.91.224', '10.0.91.0', '255.255.255.0', '10.0.91.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('3081', '10.0.91.225', '10.0.91.0', '255.255.255.0', '10.0.91.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('3082', '10.0.91.226', '10.0.91.0', '255.255.255.0', '10.0.91.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('3083', '10.0.91.227', '10.0.91.0', '255.255.255.0', '10.0.91.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('3084', '10.0.91.228', '10.0.91.0', '255.255.255.0', '10.0.91.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('3085', '10.0.91.229', '10.0.91.0', '255.255.255.0', '10.0.91.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('3086', '10.0.91.230', '10.0.91.0', '255.255.255.0', '10.0.91.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('3087', '10.0.91.231', '10.0.91.0', '255.255.255.0', '10.0.91.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('3088', '10.0.91.232', '10.0.91.0', '255.255.255.0', '10.0.91.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('3089', '10.0.91.233', '10.0.91.0', '255.255.255.0', '10.0.91.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('3090', '10.0.91.234', '10.0.91.0', '255.255.255.0', '10.0.91.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('3091', '10.0.91.235', '10.0.91.0', '255.255.255.0', '10.0.91.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('3092', '10.0.91.236', '10.0.91.0', '255.255.255.0', '10.0.91.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('3093', '10.0.91.237', '10.0.91.0', '255.255.255.0', '10.0.91.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('3094', '10.0.91.238', '10.0.91.0', '255.255.255.0', '10.0.91.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('3095', '10.0.91.239', '10.0.91.0', '255.255.255.0', '10.0.91.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('3096', '10.0.91.240', '10.0.91.0', '255.255.255.0', '10.0.91.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('3097', '10.0.91.241', '10.0.91.0', '255.255.255.0', '10.0.91.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('3098', '10.0.91.242', '10.0.91.0', '255.255.255.0', '10.0.91.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('3099', '10.0.91.243', '10.0.91.0', '255.255.255.0', '10.0.91.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('3100', '10.0.91.244', '10.0.91.0', '255.255.255.0', '10.0.91.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('3101', '10.0.91.245', '10.0.91.0', '255.255.255.0', '10.0.91.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('3102', '10.0.91.246', '10.0.91.0', '255.255.255.0', '10.0.91.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('3103', '10.0.91.247', '10.0.91.0', '255.255.255.0', '10.0.91.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('3104', '10.0.91.248', '10.0.91.0', '255.255.255.0', '10.0.91.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('3105', '10.0.91.249', '10.0.91.0', '255.255.255.0', '10.0.91.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('3106', '10.0.91.250', '10.0.91.0', '255.255.255.0', '10.0.91.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('3107', '10.0.91.251', '10.0.91.0', '255.255.255.0', '10.0.91.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('3108', '10.0.91.252', '10.0.91.0', '255.255.255.0', '10.0.91.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('3109', '10.0.91.253', '10.0.91.0', '255.255.255.0', '10.0.91.254', '', '');
INSERT INTO `netmget_ipmanage` VALUES ('3110', '10.0.91.254', '10.0.91.0', '255.255.255.0', '10.0.91.254', '', '');

-- ----------------------------
-- Table structure for xadmin_bookmark
-- ----------------------------
DROP TABLE IF EXISTS `xadmin_bookmark`;
CREATE TABLE `xadmin_bookmark` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(128) NOT NULL,
  `url_name` varchar(64) NOT NULL,
  `query` varchar(1000) NOT NULL,
  `is_share` tinyint(1) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `xadmin_bookmark_content_type_id_60941679` (`content_type_id`),
  KEY `xadmin_bookmark_user_id_42d307fc` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xadmin_bookmark
-- ----------------------------

-- ----------------------------
-- Table structure for xadmin_log
-- ----------------------------
DROP TABLE IF EXISTS `xadmin_log`;
CREATE TABLE `xadmin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime NOT NULL,
  `ip_addr` char(39) DEFAULT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` varchar(32) NOT NULL,
  `message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `xadmin_log_content_type_id_2a6cb852` (`content_type_id`),
  KEY `xadmin_log_user_id_bb16a176` (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=66 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xadmin_log
-- ----------------------------
INSERT INTO `xadmin_log` VALUES ('1', '2018-03-25 18:35:11', '127.0.0.1', '1', '字典名称：性别 (字典项标识：0, 字典项名称：保密)', 'create', '已添加。', '6', '1');
INSERT INTO `xadmin_log` VALUES ('2', '2018-03-25 18:35:31', '127.0.0.1', '2', '字典名称：性别 (字典项标识：1, 字典项名称：男)', 'create', '已添加。', '6', '1');
INSERT INTO `xadmin_log` VALUES ('3', '2018-03-25 18:35:37', '127.0.0.1', '3', '字典名称：性别 (字典项标识：2, 字典项名称：女)', 'create', '已添加。', '6', '1');
INSERT INTO `xadmin_log` VALUES ('4', '2018-03-25 19:05:33', '127.0.0.1', '1', 'admin', 'change', '修改 last_login，role_id 和 sex', '8', '1');
INSERT INTO `xadmin_log` VALUES ('5', '2018-03-25 21:55:18', '127.0.0.1', '4', '字典名称：字典类别 (字典项标识：0, 字典项名称：全局字典)', 'create', '已添加。', '6', '1');
INSERT INTO `xadmin_log` VALUES ('6', '2018-03-25 21:55:45', '127.0.0.1', '5', '字典名称：字典类别 (字典项标识：2, 字典项名称：采集模块字典)', 'create', '已添加。', '6', '1');
INSERT INTO `xadmin_log` VALUES ('7', '2018-03-25 21:56:05', '127.0.0.1', '6', '字典名称：字典类别 (字典项标识：1, 字典项名称：备份模块字典)', 'create', '已添加。', '6', '1');
INSERT INTO `xadmin_log` VALUES ('8', '2018-03-25 21:58:53', '127.0.0.1', '3', '处理标识', 'create', '已添加。', '7', '1');
INSERT INTO `xadmin_log` VALUES ('9', '2018-03-25 21:59:29', '127.0.0.1', '3', '字典处理标识', 'change', '修改 dict_name', '7', '1');
INSERT INTO `xadmin_log` VALUES ('10', '2018-03-25 22:00:01', '127.0.0.1', '7', '字典名称：字典处理标识 (字典项标识：1, 字典项名称：加载)', 'create', '已添加。', '6', '1');
INSERT INTO `xadmin_log` VALUES ('11', '2018-03-25 22:00:14', '127.0.0.1', '7', '字典名称：字典处理标识 (字典项标识：1, 字典项名称：加载)', 'change', '没有字段被修改。', '6', '1');
INSERT INTO `xadmin_log` VALUES ('12', '2018-03-25 22:00:22', '127.0.0.1', '8', '字典名称：字典处理标识 (字典项标识：2, 字典项名称：停用)', 'create', '已添加。', '6', '1');
INSERT INTO `xadmin_log` VALUES ('13', '2018-03-25 22:01:25', '127.0.0.1', '7', '字典名称：字典处理标识 (字典项标识：1, 字典项名称：可读取)', 'change', '修改 dict_item_name', '6', '1');
INSERT INTO `xadmin_log` VALUES ('14', '2018-03-25 22:01:32', '127.0.0.1', '8', '字典名称：字典处理标识 (字典项标识：2, 字典项名称：已停用)', 'change', '修改 dict_item_name', '6', '1');
INSERT INTO `xadmin_log` VALUES ('15', '2018-03-25 22:47:45', '127.0.0.1', '460', 'IP地址：192.168.168.111 使用对象为：中登TA测试', 'change', '修改 use_object 和 remark', '16', '1');
INSERT INTO `xadmin_log` VALUES ('16', '2018-03-25 22:48:33', '127.0.0.1', '471', 'IP地址：192.168.168.100 使用对象为：None', 'change', '没有字段被修改。', '16', '1');
INSERT INTO `xadmin_log` VALUES ('17', '2018-03-25 22:48:39', '127.0.0.1', '460', 'IP地址：192.168.168.111 使用对象为：中登TA测试', 'change', '修改 remark', '16', '1');
INSERT INTO `xadmin_log` VALUES ('18', '2018-03-25 22:49:06', '127.0.0.1', '460', 'IP地址：192.168.168.111 使用对象为：中登TA测试', 'change', '修改 remark', '16', '1');
INSERT INTO `xadmin_log` VALUES ('19', '2018-03-25 22:54:34', '127.0.0.1', '471', 'IP地址：192.168.168.100 使用对象为：', 'change', '没有字段被修改。', '16', '1');
INSERT INTO `xadmin_log` VALUES ('20', '2018-03-25 23:34:26', '127.0.0.1', '2095', 'IP地址：192.168.169.1 使用对象为：默认网关', 'change', '修改 use_object 和 remark', '17', '1');
INSERT INTO `xadmin_log` VALUES ('21', '2018-03-25 23:41:42', '127.0.0.1', '2', 'ywzc', 'create', '已添加。', '8', '1');
INSERT INTO `xadmin_log` VALUES ('22', '2018-03-25 23:43:16', '127.0.0.1', '2', 'ywzc', 'change', '修改 user_permissions，first_name，role_id 和 sex', '8', '1');
INSERT INTO `xadmin_log` VALUES ('23', '2018-03-25 23:43:59', '127.0.0.1', '2', 'ywzc', 'change', '修改 is_staff', '8', '1');
INSERT INTO `xadmin_log` VALUES ('24', '2018-03-25 23:45:22', '127.0.0.1', '2', 'ywzc', 'change', '修改 last_login 和 user_permissions', '8', '1');
INSERT INTO `xadmin_log` VALUES ('25', '2018-03-25 23:46:23', '127.0.0.1', '1', '业务支持组', 'create', '已添加。', '2', '1');
INSERT INTO `xadmin_log` VALUES ('26', '2018-03-25 23:46:36', '127.0.0.1', '2', 'ywzc', 'change', '修改 groups 和 role_id', '8', '1');
INSERT INTO `xadmin_log` VALUES ('27', '2018-03-25 23:47:05', '127.0.0.1', '3', 'admin | 日志记录 | Can delete log entry', 'change', '没有字段被修改。', '3', '2');
INSERT INTO `xadmin_log` VALUES ('28', '2018-03-25 23:47:35', '127.0.0.1', '2', 'ywzc', 'change', '修改 last_login 和 user_permissions', '8', '1');
INSERT INTO `xadmin_log` VALUES ('29', '2018-03-26 00:03:57', '127.0.0.1', '52', 'commset | groupadmin | Can add group admin', 'delete', '', '3', '1');
INSERT INTO `xadmin_log` VALUES ('30', '2018-03-26 00:04:07', '127.0.0.1', null, '', 'delete', '批量删除 2 个 权限', null, '1');
INSERT INTO `xadmin_log` VALUES ('31', '2018-03-26 00:04:20', '127.0.0.1', null, '', 'delete', '批量删除 5 个 权限', null, '1');
INSERT INTO `xadmin_log` VALUES ('32', '2018-03-26 00:07:55', '127.0.0.1', '2', 'ywzc', 'change', '修改 user_permissions', '8', '1');
INSERT INTO `xadmin_log` VALUES ('33', '2018-03-26 12:55:47', '127.0.0.1', '4', '数据库类型', 'create', '已添加。', '7', '1');
INSERT INTO `xadmin_log` VALUES ('34', '2018-03-26 13:06:42', '127.0.0.1', '5', '是否压缩', 'create', '已添加。', '7', '1');
INSERT INTO `xadmin_log` VALUES ('35', '2018-03-26 13:09:13', '127.0.0.1', '6', '压缩方式', 'create', '已添加。', '7', '1');
INSERT INTO `xadmin_log` VALUES ('36', '2018-03-26 13:14:25', '127.0.0.1', '7', '可处理标识', 'create', '已添加。', '7', '1');
INSERT INTO `xadmin_log` VALUES ('37', '2018-03-26 15:46:42', '127.0.0.1', '8', '压缩是否需要密码', 'create', '已添加。', '7', '1');
INSERT INTO `xadmin_log` VALUES ('38', '2018-03-26 15:46:59', '127.0.0.1', '8', '压缩是否需要密码', 'change', '没有字段被修改。', '7', '1');
INSERT INTO `xadmin_log` VALUES ('39', '2018-03-26 16:16:59', '127.0.0.1', '1', '统一账户系统数据库备份', 'create', '已添加。', '28', '1');
INSERT INTO `xadmin_log` VALUES ('40', '2018-03-26 20:11:17', '127.0.0.1', '6', '压缩方式', 'change', '修改 dict_type', '7', '1');
INSERT INTO `xadmin_log` VALUES ('41', '2018-03-26 20:11:27', '127.0.0.1', '8', '压缩是否需要密码', 'change', '修改 dict_type', '7', '1');
INSERT INTO `xadmin_log` VALUES ('42', '2018-03-26 20:15:00', '127.0.0.1', '9', '参数类型', 'change', '没有字段被修改。', '7', '1');
INSERT INTO `xadmin_log` VALUES ('43', '2018-03-26 20:15:43', '127.0.0.1', '9', '参数类型', 'change', '没有字段被修改。', '7', '1');
INSERT INTO `xadmin_log` VALUES ('44', '2018-03-26 20:19:50', '127.0.0.1', '10', '参数类型', 'create', '已添加。', '7', '1');
INSERT INTO `xadmin_log` VALUES ('45', '2018-03-26 20:26:22', '127.0.0.1', '10', '模块分类', 'change', '修改 dict_name 和 dict_en_name', '7', '1');
INSERT INTO `xadmin_log` VALUES ('46', '2018-03-26 20:27:44', '127.0.0.1', '9', '操作类型', 'change', '修改 dict_name 和 dict_en_name', '7', '1');
INSERT INTO `xadmin_log` VALUES ('47', '2018-03-26 20:37:47', '127.0.0.1', '2', '字典类别', 'delete', '', '7', '1');
INSERT INTO `xadmin_log` VALUES ('48', '2018-03-26 20:37:57', '127.0.0.1', '3', '字典处理标识', 'delete', '', '7', '1');
INSERT INTO `xadmin_log` VALUES ('49', '2018-03-26 20:41:47', '127.0.0.1', '8', '压缩是否需要密码', 'change', '修改 dict_cls', '7', '1');
INSERT INTO `xadmin_log` VALUES ('50', '2018-03-26 20:41:58', '127.0.0.1', '6', '压缩方式', 'change', '修改 dict_cls', '7', '1');
INSERT INTO `xadmin_log` VALUES ('51', '2018-03-26 20:42:07', '127.0.0.1', '5', '是否压缩', 'change', '修改 dict_cls', '7', '1');
INSERT INTO `xadmin_log` VALUES ('52', '2018-03-26 20:42:25', '127.0.0.1', '4', '数据库类型', 'change', '修改 dict_cls', '7', '1');
INSERT INTO `xadmin_log` VALUES ('53', '2018-03-26 20:44:35', '127.0.0.1', '1', '系统名称', 'create', '已添加。', '30', '1');
INSERT INTO `xadmin_log` VALUES ('54', '2018-03-26 20:47:10', '127.0.0.1', '2', '页尾版权信息', 'create', '已添加。', '30', '1');
INSERT INTO `xadmin_log` VALUES ('55', '2018-03-26 20:59:17', '127.0.0.1', '10', '模块分类', 'change', '没有字段被修改。', '7', '1');
INSERT INTO `xadmin_log` VALUES ('56', '2018-03-26 20:59:47', '127.0.0.1', '6', '压缩方式', 'change', '修改 dict_cls', '7', '1');
INSERT INTO `xadmin_log` VALUES ('57', '2018-03-26 20:59:53', '127.0.0.1', '8', '压缩是否需要密码', 'change', '修改 dict_cls', '7', '1');
INSERT INTO `xadmin_log` VALUES ('58', '2018-03-26 20:59:58', '127.0.0.1', '4', '数据库类型', 'change', '修改 dict_cls', '7', '1');
INSERT INTO `xadmin_log` VALUES ('59', '2018-03-26 21:00:02', '127.0.0.1', '5', '是否压缩', 'change', '修改 dict_cls', '7', '1');
INSERT INTO `xadmin_log` VALUES ('60', '2018-03-26 21:07:33', '127.0.0.1', '10', '模块分类', 'change', '没有字段被修改。', '7', '1');
INSERT INTO `xadmin_log` VALUES ('61', '2018-03-27 07:43:03', '127.0.0.1', '68', 'IP地址：10.0.10.6 使用对象为：', 'change', '没有字段被修改。', '24', '1');
INSERT INTO `xadmin_log` VALUES ('62', '2018-03-27 10:34:18', '127.0.0.1', '10', '模块分类', 'change', '没有字段被修改。', '7', '1');
INSERT INTO `xadmin_log` VALUES ('63', '2018-03-27 10:35:20', '127.0.0.1', '11', '新增机构处理标志', 'create', '已添加。', '7', '1');
INSERT INTO `xadmin_log` VALUES ('64', '2018-03-27 10:38:29', '127.0.0.1', '11', '新增机构处理标志', 'change', '没有字段被修改。', '7', '1');
INSERT INTO `xadmin_log` VALUES ('65', '2018-03-27 11:19:27', '127.0.0.1', '1', 'InserNewOrgInfo object (1)', 'create', '已添加。', '31', '1');

-- ----------------------------
-- Table structure for xadmin_usersettings
-- ----------------------------
DROP TABLE IF EXISTS `xadmin_usersettings`;
CREATE TABLE `xadmin_usersettings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `key` varchar(256) NOT NULL,
  `value` longtext NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `xadmin_usersettings_user_id_edeabe4a` (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xadmin_usersettings
-- ----------------------------
INSERT INTO `xadmin_usersettings` VALUES ('1', 'dashboard:home:pos', '', '1');
INSERT INTO `xadmin_usersettings` VALUES ('2', 'commset_sysdictname_editform_portal', 'box-0,sysdictitem_set-group,,,,', '1');
INSERT INTO `xadmin_usersettings` VALUES ('3', 'dashboard:home:pos', '', '2');

-- ----------------------------
-- Table structure for xadmin_userwidget
-- ----------------------------
DROP TABLE IF EXISTS `xadmin_userwidget`;
CREATE TABLE `xadmin_userwidget` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `page_id` varchar(256) NOT NULL,
  `widget_type` varchar(50) NOT NULL,
  `value` longtext NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `xadmin_userwidget_user_id_c159233a` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xadmin_userwidget
-- ----------------------------
