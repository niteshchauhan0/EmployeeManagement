<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="jakarta.servlet.http.*,jakarta.servlet.*" %>
<%
    String error = (String) request.getAttribute("error");
    String success = (String) request.getAttribute("success");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Register | Employee Management System</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Bootstrap CSS & Icons -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css" rel="stylesheet">

    <style>
        body {
            background: linear-gradient(135deg, #1e3c72, #2a5298);
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            min-height: 100vh;
            margin: 0;
            display: flex;
            align-items: center;
            justify-content: center;
            position: relative;
        }

        .card {
            backdrop-filter: blur(15px);
            background-color: rgba(255, 255, 255, 0.05);
            border: none;
            border-radius: 20px;
            box-shadow: 0 8px 24px rgba(0, 0, 0, 0.3);
            color: #fff;
            padding: 40px 30px;
        }

        .form-control {
            background-color: rgba(255, 255, 255, 0.1);
            border: 1px solid rgba(255, 255, 255, 0.3);
            color: #fff;
        }

        .form-control:focus {
            box-shadow: none;
            border-color: #a0a0ff;
        }

        .btn-primary {
            background: linear-gradient(135deg, #6b21a8, #4f46e5);
            border: none;
            font-weight: 500;
        }

        .btn-primary:hover {
            background: linear-gradient(135deg, #4f46e5, #6b21a8);
        }

        .register-link {
            text-align: center;
            margin-top: 15px;
        }

        .register-link a {
            color: #ccc;
            text-decoration: underline;
        }

        .register-link a:hover {
            color: #ffc107;
        }

        .toggle-mode {
            position: fixed;
            top: 20px;
            right: 20px;
            z-index: 9999;
        }

        .toast-container {
            position: fixed;
            top: 1rem;
            right: 1rem;
            z-index: 1055;
        }

        .dark-mode {
            background-color: #121212 !important;
            color: #fff;
        }

        .dark-mode .card {
            background-color: rgba(20, 20, 20, 0.9);
        }

        .dark-mode .form-control {
            background-color: rgba(255, 255, 255, 0.05);
            color: #fff;
            border-color: #444;
        }

        .dark-mode .btn-primary {
            background: linear-gradient(135deg, #8e44ad, #6a0dad);
        }

        /* Floating background shapes */
        .background-shapes::before,
        .background-shapes::after {
            content: '';
            position: absolute;
            border-radius: 50%;
            opacity: 0.2;
            z-index: 0;
        }

        .background-shapes::before {
            width: 300px;
            height: 300px;
            background: #ff6ec4;
            top: -60px;
            left: -60px;
        }

        .background-shapes::after {
            width: 200px;
            height: 200px;
            background: #7873f5;
            bottom: -50px;
            right: -50px;
        }
    </style>
</head>

<body class="background-shapes">

<!-- Dark Mode Toggle -->
<div class="toggle-mode">
    <button class="btn btn-sm btn-outline-light" onclick="toggleDarkMode()">🌙 Toggle Dark Mode</button>
</div>

<!-- Toast Notifications -->
<% if (error != null) { %>
<div class="toast-container">
    <div class="toast align-items-center text-white bg-danger border-0 show" role="alert">
        <div class="d-flex">
            <div class="toast-body"><%= error %></div>
            <button type="button" class="btn-close btn-close-white me-2 m-auto" data-bs-dismiss="toast" aria-label="Close"></button>
        </div>
    </div>
</div>
<% } else if (success != null) { %>
<div class="toast-container">
    <div class="toast align-items-center text-white bg-success border-0 show" role="alert">
        <div class="d-flex">
            <div class="toast-body"><%= success %></div>
            <button type="button" class="btn-close btn-close-white me-2 m-auto" data-bs-dismiss="toast" aria-label="Close"></button>
        </div>
    </div>
</div>
<% } %>

<!-- Registration Card -->
<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-6 col-lg-5">
            <div class="card">
                <h3 class="text-center mb-4"><i class="bi bi-person-plus-fill"></i> Employee Registration</h3>
                <form action="RegisterServlet" method="post">
                    <div class="mb-3">
                        <label for="empId" class="form-label">Employee ID</label>
                        <input type="text" class="form-control" id="empId" name="empId" required>
                    </div>
                    <div class="mb-3">
                        <label for="name" class="form-label">Full Name</label>
                        <input type="text" class="form-control" id="name" name="name" required>
                    </div>
                    <div class="mb-3">
                        <label for="email" class="form-label">Email Address</label>
                        <input type="email" class="form-control" id="email" name="email" required>
                    </div>
                    <div class="mb-3">
                        <label for="password" class="form-label">Password</label>
                        <input type="password" class="form-control" id="password" name="password" required>
                    </div>
                    <button type="submit" class="btn btn-primary w-100">Register</button>
                </form>

                <div class="register-link">
                    <p>Already have an account? <a href="login.jsp">Login here</a></p>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- Bootstrap JS + Dark Mode -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<script>
    function toggleDarkMode() {
        document.body.classList.toggle("dark-mode");
        localStorage.setItem("darkMode", document.body.classList.contains("dark-mode"));
    }

    window.onload = function () {
        if (localStorage.getItem("darkMode") === "true") {
            document.body.classList.add("dark-mode");
        }
    };
</script>
</body>
</html>
