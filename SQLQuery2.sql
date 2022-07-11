create database test_tsv;

use test_tsv;

select * from netflix_titles;

drop table netflix_titles;

select count(*) from netflix_titles;

select * from netflix_titles
where show_id = 's2276';

SELECT * INTO netflix_copy FROM netflix_titles;   

select * from netflix_copy;

select * from netflix_copy
where director = '';

UPDATE netflix_copy SET cast = 'N'''+cast
where cast <> '';
UPDATE netflix_copy SET cast = cast+''''
where cast <> '';

-- Alter Table netflix_copy Modify column cast NVARCHAR(1000);

ALTER TABLE netflix_copy ALTER COLUMN cast NVARCHAR(1000);

drop table netflix_copy;


CREATE PROCEDURE spGetCastName
as
begin 
	select cast from netflix_copy
end 

spGetCastname;

exec spGetCastName;

execute spGetCastName;

create procedure spGetType
@type nvarchar(100)
as 
begin
	select * from netflix_copy where type = @type
end

exec spGetType 'TV Show';
exec spGetType 'Movie';

create procedure spGetTypeCount
@type nvarchar(100)
as 
begin 
	select count(*) from netflix_copy
	where type = @type
end

exec spGetTypeCount 'TV Show';

exec spGetTypeCount 'Movie';


-- to get to know the code of the text
sp_helptext spGetTypeCOUnt;



-- For altering the existing procedure 

ALTER PROCEDURE spGetCastName  
as  
begin   
 select * from netflix_copy order by type
end   

exec spGetCastName;



select * from netflix_copy;


-- to encrypt the out stored procedure

alter procedure spGetTypeCount  
@type nvarchar(100)  
with Encryption
as   
begin   
 select count(*) from netflix_copy  
 where type = @type  
end

-- we cannot see the encrypt code

sp_helptext spGetTypeCOUnt;

exec spGetTypeCount 'Movie';

create procedure spGetCountDuration
@duration nvarchar(50),
@seasonCount int output
as 
begin
	select @seasonCount = count(*) from netflix_copy where duration = @duration
end 

declare @TotalCount int 
execute spGetCountDuration '1 Season', @TotalCOunt out
print @totalCount

declare @TotalCount int 
execute spGetCountDuration '2 Seasons', @TotalCOunt out
print @totalCount

select * from netflix_copy;


alter procedure spGetDistinct
@duration nvarchar(50)
--@seasonCount varchar(50) output
as 
begin
	select distinct @duration from netflix_copy 
end 

exec spGetDistinct type;

select distinct type from netflix_copy;

select * from netflix_copy where show_id='Flying Fortress';

update netflix_copy
set title = 'Flying Fortress', director = 'William Wyler', cast = 'William Wyler', country = 'United States', date_added = 'March 31, 2017',
release_year = '1944', rating = 'TV-PG', duration = '40 min', listed_in = 'Classic Movies', description = 'center on the crew of the B-17', 
type = 'TV Show'
where show_id='Flying Fortress';


select * from netflix_copy;

CREATE PROCEDURE spGetAdd()
 BEGIN
  DECLARE a INT Default 1 ;
  simple_loop: LOOP     
    insert into table1 values(a);
    SET a=a+1;
    IF a=11 THEN
      LEAVE simple_loop;
    END IF;
 END LOOP simple_loop;



 alter table netflix_copy
 if type = 'TV Show' then 1 else 0  end as tv
 if type = 'Movie' then 1 else 0  end as movie

 alter procedure spohe
 @type varchar(50)
 as 
 begin 
	select @type, count(show_id) as id from netflix_copy
 end

 exec spohe rating;

 declare a nvarchar(20);
 a=select distinct from netflix_copy;



alter procedure spGetexp
-- @distinct varchar(50)
as
begin
	loop: Loop
	col in select distinct type from netflix_copy
	print ' ' || col
	leave loop
end 


execute spGetexp 
