USE Northwind; --Datenbank auswählen

/*
	Mehrzeiliger
	Kommentar
*/

--SELECT: Auswahl treffen
SELECT 10;

SELECT 2 * 3; --Berechnungen

SELECT 'Test'; --Text mit einzelnen Hochkomma

SELECT 10.5; --Kommazahlen mit Punkt

--Strg + E: Statement(s) ausführen
--Strg + R: Ergebnisansicht schließen

SELECT 10 AS Zahl; --AS: Spalte umbenennen

SELECT 10 AS Z1, 20 AS Z2, 30 AS Z3; --Mehrere Spalten selektieren

------------------------------------------------------

--FROM: Tabellen angreifen

SELECT * FROM Customers; --*: Alle Spalten

SELECT CustomerID, CompanyName, ContactName FROM Customers; --Nur bestimmte Spalten auswählen

SELECT Freight * 5 FROM Orders; --Mit Spalten im SELECT rechnen

SELECT CustomerID, CompanyName, ContactName, ContactTitle, Address + City + PostalCode + Country AS [Volle Adresse] FROM Customers; --Adressspalten zusammenbauen
SELECT CustomerID, CompanyName, ContactName, ContactTitle, Address + City + PostalCode + Country AS 'Volle Adresse' FROM Customers;
SELECT CustomerID, CompanyName, ContactName, ContactTitle, Address + City + PostalCode + Country AS "Volle Adresse" FROM Customers;

SELECT CustomerID, CompanyName, ContactName, ContactTitle,
	CONCAT_WS(' ', Address, City, PostalCode, Country) AS [Volle Adresse]
FROM Customers; --Zeilenumbrüche