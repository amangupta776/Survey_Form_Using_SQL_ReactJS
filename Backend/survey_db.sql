-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Jun 10, 2024 at 10:13 AM
-- Server version: 8.0.34
-- PHP Version: 8.0.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `survey_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `options`
--

DROP TABLE IF EXISTS `options`;
CREATE TABLE IF NOT EXISTS `options` (
  `id` int NOT NULL AUTO_INCREMENT,
  `question_id` int NOT NULL,
  `option_number` int NOT NULL,
  `text` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `question_id` (`question_id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `options`
--

INSERT INTO `options` (`id`, `question_id`, `option_number`, `text`) VALUES
(1, 1, 1, 'Male'),
(2, 1, 2, 'Female'),
(3, 2, 1, 'Regularly'),
(4, 2, 2, 'Occasionally'),
(5, 3, 1, 'Online shopping'),
(6, 3, 2, 'In-store shopping'),
(7, 4, 1, 'Reading'),
(8, 4, 2, 'Meditation'),
(9, 5, 1, 'Very important'),
(10, 5, 2, 'Not very important'),
(11, 6, 1, 'Through search engines'),
(12, 6, 2, 'Via social media recommendations'),
(13, 7, 1, 'Price'),
(14, 7, 2, 'Product reviews'),
(15, 8, 1, 'The ability to see and try products in person'),
(16, 8, 2, 'Immediate possession of the purchased items'),
(17, 9, 1, 'Frequently'),
(18, 9, 2, 'Rarely'),
(19, 10, 1, 'Social media influencers'),
(20, 10, 2, 'Fashion magazines'),
(21, 11, 1, 'Every season'),
(22, 11, 2, 'Only when needed'),
(23, 12, 1, 'Comfort'),
(24, 12, 2, 'Functionality'),
(25, 13, 1, 'Fewer, more versatile items'),
(26, 13, 2, 'Larger variety of specific styles');

-- --------------------------------------------------------

--
-- Table structure for table `questions`
--

DROP TABLE IF EXISTS `questions`;
CREATE TABLE IF NOT EXISTS `questions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `text` text NOT NULL,
  `depends_on` int DEFAULT NULL,
  `depends_on_option` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `depends_on` (`depends_on`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `questions`
--

INSERT INTO `questions` (`id`, `text`, `depends_on`, `depends_on_option`) VALUES
(1, 'What is your gender?', NULL, NULL),
(2, 'How often do you engage in sports or physical activities?', 1, 1),
(3, 'Which of the following best describes your shopping preference?', 1, 1),
(4, 'What is your preferred method of relaxation?', 1, 2),
(5, 'How important is fashion and personal style to you?', 1, 2),
(6, 'How do you usually find the products you want to buy online?', 3, 1),
(7, 'What is the most important factor for you when shopping online?', 3, 1),
(8, 'What motivates you to shop in-store rather than online?', 3, 2),
(9, 'How often do you seek assistance from store staff when shopping in-store?', 3, 2),
(10, 'Where do you draw inspiration for your personal style?', 5, 1),
(11, 'How often do you update your wardrobe?', 5, 1),
(12, 'What factors influence your clothing choices the most?', 5, 2),
(13, 'Do you prefer to own fewer, more versatile clothing items or a larger variety of specific styles?', 5, 2);

-- --------------------------------------------------------

--
-- Table structure for table `userresponses`
--

DROP TABLE IF EXISTS `userresponses`;
CREATE TABLE IF NOT EXISTS `userresponses` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `question_id` int NOT NULL,
  `option_number` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `question_id` (`question_id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `userresponses`
--

INSERT INTO `userresponses` (`id`, `user_id`, `question_id`, `option_number`) VALUES
(25, 1, 1, 2),
(26, 1, 4, 2),
(27, 1, 5, 2),
(28, 1, 12, 2),
(29, 1, 13, 2),
(30, 1, 1, 1),
(31, 1, 2, 2),
(32, 1, 3, 2),
(33, 1, 8, 2),
(34, 1, 9, 2);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `options`
--
ALTER TABLE `options`
  ADD CONSTRAINT `options_ibfk_1` FOREIGN KEY (`question_id`) REFERENCES `questions` (`id`);

--
-- Constraints for table `questions`
--
ALTER TABLE `questions`
  ADD CONSTRAINT `questions_ibfk_1` FOREIGN KEY (`depends_on`) REFERENCES `questions` (`id`);

--
-- Constraints for table `userresponses`
--
ALTER TABLE `userresponses`
  ADD CONSTRAINT `userresponses_ibfk_1` FOREIGN KEY (`question_id`) REFERENCES `questions` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
