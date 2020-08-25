<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
      <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<p>Navigation: <a href="/party">Parties</a>&nbsp;&nbsp;&nbsp;&nbsp;<a href="/vote-page">Options & Votes</a></p>
<h2>Pizza Options</h2>
<table class="table">
			<tr>
			<th>Name</th><th>Description</th><th>Votes</th>
			</tr>
			<c:forEach var="partyOption" items="${partyOptions}">
			<tr>
				<td>${partyOption.name}</td>
				<td>${partyOption.description}</td>
				<td>${partyOption.votes}</td><td>
			</tr>
			</c:forEach>
			</table>
</body>
</html>