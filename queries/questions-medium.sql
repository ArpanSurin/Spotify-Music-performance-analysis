-- Calculate the average danceability of tracks in each album.
select 
	album,
	round(avg(danceability)::numeric, 2) as avg_anceability 
from spotify
group by album
order by 2 desc;

-- Find the top 5 tracks with the highest energy values.
select 
	track, 
	max(energy) 
from spotify 
group by 1
order by 2 desc
limit 5;

-- List all tracks along with their views and likes where official_video = TRUE.
select 
	track, 
	sum(views) as total_views, 
	sum(likes) as total_likes
from spotify
where official_video = 'True'
group by 1
order by 2 desc

-- For each album, calculate the total views of all associated tracks.
select 
	album, 
	track, 
	sum(views) 
from spotify
group by 1, 2
order by 3 desc;


-- Retrieve the track names that have been streamed on Spotify more than YouTube.
with Streamdata as
(select
	track,
	coalesce(sum(case when most_played_on = 'Spotify' then stream end),0) as on_spotify,
	coalesce(sum(case when most_played_on = 'Youtube' then stream end),0) as on_youtube
from spotify
group by track
) 
select * from streamdata
where on_spotify > on_youtube and
	on_youtube <> 0
order by on_spotify desc
limit 10