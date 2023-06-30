-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 16 Jun 2023 pada 10.06
-- Versi server: 10.4.27-MariaDB
-- Versi PHP: 8.1.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `pedikia`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(3, '2014_10_12_200000_add_two_factor_columns_to_users_table', 1),
(4, '2019_08_19_000000_create_failed_jobs_table', 1),
(5, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(6, '2023_06_14_043908_create_sessions_table', 1),
(7, '2023_06_14_050123_add_field_to_users_table', 1),
(8, '2023_06_14_050916_create_service_categories_table', 1),
(9, '2023_06_14_060142_create_services_table', 1),
(10, '2023_06_14_060500_create_service_galleries_table', 1),
(11, '2023_06_14_061526_create_transactions_table', 1),
(12, '2023_06_14_061935_create_transaction_items_table', 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES
(1, 'App\\Models\\User', 1, 'authToken', 'd3294ec59cd195988a12b85fb6ee407fe4b5de732c602a9c925bdccdd7fc20d7', '[\"*\"]', NULL, NULL, '2023-06-16 00:59:21', '2023-06-16 00:59:21'),
(2, 'App\\Models\\User', 2, 'authToken', 'c6c0f19b8d4bd46594ded0c40a8efacaa8714e8d8fb1f1ccec436f045775dd05', '[\"*\"]', NULL, NULL, '2023-06-16 00:59:57', '2023-06-16 00:59:57'),
(4, 'App\\Models\\User', 3, 'authToken', '518be75386bdcc687291f7c525c819b1bc93caabedd3c8d77421f54c67898d91', '[\"*\"]', NULL, NULL, '2023-06-16 01:04:00', '2023-06-16 01:04:00'),
(5, 'App\\Models\\User', 4, 'authToken', 'f05bf9dd3f1d320be018a68d9b5ec17bb9cfff4c02cf04da89738efb5619c959', '[\"*\"]', NULL, NULL, '2023-06-16 01:04:17', '2023-06-16 01:04:17'),
(6, 'App\\Models\\User', 4, 'authToken', '07338bd5825c47aca86b4416aeb40a639ddb4ef6443d638f7b03062509794167', '[\"*\"]', '2023-06-16 01:04:54', NULL, '2023-06-16 01:04:33', '2023-06-16 01:04:54');

-- --------------------------------------------------------

--
-- Struktur dari tabel `services`
--

CREATE TABLE `services` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `price` double(8,2) NOT NULL,
  `description` longtext NOT NULL,
  `tags` varchar(255) DEFAULT NULL,
  `categories_id` bigint(20) NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `services`
--

INSERT INTO `services` (`id`, `name`, `price`, `description`, `tags`, `categories_id`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'Baby Massage', 90000.00, 'Manfaat diantaranya: \r\n1. Meningkatkan frekuensi menyusu\r\n2. Meningkatkan berat badan bayi\r\n3. Membantu bayi untuk berlatih relaksasi\r\n4. Membantu bayi untuk tidur dengan lelap dan lama\r\n5. Membuat ikatan/bonding dengan ibu\r\n6. Meningkatkan kemampuan sensorik dan motorik bayi\r\n7. Membantu melancarkan sistem pencernaan\r\n8. Mencegah bayi mengalami tantrum (kehilangan kontrol emosional yang mendadak pada bayi)', NULL, 1, NULL, '2023-06-16 07:42:59', '2023-06-16 07:42:59'),
(2, 'Baby Swim ', 90000.00, 'Manfaat baby swim:\r\n1. Membiasakan bayi dengan air.\r\n2. Mengurangi ketakutan terhadap air di kemudian hari.\r\n3. Meningkatkan perkembangan fisik.\r\n4. Memperkuat otot-otot tubuh.\r\n5. Meningkatkan keterampilan motorik.\r\n6. Meningkatkan koordinasi dan keseimbangan.\r\n7. Membantu perkembangan sistem pernapasan.\r\n8. Merangsang perkembangan sensorik.\r\n9. Meningkatkan interaksi sosial.\r\n10. Memberikan pengalaman yang menyenangkan dan positif bagi bayi.', NULL, 1, NULL, '2023-06-16 07:45:31', '2023-06-16 07:45:31'),
(3, 'Baby Gym', 90000.00, 'Manfaat baby gym:\r\n1. Meningkatkan perkembangan motorik bayi.\r\n2. Membantu menguatkan otot-otot tubuh.\r\n3. Merangsang perkembangan keterampilan sensorik.\r\n4. Meningkatkan koordinasi dan keseimbangan.\r\n5. Mengembangkan kemampuan merangkak, berdiri, dan berjalan.\r\n6. Memperkuat sistem otot tulang belakang.\r\n7. Merangsang pertumbuhan dan perkembangan tulang.\r\n8. Meningkatkan daya tahan fisik.\r\n9. Memperbaiki pola tidur bayi.\r\n10. Menyediakan interaksi sosial dan pengalaman yang menyenangkan bagi bayi.', NULL, 1, NULL, '2023-06-16 07:46:27', '2023-06-16 07:46:27'),
(4, 'Baby Haircut', 90000.00, 'Manfaat potong rambut bayi:\r\n1. Memperbaiki kenyamanan bayi dengan menghilangkan rambut yang panjang dan mengganggu penglihatan atau menyebabkan ketidaknyamanan.\r\n2. Merangsang pertumbuhan rambut yang lebih sehat dan kuat.\r\n3. Memudahkan perawatan rambut bayi, seperti menyisir dan membersihkan rambut.\r\n4. Mencegah rambut bayi menjadi kusut atau terjepit di benda-benda sekitar.\r\n5. Membantu mencegah terjadinya kutu rambut atau masalah kulit kepala lainnya.\r\n6. Memperbarui penampilan bayi dan membuatnya terlihat lebih rapi.\r\n7. Mendorong pertumbuhan rambut yang lebih tebal dan penuh seiring waktu.\r\n8. Memberikan kesempatan bagi bayi untuk terbiasa dengan proses potong rambut dan suasana salon sejak dini.\r\n9. Memberikan momen spesial bagi orang tua dan bayi dalam pengalaman pertama kali potong rambut.\r\n10. Memberikan perasaan segar dan menyenangkan bagi bayi setelah potong rambut.', NULL, 1, NULL, '2023-06-16 07:47:27', '2023-06-16 07:47:27'),
(5, 'Baby Bath', 90000.00, 'Manfaat mandi bayi:\r\n1. Membersihkan kulit bayi dan menjaga kebersihan tubuhnya.\r\n2. Merelaksasi bayi dan membantu mengurangi kecemasan atau ketegangan.\r\n3. Merangsang perkembangan sensorik dengan sentuhan air dan sensasi yang berbeda di kulit.\r\n4. Memperkuat ikatan antara orang tua dan bayi melalui interaksi fisik dan perawatan yang lembut.\r\n5. Membantu mencegah iritasi kulit atau ruam popok dengan membersihkan area popok secara teratur.\r\n6. Membantu menjaga suhu tubuh bayi agar tetap stabil.\r\n7. Membantu meredakan ketidaknyamanan jika bayi mengalami kulit kering atau ruam kulit.\r\n8. Menstimulasi pertumbuhan rambut bayi.\r\n9. Membantu bayi rileks dan siap tidur dengan baik.\r\n10. Memberikan pengalaman menyenangkan dan interaksi positif dengan air bagi bayi.', NULL, 1, NULL, '2023-06-16 07:48:40', '2023-06-16 07:48:40');

-- --------------------------------------------------------

--
-- Struktur dari tabel `service_categories`
--

CREATE TABLE `service_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `service_categories`
--

INSERT INTO `service_categories` (`id`, `name`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'Baby Newborn Treatment', NULL, '2023-06-16 07:37:15', '2023-06-16 07:37:15'),
(2, 'Baby and Kid Treatment', NULL, '2023-06-16 07:38:00', '2023-06-16 07:38:00'),
(3, 'Baby and Kid Therapy', NULL, '2023-06-16 07:39:01', '2023-06-16 07:39:01'),
(4, 'Pre and Post Natal Care', NULL, '2023-06-16 07:39:57', '2023-06-16 07:39:57');

-- --------------------------------------------------------

--
-- Struktur dari tabel `service_galleries`
--

CREATE TABLE `service_galleries` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `services_id` bigint(20) NOT NULL,
  `url` varchar(255) NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `service_galleries`
--

INSERT INTO `service_galleries` (`id`, `services_id`, `url`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 1, 'https://raw.githubusercontent.com/yaminmuhammad/pedikia-backend-app/images/images/massage.jpg', NULL, '2023-06-16 07:52:04', '2023-06-16 07:52:04'),
(2, 2, 'https://raw.githubusercontent.com/yaminmuhammad/pedikia-backend-app/images/images/swim.jpg', NULL, '2023-06-16 07:52:41', '2023-06-16 07:52:41'),
(3, 3, 'https://raw.githubusercontent.com/yaminmuhammad/pedikia-backend-app/images/images/kids.jpg', NULL, '2023-06-16 07:53:28', '2023-06-16 07:53:28'),
(4, 4, 'https://raw.githubusercontent.com/yaminmuhammad/pedikia-backend-app/images/images/gym.png', NULL, '2023-06-16 07:53:58', '2023-06-16 07:53:58'),
(5, 5, 'https://raw.githubusercontent.com/yaminmuhammad/pedikia-backend-app/images/images/haircut.jpg', NULL, '2023-06-16 07:54:28', '2023-06-16 07:54:28');

-- --------------------------------------------------------

--
-- Struktur dari tabel `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` longtext NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `transactions`
--

CREATE TABLE `transactions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `therapist_id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `address` text DEFAULT NULL,
  `total_price` double(8,2) NOT NULL DEFAULT 0.00,
  `extra_price` double(8,2) NOT NULL DEFAULT 0.00,
  `status` varchar(255) NOT NULL DEFAULT 'PENDING',
  `payment` varchar(255) NOT NULL DEFAULT 'MANUAL',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `transactions`
--

INSERT INTO `transactions` (`id`, `therapist_id`, `user_id`, `address`, `total_price`, `extra_price`, `status`, `payment`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 2, 1, 'Kota Cimahi', 2000.00, 100.00, 'PENDING', 'MANUAL', NULL, '2023-06-16 01:00:59', '2023-06-16 01:00:59'),
(2, 3, 4, 'Kota Cimahi', 2000.00, 100.00, 'PENDING', 'MANUAL', NULL, '2023-06-16 01:04:54', '2023-06-16 01:04:54');

-- --------------------------------------------------------

--
-- Struktur dari tabel `transaction_items`
--

CREATE TABLE `transaction_items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `users_id` bigint(20) NOT NULL,
  `services_id` bigint(20) NOT NULL,
  `transactions_id` bigint(20) NOT NULL,
  `quantity` bigint(20) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `transaction_items`
--

INSERT INTO `transaction_items` (`id`, `users_id`, `services_id`, `transactions_id`, `quantity`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 1, 1, '2023-06-16 01:00:59', '2023-06-16 01:00:59'),
(2, 1, 2, 1, 2, '2023-06-16 01:00:59', '2023-06-16 01:00:59'),
(3, 4, 1, 2, 1, '2023-06-16 01:04:54', '2023-06-16 01:04:54'),
(4, 4, 2, 2, 2, '2023-06-16 01:04:54', '2023-06-16 01:04:54');

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `city` varchar(255) NOT NULL,
  `roles` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `two_factor_secret` text DEFAULT NULL,
  `two_factor_recovery_codes` text DEFAULT NULL,
  `two_factor_confirmed_at` timestamp NULL DEFAULT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `current_team_id` bigint(20) UNSIGNED DEFAULT NULL,
  `profile_photo_path` varchar(2048) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`id`, `name`, `phone`, `address`, `city`, `roles`, `email`, `email_verified_at`, `password`, `two_factor_secret`, `two_factor_recovery_codes`, `two_factor_confirmed_at`, `remember_token`, `current_team_id`, `profile_photo_path`, `created_at`, `updated_at`) VALUES
(1, 'dani', '123123123', 'teluk jambe', 'karawang', 'pengguna', 'dani@gmail.com', NULL, '$2y$10$ctM5sRWFuDajxq9Xma2Pg.t5MZ4puz4y1F1CkwC4h9cf86H2/zMvy', NULL, NULL, NULL, NULL, NULL, NULL, '2023-06-16 00:59:21', '2023-06-16 00:59:21'),
(2, 'danang', '123123123', 'teluk jambe', 'karawang', 'therapist', 'danang@gmail.com', NULL, '$2y$10$VuNY24kpxK5f1trvwrvOc.fyW4zvG7Tb7WgPJCL0M8.0/pIkuJG26', NULL, NULL, NULL, NULL, NULL, NULL, '2023-06-16 00:59:57', '2023-06-16 00:59:57'),
(3, 'Rani', '123123123', 'teluk jambe', 'karawang', 'therapist', 'rani@gmail.com', NULL, '$2y$10$tIacowAwq2ZITHjeYXgf2OS73NO4LrWUKTtFHT9AXrGsBRZBokb66', NULL, NULL, NULL, NULL, NULL, NULL, '2023-06-16 01:04:00', '2023-06-16 01:04:00'),
(4, 'Ranu', '123123123', 'teluk jambe', 'karawang', 'pengguna', 'ranu@gmail.com', NULL, '$2y$10$Y4mnWc5mEzskJ0ymidPQWOd3g9ukX2V6ZCz6cMQ.CVoK1jXsdvmiy', NULL, NULL, NULL, NULL, NULL, NULL, '2023-06-16 01:04:17', '2023-06-16 01:04:17');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indeks untuk tabel `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indeks untuk tabel `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indeks untuk tabel `services`
--
ALTER TABLE `services`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `service_categories`
--
ALTER TABLE `service_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `service_galleries`
--
ALTER TABLE `service_galleries`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indeks untuk tabel `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `transaction_items`
--
ALTER TABLE `transaction_items`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT untuk tabel `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT untuk tabel `services`
--
ALTER TABLE `services`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `service_categories`
--
ALTER TABLE `service_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `service_galleries`
--
ALTER TABLE `service_galleries`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `transactions`
--
ALTER TABLE `transactions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `transaction_items`
--
ALTER TABLE `transaction_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
