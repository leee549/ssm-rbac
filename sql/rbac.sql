SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for department
-- ----------------------------
DROP TABLE IF EXISTS `department`;
CREATE TABLE `department`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sn` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of department
-- ----------------------------
INSERT INTO `department` VALUES (2, '人力资源部', 'Hello');
INSERT INTO `department` VALUES (3, '采购部', 'Order Department');
INSERT INTO `department` VALUES (4, '仓储部', 'Warehousing Department');
INSERT INTO `department` VALUES (5, '财务部', 'Finance Department');
INSERT INTO `department` VALUES (6, '技术部', 'Technolog Department ');
INSERT INTO `department` VALUES (7, '摸鱼部', '60');

-- ----------------------------
-- Table structure for employee
-- ----------------------------
DROP TABLE IF EXISTS `employee`;
CREATE TABLE `employee`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `age` int(11) NULL DEFAULT NULL,
  `admin` bit(1) NULL DEFAULT NULL,
  `dept_id` bigint(20) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 41 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of employee
-- Default pwd:1
-- ----------------------------
INSERT INTO `employee` VALUES (2, 'ad', '00c18a96dcd54576524d9d284a70b1ff', 'ad@chachae.org', 33, b'0', 3);
INSERT INTO `employee` VALUES (4, 'admin', '00c18a96dcd54576524d9d284a70b1ff', 'qianz@wolfcode.cn', 28, b'1', 2);
INSERT INTO `employee` VALUES (5, '钱二明', '00c18a96dcd54576524d9d284a70b1ff', 'admin3@wk.cc', 30, b'1', 2);
INSERT INTO `employee` VALUES (6, '孙总', '00c18a96dcd54576524d9d284a70b1ff', 'sunz@wolfcode.cn', 35, b'0', 5);
INSERT INTO `employee` VALUES (7, '孙三明', '00c18a96dcd54576524d9d284a70b1ff', 'sunsm@wolfcode.cn', 25, b'0', 2);
INSERT INTO `employee` VALUES (8, '李总', '00c18a96dcd54576524d9d284a70b1ff', 'liz@wolfcode.cn', 35, b'1', 4);
INSERT INTO `employee` VALUES (9, '李四明', '00c18a96dcd54576524d9d284a70b1ff', 'lism@wolfcode.cn', 25, b'0', 4);
INSERT INTO `employee` VALUES (10, '周总', '00c18a96dcd54576524d9d284a70b1ff', 'zhouz@wolfcode.cn', 35, b'1', 2);
INSERT INTO `employee` VALUES (12, '吴总', '00c18a96dcd54576524d9d284a70b1ff', 'wuz@wolfcode.cn', 35, b'0', 2);
INSERT INTO `employee` VALUES (17, '孙五明', '00c18a96dcd54576524d9d284a70b1ff', 'sunwm@wolfcode.cn', 25, b'0', 2);
INSERT INTO `employee` VALUES (23, '李五明', '00c18a96dcd54576524d9d284a70b1ff', 'liwm@wolfcode.cn', 25, b'0', 2);
INSERT INTO `employee` VALUES (33, 'all', '00c18a96dcd54576524d9d284a70b1ff', 'lihx@dev.dev', 43, b'0', 6);
INSERT INTO `employee` VALUES (34, 'no', '00c18a96dcd54576524d9d284a70b1ff', 'admin3@wk.cc', 20, b'0', 5);

-- ----------------------------
-- Table structure for employee_role
-- ----------------------------
DROP TABLE IF EXISTS `employee_role`;
CREATE TABLE `employee_role`  (
  `employee_id` bigint(20) NULL DEFAULT NULL,
  `role_id` bigint(20) NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of employee_role
-- ----------------------------
INSERT INTO `employee_role` VALUES (4, 1);
INSERT INTO `employee_role` VALUES (2, 1);
INSERT INTO `employee_role` VALUES (2, 2);
INSERT INTO `employee_role` VALUES (12, 1);
INSERT INTO `employee_role` VALUES (12, 2);
INSERT INTO `employee_role` VALUES (12, 3);
INSERT INTO `employee_role` VALUES (12, 4);
INSERT INTO `employee_role` VALUES (12, 11);
INSERT INTO `employee_role` VALUES (12, 12);
INSERT INTO `employee_role` VALUES (17, 1);
INSERT INTO `employee_role` VALUES (17, 2);
INSERT INTO `employee_role` VALUES (17, 3);
INSERT INTO `employee_role` VALUES (17, 4);
INSERT INTO `employee_role` VALUES (17, 11);
INSERT INTO `employee_role` VALUES (17, 12);
INSERT INTO `employee_role` VALUES (33, 1);
INSERT INTO `employee_role` VALUES (33, 2);
INSERT INTO `employee_role` VALUES (33, 3);
INSERT INTO `employee_role` VALUES (33, 4);
INSERT INTO `employee_role` VALUES (33, 12);

-- ----------------------------
-- Table structure for permission
-- ----------------------------
DROP TABLE IF EXISTS `permission`;
CREATE TABLE `permission`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `expression` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 15 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of permission
-- ----------------------------
INSERT INTO `permission` VALUES (1, '部门删除', 'department:delete');
INSERT INTO `permission` VALUES (2, '部门列表', 'department:list');
INSERT INTO `permission` VALUES (3, '部门编辑', 'department:input');
INSERT INTO `permission` VALUES (4, '部门保存或更新', 'department:saveOrUpdate');
INSERT INTO `permission` VALUES (5, '员工删除', 'employee:delete');
INSERT INTO `permission` VALUES (6, '员工列表', 'employee:list');
INSERT INTO `permission` VALUES (7, '员工编辑', 'employee:input');
INSERT INTO `permission` VALUES (8, '员工保存或更新', 'employee:saveOrUpdate');
INSERT INTO `permission` VALUES (9, '权限列表', 'permission:list');
INSERT INTO `permission` VALUES (10, '权限加载', 'permission:reload');
INSERT INTO `permission` VALUES (11, '角色删除', 'role:delete');
INSERT INTO `permission` VALUES (12, '角色列表', 'role:list');
INSERT INTO `permission` VALUES (13, '角色编辑', 'role:input');
INSERT INTO `permission` VALUES (14, '角色保存或更新', 'role:saveOrUpdate');

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sn` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES (1, '人事管理', 'HR_MGR');
INSERT INTO `role` VALUES (2, '采购管理', 'ORDER_MGR');
INSERT INTO `role` VALUES (3, '仓储管理', 'WAREHOUSING_MGR');
INSERT INTO `role` VALUES (4, '行政部管理', 'Admin_MGR');
INSERT INTO `role` VALUES (11, '市场经理', 'Market_Manager');
INSERT INTO `role` VALUES (12, '市场专员', 'Market Pros');

-- ----------------------------
-- Table structure for role_permission
-- ----------------------------
DROP TABLE IF EXISTS `role_permission`;
CREATE TABLE `role_permission`  (
  `role_id` bigint(20) NULL DEFAULT NULL,
  `permission_id` bigint(20) NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of role_permission
-- ----------------------------
INSERT INTO `role_permission` VALUES (1, 5);
INSERT INTO `role_permission` VALUES (1, 6);
INSERT INTO `role_permission` VALUES (1, 7);
INSERT INTO `role_permission` VALUES (1, 8);
INSERT INTO `role_permission` VALUES (2, 6);
INSERT INTO `role_permission` VALUES (2, 2);

SET FOREIGN_KEY_CHECKS = 1;
