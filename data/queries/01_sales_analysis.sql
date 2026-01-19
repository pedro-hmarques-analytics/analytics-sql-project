-- Create customers table
CREATE TABLE customers (
    customer_id INT,
    customer_name VARCHAR(100),
    city VARCHAR(50)
);

-- Create orders table
CREATE TABLE orders (
    order_id INT,
    customer_id INT,
    order_date DATE,
    total_amount DECIMAL(10,2)
);

-- Insert sample customers
INSERT INTO customers VALUES
(1, 'Ana Silva', 'São Paulo'),
(2, 'Carlos Pereira', 'Campinas'),
(3, 'Mariana Costa', 'Ribeirão Preto');

-- Insert sample orders
INSERT INTO orders VALUES
(101, 1, '2024-01-10', 250.00),
(102, 2, '2024-01-15', 450.00),
(103, 2, '2024-02-10', 300.00),
(104, 3, '2024-02-20', 150.00);

-- Total revenue
SELECT SUM(total_amount) AS total_revenue
FROM orders;

-- Revenue by city
SELECT
    c.city,
    SUM(o.total_amount) AS revenue
FROM orders o
JOIN customers c ON o.customer_id = c.customer_id
GROUP BY c.city
ORDER BY revenue DESC;
