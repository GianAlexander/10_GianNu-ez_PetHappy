use master
drop database PetHappy
go


CREATE DATABASE PetHappy
GO

USE PetHappy
GO


-- Table: CLIENTE
CREATE TABLE CLIENTE (
    CODCLI char(6)  NOT NULL,
    DNICLI CHAR(8)  NOT NULL,
    NOMCLI varchar(50)  NOT NULL,
    APECLI varchar(50)  NOT NULL,
    CELCLI char(9)  NOT NULL,
    EMACLI varchar(50)  NOT NULL,
    CODUBI Char(6)  NOT NULL,
    CONSTRAINT CLIENTE_pk PRIMARY KEY (CODCLI)
)
GO

-- Table: CONSULTA
CREATE TABLE CONSULTA (
    CODCON char(6)  NOT NULL,
    NOMCON varchar(50)  NOT NULL,
    RAZCON varchar(50)  NOT NULL,
    TIPCON Char(1)  NOT NULL,
	COSCON decimal(8,2)  NOT NULL,
    CONSTRAINT CONSULTA_pk PRIMARY KEY (CODCON)
)
GO

-- Table: PRODUCTO
CREATE TABLE PRODUCTO (
    CODPRO char(6)  NOT NULL,
    NOMPRO Varchar(50)  NOT NULL,
    TIPPRO Char(1)  NOT NULL,
    DESPRO Varchar(50)  NOT NULL,
    CANPRO int  NOT NULL,
    PREPRO decimal(8,2)  NOT NULL,
    STOPRO int  NOT NULL,
    CONSTRAINT PRODUCTO_pk PRIMARY KEY (CODPRO)
)
GO

-- Table: UBIGEO
CREATE TABLE UBIGEO (
    CODUBI Char(6)  NOT NULL,
    DEPUBI Varchar(50)  NOT NULL,
    PROUBI Varchar(50)  NOT NULL,
    DISUBI Varchar(50)  NOT NULL,
    CONSTRAINT UBIGEO_pk PRIMARY KEY (CODUBI)
)
GO

-- Table: VENDEDOR
CREATE TABLE VENDEDOR (
    CODVEND char(6)  NOT NULL,
    DNIVEND varchar(10)  NOT NULL,
    NOMVEND varchar(50)  NOT NULL,
    APEVEND varchar(50)  NOT NULL,
    CELVEND char(9)  NOT NULL,
	EMAVEND varchar(80)NOT NULL,
    ESTVEND char(1)NOT NULL,
    CONSTRAINT VENDEDOR_pk PRIMARY KEY (CODVEND)
)
GO

-- Table: VENTA
CREATE TABLE VENTA (
    IDVENT INT IDENTITY(1,1),
    FECVENT date  NOT NULL,
    CODVEND char(6)  NOT NULL,
    CODCLI char(6)  NOT NULL,
    IDVENTDET int,
    CONSTRAINT VENTA_pk PRIMARY KEY (IDVENT)
)
GO

-- Table: VENTA_DETALLE
CREATE TABLE VENTA_DETALLE (
    IDVENTDET INT IDENTITY(1,1),
    TIPVENTDET char(1)  NOT NULL,
    CODCON char(6)  NOT NULL,
    CODPRO char(6)  NOT NULL,
    CONSTRAINT VENTA_DETALLE_pk PRIMARY KEY (IDVENTDET)
)
GO


-- Reference: CLIENTE_UBIGEO (table: CLIENTE)
ALTER TABLE CLIENTE 
	ADD CONSTRAINT CLIENTE_UBIGEO
    FOREIGN KEY (CODUBI)
    REFERENCES UBIGEO (CODUBI)  


-- Reference: VENTA_CLIENTE (table: VENTA)
ALTER TABLE VENTA 
	ADD CONSTRAINT VENTA_CLIENTE
    FOREIGN KEY (CODCLI)
    REFERENCES CLIENTE (CODCLI)  


-- Reference: VENTA_DETALLE_CONSULTA (table: VENTA_DETALLE)
ALTER TABLE VENTA_DETALLE	
	ADD CONSTRAINT VENTA_DETALLE_CONSULTA
    FOREIGN KEY (CODCON)
    REFERENCES CONSULTA (CODCON)  

-- Reference: VENTA_DETALLE_PRODUCTO (table: VENTA_DETALLE)
ALTER TABLE VENTA_DETALLE 
	ADD CONSTRAINT VENTA_DETALLE_PRODUCTO
    FOREIGN KEY (CODPRO)
    REFERENCES PRODUCTO (CODPRO)  
    

-- Reference: VENTA_VENDEDOR (table: VENTA)
ALTER TABLE VENTA 
	ADD CONSTRAINT VENTA_VENDEDOR
    FOREIGN KEY (CODVEND)
    REFERENCES VENDEDOR (CODVEND)  
   

-- Reference: VENTA_VENTA_DETALLE (table: VENTA)
ALTER TABLE VENTA 
	ADD CONSTRAINT VENTA_VENTA_DETALLE
    FOREIGN KEY (IDVENTDET)
    REFERENCES VENTA_DETALLE (IDVENTDET)  


INSERT INTO UBIGEO 
	(CODUBI,DEPUBI,PROUBI,DISUBI)
