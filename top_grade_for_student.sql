use university;

select students_id, students_name, max(grades_percentage)
from grades
join students
on grades_student_id = students_id
group by students_id;