-- Employee Bonus

-- Query
select name, bonus from Employee e left join Bonus b on e.empId = b.empId where e.bonus < 1000;