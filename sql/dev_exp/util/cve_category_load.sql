 DROP TABLE IF EXISTS CVE2Category;
 
-- Create the new upload target table.
CREATE TABLE CVE2Category
(  
CVE varchar(15) not null,
CatCode varchar(10) not null
);

-- Load the data from a file, don't forget the \n after the \r on Windows or it won't work.
LOAD DATA LOCAL INFILE 'c:\\data\\httpd\\CVE2Category.csv'
INTO TABLE CVE2Category
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
ESCAPED BY '\\'
LINES TERMINATED BY '\n';
 
-- Select the uploaded records.
SELECT * FROM CVE2Category limit 0,5000000000;