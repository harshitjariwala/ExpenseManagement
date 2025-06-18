<%@page import="com.bean.ExpenseBean"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Category Wise Expense</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css" rel="stylesheet">
    <style>
        body {
            background-color: #2CF6B3;
            color: #f1f1f1;
        }
        header {
            background-color: #1f1f1f;
            color: white;
            padding: 20px 0;
            text-align: center;
            position: relative;
        }
        .header-icons {
            position: absolute;
            left: 20px;
            top: 50%;
            transform: translateY(-50%);
        }
        .header-icons i {
            font-size: 1.5rem;
            color: #f1f1f1;
            cursor: pointer;
            transition: all 0.3s ease;
        }
        .header-icons i:hover {
            color: #2CF6B3;
            transform: scale(1.2);
        }
        .table-container {
            margin-top: 100px;
            margin-bottom: 80px;
        }
        .custom-table {
            background-color: #212529;
            border-radius: 15px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.5);
            padding: 30px;
            color: #f1f1f1;
        }
        .table thead {
            background-color: #343a40;
            color: #f1f1f1;
        }
        .table tbody tr {
            background-color: #2d2d2d;
        }
        .table tbody tr:hover {
            background-color: #3e3e3e;
        }
        footer {
            background-color: #1f1f1f;
            color: white;
            padding: 15px 0;
            text-align: center;
            position: fixed;
            bottom: 0;
            width: 100%;
        }
    </style>
</head>
<body>

<!-- Header -->
<header>
    <div class="header-icons">
        <a href="Index.jsp"><i class="bi bi-house-door-fill"></i></a>
    </div>
    <h1><i class="bi bi-cash-stack me-2"></i>Expense Tracker</h1>
</header>

<!-- Table Section -->
<div class="container d-flex justify-content-center table-container">
    <div class="custom-table w-100" style="max-width: 800px;">
        <h2 class="text-center mb-4"><i class="bi bi-list-ul me-2"></i>Category Wise Expenses</h2>
        <table class="table table-hover table-dark text-center align-middle">
            <thead>
                <tr>
                    <th>Category</th>
                    <th>Total Amount (₹)</th>
                </tr>
            </thead>
            <tbody>
                <%
                    ArrayList<ExpenseBean> list = (ArrayList<ExpenseBean>) request.getAttribute("list");
                    if (list != null && !list.isEmpty()) {
                        for (ExpenseBean e : list) {
                %>
                    <tr>
                        <td><%= e.getCategory() %></td>
                        <td>&#8377;<%= e.getAmount() %></td>
                    </tr>
                <%
                        }
                    } else {
                %>
                    <tr>
                        <td colspan="2" class="text-center text-muted">No category-wise data available</td>
                    </tr>
                <%
                    }
                %>
            </tbody>
        </table>
    </div>
</div>

<!-- Footer -->
<footer>
    <p>&copy; 2025 Expense Tracker. All rights reserved.</p>
</footer>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.5/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
