--0 select basics
--Modify it to show the population of Germany

SELECT population FROM world
  WHERE name = 'Germany'

--Show the name and the population for 'Sweden', 'Norway' and 'Denmark'.
SELECT name, population FROM world
  WHERE name IN ('Sweden', 'Norway', 'Denmark');

--Which countries are not too small and not too big? BETWEEN allows range checking (range specified is inclusive of boundary values). The example below shows countries with an area of 250,000-300,000 sq. km. Modify it to show the country and the area for countries with an area between 200,000 and 250,000.
SELECT name, area FROM world
  WHERE area BETWEEN 200000 and 250000

--1 SELECT name
--Find the country that start with Y
SELECT name FROM world
  WHERE name LIKE 'Y%'

--Find the countries that end with y
SELECT name FROM world
  WHERE name LIKE '%y'

--Find the countries that contain the letter x
SELECT name FROM world
  WHERE name LIKE '%x%'

--Find the countries that end with land
SELECT name FROM world
  WHERE name LIKE '%land'

--Find the countries that start with C and end with ia
SELECT name FROM world
  WHERE name LIKE 'C%ia'

--Find the country that has oo in the name
SELECT name FROM world
  WHERE name LIKE '%oo%'

--Find the countries that have three or more a in the name
SELECT name FROM world
  WHERE name LIKE '%a%a%a%'

--Find the countries that have "t" as the second character.
SELECT name FROM world
 WHERE name LIKE '_t%'
ORDER BY name

--Find the countries that have two "o" characters separated by two others.
SELECT name FROM world
 WHERE name LIKE '%o__o%'

--Find the countries that have exactly four characters.
SELECT name FROM world
 WHERE name LIKE '____'

--Find the country where the name is the capital city.
SELECT name
  FROM world
 WHERE name = capital

--Find the country where the capital is the country plus "City".
SELECT name
  FROM world
 WHERE capital = concat(name, ' City')

--Find the capital and the name where the capital includes the name of the country.
SELECT capital, name
  FROM world
 WHERE capital like concat('%', name, '%');

--Find the capital and the name where the capital is an extension of name of the country.
SELECT capital, name
  FROM world
 WHERE capital like concat(name, '%') and capital > name

--Show the name and the extension where the capital is an extension of name of the country.
SELECT name, REPLACE(capital, name, '')
  FROM world
 WHERE capital like concat(name, '%') and capital > name

--2.SELECT FROM WORLD
--Observe the result of running this SQL command to show the name, continent and population of all countries.
SELECT name, continent, population FROM world

--Show the name for the countries that have a population of at least 200 million. 200 million is 200000000, there are eight zeros.
SELECT name FROM world
WHERE population >= 200000000

--Give the name and the per capita GDP for those countries with a population of at least 200 million.
SELECT name, gdp/population FROM world
WHERE population >= 200000000

--Show the name and population in millions for the countries of the continent 'South America'. Divide the population by 1000000 to get population in millions.
SELECT name, population/1000000 FROM world
WHERE continent = 'South America'

--Show the name and population for France, Germany, Italy
SELECT name, population FROM world
WHERE name in ('France', 'Germany', 'Italy')

--Show the countries which have a name that includes the word 'United'
SELECT name FROM world
WHERE name like 'United%'

--Show the countries that are big by area or big by population. Show name, population and area.
SELECT name, population, area FROM world
WHERE population > 250000000 or area > 3000000

--Exclusive OR (XOR). Show the countries that are big by area (more than 3 million) or big by population (more than 250 million) but not both. Show name, population and area.
SELECT name, population, area FROM world
WHERE population > 250000000 xor area > 3000000

--For South America show population in millions and GDP in billions both to 2 decimal places.
SELECT name, round(population/1000000,2), round(gdp/1000000000,2) FROM world
WHERE continent = 'South America'

--Show per-capita GDP for the trillion dollar countries to the nearest $1000.
SELECT name, round(gdp/population,-3) FROM world
WHERE gdp > 1000000000000

--Show the name and capital where the name and the capital have the same number of characters.
SELECT name, capital
  FROM world
 WHERE LENGTH(name)= LENGTH(capital)

