use test_tsv;

-- 1. ASCII
select ascii('ABC');
select ascii('A');

select ascii('BC');

select ascii('10');

-- 2. CHAR should ranges b/w 0 and 255

select char('10');

declare @start int
set @start = 65
while(@start<=90)
begin 
	print char(@start)
	set @start = @start + 1
end


declare @num int
set @num = 48
while(@num<=58)
begin 
	print char(@num)
	set @num = @num + 1
end


-- LTRIM remove spaces at the left side of the string

select '   hello';

select LTRIM('     hello');
-- select ltrim('first_name') as first_name from table_name;

-- RTRIM removes spaces on the right side of the string 

select 'hello    ';

select RTRIM('hello      ');

-- LOWER and UPPER 

select upper('abcdefg');
select lower('ABCDEFG');

-- REVERSE

select reverse('abcdefghijklmnopqrstuvwxyz') as reverse_;

select reverse(upper('abcdefghijklmnopqrstuvwxyz')) as reverse_;


-- len

select len('abcdefghijklmnopqrstuvwxyz') as len_;



-- Left returns the specified number of charatcers on the left side for the given input string

select left('ABCDEFGH',4);

-- Right returns the specified number of charatcers on the right side for the given input string

select right('ABCDEFGH',4);

-- Charindex return the starting position of the specified expression in the given characters

select charindex('@', 'chethy@gmail.com');

select charindex('@', 'chethy@gmail@.com', 3);   -- op 7

select charindex('@', 'chethy@gmail@.com', 8);  -- op 13


-- SUBSTRING returns substring part of the string for a given expression

select SUBSTRING('chethy@gmail.com', 7, 10);      --   7 - start pos     10 - num of chars we want


select SUBSTRING('chethy@gmail.com', charindex('@', 'chethy@gmail.com')+1, len('chethy@gmail.com') - charindex('@', 'chethy@gmail.com'));


/* 
Select SUBSTRING(Email, CHARINDEX('@', Email) + 1, LEN(Email) - CHARINDEX('@', Email)) as EmailDomain,
COUNT(Email) as Total
from tblEmployee
Group By SUBSTRING(Email, CHARINDEX('@', Email) + 1, LEN(Email) - CHARINDEX('@', Email))
*/

