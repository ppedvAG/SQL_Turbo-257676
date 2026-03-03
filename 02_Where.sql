USE Northwind

--WHERE: Ausgaben filtern

--Vergleichsoperatoren
-- =, !=, <>
-- <, >
-- <=, >=

--Logische Operatoren
-- AND, OR, NOT
-- IN, BETWEEN, LIKE

SELECT * FROM Orders WHERE Freight > 50; --Filterung nach Frachtkosten

SELECT * FROM Orders WHERE Freight <= 50; --Gegenteil von darüber

SELECT * FROM Employees WHERE EmployeeID = 1;

SELECT * FROM Orders WHERE Freight > 50 AND EmployeeID = 1; --Beide Bedingungen müssen erfüllt sein

SELECT * FROM Orders WHERE Freight > 50 OR EmployeeID = 1; --Eine von beiden (oder beide) Bedingungen müssen erfüllt sein

--BETWEEN: Filterung zw. X und Y

SELECT * FROM Orders WHERE Freight BETWEEN 10 AND 20;

SELECT * FROM Orders WHERE OrderDate BETWEEN '19970101' AND '19970301'; --Grenzen sind hier inkludiert

SELECT * FROM Orders WHERE OrderDate BETWEEN '1997-08-01' AND '1997-31-12'; --Bei Bindestrichen wird das Amerikanische Datum verwendet (oh Gott)

--IN: Filtert Spalten anhand von einer gegebener Liste (Contains)

SELECT * FROM Orders WHERE CustomerID IN ('ALFKI', 'OCEAN', 'QUICK'); --Suche alle Bestellungen von den Kunden: ALFKI, OCEAN, QUICK

SELECT * FROM Customers WHERE Country IN ('Germany', 'Austria', 'Switzerland'); --Alle Kunden im Deutschsprachigen Raum

--Funktionen

SELECT * FROM Orders WHERE OrderDate BETWEEN '19960101' AND '19961231'; --Alle Bestellungen aus dem Jahr 1996 finden

SELECT * FROM Orders WHERE YEAR(OrderDate) = 1996;

SELECT * FROM Orders WHERE MONTH(OrderDate) = 1;

SELECT * FROM Orders WHERE DATEPART(QQ, OrderDate) = 1; --Alle Bestellungen aus Quartal 1

SELECT * FROM Orders WHERE YEAR(OrderDate) IN (1996, 1997);

SELECT * FROM Orders WHERE YEAR(OrderDate) BETWEEN 1996 AND 1998; --Grenzen inkludiert

--NULL
--Leere Werte (Gelb hinterlegt)
--Müssen speziell gefiltert werden

SELECT * FROM Orders WHERE ShippedDate = NULL; --Hier kommen keine Ergebnisse heraus

SELECT * FROM Orders WHERE ShippedDate IS NULL; --Bei NULL-Werten muss der IS Operator verwendet werden

SELECT * FROM Customers WHERE Fax IS NOT NULL;