window.addEventListener("load", trovaLezioni)
window.addEventListener("load", setUp)

function setUp() {
	document.getElementById("createLesson").addEventListener("click", trovaStudenti);
}

function trovaLezioni() {
	var xmlhttpObject = new XMLHttpRequest();
	xmlhttpObject.onreadystatechange = handleResponseLezioni;
	var url = contextPath + "/AttendancePage;jsessionid=" + sessionID;
	xmlhttpObject.open("GET", url, true)
	xmlhttpObject.setRequestHeader("Content-type", "text/html");
	xmlhttpObject.send();	
}

function handleResponseLezioni() {
	if (this.readyState == 4) {
		if (this.status == 200) {
			var data = JSON.parse(this.responseText);
			var old = document.getElementById("lessonList");
			if (old != null) {
				old.parentNode.removeChild(old);
			}
			var select = document.createElement("select");
		    select.setAttribute("id", "lessonList");
			select.addEventListener("change", trovaPresenze);
			for (var i = 0; i < data.length; i++) {
				var option = document.createElement("option");
				option.setAttribute("value", data[i].codiceLezione)
				option.innerHTML = data[i].data;
				select.appendChild(option);
			}	
			//document.getElementById("lezioniPrecedenti").appendChild(select);
			document.getElementById("lezioniPrecedenti").insertBefore(select, document.getElementById("listaPresenze"));
		} else {
			alert("Error during AJAX call. Please try again");
		}
	}	
}

function trovaPresenze() {
	var xmlhttpObject = new XMLHttpRequest();
	xmlhttpObject.onreadystatechange = handleResponsePresenze;
	var value = document.getElementById("lessonList").value;
	var url = contextPath + "/PresenzeServlet;jsessionid=" + sessionID;
	xmlhttpObject.open("POST", url, true)
	xmlhttpObject.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
	xmlhttpObject.send("lessonCode="+value);	
}

function handleResponsePresenze() {
	if (this.readyState == 4) {
		if (this.status == 200) {
			var data = JSON.parse(this.responseText);
			var table = document.getElementById("listaPresenze").getElementsByTagName("tbody")[0];
			var students = document.getElementById("listaPresenze");
			students.removeChild(table);
			table =	document.createElement("tbody");

			
			for (var i = 0; i < data.length; i++) {
				var row = table.insertRow(table.rows.length);
				row.className = "presenzaStudente";
				var name = row.insertCell(0);
				name.setAttribute("class", "name");
				var text1 = document.createTextNode(data[i].nome);
				name.appendChild(text1);
				
				var surname = row.insertCell(1);
				surname.setAttribute("class", "surname");
				text1 = document.createTextNode(data[i].cognome);
				surname.appendChild(text1);
				
				var pres = row.insertCell(2);
				pres.setAttribute("class", "presenza");
				if (data[i].presente === "1") {
					text1 = document.createTextNode("Presente");
				} else if (data[i].presente === "0") {
					text1 = document.createTextNode("Assente");
				}
				pres.appendChild(text1);

			}
			students.appendChild(table);
			students.setAttribute("class", "");
			
		} else {
			alert("Error during AJAX call. Please try again");
		}
	}	
}

function trovaStudenti() {
	var xmlhttpObject = new XMLHttpRequest();
	xmlhttpObject.onreadystatechange = handleResponseTrovaStudenti;
	var url = contextPath + "/FindStudentsServlet;jsessionid=" + sessionID;
	xmlhttpObject.open("POST", url, true)
	xmlhttpObject.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
	xmlhttpObject.send();
}

function handleResponseTrovaStudenti() {
	if (this.readyState == 4) {
		if (this.status == 200) {
			
			var table = document.getElementById("formPresenze").getElementsByTagName("tbody")[0];
			var students = document.getElementById("formPresenze");
			students.removeChild(table);
			table =	document.createElement("tbody");

			var data = JSON.parse(this.responseText);
			//var students = document.getElementById("formPresenze");
			for (var i = 0; i < data.length; i++) {
				//var row = table.insertRow(1);
				var row = table.insertRow(table.rows.length);
				row.className = "student";
				var name = row.insertCell(0);
				name.setAttribute("class", "name");
				var text1 = document.createTextNode(data[i].nome);
				name.appendChild(text1);

				var surname = row.insertCell(1);
				surname.setAttribute("class", "surname");
				text1 = document.createTextNode(data[i].cognome);
				surname.appendChild(text1);

				var present = row.insertCell(2);
				var radio1 = document.createElement("input");
				radio1.setAttribute("type", "radio");
				radio1.name = "presente" + i;
				radio1.value = "1";
				radio1.setAttribute("class", "radio1");
				present.appendChild(radio1);

				var absent = row.insertCell(3);
				var radio2 = document.createElement("input");
				radio2.setAttribute("type", "radio");
				radio2.name = "presente" + i;
				radio2.value = "0"; 
				radio2.setAttribute("class", "radio2");
				absent.appendChild(radio2);

				var cf = row.insertCell(4);
				text1 = document.createTextNode(data[i].codiceFiscale);
				cf.appendChild(text1);
				cf.setAttribute("class", "invisible cf");

			}	
			var oldButton = document.getElementById("buttonPresenze");
			if (oldButton != null) {
			    document.getElementById("AJAXsection").removeChild(oldButton);
			}
			var button = document.createElement("input");
		    button.setAttribute("type", "button");
		    button.setAttribute("id", "buttonPresenze");
		    button.setAttribute("value", "Aggiungi presenze");
		    button.addEventListener("click", creaLezione);
		    document.getElementById("AJAXsection").appendChild(button);
		    students.appendChild(table);
		    students.setAttribute("class", "");
		} else {
			alert("Error during AJAX call. Please try again");
		}
	}	
}

