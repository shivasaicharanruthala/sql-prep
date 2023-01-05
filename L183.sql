-- report all customers who never order anything.

IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_TYPE='BASE TABLE' AND TABLE_NAME='Customers')
DROP table Customers;

IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_TYPE='BASE TABLE' AND TABLE_NAME='Orders')
DROP table Orders;

Create table Customers (id int, name varchar(255));
Create table Orders (id int, customerId int);

insert into Customers (id, name) values ('1', 'Joe');
insert into Customers (id, name) values ('2', 'Henry');
insert into Customers (id, name) values ('3', 'Sam');
insert into Customers (id, name) values ('4', 'Max');

insert into Orders (id, customerId) values ('1', '3');
insert into Orders (id, customerId) values ('2', '1');


-- Query
select name as Customers From Customers WHERE id NOT IN (SELECT customerId from Orders);
