create database olympics;

use olympics;

select * from athlete_events;

select * into olympics from athlete_events;

select * from olympics;

select top 10 [Name], count(*) as cnt
from olympics
group by [Name]
order by cnt desc
;
/*
1. Robert Tait Maknenzie has participated in more oympics games with 58 count
*/


select distinct [Sex], count(*)as [count]
from olympics
group by [Sex];

-- Male participated twice the ratio of female


with cte as (
select distinct [Sex], count(*)as [cnt]
from olympics
group by [Sex]
)

select cnt from cte;


select distinct age from olympics;


select age, count(*) as cnt
from olympics
group by age
order by cnt desc;

/* 
19 to 30 is the prime time for players played more of games b/w these age groups
*/

select top 20 [Team], count(*) as cnt
from olympics
group by [Team]
order by cnt desc
;

-- USA, FRnace, Great Britain are among three top countries which took part in games

select distinct Team, NOC
from olympics;

select distinct [event],count(*) as cnt
from olympics
group by [event]
order by cnt desc;

-- Football has more count

select team, count(*) as cnt, medal
from olympics
where medal <> 'NA'
group by team, medal
order by cnt desc
;
-- USA has won more medals 

select [name], team, count(*) as cnt, medal
from olympics
where medal <> 'NA'
group by [name], team, medal
order by cnt desc
;
-- Michael Fred has won more number of medals

select [name], age, team, count(*) as cnt, medal
from olympics
where medal <> 'NA'
group by [name],age, team, medal
order by cnt desc
;

select * from olympics where [name] = 'Michael Fred Phelps, II';


SELECT [year], Sex,
	round((cast(COUNT(Sex)*100 as float))/(sum(count(sex)) over (partition by [year])),2) AS [%]
FROM olympics
GROUP BY [year], Sex;


select [name], team, [event], count(*) as cnt, medal
from olympics
where medal <> 'NA'
group by [name], team, [event], medal
order by cnt desc
;


select team, [event], count(*) as cnt, medal
from olympics
where medal <> 'NA'
group by team, [event], medal
order by cnt desc
;
-- Basket ball team has wom more medals for US

select * from olympics where age < 15 and age <> 'NA';

select sex, count(*) as cnt
from olympics
where age < 15 and age <> 'NA'
group by sex;
-- Below 15 yrs female took great part in olympics, they are 5 times greater than male 

select sex, count(*) as cnt, [year]
from olympics
where age < 15 and age <> 'NA'
group by sex, [year];


select sex, count(*) as cnt
from olympics
where age < 20 and age <> 'NA'
group by sex;
-- 17.8k Female, 14.4K male

select sex, count(*) as cnt
from olympics
where age < 30 and age <> 'NA'
group by sex;

-- 63.7 k Female & 1.4M Male

select sex, count(*) as cnt
from olympics
where age > 20 and age < 30 and age <> 'NA'
group by sex;

--b/w 20 and 30 of age 41k are Female, 1.2M are Male 

select sex, count(*) as cnt
from olympics
where age >= 30 and age <> 'NA'
group by sex;

-- Lesser in number when compared to age b/w 20 and 30

select team, sport, medal,
count(*) as cnt 
from olympics
where medal <> 'NA'
group by team, sport, medal
order by cnt desc;
-- US US US

select sex, medal, count(*) as cnt
from olympics
where medal <> 'NA'
group by sex, medal
order by cnt desc;
-- lesser number in participation lesser won medals 

select sex, medal, count(*) as cnt
from olympics
where medal <> 'NA' and age < 20 and age <> 'NA'
group by sex, medal
order by cnt desc;
-- Female have participated more in number, so more medals won 


select [year], count(*) as cnt 
from olympics
group by [year]
order by cnt desc;

select [year], count(*) as cnt 
from olympics
where year = '2016'
group by [year]
order by cnt desc;


select [year], count(*) as cnt 
from olympics
where sex = 'F'
group by [year]
order by year;
-- From 1194 Female taking part in olympics has been increased

