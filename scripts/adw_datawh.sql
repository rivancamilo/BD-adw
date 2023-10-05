
CREATE DATABASE IF NOT EXISTS datawh;
USE datawh;



-- -----------------------------------------------------
-- Table Dim_Producto
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS datawh.Dim_Producto (
  productoKey INT NOT NULL AUTO_INCREMENT,
  ProductID INT NOT NULL,
  nomProducto VARCHAR(120) NULL,
  categoria VARCHAR(120) NULL,
  subcategoria VARCHAR(120) NULL,
  tipoProceso VARCHAR(45) NULL,
  clase VARCHAR(45) NULL,
  modelo VARCHAR(120) NULL,
  linea VARCHAR(45) NULL,
  genero VARCHAR(45) NULL,
  color VARCHAR(45) NULL,
  estadoBodega VARCHAR(45) NULL,
  PRIMARY KEY (productoKey),
  UNIQUE INDEX unk_productoID (ProductID ASC) VISIBLE
) AUTO_INCREMENT = 3000;


-- -----------------------------------------------------
-- Table Dim_Ubicacion
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS datawh.Dim_Ubicacion (
  ubicacionKey INT NOT NULL AUTO_INCREMENT,
  TerritoryID INT NOT NULL,
  continente VARCHAR(70) NULL,
  pais VARCHAR(120) NULL,
  estado VARCHAR(120) NULL,
  ciudad VARCHAR(50) NULL,
  PRIMARY KEY (ubicacionKey),
  UNIQUE INDEX unk_ubicacionKey (ubicacionKey ASC) VISIBLE
)AUTO_INCREMENT = 1200;



-- -----------------------------------------------------
-- Table Dim_Tiempo
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS datawh.Dim_Tiempo (
  dateKey INT NOT NULL,
  dateValue DATE NULL,
  numMes INT NULL,
  semestre VARCHAR(45) NULL,
  mesNom VARCHAR(45) NULL,
  numYear INT NULL,
  yearMesNumber VARCHAR(45) NULL,
  PRIMARY KEY (dateKey),
  UNIQUE INDEX unkdateValue (dateValue ASC) INVISIBLE
);



-- -----------------------------------------------------
-- Table Dim_Cliente
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS datawh.Dim_Cliente (
  clienteKey INT NOT NULL AUTO_INCREMENT,
  CustomerID INT NOT NULL,
  estadoCivil VARCHAR(45) NULL,
  genero VARCHAR(45) NULL,
  numHijos VARCHAR(45) NULL,
  casaPropia VARCHAR(45) NULL,
  datePrimeraCompra DATE NULL,
  edad INT NULL,
  rangoEdad VARCHAR(120) NULL,
  continente VARCHAR(120) NULL,
  pais VARCHAR(120) NULL,
  PRIMARY KEY (clienteKey),
  UNIQUE INDEX unk_clienteID (CustomerID ASC) VISIBLE
)AUTO_INCREMENT = 9999;



