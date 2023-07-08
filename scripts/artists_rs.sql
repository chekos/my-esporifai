create view if not exists artists_rs as
select
    name,
    played_date,
    sum(n) over (
        partition by artist_id
        order by
            played_date asc
    ) as running_sum,
    artist_id
from
    (
        select
            artist_id,
            played_date,
            sum(n) as n
        from
            history_daily_sum
        group by
            1,
            2
    )
    join artists on artists.id = artist_id