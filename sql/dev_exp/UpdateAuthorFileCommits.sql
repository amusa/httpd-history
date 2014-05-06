-- using gitlogfiles
UPDATE gitlogfiles g INNER JOIN 
                             (
                             SELECT commit, authoremail, filepath, authordate, 
									(
		                            SELECT COUNT(*) FROM gitlogfiles g2 
		                           		WHERE g2.authoremail = g1.authoremail 
			                        	AND g2.filepath = g1.filepath 
                                        AND g2.authordate <= g1.authordate
                                        AND g2.commit <> g1.commit
									 ) as filecommits
                             FROM gitlogfiles as g1
                             ) AS t
	 ON g.commit=t.commit
	 AND g.filepath=t.filepath
	 AND g.authoremail = t.authoremail
	 AND g.authordate = t.authordate
     SET g.filecommits = t.filecommits;

