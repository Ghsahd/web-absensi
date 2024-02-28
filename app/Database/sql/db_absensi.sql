-- phpMyAdmin SQL Dump
-- version 5.2.1-dev+20230105.dfd5f13078
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 28 Feb 2024 pada 17.19
-- Versi server: 10.4.24-MariaDB
-- Versi PHP: 8.1.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_absensi`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `auth_activation_attempts`
--

CREATE TABLE `auth_activation_attempts` (
  `id` int(11) UNSIGNED NOT NULL,
  `ip_address` varchar(255) NOT NULL,
  `user_agent` varchar(255) NOT NULL,
  `token` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `auth_groups`
--

CREATE TABLE `auth_groups` (
  `id` int(11) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `auth_groups_permissions`
--

CREATE TABLE `auth_groups_permissions` (
  `group_id` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `permission_id` int(11) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `auth_groups_users`
--

CREATE TABLE `auth_groups_users` (
  `group_id` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `user_id` int(11) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `auth_logins`
--

CREATE TABLE `auth_logins` (
  `id` int(11) UNSIGNED NOT NULL,
  `ip_address` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `user_id` int(11) UNSIGNED DEFAULT NULL,
  `date` datetime NOT NULL,
  `success` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `auth_logins`
--

INSERT INTO `auth_logins` (`id`, `ip_address`, `email`, `user_id`, `date`, `success`) VALUES
(1, '::1', 'adminsuper@gmail.com', 1, '2024-02-02 21:32:58', 1),
(2, '::1', 'adminsuper@gmail.com', 1, '2024-02-03 03:37:34', 1),
(3, '::1', 'adminsuper@gmail.com', 1, '2024-02-03 09:23:13', 1),
(4, '::1', 'syifa@gmail.com', NULL, '2024-02-03 11:10:54', 0),
(5, '::1', 'syifa@gmail.com', NULL, '2024-02-03 11:11:19', 0),
(6, '::1', 'syifa@gmail.com', NULL, '2024-02-03 11:11:54', 0),
(7, '::1', 'syifa@gmail.com', NULL, '2024-02-03 11:12:30', 0),
(8, '::1', 'adminsuper@gmail.com', 1, '2024-02-03 11:19:16', 1),
(9, '::1', 'satuglab@gmail.com', NULL, '2024-02-03 11:23:14', 0),
(10, '::1', 'adminsuper@gmail.com', 1, '2024-02-03 11:24:10', 1),
(11, '::1', 'gos@jogjabyte.com', NULL, '2024-02-03 11:27:26', 0),
(12, '::1', 'gos@jogjabyte.com', NULL, '2024-02-03 11:27:49', 0),
(13, '::1', 'syifa@gmail.com', NULL, '2024-02-03 11:28:36', 0),
(14, '::1', 'syifa@gmail.com', 7, '2024-02-03 11:29:04', 1),
(15, '::1', 'adminsuper@gmail.com', 1, '2024-02-03 11:31:38', 1),
(16, '::1', 'gos@jogjabyte.com', 8, '2024-02-03 11:32:46', 1),
(17, '::1', 'gos@jogjabyte.com', 8, '2024-02-03 11:34:28', 1),
(18, '::1', 'tes@gmail.com', NULL, '2024-02-03 11:36:57', 0),
(19, '::1', 'tes@gmail.com', NULL, '2024-02-03 11:37:08', 0),
(20, '::1', 'tes@gmail.com', 9, '2024-02-03 11:38:01', 1),
(21, '::1', 'gos@jogjabyte.com', 10, '2024-02-03 11:46:03', 0),
(22, '::1', 'tes@gmail.com', 9, '2024-02-03 12:33:16', 1),
(23, '::1', 'adminsuper@gmail.com', 1, '2024-02-05 12:22:20', 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `auth_permissions`
--

CREATE TABLE `auth_permissions` (
  `id` int(11) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `auth_reset_attempts`
--

CREATE TABLE `auth_reset_attempts` (
  `id` int(11) UNSIGNED NOT NULL,
  `email` varchar(255) NOT NULL,
  `ip_address` varchar(255) NOT NULL,
  `user_agent` varchar(255) NOT NULL,
  `token` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `auth_tokens`
--

CREATE TABLE `auth_tokens` (
  `id` int(11) UNSIGNED NOT NULL,
  `selector` varchar(255) NOT NULL,
  `hashedValidator` varchar(255) NOT NULL,
  `user_id` int(11) UNSIGNED NOT NULL,
  `expires` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `auth_users_permissions`
--

CREATE TABLE `auth_users_permissions` (
  `user_id` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `permission_id` int(11) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `migrations`
--

CREATE TABLE `migrations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `version` varchar(255) NOT NULL,
  `class` varchar(255) NOT NULL,
  `group` varchar(255) NOT NULL,
  `namespace` varchar(255) NOT NULL,
  `time` int(11) NOT NULL,
  `batch` int(11) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `migrations`
