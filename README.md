## 1.  Objective
- To analyze sales performance using SQL by exploring transaction-level data to identify:

- Monthly revenue and order volume

- Top-performing months and products

- Daily trends and patterns

- Potential anomalies or underperforming periods

## 2.  Dataset Explanation
- The dataset represents order-level transaction data with the following columns:
  -- Column Name        -- Description                                - Datatype                    

   order_id      Unique identifier for each order (INT)                INT
  order_date    Date of the order in `YYYY-MM-DD` format               DATE
   amount        Total revenue generated from the order (₹)            DECIMAL
  product_id    Unique identifier for the product (VARCHAR)            VARCHAR

## 3. SQL Code Used
-- Step 0: Create and select database
CREATE DATABASE sales_analysis;
USE sales_analysis;

-- Step 1: Create the table
CREATE TABLE online_sales (
    order_id INT PRIMARY KEY,
    order_date DATE,
    amount DECIMAL(10, 2),
    product_id VARCHAR(10)
);

-- Step 2: Monthly Revenue and Order Volume
SELECT 
    EXTRACT(YEAR FROM order_date) AS year,
    EXTRACT(MONTH FROM order_date) AS month,
    SUM(amount) AS monthly_revenue,
    COUNT(DISTINCT order_id) AS order_volume
FROM online_sales
GROUP BY year, month
ORDER BY year, month;

-- Step 3: Top 3 Revenue Months
SELECT 
    EXTRACT(YEAR FROM order_date) AS year,
    EXTRACT(MONTH FROM order_date) AS month,
    SUM(amount) AS monthly_revenue
FROM online_sales
GROUP BY year, month
ORDER BY monthly_revenue DESC
LIMIT 3;

-- Step 4: Anomalies – All months sorted by revenue (find low-revenue months manually)
SELECT 
    EXTRACT(YEAR FROM order_date) AS year,
    EXTRACT(MONTH FROM order_date) AS month,
    SUM(amount) AS monthly_revenue
FROM online_sales
GROUP BY year, month
ORDER BY monthly_revenue ASC;

-- Step 5: Revenue by Product
SELECT 
    product_id,
    COUNT(order_id) AS order_count,
    SUM(amount) AS total_revenue
FROM online_sales
GROUP BY product_id
ORDER BY total_revenue DESC;

-- Step 6: Daily Revenue Trend
SELECT 
    order_date,
    SUM(amount) AS daily_revenue
FROM online_sales
GROUP BY order_date
ORDER BY order_date;

-- Step 7: Sorted Monthly Revenue (Ascending)
SELECT 
    EXTRACT(YEAR FROM order_date) AS year,
    EXTRACT(MONTH FROM order_date) AS month,
    SUM(amount) AS monthly_revenue
FROM online_sales
GROUP BY year, month
ORDER BY monthly_revenue ASC;

## 4. Output Summary

 Step 2   Monthly sales volume and revenue trends               
 [Result_table1.csv](https://github.com/user-attachments/files/20670168/Result_table1.csv)

 Step 3  Top 3 months with the highest revenue 
 [Result_table2.csv](https://github.com/user-attachments/files/20670174/Result_table2.csv)

 Step 4  All months sorted by revenue (to spot low-performers) 
 [Result_table3.csv](https://github.com/user-attachments/files/20670180/Result_table3.csv)

 Step 5   Top-performing products by revenue                    
 [Result_table4.csv](https://github.com/user-attachments/files/20670183/Result_table4.csv)

 Step 6  Daily revenue trend (useful for time-series analysis) 
 [Result_table5.csv](https://github.com/user-attachments/files/20670188/Result_table5.csv)

 Step 7  Reinforces monthly revenue sorting                    
[Result_table6.csv](https://github.com/user-attachments/files/20670191/Result_table6.csv)

## 5.  Insights, Patterns & Anomalies
- Peak Revenue Months: Identified the 3 months with the highest revenue generation.

-  Potential Anomalies: Months with significantly lower revenue appeared at the bottom of Step 4 output.

-  Top Products: Product IDs like P010, P012, and P003 showed high revenue and order count.

-  Sales Consistency: Daily revenue trend showed spikes on mid-month and end-of-month days.

-  Balanced Orders: Order volume distribution is steady, indicating even sales across time.

## 6. Conclusion
- This SQL-based sales analysis provided meaningful insights into sales trends using structured queries. By leveraging GROUP BY, ORDER BY, and aggregate functions like SUM() and COUNT(), we extracted useful patterns such as peak performance periods and product effectiveness. These findings can inform business strategies, marketing efforts, and inventory planning.


