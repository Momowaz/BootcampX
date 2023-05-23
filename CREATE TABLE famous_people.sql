CREATE TABLE students (
  id SERIAL PRIMARY KEY,
  cohort_id INTEGER REFERENCES cohorts(id),
  student_name VARCHAR(50),
  student_email VARCHAR(50),
  student_phone VARCHAR(15),
  student_github VARCHAR(50),
  student_start_date VARCHAR(50),
  student_end_date VARCHAR(50)
);


CREATE TABLE cohorts (
  id SERIAL PRIMARY KEY,
  student_name VARCHAR(50),
  start_date VARCHAR(50),
  end_date VARCHAR(50)
);