-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1
-- Время создания: Мар 10 2025 г., 15:40
-- Версия сервера: 10.4.32-MariaDB
-- Версия PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `postalservice`
--

-- --------------------------------------------------------

--
-- Структура таблицы `archived_clients`
--

CREATE TABLE `archived_clients` (
  `client_id` int(11) NOT NULL,
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `passport_number` varchar(20) NOT NULL,
  `address` varchar(255) NOT NULL,
  `phone_number` varchar(20) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Дамп данных таблицы `archived_clients`
--

INSERT INTO `archived_clients` (`client_id`, `first_name`, `last_name`, `passport_number`, `address`, `phone_number`, `email`) VALUES
(1, 'Иван', 'Иванов', '1234567890', 'Москва, ул. Ленина, д. 10', '+7 495 123-45-67', 'ivanov@mail.ru');

-- --------------------------------------------------------

--
-- Структура таблицы `clients`
--

CREATE TABLE `clients` (
  `client_id` int(11) NOT NULL,
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `passport_number` varchar(20) NOT NULL,
  `address` varchar(255) NOT NULL,
  `phone_number` varchar(20) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Дамп данных таблицы `clients`
--

INSERT INTO `clients` (`client_id`, `first_name`, `last_name`, `passport_number`, `address`, `phone_number`, `email`) VALUES
(1, 'Иван', 'Иванов', '1234567890', 'Москва, ул. Ленина, д. 10', '+7 495 999-99-99', 'ivanov@mail.ru'),
(2, 'Мария', 'Петрова', '9876543210', 'Санкт-Петербург, ул. Пушкина, д. 15', '+7 812 234-56-78', 'petrova@mail.ru'),
(3, 'Алексей', 'Смирнов', '1112233445', 'Новосибирск, ул. Мира, д. 25', '+7 383 345-67-89', 'smirnov@mail.ru'),
(4, 'Дмитрий', 'Ковалев', '2223334445', 'Екатеринбург, ул. Фрунзе, д. 50', '+7 343 567-89-01', 'kovalev@mail.ru'),
(5, 'Дарья', 'Гордеева', '2256667778', 'Казань, ул. Баки Урманче, д. 30', '+7 843 678-90-12', 'gordejeva@mail.ru'),
(6, 'Николай', 'Сергеев', '3334445556', 'Калининград, ул. Советская, д. 12', '+7 4012 123-45-67', 'sergeev@mail.ru'),
(7, 'Анна', 'Тимофеева', '4445556667', 'Краснодар, ул. Ленина, д. 18', NULL, NULL),
(8, 'Оксана', 'Федорова', '5556667778', 'Казань, ул. Карла Маркса, д. 7', '+7 843 234-56-78', NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `employees`
--

CREATE TABLE `employees` (
  `employee_id` int(11) NOT NULL,
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `position` varchar(50) NOT NULL,
  `office_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Дамп данных таблицы `employees`
--

INSERT INTO `employees` (`employee_id`, `first_name`, `last_name`, `position`, `office_id`) VALUES
(1, 'Елена', 'Кузнецова', 'Почтальон', 1),
(2, 'Олег', 'Сидоров', 'Кассир', 2),
(3, 'Анна', 'Михайлова', 'Менеджер', 3),
(4, 'Юлия', 'Павлова', 'Почтальон', 4),
(5, 'Владимир', 'Морозов', 'Кассир', 5),
(6, 'Сергей', 'Новиков', 'Почтальон', 1),
(7, 'Екатерина', 'Борисова', 'Кассир', 2),
(8, 'Михаил', 'Иванов', 'Менеджер', NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `parcels`
--

CREATE TABLE `parcels` (
  `parcel_id` int(11) NOT NULL,
  `parcel_type` enum('package','letter','parcel') NOT NULL,
  `sender_id` int(11) NOT NULL,
  `receiver_name` varchar(200) NOT NULL,
  `receiver_address` varchar(255) NOT NULL,
  `office_id` int(11) NOT NULL,
  `sending_date` date NOT NULL,
  `receiving_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Дамп данных таблицы `parcels`
--

INSERT INTO `parcels` (`parcel_id`, `parcel_type`, `sender_id`, `receiver_name`, `receiver_address`, `office_id`, `sending_date`, `receiving_date`) VALUES
(4, 'package', 1, 'Петр Иванов', 'Санкт-Петербург, ул. Пушкина, д. 15', 1, '2024-11-01', '2024-11-05'),
(6, 'parcel', 3, 'Марина Смирнова', 'Новосибирск, ул. Мира, д. 25', 3, '2024-11-03', NULL),
(7, 'package', 4, 'Ирина Степанова', 'Краснодар, ул. Победы, д. 7', 4, '2024-11-05', '2024-11-09'),
(8, 'letter', 5, 'Алексей Козлов', 'Воронеж, ул. Ленинградская, д. 35', 5, '2024-11-06', '2024-11-10'),
(9, 'package', 1, 'Ольга Смирнова', 'Санкт-Петербург, ул. Ленина, д. 21', 1, '2024-12-01', '2024-12-05'),
(10, 'letter', 2, 'Александр Сидоров', 'Москва, ул. Красная, д. 14', 2, '2024-12-02', NULL),
(11, 'parcel', 3, 'Марина Федорова', 'Екатеринбург, ул. Победы, д. 9', 3, '2024-12-03', NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `postal_offices`
--

CREATE TABLE `postal_offices` (
  `office_id` int(11) NOT NULL,
  `office_name` varchar(100) NOT NULL,
  `city` varchar(100) NOT NULL,
  `region` varchar(100) NOT NULL,
  `address` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Дамп данных таблицы `postal_offices`
--

INSERT INTO `postal_offices` (`office_id`, `office_name`, `city`, `region`, `address`) VALUES
(1, 'Центральное почтовое отделение', 'Москва', 'Москва', 'Москва, ул. Тверская, д. 1'),
(2, 'Северное почтовое отделение', 'Санкт-Петербург', 'Ленинградская область', 'Санкт-Петербург, пр. Невский, д. 20'),
(3, 'Южное почтовое отделение', 'Ростов-на-Дону', 'Ростовская область', 'Ростов-на-Дону, ул. Садовая, д. 5'),
(4, 'Западное почтовое отделение', 'Екатеринбург', 'Свердловская область', 'Екатеринбург, ул. 8 марта, д. 23'),
(5, 'Восточное почтовое отделение', 'Казань', 'Татарстан', 'Казань, ул. Тукая, д. 10'),
(6, 'Северо-Западное почтовое отделение', 'Калининград', 'Калининградская область', 'Калининград, ул. Советская, д. 25'),
(7, 'Южное почтовое отделение', 'Краснодар', 'Краснодарский край', 'Краснодар, ул. Ленина, д. 18');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `archived_clients`
--
ALTER TABLE `archived_clients`
  ADD PRIMARY KEY (`client_id`),
  ADD UNIQUE KEY `passport_number` (`passport_number`);

--
-- Индексы таблицы `clients`
--
ALTER TABLE `clients`
  ADD PRIMARY KEY (`client_id`),
  ADD UNIQUE KEY `passport_number` (`passport_number`);

--
-- Индексы таблицы `employees`
--
ALTER TABLE `employees`
  ADD PRIMARY KEY (`employee_id`),
  ADD KEY `office_id` (`office_id`);

--
-- Индексы таблицы `parcels`
--
ALTER TABLE `parcels`
  ADD PRIMARY KEY (`parcel_id`),
  ADD KEY `sender_id` (`sender_id`),
  ADD KEY `office_id` (`office_id`);

--
-- Индексы таблицы `postal_offices`
--
ALTER TABLE `postal_offices`
  ADD PRIMARY KEY (`office_id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `archived_clients`
--
ALTER TABLE `archived_clients`
  MODIFY `client_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `clients`
--
ALTER TABLE `clients`
  MODIFY `client_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT для таблицы `employees`
--
ALTER TABLE `employees`
  MODIFY `employee_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT для таблицы `parcels`
--
ALTER TABLE `parcels`
  MODIFY `parcel_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT для таблицы `postal_offices`
--
ALTER TABLE `postal_offices`
  MODIFY `office_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `employees`
--
ALTER TABLE `employees`
  ADD CONSTRAINT `employees_ibfk_1` FOREIGN KEY (`office_id`) REFERENCES `postal_offices` (`office_id`);

--
-- Ограничения внешнего ключа таблицы `parcels`
--
ALTER TABLE `parcels`
  ADD CONSTRAINT `parcels_ibfk_1` FOREIGN KEY (`sender_id`) REFERENCES `clients` (`client_id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `parcels_ibfk_2` FOREIGN KEY (`office_id`) REFERENCES `postal_offices` (`office_id`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
