-- Active: 1727319968267@@localhost@3306@mydb
-- MySQL Script generated by MySQL Workbench
-- Thu Sep 26 02:25:57 2024
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
-- -----------------------------------------------------
-- Schema new_schema
-- -----------------------------------------------------
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`regiones`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`regiones` (
  `id_region` INT NOT NULL,
  `nombre` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_region`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`runas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`runas` (
  `id_runa` INT NOT NULL,
  `nombre` VARCHAR(45) NOT NULL,
  `tipo` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_runa`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`chromas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`chromas` (
  `id_chroma` INT NOT NULL,
  `nombre` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_chroma`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`skins`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`skins` (
  `id_skin` INT NOT NULL,
  `nombre` VARCHAR(45) NOT NULL,
  `precio` VARCHAR(45) NOT NULL,
  `chromas_id_chroma` INT NOT NULL,
  PRIMARY KEY (`id_skin`, `chromas_id_chroma`),
  INDEX `fk_skins_chromas1_idx` (`chromas_id_chroma` ASC) VISIBLE,
  CONSTRAINT `fk_skins_chromas1`
    FOREIGN KEY (`chromas_id_chroma`)
    REFERENCES `mydb`.`chromas` (`id_chroma`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`campeones`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`campeones` (
  `id_campeon` INT NOT NULL,
  `nombre` VARCHAR(45) NOT NULL,
  `precio` VARCHAR(45) NOT NULL,
  `regiones_id_region` INT NOT NULL,
  `runas_id_runa` INT NOT NULL,
  `skins_id_skin` INT NOT NULL,
  PRIMARY KEY (`id_campeon`, `regiones_id_region`, `runas_id_runa`, `skins_id_skin`),
  INDEX `fk_campeones_regiones1_idx` (`regiones_id_region` ASC) VISIBLE,
  INDEX `fk_campeones_runas1_idx` (`runas_id_runa` ASC) VISIBLE,
  INDEX `fk_campeones_skins1_idx` (`skins_id_skin` ASC) VISIBLE,
  CONSTRAINT `fk_campeones_regiones1`
    FOREIGN KEY (`regiones_id_region`)
    REFERENCES `mydb`.`regiones` (`id_region`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_campeones_runas1`
    FOREIGN KEY (`runas_id_runa`)
    REFERENCES `mydb`.`runas` (`id_runa`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_campeones_skins1`
    FOREIGN KEY (`skins_id_skin`)
    REFERENCES `mydb`.`skins` (`id_skin`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`roles`
-- -----------------------------------------------------
CREATE TABLE roles (
    id_rol INT PRIMARY KEY,
    nombre VARCHAR(50)
);



-- -----------------------------------------------------
-- Table `mydb`.`estadisticas en juego`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`estadisticas en juego` (
  `id_estadistica` INT NOT NULL,
  `muertes` INT NOT NULL,
  `asesinatos` INT NOT NULL,
  `asistencias` INT NOT NULL,
  `oro_ganado` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_estadistica`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`partidas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`partidas` (
  `id_partida` INT NOT NULL,
  `duracion` INT NOT NULL,
  `modo_juego` VARCHAR(45) NOT NULL,
  `fecha` DATE NULL,
  PRIMARY KEY (`id_partida`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`equipos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`equipos` (
  `id_equipo` INT NOT NULL,
  `ranking` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_equipo`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`perfil jugadores`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`perfil jugadores` (
  `id_perfil` INT NOT NULL,
  `nivel` INT NOT NULL,
  `rango` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_perfil`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`jugadores`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`jugadores` (
  `id_jugador` INT NOT NULL,
  `roles_id_rol` INT NOT NULL,
  `estadisticas en juego_id_estadistica` INT NOT NULL,
  `partidas_id_partida` INT NOT NULL,
  `equipos_id_equipo` INT NOT NULL,
  `perfil jugadores_id_perfil` INT NOT NULL,
  `campeones_id_campeon` INT NOT NULL,
  PRIMARY KEY (`id_jugador`, `roles_id_rol`, `estadisticas en juego_id_estadistica`, `partidas_id_partida`, `equipos_id_equipo`, `perfil jugadores_id_perfil`, `campeones_id_campeon`),
  INDEX `fk_jugadores_roles1_idx` (`roles_id_rol` ASC) VISIBLE,
  INDEX `fk_jugadores_estadisticas en juego1_idx` (`estadisticas en juego_id_estadistica` ASC) VISIBLE,
  INDEX `fk_jugadores_partidas1_idx` (`partidas_id_partida` ASC) VISIBLE,
  INDEX `fk_jugadores_equipos1_idx` (`equipos_id_equipo` ASC) VISIBLE,
  INDEX `fk_jugadores_perfil jugadores1_idx` (`perfil jugadores_id_perfil` ASC) VISIBLE,
  INDEX `fk_jugadores_campeones1_idx` (`campeones_id_campeon` ASC) VISIBLE,
  CONSTRAINT `fk_jugadores_roles1`
    FOREIGN KEY (`roles_id_rol`)
    REFERENCES `mydb`.`roles` (`id_rol`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_jugadores_estadisticas en juego1`
    FOREIGN KEY (`estadisticas en juego_id_estadistica`)
    REFERENCES `mydb`.`estadisticas en juego` (`id_estadistica`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_jugadores_partidas1`
    FOREIGN KEY (`partidas_id_partida`)
    REFERENCES `mydb`.`partidas` (`id_partida`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_jugadores_equipos1`
    FOREIGN KEY (`equipos_id_equipo`)
    REFERENCES `mydb`.`equipos` (`id_equipo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_jugadores_perfil jugadores1`
    FOREIGN KEY (`perfil jugadores_id_perfil`)
    REFERENCES `mydb`.`perfil jugadores` (`id_perfil`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_jugadores_campeones1`
    FOREIGN KEY (`campeones_id_campeon`)
    REFERENCES `mydb`.`campeones` (`id_campeon`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`habilidades`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`habilidades` (
  `id_habilidad` INT NOT NULL,
  `nombre` VARCHAR(45) NOT NULL,
  `enfriamiento` VARCHAR(45) NOT NULL,
  `tipo` VARCHAR(45) NOT NULL,
  `daño` VARCHAR(45) NOT NULL,
  `id_campeon` INT NOT NULL,
  PRIMARY KEY (`id_habilidad`),
  INDEX `fk_habilidades_1_idx` (`id_campeon` ASC) VISIBLE,
  CONSTRAINT `fk_habilidades_1`
    FOREIGN KEY (`id_campeon`)
    REFERENCES `mydb`.`campeones` (`id_campeon`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`objetos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`objetos` (
  `id_objeto` INT NOT NULL,
  `nombre` VARCHAR(45) NOT NULL,
  `tipo` VARCHAR(45) NOT NULL,
  `precio` VARCHAR(45) NOT NULL,
  `descripcion` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_objeto`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`hechizos de invocador`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`hechizos de invocador` (
  `id_hechizo` INT NOT NULL,
  `nombre` VARCHAR(45) NOT NULL,
  `id_campeon` INT NOT NULL,
  PRIMARY KEY (`id_hechizo`),
  INDEX `fk_hechizos de invocador_campeon_idx` (`id_campeon` ASC) VISIBLE,
  CONSTRAINT `fk_hechizos de invocador_campeon`
    FOREIGN KEY (`id_campeon`)
    REFERENCES `mydb`.`campeones` (`id_campeon`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`campeones_has_objetos`
-- -----------------------------------------------------
CREATE TABLE `campeones_has_objetos` (
    `campeones_id_campeon` INT NOT NULL,
    `objetos_id_objeto` INT NOT NULL,
    PRIMARY KEY (`campeones_id_campeon`, `objetos_id_objeto`),
    FOREIGN KEY (`campeones_id_campeon`) REFERENCES `campeones`(`id_campeon`) ON DELETE CASCADE,
    FOREIGN KEY (`objetos_id_objeto`) REFERENCES `objetos`(`id_objeto`) ON DELETE CASCADE
);



SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
