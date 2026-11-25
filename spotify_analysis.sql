
-- ==========================================
-- Music Streaming & Genre Trends Analysis
-- SQL Analysis
-- Dataset: Spotify Tracks Dataset
-- Total Records: 113,999
-- ==========================================


-- ANALYSIS 1: Top 10 Genres by Average Popularity

SELECT
    track_genre,
    ROUND(AVG(CAST(popularity AS REAL)), 2) AS avg_popularity
FROM spotify_tracks
GROUP BY track_genre
ORDER BY avg_popularity DESC
LIMIT 10;


-- ANALYSIS 2: Top 10 Genres by Average Danceability

SELECT
    track_genre,
    ROUND(AVG(CAST(danceability AS REAL)), 3) AS avg_danceability
FROM spotify_tracks
GROUP BY track_genre
ORDER BY avg_danceability DESC
LIMIT 10;


-- ANALYSIS 3: Artists with the Most Tracks

SELECT
    artists,
    COUNT(*) AS total_tracks
FROM spotify_tracks
GROUP BY artists
ORDER BY total_tracks DESC
LIMIT 10;


-- ANALYSIS 4: Genres with the Longest Average Track Duration

SELECT
    track_genre,
    ROUND(AVG(CAST(duration_ms AS REAL)) / 60000, 2)
        AS avg_duration_minutes
FROM spotify_tracks
GROUP BY track_genre
ORDER BY avg_duration_minutes DESC
LIMIT 10;


-- ANALYSIS 5: Explicit vs. Non-Explicit Track Popularity

SELECT
    explicit,
    COUNT(*) AS total_tracks,
    ROUND(AVG(CAST(popularity AS REAL)), 2) AS avg_popularity
FROM spotify_tracks
GROUP BY explicit
ORDER BY avg_popularity DESC;
