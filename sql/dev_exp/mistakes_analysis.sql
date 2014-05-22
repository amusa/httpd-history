-- analysis of mistakes (vulnerability types)
-- depends on \util\dev_mistakes_create.sql

-- number of DOS mistakes that were repeated more than twice
SELECT count(*) as mistakes FROM httpdhistory.dev_mistakes 
   where cvecount > 1 
AND catcode='DOS'
;

-- aggregating mistake types
SELECT catcode, count(*) as mistakes FROM httpdhistory.dev_mistakes
where cvecount>1
group by catcode
order by mistakes
;
-- authors that made the same mistake more than twice grouped by mistake type
SELECT authoremail, catcode, count(*) as mistakes FROM httpdhistory.dev_mistakes
where cvecount>1 
group by authoremail,catcode
order by mistakes
;

-- distinct authors that have committed DOS more than twice.
SELECT distinct authoremail  FROM httpdhistory.dev_mistakes
where cvecount>1 and catcode='DOS'
;

-- distinct authors that have made the same mistakes more than twice
SELECT distinct authoremail from dev_mistakes where cvecount>1;

-- select authors that have committed DOS more than twice.
SELECT authoremail, catcode, count(*) as ccount from httpdhistory.dev_mistakes
where catcode = 'DOS' 
and  cvecount>1
 group by authoremail , 
catcode
ORDER BY ccount
;