CREATE TABLE Aeropuerto
  (
    ID_Aeropuerto     NUMBER (5) NOT NULL ,
    NombreAeropuerto  VARCHAR2 (100) NOT NULL ,
    Ciudad            VARCHAR2 (100) NOT NULL ,
    Direccion         VARCHAR2 (100) NOT NULL ,
    FechaConstruccion DATE NOT NULL
  ) ;
ALTER TABLE Aeropuerto ADD CONSTRAINT Aeropuerto_PK PRIMARY KEY ( ID_Aeropuerto ) ;
CREATE TABLE Avion
  (
    ID_Avion         NUMBER (5) NOT NULL ,
    ModeloAvion      VARCHAR2 (100) NOT NULL ,
    FechaFabricacion DATE NOT NULL ,
    Tipo             VARCHAR2 (50) NOT NULL ,
    PesoMax          NUMBER (10,2) ,
    NumeroPasajeros  NUMBER (5)
  ) ;
ALTER TABLE Avion ADD CONSTRAINT Avion_PK PRIMARY KEY ( ID_Avion ) ;
CREATE TABLE Becario
  (
    DNI         VARCHAR2 (9) NOT NULL ,
    Universidad VARCHAR2 (100) NOT NULL ,
    FInicio     DATE NOT NULL ,
    FFin        DATE NOT NULL ,
    DNI_tutor   VARCHAR2 (9) NOT NULL
  ) ;
ALTER TABLE Becario ADD CONSTRAINT Becario_PK PRIMARY KEY ( DNI ) ;
CREATE TABLE Fijo
  (
    DNI     VARCHAR2 (9) NOT NULL ,
    Salario NUMBER (10,2) NOT NULL
  ) ;
ALTER TABLE Fijo ADD CONSTRAINT Fijo_PK PRIMARY KEY ( DNI ) ;
CREATE TABLE Trabajador
  (
    DNI             VARCHAR2 (9) NOT NULL ,
    Nombre          VARCHAR2 (100) NOT NULL ,
    FechaNacimiento DATE NOT NULL ,
    EMail           VARCHAR2 (100) ,
    Tipo            VARCHAR2 (100) NOT NULL ,
    ID_Aeropuerto   NUMBER (5) NOT NULL
  ) ;
ALTER TABLE Trabajador ADD CONSTRAINT Trabajador_PK PRIMARY KEY ( DNI ) ;
CREATE TABLE Trayecto
  (
    ID_Trayecto          NUMBER (5) NOT NULL ,
    ID_AeropuertoOrigen  NUMBER (5) NOT NULL ,
    ID_AeropuertoDestino NUMBER (5) NOT NULL
  ) ;
ALTER TABLE Trayecto ADD CONSTRAINT Trayecto_PK PRIMARY KEY ( ID_Trayecto ) ;
CREATE TABLE TrayectosFijados
  (
    ID_TrayectoFijado NUMBER (5) NOT NULL ,
    Fecha             DATE NOT NULL ,
    Coste             NUMBER (10,2) NOT NULL ,
    ID_Trayecto       NUMBER (5) NOT NULL ,
    ID_Avion          NUMBER (5) NOT NULL
  ) ;
ALTER TABLE TrayectosFijados ADD CONSTRAINT TrayectosFijados_PK PRIMARY KEY ( ID_TrayectoFijado ) ;
CREATE TABLE Usuario
  (
    ID_Usuario      NUMBER (5) NOT NULL ,
    "User"          VARCHAR2 (100) NOT NULL ,
    Pass            VARCHAR2 (100) NOT NULL ,
    Nombre          VARCHAR2 (100) NOT NULL ,
    EMail           VARCHAR2 (100) NOT NULL ,
    FechaNacimiento DATE NOT NULL ,
    PaisNacimiento  VARCHAR2 (100) NOT NULL
  ) ;
ALTER TABLE Usuario ADD CONSTRAINT Usuario_PK PRIMARY KEY ( ID_Usuario ) ;
CREATE TABLE Venta
  (
    ID_Venta          NUMBER (5) NOT NULL ,
    ID_Usuario        NUMBER (5) NOT NULL ,
    ID_TrayectoFijado NUMBER (5) NOT NULL ,
    DNI               VARCHAR2 (9) NOT NULL
  ) ;
ALTER TABLE Venta ADD CONSTRAINT Venta_PK PRIMARY KEY ( ID_Venta ) ;
ALTER TABLE Becario ADD CONSTRAINT Becario_Fijo_FK FOREIGN KEY ( DNI_tutor ) REFERENCES Fijo ( DNI ) ;
ALTER TABLE Becario ADD CONSTRAINT Becario_Trabajador_FK FOREIGN KEY ( DNI ) REFERENCES Trabajador ( DNI ) ;
ALTER TABLE Fijo ADD CONSTRAINT Fijo_Trabajador_FK FOREIGN KEY ( DNI ) REFERENCES Trabajador ( DNI ) ;
ALTER TABLE Trabajador ADD CONSTRAINT Trabajador_Aeropuerto_FK FOREIGN KEY ( ID_Aeropuerto ) REFERENCES Aeropuerto ( ID_Aeropuerto ) ;
ALTER TABLE Trayecto ADD CONSTRAINT Trayecto_Aeropuerto_FK FOREIGN KEY ( ID_AeropuertoOrigen ) REFERENCES Aeropuerto ( ID_Aeropuerto ) ;
ALTER TABLE Trayecto ADD CONSTRAINT Trayecto_Aeropuerto_FKv1 FOREIGN KEY ( ID_AeropuertoDestino ) REFERENCES Aeropuerto ( ID_Aeropuerto ) ;
ALTER TABLE TrayectosFijados ADD CONSTRAINT TrayectosFijados_Avion_FK FOREIGN KEY ( ID_Avion ) REFERENCES Avion ( ID_Avion ) ;
ALTER TABLE TrayectosFijados ADD CONSTRAINT TrayectosFijados_Trayecto_FK FOREIGN KEY ( ID_Trayecto ) REFERENCES Trayecto ( ID_Trayecto ) ;
ALTER TABLE Venta ADD CONSTRAINT Venta_TrayectosFijados_FK FOREIGN KEY ( ID_TrayectoFijado ) REFERENCES TrayectosFijados ( ID_TrayectoFijado ) ;
ALTER TABLE Venta ADD CONSTRAINT Venta_Usuariov1_FK FOREIGN KEY ( ID_Usuario ) REFERENCES Usuario ( ID_Usuario ) ;
