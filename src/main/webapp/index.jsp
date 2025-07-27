<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Online Student Registration System</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background: linear-gradient(to right, #6a11cb, #2575fc);
            color: #fff;
            font-family: 'Arial', sans-serif;
            text-align: center;
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
        }
        .container-box {
            background: rgba(255, 255, 255, 0.1);
            backdrop-filter: blur(10px);
            padding: 40px;
            border-radius: 15px;
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.3);
            width: 100%;
            max-width: 450px;
        }
        h1 {
            font-size: 2rem;
            font-weight: bold;
            margin-bottom: 30px;
        }
        .btn-custom {
            width: 100%;
            margin: 10px 0;
            font-size: 18px;
            padding: 12px;
            border-radius: 8px;
            transition: 0.3s;
        }
        .btn-admin {
            background-color: #007bff;
            border: none;
        }
        .btn-admin:hover {
            background-color: #0056b3;
        }
        .btn-student {
            background-color: #28a745;
            border: none;
        }
        .btn-student:hover {
            background-color: #1e7e34;
        }
    </style>
</head>
<body>
    <div class="container-box">
        <h1>Welcome to Online Student Registration System</h1>
        <a href="admin_login.jsp" class="btn btn-custom btn-admin">Admin Login</a>
        <a href="student_login.jsp" class="btn btn-custom btn-student">Student Registration</a>
    </div>
    

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>