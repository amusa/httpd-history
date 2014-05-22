drop table dev_mistakes;
create table dev_mistakes as

select g1.commit, g1.authoremail, g1.authordate, c1.cve, y1.catcode,
               (select count(*) from gitlog g2 inner join vcc_intro c2 ON c2.vcc = g2.commit
											   inner join cve2category y2 ON y2.cve = c2.cve
                             WHERE g2.authoremail = g1.authoremail 
							 and g2.authordate <= g1.authordate
							 and g2.commit <> g1.commit
                             and y2.catcode = y1.catcode 
                             
                            -- GROUP BY g2.commit, g2.authoremail, g2.authordate, y2.catcode                                               
               ) as cveCount
from gitlog g1 
INNER JOIN vcc_intro c1 ON c1.vcc = g1.commit
INNER JOIN cve2category y1 ON y1.cve = c1.cve
GROUP BY g1.commit, g1.authoremail, g1.authordate, y1.catcode
order by g1.authoremail, g1.authordate ;

