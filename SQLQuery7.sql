BULK INSERT dbo.Sales
FROM 'D:\���������\USA\��������\SQL\Restraunt\Sales_Restaurant.csv'
WITH (
    FIELDTERMINATOR = ',',  -- ����������� ����� ���������
    ROWTERMINATOR = '\n',   -- ����������� �����
    FIRSTROW = 2,           -- ���� ������ ������ �������� ��������� ��������
    TABLOCK
);