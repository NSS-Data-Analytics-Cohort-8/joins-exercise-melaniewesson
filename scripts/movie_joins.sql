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



-- 4. Write a query that returns, for each distributor in the distributors table, the distributor name and the number of movies associated with that distributor in the movies 
-- table. Your result set should include all of the distributors, whether or not they have any movies in the movies table.

-- 5. Write a query that returns the five distributors with the highest average movie budget.

-- 6. How many movies in the dataset are distributed by a company which is not headquartered in California? Which of these movies has the highest imdb rating?

-- 7. Which have a higher average rating, movies which are over two hours long or movies which are under two hours?