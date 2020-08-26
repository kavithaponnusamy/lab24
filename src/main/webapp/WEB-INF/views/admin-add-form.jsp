<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Addmin add page</title>
</head>
<body>
<p>Navigation: <a href="/admin-page">Back to Party List</a>
<h3>Add a Party</h3>
<form action="/admin-page" method="post">
Name: <input type="text" name="name">
<p> </p>
Date: <input type="date" name="date" required pattern="mm/dd/yyyy">
<p> </p>
<button type="submit">Submit</button>
</form>



</body>
</html>