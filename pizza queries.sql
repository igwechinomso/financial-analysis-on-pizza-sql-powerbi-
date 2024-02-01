create table pizza(pizza_id integer,ordere_id integer, pizza_name_id text, quantity integer,order_date date, order_time time, unit_price numeric,total_price numeric,pizza_size text,pizza_category text,pizza_ingredients text,
				  pizza_name text)

	select *
	from pizza;
--Total revenue	
SELECT SUM(total_price) AS total_revenue
from pizza
	
--Average pizza sales
SELECT sum(total_price)/ count(distinct ordere_id) AS average_sales
from pizza;

--Total pizza sold
select sum(quantity) AS total_pizza_sold
from pizza;

--Total Orders
SELECT COUNT(DISTINCT ordere_id) AS Total_Orders 
FROM pizza;

 --Average Pizzas Per Order
SELECT CAST(CAST(SUM(quantity) AS DECIMAL(10,2)) / 
CAST(COUNT(DISTINCT ordere_id) AS DECIMAL(10,2)) AS DECIMAL(10,2))
AS Avg_Pizzas_per_order
FROM pizza

--Daily Trend for Total Orders
SELECT TO_CHAR(order_date,'Day') AS order_day, 
COUNT(Distinct ordere_id)AS total_orders
FROM pizza
GROUP BY TO_CHAR(order_date,'Day')
ORDER BY total_orders DESC;

--Monthly Trend for Orders
SELECT TO_CHAR(order_date, 'month') as Month_Name, 
COUNT(DISTINCT ordere_id) as Total_Orders
from pizza
GROUP BY Month_Name
ORDER BY Total_Orders DESC;

--% of Sales by Pizza Category
SELECT pizza_category, CAST(SUM(total_price) AS DECIMAL(10,2)) as total_revenue,
CAST(SUM(total_price) * 100 / (SELECT SUM(total_price) from pizza) AS DECIMAL(10,2)) AS PCT
FROM pizza
GROUP BY pizza_category
ORDER BY PCT DESC;

--% of Sales by Pizza Size
SELECT pizza_size, CAST(SUM(total_price) AS DECIMAL(10,2)) as total_revenue,
CAST(SUM(total_price) * 100 / (SELECT SUM(total_price) from pizza) AS DECIMAL(10,2)) AS PCT
FROM pizza
GROUP BY pizza_size
ORDER BY pizza_size;

--Total Pizzas Sold by Pizza Category
SELECT pizza_category, SUM(quantity) as Total_Quantity_Sold
FROM pizza
WHERE (SELECT EXTRACT(MONTH FROM order_date)) = 2
GROUP BY pizza_category
ORDER BY Total_Quantity_Sold DESC;

--Top 5 Pizzas by Revenue
SELECT pizza_name, SUM(total_price) AS Total_Revenue
FROM pizza
GROUP BY pizza_name
ORDER BY Total_Revenue DESC
limit 5;

--Bottom  5 Pizzas by Revenue
SELECT pizza_name, SUM(total_price) AS Total_Revenue
FROM pizza
GROUP BY pizza_name
ORDER BY Total_Revenue ASC
limit 5;


--Top 5 Pizzas by Quantity
SELECT pizza_name, SUM(quantity) AS Total_Pizza_Sold
FROM pizza
GROUP BY pizza_name
ORDER BY Total_Pizza_Sold DESC
limit 5;

--Bottom 5 Pizzas by Quantity
SELECT pizza_name, SUM(quantity) AS Total_Pizza_Sold
FROM pizza
GROUP BY pizza_name
ORDER BY Total_Pizza_Sold ASC
limit 5;


--Top 5 Pizzas by Total Orders
SELECT pizza_name, COUNT(DISTINCT ordere_id) AS Total_Orders
FROM pizza
GROUP BY pizza_name
ORDER BY Total_Orders DESC
limit 5;


--Borrom 5 Pizzas by Total Orders
SELECT pizza_name, COUNT(DISTINCT ordere_id) AS Total_Orders
FROM pizza
GROUP BY pizza_name
ORDER BY Total_Orders ASC
limit 5;





