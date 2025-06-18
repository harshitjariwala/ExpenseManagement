package com.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bean.ExpenseBean;
import com.dao.ExpenseDao;
import com.util.DBConnection;

@WebServlet("/AddExpenseController")
public class AddExpenseController extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		ExpenseBean expense = new ExpenseBean();
		expense.setTitle(request.getParameter("title"));
		expense.setExpenseDate(request.getParameter("expenseDate"));
		expense.setCategory(request.getParameter("category"));
		expense.setAmount(Integer.parseInt(request.getParameter("amount")));
		
		ExpenseDao dao = new ExpenseDao();
		dao.insertExpense(expense);
		
		response.sendRedirect("ListExpenseController");
	}
}
