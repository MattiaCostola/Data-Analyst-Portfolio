-- Covid-19 analysis
-- Dataset from https://ourworldindata.org/

--- Creating New Columns

ALTER TABLE `academic-elixir-311507.covid_19.covid_data` 
ADD COLUMN month INT64,
ADD COLUMN year INT64

UPDATE `academic-elixir-311507.covid_19.covid_data` 
SET month = EXTRACT(MONTH FROM date)
WHERE month is null

UPDATE `academic-elixir-311507.covid_19.covid_data` 
SET year = EXTRACT(YEAR FROM date)
WHERE year is null

-- GLOBAL SITUATION

-- Cases Count by Months

With Cte1 as
(
SELECT year, month, location, population, SUM(new_cases) as NewCases, MAX(total_cases) AS TotalCaseCount
FROM `academic-elixir-311507.covid_19.covid_data` 
WHERE continent is not null
GROUP BY year, month, location, population
)
SELECT year, month, SUM(population) AS WorldPopulation, SUM(TotalCaseCount) AS TotalWorldCases, SUM(NewCases) AS NewCases,ROUND((SUM(TotalCaseCount)/SUM(population)*100),2) AS CasesPercentage
FROM Cte1
GROUP BY year, month
ORDER BY year, month


-- Deaths Count by Months

With Cte2 as
(
SELECT year, month, location, population, SUM(new_deaths) as NewDeaths, MAX(total_deaths) AS TotalDeathsCount
FROM `academic-elixir-311507.covid_19.covid_data` 
WHERE continent is not null
GROUP BY year, month, location, population
)
SELECT year, month, SUM(population) AS WorldPopulation, SUM(TotalDeathsCount) AS TotalWorldDeaths, SUM(NewDeaths) as NewDeaths, ROUND((SUM(TotalDeathsCount)/SUM(population)*100),2) AS DeathsPercentage
FROM Cte2
GROUP BY year, month
ORDER BY year, month

-- Cases vs Deaths by Months

With Cte3 as
(
SELECT year, month,location, MAX(total_cases) AS TotalCaseCount,MAX(total_deaths) AS TotalDeathsCount
FROM `academic-elixir-311507.covid_19.covid_data` 
WHERE continent is not null
GROUP BY year, month, location, population
)
SELECT year, month, SUM(TotalCaseCount) AS TotalWorldCases, SUM(TotalDeathsCount) AS TotalWorldDeaths, ROUND((SUM(TotalDeathsCount)/SUM(TotalCaseCount)*100),2) AS MortalityPercentage
FROM Cte3
GROUP BY year, month
ORDER BY year, month


-- Vaccinations Count by Month

With Cte4 as
(
SELECT year, month, location, population, MAX(people_fully_vaccinated) AS TotalVaccinations
FROM `academic-elixir-311507.covid_19.covid_data` 
WHERE continent is not null
GROUP BY year, month, location, population
)
SELECT year, month, SUM(TotalVaccinations) AS TotalWorldVaccinations, ROUND((SUM(TotalVaccinations)/SUM(population)*100),2) AS VaccinationsPercentage
FROM Cte4
GROUP BY year, month
ORDER BY year, month

-- CONTINENTS SITUATION

-- Which continent has had more cases?

With Cte5 as 
(
SELECT continent, location, population, MAX(total_cases) AS TotalCases
FROM `academic-elixir-311507.covid_19.covid_data` 
WHERE continent is not null
GROUP BY continent, location, population
)
SELECT continent, SUM(population) AS ContinentPopulation, SUM(TotalCases) as ContinentCases, ROUND((SUM(TotalCases)/SUM(population))*100,2) AS CasesPercentage
FROM Cte5
GROUP BY continent
ORDER BY ContinentCases DESC

-- Which continent has had more deaths?

With Cte6 as 
(
SELECT continent, location, population, MAX(total_deaths) AS TotalDeaths
FROM `academic-elixir-311507.covid_19.covid_data` 
WHERE continent is not null
GROUP BY continent, location, population
)
SELECT continent, SUM(population) AS ContinentPopulation, SUM(TotalDeaths) as ContinentDeaths, ROUND((SUM(TotalDeaths)/SUM(population))*100,2) AS DeathsPercentage
FROM Cte6
GROUP BY continent
ORDER BY ContinentDeaths DESC

-- Which continent has more fully vaccinated people?

With Cte7 as 
(
SELECT continent, location, population, MAX(people_fully_vaccinated) AS PeopleFullyVaccinated
FROM `academic-elixir-311507.covid_19.covid_data` 
WHERE continent is not null
GROUP BY continent, location, population
)
SELECT continent, SUM(population) AS ContinentPopulation, SUM(PeopleFullyVaccinated) as ContinentFullyVaccinatedPeople, ROUND((SUM(PeopleFullyVaccinated)/SUM(population))*100,2) AS FullyVaccinatedPercentage
FROM Cte7
GROUP BY continent
ORDER BY ContinentFullyVaccinatedPeople DESC

-- COVID-19 ANALYSIS MONTH BY MONTH IN ITALY

-- Total Cases by Months

SELECT location, year, month, MAX(total_cases) as TotalCases, SUM(new_cases) as NewCasese, ROUND((MAX(total_cases)/population)*100,2) AS CasesPercentage
FROM `academic-elixir-311507.covid_19.covid_data` 
WHERE location = 'Italy' 
GROUP BY year, month, location, population
ORDER BY year, month

-- New Cases vs New Deaths by Months

SELECT location, year, month, SUM(new_cases) as Cases, SUM(new_deaths) as Deaths, ROUND((SUM(new_deaths)/SUM(new_cases))*100,2) AS DeathPercentage
FROM `academic-elixir-311507.covid_19.covid_data` 
WHERE location = 'Italy' 
GROUP BY year, month, location, population
ORDER BY year, month

-- People Fully Vaccinated + New Vacinations by Months

SELECT location, year, month, MAX(people_fully_vaccinated) as PeopleFullyVaccinated, SUM(new_vaccinations) as NewVaccinations, ROUND((MAX(people_fully_vaccinated)/population)*100,2) AS VaccinationsPercentage
FROM `academic-elixir-311507.covid_19.covid_data` 
WHERE location = 'Italy' 
GROUP BY year, month, location, population
ORDER BY year,month


