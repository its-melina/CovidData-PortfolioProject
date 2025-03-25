-- Looking at the Total Cases vs Total Deaths in each country
-- percent_deaths_per_cases: a rolling percent of the total deaths 
-- out of the total cases for an entry; both cumulative.

/*
SELECT location, date, total_cases, total_deaths, 
(CAST(total_deaths AS DECIMAL)/CAST(total_cases AS DECIMAL))*100 
 AS percent_deaths_per_cases
FROM CovidDeaths
WHERE location like '%States%'
ORDER BY 1,2;
*/

-- Finding the highest rate of infection for each location

/*
SELECT location, MAX(total_cases) as HighestInfectionCount, population, 
MAX(total_cases/population)*100 as HighestInfectionRate
FROM CovidDeaths
GROUP BY population, location
ORDER BY 4 DESC;
*/

-- Looking at the highest death count per population

/*
SELECT MAX(total_deaths)/population *100 as ChanceOfDeath, location 
FROM CovidDeaths
WHERE total_deaths IS NOT null
	AND population IS NOT null
	AND continent IS NOT null
GROUP BY location, population 
ORDER BY ChanceOfDeath DESC; 
*/

/*

SELECT location, MAX(total_deaths) as DeathCount
FROM CovidDeaths
WHERE continent is not null
	AND total_deaths is not null
GROUP BY location
ORDER BY DeathCount DESC;

*/

-- Global numbers by date
-- Used the TO_DATE method to change the data type of 'date' temporarily to view data chronollogically.

/*
SELECT TO_DATE(date, 'MM/DD/YYYY') as date2, SUM(new_cases) as GlobalCases,
	SUM(new_deaths) as GlobalDeaths
	FROM CovidDeaths
--WHERE new_cases is not null 
GROUP BY date2
ORDER BY date2 DESC; 
*/

-- Joining Deaths and Vaccinations Tables

/*
ALTER TABLE CovidDeaths
	ALTER COLUMN date TYPE DATE USING TO_DATE(date, 'MM/DD/YYYY');
*/

/*
ALTER TABLE CovidVaccinations
	ALTER COLUMN date TYPE DATE USING TO_DATE(date, 'YYYY-MM-DD');	
*/

SELECT cd.continent, cd.location, cd.date, cd.population, cv.new_vaccinations
	FROM CovidDeaths as cd
	JOIN CovidVaccinations as cv
		ON cd.location = cv.location
		AND cd.date = cv.date
	ORDER BY 1, 2, 3;





