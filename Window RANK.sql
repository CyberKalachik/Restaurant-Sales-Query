/* TASK:
   Rank Orders Based on Sales from Highest to Lowest
   Provide additional details such as OrderID, Product, Purchaase type, Cost
   RANK() - handles ties and leaves gaps in ranking
*/

SELECT
	OrderID,
	Product,
	PurchaseType,
	Cost,
	RANK() OVER(ORDER BY Cost DESC) [Cost Ranking_Rank]
FROM Sales;


SELECT
TOP 10*
FROM Sales