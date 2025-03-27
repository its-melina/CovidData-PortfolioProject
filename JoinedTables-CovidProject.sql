SELECT cd.continent, cd.location, cd.date, cd.population, cv.new_vaccinations
	FROM CovidDeaths as cd
	JOIN CovidVaccinations as cv
		ON cd.location = cv.location
		AND cd.date = cv.date
	ORDER BY 1, 2, 3; 

-- Getting the rolling number of total vaccinations for each location
-- Then, comparing the proportion of vaccinated people for each population

WITH PopVSVaccinations (continent, location, 
	population, new_vaccinations, RollingPeopleVaccinated) as 
	(
SELECT cd.continent, cd.location, cd.population, cv.new_vaccinations,
	SUM(cv.new_vaccinations) OVER (PARTITION BY cd.location ORDER BY cd.location, cd.date) 
	as RollingPeopleVaccinated
	FROM CovidDeaths as cd
	JOIN CovidVaccinations as cv
		ON cd.location = cv.location
		AND cd.date = cv.date
	WHERE cd.continent IS NOT null
	); 
	