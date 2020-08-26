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
<!--Navigation: <a href="/admin-page">Admin</a></p>
<p> </p>
<!--  <form action="/party" method="post">
<h4>Search</h4>
By Name<input type="text" name="name">&nbsp;&nbsp;&nbsp;<button type="submit">Search</button>
</form>-->
<h3>Parties</h3>
			<ul>
			<c:forEach var="party" items="${parties}" >
			
			<li><Strong>
			<c:out value="${party.name}"/> - <c:out value="${party.date}"/>				
				
				<a href="
				<c:url value="/rsvp/${party.id}"/>">See Details</a>
				</Strong>
				</li>
				<p> </p>
				<% int count=0; %>
				<c:forEach var="rsvp" items="${rsvps}">
			
					<c:if test="${party.id == rsvp.party.id}">
					<%count++;%>
					</c:if>
					
				</c:forEach>
				<p>RSVP: <%=count %></p>
				<p> </p>
				<!--<a href="/review-page">Review</a>-->	
			</c:forEach>
			</ul>
<h3>RSVP</h3>
<form action="/rsvp-submit" method=post>
<label for="party">Party</label> 
				<select id="party" name="party">
				<c:forEach var="party" items="${parties}">
				<option value="${party.id}">${party.name}</option>
				</c:forEach>
				</select>
<p> </p>
Attendee<input type="text" name="attendee">
<p> </p>
Comment <textarea id="comment" name="comment" rows="4" cols="50"></textarea>
<p> </p>
<button type="submit">Submit</button>
</form>


</body>
</html>
