<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="jakarta.servlet.http.*"%>



<%
    HttpSession Session = request.getSession(false);
    if (Session == null || session.getAttribute("admin") == null) {
        response.sendRedirect("admin_login.jsp");
        return;
    }
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            display: flex;
            height: 100vh;
            overflow: hidden;
            background-color: #f8f9fa;
        }
        .sidebar {
            width: 250px;
            background-color: #343a40;
            color: white;
            padding: 20px;
            display: flex;
            flex-direction: column;
            justify-content: space-between;
        }
        .sidebar h3 {
            text-align: center;
            margin-bottom: 30px;
        }
        .sidebar a {
            color: white;
            text-decoration: none;
            padding: 10px 15px;
            display: block;
            border-radius: 5px;
            margin-bottom: 10px;
            background-color: #495057;
        }
        .sidebar a:hover {
            background-color: #6c757d;
        }
        .main-content {
            flex: 1;
            padding: 30px;
            overflow-y: auto;
        }
        .logout-btn {
            background-color: #dc3545;
            border: none;
            width: 100%;
            padding: 10px;
            border-radius: 5px;
            text-align: center;
        }
        .logout-btn:hover {
            background-color: #b52a3a;
        }
    </style>
</head>
<body>
    <!-- Sidebar -->
    <div class="sidebar">
        <div>
            <h3>Admin Panel</h3>
            <p>Welcome, <b> admin </b></p>
            <a href="view.jsp">View Students</a>
            <a href="register.jsp">Add Student</a>
        </div>
        <form action="logout" method="post">
            <button type="submit" class="logout-btn">Logout</button>
        </form>
    </div>

    <!-- Main Content -->
    <div class="main-content">
        <h2>Dashboard</h2>
        <p>Select an option from the menu to manage students.</p>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>