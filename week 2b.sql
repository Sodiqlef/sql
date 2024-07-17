-- !!! 1.	List the names of customers who made orders, along with the total amount of each order.

SELECT name, totalAmount FROM customers_table 
	INNER JOIN orders_table
    ON customers_table.customerID = orders_table.CustomerID;
    
    
-- !!! 2.	Show the order ID, product name, and quantity of each item ordered.
SELECT orderId, productName, quantity FROM orderdetails_table
	JOIN products_table ON orderdetails_table.productID = products_table.ProductID;
    
    
-- !!! 3.	Display the email addresses of customers along with the products they ordered and the quantities.
SELECT email, productName, quantity from customers_table
	JOIN orders_table ON customers_table.CustomerID = orders_table.CustomerID
    JOIN orderdetails_table ON orders_table.OrderID = orderdetails_table.OrderID
    JOIN products_table ON orderdetails_table.ProductID = products_table.ProductID;
    

-- !!! 4.	Find the total amount spent by each customer.
SELECT  name, sum(TotalAmount) TotalAmount FROM customers_table
	JOIN orders_table ON customers_table.CustomerID = orders_table.CustomerID
    group by Name;
    
    
-- !!! 1.	List all orders along with the names of the customers who made them. If an order doesn't have a customer, display "Unknown".
SELECT orders_table.*, name from orders_table 
	LEFT OUTER JOIN customers_table
    ON orders_table.CustomerID = customers_table.CustomerID;
    
-- !!! 2.	Show the product names and quantities ordered. Include products without orders.
SELECT  ProductName, quantity from products_table 
	LEFT JOIN orderdetails_table
    ON products_table.productID = orderdetails_table.ProductID;
    
    
-- !!! 3.	Display all customers and the total amount they spent on orders. If a customer hasn't placed any orders, display "No orders placed".
SELECT  customers_table.CustomerID, name,
	 COALESCE(SUM(orders_table.TotalAmount), 'No orders placed') AS Total_Amount
    from customers_table 
	LEFT JOIN orders_table
    ON customers_table.customerID = orders_table.CustomerID
    GROUP BY customers_table.CustomerID, name;
    
    
-- !!! 4.	List all orders and their associated products. Include orders without products and products without orders.
SELECT 
    orders_table.OrderID,
    products_table.ProductID,
    products_table.ProductName
FROM 
    orders_table
LEFT JOIN 
    orderdetails_table ON orders_table.OrderID = orderdetails_table.OrderID
LEFT JOIN 
    products_table ON orderdetails_table.ProductID = products_table.ProductID

UNION 

SELECT 
    orders_table.OrderID,
    products_table.ProductID,
    products_table.ProductName
FROM 
    products_table
LEFT JOIN 
    orderdetails_table ON products_table.ProductID = orderdetails_table.ProductID
LEFT JOIN 
    orders_table ON orderdetails_table.OrderID = orders_table.OrderID;


-- !!! 1.	List all orders along with the names of the customers who made them. Include orders without customers and customers without orders.
SELECT orders_table.orderID, customers_table.Name FROM orders_table 
	LEFT JOIN customers_table ON orders_table.CustomerID = customers_table.CustomerID
    
UNION 

SELECT orders_table.orderID, customers_table.Name FROM orders_table 
	RIGHT JOIN customers_table ON orders_table.CustomerID = customers_table.CustomerID




