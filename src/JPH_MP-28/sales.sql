/*
У цьому завданні вам потрібно буде виконати запити до бази даних,
 використовуючи оператори SELECT, LIMIT, SUM та GROUP BY.
 1. Створення бази даних з назвою sales_database:
 */

CREATE DATABASE sales_database;

/*
 2. Створення таблиці з назвою sales у базі даних sales_database, яка буде містити наступні поля:
 - id (цілочисельний тип, автоінкрементний, первинний ключ),
 - product (рядковий тип, назва продукту),
 - price (числовий тип, ціна продукту),
 - quantity (цілочисельний тип, кількість продуктів).
 */
	
CREATE TABLE IF NOT EXISTS sales 
( id INTEGER NOT NULL AUTO_INCREMENT,
  product VARCHAR(256) NOT NULL,
  price DECIMAL(8,2) NOT NULL,
  quantity INTEGER NOT NULL,
  PRIMARY KEY (id),
);

/*
  3. Вставка даних в таблицю sales:
    1. product: "Laptop", price: 1000, quantity: 5
    2. product: "Phone", price: 700, quantity: 3
    3. product: "Tablet", price 500, quantity: 2
    4. product: "Printer", price: 300, quantity: 4
 */
	
INSERT INTO sales (product, price, quantity) 
VALUES ('Laptop', 1000.00, 5),
('Phone', 700.00, 3),
('Tablet', 500.00, 2),
('Printer', 300.00, 4);

--4. Вибірка всіх даних з таблиці sales та вивід їх: --

SELECT * FROM sales;

-- 5. Вибірка з обмеженням (LIMIT) - перші два записи з таблиці sales та виведення їх: --

SELECT * FROM sales LIMIT 2;

-- 6. Обчислення суми (SUM)- загальної вартості всіх продуктів у таблиці sales та виведення її: --

SELECT SUM(price) AS 'Total price' FROM sales;

/*
 7. Групування даних (GROUP BY):
  - Згрупуйте дані у таблиці sales за назвою продукту (product),
*/

SELECT * FROM sales ORDER BY product;

-- обчисліть загальну кількість продуктів кожного типу та середню ціну за одиницю продукту. --
SELECT product, COUNT(quantity) FROM sales GROUP BY product;  
SELECT ROUND(AVG(price), 2) AS 'Average price, EUR' FROM sales;

/*
8. Перевірка правильності виконання:
  - Переконайтеся, що дані були вставлені правильно та виведені після вибірки.
  - Переконайтеся, що обчислення суми та групування даних відбулися коректно.

9. Запити зберегти в файлі та зробити скріншоти результатів виконная запитів.
   Залийте файл та скріншоти в свій GitHub репозиторій, посилання на який зазначте в LMS
*/