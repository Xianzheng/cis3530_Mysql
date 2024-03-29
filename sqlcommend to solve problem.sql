a.

σ Offering.cNum = 3530 Offering

b.

τ Offering.cNum desc π Offering.cNum, Course.name, Offering.term (σ Course.cNum = Offering.cNum and Offering.year = 2016 and Course.dept = 'CIS'
(Course ⨯ Offering))

c.

π Course.name (σ Offering.instructor = 'Ritu' and Course.cNum = Offering.cNum and Course.dept = 'CIS' (Offering ⨯ Course))

d.

π Student.sID, Student.firstName, Student.lastName, Student.email, Student.cgpa (σ Student.sID = Took.sID and Offering.oID = Took.oID and Offering.cNum = 3530 (Course ⨯ Student ⨯ Took ⨯ Offering))

e.

(π Student.sID, Student.firstName, Student.lastName, Student.email, Student.cgpa (Course ⨯ Student ⨯ Took ⨯ Offering)) - ( π Student.sID, Student.firstName, Student.lastName, Student.email, Student.cgpa (σ Student.sID = Took.sID and Offering.oID = Took.oID and Offering.cNum = 3530 (Course ⨯ Student ⨯ Took ⨯ Offering)))

f.

π Student.sID, Student.firstName, Student.lastName, Student.email, Student.cgpa (σ Student.sID = Took.sID and Offering.oID = Took.oID and Offering.dept = 'HIS' (Course ⨯ Student ⨯ Took ⨯ Offering))

g.
π Student.firstName, Student.lastName, Student.cgpa (σ Offering.cNum = 2070 and Student.cgpa ≥ 3 (Student ⨝ Student.sID = Took.sID (Took ⨝ Offering.oID = Took.oID (Offering))))

h.
π Course.cNum, Course.dept, Offering.dept, Offering.year, Offering.term (Course ⟗ Offering.cNum = Course.cNum and Offering.dept = Course.dept Offering)

i.
Find the Course 2630 Offering in 2017
σ Course.cNum = Offering.cNum and Offering.year = 2017 and Course.cNum = 2630 (Course ⨯ Offering)


2.
a.
SELECT *
FROM Offering
WHERE Offering.cNum=3530;

b.
SELECT DISTINCT Offering.cNum, Course.name, 
Offering.term
FROM Course, Offering
WHERE Course.cNum = Offering.cNum
and Offering.year=2016
and Course.dept='CIS'
ORDER BY Offering.cNum desc;

c.
SELECT DISTINCT Course.cNum, Course.name
FROM Offering, Course
Where Offering.instructor = 'Ritu'
and Course.cNum=Offering.cNum
and Course.dept='CIS';

d.
SELECT Distinct Student.*
FROM Course, Student, Took, Offering
WHERE Student.sID = Took.sID
AND Offering.oID = Took.oID
And Offering.cNum=3530;

e.
SELECT Student.*
FROM Course, Student, Took, Offering
EXCEPT
(Select Student.*
 From Course, Student, Took, Offering
 WHERE Student.sID = Took.sID
AND Offering.oID = Took.oID
And Offering.cNum=3530);

f.
Select Distinct Student.*
 From Course, Student, Took, Offering
 WHERE Student.sID = Took.sID
AND Offering.oID = Took.oID
And Offering.dept='HIS';

g.
select distinct Offering.cNum,Offering.dept,Course.cNum,Course.dept 
from Offering inner join Course on Offering.cNum = Course.cNum and Offering.dept != Course.dept ;


h.
select Course.cNum, Course.dept, Offering.dept, Offering.year, Offering.term 
from Course full join Offering on Offering.cNum = Course.cNum
and Offering.dept = Course.dept;


i.
SELECT Student.sID ,Student.lastName, Student.firstName,count(Student.sID)
FROM Student, Took, Offering
Where Offering.oID= Took.oID
and Student.sID = Took.sID
and Offering.cNum=3530
Group by Student.sID, Student.lastName, Student.firstName having count(Student.sID)>=2
Order by Student.lastName;

j.
SELECT Offering.cNum, Course.name, count(Offering.cNum)
FROM Student, Offering, Took, Course
WHERE Offering.year=2017
AND Student.sID = Took.sID
AND Offering.term='F'
AND Offering.oID = Took.oID
AND Offering.dept= Course.dept
AND Course.cNum = Offering.cNum
group by Offering.cNum, Course.name
Order by Offering.cNum;

k)
update Offering 
SET instructor ='Harry' 
WHERE Offering.cNum = 3530
and Offering.dept = 'CIS';

l)
Delete 
FROM Took
WHERE Took.oID in
	(SELECT Offering.oID
	FROM Offering
	WHERE Offering.instructor='Ritu')

DELETE From Offering
Where Offering.instructor='Ritu';




