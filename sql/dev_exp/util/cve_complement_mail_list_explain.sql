SELECT * FROM cve_mail_list WHERE cve IN
(
SELECT cve FROM 
(
SELECT cve from cve_1_3
union
SELECT cve from cve_2_0
union
SELECT cve from cve_2_2
union
SELECT cve from cve_2_4
) as t 
WHERE cve NOT IN (
                 SELECT  cve FROM cve2vcc WHERE commitintroduced <> 'N/A'
                 )

);

SELECT cve FROM 
(
SELECT cve from cve_1_3
union
SELECT cve from cve_2_0
union
SELECT cve from cve_2_2
union
SELECT cve from cve_2_4
) as t 
WHERE cve NOT IN (
                 SELECT  cve FROM cve2vcc WHERE commitintroduced <> 'N/A'
                 )

AND cve IN (

SELECT distinct(cve) FROM httpdhistory.cve_mail_list);