/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50090
Source Host           : localhost:3306
Source Database       : onlinetext

Target Server Type    : MYSQL
Target Server Version : 50090
File Encoding         : 65001

Date: 2016-06-13 20:37:15
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for ot_answer
-- ----------------------------
DROP TABLE IF EXISTS `ot_answer`;
CREATE TABLE `ot_answer` (
  `ans_id` int(12) NOT NULL auto_increment COMMENT '系统自增',
  `ans_numb` int(12) default NULL COMMENT '编号',
  `ans_ques` text COMMENT '问题',
  `ans_answ` text COMMENT '答案',
  `sub_id` int(4) default NULL COMMENT '课程号',
  `tea_id` int(12) default NULL COMMENT '教师号',
  `ans_righ` int(12) default NULL COMMENT '正确数',
  `ans_all` int(12) default NULL COMMENT '答题数',
  `ans_sign` tinyint(1) default NULL COMMENT '删除标记 0-删除,1-存在',
  `ans_time` date default NULL COMMENT '录入时间',
  PRIMARY KEY  (`ans_id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ot_answer
-- ----------------------------
INSERT INTO `ot_answer` VALUES ('1', '1', 'At that moment, few people ___________ the danger ahead', 'were aware of\r\n', '2', '1', '0', '0', '0', '2016-05-26');
INSERT INTO `ot_answer` VALUES ('2', '1', 'At that moment, few people ___________ the danger ahead', 'were aware of\r\n', '2', '1', '0', '0', '1', '2016-05-26');
INSERT INTO `ot_answer` VALUES ('3', '2', 'When the ticket collector（查票员）asked him to show his ticket, he pretended to _______ it', 'Time is urgent. We must finish the work today _________.\r\n', '2', '1', '0', '0', '0', '2016-05-26');
INSERT INTO `ot_answer` VALUES ('4', '3', 'It is this picture ________ I want to show you. ', 'It is this picture ________ I want to show you. \r\n', '2', '1', '0', '0', '0', '2016-05-26');
INSERT INTO `ot_answer` VALUES ('5', '4', 'How can she lead a full and happy life if she feels we blame her _______ her sister‘s death', 'How can she lead a full and happy life if she feels we blame her _______ her sister‘s death\r\n', '2', '1', '0', '0', '1', '2016-05-26');
INSERT INTO `ot_answer` VALUES ('6', '4', 'td{word-break: break-all; }', 'td{word-break: break-all; }', '2', '1', '0', '0', '0', '2016-05-26');

-- ----------------------------
-- Table structure for ot_arrangement
-- ----------------------------
DROP TABLE IF EXISTS `ot_arrangement`;
CREATE TABLE `ot_arrangement` (
  `arr_id` int(12) NOT NULL auto_increment COMMENT '系统自增',
  `sub_id` int(4) unsigned zerofill default NULL COMMENT '课程号',
  `cla_id` int(6) unsigned zerofill default NULL COMMENT '班号',
  `dir_id` tinyint(2) unsigned zerofill default NULL COMMENT '方向',
  `tea_id` int(12) default NULL COMMENT '教师号',
  `arr_sign` tinyint(1) default NULL COMMENT '删除标记 0-删除,1-存在',
  `arr_time` date default NULL COMMENT '录入时间',
  PRIMARY KEY  (`arr_id`)
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ot_arrangement
-- ----------------------------
INSERT INTO `ot_arrangement` VALUES ('1', '0002', '000005', null, '1', '0', '2016-05-16');
INSERT INTO `ot_arrangement` VALUES ('2', '0003', '000001', null, '1', '0', '2016-05-16');
INSERT INTO `ot_arrangement` VALUES ('3', '0003', '000001', null, '1', '1', '2016-05-16');
INSERT INTO `ot_arrangement` VALUES ('4', '0004', '000001', null, '1', '0', '2016-05-16');
INSERT INTO `ot_arrangement` VALUES ('5', '0005', '000001', null, '1', '0', '2016-05-16');
INSERT INTO `ot_arrangement` VALUES ('6', '0003', '000001', null, '1', '1', '2016-05-16');
INSERT INTO `ot_arrangement` VALUES ('7', '0001', '000001', null, '1', '1', '2016-05-16');
INSERT INTO `ot_arrangement` VALUES ('8', '0001', '000001', null, '2', '1', '2016-05-16');
INSERT INTO `ot_arrangement` VALUES ('9', '0003', '000002', null, '2', '0', '2016-05-16');
INSERT INTO `ot_arrangement` VALUES ('10', '0001', '000001', null, '1', '0', '2016-05-16');
INSERT INTO `ot_arrangement` VALUES ('11', '0004', '000002', null, '3', '0', '2016-05-16');
INSERT INTO `ot_arrangement` VALUES ('12', '0003', '000003', null, '1', '0', '2016-05-16');
INSERT INTO `ot_arrangement` VALUES ('13', '0002', '000003', null, '1', '1', '2016-05-16');
INSERT INTO `ot_arrangement` VALUES ('14', '0002', '000001', null, '1', '0', '2016-05-20');

-- ----------------------------
-- Table structure for ot_classs
-- ----------------------------
DROP TABLE IF EXISTS `ot_classs`;
CREATE TABLE `ot_classs` (
  `cla_id` int(6) NOT NULL auto_increment COMMENT '系统自增',
  `maj_id` int(4) unsigned zerofill default NULL COMMENT '专业号-自增',
  `cla_numb` tinyint(2) unsigned zerofill default NULL COMMENT '班级号',
  `cla_name` varchar(20) default NULL COMMENT '名称',
  `cla_sign` tinyint(1) default NULL COMMENT '删除标记 0-删除,1-存在',
  `cla_time` date default NULL COMMENT '录入时间',
  PRIMARY KEY  (`cla_id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ot_classs
-- ----------------------------
INSERT INTO `ot_classs` VALUES ('1', '0001', '01', '计信系计科1班', '0', '2016-05-16');
INSERT INTO `ot_classs` VALUES ('2', '0001', '02', '计信系计科2班', '0', '2016-05-16');
INSERT INTO `ot_classs` VALUES ('3', '0002', '01', '计信系电信1班', '0', '2016-05-16');
INSERT INTO `ot_classs` VALUES ('4', '0003', '01', '财经系会财1班', '0', '2016-05-16');
INSERT INTO `ot_classs` VALUES ('5', '0004', '01', '思政系会计1班', '0', '2016-05-16');
INSERT INTO `ot_classs` VALUES ('6', '0005', '01', '文传系新闻1班', '1', '2016-05-16');

-- ----------------------------
-- Table structure for ot_cloze
-- ----------------------------
DROP TABLE IF EXISTS `ot_cloze`;
CREATE TABLE `ot_cloze` (
  `clo_id` int(12) NOT NULL auto_increment COMMENT '系统自增',
  `clo_numb` int(12) default NULL COMMENT '编号',
  `clo_ques` text COMMENT '问题',
  `clo_ansa` varchar(100) default NULL COMMENT '答案',
  `clo_ansb` varchar(100) default NULL COMMENT '答案(备用)',
  `clo_ansc` varchar(100) default NULL COMMENT '答案(备用)',
  `sub_id` int(4) default NULL COMMENT '课程号',
  `tea_id` int(12) default NULL COMMENT '教师号',
  `clo_righ` int(12) default NULL COMMENT '正确数',
  `clo_all` int(12) default NULL COMMENT '答题数',
  `clo_sign` tinyint(1) default NULL COMMENT '删除标记 0-删除,1-存在',
  `clo_time` date default NULL COMMENT '录入时间',
  PRIMARY KEY  (`clo_id`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ot_cloze
-- ----------------------------
INSERT INTO `ot_cloze` VALUES ('1', '1', 'Do you know what he did all day? He spent as much time playing as he ______', 'did studying', 'A', ' ', '2', '1', '0', '1', '0', '2016-05-26');
INSERT INTO `ot_cloze` VALUES ('2', '2', ' I can’t say ______I want to see him again. We haven’t seen each other for a long time', 'how much', 'A', ' ', '2', '1', '0', '2', '0', '2016-05-26');
INSERT INTO `ot_cloze` VALUES ('3', '3', 'It is said that land animals ______ from sea animals', 'developed', 'A', ' ', '2', '1', '0', '1', '0', '2016-05-26');
INSERT INTO `ot_cloze` VALUES ('4', '4', 'Would you like some coffee? Yes, and please get me some milk, too. I prefer coffee ______milk.', 'with', 'A', ' ', '2', '1', '0', '1', '0', '2016-05-26');
INSERT INTO `ot_cloze` VALUES ('5', '5', ' ______ made his teacher unhappy', 'tom\'s coming late', 'A', ' ', '2', '1', '0', '1', '0', '2016-05-26');
INSERT INTO `ot_cloze` VALUES ('6', '6', ' Father asked Edison ________.', 'A', 'what he was doing that for', ' ', '2', '1', '0', '1', '0', '2016-05-26');
INSERT INTO `ot_cloze` VALUES ('7', '7', 'We are going to have the sports meeting _____it _______tomorrow.', 'unless,rains', 'A', ' ', '2', '1', '2', '3', '0', '2016-05-26');
INSERT INTO `ot_cloze` VALUES ('8', '8', ' ______ of the students in our class _______ from the country.', 'Three fifths,are', 'A', ' ', '2', '1', '0', '1', '0', '2016-05-26');
INSERT INTO `ot_cloze` VALUES ('9', '9', 'News can _____every corner of the world with the help of the Internet.', 'Three fifths,are', ' ', ' ', '2', '1', '0', '1', '0', '2016-05-26');

-- ----------------------------
-- Table structure for ot_data
-- ----------------------------
DROP TABLE IF EXISTS `ot_data`;
CREATE TABLE `ot_data` (
  `dat_id` int(12) NOT NULL auto_increment COMMENT '系统自增',
  `dat_numb` int(8) unsigned zerofill default NULL COMMENT '资料号',
  `sub_id` int(4) unsigned zerofill default NULL COMMENT '课程号',
  `dat_name` varchar(12) default NULL COMMENT '名称',
  `dat_url` varchar(30) default NULL COMMENT '地址',
  `tea_id` int(12) default NULL COMMENT '教师号',
  `dat_sign` tinyint(1) default NULL COMMENT '删除标记 0-删除,1-存在',
  `dat_time` date default NULL COMMENT '录入时间',
  PRIMARY KEY  (`dat_id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ot_data
-- ----------------------------
INSERT INTO `ot_data` VALUES ('1', '00000001', '0001', '123', '', '1', '0', '2016-05-16');
INSERT INTO `ot_data` VALUES ('2', '00000002', '0001', '1234', null, '1', '0', '2016-05-16');
INSERT INTO `ot_data` VALUES ('3', '00000003', '0001', '12345', null, '1', '0', '2016-05-16');
INSERT INTO `ot_data` VALUES ('4', '00000004', '0001', '123456', null, '1', '0', '2016-05-16');
INSERT INTO `ot_data` VALUES ('5', '00000001', '0002', '123', null, '1', '0', '2016-05-16');
INSERT INTO `ot_data` VALUES ('6', '00000001', '0003', '123', null, '1', '0', '2016-05-16');
INSERT INTO `ot_data` VALUES ('7', '00000122', '0002', '123111', '573b279b7d3d8.doc', '1', '0', '2016-05-17');
INSERT INTO `ot_data` VALUES ('8', '00000033', '0002', '123', '573b2911a8ecc.doc', '1', '0', '2016-05-17');
INSERT INTO `ot_data` VALUES ('9', '00000012', '0002', '123', '123.doc', '1', '0', '2016-05-17');
INSERT INTO `ot_data` VALUES ('10', '00000011', '0002', '12345', '12345.doc', '1', '0', '2016-05-19');

-- ----------------------------
-- Table structure for ot_direction
-- ----------------------------
DROP TABLE IF EXISTS `ot_direction`;
CREATE TABLE `ot_direction` (
  `dir_id` tinyint(2) NOT NULL auto_increment COMMENT '系统自增',
  `dir_numb` tinyint(2) default NULL COMMENT '方向号',
  `dir_name` varchar(12) default NULL COMMENT '名称',
  `dir_sign` tinyint(1) default NULL COMMENT '删除标记 0-删除,1-存在',
  `dir_time` date default NULL COMMENT '录入时间',
  PRIMARY KEY  (`dir_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ot_direction
-- ----------------------------

-- ----------------------------
-- Table structure for ot_faculty
-- ----------------------------
DROP TABLE IF EXISTS `ot_faculty`;
CREATE TABLE `ot_faculty` (
  `fac_id` tinyint(2) NOT NULL auto_increment COMMENT '系统自增',
  `fac_numb` tinyint(2) unsigned zerofill default NULL COMMENT '院系号',
  `fac_name` varchar(12) default NULL COMMENT '名称',
  `fac_sign` tinyint(1) default NULL COMMENT '删除标记 0-删除,1-存在',
  `fac_time` date default NULL COMMENT '录入时间',
  PRIMARY KEY  (`fac_id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ot_faculty
-- ----------------------------
INSERT INTO `ot_faculty` VALUES ('1', '01', '计信', '0', '2016-05-16');
INSERT INTO `ot_faculty` VALUES ('2', '02', '财经', '0', '2016-05-16');
INSERT INTO `ot_faculty` VALUES ('3', '03', '思政', '0', '2016-05-16');
INSERT INTO `ot_faculty` VALUES ('4', '04', '文传', '0', '2016-05-16');
INSERT INTO `ot_faculty` VALUES ('5', '05', '金贸', '0', '2016-05-16');

-- ----------------------------
-- Table structure for ot_grade
-- ----------------------------
DROP TABLE IF EXISTS `ot_grade`;
CREATE TABLE `ot_grade` (
  `gra_id` int(12) NOT NULL auto_increment COMMENT '系统自增',
  `gra_numb` int(12) default NULL COMMENT '成绩号',
  `gra_answ` text COMMENT '简答题学生答案',
  `gra_grac` float(5,2) default NULL COMMENT '成绩-系统给分',
  `gra_graa` float(5,2) default NULL COMMENT '成绩-老师给分-简答题',
  `gra_siga` tinyint(1) default NULL COMMENT '打分标记-简答题',
  `pap_id` int(12) default NULL COMMENT '试卷号',
  `stu_id` int(12) default NULL COMMENT '学生号',
  `sub_id` int(4) default NULL COMMENT '课程号',
  `gra_sign` tinyint(1) default NULL COMMENT '删除标记 0-删除 1-存在',
  `gra_time` date default NULL COMMENT '录入时间',
  PRIMARY KEY  (`gra_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ot_grade
-- ----------------------------
INSERT INTO `ot_grade` VALUES ('1', null, 'a:4:{i:1;a:3:{s:4:\"ques\";s:63:\"At that moment, few people ___________ the danger ahead\";s:4:\"answ\";s:15:\"were aware of\r\n\";s:4:\"resu\";s:0:\"\";}i:2;a:3:{s:4:\"ques\";s:109:\"When the ticket collector（查票员）asked him to show his ticket, he pretended to _______ it\";s:4:\"answ\";s:67:\"Time is urgent. We must finish the work today _________.\r\n\";s:4:\"resu\";s:0:\"\";}i:3;a:3:{s:4:\"ques\";s:58:\"It is this picture ________ I want to show you. \";s:4:\"answ\";s:60:\"It is this picture ________ I want to show you. \r\n\";s:4:\"resu\";s:0:\"\";}s:4:\"scor\";i:30;}', '28.00', '20.00', '1', '1', '1', null, '0', '2016-05-26');
INSERT INTO `ot_grade` VALUES ('2', null, 'a:2:{i:1;a:3:{s:4:\"ques\";s:63:\"At that moment, few people ___________ the danger ahead\";s:4:\"answ\";s:15:\"were aware of\r\n\";s:4:\"resu\";s:6:\"132323\";}s:4:\"scor\";i:0;}', '2.00', '0.00', '0', '3', '1', null, '0', '2016-05-26');

-- ----------------------------
-- Table structure for ot_judge
-- ----------------------------
DROP TABLE IF EXISTS `ot_judge`;
CREATE TABLE `ot_judge` (
  `jud_id` int(12) NOT NULL auto_increment COMMENT '系统自增',
  `jud_numb` int(12) default NULL COMMENT '编号',
  `jud_ques` text COMMENT '问题',
  `jud_answ` tinyint(1) default NULL COMMENT '0-错,1-对',
  `sub_id` int(4) default NULL COMMENT '课程号',
  `tea_id` int(12) default NULL COMMENT '教师号',
  `jud_righ` int(12) default NULL COMMENT '正确数',
  `jud_all` int(12) default NULL COMMENT '答题数',
  `jud_sign` tinyint(1) default NULL COMMENT '删除标记 0-删除,1-存在',
  `jud_time` date default NULL COMMENT '录入时间',
  PRIMARY KEY  (`jud_id`)
) ENGINE=MyISAM AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ot_judge
-- ----------------------------
INSERT INTO `ot_judge` VALUES ('1', '1', 'George is a very smart boy; he is one of the best student in his class.  ', '0', '2', '1', '0', '0', '0', '2016-05-20');
INSERT INTO `ot_judge` VALUES ('2', '2', 'ohn was so comfortable and warm in bed that he didn’t want to get up', '1', '2', '1', '0', '0', '0', '2016-05-20');
INSERT INTO `ot_judge` VALUES ('3', '3', 'The boy said that he wanted to be a computer scientist when he grew up', '1', '2', '1', '0', '0', '0', '2016-05-20');
INSERT INTO `ot_judge` VALUES ('4', '4', 'In additionally, I have something else to do this weekend ', '0', '2', '1', '0', '0', '0', '2016-05-20');
INSERT INTO `ot_judge` VALUES ('5', '5', 'They looked upon their math teacher  as their best friend.  ', '0', '2', '1', '0', '0', '0', '2016-05-20');
INSERT INTO `ot_judge` VALUES ('6', '6', 'My finger was injured when I tried to collect the broken glass by hand.', '1', '2', '1', '0', '0', '0', '2016-05-20');
INSERT INTO `ot_judge` VALUES ('7', '7', 'I don‘t think quarrels will ever lead to any good results. ', '1', '2', '1', '0', '0', '0', '2016-05-20');
INSERT INTO `ot_judge` VALUES ('8', '8', 'Wanted very much to read himself, Louis decided to create a better way of reading for the blind', '0', '2', '1', '0', '0', '0', '2016-05-20');
INSERT INTO `ot_judge` VALUES ('9', '9', 'It is fitting that October 1, the birthday of the People’s Republic of China,is picked up as the National Day', '1', '2', '1', '0', '0', '0', '2016-05-20');
INSERT INTO `ot_judge` VALUES ('10', '10', 'He is leaving for Beijing tomorrow morning.  ', '1', '2', '1', '0', '0', '0', '2016-05-20');
INSERT INTO `ot_judge` VALUES ('11', '11', 'He called out to the waiter, “Please bring me a cup water to drink.“', '0', '2', '1', '0', '0', '0', '2016-05-26');
INSERT INTO `ot_judge` VALUES ('12', '12', 'Five hours of sleep are not enough.', '0', '2', '1', '0', '0', '0', '2016-05-26');
INSERT INTO `ot_judge` VALUES ('13', '13', 'He survived the fire but has some serious burn injuries. ', '0', '2', '1', '0', '0', '0', '2016-05-26');
INSERT INTO `ot_judge` VALUES ('14', '14', 'A group of young people raced by on their bikes. One or two of them even showed off their skills by riding on only one wheel.', '1', '2', '1', '0', '0', '0', '2016-05-26');
INSERT INTO `ot_judge` VALUES ('15', '15', '“I‘m the least experienced of all the doctors here“ can be translated into“我是这里经验不足的医生之一。”', '0', '2', '1', '0', '0', '0', '2016-05-26');
INSERT INTO `ot_judge` VALUES ('16', '16', 'You must go early or you won‘t get a seat.', '1', '2', '1', '0', '0', '0', '2016-05-26');
INSERT INTO `ot_judge` VALUES ('17', '17', 'Obviously we aren‘t trying to put you away learning English.', '1', '2', '1', '0', '0', '0', '2016-05-26');
INSERT INTO `ot_judge` VALUES ('18', '18', 'How well you learn something, not how fast you learn it, is the critical factor in remembering ', '1', '2', '1', '0', '0', '0', '2016-05-26');
INSERT INTO `ot_judge` VALUES ('19', '19', 'Successful language learners are independent, active and purposive. ', '1', '2', '1', '0', '0', '0', '2016-05-26');
INSERT INTO `ot_judge` VALUES ('20', '20', 'You don‘t need to go any farther. The post office is near there. ', '1', '2', '1', '0', '0', '0', '2016-05-26');

-- ----------------------------
-- Table structure for ot_major
-- ----------------------------
DROP TABLE IF EXISTS `ot_major`;
CREATE TABLE `ot_major` (
  `maj_id` int(4) NOT NULL auto_increment COMMENT '系统自增',
  `fac_id` tinyint(2) unsigned zerofill default NULL COMMENT '院系号-自增',
  `maj_numb` tinyint(2) unsigned zerofill default NULL COMMENT '专业号',
  `maj_name` varchar(12) default NULL COMMENT '名称',
  `maj_sign` tinyint(1) default NULL COMMENT '删除标记 0-删除,1-存在',
  `maj_time` date default NULL COMMENT '录入时间',
  PRIMARY KEY  (`maj_id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ot_major
-- ----------------------------
INSERT INTO `ot_major` VALUES ('1', '01', '01', '计科', '0', '2016-05-16');
INSERT INTO `ot_major` VALUES ('2', '01', '02', '电信', '0', '2016-05-16');
INSERT INTO `ot_major` VALUES ('3', '02', '01', '会财', '0', '2016-05-16');
INSERT INTO `ot_major` VALUES ('4', '03', '01', '会计', '0', '2016-05-16');
INSERT INTO `ot_major` VALUES ('5', '04', '01', '新闻', '0', '2016-05-16');
INSERT INTO `ot_major` VALUES ('6', '05', '01', '保险', '0', '2016-05-16');

-- ----------------------------
-- Table structure for ot_multiple
-- ----------------------------
DROP TABLE IF EXISTS `ot_multiple`;
CREATE TABLE `ot_multiple` (
  `mul_id` int(12) NOT NULL auto_increment COMMENT '系统自增',
  `mul_numb` int(12) default NULL COMMENT '编号',
  `mul_ques` text COMMENT '问题',
  `mul_opta` varchar(100) default NULL COMMENT '选项a',
  `mul_optb` varchar(100) default NULL COMMENT '选项b',
  `mul_optc` varchar(100) default NULL COMMENT '选项c',
  `mul_optd` varchar(100) default NULL COMMENT '选项d',
  `mul_opte` varchar(100) default NULL COMMENT '选项e',
  `mul_optf` varchar(100) default NULL COMMENT '选项f',
  `mul_optg` varchar(100) default NULL COMMENT '选项g',
  `mul_opth` varchar(100) default NULL COMMENT '选项h',
  `mul_answ` varchar(8) default NULL COMMENT '答案',
  `sub_id` int(4) default NULL COMMENT '课程号',
  `tea_id` int(12) default NULL COMMENT '教师号',
  `mul_righ` int(12) default NULL COMMENT '正确数',
  `mul_all` int(12) default NULL COMMENT '答题数',
  `mul_sign` tinyint(1) default NULL COMMENT '删除标记 0-删除,1-存在',
  `mul_time` date default NULL COMMENT '录入时机',
  PRIMARY KEY  (`mul_id`)
) ENGINE=MyISAM AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ot_multiple
-- ----------------------------
INSERT INTO `ot_multiple` VALUES ('1', '1', 'How did the author of A Transition Point in My Life manage his college life?', 'Set a study program', ' Buy some interesting books', 'Decide when to go to bed', 'Go to class on time', 'Go to class', 'Decide when to go ', 'study program', 'when to go to bed', 'ABD', '2', '1', '0', '0', '0', '2016-05-19');
INSERT INTO `ot_multiple` VALUES ('2', '2', 'What mistakes did the writer of A Transition Point in My Life make at first? ', 'Taking his courses improperly.  ', 'Using his time improperly', 'Staying in the dorm all day   ', ' Spending too much time making friends.', 'Taking his', 'Using his time', 'Spending', 'Staying in the dorm', 'BD', '2', '1', '0', '0', '0', '2016-05-19');
INSERT INTO `ot_multiple` VALUES ('3', '3', 'What does Alexis Walton plan to do after his graduation after high school?', 'Go to college. ', 'Pursue higher learning', 'Begin a career', 'Make history in his family  ', 'Make history ', 'Begin', 'Pursue', 'college. ', 'ABCD', '2', '1', '0', '0', '0', '2016-05-19');
INSERT INTO `ot_multiple` VALUES ('4', '4', 'Devlin‘s Advice is written for the students _____________ ', 'who have just finished their high school education  ', 'who have finished their college education', 'who have just entered college  ', 'who were the freshmen in colleges  ', 'who were the freshmen', 'who have just', 'who have finished', 'who have', 'CD', '2', '1', '0', '0', '0', '2016-05-19');
INSERT INTO `ot_multiple` VALUES ('5', '5', 'Devlin‘s advice includes the pieces of _____________. ', 'being successful  ', 'enjoying your college life ', 'working hard at the subjects you don‘t like', 'taking college as the pre-life', 'taking college', 'working hard', 'enjoying your', 'successful', 'AD', '2', '1', '0', '0', '0', '2016-05-19');
INSERT INTO `ot_multiple` VALUES ('6', '6', 'Braille was blind ________________.', ' because he was born so ', 'because his father injured his eyes by accident ', 'because his father injured his eyes', 'because he', 'because his', 'because he', 'because he himself injured one of his eyes accidentally when he was three', 'because his good eye was infected and lost its sight ', 'GH', '2', '1', '0', '0', '0', '2016-05-19');
INSERT INTO `ot_multiple` VALUES ('7', '7', 'How did Braille think about Charles Barbier‘s alphabet code? ', 'Complicated', 'The dashes took up much space ', 'Useless ', 'Student', 'The dashe', 'because his good ', 'Slow to read', '  ', 'ABG', '2', '1', '0', '0', '0', '2016-05-20');
INSERT INTO `ot_multiple` VALUES ('8', '8', 'According to Michael William, tomatoes were first found _______________', ' in North America', 'in Central America ', 'America', 'growing wild in Peru ', 'growing', 'in South', 'America ', ' in North', 'D', '2', '1', '0', '0', '0', '2016-05-20');
INSERT INTO `ot_multiple` VALUES ('9', '9', 'Which of the following statement is true?', 'A woman got fainted when biting a tomato. ', ' The courthouse tried the case whether tomatoes could be eaten  ', 'Today‘s tomatoes are massively consumed at tables.', 'Robert Johnson corrected the people‘s false attitude toward tomatoes.', 'Today‘s tomatoes ar', 'Robert', 'Today‘', 'A woman ', 'CD', '2', '1', '0', '0', '0', '2016-05-20');
INSERT INTO `ot_multiple` VALUES ('10', '10', 'Flyer II was better than The Wright Flyer in that _____________. ', 'it had a stronger body ', 'its engine was more powerful  ', 'a stronger body ', 'was more powerful  ', 'powerful  ', 'more easily  ', 'it could change directions more easily  ', 'it could stay longer in the air', 'ABG', '2', '1', '0', '0', '0', '2016-05-20');
INSERT INTO `ot_multiple` VALUES ('11', '11', 'In the jail cell, Antoine de Saint-Exuppery ___________', ' thought he would be executed the next day', 'felt nervous and upset', 'fumbled for a cigarette in his pocket ', 'asked the jailer if he had a light ', 'asked the', 'fumbled for', ' ', ' ', 'ABCD', '2', '1', '0', '0', '0', '2016-05-26');
INSERT INTO `ot_multiple` VALUES ('12', '12', 'Both the jailor and Antoine de Saint-Exuppery ______________ ', 'Both the ', 'had tears in their eyes when talking about their kids ', 'loved their kids deeply', 'loved thei', 'r kids de', 'escaped from the jail ', 'escaped f', 'their ', 'AF', '2', '1', '0', '0', '0', '2016-05-26');
INSERT INTO `ot_multiple` VALUES ('13', '13', 'In  Blameless, Jane‘s family was quite different from Kathy‘s in that ________ .', ' they didn‘t think it was important to place blame ', 'they had more children', ' Jane‘s parents thought blame was bad for the growing-up of their children, or even for  their whole', 'their children could drive cars', 'their children', ' Jane‘s parents', ' Jane‘s', ' ', 'C', '2', '1', '0', '0', '0', '2016-05-26');
INSERT INTO `ot_multiple` VALUES ('14', '14', 'In a lady named lill,lill found it hard to get a suitable job because', 'English was her second language', 'she was not brave enough', 'her education and skill were limited', 'there were a lot of typists to compete with her', 'over and over', 'again and again', 'time and time again', 'learning time-fully', 'AC', '2', '1', '0', '0', '0', '2016-05-26');
INSERT INTO `ot_multiple` VALUES ('15', '15', 'You can learn effectively by _________ .', 'following the procedure of preview class review study', 'learning actively', 'asked the jailer if he had a light ', 'there were a lot of typists to compete with her', 'learning concentratively', 'learning time-fully', 'she was not brave enough', 'frustration', 'ABF', '2', '1', '0', '0', '0', '2016-05-26');
INSERT INTO `ot_multiple` VALUES ('16', '17', 'Effective study skills and strategies can help you ___________', 'become a successful student', 'know yourself better', 'loved their kids deeply', 'time and time again', 'they had more children', 'there were a lot of typists to compete with her', 'use time effectively', 'bring yourself all over the world', 'AH', '2', '1', '0', '0', '0', '2016-05-26');
INSERT INTO `ot_multiple` VALUES ('17', '18', 'In Maintaining Progress in Your English Studies, you are suggested _____ after class.', 'to meet and help one another with review and testing', 'to compare notes on things you found difficult', 'learning actively', 'to compare notes on things you found difficult', 'They will not give up when communication is difficult', 'loved their kids deeply', 'to get different learning ways from friends', 'They never commuicate with each other in the language they are learning', 'ADH', '2', '1', '0', '0', '0', '2016-05-26');
INSERT INTO `ot_multiple` VALUES ('18', '19', 'According to Maintaining Progress in Your English Students,you might have the positive feeling of _____ in your study', 'satisfaction', 'now and then', 'interest', 'escaped from the jail ', 'there were a lot of typists to compete with her', 'stimulation', 'frustration', 'learning concentratively', 'ACF', '2', '1', '0', '0', '0', '2016-05-26');
INSERT INTO `ot_multiple` VALUES ('19', '20', 'According to Successful Languge Learners,which are true about active learners', 'They will repeat what they here', 'They are willing to make mistakes', 'They will not give up when communication is difficult', 'They never commuicate with each other in the language they are learning', 'to compare notes on things you found difficult', ' Jane‘s parents thought blame was bad for the growing-up of their children, or even for  their whole', 'learning actively', 'her education and skill were limited', 'BCD', '2', '1', '0', '0', '0', '2016-05-26');

-- ----------------------------
-- Table structure for ot_paper
-- ----------------------------
DROP TABLE IF EXISTS `ot_paper`;
CREATE TABLE `ot_paper` (
  `pap_id` int(12) NOT NULL auto_increment COMMENT '系统自增',
  `pap_numb` int(12) default NULL COMMENT '试卷号',
  `pap_cont` text COMMENT '试卷内容',
  `cla_id` int(6) default NULL COMMENT '班级号',
  `tea_id` int(12) default NULL COMMENT '教师号',
  `sub_id` int(4) default NULL COMMENT '课程号',
  `sco_id` int(3) default NULL COMMENT '分值号',
  `pap_exti` int(10) default NULL COMMENT '考试时长',
  `pap_auto` tinyint(1) default NULL COMMENT '是否自动生成',
  `pap_star` tinyint(1) default NULL COMMENT '是否开考',
  `pap_sign` tinyint(1) default NULL COMMENT '删除标记 0-删除,1-存在',
  `pap_time` date default NULL COMMENT '录入时间',
  PRIMARY KEY  (`pap_id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ot_paper
-- ----------------------------
INSERT INTO `ot_paper` VALUES ('1', '1', 'a:10:{s:8:\"sin_scor\";s:1:\"2\";s:3:\"sin\";s:25:\"1,3,4,7,13,14,15,16,17,18\";s:8:\"mul_scor\";s:1:\"4\";s:3:\"mul\";s:26:\"3,4,5,6,7,8,14,15,16,17,18\";s:8:\"jud_scor\";s:1:\"2\";s:3:\"jud\";s:4:\"3,15\";s:8:\"clo_scor\";s:1:\"4\";s:3:\"clo\";s:9:\"2,3,4,6,7\";s:8:\"ans_scor\";s:2:\"10\";s:3:\"ans\";s:5:\"1,3,4\";}', '1', '1', '2', null, '60', '0', '1', '0', '2016-05-26');
INSERT INTO `ot_paper` VALUES ('2', '2', 'a:5:{s:8:\"sin_rand\";i:100;s:8:\"mul_rand\";i:78;s:8:\"jud_rand\";i:58;s:8:\"clo_rand\";i:14;s:8:\"ans_rand\";i:46;}', '1', '1', '2', '1', '70', '1', '1', '0', '2016-05-26');
INSERT INTO `ot_paper` VALUES ('3', '3', 'a:10:{s:8:\"sin_scor\";s:1:\"2\";s:3:\"sin\";s:4:\"1,13\";s:8:\"mul_scor\";s:1:\"2\";s:3:\"mul\";s:4:\"1,13\";s:8:\"jud_scor\";s:1:\"2\";s:3:\"jud\";s:4:\"1,13\";s:8:\"clo_scor\";s:1:\"2\";s:3:\"clo\";s:1:\"2\";s:8:\"ans_scor\";s:0:\"\";s:3:\"ans\";s:1:\"1\";}', '1', '1', '2', null, '60', '0', '1', '0', '2016-05-26');

-- ----------------------------
-- Table structure for ot_score
-- ----------------------------
DROP TABLE IF EXISTS `ot_score`;
CREATE TABLE `ot_score` (
  `sco_id` int(3) NOT NULL auto_increment COMMENT '系统自增',
  `sco_numb` int(3) default NULL COMMENT '分值号',
  `sco_sing` float(4,1) default NULL COMMENT '单选分值',
  `sco_mult` float(4,1) default NULL COMMENT '多选分值',
  `sco_judg` float(4,1) default NULL COMMENT '判断分值',
  `sco_cloz` float(4,1) default NULL COMMENT '填空分值',
  `sco_answ` float(4,1) default NULL COMMENT '简答分值',
  `sco_num_sing` tinyint(2) default NULL COMMENT '单选题数目',
  `sco_num_mult` tinyint(2) default NULL COMMENT '多选题数目',
  `sco_num_judg` tinyint(2) default NULL COMMENT '判断题数目',
  `sco_num_cloz` tinyint(2) default NULL COMMENT '填空题数目',
  `sco_num_answ` tinyint(2) default NULL COMMENT '简答题数目',
  `tea_id` int(12) default NULL COMMENT '教师号',
  `sco_sign` tinyint(1) default NULL COMMENT '删除标记 0-删除,1-存在',
  `sco_time` date default NULL COMMENT '录入时间',
  PRIMARY KEY  (`sco_id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ot_score
-- ----------------------------
INSERT INTO `ot_score` VALUES ('1', '1', '1.0', '2.0', '1.0', '2.0', '10.0', '4', '4', '4', '4', '4', '1', '0', '2016-05-16');
INSERT INTO `ot_score` VALUES ('2', '2', '2.0', '2.0', '2.0', '2.0', '2.0', '2', '2', '2', '2', '3', '1', '0', '2016-05-16');
INSERT INTO `ot_score` VALUES ('3', '22', '2.0', '2.0', '2.0', '2.0', '2.0', '2', '2', '2', '2', '3', '1', '0', '2016-05-16');
INSERT INTO `ot_score` VALUES ('4', '222', '1.0', '1.0', '1.0', '1.0', '1.0', '1', '1', '1', '1', '1', '1', '0', '2016-05-16');
INSERT INTO `ot_score` VALUES ('5', '77', '1.0', '1.0', '1.0', '1.0', '1.0', '2', '2', '2', '2', '4', '1', '0', '2016-05-18');
INSERT INTO `ot_score` VALUES ('6', '3', '2.0', '3.0', '3.0', '3.0', '3.0', '3', '3', '3', '33', '3', '1', '0', '2016-05-19');
INSERT INTO `ot_score` VALUES ('7', '9', '2.0', '1.0', '1.0', '1.0', '1.0', '1', '1', '1', '1', '2', '1', '0', '2016-05-19');

-- ----------------------------
-- Table structure for ot_single
-- ----------------------------
DROP TABLE IF EXISTS `ot_single`;
CREATE TABLE `ot_single` (
  `sin_id` int(12) NOT NULL auto_increment COMMENT '系统自增',
  `sin_numb` int(12) default NULL COMMENT '编号',
  `sin_ques` text COMMENT '问题',
  `sin_opta` varchar(100) default NULL COMMENT '选项A',
  `sin_optb` varchar(100) default NULL COMMENT '选项B',
  `sin_optc` varchar(100) default NULL COMMENT '选项C',
  `sin_optd` varchar(100) default NULL COMMENT '选项D',
  `sin_answ` varchar(1) default NULL COMMENT '答案',
  `sub_id` int(4) default NULL COMMENT '课程号',
  `tea_id` int(12) default NULL COMMENT '教师号',
  `sin_righ` int(12) default NULL COMMENT '正确数',
  `sin_all` int(12) default NULL COMMENT '答题数',
  `sin_sign` tinyint(1) default NULL COMMENT '删除标记 0-删除,1-存在',
  `sin_time` date default NULL COMMENT '录入时间',
  PRIMARY KEY  (`sin_id`)
) ENGINE=MyISAM AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ot_single
-- ----------------------------
INSERT INTO `ot_single` VALUES ('1', '1', 'When I first entered college as a freshman, I was afraid _______ I was not able to do well in  my studies.  ', 'of', 'ot', 'but', 'that', 'D', '2', '1', '0', '4', '0', '2016-05-19');
INSERT INTO `ot_single` VALUES ('2', '2', 'I would have to make friends _____ them and perhaps also compete ______ them for grades.', 'to,for', 'with,with', 'at ,to', 'to..to', 'B', '2', '1', '0', '1', '0', '2016-05-19');
INSERT INTO `ot_single` VALUES ('3', '3', 'However, after a short period of time, I had my life ___________ control.', 'in ', 'at', 'under', 'within', 'C', '2', '1', '0', '3', '0', '2016-05-19');
INSERT INTO `ot_single` VALUES ('4', '4', 'I really was not certain what I would do with the years _________ me.', 'in the front of ', ' ahead of', 'out of  ', 'away from ', 'B', '2', '1', '0', '3', '0', '2016-05-19');
INSERT INTO `ot_single` VALUES ('5', '5', 'Louis’s father was a saddle maker who made items out ________ leather. ', 'from', 'by', 'through', 'of', 'D', '2', '1', '0', '1', '0', '2016-05-19');
INSERT INTO `ot_single` VALUES ('6', '6', 'It took the workers two years ___________ the bridge.', 'building ', 'built ', 'build ', 'to build ', 'D', '2', '1', '0', '1', '0', '2016-05-19');
INSERT INTO `ot_single` VALUES ('7', '7', 'It suddenly came _________ me that Mary hates fish.  ', 'for', 'at', 'build', 'to build', 'D', '2', '1', '0', '2', '0', '2016-05-19');
INSERT INTO `ot_single` VALUES ('8', '8', 'The news has already _________ all over the country. ', ' imitated ', 'spread ', 'shocked', 'increa', 'B', '2', '1', '0', '0', '0', '2016-05-19');
INSERT INTO `ot_single` VALUES ('9', '9', 'Women, _________ men, have the right to work. ', 'as soon as', 'as long as', 'as for as', 'as well as', 'D', '2', '1', '0', '0', '0', '2016-05-19');
INSERT INTO `ot_single` VALUES ('10', '10', 'I had to work hard to ____________ the other students.', 'keep away from', 'keep up with', 'keep back', 'keep out ', 'B', '2', '1', '0', '0', '0', '2016-05-19');
INSERT INTO `ot_single` VALUES ('11', '11', 'At that moment, few people ___________ the danger ahead', 'were awaring of', 'were aware of', 'were aware that', 'were aware for', 'B', '2', '1', '0', '0', '0', '2016-05-26');
INSERT INTO `ot_single` VALUES ('12', '12', 'When the ticket collector（查票员）asked him to show his ticket, he pretended to _______ it', 'fumble at', 'fumble to ', 'fumble on ', 'fumble for', 'D', '2', '1', '0', '0', '0', '2016-05-26');
INSERT INTO `ot_single` VALUES ('13', '13', 'Time is urgent. We must finish the work today _________.', 'in the case', 'in case', 'in no case', 'in any case', 'D', '2', '1', '0', '4', '0', '2016-05-26');
INSERT INTO `ot_single` VALUES ('14', '14', 'It is this picture ________ I want to show you. ', 'that', 'which', 'what', 'how', 'A', '2', '1', '2', '3', '0', '2016-05-26');
INSERT INTO `ot_single` VALUES ('15', '15', 'How can she lead a full and happy life if she feels we blame her _______ her sister‘s death', 'at', 'on ', 'in ', 'for', 'D', '2', '1', '2', '3', '0', '2016-05-26');
INSERT INTO `ot_single` VALUES ('16', '16', 'Professors can only______for you to create learning through your own actions. ', 'make a platform', 'work out a stage', 'set the stage', 'set aside a rooom', 'C', '2', '1', '2', '2', '0', '2016-05-26');
INSERT INTO `ot_single` VALUES ('17', '17', 'Adjusting your learning style______your teacher‘s will be to your advantage.', 'to', 'at', 'for', 'with', 'A', '2', '1', '1', '2', '0', '2016-05-26');
INSERT INTO `ot_single` VALUES ('18', '18', 'We ______ an old friend when we were having dinner at a restaurant. ', 'went across', 'came across', 'went cross', 'came cross', 'B', '2', '1', '1', '2', '0', '2016-05-26');
INSERT INTO `ot_single` VALUES ('19', '19', 'He works hard only before examinations. In fact, he is very lazy__________.', 'sometimes', 'other time', 'at other times', 'at times', 'C', '2', '1', '0', '0', '0', '2016-05-26');
INSERT INTO `ot_single` VALUES ('20', '20', 'Successful language learners ____________ make mistakes and try again.', 'willing', 'are to', 'are', 'are willing to', 'D', '2', '1', '1', '1', '0', '2016-05-26');
INSERT INTO `ot_single` VALUES ('21', '111', '1+1', '1', '2', '3', '4', 'B', '1', '1', '0', '0', '0', '2016-05-31');

-- ----------------------------
-- Table structure for ot_student
-- ----------------------------
DROP TABLE IF EXISTS `ot_student`;
CREATE TABLE `ot_student` (
  `stu_id` int(12) NOT NULL auto_increment COMMENT '系统自增',
  `stu_year` int(4) default NULL COMMENT '年份',
  `cla_id` int(6) unsigned zerofill default NULL COMMENT '班级',
  `dir_id` tinyint(2) unsigned zerofill default NULL COMMENT '方向',
  `stu_numb` tinyint(2) unsigned zerofill default NULL COMMENT '学号',
  `stu_name` varchar(6) default NULL COMMENT '姓名',
  `stu_pass` varchar(32) default NULL COMMENT '密码',
  `stu_auth` tinyint(1) default NULL COMMENT '权限',
  `stu_sign` tinyint(1) default NULL COMMENT '删除标记 0-删除,1-存在',
  `stu_time` date default NULL COMMENT '录入时间',
  PRIMARY KEY  (`stu_id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ot_student
-- ----------------------------
INSERT INTO `ot_student` VALUES ('1', '2012', '000001', null, '03', 'a', 'd93a5def7511da3d0f2d171d9c344e91', '0', '0', '2016-05-18');
INSERT INTO `ot_student` VALUES ('2', '2012', '000002', null, '01', 'b', 'd93a5def7511da3d0f2d171d9c344e91', '0', '0', '2016-05-18');
INSERT INTO `ot_student` VALUES ('3', '2012', '000003', null, '01', 'c', 'd93a5def7511da3d0f2d171d9c344e91', '0', '0', '2016-05-18');
INSERT INTO `ot_student` VALUES ('4', '2012', '000004', null, '01', 'd', 'd93a5def7511da3d0f2d171d9c344e91', '0', '0', '2016-05-18');
INSERT INTO `ot_student` VALUES ('5', '2012', '000005', null, '01', 'e', 'd93a5def7511da3d0f2d171d9c344e91', '0', '0', '2016-05-18');
INSERT INTO `ot_student` VALUES ('6', '2012', '000006', null, '01', 'f', 'd93a5def7511da3d0f2d171d9c344e91', '0', '0', '2016-05-18');
INSERT INTO `ot_student` VALUES ('7', '2012', '000001', null, '02', 'a', 'd93a5def7511da3d0f2d171d9c344e91', '0', '0', '2016-05-18');
INSERT INTO `ot_student` VALUES ('8', '2012', '000001', null, '05', 'a', 'd93a5def7511da3d0f2d171d9c344e91', '0', '0', '2016-05-18');
INSERT INTO `ot_student` VALUES ('9', '2012', '000001', null, '22', '张三', 'd93a5def7511da3d0f2d171d9c344e91', '0', '0', '2016-05-31');
INSERT INTO `ot_student` VALUES ('10', '2012', '000001', null, '22', '张三', 'd93a5def7511da3d0f2d171d9c344e91', '0', '1', '2016-05-31');

-- ----------------------------
-- Table structure for ot_subject
-- ----------------------------
DROP TABLE IF EXISTS `ot_subject`;
CREATE TABLE `ot_subject` (
  `sub_id` int(4) NOT NULL auto_increment COMMENT '系统自增',
  `sub_numb` int(4) unsigned zerofill default NULL COMMENT '课程号',
  `sub_name` varchar(12) default NULL COMMENT '名称',
  `sub_url` varchar(20) default NULL COMMENT 'url',
  `sub_sign` tinyint(1) default NULL COMMENT '删除标记 0-删除,1-存在',
  `sub_time` date default NULL COMMENT '录入时间',
  PRIMARY KEY  (`sub_id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ot_subject
-- ----------------------------
INSERT INTO `ot_subject` VALUES ('1', '0001', '高等数学', null, '0', '2016-05-16');
INSERT INTO `ot_subject` VALUES ('2', '0002', '大学英语', null, '0', '2016-05-16');
INSERT INTO `ot_subject` VALUES ('3', '0003', '程序设计语言', null, '0', '2016-05-16');
INSERT INTO `ot_subject` VALUES ('4', '0004', '汇编语言', null, '0', '2016-05-16');
INSERT INTO `ot_subject` VALUES ('5', '0005', '计算机组成原理', null, '0', '2016-05-16');

-- ----------------------------
-- Table structure for ot_teacher
-- ----------------------------
DROP TABLE IF EXISTS `ot_teacher`;
CREATE TABLE `ot_teacher` (
  `tea_id` int(12) NOT NULL auto_increment COMMENT '系统自增',
  `tea_numb` int(4) unsigned zerofill default NULL COMMENT '教师号',
  `tea_name` varchar(6) default NULL COMMENT '姓名',
  `tea_pass` varchar(32) default NULL COMMENT '密码',
  `tea_auth` tinyint(1) default NULL COMMENT '权限',
  `tea_sign` tinyint(1) default NULL COMMENT '删除标记',
  `tea_time` date default NULL COMMENT '录入时间',
  PRIMARY KEY  (`tea_id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ot_teacher
-- ----------------------------
INSERT INTO `ot_teacher` VALUES ('1', '0001', 'a', 'd93a5def7511da3d0f2d171d9c344e91', '1', '0', '2016-05-16');
INSERT INTO `ot_teacher` VALUES ('2', '0002', 'b', 'd93a5def7511da3d0f2d171d9c344e91', '1', '0', '2016-05-16');
INSERT INTO `ot_teacher` VALUES ('3', '0003', 'c', 'd93a5def7511da3d0f2d171d9c344e91', '1', '0', '2016-05-16');
INSERT INTO `ot_teacher` VALUES ('4', '0004', 'd', 'd93a5def7511da3d0f2d171d9c344e91', '1', '0', '2016-05-16');
INSERT INTO `ot_teacher` VALUES ('5', '0005', 'e', 'd93a5def7511da3d0f2d171d9c344e91', '1', '0', '2016-05-16');
