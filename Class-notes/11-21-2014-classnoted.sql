USE MADEIRA_COLLEGE_REGISTRATION
go

SELECT count(*)
FROM STUDENT

--cross join or cross product
-- 16 student records
-- 11 recorda for takes
-- 3+5 cols, 11*16 records=176
SELECT *
FROM STUDENT, TAKES

--add a where (join condition on where to match table)
SELECT *
FROM STUDENT, TAKES
WHERE student.sid = takes.sid

--CARTESIAN product
--if really want a cross product use CROSS JOIN
--176 rcords... but know that is what they want, they didnt forget a where
SELECT count(*)
FROM student CROSS JOIN takes

--list of students and grades
-- 8 columns only where student takes class... 11
SELECT *
FROM STUDENT
INNER JOIN TAKES 
ON student.sid = takes.sid

--just 3 columns
SELECT name, section#, grade
FROM STUDENT
INNER JOIN TAKES 
ON student.sid = takes.sid

--alias table name
SELECT name, section#, grade
FROM STUDENT s
Inner JOIN TAKES t
ON s.sid = t.sid

--sort by first name
SELECT name, section#, grade
FROM STUDENT s
Inner JOIN TAKES t
ON s.sid = t.sid
ORDER BY name

-- need course name
-- need other tables... follow lines on db schema
-- 14 cols, 11 records
SELECT *
	FROM STUDENT s
    Inner JOIN TAKES t
		ON s.sid = t.sid
	INNER JOIN SECTION ss
		ON ss.section# = t.section#
ORDER BY name

--add another table
-- 11 records driven by takes
SELECT s.name, t.section#, ss.course#, c.name,t.grade
	FROM STUDENT s
    Inner JOIN TAKES t
		ON s.sid = t.sid
	INNER JOIN SECTION ss
		ON ss.section# = t.section#
	INNER JOIN COURSE c
		ON c.course# = ss.course#
ORDER BY s.name

--2 columns with the name 'name' for course & student
--can change name in resul
--AS is optional
SELECT s.name AS student_name, t.section#, ss.course#, c.name AS course_name,t.grade
	FROM STUDENT s
    Inner JOIN TAKES t
		ON s.sid = t.sid
	INNER JOIN SECTION ss
		ON ss.section# = t.section#
	INNER JOIN COURSE c
		ON c.course# = ss.course#
ORDER BY s.name

-- without AS
SELECT s.name  student_name, t.section#, ss.course#, c.name  course_name,t.grade
	FROM STUDENT s
    Inner JOIN TAKES t
		ON s.sid = t.sid
	INNER JOIN SECTION ss
		ON ss.section# = t.section#
	INNER JOIN COURSE c
		ON c.course# = ss.course#
ORDER BY s.name

--you can filter with a WHERE clause for students with A
-- and last name begins with K (test question)
SELECT s.name  student_name, t.section#, ss.course#, c.name  course_name,t.grade
	FROM STUDENT s
    Inner JOIN TAKES t
		ON s.sid = t.sid
	INNER JOIN SECTION ss
		ON ss.section# = t.section#
	INNER JOIN COURSE c
		ON c.course# = ss.course#
WHERE t.grade = 'A' AND s.name LIKE '% K%'
ORDER BY s.name

--name has an "o" for second letter in first name
SELECT s.name  student_name, t.section#, ss.course#, c.name  course_name,t.grade
	FROM STUDENT s
    Inner JOIN TAKES t
		ON s.sid = t.sid
	INNER JOIN SECTION ss
		ON ss.section# = t.section#
	INNER JOIN COURSE c
		ON c.course# = ss.course#
WHERE  s.name LIKE '_o%'
ORDER BY s.name

--anything but o... NOT
SELECT s.name  student_name, t.section#, ss.course#, c.name  course_name,t.grade
	FROM STUDENT s
    Inner JOIN TAKES t
		ON s.sid = t.sid
	INNER JOIN SECTION ss
		ON ss.section# = t.section#
	INNER JOIN COURSE c
		ON c.course# = ss.course#
WHERE s.name NOT LIKE '_o%'
ORDER BY s.name

SELECT s.name  student_name, t.section#, ss.course#, c.name  course_name,t.grade
	FROM STUDENT s
    Inner JOIN TAKES t
		ON s.sid = t.sid
	INNER JOIN SECTION ss
		ON ss.section# = t.section#
	INNER JOIN COURSE c
		ON c.course# = ss.course#
WHERE s.name LIKE '_[abcdefghijklmnpqrstuvwxyz]'
ORDER BY s.name

SELECT s.name  student_name, t.section#, ss.course#, c.name  course_name,t.grade
	FROM STUDENT s
    Inner JOIN TAKES t
		ON s.sid = t.sid
	INNER JOIN SECTION ss
		ON ss.section# = t.section#
	INNER JOIN COURSE c
		ON c.course# = ss.course#
WHERE s.name LIKE '_[^o]%'
ORDER BY s.name

-- Like 'x% %[^a]'


--all students never taken class
--using subquery
SELECT *
	FROM STUDENT s
	WHERE s.sid NOT IN ( select sid from takes)

--in class subquery
SELECT *
	FROM STUDENT s
	WHERE s.sid IN ( select sid from takes)

-- 
	SELECT s.sid, s.name, t.grade, t.section#
	FROM STUDENT s
	INNER JOIN takes t
	on s.sid = t.sid


--both in & out... outer join... puts NULL... returns all
SELECT s.sid, s.name, t.grade, t.section#
	FROM STUDENT s
	LEFT OUTER JOIN takes t
	on s.sid = t.sid

	--IS NUll = not taking class
	--left outer join prefered way instead of subquery
	--on test students not taking class
	--in subqurey and outer join
SELECT s.sid, s.name, t.grade, t.section#
	FROM STUDENT s
	LEFT OUTER JOIN takes t
	on s.sid = t.sid
	WHERE t.section# IS NULL

--GET MAX salary by department
SELECT dcode, 
	name, 
	(select MAX(p.salary)  FROM PROFESSOR p WHERE p.dcode = d.dcode) AS max_salary
FROM DEPARTMENT d

--
SELECT dcode, 
	name, 
	(select MAX(p.salary)  FROM PROFESSOR p WHERE p.dcode = d.dcode) AS max_salary
	,(select AVG(p.salary)  FROM PROFESSOR p WHERE p.dcode = d.dcode) AS avg_salary
FROM DEPARTMENT d

--subqueries in the from clause
SELECT *
FROM(SELECT dcode, 
	name, 
	(select MAX(p.salary)  FROM PROFESSOR p WHERE p.dcode = d.dcode) AS max_salary
	,(select AVG(p.salary)  FROM PROFESSOR p WHERE p.dcode = d.dcode) AS avg_salary
	
FROM DEPARTMENT d)AS M

--to add name had to add group by
SELECT name, max(max_salary - avg_salary) as Max_disparity
FROM(SELECT dcode, 
	name, 
	(select MAX(p.salary)  FROM PROFESSOR p WHERE p.dcode = d.dcode) AS max_salary
	,(select AVG(p.salary)  FROM PROFESSOR p WHERE p.dcode = d.dcode) AS avg_salary
	
FROM DEPARTMENT d)AS M
GROUP By name