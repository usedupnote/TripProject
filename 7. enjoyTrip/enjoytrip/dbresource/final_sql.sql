-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';


-- -----------------------------------------------------
-- Schema ssafytrip
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `ssafytrip` DEFAULT CHARACTER SET utf8mb3 ;
USE `ssafytrip` ;

-- -----------------------------------------------------
-- Table `ssafytrip`.`board_category`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ssafytrip`.`board_category` (
  `id` INT NOT NULL,
  `name` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `ssafytrip`.`grade`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ssafytrip`.`grade` (
  `id` TINYINT(1) NOT NULL,
  `grade` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `ssafytrip`.`user`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ssafytrip`.`user` (
  `email` VARCHAR(45) NOT NULL,
  `password` VARCHAR(45) NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  `img` VARCHAR(45) NULL DEFAULT NULL,
  `gender` CHAR(1) CHARACTER SET 'utf8mb3' NULL DEFAULT NULL,
  `grade_id` TINYINT(1) NOT NULL,
  `nickname` VARCHAR(45) NULL DEFAULT NULL,
  `age` INT NULL DEFAULT NULL,
  `join_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `last_login` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`email`),
  INDEX `fk_user_grade_idx` (`grade_id` ASC) VISIBLE,
  CONSTRAINT `fk_user_grade`
    FOREIGN KEY (`grade_id`)
    REFERENCES `ssafytrip`.`grade` (`id`)
    ON DELETE RESTRICT)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `ssafytrip`.`board`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ssafytrip`.`board` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `user_email` VARCHAR(45) NOT NULL,
  `title` VARCHAR(45) NOT NULL,
  `content` TEXT NOT NULL,
  `create_time` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `view_count` INT NOT NULL DEFAULT '0',
  `board_category_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_board_user1_idx` (`user_email` ASC) VISIBLE,
  INDEX `fk_board_board_category1_idx` (`board_category_id` ASC) VISIBLE,
  CONSTRAINT `fk_board_board_category1`
    FOREIGN KEY (`board_category_id`)
    REFERENCES `ssafytrip`.`board_category` (`id`)
    ON DELETE RESTRICT,
  CONSTRAINT `fk_board_user1`
    FOREIGN KEY (`user_email`)
    REFERENCES `ssafytrip`.`user` (`email`)
    ON DELETE CASCADE)
ENGINE = InnoDB
AUTO_INCREMENT = 5
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `ssafytrip`.`comment`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ssafytrip`.`comment` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `board_id` INT NOT NULL,
  `user_email` VARCHAR(45) NOT NULL,
  `content` TEXT NULL DEFAULT NULL,
  `created_at` TIMESTAMP NULL DEFAULT NULL,
  `updated_at` TIMESTAMP NULL DEFAULT NULL,
  PRIMARY KEY (`id`, `board_id`, `user_email`),
  INDEX `fk_board_has_user_user2_idx` (`user_email` ASC) VISIBLE,
  INDEX `fk_board_has_user_board2_idx` (`board_id` ASC) VISIBLE,
  CONSTRAINT `fk_board_has_user_board2`
    FOREIGN KEY (`board_id`)
    REFERENCES `ssafytrip`.`board` (`id`),
  CONSTRAINT `fk_board_has_user_user2`
    FOREIGN KEY (`user_email`)
    REFERENCES `ssafytrip`.`user` (`email`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `ssafytrip`.`image`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ssafytrip`.`image` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `url` VARCHAR(255) NOT NULL,
  `board_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_image_board1_idx` (`board_id` ASC) VISIBLE,
  CONSTRAINT `fk_image_board1`
    FOREIGN KEY (`board_id`)
    REFERENCES `ssafytrip`.`board` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `ssafytrip`.`place_type`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ssafytrip`.`place_type` (
  `id` INT NOT NULL,
  `type` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `ssafytrip`.`place`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ssafytrip`.`place` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `description` VARCHAR(45) NOT NULL,
  `address` VARCHAR(45) NOT NULL,
  `business_hours` JSON NOT NULL,
  `phone_number_1` INT NOT NULL,
  `phone_number_2` INT NOT NULL,
  `phone_number_3` INT NOT NULL,
  `place_type_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_place_place_type1_idx` (`place_type_id` ASC) VISIBLE,
  CONSTRAINT `fk_place_place_type1`
    FOREIGN KEY (`place_type_id`)
    REFERENCES `ssafytrip`.`place_type` (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 6
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `ssafytrip`.`star`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ssafytrip`.`star` (
  `board_id` INT NOT NULL,
  `user_email` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`board_id`, `user_email`),
  INDEX `fk_board_has_user_user1_idx` (`user_email` ASC) VISIBLE,
  INDEX `fk_board_has_user_board1_idx` (`board_id` ASC) VISIBLE,
  CONSTRAINT `fk_board_has_user_board1`
    FOREIGN KEY (`board_id`)
    REFERENCES `ssafytrip`.`board` (`id`),
  CONSTRAINT `fk_board_has_user_user1`
    FOREIGN KEY (`user_email`)
    REFERENCES `ssafytrip`.`user` (`email`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
