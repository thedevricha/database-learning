# MANIPULATE TABLES
The following statements are used to manipulate tables:
1. `CREATE TABLE`: Create table from scratch
    ```sql
    CREATE TABLE table_name (
        column_name1 datatype,
        column_name2 datatype,
        ....
    );
    ```
2. `INSERT INTO`:
    - `INSERT INTO`: Used to insert data into a table
    - `VALUES`: Specify the data you want to add
    ```sql
    INSERT INTO table_name ( column_name1, column_name2, ...)
    VALUES (value1, value2, ...);
    ```
3. `ALTER TABLE`: Alter table
    - `ADD`: Add columns
    - `RENAME COLUMN`: Rename columns
    - `ALTER COLUMN`: Change the data type of column
    - `DROP COLUMN`: Delete a column
    ```sql
    ALTER TABLE table_name 
        -- ADD column_name datatype;
        -- RENAME COLUMN column_name TO new_name;
        -- ALTER COLUMN column_name TYPE datatype;
        -- DROP COLUMN column_name;
    ```
4. `UPDATE`: Used to modify existing data in a table.
    - `SET`: Specifies the column to be updated and the new value for that column.
    - `WHERE`: Filters which rows to update based on a condition.
    ```sql
    UPDATE table_name
    SET column_name = 'new_value'
    WHERE condition;
    ```
5. `DROP TABLE`: Delete an existing tables
    - Be **extremely** careful when do this.
    ```sql
    DELETE TABLE table_name;
    ```