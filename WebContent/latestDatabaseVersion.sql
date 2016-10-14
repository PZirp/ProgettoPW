-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema PalestraDBWeb
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `PalestraDBWeb` ;

-- -----------------------------------------------------
-- Schema PalestraDBWeb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `PalestraDBWeb` DEFAULT CHARACTER SET utf8 ;
USE `PalestraDBWeb` ;

-- -----------------------------------------------------
-- Table `PalestraDBWeb`.`Istruttore`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `PalestraDBWeb`.`Istruttore` ;

CREATE TABLE IF NOT EXISTS `PalestraDBWeb`.`Istruttore` (
  `Codice_Fiscale` VARCHAR(16) NOT NULL,
  `Nome` VARCHAR(20) NOT NULL,
  `Cognome` VARCHAR(20) NOT NULL,
  `ID_Federale` VARCHAR(10) NOT NULL,
  `Data_di_Nascita` DATE NOT NULL,
  `Luogo_di_Nascita` VARCHAR(20) NOT NULL,
  `Grado` VARCHAR(20) NOT NULL,
  `Anno_Licenza` DATE NOT NULL,
  PRIMARY KEY (`Codice_Fiscale`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `PalestraDBWeb`.`Allievo`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `PalestraDBWeb`.`Allievo` ;

CREATE TABLE IF NOT EXISTS `PalestraDBWeb`.`Allievo` (
  `Codice_Fiscale` VARCHAR(16) NOT NULL,
  `Nome` VARCHAR(20) NOT NULL,
  `Cognome` VARCHAR(20) NOT NULL,
  `Data_di_Nascita` DATE NOT NULL,
  `Data_iscrizione` DATE NOT NULL,
  `Luogo_di_nascita` VARCHAR(20) NOT NULL,
  `Grado` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`Codice_Fiscale`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `PalestraDBWeb`.`Corso`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `PalestraDBWeb`.`Corso` ;

CREATE TABLE IF NOT EXISTS `PalestraDBWeb`.`Corso` (
  `Codice_Corso` INT NOT NULL,
  `Nome` VARCHAR(20) NOT NULL,
  `Num_max_iscritti` INT NOT NULL,
  `Num_Iscritti` VARCHAR(45) NOT NULL,
  `Sede` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`Codice_Corso`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `PalestraDBWeb`.`Esame`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `PalestraDBWeb`.`Esame` ;

CREATE TABLE IF NOT EXISTS `PalestraDBWeb`.`Esame` (
  `ID_Esame` INT NOT NULL,
  `Corso_Codice_Corso` INT NOT NULL,
  `Data` DATE NOT NULL,
  `Num_Iscritti` INT NOT NULL,
  PRIMARY KEY (`ID_Esame`, `Corso_Codice_Corso`),
  INDEX `fk_Esame_Corso1_idx` (`Corso_Codice_Corso` ASC),
  CONSTRAINT `fk_Esame_Corso1`
    FOREIGN KEY (`Corso_Codice_Corso`)
    REFERENCES `PalestraDBWeb`.`Corso` (`Codice_Corso`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `PalestraDBWeb`.`Lezione`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `PalestraDBWeb`.`Lezione` ;

CREATE TABLE IF NOT EXISTS `PalestraDBWeb`.`Lezione` (
  `CodCorso` INT NOT NULL,
  `Codice Lezione` INT NOT NULL,
  `Data` DATE NULL,
  `Orario` TIME NULL,
  PRIMARY KEY (`CodCorso`, `Codice Lezione`),
  INDEX `fk_Lezione_Corso1_idx` (`CodCorso` ASC),
  CONSTRAINT `fk_Lezione_Corso1`
    FOREIGN KEY (`CodCorso`)
    REFERENCES `PalestraDBWeb`.`Corso` (`Codice_Corso`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `PalestraDBWeb`.`Frequenta`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `PalestraDBWeb`.`Frequenta` ;

CREATE TABLE IF NOT EXISTS `PalestraDBWeb`.`Frequenta` (
  `Allievo_Codice_Fiscale` VARCHAR(16) NOT NULL,
  `Corso_Codice_Corso` INT NOT NULL,
  PRIMARY KEY (`Allievo_Codice_Fiscale`, `Corso_Codice_Corso`),
  INDEX `fk_Frequenta_Corso1_idx` (`Corso_Codice_Corso` ASC),
  CONSTRAINT `fk_Frequenta_Allievo1`
    FOREIGN KEY (`Allievo_Codice_Fiscale`)
    REFERENCES `PalestraDBWeb`.`Allievo` (`Codice_Fiscale`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Frequenta_Corso1`
    FOREIGN KEY (`Corso_Codice_Corso`)
    REFERENCES `PalestraDBWeb`.`Corso` (`Codice_Corso`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `PalestraDBWeb`.`Presenze`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `PalestraDBWeb`.`Presenze` ;

CREATE TABLE IF NOT EXISTS `PalestraDBWeb`.`Presenze` (
  `Allievo_Codice_Fiscale` VARCHAR(16) NOT NULL,
  `Lezione_CodCorso` INT NOT NULL,
  `Lezione_Codice_Lezione` INT NOT NULL,
  PRIMARY KEY (`Allievo_Codice_Fiscale`, `Lezione_CodCorso`, `Lezione_Codice_Lezione`),
  INDEX `fk_Presenze_Lezione1_idx` (`Lezione_CodCorso` ASC, `Lezione_Codice_Lezione` ASC),
  CONSTRAINT `fk_Presenze_Allievo1`
    FOREIGN KEY (`Allievo_Codice_Fiscale`)
    REFERENCES `PalestraDBWeb`.`Allievo` (`Codice_Fiscale`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Presenze_Lezione1`
    FOREIGN KEY (`Lezione_CodCorso` , `Lezione_Codice_Lezione`)
    REFERENCES `PalestraDBWeb`.`Lezione` (`CodCorso` , `Codice Lezione`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `PalestraDBWeb`.`Tiene`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `PalestraDBWeb`.`Tiene` ;

CREATE TABLE IF NOT EXISTS `PalestraDBWeb`.`Tiene` (
  `Codice_Fiscale` VARCHAR(16) NOT NULL,
  `Codice_Corso` INT NOT NULL,
  PRIMARY KEY (`Codice_Fiscale`, `Codice_Corso`),
  INDEX `fk_Tiene_Corso1_idx` (`Codice_Corso` ASC),
  CONSTRAINT `fk_Tiene_Istruttore1`
    FOREIGN KEY (`Codice_Fiscale`)
    REFERENCES `PalestraDBWeb`.`Istruttore` (`Codice_Fiscale`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Tiene_Corso1`
    FOREIGN KEY (`Codice_Corso`)
    REFERENCES `PalestraDBWeb`.`Corso` (`Codice_Corso`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `PalestraDBWeb`.`Telefono_istruttore`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `PalestraDBWeb`.`Telefono_istruttore` ;

CREATE TABLE IF NOT EXISTS `PalestraDBWeb`.`Telefono_istruttore` (
  `Istruttore_Codice_Fiscale` VARCHAR(16) NOT NULL,
  `Numero` VARCHAR(15) NOT NULL,
  PRIMARY KEY (`Istruttore_Codice_Fiscale`, `Numero`),
  CONSTRAINT `fk_Telefono istruttore_Istruttore1`
    FOREIGN KEY (`Istruttore_Codice_Fiscale`)
    REFERENCES `PalestraDBWeb`.`Istruttore` (`Codice_Fiscale`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `PalestraDBWeb`.`Telefono_allievo`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `PalestraDBWeb`.`Telefono_allievo` ;

CREATE TABLE IF NOT EXISTS `PalestraDBWeb`.`Telefono_allievo` (
  `Allievo_Codice_Fiscale` VARCHAR(16) NOT NULL,
  `Numero` VARCHAR(15) NOT NULL,
  PRIMARY KEY (`Allievo_Codice_Fiscale`, `Numero`),
  CONSTRAINT `fk_Telefono allievo_Allievo1`
    FOREIGN KEY (`Allievo_Codice_Fiscale`)
    REFERENCES `PalestraDBWeb`.`Allievo` (`Codice_Fiscale`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `PalestraDBWeb`.`Post`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `PalestraDBWeb`.`Post` ;

CREATE TABLE IF NOT EXISTS `PalestraDBWeb`.`Post` (
  `Date` DATE NOT NULL,
  `Content` VARCHAR(2048) NOT NULL,
  PRIMARY KEY (`Date`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `PalestraDBWeb`.`ArtiMarziali`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `PalestraDBWeb`.`ArtiMarziali` ;

CREATE TABLE IF NOT EXISTS `PalestraDBWeb`.`ArtiMarziali` (
  `idDiscipline` VARCHAR(20) NOT NULL,
  `DescrizioneDisciplina` VARCHAR(2048) NOT NULL,
  PRIMARY KEY (`idDiscipline`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `PalestraDBWeb`.`AltreAttivita`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `PalestraDBWeb`.`AltreAttivita` ;

CREATE TABLE IF NOT EXISTS `PalestraDBWeb`.`AltreAttivita` (
  `idAltreAttivita` VARCHAR(20) NOT NULL,
  `Descrizione` VARCHAR(2048) NULL,
  PRIMARY KEY (`idAltreAttivita`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `PalestraDBWeb`.`Sostiene`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `PalestraDBWeb`.`Sostiene` ;

CREATE TABLE IF NOT EXISTS `PalestraDBWeb`.`Sostiene` (
  `Allievo_Codice_Fiscale` VARCHAR(16) NOT NULL,
  `Esame_ID_Esame` INT NOT NULL,
  `Esame_Corso_Codice_Corso` INT NOT NULL,
  `Voto` VARCHAR(45) NULL,
  PRIMARY KEY (`Allievo_Codice_Fiscale`, `Esame_ID_Esame`, `Esame_Corso_Codice_Corso`),
  INDEX `fk_Sostiene_Esame1_idx` (`Esame_ID_Esame` ASC, `Esame_Corso_Codice_Corso` ASC),
  CONSTRAINT `fk_Sostiene_Allievo1`
    FOREIGN KEY (`Allievo_Codice_Fiscale`)
    REFERENCES `PalestraDBWeb`.`Allievo` (`Codice_Fiscale`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Sostiene_Esame1`
    FOREIGN KEY (`Esame_ID_Esame` , `Esame_Corso_Codice_Corso`)
    REFERENCES `PalestraDBWeb`.`Esame` (`ID_Esame` , `Corso_Codice_Corso`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `PalestraDBWeb`.`Attivita`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `PalestraDBWeb`.`Attivita` ;

CREATE TABLE IF NOT EXISTS `PalestraDBWeb`.`Attivita` (
  `idAttivita` VARCHAR(45) NOT NULL,
  `Descrizione1` VARCHAR(2000) NULL,
  `Descrizione2` VARCHAR(2000) NULL,
  `Descrizione3` VARCHAR(2000) NULL,
  `Descrizione4` VARCHAR(2000) NULL,
  `Titolo1` VARCHAR(45) NULL,
  `Titolo2` VARCHAR(45) NULL,
  `Titolo3` VARCHAR(45) NULL,
  `Titolo4` VARCHAR(45) NULL,
  PRIMARY KEY (`idAttivita`))
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Data for table `PalestraDBWeb`.`Istruttore`
-- -----------------------------------------------------
START TRANSACTION;
USE `PalestraDBWeb`;
INSERT INTO `PalestraDBWeb`.`Istruttore` (`Codice_Fiscale`, `Nome`, `Cognome`, `ID_Federale`, `Data_di_Nascita`, `Luogo_di_Nascita`, `Grado`, `Anno_Licenza`) VALUES ('CSBVCN89E30H703E', 'Vincenzo', 'Casaburi', '6', '1989-05-30', 'Salerno', '2 Dan', '2014-09-20');
INSERT INTO `PalestraDBWeb`.`Istruttore` (`Codice_Fiscale`, `Nome`, `Cognome`, `ID_Federale`, `Data_di_Nascita`, `Luogo_di_Nascita`, `Grado`, `Anno_Licenza`) VALUES ('LNGGNN75P30H703B', 'Giovanni', 'Linguadoca', '3387', '1975-09-30', 'Salerno', '5 Dan', '1997-09-10');
INSERT INTO `PalestraDBWeb`.`Istruttore` (`Codice_Fiscale`, `Nome`, `Cognome`, `ID_Federale`, `Data_di_Nascita`, `Luogo_di_Nascita`, `Grado`, `Anno_Licenza`) VALUES ('MZZPSL94T28M289C', 'Piersilvano ', 'Mazzone', '9917', '1994-12-28', 'Massa Di Somma', '2 Dan', '2014-09-20');
INSERT INTO `PalestraDBWeb`.`Istruttore` (`Codice_Fiscale`, `Nome`, `Cognome`, `ID_Federale`, `Data_di_Nascita`, `Luogo_di_Nascita`, `Grado`, `Anno_Licenza`) VALUES ('VLLLSU93L70H703F', 'Luisa', 'Avallone', '6702', '1993-07-30', 'Salerno', '3 Dan', '2014-09-20');

COMMIT;


-- -----------------------------------------------------
-- Data for table `PalestraDBWeb`.`Allievo`
-- -----------------------------------------------------
START TRANSACTION;
USE `PalestraDBWeb`;
INSERT INTO `PalestraDBWeb`.`Allievo` (`Codice_Fiscale`, `Nome`, `Cognome`, `Data_di_Nascita`, `Data_iscrizione`, `Luogo_di_nascita`, `Grado`) VALUES ('CRMGCM09E16H7035', 'Giacomo', 'Crimaldi', '2009-09-06', '2015-12-08', 'Salerno', 'Bianca');
INSERT INTO `PalestraDBWeb`.`Allievo` (`Codice_Fiscale`, `Nome`, `Cognome`, `Data_di_Nascita`, `Data_iscrizione`, `Luogo_di_nascita`, `Grado`) VALUES ('CSSCRS05C23H703K', 'Christian', 'Cassetta', '2005-03-23', '2015-01-21', 'Salerno', 'Mezza Gialla');
INSERT INTO `PalestraDBWeb`.`Allievo` (`Codice_Fiscale`, `Nome`, `Cognome`, `Data_di_Nascita`, `Data_iscrizione`, `Luogo_di_nascita`, `Grado`) VALUES ('DCCGTN11L06C361E', 'Gaetano', 'De Cicco', '2011-07-16', '2015-09-23', 'Cava', 'Mezza Gialla');
INSERT INTO `PalestraDBWeb`.`Allievo` (`Codice_Fiscale`, `Nome`, `Cognome`, `Data_di_Nascita`, `Data_iscrizione`, `Luogo_di_nascita`, `Grado`) VALUES ('FRRMRC93L30E131V', 'Marco', 'Ferraioli', '1993-07-30', '2010-09-21', 'Gragnano', 'Blu');
INSERT INTO `PalestraDBWeb`.`Allievo` (`Codice_Fiscale`, `Nome`, `Cognome`, `Data_di_Nascita`, `Data_iscrizione`, `Luogo_di_nascita`, `Grado`) VALUES ('GRMMNL91R47A489A', 'Manuela', 'Gramaglia', '1991-10-07', '2016-02-11', 'Atripalda', 'Bianca');
INSERT INTO `PalestraDBWeb`.`Allievo` (`Codice_Fiscale`, `Nome`, `Cognome`, `Data_di_Nascita`, `Data_iscrizione`, `Luogo_di_nascita`, `Grado`) VALUES ('MPRMNL02B67H703L', 'Manuela', 'Imperato', '2002-02-27', '2015-10-10', 'Salerno', 'Arancione');
INSERT INTO `PalestraDBWeb`.`Allievo` (`Codice_Fiscale`, `Nome`, `Cognome`, `Data_di_Nascita`, `Data_iscrizione`, `Luogo_di_nascita`, `Grado`) VALUES ('NCLLSN92P21I438Z', 'Alessandro', 'Nicolo', '1992-09-21', '2015-02-20', 'Sarno', 'Gialla');
INSERT INTO `PalestraDBWeb`.`Allievo` (`Codice_Fiscale`, `Nome`, `Cognome`, `Data_di_Nascita`, `Data_iscrizione`, `Luogo_di_nascita`, `Grado`) VALUES ('PCLNRC10H29H703Z', 'Enrico', 'Apicella', '2010-01-29', '2015-12-08', 'Salerno', 'Bianca');
INSERT INTO `PalestraDBWeb`.`Allievo` (`Codice_Fiscale`, `Nome`, `Cognome`, `Data_di_Nascita`, `Data_iscrizione`, `Luogo_di_nascita`, `Grado`) VALUES ('RCCMLR07M60H703U', 'Manuela', 'Ricciardelli', '2007-08-20', '2014-09-10', 'Salerno', 'Bianca');
INSERT INTO `PalestraDBWeb`.`Allievo` (`Codice_Fiscale`, `Nome`, `Cognome`, `Data_di_Nascita`, `Data_iscrizione`, `Luogo_di_nascita`, `Grado`) VALUES ('SCICSM02L25H703I', 'Cosimo', 'Sica', '2002-07-27', '2016-01-15', 'Salerno', 'Bianca');
INSERT INTO `PalestraDBWeb`.`Allievo` (`Codice_Fiscale`, `Nome`, `Cognome`, `Data_di_Nascita`, `Data_iscrizione`, `Luogo_di_nascita`, `Grado`) VALUES ('TASSVT08T16H703Q', 'Salvatore', 'Tedesco', '2008-12-16', '2014-09-17', 'Salerno', 'Arancione');
INSERT INTO `PalestraDBWeb`.`Allievo` (`Codice_Fiscale`, `Nome`, `Cognome`, `Data_di_Nascita`, `Data_iscrizione`, `Luogo_di_nascita`, `Grado`) VALUES ('VLLDGI93A08C361G', 'Diego', 'Avella', '1993-01-08', '2002-09-15', 'Cava', '1 Dan');

COMMIT;


-- -----------------------------------------------------
-- Data for table `PalestraDBWeb`.`Corso`
-- -----------------------------------------------------
START TRANSACTION;
USE `PalestraDBWeb`;
INSERT INTO `PalestraDBWeb`.`Corso` (`Codice_Corso`, `Nome`, `Num_max_iscritti`, `Num_Iscritti`, `Sede`) VALUES (1, 'Primo Turno', 20, '14', 'FitnessShow');
INSERT INTO `PalestraDBWeb`.`Corso` (`Codice_Corso`, `Nome`, `Num_max_iscritti`, `Num_Iscritti`, `Sede`) VALUES (2, 'Secondo Turno', 20, '12', 'FitnessShow');
INSERT INTO `PalestraDBWeb`.`Corso` (`Codice_Corso`, `Nome`, `Num_max_iscritti`, `Num_Iscritti`, `Sede`) VALUES (3, 'Progetto Medie', 15, '9', 'Medie');
INSERT INTO `PalestraDBWeb`.`Corso` (`Codice_Corso`, `Nome`, `Num_max_iscritti`, `Num_Iscritti`, `Sede`) VALUES (4, 'Elementari Primo', 20, '13', 'Elementari');
INSERT INTO `PalestraDBWeb`.`Corso` (`Codice_Corso`, `Nome`, `Num_max_iscritti`, `Num_Iscritti`, `Sede`) VALUES (5, 'Elementari Secondo', 20, '12', 'Elementari');

COMMIT;


-- -----------------------------------------------------
-- Data for table `PalestraDBWeb`.`Esame`
-- -----------------------------------------------------
START TRANSACTION;
USE `PalestraDBWeb`;
INSERT INTO `PalestraDBWeb`.`Esame` (`ID_Esame`, `Corso_Codice_Corso`, `Data`, `Num_Iscritti`) VALUES (1, 1, '2016-02-06', 4);
INSERT INTO `PalestraDBWeb`.`Esame` (`ID_Esame`, `Corso_Codice_Corso`, `Data`, `Num_Iscritti`) VALUES (1, 2, '2016-02-06', 2);
INSERT INTO `PalestraDBWeb`.`Esame` (`ID_Esame`, `Corso_Codice_Corso`, `Data`, `Num_Iscritti`) VALUES (1, 3, '2016-02-06', 2);
INSERT INTO `PalestraDBWeb`.`Esame` (`ID_Esame`, `Corso_Codice_Corso`, `Data`, `Num_Iscritti`) VALUES (1, 4, '2016-02-06', 2);
INSERT INTO `PalestraDBWeb`.`Esame` (`ID_Esame`, `Corso_Codice_Corso`, `Data`, `Num_Iscritti`) VALUES (1, 5, '2016-02-06', 2);

COMMIT;


-- -----------------------------------------------------
-- Data for table `PalestraDBWeb`.`Lezione`
-- -----------------------------------------------------
START TRANSACTION;
USE `PalestraDBWeb`;
INSERT INTO `PalestraDBWeb`.`Lezione` (`CodCorso`, `Codice Lezione`, `Data`, `Orario`) VALUES (1, 1, '2016-02-02', '18:00:00');
INSERT INTO `PalestraDBWeb`.`Lezione` (`CodCorso`, `Codice Lezione`, `Data`, `Orario`) VALUES (2, 1, '2016-02-02', '19:00:00');
INSERT INTO `PalestraDBWeb`.`Lezione` (`CodCorso`, `Codice Lezione`, `Data`, `Orario`) VALUES (3, 1, '2016-02-01', '17:00:00');
INSERT INTO `PalestraDBWeb`.`Lezione` (`CodCorso`, `Codice Lezione`, `Data`, `Orario`) VALUES (4, 1, '2016-01-16', '10:00:00');
INSERT INTO `PalestraDBWeb`.`Lezione` (`CodCorso`, `Codice Lezione`, `Data`, `Orario`) VALUES (5, 1, '2016-01-16', '11:00:00');
INSERT INTO `PalestraDBWeb`.`Lezione` (`CodCorso`, `Codice Lezione`, `Data`, `Orario`) VALUES (1, 2, '2016-02-04', '18:00:00');
INSERT INTO `PalestraDBWeb`.`Lezione` (`CodCorso`, `Codice Lezione`, `Data`, `Orario`) VALUES (2, 2, '2016-02-04', '19:00:00');
INSERT INTO `PalestraDBWeb`.`Lezione` (`CodCorso`, `Codice Lezione`, `Data`, `Orario`) VALUES (3, 2, '2016-02-03', '17:00:00');
INSERT INTO `PalestraDBWeb`.`Lezione` (`CodCorso`, `Codice Lezione`, `Data`, `Orario`) VALUES (4, 2, '2016-01-23', '10:00:00');
INSERT INTO `PalestraDBWeb`.`Lezione` (`CodCorso`, `Codice Lezione`, `Data`, `Orario`) VALUES (5, 2, '2016-01-23', '11:00:00');
INSERT INTO `PalestraDBWeb`.`Lezione` (`CodCorso`, `Codice Lezione`, `Data`, `Orario`) VALUES (1, 3, '2016-02-06', '18:00:00');
INSERT INTO `PalestraDBWeb`.`Lezione` (`CodCorso`, `Codice Lezione`, `Data`, `Orario`) VALUES (2, 3, '2016-02-06', '19:00:00');
INSERT INTO `PalestraDBWeb`.`Lezione` (`CodCorso`, `Codice Lezione`, `Data`, `Orario`) VALUES (3, 3, '2016-02-05', '17:00:00');
INSERT INTO `PalestraDBWeb`.`Lezione` (`CodCorso`, `Codice Lezione`, `Data`, `Orario`) VALUES (4, 3, '2016-01-30', '10:00:00');
INSERT INTO `PalestraDBWeb`.`Lezione` (`CodCorso`, `Codice Lezione`, `Data`, `Orario`) VALUES (5, 3, '2016-01-30', '11:00:00');
INSERT INTO `PalestraDBWeb`.`Lezione` (`CodCorso`, `Codice Lezione`, `Data`, `Orario`) VALUES (1, 4, '2016-02-09', '18:00:00');
INSERT INTO `PalestraDBWeb`.`Lezione` (`CodCorso`, `Codice Lezione`, `Data`, `Orario`) VALUES (2, 4, '2016-02-09', '19:00:00');
INSERT INTO `PalestraDBWeb`.`Lezione` (`CodCorso`, `Codice Lezione`, `Data`, `Orario`) VALUES (3, 4, '2016-02-08', '17:00:00');
INSERT INTO `PalestraDBWeb`.`Lezione` (`CodCorso`, `Codice Lezione`, `Data`, `Orario`) VALUES (4, 4, '2016-02-06', '10:00:00');
INSERT INTO `PalestraDBWeb`.`Lezione` (`CodCorso`, `Codice Lezione`, `Data`, `Orario`) VALUES (5, 4, '2016-02-06', '11:00:00');
INSERT INTO `PalestraDBWeb`.`Lezione` (`CodCorso`, `Codice Lezione`, `Data`, `Orario`) VALUES (1, 5, '2016-02-11', '18:00:00');
INSERT INTO `PalestraDBWeb`.`Lezione` (`CodCorso`, `Codice Lezione`, `Data`, `Orario`) VALUES (2, 5, '2016-02-11', '19:00:00');
INSERT INTO `PalestraDBWeb`.`Lezione` (`CodCorso`, `Codice Lezione`, `Data`, `Orario`) VALUES (3, 5, '2016-02-10', '17:00:00');
INSERT INTO `PalestraDBWeb`.`Lezione` (`CodCorso`, `Codice Lezione`, `Data`, `Orario`) VALUES (4, 5, '2016-02-13', '10:00:00');
INSERT INTO `PalestraDBWeb`.`Lezione` (`CodCorso`, `Codice Lezione`, `Data`, `Orario`) VALUES (5, 5, '2016-02-13', '11:00:00');

COMMIT;


-- -----------------------------------------------------
-- Data for table `PalestraDBWeb`.`Frequenta`
-- -----------------------------------------------------
START TRANSACTION;
USE `PalestraDBWeb`;
INSERT INTO `PalestraDBWeb`.`Frequenta` (`Allievo_Codice_Fiscale`, `Corso_Codice_Corso`) VALUES ('DCCGTN11L06C361E', 1);
INSERT INTO `PalestraDBWeb`.`Frequenta` (`Allievo_Codice_Fiscale`, `Corso_Codice_Corso`) VALUES ('CSSCRS05C23H703K', 5);
INSERT INTO `PalestraDBWeb`.`Frequenta` (`Allievo_Codice_Fiscale`, `Corso_Codice_Corso`) VALUES ('MPRMNL02B67H703L', 1);
INSERT INTO `PalestraDBWeb`.`Frequenta` (`Allievo_Codice_Fiscale`, `Corso_Codice_Corso`) VALUES ('NCLLSN92P21I438Z', 1);
INSERT INTO `PalestraDBWeb`.`Frequenta` (`Allievo_Codice_Fiscale`, `Corso_Codice_Corso`) VALUES ('RCCMLR07M60H703U', 1);
INSERT INTO `PalestraDBWeb`.`Frequenta` (`Allievo_Codice_Fiscale`, `Corso_Codice_Corso`) VALUES ('TASSVT08T16H703Q', 1);
INSERT INTO `PalestraDBWeb`.`Frequenta` (`Allievo_Codice_Fiscale`, `Corso_Codice_Corso`) VALUES ('MPRMNL02B67H703L', 2);
INSERT INTO `PalestraDBWeb`.`Frequenta` (`Allievo_Codice_Fiscale`, `Corso_Codice_Corso`) VALUES ('SCICSM02L25H703I', 2);
INSERT INTO `PalestraDBWeb`.`Frequenta` (`Allievo_Codice_Fiscale`, `Corso_Codice_Corso`) VALUES ('FRRMRC93L30E131V', 3);
INSERT INTO `PalestraDBWeb`.`Frequenta` (`Allievo_Codice_Fiscale`, `Corso_Codice_Corso`) VALUES ('GRMMNL91R47A489A', 3);
INSERT INTO `PalestraDBWeb`.`Frequenta` (`Allievo_Codice_Fiscale`, `Corso_Codice_Corso`) VALUES ('VLLDGI93A08C361G', 3);
INSERT INTO `PalestraDBWeb`.`Frequenta` (`Allievo_Codice_Fiscale`, `Corso_Codice_Corso`) VALUES ('GRMMNL91R47A489A', 4);
INSERT INTO `PalestraDBWeb`.`Frequenta` (`Allievo_Codice_Fiscale`, `Corso_Codice_Corso`) VALUES ('CRMGCM09E16H7035', 4);
INSERT INTO `PalestraDBWeb`.`Frequenta` (`Allievo_Codice_Fiscale`, `Corso_Codice_Corso`) VALUES ('PCLNRC10H29H703Z', 4);
INSERT INTO `PalestraDBWeb`.`Frequenta` (`Allievo_Codice_Fiscale`, `Corso_Codice_Corso`) VALUES ('TASSVT08T16H703Q', 5);

COMMIT;


-- -----------------------------------------------------
-- Data for table `PalestraDBWeb`.`Presenze`
-- -----------------------------------------------------
START TRANSACTION;
USE `PalestraDBWeb`;
INSERT INTO `PalestraDBWeb`.`Presenze` (`Allievo_Codice_Fiscale`, `Lezione_CodCorso`, `Lezione_Codice_Lezione`) VALUES ('DCCGTN11L06C361E', 1, 1);
INSERT INTO `PalestraDBWeb`.`Presenze` (`Allievo_Codice_Fiscale`, `Lezione_CodCorso`, `Lezione_Codice_Lezione`) VALUES ('MPRMNL02B67H703L', 1, 1);
INSERT INTO `PalestraDBWeb`.`Presenze` (`Allievo_Codice_Fiscale`, `Lezione_CodCorso`, `Lezione_Codice_Lezione`) VALUES ('RCCMLR07M60H703U', 1, 1);
INSERT INTO `PalestraDBWeb`.`Presenze` (`Allievo_Codice_Fiscale`, `Lezione_CodCorso`, `Lezione_Codice_Lezione`) VALUES ('TASSVT08T16H703Q', 1, 1);
INSERT INTO `PalestraDBWeb`.`Presenze` (`Allievo_Codice_Fiscale`, `Lezione_CodCorso`, `Lezione_Codice_Lezione`) VALUES ('DCCGTN11L06C361E', 1, 2);
INSERT INTO `PalestraDBWeb`.`Presenze` (`Allievo_Codice_Fiscale`, `Lezione_CodCorso`, `Lezione_Codice_Lezione`) VALUES ('MPRMNL02B67H703L', 1, 2);
INSERT INTO `PalestraDBWeb`.`Presenze` (`Allievo_Codice_Fiscale`, `Lezione_CodCorso`, `Lezione_Codice_Lezione`) VALUES ('RCCMLR07M60H703U', 1, 2);
INSERT INTO `PalestraDBWeb`.`Presenze` (`Allievo_Codice_Fiscale`, `Lezione_CodCorso`, `Lezione_Codice_Lezione`) VALUES ('TASSVT08T16H703Q', 1, 2);
INSERT INTO `PalestraDBWeb`.`Presenze` (`Allievo_Codice_Fiscale`, `Lezione_CodCorso`, `Lezione_Codice_Lezione`) VALUES ('DCCGTN11L06C361E', 1, 3);
INSERT INTO `PalestraDBWeb`.`Presenze` (`Allievo_Codice_Fiscale`, `Lezione_CodCorso`, `Lezione_Codice_Lezione`) VALUES ('MPRMNL02B67H703L', 1, 3);
INSERT INTO `PalestraDBWeb`.`Presenze` (`Allievo_Codice_Fiscale`, `Lezione_CodCorso`, `Lezione_Codice_Lezione`) VALUES ('RCCMLR07M60H703U', 1, 3);
INSERT INTO `PalestraDBWeb`.`Presenze` (`Allievo_Codice_Fiscale`, `Lezione_CodCorso`, `Lezione_Codice_Lezione`) VALUES ('TASSVT08T16H703Q', 1, 3);
INSERT INTO `PalestraDBWeb`.`Presenze` (`Allievo_Codice_Fiscale`, `Lezione_CodCorso`, `Lezione_Codice_Lezione`) VALUES ('DCCGTN11L06C361E', 1, 4);
INSERT INTO `PalestraDBWeb`.`Presenze` (`Allievo_Codice_Fiscale`, `Lezione_CodCorso`, `Lezione_Codice_Lezione`) VALUES ('MPRMNL02B67H703L', 1, 4);
INSERT INTO `PalestraDBWeb`.`Presenze` (`Allievo_Codice_Fiscale`, `Lezione_CodCorso`, `Lezione_Codice_Lezione`) VALUES ('RCCMLR07M60H703U', 1, 4);
INSERT INTO `PalestraDBWeb`.`Presenze` (`Allievo_Codice_Fiscale`, `Lezione_CodCorso`, `Lezione_Codice_Lezione`) VALUES ('TASSVT08T16H703Q', 1, 4);
INSERT INTO `PalestraDBWeb`.`Presenze` (`Allievo_Codice_Fiscale`, `Lezione_CodCorso`, `Lezione_Codice_Lezione`) VALUES ('DCCGTN11L06C361E', 1, 5);
INSERT INTO `PalestraDBWeb`.`Presenze` (`Allievo_Codice_Fiscale`, `Lezione_CodCorso`, `Lezione_Codice_Lezione`) VALUES ('MPRMNL02B67H703L', 1, 5);
INSERT INTO `PalestraDBWeb`.`Presenze` (`Allievo_Codice_Fiscale`, `Lezione_CodCorso`, `Lezione_Codice_Lezione`) VALUES ('RCCMLR07M60H703U', 1, 5);
INSERT INTO `PalestraDBWeb`.`Presenze` (`Allievo_Codice_Fiscale`, `Lezione_CodCorso`, `Lezione_Codice_Lezione`) VALUES ('TASSVT08T16H703Q', 1, 5);
INSERT INTO `PalestraDBWeb`.`Presenze` (`Allievo_Codice_Fiscale`, `Lezione_CodCorso`, `Lezione_Codice_Lezione`) VALUES ('MPRMNL02B67H703L', 2, 1);
INSERT INTO `PalestraDBWeb`.`Presenze` (`Allievo_Codice_Fiscale`, `Lezione_CodCorso`, `Lezione_Codice_Lezione`) VALUES ('SCICSM02L25H703I', 2, 1);
INSERT INTO `PalestraDBWeb`.`Presenze` (`Allievo_Codice_Fiscale`, `Lezione_CodCorso`, `Lezione_Codice_Lezione`) VALUES ('MPRMNL02B67H703L', 2, 2);
INSERT INTO `PalestraDBWeb`.`Presenze` (`Allievo_Codice_Fiscale`, `Lezione_CodCorso`, `Lezione_Codice_Lezione`) VALUES ('SCICSM02L25H703I', 2, 2);
INSERT INTO `PalestraDBWeb`.`Presenze` (`Allievo_Codice_Fiscale`, `Lezione_CodCorso`, `Lezione_Codice_Lezione`) VALUES ('MPRMNL02B67H703L', 2, 3);
INSERT INTO `PalestraDBWeb`.`Presenze` (`Allievo_Codice_Fiscale`, `Lezione_CodCorso`, `Lezione_Codice_Lezione`) VALUES ('SCICSM02L25H703I', 2, 3);
INSERT INTO `PalestraDBWeb`.`Presenze` (`Allievo_Codice_Fiscale`, `Lezione_CodCorso`, `Lezione_Codice_Lezione`) VALUES ('MPRMNL02B67H703L', 2, 4);
INSERT INTO `PalestraDBWeb`.`Presenze` (`Allievo_Codice_Fiscale`, `Lezione_CodCorso`, `Lezione_Codice_Lezione`) VALUES ('SCICSM02L25H703I', 2, 4);
INSERT INTO `PalestraDBWeb`.`Presenze` (`Allievo_Codice_Fiscale`, `Lezione_CodCorso`, `Lezione_Codice_Lezione`) VALUES ('MPRMNL02B67H703L', 2, 5);
INSERT INTO `PalestraDBWeb`.`Presenze` (`Allievo_Codice_Fiscale`, `Lezione_CodCorso`, `Lezione_Codice_Lezione`) VALUES ('SCICSM02L25H703I', 2, 5);
INSERT INTO `PalestraDBWeb`.`Presenze` (`Allievo_Codice_Fiscale`, `Lezione_CodCorso`, `Lezione_Codice_Lezione`) VALUES ('FRRMRC93L30E131V', 3, 1);
INSERT INTO `PalestraDBWeb`.`Presenze` (`Allievo_Codice_Fiscale`, `Lezione_CodCorso`, `Lezione_Codice_Lezione`) VALUES ('GRMMNL91R47A489A', 4, 1);
INSERT INTO `PalestraDBWeb`.`Presenze` (`Allievo_Codice_Fiscale`, `Lezione_CodCorso`, `Lezione_Codice_Lezione`) VALUES ('VLLDGI93A08C361G', 3, 1);
INSERT INTO `PalestraDBWeb`.`Presenze` (`Allievo_Codice_Fiscale`, `Lezione_CodCorso`, `Lezione_Codice_Lezione`) VALUES ('FRRMRC93L30E131V', 3, 2);
INSERT INTO `PalestraDBWeb`.`Presenze` (`Allievo_Codice_Fiscale`, `Lezione_CodCorso`, `Lezione_Codice_Lezione`) VALUES ('GRMMNL91R47A489A', 4, 2);
INSERT INTO `PalestraDBWeb`.`Presenze` (`Allievo_Codice_Fiscale`, `Lezione_CodCorso`, `Lezione_Codice_Lezione`) VALUES ('VLLDGI93A08C361G', 3, 2);
INSERT INTO `PalestraDBWeb`.`Presenze` (`Allievo_Codice_Fiscale`, `Lezione_CodCorso`, `Lezione_Codice_Lezione`) VALUES ('FRRMRC93L30E131V', 3, 3);
INSERT INTO `PalestraDBWeb`.`Presenze` (`Allievo_Codice_Fiscale`, `Lezione_CodCorso`, `Lezione_Codice_Lezione`) VALUES ('GRMMNL91R47A489A', 4, 3);
INSERT INTO `PalestraDBWeb`.`Presenze` (`Allievo_Codice_Fiscale`, `Lezione_CodCorso`, `Lezione_Codice_Lezione`) VALUES ('VLLDGI93A08C361G', 3, 3);
INSERT INTO `PalestraDBWeb`.`Presenze` (`Allievo_Codice_Fiscale`, `Lezione_CodCorso`, `Lezione_Codice_Lezione`) VALUES ('FRRMRC93L30E131V', 3, 4);
INSERT INTO `PalestraDBWeb`.`Presenze` (`Allievo_Codice_Fiscale`, `Lezione_CodCorso`, `Lezione_Codice_Lezione`) VALUES ('GRMMNL91R47A489A', 4, 4);
INSERT INTO `PalestraDBWeb`.`Presenze` (`Allievo_Codice_Fiscale`, `Lezione_CodCorso`, `Lezione_Codice_Lezione`) VALUES ('VLLDGI93A08C361G', 3, 4);
INSERT INTO `PalestraDBWeb`.`Presenze` (`Allievo_Codice_Fiscale`, `Lezione_CodCorso`, `Lezione_Codice_Lezione`) VALUES ('FRRMRC93L30E131V', 3, 5);
INSERT INTO `PalestraDBWeb`.`Presenze` (`Allievo_Codice_Fiscale`, `Lezione_CodCorso`, `Lezione_Codice_Lezione`) VALUES ('GRMMNL91R47A489A', 4, 5);
INSERT INTO `PalestraDBWeb`.`Presenze` (`Allievo_Codice_Fiscale`, `Lezione_CodCorso`, `Lezione_Codice_Lezione`) VALUES ('VLLDGI93A08C361G', 3, 5);
INSERT INTO `PalestraDBWeb`.`Presenze` (`Allievo_Codice_Fiscale`, `Lezione_CodCorso`, `Lezione_Codice_Lezione`) VALUES ('CRMGCM09E16H7035', 4, 1);
INSERT INTO `PalestraDBWeb`.`Presenze` (`Allievo_Codice_Fiscale`, `Lezione_CodCorso`, `Lezione_Codice_Lezione`) VALUES ('PCLNRC10H29H703Z', 4, 1);
INSERT INTO `PalestraDBWeb`.`Presenze` (`Allievo_Codice_Fiscale`, `Lezione_CodCorso`, `Lezione_Codice_Lezione`) VALUES ('CRMGCM09E16H7035', 4, 2);
INSERT INTO `PalestraDBWeb`.`Presenze` (`Allievo_Codice_Fiscale`, `Lezione_CodCorso`, `Lezione_Codice_Lezione`) VALUES ('PCLNRC10H29H703Z', 4, 2);
INSERT INTO `PalestraDBWeb`.`Presenze` (`Allievo_Codice_Fiscale`, `Lezione_CodCorso`, `Lezione_Codice_Lezione`) VALUES ('CRMGCM09E16H7035', 4, 3);
INSERT INTO `PalestraDBWeb`.`Presenze` (`Allievo_Codice_Fiscale`, `Lezione_CodCorso`, `Lezione_Codice_Lezione`) VALUES ('PCLNRC10H29H703Z', 4, 3);
INSERT INTO `PalestraDBWeb`.`Presenze` (`Allievo_Codice_Fiscale`, `Lezione_CodCorso`, `Lezione_Codice_Lezione`) VALUES ('CRMGCM09E16H7035', 4, 4);
INSERT INTO `PalestraDBWeb`.`Presenze` (`Allievo_Codice_Fiscale`, `Lezione_CodCorso`, `Lezione_Codice_Lezione`) VALUES ('PCLNRC10H29H703Z', 4, 4);
INSERT INTO `PalestraDBWeb`.`Presenze` (`Allievo_Codice_Fiscale`, `Lezione_CodCorso`, `Lezione_Codice_Lezione`) VALUES ('CRMGCM09E16H7035', 4, 5);
INSERT INTO `PalestraDBWeb`.`Presenze` (`Allievo_Codice_Fiscale`, `Lezione_CodCorso`, `Lezione_Codice_Lezione`) VALUES ('PCLNRC10H29H703Z', 4, 5);
INSERT INTO `PalestraDBWeb`.`Presenze` (`Allievo_Codice_Fiscale`, `Lezione_CodCorso`, `Lezione_Codice_Lezione`) VALUES ('CSSCRS05C23H703K', 5, 1);
INSERT INTO `PalestraDBWeb`.`Presenze` (`Allievo_Codice_Fiscale`, `Lezione_CodCorso`, `Lezione_Codice_Lezione`) VALUES ('TASSVT08T16H703Q', 5, 1);
INSERT INTO `PalestraDBWeb`.`Presenze` (`Allievo_Codice_Fiscale`, `Lezione_CodCorso`, `Lezione_Codice_Lezione`) VALUES ('CSSCRS05C23H703K', 5, 2);
INSERT INTO `PalestraDBWeb`.`Presenze` (`Allievo_Codice_Fiscale`, `Lezione_CodCorso`, `Lezione_Codice_Lezione`) VALUES ('TASSVT08T16H703Q', 5, 2);
INSERT INTO `PalestraDBWeb`.`Presenze` (`Allievo_Codice_Fiscale`, `Lezione_CodCorso`, `Lezione_Codice_Lezione`) VALUES ('CSSCRS05C23H703K', 5, 3);
INSERT INTO `PalestraDBWeb`.`Presenze` (`Allievo_Codice_Fiscale`, `Lezione_CodCorso`, `Lezione_Codice_Lezione`) VALUES ('TASSVT08T16H703Q', 5, 3);
INSERT INTO `PalestraDBWeb`.`Presenze` (`Allievo_Codice_Fiscale`, `Lezione_CodCorso`, `Lezione_Codice_Lezione`) VALUES ('CSSCRS05C23H703K', 5, 4);
INSERT INTO `PalestraDBWeb`.`Presenze` (`Allievo_Codice_Fiscale`, `Lezione_CodCorso`, `Lezione_Codice_Lezione`) VALUES ('TASSVT08T16H703Q', 5, 4);
INSERT INTO `PalestraDBWeb`.`Presenze` (`Allievo_Codice_Fiscale`, `Lezione_CodCorso`, `Lezione_Codice_Lezione`) VALUES ('CSSCRS05C23H703K', 5, 5);
INSERT INTO `PalestraDBWeb`.`Presenze` (`Allievo_Codice_Fiscale`, `Lezione_CodCorso`, `Lezione_Codice_Lezione`) VALUES ('TASSVT08T16H703Q', 5, 5);
INSERT INTO `PalestraDBWeb`.`Presenze` (`Allievo_Codice_Fiscale`, `Lezione_CodCorso`, `Lezione_Codice_Lezione`) VALUES ('NCLLSN92P21I438Z', 1, 1);
INSERT INTO `PalestraDBWeb`.`Presenze` (`Allievo_Codice_Fiscale`, `Lezione_CodCorso`, `Lezione_Codice_Lezione`) VALUES ('NCLLSN92P21I438Z', 1, 2);
INSERT INTO `PalestraDBWeb`.`Presenze` (`Allievo_Codice_Fiscale`, `Lezione_CodCorso`, `Lezione_Codice_Lezione`) VALUES ('NCLLSN92P21I438Z', 1, 3);
INSERT INTO `PalestraDBWeb`.`Presenze` (`Allievo_Codice_Fiscale`, `Lezione_CodCorso`, `Lezione_Codice_Lezione`) VALUES ('NCLLSN92P21I438Z', 1, 4);
INSERT INTO `PalestraDBWeb`.`Presenze` (`Allievo_Codice_Fiscale`, `Lezione_CodCorso`, `Lezione_Codice_Lezione`) VALUES ('NCLLSN92P21I438Z', 1, 5);

COMMIT;


-- -----------------------------------------------------
-- Data for table `PalestraDBWeb`.`Tiene`
-- -----------------------------------------------------
START TRANSACTION;
USE `PalestraDBWeb`;
INSERT INTO `PalestraDBWeb`.`Tiene` (`Codice_Fiscale`, `Codice_Corso`) VALUES ('LNGGNN75P30H703B', 1);
INSERT INTO `PalestraDBWeb`.`Tiene` (`Codice_Fiscale`, `Codice_Corso`) VALUES ('VLLLSU93L70H703F', 1);
INSERT INTO `PalestraDBWeb`.`Tiene` (`Codice_Fiscale`, `Codice_Corso`) VALUES ('LNGGNN75P30H703B', 2);
INSERT INTO `PalestraDBWeb`.`Tiene` (`Codice_Fiscale`, `Codice_Corso`) VALUES ('CSBVCN89E30H703E', 3);
INSERT INTO `PalestraDBWeb`.`Tiene` (`Codice_Fiscale`, `Codice_Corso`) VALUES ('MZZPSL94T28M289C', 4);
INSERT INTO `PalestraDBWeb`.`Tiene` (`Codice_Fiscale`, `Codice_Corso`) VALUES ('VLLLSU93L70H703F', 4);
INSERT INTO `PalestraDBWeb`.`Tiene` (`Codice_Fiscale`, `Codice_Corso`) VALUES ('MZZPSL94T28M289C', 5);
INSERT INTO `PalestraDBWeb`.`Tiene` (`Codice_Fiscale`, `Codice_Corso`) VALUES ('VLLLSU93L70H703F', 5);

COMMIT;


-- -----------------------------------------------------
-- Data for table `PalestraDBWeb`.`Telefono_istruttore`
-- -----------------------------------------------------
START TRANSACTION;
USE `PalestraDBWeb`;
INSERT INTO `PalestraDBWeb`.`Telefono_istruttore` (`Istruttore_Codice_Fiscale`, `Numero`) VALUES ('CSBVCN89E30H703E', '3408509844');
INSERT INTO `PalestraDBWeb`.`Telefono_istruttore` (`Istruttore_Codice_Fiscale`, `Numero`) VALUES ('LNGGNN75P30H703B', '3286365022');
INSERT INTO `PalestraDBWeb`.`Telefono_istruttore` (`Istruttore_Codice_Fiscale`, `Numero`) VALUES ('LNGGNN75P30H703B', '3470922453');
INSERT INTO `PalestraDBWeb`.`Telefono_istruttore` (`Istruttore_Codice_Fiscale`, `Numero`) VALUES ('MZZPSL94T28M289C', '3332951227');
INSERT INTO `PalestraDBWeb`.`Telefono_istruttore` (`Istruttore_Codice_Fiscale`, `Numero`) VALUES ('VLLLSU93L70H703F', '3275908433');

COMMIT;


-- -----------------------------------------------------
-- Data for table `PalestraDBWeb`.`Telefono_allievo`
-- -----------------------------------------------------
START TRANSACTION;
USE `PalestraDBWeb`;
INSERT INTO `PalestraDBWeb`.`Telefono_allievo` (`Allievo_Codice_Fiscale`, `Numero`) VALUES ('CRMGCM09E16H7035', '3405321782');
INSERT INTO `PalestraDBWeb`.`Telefono_allievo` (`Allievo_Codice_Fiscale`, `Numero`) VALUES ('DCCGTN11L06C361E', '3290986769');
INSERT INTO `PalestraDBWeb`.`Telefono_allievo` (`Allievo_Codice_Fiscale`, `Numero`) VALUES ('FRRMRC93L30E131V', '3334164693');
INSERT INTO `PalestraDBWeb`.`Telefono_allievo` (`Allievo_Codice_Fiscale`, `Numero`) VALUES ('GRMMNL91R47A489A', '3894405791');
INSERT INTO `PalestraDBWeb`.`Telefono_allievo` (`Allievo_Codice_Fiscale`, `Numero`) VALUES ('MPRMNL02B67H703L', '3381220901');
INSERT INTO `PalestraDBWeb`.`Telefono_allievo` (`Allievo_Codice_Fiscale`, `Numero`) VALUES ('PCLNRC10H29H703Z', '3203092032');
INSERT INTO `PalestraDBWeb`.`Telefono_allievo` (`Allievo_Codice_Fiscale`, `Numero`) VALUES ('RCCMLR07M60H703U', '3476418115');
INSERT INTO `PalestraDBWeb`.`Telefono_allievo` (`Allievo_Codice_Fiscale`, `Numero`) VALUES ('TASSVT08T16H703Q', '3240750996');
INSERT INTO `PalestraDBWeb`.`Telefono_allievo` (`Allievo_Codice_Fiscale`, `Numero`) VALUES ('VLLDGI93A08C361G', '3315807943');
INSERT INTO `PalestraDBWeb`.`Telefono_allievo` (`Allievo_Codice_Fiscale`, `Numero`) VALUES ('CSSCRS05C23H703K', '3394671491');
INSERT INTO `PalestraDBWeb`.`Telefono_allievo` (`Allievo_Codice_Fiscale`, `Numero`) VALUES ('SCICSM02L25H703I', '3338935347');
INSERT INTO `PalestraDBWeb`.`Telefono_allievo` (`Allievo_Codice_Fiscale`, `Numero`) VALUES ('NCLLSN92P21I438Z', '3312124355');

COMMIT;


-- -----------------------------------------------------
-- Data for table `PalestraDBWeb`.`Post`
-- -----------------------------------------------------
START TRANSACTION;
USE `PalestraDBWeb`;
INSERT INTO `PalestraDBWeb`.`Post` (`Date`, `Content`) VALUES ('2016-09-11', 'Prova prova prova');

COMMIT;


-- -----------------------------------------------------
-- Data for table `PalestraDBWeb`.`Sostiene`
-- -----------------------------------------------------
START TRANSACTION;
USE `PalestraDBWeb`;
INSERT INTO `PalestraDBWeb`.`Sostiene` (`Allievo_Codice_Fiscale`, `Esame_ID_Esame`, `Esame_Corso_Codice_Corso`, `Voto`) VALUES ('CRMGCM09E16H7035', 1, 4, '6');
INSERT INTO `PalestraDBWeb`.`Sostiene` (`Allievo_Codice_Fiscale`, `Esame_ID_Esame`, `Esame_Corso_Codice_Corso`, `Voto`) VALUES ('CSSCRS05C23H703K', 1, 5, '9');
INSERT INTO `PalestraDBWeb`.`Sostiene` (`Allievo_Codice_Fiscale`, `Esame_ID_Esame`, `Esame_Corso_Codice_Corso`, `Voto`) VALUES ('DCCGTN11L06C361E', 1, 1, '6');
INSERT INTO `PalestraDBWeb`.`Sostiene` (`Allievo_Codice_Fiscale`, `Esame_ID_Esame`, `Esame_Corso_Codice_Corso`, `Voto`) VALUES ('MPRMNL02B67H703L', 1, 4, '7');
INSERT INTO `PalestraDBWeb`.`Sostiene` (`Allievo_Codice_Fiscale`, `Esame_ID_Esame`, `Esame_Corso_Codice_Corso`, `Voto`) VALUES ('PCLNRC10H29H703Z', 1, 1, '8');
INSERT INTO `PalestraDBWeb`.`Sostiene` (`Allievo_Codice_Fiscale`, `Esame_ID_Esame`, `Esame_Corso_Codice_Corso`, `Voto`) VALUES ('FRRMRC93L30E131V', 1, 3, '8');
INSERT INTO `PalestraDBWeb`.`Sostiene` (`Allievo_Codice_Fiscale`, `Esame_ID_Esame`, `Esame_Corso_Codice_Corso`, `Voto`) VALUES ('GRMMNL91R47A489A', 1, 4, '8');
INSERT INTO `PalestraDBWeb`.`Sostiene` (`Allievo_Codice_Fiscale`, `Esame_ID_Esame`, `Esame_Corso_Codice_Corso`, `Voto`) VALUES ('NCLLSN92P21I438Z', 1, 1, '9');
INSERT INTO `PalestraDBWeb`.`Sostiene` (`Allievo_Codice_Fiscale`, `Esame_ID_Esame`, `Esame_Corso_Codice_Corso`, `Voto`) VALUES ('RCCMLR07M60H703U', 1, 1, '8');
INSERT INTO `PalestraDBWeb`.`Sostiene` (`Allievo_Codice_Fiscale`, `Esame_ID_Esame`, `Esame_Corso_Codice_Corso`, `Voto`) VALUES ('SCICSM02L25H703I', 1, 2, '9');
INSERT INTO `PalestraDBWeb`.`Sostiene` (`Allievo_Codice_Fiscale`, `Esame_ID_Esame`, `Esame_Corso_Codice_Corso`, `Voto`) VALUES ('TASSVT08T16H703Q', 1, 1, '7');
INSERT INTO `PalestraDBWeb`.`Sostiene` (`Allievo_Codice_Fiscale`, `Esame_ID_Esame`, `Esame_Corso_Codice_Corso`, `Voto`) VALUES ('VLLDGI93A08C361G', 1, 3, '8');

COMMIT;


-- -----------------------------------------------------
-- Data for table `PalestraDBWeb`.`Attivita`
-- -----------------------------------------------------
START TRANSACTION;
USE `PalestraDBWeb`;
INSERT INTO `PalestraDBWeb`.`Attivita` (`idAttivita`, `Descrizione1`, `Descrizione2`, `Descrizione3`, `Descrizione4`, `Titolo1`, `Titolo2`, `Titolo3`, `Titolo4`) VALUES ('aikido', 'Aikido  is a modern Japanese martial art developed by Morihei Ueshiba as a synthesis of his martial studies, philosophy, and religious beliefs. Aikido is often translated as \"the way of unifying (with) life energy\"] or as \"the way of harmonious spirit.\" Ueshiba\'s goal was to create an art that practitioners could use to defend themselves while also protecting their attacker from injury. Aikido techniques consist of entering and turning movements that redirect the momentum of an opponent\'s attack, and a throw or joint lock that terminates the technique.', 'Aikido derives mainly from the martial art of Daito-ryu Aiki-jujutsu, but began to diverge from it in the late 1920s, partly due to Ueshiba\'s involvement with the Omoto-kyo religion. Ueshiba\'s early students\' documents bear the term aiki-jujutsu. Ueshiba\'s senior students have different approaches to aikido, depending partly on when they studied with him. Today aikido is found all over the world in a number of styles, with broad ranges of interpretation and emphasis. However, they all share techniques formulated by Ueshiba and most have concern for the well-being of the attacker.', 'AAAAAAAAAAAAAAAAAAA', 'BBBBBBBBBBBBBBBB', 'L\'Aikido', 'Breve storia', 'EEEEEEEEEEEEEEEEEEEEEE', 'FFFFFFFFFFFFFFF');
INSERT INTO `PalestraDBWeb`.`Attivita` (`idAttivita`, `Descrizione1`, `Descrizione2`, `Descrizione3`, `Descrizione4`, `Titolo1`, `Titolo2`, `Titolo3`, `Titolo4`) VALUES ('mainpage', 'La nostra palestra è attrezzata al meglio per fornire la miglior esperienza di sport indoor possibile. Sono offerte sia discipline standard che arti marziali varie. <br> I nostri istruttori sono pienamente qualificati e periodicamente aggiornati riguardo le ultimissime tecniche di allenamento e bodybuilding. <br> Diamo la possibilità di svolgere attività di body building, sia cardio che attrezzistica a livello anche agonistico. Oppure si può svolgere una normale attività fisica che ha come obiettivo il benessere fisico della persona.  <br> Il cardio hala funzione di migliorare lo stato di salute dell\'apparato circolatorio, prevenire malattie cardiovascolari, tonificare la muscolatura dell\'individuo (senza accrescerla), bruciare calorie e grassi, allenare la resistenza dell\'apparato respiratorio e regolare il metabolismo umano. Se e solo se abbinato a una dieta ipocalorica e ipolipidica, il cardio svolge l\'importante funzione di ridurre la quantità di massa grassa nel corpo dell\'individuo, il quale riesce così a perdere peso in maniera salutare. <br> L\'attività di muscolazione è anche nota come \"fare attrezzi\". Lo scopo di questa attività è di allenare i muscoli dell\'individuo aumentando la loro massa o cercando di mantenere la massa già ottenuta. Lo scopo del \"fare attrezzi\" è quello di avere un fisico più robusto e forte, e, secondo criteri oggettivi, più attraente dal punto di vista estetico, ma l\'aspetto esteriore è soltanto una conseguenza dello sforzo muscolare, e non il suo fine. <br> Si offrono inoltre vari corsi di arti marziali, per allenare la mentre oltre che il fisico.', 'Con arte marziale si intende un insieme di pratiche fisiche, mentali e spirituali legate al combattimento. <br> Originariamente utilizzate per aumentare le possibilità di vittoria del guerriero in battaglia, oggi sono una forma di percorso di miglioramento individuale e di attività fisica completa oltre che difesa personale. <br> Il termine è entrato nell\'uso comune agli inizi degli anni sessanta quando vennero introdotte in occidente le arti marziali orientali e talvolta viene associata solo a queste ed in particolare alle arti marziali cinesi, giapponesi e coreane. <br> In realtà già dal 1500 i sistemi di combattimento in Europa venivano definiti in questo modo, un manuale inglese di scherma del 1639 in particolare lo utilizzava riferendosi specificatamente alla \"scienza e arte\" del duello di spade, facendolo derivare dal latino poiché \"arte marziale\" significa letteralmente \"arte di Marte\", il dio romano della guerra. <br> Oggi, le arti marziali vengono studiate per varie ragioni: ottenere abilità di combattimento, autodifesa, sport, salute fisica e forma di ginnastica, autocontrollo, meditazione, responsabilizzazione sull\'uso della forza, acquisire confidenza col proprio corpo, sicurezza nelle proprie capacità e consapevolezza dei propri limiti. <br> A questo scopo in Giappone e in Cina, si pratica il taiso un particolare tipo di allenamento associato alla preparazione atletica di chi pratica arti marziali. Alcune arti marziali sono considerate \"tradizionali\" e sono legate ad uno sfondo etnico, religioso o culturale, mentre altre sono moderni sistemi sviluppati da un fondatore o da un\'associazione.', 'Il termine fitness deriva dall\'aggettivo inglese fit («adatto») e viene tradotto in lingua italiana con i termini preparazione fisica e stato di forma fisica. <br> Dagli anni \'90 questo termine è stato adoperato sempre più frequentemente per definire lo stato di benessere fisico o la forma fisica dell\'individuo. <br> In ambito sportivo il fitness può essere inteso come: <br> Fitness specifico, cioè la capacità di svolgere un particolare compito motorio, indipendentemente dallo stato di forma fisica del soggetto; <br> Fitness generale, quando viene identificato con lo stato generale di salute, forma fisica e benessere dell\'organismo. <br> L\'attività di fitness può essere praticata nelle palestre (Centri Fitness) o all\'aria aperta. Qualsiasi attività motoria, adattata alle caratteristiche della persona, può essere un mezzo per fare del fitness. <br> Nella maggior parte dei casi la persona che pratica del fitness ha obiettivi salutistici/estetici e non di performance. La propria condizione fisica può però essere verificata anche con prove obiettive standardizzate in relazione alla propria età ed al proprio genere. <br> L\'attività fisica che rientra sotto il nome di fitness, la si può praticare usando esercizi a corpo libero sia per tonificare, che per aumentare la mobilità articolare (stretching), si potranno usare dei piccoli attrezzi come manubri, elastici, cavigliere. Si potranno poi utilizzare attrezzature specifiche del settore che potranno essere macchine per allenamenti cardiovascolari oppure macchine per la tonificazione muscolare.', 'Per iscrizioni, ulteriori informazioni, la nostra reception è sempre disponibili negli orari di apertura. <br> E’ possibile definire appuntamenti con personal trainer singolarmente, o usufruire della funzione dei trainer della palestra. <br> Vari tipi di abbonamenti sono disponibili.', 'La nostra palestra', 'Arti marziali', 'Fitness', 'Info');

COMMIT;

