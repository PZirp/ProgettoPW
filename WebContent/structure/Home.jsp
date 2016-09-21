<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<meta name="keywords" content="Palestra, programmazione, web">
	<meta name="author" content="Paolo Zirpoli">
	<meta name="description" content="Sito palestra (Progetto Programmazione Web)">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0">
	<link type="text/css" rel="stylesheet" href="../styles/home.css">
	<script type="text/javascript" src="../scripts/provascript.js"></script>
	<title>Palestra (PW)</title>
</head>
<body>
	<jsp:include  page="Navbar.jsp" />
	<img class="image" src="palestra.jpg" width="45%">
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
	
	<br>
	<img class="image" src="palestra.jpg" width="45%">
	<br>
	
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
	
	
	<form>
		Inserisci il CF: <input type="text" id="codF" />
		<input id="sendButton" value="invia" type="button" onclick="trovaAllievo()">
	</form>  
	
	<script>	
	/*function addSquare() {
		var list = document.getElementsByClassName("subs");
		var nav = document.getElementsByTagName("nav");
		//var div = document.createElement("div");
		var last = list[0].lastElementChild.cloneNode(true);
		var node = last.childNodes[0];
		last.removeChild(node);
		var text = document.createTextNode("Hi there and greetings!");
		last.appendChild(text);
		//div.style.backgroundColor = "red";
		//div.style.width = "100px";
		//div.style.height = "100px";
		list[0].appendChild(last);
	}*/
		
	</script>
	<script> /*addSquare();*/</script>
</body>
</html>