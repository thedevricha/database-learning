# Order of Execution

## Full Order of Execution
1. FROM/ JOIN
    - Specifies the tables to retrieve data and how to join them.
2. WHERE
    - Filters rows based on conditions.
3. GROUP BY
    - Group rows share a property so aggregate functions can be applies.
4. HAVING
    - Filters group based on aggregate conditions (used after `GROUP BY`).
5. SELECT
    - Select specific columns to display in the final result.
6. DISTINCT
     Removed duplicate rows from the result set (applies after `SELECT`).
7. ORDER BY
    - Sorts the result set based on specified columns/values.
8. LIMIT/ OFFSET
    - Limit the number if rows returned, often used for pagination.

## Why this order?
- This sequence ensure SQL queries are processed efficiently and logically.
- Data sources and joins aer defined first; filtering happens early to reduce the amount of data processed, grouping and aggregation follow, then specific fields are selected, and finally, the output is ordered and limited.
- This floe reflects the logical processing order necessary to construct the final dataset and optimization principals database use to execute queries efficiently. 