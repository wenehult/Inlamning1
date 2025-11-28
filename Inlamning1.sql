-- skapar databasen
CREATE DATABASE Bokhandel;

-- Öppnar databasen för att kunna föra in information
USE Bokhandel;

-- Skapar en tabelen Kunder och för in vilken information som finns i den.
CREATE TABLE Kunder ( 
KundID INT AUTO_INCREMENT PRIMARY KEY,
Namn VARCHAR(100) NOT NULL,
Epost VARCHAR(255) UNIQUE NOT NULL,
Telefon VARCHAR(30) NOT NULL,
Adress VARCHAR (100) NOT NULL
);

-- Skapar en tabelen Bestallningar och för in vilken information som finns i den.
CREATE TABLE Bestallningar (
OrderID INT AUTO_INCREMENT PRIMARY KEY,
KundID INT NOT NULL,
Datum DATE NOT NULL,
Totalbelopp DECIMAL(10,2) NOT NULL,
FOREIGN KEY (KundID) REFERENCES Kunder(KundID)
); 


-- Skapar en tabelen Böcker och för in vilken information som finns i den.
CREATE TABLE Bocker (
ISBN BIGINT NOT NULL PRIMARY KEY,
Titel VARCHAR(100) NOT NULL,
Forfattare VARCHAR(100) NOT NULL,
Pris DECIMAL(10,2) NOT NULL,
Lagerstatus INT NOT NULL
);

-- Skapar en tabelen Orderrader och för in vilken information som finns i den.
CREATE TABLE Orderrader (
OrderradID INT AUTO_INCREMENT PRIMARY KEY, 
OrderID INT NOT NULL,
ISBN BIGINT NOT NULL,
Antal INT NOT NULL,
FOREIGN KEY (OrderID) REFERENCES Bestallningar(OrderID),
FOREIGN KEY (ISBN) REFERENCES Bocker(ISBN)
);

-- För in information i Kunder
INSERT INTO Kunder(Namn, Epost, Telefon, Adress) VALUES
('Adam stensson', 'adam@epost.se', '07000000', 'storavägen 23'),
('Stefan Berg', 'stefan@epost.se', '070000001', 'storavägen 24');

-- För in information i Bocker
INSERT INTO Bocker(ISBN, Titel, Forfattare, Pris, Lagerstatus) VALUES
('9789150983234', 'Kafe Pumpkin Spice', 'Laurie Gilmore', '79.00', '2');

SELECT * FROM Kunder; 
