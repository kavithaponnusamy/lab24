<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
       <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
     <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<p>Navigation: <a href="/">Back to Homepage</a>
<h3>Party Admin</h3>
<ul>
<c:forEach items="${parties}" var="party">
<li><c:out value="${party.name}"/> - <c:out value="${party.date}"/>
<a href="/party-update?id=${party.id}">Edit</a>&nbsp;&nbsp;&nbsp;<a href="/delete-party?id=${party.id}">Delete</a>
</li></c:forEach>
</ul>

<a href="/admin-add-form">Add a Party</a>




</body>
</html>