-- using gitlog
UPDATE gitlog g INNER JOIN
                (
				SELECT g1.commit, g1.authoremail, g1.authordate, c.authorstartdate,
							(SELECT COUNT(releaseVer) FROM releasehistory WHERE releasedate >= c.authorstartdate
                                                               AND releasedate <= authordate
							) AS majorReleases
FROM gitlog g1 INNER JOIN commiters c ON c.authoremail = g1.authoremail) as t
ON g.commit = t.commit
SET g.majorReleases = t.majorReleases;