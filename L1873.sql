select employee_id,
       case
           when (employee_id %2 =0) then 0
           when (employee_id %2 =1 ) and (name like 'M%') then 0
           else salary
           end as bonus
from Employees
order by employee_id


1. matching & Searching
2.