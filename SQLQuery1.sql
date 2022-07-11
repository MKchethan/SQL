use netflix;

DROP TABLE content;

CREATE TABLE content(
show_id VARCHAR(10) NOT NULL,
show_type VARCHAR(10),
title VARCHAR(200),
director VARCHAR(300),
showcast VARCHAR(1000),
country VARCHAR(200),
date_added VARCHAR(20),
release_year INT,
rating VARCHAR(20),
duration VARCHAR(30),
listed_in VARCHAR(200),
show_description VARCHAR(1000)
);


-- truncate the table first
TRUNCATE TABLE dbo.content;
GO

-- import the file
BULK INSERT dbo.content
FROM 'C:\Users\chethan mk\Downloads\netflix_titles.csv'
WITH
(
        FORMAT='CSV',
        FIRSTROW=2
)
GO

/*
update content 
set showcast = replace(showcast,',', '|');
*/

SELECT * FROM content;

select * into content_copy from content;

select * from content_copy;

drop table content_copy;

select * from content_copy
where show_id = 's1';

ALTER TABLE content_copy ALTER COLUMN showcast NVARCHAR(1000);

select * from content_copy;

alter table content_copy
add kids_tv varchar(50);

select distinct rating from content_copy;

select * from content_copy
where listed_in = 'Kids''''TV';

