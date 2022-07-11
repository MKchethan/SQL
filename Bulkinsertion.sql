use netflix;

DROP TABLE content;

CREATE TABLE content(
show_id VARCHAR(10) NOT NULL,
show_type VARCHAR(10),
title VARCHAR(200),
director VARCHAR(300),
showcast NTEXT,
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
FROM 'C:\Users\chethan mk\Downloads\netflix_titlesO.csv'
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



