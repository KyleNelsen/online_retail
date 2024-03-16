---- View entire table
--SELECT *
--FROM Online_Retail


-----------------------------------------------------------------------
-- Queries used to explore


-- Find out which countries buy the most items
SELECT Country, COUNT(*) AS value_count
FROM Online_Retail
GROUP BY Country
ORDER BY value_count DESC;


-- Find out which customers make the most orders
SELECT CustomerID, COUNT(CustomerID) AS NumberOfOrders
FROM Online_Retail
GROUP BY CustomerID
ORDER BY NumberOfOrders DESC;


 Get orders for customer 17841
SELECT *
FROM Online_Retail
WHERE CustomerID = 17841;


-- Find out which customers spend the most money (NULL is high because customerID didn't exist early on)
SELECT CustomerID, SUM(UnitPrice * Quantity) as TotalSales
FROM Online_Retail
GROUP BY CustomerID
ORDER BY TotalSales DESC;


-- Find out which items make the most money
SELECT StockCode, Description, SUM(CONVERT(int, Quantity)*UnitPrice) AS Total_Money
FROM Online_Retail
GROUP BY StockCode, Description
ORDERBY Total_Money DESC;


-- Find out which items get purchased the least
SELECT StockCode, Description, SUM(CONVERT(int, Quantity)) AS TotalSold
FROM Online_Retail
GROUP BY StockCode, Description
HAVING SUM(CONVERT(int, Quantity)) > 0
ORDER BY TotalSold ASC;


-- Find out which items get discarded the most
SELECT StockCode, Description, SUM(CONVERT(int, Quantity)) AS total_sold
FROM Online_Retail
GROUP BY StockCode, Description
ORDER BY total_sold ASC;


-- Get the most popular months for sales
SELECT MONTH(InvoiceDate) as Month, COUNT(MONTH(InvoiceDate)) as OrdersByMonth
FROM Online_Retail
GROUP BY MONTH(InvoiceDate)
ORDER BY COUNT(MONTH(InvoiceDate)) DESC;


-- Get the most popular times for sales
SELECT DATEPART(HOUR, InvoiceDate) as [Hour], COUNT(*) as OrdersByHour
FROM Online_Retail
GROUP BY DATEPART(HOUR, InvoiceDate)
ORDER BY COUNT(*) DESC;


-----------------------------------------------------------------------
-- Queries used for dashboard


-- Get the total revenue
SELECT SUM(UnitPrice * Quantity) as TotalRevenue
FROM Online_Retail;


-- Find the total number of sales
SELECT COUNT(InvoiceNo) as TotalNumberOfSales
FROM Online_Retail;


-- Get the monthly sales, ordered by month
SELECT MONTH(InvoiceDate) as Month, SUM(Quantity*UnitPrice) as MonthlySales
FROM Online_Retail
GROUP BY MONTH(InvoiceDate)
ORDER BY Month ASC;


-- Find out the top 20 items that get purchased the most
SELECT TOP 20 StockCode, Description, SUM(CONVERT(int, Quantity)) AS ItemsSold
FROM Online_Retail
GROUP BY StockCode, Description
ORDER BY ItemsSold DESC;