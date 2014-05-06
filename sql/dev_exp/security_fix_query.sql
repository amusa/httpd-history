-- using gitlog

Update gitlog g1
inner join (
SELECT commit, authoremail, authordate,
									(
									 SELECT COUNT(commit) 
									      FROM gitlog g2 
									               WHERE g2.commit IN 
												  (SELECT commitfixed FROM cve2vcc)
									               AND g2.authoremail = g1.authoremail
									               AND g2.authordate <= g1.authordate
									               AND g2.commit <> g1.commit
                                                  ) AS securityFix
										FROM gitlog g1
) as t1 on
    g1.commit= t1.commit
    and g1.authoremail=t1.authoremail
	and g1.authordate=t1.authordate
set
    g1.securityfix  = t1.securityfix;