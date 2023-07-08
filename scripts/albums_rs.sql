create view if not exists album_rs as
select
    name,
    played_date,
    sum(n) over (
        partition by album_id
        order by
            played_date asc
    ) as running_sum,
    album_id
from
    (
        select
            album_id,
            played_date,
            sum(n) as n
        from
            history_daily_sum
        group by
            1,
            2
    )
    join albums on albums.id = album_id