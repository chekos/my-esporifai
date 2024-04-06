create view if not exists streaming_history as
select *
from (
    select substr(spotify_track_uri, 15) as id,
      ts as played_at
    from full_history
    where spotify_track_uri is not null
  )
union
select *
from (
    select id,
      strftime('%Y-%m-%dT%H:%M:%SZ', played_at) as played_at
    from history
  )