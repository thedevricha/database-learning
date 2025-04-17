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

/* JOIN */
SELECT branch.branch_name, employee.emp_id, employee.first_name FROM `employee` JOIN branch ON employee.emp_id = branch.mgr_id; /* Include same rows from employee and branch table */
SELECT branch.branch_name, employee.emp_id, employee.first_name FROM `employee` LEFT JOIN branch ON employee.emp_id = branch.mgr_id; /* Include all rows from employee table(Left table) */
SELECT branch.branch_name, employee.emp_id, employee.first_name FROM `employee` RIGHT JOIN branch ON employee.emp_id = branch.mgr_id; /* Include all rows from branch table(Right table) */

/* Nested Queries */
SELECT employee.first_name, employee.last_name 
FROM employee 
WHERE employee.emp_id IN (
    SELECT works_with.emp_id 
    FROM works_with 
    WHERE works_with.total_sales > 30000
);

SELECT client.client_name 
FROM client 
WHERE client.branch_id IN (
    SELECT employee.branch_id 
    FROM employee 
    WHERE employee.emp_id = 102
);

/* ON DELETE */
ALTER TABLE branch ADD CONSTRAINT fk_mgr_id FOREIGN KEY (mgr_id) REFERENCES employee(emp_id) ON DELETE SET NULL; 

/* Trigger */
/* EXAMPLE 1 */
DELIMITER $$

CREATE TRIGGER insert_trigger 
BEFORE INSERT ON employee 
FOR EACH ROW 
BEGIN 
    INSERT INTO trigger_test VALUES('Inserted new employee'); 
END$$

DELIMITER ;

/* EXAMPLE 2 */
DELIMITER $$

CREATE TRIGGER insert_trigger 
BEFORE INSERT ON employee 
FOR EACH ROW 
BEGIN 
    INSERT INTO trigger_test VALUES('NEW.first_name'); 
END$$

DELIMITER ;

/* EXAMPLE 3 */
CREATE TRIGGER insert_trigger_2 
BEFORE INSERT ON employee 
FOR EACH ROW 
BEGIN 
    IF NEW.sex = 'M' THEN 
        INSERT INTO trigger_test VALUES("Inserted male employee"); 
    ELSEIF NEW.sex = 'F' THEN 
        INSERT INTO trigger_test VALUES("Inserted female employee"); 
    ELSE 
        INSERT INTO trigger_test VALUES("Inserted other employee"); 
    END IF; 
END; 

/* DROP TRIGGER */
DROP TRIGGER insert_trigger; 