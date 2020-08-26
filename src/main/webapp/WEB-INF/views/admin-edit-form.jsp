<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<p>Navigation: <a href="/admin-page">Back to Party List</a>
<h3>Edit Party</h3>
<form method="post">
Name: <input type="text" name="name" value="${party.name}" required>
<p> </p>
Date: <input type="date" name="date" required value="${party.date}" >
<p> </p>
<button type="submit">Submit</button>
</form>
</body>
</html>