--

INSERT INTO `migrations` (`id`, `version`, `class`, `group`, `namespace`, `time`, `batch`) VALUES
(1, '2017-11-20-223112', 'Myth\\Auth\\Database\\Migrations\\CreateAuthTables', 'default', 'Myth\\Auth', 1706883940, 1),
(2, '2023-08-18-000001', 'App\\Database\\Migrations\\CreateJurusanTable', 'default', 'App', 1706883940, 1),
(3, '2023-08-18-000002', 'App\\Database\\Migrations\\CreateKelasTable', 'default', 'App', 1706883940, 1),
(4, '2023-08-18-000003', 'App\\Database\\Migrations\\CreateDB', 'default', 'App', 1706883940, 1),
(5, '2023-08-18-000004', 'App\\Database\\Migrations\\AddSuperadmin', 'default', 'App', 1706883940, 1),
(6, '2024-02-02-164705', 'App\\Database\\Migrations\\MatpelModel', 'default', 'App', 1706893192, 2),
(8, '2024-02-02-170004', 'App\\Database\\Migrations\\JadwalModel', 'default', 'App', 1706894008, 3);

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_guru`
--

CREATE TABLE `tb_guru` (
  `id_guru` int(11) NOT NULL,
  `nuptk` varchar(24) NOT NULL,
  `nama_guru` varchar(255) NOT NULL,
  `jenis_kelamin` enum('Laki-laki','Perempuan') NOT NULL,
  `alamat` text NOT NULL,
  `no_hp` varchar(32) NOT NULL,
  `unique_code` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tb_guru`
--

INSERT INTO `tb_guru` (`id_guru`, `nuptk`, `nama_guru`, `jenis_kelamin`, `alamat`, `no_hp`, `unique_code`) VALUES
(1, '123434567890123456', 'MUHAMMAD ADIS FAKHRIZKY 32', 'Laki-laki', 'Desa delegan kecamatan prambanan', '089765617267', '305c6c92fe7f2ae6f55d6f6907bf7f19e701ded40e1e94a1af308d522428ce22'),
(24, '123456789123456789', 'Rahmat Iriyanto', 'Laki-laki', 'desa khempek', '0987876473862', 'd3dc145307a04a828360215bcf9d10a53384772e5776d222ebd6124b96b02793');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_jadwal`
--

CREATE TABLE `tb_jadwal` (
  `id_jadwal` int(11) UNSIGNED NOT NULL,
  `id_kelas` int(11) UNSIGNED NOT NULL,
  `id_guru` int(11) NOT NULL,
  `id_matpel` int(11) UNSIGNED NOT NULL,
  `hari` varchar(100) NOT NULL,
  `jam_mulai` time NOT NULL,
  `jam_selesai` time NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp(),
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `tb_jadwal`
--

INSERT INTO `tb_jadwal` (`id_jadwal`, `id_kelas`, `id_guru`, `id_matpel`, `hari`, `jam_mulai`, `jam_selesai`, `created_at`, `updated_at`, `deleted_at`) VALUES
(5, 13, 1, 1, 'Senin', '10:00:00', '12:00:00', '2024-02-02 20:19:05', '2024-02-02 20:19:05', NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_jurusan`
--

