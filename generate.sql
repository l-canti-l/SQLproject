-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema university
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema university
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `university` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `university` ;

-- -----------------------------------------------------
-- Table `university`.`professors`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `university`.`professors` (
  `professors_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `professors_name` VARCHAR(45) NOT NULL,
  `professors_email` VARCHAR(100) NOT NULL,
  INDEX `professors_id` (`professors_id` ASC) VISIBLE,
  INDEX `professors_email` (`professors_email` ASC) VISIBLE)
ENGINE = InnoDB
AUTO_INCREMENT = 5
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `university`.`courses`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `university`.`courses` (
  `courses_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `courses_name` VARCHAR(100) NOT NULL,
  `courses_professor_id` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`courses_id`),
  INDEX `courses_id` (`courses_id` ASC) VISIBLE,
  INDEX `courses_name` (`courses_name` ASC) VISIBLE,
  INDEX `courses_professor_id` (`courses_professor_id` ASC) VISIBLE,
  CONSTRAINT `courses_professor_id`
    FOREIGN KEY (`courses_professor_id`)
    REFERENCES `university`.`professors` (`professors_id`))
ENGINE = InnoDB
AUTO_INCREMENT = 7
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `university`.`students`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `university`.`students` (
  `students_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `students_name` VARCHAR(100) NOT NULL,
  `students_email` VARCHAR(100) NOT NULL,
  UNIQUE INDEX `students_email` (`students_email` ASC) VISIBLE,
  UNIQUE INDEX `students_id` (`students_id` ASC) VISIBLE,
  UNIQUE INDEX `students_id_2` (`students_id` ASC) VISIBLE,
  INDEX `studemts_email` (`students_email` ASC) VISIBLE)
ENGINE = InnoDB
AUTO_INCREMENT = 11
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `university`.`grades`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `university`.`grades` (
  `grades_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `grades_percentage` DECIMAL(4,2) UNSIGNED NOT NULL,
  `grades_student_id` INT UNSIGNED NOT NULL,
  `grades_course_id` INT UNSIGNED NOT NULL,
  `grades_professor_id` INT UNSIGNED NOT NULL,
  INDEX `grades_id` (`grades_id` ASC) VISIBLE,
  INDEX `grades_student_id_idx` (`grades_student_id` ASC) VISIBLE,
  INDEX `grades_course_id_idx` (`grades_course_id` ASC) VISIBLE,
  INDEX `grades_professor_id_idx` (`grades_professor_id` ASC) VISIBLE,
  CONSTRAINT `grades_course_id`
    FOREIGN KEY (`grades_course_id`)
    REFERENCES `university`.`courses` (`courses_id`),
  CONSTRAINT `grades_professor_id`
    FOREIGN KEY (`grades_professor_id`)
    REFERENCES `university`.`professors` (`professors_id`),
  CONSTRAINT `grades_student_id`
    FOREIGN KEY (`grades_student_id`)
    REFERENCES `university`.`students` (`students_id`))
ENGINE = InnoDB
AUTO_INCREMENT = 21
DEFAULT CHARACTER SET = utf8;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
