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
<p>Navigation: <a href="/vote-page">Options & Votes</a>&nbsp;&nbsp;&nbsp;&nbsp;<a href="/review-page">Review Options</a></p>
<h3>Parties</h3>

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
