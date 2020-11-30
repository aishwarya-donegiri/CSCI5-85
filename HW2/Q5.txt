database:Oracle

select chef from menu where dish in (select dish from dishes) group by chef having count(distinct dish)=(select count(dish) from dishes);

Here, we consider that dishes are in a table called 'dishes'. We select the chefs having those dishes in the table 'dishes' whose count is equal to the total number of distinct dishes in the table 'dishes'.