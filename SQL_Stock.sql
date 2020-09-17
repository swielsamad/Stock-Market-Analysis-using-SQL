create schema assignment;
use assignment;

/* Create a new table named 'bajaj1' containing the date, close price, 20 Day MA and 50 Day MA.*/

CREATE TABLE bajaj1 AS
SELECT `Date`, `Close Price`, ROW_NUMBER() OVER () ronum,
AVG(`Close Price`) OVER ( ROWS BETWEEN 0 preceding AND 19 FOLLOWING) AS `20 Day MA` ,
AVG(`Close Price`) OVER ( ROWS BETWEEN 0 preceding AND 49 FOLLOWING) AS `50 Day MA`
FROM `bajaj auto`;

SET SQL_SAFE_UPDATES = 0;

UPDATE bajaj1 set `20 Day MA` = NULL
WHERE ronum > (SELECT COUNT(*) FROM `bajaj auto`) - 20 ;
UPDATE bajaj1 set `50 Day MA` = NULL
WHERE ronum > (SELECT COUNT(*) FROM `bajaj auto`) - 50 ;

ALTER TABLE bajaj1 DROP ronum ;

ALTER TABLE `assignment`.`bajaj1` 
CHANGE COLUMN `20 Day MA` `20 Day MA` DOUBLE(5,2) NULL Default '0' ,
CHANGE COLUMN `50 Day MA` `50 Day MA` DOUBLE(5,2) NULL Default '0' ;

SELECT * FROM bajaj1;

/*Create a new table named 'eicher1' containing the date, close price, 20 Day MA and 50 Day MA.*/

CREATE TABLE eicher1 AS
SELECT `Date`, `Close Price`, ROW_NUMBER() OVER () ronum,
AVG(`Close Price`) OVER ( ROWS BETWEEN 0 preceding AND 19 FOLLOWING) AS `20 Day MA` ,
AVG(`Close Price`) OVER ( ROWS BETWEEN 0 preceding AND 49 FOLLOWING) AS `50 Day MA`
FROM `eicher motors`;

UPDATE eicher1 set `20 Day MA` = NULL
WHERE ronum > (SELECT COUNT(*) FROM `eicher motors`) - 20 ;

UPDATE eicher1 set `50 Day MA` = NULL
WHERE ronum > (SELECT COUNT(*) FROM `eicher motors`) - 50 ;

ALTER TABLE eicher1 DROP ronum ;

ALTER TABLE `assignment`.`eicher1` 
CHANGE COLUMN `20 Day MA` `20 Day MA` DOUBLE(5,2) NULL Default '0' ,
CHANGE COLUMN `50 Day MA` `50 Day MA` DOUBLE(5,2) NULL Default '0' ;

SELECT * FROM eicher1;

/*Create a new table named 'hero1' containing the date, close price, 20 Day MA and 50 Day MA.*/

CREATE TABLE hero1 AS
SELECT `Date`, `Close Price`, ROW_NUMBER() OVER () ronum,
AVG(`Close Price`) OVER ( ROWS BETWEEN 0 preceding AND 19 FOLLOWING) AS `20 Day MA` ,
AVG(`Close Price`) OVER ( ROWS BETWEEN 0 preceding AND 49 FOLLOWING) AS `50 Day MA`
FROM `hero motocorp`;

UPDATE hero1 set `20 Day MA` = NULL
WHERE ronum > (SELECT COUNT(*) FROM `hero motocorp`) - 20 ;
UPDATE hero1 set `50 Day MA` = NULL
WHERE ronum > (SELECT COUNT(*) FROM `hero motocorp`) - 50 ;

ALTER TABLE hero1 DROP ronum ;

ALTER TABLE `assignment`.`hero1` 
CHANGE COLUMN `20 Day MA` `20 Day MA` DOUBLE(5,2) NULL Default '0' ,
CHANGE COLUMN `50 Day MA` `50 Day MA` DOUBLE(5,2) NULL Default '0' ;

