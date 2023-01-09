-- Exchange Seats
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_TYPE='BASE TABLE' AND TABLE_NAME='Seat')
    DROP table Seat;

Create table Seat (id int, student varchar(255));

insert into Seat (id, student) values (1, 'Abbot');
insert into Seat (id, student) values (2, 'Doris');
insert into Seat (id, student) values (3, 'Emerson');
insert into Seat (id, student) values (4, 'Green');
insert into Seat (id, student) values (5, 'Jeames');

-- Query
select
    case
        When id%2 = 1 and id != (select count(id) from seat) then id+1
        When id%2 = 0 then id-1
        ELSE id
    END as id, student
from seat
order by id