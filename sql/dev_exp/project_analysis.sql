-- using gitlog

select g1.commit, g1.authoremail, g1.authordate, c.authorstartdate, g1.timeperiod, g1.majorreleases, g1.securityfix,
                                        (
                                        select count(*) from gitlog g2 
                                                     where g2.authoremail = g1.authoremail 
												     and g2.authordate <= g1.authordate
													and g2.commit <> g1.commit
										) as ProjCommits,
                                        (
                                        select count(*) from gitlog g3 
                                                     where g3.authoremail = g1.authoremail 
												     and g3.authordate <= g1.authordate
													 and TIMESTAMPDIFF(DAY, g3.authordate, g1.authordate) <= 30
													and g3.commit <> g1.commit
										) as _30_day,
                                         (select min(g3.authordate) from gitlog g3 where g3.authoremail = g1.authoremail 
												     and g3.authordate <= g1.authordate
													and TIMESTAMPDIFF(DAY, g3.authordate, g1.authordate) <= 30
													and g3.commit <> g1.commit
                                        ) as Last30Date,
                                        (
                                        select count(*) from gitlog g3 
                                                     where g3.authoremail = g1.authoremail 
												     and g3.authordate <= g1.authordate
													 and TIMESTAMPDIFF(DAY, g3.authordate, g1.authordate) <= 60
													and g3.commit <> g1.commit
										) as _60_day,
                                         (select min(g3.authordate) from gitlog g3 where g3.authoremail = g1.authoremail 
												     and g3.authordate <= g1.authordate
													and TIMESTAMPDIFF(DAY, g3.authordate, g1.authordate) <= 60
													and g3.commit <> g1.commit
                                        ) as Last60Date,
                                        (
                                        select count(*) from gitlog g3 
                                                     where g3.authoremail = g1.authoremail 
												     and g3.authordate <= g1.authordate
													 and TIMESTAMPDIFF(DAY, g3.authordate, g1.authordate) <= 90
													and g3.commit <> g1.commit
										) as _90_day,
                                         (select min(g3.authordate) from gitlog g3 where g3.authoremail = g1.authoremail 
												     and g3.authordate <= g1.authordate
													and TIMESTAMPDIFF(DAY, g3.authordate, g1.authordate) <= 90
													and g3.commit <> g1.commit
                                        ) as Last90Date                                                                               
		FROM gitlog AS g1 INNER JOIN Commiters c ON c.authoremail = g1.authoremail
               WHERE commit IN (SELECT DISTINCT commitintroduced FROM cve2vcc WHERE commitintroduced <> 'N/A') LIMIT 9000000;





