-- 1. Give the name, release year, and worldwide gross of the lowest grossing movie.

SELECT specs.film_title, specs.release_year, revenue.worldwide_gross
FROM specs
JOIN revenue
ON specs.movie_id = revenue.movie_id
ORDER BY revenue.worldwide_gross
LIMIT 1;

-- Answer: "Semi-Tough", 1977, 37187139

-- 2. What year has the highest average imdb rating?

SELECT specs.release_year, ROUND(AVG(rating.imdb_rating),2) AS avg_rating
FROM specs
JOIN rating
ON specs.movie_id = rating.movie_id
GROUP BY specs.release_year
ORDER BY avg_rating DESC
LIMIT 1;

-- Answer: 1991, 7.45

-- 3. What is the highest grossing G-rated movie? Which company distributed it?

SELECT specs.film_title, distributors.company_name
FROM distributors
JOIN specs
ON distributors.distributor_id = specs.domestic_distributor_id
JOIN revenue
ON specs.movie_id = revenue.movie_id
WHERE specs.mpaa_rating = 'G'
ORDER BY revenue.worldwide_gross DESC
LIMIT 1;

-- Answer: Toy Story 4, Walt Disney


-- 4. Write a query that returns, for each distributor in the distributors table, the distributor name and the number of movies associated with that distributor in the movies 
-- table. Your result set should include all of the distributors, whether or not they have any movies in the movies table.

SELECT distributors.company_name, COUNT(specs.movie_id) AS film_count
FROM distributors
LEFT JOIN specs
ON distributors.distributor_id = specs.domestic_distributor_id 
GROUP BY distributors.company_name
ORDER BY film_count DESC;

-- 5. Write a query that returns the five distributors with the highest average movie budget.

SELECT distributors.company_name, AVG(film_budget) AS avg_budget
FROM distributors
JOIN specs
ON distributors.distributor_id = specs.domestic_distributor_id
JOIN revenue
ON specs.movie_id = revenue.movie_id
GROUP BY distributors.company_name
ORDER BY avg_budget DESC
LIMIT 5;

-- Answer: Walt Disney, Sony Pictures, Lionsgate, DreamWorks, Warner Bros.

-- 6. How many movies in the dataset are distributed by a company which is not headquartered in California? Which of these movies has the highest imdb rating?

SELECT COUNT(specs.film_title) AS film_count
FROM specs
JOIN distributors
ON specs.domestic_distributor_id = distributors.distributor_id
WHERE distributors.headquarters NOT LIKE '%CA%';

--Answer: 2 movies

SELECT specs.film_title, rating.imdb_rating, distributors.headquarters
FROM specs
JOIN distributors
ON specs.domestic_distributor_id = distributors.distributor_id
JOIN rating
ON specs.movie_id = rating.movie_id
WHERE distributors.headquarters NOT LIKE '%CA%'
ORDER BY rating.imdb_rating DESC
LIMIT 1;

-- Answer: Dirty Dancing

-- 7. Which have a higher average rating, movies which are over two hours long or movies which are under two hours?