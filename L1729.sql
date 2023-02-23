Create table If Not Exists Followers(user_id int, follower_id int);
insert into Followers (user_id, follower_id) values ('0', '1');
insert into Followers (user_id, follower_id) values ('1', '0');
insert into Followers (user_id, follower_id) values ('2', '0');
insert into Followers (user_id, follower_id) values ('2', '1');

-- Query
select user_id, count(distinct follower_id) as followers_count from followers group by user_id;