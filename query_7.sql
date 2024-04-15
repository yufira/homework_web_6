WITH StudentGrades AS (
    SELECT s.id AS student_id, s.student_name, g.grade, g.subject_id, s.group_id
    FROM grades g
    JOIN students s ON g.student_id = s.id
)
SELECT sg.student_name, sg.grade, gr.group_name, sb.subject_name
FROM StudentGrades sg
JOIN groups gr ON gr.id = sg.group_id
JOIN subjects sb ON sb.id = sg.subject_id
WHERE sg.subject_id = 1;