--  Rank Scores

IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_TYPE='BASE TABLE' AND TABLE_NAME='Scores')
    DROP table Scores;

Create table Scores (id int, score DECIMAL(3,2));

insert into Scores (id, score) values ('1', '3.5');
insert into Scores (id, score) values ('2', '3.65');
insert into Scores (id, score) values ('3', '4.0');
insert into Scores (id, score) values ('4', '3.85');
insert into Scores (id, score) values ('5', '4.0');
insert into Scores (id, score) values ('6', '3.65');

-- Query
select s1.score as score, (select count(distinct s2.score) from Scores s2 where s2.score >= s1.score) as rank from Scores s1 order by s1.score desc;