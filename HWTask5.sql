DROP DATABASE IF EXISTS hwtask5;
CREATE DATABASE hwtask5;
USE hwtask5;
DROP TABLE IF EXISTS cars;
CREATE TABLE cars
(
	id INT NOT NULL PRIMARY KEY,
    name VARCHAR(45),
    cost INT
);

INSERT cars
VALUES
	(1, "Audi", 52642),
    (2, "Mercedes", 57127 ),
    (3, "Skoda", 9000 ),
    (4, "Volvo", 29000),
	(5, "Bentley", 350000),
    (6, "Citroen ", 21000 ), 
    (7, "Hummer", 41400), 
    (8, "Volkswagen ", 21600);
    
SELECT *
FROM cars;

-- 1. Создайте представление, в которое попадут автомобили стоимостью до 25 000 долларов
CREATE VIEW limit_price AS
SELECT *
FROM cars
WHERE cost < 25000;

SELECT *
FROM limit_price;

-- Изменить в существующем представлении порог для стоимости: пусть цена будет до 30 000 долларов (используя оператор ALTER VIEW)

ALTER VIEW limit_price AS
SELECT *
FROM cars
WHERE cost < 30000;

SELECT *
FROM limit_price;

-- Создайте представление, в котором будут только автомобили марки “Шкода” и “Ауди” (аналогично)
CREATE VIEW vag_view AS
SELECT *
FROM cars
WHERE `name` IN ("Audi","Skoda");

SELECT *
FROM vag_view;

-- Доп задания:
-- 1* Получить ранжированный список автомобилей по цене в порядке возрастания-
SELECT ROW_NUMBER() OVER (ORDER BY cost) `№`,
`name`,
cost
FROM cars
ORDER BY cost ASC;

-- 2* Получить топ-3 самых дорогих автомобилей, а также их общую стоимость
SELECT ROW_NUMBER() OVER (ORDER BY cost) `№`,
`name`,
cost,
SUM(cost) over () `Суммарная стоимость ТОП-3`
FROM (SELECT `name`, cost
FROM cars
ORDER BY cost DESC
LIMIT 3) as t
ORDER BY cost Desc;


-- 3* Получить список автомобилей, у которых цена больше предыдущей цены
SELECT `name`,
cost, lag_price
FROM (
	SELECT `name`,
    cost,
	LAG(cost) OVER () AS lag_price
	FROM cars) AS cars_lag
WHERE cost > lag_price;

-- 4* Получить список автомобилей, у которых цена меньше следующей цены
SELECT `name`,
cost, lead_price
FROM (
	SELECT `name`,
    cost,
	LEAD(cost) over () as lead_price
	FROM cars) AS cars_lead
WHERE cost < lead_price;

-- 5*Получить список автомобилей, отсортированный по возрастанию цены, и добавить столбец со значением разницы между текущей ценой и ценой следующего автомобиля      
SELECT `name`,
cost,
cost - lead_price
FROM (
	SELECT `name`,
	cost,
	LEAD(cost) over (ORDER BY cost) as lead_price
	FROM cars) AS b ;
