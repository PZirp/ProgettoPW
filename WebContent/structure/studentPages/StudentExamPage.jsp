<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <% String contextPath = request.getContextPath();
	String sessionID = (String) request.getRequestedSessionId();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Esami studente</title>
<script> 
var sessionID = "<%= sessionID%>"
var contextPath = "<%= contextPath%>"
</script>
<script type="text/javascript" src="<%=contextPath%>/scripts/studentAttendancePage.js"></script>

</head>
<body>
<div id="esami">	
		<h4> Esami sostenuti: </h4>
		<table id="listaEsami" class="invisible"> 
		<thead> 
			<tr>
			    <th>Data</th>
			    <th>Voto</th>
		   </tr>
		  </thead>
		 <tbody></tbody>
		</table>			
	 </div>
	 
</body>
</html>