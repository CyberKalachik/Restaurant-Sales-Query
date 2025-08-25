/* TASK:
   Rank Orders Based on Sales from Highest to Lowest
   Provide additional details such as OrderID, Product, Purchaase type, Cost
*/

SELECT
	OrderID,
	Product,
	PurchaseType,
	Cost,
	ROW_NUMBER() OVER(ORDER BY Cost DESC) [Cost Ranking]
FROM Sales;


/* TASK:
   FIND the top cost for each product
*/

SELECT
*
FROM(
	SELECT
		OrderID,
		Product,
		Cost,
		ROW_NUMBER() OVER(PARTITION BY Product ORDER BY Cost DESC) [Cost Ranking by Product]
	FROM Sales
)t WHERE [Cost Ranking by Product] = 1;

/* TASK:
   FIND the top quantity for each product
*/

SELECT
*
FROM(
	SELECT
		OrderID,
		Product,
		Quantity,
		ROW_NUMBER() OVER(PARTITION BY Product ORDER BY Quantity DESC) [Quantity Ranking by Product]
	FROM Sales
)t WHERE [Quantity Ranking by Product] = 1;


/* TASK:
   FIND the lowest 2 managers based on their total cost
*/

SELECT
*
FROM(
	SELECT
		Manager,
		SUM(Cost) [Total Cost],
		ROW_NUMBER() OVER(ORDER BY SUM(Cost)) [Rank managers]
	FROM Sales
	GROUP BY Manager
)t WHERE [Rank managers] <= 2;

SELECT
TOP 10*
FROM Sales