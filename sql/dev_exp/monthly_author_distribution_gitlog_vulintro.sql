-- monthly distinct authors
SELECT timeline, NoOfDistAuthors 
FROM timeline t 
LEFT OUTER JOIN (SELECT date_format(authordate,'%m-%Y') AS MYMONTH, COUNT(DISTINCT authorEmail) as NoOfDistAuthors
FROM gitlog g
GROUP BY YEAR(authordate), MONTH(authordate)) j
ON t.timeline = j.mymonth;

-- cummulative monthly distinct authors
SELECT timeline,(
                  SELECT COUNT(DISTINCT authorEmail) FROM gitlog g
                  WHERE g.authordate <= t.month_end
                 ) as NoOfCummAuthors
FROM timeline t; 





SELECT date_format(authordate,'%m-%Y') AS MYMONTH, COUNT(DISTINCT authorEmail) as NoOfAuthors
FROM gitlog g
GROUP BY YEAR(authordate), MONTH(authordate);



