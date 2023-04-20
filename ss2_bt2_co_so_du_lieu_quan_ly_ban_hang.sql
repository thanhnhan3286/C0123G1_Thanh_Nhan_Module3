CREATE DATABASE order_management;
USE order_management;
CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(50) NOT NULL,
    customer_age INT CHECK (customer_age BETWEEN 18 AND 90)
);
CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT, FOREIGN KEY (customer_id) references customers (customer_id),
    order_date DATE NOT NULL,
    order_total_price FLOAT NOT NULL CHECK (order_total_price > 0)
);
CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(50) NOT NULL,
    product_price FLOAT CHECK (product_price > 0)
);
CREATE TABLE order_detail (
    order_id INT,
    product_id INT,
    order_detail_quantity INT CHECK (order_detail_quantity > 0),
    PRIMARY KEY (order_id , product_id),
    FOREIGN KEY (order_id)
        REFERENCES orders (order_id),
    FOREIGN KEY (product_id)
        REFERENCES products (product_id)
);