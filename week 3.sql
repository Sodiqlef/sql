-- !!! 1.	Which date(s) had the highest total sales and which product(s) contributed to those sales?

SELECT date, product, TotalSales 
	FROM sales_table
	WHERE TotalSales 
    IN ( 
		SELECT max(TotalSales) 
		FROM sales_table
	);
		
    
-- !!! 2.	Which product(s) had the highest average unit price among all products sold

SELECT 
    Product,
    AvgUnitPrice
FROM (
    SELECT 
        Product,
        AVG(UnitPrice) AS AvgUnitPrice
    FROM 
        sales_TABLE
    GROUP BY 
        Product
) AS avg_unit_prices

WHERE 
    AvgUnitPrice = (
        SELECT 
            MAX(AvgUnitPrice)
        FROM (
            SELECT 
                AVG(UnitPrice) AS AvgUnitPrice
            FROM 
                sales_TABLE
            GROUP BY 
                Product
        ) AS all_avg_unit_prices
    );
    
    
-- !! 3.	What were the total sales for each product on dates where the quantity sold exceeded the average quantity sold for that product?
SELECT 
    Product,
    SUM(TotalSales) AS totalSales
	FROM 
		sales_table as st
	WHERE 
		QuantitySold > ( 
						SELECT  avg(quantitySold) 
							from sales_table 
							WHERE product = st.product)
	GROUP BY product 
    order by TotalSales;
    
    
    
    -- !!! 4.	What were the top 3 dates with the highest total sales, and which product(s) contributed to those sales on each date?
    SELECT date, product, totalSales 
		from sales_table
		order by totalSales desc 
		Limit 3;
        
        
-- !!! 5.	What percentage of the total sales on April 15th, 2024, did each product contribute?

SELECT product, totalsales, TotalSales/(
	SELECT sum(totalsales) as allTotalsales from sales_table
	)*100 as percentage 
    FROM sales_table as st 
    where date = '4/15/2024' 
    group by product, TotalSales;
    
    
    
-- !! 6.	Which product(s) had the highest total sales over any consecutive 3-day period?

WITH Sales_Periods AS (
    SELECT 
        Product,
        Date,
        SUM(TotalSales) OVER (
            PARTITION BY Product 
            ORDER BY Date 
            ROWS BETWEEN 2 PRECEDING AND CURRENT ROW
        ) AS TotalSales3Day
    FROM 
        sales_table
),
Max_Sales_Periods AS (
    SELECT 
        Product,
        MAX(TotalSales3Day) AS MaxTotalSales3Day
    FROM 
        Sales_Periods
    GROUP BY 
        Product
)
SELECT 
    Product,
    MaxTotalSales3Day
FROM 
    Max_Sales_Periods
WHERE 
    MaxTotalSales3Day = (
        SELECT 
            MAX(MaxTotalSales3Day)
        FROM 
            Max_Sales_Periods
    );

-- !! 7.	On which date(s) did product C's total sales exceed the combined total sales of all other products?
SELECT date, product, exceeded from (
	SELECT date, Product, sum(totalSales) 
		OVER(partition by product order by date) as exceeded
		FROM sales_table as cTable
    ) AS ET
		WHERE ( SELECT ET.exceededTable
					FROM sales_table as totalSalesOfC
                    limit 1
				 )  > (
						SELECT sum(TotalSales) 
							from sales_table as AandBtotalSales
							WHERE product <> 'C'
						 ) 
                
            
            

            
            
			
