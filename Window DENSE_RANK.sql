/* TASK:
   Rank Orders Based on Sales from Highest to Lowest
   Provide additional details such as OrderID, Product, Purchaase type, Cost
   DENSE_RANK() - assign a rank to each row and HANDLES ties and does not leave gaps in ranking
*/

SELECT
	OrderID,
	Product,
	PurchaseType,
	Cost,
	DENSE_RANK() OVER(ORDER BY Cost DESC) [Cost Ranking_Dense]
FROM Sales;


SELECT
TOP 10*
FROM Sales