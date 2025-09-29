-- Find the total cost per Product

WITH CTE_Total_Cost AS
(
SELECT
	Product,
	SUM(Cost) AS TotalCost
FROM Sales
GROUP BY Product
)

-- Main Query

SELECT
p.Product,
cts.TotalCost
FROM PurchaseType_PaymentMethod p
LEFT JOIN CTE_Total_Cost cts
ON cts.Product = p.Product


SELECT
TOP 10*
FROM Sales;