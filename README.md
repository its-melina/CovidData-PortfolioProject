Covid Data Portfolio Project

This project analyzes world data about Covid-19 deaths and vaccinations from January 2020 - April 2021. 

Tableau Public Dashboard: https://public.tableau.com/app/profile/melina.faraone/viz/CovidDeaths-PortfolioProject-Book1/Dashboard1 
  - This dashboard visualizes an overview of Covid-19 cases worldwide and for individual countries and continents.


Tools and skills used:
  - SQL, PostgreSQL, Tableau, Excel, Python, Jupyter, Pandas, Matplotlib, Seaborn, Plotly
  - Data cleaning, EDA, Merging, Data Validation, Visualizations (time series, geographic, bar charts, scatterplots)



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


PYTHON 

* Python-Covid-Data-Analysis.ipynb
  - Further analysis of factors in relation to Covid-19 statistics, such as Human Development Index
 

SQL 

* EDA-CovidDeaths.sql
  - Initial exxploration of the CovidDeaths.csv dataset
    
* JoinedTables-CovidProject.sql
  - Joined CovidDeaths and CovidVaccinations tables
    
* TempTable-CovidProject.sql
  - Temp table for more complex querires with partitions
    
* CreatingViews-CovidProject.sql
  - Created views to save queries for later visualizations

    
