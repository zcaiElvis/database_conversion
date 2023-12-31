-- MySQL Script generated by MySQL Workbench
-- Mon Nov  6 13:28:56 2023
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`cities`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`cities` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `city` VARCHAR(20) NOT NULL,
  `population` INT NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `city_UNIQUE` (`city` ASC) VISIBLE,
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`demographics`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`demographics` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `sex` VARCHAR(20) NULL,
  `ethnicity` VARCHAR(20) NULL,
  `risk_group` VARCHAR(20) NULL,
  `intensity` VARCHAR(20) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`time`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`time` (
  `year` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`year`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`n_diagnosis`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`n_diagnosis` (
  `year` INT UNSIGNED NOT NULL,
  `city_id` INT UNSIGNED NOT NULL,
  `demographic_id` INT UNSIGNED NOT NULL,
  `value` INT NOT NULL,
  PRIMARY KEY (`year`, `city_id`, `demographic_id`),
  INDEX `city_id_idx` (`city_id` ASC) VISIBLE,
  INDEX `demographic_id_idx` (`demographic_id` ASC) VISIBLE,
  CONSTRAINT `city_id`
    FOREIGN KEY (`city_id`)
    REFERENCES `mydb`.`cities` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `demographic_id`
    FOREIGN KEY (`demographic_id`)
    REFERENCES `mydb`.`demographics` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `year`
    FOREIGN KEY (`year`)
    REFERENCES `mydb`.`time` (`year`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`n_mortality`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`n_mortality` (
  `year` INT UNSIGNED NOT NULL,
  `city_id` INT UNSIGNED NOT NULL,
  `demographic_id` INT UNSIGNED NOT NULL,
  `value` INT NOT NULL,
  PRIMARY KEY (`year`, `city_id`, `demographic_id`),
  INDEX `city_id_idx` (`city_id` ASC) VISIBLE,
  INDEX `demographic_id_idx` (`demographic_id` ASC) VISIBLE,
  CONSTRAINT `city_id`
    FOREIGN KEY (`city_id`)
    REFERENCES `mydb`.`cities` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `demographic_id`
    FOREIGN KEY (`demographic_id`)
    REFERENCES `mydb`.`demographics` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `year`
    FOREIGN KEY (`year`)
    REFERENCES `mydb`.`time` (`year`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`fixed_parameters`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`fixed_parameters` (
  `var` INT NOT NULL,
  `city` VARCHAR(20) NULL,
  `year` INT NULL,
  PRIMARY KEY (`var`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`variables`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`variables` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(15) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`distribution`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`distribution` (
  `cities_id` INT UNSIGNED NOT NULL,
  `variable_id` INT UNSIGNED NOT NULL,
  `demographics_id` INT UNSIGNED NOT NULL,
  `year_id` INT UNSIGNED NULL,
  `pe` INT NULL,
  `lower` DOUBLE NULL,
  `upper` DOUBLE NULL,
  `distribution` VARCHAR(45),
  PRIMARY KEY (`cities_id`, `variable_id`, `demographics_id`),
  INDEX `variable_id_idx` (`variable_id` ASC) VISIBLE,
  INDEX `demographics_id_idx` (`demographics_id` ASC) VISIBLE,
  INDEX `year_idx` (`year_id` ASC) VISIBLE,
  CONSTRAINT `cities_id`
    FOREIGN KEY (`cities_id`)
    REFERENCES `mydb`.`cities` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `variable_id`
    FOREIGN KEY (`variable_id`)
    REFERENCES `mydb`.`variables` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `demographics_id`
    FOREIGN KEY (`demographics_id`)
    REFERENCES `mydb`.`demographics` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `year_id`
    FOREIGN KEY (`year_id`)
    REFERENCES `mydb`.`time` (`year`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
