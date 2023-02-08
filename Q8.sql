-- Number of user who purchased same product on different days.
IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_TYPE='BASE TABLE' AND TABLE_NAME='products')
Create table products (user_id int, product_id int, quantity integer, purchase_date datetime);


insert into products (user_id, product_id, quantity, purchase_date) values (536, 3223, 6, '01/11/2022 12:33:44');
insert into products (user_id, product_id, quantity, purchase_date) values (827, 3585, 35, '02/20/2022 12:33:44');
insert into products (user_id, product_id, quantity, purchase_date) values (536, 3223, 5, '03/02/2022 12:33:44');
insert into products (user_id, product_id, quantity, purchase_date) values (536, 1435, 10, '03/02/2022 12:33:44');
insert into products (user_id, product_id, quantity, purchase_date) values (827, 2452, 45, '05/09/2022 12:33:44');



-- Query
select count(1) as user_num from (
select user_id, product_id from products group by user_id, product_id having count(distinct CAST(purchase_date AS DATE)) > 1) A;