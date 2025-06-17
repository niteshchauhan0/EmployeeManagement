<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="jakarta.servlet.http.*,jakarta.servlet.*" %>
<%
    if (session == null || session.getAttribute("empId") == null) {
        response.sendRedirect("login.jsp");
        return;
    }

    String empName = (String) session.getAttribute("empName");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Dashboard | EMS</title>
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
            border: none;
            border-radius: 20px;
            padding: 40px 30px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.35);
            color: #fff;
            text-align: center;
            width: 100%;
            max-width: 460px;
        }

        h3 {
            margin-bottom: 30px;
            font-weight: 600;
        }

        .dashboard-links .btn {
            margin-bottom: 15px;
            width: 100%;
            padding: 12px;
            font-weight: 500;
            border-radius: 10px;
        }

        .btn-custom {
            background: linear-gradient(135deg, #6b21a8, #4f46e5);
            border: none;
            color: #fff;
            transition: all 0.3s ease-in-out;
        }

        .btn-custom:hover {
            background: linear-gradient(135deg, #4f46e5, #6b21a8);
        }

        .btn-outline-light:hover {
            background-color: rgba(255, 255, 255, 0.2);
        }

        .toggle-mode {
            position: fixed;
            top: 20px;
            right: 20px;
            z-index: 999;
        }

        .dark-mode {
            background-color: #121212 !important;
            color: white;
        }

        .dark-mode .card {
            background-color: rgba(20, 20, 20, 0.9);
        }

        .dark-mode .btn-outline-light {
            color: #fff;
            border-color: #ccc;
        }

        .dark-mode .btn-custom {
            background: linear-gradient(135deg, #8e44ad, #6a0dad);
        }

        .bi {
            margin-right: 8px;
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

<!-- Dashboard Card -->
<div class="card">
    <h3>Welcome, <%= empName %> 👋</h3>
    <div class="dashboard-links">
        <a href="ViewProfileServlet" class="btn btn-outline-light">
            <i class="bi bi-person-lines-fill"></i> View Profile
        </a>
        <a href="UpdateProfileServlet" class="btn btn-outline-light">
            <i class="bi bi-pencil-square"></i> Update Profile
        </a>
        <a href="LogoutServlet" class="btn btn-custom">
            <i class="bi bi-box-arrow-right"></i> Logout
        </a>
    </div>
</div>

<!-- Bootstrap & Dark Mode Script -->
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
