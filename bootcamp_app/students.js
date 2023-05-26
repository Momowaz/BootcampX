const { Client } = require('pg');

const client = new Client({
  user: 'postgres',
  password: '123',
  host: 'localhost',
  database: 'bootcampx'
});

const cohortName = process.argv[2] || 'JUL02';
const limit = process.argv[3] || 5;

const query = `
SELECT students.id, students.name AS student_name, cohorts.name AS cohort_name
FROM students
JOIN cohorts ON cohorts.id = students.cohort_id
WHERE cohorts.name LIKE $1
LIMIT $2;
`;

const values = [`%${cohortName}%`, limit];

async function runQuery() {
  try {
    await client.connect();
    const res = await client.query(query, values);
    res.rows.forEach(student => {
      console.log(`${student.student_name} has an id of ${student.id} and is in the ${student.cohort_name} cohort`);
    });
  } catch (err) {
    console.error('Error executing query', err);
  } finally {
    await client.end();
  }
}

runQuery();