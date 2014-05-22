select g.authoremail, count(*) as ncommits, TIMESTAMPDIFF(YEAR, min(g.authordate), max(g.authordate)) as timePeriod  from gitlog g
group by g.authoremail
order by ncommits desc
limit 10;