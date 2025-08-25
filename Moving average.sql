-- MOVING AVERAGE

SELECT
	OrderID,
	Product,
	Cost,
	Day,
	Date,
	AVG(Cost) OVER(PARTITION BY Product) AS [Average by products],
	AVG(Cost) OVER(PARTITION BY Product ORDER BY Date) AS [Moving average],
	AVG(Cost) OVER(PARTITION BY Product ORDER BY Date ROWS BETWEEN CURRENT ROW AND 1 FOLLOWING) AS [Rolling average]
FROM Sales;

-- CALCULATE the moving average of cost for each product over time, including only the next order



SELECT
TOP 10*
fROM Sales