-- Задание 1. 
DROP DATABASE IF EXISTS HWTASK2;
CREATE DATABASE HWTASK2;

USE HWTASK2;

DROP TABLE IF EXISTS sales;

CREATE TABLE sales
(
id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
order_date DATE NOT NULL,
count_product INT);

INSERT INTO sales(id, order_date, count_product)
VALUES
(1, '2022-01-01',156),
(2, '2022-01-02',180),
(3, '2022-01-03',21),
(4, '2022-01-04',124),
(5, '2022-01-05',341);

-- Задание 2.
SELECT
id 'id заказа',
IF(count_product < 100, 'Маленький заказ',
	IF(count_product >= 100 AND count_product <= 300, 'Средний заказ',
		IF(count_product > 300, 'Большой заказ', 'Ошибка'))) AS 'Тип заказа'
FROM sales;

-- Задание 3.
DROP TABLE IF EXISTS orders;
CREATE TABLE IF NOT EXISTS orders
(
id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
employee_id VARCHAR(10) UNIQUE NOT NULL,
amount DOUBLE NOT NULL,
order_status ENUM('OPEN', 'CLOSED', 'CANCELLED') NOT NULL);

INSERT INTO orders
VALUES
(1,'e03',15.00, 'OPEN'),
(2,'e01',25.50, 'OPEN'),
(3,'e05',100.70, 'CLOSED'),
(4,'e02',22.18, 'OPEN'),
(5,'e04',9.50, 'CANCELLED');

SELECT id, employee_id, amount,
	CASE
		WHEN order_status = 'OPEN' THEN 'Order is in open state'
        WHEN order_status = 'CLOSED' THEN 'Order is closed'
        WHEN order_status = 'CANCELLED' THEN 'Order is cancelled'
        ELSE 'Error'
	END AS 'full_order_status'
FROM orders;
