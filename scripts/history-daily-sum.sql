create view if not exists history_daily_sum as
select
    tinfo.album_id,
    tinfo.main_artist_id as artist_id,
    hs.id as track_id,
    hs.played_date,
    hs.n
from
    tracks_info as tinfo
    join (
        select
            id,
            date(played_at, "-8 hours") as played_date,
            count(*) as n
        from
            history
        group by
            1,
            2
    ) as hs on hs.id = tinfo.id