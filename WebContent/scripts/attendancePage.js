window.addEventListener("load", trovaLezioni)
window.addEventListener("load", setUp)

function setUp() {
	document.getElementById("createLesson").addEventListener("click", trovaStudenti);

}

function showDate() {
	alert(new Date().toISOString().slice(0,10));
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
			document.getElementById("AJAXsection").appendChild(select);
		
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
			var ajaxsection = document.getElementById("presence");
			while (presence.firstChild) {
				presence.removeChild(presence.firstChild);
				}
			for (var i = 0; i < data.length; i++) {
				var div = document.createElement("div");
				var text = document.createTextNode(data[i].nome + " " + data[i].cognome + " " + data[i].codiceFiscale + " " + data[i].presente);
				div.style.backgroundColor = "red";
				div.style.width = "600px";
				div.style.height = "20px";
				div.appendChild(text);
				presence.appendChild(div);
			}			
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
			var data = JSON.parse(this.responseText);
			var students = document.getElementById("students");
			for (var i = 0; i < data.length; i++) {
				var row = students.insertRow(1);
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
		    var button = document.createElement("input");
		    button.setAttribute("type", "button");
		    button.setAttribute("value", "Invia");
		    button.addEventListener("click", creaLezione);
			document.getElementById("AJAXsection").appendChild(button);

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
			alert("Il server dice:" + data);
			if(data === error) {
				alert("C'è stato un errore");
			} 
			if (data === success) {
				alert("Inserimento riuscito")
				trovaLezioni();
			}
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
		 } 
		 if (students[i].getElementsByClassName("radio2")[0].checked) {
		 	currentCell = students[i].getElementsByClassName("radio2");
		 	allievo.presente = currentCell[0].value;
		 }
		 currentCell = students[i].getElementsByClassName("cf");
		 allievo.codiceFiscale = currentCell[0].innerHTML;
		 allievi.push(allievo);
	}
	return JSON.stringify(allievi);
}