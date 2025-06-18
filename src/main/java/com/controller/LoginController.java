package com.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bean.UserBean;
import com.dao.UserDao;

@WebServlet("/LoginController")
public class LoginController extends HttpServlet{
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		
		UserBean user = new UserBean();
		user.setEmail(email);
		user.setPassword(password);
		
		UserDao dao = new UserDao();
		int userId = dao.getUserId(user);
		UserBean user2 = dao.getUserById(userId);
		
		if(user2.getPassword().equals(user.getPassword())) {
			HttpSession session = request.getSession();
			session.setAttribute("user",user2);
			Cookie cookie = new Cookie("userName",user2.getFirstName());
			response.addCookie(cookie);
			request.getRequestDispatcher("Index.jsp").forward(request, response);
			//response.sendRedirect("Index.jsp");
		}
		else {
			request.setAttribute("email", email);
			request.setAttribute("password", password);
			request.setAttribute("passwordError","Incorrect Password");
			request.getRequestDispatcher("Login.jsp").forward(request, response);
		}
	}
}
