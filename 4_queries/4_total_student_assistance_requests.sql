SELECT name, COUNT(*) as total_assitance
FROM assistance_requests
INNER JOIN students ON students.id = assistance_requests.student_id
WHERE students.name = 'Elliot Dickinson'
GROUP BY students.name;