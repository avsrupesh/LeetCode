
select distinct a.product_id, coalesce(b.new_price,10) as price from Products a
left join 
(select *, rank() over(partition by product_id order by change_date DESC) as rnk
from Products
where change_date<='2019-08-16') as b
on a.product_id = b.product_id and rnk=1

/* second solution
WITH t1 AS
(SELECT DISTINCT product_id, MAX(change_date) over (PARTITION BY product_id) last_day
FROM Products
WHERE change_date<='2019-08-16')

select t1.product_id, p.new_price as price
from t1 join Products p
where t1.product_id = p.product_id and t1.last_day = p.change_date

union 

select product_id, 10 as price
from Products 
where product_id not in (select product_id from t1)
*/