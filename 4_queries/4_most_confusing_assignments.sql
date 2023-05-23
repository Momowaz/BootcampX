SELECT a.id, a.name, a.day, a.chapter, COUNT(ar.id) AS total_assistances
FROM assignments a
LEFT JOIN assistance_requests ar ON a.id = ar.assignment_id
GROUP BY a.id, a.name, a.day, a.chapter
ORDER BY total_assistances DESC;
