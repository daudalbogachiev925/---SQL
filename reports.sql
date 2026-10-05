-- Выручка по категориям
SELECT c.name, SUM(oi.qty*oi.price) AS revenue
FROM order_items oi
JOIN products p ON oi.product_id=p.id
JOIN categories c ON p.category_id=c.id
GROUP BY c.id ORDER BY revenue DESC;

-- Топ-5 клиентов
SELECT cu.name, SUM(oi.qty*oi.price) AS spent
FROM customers cu
JOIN orders o ON cu.id=o.customer_id
JOIN order_items oi ON o.id=oi.order_id
GROUP BY cu.id ORDER BY spent DESC LIMIT 5;

-- Средний чек
SELECT AVG(total) FROM (
    SELECT o.id, SUM(oi.qty*oi.price) AS total
    FROM orders o JOIN order_items oi ON o.id=oi.order_id
    GROUP BY o.id);

-- Товары с низким остатком
SELECT name, stock FROM products WHERE stock < 20;
