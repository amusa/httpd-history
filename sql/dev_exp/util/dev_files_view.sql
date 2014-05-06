
create or replace view dev_files as (
                         select commit, authoremail, filepath, authordate, (
                                                               select count(*) from dev_analysis d2 
                                                                    where d2.authoremail = d1.authoremail 
				                                                    and d2.filepath = d1.filepath 
                                                                    and d2.authordate < d1.authordate
															   ) as filecommits
                               from dev_analysis as d1
                          );