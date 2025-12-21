<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html>
<head>
    <title>All Student Profiles</title>
    <link rel="stylesheet" href="styles.css">
</head>
<body>

<div class="card">

    <!-- TOP BACK BUTTON -->
    <div style="margin-bottom:10px;">
        <a href="index.html" style="text-decoration:none;">
            <button type="button">&lt;</button>
        </a>
    </div>

    <h2>All Student Profiles</h2>

    <!-- Search Form -->
    <form method="get">
        <label class="label">Search by Name or Student ID</label>
        <input type="text" name="search"
               placeholder="Enter name or student ID"
               value="<%= request.getParameter("search") != null ? request.getParameter("search") : "" %>">
        <button type="submit">Search</button>
    </form>

    <hr>

<%
    String DB_URL = "jdbc:derby://localhost:1527/student_profiles";
    String DB_USER = "app";
    String DB_PASS = "app";

    String search = request.getParameter("search");

    try {
        Class.forName("org.apache.derby.jdbc.ClientDriver");
        Connection con = DriverManager.getConnection(DB_URL, DB_USER, DB_PASS);

        PreparedStatement ps;

        if (search != null && !search.trim().isEmpty()) {
            ps = con.prepareStatement(
                "SELECT * FROM profiles WHERE LOWER(name) LIKE ? OR LOWER(student_id) LIKE ?"
            );
            ps.setString(1, "%" + search.toLowerCase() + "%");
            ps.setString(2, "%" + search.toLowerCase() + "%");
        } else {
            ps = con.prepareStatement("SELECT * FROM profiles");
        }

        ResultSet rs = ps.executeQuery();
        boolean hasData = false;

        while (rs.next()) {
            hasData = true;
%>
        <p><span class="label">Name:</span> <%= rs.getString("name") %></p>
        <p><span class="label">Student ID:</span> <%= rs.getString("student_id") %></p>
        <p><span class="label">Program:</span> <%= rs.getString("program") %></p>
        <p><span class="label">Email:</span> <%= rs.getString("email") %></p>
        <p><span class="label">Hobbies:</span> <%= rs.getString("hobbies") %></p>
        <p><span class="label">About Me:</span> <%= rs.getString("intro") %></p>

        <!-- Edit & Delete -->
        <a href="editProfile.jsp?id=<%= rs.getInt("id") %>"> Edit</a> |
        <a href="DeleteProfileServlet?id=<%= rs.getInt("id") %>"
           onclick="return confirm('Are you sure you want to delete this profile?');">
            Delete
        </a>

        <hr>
<%
        }

        if (!hasData) {
%>
        <p>No profiles found.</p>
<%
        }

        rs.close();
        ps.close();
        con.close();

    } catch (Exception e) {
%>
        <p style="color:red;">Error loading profiles.</p>
<%
        e.printStackTrace();
    }
%>

    <!-- BOTTOM BACK BUTTON -->
    <div style="text-align:center; margin-top:20px;">
        <a href="index.html">
            <button type="button"> Back to Profile Form</button>
        </a>
    </div>

</div>

</body>
</html>
