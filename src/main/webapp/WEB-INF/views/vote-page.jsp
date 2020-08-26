<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Party Options</title>
</head>
<body>
<p>Navigation: <a href="/party">Parties</a>&nbsp;&nbsp;&nbsp;&nbsp;<a href="/review-page">Review Options</a></p>
<h3>Pizza Options for Party:</h3>
<form action="/add-page" method="post">
<table class="table">
			<tr>
			<th>Name</th><th>Description</th><th>Votes</th>
			</tr>
			<c:forEach var="partyOption" items="${partyOptions}">
			<tr>
				<td>${partyOption.name}</td>
				<td>${partyOption.description}</td>
				<td>${partyOption.votes}</td><td>
				<a href="/vote-update?id=${partyOption.id}">Votes!</a></td>
			</tr>
			</c:forEach>
			</table>
<p> </p>
<h4>Add an Option</h4>
<p>Name: <input type="text" name="name" />&nbsp;&nbsp;Description: <input type="text" name="description"/>
<button type="submit" class="btn btn-primary">Add</button>
</form>
</body>
</html>