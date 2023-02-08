-- list customers &  their total spent on other products other than photoshop but also bought photoshop
CREATE TABLE photoshop
(
    customer_id INTEGER  NOT NULL,
    product NVARCHAR(20)  NOT NULL,
    cost INTEGER
);

--  Query with IN
select customer_id, sum(cost) from photoshop where customer_id in (select distinct customer_id from photoshop where product = 'photoshop') and product != 'photoshop' group by customer_id order by customer_id;


--  Query with exists
-- need to use aliasing because these are correlated kind of sub queries.
select customer_id, sum(cost) from photoshop p1 where exists ( select 1 from photoshop p2 where p2.product = 'photoshop' and p1.customer_id = p2.customer_id) and product != 'photoshop' group by customer_id order by customer_id;

