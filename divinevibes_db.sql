-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 25, 2025 at 09:43 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `divinevibes_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `role` varchar(50) DEFAULT 'admin',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `name`, `email`, `password`, `role`, `created_at`) VALUES
(1, 'admin', 'admin@gmail.com', '123', 'admin', '2025-11-18 18:33:07'),
(1, 'admin', 'admin@gmail.com', '123', 'admin', '2025-11-18 18:33:12');

-- --------------------------------------------------------

--
-- Table structure for table `bhajans`
--

CREATE TABLE `bhajans` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `youtube_url` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `bhajans`
--

INSERT INTO `bhajans` (`id`, `title`, `youtube_url`, `description`, `created_at`) VALUES
(2, 'Krishna Bhajan', 'https://www.youtube.com/watch?v=yyyyy', 'Devotional Krishna Bhajan', '2025-11-10 16:37:04'),
(3, 'Hanuman Chalisa', 'https://www.youtube.com/watch?v=zzzzz', 'Recite Hanuman Chalisa daily', '2025-11-10 16:37:04');

-- --------------------------------------------------------

--
-- Table structure for table `chatbot_log`
--

CREATE TABLE `chatbot_log` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `message` text NOT NULL,
  `response` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `chatbot_log`
--

INSERT INTO `chatbot_log` (`id`, `user_id`, `message`, `response`, `created_at`) VALUES
(1, 1, 'hi', 'Hello! 🙏 How can I assist you today?', '2025-11-10 17:36:00'),
(2, 1, 'hi\r\n', 'Hello! 🙏 How can I assist you today?', '2025-11-10 20:13:00'),
(3, 1, 'what is youre name ?', 'I am here to guide you spiritually. ✨ Could you please rephrase?', '2025-11-10 20:13:18'),
(4, 1, 'what is youre name ?', 'I am here to guide you spiritually. ✨ Could you please rephrase?', '2025-11-10 20:21:51'),
(5, 1, 'what is youre name ?', 'I am here to guide you spiritually. ✨ Could you please rephrase?', '2025-11-10 20:22:35'),
(6, 1, 'hi\r\n', 'Hello! 🙏 How can I assist you today?', '2025-11-10 20:22:47'),
(7, 1, 'hi\r\n', 'Hello! 🙏 How can I assist you today?', '2025-11-10 20:24:22'),
(8, 1, 'hi\r\n', 'Hello! 🙏 How can I assist you today?', '2025-11-10 20:24:28'),
(9, 1, 'hi', 'Hello! 🙏 How can I assist you today?', '2025-11-10 20:24:41'),
(10, 1, 'hi', 'Hello! 🙏 How can I assist you today?', '2025-11-10 20:25:43'),
(11, 1, 'hi', 'Hello! 🙏 How can I assist you today?', '2025-11-10 20:25:47'),
(12, 1, 'hello', 'Hello! 🙏 How can I assist you today?', '2025-11-10 20:25:54'),
(13, 1, 'what you do', 'I am here to guide you spiritually. ✨ Could you please rephrase?', '2025-11-10 20:26:05'),
(14, 1, 'what you do', 'I am here to guide you spiritually. ✨ Could you please rephrase?', '2025-11-10 20:26:28'),
(15, 1, 'hi', 'Hello! 🙏 How can I assist you today?', '2025-11-10 20:26:38'),
(16, 1, 'hi', 'Hello! 🙏 How can I assist you today?', '2025-11-10 20:29:46'),
(17, 1, 'what you do', 'I am here to guide you spiritually. ✨ Could you please rephrase?', '2025-11-10 20:32:36'),
(18, 1, 'hello', 'Hello! 🙏 How can I assist you today?', '2025-11-10 20:34:06'),
(19, 1, 'who is krishna', 'I am here to guide you spiritually. ✨ Could you please rephrase?', '2025-11-10 20:34:25'),
(20, 1, 'hi', 'Hello! 🙏 How can I assist you today?', '2025-11-10 20:34:37'),
(21, 1, 'hello', 'Hello! 🙏 How can I assist you today?', '2025-11-10 20:38:41'),
(22, 1, 'hi', 'Hello! 🙏 How can I assist you today?', '2025-11-10 20:38:47'),
(23, 1, 'hi', 'Hello! 🙏 How can I assist you today?', '2025-11-10 20:40:05'),
(24, 1, 'hello', 'Hello! 🙏 How can I assist you today?', '2025-11-10 20:40:17'),
(25, 1, 'hi', 'Hello! 🙏 How can I assist you today?', '2025-11-10 20:40:22'),
(26, 1, 'hello', 'Hello! 🙏 How can I assist you today?', '2025-11-10 20:42:30'),
(27, 1, 'hello', 'Hello! 🙏 How can I assist you today?', '2025-11-10 20:42:53'),
(28, 1, 'hello', 'Hello! 🙏 How can I assist you today?', '2025-11-10 20:42:56'),
(29, 1, 'hi\r\n\r\n', 'Hello! 🙏 How can I assist you today?', '2025-11-10 20:43:03'),
(30, 1, 'what us krishna\r\n\r\n', 'I am here to guide you spiritually. ✨ Could you please rephrase?', '2025-11-10 20:43:17'),
(31, 1, 'hi\r\n', 'Hello! 🙏 How can I assist you today?', '2025-11-10 20:43:27'),
(32, 1, 'hi\r\n', 'Hello! 🙏 How can I assist you today?', '2025-11-10 20:46:02'),
(33, 1, 'hi\r\nvdfvfdv', 'Hello! 🙏 How can I assist you today?', '2025-11-10 20:46:11'),
(34, 1, 'hidfdf fd \r\nvdfvfdv', 'Hello! 🙏 How can I assist you today?', '2025-11-10 20:46:15'),
(35, 1, 'hidfdf fd \r\nvdfvfdvdfdfddffff', 'Hello! 🙏 How can I assist you today?', '2025-11-10 20:46:19'),
(36, 1, 'hidfdf fd ff\r\nvdfvfdvdfdfddffff', 'Hello! 🙏 How can I assist you today?', '2025-11-10 20:46:21'),
(37, 1, 'hidfdf fd ff\r\nvdfvfdvdfdfddffff', 'Hello! 🙏 How can I assist you today?', '2025-11-10 20:46:21'),
(38, 1, 'hidfdf fd ff\r\nvdfvfdvdfdfddffff', 'Hello! 🙏 How can I assist you today?', '2025-11-10 20:46:22'),
(39, 1, 'hidfdf fd ff\r\nvdfvfdvdfdfddffff', 'Hello! 🙏 How can I assist you today?', '2025-11-10 20:46:22'),
(40, 1, 'hidfdf fd ff\r\nvdfvfdvdfdfddffff', 'Hello! 🙏 How can I assist you today?', '2025-11-10 20:46:22'),
(41, 1, 'hidfdf fd ff\r\nvdfvfdvdfdfddffff', 'Hello! 🙏 How can I assist you today?', '2025-11-10 20:46:23'),
(42, 1, 'hi', 'Hello! 🙏 How can I assist you today?', '2025-11-10 20:46:28'),
(43, 1, 'hifbgfgnfng', 'Hello! 🙏 How can I assist you today?', '2025-11-10 20:46:37'),
(44, 1, 'f', 'I am here to guide you spiritually. ✨ Could you please rephrase?', '2025-11-10 20:50:49'),
(45, 1, 'hi\r\n', 'Hello! 🙏 How can I assist you today?', '2025-11-11 04:20:47'),
(46, 1, 'what\r\n', 'I am here to guide you spiritually. ✨ Could you please rephrase?', '2025-11-11 04:20:52'),
(47, 1, 'svhbdsvsdvsv\r\n', 'I am here to guide you spiritually. ✨ Could you please rephrase?', '2025-11-11 04:20:58');

-- --------------------------------------------------------

--
-- Table structure for table `enrollments`
--

CREATE TABLE `enrollments` (
  `enrollment_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `roadmap_id` int(11) NOT NULL,
  `enrolled_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `current_day` int(11) DEFAULT 0,
  `streak` int(11) DEFAULT 0,
  `best_streak` int(11) DEFAULT 0,
  `karma_points` int(11) DEFAULT 0,
  `last_activity_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `enrollments`