select sex,
	case when year > '1896' and year < '1916' then '1st 2 decade olympics'
	when year > '1916' and year < '1936' then '2nd 2 decade olympics'
	when year > '1936' and year < '1956' then '3rd 2 decades olymics'
	when year > '1956' and year < '1976' then '4th 2 decade olympics'
	when year > '1976' and year < '1996' then '5nd 2 decade olympics'
	when year > '1996' and year < '2016' then '6nd 2 decade olympics'
	else 'diff'
	end bucket,
	count(*) as cnt
	from olympics
	group by sex, case when year > '1896' and year < '1916' then '1st 2 decade olympics'
	when year > '1916' and year < '1936' then '2nd 2 decade olympics'
	when year > '1936' and year < '1956' then '3rd 2 decades olymics'
	when year > '1956' and year < '1976' then '4th 2 decade olympics'
	when year > '1976' and year < '1996' then '5nd 2 decade olympics'
	when year > '1996' and year < '2016' then '6nd 2 decade olympics'
	else 'diff'
end
order by bucket;

select sex, count(*) as cnt, [year]
from olympics 
group by sex, [year]
order by cnt desc;
-- In 1896, 380 male took part, In 1932, 369 Female took part has year is increasing Female taking part is slightly increased


select min(year) as min from olympics;

select distinct [year] from olympics
order by [year];

select sex, year, count(*) as cnt
from olympics
where year = '1896'
group by sex, year;
-- No Female participant when olympics started

select [year],sex, count(*) as cnt
from olympics
where year = '1900'
group by [year], sex;
-- In Next Olympics 33 Female took Part


With dupli AS
(
	Select *,ROW_NUMBER() Over(Partition by [event], age,[name], medal order by id) as rowNumber
	from olympics 
)
select * from dupli
where rowNumber >= 2

-- 1803 duplicate records without medal in window
-- 1701 duplicate records with medal in window

select distinct season from olympics;


select height, weight, count(*) as cnt, medal
from olympics
where height <> 'NA' and medal <> 'NA' and weight <> 'NA'
group by height, weight, medal
order by cnt desc;

select min(height) from olympics;
select max(height) from olympics;

select min(weight) from olympics;
select max(weight) from olympics where weight <>'NA';

select height
from olympics
order by height desc;

select height
from olympics
where height <> 'NA'
order by height desc
;




select
  case when height < '150' then '<150'
	   when height >= '150' and height < '160' then '150-160'
	   when height >= '160' and height < '170' then '160-170'
	   when height >= '170' and height < '180' then '170-180'
	   when height >= '180' and height < '190' then '180-190'
	   when height >= '190' and height < '200' then '190-200'
	   when height >= '200' and height < '210' then '200-210'
	   when height >= '210' and height < '220' then '210-220'
	   when height >= '220' and height < '230' then '220-230'
	   else'Not known'
end as bucket1,
case
	when weight <= '50' then '<50'
	when weight >= '60' and weight < '80' then '60-80'
	when weight >= '80' and weight < '100' then '80-100'
	when weight >= '100' and weight < '120' then '100-120'
	when weight >= '120' then '>120'
	when weight = 'NA' then 'Not Known'
	else 'Not Known'
end as bucket2,
count(*) as cnt, medal
from olympics
where medal <> 'NA'and height <> 'NA' and weight <> 'NA'
group by medal, 
	case when height < '150' then '<150'
	   when height >= '150' and height < '160' then '150-160'
	   when height >= '160' and height < '170' then '160-170'
	   when height >= '170' and height < '180' then '170-180'
	   when height >= '180' and height < '190' then '180-190'
	   when height >= '190' and height < '200' then '190-200'
	   when height >= '200' and height < '210' then '200-210'
	   when height >= '210' and height < '220' then '210-220'
	   when height >= '220' and height < '230' then '220-230'
	   else'Not known'
	   end,
	   case
		when weight <= '50' then '<50'
		when weight >= '60' and weight < '80' then '60-80'
		when weight >= '80' and weight < '100' then '80-100'
		when weight >= '100' and weight < '120' then '100-120'
		when weight >= '120' then '>120'
		when weight ='NA' then 'Not Known'
		else 'Not Known'
