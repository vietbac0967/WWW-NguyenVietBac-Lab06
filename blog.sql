-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               11.1.2-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win64
-- HeidiSQL Version:             12.3.0.6589
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Dumping database structure for blog
CREATE DATABASE IF NOT EXISTS `blog` /*!40100 DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci */;
USE `blog`;

-- Dumping structure for table blog.post
CREATE TABLE IF NOT EXISTS `post` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `content` text DEFAULT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `meta_title` varchar(100) DEFAULT NULL,
  `published` bit(1) DEFAULT NULL,
  `published_at` datetime(6) DEFAULT NULL,
  `summary` varchar(255) DEFAULT NULL,
  `title` varchar(75) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `author_id` bigint(20) DEFAULT NULL,
  `prarent_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK12njtf8e0jmyb45lqfpt6ad89` (`author_id`),
  KEY `FKet54o8cb3yieglnn0bp44lrjv` (`prarent_id`),
  CONSTRAINT `FK12njtf8e0jmyb45lqfpt6ad89` FOREIGN KEY (`author_id`) REFERENCES `user` (`id`),
  CONSTRAINT `FKet54o8cb3yieglnn0bp44lrjv` FOREIGN KEY (`prarent_id`) REFERENCES `post` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Dumping data for table blog.post: ~11 rows (approximately)
DELETE FROM `post`;
INSERT INTO `post` (`id`, `content`, `created_at`, `meta_title`, `published`, `published_at`, `summary`, `title`, `updated_at`, `author_id`, `prarent_id`) VALUES
	(1, 'In the heart of the grand kingdom, there existed a ruler whose presence commanded both awe and admiration. The king, adorned in regal attire, bore the weight of his crown with a grace that mirrored the strength of his reign. His eyes, reflective of wisdom accrued through years of rule, glistened with a keen understanding of the intricate tapestry of governance. Beneath the ceremonial robes, a stoic demeanor concealed the passion that fueled his commitment to the prosperity of his realm.\r\n\r\nA just and benevolent sovereign, the king\'s legacy was etched not only in the annals of history but also in the hearts of his subjects. His courtiers spoke of his generosity, recounting tales of charity that reached even the humblest corners of the kingdom. Yet, amidst the opulence of the palace, the king remained connected to the struggles of the common folk, earning him the title of "the people\'s monarch."\r\n\r\nBeyond his administrative prowess, the king was a patron of the arts, fostering a cultural renaissance that flourished under his patronage. The kingdom, under his rule, became a beacon of enlightenment where scholars and artists found solace and support. As the sun set on the kingdom, casting a warm glow upon the castle walls, the king stood as a symbol of unity and strength, his legacy destined to endure in the collective memory of a grateful populace.', '2023-05-10 21:26:09.646000', 'Nulla aut aliquam sit voluptatum molestias.', NULL, '2023-05-10 21:26:09.646000', 'Est inventore nihil corrupti.', 'Error molestiae laboriosam explicabo.', NULL, NULL, NULL),
	(2, 'Voluptas officiis aliquam odio. Quo at quis ipsam sit ipsum. Ratione ea voluptate. Maiores molestias saepe adipisci quos laudantium. Reprehenderit doloremque voluptas sapiente accusamus quas.', '2023-05-10 21:26:09.646000', 'Sit impedit ut.', b'1', '2023-01-19 23:39:20.564000', 'Incidunt sint deleniti nihil.', 'Architecto incidunt a dicta placeat ipsam necessitatibus.', '2023-09-29 16:29:24.511000', 1, NULL),
	(3, 'At nihil et et nam amet eos. Excepturi rerum quas quisquam. Aut aliquid doloremque pariatur repudiandae magnam ad. Quia sint ad porro rerum qui odit.', '2022-11-11 05:09:44.695000', 'Id explicabo ex quam aut rerum dolores tempora.', b'1', '2022-11-27 14:27:03.208000', 'Et et earum est est consequatur inventore.', 'Officiis accusamus consequatur provident.', '2023-07-20 09:42:39.185000', 1, NULL),
	(4, 'Velit sint et magni repellat aliquam ipsa. Earum officia tempora eaque. Facere omnis velit doloremque dolorum incidunt dolor non. Reprehenderit iure voluptatem nihil et ipsum eos. Alias distinctio harum.', '2023-06-14 11:29:12.432000', 'Sit accusantium doloremque et amet quo voluptates reiciendis.', b'1', '2023-04-08 21:24:55.389000', 'Omnis et porro.', 'Aut voluptas consectetur et officia itaque libero.', '2023-07-09 08:12:52.637000', 1, NULL),
	(5, 'Omnis totam qui est illum dolor libero voluptatem. Beatae quia eius commodi voluptates voluptatibus ut. Qui placeat expedita aliquam. Est enim nobis eveniet. Eligendi nobis modi cum facilis.', '2023-03-04 11:34:46.092000', 'Saepe quae autem soluta natus consequatur ut.', b'0', '2023-08-06 19:44:29.301000', 'Suscipit et facere.', 'Rem qui sed aliquam.', '2023-05-25 06:21:53.188000', 1, NULL),
	(6, 'Officia et et. Non veniam sint placeat odio ut necessitatibus est. Dolor dignissimos quia soluta. Similique eum recusandae. Voluptates iusto repudiandae.', '2023-06-21 15:11:40.381000', 'Voluptatibus aliquid enim quaerat.', b'1', '2023-03-03 09:50:09.412000', 'Sunt veritatis quod saepe.', 'Fugit vero minus molestias eaque repellendus.', '2023-10-22 13:47:32.528000', 1, NULL),
	(7, 'A quaerat ut et vitae veritatis magnam sit. Ducimus animi quasi quo. Laudantium architecto et quia odit qui assumenda enim. Dolor modi aut molestias fuga nisi corrupti non.', '2022-11-26 02:18:20.350000', 'Et ab voluptatem accusantium et dolores.', b'1', '2023-05-25 04:47:19.417000', 'Consequatur ea tempora rerum quam quisquam dignissimos.', 'Incidunt accusantium totam harum rerum tempora.', '2023-11-06 09:15:23.903000', 1, NULL),
	(8, 'Neque provident nam sequi cupiditate possimus nobis. Qui maxime modi eum commodi laborum incidunt omnis. Eum dignissimos molestiae. Ut placeat rerum sit. Voluptate rerum laudantium officia sed.', '2023-03-16 21:55:06.723000', 'Quae nemo sit aliquam.', b'0', '2023-08-24 13:35:13.843000', 'Voluptatem molestias molestias fuga sed dolorem voluptates.', 'Sit totam ut quod aut.', '2022-11-29 11:46:06.717000', 1, NULL),
	(9, 'Pariatur dignissimos nostrum. Voluptatem quia non. Quis vitae voluptatem aliquid dolorum. Ut occaecati nobis voluptatem ad voluptatum. Est quae adipisci laboriosam iusto.', '2023-06-09 15:56:37.324000', 'Consequuntur vel aut dolor vel est sapiente.', b'1', '2023-03-25 08:12:42.438000', 'Voluptatem molestias tempore.', 'Placeat quae necessitatibus ut ipsam.', '2023-03-09 15:02:05.159000', 1, NULL),
	(10, 'Recusandae vero tenetur facere. Consequuntur dolore officiis eaque. Omnis consequatur maiores.', '2023-03-09 02:14:53.577000', 'Maxime libero ut est inventore qui.', b'1', '2023-05-15 16:44:30.385000', 'Et nesciunt itaque accusantium.', 'Facilis tempore accusantium nostrum ut minima atque possimus.', '2023-06-25 18:02:52.678000', 1, NULL),
	(14, '2512512521521521521', '2023-11-09 15:29:38.081678', '5215215', NULL, NULL, 'klsakfjasf', '214124', NULL, 1, NULL);

