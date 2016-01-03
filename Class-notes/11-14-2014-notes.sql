Select * 
FROM DEPARTMENT

SELECT dcode, phone
FROM DEPARTMENT

SELECT dcode, phone,college
from DEPARTMENT
Where college = 'Business' OR college = 'Engineering'

SELECT dcode, phone,college
from DEPARTMENT
Where NOT(college = 'Business' OR college = 'Engineering')

SELECT dcode, phone,college
from DEPARTMENT
Where (college != 'Business' AND college != 'Engineering')


SELECT dcode, phone,college
from DEPARTMENT
Where (college <> 'Business' AND college <> 'Engineering')

SELECT dcode, phone,college
from DEPARTMENT
Where len(college) > 10;

select * 
from PROFESSOR

select name, phone, salary
from PROFESSOR
where salary > 50000

select name, salary, phone
from PROFESSOR
--where name like 'A%'
--where name like '% C%'
--where Name like '_a%'
where name like '% _[ai]%';

select * 
from STUDENT
where address IS NULL

select * 
from STUDENT
where address IS not NULL



select *
from STUDENT
where grade_level = 'SR'

select count(*)
from STUDENT
where grade_level = 'SR'

select count(*)
from STUDENT
where grade_level = 'SR'
--incorrect: or  grade_level = 'JR'

select Grade_level, Count(*)
from student
group by grade_level
