 DROP TABLE IF EXISTS cve_2_4;
 
-- Create the new upload target table.
CREATE TABLE cve_2_4
(  
CVE varchar(15) not null, 
description LONGTEXT not null
);

-- Load the data from a file, don't forget the \n after the \r on Windows or it won't work.
LOAD DATA LOCAL INFILE 'C:\\data\\httpd\\cve_2.4.csv'
INTO TABLE cve_2_4
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
ESCAPED BY '\\'
LINES TERMINATED BY '\n';
 
-- Select the uploaded records.
SELECT * FROM cve_2_4 limit 0,5000000000;