-- Dumping structure for table blog.post_comment
CREATE TABLE IF NOT EXISTS `post_comment` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `content` text DEFAULT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `published` bit(1) DEFAULT NULL,
  `published_at` datetime(6) DEFAULT NULL,
  `title` varchar(100) DEFAULT NULL,
  `parent_id` bigint(20) DEFAULT NULL,
  `post_id` bigint(20) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKmqxhu8q0j94rcly3yxlv0u498` (`parent_id`),
  KEY `FKna4y825fdc5hw8aow65ijexm0` (`post_id`),
  KEY `FKtc1fl97yq74q7j8i08ds731s1` (`user_id`),
  CONSTRAINT `FKmqxhu8q0j94rcly3yxlv0u498` FOREIGN KEY (`parent_id`) REFERENCES `post_comment` (`id`),
  CONSTRAINT `FKna4y825fdc5hw8aow65ijexm0` FOREIGN KEY (`post_id`) REFERENCES `post` (`id`),
  CONSTRAINT `FKtc1fl97yq74q7j8i08ds731s1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Dumping data for table blog.post_comment: ~12 rows (approximately)
DELETE FROM `post_comment`;
INSERT INTO `post_comment` (`id`, `content`, `created_at`, `published`, `published_at`, `title`, `parent_id`, `post_id`, `user_id`) VALUES
	(1, 'ffffff', '2023-11-10 07:31:01.034129', NULL, '2023-11-10 07:31:01.034129', 'TranDucHuy', NULL, 1, 2),
	(2, 'hhuhuhuhuhuhuahusfhusahfua', '2023-11-10 07:21:48.322192', NULL, '2023-11-10 07:21:48.322192', 'TranDucHuy', NULL, 2, 2),
	(3, 'Saepe sunt tenetur quod quisquam amet et. Odit rerum id. Rerum tempore nulla. Temporibus architecto minus impedit deserunt dolores qui. Accusamus occaecati velit sit.', '2022-11-28 04:17:21.708000', b'1', NULL, 'Jamison Hill', NULL, 3, 2),
	(4, 'Cumque libero exercitationem molestias iure. Sed ipsum consequatur. Blanditiis ex repellat eveniet dolorem. Quibusdam assumenda autem ea maiores nesciunt.', '2023-06-01 19:05:57.568000', b'1', NULL, 'Leandro Cummerata', NULL, 4, 2),
	(5, 'Consequatur unde id sequi alias maxime sequi. Delectus eum necessitatibus aut qui eum. Nam id quae.', '2023-06-03 03:32:55.074000', b'1', NULL, 'Bonnie Pagac V', NULL, 5, 2),
	(6, 'Dolor blanditiis est consequuntur amet. Est est odio. Dolorum sit nisi sit.', '2023-07-05 11:03:53.824000', b'0', NULL, 'Billy Zieme', NULL, 6, 2),
	(7, 'Accusamus voluptatibus aut hic necessitatibus suscipit. Quibusdam voluptatem unde delectus dolor rerum. Qui id dicta commodi. A cumque maxime quae in fugit hic et.', '2023-06-02 20:23:46.182000', b'0', NULL, 'Iluminada Turcotte', NULL, 7, 2),
	(8, 'Nam doloremque voluptas molestiae sed cum sunt. Ipsum repellendus est eligendi quae non ut numquam. Deleniti molestiae culpa aliquam error animi reprehenderit et. Impedit voluptas perspiciatis quo. Consequuntur pariatur facere aut minima quaerat tempora.', '2023-06-22 22:36:32.562000', b'0', NULL, 'Mr. Robby Abbott', NULL, 8, 2),
	(9, 'Esse vel quis recusandae optio recusandae. Quod cumque aut. Fugiat molestias aut amet est. Doloremque illum accusantium eaque dolores. Dolore quae dolor et quod quos.', '2023-04-17 21:50:58.908000', b'1', NULL, 'Bao Kunze', NULL, 9, 2),
	(10, 'Ut nihil reprehenderit earum et eligendi qui ullam. Soluta voluptas ut et et ipsa odit qui. Tempore inventore ea doloribus nemo odit.', '2022-11-29 05:35:43.323000', b'0', NULL, 'Jamaal Bosco', NULL, 10, 2),
	(11, 'Comment 1 Content', '2023-11-10 14:09:40.000000', b'1', '2023-11-10 14:09:40.000000', 'Comment 1 Title', NULL, 1, 1),
	(12, 'nice blog', '2023-11-10 07:36:47.972397', NULL, '2023-11-10 07:36:47.972397', 'TranDucHuy', NULL, 1, 2),
	(13, 'perfect', '2023-11-10 07:38:33.960636', NULL, '2023-11-10 07:38:33.960636', 'Tran Duc Huy', NULL, 1, 2);

