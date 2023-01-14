-- Product Sales Analysis III

IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_TYPE='BASE TABLE' AND TABLE_NAME='Sales')
    DROP table Sales;

IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_TYPE='BASE TABLE' AND TABLE_NAME='Product')
    DROP table Product;

Create table Sales (sale_id int, product_id int, year int, quantity int, price int);
Create table Product (product_id int, product_name varchar(50));

insert into Sales values (1, 100, 2008, 10, 5000);
insert into Sales values (2, 100, 2009, 12, 5000);
insert into Sales values (7, 200, 2011, 15, 9000);

insert into Product values (100, 'Nokia');
insert into Product values (200, 'Apple');
insert into Product values (300, 'Samsung');

select product_id, year as first_year, quantity, price from Sales
where (product_id, year) in (select product_id, min(year) as year from Sales group by product_id);