CREATE DATABASE 8cost DEFAULT CHARSET utf8;

use 8cost;

GRANT SELECT, INSERT, UPDATE, DELETE
ON 8cost.*
TO smite@localhost IDENTIFIED BY 'smite107';

CREATE TABLE users (
      id             INT NOT NULL AUTO_INCREMENT,
      email          VARCHAR(70) NOT NULL,
      login          VARCHAR(45) NOT NULL,
      password       CHAR(40)    NOT NULL,
      verification   BOOLEAN     NOT NULL,
      salt           VARCHAR(8)  NOT NULL,
      register_date  TIMESTAMP   NOT NULL,
      PRIMARY KEY(id),
      UNIQUE KEY(email)
);

CREATE TABLE pages (
      id    INT NOT NULL AUTO_INCREMENT,
      name  VARCHAR(35),
      PRIMARY KEY(id)
);

CREATE TABLE css (
      id    INT NOT NULL AUTO_INCREMENT,
      name  VARCHAR(35),
      media BOOLEAN NOT NULL,
      PRIMARY KEY(id)
);

CREATE TABLE js (
      id    INT NOT NULL AUTO_INCREMENT,
      name  VARCHAR(35),
      PRIMARY KEY(id)
);

CREATE TABLE pages_css (
   id      INT NOT NULL AUTO_INCREMENT,
   page_id INT NOT NULL,
   css_id  INT NOT NULL,
   PRIMARY KEY(id),
   FOREIGN KEY(css_id)  REFERENCES css(id),
   FOREIGN KEY(page_id) REFERENCES pages(id)
);

CREATE TABLE pages_js (
   id      INT NOT NULL AUTO_INCREMENT,
   page_id INT NOT NULL,
   js_id  INT NOT NULL,
   PRIMARY KEY(id),
   FOREIGN KEY(js_id)   REFERENCES js(id),
   FOREIGN KEY(page_id)  REFERENCES pages(id)
);

CREATE TABLE IF NOT EXISTS `advice` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `text` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

INSERT INTO `advice` (`id`, `text`) VALUES
   (1, 'Мойте руки с мылом!'),
   (2, 'Пользуйтесь нашим сайтом - это хорошая возможность найти нужный товар по самой дешевой цене!'),
   (3, 'Слушайтесь родителей:)'),
   (4, 'Вы можете воспользоваться <a href="#">синтаксисом быстрого поиска</a>, это крайне удобная тема.');

CREATE TABLE IF NOT EXISTS `brands` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `prices` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(256) NOT NULL,
  `price` int(11) NOT NULL,
  `old price` int(11) NOT NULL,
  `currency` int(3) NOT NULL,
  `shop` int(11) NOT NULL,
  `place` int(11) NOT NULL,
  `brand` int(11) NOT NULL,
  `category` int(11) NOT NULL,
  `url` text NOT NULL,
  `likes` int(11) NOT NULL,
  `adds` int(11) NOT NULL,
  PRIMARY KEY (`id`)
);

INSERT INTO pages(name) VALUES
   ('about_us_about'),
   ('about_us_capabilities'),
   ('about_us_contacts'),
   ('about_us_job'),
   ('about_us_job_categ'),
   ('about_us_job_vacancy'),
   ('activation'),
   ('brand_list'),
   ('category_list'),
   ('class.CreateForm'),
   ('class.DataHandling'),
   ('class.Mail'),
   ('class.UserControl'),
   ('confidentiality'),
   ('connect'),
   ('constants'),
   ('container'),
   ('database'),
   ('error'),
   ('footer'),
   ('guardian'),
   ('head'),
   ('header'),
   ('header_find'),
   ('index'),
   ('login'),
   ('logout'),
   ('meta'),
   ('my_account'),
   ('my_add_ad'),
   ('my_prices'),
   ('my_shops'),
   ('my_shops_prices'),
   ('my_stat'),
   ('news'),
   ('partners_info'),
   ('partners_list'),
   ('register_bin'),
   ('registration'),
   ('search'),
   ('shop_list'),
   ('site_map'),
   ('support_comment'),
   ('support_faq'),
   ('support_quest'),
   ('top8_discounts'),
   ('top8_queries'),
   ('top8_recommended'),
   ('top8_shops'),
   ('top8_shops_fast');

INSERT INTO css(name, media) VALUES
   ('about_us', 1),
   ('aside', 1),
   ('brands', 1),
   ('categories', 1),
   ('confidentiality', 1),
   ('footer', 0),
   ('header', 0),
   ('header_find', 1),
   ('index.css', 1),
   ('index_media-queries.css', 0),
   ('lists', 1),
   ('multiselect', 1),
   ('my_account', 1),
   ('news', 1),
   ('news_media-queries', 1),
   ('partners', 1),
   ('prices', 1),
   ('search', 1),
   ('share_button', 1),
   ('shops', 1),
   ('site_map', 1),
   ('style', 0),
   ('support', 1),
   ('top8', 1),
   ('ui-slider', 1),
   ('welcome', 1);

