# BASIC KEYWORDS
1. SELECT / FROM
2. LIMIT
3. DISTINCT
4. WHERE
5. -- COMMENTS
6. /**/ MULTILINE COMMENT
7. ORDER BY

## SELECT / FROM
### Select All Columns
```sql
    SELECT * FROM job_postings_fact
```
- `SELECT` - Identifies the columns (or data) from a database
- `FROM` - Identifies the table we are connecting to
- `*` - Special command to select all the column

## LIMIT
```sql
SELECT * FROM job_postings_fact LIMIT 5
```
- `LIMIT` - Query only a certain amount of rows
- **Note**: In real life, we rarely use SELECT all because it takes up a lot of processing power; instead, we would add syntax to `LIMIT` the number of values returned

## DISTINCT
```sql
SELECT DISTINCT job_title_short FROM job_postings_fact
```
- `DISTINCT` - Get unique rows
- This usually isn't used for the entire query.
- Why? It takes up lot of processing power
- Used within certain SQL function

## WHERE 
```sql
SELECT job_title_short, job_location, job_via, salary_year_avg
FROM job_postings_fact
WHERE job_title = 'Data Analyst'
```
- `WHERE` - sets the condition for the query
- Filter out the query

## Comments 
### Single line comment
```sql
SELECT job_title_short, job_location, job_via, salary_year_avg
FROM job_postings_fact
WHERE job_title = 'Data Analyst' -- This filters my job of interest
```
- `--` - A single line comment (most common)
- **Note**: Comments don't run in the query. You can write anything here.
- USE: 
    - Helps make the query more readable
    - Document your query
    - Write short comment, like at the end of your line

### Multi line comment
```sql
/* Purpose:
    Filter job_title_short, job_location, job_via, salary_year_avg for job_title = 'Data Analyst' 
*/
SELECT job_title_short, job_location, job_via, salary_year_avg
FROM job_postings_fact
WHERE job_title = 'Data Analyst'
```
- `/* Multi line comment */` - A multi line comment (The comment goes between `/*` and `*/`)
- **Note**: Comments don't run in the query. You can write anything here.
- USE: 
    - Helps make the query more readable
    - Document your query
    - Write longer comment

## ORDER BY 
### Sort Ascending
```sql
SELECT job_title_short, job_location, job_via, salary_year_avg
FROM job_postings_fact
WHERE job_title = 'Data Analyst'
ORDER BY salary_year_avg
```
- `ORDER BY` - Sort the rows
- Default order ascending (smallest -> largest or A -> Z)
- `NULL` is "smallest" if no values

### Sort Descending
```sql
SELECT job_title_short, job_location, job_via, salary_year_avg
FROM job_postings_fact
WHERE job_title = 'Data Analyst'
ORDER BY salary_year_avg DESC
```
- `ORDER BY column_name DESC` - Sort the rows in Descending order
- largest -> smallest or Z -> A

## Order to write commands 
```sql
SELECT column1, column2, ...
FROM table_name
WHERE condition
GROUP BY column
HAVING condition
ORDER BY column1 [ASC|DESC] ...
LIMIT number;
```
- **Note**: This is separate from how the order of query is executed, but instead the order in it must be written