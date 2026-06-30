use college_db;
-- TASK 1
-- departments
INSERT INTO departments (dept_name, head_of_dept, budget) VALUES
  ('Computer Science', 'Dr. Ramesh Kumar', 850000.00),
  ('Electronics', 'Dr. Priya Nair', 620000.00),
  ('Mechanical', 'Dr. Suresh Iyer', 540000.00),
  ('Civil', 'Dr. Ananya Sharma', 430000.00);
-- students
INSERT INTO students (first_name, last_name, email, date_of_birth, department_id, 
enrollment_year) VALUES
  ('Arjun',  'Mehta',    'arjun.mehta@college.edu',    '2003-04-12', 1, 2022),
  ('Priya',  'Suresh',   'priya.suresh@college.edu',   '2003-07-25', 1, 2022),
  ('Rohan',  'Verma',    'rohan.verma@college.edu',    '2002-11-08', 2, 2021),
  ('Sneha',  'Patel',    'sneha.patel@college.edu',    '2004-01-30', 3, 2023),
  ('Vikram', 'Das',      'vikram.das@college.edu',     '2003-09-14', 1, 2022),
  ('Kavya',  'Menon',    'kavya.menon@college.edu',    '2002-05-17', 2, 2021),
  ('Aditya', 'Singh',    'aditya.singh@college.edu',   '2004-03-22', 4, 2023),
  ('Deepika','Rao',      'deepika.rao@college.edu',    '2003-08-09', 1, 2022);
-- courses
INSERT INTO courses (course_name, course_code, credits, department_id) VALUES
  ('Data Structures & Algorithms', 'CS101', 4, 1),
  ('Database Management Systems',  'CS102', 3, 1),
  ('Object Oriented Programming',  'CS103', 4, 1),
  ('Circuit Theory',               'EC101', 3, 2),
  ('Thermodynamics',               'ME101', 3, 3);
-- enrollments
INSERT INTO enrollments (student_id, course_id, enrollment_date, grade) VALUES
  (1, 1, '2022-07-01', 'A'), (1, 2, '2022-07-01', 'B'),
  (2, 1, '2022-07-01', 'B'), (2, 3, '2022-07-01', 'A'),
  (3, 4, '2021-07-01', 'A'), (4, 5, '2023-07-01', NULL),
  (5, 1, '2022-07-01', 'C'), (5, 2, '2022-07-01', 'A'),
  (6, 4, '2021-07-01', 'B'), (7, 5, '2023-07-01', NULL),
  (8, 1, '2022-07-01', 'A'), (8, 3, '2022-07-01', 'B');
-- professors
INSERT INTO professors (prof_name, email, department_id, salary) VALUES
  ('Dr. Anand Krishnan',  'anand.k@college.edu',   1, 95000.00),
  ('Dr. Meena Pillai',    'meena.p@college.edu',   1, 88000.00),
  ('Dr. Sunil Rajan',     'sunil.r@college.edu',   2, 82000.00),
  ('Dr. Latha Gopal',     'latha.g@college.edu',   3, 79000.00),
  ('Dr. Kartik Bose',     'kartik.b@college.edu',  4, 76000.00);
  
select count(*) from students;
insert into students (first_name,last_name,email,date_of_birth,department_id,enrollment_year) values
('Dharun','KG','dharunganesh2006@gmail.com','2006-05-21',1,2023),
('Mithun','KG','mithunganesh2009@gmail.com','2009-09-16',2,2026);
select count(*) from students;
update enrollments set grade='B' where student_id=5 and course_id=1;
select count(*) from enrollments;
delete from enrollments where grade is null;
select count(*) from enrollments;

-- TASK 2
select * from students where enrollment_year=2022 order by last_name;
select * from courses where credits>3 order by credits desc;
select * from professors where salary between 80000 and 95000;
select * from students where email like '%@college.edu';
select enrollment_year,count(*) from students group by enrollment_year;

-- TASK 3
select concat(first_name,' ',last_name) as full_name, d.dept_name from students s join departments d on s.department_id=d.department_id;
select e.enrollment_date,e.grade,s.first_name,s.last_name,c.course_name from enrollments e join students s using(student_id) join courses c using(course_id);
select * from students left join enrollments using(student_id) where course_id is null;
select course_name,count(*) from courses left join enrollments using(course_id) group by course_name;
select d.dept_name,p.prof_name,p.salary from departments d left join professors p using(department_id);

-- TASK 4
select c.course_name,count(*) as enrollment_count from courses c left join enrollments e using(course_id) group by c.course_name;
select round(avg(salary),2) as average_salary from professors;
select * from departments where budget>600000;
select e.grade,count(*) from enrollments e join courses c using(course_id) where course_code='CS101' group by e.grade;
select dept_name,count(distinct student_id) from students join enrollments using(student_id) join departments using(department_id) group by dept_name having(count(*)>2);