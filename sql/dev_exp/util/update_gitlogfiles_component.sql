UPDATE Gitlogfiles g SET component = 
				( 
					SELECT ComponentPath FROM Components c WHERE g.filepath LIKE CONCAT(c.ComponentPath,'%') 
			                        ORDER BY length(c.componentpath) DESC LIMIT 1 );
