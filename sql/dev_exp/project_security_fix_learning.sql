-- using gitlog

select g1.commit, g1.authoremail, g1.authordate, c.authorstartdate, g1.timeperiod, g1.majorreleases, g1.securityfix,
                                        (
                                        select count(*) from gitlog g2 
                                                     where g2.authoremail = g1.authoremail 
												     and g2.authordate <= g1.authordate
													and g2.commit <> g1.commit
										) as ProjCommits,										
                                     
				(
				SELECT CASE WHEN v.vcc is not null THEN 'Yes' ELSE 'No' END
				) as VCC                                                                               
		FROM gitlog AS g1 INNER JOIN Commiters c ON c.authoremail = g1.authoremail
left join vcc_intro v 
on v.vcc = g1.commit
WHERE g1.authoremail = 'wrowe@apache.org'
LIMIT 900000000
		;





