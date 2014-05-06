 -- Load the data from a file, don't forget the \n after the \r on Windows or it won't work.
LOAD DATA LOCAL INFILE 'c:\\data\\httpd\\new_cve2vcc.csv'
INTO TABLE new_cve2vcc
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
ESCAPED BY '\\'
LINES TERMINATED BY '\n';
 
-- Select the uploaded records.
SELECT * FROM new_cve2vcc limit 0,5000000000;

INSERT INTO cve2vcc SELECT cve, commitIntroduced, commitfixed FROM new_cve2vcc;