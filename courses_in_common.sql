use university;

select count(courses_name), courses_name, grades_course_id, grades_professor_id, grades_student_id
from grades
join courses
on grades_course_id = courses_id
group by courses_name;