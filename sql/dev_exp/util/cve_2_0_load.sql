 DROP TABLE IF EXISTS cve_2_0;
 
-- Create the new upload target table.
CREATE TABLE cve_2_0
(  
CVE varchar(15) not null, 
description varchar(500) not null
);

-- Load the data from a file, don't forget the \n after the \r on Windows or it won't work.
LOAD DATA LOCAL INFILE 'C:\\data\\httpd\\cve_2.0.csv'
INTO TABLE cve_2_0
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
ESCAPED BY '\\'
LINES TERMINATED BY '\n';
 
-- Select the uploaded records.
SELECT * FROM cve_2_0 limit 0,5000000000;