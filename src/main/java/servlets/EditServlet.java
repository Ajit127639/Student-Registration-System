package servlets;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet("/edit")
public class EditServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String rollStr = request.getParameter("rollno");
        if (rollStr == null) {
            response.sendRedirect("view.jsp");
            return;
        }

        try (Connection con = DBUtil.getConnection()) {
            PreparedStatement ps = con.prepareStatement("SELECT * FROM student WHERE rollno = ?");
            ps.setInt(1, Integer.parseInt(rollStr));
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                request.setAttribute("rollno", rs.getInt("rollno"));
                request.setAttribute("fname", rs.getString("fname"));
                request.setAttribute("lname", rs.getString("lname"));
                request.setAttribute("fathername", rs.getString("fathername"));
                request.setAttribute("dob", rs.getString("dob"));
                request.setAttribute("mobile", rs.getString("mobile"));
                request.setAttribute("email", rs.getString("email"));
                request.setAttribute("password", rs.getString("password"));
                request.setAttribute("gender", rs.getString("gender"));
                request.setAttribute("department", rs.getString("department"));
                request.setAttribute("course", rs.getString("course"));
                request.setAttribute("city", rs.getString("city"));
                request.setAttribute("address", rs.getString("address"));
                request.setAttribute("photo", rs.getString("photo"));

                request.getRequestDispatcher("edit.jsp").forward(request, response);
            } else {
                response.getWriter().println("No student found with Roll No: " + rollStr);
            }
        } catch (Exception e) {
            response.getWriter().println("Error: " + e.getMessage());
        }
    }
}