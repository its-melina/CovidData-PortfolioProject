-- 1. International Total Covid Cases and Deaths

Select SUM(new_cases) as total_cases, SUM(new_deaths) as total_deaths, 
	SUM(CAST(new_deaths as float))/SUM(new_cases)*100 as DeathPercentage
	From CovidDeaths
	where continent is not null 
	order by 1, 2;

-- 2. Total Deaths by Continent 

Select continent, SUM(new_deaths) as total_deaths
	From CovidDeaths 
	where continent is not null
	Group By continent 
	Order By 2 Desc;

-- 3. Highest Infection Rate by Location

Select location, population, MAX(total_cases) as HighestInfectionCount, 
	MAX((total_cases/population))*100 as PercentPopulationInfected
	From CovidDeaths
	Group By location, population
	Order By PercentPopulationInfected Desc;

-- 4. Highest Infection Rate by Location and Date

Select location, date, MAX(total_cases) as HighestInfectionCount,
	MAX(total_cases/population)*100 as PercentPopulationInfected
	From CovidDeaths
	Group By location, population, date
	Order by PercentPopulationInfected asc; 
 
/*
Select location, MAX(total_deaths), MAX(total_deaths/population)*100
	From CovidDeaths
	Group By location 
	Order by 3 Desc;
*/