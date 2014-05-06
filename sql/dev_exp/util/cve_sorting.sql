
select cve, description from (
select cve, description from cve_1_3
union
select cve, description from cve_2_0
union
select cve, description from cve_2_2
union
select cve, description from cve_2_4) as t
where cve not in (select cve from cve);
