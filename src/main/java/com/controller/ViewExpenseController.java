package com.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bean.ExpenseBean;
import com.util.DBConnection;

@WebServlet("/ViewExpenseController")
public class ViewExpenseController extends HttpServlet{

	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		Integer expenseId = Integer.parseInt(request.getParameter("expenseId"));
		
		try {
			Connection conn = DBConnection.getConnection();
			PreparedStatement pstmt = conn.prepareStatement("select * from expenses where expenseId = ?");
			pstmt.setInt(1, expenseId);
			ResultSet rs = pstmt.executeQuery();
			
			if(rs.next()) {
				ExpenseBean bean = new ExpenseBean();
				bean.setExpenseId(rs.getInt("ExpenseId"));;
				bean.setTitle(rs.getString("title"));
				bean.setAmount(rs.getInt("amount"));
				bean.setCategory(rs.getString("category"));
				bean.setExpenseDate(rs.getString("expenseDate"));
				
				request.setAttribute("bean", bean);
				request.getRequestDispatcher("ViewExpense.jsp").forward(request, response);
			}
		} catch (SQLException e) {

			e.printStackTrace();
		}
	}
}
