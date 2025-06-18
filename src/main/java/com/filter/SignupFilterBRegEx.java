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
public class SignupFilterBRegEx implements Filter{

	public void init(FilterConfig filterConfig) throws ServletException {
		
	}

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		String firstName = request.getParameter("firstName");
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		
		String alphaRegex = "[a-zA-Z]+";
		String emailRegex = "[a-zA-Z0-9-_]+@[a-zA-Z]+\\.[a-zA-Z]{2,3}";
		
		int digitCount = 0;
		int specialCount = 0;
		int lowerAlphaCount = 0;
		int upperAlphaCount = 0;
		
		boolean isError = false;
		
		if(firstName.matches(alphaRegex) == false) {
			request.setAttribute("firstNameError","Enter Valid First Name");
			isError = true;
		}
		
		if(email.matches(emailRegex) == false) {
			request.setAttribute("emailError", "Enter Valid Email Id");
			isError = true;
		}
		
		
		for(int i=0; i<password.length(); i++) {
			if(password.charAt(i) >= 65 && password.charAt(i) <= 90) {
				upperAlphaCount++;
			}
			else if(password.charAt(i) >= 97 && password.charAt(i) <= 122) {
				lowerAlphaCount++;
			}
			else if(password.charAt(i) >= 48 && password.charAt(i) <= 57) {
				digitCount++;
			}
			else {
				specialCount++;
			}
		}
		
		if(password.length() < 8) {
			request.setAttribute("passwordError"," Password must be of atleast 8 characters");
			isError = true;
		}
		else if(digitCount == 0) {
			request.setAttribute("passwordError"," Password must contains atleast 1 digit");
			isError = true;
		}
		else if(specialCount == 0) {
			request.setAttribute("passwordError"," Password must contains atleast 1 special character");
			isError = true;
		}
		else if(lowerAlphaCount == 0) {
			request.setAttribute("passwordError"," Password must contains atleast 1 lower case character");
			isError = true;
		}
		else if(upperAlphaCount == 0) {
			request.setAttribute("passwordError"," Password must contains atleast 1 upper case character");
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