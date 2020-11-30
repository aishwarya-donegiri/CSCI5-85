database:ORACLE

select ClassName ,count(ClassName) as Total from enroll1 group by ClassName order by count(ClassName) desc;