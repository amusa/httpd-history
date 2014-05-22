select g.authoremail, count(*) as nvccs, TIMESTAMPDIFF(YEAR, min(g.authordate), max(g.authordate)) as timePeriod  from gitlog g
inner join vcc_intro v 
ON v.vcc = g.commit

group by g.authoremail
order by nvccs desc
limit 10;