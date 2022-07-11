-- views and joins 

create table department(
dept_id int not null,
dept_name varchar(30)
); 

insert into department values(1, 'IT')
insert into department values(2, 'payroll')
insert into department values(3, 'HR')
insert into department values(4, 'Admin')

select * from department;

update department
set dept_name = 'Payroll'
where dept_id = 2;

create table employee(
Id int not null,
Name varchar(30), 
Salary int,
Gender varchar(10),
DepartmentId int
);


insert into employee values(1, 'Tom', 60000, 'MAle', 3)
insert into employee values(2, 'Duck', 70000, 'Female', 2)
insert into employee values(3, 'Jerry', 80000, 'Male', 1)
insert into employee values(4, 'Ben',  50000, 'Male', 4)
insert into employee values(3, 'Pikachu',  30000, 'MAle', 1)
insert into employee values(4, 'DeadMan',  90000, 'Male', 3)


select * from employee;

select gender from employee
where gender = 'male'


select id, name, salary, gender, dept_name
from employee
join department 
on employee.DepartmentId = department.dept_id

-- views are used to stored the data 

create view vwEmployeeByDept
as
select id, name, salary, gender, dept_name
from employee
join department 
on employee.DepartmentId = department.dept_id

select * from vwEmployeeByDept;


-- Views can be used as mechanism to impleent row and column Security Purpose 

-- row security(views)
create view vwITEmployee
as
select id, name, salary, gender, dept_name
from employee
join department 
on employee.DepartmentId = department.dept_id
where dept_name = 'IT'

use test_tsv;

select * from vwITEmployee;


-- column security(views) if we want to hide some columns (salary)
create view vwNonConfidentialData
as
select id, name, gender, dept_name
from employee
join department 
on employee.DepartmentId = department.dept_id

select * from vwNonConfidentialData;


-- views can be used to present aggregate data not detailed data

create view vwSummarizedData
as
select dept_name, count(id) as cnt from employee
join 
department
on employee.id = department.dept_id
group by dept_name 

select * from vwSummarizedData;

-- Indexed Views

create table Product(
product_id int,
Name varchar(50),
UnitPrice int
);

insert into Product values(1, 'Book', 20)
insert into Product values(2, 'Pen', 14)
insert into Product values(3, 'Pencils', 11)
insert into Product values(4, 'clips', 10)

select * from product;

create table ProductSales(
Product_id int,
Qunatity_sold int
);

insert into ProductSales values(1, 10)
insert into ProductSales values(3, 23)
insert into ProductSales values(4, 21)
insert into ProductSales values(2, 12)
insert into ProductSales values(1, 13)
insert into ProductSales values(3, 12)
insert into ProductSales values(4, 13)
insert into ProductSales values(1, 11)
insert into ProductSales values(2, 12)
insert into ProductSales values(1, 14)


create view vwTotalSalesByProduct
with SchemaBinding
as
select Name, 
sum(isnull((Qunatity_sold * UnitPrice), 0)) as TotalSales,
COUNT_BIG(*) as TotalTransactions
from dbo.ProductSales
join dbo.Product
on dbo.product.product_id = dbo.ProductSales.Product_id
group by name

select * from vwTotalSalesByProduct

insert into ProductSales values(1, 5)


create unique clustered index uix_vwTotalSalesByProduct_name
on vwTotalSalesByProduct(Name)


-- table valued function (new function try on distinct)


--------------------------------------
 -- JOINS 
 -------------------------------------

 select * from department;
 select * from employee;
 select name, gender, salary, department_id;

 insert into department (dept_id) values (5);
 insert into department (dept_id, dept_name) values (6, 'Payroll');
 insert into employee (Id, Name, Salary, Gender) values (4, 'Antman', 60000, 'Male');


 select name, salary, gender, dept_name
 from employee
 left join department
 on employee.DepartmentId = department.dept_id;

 select name, salary, gender, dept_name
 from employee
 right join department
 on employee.DepartmentId = department.dept_id;

 select name, salary, gender, dept_name
 from employee
 full join department
 on employee.DepartmentId = department.dept_id;

 select name, salary, gender, dept_name
 from employee
 inner join department
 on employee.DepartmentId = department.dept_id;



use test_tsv;

select * from duplicates;

select distinct * from duplicates;

SELECT [first_name],[last_name],[day],price, COUNT(*)
FROM duplicates
GROUP BY [first_name], [last_name],[day], price
HAVING COUNT(*) > 1

With dupli AS
(
	Select *,ROW_NUMBER() Over(Partition by slno order by slno) as rowNumber
	from duplicates 
)

select * from dupli
where rowNumber >= 2

SELECT [first_name ], last_name,price, COUNT(*)
FROM duplicates
GROUP BY [first_name ], last_name, price 
HAVING COUNT(*) > 1

alter table duplicates
drop column slno;
