<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <% String contextPath = request.getContextPath();
	String sessionID = (String) request.getRequestedSessionId();
	String courseName = (String) request.getAttribute("nome_corso");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script> 
var sessionID = "<%= sessionID%>"
var contextPath = "<%= contextPath %>"
</script>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Area personale allievo</title>
<link type="text/css" rel="stylesheet" href="<%=contextPath%>/styles/instructor.css">
</head>
<body>
<jsp:include  page="../Navbar.jsp" />
<div id="topBar">
	<div id="allievo">
	 	<h3>Dati allievo:</h3>
	 	
		<table>
			<tr> <th> Nome: </th> <td> <%= session.getAttribute("nome") %> </td> 
			 <th> Cognome: </th> <td> <%= session.getAttribute("cognome") %> </td> </tr>
			<tr> <th> Grado: </th> <td> <%= session.getAttribute("grado") %> </td> 
			<th> Data d'iscrizione: </th> <td> <%= session.getAttribute("data_iscrizione") %> </td> </tr>
		</table>	
	</div>
	<div id="corso_seguito">	
		<h3> Dati corso frequentato: </h3>
		<table>
			<tr> <th> Codice corso: </th> <td> <%= session.getAttribute("codice_corso") %> </td> 
			<th> Nome corso: </th> <td> <%= session.getAttribute("nome_corso") %> </td> </tr>
			<tr><th> Sede: </th> <td> <%= session.getAttribute("sede") %> </td> </tr>
		</table>
	</div>
	</div>
	
	<div id="attendanceSection">
	<div id="content"><jsp:include  page="StudentAttendancePage.jsp" /></div>
	</div>
	<div id="examSection">
	<div id="content"><jsp:include  page="StudentExamPage.jsp" /></div>
	</div>
 <a href="<%=contextPath%>/LogoutServlet">Logout</a>

</body>
</html>