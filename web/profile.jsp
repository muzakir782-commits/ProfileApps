<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="model.ProfileBean" %>

<%
    ProfileBean profile = (ProfileBean) request.getAttribute("profile");
%>

<!DOCTYPE html>
<html>
<head>
    <title>Personal Profile</title>
    <link rel="stylesheet" href="styles.css">
</head>
<body>

<div class="card">
    <h2>Personal Profile</h2>

    <p><span class="label">Name:</span> <%= profile.getName() %></p>
    <p><span class="label">Student ID:</span> <%= profile.getStudentId() %></p>
    <p><span class="label">Program:</span> <%= profile.getProgram() %></p>
    <p><span class="label">Email:</span> <%= profile.getEmail() %></p>
    <p><span class="label">Hobbies:</span> <%= profile.getHobbies() %></p>
    <p><span class="label">About Me:</span><br><%= profile.getIntro() %></p>

    <hr>

    <!-- Buttons -->
    <div style="text-align:center;">
        <a href="viewProfiles.jsp">
            <button type="button"> View All Profiles</button>
        </a>

        <a href="index.html">
            <button type="button"> Add New Profile</button>
        </a>
    </div>
</div>

</body>
</html>
