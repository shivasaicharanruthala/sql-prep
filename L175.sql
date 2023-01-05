SELECT * FROM INFORMATION_SCHEMA.TABLES

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_TYPE='BASE TABLE' AND TABLE_NAME='Person')
Create table Person (personId int, firstName varchar(255), lastName varchar(255));

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_TYPE='BASE TABLE' AND TABLE_NAME='Address')
Create table Address (addressId int, personId int, city varchar(255), state varchar(255));

insert into Person (personId, lastName, firstName) values ('1', 'Wang', 'Allen');
insert into Person (personId, lastName, firstName) values ('2', 'Alice', 'Bob');
insert into Address (addressId, personId, city, state) values ('1', '2', 'New York City', 'New York');
insert into Address (addressId, personId, city, state) values ('2', '3', 'Leetcode', 'California');


-- Answer
select firstname, lastName, city, state from Person as P inner join Address A on P.personId = A.personId;