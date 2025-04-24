/* -- FOR COMMENTS IN QUERY */
SELECT * FROM customers 
	-- WHERE customer_id = 1
    ORDER BY first_name DESC;

/* SELECT CLAUSE */
SELECT first_name, last_name, points, points * 10 + 100 FROM customers; 
SELECT first_name, last_name, points, (points + 10) * 100 FROM customers; /* Parenthesis use with mathematic operation. Order of arithmetic operator execution (), *, /, +, - */
SELECT first_name, last_name, points, (points + 10) * 100 AS discount_factor FROM customers; /* Alias use */

/* DISTINCT */
SELECT DISTINCT(state) FROM `customers`; 

/* EXERCISE */
SELECT name, unit_price, unit_price * 1.1 AS new_price FROM `products`; 

/* COMPARISON OPERATORS (>, >=, <, <=, =, !=, <>) */
SELECT * FROM customers WHERE state = 'VA'; 
SELECT * FROM customers WHERE state != 'VA';
SELECT * FROM customers WHERE state <> 'VA'; 
SELECT * FROM customers WHERE birth_date > '1990-01-01'; 

/* EXERCISE */
SELECT * FROM `orders` WHERE order_date >= '2019-01-01'; 

/* AND, OR, and NOT Operators (Order of operators: AND, OR, NOT)*/
SELECT * FROM `customers` WHERE birth_date >= '1990-01-01' AND points > 1000; 
SELECT * FROM `customers` WHERE birth_date >= '1990-01-01' OR points > 1000; 
SELECT * FROM `customers` WHERE birth_date >= '1990-01-01' OR ( points > 1000 AND state = 'VA'); 
SELECT * FROM `customers` WHERE NOT (birth_date >= '1990-01-01' OR points > 1000); 

/* EXERCISE */
SELECT * FROM `order_items` WHERE order_id = 6 AND unit_price * quantity > 30; 

/* IN Operator */
SELECT * FROM customers WHERE state IN ('VA', 'GA', 'FL'); 
SELECT * FROM customers WHERE state NOT IN ('VA', 'GA', 'FL'); 

/* EXERCISE */
SELECT * FROM `products` WHERE quantity_in_stock IN (49, 38, 72); 

/* BETWEEN Operator */
SELECT * FROM `customers` WHERE points BETWEEN 1000 AND 3000; 

/* EXERCISE */
SELECT * FROM `customers` WHERE birth_date BETWEEN '1990-01-01' AND '2000-01-01'; 

/* LIKE Operator */
SELECT * FROM `customers` WHERE last_name LIKE 'b%'; 
SELECT * FROM `customers` WHERE last_name LIKE 'brush%'; 
SELECT * FROM `customers` WHERE last_name LIKE '%b%'; 
SELECT * FROM `customers` WHERE last_name LIKE '%y'; 
SELECT * FROM `customers` WHERE last_name LIKE '_____y'; 
SELECT * FROM `customers` WHERE last_name LIKE 'b______y'; 

/* EXERCISE */
SELECT * FROM `customers` WHERE (address LIKE '%trail%' OR address LIKE '%avenue%');
SELECT * FROM `customers` WHERE phone LIKE '%9'; 

/* REGEXP Operator */
SELECT * FROM `customers` WHERE last_name REGEXP 'field'; 
SELECT * FROM `customers` WHERE last_name REGEXP '^field'; -- ^ for beginning
SELECT * FROM `customers` WHERE last_name REGEXP 'field$'; -- $ for end
SELECT * FROM `customers` WHERE last_name REGEXP 'field|mac'; -- | for logical or
SELECT * FROM `customers` WHERE last_name REGEXP 'field|mac|rose'; 
SELECT * FROM `customers` WHERE last_name REGEXP '^field|mac|rose'; 
SELECT * FROM `customers` WHERE last_name REGEXP 'field$|mac|rose'; 
SELECT * FROM `customers` WHERE last_name REGEXP '[gim]e';  -- check ge, ie, me 
SELECT * FROM `customers` WHERE last_name REGEXP '[a-h]e'; -- check range 

/* EXERCISE */
SELECT * FROM `customers` WHERE first_name REGEXP 'elka|ambur'; 
SELECT * FROM `customers` WHERE last_name REGEXP 'ey$|on$'; 
SELECT * FROM `customers` WHERE last_name REGEXP '^my|se'; 
SELECT * FROM `customers` WHERE last_name REGEXP 'b[ru]'; 

