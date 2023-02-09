/*
 Navicat Premium Data Transfer

 Source Server         : bulkrewad_con
 Source Server Type    : MySQL
 Source Server Version : 100422
 Source Host           : localhost:3306
 Source Schema         : hikari_learning

 Target Server Type    : MySQL
 Target Server Version : 100422
 File Encoding         : 65001

 Date: 09/02/2023 14:23:41
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for exercise
-- ----------------------------
DROP TABLE IF EXISTS `exercise`;
CREATE TABLE `exercise`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `exercise_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `created_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `created_date` datetime NULL DEFAULT NULL,
  `last_modified_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `last_modified_date` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 39 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of exercise
-- ----------------------------
INSERT INTO `exercise` VALUES (26, 'latihan kondisional', 'latihan if', '1', '2022-11-26 03:59:37', '1', '2022-11-26 03:59:37');
INSERT INTO `exercise` VALUES (27, 'Latihan kondisional 2', 'latihan untuk UTS', '1', '2022-11-26 05:50:49', '1', '2022-11-26 05:50:49');
INSERT INTO `exercise` VALUES (28, 'latihan pertemuan pertama', 'kondisional standar', '39', '2022-11-26 12:28:08', '39', '2022-11-26 12:28:08');
INSERT INTO `exercise` VALUES (29, 'general exercise', 'for all student ', '13', '2022-12-01 06:01:05', '13', '2022-12-01 06:01:05');
INSERT INTO `exercise` VALUES (30, 'Latihan untuk hari ini', 'ada lah', '13', '2022-12-08 07:57:20', '13', '2022-12-08 07:57:20');
INSERT INTO `exercise` VALUES (31, 'test', 'test logik', '39', '2022-12-09 04:15:59', '39', '2022-12-09 04:15:59');
INSERT INTO `exercise` VALUES (32, 'ini baru', 'baru', '39', '2022-12-09 10:12:58', '39', '2022-12-09 10:12:58');
INSERT INTO `exercise` VALUES (33, 'Exercise ke-1', 'Latihan Kondisional', '39', '2022-12-14 14:04:21', '39', '2022-12-14 14:04:21');
INSERT INTO `exercise` VALUES (34, 'Exercise ke-2', 'Latihan Sequential', '39', '2022-12-14 14:09:19', '39', '2022-12-14 14:09:19');
INSERT INTO `exercise` VALUES (35, '1', '1', '38', '2022-12-14 14:34:33', '38', '2022-12-14 14:34:33');
INSERT INTO `exercise` VALUES (36, 'bahasa c', 'cob', '39', '2022-12-18 09:53:24', '39', '2022-12-18 09:53:24');
INSERT INTO `exercise` VALUES (37, 'test 2', 'test', '39', '2022-12-24 15:00:43', '39', '2022-12-24 15:00:43');
INSERT INTO `exercise` VALUES (38, 'Latihan dari instruktur 1', 'latihan koindisional dan sequential', '1', '2023-02-03 04:28:36', '1', '2023-02-03 04:28:36');

-- ----------------------------
-- Table structure for exercise_answer
-- ----------------------------
DROP TABLE IF EXISTS `exercise_answer`;
CREATE TABLE `exercise_answer`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `no_index` int NULL DEFAULT NULL,
  `exercise_id` int NULL DEFAULT NULL,
  `generate_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `code` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `answer` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `created_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `created_date` datetime NULL DEFAULT NULL,
  `last_modified_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `last_modified_date` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FKhj9h1bqhlofn78ul0yx90p99u`(`exercise_id`) USING BTREE,
  CONSTRAINT `FKhj9h1bqhlofn78ul0yx90p99u` FOREIGN KEY (`exercise_id`) REFERENCES `exercise` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 391 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of exercise_answer
-- ----------------------------
INSERT INTO `exercise_answer` VALUES (290, 1, 26, 'c496ad46-e933-4238-998d-5b1241d25fff', 'class Program{\n    public static void main(String[]args){\n      int a =19;\n      int b = 7;\n      int c = a+b;\n      if(a<b){\n        System.out.println(b);\n      }else{\n        System.out.println(c);  \n      }\n      \n    }\n} ', '26\n', '1', '2022-11-26 03:59:53', '1', '2022-11-26 03:59:53');
INSERT INTO `exercise_answer` VALUES (291, 2, 26, 'c496ad46-e933-4238-998d-5b1241d25fff', 'class Program{\n    public static void main(String[]args){\n      int a =23;\n      int b = 12;\n      int c = a+b;\n      if(a<b){\n        System.out.println(b);\n      }else{\n        System.out.println(c);  \n      }\n      \n    }\n} ', '35\n', '1', '2022-11-26 03:59:54', '1', '2022-11-26 03:59:54');
INSERT INTO `exercise_answer` VALUES (292, 3, 26, 'c496ad46-e933-4238-998d-5b1241d25fff', 'class Program{\n    public static void main(String[]args){\n      int a =8;\n      int b = 2;\n      int c = a+b;\n      if(a<b){\n        System.out.println(b);\n      }else{\n        System.out.println(c);  \n      }\n      \n    }\n} ', '10\n', '1', '2022-11-26 03:59:54', '1', '2022-11-26 03:59:54');
INSERT INTO `exercise_answer` VALUES (293, 4, 26, 'c496ad46-e933-4238-998d-5b1241d25fff', 'class Program{\n    public static void main(String[]args){\n      int a =16;\n      int b = 13;\n      int c = a+b;\n      if(a<b){\n        System.out.println(b);\n      }else{\n        System.out.println(c);  \n      }\n      \n    }\n} ', '29\n', '1', '2022-11-26 03:59:55', '1', '2022-11-26 03:59:55');
INSERT INTO `exercise_answer` VALUES (294, 7, 26, 'c496ad46-e933-4238-998d-5b1241d25fff', 'class Program{\n    public static void main(String[]args){\n      int a =17;\n      int b = 23;\n      int c = a+b;\n      if(a<b){\n        System.out.println(b);\n      }else{\n        System.out.println(c);  \n      }\n      \n    }\n} ', '23\n', '1', '2022-11-26 04:00:00', '1', '2022-11-26 04:00:00');
INSERT INTO `exercise_answer` VALUES (295, 5, 26, 'c496ad46-e933-4238-998d-5b1241d25fff', 'class Program{\n    public static void main(String[]args){\n      int a =2;\n      int b = 25;\n      int c = a+b;\n      if(a<b){\n        System.out.println(b);\n      }else{\n        System.out.println(c);  \n      }\n      \n    }\n} ', '25\n', '1', '2022-11-26 04:00:00', '1', '2022-11-26 04:00:00');
INSERT INTO `exercise_answer` VALUES (296, 6, 26, 'c496ad46-e933-4238-998d-5b1241d25fff', 'class Program{\n    public static void main(String[]args){\n      int a =22;\n      int b = 5;\n      int c = a+b;\n      if(a<b){\n        System.out.println(b);\n      }else{\n        System.out.println(c);  \n      }\n      \n    }\n} ', '27\n', '1', '2022-11-26 04:00:00', '1', '2022-11-26 04:00:00');
INSERT INTO `exercise_answer` VALUES (297, 9, 26, 'c496ad46-e933-4238-998d-5b1241d25fff', 'class Program{\n    public static void main(String[]args){\n      int a =24;\n      int b = 26;\n      int c = a+b;\n      if(a<b){\n        System.out.println(b);\n      }else{\n        System.out.println(c);  \n      }\n      \n    }\n} ', '26\n', '1', '2022-11-26 04:00:04', '1', '2022-11-26 04:00:04');
INSERT INTO `exercise_answer` VALUES (298, 10, 26, 'c496ad46-e933-4238-998d-5b1241d25fff', 'class Program{\n    public static void main(String[]args){\n      int a =3;\n      int b = 4;\n      int c = a+b;\n      if(a<b){\n        System.out.println(b);\n      }else{\n        System.out.println(c);  \n      }\n      \n    }\n} ', '4\n', '1', '2022-11-26 04:00:04', '1', '2022-11-26 04:00:04');
INSERT INTO `exercise_answer` VALUES (299, 8, 26, 'c496ad46-e933-4238-998d-5b1241d25fff', 'class Program{\n    public static void main(String[]args){\n      int a =17;\n      int b = 21;\n      int c = a+b;\n      if(a<b){\n        System.out.println(b);\n      }else{\n        System.out.println(c);  \n      }\n      \n    }\n} ', '21\n', '1', '2022-11-26 04:00:04', '1', '2022-11-26 04:00:04');
INSERT INTO `exercise_answer` VALUES (300, 11, 26, 'c496ad46-e933-4238-998d-5b1241d25fff', 'class Program{\n    public static void main(String[]args){\n      int a =7;\n      int b = 13;\n      int c = a+b;\n      if(a<b){\n        System.out.println(b);\n      }else{\n        System.out.println(c);  \n      }\n      \n    }\n} ', '13\n', '1', '2022-11-26 04:00:08', '1', '2022-11-26 04:00:08');
INSERT INTO `exercise_answer` VALUES (301, 12, 26, 'c496ad46-e933-4238-998d-5b1241d25fff', 'class Program{\n    public static void main(String[]args){\n      int a =18;\n      int b = 12;\n      int c = a+b;\n      if(a<b){\n        System.out.println(b);\n      }else{\n        System.out.println(c);  \n      }\n      \n    }\n} ', '30\n', '1', '2022-11-26 04:00:08', '1', '2022-11-26 04:00:08');
INSERT INTO `exercise_answer` VALUES (302, 13, 26, 'c496ad46-e933-4238-998d-5b1241d25fff', 'class Program{\n    public static void main(String[]args){\n      int a =1;\n      int b = 11;\n      int c = a+b;\n      if(a<b){\n        System.out.println(b);\n      }else{\n        System.out.println(c);  \n      }\n      \n    }\n} ', '11\n', '1', '2022-11-26 04:00:09', '1', '2022-11-26 04:00:09');
INSERT INTO `exercise_answer` VALUES (303, 15, 26, 'c496ad46-e933-4238-998d-5b1241d25fff', 'class Program{\n    public static void main(String[]args){\n      int a =18;\n      int b = 29;\n      int c = a+b;\n      if(a<b){\n        System.out.println(b);\n      }else{\n        System.out.println(c);  \n      }\n      \n    }\n} ', '29\n', '1', '2022-11-26 04:00:13', '1', '2022-11-26 04:00:13');
INSERT INTO `exercise_answer` VALUES (304, 14, 26, 'c496ad46-e933-4238-998d-5b1241d25fff', 'class Program{\n    public static void main(String[]args){\n      int a =11;\n      int b = 13;\n      int c = a+b;\n      if(a<b){\n        System.out.println(b);\n      }else{\n        System.out.println(c);  \n      }\n      \n    }\n} ', '13\n', '1', '2022-11-26 04:00:13', '1', '2022-11-26 04:00:13');
INSERT INTO `exercise_answer` VALUES (305, 16, 26, 'c496ad46-e933-4238-998d-5b1241d25fff', 'class Program{\n    public static void main(String[]args){\n      int a =3;\n      int b = 13;\n      int c = a+b;\n      if(a<b){\n        System.out.println(b);\n      }else{\n        System.out.println(c);  \n      }\n      \n    }\n} ', '13\n', '1', '2022-11-26 04:00:13', '1', '2022-11-26 04:00:13');
INSERT INTO `exercise_answer` VALUES (306, 1, 28, '0b6d1b96-e83a-4b45-94a4-0417c6c87f58', 'class Program{\n    public static void main(String[]args){\n      String word = \"delicate\";\n      String word1 = \"Yosh\";\n      if(word.equals(word1)){\n          System.out.println(11);\n      }else{\n        System.out.println(\"deal\");\n      }\n        \n    }\n} ', 'deal\r\n', '39', '2022-11-26 12:41:39', '39', '2022-11-26 12:41:39');
INSERT INTO `exercise_answer` VALUES (307, 2, 28, '0b6d1b96-e83a-4b45-94a4-0417c6c87f58', 'class Program{\n    public static void main(String[]args){\n      String word = \"Hi\";\n      String word1 = \"Buff\";\n      if(word.equals(word1)){\n          System.out.println(21);\n      }else{\n        System.out.println(\"bean\");\n      }\n        \n    }\n} ', 'bean\r\n', '39', '2022-11-26 12:41:40', '39', '2022-11-26 12:41:40');
INSERT INTO `exercise_answer` VALUES (308, 3, 28, '0b6d1b96-e83a-4b45-94a4-0417c6c87f58', 'class Program{\n    public static void main(String[]args){\n      int angka = 14;\n      String a  = \"bang\";\n      if(angka-3){\n        System.out.println(angka);\n      }else{\n        System.out.println(\"sour\");\n      }\n        \n    }\n} ', 'bean', '39', '2022-11-26 12:41:39', '39', '2022-11-26 12:41:39');
INSERT INTO `exercise_answer` VALUES (309, 4, 28, '0b6d1b96-e83a-4b45-94a4-0417c6c87f58', 'class Program{\n    public static void main(String[]args){\n      int angka = 1;\n      String a  = \"fax\";\n      if(angka-3){\n        System.out.println(angka);\n      }else{\n        System.out.println(\"fun\");\n      }\n        \n    }\n} ', 'bean', '39', '2022-11-26 12:41:40', '39', '2022-11-26 12:41:40');
INSERT INTO `exercise_answer` VALUES (310, 1, 29, 'b0b6fbb3-5091-4772-abe8-271f130b6ccd', 'class Program{\n    public static void main(String[]args){\n      int a =5;\n      int b = 26;\n      int c = a+b;\n      if(a<b){\n        System.out.println(b);\n      }else{\n        System.out.println(c);  \n      }\n      \n    }\n} ', '26\r\n', '13', '2022-12-01 06:02:11', '13', '2022-12-01 06:02:11');
INSERT INTO `exercise_answer` VALUES (311, 3, 29, 'b0b6fbb3-5091-4772-abe8-271f130b6ccd', 'class Program{\n    public static void main(String[]args){\n      int a =8;\n      int b = 16;\n      int c = a+b;\n      if(a<b){\n        System.out.println(b);\n      }else{\n        System.out.println(c);  \n      }\n      \n    }\n} ', '16\r\n', '13', '2022-12-01 06:02:11', '13', '2022-12-01 06:02:11');
INSERT INTO `exercise_answer` VALUES (312, 2, 29, 'b0b6fbb3-5091-4772-abe8-271f130b6ccd', 'class Program{\n    public static void main(String[]args){\n      int a =18;\n      int b = 11;\n      int c = a+b;\n      if(a<b){\n        System.out.println(b);\n      }else{\n        System.out.println(c);  \n      }\n      \n    }\n} ', '29\r\n', '13', '2022-12-01 06:02:11', '13', '2022-12-01 06:02:11');
INSERT INTO `exercise_answer` VALUES (313, 4, 29, 'b0b6fbb3-5091-4772-abe8-271f130b6ccd', 'class Program{\n    public static void main(String[]args){\n      int angka = 17;\n      int angka2 = 5;\n\n      if(angka>angka2){\n        System.out.println(\"Buff\");\n      }else{\n        System.out.println(\"deal\");\n      }\n        \n    }\n} ', 'Buff\r\n', '13', '2022-12-01 06:02:12', '13', '2022-12-01 06:02:12');
INSERT INTO `exercise_answer` VALUES (314, 5, 29, 'b0b6fbb3-5091-4772-abe8-271f130b6ccd', 'class Program{\n    public static void main(String[]args){\n      int angka = 16;\n      int angka2 = 28;\n\n      if(angka<=angka2){\n        System.out.println(\"hotdog\");\n      }else{\n        System.out.println(\"archive\");\n      }\n        \n    }\n} ', 'hotdog\r\n', '13', '2022-12-01 06:02:12', '13', '2022-12-01 06:02:12');
INSERT INTO `exercise_answer` VALUES (315, 3, 28, 'c319b71b-078c-4e0d-bfe6-ad2c87c35b3e', 'class Program{\n    public static void main(String[]args){\n      int angka = 6;\n      String a  = \"delicate\";\n      if(angka-17){\n        System.out.println(angka);\n      }else{\n        System.out.println(\"concentrate\");\n      }\n        \n    }\n} ', '17', '39', '2022-12-08 06:27:44', '39', '2022-12-08 06:27:44');
INSERT INTO `exercise_answer` VALUES (316, 1, 28, 'c319b71b-078c-4e0d-bfe6-ad2c87c35b3e', 'class Program{\n    public static void main(String[]args){\n      String word = \"relaxation\";\n      String word1 = \"Wooz\";\n      if(word.equals(word1)){\n          System.out.println(4);\n      }else{\n        System.out.println(\"delicate\");\n      }\n        \n    }\n} ', 'delicate\r\n', '39', '2022-12-08 06:27:44', '39', '2022-12-08 06:27:44');
INSERT INTO `exercise_answer` VALUES (317, 2, 28, 'c319b71b-078c-4e0d-bfe6-ad2c87c35b3e', 'class Program{\n    public static void main(String[]args){\n      String word = \"Huzzzzzz\";\n      String word1 = \"Buff\";\n      if(word.equals(word1)){\n          System.out.println(23);\n      }else{\n        System.out.println(\"fun\");\n      }\n        \n    }\n} ', 'fun\r\n', '39', '2022-12-08 06:27:44', '39', '2022-12-08 06:27:44');
INSERT INTO `exercise_answer` VALUES (318, 4, 28, 'c319b71b-078c-4e0d-bfe6-ad2c87c35b3e', 'class Program{\n    public static void main(String[]args){\n      int angka = 17;\n      String a  = \"Huzzzzzz\";\n      if(angka+27){\n        System.out.println(angka);\n      }else{\n        System.out.println(\"ministry\");\n      }\n        \n    }\n} ', '27', '39', '2022-12-08 06:27:45', '39', '2022-12-08 06:27:45');
INSERT INTO `exercise_answer` VALUES (319, 1, 31, 'b55e92f4-16d0-43b3-8e94-7e492ac6f623', 'class Program{\n    public static void main(String[]args){\n      int a =11;\n      int b = 2;\n      int c = a+b;\n      if(a<b){\n        System.out.println(b);\n      }else{\n        System.out.println(c);  \n      }\n      \n    }\n} ', '13\r\n', '39', '2022-12-09 04:16:05', '39', '2022-12-09 04:16:05');
INSERT INTO `exercise_answer` VALUES (320, 2, 31, 'b55e92f4-16d0-43b3-8e94-7e492ac6f623', 'class Program{\n    public static void main(String[]args){\n      int a =28;\n      int b = 1;\n      int c = a+b;\n      if(a<b){\n        System.out.println(b);\n      }else{\n        System.out.println(c);  \n      }\n      \n    }\n} ', '29\r\n', '39', '2022-12-09 04:16:05', '39', '2022-12-09 04:16:05');
INSERT INTO `exercise_answer` VALUES (321, 3, 31, 'b55e92f4-16d0-43b3-8e94-7e492ac6f623', 'class Program{\n    public static void main(String[]args){\n      int a =26;\n      int b = 9;\n      int c = a+b;\n      if(a<b){\n        System.out.println(b);\n      }else{\n        System.out.println(c);  \n      }\n      \n    }\n} ', '35\r\n', '39', '2022-12-09 04:16:05', '39', '2022-12-09 04:16:05');
INSERT INTO `exercise_answer` VALUES (322, 4, 31, 'b55e92f4-16d0-43b3-8e94-7e492ac6f623', 'class Program{\n    public static void main(String[]args){\n      String word = \"deal\";\n      String word1 = \"item\";\n      if(word.equals(word1)){\n          System.out.println(28);\n      }else{\n        System.out.println(\"Yosh\");\n      }\n        \n    }\n} ', 'Yosh\r\n', '39', '2022-12-09 04:16:07', '39', '2022-12-09 04:16:07');
INSERT INTO `exercise_answer` VALUES (323, 6, 31, 'b55e92f4-16d0-43b3-8e94-7e492ac6f623', 'class Program{\n    public static void main(String[]args){\n      String word = \"concentrate\";\n      String word1 = \"figure\";\n      if(word.equals(word1)){\n          System.out.println(14);\n      }else{\n        System.out.println(\"item\");\n      }\n        \n    }\n} ', 'item\r\n', '39', '2022-12-09 04:16:07', '39', '2022-12-09 04:16:07');
INSERT INTO `exercise_answer` VALUES (324, 5, 31, 'b55e92f4-16d0-43b3-8e94-7e492ac6f623', 'class Program{\n    public static void main(String[]args){\n      String word = \"Yosh\";\n      String word1 = \"hotdog\";\n      if(word.equals(word1)){\n          System.out.println(19);\n      }else{\n        System.out.println(\"want\");\n      }\n        \n    }\n} ', 'want\r\n', '39', '2022-12-09 04:16:08', '39', '2022-12-09 04:16:08');
INSERT INTO `exercise_answer` VALUES (325, 2, 31, 'cb74a403-090a-4d11-bb0f-3ce09a888330', 'class Program{\n    public static void main(String[]args){\n      int a =15;\n      int b = 27;\n      int c = a+b;\n      if(a<b){\n        System.out.println(b);\n      }else{\n        System.out.println(c);  \n      }\n      \n    }\n} ', '27\r\n', '39', '2022-12-09 04:16:50', '39', '2022-12-09 04:16:50');
INSERT INTO `exercise_answer` VALUES (326, 3, 31, 'cb74a403-090a-4d11-bb0f-3ce09a888330', 'class Program{\n    public static void main(String[]args){\n      int a =22;\n      int b = 2;\n      int c = a+b;\n      if(a<b){\n        System.out.println(b);\n      }else{\n        System.out.println(c);  \n      }\n      \n    }\n} ', '24\r\n', '39', '2022-12-09 04:16:50', '39', '2022-12-09 04:16:50');
INSERT INTO `exercise_answer` VALUES (327, 1, 31, 'cb74a403-090a-4d11-bb0f-3ce09a888330', 'class Program{\n    public static void main(String[]args){\n      int a =7;\n      int b = 2;\n      int c = a+b;\n      if(a<b){\n        System.out.println(b);\n      }else{\n        System.out.println(c);  \n      }\n      \n    }\n} ', '9\r\n', '39', '2022-12-09 04:16:50', '39', '2022-12-09 04:16:50');
INSERT INTO `exercise_answer` VALUES (328, 4, 31, 'cb74a403-090a-4d11-bb0f-3ce09a888330', 'class Program{\n    public static void main(String[]args){\n      String word = \"bang\";\n      String word1 = \"Buff\";\n      if(word.equals(word1)){\n          System.out.println(19);\n      }else{\n        System.out.println(\"hotdog\");\n      }\n        \n    }\n} ', 'hotdog\r\n', '39', '2022-12-09 04:16:53', '39', '2022-12-09 04:16:53');
INSERT INTO `exercise_answer` VALUES (329, 5, 31, 'cb74a403-090a-4d11-bb0f-3ce09a888330', 'class Program{\n    public static void main(String[]args){\n      String word = \"Buff\";\n      String word1 = \"reflect\";\n      if(word.equals(word1)){\n          System.out.println(1);\n      }else{\n        System.out.println(\"Buff\");\n      }\n        \n    }\n} ', 'Buff\r\n', '39', '2022-12-09 04:16:53', '39', '2022-12-09 04:16:53');
INSERT INTO `exercise_answer` VALUES (330, 6, 31, 'cb74a403-090a-4d11-bb0f-3ce09a888330', 'class Program{\n    public static void main(String[]args){\n      String word = \"figure\";\n      String word1 = \"relaxation\";\n      if(word.equals(word1)){\n          System.out.println(29);\n      }else{\n        System.out.println(\"law\");\n      }\n        \n    }\n} ', 'law\r\n', '39', '2022-12-09 04:16:53', '39', '2022-12-09 04:16:53');
INSERT INTO `exercise_answer` VALUES (331, 3, 32, 'cdc6ff86-9584-4934-b86c-bec13df95b43', 'class Program{\n    public static void main(String[]args){\n      int angka = 18;\n      String a  = \"Hello\";\n      if(angka-8>=25){\n        System.out.println(angka);\n      }else{\n        System.out.println(\"ministry\");\n      }\n        \n    }\n} ', 'ministry\r\n', '39', '2022-12-09 10:13:04', '39', '2022-12-09 10:13:04');
INSERT INTO `exercise_answer` VALUES (332, 1, 32, 'cdc6ff86-9584-4934-b86c-bec13df95b43', 'class Program{\n    public static void main(String[]args){\n      int angka = 9;\n      String a  = \"hotdog\";\n      if(angka+8>9){\n        System.out.println(angka);\n      }else{\n        System.out.println(\"Hello\");\n      }\n        \n    }\n} ', '9\r\n', '39', '2022-12-09 10:13:04', '39', '2022-12-09 10:13:04');
INSERT INTO `exercise_answer` VALUES (333, 2, 32, 'cdc6ff86-9584-4934-b86c-bec13df95b43', 'class Program{\n    public static void main(String[]args){\n      int angka = 4;\n      String a  = \"law\";\n      if(angka+14<=7){\n        System.out.println(angka);\n      }else{\n        System.out.println(\"law\");\n      }\n        \n    }\n} ', 'law\r\n', '39', '2022-12-09 10:13:04', '39', '2022-12-09 10:13:04');
INSERT INTO `exercise_answer` VALUES (334, 4, 32, 'cdc6ff86-9584-4934-b86c-bec13df95b43', 'class Program{\n    public static void main(String[]args){\n      int angka = 19;\n      String a  = \"Huzzzzzz\";\n      if(angka-22>14){\n        System.out.println(angka);\n      }else{\n        System.out.println(\"delicate\");\n      }\n        \n    }\n} ', 'delicate\r\n', '39', '2022-12-09 10:13:06', '39', '2022-12-09 10:13:06');
INSERT INTO `exercise_answer` VALUES (335, 5, 32, 'cdc6ff86-9584-4934-b86c-bec13df95b43', 'class Program{\n    public static void main(String[]args){\n      int angka = 11;\n      String a  = \"Wooz\";\n      if(angka-20==3){\n        System.out.println(angka);\n      }else{\n        System.out.println(\"law\");\n      }\n        \n    }\n} ', 'law\r\n', '39', '2022-12-09 10:13:06', '39', '2022-12-09 10:13:06');
INSERT INTO `exercise_answer` VALUES (336, 1, 32, '65bbf313-2309-47b3-88f6-3ccf9d2d8576', 'class Program{\n    public static void main(String[]args){\n      int angka = 9;\n      String a  = \"Yosh\";\n      if(angka+19!=16){\n        System.out.println(angka);\n      }else{\n        System.out.println(\"bang\");\n      }\n        \n    }\n} ', '9\r\n', '39', '2022-12-10 08:06:56', '39', '2022-12-10 08:06:56');
INSERT INTO `exercise_answer` VALUES (337, 2, 32, '65bbf313-2309-47b3-88f6-3ccf9d2d8576', 'class Program{\n    public static void main(String[]args){\n      int angka = 5;\n      String a  = \"Yosh\";\n      if(angka-18!=23){\n        System.out.println(angka);\n      }else{\n        System.out.println(\"item\");\n      }\n        \n    }\n} ', '5\r\n', '39', '2022-12-10 08:06:56', '39', '2022-12-10 08:06:56');
INSERT INTO `exercise_answer` VALUES (338, 3, 32, '65bbf313-2309-47b3-88f6-3ccf9d2d8576', 'class Program{\n    public static void main(String[]args){\n      int angka = 12;\n      String a  = \"Wooz\";\n      if(angka-6<=10){\n        System.out.println(angka);\n      }else{\n        System.out.println(\"Buff\");\n      }\n        \n    }\n} ', '12\r\n', '39', '2022-12-10 08:06:56', '39', '2022-12-10 08:06:56');
INSERT INTO `exercise_answer` VALUES (339, 4, 32, '65bbf313-2309-47b3-88f6-3ccf9d2d8576', 'class Program{\n    public static void main(String[]args){\n      int angka = 24;\n      String a  = \"bang\";\n      if(angka+10==1){\n        System.out.println(angka);\n      }else{\n        System.out.println(\"Huzzzzzz\");\n      }\n        \n    }\n} ', 'Huzzzzzz\r\n', '39', '2022-12-10 08:06:59', '39', '2022-12-10 08:06:59');
INSERT INTO `exercise_answer` VALUES (340, 5, 32, '65bbf313-2309-47b3-88f6-3ccf9d2d8576', 'class Program{\n    public static void main(String[]args){\n      int angka = 16;\n      String a  = \"concentrate\";\n      if(angka+9<=20){\n        System.out.println(angka);\n      }else{\n        System.out.println(\"sour\");\n      }\n        \n    }\n} ', 'sour\r\n', '39', '2022-12-10 08:06:59', '39', '2022-12-10 08:06:59');
INSERT INTO `exercise_answer` VALUES (341, 2, 33, '6e1a88aa-479b-41d0-ab31-b456e77314c3', 'class Program{\n    public static void main(String[]args){\n      if((22<14)||(12!=19))\n        System.out.println(\"Hello\");\n      else\n        System.out.println(\"buy\");\n      \n    }\n} ', 'Hello\r\n', '39', '2022-12-14 14:05:12', '39', '2022-12-14 14:05:12');
INSERT INTO `exercise_answer` VALUES (342, 3, 33, '6e1a88aa-479b-41d0-ab31-b456e77314c3', 'class Program{\n    public static void main(String[]args){\n      if((2>=2)&&(29==22))\n        System.out.println(\"Buff\");\n      else\n        System.out.println(\"Hello\");\n      \n    }\n} ', 'Hello\r\n', '39', '2022-12-14 14:05:12', '39', '2022-12-14 14:05:12');
INSERT INTO `exercise_answer` VALUES (343, 1, 33, '6e1a88aa-479b-41d0-ab31-b456e77314c3', 'class Program{\n    public static void main(String[]args){\n      if((11>9)&&(18<4))\n        System.out.println(\"ministry\");\n      else\n        System.out.println(\"bang\");\n      \n    }\n} ', 'bang\r\n', '39', '2022-12-14 14:05:12', '39', '2022-12-14 14:05:12');
INSERT INTO `exercise_answer` VALUES (344, 4, 33, '6e1a88aa-479b-41d0-ab31-b456e77314c3', 'class Program{\n    public static void main(String[]args){\n      if((25<=28)&&(4<6))\n        System.out.println(\"relaxation\");\n      else\n        System.out.println(\"memorial\");\n      \n    }\n} ', 'relaxation\r\n', '39', '2022-12-14 14:05:14', '39', '2022-12-14 14:05:14');
INSERT INTO `exercise_answer` VALUES (345, 5, 33, '6e1a88aa-479b-41d0-ab31-b456e77314c3', 'class Program{\n    public static void main(String[]args){\n      if((17==5)||(1<=22))\n        System.out.println(\"memorial\");\n      else\n        System.out.println(\"Huzzzzzz\");\n      \n    }\n} ', 'memorial\r\n', '39', '2022-12-14 14:05:14', '39', '2022-12-14 14:05:14');
INSERT INTO `exercise_answer` VALUES (346, 6, 33, '6e1a88aa-479b-41d0-ab31-b456e77314c3', 'class Program{\n    public static void main(String[]args){\n      String word = \"relaxation\";\n      String word1 = \"Hi\";\n      if(word.equals(word1)){\n          System.out.println(2);\n      }else{\n        System.out.println(\"bean\");\n      }\n        \n    }\n} ', 'bean\r\n', '39', '2022-12-14 14:05:14', '39', '2022-12-14 14:05:14');
INSERT INTO `exercise_answer` VALUES (347, 1, 34, 'd5836d08-fdc2-456b-8f01-ada923e9823a', 'class Program{\n    public static void main(String[]args){\n      int angka = 8;\n      String a  = \"Hello\";\n      if(angka-20<=25){\n        System.out.println(angka);\n      }else{\n        System.out.println(\"sour\");\n      }\n        \n    }\n} ', '8\r\n', '39', '2022-12-14 14:09:32', '39', '2022-12-14 14:09:32');
INSERT INTO `exercise_answer` VALUES (348, 2, 34, 'd5836d08-fdc2-456b-8f01-ada923e9823a', 'class Program{\n    public static void main(String[]args){\n      int angka = 21;\n      String a  = \"want\";\n      if(angka-20>12){\n        System.out.println(angka);\n      }else{\n        System.out.println(\"advocate\");\n      }\n        \n    }\n} ', 'advocate\r\n', '39', '2022-12-14 14:09:32', '39', '2022-12-14 14:09:32');
INSERT INTO `exercise_answer` VALUES (349, 3, 34, 'd5836d08-fdc2-456b-8f01-ada923e9823a', 'class Program{\n    public static void main(String[]args){\n      int angka = 23;\n      String a  = \"sour\";\n      if(angka+24>11){\n        System.out.println(angka);\n      }else{\n        System.out.println(\"fax\");\n      }\n        \n    }\n} ', '23\r\n', '39', '2022-12-14 14:09:32', '39', '2022-12-14 14:09:32');
INSERT INTO `exercise_answer` VALUES (350, 4, 34, 'd5836d08-fdc2-456b-8f01-ada923e9823a', 'class Program{\n    public static void main(String[]args){\n      int angka = 2;\n      String a  = \"relaxation\";\n      if(angka-6>=8){\n        System.out.println(angka);\n      }else{\n        System.out.println(\"relaxation\");\n      }\n        \n    }\n} ', 'relaxation\r\n', '39', '2022-12-14 14:09:34', '39', '2022-12-14 14:09:34');
INSERT INTO `exercise_answer` VALUES (351, 5, 34, 'd5836d08-fdc2-456b-8f01-ada923e9823a', 'class Program{\n    public static void main(String[]args){\n      int angka = 2;\n      String a  = \"sour\";\n      if(angka-7!=19){\n        System.out.println(angka);\n      }else{\n        System.out.println(\"hotdog\");\n      }\n        \n    }\n} ', '2\r\n', '39', '2022-12-14 14:09:34', '39', '2022-12-14 14:09:34');
INSERT INTO `exercise_answer` VALUES (352, 3, 35, '8654669c-ac26-407c-9b20-66d264b3c8a3', 'class Program{\n    public static void main(String[]args){\n      if((13>19)||(26==22))\n        System.out.println(\"Huzzzzzz\");\n      else\n        System.out.println(\"Hi\");\n      \n    }\n} ', 'Hi\r\n', '38', '2022-12-14 14:34:38', '38', '2022-12-14 14:34:38');
INSERT INTO `exercise_answer` VALUES (353, 2, 35, '8654669c-ac26-407c-9b20-66d264b3c8a3', 'class Program{\n    public static void main(String[]args){\n      if((18>13)&&(5<26))\n        System.out.println(\"want\");\n      else\n        System.out.println(\"relaxation\");\n      \n    }\n} ', 'want\r\n', '38', '2022-12-14 14:34:38', '38', '2022-12-14 14:34:38');
INSERT INTO `exercise_answer` VALUES (354, 1, 35, '8654669c-ac26-407c-9b20-66d264b3c8a3', 'class Program{\n    public static void main(String[]args){\n      if((19==1)&&(24>=27))\n        System.out.println(\"reflect\");\n      else\n        System.out.println(\"delicate\");\n      \n    }\n} ', 'delicate\r\n', '38', '2022-12-14 14:34:38', '38', '2022-12-14 14:34:38');
INSERT INTO `exercise_answer` VALUES (355, 3, 36, 'd6d0170e-7604-42ee-a665-cfb715be78bd', '#include<stdio.h>\n    int main(){\n        int firstNumber=3;\n        int secondNumber=14;\n        int thirdNumber=18;\n        if(firstNumber!=thirdNumber){\n            int sum = firstNumber+thirdNumber-secondNumber;\n            printf(\"%d\",sum);\n        }else if(secondNumber!=thirdNumber){\n            printf(\"%d\",thirdNumber);\n        }else{\n            printf(\"%d\",secondNumber);\n        }\n        \n    }\n', '7', '39', '2022-12-18 09:53:40', '39', '2022-12-18 09:53:40');
INSERT INTO `exercise_answer` VALUES (356, 1, 36, 'd6d0170e-7604-42ee-a665-cfb715be78bd', '#include<stdio.h>\n    int main(){\n        for(int i=0;i<10;i++){\n            printf(\"%d\",i);\n        }\n    }\n', '0123456789', '39', '2022-12-18 09:53:40', '39', '2022-12-18 09:53:40');
INSERT INTO `exercise_answer` VALUES (357, 2, 36, 'd6d0170e-7604-42ee-a665-cfb715be78bd', '#include<stdio.h>\n    int main(){\n        for(int i=0;i<10;i++){\n            printf(\"%d\",i);\n        }\n    }\n', '0123456789', '39', '2022-12-18 09:53:40', '39', '2022-12-18 09:53:40');
INSERT INTO `exercise_answer` VALUES (358, 4, 36, 'd6d0170e-7604-42ee-a665-cfb715be78bd', '#include<stdio.h>\n    int main(){\n        int firstNumber=15;\n        int secondNumber=25;\n        int thirdNumber=4;\n        if(firstNumber<thirdNumber){\n            int sum = firstNumber+thirdNumber-secondNumber;\n            printf(\"%d\",sum);\n        }else if(secondNumber>=thirdNumber){\n            printf(\"%d\",thirdNumber);\n        }else{\n            printf(\"%d\",secondNumber);\n        }\n        \n    }\n', '4', '39', '2022-12-18 09:53:40', '39', '2022-12-18 09:53:40');
INSERT INTO `exercise_answer` VALUES (359, 5, 36, 'd6d0170e-7604-42ee-a665-cfb715be78bd', '#include<stdio.h>\n    int main(){\n        int firstNumber=15;\n        int secondNumber=29;\n        int thirdNumber=16;\n        int sum = firstNumber+thirdNumber-secondNumber;\n        printf(\"%d\",sum);\n    }\n', '2', '39', '2022-12-18 09:53:40', '39', '2022-12-18 09:53:40');
INSERT INTO `exercise_answer` VALUES (360, 6, 36, 'd6d0170e-7604-42ee-a665-cfb715be78bd', '#include<stdio.h>\n    int main(){\n        int firstNumber=18;\n        int secondNumber=14;\n        int thirdNumber=6;\n        int sum = firstNumber+thirdNumber-secondNumber;\n        printf(\"%d\",sum);\n    }\n', '10', '39', '2022-12-18 09:53:40', '39', '2022-12-18 09:53:40');
INSERT INTO `exercise_answer` VALUES (361, 2, 36, 'd7dfcb0a-afad-4784-8287-fc5b5b18f003', '#include<stdio.h>\n    int main(){\n        for(int i=0;i<10;i++){\n            printf(\"%d\",i);\n        }\n    }\n', '0123456789', '39', '2022-12-22 07:47:01', '39', '2022-12-22 07:47:01');
INSERT INTO `exercise_answer` VALUES (362, 3, 36, 'd7dfcb0a-afad-4784-8287-fc5b5b18f003', '#include<stdio.h>\n    int main(){\n        int firstNumber=10;\n        int secondNumber=13;\n        int thirdNumber=3;\n        if(firstNumber<=thirdNumber){\n            int sum = firstNumber+thirdNumber-secondNumber;\n            printf(\"%d\",sum);\n        }else if(secondNumber<=thirdNumber){\n            printf(\"%d\",thirdNumber);\n        }else{\n            printf(\"%d\",secondNumber);\n        }\n        \n    }\n', '13', '39', '2022-12-22 07:47:01', '39', '2022-12-22 07:47:01');
INSERT INTO `exercise_answer` VALUES (363, 1, 36, 'd7dfcb0a-afad-4784-8287-fc5b5b18f003', '#include<stdio.h>\n    int main(){\n        for(int i=0;i<10;i++){\n            printf(\"%d\",i);\n        }\n    }\n', '0123456789', '39', '2022-12-22 07:47:01', '39', '2022-12-22 07:47:01');
INSERT INTO `exercise_answer` VALUES (364, 6, 36, 'd7dfcb0a-afad-4784-8287-fc5b5b18f003', '#include<stdio.h>\n    int main(){\n        int firstNumber=5;\n        int secondNumber=16;\n        int thirdNumber=22;\n        int sum = firstNumber+thirdNumber-secondNumber;\n        printf(\"%d\",sum);\n    }\n', '11', '39', '2022-12-22 07:47:02', '39', '2022-12-22 07:47:02');
INSERT INTO `exercise_answer` VALUES (365, 5, 36, 'd7dfcb0a-afad-4784-8287-fc5b5b18f003', '#include<stdio.h>\n    int main(){\n        int firstNumber=13;\n        int secondNumber=6;\n        int thirdNumber=27;\n        int sum = firstNumber+thirdNumber-secondNumber;\n        printf(\"%d\",sum);\n    }\n', '34', '39', '2022-12-22 07:47:02', '39', '2022-12-22 07:47:02');
INSERT INTO `exercise_answer` VALUES (366, 4, 36, 'd7dfcb0a-afad-4784-8287-fc5b5b18f003', '#include<stdio.h>\n    int main(){\n        int firstNumber=24;\n        int secondNumber=2;\n        int thirdNumber=12;\n        if(firstNumber<=thirdNumber){\n            int sum = firstNumber+thirdNumber-secondNumber;\n            printf(\"%d\",sum);\n        }else if(secondNumber>thirdNumber){\n            printf(\"%d\",thirdNumber);\n        }else{\n            printf(\"%d\",secondNumber);\n        }\n        \n    }\n', '2', '39', '2022-12-22 07:47:02', '39', '2022-12-22 07:47:02');
INSERT INTO `exercise_answer` VALUES (367, 2, 37, 'fc5cc499-596f-43c4-bcc4-02014dff4127', '#include<stdio.h>\n    int main(){\n      if(15==18){\n          printf(\"Huzzzzzz\");\n      }else{\n        printf(\"archive\");\n      }\n        \n    }\n', 'archive', '39', '2022-12-24 15:00:54', '39', '2022-12-24 15:00:54');
INSERT INTO `exercise_answer` VALUES (368, 1, 37, 'fc5cc499-596f-43c4-bcc4-02014dff4127', '#include<stdio.h>\n    int main(){\n      if(5>=11){\n          printf(\"bang\");\n      }else{\n        printf(\"hotdog\");\n      }\n        \n    }\n', 'hotdog', '39', '2022-12-24 15:00:54', '39', '2022-12-24 15:00:54');
INSERT INTO `exercise_answer` VALUES (369, 3, 37, 'fc5cc499-596f-43c4-bcc4-02014dff4127', '#include<stdio.h>\n    int main(){\n      if(22==7){\n          printf(\"law\");\n      }else{\n        printf(\"deal\");\n      }\n        \n    }\n', 'deal', '39', '2022-12-24 15:00:54', '39', '2022-12-24 15:00:54');
INSERT INTO `exercise_answer` VALUES (370, 4, 37, 'fc5cc499-596f-43c4-bcc4-02014dff4127', '#include<stdio.h>\n    int main(){\n      if(28>=15){\n          printf(\"relaxation\");\n      }else{\n        printf(\"Wooz\");\n      }\n        \n    }\n', 'relaxation', '39', '2022-12-24 15:00:55', '39', '2022-12-24 15:00:55');
INSERT INTO `exercise_answer` VALUES (371, 5, 37, 'fc5cc499-596f-43c4-bcc4-02014dff4127', '#include<stdio.h>\n    int main(){\n      if(10<=2){\n          printf(\"bean\");\n      }else{\n        printf(\"advocate\");\n      }\n        \n    }\n', 'advocate', '39', '2022-12-24 15:00:55', '39', '2022-12-24 15:00:55');
INSERT INTO `exercise_answer` VALUES (372, 2, 37, 'f272616c-9ac5-4c56-b1df-dde16f8a9a15', '#include<stdio.h>\n    int main(){\n      if(14==11){\n          printf(\"ministry\");\n      }else{\n        printf(\"relaxation\");\n      }\n        \n    }\n', 'relaxation', '39', '2022-12-24 15:02:01', '39', '2022-12-24 15:02:01');
INSERT INTO `exercise_answer` VALUES (373, 1, 37, 'f272616c-9ac5-4c56-b1df-dde16f8a9a15', '#include<stdio.h>\n    int main(){\n      if(19>=12){\n          printf(\"concentrate\");\n      }else{\n        printf(\"buy\");\n      }\n        \n    }\n', 'concentrate', '39', '2022-12-24 15:02:01', '39', '2022-12-24 15:02:01');
INSERT INTO `exercise_answer` VALUES (374, 3, 37, 'f272616c-9ac5-4c56-b1df-dde16f8a9a15', '#include<stdio.h>\n    int main(){\n      if(17>19){\n          printf(\"delicate\");\n      }else{\n        printf(\"Huzzzzzz\");\n      }\n        \n    }\n', 'Huzzzzzz', '39', '2022-12-24 15:02:01', '39', '2022-12-24 15:02:01');
INSERT INTO `exercise_answer` VALUES (375, 4, 37, 'f272616c-9ac5-4c56-b1df-dde16f8a9a15', '#include<stdio.h>\n    int main(){\n      if(9<28){\n          printf(\"buy\");\n      }else{\n        printf(\"advocate\");\n      }\n        \n    }\n', 'buy', '39', '2022-12-24 15:02:01', '39', '2022-12-24 15:02:01');
INSERT INTO `exercise_answer` VALUES (376, 5, 37, 'f272616c-9ac5-4c56-b1df-dde16f8a9a15', '#include<stdio.h>\n    int main(){\n      if(5<22){\n          printf(\"Wooz\");\n      }else{\n        printf(\"memorial\");\n      }\n        \n    }\n', 'Wooz', '39', '2022-12-24 15:02:01', '39', '2022-12-24 15:02:01');
INSERT INTO `exercise_answer` VALUES (377, 2, 37, 'd69732c4-5482-4a41-b856-c2e4b8eabc3f', '#include<stdio.h>\n    int main(){\n      if(11<18){\n          printf(\"want\");\n      }else{\n        printf(\"ministry\");\n      }\n        \n    }\n', 'want', '39', '2023-01-07 08:22:19', '39', '2023-01-07 08:22:19');
INSERT INTO `exercise_answer` VALUES (378, 1, 37, 'd69732c4-5482-4a41-b856-c2e4b8eabc3f', '#include<stdio.h>\n    int main(){\n      if(21>=29){\n          printf(\"advocate\");\n      }else{\n        printf(\"item\");\n      }\n        \n    }\n', 'item', '39', '2023-01-07 08:22:19', '39', '2023-01-07 08:22:19');
INSERT INTO `exercise_answer` VALUES (379, 3, 37, 'd69732c4-5482-4a41-b856-c2e4b8eabc3f', '#include<stdio.h>\n    int main(){\n      if(2<=19){\n          printf(\"delicate\");\n      }else{\n        printf(\"fun\");\n      }\n        \n    }\n', 'delicate', '39', '2023-01-07 08:22:19', '39', '2023-01-07 08:22:19');
INSERT INTO `exercise_answer` VALUES (380, 4, 37, 'd69732c4-5482-4a41-b856-c2e4b8eabc3f', '#include<stdio.h>\n    int main(){\n      if(29<29){\n          printf(\"fun\");\n      }else{\n        printf(\"relaxation\");\n      }\n        \n    }\n', 'relaxation', '39', '2023-01-07 08:22:19', '39', '2023-01-07 08:22:19');
INSERT INTO `exercise_answer` VALUES (381, 5, 37, 'd69732c4-5482-4a41-b856-c2e4b8eabc3f', '#include<stdio.h>\n    int main(){\n      if(20!=22){\n          printf(\"Buff\");\n      }else{\n        printf(\"Hello\");\n      }\n        \n    }\n', 'Buff', '39', '2023-01-07 08:22:19', '39', '2023-01-07 08:22:19');
INSERT INTO `exercise_answer` VALUES (382, 3, 38, '124534f3-1c91-46c2-9118-e2c791af6bed', '#include<stdio.h>\n    int main(){\n        int firstNumber=2;\n        int secondNumber=18;\n        int thirdNumber=15;\n        int sum = firstNumber+thirdNumber-secondNumber;\n        printf(\"%d\",sum);\n    }\n', '-1', '1', '2023-02-03 04:28:57', '1', '2023-02-03 04:28:57');
INSERT INTO `exercise_answer` VALUES (383, 2, 38, '124534f3-1c91-46c2-9118-e2c791af6bed', '#include<stdio.h>\n    int main(){\n        int firstNumber=20;\n        int secondNumber=19;\n        int thirdNumber=13;\n        if(firstNumber>=thirdNumber){\n            int sum = firstNumber+thirdNumber-secondNumber;\n            printf(\"%d\",sum);\n        }else if(secondNumber<=thirdNumber){\n            printf(\"%d\",thirdNumber);\n        }else{\n            printf(\"%d\",secondNumber);\n        }\n        \n    }\n', '14', '1', '2023-02-03 04:28:57', '1', '2023-02-03 04:28:57');
INSERT INTO `exercise_answer` VALUES (384, 1, 38, '124534f3-1c91-46c2-9118-e2c791af6bed', '#include<stdio.h>\n    int main(){\n        int firstNumber=2;\n        int secondNumber=27;\n        int thirdNumber=4;\n        if(firstNumber<thirdNumber){\n            int sum = firstNumber+thirdNumber-secondNumber;\n            printf(\"%d\",sum);\n        }else if(secondNumber<=thirdNumber){\n            printf(\"%d\",thirdNumber);\n        }else{\n            printf(\"%d\",secondNumber);\n        }\n        \n    }\n', '-21', '1', '2023-02-03 04:28:57', '1', '2023-02-03 04:28:57');
INSERT INTO `exercise_answer` VALUES (385, 2, 38, '99d2db2d-ef2b-4456-9a07-ac82a7370703', '#include<stdio.h>\n    int main(){\n        int firstNumber=17;\n        int secondNumber=10;\n        int thirdNumber=12;\n        if(firstNumber<=thirdNumber){\n            int sum = firstNumber+thirdNumber-secondNumber;\n            printf(\"%d\",sum);\n        }else if(secondNumber==thirdNumber){\n            printf(\"%d\",thirdNumber);\n        }else{\n            printf(\"%d\",secondNumber);\n        }\n        \n    }\n', '10', '1', '2023-02-03 04:29:28', '1', '2023-02-03 04:29:28');
INSERT INTO `exercise_answer` VALUES (386, 1, 38, '99d2db2d-ef2b-4456-9a07-ac82a7370703', '#include<stdio.h>\n    int main(){\n        int firstNumber=21;\n        int secondNumber=8;\n        int thirdNumber=20;\n        if(firstNumber<=thirdNumber){\n            int sum = firstNumber+thirdNumber-secondNumber;\n            printf(\"%d\",sum);\n        }else if(secondNumber<=thirdNumber){\n            printf(\"%d\",thirdNumber);\n        }else{\n            printf(\"%d\",secondNumber);\n        }\n        \n    }\n', '20', '1', '2023-02-03 04:29:28', '1', '2023-02-03 04:29:28');
INSERT INTO `exercise_answer` VALUES (387, 3, 38, '99d2db2d-ef2b-4456-9a07-ac82a7370703', '#include<stdio.h>\n    int main(){\n        int firstNumber=15;\n        int secondNumber=12;\n        int thirdNumber=26;\n        int sum = firstNumber+thirdNumber-secondNumber;\n        printf(\"%d\",sum);\n    }\n', '29', '1', '2023-02-03 04:29:28', '1', '2023-02-03 04:29:28');
INSERT INTO `exercise_answer` VALUES (388, 1, 38, '3751cc94-f378-482b-94aa-94dcb020790a', '#include<stdio.h>\n    int main(){\n        int firstNumber=24;\n        int secondNumber=28;\n        int thirdNumber=23;\n        if(firstNumber>thirdNumber){\n            int sum = firstNumber+thirdNumber-secondNumber;\n            printf(\"%d\",sum);\n        }else if(secondNumber==thirdNumber){\n            printf(\"%d\",thirdNumber);\n        }else{\n            printf(\"%d\",secondNumber);\n        }\n        \n    }\n', '19', '1', '2023-02-03 04:29:31', '1', '2023-02-03 04:29:31');
INSERT INTO `exercise_answer` VALUES (389, 3, 38, '3751cc94-f378-482b-94aa-94dcb020790a', '#include<stdio.h>\n    int main(){\n        int firstNumber=14;\n        int secondNumber=17;\n        int thirdNumber=6;\n        int sum = firstNumber+thirdNumber-secondNumber;\n        printf(\"%d\",sum);\n    }\n', '3', '1', '2023-02-03 04:29:31', '1', '2023-02-03 04:29:31');
INSERT INTO `exercise_answer` VALUES (390, 2, 38, '3751cc94-f378-482b-94aa-94dcb020790a', '#include<stdio.h>\n    int main(){\n        int firstNumber=19;\n        int secondNumber=4;\n        int thirdNumber=8;\n        if(firstNumber<thirdNumber){\n            int sum = firstNumber+thirdNumber-secondNumber;\n            printf(\"%d\",sum);\n        }else if(secondNumber==thirdNumber){\n            printf(\"%d\",thirdNumber);\n        }else{\n            printf(\"%d\",secondNumber);\n        }\n        \n    }\n', '4', '1', '2023-02-03 04:29:31', '1', '2023-02-03 04:29:31');

-- ----------------------------
-- Table structure for exercise_pattern
-- ----------------------------
DROP TABLE IF EXISTS `exercise_pattern`;
CREATE TABLE `exercise_pattern`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `pattern_id` int NOT NULL,
  `exercise_id` int NOT NULL,
  `amount` int NULL DEFAULT NULL,
  `created_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `created_date` datetime NULL DEFAULT NULL,
  `last_modified_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `last_modified_date` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `pattern_id`(`pattern_id`) USING BTREE,
  INDEX `exercise_id`(`exercise_id`) USING BTREE,
  CONSTRAINT `exercise_pattern_ibfk_1` FOREIGN KEY (`pattern_id`) REFERENCES `pattern` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `exercise_pattern_ibfk_2` FOREIGN KEY (`exercise_id`) REFERENCES `exercise` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 55 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of exercise_pattern
-- ----------------------------
INSERT INTO `exercise_pattern` VALUES (31, 70, 26, 10, '1', '2022-11-26 03:59:38', '1', '2022-11-26 03:59:38');
INSERT INTO `exercise_pattern` VALUES (32, 70, 26, 6, '1', '2022-11-26 03:59:38', '1', '2022-11-26 03:59:38');
INSERT INTO `exercise_pattern` VALUES (33, 110, 27, 4, '1', '2022-11-26 05:50:49', '1', '2022-11-26 05:50:49');
INSERT INTO `exercise_pattern` VALUES (34, 53, 27, 6, '1', '2022-11-26 05:50:49', '1', '2022-11-26 05:50:49');
INSERT INTO `exercise_pattern` VALUES (35, 33, 27, 8, '1', '2022-11-26 05:50:49', '1', '2022-11-26 05:50:49');
INSERT INTO `exercise_pattern` VALUES (36, 110, 28, 2, '39', '2022-11-26 12:28:08', '39', '2022-11-26 12:28:08');
INSERT INTO `exercise_pattern` VALUES (37, 71, 28, 2, '39', '2022-11-26 12:28:08', '39', '2022-11-26 12:28:08');
INSERT INTO `exercise_pattern` VALUES (38, 70, 29, 3, '13', '2022-12-01 06:01:05', '13', '2022-12-01 06:01:05');
INSERT INTO `exercise_pattern` VALUES (39, 53, 29, 2, '13', '2022-12-01 06:01:05', '13', '2022-12-01 06:01:05');
INSERT INTO `exercise_pattern` VALUES (40, 89, 30, 2, '13', '2022-12-08 07:57:20', '13', '2022-12-08 07:57:20');
INSERT INTO `exercise_pattern` VALUES (41, 70, 31, 3, '39', '2022-12-09 04:15:59', '39', '2022-12-09 04:15:59');
INSERT INTO `exercise_pattern` VALUES (42, 110, 31, 3, '39', '2022-12-09 04:15:59', '39', '2022-12-09 04:15:59');
INSERT INTO `exercise_pattern` VALUES (43, 71, 32, 5, '39', '2022-12-09 10:12:58', '39', '2022-12-09 10:12:58');
INSERT INTO `exercise_pattern` VALUES (44, 114, 33, 5, '39', '2022-12-14 14:04:21', '39', '2022-12-14 14:04:21');
INSERT INTO `exercise_pattern` VALUES (45, 110, 33, 1, '39', '2022-12-14 14:04:21', '39', '2022-12-14 14:04:21');
INSERT INTO `exercise_pattern` VALUES (46, 71, 34, 3, '39', '2022-12-14 14:09:19', '39', '2022-12-14 14:09:19');
INSERT INTO `exercise_pattern` VALUES (47, 71, 34, 2, '39', '2022-12-14 14:09:19', '39', '2022-12-14 14:09:19');
INSERT INTO `exercise_pattern` VALUES (48, 114, 35, 3, '38', '2022-12-14 14:34:33', '38', '2022-12-14 14:34:33');
INSERT INTO `exercise_pattern` VALUES (49, 119, 36, 2, '39', '2022-12-18 09:53:24', '39', '2022-12-18 09:53:24');
INSERT INTO `exercise_pattern` VALUES (50, 118, 36, 2, '39', '2022-12-18 09:53:24', '39', '2022-12-18 09:53:24');
INSERT INTO `exercise_pattern` VALUES (51, 117, 36, 2, '39', '2022-12-18 09:53:24', '39', '2022-12-18 09:53:24');
INSERT INTO `exercise_pattern` VALUES (52, 138, 37, 5, '39', '2022-12-24 15:00:43', '39', '2022-12-24 15:00:43');
INSERT INTO `exercise_pattern` VALUES (53, 141, 38, 2, '1', '2023-02-03 04:28:36', '1', '2023-02-03 04:28:36');
INSERT INTO `exercise_pattern` VALUES (54, 140, 38, 1, '1', '2023-02-03 04:28:36', '1', '2023-02-03 04:28:36');

-- ----------------------------
-- Table structure for module
-- ----------------------------
DROP TABLE IF EXISTS `module`;
CREATE TABLE `module`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `module_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `original_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `created_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `created_date` datetime NULL DEFAULT NULL,
  `last_modified_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `last_modified_date` datetime NULL DEFAULT NULL,
  `link` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of module
-- ----------------------------
INSERT INTO `module` VALUES (15, 'Module_Fri Feb 03 11:18:15 ICT 2023', '2015-Pengaruh_pembelajaran_berbasis_e-learning_terhadap_hasil_belajar_siswa_pada_konsep_impuls_dan_momentum.pdf', '13', '2023-02-03 04:18:15', '13', '2023-02-03 04:18:15', 'http://localhost:9090/downloadFile/2015-Pengaruh_pembelajaran_berbasis_e-learning_terhadap_hasil_belajar_siswa_pada_konsep_impuls_dan_momentum.pdf');

-- ----------------------------
-- Table structure for pattern
-- ----------------------------
DROP TABLE IF EXISTS `pattern`;
CREATE TABLE `pattern`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `pattern` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `course_level` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `course_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `created_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `created_date` datetime NULL DEFAULT NULL,
  `last_modified_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `last_modified_date` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 142 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of pattern
-- ----------------------------
INSERT INTO `pattern` VALUES (4, 'public class MatSym {     public static void main(String[]args) {        if(:value:compare:value && :value:compare:value){System.out.println(:output);}else{System.out.println(:output);}} }', 'low', 'Looping', 'Hikari', '2022-11-08 05:31:03', 'Hikari', '2022-11-08 05:31:03');
INSERT INTO `pattern` VALUES (5, 'public class MatSym {     public static void main(String[]args) {        if(:value:compare:value && :value:compare:value){System.out.println(:output);}else{System.out.println(:output);}} }', 'medium', 'Looping', 'Hikari', '2022-11-08 05:31:27', 'Hikari', '2022-11-08 05:31:27');
INSERT INTO `pattern` VALUES (33, 'public class MatSym {     public static void main(String[]args) {        if(18!=28 && 21==2){System.out.println(\"Wooz\");}else{System.out.println(\"Yosh!\");}} }', 'high', 'Sequential', 'Hikari', '2022-11-15 08:22:00', 'Hikari', '2022-11-15 08:22:00');
INSERT INTO `pattern` VALUES (36, 'public class MatSym {     public static void main(String[]args) {        if(18!=28 && 21==2){System.out.println(\"Wooz\");}else{System.out.println(\"Yosh!\");}} }', 'high', 'Sequential', 'Hikari', '2022-11-15 08:24:48', 'Hikari', '2022-11-15 08:24:48');
INSERT INTO `pattern` VALUES (53, 'class Program{\n    public static void main(String[]args){\n      int angka = :value;\n      int angka2 = :value;\n\n      if(angka:compareangka2){\n        System.out.println(:output);\n      }else{\n        System.out.println(:output);\n      }\n        \n    }\n} ', 'low', 'sequential', 'Hikari', '2022-11-15 10:20:41', 'Hikari', '2022-11-15 10:20:41');
INSERT INTO `pattern` VALUES (54, 'class Program{\n    public static void main(String[]args){\n      int angka = :value;\n      int angka2 = :value;\n\n      if(angka:compareangka2){\n        System.out.println(:output);\n      }else{\n        System.out.println(:output);\n      }\n        \n    }\n} ', 'low', 'sequential', 'Hikari', '2022-11-15 11:41:40', 'Hikari', '2022-11-15 11:41:40');
INSERT INTO `pattern` VALUES (55, 'class Program{\n    public static void main(String[]args){\n      int angka = :value;\n      int angka2 = :value;\n\n      int angka3 = angka:operatorangka2;\n\n      if(angka:compareangka2){\n        System.out.println(:output);\n      }else{\n        System.out.println(:output);\n      }\n        \n    }\n} ', 'low', 'sequential', 'Hikari', '2022-11-15 11:43:25', 'Hikari', '2022-11-15 11:43:25');
INSERT INTO `pattern` VALUES (70, 'class Program{\n    public static void main(String[]args){\n      int a =:value;\n      int b = :value;\n      int c = a+b;\n      if(a<b){\n        System.out.println(b);\n      }else{\n        System.out.println(c);  \n      }\n      \n    }\n} ', 'low', 'sequential', 'Hikari', '2022-11-17 01:00:46', 'Hikari', '2022-11-17 01:00:46');
INSERT INTO `pattern` VALUES (71, 'class Program{\n    public static void main(String[]args){\n      int angka = :value;\n      String a  = :output;\n      if(angka:operator:value:compare:value){\n        System.out.println(angka);\n      }else{\n        System.out.println(:output);\n      }\n        \n    }\n} ', 'low', 'sequential', 'Hikari', '2022-11-17 06:24:10', 'Hikari', '2022-11-17 06:24:10');
INSERT INTO `pattern` VALUES (75, 'class Program{\n    public static void main(String[]args){\n      if(:value:compare:value :logic :value:compare:value){\n        System.out.println(:output);\n      }else{\n        System.out.println(:output);\n      }\n        \n    }\n} ', 'low', 'sequential', 'Hikari', '2022-11-17 06:41:48', 'Hikari', '2022-11-17 06:41:48');
INSERT INTO `pattern` VALUES (89, 'class Program{\n    public static void main(String[]args){\n      if(:value:compare:value :logic :value:compare:value){\n        System.out.println(:output);\n      }else{\n        System.out.println(:output);\n      }\n        \n    }\n} ', 'medium', 'conditional', 'Hikari', '2022-11-20 01:50:47', 'Hikari', '2022-11-20 01:50:47');
INSERT INTO `pattern` VALUES (110, 'class Program{\n    public static void main(String[]args){\n      String word = :output;\n      String word1 = :output;\n      if(word.equals(word1)){\n          System.out.println(:value);\n      }else{\n        System.out.println(:output);\n      }\n        \n    }\n} ', 'medium', 'conditional', '1', '2022-11-26 05:49:52', '1', '2022-11-26 05:49:52');
INSERT INTO `pattern` VALUES (111, 'class Program{\n    public static void main(String[]args){\n      if(:value:compare:value)\n        System.out.println(\"Hikari learning1\");\n      else\n        System.out.println(\"Hikari learning2\");\n    }\n} ', '', 'sequential', '39', '2022-12-07 05:24:10', '39', '2022-12-07 05:24:10');
INSERT INTO `pattern` VALUES (112, 'class Program{\n    public static void main(String[]args){\n      if(:value:compare:value)\n        System.out.println(\"Hikari learning3\");\n      \n      else\n        System.out.println(\"Hikari learning4\");\n    }\n} ', 'medium', '', '39', '2022-12-07 05:25:47', '39', '2022-12-07 05:25:47');
INSERT INTO `pattern` VALUES (113, 'class Program{\n    public static void main(String[]args){\n        System.out.println(\"Hikari learning\");\n    }\n} ', 'medium', 'conditional', '39', '2022-12-09 11:45:29', '39', '2022-12-09 11:45:29');
INSERT INTO `pattern` VALUES (114, 'class Program{\n    public static void main(String[]args){\n      if((:value:compare:value):logic(:value:compare:value))\n        System.out.println(:output);\n      else\n        System.out.println(:output);\n      \n    }\n} ', '', 'conditional', '39', '2022-12-14 13:58:10', '39', '2022-12-14 13:58:10');
INSERT INTO `pattern` VALUES (115, '#include<stdio.h>\n\n    int main(){\n        printf(\"Hallo world\");\n    }\n', '', 'sequential', '39', '2022-12-18 09:41:21', '39', '2022-12-18 09:41:21');
INSERT INTO `pattern` VALUES (116, '#include<stdio.h>\n\n    int main(){\n        printf(:output);\n    }\n', '', 'sequential', '39', '2022-12-18 09:42:19', '39', '2022-12-18 09:42:19');
INSERT INTO `pattern` VALUES (117, '#include<stdio.h>\n    int main(){\n        int firstNumber=:value;\n        int secondNumber=:value;\n        int thirdNumber=:value;\n        int sum = firstNumber+thirdNumber-secondNumber;\n        printf(\"%d\",sum);\n    }\n', '', 'sequential', '39', '2022-12-18 09:44:56', '39', '2022-12-18 09:44:56');
INSERT INTO `pattern` VALUES (118, '#include<stdio.h>\n    int main(){\n        int firstNumber=:value;\n        int secondNumber=:value;\n        int thirdNumber=:value;\n        if(firstNumber:comparethirdNumber){\n            int sum = firstNumber+thirdNumber-secondNumber;\n            printf(\"%d\",sum);\n        }else if(secondNumber:comparethirdNumber){\n            printf(\"%d\",thirdNumber);\n        }else{\n            printf(\"%d\",secondNumber);\n        }\n        \n    }\n', 'medium', 'conditional', '39', '2022-12-18 09:47:50', '39', '2022-12-18 09:47:50');
INSERT INTO `pattern` VALUES (119, '#include<stdio.h>\n    int main(){\n        for(int i=0;i<10;i++){\n            printf(\"%d\",i);\n        }\n    }\n', 'medium', 'looping', '39', '2022-12-18 09:49:24', '39', '2022-12-18 09:49:24');
INSERT INTO `pattern` VALUES (120, '#include<stdio.h>\n    int main(){\n        int firstNumber=:value;\n        int secondNumber=:value;\n        int thirdNumber=:value;\n        int sum = firstNumber+thirdNumber-secondNumber;\n        printf(\"%d\",sum);\n    }\n', '', 'sequential', '39', '2022-12-18 10:11:08', '39', '2022-12-18 10:11:08');
INSERT INTO `pattern` VALUES (121, '#include<stdio.h>\n    int main(){\n        int firstNumber=:value;\n        int secondNumber=:value;\n        int thirdNumber=:value;\n        int sum = firstNumber+thirdNumber-secondNumber;\n        printf(\"%d\",sum);\n    }\n', 'medium', 'sequential', '39', '2022-12-18 10:11:11', '39', '2022-12-18 10:11:11');
INSERT INTO `pattern` VALUES (122, '#include<stdio.h>\n    int main(){\n        int firstNumber=:value;\n        int secondNumber=:value;\n        int thirdNumber=:value;\n        int sum = firstNumber+thirdNumber-secondNumber;\n        printf(\"%d\",sum);\n    }\n', 'high', 'sequential', '39', '2022-12-18 10:11:37', '39', '2022-12-18 10:11:37');
INSERT INTO `pattern` VALUES (123, '#include<stdio.h>\n    int main(){\n        int firstNumber=:value;\n        int secondNumber=:value;\n        int thirdNumber=:value;\n        int sum = firstNumber+thirdNumber-secondNumber;\n        printf(\"%d\",sum);\n    }\n', 'medium', 'sequential', '39', '2022-12-18 10:14:41', '39', '2022-12-18 10:14:41');
INSERT INTO `pattern` VALUES (124, '#include<stdio.h>\n    int main(){\n        int firstNumber=:value;\n        int secondNumber=:value;\n        int thirdNumber=:value;\n        if(firstNumber:comparethirdNumber){\n            int sum = firstNumber+thirdNumber-secondNumber;\n            printf(\"%d\",sum);\n        }else if(secondNumber:comparethirdNumber){\n            printf(\"%d\",thirdNumber);\n        }else{\n            printf(\"%d\",secondNumber);\n        }\n        \n    }\n', '', 'conditional', '39', '2022-12-19 12:17:50', '39', '2022-12-19 12:17:50');
INSERT INTO `pattern` VALUES (125, '#include<stdio.h>\n    int main(){\n        int firstNumber=:value;\n        int secondNumber=:value;\n        int thirdNumber=:value;\n        if(firstNumber:comparethirdNumber){\n            int sum = firstNumber+thirdNumber-secondNumber;\n            printf(\"%d\",sum);\n        }else if(secondNumber:comparethirdNumber){\n            printf(\"%d\",thirdNumber);\n        }else{\n            printf(\"%d\",secondNumber);\n        }\n        \n    }\n', '', 'conditional', '39', '2022-12-19 12:18:03', '39', '2022-12-19 12:18:03');
INSERT INTO `pattern` VALUES (126, '#include<stdio.h>\n    int main(){\n        int firstNumber=:value;\n        int secondNumber=:value;\n        int thirdNumber=:value;\n        if(firstNumber:comparethirdNumber){\n            int sum = firstNumber+thirdNumber-secondNumber;\n            printf(\"%d\",sum);\n        }else if(secondNumber:comparethirdNumber){\n            printf(\"%d\",thirdNumber);\n        }else{\n            printf(\"%d\",secondNumber);\n        }\n        \n    }\n', '', 'conditional', '39', '2022-12-19 12:18:34', '39', '2022-12-19 12:18:34');
INSERT INTO `pattern` VALUES (127, '#include<stdio.h>\n    int main(){\n        int firstNumber=:value;\n        int secondNumber=:value;\n        int thirdNumber=:value;\n        if(firstNumber:comparethirdNumber){\n            int sum = firstNumber+thirdNumber-secondNumber;\n            printf(\"%d\",sum);\n        }else if(secondNumber:comparethirdNumber){\n            printf(\"%d\",thirdNumber);\n        }else{\n            printf(\"%d\",secondNumber);\n        }\n        \n    }\n', '', 'conditional', '39', '2022-12-19 12:18:39', '39', '2022-12-19 12:18:39');
INSERT INTO `pattern` VALUES (128, '#include<stdio.h>\n    int main(){\n        int firstNumber=:value;\n        int secondNumber=:value;\n        int thirdNumber=:value;\n        if(firstNumber:comparethirdNumber){\n            int sum = firstNumber+thirdNumber-secondNumber;\n            printf(\"%d\",sum);\n        }else if(secondNumber:comparethirdNumber){\n            printf(\"%d\",thirdNumber);\n        }else{\n            printf(\"%d\",secondNumber);\n        }\n        \n    }\n', '', 'conditional', '39', '2022-12-19 12:18:45', '39', '2022-12-19 12:18:45');
INSERT INTO `pattern` VALUES (129, '#include<stdio.h>\n    int main(){\n        int firstNumber=:value;\n        int secondNumber=:value;\n        int thirdNumber=:value;\n        if(firstNumber:comparethirdNumber){\n            int sum = firstNumber+thirdNumber-secondNumber;\n            printf(\"%d\",sum);\n        }else if(secondNumber:comparethirdNumber){\n            printf(\"%d\",thirdNumber);\n        }else{\n            printf(\"%d\",secondNumber);\n        }\n        \n    }\n', '', 'conditional', '39', '2022-12-20 00:14:40', '39', '2022-12-20 00:14:40');
INSERT INTO `pattern` VALUES (130, '#include<stdio.h>\n    int main(){\n        int firstNumber=:value;\n        int secondNumber=:value;\n        int thirdNumber=:value;\n        if(firstNumber:comparethirdNumber){\n            int sum = firstNumber+thirdNumber-secondNumber;\n            printf(\"%d\",sum);\n        }else if(secondNumber:comparethirdNumber){\n            printf(\"%d\",thirdNumber);\n        }else{\n            printf(\"%d\",secondNumber);\n        }\n        \n    }\n', '', 'conditional', '39', '2022-12-20 00:15:20', '39', '2022-12-20 00:15:20');
INSERT INTO `pattern` VALUES (131, '#include<stdio.h>\n    int main(){\n        int firstNumber=:value;\n        int secondNumber=:value;\n        int thirdNumber=:value;\n        if(firstNumber:comparethirdNumber){\n            int sum = firstNumber+thirdNumber-secondNumber;\n            printf(\"%d\",sum);\n        }else if(secondNumber:comparethirdNumber){\n            printf(\"%d\",thirdNumber);\n        }else{\n            printf(\"%d\",secondNumber);\n        }\n        \n    }\n', 'medium', 'conditional', '39', '2022-12-20 00:15:34', '39', '2022-12-20 00:15:34');
INSERT INTO `pattern` VALUES (132, '#include<stdio.h>\n    int main(){\n        int firstNumber=:value;\n        int secondNumber=:value;\n        int thirdNumber=:value;\n        if(firstNumber:comparethirdNumber){\n            int sum = firstNumber+thirdNumber-secondNumber;\n            printf(\"%d\",sum);\n        }else if(secondNumber:comparethirdNumber){\n            printf(\"%d\",thirdNumber);\n        }else{\n            printf(\"%d\",secondNumber);\n        }\n        \n    }\n', '', 'conditional', '39', '2022-12-20 00:21:57', '39', '2022-12-20 00:21:57');
INSERT INTO `pattern` VALUES (133, '#include<stdio.h>\n    int main(){\n        int firstNumber=:value;\n        int secondNumber=:value;\n        int thirdNumber=:value;\n        if(firstNumber:comparethirdNumber){\n            int sum = firstNumber+thirdNumber-secondNumber;\n            printf(\"%d\",sum);\n        }else if(secondNumber:comparethirdNumber){\n            printf(\"%d\",thirdNumber);\n        }else{\n            printf(\"%d\",secondNumber);\n        }\n        \n    }\n', '', 'conditional', '39', '2022-12-20 00:27:28', '39', '2022-12-20 00:27:28');
INSERT INTO `pattern` VALUES (134, '#include<stdio.h>\n    int main(){\n        int firstNumber=:value;\n        int secondNumber=:value;\n        int thirdNumber=:value;\n        if(firstNumber:comparethirdNumber){\n            int sum = firstNumber+thirdNumber-secondNumber;\n            printf(\"%d\",sum);\n        }else if(secondNumber:comparethirdNumber){\n            printf(\"%d\",thirdNumber);\n        }else{\n            printf(\"%d\",secondNumber);\n        }\n        \n    }\n', 'medium', 'conditional', '39', '2022-12-20 00:27:55', '39', '2022-12-20 00:27:55');
INSERT INTO `pattern` VALUES (135, '#include<stdio.h>\n    int main(){\n        for(int i=0;i<10;i++){\n            printf(\"%d\",i);\n        }\n    }\n', 'medium', 'looping', '39', '2022-12-20 00:28:58', '39', '2022-12-20 00:28:58');
INSERT INTO `pattern` VALUES (136, '#include<stdio.h>\n    int main(){\n        printf(\"Hikari Learning\");\n    }\n', 'low', 'sequential', '39', '2022-12-20 00:34:21', '39', '2022-12-20 00:34:21');
INSERT INTO `pattern` VALUES (137, '#include<stdio.h>\n    int main(){\n        int firstNumber=:value;\n        int secondNumber=:value;\n        int thirdNumber=:value;\n        if(firstNumber:comparethirdNumber){\n            int sum = firstNumber+thirdNumber-secondNumber;\n            printf(\"%d\",sum);\n        }else if(secondNumber:comparethirdNumber){\n            printf(\"%d\",thirdNumber);\n        }else{\n            printf(\"%d\",secondNumber);\n        }\n        \n    }\n', 'low', 'conditional', '39', '2022-12-20 01:31:05', '39', '2022-12-20 01:31:05');
INSERT INTO `pattern` VALUES (138, '#include<stdio.h>\n    int main(){\n      if(:value:compare:value){\n          printf(:output);\n      }else{\n        printf(:output);\n      }\n        \n    }\n', 'low', 'sequential', '39', '2022-12-24 15:00:21', '39', '2022-12-24 15:00:21');
INSERT INTO `pattern` VALUES (139, '#include<stdio.h>\n    int main(){\n        int firstNumber=:value;\n        int secondNumber=:value;\n        int thirdNumber=:value;\n        if(firstNumber:comparethirdNumber){\n            int sum = firstNumber+thirdNumber-secondNumber;\n            printf(\"%d\",sum);\n        }else if(secondNumber:comparethirdNumber){\n            printf(\"%d\",thirdNumber);\n        }else{\n            printf(\"%d\",secondNumber);\n        }\n        \n    }\n', 'medium', 'conditional', '39', '2023-01-14 04:07:43', '39', '2023-01-14 04:07:43');
INSERT INTO `pattern` VALUES (140, '#include<stdio.h>\n    int main(){\n        int firstNumber=:value;\n        int secondNumber=:value;\n        int thirdNumber=:value;\n        int sum = firstNumber+thirdNumber-secondNumber;\n        printf(\"%d\",sum);\n    }\n', 'low', 'sequential', '13', '2023-02-03 04:12:53', '13', '2023-02-03 04:12:53');
INSERT INTO `pattern` VALUES (141, '#include<stdio.h>\n    int main(){\n        int firstNumber=:value;\n        int secondNumber=:value;\n        int thirdNumber=:value;\n        if(firstNumber:comparethirdNumber){\n            int sum = firstNumber+thirdNumber-secondNumber;\n            printf(\"%d\",sum);\n        }else if(secondNumber:comparethirdNumber){\n            printf(\"%d\",thirdNumber);\n        }else{\n            printf(\"%d\",secondNumber);\n        }\n        \n    }\n', 'medium', 'conditional', '13', '2023-02-03 04:13:53', '13', '2023-02-03 04:13:53');

-- ----------------------------
-- Table structure for quiz
-- ----------------------------
DROP TABLE IF EXISTS `quiz`;
CREATE TABLE `quiz`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `quiz_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `long_quiz_timer` int NULL DEFAULT NULL,
  `question` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `created_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `created_date` datetime NULL DEFAULT NULL,
  `last_modified_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `last_modified_date` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 32 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of quiz
-- ----------------------------
INSERT INTO `quiz` VALUES (1, 'quiz1', 'Latihan Kode Program Bahasa C: Menghitung Luas Persegi', 7, 'Buatlah kode program dalam bahasa C untuk menghitung luas persegi. Kode program butuh 1 inputan berupa panjang sisi persegi, kemudian tampilkan output luas persegi.\r\n\r\nBonus soal: buat juga dalam bentuk function.\r\n\r\nBerikut contoh tampilan akhir yang diinginkan (1) :\r\n\r\n## Program Bahasa C Menghitung Luas Persegi ##\r\n==============================================\r\n \r\nInput panjang sisi persegi: 5\r\nLuas persegi = 25.00\r\nBerikut contoh tampilan akhir yang diinginkan (2) :\r\n\r\n## Program Bahasa C Menghitung Luas Persegi ##\r\n==============================================\r\n \r\nInput panjang sisi persegi: 4.67\r\nLuas persegi = 21.81\r\nSilahkan coba sebentar membuat kode program ini.', '3', '2022-11-20 15:04:02', '3', '2022-11-20 15:04:02');
INSERT INTO `quiz` VALUES (2, 'quiz 2 ', 'Latihan Kode Program Bahasa C: Menghitung Luas Persegi Panjang', 7, 'Soal Menghitung Luas Persegi Panjang\r\nBuatlah kode program C untuk menghitung luas persegi panjang. Kode program butuh 2 inputan berupa panjang dan lebar persegi panjang, kemudian menampilkan output luas persegi panjang.\r\n\r\nBonus soal: buat juga dalam bentuk function.\r\n\r\nBerikut contoh tampilan akhir yang diinginkan (1) :\r\n\r\n## Program Bahasa C Menghitung Luas Persegi Panjang ##\r\n======================================================\r\n \r\nInput panjang persegi: 5\r\nInput lebar persegi: 7\r\nLuas persegi panjang = 35.00\r\nBerikut contoh tampilan akhir yang diinginkan (2) :\r\n\r\n## Program Bahasa C Menghitung Luas Persegi Panjang ##\r\n======================================================\r\n \r\nInput panjang persegi: 3.25\r\nInput lebar persegi: 5.75\r\nLuas persegi panjang = 18.69\r\n', '3', '2022-11-20 15:05:03', '3', '2022-11-20 15:05:03');
INSERT INTO `quiz` VALUES (3, '1uiz3', 'Latihan Kode Program Bahasa C: Menghitung Luas Segitiga', 8, 'Soal Menghitung Luas Segitiga\r\nBuatlah kode program dalam bahasa C untuk menghitung luas segitiga. Kode program butuh 2 inputan berupa alas dan tinggi segitiga, kemudian menampilkan output luas segitiga.\r\n\r\nBonus soal: buat juga dalam bentuk function.\r\n\r\nBerikut contoh tampilan akhir yang diinginkan (1) :\r\n\r\n## Program Bahasa C Menghitung Luas Segitiga ##\r\n===============================================\r\n\r\nInput alas segitiga: 5\r\nInput tinggi segitiga: 7\r\nLuas segitiga = 17.50\r\nBerikut contoh tampilan akhir yang diinginkan (2) :\r\n\r\n## Program Bahasa C Menghitung Luas Segitiga ##\r\n===============================================\r\n\r\nInput alas segitiga: 15.15\r\nInput tinggi segitiga: 9.99\r\nLuas segitiga = 75.67', '14', '2022-11-20 15:15:34', '14', '2022-11-20 15:15:34');
INSERT INTO `quiz` VALUES (9, 'quiz 4', 'persegi\r\n', 15, 'Soal Persegi Angka\nBuatlah kode program Java untuk menampilkan gambar persegi dalam bentuk susunan angka. Agar lebih bervariasi, kita akan buat dalam 3 bentuk angka. Kode program butuh satu inputan yang dipakai untuk menentukan besar persegi.\n\nBerikut variasi deret persegi angka pertama (soal 1):\n\nInput besar persegi: 6\n \n1 1 1 1 1 1\n2 2 2 2 2 2\n3 3 3 3 3 3\n4 4 4 4 4 4\n5 5 5 5 5 5\n6 6 6 6 6 6\nBerikut variasi deret persegi angka kedua (soal 2):\n\nInput besar persegi: 5\n \n1 2 3 4 5\n1 2 3 4 5\n1 2 3 4 5\n1 2 3 4 5\n1 2 3 4 5\nBerikut variasi deret persegi angka ketiga (soal 3):\n\nInput besar persegi: 9\n \n  1  2  3  4  5  6  7  8  9\n 10 11 12 13 14 15 16 17 18\n 19 20 21 22 23 24 25 26 27\n 28 29 30 31 32 33 34 35 36\n 37 38 39 40 41 42 43 44 45\n 46 47 48 49 50 51 52 53 54\n 55 56 57 58 59 60 61 62 63\n 64 65 66 67 68 69 70 71 72\n 73 74 75 76 77 78 79 80 81\nVariasi angka di setiap bentuk persegi sebenarnya hanya perlu sedikit modifikasi. Ini sangat pas untuk menguji logika bagaimana cara menampilkan setiap angka.', '1', '2022-11-24 03:07:54', '1', '2022-11-24 03:07:54');
INSERT INTO `quiz` VALUES (10, 'quiz 5', 'Piramida terbalik', 10, 'Soal Piramida Bintang Terbalik\nBuatlah kode program Java untuk menampilkan gambar piramida terbalik atau segitiga sama sisi terbalik dalam bentuk kumpulan bintang (karakter *).\n\nKode program butuh satu inputan yang dipakai untuk menentukan tinggi dari segitiga.\n\nBerikut contoh tampilan akhir yang diinginkan (1) :\n\nInput tinggi segitiga: 6\n \n * * * * * *\n  * * * * *\n   * * * *\n    * * *\n     * *\n      *\nBerikut contoh tampilan akhir yang diinginkan (2) :\n\nInput tinggi segitiga: 9\n \n * * * * * * * * *\n  * * * * * * * *\n   * * * * * * *\n    * * * * * *\n     * * * * *\n      * * * *\n       * * *\n        * *\n         *', '1', '2022-11-24 03:11:10', '1', '2022-11-24 03:11:10');
INSERT INTO `quiz` VALUES (11, 'Quiz 6', 'Kotak kotak', 10, 'Soal Persegi Angka\nBuatlah kode program Java untuk menampilkan gambar persegi dalam bentuk susunan angka. Agar lebih bervariasi, kita akan buat dalam 3 bentuk angka. Kode program butuh satu inputan yang dipakai untuk menentukan besar persegi.\n\nBerikut variasi deret persegi angka pertama (soal 1):\n\nInput besar persegi: 6\n \n1 1 1 1 1 1\n2 2 2 2 2 2\n3 3 3 3 3 3\n4 4 4 4 4 4\n5 5 5 5 5 5\n6 6 6 6 6 6\nBerikut variasi deret persegi angka kedua (soal 2):\n\nInput besar persegi: 5\n \n1 2 3 4 5\n1 2 3 4 5\n1 2 3 4 5\n1 2 3 4 5\n1 2 3 4 5\nBerikut variasi deret persegi angka ketiga (soal 3):\n\nInput besar persegi: 9\n \n  1  2  3  4  5  6  7  8  9\n 10 11 12 13 14 15 16 17 18\n 19 20 21 22 23 24 25 26 27\n 28 29 30 31 32 33 34 35 36\n 37 38 39 40 41 42 43 44 45\n 46 47 48 49 50 51 52 53 54\n 55 56 57 58 59 60 61 62 63\n 64 65 66 67 68 69 70 71 72\n 73 74 75 76 77 78 79 80 81', '14', '2022-11-24 04:18:17', '14', '2022-11-24 04:18:17');
INSERT INTO `quiz` VALUES (12, 'quiz 7', 'segitiga bintang', 20, 'Soal Segitiga Bintang\nBuatlah kode program Java untuk menampilkan gambar segitiga dalam bentuk kumpulan karakter bintang (karakter *). Kode program butuh satu inputan yang dipakai untuk menentukan tinggi dari segitiga.\n\nBerikut contoh tampilan akhir yang diinginkan (1) :\n\nInput tinggi segitiga: 4\n\n *\n * *\n * * *\n * * * *\nBerikut contoh tampilan akhir yang diinginkan (2) :\n\nInput tinggi segitiga: 8\n\n *\n * *\n * * *\n * * * *\n * * * * *\n * * * * * *\n * * * * * * *\n * * * * * * * *', '14', '2022-11-24 04:21:26', '14', '2022-11-24 04:21:26');
INSERT INTO `quiz` VALUES (13, 'test quiz 1', ' coba', 5, 'hallo?', '39', '2022-12-10 08:50:26', '39', '2022-12-10 08:50:26');
INSERT INTO `quiz` VALUES (14, 'ytest2', 'oke', 10, 'oke?', '39', '2022-12-10 09:05:38', '39', '2022-12-10 09:05:38');
INSERT INTO `quiz` VALUES (15, 'Test Quiz', 'test', 10, '??', '39', '2022-12-13 04:02:56', '39', '2022-12-13 04:02:56');
INSERT INTO `quiz` VALUES (16, 'Quiz ke -1', 'Quiz Kondisional', 3, 'lebih berat mana kapas 1 kilo atau batu 1 kilo', '39', '2022-12-14 14:20:19', '39', '2022-12-14 14:20:19');
INSERT INTO `quiz` VALUES (17, '????????????', '????????', 2, '?????????????', '39', '2022-12-20 02:29:39', '39', '2022-12-20 02:29:39');
INSERT INTO `quiz` VALUES (18, '!!!!!!!!', '!!!!!!!!!!', 2, '!!!!!!!', '39', '2022-12-20 02:50:21', '39', '2022-12-20 02:50:21');
INSERT INTO `quiz` VALUES (19, '1', '1', 1, '1', '39', '2022-12-20 10:01:38', '39', '2022-12-20 10:01:38');
INSERT INTO `quiz` VALUES (20, 'Latihan sequential', 'Menghitung luas segitiga', 1, 'Soal Menghitung Luas Segitiga\nBuatlah kode program C++ untuk menghitung luas segitiga. Kode program butuh 2 inputan berupa alas dan tinggi segitiga, kemudian menampilkan output luas segitiga.\n\nBonus soal: buat juga dalam bentuk function.\n\nBerikut contoh tampilan akhir yang diinginkan (1) :\n\nInput alas segitiga: 5\nInput tinggi segitiga: 7\n\nLuas segitiga = 17.5\nBerikut contoh tampilan akhir yang diinginkan (2) :\n\nInput alas segitiga: 20.5\nInput tinggi segitiga: 5.25\n\nLuas segitiga = 53.8125\nSilahkan coba sebentar membuat kode program ini.\n\n', '39', '2022-12-20 10:44:05', '39', '2023-01-29 13:11:18');
INSERT INTO `quiz` VALUES (21, 'hikari22', '21', 1, 'Soal Menghitung Luas Segitiga\nBuatlah kode program C++ untuk menghitung luas segitiga. Kode program butuh 2 inputan berupa alas dan tinggi segitiga, kemudian menampilkan output luas segitiga.\n\nBonus soal: buat juga dalam bentuk function.\n\nBerikut contoh tampilan akhir yang diinginkan (1) :\n\nInput alas segitiga: 5\nInput tinggi segitiga: 7\n\nLuas segitiga = 17.5\nBerikut contoh tampilan akhir yang diinginkan (2) :\n\nInput alas segitiga: 20.5\nInput tinggi segitiga: 5.25\n\nLuas segitiga = 53.8125\nSilahkan coba sebentar membuat kode program ini.\n\n', '39', '2023-01-10 03:08:19', '39', '2023-01-10 03:08:19');
INSERT INTO `quiz` VALUES (22, 'hikari22', '2111', 1, '2', '39', '2023-01-10 03:11:43', '39', '2023-01-10 03:11:43');
INSERT INTO `quiz` VALUES (23, 'soal quiz', 'quiz pertama', 1, '2', '39', '2023-01-14 04:09:08', '39', '2023-01-14 04:09:08');
INSERT INTO `quiz` VALUES (24, 'ytest2', 'oke', 10, 'Soal Menghitung Luas Segitiga\nBuatlah kode program C++ untuk menghitung luas segitiga. Kode program butuh 2 inputan berupa alas dan tinggi segitiga, kemudian menampilkan output luas segitiga.\n\nBonus soal: buat juga dalam bentuk function.\n\nBerikut contoh tampilan akhir yang diinginkan (1) :\n\nInput alas segitiga: 5\nInput tinggi segitiga: 7\n\nLuas segitiga = 17.5\nBerikut contoh tampilan akhir yang diinginkan (2) :\n\nInput alas segitiga: 20.5\nInput tinggi segitiga: 5.25\n\nLuas segitiga = 53.8125\nSilahkan coba sebentar membuat kode program ini.\n\n', '39', '2023-01-29 05:37:07', '39', '2023-01-29 05:37:07');
INSERT INTO `quiz` VALUES (25, '2', '21', 1, 'Soal Menghitung Luas Segitiga\nBuatlah kode program C++ untuk menghitung luas segitiga. Kode program butuh 2 inputan berupa alas dan tinggi segitiga, kemudian menampilkan output luas segitiga.\n\nBonus soal: buat juga dalam bentuk function.\n\nBerikut contoh tampilan akhir yang diinginkan (1) :\n\nInput alas segitiga: 5\nInput tinggi segitiga: 7\n\nLuas segitiga = 17.5\nBerikut contoh tampilan akhir yang diinginkan (2) :\n\nInput alas segitiga: 20.5\nInput tinggi segitiga: 5.25\n\nLuas segitiga = 53.8125\nSilahkan coba sebentar membuat kode program ini.\n\n', '39', '2023-01-29 05:37:25', '39', '2023-01-29 05:37:25');
INSERT INTO `quiz` VALUES (26, '2', '21', 1, 'Soal Menghitung Luas Segitiga\nBuatlah kode program C++ untuk menghitung luas segitiga. Kode program butuh 2 inputan berupa alas dan tinggi segitiga, kemudian menampilkan output luas segitiga.\n\nBonus soal: buat juga dalam bentuk function.\n\nBerikut contoh tampilan akhir yang diinginkan (1) :\n\nInput alas segitiga: 5\nInput tinggi segitiga: 7\n\nLuas segitiga = 17.5\nBerikut contoh tampilan akhir yang diinginkan (2) :\n\nInput alas segitiga: 20.5\nInput tinggi segitiga: 5.25\n\nLuas segitiga = 53.8125\nSilahkan coba sebentar membuat kode program ini.\n\n', '39', '2023-01-29 05:39:26', '39', '2023-01-29 05:39:26');
INSERT INTO `quiz` VALUES (27, 'Latihan sequensial', 'Latihan untuk menghitung luas segitiga', 1, 'Soal Menghitung Luas Segitiga\nBuatlah kode program C++ untuk menghitung luas segitiga. Kode program butuh 2 inputan berupa alas dan tinggi segitiga, kemudian menampilkan output luas segitiga.\n\nBonus soal: buat juga dalam bentuk function.\n\nBerikut contoh tampilan akhir yang diinginkan (1) :\n\nInput alas segitiga: 5\nInput tinggi segitiga: 7\n\nLuas segitiga = 17.5\nBerikut contoh tampilan akhir yang diinginkan (2) :\n\nInput alas segitiga: 20.5\nInput tinggi segitiga: 5.25\n\nLuas segitiga = 53.8125\nSilahkan coba sebentar membuat kode program ini.\n\n', '39', '2023-01-29 13:05:14', '39', '2023-01-29 13:05:14');
INSERT INTO `quiz` VALUES (28, 'Latihan sequensial 2', 'Latihan untuk menghitung luas segitiga', 2, 'Soal Menghitung Luas Segitiga\nBuatlah kode program C++ untuk menghitung luas segitiga. Kode program butuh 2 inputan berupa alas dan tinggi segitiga, kemudian menampilkan output luas segitiga.\n\nBonus soal: buat juga dalam bentuk function.\n\nBerikut contoh tampilan akhir yang diinginkan (1) :\n\nInput alas segitiga: 5\nInput tinggi segitiga: 7\n\nLuas segitiga = 17.5\nBerikut contoh tampilan akhir yang diinginkan (2) :\n\nInput alas segitiga: 20.5\nInput tinggi segitiga: 5.25\n\nLuas segitiga = 53.8125\nSilahkan coba sebentar membuat kode program ini.\n\n', '39', '2023-01-29 13:06:00', '39', '2023-01-29 13:06:00');
INSERT INTO `quiz` VALUES (29, 'Latihan sequensial 4', 'Latihan untuk menghitung luas segitiga', 2, 'Soal Menghitung Luas Segitiga\nBuatlah kode program C++ untuk menghitung luas segitiga. Kode program butuh 2 inputan berupa alas dan tinggi segitiga, kemudian menampilkan output luas segitiga.\n\nBonus soal: buat juga dalam bentuk function.\n\nBerikut contoh tampilan akhir yang diinginkan (1) :\n\nInput alas segitiga: 5\nInput tinggi segitiga: 7\n\nLuas segitiga = 17.5\nBerikut contoh tampilan akhir yang diinginkan (2) :\n\nInput alas segitiga: 20.5\nInput tinggi segitiga: 5.25\n\nLuas segitiga = 53.8125\nSilahkan coba sebentar membuat kode program ini.\n\n', '39', '2023-01-29 13:06:49', '39', '2023-01-29 13:10:37');
INSERT INTO `quiz` VALUES (30, 'test', 'test', 1, 'test', '39', '2023-01-29 13:10:50', '39', '2023-01-29 13:10:50');
INSERT INTO `quiz` VALUES (31, 'quiz sequential 1', 'jika luas nya lebih dari 50 maka print besar\n------', 5, 'Menghitung luas segitiga', '1', '2023-02-03 04:22:49', '1', '2023-02-03 04:22:49');

-- ----------------------------
-- Table structure for quiz_correction
-- ----------------------------
DROP TABLE IF EXISTS `quiz_correction`;
CREATE TABLE `quiz_correction`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `student_quiz_id` int NULL DEFAULT NULL,
  `value` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `note` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `created_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `created_date` datetime NULL DEFAULT NULL,
  `last_modified_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `last_modified_date` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `pk_stid`(`student_quiz_id`) USING BTREE,
  CONSTRAINT `pk_stid` FOREIGN KEY (`student_quiz_id`) REFERENCES `student_quiz` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 32 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of quiz_correction
-- ----------------------------
INSERT INTO `quiz_correction` VALUES (26, 94, '10', 'ok', '39', '2023-01-04 07:06:18', '39', '2023-01-04 07:06:18');
INSERT INTO `quiz_correction` VALUES (27, 95, '10', 'ok', '39', '2023-01-04 07:06:33', '39', '2023-01-04 07:06:33');
INSERT INTO `quiz_correction` VALUES (28, 97, '1', 'ok', '39', '2023-01-06 03:17:28', '39', '2023-01-06 03:17:28');
INSERT INTO `quiz_correction` VALUES (29, 98, '3', 'ok', '39', '2023-01-29 05:34:47', '39', '2023-01-29 05:34:47');
INSERT INTO `quiz_correction` VALUES (30, 100, '100', 'ok lah', '39', '2023-01-29 06:06:57', '39', '2023-01-29 06:06:57');
INSERT INTO `quiz_correction` VALUES (31, 103, '10', 'jawaban tidak sesuai', '1', '2023-02-03 04:26:16', '1', '2023-02-03 04:26:16');

-- ----------------------------
-- Table structure for self_exercise
-- ----------------------------
DROP TABLE IF EXISTS `self_exercise`;
CREATE TABLE `self_exercise`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `exercise_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `created_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `created_date` datetime NULL DEFAULT NULL,
  `last_modified_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `last_modified_date` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 36 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of self_exercise
-- ----------------------------
INSERT INTO `self_exercise` VALUES (30, 'first exercise', 'halo', '13', '2022-12-08 08:01:04', '13', '2022-12-08 08:01:04');
INSERT INTO `self_exercise` VALUES (31, 'if exercise part 1', 'test', '13', '2022-12-22 00:33:15', '13', '2022-12-22 00:33:15');
INSERT INTO `self_exercise` VALUES (32, 'if exercise part 2', 'tettttt', '13', '2022-12-22 00:34:06', '13', '2022-12-22 00:34:06');
INSERT INTO `self_exercise` VALUES (33, '1', '1', '13', '2022-12-22 00:35:01', '13', '2022-12-22 00:35:01');
INSERT INTO `self_exercise` VALUES (34, 'test', 'test', '13', '2022-12-22 00:55:31', '13', '2022-12-22 00:55:31');
INSERT INTO `self_exercise` VALUES (35, 'Self exercise baru', 'llatihan sequential dan conditional', '13', '2023-02-03 04:15:36', '13', '2023-02-03 04:15:36');

-- ----------------------------
-- Table structure for self_exercise_answer
-- ----------------------------
DROP TABLE IF EXISTS `self_exercise_answer`;
CREATE TABLE `self_exercise_answer`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `no_index` int NULL DEFAULT NULL,
  `exercise_id` int NULL DEFAULT NULL,
  `generate_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `code` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `answer` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `created_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `created_date` datetime NULL DEFAULT NULL,
  `last_modified_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `last_modified_date` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FKhj9h1bqhlofn78ul0yx90p99u`(`exercise_id`) USING BTREE,
  CONSTRAINT `self_exercise_answer_ibfk_1` FOREIGN KEY (`exercise_id`) REFERENCES `self_exercise` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 374 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of self_exercise_answer
-- ----------------------------
INSERT INTO `self_exercise_answer` VALUES (319, 2, 30, 'f076aa95-d61c-4107-b35c-395e3204fff8', 'class Program{\n    public static void main(String[]args){\n      int a =14;\n      int b = 9;\n      int c = a+b;\n      if(a<b){\n        System.out.println(b);\n      }else{\n        System.out.println(c);  \n      }\n      \n    }\n} ', '23\r\n', '13', '2022-12-08 08:01:28', '13', '2022-12-08 08:01:28');
INSERT INTO `self_exercise_answer` VALUES (320, 3, 30, 'f076aa95-d61c-4107-b35c-395e3204fff8', 'class Program{\n    public static void main(String[]args){\n      int a =29;\n      int b = 6;\n      int c = a+b;\n      if(a<b){\n        System.out.println(b);\n      }else{\n        System.out.println(c);  \n      }\n      \n    }\n} ', '35\r\n', '13', '2022-12-08 08:01:28', '13', '2022-12-08 08:01:28');
INSERT INTO `self_exercise_answer` VALUES (321, 1, 30, 'f076aa95-d61c-4107-b35c-395e3204fff8', 'class Program{\n    public static void main(String[]args){\n      int a =5;\n      int b = 19;\n      int c = a+b;\n      if(a<b){\n        System.out.println(b);\n      }else{\n        System.out.println(c);  \n      }\n      \n    }\n} ', '19\r\n', '13', '2022-12-08 08:01:28', '13', '2022-12-08 08:01:28');
INSERT INTO `self_exercise_answer` VALUES (322, 5, 30, 'f076aa95-d61c-4107-b35c-395e3204fff8', 'class Program{\n    public static void main(String[]args){\n      int a =14;\n      int b = 15;\n      int c = a+b;\n      if(a<b){\n        System.out.println(b);\n      }else{\n        System.out.println(c);  \n      }\n      \n    }\n} ', '15\r\n', '13', '2022-12-08 08:01:30', '13', '2022-12-08 08:01:30');
INSERT INTO `self_exercise_answer` VALUES (323, 6, 30, 'f076aa95-d61c-4107-b35c-395e3204fff8', 'class Program{\n    public static void main(String[]args){\n      int a =17;\n      int b = 24;\n      int c = a+b;\n      if(a<b){\n        System.out.println(b);\n      }else{\n        System.out.println(c);  \n      }\n      \n    }\n} ', '24\r\n', '13', '2022-12-08 08:01:30', '13', '2022-12-08 08:01:30');
INSERT INTO `self_exercise_answer` VALUES (324, 4, 30, 'f076aa95-d61c-4107-b35c-395e3204fff8', 'class Program{\n    public static void main(String[]args){\n      int a =22;\n      int b = 28;\n      int c = a+b;\n      if(a<b){\n        System.out.println(b);\n      }else{\n        System.out.println(c);  \n      }\n      \n    }\n} ', '28\r\n', '13', '2022-12-08 08:01:30', '13', '2022-12-08 08:01:30');
INSERT INTO `self_exercise_answer` VALUES (325, 7, 30, 'f076aa95-d61c-4107-b35c-395e3204fff8', 'class Program{\n    public static void main(String[]args){\n      int a =12;\n      int b = 28;\n      int c = a+b;\n      if(a<b){\n        System.out.println(b);\n      }else{\n        System.out.println(c);  \n      }\n      \n    }\n} ', '28\r\n', '13', '2022-12-08 08:01:33', '13', '2022-12-08 08:01:33');
INSERT INTO `self_exercise_answer` VALUES (326, 8, 30, 'f076aa95-d61c-4107-b35c-395e3204fff8', 'class Program{\n    public static void main(String[]args){\n      int a =22;\n      int b = 13;\n      int c = a+b;\n      if(a<b){\n        System.out.println(b);\n      }else{\n        System.out.println(c);  \n      }\n      \n    }\n} ', '35\r\n', '13', '2022-12-08 08:01:33', '13', '2022-12-08 08:01:33');
INSERT INTO `self_exercise_answer` VALUES (327, 9, 30, 'f076aa95-d61c-4107-b35c-395e3204fff8', 'class Program{\n    public static void main(String[]args){\n      int a =18;\n      int b = 16;\n      int c = a+b;\n      if(a<b){\n        System.out.println(b);\n      }else{\n        System.out.println(c);  \n      }\n      \n    }\n} ', '34\r\n', '13', '2022-12-08 08:01:33', '13', '2022-12-08 08:01:33');
INSERT INTO `self_exercise_answer` VALUES (328, 2, 30, '2c5a4538-72f0-4d2c-bd70-567cd52317bd', 'class Program{\n    public static void main(String[]args){\n      int a =29;\n      int b = 1;\n      int c = a+b;\n      if(a<b){\n        System.out.println(b);\n      }else{\n        System.out.println(c);  \n      }\n      \n    }\n} ', '30\r\n', '13', '2022-12-08 08:38:00', '13', '2022-12-08 08:38:00');
INSERT INTO `self_exercise_answer` VALUES (329, 1, 30, '2c5a4538-72f0-4d2c-bd70-567cd52317bd', 'class Program{\n    public static void main(String[]args){\n      int a =29;\n      int b = 8;\n      int c = a+b;\n      if(a<b){\n        System.out.println(b);\n      }else{\n        System.out.println(c);  \n      }\n      \n    }\n} ', '37\r\n', '13', '2022-12-08 08:38:00', '13', '2022-12-08 08:38:00');
INSERT INTO `self_exercise_answer` VALUES (330, 3, 30, '2c5a4538-72f0-4d2c-bd70-567cd52317bd', 'class Program{\n    public static void main(String[]args){\n      int a =5;\n      int b = 22;\n      int c = a+b;\n      if(a<b){\n        System.out.println(b);\n      }else{\n        System.out.println(c);  \n      }\n      \n    }\n} ', '22\r\n', '13', '2022-12-08 08:38:00', '13', '2022-12-08 08:38:00');
INSERT INTO `self_exercise_answer` VALUES (331, 5, 30, '2c5a4538-72f0-4d2c-bd70-567cd52317bd', 'class Program{\n    public static void main(String[]args){\n      int a =9;\n      int b = 22;\n      int c = a+b;\n      if(a<b){\n        System.out.println(b);\n      }else{\n        System.out.println(c);  \n      }\n      \n    }\n} ', '22\r\n', '13', '2022-12-08 08:38:03', '13', '2022-12-08 08:38:03');
INSERT INTO `self_exercise_answer` VALUES (332, 6, 30, '2c5a4538-72f0-4d2c-bd70-567cd52317bd', 'class Program{\n    public static void main(String[]args){\n      int a =3;\n      int b = 12;\n      int c = a+b;\n      if(a<b){\n        System.out.println(b);\n      }else{\n        System.out.println(c);  \n      }\n      \n    }\n} ', '12\r\n', '13', '2022-12-08 08:38:03', '13', '2022-12-08 08:38:03');
INSERT INTO `self_exercise_answer` VALUES (333, 4, 30, '2c5a4538-72f0-4d2c-bd70-567cd52317bd', 'class Program{\n    public static void main(String[]args){\n      int a =6;\n      int b = 5;\n      int c = a+b;\n      if(a<b){\n        System.out.println(b);\n      }else{\n        System.out.println(c);  \n      }\n      \n    }\n} ', '11\r\n', '13', '2022-12-08 08:38:03', '13', '2022-12-08 08:38:03');
INSERT INTO `self_exercise_answer` VALUES (334, 8, 30, '2c5a4538-72f0-4d2c-bd70-567cd52317bd', 'class Program{\n    public static void main(String[]args){\n      int a =27;\n      int b = 10;\n      int c = a+b;\n      if(a<b){\n        System.out.println(b);\n      }else{\n        System.out.println(c);  \n      }\n      \n    }\n} ', '37\r\n', '13', '2022-12-08 08:38:05', '13', '2022-12-08 08:38:05');
INSERT INTO `self_exercise_answer` VALUES (335, 7, 30, '2c5a4538-72f0-4d2c-bd70-567cd52317bd', 'class Program{\n    public static void main(String[]args){\n      int a =23;\n      int b = 9;\n      int c = a+b;\n      if(a<b){\n        System.out.println(b);\n      }else{\n        System.out.println(c);  \n      }\n      \n    }\n} ', '32\r\n', '13', '2022-12-08 08:38:05', '13', '2022-12-08 08:38:05');
INSERT INTO `self_exercise_answer` VALUES (336, 9, 30, '2c5a4538-72f0-4d2c-bd70-567cd52317bd', 'class Program{\n    public static void main(String[]args){\n      int a =17;\n      int b = 12;\n      int c = a+b;\n      if(a<b){\n        System.out.println(b);\n      }else{\n        System.out.println(c);  \n      }\n      \n    }\n} ', '29\r\n', '13', '2022-12-08 08:38:05', '13', '2022-12-08 08:38:05');
INSERT INTO `self_exercise_answer` VALUES (337, 3, 30, '434525f0-781e-463e-b320-e2cb3e7f71b5', 'class Program{\n    public static void main(String[]args){\n      int a =1;\n      int b = 2;\n      int c = a+b;\n      if(a<b){\n        System.out.println(b);\n      }else{\n        System.out.println(c);  \n      }\n      \n    }\n} ', '2\r\n', '13', '2022-12-08 08:46:46', '13', '2022-12-08 08:46:46');
INSERT INTO `self_exercise_answer` VALUES (338, 1, 30, '434525f0-781e-463e-b320-e2cb3e7f71b5', 'class Program{\n    public static void main(String[]args){\n      int a =8;\n      int b = 6;\n      int c = a+b;\n      if(a<b){\n        System.out.println(b);\n      }else{\n        System.out.println(c);  \n      }\n      \n    }\n} ', '14\r\n', '13', '2022-12-08 08:46:46', '13', '2022-12-08 08:46:46');
INSERT INTO `self_exercise_answer` VALUES (339, 2, 30, '434525f0-781e-463e-b320-e2cb3e7f71b5', 'class Program{\n    public static void main(String[]args){\n      int a =27;\n      int b = 12;\n      int c = a+b;\n      if(a<b){\n        System.out.println(b);\n      }else{\n        System.out.println(c);  \n      }\n      \n    }\n} ', '39\r\n', '13', '2022-12-08 08:46:46', '13', '2022-12-08 08:46:46');
INSERT INTO `self_exercise_answer` VALUES (340, 5, 30, '434525f0-781e-463e-b320-e2cb3e7f71b5', 'class Program{\n    public static void main(String[]args){\n      int a =5;\n      int b = 13;\n      int c = a+b;\n      if(a<b){\n        System.out.println(b);\n      }else{\n        System.out.println(c);  \n      }\n      \n    }\n} ', '13\r\n', '13', '2022-12-08 08:46:48', '13', '2022-12-08 08:46:48');
INSERT INTO `self_exercise_answer` VALUES (341, 6, 30, '434525f0-781e-463e-b320-e2cb3e7f71b5', 'class Program{\n    public static void main(String[]args){\n      int a =9;\n      int b = 28;\n      int c = a+b;\n      if(a<b){\n        System.out.println(b);\n      }else{\n        System.out.println(c);  \n      }\n      \n    }\n} ', '28\r\n', '13', '2022-12-08 08:46:48', '13', '2022-12-08 08:46:48');
INSERT INTO `self_exercise_answer` VALUES (342, 4, 30, '434525f0-781e-463e-b320-e2cb3e7f71b5', 'class Program{\n    public static void main(String[]args){\n      int a =4;\n      int b = 14;\n      int c = a+b;\n      if(a<b){\n        System.out.println(b);\n      }else{\n        System.out.println(c);  \n      }\n      \n    }\n} ', '14\r\n', '13', '2022-12-08 08:46:48', '13', '2022-12-08 08:46:48');
INSERT INTO `self_exercise_answer` VALUES (343, 8, 30, '434525f0-781e-463e-b320-e2cb3e7f71b5', 'class Program{\n    public static void main(String[]args){\n      int a =16;\n      int b = 2;\n      int c = a+b;\n      if(a<b){\n        System.out.println(b);\n      }else{\n        System.out.println(c);  \n      }\n      \n    }\n} ', '18\r\n', '13', '2022-12-08 08:46:51', '13', '2022-12-08 08:46:51');
INSERT INTO `self_exercise_answer` VALUES (344, 7, 30, '434525f0-781e-463e-b320-e2cb3e7f71b5', 'class Program{\n    public static void main(String[]args){\n      int a =17;\n      int b = 28;\n      int c = a+b;\n      if(a<b){\n        System.out.println(b);\n      }else{\n        System.out.println(c);  \n      }\n      \n    }\n} ', '28\r\n', '13', '2022-12-08 08:46:51', '13', '2022-12-08 08:46:51');
INSERT INTO `self_exercise_answer` VALUES (345, 9, 30, '434525f0-781e-463e-b320-e2cb3e7f71b5', 'class Program{\n    public static void main(String[]args){\n      int a =7;\n      int b = 23;\n      int c = a+b;\n      if(a<b){\n        System.out.println(b);\n      }else{\n        System.out.println(c);  \n      }\n      \n    }\n} ', '23\r\n', '13', '2022-12-08 08:46:51', '13', '2022-12-08 08:46:51');
INSERT INTO `self_exercise_answer` VALUES (346, 2, 31, '8c5feba4-9263-4359-8937-8fbc99e94c23', '#include<stdio.h>\n    int main(){\n        int firstNumber=7;\n        int secondNumber=2;\n        int thirdNumber=3;\n        if(firstNumber>=thirdNumber){\n            int sum = firstNumber+thirdNumber-secondNumber;\n            printf(\"%d\",sum);\n        }else if(secondNumber==thirdNumber){\n            printf(\"%d\",thirdNumber);\n        }else{\n            printf(\"%d\",secondNumber);\n        }\n        \n    }\n', '8', '13', '2022-12-22 01:11:45', '13', '2022-12-22 01:11:45');
INSERT INTO `self_exercise_answer` VALUES (347, 1, 31, '8c5feba4-9263-4359-8937-8fbc99e94c23', '#include<stdio.h>\n    int main(){\n        int firstNumber=15;\n        int secondNumber=3;\n        int thirdNumber=1;\n        if(firstNumber!=thirdNumber){\n            int sum = firstNumber+thirdNumber-secondNumber;\n            printf(\"%d\",sum);\n        }else if(secondNumber<=thirdNumber){\n            printf(\"%d\",thirdNumber);\n        }else{\n            printf(\"%d\",secondNumber);\n        }\n        \n    }\n', '8', '13', '2022-12-22 01:11:45', '13', '2022-12-22 01:11:45');
INSERT INTO `self_exercise_answer` VALUES (348, 3, 31, '8c5feba4-9263-4359-8937-8fbc99e94c23', '#include<stdio.h>\n    int main(){\n        int firstNumber=24;\n        int secondNumber=17;\n        int thirdNumber=29;\n        if(firstNumber<=thirdNumber){\n            int sum = firstNumber+thirdNumber-secondNumber;\n            printf(\"%d\",sum);\n        }else if(secondNumber>=thirdNumber){\n            printf(\"%d\",thirdNumber);\n        }else{\n            printf(\"%d\",secondNumber);\n        }\n        \n    }\n', '8', '13', '2022-12-22 01:11:45', '13', '2022-12-22 01:11:45');
INSERT INTO `self_exercise_answer` VALUES (349, 4, 31, '8c5feba4-9263-4359-8937-8fbc99e94c23', '#include<stdio.h>\n    int main(){\n        int firstNumber=23;\n        int secondNumber=3;\n        int thirdNumber=29;\n        if(firstNumber!=thirdNumber){\n            int sum = firstNumber+thirdNumber-secondNumber;\n            printf(\"%d\",sum);\n        }else if(secondNumber<thirdNumber){\n            printf(\"%d\",thirdNumber);\n        }else{\n            printf(\"%d\",secondNumber);\n        }\n        \n    }\n', '8', '13', '2022-12-22 01:11:46', '13', '2022-12-22 01:11:46');
INSERT INTO `self_exercise_answer` VALUES (350, 6, 31, '8c5feba4-9263-4359-8937-8fbc99e94c23', '#include<stdio.h>\n    int main(){\n        int firstNumber=26;\n        int secondNumber=25;\n        int thirdNumber=24;\n        if(firstNumber<=thirdNumber){\n            int sum = firstNumber+thirdNumber-secondNumber;\n            printf(\"%d\",sum);\n        }else if(secondNumber>=thirdNumber){\n            printf(\"%d\",thirdNumber);\n        }else{\n            printf(\"%d\",secondNumber);\n        }\n        \n    }\n', '8', '13', '2022-12-22 01:11:46', '13', '2022-12-22 01:11:46');
INSERT INTO `self_exercise_answer` VALUES (351, 5, 31, '8c5feba4-9263-4359-8937-8fbc99e94c23', '#include<stdio.h>\n    int main(){\n        int firstNumber=9;\n        int secondNumber=20;\n        int thirdNumber=26;\n        if(firstNumber!=thirdNumber){\n            int sum = firstNumber+thirdNumber-secondNumber;\n            printf(\"%d\",sum);\n        }else if(secondNumber!=thirdNumber){\n            printf(\"%d\",thirdNumber);\n        }else{\n            printf(\"%d\",secondNumber);\n        }\n        \n    }\n', '8', '13', '2022-12-22 01:11:46', '13', '2022-12-22 01:11:46');
INSERT INTO `self_exercise_answer` VALUES (352, 7, 31, '8c5feba4-9263-4359-8937-8fbc99e94c23', '#include<stdio.h>\n    int main(){\n        int firstNumber=5;\n        int secondNumber=24;\n        int thirdNumber=7;\n        if(firstNumber<=thirdNumber){\n            int sum = firstNumber+thirdNumber-secondNumber;\n            printf(\"%d\",sum);\n        }else if(secondNumber<=thirdNumber){\n            printf(\"%d\",thirdNumber);\n        }else{\n            printf(\"%d\",secondNumber);\n        }\n        \n    }\n', '8', '13', '2022-12-22 01:11:48', '13', '2022-12-22 01:11:48');
INSERT INTO `self_exercise_answer` VALUES (353, 8, 31, '8c5feba4-9263-4359-8937-8fbc99e94c23', '#include<stdio.h>\n    int main(){\n        int firstNumber=6;\n        int secondNumber=21;\n        int thirdNumber=4;\n        if(firstNumber>thirdNumber){\n            int sum = firstNumber+thirdNumber-secondNumber;\n            printf(\"%d\",sum);\n        }else if(secondNumber>thirdNumber){\n            printf(\"%d\",thirdNumber);\n        }else{\n            printf(\"%d\",secondNumber);\n        }\n        \n    }\n', '8', '13', '2022-12-22 01:11:48', '13', '2022-12-22 01:11:48');
INSERT INTO `self_exercise_answer` VALUES (354, 9, 31, '8c5feba4-9263-4359-8937-8fbc99e94c23', '#include<stdio.h>\n    int main(){\n        for(int i=0;i<10;i++){\n            printf(\"%d\",i);\n        }\n    }\n', '8', '13', '2022-12-22 01:11:48', '13', '2022-12-22 01:11:48');
INSERT INTO `self_exercise_answer` VALUES (355, 10, 31, '8c5feba4-9263-4359-8937-8fbc99e94c23', '#include<stdio.h>\n    int main(){\n        for(int i=0;i<10;i++){\n            printf(\"%d\",i);\n        }\n    }\n', '8', '13', '2022-12-22 01:11:49', '13', '2022-12-22 01:11:49');
INSERT INTO `self_exercise_answer` VALUES (356, 1, 31, '0346cf8b-0179-4d2b-bd7b-67b8c98734ec', '#include<stdio.h>\n    int main(){\n        int firstNumber=15;\n        int secondNumber=26;\n        int thirdNumber=18;\n        if(firstNumber==thirdNumber){\n            int sum = firstNumber+thirdNumber-secondNumber;\n            printf(\"%d\",sum);\n        }else if(secondNumber>=thirdNumber){\n            printf(\"%d\",thirdNumber);\n        }else{\n            printf(\"%d\",secondNumber);\n        }\n        \n    }\n', '8', '13', '2022-12-22 03:41:28', '13', '2022-12-22 03:41:28');
INSERT INTO `self_exercise_answer` VALUES (357, 2, 31, '0346cf8b-0179-4d2b-bd7b-67b8c98734ec', '#include<stdio.h>\n    int main(){\n        int firstNumber=15;\n        int secondNumber=24;\n        int thirdNumber=18;\n        if(firstNumber>thirdNumber){\n            int sum = firstNumber+thirdNumber-secondNumber;\n            printf(\"%d\",sum);\n        }else if(secondNumber>thirdNumber){\n            printf(\"%d\",thirdNumber);\n        }else{\n            printf(\"%d\",secondNumber);\n        }\n        \n    }\n', '8', '13', '2022-12-22 03:41:28', '13', '2022-12-22 03:41:28');
INSERT INTO `self_exercise_answer` VALUES (358, 3, 31, '0346cf8b-0179-4d2b-bd7b-67b8c98734ec', '#include<stdio.h>\n    int main(){\n        int firstNumber=6;\n        int secondNumber=9;\n        int thirdNumber=18;\n        if(firstNumber<thirdNumber){\n            int sum = firstNumber+thirdNumber-secondNumber;\n            printf(\"%d\",sum);\n        }else if(secondNumber==thirdNumber){\n            printf(\"%d\",thirdNumber);\n        }else{\n            printf(\"%d\",secondNumber);\n        }\n        \n    }\n', '8', '13', '2022-12-22 03:41:29', '13', '2022-12-22 03:41:29');
INSERT INTO `self_exercise_answer` VALUES (359, 4, 31, '0346cf8b-0179-4d2b-bd7b-67b8c98734ec', '#include<stdio.h>\n    int main(){\n        int firstNumber=20;\n        int secondNumber=1;\n        int thirdNumber=6;\n        if(firstNumber<=thirdNumber){\n            int sum = firstNumber+thirdNumber-secondNumber;\n            printf(\"%d\",sum);\n        }else if(secondNumber<=thirdNumber){\n            printf(\"%d\",thirdNumber);\n        }else{\n            printf(\"%d\",secondNumber);\n        }\n        \n    }\n', '8', '13', '2022-12-22 03:41:31', '13', '2022-12-22 03:41:31');
INSERT INTO `self_exercise_answer` VALUES (360, 5, 31, '0346cf8b-0179-4d2b-bd7b-67b8c98734ec', '#include<stdio.h>\n    int main(){\n        int firstNumber=22;\n        int secondNumber=8;\n        int thirdNumber=17;\n        if(firstNumber!=thirdNumber){\n            int sum = firstNumber+thirdNumber-secondNumber;\n            printf(\"%d\",sum);\n        }else if(secondNumber>thirdNumber){\n            printf(\"%d\",thirdNumber);\n        }else{\n            printf(\"%d\",secondNumber);\n        }\n        \n    }\n', '8', '13', '2022-12-22 03:41:31', '13', '2022-12-22 03:41:31');
INSERT INTO `self_exercise_answer` VALUES (361, 6, 31, '0346cf8b-0179-4d2b-bd7b-67b8c98734ec', '#include<stdio.h>\n    int main(){\n        int firstNumber=23;\n        int secondNumber=4;\n        int thirdNumber=29;\n        if(firstNumber<thirdNumber){\n            int sum = firstNumber+thirdNumber-secondNumber;\n            printf(\"%d\",sum);\n        }else if(secondNumber>thirdNumber){\n            printf(\"%d\",thirdNumber);\n        }else{\n            printf(\"%d\",secondNumber);\n        }\n        \n    }\n', '8', '13', '2022-12-22 03:41:31', '13', '2022-12-22 03:41:31');
INSERT INTO `self_exercise_answer` VALUES (362, 7, 31, '0346cf8b-0179-4d2b-bd7b-67b8c98734ec', '#include<stdio.h>\n    int main(){\n        int firstNumber=24;\n        int secondNumber=25;\n        int thirdNumber=28;\n        if(firstNumber!=thirdNumber){\n            int sum = firstNumber+thirdNumber-secondNumber;\n            printf(\"%d\",sum);\n        }else if(secondNumber!=thirdNumber){\n            printf(\"%d\",thirdNumber);\n        }else{\n            printf(\"%d\",secondNumber);\n        }\n        \n    }\n', '8', '13', '2022-12-22 03:41:33', '13', '2022-12-22 03:41:33');
INSERT INTO `self_exercise_answer` VALUES (363, 8, 31, '0346cf8b-0179-4d2b-bd7b-67b8c98734ec', '#include<stdio.h>\n    int main(){\n        int firstNumber=17;\n        int secondNumber=9;\n        int thirdNumber=15;\n        if(firstNumber>=thirdNumber){\n            int sum = firstNumber+thirdNumber-secondNumber;\n            printf(\"%d\",sum);\n        }else if(secondNumber<=thirdNumber){\n            printf(\"%d\",thirdNumber);\n        }else{\n            printf(\"%d\",secondNumber);\n        }\n        \n    }\n', '8', '13', '2022-12-22 03:41:33', '13', '2022-12-22 03:41:33');
INSERT INTO `self_exercise_answer` VALUES (364, 9, 31, '0346cf8b-0179-4d2b-bd7b-67b8c98734ec', '#include<stdio.h>\n    int main(){\n        for(int i=0;i<10;i++){\n            printf(\"%d\",i);\n        }\n    }\n', '8', '13', '2022-12-22 03:41:33', '13', '2022-12-22 03:41:33');
INSERT INTO `self_exercise_answer` VALUES (365, 10, 31, '0346cf8b-0179-4d2b-bd7b-67b8c98734ec', '#include<stdio.h>\n    int main(){\n        for(int i=0;i<10;i++){\n            printf(\"%d\",i);\n        }\n    }\n', '8', '13', '2022-12-22 03:41:34', '13', '2022-12-22 03:41:34');
INSERT INTO `self_exercise_answer` VALUES (366, 1, 34, '40bd83c0-8751-4ab6-8401-d7f55ce25001', '#include<stdio.h>\n    int main(){\n        int firstNumber=10;\n        int secondNumber=27;\n        int thirdNumber=21;\n        if(firstNumber>thirdNumber){\n            int sum = firstNumber+thirdNumber-secondNumber;\n            printf(\"%d\",sum);\n        }else if(secondNumber<thirdNumber){\n            printf(\"%d\",thirdNumber);\n        }else{\n            printf(\"%d\",secondNumber);\n        }\n        \n    }\n', '27', '13', '2022-12-22 03:43:48', '13', '2022-12-22 03:43:48');
INSERT INTO `self_exercise_answer` VALUES (367, 2, 34, '40bd83c0-8751-4ab6-8401-d7f55ce25001', '#include<stdio.h>\n    int main(){\n        int firstNumber=15;\n        int secondNumber=18;\n        int thirdNumber=13;\n        if(firstNumber>thirdNumber){\n            int sum = firstNumber+thirdNumber-secondNumber;\n            printf(\"%d\",sum);\n        }else if(secondNumber!=thirdNumber){\n            printf(\"%d\",thirdNumber);\n        }else{\n            printf(\"%d\",secondNumber);\n        }\n        \n    }\n', '10', '13', '2022-12-22 03:43:48', '13', '2022-12-22 03:43:48');
INSERT INTO `self_exercise_answer` VALUES (368, 1, 35, 'b0e00e0c-9991-405d-8a15-264593d1a140', '#include<stdio.h>\n    int main(){\n        int firstNumber=3;\n        int secondNumber=13;\n        int thirdNumber=9;\n        if(firstNumber<=thirdNumber){\n            int sum = firstNumber+thirdNumber-secondNumber;\n            printf(\"%d\",sum);\n        }else if(secondNumber>thirdNumber){\n            printf(\"%d\",thirdNumber);\n        }else{\n            printf(\"%d\",secondNumber);\n        }\n        \n    }\n', '-1', '13', '2023-02-03 04:17:02', '13', '2023-02-03 04:17:02');
INSERT INTO `self_exercise_answer` VALUES (369, 3, 35, 'b0e00e0c-9991-405d-8a15-264593d1a140', '#include<stdio.h>\n    int main(){\n        int firstNumber=9;\n        int secondNumber=11;\n        int thirdNumber=18;\n        if(firstNumber!=thirdNumber){\n            int sum = firstNumber+thirdNumber-secondNumber;\n            printf(\"%d\",sum);\n        }else if(secondNumber>=thirdNumber){\n            printf(\"%d\",thirdNumber);\n        }else{\n            printf(\"%d\",secondNumber);\n        }\n        \n    }\n', '16', '13', '2023-02-03 04:17:02', '13', '2023-02-03 04:17:02');
INSERT INTO `self_exercise_answer` VALUES (370, 2, 35, 'b0e00e0c-9991-405d-8a15-264593d1a140', '#include<stdio.h>\n    int main(){\n        int firstNumber=27;\n        int secondNumber=3;\n        int thirdNumber=20;\n        if(firstNumber<=thirdNumber){\n            int sum = firstNumber+thirdNumber-secondNumber;\n            printf(\"%d\",sum);\n        }else if(secondNumber>=thirdNumber){\n            printf(\"%d\",thirdNumber);\n        }else{\n            printf(\"%d\",secondNumber);\n        }\n        \n    }\n', '3', '13', '2023-02-03 04:17:02', '13', '2023-02-03 04:17:02');
INSERT INTO `self_exercise_answer` VALUES (371, 6, 35, 'b0e00e0c-9991-405d-8a15-264593d1a140', '#include<stdio.h>\n    int main(){\n        int firstNumber=26;\n        int secondNumber=20;\n        int thirdNumber=4;\n        int sum = firstNumber+thirdNumber-secondNumber;\n        printf(\"%d\",sum);\n    }\n', '10', '13', '2023-02-03 04:17:03', '13', '2023-02-03 04:17:03');
INSERT INTO `self_exercise_answer` VALUES (372, 4, 35, 'b0e00e0c-9991-405d-8a15-264593d1a140', '#include<stdio.h>\n    int main(){\n        int firstNumber=2;\n        int secondNumber=19;\n        int thirdNumber=9;\n        int sum = firstNumber+thirdNumber-secondNumber;\n        printf(\"%d\",sum);\n    }\n', '-8', '13', '2023-02-03 04:17:03', '13', '2023-02-03 04:17:03');
INSERT INTO `self_exercise_answer` VALUES (373, 5, 35, 'b0e00e0c-9991-405d-8a15-264593d1a140', '#include<stdio.h>\n    int main(){\n        int firstNumber=14;\n        int secondNumber=16;\n        int thirdNumber=3;\n        int sum = firstNumber+thirdNumber-secondNumber;\n        printf(\"%d\",sum);\n    }\n', '1', '13', '2023-02-03 04:17:03', '13', '2023-02-03 04:17:03');

-- ----------------------------
-- Table structure for self_exercise_pattern
-- ----------------------------
DROP TABLE IF EXISTS `self_exercise_pattern`;
CREATE TABLE `self_exercise_pattern`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `pattern_id` int NOT NULL,
  `exercise_id` int NOT NULL,
  `amount` int NULL DEFAULT NULL,
  `created_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `created_date` datetime NULL DEFAULT NULL,
  `last_modified_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `last_modified_date` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `pattern_id`(`pattern_id`) USING BTREE,
  INDEX `exercise_id`(`exercise_id`) USING BTREE,
  CONSTRAINT `self_exercise_pattern_ibfk_1` FOREIGN KEY (`pattern_id`) REFERENCES `pattern` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `sss` FOREIGN KEY (`exercise_id`) REFERENCES `self_exercise` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 50 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of self_exercise_pattern
-- ----------------------------
INSERT INTO `self_exercise_pattern` VALUES (40, 70, 30, 9, '13', '2022-12-08 08:01:04', '13', '2022-12-08 08:01:04');
INSERT INTO `self_exercise_pattern` VALUES (41, 137, 31, 3, '13', '2022-12-22 00:33:15', '13', '2022-12-22 00:33:15');
INSERT INTO `self_exercise_pattern` VALUES (42, 134, 31, 5, '13', '2022-12-22 00:33:15', '13', '2022-12-22 00:33:15');
INSERT INTO `self_exercise_pattern` VALUES (43, 119, 31, 2, '13', '2022-12-22 00:33:15', '13', '2022-12-22 00:33:15');
INSERT INTO `self_exercise_pattern` VALUES (44, 137, 32, 2, '13', '2022-12-22 00:34:06', '13', '2022-12-22 00:34:06');
INSERT INTO `self_exercise_pattern` VALUES (45, 134, 32, 3, '13', '2022-12-22 00:34:06', '13', '2022-12-22 00:34:06');
INSERT INTO `self_exercise_pattern` VALUES (46, 135, 33, 6, '13', '2022-12-22 00:35:01', '13', '2022-12-22 00:35:01');
INSERT INTO `self_exercise_pattern` VALUES (47, 134, 34, 2, '13', '2022-12-22 00:55:31', '13', '2022-12-22 00:55:31');
INSERT INTO `self_exercise_pattern` VALUES (48, 141, 35, 3, '13', '2023-02-03 04:15:36', '13', '2023-02-03 04:15:36');
INSERT INTO `self_exercise_pattern` VALUES (49, 140, 35, 3, '13', '2023-02-03 04:15:36', '13', '2023-02-03 04:15:36');

-- ----------------------------
-- Table structure for student_exercise_answer
-- ----------------------------
DROP TABLE IF EXISTS `student_exercise_answer`;
CREATE TABLE `student_exercise_answer`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `generate_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `answer` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `wrong_answer` int NULL DEFAULT NULL,
  `right_answer` int NULL DEFAULT NULL,
  `student_id` bigint NULL DEFAULT NULL,
  `created_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `created_date` datetime NULL DEFAULT NULL,
  `last_modified_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `last_modified_date` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk_stddd`(`student_id`) USING BTREE,
  CONSTRAINT `fk_stddd` FOREIGN KEY (`student_id`) REFERENCES `users` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 62 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of student_exercise_answer
-- ----------------------------
INSERT INTO `student_exercise_answer` VALUES (55, 'cdc6ff86-9584-4934-b86c-bec13df95b43', '9,4,18,19,11', 4, 1, 47, '47', '2022-12-09 10:17:07', '47', '2022-12-09 10:17:07');
INSERT INTO `student_exercise_answer` VALUES (56, '0b6d1b96-e83a-4b45-94a4-0417c6c87f58', 'deal,bean,sour,fax', 2, 2, 47, '47', '2022-12-10 09:13:55', '47', '2022-12-10 09:13:55');
INSERT INTO `student_exercise_answer` VALUES (57, 'd5836d08-fdc2-456b-8f01-ada923e9823a', '8,advocate,23,relaxation,hdjsv', 1, 4, 47, '47', '2022-12-14 14:12:03', '47', '2022-12-14 14:12:03');
INSERT INTO `student_exercise_answer` VALUES (58, 'd6d0170e-7604-42ee-a665-cfb715be78bd', '0123456789,0123456789,14,4,15,6', 3, 3, 47, '47', '2022-12-18 09:55:19', '47', '2022-12-18 09:55:19');
INSERT INTO `student_exercise_answer` VALUES (59, 'd69732c4-5482-4a41-b856-c2e4b8eabc3f', 'item,want,fun,fun,Buff', 2, 3, 47, '47', '2023-01-07 08:23:34', '47', '2023-01-07 08:23:34');
INSERT INTO `student_exercise_answer` VALUES (60, '124534f3-1c91-46c2-9118-e2c791af6bed', '27,19,2', 3, 0, 67, '67', '2023-02-03 04:30:18', '67', '2023-02-03 04:30:18');
INSERT INTO `student_exercise_answer` VALUES (61, '99d2db2d-ef2b-4456-9a07-ac82a7370703', '33,17,19', 3, 0, 67, '67', '2023-02-03 04:31:04', '67', '2023-02-03 04:31:04');

-- ----------------------------
-- Table structure for student_quiz
-- ----------------------------
DROP TABLE IF EXISTS `student_quiz`;
CREATE TABLE `student_quiz`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `student_id` bigint NULL DEFAULT NULL,
  `quiz_id` int NULL DEFAULT NULL,
  `answer` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `created_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `created_date` datetime NULL DEFAULT NULL,
  `last_modified_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `last_modified_date` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `tesyt`(`quiz_id`) USING BTREE,
  INDEX `testue`(`student_id`) USING BTREE,
  CONSTRAINT `testue` FOREIGN KEY (`student_id`) REFERENCES `users` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `tesyt` FOREIGN KEY (`quiz_id`) REFERENCES `quiz` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 104 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of student_quiz
-- ----------------------------
INSERT INTO `student_quiz` VALUES (94, 46, 20, '#include<stdio.h>\n    int main(){\n        printf(\"Hikari Learning\");\n    }\n', '46', '2022-12-23 08:21:55', '46', '2022-12-23 08:21:55');
INSERT INTO `student_quiz` VALUES (95, 47, 20, '#include<stdio.h>\n    int main(){\n        printf(\"Hikari Learning\");\n    }\n', '47', '2022-12-23 08:22:46', '47', '2022-12-23 08:22:46');
INSERT INTO `student_quiz` VALUES (96, 12, 9, '#include<stdio.h>\n    int main(){\n        printf(\"Hikari Learning\");\n    }\n', '12', '2023-01-01 03:55:47', '12', '2023-01-01 03:55:47');
INSERT INTO `student_quiz` VALUES (97, 47, 13, '#include<stdio.h>\n    int main(){\n        printf(\"Hikari Learning\");\n    }\n', '47', '2023-01-04 07:05:37', '47', '2023-01-04 07:05:37');
INSERT INTO `student_quiz` VALUES (98, 47, 14, '#include<stdio.h>\n    int main(){\n        printf(\"Hikari Learning\");\n    }\n', '47', '2023-01-14 04:47:21', '47', '2023-01-14 04:47:21');
INSERT INTO `student_quiz` VALUES (99, 47, 15, '#include<stdio.h>\n    int main(){\n        printf(\"Hikari Learning\");\n    }\n', '47', '2023-01-28 12:55:35', '47', '2023-01-28 12:55:35');
INSERT INTO `student_quiz` VALUES (100, 46, 24, '#include<stdio.h>\n    int main(){\n        printf(\"Hikari Learning\");\n    }\n', '46', '2023-01-29 06:06:38', '46', '2023-01-29 06:06:38');
INSERT INTO `student_quiz` VALUES (101, 47, 16, '#include<stdio.h>\n    int main(){\n        printf(\"Hikari Learning\");\n    }\n', '47', '2023-02-01 03:54:27', '47', '2023-02-01 03:54:27');
INSERT INTO `student_quiz` VALUES (102, 66, 9, '#include<stdio.h>\n    int main(){\n        printf(\"Hikari Learning\");\n    }\n', '66', '2023-02-03 04:15:54', '66', '2023-02-03 04:15:54');
INSERT INTO `student_quiz` VALUES (103, 67, 31, '#include<stdio.h>\n    int main(){\n        printf(\"Hikari Learning\");\n    }\n', '67', '2023-02-03 04:23:56', '67', '2023-02-03 04:23:56');

-- ----------------------------
-- Table structure for student_self_exercise_answer
-- ----------------------------
DROP TABLE IF EXISTS `student_self_exercise_answer`;
CREATE TABLE `student_self_exercise_answer`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `generate_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `answer` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `student_id` bigint NULL DEFAULT NULL,
  `wrong_answer` int NULL DEFAULT NULL,
  `right_answer` int NULL DEFAULT NULL,
  `created_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `created_date` datetime NULL DEFAULT NULL,
  `last_modified_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `last_modified_date` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk_stid`(`student_id`) USING BTREE,
  CONSTRAINT `fk_stid` FOREIGN KEY (`student_id`) REFERENCES `users` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 60 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of student_self_exercise_answer
-- ----------------------------
INSERT INTO `student_self_exercise_answer` VALUES (54, '434525f0-781e-463e-b320-e2cb3e7f71b5', '6,12,2,14,13,9,17,16,7', 47, 6, 3, '47', '2022-12-10 08:11:48', '47', '2022-12-10 08:11:48');
INSERT INTO `student_self_exercise_answer` VALUES (55, '40bd83c0-8751-4ab6-8401-d7f55ce25001', '1,2', 12, 2, 0, '12', '2023-01-01 03:55:33', '12', '2023-01-01 03:55:33');
INSERT INTO `student_self_exercise_answer` VALUES (56, '8c5feba4-9263-4359-8937-8fbc99e94c23', '8,8,8,8,8,8,8,8,8,8', 12, 0, 10, '12', '2023-01-01 05:04:51', '12', '2023-01-01 05:04:51');
INSERT INTO `student_self_exercise_answer` VALUES (57, '40bd83c0-8751-4ab6-8401-d7f55ce25001', '10,18', 47, 2, 0, '47', '2023-01-15 01:44:46', '47', '2023-01-15 01:44:46');
INSERT INTO `student_self_exercise_answer` VALUES (58, '40bd83c0-8751-4ab6-8401-d7f55ce25001', '10,15', 42, 2, 0, '42', '2023-02-01 03:51:09', '42', '2023-02-01 03:51:09');
INSERT INTO `student_self_exercise_answer` VALUES (59, 'b0e00e0c-9991-405d-8a15-264593d1a140', '3,27,9,2,14,26', 67, 6, 0, '67', '2023-02-03 04:20:00', '67', '2023-02-03 04:20:00');

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `email_verified` bit(1) NOT NULL,
  `image_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `provider` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `provider_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `role` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `instructur` bigint NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `UK6dotkott2kjsp8vw4d0m25fb7`(`email`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 68 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES (1, 'instruktur@gmail.com', b'1', NULL, 'ikhsan', '$2a$10$yHh2nRqXr/mVp1tnlhiF/ejTgfAPZt8Rkrlb1l3RBhYXfq0vIyIrK', 'local', NULL, 'ROLE_INSTRUKTUR', NULL);
INSERT INTO `users` VALUES (10, 'student@gmail.com', b'0', NULL, 'studentx', '$2a$10$XNZMhEx/H.hyxzGSDbn7d.PaJyoGG9/IpHP9xcdi3B4GzToPoBI02', 'local', NULL, 'ROLE_USER', 38);
INSERT INTO `users` VALUES (11, 'hikari@gmail.com', b'1', NULL, 'hikari', '$2a$10$OPBUplEPKMeWlGJpVzChQ.NXwCXpgv4Ge89FEm1vBzQF0M57ukxXK', 'local', NULL, 'ROLE_USER', 14);
INSERT INTO `users` VALUES (12, 'student2@gmail.com', b'1', NULL, 'student2', '$2a$10$VDGPOnk3nmD4LpOn55qxAezg7QyoQehOB3ETLmIuJdONakfb5ZHoa', 'local', NULL, 'ROLE_USER', 1);
INSERT INTO `users` VALUES (13, 'admin@gmail.com', b'1', NULL, 'admin', '$2a$10$VDGPOnk3nmD4LpOn55qxAezg7QyoQehOB3ETLmIuJdONakfb5ZHoa', 'local', NULL, 'ROLE_ADMIN', NULL);
INSERT INTO `users` VALUES (14, 'instruktur2@gmail.com', b'1', NULL, 'elisa', '$2a$10$VDGPOnk3nmD4LpOn55qxAezg7QyoQehOB3ETLmIuJdONakfb5ZHoa', 'local', NULL, 'ROLE_INSTRUKTUR', NULL);
INSERT INTO `users` VALUES (33, 'test@gmail.com', b'1', NULL, 'test', '$2a$10$zsxHR6EUG8XwFW5K9ySEGOf6Xfc9hwhQBPBZeMaeRZECZgCxoT7li', 'local', NULL, 'ROLE_USER', 14);
INSERT INTO `users` VALUES (34, 'dasiah@gmail.com', b'1', NULL, 'Dasiah', '$2a$10$YWyXD4foJmXbhu02GSo6F.OAIPeaqIoFOEJIe62fr3RYZw9tu.lhi', 'local', NULL, 'ROLE_INSTRUKTUR', NULL);
INSERT INTO `users` VALUES (35, 'dyahnuraeni@gmail.com', b'1', NULL, 'Dyah Nuraeni', '$2a$10$lmeHLplFUfu9B.kUIhd2Gexg19VhKBxPhNCPXHhkfC7U1c/FJWZ2y', 'local', NULL, 'ROLE_INSTRUKTUR', NULL);
INSERT INTO `users` VALUES (36, 'fridanurhidayati@gmail.com', b'1', NULL, 'Frida Nur Hidayati', '$2a$10$nykvQtx0xRYVirZnzXfxJ.9EgJGtgvtYz56sAvxGuI.RjqOiAUCpO', 'local', NULL, 'ROLE_INSTRUKTUR', NULL);
INSERT INTO `users` VALUES (37, 'restisiskadevi@gmail.com', b'1', NULL, 'Resti Siska Devi', '$2a$10$uqmhyuwSkNEuQjtpoDX/6ekCOUMUvwh9jw/em9LXfqJJbC1aTzKR6', 'local', NULL, 'ROLE_INSTRUKTUR', NULL);
INSERT INTO `users` VALUES (38, 'sandisaputra@gmail.com', b'1', NULL, 'Sandi Saputra', '$2a$10$Sx7i1ioOmyCdIOreh5p.v.2wrFrcx9wtIqEWzy66JKlBL/zed7A0a', 'local', NULL, 'ROLE_INSTRUKTUR', NULL);
INSERT INTO `users` VALUES (39, 'tegarbudiseptian@gmail.com', b'1', NULL, 'Tegar Budi Septian', '$2a$10$vRHaud3LLB/RG1B6/AeU3ugxv2tu0ZNF1bKb.f43KaEtZcH8E8IJO', 'local', NULL, 'ROLE_INSTRUKTUR', NULL);
INSERT INTO `users` VALUES (40, 'ulilhidayah@gmail.com', b'1', NULL, 'Ulil Hidayah', '$2a$10$o6jegf9Nn3h/SkaeDyLShuHNjEyBnyfj39Kc5/H5cci5zLa8abPay', 'local', NULL, 'ROLE_INSTRUKTUR', NULL);
INSERT INTO `users` VALUES (41, 'adesukma@gmail.com', b'1', NULL, 'Ade Sukma', '$2a$10$tnr7gkCKg2ZVgznbuQo0uufWh1RzUz2IY71/9NwvHDjdmfLxaejbu', 'local', NULL, 'ROLE_USER', 38);
INSERT INTO `users` VALUES (42, 'adi@gmail.com', b'1', NULL, 'Adi Maulana Amin', '$2a$10$g5A5DgrsOLCD4843BVvYruTQOvLGblIAC6fwh9FO9/d6pRUJ8MTnm', 'local', NULL, 'ROLE_USER', 38);
INSERT INTO `users` VALUES (43, 'andi@gmail.com', b'1', NULL, 'Andi Iskandar Abdullah', '$2a$10$n5WBOEtjqp9sWnfWT7itguxLiffY.cTamQCjeie/z6Ih2u5IgoJFi', 'local', NULL, 'ROLE_USER', 38);
INSERT INTO `users` VALUES (44, 'anisa@gmail.com', b'1', NULL, 'Anisa Luthfi Febrianti', '$2a$10$0pM5Tx7x5UDVShaPNbDWeOob8mYr24vhq/LMb10VtsFjuF0iKOo1q', 'local', NULL, 'ROLE_USER', 39);
INSERT INTO `users` VALUES (45, 'cahyadi@gmail.com', b'1', NULL, 'Cahyadi Maulana', '$2a$10$BSGb3Q2gcMGEH9nfgO7ju.CcPAgFa5ytE/XGIa4vxW75SAEMqw8va', 'local', NULL, 'ROLE_USER', 39);
INSERT INTO `users` VALUES (46, 'dede@gmail.com', b'1', NULL, 'Dede Hilman', '$2a$10$RGE1DflV/FXQ/S9Pk9gCj.QUNnNP4ouw816ykr1ofek4F9tfD3Phy', 'local', NULL, 'ROLE_USER', 39);
INSERT INTO `users` VALUES (47, 'erik@gmail.com', b'1', NULL, 'Erik Sutiawan', '$2a$10$o5WJe332j00YKVUBuceyreYMNNmdAbPuHD6LrzsGDkJ6AsqXB4Luq', 'local', NULL, 'ROLE_USER', 39);
INSERT INTO `users` VALUES (49, 'hikari29@gmail.com', b'1', NULL, 'hikari', '$2a$10$wK1ZsWexR94y30XW8A1wiODirBNma5ndpldIdb57Wf9GJIe89/AzO', 'local', NULL, 'ROLE_USER', 39);
INSERT INTO `users` VALUES (55, 'student3@gmail.com', b'1', NULL, 'student3', '$2a$10$OIncCkjSFLTCQQp525eVUOKoyumhkHgY3kJZbUFPzfe4lOclVGo/S', 'local', NULL, 'ROLE_USER', 39);
INSERT INTO `users` VALUES (56, 'studentbaru@gmail.com', b'1', NULL, 'studentbaru', '$2a$10$.VdztkKUW1DznCItKRXz3.J7WkYsptc0pcVZESJfZ/gmHk4S6bi4y', 'local', NULL, 'ROLE_USER', 34);
INSERT INTO `users` VALUES (58, 'super@gmail.com', b'1', NULL, 'super', '$2a$10$6OwVdl3D53x3dSpTvGo7F.16XZZcc7U8Jd.AljAtgBKiMQeIn2haW', 'local', NULL, 'ROLE_INSTRUKTUR', NULL);
INSERT INTO `users` VALUES (60, 'instructur_new@gmail.com', b'1', NULL, 'instructur_new', '$2a$10$6OwVdl3D53x3dSpTvGo7F.16XZZcc7U8Jd.AljAtgBKiMQeIn2haW', 'local', NULL, 'ROLE_INSTRUKTUR', NULL);
INSERT INTO `users` VALUES (61, 'instructur3@gmail.com', b'1', NULL, 'instructur3', '$2a$10$6OwVdl3D53x3dSpTvGo7F.16XZZcc7U8Jd.AljAtgBKiMQeIn2haW', 'local', NULL, 'ROLE_INSTRUKTUR', NULL);
INSERT INTO `users` VALUES (62, 'instructur4@gmail.com', b'1', NULL, 'instructur4', '$2a$10$.vS36E0ARGAX/02K3oFFvuqghVm9ovNBoy5rF2g/rDr5Hxjj/Zjla', 'local', NULL, 'ROLE_INSTRUKTUR', NULL);
INSERT INTO `users` VALUES (64, 'student4@gmail.com', b'1', NULL, 'student4', '$2a$10$RpLKg25IxIjKQF.CbSzhZuA6p2bavTk6ELNA/p6iu5LLFlbJ8o7ea', 'local', NULL, 'ROLE_USER', 62);
INSERT INTO `users` VALUES (66, 'ikhsan@gmail.com', b'1', NULL, 'ikhsan29', '$2a$10$cArbsSPBaSF.GyFn1sHD2uJH4h9w..uuRH2Z9qNCWxBEBSzzqU.xi', 'local', NULL, 'ROLE_USER', 1);
INSERT INTO `users` VALUES (67, 'elisa@gmail.com', b'1', NULL, 'elisa', '$2a$10$/yxMJUnpz3pPF7c2lWBXFuUn4LI2BDfeiIo60SMhev54jnjlSuTZC', 'local', NULL, 'ROLE_USER', 1);

SET FOREIGN_KEY_CHECKS = 1;
