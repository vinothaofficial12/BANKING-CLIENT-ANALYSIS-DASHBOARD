
USE banking_dashboard;

-- ================================
-- 1. CREATE TABLE
-- ================================
CREATE TABLE banking_data (
    CustomerID INT PRIMARY KEY,
    Age INT,
    Gender VARCHAR(10),
    Region VARCHAR(50),
    Balance DECIMAL(10,2),
    Loan VARCHAR(10),
    Date DATE
);

-- ================================
-- 2. INSERT SAMPLE DATA
-- ================================
INSERT INTO banking_data VALUES
(1, 25, 'Male', 'South', 5000.50, 'Yes', '2023-01-10'),
(2, 32, 'Female', 'North', 7000.00, 'No', '2023-02-15'),
(3, 45, 'Male', 'East', 12000.75, 'Yes', '2023-03-20'),
(4, 29, 'Female', 'West', 3000.00, 'No', '2023-04-05'),
(5, 38, 'Male', 'South', 8500.25, 'Yes', '2023-05-12'),
(6, 50, 'Female', 'North', 15000.00, 'No', '2023-06-18'),
(7, 27, 'Male', 'East', 4000.00, 'Yes', '2023-07-22'),
(8, 41, 'Female', 'West', 9500.60, 'No', '2023-08-30');

-- ================================
-- 3. CREATE VIEW FOR DASHBOARD
-- ================================
CREATE VIEW dashboard_view AS
SELECT 
    CustomerID,
    Age,
    Gender,
    Region,
    Balance,
    Loan,
    Date,

    -- Age Group for Bar Chart
    CASE 
        WHEN Age BETWEEN 20 AND 30 THEN '20-30'
        WHEN Age BETWEEN 31 AND 40 THEN '31-40'
        WHEN Age BETWEEN 41 AND 50 THEN '41-50'
        ELSE '51-60'
    END AS Age_Group,

    -- Year for Line Chart
    YEAR(Date) AS Year

FROM banking_data;

-- ================================
-- 4. KPI SUMMARY QUERY (OPTIONAL)
-- ================================
SELECT 
    COUNT(CustomerID) AS Total_Customers,
    SUM(Balance) AS Total_Balance,
    AVG(Balance) AS Avg_Balance,
    SUM(CASE WHEN Loan = 'Yes' THEN 1 ELSE 0 END) AS Loan_Count
FROM banking_data;

-- ================================
-- 5. VIEW DATA (FOR POWER BI)
-- ================================
SELECT * FROM dashboard_view;