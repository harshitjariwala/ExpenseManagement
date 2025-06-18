package com.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bean.ExpenseBean;
import com.bean.UserBean;
import com.util.DBConnection;

@WebServlet("/SearchCategoryController")
public class SearchCategoryController extends HttpServlet{
	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		String category = request.getParameter("category");
		try {
			Connection conn = DBConnection.getConnection();
			PreparedStatement pstmt = conn.prepareStatement("select * from expenses where category = ? and userId = ?");
			pstmt.setString(1,category);
			HttpSession session = request.getSession();
			UserBean user = (UserBean) session.getAttribute("user");
			int userId = user.getUserId();
			pstmt.setInt(1,userId);
			ResultSet rs = pstmt.executeQuery();
			ArrayList<ExpenseBean> list = new ArrayList<ExpenseBean>();
			
			while(rs.next()) {
				String title = rs.getString("title");
				int amount = rs.getInt("amount");
				String expenseDate = rs.getString("expenseDate");
				
				ExpenseBean ebean = new ExpenseBean();
				ebean.setTitle(title);
				ebean.setAmount(amount);
				ebean.setCategory(category);
				ebean.setExpenseDate(expenseDate);
				list.add(ebean);
			}
			request.setAttribute("list", list);
			request.getRequestDispatcher("ListExpense.jsp").forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
