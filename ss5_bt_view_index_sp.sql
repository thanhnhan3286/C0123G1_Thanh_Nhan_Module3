CREATE DATABASE demo;
USE demo;
CREATE TABLE products (
    id INT AUTO_INCREMENT PRIMARY KEY,
    product_code VARCHAR(10) NOT NULL,
    product_name VARCHAR(45) NOT NULL,
    product_price FLOAT NOT NULL,
    product_amount INT,
    product_description VARCHAR(60),
    product_status BIT
);
INSERT INTO products VALUES(1,'IP6', 'I-PHONE 6', 10, 6, NULL, 1),
(2,'IP7','I-PHONE 7',12.7,7,NULL,1), 
(3,'IP8','I-PHONE 8',12.7,7,NULL,1), 
(4,'IP9','I-PHONE 9',12.7,7,NULL,1), 
(5,'IP10','I-PHONE 10',12.7,7,NULL,1), 
(6,'IP11','I-PHONE 11',12.7,7,NULL,1);
-- DROP TABLE products;
-- BƯỚC 3:
CREATE UNIQUE INDEX i_product_code ON products(product_code);
CREATE INDEX i_product_name_price ON products(product_name, product_price);
EXPLAIN SELECT * FROM products WHERE product_code = 'IP8';
EXPLAIN SELECT * FROM products WHERE (product_name = 'I-PHONE 8' AND product_price = '12.7');
SELECT * FROM products WHERE product_price = 12.7;
SELECT * FROM products WHERE product_price LIKE '12.7';

-- BƯỚC 4: 
CREATE VIEW product_view AS
SELECT product_code, product_name, product_price, product_status
FROM products;
SELECT * FROM product_view;
UPDATE product_view SET product_code = 'IP199' WHERE product_code = 'IP9'; 
DELETE FROM product_view WHERE product_code = 'IP199';
DROP VIEW product_view;

-- BƯỚC 5
-- Tạo store procedure lấy tất cả thông tin của tất cả các sản phẩm trong bảng product:
DELIMITER //
CREATE PROCEDURE get_all_products()
BEGIN
SELECT * FROM products;
END //
DELIMITER ;
CALL get_all_products();
-- Tạo store procedure thêm một sản phẩm mới
DELIMITER //
CREATE PROCEDURE add_product(IN `code` VARCHAR(10), IN `name` VARCHAR(45), IN price FLOAT, IN amount INT, IN `description` VARCHAR(60),IN `status` BIT)
BEGIN
INSERT INTO products (product_code,product_name,product_price,product_amount,product_description,product_status)
VALUE(`code`, `name`, price, amount, `description`, `status`);
END //
DELIMITER ;
-- DROP PROCEDURE add_product;
CALL add_product('IP2','I-PHONE 2', 20, 20, NULL, 1);
-- Tạo store procedure sửa thông tin sản phẩm theo id
DELIMITER //
CREATE PROCEDURE set_product(IN p_id INT, IN `code` VARCHAR(10), IN `name` VARCHAR(45), IN price FLOAT, IN amount INT, IN `description` VARCHAR(60),IN `status` BIT)
BEGIN
UPDATE products SET product_code = `code` , product_name = `name`, product_price = price , product_amount = amount , product_description = `description` , product_status = `status`  WHERE id = p_id;
END //
DELIMITER ;
-- DROP PROCEDURE set_product;
CALL set_product(7,'IP3','I-PHONE 3', 30, 20, NULL, 1);

-- Tạo store procedure xoá sản phẩm theo id
DELIMITER //
CREATE PROCEDURE delete_product(IN p_id INT)
BEGIN
DELETE FROM products WHERE id = p_id;
END //
DELIMITER ;
-- DROP PROCEDURE delete_product;
CALL delete_product(1);
