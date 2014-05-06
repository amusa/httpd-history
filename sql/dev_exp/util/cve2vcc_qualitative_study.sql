

-- Load the data from a file, don't forget the \n after the \r on Windows or it won't work.
LOAD DATA LOCAL INFILE 'C:\\data\\httpd\\cve2vcc_qualitative_study.csv'
INTO TABLE cve2vcc_qualitative_study
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
ESCAPED BY '\\'
LINES TERMINATED BY '\n';
 
-- Select the uploaded records.
SELECT * FROM cve2vcc_qualitative_study limit 0,5000000000;


