
-- subjectwise record display
DECLARE 
s_id attendence.student_idstudent%type; 
s_present number(3); 
CURSOR student_present is select student_idstudent, count(student_idstudent) from attendence where status like 'Present' and student_subject_subjectid like 102 group by student_idstudent;

s1_id attendence.student_idstudent%type; 
s1_total number(3); 
CURSOR student_total is select student_idstudent, count(student_idstudent) from attendence where student_subject_subjectid like 102 group by student_idstudent;

BEGIN 
OPEN student_present; 
OPEN student_total;
LOOP 
FETCH student_present into s_id, s_present;
FETCH student_total into s1_id, s1_total;
EXIT WHEN student_present%notfound;  
dbms_output.put_line('student '|| s_id || ' has ' ||S_present/s1_total*100 || '% record' ); 
END LOOP; 

CLOSE student_present; 
CLOSE student_total; 

END; 
/


--

CREATE PROCEDURE make is
c        NUMBER(4);
c1       NUMBER(4);
CURSOR cur1 IS SELECT student_idstudent, count(CASE WHEN  status = 'Present'  then 1 END)/count(*)*100 as percentage FROM attendence where student_subject_subjectid = 102 group by student_idstudent;
BEGIN
execute immediate 'truncate table myatt';
OPEN cur1;
LOOP
FETCH cur1 into c,c1;
EXIT WHEN cur1%NOTFOUND;
insert into myatt values(c,c1);
END LOOP;
CLOSE cur1;
END make;
/