-- Задание 1. 
DROP DATABASE IF EXISTS HWTASK2;
CREATE DATABASE HWTASK2;

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
