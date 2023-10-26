# Write your MySQL query statement below

with cte as (
   select *, First_value(year) over(partition by product_id order by year) as r
   from Sales
)

select product_id, year as first_year, quantity, price
from cte
where year=r


