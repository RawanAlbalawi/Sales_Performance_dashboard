CREATE DATABASE superstore;
USE superstore;

CREATE TABLE sales(
    row_id INT,
    order_id VARCHAR(20),
    order_date DATE,
    ship_date DATE,
    ship_mode VARCHAR(50),
    customer_id VARCHAR(20),
    customer_name VARCHAR(100),
    segment VARCHAR(50),
    country VARCHAR(50),
    city VARCHAR(50),
    state VARCHAR(50),
    postal_code VARCHAR(20),
    region VARCHAR(50),
    product_id VARCHAR(20),
    category VARCHAR(50),
    sub_category VARCHAR(50),
    product_name VARCHAR(255),
    sales DECIMAL(10,2)
);
SELECT * FROM sales LIMIT 10;
SELECT COUNT(*) FROM sales;
SHOW TABLES;
SELECT COUNT(*) FROM superstore;
SELECT COUNT(*) FROM sales;
SELECT COUNT(*) FROM train;
DROP TABLE sales;
DROP TABLE train;
SELECT * FROM superstore LIMIT 10;
-- إجمالي المبيعات
SELECT SUM(sales) AS total_sales FROM superstore;

-- المبيعات بالفئة
SELECT category, SUM(sales) AS total_sales
FROM superstore
GROUP BY category
ORDER BY total_sales DESC;

-- المبيعات بالمنطقة
SELECT region, SUM(sales) AS total_sales
FROM superstore
GROUP BY region
ORDER BY total_sales DESC;
SELECT `Order ID`, `Sales`,
CASE
    WHEN `Sales` > 500 THEN 'High Value'
    WHEN `Sales` >= 100 THEN 'Medium Value'
    ELSE 'Low Value'
END AS order_category
FROM superstore
LIMIT 20;
-- الطلبات اللي أعلى من المتوسط
SELECT `Customer Name`, `Sales`
FROM superstore
WHERE `Sales` > (SELECT AVG(`Sales`) FROM superstore)
ORDER BY `Sales` DESC
LIMIT 10;

-- أفضل 5 عملاء
SELECT `Customer Name`, SUM(`Sales`) AS total_spent
FROM superstore
GROUP BY `Customer Name`
ORDER BY total_spent DESC
LIMIT 5;