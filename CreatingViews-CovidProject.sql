CREATE VIEW  HighestInfectionRate as

	SELECT location, MAX(total_cases) as HighestInfectionCount, population, 
	MAX(total_cases/population)*100 as HighestInfectionRate
	FROM CovidDeaths
	WHERE total_cases IS NOT NULL
		AND population IS NOT NULL
	GROUP BY population, location
	ORDER BY 4 DESC;