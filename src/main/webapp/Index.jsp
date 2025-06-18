<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored = "false"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Expense Tracker</title>
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
        .main-container {
            margin-top: 150px;
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
            transition: all 0.3s ease;
        }
        .btn-dark-custom:hover {
            background-color: #495057;
            transform: scale(1.05);
            box-shadow: 0 0 12px rgba(255, 255, 255, 0.2);
        }
        .btn-outline-light {
            transition: all 0.3s ease;
        }
        .btn-outline-light:hover {
            background-color: #f8f9fa;
            color: #212529;
            transform: scale(1.05);
            box-shadow: 0 0 12px rgba(255, 255, 255, 0.3);
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
        .hero-img {
            width: 100px;
            height: 100px;
            object-fit: contain;
            margin-bottom: 20px;
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
    <span style="color = red">${cookie.userName.value}</span>
    <a href="LogoutController">Logout</a>
</header>

<!-- Main Content -->
<div class="container d-flex justify-content-center main-container">
    <div class="card-box text-center w-100" style="max-width: 550px;">
        <!-- Optional Hero Image -->
        <img src="https://cdn-icons-png.flaticon.com/512/3135/3135715.png" alt="Wallet Icon" class="hero-img">
        <h2 class="mb-4">Manage Your Expenses</h2>
        <div class="d-grid gap-3">
            <a href="AddExpense.jsp" class="btn btn-dark-custom btn-lg">
                <i class="bi bi-plus-circle me-2"></i>Add Expense
            </a>
            <a href="ListExpenseController" class="btn btn-outline-light btn-lg">
                <i class="bi bi-list-ul me-2"></i>List Expenses
            </a>
            <a href="ListSumCategoryController" class="btn btn-outline-light btn-lg">
                <i class="bi bi-list-ul me-2"></i>List Category Wise expense
            </a>
            <a href="SearchExpense.jsp" class="btn btn-outline-light btn-lg">
                <i class="bi bi-list-ul me-2"></i>Search Category
            </a>
        </div>
    </div>
</div>

<!-- Footer -->
<footer>
    <p>&copy; 2025 Expense Tracker. All rights reserved.</p>
</footer>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.5/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
