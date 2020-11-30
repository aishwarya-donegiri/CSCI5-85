database:Oracle

delete from spam where ID in (select samefam from spam s2 where samefam<>'NULL'); 