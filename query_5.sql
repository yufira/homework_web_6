SELECT s.subject_name, t.teacher_name
FROM subjects s
JOIN teachers t ON s.teacher_id = t.id
WHERE s.teacher_id = 1;

