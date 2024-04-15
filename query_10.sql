WITH TeacherStudent AS (
    SELECT t.id AS teacher_id, t.teacher_name, sb.subject_name, sb.id AS subject_id
    FROM teachers t
    JOIN subjects sb ON sb.teacher_id = t.id
)
SELECT ts.subject_name, ts.teacher_name, s.student_name
FROM TeacherStudent ts
JOIN grades g ON g.subject_id = ts.subject_id
JOIN students s ON s.id = g.student_id
WHERE ts.teacher_id = 1 AND s.id = 1;
