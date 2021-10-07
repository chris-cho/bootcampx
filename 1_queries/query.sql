SELECT id, name 
FROM students 
WHERE cohort_id = 1
ORDER BY name;

SELECT count(id)
FROM students 
WHERE cohort_id IN (1,2,3);

SELECT name, name, id, cohort_id
FROM students
WHERE email NOT LIKE '%gmail.com'
OR phone IS NULL;