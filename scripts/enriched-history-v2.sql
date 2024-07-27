create view if not exists enriched_history_v2 as
select
    *,
    cast(
        (
            julianday(datetime(played_at, 'localtime')) - 2440587.5
        ) * 86400 * 1000 as int
    ) % (86400 * 1000) as playedTime,
    -- dayOfWeek (M-S)
    case
        strftime('%w', datetime(played_at, 'localtime'))
        when '0' then 7
        else cast(
            strftime('%w', datetime(played_at, 'localtime')) as int
        )
    end as dayOfWeekIndex,
    case
        cast(
            strftime('%w', datetime(played_at, 'localtime')) as int
        )
        when 0 then 'Sunday'
        when 1 then 'Monday'
        when 2 then 'Tuesday'
        when 3 then 'Wednesday'
        when 4 then 'Thursday'
        when 5 then 'Friday'
        else 'Saturday'
    end as dayOfWeek,
    -- Weekday/Weekend
    iif(
        strftime('%w', datetime(played_at, 'localtime')) in ('0', '6'),
        'Weekend',
        'Weekday'
    ) as playedWeekday,
    -- quarter
    case
        when cast(
            strftime('%m', datetime(played_at, 'localtime')) as int
        ) < 4 then 'Q1: Jan - Mar'
        when cast(
            strftime('%m', datetime(played_at, 'localtime')) as int
        ) < 7 then 'Q2: Apr - Jun'
        when cast(
            strftime('%m', datetime(played_at, 'localtime')) as int
        ) < 10 then 'Q3: Jul - Sep'
        else 'Q4: Oct - Dec'
    end as playedQuarter,
    -- timeOfDay
    case
        when cast(
            strftime('%H', datetime(played_at, 'localtime')) as int
        ) < 5 then 'Late night'
        when cast(
            strftime('%H', datetime(played_at, 'localtime')) as int
        ) < 10 then 'Early morning'
        when cast(
            strftime('%H', datetime(played_at, 'localtime')) as int
        ) < 13 then 'Morning'
        when cast(
            strftime('%H', datetime(played_at, 'localtime')) as int
        ) < 17 then 'Afternoon'
        when cast(
            strftime('%H', datetime(played_at, 'localtime')) as int
        ) < 20 then 'Late afternoon'
        else 'Evening'
    end as playedTimeOfDay
from
    enriched_history