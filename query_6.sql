SELECT student_name, group_name
FROM students s
JOIN groups g ON s.group_id = g.id
WHERE g.id = 1;