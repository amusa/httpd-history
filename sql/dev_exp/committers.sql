-- using gitlog
drop table commiters;
create table Commiters as SELECT distinct g1.authoremail, 
                             (
                                  SELECT MIN(authordate) FROM gitlog g2 
                                        WHERE g2.authoremail = g1.authoremail
                                        GROUP BY g2.authoremail
							 ) as AuthorStartDate
                            
FROM gitlog g1 ;



