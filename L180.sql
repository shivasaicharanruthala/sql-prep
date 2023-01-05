-- Numbers apper 3 times Consecutively

IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_TYPE='BASE TABLE' AND TABLE_NAME='Logs')
    DROP table Logs;

Create table Logs (id int, num int);

insert into Logs (id, num) values ('1', '1');
insert into Logs (id, num) values ('2', '1');
insert into Logs (id, num) values ('3', '1');
insert into Logs (id, num) values ('4', '2');
insert into Logs (id, num) values ('5', '1');
insert into Logs (id, num) values ('6', '2');
insert into Logs (id, num) values ('7', '2');

-- Query
select distinct l1.num as ConsecutiveNums from Logs l1, Logs l2, Logs l3 where l1.id = l2.id and l2.id = l3.id - 1 and l1.num = l2.num and l2.num = l3.num;