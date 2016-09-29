<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<script type="text/javascript" src="../scripts/ritrova.js"></script>
<title>Prova servlet</title>
</head>
<body>

<h2>Seleziona l'operazione</h2>

	Lista studenti: <input type="radio"	name="lista" value="studenti">
	Lista presenze: <input type="radio"	name="lista" value="presenze">
	
	<h2>Inserisci il codice corso</h2> 
	
	Codice: <input type="text" name="codice" id="codice">
	<input type="submit" id="submit">

<div id="results"></div>

<script>
	window.onload = function() {
		var x = document.getElementById("submit");
		x.addEventListener("click", clickHandler);
	}
</script>

</body>
</html>