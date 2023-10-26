# Write your MySQL query statement below

WITH rank_table AS(
SELECT *, RANK() OVER(PARTITION BY customer_id ORDER BY order_date ASC) AS r
FROM Delivery
)

SELECT round(avg(if(order_date=customer_pref_delivery_date,1,0))*100,2) AS immediate_percentage
FROM rank_table
WHERE r = 1;