﻿CREATE TABLE PACIENT(
ID_PACIENT INT  IDENTITY(1, 1) CONSTRAINT PK_PACIENT PRIMARY KEY,
POLICIES INT,    
BENEFITS NVARCHAR(100), 
FULLNAME NVARCHAR(100)
);