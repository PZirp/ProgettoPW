<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<% String contextPath = request.getContextPath(); %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link type="text/css" rel="stylesheet" href="<%=contextPath%>/styles/slider.css">	
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0">
<script type="text/javascript" src="<%=contextPath%>/scripts/slideshow.js"></script>


<title>Insert title here</title>
</head>
<body>

	<div class="slider" id="main-slider"><!-- contenitore esterno -->
		<div class="slider-wrapper"><!-- contenitore interno -->
			<img class="slide" id="slide-1" alt="Immagine" src="<%=contextPath%>/resources/home/main_1.png" >
			<img class="slide" id="slide-2" alt="Immagine" src="<%=contextPath%>/resources/home/main_5.png" >
			<img class="slide" id="slide-3" alt="Immagine" src="<%=contextPath%>/resources/home/main_3.png" >
			<img class="slide" id="slide-3" alt="Immagine" src="<%=contextPath%>/resources/home/main_4.png" >
		</div>
		<div class="slider-nav">
			<button type="button" class="slider-previous">Precedente</button>
			<button type="button" class="slider-next">Successivo</button>
		</div>
	</div>	

</body>
</html>