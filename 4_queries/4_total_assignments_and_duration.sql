SELECT day, COUNT(*) as total_assignments, SUM(duration) as total_duration
FROM assignments
GROUP BY day
ORDER BY day;