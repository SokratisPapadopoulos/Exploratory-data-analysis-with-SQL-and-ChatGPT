-- 1. Count the number of records in the dataset:
SELECT COUNT(*) 
FROM Child_Mortality;

-- 2. Retrieve the first 10 records in the dataset:
SELECT TOP 10 *
FROM Child_Mortality;

-- 3. Retrieve the records for a specific country (e.g. Turkey):
SELECT * 
FROM Child_Mortality 
WHERE Entity = 'Turkey';

-- 4. Retrieve the records for a specific year (e.g. 2002):
SELECT * 
FROM Child_Mortality 
WHERE Year = 2002;

-- 5. Retrieve the highest number of child deaths and the corresponding country and year:
SELECT TOP 1 Entity, Year, MAX(Child_deaths) AS Max_child_deaths
FROM Child_Mortality
WHERE Entity != 'World'
GROUP BY Entity, Year
ORDER BY MAX(Child_deaths) DESC;

-- 6. Calculate the average number of child deaths across all countries and years:
SELECT ROUND(AVG(Child_deaths),0) AS Avg_child_deaths
FROM Child_Mortality;

-- 7. Calculate the total number of child deaths for each country:
SELECT Entity, SUM(Child_deaths) AS Total_child_deaths
FROM Child_Mortality 
GROUP BY Entity;

-- 8. Calculate the average number of child deaths for each country:
SELECT Entity, ROUND(AVG(Child_deaths),0) AS Avg_child_deaths
FROM Child_Mortality 
GROUP BY Entity;

-- 9. Retrieve the countries with the highest and lowest average number of child deaths per year:
SELECT TOP 1 Entity, ROUND(AVG(Child_deaths),0) AS Avg_child_deaths
FROM Child_Mortality
WHERE Entity != 'World'
GROUP BY Entity 
ORDER BY AVG(Child_deaths) DESC; -- Country with the highest

SELECT TOP 1 Entity, ROUND(AVG(Child_deaths),0) AS Avg_child_deaths
FROM Child_Mortality
WHERE Entity != 'World'
GROUP BY Entity 
ORDER BY AVG(Child_deaths) ASC; -- Country with the lowest

-- 10. Count the number of unique countries in the dataset:
SELECT COUNT(DISTINCT Entity) AS num_countries
FROM Child_Mortality;

-- 11. Calculate the total number of child deaths across all countries and years:
SELECT SUM(Child_deaths) AS total_deaths
FROM Child_Mortality;

-- 12. Identify the top 10 countries with the highest child mortality rates in 2012:
SELECT TOP 10 Entity, Child_deaths AS deaths_2012
FROM Child_Mortality
WHERE Year = 2012 AND Entity != 'World'
ORDER BY Child_deaths DESC;

-- 13. Calculate the percentage change in child mortality rates for each country between 1952 and 2012:
SELECT c1.Entity, 
	   c1.Child_deaths AS child_deaths_1952, 
	   c2.Child_deaths AS child_deaths_2012, 
	 ROUND(((c2.Child_deaths - c1.Child_deaths) / c1.Child_deaths),4) * 100 AS pct_change
FROM Child_Mortality c1
JOIN Child_Mortality c2 ON c1.Entity=c2.Entity
WHERE c1.Year = 1952 AND c2.Year = 2012;


-- 14. Identify the country with the biggest difference in child mortality rates between 1952 and 2012:
SELECT TOP 1 c1.Entity, 
	   c1.Child_deaths AS child_deaths_1952, 
	   c2.Child_deaths AS child_deaths_2012, 
	 ROUND(((c2.Child_deaths - c1.Child_deaths) / c1.Child_deaths),4) * 100 AS pct_change
FROM Child_Mortality c1
JOIN Child_Mortality c2 ON c1.Entity=c2.Entity
WHERE c1.Year = 1952 AND c2.Year = 2012
ORDER BY pct_change DESC;
