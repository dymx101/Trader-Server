DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户表主键ID',
  `user_name` varchar(45) NOT NULL COMMENT '用户昵称',
  `passwd` varchar(15) NOT NULL, 
  `mail` varchar(30) NOT NULL,
  `phone_number` varchar(20) DEFAULT NULL COMMENT '绑定的手机号码',
  `create_time` datetime NOT NULL COMMENT '记录建立时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '数据记录更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='user 数据主表';


DROP TABLE IF EXISTS `user_account`;
CREATE TABLE `user_account` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `balance` int(10) unsigned DEFAULT '0' COMMENT '金额',
  `create_time` datetime NOT NULL COMMENT '记录建立时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '数据记录更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `trade_flow`;
CREATE TABLE `trade_flow` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `amount` int(11) NOT NULL DEFAULT '0' COMMENT '交易金额：充值为正数;消费为负数',
  `digest` varchar(50) DEFAULT NULL COMMENT '摘要',
  `create_time` datetime NOT NULL COMMENT '记录建立时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '数据记录更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='交易流水表';


DROP TABLE IF EXISTS `user_relation_from`;
CREATE TABLE `user_relation_from` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `from_user_id` int(11) NOT NULL,
  `to_user_id` int(11) NOT NULL,
  `relationship` tinyint(1) NOT NULL DEFAULT 0 COMMENT '1-follow -1-block',
  `create_time` datetime NOT NULL COMMENT '记录建立时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '数据记录更新时间',
   PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 
PARTITION BY HASH (from_user_id)
PARTITIONS 256;


DROP TABLE IF EXISTS `user_relation_to`;
CREATE TABLE `user_relation_to` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `to_user_id` int(11) NOT NULL,
  `from_user_id` int(11) NOT NULL,
  `relationship` tinyint(1) NOT NULL DEFAULT 0 COMMENT '1-follow -1-block',
  `create_time` datetime NOT NULL COMMENT '记录建立时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '数据记录更新时间',
   PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 
PARTITION BY HASH (to_user_id)
PARTITIONS 256;

