-- Rank Products based on total cost per Product
-- Segment Products based on their total cost

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
, CTE_Product_Rank AS
(
SELECT
	Product,
	TotalCost,
	RANK() OVER (ORDER BY TotalCost DESC) AS ProductRank
FROM CTE_Total_Cost
)
, CTE_Product_Segments AS
(
SELECT
Product,
TotalCost,
CASE WHEN TotalCost > 200000 THEN 'High'
	WHEN TotalCost > 100000 THEN 'Medium'
	ELSE 'Low'
END ProductSegments
From CTE_Total_Cost
)

-- Main Query

SELECT
p.Product,
cts.TotalCost,
clo.Last_Order,
cpr.ProductRank,
cps.ProductSegments
FROM PurchaseType_PaymentMethod p
LEFT JOIN CTE_Total_Cost cts
ON cts.Product = p.Product
LEFT JOIN CTE_Last_Order clo
ON clo.Product = p.Product
LEFT JOIN CTE_Product_Rank cpr
ON cpr.Product = p.Product
LEFT JOIN CTE_Product_Segments cps
ON cps.Product = p.Product