-- 数据库初始化脚本

-- 创建数据库
CREATE DATABASE seckill;
-- 使用数据库
use seckill;
-- 创建秒杀库存表
CREATE TABLE seckill(
`seckill_id` bigint NOT NULL AUTO_INCREMENT COMMENT '商品库存id',
`name` varchar(120) NOT NULL COMMENT '商品名称',
`number` int NOT NULL COMMENT '库存数量',
`start_time` timestamp NOT NULL COMMENT '秒杀开启时间',
`end_time` timestamp NOT NULL COMMENT '秒杀结束时间',
`create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
PRIMARY KEY (seckill_id),
key idx_start_time(start_time),
key idx_end_time(end_time),
key idx_create_time(create_time)
)ENGINE=InnoBD AUTO_INCREMENT=1000 DEFAULT CHARSET=utf8 COMMENT='秒杀库存表'

-- 初始化数据
insert into
  seckill(name, number, start_time, end_time)
values
  ('100秒杀iphone7', 100, '2017-2-27 00:00:00', '2017-2-28 00:00:00'),
  ('100秒杀小米6', 200, '2017-2-27 00:00:00', '2017-2-28 00:00:00'),
  ('100秒杀魅族6', 300, '2017-2-27 00:00:00', '2017-2-28 00:00:00'),
  ('100秒杀ipad2', 400, '2017-2-27 00:00:00', '2017-2-28 00:00:00');

-- 秒杀成功明细表
-- 用户登陆认证相关信息
CREATE TABLE success_killed(
`seckill_id` bigint NOT NULL COMMENT '秒杀商品id',
`user_phone` bigint NOT NULL COMMENT '用户手机号',
`state` tinyint NOT NULL DEFAULT -1 COMMENT '状态标识: -1:无效 0:成功 1:已付款',
`create_time` timestamp NOT NULL COMMENT '创建时间',
PRIMARY KEY (seckill_id, user_phone), /*联合主键*/
key idx_create_time(create_time)
)ENGINE=InnoBD DEFAULT CHARSET=utf8 COMMENT='秒杀成功明细表'

-- 上线DDL修改记录
-- V1.1
-- Enter your command