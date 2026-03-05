-- 创建患者信息表
CREATE TABLE IF NOT EXISTS `patient` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '患者 ID',
  `patient_id` varchar(64) NOT NULL COMMENT '患者编号',
  `patient_name` varchar(100) DEFAULT NULL COMMENT '患者姓名',
  `gender` varchar(10) DEFAULT NULL COMMENT '性别',
  `birth_date` date DEFAULT NULL COMMENT '出生日期',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_patient_id` (`patient_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='患者信息表';

-- 创建检查记录表
CREATE TABLE IF NOT EXISTS `study` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '检查 ID',
  `study_instance_uid` varchar(64) NOT NULL COMMENT '检查实例 UID',
  `patient_id` varchar(64) NOT NULL COMMENT '患者编号',
  `study_description` varchar(500) DEFAULT NULL COMMENT '检查描述',
  `study_date` date DEFAULT NULL COMMENT '检查日期',
  `modality` varchar(50) DEFAULT NULL COMMENT '模态类型',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `idx_patient_id` (`patient_id`),
  KEY `idx_study_instance_uid` (`study_instance_uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='检查记录表';

-- 创建序列记录表
CREATE TABLE IF NOT EXISTS `series` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '序列 ID',
  `series_instance_uid` varchar(64) NOT NULL COMMENT '序列实例 UID',
  `study_instance_uid` varchar(64) NOT NULL COMMENT '检查实例 UID',
  `series_number` int(11) DEFAULT NULL COMMENT '序列号',
  `series_description` varchar(500) DEFAULT NULL COMMENT '序列描述',
  `modality` varchar(50) DEFAULT NULL COMMENT '模态类型',
  `image_count` int(11) DEFAULT 0 COMMENT '图像数量',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `idx_study_instance_uid` (`study_instance_uid`),
  KEY `idx_series_instance_uid` (`series_instance_uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='序列记录表';

-- 创建图像记录表
CREATE TABLE IF NOT EXISTS `image` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '图像 ID',
  `sop_instance_uid` varchar(64) NOT NULL COMMENT 'SOP 实例 UID',
  `series_instance_uid` varchar(64) NOT NULL COMMENT '序列实例 UID',
  `instance_number` int(11) DEFAULT NULL COMMENT '实例号',
  `file_path` varchar(500) DEFAULT NULL COMMENT '文件存储路径',
  `file_size` bigint(20) DEFAULT 0 COMMENT '文件大小 (字节)',
  `storage_status` tinyint(4) DEFAULT 0 COMMENT '存储状态：0-未存储，1-已存储，2-存储失败',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `idx_series_instance_uid` (`series_instance_uid`),
  KEY `idx_sop_instance_uid` (`sop_instance_uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='图像记录表';
