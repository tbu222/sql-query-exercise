-- For this challenge you need to create a simple SELECT statement that will return all columns from the people table WHERE their age is over 50

-- people table schema
-- id
-- name
-- age
-- You should return all people fields where their age is over 50 and order by the age descending
select * from people where age >50 order by age desc

-- For this challenge you need to create a simple SUM statement that will sum all the ages.

-- people table schema
-- id
-- name
-- age
-- select table schema
-- age_sum (sum of ages)

SELECT SUM(age) as age_sum FROM people;

-- For this challenge you need to create a simple MIN / MAX statement that will return the Minimum and Maximum ages out of all the people.

-- people table schema
-- id
-- name
-- age
-- select table schema
-- age_min (minimum of ages)
-- age_max (maximum of ages)
select min(age) as age_min, max(age) as age_max from people

--Create a simple SELECT query to display student information of all ACTIVE students.
select * from students where isActive = 1

-- For this challenge you need to create a simple GROUP BY statement, you want to group all the people by their age and count the people who have the same age.

-- people table schema
-- id
-- name
-- age
-- select table schema
-- age [group by]
-- people_count (people count)
select age, count(people) as people_count from people group by age

-- For this challenge you need to create a simple HAVING statement, you want to count how many people have the same age and return the groups with 10 or more people who have that age.

-- people table schema
-- id
-- name
-- age
-- return table schema
-- age
-- total_people
select age, count(*) as people_count from people group by age having count(*) >10
