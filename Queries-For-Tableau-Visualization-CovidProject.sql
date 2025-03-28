-- 1. International Total Covid Cases and Deaths

Select SUM(new_cases) as total_cases, SUM(new_deaths) as total_deaths, 
	SUM(CAST(new_deaths as float))/SUM(new_cases)*100 as DeathPercentage
	From CovidDeaths
	where continent is not null 
	order by 1, 2;

-- 2. Total Deaths by Continent 

Select continent, SUM(new_deaths) as total_cases
	From CovidDeaths 
	where continent is not null
	Group By continent 
	Order By 2 Desc;

-- 3. Highest Death Percentage by Location

Select location, MAX(total_deaths), MAX(total_deaths/population)
	From CovidDeaths
	Group By location
	Order by 3, 1;