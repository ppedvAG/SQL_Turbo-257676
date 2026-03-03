--Wildcards: Ungefähre Filterung im WHERE

--%: Beliebig viele Zeichen
SELECT * FROM Customers WHERE Country LIKE 'A%';

SELECT * FROM Customers WHERE Country LIKE 'a%'; --Case Insensitive

SELECT * FROM Customers WHERE CompanyName LIKE '%Store%';

SELECT * FROM Customers WHERE Country LIKE '%A%A%'; --Finde alle Länder mit 2x A

--_: Genau ein beliebiges Zeichen
SELECT * FROM Customers WHERE City LIKE '_ünchen';

SELECT * FROM Employees WHERE EmployeeID LIKE '_'; --Finde alle einstelligen Mitarbeiternummern

SELECT * FROM Customers WHERE PostalCode LIKE '____'; --Finde alle vierstelligen Postleitzahlen

SELECT * FROM Customers WHERE PostalCode LIKE '1___'; --Finde alle vierstelligen Postleitzahlen, die mit einer 1 beginnen

--[]: Suche genau einen der gegeben Zeichen
SELECT * FROM Customers WHERE Country LIKE '[abc]%'; --Finde alle Länder die mit A, B oder C anfangen

SELECT * FROM Customers WHERE Country LIKE '[a-e]%'; --Bereich abfragen 

SELECT * FROM Customers WHERE PostalCode LIKE '[0-9][0-9][0-9][0-9]'; --Pincode abfragen

SELECT * FROM Customers WHERE Country LIKE '[^a-e]%'; --Alle Länder die NICHT mit A-E anfangen

SELECT * FROM Customers WHERE Country LIKE '[a-e|v-z]%'; --Bereiche kombinieren

--Sonderfälle
SELECT * FROM Customers WHERE CompanyName LIKE '%[%]%';

SELECT * FROM Customers WHERE CompanyName LIKE '%['']%'; --Muss über ein Doppelhochkomma umgewandelt werden