SELECT * FROM hero1;

/*Create a new table named 'infosys1' containing the date, close price, 20 Day MA and 50 Day MA.*/

CREATE TABLE infosys1 AS
SELECT `Date`, `Close Price`, ROW_NUMBER() OVER () ronum,
AVG(`Close Price`) OVER ( ROWS BETWEEN 0 preceding AND 19 FOLLOWING) AS `20 Day MA` ,
AVG(`Close Price`) OVER ( ROWS BETWEEN 0 preceding AND 49 FOLLOWING) AS `50 Day MA`
FROM `infosys`;

UPDATE infosys1 set `20 Day MA` = NULL
WHERE ronum > (SELECT COUNT(*) FROM `infosys`) - 20 ;
UPDATE infosys1 set `50 Day MA` = NULL
WHERE ronum > (SELECT COUNT(*) FROM `infosys`) - 50 ;

ALTER TABLE infosys1 DROP ronum ;

ALTER TABLE `assignment`.`infosys1` 
CHANGE COLUMN `20 Day MA` `20 Day MA` DOUBLE(5,2) NULL Default '0' ,
CHANGE COLUMN `50 Day MA` `50 Day MA` DOUBLE(5,2) NULL Default '0' ;

SELECT * FROM infosys1;

/*Create a new table named 'tcs1' containing the date, close price, 20 Day MA and 50 Day MA.*/

CREATE TABLE tcs1 AS
SELECT `Date`, `Close Price`, ROW_NUMBER() OVER () ronum,
AVG(`Close Price`) OVER ( ROWS BETWEEN 0 preceding AND 19 FOLLOWING) AS `20 Day MA` ,
AVG(`Close Price`) OVER ( ROWS BETWEEN 0 preceding AND 49 FOLLOWING) AS `50 Day MA`
FROM `tcs`;

UPDATE tcs1 set `20 Day MA` = NULL
WHERE ronum > (SELECT COUNT(*) FROM `tcs`) - 20 ;
UPDATE tcs1 set `50 Day MA` = NULL
WHERE ronum > (SELECT COUNT(*) FROM `tcs`) - 50 ;

ALTER TABLE tcs1 DROP ronum ;

ALTER TABLE `assignment`.`tcs1` 
CHANGE COLUMN `20 Day MA` `20 Day MA` DOUBLE(5,2) NULL Default '0' ,
CHANGE COLUMN `50 Day MA` `50 Day MA` DOUBLE(5,2) NULL Default '0' ;

SELECT * FROM tcs1;

/*Create a new table named 'tvs1' containing the date, close price, 20 Day MA and 50 Day MA.*/

CREATE TABLE tvs1 AS
SELECT `Date`, `Close Price`, ROW_NUMBER() OVER () ronum,
AVG(`Close Price`) OVER ( ROWS BETWEEN 0 preceding AND 19 FOLLOWING) AS `20 Day MA` ,
AVG(`Close Price`) OVER ( ROWS BETWEEN 0 preceding AND 49 FOLLOWING) AS `50 Day MA`
FROM  `tvs motors`;

UPDATE tvs1 SET `20 Day MA` = NULL
WHERE ronum > (SELECT COUNT(*) FROM `tvs motors`) - 20 ;
UPDATE tvs1 SET `50 Day MA` = NULL
WHERE ronum > (SELECT COUNT(*) FROM `tvs motors`) - 50 ;

ALTER TABLE tvs1 DROP ronum ;

ALTER TABLE `assignment`.`tvs1` 
CHANGE COLUMN `20 Day MA` `20 Day MA` DOUBLE(5,2) NULL Default '0' ,
CHANGE COLUMN `50 Day MA` `50 Day MA` DOUBLE(5,2) NULL Default '0' ;

SELECT * FROM tvs1; 

/* Create a Master Table with all the stocks*/

