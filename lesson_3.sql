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