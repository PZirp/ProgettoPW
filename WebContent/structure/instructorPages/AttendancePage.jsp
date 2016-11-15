<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <% String contextPath = request.getContextPath();
	String sessionID = (String) request.getRequestedSessionId();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
	<link type="text/css" rel="stylesheet" href="<%=contextPath%>/styles/attendance.css">

<script> 
var sessionID = "<%= sessionID%>"
var contextPath = "<%= contextPath%>"
</script>

<script type="text/javascript" src="<%=contextPath%>/scripts/attendancePage.js"></script>

</head>
<body>
	
	<div id="lezioniPrecedenti">	
		<h4> Visualizza presenze lezioni precedenti: </h4>
<!-- 		<div id="presence">	</div> -->
		<table id="listaPresenze" class="invisible"> 
		<thead> 
			<tr>
			    <th>Nome</th>
			    <th>Cognome</th>
			    <th>Presente</th>
		   </tr>
		  </thead>
		 <tbody></tbody>
		</table>
			
			
	 </div>
	  	
	<h4>Aggiungi nuova lezione: </h4>	  	
	<div id="AJAXsection"><input type="submit" id="createLesson" value="Crea nuova lezione"/> 

		<table id="formPresenze" class="invisible">
		<thead>  
		  <tr>
		    <th>Nome</th>
		    <th>Cognome</th>
		    <th>Presente</th>
		    <th>Assente</th>
		    <th class="invisible">CF</th>
		   </tr>
		</thead>
		<tbody></tbody>	
		</table>
	</div>
	
</body>
</html>