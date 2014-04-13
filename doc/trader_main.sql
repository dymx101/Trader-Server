DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户表主键ID',
  `nick_name` varchar(45) DEFAULT NULL COMMENT '用户昵称',
  `gender` tinyint(1) NOT NULL DEFAULT '0' COMMENT '用户性别编码：0-未知1-男2-女',
  `available` tinyint(1) NOT NULL DEFAULT '0' COMMENT '用户可用状态0-不可用1-可用',
  `role_id` int(11) NOT NULL DEFAULT '0' COMMENT '用户可用状态0-不可用1-可用',
  `create_time` datetime NOT NULL COMMENT '记录建立时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '数据记录更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='user 数据主表';