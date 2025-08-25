BULK INSERT dbo.Sales
FROM 'D:\МАРГАРИТА\USA\ОБУЧЕНИЕ\SQL\Restraunt\Sales_Restaurant.csv'
WITH (
    FIELDTERMINATOR = ',',  -- Разделитель между столбцами
    ROWTERMINATOR = '\n',   -- Разделитель строк
    FIRSTROW = 2,           -- Если первая строка содержит заголовки столбцов
    TABLOCK
);