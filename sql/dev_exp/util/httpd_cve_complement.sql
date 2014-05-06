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
                 );