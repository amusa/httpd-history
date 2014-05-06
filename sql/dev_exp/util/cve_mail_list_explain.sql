SELECT distinct(cve) FROM httpdhistory.cve_mail_list
WHERE cve not in 
(
SELECT cve from cve_1_3
union
SELECT cve from cve_2_0
union
SELECT cve from cve_2_2
union
SELECT cve from cve_2_4
);
