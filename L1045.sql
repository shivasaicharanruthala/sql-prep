-- query for a report that provides the customer ids from the Customer table that bought all the products in the Product table

IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_TYPE='BASE TABLE' AND TABLE_NAME='Customer')
    DROP table Customer;

IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_TYPE='BASE TABLE' AND TABLE_NAME='Product')
    DROP table Product;

Create table Customer (customer_id int, product_key int);
Create table Product (product_key int);

insert into Customer (customer_id, product_key) values (1, 5);
insert into Customer (customer_id, product_key) values (2, 6);
insert into Customer (customer_id, product_key) values (3, 5);
insert into Customer (customer_id, product_key) values (3, 6);
insert into Customer (customer_id, product_key) values (1, 6);

insert into Product (product_key) values (5);
insert into Product (product_key) values (6);

select customer_id from Customer group by customer_id having sum(distinct product_key) = (select sum(product_key) from Product);
