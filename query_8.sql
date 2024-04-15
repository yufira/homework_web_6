WITH TeacherGrade AS (
    SELECT g.grade, g.subject_id, t.teacher_name, ROUND(AVG(g.grade), 2) as average_grade
    FROM grades g
    JOIN subjects s ON g.subject_id = s.id
    JOIN teachers t
    WHERE s.teacher_id = t.id AND t.id = 1
)
SELECT average_grade, teacher_name
from TeacherGrade;