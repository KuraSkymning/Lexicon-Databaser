CREATE DATABASE Customers;
GO
USE Customers;
GO

CREATE TABLE Customer
(ID int NOT NULL PRIMARY KEY,
FirstName varchar(20) NOT NULL,
LastName varchar(20) NOT NULL,
City text);

INSERT INTO Customer (ID, FirstName, LastName, City)
VALUES (1, 'Anna', 'Bengtsson', 'Alingsås');
INSERT INTO Customer (ID, FirstName, LastName, City)
VALUES (2, 'Mark', 'Nilsson', 'Boden');
INSERT INTO Customer (ID, FirstName, LastName, City)
VALUES (3, 'Cecilia', 'Danielsson', 'Charlottenberg');
INSERT INTO Customer (ID, FirstName, LastName, City)
VALUES (4, 'Astrid', 'Persson', 'Delsbo');
INSERT INTO Customer (ID, FirstName, LastName, City)
VALUES (5, 'Erika', 'Paulson', 'Eskilstuna');
INSERT INTO Customer (ID, FirstName, LastName, City)
VALUES (6, 'Mark', 'Nordström', 'Falun');
INSERT INTO Customer (ID, FirstName, LastName, City)
VALUES (7, 'Gudrun', 'Henriksson', 'Göteborg');
INSERT INTO Customer (ID, FirstName, LastName, City)
VALUES (8, 'Astrid', 'Bondeson', 'Helsingborg');
GO

CREATE PROC getMarkAndAstrid AS 
SELECT FirstName, LastName, City FROM Customer
WHERE FirstName = 'Mark' OR FirstName = 'Astrid';
GO

EXEC getMarkAndAstrid;
GO

CREATE PROC getCustomersWithLastName
@lastname varchar(20) = 'Bondeson'
AS
SELECT FirstName, LastName, City FROM Customer
WHERE LastName = @lastname
ORDER BY LastName, FirstName;
GO

EXEC getCustomersWithLastName;

EXEC getCustomersWithLastName 'Henriksson';
GO

CREATE PROC getCustomersWithLastNamesP
AS
SELECT FirstName, LastName, City FROM Customer
WHERE LastName LIKE 'P%'
ORDER BY LastName, FirstName;
GO

EXEC getCustomersWithLastNamesP;
