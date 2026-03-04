USE Northwind;

--ORDER BY: Ergebnisse sortieren nach einer/mehreren Spalte(n)

SELECT * FROM Customers ORDER BY Country;

SELECT * FROM Customers ORDER BY Country, City; --Subsequente Sortierung

SELECT * FROM Customers ORDER BY Country DESC, City ASC; --Aufsteigend/Absteigend

SELECT * FROM Customers ORDER BY 2; --Nach Spaltenindex sortieren

SELECT * FROM Customers ORDER BY 9, 6; --Nach Spaltenindex sortieren

SELECT CustomerID, CompanyName, ContactName, ContactTitle,
	CONCAT_WS(' ', Address, City, PostalCode, Country) AS [Volle Adresse]
FROM Customers
ORDER BY [Volle Adresse]; --Nach Spaltenalias sortieren

--DISTINCT: Duplikate filtern

--Aufgabe: Herausfinden, in welchen Ländern wir Kunden haben
SELECT Country FROM Customers ORDER BY 1; --Duplikate

SELECT DISTINCT Country --Wähle die Länder einzigartig
FROM Customers
ORDER BY 1;

SELECT DISTINCT Country, City --Welche Stadt + Land Kombinationen gibt es?
FROM Customers
ORDER BY 1;

--Aggregatsfunktionen: COUNT, MIN, MAX, SUM, AVG
SELECT COUNT(*) FROM Customers; --Wieviele Kunden gibt es?

SELECT COUNT(*) FROM Customers WHERE Country = 'Austria';

SELECT AVG(Freight) FROM Orders; --Hier muss eine konkrete Spalte ausgewählt werden, weil ein Durchschnitt nicht auf eine ganze Tabelle angewandt werden kann

SELECT COUNT(DISTINCT Country) FROM Customers; --Wieviele verschiedene Länder haben Kunden?

--TOP: Gibt nur die obersten X Datensätze zurück
SELECT TOP 10 * FROM Orders; --Nicht sonderlich aussagekräftig, wird generell mit ORDER BY kombiniert

SELECT TOP 10 * FROM Orders ORDER BY Freight; --Die 10 niedrigsten Frachtkosten

SELECT TOP 10 * FROM Orders ORDER BY Freight DESC; --Die 10 höchsten Frachtkosten

SELECT TOP 1 PERCENT *
FROM Orders
ORDER BY Freight DESC; --Top 1% der Gesamtdatensätze in der Tabelle

SELECT TOP 1 PERCENT * FROM [Order Details] ORDER BY Quantity; --22 Rows, schneidet mittendrin ab

SELECT TOP 1 PERCENT WITH TIES * FROM [Order Details] ORDER BY Quantity; --69 Rows, nimmt alle Rows mit, die den letzten Wert haben