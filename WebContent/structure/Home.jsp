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
	<link type="text/css" rel="stylesheet" href="<%=contextPath%>/styles/slider.css">	
	<script type="text/javascript" src="../scripts/provascript.js"></script>
	<title>Palestra (PW)</title>
	<script>
	document.addEventListener('DOMContentLoaded', function () {
        var slider = new Slideshow('#main-slider');
    });
	</script>
</head>
<body>
	
	<div class="slider" id="main-slider"><!-- contenitore esterno -->
		<div class="slider-wrapper"><!-- contenitore interno -->
			<img class="slide" id="slide-1" alt="Immagine" src="../resources/home/1.png" >
			<img class="slide" id="slide-2" alt="Immagine" src="../resources/home/2.png" >
			<img class="slide" id="slide-3" alt="Immagine" src="../resources/home/3.png" >
			<img class="slide" id="slide-3" alt="Immagine" src="../resources/home/4.png" >
		</div>
		<div class="slider-nav">
			<button type="button" class="slider-previous">Precedente</button>
			<button type="button" class="slider-next">Successivo</button>
		</div>
	</div>	
	<jsp:include  page="Navbar.jsp" />
		
	<div class="text">
		<section id="pal1">
			<h2>Titolo</h2>
			<p class="testi"> Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi tincidunt luctus eleifend. Donec mauris neque, viverra eget mauris sed, faucibus aliquet mi. Vestibulum porta urna ac sapien pretium efficitur ut eget leo. In ex mauris, finibus ac varius sagittis, dapibus sit amet risus. Sed molestie sapien mi, non eleifend tellus sodales tristique. Suspendisse sodales elit elit, eu consequat est porta ut. Donec justo ligula, sodales ut convallis id, finibus ut urna. Donec in orci nec velit tempus ultrices a sed nunc. Aliquam luctus auctor consequat. Aliquam erat volutpat. Vestibulum turpis enim, egestas tempus elementum posuere, aliquam in libero. Donec tincidunt consectetur nisi molestie semper. </p>
		</section>
		<section id="pal2">
			<h2>Titolo 2</h2>
			<p class="testi"> Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi tincidunt luctus eleifend. Donec mauris neque, viverra eget mauris sed, faucibus aliquet mi. Vestibulum porta urna ac sapien pretium efficitur ut eget leo. In ex mauris, finibus ac varius sagittis, dapibus sit amet risus. Sed molestie sapien mi, non eleifend tellus sodales tristique. Suspendisse sodales elit elit, eu consequat est porta ut. Donec justo ligula, sodales ut convallis id, finibus ut urna. Donec in orci nec velit tempus ultrices a sed nunc. Aliquam luctus auctor consequat. Aliquam erat volutpat. Vestibulum turpis enim, egestas tempus elementum posuere, aliquam in libero. Donec tincidunt consectetur nisi molestie semper. </p>
		</section>
		<section id="pal3">
			<h2>Titolo 3</h2>
			<p class="testi" id="testo3"> Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi tincidunt luctus eleifend. Donec mauris neque, viverra eget mauris sed, faucibus aliquet mi. Vestibulum porta urna ac sapien pretium efficitur ut eget leo. In ex mauris, finibus ac varius sagittis, dapibus sit amet risus. Sed molestie sapien mi, non eleifend tellus sodales tristique. Suspendisse sodales elit elit, eu consequat est porta ut. Donec justo ligula, sodales ut convallis id, finibus ut urna. Donec in orci nec velit tempus ultrices a sed nunc. Aliquam luctus auctor consequat. Aliquam erat volutpat. Vestibulum turpis enim, egestas tempus elementum posuere, aliquam in libero. Donec tincidunt consectetur nisi molestie semper. </p>
		</section>
	</div>
	
	<div class="banner-wrap">
	<img class="banner" alt="Immagine" src="../resources/home/3.png" >
	</div>
	<div class="text">
		<section id="pal1">			
			<!-- <div class="divider"></div> --> 
			<p class="testi"> Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi tincidunt luctus eleifend. Donec mauris neque, viverra eget mauris sed, faucibus aliquet mi. Vestibulum porta urna ac sapien pretium efficitur ut eget leo. In ex mauris, finibus ac varius sagittis, dapibus sit amet risus. Sed molestie sapien mi, non eleifend tellus sodales tristique. Suspendisse sodales elit elit, eu consequat est porta ut. Donec justo ligula, sodales ut convallis id, finibus ut urna. Donec in orci nec velit tempus ultrices a sed nunc. Aliquam luctus auctor consequat. Aliquam erat volutpat. Vestibulum turpis enim, egestas tempus elementum posuere, aliquam in libero. Donec tincidunt consectetur nisi molestie semper. </p>
		</section>
		<section id="pal2">
			<p class="testi"> Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi tincidunt luctus eleifend. Donec mauris neque, viverra eget mauris sed, faucibus aliquet mi. Vestibulum porta urna ac sapien pretium efficitur ut eget leo. In ex mauris, finibus ac varius sagittis, dapibus sit amet risus. Sed molestie sapien mi, non eleifend tellus sodales tristique. Suspendisse sodales elit elit, eu consequat est porta ut. Donec justo ligula, sodales ut convallis id, finibus ut urna. Donec in orci nec velit tempus ultrices a sed nunc. Aliquam luctus auctor consequat. Aliquam erat volutpat. Vestibulum turpis enim, egestas tempus elementum posuere, aliquam in libero. Donec tincidunt consectetur nisi molestie semper. </p>
		</section>
		<section id="pal3">
			<p class="testi" id="testo3"> Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi tincidunt luctus eleifend. Donec mauris neque, viverra eget mauris sed, faucibus aliquet mi. Vestibulum porta urna ac sapien pretium efficitur ut eget leo. In ex mauris, finibus ac varius sagittis, dapibus sit amet risus. Sed molestie sapien mi, non eleifend tellus sodales tristique. Suspendisse sodales elit elit, eu consequat est porta ut. Donec justo ligula, sodales ut convallis id, finibus ut urna. Donec in orci nec velit tempus ultrices a sed nunc. Aliquam luctus auctor consequat. Aliquam erat volutpat. Vestibulum turpis enim, egestas tempus elementum posuere, aliquam in libero. Donec tincidunt consectetur nisi molestie semper. </p>
		</section>
	</div>
	
	<div class="banner-wrap">
	<img class="banner" alt="Immagine" src="../resources/home/4.png" >
	</div>
	
	<form>
		Inserisci il CF: <input type="text" id="codF" />
		<input id="sendButton" value="invia" type="button" onclick="trovaAllievo()">
	</form> 
</body>
</html>