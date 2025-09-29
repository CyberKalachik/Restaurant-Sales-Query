-- Find the last order date per product

WITH CTE_Total_Cost AS
(
SELECT
	Product,
	SUM(Cost) AS TotalCost
FROM Sales
GROUP BY Product
)
, CTE_Last_Order AS
(
SELECT
	Product,
	MAX(Date) AS Last_Order
FROM Sales
GROUP BY Product
)
-- Main Query

SELECT
p.Product,
cts.TotalCost,
clo.Last_Order
FROM PurchaseType_PaymentMethod p
LEFT JOIN CTE_Total_Cost cts
ON cts.Product = p.Product
LEFT JOIN CTE_Last_Order clo
ON clo.Product = p.Product