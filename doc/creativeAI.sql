DROP DATABASE IF EXISTS creativeAi;
CREATE DATABASE creativeAi
  DEFAULT CHARSET = utf8mb4
  COLLATE utf8mb4_general_ci;
USE creativeAi;

DROP TABLE IF EXISTS tbl_user;
CREATE TABLE `tbl_user` (
	`id` bigint AUTO_INCREMENT PRIMARY KEY COMMENT '自增id',
    `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间（默认字段）',
    `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间（默认字段）',
    `status` varchar(20) NOT NULL DEFAULT '1' COMMENT '状态（默认字段,1:已启用 0:已删除 2:已停用）',
    `phone_number` varchar(20) NOT NULL COMMENT '手机',
    `user_name` varchar(32) NOT NULL DEFAULT '' COMMENT '用户姓名',
    `password_hash` varchar(32) NOT NULL DEFAULT '' COMMENT '密码哈希',
    `login_code` varchar(10) NOT NULL DEFAULT '' COMMENT '登录验证码',
    `profile_id` bigint NOT NULL DEFAULT 0 COMMENT '头像文件索引',
    UNIQUE KEY `uk_phone_number`(`phone_number`)
) COMMENT='用户信息表';

DROP TABLE IF EXISTS tbl_key_words_collection;
CREATE TABLE `tbl_key_words_collection` (
	`id` bigint AUTO_INCREMENT PRIMARY KEY COMMENT '自增id',
    `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间（默认字段）',
    `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间（默认字段）',
    `status` varchar(20) NOT NULL DEFAULT '1' COMMENT '状态（默认字段,1:已启用 0:已删除 2:已停用）',
	`name` varchar(100) NOT NULL COMMENT ''
) COMMENT='关键字表';

DROP TABLE IF EXISTS tbl_key_words;
CREATE TABLE `tbl_key_words` (
	`id` bigint AUTO_INCREMENT PRIMARY KEY COMMENT '自增id',
    `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间（默认字段）',
    `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间（默认字段）',
    `status` varchar(20) NOT NULL DEFAULT '1' COMMENT '状态（默认字段,1:已启用 0:已删除 2:已停用）',
	`words` varchar(100) NOT NULL COMMENT ''
    `collection_id` bigint NOT NULL DEFAULT 0 COMMENT '关联的关键字集合id',
) COMMENT='关键字表';

DROP TABLE IF EXISTS tbl_image;
CREATE TABLE `tbl_image` (
	`id` bigint AUTO_INCREMENT PRIMARY KEY COMMENT '自增id',
    `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间（默认字段）',
    `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间（默认字段）',
    `status` varchar(20) NOT NULL DEFAULT '1' COMMENT '状态（默认字段,1:已启用 0:已删除 2:已停用）',
	`url` varchar(100) NOT NULL COMMENT '图片url',
    `description` varchar(100) NOT NULL COMMENT '图片描述',
    `keywords` varchar(100) NOT NULL COMMENT '关键列表',
    `user_id` bigint NOT NULL DEFAULT 0 COMMENT '用户id，默认为0表示预先生成的image',
    `type` varchar(20) NOT NULL DEFAULT '1' COMMENT '状态（默认字段,1:预设模板 0:用户模板）',
    `template` varchar(20) NOT NULL DEFAULT '1' COMMENT '状态（默认字段,1:模板 0:图片）',
    `image_id` bigint NOT NULL DEFAULT 0 COMMENT '图片文件的索引',
	KEY `idx_user_id`(user_id)
) COMMENT='图片信息表';

DROP TABLE IF EXISTS tbl_file;
CREATE TABLE `tbl_file` (
    `id` bigint AUTO_INCREMENT PRIMARY KEY COMMENT '自增id, 非文件id',
    `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间（默认字段）',
    `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间（默认字段）',
    `status` varchar(20) NOT NULL DEFAULT '1' COMMENT '状态（默认字段,1:已启用 0:已删除 2:已停用）',
    `file_type` varchar(10) NOT NULL COMMENT '业务类型（前端约定枚举类型（1、建筑图片；2、室内图片；3、风景图片；...））',
    `file_length` bigint NOT NULL COMMENT '文件大小, 字节数',
    `file_content` mediumtext  NOT NULL COMMENT '文件内容',
    KEY `idx_user_id`(user_id)
) COMMENT='文件表';


