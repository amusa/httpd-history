-- using gitlog

SELECT CONCAT_WS('-', MONTH(authordate), YEAR(authordate)) AS MONTH, COUNT(*) AS Commits 
FROM httpdhistory.gitlog
WHERE commit IN (
                SELECT DISTINCT commitintroduced FROM cve2vcc WHERE commitintroduced <> 'N/A'
                )
GROUP BY MONTH(authordate), YEAR(authordate) 
ORDER BY MONTH(authordate), YEAR(authordate) 
LIMIT 5000000;

