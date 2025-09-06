8 Range Checking: Find all purchases made between January 1, 2023 and March 31, 2023.
SELECT *
FROM purchases
WHERE purchase_date BETWEEN '2023-01-01' AND '2023-03-31'
ORDER BY price DESC;

-- 2 Filtering: Find all songs with a popularity score greater than 80 and a duration less than 4 minutes (240 seconds).
SELECT *
FROM songs
WHERE popularity_score > 80
	AND duration_seconds < 240
ORDER BY popularity_score DESC;

--1 Basic Selection: Retrieve the titles and release dates of all songs released in 2022, ordered by release date (newest first).
SELECT title, release_date
FROM songs
WHERE release_date >= 2022
ORDER BY release_date DESC;


--3 Pattern Matching: List all artists whose names start with "The".
SELECT artist_name
FROM artists
WHERE artist_name like 'The%';

--4 Multiple Conditions: Find all premium customers who joined in 2022.
SELECT  first_name, last_name, premium_member
FROM customers 
WHERE join_date >= 2022;

--5 Calculations and Aliasing: Calculate the total duration (in minutes) of all songs in the database and display the result with an appropriate column name.
SELECT sum (duration_seconds)/60 AS total_duration_minutes
FROM songs;

--6 Advanced Filtering: Find the top 5 most expensive song purchases in the database.
SELECT *
FROM purchases
WHERE price 
ORDER BY price DESC
LIMIT 5;


--7 Using Multiple Tables Separately: First, find all song_ids from songs with a popularity score above 90. Then, use those song_ids to find purchases of those songs.
SELECT *
FROM purchases
WHERE song_id IN (
	SELECT song_id
	FROM songs
	WHERE popularity_score > 90
);	
	
	
--9 Advanced Filtering with ORDER BY: Identify the songs with the highest popularity scores (above 90).
SELECT *
FROM songs
WHERE popularity_score > 90;