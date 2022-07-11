create database netflix;

SET SQL_SAFE_UPDATES=0;

use netflix;

select * from netflix_titles;

select count(show_id)
from netflix_titles;

SELECT *
FROM netflix_titles
WHERE cast = "";

select * from netflix_titles;

alter table netflix_titles 
add column mainCast1 varchar(40);

alter table netflix_titles
add mainCast2 varchar(50);

update netflix_titles
set mainCast1 = SUBSTRING_INDEX(cast,',',1);

update netflix_titles
set mainCast2 = SUBSTRING_INDEX(SUBSTRING_INDEX(cast, ',', 2),',', -1);

alter table netflix_titles
add mainCast3 varchar(50);

update netflix_titles
set mainCast3 = Substring_index(substring_index(cast, ",", 3),",", -1);

select * from netflix_titles;

Select * ,
SUBSTRING_INDEX(cast,',',1) AS mainCast1,
SUBSTRING_INDEX(SUBSTRING_INDEX(cast, ',', 2),',', -1) AS maincast2,
SUBSTRING_INDEX(SUBSTRING_INDEX(cast, ',', 3),',', -1) AS maincast3
FROM netflix_titles;

SELECT DISTINCT rating
FROM netflix_titles;

-- shape
select column_name from information_schema.columns where table_name='netflix_titles';

SHOW COLUMNS FROM netflix_titles;

select * from netflix_titles;



select count(column_name)as Number from information_schema.columns where table_name='netflix_titles';

UPDATE netflix_titles
SET rating = REPLACE(rating, 'R', 'newR');

select * from netflix_titles
where rating = "newR";

update netflix_titles
set rating = Replace(rating, "newR", "R")
where show_id = "s82";

select distinct rating 
from netflix_titles;

select count(distinct rating) from netflix_titles;

select count(NULL) from netflix_titles;

SELECT rating, COUNT(*) FROM netflix_titles GROUP BY rating;

-- error user tab does not exist
Select TABLE_NAME, COLUMN_NAME from USER_TAB_COLUMNS where TABLE_NAME="netflix_titles";

SELECT count(*) FROM netflix_titles WHERE country = " ";

select count(case when country is null then 1 end) as Column1NullCount
from netflix_titles;
/*
select 
  sum(case when a is null then 1 else 0 end) A,
  sum(case when b is null then 1 else 0 end) B,
  sum(case when c is null then 1 else 0 end) C
from netflix_titles;
*/

select * from netflix_titles;

select *,
' ' as mainCast1, ' ' as mainCast2, ' ' as mainCast3 from netflix_titles;


SELECT count( * ) as coun FROM `netflix_titles` 
WHERE cast = '';

call new_procedure;


update netflix_titles
set country = "United States"
where country = "";

SELECT IF(country = "", 'United States', country)
FROM netflix_titles;

select * from netflix_titles;






insert into netflix_titles
(mainCast1)
values(
SUBSTRING_INDEX(cast,',',1));

select * ,SUBSTRING_INDEX(cast,',',1) from netflix_titles;

select * from netflix_titles;

alter table netflix_titles add maniCast1 int generated always as (Value1 = Value2);





SELECT IF(country IS NOT NULL, country, 'N/A') AS Result 
FROM netflix_titles;


DELIMITER $$
set a = for col in (select column_name from information_schema.columns where table_name='netflix_titles')
select a;
DELIMITER ;

DELIMITER $$
BEGIN 
	for col in (select column_name from information_schema.columns where table_name='netflix_titles')
     
END; 
DELIMITER ;


DELIMITER $$
BEGIN 
   for col in (select column_name from information_schema.columns where table_name='netflix_titles')
   loop
   SELECT count( * ) as col FROM `netflix_titles` WHERE col is "";
end loop;
END; 
DELIMITER ;

select * from netflix_titles
where show_id = "s882";


select * from netflix_titles;