-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 20, 2024 at 10:33 AM
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
-- Database: `uts_framework`
--

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Fruits', '2024-05-19 05:59:18', '2024-05-19 05:59:18'),
(2, 'Vegetables', '2024-05-19 05:59:45', '2024-05-19 05:59:45'),
(3, 'Snacks', '2024-05-19 05:59:54', '2024-05-19 05:59:54'),
(4, 'Drinks', '2024-05-19 06:00:02', '2024-05-19 06:00:02');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(3, '2024_05_16_050126_create_categories_table', 1),
(4, '2024_05_16_050212_create_products_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `price` int(11) NOT NULL,
  `image` varchar(255) NOT NULL,
  `category_id` bigint(20) UNSIGNED NOT NULL,
  `expired_at` date NOT NULL,
  `modified_by` varchar(255) NOT NULL COMMENT 'email user',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `description`, `price`, `image`, `category_id`, `expired_at`, `modified_by`, `created_at`, `updated_at`) VALUES
(1, 'Coca cola', 'Refreshing drinks', 5000, 'uploads/1716124714_Coca cola.jpeg', 4, '2025-05-05', 'user1@gmail.com', '2024-05-19 06:18:34', '2024-05-19 06:18:34'),
(2, 'Cabbage', 'Freshly picked high quality cabbage', 4000, 'uploads/1716124792_Cabbage.jpeg', 2, '2025-05-05', 'user2@gmail.com', '2024-05-19 06:19:52', '2024-05-19 06:19:52'),
(3, 'Apple', 'Freshly picked high quality apple', 8000, 'uploads/1716124841_Apple.jpeg', 1, '2025-05-05', 'user3@gmail.com', '2024-05-19 06:20:41', '2024-05-19 06:20:41'),
(5, 'Doritos', 'Delicious party sized doritos to enjoy with your friend', 12000, 'uploads/1716125383_Doritos.png', 3, '2025-05-05', 'admin@gmail.com', '2024-05-19 06:24:22', '2024-05-19 06:29:43');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` enum('admin','user') NOT NULL DEFAULT 'user',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `role`, `created_at`, `updated_at`) VALUES
(1, 'Administrator', 'admin@gmail.com', '$2y$10$IouD5KUxEN9sqCaCYXxjouiusVLLBMkniCsU5q6lw9fQ9RZ0V7wpm', 'admin', '2024-05-19 05:54:28', '2024-05-19 05:54:28'),
(2, 'user1', 'user1@gmail.com', '$2y$10$8enwRGRXMMwLAgbk.AQPg.M4KrxQjG7pYMhtePvlVgKU7XclIRICC', 'user', '2024-05-19 05:54:54', '2024-05-19 05:54:54'),
(3, 'user2', 'user2@gmail.com', '$2y$10$8czRsRo5iPXdqKHx133Ih.8l2NlisVYYHyTEZad0CCc71p3QNScVO', 'user', '2024-05-19 05:55:01', '2024-05-19 05:55:01'),
(4, 'user3', 'user3@gmail.com', '$2y$10$gOrftNwFCIvKVgFFcrcMB.5JkmuBWsk69BqZRBnpDyhz1G6V0nsIO', 'user', '2024-05-19 05:55:08', '2024-05-19 05:55:08'),
(5, 'user4', 'user4@gmail.com', '$2y$10$P4tPOQ747k.YlGC72E/TM.iSW5zN21wkZiDcOi8k22yMLNaZhQjKe', 'user', '2024-05-19 05:55:13', '2024-05-19 05:55:13'),
(6, 'Gustian Naufal Sadad', 'ptwjgt321@gmail.com', '$2y$10$Iu.FLtV0da9yxph9HUthGOTSG4i5/.KLMNGX0flJ.CpzM79r7tu12', 'user', '2024-05-19 07:03:13', '2024-05-19 07:03:13');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `products_category_id_foreign` (`category_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
