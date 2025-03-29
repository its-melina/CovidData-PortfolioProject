Covid Data Portfolio Project

This project analyzes world data about Covid-19 deaths and vaccinations from 2020-2021. 



Tools and skills used:
  - SQL, PostgreSQL, Tableau, Excel
  - Data cleaning, EDA, Merging, Data Validation, Visualizations (time series, geographic, bar charts)



Data Sources
* Covid Deaths 
  https://ourworldindata.org/covid-deaths

* Covid Vaccinations
  https://ourworldindata.org/covid-vaccinations



Files
* CovidDeaths.csv
    - This file contains international data on covid cases and deaths
    - Granularity: each row represents a location and a specific date
      
* CovidVaccinations.csv
  - This file contains international data on covid cases and vaccinations
  - Granularity: each row represents a location and a specific date
    
* EDA-CovidDeaths.sql
  - Initial exxploration of the CovidDeaths.csv dataset
    
* JoinedTables-CovidProject.sql
  - Joined CovidDeaths and CovidVaccinations tables
    
* TempTable-CovidProject.sql
  - Temp table for more complex querires with partitions
    
* CreatingViews-CovidProject.sql
  - Created views to save queries for later visualizations
    
