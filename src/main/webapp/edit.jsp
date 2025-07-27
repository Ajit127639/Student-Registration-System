<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.sql.*"%>
<%@ page import="servlets.DBUtil" %>

<%
    String rollnoParam = request.getParameter("rollno");
    if (rollnoParam == null || rollnoParam.trim().isEmpty()) {
        out.println("<h3 style='color:red;text-align:center;'>Error: Roll number is missing!</h3>");
        return;
    }


    
    Connection con = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    String fname = "", lname = "", email = "", course = "", city = "", photo = "", fathername = "", dob = "", mobile = "", password = "", gender = "", department = "", address = "";

    try {
        con = DBUtil.getConnection();
        ps = con.prepareStatement("SELECT * FROM student WHERE rollno=?");
        ps.setInt(1, Integer.parseInt(rollnoParam));
        rs = ps.executeQuery();

        if (rs.next()) {
            fname = rs.getString("fname");
            lname = rs.getString("lname");
            fathername = rs.getString("fathername");
            dob = rs.getString("dob");
            mobile = rs.getString("mobile");
            email = rs.getString("email");
            password = rs.getString("password");
            gender = rs.getString("gender");
            department = rs.getString("department");
            course = rs.getString("course");
            city = rs.getString("city");
            address = rs.getString("address");
            photo = rs.getString("photo");
        }
    } catch (Exception e) {
        out.println("<h3 style='color:red;'>Error: " + e.getMessage() + "</h3>");
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit Student</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background: linear-gradient(to right, #ffecd2, #fcb69f);
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 30px;
        }
        .edit-card {
            background: #fff;
            border-radius: 10px;
            padding: 25px 30px;
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.1);
            width: 100%;
            max-width: 700px;
        }
        h2 {
            text-align: center;
            font-weight: bold;
            margin-bottom: 20px;
        }
        .btn-update {
            background-color: #007bff;
            color: white;
            width: 100%;
        }
        .btn-update:hover {
            background-color: #0056b3;
        }
        .btn-back {
            margin-top: 10px;
            background-color: #6c757d;
            color: white;
            width: 100%;
        }
        .btn-back:hover {
            background-color: #5a6268;
        }
        img {
            max-width: 100px;
            border-radius: 50%;
            display: block;
            margin: 10px auto;
        }
    </style>
</head>
<body>
    <div class="edit-card">
        <h2>Edit Student</h2>
        <form action="update" method="post" enctype="multipart/form-data" class="row g-3">
            <input type="hidden" name="rollno" value="<%= rollnoParam %>">
            <input type="hidden" name="oldPhoto" value="<%= photo %>">

            <!-- First Name -->
            <div class="col-md-6">
                <label class="form-label">First Name</label>
                <input type="text" class="form-control" name="fname" value="<%= fname %>" required>
            </div>

            <!-- Last Name -->
            <div class="col-md-6">
                <label class="form-label">Last Name</label>
                <input type="text" class="form-control" name="lname" value="<%= lname %>" required>
            </div>

            <!-- Father's Name -->
            <div class="col-md-12">
                <label class="form-label">Father's Name</label>
                <input type="text" class="form-control" name="fathername" value="<%= fathername %>" required>
            </div>

            <!-- DOB -->
            <div class="col-md-12">
                <label class="form-label">Date of Birth</label>
                <input type="date" class="form-control" name="dob" value="<%= dob %>" required>
            </div>

            <!-- Mobile -->
            <div class="col-md-12">
                <label class="form-label">Mobile</label>
                <input type="text" class="form-control" name="mobile" value="<%= mobile %>" required>
            </div>

            <!-- Email -->
            <div class="col-md-12">
                <label class="form-label">Email</label>
                <input type="email" class="form-control" name="email" value="<%= email %>" required>
            </div>

            <!-- Password -->
            <div class="col-md-12">
                <label class="form-label">Password</label>
                <input type="password" class="form-control" name="password" value="<%= password %>" required>
            </div>

            <!-- Gender -->
            <div class="col-md-12">
                <label class="form-label">Gender</label><br>
                <input type="radio" name="gender" value="Male" <%= "Male".equals(gender) ? "checked" : "" %>> Male
                <input type="radio" name="gender" value="Female" <%= "Female".equals(gender) ? "checked" : "" %>> Female
            </div>

            <!-- Department -->
            <div class="col-md-12">
                <label class="form-label">Department</label>
                <input type="text" class="form-control" name="department" value="<%= department %>" required>
            </div>

            <!-- Course -->
            <div class="col-md-12">
                <label class="form-label">Course</label>
                <select class="form-select" name="course" required>
                    <option value="B.Tech" <%= "B.Tech".equals(course) ? "selected" : "" %>>B.Tech</option>
                    <option value="M.Tech" <%= "M.Tech".equals(course) ? "selected" : "" %>>M.Tech</option>
                    <option value="BCA" <%= "BCA".equals(course) ? "selected" : "" %>>BCA</option>
                    <option value="MCA" <%= "MCA".equals(course) ? "selected" : "" %>>MCA</option>
                </select>
            </div>

            <!-- City -->
            <div class="col-md-12">
                <label class="form-label">City</label>
                <input type="text" class="form-control" name="city" value="<%= city %>" required>
            </div>

            <!-- Address -->
            <div class="col-md-12">
                <label class="form-label">Address</label>
                <textarea class="form-control" name="address" rows="3" required><%= address %></textarea>
            </div>

            <!-- Photo -->
            <div class="col-md-12 text-center">
                <img src="uploads/<%= photo %>" alt="Student Photo">
                <label class="form-label">Change Photo</label>
                <input type="file" class="form-control" name="photo" accept="image/*">
            </div>

            <!-- Buttons -->
            <div class="col-md-12">
                <button type="submit" class="btn btn-update">Update Student</button>
                <a href="view.jsp" class="btn btn-back">Back to View</a>
            </div>
        </form>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>