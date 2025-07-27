<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*,servlets.DBUtil"%>

<%
    HttpSession Session= request.getSession(false);
    if (Session == null || Session.getAttribute("admin") == null) {
        response.sendRedirect("admin_login.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>View Students</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f3f3f3;
            text-align: center;
        }
        table {
            width: 100%;
            margin: 20px auto;
            border-collapse: collapse;
            background-color: white;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
        }
        th, td {
            padding: 10px;
            border: 1px solid #ddd;
            text-align: center;
        }
        th {
            background-color: #4CAF50;
            color: white;
        }
        img {
            width: 70px;
            height: 70px;
            border-radius: 5px;
        }
        a {
            text-decoration: none;
            padding: 5px 10px;
            background: #f44336;
            color: white;
            border-radius: 5px;
        }
        a:hover {
            background: #c0392b;
        }
    </style>
</head>
<body>
    <h2>Student Records</h2>

    <table>
        <tr>
            <th>Roll No</th>
            <th>Name</th>
            <th>Father's Name</th>
            <th>DOB</th>
            <th>Mobile</th>
            <th>Email</th>
            <th>Gender</th>
            <th>Department</th>
            <th>Course</th>
            <th>City</th>
            <th>Address</th>
            <th>Photo</th>
            <th>Action</th>
        </tr>

        <%
            try {
                Connection con = DBUtil.getConnection();
                Statement st = con.createStatement();
                ResultSet rs = st.executeQuery("SELECT * FROM student");

                while (rs.next()) {
        %>
                    <tr>
                        <td><%= rs.getInt("rollno") %></td>
                        <td><%= rs.getString("fname") %> <%= rs.getString("lname") %></td>
                        <td><%= rs.getString("fathername") %></td>
                        <td><%= rs.getString("dob") %></td>
                        <td><%= rs.getString("mobile") %></td>
                        <td><%= rs.getString("email") %></td>
                        <td><%= rs.getString("gender") %></td>
                        <td><%= rs.getString("department") %></td>
                        <td><%= rs.getString("course") %></td>
                        <td><%= rs.getString("city") %></td>
                        <td><%= rs.getString("address") %></td>
                        <td>
                            <img src="uploads/<%= rs.getString("photo") %>" alt="Photo">
                        </td>
                        <td>
                            <a href="edit.jsp?rollno=<%= rs.getInt("rollno") %>" class="btn btn-warning btn-sm">Edit</a>
                            <a href="delete?id=<%= rs.getInt("rollno") %>" onclick="return confirm('Are you sure?')">Delete</a>
                        </td>
                    </tr>
        <%
                }
                con.close();
            } catch (Exception e) {
                out.println("<tr><td colspan='12'>Error: " + e.getMessage() + "</td></tr>");
            }
        %>
        
    </table>
    <a class="reset" href="reset" onclick="return confirm('Are you sure you want to reset the database? All data will be deleted!')">
    Reset Database
</a>
</body>
</html>