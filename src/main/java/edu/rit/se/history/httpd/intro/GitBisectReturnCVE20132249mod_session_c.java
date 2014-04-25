package edu.rit.se.history.httpd.intro.exp;

import java.io.BufferedReader;
import java.io.DataInputStream;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStreamReader;

/**
 * CVE-2013-2249:modules/session/mod_session.c
 * 
 * Fix commit: 41f25c7f31c6aefca00b1221baa8667774eeaa91
 * 
 * Origin commit: 5430f8800f5fffd57e7421dee0ac9de8ca4f9573
 * 
 * <pre>
 *  git bisect start 41f25c7f31c6aefca00b1221baa8667774eeaa91^ 5430f8800f5fffd57e7421dee0ac9de8ca4f9573 -- modules/session/mod_session.c
 *  git bisect run java -cp ../httpd-history/src/main/java/ edu.rit.se.history.httpd.intro.exp.GitBisectReturnCVE20132249mod_session_c
 * </pre>
 * 
 * @author Ayemi Musa
 * 
 */
public class GitBisectReturnCVE20132249mod_session_c {

	private static final int GOOD_RETURN_CODE = 0;
	private static final int BAD_RETURN_CODE = 1;
	private static final int SKIP_RETURN_CODE = 125;

	private static final String CVE = "CVE-2013-2249";
	private static final String FILE = "modules/session/mod_session.c";

	public static void main(String[] args) {
		if (args.length > 0) {
			System.out.println("No arguments allowed to this script!");
			System.exit(SKIP_RETURN_CODE);
		}
		System.out.println("===Bisect check for " + CVE + ", " + FILE + "===");
		try {
			if (isVulnerable(FILE)) {
				System.out.println("===VULNERABLE===");
				System.exit(BAD_RETURN_CODE); // vulnerable --> commit was "bad" --> abnormal termination
			} else {
				System.out.println("===NEUTRAL===");
				System.exit(GOOD_RETURN_CODE); // neutral --> commit was "good" --> normal termination
			}
		} catch (IOException e) {
			System.out.println("===IOException! See stack trace below===");
			e.printStackTrace();
			System.exit(SKIP_RETURN_CODE);
		}
	}

	/**
	 * 
	 * @param fileName
	 * @return boolean good or bad commit
	 * @throws IOException
	 */
	public static boolean isVulnerable(String fileName) throws IOException {
		boolean isVulnerable = false;
		// Open the file that is the first
		// command line parameter
		FileInputStream fstream = new FileInputStream(fileName);
		// Get the object of DataInputStream
		DataInputStream in = new DataInputStream(fstream);
		BufferedReader br = new BufferedReader(new InputStreamReader(in));
		String strLine;
		StringBuffer stringBuffer = new StringBuffer();
		// Read file line by line, removing newlines
		while ((strLine = br.readLine()) != null) {
			stringBuffer.append(strLine.trim());
		}
		// Close the input stream
		in.close();
		/**
		 * if the file contains this code, then it's vulnerable
		 * 
		 */
		String context = "" + //				
         "zz->uuid = (apr_uuid_t *) apr_pcalloc(zz->pool, sizeof(apr_uuid_t));"+
         "apr_uuid_get(zz->uuid);" +
				"";

		String bad = "" + //
				""+
				"";

		String good = "" + //
				"z->encoded = override;"+
                 "z->dirty = 1;"+
                  "session_identity_decode(r, z);" + 
				"";

		if (has(stringBuffer, context)&& (!has(stringBuffer, good))) {
			isVulnerable = true;
		} else {
			isVulnerable = false; // no such context is found, must have pre-dated the vulnerability
		}
		return isVulnerable;
	}

	private static boolean has(StringBuffer stringBuffer, String str) {
		boolean has = stringBuffer.indexOf(str) > 0;
		if (!has)
			System.out.println("\tContext not found: " + str);
		return has;
	}
}
