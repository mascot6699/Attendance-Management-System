
-- -----------------------------------------------------
-- Table    login 
-- -----------------------------------------------------
CREATE  TABLE     login  (
   username  VARCHAR(30) NOT NULL ,
   password  VARCHAR(30) NULL ,
   usertype  VARCHAR(30) NULL ,
  PRIMARY KEY ( username ) );
 


-- -----------------------------------------------------
-- Table    teacher 
-- -----------------------------------------------------
CREATE  TABLE     teacher  (
   teacherid  INT NOT NULL ,
   teachername  VARCHAR(45) NULL ,
   Login_username  VARCHAR(30) NOT NULL ,
  PRIMARY KEY ( teacherid ) ,
  CONSTRAINT  fk_teacher_Login 
    FOREIGN KEY ( Login_username  )
    REFERENCES    login  ( username  )
    ON DELETE CASCADE
   );
 


-- -----------------------------------------------------
-- Table    subject 
-- -----------------------------------------------------
CREATE  TABLE     subject  (
   subjectid  INT NOT NULL ,
   subjectname  VARCHAR(45) NULL ,
  PRIMARY KEY ( subjectid ) );
 


-- -----------------------------------------------------
-- Table    teaches 
-- -----------------------------------------------------
CREATE  TABLE     teaches  (
   teacher_teacherid  INT NOT NULL ,
   subject_idsubject  INT NOT NULL ,
  PRIMARY KEY ( teacher_teacherid ,  subject_idsubject ) ,
  CONSTRAINT  fk_teacher_teacher1 
    FOREIGN KEY ( teacher_teacherid  )
    REFERENCES    teacher  ( teacherid  )
    ON DELETE CASCADE
   ,
  CONSTRAINT  fk_teacher_subject1 
    FOREIGN KEY ( subject_idsubject  )
    REFERENCES    subject  ( subjectid  )
    ON DELETE CASCADE
   );
 


-- -----------------------------------------------------
-- Table    student 
-- -----------------------------------------------------
CREATE  TABLE     student  (
   idstudent  INT NOT NULL ,
   studentname  VARCHAR(45) NULL ,
   dept  VARCHAR(45) NULL ,
   semester  VARCHAR(45) NULL ,
   subject_subjectid  INT NOT NULL ,
  PRIMARY KEY ( idstudent ,  subject_subjectid ) ,
  CONSTRAINT  fk_student_subject1 
    FOREIGN KEY ( subject_subjectid  )
    REFERENCES    subject  ( subjectid  )
    ON DELETE CASCADE
   );
 


-- -----------------------------------------------------
-- Table    attendence 
-- -----------------------------------------------------
CREATE  TABLE     attendence  (
   date1  DATE NULL ,
   status  VARCHAR(45) NULL ,
   student_idstudent  INT NOT NULL ,
   student_subject_subjectid  INT NOT NULL ,
  CONSTRAINT  fk_attendence_student1 
    FOREIGN KEY ( student_idstudent  ,  student_subject_subjectid  )
    REFERENCES    student  ( idstudent  ,  subject_subjectid  )
    ON DELETE CASCADE
   );

-- not used because of normalize

CREATE SEQUENCE dept_seq;

CREATE OR REPLACE TRIGGER student_inc 
BEFORE INSERT ON student 
FOR EACH ROW

BEGIN
  SELECT dept_seq.NEXTVAL
  INTO   :new.idstudent
  FROM   dual;
END;
/