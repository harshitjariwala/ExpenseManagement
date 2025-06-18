package com.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;

import com.bean.UserBean;
import com.dao.UserDao;

@WebFilter("/SignupController")
public class SignupFilterCUniqueEmail implements Filter{

	public void init(FilterConfig filterConfig) throws ServletException {
	
	}

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		String email = request.getParameter("email");
		
		UserBean user = new UserBean();
		user.setEmail(email);
		
		UserDao dao = new UserDao();
		int userId = dao.getUserId(user);
		
		if(userId != 0) {
			request.setAttribute("firstName", request.getParameter("firstName"));
			request.setAttribute("email", email);
			request.setAttribute("password", request.getParameter("password"));
			request.setAttribute("emailError", "Email Id already exists");
			request.getRequestDispatcher("Signup.jsp").forward(request, response);
		}
		else {
			chain.doFilter(request, response);
		}
	}

	public void destroy() {
		
	}

}
