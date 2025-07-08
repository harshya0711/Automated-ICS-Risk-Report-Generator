--  1. Basic: Count Failed Controls per Business Function --

SELECT 
    business_function,
    COUNT(*) AS total_failed_controls
FROM control_data
WHERE result = 'Failed'
GROUP BY business_function;

--  2. Intermediate: Failure % and Risk Band Classification --

SELECT 
    business_function,
    COUNT(*) AS total_controls,
    SUM(CASE WHEN result = 'Failed' THEN 1 ELSE 0 END) AS failed_controls,
    ROUND((SUM(CASE WHEN result = 'Failed' THEN 1 ELSE 0 END) / COUNT(*)) * 100, 2) AS failure_rate_pct,
    CASE 
        WHEN (SUM(CASE WHEN result = 'Failed' THEN 1 ELSE 0 END) / COUNT(*)) >= 0.4 THEN 'High Risk'
        WHEN (SUM(CASE WHEN result = 'Failed' THEN 1 ELSE 0 END) >= 0.2) THEN 'Medium Risk'
        ELSE 'Low Risk'
    END AS risk_band
FROM control_data
GROUP BY business_function;

-- 3. List Controls Tested in the Last 30 Days --

SELECT *
FROM control_data
WHERE test_date >= CURDATE() - INTERVAL 30 DAY;

-- 4. Number of Failed Controls by Risk Theme --

SELECT 
    risk_theme,
    COUNT(*) AS failed_count
FROM control_data
WHERE result = 'Failed'
GROUP BY risk_theme;

-- 5. Calculate Failure Rate per Business Function --

SELECT 
    business_function,
    COUNT(*) AS total_controls,
    SUM(CASE WHEN result = 'Failed' THEN 1 ELSE 0 END) AS failed_controls,
    ROUND(SUM(CASE WHEN result = 'Failed' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS failure_rate_pct
FROM control_data
GROUP BY business_function;

-- 6. 7. Top 3 Business Functions with Most Failures --

SELECT 
    business_function,
    COUNT(*) AS failed_controls
FROM control_data
WHERE result = 'Failed'
GROUP BY business_function
ORDER BY failed_controls DESC
LIMIT 3;

-- 7. Weekly Breakdown of Control Failures --

SELECT 
    WEEK(test_date) AS test_week,
    COUNT(*) AS failed_count
FROM control_data
WHERE result = 'Failed'
GROUP BY WEEK(test_date)
ORDER BY test_week;

-- 8. Open QA Issues by Severity -- 

SELECT 
    severity,
    COUNT(*) AS open_issues
FROM qa_issues
WHERE resolved = FALSE
GROUP BY severity;


-- 9. Controls with More Than One QA Issue --

SELECT 
    cd.control_id,
    cd.control_name,
    COUNT(q.issue_id) AS total_issues
FROM control_data cd
JOIN qa_issues q ON cd.control_id = q.control_id
GROUP BY cd.control_id, cd.control_name
HAVING COUNT(q.issue_id) > 1;

-- Business Functions with No Failures -- 

SELECT 
    business_function
FROM control_data
GROUP BY business_function
HAVING SUM(CASE WHEN result = 'Failed' THEN 1 ELSE 0 END) = 0;
