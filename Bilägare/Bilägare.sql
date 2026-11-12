CREATE DATABASE Bilägare;
GO
USE Bilägare;
GO

CREATE TABLE Ägare
(ID int PRIMARY KEY,
FNamn varchar(20),
ENamn varchar(20),
Adress varchar(30),
Postnr int,
Stad varchar(20),
Telefon varchar(12),
Email varchar(30));

CREATE TABLE Bil
(ÄgarID int,
Märke varchar(15),
Modell varchar(15),
CONSTRAINT FK_Bil_Ägare FOREIGN KEY (ÄgarID) REFERENCES Ägare(ID));

INSERT INTO Ägare (ID, FNamn, ENamn, Adress, Postnr, Stad, Telefon, Email)
VALUES (1, 'Lars', 'Persson', 'Skolg. 2', 23456, 'Hässleholm', '07212344', 'lars@live.se');
INSERT INTO Ägare (ID, FNamn, ENamn, Adress, Postnr, Stad, Telefon, Email)
VALUES (2, 'Anna', 'Nilsson', 'Borgv. 4', 14577, 'Stockholm', '07012345', 'anna@live.se');
INSERT INTO Ägare (ID, FNamn, ENamn, Adress, Postnr, Stad, Telefon, Email)
VALUES (3, 'Bo', 'Karlsson', 'Furuv. 8', 12388, 'Göteborg', '01055223', 'bo@live.se');

INSERT INTO Bil (ÄgarID, Märke, Modell)
VALUES (1, 'Ferrari', 'F40');
INSERT INTO Bil (ÄgarID, Märke, Modell)
VALUES (2, 'Bugatti', 'Veyron');
INSERT INTO Bil (ÄgarID, Märke, Modell)
VALUES (2, 'Mercedes', 'C112');
INSERT INTO Bil (ÄgarID, Märke, Modell)
VALUES (1, 'Toyota', 'Corolla');
INSERT INTO Bil (ÄgarID, Märke, Modell)
VALUES (3, 'Nissan', 'Pulsar');
INSERT INTO Bil (ÄgarID, Märke, Modell)
VALUES (1, 'Ford', 'Mustang');
INSERT INTO Bil (ÄgarID, Märke, Modell)
VALUES (3, 'Volvo', 'Amazon');
INSERT INTO Bil (ÄgarID, Märke, Modell)
VALUES (3, 'Saab', '90');

SELECT * FROM Ägare JOIN Bil ON ID=ÄgarID;
SELECT * FROM Ägare;
SELECT * FROM Bil;
