CREATE DATABASE netflix_db;

CREATE TABLE netflix_title (show_id VARCHAR(10) PRIMARY KEY, category VARCHAR(200), title VARCHAR(200), director TEXT, cast TEXT, country VARCHAR(200),
date_added VARCHAR(100), release_year int, rating VARCHAR(50), duration VARCHAR(50), listed_in VARCHAR(200), summary TEXT);

# Disable safe mode temporarily to update the table

SET SQL_SAFE_UPDATES = 0;

#Update Null values to None

UPDATE netflix_title SET director = 'None'
WHERE director IS NULL;
UPDATE netflix_title SET cast = 'None'
WHERE cast IS NULL;
UPDATE netflix_title SET country = 'None'
WHERE country IS NULL;

#Total records
SELECT Count(*)
FROM netflix_title;

#All movies from India
SELECT *
FROM netflix_title 
WHERE country = 'India'
AND category = 'Movie';

#List of movies release after 1990
SELECT release_year, title, country, duration
FROM netflix_title
WHERE release_year > 1990
ORDER BY release_year ASC;

#No.of TV shows and Movies in total
SELECT category, COUNT(*) AS total
FROM netflix_title 
GROUP BY category;

#No.of TV shows and movies released each year
SELECT release_year, category, COUNT(*) AS total
FROM netflix_title
GROUP BY release_year, category
ORDER BY release_year DESC;

#Maximum and minimum TV shows and movie release
SELECT MIN(release_year), Max(release_year), category
FROM netflix_title
GROUP BY category;

#Total no.of movies by top 15 countries
SELECT country, COUNT(*) AS total_movies
FROM netflix_title
WHERE country != 'None'
GROUP BY country
ORDER BY total_movies DESC
LIMIT 15;

#Total genres
SELECT listed_in, COUNT(*) AS total
FROM netflix_title
GROUP BY listed_in
ORDER BY total DESC;

#Comedy movies in US
SELECT listed_in, title, category, country
FROM netflix_title
WHERE listed_in LIKE '%Comedies%'
AND category = 'Movie'
AND country = 'United States';

#Count of each rating
SELECT rating, COUNT(*) AS total
FROM netflix_title
WHERE rating IS NOT NULL
GROUP BY rating
ORDER BY total DESC;


#To enable safe mode 
SET SQL_SAFE_UPDATES = 1;









