--  Managers with at Least 5 Direct Reports


-- Query
select Name from employee where id in (select manager_id from employee group by manager_id having count(*) >=5);