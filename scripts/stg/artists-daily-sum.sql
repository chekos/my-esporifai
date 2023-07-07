create view if not exists stg__artists_daily_sum as
select
    main_artist_id,
    date(played_at, '-8 hours') as played_date,
    sum(running_count) as daily_sum
from
    history_running_count
group by
    1,
    2