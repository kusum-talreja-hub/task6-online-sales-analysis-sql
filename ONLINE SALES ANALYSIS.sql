USE elevatelabs;
SELECT COUNT(distinct transaction_id)
FROM onlinesales;
SELECT *
FROM onlinesales
WHERE ROUND(units_sold*unit_price, 2) <> ROUND(total_revenue, 2);
#they all match, great.
SET SQL_SAFE_UPDATES = 0;
UPDATE onlinesales
SET date = STR_TO_DATE(date, '%d-%m-%Y');
#total units sold for one month
SELECT SUM(units_sold) AS TotalSalesJan2024
FROM onlinesales
WHERE MONTH(date) = 1; # 1 is for January
#monthly sold units
SELECT
YEAR(date) AS SalesYear,
MONTH(date) AS SalesMonthNumber,
SUM(units_sold) AS TotalMonthlyUnits
FROM onlinesales
GROUP BY SalesYear, SalesMonthNumber
ORDER BY TotalMonthlyUnits DESC;
#monthly revenue
SELECT
YEAR(date) AS SalesYear,
MONTH(date) AS SalesMonthNumber,
ROUND(SUM(total_revenue),2) AS TotalMonthlyRevenue
FROM onlinesales
GROUP BY SalesYear, SalesMonthNumber
ORDER BY TotalMonthlyRevenue DESC;
#total revenue for 1st quarter
SELECT SUM(total_revenue) 
from ONLINESALES 
WHERE MONTH(date) < 5;
#toatl revenue for 2nd quarter
SELECT SUM(total_revenue) 
from ONLINESALES 
WHERE MONTH(date) > 4;
#popular category for 2 quarters
SELECT DISTINCT(category)
FROM onlinesales;
SELECT category, SUM(units_sold) AS total_units
FROM onlinesales
WHERE MONTH(date) < 5
GROUP BY category
ORDER BY total_units DESC;
SELECT category, SUM(units_sold) AS total_units
FROM onlinesales
WHERE MONTH(date) > 4
GROUP BY category
ORDER BY total_units DESC;
#popular product for quarters
SELECT product, SUM(units_sold) AS total_units
FROM onlinesales
WHERE MONTH(date) <5
GROUP BY product
ORDER BY total_units DESC
LIMIT 5;
SELECT product, SUM(units_sold) AS total_units
FROM onlinesales
WHERE MONTH(date) >4
GROUP BY product
ORDER BY total_units DESC
LIMIT 5;




