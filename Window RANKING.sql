/* ============================================================
   SQL WINDOW RANKING 
   ============================================================ */

/*	CUME_DIST()
	TASK:
   CALCULATE the Distribution of data points within a window
*/

SELECT
	OrderID,
	Product,
	ROUND(CUME_DIST() OVER(ORDER BY Product DESC), 4) [CumDist]
FROM Sales;

/*	PERCENT_RANK()
	TASK:
   CALCULATE the relative position of each row
*/

SELECT
	OrderID,
	Product,
	ROUND(PERCENT_RANK() OVER(ORDER BY OrderID DESC), 4) [CumDist]
FROM Sales;

/*	PERCENT_RANK()
	TASK:
   FIND the products that fall within the highest 40% of prices
*/

SELECT
*,
CONCAT([DistRank]*100, '%') AS [Percentage Rank]
FROM(
	SELECT
		Product,
		Price,
		CUME_DIST() OVER (ORDER BY Price DESC) [DistRank]
	FROM Sales
)t WHERE [DistRank] <= 0.4;

/*	NTILE()
	TASK:
   Divide Orders into Buckets
*/

SELECT
	OrderID,
	Product,
	Cost,
	NTILE(4) OVER (ORDER BY Cost DESC) [Four Buckets],
	NTILE(3) OVER (ORDER BY Cost DESC) [Three Buckets],
	NTILE(2) OVER (ORDER BY Cost DESC) [Two Buckets],
	NTILE(1) OVER (ORDER BY Cost DESC) [One Bucket]
FROM Sales;

/*	NTILE()
	DATA SEGMENTATION. Devides a dataset into distinct subsets based on certain criteria
	TASK:
   Segment all Orders into 3 Categories: High, Medium, and Low Sales.  
*/

SELECT
*,
CASE  WHEN Buckets = 1 THEN 'High'
      WHEN Buckets = 2 THEN 'Medium'
      WHEN Buckets = 3 THEN 'Low'
END AS SalesSegmentations
FROM(
	SELECT
		OrderID,
		Cost,
		Product,
		NTILE(3) OVER (ORDER BY Cost DESC) AS [Buckets]
	FROM Sales
)t;


SELECT
TOP 10*
FROM Sales