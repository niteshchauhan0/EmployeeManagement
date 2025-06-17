<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="jakarta.servlet.http.*,jakarta.servlet.*" %>
<%
    String error = (String) request.getAttribute("error");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Login | EMS</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Bootstrap & Icons -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css" rel="stylesheet">

    <style>
        body {
            background: linear-gradient(135deg, #1e3c72, #2a5298);
            min-height: 100vh;
            margin: 0;
            display: flex;
            align-items: center;
            justify-content: center;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            overflow: hidden;
            position: relative;
        }

        .card {
            backdrop-filter: blur(15px);
            background: rgba(255, 255, 255, 0.05);
            color: #fff;
            border: none;
            border-radius: 20px;
            padding: 40px 30px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.35);
        }

        .form-control {
            background: rgba(255, 255, 255, 0.1);
            border: 1px solid rgba(255, 255, 255, 0.2);
            color: #fff;
            border-radius: 10px;
        }

        .form-control:focus {
            box-shadow: 0 0 5px #a0a0ff;
            border-color: #a0a0ff;
        }

        .btn-primary {
            background: linear-gradient(135deg, #6b21a8, #4f46e5);
            border: none;
            border-radius: 10px;
            transition: all 0.3s ease-in-out;
        }

        .btn-primary:hover {
            background: linear-gradient(135deg, #4f46e5, #6b21a8);
        }

        .toggle-mode {
            position: fixed;
            top: 20px;
            right: 20px;
            z-index: 999;
        }

        .register-link {
            margin-top: 20px;
            text-align: center;
            font-size: 0.95rem;
        }

        .register-link a {
            color: #ccc;
            text-decoration: underline;
        }

        .register-link a:hover {
            color: #ffc107;
        }

        .dark-mode {
            background-color: #121212 !important;
            color: white;
        }

        .dark-mode .card {
            background-color: rgba(20, 20, 20, 0.9);
        }

        .dark-mode .form-control {
            background-color: rgba(255, 255, 255, 0.05);
            border-color: #444;
        }

        .dark-mode .btn-primary {
            background: linear-gradient(135deg, #8e44ad, #6a0dad);
        }

        .toast-container {
            position: fixed;
            top: 1rem;
            right: 1rem;
            z-index: 1055;
        }

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
            top: -50px;
            left: -50px;
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

<!-- Toast -->
<% if (error != null) { %>
<div class="toast-container">
    <div class="toast align-items-center text-white bg-danger border-0 show" role="alert">
        <div class="d-flex">
            <div class="toast-body"><%= error %></div>
            <button type="button" class="btn-close btn-close-white me-2 m-auto" data-bs-dismiss="toast" aria-label="Close"></button>
        </div>
    </div>
</div>
<% } %>

<!-- Login Card -->
<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-6 col-lg-5">
            <div class="card text-white">
                <h3 class="text-center mb-4 fw-bold">Employee Login</h3>
                <form action="LoginServlet" method="post" autocomplete="off">
                    <div class="mb-3">
                        <label for="empId" class="form-label">Employee ID</label>
                        <input type="text" class="form-control" id="empId" name="empId" required autocomplete="off">
                    </div>
                    <div class="mb-3">
                        <label for="password" class="form-label">Password</label>
                        <input type="password" class="form-control" id="password" name="password" required autocomplete="new-password">
                    </div>
                    <button type="submit" class="btn btn-primary w-100">
                        <i class="bi bi-box-arrow-in-right me-1"></i>Login
                    </button>
                </form>
                <div class="register-link">
                    <p>Don't have an account? <a href="register.jsp">Register here</a></p>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- Bootstrap JS & Dark Mode Logic -->
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
