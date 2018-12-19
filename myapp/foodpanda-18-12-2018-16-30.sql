# ************************************************************
# Sequel Pro SQL dump
# Version 4541
#
# http://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Host: 192.168.99.100 (MySQL 5.7.24)
# Database: foodpanda
# Generation Time: 2018-12-18 14:30:42 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table cart_items
# ------------------------------------------------------------

DROP TABLE IF EXISTS `cart_items`;

CREATE TABLE `cart_items` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `session_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `product_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `session_id_2` (`session_id`,`product_id`),
  KEY `session_id` (`session_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table categories
# ------------------------------------------------------------

DROP TABLE IF EXISTS `categories`;

CREATE TABLE `categories` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;

INSERT INTO `categories` (`id`, `title`, `created_at`)
VALUES
	(1,'Итальянская','2018-12-15 19:35:21'),
	(2,'Белорусская','2018-12-15 19:35:21'),
	(3,'Американская','2018-12-15 19:35:21'),
	(4,'Азиатская','2018-12-15 19:35:21'),
	(5,'Шашлык, Гриль, Кебаб','2018-12-15 19:35:21'),
	(6,'Пивной Дом и Паб','2018-12-15 19:35:21'),
	(7,'Завтрак','2018-12-15 19:35:21'),
	(8,'Бургер и сендвич','2018-12-15 19:35:21'),
	(9,'Китайская','2018-12-15 19:35:21'),
	(10,'Восточная','2018-12-15 19:35:21'),
	(11,'Европейская','2018-12-15 19:35:21'),
	(12,'Французская','2018-12-15 19:35:21'),
	(13,'Грузинская','2018-12-15 19:35:21'),
	(14,'Греческая','2018-12-15 19:35:21'),
	(15,'Индийская','2018-12-15 19:35:21'),
	(16,'Японская','2018-12-15 19:35:21'),
	(17,'Обеды','2018-12-15 19:35:21'),
	(18,'Мексиканская','2018-12-15 19:35:21'),
	(19,'Паста','2018-12-15 19:35:21'),
	(20,'Пироги','2018-12-15 19:35:21'),
	(21,'Пицца','2018-12-15 19:35:21'),
	(22,'Шаурма','2018-12-15 19:35:21'),
	(23,'Стейки','2018-12-15 19:35:21'),
	(24,'Суши','2018-12-15 19:35:21'),
	(25,'Тайская','2018-12-15 19:35:21'),
	(26,'Хот-дог','2018-12-15 19:35:21'),
	(27,'Драники, Блины','2018-12-15 19:35:21'),
	(28,'Здоровая еда','2018-12-15 19:35:21'),
	(29,'Узбекская','2018-12-15 19:35:21'),
	(30,'Турецкая','2018-12-15 19:35:21'),
	(31,'Органическая еда','2018-12-15 19:35:21'),
	(32,'Специальное Предложение','2018-12-15 19:35:21'),
	(33,'Домашняя еда','2018-12-15 19:35:21'),
	(34,'ВОК','2018-12-15 19:35:21');

/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table order_items
# ------------------------------------------------------------

DROP TABLE IF EXISTS `order_items`;

CREATE TABLE `order_items` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `order_id` int(11) unsigned NOT NULL,
  `product_id` int(11) unsigned NOT NULL,
  `quantity` int(11) unsigned NOT NULL DEFAULT '1',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `order_items_order_id_foreign` (`order_id`),
  KEY `order_items_product_foreign` (`product_id`),
  CONSTRAINT `order_items_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `order_items_product_foreign` FOREIGN KEY (`product_id`) REFERENCES `restaurant_dishes` (`id`) ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table orders
# ------------------------------------------------------------

DROP TABLE IF EXISTS `orders`;

CREATE TABLE `orders` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `session_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_price` double(8,2) unsigned NOT NULL DEFAULT '0.00',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table restaurant_dishes
# ------------------------------------------------------------

DROP TABLE IF EXISTS `restaurant_dishes`;

CREATE TABLE `restaurant_dishes` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `restaurant_id` int(11) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` double(8,2) unsigned NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `is_active` tinyint(1) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `restaurant_dishes` WRITE;
/*!40000 ALTER TABLE `restaurant_dishes` DISABLE KEYS */;

INSERT INTO `restaurant_dishes` (`id`, `restaurant_id`, `name`, `description`, `price`, `image`, `is_active`)
VALUES
	(1,1,'Воппер','ВОППЕР® — это вкуснейшая приготовленная на огне 100% говядина с сочными помидорами, свежим нарезанным листовым салатом, густым майонезом, хрустящими маринованными огурчиками и рубленым белым луком на нежной булочке с кунжутной посыпкой.',4.50,'/images/menu/bk_vopper.png',1),
	(2,1,'Чикен Филе','Пробуй новинку — впервые большой кусок цельной куриной грудки в хрустящей панировке в изумительном сочетании со свежими овощами и майонезом.',5.00,'/images/menu/chiken_file.png',1),
	(3,1,'Стейкхайс','Стейкхаус – это сочетание нашей фирменной, приготовленной на огне 100% говядины с ломтиками бекона, а также специальным соусом «Барбекю», майонезом, листьями свежего салата, помидором и хрустящим луком на воздушной булочке, посыпанной кукурузной крошкой.',7.00,'/images/menu/stakehouse.png',1);

/*!40000 ALTER TABLE `restaurant_dishes` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table restaurant_feedbacks
# ------------------------------------------------------------

DROP TABLE IF EXISTS `restaurant_feedbacks`;

CREATE TABLE `restaurant_feedbacks` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `restaurant_id` int(11) unsigned NOT NULL,
  `first_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `rate` tinyint(2) unsigned NOT NULL,
  `comment` text COLLATE utf8mb4_unicode_ci,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `restaurant_feedbacks_restaurant_foreign` (`restaurant_id`),
  CONSTRAINT `restaurant_feedbacks_restaurant_foreign` FOREIGN KEY (`restaurant_id`) REFERENCES `restaurants` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table restaurants
# ------------------------------------------------------------

DROP TABLE IF EXISTS `restaurants`;

CREATE TABLE `restaurants` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `category_id` int(11) unsigned DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `schedule` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `average_rating` double(8,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`id`),
  KEY `restaurants_category_id_foreign` (`category_id`),
  CONSTRAINT `restaurants_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `restaurants` WRITE;
/*!40000 ALTER TABLE `restaurants` DISABLE KEYS */;

INSERT INTO `restaurants` (`id`, `category_id`, `name`, `is_active`, `image`, `schedule`, `average_rating`)
VALUES
	(1,8,'Burger King',1,'/images/rest1.jpeg','10:00-00:00',6.00),
	(2,21,'Пицца Лисицца',1,'/images/rest2.jpeg','5:00-3:00',0.00),
	(3,5,'Ёлки Палки',1,'/images/rest3.jpeg','11:00-2:00',1.00),
	(4,2,'Друзья',1,'/images/rest4.jpeg','9:00-23:00',0.00),
	(5,24,'Sushi House',1,'/images/rest5.jpeg','10:00-23:00',0.00);

/*!40000 ALTER TABLE `restaurants` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
