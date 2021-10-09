CREATE TABLE assignment_submissions (
  id SERIAL PRIMARY KEY NOT NULL, 
  assignment_id SERIAL NOT NULL, 
  student_id SERIAL NOT NULL, 
  submission_date DATE, 
  duration INTEGER
);

CREATE TABLE assignments (
  id SERIAL PRIMARY KEY NOT NULL,
  name varchar(255), 
  content varchar(255), 
  duration INTEGER, 
  day INTEGER, 
  chapter INTEGER
)