/* IS NULL Operator */
SELECT * FROM `customers` WHERE phone IS NULL; 
SELECT * FROM `customers` WHERE phone IS NOT NULL; 

/* EXERCISE */
SELECT * FROM `orders` WHERE shipped_date IS NULL; 

/* ORDER BY CLAUSE */
SELECT * FROM `customers` ORDER BY first_name DESC; 
SELECT * FROM `customers` ORDER BY state, first_name; 
SELECT * FROM `customers` ORDER BY state DESC, first_name; 

/* EXERCISE */
SELECT *, quantity*unit_price AS total_price FROM `order_items` WHERE order_id = 2 ORDER BY total_price DESC; 

/* LIMIT CLAUSE */
SELECT * FROM `customers` LIMIT 3; 
SELECT * FROM `customers` LIMIT 6, 3; 

/* EXERCISE */
SELECT * FROM `customers` ORDER BY points DESC LIMIT 3; 

/* INNER JOIN */
SELECT * FROM `orders` JOIN customers ON orders.customer_id = customers.customer_id; 
SELECT order_id, first_name, last_name FROM `orders` JOIN customers ON orders.customer_id = customers.customer_id; 
SELECT order_id, customers.customer_id, first_name, last_name FROM `orders` JOIN customers ON orders.customer_id = customers.customer_id; 
SELECT order_id, C.customer_id, first_name, last_name FROM `orders` O JOIN customers C ON O.customer_id = C.customer_id; 

/* EXERCISE */
SELECT order_id, oi.unit_price, name as product_name FROM `order_items` oi JOIN products p ON oi.product_id = p.product_id; 

/* JOINING ACROSS DATABASE */
SELECT * FROM sql_store.order_items oi JOIN sql_inventory.products p ON oi.product_id = p.product_id; 

/* SELF JOIN */
SELECT e.employee_id, e.first_name, m.first_name AS Manager FROM `employees` e JOIN employees m ON e.reports_to = m.employee_id;  

/* JOIN MULTIPLE TABLES */
SELECT o.order_id, o.order_date, c.first_name, c.last_name, os.name AS status FROM `orders` o JOIN customers c ON o.customer_id = c.customer_id JOIN order_statuses os ON o.status = os.order_status_id; 

/* EXERCISE */
SELECT c.name AS client_name, payment_id, pm.name AS payment_method FROM `payments` p JOIN clients c ON p.client_id=c.client_id JOIN payment_methods pm ON p.payment_method = pm.payment_method_id; 

/* COMPOUND JOIN CONDITION */
SELECT * FROM `order_items` oi JOIN order_item_notes oin ON oi.order_id = oin.order_id AND oi.product_id = oin.product_id; 

/* IMPLICIT JOIN SYNTAX  (NOT RECOMMEND TO USE)*/
SELECT * FROM `orders` o, customers c WHERE o.customer_id = c.customer_id; 

/* OUTER JOIN */
SELECT c.customer_id, c.first_name, o.order_id FROM `customers` c LEFT JOIN orders o ON c.customer_id = o.customer_id ORDER BY c.customer_id;
SELECT c.customer_id, c.first_name, o.order_id FROM `customers` c RIGHT JOIN orders o ON c.customer_id = o.customer_id ORDER BY c.customer_id; 
SELECT c.customer_id, c.first_name, o.order_id FROM orders o RIGHT JOIN `customers` c ON c.customer_id = o.customer_id ORDER BY c.customer_id; 

/* EXERCISE */
SELECT p.product_id, p.name, oi.quantity FROM products p LEFT JOIN order_items oi ON p.product_id = oi.product_id; 

/* OUTER JOIN BETWEEN MULTIPLE TABLES */
SELECT c.customer_id, c.first_name, o.order_id, sh.name AS shippers FROM `customers` c LEFT JOIN orders o ON c.customer_id = o.customer_id LEFT JOIN shippers sh ON o.shipper_id = sh.shipper_id ORDER BY c.customer_id;

/* BEST PRACTICE: AVOID RIGHT JOIN AND USE LEFT JOIN */