--Show the name and the capital where the first letters of each match. Don't include countries where the name and the capital are the same word.
SELECT name, capital 
FROM world
Where Left(name, 1) = left(capital, 1) and name <> capital

--Find the country that has all the vowels and no spaces in its name.
SELECT name
   FROM world
WHERE name LIKE '%a%' AND name LIKE '%e%' AND name LIKE '%i%' AND name LIKE '%o%' AND name LIKE '%u%' AND name NOT LIKE '% %';

--3.SELECT from Nobel
--Change the query shown so that it displays Nobel prizes for 1950.
SELECT yr, subject, winner
  FROM nobel
 WHERE yr = 1950

--Show who won the 1962 prize for literature.
SELECT winner
  FROM nobel
 WHERE yr = 1962
   AND subject = 'literature'

--Show the year and subject that won 'Albert Einstein' his prize.
SELECT yr, subject
  FROM nobel
 WHERE winner = 'Albert Einstein'
 
--Give the name of the 'peace' winners since the year 2000, including 2000.
SELECT winner
  FROM nobel
 WHERE subject = 'peace' and yr >=2000
 
--Show all details (yr, subject, winner) of the literature prize winners for 1980 to 1989 inclusive.
SELECT yr, subject, winner
  FROM nobel
 WHERE subject = 'literature' and yr between 1980 and 1989
 
-- Show all details of the presidential winners:
-- Theodore Roosevelt
-- Thomas Woodrow Wilson
-- Jimmy Carter
-- Barack Obama
SELECT * FROM nobel
 WHERE winner IN ('Barack Obama',
                  'Jimmy Carter',
                  'Theodore Roosevelt', 'Woodrow Wilson')

-- Show the winners with first name John
SELECT winner FROM nobel
 WHERE winner like 'John%'

-- Show the year, subject, and name of physics winners for 1980 together with the chemistry winners for 1984.
SELECT yr, subject, winner FROM nobel
 WHERE subject= 'chemistry' and yr = 1984 or subject = 'physics' and yr =1980

-- Show the year, subject, and name of winners for 1980 excluding chemistry and medicine
SELECT yr, subject, winner FROM nobel
 WHERE subject<>'chemistry' and subject <> 'medicine' and yr =1980

--Show year, subject, and name of people who won a 'Medicine' prize in an early year (before 1910, not including 1910) together with winners of a 'Literature' prize in a later year (after 2004, including 2004)
SELECT *FROM nobel
 WHERE subject= 'Medicine' and yr < 1910 or subject = 'Literature' and yr >2004

-- Find all details of the prize won by PETER GRÜNBERG
select * from nobel
where winner = 'PETER GRÜNBERG'

-- Find all details of the prize won by EUGENE O'NEILL
select * from nobel
where winner = "EUGENE O'NEILL"

-- List the winners, year and subject where the winner starts with Sir. Show the the most recent first, then by name order.
select winner, yr, subject from nobel
where winner like "Sir %"

-- Show the 1984 winners and subject ordered by subject and winner name; but list chemistry and physics last.
SELECT winner, subject
  FROM nobel
 WHERE yr=1984
ORDER BY subject IN ('Physics','Chemistry'),subject,winner

--5. SUM and COunt
-- Show the total population of the world.
SELECT SUM(population)
FROM world

-- List all the continents - just once each.
SELECT distinct(continent)
FROM world 

-- Give the total GDP of Africa
SELECT sum(gdp)
FROM world where continent = 'Africa'

-- How many countries have an area of at least 1000000
SELECT count(name)
FROM world where area >= 1000000

-- What is the total population of ('Estonia', 'Latvia', 'Lithuania')
SELECT sum(population)
FROM world where name in ('Estonia', 'Latvia', 'Lithuania')

-- For each continent show the continent and number of countries.
SELECT continent, count(name)
FROM world group by continent

--For each continent show the continent and number of countries with populations of at least 10 million.
SELECT continent, count(name)
FROM world where population >= 10000000 group by continent 

--List the continents that have a total population of at least 100 million.
SELECT continent
FROM world
GROUP BY continent
HAVING SUM(population) >= 100000000;
