package com.util;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnection {
	public static Connection getConnection() {
		String DRIVERNAME = "com.mysql.cj.jdbc.Driver";
		String URL = "jdbc:mysql://localhost:3306/exp25";
		String USERNAME = "root";
		String PASSWORD = "root";
		
		try {
			Class.forName(DRIVERNAME);
			Connection conn = DriverManager.getConnection(URL, USERNAME, PASSWORD);
			return conn;
		}catch(Exception e) {
			e.printStackTrace();
		}
		return null;
	}
}