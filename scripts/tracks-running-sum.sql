create view if not exists tracks_rs as
select
    rs.id,
    tinfo.artist,
    tinfo.album,
    tinfo.name,
    played_date,
    running_sum
from
    stg__tracks_running_sum as rs
    join tracks_info as tinfo on rs.id = tinfo.id