<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.util.Enumeration" isErrorPage="true"%>
<% String contextPath = request.getContextPath(); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Errore</title>
<link type="text/css" rel="stylesheet" href="<%=contextPath%>/styles/errorPage.css">
</head>
<body>
<jsp:include  page="Slideshow.jsp" />	
<jsp:include  page="Navbar.jsp" />

<div id="ao">
<h3> Heilà, c'è stato un errore, ma non preoccuparti. </h3>

<h1> Errore: <%= response.getStatus() %> </h1>

<% if (response.getStatus() == 403) { %>
	<h3> Sessione scaduta. Eseguire nuovamente l'accesso</h3>
<% } else if (response.getStatus() == 404) {%>
	<h3> Risorsa non trovata </h3>
<% } %>
</div>

</body>
</html>