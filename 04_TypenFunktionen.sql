USE Northwind;

/*
	Typen:
	- Ganze Zahlen: tinyint, smallint, int, bigint
	- Kommazahlen: decimal, float
	- Geldtypen: money, smallmoney
	- bit: Boolean (1 oder 0)

	- Texttypen: varchar, char, text (text: veraltet, sollte nicht verwendet werden; char: absolute Länge; varchar: variable Länge)
	- Bei jedem Texttyp kann auch ein n davorgestellt werden: Unicode -> 2B pro Zeichen statt 1B

	- Datumstypen: datetime, datetimeoffset
	- Heute: datetime2
*/

--------------------------------------------------------

--Funktionen

--Datumsfunktionen
SELECT GETDATE(); --Jetztiges Datum

SELECT SYSDATETIME(); --Jetztiges Datum mit höherer Präzision

--YEAR, MONTH, DAY
SELECT YEAR(GETDATE());
SELECT MONTH(GETDATE());
SELECT DAY(GETDATE());

--Für andere Datumsteile: DATEPART

/*
	Intervalle:
    year, yyyy, yy = Year
    month, MM, M = month
    week, ww, wk = Week (Kalenderwoche)
    day, dd, d = Day
    hour, hh = hour
    minute, mi, m = Minute
    second, ss, s = Second
    millisecond, ms = Millisecond
	nanosecond, ns

    weekday, dw, w = Weekday (1-7)
    dayofyear, dy, y = Day of the year (1-366)
    quarter, qq, q = Quarter (1-4)
*/

SELECT DATEPART(QUARTER, GETDATE());
SELECT DATEPART(QQ, GETDATE());
SELECT DATEPART(Q, GETDATE());

--DATEDIFF
SELECT DATEDIFF(DAY, '20000101', GETDATE()); --Anz. Tage zw. 01.01.2000 und heute

--DATENAME
SELECT DATENAME(WEEKDAY, GETDATE());
SELECT DATENAME(MONTH, GETDATE());

--DATEADD
SELECT DATEADD(DAY, 30, GETDATE()); --Welches Datum haben wir 30 Tage in der Zukunft?
SELECT DATEADD(DAY, -30, GETDATE());

---------------------------------------------------------------

--Stringfunktionen

--CONCAT_WS
SELECT *, CONCAT_WS(' ', Address, City, PostalCode, Country) AS [Volle Adresse] FROM Customers;

--LEN
SELECT LEN('Hallo Welt');
SELECT ContactName, LEN(ContactName) FROM Customers;

SELECT LEN(' Hallo Welt '); --LEN führt auch ein TRIM durch
SELECT DATALENGTH(' Hallo Welt '); --LEN ohne TRIM

--TRIM/RTRIM/LTRIM
SELECT TRIM(' Hallo Welt '); --Abstände Links und Rechts abschneiden
SELECT LTRIM(' Hallo Welt '); --Abstände Links abschneiden
SELECT RTRIM(' Hallo Welt '); --Abstände Rechts abschneiden

--REPLICATE
SELECT REPLICATE('Hallo', 5);

--REPLACE
SELECT REPLACE('Hallo Welt', 'H', 'h');

---------------------------------------------------------------

--Formatfunktionen

--CAST
SELECT CAST(123.45 AS int);

SELECT CAST('123.45' AS float);

SELECT '123.45' * 3; --Nicht möglich ohne CAST

SELECT CAST(OrderDate AS date) FROM Orders; --Zeit abschneiden

--CONVERT
SELECT CONVERT(float, '123.45'); --Ältere Variante zu CAST

--FORMAT
SELECT FORMAT(GETDATE(), 'yyyy-MM-dd');

SELECT FORMAT(GETDATE(), 'D'); --Mittwoch, 4. März 2026
SELECT FORMAT(GETDATE(), 'd'); --04.03.2026

SELECT FORMAT(GETDATE(), 'dddd, dd. MMMM yyyy hh:mm:ss'); --Mittwoch, 04. März 2026 02:04:20

---------------------------------------------------------------

--Rundungsfunktionen
SELECT ROUND(123.456789, 2); --Auf X Stellen runden

SELECT FLOOR(123.456789); --Immer abrunden

SELECT CEILING(123.456789); --Immer aufrunden