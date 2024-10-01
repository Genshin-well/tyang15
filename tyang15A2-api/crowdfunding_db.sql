SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for category
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category`  (
  `CATEGORY_ID` int(11) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`CATEGORY_ID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of category
-- ----------------------------
INSERT INTO `category` VALUES (1, 'Technology');
INSERT INTO `category` VALUES (2, 'Environment');
INSERT INTO `category` VALUES (3, 'Arts & Culture');

-- ----------------------------
-- Table structure for fundraiser
-- ----------------------------
DROP TABLE IF EXISTS `fundraiser`;
CREATE TABLE `fundraiser`  (
  `FUNDRAISER_ID` int(11) NOT NULL AUTO_INCREMENT,
  `ORGANIZER` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `CAPTION` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TARGET_FUNDING` decimal(10, 2) NOT NULL,
  `CURRENT_FUNDING` decimal(10, 2) NOT NULL,
  `CITY` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `ACTIVE` tinyint(1) NOT NULL,
  `CATEGORY_ID` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`FUNDRAISER_ID`) USING BTREE,
  INDEX `CATEGORY_ID`(`CATEGORY_ID`) USING BTREE,
  CONSTRAINT `fundraiser_ibfk_1` FOREIGN KEY (`CATEGORY_ID`) REFERENCES `category` (`CATEGORY_ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of fundraiser
-- ----------------------------
INSERT INTO `fundraiser` VALUES (1, 'Tech Hub', 'Develop an AI App for Healthcare', 45000.00, 15000.50, 'Alice Springs', 1, 1);
INSERT INTO `fundraiser` VALUES (2, 'Clean Rivers Project', 'Remove Plastic from Urban Rivers', 28000.00, 18500.75, 'Darwin', 1, 2);
INSERT INTO `fundraiser` VALUES (3, 'Art for Change', 'Host a Citywide Art Fair', 32000.00, 13000.00, 'Cairns', 1, 3);
INSERT INTO `fundraiser` VALUES (4, 'Fashion Revolution', 'Promote Sustainable Clothing', 14000.00, 7800.00, 'Newcastle', 1, 2);
INSERT INTO `fundraiser` VALUES (5, 'Youth Music Festival', 'Organize an Annual Music Event', 21000.00, 12500.10, 'Wollongong', 1, 3);

SET FOREIGN_KEY_CHECKS = 1;
