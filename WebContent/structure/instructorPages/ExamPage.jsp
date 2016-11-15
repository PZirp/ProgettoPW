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

<script> 
var sessionID = "<%= sessionID%>"
var contextPath = "<%= contextPath%>"
</script>
<script type="text/javascript" src="<%=contextPath%>/scripts/examPage.js"></script>

</head>
<body>

	<div id="esamiPrecedenti">	
		<h4> Visualizza esami precedenti: </h4>
		<table id="listaEsami" class="invisible"> 
		<thead> 
			<tr>
			    <th>Nome</th>
			    <th>Cognome</th>
			    <th>Voto</th>
		   </tr>
		  </thead>
		 <tbody></tbody>
		</table>
			
			
	 </div>
	  	
	<h4>Aggiungi nuovo esame: </h4>	  	
	<div id="AJAXesame"><input type="submit" id="createEsame" value="Crea nuovo esame"/> 

		<table id="formEsame" class="invisible">
		<thead>  
		  <tr>
		    <th>Nome</th>
		    <th>Cognome</th>
		    <th>Voto</th>
		    <th class="invisible">CF</th>
		   </tr>
		</thead>
		<tbody></tbody>	
		</table>
	</div>
	

</body>
</html>