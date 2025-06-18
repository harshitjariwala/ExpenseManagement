<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Add Expense</title>
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
        footer {
            background-color: #1f1f1f;
            color: white;
            padding: 15px 0;
            text-align: center;
            position: fixed;
            bottom: 0;
            width: 100%;
        }
        label {
            color: #f1f1f1;
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
        <h2 class="text-center mb-4"><i class="bi bi-plus-circle me-2"></i>Add New Expense</h2>
        <form action="SearchCategoryController" method="post">
            <div class="mb-3">
                <label for="category" class="form-label">Category</label>
                <input type="text" class="form-control" id="category" name="category" required>
            </div>
            <button type="submit" class="btn btn-dark-custom w-100">Submit</button>
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
