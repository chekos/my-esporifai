create view if not exists tracks_rs as
select
  tinfo.album,
  tinfo.artist,
  tinfo.name,
  played_date,
  sum(n) over (
    partition by track_id
    order by
      played_date asc
  ) as running_sum,
  hds.album_id,
  hds.artist_id,
  hds.track_id
from
  history_daily_sum hds
  join tracks_info as tinfo on tinfo.id = hds.track_id