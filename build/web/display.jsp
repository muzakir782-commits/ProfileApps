<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <title>Profile Summary</title>
  <link rel="stylesheet" href="styles.css">
</head>
<body>
  <div class="card">
    <h2>Your Profile Summary</h2>
    <p><span class="label">Name:</span> ${name}</p>
    <p><span class="label">Student ID:</span> ${studentId}</p>
    <p><span class="label">Program:</span> ${program}</p>
    <p><span class="label">Email:</span> ${email}</p>
    <p><span class="label">Hobbies:</span> ${hobbies}</p>
    <p><span class="label">About Me:</span><br>${intro}</p>
    <p><a href="index.html">Edit Again</a></p>
</div>

</body>
</html>