INSERT INTO js(name) VALUES
   ('jquery.ui'),
   ('jquery.multiselect.min'),
   ('share_button'),
   ('dropdown_blocks'),
   ('jquery'),
   ('header'),
   ('jquery.powerful-placeholder.min'),
   ('jquery.logout');

INSERT INTO pages_css(page_id, css_id) VALUES
   (1, 1),
   (1, 8),
   (2, 1),
   (2, 8),
   (3, 1),
   (3, 8),
   (4, 1),
   (4, 2),
   (4, 8),
   (4, 12),
   (5, 1),
   (5, 2),
   (5, 8),
   (5, 12),
   (6, 1),
   (6, 2),
   (6, 8),
   (6, 12),
   (7, 26),
   (8, 11),
   (8, 2),
   (8, 3),
   (8, 8),
   (8, 25),
   (8, 19),
   (8, 12),
   (9, 11),
   (9, 2),
   (9, 4),
   (9, 8),
   (9, 25),
   (9, 19),
   (9, 12),
   (14, 5),
   (14, 2),
   (14, 8),
   (29, 13),
   (29, 2),
   (29, 17),
   (29, 8),
   (29, 25),
   (29, 19),
   (29, 12),
   (30, 13),
   (30, 17),
   (30, 8),
   (30, 25),
   (30, 19),
   (30, 12),
   (31, 13),
   (31, 2),
   (31, 17),
   (31, 8),
   (31, 25),
   (31, 19),
   (31, 12),
   (32, 13),
   (32, 2),
   (32, 17),
   (32, 8),
   (32, 25),
   (32, 20),
   (32, 19),
   (32, 12),
   (33, 13),
   (33, 17),
   (33, 2),
   (33, 8),
   (33, 25),
   (33, 19),
   (33, 12),
   (34, 13),
   (34, 8),
   (35, 14),
   (35, 8),
   (35, 15),
   (35, 19),
   (36, 16),
   (36, 8),
   (37, 16),
   (37, 8),
   (40, 18),
   (40, 2),
   (40, 17),
   (40, 25),
   (40, 19),
   (40, 12),
   (41, 11),
   (41, 2),
   (41, 20),
   (41, 8),
   (41, 25),
   (41, 19),
   (41, 12),
   (42, 21),
   (42, 8),
   (43, 23),
   (43, 8),
   (44, 23),
   (44, 2),
   (44, 8),
   (44, 12),
   (45, 23),
   (45, 8),
   (46, 24),
   (46, 2),
   (46, 17),
   (46, 8),
   (46, 25),
   (46, 19),
   (46, 12),
   (47, 24),
   (47, 2),
   (47, 17),
   (47, 8),
   (47, 25),
   (47, 19),
   (47, 12),
   (48, 24),
   (48, 2),
   (48, 17),
   (48, 8),
   (48, 25),
   (48, 19),
   (48, 12),
   (49, 24),
   (49, 2),
   (49, 20),
   (49, 8),
   (49, 25),
   (49, 19),
   (49, 12),
   (50, 24),
   (50, 2),
   (50, 20),
   (50, 8),
   (50, 25),
   (50, 19),
   (50, 12);

INSERT INTO pages_js(page_id, js_id) VALUES
   (4, 1),
   (4, 2),
   (5, 1),
   (5, 2),
   (6, 1),
   (6, 2),
   (8, 3),
   (8, 1),
   (8, 2),
   (8, 4),
   (9, 3),
   (9, 1),
   (9, 2),
   (9, 4),
   (22, 5),
   (22, 6),
   (22, 7),
   (22, 8),
   (29, 3),
   (29, 1),
   (29, 2),
   (29, 4),
   (30, 3),
   (30, 1),
   (30, 2),
   (30, 4),
   (31, 3),
   (31, 1),
   (31, 2),
   (31, 4),
   (32, 3),
   (32, 1),
   (32, 2),
   (32, 4),
   (33, 3),
   (33, 1),
   (33, 2),
   (33, 4),
   (35, 3),
   (35, 4),
   (40, 3),
   (40, 1),
   (40, 2),
   (40, 4),
   (41, 3),
   (41, 1),
   (41, 2),
   (41, 4),
   (44, 1),
   (44, 2),
   (44, 4),
   (46, 3),
   (46, 1),
   (46, 2),
   (46, 4),
   (47, 3),
   (47, 1),
   (47, 2),
   (47, 4),
   (48, 3),
   (48, 1),
   (48, 2),
   (48, 4),
   (49, 3),
   (49, 1),
   (49, 2),
   (49, 4),
   (50, 3),
   (50, 1),
   (50, 2),
   (50, 4);