-- REVIEW:
-- Given a table named student_grades with columns student_id, subject, and grade, write a SQL query to find the average grade for each subject. 
  -- If a student has a missing grade in a subject, consider it as 'N/A' in the result.

-- It seems the question is missing or there is something wrong. What does he wants ? The average by student by suject ?

CREATE TABLE Student_grades (
  student_id int,
  subject varchar(50), 
  grade decimal(4,2)
);

INSERT INTO Student_grades(student_id, subject, grade) VALUES (1, 'Math', 5.0);
INSERT INTO Student_grades(student_id, subject, grade) VALUES (1, 'Math', 6.0);
INSERT INTO Student_grades(student_id, subject, grade) VALUES (1, 'Geo', 9.0);
INSERT INTO Student_grades(student_id, subject, grade) VALUES (1, 'History', 8.0);

INSERT INTO Student_grades(student_id, subject, grade) VALUES (2, 'Math', 10.0);
INSERT INTO Student_grades(student_id, subject, grade) VALUES (2, 'Geo', 9.5);
INSERT INTO Student_grades(student_id, subject, grade) VALUES (2, 'History', 8.0);
INSERT INTO Student_grades(student_id, subject, grade) VALUES (2, 'Physics', 3.0);
INSERT INTO Student_grades(student_id, subject, grade) VALUES (3, 'Math', null);

-- My incomplete answer:
-- SELECT COALESCE(AVG(grade), 'N/A') FROM student_grades s
-- WHERE s.grade in (SELECT DISTINCT grade from student_grades)
-- GROUP BY student_id, subject

-- Is it ?
-- select subject, coalesce(avg(grade), 'N/A') from student_grades group by subject

-- What I think we wanted. 
-- select student_id, subject, coalesce(avg(grade), 'N/A') from student_grades group by student_id, subject

-- But if I want all subjects and the ones a student does not have a grade we output eg. student_id, grade, 'N/A' ?
-- SELECT DISTINCT subject from student_grades

-- SELECT a.student_id, a.subject  FROM student_grades a 
-- left join student_grades b
-- on a.student = b.subject

-- SELECT s.student_id, s.subject  FROM student_grades s
-- left join 
-- ( SELECT DISTINCT subject FROM student_grades ) as ss
-- on s.subject = ss.subject


-- chat gpt
-- SELECT subject,
--       AVG(CASE 
--             WHEN grade IS NOT NULL THEN grade 
--             ELSE NULL 
--           END) AS average_grade
-- FROM student_grades
-- GROUP BY subject;

SELECT ss.subject, s.student_id, s.grade  FROM (SELECT DISTINCT subject FROM student_grades) as ss  
left join 
student_grades s
on ss.subject = s.subject