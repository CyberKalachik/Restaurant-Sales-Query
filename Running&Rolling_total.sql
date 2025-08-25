-- RUNNING TOTAL (Rows between unbounded preceding and current row)

SELECT
	Cost,
	OrderID,
	SUM(Cost) OVER(ORDER BY OrderID) AS [Running total]
FROM Sales;

-- ROLLING TOTAL (Rows between 2 preceding and current row)

SELECT
	Cost,
	OrderID,
	SUM(Cost) OVER(ORDER BY OrderID ROWS BETWEEN 2 PRECEDING AND CURRENT ROW) AS [Rollinging total]
FROM Sales;

SELECT
TOP 10*
fROM Sales