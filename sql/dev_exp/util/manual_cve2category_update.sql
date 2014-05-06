SELECT * FROM httpdhistory.cve2category where cve = 'CVE-2011-3368';

update cve2category set catcode = 'BYPASS' where cve='CVE-2011-3368';

insert into cve2category (cve, catcode) values ('CVE-2011-3368', 'ICI'); 
insert into cve2category (cve, catcode) values ('CVE-2011-3368', 'UM'); 

-- ------------------
SELECT * FROM httpdhistory.cve2category where cve = 'CVE-2011-4317';

update cve2category set catcode = 'BYPASS' where cve='CVE-2011-4317';

insert into cve2category (cve, catcode) values ('CVE-2011-4317', 'ICI'); 
insert into cve2category (cve, catcode) values ('CVE-2011-4317', 'UM'); 
