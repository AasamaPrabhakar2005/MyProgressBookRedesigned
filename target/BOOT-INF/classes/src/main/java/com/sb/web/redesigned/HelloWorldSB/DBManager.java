package com.sb.web.redesigned.HelloWorldSB;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

import org.apache.log4j.Logger;

public class DBManager {
	final static Logger logger = Logger.getLogger(DBManager.class); 
public static Connection getConnection() {
	Connection connect=null;
	try {
		Class.forName("com.mysql.jdbc.Driver");
		connect = DriverManager.getConnection("jdbc:mysql://mypbookdbins.cde3au73wkie.us-west-2.rds.amazonaws.com/aasama?" + "user=mypbookusr&password=mypbookpwd");
		logger.info("Connection Established");
	} catch (Exception e) {
		logger.error(e.toString());
		e.printStackTrace();
	}

	// Setup the connection with the DB
//	Connection connect = DriverManager.getConnection("jdbc:mysql://127.0.0.1/aasama?" + "user=root&password=");
	return connect;
}
}
