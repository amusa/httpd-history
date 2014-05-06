SELECT d1.commit, d1.authoremail, d1.authordate, 
                                 @sad:=(
                                        SELECT MIN(authordate) FROM dev_project_analysis d2 
                                        WHERE d2.authoremail = d1.authoremail
                                        GROUP BY d2.authoremail
                                       ) as startAuthorDate,
							(SELECT COUNT(*) FROM releasehistory WHERE releasedate >= startAuthorDate
                                                                   AND releasedate <= authordate
                                                                           ) AS versionCommits,
versionCommits as VersionCommits2
                    FROM dev_project_analysis d1 where commit='27677a4383e0c5d63d83a276ab931380976ef925';


