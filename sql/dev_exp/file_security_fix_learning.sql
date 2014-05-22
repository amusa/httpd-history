-- using gitlogfiles
SELECT commit, authoremail, g1.filepath, authordate, 
                (
                SELECT COUNT(*) FROM gitlogfiles g2 
                         WHERE g2.authoremail = g1.authoremail 
				         AND g2.filepath = g1.filepath 
                         AND g2.authordate <= g1.authordate
                         AND g2.commit <> g1.commit
                ) AS filecommits,
                
                (
                SELECT COUNT(*) FROM gitlogfiles g2
                   WHERE g2.authoremail = g1.authoremail
                   AND g2.component = g1.component
                   AND g2.authordate <= g1.authordate
                   AND g2.commit <> g1.commit) as directoryCommits,
                
				(
				SELECT COUNT(*) FROM gitlogfiles g3 
						WHERE g3.authoremail = g1.authoremail 
						AND g3.filepath = g1.filepath
					    AND g3.authordate <= g1.authordate
						AND TIMESTAMPDIFF(DAY, g3.authordate, g1.authordate) <= 30
						AND g3.commit <> g1.commit
			    ) AS _30_day,
			    (SELECT MIN(g3.authordate) FROM gitlogfiles g3 WHERE g3.authoremail = g1.authoremail 
						AND g3.authordate <= g1.authordate
						AND TIMESTAMPDIFF(DAY, g3.authordate, g1.authordate) <= 30
						AND g3.commit <> g1.commit
				) AS Last30Date,
				(
				SELECT COUNT(*) FROM gitlogfiles g3 
						WHERE g3.authoremail = g1.authoremail 
						AND g3.filepath = g1.filepath
					    AND g3.authordate <= g1.authordate
						AND TIMESTAMPDIFF(DAY, g3.authordate, g1.authordate) <= 60
						AND g3.commit <> g1.commit
			    ) AS _60_day,
			    (SELECT MIN(g3.authordate) FROM gitlogfiles g3 WHERE g3.authoremail = g1.authoremail 
						AND g3.authordate <= g1.authordate
						AND TIMESTAMPDIFF(DAY, g3.authordate, g1.authordate) <= 60
						AND g3.commit <> g1.commit
				) AS Last60Date,
				(
				SELECT COUNT(*) FROM gitlogfiles g3 
						WHERE g3.authoremail = g1.authoremail 
						AND g3.filepath = g1.filepath
					    AND g3.authordate <= g1.authordate
						AND TIMESTAMPDIFF(DAY, g3.authordate, g1.authordate) <= 90
						AND g3.commit <> g1.commit
			    ) AS _90_day,
			    (SELECT MIN(g3.authordate) FROM gitlogfiles g3 WHERE g3.authoremail = g1.authoremail 
						AND g3.authordate <= g1.authordate
						AND TIMESTAMPDIFF(DAY, g3.authordate, g1.authordate) <= 90
						AND g3.commit <> g1.commit
				) AS Last90Date,
				(
				SELECT CASE WHEN v.vcc is not null THEN 'Yes' ELSE 'No' END
				) as VCC
FROM gitlogfiles g1
left join vcc_intro v 
on v.vcc = g1.commit
and v.filepath = g1.filepath
LIMIT 9000000000
;


