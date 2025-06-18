package com.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bean.ExpenseBean;
import com.bean.UserBean;
import com.util.DBConnection;

@WebServlet("/ListSumCategoryController")
public class ListSumCategoryController extends HttpServlet{

	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		try {
			Connection conn = DBConnection.getConnection();
			PreparedStatement pstmt = conn.prepareStatement("select category, SUM(amount) from expenses where userId = ? GROUP BY category");
			HttpSession session = request.getSession();
			UserBean user = (UserBean) session.getAttribute("user");
			int userId = user.getUserId();
			pstmt.setInt(1,userId);
			ResultSet rs = pstmt.executeQuery();
			ArrayList<ExpenseBean> list = new ArrayList<ExpenseBean>();
			
			while(rs.next()) {
				String category = rs.getString("category");
				int amount = rs.getInt("SUM(amount)");
				ExpenseBean ebean = new ExpenseBean();
				ebean.setAmount(amount);
				ebean.setCategory(category);
				list.add(ebean);
			}
			request.setAttribute("list", list);
			request.getRequestDispatcher("ListSumCategory.jsp").forward(request, response);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}
