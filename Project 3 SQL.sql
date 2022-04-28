-- Count all rows in the two tables
SELECT COUNT(*) FROM project3.spotify_song_features;

SELECT COUNT(*) FROM project3.spotify_song_info;

-- Access my dataset
SELECT * FROM project3.spotify_song_features;

SELECT * FROM project3.spotify_song_info;

-- Artist featured the most in the top 100 in the past 10 years?
SELECT * FROM project3.spotify_song_info
WHERE year BETWEEN '2010' AND '2020'
ORDER BY artists DESC
LIMIT 100;

-- Artist featured the most in the top 20 whose popularity = 50, above 50 or below 50
SELECT artists, name, release_date, year, popularity 
FROM project3.spotify_song_info
WHERE popularity = 50
ORDER BY year DESC
LIMIT 20;

SELECT artists, name, release_date, year, popularity 
FROM project3.spotify_song_info
WHERE popularity > 50
ORDER BY year DESC
LIMIT 20;

SELECT artists, name, release_date, year, popularity 
FROM project3.spotify_song_info
WHERE popularity < 50
ORDER BY year DESC
LIMIT 20;

-- Average/Minimum/Maximum song popularity by year in the past 10 years
SELECT avg(Popularity) AS 'Average Song Popularity'
FROM project3.spotify_song_info
WHERE year BETWEEN '2010' AND '2020'
GROUP BY year
ORDER BY 1 DESC;

SELECT min(Popularity) AS 'Minimum Song Popularity'
FROM project3.spotify_song_info
WHERE year BETWEEN '2010' AND '2020'
GROUP BY year
ORDER BY 1 DESC;

SELECT max(Popularity) AS 'Maximum Song Popularity'
FROM project3.spotify_song_info
WHERE year BETWEEN '2010' AND '2020'
GROUP BY year
ORDER BY 1 DESC;

-- Filter to show artist whose first name starts with the letter U with few insights about that artist
SELECT artists, name, popularity, mode, SUM(liveness) AS 'Total Liveness' FROM project3.spotify_song_info, project3.spotify_song_features
WHERE artists LIKE 'U%';

-- Use CASE WHEN to split popularity into three segments:
-- If popularity less than 50 AND year between 2010 and 2020 THEN 'Group 1' 
-- If salary is greater than 50 AND year between 2010 and 2020 THEN 'Group 2'
-- ELSE 'Group 3' 

SELECT artists, name, year, popularity,  
CASE 
WHEN popularity < 50 AND year BETWEEN '2010' AND '2020' THEN 'Group 1'
WHEN popularity > 50 AND year BETWEEN '2010' AND '2020' THEN 'Group 2'
ELSE 'Group 3' 
END AS 'Groups'
FROM project3.spotify_song_info
ORDER BY 4 DESC;

-- Lets join the tables together, we rename the spotify_song_info table to spotify1 and the spotify_song_features table to spotify2
SELECT * FROM project3.spotify_song_info spotify1 
INNER JOIN project3.spotify_song_features spotify2
ON spotify1.song_id = spotify2.song_id;

-- Selecting specific columns from the join 
SELECT spotify1.artists, spotify1.name, spotify2.danceability, spotify2.key, spotify2.tempo
FROM project3.spotify_song_info spotify1
INNER JOIN project3.spotify_song_features spotify2
ON spotify1.song_id = spotify2.song_id;

