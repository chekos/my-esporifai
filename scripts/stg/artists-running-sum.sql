create view if not exists stg__artists_running_sum as
select
    main_artist_id,
    played_date,
    max(daily_sum) over (
        partition by main_artist_id
        order by
            played_date asc
    ) as running_sum
from
    stg__artists_daily_sum
