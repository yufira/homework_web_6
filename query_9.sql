WITH StudentSubject AS (
    SELECT sb.id, s.student_name, sb.subject_name, g.student_id, g.subject_id
    FROM students s
    JOIN grades g
    ON s.id = g.student_id
    JOIN subjects sb ON sb.id = g.subject_id
    WHERE s.id = 1
    GROUP BY sb.id, s.student_name
)
SELECT student_name, subject_name
from StudentSubject;