/*
Navicat MySQL Data Transfer

Source Server         : zyx
Source Server Version : 50624
Source Host           : localhost:3306
Source Database       : vc_evaluation

Target Server Type    : MYSQL
Target Server Version : 50624
File Encoding         : 65001

Date: 2016-12-19 20:39:10
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `admin`
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `admin_id` int(11) NOT NULL AUTO_INCREMENT,
  `admin_name` varchar(20) DEFAULT NULL,
  `admin_pwd` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`admin_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES ('1', 'admin', 'admin');

-- ----------------------------
-- Table structure for `algorithm`
-- ----------------------------
DROP TABLE IF EXISTS `algorithm`;
CREATE TABLE `algorithm` (
  `a_id` int(11) NOT NULL AUTO_INCREMENT,
  `a_name` varchar(20) DEFAULT NULL,
  `a_detail` varchar(100) DEFAULT NULL,
  `a_reg` varchar(10) DEFAULT NULL COMMENT '算法识别参数',
  PRIMARY KEY (`a_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of algorithm
-- ----------------------------

-- ----------------------------
-- Table structure for `apro`
-- ----------------------------
DROP TABLE IF EXISTS `apro`;
CREATE TABLE `apro` (
  `ap_id` int(11) NOT NULL AUTO_INCREMENT,
  `ap_pro_id` int(11) DEFAULT NULL,
  `ap_a_id` int(11) DEFAULT NULL,
  `ap_remark` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`ap_id`),
  KEY `fk7` (`ap_pro_id`),
  KEY `fk8` (`ap_a_id`),
  CONSTRAINT `fk7` FOREIGN KEY (`ap_pro_id`) REFERENCES `project` (`pro_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk8` FOREIGN KEY (`ap_a_id`) REFERENCES `algorithm` (`a_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of apro
-- ----------------------------

-- ----------------------------
-- Table structure for `data_dictionary`
-- ----------------------------
DROP TABLE IF EXISTS `data_dictionary`;
CREATE TABLE `data_dictionary` (
  `dd_id` int(11) NOT NULL AUTO_INCREMENT,
  `dd_datatype` varchar(20) DEFAULT NULL,
  `dd_value` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`dd_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of data_dictionary
-- ----------------------------
INSERT INTO `data_dictionary` VALUES ('1', 'gender', '男');
INSERT INTO `data_dictionary` VALUES ('2', 'gender', '女');
INSERT INTO `data_dictionary` VALUES ('3', 'education', '大专');
INSERT INTO `data_dictionary` VALUES ('4', 'education', '本科');
INSERT INTO `data_dictionary` VALUES ('5', 'education', '硕士');
INSERT INTO `data_dictionary` VALUES ('6', 'education', '博士');

-- ----------------------------
-- Table structure for `evaluation`
-- ----------------------------
DROP TABLE IF EXISTS `evaluation`;
CREATE TABLE `evaluation` (
  `eva_id` int(11) NOT NULL AUTO_INCREMENT,
  `eva_pro_id` int(11) DEFAULT NULL,
  `eva_res_id` int(11) DEFAULT NULL,
  `eva_ex_id` int(11) DEFAULT NULL,
  `eva_manual_value` double(10,2) DEFAULT NULL,
  `eva_auto_value` double(10,2) DEFAULT NULL,
  `eva_time` varchar(30) DEFAULT NULL,
  `eva_report` varchar(10000) DEFAULT NULL COMMENT '评估建议、综合风险评价',
  `eva_type` int(11) DEFAULT NULL COMMENT '1:成果 2：项目',
  `eva_short` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`eva_id`),
  KEY `fk9` (`eva_pro_id`),
  KEY `fk10` (`eva_res_id`),
  KEY `fk12` (`eva_ex_id`),
  CONSTRAINT `fk10` FOREIGN KEY (`eva_res_id`) REFERENCES `result` (`res_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk12` FOREIGN KEY (`eva_ex_id`) REFERENCES `eva_expert` (`ex_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk9` FOREIGN KEY (`eva_pro_id`) REFERENCES `project` (`pro_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of evaluation
-- ----------------------------
INSERT INTO `evaluation` VALUES ('1', null, '27', '15', '0.00', '7.09', '2016-12-09 20:19:41', null, '1', '缺陷因素：');
INSERT INTO `evaluation` VALUES ('2', null, '27', '15', '0.00', '7.24', '2016-12-09 20:43:16', null, '1', '缺陷因素：');
INSERT INTO `evaluation` VALUES ('3', null, '27', '15', '0.00', '7.92', '2016-12-09 20:47:53', null, '1', '缺陷因素：');
INSERT INTO `evaluation` VALUES ('4', null, '27', '15', '0.00', '8.22', '2016-12-09 20:50:31', null, '1', '缺陷因素：');
INSERT INTO `evaluation` VALUES ('5', null, '27', '15', '0.00', '7.32', '2016-12-09 20:53:49', null, '1', '缺陷因素：');
INSERT INTO `evaluation` VALUES ('6', null, '27', '15', '8.00', '7.69', '2016-12-09 20:56:48', null, '1', '缺陷因素：');
INSERT INTO `evaluation` VALUES ('7', null, '27', '15', '6.60', '7.09', '2016-12-09 20:58:22', null, '1', '缺陷因素：');
INSERT INTO `evaluation` VALUES ('8', null, '27', '15', '7.28', '7.17', '2016-12-09 21:41:35', null, '1', '缺陷因素：');
INSERT INTO `evaluation` VALUES ('9', null, '27', '15', '7.94', '7.44', '2016-12-09 21:46:01', null, '1', '缺陷因素：');
INSERT INTO `evaluation` VALUES ('10', null, '27', '15', '5.36', '6.49', '2016-12-09 21:47:36', null, '1', '缺陷因素：');
INSERT INTO `evaluation` VALUES ('11', null, '11', '15', '8.31', '8.10', '2016-12-10 16:48:08', null, '1', '缺陷因素：');
INSERT INTO `evaluation` VALUES ('12', null, '11', '15', '8.31', '8.10', '2016-12-10 16:50:28', null, '1', '缺陷因素：');
INSERT INTO `evaluation` VALUES ('13', null, '11', '15', '8.20', '8.25', '2016-12-10 16:52:51', null, '1', '缺陷因素：');
INSERT INTO `evaluation` VALUES ('14', null, '1', '15', '7.30', '7.17', '2016-12-10 20:41:17', null, '1', '缺陷因素：');
INSERT INTO `evaluation` VALUES ('15', null, '28', '15', '7.37', '7.33', '2016-12-10 20:44:20', null, '1', '缺陷因素：');
INSERT INTO `evaluation` VALUES ('16', null, '32', '15', '8.12', '8.36', '2016-12-10 22:08:17', null, '1', '缺陷因素：');
INSERT INTO `evaluation` VALUES ('17', '24', null, '15', '8.24', '8.71', '2016-12-11 17:01:48', null, '2', '缺陷因素：');
INSERT INTO `evaluation` VALUES ('18', null, '32', '15', '8.55', '8.53', '2016-12-11 18:28:38', null, '1', '缺陷因素：');
INSERT INTO `evaluation` VALUES ('19', null, '35', '15', '8.46', '7.75', '2016-12-12 13:12:21', null, '1', '缺陷因素：');
INSERT INTO `evaluation` VALUES ('20', '32', null, '15', '8.29', '9.03', '2016-12-12 13:40:44', null, '2', '缺陷因素：');
INSERT INTO `evaluation` VALUES ('21', '35', null, '15', null, null, '2016-12-15 12:08:32', null, '3', null);
INSERT INTO `evaluation` VALUES ('22', '35', null, '15', null, null, '2016-12-15 12:10:18', null, '3', null);
INSERT INTO `evaluation` VALUES ('23', '35', null, '15', null, null, '2016-12-15 12:12:34', null, '3', null);
INSERT INTO `evaluation` VALUES ('24', '35', null, '15', null, null, '2016-12-15 12:14:10', null, '3', null);
INSERT INTO `evaluation` VALUES ('25', '35', null, '15', null, null, '2016-12-15 12:15:27', null, '3', null);
INSERT INTO `evaluation` VALUES ('26', '35', null, '15', null, null, '2016-12-15 12:18:03', null, '3', null);
INSERT INTO `evaluation` VALUES ('27', '35', null, '15', null, null, '2016-12-15 12:19:02', null, '3', null);
INSERT INTO `evaluation` VALUES ('28', '35', null, '15', null, null, '2016-12-15 12:25:03', null, '3', null);
INSERT INTO `evaluation` VALUES ('29', '35', null, '15', null, null, '2016-12-15 12:29:26', null, '3', null);
INSERT INTO `evaluation` VALUES ('30', '35', null, '15', null, null, '2016-12-15 12:31:49', null, '3', null);
INSERT INTO `evaluation` VALUES ('31', '35', null, '15', null, null, '2016-12-15 12:40:10', null, '3', null);
INSERT INTO `evaluation` VALUES ('32', '35', null, '15', null, null, '2016-12-15 12:46:34', null, '3', null);
INSERT INTO `evaluation` VALUES ('33', '35', null, '15', null, null, '2016-12-15 12:49:44', null, '3', null);
INSERT INTO `evaluation` VALUES ('34', '35', null, '15', null, null, '2016-12-15 12:51:40', null, '3', null);
INSERT INTO `evaluation` VALUES ('35', '35', null, '15', null, null, '2016-12-15 12:54:43', null, '3', null);
INSERT INTO `evaluation` VALUES ('36', '35', null, '15', null, null, '2016-12-15 12:55:09', null, '3', null);
INSERT INTO `evaluation` VALUES ('37', null, '36', '15', '7.86', '7.98', '2016-12-15 15:38:53', null, '1', '缺陷因素：');

-- ----------------------------
-- Table structure for `eva_expert`
-- ----------------------------
DROP TABLE IF EXISTS `eva_expert`;
CREATE TABLE `eva_expert` (
  `ex_id` int(11) NOT NULL DEFAULT '0',
  `ex_qualification` varchar(20) DEFAULT NULL COMMENT '专业资格(级别)',
  `ex_expertise` varchar(20) DEFAULT NULL COMMENT '专家经验年限',
  `ex_businessfield` varchar(30) DEFAULT NULL,
  `ex_remark` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`ex_id`),
  CONSTRAINT `foreignkey2` FOREIGN KEY (`ex_id`) REFERENCES `user` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of eva_expert
-- ----------------------------
INSERT INTO `eva_expert` VALUES ('15', '1123', '1123', '11', null);
INSERT INTO `eva_expert` VALUES ('18', '', '', '', null);
INSERT INTO `eva_expert` VALUES ('19', '', '', '', null);

-- ----------------------------
-- Table structure for `factor`
-- ----------------------------
DROP TABLE IF EXISTS `factor`;
CREATE TABLE `factor` (
  `factor_id` int(11) NOT NULL AUTO_INCREMENT,
  `factor_index_id` int(11) DEFAULT NULL,
  `factor_name` varchar(20) DEFAULT NULL,
  `factor_parameter` varchar(20) DEFAULT NULL,
  `factor_weight` double(10,6) DEFAULT NULL,
  `factor_remark` varchar(50) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`factor_id`),
  KEY `fk14` (`factor_index_id`),
  CONSTRAINT `fk14` FOREIGN KEY (`factor_index_id`) REFERENCES `index1` (`index_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=147 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of factor
-- ----------------------------
INSERT INTO `factor` VALUES ('1', '1', '发表年份', null, '0.700000', '论文');
INSERT INTO `factor` VALUES ('2', '1', '被引用次数', null, '0.300000', '论文');
INSERT INTO `factor` VALUES ('3', '2', '科学索引库', null, '0.550000', '论文');
INSERT INTO `factor` VALUES ('4', '2', '期刊CJCR（影响因子）', null, '0.450000', '论文');
INSERT INTO `factor` VALUES ('5', '3', '市场适应性', null, '1.000000', '论文');
INSERT INTO `factor` VALUES ('6', '4', '成果可行性', null, '1.000000', '论文');
INSERT INTO `factor` VALUES ('7', '1', '申专年份', null, '1.000000', '专利');
INSERT INTO `factor` VALUES ('8', '2', '专利类型', null, '0.400000', '专利');
INSERT INTO `factor` VALUES ('9', '3', '市场适应性', null, '1.000000', '专利');
INSERT INTO `factor` VALUES ('10', '4', '成果可行性', null, '1.000000', '专利');
INSERT INTO `factor` VALUES ('11', '1', '完成时间', null, '0.400000', '软件');
INSERT INTO `factor` VALUES ('12', '1', '是否发布', null, '0.600000', '软件');
INSERT INTO `factor` VALUES ('13', '2', '可移植性', null, '0.450000', '软件');
INSERT INTO `factor` VALUES ('14', '2', '功能完备性', null, '0.550000', '软件');
INSERT INTO `factor` VALUES ('15', '3', '市场适应性', null, '1.000000', '软件');
INSERT INTO `factor` VALUES ('16', '4', '成果可行性', null, '1.000000', '软件');
INSERT INTO `factor` VALUES ('17', '2', '专利价值', '计算机校验位', '0.600000', '专利');
INSERT INTO `factor` VALUES ('18', '5', '开发团队能力', null, '0.300000', '项目');
INSERT INTO `factor` VALUES ('19', '5', '技术设备支持', null, '0.300000', '项目');
INSERT INTO `factor` VALUES ('20', '5', '技术使用（风险）', null, '0.400000', '项目');
INSERT INTO `factor` VALUES ('21', '6', '贷款偿还能力', null, '0.450000', '项目');
INSERT INTO `factor` VALUES ('22', '6', '自筹占所需比', null, '0.550000', '项目');
INSERT INTO `factor` VALUES ('23', '7', '政策支持', null, '1.000000', '项目');
INSERT INTO `factor` VALUES ('24', '8', '市场收益性', null, '0.400000', '项目');
INSERT INTO `factor` VALUES ('25', '8', '市场先进性', null, '0.300000', '项目');
INSERT INTO `factor` VALUES ('26', '8', '市场适应性', null, '0.300000', '项目');
INSERT INTO `factor` VALUES ('27', '9', '方案质量', null, '1.000000', '项目');
INSERT INTO `factor` VALUES ('28', '10', '综合风险', null, '1.000000', '项目');
INSERT INTO `factor` VALUES ('29', '11', '客户分类合理性', null, '0.059000', '最终指标');
INSERT INTO `factor` VALUES ('30', '11', '客户定位准确性', null, '0.076800', '最终指标');
INSERT INTO `factor` VALUES ('31', '12', '自有创新技术数', null, '0.115940', '最终指标');
INSERT INTO `factor` VALUES ('32', '11', '目标市场选择有效性', null, '0.064200', '最终指标');
INSERT INTO `factor` VALUES ('33', '11', '产品功能先进性', null, '0.073000', '最终指标');
INSERT INTO `factor` VALUES ('34', '11', '产品包装经济性', null, '0.026000', '最终指标');
INSERT INTO `factor` VALUES ('35', '11', '产品使用寿命一', null, '0.071000', '最终指标');
INSERT INTO `factor` VALUES ('36', '11', '产品组合合理性', null, '0.050000', '最终指标');
INSERT INTO `factor` VALUES ('37', '11', '定价方法科学性', null, '0.073080', '最终指标');
INSERT INTO `factor` VALUES ('38', '11', '价格合理性', null, '0.059400', '最终指标');
INSERT INTO `factor` VALUES ('39', '11', '价格正竞争性', null, '0.047520', '最终指标');
INSERT INTO `factor` VALUES ('40', '11', '渠道策略', null, '0.057400', '最终指标');
INSERT INTO `factor` VALUES ('41', '11', '渠道通畅性', null, '0.082600', '最终指标');
INSERT INTO `factor` VALUES ('42', '11', '促销设计科学性', null, '0.036000', '最终指标');
INSERT INTO `factor` VALUES ('43', '11', '促销方法多样性', null, '0.030000', '最终指标');
INSERT INTO `factor` VALUES ('44', '11', '促销效果', null, '0.054000', '最终指标');
INSERT INTO `factor` VALUES ('45', '11', '售前服务水平', null, '0.057280', '最终指标');
INSERT INTO `factor` VALUES ('46', '11', '售中服务水平', null, '0.048320', '最终指标');
INSERT INTO `factor` VALUES ('47', '11', '售后服务水平', null, '0.054400', '最终指标');
INSERT INTO `factor` VALUES ('48', '12', '引进创新技术数', null, '0.083100', '最终指标');
INSERT INTO `factor` VALUES ('49', '12', '合作创新技术数', null, '0.110980', '最终指标');
INSERT INTO `factor` VALUES ('50', '12', '容易模仿技术数', null, '0.033000', '最终指标');
INSERT INTO `factor` VALUES ('51', '12', '较难模仿技术数', null, '0.055000', '最终指标');
INSERT INTO `factor` VALUES ('52', '12', '难模仿技术数', null, '0.132000', '最终指标');
INSERT INTO `factor` VALUES ('53', '12', '投入应用技术数', null, '0.081540', '最终指标');
INSERT INTO `factor` VALUES ('54', '12', '实验技术数', null, '0.054000', '最终指标');
INSERT INTO `factor` VALUES ('55', '12', '创意技术数', null, '0.044460', '最终指标');
INSERT INTO `factor` VALUES ('56', '12', '国际领先技术数', null, '0.040500', '最终指标');
INSERT INTO `factor` VALUES ('57', '12', '国际先进技术数', null, '0.039750', '最终指标');
INSERT INTO `factor` VALUES ('58', '12', '国内领先技术数', null, '0.045300', '最终指标');
INSERT INTO `factor` VALUES ('59', '12', '国内先进技术数', null, '0.024450', '最终指标');
INSERT INTO `factor` VALUES ('60', '12', '申请专利数', null, '0.045780', '最终指标');
INSERT INTO `factor` VALUES ('61', '12', '获批专利数', null, '0.543200', '最终指标');
INSERT INTO `factor` VALUES ('62', '12', '保护专利数', null, '0.041300', '最终指标');
INSERT INTO `factor` VALUES ('63', '15', '政治环境', null, '0.128000', '最终指标');
INSERT INTO `factor` VALUES ('64', '15', '经济环境', null, '0.124000', '最终指标');
INSERT INTO `factor` VALUES ('65', '15', '社会环境', null, '0.068000', '最终指标');
INSERT INTO `factor` VALUES ('66', '15', '技术环境', null, '0.080000', '最终指标');
INSERT INTO `factor` VALUES ('67', '15', '顾客', null, '0.133800', '最终指标');
INSERT INTO `factor` VALUES ('68', '15', '销售商', null, '0.067800', '最终指标');
INSERT INTO `factor` VALUES ('69', '15', '渠道商', null, '0.072000', '最终指标');
INSERT INTO `factor` VALUES ('70', '15', '供应商', null, '0.114000', '最终指标');
INSERT INTO `factor` VALUES ('71', '15', '竞争者', null, '0.140400', '最终指标');
INSERT INTO `factor` VALUES ('72', '15', '替代者', null, '0.720000', '最终指标');
INSERT INTO `factor` VALUES ('73', '16', '市场调查方法合理性', null, '0.056000', '最终指标');
INSERT INTO `factor` VALUES ('74', '16', '问卷设计', null, '0.129500', '最终指标');
INSERT INTO `factor` VALUES ('75', '16', '市场调查的广度', null, '0.094500', '最终指标');
INSERT INTO `factor` VALUES ('76', '16', '市场调查的深度', null, '0.070000', '最终指标');
INSERT INTO `factor` VALUES ('77', '16', '分类性分析', null, '0.089250', '最终指标');
INSERT INTO `factor` VALUES ('78', '11', '聚类性分析', null, '0.078500', '最终指标');
INSERT INTO `factor` VALUES ('79', '16', '关联性分析', null, '0.082250', '最终指标');
INSERT INTO `factor` VALUES ('80', '16', '预测方法科学性', null, '0.184800', '最终指标');
INSERT INTO `factor` VALUES ('81', '16', '预测数据合理性', null, '0.215200', '最终指标');
INSERT INTO `factor` VALUES ('82', '17', '组织机构合理性', null, '0.045200', '最终指标');
INSERT INTO `factor` VALUES ('83', '17', '机构职责明确', null, '0.091400', '最终指标');
INSERT INTO `factor` VALUES ('84', '17', '机构信息关联性', null, '0.063400', '最终指标');
INSERT INTO `factor` VALUES ('85', '17', '管理方法合理', null, '0.080200', '最终指标');
INSERT INTO `factor` VALUES ('86', '17', '管理人员能力', null, '0.091200', '最终指标');
INSERT INTO `factor` VALUES ('87', '17', '管理职责明确', null, '0.028600', '最终指标');
INSERT INTO `factor` VALUES ('88', '17', '财务管理', null, '0.126600', '最终指标');
INSERT INTO `factor` VALUES ('89', '17', '生产管理', null, '0.094200', '最终指标');
INSERT INTO `factor` VALUES ('90', '17', '销售管理', null, '0.074400', '最终指标');
INSERT INTO `factor` VALUES ('91', '17', '供应管理', null, '0.078000', '最终指标');
INSERT INTO `factor` VALUES ('92', '17', '供应链管理', null, '0.057000', '最终指标');
INSERT INTO `factor` VALUES ('93', '17', '人力资源管理', null, '0.122400', '最终指标');
INSERT INTO `factor` VALUES ('94', '17', '风险管理', null, '0.047400', '最终指标');
INSERT INTO `factor` VALUES ('95', '18', '已有从生产线数', null, '0.231560', '最终指标');
INSERT INTO `factor` VALUES ('96', '18', '在建生产线数', null, '0.048440', '最终指标');
INSERT INTO `factor` VALUES ('97', '18', '成品率', null, '0.192500', '最终指标');
INSERT INTO `factor` VALUES ('98', '18', '生产线运行效率', null, '0.157500', '最终指标');
INSERT INTO `factor` VALUES ('99', '18', '原材料供应商数', null, '0.062500', '最终指标');
INSERT INTO `factor` VALUES ('100', '18', '固定供应商数', null, '0.115000', '最终指标');
INSERT INTO `factor` VALUES ('101', '18', '战略供应商数', null, '0.072500', '最终指标');
INSERT INTO `factor` VALUES ('102', '18', '熟练工人数', null, '0.074760', '最终指标');
INSERT INTO `factor` VALUES ('103', '18', '一般工人数', null, '0.035280', '最终指标');
INSERT INTO `factor` VALUES ('104', '18', '实习工人数', null, '0.009960', '最终指标');
INSERT INTO `factor` VALUES ('105', '19', '团队资金比例', null, '0.064500', '最终指标');
INSERT INTO `factor` VALUES ('106', '19', '风险投资比例', null, '0.147600', '最终指标');
INSERT INTO `factor` VALUES ('107', '19', '技术入股比例', null, '0.045900', '最终指标');
INSERT INTO `factor` VALUES ('108', '19', '政府补助比例', null, '0.042000', '最终指标');
INSERT INTO `factor` VALUES ('109', '19', '动态投资回收期', null, '0.105000', '最终指标');
INSERT INTO `factor` VALUES ('110', '19', '净现值', null, '0.095000', '最终指标');
INSERT INTO `factor` VALUES ('111', '19', '净年值', null, '0.097500', '最终指标');
INSERT INTO `factor` VALUES ('112', '19', '内部收益率', null, '0.088000', '最终指标');
INSERT INTO `factor` VALUES ('113', '19', 'ROA', null, '0.061500', '最终指标');
INSERT INTO `factor` VALUES ('114', '19', 'ROE', null, '0.053000', '最终指标');
INSERT INTO `factor` VALUES ('115', '19', '可用银行数', null, '0.116000', '最终指标');
INSERT INTO `factor` VALUES ('116', '19', '长短贷比例', null, '0.084000', '最终指标');
INSERT INTO `factor` VALUES ('117', '20', '团队人数', null, '0.082500', '最终指标');
INSERT INTO `factor` VALUES ('118', '20', '团队特长', null, '0.167500', '最终指标');
INSERT INTO `factor` VALUES ('119', '20', '本科以上比例', null, '0.090000', '最终指标');
INSERT INTO `factor` VALUES ('120', '20', '管理水平', null, '0.240300', '最终指标');
INSERT INTO `factor` VALUES ('121', '20', '技术水平', null, '0.120600', '最终指标');
INSERT INTO `factor` VALUES ('122', '20', '团队流失率', null, '0.186900', '最终指标');
INSERT INTO `factor` VALUES ('123', '20', '团队忠诚度', null, '0.113100', '最终指标');
INSERT INTO `factor` VALUES ('124', '21', '技术风险识别', null, '0.125000', '最终指标');
INSERT INTO `factor` VALUES ('125', '21', '技术风险防范对策', null, '0.125000', '最终指标');
INSERT INTO `factor` VALUES ('126', '21', '经济风险识别', null, '0.142800', '最终指标');
INSERT INTO `factor` VALUES ('127', '21', '经济风险防范对策', null, '0.157200', '最终指标');
INSERT INTO `factor` VALUES ('128', '21', '管理风险识别', null, '0.152500', '最终指标');
INSERT INTO `factor` VALUES ('129', '21', '管理风险防范对策', null, '0.097500', '最终指标');
INSERT INTO `factor` VALUES ('130', '21', '环境风险识别', null, '0.104000', '最终指标');
INSERT INTO `factor` VALUES ('131', '21', '环境风险防范对策', null, '0.096000', '最终指标');
INSERT INTO `factor` VALUES ('132', '22', 'R&D投入强度', null, '0.227500', '最终指标');
INSERT INTO `factor` VALUES ('133', '22', '机制的有效性', null, '0.125000', '最终指标');
INSERT INTO `factor` VALUES ('134', '22', '战略的可行性', null, '0.125000', '最终指标');
INSERT INTO `factor` VALUES ('135', '22', '技术水平的先进性', null, '0.169200', '最终指标');
INSERT INTO `factor` VALUES ('136', '22', '技术扩散效率', null, '0.230800', '最终指标');
INSERT INTO `factor` VALUES ('137', '23', '新产品项目数', null, '0.349800', '最终指标');
INSERT INTO `factor` VALUES ('138', '23', '专利拥有数', null, '0.200200', '最终指标');
INSERT INTO `factor` VALUES ('139', '23', '中介机构', null, '0.281250', '最终指标');
INSERT INTO `factor` VALUES ('140', '23', '金融机构', null, '0.168750', '最终指标');
INSERT INTO `factor` VALUES ('141', '24', '设备先进度', null, '0.168000', '最终指标');
INSERT INTO `factor` VALUES ('142', '24', '员工技术先进性', null, '0.073200', '最终指标');
INSERT INTO `factor` VALUES ('143', '24', '标准化程度', null, '0.158800', '最终指标');
INSERT INTO `factor` VALUES ('144', '24', '市场占有率', null, '0.244800', '最终指标');
INSERT INTO `factor` VALUES ('145', '24', '销售收入', null, '0.355200', '最终指标');
INSERT INTO `factor` VALUES ('146', '25', 'zyzyx', null, '0.040000', '最终指标');

-- ----------------------------
-- Table structure for `index1`
-- ----------------------------
DROP TABLE IF EXISTS `index1`;
CREATE TABLE `index1` (
  `index_id` int(11) NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) DEFAULT '0',
  `index_name` varchar(20) DEFAULT NULL,
  `index_remark` varchar(50) DEFAULT NULL,
  `index_type` varchar(50) DEFAULT NULL COMMENT '评估类型（用于识别项目类型；项目类型不同，评估指标可能也不同）',
  PRIMARY KEY (`index_id`),
  KEY `fk13` (`parent_id`),
  CONSTRAINT `fk13` FOREIGN KEY (`parent_id`) REFERENCES `index1` (`index_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of index1
-- ----------------------------
INSERT INTO `index1` VALUES ('0', '0', '成果指标根节点', '0', '0');
INSERT INTO `index1` VALUES ('1', '0', '先进性', '0.30', '1');
INSERT INTO `index1` VALUES ('2', '0', '可靠性', '0.25', '1');
INSERT INTO `index1` VALUES ('3', '0', '适应性', '0.15', '1');
INSERT INTO `index1` VALUES ('4', '0', '可行性', '0.30', '1');
INSERT INTO `index1` VALUES ('5', '0', '技术风险', '0.20', '2');
INSERT INTO `index1` VALUES ('6', '0', '资金风险', '0.20', '2');
INSERT INTO `index1` VALUES ('7', '0', '社会风险', '0.10', '2');
INSERT INTO `index1` VALUES ('8', '0', '市场风险', '0.20', '2');
INSERT INTO `index1` VALUES ('9', '0', '工程设计方案风险', '0.20', '2');
INSERT INTO `index1` VALUES ('10', '0', '综合风险', '0.10', '2');
INSERT INTO `index1` VALUES ('11', '0', '商业模式', '0.14', '3');
INSERT INTO `index1` VALUES ('12', '0', '技术水平', '0.12', '3');
INSERT INTO `index1` VALUES ('15', '0', '市场环境', '0.05', '3');
INSERT INTO `index1` VALUES ('16', '0', '市场前景', '0.06', '3');
INSERT INTO `index1` VALUES ('17', '0', '组织与管理', '0.08', '3');
INSERT INTO `index1` VALUES ('18', '0', '生产', '0.06', '3');
INSERT INTO `index1` VALUES ('19', '0', '财务', '0.15', '3');
INSERT INTO `index1` VALUES ('20', '0', '团队', '0.04', '3');
INSERT INTO `index1` VALUES ('21', '0', '风险', '0.06', '3');
INSERT INTO `index1` VALUES ('22', '0', '基础投入', '0.06', '3');
INSERT INTO `index1` VALUES ('23', '0', '中间转化', '0.08', '3');
INSERT INTO `index1` VALUES ('24', '0', '实现产业化', '0.1', '3');
INSERT INTO `index1` VALUES ('25', '0', '大川', '0.05', '3');

-- ----------------------------
-- Table structure for `journal`
-- ----------------------------
DROP TABLE IF EXISTS `journal`;
CREATE TABLE `journal` (
  `j_id` int(11) NOT NULL AUTO_INCREMENT,
  `j_name` varchar(30) DEFAULT NULL,
  `j_factor` double(20,3) DEFAULT NULL COMMENT 'CJCR影响因子',
  `j_classfy` varchar(20) DEFAULT NULL COMMENT '学科分类',
  PRIMARY KEY (`j_id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of journal
-- ----------------------------
INSERT INTO `journal` VALUES ('1', '中国科学A缉（中国科学.数学）', '0.296', '数学');
INSERT INTO `journal` VALUES ('2', '中国科学B缉（中国科学.化学）', '0.517', '化学');
INSERT INTO `journal` VALUES ('3', '中国科学C缉（中国科学.生命科学）', '0.380', '生物学');
INSERT INTO `journal` VALUES ('4', '中国科学D缉（中国科学.地球科学）', '2.062', '地质学');
INSERT INTO `journal` VALUES ('5', '中国科学E缉（中国科学.技术科学）', '0.693', '一般工业技术');
INSERT INTO `journal` VALUES ('6', '中国科学F缉（中国科学.信息科学）', '0.388', '自动化、计算机技术');
INSERT INTO `journal` VALUES ('7', '中国科学G缉（中国科学.物理学、力学、天文学）', '0.613', '物理学');
INSERT INTO `journal` VALUES ('8', '科学通报', '1.005', '自然科学总论');
INSERT INTO `journal` VALUES ('9', '物理学报', '1.099', '物理学');
INSERT INTO `journal` VALUES ('10', '化学学报', '1.084', '化学');
INSERT INTO `journal` VALUES ('11', '数学学报', '0.503', '数学');
INSERT INTO `journal` VALUES ('12', '航空学报', '0.822', '航空、航天');
INSERT INTO `journal` VALUES ('13', '宇航学报', '0.548', '航空、航天');
INSERT INTO `journal` VALUES ('14', '金属学报', '0.828', '金属学、金属工艺');
INSERT INTO `journal` VALUES ('15', '电子学报', '0.959', '无线电电子学、电信技术');
INSERT INTO `journal` VALUES ('16', '自动化学报', '0.831', '自动化、计算机技术');
INSERT INTO `journal` VALUES ('17', '声学学报', '0.825', '物理学');
INSERT INTO `journal` VALUES ('18', '力学学报', '0.741', '力学');
INSERT INTO `journal` VALUES ('19', '计算机学报', '1.593', '自动化、计算机技术');
INSERT INTO `journal` VALUES ('20', '机械工程学报', '0.754', '机械仪表工业');
INSERT INTO `journal` VALUES ('21', '仪器仪表学报', '0.925', '机械仪表工业');
INSERT INTO `journal` VALUES ('22', '中国社会科学', '3.476', '综合性社会科学');
INSERT INTO `journal` VALUES ('23', '管理科学学报', '1.155', '管理学');
INSERT INTO `journal` VALUES ('24', '其他期刊', '0.303', '其他');

-- ----------------------------
-- Table structure for `member`
-- ----------------------------
DROP TABLE IF EXISTS `member`;
CREATE TABLE `member` (
  `member_id` int(11) NOT NULL AUTO_INCREMENT,
  `member_name` varchar(20) DEFAULT NULL,
  `member_gender` int(11) DEFAULT NULL,
  `member_edu` int(11) DEFAULT NULL,
  `member_job` varchar(20) DEFAULT NULL,
  `member_work` varchar(20) DEFAULT NULL,
  `member_team` int(11) DEFAULT NULL,
  `member_intime` varchar(20) DEFAULT NULL,
  `member_level` varchar(20) DEFAULT NULL,
  `member_remark` varchar(50) DEFAULT NULL,
  `member_image` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`member_id`),
  KEY `fk6` (`member_team`),
  KEY `fk23` (`member_gender`),
  KEY `fk22` (`member_edu`),
  CONSTRAINT `fk6` FOREIGN KEY (`member_team`) REFERENCES `team` (`team_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of member
-- ----------------------------
INSERT INTO `member` VALUES ('1', '张玉筱', '2', '2', 'aaaaaa', 'aaaaa', '1', '2008-01-01', 'B', '用阳光乐观的心态去面对生活和工作，它们一样也会回报给你阳光。', 'zhangyuxiao.jpg');
INSERT INTO `member` VALUES ('2', '王倩', '2', '2', 'bbbbbb', 'bbbbb', '1', '2009-01-01', 'B', '学会下一次进步，是做大自己的有效法则。因此千万不要让自己睡在已有的成功温床上。', 'wangqian.jpg');
INSERT INTO `member` VALUES ('3', '吴连伟', '1', '1', 'cccccccc', 'cccccc', '2', '2006-08-17', 'A', '勤奋是学习的枝叶，当然很苦，智慧是学习的花朵，当然香郁。', 'wulianwei.jpg');

-- ----------------------------
-- Table structure for `paper`
-- ----------------------------
DROP TABLE IF EXISTS `paper`;
CREATE TABLE `paper` (
  `paper_id` int(11) NOT NULL,
  `paper_name` varchar(20) DEFAULT NULL,
  `paper_pubtime` varchar(30) DEFAULT NULL,
  `paper_cited` int(11) DEFAULT NULL COMMENT '被引用次数',
  `paper_keywords` varchar(50) DEFAULT NULL,
  `paper_category` int(11) DEFAULT NULL COMMENT '科学索引类别',
  `published_journals` int(11) DEFAULT NULL COMMENT '发表刊物',
  `paper_remark` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`paper_id`),
  CONSTRAINT `fk15` FOREIGN KEY (`paper_id`) REFERENCES `result` (`res_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of paper
-- ----------------------------
INSERT INTO `paper` VALUES ('1', '11', '2004-01-19', '10', null, '1', '2', 'paper_remark');
INSERT INTO `paper` VALUES ('2', '111', '2004-01-19', '5', null, '4', '2', 'paper_remark');
INSERT INTO `paper` VALUES ('3', '123', '2004-01-19', '20', null, '3', '2', 'paper_remark');
INSERT INTO `paper` VALUES ('4', '1234', '2004-01-19', '11', null, '1', '2', 'paper_remark');
INSERT INTO `paper` VALUES ('5', '12345', '2004-01-19', '18', null, '3', '2', 'paper_remark');
INSERT INTO `paper` VALUES ('6', '333333333', '2004-01-19', '2', null, '2', '4', 'paper_remark');
INSERT INTO `paper` VALUES ('7', '4', '2004-01-19', '13', null, '2', '4', 'paper_remark');
INSERT INTO `paper` VALUES ('8', '111111111', '2004-01-19', '6', null, '2', '6', 'paper_remark');
INSERT INTO `paper` VALUES ('9', 'gdsfdfsgfsd', '2014-01-19', '7', null, '2', '7', 'paper_remark');
INSERT INTO `paper` VALUES ('14', 'qq', '2014-01-19', '5', 'qq', '2', '8', 'paper_remark');
INSERT INTO `paper` VALUES ('15', 'wwwwww', '2015-01-19', '8', null, '2', '4', null);
INSERT INTO `paper` VALUES ('16', 'saD啊', '2016-12-07 ', '30', null, '1', '7', null);
INSERT INTO `paper` VALUES ('17', 'D????', '2016-11-01 ', '40', null, '1', '1', null);
INSERT INTO `paper` VALUES ('19', '111222333', '2016-11-30 ', '35', null, '1', '1', null);
INSERT INTO `paper` VALUES ('20', '??????', '2016-11-29 ', '20', null, '1', '15', null);
INSERT INTO `paper` VALUES ('21', '?????', '2016-11-30 ', '15', null, '1', '15', null);
INSERT INTO `paper` VALUES ('22', 'aaaccccccccccccc', '2016-11-29 ', '1', null, '1', '1', null);
INSERT INTO `paper` VALUES ('24', '去去去', '2016-11-29 ', '5000', null, '1', '1', null);
INSERT INTO `paper` VALUES ('25', '阿萨德', '2016-11-28 ', '123', null, '1', '1', null);
INSERT INTO `paper` VALUES ('26', '张玉筱测试去去去阿萨德', '2016-12-07 ', '123', null, '1', '1', null);
INSERT INTO `paper` VALUES ('27', 'aaaaaaaaaa', '2015-01-19', '12', null, '1', '1', null);
INSERT INTO `paper` VALUES ('33', '自行车的改良', '2014-12-07', '34', null, '2', '18', null);
INSERT INTO `paper` VALUES ('34', 'wqq', '2016-12-05', '20', null, '1', '1', null);
INSERT INTO `paper` VALUES ('35', '张玉筱张玉筱', '2016-12-07', '20', null, '2', '3', null);
INSERT INTO `paper` VALUES ('36', 'asewargth', '2016-12-09', '34', null, '1', '3', null);

-- ----------------------------
-- Table structure for `patent`
-- ----------------------------
DROP TABLE IF EXISTS `patent`;
CREATE TABLE `patent` (
  `patent_id` int(11) NOT NULL,
  `pa_name` varchar(30) DEFAULT NULL,
  `pa_number` varchar(20) DEFAULT NULL,
  `pa_inventor` varchar(20) DEFAULT NULL,
  `pa_pubtime` varchar(30) DEFAULT NULL,
  `pa_abstract` varchar(100) DEFAULT NULL,
  `pa_type` int(11) DEFAULT NULL COMMENT '发明类(产品和方法发明），外观设计类，实用新型类',
  `pa_details` varchar(500) DEFAULT NULL,
  `pa_remark` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`patent_id`),
  CONSTRAINT `fk16` FOREIGN KEY (`patent_id`) REFERENCES `result` (`res_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of patent
-- ----------------------------
INSERT INTO `patent` VALUES ('11', 'ewattew', 'ZL97101765.4', 'trete', '1997-02-05', 'reterw', '1', 'fdszrgteg5', 'patent_remark');
INSERT INTO `patent` VALUES ('28', 'zyxzyx', 'ZL200510059633.0', 'xxxxx', '2005-02-05', null, '3', 'adWDQQ', null);

-- ----------------------------
-- Table structure for `project`
-- ----------------------------
DROP TABLE IF EXISTS `project`;
CREATE TABLE `project` (
  `pro_id` int(11) NOT NULL AUTO_INCREMENT,
  `pro_name` varchar(20) DEFAULT NULL,
  `pro_type` varchar(200) DEFAULT NULL,
  `pro_plan` varchar(5000) DEFAULT NULL,
  `pro_scheme` varchar(10000) DEFAULT NULL COMMENT '方案',
  `pro_evalue` double(10,2) DEFAULT NULL,
  `pro_creater` int(11) DEFAULT NULL,
  `pro_team` int(11) DEFAULT NULL,
  `pro_flag` int(4) DEFAULT NULL,
  `pro_remark` varchar(200) DEFAULT NULL,
  `pro_eva_deadline` varchar(30) DEFAULT NULL,
  `pro_protime` varchar(30) DEFAULT NULL,
  `pro_times` int(11) DEFAULT NULL,
  `pro_capital` double(50,2) DEFAULT NULL,
  `pro_fit` int(11) DEFAULT NULL,
  `pro_support` int(11) DEFAULT NULL,
  `pro_period` int(11) DEFAULT NULL,
  `pro_bank` double(50,2) DEFAULT NULL,
  `pro_meet` double(11,2) DEFAULT NULL,
  `pro_lastbenifit` int(11) DEFAULT NULL,
  PRIMARY KEY (`pro_id`),
  KEY `fk4` (`pro_creater`),
  KEY `fk5` (`pro_team`),
  CONSTRAINT `fk4` FOREIGN KEY (`pro_creater`) REFERENCES `resultprovider` (`rp_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk5` FOREIGN KEY (`pro_team`) REFERENCES `team` (`team_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of project
-- ----------------------------
INSERT INTO `project` VALUES ('1', 'aDS', 'animal-1-960x640.jpg', 'aDSsadasdaaDSsadasda', 'sadDAASD', '8.15', '3', '1', '2', '', '2016-12-3 20:45:22', '2016-10-02 20:45:22', '3', '1000.00', '2', '0', '2', '400.00', '100.00', '2');
INSERT INTO `project` VALUES ('2', 'aAAAAAAAAAAAAA', 'animal-1-960x640.jpg', 'AAAAA', 'AAAAAAA', '0.00', '4', '1', '2', null, '2016-12-3 20:45:22', '2016-10-02 20:45:22', '0', '1000.00', '2', '0', '2', '400.00', '100.00', '2');
INSERT INTO `project` VALUES ('3', 'qda', 'city-1-720x480.jpg', 'wwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwsdfsfsfaasgsdhdxhfhfhyhjgjghjcfgnfchhghcfhghcfchc', 'wwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwww', '0.00', '4', '1', '1', null, '2016-12-31 20:45:22', '2016-10-02 20:45:22', '0', '1000.00', '2', '1', '2', '400.00', '100.00', '1');
INSERT INTO `project` VALUES ('4', '1aaa', 'city-1-720x480.jpg', '11aaa', '11aaa', '0.00', '4', '1', '1', null, '2016-12-31 20:45:22', '2016-10-02 20:45:22', '0', '1000.00', '2', '1', '3', '400.00', '100.00', '2');
INSERT INTO `project` VALUES ('5', 'asasas', 'city-3-960x640.jpg', 'asasasasasasasas11111111', 'asasasasasasasasa11111', '0.00', '4', '1', '1', null, '2016-12-31 20:45:22', '2016-10-02 20:45:22', '0', '1000.00', '1', '1', '1', '400.00', '100.00', '3');
INSERT INTO `project` VALUES ('6', 'sasasasa', 'city-3-960x640.jpg', 'sasasasasasawlwlwlwlwlwllw', 'wlwlwlwlwllwlwl', '0.00', '4', '1', '1', null, '2016-12-31 20:45:22', '2016-10-02 20:45:22', '0', '1000.00', '1', '1', '1', '400.00', '100.00', '2');
INSERT INTO `project` VALUES ('7', 'xhpppppp', 'animal-1-960x640.jpg', 'animal-1-960x640.jpg', 'ewrwrwqr', '0.00', '4', '1', '1', null, '2016-12-31 20:45:22', '2016-10-02 20:45:22', '0', '100.00', '2', '0', '1', '30.00', '30.00', '4');
INSERT INTO `project` VALUES ('8', 'yhhhhh', 'logo_purple.png', 'yhyhyhyh', 'yhyhyyyhyh', '0.00', '4', '1', '1', null, '2016-12-31 20:45:22', '2016-10-02 20:45:22', '0', '100.00', '2', '0', '1', '30.00', '30.00', '0');
INSERT INTO `project` VALUES ('9', 'zpz', 'object-3-960x640.jpg', 'zpz', 'zpz', '0.00', '4', '1', '1', null, '2016-12-31 20:45:22', '2016-10-02 20:45:22', '0', '100.00', '2', '0', '3', '30.00', '30.00', '1');
INSERT INTO `project` VALUES ('10', 'zzz', 'logo_purple.png', 'zzz', 'zzz', '0.00', '4', '1', '1', null, '2016-12-31 20:45:22', '2016-10-02 20:45:22', '0', '100.00', '2', '0', '2', '30.00', '30.00', '2');
INSERT INTO `project` VALUES ('11', 'asd', 'logo_purple.png', 'asd', 'asd', '0.00', '4', '1', '1', null, '2016-12-31 20:45:22', '2016-10-02 20:45:22', '0', '100.00', '2', '0', '1', '30.00', '30.00', '2');
INSERT INTO `project` VALUES ('12', '阿阿双方SD发工资岁的哈根达斯', 'logo_purple.png', '艾尔文tey', 'artseay', '0.00', '4', '1', '2', null, '2016-12-8 5:00:00', '2016-10-02 20:45:22', '0', '100.00', '2', '0', '3', '30.00', '30.00', '2');
INSERT INTO `project` VALUES ('13', '123qqq', 'logo_purple.png', '123', '123', '0.00', '4', '1', '1', null, '2016-12-31 20:45:22', '2016-10-02 20:45:22', '0', '100.00', '1', '0', '2', '30.00', '30.00', '2');
INSERT INTO `project` VALUES ('14', 'wqwq', 'logo_purple.png', 'wqwqwqwq', 'wqwqwqwq', '0.00', '4', '1', '1', null, '2016-12-31 20:45:22', '2016-10-02 20:45:22', '0', '100.00', '1', '0', '4', '30.00', '30.00', '2');
INSERT INTO `project` VALUES ('15', 'wwww', 'logo_purple.png', 'wwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwww', 'wwwwwwwwwwwwwwwwwwwww', '0.00', '4', '2', '1', null, '2016-12-31 20:45:22', '2016-10-02 20:45:22', '0', '100.00', '3', '0', '2', '30.00', '30.00', '2');
INSERT INTO `project` VALUES ('16', 'qqqq', 'logo_purple.png', 'qqqqqqqqqqqqqqqqqq', 'qqqqqqqqqqqqqqqqq', '5.90', '4', '1', '2', null, '2016-12-3 20:45:22', '2016-10-02 20:45:22', '0', '100.00', '3', '0', '2', '30.00', '30.00', '3');
INSERT INTO `project` VALUES ('17', 'sssssssssslllllll', 'logo_purple.png', 'safF', 'saffa', '0.00', '4', '2', '1', null, '2016-12-18 02:36:36', '2016-12-08 02:36:36', '0', '100.00', '3', '0', '2', '20.00', '30.00', '3');
INSERT INTO `project` VALUES ('18', '张玉筱测试二', 'logo_purple.png', '张玉筱测试二张玉筱测试二张玉筱测试二', '张玉筱测试二张玉筱测试二张玉筱测试二张玉筱测试二张玉筱测试二张玉筱测试二张玉筱测试二', '0.00', '4', '1', '1', null, '2016-12-18 02:38:42', '2016-12-08 02:38:42', '0', '100.00', '3', '1', '2', '20.00', '30.00', '3');
INSERT INTO `project` VALUES ('19', 'wwwwlllll咋好难过干预下', 'object-6-960x640.jpg', 'qqqqqqqqqqqqqqqqqqqqqqqqqqqqqqq', 'qqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqq', '0.00', '4', '2', '1', '76', '2016-12-21 01:01:02', '2016-12-11 01:01:02', '0', '100.00', '3', '1', '2', '20.00', '30.00', '3');
INSERT INTO `project` VALUES ('20', '阿斯达斯', 'object-4-960x640.jpg', '请问乔沃维奇', '驱蚊器爱的', '0.00', '4', '2', '1', '78', '2016-12-21 01:12:23', '2016-12-11 01:12:23', '0', '100.00', '3', '1', '2', '20.00', '30.00', '3');
INSERT INTO `project` VALUES ('21', '1231231', 'object-4-960x640.jpg', '12312312', '1231212', '0.00', '4', '1', '1', '069837e2-1629-48f5-b0bf-e91ee4317e4b_a.htm', '2016-12-21 01:22:25', '2016-12-11 01:22:25', '0', '100.00', '3', '1', '2', '20.00', '30.00', '2');
INSERT INTO `project` VALUES ('22', '123qqq111', 'object-4-960x640.jpg', 'qweqweqweqw', 'qweqweqwwqe', '0.00', '4', '1', '1', 'a18d05b3-63e6-4c13-b242-7dda54bc77e3_a.htm', '2016-12-21 01:24:12', '2016-12-11 01:24:12', '0', '100.00', '3', '1', '3', '20.00', '30.00', '2');
INSERT INTO `project` VALUES ('23', '123qqq', 'object-4-960x640.jpg', '12312321', '12312312', '0.00', '4', '1', '1', 'e8a0662d-b883-4d49-881e-6a1f0b3ad90a_a.htm', '2016-12-21 01:41:20', '2016-12-11 01:41:20', '0', '100.00', '1', '1', '1', '20.00', '30.00', '2');
INSERT INTO `project` VALUES ('24', '123qqqqweqwweq', 'object-4-960x640.jpg', 'qqqqqqqqqqqqqqqqqqqq', 'qqqqqqqqqqqqqqqq', '8.40', '4', '1', '1', '9666c195-4140-437a-8881-c7a01c4d22b8_a.htm', '2016-12-21 01:42:59', '2016-12-11 01:42:59', '1', '100.00', '1', '1', '1', '30.00', '56.00', '3');
INSERT INTO `project` VALUES ('25', 'zhangyixoa', 'object-3-960x640.jpg', '阿斯达斯', 'asda', '0.00', '4', '1', '1', '2d529a7d-62dc-40b8-9a47-5f0c178f4b5a_a.htm', '2016-12-21 01:54:57', '2016-12-11 01:54:57', '0', '34.50', '3', '1', '3', '20.00', '10.00', '1');
INSERT INTO `project` VALUES ('26', 'asdazyx', 'object-3-960x640.jpg', 'asdsdads', 'asdsadada', '0.00', '4', '1', '1', '86e3e559-866e-4082-be75-c36bca7021ed_a.htm', '2016-12-21 01:57:58', '2016-12-11 01:57:58', '0', '34.50', '3', '1', '3', '20.00', '10.00', '1');
INSERT INTO `project` VALUES ('27', 'qwzyxqwa', 'object-3-960x640.jpg', 'asdasdas', 'asdasdas', '0.00', '4', '2', '1', '8c5c12cb-90c6-473d-b855-c19e187e1386_a.htm', '2016-12-21 02:02:41', '2016-12-11 02:02:41', '0', '34.50', '3', '1', '3', '20.00', '10.00', '2');
INSERT INTO `project` VALUES ('28', 'asqwaas', 'object-3-960x640.jpg', 'asdasdaxczxczxcz', 'zxczxzxczxzxczx', '0.00', '4', '1', '1', 'c0b7fb4a-d4cf-4f81-9e01-68449660ca2f_a.htm', '2016-12-21 02:08:38', '2016-12-11 02:08:38', '0', '34.50', '3', '1', '3', '20.00', '40.00', '2');
INSERT INTO `project` VALUES ('29', 'zyxzyx', 'object-3-960x640.jpg', 'asdasdas', 'asdasdasasd', '0.00', '4', '1', '1', '18acb711-7eef-496b-8ab9-1a69997f5f47_a.htm', '2016-12-21 02:20:52', '2016-12-11 02:20:52', '0', '34.50', '1', '1', '3', '20.00', '10.00', '2');
INSERT INTO `project` VALUES ('30', '将自行车改良推广', 'object-3-960x640.jpg', '自行车改了自行车改了自行车改了自行车改了自行车改了自行车改了', '自行车改了自行车改了自行车改了自行车改了自行车改了自行车改了自行车改了', '0.00', '4', '2', '1', '55fc1bc9-480e-42f2-af41-c0ba3ec4fb44_隔壁宿舍wifi密码.txt', '2016-12-21 19:14:57', '2016-12-11 19:14:57', '0', '200.00', '2', '1', '3', '123.00', '100.00', '2');
INSERT INTO `project` VALUES ('31', 'wwwwww', 'object-3-960x640.jpg', 'qqqqqqqqqqqqqq', 'qqqqqqqqqqqqqq', '0.00', '4', '2', '1', '0ee08940-14a5-4672-ab8a-7228804b5b14_client-1.png', '2016-12-21 19:37:21', '2016-12-11 19:37:21', '0', '24.00', '1', '0', '1', '12.30', '20.00', '2');
INSERT INTO `project` VALUES ('32', 'zzzzzzzzzz', 'object-3-960x640.jpg', 'ppppppppppppppp\r\n', '0pppppppppppppp', '8.55', '4', '2', '2', 'eafb9b9f-0e84-48ba-a8fe-f5fa52a448c9_blog-sidebar.jpg', '2016-12-22 13:34:19', '2016-12-12 13:34:19', '1', '65.00', '2', '0', '1', '75.00', null, '2');
INSERT INTO `project` VALUES ('33', 'zyx', 'object-3-960x640.jpg', '我们的计划我们的计划我们的计划我们的计划我们的计划我们的计划', '我们的计划我们的计划我们的计划我们的计划我们的计划', '0.00', '4', '2', '1', '111', '2016-12-24 17:28:33', '2016-12-14 17:28:33', '0', '600.00', '2', '1', '2', '500.00', null, '2');
INSERT INTO `project` VALUES ('34', 'llx', 'object-3-960x640.jpg', '我们的计划', '我们的计划我们的计划我们的计划我们的计划我们的计划我们的计划', '0.00', '4', '2', '1', '112', '2016-12-24 17:37:55', '2016-12-14 17:37:55', '0', '500.00', '1', '1', '2', '300.00', null, '3');
INSERT INTO `project` VALUES ('35', 'xzx', 'object-3-960x640.jpg', '计划计划计划计划计划计划计划计划', '计划计划计划计划计划计划计划', '8.38', '1', '1', '1', '113', '2016-12-24 17:42:47', '2016-12-14 17:42:47', '3', '200.00', '1', '0', '3', '300.00', null, '1');
INSERT INTO `project` VALUES ('36', '杀杀杀杀杀杀杀杀神', 'object-3-960x640.jpg', 'aegawrtaw', 'FAEgewFAEgewr', '0.00', '4', '2', '1', '114', '2016-12-25 15:29:33', '2016-12-15 15:29:33', '0', '150.00', '2', '1', '3', '223.00', null, '2');

-- ----------------------------
-- Table structure for `respro`
-- ----------------------------
DROP TABLE IF EXISTS `respro`;
CREATE TABLE `respro` (
  `rpro_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '项目-成果表',
  `rpro_res_id` int(11) DEFAULT NULL,
  `rpro_pro_id` int(11) DEFAULT NULL,
  `rpro_remark` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`rpro_id`),
  KEY `fk19` (`rpro_res_id`),
  KEY `fk20` (`rpro_pro_id`),
  CONSTRAINT `fk19` FOREIGN KEY (`rpro_res_id`) REFERENCES `result` (`res_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk20` FOREIGN KEY (`rpro_pro_id`) REFERENCES `project` (`pro_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of respro
-- ----------------------------
INSERT INTO `respro` VALUES ('1', '11', '5', null);
INSERT INTO `respro` VALUES ('2', '13', '5', null);
INSERT INTO `respro` VALUES ('3', '11', '6', null);
INSERT INTO `respro` VALUES ('4', '12', '6', null);
INSERT INTO `respro` VALUES ('6', '13', '6', null);
INSERT INTO `respro` VALUES ('7', '12', '7', null);
INSERT INTO `respro` VALUES ('9', '12', '8', null);
INSERT INTO `respro` VALUES ('10', '13', '8', null);
INSERT INTO `respro` VALUES ('11', '11', '9', null);
INSERT INTO `respro` VALUES ('12', '11', '10', null);
INSERT INTO `respro` VALUES ('13', '12', '11', null);
INSERT INTO `respro` VALUES ('15', '12', '14', null);
INSERT INTO `respro` VALUES ('18', '13', '15', null);
INSERT INTO `respro` VALUES ('19', '11', '16', null);
INSERT INTO `respro` VALUES ('20', '14', '17', null);
INSERT INTO `respro` VALUES ('21', '14', '18', null);
INSERT INTO `respro` VALUES ('22', '28', '19', null);
INSERT INTO `respro` VALUES ('23', '1', '19', null);
INSERT INTO `respro` VALUES ('24', '32', '20', null);
INSERT INTO `respro` VALUES ('25', '28', '20', null);
INSERT INTO `respro` VALUES ('26', '32', '21', null);
INSERT INTO `respro` VALUES ('27', '28', '22', null);
INSERT INTO `respro` VALUES ('28', '32', '24', null);
INSERT INTO `respro` VALUES ('29', '13', '25', null);
INSERT INTO `respro` VALUES ('30', '13', '26', null);
INSERT INTO `respro` VALUES ('31', '13', '27', null);
INSERT INTO `respro` VALUES ('32', '13', '28', null);
INSERT INTO `respro` VALUES ('33', '13', '29', null);
INSERT INTO `respro` VALUES ('34', '13', '30', null);
INSERT INTO `respro` VALUES ('35', '13', '31', null);
INSERT INTO `respro` VALUES ('36', '13', '32', null);
INSERT INTO `respro` VALUES ('37', '32', '33', null);
INSERT INTO `respro` VALUES ('38', '13', '33', null);
INSERT INTO `respro` VALUES ('39', '32', '34', null);
INSERT INTO `respro` VALUES ('40', '13', '34', null);
INSERT INTO `respro` VALUES ('41', '32', '35', null);
INSERT INTO `respro` VALUES ('42', '13', '35', null);
INSERT INTO `respro` VALUES ('43', '32', '36', null);
INSERT INTO `respro` VALUES ('44', '13', '36', null);

-- ----------------------------
-- Table structure for `result`
-- ----------------------------
DROP TABLE IF EXISTS `result`;
CREATE TABLE `result` (
  `res_id` int(11) NOT NULL AUTO_INCREMENT,
  `res_type` int(4) DEFAULT NULL,
  `res_name` varchar(20) DEFAULT NULL,
  `res_provider` int(11) DEFAULT NULL,
  `res_introduction` varchar(500) DEFAULT NULL,
  `res_url` int(11) DEFAULT NULL COMMENT '附件',
  `res_flag` int(4) DEFAULT NULL COMMENT '待评估为1，评估截至为2',
  `res_evalue` double(10,2) DEFAULT NULL,
  `res_eva_deadline` varchar(30) DEFAULT NULL,
  `res_protime` varchar(30) DEFAULT NULL COMMENT '提交时间',
  `res_times` int(11) DEFAULT NULL COMMENT '评估次数',
  PRIMARY KEY (`res_id`),
  KEY `foreignkey3` (`res_provider`),
  KEY `fk27` (`res_type`),
  KEY `fk28` (`res_url`),
  CONSTRAINT `fk28` FOREIGN KEY (`res_url`) REFERENCES `upload` (`upload_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `foreignkey3` FOREIGN KEY (`res_provider`) REFERENCES `resultprovider` (`rp_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of result
-- ----------------------------
INSERT INTO `result` VALUES ('1', '1', '11', '1', '11', null, '1', '7.25', '2016-12-31 20:45:22', '2016-10-21 20:45:22', '1');
INSERT INTO `result` VALUES ('2', '1', '111', '1', '111', null, '1', '1.00', '2016-12-31 20:45:22', '2016-10-20 20:45:22', '0');
INSERT INTO `result` VALUES ('3', '1', '123', '1', '123', '21', '2', '6.00', '2016-12-10 20:45:22', '2016-10-19 20:45:22', '1');
INSERT INTO `result` VALUES ('4', '1', '1234', '1', '123', '22', '1', '6.50', '2016-12-31 20:45:22', '2016-10-21 20:45:22', '0');
INSERT INTO `result` VALUES ('5', '1', '12345', '1', '12345', '23', '1', '2.00', '2016-12-31 20:45:22', '2016-10-21 20:45:22', '0');
INSERT INTO `result` VALUES ('6', '1', '333333333', '1', '333', '24', '1', '2.00', '2016-12-31 20:45:22', '2016-10-21 20:45:22', '0');
INSERT INTO `result` VALUES ('7', '1', '4', '1', '4', '25', '1', '2.00', '2016-12-31 20:45:22', '2016-10-21 20:45:22', '0');
INSERT INTO `result` VALUES ('8', '1', '111111111', '1', '111', '26', '1', '2.00', '2016-12-31 20:45:22', '2016-10-21 20:45:22', '0');
INSERT INTO `result` VALUES ('9', '1', 'gdsfdfsgfsd', '1', 'dfsgdfg', '27', '1', '3.00', '2016-12-31 20:45:22', '2016-10-21 20:45:22', '0');
INSERT INTO `result` VALUES ('11', '2', 'ewattew', '2', 'fdszrgteg5', '29', '1', '3.00', '2016-12-31 20:45:22', '2016-10-21 20:45:22', '2');
INSERT INTO `result` VALUES ('12', '3', 'zzzzzzzzzzzz', '3', 'zzzzzzzzzzzzzzzzzzzzzzzzzzzzzz', '30', '1', '3.00', '2016-12-31 20:45:22', '2016-10-21 20:45:22', '3');
INSERT INTO `result` VALUES ('13', '3', 'cccccccccc', '3', 'ccccccccccccccccccccccccccccc', '31', '2', '8.00', '2016-12-31 20:45:22', '2016-10-02 20:45:22', '2');
INSERT INTO `result` VALUES ('14', '1', '1', '3', '11', '11', '1', '10.00', '2016-12-31 20:45:22', '2016-10-02 20:45:22', '1');
INSERT INTO `result` VALUES ('15', '1', 'wwwwwwwwwwwwwwwww', '3', 'wwwwwww', null, '2', '6.80', '2016-12-31 20:45:22', '2016-10-02 20:45', '1');
INSERT INTO `result` VALUES ('16', '1', '234', '1', '?????????????????????????', '50', '1', '0.00', '2016-12-18 01:43:44', '2016-12-08 01:43:44', '0');
INSERT INTO `result` VALUES ('17', '1', 'D123', '1', '?????????????????', '51', '1', '0.00', '2016-12-18 01:46:58', '2016-12-08 01:46:58', '0');
INSERT INTO `result` VALUES ('18', '1', 'D1234', '1', '?????????????????', '52', '1', '0.00', '2016-12-18 01:47:14', '2016-12-08 01:47:14', '0');
INSERT INTO `result` VALUES ('19', '1', '111222333', '1', 'qqqqqqqqqqqqqqqqq', '53', '1', '0.00', '2016-12-18 02:15:00', '2016-12-08 02:15:00', '0');
INSERT INTO `result` VALUES ('20', '1', '??????', '1', '??????????????????', '54', '1', '0.00', '2016-12-18 02:19:59', '2016-12-08 02:19:59', '0');
INSERT INTO `result` VALUES ('21', '1', '?????', '1', '?????????????????????????', '55', '1', '0.00', '2016-12-18 02:43:03', '2016-12-08 02:43:03', '0');
INSERT INTO `result` VALUES ('22', '1', 'aaaccccccccccccc', '1', '122222222222222222222222222222222222222222222220000000000000000000000', '56', '1', '0.00', '2016-12-18 03:28:55', '2016-12-08 03:28:55', '0');
INSERT INTO `result` VALUES ('23', '1', '?????', '1', '??????????????????????????????', '57', '1', '0.00', '2016-12-18 08:19:43', '2016-12-08 08:19:43', '0');
INSERT INTO `result` VALUES ('24', '1', '去去去', '1', '???????', '58', '1', '0.00', '2016-12-18 08:30:03', '2016-12-08 08:30:03', '0');
INSERT INTO `result` VALUES ('25', '1', '阿萨德', '1', '娃娃亲安德森', '59', '1', '0.00', '2016-12-18 08:34:12', '2016-12-08 08:34:12', '0');
INSERT INTO `result` VALUES ('26', '1', '张玉筱测试去去去阿萨德', '1', '啊啊安在旭速度而人人人人', '60', '1', '0.00', '2016-12-18 08:40:18', '2016-12-08 08:40:18', '0');
INSERT INTO `result` VALUES ('27', '1', 'aaaaaaaaaa', '1', '钱钱钱钱钱钱钱钱钱钱钱钱钱钱钱钱钱钱钱钱全体党员', '61', '1', '0.00', '2016-12-18 09:53:59', '2016-12-08 09:53:59', '0');
INSERT INTO `result` VALUES ('28', '2', 'zyxzyx', '2', 'adWDQQ', '62', '1', '7.35', '2016-12-19 22:26:51', '2016-12-09 22:26:51', '1');
INSERT INTO `result` VALUES ('29', '3', 'qq', '3', 'qqqqq', '63', '1', '7.80', '2016-12-20 20:08:26', '2016-12-10 20:08:26', '0');
INSERT INTO `result` VALUES ('30', '3', 'qq', '3', 'qqqqq', '64', '1', '0.00', '2016-12-20 20:08:36', '2016-12-10 20:08:36', '0');
INSERT INTO `result` VALUES ('31', '3', '????', '3', 'h????i???????', '65', '1', '0.00', '2016-12-20 20:14:19', '2016-12-10 20:14:19', '0');
INSERT INTO `result` VALUES ('32', '3', '软件基本信息', '3', '软件基本信息软件基本信息软件基本信息软件基本信息', '66', '2', '8.33', '2016-12-11 20:18:49', '2016-12-10 20:18:49', '2');
INSERT INTO `result` VALUES ('33', '1', '自行车的改良', '4', '自行车的改良自行车的改良自行车的改良自行车的改良自行车的改良', '102', '1', '7.80', '2016-12-21 18:56:37', '2016-12-11 18:56:37', '0');
INSERT INTO `result` VALUES ('34', '1', 'wqq', '4', 'wqqqwqqwqq', '107', '1', '0.00', '2016-12-21 20:41:51', '2016-12-11 20:41:51', '0');
INSERT INTO `result` VALUES ('35', '1', '张玉筱张玉筱', '4', '张玉筱张玉筱张玉筱张玉筱张玉筱张玉筱张玉筱张玉筱', '108', '1', '8.18', '2016-12-22 13:06:11', '2016-12-12 13:06:11', '1');
INSERT INTO `result` VALUES ('36', '1', 'asewargth', '4', 'RsZDTHE', '115', '1', '7.90', '2016-12-25 15:34:33', '2016-12-15 15:34:33', '1');

-- ----------------------------
-- Table structure for `resultprovider`
-- ----------------------------
DROP TABLE IF EXISTS `resultprovider`;
CREATE TABLE `resultprovider` (
  `rp_id` int(11) NOT NULL DEFAULT '0',
  `rp_qualification` varchar(10) DEFAULT NULL COMMENT '研究资历',
  `rp_field` varchar(30) DEFAULT NULL COMMENT '研究领域（方向）',
  `rp_research` varchar(50) DEFAULT NULL COMMENT '科研情况介绍',
  PRIMARY KEY (`rp_id`),
  CONSTRAINT `foreignkey1` FOREIGN KEY (`rp_id`) REFERENCES `user` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of resultprovider
-- ----------------------------
INSERT INTO `resultprovider` VALUES ('1', null, null, null);
INSERT INTO `resultprovider` VALUES ('2', null, null, null);
INSERT INTO `resultprovider` VALUES ('3', null, null, null);
INSERT INTO `resultprovider` VALUES ('4', '22222', '22222', '222222');
INSERT INTO `resultprovider` VALUES ('6', '????', '????', '等等等');
INSERT INTO `resultprovider` VALUES ('8', 'dsfsd', 'dsfsdfsd', 'sdfsdfsd');
INSERT INTO `resultprovider` VALUES ('9', '12345', '1231231', '12312312');
INSERT INTO `resultprovider` VALUES ('10', 'qwe', 'we', 'wqe');
INSERT INTO `resultprovider` VALUES ('11', 'wdsdfsfsd', 'sdfsdfsd', 'sdfsdfsdfsdfsd');
INSERT INTO `resultprovider` VALUES ('12', 'adasd', 'asdasdas', 'asdasda');
INSERT INTO `resultprovider` VALUES ('13', '12312', '123123', '123123');
INSERT INTO `resultprovider` VALUES ('14', 'adas', 'asdasda', 'sadasd');
INSERT INTO `resultprovider` VALUES ('17', '123123', '123123', '12312312312');

-- ----------------------------
-- Table structure for `score_index`
-- ----------------------------
DROP TABLE IF EXISTS `score_index`;
CREATE TABLE `score_index` (
  `sri_id` int(11) NOT NULL AUTO_INCREMENT,
  `sri_eva_id` int(11) DEFAULT NULL,
  `sri_item` int(11) DEFAULT NULL,
  `sri_score` double(11,2) DEFAULT NULL,
  `sri_reason` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`sri_id`),
  KEY `fk32` (`sri_eva_id`),
  KEY `fk33` (`sri_item`),
  CONSTRAINT `fk32` FOREIGN KEY (`sri_eva_id`) REFERENCES `evaluation` (`eva_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk33` FOREIGN KEY (`sri_item`) REFERENCES `index1` (`index_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of score_index
-- ----------------------------
INSERT INTO `score_index` VALUES ('1', '7', '1', '6.00', '还行');
INSERT INTO `score_index` VALUES ('2', '7', '2', '6.00', '一般');
INSERT INTO `score_index` VALUES ('3', '7', '3', '7.00', '良好');
INSERT INTO `score_index` VALUES ('4', '7', '4', '7.00', '良好');
INSERT INTO `score_index` VALUES ('5', '8', '1', '8.00', '良好');
INSERT INTO `score_index` VALUES ('6', '8', '2', '6.00', '一般');
INSERT INTO `score_index` VALUES ('7', '8', '3', '8.00', '良好');
INSERT INTO `score_index` VALUES ('8', '8', '4', '7.00', '还行');
INSERT INTO `score_index` VALUES ('9', '9', '1', '8.00', '好');
INSERT INTO `score_index` VALUES ('10', '9', '2', '8.00', '好');
INSERT INTO `score_index` VALUES ('11', '9', '3', '7.00', '一般');
INSERT INTO `score_index` VALUES ('12', '9', '4', '9.00', '良好');
INSERT INTO `score_index` VALUES ('13', '10', '1', '4.70', '太差');
INSERT INTO `score_index` VALUES ('14', '10', '2', '5.00', '差');
INSERT INTO `score_index` VALUES ('15', '10', '3', '6.00', '及格');
INSERT INTO `score_index` VALUES ('16', '10', '4', '6.00', '一般');
INSERT INTO `score_index` VALUES ('17', '11', '1', '8.68', '好');
INSERT INTO `score_index` VALUES ('18', '11', '2', '7.88', '良好');
INSERT INTO `score_index` VALUES ('19', '11', '3', '8.90', '优秀');
INSERT INTO `score_index` VALUES ('20', '11', '4', '8.00', '总体可行');
INSERT INTO `score_index` VALUES ('21', '12', '1', '8.68', '好');
INSERT INTO `score_index` VALUES ('22', '12', '2', '7.88', '良好');
INSERT INTO `score_index` VALUES ('23', '12', '3', '8.90', '优秀');
INSERT INTO `score_index` VALUES ('24', '12', '4', '8.00', '总体可行');
INSERT INTO `score_index` VALUES ('25', '13', '1', '8.30', '良好');
INSERT INTO `score_index` VALUES ('26', '13', '2', '7.30', '一般');
INSERT INTO `score_index` VALUES ('27', '13', '3', '8.90', '优秀');
INSERT INTO `score_index` VALUES ('28', '13', '4', '8.50', '总体可行');
INSERT INTO `score_index` VALUES ('29', '14', '1', '7.00', '良好');
INSERT INTO `score_index` VALUES ('30', '14', '2', '7.00', '良好');
INSERT INTO `score_index` VALUES ('31', '14', '3', '8.00', '适应性强');
INSERT INTO `score_index` VALUES ('32', '14', '4', '7.50', '还行');
INSERT INTO `score_index` VALUES ('33', '15', '1', '8.56', '较好');
INSERT INTO `score_index` VALUES ('34', '15', '2', '6.00', '没有达到期望值');
INSERT INTO `score_index` VALUES ('35', '15', '3', '7.00', '还行');
INSERT INTO `score_index` VALUES ('36', '15', '4', '7.50', '还行');
INSERT INTO `score_index` VALUES ('37', '16', '1', '8.00', '好');
INSERT INTO `score_index` VALUES ('38', '16', '2', '8.00', '好');
INSERT INTO `score_index` VALUES ('39', '16', '3', '9.00', '优秀');
INSERT INTO `score_index` VALUES ('40', '16', '4', '7.89', '还行');
INSERT INTO `score_index` VALUES ('41', '17', '5', '9.00', '技术风险较低');
INSERT INTO `score_index` VALUES ('42', '17', '6', '7.00', '资金风险较大');
INSERT INTO `score_index` VALUES ('43', '17', '7', '7.00', '有政策支持是好事');
INSERT INTO `score_index` VALUES ('44', '17', '8', '8.50', '市场前景很好');
INSERT INTO `score_index` VALUES ('45', '17', '9', '9.00', '设计方案整体没有大的缺陷');
INSERT INTO `score_index` VALUES ('46', '17', '10', '8.40', '综合上述风险和其他非显著性风险，整体还行');
INSERT INTO `score_index` VALUES ('47', '18', '1', '8.90', '好');
INSERT INTO `score_index` VALUES ('48', '18', '2', '8.00', '功能完备性不够');
INSERT INTO `score_index` VALUES ('49', '18', '3', '8.90', '良好');
INSERT INTO `score_index` VALUES ('50', '18', '4', '8.50', '有一定可行性');
INSERT INTO `score_index` VALUES ('51', '19', '1', '8.50', '很好');
INSERT INTO `score_index` VALUES ('52', '19', '2', '8.90', '好');
INSERT INTO `score_index` VALUES ('53', '19', '3', '8.00', '一般');
INSERT INTO `score_index` VALUES ('54', '19', '4', '8.30', '总体还行');
INSERT INTO `score_index` VALUES ('55', '20', '5', '9.20', 'hao');
INSERT INTO `score_index` VALUES ('56', '20', '6', '7.00', '有一定的资金风险');
INSERT INTO `score_index` VALUES ('57', '20', '7', '7.00', '有政策支持，且其他社会因素也还行');
INSERT INTO `score_index` VALUES ('58', '20', '8', '8.50', '市场前景较好');
INSERT INTO `score_index` VALUES ('59', '20', '9', '9.00', '设计方案整体没有大的缺陷');
INSERT INTO `score_index` VALUES ('60', '20', '10', '8.50', '综合上述风险和其他非显著性风险，整体还行');
INSERT INTO `score_index` VALUES ('61', '37', '1', '7.60', 'hao ');
INSERT INTO `score_index` VALUES ('62', '37', '2', '7.90', 'yiban ');
INSERT INTO `score_index` VALUES ('63', '37', '3', '8.00', 'hao');
INSERT INTO `score_index` VALUES ('64', '37', '4', '8.00', 'eflgw');

-- ----------------------------
-- Table structure for `score_record`
-- ----------------------------
DROP TABLE IF EXISTS `score_record`;
CREATE TABLE `score_record` (
  `sr_id` int(11) NOT NULL AUTO_INCREMENT,
  `sr_eva_id` int(11) DEFAULT NULL COMMENT '外键，因素或指标',
  `sr_item` int(11) DEFAULT NULL,
  `sr_score` double(11,2) DEFAULT NULL,
  `sr_reason` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`sr_id`),
  KEY `fk30` (`sr_eva_id`),
  KEY `fk31` (`sr_item`),
  CONSTRAINT `fk30` FOREIGN KEY (`sr_eva_id`) REFERENCES `evaluation` (`eva_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk31` FOREIGN KEY (`sr_item`) REFERENCES `factor` (`factor_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=450 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of score_record
-- ----------------------------
INSERT INTO `score_record` VALUES ('1', '26', '29', '8.00', null);
INSERT INTO `score_record` VALUES ('2', '27', '29', '8.00', null);
INSERT INTO `score_record` VALUES ('3', '28', '29', '8.00', null);
INSERT INTO `score_record` VALUES ('4', '29', '29', '8.00', null);
INSERT INTO `score_record` VALUES ('5', '29', '30', '8.00', null);
INSERT INTO `score_record` VALUES ('6', '29', '32', '8.00', null);
INSERT INTO `score_record` VALUES ('7', '29', '33', '8.00', null);
INSERT INTO `score_record` VALUES ('8', '29', '34', '8.00', null);
INSERT INTO `score_record` VALUES ('9', '29', '35', '8.00', null);
INSERT INTO `score_record` VALUES ('10', '29', '36', '8.00', null);
INSERT INTO `score_record` VALUES ('11', '29', '37', '8.00', null);
INSERT INTO `score_record` VALUES ('12', '29', '38', '8.00', null);
INSERT INTO `score_record` VALUES ('13', '29', '39', '8.00', null);
INSERT INTO `score_record` VALUES ('14', '29', '40', '8.00', null);
INSERT INTO `score_record` VALUES ('15', '29', '41', '8.00', null);
INSERT INTO `score_record` VALUES ('16', '29', '42', '8.00', null);
INSERT INTO `score_record` VALUES ('17', '29', '43', '8.00', null);
INSERT INTO `score_record` VALUES ('18', '29', '44', '8.00', null);
INSERT INTO `score_record` VALUES ('19', '29', '45', '8.00', null);
INSERT INTO `score_record` VALUES ('20', '29', '46', '8.00', null);
INSERT INTO `score_record` VALUES ('21', '29', '47', '8.00', null);
INSERT INTO `score_record` VALUES ('22', '29', '78', '8.00', null);
INSERT INTO `score_record` VALUES ('23', '30', '29', '8.00', null);
INSERT INTO `score_record` VALUES ('24', '30', '30', '8.00', null);
INSERT INTO `score_record` VALUES ('25', '30', '32', '8.00', null);
INSERT INTO `score_record` VALUES ('26', '30', '33', '8.00', null);
INSERT INTO `score_record` VALUES ('27', '30', '34', '8.00', null);
INSERT INTO `score_record` VALUES ('28', '30', '35', '8.00', null);
INSERT INTO `score_record` VALUES ('29', '30', '36', '8.00', null);
INSERT INTO `score_record` VALUES ('30', '30', '37', '8.00', null);
INSERT INTO `score_record` VALUES ('31', '30', '38', '8.00', null);
INSERT INTO `score_record` VALUES ('32', '30', '39', '8.00', null);
INSERT INTO `score_record` VALUES ('33', '30', '40', '8.00', null);
INSERT INTO `score_record` VALUES ('34', '30', '41', '8.00', null);
INSERT INTO `score_record` VALUES ('35', '30', '42', '8.00', null);
INSERT INTO `score_record` VALUES ('36', '30', '43', '8.00', null);
INSERT INTO `score_record` VALUES ('37', '30', '44', '8.00', null);
INSERT INTO `score_record` VALUES ('38', '30', '45', '8.00', null);
INSERT INTO `score_record` VALUES ('39', '30', '46', '8.00', null);
INSERT INTO `score_record` VALUES ('40', '30', '47', '8.00', null);
INSERT INTO `score_record` VALUES ('41', '30', '78', '8.00', null);
INSERT INTO `score_record` VALUES ('42', '31', '29', '8.00', null);
INSERT INTO `score_record` VALUES ('43', '31', '30', '8.00', null);
INSERT INTO `score_record` VALUES ('44', '31', '32', '8.00', null);
INSERT INTO `score_record` VALUES ('45', '31', '33', '8.00', null);
INSERT INTO `score_record` VALUES ('46', '31', '34', '8.00', null);
INSERT INTO `score_record` VALUES ('47', '31', '35', '8.00', null);
INSERT INTO `score_record` VALUES ('48', '31', '36', '8.00', null);
INSERT INTO `score_record` VALUES ('49', '31', '37', '8.00', null);
INSERT INTO `score_record` VALUES ('50', '31', '38', '8.00', null);
INSERT INTO `score_record` VALUES ('51', '31', '39', '8.00', null);
INSERT INTO `score_record` VALUES ('52', '31', '40', '8.00', null);
INSERT INTO `score_record` VALUES ('53', '31', '41', '8.00', null);
INSERT INTO `score_record` VALUES ('54', '31', '42', '8.00', null);
INSERT INTO `score_record` VALUES ('55', '31', '43', '8.00', null);
INSERT INTO `score_record` VALUES ('56', '31', '44', '8.00', null);
INSERT INTO `score_record` VALUES ('57', '31', '45', '8.00', null);
INSERT INTO `score_record` VALUES ('58', '31', '46', '8.00', null);
INSERT INTO `score_record` VALUES ('59', '31', '47', '8.00', null);
INSERT INTO `score_record` VALUES ('60', '31', '78', '8.00', null);
INSERT INTO `score_record` VALUES ('61', '32', '29', '8.00', null);
INSERT INTO `score_record` VALUES ('62', '32', '30', '8.00', null);
INSERT INTO `score_record` VALUES ('63', '32', '32', '8.00', null);
INSERT INTO `score_record` VALUES ('64', '32', '33', '8.00', null);
INSERT INTO `score_record` VALUES ('65', '32', '34', '8.00', null);
INSERT INTO `score_record` VALUES ('66', '32', '35', '8.00', null);
INSERT INTO `score_record` VALUES ('67', '32', '36', '8.00', null);
INSERT INTO `score_record` VALUES ('68', '32', '37', '8.00', null);
INSERT INTO `score_record` VALUES ('69', '32', '38', '8.00', null);
INSERT INTO `score_record` VALUES ('70', '32', '39', '8.00', null);
INSERT INTO `score_record` VALUES ('71', '32', '40', '8.00', null);
INSERT INTO `score_record` VALUES ('72', '32', '41', '8.00', null);
INSERT INTO `score_record` VALUES ('73', '32', '42', '8.00', null);
INSERT INTO `score_record` VALUES ('74', '32', '43', '8.00', null);
INSERT INTO `score_record` VALUES ('75', '32', '44', '8.00', null);
INSERT INTO `score_record` VALUES ('76', '32', '45', '8.00', null);
INSERT INTO `score_record` VALUES ('77', '32', '46', '8.00', null);
INSERT INTO `score_record` VALUES ('78', '32', '47', '8.00', null);
INSERT INTO `score_record` VALUES ('79', '32', '78', '8.00', null);
INSERT INTO `score_record` VALUES ('80', '33', '29', '0.00', null);
INSERT INTO `score_record` VALUES ('81', '33', '30', '0.00', null);
INSERT INTO `score_record` VALUES ('82', '33', '32', '0.00', null);
INSERT INTO `score_record` VALUES ('83', '33', '33', '0.00', null);
INSERT INTO `score_record` VALUES ('84', '33', '34', '0.00', null);
INSERT INTO `score_record` VALUES ('85', '33', '35', '0.00', null);
INSERT INTO `score_record` VALUES ('86', '33', '36', '0.00', null);
INSERT INTO `score_record` VALUES ('87', '33', '37', '0.00', null);
INSERT INTO `score_record` VALUES ('88', '33', '38', '0.00', null);
INSERT INTO `score_record` VALUES ('89', '33', '39', '0.00', null);
INSERT INTO `score_record` VALUES ('90', '33', '40', '0.00', null);
INSERT INTO `score_record` VALUES ('91', '33', '41', '0.00', null);
INSERT INTO `score_record` VALUES ('92', '33', '42', '0.00', null);
INSERT INTO `score_record` VALUES ('93', '33', '43', '0.00', null);
INSERT INTO `score_record` VALUES ('94', '33', '44', '0.00', null);
INSERT INTO `score_record` VALUES ('95', '33', '45', '0.00', null);
INSERT INTO `score_record` VALUES ('96', '33', '46', '0.00', null);
INSERT INTO `score_record` VALUES ('97', '33', '47', '0.00', null);
INSERT INTO `score_record` VALUES ('98', '33', '78', '0.00', null);
INSERT INTO `score_record` VALUES ('99', '34', '29', '8.00', null);
INSERT INTO `score_record` VALUES ('100', '34', '30', '8.00', null);
INSERT INTO `score_record` VALUES ('101', '34', '32', '8.00', null);
INSERT INTO `score_record` VALUES ('102', '34', '33', '8.00', null);
INSERT INTO `score_record` VALUES ('103', '34', '34', '8.00', null);
INSERT INTO `score_record` VALUES ('104', '34', '35', '8.00', null);
INSERT INTO `score_record` VALUES ('105', '34', '36', '8.00', null);
INSERT INTO `score_record` VALUES ('106', '34', '37', '8.00', null);
INSERT INTO `score_record` VALUES ('107', '34', '38', '8.00', null);
INSERT INTO `score_record` VALUES ('108', '34', '39', '8.00', null);
INSERT INTO `score_record` VALUES ('109', '34', '40', '8.00', null);
INSERT INTO `score_record` VALUES ('110', '34', '41', '8.00', null);
INSERT INTO `score_record` VALUES ('111', '34', '42', '8.00', null);
INSERT INTO `score_record` VALUES ('112', '34', '43', '8.00', null);
INSERT INTO `score_record` VALUES ('113', '34', '44', '8.00', null);
INSERT INTO `score_record` VALUES ('114', '34', '45', '8.00', null);
INSERT INTO `score_record` VALUES ('115', '34', '46', '8.00', null);
INSERT INTO `score_record` VALUES ('116', '34', '47', '8.00', null);
INSERT INTO `score_record` VALUES ('117', '34', '78', '8.00', null);
INSERT INTO `score_record` VALUES ('118', '34', '31', '6.00', null);
INSERT INTO `score_record` VALUES ('119', '34', '48', '6.00', null);
INSERT INTO `score_record` VALUES ('120', '34', '49', '6.00', null);
INSERT INTO `score_record` VALUES ('121', '34', '50', '6.00', null);
INSERT INTO `score_record` VALUES ('122', '34', '51', '6.00', null);
INSERT INTO `score_record` VALUES ('123', '34', '52', '6.00', null);
INSERT INTO `score_record` VALUES ('124', '34', '53', '6.00', null);
INSERT INTO `score_record` VALUES ('125', '34', '54', '6.00', null);
INSERT INTO `score_record` VALUES ('126', '34', '55', '6.00', null);
INSERT INTO `score_record` VALUES ('127', '34', '56', '6.00', null);
INSERT INTO `score_record` VALUES ('128', '34', '57', '6.00', null);
INSERT INTO `score_record` VALUES ('129', '34', '58', '6.00', null);
INSERT INTO `score_record` VALUES ('130', '34', '59', '6.00', null);
INSERT INTO `score_record` VALUES ('131', '34', '60', '6.00', null);
INSERT INTO `score_record` VALUES ('132', '34', '61', '6.00', null);
INSERT INTO `score_record` VALUES ('133', '34', '62', '6.00', null);
INSERT INTO `score_record` VALUES ('134', '34', '63', '8.00', null);
INSERT INTO `score_record` VALUES ('135', '34', '64', '8.00', null);
INSERT INTO `score_record` VALUES ('136', '34', '65', '8.00', null);
INSERT INTO `score_record` VALUES ('137', '34', '66', '8.00', null);
INSERT INTO `score_record` VALUES ('138', '34', '67', '8.00', null);
INSERT INTO `score_record` VALUES ('139', '34', '68', '8.00', null);
INSERT INTO `score_record` VALUES ('140', '34', '69', '8.00', null);
INSERT INTO `score_record` VALUES ('141', '34', '70', '8.00', null);
INSERT INTO `score_record` VALUES ('142', '34', '71', '8.00', null);
INSERT INTO `score_record` VALUES ('143', '34', '72', '8.00', null);
INSERT INTO `score_record` VALUES ('144', '34', '73', '8.00', null);
INSERT INTO `score_record` VALUES ('145', '34', '74', '8.00', null);
INSERT INTO `score_record` VALUES ('146', '34', '75', '8.00', null);
INSERT INTO `score_record` VALUES ('147', '34', '76', '8.00', null);
INSERT INTO `score_record` VALUES ('148', '34', '77', '8.00', null);
INSERT INTO `score_record` VALUES ('149', '34', '79', '8.00', null);
INSERT INTO `score_record` VALUES ('150', '34', '80', '8.00', null);
INSERT INTO `score_record` VALUES ('151', '34', '81', '8.00', null);
INSERT INTO `score_record` VALUES ('152', '34', '82', '8.00', null);
INSERT INTO `score_record` VALUES ('153', '34', '83', '8.00', null);
INSERT INTO `score_record` VALUES ('154', '34', '84', '8.00', null);
INSERT INTO `score_record` VALUES ('155', '34', '85', '8.00', null);
INSERT INTO `score_record` VALUES ('156', '34', '86', '8.00', null);
INSERT INTO `score_record` VALUES ('157', '34', '87', '8.00', null);
INSERT INTO `score_record` VALUES ('158', '34', '88', '8.00', null);
INSERT INTO `score_record` VALUES ('159', '34', '89', '8.00', null);
INSERT INTO `score_record` VALUES ('160', '34', '90', '8.00', null);
INSERT INTO `score_record` VALUES ('161', '34', '91', '8.00', null);
INSERT INTO `score_record` VALUES ('162', '34', '92', '8.00', null);
INSERT INTO `score_record` VALUES ('163', '34', '93', '8.00', null);
INSERT INTO `score_record` VALUES ('164', '34', '94', '8.00', null);
INSERT INTO `score_record` VALUES ('165', '34', '95', '8.00', null);
INSERT INTO `score_record` VALUES ('166', '34', '96', '8.00', null);
INSERT INTO `score_record` VALUES ('167', '34', '97', '8.00', null);
INSERT INTO `score_record` VALUES ('168', '34', '98', '8.00', null);
INSERT INTO `score_record` VALUES ('169', '34', '99', '8.00', null);
INSERT INTO `score_record` VALUES ('170', '34', '100', '8.00', null);
INSERT INTO `score_record` VALUES ('171', '34', '101', '8.00', null);
INSERT INTO `score_record` VALUES ('172', '34', '102', '8.00', null);
INSERT INTO `score_record` VALUES ('173', '34', '103', '8.00', null);
INSERT INTO `score_record` VALUES ('174', '34', '104', '8.00', null);
INSERT INTO `score_record` VALUES ('175', '34', '105', '8.00', null);
INSERT INTO `score_record` VALUES ('176', '34', '106', '8.00', null);
INSERT INTO `score_record` VALUES ('177', '34', '107', '8.00', null);
INSERT INTO `score_record` VALUES ('178', '34', '108', '8.00', null);
INSERT INTO `score_record` VALUES ('179', '34', '109', '8.00', null);
INSERT INTO `score_record` VALUES ('180', '34', '110', '8.00', null);
INSERT INTO `score_record` VALUES ('181', '34', '111', '8.00', null);
INSERT INTO `score_record` VALUES ('182', '34', '112', '8.00', null);
INSERT INTO `score_record` VALUES ('183', '34', '113', '8.00', null);
INSERT INTO `score_record` VALUES ('184', '34', '114', '8.00', null);
INSERT INTO `score_record` VALUES ('185', '34', '115', '8.00', null);
INSERT INTO `score_record` VALUES ('186', '34', '116', '8.00', null);
INSERT INTO `score_record` VALUES ('187', '34', '117', '8.00', null);
INSERT INTO `score_record` VALUES ('188', '34', '118', '8.00', null);
INSERT INTO `score_record` VALUES ('189', '34', '119', '8.00', null);
INSERT INTO `score_record` VALUES ('190', '34', '120', '8.00', null);
INSERT INTO `score_record` VALUES ('191', '34', '121', '8.00', null);
INSERT INTO `score_record` VALUES ('192', '34', '122', '8.00', null);
INSERT INTO `score_record` VALUES ('193', '34', '123', '8.00', null);
INSERT INTO `score_record` VALUES ('194', '34', '124', '8.00', null);
INSERT INTO `score_record` VALUES ('195', '34', '125', '8.00', null);
INSERT INTO `score_record` VALUES ('196', '34', '126', '8.00', null);
INSERT INTO `score_record` VALUES ('197', '34', '127', '8.00', null);
INSERT INTO `score_record` VALUES ('198', '34', '128', '8.00', null);
INSERT INTO `score_record` VALUES ('199', '34', '129', '8.00', null);
INSERT INTO `score_record` VALUES ('200', '34', '130', '8.00', null);
INSERT INTO `score_record` VALUES ('201', '34', '131', '8.00', null);
INSERT INTO `score_record` VALUES ('202', '34', '132', '8.00', null);
INSERT INTO `score_record` VALUES ('203', '34', '133', '8.00', null);
INSERT INTO `score_record` VALUES ('204', '34', '134', '8.00', null);
INSERT INTO `score_record` VALUES ('205', '34', '135', '8.00', null);
INSERT INTO `score_record` VALUES ('206', '34', '136', '8.00', null);
INSERT INTO `score_record` VALUES ('207', '34', '137', '8.00', null);
INSERT INTO `score_record` VALUES ('208', '34', '138', '8.00', null);
INSERT INTO `score_record` VALUES ('209', '34', '139', '8.00', null);
INSERT INTO `score_record` VALUES ('210', '34', '140', '8.00', null);
INSERT INTO `score_record` VALUES ('211', '34', '141', '8.00', null);
INSERT INTO `score_record` VALUES ('212', '34', '142', '8.00', null);
INSERT INTO `score_record` VALUES ('213', '34', '143', '8.00', null);
INSERT INTO `score_record` VALUES ('214', '34', '144', '8.00', null);
INSERT INTO `score_record` VALUES ('215', '34', '145', '8.00', null);
INSERT INTO `score_record` VALUES ('216', '35', '29', '8.00', null);
INSERT INTO `score_record` VALUES ('217', '35', '30', '8.00', null);
INSERT INTO `score_record` VALUES ('218', '35', '32', '8.00', null);
INSERT INTO `score_record` VALUES ('219', '35', '33', '8.00', null);
INSERT INTO `score_record` VALUES ('220', '35', '34', '8.00', null);
INSERT INTO `score_record` VALUES ('221', '35', '35', '8.00', null);
INSERT INTO `score_record` VALUES ('222', '35', '36', '8.00', null);
INSERT INTO `score_record` VALUES ('223', '35', '37', '8.00', null);
INSERT INTO `score_record` VALUES ('224', '35', '38', '8.00', null);
INSERT INTO `score_record` VALUES ('225', '35', '39', '8.00', null);
INSERT INTO `score_record` VALUES ('226', '35', '40', '8.00', null);
INSERT INTO `score_record` VALUES ('227', '35', '41', '8.00', null);
INSERT INTO `score_record` VALUES ('228', '35', '42', '8.00', null);
INSERT INTO `score_record` VALUES ('229', '35', '43', '8.00', null);
INSERT INTO `score_record` VALUES ('230', '35', '44', '8.00', null);
INSERT INTO `score_record` VALUES ('231', '35', '45', '8.00', null);
INSERT INTO `score_record` VALUES ('232', '35', '46', '8.00', null);
INSERT INTO `score_record` VALUES ('233', '35', '47', '8.00', null);
INSERT INTO `score_record` VALUES ('234', '35', '78', '8.00', null);
INSERT INTO `score_record` VALUES ('235', '35', '31', '6.00', null);
INSERT INTO `score_record` VALUES ('236', '35', '48', '6.00', null);
INSERT INTO `score_record` VALUES ('237', '35', '49', '6.00', null);
INSERT INTO `score_record` VALUES ('238', '35', '50', '6.00', null);
INSERT INTO `score_record` VALUES ('239', '35', '51', '6.00', null);
INSERT INTO `score_record` VALUES ('240', '35', '52', '6.00', null);
INSERT INTO `score_record` VALUES ('241', '35', '53', '6.00', null);
INSERT INTO `score_record` VALUES ('242', '35', '54', '6.00', null);
INSERT INTO `score_record` VALUES ('243', '35', '55', '6.00', null);
INSERT INTO `score_record` VALUES ('244', '35', '56', '6.00', null);
INSERT INTO `score_record` VALUES ('245', '35', '57', '6.00', null);
INSERT INTO `score_record` VALUES ('246', '35', '58', '6.00', null);
INSERT INTO `score_record` VALUES ('247', '35', '59', '6.00', null);
INSERT INTO `score_record` VALUES ('248', '35', '60', '6.00', null);
INSERT INTO `score_record` VALUES ('249', '35', '61', '6.00', null);
INSERT INTO `score_record` VALUES ('250', '35', '62', '6.00', null);
INSERT INTO `score_record` VALUES ('251', '35', '63', '8.00', null);
INSERT INTO `score_record` VALUES ('252', '35', '64', '8.00', null);
INSERT INTO `score_record` VALUES ('253', '35', '65', '8.00', null);
INSERT INTO `score_record` VALUES ('254', '35', '66', '8.00', null);
INSERT INTO `score_record` VALUES ('255', '35', '67', '8.00', null);
INSERT INTO `score_record` VALUES ('256', '35', '68', '8.00', null);
INSERT INTO `score_record` VALUES ('257', '35', '69', '8.00', null);
INSERT INTO `score_record` VALUES ('258', '35', '70', '8.00', null);
INSERT INTO `score_record` VALUES ('259', '35', '71', '8.00', null);
INSERT INTO `score_record` VALUES ('260', '35', '72', '8.00', null);
INSERT INTO `score_record` VALUES ('261', '35', '73', '8.00', null);
INSERT INTO `score_record` VALUES ('262', '35', '74', '8.00', null);
INSERT INTO `score_record` VALUES ('263', '35', '75', '8.00', null);
INSERT INTO `score_record` VALUES ('264', '35', '76', '8.00', null);
INSERT INTO `score_record` VALUES ('265', '35', '77', '8.00', null);
INSERT INTO `score_record` VALUES ('266', '35', '79', '8.00', null);
INSERT INTO `score_record` VALUES ('267', '35', '80', '8.00', null);
INSERT INTO `score_record` VALUES ('268', '35', '81', '8.00', null);
INSERT INTO `score_record` VALUES ('269', '35', '82', '8.00', null);
INSERT INTO `score_record` VALUES ('270', '35', '83', '8.00', null);
INSERT INTO `score_record` VALUES ('271', '35', '84', '8.00', null);
INSERT INTO `score_record` VALUES ('272', '35', '85', '8.00', null);
INSERT INTO `score_record` VALUES ('273', '35', '86', '8.00', null);
INSERT INTO `score_record` VALUES ('274', '35', '87', '8.00', null);
INSERT INTO `score_record` VALUES ('275', '35', '88', '8.00', null);
INSERT INTO `score_record` VALUES ('276', '35', '89', '8.00', null);
INSERT INTO `score_record` VALUES ('277', '35', '90', '8.00', null);
INSERT INTO `score_record` VALUES ('278', '35', '91', '8.00', null);
INSERT INTO `score_record` VALUES ('279', '35', '92', '8.00', null);
INSERT INTO `score_record` VALUES ('280', '35', '93', '8.00', null);
INSERT INTO `score_record` VALUES ('281', '35', '94', '8.00', null);
INSERT INTO `score_record` VALUES ('282', '35', '95', '8.00', null);
INSERT INTO `score_record` VALUES ('283', '35', '96', '8.00', null);
INSERT INTO `score_record` VALUES ('284', '35', '97', '8.00', null);
INSERT INTO `score_record` VALUES ('285', '35', '98', '8.00', null);
INSERT INTO `score_record` VALUES ('286', '35', '99', '8.00', null);
INSERT INTO `score_record` VALUES ('287', '35', '100', '8.00', null);
INSERT INTO `score_record` VALUES ('288', '35', '101', '8.00', null);
INSERT INTO `score_record` VALUES ('289', '35', '102', '8.00', null);
INSERT INTO `score_record` VALUES ('290', '35', '103', '8.00', null);
INSERT INTO `score_record` VALUES ('291', '35', '104', '8.00', null);
INSERT INTO `score_record` VALUES ('292', '35', '105', '8.00', null);
INSERT INTO `score_record` VALUES ('293', '35', '106', '8.00', null);
INSERT INTO `score_record` VALUES ('294', '35', '107', '8.00', null);
INSERT INTO `score_record` VALUES ('295', '35', '108', '8.00', null);
INSERT INTO `score_record` VALUES ('296', '35', '109', '8.00', null);
INSERT INTO `score_record` VALUES ('297', '35', '110', '8.00', null);
INSERT INTO `score_record` VALUES ('298', '35', '111', '8.00', null);
INSERT INTO `score_record` VALUES ('299', '35', '112', '8.00', null);
INSERT INTO `score_record` VALUES ('300', '35', '113', '8.00', null);
INSERT INTO `score_record` VALUES ('301', '35', '114', '8.00', null);
INSERT INTO `score_record` VALUES ('302', '35', '115', '8.00', null);
INSERT INTO `score_record` VALUES ('303', '35', '116', '8.00', null);
INSERT INTO `score_record` VALUES ('304', '35', '117', '8.00', null);
INSERT INTO `score_record` VALUES ('305', '35', '118', '8.00', null);
INSERT INTO `score_record` VALUES ('306', '35', '119', '8.00', null);
INSERT INTO `score_record` VALUES ('307', '35', '120', '8.00', null);
INSERT INTO `score_record` VALUES ('308', '35', '121', '8.00', null);
INSERT INTO `score_record` VALUES ('309', '35', '122', '8.00', null);
INSERT INTO `score_record` VALUES ('310', '35', '123', '8.00', null);
INSERT INTO `score_record` VALUES ('311', '35', '124', '8.00', null);
INSERT INTO `score_record` VALUES ('312', '35', '125', '8.00', null);
INSERT INTO `score_record` VALUES ('313', '35', '126', '8.00', null);
INSERT INTO `score_record` VALUES ('314', '35', '127', '8.00', null);
INSERT INTO `score_record` VALUES ('315', '35', '128', '8.00', null);
INSERT INTO `score_record` VALUES ('316', '35', '129', '8.00', null);
INSERT INTO `score_record` VALUES ('317', '35', '130', '8.00', null);
INSERT INTO `score_record` VALUES ('318', '35', '131', '8.00', null);
INSERT INTO `score_record` VALUES ('319', '35', '132', '8.00', null);
INSERT INTO `score_record` VALUES ('320', '35', '133', '8.00', null);
INSERT INTO `score_record` VALUES ('321', '35', '134', '8.00', null);
INSERT INTO `score_record` VALUES ('322', '35', '135', '8.00', null);
INSERT INTO `score_record` VALUES ('323', '35', '136', '8.00', null);
INSERT INTO `score_record` VALUES ('324', '35', '137', '8.00', null);
INSERT INTO `score_record` VALUES ('325', '35', '138', '8.00', null);
INSERT INTO `score_record` VALUES ('326', '35', '139', '8.00', null);
INSERT INTO `score_record` VALUES ('327', '35', '140', '8.00', null);
INSERT INTO `score_record` VALUES ('328', '35', '141', '8.00', null);
INSERT INTO `score_record` VALUES ('329', '35', '142', '8.00', null);
INSERT INTO `score_record` VALUES ('330', '35', '143', '8.00', null);
INSERT INTO `score_record` VALUES ('331', '35', '144', '8.00', null);
INSERT INTO `score_record` VALUES ('332', '35', '145', '8.00', null);
INSERT INTO `score_record` VALUES ('333', '36', '29', '7.00', null);
INSERT INTO `score_record` VALUES ('334', '36', '30', '6.00', null);
INSERT INTO `score_record` VALUES ('335', '36', '32', '8.00', null);
INSERT INTO `score_record` VALUES ('336', '36', '33', '8.00', null);
INSERT INTO `score_record` VALUES ('337', '36', '34', '8.00', null);
INSERT INTO `score_record` VALUES ('338', '36', '35', '8.00', null);
INSERT INTO `score_record` VALUES ('339', '36', '36', '8.00', null);
INSERT INTO `score_record` VALUES ('340', '36', '37', '8.00', null);
INSERT INTO `score_record` VALUES ('341', '36', '38', '8.00', null);
INSERT INTO `score_record` VALUES ('342', '36', '39', '8.00', null);
INSERT INTO `score_record` VALUES ('343', '36', '40', '8.00', null);
INSERT INTO `score_record` VALUES ('344', '36', '41', '8.00', null);
INSERT INTO `score_record` VALUES ('345', '36', '42', '8.00', null);
INSERT INTO `score_record` VALUES ('346', '36', '43', '8.00', null);
INSERT INTO `score_record` VALUES ('347', '36', '44', '8.00', null);
INSERT INTO `score_record` VALUES ('348', '36', '45', '8.00', null);
INSERT INTO `score_record` VALUES ('349', '36', '46', '8.00', null);
INSERT INTO `score_record` VALUES ('350', '36', '47', '8.00', null);
INSERT INTO `score_record` VALUES ('351', '36', '78', '8.00', null);
INSERT INTO `score_record` VALUES ('352', '36', '31', '6.00', null);
INSERT INTO `score_record` VALUES ('353', '36', '48', '6.00', null);
INSERT INTO `score_record` VALUES ('354', '36', '49', '6.00', null);
INSERT INTO `score_record` VALUES ('355', '36', '50', '6.00', null);
INSERT INTO `score_record` VALUES ('356', '36', '51', '6.00', null);
INSERT INTO `score_record` VALUES ('357', '36', '52', '6.00', null);
INSERT INTO `score_record` VALUES ('358', '36', '53', '6.00', null);
INSERT INTO `score_record` VALUES ('359', '36', '54', '6.00', null);
INSERT INTO `score_record` VALUES ('360', '36', '55', '6.00', null);
INSERT INTO `score_record` VALUES ('361', '36', '56', '6.00', null);
INSERT INTO `score_record` VALUES ('362', '36', '57', '6.00', null);
INSERT INTO `score_record` VALUES ('363', '36', '58', '6.00', null);
INSERT INTO `score_record` VALUES ('364', '36', '59', '6.00', null);
INSERT INTO `score_record` VALUES ('365', '36', '60', '6.00', null);
INSERT INTO `score_record` VALUES ('366', '36', '61', '6.00', null);
INSERT INTO `score_record` VALUES ('367', '36', '62', '6.00', null);
INSERT INTO `score_record` VALUES ('368', '36', '63', '8.00', null);
INSERT INTO `score_record` VALUES ('369', '36', '64', '8.00', null);
INSERT INTO `score_record` VALUES ('370', '36', '65', '8.00', null);
INSERT INTO `score_record` VALUES ('371', '36', '66', '8.00', null);
INSERT INTO `score_record` VALUES ('372', '36', '67', '8.00', null);
INSERT INTO `score_record` VALUES ('373', '36', '68', '8.00', null);
INSERT INTO `score_record` VALUES ('374', '36', '69', '8.00', null);
INSERT INTO `score_record` VALUES ('375', '36', '70', '8.00', null);
INSERT INTO `score_record` VALUES ('376', '36', '71', '8.00', null);
INSERT INTO `score_record` VALUES ('377', '36', '72', '8.00', null);
INSERT INTO `score_record` VALUES ('378', '36', '73', '8.00', null);
INSERT INTO `score_record` VALUES ('379', '36', '74', '8.00', null);
INSERT INTO `score_record` VALUES ('380', '36', '75', '8.00', null);
INSERT INTO `score_record` VALUES ('381', '36', '76', '8.00', null);
INSERT INTO `score_record` VALUES ('382', '36', '77', '8.00', null);
INSERT INTO `score_record` VALUES ('383', '36', '79', '8.00', null);
INSERT INTO `score_record` VALUES ('384', '36', '80', '8.00', null);
INSERT INTO `score_record` VALUES ('385', '36', '81', '8.00', null);
INSERT INTO `score_record` VALUES ('386', '36', '82', '8.00', null);
INSERT INTO `score_record` VALUES ('387', '36', '83', '8.00', null);
INSERT INTO `score_record` VALUES ('388', '36', '84', '8.00', null);
INSERT INTO `score_record` VALUES ('389', '36', '85', '8.00', null);
INSERT INTO `score_record` VALUES ('390', '36', '86', '8.00', null);
INSERT INTO `score_record` VALUES ('391', '36', '87', '8.00', null);
INSERT INTO `score_record` VALUES ('392', '36', '88', '8.00', null);
INSERT INTO `score_record` VALUES ('393', '36', '89', '8.00', null);
INSERT INTO `score_record` VALUES ('394', '36', '90', '8.00', null);
INSERT INTO `score_record` VALUES ('395', '36', '91', '8.00', null);
INSERT INTO `score_record` VALUES ('396', '36', '92', '8.00', null);
INSERT INTO `score_record` VALUES ('397', '36', '93', '8.00', null);
INSERT INTO `score_record` VALUES ('398', '36', '94', '8.00', null);
INSERT INTO `score_record` VALUES ('399', '36', '95', '8.00', null);
INSERT INTO `score_record` VALUES ('400', '36', '96', '8.00', null);
INSERT INTO `score_record` VALUES ('401', '36', '97', '8.00', null);
INSERT INTO `score_record` VALUES ('402', '36', '98', '8.00', null);
INSERT INTO `score_record` VALUES ('403', '36', '99', '8.00', null);
INSERT INTO `score_record` VALUES ('404', '36', '100', '8.00', null);
INSERT INTO `score_record` VALUES ('405', '36', '101', '8.00', null);
INSERT INTO `score_record` VALUES ('406', '36', '102', '8.00', null);
INSERT INTO `score_record` VALUES ('407', '36', '103', '8.00', null);
INSERT INTO `score_record` VALUES ('408', '36', '104', '8.00', null);
INSERT INTO `score_record` VALUES ('409', '36', '105', '8.00', null);
INSERT INTO `score_record` VALUES ('410', '36', '106', '8.00', null);
INSERT INTO `score_record` VALUES ('411', '36', '107', '8.00', null);
INSERT INTO `score_record` VALUES ('412', '36', '108', '8.00', null);
INSERT INTO `score_record` VALUES ('413', '36', '109', '8.00', null);
INSERT INTO `score_record` VALUES ('414', '36', '110', '8.00', null);
INSERT INTO `score_record` VALUES ('415', '36', '111', '8.00', null);
INSERT INTO `score_record` VALUES ('416', '36', '112', '8.00', null);
INSERT INTO `score_record` VALUES ('417', '36', '113', '8.00', null);
INSERT INTO `score_record` VALUES ('418', '36', '114', '8.00', null);
INSERT INTO `score_record` VALUES ('419', '36', '115', '8.00', null);
INSERT INTO `score_record` VALUES ('420', '36', '116', '8.00', null);
INSERT INTO `score_record` VALUES ('421', '36', '117', '8.00', null);
INSERT INTO `score_record` VALUES ('422', '36', '118', '8.00', null);
INSERT INTO `score_record` VALUES ('423', '36', '119', '8.00', null);
INSERT INTO `score_record` VALUES ('424', '36', '120', '8.00', null);
INSERT INTO `score_record` VALUES ('425', '36', '121', '8.00', null);
INSERT INTO `score_record` VALUES ('426', '36', '122', '8.00', null);
INSERT INTO `score_record` VALUES ('427', '36', '123', '8.00', null);
INSERT INTO `score_record` VALUES ('428', '36', '124', '8.00', null);
INSERT INTO `score_record` VALUES ('429', '36', '125', '8.00', null);
INSERT INTO `score_record` VALUES ('430', '36', '126', '8.00', null);
INSERT INTO `score_record` VALUES ('431', '36', '127', '8.00', null);
INSERT INTO `score_record` VALUES ('432', '36', '128', '8.00', null);
INSERT INTO `score_record` VALUES ('433', '36', '129', '8.00', null);
INSERT INTO `score_record` VALUES ('434', '36', '130', '8.00', null);
INSERT INTO `score_record` VALUES ('435', '36', '131', '8.00', null);
INSERT INTO `score_record` VALUES ('436', '36', '132', '8.00', null);
INSERT INTO `score_record` VALUES ('437', '36', '133', '8.00', null);
INSERT INTO `score_record` VALUES ('438', '36', '134', '8.00', null);
INSERT INTO `score_record` VALUES ('439', '36', '135', '8.00', null);
INSERT INTO `score_record` VALUES ('440', '36', '136', '8.00', null);
INSERT INTO `score_record` VALUES ('441', '36', '137', '8.00', null);
INSERT INTO `score_record` VALUES ('442', '36', '138', '8.00', null);
INSERT INTO `score_record` VALUES ('443', '36', '139', '8.00', null);
INSERT INTO `score_record` VALUES ('444', '36', '140', '8.00', null);
INSERT INTO `score_record` VALUES ('445', '36', '141', '8.00', null);
INSERT INTO `score_record` VALUES ('446', '36', '142', '8.00', null);
INSERT INTO `score_record` VALUES ('447', '36', '143', '8.00', null);
INSERT INTO `score_record` VALUES ('448', '36', '144', '8.00', null);
INSERT INTO `score_record` VALUES ('449', '36', '145', '8.00', null);

-- ----------------------------
-- Table structure for `software`
-- ----------------------------
DROP TABLE IF EXISTS `software`;
CREATE TABLE `software` (
  `s_id` int(11) NOT NULL,
  `s_name` varchar(20) DEFAULT NULL,
  `s_ispublished` int(10) DEFAULT NULL,
  `s_finishtime` varchar(30) DEFAULT NULL,
  `s_level` int(11) DEFAULT NULL COMMENT '可移植性',
  `s_ccm` int(11) DEFAULT NULL COMMENT '功能完备性',
  `s_brief` varchar(50) DEFAULT NULL,
  `s_remark` varchar(100) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`s_id`),
  CONSTRAINT `fk21` FOREIGN KEY (`s_id`) REFERENCES `result` (`res_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of software
-- ----------------------------
INSERT INTO `software` VALUES ('12', 'zzzzzzzzzzzz', '0', '2015-01-19', '3', '2', null, 's_remark');
INSERT INTO `software` VALUES ('13', 'cccccccccc', '1', '2015-05-16', '1', '2', 'ccccccccccccccccccccccccccccc', 's_remark');
INSERT INTO `software` VALUES ('29', 'qq', '0', '2016-11-09', '1', '1', 'qqqqq', null);
INSERT INTO `software` VALUES ('31', '????', '0', '2016-11-09', '2', '2', 'h????i???????', null);
INSERT INTO `software` VALUES ('32', '软件基本信息', '1', '2016-12-07', '1', '3', '软件基本信息软件基本信息软件基本信息软件基本信息', null);

-- ----------------------------
-- Table structure for `team`
-- ----------------------------
DROP TABLE IF EXISTS `team`;
CREATE TABLE `team` (
  `team_id` int(11) NOT NULL AUTO_INCREMENT,
  `team_introduction` varchar(100) DEFAULT NULL,
  `cooperation_time` varchar(20) DEFAULT NULL,
  `team_remark` varchar(50) DEFAULT NULL,
  `team_name` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`team_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of team
-- ----------------------------
INSERT INTO `team` VALUES ('1', 'qaaaaaaaaaaaaa', '2006-08-16', 'aaaa', '小毛驴');
INSERT INTO `team` VALUES ('2', 'bbbbbbbb', '2006-08-17', 'bbbbbbbb', '大松树');

-- ----------------------------
-- Table structure for `upload`
-- ----------------------------
DROP TABLE IF EXISTS `upload`;
CREATE TABLE `upload` (
  `upload_id` int(11) NOT NULL AUTO_INCREMENT,
  `upload_name` varchar(1000) DEFAULT NULL,
  `upload_time` varchar(30) DEFAULT NULL,
  `upload_author` varchar(30) DEFAULT NULL,
  `upload_type` varchar(20) DEFAULT NULL COMMENT '用于说明上传用途',
  PRIMARY KEY (`upload_id`)
) ENGINE=InnoDB AUTO_INCREMENT=116 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of upload
-- ----------------------------
INSERT INTO `upload` VALUES ('1', 'e722a8ca-5ab1-4a74-b885-6e3b22d50d6d_配置Tomcat环境变量.txt', '2016-10-21 20:45:22', 'zyx', null);
INSERT INTO `upload` VALUES ('2', 'd53c25e2-36bb-4343-bc96-454d316d9232_Java配置环境变量_筱湮.doc', '2016-10-21 20:45:22', 'zyx', null);
INSERT INTO `upload` VALUES ('3', '6e9c837f-37f4-425b-964a-a6389aa1571f_erwin7.3_keygen.rar', '2016-10-21 20:46:56', 'xhp', null);
INSERT INTO `upload` VALUES ('4', '0197b3b6-9b40-4d58-8e20-559b03e775e4_ERWin7.3注册码.txt', '2016-10-21 20:46:57', 'xhp', null);
INSERT INTO `upload` VALUES ('5', '2c0ea1ca-b3b9-4f98-bed8-f25b6480304e_jdk-8-windows-x64.exe', '2016-10-22 18:57:12', null, null);
INSERT INTO `upload` VALUES ('6', '2d67fa15-1e6d-4a1f-8bda-39ed82c60e9d_ChromeStandalone_54.0.2840.59_Setup.exe', '2016-10-22 20:16:00', 'kjwqgd', null);
INSERT INTO `upload` VALUES ('7', 'c62141bf-5340-4857-9d7f-130c07ea81c8_', '2016-10-22 20:16:01', 'kjwqgd', null);
INSERT INTO `upload` VALUES ('8', 'dc6c4c2f-dacb-498c-a532-67489cbb1f81_ChromeStandalone_54.0.2840.59_Setup.exe', '2016-10-22 20:16:16', 'kjwqgd', null);
INSERT INTO `upload` VALUES ('9', 'fe530d0b-ea25-4029-bf14-8e3cc6dc6af2_[阳光电影-www.ygdy8.com]通往机场的路-02.rmvb', '2016-10-22 20:16:17', 'kjwqgd', null);
INSERT INTO `upload` VALUES ('10', 'c0cdcf2b-c647-4d10-a4be-74a32c54d860_error.jsp', '2016-10-22 23:02:56', 'zyx', null);
INSERT INTO `upload` VALUES ('11', '93bf17ff-6648-4653-afae-c064a0f650e2_message.jsp', '2016-10-22 23:02:56', 'zyx', null);
INSERT INTO `upload` VALUES ('12', 'e62fe7f3-d6c3-47d1-955f-4c7cc83da5a4_第1章 Internet概述.pptx', '2016-10-23 01:10:22', 'zyx', null);
INSERT INTO `upload` VALUES ('13', 'aee36410-924c-400a-89cd-f84137ec0ece_达内C++全套视频试看地址.rar', '2016-10-23 01:10:22', 'zyx', null);
INSERT INTO `upload` VALUES ('14', '361eba50-44a7-4568-b8cd-e6c06a9b58a9_第5章-移动IP.ppt', '2016-10-23 01:12:07', 'zyx', null);
INSERT INTO `upload` VALUES ('15', '7854d55c-0882-4745-85bf-c28afc665ade_第7章 IPv6技术.ppt', '2016-10-23 01:12:34', 'zyx', null);
INSERT INTO `upload` VALUES ('16', 'dc1b88ac-a43d-4cda-b95b-2113e9a9534b_第8章 P2P技术.pptx', '2016-10-23 01:14:02', '111', null);
INSERT INTO `upload` VALUES ('17', 'ea7428f3-512f-4bc9-a371-887e95bba787_第6章 QoS原理与应用.ppt', '2016-10-23 02:39:13', 'resultProvider', null);
INSERT INTO `upload` VALUES ('18', '73b3a18a-a62d-41b7-9e46-e314d13fb1d3_第4章 IP组播.ppt', '2016-10-23 02:45:33', 'resultProvider', null);
INSERT INTO `upload` VALUES ('19', '4646f82a-f98c-49ba-a5d1-8f40e738d983_第7章 IPv6技术.ppt', '2016-10-23 02:47:48', 'resultProvider', null);
INSERT INTO `upload` VALUES ('20', 'ff8c0c92-4bfd-40db-a0e5-08da5cde2141_第9章 Internet在中国.pptx', '2016-10-23 02:49:49', 'resultProvider', null);
INSERT INTO `upload` VALUES ('21', 'da19c0dc-0f52-46f4-93f0-021c368289b9_第8章 P2P技术.pptx', '2016-10-23 02:55:00', 'resultProvider', null);
INSERT INTO `upload` VALUES ('22', '929c3860-0659-4cf2-9650-2eb6aec61102_第2章_Internet基础.pptx', '2016-10-23 02:57:53', 'resultProvider', null);
INSERT INTO `upload` VALUES ('23', 'e2dfdf43-167b-4c23-92a3-b88231bbdedd_第4章 IP组播.ppt', '2016-10-23 03:04:15', 'resultProvider', null);
INSERT INTO `upload` VALUES ('24', '91e12aa6-3f66-4c9c-a146-67f9e03d817f_ERWin7.3注册码.txt', '2016-10-23 03:14:49', 'resultProvider', null);
INSERT INTO `upload` VALUES ('25', 'eea469f7-9eb5-4f3c-a2b2-c69bdb9dedca_', '2016-10-23 03:16:41', 'resultProvider', null);
INSERT INTO `upload` VALUES ('26', '6814942f-9676-4394-a546-377eb38f59ab_UploadMapper.java', '2016-10-24 17:10:09', 'resultProvider', null);
INSERT INTO `upload` VALUES ('27', '22948950-a4c7-47fb-b43e-be0105e727cc_error.jsp', '2016-10-24 17:17:40', 'resultProvider', null);
INSERT INTO `upload` VALUES ('28', '2de2d5d0-7877-48b9-815e-e0c8b9907e6c_TestController.java', '2016-10-24 20:03:24', 'resultProvider', null);
INSERT INTO `upload` VALUES ('29', '6fab0e98-c858-4b4f-ab82-1208cd62c1e7_message.jsp', '2016-10-24 20:06:59', 'resultProvider', null);
INSERT INTO `upload` VALUES ('30', '301d8d2b-2c6b-41a3-befb-d1da8d634a4a_', '2016-10-24 20:13:38', 'resultProvider', null);
INSERT INTO `upload` VALUES ('31', '6ea3aa17-f9b1-481e-8347-2fba24e45055_download.jsp', '2016-10-24 20:38:46', 'resultProvider', null);
INSERT INTO `upload` VALUES ('32', '271daf44-d8d5-425a-b29a-7f21984cf607_项目评估指标.txt', '2016-11-02 15:50:52', 'mx360186017', '用户注册凭证上传');
INSERT INTO `upload` VALUES ('33', '329988c7-e00f-4035-812d-ed25ec6046ef_项目评估指标.txt', '2016-11-02 15:58:57', 'm360186017', '用户注册凭证上传');
INSERT INTO `upload` VALUES ('34', '2c9e68b6-5740-4931-98d7-edf08428ec8b_项目评估指标.txt', '2016-11-02 16:03:21', 'mz360186017', '用户注册凭证上传');
INSERT INTO `upload` VALUES ('35', '7437fc74-7ce7-4d1c-a3c3-b1aefdc4f0ab_register.jsp', '2016-11-02 16:14:11', 'ASDD', '用户注册凭证上传');
INSERT INTO `upload` VALUES ('36', '546972f4-ec80-4658-9fae-710d5aa0fb58_表单验证.txt', '2016-11-02 16:16:27', 'qqqq', '用户注册凭证上传');
INSERT INTO `upload` VALUES ('37', '03f740d5-9764-4c5f-9513-76c25389fca4_TestController.java', '2016-11-02 16:19:54', 'lampard', '用户注册凭证上传');
INSERT INTO `upload` VALUES ('38', 'a1177764-768d-4e43-8b48-821d76eb581a_TestController.java', '2016-11-02 16:24:34', 'qqqqq', '用户注册凭证上传');
INSERT INTO `upload` VALUES ('39', '85b3cfe4-dfcb-43fd-bcd4-d7ddc6258c89_message.jsp', '2016-11-02 16:34:43', 'ghghg', '用户注册凭证上传');
INSERT INTO `upload` VALUES ('40', '054b13f3-c8b3-4923-b6d7-730f91cc1772_TestController.java', '2016-11-02 16:37:39', 'ytryr', '用户注册凭证上传');
INSERT INTO `upload` VALUES ('41', '15fe72d1-a183-439a-9944-f9dff2b11fbf_TestController.java', '2016-11-02 16:39:09', 'rtddy', '用户注册凭证上传');
INSERT INTO `upload` VALUES ('42', 'f0b0c5d1-1d68-4888-be47-624f06179717_error.jsp', '2016-11-02 16:40:42', 'qweqwe', '用户注册凭证上传');
INSERT INTO `upload` VALUES ('43', '6be2f9a7-63bf-40df-b50d-0f57cdd118a7_download.jsp', '2016-11-02 16:42:47', 'tttt', '用户注册凭证上传');
INSERT INTO `upload` VALUES ('44', '56ae84b5-80a3-4268-a124-aea66deb8663_TestController.java', '2016-11-02 16:46:26', 'wocaonidaye', '用户注册凭证上传');
INSERT INTO `upload` VALUES ('45', '569bad8c-b3c0-4d33-884e-b11e9a57657f_TestController.java', '2016-11-02 23:01:27', 'wocdasad', '用户注册凭证上传');
INSERT INTO `upload` VALUES ('46', '3331486f-3b53-4507-b1e8-506dbc24d7a5_', '2016-11-02 23:06:53', 'wangqian123', '用户注册凭证上传');
INSERT INTO `upload` VALUES ('47', '405e18be-7e31-4700-882a-56b93f0a3df0_', '2016-11-02 23:16:29', 'wulianwei', '用户注册凭证上传');
INSERT INTO `upload` VALUES ('48', 'cd83bea4-ee62-45ae-b137-4256f903b22b_饮食习惯.txt', '2016-12-06 23:13:40', 'zzz', null);
INSERT INTO `upload` VALUES ('49', 'f78c4e80-1e85-4e68-b7f8-aade57f48a41_blog-1.jpg', '2016-12-06 23:13:40', 'zzz', null);
INSERT INTO `upload` VALUES ('50', '5c1c1b30-73d0-4f9d-a507-afecb08321e1_error.jsp', '2016-12-08 01:43:44', 'resultProvider', '论文上传');
INSERT INTO `upload` VALUES ('51', 'e3c226ed-c272-490a-bd4c-bd5b314e19ca_Upload.java', '2016-12-08 01:46:58', 'resultProvider', '论文上传');
INSERT INTO `upload` VALUES ('52', '8e77548a-0eff-4e6c-9641-9078dda2fc4b_TestController.java', '2016-12-08 01:47:14', 'resultProvider', '论文上传');
INSERT INTO `upload` VALUES ('53', 'f5612717-1ccf-445b-8b94-3c8e8d6b2c2a_Upload.java', '2016-12-08 02:15:00', 'resultProvider', '论文上传');
INSERT INTO `upload` VALUES ('54', '031e6b05-892d-4b24-8897-77bd61b4356a_Upload.java', '2016-12-08 02:19:59', 'resultProvider', '论文上传');
INSERT INTO `upload` VALUES ('55', '802e0cb8-ad20-4c5e-a530-640d48074dba_Upload.java', '2016-12-08 02:43:03', 'resultProvider', '论文上传');
INSERT INTO `upload` VALUES ('56', 'f1e027e6-8c5f-49bb-9182-ef4a99993872_download.jsp', '2016-12-08 03:28:55', 'resultProvider', '论文上传');
INSERT INTO `upload` VALUES ('57', 'da90f7ec-00e4-4acb-b37b-8344cb0da74a_TestController.java', '2016-12-08 08:19:43', 'resultProvider', '论文上传');
INSERT INTO `upload` VALUES ('58', '101716c1-2159-400d-9161-6a9240d2a15f_message.jsp', '2016-12-08 08:30:03', 'resultProvider', '论文上传');
INSERT INTO `upload` VALUES ('59', '46f3cdd8-49dc-47da-8694-eb8e2eddbe08_error.jsp', '2016-12-08 08:34:12', 'resultProvider', '论文上传');
INSERT INTO `upload` VALUES ('60', '85f1fa27-4439-4341-9e41-0d17f3f28a0a_message.jsp', '2016-12-08 08:40:18', 'resultProvider', '论文上传');
INSERT INTO `upload` VALUES ('61', 'ce1e7ee5-d031-4dbc-998b-671986afc5f3_UploadMapper.xml', '2016-12-08 09:53:59', 'resultProvider', '论文上传');
INSERT INTO `upload` VALUES ('62', '2b989511-a215-4a8b-a8f5-97afb7e992b3_message.jsp', '2016-12-09 22:26:51', 'resultProvider', '专利上传');
INSERT INTO `upload` VALUES ('63', '921eb403-e832-410f-894e-485357fb1fa4_message.jsp', '2016-12-10 20:08:28', 'resultProvider', '软件上传');
INSERT INTO `upload` VALUES ('64', '9e595695-7ca1-441e-9b72-d1598734ae3b_message.jsp', '2016-12-10 20:08:36', 'resultProvider', '软件上传');
INSERT INTO `upload` VALUES ('65', '3e0e0b6d-5e81-4dfd-83f7-8dd74ad6d2e5_TestController.java', '2016-12-10 20:14:19', 'resultProvider', '软件上传');
INSERT INTO `upload` VALUES ('66', 'd8d4a21d-08ff-4293-b7f7-b642d382c644_TestController.java', '2016-12-10 20:18:49', 'resultProvider', '软件上传');
INSERT INTO `upload` VALUES ('67', '871f9cf5-2754-4962-be89-32af49d19490_', '2016-12-11 00:13:06', '12', null);
INSERT INTO `upload` VALUES ('68', '6ae6ba03-77f0-431d-8560-c099d529a1d5_', '2016-12-11 00:17:42', '', null);
INSERT INTO `upload` VALUES ('69', 'e7c6399a-4ad1-4fff-9b05-c3c354db2376_', '2016-12-11 00:21:35', '', null);
INSERT INTO `upload` VALUES ('70', '671b379a-0447-4cc8-98fc-120f88914252_', '2016-12-11 00:24:29', '', null);
INSERT INTO `upload` VALUES ('71', '48537bf3-679e-47a1-80d7-d81bcf0964a7_', '2016-12-11 00:25:35', '', null);
INSERT INTO `upload` VALUES ('72', '700eb5a4-df0b-44b1-84c7-684ce57de338_', '2016-12-11 00:27:11', '', null);
INSERT INTO `upload` VALUES ('73', '4d6c55f0-c9f6-428d-b70a-67613f06d606_', '2016-12-11 00:29:26', '', null);
INSERT INTO `upload` VALUES ('74', 'e70d3162-1fe5-4f97-8b8b-ae55f17ec0ba_avatar.jpg', '2016-12-11 00:30:15', '1231', null);
INSERT INTO `upload` VALUES ('75', '3f41ddc1-e1dc-4831-9d3d-283e7dc42c9b_avatar.jpg', '2016-12-11 00:30:15', '1231', null);
INSERT INTO `upload` VALUES ('76', '17bc813d-19a4-4847-a69e-85258b3eb9b0_2014年SCI-期刊影响因子排名(2015年6月最新发布).xlsx', '2016-12-11 01:01:02', null, null);
INSERT INTO `upload` VALUES ('77', 'e4c6d699-9785-4e2a-ac6b-b919cb0d28f4_1.jpg', '2016-12-11 01:01:02', null, null);
INSERT INTO `upload` VALUES ('78', '475cc1cd-8bf2-48ad-b803-909f9d67eb90_a.htm', '2016-12-11 01:12:23', null, null);
INSERT INTO `upload` VALUES ('79', '7fffb419-6ca4-4cec-8410-b2d3090fa02f_1.jpg', '2016-12-11 01:12:23', null, null);
INSERT INTO `upload` VALUES ('80', '78d7b698-e179-44fd-abef-177b5b0df4da_a.htm', '2016-12-11 01:20:18', null, null);
INSERT INTO `upload` VALUES ('81', '116a5ef4-cfd1-4337-bfce-082113cb8dd6_1.jpg', '2016-12-11 01:20:18', null, null);
INSERT INTO `upload` VALUES ('82', '069837e2-1629-48f5-b0bf-e91ee4317e4b_a.htm', '2016-12-11 01:22:25', null, null);
INSERT INTO `upload` VALUES ('83', '0ec4f980-7410-42c8-9c84-9f0ea182ee69_1.jpg', '2016-12-11 01:22:25', null, null);
INSERT INTO `upload` VALUES ('84', 'a18d05b3-63e6-4c13-b242-7dda54bc77e3_a.htm', '2016-12-11 01:24:12', null, null);
INSERT INTO `upload` VALUES ('85', '8e1207c4-ad45-4437-a124-fc462093b31b_1.jpg', '2016-12-11 01:24:12', null, null);
INSERT INTO `upload` VALUES ('86', 'e8a0662d-b883-4d49-881e-6a1f0b3ad90a_a.htm', '2016-12-11 01:41:20', null, null);
INSERT INTO `upload` VALUES ('87', 'e7f73dc4-971c-42d9-adb3-f7babe6bad6b_1.jpg', '2016-12-11 01:41:20', null, null);
INSERT INTO `upload` VALUES ('88', '9666c195-4140-437a-8881-c7a01c4d22b8_a.htm', '2016-12-11 01:42:59', null, null);
INSERT INTO `upload` VALUES ('89', 'a4482dde-4712-4b68-a440-26a9bb4950d6_1.jpg', '2016-12-11 01:42:59', null, null);
INSERT INTO `upload` VALUES ('90', '02c167bc-ce4f-4719-a5ea-54deafbe7743_a.htm', '2016-12-11 01:53:55', null, null);
INSERT INTO `upload` VALUES ('91', '4392330f-1cae-4acb-b74a-f307ebd9d89e_3a.jpg', '2016-12-11 01:53:55', null, null);
INSERT INTO `upload` VALUES ('92', '2d529a7d-62dc-40b8-9a47-5f0c178f4b5a_a.htm', '2016-12-11 01:54:57', null, null);
INSERT INTO `upload` VALUES ('93', '969319a9-e401-432b-a978-7a99728b819b_3a.jpg', '2016-12-11 01:54:57', null, null);
INSERT INTO `upload` VALUES ('94', '86e3e559-866e-4082-be75-c36bca7021ed_a.htm', '2016-12-11 01:57:58', null, null);
INSERT INTO `upload` VALUES ('95', 'a17f2a00-9c91-4546-8950-bb96034fc988_1.jpg', '2016-12-11 01:57:58', null, null);
INSERT INTO `upload` VALUES ('96', '8c5c12cb-90c6-473d-b855-c19e187e1386_a.htm', '2016-12-11 02:02:41', null, null);
INSERT INTO `upload` VALUES ('97', '0c01789a-4174-4814-826d-6ef5becb2087_1.jpg', '2016-12-11 02:02:41', null, null);
INSERT INTO `upload` VALUES ('98', 'c0b7fb4a-d4cf-4f81-9e01-68449660ca2f_a.htm', '2016-12-11 02:08:38', null, null);
INSERT INTO `upload` VALUES ('99', '8eeb5be9-d5b8-4b0c-b4b2-c9ec6eaa8bfc_3a.jpg', '2016-12-11 02:08:38', null, null);
INSERT INTO `upload` VALUES ('100', '18acb711-7eef-496b-8ab9-1a69997f5f47_a.htm', '2016-12-11 02:20:52', null, null);
INSERT INTO `upload` VALUES ('101', '9c131a8c-7033-4dfc-ac84-bc9560ecc1bb_1.jpg', '2016-12-11 02:20:52', null, null);
INSERT INTO `upload` VALUES ('102', '9fdf871f-c183-4185-a186-09d1ff189c26_a.htm', '2016-12-11 18:56:37', 'resultProvider', '论文上传');
INSERT INTO `upload` VALUES ('103', '55fc1bc9-480e-42f2-af41-c0ba3ec4fb44_隔壁宿舍wifi密码.txt', '2016-12-11 19:14:57', null, null);
INSERT INTO `upload` VALUES ('104', 'e09e438c-daaf-4e7a-9a9f-ff4740c41618_client-5.png', '2016-12-11 19:14:57', null, null);
INSERT INTO `upload` VALUES ('105', '0ee08940-14a5-4672-ab8a-7228804b5b14_client-1.png', '2016-12-11 19:37:21', null, null);
INSERT INTO `upload` VALUES ('106', 'e443fe75-ee53-483e-8d38-81228c36ae95_client-5.png', '2016-12-11 19:37:21', null, null);
INSERT INTO `upload` VALUES ('107', '967583f9-adf1-4e2b-9e27-6e8ea8182e88_register.html', '2016-12-11 20:41:51', 'resultProvider', '论文上传');
INSERT INTO `upload` VALUES ('108', 'f9463579-b23b-4e16-a48b-e1fdac7581ac_EditFlagTask.java', '2016-12-12 13:06:13', 'resultProvider', '论文上传');
INSERT INTO `upload` VALUES ('109', 'eafb9b9f-0e84-48ba-a8fe-f5fa52a448c9_blog-sidebar.jpg', '2016-12-12 13:34:19', null, null);
INSERT INTO `upload` VALUES ('110', 'e8620202-8fdc-44fd-84f8-f1514d0c5c09_client-4.png', '2016-12-12 13:34:19', null, null);
INSERT INTO `upload` VALUES ('111', '974a473c-5ce8-4968-a41c-b58a5eba832b_Da.zip', '2016-12-14 17:28:34', 'projectFile', '项目文件上传');
INSERT INTO `upload` VALUES ('112', '88c25874-cd1c-4371-a5cb-c63703573bc6_logo_blue.png', '2016-12-14 17:37:55', 'projectFile', '项目文件上传');
INSERT INTO `upload` VALUES ('113', '7c408df3-419a-498f-a7fa-4071f00515e5_avatar.jpg', '2016-12-14 17:42:47', 'projectFile', '项目文件上传');
INSERT INTO `upload` VALUES ('114', '90f4690e-af31-46bf-9e2e-3830ccaf3906_blog-sidebar.jpg', '2016-12-15 15:29:33', 'projectFile', '项目文件上传');
INSERT INTO `upload` VALUES ('115', '840ff266-3271-4374-855f-a49926c506cd_blog-sidebar.jpg', '2016-12-15 15:34:33', 'resultProvider', '论文上传');

-- ----------------------------
-- Table structure for `user`
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(20) DEFAULT NULL,
  `user_pwd` varchar(20) DEFAULT NULL,
  `user_realname` varchar(20) DEFAULT NULL,
  `user_type` int(4) DEFAULT NULL,
  `user_age` int(10) DEFAULT NULL,
  `user_gender` int(10) DEFAULT NULL,
  `user_edu` int(10) DEFAULT NULL,
  `user_email` varchar(30) DEFAULT NULL,
  `user_remark` varchar(30) DEFAULT NULL,
  `user_flag` int(11) DEFAULT '0' COMMENT '用户注册是否成功',
  `user_url` int(11) DEFAULT NULL COMMENT '用户资历凭证',
  PRIMARY KEY (`user_id`),
  KEY `fk26` (`user_gender`),
  KEY `fk25` (`user_edu`),
  KEY `fk24` (`user_type`),
  KEY `fk29` (`user_url`),
  CONSTRAINT `fk29` FOREIGN KEY (`user_url`) REFERENCES `upload` (`upload_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', '111', '111', '张玉筱', '1', '22', '2', '2', '360186017@qq.com', '我是软件工程专业', '0', null);
INSERT INTO `user` VALUES ('2', '222', '222', '张玉筱', '1', '22', '2', '2', '360186017@qq.com', '我是软件工程专业', '0', null);
INSERT INTO `user` VALUES ('3', '33333333333333', '333333333333', '张玉筱', '1', '22', '2', '2', '360186017@qq.com', '我是软件工程专业', '0', null);
INSERT INTO `user` VALUES ('4', 'zyx', 'zyx', '张玉筱', '1', '22', '2', '2', '360186017@qq.com', '我是软件工程专业', '0', '32');
INSERT INTO `user` VALUES ('5', 'mx360186017', '1983119', '张玉筱', '1', '22', '2', '2', '1232432545@qq.com', '我是软件工程专业', '0', '33');
INSERT INTO `user` VALUES ('6', 'mz360186017', '1983119', '张玉筱', '1', '22', '2', '2', '232432545@qq.com', '我是软件工程专业', '0', '34');
INSERT INTO `user` VALUES ('7', 'ASDD', '123456', 'ASDD', '1', '23', '1', '2', '232432515@qq.com', 'ASD', '0', '35');
INSERT INTO `user` VALUES ('8', 'qqqq', '123456', 'qqqq', '1', '23', '1', '1', '2324325315@qq.com', 'asdasd', '0', '36');
INSERT INTO `user` VALUES ('9', 'lampard', '123456', 'haoge', '1', '12', '1', '1', '2522475020@qq.com', '12321312', '0', '37');
INSERT INTO `user` VALUES ('10', 'qqqqq', '123456', 'qqqqq', '1', '123456', '1', '1', '2323232@qq.com', '123', '0', '38');
INSERT INTO `user` VALUES ('11', 'ghghg', '123456', 'ghghg', '1', '12', '1', '2', 'gh2423423434h@qq.com', 'csdsdsdfsdfsdf', '0', '39');
INSERT INTO `user` VALUES ('12', 'ytryr', '123456', 'fgg', '1', '123', '1', '1', 'fghfg@qq.com', '12312312312', '0', '40');
INSERT INTO `user` VALUES ('13', 'rtddy', '111111', 'dtyrty', '1', '12', '1', '1', 'sfdafa@qq.com', '123', '0', '41');
INSERT INTO `user` VALUES ('14', 'qweqwe', '111111', 'qweqwe', '1', '12', '2', '2', 'qweqwe@qq.com', '123456', '0', '42');
INSERT INTO `user` VALUES ('15', 'tttt', '111111', 'asd                 ', '0', '12', '2', '4', 'qweqweqweqwe@qq.com', 'qwlwq2222222233333', '0', '43');
INSERT INTO `user` VALUES ('17', 'wocdasad', '123123', '1111', '1', '12', '1', '1', '111222@qq.com', '123', '0', '45');
INSERT INTO `user` VALUES ('18', 'wangqian123', '123456', 'wangqian', '0', '22', '2', '2', '235654664@qq.com', 'aeffrr', '0', '46');
INSERT INTO `user` VALUES ('19', 'wulianwei', '121212', 'wulianwei', '0', '23', '1', '1', 'wulianwei@xjtu.edu.cn', 'saff', '0', '47');
