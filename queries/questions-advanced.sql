-- Find the top 3 most-viewed tracks for each artist using window functions.
with artistranking as (
	select
		track,
		artist,
		views,
		dense_rank() over(partition by artist order by views desc) as rank
	from spotify
)
select artist, track, views from artistranking 
where rank <=3;

-- Write a query to find tracks where the liveness score is above the average.
select 
	track,
	artist,
	liveness 
from spotify 
where liveness > (select avg(liveness) from spotify);

-- Use a WITH clause to calculate the difference between the highest and lowest energy
-- values for tracks in each album.
with cte as (
select 
	album,
	max(energy) as max_energy,
	min(energy) as min_energy
from spotify
group by 1
)
select 
	album,
	round((max_energy - min_energy)::numeric, 3) as energy__difference
from cte
order by 2 desc;
