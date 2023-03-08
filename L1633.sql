Create table If Not Exists Users (user_id int, user_name varchar(20));
Create table If Not Exists Register (contest_id int, user_id int);

insert into Users (user_id, user_name) values (6, 'Alice');
insert into Users (user_id, user_name) values (2, 'Bob');
insert into Users (user_id, user_name) values (7, 'Alex');

insert into Register (contest_id, user_id) values (215, 6);
insert into Register (contest_id, user_id) values (209, 2);
insert into Register (contest_id, user_id) values (208, 2);
insert into Register (contest_id, user_id) values (210, 6);
insert into Register (contest_id, user_id) values (208, 6);
insert into Register (contest_id, user_id) values (209, 7);
insert into Register (contest_id, user_id) values (209, 6);
insert into Register (contest_id, user_id) values (215, 7);
insert into Register (contest_id, user_id) values (208, 7);
insert into Register (contest_id, user_id) values (210, 2);
insert into Register (contest_id, user_id) values (207, 2);
insert into Register (contest_id, user_id) values (210, 7);


# SQL query to find the percentage of the users registered in each contest rounded to two decimals.
# Return the result table ordered by percentage in descending order. In case of a tie, order it by contest_id in ascending order.

-- Query
select r.contest_id, round((count(distinct r.user_id)/(select count(*) from users))*100,2) as percentage
from register r join users u on r.user_id=u.user_id group by contest_id order by percentage desc, contest_id;
