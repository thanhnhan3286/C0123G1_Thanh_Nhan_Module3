CREATE DATABASE gaming_lap;
USE gaming_lap;
-- DROP DATABASE gaming_lap;
CREATE TABLE product
(
    id          VARCHAR(7) PRIMARY KEY,
    name        VARCHAR(250) NOT NULL,
    description VARCHAR(1000),
    price       DOUBLE DEFAULT 0,
    brand       VARCHAR(250),
    image       VARCHAR(1000)
);
INSERT INTO product
VALUES ('LA-0001', 'ASUS ROG Zephyrus G14', '2.8GHz AMD Ryzen 7 5800HS octa-core processor (turbo up to 4.4GHz) and 16GB of DDR4 RAM is equipped to handle your most resource-intensive games with ease
512GB M.2 NVMe PCIe 3.0 solid state drive (SSD) gives you plenty reliable storage space with speedy load times
NVIDIA GeForce GTX 1650 graphics card with 4GB of dedicated memory presents every image or scene in smooth, lifelike clarity
ROG Intelligent Cooling System features self-cleaning, anti-dust tunnels to maintain cooling power and stability
14" Pantone-validated, Full HD (1920 x 1080) display with a 60Hz refresh rate, 16:9 aspect ratio and 300nits brightness delivers breathtaking visuals with true-to-life detail
', 1000,
        'ASUS',
        'https://encrypted-tbn3.gstatic.com/shopping?q=tbn:ANd9GcRmBEjKDwvDa8OHoHcXG6NKD9NQEEByfjjctLkvDqU6YKI7StJe7GtXqeoQ4Y0cwJIVmW7uFeChRJHF6mF9o_xSeNd1X-h6mbvL36cm3FHmbT1Mf38A6S4Y5A&usqp=CAE'),
       ('LA-0002', 'Acer Nitro R7 15.6" Gaming Laptop - Black', '3.2GHz AMD Ryzen R76800H CPU and 16GB DDR5 RAM are powerful enough for heavy AAA games, image editing, video rendering, and a multitude of tasks
1TB solid state drive provides reliable storage, and speeds up game loading times, data transfers, boot up and more
Dedicated NVIDIA RTX 3070 Ti GPU outputs ultra-realistic ray-traced visuals and immersive graphics in your games
15.6-inch IPS LED-backlit display with 2560 x 1440 native resolution, 165Hz refresh rate, and 3ms overdrive response time give you fluid gameplay with eye-catching visuals',
        1399, 'Acer',
        'https://encrypted-tbn2.gstatic.com/shopping?q=tbn:ANd9GcRQLXdApkF26DbcdjCqAK8TX1rw56_PtAHvjPoX5NrK4xMyCPIOaK90opq7qwgLF56MDL_jnC2QirrDdU0FF6SMpNfZjKExRHdvPLUDEJ6RiNPVvAtAXrJakg&usqp=CAE'),
       ('LA-0003', 'MSI Cyborg 15 15.6" Gaming Laptop -Translucent Black', '1.7GHz Intel Core i7-12650H processor and 16GB DDR5 RAM provide accelerated performance in games, video rendering workloads, multi-tasking, and more
512GB NVMe PCIe solid state drive is quick and agile, which makes Windows boot faster, reduces game loading times, and improves overall system performance
8GB NVIDIA GeForce RTX 4060 discrete GPU lets you max out the graphics settings in your favourite games
15.6" FHD IPS display with 1920 x 1080 native resolution delivers outstanding picture clarity with fluid 144Hz motion in competitive E-sport games and thrilling action movies',
        1600, 'MSI', 'https://pisces.bbystatic.com/image2/BestBuy_US/images/products/6532/6532164_sd.jpg'),
       ('LA-0004', 'Alienware m18 Gaming Laptop', 'Processor
AMD Ryzen™ 7 7745HX (40MB Cache, 8-cores, 16 threads, up to 5.1 GHz Max Boost)

Operating System
(Dell Technologies recommends Windows 11 Pro for business)
Windows 11 Home, English, French, Spanish

Graphics Card
NVIDIA® GeForce RTX™ 4060, 8 GB GDDR6

Display
18" QHD+ (2560 x 1600) 165Hz, 3ms, ComfortView Plus, 100% DCI-P3, FHD IR Camera', 2099, 'Dell',
        'https://i.dell.com/is/image/DellContent/content/dam/ss2/product-images/dell-client-products/notebooks/alienware-notebooks/alienware-m18-amd/media-gallery/amd-hd-perkey-display-port-black/notebook-alienware-m18-amd-hd-perkey-display-port-black-gallery-2.psd?fmt=png-alpha&pscan=auto&scl=1&hei=402&wid=522&qlt=100,1&resMode=sharp2&size=522,402&chrss=full'),
    ('LA-0005','Alienware x17 R2 Gaming Laptop','Processor
12th Gen Intel® Core™ i7-12700H (24 MB cache, 14 cores, 20 threads, up to 4.70 GHz Turbo)

Operating System
(Dell Technologies recommends Windows 11 Pro for business)
Windows 11 Home, English

Graphics Card
NVIDIA® GeForce RTX™ 3060, 6 GB GDDR6

Display
17.3", FHD 1920x1080, 360Hz, Non-Touch, 1ms, Advanced Optimus, ComfortView Plus, NVIDIA G-SYNC',2599,'Dell','https://i.dell.com/is/image/DellContent/content/dam/ss2/product-images/dell-client-products/notebooks/alienware-notebooks/alienware-x17-r2/media-gallery/laptop-alienware-x17-r2-nonlit-touchpad-gallery-6.psd?fmt=png-alpha&pscan=auto&scl=1&hei=402&wid=402&qlt=100,1&resMode=sharp2&size=402,402&chrss=full'),
    ('LA-0006','Razer Blade 18 - QHD+ 240 Hz - GeForce RTX 4090 - Black','13th Gen Intel Core i9 Processor (24-core) i9-13980HX, 1.8GHz with Turbo Boost up to 5.6GHz, with 24MB of Cache
Windows 11 Home
18" QHD+ 240 Hz, 16:10 (2560 x 1600)
NVIDIA® GeForce RTX™ 4090 (16GB GDDR6 VRAM)
2 TB SSD (M.2 NVMe PCIe 4.0 x4)',6799,'Razer',
'https://assets3.razerzone.com/AntVEUD0FuFfpYqgp_T2TTx_Ow8=/1500x1000/https%3A%2F%2Fhybrismediaprod.blob.core.windows.net%2Fsys-master-phoenix-images-container%2Fhfd%2Fh76%2F9472706674718%2Fblade18-k9-1500x1000-2.jpg');
-- select * FROM product;

CREATE TABLE customer(
id INT PRIMARY KEY AUTO_INCREMENT,
`name` VARCHAR(50)NOT NULL,
phone VARCHAR(10) NOT NULL UNIQUE,
address VARCHAR(50) NOT NULL,
email VARCHAR(50) NOT NULL UNIQUE);
INSERT INTO customer VALUES (1,'Trương Quốc Hoà','0986772765','Sơn Trà,Đằ Nẵng','uthoa@gmail.com'),
							(2,'Huỳnh Đức Định','0522271070','Đại Lộc, Quảng Nam','heeyeon@gmail.com'),
							(3,'Nguyễn Thành Nhân','0989725222','Huế','nhan@gmail.com'),
							(4,'Nguyễn Thành Đức','0598257772','Sài Gòn','duc@gmail.com'),
							(5,'Hồ Viễn','0986772772','Huế','vien@gmail.com'),
							(6,'Nguyễn Đức Thắng','0523399989','Hà Nội','thang@gmail.com'),
							(7,'Kiều Quốc Khánh','0977553221','Đại Hiệp, Quảng Nam','dinh@gmail.com'),
							(8,'Trần Đức Định','0977311331','Phú Yên','ducdinh@gmail.com'),
							(9,'Trần Thị Yến Nhi','0989222444','Khánh Hoà','nhi@gmail.com'),
							(10,'Phan Thị Thuỷ Tiên','0988555777','Đại Lộc, Quảng Nam','tien@gmail.com'),
							(11,'Nguyễn Trần Ngọc Duyên','0989567321','Duy Xuyên, Quảng Nam','duyen@gmail.com');

                        CREATE TABLE login(
                        id INT NOT NULL,
                        FOREIGN KEY (id) REFERENCES customer(id),
                        `user` VARCHAR(50) UNIQUE ,
                        pass VARCHAR (50) NOT NULL);
                        INSERT INTO login VALUES (1,'uthoa@gmail.com','123456'),
												(2,'heeyeon@gmail.com','123456'),
												(3,'nhan@gmail.com','123456'),
												(4,'duc@gmail.com','123456'),
												(5,'vien@gmail.com','123456'),
                                                (6,'thang@gmail.com','123456'),
												(7,'dinh@gmail.com','123456'),
												(8,'khanh@gmail.com','123456'),
												(9,'you@gmail.com','123456'),
												(10,'love@gmail.com','123456'),
												(11,'duyen@gmail.com','123456');
                                                
                                                

CREATE TABLE `order` (
    id INT PRIMARY KEY AUTO_INCREMENT,
    order_date DATE NOT NULL,
    id_customer INT,
    FOREIGN KEY (id_customer)
        REFERENCES customer (id),
    id_product VARCHAR(7),
    FOREIGN KEY (id_product)
        REFERENCES product (id),
    total_price DOUBLE NOT NULL CHECK (total_price > 0)
);

INSERT INTO `order` VALUES (1,'2022-05-12',1,'LA-0001',1000);
INSERT INTO `order` VALUES (2,'2022-06-12',4,'LA-0002',1399);
INSERT INTO `order` VALUES (3,'2022-08-12',2,'LA-0002',1399);
INSERT INTO `order` VALUES (4,'2022-02-19',3,'LA-0004',2099);
INSERT INTO `order` VALUES (5,'2022-10-22',1,'LA-0006',6799);
INSERT INTO `order` VALUES (6,'2022-12-21',2,'LA-0005',2599);
SELECT * FROM `order`;
SELECT * FROM `order` AS o
LEFT JOIN customer AS c ON o.id_customer = c.id;