
-- Using CTE

-- Getting the rolling number of total vaccinations for each location
-- Then, comparing the proportion of vaccinated people for each population
-- Using WITH clause

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


-- Using a temp table instead of WITH

DROP TABLE IF EXISTS VaccinesVsPop

CREATE TEMPORARY TABLE VaccinesVsPop (
	continent TEXT,
	"location" TEXT,
	population INT,
	new_vaccinations FLOAT,
	RollingPeopleVaccinated FLOAT,
	PercentVaccinated FLOAT
);

INSERT INTO VaccinesVsPop (continent, "location", population, 
		new_vaccinations, RollingPeopleVaccinated)
		
	SELECT cd.continent, cd.location, cd.population, cv.new_vaccinations,
	SUM(cv.new_vaccinations) OVER (PARTITION BY cd.location ORDER BY cd.location, cd.date) 
	as RollingPeopleVaccinated
	--(RollingPeopleVaccinated/population)*100 as PercentVaccinated
	FROM CovidDeaths as cd
	JOIN CovidVaccinations as cv
		ON cd.location = cv.location
		AND cd.date = cv.date
	WHERE cd.continent IS NOT null;

SELECT *, (RollingPeopleVaccinated/population)*100 as PercentVaccinated
FROM VaccinesVsPop;

 