use university;

select courses_name as "Course Name", sum(grades_percentage)/count(grades_percentage) as "AVG GRADE"
from grades
join courses
on grades_course_id = courses_id
group by courses_name
order by sum(grades_percentage)/count(grades_percentage) asc;