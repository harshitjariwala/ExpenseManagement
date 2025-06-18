package com.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
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

@WebServlet("/ListExpenseController")
public class ListExpenseController extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ArrayList<ExpenseBean> list = new ArrayList<>();
		try {
			Connection conn = DBConnection.getConnection();
			PreparedStatement pstmt = conn.prepareStatement("select * from expenses where userId = ?");
			HttpSession session = request.getSession();
			UserBean user = (UserBean) session.getAttribute("user");
			int userId = user.getUserId();
			pstmt.setInt(1,userId);
			ResultSet rs = pstmt.executeQuery();
			
			while(rs.next()) {
				int expenseId = rs.getInt("expenseId");
				String title = rs.getString("title");
				int amount = rs.getInt("amount");
				String category = rs.getString("category");
				String expenseDate = rs.getString("expenseDate");
				
				ExpenseBean bean = new ExpenseBean();
				bean.setExpenseId(expenseId);
				bean.setTitle(title);
				bean.setAmount(amount);
				bean.setExpenseDate(expenseDate);
				bean.setCategory(category);
				list.add(bean);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		request.setAttribute("list",list);
		RequestDispatcher rd = request.getRequestDispatcher("ListExpense.jsp");
		rd.forward(request,response);
	}
}
