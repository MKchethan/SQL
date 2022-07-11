-- Group BY and Aggregation

use test_tsv;

select * from wed;

UPDATE wed 
SET 
    email = REPLACE(email, 'jeevan@aa.com', 'jeevan@aaa.com')
	where no = 9;

Select SUBSTRING(email, CHARINDEX('@', email) + 1, LEN(email) - CHARINDEX('@', email)) as EmailDomain,
COUNT(email) as Total
from wed
Group By SUBSTRING(email, CHARINDEX('@', email) + 1, LEN(email) - CHARINDEX('@', email))


select * from netflix_copy;

select type, country, count(*)
from netflix_copy
group by type, country;

select * from employee;

alter table employee 
add country varchar(50);

update employee
set country = 'India'
where id = 1;

update employee
set country = 'USA'
where id = 2;

update employee
set country = 'German'
where id = 3;


update employee
set country = 'UK'
where id = 4;


update employee
set country = 'India'
where id = 5;

update employee
set country = 'USA'
where name = 'deadman';

update employee
set country = 'German'
where name = 'antman';

select * from employee;

Select country, SUM(Salary) as TotalSalary 
from employee
Group by country

Select country, count(*) as cnt, SUM(Salary) as TotalSalary 
from employee
Group by country


Select country,gender, SUM(Salary) as TotalSalary 
from employee
Group by country,gender
order by country, gender

Select country, Gender, SUM(Salary) as TotalSalary,
COUNT(*) as TotalEmployees
from employee
group by country, Gender

