-- Show Databases
\l

-- Create Database
CREATE DATABASE theeasylearn;

-- Connect to Database
\c theeasylearn;

-- Create Table (Person)
CREATE TABLE person (
    id SERIAL PRIMARY KEY,
    name VARCHAR(32) NOT NULL,
    surname VARCHAR(32) NOT NULL,
    email VARCHAR(128) UNIQUE NOT NULL,
    mobile BIGINT NOT NULL,
    gender CHAR(1) DEFAULT 'm',
    birthdate DATE
);

-- Create Table (Admin)
CREATE TABLE admin (
    id SERIAL PRIMARY KEY,
    email VARCHAR(128) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL,
    created_at DATE,
    accessed_at TIMESTAMP
);

-- Insert Into Table
INSERT INTO admin (email, password, created_at, accessed_at) 
VALUES ('ankit@gmail.com', '123123', '2022-10-22', CURRENT_TIMESTAMP);

INSERT INTO person (name, surname, email, mobile) 
VALUES ('kartik', 'updhayay', 'kartik@gmail.com', 1472583690);

INSERT INTO person (name, surname, email, mobile) 
VALUES ('mohan', 'patel', 'mohan@gmail.com', 1258789541);

INSERT INTO admin (email, password, accessed_at) 
VALUES ('star@gmail.com', 'star', '2022-10-10');

-- Delete From Table
DELETE FROM admin WHERE email='star@gmail.com';

DELETE FROM person WHERE id=4;

DELETE FROM person WHERE id>=100;

DELETE FROM person;

-- Update Existing Rows
UPDATE customers 
SET customername='Ankit', contactlastname='patel', creditlimit=9999999 
WHERE customernumber=103;

UPDATE customers 
SET creditlimit=creditlimit+5;

UPDATE customers 
SET creditlimit=creditlimit-5 
WHERE customernumber<=110;

UPDATE payments 
SET amount=amount+1 
WHERE paymentdate>='2003-01-01' AND paymentdate<='2003-12-31';

-- Fetch and Display Rows
SELECT * FROM customers;

SELECT customerNumber, customerName, city, state, country FROM customers;

SELECT * FROM customers LIMIT 10 OFFSET 0;

SELECT * FROM customers ORDER BY customerName;

SELECT customerNumber, customerName, city, state, country 
FROM customers 
ORDER BY country, state, city;

-- Aggregate Functions
SELECT SUM(amount) FROM payments;

SELECT MIN(amount) FROM payments;

SELECT MAX(amount) FROM payments;

SELECT AVG(amount) FROM payments;

SELECT COUNT(*) FROM customers;

SELECT COUNT(*) FROM customers WHERE country='USA';

SELECT country, COUNT(*) FROM customers GROUP BY country;

SELECT country, COUNT(*) FROM customers GROUP BY country ORDER BY COUNT(*) DESC;

SELECT country, COUNT(*) FROM customers GROUP BY country HAVING COUNT(*) > 10;

-- Join Operation
SELECT p.*
FROM payments AS p;

SELECT customerName, city, state, country
FROM customers AS c;

SELECT p.*, customerName, city, state, country
FROM payments AS p
JOIN customers AS c ON p.customerNumber = c.customerNumber;

SELECT customerName, city, state, country, p.*
FROM payments AS p
JOIN customers AS c ON p.customerNumber = c.customerNumber
WHERE amount > 15000
ORDER BY amount DESC;

-- Display customerNumber, customerName along with order count
SELECT customerNumber, customerName
FROM customers;

SELECT COUNT(*), customerNumber
FROM orders
GROUP BY customerNumber;

SELECT c.customerNumber, c.customerName, COUNT(*)
FROM customers AS c
JOIN orders AS o ON c.customerNumber = o.customerNumber
GROUP BY c.customerNumber;

