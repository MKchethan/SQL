use window;

select * from marketing_campaign;

select * into market from marketing_campaign;

select * from market;

select education, marital_status, MntWines,
  max(MntWines) over(partition by education order by MntWines desc) as maxwines
from market;

select education, marital_status, MntWines,
  max(MntWines) over(partition by marital_status order by MntWines desc) as maxwines
from market;


create view vwMarket
as
select *,
	row_number() over(order by id) as rn
from market;

select * from vwMarket;



select * into market1 from vwMarket
where rn < 101;

select * from market1;

/*
create view vwMarket1
as
SELECT * FROM market
LIMIT 3;
*/

select Education, Marital_Status, MntWines,
  max(MntWines) over() as maxwines
from market1;

select Education, Marital_Status, MntWines,
  min(MntWines) over(partition by Marital_Status) as maxwines
from market1;

select Education, Marital_Status, MntWines,
  min(MntWines) over(partition by Education) as maxwines
from market1;

select Education, Marital_Status, MntWines,
  max(MntWines) over(partition by Marital_Status, Education) as maxwines
from market1;

select Education, Marital_Status, MntWines,
  min(MntWines) over(partition by Marital_Status, Education) as maxwines
from market1;

select Education, Marital_Status, MntWines,
 max(MntWines) over(partition by Education, Marital_Status order by MntWines desc) as maxwines,
 rank() over(partition by Education, Marital_Status order by MntWines desc) as rnk,
 dense_rank() over(partition by Education, Marital_Status order by MntWines desc) as drnk
from market1;


select * from newMarket;

select Education, Marital_Status, MntWines,
  min(MntWines) over(partition by Education) as maxwines
from newMarket;

select Education, Marital_Status, MntWines,
  max(MntWines) over(partition by Education) as maxwines
from newMarket;


select Education, Marital_Status, MntWines,
  max(MntWines) over(partition by Education, Marital_status) as maxwines
from newMarket;

select Education, Marital_Status, MntWines,
  min(MntWines) over(partition by Education, Marital_status) as maxwines
from newMarket;

