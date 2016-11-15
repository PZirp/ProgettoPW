<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <% String contextPath = request.getContextPath();
	String sessionID = (String) request.getRequestedSessionId();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Presenze studente</title>

<script> 
var sessionID = "<%= sessionID%>"
var contextPath = "<%= contextPath%>"
</script>
<script type="text/javascript" src="<%=contextPath%>/scripts/studentAttendancePage.js"></script>
<link type="text/css" rel="stylesheet" href="<%=contextPath%>/styles/attendance.css">

</head>
<body>

<div id="presenze">	
		<h4> Presenze lezioni precedenti: </h4>
		<table id="listaPresenze" class="invisible"> 
		<thead> 
			<tr>
			    <th>Data</th>
			    <th>Presente</th>
		   </tr>
		  </thead>
		 <tbody></tbody>
		</table>
			
			
	 </div>

</body>
</html>