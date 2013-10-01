package edu.rit.se.history.httpd.analysis;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import org.chaoticbits.devactivity.DBUtil;

import edu.rit.se.history.httpd.RebuildHistory;

public class GitOptimizer {
	private static org.apache.log4j.Logger log = org.apache.log4j.Logger.getLogger(GitOptimizer.class);
	public void optimize(DBUtil dbUtil) throws SQLException {
		Connection conn = dbUtil.getConnection();
		log.info("optimizing gitlogfiles table...");
		PreparedStatement ps = conn.prepareStatement("OPTIMIZE TABLE Gitlogfiles");
		ps.execute();
	}

}
