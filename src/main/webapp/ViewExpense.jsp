<%@page import="com.bean.ExpenseBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Expense Details</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600&display=swap" rel="stylesheet">
    <style>
        body {
            background-color: #2CF6B3;
            font-family: 'Poppins', sans-serif;
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
            transition: 0.3s;
        }
        .header-icons i:hover {
            color: #2CF6B3;
            transform: scale(1.2);
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
        .info-label {
            font-weight: 500;
            color: #adb5bd;
            font-size: 1rem;
        }
        .info-value {
            font-weight: 600;
            color: #ffffff;
            font-size: 1.05rem;
        }
        .action-btn {
            font-size: 0.95rem;
            font-weight: 500;
            border-radius: 8px;
            padding: 10px 16px;
            transition: all 0.3s ease;
            display: inline-flex;
            align-items: center;
            gap: 5px;
        }
        .btn-update {
            background-color: #facc15;
            color: #212529;
        }
        .btn-update:hover {
            background-color: #eab308;
        }
        .btn-list {
            background-color: #339af0;
            color: white;
        }
        .btn-list:hover {
            background-color: #228be6;
        }
        .btn-add {
            background-color: #51cf66;
            color: #212529;
        }
        .btn-add:hover {
            background-color: #40c057;
        }
        footer {
            background-color: #1f1f1f;
            color: white;
            padding: 15px 0;
            text-align: center;
            position: fixed;
            bottom: 0;
            width: 100%;
            font-size: 0.9rem;
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

<!-- Main Content -->
<div class="container d-flex justify-content-center main-container">
    <div class="card-box w-100" style="max-width: 600px;">
        <%
            ExpenseBean bean = (ExpenseBean) request.getAttribute("bean");
            if (bean != null) {
        %>
        <h2 class="text-center mb-4"><i class="bi bi-receipt-cutoff me-2"></i>Expense Details</h2>
        <p><span class="info-label">Title:</span> <span class="info-value"><%=bean.getTitle()%></span></p>
        <p><span class="info-label">Amount:</span> <span class="info-value">&#8377;<%=bean.getAmount()%></span></p>
        <p><span class="info-label">Category:</span> <span class="info-value"><%=bean.getCategory()%></span></p>
        <p><span class="info-label">Expense Date:</span> <span class="info-value"><%=bean.getExpenseDate()%></span></p>

        <!-- Action Buttons -->
        <div class="d-flex justify-content-center flex-wrap gap-3 mt-4">
            <a href="UpdateExpenseController?expenseId=<%=bean.getExpenseId()%>" class="action-btn btn-update">
                <i class="bi bi-pencil-square"></i> Update
            </a>
            <a href="ListExpenseController" class="action-btn btn-list">
                <i class="bi bi-list-ul"></i> Expense List
            </a>
            <a href="AddExpense.jsp" class="action-btn btn-add">
                <i class="bi bi-plus-circle"></i> Add New
            </a>
        </div>
        <% } else { %>
        <p class="text-center text-muted">No expense details available.</p>
        <% } %>
    </div>
</div>

<!-- Footer -->
<footer>
    <p>&copy; 2025 Expense Tracker. All rights reserved.</p>
</footer>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.5/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
