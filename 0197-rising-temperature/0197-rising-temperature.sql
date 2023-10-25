# Write your MySQL query statement below
select W2.id
from Weather W1 join Weather W2
where W1.temperature < W2.temperature and W2.recordDate - interval 1 day = W1.recordDate;