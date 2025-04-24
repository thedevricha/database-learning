/* 
    - Calculate the total earnings per project
    - Calculate a scenario where the hourly rate increased by $5
*/

SELECT 
	project_id,
    SUM(hours_spent * hours_rate) AS project_original_cost,
    SUM(hours_spent * (hours_rate + 5)) AS project_projeted_cost
FROM 
	invoices_fact
GROUP BY 
	project_id