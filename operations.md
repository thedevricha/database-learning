# Operations

## Arithmetic Operations: 
- These operations are used to perform mathematical calculations.
    - `+` **Addition**: Adds two numbers together.
    - `-` **Subtraction**: Subtract the second number from the first.
    - `*` **Multiplication**: Multiplies two numbers.
    - `/` **Division**: Divides the first number by the second.
    - `%` **Module**:Returns the reminder of a division operation.
    
```sql
SELECT 
	activity_id,
    project_company,
    hours_spent,
    hours_rate,
    hours_spent + hours_rate AS costly_task
FROM 
	invoices_fact
ORDER BY costly_task DESC 
```