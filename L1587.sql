Drop table Users;
Drop table Transactions;

Create table If Not Exists Users (account int, name varchar(20));
Create table If Not Exists Transactions (trans_id int, account int, amount int, transacted_on date);

insert into Users (account, name) values (900001, 'Alice');
insert into Users (account, name) values (900002, 'Bob');
insert into Users (account, name) values (900003, 'Charlie');

insert into Transactions (trans_id, account, amount, transacted_on) values (1, 900001, 7000, '2020-08-01');
insert into Transactions (trans_id, account, amount, transacted_on) values (2, 900001, 7000, '2020-09-01');
insert into Transactions (trans_id, account, amount, transacted_on) values (3, 900001, -3000, '2020-09-02');
insert into Transactions (trans_id, account, amount, transacted_on) values (4, 900002, 1000, '2020-09-12');
insert into Transactions (trans_id, account, amount, transacted_on) values (5, 900003, 6000, '2020-08-07');
insert into Transactions (trans_id, account, amount, transacted_on) values (6, 900003, 6000, '2020-09-07');
insert into Transactions (trans_id, account, amount, transacted_on) values (7, 900003, -4000, '2020-09-11');


-- Query
# SQL query to report the name and balance of users with a balance higher than 10000. The balance of an account is equal
# to the sum of the amounts of all transactions involving that account.
select max(u.name) as name, sum(t.amount) as balance from users u inner join transactions t on u.account=t.account group by t.account having balance>10000;


Select max(U.name) as name ,sum(T.amount) as balance from Users U , Transactions T where U.account = T.account group by U.account having balance > 10000;