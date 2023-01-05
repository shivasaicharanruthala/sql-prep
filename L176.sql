-- report the second highest salary. If there is no second highest salary, the query should report null

IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_TYPE='BASE TABLE' AND TABLE_NAME='Employee')
DROP table Employee;

Create table Employee (id int, salary int);

insert into Employee (id, salary) values ('1', '100');
insert into Employee (id, salary) values ('2', '200');
insert into Employee (id, salary) values ('3', '300');


-- Query
select ISNULL((SELECT distinct salary FROM Employee ORDER BY salary DESC OFFSET 1 ROWS FETCH NEXT 1 ROW ONLY), NULL) as SecondHighestSalary;