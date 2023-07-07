create view if not exists tracks_daily_sum as
select
  tinfo.artist,
  tinfo.album,
  tinfo.name,
  hs.played_date,
  hs.n,
  hs.id as track_id,
  tinfo.main_artist_id as artist_id
  tinfo.album_id
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
