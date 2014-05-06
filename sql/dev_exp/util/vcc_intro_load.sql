DROP TABLE IF EXISTS vcc_intro;

create table vcc_intro (  
CVE varchar(15) not null, 
Filepath varchar(50) not null,
VCC varchar(50) not null,
Fix varchar(50) not null
);

LOAD DATA LOCAL INFILE 'C:\\data\\httpd\\vcc_intro.csv'
INTO TABLE vcc_intro 
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
ESCAPED BY '\\'
LINES TERMINATED BY '\n' (CVE, Filepath, VCC, Fix);
 
-- Select the uploaded records.
SELECT * FROM vcc_intro;

delete from vcc_intro where cve='CVE';
