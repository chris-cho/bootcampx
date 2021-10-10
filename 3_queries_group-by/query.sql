SELECT day, count(*) as total_assignments FROM assignments
GROUP BY day
HAVING count(*) >= 10
ORDER BY day;

SELECT cohorts.name as cohort_name, count(students.*) as total_students
FROM cohorts
JOIN students ON students.cohort_id = cohorts.id
GROUP BY cohorts.name
HAVING count(students.*) >= 18
ORDER BY total_students;

SELECT cohorts.name as cohort_name, count(assignment_submissions.*) as submissions_count
FROM cohorts
JOIN students ON cohorts.id = students.cohort_id
JOIN assignment_submissions ON students.id = assignment_submissions.student_id
GROUP BY cohorts.name
ORDER BY submissions_count DESC;

SELECT students.name as student_name, avg(assignment_submissions.duration) as average_assignment_duration
FROM students
JOIN assignment_submissions ON students.id = assignment_submissions.student_id
WHERE students.end_date IS NULL
GROUP BY students.name
ORDER BY average_assignment_duration DESC;

SELECT students.name as student_name, avg(assignment_submissions.duration) as average_assignment_duration, avg(assignments.duration) as average_estimated_duration
FROM students
JOIN assignment_submissions ON students.id = assignment_submissions.student_id
JOIN assignments ON assignments.id = assignment_submissions.assignment_id
WHERE students.end_date IS NULL
GROUP BY students.name
HAVING avg(assignment_submissions.duration) < avg(assignments.duration)
ORDER BY average_assignment_duration;