end
order by cnt desc;

-- height b/w 170 - 180 and weight b/w 60-80 have won more medals for their team and can say good physique 


select sex,
	case when year >= '1896' and year < '1916' then '1st 2 decade olympics'
	when year >= '1916' and year < '1936' then '2nd 2 decade olympics'
	when year >= '1936' and year < '1956' then '3rd 2 decades olymics'
	when year >= '1956' and year < '1976' then '4th 2 decade olympics'
	when year >= '1976' and year < '1996' then '5nd 2 decade olympics'
	when year >= '1996' and year < '2016' then '6nd 2 decade olympics'
	else 'diff'
	end bucket,
	count(*) as cnt,
	round(cast(COUNT(Sex)*100 as float)/(sum(count(sex)) over (partition by case when year >= '1896' and year < '1916' then '1st 2 decade olympics'
	when year >= '1916' and year < '1936' then '2nd 2 decade olympics'
	when year >= '1936' and year < '1956' then '3rd 2 decades olymics'
	when year >= '1956' and year < '1976' then '4th 2 decade olympics'
	when year >= '1976' and year < '1996' then '5nd 2 decade olympics'
	when year >= '1996' and year < '2016' then '6nd 2 decade olympics'
	else 'diff'
	end)), 2) AS [%]
	from olympics
	group by sex, case when year >= '1896' and year < '1916' then '1st 2 decade olympics'
	when year >= '1916' and year < '1936' then '2nd 2 decade olympics'
	when year >= '1936' and year < '1956' then '3rd 2 decades olymics'
	when year >= '1956' and year < '1976' then '4th 2 decade olympics'
	when year >= '1976' and year < '1996' then '5nd 2 decade olympics'
	when year >= '1996' and year < '2016' then '6nd 2 decade olympics'
	else 'diff'
end
order by bucket;


select sex,
	case when year >= '1896' and year < '1916' then '1st 2 decade olympics'
	when year >= '1916' and year < '1936' then '2nd 2 decade olympics'
	when year >= '1936' and year < '1956' then '3rd 2 decades olymics'
	when year >= '1956' and year < '1976' then '4th 2 decade olympics'
	when year >= '1976' and year < '1996' then '5nd 2 decade olympics'
	when year >= '1996' and year < '2016' then '6nd 2 decade olympics'
	else 'diff'
	end bucket,
	count(*) as cnt,
	round(cast(COUNT(Sex)*100 as float)/(sum(count(sex)) over ()), 2 )AS [%]
	from olympics
	group by sex, case when year >= '1896' and year < '1916' then '1st 2 decade olympics'
	when year >= '1916' and year < '1936' then '2nd 2 decade olympics'
	when year >= '1936' and year < '1956' then '3rd 2 decades olymics'
	when year >= '1956' and year < '1976' then '4th 2 decade olympics'
	when year >= '1976' and year < '1996' then '5nd 2 decade olympics'
	when year >= '1996' and year < '2016' then '6nd 2 decade olympics'
	else 'diff'
end
order by bucket;


SELECT DISTINCT [year],[sex],
CAST(round((count(*) OVER (PARTITION BY [year],[sex])*100.0)/COUNT(*) OVER (PARTITION BY [year]),2) AS NUMERIC(36,2)) AS sex_ratio
FROM olympics
ORDER BY [year]


select height from olympics where height = 'NA';

select season, count(*) as cnt
from olympics
group by season
order by cnt desc;
-- In summer more events 

select medal,year, count(*) as cnt
from olympics
where year = 1896
group by medal,year
;


select medal,year, event, count(*) as cnt
from olympics
where year = 1896 and medal <> 'NA'
group by medal,year, event
order by cnt desc
;

