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
	<link type="text/css" rel="stylesheet" href="<%=contextPath%>/styles/instructor.css">

<!-- var courseName = "<%= courseName%>" -->
<script> 
var sessionID = "<%= sessionID%>"
var contextPath = "<%= contextPath %>"
</script>
<title>Insert title here</title>
</head>
<body>
	<jsp:include  page="../Navbar.jsp" />
	<div id="topBar">
	<div id="istruttore">
	 	<h3>Dati istruttore:</h3>
	 	<table>
			<tr> <th> Nome: </th> <td> <%= session.getAttribute("nome") %> </td> 
			 <th> Cognome: </th> <td> <%= session.getAttribute("cognome") %> </td> </tr>
			<!-- <tr> <td> Corso tenuto: </td> <td> <%= session.getAttribute("corso") %> </td> </tr> -->
			<tr> <th> ID Federale: </th> <td> <%= session.getAttribute("id") %> </td> 
			<th> Grado: </th> <td> <%= session.getAttribute("grado") %> </td> </tr>
		</table>	
	</div>
	<div id="corso" >	
		<h3> Dati corso: </h3>
		<table>
			<tr> <th> Codice corso: </th> <td> <%= session.getAttribute("codice_corso") %> </td> 
			<th> Nome corso: </th> <td> <%= session.getAttribute("nome_corso") %> </td> </tr>
			<tr> <th> # Iscritti: </th> <td> <%= session.getAttribute("mum_iscritti") %> </td> 
			<th> Sede: </th> <td> <%= session.getAttribute("sede") %> </td> </tr>
		</table>
	</div>
	</div>
	
	<div id="attendanceSection">
		<h3>Gestione presenze</h3>
		<div id="content"><jsp:include  page="AttendancePage.jsp" /></div>
	</div>
	<div id="examSection">
		<h3>Gestione esami</h3>	
		<div id="content"><jsp:include  page="ExamPage.jsp" /></div>
	</div>
	<a href="<%=contextPath%>/LogoutServlet">Logout</a>	
</body>
</html>