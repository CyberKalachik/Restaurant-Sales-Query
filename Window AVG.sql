-- FIND the average sales across all products and average sales for each product
-- Additionaly provide details such as OrderID, date
SELECT
	OrderID,
	Product,
	Date,
	Cost,
	AVG(Cost) OVER() [Average sales],
	AVG(Cost) OVER(PARTITION BY Product) [Average sales by Product]
From Sales;

-- FIND the average Quantity of product
-- PROVIDE details such as Manager name and city

SELECT
	OrderID,
	Product,
	Manager,
	City,
	Quantity,
	ROUND(AVG(Quantity) OVER(), 2) [Average Quantity],
	ROUND(AVG(Quantity) OVER(PARTITION BY Product), 2) [Average Quantity by Product]
From Sales;

-- FIND all products where sales(cost) are higher than the average sales across all products

SELECT
*
FROM(
	SELECT
		OrderID,
		Product,
		Cost,
		AVG(Cost) OVER() [Average cost]
	FROM Sales
)t WHERE Cost > [Average cost];


SELECT
TOP 50*
FROM Sales