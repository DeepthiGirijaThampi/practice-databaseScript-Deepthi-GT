-- Start Transaction
START TRANSACTION;
-- Drop tables if exists
DROP TABLE IF EXISTS restaurants,customer,orders,royalty,menu,inventory;
-- Table restaurants
CREATE TABLE restaurants (
restaurant_id INT PRIMARY KEY AUTO_INCREMENT,
name VARCHAR(100) NOT NULL,
address VARCHAR(200),
phone_number VARCHAR(20)
);

-- Table customer
CREATE TABLE customer(
phone_number INT PRIMARY KEY NOT NULL,
name VARCHAR(100) NOT NULL,
email VARCHAR(100)
);
-- Table royalty
CREATE TABLE royalty(
royalty_id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
customer_id INT REFERENCES customer(phone_number),
category VARCHAR(15),
points_left int
);
-- Table orders
CREATE TABLE orders (
order_id INT PRIMARY KEY AUTO_INCREMENT,
customer_id INT NOT NULL REFERENCES customer(phone_number),
restaurant_id INT NOT NULL REFERENCES restaurants(restaurant_id),
order_date VARCHAR(20)
);
-- Table menu
CREATE TABLE menu (
menu_id INT PRIMARY KEY AUTO_INCREMENT,
restaurant_id INT NOT NULL,
name VARCHAR(20),
FOREIGN KEY (restaurant_id) REFERENCES restaurants(restaurant_id)
);
-- Table inventory
CREATE TABLE inventory(
inventory_id INT PRIMARY KEY AUTO_INCREMENT,
item_name VARCHAR(28),
stock INT,
unit VARCHAR(5)
);

ROLLBACK;
-- COMMIT;
