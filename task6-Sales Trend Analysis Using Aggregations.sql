CREATE DATABASE sales_analysis;
USE sales_analysis;
#Step 1: Create the table
CREATE TABLE online_sales (
    order_id INT primary key,
    order_date DATE,
    amount DECIMAL(10, 2),
    product_id varchar(10)
);
 #Step 2: Monthly Revenue and Order Volume
SELECT 
    EXTRACT(YEAR FROM order_date) AS year,
    EXTRACT(MONTH FROM order_date) AS month,
    SUM(amount) AS monthly_revenue,
    COUNT(DISTINCT order_id) AS order_volume
FROM online_sales
GROUP BY year, month
ORDER BY year, month;

# Step 3: Top 3 Revenue Months
SELECT 
    EXTRACT(YEAR FROM order_date) AS year,
    EXTRACT(MONTH FROM order_date) AS month,
    SUM(amount) AS monthly_revenue
FROM online_sales
GROUP BY year, month
ORDER BY monthly_revenue DESC
LIMIT 3;

#Step 4: Anomalies – Low Revenue Months (< ₹5000)
SELECT 
    EXTRACT(YEAR FROM order_date) AS year,
    EXTRACT(MONTH FROM order_date) AS month,
    SUM(amount) AS monthly_revenue
FROM online_sales
GROUP BY year, month
ORDER BY monthly_revenue ASC;

 #Step 5: Revenue by Product
SELECT 
    product_id,
    COUNT(order_id) AS order_count,
    SUM(amount) AS total_revenue
FROM online_sales
GROUP BY product_id
ORDER BY total_revenue DESC;

#Step 6: Daily Revenue Trend
SELECT 
    order_date,
    SUM(amount) AS daily_revenue
FROM online_sales
GROUP BY order_date
ORDER BY order_date;

#Step 7: Sort monthly revenue in ascending order
SELECT 
    EXTRACT(YEAR FROM order_date) AS year,
    EXTRACT(MONTH FROM order_date) AS month,
    SUM(amount) AS monthly_revenue
FROM online_sales
GROUP BY year, month
ORDER BY monthly_revenue ASC;


