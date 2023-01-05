-- Delete Duplicate Emails

IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_TYPE='BASE TABLE' AND TABLE_NAME='Person')
    DROP table Person;

Create table Person (Id int, Email varchar(255));

insert into Person (id, email) values ('1', 'john@example.com');
insert into Person (id, email) values ('2', 'bob@example.com');
insert into Person (id, email) values ('3', 'john@example.com');


-- Query 1:
with cte as (select email, min(id) as minId from Person group by email having count(email) > 1)
delete from Person where id > (select minId from cte) and email = (select email from cte);

-- Query 2:
delete p1 from Person p1, Person p2 where p1.email = p2.email and p1.id > p2.id;
