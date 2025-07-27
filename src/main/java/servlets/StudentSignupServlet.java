package servlets;

import java.io.*;
import java.sql.*;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;


@WebServlet("/studentsignup")
public class StudentSignupServlet extends HttpServlet {
   
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String uid = request.getParameter("uid");
        String password = request.getParameter("password");

        try (Connection con = DBUtil.getConnection()) {
            PreparedStatement ps = con.prepareStatement("INSERT INTO student_users (uid, password) VALUES (?, ?)");
            ps.setString(1, uid);
            ps.setString(2, password);

            int i = ps.executeUpdate();
            if (i > 0) {
                response.sendRedirect("student_login.jsp");
            } else {
                response.getWriter().println("Signup failed!");
            }
        } catch (Exception e) {
            response.getWriter().println("Error: " + e.getMessage());
        }
    }
}