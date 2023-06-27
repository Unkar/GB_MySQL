-- Задача №1
CREATE DATABASE Phones;
USE Phones;
CREATE TABLE phones
(id INT PRIMARY KEY NOT NULL,
ProductName VARCHAR(30) NOT NULL,
Manufacturer VARCHAR(30) NOT NULL,
ProductCount INT,
Price INT NOT NULL);

INSERT INTO phones(id, ProductName, Manufacturer, ProductCount, Price)
Values
(1,'Iphone X', 'Apple', 3,76000),
(2,'Iphone 8', 'Apple', 2,51000),
(3,'Galaxy S9', 'Samsung', 2, 56000),
(4,'Galaxy S8', 'Samsung', 1, 41000),
(5,'P20 Pro', 'Huawei', 5, 36000);

-- 

-- Задача №2.
SELECT ProductName, Manufacturer,Price FROM phones
WHERE ProductCount>2;

-- Задача №3.
SELECT ProductName, Manufacturer,Price FROM phones
WHERE Manufacturer = 'Samsung';

-- Задача №4.1.
SELECT ProductName, Manufacturer,Price FROM phones
WHERE (ProductName LIKE '%Iphone%') OR (Manufacturer LIKE '%Iphone%');

-- Задача №4.2.
SELECT ProductName, Manufacturer,Price FROM phones
WHERE (ProductName LIKE '%Samsung%') OR (Manufacturer LIKE '%Samsung%');

-- Задача №4.3.
SELECT ProductName, Manufacturer,Price FROM phones
WHERE (ProductName LIKE '%8%') OR (Manufacturer LIKE '%8%');