CREATE TABLE `tb_jurusan` (
  `id` int(11) UNSIGNED NOT NULL,
  `jurusan` varchar(32) NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp(),
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `tb_jurusan`
--

INSERT INTO `tb_jurusan` (`id`, `jurusan`, `created_at`, `updated_at`, `deleted_at`) VALUES
(5, 'A', '2024-02-02 14:55:51', '2024-02-02 14:55:51', NULL),
(6, 'B', '2024-02-05 05:32:36', '2024-02-05 05:32:36', NULL),
(7, 'C', '2024-02-05 05:44:14', '2024-02-05 05:44:14', NULL),
(8, 'D', '2024-02-05 05:45:20', '2024-02-05 05:45:20', NULL),
(9, 'E', '2024-02-05 05:45:29', '2024-02-05 05:45:29', NULL),
(10, 'F', '2024-02-05 05:45:40', '2024-02-05 05:45:40', NULL),
(11, 'G', '2024-02-05 05:45:52', '2024-02-05 05:45:52', NULL),
(12, 'H', '2024-02-05 05:46:01', '2024-02-05 05:46:01', NULL),
(13, 'I', '2024-02-05 05:46:12', '2024-02-05 05:46:12', NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_kehadiran`
--

CREATE TABLE `tb_kehadiran` (
  `id_kehadiran` int(11) NOT NULL,
  `kehadiran` enum('Hadir','Sakit','Izin','Tanpa keterangan') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tb_kehadiran`
--

INSERT INTO `tb_kehadiran` (`id_kehadiran`, `kehadiran`) VALUES
(1, 'Hadir'),
(2, 'Sakit'),
(3, 'Izin'),
(4, 'Tanpa keterangan');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_kelas`
--

CREATE TABLE `tb_kelas` (
  `id_kelas` int(11) UNSIGNED NOT NULL,
  `kelas` varchar(32) NOT NULL,
  `id_jurusan` int(11) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp(),
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `tb_kelas`
--

INSERT INTO `tb_kelas` (`id_kelas`, `kelas`, `id_jurusan`, `created_at`, `updated_at`, `deleted_at`) VALUES
(13, 'IX', 5, '2024-02-02 14:56:02', '2024-02-02 14:56:02', NULL),
(14, 'VII', 6, '2024-02-05 05:33:01', '2024-02-05 05:33:01', NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_matpel`
--

CREATE TABLE `tb_matpel` (
  `id_matpel` int(11) UNSIGNED NOT NULL,
  `matpel` varchar(100) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `tb_matpel`
--

INSERT INTO `tb_matpel` (`id_matpel`, `matpel`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Bahasa Indonesia 1', NULL, NULL, NULL),
(3, 'Matematika', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_presensi_guru`
--

CREATE TABLE `tb_presensi_guru` (
  `id_presensi` int(11) NOT NULL,
  `id_guru` int(11) DEFAULT NULL,
  `tanggal` date NOT NULL,
  `jam_masuk` time DEFAULT NULL,
  `jam_keluar` time DEFAULT NULL,
  `id_kehadiran` int(11) NOT NULL,
  `keterangan` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_presensi_siswa`
--

CREATE TABLE `tb_presensi_siswa` (
  `id_presensi` int(11) NOT NULL,
  `id_siswa` int(11) NOT NULL,
  `id_kelas` int(11) UNSIGNED DEFAULT NULL,
  `tanggal` date NOT NULL,
  `jam_masuk` time DEFAULT NULL,
  `jam_keluar` time DEFAULT NULL,
  `id_kehadiran` int(11) NOT NULL,
  `keterangan` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tb_presensi_siswa`
--

INSERT INTO `tb_presensi_siswa` (`id_presensi`, `id_siswa`, `id_kelas`, `tanggal`, `jam_masuk`, `jam_keluar`, `id_kehadiran`, `keterangan`) VALUES
(1, 1, 13, '2024-02-02', NULL, NULL, 3, ''),
(2, 1, 13, '2024-02-03', NULL, NULL, 3, 'sudah izin\r\n');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_siswa`
--

CREATE TABLE `tb_siswa` (
  `id_siswa` int(11) NOT NULL,
  `nis` varchar(16) NOT NULL,
  `nama_siswa` varchar(255) NOT NULL,
  `id_kelas` int(11) UNSIGNED NOT NULL,
  `jenis_kelamin` enum('Laki-laki','Perempuan') NOT NULL,
  `no_hp` varchar(32) NOT NULL,
  `unique_code` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tb_siswa`
--

INSERT INTO `tb_siswa` (`id_siswa`, `nis`, `nama_siswa`, `id_kelas`, `jenis_kelamin`, `no_hp`, `unique_code`) VALUES
(1, '12345', 'MUHAMMAD ADIS FAKHRIZKY2', 13, 'Laki-laki', '08197778572', 'c7fab645c9c15258829914acc7c6fe8898033e0ad01e4d651814818e53012f9c');

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `id` int(11) UNSIGNED NOT NULL,
  `email` varchar(255) NOT NULL,
  `username` varchar(30) DEFAULT NULL,
  `is_superadmin` tinyint(1) NOT NULL DEFAULT 0,
  `password_hash` varchar(255) NOT NULL,
  `reset_hash` varchar(255) DEFAULT NULL,
  `reset_at` datetime DEFAULT NULL,
  `reset_expires` datetime DEFAULT NULL,
  `activate_hash` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `status_message` varchar(255) DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT 0,
  `force_pass_reset` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`id`, `email`, `username`, `is_superadmin`, `password_hash`, `reset_hash`, `reset_at`, `reset_expires`, `activate_hash`, `status`, `status_message`, `active`, `force_pass_reset`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'adminsuper@gmail.com', 'superadmin', 1, '$2y$10$yU05cAsZR7TnRazGhTINeOPWdiw3Z0aqz3iCoCS6OTf.kpoFxcBUG', NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, NULL, NULL),
(9, 'tes@gmail.com', 'Rahmat Rian', 0, '$2y$10$F6W2I81KRzcaERTVPfjA9.vKFGYu9QlWZxUhf./c5zIpCBHZ.sROe', NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, NULL, NULL);

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `auth_activation_attempts`
--
ALTER TABLE `auth_activation_attempts`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `auth_groups`
--
ALTER TABLE `auth_groups`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `auth_groups_permissions`
--
ALTER TABLE `auth_groups_permissions`
  ADD KEY `auth_groups_permissions_permission_id_foreign` (`permission_id`),
  ADD KEY `group_id_permission_id` (`group_id`,`permission_id`);

--
-- Indeks untuk tabel `auth_groups_users`
--
ALTER TABLE `auth_groups_users`
  ADD KEY `auth_groups_users_user_id_foreign` (`user_id`),
  ADD KEY `group_id_user_id` (`group_id`,`user_id`);

--
-- Indeks untuk tabel `auth_logins`
--
ALTER TABLE `auth_logins`
  ADD PRIMARY KEY (`id`),
  ADD KEY `email` (`email`),
  ADD KEY `user_id` (`user_id`);

--
-- Indeks untuk tabel `auth_permissions`
--
ALTER TABLE `auth_permissions`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `auth_reset_attempts`
--
ALTER TABLE `auth_reset_attempts`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `auth_tokens`
--
ALTER TABLE `auth_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `auth_tokens_user_id_foreign` (`user_id`),
  ADD KEY `selector` (`selector`);

--
-- Indeks untuk tabel `auth_users_permissions`
--
ALTER TABLE `auth_users_permissions`
  ADD KEY `auth_users_permissions_permission_id_foreign` (`permission_id`),
  ADD KEY `user_id_permission_id` (`user_id`,`permission_id`);

--
-- Indeks untuk tabel `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `tb_guru`
--
ALTER TABLE `tb_guru`
  ADD PRIMARY KEY (`id_guru`),
  ADD UNIQUE KEY `unique_code` (`unique_code`);

--
-- Indeks untuk tabel `tb_jadwal`
--
ALTER TABLE `tb_jadwal`
  ADD PRIMARY KEY (`id_jadwal`),
  ADD KEY `tb_jadwal_id_kelas_foreign` (`id_kelas`),
  ADD KEY `tb_jadwal_id_guru_foreign` (`id_guru`),
  ADD KEY `tb_jadwal_id_matpel_foreign` (`id_matpel`);

--
-- Indeks untuk tabel `tb_jurusan`
--
ALTER TABLE `tb_jurusan`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `jurusan` (`jurusan`);

--
-- Indeks untuk tabel `tb_kehadiran`
--
ALTER TABLE `tb_kehadiran`
  ADD PRIMARY KEY (`id_kehadiran`);

--
-- Indeks untuk tabel `tb_kelas`
--
ALTER TABLE `tb_kelas`
  ADD PRIMARY KEY (`id_kelas`),
  ADD KEY `tb_kelas_id_jurusan_foreign` (`id_jurusan`);

--
-- Indeks untuk tabel `tb_matpel`
--
ALTER TABLE `tb_matpel`
  ADD PRIMARY KEY (`id_matpel`);

--
-- Indeks untuk tabel `tb_presensi_guru`
--
ALTER TABLE `tb_presensi_guru`
  ADD PRIMARY KEY (`id_presensi`),
  ADD KEY `id_kehadiran` (`id_kehadiran`),
  ADD KEY `id_guru` (`id_guru`);

--
-- Indeks untuk tabel `tb_presensi_siswa`
--
ALTER TABLE `tb_presensi_siswa`
  ADD PRIMARY KEY (`id_presensi`),
  ADD KEY `id_siswa` (`id_siswa`),
  ADD KEY `id_kehadiran` (`id_kehadiran`),
  ADD KEY `id_kelas` (`id_kelas`);

--
-- Indeks untuk tabel `tb_siswa`
--
ALTER TABLE `tb_siswa`
  ADD PRIMARY KEY (`id_siswa`),
  ADD UNIQUE KEY `unique_code` (`unique_code`),
  ADD KEY `id_kelas` (`id_kelas`);

--
-- Indeks untuk tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `username` (`username`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `auth_activation_attempts`
--
ALTER TABLE `auth_activation_attempts`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `auth_groups`
--
ALTER TABLE `auth_groups`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `auth_logins`
--
ALTER TABLE `auth_logins`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT untuk tabel `auth_permissions`
--
ALTER TABLE `auth_permissions`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `auth_reset_attempts`
--
ALTER TABLE `auth_reset_attempts`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `auth_tokens`
--
ALTER TABLE `auth_tokens`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT untuk tabel `tb_guru`
--
ALTER TABLE `tb_guru`
  MODIFY `id_guru` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT untuk tabel `tb_jadwal`
--
ALTER TABLE `tb_jadwal`
  MODIFY `id_jadwal` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT untuk tabel `tb_jurusan`
--
ALTER TABLE `tb_jurusan`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT untuk tabel `tb_kehadiran`
--
ALTER TABLE `tb_kehadiran`
  MODIFY `id_kehadiran` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `tb_kelas`
--
ALTER TABLE `tb_kelas`
  MODIFY `id_kelas` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT untuk tabel `tb_matpel`
--
ALTER TABLE `tb_matpel`
  MODIFY `id_matpel` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `tb_presensi_guru`
--
ALTER TABLE `tb_presensi_guru`
  MODIFY `id_presensi` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `tb_presensi_siswa`
--
ALTER TABLE `tb_presensi_siswa`
  MODIFY `id_presensi` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `tb_siswa`
--
ALTER TABLE `tb_siswa`
  MODIFY `id_siswa` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `auth_groups_permissions`
--
ALTER TABLE `auth_groups_permissions`
  ADD CONSTRAINT `auth_groups_permissions_group_id_foreign` FOREIGN KEY (`group_id`) REFERENCES `auth_groups` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `auth_groups_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `auth_permissions` (`id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `auth_groups_users`
--
ALTER TABLE `auth_groups_users`
  ADD CONSTRAINT `auth_groups_users_group_id_foreign` FOREIGN KEY (`group_id`) REFERENCES `auth_groups` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `auth_groups_users_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `auth_tokens`
--
ALTER TABLE `auth_tokens`
  ADD CONSTRAINT `auth_tokens_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `auth_users_permissions`
--
ALTER TABLE `auth_users_permissions`
  ADD CONSTRAINT `auth_users_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `auth_permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `auth_users_permissions_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `tb_jadwal`
--
ALTER TABLE `tb_jadwal`
  ADD CONSTRAINT `tb_jadwal_id_guru_foreign` FOREIGN KEY (`id_guru`) REFERENCES `tb_guru` (`id_guru`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `tb_jadwal_id_kelas_foreign` FOREIGN KEY (`id_kelas`) REFERENCES `tb_kelas` (`id_kelas`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `tb_jadwal_id_matpel_foreign` FOREIGN KEY (`id_matpel`) REFERENCES `tb_matpel` (`id_matpel`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `tb_kelas`
--
ALTER TABLE `tb_kelas`
  ADD CONSTRAINT `tb_kelas_id_jurusan_foreign` FOREIGN KEY (`id_jurusan`) REFERENCES `tb_jurusan` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `tb_presensi_guru`
--
ALTER TABLE `tb_presensi_guru`
  ADD CONSTRAINT `tb_presensi_guru_ibfk_2` FOREIGN KEY (`id_kehadiran`) REFERENCES `tb_kehadiran` (`id_kehadiran`),
  ADD CONSTRAINT `tb_presensi_guru_ibfk_3` FOREIGN KEY (`id_guru`) REFERENCES `tb_guru` (`id_guru`) ON DELETE SET NULL;

--
-- Ketidakleluasaan untuk tabel `tb_presensi_siswa`
--
ALTER TABLE `tb_presensi_siswa`
  ADD CONSTRAINT `tb_presensi_siswa_ibfk_2` FOREIGN KEY (`id_kehadiran`) REFERENCES `tb_kehadiran` (`id_kehadiran`),
  ADD CONSTRAINT `tb_presensi_siswa_ibfk_3` FOREIGN KEY (`id_siswa`) REFERENCES `tb_siswa` (`id_siswa`) ON DELETE CASCADE,
  ADD CONSTRAINT `tb_presensi_siswa_ibfk_4` FOREIGN KEY (`id_kelas`) REFERENCES `tb_kelas` (`id_kelas`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `tb_siswa`
--
ALTER TABLE `tb_siswa`
  ADD CONSTRAINT `tb_siswa_ibfk_1` FOREIGN KEY (`id_kelas`) REFERENCES `tb_kelas` (`id_kelas`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
