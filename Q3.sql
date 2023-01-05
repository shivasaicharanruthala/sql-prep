-- Question: find number of employees inside the hospital
create table hospital
(
    emp_id int,
    action varchar(10),
    time   datetime
);

insert into hospital
values ('1', 'in', '2019-12-22 09:00:00');
insert into hospital
values ('1', 'out', '2019-12-22 09:15:00');
insert into hospital
values ('2', 'in', '2019-12-22 09:00:00');
insert into hospital
values ('2', 'out', '2019-12-22 09:15:00');
insert into hospital
values ('2', 'in', '2019-12-22 09:30:00');
insert into hospital
values ('3', 'out', '2019-12-22 09:00:00');
insert into hospital
values ('3', 'in', '2019-12-22 09:15:00');
insert into hospital
values ('3', 'out', '2019-12-22 09:30:00');
insert into hospital
values ('3', 'in', '2019-12-22 09:45:00');
insert into hospital
values ('4', 'in', '2019-12-22 09:45:00');
insert into hospital
values ('5', 'out', '2019-12-22 09:40:00');


select * from hospital;
-- method 1:
select emp_id, max(case when action='in' then time end) as in_time, max(case when action='out' then time end) as out_time from hospital group by emp_id;
-- method 2:
select emp_id, action, time from hospital group by emp_id, action, time order by time DESC ;
-- method 3: