SELECT
    COUNT(*) AS total_rows,
    SUM(Sentiment IS NULL) AS null_sentiment,
    SUM(Word_Count IS NULL) AS null_word_count
FROM dreams;

SELECT COUNT(*) AS lucid_dreams
FROM dreams
WHERE Lucid = 'Yes';

SELECT 
    ROUND(
        COUNT(CASE WHEN Lucid = 'Yes' THEN 1 END) * 100.0 / COUNT(*),
        2
    ) AS lucid_percentage
FROM dreams;

DESCRIBE dreams;
select count(*) as total_dreams from dreams;

SELECT
    Emotion,
    COUNT(*) AS dream_count
FROM dreams
GROUP BY Emotion
ORDER BY dream_count DESC;

SELECT
    ROUND(Stress_Before_Sleep, 1) AS stress_level,
    ROUND(AVG(Sentiment), 2) AS avg_sentiment,
    COUNT(*) AS dream_count
FROM dreams
GROUP BY stress_level
ORDER BY stress_level;

SELECT
    Sleep_Stage,
    COUNT(*) AS dream_count,
    ROUND(AVG(Sentiment), 2) AS avg_sentiment
FROM dreams
GROUP BY Sleep_Stage;

SELECT
    Lucid,
    COUNT(*) AS dream_count,
    ROUND(AVG(Sentiment), 2) AS avg_sentiment,
    ROUND(AVG(Word_Count), 1) AS avg_word_count
FROM dreams
GROUP BY Lucid;

SELECT
    Emotion,
    ROUND(AVG(Word_Count), 1) AS avg_word_count,
    ROUND(AVG(Sentiment), 2) AS avg_sentiment
FROM dreams
GROUP BY Emotion
ORDER BY avg_sentiment DESC;

SELECT
    Season,
    COUNT(*) AS dream_count,
    ROUND(AVG(Sentiment), 2) AS avg_sentiment
FROM dreams
GROUP BY Season
ORDER BY avg_sentiment DESC;

SELECT
    Emotion,
    COUNT(*) AS dream_count,
    ROUND(AVG(Sentiment), 2) AS avg_sentiment,
    RANK() OVER (ORDER BY COUNT(*) DESC) AS frequency_rank
FROM dreams
GROUP BY Emotion;