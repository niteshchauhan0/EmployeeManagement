<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>View Profile | EMS</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Bootstrap + Icons -->
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
            overflow: hidden;
        }

        .card {
            background: rgba(255, 255, 255, 0.07);
            backdrop-filter: blur(14px);
            border-radius: 20px;
            padding: 40px 30px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.35);
            color: white;
            width: 100%;
            max-width: 520px;
            text-align: center;
        }

        h4 {
            font-weight: 600;
            margin-bottom: 30px;
        }

        .info-item {
            font-size: 18px;
            margin-bottom: 15px;
        }

        .info-item i {
            margin-right: 6px;
            color: #ccc;
        }

        .btn-custom {
            background: linear-gradient(135deg, #6b21a8, #4f46e5);
            border: none;
            color: #fff;
            font-weight: 500;
            border-radius: 10px;
            transition: all 0.3s ease;
        }

        .btn-custom:hover {
            background: linear-gradient(135deg, #4f46e5, #6b21a8);
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

        .dark-mode .btn-custom {
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

<!-- Profile Display -->
<div class="card">
    <h4><i class="bi bi-person-lines-fill"></i> Your Profile</h4>
    <div class="info-item"><i class="bi bi-person-badge"></i> <strong>ID:</strong> ${emp_id}</div>
    <div class="info-item"><i class="bi bi-person-fill"></i> <strong>Name:</strong> ${name}</div>
    <div class="info-item"><i class="bi bi-envelope"></i> <strong>Email:</strong> ${email}</div>
    <a href="dashboard.jsp" class="btn btn-custom mt-4">
        <i class="bi bi-arrow-left-circle"></i> Back to Dashboard
    </a>
</div>

<!-- Bootstrap + Dark Mode Script -->
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
