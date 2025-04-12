create database new_project;
use new_project;
ALTER TABLE studentsperformance ADD COLUMN id_student INT PRIMARY KEY AUTO_INCREMENT;
DESCRIBE studentsperformance;

-- 1.Average score in each subject.
select round (avg(mathscore)), round (avg(readingscore)),round (avg(writingscore))from studentsperformance
where 
mathscore IS NOT NULL
AND writingscore IS NOT NULL
AND readingscore IS NOT NULL;

-- 2.How many students took the test preparation course? 
select count(course) from studentsperformance 
where course not like "none%";

-- 3.Is there a relationship between the student doing a test preparation course and the score in the exams?
SELECT round(avg((mathscore+writingscore+readingscore)/3)) as avg_total_score
from studentsperformance
where course IS NOT NULL
        AND course = 'none'
        AND mathscore IS NOT NULL
        AND writingscore IS NOT NULL
        AND readingscore IS NOT NULL;
-- The average score per subject from a student who did not take the preparation course is 65 out of 100.


SELECT 
    ROUND(AVG(mathscore)),
    ROUND(AVG(writingscore)),
    ROUND(AVG(readingscore))
FROM
    students
WHERE
course IS NOT NULL
AND course = 'none'
AND math_score IS NOT NULL
AND writing_score IS NOT NULL
AND reading_score IS NOT NULL;
-- The average score per student who did not take the course is: in math 64 out of 100, in writing 65 out of 100 and finally, in reading 67 out of 100.


SELECT round(avg((mathscore+writingscore+readingscore)/3)) as avg_total_score
from studentsperformance
where course IS NOT NULL
        AND course = 'completed'
        AND mathscore IS NOT NULL
        AND writingscore IS NOT NULL
        AND readingscore IS NOT NULL;
-- The average score per subject from a student who took the preparation course is 73 out of 100.


-- 4.Number of students by gender.
select count(gender) from studentsperformance 
group by gender;
-- There are 518 female and 482 male students.

-- 5.Average score by gender.
SELECT round(avg((mathscore+writingscore+readingscore)/3)) as avg_total_score_female
from studentsperformance
where gender = "female"
        AND mathscore IS NOT NULL
        AND writingscore IS NOT NULL
        AND readingscore IS NOT NULL;
-- The average score per subject for a female student is 70 out of 100. 
        
SELECT round(avg((mathscore+writingscore+readingscore)/3)) as avg_total_score_male
from studentsperformance
where gender = "male"
        AND mathscore IS NOT NULL
        AND writingscore IS NOT NULL
        AND readingscore IS NOT NULL;
-- The average score per subject for a male student is 66 out of 100.


--Average score per subject by gender. 
SELECT 
    ROUND(AVG(mathscore)) as avg_math_female,
    ROUND(AVG(writingscore)) as avg_writing_female,
    ROUND(AVG(readingscore)) as avg_reading_female
FROM
    studentsperformance
WHERE
    gender IS NOT NULL
        AND gender = 'female'
        AND mathscore IS NOT NULL
        AND writingscore IS NOT NULL
        AND readingscore IS NOT NULL;
-- The average score per female student is: in math 64 out of 100, in writing 72 out of 100 and finally, in reading 73 out of 100.

SELECT 
    ROUND(AVG(mathscore)) as avg_math_male,
    ROUND(AVG(writingscore)) as avg_writing_male,
    ROUND(AVG(readingscore)) as avg_reading_male
FROM
    studentsperformance
WHERE
    gender IS NOT NULL
        AND gender = 'male'
        AND mathscore IS NOT NULL
        AND writingscore IS NOT NULL
        AND readingscore IS NOT NULL;
-- The average score per male student is: in math 69 out of 100, in writing 63 out of 100 and finally, in reading 65 out of 100.
        
        
-- 7.Student with the highest total score.
SELECT 
    id_student,
    (mathscore + writingscore + readingscore) AS total_score
FROM
    studentsperformance
ORDER BY total_score DESC  limit 10; 
-- The students with the highest total score are three, they also have a perfect score in all the exams. students with id: 101, 812 and 941.

        
SELECT 
    id_student,
    (mathscore + writingscore + readingscore) AS total_score
FROM
    studentsperformance
ORDER BY total_score ASC limit 5; 
-- The student with the lowest total score in the exams is the student id: 60 and score is 60.

-- 9.What role did ethnicity and educational level from their parents play?
SELECT 
race,parental_education
FROM
    studentsperformance
where id_student in(101, 812 , 941,60);


SELECT 
    race, COUNT(race) AS count_students
FROM
    studentsperformance
GROUP BY race
ORDER BY race ASC; 
-- The group with most amount of students is the C with 319. 
-- The group with less amount of students is the A with 89. 

SELECT 
    parental_education, COUNT(parental_education)
FROM
    studentsperformance
GROUP BY parental_education;
-- Most of parents' education is some college.
-- The least amount of education they have is a master's degree.


SELECT 
    parental_education, COUNT(parental_education)
FROM
    studentsperformance
WHERE
    race = 'group A'
GROUP BY parental_education;
-- Most parents' education in group A is some high school.
-- Most parents' least amount of education in group A is a master degree.



SELECT 
    parental_education, COUNT(parental_education)
FROM
    studentsperformance
WHERE
    race = 'group B'
GROUP BY parental_education;
-- Most parents' education in group B is high school.
-- Most parents' least amount of education in group B is a master degree.



SELECT 
    parental_education, COUNT(parental_education)
FROM
    studentsperformance
WHERE
    race = 'group C'
GROUP BY parental_education;
-- Most parents' education in group C is associate degree.
-- Most parents' least amount of education in group C is a master degree.


SELECT 
    parental_education, COUNT(parental_education)
FROM
    studentsperformance
WHERE
    race = 'group D'
GROUP BY parental_education;
-- Most parents' education in group D is some college.
-- Most parents' least amount of education in group D is a master degree.


SELECT 
    parental_education, COUNT(parental_education)
FROM
    studentsperformance
WHERE
    race= 'group E'
GROUP BY parental_education;

-- Most parents' education in group E is associate degree.
-- Most parents' least amount of education in group E is a master degree.

-- The least obtained level of parental education is a master degree, regardless of ethnicity group.



-- 10.How do ethnicity and lunch behave?
SELECT 
    lunch, COUNT(lunch)
FROM
    studentsperformance
GROUP BY lunch;
-- Most students access the standard lunch.

SELECT 
    lunch, COUNT(lunch) as group_a_lunch
FROM
    studentsperformance
WHERE
    race= 'group A'
GROUP BY lunch;
-- Most students in group A access the standard lunch.



SELECT 
    lunch, COUNT(lunch)
FROM
    studentsperformance
WHERE
    race = 'group B'
GROUP BY lunch;
-- Most students in group B access the standard lunch.

SELECT 
    lunch, COUNT(lunch)
FROM
    studentsperformance
WHERE
    race = 'group C'
GROUP BY lunch;
-- Most students in group C access the standard lunch.

SELECT 
    lunch, COUNT(lunch)
FROM
    studentsperformance
WHERE
    race = 'group D'
GROUP BY lunch;
-- Most students in group D access the standard lunch.

SELECT 
    lunch, COUNT(lunch)
FROM
    studentsperformance
WHERE
    race = 'group E'
GROUP BY lunch;
-- Most students in group E access the standard lunch.

-- Most students, regardless of their group, have access to the standard lunch.






