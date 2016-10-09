<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<% String contextPath = request.getContextPath(); %>

<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<meta name="keywords" content="Palestra, programmazione, web">
	<meta name="author" content="Paolo Zirpoli">
	<meta name="description" content="Sito palestra (Progetto Programmazione Web)">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0">
	<link type="text/css" rel="stylesheet" href="<%=contextPath%>/styles/home.css">
	<script type="text/javascript" src="<%=contextPath%>/scripts/provascript.js"></script>
	<title>Palestra (PW)</title>
</head>
<body>
	<jsp:include  page="Slideshow.jsp" />	
	<jsp:include  page="Navbar.jsp" />
	<div class="container">	
		<section class="left">
			<h2> <%= (String) request.getAttribute("Titolo1") %></h2>
			<p class="testi"> <%= (String) request.getAttribute("Descrizione1") %> </p>
		</section>
			<img class="banner" alt="Immagine" src=" <%= contextPath %>/resources/home/main_6.png" >
	</div>
	<div class="container">			
		<section class="right">
			<h2> <%= (String) request.getAttribute("Titolo2") %></h2>
			<p class="testi"> <%= (String) request.getAttribute("Descrizione2") %> </p>
		</section>
			<img class="banner" alt="Immagine" src="<%= contextPath %>/resources/home/main_7.png" >
	</div>	
		<div class="container">			
		<section class="left">
			<h2> <%= (String) request.getAttribute("Titolo3") %></h2>
			<p class="testi"> <%= (String) request.getAttribute("Descrizione3") %> </p>
		</section>
			<img class="banner" alt="Immagine" src="<%= contextPath %>/resources/home/main_2.png" >
	</div>
	
	<div class="container">			
		<section class="right">
			<h2> <%= (String) request.getAttribute("Titolo4") %></h2>
			<p class="testi"> <%= (String) request.getAttribute("Descrizione4") %> </p>
		</section>
		<img class="banner" alt="Immagine" src="<%= contextPath %>/resources/home/main_3.png" >
	</div>
	
	<!-- <form>
		Inserisci il CF: <input type="text" id="codF" />
		<input id="sendButton" value="invia" type="button" onclick="trovaAllievo()">
	</form> -->
</body>
</html>