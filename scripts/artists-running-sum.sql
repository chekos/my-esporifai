create view if not exists artists_rs as
select
    rs.main_artist_id as id,
    artists.name as artist,
    played_date,
    running_sum
from
    stg__artists_running_sum as rs
    join artists on rs.main_artist_id = artists.id