/* EXERCISE */
SELECT o.order_date, o.order_id, c.first_name, sh.name AS shippers, os.name AS status FROM orders o JOIN `customers` c ON c.customer_id = o.customer_id LEFT JOIN shippers sh ON o.shipper_id = sh.shipper_id JOIN order_statuses os ON o.status = os.order_status_id ORDER BY o.order_id;

/* SELF OUTER JOIN */
SELECT e.employee_id, e.first_name, m.first_name as manager FROM `employees` e LEFT JOIN employees m ON e.reports_to = m.employee_id;

/* THE USING CLAUSE (FOR SIMPLIFY JOIN STATEMENT, CAN USE IF BOTH TABLES COLUMN NAME ARE SAME) */
SELECT o.order_id, c.first_name, sh.name AS shipper FROM orders o JOIN customers c USING (customer_id) LEFT JOIN shippers sh USING (shipper_id);

/* THE USING CLAUSE WITH COMPOUND JOIN */
SELECT * FROM `order_items` oi JOIN order_item_notes oin USING (order_id, product_id);

/* EXERCISE */
SELECT p.date, c.name AS client, p.amount, pm.name FROM `payments` p JOIN clients c USING (client_id) LEFT JOIN payment_methods pm ON p.payment_method = pm.payment_method_id;

/* NATURAL JOIN (NOT RECOMMENDED = SOMETIMES PRODUCE UNEXPECTED RESULT) */
SELECT o.order_id, c.first_name FROM orders o NATURAL JOIN customers c;

/* CROSS JOIN */
/* EXPLICIT SYNTAX */
SELECT c.first_name AS customer, p.name AS product FROM customers c CROSS JOIN products p ORDER BY c.first_name;

/* IMPLICIT SYNTAX */
SELECT c.first_name AS customer, p.name AS product FROM customers c, products p ORDER BY c.first_name;

/* EXERCISE */
SELECT s.name, p.name AS product_name FROM shippers s CROSS JOIN products p ORDER BY s.name; -- EXPLICIT
SELECT s.name, p.name AS product_name FROM shippers s, products p ORDER BY s.name; -- IMPLICIT

/* UNIONS */
SELECT order_id, order_date, 'Active' AS status FROM `orders` WHERE order_date >= '2019-01-01' UNION SELECT order_id, order_date, 'Archived' AS status FROM `orders` WHERE order_date < '2019-01-01';

/* EXERCISE */
SELECT customer_id, first_name, points, 'Bronze' AS type FROM `customers` WHERE points < 2000 UNION SELECT customer_id, first_name, points, 'Silver' AS type FROM `customers` WHERE points BETWEEN 2000 AND 3000 UNION SELECT customer_id, first_name, points, 'Gold' AS type FROM `customers` WHERE points > 3000 ORDER BY first_name;

/* INSERT HIERARCHICAL ROWS */
INSERT INTO orders (customer_id, order_date, status) VALUES (1, '2019-01-02', 1);
INSERT INTO order_items VALUES (LAST_INSERT_ID(), 1,1,2.95), (LAST_INSERT_ID(), 2,1,3.95);

/* CREATING COPY OF TABLE */
CREATE TABLE orders_archived AS SELECT * FROM orders;
INSERT INTO orders_archived SELECT * FROM orders WHERE order_date < '2019-01-01';

/* EXERCISE */
CREATE TABLE invoices_archived AS
SELECT i.invoice_id,i.number, c.name AS client,i.invoice_total,i.payment_total,i.invoice_date, i.payment_date, i.due_date 
FROM `invoices` i 
JOIN clients c USING (client_id)
WHERE payment_date IS NOT NULL;

/* UPDATE */
UPDATE invoices SET payment_total = 10, payment_date = '2019-03-01' WHERE invoice_id = 1;
UPDATE invoices SET payment_total = invoice_total * 0.5, payment_date = due_date WHERE invoice_id = 1;

/* EXERCISE */
UPDATE customers SET points = points + 50 WHERE birth_date < '1990-01-01';

/* USING SUBQUERIES IN UPDATES */
UPDATE invoices SET payment_total = invoice_total * 0.5, payment_date = due_date WHERE client_id = (SELECT client_id FROM clients WHERE name='Myworks');
UPDATE invoices SET payment_total = invoice_total * 0.5, payment_date = due_date WHERE client_id IN (SELECT client_id FROM clients WHERE state IN ('CA', 'NY'));
