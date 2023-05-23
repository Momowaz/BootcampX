SELECT AVG(total_duration) AS average_total_duration
FROM (
  SELECT c.name AS cohort_name, SUM(ar.completed_at - ar.started_at) AS total_duration
  FROM assistance_requests ar
  JOIN students s ON ar.student_id = s.id
  JOIN cohorts c ON s.cohort_id = c.id
  GROUP BY c.name
) subquery;
