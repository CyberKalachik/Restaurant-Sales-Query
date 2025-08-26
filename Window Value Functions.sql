/* ==============================================================================
   SQL Window Value Functions
-------------------------------------------------------------------------------
   These functions let you reference and compare values from other rows 
   in a result set without complex joins or subqueries, enabling advanced 
   analysis on ordered data.

   Table of Contents:
     1. LEAD
     2. LAG
     3. FIRST_VALUE
     4. LAST_VALUE
=================================================================================
*/

/* ============================================================
   SQL WINDOW VALUE | LEAD, LAG
   ============================================================ */

/* TASK 1:
   Analyze the Month-over-Month Performance by Finding the Percentage Change in Sales
   Between the Current and Previous Months
*/
SELECT
*,
[Current sales] - [Previous Sales] AS [Monthly Change],
ROUND(CAST(([Current sales] - [Previous Sales]) AS FLOAT) / [Previous Sales] * 100, 1) AS [Percent change]
FROM(
	SELECT
		MONTH(Date) [Order Month],
		SUM(Cost) [Current sales],
		LAG(SUM(Cost)) OVER (ORDER BY MONTH(Date)) AS [Previous Sales]
	FROM Sales
	GROUP BY MONTH(Date)
)t;


/* TASK 2:
   Rank Managers Based on the Average Days Between Their Orders
*/

SELECT
Manager,
AVG([Days untill Next Order]) [Average days],
RANK() OVER(ORDER BY COALESCE(AVG([Days untill Next Order]), 9999)) Ranking
FROM(
    SELECT
    OrderID,
    Manager,
    Date AS [Current Order],
    LEAD(Date) OVER (PARTITION BY Manager ORDER BY Date) AS [Next Order Date],
    DATEDIFF(day, Date, LEAD(Date) OVER (PARTITION BY Manager ORDER BY Date)) AS [Days untill Next Order]
    FROM Sales
)t
GROUP BY Manager

/* ============================================================
   SQL WINDOW VALUE | FIRST & LAST VALUE
   ============================================================ */

/* TASK 3:
   Find the Lowest and Highest Sales for Each Product,
   and determine the difference between the current Sales and the lowest Sales for each Product.
*/

SELECT
    OrderID,
    Product,
    Cost,
    FIRST_VALUE(Cost) OVER (PARTITION BY Product ORDER BY Cost) [Lowest Sales],
    LAST_VALUE(Cost) OVER (PARTITION BY Product ORDER BY Cost
    ROWS BETWEEN CURRENT ROW AND UNBOUNDED FOLLOWING) [Highest Sales],
    Cost - FIRST_VALUE(Cost) OVER (PARTITION BY Product ORDER BY Cost) AS [Difference of Sales]
FROM Sales