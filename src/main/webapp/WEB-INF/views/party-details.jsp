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
<p>Navigation: <a href="/party">Parties</a>&nbsp;&nbsp;&nbsp;&nbsp; <a href="/vote-page">Options & Votes</a>&nbsp;&nbsp;&nbsp;&nbsp;<a href="/review-page">Review Options</a></p>
<h3>Party: ${party.name}</h3>
${party.date}
<h4>Rsvps</h4>
<table class="table">
			<tr>
			<th>Attendee</th><th>Comment</th>
			</tr>
			<c:forEach var="rsvp" items="${rsvps}">
			<tr>
				<td>${rsvp.attendee}</td>
				<td>${rsvp.comment}</td>			
				
			</tr>
			</c:forEach>
			</table>
</body>
</html>