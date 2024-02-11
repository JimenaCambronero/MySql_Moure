--  CREATE TABLE
-- Crea una tabla llamada "persons" con nombre de columna (atributos) de tipo int, varchar y date
CREATE TABLE persons (
	id int,
    name varchar(100),
    age int,
    email varchar(50),
    created date
);

-- CONSTRAINTS: Restricciones
-- NOT NULL: Obliga a que el campo id posea siempre un valor no nulo
CREATE TABLE persons2 (
	id int NOT NULL,
    name varchar(100) NOT NULL,
    age int,
    email varchar(50),
    created date
);

-- UNIQUE: Obliga a que el campo id posea valores diferentes
CREATE TABLE persons3 (
	id int NOT NULL,
    name varchar(100) NOT NULL,
    age int,
    email varchar(50),
    created datetime,
    UNIQUE(id)
);

-- PRIMARY KEY: Establece el campo id como clave primaria para futuras relaciones con otras tablas
CREATE TABLE persons4 (
	id int NOT NULL,
    name varchar(100) NOT NULL,
    age int,
    email varchar(50),
    created datetime,
    UNIQUE(id),
    PRIMARY KEY(id)
);

-- CHECK: Establece que el campo age sólo podrá contener valores mayores o iguales a 18
CREATE TABLE persons5 (
	id int NOT NULL,
    name varchar(100) NOT NULL,
    age int,
    email varchar(50),
    created datetime,
    UNIQUE(id),
    PRIMARY KEY(id),
    CHECK(age>=18)
);

-- DEFAULT: Establece un valor por defecto en el campo created correspondiente a la fecha del sistema
CREATE TABLE persons6 (
	id int NOT NULL,
    name varchar(100) NOT NULL,
    age int,
    email varchar(50),
    created datetime DEFAULT CURRENT_TIMESTAMP(),
    UNIQUE(id),
    PRIMARY KEY(id),
    CHECK(age>=18)
);

-- AUTO_INCREMENT: Indica que el campo id siempre se va a incrementar en 1 con cada nuevo inserto
CREATE TABLE persons7 (
	id int NOT NULL AUTO_INCREMENT,
    name varchar(100) NOT NULL,
    age int,
    email varchar(50),
    created datetime DEFAULT CURRENT_TIMESTAMP(),
    UNIQUE(id),
    PRIMARY KEY(id),
    CHECK(age>=18)
);

-- DROP TABLE
-- Elimina la tabla llamada "persons8"
DROP TABLE persons8;

-- ADD: Añade un nuevo atributo surname a la tabla "persons8"
ALTER TABLE persons8
ADD surname varchar(150);

-- RENAME COLUMN: Renombra el atributo surname a description en la tabla "persons8"
ALTER TABLE persons8
RENAME COLUMN surname TO description;

-- MODIFY COLUMN: Modifica el tipo de dato del atributo description en la tabla "persons8"
ALTER TABLE persons8
MODIFY COLUMN description varchar(250);

-- DROP COLUMN: Elimina el atributo description en la tabla "persons8"
ALTER TABLE persons8
DROP COLUMN description;