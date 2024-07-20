CREATE VIEW sales_summary AS
	SELECT region, sum(sales) over(PARTITION BY region) as totalSales, quantity, profit 
		FROM sales_table2;
        
        
ALTER VIEW sales_summary AS
	SELECT region, sum(sales) over(PARTITION BY region) as totalSales, quantity, profit, Category, subCategory 
		FROM sales_table2;
        
        
DROP VIEW sales_summary;


-- !! 1.	Write a query to find the top 3 customers with the highest total sales.
SELECT DISTINCT customerID, customerNAme, SUM(SALES * Quantity) 
	OVER(PARTITION BY customerID ) AS totalSales 
    FROM sales_table2 
    ORDER BY totalSales DESC
    LIMIT 3;
    
SELECT customerID, customerNAme, SUM(SALES * quantity) as totalSales
FROM sales_table2
GROUP BY customerID, customerName
ORDER BY totalSales DESC
LIMIT 3;

-- !! 2.	Write a query to find the total sales and profit for each region, including only orders with a specific ship mode.
SELECT region, sum(sales * quantity) totalSales, sum(profit) totalProfit from sales_table2
WHERE shipMode = 'first class'
GROUP BY region;

-- !! 4.	Write a query to find the top 3 products with the highest total sales and profit.
SELECT productID, sum(sales * quantity ) as totalSales from sales_table2
group by productID order by totalSales DESC LIMIT 3;

SELECT productID, sum(profit) as totalProfit from sales_table2
group by productID order by totalProfit DESC LIMIT 3;