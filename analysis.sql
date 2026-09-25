SELECT 
    c.first_name || ' ' || c.last_name AS customer_name,
    c.city,
    COUNT(o.order_id) AS total_orders,
    SUM(o.quantity * p.price) AS total_spent
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
JOIN products p ON o.product_id = p.product_id
WHERE o.status = 'Completed'
GROUP BY c.customer_id
ORDER BY total_spent DESC;