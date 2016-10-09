<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<% String contextPath = request.getContextPath(); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<script type="text/javascript" src="<%=contextPath%>/scripts/provascript.js"></script>
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0">
		<link type="text/css" rel="stylesheet" href="<%=contextPath%>/styles/genericPage.css">
	
	<title>Aikido</title>
</head>
<body>
	<jsp:include  page="/structure/Slideshow.jsp" />
	<jsp:include  page="/structure/Navbar.jsp"/>

<div class="image">	<img class="body" alt="Immagine" src="../../resources/580px-Shihonage.jpg"> </div>		
	<section id="pal1">
		<h2>Aikido</h2>
		<p class="testi"> Aikido is a modern Japanese martial art developed by Morihei Ueshiba as a synthesis of his martial studies, philosophy, and religious beliefs. Aikido is often translated as "the way of unifying (with) life energy" or as "the way of harmonious spirit." <br> <br> Ueshiba's goal was to create an art that practitioners could use to defend themselves while also protecting their attacker from injury. Aikido techniques consist of entering and turning movements that redirect the momentum of an opponent's attack, and a throw or joint lock that terminates the technique. <br> <br> Aikido derives mainly from the martial art of Daito-ryu Aiki-jujutsu, but began to diverge from it in the late 1920s, partly due to Ueshiba's involvement with the Omoto-kyo religion. Ueshiba's early students' documents bear the term aiki-jujutsu. Ueshiba's senior students have different approaches to aikido, depending partly on when they studied with him. <br> <br> Today aikido is found all over the world in a number of styles, with broad ranges of interpretation and emphasis. However, they all share techniques formulated by Ueshiba and most have concern for the well-being of the attacker.</p>
	</section>
		
		
</body>
</html>