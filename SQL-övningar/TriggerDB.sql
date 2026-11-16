CREATE DATABASE TriggerDB;
GO
USE TriggerDB;
GO

CREATE TABLE testTrigger(
FirstName varchar (50),
LastName varchar (50));
GO

CREATE TRIGGER info
ON testTrigger
FOR INSERT
AS
Print 'En ny post har lagts in'
SELECT 'Ny post: ', * FROM inserted
SELECT * FROM testTrigger;
GO

INSERT INTO testTrigger
VALUES ('Kajsa', 'Warg');
INSERT INTO testTrigger
VALUES ('Lars', 'Nilsson');
GO

CREATE TRIGGER modify
ON testTrigger
FOR UPDATE
AS
Print 'En post har uppdaterats'
SELECT 'Deleted: Den gamla datan var: ', * FROM deleted
SELECT 'Inserted: Den nya datan är: ', * FROM inserted
SELECT * FROM testTrigger;
GO

UPDATE testTrigger
SET LastName = 'Persson'
WHERE FirstName = 'Lars';
GO

CREATE TRIGGER stopInsert
ON testTrigger
INSTEAD OF INSERT
AS
Print 'Du får inte lägga in nya poster'
SELECT * FROM testTrigger;
GO

INSERT INTO testTrigger
VALUES('Kaisa', 'Varg');
