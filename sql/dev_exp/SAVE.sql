select  authoremail, count(*) as numVCC from gitlog where  commit in (select vcc from vcc_intro)
group by authoremail order by numVCC;