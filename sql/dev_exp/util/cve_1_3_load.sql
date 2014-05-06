 DROP TABLE IF EXISTS cve_1_3;
 
-- Create the new upload target table.
CREATE TABLE cve_1_3
(  
CVE varchar(15) not null, 
description varchar(500) not null
);

-- Load the data from a file, don't forget the \n after the \r on Windows or it won't work.
LOAD DATA LOCAL INFILE 'C:\\data\\httpd\\cve_1.3.csv'
INTO TABLE cve_1_3
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
ESCAPED BY '\\'
LINES TERMINATED BY '\n';
 
-- Select the uploaded records.
SELECT * FROM cve_1_3 limit 0,5000000000;