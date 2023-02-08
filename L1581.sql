-- Method 1:
select customer_id, count(visit_id) as count_no_trans from Visits where visit_id not in (select distinct visit_id from Transactions)  group by customer_id;


-- Method 2: Joins
-- Method 3: NOT EXISTS