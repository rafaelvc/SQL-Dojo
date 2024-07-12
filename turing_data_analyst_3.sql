-- Consider a table named orders with columns order_id, customer_id, and order_date. 
 -- Write a SQL query to retrieve the customer IDs who placed orders in the month of January 2023 but did not place any orders in February 2023.

CREATE TABLE Orders (
  order_id int,
  customer_id int, 
  order_date date
);

INSERT INTO Orders(order_id, customer_id, order_date) VALUES (1, 1, '2023-01-01');
INSERT INTO Orders(order_id, customer_id, order_date) VALUES (2, 1, '2023-01-02');
INSERT INTO Orders(order_id, customer_id, order_date) VALUES (3, 1, '2023-02-02');

INSERT INTO Orders(order_id, customer_id, order_date) VALUES (4, 2, '2023-01-29');
INSERT INTO Orders(order_id, customer_id, order_date) VALUES (5, 2, '2023-01-10');
INSERT INTO Orders(order_id, customer_id, order_date) VALUES (6, 2, '2023-05-02');
INSERT INTO Orders(order_id, customer_id, order_date) VALUES (5, 2, '2023-03-01');

SELECT DISTINCT o.customer_id
FROM orders o
WHERE o.order_date >= '2023-01-01' and o.order_date <= '2023-01-31'
and o.customer_id not in
(SELECT oo.customer_id FROM orders oo WHERE oo.order_date >= '2023-02-01' and oo.order_date <= '2023-02-28')