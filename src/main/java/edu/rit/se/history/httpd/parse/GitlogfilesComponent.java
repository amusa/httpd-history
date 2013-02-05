package edu.rit.se.history.httpd.parse;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import org.chaoticbits.devactivity.DBUtil;

public class GitlogfilesComponent {
	private static org.apache.log4j.Logger log = org.apache.log4j.Logger.getLogger(GitlogfilesComponent.class);

	public void update(DBUtil dbUtil) throws Exception {
		Connection conn = dbUtil.getConnection();

		String query = "SELECT Commit, Filepath, ComponentPath from GitLogFiles "
				+ "LEFT OUTER JOIN Components on Filepath LIKE CONCAT(ComponentPath,'%')";
		log.debug("Executing query...");
		ResultSet rs = conn.createStatement().executeQuery(query);

		String upQuery = "UPDATE GitLogFiles SET Component = ? WHERE Commit = ? AND Filepath = ?";
		PreparedStatement psUpdate = conn.prepareStatement(upQuery);

		while (rs.next()) {
			psUpdate.setString(1, rs.getString("ComponentPath"));
			psUpdate.setString(2, rs.getString("Commit"));
			psUpdate.setString(3, rs.getString("Filepath"));
			psUpdate.addBatch();
		}

		log.debug("Executing batch update...");
		psUpdate.executeBatch();

	}

}
