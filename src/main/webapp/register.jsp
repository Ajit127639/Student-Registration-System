<%@ page import="jakarta.servlet.http.*" %>
<%
    HttpSession Session = request.getSession(false);
   
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Student Registration</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background: linear-gradient(to right, #ffecd2, #fcb69f);
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 30px;
            font-family: Arial, sans-serif;
        }
        .register-card {
            background: #fff;
            border-radius: 10px;
            box-shadow: 0 4px 20px rgba(0,0,0,0.1);
            padding: 25px 30px;
            width: 100%;
            max-width: 700px;
        }
        h2 {
            color: #333;
            font-weight: bold;
            text-align: center;
            margin-bottom: 20px;
        }
        .btn-register {
            width: 100%;
            padding: 12px;
            background-color: #28a745;
            border: none;
            font-size: 18px;
        }
        .btn-register:hover {
            background-color: #1e7e34;
        }
        .btn-view {
            width: 100%;
            margin-top: 10px;
            background-color: #007bff;
            border: none;
        }
        .btn-view:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
    <div class="register-card">
        <h2>Student Registration</h2>
        <form action="register" method="post" enctype="multipart/form-data" class="row g-3">
            <!-- Roll No -->
            <div class="col-md-6">
                <label class="form-label">Roll No</label>
                <input type="text" class="form-control" name="rollno" required>
            </div>

            <!-- Student Name -->
            <div class="col-md-6">
                <label class="form-label">First Name</label>
                <input type="text" class="form-control" name="fname" required>
            </div>
            <div class="col-md-6">
                <label class="form-label">Last Name</label>
                <input type="text" class="form-control" name="lname" required>
            </div>

            <!-- Father's Name -->
            <div class="col-md-6">
                <label class="form-label">Father's Name</label>
                <input type="text" class="form-control" name="fathername" required>
            </div>

            <!-- DOB -->
            <div class="col-md-6">
                <label class="form-label">Date of Birth</label>
                <input type="date" class="form-control" name="dob" required>
            </div>

            <!-- Mobile -->
            <div class="col-md-6">
                <label class="form-label">Mobile No</label>
                <input type="text" class="form-control" name="mobile" required>
            </div>

            <!-- Email -->
            <div class="col-md-6">
                <label class="form-label">Email</label>
                <input type="email" class="form-control" name="email" required>
            </div>

            <!-- Password -->
            <div class="col-md-6">
                <label class="form-label">Password</label>
                <input type="password" class="form-control" name="password" required>
            </div>

            <!-- Gender -->
            <div class="col-md-6">
                <label class="form-label">Gender</label><br>
                <div class="form-check form-check-inline">
                    <input class="form-check-input" type="radio" name="gender" value="Male" required>
                    <label class="form-check-label">Male</label>
                </div>
                <div class="form-check form-check-inline">
                    <input class="form-check-input" type="radio" name="gender" value="Female" required>
                    <label class="form-check-label">Female</label>
                </div>
            </div>

            <!-- Department -->
            <div class="col-md-6">
                <label class="form-label">Department</label><br>
                <div class="form-check form-check-inline">
                    <input class="form-check-input" type="checkbox" name="department" value="CSE">
                    <label class="form-check-label">CSE</label>
                </div>
                <div class="form-check form-check-inline">
                    <input class="form-check-input" type="checkbox" name="department" value="IT">
                    <label class="form-check-label">IT</label>
                </div>
                <div class="form-check form-check-inline">
                    <input class="form-check-input" type="checkbox" name="department" value="ECE">
                    <label class="form-check-label">ECE</label>
                </div>
            </div>

            <!-- Course -->
            <div class="col-md-6">
                <label class="form-label">Course</label>
                <select class="form-select" name="course" required>
                    <option value="">-- Select Course --</option>
                    <option value="B.Tech">B.Tech</option>
                    <option value="M.Tech">M.Tech</option>
                    <option value="BCA">BCA</option>
                    <option value="MCA">MCA</option>
                </select>
            </div>

            <!-- Photo -->
            <div class="col-md-6">
                <label class="form-label">Upload Photo</label>
                <input type="file" class="form-control" name="photo" accept="image/*" >
            </div>

            <!-- City -->
            <div class="col-md-6">
                <label class="form-label">City</label>
                <input type="text" class="form-control" name="city" required>
            </div>

            <!-- Address -->
            <div class="col-md-12">
                <label class="form-label">Address</label>
                <textarea class="form-control" name="address" rows="2" required></textarea>
            </div>

            <!-- Buttons -->
            <div class="col-md-12">
                <button type="submit" class="btn btn-register">Register</button>
                
            </div>
        </form>
    </div>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>