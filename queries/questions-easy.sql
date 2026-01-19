-- Retrieve the names of all tracks that have more than 1 billion streams.
select track, stream from spotify
where stream > 1000000000;

-- List all albums along with their respective artists.
select album, artist from spotify;

-- Get the total number of comments for tracks where licensed = TRUE.
select sum(comments) as total_comments, licensed from spotify where licensed = TRUE
group by licensed;

-- Find all tracks that belong to the album type single.
select count(track) as total_tracks, album_type from spotify
where album_type = 'single'
group by album_type; 

-- Count the total number of tracks by each artist.
select count(track), artist from spotify 
group by artist;
