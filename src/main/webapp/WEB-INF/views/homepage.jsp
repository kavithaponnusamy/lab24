<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Home Page</title>
</head>
<body>
<p>Navigation: <a href="/vote-page">Options & Votes</a>&nbsp;&nbsp;&nbsp;&nbsp;<a href="/review-page">Review Options</a>&nbsp;&nbsp;&nbsp;&nbsp;
<a href="/admin-page">Admin</a></p>
<h3>Parties</h3>
<form action="/party" method="post">
<h4>Search</h4>
By Name<input type="text" name="name">&nbsp;&nbsp;&nbsp;<button type="submit">Search</button>
</form>
<p> </p>
<table class="table">
			<tr>
			<th>Name</th><th>Date</th>
			</tr>
			<c:forEach var="party" items="${parties}" >
			<tr>
				<td>${party.name}</td>
				<td>${party.date}</td>
			</tr>
			</c:forEach>
			</table>


</body>
</html>
