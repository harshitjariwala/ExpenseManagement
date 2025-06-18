package com.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.util.DBConnection;

@WebServlet("/UpdateExpenseController2")
public class UpdateExpenseController2 extends HttpServlet{
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
		throws ServletException, IOException {
		Integer expenseId = Integer.parseInt(request.getParameter("expenseId"));
		String title = request.getParameter("title");
		Integer amount = Integer.parseInt(request.getParameter("amount"));
		String category = request.getParameter("category");
		String expenseDate = request.getParameter("expenseDate");
		
		try {
			Connection conn = DBConnection.getConnection();
			PreparedStatement pstmt = conn.prepareStatement("update expenses set title = ?, amount = ?, category = ?, expenseDate = ? where expenseId = ?");
			
			pstmt.setString(1, title);
			pstmt.setInt(2, amount);
			pstmt.setString(3, category);
			pstmt.setString(4, expenseDate);
			pstmt.setInt(5, expenseId);
			
			Integer isUpdate = pstmt.executeUpdate();
			if(isUpdate != 0) {
				response.sendRedirect("ViewExpenseController?expenseId="+expenseId);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
