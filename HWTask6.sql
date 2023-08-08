DROP DATABASE IF EXISTS HWTASK6;
CREATE DATABASE HWTASK6;
USE HWTASK6;

-- Создайте функцию, которая принимает кол-во сек и формат их в кол-во дней часов.
-- Пример: 123456 ->'1 days 10 hours 17 minutes 36 seconds '
DELIMITER $$
CREATE FUNCTION sectodate(n INT)
RETURNS VARCHAR(50)
DETERMINISTIC
BEGIN
	DECLARE result VARCHAR(50) DEFAULT '';
    DECLARE reminder INT DEFAULT 0;
    DECLARE quotient INT DEFAULT 0;
    SET quotient = n;
    SET reminder = quotient mod 60;
    SET result = concat(reminder, ' seconds');
    SET quotient = quotient div 60;
	SET reminder = quotient mod 60;
    SET result = concat(reminder, ' minutes ', result);
    SET quotient = quotient div 60;
	SET reminder = quotient mod 24;
    SET result = concat(reminder, ' hours ', result);
    SET quotient = quotient div 24;    
	SET result = concat(quotient, ' days ', result);
    RETURN result;
END $$
DELIMITER ;

SELECT sectodate(123456);

-- Создайте процедуру, которая выводит только четные числа от 1 до 10. 
-- Пример: 2,4,6,8,10 
DELIMITER %%
CREATE FUNCTION even(n INT)
RETURNS VARCHAR(100)
DETERMINISTIC
BEGIN
	DECLARE i INT DEFAULT 2;
    DECLARE result VARCHAR(100) DEFAULT '';
	WHILE i <= n DO
		SET result = concat(result, ' ', i);
        SET i = i + 2;
	END WHILE;
    RETURN result;
END %%
DELIMITER ;

DROP PROCEDURE IF EXISTS even10;
DELIMITER \\
CREATE PROCEDURE even10()
BEGIN 
	SELECT even(10);
END \\
DELIMITER ;

CALL even10;
