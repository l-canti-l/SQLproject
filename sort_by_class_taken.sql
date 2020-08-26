use university;

select students_name, courses_name
from grades
join courses
on grades_course_id = courses_id
join students
on grades_student_id = students_id;