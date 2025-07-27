package servlets;

import java.io.*;
import java.nio.file.Files;
import java.sql.*;
import jakarta.servlet.*;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;


@WebServlet("/register")
@MultipartConfig 
public class RegisterServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html");

        try {
           
            int rollno = Integer.parseInt(request.getParameter("rollno"));
            String fname = request.getParameter("fname");
            String lname = request.getParameter("lname");
            String fathername = request.getParameter("fathername");
            String dob = request.getParameter("dob"); 
            String mobile = request.getParameter("mobile");
            String email = request.getParameter("email");
            String password = request.getParameter("password");
            String gender = request.getParameter("gender");
            String department = request.getParameter("department");
            String course = request.getParameter("course");
            String city = request.getParameter("city");
            String address = request.getParameter("address");

           
            Part photoPart = request.getPart("photo");
            String photoFileName = null;
            if (photoPart != null && photoPart.getSize() > 0) {
                photoFileName = extractFileName(photoPart);
                String uploadPath = getServletContext().getRealPath("") + File.separator + "uploads";
                File uploadDir = new File(uploadPath);
                if (!uploadDir.exists()) uploadDir.mkdir();

                File file = new File(uploadPath + File.separator + photoFileName);
                try (InputStream input = photoPart.getInputStream()) {
                    Files.copy(input, file.toPath());
                }
            }

           
            Connection con = DBUtil.getConnection();
            PreparedStatement ps = con.prepareStatement(
                    "INSERT INTO student (rollno, fname, lname, fathername, dob, mobile, email, password, gender, department, course, photo, city, address) " +
                    "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)"
            );

            ps.setInt(1, rollno);
            ps.setString(2, fname);
            ps.setString(3, lname);
            ps.setString(4, fathername);
            ps.setString(5, dob);
            ps.setString(6, mobile);
            ps.setString(7, email);
            ps.setString(8, password);
            ps.setString(9, gender);
            ps.setString(10, department);
            ps.setString(11, course);
            ps.setString(12, photoFileName);
            ps.setString(13, city);
            ps.setString(14, address);

            int row = ps.executeUpdate();

            if (row > 0) {
                response.getWriter().println("<h3 style='color:green;text-align:center;'>Registration Successful!</h3>");
                
            } else {
                response.getWriter().println("<h3 style='color:red;text-align:center;'>Registration Failed!</h3>");
            }

        } catch (Exception e) {
            response.getWriter().println("<h3 style='color:red;text-align:center;'>Error: " + e.getMessage() + "</h3>");
        }
    }

    private String extractFileName(Part part) {
        String contentDisp = part.getHeader("content-disposition");
        for (String cd : contentDisp.split(";")) {
            if (cd.trim().startsWith("filename")) {
                return cd.substring(cd.indexOf('=') + 2, cd.length() - 1);
            }
        }
        return "default.png";
    }
}