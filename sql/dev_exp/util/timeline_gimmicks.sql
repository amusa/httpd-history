SELECT * FROM httpdhistory.timeline;

DELETE FROM TIMELINE WHERE month_end is null;


update timeline set month_start = str_to_date(timeline,'%m-%Y');


select last_day(month_start) from timeline;


select date_add(month_start, INTERVAL 1 DAY) FROM timeline;

update timeline set month_start = DATE_SUB(month_start, INTERVAL 1 MONTH);

insert into timeline (month_start) values ('2014-01-01');
insert into timeline (month_start) values ('2014-02-01');
insert into timeline (month_start) values ('2014-03-01');
insert into timeline (month_start) values ('2014-04-01');
insert into timeline (month_start) values ('2014-05-01');
insert into timeline (month_start) values ('2014-06-01');
insert into timeline (month_start) values ('2014-07-01');
insert into timeline (month_start) values ('2014-08-01');
insert into timeline (month_start) values ('2014-09-01');
insert into timeline (month_start) values ('2014-10-01');
insert into timeline (month_start) values ('2014-11-01');
insert into timeline (month_start) values ('2014-12-01');

DELETE FROM TIMELINE WHERE MONTH_START IS NULL;

update timeline set month_end = DATE_ADD(month_end, INTERVAL 1 month) where year(month_start)= 2014;
update timeline set month_end = last_day(month_end) where year(month_start)= 2014;

select DATE_ADD(timeline, INTERVAL 1 DAY) from timeline where year(str_to_date(timeline,'%m-%Y'))= 2014;

update timeline set month_start = DATE_ADD(month_start, INTERVAL 1 DAY) where year(str_to_date(timeline,'%m-%Y'))= 2014;


update timeline set month_start = str_to_date(timeline,'%m-%Y') where year(str_to_date(timeline,'%m-%Y')) = 2014;

update timeline set timeline = date_format(month_start,'%m-%Y') where year(month_start)= 2014;

