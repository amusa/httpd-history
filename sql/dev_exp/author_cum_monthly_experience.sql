select  timeline, g1.authoremail, g1.authordate, c.authorstartdate, g1.timeperiod, 
TIMESTAMPDIFF(YEAR, c.authorstartdate, g1.authordate) as timePeriod2, month_end,
@mymonth:=date_format(authordate,'%m-%Y') AS MYMONTH,
(                                       select count(*) from gitlog g2 
                                                     where g2.authoremail = g1.authoremail 
												     and g2.authordate <= month_end
													
										)as AuthorMonthExp
from  gitlog g1 inner join timeline t on t.timeline = date_format(authordate, '%m-%Y')
INNER JOIN Commiters c ON c.authoremail = g1.authoremail
group by g1.authoremail, year(authordate), month(authordate)
limit 99999999;