function Allievo() {
	this.nome = "";
	this.cognome = "";
	this.presente = "";
	this.codiceFiscale = "";
}

function creaLezione() {
	var date = new Date().toISOString().slice(0,10);
	var json = generaDatiPresenze();
	if (json == null) {
		return;
	}
	var xmlhttpObject = new XMLHttpRequest();
	xmlhttpObject.onreadystatechange = handleResponseCreaLezione;
	var url = contextPath + "/NewLessonController;jsessionid=" + sessionID;
	xmlhttpObject.open("POST", url, true)
	xmlhttpObject.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
	xmlhttpObject.send("presenze="+json+"&data="+date);
}

function handleResponseCreaLezione() {
	var error = "Error";
	var success = "Success";
	if (this.readyState == 4) {
		if (this.status == 200) {
			var data = this.responseText;
			if(data == error) {
				var text = document.createTextNode("Errore: Lezione gia' esistente");				
			} 
			if (data === success) {
				var text = document.createTextNode("Inserimento completato");
				trovaLezioni();
			}
			var response = document.createElement("div");
			response.appendChild(text);
			document.getElementById("AJAXsection").appendChild(response);
		}
	}
}

function generaDatiPresenze() {
	var students = document.getElementsByClassName("student");
	var currentCell;
	var allievi = [];
	for (var i = 0; i < students.length; i++) {
		 var allievo = new Allievo();
		 currentCell = students[i].getElementsByClassName("name");
		 allievo.nome = currentCell[0].innerHTML;
		 currentCell = students[i].getElementsByClassName("surname");		 
		 allievo.cognome = currentCell[0].innerHTML;

		 if (students[i].getElementsByClassName("radio1")[0].checked) {
			currentCell = students[i].getElementsByClassName("radio1");		 
			allievo.presente = currentCell[0].value;
		 } else if (students[i].getElementsByClassName("radio2")[0].checked) {
		 	currentCell = students[i].getElementsByClassName("radio2");
		 	allievo.presente = currentCell[0].value;
		 } else {
			 alert("Inserire voto mancante. Studente #" + i);
			 return;
		 }
		 currentCell = students[i].getElementsByClassName("cf");
		 allievo.codiceFiscale = currentCell[0].innerHTML;
		 allievi.push(allievo);
	}
	return JSON.stringify(allievi);	
}

/*
function generaDatiPresenze() {
	var students = document.getElementsByClassName("student");
	var currentCell;
	var allievi = [];
	for (var i = 0; i < students.length; i++) {
		 var allievo = new Allievo();
		 currentCell = students[i].getElementsByClassName("name");
		 allievo.nome = currentCell[0].innerHTML;
		 currentCell = students[i].getElementsByClassName("surname");		 
		 allievo.cognome = currentCell[0].innerHTML;
		 if (students[i].getElementsByClassName("radio1").length == 0) {
			 alert("Array vuoto");
		 }
		 if (students[i].getElementsByClassName("radio1")[0].checked) {
			currentCell = students[i].getElementsByClassName("radio1");		 
			allievo.presente = currentCell[0].value;
		 }
		 if (students[i].getElementsByClassName("radio2")[0].checked) {
		 	currentCell = students[i].getElementsByClassName("radio2");
		 	allievo.presente = currentCell[0].value;
		 }
		 currentCell = students[i].getElementsByClassName("cf");
		 allievo.codiceFiscale = currentCell[0].innerHTML;
		 allievi.push(allievo);
	}
	var json = JSON.stringify(allievi);
	alert(json);
	return json;
	//return JSON.stringify(allievi);	
}
*/