-- Dumping structure for table blog.user
CREATE TABLE IF NOT EXISTS `user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `email` varchar(50) DEFAULT NULL,
  `first_name` varchar(50) DEFAULT NULL,
  `intro` tinytext DEFAULT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `middle_name` varchar(50) DEFAULT NULL,
  `mobile` varchar(15) DEFAULT NULL,
  `password_hash` varchar(255) DEFAULT NULL,
  `profile` text DEFAULT NULL,
  `registered_at` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Dumping data for table blog.user: ~2 rows (approximately)
DELETE FROM `user`;
INSERT INTO `user` (`id`, `email`, `first_name`, `intro`, `last_login`, `last_name`, `middle_name`, `mobile`, `password_hash`, `profile`, `registered_at`) VALUES
	(1, 'vietbacnguyen2002@gmail.com', 'Nguyen', 'Hello world', '2023-11-09 09:31:41.444572', 'Bac', 'Viet ', '08217512512', '$2a$12$yZ.70AD/Il2XgbaKGXhB2.hf2izwULXkumhpd0Jv5boDBUHMWrC0O', 'Blog of Nguyen Viet  Bac', '2023-11-09 09:31:41.444635'),
	(2, 'duchuy@gmail.com', 'Tran', 'Hello world', '2023-11-10 03:46:07.586280', 'Huy', 'Duc', '0885125025', '$2a$12$u0ZTGETvCgSdWpwouevl8.OADAlTOa9yZP3HMZEhvy15VTW8pnb0O', 'Blog of Tran Duc Huy', '2023-11-10 03:46:07.587280');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
