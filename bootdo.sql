/*
Navicat MySQL Data Transfer

Source Server         : LJZ
Source Server Version : 50719
Source Host           : localhost:3306
Source Database       : bootdo

Target Server Type    : MYSQL
Target Server Version : 50719
File Encoding         : 65001

Date: 2017-12-17 20:56:07
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for bus_src
-- ----------------------------
DROP TABLE IF EXISTS `bus_src`;
CREATE TABLE `bus_src` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `img_url` varchar(500) NOT NULL,
  `link` varchar(500) DEFAULT NULL,
  `introduction` text,
  `gmt_create` datetime DEFAULT NULL,
  `gmt_modified` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COMMENT='SRC厂商';

-- ----------------------------
-- Records of bus_src
-- ----------------------------
INSERT INTO `bus_src` VALUES ('3', '哈哈', '/files/7283d1bf-2cfd-484d-95f8-1dd0fcd0ee6e.png', 'www.123.com', 'wuwuwuwu', '2017-12-17 15:22:20', '2017-12-17 15:22:20');
INSERT INTO `bus_src` VALUES ('4', '阿斯顿', '/files/b59ff373-9f80-4c83-a1dd-a21f94264bd4.jpg', 'asda', 'dsadafa发啊发的', '2017-12-17 19:19:49', '2017-12-17 19:19:49');
INSERT INTO `bus_src` VALUES ('5', '法国防火防盗', '/files/c3d9d663-64ad-4cf2-9d5e-12d50d726484.jpeg', 'dgfdsa', 'gdfj攻击方式是', '2017-12-17 19:20:04', '2017-12-17 19:20:04');
INSERT INTO `bus_src` VALUES ('6', '会辜负大家', '/files/2f76e864-1997-42a4-8b36-5fe69f5528e5.jpg', 'ghfxg', '官方机构开具', '2017-12-17 19:20:18', '2017-12-17 19:20:18');
INSERT INTO `bus_src` VALUES ('7', '京东方', '/files/b2bffba6-81e0-47b1-8468-c34f82bec962.jpg', 'ssghs', '华国锋客人', '2017-12-17 19:20:29', '2017-12-17 19:20:29');
INSERT INTO `bus_src` VALUES ('8', '和口感更好的', '/files/a38b5e53-d31c-430f-965e-84661a72518d.jpeg', '546564xz', 'dfjuhdfjudf功夫的身份', '2017-12-17 19:20:51', '2017-12-17 19:20:51');

-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept` (
  `dept_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `parent_id` bigint(20) DEFAULT NULL COMMENT '上级部门ID，一级部门为0',
  `name` varchar(50) DEFAULT NULL COMMENT '部门名称',
  `order_num` int(11) DEFAULT NULL COMMENT '排序',
  `del_flag` tinyint(4) DEFAULT '0' COMMENT '是否删除  -1：已删除  0：正常',
  `src_id` mediumtext NOT NULL,
  PRIMARY KEY (`dept_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COMMENT='部门管理';

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
INSERT INTO `sys_dept` VALUES ('6', '0', '研发部', '1', '1', '');
INSERT INTO `sys_dept` VALUES ('7', '6', '研發一部', '1', '1', '');
INSERT INTO `sys_dept` VALUES ('8', '6', '研发二部', '2', '1', '');
INSERT INTO `sys_dept` VALUES ('9', '0', '销售部', '2', '1', '');
INSERT INTO `sys_dept` VALUES ('10', '9', '销售一部', '1', '1', '');
INSERT INTO `sys_dept` VALUES ('11', '0', '产品部', '3', '1', '');
INSERT INTO `sys_dept` VALUES ('12', '11', '产品一部', '1', '1', '');
INSERT INTO `sys_dept` VALUES ('13', '0', '测试部', '5', '1', '');
INSERT INTO `sys_dept` VALUES ('14', '13', '测试一部', '1', '1', '');
INSERT INTO `sys_dept` VALUES ('15', '13', '测试二部', '2', '1', '');

-- ----------------------------
-- Table structure for sys_dict
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict`;
CREATE TABLE `sys_dict` (
  `id` bigint(64) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `name` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '标签名',
  `value` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '数据值',
  `type` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '类型',
  `description` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '描述',
  `sort` decimal(10,0) DEFAULT NULL COMMENT '排序（升序）',
  `parent_id` bigint(64) DEFAULT '0' COMMENT '父级编号',
  `create_by` int(64) DEFAULT NULL COMMENT '创建者',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` bigint(64) DEFAULT NULL COMMENT '更新者',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  `remarks` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) COLLATE utf8_bin DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`),
  KEY `sys_dict_value` (`value`),
  KEY `sys_dict_label` (`name`),
  KEY `sys_dict_del_flag` (`del_flag`)
) ENGINE=InnoDB AUTO_INCREMENT=121 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='字典表';

-- ----------------------------
-- Records of sys_dict
-- ----------------------------
INSERT INTO `sys_dict` VALUES ('1', '正常', '0', 'del_flag', '删除标记', '10', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('3', '显示', '1', 'show_hide', '显示/隐藏', '10', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('4', '隐藏', '0', 'show_hide', '显示/隐藏', '20', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('5', '是', '1', 'yes_no', '是/否', '10', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('6', '否', '0', 'yes_no', '是/否', '20', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('7', '红色', 'red', 'color', '颜色值', '10', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('8', '绿色', 'green', 'color', '颜色值', '20', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('9', '蓝色', 'blue', 'color', '颜色值', '30', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('10', '黄色', 'yellow', 'color', '颜色值', '40', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('11', '橙色', 'orange', 'color', '颜色值', '50', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('12', '默认主题', 'default', 'theme', '主题方案', '10', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('13', '天蓝主题', 'cerulean', 'theme', '主题方案', '20', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('14', '橙色主题', 'readable', 'theme', '主题方案', '30', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('15', '红色主题', 'united', 'theme', '主题方案', '40', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('16', 'Flat主题', 'flat', 'theme', '主题方案', '60', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('17', '国家', '1', 'sys_area_type', '区域类型', '10', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('18', '省份、直辖市', '2', 'sys_area_type', '区域类型', '20', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('19', '地市', '3', 'sys_area_type', '区域类型', '30', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('20', '区县', '4', 'sys_area_type', '区域类型', '40', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('21', '公司', '1', 'sys_office_type', '机构类型', '60', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('22', '部门', '2', 'sys_office_type', '机构类型', '70', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('23', '小组', '3', 'sys_office_type', '机构类型', '80', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('24', '其它', '4', 'sys_office_type', '机构类型', '90', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('25', '综合部', '1', 'sys_office_common', '快捷通用部门', '30', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('26', '开发部', '2', 'sys_office_common', '快捷通用部门', '40', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('27', '人力部', '3', 'sys_office_common', '快捷通用部门', '50', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('28', '一级', '1', 'sys_office_grade', '机构等级', '10', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('29', '二级', '2', 'sys_office_grade', '机构等级', '20', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('30', '三级', '3', 'sys_office_grade', '机构等级', '30', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('31', '四级', '4', 'sys_office_grade', '机构等级', '40', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('32', '所有数据', '1', 'sys_data_scope', '数据范围', '10', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('33', '所在公司及以下数据', '2', 'sys_data_scope', '数据范围', '20', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('34', '所在公司数据', '3', 'sys_data_scope', '数据范围', '30', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('35', '所在部门及以下数据', '4', 'sys_data_scope', '数据范围', '40', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('36', '所在部门数据', '5', 'sys_data_scope', '数据范围', '50', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('37', '仅本人数据', '8', 'sys_data_scope', '数据范围', '90', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('38', '按明细设置', '9', 'sys_data_scope', '数据范围', '100', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('39', '系统管理', '1', 'sys_user_type', '用户类型', '10', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('40', '部门经理', '2', 'sys_user_type', '用户类型', '20', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('41', '普通用户', '3', 'sys_user_type', '用户类型', '30', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('42', '基础主题', 'basic', 'cms_theme', '站点主题', '10', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('43', '蓝色主题', 'blue', 'cms_theme', '站点主题', '20', '0', '1', null, '1', null, null, '1');
INSERT INTO `sys_dict` VALUES ('44', '红色主题', 'red', 'cms_theme', '站点主题', '30', '0', '1', null, '1', null, null, '1');
INSERT INTO `sys_dict` VALUES ('45', '文章模型', 'article', 'cms_module', '栏目模型', '10', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('46', '图片模型', 'picture', 'cms_module', '栏目模型', '20', '0', '1', null, '1', null, null, '1');
INSERT INTO `sys_dict` VALUES ('47', '下载模型', 'download', 'cms_module', '栏目模型', '30', '0', '1', null, '1', null, null, '1');
INSERT INTO `sys_dict` VALUES ('48', '链接模型', 'link', 'cms_module', '栏目模型', '40', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('49', '专题模型', 'special', 'cms_module', '栏目模型', '50', '0', '1', null, '1', null, null, '1');
INSERT INTO `sys_dict` VALUES ('50', '默认展现方式', '0', 'cms_show_modes', '展现方式', '10', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('51', '首栏目内容列表', '1', 'cms_show_modes', '展现方式', '20', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('52', '栏目第一条内容', '2', 'cms_show_modes', '展现方式', '30', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('53', '发布', '0', 'cms_del_flag', '内容状态', '10', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('54', '删除', '1', 'cms_del_flag', '内容状态', '20', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('55', '审核', '2', 'cms_del_flag', '内容状态', '15', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('56', '首页焦点图', '1', 'cms_posid', '推荐位', '10', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('57', '栏目页文章推荐', '2', 'cms_posid', '推荐位', '20', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('58', '咨询', '1', 'cms_guestbook', '留言板分类', '10', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('59', '建议', '2', 'cms_guestbook', '留言板分类', '20', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('60', '投诉', '3', 'cms_guestbook', '留言板分类', '30', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('61', '其它', '4', 'cms_guestbook', '留言板分类', '40', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('62', '公休', '1', 'oa_leave_type', '请假类型', '10', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('63', '病假', '2', 'oa_leave_type', '请假类型', '20', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('64', '事假', '3', 'oa_leave_type', '请假类型', '30', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('65', '调休', '4', 'oa_leave_type', '请假类型', '40', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('66', '婚假', '5', 'oa_leave_type', '请假类型', '60', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('67', '接入日志', '1', 'sys_log_type', '日志类型', '30', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('68', '异常日志', '2', 'sys_log_type', '日志类型', '40', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('69', '请假流程', 'leave', 'act_type', '流程类型', '10', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('70', '审批测试流程', 'test_audit', 'act_type', '流程类型', '20', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('71', '分类1', '1', 'act_category', '流程分类', '10', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('72', '分类2', '2', 'act_category', '流程分类', '20', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('73', '增删改查', 'crud', 'gen_category', '代码生成分类', '10', '0', '1', null, '1', null, null, '1');
INSERT INTO `sys_dict` VALUES ('74', '增删改查（包含从表）', 'crud_many', 'gen_category', '代码生成分类', '20', '0', '1', null, '1', null, null, '1');
INSERT INTO `sys_dict` VALUES ('75', '树结构', 'tree', 'gen_category', '代码生成分类', '30', '0', '1', null, '1', null, null, '1');
INSERT INTO `sys_dict` VALUES ('76', '=', '=', 'gen_query_type', '查询方式', '10', '0', '1', null, '1', null, null, '1');
INSERT INTO `sys_dict` VALUES ('77', '!=', '!=', 'gen_query_type', '查询方式', '20', '0', '1', null, '1', null, null, '1');
INSERT INTO `sys_dict` VALUES ('78', '&gt;', '&gt;', 'gen_query_type', '查询方式', '30', '0', '1', null, '1', null, null, '1');
INSERT INTO `sys_dict` VALUES ('79', '&lt;', '&lt;', 'gen_query_type', '查询方式', '40', '0', '1', null, '1', null, null, '1');
INSERT INTO `sys_dict` VALUES ('80', 'Between', 'between', 'gen_query_type', '查询方式', '50', '0', '1', null, '1', null, null, '1');
INSERT INTO `sys_dict` VALUES ('81', 'Like', 'like', 'gen_query_type', '查询方式', '60', '0', '1', null, '1', null, null, '1');
INSERT INTO `sys_dict` VALUES ('82', 'Left Like', 'left_like', 'gen_query_type', '查询方式', '70', '0', '1', null, '1', null, null, '1');
INSERT INTO `sys_dict` VALUES ('83', 'Right Like', 'right_like', 'gen_query_type', '查询方式', '80', '0', '1', null, '1', null, null, '1');
INSERT INTO `sys_dict` VALUES ('84', '文本框', 'input', 'gen_show_type', '字段生成方案', '10', '0', '1', null, '1', null, null, '1');
INSERT INTO `sys_dict` VALUES ('85', '文本域', 'textarea', 'gen_show_type', '字段生成方案', '20', '0', '1', null, '1', null, null, '1');
INSERT INTO `sys_dict` VALUES ('86', '下拉框', 'select', 'gen_show_type', '字段生成方案', '30', '0', '1', null, '1', null, null, '1');
INSERT INTO `sys_dict` VALUES ('87', '复选框', 'checkbox', 'gen_show_type', '字段生成方案', '40', '0', '1', null, '1', null, null, '1');
INSERT INTO `sys_dict` VALUES ('88', '单选框', 'radiobox', 'gen_show_type', '字段生成方案', '50', '0', '1', null, '1', null, null, '1');
INSERT INTO `sys_dict` VALUES ('89', '日期选择', 'dateselect', 'gen_show_type', '字段生成方案', '60', '0', '1', null, '1', null, null, '1');
INSERT INTO `sys_dict` VALUES ('90', '人员选择', 'userselect', 'gen_show_type', '字段生成方案', '70', '0', '1', null, '1', null, null, '1');
INSERT INTO `sys_dict` VALUES ('91', '部门选择', 'officeselect', 'gen_show_type', '字段生成方案', '80', '0', '1', null, '1', null, null, '1');
INSERT INTO `sys_dict` VALUES ('92', '区域选择', 'areaselect', 'gen_show_type', '字段生成方案', '90', '0', '1', null, '1', null, null, '1');
INSERT INTO `sys_dict` VALUES ('93', 'String', 'String', 'gen_java_type', 'Java类型', '10', '0', '1', null, '1', null, null, '1');
INSERT INTO `sys_dict` VALUES ('94', 'Long', 'Long', 'gen_java_type', 'Java类型', '20', '0', '1', null, '1', null, null, '1');
INSERT INTO `sys_dict` VALUES ('95', '仅持久层', 'dao', 'gen_category', '代码生成分类\0\0', '40', '0', '1', null, '1', null, null, '1');
INSERT INTO `sys_dict` VALUES ('96', '男', '1', 'sex', '性别', '10', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('97', '女', '2', 'sex', '性别', '20', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('98', 'Integer', 'Integer', 'gen_java_type', 'Java类型', '30', '0', '1', null, '1', null, null, '1');
INSERT INTO `sys_dict` VALUES ('99', 'Double', 'Double', 'gen_java_type', 'Java类型', '40', '0', '1', null, '1', null, null, '1');
INSERT INTO `sys_dict` VALUES ('100', 'Date', 'java.util.Date', 'gen_java_type', 'Java类型', '50', '0', '1', null, '1', null, null, '1');
INSERT INTO `sys_dict` VALUES ('104', 'Custom', 'Custom', 'gen_java_type', 'Java类型', '90', '0', '1', null, '1', null, null, '1');
INSERT INTO `sys_dict` VALUES ('105', '会议通告', '1', 'oa_notify_type', '通知通告类型', '10', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('106', '奖惩通告', '2', 'oa_notify_type', '通知通告类型', '20', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('107', '活动通告', '3', 'oa_notify_type', '通知通告类型', '30', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('108', '草稿', '0', 'oa_notify_status', '通知通告状态', '10', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('109', '发布', '1', 'oa_notify_status', '通知通告状态', '20', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('110', '未读', '0', 'oa_notify_read', '通知通告状态', '10', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('111', '已读', '1', 'oa_notify_read', '通知通告状态', '20', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('112', '草稿', '0', 'oa_notify_status', '通知通告状态', '10', '0', '1', null, '1', null, '', '0');
INSERT INTO `sys_dict` VALUES ('113', '删除', '0', 'del_flag', '删除标记', null, null, null, null, null, null, '', '');

-- ----------------------------
-- Table structure for sys_file
-- ----------------------------
DROP TABLE IF EXISTS `sys_file`;
CREATE TABLE `sys_file` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `type` int(11) DEFAULT NULL COMMENT '文件类型',
  `url` varchar(200) DEFAULT NULL COMMENT 'URL地址',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=149 DEFAULT CHARSET=utf8 COMMENT='文件上传';

-- ----------------------------
-- Records of sys_file
-- ----------------------------
INSERT INTO `sys_file` VALUES ('136', '0', '/files/bf4c0d97-79d5-40ad-9eec-7ac7757e58cb.jpg', '2017-12-17 13:46:03');
INSERT INTO `sys_file` VALUES ('138', '0', '/files/cbe724af-a77b-45f7-9af2-4d3640b576a1.jpeg', '2017-12-17 14:21:19');
INSERT INTO `sys_file` VALUES ('139', '0', '/files/3f932be7-92d0-4ea0-b28b-75dd1de10177.jpg', '2017-12-17 14:22:39');
INSERT INTO `sys_file` VALUES ('140', '0', '/files/225b92c9-b1de-4530-9bc2-2f0aad47922c.jpg', '2017-12-17 14:28:14');
INSERT INTO `sys_file` VALUES ('141', '0', '/files/809fd3a1-1d91-4fac-89f8-03f4cf2063f2.jpg', '2017-12-17 14:36:25');
INSERT INTO `sys_file` VALUES ('142', '0', '/files/7283d1bf-2cfd-484d-95f8-1dd0fcd0ee6e.png', '2017-12-17 15:21:59');
INSERT INTO `sys_file` VALUES ('143', '0', '/files/66c1afad-4ad9-4f3e-9a9d-b9b974b36c61.jpg', '2017-12-17 18:50:40');
INSERT INTO `sys_file` VALUES ('144', '0', '/files/b59ff373-9f80-4c83-a1dd-a21f94264bd4.jpg', '2017-12-17 19:19:43');
INSERT INTO `sys_file` VALUES ('145', '0', '/files/c3d9d663-64ad-4cf2-9d5e-12d50d726484.jpeg', '2017-12-17 19:19:57');
INSERT INTO `sys_file` VALUES ('146', '0', '/files/2f76e864-1997-42a4-8b36-5fe69f5528e5.jpg', '2017-12-17 19:20:12');
INSERT INTO `sys_file` VALUES ('147', '0', '/files/b2bffba6-81e0-47b1-8468-c34f82bec962.jpg', '2017-12-17 19:20:28');
INSERT INTO `sys_file` VALUES ('148', '0', '/files/a38b5e53-d31c-430f-965e-84661a72518d.jpeg', '2017-12-17 19:20:41');

-- ----------------------------
-- Table structure for sys_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_log`;
CREATE TABLE `sys_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户id',
  `username` varchar(50) DEFAULT NULL COMMENT '用户名',
  `operation` varchar(50) DEFAULT NULL COMMENT '用户操作',
  `time` int(11) DEFAULT NULL COMMENT '响应时间',
  `method` varchar(200) DEFAULT NULL COMMENT '请求方法',
  `params` varchar(5000) DEFAULT NULL COMMENT '请求参数',
  `ip` varchar(64) DEFAULT NULL COMMENT 'IP地址',
  `gmt_create` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8255 DEFAULT CHARSET=utf8 COMMENT='系统日志';

-- ----------------------------
-- Records of sys_log
-- ----------------------------
INSERT INTO `sys_log` VALUES ('7956', '1', 'admin', '登录', '7', 'com.bootdo.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2017-12-13 20:04:53');
INSERT INTO `sys_log` VALUES ('7957', '1', 'admin', '请求访问主页', '22', 'com.bootdo.system.controller.LoginController.index()', null, '127.0.0.1', '2017-12-13 20:04:53');
INSERT INTO `sys_log` VALUES ('7958', '1', 'admin', '登录', '29', 'com.bootdo.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2017-12-13 20:23:25');
INSERT INTO `sys_log` VALUES ('7959', '1', 'admin', '请求访问主页', '53', 'com.bootdo.system.controller.LoginController.index()', null, '127.0.0.1', '2017-12-13 20:23:26');
INSERT INTO `sys_log` VALUES ('7960', '1', 'admin', '请求访问主页', '9', 'com.bootdo.system.controller.LoginController.index()', null, '127.0.0.1', '2017-12-13 20:24:04');
INSERT INTO `sys_log` VALUES ('7961', '1', 'admin', '请求访问主页', '12', 'com.bootdo.system.controller.LoginController.index()', null, '127.0.0.1', '2017-12-13 21:19:42');
INSERT INTO `sys_log` VALUES ('7962', '-1', '获取用户信息为空', '登录', '8', 'com.bootdo.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2017-12-13 23:20:32');
INSERT INTO `sys_log` VALUES ('7963', '-1', '获取用户信息为空', '登录', '3', 'com.bootdo.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2017-12-13 23:20:35');
INSERT INTO `sys_log` VALUES ('7964', '-1', '获取用户信息为空', '登录', '63769', 'com.bootdo.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2017-12-13 23:22:11');
INSERT INTO `sys_log` VALUES ('7965', '-1', '获取用户信息为空', '登录', '2664', 'com.bootdo.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2017-12-13 23:26:59');
INSERT INTO `sys_log` VALUES ('7966', '-1', '获取用户信息为空', '登录', '3', 'com.bootdo.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2017-12-13 23:27:05');
INSERT INTO `sys_log` VALUES ('7967', '-1', '获取用户信息为空', '登录', '4', 'com.bootdo.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2017-12-13 23:27:09');
INSERT INTO `sys_log` VALUES ('7968', '-1', '获取用户信息为空', '登录', '3', 'com.bootdo.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2017-12-13 23:27:11');
INSERT INTO `sys_log` VALUES ('7969', '-1', '获取用户信息为空', '登录', '3', 'com.bootdo.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2017-12-13 23:27:15');
INSERT INTO `sys_log` VALUES ('7970', '-1', '获取用户信息为空', '登录', '2', 'com.bootdo.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2017-12-13 23:27:23');
INSERT INTO `sys_log` VALUES ('7971', '-1', '获取用户信息为空', '登录', '2', 'com.bootdo.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2017-12-13 23:27:29');
INSERT INTO `sys_log` VALUES ('7972', '1', 'admin', '登录', '18', 'com.bootdo.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2017-12-13 23:31:08');
INSERT INTO `sys_log` VALUES ('7973', '1', 'admin', '请求访问主页', '32', 'com.bootdo.system.controller.LoginController.index()', null, '127.0.0.1', '2017-12-13 23:31:08');
INSERT INTO `sys_log` VALUES ('7974', '1', 'admin', '编辑用户', '16', 'com.bootdo.system.controller.UserController.edit()', null, '127.0.0.1', '2017-12-13 23:31:50');
INSERT INTO `sys_log` VALUES ('7975', '1', 'admin', '登录', '12', 'com.bootdo.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2017-12-16 18:27:10');
INSERT INTO `sys_log` VALUES ('7976', '1', 'admin', '请求访问主页', '35', 'com.bootdo.system.controller.LoginController.index()', null, '127.0.0.1', '2017-12-16 18:27:10');
INSERT INTO `sys_log` VALUES ('7977', '1', 'admin', '编辑菜单', '4', 'com.bootdo.system.controller.MenuController.edit()', null, '127.0.0.1', '2017-12-16 18:28:50');
INSERT INTO `sys_log` VALUES ('7978', '1', 'admin', '编辑角色', '2', 'com.bootdo.system.controller.RoleController.edit()', null, '127.0.0.1', '2017-12-16 18:37:44');
INSERT INTO `sys_log` VALUES ('7979', '1', 'admin', '登录', '4', 'com.bootdo.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2017-12-16 18:53:35');
INSERT INTO `sys_log` VALUES ('7980', '1', 'admin', '请求访问主页', '6', 'com.bootdo.system.controller.LoginController.index()', null, '127.0.0.1', '2017-12-16 18:53:35');
INSERT INTO `sys_log` VALUES ('7981', '1', 'admin', '登录', '1', 'com.bootdo.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2017-12-16 18:53:42');
INSERT INTO `sys_log` VALUES ('7982', '1', 'admin', '请求访问主页', '5', 'com.bootdo.system.controller.LoginController.index()', null, '127.0.0.1', '2017-12-16 18:53:42');
INSERT INTO `sys_log` VALUES ('7983', '1', 'admin', '登录', '3', 'com.bootdo.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2017-12-16 18:57:52');
INSERT INTO `sys_log` VALUES ('7984', '1', 'admin', '请求访问主页', '4', 'com.bootdo.system.controller.LoginController.index()', null, '127.0.0.1', '2017-12-16 18:57:52');
INSERT INTO `sys_log` VALUES ('7985', '-1', '获取用户信息为空', '登录', '8', 'com.bootdo.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2017-12-16 19:49:07');
INSERT INTO `sys_log` VALUES ('7986', '1', 'admin', '登录', '5', 'com.bootdo.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2017-12-16 19:49:11');
INSERT INTO `sys_log` VALUES ('7987', '1', 'admin', '请求访问主页', '37', 'com.bootdo.system.controller.LoginController.index()', null, '127.0.0.1', '2017-12-16 19:49:11');
INSERT INTO `sys_log` VALUES ('7988', '1', 'admin', '删除菜单', '9', 'com.bootdo.system.controller.MenuController.remove()', null, '127.0.0.1', '2017-12-16 19:50:58');
INSERT INTO `sys_log` VALUES ('7989', '1', 'admin', '删除菜单', '5', 'com.bootdo.system.controller.MenuController.remove()', null, '127.0.0.1', '2017-12-16 19:51:05');
INSERT INTO `sys_log` VALUES ('7990', '1', 'admin', '删除菜单', '4', 'com.bootdo.system.controller.MenuController.remove()', null, '127.0.0.1', '2017-12-16 19:51:21');
INSERT INTO `sys_log` VALUES ('7991', '1', 'admin', '删除菜单', '3', 'com.bootdo.system.controller.MenuController.remove()', null, '127.0.0.1', '2017-12-16 19:51:25');
INSERT INTO `sys_log` VALUES ('7992', '1', 'admin', '删除菜单', '4', 'com.bootdo.system.controller.MenuController.remove()', null, '127.0.0.1', '2017-12-16 19:51:27');
INSERT INTO `sys_log` VALUES ('7993', '1', 'admin', '删除菜单', '3', 'com.bootdo.system.controller.MenuController.remove()', null, '127.0.0.1', '2017-12-16 19:51:30');
INSERT INTO `sys_log` VALUES ('7994', '1', 'admin', '删除菜单', '6', 'com.bootdo.system.controller.MenuController.remove()', null, '127.0.0.1', '2017-12-16 19:51:33');
INSERT INTO `sys_log` VALUES ('7995', '1', 'admin', '删除菜单', '4', 'com.bootdo.system.controller.MenuController.remove()', null, '127.0.0.1', '2017-12-16 19:51:35');
INSERT INTO `sys_log` VALUES ('7996', '1', 'admin', '删除菜单', '6', 'com.bootdo.system.controller.MenuController.remove()', null, '127.0.0.1', '2017-12-16 19:51:38');
INSERT INTO `sys_log` VALUES ('7997', '1', 'admin', '删除菜单', '4', 'com.bootdo.system.controller.MenuController.remove()', null, '127.0.0.1', '2017-12-16 19:51:41');
INSERT INTO `sys_log` VALUES ('7998', '1', 'admin', '删除菜单', '4', 'com.bootdo.system.controller.MenuController.remove()', null, '127.0.0.1', '2017-12-16 19:51:43');
INSERT INTO `sys_log` VALUES ('7999', '1', 'admin', '删除菜单', '4', 'com.bootdo.system.controller.MenuController.remove()', null, '127.0.0.1', '2017-12-16 19:51:46');
INSERT INTO `sys_log` VALUES ('8000', '1', 'admin', '删除菜单', '4', 'com.bootdo.system.controller.MenuController.remove()', null, '127.0.0.1', '2017-12-16 19:51:48');
INSERT INTO `sys_log` VALUES ('8001', '1', 'admin', '删除菜单', '4', 'com.bootdo.system.controller.MenuController.remove()', null, '127.0.0.1', '2017-12-16 19:51:50');
INSERT INTO `sys_log` VALUES ('8002', '1', 'admin', '添加菜单', '0', 'com.bootdo.system.controller.MenuController.add()', null, '127.0.0.1', '2017-12-16 19:52:17');
INSERT INTO `sys_log` VALUES ('8003', '1', 'admin', '删除菜单', '5', 'com.bootdo.system.controller.MenuController.remove()', null, '127.0.0.1', '2017-12-16 19:52:29');
INSERT INTO `sys_log` VALUES ('8004', '1', 'admin', '删除菜单', '5', 'com.bootdo.system.controller.MenuController.remove()', null, '127.0.0.1', '2017-12-16 19:52:32');
INSERT INTO `sys_log` VALUES ('8005', '1', 'admin', '请求访问主页', '5', 'com.bootdo.system.controller.LoginController.index()', null, '127.0.0.1', '2017-12-16 19:54:57');
INSERT INTO `sys_log` VALUES ('8006', '1', 'admin', '请求访问主页', '5', 'com.bootdo.system.controller.LoginController.index()', null, '127.0.0.1', '2017-12-16 20:00:13');
INSERT INTO `sys_log` VALUES ('8007', '1', 'admin', '请求访问主页', '8', 'com.bootdo.system.controller.LoginController.index()', null, '127.0.0.1', '2017-12-16 20:01:48');
INSERT INTO `sys_log` VALUES ('8008', '-1', '获取用户信息为空', '登录', '7', 'com.bootdo.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2017-12-16 20:09:04');
INSERT INTO `sys_log` VALUES ('8009', '1', 'admin', '登录', '7', 'com.bootdo.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2017-12-16 20:09:08');
INSERT INTO `sys_log` VALUES ('8010', '1', 'admin', '请求访问主页', '31', 'com.bootdo.system.controller.LoginController.index()', null, '127.0.0.1', '2017-12-16 20:09:08');
INSERT INTO `sys_log` VALUES ('8011', '1', 'admin', '请求访问主页', '9', 'com.bootdo.system.controller.LoginController.index()', null, '127.0.0.1', '2017-12-16 20:09:57');
INSERT INTO `sys_log` VALUES ('8012', '1', 'admin', '请求访问主页', '7', 'com.bootdo.system.controller.LoginController.index()', null, '127.0.0.1', '2017-12-16 20:10:15');
INSERT INTO `sys_log` VALUES ('8013', '1', 'admin', '请求访问主页', '2744', 'com.bootdo.system.controller.LoginController.index()', null, '127.0.0.1', '2017-12-16 20:11:15');
INSERT INTO `sys_log` VALUES ('8014', '1', 'admin', '请求访问主页', '2856', 'com.bootdo.system.controller.LoginController.index()', null, '127.0.0.1', '2017-12-16 20:11:34');
INSERT INTO `sys_log` VALUES ('8015', '1', 'admin', '编辑角色', '3', 'com.bootdo.system.controller.RoleController.edit()', null, '127.0.0.1', '2017-12-16 20:13:40');
INSERT INTO `sys_log` VALUES ('8016', '-1', '获取用户信息为空', '登录', '4', 'com.bootdo.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2017-12-16 20:24:21');
INSERT INTO `sys_log` VALUES ('8017', '1', 'admin', '登录', '3', 'com.bootdo.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2017-12-16 20:24:24');
INSERT INTO `sys_log` VALUES ('8018', '1', 'admin', '请求访问主页', '25', 'com.bootdo.system.controller.LoginController.index()', null, '127.0.0.1', '2017-12-16 20:24:24');
INSERT INTO `sys_log` VALUES ('8019', '-1', '获取用户信息为空', '登录', '22', 'com.bootdo.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2017-12-16 20:35:06');
INSERT INTO `sys_log` VALUES ('8020', '1', 'admin', '登录', '12', 'com.bootdo.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2017-12-16 20:35:10');
INSERT INTO `sys_log` VALUES ('8021', '1', 'admin', '请求访问主页', '63', 'com.bootdo.system.controller.LoginController.index()', null, '127.0.0.1', '2017-12-16 20:35:10');
INSERT INTO `sys_log` VALUES ('8022', '1', 'admin', '登录', '20', 'com.bootdo.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2017-12-16 20:36:30');
INSERT INTO `sys_log` VALUES ('8023', '1', 'admin', '请求访问主页', '63', 'com.bootdo.system.controller.LoginController.index()', null, '127.0.0.1', '2017-12-16 20:36:30');
INSERT INTO `sys_log` VALUES ('8024', '1', 'admin', '登录', '20', 'com.bootdo.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2017-12-16 20:56:38');
INSERT INTO `sys_log` VALUES ('8025', '1', 'admin', '请求访问主页', '60', 'com.bootdo.system.controller.LoginController.index()', null, '127.0.0.1', '2017-12-16 20:56:38');
INSERT INTO `sys_log` VALUES ('8026', '1', 'admin', '登录', '19', 'com.bootdo.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2017-12-16 20:58:25');
INSERT INTO `sys_log` VALUES ('8027', '1', 'admin', '请求访问主页', '59', 'com.bootdo.system.controller.LoginController.index()', null, '127.0.0.1', '2017-12-16 20:58:25');
INSERT INTO `sys_log` VALUES ('8028', '1', 'admin', '登录', '22', 'com.bootdo.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2017-12-16 21:04:40');
INSERT INTO `sys_log` VALUES ('8029', '1', 'admin', '请求访问主页', '59', 'com.bootdo.system.controller.LoginController.index()', null, '127.0.0.1', '2017-12-16 21:04:40');
INSERT INTO `sys_log` VALUES ('8030', '1', 'admin', '登录', '20', 'com.bootdo.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2017-12-16 21:07:05');
INSERT INTO `sys_log` VALUES ('8031', '1', 'admin', '请求访问主页', '58', 'com.bootdo.system.controller.LoginController.index()', null, '127.0.0.1', '2017-12-16 21:07:05');
INSERT INTO `sys_log` VALUES ('8032', '1', 'admin', '登录', '23', 'com.bootdo.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2017-12-16 21:14:35');
INSERT INTO `sys_log` VALUES ('8033', '1', 'admin', '请求访问主页', '59', 'com.bootdo.system.controller.LoginController.index()', null, '127.0.0.1', '2017-12-16 21:14:35');
INSERT INTO `sys_log` VALUES ('8034', '1', 'admin', '添加菜单', '0', 'com.bootdo.system.controller.MenuController.add()', null, '127.0.0.1', '2017-12-16 21:16:07');
INSERT INTO `sys_log` VALUES ('8035', '1', 'admin', '添加用户', '2', 'com.bootdo.system.controller.UserController.add()', null, '127.0.0.1', '2017-12-16 21:16:46');
INSERT INTO `sys_log` VALUES ('8036', '1', 'admin', '添加用户', '0', 'com.bootdo.system.controller.UserController.add()', null, '127.0.0.1', '2017-12-16 21:16:59');
INSERT INTO `sys_log` VALUES ('8037', '1', 'admin', '添加用户', '0', 'com.bootdo.system.controller.UserController.add()', null, '127.0.0.1', '2017-12-16 21:37:03');
INSERT INTO `sys_log` VALUES ('8038', '1', 'admin', '编辑用户', '25', 'com.bootdo.system.controller.UserController.edit()', null, '127.0.0.1', '2017-12-16 21:37:28');
INSERT INTO `sys_log` VALUES ('8039', '1', 'admin', '更新用户', '30', 'com.bootdo.system.controller.UserController.update()', null, '127.0.0.1', '2017-12-16 21:37:47');
INSERT INTO `sys_log` VALUES ('8040', '1', 'admin', '编辑菜单', '5', 'com.bootdo.system.controller.MenuController.edit()', null, '127.0.0.1', '2017-12-16 21:38:28');
INSERT INTO `sys_log` VALUES ('8041', '1', 'admin', '更新菜单', '8', 'com.bootdo.system.controller.MenuController.update()', null, '127.0.0.1', '2017-12-16 21:39:19');
INSERT INTO `sys_log` VALUES ('8042', '1', 'admin', '编辑菜单', '8', 'com.bootdo.system.controller.MenuController.edit()', null, '127.0.0.1', '2017-12-16 21:39:28');
INSERT INTO `sys_log` VALUES ('8043', '1', 'admin', '更新菜单', '6', 'com.bootdo.system.controller.MenuController.update()', null, '127.0.0.1', '2017-12-16 21:40:45');
INSERT INTO `sys_log` VALUES ('8044', '1', 'admin', '编辑菜单', '8', 'com.bootdo.system.controller.MenuController.edit()', null, '127.0.0.1', '2017-12-16 21:45:53');
INSERT INTO `sys_log` VALUES ('8045', '1', 'admin', '更新菜单', '5', 'com.bootdo.system.controller.MenuController.update()', null, '127.0.0.1', '2017-12-16 21:46:44');
INSERT INTO `sys_log` VALUES ('8046', '1', 'admin', '编辑菜单', '8', 'com.bootdo.system.controller.MenuController.edit()', null, '127.0.0.1', '2017-12-16 21:49:51');
INSERT INTO `sys_log` VALUES ('8047', '1', 'admin', '更新菜单', '5', 'com.bootdo.system.controller.MenuController.update()', null, '127.0.0.1', '2017-12-16 21:50:10');
INSERT INTO `sys_log` VALUES ('8048', '1', 'admin', '编辑菜单', '8', 'com.bootdo.system.controller.MenuController.edit()', null, '127.0.0.1', '2017-12-16 21:50:30');
INSERT INTO `sys_log` VALUES ('8049', '1', 'admin', '更新菜单', '4', 'com.bootdo.system.controller.MenuController.update()', null, '127.0.0.1', '2017-12-16 21:50:40');
INSERT INTO `sys_log` VALUES ('8050', '1', 'admin', '编辑菜单', '6', 'com.bootdo.system.controller.MenuController.edit()', null, '127.0.0.1', '2017-12-16 21:50:44');
INSERT INTO `sys_log` VALUES ('8051', '1', 'admin', '更新菜单', '5', 'com.bootdo.system.controller.MenuController.update()', null, '127.0.0.1', '2017-12-16 21:50:54');
INSERT INTO `sys_log` VALUES ('8052', '1', 'admin', '编辑菜单', '6', 'com.bootdo.system.controller.MenuController.edit()', null, '127.0.0.1', '2017-12-16 21:51:01');
INSERT INTO `sys_log` VALUES ('8053', '1', 'admin', '更新菜单', '4', 'com.bootdo.system.controller.MenuController.update()', null, '127.0.0.1', '2017-12-16 21:51:06');
INSERT INTO `sys_log` VALUES ('8054', '1', 'admin', '请求访问主页', '6', 'com.bootdo.system.controller.LoginController.index()', null, '127.0.0.1', '2017-12-16 21:51:39');
INSERT INTO `sys_log` VALUES ('8055', '1', 'admin', '请求访问主页', '5', 'com.bootdo.system.controller.LoginController.index()', null, '127.0.0.1', '2017-12-16 22:32:40');
INSERT INTO `sys_log` VALUES ('8056', '1', 'admin', '请求访问主页', '4', 'com.bootdo.system.controller.LoginController.index()', null, '127.0.0.1', '2017-12-16 22:33:02');
INSERT INTO `sys_log` VALUES ('8057', '1', 'admin', '请求访问主页', '5', 'com.bootdo.system.controller.LoginController.index()', null, '127.0.0.1', '2017-12-16 22:47:15');
INSERT INTO `sys_log` VALUES ('8058', '1', 'admin', '登录', '22', 'com.bootdo.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2017-12-16 22:56:06');
INSERT INTO `sys_log` VALUES ('8059', '1', 'admin', '请求访问主页', '56', 'com.bootdo.system.controller.LoginController.index()', null, '127.0.0.1', '2017-12-16 22:56:06');
INSERT INTO `sys_log` VALUES ('8060', '1', 'admin', '编辑菜单', '15', 'com.bootdo.system.controller.MenuController.edit()', null, '127.0.0.1', '2017-12-16 23:00:29');
INSERT INTO `sys_log` VALUES ('8061', '1', 'admin', '请求访问主页', '10', 'com.bootdo.system.controller.LoginController.index()', null, '127.0.0.1', '2017-12-16 23:03:20');
INSERT INTO `sys_log` VALUES ('8062', '1', 'admin', '编辑菜单', '6', 'com.bootdo.system.controller.MenuController.edit()', null, '127.0.0.1', '2017-12-16 23:06:02');
INSERT INTO `sys_log` VALUES ('8063', '1', 'admin', '更新菜单', '21', 'com.bootdo.system.controller.MenuController.update()', null, '127.0.0.1', '2017-12-16 23:06:15');
INSERT INTO `sys_log` VALUES ('8064', '1', 'admin', '添加菜单', '0', 'com.bootdo.system.controller.MenuController.add()', null, '127.0.0.1', '2017-12-16 23:06:36');
INSERT INTO `sys_log` VALUES ('8065', '1', 'admin', '删除菜单', '10', 'com.bootdo.system.controller.MenuController.remove()', null, '127.0.0.1', '2017-12-16 23:07:03');
INSERT INTO `sys_log` VALUES ('8066', '1', 'admin', '编辑菜单', '7', 'com.bootdo.system.controller.MenuController.edit()', null, '127.0.0.1', '2017-12-16 23:07:20');
INSERT INTO `sys_log` VALUES ('8067', '1', 'admin', '添加菜单', '0', 'com.bootdo.system.controller.MenuController.add()', null, '127.0.0.1', '2017-12-16 23:07:24');
INSERT INTO `sys_log` VALUES ('8068', '1', 'admin', '编辑菜单', '9', 'com.bootdo.system.controller.MenuController.edit()', null, '127.0.0.1', '2017-12-16 23:07:48');
INSERT INTO `sys_log` VALUES ('8069', '1', 'admin', '更新菜单', '6', 'com.bootdo.system.controller.MenuController.update()', null, '127.0.0.1', '2017-12-16 23:08:13');
INSERT INTO `sys_log` VALUES ('8070', '1', 'admin', '删除菜单', '5', 'com.bootdo.system.controller.MenuController.remove()', null, '127.0.0.1', '2017-12-16 23:08:28');
INSERT INTO `sys_log` VALUES ('8071', '1', 'admin', '编辑菜单', '7', 'com.bootdo.system.controller.MenuController.edit()', null, '127.0.0.1', '2017-12-16 23:08:31');
INSERT INTO `sys_log` VALUES ('8072', '1', 'admin', '更新菜单', '5', 'com.bootdo.system.controller.MenuController.update()', null, '127.0.0.1', '2017-12-16 23:08:55');
INSERT INTO `sys_log` VALUES ('8073', '1', 'admin', '编辑菜单', '8', 'com.bootdo.system.controller.MenuController.edit()', null, '127.0.0.1', '2017-12-16 23:09:10');
INSERT INTO `sys_log` VALUES ('8074', '1', 'admin', '编辑菜单', '9', 'com.bootdo.system.controller.MenuController.edit()', null, '127.0.0.1', '2017-12-16 23:09:16');
INSERT INTO `sys_log` VALUES ('8075', '1', 'admin', '更新菜单', '6', 'com.bootdo.system.controller.MenuController.update()', null, '127.0.0.1', '2017-12-16 23:09:29');
INSERT INTO `sys_log` VALUES ('8076', '1', 'admin', '编辑菜单', '9', 'com.bootdo.system.controller.MenuController.edit()', null, '127.0.0.1', '2017-12-16 23:09:34');
INSERT INTO `sys_log` VALUES ('8077', '1', 'admin', '更新菜单', '6', 'com.bootdo.system.controller.MenuController.update()', null, '127.0.0.1', '2017-12-16 23:09:40');
INSERT INTO `sys_log` VALUES ('8078', '1', 'admin', '编辑菜单', '8', 'com.bootdo.system.controller.MenuController.edit()', null, '127.0.0.1', '2017-12-16 23:09:44');
INSERT INTO `sys_log` VALUES ('8079', '1', 'admin', '更新菜单', '4', 'com.bootdo.system.controller.MenuController.update()', null, '127.0.0.1', '2017-12-16 23:09:48');
INSERT INTO `sys_log` VALUES ('8080', '1', 'admin', '请求访问主页', '12', 'com.bootdo.system.controller.LoginController.index()', null, '127.0.0.1', '2017-12-16 23:13:20');
INSERT INTO `sys_log` VALUES ('8081', '1', 'admin', '请求访问主页', '8', 'com.bootdo.system.controller.LoginController.index()', null, '127.0.0.1', '2017-12-16 23:18:43');
INSERT INTO `sys_log` VALUES ('8082', '1', 'admin', '请求访问主页', '7', 'com.bootdo.system.controller.LoginController.index()', null, '127.0.0.1', '2017-12-16 23:21:14');
INSERT INTO `sys_log` VALUES ('8083', '1', 'admin', '请求访问主页', '6', 'com.bootdo.system.controller.LoginController.index()', null, '127.0.0.1', '2017-12-16 23:21:52');
INSERT INTO `sys_log` VALUES ('8084', '1', 'admin', '请求访问主页', '6', 'com.bootdo.system.controller.LoginController.index()', null, '127.0.0.1', '2017-12-16 23:26:33');
INSERT INTO `sys_log` VALUES ('8085', '1', 'admin', '添加用户', '4', 'com.bootdo.system.controller.UserController.add()', null, '127.0.0.1', '2017-12-16 23:29:47');
INSERT INTO `sys_log` VALUES ('8086', '1', 'admin', '登录', '21', 'com.bootdo.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2017-12-16 23:45:08');
INSERT INTO `sys_log` VALUES ('8087', '1', 'admin', '请求访问主页', '55', 'com.bootdo.system.controller.LoginController.index()', null, '127.0.0.1', '2017-12-16 23:45:08');
INSERT INTO `sys_log` VALUES ('8088', '1', 'admin', '登录', '19', 'com.bootdo.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2017-12-16 23:52:46');
INSERT INTO `sys_log` VALUES ('8089', '1', 'admin', '请求访问主页', '53', 'com.bootdo.system.controller.LoginController.index()', null, '127.0.0.1', '2017-12-16 23:52:46');
INSERT INTO `sys_log` VALUES ('8090', '1', 'admin', '请求访问主页', '20', 'com.bootdo.system.controller.LoginController.index()', null, '127.0.0.1', '2017-12-16 23:54:11');
INSERT INTO `sys_log` VALUES ('8091', '1', 'admin', '添加用户', '33', 'com.bootdo.system.controller.UserController.add()', null, '127.0.0.1', '2017-12-16 23:54:38');
INSERT INTO `sys_log` VALUES ('8092', '1', 'admin', '保存用户', '43', 'com.bootdo.system.controller.UserController.save()', null, '127.0.0.1', '2017-12-16 23:55:06');
INSERT INTO `sys_log` VALUES ('8093', '1', 'admin', '登录', '27', 'com.bootdo.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2017-12-17 09:32:42');
INSERT INTO `sys_log` VALUES ('8094', '1', 'admin', '请求访问主页', '60', 'com.bootdo.system.controller.LoginController.index()', null, '127.0.0.1', '2017-12-17 09:32:42');
INSERT INTO `sys_log` VALUES ('8095', '1', 'admin', '登录', '9', 'com.bootdo.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2017-12-17 10:02:06');
INSERT INTO `sys_log` VALUES ('8096', '1', 'admin', '请求访问主页', '36', 'com.bootdo.system.controller.LoginController.index()', null, '127.0.0.1', '2017-12-17 10:02:06');
INSERT INTO `sys_log` VALUES ('8097', '1', 'admin', '请求更改用户密码', '0', 'com.bootdo.system.controller.UserController.resetPwd()', null, '127.0.0.1', '2017-12-17 10:03:40');
INSERT INTO `sys_log` VALUES ('8098', '1', 'admin', '编辑用户', '18', 'com.bootdo.system.controller.UserController.edit()', null, '127.0.0.1', '2017-12-17 10:03:43');
INSERT INTO `sys_log` VALUES ('8099', '1', 'admin', '请求更改用户密码', '0', 'com.bootdo.system.controller.UserController.resetPwd()', null, '127.0.0.1', '2017-12-17 10:03:50');
INSERT INTO `sys_log` VALUES ('8100', '1', 'admin', '编辑用户', '10', 'com.bootdo.system.controller.UserController.edit()', null, '127.0.0.1', '2017-12-17 10:04:04');
INSERT INTO `sys_log` VALUES ('8101', '-1', '获取用户信息为空', '登录', '2', 'com.bootdo.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2017-12-17 10:05:17');
INSERT INTO `sys_log` VALUES ('8102', '-1', '获取用户信息为空', '登录', '2', 'com.bootdo.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2017-12-17 10:05:28');
INSERT INTO `sys_log` VALUES ('8103', '1', 'admin', '登录', '4', 'com.bootdo.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2017-12-17 10:13:10');
INSERT INTO `sys_log` VALUES ('8104', '1', 'admin', '请求访问主页', '18', 'com.bootdo.system.controller.LoginController.index()', null, '127.0.0.1', '2017-12-17 10:13:10');
INSERT INTO `sys_log` VALUES ('8105', '1', 'admin', '删除角色', '9', 'com.bootdo.system.controller.RoleController.save()', null, '127.0.0.1', '2017-12-17 10:14:57');
INSERT INTO `sys_log` VALUES ('8106', '1', 'admin', '编辑用户', '12', 'com.bootdo.system.controller.UserController.edit()', null, '127.0.0.1', '2017-12-17 10:19:47');
INSERT INTO `sys_log` VALUES ('8107', '1', 'admin', '登录', '4', 'com.bootdo.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2017-12-17 10:28:41');
INSERT INTO `sys_log` VALUES ('8108', '1', 'admin', '请求访问主页', '15', 'com.bootdo.system.controller.LoginController.index()', null, '127.0.0.1', '2017-12-17 10:28:41');
INSERT INTO `sys_log` VALUES ('8109', '1', 'admin', '登录', '25', 'com.bootdo.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2017-12-17 10:53:51');
INSERT INTO `sys_log` VALUES ('8110', '1', 'admin', '请求访问主页', '59', 'com.bootdo.system.controller.LoginController.index()', null, '127.0.0.1', '2017-12-17 10:53:51');
INSERT INTO `sys_log` VALUES ('8111', '1', 'admin', '编辑菜单', '7', 'com.bootdo.system.controller.MenuController.edit()', null, '127.0.0.1', '2017-12-17 10:54:00');
INSERT INTO `sys_log` VALUES ('8112', '1', 'admin', '添加菜单', '0', 'com.bootdo.system.controller.MenuController.add()', null, '127.0.0.1', '2017-12-17 10:54:04');
INSERT INTO `sys_log` VALUES ('8113', '1', 'admin', '添加菜单', '7', 'com.bootdo.system.controller.MenuController.add()', null, '127.0.0.1', '2017-12-17 10:54:14');
INSERT INTO `sys_log` VALUES ('8114', '1', 'admin', '保存菜单', '11', 'com.bootdo.system.controller.MenuController.save()', null, '127.0.0.1', '2017-12-17 10:55:08');
INSERT INTO `sys_log` VALUES ('8115', '1', 'admin', '编辑菜单', '11', 'com.bootdo.system.controller.MenuController.edit()', null, '127.0.0.1', '2017-12-17 10:55:28');
INSERT INTO `sys_log` VALUES ('8116', '1', 'admin', '更新菜单', '16', 'com.bootdo.system.controller.MenuController.update()', null, '127.0.0.1', '2017-12-17 10:55:35');
INSERT INTO `sys_log` VALUES ('8117', '1', 'admin', '添加菜单', '7', 'com.bootdo.system.controller.MenuController.add()', null, '127.0.0.1', '2017-12-17 10:56:00');
INSERT INTO `sys_log` VALUES ('8118', '1', 'admin', '保存菜单', '6', 'com.bootdo.system.controller.MenuController.save()', null, '127.0.0.1', '2017-12-17 10:56:33');
INSERT INTO `sys_log` VALUES ('8119', '1', 'admin', '添加菜单', '18', 'com.bootdo.system.controller.MenuController.add()', null, '127.0.0.1', '2017-12-17 11:01:11');
INSERT INTO `sys_log` VALUES ('8120', '1', 'admin', '保存菜单', '6', 'com.bootdo.system.controller.MenuController.save()', null, '127.0.0.1', '2017-12-17 11:01:40');
INSERT INTO `sys_log` VALUES ('8121', '1', 'admin', '添加菜单', '4', 'com.bootdo.system.controller.MenuController.add()', null, '127.0.0.1', '2017-12-17 11:01:47');
INSERT INTO `sys_log` VALUES ('8122', '1', 'admin', '保存菜单', '5', 'com.bootdo.system.controller.MenuController.save()', null, '127.0.0.1', '2017-12-17 11:02:13');
INSERT INTO `sys_log` VALUES ('8123', '1', 'admin', '编辑菜单', '9', 'com.bootdo.system.controller.MenuController.edit()', null, '127.0.0.1', '2017-12-17 11:02:22');
INSERT INTO `sys_log` VALUES ('8124', '1', 'admin', '更新菜单', '8', 'com.bootdo.system.controller.MenuController.update()', null, '127.0.0.1', '2017-12-17 11:02:29');
INSERT INTO `sys_log` VALUES ('8125', '1', 'admin', '请求访问主页', '7', 'com.bootdo.system.controller.LoginController.index()', null, '127.0.0.1', '2017-12-17 11:11:01');
INSERT INTO `sys_log` VALUES ('8126', '1', 'admin', '请求访问主页', '6', 'com.bootdo.system.controller.LoginController.index()', null, '127.0.0.1', '2017-12-17 11:11:36');
INSERT INTO `sys_log` VALUES ('8127', '1', 'admin', '编辑菜单', '5', 'com.bootdo.system.controller.MenuController.edit()', null, '127.0.0.1', '2017-12-17 11:11:58');
INSERT INTO `sys_log` VALUES ('8128', '1', 'admin', '更新菜单', '7', 'com.bootdo.system.controller.MenuController.update()', null, '127.0.0.1', '2017-12-17 11:12:03');
INSERT INTO `sys_log` VALUES ('8129', '1', 'admin', '请求访问主页', '17', 'com.bootdo.system.controller.LoginController.index()', null, '127.0.0.1', '2017-12-17 11:14:40');
INSERT INTO `sys_log` VALUES ('8130', '1', 'admin', '登录', '26', 'com.bootdo.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2017-12-17 11:16:30');
INSERT INTO `sys_log` VALUES ('8131', '1', 'admin', '请求访问主页', '52', 'com.bootdo.system.controller.LoginController.index()', null, '127.0.0.1', '2017-12-17 11:16:30');
INSERT INTO `sys_log` VALUES ('8132', '1', 'admin', '添加菜单', '11', 'com.bootdo.system.controller.MenuController.add()', null, '127.0.0.1', '2017-12-17 11:22:33');
INSERT INTO `sys_log` VALUES ('8133', '1', 'admin', '保存菜单', '10', 'com.bootdo.system.controller.MenuController.save()', null, '127.0.0.1', '2017-12-17 11:22:45');
INSERT INTO `sys_log` VALUES ('8134', '1', 'admin', '请求访问主页', '8', 'com.bootdo.system.controller.LoginController.index()', null, '127.0.0.1', '2017-12-17 11:22:49');
INSERT INTO `sys_log` VALUES ('8135', '1', 'admin', '删除菜单', '9', 'com.bootdo.system.controller.MenuController.remove()', null, '127.0.0.1', '2017-12-17 11:23:04');
INSERT INTO `sys_log` VALUES ('8136', '1', 'admin', '编辑角色', '6', 'com.bootdo.system.controller.RoleController.edit()', null, '127.0.0.1', '2017-12-17 11:23:14');
INSERT INTO `sys_log` VALUES ('8137', '1', 'admin', '更新角色', '51', 'com.bootdo.system.controller.RoleController.update()', null, '127.0.0.1', '2017-12-17 11:23:19');
INSERT INTO `sys_log` VALUES ('8138', '1', 'admin', '请求访问主页', '6', 'com.bootdo.system.controller.LoginController.index()', null, '127.0.0.1', '2017-12-17 11:23:23');
INSERT INTO `sys_log` VALUES ('8139', '1', 'admin', '编辑菜单', '10', 'com.bootdo.system.controller.MenuController.edit()', null, '127.0.0.1', '2017-12-17 11:24:09');
INSERT INTO `sys_log` VALUES ('8140', '1', 'admin', '编辑菜单', '10', 'com.bootdo.system.controller.MenuController.edit()', null, '127.0.0.1', '2017-12-17 11:24:37');
INSERT INTO `sys_log` VALUES ('8141', '1', 'admin', '编辑菜单', '9', 'com.bootdo.system.controller.MenuController.edit()', null, '127.0.0.1', '2017-12-17 11:40:33');
INSERT INTO `sys_log` VALUES ('8142', '1', 'admin', '登录', '23', 'com.bootdo.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2017-12-17 11:43:03');
INSERT INTO `sys_log` VALUES ('8143', '1', 'admin', '请求访问主页', '51', 'com.bootdo.system.controller.LoginController.index()', null, '127.0.0.1', '2017-12-17 11:43:03');
INSERT INTO `sys_log` VALUES ('8144', '1', 'admin', '请求访问主页', '32', 'com.bootdo.system.controller.LoginController.index()', null, '127.0.0.1', '2017-12-17 12:06:30');
INSERT INTO `sys_log` VALUES ('8145', '1', 'admin', '登录', '46', 'com.bootdo.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2017-12-17 12:11:33');
INSERT INTO `sys_log` VALUES ('8146', '1', 'admin', '请求访问主页', '52', 'com.bootdo.system.controller.LoginController.index()', null, '127.0.0.1', '2017-12-17 12:11:33');
INSERT INTO `sys_log` VALUES ('8147', '1', 'admin', '请求访问主页', '8', 'com.bootdo.system.controller.LoginController.index()', null, '127.0.0.1', '2017-12-17 12:24:00');
INSERT INTO `sys_log` VALUES ('8148', '1', 'admin', '请求访问主页', '17', 'com.bootdo.system.controller.LoginController.index()', null, '127.0.0.1', '2017-12-17 12:25:21');
INSERT INTO `sys_log` VALUES ('8149', '1', 'admin', '请求访问主页', '11', 'com.bootdo.system.controller.LoginController.index()', null, '127.0.0.1', '2017-12-17 12:28:14');
INSERT INTO `sys_log` VALUES ('8150', '1', 'admin', '添加用户', '39', 'com.bootdo.system.controller.UserController.add()', null, '127.0.0.1', '2017-12-17 12:39:13');
INSERT INTO `sys_log` VALUES ('8151', '1', 'admin', '添加用户', '4', 'com.bootdo.system.controller.UserController.add()', null, '127.0.0.1', '2017-12-17 12:39:20');
INSERT INTO `sys_log` VALUES ('8152', '1', 'admin', '编辑菜单', '12', 'com.bootdo.system.controller.MenuController.edit()', null, '127.0.0.1', '2017-12-17 12:51:41');
INSERT INTO `sys_log` VALUES ('8153', '1', 'admin', '更新菜单', '46', 'com.bootdo.system.controller.MenuController.update()', null, '127.0.0.1', '2017-12-17 12:51:53');
INSERT INTO `sys_log` VALUES ('8154', '1', 'admin', '编辑菜单', '9', 'com.bootdo.system.controller.MenuController.edit()', null, '127.0.0.1', '2017-12-17 12:52:16');
INSERT INTO `sys_log` VALUES ('8155', '1', 'admin', '更新菜单', '5', 'com.bootdo.system.controller.MenuController.update()', null, '127.0.0.1', '2017-12-17 12:52:34');
INSERT INTO `sys_log` VALUES ('8156', '1', 'admin', '编辑菜单', '7', 'com.bootdo.system.controller.MenuController.edit()', null, '127.0.0.1', '2017-12-17 12:52:39');
INSERT INTO `sys_log` VALUES ('8157', '1', 'admin', '更新菜单', '6', 'com.bootdo.system.controller.MenuController.update()', null, '127.0.0.1', '2017-12-17 12:52:50');
INSERT INTO `sys_log` VALUES ('8158', '1', 'admin', '编辑菜单', '7', 'com.bootdo.system.controller.MenuController.edit()', null, '127.0.0.1', '2017-12-17 12:52:57');
INSERT INTO `sys_log` VALUES ('8159', '1', 'admin', '更新菜单', '4', 'com.bootdo.system.controller.MenuController.update()', null, '127.0.0.1', '2017-12-17 12:53:19');
INSERT INTO `sys_log` VALUES ('8160', '1', 'admin', '请求访问主页', '6', 'com.bootdo.system.controller.LoginController.index()', null, '127.0.0.1', '2017-12-17 12:53:22');
INSERT INTO `sys_log` VALUES ('8161', '1', 'admin', '请求访问主页', '15', 'com.bootdo.system.controller.LoginController.index()', null, '127.0.0.1', '2017-12-17 12:55:54');
INSERT INTO `sys_log` VALUES ('8162', '1', 'admin', '请求访问主页', '6', 'com.bootdo.system.controller.LoginController.index()', null, '127.0.0.1', '2017-12-17 12:58:53');
INSERT INTO `sys_log` VALUES ('8163', '1', 'admin', '编辑用户', '17', 'com.bootdo.system.controller.UserController.edit()', null, '127.0.0.1', '2017-12-17 13:03:57');
INSERT INTO `sys_log` VALUES ('8164', '1', 'admin', '请求访问主页', '5', 'com.bootdo.system.controller.LoginController.index()', null, '127.0.0.1', '2017-12-17 13:11:01');
INSERT INTO `sys_log` VALUES ('8165', '1', 'admin', '请求访问主页', '5', 'com.bootdo.system.controller.LoginController.index()', null, '127.0.0.1', '2017-12-17 13:15:18');
INSERT INTO `sys_log` VALUES ('8166', '1', 'admin', '登录', '23', 'com.bootdo.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2017-12-17 13:23:28');
INSERT INTO `sys_log` VALUES ('8167', '1', 'admin', '请求访问主页', '63', 'com.bootdo.system.controller.LoginController.index()', null, '127.0.0.1', '2017-12-17 13:23:28');
INSERT INTO `sys_log` VALUES ('8168', '1', 'admin', '请求访问主页', '23', 'com.bootdo.system.controller.LoginController.index()', null, '127.0.0.1', '2017-12-17 13:29:19');
INSERT INTO `sys_log` VALUES ('8169', '1', 'admin', '编辑用户', '31', 'com.bootdo.system.controller.UserController.edit()', null, '127.0.0.1', '2017-12-17 13:30:14');
INSERT INTO `sys_log` VALUES ('8170', '1', 'admin', '请求访问主页', '11', 'com.bootdo.system.controller.LoginController.index()', null, '127.0.0.1', '2017-12-17 13:37:40');
INSERT INTO `sys_log` VALUES ('8171', '1', 'admin', '请求访问主页', '10', 'com.bootdo.system.controller.LoginController.index()', null, '127.0.0.1', '2017-12-17 14:07:34');
INSERT INTO `sys_log` VALUES ('8172', '1', 'admin', '编辑用户', '16', 'com.bootdo.system.controller.UserController.edit()', null, '127.0.0.1', '2017-12-17 14:40:35');
INSERT INTO `sys_log` VALUES ('8173', '1', 'admin', '添加用户', '23', 'com.bootdo.system.controller.UserController.add()', null, '127.0.0.1', '2017-12-17 14:42:07');
INSERT INTO `sys_log` VALUES ('8174', '1', 'admin', '删除菜单', '12', 'com.bootdo.system.controller.MenuController.remove()', null, '127.0.0.1', '2017-12-17 14:43:47');
INSERT INTO `sys_log` VALUES ('8175', '1', 'admin', '删除菜单', '6', 'com.bootdo.system.controller.MenuController.remove()', null, '127.0.0.1', '2017-12-17 14:43:51');
INSERT INTO `sys_log` VALUES ('8176', '1', 'admin', '删除菜单', '5', 'com.bootdo.system.controller.MenuController.remove()', null, '127.0.0.1', '2017-12-17 14:43:53');
INSERT INTO `sys_log` VALUES ('8177', '1', 'admin', '删除菜单', '5', 'com.bootdo.system.controller.MenuController.remove()', null, '127.0.0.1', '2017-12-17 14:43:55');
INSERT INTO `sys_log` VALUES ('8178', '1', 'admin', '请求访问主页', '8', 'com.bootdo.system.controller.LoginController.index()', null, '127.0.0.1', '2017-12-17 14:45:21');
INSERT INTO `sys_log` VALUES ('8179', '1', 'admin', '编辑角色', '6', 'com.bootdo.system.controller.RoleController.edit()', null, '127.0.0.1', '2017-12-17 14:46:03');
INSERT INTO `sys_log` VALUES ('8180', '1', 'admin', '更新角色', '47', 'com.bootdo.system.controller.RoleController.update()', null, '127.0.0.1', '2017-12-17 14:46:17');
INSERT INTO `sys_log` VALUES ('8181', '1', 'admin', '编辑用户', '13', 'com.bootdo.system.controller.UserController.edit()', null, '127.0.0.1', '2017-12-17 14:46:36');
INSERT INTO `sys_log` VALUES ('8182', '1', 'admin', '添加用户', '0', 'com.bootdo.system.controller.UserController.add()', null, '127.0.0.1', '2017-12-17 14:46:58');
INSERT INTO `sys_log` VALUES ('8183', '1', 'admin', '编辑用户', '15', 'com.bootdo.system.controller.UserController.edit()', null, '127.0.0.1', '2017-12-17 14:47:24');
INSERT INTO `sys_log` VALUES ('8184', '-1', '获取用户信息为空', '登录', '15', 'com.bootdo.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2017-12-17 14:47:43');
INSERT INTO `sys_log` VALUES ('8185', '2', 'test', '登录', '3', 'com.bootdo.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2017-12-17 14:47:47');
INSERT INTO `sys_log` VALUES ('8186', '2', 'test', '请求访问主页', '6', 'com.bootdo.system.controller.LoginController.index()', null, '127.0.0.1', '2017-12-17 14:47:47');
INSERT INTO `sys_log` VALUES ('8187', '2', 'test', '请求更改用户密码', '0', 'com.bootdo.system.controller.UserController.resetPwd()', null, '127.0.0.1', '2017-12-17 14:48:06');
INSERT INTO `sys_log` VALUES ('8188', '2', 'test', '请求更改用户密码', '0', 'com.bootdo.system.controller.UserController.resetPwd()', null, '127.0.0.1', '2017-12-17 14:48:36');
INSERT INTO `sys_log` VALUES ('8189', '2', 'test', '提交更改用户密码', '0', 'com.bootdo.system.controller.UserController.resetPwd()', null, '127.0.0.1', '2017-12-17 14:48:45');
INSERT INTO `sys_log` VALUES ('8190', '1', 'admin', '编辑菜单', '9', 'com.bootdo.system.controller.MenuController.edit()', null, '127.0.0.1', '2017-12-17 14:52:39');
INSERT INTO `sys_log` VALUES ('8191', '1', 'admin', '更新菜单', '14', 'com.bootdo.system.controller.MenuController.update()', null, '127.0.0.1', '2017-12-17 14:52:48');
INSERT INTO `sys_log` VALUES ('8192', '1', 'admin', '请求更改用户密码', '0', 'com.bootdo.system.controller.UserController.resetPwd()', null, '127.0.0.1', '2017-12-17 14:53:39');
INSERT INTO `sys_log` VALUES ('8193', '1', 'admin', '提交更改用户密码', '29', 'com.bootdo.system.controller.UserController.resetPwd()', null, '127.0.0.1', '2017-12-17 14:53:42');
INSERT INTO `sys_log` VALUES ('8194', '-1', '获取用户信息为空', '登录', '3', 'com.bootdo.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2017-12-17 14:54:07');
INSERT INTO `sys_log` VALUES ('8195', '137', '哈哈', '登录', '2', 'com.bootdo.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2017-12-17 14:54:11');
INSERT INTO `sys_log` VALUES ('8196', '137', '哈哈', '请求访问主页', '4', 'com.bootdo.system.controller.LoginController.index()', null, '127.0.0.1', '2017-12-17 14:54:11');
INSERT INTO `sys_log` VALUES ('8197', '1', 'admin', '编辑用户', '11', 'com.bootdo.system.controller.UserController.edit()', null, '127.0.0.1', '2017-12-17 14:54:21');
INSERT INTO `sys_log` VALUES ('8198', '1', 'admin', '更新用户', '14', 'com.bootdo.system.controller.UserController.update()', null, '127.0.0.1', '2017-12-17 14:54:24');
INSERT INTO `sys_log` VALUES ('8199', '137', '哈哈', '请求访问主页', '5', 'com.bootdo.system.controller.LoginController.index()', null, '127.0.0.1', '2017-12-17 14:54:28');
INSERT INTO `sys_log` VALUES ('8200', '1', 'admin', '编辑用户', '11', 'com.bootdo.system.controller.UserController.edit()', null, '127.0.0.1', '2017-12-17 14:57:11');
INSERT INTO `sys_log` VALUES ('8201', '1', 'admin', '编辑角色', '2', 'com.bootdo.system.controller.RoleController.edit()', null, '127.0.0.1', '2017-12-17 14:57:17');
INSERT INTO `sys_log` VALUES ('8202', '137', '哈哈', '请求访问主页', '4', 'com.bootdo.system.controller.LoginController.index()', null, '127.0.0.1', '2017-12-17 14:58:01');
INSERT INTO `sys_log` VALUES ('8203', '1', 'admin', '编辑角色', '2', 'com.bootdo.system.controller.RoleController.edit()', null, '127.0.0.1', '2017-12-17 14:58:19');
INSERT INTO `sys_log` VALUES ('8204', '1', 'admin', '更新角色', '17', 'com.bootdo.system.controller.RoleController.update()', null, '127.0.0.1', '2017-12-17 14:58:32');
INSERT INTO `sys_log` VALUES ('8205', '137', '哈哈', '请求访问主页', '5', 'com.bootdo.system.controller.LoginController.index()', null, '127.0.0.1', '2017-12-17 14:58:37');
INSERT INTO `sys_log` VALUES ('8206', '1', 'admin', '编辑角色', '2', 'com.bootdo.system.controller.RoleController.edit()', null, '127.0.0.1', '2017-12-17 14:58:49');
INSERT INTO `sys_log` VALUES ('8207', '1', 'admin', '更新角色', '13', 'com.bootdo.system.controller.RoleController.update()', null, '127.0.0.1', '2017-12-17 14:58:53');
INSERT INTO `sys_log` VALUES ('8208', '1', 'admin', '编辑用户', '8', 'com.bootdo.system.controller.UserController.edit()', null, '127.0.0.1', '2017-12-17 14:59:00');
INSERT INTO `sys_log` VALUES ('8209', '1', 'admin', '请求访问主页', '5', 'com.bootdo.system.controller.LoginController.index()', null, '127.0.0.1', '2017-12-17 15:03:24');
INSERT INTO `sys_log` VALUES ('8210', '1', 'admin', '登录', '22', 'com.bootdo.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2017-12-17 15:05:36');
INSERT INTO `sys_log` VALUES ('8211', '1', 'admin', '请求访问主页', '53', 'com.bootdo.system.controller.LoginController.index()', null, '127.0.0.1', '2017-12-17 15:05:36');
INSERT INTO `sys_log` VALUES ('8212', '1', 'admin', '编辑菜单', '10', 'com.bootdo.system.controller.MenuController.edit()', null, '127.0.0.1', '2017-12-17 15:08:47');
INSERT INTO `sys_log` VALUES ('8213', '1', 'admin', '更新菜单', '16', 'com.bootdo.system.controller.MenuController.update()', null, '127.0.0.1', '2017-12-17 15:08:57');
INSERT INTO `sys_log` VALUES ('8214', '1', 'admin', '请求访问主页', '6', 'com.bootdo.system.controller.LoginController.index()', null, '127.0.0.1', '2017-12-17 15:09:08');
INSERT INTO `sys_log` VALUES ('8215', '1', 'admin', '编辑用户', '23', 'com.bootdo.system.controller.UserController.edit()', null, '127.0.0.1', '2017-12-17 15:09:36');
INSERT INTO `sys_log` VALUES ('8216', '1', 'admin', '编辑角色', '13', 'com.bootdo.system.controller.RoleController.edit()', null, '127.0.0.1', '2017-12-17 15:09:47');
INSERT INTO `sys_log` VALUES ('8217', '1', 'admin', '编辑菜单', '7', 'com.bootdo.system.controller.MenuController.edit()', null, '127.0.0.1', '2017-12-17 15:10:06');
INSERT INTO `sys_log` VALUES ('8218', '1', 'admin', '编辑菜单', '9', 'com.bootdo.system.controller.MenuController.edit()', null, '127.0.0.1', '2017-12-17 15:10:53');
INSERT INTO `sys_log` VALUES ('8219', '1', 'admin', '更新菜单', '5', 'com.bootdo.system.controller.MenuController.update()', null, '127.0.0.1', '2017-12-17 15:11:06');
INSERT INTO `sys_log` VALUES ('8220', '1', 'admin', '编辑菜单', '12', 'com.bootdo.system.controller.MenuController.edit()', null, '127.0.0.1', '2017-12-17 15:12:43');
INSERT INTO `sys_log` VALUES ('8221', '1', 'admin', '更新菜单', '10', 'com.bootdo.system.controller.MenuController.update()', null, '127.0.0.1', '2017-12-17 15:12:48');
INSERT INTO `sys_log` VALUES ('8222', '1', 'admin', '请求访问主页', '7', 'com.bootdo.system.controller.LoginController.index()', null, '127.0.0.1', '2017-12-17 15:13:40');
INSERT INTO `sys_log` VALUES ('8223', '1', 'admin', '编辑菜单', '7', 'com.bootdo.system.controller.MenuController.edit()', null, '127.0.0.1', '2017-12-17 15:14:44');
INSERT INTO `sys_log` VALUES ('8224', '1', 'admin', '更新菜单', '5', 'com.bootdo.system.controller.MenuController.update()', null, '127.0.0.1', '2017-12-17 15:14:51');
INSERT INTO `sys_log` VALUES ('8225', '1', 'admin', '编辑菜单', '9', 'com.bootdo.system.controller.MenuController.edit()', null, '127.0.0.1', '2017-12-17 15:18:19');
INSERT INTO `sys_log` VALUES ('8226', '1', 'admin', '编辑角色', '3', 'com.bootdo.system.controller.RoleController.edit()', null, '127.0.0.1', '2017-12-17 15:18:37');
INSERT INTO `sys_log` VALUES ('8227', '1', 'admin', '更新角色', '53', 'com.bootdo.system.controller.RoleController.update()', null, '127.0.0.1', '2017-12-17 15:18:49');
INSERT INTO `sys_log` VALUES ('8228', '1', 'admin', '编辑角色', '3', 'com.bootdo.system.controller.RoleController.edit()', null, '127.0.0.1', '2017-12-17 15:18:54');
INSERT INTO `sys_log` VALUES ('8229', '1', 'admin', '更新角色', '20', 'com.bootdo.system.controller.RoleController.update()', null, '127.0.0.1', '2017-12-17 15:18:58');
INSERT INTO `sys_log` VALUES ('8230', '1', 'admin', '请求访问主页', '6', 'com.bootdo.system.controller.LoginController.index()', null, '127.0.0.1', '2017-12-17 15:18:59');
INSERT INTO `sys_log` VALUES ('8231', '1', 'admin', '编辑角色', '19', 'com.bootdo.system.controller.RoleController.edit()', null, '127.0.0.1', '2017-12-17 15:20:36');
INSERT INTO `sys_log` VALUES ('8232', '1', 'admin', '更新角色', '8', 'com.bootdo.system.controller.RoleController.update()', null, '127.0.0.1', '2017-12-17 15:20:40');
INSERT INTO `sys_log` VALUES ('8233', '1', 'admin', '编辑角色', '2', 'com.bootdo.system.controller.RoleController.edit()', null, '127.0.0.1', '2017-12-17 15:20:42');
INSERT INTO `sys_log` VALUES ('8234', '1', 'admin', '更新角色', '12', 'com.bootdo.system.controller.RoleController.update()', null, '127.0.0.1', '2017-12-17 15:20:45');
INSERT INTO `sys_log` VALUES ('8235', '137', '哈哈', '登录', '3', 'com.bootdo.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2017-12-17 15:21:15');
INSERT INTO `sys_log` VALUES ('8236', '137', '哈哈', '请求访问主页', '4', 'com.bootdo.system.controller.LoginController.index()', null, '127.0.0.1', '2017-12-17 15:21:15');
INSERT INTO `sys_log` VALUES ('8237', '137', '哈哈', '请求访问主页', '4', 'com.bootdo.system.controller.LoginController.index()', null, '127.0.0.1', '2017-12-17 15:22:26');
INSERT INTO `sys_log` VALUES ('8238', '1', 'admin', '请求访问主页', '11', 'com.bootdo.system.controller.LoginController.index()', null, '127.0.0.1', '2017-12-17 15:33:39');
INSERT INTO `sys_log` VALUES ('8239', '1', 'admin', '请求访问主页', '7', 'com.bootdo.system.controller.LoginController.index()', null, '127.0.0.1', '2017-12-17 15:44:29');
INSERT INTO `sys_log` VALUES ('8240', '1', 'admin', '请求访问主页', '6', 'com.bootdo.system.controller.LoginController.index()', null, '127.0.0.1', '2017-12-17 16:10:19');
INSERT INTO `sys_log` VALUES ('8241', '1', 'admin', '请求访问主页', '5', 'com.bootdo.system.controller.LoginController.index()', null, '127.0.0.1', '2017-12-17 16:11:22');
INSERT INTO `sys_log` VALUES ('8242', '1', 'admin', '请求访问主页', '6', 'com.bootdo.system.controller.LoginController.index()', null, '127.0.0.1', '2017-12-17 16:12:24');
INSERT INTO `sys_log` VALUES ('8243', '1', 'admin', '请求访问主页', '16', 'com.bootdo.system.controller.LoginController.index()', null, '127.0.0.1', '2017-12-17 16:15:14');
INSERT INTO `sys_log` VALUES ('8244', '1', 'admin', '请求访问主页', '15', 'com.bootdo.system.controller.LoginController.index()', null, '127.0.0.1', '2017-12-17 16:43:19');
INSERT INTO `sys_log` VALUES ('8245', '-1', '获取用户信息为空', '登录', '3', 'com.bootdo.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2017-12-17 16:46:09');
INSERT INTO `sys_log` VALUES ('8246', '1', 'admin', '登录', '3', 'com.bootdo.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2017-12-17 16:46:13');
INSERT INTO `sys_log` VALUES ('8247', '1', 'admin', '请求访问主页', '5', 'com.bootdo.system.controller.LoginController.index()', null, '127.0.0.1', '2017-12-17 16:46:13');
INSERT INTO `sys_log` VALUES ('8248', '1', 'admin', '登录', '4', 'com.bootdo.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2017-12-17 17:47:32');
INSERT INTO `sys_log` VALUES ('8249', '1', 'admin', '请求访问主页', '7', 'com.bootdo.system.controller.LoginController.index()', null, '127.0.0.1', '2017-12-17 17:47:32');
INSERT INTO `sys_log` VALUES ('8250', '1', 'admin', '请求访问主页', '5', 'com.bootdo.system.controller.LoginController.index()', null, '127.0.0.1', '2017-12-17 18:13:22');
INSERT INTO `sys_log` VALUES ('8251', '1', 'admin', '请求访问主页', '5', 'com.bootdo.system.controller.LoginController.index()', null, '127.0.0.1', '2017-12-17 18:13:35');
INSERT INTO `sys_log` VALUES ('8252', '1', 'admin', '请求访问主页', '5', 'com.bootdo.system.controller.LoginController.index()', null, '127.0.0.1', '2017-12-17 18:13:46');
INSERT INTO `sys_log` VALUES ('8253', '1', 'admin', '添加用户', '2', 'com.bootdo.system.controller.UserController.add()', null, '127.0.0.1', '2017-12-17 18:17:55');
INSERT INTO `sys_log` VALUES ('8254', '1', 'admin', '编辑用户', '15', 'com.bootdo.system.controller.UserController.edit()', null, '127.0.0.1', '2017-12-17 18:18:40');

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu` (
  `menu_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `parent_id` bigint(20) DEFAULT NULL COMMENT '父菜单ID，一级菜单为0',
  `name` varchar(50) DEFAULT NULL COMMENT '菜单名称',
  `url` varchar(200) DEFAULT NULL COMMENT '菜单URL',
  `perms` varchar(500) DEFAULT NULL COMMENT '授权(多个用逗号分隔，如：user:list,user:create)',
  `type` int(11) DEFAULT NULL COMMENT '类型   0：目录   1：菜单   2：按钮',
  `icon` varchar(50) DEFAULT NULL COMMENT '菜单图标',
  `order_num` int(11) DEFAULT NULL COMMENT '排序',
  `gmt_create` datetime DEFAULT NULL COMMENT '创建时间',
  `gmt_modified` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`menu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=107 DEFAULT CHARSET=utf8 COMMENT='菜单管理';

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES ('1', '0', '基础管理', '', '', '0', 'fa fa-bars', '0', '2017-08-09 22:49:47', null);
INSERT INTO `sys_menu` VALUES ('2', '3', '系统菜单', 'sys/menu/', 'sys:menu:menu', '1', 'fa fa-th-list', '2', '2017-08-09 22:55:15', null);
INSERT INTO `sys_menu` VALUES ('3', '0', '系统管理', null, null, '0', 'fa fa-desktop', '1', '2017-08-09 23:06:55', '2017-08-14 14:13:43');
INSERT INTO `sys_menu` VALUES ('6', '3', '用户管理', 'sys/user/', 'sys:user:user', '1', 'fa fa-user', '0', '2017-08-10 14:12:11', null);
INSERT INTO `sys_menu` VALUES ('7', '3', '角色管理', 'sys/role', 'sys:role:role', '1', 'fa fa-paw', '1', '2017-08-10 14:13:19', null);
INSERT INTO `sys_menu` VALUES ('12', '6', '新增', '', 'sys:user:add', '2', '', '0', '2017-08-14 10:51:35', null);
INSERT INTO `sys_menu` VALUES ('13', '6', '编辑', '', 'sys:user:edit', '2', '', '0', '2017-08-14 10:52:06', null);
INSERT INTO `sys_menu` VALUES ('14', '6', '删除', null, 'sys:user:remove', '2', null, '0', '2017-08-14 10:52:24', null);
INSERT INTO `sys_menu` VALUES ('15', '7', '新增', '', 'sys:role:add', '2', '', '0', '2017-08-14 10:56:37', null);
INSERT INTO `sys_menu` VALUES ('20', '2', '新增', '', 'sys:menu:add', '2', '', '0', '2017-08-14 10:59:32', null);
INSERT INTO `sys_menu` VALUES ('21', '2', '编辑', '', 'sys:menu:edit', '2', '', '0', '2017-08-14 10:59:56', null);
INSERT INTO `sys_menu` VALUES ('22', '2', '删除', '', 'sys:menu:remove', '2', '', '0', '2017-08-14 11:00:26', null);
INSERT INTO `sys_menu` VALUES ('24', '6', '批量删除', '', 'sys:user:batchRemove', '2', '', '0', '2017-08-14 17:27:18', null);
INSERT INTO `sys_menu` VALUES ('25', '6', '停用', null, 'sys:user:disable', '2', null, '0', '2017-08-14 17:27:43', null);
INSERT INTO `sys_menu` VALUES ('26', '6', '重置密码', '', 'sys:user:resetPwd', '2', '', '0', '2017-08-14 17:28:34', null);
INSERT INTO `sys_menu` VALUES ('27', '91', '系统日志', 'common/log', 'common:log', '1', 'fa fa-warning', '0', '2017-08-14 22:11:53', null);
INSERT INTO `sys_menu` VALUES ('28', '27', '刷新', null, 'sys:log:list', '2', null, '0', '2017-08-14 22:30:22', null);
INSERT INTO `sys_menu` VALUES ('29', '27', '删除', null, 'sys:log:remove', '2', null, '0', '2017-08-14 22:30:43', null);
INSERT INTO `sys_menu` VALUES ('30', '27', '清空', null, 'sys:log:clear', '2', null, '0', '2017-08-14 22:31:02', null);
INSERT INTO `sys_menu` VALUES ('48', '77', '代码生成', 'common/generator', 'common:generator', '1', 'fa fa-code', '3', null, null);
INSERT INTO `sys_menu` VALUES ('49', '0', 'SRC厂商管理', '', '', '0', 'fa fa-institution', '6', null, null);
INSERT INTO `sys_menu` VALUES ('50', '49', '公司管理', 'src', 'src', '1', 'fa fa-braille', '1', null, null);
INSERT INTO `sys_menu` VALUES ('51', '50', '新增', 'src/add', 'src:add', '2', '', null, null, null);
INSERT INTO `sys_menu` VALUES ('55', '7', '编辑', '', 'sys:role:edit', '2', '', null, null, null);
INSERT INTO `sys_menu` VALUES ('56', '7', '删除', '', 'sys:role:remove', '2', null, null, null, null);
INSERT INTO `sys_menu` VALUES ('57', '91', '运行监控', '/druid/index.html', '', '1', 'fa fa-caret-square-o-right', '1', null, null);
INSERT INTO `sys_menu` VALUES ('58', '50', '编辑', 'src/edit', 'src:edit', '2', '', null, null, null);
INSERT INTO `sys_menu` VALUES ('59', '50', '删除', 'src/remove', 'src:remove', '2', '', null, null, null);
INSERT INTO `sys_menu` VALUES ('61', '2', '批量删除', '', 'sys:menu:batchRemove', '2', null, null, null, null);
INSERT INTO `sys_menu` VALUES ('62', '7', '批量删除', '', 'sys:role:batchRemove', '2', null, null, null, null);
INSERT INTO `sys_menu` VALUES ('71', '1', '文件管理', '/common/sysFile', 'common:sysFile:sysFile', '1', 'fa fa-folder-open', '2', null, null);
INSERT INTO `sys_menu` VALUES ('72', '77', '计划任务', 'common/job', 'common:taskScheduleJob', '1', 'fa fa-hourglass-1', '4', null, null);
INSERT INTO `sys_menu` VALUES ('77', '0', '系统工具', '', '', '0', 'fa fa-gear', '4', null, null);
INSERT INTO `sys_menu` VALUES ('78', '1', '数据字典', '/common/sysDict', 'common:sysDict:sysDict', '1', 'fa fa-book', '1', null, null);
INSERT INTO `sys_menu` VALUES ('79', '78', '增加', '/common/sysDict/add', 'common:sysDict:add', '2', null, '2', null, null);
INSERT INTO `sys_menu` VALUES ('80', '78', '编辑', '/common/sysDict/edit', 'common:sysDict:edit', '2', null, '2', null, null);
INSERT INTO `sys_menu` VALUES ('81', '78', '删除', '/common/sysDict/remove', 'common:sysDict:remove', '2', '', '3', null, null);
INSERT INTO `sys_menu` VALUES ('83', '78', '批量删除', '/common/sysDict/batchRemove', 'common:sysDict:batchRemove', '2', '', '4', null, null);
INSERT INTO `sys_menu` VALUES ('91', '0', '系统监控', '', '', '0', 'fa fa-video-camera', '5', null, null);
INSERT INTO `sys_menu` VALUES ('92', '91', '在线用户', 'sys/online', '', '1', 'fa fa-user', null, null, null);
INSERT INTO `sys_menu` VALUES ('102', '49', '分类管理', '/system/sysDept', 'system:sysDept:sysDept', '1', 'fa fa-database', null, null, null);
INSERT INTO `sys_menu` VALUES ('103', '102', '编辑', '/system/sysDept/edit', 'system:sysDept:edit', '2', '', '1', null, null);
INSERT INTO `sys_menu` VALUES ('104', '102', '新增', '/system/sysDept/add', 'system:sysDept:add', '2', '', '2', null, null);
INSERT INTO `sys_menu` VALUES ('105', '102', '删除', '/system/sysDept/remove', 'system:sysDept:remove', '2', '', '3', null, null);

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `role_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `role_name` varchar(100) DEFAULT NULL COMMENT '角色名称',
  `role_sign` varchar(100) DEFAULT NULL COMMENT '角色标识',
  `remark` varchar(100) DEFAULT NULL COMMENT '备注',
  `user_id_create` bigint(255) DEFAULT NULL COMMENT '创建用户id',
  `gmt_create` datetime DEFAULT NULL COMMENT '创建时间',
  `gmt_modified` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8 COMMENT='角色';

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES ('1', '超级用户角色', 'admin', '拥有最高权限', '2', '2017-08-12 00:43:52', '2017-08-12 19:14:59');
INSERT INTO `sys_role` VALUES ('56', '普通用户', null, '普通用户', null, null, null);

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `role_id` bigint(20) DEFAULT NULL COMMENT '角色ID',
  `menu_id` bigint(20) DEFAULT NULL COMMENT '菜单ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3167 DEFAULT CHARSET=utf8 COMMENT='角色与菜单对应关系';

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES ('367', '44', '1');
INSERT INTO `sys_role_menu` VALUES ('368', '44', '32');
INSERT INTO `sys_role_menu` VALUES ('369', '44', '33');
INSERT INTO `sys_role_menu` VALUES ('370', '44', '34');
INSERT INTO `sys_role_menu` VALUES ('371', '44', '35');
INSERT INTO `sys_role_menu` VALUES ('372', '44', '28');
INSERT INTO `sys_role_menu` VALUES ('373', '44', '29');
INSERT INTO `sys_role_menu` VALUES ('374', '44', '30');
INSERT INTO `sys_role_menu` VALUES ('375', '44', '38');
INSERT INTO `sys_role_menu` VALUES ('376', '44', '4');
INSERT INTO `sys_role_menu` VALUES ('377', '44', '27');
INSERT INTO `sys_role_menu` VALUES ('378', '45', '38');
INSERT INTO `sys_role_menu` VALUES ('379', '46', '3');
INSERT INTO `sys_role_menu` VALUES ('380', '46', '20');
INSERT INTO `sys_role_menu` VALUES ('381', '46', '21');
INSERT INTO `sys_role_menu` VALUES ('382', '46', '22');
INSERT INTO `sys_role_menu` VALUES ('383', '46', '23');
INSERT INTO `sys_role_menu` VALUES ('384', '46', '11');
INSERT INTO `sys_role_menu` VALUES ('385', '46', '12');
INSERT INTO `sys_role_menu` VALUES ('386', '46', '13');
INSERT INTO `sys_role_menu` VALUES ('387', '46', '14');
INSERT INTO `sys_role_menu` VALUES ('388', '46', '24');
INSERT INTO `sys_role_menu` VALUES ('389', '46', '25');
INSERT INTO `sys_role_menu` VALUES ('390', '46', '26');
INSERT INTO `sys_role_menu` VALUES ('391', '46', '15');
INSERT INTO `sys_role_menu` VALUES ('392', '46', '2');
INSERT INTO `sys_role_menu` VALUES ('393', '46', '6');
INSERT INTO `sys_role_menu` VALUES ('394', '46', '7');
INSERT INTO `sys_role_menu` VALUES ('598', '50', '38');
INSERT INTO `sys_role_menu` VALUES ('632', '38', '42');
INSERT INTO `sys_role_menu` VALUES ('737', '51', '38');
INSERT INTO `sys_role_menu` VALUES ('738', '51', '39');
INSERT INTO `sys_role_menu` VALUES ('739', '51', '40');
INSERT INTO `sys_role_menu` VALUES ('740', '51', '41');
INSERT INTO `sys_role_menu` VALUES ('741', '51', '4');
INSERT INTO `sys_role_menu` VALUES ('742', '51', '32');
INSERT INTO `sys_role_menu` VALUES ('743', '51', '33');
INSERT INTO `sys_role_menu` VALUES ('744', '51', '34');
INSERT INTO `sys_role_menu` VALUES ('745', '51', '35');
INSERT INTO `sys_role_menu` VALUES ('746', '51', '27');
INSERT INTO `sys_role_menu` VALUES ('747', '51', '28');
INSERT INTO `sys_role_menu` VALUES ('748', '51', '29');
INSERT INTO `sys_role_menu` VALUES ('749', '51', '30');
INSERT INTO `sys_role_menu` VALUES ('750', '51', '1');
INSERT INTO `sys_role_menu` VALUES ('1064', '54', '53');
INSERT INTO `sys_role_menu` VALUES ('1095', '55', '2');
INSERT INTO `sys_role_menu` VALUES ('1096', '55', '6');
INSERT INTO `sys_role_menu` VALUES ('1097', '55', '7');
INSERT INTO `sys_role_menu` VALUES ('1098', '55', '3');
INSERT INTO `sys_role_menu` VALUES ('1099', '55', '50');
INSERT INTO `sys_role_menu` VALUES ('1100', '55', '49');
INSERT INTO `sys_role_menu` VALUES ('1101', '55', '1');
INSERT INTO `sys_role_menu` VALUES ('1856', '53', '28');
INSERT INTO `sys_role_menu` VALUES ('1857', '53', '29');
INSERT INTO `sys_role_menu` VALUES ('1858', '53', '30');
INSERT INTO `sys_role_menu` VALUES ('1859', '53', '27');
INSERT INTO `sys_role_menu` VALUES ('1860', '53', '57');
INSERT INTO `sys_role_menu` VALUES ('1861', '53', '71');
INSERT INTO `sys_role_menu` VALUES ('1862', '53', '48');
INSERT INTO `sys_role_menu` VALUES ('1863', '53', '72');
INSERT INTO `sys_role_menu` VALUES ('1864', '53', '1');
INSERT INTO `sys_role_menu` VALUES ('1865', '53', '7');
INSERT INTO `sys_role_menu` VALUES ('1866', '53', '55');
INSERT INTO `sys_role_menu` VALUES ('1867', '53', '56');
INSERT INTO `sys_role_menu` VALUES ('1868', '53', '62');
INSERT INTO `sys_role_menu` VALUES ('1869', '53', '15');
INSERT INTO `sys_role_menu` VALUES ('1870', '53', '2');
INSERT INTO `sys_role_menu` VALUES ('1871', '53', '61');
INSERT INTO `sys_role_menu` VALUES ('1872', '53', '20');
INSERT INTO `sys_role_menu` VALUES ('1873', '53', '21');
INSERT INTO `sys_role_menu` VALUES ('1874', '53', '22');
INSERT INTO `sys_role_menu` VALUES ('2247', '63', '-1');
INSERT INTO `sys_role_menu` VALUES ('2248', '63', '84');
INSERT INTO `sys_role_menu` VALUES ('2249', '63', '85');
INSERT INTO `sys_role_menu` VALUES ('2250', '63', '88');
INSERT INTO `sys_role_menu` VALUES ('2251', '63', '87');
INSERT INTO `sys_role_menu` VALUES ('2252', '64', '84');
INSERT INTO `sys_role_menu` VALUES ('2253', '64', '89');
INSERT INTO `sys_role_menu` VALUES ('2254', '64', '88');
INSERT INTO `sys_role_menu` VALUES ('2255', '64', '87');
INSERT INTO `sys_role_menu` VALUES ('2256', '64', '86');
INSERT INTO `sys_role_menu` VALUES ('2257', '64', '85');
INSERT INTO `sys_role_menu` VALUES ('2258', '65', '89');
INSERT INTO `sys_role_menu` VALUES ('2259', '65', '88');
INSERT INTO `sys_role_menu` VALUES ('2260', '65', '86');
INSERT INTO `sys_role_menu` VALUES ('2262', '67', '48');
INSERT INTO `sys_role_menu` VALUES ('2263', '68', '88');
INSERT INTO `sys_role_menu` VALUES ('2264', '68', '87');
INSERT INTO `sys_role_menu` VALUES ('2265', '69', '89');
INSERT INTO `sys_role_menu` VALUES ('2266', '69', '88');
INSERT INTO `sys_role_menu` VALUES ('2267', '69', '86');
INSERT INTO `sys_role_menu` VALUES ('2268', '69', '87');
INSERT INTO `sys_role_menu` VALUES ('2269', '69', '85');
INSERT INTO `sys_role_menu` VALUES ('2270', '69', '84');
INSERT INTO `sys_role_menu` VALUES ('2271', '70', '85');
INSERT INTO `sys_role_menu` VALUES ('2272', '70', '89');
INSERT INTO `sys_role_menu` VALUES ('2273', '70', '88');
INSERT INTO `sys_role_menu` VALUES ('2274', '70', '87');
INSERT INTO `sys_role_menu` VALUES ('2275', '70', '86');
INSERT INTO `sys_role_menu` VALUES ('2276', '70', '84');
INSERT INTO `sys_role_menu` VALUES ('2277', '71', '87');
INSERT INTO `sys_role_menu` VALUES ('2278', '72', '59');
INSERT INTO `sys_role_menu` VALUES ('2279', '73', '48');
INSERT INTO `sys_role_menu` VALUES ('2280', '74', '88');
INSERT INTO `sys_role_menu` VALUES ('2281', '74', '87');
INSERT INTO `sys_role_menu` VALUES ('2282', '75', '88');
INSERT INTO `sys_role_menu` VALUES ('2283', '75', '87');
INSERT INTO `sys_role_menu` VALUES ('2284', '76', '85');
INSERT INTO `sys_role_menu` VALUES ('2285', '76', '89');
INSERT INTO `sys_role_menu` VALUES ('2286', '76', '88');
INSERT INTO `sys_role_menu` VALUES ('2287', '76', '87');
INSERT INTO `sys_role_menu` VALUES ('2288', '76', '86');
INSERT INTO `sys_role_menu` VALUES ('2289', '76', '84');
INSERT INTO `sys_role_menu` VALUES ('2292', '78', '88');
INSERT INTO `sys_role_menu` VALUES ('2293', '78', '87');
INSERT INTO `sys_role_menu` VALUES ('2294', '78', null);
INSERT INTO `sys_role_menu` VALUES ('2295', '78', null);
INSERT INTO `sys_role_menu` VALUES ('2296', '78', null);
INSERT INTO `sys_role_menu` VALUES ('2308', '80', '87');
INSERT INTO `sys_role_menu` VALUES ('2309', '80', '86');
INSERT INTO `sys_role_menu` VALUES ('2310', '80', '-1');
INSERT INTO `sys_role_menu` VALUES ('2311', '80', '84');
INSERT INTO `sys_role_menu` VALUES ('2312', '80', '85');
INSERT INTO `sys_role_menu` VALUES ('2328', '79', '72');
INSERT INTO `sys_role_menu` VALUES ('2329', '79', '48');
INSERT INTO `sys_role_menu` VALUES ('2330', '79', '77');
INSERT INTO `sys_role_menu` VALUES ('2331', '79', '84');
INSERT INTO `sys_role_menu` VALUES ('2332', '79', '89');
INSERT INTO `sys_role_menu` VALUES ('2333', '79', '88');
INSERT INTO `sys_role_menu` VALUES ('2334', '79', '87');
INSERT INTO `sys_role_menu` VALUES ('2335', '79', '86');
INSERT INTO `sys_role_menu` VALUES ('2336', '79', '85');
INSERT INTO `sys_role_menu` VALUES ('2337', '79', '-1');
INSERT INTO `sys_role_menu` VALUES ('2338', '77', '89');
INSERT INTO `sys_role_menu` VALUES ('2339', '77', '88');
INSERT INTO `sys_role_menu` VALUES ('2340', '77', '87');
INSERT INTO `sys_role_menu` VALUES ('2341', '77', '86');
INSERT INTO `sys_role_menu` VALUES ('2342', '77', '85');
INSERT INTO `sys_role_menu` VALUES ('2343', '77', '84');
INSERT INTO `sys_role_menu` VALUES ('2344', '77', '72');
INSERT INTO `sys_role_menu` VALUES ('2345', '77', '-1');
INSERT INTO `sys_role_menu` VALUES ('2346', '77', '77');
INSERT INTO `sys_role_menu` VALUES ('3112', '1', '92');
INSERT INTO `sys_role_menu` VALUES ('3113', '1', '57');
INSERT INTO `sys_role_menu` VALUES ('3114', '1', '30');
INSERT INTO `sys_role_menu` VALUES ('3115', '1', '29');
INSERT INTO `sys_role_menu` VALUES ('3116', '1', '28');
INSERT INTO `sys_role_menu` VALUES ('3117', '1', '72');
INSERT INTO `sys_role_menu` VALUES ('3118', '1', '48');
INSERT INTO `sys_role_menu` VALUES ('3119', '1', '59');
INSERT INTO `sys_role_menu` VALUES ('3120', '1', '58');
INSERT INTO `sys_role_menu` VALUES ('3121', '1', '51');
INSERT INTO `sys_role_menu` VALUES ('3122', '1', '62');
INSERT INTO `sys_role_menu` VALUES ('3123', '1', '56');
INSERT INTO `sys_role_menu` VALUES ('3124', '1', '55');
INSERT INTO `sys_role_menu` VALUES ('3125', '1', '15');
INSERT INTO `sys_role_menu` VALUES ('3126', '1', '26');
INSERT INTO `sys_role_menu` VALUES ('3127', '1', '25');
INSERT INTO `sys_role_menu` VALUES ('3128', '1', '24');
INSERT INTO `sys_role_menu` VALUES ('3129', '1', '14');
INSERT INTO `sys_role_menu` VALUES ('3130', '1', '13');
INSERT INTO `sys_role_menu` VALUES ('3131', '1', '12');
INSERT INTO `sys_role_menu` VALUES ('3132', '1', '61');
INSERT INTO `sys_role_menu` VALUES ('3133', '1', '22');
INSERT INTO `sys_role_menu` VALUES ('3134', '1', '21');
INSERT INTO `sys_role_menu` VALUES ('3135', '1', '20');
INSERT INTO `sys_role_menu` VALUES ('3136', '1', '83');
INSERT INTO `sys_role_menu` VALUES ('3137', '1', '81');
INSERT INTO `sys_role_menu` VALUES ('3138', '1', '80');
INSERT INTO `sys_role_menu` VALUES ('3139', '1', '79');
INSERT INTO `sys_role_menu` VALUES ('3140', '1', '71');
INSERT INTO `sys_role_menu` VALUES ('3141', '1', '27');
INSERT INTO `sys_role_menu` VALUES ('3142', '1', '91');
INSERT INTO `sys_role_menu` VALUES ('3143', '1', '77');
INSERT INTO `sys_role_menu` VALUES ('3144', '1', '50');
INSERT INTO `sys_role_menu` VALUES ('3145', '1', '7');
INSERT INTO `sys_role_menu` VALUES ('3146', '1', '6');
INSERT INTO `sys_role_menu` VALUES ('3147', '1', '2');
INSERT INTO `sys_role_menu` VALUES ('3148', '1', '3');
INSERT INTO `sys_role_menu` VALUES ('3149', '1', '78');
INSERT INTO `sys_role_menu` VALUES ('3150', '1', '1');
INSERT INTO `sys_role_menu` VALUES ('3151', '1', '102');
INSERT INTO `sys_role_menu` VALUES ('3152', '1', '105');
INSERT INTO `sys_role_menu` VALUES ('3153', '1', '104');
INSERT INTO `sys_role_menu` VALUES ('3154', '1', '103');
INSERT INTO `sys_role_menu` VALUES ('3155', '1', '49');
INSERT INTO `sys_role_menu` VALUES ('3156', '1', '-1');
INSERT INTO `sys_role_menu` VALUES ('3157', '56', '49');
INSERT INTO `sys_role_menu` VALUES ('3158', '56', '105');
INSERT INTO `sys_role_menu` VALUES ('3159', '56', '104');
INSERT INTO `sys_role_menu` VALUES ('3160', '56', '103');
INSERT INTO `sys_role_menu` VALUES ('3161', '56', '59');
INSERT INTO `sys_role_menu` VALUES ('3162', '56', '58');
INSERT INTO `sys_role_menu` VALUES ('3163', '56', '51');
INSERT INTO `sys_role_menu` VALUES ('3164', '56', '102');
INSERT INTO `sys_role_menu` VALUES ('3165', '56', '50');
INSERT INTO `sys_role_menu` VALUES ('3166', '56', '-1');

-- ----------------------------
-- Table structure for sys_task
-- ----------------------------
DROP TABLE IF EXISTS `sys_task`;
CREATE TABLE `sys_task` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `cron_expression` varchar(255) DEFAULT NULL COMMENT 'cron表达式',
  `method_name` varchar(255) DEFAULT NULL COMMENT '任务调用的方法名',
  `is_concurrent` varchar(255) DEFAULT NULL COMMENT '任务是否有状态',
  `description` varchar(255) DEFAULT NULL COMMENT '任务描述',
  `update_by` varchar(64) DEFAULT NULL COMMENT '更新者',
  `bean_class` varchar(255) DEFAULT NULL COMMENT '任务执行时调用哪个类的方法 包名+类名',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `job_status` varchar(255) DEFAULT NULL COMMENT '任务状态',
  `job_group` varchar(255) DEFAULT NULL COMMENT '任务分组',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  `create_by` varchar(64) DEFAULT NULL COMMENT '创建者',
  `spring_bean` varchar(255) DEFAULT NULL COMMENT 'Spring bean',
  `job_name` varchar(255) DEFAULT NULL COMMENT '任务名',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_task
-- ----------------------------
INSERT INTO `sys_task` VALUES ('2', '0/10 * * * * ?', 'run1', '1', '', '4028ea815a3d2a8c015a3d2f8d2a0002', 'com.bootdo.common.task.WelcomeJob', '2017-05-19 18:30:56', '0', 'group1', '2017-05-19 18:31:07', null, '', 'welcomJob');

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `user_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) DEFAULT NULL COMMENT '用户名',
  `name` varchar(100) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL COMMENT '密码',
  `dept_id` int(20) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL COMMENT '邮箱',
  `mobile` varchar(100) DEFAULT NULL COMMENT '手机号',
  `status` tinyint(255) DEFAULT NULL COMMENT '状态 0:禁用，1:正常',
  `user_id_create` bigint(255) DEFAULT NULL COMMENT '创建用户id',
  `gmt_create` datetime DEFAULT NULL COMMENT '创建时间',
  `gmt_modified` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=138 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES ('1', 'admin', '超级管理员', 'd633268afedf209e1e4ea0f5f43228a8', '6', 'admin@example.com', '123456', '1', '1', '2017-08-15 21:40:39', '2017-08-15 21:41:00');
INSERT INTO `sys_user` VALUES ('2', 'test', '临时用户', '6cf3bb3deba2aadbd41ec9a22511084e', '6', 'test@bootdo.com', null, '1', '1', '2017-08-14 13:43:05', '2017-08-14 21:15:36');
INSERT INTO `sys_user` VALUES ('36', 'ldh', '刘德华', 'bfd9394475754fbe45866eba97738c36', '6', 'ldh@bootdo.com', null, '1', null, null, null);
INSERT INTO `sys_user` VALUES ('123', 'zxy', '张学友', '35174ba93f5fe7267f1fb3c1bf903781', '6', 'zxy@bootdo', null, '0', null, null, null);
INSERT INTO `sys_user` VALUES ('124', 'wyf', '吴亦凡', 'e179e6f687bbd57b9d7efc4746c8090a', '6', 'wyf@bootdo.com', null, '1', null, null, null);
INSERT INTO `sys_user` VALUES ('130', 'lh', '鹿晗', '7924710cd673f68967cde70e188bb097', '9', 'lh@bootdo.com', null, '1', null, null, null);
INSERT INTO `sys_user` VALUES ('131', 'lhc', '令狐冲', 'd515538e17ecb570ba40344b5618f5d4', '6', 'lhc@bootdo.com', null, '0', null, null, null);
INSERT INTO `sys_user` VALUES ('132', 'lyf', '刘亦菲', '7fdb1d9008f45950c1620ba0864e5fbd', '15', 'lyf@bootdo.com', null, '1', null, null, null);
INSERT INTO `sys_user` VALUES ('134', 'lyh', '李彦宏', 'dc26092b3244d9d432863f2738180e19', '8', 'lyh@bootdo.com', null, '1', null, null, null);
INSERT INTO `sys_user` VALUES ('135', 'wjl', '王健林', '3967697dfced162cf6a34080259b83aa', '6', 'wjl@bootod.com', null, '1', null, null, null);
INSERT INTO `sys_user` VALUES ('136', 'gdg', '郭德纲', '3bb1bda86bc02bf6478cd91e42135d2f', '9', 'gdg@bootdo.com', null, '1', null, null, null);
INSERT INTO `sys_user` VALUES ('137', '哈哈', '嘻嘻', '6d5389ec9d0c52f0cf283af027c82899', '15', '920595557@qq.com', null, '1', null, null, null);

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户ID',
  `role_id` bigint(20) DEFAULT NULL COMMENT '角色ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=129 DEFAULT CHARSET=utf8 COMMENT='用户与角色对应关系';

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES ('73', '30', '48');
INSERT INTO `sys_user_role` VALUES ('74', '30', '49');
INSERT INTO `sys_user_role` VALUES ('75', '30', '50');
INSERT INTO `sys_user_role` VALUES ('76', '31', '48');
INSERT INTO `sys_user_role` VALUES ('77', '31', '49');
INSERT INTO `sys_user_role` VALUES ('78', '31', '52');
INSERT INTO `sys_user_role` VALUES ('79', '32', '48');
INSERT INTO `sys_user_role` VALUES ('80', '32', '49');
INSERT INTO `sys_user_role` VALUES ('81', '32', '50');
INSERT INTO `sys_user_role` VALUES ('82', '32', '51');
INSERT INTO `sys_user_role` VALUES ('83', '32', '52');
INSERT INTO `sys_user_role` VALUES ('84', '33', '38');
INSERT INTO `sys_user_role` VALUES ('85', '33', '49');
INSERT INTO `sys_user_role` VALUES ('86', '33', '52');
INSERT INTO `sys_user_role` VALUES ('87', '34', '50');
INSERT INTO `sys_user_role` VALUES ('88', '34', '51');
INSERT INTO `sys_user_role` VALUES ('89', '34', '52');
INSERT INTO `sys_user_role` VALUES ('97', '36', '48');
INSERT INTO `sys_user_role` VALUES ('106', '124', '1');
INSERT INTO `sys_user_role` VALUES ('110', '1', '1');
INSERT INTO `sys_user_role` VALUES ('111', '2', '1');
INSERT INTO `sys_user_role` VALUES ('113', '131', '48');
INSERT INTO `sys_user_role` VALUES ('117', '135', '1');
INSERT INTO `sys_user_role` VALUES ('120', '134', '1');
INSERT INTO `sys_user_role` VALUES ('121', '134', '48');
INSERT INTO `sys_user_role` VALUES ('123', '130', '1');
INSERT INTO `sys_user_role` VALUES ('124', null, '48');
INSERT INTO `sys_user_role` VALUES ('128', '137', '56');
