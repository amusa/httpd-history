-- monthly project commits
select timeline, monthcommits from timeline t 
left outer join (
                 select date_format(authordate,'%m-%Y') AS MYMONTH, count(commit) as monthCommits 
                        from  gitlog g  group by year(authordate), month(authordate)
				) as td
on td.mymonth = t.timeline;



-- monthly project vccs
select timeline, monthvccs from timeline t 
left outer join (
                 select date_format(authordate,'%m-%Y') AS MYMONTH, count(commit) as monthvccs 
                       from  gitlog g
                       where g.commit in (select vcc from vcc_intro where vcc <> 'N/A')
                       group by year(authordate), month(authordate)
                ) as td
on t.timeline = td.mymonth
order by id;
