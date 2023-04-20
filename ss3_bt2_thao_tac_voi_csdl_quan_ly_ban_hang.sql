USE order_management;
INSERT INTO customers
VALUES (1,'Minh Quan',19),
	   (2,"Ngoc Anh",20),
	   (3,"Hong Ha",30);
SELECT * FROM customers;
INSERT INTO orders (order_id, customer_id, order_date, order_total_price )
VALUES (1,1,"2006-03-21",12),
	(2,2,"2006-03-23",11),
	(3,1,"2006-03-16",10);
INSERT INTO products (product_id, product_name, product_price)
VALUES (1,"May Giat", 3),
	(2,"Tu Lanh", 5),
	(3,"Dieu Hoa", 7),
	(4,"Quat", 1),
	(5,"Bep Dien", 2);
INSERT INTO order_detail (order_id,product_id,order_detail_quantity)
VALUES (1,1,3),
(1,3,7),
(1,4,2),
(2,1,1),
(3,1,8),
(2,5,4),
(2,3,3);
-- Hiển thị các thông tin  gồm oID, oDate, oPrice của tất cả các hóa đơn trong bảng Order
SELECT 
    order_id, order_date, order_total_price
FROM
    orders;
-- Hiển thị danh sách các khách hàng đã mua hàng, và danh sách sản phẩm được mua bởi các khách
SELECT 
    customers.customer_id,
    customers.customer_name,
    products.product_id,
    products.product_name
FROM
    customers
        INNER JOIN
    orders ON customers.customer_id = orders.customer_id
        INNER JOIN
    order_detail ON orders.order_id = order_detail.order_id
        INNER JOIN
    products ON order_detail.product_id = products.product_id;
-- Hiển thị tên những khách hàng không mua bất kỳ một sản phẩm nào
SELECT 
    customers.customer_name
FROM
    customers
        LEFT JOIN
    orders ON customers.customer_id = orders.customer_id
WHERE
    orders.order_id IS NULL;
-- Hiển thị mã hóa đơn, ngày bán và giá tiền của từng hóa đơn (giá một hóa đơn được tính bằng tổng giá bán của 
-- từng loại mặt hàng xuất hiện trong hóa đơn. Giá bán của từng loại được tính = odQTY*pPrice)
SELECT 
    orders.order_id,
    orders.order_date,
    SUM(products.product_price * order_detail.order_detail_quantity) AS total_price
FROM
    orders
        INNER JOIN
    order_detail ON orders.order_id = order_detail.order_id
        INNER JOIN
    products ON order_detail.product_id = products.product_id
GROUP BY orders.order_id;
