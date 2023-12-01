SELECT * FROM public."AppleStore"
SELECT * FROM public."AppleStoreDescription"

**EXPLORATORY DATA ANALYSIS**
--Check number of unique apps in both tables
SELECT COUNT(DISTINCT id) FROM public."AppleStore"

--Check for any missing values in key fields
SELECT COUNT(*) AS MissingValues
FROM public."AppleStore"
WHERE track_name IS null OR user_rating IS null OR prime_genre IS null

--Find out the number of apps per genre
SELECT prime_genre, COUNT(*) AS NumApps
FROM public."AppleStore"
GROUP BY prime_genre
ORDER by NumApps DESC
 
 
--Get overview of app ratings
SELECT 
MIN(user_rating) AS MinRating,
MAX(user_rating) AS MaxRating,
AVG(user_rating) AS AvgRating
FROM public."AppleStore"


**DATA ANALYSIS**
--Determine whether paid apps have higher ratings than paid apps
SELECT track_name, price,
CASE
WHEN price > 0 THEN 'paid' ELSE 'free'
END AS App_Type,
AVG(user_rating) AS Avg_Rating
FROM public."AppleStore"
GROUP BY track_name, price, App_Type;


--Check if apps that support more languages have higher ratings
SELECT
CASE
WHEN lang_num < 10 THEN '<10 languages'
WHEN lang_num BETWEEN 10 and 30 THEN '10-30 languages'
ELSE '>30 languages	'
END AS language_bucket,
AVG(user_rating) AS Avg_Rating
FROM public."AppleStore"
GROUP BY language_bucket
ORDER BY Avg_Rating DESC


--Check the genres with low ratings
SELECT prime_genre,
AVG(user_rating) AS Avg_Rating
FROM public."AppleStore"
GROUP BY prime_genre
ORDER BY Avg_Rating ASC
LIMIT 10


--Check the top-rated apps for each genre
SELECT
prime_genre,
track_name,
user_rating
FROM
(
	SELECT
	prime_genre,
	track_name,
	user_rating,
	RANK () OVER(PARTITION BY prime_genre ORDER BY user_rating DESC, rating_count_tot DESC) AS rank
	FROM public."AppleStore"
	) AS a
	WHERE 
	a.rank = 1;
	
