SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`login`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `mydb`.`login` (
  `username` VARCHAR(30) NOT NULL ,
  `password` VARCHAR(30) NULL ,
  `usertype` VARCHAR(30) NULL ,
  PRIMARY KEY (`username`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`teacher`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `mydb`.`teacher` (
  `teacherid` INT NOT NULL ,
  `teachername` VARCHAR(45) NULL ,
  `Login_username` VARCHAR(30) NOT NULL ,
  PRIMARY KEY (`teacherid`) ,
  INDEX `fk_teacher_Login_idx` (`Login_username` ASC) ,
  CONSTRAINT `fk_teacher_Login`
    FOREIGN KEY (`Login_username` )
    REFERENCES `mydb`.`login` (`username` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`subject`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `mydb`.`subject` (
  `subjectid` INT NOT NULL ,
  `subjectname` VARCHAR(45) NULL ,
  PRIMARY KEY (`subjectid`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`teaches`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `mydb`.`teaches` (
  `teacher_teacherid` INT NOT NULL ,
  `subject_idsubject` INT NOT NULL ,
  PRIMARY KEY (`teacher_teacherid`, `subject_idsubject`) ,
  INDEX `fk_teacher_has_subject_subject1_idx` (`subject_idsubject` ASC) ,
  INDEX `fk_teacher_has_subject_teacher1_idx` (`teacher_teacherid` ASC) ,
  CONSTRAINT `fk_teacher_has_subject_teacher1`
    FOREIGN KEY (`teacher_teacherid` )
    REFERENCES `mydb`.`teacher` (`teacherid` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_teacher_has_subject_subject1`
    FOREIGN KEY (`subject_idsubject` )
    REFERENCES `mydb`.`subject` (`subjectid` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`student`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `mydb`.`student` (
  `idstudent` INT NOT NULL ,
  `studentname` VARCHAR(45) NULL ,
  `dept` VARCHAR(45) NULL ,
  `semester` VARCHAR(45) NULL ,
  `subject_subjectid` INT NOT NULL ,
  PRIMARY KEY (`idstudent`, `subject_subjectid`) ,
  INDEX `fk_student_subject1_idx` (`subject_subjectid` ASC) ,
  CONSTRAINT `fk_student_subject1`
    FOREIGN KEY (`subject_subjectid` )
    REFERENCES `mydb`.`subject` (`subjectid` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`attendence`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `mydb`.`attendence` (
  `date` DATE NULL ,
  `status` VARCHAR(45) NULL ,
  `student_idstudent` INT NOT NULL ,
  `student_subject_subjectid` INT NOT NULL ,
  INDEX `fk_attendence_student1_idx` (`student_idstudent` ASC, `student_subject_subjectid` ASC) ,
  CONSTRAINT `fk_attendence_student1`
    FOREIGN KEY (`student_idstudent` , `student_subject_subjectid` )
    REFERENCES `mydb`.`student` (`idstudent` , `subject_subjectid` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;



SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
