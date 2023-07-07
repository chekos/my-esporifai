create view if not exists stg__tracks_daily_sum as
select
    id,
    date(played_at, '-8 hours') as played_date,
    max(running_count) as daily_sum
from
    history_running_count
group by
    1,
    2
