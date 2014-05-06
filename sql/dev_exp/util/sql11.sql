SELECT * FROM httpdhistory.new_cve2vcc;

SELECT authordate, filepath, commit, commitfixed from gitlogfiles g INNER JOIN new_cve2vcc n 
ON n.commitIntroduced = g.commit;

SELECT authordate, filepath, commit from gitlogfiles g WHERE g.commit IN (SELECT commitintroduced FROM new_cve2vcc);

SELECT * FROM new_cve2vcc where commitIntroduced not in (SELECT commit FROM gitlogfiles);