VALUES
	('140401', 'Lima', 'Cañete', 'San Vicente de Cañete'),
	('140402', 'Lima', 'Cañete', 'Calango'),
	('140403', 'Lima', 'Cañete', 'Cerro Azul'),
	('140404', 'Lima', 'Cañete', 'Coayllo'),
	('140405', 'Lima', 'Cañete', 'Chilca'),
	('140406', 'Lima', 'Cañete', 'Imperial'),
	('140407', 'Lima', 'Cañete', 'Lunahuaná'),
	('140408', 'Lima', 'Cañete', 'Mala'),
	('140409', 'Lima', 'Cañete', 'Nuevo Imperial'),
	('140410', 'Lima', 'Cañete', 'Pacarán'),
	('140411', 'Lima', 'Cañete', 'Quilmaná'),
	('140412', 'Lima', 'Cañete', 'San Antonio'),
	('140413', 'Lima', 'Cañete', 'San Luis'),
	('140414', 'Lima', 'Cañete', 'Santa Cruz de Flores'),
	('140415', 'Lima', 'Cañete', 'Zúñiga'),
	('140416', 'Lima', 'Cañete', 'Asia')
GO



INSERT INTO CLIENTE
(CODCLI,DNICLI, NOMCLI, APECLI, CELCLI, EMACLI, CODUBI)
VALUES
('C00001','91256723','Alicia','García Campos','929185236','agarcia@gmail.com','140409'),
('C00002','32453243','Juana','Ávila Chumpitaz','923568741','javila@gmail.com','140402'),
('C00003','45656734','Oscar','Coronado Vásquez','932615478','ocoronado@gmail.com','140403'),
('C00004','32452453','Luis','Barrios Palomino','932817645','lbarrios@outlook.com','140409'),
('C00005','23467324','María','Tarazona Mendoza','978400123','mtarazona@outlook.com','140407'),
('C00006','23452345','Pedro','Sánchez Dávila','941533268','psanchez@yahoo.com','140402'),
('C00007','23523455','Aldo','Torres Zavala','958866221','atorres@yahoo.com','140405'),
('C00008','24534223','Fiorella','Monteza Alzamora','992255441','fmonteza@gmail.com','140408'),
('C00009','54645678','Gloria','Linares Rodríguez','954415950','glinares@hotmail.com','140403'),
('C00010','78956705','Esperanza','Stark Parker','901133258','estark@yahoo.com','140405')
GO




INSERT INTO VENDEDOR
(CODVEND,DNIVEND,NOMVEND,APEVEND,CELVEND,EMAVEND,ESTVEND)
VALUES
('COD001','967324589','Alberto','Solano Pariona','99845632','solano@gmail.com','1'),
('COD002','546756722','Ana','Enriquez Flores','978848551','enrique@outbook.com','1'),
('COD003','123344562','Carolina','Rojas Urrutia','916431258','rojas@gmail.com','2'),
('COD004','234563446','Fabian','Mediana Lopez','945672343','fabian@gmail.com','1'),
('COD005','897896234','Marcos','Quispe Casas','923453258','marcos@gmail.com','1'),
('COD006','234566434','Carmen','Sanchez Candela','934567900','carmen@gmail.com','2'),
('COD007','234145677','Juan','Lopez Aguierre','916431258','juan@gmail.com','1'),
('COD008','678653456','Felipe','Portugues Salavala','916431258','felipe@gmail.com','1'),
('COD009','978060678','Maria','Guando Lopez','916431258','maria@gmail.com','1'),
('COD010','456728904','Chintia','Maria Sal','916431258','chintia@gmail.com','1')
GO



INSERT INTO PRODUCTO
(CODPRO, NOMPRO, TIPPRO, DESPRO, CANPRO,PREPRO,STOPRO)
VALUES
('P00001','','1','','01','10.5','100'),
('P00002','','1','','23','4.00','22'),
('P00003','','1','','34','1.00','50'),
('P00004','','1','','10','5.00','80'),
('P00005','','1','','05','20.00','104'),
('P00006','','1','','10','12.00','70'),
('P00007','','1','','40','40.00','105'),
('P00008','','1','','03','3.00','25'),
('P00009','','1','','54','50.00','20'),
('P00010','','1','','10','20.00','50')
GO



INSERT INTO VENTA
(IDVENTDET,FECVENT,CODVEND,CODCLI)
VALUES
('2022/12/21','COD001','C00001'),
('2022/01/13','COD002','C00002'),
('2022/05/12','COD003','C00003'),
('2022/08/03','COD004','C00004'),
('2022/05/12','COD005','C00005'),
('2022/01/24','COD006','C00006'),
('2022/09/27','COD007','C00007'),
('2022/03/24','COD008','C00008'),
('2022/06/19','COD009','C00009'),
('2022/07/01','COD010','C00010')
GO


INSERT INTO VENTA_DETALLE
(TIPVENTDET,CODCON,CODPRO)
VALUES
('1','ID0001','P00001','COD001'),
('1','ID0002','P00002','COD002'),
('2','ID0003','P00003','COD003'),
('1','ID0004','P00004','COD004'),
('2','ID0005','P00005','COD005'),
('2','ID0006','P00006','COD006'),
('1','ID0007','P00007','COD007'),
('2','ID0008','P00008','COD008'),
('1','ID0009','P00009','COD009'),
('2','ID0010','P00010','COD010')
GO


INSERT INTO CONSULTA
(CODCON,NOMCON,RAZCON,TIPCON,COSCON)
VALUES
('CO0001','1','PERRO','1','10.5'),
('CO0002','1','GATO','2','4.00'),
('CO0003','1','CUY','3','1.00'),
('CO0004','1','PATO','1','5.00'),
('CO0005','1','GATO','5','20.00'),
('CO0006','1','PERRO','1','12.00'),
('CO0007','1','GATO','4','40.00'),
('CO0008','1','RATA','3','3.00'),
('CO0009','1','CUY','5','50.00'),
('CO0010','1','PATO','9','20.00')
GO


SELECT * FROM VENDEDOR
SELECT * FROM CLIENTE
SELECT * FROM CONSULTA
SELECT * FROM UBIGEO
SELECT * FROM VENTA_DETALLE
SELECT * FROM PRODUCTO
SELECT * FROM VENTA
GO


