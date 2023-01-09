-- Triangle Judgement


-- Query
select x, y ,z,
       case
           when x+y > z and x+z>y and y+z>x then 'yes'
           else 'no'
       end as triangle
from triangle;