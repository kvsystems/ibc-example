-- phpMyAdmin SQL Dump
-- version 4.8.1
-- https://www.phpmyadmin.net/
--
-- Хост: mysql.kv-sys.ru
-- Время создания: Авг 06 2018 г., 10:02
-- Версия сервера: 5.5.60-log
-- Версия PHP: 5.6.35

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `ibc_example`
--

-- --------------------------------------------------------

--
-- Структура таблицы `eve_attribute`
--

CREATE TABLE `eve_attribute` (
  `attribute_id` int(11) NOT NULL,
  `code` varchar(4) COLLATE utf8mb4_bin NOT NULL,
  `status` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Дамп данных таблицы `eve_attribute`
--

INSERT INTO `eve_attribute` (`attribute_id`, `code`, `status`) VALUES
(1, 'SCLR', 1),
(2, 'CATH', 1),
(3, 'DESC', 1);

-- --------------------------------------------------------

--
-- Структура таблицы `eve_attribute_description`
--

CREATE TABLE `eve_attribute_description` (
  `attribute_id` int(11) NOT NULL,
  `name` varchar(64) COLLATE utf8mb4_bin NOT NULL,
  `language_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Дамп данных таблицы `eve_attribute_description`
--

INSERT INTO `eve_attribute_description` (`attribute_id`, `name`, `language_id`) VALUES
(2, 'Где пойман/выращен', 1),
(3, 'Описание и повадки', 1),
(1, 'Цвет кожи', 1);

-- --------------------------------------------------------

--
-- Структура таблицы `eve_attribute_value`
--

CREATE TABLE `eve_attribute_value` (
  `value_id` int(11) NOT NULL,
  `attribute_id` int(11) NOT NULL,
  `code` varchar(4) COLLATE utf8mb4_bin NOT NULL,
  `status` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Дамп данных таблицы `eve_attribute_value`
--

INSERT INTO `eve_attribute_value` (`value_id`, `attribute_id`, `code`, `status`) VALUES
(1, 1, 'CWHI', 1),
(2, 1, 'CBLA', 1),
(3, 2, 'CRUS', 1),
(4, 2, 'CUSA', 1),
(5, 3, 'CSMO', 1),
(6, 3, 'CALK', 1);

-- --------------------------------------------------------

--
-- Структура таблицы `eve_attribute_value_description`
--

CREATE TABLE `eve_attribute_value_description` (
  `value_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `language_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Дамп данных таблицы `eve_attribute_value_description`
--

INSERT INTO `eve_attribute_value_description` (`value_id`, `name`, `language_id`) VALUES
(1, 'Светлая кожа', 1),
(2, 'Темная кожа', 1),
(3, 'Пойман в России', 1),
(4, 'Пойман в США', 1),
(5, 'Курит как паровоз', 1),
(6, 'Любитель выпить', 1);

-- --------------------------------------------------------

--
-- Структура таблицы `eve_category`
--

CREATE TABLE `eve_category` (
  `category_id` int(11) NOT NULL,
  `alias` varchar(32) COLLATE utf8mb4_bin NOT NULL,
  `parent` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Дамп данных таблицы `eve_category`
--

INSERT INTO `eve_category` (`category_id`, `alias`, `parent`, `status`) VALUES
(1, 'popular', 0, 1),
(2, 'kitchen', 1, 1),
(3, 'washmachine', 2, 1),
(4, 'other', 0, 1),
(5, 'living', 1, 1),
(6, 'bedroom', 1, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `eve_category_description`
--

CREATE TABLE `eve_category_description` (
  `category_id` int(11) NOT NULL,
  `name` varchar(128) COLLATE utf8mb4_bin NOT NULL,
  `description` text COLLATE utf8mb4_bin NOT NULL,
  `language_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Дамп данных таблицы `eve_category_description`
--

INSERT INTO `eve_category_description` (`category_id`, `name`, `description`, `language_id`) VALUES
(1, 'Популярное', 'Популярные рабы', 1),
(2, 'Для кухни', 'Они почти умеют готовить', 1),
(3, 'Мытье посуды', 'Опыт огромен, они никогда не платили в кафе и ресторанах', 1),
(4, 'Другие', 'Если у вас особые предпочтения, вам сюда', 1),
(5, 'Для гостиной', 'Мастера уборки для вас', 1),
(6, 'Для спальни', 'Главное не оставляйте никого с ними в спальне!', 1);

-- --------------------------------------------------------

--
-- Структура таблицы `eve_currency`
--

CREATE TABLE `eve_currency` (
  `currency_id` int(11) NOT NULL,
  `code` varchar(3) COLLATE utf8mb4_bin NOT NULL,
  `status` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Дамп данных таблицы `eve_currency`
--

INSERT INTO `eve_currency` (`currency_id`, `code`, `status`) VALUES
(1, 'GLD', 1);

-- --------------------------------------------------------

--
-- Структура таблицы `eve_currency_description`
--

CREATE TABLE `eve_currency_description` (
  `currency_id` int(11) NOT NULL,
  `name` varchar(64) COLLATE utf8mb4_bin NOT NULL,
  `language_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Дамп данных таблицы `eve_currency_description`
--

INSERT INTO `eve_currency_description` (`currency_id`, `name`, `language_id`) VALUES
(1, 'Золото', 1);

-- --------------------------------------------------------

--
-- Структура таблицы `eve_customer`
--

CREATE TABLE `eve_customer` (
  `customer_id` int(11) NOT NULL,
  `firstname` varchar(128) COLLATE utf8mb4_bin NOT NULL,
  `lastname` varchar(128) COLLATE utf8mb4_bin NOT NULL,
  `login` varchar(32) COLLATE utf8mb4_bin NOT NULL,
  `group_id` int(11) NOT NULL,
  `rent_limit` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Дамп данных таблицы `eve_customer`
--

INSERT INTO `eve_customer` (`customer_id`, `firstname`, `lastname`, `login`, `group_id`, `rent_limit`, `status`) VALUES
(1, 'Владимир', 'Петрович', 'vladapeta', 1, 2, 1),
(2, 'Петр', 'Владимиров', 'petavlada', 2, 0, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `eve_customer_group`
--

CREATE TABLE `eve_customer_group` (
  `group_id` int(11) NOT NULL,
  `tax_id` int(11) NOT NULL,
  `code` varchar(4) COLLATE utf8mb4_bin NOT NULL,
  `status` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Дамп данных таблицы `eve_customer_group`
--

INSERT INTO `eve_customer_group` (`group_id`, `tax_id`, `code`, `status`) VALUES
(1, 1, 'STDT', 1),
(2, 2, 'VIPT', 1);

-- --------------------------------------------------------

--
-- Структура таблицы `eve_customer_group_description`
--

CREATE TABLE `eve_customer_group_description` (
  `group_id` int(11) NOT NULL,
  `name` varchar(64) COLLATE utf8mb4_bin NOT NULL,
  `language_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Дамп данных таблицы `eve_customer_group_description`
--

INSERT INTO `eve_customer_group_description` (`group_id`, `name`, `language_id`) VALUES
(2, 'V.I.P. Клиент', 1),
(1, 'Стандартный покупатель', 1);

-- --------------------------------------------------------

--
-- Структура таблицы `eve_locale`
--

CREATE TABLE `eve_locale` (
  `language_id` int(11) NOT NULL,
  `locale` varchar(5) COLLATE utf8mb4_bin NOT NULL,
  `status` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Дамп данных таблицы `eve_locale`
--

INSERT INTO `eve_locale` (`language_id`, `locale`, `status`) VALUES
(1, 'ru_RU', 1);

-- --------------------------------------------------------

--
-- Структура таблицы `eve_rent`
--

CREATE TABLE `eve_rent` (
  `rent_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `slave_id` int(11) NOT NULL,
  `rate_cost` double NOT NULL,
  `rate_starts` datetime NOT NULL,
  `rate_expires` datetime NOT NULL,
  `date_created` datetime NOT NULL,
  `status` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Дамп данных таблицы `eve_rent`
--

INSERT INTO `eve_rent` (`rent_id`, `customer_id`, `slave_id`, `rate_cost`, `rate_starts`, `rate_expires`, `date_created`, `status`) VALUES
(1, 1, 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1);

-- --------------------------------------------------------

--
-- Структура таблицы `eve_schedule`
--

CREATE TABLE `eve_schedule` (
  `schedule_id` int(11) NOT NULL,
  `code` varchar(4) COLLATE utf8mb4_bin NOT NULL,
  `hours` double NOT NULL,
  `shedule_start` time NOT NULL,
  `status` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Дамп данных таблицы `eve_schedule`
--

INSERT INTO `eve_schedule` (`schedule_id`, `code`, `hours`, `shedule_start`, `status`) VALUES
(1, 'H016', 16, '00:00:00', 1);

-- --------------------------------------------------------

--
-- Структура таблицы `eve_schedule_description`
--

CREATE TABLE `eve_schedule_description` (
  `schedule_id` int(11) NOT NULL,
  `name` varchar(64) COLLATE utf8mb4_bin NOT NULL,
  `language_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Дамп данных таблицы `eve_schedule_description`
--

INSERT INTO `eve_schedule_description` (`schedule_id`, `name`, `language_id`) VALUES
(1, 'График 16 часов', 1);

-- --------------------------------------------------------

--
-- Структура таблицы `eve_service`
--

CREATE TABLE `eve_service` (
  `service_id` int(11) NOT NULL,
  `code` varchar(4) COLLATE utf8mb4_bin NOT NULL,
  `status` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Дамп данных таблицы `eve_service`
--

INSERT INTO `eve_service` (`service_id`, `code`, `status`) VALUES
(1, 'AGRI', 1),
(2, 'CTTB', 1),
(3, 'HOUS', 1),
(4, 'QUAR', 1);

-- --------------------------------------------------------

--
-- Структура таблицы `eve_service_description`
--

CREATE TABLE `eve_service_description` (
  `service_id` int(11) NOT NULL,
  `name` varchar(128) COLLATE utf8mb4_bin NOT NULL,
  `description` text COLLATE utf8mb4_bin NOT NULL,
  `language` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Дамп данных таблицы `eve_service_description`
--

INSERT INTO `eve_service_description` (`service_id`, `name`, `description`, `language`) VALUES
(1, 'Земледелие', '', 1),
(2, 'Скотоводство', '', 1),
(3, 'Работа по дому', '', 1),
(4, 'Работа в каменоломне', '', 1);

-- --------------------------------------------------------

--
-- Структура таблицы `eve_slave`
--

CREATE TABLE `eve_slave` (
  `slave_id` int(11) NOT NULL,
  `gender` int(11) NOT NULL,
  `age` int(11) NOT NULL,
  `weight` double NOT NULL,
  `schedule_id` int(11) NOT NULL,
  `rental_rate` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Дамп данных таблицы `eve_slave`
--

INSERT INTO `eve_slave` (`slave_id`, `gender`, `age`, `weight`, `schedule_id`, `rental_rate`, `status`) VALUES
(1, 1, 27, 88.9, 1, 5, 1),
(2, 1, 21, 95.3, 1, 3, 1),
(3, 1, 41, 115.2, 1, 2, 1),
(4, 1, 24, 66.7, 1, 7, 1),
(5, 1, 21, 195, 1, 9, 1),
(6, 1, 41, 79, 1, 5, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `eve_slave_description`
--

CREATE TABLE `eve_slave_description` (
  `slave_id` int(11) NOT NULL,
  `nickname` varchar(128) COLLATE utf8mb4_bin NOT NULL,
  `language_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Дамп данных таблицы `eve_slave_description`
--

INSERT INTO `eve_slave_description` (`slave_id`, `nickname`, `language_id`) VALUES
(2, 'Атомули Ядалато', 1),
(6, 'Камаз Отбросов', 1),
(4, 'Оридо Пота', 1),
(5, 'Поджог Сараев', 1),
(3, 'Ручищито Ширехари', 1),
(1, 'Томимо Токосо', 1);

-- --------------------------------------------------------

--
-- Структура таблицы `eve_slave_to_category`
--

CREATE TABLE `eve_slave_to_category` (
  `slave_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Дамп данных таблицы `eve_slave_to_category`
--

INSERT INTO `eve_slave_to_category` (`slave_id`, `category_id`, `language_id`) VALUES
(1, 1, 1),
(1, 2, 1),
(1, 3, 1),
(2, 1, 1),
(2, 2, 1),
(3, 1, 1),
(3, 5, 1),
(4, 1, 1),
(4, 5, 1),
(5, 1, 1),
(5, 6, 1),
(6, 1, 1),
(6, 6, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `eve_slave_to_currency`
--

CREATE TABLE `eve_slave_to_currency` (
  `slave_id` int(11) NOT NULL,
  `currency_id` int(11) NOT NULL,
  `cost` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Дамп данных таблицы `eve_slave_to_currency`
--

INSERT INTO `eve_slave_to_currency` (`slave_id`, `currency_id`, `cost`) VALUES
(4, 1, 46.88),
(3, 1, 157.1),
(6, 1, 333.66),
(1, 1, 499.82),
(2, 1, 857.12),
(5, 1, 890.15);

-- --------------------------------------------------------

--
-- Структура таблицы `eve_tax`
--

CREATE TABLE `eve_tax` (
  `tax_id` int(11) NOT NULL,
  `code` varchar(4) COLLATE utf8mb4_bin NOT NULL,
  `status` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Дамп данных таблицы `eve_tax`
--

INSERT INTO `eve_tax` (`tax_id`, `code`, `status`) VALUES
(1, 'STDT', 1),
(2, 'VIPT', 1);

-- --------------------------------------------------------

--
-- Структура таблицы `eve_tax_description`
--

CREATE TABLE `eve_tax_description` (
  `tax_id` int(11) NOT NULL,
  `name` varchar(64) COLLATE utf8mb4_bin NOT NULL,
  `language_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Дамп данных таблицы `eve_tax_description`
--

INSERT INTO `eve_tax_description` (`tax_id`, `name`, `language_id`) VALUES
(1, 'Без скидки', 1),
(2, 'Скидка 20%', 1);

-- --------------------------------------------------------

--
-- Структура таблицы `eve_tax_to_currency`
--

CREATE TABLE `eve_tax_to_currency` (
  `tax_id` int(11) NOT NULL,
  `currency_id` int(11) NOT NULL,
  `value` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Дамп данных таблицы `eve_tax_to_currency`
--

INSERT INTO `eve_tax_to_currency` (`tax_id`, `currency_id`, `value`) VALUES
(1, 1, 0),
(2, 1, 0.2);

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `eve_attribute`
--
ALTER TABLE `eve_attribute`
  ADD PRIMARY KEY (`attribute_id`),
  ADD UNIQUE KEY `code` (`code`);

--
-- Индексы таблицы `eve_attribute_description`
--
ALTER TABLE `eve_attribute_description`
  ADD PRIMARY KEY (`attribute_id`,`language_id`),
  ADD KEY `name` (`name`);

--
-- Индексы таблицы `eve_attribute_value`
--
ALTER TABLE `eve_attribute_value`
  ADD PRIMARY KEY (`value_id`),
  ADD UNIQUE KEY `code` (`code`);

--
-- Индексы таблицы `eve_attribute_value_description`
--
ALTER TABLE `eve_attribute_value_description`
  ADD PRIMARY KEY (`value_id`,`language_id`),
  ADD KEY `name` (`name`(191));

--
-- Индексы таблицы `eve_category`
--
ALTER TABLE `eve_category`
  ADD PRIMARY KEY (`category_id`),
  ADD UNIQUE KEY `alias` (`alias`);

--
-- Индексы таблицы `eve_category_description`
--
ALTER TABLE `eve_category_description`
  ADD PRIMARY KEY (`category_id`,`language_id`),
  ADD KEY `name` (`name`);

--
-- Индексы таблицы `eve_currency`
--
ALTER TABLE `eve_currency`
  ADD PRIMARY KEY (`currency_id`),
  ADD UNIQUE KEY `code` (`code`);

--
-- Индексы таблицы `eve_currency_description`
--
ALTER TABLE `eve_currency_description`
  ADD PRIMARY KEY (`currency_id`,`language_id`),
  ADD KEY `name` (`name`);

--
-- Индексы таблицы `eve_customer`
--
ALTER TABLE `eve_customer`
  ADD PRIMARY KEY (`customer_id`),
  ADD UNIQUE KEY `login` (`login`);

--
-- Индексы таблицы `eve_customer_group`
--
ALTER TABLE `eve_customer_group`
  ADD PRIMARY KEY (`group_id`),
  ADD UNIQUE KEY `code` (`code`);

--
-- Индексы таблицы `eve_customer_group_description`
--
ALTER TABLE `eve_customer_group_description`
  ADD PRIMARY KEY (`group_id`,`language_id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Индексы таблицы `eve_locale`
--
ALTER TABLE `eve_locale`
  ADD PRIMARY KEY (`language_id`),
  ADD UNIQUE KEY `locale` (`locale`);

--
-- Индексы таблицы `eve_rent`
--
ALTER TABLE `eve_rent`
  ADD PRIMARY KEY (`rent_id`);

--
-- Индексы таблицы `eve_schedule`
--
ALTER TABLE `eve_schedule`
  ADD PRIMARY KEY (`schedule_id`),
  ADD UNIQUE KEY `code` (`code`);

--
-- Индексы таблицы `eve_schedule_description`
--
ALTER TABLE `eve_schedule_description`
  ADD PRIMARY KEY (`schedule_id`,`language_id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Индексы таблицы `eve_service`
--
ALTER TABLE `eve_service`
  ADD PRIMARY KEY (`service_id`),
  ADD UNIQUE KEY `code` (`code`);

--
-- Индексы таблицы `eve_service_description`
--
ALTER TABLE `eve_service_description`
  ADD PRIMARY KEY (`service_id`,`language`),
  ADD KEY `name` (`name`);

--
-- Индексы таблицы `eve_slave`
--
ALTER TABLE `eve_slave`
  ADD PRIMARY KEY (`slave_id`);

--
-- Индексы таблицы `eve_slave_description`
--
ALTER TABLE `eve_slave_description`
  ADD PRIMARY KEY (`slave_id`,`language_id`),
  ADD KEY `nickname` (`nickname`);

--
-- Индексы таблицы `eve_slave_to_category`
--
ALTER TABLE `eve_slave_to_category`
  ADD PRIMARY KEY (`slave_id`,`category_id`,`language_id`);

--
-- Индексы таблицы `eve_slave_to_currency`
--
ALTER TABLE `eve_slave_to_currency`
  ADD PRIMARY KEY (`slave_id`,`currency_id`),
  ADD KEY `cost` (`cost`);

--
-- Индексы таблицы `eve_tax`
--
ALTER TABLE `eve_tax`
  ADD PRIMARY KEY (`tax_id`);

--
-- Индексы таблицы `eve_tax_description`
--
ALTER TABLE `eve_tax_description`
  ADD PRIMARY KEY (`tax_id`,`language_id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Индексы таблицы `eve_tax_to_currency`
--
ALTER TABLE `eve_tax_to_currency`
  ADD PRIMARY KEY (`tax_id`,`currency_id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `eve_attribute`
--
ALTER TABLE `eve_attribute`
  MODIFY `attribute_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `eve_attribute_value`
--
ALTER TABLE `eve_attribute_value`
  MODIFY `value_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT для таблицы `eve_category`
--
ALTER TABLE `eve_category`
  MODIFY `category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT для таблицы `eve_currency`
--
ALTER TABLE `eve_currency`
  MODIFY `currency_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `eve_customer`
--
ALTER TABLE `eve_customer`
  MODIFY `customer_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `eve_customer_group`
--
ALTER TABLE `eve_customer_group`
  MODIFY `group_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `eve_locale`
--
ALTER TABLE `eve_locale`
  MODIFY `language_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `eve_rent`
--
ALTER TABLE `eve_rent`
  MODIFY `rent_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `eve_schedule`
--
ALTER TABLE `eve_schedule`
  MODIFY `schedule_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `eve_service`
--
ALTER TABLE `eve_service`
  MODIFY `service_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT для таблицы `eve_slave`
--
ALTER TABLE `eve_slave`
  MODIFY `slave_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT для таблицы `eve_tax`
--
ALTER TABLE `eve_tax`
  MODIFY `tax_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
