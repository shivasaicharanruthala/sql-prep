-- find the employees who earn more than their managers.

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_TYPE='BASE TABLE' AND TABLE_NAME='Employee')
Create table Employee (id int, name varchar(255), salary int, managerId int);


insert into Employee (id, name, salary, managerId) values ('1', 'Joe', '70000', '3');
insert into Employee (id, name, salary, managerId) values ('2', 'Henry', '80000', '4');
insert into Employee (id, name, salary, managerId) values ('3', 'Sam', '60000', Null);
insert into Employee (id, name, salary, managerId) values ('4', 'Max', '90000', Null);

-- Answer
Select e.name As 'Employee' from Employee e, Employee m where e.managerId = m.id and e.salary > m.salary;