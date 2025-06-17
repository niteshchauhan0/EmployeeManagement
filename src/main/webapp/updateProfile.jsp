<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Update Profile | EMS</title>
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
            overflow: hidden;
        }

        .form-card {
            background: rgba(255, 255, 255, 0.07);
            backdrop-filter: blur(14px);
            border-radius: 20px;
            padding: 40px 30px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.35);
            color: white;
            width: 100%;
            max-width: 520px;
        }

        h4 {
            font-weight: 600;
            margin-bottom: 30px;
        }

        .form-control {
            border-radius: 10px;
            font-size: 16px;
        }

        label {
            font-weight: 500;
            margin-bottom: 5px;
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

        .btn-outline-light {
            border-radius: 10px;
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

        .dark-mode .form-card {
            background-color: rgba(20, 20, 20, 0.9);
        }

        .dark-mode .form-control {
            background-color: #2b2b2b;
            color: white;
            border: 1px solid #444;
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

<!-- Update Profile Form -->
<div class="form-card">
    <h4><i class="bi bi-pencil-square"></i> Update Profile</h4>
    <form action="UpdateProfileServlet" method="post">
        <input type="hidden" name="empId" value="${emp_id}" />

        <div class="mb-3">
            <label for="name" class="form-label"><i class="bi bi-person-fill"></i> Name</label>
            <input type="text" class="form-control" id="name" name="name" value="${name}" required>
        </div>

        <div class="mb-3">
            <label for="email" class="form-label"><i class="bi bi-envelope"></i> Email</label>
            <input type="email" class="form-control" id="email" name="email" value="${email}" required>
        </div>

        <button type="submit" class="btn btn-custom w-100 mt-3">
            <i class="bi bi-check-circle-fill"></i> Save Changes
        </button>

        <a href="dashboard.jsp" class="btn btn-outline-light w-100 mt-2">
            <i class="bi bi-arrow-left"></i> Cancel
        </a>
    </form>
</div>

<!-- Bootstrap & Dark Mode Logic -->
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
