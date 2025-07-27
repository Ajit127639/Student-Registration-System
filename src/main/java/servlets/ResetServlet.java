package servlets;

import java.io.*;
import java.sql.*;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;


@WebServlet("/reset")
public class ResetServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            Connection con = DBUtil.getConnection();
            Statement st = con.createStatement();

           
            st.executeUpdate("DELETE FROM student");

           
            st.executeUpdate("ALTER TABLE student AUTO_INCREMENT = 1");

            con.close();
            response.sendRedirect("view.jsp"); 

        } catch (Exception e) {
            response.getWriter().println("<h3 style='color:red;text-align:center;'>Error: " + e.getMessage() + "</h3>");
        }
    }
}