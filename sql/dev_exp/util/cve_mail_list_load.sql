 DROP TABLE IF EXISTS cve_mail_list;
 
-- Create the new upload target table.
CREATE TABLE cve_mail_list
(  
CVE varchar(15) not null,
Filename varchar(10) NOT NULL, 
LineNO INT(10) not null
);

-- Load the data from a file, don't forget the \n after the \r on Windows or it won't work.
LOAD DATA LOCAL INFILE 'c:\\data\\httpd\\cve_mail_list.csv'
INTO TABLE cve_mail_list
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
ESCAPED BY '\\'
LINES TERMINATED BY '\n';
 
-- Select the uploaded records.
SELECT * FROM cve_mail_list limit 0,5000000000;