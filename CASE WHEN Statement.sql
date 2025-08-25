-- GENERATE A REPORT SHOWING THE TOTAL QUANTITY FOR EACH CATEGORY:

-- HIGH: If the quantity is higher than 500
-- MEDIUM: If the quantity is between 300 and 500
-- LOW: If the quantity is equal or lower than 300

--SORT THE RESULT FROM LOWEST TO HIGHEST

SELECT
	Product,
	Quantity,
	CASE
		WHEN Quantity > 500 THEN 'High'
		WHEN Quantity > 300 THEN 'Medium'
		ELSE 'Low'
	END Category
	FROM Sales;


SELECT
Category,
SUM(Quantity) AS [Total Quantity]
FROM(
	SELECT
		Product,
		Quantity,
		CASE
			WHEN Quantity > 500 THEN 'High'
			WHEN Quantity > 300 THEN 'Medium'
			ELSE 'Low'
		END Category
		FROM Sales
)t
GROUP BY Category
ORDER BY [Total Quantity] DESC;


 SELECT
*
FROM Sales