-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema tripdb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema tripdb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `tripdb` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `tripdb` ;

-- -----------------------------------------------------
-- Table `tripdb`.`sido`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tripdb`.`sido` (
  `sido_code` INT NOT NULL,
  `sido_name` VARCHAR(30) NULL DEFAULT NULL,
  PRIMARY KEY (`sido_code`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `tripdb`.`gugun`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tripdb`.`gugun` (
  `gugun_code` INT NOT NULL,
  `gugun_name` VARCHAR(30) NULL DEFAULT NULL,
  `sido_code` INT NOT NULL,
  PRIMARY KEY (`gugun_code`, `sido_code`),
  INDEX `gugun_to_sido_sido_code_fk_idx` (`sido_code` ASC) VISIBLE,
  CONSTRAINT `gugun_to_sido_sido_code_fk`
    FOREIGN KEY (`sido_code`)
    REFERENCES `tripdb`.`sido` (`sido_code`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `tripdb`.`attraction_info`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tripdb`.`attraction_info` (
  `content_id` INT NOT NULL,
  `content_type_id` INT NULL DEFAULT NULL,
  `title` VARCHAR(100) NULL DEFAULT NULL,
  `addr1` VARCHAR(100) NULL DEFAULT NULL,
  `addr2` VARCHAR(50) NULL DEFAULT NULL,
  `zipcode` VARCHAR(50) NULL DEFAULT NULL,
  `tel` VARCHAR(50) NULL DEFAULT NULL,
  `first_image` VARCHAR(200) NULL DEFAULT NULL,
  `first_image2` VARCHAR(200) NULL DEFAULT NULL,
  `readcount` INT NULL DEFAULT NULL,
  `sido_code` INT NULL DEFAULT NULL,
  `gugun_code` INT NULL DEFAULT NULL,
  `latitude` DECIMAL(20,17) NULL DEFAULT NULL,
  `longitude` DECIMAL(20,17) NULL DEFAULT NULL,
  `mlevel` VARCHAR(2) NULL DEFAULT NULL,
  PRIMARY KEY (`content_id`),
  INDEX `attraction_to_content_type_id_fk_idx` (`content_type_id` ASC) VISIBLE,
  INDEX `attraction_to_sido_code_fk_idx` (`sido_code` ASC) VISIBLE,
  INDEX `attraction_to_gugun_code_fk_idx` (`gugun_code` ASC) VISIBLE,
  CONSTRAINT `attraction_to_content_type_id_fk`
    FOREIGN KEY (`content_type_id`)
    REFERENCES `tripdb`.`content_type` (`content_type_id`),
  CONSTRAINT `attraction_to_gugun_code_fk`
    FOREIGN KEY (`gugun_code`)
    REFERENCES `tripdb`.`gugun` (`gugun_code`),
  CONSTRAINT `attraction_to_sido_code_fk`
    FOREIGN KEY (`sido_code`)
    REFERENCES `tripdb`.`sido` (`sido_code`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `tripdb`.`attraction_description`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tripdb`.`attraction_description` (
  `content_id` INT NOT NULL,
  `homepage` VARCHAR(100) NULL DEFAULT NULL,
  `overview` VARCHAR(10000) NULL DEFAULT NULL,
  `telname` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`content_id`),
  CONSTRAINT `attraction_detail_to_attraciton_id_fk`
    FOREIGN KEY (`content_id`)
    REFERENCES `tripdb`.`attraction_info` (`content_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `tripdb`.`attraction_detail`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tripdb`.`attraction_detail` (
  `content_id` INT NOT NULL,
  `cat1` VARCHAR(3) NULL DEFAULT NULL,
  `cat2` VARCHAR(5) NULL DEFAULT NULL,
  `cat3` VARCHAR(9) NULL DEFAULT NULL,
  `created_time` VARCHAR(14) NULL DEFAULT NULL,
  `modified_time` VARCHAR(14) NULL DEFAULT NULL,
  `booktour` VARCHAR(5) NULL DEFAULT NULL,
  PRIMARY KEY (`content_id`),
  CONSTRAINT `attraction_detail_to_basic_content_id_fk`
    FOREIGN KEY (`content_id`)
    REFERENCES `tripdb`.`attraction_info` (`content_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `tripdb`.`user`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tripdb`.`user` (
  `name` VARCHAR(20) NOT NULL,
  `id` VARCHAR(20) NOT NULL,
  `password` VARCHAR(100) NOT NULL,
  `email` VARCHAR(20) NOT NULL,
  `age` INT NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `tripdb`.`notice`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tripdb`.`notice` (
  `article_no` INT NOT NULL AUTO_INCREMENT,
  `id` VARCHAR(16) NULL DEFAULT NULL,
  `title` VARCHAR(100) NULL DEFAULT NULL,
  `content` VARCHAR(2000) NULL DEFAULT NULL,
  `img` VARCHAR(100) NULL DEFAULT NULL,
  `hit` INT NULL DEFAULT '0',
  `register_time` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`article_no`),
  INDEX `notice_to_user_id_fk` (`id` ASC) VISIBLE,
  CONSTRAINT `notice_to_user_id_fk`
    FOREIGN KEY (`id`)
    REFERENCES `tripdb`.`user` (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 6
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `tripdb`.`review`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tripdb`.`review` (
  `article_no` INT NOT NULL AUTO_INCREMENT,
  `id` VARCHAR(16) NULL DEFAULT NULL,
  `title` VARCHAR(100) NULL DEFAULT NULL,
  `content` VARCHAR(2000) NULL DEFAULT NULL,
  `img` VARCHAR(100) NULL DEFAULT NULL,
  `hit` INT NULL DEFAULT '0',
  `register_time` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`article_no`),
  INDEX `review_to_user_id_fk` (`id` ASC) VISIBLE,
  CONSTRAINT `review_to_user_id_fk`
    FOREIGN KEY (`id`)
    REFERENCES `tripdb`.`user` (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 7
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `tripdb`.`hit`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tripdb`.`hit` (
  `count` INT NOT NULL AUTO_INCREMENT,
  `review_article_no` INT NOT NULL,
  `user_id` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`count`, `review_article_no`, `user_id`),
  INDEX `fk_hit_review1_idx` (`review_article_no` ASC) VISIBLE,
  INDEX `fk_hit_user1_idx` (`user_id` ASC) VISIBLE,
  CONSTRAINT `fk_hit_review1`
    FOREIGN KEY (`review_article_no`)
    REFERENCES `tripdb`.`review` (`article_no`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_hit_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `tripdb`.`user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `tripdb`.`keyword`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tripdb`.`keyword` (
  `keyno` INT NOT NULL AUTO_INCREMENT,
  `keyname` VARCHAR(45) NULL,
  PRIMARY KEY (`keyno`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `tripdb`.`keywordForAttraction`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tripdb`.`keywordForAttraction` (
  `keyword_keyno` INT NOT NULL,
  `attraction_info_content_id` INT NOT NULL,
  PRIMARY KEY (`keyword_keyno`, `attraction_info_content_id`),
  INDEX `fk_keywordFroAttraction_attraction_info1_idx` (`attraction_info_content_id` ASC) VISIBLE,
  CONSTRAINT `fk_keywordFroAttraction_keyword1`
    FOREIGN KEY (`keyword_keyno`)
    REFERENCES `tripdb`.`keyword` (`keyno`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_keywordFroAttraction_attraction_info1`
    FOREIGN KEY (`attraction_info_content_id`)
    REFERENCES `tripdb`.`attraction_info` (`content_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `tripdb`.`keywordForUser`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tripdb`.`keywordForUser` (
  `keyword_keyno` INT NOT NULL,
  `user_id` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`keyword_keyno`, `user_id`),
  INDEX `fk_keywordFroUser_user1_idx` (`user_id` ASC) VISIBLE,
  CONSTRAINT `fk_keywordFroAttraction_keyword10`
    FOREIGN KEY (`keyword_keyno`)
    REFERENCES `tripdb`.`keyword` (`keyno`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_keywordFroUser_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `tripdb`.`user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `tripdb`.`keywordForReview`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tripdb`.`keywordForReview` (
  `keyword_keyno` INT NOT NULL,
  `review_article_no` INT NOT NULL,
  PRIMARY KEY (`keyword_keyno`, `review_article_no`),
  INDEX `fk_keywordForReview_review1_idx` (`review_article_no` ASC) VISIBLE,
  CONSTRAINT `fk_keywordFroAttraction_keyword100`
    FOREIGN KEY (`keyword_keyno`)
    REFERENCES `tripdb`.`keyword` (`keyno`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_keywordForReview_review1`
    FOREIGN KEY (`review_article_no`)
    REFERENCES `tripdb`.`review` (`article_no`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
