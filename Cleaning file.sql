-- Find managers whose names contains leading or trailing spaces

SELECT
	Manager,
	LEN(Manager) [Length of the name]
FROM Sales
WHERE Manager != TRIM(Manager);

-- Find Purchase Type contains leading or trailing spaces

SELECT
	PurchaseType,
	LEN(PurchaseType) [Length of the name]
FROM Sales
WHERE PurchaseType != TRIM(PurchaseType);

--UPDATE THE TABLE SALES AFTER TRIM

UPDATE Sales
SET Manager = TRIM(Manager)
UPDATE Sales
SET PurchaseType = TRIM(PurchaseType)
UPDATE Sales
SET PaymentMethod = TRIM(PaymentMethod)
UPDATE Sales
SET Product = TRIM(Product);

--REPLACE SPACES IN MANAGERS' NAMES AND PRODUCT

UPDATE Sales
SET Manager = REPLACE(Manager, '  ', ' ')
UPDATE Sales
SET Product = REPLACE(Product, ' ', '');

-- Find PaymentMethod contains leading or trailing spaces

SELECT
	PaymentMethod,
	LEN(PaymentMethod) [Length of the name]
FROM Sales
WHERE PaymentMethod != TRIM(PaymentMethod);

-- Find City contains leading or trailing spaces

SELECT
	City,
	LEN(City) [Length of the name]
FROM Sales
WHERE City != TRIM(City);

SELECT
*
FROM Sales;