CREATE TABLE master_table AS
SELECT b.`Date`, b.`Close Price` as Bajaj, t.`Close Price` AS TCS, tv.`Close Price` AS TVS, 
	   i.`Close Price` AS Infosys, e.`Close Price` AS Eicher, h.`Close Price` AS Hero
FROM bajaj1 b INNER JOIN tcs1 t ON b.`Date`= t.`Date`
			  INNER JOIN tvs1 tv ON b.`Date`= tv.`Date`
			  INNER JOIN infosys1 i ON b.`Date`= i.`Date`
			  INNER JOIN eicher1 e ON b.`Date`= e.`Date`
			  INNER JOIN hero1 h ON b.`Date`= h.`Date` ;
SELECT * FROM master_table;

/* Using tables created earlier in part-1 generate Signal for 'Buy', 'Sell' and 'Hold' and store them in tabele 2.
1. When the shorter-term moving average crosses above the longer-term moving average, it is a signal to BUY, 
   as it indicates that the trend is shifting up. This is known as a Golden Cross.
2. When the shorter term moving average crosses below the longer term moving average, it is a signal to SELL, 
   as it indicates the trend is shifting down. It is sometimes referred to as the Death Cross. */

CREATE TABLE bajaj2 AS
select `Date`, `Close Price`,
(case
     when(`20 Day MA` > `50 Day MA`) then 'Buy'
	 when(`20 Day MA` < `50 Day MA`) then 'Sell'
	 else 'Hold'
end) as `Signal`
from bajaj1 ;
select * from bajaj2;
/*------------------------------------------------------------------------------------------------------------*/
CREATE TABLE eicher2 AS
select `Date`, `Close Price`,
(case
	 when (`20 Day MA` > `50 Day MA`) then 'Buy'
	 when (`20 Day MA` < `50 Day MA`) then 'Sell'
	 else 'Hold'
end) as `Signal`
from eicher1 ;
select * from eicher2;
/*---------------------------------------------------------------------------------------------------------*/
CREATE TABLE hero2 AS
select `Date`, `Close Price`,
(case
	 when (`20 Day MA` > `50 Day MA`) then 'Buy'
	 when (`20 Day MA` < `50 Day MA`) then 'Sell'
	 else 'Hold'
end) as `Signal`
from hero1 ;
select * from hero2;
/*-------------------------------------------------------------------------------------------------------------*/
CREATE TABLE infosys2 AS
select `Date`, `Close Price`,
(case
	 when (`20 Day MA` > `50 Day MA`) then 'Buy'
	 when (`20 Day MA` < `50 Day MA`) then 'Sell'
	 else 'Hold'
end) as `Signal`
from infosys1 ;
select * from infosys2;
/*-------------------------------------------------------------------------------------------------------------*/
CREATE TABLE tcs2 AS
select `Date`, `Close Price`,
(case
	 when (`20 Day MA` > `50 Day MA`) then 'Buy'
	 when (`20 Day MA` < `50 Day MA`) then 'Sell'
	 else 'Hold'
end) as `Signal`
from tcs1 ;
select * from tcs2;
/*-------------------------------------------------------------------------------------------------------------*/
CREATE TABLE tvs2 AS
select `Date`, `Close Price`,
(case
	 when (`20 Day MA` > `50 Day MA`) then 'Buy'
	 when (`20 Day MA` < `50 Day MA`) then 'Sell'
	 else 'Hold'
end) as `Signal`
from tvs1 ;
select * from tvs2;
/*--------------------------------------------------------------------------------------------------------*/
/* Create a User Defined Function which acceptes date and returns the signal for that particular day
   (Buy/Sell/Hold) for the Bajaj stock.*/
   
delimiter $$
CREATE FUNCTION create_signal( dt char(20))
RETURNS char(20)
DETERMINISTIC
BEGIN
RETURN (SELECT `Signal` FROM bajaj2 WHERE `Date` = dt);
END $$
delimiter ;

SELECT create_signal('30-Mar-15') AS Signal_generated; 
/*---------------------------------------------------------------------------------------------------------------*/

