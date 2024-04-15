WITH StudentGrades AS (
    SELECT s.id, s.student_name, ROUND(AVG(g.grade), 2) as average_grade
    FROM students s
    JOIN grades g ON s.id = g.student_id
    WHERE g.subject_id = 1
    GROUP BY s.id
)
SELECT sg.student_name, sg.average_grade, sub.subject_name
FROM StudentGrades sg
JOIN grades g ON sg.id = g.student_id
JOIN subjects sub ON g.subject_id = sub.id
ORDER BY sg.average_grade DESC
LIMIT 1;