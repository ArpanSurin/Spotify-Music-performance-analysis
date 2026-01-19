copy spotify
from 'C:/scratch/da/sql-da/Spotify-analysis/data/cleaned_dataset.csv'
with (format csv, header true, delimiter ',');

select * from spotify;