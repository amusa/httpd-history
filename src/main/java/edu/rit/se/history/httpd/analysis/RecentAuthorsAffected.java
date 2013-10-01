package edu.rit.se.history.httpd.analysis;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import org.chaoticbits.devactivity.DBUtil;

public class RecentAuthorsAffected {
	private static org.apache.log4j.Logger log = org.apache.log4j.Logger.getLogger(RecentAuthorsAffected.class);

	public void compute(DBUtil dbUtil, long recentPeriod) throws Exception {
		Connection conn = dbUtil.getConnection();
		/*String query = "SELECT g.filepath, g.commit,  "      	        		
			    + "(SELECT COUNT(DISTINCT authoraffected) FROM gitchurnauthorsaffected a " 
			    + "INNER JOIN repolog _r ON a.commit = _r.commit "
			    + "WHERE _r.authordate <= g.authordate AND DATEDIFF(g.authordate, _r.authordate) <= ? "
			    + "AND a.filepath = g.filepath ) AS RecentAuthorsAffected "
			+ "FROM Gitlogfiles g";
				
		String upQuery = "UPDATE GitLogFiles SET RecentAuthorsAffected = ? WHERE commit = ? AND filepath = ?"; 
		
		PreparedStatement ps = conn.prepareStatement(query);
		PreparedStatement psUpdate = conn.prepareStatement(upQuery);
		ps.setLong(1, recentPeriod);
		log.debug("Executing query...");
		ResultSet rs = ps.executeQuery();
		log.debug("Processing results...");
		while (rs.next()) {
			psUpdate.setInt(1, rs.getInt("recentAuthorsAffected"));
			psUpdate.setString(2, rs.getString("commit"));
			psUpdate.setString(3, rs.getString("filepath"));
			psUpdate.addBatch();
		}
		log.debug("Executing update...");
		psUpdate.executeBatch();
		*/
		String query = "UPDATE Gitlogfiles g SET recentAuthorsAffected =   "+    	        		
			    "(SELECT COUNT(DISTINCT authoraffected) FROM gitchurnauthorsaffected a "+ 
			    "WHERE a.filepath = g.filepath " + 
				"AND a.authordate <= g.authordate AND DATEDIFF(g.authordate, a.authordate) <= ? "+
			    " )";
		PreparedStatement ps = conn.prepareStatement(query);
		ps.setLong(1, recentPeriod);
		log.debug("Executing update...");
		ps.executeUpdate();
		conn.close();

	}

}
