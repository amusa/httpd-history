-- monthly distinct authors
SELECT timeline, NoOfDistAuthors,
                                 (SELECT count(*) from gitlog g1 where g1.authordate <= month_end
                                  and g1.authoremail in 
                                                        (
                                                        select g2.authoremail from gitlog g2
														where date_format(g2.authordate,'%m-%Y')=timeline
														)
                                 ) as montexp
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




