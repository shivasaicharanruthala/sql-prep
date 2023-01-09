-- Find Customer Referee
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_TYPE='BASE TABLE' AND TABLE_NAME='Customer')
    DROP table Customer;

Create table Customer (id int, name varchar(25), referee_id int);

insert into Customer (id, name, referee_id) values (1, 'Will', null);
insert into Customer (id, name, referee_id) values (2, 'Jane', null);
insert into Customer (id, name, referee_id) values (3, 'Alex', 2);
insert into Customer (id, name, referee_id) values (4, 'Bill', null);
insert into Customer (id, name, referee_id) values (5, 'Zack', 1);
insert into Customer (id, name, referee_id) values (6, 'Mark', 2);

-- Query
select name from customer where referee_id is null or referee_id != 2;