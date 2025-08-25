-- FIND the total sales across all orders and the total sales for each product
-- PROVIDE product, date and city

SELECT
	Product,
	Date,
	City,
	SUM(Cost) OVER() AS [Total sales],
	SUM(Cost) OVER(PARTITION BY Product) AS [Sales by Product]
FROM Sales;

--FIND the percentage contribution of each product's sales to the total sales

SELECT
	OrderID,
	Product,
	Cost,
	SUM(Cost) OVER() [Total sales],
	ROUND (CAST (Cost AS Float) / SUM(Cost) OVER() * 100, 2) [Percentage contribution]
FROM Sales;


SELECT
TOP 5*
FROM Sales