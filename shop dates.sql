-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema shop
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema shop
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `shop` DEFAULT CHARACTER SET utf8mb3 ;
USE `shop` ;

-- -----------------------------------------------------
-- Table `shop`.`brend`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `shop`.`brend` (
  `idBrend` INT NOT NULL AUTO_INCREMENT,
  `Brand_type` VARCHAR(128) NOT NULL,
  PRIMARY KEY (`idBrend`))
ENGINE = InnoDB
AUTO_INCREMENT = 11
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `shop`.`category`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `shop`.`category` (
  `idCategory` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(128) NOT NULL,
  `skidka` TINYINT NOT NULL,
  `English_name` VARCHAR(128) NULL DEFAULT NULL,
  `categorycol` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`idCategory`))
ENGINE = InnoDB
AUTO_INCREMENT = 12
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `shop`.`order`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `shop`.`order` (
  `idorder` INT NOT NULL AUTO_INCREMENT,
  `user_name` VARCHAR(128) NOT NULL,
  `phone` VARCHAR(32) NOT NULL,
  `date_time` DATETIME NOT NULL,
  PRIMARY KEY (`idorder`))
ENGINE = InnoDB
AUTO_INCREMENT = 6
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `shop`.`type_of_product`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `shop`.`type_of_product` (
  `idtype_of_product` INT NOT NULL AUTO_INCREMENT,
  `product` VARCHAR(128) NOT NULL,
  PRIMARY KEY (`idtype_of_product`))
ENGINE = InnoDB
AUTO_INCREMENT = 10
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `shop`.`product`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `shop`.`product` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `idCategory` INT NOT NULL,
  `idBrend` INT NOT NULL,
  `idtype_of_product` INT NOT NULL,
  `price` DECIMAL(10,2) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_brend_product_idx` (`idBrend` ASC) VISIBLE,
  INDEX `fk_category_product_idx` (`idCategory` ASC) VISIBLE,
  INDEX `fk_type_of_product_product_idx` (`idtype_of_product` ASC) VISIBLE,
  CONSTRAINT `fk_brend_product`
    FOREIGN KEY (`idBrend`)
    REFERENCES `shop`.`brend` (`idBrend`)
    ON DELETE CASCADE,
  CONSTRAINT `fk_category_product`
    FOREIGN KEY (`idCategory`)
    REFERENCES `shop`.`category` (`idCategory`)
    ON DELETE CASCADE,
  CONSTRAINT `fk_type_of_product_product`
    FOREIGN KEY (`idtype_of_product`)
    REFERENCES `shop`.`type_of_product` (`idtype_of_product`)
    ON DELETE CASCADE)
ENGINE = InnoDB
AUTO_INCREMENT = 11
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `shop`.`order_product`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `shop`.`order_product` (
  `order_id` INT NOT NULL,
  `product_id` INT NOT NULL,
  `count` INT NOT NULL,
  INDEX `fk_order_product_product_idx` (`product_id` ASC) VISIBLE,
  INDEX `fk_order_product_order` (`order_id` ASC) VISIBLE,
  CONSTRAINT `fk_order_product_order`
    FOREIGN KEY (`order_id`)
    REFERENCES `shop`.`order` (`idorder`)
    ON DELETE CASCADE,
  CONSTRAINT `fk_order_product_product`
    FOREIGN KEY (`product_id`)
    REFERENCES `shop`.`product` (`id`)
    ON DELETE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
