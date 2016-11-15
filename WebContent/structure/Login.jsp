<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<% String contextPath = request.getContextPath(); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>Login</title>
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0">
	<link type="text/css" rel="stylesheet" href="<%=contextPath%>/styles/login.css">
	
</head>
<body>
	<jsp:include  page="Slideshow.jsp" />	
	<jsp:include  page="Navbar.jsp" />
	<%String notFound = (String) request.getAttribute("not-found"); %>
	<div id="background">
		<form method="POST" action="/ProgettoPW/LoginServlet">
			<div id="username"> <h3>Username: </h3> <input type="text" name="username"> </div> 
			<div id="password"> <h3>Password: </h3> <input type="password" name="password"> </div> 
			
			<div id="submit"> <input type="submit" value="Login"> </div> 
		</form>
		
		<% if (notFound != null) {%>
			<p>Dati di accesso errati</p>
		<% } %> 
		
	</div>	


</body>
</html>