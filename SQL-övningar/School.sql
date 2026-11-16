CREATE DATABASE School;
GO
USE School;
GO

CREATE TABLE Student
(SID int NOT NULL PRIMARY KEY,
FName varchar(20) NOT NULL,
LName varchar(20) NOT NULL,
Comment text);

INSERT INTO Student (SID, FName, LName)
VALUES (1, 'Anna', 'Bengtsson');
INSERT INTO Student (SID, FName, LName)
VALUES (2, 'Cecilia', 'Danielsson');
INSERT INTO Student (SID, FName, LName)
VALUES (3, 'Erika', 'Fredriksson');
INSERT INTO Student (SID, FName, LName)
VALUES (4, 'Gudrun', 'Henriksson');

SELECT * FROM Student;