--

INSERT INTO `enrollments` (`enrollment_id`, `user_id`, `roadmap_id`, `enrolled_at`, `current_day`, `streak`, `best_streak`, `karma_points`, `last_activity_date`) VALUES
(1, 1, 3, '2025-11-15 10:20:04', 5, 1, 1, 50, '2025-11-15'),
(3, 1, 6, '2025-11-15 13:43:57', 2, 1, 1, 20, '2025-11-15'),
(4, 1, 7, '2025-11-18 12:56:06', 1, 1, 1, 10, '2025-11-18');

-- --------------------------------------------------------

--
-- Table structure for table `roadmaps`
--

CREATE TABLE `roadmaps` (
  `roadmap_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `short_desc` varchar(512) DEFAULT NULL,
  `full_desc` text DEFAULT NULL,
  `total_days` int(11) NOT NULL DEFAULT 7,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `roadmaps`
--

INSERT INTO `roadmaps` (`roadmap_id`, `title`, `short_desc`, `full_desc`, `total_days`, `created_at`) VALUES
(3, 'Brahmacharya Roadmap', 'A 7-day discipline and purity practice', 'This roadmap guides the user through 7 days of structured activities that promote spiritual purity and discipline.', 7, '2025-11-15 09:46:04'),
(4, 'Brahmacharya Mastery', '30 days of purity & discipline', 'A complete 30-day self-discipline and purity roadmap with meditation, service, reflection & spiritual alignment.', 30, '2025-11-15 10:45:18'),
(5, 'Mindfulness & Awareness Roadmap', 'A 28-day journey to develop clarity, inner peace, and awareness.', 'This roadmap guides the user through daily practices of mindful breathing, emotional awareness, gratitude, reflective observation, and conscious living. Each day strengthens mental clarity, inner stillness, and self-understanding.', 28, '2025-11-15 10:50:22'),
(6, 'Emotional Intelligence & Healing Roadmap', 'A 30-day journey to understand, regulate, and heal emotions.', 'This roadmap helps users develop emotional awareness, emotional regulation, empathy, resilience, and inner healing. Each day includes practices that strengthen emotional intelligence and promote peaceful living.', 30, '2025-11-15 10:52:07'),
(8, 'hsdgfds', 'hbfhdsbfasf', 'sgfvgdshfv', 2, '2025-11-19 06:29:43');

-- --------------------------------------------------------

--
-- Table structure for table `roadmap_activities_template`
--

CREATE TABLE `roadmap_activities_template` (
  `template_id` int(11) NOT NULL,
  `roadmap_id` int(11) NOT NULL,
  `day_number` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `duration_minutes` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `roadmap_activities_template`
--

INSERT INTO `roadmap_activities_template` (`template_id`, `roadmap_id`, `day_number`, `title`, `description`, `duration_minutes`) VALUES
(22, 3, 1, 'Morning Prayer', 'Recite the prayer and reflect', 10),
(23, 3, 2, 'Study Text', 'Read a short spiritual text', 20),
(24, 3, 3, 'Meditation', 'Meditate quietly for 20 minutes', 20),
(25, 3, 4, 'Service', 'Perform a small act of service', 15),
(26, 3, 5, 'Reflection', 'Write 5 things you are grateful for', 15),
(27, 3, 6, 'Community', 'Discuss spiritual learning with a peer', 20),
(28, 3, 7, 'Fast & Cleanse', 'Light fasting and mental cleansing', 60),
(29, 4, 1, 'Morning Silence', '10 minutes of silent sitting', 10),
(30, 4, 2, 'Sacred Reading', 'Read 1 page of spiritual text', 15),
(31, 4, 3, 'Affirmation Writing', 'Write purity affirmations', 10),
(32, 4, 4, 'Digital Detox', 'Avoid mobile except essentials', 20),
(33, 4, 5, 'Service Act', 'Do one kind action', 15),
(34, 4, 6, 'Meditation', 'Conscious breath meditation', 20),
(35, 4, 7, 'Clean Diet', 'Eat sattvic meals only today', 30),
(36, 4, 8, 'Walking Prayer', '5-minute mindful walk', 5),
(37, 4, 9, 'Self-Reflection', 'Journal your habits', 15),
(38, 4, 10, 'Self-Control Drill', 'Practice resisting urges', 10),
(39, 4, 11, 'Scripture Listening', 'Listen to divine audio', 20),
(40, 4, 12, 'Light Fasting', 'Fruits + water only', 30),
(41, 4, 13, 'Study Session', 'Learn Brahmacharya principles', 25),
(42, 4, 14, 'Mental Cleanse', 'Avoid negative content', 20),
(43, 4, 15, 'Breathing Practice', '3 cycles pranayama', 15),
(44, 4, 16, 'Night Reflection', 'Review purity score', 10),
(45, 4, 17, 'Early Wake Up', 'Wake up before sunrise', 10),
(46, 4, 18, 'Gratitude Writing', 'Write 10 gratitude points', 15),
(47, 4, 19, 'Awareness Drill', 'Observe thoughts', 10),
(48, 4, 20, 'Community Learning', 'Discuss with peer', 25),
(49, 4, 21, 'Service Activity', 'Help someone actively', 20),
(50, 4, 22, 'Minimalism Practice', 'Declutter small area', 15),
(51, 4, 23, 'Cold Water Wash', 'Short cold shower', 5),
(52, 4, 24, 'Light Exercise', 'Yoga or stretching', 20),
(53, 4, 25, 'Forgiveness Practice', 'Release negative memories', 10),
(54, 5, 1, 'Mindful Breathing', 'Focus on natural breath for 10 minutes', 10),
(55, 5, 2, 'Body Scan Awareness', 'Observe sensations from head to toe', 15),
(56, 5, 3, 'Thought Observation', 'Watch thoughts without reacting', 12),
(57, 5, 4, 'Mindful Walking', 'Walk slowly and consciously', 10),
(58, 5, 5, 'Gratitude Journaling', 'Write 5 things you appreciate today', 15),
(59, 5, 6, 'Slow Eating Practice', 'Eat one meal consciously without distractions', 20),
(60, 5, 7, 'Emotion Naming', 'Identify & label emotions as they arise', 10),
(61, 5, 8, 'Conscious Listening', 'Listen deeply to sounds around you', 12),
(62, 5, 9, 'Awareness of Surroundings', 'Spend 5 minutes observing your environment', 5),
(63, 5, 10, 'Posture Awareness', 'Notice body alignment throughout the day', 8),
(64, 5, 11, 'Mindful Speaking', 'Speak slowly & consciously all day', 15),
(65, 5, 12, 'Breathing with Counting', 'Inhale 4 sec, exhale 4 sec for 12 rounds', 10),
(66, 5, 13, 'Journaling Emotions', 'Write what emotions dominated your day', 15),
(67, 5, 14, 'Nature Observation', 'Spend time observing plants/sky consciously', 20),
(68, 5, 15, 'Trigger Awareness', 'Notice moments that cause stress', 10),
(69, 5, 16, 'Digital Mindfulness', 'Limit usage and stay aware while using phone', 15),
(70, 5, 17, 'One-Minute Pauses', 'Pause for 1 minute awareness every 2 hours', 12),
(71, 5, 18, 'Mindful Reading', 'Read slowly and absorb meaning deeply', 15),
(72, 5, 19, 'Awareness of Thoughts', 'Track recurring thoughts today', 15),
(73, 5, 20, 'Presence with Tasks', 'Do routine tasks (brushing, bathing) mindfully', 20),
(74, 5, 21, 'Loving Kindness Meditation', 'Send positive intentions to yourself & others', 15),
(75, 5, 22, 'Shadow Awareness', 'Reflect on fears/weaknesses gently', 15),
(76, 5, 23, 'Mindful Silence', 'Spend 20 minutes in total silence', 20),
(77, 5, 24, 'Listening to Body Needs', 'Observe hunger, thirst, and fatigue cues', 10),
(78, 5, 25, 'Awareness of Breath Tempo', 'Notice how emotions change your breathing', 12),
(79, 5, 26, 'Night Reflection', 'Reflect on awareness throughout the day', 10),
(80, 5, 27, 'Self-Acceptance Practice', 'Accept thoughts & emotions without judgment', 15),
(81, 5, 28, 'Mindfulness Review', 'Evaluate growth & note improvements', 20),
(82, 6, 1, 'Emotional Journal', 'Write your dominant emotions today', 15),
(83, 6, 2, 'Breath–Emotion Regulation', 'Use deep breathing to calm strong emotions', 10),
(84, 6, 3, 'Naming Emotions Practice', 'Identify & name each emotion you feel', 12),
(85, 6, 4, 'Letting Go Meditation', 'Meditate on releasing emotional burdens', 20),
(86, 6, 5, 'Inner Child Reflection', 'Reflect on an old memory and send compassion', 15),
(87, 6, 6, 'Trigger Identification', 'Write down moments that triggered you today', 15),
(88, 6, 7, 'Empathy Practice', 'Try to understand someone else’s feelings', 10),
(89, 6, 8, 'Forgiveness Exercise', 'Write a note forgiving yourself or someone', 20),
(90, 6, 9, 'Slow Response Practice', 'Pause 5 seconds before reacting to anything', 5),
(91, 6, 10, 'Gratitude for Emotions', 'Write 5 things your emotions teach you', 15),
(92, 6, 11, 'Positive Self-Talk', 'Replace negative thoughts with positive ones', 12),
(93, 6, 12, 'Understanding Fear', 'Write about something that scares you & why', 15),
(94, 6, 13, 'Anger Diffusion Technique', 'Use grounding to neutralize anger', 10),
(95, 6, 14, 'Emotional Boundaries', 'Identify where you need stronger boundaries', 15),
(96, 6, 15, 'Healing Music Session', 'Listen to calming music consciously', 20),
(97, 6, 16, 'Mirror Compassion Practice', 'Look in the mirror and speak kindly to yourself', 10),
(98, 6, 17, 'Emotional Patterns Mapping', 'Identify repeating emotional cycles', 20),
(99, 6, 18, 'Self-Acceptance Writing', 'Write a page about accepting who you are', 15),
(100, 6, 19, 'Tension Release Exercise', 'Relax body muscles consciously', 12),
(101, 6, 20, 'Understanding Sadness', 'Reflect on sadness without judgment', 15),
(102, 6, 21, 'Empathetic Listening', 'Listen to someone without interrupting', 15),
(103, 6, 22, 'Affirmation Reading', 'Read 10 positive affirmations aloud', 10),
(104, 6, 23, 'Emotional Detox', 'Avoid negativity for the whole day', 20),
(105, 6, 24, 'Deep Reflection Walk', 'Walk quietly and feel emotions arise', 20),
(106, 6, 25, 'Healing Letter (Not Sent)', 'Write a letter expressing all bottled-up emotions', 20),
(107, 6, 26, 'Mind–Emotion Connection', 'Observe how thoughts shape emotions', 12),
(108, 6, 27, 'Compassion for Others', 'Do one small act of kindness today', 15),
(109, 6, 28, 'Letting Go Ritual', 'Symbolically release one emotional burden', 10),
(110, 6, 29, 'Emotional Strength List', 'Write 10 emotional strengths you possess', 15),
(111, 6, 30, 'Final Reflection', 'Summarize your emotional healing progress', 20);

-- --------------------------------------------------------

--
-- Table structure for table `stories`
--

CREATE TABLE `stories` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `author` varchar(100) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `stories`
--

INSERT INTO `stories` (`id`, `title`, `content`, `author`, `created_at`, `user_id`) VALUES
(1, 'The Power of Faith', 'Faith can move mountains and transform lives...', 'Mansi', '2025-11-10 17:17:12', NULL),
(2, 'Morning Meditation', 'Starting the day with meditation brings peace...', 'DivineVibes Team', '2025-11-10 17:17:12', NULL),
(3, 'Healing Through Music', 'Bhajans and spiritual music have healing powers...', 'Anjali', '2025-11-10 17:17:12', NULL),
(12, 'rthtrhtrh', 'rnrntrntr', 'harshad', '2025-11-18 17:28:15', 1),
(13, 'tjtyj', 'trhrhrttn', 'harshad', '2025-11-18 17:30:27', 1),
(14, 'bnbn', 'vbhvgbv ghvbjhgbuj', 'v h bvghvh', '2025-11-18 18:25:45', 1);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(150) NOT NULL,
  `password` varchar(255) NOT NULL,
  `karma_points` int(11) DEFAULT 0,
  `role` enum('user','admin') DEFAULT 'user',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `karma_points`, `role`, `created_at`) VALUES
(1, 'mansi', 'a@gmail.com', 'test123', 0, 'user', '2025-11-09 17:46:58'),
(2, 'mansi', 'abc@gmail.com', 'Mansi@123', 0, 'user', '2025-11-10 02:30:21'),
(4, 'Mansi', 'Mans@g', 'Mansi@123', 0, 'user', '2025-11-10 14:06:49'),
(5, 'Mansi Kadvani', 'abc12@gmail.com', 'Mansi@123', 0, 'user', '2025-11-10 14:24:09'),
(6, 'Mansi', 'abcd@gmail.com', 'Mansi@123', 0, 'user', '2025-11-10 14:26:52'),
(7, 'Mansi', 'ab@gmail.com', 'MansiKadvani', 0, 'user', '2025-11-10 14:54:52'),
(8, 'abc', 'a123@gmail.com', '1234567890', 0, 'user', '2025-11-10 19:10:54'),
(10, 'Mansi', 'test@gmail.com', 'Mansi@12345', 0, 'user', '2025-11-18 18:21:34');

-- --------------------------------------------------------

--
-- Table structure for table `user_activities`
--

CREATE TABLE `user_activities` (
  `user_activity_id` int(11) NOT NULL,
  `enrollment_id` int(11) NOT NULL,
  `roadmap_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `day_number` int(11) NOT NULL,
  `scheduled_date` date NOT NULL,
  `status` enum('pending','upcoming','completed','missed','submitted') DEFAULT 'pending',
  `submitted_at` timestamp NULL DEFAULT NULL,
  `marks` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user_activities`
--

INSERT INTO `user_activities` (`user_activity_id`, `enrollment_id`, `roadmap_id`, `user_id`, `day_number`, `scheduled_date`, `status`, `submitted_at`, `marks`, `created_at`) VALUES
(1, 1, 3, 1, 1, '2025-11-15', 'completed', '2025-11-15 13:58:09', NULL, '2025-11-15 10:20:04'),
(3, 3, 6, 1, 1, '2025-11-15', 'completed', '2025-11-15 13:58:39', NULL, '2025-11-15 13:43:57'),
(4, 4, 7, 1, 1, '2025-11-18', 'completed', '2025-11-18 12:56:47', NULL, '2025-11-18 12:56:06'),
(5, 1, 3, 1, 6, '2025-11-20', 'pending', NULL, NULL, '2025-11-18 18:35:00'),
(6, 3, 6, 1, 3, '2025-11-20', 'pending', NULL, NULL, '2025-11-18 18:35:00'),
(7, 4, 7, 1, 2, '2025-11-20', 'pending', NULL, NULL, '2025-11-18 18:35:00');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bhajans`
--
ALTER TABLE `bhajans`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `chatbot_log`
--
ALTER TABLE `chatbot_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `enrollments`
--
ALTER TABLE `enrollments`
  ADD PRIMARY KEY (`enrollment_id`),
  ADD UNIQUE KEY `user_id` (`user_id`,`roadmap_id`),
  ADD KEY `user_id_2` (`user_id`),
  ADD KEY `roadmap_id` (`roadmap_id`);

--
-- Indexes for table `roadmaps`
--
ALTER TABLE `roadmaps`
  ADD PRIMARY KEY (`roadmap_id`);

--
-- Indexes for table `roadmap_activities_template`
--
ALTER TABLE `roadmap_activities_template`
  ADD PRIMARY KEY (`template_id`),
  ADD UNIQUE KEY `roadmap_id` (`roadmap_id`,`day_number`);

--
-- Indexes for table `stories`
--
ALTER TABLE `stories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `user_activities`
--
ALTER TABLE `user_activities`
  ADD PRIMARY KEY (`user_activity_id`),
  ADD UNIQUE KEY `enrollment_id` (`enrollment_id`,`day_number`,`scheduled_date`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `bhajans`
--
ALTER TABLE `bhajans`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `chatbot_log`
--
ALTER TABLE `chatbot_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;

--
-- AUTO_INCREMENT for table `enrollments`
--
ALTER TABLE `enrollments`
  MODIFY `enrollment_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `roadmaps`
--
ALTER TABLE `roadmaps`
  MODIFY `roadmap_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `roadmap_activities_template`
--
ALTER TABLE `roadmap_activities_template`
  MODIFY `template_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=142;

--
-- AUTO_INCREMENT for table `stories`
--
ALTER TABLE `stories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `user_activities`
--
ALTER TABLE `user_activities`
  MODIFY `user_activity_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `chatbot_log`
--
ALTER TABLE `chatbot_log`
  ADD CONSTRAINT `chatbot_log_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `roadmap_activities_template`
--
ALTER TABLE `roadmap_activities_template`
  ADD CONSTRAINT `roadmap_activities_template_ibfk_1` FOREIGN KEY (`roadmap_id`) REFERENCES `roadmaps` (`roadmap_id`) ON DELETE CASCADE;

--
-- Constraints for table `user_activities`
--
ALTER TABLE `user_activities`
  ADD CONSTRAINT `user_activities_ibfk_1` FOREIGN KEY (`enrollment_id`) REFERENCES `enrollments` (`enrollment_id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
