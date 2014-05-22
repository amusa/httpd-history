DROP TABLE IF EXISTS vcc_intro;


CREATE TABLE `vcc_intro` (
  `CVE` varchar(15) NOT NULL,
  `Filepath` varchar(50) NOT NULL,
  `VCC` varchar(50) NOT NULL,
  `Fix` varchar(50) NOT NULL,
  PRIMARY KEY (`CVE`,`VCC`,`Filepath`),
  KEY `fix_idx` (`Fix`),
  KEY `vcc_filepath_idx` (`VCC`,`Filepath`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



LOAD DATA LOCAL INFILE 'C:\\data\\httpd\\vcc_intro.csv'
INTO TABLE vcc_intro 
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
ESCAPED BY '\\'
LINES TERMINATED BY '\n' (CVE, Filepath, VCC, Fix);
 
-- Select the uploaded records.
SELECT * FROM vcc_intro;

delete from vcc_intro where cve='CVE';