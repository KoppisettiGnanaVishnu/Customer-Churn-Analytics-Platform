-- ===========================================
-- Query 1: Overall Churn Rate
-- Objective: Calculate the percentage of customers who have churned.
-- ===========================================

SELECT
    COUNT(*) AS Total_Customers,
    SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) AS Churned_Customers,
    ROUND(
        (SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) * 100.0) / COUNT(*),
        2
    ) AS Churn_Rate_Percentage
FROM customer_churn;


-- ===========================================
-- Query 2: Churn Rate by Contract Type
-- Objective: Identify which contract type has
-- the highest customer churn.
-- ===========================================

SELECT
    Contract,
    COUNT(*) AS Total_Customers,
    SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) AS Churned_Customers,
    ROUND(
        SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*),
        2
    ) AS Churn_Rate
FROM customer_churn
GROUP BY Contract
ORDER BY Churn_Rate DESC;