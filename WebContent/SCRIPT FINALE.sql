-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema palestradb2
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `palestradb2` ;

-- -----------------------------------------------------
-- Schema palestradb2
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `palestradb2` DEFAULT CHARACTER SET utf8 ;
USE `palestradb2` ;

-- -----------------------------------------------------
-- Table `palestradb2`.`allievo`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `palestradb2`.`allievo` ;

CREATE TABLE IF NOT EXISTS `palestradb2`.`allievo` (
  `Codice_Fiscale` VARCHAR(16) NOT NULL,
  `Nome` VARCHAR(20) NOT NULL,
  `Cognome` VARCHAR(20) NOT NULL,
  `Data_di_Nascita` DATE NOT NULL,
  `Data_iscrizione` DATE NOT NULL,
  `Luogo_di_nascita` VARCHAR(20) NOT NULL,
  `Grado` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`Codice_Fiscale`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `palestradb2`.`attivita`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `palestradb2`.`attivita` ;

CREATE TABLE IF NOT EXISTS `palestradb2`.`attivita` (
  `idAttivita` VARCHAR(45) NOT NULL,
  `Descrizione1` VARCHAR(2000) NULL DEFAULT NULL,
  `Descrizione2` VARCHAR(2000) NULL DEFAULT NULL,
  `Descrizione3` VARCHAR(2000) NULL DEFAULT NULL,
  `Descrizione4` VARCHAR(2000) NULL DEFAULT NULL,
  `Titolo1` VARCHAR(45) NULL DEFAULT NULL,
  `Titolo2` VARCHAR(45) NULL DEFAULT NULL,
  `Titolo3` VARCHAR(45) NULL DEFAULT NULL,
  `Titolo4` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`idAttivita`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `palestradb2`.`corso`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `palestradb2`.`corso` ;

CREATE TABLE IF NOT EXISTS `palestradb2`.`corso` (
  `Codice_Corso` INT(11) NOT NULL,
  `Nome` VARCHAR(20) NOT NULL,
  `Num_max_iscritti` INT(11) NOT NULL,
  `Num_Iscritti` VARCHAR(45) NOT NULL,
  `Sede` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`Codice_Corso`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `palestradb2`.`esame`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `palestradb2`.`esame` ;

CREATE TABLE IF NOT EXISTS `palestradb2`.`esame` (
  `ID_Esame` INT(11) NOT NULL AUTO_INCREMENT,
  `Corso_Codice_Corso` INT(11) NOT NULL,
  `Data` DATE NOT NULL,
  `Num_Iscritti` INT(11) NOT NULL,
  PRIMARY KEY (`ID_Esame`, `Corso_Codice_Corso`),
  INDEX `fk_Esame_Corso1_idx` (`Corso_Codice_Corso` ASC),
  CONSTRAINT `fk_Esame_Corso1`
    FOREIGN KEY (`Corso_Codice_Corso`)
    REFERENCES `palestradb2`.`corso` (`Codice_Corso`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
AUTO_INCREMENT = 11
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `palestradb2`.`frequenta`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `palestradb2`.`frequenta` ;

CREATE TABLE IF NOT EXISTS `palestradb2`.`frequenta` (
  `Allievo_Codice_Fiscale` VARCHAR(16) NOT NULL,
  `Corso_Codice_Corso` INT(11) NOT NULL,
  PRIMARY KEY (`Allievo_Codice_Fiscale`, `Corso_Codice_Corso`),
  INDEX `fk_Frequenta_Corso1_idx` (`Corso_Codice_Corso` ASC),
  CONSTRAINT `fk_Frequenta_Allievo1`
    FOREIGN KEY (`Allievo_Codice_Fiscale`)
    REFERENCES `palestradb2`.`allievo` (`Codice_Fiscale`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Frequenta_Corso1`
    FOREIGN KEY (`Corso_Codice_Corso`)
    REFERENCES `palestradb2`.`corso` (`Codice_Corso`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `palestradb2`.`istruttore`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `palestradb2`.`istruttore` ;

CREATE TABLE IF NOT EXISTS `palestradb2`.`istruttore` (
  `Codice_Fiscale` VARCHAR(16) NOT NULL,
  `Nome` VARCHAR(20) NOT NULL,
  `Cognome` VARCHAR(20) NOT NULL,
  `ID_Federale` VARCHAR(10) NOT NULL,
  `Data_di_Nascita` DATE NOT NULL,
  `Luogo_di_Nascita` VARCHAR(20) NOT NULL,
  `Grado` VARCHAR(20) NOT NULL,
  `Anno_Licenza` DATE NOT NULL,
  PRIMARY KEY (`Codice_Fiscale`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `palestradb2`.`lezione`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `palestradb2`.`lezione` ;

CREATE TABLE IF NOT EXISTS `palestradb2`.`lezione` (
  `Codice Lezione` INT(11) NOT NULL AUTO_INCREMENT,
  `CodCorso` INT(11) NOT NULL,
  `Data` DATE NOT NULL,
  PRIMARY KEY (`Codice Lezione`, `CodCorso`),
  INDEX `fk_Lezione_Corso1_idx` (`CodCorso` ASC),
  CONSTRAINT `fk_Lezione_Corso1`
    FOREIGN KEY (`CodCorso`)
    REFERENCES `palestradb2`.`corso` (`Codice_Corso`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
AUTO_INCREMENT = 14
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `palestradb2`.`login_data`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `palestradb2`.`login_data` ;

CREATE TABLE IF NOT EXISTS `palestradb2`.`login_data` (
  `Username` VARCHAR(45) NOT NULL,
  `Password` VARCHAR(45) NOT NULL,
  `Role` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Username`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `palestradb2`.`login_allievo`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `palestradb2`.`login_allievo` ;

CREATE TABLE IF NOT EXISTS `palestradb2`.`login_allievo` (
  `Login_data_Username` VARCHAR(45) NOT NULL,
  `Allievo_Codice_Fiscale` VARCHAR(16) NOT NULL,
  PRIMARY KEY (`Login_data_Username`, `Allievo_Codice_Fiscale`),
  INDEX `fk_Login_allievo_Allievo1_idx` (`Allievo_Codice_Fiscale` ASC),
  CONSTRAINT `fk_Login_allievo_Allievo1`
    FOREIGN KEY (`Allievo_Codice_Fiscale`)
    REFERENCES `palestradb2`.`allievo` (`Codice_Fiscale`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Login_allievo_Login_data1`
    FOREIGN KEY (`Login_data_Username`)
    REFERENCES `palestradb2`.`login_data` (`Username`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `palestradb2`.`login_istruttore`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `palestradb2`.`login_istruttore` ;

CREATE TABLE IF NOT EXISTS `palestradb2`.`login_istruttore` (
  `Login_data_Username` VARCHAR(45) NOT NULL,
  `Istruttore_Codice_Fiscale` VARCHAR(16) NOT NULL,
  PRIMARY KEY (`Login_data_Username`, `Istruttore_Codice_Fiscale`),
  INDEX `fk_Login_istruttore_Istruttore1_idx` (`Istruttore_Codice_Fiscale` ASC),
  CONSTRAINT `fk_Login_istruttore_Istruttore1`
    FOREIGN KEY (`Istruttore_Codice_Fiscale`)
    REFERENCES `palestradb2`.`istruttore` (`Codice_Fiscale`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Login_istruttore_Login_data1`
    FOREIGN KEY (`Login_data_Username`)
    REFERENCES `palestradb2`.`login_data` (`Username`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `palestradb2`.`presenze`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `palestradb2`.`presenze` ;

CREATE TABLE IF NOT EXISTS `palestradb2`.`presenze` (
  `Allievo_Codice_Fiscale` VARCHAR(16) NOT NULL,
  `Lezione_CodCorso` INT(11) NOT NULL,
  `Lezione_Codice_Lezione` INT(11) NOT NULL,
  `Presente` TINYINT(1) NOT NULL,
  PRIMARY KEY (`Allievo_Codice_Fiscale`, `Lezione_CodCorso`, `Lezione_Codice_Lezione`),
  INDEX `fk_Presenze_Lezione1_idx` (`Lezione_CodCorso` ASC, `Lezione_Codice_Lezione` ASC),
  CONSTRAINT `fk_Presenze_Allievo1`
    FOREIGN KEY (`Allievo_Codice_Fiscale`)
    REFERENCES `palestradb2`.`allievo` (`Codice_Fiscale`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Presenze_Lezione1`
    FOREIGN KEY (`Lezione_CodCorso` , `Lezione_Codice_Lezione`)
    REFERENCES `palestradb2`.`lezione` (`CodCorso` , `Codice Lezione`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `palestradb2`.`sostiene`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `palestradb2`.`sostiene` ;

CREATE TABLE IF NOT EXISTS `palestradb2`.`sostiene` (
  `Allievo_Codice_Fiscale` VARCHAR(16) NOT NULL,
  `Esame_ID_Esame` INT(11) NOT NULL,
  `Esame_Corso_Codice_Corso` INT(11) NOT NULL,
  `Voto` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`Allievo_Codice_Fiscale`, `Esame_ID_Esame`, `Esame_Corso_Codice_Corso`),
  INDEX `fk_Sostiene_Esame1_idx` (`Esame_ID_Esame` ASC, `Esame_Corso_Codice_Corso` ASC),
  CONSTRAINT `fk_Sostiene_Allievo1`
    FOREIGN KEY (`Allievo_Codice_Fiscale`)
    REFERENCES `palestradb2`.`allievo` (`Codice_Fiscale`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Sostiene_Esame1`
    FOREIGN KEY (`Esame_ID_Esame` , `Esame_Corso_Codice_Corso`)
    REFERENCES `palestradb2`.`esame` (`ID_Esame` , `Corso_Codice_Corso`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `palestradb2`.`telefono_allievo`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `palestradb2`.`telefono_allievo` ;

CREATE TABLE IF NOT EXISTS `palestradb2`.`telefono_allievo` (
  `Allievo_Codice_Fiscale` VARCHAR(16) NOT NULL,
  `Numero` VARCHAR(15) NOT NULL,
  PRIMARY KEY (`Allievo_Codice_Fiscale`, `Numero`),
  CONSTRAINT `fk_Telefono allievo_Allievo1`
    FOREIGN KEY (`Allievo_Codice_Fiscale`)
    REFERENCES `palestradb2`.`allievo` (`Codice_Fiscale`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `palestradb2`.`telefono_istruttore`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `palestradb2`.`telefono_istruttore` ;

CREATE TABLE IF NOT EXISTS `palestradb2`.`telefono_istruttore` (
  `Istruttore_Codice_Fiscale` VARCHAR(16) NOT NULL,
  `Numero` VARCHAR(15) NOT NULL,
  PRIMARY KEY (`Istruttore_Codice_Fiscale`, `Numero`),
  CONSTRAINT `fk_Telefono istruttore_Istruttore1`
    FOREIGN KEY (`Istruttore_Codice_Fiscale`)
    REFERENCES `palestradb2`.`istruttore` (`Codice_Fiscale`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `palestradb2`.`tiene`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `palestradb2`.`tiene` ;

CREATE TABLE IF NOT EXISTS `palestradb2`.`tiene` (
  `Codice_Fiscale` VARCHAR(16) NOT NULL,
  `Codice_Corso` INT(11) NOT NULL,
  PRIMARY KEY (`Codice_Fiscale`, `Codice_Corso`),
  INDEX `fk_Tiene_Corso1_idx` (`Codice_Corso` ASC),
  CONSTRAINT `fk_Tiene_Corso1`
    FOREIGN KEY (`Codice_Corso`)
    REFERENCES `palestradb2`.`corso` (`Codice_Corso`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Tiene_Istruttore1`
    FOREIGN KEY (`Codice_Fiscale`)
    REFERENCES `palestradb2`.`istruttore` (`Codice_Fiscale`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
