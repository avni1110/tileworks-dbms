CREATE DATABASE tileworks;
USE tileworks;

-- Create tables
CREATE TABLE brochure (
    Product_Id INT PRIMARY KEY,
    Product_name VARCHAR(20) NOT NULL,
    color VARCHAR(20) NOT NULL,
    price INT NOT NULL
);

CREATE TABLE customer (
    Cust_Id INT PRIMARY KEY,
    Mem_date DATE NOT NULL,
    tenure VARCHAR(20) NOT NULL,
    discount DECIMAL(4,2) NOT NULL
);

CREATE TABLE orders (
    Order_Id INT PRIMARY KEY,
    Cust_Id INT,
    Product_Id INT,
    Qty INT NOT NULL,
    FOREIGN KEY (Cust_Id) REFERENCES customer(Cust_Id),
    FOREIGN KEY (Product_Id) REFERENCES brochure(Product_Id)
);

