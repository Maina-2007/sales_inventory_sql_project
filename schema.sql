-- ===============================================================
-- Project: Sales and Inventory Analysis
-- File: schema.sql
-- Description: Database schema and sample data for the Sales and 
--Inventory Analysis project.
-- Author: Charles Maina
-- ===============================================================

-- ======================
-- PRODUCTS TABLE
-- ======================
CREATE TABLE products (
    product_id SERIAL PRIMARY KEY,
    product_name VARCHAR(100),
    category VARCHAR(50),
    unit_price NUMERIC(10,2),
    cost_price NUMERIC(10,2)
);

INSERT INTO products (product_name, category, unit_price, cost_price) VALUES
('Dish Soap', 'Household', 3.50, 2.00),
('Laundry Detergent', 'Household', 12.00, 8.00),
('Toothpaste', 'Personal Care', 2.50, 1.20),
('Shampoo', 'Personal Care', 6.00, 3.50),
('Rice 5kg', 'Grocery', 8.50, 5.50),
('Cooking Oil 1L', 'Grocery', 4.20, 2.80),
('Sugar 2kg', 'Grocery', 3.80, 2.60),
('Tea Bags 100s', 'Grocery', 5.00, 3.00);

-- ======================
-- CUSTOMERS TABLE
-- ======================
CREATE TABLE customers (
    customer_id SERIAL PRIMARY KEY,
    customer_name VARCHAR(100),
    region VARCHAR(50)
);

INSERT INTO customers (customer_name, region) VALUES
('Mary Njoroge', 'Nairobi'),
('Peter Otieno', 'Kisumu'),
('Grace Wanjiru', 'Nakuru'),
('James Mwangi', 'Mombasa'),
('Faith Kamau', 'Eldoret'),
('Dennis Ochieng', 'Kisumu'),
('Lilian Njeri', 'Nairobi'),
('Samuel Kipkoech', 'Eldoret');

-- ======================
-- SALES TABLE
-- ======================
CREATE TABLE sales (
    sale_id SERIAL PRIMARY KEY,
    product_id INT REFERENCES products(product_id),
    customer_id INT REFERENCES customers(customer_id),
    quantity INT,
    sale_date DATE
);

INSERT INTO sales (product_id, customer_id, quantity, sale_date) VALUES
(1, 1, 10, '2025-09-01'),
(2, 2, 5, '2025-09-02'),
(3, 3, 20, '2025-09-03'),
(4, 4, 8, '2025-09-03'),
(5, 5, 15, '2025-09-04'),
(6, 6, 12, '2025-09-04'),
(7, 7, 18, '2025-09-05'),
(8, 8, 7, '2025-09-05'),
(1, 2, 6, '2025-09-06'),
(3, 4, 15, '2025-09-06'),
(5, 1, 10, '2025-09-07'),
(6, 3, 8, '2025-09-07'),
(2, 5, 6, '2025-09-08'),
(4, 6, 9, '2025-09-08'),
(8, 7, 12, '2025-09-09'),
(7, 8, 10, '2025-09-09'),
(5, 4, 7, '2025-09-10'),
(6, 1, 5, '2025-09-10'),
(3, 2, 8, '2025-09-11'),
(1, 3, 11, '2025-09-11');

-- ======================
-- INVENTORY TABLE
-- ======================
CREATE TABLE inventory (
    inventory_id SERIAL PRIMARY KEY,
    product_id INT REFERENCES products(product_id),
    stock_level INT
);

INSERT INTO inventory (product_id, stock_level) VALUES
(1, 150),
(2, 100),
(3, 200),
(4, 120),
(5, 180),
(6, 160),
(7, 140),
(8, 100);
