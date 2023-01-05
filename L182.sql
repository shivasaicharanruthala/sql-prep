-- report all the duplicate emails

IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_TYPE='BASE TABLE' AND TABLE_NAME='Person')
DROP table Person;

Create table Person (id int, email varchar(255));

insert into Person (id, email) values ('1', 'a@b.com');
insert into Person (id, email) values ('2', 'c@d.com');
insert into Person (id, email) values ('3', 'a@b.com');
insert into Person (id, email) values ('4', 'c@d.com');

--  Query
select email As Email from Person group by email having count(email) > 1;