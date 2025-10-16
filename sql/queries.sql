-- International Debt Analysis - Real World Bank Data

-- 1. Top 15 Countries by Total Debt (2023)
SELECT 
    country_name,
    country_code,
    series_name,
    ROUND(year_2023, 2) as debt_2023
FROM international_debt
WHERE year_2023 IS NOT NULL 
    AND country_name NOT LIKE '%income%' 
    AND country_name NOT LIKE '%World%'
    AND series_name LIKE '%total%'
ORDER BY year_2023 DESC
LIMIT 15;

-- 2. Debt Growth by Country (2015 to 2023)
SELECT 
    country_name,
    country_code,
    series_name,
    ROUND(year_2015, 2) as debt_2015,
    ROUND(year_2023, 2) as debt_2023,
    ROUND(year_2023 - year_2015, 2) as absolute_change,
    CASE 
        WHEN year_2015 > 0 THEN ROUND(((year_2023 - year_2015) / year_2015 * 100), 2)
        ELSE 0
    END as percent_change
FROM international_debt
WHERE year_2015 IS NOT NULL 
    AND year_2023 IS NOT NULL
    AND country_name NOT LIKE '%income%' 
    AND country_name NOT LIKE '%World%'
    AND series_name LIKE '%total%'
ORDER BY absolute_change DESC
LIMIT 15;

-- 3. Debt by Series Type (2023)
SELECT 
    series_name,
    COUNT(DISTINCT country_name) as country_count,
    ROUND(SUM(year_2023), 2) as total_debt_2023,
    ROUND(AVG(year_2023), 2) as avg_debt_2023
FROM international_debt
WHERE year_2023 IS NOT NULL 
    AND country_name NOT LIKE '%income%'
    AND country_name NOT LIKE '%World%'
GROUP BY series_name
ORDER BY total_debt_2023 DESC;

-- 4. Average Debt per Country (2023)
SELECT 
    country_name,
    country_code,
    ROUND(AVG(year_2023), 2) as avg_debt_across_series,
    COUNT(*) as debt_series_count
FROM international_debt
WHERE year_2023 IS NOT NULL 
    AND country_name NOT LIKE '%income%'
    AND country_name NOT LIKE '%World%'
GROUP BY country_name, country_code
ORDER BY avg_debt_across_series DESC
LIMIT 20;

-- 5. Global Debt Trend (2015-2023)
SELECT 
    'Global Trend' as metric,
    ROUND(SUM(year_2015), 2) as total_2015,
    ROUND(SUM(year_2018), 2) as total_2018,
    ROUND(SUM(year_2023), 2) as total_2023,
    ROUND(SUM(year_2023) - SUM(year_2015), 2) as change_2015_to_2023
FROM international_debt
WHERE country_name NOT LIKE '%income%'
    AND country_name NOT LIKE '%World%';

-- 6. Top 10 Fastest Growing Debts
SELECT 
    country_name,
    country_code,
    series_name,
    ROUND(year_2015, 2) as debt_2015,
    ROUND(year_2023, 2) as debt_2023,
    ROUND(((year_2023 - year_2015) / year_2015 * 100), 2) as percent_growth
FROM international_debt
WHERE year_2015 IS NOT NULL 
    AND year_2023 IS NOT NULL
    AND year_2015 > 0
    AND country_name NOT LIKE '%income%'
    AND country_name NOT LIKE '%World%'
    AND series_name LIKE '%total%'
ORDER BY percent_growth DESC
LIMIT 10;

-- 7. Countries with Decreasing Debt
SELECT 
    country_name,
    country_code,
    series_name,
    ROUND(year_2015, 2) as debt_2015,
    ROUND(year_2023, 2) as debt_2023,
    ROUND(year_2023 - year_2015, 2) as change
FROM international_debt
WHERE year_2015 IS NOT NULL 
    AND year_2023 IS NOT NULL
    AND year_2023 < year_2015
    AND country_name NOT LIKE '%income%'
    AND country_name NOT LIKE '%World%'
ORDER BY change ASC
LIMIT 10;

-- 8. Statistics Summary (2023)
SELECT 
    COUNT(DISTINCT country_name) as unique_countries,
    COUNT(DISTINCT series_name) as debt_types,
    ROUND(SUM(year_2023), 2) as total_global_debt,
    ROUND(AVG(year_2023), 2) as avg_country_debt,
    ROUND(MIN(year_2023), 2) as min_debt,
    ROUND(MAX(year_2023), 2) as max_debt
FROM international_debt
WHERE year_2023 IS NOT NULL 
    AND country_name NOT LIKE '%income%'
    AND country_name NOT LIKE '%World%';