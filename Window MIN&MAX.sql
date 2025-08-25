/* ============================================================
   SQL WINDOW AGGREGATION | MAX / MIN
   ============================================================ */

/* TASK:
   Find the Highest and Lowest Cost across all products
   Find the Lowest Cost across all products and by Purchase type
*/

SELECT
	OrderID,
	Date,
	Product,
	PurchaseType,
	MAX(Cost) OVER() AS [Highest Sales],
	MIN(Cost) OVER() AS [Lowest Sales],
	MIN(Cost) OVER(PARTITION BY PurchaseType) AS [Lowest Cost by Purchase type],
	MAX(Cost) OVER(PARTITION BY PurchaseType) AS [Highest Cost by Purchase type]
FROM Sales;

/* TASK:
   Show the managers who have the highest sales by product
*/

SELECT
*
FROM(
	SELECT
		Manager,
		Cost,
		Product,
		MAX(Cost) OVER() [Highest sales by manager]
	FROM Sales
	)t WHERE Cost = [Highest sales by manager];

/* TASK:
   Show the managers who have the lowest sales by product
*/

SELECT
*
FROM(
	SELECT
		Manager,
		Cost,
		Product,
		MIN(Cost) OVER() [Lowest sales by manager]
	FROM Sales
	)t WHERE Cost = [Lowest sales by manager];


/* TASK:
   Find the deviation of each Sale from the minimum and maximum Sales
*/

SELECT
	OrderID,
	Product,
	Cost,
	MAX(Cost) OVER() AS [Highest Sales],
	MIN(Cost) OVER() AS [Lowest Sales],
	Cost - MIN(Cost) OVER() AS [Deviation form minimum]
FROM Sales;


SELECT
*
FROM Sales