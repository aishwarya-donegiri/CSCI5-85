database:Oracle


select PID from project p1 where step=0 and status='C'and ('W' in (select status from project p2 where step<>0 and p1.PID=p2.PID));