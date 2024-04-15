WITH GroupGrades AS (
    SELECT gr.id, gr.group_name, ROUND(AVG(g.grade), 2) as average_grade, g.subject_id
    FROM groups gr
    JOIN students st
    ON gr.id = st.group_id
    JOIN grades g
    ON g.student_id = st.id
    WHERE g.subject_id = 1
    GROUP BY gr.id
)
SELECT subject_name, gg.group_name, gg.average_grade
FROM GroupGrades gg
JOIN subjects sub
ON gg.subject_id = sub.id;
