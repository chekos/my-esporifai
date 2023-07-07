create view if not exists tracks_info as
select
    albums.name as album,
    artists.name as artist,
    tracks.name,
    duration_ms,
    explicit,
    album_id,
    json_extract(artist_ids, "$[0]") as main_artist_id,
    artist_ids,
    tracks.id
from
    tracks
    join albums on albums.id = album_id
    join artists on artists.id = json_extract(artist_ids, "$[0]")
order by
    tracks.id