/*
Navicat MySQL Data Transfer

Source Server         : MySql57
Source Server Version : 50727
Source Host           : localhost:3306
Source Database       : sq_book

Target Server Type    : MYSQL
Target Server Version : 50727
File Encoding         : 65001

Date: 2022-07-25 22:28:36
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for asq_books
-- ----------------------------
DROP TABLE IF EXISTS `asq_books`;
CREATE TABLE `asq_books` (
                             `book_id` bigint(20) NOT NULL AUTO_INCREMENT,
                             `book_writer_name` varchar(20) DEFAULT NULL COMMENT '期刊作者姓名',
                             `book_name` varchar(20) DEFAULT NULL COMMENT '期刊名',
                             `book_type` varchar(20) DEFAULT NULL COMMENT '期刊类型',
                             `book_pub_date` datetime DEFAULT NULL COMMENT '出版日期',
                             `book_up_date` datetime DEFAULT NULL COMMENT '上传日期',
                             `book_press` varchar(20) DEFAULT NULL COMMENT '出版社',
                             `book_cover` varchar(255) DEFAULT NULL COMMENT '期刊封面',
                             `book_pdf_url` varchar(255) DEFAULT NULL COMMENT '期刊pdf',
                             `book_audit` int(6) DEFAULT '0' COMMENT '0 待审核 1 审核成功 2 审核失败',
                             PRIMARY KEY (`book_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of asq_books
-- ----------------------------
INSERT INTO `asq_books` VALUES ('1', 'liefox', '前后端分离', 'Java', '2022-03-22 00:00:00', '2022-03-22 00:00:00', '工作室', '/profile/upload/2022/03/22/be03beb9-da38-40ab-b667-558f7af26e8d.jpeg', '/profile/upload/2022/05/02/3c84954e-fcde-49af-ba28-338bdac2c5bb.pdf', '1');

-- ----------------------------
-- Table structure for asq_ppt
-- ----------------------------
DROP TABLE IF EXISTS `asq_ppt`;
CREATE TABLE `asq_ppt` (
                           `ppt_id` int(20) NOT NULL AUTO_INCREMENT,
                           `ppt_name` varchar(50) DEFAULT NULL COMMENT '幻灯片名称',
                           `ppt_pic` varchar(255) DEFAULT NULL COMMENT '图片',
                           `ppt_url` varchar(255) DEFAULT NULL COMMENT '跳转路径',
                           `ppt_desc` int(20) DEFAULT NULL COMMENT '排序',
                           `ppt_type` int(20) DEFAULT NULL COMMENT '类型',
                           PRIMARY KEY (`ppt_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of asq_ppt
-- ----------------------------
INSERT INTO `asq_ppt` VALUES ('1', 'ppt1', '/profile/upload/2022/07/24/7235bfa2-d507-4f76-8ccc-fc569c1d3155.jpg', 'https://www.zhihu.com/', '1', '3');
INSERT INTO `asq_ppt` VALUES ('2', '期刊撒打算打算的', '/profile/upload/2022/07/24/e3b491f1-9fa8-4c57-9208-928d51e40b38.jpeg', '1', '2', '1');
INSERT INTO `asq_ppt` VALUES ('3', '空间站的文学', '/profile/upload/2022/07/24/beecd828-5063-4252-9b4a-b4970b516cdf.jpg', 'https://www.zhihu.com/question/543901181', '3', '2');

-- ----------------------------
-- Table structure for asq_rank_parm
-- ----------------------------
DROP TABLE IF EXISTS `asq_rank_parm`;
CREATE TABLE `asq_rank_parm` (
                                 `rank_parm_id` int(20) NOT NULL AUTO_INCREMENT,
                                 `book_id` int(20) DEFAULT NULL COMMENT '期刊id',
                                 `read_num` int(255) DEFAULT NULL COMMENT '阅读数',
                                 `applaud_num` int(255) DEFAULT NULL COMMENT '赞同数',
                                 `comment_num` int(255) DEFAULT NULL COMMENT '评论数',
                                 `collect_num` int(255) DEFAULT NULL COMMENT '收藏数',
                                 PRIMARY KEY (`rank_parm_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of asq_rank_parm
-- ----------------------------

-- ----------------------------
-- Table structure for asq_writer
-- ----------------------------
DROP TABLE IF EXISTS `asq_writer`;
CREATE TABLE `asq_writer` (
                              `writer_id` bigint(20) NOT NULL AUTO_INCREMENT,
                              `writer_name` varchar(20) DEFAULT NULL COMMENT '作者姓名',
                              `writer_info` varchar(255) DEFAULT NULL COMMENT '作者详情',
                              `writer_intro` varchar(255) DEFAULT NULL COMMENT '作者座右铭',
                              `writer_pic` varchar(255) DEFAULT NULL COMMENT '作者头像',
                              PRIMARY KEY (`writer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of asq_writer
-- ----------------------------
INSERT INTO `asq_writer` VALUES ('1', '期刊1', '<p><img src=\"/dev-api/profile/upload/2022/04/25/c716b837-2e1c-4b16-8c67-4510c652111f.jpg\"></p><p>我是期刊1111</p>', '千里马常有，而伯乐。。。。', '/profile/upload/2022/04/25/4124bc61-dfc5-42d3-8bab-c52b3b549966.jpeg');
INSERT INTO `asq_writer` VALUES ('7', '3', null, null, '/profile/upload/2022/05/02/8d4e9a34-ae54-47e4-a564-9c3d27d320f4.jpg');

-- ----------------------------
-- Table structure for gen_table
-- ----------------------------
DROP TABLE IF EXISTS `gen_table`;
CREATE TABLE `gen_table` (
                             `table_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
                             `table_name` varchar(200) DEFAULT '' COMMENT '表名称',
                             `table_comment` varchar(500) DEFAULT '' COMMENT '表描述',
                             `sub_table_name` varchar(64) DEFAULT NULL COMMENT '关联子表的表名',
                             `sub_table_fk_name` varchar(64) DEFAULT NULL COMMENT '子表关联的外键名',
                             `class_name` varchar(100) DEFAULT '' COMMENT '实体类名称',
                             `tpl_category` varchar(200) DEFAULT 'crud' COMMENT '使用的模板（crud单表操作 tree树表操作）',
                             `package_name` varchar(100) DEFAULT NULL COMMENT '生成包路径',
                             `module_name` varchar(30) DEFAULT NULL COMMENT '生成模块名',
                             `business_name` varchar(30) DEFAULT NULL COMMENT '生成业务名',
                             `function_name` varchar(50) DEFAULT NULL COMMENT '生成功能名',
                             `function_author` varchar(50) DEFAULT NULL COMMENT '生成功能作者',
                             `gen_type` char(1) DEFAULT '0' COMMENT '生成代码方式（0zip压缩包 1自定义路径）',
                             `gen_path` varchar(200) DEFAULT '/' COMMENT '生成路径（不填默认项目路径）',
                             `options` varchar(1000) DEFAULT NULL COMMENT '其它生成选项',
                             `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
                             `create_time` datetime DEFAULT NULL COMMENT '创建时间',
                             `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
                             `update_time` datetime DEFAULT NULL COMMENT '更新时间',
                             `remark` varchar(500) DEFAULT NULL COMMENT '备注',
                             PRIMARY KEY (`table_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='代码生成业务表';

-- ----------------------------
-- Records of gen_table
-- ----------------------------
INSERT INTO `gen_table` VALUES ('3', 'asq_books', '期刊管理', null, null, 'AsqBooks', 'crud', 'com.ruoyi', 'bookM', 'books', '期刊管理', 'ruoyi', '0', '/', '{\"parentMenuId\":\"2015\"}', 'admin', '2022-03-22 10:54:19', '', '2022-05-02 17:21:38', null);
INSERT INTO `gen_table` VALUES ('4', 'asq_writer', '作者', null, null, 'AsqWriter', 'crud', 'com.ruoyi', 'writer', 'writer', '作者管理', 'liefox', '0', '/', '{\"parentMenuId\":\"2022\"}', 'admin', '2022-04-25 21:22:42', '', '2022-04-25 21:47:32', null);
INSERT INTO `gen_table` VALUES ('5', 'asq_ppt', '前台首页幻灯片', null, null, 'AsqPpt', 'crud', 'com.ruoyi', 'ppt', 'ppt', '前台首页幻灯片', 'ruoyi', '0', '/', '{\"parentMenuId\":2029}', 'admin', '2022-07-24 18:17:52', '', '2022-07-24 18:25:03', null);

-- ----------------------------
-- Table structure for gen_table_column
-- ----------------------------
DROP TABLE IF EXISTS `gen_table_column`;
CREATE TABLE `gen_table_column` (
                                    `column_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
                                    `table_id` varchar(64) DEFAULT NULL COMMENT '归属表编号',
                                    `column_name` varchar(200) DEFAULT NULL COMMENT '列名称',
                                    `column_comment` varchar(500) DEFAULT NULL COMMENT '列描述',
                                    `column_type` varchar(100) DEFAULT NULL COMMENT '列类型',
                                    `java_type` varchar(500) DEFAULT NULL COMMENT 'JAVA类型',
                                    `java_field` varchar(200) DEFAULT NULL COMMENT 'JAVA字段名',
                                    `is_pk` char(1) DEFAULT NULL COMMENT '是否主键（1是）',
                                    `is_increment` char(1) DEFAULT NULL COMMENT '是否自增（1是）',
                                    `is_required` char(1) DEFAULT NULL COMMENT '是否必填（1是）',
                                    `is_insert` char(1) DEFAULT NULL COMMENT '是否为插入字段（1是）',
                                    `is_edit` char(1) DEFAULT NULL COMMENT '是否编辑字段（1是）',
                                    `is_list` char(1) DEFAULT NULL COMMENT '是否列表字段（1是）',
                                    `is_query` char(1) DEFAULT NULL COMMENT '是否查询字段（1是）',
                                    `query_type` varchar(200) DEFAULT 'EQ' COMMENT '查询方式（等于、不等于、大于、小于、范围）',
                                    `html_type` varchar(200) DEFAULT NULL COMMENT '显示类型（文本框、文本域、下拉框、复选框、单选框、日期控件）',
                                    `dict_type` varchar(200) DEFAULT '' COMMENT '字典类型',
                                    `sort` int(11) DEFAULT NULL COMMENT '排序',
                                    `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
                                    `create_time` datetime DEFAULT NULL COMMENT '创建时间',
                                    `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
                                    `update_time` datetime DEFAULT NULL COMMENT '更新时间',
                                    PRIMARY KEY (`column_id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8 COMMENT='代码生成业务表字段';

-- ----------------------------
-- Records of gen_table_column
-- ----------------------------
INSERT INTO `gen_table_column` VALUES ('14', '3', 'book_id', null, 'bigint(20)', 'Long', 'bookId', '1', '1', null, '1', null, null, null, 'EQ', 'input', '', '1', 'admin', '2022-03-22 10:54:20', '', '2022-05-02 17:21:38');
INSERT INTO `gen_table_column` VALUES ('15', '3', 'book_writer_name', '期刊作者姓名', 'varchar(20)', 'String', 'bookWriterName', '0', '0', null, '1', '1', '1', '1', 'LIKE', 'input', '', '2', 'admin', '2022-03-22 10:54:20', '', '2022-05-02 17:21:38');
INSERT INTO `gen_table_column` VALUES ('16', '3', 'book_name', '期刊名', 'varchar(20)', 'String', 'bookName', '0', '0', null, '1', '1', '1', '1', 'LIKE', 'input', '', '3', 'admin', '2022-03-22 10:54:20', '', '2022-05-02 17:21:38');
INSERT INTO `gen_table_column` VALUES ('17', '3', 'book_type', '期刊类型', 'varchar(20)', 'String', 'bookType', '0', '0', null, '1', '1', '1', '1', 'EQ', 'select', 'book_type', '4', 'admin', '2022-03-22 10:54:20', '', '2022-05-02 17:21:38');
INSERT INTO `gen_table_column` VALUES ('18', '3', 'book_pub_date', '出版日期', 'datetime', 'Date', 'bookPubDate', '0', '0', null, '1', '1', '1', '1', 'BETWEEN', 'datetime', '', '5', 'admin', '2022-03-22 10:54:20', '', '2022-05-02 17:21:38');
INSERT INTO `gen_table_column` VALUES ('19', '3', 'book_up_date', '上传日期', 'datetime', 'Date', 'bookUpDate', '0', '0', null, '1', '1', '1', '1', 'BETWEEN', 'datetime', '', '6', 'admin', '2022-03-22 10:54:20', '', '2022-05-02 17:21:38');
INSERT INTO `gen_table_column` VALUES ('20', '3', 'book_press', '出版社', 'varchar(20)', 'String', 'bookPress', '0', '0', null, '1', '1', '1', '1', 'LIKE', 'input', '', '7', 'admin', '2022-03-22 10:54:20', '', '2022-05-02 17:21:38');
INSERT INTO `gen_table_column` VALUES ('21', '3', 'book_cover', '期刊封面', 'varchar(255)', 'String', 'bookCover', '0', '0', null, '1', '1', '1', null, 'EQ', 'imageUpload', '', '8', 'admin', '2022-03-22 10:54:20', '', '2022-05-02 17:21:38');
INSERT INTO `gen_table_column` VALUES ('22', '4', 'writer_id', null, 'bigint(20)', 'Long', 'writerId', '1', '1', null, '1', null, null, null, 'EQ', 'input', '', '1', 'admin', '2022-04-25 21:22:42', '', '2022-04-25 21:47:32');
INSERT INTO `gen_table_column` VALUES ('23', '4', 'writer_name', '作者姓名', 'varchar(20)', 'String', 'writerName', '0', '0', null, '1', '1', '1', '1', 'LIKE', 'input', '', '2', 'admin', '2022-04-25 21:22:42', '', '2022-04-25 21:47:32');
INSERT INTO `gen_table_column` VALUES ('24', '4', 'writer_info', '作者详情', 'varchar(255)', 'String', 'writerInfo', '0', '0', null, '1', '1', '1', null, 'EQ', 'editor', '', '3', 'admin', '2022-04-25 21:22:42', '', '2022-04-25 21:47:32');
INSERT INTO `gen_table_column` VALUES ('25', '4', 'writer_intro', '作者座右铭', 'varchar(255)', 'String', 'writerIntro', '0', '0', null, '1', '1', '1', null, 'EQ', 'input', '', '4', 'admin', '2022-04-25 21:22:42', '', '2022-04-25 21:47:32');
INSERT INTO `gen_table_column` VALUES ('26', '4', 'writer_pic', '作者头像', 'varchar(255)', 'String', 'writerPic', '0', '0', null, '1', '1', '1', null, 'EQ', 'imageUpload', '', '5', 'admin', '2022-04-25 21:22:42', '', '2022-04-25 21:47:32');
INSERT INTO `gen_table_column` VALUES ('27', '3', 'book_pdf_url', '期刊pdf', 'varchar(255)', 'String', 'bookPdfUrl', '0', '0', null, '1', '1', '1', null, 'EQ', 'fileUpload', '', '9', '', '2022-05-02 17:01:49', '', '2022-05-02 17:21:38');
INSERT INTO `gen_table_column` VALUES ('28', '3', 'book_audit', '审核状态', 'int(6)', 'Integer', 'bookAudit', '0', '0', null, '1', '1', '1', '1', 'EQ', 'select', 'book_audit', '10', '', '2022-05-02 17:01:49', '', '2022-05-02 17:21:38');
INSERT INTO `gen_table_column` VALUES ('29', '5', 'ppt_id', 'ID', 'int(20)', 'Long', 'pptId', '1', '1', null, '1', null, null, null, 'EQ', 'input', '', '1', 'admin', '2022-07-24 18:17:53', '', '2022-07-24 18:25:03');
INSERT INTO `gen_table_column` VALUES ('30', '5', 'ppt_name', '名称', 'varchar(50)', 'String', 'pptName', '0', '0', null, '1', '1', '1', '1', 'LIKE', 'input', '', '2', 'admin', '2022-07-24 18:17:53', '', '2022-07-24 18:25:03');
INSERT INTO `gen_table_column` VALUES ('31', '5', 'ppt_pic', '图片', 'varchar(255)', 'String', 'pptPic', '0', '0', null, '1', '1', '1', null, 'EQ', 'imageUpload', '', '3', 'admin', '2022-07-24 18:17:53', '', '2022-07-24 18:25:03');
INSERT INTO `gen_table_column` VALUES ('32', '5', 'ppt_url', '跳转路径', 'varchar(255)', 'String', 'pptUrl', '0', '0', null, '1', '1', '1', null, 'EQ', 'input', '', '4', 'admin', '2022-07-24 18:17:53', '', '2022-07-24 18:25:03');
INSERT INTO `gen_table_column` VALUES ('33', '5', 'ppt_desc', '排序', 'int(20)', 'Long', 'pptDesc', '0', '0', null, '1', '1', '1', '1', 'EQ', 'input', '', '5', 'admin', '2022-07-24 18:17:53', '', '2022-07-24 18:25:03');
INSERT INTO `gen_table_column` VALUES ('34', '5', 'ppt_type', '类型', 'int(20)', 'Long', 'pptType', '0', '0', null, '1', '1', '1', '1', 'EQ', 'select', 'ppt_type', '6', 'admin', '2022-07-24 18:17:53', '', '2022-07-24 18:25:03');

-- ----------------------------
-- Table structure for qrtz_blob_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_blob_triggers`;
CREATE TABLE `qrtz_blob_triggers` (
                                      `sched_name` varchar(120) NOT NULL COMMENT '调度名称',
                                      `trigger_name` varchar(200) NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
                                      `trigger_group` varchar(200) NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
                                      `blob_data` blob COMMENT '存放持久化Trigger对象',
                                      PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`),
                                      CONSTRAINT `qrtz_blob_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Blob类型的触发器表';

-- ----------------------------
-- Records of qrtz_blob_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_calendars
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_calendars`;
CREATE TABLE `qrtz_calendars` (
                                  `sched_name` varchar(120) NOT NULL COMMENT '调度名称',
                                  `calendar_name` varchar(200) NOT NULL COMMENT '日历名称',
                                  `calendar` blob NOT NULL COMMENT '存放持久化calendar对象',
                                  PRIMARY KEY (`sched_name`,`calendar_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='日历信息表';

-- ----------------------------
-- Records of qrtz_calendars
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_cron_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_cron_triggers`;
CREATE TABLE `qrtz_cron_triggers` (
                                      `sched_name` varchar(120) NOT NULL COMMENT '调度名称',
                                      `trigger_name` varchar(200) NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
                                      `trigger_group` varchar(200) NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
                                      `cron_expression` varchar(200) NOT NULL COMMENT 'cron表达式',
                                      `time_zone_id` varchar(80) DEFAULT NULL COMMENT '时区',
                                      PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`),
                                      CONSTRAINT `qrtz_cron_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Cron类型的触发器表';

-- ----------------------------
-- Records of qrtz_cron_triggers
-- ----------------------------
INSERT INTO `qrtz_cron_triggers` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME1', 'DEFAULT', '0/10 * * * * ?', 'Asia/Shanghai');
INSERT INTO `qrtz_cron_triggers` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME2', 'DEFAULT', '0/15 * * * * ?', 'Asia/Shanghai');
INSERT INTO `qrtz_cron_triggers` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME3', 'DEFAULT', '0/20 * * * * ?', 'Asia/Shanghai');

-- ----------------------------
-- Table structure for qrtz_fired_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_fired_triggers`;
CREATE TABLE `qrtz_fired_triggers` (
                                       `sched_name` varchar(120) NOT NULL COMMENT '调度名称',
                                       `entry_id` varchar(95) NOT NULL COMMENT '调度器实例id',
                                       `trigger_name` varchar(200) NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
                                       `trigger_group` varchar(200) NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
                                       `instance_name` varchar(200) NOT NULL COMMENT '调度器实例名',
                                       `fired_time` bigint(13) NOT NULL COMMENT '触发的时间',
                                       `sched_time` bigint(13) NOT NULL COMMENT '定时器制定的时间',
                                       `priority` int(11) NOT NULL COMMENT '优先级',
                                       `state` varchar(16) NOT NULL COMMENT '状态',
                                       `job_name` varchar(200) DEFAULT NULL COMMENT '任务名称',
                                       `job_group` varchar(200) DEFAULT NULL COMMENT '任务组名',
                                       `is_nonconcurrent` varchar(1) DEFAULT NULL COMMENT '是否并发',
                                       `requests_recovery` varchar(1) DEFAULT NULL COMMENT '是否接受恢复执行',
                                       PRIMARY KEY (`sched_name`,`entry_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='已触发的触发器表';

-- ----------------------------
-- Records of qrtz_fired_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_job_details
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_job_details`;
CREATE TABLE `qrtz_job_details` (
                                    `sched_name` varchar(120) NOT NULL COMMENT '调度名称',
                                    `job_name` varchar(200) NOT NULL COMMENT '任务名称',
                                    `job_group` varchar(200) NOT NULL COMMENT '任务组名',
                                    `description` varchar(250) DEFAULT NULL COMMENT '相关介绍',
                                    `job_class_name` varchar(250) NOT NULL COMMENT '执行任务类名称',
                                    `is_durable` varchar(1) NOT NULL COMMENT '是否持久化',
                                    `is_nonconcurrent` varchar(1) NOT NULL COMMENT '是否并发',
                                    `is_update_data` varchar(1) NOT NULL COMMENT '是否更新数据',
                                    `requests_recovery` varchar(1) NOT NULL COMMENT '是否接受恢复执行',
                                    `job_data` blob COMMENT '存放持久化job对象',
                                    PRIMARY KEY (`sched_name`,`job_name`,`job_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='任务详细信息表';

-- ----------------------------
-- Records of qrtz_job_details
-- ----------------------------
INSERT INTO `qrtz_job_details` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME1', 'DEFAULT', null, 'com.ruoyi.quartz.util.QuartzDisallowConcurrentExecution', '0', '1', '0', '0', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000F5441534B5F50524F504552544945537372001E636F6D2E72756F79692E71756172747A2E646F6D61696E2E5379734A6F6200000000000000010200084C000A636F6E63757272656E747400124C6A6176612F6C616E672F537472696E673B4C000E63726F6E45787072657373696F6E71007E00094C000C696E766F6B6554617267657471007E00094C00086A6F6247726F757071007E00094C00056A6F6249647400104C6A6176612F6C616E672F4C6F6E673B4C00076A6F624E616D6571007E00094C000D6D697366697265506F6C69637971007E00094C000673746174757371007E000978720027636F6D2E72756F79692E636F6D6D6F6E2E636F72652E646F6D61696E2E42617365456E7469747900000000000000010200074C0008637265617465427971007E00094C000A63726561746554696D657400104C6A6176612F7574696C2F446174653B4C0006706172616D7371007E00034C000672656D61726B71007E00094C000B73656172636856616C756571007E00094C0008757064617465427971007E00094C000A75706461746554696D6571007E000C787074000561646D696E7372000E6A6176612E7574696C2E44617465686A81014B597419030000787077080000017FACAE85A878707400007070707400013174000E302F3130202A202A202A202A203F74001172795461736B2E72794E6F506172616D7374000744454641554C547372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B02000078700000000000000001740018E7B3BBE7BB9FE9BB98E8AEA4EFBC88E697A0E58F82EFBC8974000133740001317800);
INSERT INTO `qrtz_job_details` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME2', 'DEFAULT', null, 'com.ruoyi.quartz.util.QuartzDisallowConcurrentExecution', '0', '1', '0', '0', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000F5441534B5F50524F504552544945537372001E636F6D2E72756F79692E71756172747A2E646F6D61696E2E5379734A6F6200000000000000010200084C000A636F6E63757272656E747400124C6A6176612F6C616E672F537472696E673B4C000E63726F6E45787072657373696F6E71007E00094C000C696E766F6B6554617267657471007E00094C00086A6F6247726F757071007E00094C00056A6F6249647400104C6A6176612F6C616E672F4C6F6E673B4C00076A6F624E616D6571007E00094C000D6D697366697265506F6C69637971007E00094C000673746174757371007E000978720027636F6D2E72756F79692E636F6D6D6F6E2E636F72652E646F6D61696E2E42617365456E7469747900000000000000010200074C0008637265617465427971007E00094C000A63726561746554696D657400104C6A6176612F7574696C2F446174653B4C0006706172616D7371007E00034C000672656D61726B71007E00094C000B73656172636856616C756571007E00094C0008757064617465427971007E00094C000A75706461746554696D6571007E000C787074000561646D696E7372000E6A6176612E7574696C2E44617465686A81014B597419030000787077080000017FACAE85A878707400007070707400013174000E302F3135202A202A202A202A203F74001572795461736B2E7279506172616D7328277279272974000744454641554C547372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B02000078700000000000000002740018E7B3BBE7BB9FE9BB98E8AEA4EFBC88E69C89E58F82EFBC8974000133740001317800);
INSERT INTO `qrtz_job_details` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME3', 'DEFAULT', null, 'com.ruoyi.quartz.util.QuartzDisallowConcurrentExecution', '0', '1', '0', '0', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000F5441534B5F50524F504552544945537372001E636F6D2E72756F79692E71756172747A2E646F6D61696E2E5379734A6F6200000000000000010200084C000A636F6E63757272656E747400124C6A6176612F6C616E672F537472696E673B4C000E63726F6E45787072657373696F6E71007E00094C000C696E766F6B6554617267657471007E00094C00086A6F6247726F757071007E00094C00056A6F6249647400104C6A6176612F6C616E672F4C6F6E673B4C00076A6F624E616D6571007E00094C000D6D697366697265506F6C69637971007E00094C000673746174757371007E000978720027636F6D2E72756F79692E636F6D6D6F6E2E636F72652E646F6D61696E2E42617365456E7469747900000000000000010200074C0008637265617465427971007E00094C000A63726561746554696D657400104C6A6176612F7574696C2F446174653B4C0006706172616D7371007E00034C000672656D61726B71007E00094C000B73656172636856616C756571007E00094C0008757064617465427971007E00094C000A75706461746554696D6571007E000C787074000561646D696E7372000E6A6176612E7574696C2E44617465686A81014B597419030000787077080000017FACAE85A878707400007070707400013174000E302F3230202A202A202A202A203F74003872795461736B2E72794D756C7469706C65506172616D7328277279272C20747275652C20323030304C2C203331362E3530442C203130302974000744454641554C547372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B02000078700000000000000003740018E7B3BBE7BB9FE9BB98E8AEA4EFBC88E5A49AE58F82EFBC8974000133740001317800);

-- ----------------------------
-- Table structure for qrtz_locks
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_locks`;
CREATE TABLE `qrtz_locks` (
                              `sched_name` varchar(120) NOT NULL COMMENT '调度名称',
                              `lock_name` varchar(40) NOT NULL COMMENT '悲观锁名称',
                              PRIMARY KEY (`sched_name`,`lock_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='存储的悲观锁信息表';

-- ----------------------------
-- Records of qrtz_locks
-- ----------------------------
INSERT INTO `qrtz_locks` VALUES ('RuoyiScheduler', 'STATE_ACCESS');
INSERT INTO `qrtz_locks` VALUES ('RuoyiScheduler', 'TRIGGER_ACCESS');

-- ----------------------------
-- Table structure for qrtz_paused_trigger_grps
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_paused_trigger_grps`;
CREATE TABLE `qrtz_paused_trigger_grps` (
                                            `sched_name` varchar(120) NOT NULL COMMENT '调度名称',
                                            `trigger_group` varchar(200) NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
                                            PRIMARY KEY (`sched_name`,`trigger_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='暂停的触发器表';

-- ----------------------------
-- Records of qrtz_paused_trigger_grps
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_scheduler_state
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_scheduler_state`;
CREATE TABLE `qrtz_scheduler_state` (
                                        `sched_name` varchar(120) NOT NULL COMMENT '调度名称',
                                        `instance_name` varchar(200) NOT NULL COMMENT '实例名称',
                                        `last_checkin_time` bigint(13) NOT NULL COMMENT '上次检查时间',
                                        `checkin_interval` bigint(13) NOT NULL COMMENT '检查间隔时间',
                                        PRIMARY KEY (`sched_name`,`instance_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='调度器状态表';

-- ----------------------------
-- Records of qrtz_scheduler_state
-- ----------------------------
INSERT INTO `qrtz_scheduler_state` VALUES ('RuoyiScheduler', 'zjh1658756586307', '1658759305821', '15000');

-- ----------------------------
-- Table structure for qrtz_simple_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simple_triggers`;
CREATE TABLE `qrtz_simple_triggers` (
                                        `sched_name` varchar(120) NOT NULL COMMENT '调度名称',
                                        `trigger_name` varchar(200) NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
                                        `trigger_group` varchar(200) NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
                                        `repeat_count` bigint(7) NOT NULL COMMENT '重复的次数统计',
                                        `repeat_interval` bigint(12) NOT NULL COMMENT '重复的间隔时间',
                                        `times_triggered` bigint(10) NOT NULL COMMENT '已经触发的次数',
                                        PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`),
                                        CONSTRAINT `qrtz_simple_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='简单触发器的信息表';

-- ----------------------------
-- Records of qrtz_simple_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_simprop_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simprop_triggers`;
CREATE TABLE `qrtz_simprop_triggers` (
                                         `sched_name` varchar(120) NOT NULL COMMENT '调度名称',
                                         `trigger_name` varchar(200) NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
                                         `trigger_group` varchar(200) NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
                                         `str_prop_1` varchar(512) DEFAULT NULL COMMENT 'String类型的trigger的第一个参数',
                                         `str_prop_2` varchar(512) DEFAULT NULL COMMENT 'String类型的trigger的第二个参数',
                                         `str_prop_3` varchar(512) DEFAULT NULL COMMENT 'String类型的trigger的第三个参数',
                                         `int_prop_1` int(11) DEFAULT NULL COMMENT 'int类型的trigger的第一个参数',
                                         `int_prop_2` int(11) DEFAULT NULL COMMENT 'int类型的trigger的第二个参数',
                                         `long_prop_1` bigint(20) DEFAULT NULL COMMENT 'long类型的trigger的第一个参数',
                                         `long_prop_2` bigint(20) DEFAULT NULL COMMENT 'long类型的trigger的第二个参数',
                                         `dec_prop_1` decimal(13,4) DEFAULT NULL COMMENT 'decimal类型的trigger的第一个参数',
                                         `dec_prop_2` decimal(13,4) DEFAULT NULL COMMENT 'decimal类型的trigger的第二个参数',
                                         `bool_prop_1` varchar(1) DEFAULT NULL COMMENT 'Boolean类型的trigger的第一个参数',
                                         `bool_prop_2` varchar(1) DEFAULT NULL COMMENT 'Boolean类型的trigger的第二个参数',
                                         PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`),
                                         CONSTRAINT `qrtz_simprop_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='同步机制的行锁表';

-- ----------------------------
-- Records of qrtz_simprop_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_triggers`;
CREATE TABLE `qrtz_triggers` (
                                 `sched_name` varchar(120) NOT NULL COMMENT '调度名称',
                                 `trigger_name` varchar(200) NOT NULL COMMENT '触发器的名字',
                                 `trigger_group` varchar(200) NOT NULL COMMENT '触发器所属组的名字',
                                 `job_name` varchar(200) NOT NULL COMMENT 'qrtz_job_details表job_name的外键',
                                 `job_group` varchar(200) NOT NULL COMMENT 'qrtz_job_details表job_group的外键',
                                 `description` varchar(250) DEFAULT NULL COMMENT '相关介绍',
                                 `next_fire_time` bigint(13) DEFAULT NULL COMMENT '上一次触发时间（毫秒）',
                                 `prev_fire_time` bigint(13) DEFAULT NULL COMMENT '下一次触发时间（默认为-1表示不触发）',
                                 `priority` int(11) DEFAULT NULL COMMENT '优先级',
                                 `trigger_state` varchar(16) NOT NULL COMMENT '触发器状态',
                                 `trigger_type` varchar(8) NOT NULL COMMENT '触发器的类型',
                                 `start_time` bigint(13) NOT NULL COMMENT '开始时间',
                                 `end_time` bigint(13) DEFAULT NULL COMMENT '结束时间',
                                 `calendar_name` varchar(200) DEFAULT NULL COMMENT '日程表名称',
                                 `misfire_instr` smallint(2) DEFAULT NULL COMMENT '补偿执行的策略',
                                 `job_data` blob COMMENT '存放持久化job对象',
                                 PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`),
                                 KEY `sched_name` (`sched_name`,`job_name`,`job_group`),
                                 CONSTRAINT `qrtz_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `job_name`, `job_group`) REFERENCES `qrtz_job_details` (`sched_name`, `job_name`, `job_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='触发器详细信息表';

-- ----------------------------
-- Records of qrtz_triggers
-- ----------------------------
INSERT INTO `qrtz_triggers` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME1', 'DEFAULT', 'TASK_CLASS_NAME1', 'DEFAULT', null, '1658756590000', '-1', '5', 'PAUSED', 'CRON', '1658756586000', '0', null, '2', '');
INSERT INTO `qrtz_triggers` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME2', 'DEFAULT', 'TASK_CLASS_NAME2', 'DEFAULT', null, '1658756595000', '-1', '5', 'PAUSED', 'CRON', '1658756586000', '0', null, '2', '');
INSERT INTO `qrtz_triggers` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME3', 'DEFAULT', 'TASK_CLASS_NAME3', 'DEFAULT', null, '1658756600000', '-1', '5', 'PAUSED', 'CRON', '1658756586000', '0', null, '2', '');

-- ----------------------------
-- Table structure for sys_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config` (
                              `config_id` int(5) NOT NULL AUTO_INCREMENT COMMENT '参数主键',
                              `config_name` varchar(100) DEFAULT '' COMMENT '参数名称',
                              `config_key` varchar(100) DEFAULT '' COMMENT '参数键名',
                              `config_value` varchar(500) DEFAULT '' COMMENT '参数键值',
                              `config_type` char(1) DEFAULT 'N' COMMENT '系统内置（Y是 N否）',
                              `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
                              `create_time` datetime DEFAULT NULL COMMENT '创建时间',
                              `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
                              `update_time` datetime DEFAULT NULL COMMENT '更新时间',
                              `remark` varchar(500) DEFAULT NULL COMMENT '备注',
                              PRIMARY KEY (`config_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='参数配置表';

-- ----------------------------
-- Records of sys_config
-- ----------------------------
INSERT INTO `sys_config` VALUES ('1', '主框架页-默认皮肤样式名称', 'sys.index.skinName', 'skin-blue', 'Y', 'admin', '2022-03-21 21:33:13', '', null, '蓝色 skin-blue、绿色 skin-green、紫色 skin-purple、红色 skin-red、黄色 skin-yellow');
INSERT INTO `sys_config` VALUES ('2', '用户管理-账号初始密码', 'sys.user.initPassword', '123456', 'Y', 'admin', '2022-03-21 21:33:13', '', null, '初始化密码 123456');
INSERT INTO `sys_config` VALUES ('3', '主框架页-侧边栏主题', 'sys.index.sideTheme', 'theme-dark', 'Y', 'admin', '2022-03-21 21:33:13', '', null, '深色主题theme-dark，浅色主题theme-light');
INSERT INTO `sys_config` VALUES ('4', '账号自助-验证码开关', 'sys.account.captchaOnOff', 'true', 'Y', 'admin', '2022-03-21 21:33:13', '', null, '是否开启验证码功能（true开启，false关闭）');
INSERT INTO `sys_config` VALUES ('5', '账号自助-是否开启用户注册功能', 'sys.account.registerUser', 'true', 'Y', 'admin', '2022-03-21 21:33:13', 'admin', '2022-05-02 18:10:14', '是否开启注册用户功能（true开启，false关闭）');

-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept` (
                            `dept_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '部门id',
                            `parent_id` bigint(20) DEFAULT '0' COMMENT '父部门id',
                            `ancestors` varchar(50) DEFAULT '' COMMENT '祖级列表',
                            `dept_name` varchar(30) DEFAULT '' COMMENT '部门名称',
                            `order_num` int(4) DEFAULT '0' COMMENT '显示顺序',
                            `leader` varchar(20) DEFAULT NULL COMMENT '负责人',
                            `phone` varchar(11) DEFAULT NULL COMMENT '联系电话',
                            `email` varchar(50) DEFAULT NULL COMMENT '邮箱',
                            `status` char(1) DEFAULT '0' COMMENT '部门状态（0正常 1停用）',
                            `del_flag` char(1) DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
                            `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
                            `create_time` datetime DEFAULT NULL COMMENT '创建时间',
                            `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
                            `update_time` datetime DEFAULT NULL COMMENT '更新时间',
                            PRIMARY KEY (`dept_id`)
) ENGINE=InnoDB AUTO_INCREMENT=110 DEFAULT CHARSET=utf8 COMMENT='部门表';

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
INSERT INTO `sys_dept` VALUES ('100', '0', '0', '科技', '0', 'liefox', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2022-03-21 21:33:12', '', null);
INSERT INTO `sys_dept` VALUES ('101', '100', '0,100', '深圳总公司', '1', 'liefox', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2022-03-21 21:33:12', '', null);
INSERT INTO `sys_dept` VALUES ('102', '100', '0,100', '长沙分公司', '2', 'liefox', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2022-03-21 21:33:12', '', null);
INSERT INTO `sys_dept` VALUES ('103', '101', '0,100,101', '研发部门', '1', 'liefox', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2022-03-21 21:33:12', '', null);
INSERT INTO `sys_dept` VALUES ('104', '101', '0,100,101', '市场部门', '2', 'liefox', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2022-03-21 21:33:12', '', null);
INSERT INTO `sys_dept` VALUES ('105', '101', '0,100,101', '测试部门', '3', 'liefox', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2022-03-21 21:33:12', '', null);
INSERT INTO `sys_dept` VALUES ('106', '101', '0,100,101', '财务部门', '4', 'liefox', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2022-03-21 21:33:12', '', null);
INSERT INTO `sys_dept` VALUES ('107', '101', '0,100,101', '运维部门', '5', 'liefox', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2022-03-21 21:33:12', '', null);
INSERT INTO `sys_dept` VALUES ('108', '102', '0,100,102', '市场部门', '1', 'liefox', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2022-03-21 21:33:12', '', null);
INSERT INTO `sys_dept` VALUES ('109', '102', '0,100,102', '财务部门', '2', 'liefox', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2022-03-21 21:33:12', '', null);

-- ----------------------------
-- Table structure for sys_dict_data
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_data`;
CREATE TABLE `sys_dict_data` (
                                 `dict_code` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '字典编码',
                                 `dict_sort` int(4) DEFAULT '0' COMMENT '字典排序',
                                 `dict_label` varchar(100) DEFAULT '' COMMENT '字典标签',
                                 `dict_value` varchar(100) DEFAULT '' COMMENT '字典键值',
                                 `dict_type` varchar(100) DEFAULT '' COMMENT '字典类型',
                                 `css_class` varchar(100) DEFAULT NULL COMMENT '样式属性（其他样式扩展）',
                                 `list_class` varchar(100) DEFAULT NULL COMMENT '表格回显样式',
                                 `is_default` char(1) DEFAULT 'N' COMMENT '是否默认（Y是 N否）',
                                 `status` char(1) DEFAULT '0' COMMENT '状态（0正常 1停用）',
                                 `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
                                 `create_time` datetime DEFAULT NULL COMMENT '创建时间',
                                 `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
                                 `update_time` datetime DEFAULT NULL COMMENT '更新时间',
                                 `remark` varchar(500) DEFAULT NULL COMMENT '备注',
                                 PRIMARY KEY (`dict_code`)
) ENGINE=InnoDB AUTO_INCREMENT=109 DEFAULT CHARSET=utf8 COMMENT='字典数据表';

-- ----------------------------
-- Records of sys_dict_data
-- ----------------------------
INSERT INTO `sys_dict_data` VALUES ('1', '1', '男', '0', 'sys_user_sex', '', '', 'Y', '0', 'admin', '2022-03-21 21:33:13', '', null, '性别男');
INSERT INTO `sys_dict_data` VALUES ('2', '2', '女', '1', 'sys_user_sex', '', '', 'N', '0', 'admin', '2022-03-21 21:33:13', '', null, '性别女');
INSERT INTO `sys_dict_data` VALUES ('3', '3', '未知', '2', 'sys_user_sex', '', '', 'N', '0', 'admin', '2022-03-21 21:33:13', '', null, '性别未知');
INSERT INTO `sys_dict_data` VALUES ('4', '1', '显示', '0', 'sys_show_hide', '', 'primary', 'Y', '0', 'admin', '2022-03-21 21:33:13', '', null, '显示菜单');
INSERT INTO `sys_dict_data` VALUES ('5', '2', '隐藏', '1', 'sys_show_hide', '', 'danger', 'N', '0', 'admin', '2022-03-21 21:33:13', '', null, '隐藏菜单');
INSERT INTO `sys_dict_data` VALUES ('6', '1', '正常', '0', 'sys_normal_disable', '', 'primary', 'Y', '0', 'admin', '2022-03-21 21:33:13', '', null, '正常状态');
INSERT INTO `sys_dict_data` VALUES ('7', '2', '停用', '1', 'sys_normal_disable', '', 'danger', 'N', '0', 'admin', '2022-03-21 21:33:13', '', null, '停用状态');
INSERT INTO `sys_dict_data` VALUES ('8', '1', '正常', '0', 'sys_job_status', '', 'primary', 'Y', '0', 'admin', '2022-03-21 21:33:13', '', null, '正常状态');
INSERT INTO `sys_dict_data` VALUES ('9', '2', '暂停', '1', 'sys_job_status', '', 'danger', 'N', '0', 'admin', '2022-03-21 21:33:13', '', null, '停用状态');
INSERT INTO `sys_dict_data` VALUES ('10', '1', '默认', 'DEFAULT', 'sys_job_group', '', '', 'Y', '0', 'admin', '2022-03-21 21:33:13', '', null, '默认分组');
INSERT INTO `sys_dict_data` VALUES ('11', '2', '系统', 'SYSTEM', 'sys_job_group', '', '', 'N', '0', 'admin', '2022-03-21 21:33:13', '', null, '系统分组');
INSERT INTO `sys_dict_data` VALUES ('12', '1', '是', 'Y', 'sys_yes_no', '', 'primary', 'Y', '0', 'admin', '2022-03-21 21:33:13', '', null, '系统默认是');
INSERT INTO `sys_dict_data` VALUES ('13', '2', '否', 'N', 'sys_yes_no', '', 'danger', 'N', '0', 'admin', '2022-03-21 21:33:13', '', null, '系统默认否');
INSERT INTO `sys_dict_data` VALUES ('14', '1', '通知', '1', 'sys_notice_type', '', 'warning', 'Y', '0', 'admin', '2022-03-21 21:33:13', '', null, '通知');
INSERT INTO `sys_dict_data` VALUES ('15', '2', '公告', '2', 'sys_notice_type', '', 'success', 'N', '0', 'admin', '2022-03-21 21:33:13', '', null, '公告');
INSERT INTO `sys_dict_data` VALUES ('16', '1', '正常', '0', 'sys_notice_status', '', 'primary', 'Y', '0', 'admin', '2022-03-21 21:33:13', '', null, '正常状态');
INSERT INTO `sys_dict_data` VALUES ('17', '2', '关闭', '1', 'sys_notice_status', '', 'danger', 'N', '0', 'admin', '2022-03-21 21:33:13', '', null, '关闭状态');
INSERT INTO `sys_dict_data` VALUES ('18', '1', '新增', '1', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2022-03-21 21:33:13', '', null, '新增操作');
INSERT INTO `sys_dict_data` VALUES ('19', '2', '修改', '2', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2022-03-21 21:33:13', '', null, '修改操作');
INSERT INTO `sys_dict_data` VALUES ('20', '3', '删除', '3', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2022-03-21 21:33:13', '', null, '删除操作');
INSERT INTO `sys_dict_data` VALUES ('21', '4', '授权', '4', 'sys_oper_type', '', 'primary', 'N', '0', 'admin', '2022-03-21 21:33:13', '', null, '授权操作');
INSERT INTO `sys_dict_data` VALUES ('22', '5', '导出', '5', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2022-03-21 21:33:13', '', null, '导出操作');
INSERT INTO `sys_dict_data` VALUES ('23', '6', '导入', '6', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2022-03-21 21:33:13', '', null, '导入操作');
INSERT INTO `sys_dict_data` VALUES ('24', '7', '强退', '7', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2022-03-21 21:33:13', '', null, '强退操作');
INSERT INTO `sys_dict_data` VALUES ('25', '8', '生成代码', '8', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2022-03-21 21:33:13', '', null, '生成操作');
INSERT INTO `sys_dict_data` VALUES ('26', '9', '清空数据', '9', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2022-03-21 21:33:13', '', null, '清空操作');
INSERT INTO `sys_dict_data` VALUES ('27', '1', '成功', '0', 'sys_common_status', '', 'primary', 'N', '0', 'admin', '2022-03-21 21:33:13', '', null, '正常状态');
INSERT INTO `sys_dict_data` VALUES ('28', '2', '失败', '1', 'sys_common_status', '', 'danger', 'N', '0', 'admin', '2022-03-21 21:33:13', '', null, '停用状态');
INSERT INTO `sys_dict_data` VALUES ('100', '0', 'Java', 'Java', 'book_type', null, 'success', 'N', '0', 'admin', '2022-03-22 09:13:22', '', null, null);
INSERT INTO `sys_dict_data` VALUES ('101', '0', 'Vue', 'Vue', 'book_type', null, 'success', 'N', '0', 'admin', '2022-03-22 09:13:39', '', null, null);
INSERT INTO `sys_dict_data` VALUES ('102', '0', '生活', '生活', 'book_type', null, 'success', 'N', '0', 'admin', '2022-03-22 09:13:55', 'admin', '2022-03-22 09:14:01', null);
INSERT INTO `sys_dict_data` VALUES ('103', '0', '待审核', '0', 'book_audit', null, 'warning', 'N', '0', 'admin', '2022-05-02 17:03:53', 'admin', '2022-05-02 18:30:21', null);
INSERT INTO `sys_dict_data` VALUES ('104', '0', '审核成功', '1', 'book_audit', null, 'success', 'N', '0', 'admin', '2022-05-02 17:04:03', 'admin', '2022-05-02 18:30:29', null);
INSERT INTO `sys_dict_data` VALUES ('105', '0', '审核失败', '2', 'book_audit', null, 'danger', 'N', '0', 'admin', '2022-05-02 17:04:13', 'admin', '2022-05-02 18:30:35', null);
INSERT INTO `sys_dict_data` VALUES ('106', '0', '期刊', '1', 'ppt_type', null, 'default', 'N', '0', 'admin', '2022-07-24 18:23:22', '', null, null);
INSERT INTO `sys_dict_data` VALUES ('107', '0', '文章', '2', 'ppt_type', null, 'default', 'N', '0', 'admin', '2022-07-24 18:23:37', '', null, null);
INSERT INTO `sys_dict_data` VALUES ('108', '0', '第三方', '3', 'ppt_type', null, 'default', 'N', '0', 'admin', '2022-07-24 18:23:45', '', null, null);

-- ----------------------------
-- Table structure for sys_dict_type
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_type`;
CREATE TABLE `sys_dict_type` (
                                 `dict_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '字典主键',
                                 `dict_name` varchar(100) DEFAULT '' COMMENT '字典名称',
                                 `dict_type` varchar(100) DEFAULT '' COMMENT '字典类型',
                                 `status` char(1) DEFAULT '0' COMMENT '状态（0正常 1停用）',
                                 `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
                                 `create_time` datetime DEFAULT NULL COMMENT '创建时间',
                                 `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
                                 `update_time` datetime DEFAULT NULL COMMENT '更新时间',
                                 `remark` varchar(500) DEFAULT NULL COMMENT '备注',
                                 PRIMARY KEY (`dict_id`),
                                 UNIQUE KEY `dict_type` (`dict_type`)
) ENGINE=InnoDB AUTO_INCREMENT=103 DEFAULT CHARSET=utf8 COMMENT='字典类型表';

-- ----------------------------
-- Records of sys_dict_type
-- ----------------------------
INSERT INTO `sys_dict_type` VALUES ('1', '用户性别', 'sys_user_sex', '0', 'admin', '2022-03-21 21:33:13', '', null, '用户性别列表');
INSERT INTO `sys_dict_type` VALUES ('2', '菜单状态', 'sys_show_hide', '0', 'admin', '2022-03-21 21:33:13', '', null, '菜单状态列表');
INSERT INTO `sys_dict_type` VALUES ('3', '系统开关', 'sys_normal_disable', '0', 'admin', '2022-03-21 21:33:13', '', null, '系统开关列表');
INSERT INTO `sys_dict_type` VALUES ('4', '任务状态', 'sys_job_status', '0', 'admin', '2022-03-21 21:33:13', '', null, '任务状态列表');
INSERT INTO `sys_dict_type` VALUES ('5', '任务分组', 'sys_job_group', '0', 'admin', '2022-03-21 21:33:13', '', null, '任务分组列表');
INSERT INTO `sys_dict_type` VALUES ('6', '系统是否', 'sys_yes_no', '0', 'admin', '2022-03-21 21:33:13', '', null, '系统是否列表');
INSERT INTO `sys_dict_type` VALUES ('7', '通知类型', 'sys_notice_type', '0', 'admin', '2022-03-21 21:33:13', '', null, '通知类型列表');
INSERT INTO `sys_dict_type` VALUES ('8', '通知状态', 'sys_notice_status', '0', 'admin', '2022-03-21 21:33:13', '', null, '通知状态列表');
INSERT INTO `sys_dict_type` VALUES ('9', '操作类型', 'sys_oper_type', '0', 'admin', '2022-03-21 21:33:13', '', null, '操作类型列表');
INSERT INTO `sys_dict_type` VALUES ('10', '系统状态', 'sys_common_status', '0', 'admin', '2022-03-21 21:33:13', '', null, '登录状态列表');
INSERT INTO `sys_dict_type` VALUES ('100', '期刊类型', 'book_type', '0', 'admin', '2022-03-22 09:12:42', '', null, null);
INSERT INTO `sys_dict_type` VALUES ('101', '期刊审核状态', 'book_audit', '0', 'admin', '2022-05-02 17:03:26', '', null, null);
INSERT INTO `sys_dict_type` VALUES ('102', '幻灯片类型', 'ppt_type', '0', 'admin', '2022-07-24 18:22:44', 'admin', '2022-07-24 18:22:56', null);

-- ----------------------------
-- Table structure for sys_job
-- ----------------------------
DROP TABLE IF EXISTS `sys_job`;
CREATE TABLE `sys_job` (
                           `job_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '任务ID',
                           `job_name` varchar(64) NOT NULL DEFAULT '' COMMENT '任务名称',
                           `job_group` varchar(64) NOT NULL DEFAULT 'DEFAULT' COMMENT '任务组名',
                           `invoke_target` varchar(500) NOT NULL COMMENT '调用目标字符串',
                           `cron_expression` varchar(255) DEFAULT '' COMMENT 'cron执行表达式',
                           `misfire_policy` varchar(20) DEFAULT '3' COMMENT '计划执行错误策略（1立即执行 2执行一次 3放弃执行）',
                           `concurrent` char(1) DEFAULT '1' COMMENT '是否并发执行（0允许 1禁止）',
                           `status` char(1) DEFAULT '0' COMMENT '状态（0正常 1暂停）',
                           `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
                           `create_time` datetime DEFAULT NULL COMMENT '创建时间',
                           `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
                           `update_time` datetime DEFAULT NULL COMMENT '更新时间',
                           `remark` varchar(500) DEFAULT '' COMMENT '备注信息',
                           PRIMARY KEY (`job_id`,`job_name`,`job_group`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='定时任务调度表';

-- ----------------------------
-- Records of sys_job
-- ----------------------------
INSERT INTO `sys_job` VALUES ('1', '系统默认（无参）', 'DEFAULT', 'ryTask.ryNoParams', '0/10 * * * * ?', '3', '1', '1', 'admin', '2022-03-21 21:33:13', '', null, '');
INSERT INTO `sys_job` VALUES ('2', '系统默认（有参）', 'DEFAULT', 'ryTask.ryParams(\'ry\')', '0/15 * * * * ?', '3', '1', '1', 'admin', '2022-03-21 21:33:13', '', null, '');
INSERT INTO `sys_job` VALUES ('3', '系统默认（多参）', 'DEFAULT', 'ryTask.ryMultipleParams(\'ry\', true, 2000L, 316.50D, 100)', '0/20 * * * * ?', '3', '1', '1', 'admin', '2022-03-21 21:33:13', '', null, '');

-- ----------------------------
-- Table structure for sys_job_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_job_log`;
CREATE TABLE `sys_job_log` (
                               `job_log_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '任务日志ID',
                               `job_name` varchar(64) NOT NULL COMMENT '任务名称',
                               `job_group` varchar(64) NOT NULL COMMENT '任务组名',
                               `invoke_target` varchar(500) NOT NULL COMMENT '调用目标字符串',
                               `job_message` varchar(500) DEFAULT NULL COMMENT '日志信息',
                               `status` char(1) DEFAULT '0' COMMENT '执行状态（0正常 1失败）',
                               `exception_info` varchar(2000) DEFAULT '' COMMENT '异常信息',
                               `create_time` datetime DEFAULT NULL COMMENT '创建时间',
                               PRIMARY KEY (`job_log_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='定时任务调度日志表';

-- ----------------------------
-- Records of sys_job_log
-- ----------------------------

-- ----------------------------
-- Table structure for sys_logininfor
-- ----------------------------
DROP TABLE IF EXISTS `sys_logininfor`;
CREATE TABLE `sys_logininfor` (
                                  `info_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '访问ID',
                                  `user_name` varchar(50) DEFAULT '' COMMENT '用户账号',
                                  `ipaddr` varchar(128) DEFAULT '' COMMENT '登录IP地址',
                                  `login_location` varchar(255) DEFAULT '' COMMENT '登录地点',
                                  `browser` varchar(50) DEFAULT '' COMMENT '浏览器类型',
                                  `os` varchar(50) DEFAULT '' COMMENT '操作系统',
                                  `status` char(1) DEFAULT '0' COMMENT '登录状态（0成功 1失败）',
                                  `msg` varchar(255) DEFAULT '' COMMENT '提示消息',
                                  `login_time` datetime DEFAULT NULL COMMENT '访问时间',
                                  PRIMARY KEY (`info_id`)
) ENGINE=InnoDB AUTO_INCREMENT=189 DEFAULT CHARSET=utf8 COMMENT='系统访问记录';

-- ----------------------------
-- Records of sys_logininfor
-- ----------------------------
INSERT INTO `sys_logininfor` VALUES ('100', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '1', '用户不存在/密码错误', '2022-03-21 22:00:29');
INSERT INTO `sys_logininfor` VALUES ('101', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-21 22:00:57');
INSERT INTO `sys_logininfor` VALUES ('102', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '1', '用户不存在/密码错误', '2022-03-22 09:06:33');
INSERT INTO `sys_logininfor` VALUES ('103', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-22 09:06:43');
INSERT INTO `sys_logininfor` VALUES ('104', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '1', '用户不存在/密码错误', '2022-03-22 09:54:22');
INSERT INTO `sys_logininfor` VALUES ('105', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '1', '验证码错误', '2022-03-22 09:54:28');
INSERT INTO `sys_logininfor` VALUES ('106', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-22 09:54:34');
INSERT INTO `sys_logininfor` VALUES ('107', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '1', '用户不存在/密码错误', '2022-03-22 10:48:38');
INSERT INTO `sys_logininfor` VALUES ('108', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '1', '验证码错误', '2022-03-22 10:48:44');
INSERT INTO `sys_logininfor` VALUES ('109', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-22 10:48:49');
INSERT INTO `sys_logininfor` VALUES ('110', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '退出成功', '2022-03-22 10:52:57');
INSERT INTO `sys_logininfor` VALUES ('111', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-22 10:53:05');
INSERT INTO `sys_logininfor` VALUES ('112', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '1', '验证码错误', '2022-03-22 13:01:09');
INSERT INTO `sys_logininfor` VALUES ('113', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-22 13:01:14');
INSERT INTO `sys_logininfor` VALUES ('114', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-22 13:01:53');
INSERT INTO `sys_logininfor` VALUES ('115', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '1', '验证码错误', '2022-03-22 13:01:58');
INSERT INTO `sys_logininfor` VALUES ('116', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-22 13:02:05');
INSERT INTO `sys_logininfor` VALUES ('117', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '1', '验证码已失效', '2022-03-22 13:05:31');
INSERT INTO `sys_logininfor` VALUES ('118', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-22 13:05:37');
INSERT INTO `sys_logininfor` VALUES ('119', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-22 15:36:08');
INSERT INTO `sys_logininfor` VALUES ('120', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-04-25 21:03:19');
INSERT INTO `sys_logininfor` VALUES ('121', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-04-25 22:17:29');
INSERT INTO `sys_logininfor` VALUES ('122', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-04-25 22:49:20');
INSERT INTO `sys_logininfor` VALUES ('123', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-04-25 23:52:52');
INSERT INTO `sys_logininfor` VALUES ('124', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-04-25 23:59:28');
INSERT INTO `sys_logininfor` VALUES ('125', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-04-26 00:05:47');
INSERT INTO `sys_logininfor` VALUES ('126', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-04-26 00:09:37');
INSERT INTO `sys_logininfor` VALUES ('127', 'admin', '127.0.0.1', '内网IP', 'Chrome 64', 'Windows 8', '1', '验证码已失效', '2022-04-26 00:12:19');
INSERT INTO `sys_logininfor` VALUES ('128', 'admin', '127.0.0.1', '内网IP', 'Chrome 64', 'Windows 8', '1', '用户不存在/密码错误', '2022-04-26 00:12:23');
INSERT INTO `sys_logininfor` VALUES ('129', 'admin', '127.0.0.1', '内网IP', 'Chrome 64', 'Windows 8', '1', '用户不存在/密码错误', '2022-04-26 00:12:33');
INSERT INTO `sys_logininfor` VALUES ('130', 'admin', '127.0.0.1', '内网IP', 'Chrome 64', 'Windows 8', '1', '用户不存在/密码错误', '2022-04-26 00:12:47');
INSERT INTO `sys_logininfor` VALUES ('131', 'admin', '127.0.0.1', '内网IP', 'Chrome 64', 'Windows 8', '1', '用户不存在/密码错误', '2022-04-26 00:13:02');
INSERT INTO `sys_logininfor` VALUES ('132', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-04-26 00:13:20');
INSERT INTO `sys_logininfor` VALUES ('133', 'admin', '127.0.0.1', '内网IP', 'Chrome 64', 'Windows 8', '1', '验证码错误', '2022-04-26 00:13:45');
INSERT INTO `sys_logininfor` VALUES ('134', 'admin', '127.0.0.1', '内网IP', 'Chrome 64', 'Windows 8', '0', '登录成功', '2022-04-26 00:13:50');
INSERT INTO `sys_logininfor` VALUES ('135', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-04-26 00:14:54');
INSERT INTO `sys_logininfor` VALUES ('136', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-04-27 11:27:19');
INSERT INTO `sys_logininfor` VALUES ('137', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-05-02 14:45:26');
INSERT INTO `sys_logininfor` VALUES ('138', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2022-05-02 14:53:36');
INSERT INTO `sys_logininfor` VALUES ('139', 'admin', '127.0.0.1', '内网IP', 'Chrome 64', 'Windows 8', '1', '用户不存在/密码错误', '2022-05-02 14:56:48');
INSERT INTO `sys_logininfor` VALUES ('140', 'admin', '127.0.0.1', '内网IP', 'Chrome 64', 'Windows 8', '1', '用户不存在/密码错误', '2022-05-02 14:57:01');
INSERT INTO `sys_logininfor` VALUES ('141', 'admin', '127.0.0.1', '内网IP', 'Chrome 64', 'Windows 8', '1', '用户不存在/密码错误', '2022-05-02 14:57:19');
INSERT INTO `sys_logininfor` VALUES ('142', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-05-02 14:57:35');
INSERT INTO `sys_logininfor` VALUES ('143', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2022-05-02 18:07:56');
INSERT INTO `sys_logininfor` VALUES ('144', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-05-02 18:09:50');
INSERT INTO `sys_logininfor` VALUES ('145', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2022-05-02 18:10:19');
INSERT INTO `sys_logininfor` VALUES ('146', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '验证码错误', '2022-05-02 18:19:26');
INSERT INTO `sys_logininfor` VALUES ('147', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-05-02 18:19:30');
INSERT INTO `sys_logininfor` VALUES ('148', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-05-02 19:04:28');
INSERT INTO `sys_logininfor` VALUES ('149', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2022-05-02 19:39:10');
INSERT INTO `sys_logininfor` VALUES ('150', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '验证码已失效', '2022-05-02 19:42:35');
INSERT INTO `sys_logininfor` VALUES ('151', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-05-02 19:42:39');
INSERT INTO `sys_logininfor` VALUES ('152', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2022-05-02 19:52:22');
INSERT INTO `sys_logininfor` VALUES ('153', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '验证码已失效', '2022-05-02 19:58:16');
INSERT INTO `sys_logininfor` VALUES ('154', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-05-02 19:58:21');
INSERT INTO `sys_logininfor` VALUES ('155', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-05-02 20:04:51');
INSERT INTO `sys_logininfor` VALUES ('156', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-05-03 07:57:26');
INSERT INTO `sys_logininfor` VALUES ('157', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2022-05-03 07:57:48');
INSERT INTO `sys_logininfor` VALUES ('158', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-05-03 07:57:56');
INSERT INTO `sys_logininfor` VALUES ('159', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2022-05-03 07:59:40');
INSERT INTO `sys_logininfor` VALUES ('160', 'dev', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '注册成功', '2022-05-03 08:00:06');
INSERT INTO `sys_logininfor` VALUES ('161', 'dev', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-05-03 08:00:34');
INSERT INTO `sys_logininfor` VALUES ('162', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '验证码错误', '2022-07-24 15:39:24');
INSERT INTO `sys_logininfor` VALUES ('163', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '验证码错误', '2022-07-24 15:39:28');
INSERT INTO `sys_logininfor` VALUES ('164', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '验证码错误', '2022-07-24 15:39:32');
INSERT INTO `sys_logininfor` VALUES ('165', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-07-24 15:39:39');
INSERT INTO `sys_logininfor` VALUES ('166', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2022-07-24 16:22:27');
INSERT INTO `sys_logininfor` VALUES ('167', 'zjh', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '注册成功', '2022-07-24 16:23:06');
INSERT INTO `sys_logininfor` VALUES ('168', 'zjh', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-07-24 16:23:20');
INSERT INTO `sys_logininfor` VALUES ('169', 'zjh', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2022-07-24 16:23:38');
INSERT INTO `sys_logininfor` VALUES ('170', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-07-24 16:23:43');
INSERT INTO `sys_logininfor` VALUES ('171', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2022-07-24 16:31:10');
INSERT INTO `sys_logininfor` VALUES ('172', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '验证码错误', '2022-07-24 16:32:34');
INSERT INTO `sys_logininfor` VALUES ('173', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '验证码错误', '2022-07-24 16:32:39');
INSERT INTO `sys_logininfor` VALUES ('174', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-07-24 16:32:42');
INSERT INTO `sys_logininfor` VALUES ('175', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2022-07-24 16:33:26');
INSERT INTO `sys_logininfor` VALUES ('176', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '验证码已失效', '2022-07-24 16:53:59');
INSERT INTO `sys_logininfor` VALUES ('177', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-07-24 16:54:02');
INSERT INTO `sys_logininfor` VALUES ('178', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2022-07-24 17:00:12');
INSERT INTO `sys_logininfor` VALUES ('179', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-07-24 17:28:18');
INSERT INTO `sys_logininfor` VALUES ('180', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2022-07-24 17:28:37');
INSERT INTO `sys_logininfor` VALUES ('181', '测试', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '注册成功', '2022-07-24 17:29:39');
INSERT INTO `sys_logininfor` VALUES ('182', '测试', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-07-24 17:29:51');
INSERT INTO `sys_logininfor` VALUES ('183', '测试', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2022-07-24 17:34:23');
INSERT INTO `sys_logininfor` VALUES ('184', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-07-24 17:34:42');
INSERT INTO `sys_logininfor` VALUES ('185', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-07-24 18:17:29');
INSERT INTO `sys_logininfor` VALUES ('186', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-07-24 19:07:06');
INSERT INTO `sys_logininfor` VALUES ('187', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-07-25 10:57:03');
INSERT INTO `sys_logininfor` VALUES ('188', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-07-25 12:35:57');

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu` (
                            `menu_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
                            `menu_name` varchar(50) NOT NULL COMMENT '菜单名称',
                            `parent_id` bigint(20) DEFAULT '0' COMMENT '父菜单ID',
                            `order_num` int(4) DEFAULT '0' COMMENT '显示顺序',
                            `path` varchar(200) DEFAULT '' COMMENT '路由地址',
                            `component` varchar(255) DEFAULT NULL COMMENT '组件路径',
                            `query` varchar(255) DEFAULT NULL COMMENT '路由参数',
                            `is_frame` int(1) DEFAULT '1' COMMENT '是否为外链（0是 1否）',
                            `is_cache` int(1) DEFAULT '0' COMMENT '是否缓存（0缓存 1不缓存）',
                            `menu_type` char(1) DEFAULT '' COMMENT '菜单类型（M目录 C菜单 F按钮）',
                            `visible` char(1) DEFAULT '0' COMMENT '菜单状态（0显示 1隐藏）',
                            `status` char(1) DEFAULT '0' COMMENT '菜单状态（0正常 1停用）',
                            `perms` varchar(100) DEFAULT NULL COMMENT '权限标识',
                            `icon` varchar(100) DEFAULT '#' COMMENT '菜单图标',
                            `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
                            `create_time` datetime DEFAULT NULL COMMENT '创建时间',
                            `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
                            `update_time` datetime DEFAULT NULL COMMENT '更新时间',
                            `remark` varchar(500) DEFAULT '' COMMENT '备注',
                            PRIMARY KEY (`menu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2036 DEFAULT CHARSET=utf8 COMMENT='菜单权限表';

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES ('1', '系统管理', '0', '1', 'system', null, '', '1', '0', 'M', '0', '0', '', 'system', 'admin', '2022-03-21 21:33:12', '', null, '系统管理目录');
INSERT INTO `sys_menu` VALUES ('2', '系统监控', '0', '2', 'monitor', null, '', '1', '0', 'M', '0', '0', '', 'monitor', 'admin', '2022-03-21 21:33:12', '', null, '系统监控目录');
INSERT INTO `sys_menu` VALUES ('3', '系统工具', '0', '3', 'tool', null, '', '1', '0', 'M', '0', '0', '', 'tool', 'admin', '2022-03-21 21:33:12', '', null, '系统工具目录');
INSERT INTO `sys_menu` VALUES ('4', 'liefox官网', '0', '4', 'http://cxq21.gitee.io', null, '', '0', '0', 'M', '0', '0', '', 'guide', 'admin', '2022-03-21 21:33:12', '', null, 'liefox官网地址');
INSERT INTO `sys_menu` VALUES ('100', '用户管理', '1', '1', 'user', 'system/user/index', '', '1', '0', 'C', '0', '0', 'system:user:list', 'user', 'admin', '2022-03-21 21:33:12', '', null, '用户管理菜单');
INSERT INTO `sys_menu` VALUES ('101', '角色管理', '1', '2', 'role', 'system/role/index', '', '1', '0', 'C', '0', '0', 'system:role:list', 'peoples', 'admin', '2022-03-21 21:33:12', '', null, '角色管理菜单');
INSERT INTO `sys_menu` VALUES ('102', '菜单管理', '1', '3', 'menu', 'system/menu/index', '', '1', '0', 'C', '0', '0', 'system:menu:list', 'tree-table', 'admin', '2022-03-21 21:33:12', '', null, '菜单管理菜单');
INSERT INTO `sys_menu` VALUES ('103', '部门管理', '1', '4', 'dept', 'system/dept/index', '', '1', '0', 'C', '0', '0', 'system:dept:list', 'tree', 'admin', '2022-03-21 21:33:12', '', null, '部门管理菜单');
INSERT INTO `sys_menu` VALUES ('104', '岗位管理', '1', '5', 'post', 'system/post/index', '', '1', '0', 'C', '0', '0', 'system:post:list', 'post', 'admin', '2022-03-21 21:33:12', '', null, '岗位管理菜单');
INSERT INTO `sys_menu` VALUES ('105', '字典管理', '1', '6', 'dict', 'system/dict/index', '', '1', '0', 'C', '0', '0', 'system:dict:list', 'dict', 'admin', '2022-03-21 21:33:12', '', null, '字典管理菜单');
INSERT INTO `sys_menu` VALUES ('106', '参数设置', '1', '7', 'config', 'system/config/index', '', '1', '0', 'C', '0', '0', 'system:config:list', 'edit', 'admin', '2022-03-21 21:33:12', '', null, '参数设置菜单');
INSERT INTO `sys_menu` VALUES ('107', '通知公告', '1', '8', 'notice', 'system/notice/index', '', '1', '0', 'C', '0', '0', 'system:notice:list', 'message', 'admin', '2022-03-21 21:33:12', '', null, '通知公告菜单');
INSERT INTO `sys_menu` VALUES ('108', '日志管理', '1', '9', 'log', '', '', '1', '0', 'M', '0', '0', '', 'log', 'admin', '2022-03-21 21:33:12', '', null, '日志管理菜单');
INSERT INTO `sys_menu` VALUES ('109', '在线用户', '2', '1', 'online', 'monitor/online/index', '', '1', '0', 'C', '0', '0', 'monitor:online:list', 'online', 'admin', '2022-03-21 21:33:12', '', null, '在线用户菜单');
INSERT INTO `sys_menu` VALUES ('110', '定时任务', '2', '2', 'job', 'monitor/job/index', '', '1', '0', 'C', '0', '0', 'monitor:job:list', 'job', 'admin', '2022-03-21 21:33:12', '', null, '定时任务菜单');
INSERT INTO `sys_menu` VALUES ('111', '数据监控', '2', '3', 'druid', 'monitor/druid/index', '', '1', '0', 'C', '0', '0', 'monitor:druid:list', 'druid', 'admin', '2022-03-21 21:33:12', '', null, '数据监控菜单');
INSERT INTO `sys_menu` VALUES ('112', '服务监控', '2', '4', 'server', 'monitor/server/index', '', '1', '0', 'C', '0', '0', 'monitor:server:list', 'server', 'admin', '2022-03-21 21:33:12', '', null, '服务监控菜单');
INSERT INTO `sys_menu` VALUES ('113', '缓存监控', '2', '5', 'cache', 'monitor/cache/index', '', '1', '0', 'C', '0', '0', 'monitor:cache:list', 'redis', 'admin', '2022-03-21 21:33:12', '', null, '缓存监控菜单');
INSERT INTO `sys_menu` VALUES ('114', '表单构建', '3', '1', 'build', 'tool/build/index', '', '1', '0', 'C', '0', '0', 'tool:build:list', 'build', 'admin', '2022-03-21 21:33:12', '', null, '表单构建菜单');
INSERT INTO `sys_menu` VALUES ('115', '代码生成', '3', '2', 'gen', 'tool/gen/index', '', '1', '0', 'C', '0', '0', 'tool:gen:list', 'code', 'admin', '2022-03-21 21:33:12', '', null, '代码生成菜单');
INSERT INTO `sys_menu` VALUES ('116', '系统接口', '3', '3', 'swagger', 'tool/swagger/index', '', '1', '0', 'C', '0', '0', 'tool:swagger:list', 'swagger', 'admin', '2022-03-21 21:33:12', '', null, '系统接口菜单');
INSERT INTO `sys_menu` VALUES ('500', '操作日志', '108', '1', 'operlog', 'monitor/operlog/index', '', '1', '0', 'C', '0', '0', 'monitor:operlog:list', 'form', 'admin', '2022-03-21 21:33:12', '', null, '操作日志菜单');
INSERT INTO `sys_menu` VALUES ('501', '登录日志', '108', '2', 'logininfor', 'monitor/logininfor/index', '', '1', '0', 'C', '0', '0', 'monitor:logininfor:list', 'logininfor', 'admin', '2022-03-21 21:33:12', '', null, '登录日志菜单');
INSERT INTO `sys_menu` VALUES ('1001', '用户查询', '100', '1', '', '', '', '1', '0', 'F', '0', '0', 'system:user:query', '#', 'admin', '2022-03-21 21:33:12', '', null, '');
INSERT INTO `sys_menu` VALUES ('1002', '用户新增', '100', '2', '', '', '', '1', '0', 'F', '0', '0', 'system:user:add', '#', 'admin', '2022-03-21 21:33:12', '', null, '');
INSERT INTO `sys_menu` VALUES ('1003', '用户修改', '100', '3', '', '', '', '1', '0', 'F', '0', '0', 'system:user:edit', '#', 'admin', '2022-03-21 21:33:12', '', null, '');
INSERT INTO `sys_menu` VALUES ('1004', '用户删除', '100', '4', '', '', '', '1', '0', 'F', '0', '0', 'system:user:remove', '#', 'admin', '2022-03-21 21:33:12', '', null, '');
INSERT INTO `sys_menu` VALUES ('1005', '用户导出', '100', '5', '', '', '', '1', '0', 'F', '0', '0', 'system:user:export', '#', 'admin', '2022-03-21 21:33:12', '', null, '');
INSERT INTO `sys_menu` VALUES ('1006', '用户导入', '100', '6', '', '', '', '1', '0', 'F', '0', '0', 'system:user:import', '#', 'admin', '2022-03-21 21:33:12', '', null, '');
INSERT INTO `sys_menu` VALUES ('1007', '重置密码', '100', '7', '', '', '', '1', '0', 'F', '0', '0', 'system:user:resetPwd', '#', 'admin', '2022-03-21 21:33:12', '', null, '');
INSERT INTO `sys_menu` VALUES ('1008', '角色查询', '101', '1', '', '', '', '1', '0', 'F', '0', '0', 'system:role:query', '#', 'admin', '2022-03-21 21:33:12', '', null, '');
INSERT INTO `sys_menu` VALUES ('1009', '角色新增', '101', '2', '', '', '', '1', '0', 'F', '0', '0', 'system:role:add', '#', 'admin', '2022-03-21 21:33:12', '', null, '');
INSERT INTO `sys_menu` VALUES ('1010', '角色修改', '101', '3', '', '', '', '1', '0', 'F', '0', '0', 'system:role:edit', '#', 'admin', '2022-03-21 21:33:12', '', null, '');
INSERT INTO `sys_menu` VALUES ('1011', '角色删除', '101', '4', '', '', '', '1', '0', 'F', '0', '0', 'system:role:remove', '#', 'admin', '2022-03-21 21:33:12', '', null, '');
INSERT INTO `sys_menu` VALUES ('1012', '角色导出', '101', '5', '', '', '', '1', '0', 'F', '0', '0', 'system:role:export', '#', 'admin', '2022-03-21 21:33:12', '', null, '');
INSERT INTO `sys_menu` VALUES ('1013', '菜单查询', '102', '1', '', '', '', '1', '0', 'F', '0', '0', 'system:menu:query', '#', 'admin', '2022-03-21 21:33:12', '', null, '');
INSERT INTO `sys_menu` VALUES ('1014', '菜单新增', '102', '2', '', '', '', '1', '0', 'F', '0', '0', 'system:menu:add', '#', 'admin', '2022-03-21 21:33:12', '', null, '');
INSERT INTO `sys_menu` VALUES ('1015', '菜单修改', '102', '3', '', '', '', '1', '0', 'F', '0', '0', 'system:menu:edit', '#', 'admin', '2022-03-21 21:33:12', '', null, '');
INSERT INTO `sys_menu` VALUES ('1016', '菜单删除', '102', '4', '', '', '', '1', '0', 'F', '0', '0', 'system:menu:remove', '#', 'admin', '2022-03-21 21:33:12', '', null, '');
INSERT INTO `sys_menu` VALUES ('1017', '部门查询', '103', '1', '', '', '', '1', '0', 'F', '0', '0', 'system:dept:query', '#', 'admin', '2022-03-21 21:33:12', '', null, '');
INSERT INTO `sys_menu` VALUES ('1018', '部门新增', '103', '2', '', '', '', '1', '0', 'F', '0', '0', 'system:dept:add', '#', 'admin', '2022-03-21 21:33:12', '', null, '');
INSERT INTO `sys_menu` VALUES ('1019', '部门修改', '103', '3', '', '', '', '1', '0', 'F', '0', '0', 'system:dept:edit', '#', 'admin', '2022-03-21 21:33:12', '', null, '');
INSERT INTO `sys_menu` VALUES ('1020', '部门删除', '103', '4', '', '', '', '1', '0', 'F', '0', '0', 'system:dept:remove', '#', 'admin', '2022-03-21 21:33:12', '', null, '');
INSERT INTO `sys_menu` VALUES ('1021', '岗位查询', '104', '1', '', '', '', '1', '0', 'F', '0', '0', 'system:post:query', '#', 'admin', '2022-03-21 21:33:12', '', null, '');
INSERT INTO `sys_menu` VALUES ('1022', '岗位新增', '104', '2', '', '', '', '1', '0', 'F', '0', '0', 'system:post:add', '#', 'admin', '2022-03-21 21:33:12', '', null, '');
INSERT INTO `sys_menu` VALUES ('1023', '岗位修改', '104', '3', '', '', '', '1', '0', 'F', '0', '0', 'system:post:edit', '#', 'admin', '2022-03-21 21:33:12', '', null, '');
INSERT INTO `sys_menu` VALUES ('1024', '岗位删除', '104', '4', '', '', '', '1', '0', 'F', '0', '0', 'system:post:remove', '#', 'admin', '2022-03-21 21:33:12', '', null, '');
INSERT INTO `sys_menu` VALUES ('1025', '岗位导出', '104', '5', '', '', '', '1', '0', 'F', '0', '0', 'system:post:export', '#', 'admin', '2022-03-21 21:33:12', '', null, '');
INSERT INTO `sys_menu` VALUES ('1026', '字典查询', '105', '1', '#', '', '', '1', '0', 'F', '0', '0', 'system:dict:query', '#', 'admin', '2022-03-21 21:33:12', '', null, '');
INSERT INTO `sys_menu` VALUES ('1027', '字典新增', '105', '2', '#', '', '', '1', '0', 'F', '0', '0', 'system:dict:add', '#', 'admin', '2022-03-21 21:33:12', '', null, '');
INSERT INTO `sys_menu` VALUES ('1028', '字典修改', '105', '3', '#', '', '', '1', '0', 'F', '0', '0', 'system:dict:edit', '#', 'admin', '2022-03-21 21:33:12', '', null, '');
INSERT INTO `sys_menu` VALUES ('1029', '字典删除', '105', '4', '#', '', '', '1', '0', 'F', '0', '0', 'system:dict:remove', '#', 'admin', '2022-03-21 21:33:12', '', null, '');
INSERT INTO `sys_menu` VALUES ('1030', '字典导出', '105', '5', '#', '', '', '1', '0', 'F', '0', '0', 'system:dict:export', '#', 'admin', '2022-03-21 21:33:12', '', null, '');
INSERT INTO `sys_menu` VALUES ('1031', '参数查询', '106', '1', '#', '', '', '1', '0', 'F', '0', '0', 'system:config:query', '#', 'admin', '2022-03-21 21:33:12', '', null, '');
INSERT INTO `sys_menu` VALUES ('1032', '参数新增', '106', '2', '#', '', '', '1', '0', 'F', '0', '0', 'system:config:add', '#', 'admin', '2022-03-21 21:33:12', '', null, '');
INSERT INTO `sys_menu` VALUES ('1033', '参数修改', '106', '3', '#', '', '', '1', '0', 'F', '0', '0', 'system:config:edit', '#', 'admin', '2022-03-21 21:33:12', '', null, '');
INSERT INTO `sys_menu` VALUES ('1034', '参数删除', '106', '4', '#', '', '', '1', '0', 'F', '0', '0', 'system:config:remove', '#', 'admin', '2022-03-21 21:33:12', '', null, '');
INSERT INTO `sys_menu` VALUES ('1035', '参数导出', '106', '5', '#', '', '', '1', '0', 'F', '0', '0', 'system:config:export', '#', 'admin', '2022-03-21 21:33:12', '', null, '');
INSERT INTO `sys_menu` VALUES ('1036', '公告查询', '107', '1', '#', '', '', '1', '0', 'F', '0', '0', 'system:notice:query', '#', 'admin', '2022-03-21 21:33:12', '', null, '');
INSERT INTO `sys_menu` VALUES ('1037', '公告新增', '107', '2', '#', '', '', '1', '0', 'F', '0', '0', 'system:notice:add', '#', 'admin', '2022-03-21 21:33:12', '', null, '');
INSERT INTO `sys_menu` VALUES ('1038', '公告修改', '107', '3', '#', '', '', '1', '0', 'F', '0', '0', 'system:notice:edit', '#', 'admin', '2022-03-21 21:33:12', '', null, '');
INSERT INTO `sys_menu` VALUES ('1039', '公告删除', '107', '4', '#', '', '', '1', '0', 'F', '0', '0', 'system:notice:remove', '#', 'admin', '2022-03-21 21:33:12', '', null, '');
INSERT INTO `sys_menu` VALUES ('1040', '操作查询', '500', '1', '#', '', '', '1', '0', 'F', '0', '0', 'monitor:operlog:query', '#', 'admin', '2022-03-21 21:33:12', '', null, '');
INSERT INTO `sys_menu` VALUES ('1041', '操作删除', '500', '2', '#', '', '', '1', '0', 'F', '0', '0', 'monitor:operlog:remove', '#', 'admin', '2022-03-21 21:33:12', '', null, '');
INSERT INTO `sys_menu` VALUES ('1042', '日志导出', '500', '4', '#', '', '', '1', '0', 'F', '0', '0', 'monitor:operlog:export', '#', 'admin', '2022-03-21 21:33:12', '', null, '');
INSERT INTO `sys_menu` VALUES ('1043', '登录查询', '501', '1', '#', '', '', '1', '0', 'F', '0', '0', 'monitor:logininfor:query', '#', 'admin', '2022-03-21 21:33:12', '', null, '');
INSERT INTO `sys_menu` VALUES ('1044', '登录删除', '501', '2', '#', '', '', '1', '0', 'F', '0', '0', 'monitor:logininfor:remove', '#', 'admin', '2022-03-21 21:33:12', '', null, '');
INSERT INTO `sys_menu` VALUES ('1045', '日志导出', '501', '3', '#', '', '', '1', '0', 'F', '0', '0', 'monitor:logininfor:export', '#', 'admin', '2022-03-21 21:33:12', '', null, '');
INSERT INTO `sys_menu` VALUES ('1046', '在线查询', '109', '1', '#', '', '', '1', '0', 'F', '0', '0', 'monitor:online:query', '#', 'admin', '2022-03-21 21:33:12', '', null, '');
INSERT INTO `sys_menu` VALUES ('1047', '批量强退', '109', '2', '#', '', '', '1', '0', 'F', '0', '0', 'monitor:online:batchLogout', '#', 'admin', '2022-03-21 21:33:12', '', null, '');
INSERT INTO `sys_menu` VALUES ('1048', '单条强退', '109', '3', '#', '', '', '1', '0', 'F', '0', '0', 'monitor:online:forceLogout', '#', 'admin', '2022-03-21 21:33:12', '', null, '');
INSERT INTO `sys_menu` VALUES ('1049', '任务查询', '110', '1', '#', '', '', '1', '0', 'F', '0', '0', 'monitor:job:query', '#', 'admin', '2022-03-21 21:33:12', '', null, '');
INSERT INTO `sys_menu` VALUES ('1050', '任务新增', '110', '2', '#', '', '', '1', '0', 'F', '0', '0', 'monitor:job:add', '#', 'admin', '2022-03-21 21:33:12', '', null, '');
INSERT INTO `sys_menu` VALUES ('1051', '任务修改', '110', '3', '#', '', '', '1', '0', 'F', '0', '0', 'monitor:job:edit', '#', 'admin', '2022-03-21 21:33:12', '', null, '');
INSERT INTO `sys_menu` VALUES ('1052', '任务删除', '110', '4', '#', '', '', '1', '0', 'F', '0', '0', 'monitor:job:remove', '#', 'admin', '2022-03-21 21:33:12', '', null, '');
INSERT INTO `sys_menu` VALUES ('1053', '状态修改', '110', '5', '#', '', '', '1', '0', 'F', '0', '0', 'monitor:job:changeStatus', '#', 'admin', '2022-03-21 21:33:12', '', null, '');
INSERT INTO `sys_menu` VALUES ('1054', '任务导出', '110', '7', '#', '', '', '1', '0', 'F', '0', '0', 'monitor:job:export', '#', 'admin', '2022-03-21 21:33:12', '', null, '');
INSERT INTO `sys_menu` VALUES ('1055', '生成查询', '115', '1', '#', '', '', '1', '0', 'F', '0', '0', 'tool:gen:query', '#', 'admin', '2022-03-21 21:33:12', '', null, '');
INSERT INTO `sys_menu` VALUES ('1056', '生成修改', '115', '2', '#', '', '', '1', '0', 'F', '0', '0', 'tool:gen:edit', '#', 'admin', '2022-03-21 21:33:12', '', null, '');
INSERT INTO `sys_menu` VALUES ('1057', '生成删除', '115', '3', '#', '', '', '1', '0', 'F', '0', '0', 'tool:gen:remove', '#', 'admin', '2022-03-21 21:33:12', '', null, '');
INSERT INTO `sys_menu` VALUES ('1058', '导入代码', '115', '2', '#', '', '', '1', '0', 'F', '0', '0', 'tool:gen:import', '#', 'admin', '2022-03-21 21:33:12', '', null, '');
INSERT INTO `sys_menu` VALUES ('1059', '预览代码', '115', '4', '#', '', '', '1', '0', 'F', '0', '0', 'tool:gen:preview', '#', 'admin', '2022-03-21 21:33:12', '', null, '');
INSERT INTO `sys_menu` VALUES ('1060', '生成代码', '115', '5', '#', '', '', '1', '0', 'F', '0', '0', 'tool:gen:code', '#', 'admin', '2022-03-21 21:33:12', '', null, '');
INSERT INTO `sys_menu` VALUES ('2015', '期刊管理', '0', '3', 'bookM', null, null, '1', '0', 'M', '0', '0', '', 'education', 'admin', '2022-03-22 15:43:42', 'admin', '2022-05-02 15:49:29', '');
INSERT INTO `sys_menu` VALUES ('2016', '期刊管理', '2015', '1', 'books', 'bookM/books/index', null, '1', '1', 'C', '0', '0', 'bookM:books:list', '#', 'admin', '2022-03-22 15:49:34', 'admin', '2022-05-02 19:12:55', '期刊管理菜单');
INSERT INTO `sys_menu` VALUES ('2017', '期刊管理查询', '2016', '1', '#', '', null, '1', '0', 'F', '0', '0', 'bookM:books:query', '#', 'admin', '2022-03-22 15:49:34', '', null, '');
INSERT INTO `sys_menu` VALUES ('2018', '期刊管理新增', '2016', '2', '#', '', null, '1', '0', 'F', '0', '0', 'bookM:books:add', '#', 'admin', '2022-03-22 15:49:34', '', null, '');
INSERT INTO `sys_menu` VALUES ('2019', '期刊管理修改', '2016', '3', '#', '', null, '1', '0', 'F', '0', '0', 'bookM:books:edit', '#', 'admin', '2022-03-22 15:49:34', '', null, '');
INSERT INTO `sys_menu` VALUES ('2020', '期刊管理删除', '2016', '4', '#', '', null, '1', '0', 'F', '0', '0', 'bookM:books:remove', '#', 'admin', '2022-03-22 15:49:34', '', null, '');
INSERT INTO `sys_menu` VALUES ('2021', '期刊管理导出', '2016', '5', '#', '', null, '1', '0', 'F', '0', '0', 'bookM:books:export', '#', 'admin', '2022-03-22 15:49:34', '', null, '');
INSERT INTO `sys_menu` VALUES ('2022', '作者管理', '0', '3', 'writerM', null, null, '1', '0', 'M', '0', '0', '', 'peoples', 'admin', '2022-04-25 21:26:24', 'admin', '2022-05-02 15:49:39', '');
INSERT INTO `sys_menu` VALUES ('2023', '作者管理', '2022', '1', 'writer', 'writer/writer/index', null, '1', '0', 'C', '0', '0', 'writer:writer:list', '#', 'admin', '2022-04-25 21:28:35', '', null, '作者管理菜单');
INSERT INTO `sys_menu` VALUES ('2024', '作者管理查询', '2023', '1', '#', '', null, '1', '0', 'F', '0', '0', 'writer:writer:query', '#', 'admin', '2022-04-25 21:28:36', '', null, '');
INSERT INTO `sys_menu` VALUES ('2025', '作者管理新增', '2023', '2', '#', '', null, '1', '0', 'F', '0', '0', 'writer:writer:add', '#', 'admin', '2022-04-25 21:28:37', '', null, '');
INSERT INTO `sys_menu` VALUES ('2026', '作者管理修改', '2023', '3', '#', '', null, '1', '0', 'F', '0', '0', 'writer:writer:edit', '#', 'admin', '2022-04-25 21:28:37', '', null, '');
INSERT INTO `sys_menu` VALUES ('2027', '作者管理删除', '2023', '4', '#', '', null, '1', '0', 'F', '0', '0', 'writer:writer:remove', '#', 'admin', '2022-04-25 21:28:37', '', null, '');
INSERT INTO `sys_menu` VALUES ('2028', '作者管理导出', '2023', '5', '#', '', null, '1', '0', 'F', '0', '0', 'writer:writer:export', '#', 'admin', '2022-04-25 21:28:38', '', null, '');
INSERT INTO `sys_menu` VALUES ('2029', '前台幻灯片管理', '0', '3', 'ppt', null, null, '1', '0', 'M', '0', '0', '', 'clipboard', 'admin', '2022-07-24 18:22:14', 'admin', '2022-07-24 19:24:03', '');
INSERT INTO `sys_menu` VALUES ('2030', '前台幻灯片', '2029', '1', 'ppt', 'ppt/ppt/index', null, '1', '0', 'C', '0', '0', 'ppt:ppt:list', '#', 'admin', '2022-07-24 18:28:30', 'admin', '2022-07-24 19:24:18', '前台首页幻灯片菜单');
INSERT INTO `sys_menu` VALUES ('2031', '前台首页幻灯片查询', '2030', '1', '#', '', null, '1', '0', 'F', '0', '0', 'ppt:ppt:query', '#', 'admin', '2022-07-24 18:28:41', '', null, '');
INSERT INTO `sys_menu` VALUES ('2032', '前台首页幻灯片新增', '2030', '2', '#', '', null, '1', '0', 'F', '0', '0', 'ppt:ppt:add', '#', 'admin', '2022-07-24 18:28:44', '', null, '');
INSERT INTO `sys_menu` VALUES ('2033', '前台首页幻灯片修改', '2030', '3', '#', '', null, '1', '0', 'F', '0', '0', 'ppt:ppt:edit', '#', 'admin', '2022-07-24 18:28:48', '', null, '');
INSERT INTO `sys_menu` VALUES ('2034', '前台首页幻灯片删除', '2030', '4', '#', '', null, '1', '0', 'F', '0', '0', 'ppt:ppt:remove', '#', 'admin', '2022-07-24 18:28:51', '', null, '');
INSERT INTO `sys_menu` VALUES ('2035', '前台首页幻灯片导出', '2030', '5', '#', '', null, '1', '0', 'F', '0', '0', 'ppt:ppt:export', '#', 'admin', '2022-07-24 18:28:54', '', null, '');

-- ----------------------------
-- Table structure for sys_notice
-- ----------------------------
DROP TABLE IF EXISTS `sys_notice`;
CREATE TABLE `sys_notice` (
                              `notice_id` int(4) NOT NULL AUTO_INCREMENT COMMENT '公告ID',
                              `notice_title` varchar(50) NOT NULL COMMENT '公告标题',
                              `notice_type` char(1) NOT NULL COMMENT '公告类型（1通知 2公告）',
                              `notice_content` longblob COMMENT '公告内容',
                              `status` char(1) DEFAULT '0' COMMENT '公告状态（0正常 1关闭）',
                              `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
                              `create_time` datetime DEFAULT NULL COMMENT '创建时间',
                              `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
                              `update_time` datetime DEFAULT NULL COMMENT '更新时间',
                              `remark` varchar(255) DEFAULT NULL COMMENT '备注',
                              PRIMARY KEY (`notice_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='通知公告表';

-- ----------------------------
-- Records of sys_notice
-- ----------------------------
INSERT INTO `sys_notice` VALUES ('1', '温馨提醒：2018-07-01 liefox新版本发布啦', '2', 0xE696B0E78988E69CACE58685E5AEB9, '0', 'admin', '2022-03-21 21:33:13', '', null, '管理员');
INSERT INTO `sys_notice` VALUES ('2', '维护通知：2018-07-01 liefox系统凌晨维护', '1', 0xE7BBB4E68AA4E58685E5AEB9, '0', 'admin', '2022-03-21 21:33:13', '', null, '管理员');

-- ----------------------------
-- Table structure for sys_oper_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_oper_log`;
CREATE TABLE `sys_oper_log` (
                                `oper_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '日志主键',
                                `title` varchar(50) DEFAULT '' COMMENT '模块标题',
                                `business_type` int(2) DEFAULT '0' COMMENT '业务类型（0其它 1新增 2修改 3删除）',
                                `method` varchar(100) DEFAULT '' COMMENT '方法名称',
                                `request_method` varchar(10) DEFAULT '' COMMENT '请求方式',
                                `operator_type` int(1) DEFAULT '0' COMMENT '操作类别（0其它 1后台用户 2手机端用户）',
                                `oper_name` varchar(50) DEFAULT '' COMMENT '操作人员',
                                `dept_name` varchar(50) DEFAULT '' COMMENT '部门名称',
                                `oper_url` varchar(255) DEFAULT '' COMMENT '请求URL',
                                `oper_ip` varchar(128) DEFAULT '' COMMENT '主机地址',
                                `oper_location` varchar(255) DEFAULT '' COMMENT '操作地点',
                                `oper_param` varchar(2000) DEFAULT '' COMMENT '请求参数',
                                `json_result` varchar(2000) DEFAULT '' COMMENT '返回参数',
                                `status` int(1) DEFAULT '0' COMMENT '操作状态（0正常 1异常）',
                                `error_msg` varchar(2000) DEFAULT '' COMMENT '错误消息',
                                `oper_time` datetime DEFAULT NULL COMMENT '操作时间',
                                PRIMARY KEY (`oper_id`)
) ENGINE=InnoDB AUTO_INCREMENT=218 DEFAULT CHARSET=utf8 COMMENT='操作日志记录';

-- ----------------------------
-- Records of sys_oper_log
-- ----------------------------
INSERT INTO `sys_oper_log` VALUES ('100', '菜单管理', '1', 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', '1', 'admin', null, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"education\",\"orderNum\":\"1\",\"menuName\":\"期刊管理\",\"params\":{},\"parentId\":0,\"isCache\":\"0\",\"path\":\"bookm\",\"createBy\":\"admin\",\"children\":[],\"isFrame\":\"1\",\"menuType\":\"M\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-03-22 09:08:03');
INSERT INTO `sys_oper_log` VALUES ('101', '菜单管理', '1', 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', '1', 'admin', null, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"build\",\"orderNum\":\"1\",\"menuName\":\"期刊管理\",\"params\":{},\"parentId\":2000,\"isCache\":\"0\",\"path\":\"books\",\"createBy\":\"admin\",\"children\":[],\"isFrame\":\"1\",\"menuType\":\"C\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-03-22 09:08:51');
INSERT INTO `sys_oper_log` VALUES ('102', '代码生成', '6', 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', '1', 'admin', null, '/tool/gen/importTable', '127.0.0.1', '内网IP', 'asq_books,asq_writer', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-03-22 09:09:06');
INSERT INTO `sys_oper_log` VALUES ('103', '代码生成', '2', 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', '1', 'admin', null, '/tool/gen', '127.0.0.1', '内网IP', '{\"sub\":true,\"subTableName\":\"asq_writer\",\"functionAuthor\":\"\",\"columns\":[{\"capJavaField\":\"BookId\",\"usableColumn\":false,\"columnId\":1,\"isIncrement\":\"1\",\"increment\":true,\"insert\":true,\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"bookId\",\"htmlType\":\"input\",\"edit\":false,\"query\":false,\"sort\":1,\"list\":false,\"params\":{},\"javaType\":\"Long\",\"queryType\":\"EQ\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"isPk\":\"1\",\"createTime\":1647911346000,\"tableId\":1,\"pk\":true,\"columnName\":\"book_id\"},{\"capJavaField\":\"BookWriterId\",\"usableColumn\":false,\"columnId\":2,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"bookWriterId\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"期刊作者id\",\"isQuery\":\"1\",\"sort\":2,\"list\":true,\"params\":{},\"javaType\":\"Long\",\"queryType\":\"EQ\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1647911346000,\"isEdit\":\"1\",\"tableId\":1,\"pk\":false,\"columnName\":\"book_writer_id\"},{\"capJavaField\":\"BookName\",\"usableColumn\":false,\"columnId\":3,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"bookName\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"期刊名\",\"isQuery\":\"1\",\"sort\":3,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"LIKE\",\"columnType\":\"varchar(20)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1647911346000,\"isEdit\":\"1\",\"tableId\":1,\"pk\":false,\"columnName\":\"book_name\"},{\"capJavaField\":\"BookType\",\"usableColumn\":false,\"columnId\":4,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"bookType\",\"htmlType\":\"select\",\"edit\":true,\"query\":true,\"columnComment\":\"期刊类型\",\"isQuery\":\"1\",\"sort\":4,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(20)\",\"create', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-03-22 09:11:54');
INSERT INTO `sys_oper_log` VALUES ('104', '字典类型', '1', 'com.ruoyi.web.controller.system.SysDictTypeController.add()', 'POST', '1', 'admin', null, '/system/dict/type', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"dictName\":\"期刊类型\",\"params\":{},\"dictType\":\"book_type\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-03-22 09:12:42');
INSERT INTO `sys_oper_log` VALUES ('105', '字典数据', '1', 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', '1', 'admin', null, '/system/dict/data', '127.0.0.1', '内网IP', '{\"dictValue\":\"Java\",\"listClass\":\"success\",\"dictSort\":0,\"params\":{},\"dictType\":\"book_type\",\"dictLabel\":\"Java\",\"createBy\":\"admin\",\"default\":false,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-03-22 09:13:22');
INSERT INTO `sys_oper_log` VALUES ('106', '字典数据', '1', 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', '1', 'admin', null, '/system/dict/data', '127.0.0.1', '内网IP', '{\"dictValue\":\"Vue\",\"listClass\":\"success\",\"dictSort\":0,\"params\":{},\"dictType\":\"book_type\",\"dictLabel\":\"Vue\",\"createBy\":\"admin\",\"default\":false,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-03-22 09:13:39');
INSERT INTO `sys_oper_log` VALUES ('107', '字典数据', '1', 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', '1', 'admin', null, '/system/dict/data', '127.0.0.1', '内网IP', '{\"dictValue\":\"生活\",\"listClass\":\"default\",\"dictSort\":0,\"params\":{},\"dictType\":\"book_type\",\"dictLabel\":\"生活\",\"createBy\":\"admin\",\"default\":false,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-03-22 09:13:55');
INSERT INTO `sys_oper_log` VALUES ('108', '字典数据', '2', 'com.ruoyi.web.controller.system.SysDictDataController.edit()', 'PUT', '1', 'admin', null, '/system/dict/data', '127.0.0.1', '内网IP', '{\"dictValue\":\"生活\",\"listClass\":\"success\",\"dictSort\":0,\"params\":{},\"dictType\":\"book_type\",\"dictLabel\":\"生活\",\"createBy\":\"admin\",\"default\":false,\"isDefault\":\"N\",\"createTime\":1647911635000,\"dictCode\":102,\"updateBy\":\"admin\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-03-22 09:14:01');
INSERT INTO `sys_oper_log` VALUES ('109', '代码生成', '2', 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', '1', 'admin', null, '/tool/gen', '127.0.0.1', '内网IP', '{\"sub\":true,\"subTableName\":\"asq_writer\",\"functionAuthor\":\"\",\"columns\":[{\"capJavaField\":\"BookId\",\"usableColumn\":false,\"columnId\":1,\"isIncrement\":\"1\",\"increment\":true,\"insert\":true,\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"bookId\",\"htmlType\":\"input\",\"edit\":false,\"query\":false,\"updateTime\":1647911514000,\"sort\":1,\"list\":false,\"params\":{},\"javaType\":\"Long\",\"queryType\":\"EQ\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"isPk\":\"1\",\"createTime\":1647911346000,\"tableId\":1,\"pk\":true,\"columnName\":\"book_id\"},{\"capJavaField\":\"BookWriterId\",\"usableColumn\":false,\"columnId\":2,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"bookWriterId\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"期刊作者id\",\"isQuery\":\"1\",\"updateTime\":1647911514000,\"sort\":2,\"list\":true,\"params\":{},\"javaType\":\"Long\",\"queryType\":\"EQ\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1647911346000,\"isEdit\":\"1\",\"tableId\":1,\"pk\":false,\"columnName\":\"book_writer_id\"},{\"capJavaField\":\"BookName\",\"usableColumn\":false,\"columnId\":3,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"bookName\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"期刊名\",\"isQuery\":\"1\",\"updateTime\":1647911514000,\"sort\":3,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"LIKE\",\"columnType\":\"varchar(20)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1647911346000,\"isEdit\":\"1\",\"tableId\":1,\"pk\":false,\"columnName\":\"book_name\"},{\"capJavaField\":\"BookType\",\"usableColumn\":false,\"columnId\":4,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"book_type\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"bookType\",\"htmlType\":\"select\",\"edit\":true,\"query\":true,\"columnComment\":\"期刊类型\",\"isQuery\":\"1\",\"updateTime\":1', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-03-22 09:14:23');
INSERT INTO `sys_oper_log` VALUES ('110', '代码生成', '2', 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', '1', 'admin', null, '/tool/gen', '127.0.0.1', '内网IP', '{\"sub\":false,\"functionAuthor\":\"shiqi\",\"columns\":[{\"capJavaField\":\"WriterId\",\"usableColumn\":false,\"columnId\":9,\"isIncrement\":\"1\",\"increment\":true,\"insert\":true,\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"writerId\",\"htmlType\":\"input\",\"edit\":false,\"query\":false,\"sort\":1,\"list\":false,\"params\":{},\"javaType\":\"Long\",\"queryType\":\"EQ\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"isPk\":\"1\",\"createTime\":1647911346000,\"tableId\":2,\"pk\":true,\"columnName\":\"writer_id\"},{\"capJavaField\":\"WriterName\",\"usableColumn\":false,\"columnId\":10,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"writerName\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"作者姓名\",\"isQuery\":\"1\",\"sort\":2,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"LIKE\",\"columnType\":\"varchar(20)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1647911346000,\"isEdit\":\"1\",\"tableId\":2,\"pk\":false,\"columnName\":\"writer_name\"},{\"capJavaField\":\"WriterInfo\",\"usableColumn\":false,\"columnId\":11,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"writerInfo\",\"htmlType\":\"editor\",\"edit\":true,\"query\":false,\"columnComment\":\"作者详情\",\"sort\":3,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1647911346000,\"isEdit\":\"1\",\"tableId\":2,\"pk\":false,\"columnName\":\"writer_info\"},{\"capJavaField\":\"WriterIntro\",\"usableColumn\":false,\"columnId\":12,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"writerIntro\",\"htmlType\":\"input\",\"edit\":true,\"query\":false,\"columnComment\":\"作者座右铭\",\"sort\":4,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createT', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-03-22 09:15:30');
INSERT INTO `sys_oper_log` VALUES ('111', '代码生成', '2', 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', '1', 'admin', null, '/tool/gen', '127.0.0.1', '内网IP', '{\"sub\":true,\"subTableName\":\"asq_writer\",\"functionAuthor\":\"\",\"columns\":[{\"capJavaField\":\"BookId\",\"usableColumn\":false,\"columnId\":1,\"isIncrement\":\"1\",\"increment\":true,\"insert\":true,\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"bookId\",\"htmlType\":\"input\",\"edit\":false,\"query\":false,\"updateTime\":1647911663000,\"sort\":1,\"list\":false,\"params\":{},\"javaType\":\"Long\",\"queryType\":\"EQ\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"isPk\":\"1\",\"createTime\":1647911346000,\"tableId\":1,\"pk\":true,\"columnName\":\"book_id\"},{\"capJavaField\":\"BookWriterId\",\"usableColumn\":false,\"columnId\":2,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"bookWriterId\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"期刊作者id\",\"isQuery\":\"1\",\"updateTime\":1647911663000,\"sort\":2,\"list\":true,\"params\":{},\"javaType\":\"Long\",\"queryType\":\"EQ\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1647911346000,\"isEdit\":\"1\",\"tableId\":1,\"pk\":false,\"columnName\":\"book_writer_id\"},{\"capJavaField\":\"BookName\",\"usableColumn\":false,\"columnId\":3,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"bookName\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"期刊名\",\"isQuery\":\"1\",\"updateTime\":1647911663000,\"sort\":3,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"LIKE\",\"columnType\":\"varchar(20)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1647911346000,\"isEdit\":\"1\",\"tableId\":1,\"pk\":false,\"columnName\":\"book_name\"},{\"capJavaField\":\"BookType\",\"usableColumn\":false,\"columnId\":4,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"book_type\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"bookType\",\"htmlType\":\"select\",\"edit\":true,\"query\":true,\"columnComment\":\"期刊类型\",\"isQuery\":\"1\",\"updateTime\":1', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-03-22 09:17:10');
INSERT INTO `sys_oper_log` VALUES ('112', '代码生成', '8', 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', '1', 'admin', null, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{}', 'null', '0', null, '2022-03-22 09:17:15');
INSERT INTO `sys_oper_log` VALUES ('113', '代码生成', '8', 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', '1', 'admin', null, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{}', 'null', '0', null, '2022-03-22 09:17:22');
INSERT INTO `sys_oper_log` VALUES ('114', '菜单管理', '3', 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', '1', 'admin', null, '/system/menu/2002', '127.0.0.1', '内网IP', '{menuId=2002}', '{\"msg\":\"存在子菜单,不允许删除\",\"code\":500}', '0', null, '2022-03-22 09:55:22');
INSERT INTO `sys_oper_log` VALUES ('115', '菜单管理', '3', 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', '1', 'admin', null, '/system/menu/2002', '127.0.0.1', '内网IP', '{menuId=2002}', '{\"msg\":\"存在子菜单,不允许删除\",\"code\":500}', '0', null, '2022-03-22 09:55:29');
INSERT INTO `sys_oper_log` VALUES ('116', '菜单管理', '3', 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', '1', 'admin', null, '/system/menu/2007', '127.0.0.1', '内网IP', '{menuId=2007}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-03-22 09:55:33');
INSERT INTO `sys_oper_log` VALUES ('117', '菜单管理', '3', 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', '1', 'admin', null, '/system/menu/2006', '127.0.0.1', '内网IP', '{menuId=2006}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-03-22 09:55:36');
INSERT INTO `sys_oper_log` VALUES ('118', '菜单管理', '3', 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', '1', 'admin', null, '/system/menu/2005', '127.0.0.1', '内网IP', '{menuId=2005}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-03-22 09:55:38');
INSERT INTO `sys_oper_log` VALUES ('119', '菜单管理', '3', 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', '1', 'admin', null, '/system/menu/2004', '127.0.0.1', '内网IP', '{menuId=2004}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-03-22 09:55:41');
INSERT INTO `sys_oper_log` VALUES ('120', '菜单管理', '3', 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', '1', 'admin', null, '/system/menu/2003', '127.0.0.1', '内网IP', '{menuId=2003}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-03-22 09:55:46');
INSERT INTO `sys_oper_log` VALUES ('121', '菜单管理', '3', 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', '1', 'admin', null, '/system/menu/2002', '127.0.0.1', '内网IP', '{menuId=2002}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-03-22 09:55:49');
INSERT INTO `sys_oper_log` VALUES ('122', '菜单管理', '3', 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', '1', 'admin', null, '/system/menu/2001', '127.0.0.1', '内网IP', '{menuId=2001}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-03-22 09:55:53');
INSERT INTO `sys_oper_log` VALUES ('123', '菜单管理', '3', 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', '1', 'admin', null, '/system/menu/2000', '127.0.0.1', '内网IP', '{menuId=2000}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-03-22 09:56:29');
INSERT INTO `sys_oper_log` VALUES ('124', '代码生成', '3', 'com.ruoyi.generator.controller.GenController.remove()', 'DELETE', '1', 'admin', null, '/tool/gen/2', '127.0.0.1', '内网IP', '{tableIds=2}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-03-22 10:02:42');
INSERT INTO `sys_oper_log` VALUES ('125', '代码生成', '3', 'com.ruoyi.generator.controller.GenController.remove()', 'DELETE', '1', 'admin', null, '/tool/gen/1', '127.0.0.1', '内网IP', '{tableIds=1}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-03-22 10:02:49');
INSERT INTO `sys_oper_log` VALUES ('126', '个人信息', '2', 'com.ruoyi.web.controller.system.SysProfileController.updatePwd()', 'PUT', '1', 'admin', null, '/system/user/profile/updatePwd', '127.0.0.1', '内网IP', 'admin123 199513gG', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-03-22 10:52:48');
INSERT INTO `sys_oper_log` VALUES ('127', '代码生成', '6', 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', '1', 'admin', null, '/tool/gen/importTable', '127.0.0.1', '内网IP', 'asq_books', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-03-22 10:54:20');
INSERT INTO `sys_oper_log` VALUES ('128', '字典类型', '3', 'com.ruoyi.web.controller.system.SysDictTypeController.remove()', 'DELETE', '1', 'admin', null, '/system/dict/type/100', '127.0.0.1', '内网IP', '{dictIds=100}', 'null', '1', '期刊类型已分配,不能删除', '2022-03-22 10:55:01');
INSERT INTO `sys_oper_log` VALUES ('129', '字典类型', '3', 'com.ruoyi.web.controller.system.SysDictTypeController.remove()', 'DELETE', '1', 'admin', null, '/system/dict/type/100', '127.0.0.1', '内网IP', '{dictIds=100}', 'null', '1', '期刊类型已分配,不能删除', '2022-03-22 10:55:09');
INSERT INTO `sys_oper_log` VALUES ('130', '字典类型', '9', 'com.ruoyi.web.controller.system.SysDictTypeController.refreshCache()', 'DELETE', '1', 'admin', null, '/system/dict/type/refreshCache', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-03-22 10:55:12');
INSERT INTO `sys_oper_log` VALUES ('131', '字典类型', '9', 'com.ruoyi.web.controller.system.SysDictTypeController.refreshCache()', 'DELETE', '1', 'admin', null, '/system/dict/type/refreshCache', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-03-22 10:55:13');
INSERT INTO `sys_oper_log` VALUES ('132', '字典类型', '3', 'com.ruoyi.web.controller.system.SysDictTypeController.remove()', 'DELETE', '1', 'admin', null, '/system/dict/type/100', '127.0.0.1', '内网IP', '{dictIds=100}', 'null', '1', '期刊类型已分配,不能删除', '2022-03-22 10:55:15');
INSERT INTO `sys_oper_log` VALUES ('133', '代码生成', '2', 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', '1', 'admin', null, '/tool/gen', '127.0.0.1', '内网IP', '{\"sub\":false,\"functionAuthor\":\"ruoyi\",\"columns\":[{\"capJavaField\":\"BookId\",\"usableColumn\":false,\"columnId\":14,\"isIncrement\":\"1\",\"increment\":true,\"insert\":true,\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"bookId\",\"htmlType\":\"input\",\"edit\":false,\"query\":false,\"sort\":1,\"list\":false,\"params\":{},\"javaType\":\"Long\",\"queryType\":\"EQ\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"isPk\":\"1\",\"createTime\":1647917660000,\"tableId\":3,\"pk\":true,\"columnName\":\"book_id\"},{\"capJavaField\":\"BookWriterName\",\"usableColumn\":false,\"columnId\":15,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"bookWriterName\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"期刊作者姓名\",\"isQuery\":\"1\",\"sort\":2,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"LIKE\",\"columnType\":\"varchar(20)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1647917660000,\"isEdit\":\"1\",\"tableId\":3,\"pk\":false,\"columnName\":\"book_writer_name\"},{\"capJavaField\":\"BookName\",\"usableColumn\":false,\"columnId\":16,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"bookName\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"期刊名\",\"isQuery\":\"1\",\"sort\":3,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"LIKE\",\"columnType\":\"varchar(20)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1647917660000,\"isEdit\":\"1\",\"tableId\":3,\"pk\":false,\"columnName\":\"book_name\"},{\"capJavaField\":\"BookType\",\"usableColumn\":false,\"columnId\":17,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"bookType\",\"htmlType\":\"select\",\"edit\":true,\"query\":true,\"columnComment\":\"期刊类型\",\"isQuery\":\"1\",\"sort\":4,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(20)\",\"createBy\":\"admi', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-03-22 10:56:06');
INSERT INTO `sys_oper_log` VALUES ('134', '字典类型', '3', 'com.ruoyi.web.controller.system.SysDictTypeController.remove()', 'DELETE', '1', 'admin', null, '/system/dict/type/100', '127.0.0.1', '内网IP', '{dictIds=100}', 'null', '1', '期刊类型已分配,不能删除', '2022-03-22 10:56:12');
INSERT INTO `sys_oper_log` VALUES ('135', '代码生成', '2', 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', '1', 'admin', null, '/tool/gen', '127.0.0.1', '内网IP', '{\"sub\":false,\"functionAuthor\":\"ruoyi\",\"columns\":[{\"capJavaField\":\"BookId\",\"usableColumn\":false,\"columnId\":14,\"isIncrement\":\"1\",\"increment\":true,\"insert\":true,\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"bookId\",\"htmlType\":\"input\",\"edit\":false,\"query\":false,\"updateTime\":1647917766000,\"sort\":1,\"list\":false,\"params\":{},\"javaType\":\"Long\",\"queryType\":\"EQ\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"isPk\":\"1\",\"createTime\":1647917660000,\"tableId\":3,\"pk\":true,\"columnName\":\"book_id\"},{\"capJavaField\":\"BookWriterName\",\"usableColumn\":false,\"columnId\":15,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"bookWriterName\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"期刊作者姓名\",\"isQuery\":\"1\",\"updateTime\":1647917766000,\"sort\":2,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"LIKE\",\"columnType\":\"varchar(20)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1647917660000,\"isEdit\":\"1\",\"tableId\":3,\"pk\":false,\"columnName\":\"book_writer_name\"},{\"capJavaField\":\"BookName\",\"usableColumn\":false,\"columnId\":16,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"bookName\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"期刊名\",\"isQuery\":\"1\",\"updateTime\":1647917766000,\"sort\":3,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"LIKE\",\"columnType\":\"varchar(20)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1647917660000,\"isEdit\":\"1\",\"tableId\":3,\"pk\":false,\"columnName\":\"book_name\"},{\"capJavaField\":\"BookType\",\"usableColumn\":false,\"columnId\":17,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"book_type\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"bookType\",\"htmlType\":\"select\",\"edit\":true,\"query\":true,\"columnComment\":\"期刊类型\",\"isQuery\":\"1\",\"updateTime\":1647917766', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-03-22 10:57:49');
INSERT INTO `sys_oper_log` VALUES ('136', '菜单管理', '1', 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', '1', 'admin', null, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"education\",\"orderNum\":\"1\",\"menuName\":\"期刊管理\",\"params\":{},\"parentId\":0,\"isCache\":\"0\",\"path\":\"bookm\",\"createBy\":\"admin\",\"children\":[],\"isFrame\":\"1\",\"menuType\":\"M\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-03-22 10:58:28');
INSERT INTO `sys_oper_log` VALUES ('137', '代码生成', '2', 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', '1', 'admin', null, '/tool/gen', '127.0.0.1', '内网IP', '{\"sub\":false,\"functionAuthor\":\"ruoyi\",\"columns\":[{\"capJavaField\":\"BookId\",\"usableColumn\":false,\"columnId\":14,\"isIncrement\":\"1\",\"increment\":true,\"insert\":true,\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"bookId\",\"htmlType\":\"input\",\"edit\":false,\"query\":false,\"updateTime\":1647917869000,\"sort\":1,\"list\":false,\"params\":{},\"javaType\":\"Long\",\"queryType\":\"EQ\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"isPk\":\"1\",\"createTime\":1647917660000,\"tableId\":3,\"pk\":true,\"columnName\":\"book_id\"},{\"capJavaField\":\"BookWriterName\",\"usableColumn\":false,\"columnId\":15,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"bookWriterName\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"期刊作者姓名\",\"isQuery\":\"1\",\"updateTime\":1647917869000,\"sort\":2,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"LIKE\",\"columnType\":\"varchar(20)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1647917660000,\"isEdit\":\"1\",\"tableId\":3,\"pk\":false,\"columnName\":\"book_writer_name\"},{\"capJavaField\":\"BookName\",\"usableColumn\":false,\"columnId\":16,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"bookName\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"期刊名\",\"isQuery\":\"1\",\"updateTime\":1647917869000,\"sort\":3,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"LIKE\",\"columnType\":\"varchar(20)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1647917660000,\"isEdit\":\"1\",\"tableId\":3,\"pk\":false,\"columnName\":\"book_name\"},{\"capJavaField\":\"BookType\",\"usableColumn\":false,\"columnId\":17,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"book_type\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"bookType\",\"htmlType\":\"select\",\"edit\":true,\"query\":true,\"columnComment\":\"期刊类型\",\"isQuery\":\"1\",\"updateTime\":1647917869', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-03-22 10:58:43');
INSERT INTO `sys_oper_log` VALUES ('138', '代码生成', '8', 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', '1', 'admin', null, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{}', 'null', '0', null, '2022-03-22 10:58:46');
INSERT INTO `sys_oper_log` VALUES ('139', '菜单管理', '3', 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', '1', 'admin', null, '/system/menu/2008', '127.0.0.1', '内网IP', '{menuId=2008}', '{\"msg\":\"存在子菜单,不允许删除\",\"code\":500}', '0', null, '2022-03-22 13:05:58');
INSERT INTO `sys_oper_log` VALUES ('140', '菜单管理', '3', 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', '1', 'admin', null, '/system/menu/2009', '127.0.0.1', '内网IP', '{menuId=2009}', '{\"msg\":\"存在子菜单,不允许删除\",\"code\":500}', '0', null, '2022-03-22 13:06:02');
INSERT INTO `sys_oper_log` VALUES ('141', '菜单管理', '3', 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', '1', 'admin', null, '/system/menu/2010', '127.0.0.1', '内网IP', '{menuId=2010}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-03-22 13:06:08');
INSERT INTO `sys_oper_log` VALUES ('142', '菜单管理', '3', 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', '1', 'admin', null, '/system/menu/2011', '127.0.0.1', '内网IP', '{menuId=2011}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-03-22 13:06:10');
INSERT INTO `sys_oper_log` VALUES ('143', '菜单管理', '3', 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', '1', 'admin', null, '/system/menu/2012', '127.0.0.1', '内网IP', '{menuId=2012}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-03-22 13:06:12');
INSERT INTO `sys_oper_log` VALUES ('144', '菜单管理', '3', 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', '1', 'admin', null, '/system/menu/2013', '127.0.0.1', '内网IP', '{menuId=2013}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-03-22 13:06:14');
INSERT INTO `sys_oper_log` VALUES ('145', '菜单管理', '3', 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', '1', 'admin', null, '/system/menu/2014', '127.0.0.1', '内网IP', '{menuId=2014}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-03-22 13:06:17');
INSERT INTO `sys_oper_log` VALUES ('146', '菜单管理', '3', 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', '1', 'admin', null, '/system/menu/2009', '127.0.0.1', '内网IP', '{menuId=2009}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-03-22 13:06:20');
INSERT INTO `sys_oper_log` VALUES ('147', '菜单管理', '3', 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', '1', 'admin', null, '/system/menu/2008', '127.0.0.1', '内网IP', '{menuId=2008}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-03-22 13:06:22');
INSERT INTO `sys_oper_log` VALUES ('148', '字典类型', '3', 'com.ruoyi.web.controller.system.SysDictTypeController.remove()', 'DELETE', '1', 'admin', null, '/system/dict/type/100', '127.0.0.1', '内网IP', '{dictIds=100}', 'null', '1', '期刊类型已分配,不能删除', '2022-03-22 13:06:32');
INSERT INTO `sys_oper_log` VALUES ('149', '菜单管理', '1', 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', '1', 'admin', null, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"education\",\"orderNum\":\"1\",\"menuName\":\"期刊管理\",\"params\":{},\"parentId\":0,\"isCache\":\"0\",\"path\":\"bookM\",\"createBy\":\"admin\",\"children\":[],\"isFrame\":\"1\",\"menuType\":\"M\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-03-22 15:43:42');
INSERT INTO `sys_oper_log` VALUES ('150', '代码生成', '2', 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', '1', 'admin', null, '/tool/gen', '127.0.0.1', '内网IP', '{\"sub\":false,\"functionAuthor\":\"ruoyi\",\"columns\":[{\"capJavaField\":\"BookId\",\"usableColumn\":false,\"columnId\":14,\"isIncrement\":\"1\",\"increment\":true,\"insert\":true,\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"bookId\",\"htmlType\":\"input\",\"edit\":false,\"query\":false,\"updateTime\":1647917923000,\"sort\":1,\"list\":false,\"params\":{},\"javaType\":\"Long\",\"queryType\":\"EQ\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"isPk\":\"1\",\"createTime\":1647917660000,\"tableId\":3,\"pk\":true,\"columnName\":\"book_id\"},{\"capJavaField\":\"BookWriterName\",\"usableColumn\":false,\"columnId\":15,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"bookWriterName\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"期刊作者姓名\",\"isQuery\":\"1\",\"updateTime\":1647917923000,\"sort\":2,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"LIKE\",\"columnType\":\"varchar(20)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1647917660000,\"isEdit\":\"1\",\"tableId\":3,\"pk\":false,\"columnName\":\"book_writer_name\"},{\"capJavaField\":\"BookName\",\"usableColumn\":false,\"columnId\":16,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"bookName\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"期刊名\",\"isQuery\":\"1\",\"updateTime\":1647917923000,\"sort\":3,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"LIKE\",\"columnType\":\"varchar(20)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1647917660000,\"isEdit\":\"1\",\"tableId\":3,\"pk\":false,\"columnName\":\"book_name\"},{\"capJavaField\":\"BookType\",\"usableColumn\":false,\"columnId\":17,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"book_type\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"bookType\",\"htmlType\":\"select\",\"edit\":true,\"query\":true,\"columnComment\":\"期刊类型\",\"isQuery\":\"1\",\"updateTime\":1647917923', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-03-22 15:45:52');
INSERT INTO `sys_oper_log` VALUES ('151', '代码生成', '8', 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', '1', 'admin', null, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{}', 'null', '0', null, '2022-03-22 15:46:16');
INSERT INTO `sys_oper_log` VALUES ('152', '期刊管理', '1', 'com.ruoyi.controller.AsqBooksController.add()', 'POST', '1', 'admin', null, '/bookM/books', '127.0.0.1', '内网IP', '{\"bookPress\":\"工作室\",\"params\":{},\"bookCover\":\"/profile/upload/2022/03/22/be03beb9-da38-40ab-b667-558f7af26e8d.jpeg\",\"bookName\":\"前后端分离\",\"bookId\":1,\"bookPubDate\":1647878400000,\"bookUpDate\":1647878400000,\"bookWriterName\":\"期刊\",\"bookType\":\"Java\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-03-22 16:12:03');
INSERT INTO `sys_oper_log` VALUES ('153', '代码生成', '6', 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', '1', 'admin', null, '/tool/gen/importTable', '127.0.0.1', '内网IP', 'asq_writer', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-04-25 21:22:42');
INSERT INTO `sys_oper_log` VALUES ('154', '代码生成', '2', 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', '1', 'admin', null, '/tool/gen', '127.0.0.1', '内网IP', '{\"sub\":false,\"functionAuthor\":\"liefox\",\"columns\":[{\"capJavaField\":\"WriterId\",\"usableColumn\":false,\"columnId\":22,\"isIncrement\":\"1\",\"increment\":true,\"insert\":true,\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"writerId\",\"htmlType\":\"input\",\"edit\":false,\"query\":false,\"sort\":1,\"list\":false,\"params\":{},\"javaType\":\"Long\",\"queryType\":\"EQ\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"isPk\":\"1\",\"createTime\":1650892962000,\"tableId\":4,\"pk\":true,\"columnName\":\"writer_id\"},{\"capJavaField\":\"WriterName\",\"usableColumn\":false,\"columnId\":23,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"writerName\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"作者姓名\",\"isQuery\":\"1\",\"sort\":2,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"LIKE\",\"columnType\":\"varchar(20)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1650892962000,\"isEdit\":\"1\",\"tableId\":4,\"pk\":false,\"columnName\":\"writer_name\"},{\"capJavaField\":\"WriterInfo\",\"usableColumn\":false,\"columnId\":24,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"writerInfo\",\"htmlType\":\"editor\",\"edit\":true,\"query\":false,\"columnComment\":\"作者详情\",\"sort\":3,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1650892962000,\"isEdit\":\"1\",\"tableId\":4,\"pk\":false,\"columnName\":\"writer_info\"},{\"capJavaField\":\"WriterIntro\",\"usableColumn\":false,\"columnId\":25,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"writerIntro\",\"htmlType\":\"input\",\"edit\":true,\"query\":false,\"columnComment\":\"作者座右铭\",\"sort\":4,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"creat', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-04-25 21:24:51');
INSERT INTO `sys_oper_log` VALUES ('155', '菜单管理', '1', 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', '1', 'admin', null, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"peoples\",\"orderNum\":\"2\",\"menuName\":\"作者管理\",\"params\":{},\"parentId\":0,\"isCache\":\"0\",\"path\":\"writerM\",\"createBy\":\"admin\",\"children\":[],\"isFrame\":\"1\",\"menuType\":\"M\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-04-25 21:26:24');
INSERT INTO `sys_oper_log` VALUES ('156', '代码生成', '2', 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', '1', 'admin', null, '/tool/gen', '127.0.0.1', '内网IP', '{\"sub\":false,\"functionAuthor\":\"liefox\",\"columns\":[{\"capJavaField\":\"WriterId\",\"usableColumn\":false,\"columnId\":22,\"isIncrement\":\"1\",\"increment\":true,\"insert\":true,\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"writerId\",\"htmlType\":\"input\",\"edit\":false,\"query\":false,\"updateTime\":1650893091000,\"sort\":1,\"list\":false,\"params\":{},\"javaType\":\"Long\",\"queryType\":\"EQ\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"isPk\":\"1\",\"createTime\":1650892962000,\"tableId\":4,\"pk\":true,\"columnName\":\"writer_id\"},{\"capJavaField\":\"WriterName\",\"usableColumn\":false,\"columnId\":23,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"writerName\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"作者姓名\",\"isQuery\":\"1\",\"updateTime\":1650893091000,\"sort\":2,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"LIKE\",\"columnType\":\"varchar(20)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1650892962000,\"isEdit\":\"1\",\"tableId\":4,\"pk\":false,\"columnName\":\"writer_name\"},{\"capJavaField\":\"WriterInfo\",\"usableColumn\":false,\"columnId\":24,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"writerInfo\",\"htmlType\":\"editor\",\"edit\":true,\"query\":false,\"columnComment\":\"作者详情\",\"updateTime\":1650893091000,\"sort\":3,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1650892962000,\"isEdit\":\"1\",\"tableId\":4,\"pk\":false,\"columnName\":\"writer_info\"},{\"capJavaField\":\"WriterIntro\",\"usableColumn\":false,\"columnId\":25,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"writerIntro\",\"htmlType\":\"input\",\"edit\":true,\"query\":false,\"columnComment\":\"作者座右铭\",\"updateTime\":1650893091000,\"sort\":4,\"list\":true,\"para', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-04-25 21:26:58');
INSERT INTO `sys_oper_log` VALUES ('157', '代码生成', '8', 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', '1', 'admin', null, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{}', 'null', '0', null, '2022-04-25 21:27:03');
INSERT INTO `sys_oper_log` VALUES ('158', '代码生成', '8', 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', '1', 'admin', null, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{}', 'null', '0', null, '2022-04-25 21:27:21');
INSERT INTO `sys_oper_log` VALUES ('159', '作者管理', '1', 'com.ruoyi.controller.AsqWriterController.add()', 'POST', '1', 'admin', null, '/writer/writer', '127.0.0.1', '内网IP', '{\"writerIntro\":\"千里马常有，而伯乐。。。。\",\"params\":{},\"writerName\":\"期刊1\",\"writerId\":1,\"writerInfo\":\"<p><img src=\\\"/dev-api/profile/upload/2022/04/25/c716b837-2e1c-4b16-8c67-4510c652111f.jpg\\\"></p><p>我是期刊1111</p>\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-04-25 21:46:46');
INSERT INTO `sys_oper_log` VALUES ('160', '代码生成', '2', 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', '1', 'admin', null, '/tool/gen', '127.0.0.1', '内网IP', '{\"sub\":false,\"functionAuthor\":\"liefox\",\"columns\":[{\"capJavaField\":\"WriterId\",\"usableColumn\":false,\"columnId\":22,\"isIncrement\":\"1\",\"increment\":true,\"insert\":true,\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"writerId\",\"htmlType\":\"input\",\"edit\":false,\"query\":false,\"updateTime\":1650893218000,\"sort\":1,\"list\":false,\"params\":{},\"javaType\":\"Long\",\"queryType\":\"EQ\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"isPk\":\"1\",\"createTime\":1650892962000,\"tableId\":4,\"pk\":true,\"columnName\":\"writer_id\"},{\"capJavaField\":\"WriterName\",\"usableColumn\":false,\"columnId\":23,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"writerName\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"作者姓名\",\"isQuery\":\"1\",\"updateTime\":1650893218000,\"sort\":2,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"LIKE\",\"columnType\":\"varchar(20)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1650892962000,\"isEdit\":\"1\",\"tableId\":4,\"pk\":false,\"columnName\":\"writer_name\"},{\"capJavaField\":\"WriterInfo\",\"usableColumn\":false,\"columnId\":24,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"writerInfo\",\"htmlType\":\"editor\",\"edit\":true,\"query\":false,\"columnComment\":\"作者详情\",\"updateTime\":1650893218000,\"sort\":3,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1650892962000,\"isEdit\":\"1\",\"tableId\":4,\"pk\":false,\"columnName\":\"writer_info\"},{\"capJavaField\":\"WriterIntro\",\"usableColumn\":false,\"columnId\":25,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"writerIntro\",\"htmlType\":\"input\",\"edit\":true,\"query\":false,\"columnComment\":\"作者座右铭\",\"updateTime\":1650893218000,\"sort\":4,\"list\":true,\"para', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-04-25 21:47:32');
INSERT INTO `sys_oper_log` VALUES ('161', '作者管理', '2', 'com.ruoyi.controller.AsqWriterController.edit()', 'PUT', '1', 'admin', null, '/writer/writer', '127.0.0.1', '内网IP', '{\"writerIntro\":\"千里马常有，而伯乐。。。。\",\"params\":{},\"writerPic\":\"/profile/upload/2022/04/25/4124bc61-dfc5-42d3-8bab-c52b3b549966.jpeg\",\"writerName\":\"期刊1\",\"writerId\":1,\"writerInfo\":\"<p><img src=\\\"/dev-api/profile/upload/2022/04/25/c716b837-2e1c-4b16-8c67-4510c652111f.jpg\\\"></p><p>我是期刊1111</p>\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-04-25 21:50:14');
INSERT INTO `sys_oper_log` VALUES ('162', '作者管理', '1', 'com.ruoyi.controller.AsqWriterController.add()', 'POST', '1', 'admin', null, '/writer/writer', '127.0.0.1', '内网IP', '{\"params\":{},\"writerPic\":\"/profile/upload/2022/04/25/b5d30292-985b-42bf-9f7e-49c7ed0e298d.jpeg\",\"writerName\":\"liefox\",\"writerId\":2}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-04-25 23:18:49');
INSERT INTO `sys_oper_log` VALUES ('163', '期刊管理', '2', 'com.ruoyi.controller.AsqBooksController.edit()', 'PUT', '1', 'admin', null, '/bookM/books', '127.0.0.1', '内网IP', '{\"bookPress\":\"工作室\",\"params\":{},\"bookCover\":\"/profile/upload/2022/03/22/be03beb9-da38-40ab-b667-558f7af26e8d.jpeg\",\"bookName\":\"前后端分离\",\"bookId\":1,\"bookPubDate\":1647878400000,\"bookUpDate\":1647878400000,\"bookWriterName\":\"liefox\",\"bookType\":\"Java\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-04-25 23:41:58');
INSERT INTO `sys_oper_log` VALUES ('164', '作者管理', '1', 'com.ruoyi.controller.AsqWriterController.add()', 'POST', '1', 'admin', null, '/writer/writer', '127.0.0.1', '内网IP', '{\"writerIntro\":\"你好\",\"params\":{},\"writerPic\":\"/profile/upload/2022/04/27/e35fd0f9-4e96-4346-9ab9-0d2bf8027ccb.jpg\",\"writerName\":\"lieos\",\"writerId\":3,\"writerInfo\":\"<p>你好</p>\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-04-27 11:45:03');
INSERT INTO `sys_oper_log` VALUES ('165', '作者管理', '2', 'com.ruoyi.controller.AsqWriterController.edit()', 'PUT', '1', 'admin', null, '/writer/writer', '127.0.0.1', '内网IP', '{\"writerIntro\":\"你好\",\"params\":{},\"writerPic\":\"/profile/upload/2022/04/27/e35fd0f9-4e96-4346-9ab9-0d2bf8027ccb.jpg\",\"writerName\":\"左\",\"writerId\":3,\"writerInfo\":\"<p>你好</p>\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-04-27 11:46:33');
INSERT INTO `sys_oper_log` VALUES ('166', '作者管理', '2', 'com.ruoyi.controller.AsqWriterController.edit()', 'PUT', '1', 'admin', null, '/writer/writer', '127.0.0.1', '内网IP', '{\"writerIntro\":\"你好\",\"params\":{},\"writerPic\":\"/profile/upload/2022/04/27/e35fd0f9-4e96-4346-9ab9-0d2bf8027ccb.jpg\",\"writerName\":\"leisure\",\"writerId\":3,\"writerInfo\":\"<p>你好</p>\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-04-27 11:47:15');
INSERT INTO `sys_oper_log` VALUES ('167', '个人信息', '2', 'com.ruoyi.web.controller.system.SysProfileController.updatePwd()', 'PUT', '1', 'admin', null, '/system/user/profile/updatePwd', '127.0.0.1', '内网IP', '199513gG admin123', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-05-02 14:58:06');
INSERT INTO `sys_oper_log` VALUES ('168', '菜单管理', '2', 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', '1', 'admin', null, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"education\",\"orderNum\":\"3\",\"menuName\":\"期刊管理\",\"params\":{},\"parentId\":0,\"isCache\":\"0\",\"path\":\"bookM\",\"children\":[],\"createTime\":1647935022000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2015,\"menuType\":\"M\",\"perms\":\"\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-05-02 15:49:29');
INSERT INTO `sys_oper_log` VALUES ('169', '菜单管理', '2', 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', '1', 'admin', null, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"peoples\",\"orderNum\":\"3\",\"menuName\":\"作者管理\",\"params\":{},\"parentId\":0,\"isCache\":\"0\",\"path\":\"writerM\",\"children\":[],\"createTime\":1650893184000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2022,\"menuType\":\"M\",\"perms\":\"\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-05-02 15:49:39');
INSERT INTO `sys_oper_log` VALUES ('170', '作者管理', '2', 'com.ruoyi.controller.AsqWriterController.edit()', 'PUT', '1', 'admin', null, '/writer/writer', '127.0.0.1', '内网IP', '{\"params\":{},\"writerPic\":\"/profile/upload/2022/04/25/b5d30292-985b-42bf-9f7e-49c7ed0e298d.jpeg\",\"writerName\":\"你好\",\"writerId\":2}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-05-02 16:07:18');
INSERT INTO `sys_oper_log` VALUES ('171', '作者管理', '1', 'com.ruoyi.controller.AsqWriterController.add()', 'POST', '1', 'admin', null, '/writer/writer', '127.0.0.1', '内网IP', '{\"params\":{},\"writerName\":\"萨达\",\"writerId\":4}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-05-02 16:07:42');
INSERT INTO `sys_oper_log` VALUES ('172', '作者管理', '2', 'com.ruoyi.controller.AsqWriterController.edit()', 'PUT', '1', 'admin', null, '/writer/writer', '127.0.0.1', '内网IP', '{\"params\":{},\"writerPic\":\"/profile/upload/2022/05/02/7cb2225f-bc7f-4757-928a-19f2e30f3e2a.jpg\",\"writerName\":\"萨达\",\"writerId\":4}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-05-02 16:09:39');
INSERT INTO `sys_oper_log` VALUES ('173', '代码生成', '2', 'com.ruoyi.generator.controller.GenController.synchDb()', 'GET', '1', 'admin', null, '/tool/gen/synchDb/asq_books', '127.0.0.1', '内网IP', '{tableName=asq_books}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-05-02 17:01:49');
INSERT INTO `sys_oper_log` VALUES ('174', '代码生成', '2', 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', '1', 'admin', null, '/tool/gen', '127.0.0.1', '内网IP', '{\"sub\":false,\"functionAuthor\":\"ruoyi\",\"columns\":[{\"capJavaField\":\"BookId\",\"usableColumn\":false,\"columnId\":14,\"isIncrement\":\"1\",\"increment\":true,\"insert\":true,\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"bookId\",\"htmlType\":\"input\",\"edit\":false,\"query\":false,\"updateTime\":1647935152000,\"sort\":1,\"list\":false,\"params\":{},\"javaType\":\"Long\",\"queryType\":\"EQ\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"isPk\":\"1\",\"createTime\":1647917660000,\"tableId\":3,\"pk\":true,\"columnName\":\"book_id\"},{\"capJavaField\":\"BookWriterName\",\"usableColumn\":false,\"columnId\":15,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"bookWriterName\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"期刊作者姓名\",\"isQuery\":\"1\",\"updateTime\":1647935152000,\"sort\":2,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"LIKE\",\"columnType\":\"varchar(20)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1647917660000,\"isEdit\":\"1\",\"tableId\":3,\"pk\":false,\"columnName\":\"book_writer_name\"},{\"capJavaField\":\"BookName\",\"usableColumn\":false,\"columnId\":16,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"bookName\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"期刊名\",\"isQuery\":\"1\",\"updateTime\":1647935152000,\"sort\":3,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"LIKE\",\"columnType\":\"varchar(20)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1647917660000,\"isEdit\":\"1\",\"tableId\":3,\"pk\":false,\"columnName\":\"book_name\"},{\"capJavaField\":\"BookType\",\"usableColumn\":false,\"columnId\":17,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"book_type\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"bookType\",\"htmlType\":\"select\",\"edit\":true,\"query\":true,\"columnComment\":\"期刊类型\",\"isQuery\":\"1\",\"updateTime\":1647935152', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-05-02 17:02:51');
INSERT INTO `sys_oper_log` VALUES ('175', '字典类型', '1', 'com.ruoyi.web.controller.system.SysDictTypeController.add()', 'POST', '1', 'admin', null, '/system/dict/type', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"dictName\":\"期刊审核状态\",\"params\":{},\"dictType\":\"book_audit\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-05-02 17:03:26');
INSERT INTO `sys_oper_log` VALUES ('176', '字典数据', '1', 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', '1', 'admin', null, '/system/dict/data', '127.0.0.1', '内网IP', '{\"dictValue\":\"0\",\"listClass\":\"default\",\"dictSort\":0,\"params\":{},\"dictType\":\"book_audit\",\"dictLabel\":\"待审核\",\"createBy\":\"admin\",\"default\":false,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-05-02 17:03:53');
INSERT INTO `sys_oper_log` VALUES ('177', '字典数据', '1', 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', '1', 'admin', null, '/system/dict/data', '127.0.0.1', '内网IP', '{\"dictValue\":\"1\",\"listClass\":\"default\",\"dictSort\":0,\"params\":{},\"dictType\":\"book_audit\",\"dictLabel\":\"审核成功\",\"createBy\":\"admin\",\"default\":false,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-05-02 17:04:03');
INSERT INTO `sys_oper_log` VALUES ('178', '字典数据', '1', 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', '1', 'admin', null, '/system/dict/data', '127.0.0.1', '内网IP', '{\"dictValue\":\"2\",\"listClass\":\"default\",\"dictSort\":0,\"params\":{},\"dictType\":\"book_audit\",\"dictLabel\":\"审核失败\",\"createBy\":\"admin\",\"default\":false,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-05-02 17:04:13');
INSERT INTO `sys_oper_log` VALUES ('179', '代码生成', '2', 'com.ruoyi.generator.controller.GenController.synchDb()', 'GET', '1', 'admin', null, '/tool/gen/synchDb/asq_books', '127.0.0.1', '内网IP', '{tableName=asq_books}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-05-02 17:20:36');
INSERT INTO `sys_oper_log` VALUES ('180', '代码生成', '2', 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', '1', 'admin', null, '/tool/gen', '127.0.0.1', '内网IP', '{\"sub\":false,\"functionAuthor\":\"ruoyi\",\"columns\":[{\"capJavaField\":\"BookId\",\"usableColumn\":false,\"columnId\":14,\"isIncrement\":\"1\",\"increment\":true,\"insert\":true,\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"bookId\",\"htmlType\":\"input\",\"edit\":false,\"query\":false,\"updateTime\":1651482171000,\"sort\":1,\"list\":false,\"params\":{},\"javaType\":\"Long\",\"queryType\":\"EQ\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"isPk\":\"1\",\"createTime\":1647917660000,\"tableId\":3,\"pk\":true,\"columnName\":\"book_id\"},{\"capJavaField\":\"BookWriterName\",\"usableColumn\":false,\"columnId\":15,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"bookWriterName\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"期刊作者姓名\",\"isQuery\":\"1\",\"updateTime\":1651482171000,\"sort\":2,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"LIKE\",\"columnType\":\"varchar(20)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1647917660000,\"isEdit\":\"1\",\"tableId\":3,\"pk\":false,\"columnName\":\"book_writer_name\"},{\"capJavaField\":\"BookName\",\"usableColumn\":false,\"columnId\":16,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"bookName\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"期刊名\",\"isQuery\":\"1\",\"updateTime\":1651482171000,\"sort\":3,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"LIKE\",\"columnType\":\"varchar(20)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1647917660000,\"isEdit\":\"1\",\"tableId\":3,\"pk\":false,\"columnName\":\"book_name\"},{\"capJavaField\":\"BookType\",\"usableColumn\":false,\"columnId\":17,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"book_type\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"bookType\",\"htmlType\":\"select\",\"edit\":true,\"query\":true,\"columnComment\":\"期刊类型\",\"isQuery\":\"1\",\"updateTime\":1651482171', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-05-02 17:21:38');
INSERT INTO `sys_oper_log` VALUES ('181', '期刊管理', '2', 'com.ruoyi.controller.AsqBooksController.edit()', 'PUT', '1', 'admin', null, '/bookM/books', '127.0.0.1', '内网IP', '{\"bookPress\":\"工作室\",\"params\":{},\"bookCover\":\"/profile/upload/2022/03/22/be03beb9-da38-40ab-b667-558f7af26e8d.jpeg\",\"bookName\":\"前后端分离\",\"bookId\":1,\"bookPubDate\":1647878400000,\"bookUpDate\":1647878400000,\"bookWriterName\":\"liefox\",\"bookAudit\":0,\"bookPdfUrl\":\"/profile/upload/2022/05/02/05c3662b-941b-4631-b2cd-6c7e24b518b9.pdf\",\"bookType\":\"Java\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-05-02 17:35:39');
INSERT INTO `sys_oper_log` VALUES ('182', '期刊管理', '2', 'com.ruoyi.controller.AsqBooksController.edit()', 'PUT', '1', 'admin', null, '/bookM/books', '127.0.0.1', '内网IP', '{\"bookPress\":\"工作室\",\"params\":{},\"bookCover\":\"/profile/upload/2022/03/22/be03beb9-da38-40ab-b667-558f7af26e8d.jpeg\",\"bookName\":\"前后端分离\",\"bookId\":1,\"bookPubDate\":1647878400000,\"bookUpDate\":1647878400000,\"bookWriterName\":\"liefox\",\"bookAudit\":0,\"bookPdfUrl\":\"/profile/upload/2022/05/02/05c3662b-941b-4631-b2cd-6c7e24b518b9.pdf\",\"bookType\":\"Java\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-05-02 17:36:40');
INSERT INTO `sys_oper_log` VALUES ('183', '期刊管理', '2', 'com.ruoyi.controller.AsqBooksController.edit()', 'PUT', '1', 'admin', null, '/bookM/books', '127.0.0.1', '内网IP', '{\"bookPress\":\"工作室\",\"params\":{},\"bookCover\":\"/profile/upload/2022/03/22/be03beb9-da38-40ab-b667-558f7af26e8d.jpeg\",\"bookName\":\"前后端分离\",\"bookId\":1,\"bookPubDate\":1647878400000,\"bookUpDate\":1647878400000,\"bookWriterName\":\"liefox\",\"bookAudit\":0,\"bookPdfUrl\":\"/profile/upload/2022/05/02/3c84954e-fcde-49af-ba28-338bdac2c5bb.pdf\",\"bookType\":\"Java\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-05-02 17:47:45');
INSERT INTO `sys_oper_log` VALUES ('184', '期刊管理', '2', 'com.ruoyi.controller.AsqBooksController.edit()', 'PUT', '1', 'admin', null, '/bookM/books', '127.0.0.1', '内网IP', '{\"bookPress\":\"工作室\",\"params\":{},\"bookCover\":\"/profile/upload/2022/03/22/be03beb9-da38-40ab-b667-558f7af26e8d.jpeg\",\"bookName\":\"前后端分离\",\"bookId\":1,\"bookPubDate\":1647878400000,\"bookUpDate\":1647878400000,\"bookWriterName\":\"liefox\",\"bookAudit\":1,\"bookPdfUrl\":\"/profile/upload/2022/05/02/3c84954e-fcde-49af-ba28-338bdac2c5bb.pdf\",\"bookType\":\"Java\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-05-02 17:49:02');
INSERT INTO `sys_oper_log` VALUES ('185', '参数管理', '2', 'com.ruoyi.web.controller.system.SysConfigController.edit()', 'PUT', '1', 'admin', null, '/system/config', '127.0.0.1', '内网IP', '{\"configName\":\"账号自助-是否开启用户注册功能\",\"configKey\":\"sys.account.registerUser\",\"createBy\":\"admin\",\"createTime\":1647869593000,\"updateBy\":\"admin\",\"configId\":5,\"remark\":\"是否开启注册用户功能（true开启，false关闭）\",\"configType\":\"Y\",\"configValue\":\"true\",\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-05-02 18:10:14');
INSERT INTO `sys_oper_log` VALUES ('186', '字典数据', '2', 'com.ruoyi.web.controller.system.SysDictDataController.edit()', 'PUT', '1', 'admin', null, '/system/dict/data', '127.0.0.1', '内网IP', '{\"dictValue\":\"0\",\"listClass\":\"warning\",\"dictSort\":0,\"params\":{},\"dictType\":\"book_audit\",\"dictLabel\":\"待审核\",\"createBy\":\"admin\",\"default\":false,\"isDefault\":\"N\",\"createTime\":1651482233000,\"dictCode\":103,\"updateBy\":\"admin\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-05-02 18:30:20');
INSERT INTO `sys_oper_log` VALUES ('187', '字典数据', '2', 'com.ruoyi.web.controller.system.SysDictDataController.edit()', 'PUT', '1', 'admin', null, '/system/dict/data', '127.0.0.1', '内网IP', '{\"dictValue\":\"0\",\"listClass\":\"warning\",\"dictSort\":0,\"params\":{},\"dictType\":\"book_audit\",\"dictLabel\":\"待审核\",\"createBy\":\"admin\",\"default\":false,\"isDefault\":\"N\",\"createTime\":1651482233000,\"dictCode\":103,\"updateBy\":\"admin\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-05-02 18:30:21');
INSERT INTO `sys_oper_log` VALUES ('188', '字典数据', '2', 'com.ruoyi.web.controller.system.SysDictDataController.edit()', 'PUT', '1', 'admin', null, '/system/dict/data', '127.0.0.1', '内网IP', '{\"dictValue\":\"1\",\"listClass\":\"success\",\"dictSort\":0,\"params\":{},\"dictType\":\"book_audit\",\"dictLabel\":\"审核成功\",\"createBy\":\"admin\",\"default\":false,\"isDefault\":\"N\",\"createTime\":1651482243000,\"dictCode\":104,\"updateBy\":\"admin\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-05-02 18:30:29');
INSERT INTO `sys_oper_log` VALUES ('189', '字典数据', '2', 'com.ruoyi.web.controller.system.SysDictDataController.edit()', 'PUT', '1', 'admin', null, '/system/dict/data', '127.0.0.1', '内网IP', '{\"dictValue\":\"2\",\"listClass\":\"danger\",\"dictSort\":0,\"params\":{},\"dictType\":\"book_audit\",\"dictLabel\":\"审核失败\",\"createBy\":\"admin\",\"default\":false,\"isDefault\":\"N\",\"createTime\":1651482253000,\"dictCode\":105,\"updateBy\":\"admin\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-05-02 18:30:35');
INSERT INTO `sys_oper_log` VALUES ('190', '作者管理', '1', 'com.ruoyi.controller.AsqWriterController.add()', 'POST', '1', 'admin', null, '/writer/writer', '127.0.0.1', '内网IP', '{\"params\":{},\"writerName\":\"佐佳豪\",\"writerId\":5}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-05-02 18:31:39');
INSERT INTO `sys_oper_log` VALUES ('191', '作者管理', '3', 'com.ruoyi.controller.AsqWriterController.remove()', 'DELETE', '1', 'admin', null, '/writer/writer/5,4,3,2', '127.0.0.1', '内网IP', '{writerIds=5,4,3,2}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-05-02 19:05:22');
INSERT INTO `sys_oper_log` VALUES ('192', '作者管理', '1', 'com.ruoyi.controller.AsqWriterController.add()', 'POST', '1', 'admin', null, '/writer/writer', '127.0.0.1', '内网IP', '{\"params\":{},\"writerName\":\"佐佳豪\",\"writerId\":6}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-05-02 19:06:10');
INSERT INTO `sys_oper_log` VALUES ('193', '菜单管理', '2', 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', '1', 'admin', null, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"#\",\"orderNum\":\"1\",\"menuName\":\"期刊管理\",\"params\":{},\"parentId\":2015,\"isCache\":\"1\",\"path\":\"books\",\"component\":\"bookM/books/index\",\"children\":[],\"createTime\":1647935374000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2016,\"menuType\":\"C\",\"perms\":\"bookM:books:list\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-05-02 19:09:42');
INSERT INTO `sys_oper_log` VALUES ('194', '作者管理', '2', 'com.ruoyi.controller.AsqWriterController.edit()', 'PUT', '1', 'admin', null, '/writer/writer', '127.0.0.1', '内网IP', '{\"params\":{},\"writerName\":\"佳豪\",\"writerId\":6}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-05-02 19:09:57');
INSERT INTO `sys_oper_log` VALUES ('195', '作者管理', '3', 'com.ruoyi.controller.AsqWriterController.remove()', 'DELETE', '1', 'admin', null, '/writer/writer/6', '127.0.0.1', '内网IP', '{writerIds=6}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-05-02 19:10:40');
INSERT INTO `sys_oper_log` VALUES ('196', '作者管理', '1', 'com.ruoyi.controller.AsqWriterController.add()', 'POST', '1', 'admin', null, '/writer/writer', '127.0.0.1', '内网IP', '{\"params\":{},\"writerName\":\"1\",\"writerId\":7}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-05-02 19:11:37');
INSERT INTO `sys_oper_log` VALUES ('197', '作者管理', '2', 'com.ruoyi.controller.AsqWriterController.edit()', 'PUT', '1', 'admin', null, '/writer/writer', '127.0.0.1', '内网IP', '{\"params\":{},\"writerName\":\"2\",\"writerId\":7}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-05-02 19:11:52');
INSERT INTO `sys_oper_log` VALUES ('198', '菜单管理', '2', 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', '1', 'admin', null, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"#\",\"orderNum\":\"1\",\"menuName\":\"期刊管理\",\"params\":{},\"parentId\":2015,\"isCache\":\"1\",\"path\":\"books\",\"component\":\"bookM/books/index\",\"children\":[],\"createTime\":1647935374000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2016,\"menuType\":\"C\",\"perms\":\"bookM:books:list\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-05-02 19:12:55');
INSERT INTO `sys_oper_log` VALUES ('199', '作者管理', '2', 'com.ruoyi.controller.AsqWriterController.edit()', 'PUT', '1', 'admin', null, '/writer/writer', '127.0.0.1', '内网IP', '{\"params\":{},\"writerName\":\"3\",\"writerId\":7}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-05-02 19:13:07');
INSERT INTO `sys_oper_log` VALUES ('200', '作者管理', '2', 'com.ruoyi.controller.AsqWriterController.edit()', 'PUT', '1', 'admin', null, '/writer/writer', '127.0.0.1', '内网IP', '{\"params\":{},\"writerPic\":\"/profile/upload/2022/05/02/8d4e9a34-ae54-47e4-a564-9c3d27d320f4.jpg\",\"writerName\":\"3\",\"writerId\":7}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-05-02 19:49:18');
INSERT INTO `sys_oper_log` VALUES ('201', '代码生成', '6', 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', '1', 'admin', null, '/tool/gen/importTable', '127.0.0.1', '内网IP', 'asq_ppt', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-07-24 18:17:53');
INSERT INTO `sys_oper_log` VALUES ('202', '代码生成', '2', 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', '1', 'admin', null, '/tool/gen', '127.0.0.1', '内网IP', '{\"sub\":false,\"functionAuthor\":\"ruoyi\",\"columns\":[{\"capJavaField\":\"PptId\",\"usableColumn\":false,\"columnId\":29,\"isIncrement\":\"1\",\"increment\":true,\"insert\":true,\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"pptId\",\"htmlType\":\"input\",\"edit\":false,\"query\":false,\"columnComment\":\"ID\",\"sort\":1,\"list\":false,\"params\":{},\"javaType\":\"Long\",\"queryType\":\"EQ\",\"columnType\":\"int(20)\",\"createBy\":\"admin\",\"isPk\":\"1\",\"createTime\":1658657873000,\"tableId\":5,\"pk\":true,\"columnName\":\"ppt_id\"},{\"capJavaField\":\"PptName\",\"usableColumn\":false,\"columnId\":30,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"pptName\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"幻灯片名称\",\"isQuery\":\"1\",\"sort\":2,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"LIKE\",\"columnType\":\"varchar(50)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1658657873000,\"isEdit\":\"1\",\"tableId\":5,\"pk\":false,\"columnName\":\"ppt_name\"},{\"capJavaField\":\"PptPic\",\"usableColumn\":false,\"columnId\":31,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"pptPic\",\"htmlType\":\"imageUpload\",\"edit\":true,\"query\":false,\"columnComment\":\"图片\",\"sort\":3,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1658657873000,\"isEdit\":\"1\",\"tableId\":5,\"pk\":false,\"columnName\":\"ppt_pic\"},{\"capJavaField\":\"PptUrl\",\"usableColumn\":false,\"columnId\":32,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"pptUrl\",\"htmlType\":\"input\",\"edit\":true,\"query\":false,\"columnComment\":\"跳转路径\",\"sort\":4,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1658657873000', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-07-24 18:20:54');
INSERT INTO `sys_oper_log` VALUES ('203', '菜单管理', '1', 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', '1', 'admin', null, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"clipboard\",\"orderNum\":\"4\",\"menuName\":\"前台首页幻灯片管理\",\"params\":{},\"parentId\":0,\"isCache\":\"0\",\"path\":\"ppt\",\"createBy\":\"admin\",\"children\":[],\"isFrame\":\"1\",\"menuType\":\"M\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-07-24 18:22:14');
INSERT INTO `sys_oper_log` VALUES ('204', '字典类型', '1', 'com.ruoyi.web.controller.system.SysDictTypeController.add()', 'POST', '1', 'admin', null, '/system/dict/type', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"dictName\":\"幻灯片类型\",\"params\":{},\"dictType\":\"pptType\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-07-24 18:22:44');
INSERT INTO `sys_oper_log` VALUES ('205', '字典类型', '2', 'com.ruoyi.web.controller.system.SysDictTypeController.edit()', 'PUT', '1', 'admin', null, '/system/dict/type', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":1658658164000,\"updateBy\":\"admin\",\"dictName\":\"幻灯片类型\",\"dictId\":102,\"params\":{},\"dictType\":\"ppt_type\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-07-24 18:22:57');
INSERT INTO `sys_oper_log` VALUES ('206', '字典数据', '1', 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', '1', 'admin', null, '/system/dict/data', '127.0.0.1', '内网IP', '{\"dictValue\":\"1\",\"listClass\":\"default\",\"dictSort\":0,\"params\":{},\"dictType\":\"ppt_type\",\"dictLabel\":\"期刊\",\"createBy\":\"admin\",\"default\":false,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-07-24 18:23:22');
INSERT INTO `sys_oper_log` VALUES ('207', '字典数据', '1', 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', '1', 'admin', null, '/system/dict/data', '127.0.0.1', '内网IP', '{\"dictValue\":\"2\",\"listClass\":\"default\",\"dictSort\":0,\"params\":{},\"dictType\":\"ppt_type\",\"dictLabel\":\"文章\",\"createBy\":\"admin\",\"default\":false,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-07-24 18:23:37');
INSERT INTO `sys_oper_log` VALUES ('208', '字典数据', '1', 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', '1', 'admin', null, '/system/dict/data', '127.0.0.1', '内网IP', '{\"dictValue\":\"3\",\"listClass\":\"default\",\"dictSort\":0,\"params\":{},\"dictType\":\"ppt_type\",\"dictLabel\":\"第三方\",\"createBy\":\"admin\",\"default\":false,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-07-24 18:23:45');
INSERT INTO `sys_oper_log` VALUES ('209', '代码生成', '2', 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', '1', 'admin', null, '/tool/gen', '127.0.0.1', '内网IP', '{\"sub\":false,\"functionAuthor\":\"ruoyi\",\"columns\":[{\"capJavaField\":\"PptId\",\"usableColumn\":false,\"columnId\":29,\"isIncrement\":\"1\",\"increment\":true,\"insert\":true,\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"pptId\",\"htmlType\":\"input\",\"edit\":false,\"query\":false,\"columnComment\":\"ID\",\"updateTime\":1658658054000,\"sort\":1,\"list\":false,\"params\":{},\"javaType\":\"Long\",\"queryType\":\"EQ\",\"columnType\":\"int(20)\",\"createBy\":\"admin\",\"isPk\":\"1\",\"createTime\":1658657873000,\"tableId\":5,\"pk\":true,\"columnName\":\"ppt_id\"},{\"capJavaField\":\"PptName\",\"usableColumn\":false,\"columnId\":30,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"pptName\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"名称\",\"isQuery\":\"1\",\"updateTime\":1658658054000,\"sort\":2,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"LIKE\",\"columnType\":\"varchar(50)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1658657873000,\"isEdit\":\"1\",\"tableId\":5,\"pk\":false,\"columnName\":\"ppt_name\"},{\"capJavaField\":\"PptPic\",\"usableColumn\":false,\"columnId\":31,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"pptPic\",\"htmlType\":\"imageUpload\",\"edit\":true,\"query\":false,\"columnComment\":\"图片\",\"updateTime\":1658658054000,\"sort\":3,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1658657873000,\"isEdit\":\"1\",\"tableId\":5,\"pk\":false,\"columnName\":\"ppt_pic\"},{\"capJavaField\":\"PptUrl\",\"usableColumn\":false,\"columnId\":32,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"pptUrl\",\"htmlType\":\"input\",\"edit\":true,\"query\":false,\"columnComment\":\"跳转路径\",\"updateTime\":1658658054000,\"sort\":4,\"list\":true,\"params\":{},\"javaType\":\"Stri', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-07-24 18:25:03');
INSERT INTO `sys_oper_log` VALUES ('210', '代码生成', '8', 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', '1', 'admin', null, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{}', 'null', '0', null, '2022-07-24 18:25:19');
INSERT INTO `sys_oper_log` VALUES ('211', '菜单管理', '2', 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', '1', 'admin', null, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"clipboard\",\"orderNum\":\"3\",\"menuName\":\"前台幻灯片管理\",\"params\":{},\"parentId\":0,\"isCache\":\"0\",\"path\":\"ppt\",\"children\":[],\"createTime\":1658658134000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2029,\"menuType\":\"M\",\"perms\":\"\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-07-24 19:24:03');
INSERT INTO `sys_oper_log` VALUES ('212', '菜单管理', '2', 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', '1', 'admin', null, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"#\",\"orderNum\":\"1\",\"menuName\":\"前台幻灯片\",\"params\":{},\"parentId\":2029,\"isCache\":\"0\",\"path\":\"ppt\",\"component\":\"ppt/ppt/index\",\"children\":[],\"createTime\":1658658510000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2030,\"menuType\":\"C\",\"perms\":\"ppt:ppt:list\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-07-24 19:24:18');
INSERT INTO `sys_oper_log` VALUES ('213', '前台首页幻灯片', '1', 'com.ruoyi.controller.AsqPptController.add()', 'POST', '1', 'admin', null, '/ppt/ppt', '127.0.0.1', '内网IP', '{\"pptPic\":\"/profile/upload/2022/07/24/7235bfa2-d507-4f76-8ccc-fc569c1d3155.jpg\",\"params\":{},\"pptType\":3,\"pptId\":1,\"pptDesc\":1,\"pptName\":\"ppt1\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-07-24 19:26:50');
INSERT INTO `sys_oper_log` VALUES ('214', '前台首页幻灯片', '2', 'com.ruoyi.controller.AsqPptController.edit()', 'PUT', '1', 'admin', null, '/ppt/ppt', '127.0.0.1', '内网IP', '{\"pptUrl\":\"https://www.zhihu.com/\",\"pptPic\":\"/profile/upload/2022/07/24/7235bfa2-d507-4f76-8ccc-fc569c1d3155.jpg\",\"params\":{},\"pptType\":3,\"pptId\":1,\"pptDesc\":1,\"pptName\":\"ppt1\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-07-24 19:27:19');
INSERT INTO `sys_oper_log` VALUES ('215', '前台首页幻灯片', '1', 'com.ruoyi.controller.AsqPptController.add()', 'POST', '1', 'admin', null, '/ppt/ppt', '127.0.0.1', '内网IP', '{\"pptUrl\":\"1\",\"pptPic\":\"/profile/upload/2022/07/24/e3b491f1-9fa8-4c57-9208-928d51e40b38.jpeg\",\"params\":{},\"pptType\":1,\"pptId\":2,\"pptDesc\":2,\"pptName\":\"期刊\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-07-24 19:28:15');
INSERT INTO `sys_oper_log` VALUES ('216', '前台首页幻灯片', '2', 'com.ruoyi.controller.AsqPptController.edit()', 'PUT', '1', 'admin', null, '/ppt/ppt', '127.0.0.1', '内网IP', '{\"pptUrl\":\"1\",\"pptPic\":\"/profile/upload/2022/07/24/e3b491f1-9fa8-4c57-9208-928d51e40b38.jpeg\",\"params\":{},\"pptType\":1,\"pptId\":2,\"pptDesc\":2,\"pptName\":\"期刊撒打算打算的\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-07-24 21:22:34');
INSERT INTO `sys_oper_log` VALUES ('217', '前台首页幻灯片', '1', 'com.ruoyi.controller.AsqPptController.add()', 'POST', '1', 'admin', null, '/ppt/ppt', '127.0.0.1', '内网IP', '{\"pptUrl\":\"https://www.zhihu.com/question/543901181\",\"pptPic\":\"/profile/upload/2022/07/24/beecd828-5063-4252-9b4a-b4970b516cdf.jpg\",\"params\":{},\"pptType\":2,\"pptId\":3,\"pptDesc\":3,\"pptName\":\"空间站的文学\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-07-24 21:27:17');

-- ----------------------------
-- Table structure for sys_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_post`;
CREATE TABLE `sys_post` (
                            `post_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '岗位ID',
                            `post_code` varchar(64) NOT NULL COMMENT '岗位编码',
                            `post_name` varchar(50) NOT NULL COMMENT '岗位名称',
                            `post_sort` int(4) NOT NULL COMMENT '显示顺序',
                            `status` char(1) NOT NULL COMMENT '状态（0正常 1停用）',
                            `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
                            `create_time` datetime DEFAULT NULL COMMENT '创建时间',
                            `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
                            `update_time` datetime DEFAULT NULL COMMENT '更新时间',
                            `remark` varchar(500) DEFAULT NULL COMMENT '备注',
                            PRIMARY KEY (`post_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='岗位信息表';

-- ----------------------------
-- Records of sys_post
-- ----------------------------
INSERT INTO `sys_post` VALUES ('1', 'ceo', '董事长', '1', '0', 'admin', '2022-03-21 21:33:12', '', null, '');
INSERT INTO `sys_post` VALUES ('2', 'se', '项目经理', '2', '0', 'admin', '2022-03-21 21:33:12', '', null, '');
INSERT INTO `sys_post` VALUES ('3', 'hr', '人力资源', '3', '0', 'admin', '2022-03-21 21:33:12', '', null, '');
INSERT INTO `sys_post` VALUES ('4', 'user', '普通员工', '4', '0', 'admin', '2022-03-21 21:33:12', '', null, '');

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
                            `role_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '角色ID',
                            `role_name` varchar(30) NOT NULL COMMENT '角色名称',
                            `role_key` varchar(100) NOT NULL COMMENT '角色权限字符串',
                            `role_sort` int(4) NOT NULL COMMENT '显示顺序',
                            `data_scope` char(1) DEFAULT '1' COMMENT '数据范围（1：全部数据权限 2：自定数据权限 3：本部门数据权限 4：本部门及以下数据权限）',
                            `menu_check_strictly` tinyint(1) DEFAULT '1' COMMENT '菜单树选择项是否关联显示',
                            `dept_check_strictly` tinyint(1) DEFAULT '1' COMMENT '部门树选择项是否关联显示',
                            `status` char(1) NOT NULL COMMENT '角色状态（0正常 1停用）',
                            `del_flag` char(1) DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
                            `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
                            `create_time` datetime DEFAULT NULL COMMENT '创建时间',
                            `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
                            `update_time` datetime DEFAULT NULL COMMENT '更新时间',
                            `remark` varchar(500) DEFAULT NULL COMMENT '备注',
                            PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='角色信息表';

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES ('1', '超级管理员', 'admin', '1', '1', '1', '1', '0', '0', 'admin', '2022-03-21 21:33:12', '', null, '超级管理员');
INSERT INTO `sys_role` VALUES ('2', '普通角色', 'common', '2', '2', '1', '1', '0', '0', 'admin', '2022-03-21 21:33:12', '', null, '普通角色');

-- ----------------------------
-- Table structure for sys_role_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_dept`;
CREATE TABLE `sys_role_dept` (
                                 `role_id` bigint(20) NOT NULL COMMENT '角色ID',
                                 `dept_id` bigint(20) NOT NULL COMMENT '部门ID',
                                 PRIMARY KEY (`role_id`,`dept_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色和部门关联表';

-- ----------------------------
-- Records of sys_role_dept
-- ----------------------------
INSERT INTO `sys_role_dept` VALUES ('2', '100');
INSERT INTO `sys_role_dept` VALUES ('2', '101');
INSERT INTO `sys_role_dept` VALUES ('2', '105');

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu` (
                                 `role_id` bigint(20) NOT NULL COMMENT '角色ID',
                                 `menu_id` bigint(20) NOT NULL COMMENT '菜单ID',
                                 PRIMARY KEY (`role_id`,`menu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色和菜单关联表';

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES ('2', '1');
INSERT INTO `sys_role_menu` VALUES ('2', '2');
INSERT INTO `sys_role_menu` VALUES ('2', '3');
INSERT INTO `sys_role_menu` VALUES ('2', '4');
INSERT INTO `sys_role_menu` VALUES ('2', '100');
INSERT INTO `sys_role_menu` VALUES ('2', '101');
INSERT INTO `sys_role_menu` VALUES ('2', '102');
INSERT INTO `sys_role_menu` VALUES ('2', '103');
INSERT INTO `sys_role_menu` VALUES ('2', '104');
INSERT INTO `sys_role_menu` VALUES ('2', '105');
INSERT INTO `sys_role_menu` VALUES ('2', '106');
INSERT INTO `sys_role_menu` VALUES ('2', '107');
INSERT INTO `sys_role_menu` VALUES ('2', '108');
INSERT INTO `sys_role_menu` VALUES ('2', '109');
INSERT INTO `sys_role_menu` VALUES ('2', '110');
INSERT INTO `sys_role_menu` VALUES ('2', '111');
INSERT INTO `sys_role_menu` VALUES ('2', '112');
INSERT INTO `sys_role_menu` VALUES ('2', '113');
INSERT INTO `sys_role_menu` VALUES ('2', '114');
INSERT INTO `sys_role_menu` VALUES ('2', '115');
INSERT INTO `sys_role_menu` VALUES ('2', '116');
INSERT INTO `sys_role_menu` VALUES ('2', '500');
INSERT INTO `sys_role_menu` VALUES ('2', '501');
INSERT INTO `sys_role_menu` VALUES ('2', '1000');
INSERT INTO `sys_role_menu` VALUES ('2', '1001');
INSERT INTO `sys_role_menu` VALUES ('2', '1002');
INSERT INTO `sys_role_menu` VALUES ('2', '1003');
INSERT INTO `sys_role_menu` VALUES ('2', '1004');
INSERT INTO `sys_role_menu` VALUES ('2', '1005');
INSERT INTO `sys_role_menu` VALUES ('2', '1006');
INSERT INTO `sys_role_menu` VALUES ('2', '1007');
INSERT INTO `sys_role_menu` VALUES ('2', '1008');
INSERT INTO `sys_role_menu` VALUES ('2', '1009');
INSERT INTO `sys_role_menu` VALUES ('2', '1010');
INSERT INTO `sys_role_menu` VALUES ('2', '1011');
INSERT INTO `sys_role_menu` VALUES ('2', '1012');
INSERT INTO `sys_role_menu` VALUES ('2', '1013');
INSERT INTO `sys_role_menu` VALUES ('2', '1014');
INSERT INTO `sys_role_menu` VALUES ('2', '1015');
INSERT INTO `sys_role_menu` VALUES ('2', '1016');
INSERT INTO `sys_role_menu` VALUES ('2', '1017');
INSERT INTO `sys_role_menu` VALUES ('2', '1018');
INSERT INTO `sys_role_menu` VALUES ('2', '1019');
INSERT INTO `sys_role_menu` VALUES ('2', '1020');
INSERT INTO `sys_role_menu` VALUES ('2', '1021');
INSERT INTO `sys_role_menu` VALUES ('2', '1022');
INSERT INTO `sys_role_menu` VALUES ('2', '1023');
INSERT INTO `sys_role_menu` VALUES ('2', '1024');
INSERT INTO `sys_role_menu` VALUES ('2', '1025');
INSERT INTO `sys_role_menu` VALUES ('2', '1026');
INSERT INTO `sys_role_menu` VALUES ('2', '1027');
INSERT INTO `sys_role_menu` VALUES ('2', '1028');
INSERT INTO `sys_role_menu` VALUES ('2', '1029');
INSERT INTO `sys_role_menu` VALUES ('2', '1030');
INSERT INTO `sys_role_menu` VALUES ('2', '1031');
INSERT INTO `sys_role_menu` VALUES ('2', '1032');
INSERT INTO `sys_role_menu` VALUES ('2', '1033');
INSERT INTO `sys_role_menu` VALUES ('2', '1034');
INSERT INTO `sys_role_menu` VALUES ('2', '1035');
INSERT INTO `sys_role_menu` VALUES ('2', '1036');
INSERT INTO `sys_role_menu` VALUES ('2', '1037');
INSERT INTO `sys_role_menu` VALUES ('2', '1038');
INSERT INTO `sys_role_menu` VALUES ('2', '1039');
INSERT INTO `sys_role_menu` VALUES ('2', '1040');
INSERT INTO `sys_role_menu` VALUES ('2', '1041');
INSERT INTO `sys_role_menu` VALUES ('2', '1042');
INSERT INTO `sys_role_menu` VALUES ('2', '1043');
INSERT INTO `sys_role_menu` VALUES ('2', '1044');
INSERT INTO `sys_role_menu` VALUES ('2', '1045');
INSERT INTO `sys_role_menu` VALUES ('2', '1046');
INSERT INTO `sys_role_menu` VALUES ('2', '1047');
INSERT INTO `sys_role_menu` VALUES ('2', '1048');
INSERT INTO `sys_role_menu` VALUES ('2', '1049');
INSERT INTO `sys_role_menu` VALUES ('2', '1050');
INSERT INTO `sys_role_menu` VALUES ('2', '1051');
INSERT INTO `sys_role_menu` VALUES ('2', '1052');
INSERT INTO `sys_role_menu` VALUES ('2', '1053');
INSERT INTO `sys_role_menu` VALUES ('2', '1054');
INSERT INTO `sys_role_menu` VALUES ('2', '1055');
INSERT INTO `sys_role_menu` VALUES ('2', '1056');
INSERT INTO `sys_role_menu` VALUES ('2', '1057');
INSERT INTO `sys_role_menu` VALUES ('2', '1058');
INSERT INTO `sys_role_menu` VALUES ('2', '1059');
INSERT INTO `sys_role_menu` VALUES ('2', '1060');

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
                            `user_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '用户ID',
                            `dept_id` bigint(20) DEFAULT NULL COMMENT '部门ID',
                            `user_name` varchar(30) NOT NULL COMMENT '用户账号',
                            `nick_name` varchar(30) NOT NULL COMMENT '用户昵称',
                            `user_type` varchar(2) DEFAULT '00' COMMENT '用户类型（00系统用户）',
                            `email` varchar(50) DEFAULT '' COMMENT '用户邮箱',
                            `phonenumber` varchar(11) DEFAULT '' COMMENT '手机号码',
                            `sex` char(1) DEFAULT '0' COMMENT '用户性别（0男 1女 2未知）',
                            `avatar` varchar(100) DEFAULT '' COMMENT '头像地址',
                            `password` varchar(100) DEFAULT '' COMMENT '密码',
                            `status` char(1) DEFAULT '0' COMMENT '帐号状态（0正常 1停用）',
                            `del_flag` char(1) DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
                            `login_ip` varchar(128) DEFAULT '' COMMENT '最后登录IP',
                            `login_date` datetime DEFAULT NULL COMMENT '最后登录时间',
                            `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
                            `create_time` datetime DEFAULT NULL COMMENT '创建时间',
                            `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
                            `update_time` datetime DEFAULT NULL COMMENT '更新时间',
                            `remark` varchar(500) DEFAULT NULL COMMENT '备注',
                            PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='用户信息表';

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES ('1', '103', 'admin', 'liefox', '00', 'ry@163.com', '15888888888', '1', '', '$2a$10$f4.FI/KBJDYdXF4Q1eqLQe/asWsH43vwXu9jwYSNF3YCBwlRGPTBe', '0', '0', '127.0.0.1', '2022-07-25 12:35:58', 'admin', '2022-03-21 21:33:12', '', '2022-07-25 12:35:57', '管理员');
INSERT INTO `sys_user` VALUES ('2', '105', 'ry', 'liefox', '00', 'ry@qq.com', '15666666666', '1', '', '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', '0', '127.0.0.1', '2022-03-21 21:33:12', 'admin', '2022-03-21 21:33:12', '', null, '测试员');
INSERT INTO `sys_user` VALUES ('3', null, 'dev', 'dev', '00', '', '', '0', '', '$2a$10$eDeIfvIKlma9IvrVZ1P5GePxt6WPpJL3W3XnfpJ7fEmkzW0OPUaH6', '0', '0', '127.0.0.1', '2022-05-03 08:00:34', '', '2022-05-03 08:00:06', '', '2022-05-03 08:00:34', null);
INSERT INTO `sys_user` VALUES ('4', null, 'zjh', 'zjh', '00', '', '', '0', '', '$2a$10$9nhiGwIfHkwosqIQXF0wcuAq94GmZM/3Yb9oxq41x8G2.stICAEES', '0', '0', '127.0.0.1', '2022-07-24 16:23:20', '', '2022-07-24 16:23:06', '', '2022-07-24 16:23:20', null);
INSERT INTO `sys_user` VALUES ('5', null, '测试', '测试', '00', '', '', '0', '', '$2a$10$C98uMO77pAsINrKk/c13Mu8nW6PZ0FwxUCbcILCJ.gLIJFciIcoie', '0', '0', '127.0.0.1', '2022-07-24 17:29:51', '', '2022-07-24 17:29:39', '', '2022-07-24 17:29:51', null);

-- ----------------------------
-- Table structure for sys_user_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_post`;
CREATE TABLE `sys_user_post` (
                                 `user_id` bigint(20) NOT NULL COMMENT '用户ID',
                                 `post_id` bigint(20) NOT NULL COMMENT '岗位ID',
                                 PRIMARY KEY (`user_id`,`post_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户与岗位关联表';

-- ----------------------------
-- Records of sys_user_post
-- ----------------------------
INSERT INTO `sys_user_post` VALUES ('1', '1');
INSERT INTO `sys_user_post` VALUES ('2', '2');

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role` (
                                 `user_id` bigint(20) NOT NULL COMMENT '用户ID',
                                 `role_id` bigint(20) NOT NULL COMMENT '角色ID',
                                 PRIMARY KEY (`user_id`,`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户和角色关联表';

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES ('1', '1');
INSERT INTO `sys_user_role` VALUES ('2', '2');
