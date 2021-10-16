const { Pool } = require('pg');

const pool = new Pool({
  user: 'chris',
  password: '123',
  host: 'localhost',
  database: 'bootcampx'
});

pool.query(`
SELECT teachers.name as teacher, cohorts.name as cohort, count(assistance_requests) as total_assistances
FROM teachers
JOIN assistance_requests ON teacher_id = teachers.id
JOIN students ON student_id = students.id
JOIN cohorts ON cohort_id = cohorts.id
WHERE cohorts.name = $1
GROUP BY teachers.name, cohorts.name
ORDER BY teacher;
`, [process.argv[2]])
.then(res => {
  res.rows.forEach(user => {
    console.log(`${user.teacher} assisted a total of ${user.total_assistances} times and was in the ${user.cohort} cohort`);
  })
});