with dupli as (
select medal,year,name, event,
count(medal) over (partition by medal, event) as part,
row_Number() over (partition by event order by year) as dupli_
from olympics
where year = 1896 and medal <> 'NA')

select * from dupli
;

-- May be Medals are shared b/w the players so no of gold silver and bronze are not equal

select min(year) from olympics;

select * from olympics where year = 1900;


-- How Team involved in the olympics over the years
select team, [year], count(*) as cnt
from olympics 
group by team,[year]
order by [year], cnt;
-- Greece took highest Part in the 1st edition, took lowest in 2nd
-- France took great part in the 2nd edition, took lowest in 3rd
-- In the year 1992, US took in 936 events, which is highest by any team in any year
-- No team crossed 4 digit number count 


with cte as (
select team, [year], count(*)as [cnt]
from olympics
group by team, [year]
)
select cnt from cte;


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

SELECT Sex, 
	(sum(count(sex)) over())  
FROM olympics
GROUP BY Sex;


select age, count(*) as cnt 
from olympics
where age > 50 and age <>'NA'
group by age
order by age;

-- as age is increased the count have been decreased

select medal,  count(*) as cnt,
	row_number() over(partition by medal,[name] order by age)
from olympics
where age > 50 and age <>'NA';


with dupli as (
select medal,year,[name],age, event,
count(medal) over (partition by medal, [name]) as part,
row_Number() over (partition by name,medal order by age) as dupli_
from olympics
where age > 50 and age <>'NA' and medal <> 'NA')

select * from dupli
;

select name,sport, age,medal from olympics 
where name= 'Abdullah Al-Rashidi' ;
-- at the age 52 he has achieved his dream


select name, age,medal, sport, event from olympics 
where age >= '80' and age <> 'NA';

select *,
count(id) over() as numb
from olympics 
where age > 60 and age <> 'NA' and medal <> 'NA';
-- 30 participants won medal with age greater than 60


select *,
count(id) over() as numb
from olympics 
where age > 50 and age < 60 and age <> 'NA' and medal <> 'NA';
-- b/w 50 and 60 161 medals


select *,
count(id) over() as numb
from olympics 
where age > 50  and age <> 'NA' and medal <> 'NA' and sex = 'F';
-- only 14 female won after 50 years of age 

select *,
count(id) over() as numb
from olympics 
where age > 50  and age <> 'NA' and sex = 'F';
-- Quite good in numbers 192 Female have participated in olympics after 50 years of age 


with dupli as (
select medal,year,[name],age, event, sport ,
row_Number() over (partition by name,age, medal order by age) as dupli_
from olympics
where age > 50 and age <>'NA' and sex = 'F')

select * from dupli where dupli_= 1;
;

with dupli as (
select medal,year,[name],age, event, sport ,
row_Number() over (partition by name,age, medal order by age) as dupli_
from olympics
where age > 50 and age <>'NA' and sex = 'F' and medal <>'NA')

select * from dupli where dupli_= 1;
;

-- Out of 114, 12 female won medals after the age of 50


select max(y.cnt)
from(
	select team, [year], count(*) as cnt
	from olympics 
	group by team,[year])y;


select * ,
 lag(y.cnt) over(partition by medal order by cnt desc) as lag
from(
select team, medal, count(*) as cnt 
from olympics
where medal =  'Gold'
group by team, medal)y;



select * ,
 lag(y.cnt) over(partition by medal order by cnt) as lag,
 case when y.cnt < lag(cnt) over(partition by medal order by cnt) then 'lesser'
	  when y.cnt > lag(cnt) over(partition by medal order by cnt) then 'greater'
	  when y.cnt = lag(cnt) over(partition by medal order by cnt) then 'equal'
 end as rep
from(
select team, medal, count(*) as cnt 
from olympics o
where medal =  'Gold'
group by team, medal)y;


select * ,
 lead(y.cnt) over(partition by medal order by cnt) as lead,
 case when y.cnt < lead(cnt) over(partition by medal order by cnt) then 'lesser'
	  when y.cnt > lead(cnt) over(partition by medal order by cnt) then 'greater'
	  when y.cnt = lead(cnt) over(partition by medal order by cnt) then 'equal'
  end as rep
