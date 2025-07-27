<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Student Signup</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background: linear-gradient(to right, #6a11cb, #2575fc);
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            color: #fff;
        }
        .signup-card {
            background: rgba(255, 255, 255, 0.1);
            backdrop-filter: blur(10px);
            padding: 30px;
            border-radius: 15px;
            box-shadow: 0 4px 20px rgba(0,0,0,0.3);
            width: 100%;
            max-width: 400px;
        }
        .form-control {
            margin-bottom: 15px;
        }
        .btn-signup {
            background-color: #007bff;
            border: none;
            width: 100%;
        }
        .btn-signup:hover {
            background-color: #0056b3;
        }
        a {
            color: #fff;
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <div class="signup-card">
        <h2 class="text-center mb-4">Student Signup</h2>
        <form action="studentsignup" method="post">
            <input type="text" class="form-control" name="uid" placeholder="Enter UID" required>
            <input type="password" class="form-control" name="password" placeholder="Enter Password" required>
            <button type="submit" class="btn btn-signup">Sign Up</button>
        </form>
        <p class="mt-3 text-center">Already have an account? <a href="student_login.jsp">Login here</a></p>
    </div>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>