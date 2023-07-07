create view if not exists enriched_history as
select
    tinfo.album,
    tinfo.artist,
    tinfo.name,
    played_at,
    running_count,
    hrc.id as track_id,
    tinfo.main_artist_id,
    tinfo.album_id
from
    history_running_count as hrc
    join tracks_info as tinfo on tinfo.id = hrc.id