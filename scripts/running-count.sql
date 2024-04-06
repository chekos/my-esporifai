create view if not exists history_running_count as
select
    tinfo.album_id,
    tinfo.main_artist_id,
    streaming_history.id,
    played_at,
    count(*) over (
        partition by streaming_history.id
        order by
            played_at asc
    ) as running_count
from
    streaming_history
    join tracks_info as tinfo on streaming_history.id = tinfo.id