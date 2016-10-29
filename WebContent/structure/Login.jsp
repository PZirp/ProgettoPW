<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<% String contextPath = request.getContextPath(); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>Login</title>
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0">
	<script type="text/javascript" src="<%=contextPath%>/scripts/provascript.js"></script>
</head>
<body>
	<jsp:include  page="Navbar.jsp" />
	
	<form method="POST" action="/ProgettoPW/LoginServlet">
		Username: <input type="text" name="username">
		Password: <input type="password" name="password">
		<input type="submit" value="Submit">
	</form>
	
	<%String notFound = (String) request.getAttribute("not-found"); %>
	
	<% if (notFound != null) {%>
		Dati non corretti!
	<% } %> 


</body>
</html>