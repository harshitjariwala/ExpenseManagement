<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Signup - Expense Tracker</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap" rel="stylesheet">
    <style>
        body {
            background-color: #2CF6B3;
            font-family: 'Poppins', sans-serif;
        }
        .signup-card {
            background-color: #212529;
            color: #fff;
            padding: 30px;
            border-radius: 15px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.4);
        }
        .form-label {
            color: #adb5bd;
        }
        .form-control {
            background-color: #343a40;
            color: #fff;
            border: none;
        }
        .form-control:focus {
            background-color: #3e3e3e;
            color: #fff;
            border-color: #2CF6B3;
            box-shadow: none;
        }
        .btn-signup {
            background-color: #2CF6B3;
            color: #212529;
            font-weight: 600;
        }
        .btn-signup:hover {
            background-color: #20c997;
        }
        .login-link:hover {
            color: #2CF6B3 !important;
            text-decoration: underline;
            transition: color 0.3s ease;
        }
        .error-msg {
            color: #ff6b6b;
            font-size: 0.9rem;
            margin-bottom: 10px;
        }
    </style>
</head>
<body>
<%
	String firstName = (String) request.getAttribute("firstName");
	String email = (String) request.getAttribute("email");
	String password = (String) request.getAttribute("password");
%>
<div class="container d-flex justify-content-center align-items-center" style="min-height: 100vh;">
    <div class="signup-card w-100" style="max-width: 400px;">
        <h2 class="text-center mb-4">Create Account</h2>
        <form action="SignupController" method="post">
            <div class="mb-3">
                <label class="form-label">First Name</label>
                <input type="text" class="form-control" id="firstName" name="firstName" value="<%=firstName == null ? "" : firstName%>">
                <%
                    String firstNameError = (String) request.getAttribute("firstNameError");
                    if (firstNameError != null) {
                %>
                    <div class="error-msg"><%= firstNameError %></div>
                <%
                    }
                %>
            </div>

            <div class="mb-3">
                <label class="form-label">Email Address</label>
                <input type="email" class="form-control" id="email" name="email" value="<%=email == null ? "" : email%>">
                <%
                    String emailError = (String) request.getAttribute("emailError");
                    if (emailError != null) {
                %>
                    <div class="error-msg"><%= emailError %></div>
                <%
                    }
                %>
            </div>

            <div class="mb-4">
                <label class="form-label">Password</label>
                <input type="password" class="form-control" id="password" name="password" value="<%=password == null ? "" : password%>">
                <%
				    String passwordError = (String) request.getAttribute("passwordError");
				    if (passwordError != null) {
				%>
				    <div class="error-msg"><%= passwordError %></div>
				<%
				    } else {
				%>
				    <ul class="text-info small mt-2 ps-3" style="opacity: 0.9;">
				        <li>Password must be at least 8 characters long</li>
				        <li>Include at least 1 digit</li>
				        <li>Include at least 1 special character</li>
				        <li>Include at least 1 lowercase letter</li>
				        <li>Include at least 1 uppercase letter</li>
				    </ul>
				<%
				    }
				%>


            </div>

            <button type="submit" class="btn btn-signup w-100">Sign Up</button>
        </form>

        <p class="text-center mt-3">
            <a href="Login.jsp" class="text-decoration-none text-light-emphasis login-link">
                Already signed up? <span class="fw-semibold">Login here</span>
            </a>
        </p>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.5/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
