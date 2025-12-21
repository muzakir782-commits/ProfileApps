package controller;

import java.io.IOException;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import model.ProfileBean;

@WebServlet("/ProfileServlet")
public class ProfileServlet extends HttpServlet {
    private static final String DB_URL = "jdbc:derby://localhost:1527/student_profiles;create=true";
    private static final String DB_USER = "app";
    private static final String DB_PASSWORD = "app";

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");

        // Get form data
        String name = request.getParameter("name");
        String studentId = request.getParameter("studentId");
        String program = request.getParameter("program");
        String email = request.getParameter("email");
        String hobbies = request.getParameter("hobbies");
        String intro = request.getParameter("intro");

        // Create ProfileBean object
        ProfileBean profile = new ProfileBean();
        profile.setName(name);
        profile.setStudentId(studentId);
        profile.setProgram(program);
        profile.setEmail(email);
        profile.setHobbies(hobbies);
        profile.setIntro(intro);

        // Save to database
        try {
            Class.forName("org.apache.derby.jdbc.ClientDriver");
            Connection con = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);

            String sql = "INSERT INTO profiles (name, student_id, program, email, hobbies, intro) VALUES (?, ?, ?, ?, ?, ?)";
            PreparedStatement pst = con.prepareStatement(sql);
            pst.setString(1, profile.getName());
            pst.setString(2, profile.getStudentId());
            pst.setString(3, profile.getProgram());
            pst.setString(4, profile.getEmail());
            pst.setString(5, profile.getHobbies());
            pst.setString(6, profile.getIntro());

            pst.executeUpdate();
            pst.close();
            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }

        // Forward to profile.jsp to display
        request.setAttribute("profile", profile);
        RequestDispatcher rd = request.getRequestDispatcher("profile.jsp");
        rd.forward(request, response);
    }
}
