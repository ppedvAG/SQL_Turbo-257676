USE Northwind;

--Tabellen werden verbunden über IDs
--In jeder Tabelle muss es eine ID Spalte geben
--Diese Spalte wird als Primärschlüssel bezeichnet
--In einer anderen Tabelle wird diese Spalte als Fremdschlüssel bezeichnet
--Bei neuen Datensätzen muss der Wert in der Fremdschlüsselspalte bei der anderen Tabelle vorhanden (in der Primärschlüsselspalte)

--INNER JOIN
SELECT * FROM Orders;
SELECT * FROM Customers;

--Aufgabe: Zu jeder Bestellung den Kunden ausgeben
SELECT *
FROM Orders 
	INNER JOIN Customers 
	ON Orders.CustomerID = Customers.CustomerID;

--Statt * nur benötigte Spalten auswählen
SELECT
	Orders.CustomerID,
	Orders.OrderDate,
	Orders.Freight,
	Customers.CompanyName,
	Customers.ContactName,
	CONCAT_WS(' ', Address, City, PostalCode, Country) AS [Volle Adresse]
FROM Orders 
	INNER JOIN Customers 
	ON Orders.CustomerID = Customers.CustomerID;

--Mit Alias
SELECT
	o.CustomerID,
	o.OrderDate,
	o.Freight,
	c.CompanyName,
	c.ContactName,
	CONCAT_WS(' ', Address, City, PostalCode, Country) AS [Volle Adresse]
FROM Orders AS o
	INNER JOIN Customers AS c
	ON o.CustomerID = c.CustomerID;

--Beziehungstypen
--1:1 -> existiert effektiv nicht
--1:n -> Jeder Kunde hat n Bestellungen; jede Bestellung hat genau einen Kunden
--m:n -> Jede Bestellung hat m Produkte; jedes Produkt befindet sich in n Bestellungen (benötigt eine extra Tabelle)

--Um Produkte und Bestellungen zu joinen, wird hier ein dreifach JOIN benötigt
SELECT * FROM [Order Details] AS od
INNER JOIN Orders AS o ON od.OrderID = o.OrderID
INNER JOIN Products AS p ON od.ProductID = p.ProductID; --Hier nur sinnvolle Spalten auswählen

SELECT
	od.OrderID,
	p.ProductName,
	p.QuantityPerUnit,
	od.UnitPrice AS Stückpreis,
	od.Quantity,
	od.UnitPrice * Quantity * (1 - Discount) AS Positionspreis,
	o.OrderDate,
	o.Freight AS Frachtkosten,
	CONCAT_WS(' ', ShipAddress, ShipCity, ShipPostalCode, ShipCountry) AS Lieferadresse
FROM [Order Details] AS od
INNER JOIN Orders AS o ON od.OrderID = o.OrderID
INNER JOIN Products AS p ON od.ProductID = p.ProductID;

--OUTER JOIN
--Wenn in einer der beiden Tabellen kein Match für ein Datensatz gefunden wurde, fällt dieser beim INNER JOIN heraus
--Beim OUTER JOIN wird dieser Datensatz mit NULL-Werten ergänzt
--Hier gibt es LEFT, RIGHT und FULL OUTER JOIN, um verschiedene Schnittmengen abzubilden (siehe Venn Diagramme)
SELECT *
FROM Orders 
	LEFT JOIN Customers 
	ON Orders.CustomerID = Customers.CustomerID; --Ergänze alle Kunden, die keine Bestellungen haben (selbe Ergebnismenge)

SELECT *
FROM Orders 
	RIGHT JOIN Customers 
	ON Orders.CustomerID = Customers.CustomerID; --Am Ende der Tabelle befinden sich alle Kunden, die keine Bestellungen haben

SELECT *
FROM Orders 
	FULL JOIN Customers 
	ON Orders.CustomerID = Customers.CustomerID; --FULL JOIN: Kombination aus LEFT + RIGHT JOIN

SELECT * FROM Orders CROSS JOIN Customers; --Matcht jeden Kunden mit jeder Bestellung (76000 Rows)