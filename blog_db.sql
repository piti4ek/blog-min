-- phpMyAdmin SQL Dump
-- version 4.7.7
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Ноя 22 2018 г., 17:23
-- Версия сервера: 5.6.38
-- Версия PHP: 7.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `blog_db`
--

-- --------------------------------------------------------

--
-- Структура таблицы `articles`
--

CREATE TABLE `articles` (
  `id` int(11) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `text` text,
  `categorie_id` varchar(11) DEFAULT NULL,
  `pubdate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `views` int(11) NOT NULL DEFAULT '0',
  `image` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `articles`
--

INSERT INTO `articles` (`id`, `title`, `text`, `categorie_id`, `pubdate`, `views`, `image`) VALUES
(1, 'Evo 9', 'Mitsubishi Lancer Evolution IX поступил в продажу в Японии 3 марта 2005,[6] в тот же день он был продемонстрирован широкой аудитории на Женевском автосалоне .[7] Американцы увидели этот автомобиль на en: New York International Auto Show в апреле.[8] Двухлитровый двигатель 4G63 имел технологию MIVEC и доработанную турбину, в результате модернизации мощность двигателя возросла до 291 лошадиной силы и 392 Hм крутящего момента.\r\n\r\n', '8', '2018-09-24 15:16:01', 20, 'evo9.jpg'),
(2, 'Evo 7', '<h1>Evolution овь изменился в 2003 году, на этот раз были добавлены 17 дюймовые серые колеса Enkei, тормоза Brembo и амортизаторы Bilstein для лучшей цепкости. Мощность двигателя в паре с 5-ступенчатой механической коробкой передач составляла 280 л. с. (206 кВт). В США к 2005 году она была доступна в четырёх вариантах: стандартная модель GSR в Японии, RS со стальной крышей, 5-ступенчатой коробкой передач, и стандартными колесами (с отсутствием избыточных компонентов, таких как карта освещения салона, силовые окна и двери, и радио), SSL (с люком на крыше, багажником с сабвуфером, и кожаными сиденьями), и MR с доработанным передним дифференциалом повышенного трения, алюминиевая ручка коробки передач, ручной тормоз с ручкой из углеродного волокна, 17-дюймовые колеса BBS, алюминиевая крыша, и 6-ступенчатая механическая коробка передач. Новый Evolution также имел хромированные корпуса задних фонарей и фар.\r\n\r\n</h1>', '1', '2018-09-25 11:22:55', 14, 'evo7.jpg'),
(3, 'Nissan GT-R', 'Nissan GT-R — суперкар, выпускаемый компанией Nissan Motor. Представлен в качестве серийной модели на Токийском автосалоне 24 октября 2007 года, продажи начались в 2008 году в Японии, затем в США и Европе. В отличие от предшественников, выпускавшихся только для JDM и ограниченным тиражом поставлявшихся в Англию, имеется вариант с левым рулём.\r\n\r\n', '3', '2018-09-25 11:24:30', 12, 'gtr.jpg'),
(4, 'Civic type R', 'Honda Civic Type R — спортивная версия Honda Civic. Буква R в слове «Type R» происходит от английского слова racing («гоночный»), и обозначает спортивный характер автомобиля (как и у других автомобилей Honda с буквой «R» в конце своего названия — Type R, Euro R, SIR, характерной чертой которых является эмблема Honda на красном фоне — как на болиде RA-272, который принёс японской марке первую победу в Гран-при Формула-1 в Мексике, в 1965 году).\r\n\r\n', '7', '2018-09-25 12:27:07', 80, 'typer.jpg'),
(5, 'Nissan skyline r34', '10-е поколение Nissan Skyline было представлено в мае 1998 в кузовах R34 с большим акцентом на спортивность и соответствие новым экологическим нормам. В базовой модели GT двигатель RB20E был заменен на RB20DE, в последний раз использовавшийся на R32, но модернизированный (NEO). R34 GT с двигателем RB20DE NEO и 5-ступенчатой коробкой передач, стал лучшим по топливной экономичности среди 6-цилиндровых Скайлайнов всех поколений. 5-ступенчатая автоматическая трансмиссия была исключена из этого поколения, взамен предлагалась 4-ступенчатая АКПП и Полный привод. Всего выпущено 67211 автомобилей (включая модели GT-R)[4].\r\n\r\n', '2', '2018-11-20 15:46:27', 54, 'r34.jpg'),
(6, 'Nissan Skyline r32', 'Восьмое поколение Skyline, с индексом R32, появилось в мае 1989 г. Всего было выпущено 313 491 автомобилей[2]. По сравнению с предыдущим поколением, было сокращено число возможных типов кузова — остались только 4-дверный седан и 2-дверное купе.\r\n\r\n', '3', '2018-11-20 15:47:21', 16, 'r32.jpg'),
(7, 'Toyota supra', 'Toyota Supra (яп. トヨタ・スープラ) — серийный спортивный автомобиль, выпускавшийся компанией Toyota с 1978 по 2002 годы. Дизайн Supra был перенят от Toyota Celica, но кузов стал длиннее и шире[5]. Начиная с середины 1986 года, Supra отделилась от Celica, став самостоятельной моделью. В связи с этим Toyota перестала использовать префикс Celica, и автомобиль стал именоваться просто Supra[6]. Из-за сходства с названием Celica, их часто путают. Первое, второе и третье поколения Supra собирались на заводе в Тахаре, а четвёртое поколение — на заводе в городе Тоёта.\r\n\r\n', '6', '2018-11-20 15:51:00', 61, 'supra.jpg');

-- --------------------------------------------------------

--
-- Структура таблицы `articles_categories`
--

CREATE TABLE `articles_categories` (
  `id` int(11) NOT NULL,
  `title` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `articles_categories`
--

INSERT INTO `articles_categories` (`id`, `title`) VALUES
(1, 'Спорт'),
(3, 'Программирование'),
(6, 'Безопасность'),
(7, 'Хакерство'),
(8, 'Lifestyle');

-- --------------------------------------------------------

--
-- Структура таблицы `comments`
--

CREATE TABLE `comments` (
  `id` int(11) NOT NULL,
  `author` varchar(100) DEFAULT NULL,
  `nickname` varchar(100) NOT NULL,
  `email` varchar(255) NOT NULL,
  `text` text NOT NULL,
  `pubdate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `articles_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `comments`
--

INSERT INTO `comments` (`id`, `author`, `nickname`, `email`, `text`, `pubdate`, `articles_id`) VALUES
(1, 'Alex Storm', 'StOrM', 'alexstorm@gmail.com', 'суп классный наверное', '2018-09-25 11:40:51', 1),
(2, 'Какой то пиздюк', 'broooq', 'broooq@gmail.com', 'Классная статья бро', '2018-11-22 15:00:33', 7);

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `articles`
--
ALTER TABLE `articles`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `articles_categories`
--
ALTER TABLE `articles_categories`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `articles`
--
ALTER TABLE `articles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT для таблицы `articles_categories`
--
ALTER TABLE `articles_categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT для таблицы `comments`
--
ALTER TABLE `comments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
