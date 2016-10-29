<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<% String contextPath = request.getContextPath(); %>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<link type="text/css" rel="stylesheet" href="<%=contextPath%>/styles/navbar.css">
</head>
<body>
	<nav>
	    <ul class="barbody" id="navbar">
	        <li class="linkbutton"><a href="<%=contextPath%>/genericPageServlet?page=mainPage">Home</a></li>
	        <li class="linkbutton">Arti marziali
	            <ul class="subs" id="arti">
	                <li class="innerbutton"><a href="<%=contextPath%>/genericPageServlet?page=aikido">Aikido</a></li>
	                <li class="innerbutton"><a href="/ProgettoPW/genericPageServlet?page=taekwondo">Taekwondo</a></li>
	                <li class="innerbutton"><a href="/ProgettoPW/genericPageServlet?page=judo">Judo</a></li>
	            </ul>
	        </li>
	        <li class="linkbutton">Fitness
	            <ul class="subs" id="fitness">
	                <li class="innerbutton"><a href="/ProgettoPW/genericPageServlet?page=body_building">Body building</a></li>
	                <li class="innerbutton"><a href="/ProgettoPW/genericPageServlet?page=zumba">Zumba</a></li>
	                <li class="innerbutton"><a href="/ProgettoPW/genericPageServlet?page=posturale">Posturale</a></li>
	            </ul>
	        </li>
	        <li class="linkbutton"><a href="niente">Informazioni</a></li>
	        <li class="linkbutton"><a href="<%=contextPath%><%= response.encodeURL("/structure/PrivatePage.jsp")%>">Area personale</a></li>
	    </ul>
	</nav>
</body>
</html>