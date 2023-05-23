SELECT c.name AS name, AVG(ar.completed_at - ar.started_at) AS average_assistance_request_time
FROM assistance_requests ar
JOIN students s ON ar.student_id = s.id
JOIN cohorts c ON s.cohort_id = c.id
GROUP BY c.name
ORDER BY average_assistance_request_time DESC
LIMIT 1;
