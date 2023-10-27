# Write your MySQL query statement below

with CTE as (
    select employee_id, count(department_id) as cnt
    from Employee
    group by employee_id
)

select employee_id, department_id
from Employee
where employee_id in (select employee_id from CTE where cnt=1)
union
select employee_id, department_id
from Employee
where primary_flag='Y'