create database SupplyChain;

use SupplyChain;

select * into supplychain from SCMS_Delivery_History_Dataset;

select * 
from supplychain;

select count(column_name) as number from INFORMATION_SCHEMA.columns where table_name = 'supplychain';
select column_name as col from INFORMATION_SCHEMA.columns where TABLE_NAME = 'supplychain';

select distinct shipment_mode  
from supplychain;

select distinct Product_Group  
from supplychain;

select product_group, count(*) as cnt
from supplychain
group by Product_Group;


select shipment_mode, count(*) as cnt
from supplychain
group by shipment_mode;


select top 10 country, count(*) as cnt
from supplychain
group by country
order by cnt desc
;

select * from supplychain;

/*
select country, pack_price
from supplychain
group by country, Pack_Price
order by pack_price;
*/

ALTER TABLE supplychain
ALTER COLUMN pack_price float;

ALTER TABLE supplychain
ALTER COLUMN unit_price float;


SELECT country, SUM(pack_price) as totalPackPrice
FROM supplychain 
GROUP BY country
order by totalPackPrice desc;

SELECT top 15 country, SUM(pack_price) as totalPackPrice
FROM supplychain 
GROUP BY country
order by totalPackPrice desc;


SELECT country, sum(unit_price) as totalUnitPrice
FROM supplychain 
GROUP BY country
order by totalUnitPrice desc;


SELECT country, SUM(pack_price) as totalPackPrice, sum(unit_price) as totalUnitPrice
FROM supplychain 
GROUP BY country
order by totalPackPrice desc;

select * from supplychain;

select Sub_Classification, count(*) as cnt
from supplychain
group by Sub_Classification;

select vendor, Manufacturing_Site from supplychain where Manufacturing_Site like '%india%';


select distinct Manufacturing_Site, count(*) as cnt
from supplychain
group  by Manufacturing_Site
order by cnt desc;


with cte as
(
select shipment_mode, count(*) as cnt
from supplychain
group by Shipment_Mode
)

select shipment_mode, cnt,
	rank() over(partition by shipment_mode order by cnt) as rnk 
from cte;

select * from supplychain;

SELECT Shipment_Mode, SUM(pack_price) as totalPackPrice
FROM supplychain 
GROUP BY Shipment_Mode
order by totalPackPrice desc;


select distinct Fulfill_Via, count(*) as cnt
from supplychain
group by Fulfill_Via;


select distinct Brand, count(*) as cnt
from supplychain
group by Brand 
order by cnt desc;

select * from supplychain;


select Manufacturing_Site, sum(Pack_Price) as sumPrice
from supplychain
group by Manufacturing_Site
order by sumPrice desc;


select Manufacturing_Site, sum(Unit_Price) as sumPrice
from supplychain
group by Manufacturing_Site
order by sumPrice desc;

select max(unit_price) from supplychain;

select max(Pack_Price) from supplychain;

select item_description, Unit_Price, Unit_of_Measure_Per_Pack, Pack_Price
from supplychain
where Unit_Price = 238.65;

select item_description, Unit_Price, Unit_of_Measure_Per_Pack, Pack_Price
from supplychain
where Pack_Price = 1345.64;

select top 10 Item_Description,Unit_of_Measure_Per_Pack, 
max(Pack_PRICE) as [max] 
from supplychain 
group by Item_Description,Unit_of_Measure_Per_Pack 
order by [max] desc;

select top 10 Item_Description,Unit_of_Measure_Per_Pack, 
max(Unit_PRICE) as [max] 
from supplychain 
group by Item_Description,Unit_of_Measure_Per_Pack 
order by [max] desc;

select distinct Dosage_Form from supplychain;

select distinct Vendor_INCO_Term from supplychain;

select country,Sub_Classification, count(*)
from supplychain
group by country, Sub_Classification
order by country;

select country,Product_Group, count(*) as total
from supplychain
group by country, Product_Group
order by total desc,country;

select * from supplychain
where Scheduled_Delivery_Date <> Delivered_to_Client_Date;

select Country, Vendor_INCO_Term, Shipment_Mode, Scheduled_Delivery_Date, Delivered_to_Client_Date  from supplychain
where Scheduled_Delivery_Date <> Delivered_to_Client_Date;

select Country, Vendor_INCO_Term, Shipment_Mode, Scheduled_Delivery_Date, Delivered_to_Client_Date ,
 count(shipment_mode) over (partition by shipment_mode) as [mode]
from supplychain
where Scheduled_Delivery_Date <> Delivered_to_Client_Date
order by [mode];

With dupli AS
(
	Select *,ROW_NUMBER() Over(Partition by id order by id) as rowNumber
	from supplychain 
)
select * from dupli
where rowNumber >= 2

select * from supplychain;