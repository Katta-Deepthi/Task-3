
-- 1. Customer Order Summary (Top 10 customers by number of orders)
SELECT customer_id, COUNT(order_id) AS total_orders
FROM orders
GROUP BY customer_id
ORDER BY total_orders DESC
LIMIT 10;

-- 2. Average Payment Amount by Payment Type
SELECT payment_type, AVG(payment_value) AS avg_payment
FROM order_payments
GROUP BY payment_type
ORDER BY avg_payment DESC;

-- 3. Top-Selling Products (by quantity)
SELECT p.product_id, pr.product_category_name, SUM(oi.product_id) AS total_quantity_sold
FROM order_items oi
JOIN products p ON oi.product_id = p.product_id
LEFT JOIN product_category_name_translation pr ON p.product_category_name = pr.product_category_name
GROUP BY p.product_id
ORDER BY total_quantity_sold DESC
LIMIT 10;

-- 4. Seller Performance (Top 10 sellers by number of products sold)
SELECT seller_id, COUNT(order_item_id) AS total_items_sold
FROM order_items
GROUP BY seller_id
ORDER BY total_items_sold DESC
LIMIT 10;

-- 5. Review Score Distribution
SELECT review_score, COUNT(*) AS review_count
FROM order_reviews
GROUP BY review_score
ORDER BY review_score DESC;

-- 6. Monthly Revenue Trend
SELECT strftime('%Y-%m', o.order_purchase_timestamp) AS month, SUM(op.payment_value) AS total_revenue
FROM orders o
JOIN order_payments op ON o.order_id = op.order_id
GROUP BY month
ORDER BY month;

-- 7. Create a View for Seller Revenue Summary
CREATE VIEW seller_revenue_summary AS
SELECT oi.seller_id, SUM(op.payment_value) AS total_revenue, COUNT(DISTINCT o.order_id) AS total_orders
FROM order_items oi
JOIN orders o ON oi.order_id = o.order_id
JOIN order_payments op ON o.order_id = op.order_id
GROUP BY oi.seller_id;

-- 8. Select top 5 sellers by revenue from the view
SELECT * FROM seller_revenue_summary
ORDER BY total_revenue DESC
LIMIT 5;



FULL SQL ANALYSIS











FULL SQL ANALYSIS









