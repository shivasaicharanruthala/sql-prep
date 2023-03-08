Create table If Not Exists Transactions (id int, country varchar(4), state enum('approved', 'declined'), amount int, trans_date date);

insert into Transactions (id, country, state, amount, trans_date) values (121, 'US', 'approved', 1000, '2018-12-18');
insert into Transactions (id, country, state, amount, trans_date) values (122, 'US', 'declined', 2000, '2018-12-19');
insert into Transactions (id, country, state, amount, trans_date) values (123, 'US', 'approved', 2000, '2019-01-01');
insert into Transactions (id, country, state, amount, trans_date) values (124, 'DE', 'approved', 2000, '2019-01-07');

#  SQL query to find for each month and country, the number of transactions and their total amount,
#  the number of approved transactions and their total amount.

-- Query
SELECT
    DATE_FORMAT(trans_date, '%Y-%m') AS month,
    country,
    COUNT(*) AS trans_count,
    COUNT(iF(state = 'approved', 1, NULL)) AS approved_count,
    SUM(amount) AS trans_total_amount,
    SUM(iF(state = 'approved', amount, 0)) AS approved_total_amount
FROM Transactions
GROUP BY month, country;

