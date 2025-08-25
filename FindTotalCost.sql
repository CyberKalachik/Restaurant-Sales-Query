-- FIND TOTAL COST FOR EACH PRODUCT
SELECT
	Product,
	Price,
	Quantity,
	Price * Quantity AS Cost,
FROM Sales;

-- ADD A NEW COLUMN 'COST' TO TABLE 'SALES'

ALTER TABLE Sales
ADD Cost INT;

UPDATE Sales
SET Cost = Price * Quantity;


SELECT
TOP 5*
FROM Sales