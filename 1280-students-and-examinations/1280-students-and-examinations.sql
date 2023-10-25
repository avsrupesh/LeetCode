# Write your MySQL query statement below
select s.student_id, s.student_name, sb.subject_name, count(e.student_id) as attended_exams
from (Students s, Subjects sb) left outer join Examinations e
on s.student_id = e.student_id and sb.subject_name = e.subject_name
group by s.student_id, sb.subject_name
order by student_id asc, subject_name asc;