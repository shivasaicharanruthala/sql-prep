-- determine the top 5 artists whose songs appear in the Top 10 of the global_song_rank table the highest number of times.
IF NOT EXISTS(SELECT 1
              FROM INFORMATION_SCHEMA.TABLES
              WHERE TABLE_TYPE = 'BASE TABLE'
                AND TABLE_NAME = 'artists')

Create table artists
(
    artist_id   int,
    artist_name varchar(20)
);

IF NOT EXISTS(SELECT 1
              FROM INFORMATION_SCHEMA.TABLES
              WHERE TABLE_TYPE = 'BASE TABLE'
                AND TABLE_NAME = 'songs')
Create table songs
(
    song_id   int,
    artist_id int
);

IF NOT EXISTS(SELECT 1
              FROM INFORMATION_SCHEMA.TABLES
              WHERE TABLE_TYPE = 'BASE TABLE'
                AND TABLE_NAME = 'global_song_rank')
Create table global_song_rank
(
    day     int,
    song_id int,
    rank    int
);

insert into artists (artist_id, artist_name)
values (101, 'Ed Sheeran');
insert into artists (artist_id, artist_name)
values (120, 'Drake');

insert into songs (song_id, artist_id)
values (45202, 101);
insert into songs (song_id, artist_id)
values (19960, 120);

insert into global_song_rank (day, song_id, rank)
values (1, 45202, 5);
insert into global_song_rank (day, song_id, rank)
values (3, 45202, 2);
insert into global_song_rank (day, song_id, rank)
values (1, 19960, 3);
insert into global_song_rank (day, song_id, rank)
values (9, 19960, 15);


--- Query
select ar.artist_name, rn
from (select *, dense_rank() over (ORDER BY no_of_apperences desc) as rn
      from (select songs.artist_id, count(1) as no_of_apperences
            from global_song_rank gskd
                     inner join songs on gsk.song_id = songs.song_id
            where gsk.rank <= 10
            group by songs.artist_id) A) B
         inner join artists ar on B.artist_id = ar.artist_id
where rn < 6;



