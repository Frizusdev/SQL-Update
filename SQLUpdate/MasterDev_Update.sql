-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Czas generowania: 28 Sie 2023, 14:46
-- Wersja serwera: 10.4.27-MariaDB
-- Wersja PHP: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Baza danych: `MasterDev_Update`
--

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `apps`
--

CREATE TABLE `apps` (
  `id` int(11) NOT NULL,
  `App_Name` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Zrzut danych tabeli `apps`
--

INSERT INTO `apps` (`id`, `App_Name`) VALUES
(1, 'testowa'),
(2, 'zzzzzz'),
(3, 'ssssss'),
(4, 'sosik'),
(5, '\'dsawdwadwa'),
(6, '<p>xddddd</p>'),
(7, ';--');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `data`
--

CREATE TABLE `data` (
  `id` int(11) NOT NULL,
  `createdby` int(11) NOT NULL,
  `file_id` int(11) NOT NULL,
  `app_id` int(11) NOT NULL,
  `published` tinyint(1) NOT NULL,
  `version` longtext NOT NULL,
  `date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Zrzut danych tabeli `data`
--

INSERT INTO `data` (`id`, `createdby`, `file_id`, `app_id`, `published`, `version`, `date`) VALUES
(1, 0, 1, 0, 1, '1', '2023-08-02 14:02:21.237501'),
(2, 0, 2, 1, 1, '1.0.5', '2023-08-02 14:03:55.437157'),
(3, 0, 1, 1, 1, '1.1.1', '2023-08-03 11:46:32.541171'),
(4, 1, 1, 1, 1, '1.1.3', '2023-08-03 11:51:00.673692');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `files`
--

CREATE TABLE `files` (
  `id` int(11) NOT NULL,
  `createdby` int(11) NOT NULL,
  `file_name` text NOT NULL,
  `file_path` text NOT NULL,
  `date` datetime(6) NOT NULL DEFAULT '0001-01-01 00:00:00.000000',
  `version` text NOT NULL,
  `app_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Zrzut danych tabeli `files`
--

INSERT INTO `files` (`id`, `createdby`, `file_name`, `file_path`, `date`, `version`, `app_id`) VALUES
(1, 1, 'Archiwum(1).zip', '/Users/blazej/Projects/Masterdev.Update.RestAPI/Masterdev.Update.RestAPI/Updatezips', '2023-08-03 09:58:13.850403', '1.0.2', 1),
(2, 1, 'Archiwum(2).zip', '/Users/blazej/Projects/Masterdev.Update.RestAPI/Masterdev.Update.RestAPI/Updatezips', '2023-08-03 11:53:15.158060', '1.0.5', 1),
(3, 1, 'Archiwum(2)(1).zip', '/Users/blazej/Projects/Masterdev.Update.RestAPI/Masterdev.Update.RestAPI/Updatezips', '2023-08-25 14:49:00.367145', '1.0.3', 1);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `__EFMigrationsHistory`
--

CREATE TABLE `__EFMigrationsHistory` (
  `MigrationId` varchar(150) NOT NULL,
  `ProductVersion` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Zrzut danych tabeli `__EFMigrationsHistory`
--

INSERT INTO `__EFMigrationsHistory` (`MigrationId`, `ProductVersion`) VALUES
('20230802115858_IntitialMigration', '7.0.9'),
('20230802121033_one', '7.0.9'),
('20230803075720_second', '7.0.9');

--
-- Indeksy dla zrzutów tabel
--

--
-- Indeksy dla tabeli `apps`
--
ALTER TABLE `apps`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `data`
--
ALTER TABLE `data`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `files`
--
ALTER TABLE `files`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `__EFMigrationsHistory`
--
ALTER TABLE `__EFMigrationsHistory`
  ADD PRIMARY KEY (`MigrationId`);

--
-- AUTO_INCREMENT dla zrzuconych tabel
--

--
-- AUTO_INCREMENT dla tabeli `apps`
--
ALTER TABLE `apps`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT dla tabeli `data`
--
ALTER TABLE `data`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT dla tabeli `files`
--
ALTER TABLE `files`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
