CREATE TABLE categories (id INTEGER PRIMARY KEY, name TEXT);
CREATE TABLE products (
    id INTEGER PRIMARY KEY, name TEXT, category_id INTEGER,
    price REAL, stock INTEGER,
    FOREIGN KEY (category_id) REFERENCES categories(id));
CREATE TABLE customers (
    id INTEGER PRIMARY KEY, name TEXT, city TEXT, email TEXT);
CREATE TABLE orders (
    id INTEGER PRIMARY KEY, customer_id INTEGER,
    order_date DATE, status TEXT,
    FOREIGN KEY (customer_id) REFERENCES customers(id));
CREATE TABLE order_items (
    order_id INTEGER, product_id INTEGER, qty INTEGER, price REAL,
    FOREIGN KEY (order_id) REFERENCES orders(id),
    FOREIGN KEY (product_id) REFERENCES products(id));
