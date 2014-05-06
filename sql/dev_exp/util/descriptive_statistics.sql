select min(authordate) as commitstart, max(authordate) as commitEnd, count(*) as commitcount from gitlog;

select * from cve2vcc where commitintroduced  like '%48074d33%';

select distinct(filepath) from dev_file_analysis
 where commit in (select commitintroduced from cve2vcc);