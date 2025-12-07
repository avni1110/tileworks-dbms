-- Show brochure
SELECT * FROM brochure ORDER BY Product_Id;

-- Show customers
SELECT * FROM customer ORDER BY Cust_Id;

-- Show orders
SELECT * FROM orders ORDER BY Order_Id;

-- Calculate bill for a customer (example for order_id = 1,2)
SELECT B.Product_name,
       O.Qty * B.price - (C.discount/100) * (O.Qty * B.price) AS amount
FROM brochure B
JOIN orders O ON B.Product_Id = O.Product_Id
JOIN customer C ON O.Cust_Id = C.Cust_Id
WHERE O.Order_Id IN (1,2);

-- Sales per product
SELECT O.Product_Id,
       B.Product_name,
       B.color,
       SUM(O.Qty) AS total_qty,
       B.price,
       SUM(O.Qty * B.price - (C.discount/100) * (O.Qty * B.price)) AS amount
FROM brochure B
JOIN orders O ON B.Product_Id = O.Product_Id
JOIN customer C ON O.Cust_Id = C.Cust_Id
GROUP BY O.Product_Id
ORDER BY O.Product_Id;