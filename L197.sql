-- Rising Temperature when compared to previous dates

IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_TYPE='BASE TABLE' AND TABLE_NAME='Weather')
    DROP table Weather;

Create table Weather (id int, recordDate date, temperature int);

insert into Weather (id, recordDate, temperature) values ('1', '2015-01-01', '10');
insert into Weather (id, recordDate, temperature) values ('2', '2015-01-02', '25');
insert into Weather (id, recordDate, temperature) values ('3', '2015-01-03', '20');
insert into Weather (id, recordDate, temperature) values ('4', '2015-01-04', '30');

-- Query
Select w2.id as Id from Weather w1, Weather w2 where datediff(day, w1.recordDate , w2.recordDate) = 1 and w1.temperature < w2.temperature;