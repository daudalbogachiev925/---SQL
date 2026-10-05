import sqlite3, pandas as pd
conn = sqlite3.connect('shop.db')
df = pd.read_sql("""
    SELECT c.name AS category, SUM(oi.qty*oi.price) AS revenue
    FROM order_items oi
    JOIN products p ON oi.product_id=p.id
    JOIN categories c ON p.category_id=c.id
    GROUP BY c.id ORDER BY revenue DESC
""", conn)
print(df)
