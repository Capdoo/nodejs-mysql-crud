CREATE DATABASE BDMIGRANA;

CREATE TABLE USUARIOS(
    ID INTEGER(11) NOT NULL PRIMARY KEY AUTO_INCREMENT,
    USERNAME VARCHAR(20) NOT NULL,
    PASSWORD VARCHAR(20) NOT NULL,
    NAME VARCHAR (20) NOT NULL,
    FIRST_NAME VARCHAR(50) NOT NULL,
    LAST_NAME VARCHAR(50) NOT NULL,
    EMAIL VARCHAR(50) NOT NULL,
    COMENTARIO_ID INTEGER(11)
);

CREATE TABLE GRAFICAS(
    ID INTEGER(11) NOT NULL PRIMARY KEY AUTO_INCREMENT,
    NOMBRE VARCHAR(20) NOT NULL,
    TIPO_ID INTEGER(11),
    SUPER_DESCRIPCION TEXT NOT NULL,
    DESCRIPCION TEXT NOT NULL,
    DATASET_ID INTEGER(11)

);


CREATE TABLE TIPO_GRAFICAS(
    ID INTEGER(11) NOT NULL PRIMARY KEY AUTO_INCREMENT,
    NOMBRE VARCHAR(20) NOT NULL,
    IMAGEN BLOB,
    DESCRIPCION TEXT NOT NULL
);


CREATE TABLE DATASETS(
    ID INTEGER(11) NOT NULL PRIMARY KEY AUTO_INCREMENT,
    NOMBRE VARCHAR(20) NOT NULL,
    CREATED_AT TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP

);


CREATE TABLE COMENTARIOS(
   ID INTEGER(11) NOT NULL PRIMARY KEY AUTO_INCREMENT, 
    USER_ID INTEGER(11),
    GRAFICA_ID INTEGER(11),
    COMENTARIO TEXT NOT NULL,
    FECHA TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

--INDICAMOS LOS FOREIGN KEY-S

ALTER TABLE GRAFICAS ADD CONSTRAINT FK_GRAFICA_TIPO_GRAFICA
FOREIGN KEY (TIPO_ID) REFERENCES TIPO_GRAFICAS(ID);

ALTER TABLE GRAFICAS ADD CONSTRAINT FK_GRAFICA_DATASET
FOREIGN KEY (DATASET_ID) REFERENCES DATASETS(ID);




ALTER TABLE COMENTARIOS ADD CONSTRAINT FK_COMENTARIO_USUARIO
FOREIGN KEY (USER_ID) REFERENCES USUSARIOS(ID);

ALTER TABLE COMENTARIOS ADD CONSTRAINT FK_COMENTARIO_GRAFICA
FOREIGN KEY (GRAFICA_ID) REFERENCES GRAFICAS(ID);


