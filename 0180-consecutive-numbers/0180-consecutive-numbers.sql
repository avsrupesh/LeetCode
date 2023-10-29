# Write your MySQL query statement below
With cte_num AS (
    Select Num AS V1, 
    LEAD(num,1) Over (order by id) AS V2, 
    LEAD(num,2) Over (order by id) AS V3 From Logs
)


Select distinct V1 AS ConsecutiveNums from cte_num
where V1=V2 and V2=V3
