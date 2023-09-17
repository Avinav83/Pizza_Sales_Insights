SELECT  * FROM pizza_sales

/*Total Revenue generated*/
SELECT SUM(total_price) AS Total_Revenue FROM pizza_sales
/*Average Order Value*/
SELECT (SUM(total_price)/COUNT(DISTINCT order_id)) as Average_pizza_sales from pizza_sales
/*Total Pizzas Sold*/
SELECT SUM(quantity) AS Total_pizza_sold FROM  pizza_sales
/*Total Orders*/
SELECT COUNT(DISTINCT order_id) AS Total_orders FROM pizza_sales
/*Average Pizzas Per Order*/
SELECT SUM(quantity)/COUNT(DISTINCT order_id) AS Average_pizza_per_order from pizza_sales

/*DAILY TREND FOR ORDERS
DATENAME() function is used to extract a specific segment of a date or time value, such as the day of the week(DW), month, or year.*/
SELECT DATENAME(DW, order_date) as Order_Day, COUNT(DISTINCT order_id) AS Total_Sales FROM pizza_sales
Group by DATENAME(DW, order_date)

/*Monthly TREND FOR ORDERS*/
SELECT DATENAME(Month, order_date) as Order_Month, COUNT(DISTINCT order_id) AS Total_Sales FROM pizza_sales
Group by DATENAME(Month, order_date)

/*"%" of Sales by Pizza Category for entire dataset*/
SELECT pizza_category, Cast(sum(total_price) AS DECIMAL(10,2)) AS Total_Sales, CAST(sum(total_price) * 100 / (SELECT Sum(total_price) FROM pizza_sales) AS DECIMAL(10,2)) AS Sales_By_Pizza_Category 
FROM pizza_sales
GROUP BY pizza_category

/*"%" of Sales by Pizza Category for specific month*/
SELECT pizza_category, Cast(sum(total_price) AS DECIMAL(10,2)) AS Total_Sales, CAST(sum(total_price) * 100 / (SELECT Sum(total_price) FROM pizza_sales WHERE MONTH(order_date)=1) AS DECIMAL(10,2)) AS Sales_By_Pizza_Category 
FROM pizza_sales
WHERE MONTH(order_date)=1
GROUP BY pizza_category

/* "%" of Sales by Pizza Size*/
SELECT pizza_size, Cast(sum(total_price) AS DECIMAL(10,2)) AS Total_Sales, CAST(sum(total_price) * 100 / (SELECT Sum(total_price) FROM pizza_sales) AS DECIMAL(10,2)) AS Sales_By_Pizza_Category 
FROM pizza_sales
GROUP BY pizza_size ORDER BY Sales_By_Pizza_Category DESC

/*Total Pizza sold by Pizza category*/
Select pizza_category, SUM(quantity) AS Total_quantity_Sold FROM pizza_sales
Where MONTH(order_date) = 2
GROUP BY pizza_category

/*Top 5 Pizzas by Revenue*/
SELECT TOP 5 pizza_name, SUM(total_price) AS Total_Revenue FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Revenue DESC

/*Bottom 5 Pizzas by Revenue*/
SELECT TOP 5 pizza_name, SUM(total_price) AS Total_Revenue FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Revenue ASC

/*Top 5 Pizzas by Quantity*/
SELECT TOP 5 pizza_name, SUM(quantity) AS Total_Pizza_Sold FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Pizza_Sold DESC

/*Top 5 Pizzas by Quantity*/
SELECT TOP 5 pizza_name, SUM(quantity) AS Total_Pizza_Sold FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Pizza_Sold ASC

/*Top 5 Pizzas by Total Orders*/
SELECT TOP 5 pizza_name, COUNT(DISTINCT order_id) AS Total_Orders FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Orders DESC

/*Top 5 Pizzas by Total Orders*/
SELECT TOP 5 pizza_name, COUNT(DISTINCT order_id) AS Total_Orders FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Orders ASC

SELECT Top 5 pizza_name, COUNT(DISTINCT order_id) AS Total_Orders
FROM pizza_sales
WHERE pizza_category = 'Classic'
GROUP BY pizza_name
ORDER BY Total_Orders ASC