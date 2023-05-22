SELECT cohorts.name as cohort_name, COUNT(*) as total_students
FROM cohorts
JOIN students ON cohorts.id = students.cohort_id
GROUP BY cohorts.name
HAVING COUNT(*) >= 18
ORDER BY total_students;
