-- Start Transaction
START TRANSACTION;
-- Drop tables if exists
DROP TABLE IF EXISTS users,books,checkouts;
-- Table users
CREATE TABLE users(
user_id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
name VARCHAR(45) NOT NULL,
email VARCHAR(50) NULL DEFAULT 'N/A'
);

-- Table books
CREATE TABLE books(
book_id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
title VARCHAR(100) NOT NULL,
author VARCHAR(100)
);
-- Table checkouts
CREATE TABLE checkouts(
checkout_id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
user_id INT NOT NULL REFERENCES users(user_id),
book_id INT NOT NULL REFERENCES books(book_id),
checkout_date DATE
);
-- Insert into users
INSERT INTO users (name, email) VALUES
('Alice', 'alice@email.com'),
('Bob', 'bob@email.com');
-- Insert into books
INSERT INTO books (title, author) VALUES
('Harry Potter', 'J.K. Rowling'),
('The Secret', 'Rhonda Byrne');
-- Insert into checkouts
INSERT INTO checkouts (user_id, book_id, checkout_date) VALUES
(1, 1, '2024-01-01'),
(2, 2, '2024-01-05');

COMMIT;
