-- Load the data from a file, don't forget the \n after the \r on Windows or it won't work.

truncate table components;

LOAD DATA LOCAL INFILE 'C:\\data\\httpd\\httpd-component-paths.txt'
INTO TABLE components 
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
ESCAPED BY '\\'
LINES TERMINATED BY '\n' (componentPath);
 
-- Select the uploaded records.
SELECT * FROM components;
