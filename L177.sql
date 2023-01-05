-- Nth Highest Salary

IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_TYPE='BASE TABLE' AND TABLE_NAME='Employee')
DROP table Employee;

Create table Employee (Id int, Salary int);

insert into Employee (id, salary) values ('1', '100');
insert into Employee (id, salary) values ('2', '200');
insert into Employee (id, salary) values ('3', '300');

-- Query
Create function getNthHighestSalary(N int) returns int
Begin
    declare M int;
    set M = N-1;

    Return (
        select distinct salary from Employee order by salary desc offset M rows fetch next 1 row only
    )
end