 -- Load the data from a file, don't forget the \n after the \r on Windows or it won't work.
Truncate table new_cve2vcc_2;

LOAD DATA LOCAL INFILE 'c:\\data\\httpd\\new_cve2vcc_2.csv'
INTO TABLE new_cve2vcc_2
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
ESCAPED BY '\\'
LINES TERMINATED BY '\n' (CVE, commitIntroduced, commitfixed, Filepath);
 
-- Select the uploaded records.
SELECT * FROM new_cve2vcc_2 limit 0,5000000000;

-- delete from new_cve2vcc_2 where cve='CVE';

