-- Swap Salary
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_TYPE='BASE TABLE' AND TABLE_NAME='Salary')
    DROP table Salary;

Create table Salary (id int, name varchar(100), sex char(1), salary int);

insert into Salary (id, name, sex, salary) values ('1', 'A', 'm', '2500');
insert into Salary (id, name, sex, salary) values ('2', 'B', 'f', '1500');
insert into Salary (id, name, sex, salary) values ('3', 'C', 'm', '5500');
insert into Salary (id, name, sex, salary) values ('4', 'D', 'f', '500');

-- Query
update salary set sex = IIF(sex = 'm', 'f', 'm');
