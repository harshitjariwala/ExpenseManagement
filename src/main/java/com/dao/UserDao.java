package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.bean.UserBean;
import com.mysql.cj.xdevapi.Result;
import com.util.DBConnection;

public class UserDao {

	public void insertUser(UserBean user) {
		Connection conn = DBConnection.getConnection();
		try {
			PreparedStatement pstmt = conn.prepareStatement("insert into users(firstName, email, password) values(?,?,?)");
			
			pstmt.setString(1,user.getFirstName());
			pstmt.setString(2,user.getEmail());
			pstmt.setString(3,user.getPassword());
			
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public int getUserId(UserBean user) {
		Connection conn = DBConnection.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			pstmt = conn.prepareStatement("select userId from users where email = ?");
			pstmt.setString(1,user.getEmail());
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				return rs.getInt(1);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return 0;
	}
	
	public UserBean getUserById (int userId) {
		Connection conn = DBConnection.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		UserBean user = new UserBean();
		
		try {
			pstmt = conn.prepareStatement("select * from users where userId = ?");
			pstmt.setInt(1,userId);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				user.setUserId(userId);
				user.setFirstName(rs.getString(2));
				user.setEmail(rs.getString(3));
				user.setPassword(rs.getString(4));
				return user;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return user;
	}
}