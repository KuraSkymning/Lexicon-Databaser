# Bilägare

1. Lägg in ytterligare två bilar för Bo Karlsson i tabellen.

    | Fnamn | Enamn    | Adress   | Postnr | Stad       | Telefon  | Email        | Märke    | Modell  |
    | ---   | ---      | ---      | ---    | ---        | ---      | ---          | ---      | ---     |
    | Lars  | Persson  | Skolg. 2 | 23456  | Hässleholm | 07212344 | lars@live.se | Ferrari  | F40     |
    | Anna  | Nilsson  | Borgv. 4 | 14577  | Stockholm  | 07012345 | anna@live.se | Bugatti  | Veyron  |
    | Anna  | Nilsson  | Borgv. 4 | 14577  | Stockholm  | 07012345 | anna@live.se | Mercedes | C112    |
    | Lars  | Persson  | Skolg. 2 | 23456  | Hässleholm | 07212344 | lars@live.se | Toyota   | Corolla |
    | Bo    | Karlsson | Furuv. 8 | 12388  | Göteborg   | 01055223 | bo@live.se   | Nissan   | Pulsar  |
    | Lars  | Persson  | Skolg. 2 | 23456  | Hässleholm | 07212344 | lars@live.se | Ford     | Mustang |
    | Bo    | Karlsson | Furuv. 8 | 12388  | Göteborg   | 01055223 | bo@live.se   | Volvo    | Amazon  |
    | Bo    | Karlsson | Furuv. 8 | 12388  | Göteborg   | 01055223 | bo@live.se   | Saab     | 90      |

    ```
    INSERT INTO Bilägare (FNamn, ENamn, Adress, Postnr, Stad, Telefon, Email, Märke, Modell)
    VALUES ('Bo', 'Karlsson', 'Furuv. 8', 12388, 'Göteborg', '01055223', 'bo@live.se', 'Volvo', 'Amazon');
    INSERT INTO Bilägare (FNamn, ENamn, Adress, Postnr, Stad, Telefon, Email, Märke, Modell)
    VALUES ('Bo', 'Karlsson', 'Furuv. 8', 12388, 'Göteborg', '01055223', 'bo@live.se', 'Saab', '90');
    ```

2. Varje gång vi lägger in en ny bil för Bo måste vi skriva hans uppgifter igen.
Ange minst två skäl till varför detta inte är bra.
    * Det tar större plats ifall samma uppgifter måste sparas flera gånger.
    * Det blir mer omständigt att lägga till en ny bil om man måste lägga till alla personuppgifter igen, jämfört om man bara behöver lägga till de nya uppgifterna rörande bilen.
    * Om någon personuppgift, till exempel adress, ändras, måste den uppdateras på alla ställen där den förekommer, istället för bara på ett ställe.

3. För att lösa problemet behöver vi primärnyckel och sekundärnyckel. Beskriv dessa och ange vad skillnaden är.
    * En primärnyckel är en kolumn vars värden unikt identifierar varje rad i tabellen.
    * En sekundärnyckel är en kolumn i en annan tabell där det finns en koppling från den första tabellen till den andra. En sekundärnyckel behöver i allmänhet inte vara unik, eftersom en rad i den första tabellen ibland ska kunna vara kopplad till fler än en rad i den andra tabellen.

4. Är personnummer ett bra val för en primärnyckel? Motivera.
    * Om man har en tabell som bara innehåller personer kan man använda personnummer som primärnyckel, eftersom personnumret är unikt för varje person.
    * Om man i bilägardatabasen delar upp tabellen i två så att den ena tabellen bara innehåller personer går det att använda personnummer som primärnyckel för den tabellen, eftersom varje person då bara förekommer en gång i tabellen och personnumret är unikt.
    * I den ursprungliga tabellen kan samma person förekomma fler än en gång och då kan man inte ha personnummer som primärnyckel, eftersom den måste vara unik för en rad.

5. Ska sekundärnyckeln vara unik? Motivera.
    * Nej, inte i det här fallet. Varje person kan äga flera bilar, och då måste sekundärnyckeln kunna ha samma värde på flera rader.

6. Vad är skillnaden på data och information?
    * Information är data som följer en viss struktur och därmed kan tolkas på ett entydigt vis, medan ren data inte följer någon särskild struktur.

7. Ge exempel på minst två av relationerna en till en, en till många och många till många.
    * En till en: bil till registreringsnummer, person till personnummer
    * En till många: hus till rum, bilägare till bil
    * Många till många: elev till kurs, skådespelare till film

8. Gör om tabellen så att vi endast behöver mata in bilägarens uppgifter en gång.

    | ID  | Fnamn | Enamn 	 | Adress   | Postnr | Stad       | Telefon  | Email        |
    | --- | ---   | ---      | ---      | ---    | ---        | ---      | ---          |
    | 1   | Lars  | Persson  | Skolg. 2 | 23456  | Hässleholm | 07212344 | lars@live.se |
    | 2   | Anna  | Nilsson  | Borgv. 4 | 14577  | Stockholm  | 07012345 | anna@live.se |
    | 3   | Bo    | Karlsson | Furuv. 8 | 12388  | Göteborg   | 01055223 | bo@live.se   |

    | ÄgarID | Märke    | Modell  |
    | ---    | ---      | ---     |
    | 1 	 | Ferrari  | F40     |
    | 2 	 | Bugatti  | Veyron  |
    | 2 	 | Mercedes | C112    |
    | 1 	 | Toyota   | Corolla |
    | 3 	 | Nissan   | Pulsar  |
    | 1 	 | Ford     | Mustang |
    | 3 	 | Volvo    | Amazon  |
    | 3 	 | Saab     | 90      |

    ```
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
    ```
