/* DATABASE = company_db */

/* CREATE TABLE employee */
CREATE TABLE employee ( 
    emp_id INT PRIMARY KEY, 
    first_name VARCHAR(40), 
    last_name VARCHAR(40), 
    birth_day DATE, 
    sex VARCHAR(1), 
    salary INT, 
    super_id INT, 
    branch_id INT 
); 

/* CREATE TABLE branch */
CREATE TABLE branch ( 
    branch_id INT PRIMARY KEY, 
    branch_name VARCHAR(40), 
    mgr_id INT, 
    mgr_start_date DATE, 
    FOREIGN KEY(mgr_id) REFERENCES employee(emp_id) ON DELETE SET NULL 
); 

/* ALTER TABLE employee - ADD FOREIGN KEY branch_id and branch_id */
ALTER TABLE employee ADD FOREIGN KEY(branch_id) REFERENCES branch(branch_id) ON DELETE SET NULL; 
ALTER TABLE employee ADD FOREIGN KEY(super_id) REFERENCES employee(emp_id) ON DELETE SET NULL; 

/* CREATE TABLE client */
CREATE TABLE client ( 
    client_id INT PRIMARY KEY, 
    client_name VARCHAR(40), 
    branch_id INT, 
    FOREIGN KEY(branch_id) REFERENCES branch(branch_id) ON DELETE SET NULL 
); 

/* CREATE TABLE work_with */
CREATE TABLE work_with ( 
    emp_id INT, 
    client_id INT, 
    total_sales INT, 
    PRIMARY KEY(emp_id, client_id), 
    FOREIGN KEY(emp_id) REFERENCES employee(emp_id) ON DELETE CASCADE, 
    FOREIGN KEY(client_id) REFERENCES client(client_id) ON DELETE CASCADE
); 

/* CREATE TABLE branch_supplier */
CREATE TABLE branch_supplier ( 
    branch_id INT, 
    supplier_name VARCHAR(40), 
    supply_type VARCHAR(40), 
    PRIMARY KEY(branch_id, supplier_name), 
    FOREIGN KEY(branch_id) REFERENCES branch(branch_id) ON DELETE CASCADE 
); 

/* Aggregation using GROUP BY */
SELECT COUNT(sex), sex FROM employee GROUP BY sex;
SELECT SUM(total_sales), emp_id FROM works_with GROUP BY emp_id;

/* Wildcards */
SELECT * FROM `client` WHERE client_name LIKE "%LLC"; /* % = Any number of character */
SELECT * FROM `branch_supplier` WHERE supplier_name LIKE '%Label%';

SELECT * FROM `employee` WHERE birth_day LIKE '____-10%'; /* - = One character */

/* UNION */
/* Rules:
1. Must be same number of column selected 
2. Columns must be have same data types */
SELECT first_name FROM `employee` UNION SELECT branch_name FROM branch;
SELECT first_name FROM `employee` UNION SELECT branch_name FROM branch UNION SELECT client_name FROM client;
SELECT first_name as Company_name FROM `employee` UNION SELECT branch_name FROM branch UNION SELECT client_name FROM client;

