insert into cve2vcc (cve, commitintroduced)
select t2.cve, t1.vcc from (
                SELECT vcc FROM vcc_qualitative_study where vcc not in (select commitintroduced from cve2vcc)
				) t1 
    inner join cve2vcc_qualitative_study t2 
	on t2.vcc = t1.vcc;


