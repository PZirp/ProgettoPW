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
	Oh guarda qui! Una pagina del corso.
	Codice del corso = <%= session.getAttribute("codice_corso") %>
	
	<div id="AJAXsection">Aggiungi nuova lezione: <input type="submit" id="createLesson"/> 
		<div id="presence"></div>
	<table id="students"> 
	  <tr>
	    <th>Nome</th>
	    <th>Cognome</th>
	    <th>Presente</th>
	    <th>Assente</th>
	    <th class="invisible">CF</th>
	    
	  </tr>	
	<!--  <tr>
	    <td>Nome</td>
	    <td>Cognome</td>
	    <td> <input type="radio" name="presente" value="1"/> </td>
	    <td><input type="radio" name="presente" value="0"/></td>
	  </tr> -->
	</table>
	</div>
	
</body>
</html>