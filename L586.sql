-- Customer Placing the Largest Number of Orders
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_TYPE='BASE TABLE' AND TABLE_NAME='orders')
    DROP table orders;

Create table orders (order_number int, customer_number int);

insert into orders (order_number, customer_number) values (1, 1);
insert into orders (order_number, customer_number) values (2, 2);
insert into orders (order_number, customer_number) values (3, 3);
insert into orders (order_number, customer_number) values (4, 3);

-- Query
select customer_number
from (select customer_number, count(*) as cnt
      from orders
      group by customer_number) as e
order by e.cnt desc OFFSET 0 ROWS FETCH NEXT 1 ROW ONLY;