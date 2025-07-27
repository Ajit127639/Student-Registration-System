package servlets;

import java.io.*;
import java.sql.*;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
@WebServlet("/studentlogin")
public class StudentLoginServlet extends HttpServlet {
   
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
		response.setContentType("text/html");
        String uid = request.getParameter("uid");
        String password = request.getParameter("password");

        try (Connection con = DBUtil.getConnection()) {
            PreparedStatement ps = con.prepareStatement(
                "SELECT * FROM student_users WHERE uid=? AND password=?"
            );
            ps.setString(1, uid);
            ps.setString(2, password);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                HttpSession session = request.getSession();
                session.setAttribute("student_uid", uid);
                response.sendRedirect("register.jsp"); // Only logged-in students can access this
            } else {
                response.getWriter().println("<h3 style='color:red;'>Invalid login!</h3>");
                response.getWriter().println("<h3 style='color:green;'><a href='student_login.jsp'>Back to Login </a></h3>");
            }
        } catch (Exception e) {
            response.getWriter().println("Error: " + e.getMessage());
        }
    }
}