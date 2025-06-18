<%@page import="com.bean.ExpenseBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Update Expense</title>
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
        }
        .main-container {
            margin-top: 100px;
            margin-bottom: 80px;
        }
        .card-box {
            background-color: #212529;
            padding: 30px;
            border-radius: 15px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.5);
        }
        .btn-dark-custom {
            background-color: #343a40;
            border: none;
        }
        .btn-dark-custom:hover {
            background-color: #495057;
        }
        label {
            color: #f1f1f1;
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
    <h1><i class="bi bi-cash-stack me-2"></i>Expense Tracker</h1>
</header>

<!-- Form Section -->
<div class="container d-flex justify-content-center main-container">
    <div class="card-box w-100" style="max-width: 600px;">
        <h2 class="text-center mb-4"><i class="bi bi-pencil-square me-2"></i>Update Expense</h2>

        <%
            ExpenseBean bean = (ExpenseBean) request.getAttribute("bean");
        %>

        <form action="UpdateExpenseController2?expenseId=<%=bean.getExpenseId() %>" method="post">
            <div class="mb-3">
                <label for="title" class="form-label">Title</label>
                <input type="text" class="form-control" id="title" name="title" value="<%=bean.getTitle() %>" required>
            </div>
            <div class="mb-3">
                <label for="expenseDate" class="form-label">Expense Date</label>
                <input type="date" class="form-control" id="expenseDate" name="expenseDate" value="<%=bean.getExpenseDate()%>" required>
            </div>
            <div class="mb-3">
                <label for="category" class="form-label">Category</label>
                <input type="text" class="form-control" id="category" name="category" value="<%=bean.getCategory() %>" required>
            </div>
            <div class="mb-3">
                <label for="amount" class="form-label">Amount (₹)</label>
                <input type="number" step="0.01" class="form-control" id="amount" name="amount" value="<%=bean.getAmount() %>" required>
            </div>
            <button type="submit" class="btn btn-dark-custom w-100">
                <i class="bi bi-check-circle me-2"></i>Submit
            </button>
        </form>
    </div>
</div>

<!-- Footer -->
<footer>
    <p>&copy; 2025 Expense Tracker. All rights reserved.</p>
</footer>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.5/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
