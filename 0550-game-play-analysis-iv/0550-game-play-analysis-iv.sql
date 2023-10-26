# Write your MySQL query statement below

with cte as(
    select player_id, min(event_date) as firstlog
    from Activity
    group by player_id
)

select round(sum(case when a.event_date-interval 1 day=c.firstlog then 1 else 0 end)/count(distinct c.player_id),2) as fraction
from cte c join Activity a
on c.player_id = a.player_id

/*

with cte as(
    select 
        player_id, 
        device_id, 
        First_value(event_date) over(partition by player_id order by event_date) first_log,
        Lead(event_date) over(partition by player_id order by event_date) second_log
    from Activity
)

Select round(COUNT(CASE WHEN first_log+1=second_log THEN player_id END)/count(distinct player_id),2) as fraction
from cte

*/