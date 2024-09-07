/*
Назва ДЗ: Робота з базою даних: SELECT, LIMIT, SUM, GROUP BY
Складність ДЗ: Легка.
Опис ДЗ: Статистика тижневого продажу товарів

(1) Створіть базу даних (БД) з назвою sales_database.
 Якщо маєте встановлений локально сервер БД, та на цьому сервері вже є БД,
 можете використати створену БД.
*/

CREATE DATABASE demo_db;

/*
(2) Створіть таблицю з назвою sales у базі даних, яка буде містити
 відповідні поля, з відповідними типами даних.  Зверніть увагу
 на застосування рядкових та чисельних типів при створенні таблиці.
*/

CREATE TABLE IF NOT EXISTS sales 
( id INTEGER NOT NULL AUTO_INCREMENT,
  week_day VARCHAR(256) NOT NULL,
  product VARCHAR(256) NOT NULL,
  price DECIMAL(8,2) NOT NULL,
  quantity INTEGER NOT NULL,
  PRIMARY KEY (id)
);

/*
(3)  3. Вставте дані в таблицю sales:
		Week day	Product		Price	Quantity
	1	Mon			Laptop		1000	5
	2	Mon			Phone		700		3
	3	Mon			Tablet		500		2
	4	Tue			Printer		300		4
	5	Tue			Phone		600		6
	6	Tue			Tablet		450		2
	7	Tue			Tablet		350		5
	8	Wed			Tablet		500		4
	9	Wed			Laptop		1300	4
	10	Wed			Printer		300		1
	11	Wed			Phone		550		8
	12	Thu			Phone		700		5
	13	Thu			Tablet		850		2
	14	Thu			Phone		700		3
	15	Fri			Laptop		1000	2
	16	Fri			Laptop		1500	1
	17	Fri			Tablet		500		2
	18	Fri			Phone		950		3
*/

INSERT INTO sales (week_day, product, price, quantity) 
VALUES ('Mon', 'Laptop', 1000.00, 5),
('Mon', 'Phone', 700.00, 3),
('Mon', 'Tablet', 500.00, 2),
('Tue', 'Printer', 300.00, 4),
('Tue', 'Phone', 600.00, 6),
('Tue', 'Tablet', 450.00, 2),
('Tue', 'Tablet', 350.00, 5),
('Wed', 'Tablet', 500.00, 4),
('Wed', 'Laptop', 1300.00, 4),
('Wed', 'Printer', 300.00, 1),
('Wed', 'Phone', 550.00, 8),
('Thu', 'Phone', 700.00, 5),
('Thu', 'Tablet', 850.00, 2),
('Thu', 'Phone', 700.00, 3),
('Fri', 'Laptop', 1000.00, 2),
('Fri', 'Laptop', 1500.00, 1),
('Fri', 'Tablet', 500.00, 2),
('Fri', 'Phone', 950.00, 3);

-- (4) Виберіть всі записи з таблиці sales та виведіть їх. --

SELECT * FROM sales;

-- (4) Вибірка з обмеженням (LIMIT). Виберіть перші два записи з таблиці sales та виведіть їх. --

SELECT * FROM sales LIMIT 2;

-- (6) Обчислення суми (SUM). Обчисліть загальну вартість всіх продуктів у таблиці sales та виведіть її. --

SELECT SUM(price*quantity) AS 'total_price' FROM sales;

/*
(7) Групування даних (GROUP BY). Згрупуйте дані у таблиці sales за назвою продукту (product),
 обчисліть загальну кількість продуктів кожного типу
 та середню ціну продукту певної назви (категорії).
*/


SELECT product, SUM(quantity) AS 'product_total_quantity',
-- SUM(price*quantity) AS 'product_total_pice', -- загальна вартість в категорії продукту --
ROUND(AVG(price), 2) AS 'product_apaverage_price'
FROM sales
GROUP BY product;

/*
(8) Переконайтеся: (a) Дані були вставлені правильно та виведені після вибірки; 
				   (b) Обчислення суми та групування даних відбулися коректно.

(9) SQL-запити збережіть в файлі з розширенням SQL,
 зробіть скріншоти результатів виконання SQL-запитів. 
 Файли результатів виконання завдання надайте в LMS одним із способів: 
 (a) Посилання на свій GitHub репозиторій; 
 (b) ZIP-архів файлів.
 */