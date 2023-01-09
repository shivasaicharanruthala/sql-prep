--  Tree Node
IF EXISTS(SELECT 1
          FROM INFORMATION_SCHEMA.TABLES
          WHERE TABLE_TYPE = 'BASE TABLE'
            AND TABLE_NAME = 'Tree')
    DROP table Tree;

Create table Tree
(
    id   int,
    p_id int
);

insert into Tree (id, p_id)
values (1, null);
insert into Tree (id, p_id)
values (2, 1);
insert into Tree (id, p_id)
values (3, 1);
insert into Tree (id, p_id)
values (4, 2);
insert into Tree (id, p_id)
values (5, 2);

-- Query
select id,
       case
           when p_id is null then 'Root'
           when p_id is not null and id in (select distinct p_id from tree) then 'Inner'
           else 'Leaf'
       end
           as Type from tree;