package com.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;

@WebFilter("/SignupController")
public class SignupFilterARequired implements Filter{

	public void init(FilterConfig filterConfig) throws ServletException {
		
	}

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		String firstName = request.getParameter("firstName");
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		boolean isError = false;
		
		if(firstName.isBlank() || firstName.isEmpty()) {
			request.setAttribute("firstNameError", "First Name is Required");
			isError = true;
		}
		
		if (email.isBlank() || email.isEmpty()) {
			request.setAttribute("emailError", "Email ID is Required");
			isError = true;
		}
		
		if(password.isBlank() || password.isEmpty()) {
			request.setAttribute("passwordError", "Password is Required");
			isError = true;
		}
		
		if(isError) {
			request.setAttribute("firstName", firstName);
			request.setAttribute("email", email);
			request.setAttribute("password", password);
			request.getRequestDispatcher("Signup.jsp").forward(request, response);
		}
		else {
			chain.doFilter(request, response);
		}
		
	}

	public void destroy() {
		
	}
}