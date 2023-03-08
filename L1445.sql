Create table If Not Exists Sales (sale_date date, fruit ENUM('apples', 'oranges'), sold_num int);

insert into Sales (sale_date, fruit, sold_num) values ('2020-05-01', 'apples', 10);
insert into Sales (sale_date, fruit, sold_num) values ('2020-05-01', 'oranges', 8);
insert into Sales (sale_date, fruit, sold_num) values ('2020-05-02', 'apples', 15);
insert into Sales (sale_date, fruit, sold_num) values ('2020-05-02', 'oranges', 15);
insert into Sales (sale_date, fruit, sold_num) values ('2020-05-03', 'apples', 20);
insert into Sales (sale_date, fruit, sold_num) values ('2020-05-03', 'oranges', 0);
insert into Sales (sale_date, fruit, sold_num) values ('2020-05-04', 'apples', 15);
insert into Sales (sale_date, fruit, sold_num) values ('2020-05-04', 'oranges', 16);

#  SQL query to report the difference between the number of apples and oranges sold each day.
# Return the result table ordered by sale_date

-- Query
select sale_date,
       SUM(IF(fruit = 'apples', sold_num, -sold_num)) as diff from sales group by sale_date order by  sale_date;
