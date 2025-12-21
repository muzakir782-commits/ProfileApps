<%@ page import="java.sql.*" %>

<%
    int id = Integer.parseInt(request.getParameter("id"));

    String name="", program="", email="", hobbies="", intro="";

    Class.forName("org.apache.derby.jdbc.ClientDriver");
    Connection con = DriverManager.getConnection(
        "jdbc:derby://localhost:1527/student_profiles", "app", "app");

    PreparedStatement ps =
        con.prepareStatement("SELECT * FROM profiles WHERE id=?");
    ps.setInt(1, id);

    ResultSet rs = ps.executeQuery();
    if(rs.next()){
        name = rs.getString("name");
        program = rs.getString("program");
        email = rs.getString("email");
        hobbies = rs.getString("hobbies");
        intro = rs.getString("intro");
    }

    rs.close(); ps.close(); con.close();
%>

<html>
<head>
    <title>Edit Profile</title>
    <link rel="stylesheet" href="styles.css">
</head>
<body>
<div class="card">
<h2>Edit Profile</h2>

<form action="UpdateProfileServlet" method="post">
    <input type="hidden" name="id" value="<%= id %>">

    <label class="label">Name</label>
    <input type="text" name="name" value="<%= name %>">

    <label class="label">Program</label>
    <input type="text" name="program" value="<%= program %>">

    <label class="label">Email</label>
    <input type="email" name="email" value="<%= email %>">

    <label class="label">Hobbies</label>
    <input type="text" name="hobbies" value="<%= hobbies %>">

    <label class="label">About Me</label>
    <textarea name="intro"><%= intro %></textarea>

    <button type="submit">Update Profile</button>
</form>
</div>
</body>
</html>
