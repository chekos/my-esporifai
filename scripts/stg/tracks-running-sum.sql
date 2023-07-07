create view if not exists stg__tracks_running_sum as
select
    id,
    played_date,
    sum(daily_sum) over (
        partition by id
        order by
            played_date asc
    ) as running_sum
from
    stg__tracks_daily_sum