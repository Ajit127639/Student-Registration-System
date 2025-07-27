package servlets;

import java.io.*;
import java.sql.*;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;


@WebServlet("/delete")
public class DeleteServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            int rollno = Integer.parseInt(request.getParameter("id"));

            Connection con = DBUtil.getConnection();
            PreparedStatement ps = con.prepareStatement("DELETE FROM student WHERE rollno=?");
            ps.setInt(1, rollno);

            int rows = ps.executeUpdate();
            con.close();

            if (rows > 0) {
                response.sendRedirect("view.jsp"); 
            } else {
                response.getWriter().println("<h3 style='color:red;text-align:center;'>Delete Failed!</h3>");
            }

        } catch (Exception e) {
            response.getWriter().println("<h3 style='color:red;text-align:center;'>Error: " + e.getMessage() + "</h3>");
        }
    }
}