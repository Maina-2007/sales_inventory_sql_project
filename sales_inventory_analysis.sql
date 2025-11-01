--1. Top-Performing Products by Sales Volume and Revenue
SELECT 
    p.product_name,
    p.category,
    SUM(s.quantity) AS total_units_sold,
    SUM(s.quantity * p.unit_price) AS total_revenue
FROM sales s
JOIN products p ON s.product_id = p.product_id
GROUP BY p.product_name, p.category
ORDER BY total_revenue DESC
LIMIT 10;
--2. Regions Generating the Most Profit
SELECT 
    c.region,
    ROUND(SUM((p.unit_price - p.cost_price) * s.quantity), 2) AS total_profit
FROM sales s
JOIN products p ON s.product_id = p.product_id
JOIN customers c ON s.customer_id = c.customer_id
GROUP BY c.region
ORDER BY total_profit DESC;
--3. Profit Margin per Product and Category
SELECT 
    p.category,
    p.product_name,
    SUM(s.quantity * p.unit_price) AS total_revenue,
    SUM(s.quantity * p.cost_price) AS total_cost,
    ROUND(SUM((p.unit_price - p.cost_price) * s.quantity), 2) AS total_profit,
    ROUND(
        (SUM((p.unit_price - p.cost_price) * s.quantity) / SUM(s.quantity * p.cost_price)) * 100, 
        2
    ) AS profit_margin_pct
FROM sales s
JOIN products p ON s.product_id = p.product_id
GROUP BY p.category, p.product_name
ORDER BY profit_margin_pct DESC;
--4. Inventory Levels vs Sales Performance
SELECT 
    p.product_name,
    i.stock_level,
    SUM(s.quantity) AS total_units_sold,
    (i.stock_level - SUM(s.quantity)) AS remaining_stock
FROM inventory i
JOIN products p ON i.product_id = p.product_id
JOIN sales s ON s.product_id = p.product_id
GROUP BY p.product_name, i.stock_level
ORDER BY total_units_sold DESC;
--5. Most Valuable Customers by Total Purchases
SELECT 
    c.customer_name,
    c.region,
    SUM(s.quantity * p.unit_price) AS total_spent,
    COUNT(s.sale_id) AS total_transactions
FROM sales s
JOIN products p ON s.product_id = p.product_id
JOIN customers c ON s.customer_id = c.customer_id
GROUP BY c.customer_name, c.region
ORDER BY total_spent DESC
LIMIT 10;
