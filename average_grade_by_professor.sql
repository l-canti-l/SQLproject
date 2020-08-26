use university;

select grades_percentage, professors_name, "avg grade:", sum(grades_percentage)/count(grades_percentage)
from grades
join courses
on grades.grades_course_id = courses.courses_id
join professors
on courses.courses_professor_id = professors.professors_id
group by professors_name;