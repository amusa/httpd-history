create table AuthorHistory AS 

(SELECT distinct authoremail, (SELECT MIN(authordate) FROM dev_project_analysis d2 WHERE d2.authoremail = d1.authoremail
            GROUP BY d2.authoremail) as startAuthorDate
FROM dev_project_analysis d1);

SELECT commit, d1.authoremail, authordate,
           TIMESTAMPDIFF(YEAR, startauthordate, d1.authordate) as timePeriod
 FROM dev_project_analysis d1 INNER JOIN authorhistory ahv ON ahv.authoremail = d1.authoremail;

select distinct authoremail from dev_project_analysis;
