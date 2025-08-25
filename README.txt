Using “Restaurant Sales Data” taken from https://www.kaggle.com/datasets/rohitgrewal/restaurant-sales-data I wrote queries in SQL Server.
It is a sales data of a restaurant company operating in multiple cities in the world. It contains information about individual sales transactions, customer demographics, and product details. The data is structured in a tabular format, with each row representing a single record and each column representing a specific attribute. This dataset can be commonly used for business intelligence, sales forecasting, and customer behaviour analysis.

These are the main Features/Columns available in the dataset:

1) Order ID: A unique identifier for each sales order. This can be used to track individual transactions.

2) Order Date: The date when the order was placed. This column is essential for time-series analysis, such as identifying sales trends over time or seasonality.

3) Product: The name or type of the product sold. This column is crucial for analyzing sales performance by product category.

4) Price : The unit price of the product. This, along with 'Quantity Ordered', is used to calculate the total price of each order.

5) Quantity : The number of units of the product sold in a single order. This is a key metric for calculating revenue and understanding sales volume.

6) Purchase Type : The order was made online or in-store or drive-thru.

7) Payment Method : How the payment for the order was done.

8) Manager : Name of the manager of the store.

9) City : The location of the store. This can be used for geographical analysis of sales, such as identifying top-performing regions or optimizing logistics.