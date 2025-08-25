-- CHECK WHETHER THE TABLE 'SALES' CONTAINS ANY DUPLICATE ROWS

SELECT
	OrderID,
	COUNT(*) OVER(PARTITION BY OrderID) [Check Primary Key]
FROM Sales;

SELECT
*
FROM(
	SELECT
		OrderID,
		COUNT(*) OVER(PARTITION BY OrderID) [Check Primary Key]
	FROM Sales
)t WHERE [Check Primary Key] > 1;

SELECT
TOP 5*
FROM Sales