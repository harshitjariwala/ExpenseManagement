package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;

import com.bean.ExpenseBean;
import com.util.DBConnection;

public class ExpenseDao {
	public void insertExpense(ExpenseBean expense) {
		Connection conn = DBConnection.getConnection();
		PreparedStatement pstmt = null;
		
		try {
			pstmt = conn.prepareStatement("insert into expenses (title, expenseDate, category, amount) values (?,?,?,?);");
			pstmt.setString(1, expense.getTitle());
			pstmt.setString(2, expense.getExpenseDate());
			pstmt.setString(3, expense.getCategory());
			pstmt.setInt(4,expense.getAmount());
			
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
