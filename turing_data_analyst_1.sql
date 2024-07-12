-- Suppose you have a table named sales with columns product_id, date, and revenue. Write a SQL query to retrieve the total revenue for each product for the year 2022.

-- INIT database
CREATE TABLE Sales (
  product_id int,
  date_rev date,
  revenue decimal(5,2)
);

INSERT INTO Sales(product_id, date_rev, revenue) VALUES (1, '2022-02-01', 10.30);
INSERT INTO Sales(product_id, date_rev, revenue) VALUES (1, '2022-02-02', 10.50);
INSERT INTO Sales(product_id, date_rev, revenue) VALUES (1, '2023-02-02', 10.50);
INSERT INTO Sales(product_id, date_rev, revenue) VALUES (2, '2022-02-02', 30);
INSERT INTO Sales(product_id, date_rev, revenue) VALUES (2, '2022-02-02', 30);
INSERT INTO Sales(product_id, date_rev, revenue) VALUES (2, '2022-12-31', 5.5);
INSERT INTO Sales(product_id, date_rev, revenue) VALUES (2, '2023-12-31', 5.5);

-- QUERY database
SELECT product_id, SUM(revenue) as total FROM Sales WHERE date_rev >= '2022-01-01' and date_rev <= '2022-12-31' GROUP BY product_id


-- It was correct. I missed the product_id column.