from(
select team, medal, count(*) as cnt 
from olympics o
where medal =  'Gold'
group by team, medal)y;


select * ,
 lead(y.cnt) over(partition by medal order by cnt desc) as lead_op,
 case when y.cnt < lead(cnt) over(partition by medal order by cnt desc) then 'lesser than next one'
	  when y.cnt > lead(cnt) over(partition by medal order by cnt desc) then 'greater than next one'
	  when y.cnt = lead(cnt) over(partition by medal order by cnt desc) then 'equal'
  end as rep
from(
select team, medal, count(*) as cnt 
from olympics 
where medal <>  'NA'
group by team, medal)y;


select * ,
 lag(y.cnt) over(partition by medal order by cnt desc) as lag_op,
 case when y.cnt < lag(cnt) over(partition by medal order by cnt desc) then 'lesser than previous'
	  when y.cnt > lag(cnt) over(partition by medal order by cnt desc) then 'greater than previous'
	  when y.cnt = lag(cnt) over(partition by medal order by cnt desc) then 'equal'
  end as rep
from(
select team, medal, count(*) as cnt 
from olympics o
where medal =  'Gold'
group by team, medal)y;



-------------------------------------------------------------------------
select team,[year], medal, cnt, result 
from(
select *,
	case when b.lag_op1 is null then 'No Previous Record' else b.lag_op1
	end as result 
from(
select *, 
	cast(a.lag_op as varchar(30)) as lag_op1
from(
select * ,
 lag(y.cnt) over(partition by team order by [year]) as lag_op
from(
select team, [year], medal, count(*) as cnt 
from olympics o
where medal =  'Gold'
group by team,[year], medal)
y)
a)
b)
c
;


alter procedure spLagfunction
@type1 varchar(50),
@type2 varchar(50)
as begin
select team,[year], medal, cnt, result 
from(
select *,
	case when b.lag_op1 is null then 'No Previous Record' else b.lag_op1
	end as result 
from(
select *, 
	cast(a.lag_op as varchar(30)) as lag_op1
from(
select * ,
 lag(y.cnt) over(partition by team order by [year]) as lag_op
from(
select team, [year], medal, count(*) as cnt 
from olympics o
where team = @type1 and medal =  @type2
group by team,[year], medal)
y)
a)
b)
c;
end 

exec spLagfunction [United States], gold;
exec spLagfunction [United States], silver;
exec spLagfunction [United States], bronze;

exec spLagfunction [India], gold;



alter procedure spLagSum
@type1 varchar(50),
@type2 varchar(50)
as begin
select team,[year], medal, lag_op
from(
select * ,
 sum(y.cnt) over(partition by team order by [year] ROWS BETWEEN
        UNBOUNDED PRECEDING and Current ROW) as lag_op
from(
select team, [year], medal, count(*) as cnt 
from olympics o
where team = @type1 and medal =  @type2
group by team,[year], medal)
y)
c;
end 

exec spLagSum india, gold;
exec spLagSum india, bronze;
exec spLagSum india, silver;
exec spLagSum india, NA;



alter procedure spSumPreceding
@type1 varchar(50),
@type2 varchar(50)
as begin
select team,[year], medal, cnt, result
from(
select *,
	case when a.lag_op is null then 0 else a.lag_op
	end as result 
from(
select * ,
 sum(y.cnt) over(partition by team order by [year] ROWS BETWEEN
        UNBOUNDED PRECEDING and 1 preceding) as lag_op
from(
select team, [year], medal, count(*) as cnt 
from olympics o
where team = @type1 and medal =  @type2
group by team,[year], medal)
y)
a)
b;
end 

exec spSumPreceding india, bronze;
exec spSumPreceding [United States], gold;



select * from olympics where team = 'India' and medal = 'gold' and [year] = 1936;

select distinct team from olympics where year = 1896;

select * from olympics;
use olympics;