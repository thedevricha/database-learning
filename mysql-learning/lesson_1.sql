/* MYSQL RDBMS */
/* 1.0 CREATE TABLE*/
CREATE TABLE student (
	student_id INT,
  	name VARCHAR(20),
  	major VARCHAR(20),
  	PRIMARY KEY(student_id)
);

/* 1.1 CREATE CONSTRAINTS -  NOT NULL and UNIQUE*/
CREATE TABLE student (
	student_id INT,
  	name VARCHAR(20) NOT NULL,
  	major VARCHAR(20) UNIQUE,
  	PRIMARY KEY(student_id)
);

/* 1.2 CREATE CONSTRAINTS - DEFAULT */
CREATE TABLE student (
	student_id INT,
  	name VARCHAR(20),
  	major VARCHAR(20) DEFAULT 'undecided',
  	PRIMARY KEY(student_id)
);

/* 1.3 CREATE CONSTRAINTS - AUTO_INCREMENT */
CREATE TABLE student (
	student_id INT AUTO_INCREMENT,
  	name VARCHAR(20),
  	major VARCHAR(20),
  	PRIMARY KEY(student_id)
);

/* 2.0 DESCRIBE */
DESCRIBE student;

/* 3.0 ALTER TABLE - ADD NEW COLUMN */
ALTER TABLE student ADD gpa decimal(3,2);

/* 3.1 ALTER TABLE - REMOVE COLUMN */
ALTER TABLE student DROP COLUMN gpa;

/* 4.1 INSERT */
/* ACCORDING TO 1.0 */
INSERT  INTO student VALUES (1,'Jack', 'Biology');
INSERT  INTO student VALUES (2,'Kate', 'Sociology');
INSERT  INTO student(student_id, name) VALUES (3,'Clair');
INSERT  INTO student VALUES (4,'Jack', 'Biology');
INSERT  INTO student VALUES (5,'Mike', 'Computer Science');

/* ACCORDING TO 1.3 */
INSERT  INTO student(name, major) VALUES ('Jack', 'Biology');
INSERT  INTO student(name, major) VALUES ('Kate', 'Sociology');
INSERT  INTO student(name, major) VALUES ('Clair', 'Chemistry');
INSERT  INTO student(name, major) VALUES ('Jack', 'Biology');
INSERT  INTO student(name, major) VALUES ('Mike', 'Computer Science');

/* 5.0 SELECT */
SELECT * FROM student;
SELECT name, major FROM student;

/* 5.1 SELECT with ORDER BY */
SELECT name, major FROM student ORDER BY name;
SELECT name, major FROM student ORDER BY name DESC;
SELECT * FROM student ORDER BY major, student_id;
SELECT * FROM student ORDER BY major, student_id DESC; 

/* 5.2 SELECT with LIMIT */
SELECT * FROM student LIMIT 2;
SELECT * FROM student ORDER BY student_id DESC LIMIT 2;

/* 5.3 SELECT with WHERE */
SELECT * FROM student WHERE major = 'Biology';
SELECT name, major FROM student WHERE major = 'Biology';
SELECT name, major FROM student WHERE major = 'Biology' OR major = 'Chemistry';
SELECT name, major FROM student WHERE major = 'Biology' OR name = 'Kate';
SELECT name, major FROM student WHERE major <> 'Biology'; /* NOT EQUAL */

/* 5.3 SELECT with IN */
SELECT name, major FROM student WHERE name IN ('Clair', 'Kate', 'Mike');

/* 6.0 DROP TABLE */
DROP TABLE student;

/* 7.0 UPDATE */
UPDATE student SET major = 'Bio' WHERE major = 'Biology';
UPDATE student SET major = 'CS' WHERE student_id = 4;
UPDATE student SET major = 'Biochemistry' WHERE major = 'Bio' OR major = 'Chemistry';
UPDATE student SET name='Tom', major = 'Undecided' WHERE student_id = 1;

/* 8.0 DELETE */
DELETE FROM student WHERE student_id=5;
DELETE FROM student WHERE name='Kate' AND major='Sociology';
DELETE FROM student;

/* RENAME TABLE */
ALTER TABLE student RENAME student_tbl; 