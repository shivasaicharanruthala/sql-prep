--  Biggest Single Number
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_TYPE='BASE TABLE' AND TABLE_NAME='my_numbers')
    DROP table my_numbers;


Create table my_numbers (num int);

insert into my_numbers (num) values (8);
insert into my_numbers (num) values (8);
insert into my_numbers (num) values (3);
insert into my_numbers (num) values (3);
insert into my_numbers (num) values (1);
insert into my_numbers (num) values (4);
insert into my_numbers (num) values (5);
insert into my_numbers (num) values (6);
-- Query
select max(num) from (select num from my_numbers group by num having count(num) = 1) as num;