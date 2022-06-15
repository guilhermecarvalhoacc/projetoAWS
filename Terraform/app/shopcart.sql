DROP DATABASE IF EXISTS shopcart;
CREATE DATABASE shopcart;
USE shopcart;

DROP TABLE IF EXISTS Product;
CREATE TABLE Product(
id_product INT AUTO_INCREMENT,
name VARCHAR(50) NOT NULL,
description VARCHAR(500),
brand VARCHAR(50),
price FLOAT NOT NULL,
discount FLOAT,
quantity INT NOT NULL,
url_img VARCHAR(50),
PRIMARY KEY (id_product)
);

DROP TABLE IF EXISTS Cart;
CREATE TABLE Cart(
id_cart INT NOT NULL AUTO_INCREMENT,
id_user INT NOT NULL,
PRIMARY KEY (id_cart)
);

DROP TABLE IF EXISTS CartProduct;
CREATE TABLE CartProduct(
id_cart INT NOT NULL,
id_product INT NOT NULL,
quantity INT NOT NULL,
PRIMARY KEY (id_cart, id_product),
FOREIGN KEY (id_product)
        REFERENCES Product(id_product),
FOREIGN KEY (id_cart)
        REFERENCES Cart(id_cart)
);

