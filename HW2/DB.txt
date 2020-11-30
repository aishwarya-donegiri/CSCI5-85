select ClassName ,count(ClassName) as Total from enroll1 group by ClassName order by count(ClassName) desc;

select PID from project p1 where step=0 and status='C'and ('W' in (select status from project p2 where step<>0 and p1.PID=p2.PID));

delete from spam where ID in (select samefam from spam s2 where samefam<>'NULL'); 

select chef from menu where dish in ('Creme brulee','Apple pie','Tiramisu') group by chef having count(distinct dish)=3;

select chef from menu where dish in (select dish from dishes) group by chef having count(distinct dish)=(select count(dish) from dishes);

select distinct x.chef from menu x
where not exists
(select * from dishes y
where not exists
(select * from menu z where
(z.chef=x.chef) and (z.dish=y.dish)
)
);