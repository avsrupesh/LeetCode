# Write your MySQL query statement below


select E.name, bonus
from Employee E left outer join Bonus B
on E.empID = B.empID 
where bonus <1000 or bonus is null;