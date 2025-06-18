package com.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.util.DBConnection;

@WebServlet("/DeleteExpenseController")
public class DeleteExpenseController extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		Integer expenseId = Integer.parseInt(request.getParameter("expenseId"));
		
		Connection conn = DBConnection.getConnection();
		try {
			PreparedStatement pstmt = conn.prepareStatement("delete from expenses where expenseId = ?");
			pstmt.setInt(1,expenseId);
			pstmt.executeUpdate();
			response.sendRedirect("ListExpenseController");
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}
}
