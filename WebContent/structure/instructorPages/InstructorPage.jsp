<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<% String contextPath = request.getContextPath();
	String sessionID = (String) request.getRequestedSessionId();
	String courseName = (String) request.getAttribute("nome_corso");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<script> 
var courseName = "<%= courseName%>"
var sessionID = "<%= sessionID%>"
var contextPath = "<%= contextPath %>"
</script>

<script type="text/javascript" src="<%=contextPath%>/scripts/instructorPage.js"></script>

<title>Insert title here</title>
</head>
<body>
 	Dati istruttore:
	<table>
		<tr> <td> Nome: </td> <td> <%= request.getAttribute("nome") %> </td> </tr>
		<tr> <td> Cognome: </td> <td> <%= request.getAttribute("cognome") %> </td> </tr>
		<!-- <tr> <td> Corso tenuto: </td> <td> <%= request.getAttribute("corso") %> </td> </tr> -->
		<tr> <td> ID Federale: </td> <td> <%= request.getAttribute("id") %> </td> </tr>
		<tr> <td> Grado: </td> <td> <%= request.getAttribute("grado") %> </td> </tr>
	</table>
	Dati corso tenuto:
	<table>
		<tr> <td> Codice corso: </td> <td> <%= request.getAttribute("codice_corso") %> </td> </tr>
		<tr> <td> Nome corso: </td> <td> <%= request.getAttribute("nome_corso") %> </td> </tr>
		<tr> <td> # Max iscritti: </td> <td> <%= request.getAttribute("max_iscritti") %> </td> </tr> 
		<tr> <td> # Iscritti: </td> <td> <%= request.getAttribute("mum_iscritti") %> </td> </tr>
		<tr> <td> Sede: </td> <td> <%= request.getAttribute("sede") %> </td> </tr>
	</table>
	<a href="<%= contextPath%><%= "/" + response.encodeURL("structure/instructorPages/AttendancePage.jsp")%>"> Pagina presenze </a>
	<div id="link"></div>
</body>
</html>