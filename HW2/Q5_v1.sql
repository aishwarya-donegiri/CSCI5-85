database:Oracle

select distinct x.chef from menu x
where not exists
(select * from dishes y
where not exists
(select * from menu z where
(z.chef=x.chef) and (z.dish=y.dish)
)
);