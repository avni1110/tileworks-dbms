-- Insert sample records into brochure
INSERT INTO brochure VALUES (1, 'Mahogany', 'Brown', 100);
INSERT INTO brochure VALUES (2, 'New Country', 'Black', 110);
INSERT INTO brochure VALUES (3, 'Castle Oak', 'Fawn', 95);
INSERT INTO brochure VALUES (4, 'Cross Line', 'Grey', 120);
INSERT INTO brochure VALUES (5, 'Light Maple', 'White', 90);

-- Insert sample records into customer
INSERT INTO customer VALUES (101, '2014-06-10', '15 Years', 10);
INSERT INTO customer VALUES (102, '2016-04-02', '12 Years', 8);
INSERT INTO customer VALUES (103, '2018-03-20', '10 Years', 5);

-- Insert sample orders
INSERT INTO orders VALUES (1, 101, 2, 25);
INSERT INTO orders VALUES (2, 101, 4, 30);
INSERT INTO orders VALUES (3, 102, 1, 20);
INSERT INTO orders VALUES (4, 102, 3, 35);

-- Update brochure example
UPDATE brochure
SET Product_name = 'Castle Oak', color = 'Fawn', price = 105
WHERE Product_Id = 3;

-- Delete brochure example
DELETE FROM brochure WHERE Product_Id = 5;

-- Update customer example
UPDATE customer
SET Mem_date = '2014-06-10', tenure = '15 Years', discount = 12
WHERE Cust_Id = 101;

-- Delete customer example
DELETE FROM customer WHERE Cust_Id = 103;

-- Update orders example
UPDATE orders
SET Product_Id = 3, Qty = 35
WHERE Order_Id = 4;

-- Delete orders example
DELETE FROM orders WHERE Order_Id = 3;