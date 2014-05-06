-- depends on commiters.sql

-- using gitlog
UPDATE gitlog g INNER JOIN
              (
			SELECT g1.commit, g1.authoremail, g1.authordate, c.authorstartdate,
					   TIMESTAMPDIFF(YEAR, c.authorstartdate, g1.authordate) as timePeriod
FROM gitlog g1 INNER JOIN commiters c ON c.authoremail = g1.authoremail) as t
ON g.commit = t.commit
SET g.timeperiod = t.timeperiod;