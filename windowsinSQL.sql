-- Windows SQL
use test_tsv;

select * from employee;

select departmentid, max(salary) from employee
group by departmentid;

-- By using MAX as an window function, SQL will not reduce records but the result will be shown corresponding to each record.
select *,
max(salary) over(partition by departmentid) as max_salary
from employee;



select avg(salary) from employee;

SELECT [Name], [Gender], [Salary],
        AVG(Salary) OVER(ORDER BY Salary) AS Average
FROM Employee

SELECT Name, Gender, Salary,
        AVG(Salary) OVER(ORDER BY Salary ROWS BETWEEN
        UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) AS Average
FROM Employee

SELECT Name, Gender, Salary,
        AVG(Salary) OVER(ORDER BY Salary
        ROWS BETWEEN 1 PRECEDING AND 1 FOLLOWING) AS Average
FROM Employee

SELECT Name, Gender, Salary,
        AVG(Salary) OVER(ORDER BY Salary
        ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) AS Average,
		COUNT(Salary) OVER(ORDER BY Salary
        ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) AS [COUNT],
		SUM(Salary) OVER(ORDER BY Salary
        ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) AS [SUM]
FROM Employee

SELECT Name, Gender, Salary,
        AVG(Salary) OVER(partition by gender ORDER BY Salary
        ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) AS Average,
		COUNT(Salary) OVER(partition by gender ORDER BY Salary
        ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) AS [COUNT],
		SUM(Salary) OVER(partition by gender ORDER BY Salary
        ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) AS [SUM]
FROM Employee

select * ,
 row_number() over(partition by gender order by gender) as dupli
from employee;


select e.*,
	row_number() over(partition by departmentid order by country) as rn
from employee e;


select * from (
	select e.*,
	row_number() over(partition by departmentid order by id) as rn
	from employee e) x
where x.rn < 2;

select * ,
 rank() over(partition by departmentId order by salary desc) as rnk,
 dense_rank() over(partition by departmentId order by salary desc) as drnk
from employee;

insert into employee(id, [name], salary, gender, departmentid,country) values (3, 'jerry', 30000, 'male', 1, 'UK');

select * from employee;

select * ,
 lag(salary) over(partition by departmentId order by salary desc) as lag
from employee;


select e.*,
	lag(salary) over(partition by departmentId order by id) as prev_empl_sal,
	lead(salary) over(partition by departmentId order by id) as next_empl_sal
from employee e;


select e.*,
 lag(salary) over(partition by departmentid order by id) as pre_empl_sal,
 case when e.salary > lag(salary) over(partition by departmentid order by id) then 'higher than previous'
	  when e.salary < lag(salary) over(partition by departmentid order by id) then 'lesser than previous'
	  when e.salary = lag(salary) over(partition by departmentid order by id) then 'same as previous'
 end as sal_report
from employee e;

update employee
set departmentid = 4
where id = 4;

select * from employee;















select max(y.cnt)
from(
	select team, [year], count(*) as cnt
	from olympics 
	group by team,[year])y;

-- To get max in the count

with cte as (
select sex, count(*)as [cnt]
from olympics
group by sex
)

select cnt[0] from cte;


SELECT SUM(y.mycount)
FROM(SELECT sex, COUNT( * ) AS mycount
FROM olympics
group by sex)y;


SELECT Sex, COUNT(Sex)/(sum(count(sex)) over ()) AS [%]
FROM olympics
GROUP BY Sex;


SELECT Sex, 
	cast(COUNT(Sex)*100 as float)/(sum(count(sex)) over ()) AS [%]
FROM olympics
GROUP BY Sex;
-- 27.4% are Females and 72.5% are Males


select season, count(season) as cnt, medal
from olympics
where medal <> 'NA'
group by season,medal;


select medal, count(*) as cnt
from olympics
group by medal;
