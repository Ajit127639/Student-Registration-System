package servlets;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.sql.Connection;
import java.sql.PreparedStatement;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet("/update")
@MultipartConfig
public class UpdateServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

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
            String oldPhoto = request.getParameter("oldPhoto");

            // Photo update logic
            Part photoPart = request.getPart("photo");
            String photoFileName = oldPhoto;
            if (photoPart != null && photoPart.getSize() > 0) {
                String fileName = extractFileName(photoPart);
                if (fileName != null && !fileName.isBlank()) {
                    String uploadPath = getServletContext().getRealPath("") + File.separator + "uploads";
                    File uploadDir = new File(uploadPath);
                    if (!uploadDir.exists()) uploadDir.mkdir();

                    File file = new File(uploadPath + File.separator + fileName);
                    try (InputStream input = photoPart.getInputStream()) {
                        Files.copy(input, file.toPath(), java.nio.file.StandardCopyOption.REPLACE_EXISTING);
                    }
                    photoFileName = fileName;
                }
            }

            try (Connection con = DBUtil.getConnection()) {
                PreparedStatement ps = con.prepareStatement(
                    "UPDATE student SET fname=?, lname=?, fathername=?, dob=?, mobile=?, email=?, password=?, gender=?, department=?, course=?, city=?, address=?, photo=? WHERE rollno=?"
                );

                ps.setString(1, fname);
                ps.setString(2, lname);
                ps.setString(3, fathername);
                ps.setString(4, dob);
                ps.setString(5, mobile);
                ps.setString(6, email);
                ps.setString(7, password);
                ps.setString(8, gender);
                ps.setString(9, department);
                ps.setString(10, course);
                ps.setString(11, city);
                ps.setString(12, address);
                ps.setString(13, photoFileName);
                ps.setInt(14, rollno);

                int rows = ps.executeUpdate();
                if (rows > 0) {
                    response.sendRedirect("view.jsp");
                } else {
                    response.getWriter().println("<h3 style='color:red;text-align:center;'>Update Failed!</h3>");
                }
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
        return null;
    }
}