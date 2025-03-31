-- Highest-recorded infection rate and count for each location.

CREATE VIEW  HighestInfectionRate as

	SELECT location, MAX(total_cases) as HighestInfectionCount, population, 
	MAX(total_cases/population)*100 as HighestInfectionRate
	FROM CovidDeaths
	WHERE total_cases IS NOT NULL
		AND population IS NOT NULL
	GROUP BY population, location
	ORDER BY 4 DESC;

-- Percent of population vaccinated by location and date.

CREATE VIEW PercentPopulationVaccinated as 
	SELECT cd.continent, cd.location, cd.population, cv.new_vaccinations,
	SUM(cv.new_vaccinations) OVER (PARTITION BY cd.location ORDER BY cd.location, cd.date) 
	as RollingPeopleVaccinated
	FROM CovidDeaths as cd
	JOIN CovidVaccinations as cv
		ON cd.location = cv.location
		AND cd.date = cv.date
	WHERE cd.continent IS NOT null;