# ************************************************************
# Sequel Pro SQL dump
# Version 4541
#
# http://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Host: 127.0.0.1 (MySQL 5.7.29)
# Database: sh_data
# Generation Time: 2020-04-17 06:12:07 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table gen_table
# ------------------------------------------------------------

DROP TABLE IF EXISTS `gen_table`;

CREATE TABLE `gen_table` (
  `table_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_name` varchar(200) DEFAULT '' COMMENT '表名称',
  `table_comment` varchar(500) DEFAULT '' COMMENT '表描述',
  `class_name` varchar(100) DEFAULT '' COMMENT '实体类名称',
  `tpl_category` varchar(200) DEFAULT 'crud' COMMENT '使用的模板（crud单表操作 tree树表操作）',
  `package_name` varchar(100) DEFAULT NULL COMMENT '生成包路径',
  `module_name` varchar(30) DEFAULT NULL COMMENT '生成模块名',
  `business_name` varchar(30) DEFAULT NULL COMMENT '生成业务名',
  `function_name` varchar(50) DEFAULT NULL COMMENT '生成功能名',
  `function_author` varchar(50) DEFAULT NULL COMMENT '生成功能作者',
  `options` varchar(1000) DEFAULT NULL COMMENT '其它生成选项',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`table_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='代码生成业务表';



# Dump of table gen_table_column
# ------------------------------------------------------------

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='代码生成业务表字段';



# Dump of table performance_application
# ------------------------------------------------------------

DROP TABLE IF EXISTS `performance_application`;

CREATE TABLE `performance_application` (
  `application_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '绩效申请ID',
  `owner_id` bigint(20) DEFAULT NULL COMMENT '所属人userID',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  `application_title` varchar(100) DEFAULT NULL COMMENT '申请标题',
  `application_content` varchar(2000) DEFAULT NULL COMMENT '考核内容',
  `application_date` datetime DEFAULT NULL COMMENT '考核时间点',
  `status` char(1) DEFAULT NULL COMMENT '申请状态（0正常 1关闭）',
  `application_percentage` int(5) DEFAULT NULL COMMENT '月度任务百分比',
  PRIMARY KEY (`application_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='绩效申请表';



# Dump of table performance_approve_task
# ------------------------------------------------------------

DROP TABLE IF EXISTS `performance_approve_task`;

CREATE TABLE `performance_approve_task` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '任务ID',
  `approver_id` bigint(20) DEFAULT NULL COMMENT '审批人ID',
  `application_id` bigint(20) DEFAULT NULL COMMENT '申请ID',
  `approver_rank` int(11) DEFAULT NULL,
  `result` varchar(11) DEFAULT NULL COMMENT '评审结果',
  `remark` varchar(500) DEFAULT NULL COMMENT '评论理由',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='绩效审批表';



# Dump of table performance_normal_task
# ------------------------------------------------------------

DROP TABLE IF EXISTS `performance_normal_task`;

CREATE TABLE `performance_normal_task` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '任务ID',
  `type` varchar(11) DEFAULT NULL COMMENT '评审类型',
  `date` datetime DEFAULT NULL COMMENT '考核时间点',
  `owner_id` bigint(20) DEFAULT NULL COMMENT '责任人ID',
  `result` varchar(11) DEFAULT NULL COMMENT '评审结果',
  `reason` varchar(500) DEFAULT NULL COMMENT '评审理由',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='日常审批表';



# Dump of table performance_result_task
# ------------------------------------------------------------

DROP TABLE IF EXISTS `performance_result_task`;

CREATE TABLE `performance_result_task` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '结果任务ID',
  `application_id` bigint(20) DEFAULT NULL COMMENT '申请ID',
  `result` varchar(11) DEFAULT NULL COMMENT '评审结果',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='绩效评审结果表';



# Dump of table QRTZ_BLOB_TRIGGERS
# ------------------------------------------------------------

DROP TABLE IF EXISTS `QRTZ_BLOB_TRIGGERS`;

CREATE TABLE `QRTZ_BLOB_TRIGGERS` (
  `sched_name` varchar(120) NOT NULL,
  `trigger_name` varchar(200) NOT NULL,
  `trigger_group` varchar(200) NOT NULL,
  `blob_data` blob,
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`),
  CONSTRAINT `qrtz_blob_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `QRTZ_TRIGGERS` (`sched_name`, `trigger_name`, `trigger_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table QRTZ_CALENDARS
# ------------------------------------------------------------

DROP TABLE IF EXISTS `QRTZ_CALENDARS`;

CREATE TABLE `QRTZ_CALENDARS` (
  `sched_name` varchar(120) NOT NULL,
  `calendar_name` varchar(200) NOT NULL,
  `calendar` blob NOT NULL,
  PRIMARY KEY (`sched_name`,`calendar_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table QRTZ_CRON_TRIGGERS
# ------------------------------------------------------------

DROP TABLE IF EXISTS `QRTZ_CRON_TRIGGERS`;

CREATE TABLE `QRTZ_CRON_TRIGGERS` (
  `sched_name` varchar(120) NOT NULL,
  `trigger_name` varchar(200) NOT NULL,
  `trigger_group` varchar(200) NOT NULL,
  `cron_expression` varchar(200) NOT NULL,
  `time_zone_id` varchar(80) DEFAULT NULL,
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`),
  CONSTRAINT `qrtz_cron_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `QRTZ_TRIGGERS` (`sched_name`, `trigger_name`, `trigger_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `QRTZ_CRON_TRIGGERS` WRITE;
/*!40000 ALTER TABLE `QRTZ_CRON_TRIGGERS` DISABLE KEYS */;

INSERT INTO `QRTZ_CRON_TRIGGERS` (`sched_name`, `trigger_name`, `trigger_group`, `cron_expression`, `time_zone_id`)
VALUES
	('RuoyiScheduler','TASK_CLASS_NAME1','DEFAULT','0/10 * * * * ?','Asia/Shanghai'),
	('RuoyiScheduler','TASK_CLASS_NAME2','DEFAULT','0/15 * * * * ?','Asia/Shanghai'),
	('RuoyiScheduler','TASK_CLASS_NAME3','DEFAULT','0/20 * * * * ?','Asia/Shanghai');

/*!40000 ALTER TABLE `QRTZ_CRON_TRIGGERS` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table QRTZ_FIRED_TRIGGERS
# ------------------------------------------------------------

DROP TABLE IF EXISTS `QRTZ_FIRED_TRIGGERS`;

CREATE TABLE `QRTZ_FIRED_TRIGGERS` (
  `sched_name` varchar(120) NOT NULL,
  `entry_id` varchar(95) NOT NULL,
  `trigger_name` varchar(200) NOT NULL,
  `trigger_group` varchar(200) NOT NULL,
  `instance_name` varchar(200) NOT NULL,
  `fired_time` bigint(13) NOT NULL,
  `sched_time` bigint(13) NOT NULL,
  `priority` int(11) NOT NULL,
  `state` varchar(16) NOT NULL,
  `job_name` varchar(200) DEFAULT NULL,
  `job_group` varchar(200) DEFAULT NULL,
  `is_nonconcurrent` varchar(1) DEFAULT NULL,
  `requests_recovery` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`sched_name`,`entry_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table QRTZ_JOB_DETAILS
# ------------------------------------------------------------

DROP TABLE IF EXISTS `QRTZ_JOB_DETAILS`;

CREATE TABLE `QRTZ_JOB_DETAILS` (
  `sched_name` varchar(120) NOT NULL,
  `job_name` varchar(200) NOT NULL,
  `job_group` varchar(200) NOT NULL,
  `description` varchar(250) DEFAULT NULL,
  `job_class_name` varchar(250) NOT NULL,
  `is_durable` varchar(1) NOT NULL,
  `is_nonconcurrent` varchar(1) NOT NULL,
  `is_update_data` varchar(1) NOT NULL,
  `requests_recovery` varchar(1) NOT NULL,
  `job_data` blob,
  PRIMARY KEY (`sched_name`,`job_name`,`job_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `QRTZ_JOB_DETAILS` WRITE;
/*!40000 ALTER TABLE `QRTZ_JOB_DETAILS` DISABLE KEYS */;

INSERT INTO `QRTZ_JOB_DETAILS` (`sched_name`, `job_name`, `job_group`, `description`, `job_class_name`, `is_durable`, `is_nonconcurrent`, `is_update_data`, `requests_recovery`, `job_data`)
VALUES
	('RuoyiScheduler','TASK_CLASS_NAME1','DEFAULT',NULL,'com.ruoyi.common.utils.job.QuartzDisallowConcurrentExecution','0','1','0','0',X'ACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000F5441534B5F50524F5045525449455373720027636F6D2E72756F79692E70726F6A6563742E6D6F6E69746F722E646F6D61696E2E5379734A6F6200000000000000010200084C000A636F6E63757272656E747400124C6A6176612F6C616E672F537472696E673B4C000E63726F6E45787072657373696F6E71007E00094C000C696E766F6B6554617267657471007E00094C00086A6F6247726F757071007E00094C00056A6F6249647400104C6A6176612F6C616E672F4C6F6E673B4C00076A6F624E616D6571007E00094C000D6D697366697265506F6C69637971007E00094C000673746174757371007E000978720029636F6D2E72756F79692E6672616D65776F726B2E7765622E646F6D61696E2E42617365456E74697479000000000000000102000A4C0009626567696E54696D6571007E00094C0008637265617465427971007E00094C000A63726561746554696D657400104C6A6176612F7574696C2F446174653B4C00096461746153636F706571007E00094C0007656E6454696D6571007E00094C0006706172616D7371007E00034C000672656D61726B71007E00094C000B73656172636856616C756571007E00094C0008757064617465427971007E00094C000A75706461746554696D6571007E000C78707074000561646D696E7372000E6A6176612E7574696C2E44617465686A81014B59741903000078707708000001622CDE29E0787070707400007070707400013174000E302F3130202A202A202A202A203F74001172795461736B2E72794E6F506172616D7374000744454641554C547372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B02000078700000000000000001740018E7B3BBE7BB9FE9BB98E8AEA4EFBC88E697A0E58F82EFBC8974000133740001317800'),
	('RuoyiScheduler','TASK_CLASS_NAME2','DEFAULT',NULL,'com.ruoyi.common.utils.job.QuartzDisallowConcurrentExecution','0','1','0','0',X'ACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000F5441534B5F50524F5045525449455373720027636F6D2E72756F79692E70726F6A6563742E6D6F6E69746F722E646F6D61696E2E5379734A6F6200000000000000010200084C000A636F6E63757272656E747400124C6A6176612F6C616E672F537472696E673B4C000E63726F6E45787072657373696F6E71007E00094C000C696E766F6B6554617267657471007E00094C00086A6F6247726F757071007E00094C00056A6F6249647400104C6A6176612F6C616E672F4C6F6E673B4C00076A6F624E616D6571007E00094C000D6D697366697265506F6C69637971007E00094C000673746174757371007E000978720029636F6D2E72756F79692E6672616D65776F726B2E7765622E646F6D61696E2E42617365456E74697479000000000000000102000A4C0009626567696E54696D6571007E00094C0008637265617465427971007E00094C000A63726561746554696D657400104C6A6176612F7574696C2F446174653B4C00096461746153636F706571007E00094C0007656E6454696D6571007E00094C0006706172616D7371007E00034C000672656D61726B71007E00094C000B73656172636856616C756571007E00094C0008757064617465427971007E00094C000A75706461746554696D6571007E000C78707074000561646D696E7372000E6A6176612E7574696C2E44617465686A81014B59741903000078707708000001622CDE29E0787070707400007070707400013174000E302F3135202A202A202A202A203F74001572795461736B2E7279506172616D7328277279272974000744454641554C547372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B02000078700000000000000002740018E7B3BBE7BB9FE9BB98E8AEA4EFBC88E69C89E58F82EFBC8974000133740001317800'),
	('RuoyiScheduler','TASK_CLASS_NAME3','DEFAULT',NULL,'com.ruoyi.common.utils.job.QuartzDisallowConcurrentExecution','0','1','0','0',X'ACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000F5441534B5F50524F5045525449455373720027636F6D2E72756F79692E70726F6A6563742E6D6F6E69746F722E646F6D61696E2E5379734A6F6200000000000000010200084C000A636F6E63757272656E747400124C6A6176612F6C616E672F537472696E673B4C000E63726F6E45787072657373696F6E71007E00094C000C696E766F6B6554617267657471007E00094C00086A6F6247726F757071007E00094C00056A6F6249647400104C6A6176612F6C616E672F4C6F6E673B4C00076A6F624E616D6571007E00094C000D6D697366697265506F6C69637971007E00094C000673746174757371007E000978720029636F6D2E72756F79692E6672616D65776F726B2E7765622E646F6D61696E2E42617365456E74697479000000000000000102000A4C0009626567696E54696D6571007E00094C0008637265617465427971007E00094C000A63726561746554696D657400104C6A6176612F7574696C2F446174653B4C00096461746153636F706571007E00094C0007656E6454696D6571007E00094C0006706172616D7371007E00034C000672656D61726B71007E00094C000B73656172636856616C756571007E00094C0008757064617465427971007E00094C000A75706461746554696D6571007E000C78707074000561646D696E7372000E6A6176612E7574696C2E44617465686A81014B59741903000078707708000001622CDE29E0787070707400007070707400013174000E302F3230202A202A202A202A203F74003872795461736B2E72794D756C7469706C65506172616D7328277279272C20747275652C20323030304C2C203331362E3530442C203130302974000744454641554C547372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B02000078700000000000000003740018E7B3BBE7BB9FE9BB98E8AEA4EFBC88E5A49AE58F82EFBC8974000133740001317800');

/*!40000 ALTER TABLE `QRTZ_JOB_DETAILS` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table QRTZ_LOCKS
# ------------------------------------------------------------

DROP TABLE IF EXISTS `QRTZ_LOCKS`;

CREATE TABLE `QRTZ_LOCKS` (
  `sched_name` varchar(120) NOT NULL,
  `lock_name` varchar(40) NOT NULL,
  PRIMARY KEY (`sched_name`,`lock_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `QRTZ_LOCKS` WRITE;
/*!40000 ALTER TABLE `QRTZ_LOCKS` DISABLE KEYS */;

INSERT INTO `QRTZ_LOCKS` (`sched_name`, `lock_name`)
VALUES
	('RuoyiScheduler','STATE_ACCESS'),
	('RuoyiScheduler','TRIGGER_ACCESS');

/*!40000 ALTER TABLE `QRTZ_LOCKS` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table QRTZ_PAUSED_TRIGGER_GRPS
# ------------------------------------------------------------

DROP TABLE IF EXISTS `QRTZ_PAUSED_TRIGGER_GRPS`;

CREATE TABLE `QRTZ_PAUSED_TRIGGER_GRPS` (
  `sched_name` varchar(120) NOT NULL,
  `trigger_group` varchar(200) NOT NULL,
  PRIMARY KEY (`sched_name`,`trigger_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table QRTZ_SCHEDULER_STATE
# ------------------------------------------------------------

DROP TABLE IF EXISTS `QRTZ_SCHEDULER_STATE`;

CREATE TABLE `QRTZ_SCHEDULER_STATE` (
  `sched_name` varchar(120) NOT NULL,
  `instance_name` varchar(200) NOT NULL,
  `last_checkin_time` bigint(13) NOT NULL,
  `checkin_interval` bigint(13) NOT NULL,
  PRIMARY KEY (`sched_name`,`instance_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `QRTZ_SCHEDULER_STATE` WRITE;
/*!40000 ALTER TABLE `QRTZ_SCHEDULER_STATE` DISABLE KEYS */;

INSERT INTO `QRTZ_SCHEDULER_STATE` (`sched_name`, `instance_name`, `last_checkin_time`, `checkin_interval`)
VALUES
	('RuoyiScheduler','Allens-MacBook.lan1587102869968',1587103924163,15000);

/*!40000 ALTER TABLE `QRTZ_SCHEDULER_STATE` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table QRTZ_SIMPLE_TRIGGERS
# ------------------------------------------------------------

DROP TABLE IF EXISTS `QRTZ_SIMPLE_TRIGGERS`;

CREATE TABLE `QRTZ_SIMPLE_TRIGGERS` (
  `sched_name` varchar(120) NOT NULL,
  `trigger_name` varchar(200) NOT NULL,
  `trigger_group` varchar(200) NOT NULL,
  `repeat_count` bigint(7) NOT NULL,
  `repeat_interval` bigint(12) NOT NULL,
  `times_triggered` bigint(10) NOT NULL,
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`),
  CONSTRAINT `qrtz_simple_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `QRTZ_TRIGGERS` (`sched_name`, `trigger_name`, `trigger_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table QRTZ_SIMPROP_TRIGGERS
# ------------------------------------------------------------

DROP TABLE IF EXISTS `QRTZ_SIMPROP_TRIGGERS`;

CREATE TABLE `QRTZ_SIMPROP_TRIGGERS` (
  `sched_name` varchar(120) NOT NULL,
  `trigger_name` varchar(200) NOT NULL,
  `trigger_group` varchar(200) NOT NULL,
  `str_prop_1` varchar(512) DEFAULT NULL,
  `str_prop_2` varchar(512) DEFAULT NULL,
  `str_prop_3` varchar(512) DEFAULT NULL,
  `int_prop_1` int(11) DEFAULT NULL,
  `int_prop_2` int(11) DEFAULT NULL,
  `long_prop_1` bigint(20) DEFAULT NULL,
  `long_prop_2` bigint(20) DEFAULT NULL,
  `dec_prop_1` decimal(13,4) DEFAULT NULL,
  `dec_prop_2` decimal(13,4) DEFAULT NULL,
  `bool_prop_1` varchar(1) DEFAULT NULL,
  `bool_prop_2` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`),
  CONSTRAINT `qrtz_simprop_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `QRTZ_TRIGGERS` (`sched_name`, `trigger_name`, `trigger_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table QRTZ_TRIGGERS
# ------------------------------------------------------------

DROP TABLE IF EXISTS `QRTZ_TRIGGERS`;

CREATE TABLE `QRTZ_TRIGGERS` (
  `sched_name` varchar(120) NOT NULL,
  `trigger_name` varchar(200) NOT NULL,
  `trigger_group` varchar(200) NOT NULL,
  `job_name` varchar(200) NOT NULL,
  `job_group` varchar(200) NOT NULL,
  `description` varchar(250) DEFAULT NULL,
  `next_fire_time` bigint(13) DEFAULT NULL,
  `prev_fire_time` bigint(13) DEFAULT NULL,
  `priority` int(11) DEFAULT NULL,
  `trigger_state` varchar(16) NOT NULL,
  `trigger_type` varchar(8) NOT NULL,
  `start_time` bigint(13) NOT NULL,
  `end_time` bigint(13) DEFAULT NULL,
  `calendar_name` varchar(200) DEFAULT NULL,
  `misfire_instr` smallint(2) DEFAULT NULL,
  `job_data` blob,
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`),
  KEY `sched_name` (`sched_name`,`job_name`,`job_group`),
  CONSTRAINT `qrtz_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `job_name`, `job_group`) REFERENCES `QRTZ_JOB_DETAILS` (`sched_name`, `job_name`, `job_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `QRTZ_TRIGGERS` WRITE;
/*!40000 ALTER TABLE `QRTZ_TRIGGERS` DISABLE KEYS */;

INSERT INTO `QRTZ_TRIGGERS` (`sched_name`, `trigger_name`, `trigger_group`, `job_name`, `job_group`, `description`, `next_fire_time`, `prev_fire_time`, `priority`, `trigger_state`, `trigger_type`, `start_time`, `end_time`, `calendar_name`, `misfire_instr`, `job_data`)
VALUES
	('RuoyiScheduler','TASK_CLASS_NAME1','DEFAULT','TASK_CLASS_NAME1','DEFAULT',NULL,1587102870000,-1,5,'PAUSED','CRON',1587102870000,0,NULL,2,''),
	('RuoyiScheduler','TASK_CLASS_NAME2','DEFAULT','TASK_CLASS_NAME2','DEFAULT',NULL,1587102870000,-1,5,'PAUSED','CRON',1587102870000,0,NULL,2,''),
	('RuoyiScheduler','TASK_CLASS_NAME3','DEFAULT','TASK_CLASS_NAME3','DEFAULT',NULL,1587102880000,-1,5,'PAUSED','CRON',1587102870000,0,NULL,2,'');

/*!40000 ALTER TABLE `QRTZ_TRIGGERS` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table sys_config
# ------------------------------------------------------------

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='参数配置表';

LOCK TABLES `sys_config` WRITE;
/*!40000 ALTER TABLE `sys_config` DISABLE KEYS */;

INSERT INTO `sys_config` (`config_id`, `config_name`, `config_key`, `config_value`, `config_type`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`)
VALUES
	(1,'主框架页-默认皮肤样式名称','sys.index.skinName','skin-blue','Y','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00','蓝色 skin-blue、绿色 skin-green、紫色 skin-purple、红色 skin-red、黄色 skin-yellow'),
	(2,'用户管理-账号初始密码','sys.user.initPassword','123456','Y','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00','初始化密码 123456'),
	(3,'主框架页-侧边栏主题','sys.index.sideTheme','theme-dark','Y','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00','深色主题theme-dark，浅色主题theme-light');

/*!40000 ALTER TABLE `sys_config` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table sys_dept
# ------------------------------------------------------------

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='部门表';

LOCK TABLES `sys_dept` WRITE;
/*!40000 ALTER TABLE `sys_dept` DISABLE KEYS */;

INSERT INTO `sys_dept` (`dept_id`, `parent_id`, `ancestors`, `dept_name`, `order_num`, `leader`, `phone`, `email`, `status`, `del_flag`, `create_by`, `create_time`, `update_by`, `update_time`)
VALUES
	(100,0,'0','上海技术物理研究所第二研究室光谱成像组',0,'刘银年','15888888888','','0','0','admin','2018-03-16 11:33:00','admin','2020-04-14 13:07:26'),
	(101,100,'0,100','集成测试组',7,'','15888888888','','0','0','admin','2018-03-16 11:33:00','admin','2020-04-14 13:06:24'),
	(103,101,'0,100,101','集成装配组',1,'','','','0','0','admin','2018-03-16 11:33:00','admin','2020-04-14 13:05:26'),
	(105,101,'0,100,101','综合测试组',2,'','15888888888','','0','0','admin','2018-03-16 11:33:00','admin','2020-04-14 13:06:24'),
	(200,100,'0,100','课题组',1,NULL,NULL,NULL,'0','0','admin','2020-04-14 11:26:16','',NULL),
	(201,100,'0,100','考核工作组',2,NULL,NULL,NULL,'0','0','admin','2020-04-14 12:55:37','',NULL),
	(202,100,'0,100','科研行政保障组',3,NULL,NULL,NULL,'0','0','admin','2020-04-14 12:56:06','',NULL),
	(203,202,'0,100,202','产品保障组',1,NULL,NULL,NULL,'0','0','admin','2020-04-14 12:56:23','',NULL),
	(204,202,'0,100,202','财务保障组',2,NULL,NULL,NULL,'0','0','admin','2020-04-14 12:56:49','',NULL),
	(205,202,'0,100,202','行政保障组',3,NULL,NULL,NULL,'0','0','admin','2020-04-14 12:57:01','',NULL),
	(206,100,'0,100','专业技术组',4,NULL,NULL,NULL,'0','0','admin','2020-04-14 12:57:20','admin','2020-04-14 13:00:48'),
	(207,206,'0,100,206','光学组',1,NULL,NULL,NULL,'0','0','admin','2020-04-14 12:57:39','',NULL),
	(208,206,'0,100,206','机械结构一组',2,NULL,NULL,NULL,'0','0','admin','2020-04-14 12:58:01','admin','2020-04-14 13:00:48'),
	(209,206,'0,100,206','机械结构二组',3,NULL,NULL,NULL,'0','0','admin','2020-04-14 12:58:13','',NULL),
	(210,206,'0,100,206','电子学组',4,NULL,NULL,NULL,'0','0','admin','2020-04-14 12:58:34','',NULL),
	(211,206,'0,100,206','定标处理软件组',5,NULL,NULL,NULL,'0','0','admin','2020-04-14 12:58:56','',NULL),
	(212,207,'0,100,206,207','光学设计组',1,NULL,NULL,NULL,'0','0','admin','2020-04-14 12:59:28','',NULL),
	(213,207,'0,100,206,207','光学装校组',2,NULL,NULL,NULL,'0','0','admin','2020-04-14 12:59:49','',NULL),
	(214,208,'0,100,206,208','结构一组',1,NULL,NULL,NULL,'0','0','admin','2020-04-14 13:00:02','',NULL),
	(215,208,'0,100,206,208','机构二组',2,NULL,NULL,NULL,'0','0','admin','2020-04-14 13:00:12','admin','2020-04-14 13:00:48'),
	(216,209,'0,100,206,209','结构一组',1,NULL,NULL,NULL,'0','0','admin','2020-04-14 13:00:24','',NULL),
	(217,209,'0,100,206,209','机构二组',2,NULL,NULL,NULL,'0','0','admin','2020-04-14 13:00:41','',NULL),
	(218,210,'0,100,206,210','信息获取组',1,NULL,NULL,NULL,'0','0','admin','2020-04-14 13:01:03','',NULL),
	(219,210,'0,100,206,210','信息处理组',2,NULL,NULL,NULL,'0','0','admin','2020-04-14 13:01:17','',NULL),
	(220,210,'0,100,206,210','遥测遥控组',3,NULL,NULL,NULL,'0','0','admin','2020-04-14 13:01:35','',NULL),
	(221,210,'0,100,206,210','伺服控制组',4,NULL,NULL,NULL,'0','0','admin','2020-04-14 13:02:03','',NULL),
	(222,211,'0,100,206,211','定标测试组',1,NULL,NULL,NULL,'0','0','admin','2020-04-14 13:02:23','',NULL),
	(223,211,'0,100,206,211','数据处理组',2,NULL,NULL,NULL,'0','0','admin','2020-04-14 13:02:39','',NULL),
	(224,211,'0,100,206,211','应用软件组',3,NULL,NULL,NULL,'0','0','admin','2020-04-14 13:02:53','',NULL),
	(225,100,'0,100','基础成功组',5,NULL,NULL,NULL,'0','0','admin','2020-04-14 13:03:19','admin','2020-04-14 13:07:26'),
	(226,225,'0,100,225','规划论证',1,NULL,NULL,NULL,'0','0','admin','2020-04-14 13:06:43','',NULL),
	(227,225,'0,100,225','基础前沿',2,NULL,NULL,NULL,'0','0','admin','2020-04-14 13:06:59','',NULL),
	(228,225,'0,100,225','知识产权及研究生教育',3,NULL,NULL,NULL,'0','0','admin','2020-04-14 13:07:20','admin','2020-04-14 13:07:26');

/*!40000 ALTER TABLE `sys_dept` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table sys_dict_data
# ------------------------------------------------------------

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='字典数据表';

LOCK TABLES `sys_dict_data` WRITE;
/*!40000 ALTER TABLE `sys_dict_data` DISABLE KEYS */;

INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`, `list_class`, `is_default`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`)
VALUES
	(1,1,'男','0','sys_user_sex','','','Y','0','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00','性别男'),
	(2,2,'女','1','sys_user_sex','','','N','0','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00','性别女'),
	(3,3,'未知','2','sys_user_sex','','','N','0','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00','性别未知'),
	(4,1,'显示','0','sys_show_hide','','primary','Y','0','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00','显示菜单'),
	(5,2,'隐藏','1','sys_show_hide','','danger','N','0','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00','隐藏菜单'),
	(6,1,'正常','0','sys_normal_disable','','primary','Y','0','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00','正常状态'),
	(7,2,'停用','1','sys_normal_disable','','danger','N','0','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00','停用状态'),
	(8,1,'正常','0','sys_job_status','','primary','Y','0','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00','正常状态'),
	(9,2,'暂停','1','sys_job_status','','danger','N','0','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00','停用状态'),
	(10,1,'默认','DEFAULT','sys_job_group','','','Y','0','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00','默认分组'),
	(11,2,'系统','SYSTEM','sys_job_group','','','N','0','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00','系统分组'),
	(12,1,'是','Y','sys_yes_no','','primary','Y','0','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00','系统默认是'),
	(13,2,'否','N','sys_yes_no','','danger','N','0','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00','系统默认否'),
	(14,1,'通知','1','sys_notice_type','','warning','Y','0','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00','通知'),
	(15,2,'公告','2','sys_notice_type','','success','N','0','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00','公告'),
	(16,1,'正常','0','sys_notice_status','','primary','Y','0','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00','正常状态'),
	(17,2,'关闭','1','sys_notice_status','','danger','N','0','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00','关闭状态'),
	(18,1,'新增','1','sys_oper_type','','info','N','0','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00','新增操作'),
	(19,2,'修改','2','sys_oper_type','','info','N','0','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00','修改操作'),
	(20,3,'删除','3','sys_oper_type','','danger','N','0','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00','删除操作'),
	(21,4,'授权','4','sys_oper_type','','primary','N','0','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00','授权操作'),
	(22,5,'导出','5','sys_oper_type','','warning','N','0','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00','导出操作'),
	(23,6,'导入','6','sys_oper_type','','warning','N','0','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00','导入操作'),
	(24,7,'强退','7','sys_oper_type','','danger','N','0','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00','强退操作'),
	(25,8,'生成代码','8','sys_oper_type','','warning','N','0','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00','生成操作'),
	(26,9,'清空数据','9','sys_oper_type','','danger','N','0','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00','清空操作'),
	(27,1,'成功','0','sys_common_status','','primary','N','0','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00','正常状态'),
	(28,2,'失败','1','sys_common_status','','danger','N','0','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00','停用状态'),
	(100,1,'正常','0','perfor_application_status',NULL,NULL,'N','0','admin','2020-04-16 16:25:33','',NULL,NULL),
	(101,2,'结束','1','perfor_application_status',NULL,NULL,'N','0','admin','2020-04-16 16:25:48','',NULL,NULL),
	(102,1,'A+','100','perfor_result_type',NULL,NULL,'N','0','admin','2020-04-16 16:26:38','',NULL,'A+（非常优秀）'),
	(103,2,'A','95','perfor_result_type',NULL,NULL,'N','0','admin','2020-04-16 16:27:05','',NULL,'A（优秀）'),
	(104,3,'A-','90','perfor_result_type',NULL,NULL,'N','0','admin','2020-04-16 16:27:27','',NULL,'A-（勉强优秀）'),
	(105,4,'B+','85','perfor_result_type',NULL,NULL,'N','0','admin','2020-04-16 16:27:46','',NULL,'B+（非常良好）'),
	(106,5,'B','80','perfor_result_type',NULL,NULL,'N','0','admin','2020-04-16 16:28:16','',NULL,'B（良好）'),
	(107,6,'B-','75','perfor_result_type',NULL,NULL,'N','0','admin','2020-04-16 16:28:44','',NULL,'B-（勉强良好）'),
	(108,7,'C+','70','perfor_result_type',NULL,NULL,'N','0','admin','2020-04-16 16:29:08','',NULL,'C+（非常及格）'),
	(109,8,'C','65','perfor_result_type',NULL,NULL,'N','0','admin','2020-04-16 16:29:35','',NULL,'C（及格）'),
	(110,9,'C-','60','perfor_result_type',NULL,NULL,'N','0','admin','2020-04-16 16:30:00','',NULL,'C-（勉强及格）'),
	(111,10,'D+','55','perfor_result_type',NULL,NULL,'N','0','admin','2020-04-16 16:30:34','',NULL,'D+（差点及格）'),
	(112,11,'D','50','perfor_result_type',NULL,NULL,'N','0','admin','2020-04-16 16:31:00','',NULL,'D（差）'),
	(113,12,'D-','40','perfor_result_type',NULL,NULL,'N','0','admin','2020-04-16 16:31:20','',NULL,'D-（非常差）'),
	(114,1,'下级','20','perfor_evaluate_range',NULL,NULL,'N','0','admin','2020-04-16 16:32:09','',NULL,'下级考核比占20%'),
	(115,2,'平级','20','perfor_evaluate_range',NULL,NULL,'N','0','admin','2020-04-16 16:32:31','',NULL,'平级考核占比20%'),
	(116,3,'上级','30','perfor_evaluate_range',NULL,NULL,'N','0','admin','2020-04-16 16:32:52','',NULL,'上级考核占比30%'),
	(117,4,'上上级','30','perfor_evaluate_range',NULL,NULL,'N','0','admin','2020-04-16 16:33:10','',NULL,'上上级考核占比30%'),
	(118,1,'采购考核','001','perfor_normal_type',NULL,NULL,'N','0','admin','2020-04-16 16:33:46','',NULL,NULL),
	(119,2,'出勤考核','002','perfor_normal_type',NULL,NULL,'N','0','admin','2020-04-16 16:34:01','',NULL,NULL);

/*!40000 ALTER TABLE `sys_dict_data` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table sys_dict_type
# ------------------------------------------------------------

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='字典类型表';

LOCK TABLES `sys_dict_type` WRITE;
/*!40000 ALTER TABLE `sys_dict_type` DISABLE KEYS */;

INSERT INTO `sys_dict_type` (`dict_id`, `dict_name`, `dict_type`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`)
VALUES
	(1,'用户性别','sys_user_sex','0','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00','用户性别列表'),
	(2,'菜单状态','sys_show_hide','0','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00','菜单状态列表'),
	(3,'系统开关','sys_normal_disable','0','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00','系统开关列表'),
	(4,'任务状态','sys_job_status','0','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00','任务状态列表'),
	(5,'任务分组','sys_job_group','0','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00','任务分组列表'),
	(6,'系统是否','sys_yes_no','0','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00','系统是否列表'),
	(7,'通知类型','sys_notice_type','0','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00','通知类型列表'),
	(8,'通知状态','sys_notice_status','0','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00','通知状态列表'),
	(9,'操作类型','sys_oper_type','0','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00','操作类型列表'),
	(10,'系统状态','sys_common_status','0','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00','登录状态列表'),
	(100,'绩效申请状态','perfor_application_status','0','admin','2020-04-16 16:22:51','',NULL,NULL),
	(101,'绩效考核结果','perfor_result_type','0','admin','2020-04-16 16:23:25','',NULL,'绩效考核结果'),
	(102,'绩效考核范围','perfor_evaluate_range','0','admin','2020-04-16 16:23:50','',NULL,'绩效人员考核范围和比例'),
	(103,'日常考核类型','perfor_normal_type','0','admin','2020-04-16 16:24:48','',NULL,'日常考核的类型');

/*!40000 ALTER TABLE `sys_dict_type` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table sys_job
# ------------------------------------------------------------

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='定时任务调度表';

LOCK TABLES `sys_job` WRITE;
/*!40000 ALTER TABLE `sys_job` DISABLE KEYS */;

INSERT INTO `sys_job` (`job_id`, `job_name`, `job_group`, `invoke_target`, `cron_expression`, `misfire_policy`, `concurrent`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`)
VALUES
	(1,'系统默认（无参）','DEFAULT','ryTask.ryNoParams','0/10 * * * * ?','3','1','1','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00',''),
	(2,'系统默认（有参）','DEFAULT','ryTask.ryParams(\'ry\')','0/15 * * * * ?','3','1','1','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00',''),
	(3,'系统默认（多参）','DEFAULT','ryTask.ryMultipleParams(\'ry\', true, 2000L, 316.50D, 100)','0/20 * * * * ?','3','1','1','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00','');

/*!40000 ALTER TABLE `sys_job` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table sys_job_log
# ------------------------------------------------------------

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



# Dump of table sys_logininfor
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sys_logininfor`;

CREATE TABLE `sys_logininfor` (
  `info_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '访问ID',
  `user_name` varchar(50) DEFAULT '' COMMENT '用户账号',
  `ipaddr` varchar(50) DEFAULT '' COMMENT '登录IP地址',
  `login_location` varchar(255) DEFAULT '' COMMENT '登录地点',
  `browser` varchar(50) DEFAULT '' COMMENT '浏览器类型',
  `os` varchar(50) DEFAULT '' COMMENT '操作系统',
  `status` char(1) DEFAULT '0' COMMENT '登录状态（0成功 1失败）',
  `msg` varchar(255) DEFAULT '' COMMENT '提示消息',
  `login_time` datetime DEFAULT NULL COMMENT '访问时间',
  PRIMARY KEY (`info_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='系统访问记录';

LOCK TABLES `sys_logininfor` WRITE;
/*!40000 ALTER TABLE `sys_logininfor` DISABLE KEYS */;

INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `login_location`, `browser`, `os`, `status`, `msg`, `login_time`)
VALUES
	(100,'admin','127.0.0.1','内网IP','Chrome 8','Mac OS X','1','验证码错误','2020-04-10 11:01:14'),
	(101,'admin','127.0.0.1','内网IP','Chrome 8','Mac OS X','0','登录成功','2020-04-10 11:01:23'),
	(102,'admin','127.0.0.1','内网IP','Chrome 8','Mac OS X','0','登录成功','2020-04-10 13:36:07'),
	(103,'admin','127.0.0.1','内网IP','Chrome 8','Mac OS X','1','验证码已失效','2020-04-10 14:36:48'),
	(104,'admin','127.0.0.1','内网IP','Chrome 8','Mac OS X','0','登录成功','2020-04-10 14:36:48'),
	(105,'admin','127.0.0.1','内网IP','Chrome 8','Mac OS X','1','验证码已失效','2020-04-10 15:19:32'),
	(106,'admin','127.0.0.1','内网IP','Chrome 8','Mac OS X','0','登录成功','2020-04-10 15:19:32'),
	(107,'admin','127.0.0.1','内网IP','Chrome 8','Mac OS X','0','退出成功','2020-04-10 15:41:23'),
	(108,'admin','127.0.0.1','内网IP','Chrome 8','Mac OS X','0','登录成功','2020-04-10 15:41:29'),
	(109,'admin','127.0.0.1','内网IP','Chrome 8','Mac OS X','1','验证码错误','2020-04-10 16:44:38'),
	(110,'admin','127.0.0.1','内网IP','Chrome 8','Mac OS X','1','验证码错误','2020-04-10 16:44:40'),
	(111,'admin','127.0.0.1','内网IP','Chrome 8','Mac OS X','0','登录成功','2020-04-10 16:44:46'),
	(112,'admin','127.0.0.1','内网IP','Chrome 8','Mac OS X','0','登录成功','2020-04-13 08:44:59'),
	(113,'admin','127.0.0.1','内网IP','Chrome 8','Mac OS X','0','退出成功','2020-04-13 08:53:56'),
	(114,'admin','127.0.0.1','内网IP','Chrome 8','Mac OS X','0','登录成功','2020-04-13 08:54:01'),
	(115,'admin','127.0.0.1','内网IP','Chrome 8','Mac OS X','0','退出成功','2020-04-13 09:20:49'),
	(116,'admin','127.0.0.1','内网IP','Chrome 8','Mac OS X','0','登录成功','2020-04-13 09:20:57'),
	(117,'admin','127.0.0.1','内网IP','Chrome 8','Mac OS X','0','登录成功','2020-04-13 10:44:56'),
	(118,'admin','127.0.0.1','内网IP','Chrome 8','Mac OS X','0','登录成功','2020-04-13 13:24:05'),
	(119,'admin','127.0.0.1','内网IP','Chrome 8','Mac OS X','0','退出成功','2020-04-13 13:31:45'),
	(120,'admin','127.0.0.1','内网IP','Chrome 8','Mac OS X','1','验证码已失效','2020-04-13 13:31:52'),
	(121,'admin','127.0.0.1','内网IP','Chrome 8','Mac OS X','0','登录成功','2020-04-13 13:31:52'),
	(122,'admin','127.0.0.1','内网IP','Chrome 8','Mac OS X','0','登录成功','2020-04-13 14:36:40'),
	(123,'admin','127.0.0.1','内网IP','Chrome 8','Mac OS X','0','登录成功','2020-04-14 08:48:02'),
	(124,'admin','127.0.0.1','内网IP','Chrome 8','Mac OS X','0','登录成功','2020-04-14 11:02:54'),
	(125,'admin','127.0.0.1','内网IP','Chrome 8','Mac OS X','0','登录成功','2020-04-14 12:55:22'),
	(126,'admin','127.0.0.1','内网IP','Chrome 8','Mac OS X','0','退出成功','2020-04-14 13:12:32'),
	(127,'罗霄','127.0.0.1','内网IP','Chrome 8','Mac OS X','0','登录成功','2020-04-14 13:12:47'),
	(128,'admin','127.0.0.1','内网IP','Chrome 8','Mac OS X','0','登录成功','2020-04-16 08:53:49'),
	(129,'admin','127.0.0.1','内网IP','Chrome 8','Mac OS X','0','退出成功','2020-04-16 09:16:20'),
	(130,'罗霄','127.0.0.1','内网IP','Chrome 8','Mac OS X','0','登录成功','2020-04-16 09:16:33'),
	(131,'admin','127.0.0.1','内网IP','Chrome 8','Mac OS X','0','登录成功','2020-04-16 10:07:24'),
	(132,'admin','127.0.0.1','内网IP','Chrome 8','Mac OS X','1','验证码已失效','2020-04-16 10:07:25'),
	(133,'admin','127.0.0.1','内网IP','Chrome 8','Mac OS X','1','验证码错误','2020-04-16 10:37:26'),
	(134,'admin','127.0.0.1','内网IP','Chrome 8','Mac OS X','1','验证码错误','2020-04-16 10:37:32'),
	(135,'admin','127.0.0.1','内网IP','Chrome 8','Mac OS X','0','登录成功','2020-04-16 10:37:43'),
	(136,'admin','127.0.0.1','内网IP','Chrome 8','Mac OS X','0','退出成功','2020-04-16 10:42:45'),
	(137,'admin','127.0.0.1','内网IP','Chrome 8','Mac OS X','0','登录成功','2020-04-16 10:42:52'),
	(138,'admin','127.0.0.1','内网IP','Chrome 8','Mac OS X','1','验证码已失效','2020-04-16 11:43:58'),
	(139,'admin','127.0.0.1','内网IP','Chrome 8','Mac OS X','0','登录成功','2020-04-16 11:43:58'),
	(140,'admin','127.0.0.1','内网IP','Chrome 8','Mac OS X','0','登录成功','2020-04-16 13:24:37'),
	(141,'admin','127.0.0.1','内网IP','Chrome 8','Mac OS X','1','验证码错误','2020-04-16 15:32:42'),
	(142,'admin','127.0.0.1','内网IP','Chrome 8','Mac OS X','0','登录成功','2020-04-16 15:32:48'),
	(143,'admin','127.0.0.1','内网IP','Chrome 8','Mac OS X','0','退出成功','2020-04-16 16:07:14'),
	(144,'admin','127.0.0.1','内网IP','Chrome 8','Mac OS X','0','登录成功','2020-04-16 16:07:21'),
	(145,'admin','127.0.0.1','内网IP','Chrome 8','Mac OS X','0','退出成功','2020-04-16 16:40:24'),
	(146,'陆志峰','127.0.0.1','内网IP','Chrome 8','Mac OS X','0','登录成功','2020-04-16 16:40:38'),
	(147,'陆志峰','127.0.0.1','内网IP','Chrome 8','Mac OS X','0','退出成功','2020-04-16 16:41:09'),
	(148,'陆志峰','127.0.0.1','内网IP','Chrome 8','Mac OS X','0','登录成功','2020-04-16 16:41:27'),
	(149,'陆志峰','127.0.0.1','内网IP','Chrome 8','Mac OS X','0','退出成功','2020-04-16 16:51:59'),
	(150,'admin','127.0.0.1','内网IP','Chrome 8','Mac OS X','0','登录成功','2020-04-16 16:52:06'),
	(151,'admin','127.0.0.1','内网IP','Chrome 8','Mac OS X','0','退出成功','2020-04-16 16:52:32'),
	(152,'陆志峰','127.0.0.1','内网IP','Chrome 8','Mac OS X','0','登录成功','2020-04-16 16:52:51'),
	(153,'陆志峰','127.0.0.1','内网IP','Chrome 8','Mac OS X','0','退出成功','2020-04-16 16:54:19'),
	(154,'罗霄','127.0.0.1','内网IP','Chrome 8','Mac OS X','0','登录成功','2020-04-16 16:54:31'),
	(155,'罗霄','127.0.0.1','内网IP','Chrome 8','Mac OS X','0','退出成功','2020-04-16 16:54:45'),
	(156,'admin','127.0.0.1','内网IP','Chrome 8','Mac OS X','0','登录成功','2020-04-16 16:54:52'),
	(157,'admin','127.0.0.1','内网IP','Chrome 8','Mac OS X','0','退出成功','2020-04-16 16:57:42'),
	(158,'罗霄','127.0.0.1','内网IP','Chrome 8','Mac OS X','0','登录成功','2020-04-16 16:57:53'),
	(159,'罗霄','127.0.0.1','内网IP','Chrome 8','Mac OS X','0','退出成功','2020-04-16 16:58:59'),
	(160,'陆志峰','127.0.0.1','内网IP','Chrome 8','Mac OS X','0','登录成功','2020-04-16 16:59:18'),
	(161,'陆志峰','127.0.0.1','内网IP','Chrome 8','Mac OS X','0','退出成功','2020-04-16 17:00:32'),
	(162,'陆志峰','127.0.0.1','内网IP','Chrome 8','Mac OS X','0','登录成功','2020-04-16 17:00:48'),
	(163,'admin','127.0.0.1','内网IP','Chrome 8','Mac OS X','0','登录成功','2020-04-17 09:37:29'),
	(164,'admin','127.0.0.1','内网IP','Chrome 8','Mac OS X','0','登录成功','2020-04-17 10:25:15'),
	(165,'admin','127.0.0.1','内网IP','Chrome 8','Mac OS X','0','登录成功','2020-04-17 11:16:58'),
	(166,'admin','127.0.0.1','内网IP','Chrome 8','Mac OS X','0','退出成功','2020-04-17 11:17:26'),
	(167,'刘银年','127.0.0.1','内网IP','Chrome 8','Mac OS X','1','验证码已失效','2020-04-17 11:17:44'),
	(168,'刘银年','127.0.0.1','内网IP','Chrome 8','Mac OS X','0','登录成功','2020-04-17 11:17:44'),
	(169,'刘银年','127.0.0.1','内网IP','Chrome 8','Mac OS X','0','退出成功','2020-04-17 11:19:22'),
	(170,'admin','127.0.0.1','内网IP','Chrome 8','Mac OS X','0','登录成功','2020-04-17 11:19:28'),
	(171,'admin','127.0.0.1','内网IP','Chrome 8','Mac OS X','0','退出成功','2020-04-17 11:21:30'),
	(172,'admin','127.0.0.1','内网IP','Chrome 8','Mac OS X','0','登录成功','2020-04-17 11:21:39'),
	(173,'admin','127.0.0.1','内网IP','Chrome 8','Mac OS X','0','退出成功','2020-04-17 11:24:22'),
	(174,'admin','127.0.0.1','内网IP','Chrome 8','Mac OS X','0','登录成功','2020-04-17 11:24:28'),
	(175,'admin','127.0.0.1','内网IP','Chrome 8','Mac OS X','0','退出成功','2020-04-17 11:24:55'),
	(176,'admin','127.0.0.1','内网IP','Chrome 8','Mac OS X','0','登录成功','2020-04-17 11:25:00'),
	(177,'admin','127.0.0.1','内网IP','Chrome 8','Mac OS X','0','登录成功','2020-04-17 11:33:36'),
	(178,'admin','127.0.0.1','内网IP','Chrome 8','Mac OS X','0','退出成功','2020-04-17 11:35:04'),
	(179,'刘银年','127.0.0.1','内网IP','Chrome 8','Mac OS X','0','登录成功','2020-04-17 11:35:18'),
	(180,'刘银年','127.0.0.1','内网IP','Chrome 8','Mac OS X','0','退出成功','2020-04-17 11:39:10'),
	(181,'admin','127.0.0.1','内网IP','Chrome 8','Mac OS X','0','登录成功','2020-04-17 11:39:17'),
	(182,'admin','127.0.0.1','内网IP','Chrome 8','Mac OS X','0','登录成功','2020-04-17 13:45:02');

/*!40000 ALTER TABLE `sys_logininfor` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table sys_menu
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sys_menu`;

CREATE TABLE `sys_menu` (
  `menu_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
  `menu_name` varchar(50) NOT NULL COMMENT '菜单名称',
  `parent_id` bigint(20) DEFAULT '0' COMMENT '父菜单ID',
  `order_num` int(4) DEFAULT '0' COMMENT '显示顺序',
  `path` varchar(200) DEFAULT '' COMMENT '路由地址',
  `component` varchar(255) DEFAULT NULL COMMENT '组件路径',
  `is_frame` int(1) DEFAULT '1' COMMENT '是否为外链（0是 1否）',
  `menu_type` char(1) DEFAULT '' COMMENT '菜单类型（M目录 C菜单 F按钮）',
  `visible` char(1) DEFAULT '0' COMMENT '菜单状态（0显示 1隐藏）',
  `perms` varchar(100) DEFAULT NULL COMMENT '权限标识',
  `icon` varchar(100) DEFAULT '#' COMMENT '菜单图标',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`menu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='菜单权限表';

LOCK TABLES `sys_menu` WRITE;
/*!40000 ALTER TABLE `sys_menu` DISABLE KEYS */;

INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `is_frame`, `menu_type`, `visible`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`)
VALUES
	(1,'系统管理',0,31,'system',NULL,1,'M','0','','system','admin','2018-03-16 11:33:00','admin','2020-04-10 15:19:56','系统管理目录'),
	(2,'系统监控',0,32,'monitor',NULL,1,'M','0','','monitor','admin','2018-03-16 11:33:00','admin','2020-04-10 15:20:06','系统监控目录'),
	(3,'系统工具',0,33,'tool',NULL,1,'M','0','','tool','admin','2018-03-16 11:33:00','admin','2020-04-10 15:20:01','系统工具目录'),
	(100,'用户管理',1,1,'user','system/user/index',1,'C','0','system:user:list','user','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00','用户管理菜单'),
	(101,'角色管理',1,2,'role','system/role/index',1,'C','0','system:role:list','peoples','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00','角色管理菜单'),
	(102,'菜单管理',1,3,'menu','system/menu/index',1,'C','0','system:menu:list','tree-table','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00','菜单管理菜单'),
	(103,'部门管理',1,4,'dept','system/dept/index',1,'C','0','system:dept:list','tree','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00','部门管理菜单'),
	(104,'岗位管理',1,5,'post','system/post/index',1,'C','0','system:post:list','post','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00','岗位管理菜单'),
	(105,'字典管理',1,6,'dict','system/dict/index',1,'C','0','system:dict:list','dict','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00','字典管理菜单'),
	(106,'参数设置',1,7,'config','system/config/index',1,'C','0','system:config:list','edit','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00','参数设置菜单'),
	(107,'通知公告',1,8,'notice','system/notice/index',1,'C','0','system:notice:list','message','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00','通知公告菜单'),
	(108,'日志管理',1,9,'log','system/log/index',1,'M','0','','log','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00','日志管理菜单'),
	(109,'在线用户',2,1,'online','monitor/online/index',1,'C','0','monitor:online:list','online','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00','在线用户菜单'),
	(110,'定时任务',2,2,'job','monitor/job/index',1,'C','0','monitor:job:list','job','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00','定时任务菜单'),
	(111,'数据监控',2,3,'druid','monitor/druid/index',1,'C','0','monitor:druid:list','druid','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00','数据监控菜单'),
	(112,'服务监控',2,4,'server','monitor/server/index',1,'C','0','monitor:server:list','server','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00','服务监控菜单'),
	(113,'表单构建',3,1,'build','tool/build/index',1,'C','0','tool:build:list','build','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00','表单构建菜单'),
	(114,'代码生成',3,2,'gen','tool/gen/index',1,'C','0','tool:gen:list','code','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00','代码生成菜单'),
	(115,'系统接口',3,3,'swagger','tool/swagger/index',1,'C','0','tool:swagger:list','swagger','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00','系统接口菜单'),
	(500,'操作日志',108,1,'operlog','monitor/operlog/index',1,'C','0','monitor:operlog:list','form','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00','操作日志菜单'),
	(501,'登录日志',108,2,'logininfor','monitor/logininfor/index',1,'C','0','monitor:logininfor:list','logininfor','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00','登录日志菜单'),
	(1001,'用户查询',100,1,'','',1,'F','0','system:user:query','#','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00',''),
	(1002,'用户新增',100,2,'','',1,'F','0','system:user:add','#','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00',''),
	(1003,'用户修改',100,3,'','',1,'F','0','system:user:edit','#','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00',''),
	(1004,'用户删除',100,4,'','',1,'F','0','system:user:remove','#','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00',''),
	(1005,'用户导出',100,5,'','',1,'F','0','system:user:export','#','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00',''),
	(1006,'用户导入',100,6,'','',1,'F','0','system:user:import','#','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00',''),
	(1007,'重置密码',100,7,'','',1,'F','0','system:user:resetPwd','#','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00',''),
	(1008,'角色查询',101,1,'','',1,'F','0','system:role:query','#','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00',''),
	(1009,'角色新增',101,2,'','',1,'F','0','system:role:add','#','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00',''),
	(1010,'角色修改',101,3,'','',1,'F','0','system:role:edit','#','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00',''),
	(1011,'角色删除',101,4,'','',1,'F','0','system:role:remove','#','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00',''),
	(1012,'角色导出',101,5,'','',1,'F','0','system:role:export','#','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00',''),
	(1013,'菜单查询',102,1,'','',1,'F','0','system:menu:query','#','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00',''),
	(1014,'菜单新增',102,2,'','',1,'F','0','system:menu:add','#','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00',''),
	(1015,'菜单修改',102,3,'','',1,'F','0','system:menu:edit','#','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00',''),
	(1016,'菜单删除',102,4,'','',1,'F','0','system:menu:remove','#','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00',''),
	(1017,'部门查询',103,1,'','',1,'F','0','system:dept:query','#','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00',''),
	(1018,'部门新增',103,2,'','',1,'F','0','system:dept:add','#','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00',''),
	(1019,'部门修改',103,3,'','',1,'F','0','system:dept:edit','#','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00',''),
	(1020,'部门删除',103,4,'','',1,'F','0','system:dept:remove','#','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00',''),
	(1021,'岗位查询',104,1,'','',1,'F','0','system:post:query','#','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00',''),
	(1022,'岗位新增',104,2,'','',1,'F','0','system:post:add','#','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00',''),
	(1023,'岗位修改',104,3,'','',1,'F','0','system:post:edit','#','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00',''),
	(1024,'岗位删除',104,4,'','',1,'F','0','system:post:remove','#','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00',''),
	(1025,'岗位导出',104,5,'','',1,'F','0','system:post:export','#','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00',''),
	(1026,'字典查询',105,1,'#','',1,'F','0','system:dict:query','#','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00',''),
	(1027,'字典新增',105,2,'#','',1,'F','0','system:dict:add','#','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00',''),
	(1028,'字典修改',105,3,'#','',1,'F','0','system:dict:edit','#','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00',''),
	(1029,'字典删除',105,4,'#','',1,'F','0','system:dict:remove','#','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00',''),
	(1030,'字典导出',105,5,'#','',1,'F','0','system:dict:export','#','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00',''),
	(1031,'参数查询',106,1,'#','',1,'F','0','system:config:query','#','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00',''),
	(1032,'参数新增',106,2,'#','',1,'F','0','system:config:add','#','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00',''),
	(1033,'参数修改',106,3,'#','',1,'F','0','system:config:edit','#','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00',''),
	(1034,'参数删除',106,4,'#','',1,'F','0','system:config:remove','#','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00',''),
	(1035,'参数导出',106,5,'#','',1,'F','0','system:config:export','#','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00',''),
	(1036,'公告查询',107,1,'#','',1,'F','0','system:notice:query','#','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00',''),
	(1037,'公告新增',107,2,'#','',1,'F','0','system:notice:add','#','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00',''),
	(1038,'公告修改',107,3,'#','',1,'F','0','system:notice:edit','#','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00',''),
	(1039,'公告删除',107,4,'#','',1,'F','0','system:notice:remove','#','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00',''),
	(1040,'操作查询',500,1,'#','',1,'F','0','monitor:operlog:query','#','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00',''),
	(1041,'操作删除',500,2,'#','',1,'F','0','monitor:operlog:remove','#','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00',''),
	(1042,'日志导出',500,4,'#','',1,'F','0','monitor:operlog:export','#','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00',''),
	(1043,'登录查询',501,1,'#','',1,'F','0','monitor:logininfor:query','#','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00',''),
	(1044,'登录删除',501,2,'#','',1,'F','0','monitor:logininfor:remove','#','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00',''),
	(1045,'日志导出',501,3,'#','',1,'F','0','monitor:logininfor:export','#','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00',''),
	(1046,'在线查询',109,1,'#','',1,'F','0','monitor:online:query','#','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00',''),
	(1047,'批量强退',109,2,'#','',1,'F','0','monitor:online:batchLogout','#','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00',''),
	(1048,'单条强退',109,3,'#','',1,'F','0','monitor:online:forceLogout','#','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00',''),
	(1049,'任务查询',110,1,'#','',1,'F','0','monitor:job:query','#','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00',''),
	(1050,'任务新增',110,2,'#','',1,'F','0','monitor:job:add','#','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00',''),
	(1051,'任务修改',110,3,'#','',1,'F','0','monitor:job:edit','#','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00',''),
	(1052,'任务删除',110,4,'#','',1,'F','0','monitor:job:remove','#','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00',''),
	(1053,'状态修改',110,5,'#','',1,'F','0','monitor:job:changeStatus','#','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00',''),
	(1054,'任务导出',110,7,'#','',1,'F','0','monitor:job:export','#','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00',''),
	(1055,'生成查询',114,1,'#','',1,'F','0','tool:gen:query','#','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00',''),
	(1056,'生成修改',114,2,'#','',1,'F','0','tool:gen:edit','#','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00',''),
	(1057,'生成删除',114,3,'#','',1,'F','0','tool:gen:remove','#','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00',''),
	(1058,'导入代码',114,2,'#','',1,'F','0','tool:gen:import','#','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00',''),
	(1059,'预览代码',114,4,'#','',1,'F','0','tool:gen:preview','#','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00',''),
	(1060,'生成代码',114,5,'#','',1,'F','0','tool:gen:code','#','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00',''),
	(2000,'组织架构',0,1,'tree',NULL,1,'M','0','','tree','admin','2020-04-10 15:20:41','admin','2020-04-13 09:23:12',''),
	(2001,'论证规划',0,2,'guide',NULL,1,'M','0',NULL,'guide','admin','2020-04-10 15:22:20','',NULL,''),
	(2002,'项目任务',0,3,'task',NULL,1,'M','0','','date-range','admin','2020-04-10 15:23:29','admin','2020-04-10 15:23:40',''),
	(2003,'条件建设',0,4,'build',NULL,1,'M','0',NULL,'build','admin','2020-04-10 15:24:05','',NULL,''),
	(2004,'人才培养',0,5,'train',NULL,1,'M','0','','education','admin','2020-04-10 15:25:10','admin','2020-04-10 15:30:29',''),
	(2005,'知识产权',0,6,'knowledge',NULL,1,'M','0',NULL,'zip','admin','2020-04-10 15:26:28','',NULL,''),
	(2006,'成果转化',0,7,'transformation',NULL,1,'M','0','','swagger','admin','2020-04-10 15:27:28','admin','2020-04-10 15:27:38',''),
	(2007,'实验室管理',0,8,'lab',NULL,1,'M','0',NULL,'monitor','admin','2020-04-10 15:28:12','',NULL,''),
	(2008,'后勤保障',0,9,'safeguard',NULL,1,'M','0',NULL,'people','admin','2020-04-10 15:30:14','',NULL,''),
	(2009,'学术交流',0,10,'commication',NULL,1,'M','0',NULL,'example','admin','2020-04-10 15:33:26','',NULL,''),
	(2010,'对外关系',0,11,'external',NULL,1,'M','0',NULL,'fullscreen','admin','2020-04-10 15:34:42','',NULL,''),
	(2011,'财务报销',0,12,'finance',NULL,1,'M','0','','dashboard','admin','2020-04-10 15:35:19','admin','2020-04-10 15:36:10',''),
	(2012,'绩效评定',0,13,'performance',NULL,1,'M','0',NULL,'chart','admin','2020-04-10 15:36:02','',NULL,''),
	(2013,'党务工作',0,14,'party',NULL,1,'M','0',NULL,'job','admin','2020-04-10 15:37:00','',NULL,''),
	(2014,'安全保密',0,15,'privary',NULL,1,'M','0',NULL,'lock','admin','2020-04-10 15:37:52','',NULL,''),
	(2015,'其他',0,16,'other',NULL,1,'M','0',NULL,'question','admin','2020-04-10 15:41:15','',NULL,''),
	(2016,'组织管理',2000,2,'management','tree/management/index',1,'C','0','tree:management:list','tree','admin','2020-04-13 08:58:19','admin','2020-04-13 09:22:16',''),
	(2017,'部门管理',2000,3,'dept','system/dept/index',1,'C','0','system:dept:list','tree','admin','2020-04-13 09:12:11','admin','2020-04-13 13:34:22',''),
	(2018,'人员管理',2000,1,'people','tree/people/index',1,'C','0','system:user:list','tree','admin','2020-04-13 09:26:55','admin','2020-04-13 09:39:48',''),
	(2019,'角色管理',2000,4,'role','system/role/index',1,'C','0','system:role:list','tree','admin','2020-04-13 09:28:13','admin','2020-04-13 13:30:42',''),
	(2020,'岗位管理',2000,5,'post','system/post/index',1,'C','0','system:post:list','tree','admin','2020-04-13 09:29:43','admin','2020-04-13 13:33:00',''),
	(2021,'人员查询',2018,1,'',NULL,1,'F','0','system:user:query','#','admin','2020-04-13 09:37:53','',NULL,''),
	(2022,'人员新增',2018,2,'',NULL,1,'F','0','system:user:add','#','admin','2020-04-13 09:38:20','admin','2020-04-13 09:38:34',''),
	(2023,'人员修改',2018,3,'',NULL,1,'F','0','system:user:edit','#','admin','2020-04-13 09:41:22','',NULL,''),
	(2025,'人员删除',2018,4,'',NULL,1,'F','0','system:user:remove','#','admin','2020-04-13 10:46:16','',NULL,''),
	(2026,'人员导出',2018,5,'',NULL,1,'F','0','system:user:export','#','admin','2020-04-13 10:46:43','',NULL,''),
	(2027,'人员导入',2018,6,'',NULL,1,'F','0','system:user:import','#','admin','2020-04-13 10:47:03','admin','2020-04-13 10:47:19',''),
	(2028,'重置密码',2018,7,'',NULL,1,'F','0','system:user:resetPwd','#','admin','2020-04-13 10:47:51','',NULL,''),
	(2029,'角色查询',2019,1,'',NULL,1,'F','0','system:role:query','#','admin','2020-04-13 10:49:59','',NULL,''),
	(2030,'角色新增',2019,2,'',NULL,1,'F','0','system:role:add','#','admin','2020-04-13 10:50:20','',NULL,''),
	(2031,'角色修改',2019,3,'',NULL,1,'F','0','system:role:edit','#','admin','2020-04-13 10:51:13','',NULL,''),
	(2032,'角色删除',2019,4,'',NULL,1,'F','0','system:role:remove','#','admin','2020-04-13 10:51:47','',NULL,''),
	(2033,'角色导出',2019,5,'',NULL,1,'F','0','system:role:export','#','admin','2020-04-13 10:52:19','',NULL,''),
	(2034,'部门查询',2017,1,'',NULL,1,'F','0','system:dept:query','#','admin','2020-04-13 13:24:46','',NULL,''),
	(2035,'部门新增',2017,2,'',NULL,1,'F','0','system:dept:add','#','admin','2020-04-13 13:25:11','',NULL,''),
	(2036,'部门删除',2017,3,'',NULL,1,'F','0','system:dept:remove','#','admin','2020-04-13 13:25:45','',NULL,''),
	(2037,'部门修改',2017,4,'',NULL,1,'F','0','system:dept:edit','#','admin','2020-04-13 13:26:07','',NULL,''),
	(2038,'岗位查询',2020,1,'',NULL,1,'F','0','system:post:query','#','admin','2020-04-13 13:27:13','',NULL,''),
	(2040,'岗位新增',2020,2,'',NULL,1,'F','0','system:post:add','#','admin','2020-04-13 13:27:59','',NULL,''),
	(2041,'岗位修改',2020,3,'',NULL,1,'F','0','system:post:edit','#','admin','2020-04-13 13:28:32','',NULL,''),
	(2042,'岗位删除',2020,4,'',NULL,1,'F','0','system:post:remove','#','admin','2020-04-13 13:28:56','admin','2020-04-13 13:29:26',''),
	(2043,'岗位导出',2020,5,'',NULL,1,'F','0','system:post:export','#','admin','2020-04-13 13:29:20','',NULL,''),
	(2046,'评定申请',2012,1,'application','performance/application/index',1,'C','0','performance:application:list','chart','admin','2020-04-16 16:01:17','',NULL,''),
	(2047,'添加',2046,1,'',NULL,1,'F','0','performance:application:add','#','admin','2020-04-16 16:01:58','',NULL,''),
	(2048,'查询',2046,2,'',NULL,1,'F','0','performance:application:query','#','admin','2020-04-16 16:02:20','',NULL,''),
	(2049,'修改',2046,3,'',NULL,1,'F','0','performance:application:update','#','admin','2020-04-16 16:02:45','',NULL,''),
	(2050,'删除',2046,4,'',NULL,1,'F','0','performance:application:remove','#','admin','2020-04-16 16:03:10','',NULL,''),
	(2051,'分发',2046,5,'',NULL,1,'F','0','performance:application:distribution','#','admin','2020-04-16 16:03:27','',NULL,''),
	(2052,'评定审判',2012,2,'evaluate','performance/evaluate/index',1,'C','0','performance:evaluate:list','chart','admin','2020-04-16 16:04:14','',NULL,''),
	(2053,'查询',2052,1,'',NULL,1,'F','0','performance:evaluate:query','#','admin','2020-04-16 16:04:39','',NULL,''),
	(2054,'修改',2052,2,'',NULL,1,'F','0','performance:evaluate:update','#','admin','2020-04-16 16:04:59','',NULL,''),
	(2055,'评定结果',2012,3,'result','performance/result/index',1,'C','0','performance:result:list','chart','admin','2020-04-16 16:05:40','',NULL,''),
	(2056,'查询',2055,1,'',NULL,1,'F','0','performance:result:query','#','admin','2020-04-16 16:06:04','',NULL,''),
	(2057,'日常考核',2012,4,'normal','performance/normal/index',1,'C','0','performance:normal:list','chart','admin','2020-04-16 16:06:49','',NULL,'');

/*!40000 ALTER TABLE `sys_menu` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table sys_notice
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sys_notice`;

CREATE TABLE `sys_notice` (
  `notice_id` int(4) NOT NULL AUTO_INCREMENT COMMENT '公告ID',
  `notice_title` varchar(50) NOT NULL COMMENT '公告标题',
  `notice_type` char(1) NOT NULL COMMENT '公告类型（1通知 2公告）',
  `notice_content` varchar(2000) DEFAULT NULL COMMENT '公告内容',
  `status` char(1) DEFAULT '0' COMMENT '公告状态（0正常 1关闭）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`notice_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='通知公告表';

LOCK TABLES `sys_notice` WRITE;
/*!40000 ALTER TABLE `sys_notice` DISABLE KEYS */;

INSERT INTO `sys_notice` (`notice_id`, `notice_title`, `notice_type`, `notice_content`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`)
VALUES
	(1,'温馨提醒：2018-07-01 若依新版本发布啦','2','新版本内容','0','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00','管理员'),
	(2,'维护通知：2018-07-01 若依系统凌晨维护','1','维护内容','0','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00','管理员');

/*!40000 ALTER TABLE `sys_notice` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table sys_oper_log
# ------------------------------------------------------------

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
  `oper_ip` varchar(50) DEFAULT '' COMMENT '主机地址',
  `oper_location` varchar(255) DEFAULT '' COMMENT '操作地点',
  `oper_param` varchar(2000) DEFAULT '' COMMENT '请求参数',
  `json_result` varchar(2000) DEFAULT '' COMMENT '返回参数',
  `status` int(1) DEFAULT '0' COMMENT '操作状态（0正常 1异常）',
  `error_msg` varchar(2000) DEFAULT '' COMMENT '错误消息',
  `oper_time` datetime DEFAULT NULL COMMENT '操作时间',
  PRIMARY KEY (`oper_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='操作日志记录';

LOCK TABLES `sys_oper_log` WRITE;
/*!40000 ALTER TABLE `sys_oper_log` DISABLE KEYS */;

INSERT INTO `sys_oper_log` (`oper_id`, `title`, `business_type`, `method`, `request_method`, `operator_type`, `oper_name`, `dept_name`, `oper_url`, `oper_ip`, `oper_location`, `oper_param`, `json_result`, `status`, `error_msg`, `oper_time`)
VALUES
	(100,'菜单管理',3,'com.ruoyi.project.system.controller.SysMenuController.remove()','DELETE',1,'admin',NULL,'/system/menu/4','127.0.0.1','内网IP','{menuId=4}','{\"msg\":\"菜单已分配,不允许删除\",\"code\":500}',0,NULL,'2020-04-10 14:51:45'),
	(101,'角色管理',2,'com.ruoyi.project.system.controller.SysRoleController.edit()','PUT',1,'admin',NULL,'/system/role','127.0.0.1','内网IP','{\"flag\":false,\"roleId\":2,\"admin\":false,\"remark\":\"普通角色\",\"dataScope\":\"2\",\"delFlag\":\"0\",\"params\":{},\"roleSort\":\"2\",\"createTime\":1521171180000,\"updateBy\":\"admin\",\"roleKey\":\"common\",\"roleName\":\"普通角色\",\"menuIds\":[1,100,1001,1002,1003,1004,1005,1006,1007,101,1008,1009,1010,1011,1012,102,1013,1014,1015,1016,103,1017,1018,1019,1020,104,1021,1022,1023,1024,1025,105,1026,1027,1028,1029,1030,106,1031,1032,1033,1034,1035,107,1036,1037,1038,1039,108,500,1040,1041,1042,501,1043,1044,1045,2,109,1046,1047,1048,110,1049,1050,1051,1052,1053,1054,111,112,3,113,114,1055,1056,1058,1057,1059,1060,115],\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2020-04-10 14:52:11'),
	(102,'菜单管理',3,'com.ruoyi.project.system.controller.SysMenuController.remove()','DELETE',1,'admin',NULL,'/system/menu/4','127.0.0.1','内网IP','{menuId=4}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2020-04-10 14:52:21'),
	(103,'菜单管理',2,'com.ruoyi.project.system.controller.SysMenuController.edit()','PUT',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"visible\":\"0\",\"icon\":\"system\",\"orderNum\":\"31\",\"menuName\":\"系统管理\",\"params\":{},\"parentId\":0,\"path\":\"system\",\"children\":[],\"createTime\":1521171180000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":1,\"menuType\":\"M\",\"perms\":\"\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2020-04-10 15:19:56'),
	(104,'菜单管理',2,'com.ruoyi.project.system.controller.SysMenuController.edit()','PUT',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"visible\":\"0\",\"icon\":\"tool\",\"orderNum\":\"33\",\"menuName\":\"系统工具\",\"params\":{},\"parentId\":0,\"path\":\"tool\",\"children\":[],\"createTime\":1521171180000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":3,\"menuType\":\"M\",\"perms\":\"\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2020-04-10 15:20:01'),
	(105,'菜单管理',2,'com.ruoyi.project.system.controller.SysMenuController.edit()','PUT',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"visible\":\"0\",\"icon\":\"monitor\",\"orderNum\":\"32\",\"menuName\":\"系统监控\",\"params\":{},\"parentId\":0,\"path\":\"monitor\",\"children\":[],\"createTime\":1521171180000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2,\"menuType\":\"M\",\"perms\":\"\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2020-04-10 15:20:06'),
	(106,'菜单管理',1,'com.ruoyi.project.system.controller.SysMenuController.add()','POST',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"visible\":\"0\",\"icon\":\"tree\",\"orderNum\":\"1\",\"menuName\":\"组织架构\",\"params\":{},\"path\":\"tree\",\"createBy\":\"admin\",\"children\":[],\"isFrame\":\"1\",\"menuType\":\"M\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2020-04-10 15:20:41'),
	(107,'菜单管理',1,'com.ruoyi.project.system.controller.SysMenuController.add()','POST',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"visible\":\"0\",\"icon\":\"guide\",\"orderNum\":\"2\",\"menuName\":\"论证规划\",\"params\":{},\"path\":\"guide\",\"createBy\":\"admin\",\"children\":[],\"isFrame\":\"1\",\"menuType\":\"M\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2020-04-10 15:22:20'),
	(108,'菜单管理',1,'com.ruoyi.project.system.controller.SysMenuController.add()','POST',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"visible\":\"0\",\"icon\":\"date-range\",\"orderNum\":\"4\",\"menuName\":\"项目任务\",\"params\":{},\"path\":\"task\",\"createBy\":\"admin\",\"children\":[],\"isFrame\":\"1\",\"menuType\":\"M\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2020-04-10 15:23:29'),
	(109,'菜单管理',2,'com.ruoyi.project.system.controller.SysMenuController.edit()','PUT',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"visible\":\"0\",\"icon\":\"date-range\",\"orderNum\":\"3\",\"menuName\":\"项目任务\",\"params\":{},\"parentId\":0,\"path\":\"task\",\"children\":[],\"createTime\":1586503409000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2002,\"menuType\":\"M\",\"perms\":\"\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2020-04-10 15:23:41'),
	(110,'菜单管理',1,'com.ruoyi.project.system.controller.SysMenuController.add()','POST',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"visible\":\"0\",\"icon\":\"build\",\"orderNum\":\"4\",\"menuName\":\"条件建设\",\"params\":{},\"path\":\"build\",\"createBy\":\"admin\",\"children\":[],\"isFrame\":\"1\",\"menuType\":\"M\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2020-04-10 15:24:05'),
	(111,'菜单管理',1,'com.ruoyi.project.system.controller.SysMenuController.add()','POST',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"visible\":\"0\",\"icon\":\"people\",\"orderNum\":\"5\",\"menuName\":\"人才培养\",\"params\":{},\"path\":\"train\",\"createBy\":\"admin\",\"children\":[],\"isFrame\":\"1\",\"menuType\":\"M\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2020-04-10 15:25:10'),
	(112,'菜单管理',1,'com.ruoyi.project.system.controller.SysMenuController.add()','POST',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"visible\":\"0\",\"icon\":\"zip\",\"orderNum\":\"6\",\"menuName\":\"知识产权\",\"params\":{},\"path\":\"knowledge\",\"createBy\":\"admin\",\"children\":[],\"isFrame\":\"1\",\"menuType\":\"M\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2020-04-10 15:26:28'),
	(113,'菜单管理',1,'com.ruoyi.project.system.controller.SysMenuController.add()','POST',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"visible\":\"0\",\"icon\":\"swagger\",\"orderNum\":\"7\",\"menuName\":\"成功转化\",\"params\":{},\"path\":\"transformation\",\"createBy\":\"admin\",\"children\":[],\"isFrame\":\"1\",\"menuType\":\"M\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2020-04-10 15:27:28'),
	(114,'菜单管理',2,'com.ruoyi.project.system.controller.SysMenuController.edit()','PUT',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"visible\":\"0\",\"icon\":\"swagger\",\"orderNum\":\"7\",\"menuName\":\"成果转化\",\"params\":{},\"parentId\":0,\"path\":\"transformation\",\"children\":[],\"createTime\":1586503648000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2006,\"menuType\":\"M\",\"perms\":\"\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2020-04-10 15:27:38'),
	(115,'菜单管理',1,'com.ruoyi.project.system.controller.SysMenuController.add()','POST',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"visible\":\"0\",\"icon\":\"monitor\",\"orderNum\":\"8\",\"menuName\":\"实验室管理\",\"params\":{},\"path\":\"lab\",\"createBy\":\"admin\",\"children\":[],\"isFrame\":\"1\",\"menuType\":\"M\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2020-04-10 15:28:12'),
	(116,'菜单管理',1,'com.ruoyi.project.system.controller.SysMenuController.add()','POST',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"visible\":\"0\",\"icon\":\"people\",\"orderNum\":\"9\",\"menuName\":\"后勤保障\",\"params\":{},\"path\":\"safeguard\",\"createBy\":\"admin\",\"children\":[],\"isFrame\":\"1\",\"menuType\":\"M\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2020-04-10 15:30:15'),
	(117,'菜单管理',2,'com.ruoyi.project.system.controller.SysMenuController.edit()','PUT',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"visible\":\"0\",\"icon\":\"education\",\"orderNum\":\"5\",\"menuName\":\"人才培养\",\"params\":{},\"parentId\":0,\"path\":\"train\",\"children\":[],\"createTime\":1586503510000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2004,\"menuType\":\"M\",\"perms\":\"\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2020-04-10 15:30:29'),
	(118,'菜单管理',1,'com.ruoyi.project.system.controller.SysMenuController.add()','POST',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"visible\":\"0\",\"icon\":\"example\",\"orderNum\":\"10\",\"menuName\":\"学术交流\",\"params\":{},\"path\":\"commication\",\"createBy\":\"admin\",\"children\":[],\"isFrame\":\"1\",\"menuType\":\"M\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2020-04-10 15:33:26'),
	(119,'菜单管理',1,'com.ruoyi.project.system.controller.SysMenuController.add()','POST',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"visible\":\"0\",\"icon\":\"fullscreen\",\"orderNum\":\"11\",\"menuName\":\"对外关系\",\"params\":{},\"path\":\"external\",\"createBy\":\"admin\",\"children\":[],\"isFrame\":\"1\",\"menuType\":\"M\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2020-04-10 15:34:42'),
	(120,'菜单管理',1,'com.ruoyi.project.system.controller.SysMenuController.add()','POST',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"visible\":\"0\",\"icon\":\"dashboard\",\"orderNum\":\"14\",\"menuName\":\"财务报销\",\"params\":{},\"path\":\"finance\",\"createBy\":\"admin\",\"children\":[],\"isFrame\":\"1\",\"menuType\":\"M\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2020-04-10 15:35:19'),
	(121,'菜单管理',1,'com.ruoyi.project.system.controller.SysMenuController.add()','POST',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"visible\":\"0\",\"icon\":\"chart\",\"orderNum\":\"13\",\"menuName\":\"绩效评定\",\"params\":{},\"path\":\"performance\",\"createBy\":\"admin\",\"children\":[],\"isFrame\":\"1\",\"menuType\":\"M\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2020-04-10 15:36:02'),
	(122,'菜单管理',2,'com.ruoyi.project.system.controller.SysMenuController.edit()','PUT',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"visible\":\"0\",\"icon\":\"dashboard\",\"orderNum\":\"12\",\"menuName\":\"财务报销\",\"params\":{},\"parentId\":0,\"path\":\"finance\",\"children\":[],\"createTime\":1586504119000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2011,\"menuType\":\"M\",\"perms\":\"\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2020-04-10 15:36:10'),
	(123,'菜单管理',1,'com.ruoyi.project.system.controller.SysMenuController.add()','POST',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"visible\":\"0\",\"icon\":\"job\",\"orderNum\":\"14\",\"menuName\":\"党务工作\",\"params\":{},\"path\":\"party\",\"createBy\":\"admin\",\"children\":[],\"isFrame\":\"1\",\"menuType\":\"M\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2020-04-10 15:37:00'),
	(124,'菜单管理',1,'com.ruoyi.project.system.controller.SysMenuController.add()','POST',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"visible\":\"0\",\"icon\":\"lock\",\"orderNum\":\"15\",\"menuName\":\"安全保密\",\"params\":{},\"path\":\"privary\",\"createBy\":\"admin\",\"children\":[],\"isFrame\":\"1\",\"menuType\":\"M\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2020-04-10 15:37:52'),
	(125,'菜单管理',1,'com.ruoyi.project.system.controller.SysMenuController.add()','POST',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"visible\":\"0\",\"icon\":\"question\",\"orderNum\":\"16\",\"menuName\":\"其他\",\"params\":{},\"path\":\"other\",\"createBy\":\"admin\",\"children\":[],\"isFrame\":\"1\",\"menuType\":\"M\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2020-04-10 15:41:15'),
	(126,'用户管理',6,'com.ruoyi.project.system.controller.SysUserController.importData()','POST',1,'admin',NULL,'/system/user/importData','127.0.0.1','内网IP','false','null',1,'很抱歉，导入失败！共 1 条数据格式不正确，错误如下：<br/>1、账号 allen 导入失败：\n### Error updating database.  Cause: com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Data too long for column \'sex\' at row 1\n### The error may involve com.ruoyi.project.system.mapper.SysUserMapper.insertUser-Inline\n### The error occurred while setting parameters\n### SQL: insert into sys_user(      user_id,             user_name,       nick_name,                   phonenumber,       sex,       password,       status,       create_by,            create_time    )values(      ?,             ?,       ?,                   ?,       ?,       ?,       ?,       ?,            sysdate()    )\n### Cause: com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Data too long for column \'sex\' at row 1\n; Data truncation: Data too long for column \'sex\' at row 1; nested exception is com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Data too long for column \'sex\' at row 1','2020-04-10 16:44:59'),
	(127,'用户管理',6,'com.ruoyi.project.system.controller.SysUserController.importData()','POST',1,'admin',NULL,'/system/user/importData','127.0.0.1','内网IP','false','null',1,'很抱歉，导入失败！共 1 条数据格式不正确，错误如下：<br/>1、账号 allen 导入失败：\n### Error updating database.  Cause: com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Data too long for column \'sex\' at row 1\n### The error may involve com.ruoyi.project.system.mapper.SysUserMapper.insertUser-Inline\n### The error occurred while setting parameters\n### SQL: insert into sys_user(      user_id,             user_name,       nick_name,                   phonenumber,       sex,       password,       status,       create_by,            create_time    )values(      ?,             ?,       ?,                   ?,       ?,       ?,       ?,       ?,            sysdate()    )\n### Cause: com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Data too long for column \'sex\' at row 1\n; Data truncation: Data too long for column \'sex\' at row 1; nested exception is com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Data too long for column \'sex\' at row 1','2020-04-10 16:53:09'),
	(128,'用户管理',6,'com.ruoyi.project.system.controller.SysUserController.importData()','POST',1,'admin',NULL,'/system/user/importData','127.0.0.1','内网IP','false','null',1,'很抱歉，导入失败！共 1 条数据格式不正确，错误如下：<br/>1、账号 allen 导入失败：\n### Error updating database.  Cause: com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Data too long for column \'sex\' at row 1\n### The error may involve com.ruoyi.project.system.mapper.SysUserMapper.insertUser-Inline\n### The error occurred while setting parameters\n### SQL: insert into sys_user(      user_id,             user_name,       nick_name,                   phonenumber,       sex,       password,       status,       create_by,            create_time    )values(      ?,             ?,       ?,                   ?,       ?,       ?,       ?,       ?,            sysdate()    )\n### Cause: com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Data too long for column \'sex\' at row 1\n; Data truncation: Data too long for column \'sex\' at row 1; nested exception is com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Data too long for column \'sex\' at row 1','2020-04-10 17:04:21'),
	(129,'用户管理',6,'com.ruoyi.project.system.controller.SysUserController.importData()','POST',1,'admin',NULL,'/system/user/importData','127.0.0.1','内网IP','false','{\"msg\":\"恭喜您，数据已全部导入成功！共 1 条，数据如下：<br/>1、账号 allen 导入成功\",\"code\":200}',0,NULL,'2020-04-10 17:05:22'),
	(130,'用户管理',3,'com.ruoyi.project.system.controller.SysUserController.remove()','DELETE',1,'admin',NULL,'/system/user/3','127.0.0.1','内网IP','{userIds=3}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2020-04-10 17:05:36'),
	(131,'用户管理',6,'com.ruoyi.project.system.controller.SysUserController.importData()','POST',1,'admin',NULL,'/system/user/importData','127.0.0.1','内网IP','false','null',1,'很抱歉，导入失败！共 1 条数据格式不正确，错误如下：<br/>1、账号 allen 已存在','2020-04-10 17:05:52'),
	(132,'用户管理',6,'com.ruoyi.project.system.controller.SysUserController.importData()','POST',1,'admin',NULL,'/system/user/importData','127.0.0.1','内网IP','false','{\"msg\":\"恭喜您，数据已全部导入成功！共 1 条，数据如下：<br/>1、账号 allen 导入成功\",\"code\":200}',0,NULL,'2020-04-10 17:07:19'),
	(133,'用户管理',3,'com.ruoyi.project.system.controller.SysUserController.remove()','DELETE',1,'admin',NULL,'/system/user/100','127.0.0.1','内网IP','{userIds=100}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2020-04-10 17:07:43'),
	(134,'用户管理',3,'com.ruoyi.project.system.controller.SysUserController.remove()','DELETE',1,'admin',NULL,'/system/user/100','127.0.0.1','内网IP','{userIds=100}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2020-04-10 17:08:50'),
	(135,'用户管理',5,'com.ruoyi.project.system.controller.SysUserController.export()','GET',1,'admin',NULL,'/system/user/export','127.0.0.1','内网IP','{}','{\"msg\":\"ad6fe52a-2589-459f-9378-0473aa12993e_用户数据.xlsx\",\"code\":200}',0,NULL,'2020-04-10 17:15:12'),
	(136,'菜单管理',2,'com.ruoyi.project.system.controller.SysMenuController.edit()','PUT',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"visible\":\"0\",\"icon\":\"tree\",\"orderNum\":\"1\",\"menuName\":\"组织架构\",\"params\":{},\"parentId\":0,\"path\":\"tree/index\",\"children\":[],\"createTime\":1586503241000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2000,\"menuType\":\"M\",\"perms\":\"\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2020-04-13 08:52:58'),
	(137,'菜单管理',1,'com.ruoyi.project.system.controller.SysMenuController.add()','POST',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"visible\":\"0\",\"icon\":\"tree\",\"orderNum\":\"1\",\"menuName\":\"管理\",\"params\":{},\"parentId\":2000,\"path\":\"tree\",\"component\":\"tree/management/index\",\"createBy\":\"admin\",\"children\":[],\"isFrame\":\"1\",\"menuType\":\"C\",\"perms\":\"tree:management:list\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2020-04-13 08:58:19'),
	(138,'菜单管理',2,'com.ruoyi.project.system.controller.SysMenuController.edit()','PUT',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"visible\":\"0\",\"icon\":\"tree\",\"orderNum\":\"1\",\"menuName\":\"组织管理\",\"params\":{},\"parentId\":2000,\"path\":\"tree\",\"component\":\"tree/management/index\",\"children\":[],\"createTime\":1586739499000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2016,\"menuType\":\"C\",\"perms\":\"tree:management:list\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2020-04-13 09:01:22'),
	(139,'菜单管理',1,'com.ruoyi.project.system.controller.SysMenuController.add()','POST',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"visible\":\"0\",\"icon\":\"tree\",\"orderNum\":\"1\",\"menuName\":\"部门管理\",\"params\":{},\"parentId\":2000,\"path\":\"tree\",\"component\":\"tree/department/index\",\"createBy\":\"admin\",\"children\":[],\"isFrame\":\"1\",\"menuType\":\"C\",\"perms\":\"tree/department/index\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2020-04-13 09:12:11'),
	(140,'菜单管理',2,'com.ruoyi.project.system.controller.SysMenuController.edit()','PUT',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"visible\":\"0\",\"icon\":\"tree\",\"orderNum\":\"1\",\"menuName\":\"部门管理\",\"params\":{},\"parentId\":2000,\"path\":\"tree\",\"component\":\"tree/department/index\",\"children\":[],\"createTime\":1586740331000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2017,\"menuType\":\"C\",\"perms\":\"tree:department:list\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2020-04-13 09:12:34'),
	(141,'菜单管理',2,'com.ruoyi.project.system.controller.SysMenuController.edit()','PUT',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"visible\":\"0\",\"icon\":\"tree\",\"orderNum\":\"1\",\"menuName\":\"部门管理\",\"params\":{},\"parentId\":2000,\"path\":\"tree\",\"component\":\"tree/department/index\",\"children\":[],\"createTime\":1586740331000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2017,\"menuType\":\"C\",\"perms\":\"tree:department:list\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2020-04-13 09:15:09'),
	(142,'菜单管理',2,'com.ruoyi.project.system.controller.SysMenuController.edit()','PUT',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"visible\":\"0\",\"icon\":\"tree\",\"orderNum\":\"1\",\"menuName\":\"组织管理\",\"params\":{},\"parentId\":2000,\"path\":\"management\",\"component\":\"tree/management/index\",\"children\":[],\"createTime\":1586739499000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2016,\"menuType\":\"C\",\"perms\":\"tree:management:list\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2020-04-13 09:18:23'),
	(143,'菜单管理',2,'com.ruoyi.project.system.controller.SysMenuController.edit()','PUT',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"visible\":\"0\",\"icon\":\"tree\",\"orderNum\":\"1\",\"menuName\":\"部门管理\",\"params\":{},\"parentId\":2000,\"path\":\"department\",\"component\":\"tree/department/index\",\"children\":[],\"createTime\":1586740331000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2017,\"menuType\":\"C\",\"perms\":\"tree:department:list\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2020-04-13 09:18:30'),
	(144,'菜单管理',2,'com.ruoyi.project.system.controller.SysMenuController.edit()','PUT',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"visible\":\"0\",\"icon\":\"tree\",\"orderNum\":\"2\",\"menuName\":\"组织管理\",\"params\":{},\"parentId\":2000,\"path\":\"management\",\"component\":\"tree/management/index\",\"children\":[],\"createTime\":1586739499000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2016,\"menuType\":\"C\",\"perms\":\"tree:management:list\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2020-04-13 09:22:16'),
	(145,'菜单管理',2,'com.ruoyi.project.system.controller.SysMenuController.edit()','PUT',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"visible\":\"0\",\"icon\":\"tree\",\"orderNum\":\"1\",\"menuName\":\"组织架构\",\"params\":{},\"parentId\":0,\"path\":\"tree\",\"children\":[],\"createTime\":1586503241000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2000,\"menuType\":\"M\",\"perms\":\"\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2020-04-13 09:23:12'),
	(146,'菜单管理',1,'com.ruoyi.project.system.controller.SysMenuController.add()','POST',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"visible\":\"0\",\"icon\":\"tree\",\"orderNum\":\"1\",\"menuName\":\"人员管理\",\"params\":{},\"parentId\":2000,\"path\":\"people\",\"component\":\"tree/people/index\",\"createBy\":\"admin\",\"children\":[],\"isFrame\":\"1\",\"menuType\":\"C\",\"perms\":\"tree:people:list\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2020-04-13 09:26:55'),
	(147,'菜单管理',1,'com.ruoyi.project.system.controller.SysMenuController.add()','POST',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"visible\":\"0\",\"icon\":\"tree\",\"orderNum\":\"4\",\"menuName\":\"角色管理\",\"params\":{},\"parentId\":2000,\"path\":\"role\",\"component\":\"tree/role/index\",\"createBy\":\"admin\",\"children\":[],\"isFrame\":\"1\",\"menuType\":\"C\",\"perms\":\"tree:role:list\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2020-04-13 09:28:13'),
	(148,'菜单管理',1,'com.ruoyi.project.system.controller.SysMenuController.add()','POST',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"visible\":\"0\",\"icon\":\"tree\",\"orderNum\":\"5\",\"menuName\":\"岗位管理\",\"params\":{},\"parentId\":2000,\"path\":\"post\",\"component\":\"tree/post/index\",\"createBy\":\"admin\",\"children\":[],\"isFrame\":\"1\",\"menuType\":\"C\",\"perms\":\"tree:post:index\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2020-04-13 09:29:43'),
	(149,'菜单管理',2,'com.ruoyi.project.system.controller.SysMenuController.edit()','PUT',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"visible\":\"0\",\"icon\":\"tree\",\"orderNum\":\"5\",\"menuName\":\"岗位管理\",\"params\":{},\"parentId\":2000,\"path\":\"post\",\"component\":\"tree/post/index\",\"children\":[],\"createTime\":1586741383000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2020,\"menuType\":\"C\",\"perms\":\"tree:post:list\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2020-04-13 09:29:53'),
	(150,'菜单管理',2,'com.ruoyi.project.system.controller.SysMenuController.edit()','PUT',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"visible\":\"0\",\"icon\":\"tree\",\"orderNum\":\"2\",\"menuName\":\"部门管理\",\"params\":{},\"parentId\":2000,\"path\":\"department\",\"component\":\"tree/department/index\",\"children\":[],\"createTime\":1586740331000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2017,\"menuType\":\"C\",\"perms\":\"tree:department:list\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2020-04-13 09:30:21'),
	(151,'菜单管理',2,'com.ruoyi.project.system.controller.SysMenuController.edit()','PUT',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"visible\":\"0\",\"icon\":\"tree\",\"orderNum\":\"3\",\"menuName\":\"部门管理\",\"params\":{},\"parentId\":2000,\"path\":\"department\",\"component\":\"tree/department/index\",\"children\":[],\"createTime\":1586740331000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2017,\"menuType\":\"C\",\"perms\":\"tree:department:list\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2020-04-13 09:30:28'),
	(152,'菜单管理',1,'com.ruoyi.project.system.controller.SysMenuController.add()','POST',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"visible\":\"0\",\"orderNum\":\"1\",\"menuName\":\"人员查询\",\"params\":{},\"parentId\":2018,\"createBy\":\"admin\",\"children\":[],\"isFrame\":\"1\",\"menuType\":\"F\",\"perms\":\"system:user:query\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2020-04-13 09:37:53'),
	(153,'菜单管理',1,'com.ruoyi.project.system.controller.SysMenuController.add()','POST',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"visible\":\"0\",\"orderNum\":\"2\",\"menuName\":\"人员添加\",\"params\":{},\"parentId\":2018,\"createBy\":\"admin\",\"children\":[],\"isFrame\":\"1\",\"menuType\":\"F\",\"perms\":\"system:user:add\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2020-04-13 09:38:20'),
	(154,'菜单管理',2,'com.ruoyi.project.system.controller.SysMenuController.edit()','PUT',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"visible\":\"0\",\"icon\":\"#\",\"orderNum\":\"2\",\"menuName\":\"人员新增\",\"params\":{},\"parentId\":2018,\"path\":\"\",\"children\":[],\"createTime\":1586741900000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2022,\"menuType\":\"F\",\"perms\":\"system:user:add\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2020-04-13 09:38:34'),
	(155,'菜单管理',2,'com.ruoyi.project.system.controller.SysMenuController.edit()','PUT',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"visible\":\"0\",\"icon\":\"tree\",\"orderNum\":\"1\",\"menuName\":\"人员管理\",\"params\":{},\"parentId\":2000,\"path\":\"people\",\"component\":\"tree/people/index\",\"children\":[],\"createTime\":1586741215000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2018,\"menuType\":\"C\",\"perms\":\"system:user:list\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2020-04-13 09:39:48'),
	(156,'菜单管理',1,'com.ruoyi.project.system.controller.SysMenuController.add()','POST',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"visible\":\"0\",\"orderNum\":\"3\",\"menuName\":\"人员修改\",\"params\":{},\"parentId\":2018,\"createBy\":\"admin\",\"children\":[],\"isFrame\":\"1\",\"menuType\":\"F\",\"perms\":\"system:user:edit\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2020-04-13 09:41:22'),
	(157,'菜单管理',1,'com.ruoyi.project.system.controller.SysMenuController.add()','POST',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"visible\":\"0\",\"orderNum\":\"4\",\"menuName\":\"人员删除\",\"params\":{},\"parentId\":2021,\"createBy\":\"admin\",\"children\":[],\"isFrame\":\"1\",\"menuType\":\"F\",\"perms\":\"system:user:delete\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2020-04-13 10:45:33'),
	(158,'菜单管理',3,'com.ruoyi.project.system.controller.SysMenuController.remove()','DELETE',1,'admin',NULL,'/system/menu/2024','127.0.0.1','内网IP','{menuId=2024}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2020-04-13 10:46:00'),
	(159,'菜单管理',1,'com.ruoyi.project.system.controller.SysMenuController.add()','POST',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"visible\":\"0\",\"orderNum\":\"4\",\"menuName\":\"人员删除\",\"params\":{},\"parentId\":2018,\"createBy\":\"admin\",\"children\":[],\"isFrame\":\"1\",\"menuType\":\"F\",\"perms\":\"system:user:remove\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2020-04-13 10:46:16'),
	(160,'菜单管理',1,'com.ruoyi.project.system.controller.SysMenuController.add()','POST',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"visible\":\"0\",\"orderNum\":\"5\",\"menuName\":\"人员导出\",\"params\":{},\"parentId\":2018,\"createBy\":\"admin\",\"children\":[],\"isFrame\":\"1\",\"menuType\":\"F\",\"perms\":\"system:user:export\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2020-04-13 10:46:43'),
	(161,'菜单管理',1,'com.ruoyi.project.system.controller.SysMenuController.add()','POST',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"visible\":\"0\",\"orderNum\":\"6\",\"menuName\":\"人员导入\",\"params\":{},\"parentId\":2018,\"createBy\":\"admin\",\"children\":[],\"isFrame\":\"1\",\"menuType\":\"F\",\"perms\":\"system:user:export\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2020-04-13 10:47:03'),
	(162,'菜单管理',2,'com.ruoyi.project.system.controller.SysMenuController.edit()','PUT',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"visible\":\"0\",\"icon\":\"#\",\"orderNum\":\"6\",\"menuName\":\"人员导入\",\"params\":{},\"parentId\":2018,\"path\":\"\",\"children\":[],\"createTime\":1586746023000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2027,\"menuType\":\"F\",\"perms\":\"system:user:import\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2020-04-13 10:47:19'),
	(163,'菜单管理',1,'com.ruoyi.project.system.controller.SysMenuController.add()','POST',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"visible\":\"0\",\"orderNum\":\"7\",\"menuName\":\"重置密码\",\"params\":{},\"parentId\":2018,\"createBy\":\"admin\",\"children\":[],\"isFrame\":\"1\",\"menuType\":\"F\",\"perms\":\"system:user:resetPwd\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2020-04-13 10:47:52'),
	(164,'菜单管理',1,'com.ruoyi.project.system.controller.SysMenuController.add()','POST',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"visible\":\"0\",\"orderNum\":\"1\",\"menuName\":\"角色查询\",\"params\":{},\"parentId\":2019,\"createBy\":\"admin\",\"children\":[],\"isFrame\":\"1\",\"menuType\":\"F\",\"perms\":\"system:role:query\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2020-04-13 10:49:59'),
	(165,'菜单管理',1,'com.ruoyi.project.system.controller.SysMenuController.add()','POST',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"visible\":\"0\",\"orderNum\":\"2\",\"menuName\":\"角色新增\",\"params\":{},\"parentId\":2019,\"createBy\":\"admin\",\"children\":[],\"isFrame\":\"1\",\"menuType\":\"F\",\"perms\":\"system:role:add\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2020-04-13 10:50:20'),
	(166,'菜单管理',1,'com.ruoyi.project.system.controller.SysMenuController.add()','POST',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"visible\":\"0\",\"orderNum\":\"3\",\"menuName\":\"角色修改\",\"params\":{},\"parentId\":2019,\"createBy\":\"admin\",\"children\":[],\"isFrame\":\"1\",\"menuType\":\"F\",\"perms\":\"system:role:edit\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2020-04-13 10:51:13'),
	(167,'菜单管理',1,'com.ruoyi.project.system.controller.SysMenuController.add()','POST',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"visible\":\"0\",\"orderNum\":\"4\",\"menuName\":\"角色删除\",\"params\":{},\"parentId\":2019,\"createBy\":\"admin\",\"children\":[],\"isFrame\":\"1\",\"menuType\":\"F\",\"perms\":\"system:role:remove\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2020-04-13 10:51:47'),
	(168,'菜单管理',1,'com.ruoyi.project.system.controller.SysMenuController.add()','POST',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"visible\":\"0\",\"orderNum\":\"5\",\"menuName\":\"角色导出\",\"params\":{},\"parentId\":2019,\"createBy\":\"admin\",\"children\":[],\"isFrame\":\"1\",\"menuType\":\"F\",\"perms\":\"system:role:export\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2020-04-13 10:52:19'),
	(169,'菜单管理',1,'com.ruoyi.project.system.controller.SysMenuController.add()','POST',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"visible\":\"0\",\"orderNum\":\"1\",\"menuName\":\"部门查询\",\"params\":{},\"parentId\":2017,\"createBy\":\"admin\",\"children\":[],\"isFrame\":\"1\",\"menuType\":\"F\",\"perms\":\"system:dept:query\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2020-04-13 13:24:46'),
	(170,'菜单管理',1,'com.ruoyi.project.system.controller.SysMenuController.add()','POST',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"visible\":\"0\",\"orderNum\":\"2\",\"menuName\":\"部门新增\",\"params\":{},\"parentId\":2017,\"createBy\":\"admin\",\"children\":[],\"isFrame\":\"1\",\"menuType\":\"F\",\"perms\":\"system:dept:add\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2020-04-13 13:25:12'),
	(171,'菜单管理',1,'com.ruoyi.project.system.controller.SysMenuController.add()','POST',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"visible\":\"0\",\"orderNum\":\"3\",\"menuName\":\"部门删除\",\"params\":{},\"parentId\":2017,\"createBy\":\"admin\",\"children\":[],\"isFrame\":\"1\",\"menuType\":\"F\",\"perms\":\"system:dept:remove\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2020-04-13 13:25:46'),
	(172,'菜单管理',1,'com.ruoyi.project.system.controller.SysMenuController.add()','POST',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"visible\":\"0\",\"orderNum\":\"4\",\"menuName\":\"部门修改\",\"params\":{},\"parentId\":2017,\"createBy\":\"admin\",\"children\":[],\"isFrame\":\"1\",\"menuType\":\"F\",\"perms\":\"system:dept:edit\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2020-04-13 13:26:07'),
	(173,'菜单管理',1,'com.ruoyi.project.system.controller.SysMenuController.add()','POST',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"visible\":\"0\",\"orderNum\":\"1\",\"menuName\":\"岗位查询\",\"params\":{},\"parentId\":2020,\"createBy\":\"admin\",\"children\":[],\"isFrame\":\"1\",\"menuType\":\"F\",\"perms\":\"system:post:query\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2020-04-13 13:27:13'),
	(174,'菜单管理',1,'com.ruoyi.project.system.controller.SysMenuController.add()','POST',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"visible\":\"0\",\"orderNum\":\"2\",\"menuName\":\"岗位新增\",\"params\":{},\"parentId\":2038,\"createBy\":\"admin\",\"children\":[],\"isFrame\":\"1\",\"menuType\":\"F\",\"perms\":\"system:post:add\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2020-04-13 13:27:33'),
	(175,'菜单管理',3,'com.ruoyi.project.system.controller.SysMenuController.remove()','DELETE',1,'admin',NULL,'/system/menu/2039','127.0.0.1','内网IP','{menuId=2039}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2020-04-13 13:27:40'),
	(176,'菜单管理',1,'com.ruoyi.project.system.controller.SysMenuController.add()','POST',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"visible\":\"0\",\"orderNum\":\"2\",\"menuName\":\"岗位新增\",\"params\":{},\"parentId\":2020,\"createBy\":\"admin\",\"children\":[],\"isFrame\":\"1\",\"menuType\":\"F\",\"perms\":\"system:post:add\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2020-04-13 13:27:59'),
	(177,'菜单管理',1,'com.ruoyi.project.system.controller.SysMenuController.add()','POST',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"visible\":\"0\",\"orderNum\":\"3\",\"menuName\":\"岗位修改\",\"params\":{},\"parentId\":2020,\"createBy\":\"admin\",\"children\":[],\"isFrame\":\"1\",\"menuType\":\"F\",\"perms\":\"system:post:edit\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2020-04-13 13:28:32'),
	(178,'菜单管理',1,'com.ruoyi.project.system.controller.SysMenuController.add()','POST',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"visible\":\"0\",\"orderNum\":\"3\",\"menuName\":\"岗位删除\",\"params\":{},\"parentId\":2020,\"createBy\":\"admin\",\"children\":[],\"isFrame\":\"1\",\"menuType\":\"F\",\"perms\":\"system:post:remove\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2020-04-13 13:28:56'),
	(179,'菜单管理',1,'com.ruoyi.project.system.controller.SysMenuController.add()','POST',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"visible\":\"0\",\"orderNum\":\"5\",\"menuName\":\"岗位导出\",\"params\":{},\"parentId\":2020,\"createBy\":\"admin\",\"children\":[],\"isFrame\":\"1\",\"menuType\":\"F\",\"perms\":\"system:post:export\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2020-04-13 13:29:20'),
	(180,'菜单管理',2,'com.ruoyi.project.system.controller.SysMenuController.edit()','PUT',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"visible\":\"0\",\"icon\":\"#\",\"orderNum\":\"4\",\"menuName\":\"岗位删除\",\"params\":{},\"parentId\":2020,\"path\":\"\",\"children\":[],\"createTime\":1586755736000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2042,\"menuType\":\"F\",\"perms\":\"system:post:remove\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2020-04-13 13:29:26'),
	(181,'菜单管理',2,'com.ruoyi.project.system.controller.SysMenuController.edit()','PUT',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"visible\":\"0\",\"icon\":\"tree\",\"orderNum\":\"5\",\"menuName\":\"岗位管理\",\"params\":{},\"parentId\":2000,\"path\":\"post\",\"component\":\"system/post/index\",\"children\":[],\"createTime\":1586741383000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2020,\"menuType\":\"C\",\"perms\":\"system:post:list\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2020-04-13 13:30:28'),
	(182,'菜单管理',2,'com.ruoyi.project.system.controller.SysMenuController.edit()','PUT',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"visible\":\"0\",\"icon\":\"tree\",\"orderNum\":\"4\",\"menuName\":\"角色管理\",\"params\":{},\"parentId\":2000,\"path\":\"role\",\"component\":\"system/role/index\",\"children\":[],\"createTime\":1586741293000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2019,\"menuType\":\"C\",\"perms\":\"system:role:list\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2020-04-13 13:30:42'),
	(183,'菜单管理',2,'com.ruoyi.project.system.controller.SysMenuController.edit()','PUT',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"visible\":\"0\",\"icon\":\"tree\",\"orderNum\":\"3\",\"menuName\":\"部门管理\",\"params\":{},\"parentId\":2000,\"path\":\"department\",\"component\":\"system/department/index\",\"children\":[],\"createTime\":1586740331000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2017,\"menuType\":\"C\",\"perms\":\"system:department:list\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2020-04-13 13:30:58'),
	(184,'菜单管理',2,'com.ruoyi.project.system.controller.SysMenuController.edit()','PUT',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"visible\":\"0\",\"icon\":\"tree\",\"orderNum\":\"5\",\"menuName\":\"岗位管理\",\"params\":{},\"parentId\":2000,\"path\":\"post\",\"component\":\"system/post/index\",\"children\":[],\"createTime\":1586741383000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2020,\"menuType\":\"C\",\"perms\":\"system:post:list\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2020-04-13 13:33:00'),
	(185,'菜单管理',2,'com.ruoyi.project.system.controller.SysMenuController.edit()','PUT',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"visible\":\"0\",\"icon\":\"tree\",\"orderNum\":\"5\",\"menuName\":\"岗位管理\",\"params\":{},\"parentId\":2000,\"path\":\"post\",\"component\":\"system/post/index\",\"children\":[],\"createTime\":1586741383000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2020,\"menuType\":\"C\",\"perms\":\"system:post:list\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2020-04-13 13:33:00'),
	(186,'菜单管理',2,'com.ruoyi.project.system.controller.SysMenuController.edit()','PUT',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"visible\":\"0\",\"icon\":\"tree\",\"orderNum\":\"3\",\"menuName\":\"部门管理\",\"params\":{},\"parentId\":2000,\"path\":\"dept\",\"component\":\"system/dept/index\",\"children\":[],\"createTime\":1586740331000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2017,\"menuType\":\"C\",\"perms\":\"system:dept:list\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2020-04-13 13:34:22'),
	(187,'部门管理',2,'com.ruoyi.project.system.controller.SysDeptController.edit()','PUT',1,'admin',NULL,'/system/dept','127.0.0.1','内网IP','{\"deptName\":\"上海技术物理研究所第二研究室光谱成像组\",\"leader\":\"刘银年\",\"deptId\":100,\"orderNum\":\"0\",\"delFlag\":\"0\",\"params\":{},\"parentId\":0,\"createBy\":\"admin\",\"children\":[],\"createTime\":1521171180000,\"phone\":\"15888888888\",\"updateBy\":\"admin\",\"ancestors\":\"0\",\"email\":\"\",\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2020-04-14 11:22:02'),
	(188,'部门管理',1,'com.ruoyi.project.system.controller.SysDeptController.add()','POST',1,'admin',NULL,'/system/dept','127.0.0.1','内网IP','{\"deptName\":\"课题组\",\"orderNum\":\"1\",\"params\":{},\"parentId\":100,\"createBy\":\"admin\",\"children\":[],\"ancestors\":\"0,100\",\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2020-04-14 11:26:16'),
	(189,'部门管理',1,'com.ruoyi.project.system.controller.SysDeptController.add()','POST',1,'admin',NULL,'/system/dept','127.0.0.1','内网IP','{\"deptName\":\"考核工作组\",\"orderNum\":\"2\",\"params\":{},\"parentId\":100,\"createBy\":\"admin\",\"children\":[],\"ancestors\":\"0,100\",\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2020-04-14 12:55:37'),
	(190,'部门管理',1,'com.ruoyi.project.system.controller.SysDeptController.add()','POST',1,'admin',NULL,'/system/dept','127.0.0.1','内网IP','{\"deptName\":\"科研行政保障组\",\"orderNum\":\"3\",\"params\":{},\"parentId\":100,\"createBy\":\"admin\",\"children\":[],\"ancestors\":\"0,100\",\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2020-04-14 12:56:06'),
	(191,'部门管理',1,'com.ruoyi.project.system.controller.SysDeptController.add()','POST',1,'admin',NULL,'/system/dept','127.0.0.1','内网IP','{\"deptName\":\"产品保障组\",\"orderNum\":\"1\",\"params\":{},\"parentId\":202,\"createBy\":\"admin\",\"children\":[],\"ancestors\":\"0,100,202\",\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2020-04-14 12:56:23'),
	(192,'部门管理',1,'com.ruoyi.project.system.controller.SysDeptController.add()','POST',1,'admin',NULL,'/system/dept','127.0.0.1','内网IP','{\"deptName\":\"财务保障组\",\"orderNum\":\"2\",\"params\":{},\"parentId\":202,\"createBy\":\"admin\",\"children\":[],\"ancestors\":\"0,100,202\",\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2020-04-14 12:56:49'),
	(193,'部门管理',1,'com.ruoyi.project.system.controller.SysDeptController.add()','POST',1,'admin',NULL,'/system/dept','127.0.0.1','内网IP','{\"deptName\":\"行政保障组\",\"orderNum\":\"3\",\"params\":{},\"parentId\":202,\"createBy\":\"admin\",\"children\":[],\"ancestors\":\"0,100,202\",\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2020-04-14 12:57:01'),
	(194,'部门管理',1,'com.ruoyi.project.system.controller.SysDeptController.add()','POST',1,'admin',NULL,'/system/dept','127.0.0.1','内网IP','{\"deptName\":\"专业技术组\",\"orderNum\":\"4\",\"params\":{},\"parentId\":100,\"createBy\":\"admin\",\"children\":[],\"ancestors\":\"0,100\",\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2020-04-14 12:57:20'),
	(195,'部门管理',1,'com.ruoyi.project.system.controller.SysDeptController.add()','POST',1,'admin',NULL,'/system/dept','127.0.0.1','内网IP','{\"deptName\":\"光学组\",\"orderNum\":\"1\",\"params\":{},\"parentId\":206,\"createBy\":\"admin\",\"children\":[],\"ancestors\":\"0,100,206\",\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2020-04-14 12:57:39'),
	(196,'部门管理',1,'com.ruoyi.project.system.controller.SysDeptController.add()','POST',1,'admin',NULL,'/system/dept','127.0.0.1','内网IP','{\"deptName\":\"机械结构一组\",\"orderNum\":\"2\",\"params\":{},\"parentId\":206,\"createBy\":\"admin\",\"children\":[],\"ancestors\":\"0,100,206\",\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2020-04-14 12:58:01'),
	(197,'部门管理',1,'com.ruoyi.project.system.controller.SysDeptController.add()','POST',1,'admin',NULL,'/system/dept','127.0.0.1','内网IP','{\"deptName\":\"机械结构二组\",\"orderNum\":\"3\",\"params\":{},\"parentId\":206,\"createBy\":\"admin\",\"children\":[],\"ancestors\":\"0,100,206\",\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2020-04-14 12:58:13'),
	(198,'部门管理',1,'com.ruoyi.project.system.controller.SysDeptController.add()','POST',1,'admin',NULL,'/system/dept','127.0.0.1','内网IP','{\"deptName\":\"电子学组\",\"orderNum\":\"4\",\"params\":{},\"parentId\":206,\"createBy\":\"admin\",\"children\":[],\"ancestors\":\"0,100,206\",\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2020-04-14 12:58:34'),
	(199,'部门管理',1,'com.ruoyi.project.system.controller.SysDeptController.add()','POST',1,'admin',NULL,'/system/dept','127.0.0.1','内网IP','{\"deptName\":\"定标处理软件组\",\"orderNum\":\"5\",\"params\":{},\"parentId\":206,\"createBy\":\"admin\",\"children\":[],\"ancestors\":\"0,100,206\",\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2020-04-14 12:58:56'),
	(200,'部门管理',1,'com.ruoyi.project.system.controller.SysDeptController.add()','POST',1,'admin',NULL,'/system/dept','127.0.0.1','内网IP','{\"deptName\":\"光学设计组\",\"orderNum\":\"1\",\"params\":{},\"parentId\":207,\"createBy\":\"admin\",\"children\":[],\"ancestors\":\"0,100,206,207\",\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2020-04-14 12:59:28'),
	(201,'部门管理',1,'com.ruoyi.project.system.controller.SysDeptController.add()','POST',1,'admin',NULL,'/system/dept','127.0.0.1','内网IP','{\"deptName\":\"光学装校组\",\"orderNum\":\"2\",\"params\":{},\"parentId\":207,\"createBy\":\"admin\",\"children\":[],\"ancestors\":\"0,100,206,207\",\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2020-04-14 12:59:49'),
	(202,'部门管理',1,'com.ruoyi.project.system.controller.SysDeptController.add()','POST',1,'admin',NULL,'/system/dept','127.0.0.1','内网IP','{\"deptName\":\"结构一组\",\"orderNum\":\"1\",\"params\":{},\"parentId\":208,\"createBy\":\"admin\",\"children\":[],\"ancestors\":\"0,100,206,208\",\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2020-04-14 13:00:02'),
	(203,'部门管理',1,'com.ruoyi.project.system.controller.SysDeptController.add()','POST',1,'admin',NULL,'/system/dept','127.0.0.1','内网IP','{\"deptName\":\"结构二组\",\"orderNum\":\"2\",\"params\":{},\"parentId\":208,\"createBy\":\"admin\",\"children\":[],\"ancestors\":\"0,100,206,208\",\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2020-04-14 13:00:12'),
	(204,'部门管理',1,'com.ruoyi.project.system.controller.SysDeptController.add()','POST',1,'admin',NULL,'/system/dept','127.0.0.1','内网IP','{\"deptName\":\"结构一组\",\"orderNum\":\"1\",\"params\":{},\"parentId\":209,\"createBy\":\"admin\",\"children\":[],\"ancestors\":\"0,100,206,209\",\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2020-04-14 13:00:24'),
	(205,'部门管理',1,'com.ruoyi.project.system.controller.SysDeptController.add()','POST',1,'admin',NULL,'/system/dept','127.0.0.1','内网IP','{\"deptName\":\"机构二组\",\"orderNum\":\"2\",\"params\":{},\"parentId\":209,\"createBy\":\"admin\",\"children\":[],\"ancestors\":\"0,100,206,209\",\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2020-04-14 13:00:41'),
	(206,'部门管理',2,'com.ruoyi.project.system.controller.SysDeptController.edit()','PUT',1,'admin',NULL,'/system/dept','127.0.0.1','内网IP','{\"deptName\":\"机构二组\",\"deptId\":215,\"orderNum\":\"2\",\"delFlag\":\"0\",\"params\":{},\"parentId\":208,\"createBy\":\"admin\",\"children\":[],\"createTime\":1586840412000,\"updateBy\":\"admin\",\"ancestors\":\"0,100,206,208\",\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2020-04-14 13:00:48'),
	(207,'部门管理',1,'com.ruoyi.project.system.controller.SysDeptController.add()','POST',1,'admin',NULL,'/system/dept','127.0.0.1','内网IP','{\"deptName\":\"信息获取组\",\"orderNum\":\"1\",\"params\":{},\"parentId\":210,\"createBy\":\"admin\",\"children\":[],\"ancestors\":\"0,100,206,210\",\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2020-04-14 13:01:03'),
	(208,'部门管理',1,'com.ruoyi.project.system.controller.SysDeptController.add()','POST',1,'admin',NULL,'/system/dept','127.0.0.1','内网IP','{\"deptName\":\"信息处理组\",\"orderNum\":\"2\",\"params\":{},\"parentId\":210,\"createBy\":\"admin\",\"children\":[],\"ancestors\":\"0,100,206,210\",\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2020-04-14 13:01:17'),
	(209,'部门管理',1,'com.ruoyi.project.system.controller.SysDeptController.add()','POST',1,'admin',NULL,'/system/dept','127.0.0.1','内网IP','{\"deptName\":\"遥测遥控组\",\"orderNum\":\"3\",\"params\":{},\"parentId\":210,\"createBy\":\"admin\",\"children\":[],\"ancestors\":\"0,100,206,210\",\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2020-04-14 13:01:35'),
	(210,'部门管理',1,'com.ruoyi.project.system.controller.SysDeptController.add()','POST',1,'admin',NULL,'/system/dept','127.0.0.1','内网IP','{\"deptName\":\"伺服控制组\",\"orderNum\":\"4\",\"params\":{},\"parentId\":210,\"createBy\":\"admin\",\"children\":[],\"ancestors\":\"0,100,206,210\",\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2020-04-14 13:02:04'),
	(211,'部门管理',1,'com.ruoyi.project.system.controller.SysDeptController.add()','POST',1,'admin',NULL,'/system/dept','127.0.0.1','内网IP','{\"deptName\":\"定标测试组\",\"orderNum\":\"1\",\"params\":{},\"parentId\":211,\"createBy\":\"admin\",\"children\":[],\"ancestors\":\"0,100,206,211\",\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2020-04-14 13:02:23'),
	(212,'部门管理',1,'com.ruoyi.project.system.controller.SysDeptController.add()','POST',1,'admin',NULL,'/system/dept','127.0.0.1','内网IP','{\"deptName\":\"数据处理组\",\"orderNum\":\"2\",\"params\":{},\"parentId\":211,\"createBy\":\"admin\",\"children\":[],\"ancestors\":\"0,100,206,211\",\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2020-04-14 13:02:39'),
	(213,'部门管理',1,'com.ruoyi.project.system.controller.SysDeptController.add()','POST',1,'admin',NULL,'/system/dept','127.0.0.1','内网IP','{\"deptName\":\"应用软件组\",\"orderNum\":\"3\",\"params\":{},\"parentId\":211,\"createBy\":\"admin\",\"children\":[],\"ancestors\":\"0,100,206,211\",\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2020-04-14 13:02:54'),
	(214,'部门管理',1,'com.ruoyi.project.system.controller.SysDeptController.add()','POST',1,'admin',NULL,'/system/dept','127.0.0.1','内网IP','{\"deptName\":\"基础成功组\",\"orderNum\":\"5\",\"params\":{},\"parentId\":100,\"createBy\":\"admin\",\"children\":[],\"ancestors\":\"0,100\",\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2020-04-14 13:03:19'),
	(215,'部门管理',3,'com.ruoyi.project.system.controller.SysDeptController.remove()','DELETE',1,'admin',NULL,'/system/dept/102','127.0.0.1','内网IP','{deptId=102}','{\"msg\":\"存在下级部门,不允许删除\",\"code\":500}',0,NULL,'2020-04-14 13:03:34'),
	(216,'部门管理',3,'com.ruoyi.project.system.controller.SysDeptController.remove()','DELETE',1,'admin',NULL,'/system/dept/108','127.0.0.1','内网IP','{deptId=108}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2020-04-14 13:03:40'),
	(217,'部门管理',3,'com.ruoyi.project.system.controller.SysDeptController.remove()','DELETE',1,'admin',NULL,'/system/dept/109','127.0.0.1','内网IP','{deptId=109}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2020-04-14 13:03:43'),
	(218,'部门管理',3,'com.ruoyi.project.system.controller.SysDeptController.remove()','DELETE',1,'admin',NULL,'/system/dept/102','127.0.0.1','内网IP','{deptId=102}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2020-04-14 13:03:45'),
	(219,'部门管理',3,'com.ruoyi.project.system.controller.SysDeptController.remove()','DELETE',1,'admin',NULL,'/system/dept/107','127.0.0.1','内网IP','{deptId=107}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2020-04-14 13:03:49'),
	(220,'部门管理',3,'com.ruoyi.project.system.controller.SysDeptController.remove()','DELETE',1,'admin',NULL,'/system/dept/106','127.0.0.1','内网IP','{deptId=106}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2020-04-14 13:03:52'),
	(221,'部门管理',3,'com.ruoyi.project.system.controller.SysDeptController.remove()','DELETE',1,'admin',NULL,'/system/dept/105','127.0.0.1','内网IP','{deptId=105}','{\"msg\":\"部门存在用户,不允许删除\",\"code\":500}',0,NULL,'2020-04-14 13:03:57'),
	(222,'部门管理',2,'com.ruoyi.project.system.controller.SysDeptController.edit()','PUT',1,'admin',NULL,'/system/dept','127.0.0.1','内网IP','{\"deptName\":\"集成测试组\",\"leader\":\"\",\"deptId\":101,\"orderNum\":\"1\",\"delFlag\":\"0\",\"params\":{},\"parentId\":100,\"createBy\":\"admin\",\"children\":[],\"createTime\":1521171180000,\"phone\":\"15888888888\",\"updateBy\":\"admin\",\"ancestors\":\"0,100\",\"email\":\"\",\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2020-04-14 13:04:52'),
	(223,'部门管理',3,'com.ruoyi.project.system.controller.SysDeptController.remove()','DELETE',1,'admin',NULL,'/system/dept/104','127.0.0.1','内网IP','{deptId=104}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2020-04-14 13:05:05'),
	(224,'部门管理',2,'com.ruoyi.project.system.controller.SysDeptController.edit()','PUT',1,'admin',NULL,'/system/dept','127.0.0.1','内网IP','{\"deptName\":\"集成装配组\",\"leader\":\"\",\"deptId\":103,\"orderNum\":\"1\",\"delFlag\":\"0\",\"params\":{},\"parentId\":101,\"createBy\":\"admin\",\"children\":[],\"createTime\":1521171180000,\"phone\":\"\",\"updateBy\":\"admin\",\"ancestors\":\"0,100,101\",\"email\":\"\",\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2020-04-14 13:05:26'),
	(225,'部门管理',2,'com.ruoyi.project.system.controller.SysDeptController.edit()','PUT',1,'admin',NULL,'/system/dept','127.0.0.1','内网IP','{\"deptName\":\"综合测试组\",\"leader\":\"\",\"deptId\":105,\"orderNum\":\"3\",\"delFlag\":\"0\",\"params\":{},\"parentId\":101,\"createBy\":\"admin\",\"children\":[],\"createTime\":1521171180000,\"phone\":\"15888888888\",\"updateBy\":\"admin\",\"ancestors\":\"0,100,101\",\"email\":\"\",\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2020-04-14 13:05:43'),
	(226,'部门管理',2,'com.ruoyi.project.system.controller.SysDeptController.edit()','PUT',1,'admin',NULL,'/system/dept','127.0.0.1','内网IP','{\"deptName\":\"集成测试组\",\"leader\":\"\",\"deptId\":101,\"orderNum\":\"7\",\"delFlag\":\"0\",\"params\":{},\"parentId\":100,\"createBy\":\"admin\",\"children\":[],\"createTime\":1521171180000,\"phone\":\"15888888888\",\"updateBy\":\"admin\",\"ancestors\":\"0,100\",\"email\":\"\",\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2020-04-14 13:06:17'),
	(227,'部门管理',2,'com.ruoyi.project.system.controller.SysDeptController.edit()','PUT',1,'admin',NULL,'/system/dept','127.0.0.1','内网IP','{\"deptName\":\"综合测试组\",\"leader\":\"\",\"deptId\":105,\"orderNum\":\"2\",\"delFlag\":\"0\",\"params\":{},\"parentId\":101,\"createBy\":\"admin\",\"children\":[],\"createTime\":1521171180000,\"phone\":\"15888888888\",\"updateBy\":\"admin\",\"ancestors\":\"0,100,101\",\"email\":\"\",\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2020-04-14 13:06:24'),
	(228,'部门管理',1,'com.ruoyi.project.system.controller.SysDeptController.add()','POST',1,'admin',NULL,'/system/dept','127.0.0.1','内网IP','{\"deptName\":\"规划论证\",\"orderNum\":\"1\",\"params\":{},\"parentId\":225,\"createBy\":\"admin\",\"children\":[],\"ancestors\":\"0,100,225\",\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2020-04-14 13:06:43'),
	(229,'部门管理',1,'com.ruoyi.project.system.controller.SysDeptController.add()','POST',1,'admin',NULL,'/system/dept','127.0.0.1','内网IP','{\"deptName\":\"基础前沿\",\"orderNum\":\"2\",\"params\":{},\"parentId\":225,\"createBy\":\"admin\",\"children\":[],\"ancestors\":\"0,100,225\",\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2020-04-14 13:06:59'),
	(230,'部门管理',1,'com.ruoyi.project.system.controller.SysDeptController.add()','POST',1,'admin',NULL,'/system/dept','127.0.0.1','内网IP','{\"deptName\":\"知识产权及研究生教育\",\"orderNum\":\"4\",\"params\":{},\"parentId\":225,\"createBy\":\"admin\",\"children\":[],\"ancestors\":\"0,100,225\",\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2020-04-14 13:07:20'),
	(231,'部门管理',2,'com.ruoyi.project.system.controller.SysDeptController.edit()','PUT',1,'admin',NULL,'/system/dept','127.0.0.1','内网IP','{\"deptName\":\"知识产权及研究生教育\",\"deptId\":228,\"orderNum\":\"3\",\"delFlag\":\"0\",\"params\":{},\"parentId\":225,\"createBy\":\"admin\",\"children\":[],\"createTime\":1586840840000,\"updateBy\":\"admin\",\"ancestors\":\"0,100,225\",\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2020-04-14 13:07:26'),
	(232,'用户管理',3,'com.ruoyi.project.system.controller.SysUserController.remove()','DELETE',1,'admin',NULL,'/system/user/2','127.0.0.1','内网IP','{userIds=2}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2020-04-14 13:08:45'),
	(233,'用户管理',1,'com.ruoyi.project.system.controller.SysUserController.add()','POST',1,'admin',NULL,'/system/user','127.0.0.1','内网IP','{\"phonenumber\":\"15888888888\",\"admin\":false,\"password\":\"123456\",\"postIds\":[2],\"email\":\"15888888888@163.com\",\"nickName\":\"罗霄\",\"params\":{},\"userName\":\"罗霄\",\"roleIds\":[2],\"status\":\"0\"}','{\"msg\":\"新增用户\'罗霄\'失败，手机号码已存在\",\"code\":500}',0,NULL,'2020-04-14 13:09:42'),
	(234,'用户管理',1,'com.ruoyi.project.system.controller.SysUserController.add()','POST',1,'admin',NULL,'/system/user','127.0.0.1','内网IP','{\"phonenumber\":\"15888888889\",\"admin\":false,\"password\":\"$2a$10$yDJmtyYVsk2oKb6cK5s5DOfV63TjCF1JTf93dNo.5KWK4JvIIocrK\",\"postIds\":[2],\"email\":\"15888888888@163.com\",\"nickName\":\"罗霄\",\"params\":{},\"userName\":\"罗霄\",\"userId\":101,\"createBy\":\"admin\",\"roleIds\":[2],\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2020-04-14 13:09:49'),
	(235,'角色管理',1,'com.ruoyi.project.system.controller.SysRoleController.add()','POST',1,'admin',NULL,'/system/role','127.0.0.1','内网IP','{\"flag\":false,\"roleId\":100,\"admin\":false,\"params\":{},\"roleSort\":\"3\",\"createBy\":\"admin\",\"roleKey\":\"manager\",\"roleName\":\"项目主任\",\"deptIds\":[],\"menuIds\":[2000,2018,2021,2022,2023,2025,2026,2027,2028,2016,2017,2034,2035,2036,2037,2019,2029,2030,2031,2032,2033,2020,2038,2040,2041,2042,2043,2001,2002,2003,2004,2005,2006,2007,2008,2009,2010,2011,2012,2013,2014,2015],\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2020-04-14 13:12:10'),
	(236,'用户管理',2,'com.ruoyi.project.system.controller.SysUserController.edit()','PUT',1,'admin',NULL,'/system/user','127.0.0.1','内网IP','{\"roles\":[{\"flag\":false,\"roleId\":2,\"admin\":false,\"dataScope\":\"2\",\"params\":{},\"roleSort\":\"2\",\"roleKey\":\"common\",\"roleName\":\"普通角色\",\"status\":\"0\"}],\"phonenumber\":\"15888888889\",\"admin\":false,\"delFlag\":\"0\",\"password\":\"\",\"updateBy\":\"admin\",\"postIds\":[2],\"loginIp\":\"\",\"email\":\"15888888888@163.com\",\"nickName\":\"罗霄\",\"sex\":\"0\",\"avatar\":\"\",\"params\":{},\"userName\":\"罗霄\",\"userId\":101,\"createBy\":\"admin\",\"roleIds\":[100],\"createTime\":1586840989000,\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2020-04-14 13:12:25'),
	(237,'用户管理',2,'com.ruoyi.project.system.controller.SysUserController.edit()','PUT',1,'罗霄',NULL,'/system/user','127.0.0.1','内网IP','{\"roles\":[{\"flag\":false,\"roleId\":1,\"admin\":true,\"dataScope\":\"1\",\"params\":{},\"roleSort\":\"1\",\"roleKey\":\"admin\",\"roleName\":\"管理员\",\"status\":\"0\"}],\"phonenumber\":\"15888888888\",\"admin\":true,\"loginDate\":1521171180000,\"remark\":\"管理员\",\"delFlag\":\"0\",\"password\":\"\",\"postIds\":[1],\"loginIp\":\"127.0.0.1\",\"email\":\"ry@163.com\",\"nickName\":\"若依\",\"sex\":\"1\",\"deptId\":100,\"avatar\":\"\",\"dept\":{\"deptName\":\"集成装配组\",\"leader\":\"\",\"deptId\":103,\"orderNum\":\"1\",\"params\":{},\"parentId\":101,\"children\":[],\"status\":\"0\"},\"params\":{},\"userName\":\"admin\",\"userId\":1,\"createBy\":\"admin\",\"roleIds\":[1],\"createTime\":1521171180000,\"status\":\"0\"}','null',1,'不允许操作超级管理员用户','2020-04-14 13:13:13'),
	(238,'用户管理',2,'com.ruoyi.project.system.controller.SysUserController.edit()','PUT',1,'罗霄',NULL,'/system/user','127.0.0.1','内网IP','{\"roles\":[{\"flag\":false,\"roleId\":100,\"admin\":false,\"dataScope\":\"1\",\"params\":{},\"roleSort\":\"3\",\"roleKey\":\"manager\",\"roleName\":\"项目主任\",\"status\":\"0\"}],\"phonenumber\":\"15888888889\",\"admin\":false,\"delFlag\":\"0\",\"password\":\"\",\"updateBy\":\"罗霄\",\"postIds\":[2],\"loginIp\":\"\",\"email\":\"15888888888@163.com\",\"nickName\":\"罗霄\",\"sex\":\"0\",\"deptId\":200,\"avatar\":\"\",\"params\":{},\"userName\":\"罗霄\",\"userId\":101,\"createBy\":\"admin\",\"roleIds\":[100],\"createTime\":1586840989000,\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2020-04-14 13:13:25'),
	(239,'用户管理',5,'com.ruoyi.project.system.controller.SysUserController.export()','GET',1,'admin',NULL,'/system/user/export','127.0.0.1','内网IP','{}','{\"msg\":\"2ea3aff9-39b6-40d6-9bb0-27e637804448_用户数据.xlsx\",\"code\":200}',0,NULL,'2020-04-16 10:09:30'),
	(240,'菜单管理',1,'com.ruoyi.project.system.controller.SysMenuController.add()','POST',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"visible\":\"0\",\"icon\":\"404\",\"orderNum\":\"44\",\"menuName\":\"无法到达\",\"params\":{},\"parentId\":0,\"path\":\"no_way\",\"createBy\":\"admin\",\"children\":[],\"isFrame\":\"1\",\"menuType\":\"M\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2020-04-16 10:39:08'),
	(241,'菜单管理',2,'com.ruoyi.project.system.controller.SysMenuController.edit()','PUT',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"visible\":\"0\",\"icon\":\"404\",\"orderNum\":\"44\",\"menuName\":\"无法到达\",\"params\":{},\"parentId\":0,\"path\":\"noway\",\"children\":[],\"createTime\":1587004748000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2044,\"menuType\":\"M\",\"perms\":\"\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2020-04-16 10:40:06'),
	(242,'菜单管理',1,'com.ruoyi.project.system.controller.SysMenuController.add()','POST',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"visible\":\"0\",\"icon\":\"404\",\"orderNum\":\"1\",\"menuName\":\"管理1\",\"params\":{},\"parentId\":2044,\"path\":\"manage\",\"component\":\"noway/mange/list\",\"createBy\":\"admin\",\"children\":[],\"isFrame\":\"1\",\"menuType\":\"C\",\"perms\":\"noway:mange:list\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2020-04-16 10:40:54'),
	(243,'菜单管理',2,'com.ruoyi.project.system.controller.SysMenuController.edit()','PUT',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"visible\":\"0\",\"icon\":\"404\",\"orderNum\":\"1\",\"menuName\":\"管理1\",\"params\":{},\"parentId\":2044,\"path\":\"manage\",\"component\":\"noway/mange/index\",\"children\":[],\"createTime\":1587004853000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2045,\"menuType\":\"C\",\"perms\":\"noway:mange:list\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2020-04-16 10:41:11'),
	(244,'菜单管理',3,'com.ruoyi.project.system.controller.SysMenuController.remove()','DELETE',1,'admin',NULL,'/system/menu/2045','127.0.0.1','内网IP','{menuId=2045}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2020-04-16 11:44:11'),
	(245,'菜单管理',3,'com.ruoyi.project.system.controller.SysMenuController.remove()','DELETE',1,'admin',NULL,'/system/menu/2044','127.0.0.1','内网IP','{menuId=2044}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2020-04-16 11:44:13'),
	(246,'用户管理',1,'com.ruoyi.project.system.controller.SysUserController.add()','POST',1,'admin',NULL,'/system/user','127.0.0.1','内网IP','{\"birthday\":654537600000,\"phonenumber\":\"15365483098\",\"admin\":false,\"remark\":\"测试\",\"leaderId\":101,\"password\":\"$2a$10$L23ccyanNM6kX3yslULdjOq1IQDGT5TEQi1fIFWKepBCK65QZsYmy\",\"postIds\":[4],\"email\":\"15365483098@163.com\",\"nickName\":\"陆志峰\",\"sex\":\"0\",\"deptId\":224,\"identityCard\":\"XXXXXXXXXXXXX\",\"params\":{},\"userName\":\"陆志峰\",\"userId\":102,\"workAddress\":\"南通\",\"createBy\":\"admin\",\"roleIds\":[2],\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2020-04-16 15:34:24'),
	(247,'用户管理',2,'com.ruoyi.project.system.controller.SysUserController.edit()','PUT',1,'admin',NULL,'/system/user','127.0.0.1','内网IP','{\"birthday\":652978800000,\"roles\":[{\"flag\":false,\"roleId\":2,\"admin\":false,\"dataScope\":\"2\",\"params\":{},\"roleSort\":\"2\",\"roleKey\":\"common\",\"roleName\":\"普通角色\",\"status\":\"0\"}],\"phonenumber\":\"15365483098\",\"admin\":false,\"remark\":\"测试\",\"delFlag\":\"0\",\"leaderId\":101,\"password\":\"\",\"updateBy\":\"admin\",\"postIds\":[4],\"loginIp\":\"\",\"email\":\"15365483098@163.com\",\"nickName\":\"陆志峰\",\"sex\":\"0\",\"deptId\":224,\"avatar\":\"\",\"dept\":{\"deptName\":\"应用软件组\",\"deptId\":224,\"orderNum\":\"3\",\"params\":{},\"parentId\":211,\"children\":[],\"status\":\"0\"},\"identityCard\":\"XXXXXXXXXXXXX111\",\"params\":{},\"userName\":\"陆志峰\",\"userId\":102,\"workAddress\":\"上海\",\"createBy\":\"admin\",\"roleIds\":[2],\"createTime\":1587022464000,\"leaderName\":\"罗霄\",\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2020-04-16 15:35:44'),
	(248,'用户管理',2,'com.ruoyi.project.system.controller.SysUserController.edit()','PUT',1,'admin',NULL,'/system/user','127.0.0.1','内网IP','{\"birthday\":652978800000,\"roles\":[{\"flag\":false,\"roleId\":2,\"admin\":false,\"dataScope\":\"2\",\"params\":{},\"roleSort\":\"2\",\"roleKey\":\"common\",\"roleName\":\"普通角色\",\"status\":\"0\"}],\"phonenumber\":\"15365483098\",\"admin\":false,\"remark\":\"测试\",\"delFlag\":\"0\",\"leaderId\":1,\"password\":\"\",\"updateBy\":\"admin\",\"postIds\":[4],\"loginIp\":\"\",\"email\":\"15365483098@163.com\",\"nickName\":\"陆志峰\",\"sex\":\"0\",\"deptId\":224,\"avatar\":\"\",\"dept\":{\"deptName\":\"应用软件组\",\"deptId\":224,\"orderNum\":\"3\",\"params\":{},\"parentId\":211,\"children\":[],\"status\":\"0\"},\"identityCard\":\"XXXXXXXXXXXXX111\",\"params\":{},\"userName\":\"陆志峰\",\"userId\":102,\"workAddress\":\"上海\",\"createBy\":\"admin\",\"roleIds\":[2],\"createTime\":1587022464000,\"leaderName\":\"罗霄\",\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2020-04-16 15:36:02'),
	(249,'用户管理',6,'com.ruoyi.project.system.controller.SysUserController.importData()','POST',1,'admin',NULL,'/system/user/importData','127.0.0.1','内网IP','true','null',1,'','2020-04-16 15:48:32'),
	(250,'菜单管理',1,'com.ruoyi.project.system.controller.SysMenuController.add()','POST',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"visible\":\"0\",\"icon\":\"chart\",\"orderNum\":\"1\",\"menuName\":\"评定申请\",\"params\":{},\"parentId\":2012,\"path\":\"application\",\"component\":\"performance/application/index\",\"createBy\":\"admin\",\"children\":[],\"isFrame\":\"1\",\"menuType\":\"C\",\"perms\":\"performance:application:list\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2020-04-16 16:01:17'),
	(251,'菜单管理',1,'com.ruoyi.project.system.controller.SysMenuController.add()','POST',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"visible\":\"0\",\"orderNum\":\"1\",\"menuName\":\"添加\",\"params\":{},\"parentId\":2046,\"createBy\":\"admin\",\"children\":[],\"isFrame\":\"1\",\"menuType\":\"F\",\"perms\":\"performance:application:add\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2020-04-16 16:01:58'),
	(252,'菜单管理',1,'com.ruoyi.project.system.controller.SysMenuController.add()','POST',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"visible\":\"0\",\"orderNum\":\"2\",\"menuName\":\"查询\",\"params\":{},\"parentId\":2046,\"createBy\":\"admin\",\"children\":[],\"isFrame\":\"1\",\"menuType\":\"F\",\"perms\":\"performance:application:query\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2020-04-16 16:02:20'),
	(253,'菜单管理',1,'com.ruoyi.project.system.controller.SysMenuController.add()','POST',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"visible\":\"0\",\"orderNum\":\"3\",\"menuName\":\"修改\",\"params\":{},\"parentId\":2046,\"createBy\":\"admin\",\"children\":[],\"isFrame\":\"1\",\"menuType\":\"F\",\"perms\":\"performance:application:update\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2020-04-16 16:02:46'),
	(254,'菜单管理',1,'com.ruoyi.project.system.controller.SysMenuController.add()','POST',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"visible\":\"0\",\"orderNum\":\"4\",\"menuName\":\"删除\",\"params\":{},\"parentId\":2046,\"createBy\":\"admin\",\"children\":[],\"isFrame\":\"1\",\"menuType\":\"F\",\"perms\":\"performance:application:remove\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2020-04-16 16:03:10'),
	(255,'菜单管理',1,'com.ruoyi.project.system.controller.SysMenuController.add()','POST',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"visible\":\"0\",\"orderNum\":\"5\",\"menuName\":\"分发\",\"params\":{},\"parentId\":2046,\"createBy\":\"admin\",\"children\":[],\"isFrame\":\"1\",\"menuType\":\"F\",\"perms\":\"performance:application:distribution\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2020-04-16 16:03:27'),
	(256,'菜单管理',1,'com.ruoyi.project.system.controller.SysMenuController.add()','POST',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"visible\":\"0\",\"icon\":\"chart\",\"orderNum\":\"2\",\"menuName\":\"评定审判\",\"params\":{},\"parentId\":2012,\"path\":\"evaluate\",\"component\":\"performance/evaluate/index\",\"createBy\":\"admin\",\"children\":[],\"isFrame\":\"1\",\"menuType\":\"C\",\"perms\":\"performance:evaluate:list\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2020-04-16 16:04:14'),
	(257,'菜单管理',1,'com.ruoyi.project.system.controller.SysMenuController.add()','POST',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"visible\":\"0\",\"orderNum\":\"1\",\"menuName\":\"查询\",\"params\":{},\"parentId\":2052,\"createBy\":\"admin\",\"children\":[],\"isFrame\":\"1\",\"menuType\":\"F\",\"perms\":\"performance:evaluate:query\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2020-04-16 16:04:39'),
	(258,'菜单管理',1,'com.ruoyi.project.system.controller.SysMenuController.add()','POST',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"visible\":\"0\",\"orderNum\":\"2\",\"menuName\":\"修改\",\"params\":{},\"parentId\":2052,\"createBy\":\"admin\",\"children\":[],\"isFrame\":\"1\",\"menuType\":\"F\",\"perms\":\"performance:evaluate:update\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2020-04-16 16:04:59'),
	(259,'菜单管理',1,'com.ruoyi.project.system.controller.SysMenuController.add()','POST',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"visible\":\"0\",\"icon\":\"chart\",\"orderNum\":\"3\",\"menuName\":\"评定结果\",\"params\":{},\"parentId\":2012,\"path\":\"result\",\"component\":\"performance/result/index\",\"createBy\":\"admin\",\"children\":[],\"isFrame\":\"1\",\"menuType\":\"C\",\"perms\":\"performance:result:list\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2020-04-16 16:05:40'),
	(260,'菜单管理',1,'com.ruoyi.project.system.controller.SysMenuController.add()','POST',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"visible\":\"0\",\"orderNum\":\"1\",\"menuName\":\"查询\",\"params\":{},\"parentId\":2055,\"createBy\":\"admin\",\"children\":[],\"isFrame\":\"1\",\"menuType\":\"F\",\"perms\":\"performance:result:query\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2020-04-16 16:06:04'),
	(261,'菜单管理',1,'com.ruoyi.project.system.controller.SysMenuController.add()','POST',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"visible\":\"0\",\"icon\":\"chart\",\"orderNum\":\"4\",\"menuName\":\"日常考核\",\"params\":{},\"parentId\":2012,\"path\":\"normal\",\"component\":\"performance/normal/index\",\"createBy\":\"admin\",\"children\":[],\"isFrame\":\"1\",\"menuType\":\"C\",\"perms\":\"performance:normal:list\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2020-04-16 16:06:49'),
	(262,'字典类型',1,'com.ruoyi.project.system.controller.SysDictTypeController.add()','POST',1,'admin',NULL,'/system/dict/type','127.0.0.1','内网IP','{\"params\":{},\"dictType\":\"perfor_application_status\",\"createBy\":\"admin\",\"dictName\":\"绩效申请状态\",\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2020-04-16 16:22:51'),
	(263,'字典类型',1,'com.ruoyi.project.system.controller.SysDictTypeController.add()','POST',1,'admin',NULL,'/system/dict/type','127.0.0.1','内网IP','{\"remark\":\"绩效考核结果\",\"params\":{},\"dictType\":\"perfor_result_type\",\"createBy\":\"admin\",\"dictName\":\"绩效考核结果\",\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2020-04-16 16:23:25'),
	(264,'字典类型',1,'com.ruoyi.project.system.controller.SysDictTypeController.add()','POST',1,'admin',NULL,'/system/dict/type','127.0.0.1','内网IP','{\"remark\":\"绩效人员考核范围和比例\",\"params\":{},\"dictType\":\"perfor_evaluate_range\",\"createBy\":\"admin\",\"dictName\":\"绩效考核范围\",\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2020-04-16 16:23:50'),
	(265,'字典类型',1,'com.ruoyi.project.system.controller.SysDictTypeController.add()','POST',1,'admin',NULL,'/system/dict/type','127.0.0.1','内网IP','{\"remark\":\"绩效人员考核范围和比例\",\"params\":{},\"dictType\":\"perfor_evaluate_range\",\"dictName\":\"绩效考核范围\",\"status\":\"0\"}','{\"msg\":\"新增字典\'绩效考核范围\'失败，字典类型已存在\",\"code\":500}',0,NULL,'2020-04-16 16:24:15'),
	(266,'字典类型',1,'com.ruoyi.project.system.controller.SysDictTypeController.add()','POST',1,'admin',NULL,'/system/dict/type','127.0.0.1','内网IP','{\"remark\":\"日常考核的类型\",\"params\":{},\"dictType\":\"perfor_normal_type\",\"createBy\":\"admin\",\"dictName\":\"日常考核类型\",\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2020-04-16 16:24:48'),
	(267,'字典数据',1,'com.ruoyi.project.system.controller.SysDictDataController.add()','POST',1,'admin',NULL,'/system/dict/data','127.0.0.1','内网IP','{\"dictValue\":\"0\",\"dictSort\":1,\"params\":{},\"dictType\":\"perfor_application_status\",\"dictLabel\":\"正常\",\"createBy\":\"admin\",\"default\":false,\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2020-04-16 16:25:33'),
	(268,'字典数据',1,'com.ruoyi.project.system.controller.SysDictDataController.add()','POST',1,'admin',NULL,'/system/dict/data','127.0.0.1','内网IP','{\"dictValue\":\"1\",\"dictSort\":2,\"params\":{},\"dictType\":\"perfor_application_status\",\"dictLabel\":\"结束\",\"createBy\":\"admin\",\"default\":false,\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2020-04-16 16:25:48'),
	(269,'字典数据',1,'com.ruoyi.project.system.controller.SysDictDataController.add()','POST',1,'admin',NULL,'/system/dict/data','127.0.0.1','内网IP','{\"dictValue\":\"100\",\"dictSort\":1,\"remark\":\"A+（非常优秀）\",\"params\":{},\"dictType\":\"perfor_result_type\",\"dictLabel\":\"A+\",\"createBy\":\"admin\",\"default\":false,\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2020-04-16 16:26:38'),
	(270,'字典数据',1,'com.ruoyi.project.system.controller.SysDictDataController.add()','POST',1,'admin',NULL,'/system/dict/data','127.0.0.1','内网IP','{\"dictValue\":\"95\",\"dictSort\":2,\"remark\":\"A（优秀）\",\"params\":{},\"dictType\":\"perfor_result_type\",\"dictLabel\":\"A\",\"createBy\":\"admin\",\"default\":false,\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2020-04-16 16:27:05'),
	(271,'字典数据',1,'com.ruoyi.project.system.controller.SysDictDataController.add()','POST',1,'admin',NULL,'/system/dict/data','127.0.0.1','内网IP','{\"dictValue\":\"90\",\"dictSort\":3,\"remark\":\"A-（勉强优秀）\",\"params\":{},\"dictType\":\"perfor_result_type\",\"dictLabel\":\"A-\",\"createBy\":\"admin\",\"default\":false,\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2020-04-16 16:27:27'),
	(272,'字典数据',1,'com.ruoyi.project.system.controller.SysDictDataController.add()','POST',1,'admin',NULL,'/system/dict/data','127.0.0.1','内网IP','{\"dictValue\":\"85\",\"dictSort\":4,\"remark\":\"B+（非常良好）\",\"params\":{},\"dictType\":\"perfor_result_type\",\"dictLabel\":\"B+\",\"createBy\":\"admin\",\"default\":false,\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2020-04-16 16:27:46'),
	(273,'字典数据',1,'com.ruoyi.project.system.controller.SysDictDataController.add()','POST',1,'admin',NULL,'/system/dict/data','127.0.0.1','内网IP','{\"dictValue\":\"80\",\"dictSort\":5,\"remark\":\"B（良好）\",\"params\":{},\"dictType\":\"perfor_result_type\",\"dictLabel\":\"B\",\"createBy\":\"admin\",\"default\":false,\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2020-04-16 16:28:16'),
	(274,'字典数据',1,'com.ruoyi.project.system.controller.SysDictDataController.add()','POST',1,'admin',NULL,'/system/dict/data','127.0.0.1','内网IP','{\"dictValue\":\"75\",\"dictSort\":6,\"remark\":\"B-（勉强良好）\",\"params\":{},\"dictType\":\"perfor_result_type\",\"dictLabel\":\"B-\",\"createBy\":\"admin\",\"default\":false,\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2020-04-16 16:28:44'),
	(275,'字典数据',1,'com.ruoyi.project.system.controller.SysDictDataController.add()','POST',1,'admin',NULL,'/system/dict/data','127.0.0.1','内网IP','{\"dictValue\":\"70\",\"dictSort\":7,\"remark\":\"C+（非常及格）\",\"params\":{},\"dictType\":\"perfor_result_type\",\"dictLabel\":\"C+\",\"createBy\":\"admin\",\"default\":false,\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2020-04-16 16:29:08'),
	(276,'字典数据',1,'com.ruoyi.project.system.controller.SysDictDataController.add()','POST',1,'admin',NULL,'/system/dict/data','127.0.0.1','内网IP','{\"dictValue\":\"65\",\"dictSort\":8,\"remark\":\"C（及格）\",\"params\":{},\"dictType\":\"perfor_result_type\",\"dictLabel\":\"C\",\"createBy\":\"admin\",\"default\":false,\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2020-04-16 16:29:35'),
	(277,'字典数据',1,'com.ruoyi.project.system.controller.SysDictDataController.add()','POST',1,'admin',NULL,'/system/dict/data','127.0.0.1','内网IP','{\"dictValue\":\"60\",\"dictSort\":9,\"remark\":\"C-（勉强及格）\",\"params\":{},\"dictType\":\"perfor_result_type\",\"dictLabel\":\"C-\",\"createBy\":\"admin\",\"default\":false,\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2020-04-16 16:30:00'),
	(278,'字典数据',1,'com.ruoyi.project.system.controller.SysDictDataController.add()','POST',1,'admin',NULL,'/system/dict/data','127.0.0.1','内网IP','{\"dictValue\":\"55\",\"dictSort\":10,\"remark\":\"D+（差点及格）\",\"params\":{},\"dictType\":\"perfor_result_type\",\"dictLabel\":\"D+\",\"createBy\":\"admin\",\"default\":false,\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2020-04-16 16:30:34'),
	(279,'字典数据',1,'com.ruoyi.project.system.controller.SysDictDataController.add()','POST',1,'admin',NULL,'/system/dict/data','127.0.0.1','内网IP','{\"dictValue\":\"50\",\"dictSort\":11,\"remark\":\"D（差）\",\"params\":{},\"dictType\":\"perfor_result_type\",\"dictLabel\":\"D\",\"createBy\":\"admin\",\"default\":false,\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2020-04-16 16:31:01'),
	(280,'字典数据',1,'com.ruoyi.project.system.controller.SysDictDataController.add()','POST',1,'admin',NULL,'/system/dict/data','127.0.0.1','内网IP','{\"dictValue\":\"40\",\"dictSort\":12,\"remark\":\"D-（非常差）\",\"params\":{},\"dictType\":\"perfor_result_type\",\"dictLabel\":\"D-\",\"createBy\":\"admin\",\"default\":false,\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2020-04-16 16:31:20'),
	(281,'字典数据',1,'com.ruoyi.project.system.controller.SysDictDataController.add()','POST',1,'admin',NULL,'/system/dict/data','127.0.0.1','内网IP','{\"dictValue\":\"20\",\"dictSort\":1,\"remark\":\"下级考核比占20%\",\"params\":{},\"dictType\":\"perfor_evaluate_range\",\"dictLabel\":\"下级\",\"createBy\":\"admin\",\"default\":false,\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2020-04-16 16:32:09'),
	(282,'字典数据',1,'com.ruoyi.project.system.controller.SysDictDataController.add()','POST',1,'admin',NULL,'/system/dict/data','127.0.0.1','内网IP','{\"dictValue\":\"20\",\"dictSort\":2,\"remark\":\"平级考核占比20%\",\"params\":{},\"dictType\":\"perfor_evaluate_range\",\"dictLabel\":\"平级\",\"createBy\":\"admin\",\"default\":false,\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2020-04-16 16:32:31'),
	(283,'字典数据',1,'com.ruoyi.project.system.controller.SysDictDataController.add()','POST',1,'admin',NULL,'/system/dict/data','127.0.0.1','内网IP','{\"dictValue\":\"30\",\"dictSort\":3,\"remark\":\"上级考核占比30%\",\"params\":{},\"dictType\":\"perfor_evaluate_range\",\"dictLabel\":\"上级\",\"createBy\":\"admin\",\"default\":false,\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2020-04-16 16:32:52'),
	(284,'字典数据',1,'com.ruoyi.project.system.controller.SysDictDataController.add()','POST',1,'admin',NULL,'/system/dict/data','127.0.0.1','内网IP','{\"dictValue\":\"30\",\"dictSort\":4,\"remark\":\"上上级考核占比30%\",\"params\":{},\"dictType\":\"perfor_evaluate_range\",\"dictLabel\":\"上上级\",\"createBy\":\"admin\",\"default\":false,\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2020-04-16 16:33:10'),
	(285,'字典数据',1,'com.ruoyi.project.system.controller.SysDictDataController.add()','POST',1,'admin',NULL,'/system/dict/data','127.0.0.1','内网IP','{\"dictValue\":\"001\",\"dictSort\":1,\"params\":{},\"dictType\":\"perfor_normal_type\",\"dictLabel\":\"采购考核\",\"createBy\":\"admin\",\"default\":false,\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2020-04-16 16:33:46'),
	(286,'字典数据',1,'com.ruoyi.project.system.controller.SysDictDataController.add()','POST',1,'admin',NULL,'/system/dict/data','127.0.0.1','内网IP','{\"dictValue\":\"002\",\"dictSort\":2,\"params\":{},\"dictType\":\"perfor_normal_type\",\"dictLabel\":\"出勤考核\",\"createBy\":\"admin\",\"default\":false,\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2020-04-16 16:34:01'),
	(287,'日常考核',1,'com.ruoyi.project.performance.controller.PerforNormalController.add()','POST',1,'admin',NULL,'/performance/normal','127.0.0.1','内网IP','{\"date\":1582992000000,\"evaluations\":[{\"date\":1582992000000,\"reason\":\"优秀\",\"ownerId\":102,\"params\":{},\"type\":\"001\",\"result\":\"A+\",\"createBy\":\"admin\"}],\"params\":{},\"type\":\"001\",\"createBy\":\"admin\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2020-04-16 16:34:40'),
	(288,'日常考核',1,'com.ruoyi.project.performance.controller.PerforNormalController.add()','POST',1,'admin',NULL,'/performance/normal','127.0.0.1','内网IP','{\"date\":1582992000000,\"evaluations\":[{\"date\":1582992000000,\"ownerId\":102,\"params\":{},\"type\":\"001\",\"result\":\"A\",\"createBy\":\"admin\",\"createTime\":1587026080000}],\"params\":{},\"type\":\"001\",\"createBy\":\"admin\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2020-04-16 16:34:53'),
	(289,'角色管理',2,'com.ruoyi.project.system.controller.SysRoleController.edit()','PUT',1,'admin',NULL,'/system/role','127.0.0.1','内网IP','{\"flag\":false,\"roleId\":2,\"admin\":false,\"remark\":\"普通角色\",\"dataScope\":\"2\",\"delFlag\":\"0\",\"params\":{},\"roleSort\":\"2\",\"createTime\":1521171180000,\"updateBy\":\"admin\",\"roleKey\":\"common\",\"roleName\":\"普通角色\",\"menuIds\":[2000,2018,2021,2022,2023,2025,2026,2027,2028,2016,2017,2034,2035,2036,2037,2019,2029,2030,2031,2032,2033,2020,2038,2040,2041,2042,2043,2001,2002,2003,2004,2005,2006,2007,2008,2009,2010,2011,2047,2048,2049,2050,2052,2053,2054,2055,2056,2013,2014,2015,2012,2046],\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2020-04-16 16:40:17'),
	(290,'角色管理',2,'com.ruoyi.project.system.controller.SysRoleController.dataScope()','PUT',1,'admin',NULL,'/system/role/dataScope','127.0.0.1','内网IP','{\"flag\":false,\"roleId\":2,\"admin\":false,\"remark\":\"普通角色\",\"dataScope\":\"1\",\"delFlag\":\"0\",\"params\":{},\"roleSort\":\"2\",\"createTime\":1521171180000,\"roleKey\":\"common\",\"roleName\":\"普通角色\",\"deptIds\":[105,100,101],\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2020-04-16 16:52:20'),
	(291,'角色管理',2,'com.ruoyi.project.system.controller.SysRoleController.dataScope()','PUT',1,'admin',NULL,'/system/role/dataScope','127.0.0.1','内网IP','{\"flag\":false,\"roleId\":100,\"admin\":false,\"dataScope\":\"1\",\"delFlag\":\"0\",\"params\":{},\"roleSort\":\"3\",\"createTime\":1586841130000,\"roleKey\":\"manager\",\"roleName\":\"项目主任\",\"deptIds\":[],\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2020-04-16 16:52:25'),
	(292,'绩效申请',1,'com.ruoyi.project.performance.controller.PerforApplicationController.add()','POST',1,'陆志峰',NULL,'/performance/application','127.0.0.1','内网IP','{\"applicationContent\":\"<p>1.。。。。</p>\",\"applicationTitle\":\"陆志峰测试1\",\"ownerId\":102,\"params\":{},\"createBy\":\"陆志峰\",\"applicationPercentage\":30,\"applicationId\":1,\"confirmerIds\":[],\"applicationDate\":1585670400000,\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2020-04-16 16:53:26'),
	(293,'绩效申请',3,'com.ruoyi.project.performance.controller.PerforApplicationController.remove()','DELETE',1,'陆志峰',NULL,'/performance/application/1','127.0.0.1','内网IP','{applicationId=1}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2020-04-16 16:53:45'),
	(294,'绩效申请',1,'com.ruoyi.project.performance.controller.PerforApplicationController.add()','POST',1,'陆志峰',NULL,'/performance/application','127.0.0.1','内网IP','{\"applicationContent\":\"<p>1.。。。</p>\",\"applicationTitle\":\"陆志峰测试1\",\"ownerId\":102,\"params\":{},\"createBy\":\"陆志峰\",\"applicationPercentage\":30,\"applicationId\":2,\"confirmerIds\":[101],\"applicationDate\":1585670400000,\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2020-04-16 16:54:07'),
	(295,'角色管理',2,'com.ruoyi.project.system.controller.SysRoleController.edit()','PUT',1,'admin',NULL,'/system/role','127.0.0.1','内网IP','{\"flag\":false,\"roleId\":100,\"admin\":false,\"dataScope\":\"1\",\"delFlag\":\"0\",\"params\":{},\"roleSort\":\"3\",\"createTime\":1586841130000,\"updateBy\":\"admin\",\"roleKey\":\"evaluation\",\"roleName\":\"考核管理员\",\"menuIds\":[2000,2018,2021,2022,2023,2025,2026,2027,2028,2016,2017,2034,2035,2036,2037,2019,2029,2030,2031,2032,2033,2020,2038,2040,2041,2042,2043,2001,2002,2003,2004,2005,2006,2007,2008,2009,2010,2011,2012,2046,2047,2048,2049,2050,2051,2052,2053,2054,2055,2056,2057,2013,2014,2015],\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2020-04-16 16:56:41'),
	(296,'角色管理',1,'com.ruoyi.project.system.controller.SysRoleController.add()','POST',1,'admin',NULL,'/system/role','127.0.0.1','内网IP','{\"flag\":false,\"roleId\":101,\"admin\":false,\"params\":{},\"roleSort\":\"4\",\"createBy\":\"admin\",\"roleKey\":\"distribution\",\"roleName\":\"任务分发员\",\"deptIds\":[],\"menuIds\":[2000,2018,2021,2022,2023,2025,2026,2027,2028,2016,2017,2034,2035,2036,2037,2019,2029,2030,2031,2032,2033,2020,2038,2040,2041,2042,2043,2001,2002,2003,2004,2005,2006,2007,2008,2009,2010,2011,2012,2046,2047,2048,2049,2050,2051,2052,2053,2054,2055,2056,2057,2013,2014,2015],\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2020-04-16 16:57:17'),
	(297,'用户管理',2,'com.ruoyi.project.system.controller.SysUserController.edit()','PUT',1,'admin',NULL,'/system/user','127.0.0.1','内网IP','{\"roles\":[{\"flag\":false,\"roleId\":100,\"admin\":false,\"dataScope\":\"1\",\"params\":{},\"roleSort\":\"3\",\"roleKey\":\"evaluation\",\"roleName\":\"考核管理员\",\"status\":\"0\"}],\"phonenumber\":\"15888888889\",\"admin\":false,\"delFlag\":\"0\",\"password\":\"\",\"updateBy\":\"admin\",\"postIds\":[2],\"loginIp\":\"\",\"email\":\"15888888888@163.com\",\"nickName\":\"罗霄\",\"sex\":\"0\",\"deptId\":200,\"avatar\":\"\",\"dept\":{\"deptName\":\"课题组\",\"deptId\":200,\"orderNum\":\"1\",\"params\":{},\"parentId\":100,\"children\":[],\"status\":\"0\"},\"params\":{},\"userName\":\"罗霄\",\"userId\":101,\"createBy\":\"admin\",\"roleIds\":[100,101],\"createTime\":1586840989000,\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2020-04-16 16:57:35'),
	(298,'修改结果',2,'com.ruoyi.project.performance.controller.PerforEvaluateController.edit()','PUT',1,'罗霄',NULL,'/performance/evaluate','127.0.0.1','内网IP','{\"applicationContent\":\"<p>1.。。。</p>\",\"applicationTitle\":\"陆志峰测试1\",\"approverId\":101,\"remark\":\"优秀\",\"ownerId\":102,\"params\":{},\"approverRank\":3,\"result\":\"A+\",\"createBy\":\"陆志峰\",\"applicationPercentage\":30,\"ownerName\":\"陆志峰\",\"createTime\":1587027247000,\"updateBy\":\"\",\"id\":3,\"applicationId\":2,\"applicationDate\":1585670400000,\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2020-04-16 16:58:15'),
	(299,'绩效申请',1,'com.ruoyi.project.performance.controller.PerforApplicationController.add()','POST',1,'罗霄',NULL,'/performance/application','127.0.0.1','内网IP','{\"applicationContent\":\"<p>1.。。。。</p>\",\"applicationTitle\":\"陆志峰被分发1\",\"ownerId\":102,\"params\":{},\"createBy\":\"罗霄\",\"applicationPercentage\":30,\"applicationId\":3,\"confirmerIds\":[],\"applicationDate\":1585670400000,\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2020-04-16 16:58:41'),
	(300,'用户管理',2,'com.ruoyi.project.system.controller.SysUserController.edit()','PUT',1,'陆志峰',NULL,'/system/user','127.0.0.1','内网IP','{\"roles\":[{\"flag\":false,\"roleId\":1,\"admin\":true,\"dataScope\":\"1\",\"params\":{},\"roleSort\":\"1\",\"roleKey\":\"admin\",\"roleName\":\"管理员\",\"status\":\"0\"}],\"phonenumber\":\"15888888888\",\"admin\":true,\"loginDate\":1521171180000,\"remark\":\"管理员\",\"delFlag\":\"0\",\"password\":\"\",\"postIds\":[1],\"loginIp\":\"127.0.0.1\",\"email\":\"ry@163.com\",\"nickName\":\"若依\",\"sex\":\"1\",\"avatar\":\"\",\"dept\":{\"deptName\":\"集成装配组\",\"leader\":\"\",\"deptId\":103,\"orderNum\":\"1\",\"params\":{},\"parentId\":101,\"children\":[],\"status\":\"0\"},\"params\":{},\"userName\":\"admin\",\"userId\":1,\"createBy\":\"admin\",\"roleIds\":[1],\"createTime\":1521171180000,\"status\":\"0\"}','null',1,'不允许操作超级管理员用户','2020-04-16 17:01:13'),
	(301,'用户管理',5,'com.ruoyi.project.system.controller.SysUserController.export()','GET',1,'陆志峰',NULL,'/system/user/export','127.0.0.1','内网IP','{}','{\"msg\":\"ccc31a8b-15d3-4eaf-88d2-776751e899c9_用户数据.xlsx\",\"code\":200}',0,NULL,'2020-04-16 17:19:58'),
	(302,'用户管理',5,'com.ruoyi.project.system.controller.SysUserController.export()','GET',1,'陆志峰',NULL,'/system/user/export','127.0.0.1','内网IP','{}','{\"msg\":\"bc4394fb-d6b3-4edb-9cd3-66977c989f99_用户数据.xlsx\",\"code\":200}',0,NULL,'2020-04-16 17:22:07'),
	(303,'用户管理',6,'com.ruoyi.project.system.controller.SysUserController.importData()','POST',1,'admin',NULL,'/system/user/importData','127.0.0.1','内网IP','true','null',1,'','2020-04-17 09:40:55'),
	(304,'用户管理',6,'com.ruoyi.project.system.controller.SysUserController.importData()','POST',1,'admin',NULL,'/system/user/importData','127.0.0.1','内网IP','true','null',1,'','2020-04-17 09:41:47'),
	(305,'用户管理',6,'com.ruoyi.project.system.controller.SysUserController.importData()','POST',1,'admin',NULL,'/system/user/importData','127.0.0.1','内网IP','false','null',1,'','2020-04-17 10:07:12'),
	(306,'用户管理',6,'com.ruoyi.project.system.controller.SysUserController.importData()','POST',1,'admin',NULL,'/system/user/importData','127.0.0.1','内网IP','true','null',1,'','2020-04-17 10:24:34'),
	(307,'用户管理',6,'com.ruoyi.project.system.controller.SysUserController.importData()','POST',1,'admin',NULL,'/system/user/importData','127.0.0.1','内网IP','true','null',1,'','2020-04-17 10:26:34'),
	(308,'用户管理',6,'com.ruoyi.project.system.controller.SysUserController.importData()','POST',1,'admin',NULL,'/system/user/importData','127.0.0.1','内网IP','true','null',1,'很抱歉，导入失败！共 70 条数据格式不正确，错误如下：<br/>1、账号  导入失败：\n### Error updating database.  Cause: java.sql.SQLException: Field \'user_name\' doesn\'t have a default value\n### The error may involve com.ruoyi.project.system.mapper.SysUserMapper.insertUser-Inline\n### The error occurred while setting parameters\n### SQL: insert into sys_user(                                                      password,                               create_by,            create_time    )values(                                                      ?,                               ?,            sysdate()    )\n### Cause: java.sql.SQLException: Field \'user_name\' doesn\'t have a default value\n; Field \'user_name\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'user_name\' doesn\'t have a default value<br/>2、账号 刘银年 导入失败：\n### Error updating database.  Cause: java.sql.SQLException: Field \'nick_name\' doesn\'t have a default value\n### The error may involve com.ruoyi.project.system.mapper.SysUserMapper.insertUser-Inline\n### The error occurred while setting parameters\n### SQL: insert into sys_user(      user_id,             user_name,             email,             phonenumber,       sex,       password,             work_address,       identity_card,       birthday,       create_by,            create_time    )values(      ?,             ?,             ?,             ?,       ?,       ?,             ?,       ?,       ?,       ?,            sysdate()    )\n### Cause: java.sql.SQLException: Field \'nick_name\' doesn\'t have a default value\n; Field \'nick_name\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'nick_name\' doesn\'t have a default value<br/>3、账号 孙德新 导入失败：\n### Error updating database.  Cause: java.sql.SQLException: Field \'nick_name\' doesn\'t have a default value\n### The error may involve com.ruoyi.project.system.mapper.SysUserMapper.insertUser-Inline\n### The error occurred while setting parameters\n### SQL: insert into sys_user(      user_id,             user_','2020-04-17 10:28:01'),
	(309,'用户管理',6,'com.ruoyi.project.system.controller.SysUserController.importData()','POST',1,'admin',NULL,'/system/user/importData','127.0.0.1','内网IP','true','null',1,'很抱歉，导入失败！共 3 条数据格式不正确，错误如下：<br/>1、账号  导入失败：\n### Error updating database.  Cause: java.sql.SQLException: Field \'user_name\' doesn\'t have a default value\n### The error may involve com.ruoyi.project.system.mapper.SysUserMapper.insertUser-Inline\n### The error occurred while setting parameters\n### SQL: insert into sys_user(                                                      password,                               create_by,            create_time    )values(                                                      ?,                               ?,            sysdate()    )\n### Cause: java.sql.SQLException: Field \'user_name\' doesn\'t have a default value\n; Field \'user_name\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'user_name\' doesn\'t have a default value<br/>2、账号 刘银年 导入失败：\n### Error updating database.  Cause: java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'1\' for key \'PRIMARY\'\n### The error may involve com.ruoyi.project.system.mapper.SysUserMapper.insertUser-Inline\n### The error occurred while setting parameters\n### SQL: insert into sys_user(      user_id,             user_name,       nick_name,       email,             phonenumber,       sex,       password,             work_address,       identity_card,       birthday,       create_by,            create_time    )values(      ?,             ?,       ?,       ?,             ?,       ?,       ?,             ?,       ?,       ?,       ?,            sysdate()    )\n### Cause: java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'1\' for key \'PRIMARY\'\n; Duplicate entry \'1\' for key \'PRIMARY\'; nested exception is java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'1\' for key \'PRIMARY\'<br/>3、账号 孙德新 导入失败：\n### Error updating database.  Cause: java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'2\' for key \'PRIMARY\'\n### The error may involve com.ruoyi.project.system.mapper.SysUserMapper.insertUser-Inline\n### The error occurred while s','2020-04-17 10:32:27'),
	(310,'用户管理',6,'com.ruoyi.project.system.controller.SysUserController.importData()','POST',1,'admin',NULL,'/system/user/importData','127.0.0.1','内网IP','false','null',1,'很抱歉，导入失败！共 1 条数据格式不正确，错误如下：<br/>1、账号  导入失败：\n### Error updating database.  Cause: java.sql.SQLException: Field \'user_name\' doesn\'t have a default value\n### The error may involve com.ruoyi.project.system.mapper.SysUserMapper.insertUser-Inline\n### The error occurred while setting parameters\n### SQL: insert into sys_user(                                                      password,                               create_by,            create_time    )values(                                                      ?,                               ?,            sysdate()    )\n### Cause: java.sql.SQLException: Field \'user_name\' doesn\'t have a default value\n; Field \'user_name\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'user_name\' doesn\'t have a default value','2020-04-17 10:35:31'),
	(311,'用户管理',6,'com.ruoyi.project.system.controller.SysUserController.importData()','POST',1,'admin',NULL,'/system/user/importData','127.0.0.1','内网IP','false','{\"msg\":\"恭喜您，数据已全部导入成功！共 70 条，数据如下：<br/>1、账号 刘银年 导入成功<br/>2、账号 孙德新 导入成功<br/>3、账号 顾兴武 导入成功<br/>4、账号 张营 导入成功<br/>5、账号 张宗存 导入成功<br/>6、账号 李琳 导入成功<br/>7、账号 邢裕杰 导入成功<br/>8、账号 柯有龙 导入成功<br/>9、账号 崔少龙 导入成功<br/>10、账号 刘书锋 导入成功<br/>11、账号 贾帅帅 导入成功<br/>12、账号 刘国庆 导入成功<br/>13、账号 刘冰 导入成功<br/>14、账号 康怀镕 导入成功<br/>15、账号 马超 导入成功<br/>16、账号 周魏乙诺 导入成功<br/>17、账号 史习赟 导入成功<br/>18、账号 孙思华 导入成功<br/>19、账号 柴孟阳 导入成功<br/>20、账号 汪博 导入成功<br/>21、账号 栗银龙 导入成功<br/>22、账号 岳清 导入成功<br/>23、账号 曹开钦 导入成功<br/>24、账号 叶蓉 导入成功<br/>25、账号 沙琨 导入成功<br/>26、账号 朱海健 导入成功<br/>27、账号 王帅 导入成功<br/>28、账号 季诚胜 导入成功<br/>29、账号 古家鸿 导入成功<br/>30、账号 田江 导入成功<br/>31、账号 刘国林 导入成功<br/>32、账号 赵云 导入成功<br/>33、账号 缪斌 导入成功<br/>34、账号 戴天羽 导入成功<br/>35、账号 沈鸿波 导入成功<br/>36、账号 周宇 导入成功<br/>37、账号 朱水和 导入成功<br/>38、账号 颜世澍 导入成功<br/>39、账号 张春云 导入成功<br/>40、账号 董泽 导入成功<br/>41、账号 张耀辉 导入成功<br/>42、账号 周树波 导入成功<br/>43、账号 张静 导入成功<br/>44、账号 郭海芳 导入成功<br/>45、账号 郝世菁 导入成功<br/>46、账号 崔璨璨 导入成功<br/>47、账号 陈瑞瑞 导入成功<br/>48、账号 薛亮 导入成功<br/>49、账号 李勋 导入成功<br/>50、账号 孙广翔 导入成功<br/>51、账号 赵志琦 导入成功<br/>52、账号 贾晓伟 导入成功<br/>53、账号 赵春艳 导入成功<br/>54、账号 冯雪飞 导入成功<br/>55、账号 孟范超 导入成功<br/>56、账号 张天霖 导入成功<br/>57、账号 余燕燕 导入成功<br/>58、账号 林丹 导入成功<br/>59、账号 孙长俐 导入成功<br/>60、账号 胡荣 导入成功<br/>61、账号 罗霄 导入成功<br/>62、账号 时丽丽 导入成功<br/>63、账号 郭跃 导入成功<br/>64、账号 姚懿珊 导入成功<br/>65、账号 乔亮亮 导入成功<br/>66、账号 石志军 导入成功<br/>67、账号 谈兆忠 导入成功<br/>68、账号 李慧婷 导入成功<br/>69、账号 石伟英 导入成功<br/>70、账号 马智 导入成功\",\"code\":200}',0,NULL,'2020-04-17 10:40:46'),
	(312,'个人信息',2,'com.ruoyi.project.system.controller.SysProfileController.updateProfile()','PUT',1,'admin',NULL,'/system/user/profile','127.0.0.1','内网IP','{\"roles\":[{\"flag\":false,\"roleId\":1,\"admin\":true,\"dataScope\":\"1\",\"params\":{},\"roleSort\":\"1\",\"roleKey\":\"admin\",\"roleName\":\"管理员\",\"status\":\"0\"}],\"phonenumber\":\"15888888888\",\"admin\":true,\"loginDate\":1521171180000,\"remark\":\"管理员\",\"delFlag\":\"0\",\"password\":\"$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2\",\"loginIp\":\"127.0.0.1\",\"email\":\"15888888888@163.com\",\"nickName\":\"admin\",\"sex\":\"1\",\"deptId\":103,\"avatar\":\"\",\"dept\":{\"deptName\":\"集成装配组\",\"leader\":\"\",\"deptId\":103,\"orderNum\":\"1\",\"params\":{},\"parentId\":101,\"children\":[],\"status\":\"0\"},\"params\":{},\"userName\":\"admin\",\"userId\":1,\"createBy\":\"admin\",\"createTime\":1521171180000,\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2020-04-17 11:39:42'),
	(313,'用户管理',6,'com.ruoyi.project.system.controller.SysUserController.importData()','POST',1,'admin',NULL,'/system/user/importData','127.0.0.1','内网IP','false','null',1,'很抱歉，导入失败！共 1 条数据格式不正确，错误如下：<br/>1、账号 刘银年 导入失败：\n### Error updating database.  Cause: java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'1\' for key \'PRIMARY\'\n### The error may involve com.ruoyi.project.system.mapper.SysUserMapper.insertUser-Inline\n### The error occurred while setting parameters\n### SQL: insert into sys_user(      user_id,             user_name,       nick_name,       email,             phonenumber,       sex,       password,             work_address,       identity_card,       birthday,       create_by,            create_time    )values(      ?,             ?,       ?,       ?,             ?,       ?,       ?,             ?,       ?,       ?,       ?,            sysdate()    )\n### Cause: java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'1\' for key \'PRIMARY\'\n; Duplicate entry \'1\' for key \'PRIMARY\'; nested exception is java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'1\' for key \'PRIMARY\'','2020-04-17 11:42:57'),
	(314,'用户管理',6,'com.ruoyi.project.system.controller.SysUserController.importData()','POST',1,'admin',NULL,'/system/user/importData','127.0.0.1','内网IP','false','null',1,'很抱歉，导入失败！共 1 条数据格式不正确，错误如下：<br/>1、账号 刘银年 导入失败：\n### Error updating database.  Cause: java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'1\' for key \'PRIMARY\'\n### The error may involve com.ruoyi.project.system.mapper.SysUserMapper.insertUser-Inline\n### The error occurred while setting parameters\n### SQL: insert into sys_user(      user_id,             user_name,       nick_name,       email,             phonenumber,       sex,       password,             work_address,       identity_card,       birthday,       create_by,            create_time    )values(      ?,             ?,       ?,       ?,             ?,       ?,       ?,             ?,       ?,       ?,       ?,            sysdate()    )\n### Cause: java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'1\' for key \'PRIMARY\'\n; Duplicate entry \'1\' for key \'PRIMARY\'; nested exception is java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'1\' for key \'PRIMARY\'','2020-04-17 11:45:39'),
	(315,'用户管理',6,'com.ruoyi.project.system.controller.SysUserController.importData()','POST',1,'admin',NULL,'/system/user/importData','127.0.0.1','内网IP','true','null',1,'很抱歉，导入失败！共 1 条数据格式不正确，错误如下：<br/>1、账号 刘银年 导入失败：\n### Error updating database.  Cause: java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'1\' for key \'PRIMARY\'\n### The error may involve com.ruoyi.project.system.mapper.SysUserMapper.insertUser-Inline\n### The error occurred while setting parameters\n### SQL: insert into sys_user(      user_id,             user_name,       nick_name,       email,             phonenumber,       sex,       password,             work_address,       identity_card,       birthday,       create_by,            create_time    )values(      ?,             ?,       ?,       ?,             ?,       ?,       ?,             ?,       ?,       ?,       ?,            sysdate()    )\n### Cause: java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'1\' for key \'PRIMARY\'\n; Duplicate entry \'1\' for key \'PRIMARY\'; nested exception is java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'1\' for key \'PRIMARY\'','2020-04-17 11:46:07'),
	(316,'用户管理',6,'com.ruoyi.project.system.controller.SysUserController.importData()','POST',1,'admin',NULL,'/system/user/importData','127.0.0.1','内网IP','false','{\"msg\":\"恭喜您，数据已全部导入成功！共 70 条，数据如下：<br/>1、账号 刘银年 导入成功<br/>2、账号 孙德新 导入成功<br/>3、账号 顾兴武 导入成功<br/>4、账号 张营 导入成功<br/>5、账号 张宗存 导入成功<br/>6、账号 李琳 导入成功<br/>7、账号 邢裕杰 导入成功<br/>8、账号 柯有龙 导入成功<br/>9、账号 崔少龙 导入成功<br/>10、账号 刘书锋 导入成功<br/>11、账号 贾帅帅 导入成功<br/>12、账号 刘国庆 导入成功<br/>13、账号 刘冰 导入成功<br/>14、账号 康怀镕 导入成功<br/>15、账号 马超 导入成功<br/>16、账号 周魏乙诺 导入成功<br/>17、账号 史习赟 导入成功<br/>18、账号 孙思华 导入成功<br/>19、账号 柴孟阳 导入成功<br/>20、账号 汪博 导入成功<br/>21、账号 栗银龙 导入成功<br/>22、账号 岳清 导入成功<br/>23、账号 曹开钦 导入成功<br/>24、账号 叶蓉 导入成功<br/>25、账号 沙琨 导入成功<br/>26、账号 朱海健 导入成功<br/>27、账号 王帅 导入成功<br/>28、账号 季诚胜 导入成功<br/>29、账号 古家鸿 导入成功<br/>30、账号 田江 导入成功<br/>31、账号 刘国林 导入成功<br/>32、账号 赵云 导入成功<br/>33、账号 缪斌 导入成功<br/>34、账号 戴天羽 导入成功<br/>35、账号 沈鸿波 导入成功<br/>36、账号 周宇 导入成功<br/>37、账号 朱水和 导入成功<br/>38、账号 颜世澍 导入成功<br/>39、账号 张春云 导入成功<br/>40、账号 董泽 导入成功<br/>41、账号 张耀辉 导入成功<br/>42、账号 周树波 导入成功<br/>43、账号 张静 导入成功<br/>44、账号 郭海芳 导入成功<br/>45、账号 郝世菁 导入成功<br/>46、账号 崔璨璨 导入成功<br/>47、账号 陈瑞瑞 导入成功<br/>48、账号 薛亮 导入成功<br/>49、账号 李勋 导入成功<br/>50、账号 孙广翔 导入成功<br/>51、账号 赵志琦 导入成功<br/>52、账号 贾晓伟 导入成功<br/>53、账号 赵春艳 导入成功<br/>54、账号 冯雪飞 导入成功<br/>55、账号 孟范超 导入成功<br/>56、账号 张天霖 导入成功<br/>57、账号 余燕燕 导入成功<br/>58、账号 林丹 导入成功<br/>59、账号 孙长俐 导入成功<br/>60、账号 胡荣 导入成功<br/>61、账号 罗霄 导入成功<br/>62、账号 时丽丽 导入成功<br/>63、账号 郭跃 导入成功<br/>64、账号 姚懿珊 导入成功<br/>65、账号 乔亮亮 导入成功<br/>66、账号 石志军 导入成功<br/>67、账号 谈兆忠 导入成功<br/>68、账号 李慧婷 导入成功<br/>69、账号 石伟英 导入成功<br/>70、账号 马智 导入成功\",\"code\":200}',0,NULL,'2020-04-17 13:46:12'),
	(317,'用户管理',6,'com.ruoyi.project.system.controller.SysUserController.importData()','POST',1,'admin',NULL,'/system/user/importData','127.0.0.1','内网IP','false','{\"msg\":\"恭喜您，数据已全部导入成功！共 70 条，数据如下：<br/>1、账号 刘银年 导入成功<br/>2、账号 孙德新 导入成功<br/>3、账号 顾兴武 导入成功<br/>4、账号 张营 导入成功<br/>5、账号 张宗存 导入成功<br/>6、账号 李琳 导入成功<br/>7、账号 邢裕杰 导入成功<br/>8、账号 柯有龙 导入成功<br/>9、账号 崔少龙 导入成功<br/>10、账号 刘书锋 导入成功<br/>11、账号 贾帅帅 导入成功<br/>12、账号 刘国庆 导入成功<br/>13、账号 刘冰 导入成功<br/>14、账号 康怀镕 导入成功<br/>15、账号 马超 导入成功<br/>16、账号 周魏乙诺 导入成功<br/>17、账号 史习赟 导入成功<br/>18、账号 孙思华 导入成功<br/>19、账号 柴孟阳 导入成功<br/>20、账号 汪博 导入成功<br/>21、账号 栗银龙 导入成功<br/>22、账号 岳清 导入成功<br/>23、账号 曹开钦 导入成功<br/>24、账号 叶蓉 导入成功<br/>25、账号 沙琨 导入成功<br/>26、账号 朱海健 导入成功<br/>27、账号 王帅 导入成功<br/>28、账号 季诚胜 导入成功<br/>29、账号 古家鸿 导入成功<br/>30、账号 田江 导入成功<br/>31、账号 刘国林 导入成功<br/>32、账号 赵云 导入成功<br/>33、账号 缪斌 导入成功<br/>34、账号 戴天羽 导入成功<br/>35、账号 沈鸿波 导入成功<br/>36、账号 周宇 导入成功<br/>37、账号 朱水和 导入成功<br/>38、账号 颜世澍 导入成功<br/>39、账号 张春云 导入成功<br/>40、账号 董泽 导入成功<br/>41、账号 张耀辉 导入成功<br/>42、账号 周树波 导入成功<br/>43、账号 张静 导入成功<br/>44、账号 郭海芳 导入成功<br/>45、账号 郝世菁 导入成功<br/>46、账号 崔璨璨 导入成功<br/>47、账号 陈瑞瑞 导入成功<br/>48、账号 薛亮 导入成功<br/>49、账号 李勋 导入成功<br/>50、账号 孙广翔 导入成功<br/>51、账号 赵志琦 导入成功<br/>52、账号 贾晓伟 导入成功<br/>53、账号 赵春艳 导入成功<br/>54、账号 冯雪飞 导入成功<br/>55、账号 孟范超 导入成功<br/>56、账号 张天霖 导入成功<br/>57、账号 余燕燕 导入成功<br/>58、账号 林丹 导入成功<br/>59、账号 孙长俐 导入成功<br/>60、账号 胡荣 导入成功<br/>61、账号 罗霄 导入成功<br/>62、账号 时丽丽 导入成功<br/>63、账号 郭跃 导入成功<br/>64、账号 姚懿珊 导入成功<br/>65、账号 乔亮亮 导入成功<br/>66、账号 石志军 导入成功<br/>67、账号 谈兆忠 导入成功<br/>68、账号 李慧婷 导入成功<br/>69、账号 石伟英 导入成功<br/>70、账号 马智 导入成功\",\"code\":200}',0,NULL,'2020-04-17 13:48:24'),
	(318,'用户管理',5,'com.ruoyi.project.system.controller.SysUserController.export()','GET',1,'admin',NULL,'/system/user/export','127.0.0.1','内网IP','{}','{\"msg\":\"b6b84b92-9c49-4d18-bc59-a4f248eb702c_用户数据.xlsx\",\"code\":200}',0,NULL,'2020-04-17 13:48:57'),
	(319,'用户管理',2,'com.ruoyi.project.system.controller.SysUserController.edit()','PUT',1,'admin',NULL,'/system/user','127.0.0.1','内网IP','{\"birthday\":52156800000,\"roles\":[],\"phonenumber\":\"18621609067\",\"admin\":false,\"delFlag\":\"0\",\"leaderId\":1,\"password\":\"\",\"updateBy\":\"admin\",\"postIds\":[],\"loginIp\":\"\",\"email\":\"ynliu@mail.sitp.ac.cn\",\"nickName\":\"刘银年\",\"sex\":\"0\",\"avatar\":\"\",\"identityCard\":\"620105197108280070\",\"params\":{},\"userName\":\"刘银年\",\"userId\":173,\"workAddress\":\"上海\",\"createBy\":\"admin\",\"roleIds\":[],\"createTime\":1587102495000,\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2020-04-17 13:53:30'),
	(320,'用户管理',5,'com.ruoyi.project.system.controller.SysUserController.export()','GET',1,'admin',NULL,'/system/user/export','127.0.0.1','内网IP','{}','{\"msg\":\"38f16236-8ea2-4383-8863-2f31abce8c5b_用户数据.xlsx\",\"code\":200}',0,NULL,'2020-04-17 13:53:38'),
	(321,'用户管理',5,'com.ruoyi.project.system.controller.SysUserController.export()','GET',1,'admin',NULL,'/system/user/export','127.0.0.1','内网IP','{}','{\"msg\":\"bc966e25-8898-4654-84c4-319cd83de0ca_用户数据.xlsx\",\"code\":200}',0,NULL,'2020-04-17 13:54:41');

/*!40000 ALTER TABLE `sys_oper_log` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table sys_post
# ------------------------------------------------------------

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='岗位信息表';

LOCK TABLES `sys_post` WRITE;
/*!40000 ALTER TABLE `sys_post` DISABLE KEYS */;

INSERT INTO `sys_post` (`post_id`, `post_code`, `post_name`, `post_sort`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`)
VALUES
	(1,'ceo','董事长',1,'0','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00',''),
	(2,'se','项目经理',2,'0','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00',''),
	(3,'hr','人力资源',3,'0','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00',''),
	(4,'user','普通员工',4,'0','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00','');

/*!40000 ALTER TABLE `sys_post` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table sys_role
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sys_role`;

CREATE TABLE `sys_role` (
  `role_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `role_name` varchar(30) NOT NULL COMMENT '角色名称',
  `role_key` varchar(100) NOT NULL COMMENT '角色权限字符串',
  `role_sort` int(4) NOT NULL COMMENT '显示顺序',
  `data_scope` char(1) DEFAULT '1' COMMENT '数据范围（1：全部数据权限 2：自定数据权限 3：本部门数据权限 4：本部门及以下数据权限）',
  `status` char(1) NOT NULL COMMENT '角色状态（0正常 1停用）',
  `del_flag` char(1) DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色信息表';

LOCK TABLES `sys_role` WRITE;
/*!40000 ALTER TABLE `sys_role` DISABLE KEYS */;

INSERT INTO `sys_role` (`role_id`, `role_name`, `role_key`, `role_sort`, `data_scope`, `status`, `del_flag`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`)
VALUES
	(1,'管理员','admin',1,'1','0','0','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00','管理员'),
	(2,'普通角色','common',2,'1','0','0','admin','2018-03-16 11:33:00','admin','2020-04-16 16:52:20','普通角色'),
	(100,'考核管理员','evaluation',3,'1','0','0','admin','2020-04-14 13:12:10','admin','2020-04-16 16:56:41',NULL),
	(101,'任务分发员','distribution',4,'1','0','0','admin','2020-04-16 16:57:17','',NULL,NULL);

/*!40000 ALTER TABLE `sys_role` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table sys_role_dept
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sys_role_dept`;

CREATE TABLE `sys_role_dept` (
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  `dept_id` bigint(20) NOT NULL COMMENT '部门ID',
  PRIMARY KEY (`role_id`,`dept_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色和部门关联表';

LOCK TABLES `sys_role_dept` WRITE;
/*!40000 ALTER TABLE `sys_role_dept` DISABLE KEYS */;

INSERT INTO `sys_role_dept` (`role_id`, `dept_id`)
VALUES
	(2,100),
	(2,101),
	(2,105);

/*!40000 ALTER TABLE `sys_role_dept` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table sys_role_menu
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sys_role_menu`;

CREATE TABLE `sys_role_menu` (
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  `menu_id` bigint(20) NOT NULL COMMENT '菜单ID',
  PRIMARY KEY (`role_id`,`menu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色和菜单关联表';

LOCK TABLES `sys_role_menu` WRITE;
/*!40000 ALTER TABLE `sys_role_menu` DISABLE KEYS */;

INSERT INTO `sys_role_menu` (`role_id`, `menu_id`)
VALUES
	(2,2000),
	(2,2001),
	(2,2002),
	(2,2003),
	(2,2004),
	(2,2005),
	(2,2006),
	(2,2007),
	(2,2008),
	(2,2009),
	(2,2010),
	(2,2011),
	(2,2012),
	(2,2013),
	(2,2014),
	(2,2015),
	(2,2016),
	(2,2017),
	(2,2018),
	(2,2019),
	(2,2020),
	(2,2021),
	(2,2022),
	(2,2023),
	(2,2025),
	(2,2026),
	(2,2027),
	(2,2028),
	(2,2029),
	(2,2030),
	(2,2031),
	(2,2032),
	(2,2033),
	(2,2034),
	(2,2035),
	(2,2036),
	(2,2037),
	(2,2038),
	(2,2040),
	(2,2041),
	(2,2042),
	(2,2043),
	(2,2046),
	(2,2047),
	(2,2048),
	(2,2049),
	(2,2050),
	(2,2052),
	(2,2053),
	(2,2054),
	(2,2055),
	(2,2056),
	(100,2000),
	(100,2001),
	(100,2002),
	(100,2003),
	(100,2004),
	(100,2005),
	(100,2006),
	(100,2007),
	(100,2008),
	(100,2009),
	(100,2010),
	(100,2011),
	(100,2012),
	(100,2013),
	(100,2014),
	(100,2015),
	(100,2016),
	(100,2017),
	(100,2018),
	(100,2019),
	(100,2020),
	(100,2021),
	(100,2022),
	(100,2023),
	(100,2025),
	(100,2026),
	(100,2027),
	(100,2028),
	(100,2029),
	(100,2030),
	(100,2031),
	(100,2032),
	(100,2033),
	(100,2034),
	(100,2035),
	(100,2036),
	(100,2037),
	(100,2038),
	(100,2040),
	(100,2041),
	(100,2042),
	(100,2043),
	(100,2046),
	(100,2047),
	(100,2048),
	(100,2049),
	(100,2050),
	(100,2051),
	(100,2052),
	(100,2053),
	(100,2054),
	(100,2055),
	(100,2056),
	(100,2057),
	(101,2000),
	(101,2001),
	(101,2002),
	(101,2003),
	(101,2004),
	(101,2005),
	(101,2006),
	(101,2007),
	(101,2008),
	(101,2009),
	(101,2010),
	(101,2011),
	(101,2012),
	(101,2013),
	(101,2014),
	(101,2015),
	(101,2016),
	(101,2017),
	(101,2018),
	(101,2019),
	(101,2020),
	(101,2021),
	(101,2022),
	(101,2023),
	(101,2025),
	(101,2026),
	(101,2027),
	(101,2028),
	(101,2029),
	(101,2030),
	(101,2031),
	(101,2032),
	(101,2033),
	(101,2034),
	(101,2035),
	(101,2036),
	(101,2037),
	(101,2038),
	(101,2040),
	(101,2041),
	(101,2042),
	(101,2043),
	(101,2046),
	(101,2047),
	(101,2048),
	(101,2049),
	(101,2050),
	(101,2051),
	(101,2052),
	(101,2053),
	(101,2054),
	(101,2055),
	(101,2056),
	(101,2057);

/*!40000 ALTER TABLE `sys_role_menu` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table sys_user
# ------------------------------------------------------------

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
  `login_ip` varchar(50) DEFAULT '' COMMENT '最后登陆IP',
  `login_date` datetime DEFAULT NULL COMMENT '最后登陆时间',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  `work_address` varchar(30) DEFAULT NULL COMMENT '工作地点',
  `identity_card` varchar(100) DEFAULT NULL COMMENT '身份证号',
  `birthday` datetime DEFAULT NULL COMMENT '出身日期',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户信息表';

LOCK TABLES `sys_user` WRITE;
/*!40000 ALTER TABLE `sys_user` DISABLE KEYS */;

INSERT INTO `sys_user` (`user_id`, `dept_id`, `user_name`, `nick_name`, `user_type`, `email`, `phonenumber`, `sex`, `avatar`, `password`, `status`, `del_flag`, `login_ip`, `login_date`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`, `work_address`, `identity_card`, `birthday`)
VALUES
	(1,103,'admin','admin','00','15888888888@163.com','15888888888','1','','$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2','0','0','127.0.0.1','2018-03-16 11:33:00','admin','2018-03-16 11:33:00','ry','2020-04-17 11:39:42','管理员',NULL,NULL,NULL);

/*!40000 ALTER TABLE `sys_user` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table sys_user_leader
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sys_user_leader`;

CREATE TABLE `sys_user_leader` (
  `user_id` bigint(11) DEFAULT NULL COMMENT '用户ID',
  `leader_id` bigint(11) DEFAULT NULL COMMENT '上级领导用户ID'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户与领导关联表';



# Dump of table sys_user_post
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sys_user_post`;

CREATE TABLE `sys_user_post` (
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `post_id` bigint(20) NOT NULL COMMENT '岗位ID',
  PRIMARY KEY (`user_id`,`post_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户与岗位关联表';

LOCK TABLES `sys_user_post` WRITE;
/*!40000 ALTER TABLE `sys_user_post` DISABLE KEYS */;

INSERT INTO `sys_user_post` (`user_id`, `post_id`)
VALUES
	(1,1);

/*!40000 ALTER TABLE `sys_user_post` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table sys_user_role
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sys_user_role`;

CREATE TABLE `sys_user_role` (
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`user_id`,`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户和角色关联表';

LOCK TABLES `sys_user_role` WRITE;
/*!40000 ALTER TABLE `sys_user_role` DISABLE KEYS */;

INSERT INTO `sys_user_role` (`user_id`, `role_id`)
VALUES
	(1,1);

/*!40000 ALTER TABLE `sys_user_role` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
