SELECT d1.commit, d1.authoremail, d1.authordate, 
                             @sad:=(
                                  SELECT MIN(authordate) FROM dev_project_analysis d2 
                                        WHERE d2.authoremail = d1.authoremail
                                        GROUP BY d2.authoremail
                                   ) as startAuthorDate,
                            TIMESTAMPDIFF(YEAR, @sad, d1.authordate) as timePeriod
		      FROM dev_project_analysis d1;

