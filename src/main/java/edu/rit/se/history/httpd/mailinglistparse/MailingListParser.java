package edu.rit.se.history.httpd.mailinglistparse;

import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.ObjectInputStream.GetField;
import java.io.StringWriter;
import java.net.UnknownHostException;
import java.nio.ByteBuffer;
import java.nio.charset.Charset;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.Properties;

import javax.mail.Folder;
import javax.mail.MessagingException;
import javax.mail.Multipart;
import javax.mail.Part;
import javax.mail.Session;
import javax.mail.Store;
import javax.mail.URLName;
import javax.mail.internet.MimeMessage;

import org.apache.commons.io.FileUtils;
import org.apache.commons.io.IOUtils;

import com.mongodb.BasicDBObject;
import com.mongodb.DB;
import com.mongodb.DBCollection;
import com.mongodb.MongoClient;

public class MailingListParser {

	final static String PATH_TO_FILES = "C:/mailinglist/downloads";

	public static void main(String[] args) {
		MailingListParser mailingListParser = new MailingListParser();
		mailingListParser.loadFile(PATH_TO_FILES);
		
		
		File folder = new File(PATH_TO_FILES);
		File[] listOfFiles = folder.listFiles();

		for (int i = 0; i < listOfFiles.length; i++) {
		  File file = listOfFiles[i];
		  if (file.isFile() && file.getName().endsWith(".txt")) {
		    String content;
			try {
				content = readFile(file.getAbsolutePath(), StandardCharsets.UTF_8);
			
		    mailingListParser.loadFile(content);	
		    System.out.println("Finished loading: " + file.getName());
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		  } 
		}		
	}

	private void loadFile(String content) {
		try {		
			String[] textMessages = content.split("\nFrom ");

			for (int i = 1; i < textMessages.length; i++) {
				textMessages[i] = "From " + textMessages[i];
			}

			MimeMessage[] messages = parseEmails(textMessages);
			saveToDB(messages);

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	private MimeMessage[] parseEmails(String[] textMessages) throws MessagingException, IOException {
		MimeMessage[] messages = new MimeMessage[textMessages.length];
		Session s = Session.getDefaultInstance(new Properties());
		for (int i = 0; i < textMessages.length; i++) {
			messages[i] = new MimeMessage(s, IOUtils.toInputStream(textMessages[i], "UTF-8"));
		}
		return messages;
	}

	private void saveToDB(MimeMessage[] messages) throws UnknownHostException, MessagingException, IOException {
		// mongoDB set up
		MongoClient mongo = new MongoClient("localhost", 27017);
		DB db = mongo.getDB("mailinglist");
		DBCollection emailCollection = db.getCollection("email");

		for (int i = 0; i < messages.length; i++) {
			BasicDBObject email = new BasicDBObject();
			email.put("MessageID", messages[i].getSender());
			email.put("MessageID", messages[i].getMessageID());
			email.put("subject", messages[i].getSubject());
			email.put("content", getText(messages[i]));
			email.put("sentDate", messages[i].getSentDate());
			emailCollection.insert(email);
		}
	}
	
	private boolean textIsHtml = false;

	/**
	 * Return the primary text content of the message.
	 */
	private String getText(Part p) throws MessagingException, IOException {
		if (p.isMimeType("text/*")) {
			String s = (String) p.getContent();
			this.textIsHtml = p.isMimeType("text/html");
			return s;
		}

		if (p.isMimeType("multipart/alternative")) {
			// prefer html text over plain text
			Multipart mp = (Multipart) p.getContent();
			String text = null;
			for (int i = 0; i < mp.getCount(); i++) {
				Part bp = mp.getBodyPart(i);
				if (bp.isMimeType("text/plain")) {
					if (text == null)
						text = getText(bp);
					continue;
				} else if (bp.isMimeType("text/html")) {
					String s = getText(bp);
					if (s != null)
						return s;
				} else {
					return getText(bp);
				}
			}
			return text;
		} else if (p.isMimeType("multipart/*")) {
			Multipart mp = (Multipart) p.getContent();
			for (int i = 0; i < mp.getCount(); i++) {
				String s = getText(mp.getBodyPart(i));
				if (s != null)
					return s;
			}
		}

		return null;
	}

	static String readFile(String path, Charset encoding) throws IOException {
		byte[] encoded = Files.readAllBytes(Paths.get(path));
		return encoding.decode(ByteBuffer.wrap(encoded)).toString();
	}
}
