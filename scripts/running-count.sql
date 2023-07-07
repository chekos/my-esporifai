create view if not exists history_running_count as
select
    tinfo.album_id,
    tinfo.main_artist_id,
    history.id,
    played_at,
    count(*) over (
        partition by history.id
        order by
            played_at asc
    ) as running_count
from
    history
    join tracks_info as tinfo on history.id = tinfo.id