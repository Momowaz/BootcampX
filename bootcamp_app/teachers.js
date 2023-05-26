const { Client } = require('pg');

const client = new Client({
  user: 'postgres',
  password: '123',
  host: 'localhost',
  database: 'bootcampx'
});

const cohortName = process.argv[2] || 'JUL02';

const query = `
SELECT DISTINCT teachers.name AS teacher_name, cohorts.name AS cohort_name
FROM teachers
JOIN assistance_requests ON teachers.id = assistance_requests.teacher_id
JOIN students ON students.id = assistance_requests.student_id
JOIN cohorts ON cohorts.id = students.cohort_id
WHERE cohorts.name LIKE $1
ORDER BY teacher_name;
`;

const values = [`%${cohortName}%`];

async function runQuery() {
  try {
    await client.connect();
    const res = await client.query(query, values);
    res.rows.forEach(teacher => {
      console.log(`${teacher.teacher_name} is the teacher for the ${teacher.cohort_name} cohort`);
    });
  } catch (err) {
    console.error('Error executing query', err);
  } finally {
    await client.end();
  }
}

runQuery();
