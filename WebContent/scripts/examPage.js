window.addEventListener("load", trovaEsami)
window.addEventListener("load", setUpEsami)

function setUpEsami() {
	document.getElementById("createEsame").addEventListener("click", trovaStudentiEsame);
}

function trovaEsami() {
	var xmlhttpObject = new XMLHttpRequest();
	xmlhttpObject.onreadystatechange = handleResponseEsami;
	var url = contextPath + "/RetrieveExamController;jsessionid=" + sessionID;
	xmlhttpObject.open("GET", url, true)
	xmlhttpObject.setRequestHeader("Content-type", "text/html");
	xmlhttpObject.send();	
}

function handleResponseEsami() {
	if (this.readyState == 4) {
		if (this.status == 200) {
			var data = JSON.parse(this.responseText);
			var old = document.getElementById("examList");
			if (old != null) {
				old.parentNode.removeChild(old);
			}
			var select = document.createElement("select");
		    select.setAttribute("id", "examList");
			select.addEventListener("change", trovaRisEsami);
			for (var i = 0; i < data.length; i++) {
				var option = document.createElement("option");
				option.setAttribute("value", data[i].codiceEsame)
				option.innerHTML = data[i].data;
				select.appendChild(option);
			}	
			document.getElementById("esamiPrecedenti").insertBefore(select, document.getElementById("listaEsami"));
		} else {
			alert("Error during AJAX call. Please try again");
		}
	}	
}


function trovaRisEsami() {
	var xmlhttpObject = new XMLHttpRequest();
	xmlhttpObject.onreadystatechange = handleResponseRisEsami;
	var value = document.getElementById("examList").value;	
	var url = contextPath + "/ExamPartecipantController;jsessionid=" + sessionID;
	xmlhttpObject.open("POST", url, true)
	xmlhttpObject.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
	xmlhttpObject.send("examCode="+value);	
}

function handleResponseRisEsami() {
	if (this.readyState == 4) {
		if (this.status == 200) {
			var data = JSON.parse(this.responseText);
			var table = document.getElementById("listaEsami").getElementsByTagName("tbody")[0];
			var students = document.getElementById("listaEsami");
			students.removeChild(table);
			table =	document.createElement("tbody");
		
			for (var i = 0; i < data.length; i++) {
				var row = table.insertRow(table.rows.length);
				row.className = "esameStudente";
				var name = row.insertCell(0);
				name.setAttribute("class", "name");
				var text1 = document.createTextNode(data[i].Nome);
				name.appendChild(text1);
				
				var surname = row.insertCell(1);
				surname.setAttribute("class", "surname");
				text1 = document.createTextNode(data[i].Cognome);
				surname.appendChild(text1);				
				
				var pres = row.insertCell(2);
				pres.setAttribute("class", "voto");
				text1 = document.createTextNode(data[i].voto);
				pres.appendChild(text1);
			}
			students.appendChild(table);
			students.setAttribute("class", "");
			
		} else {
			alert("Error during AJAX call. Please try again");
		}
	}	
}

function trovaStudentiEsame() {
	var xmlhttpObject = new XMLHttpRequest();
	xmlhttpObject.onreadystatechange = handleResponseTrovaStudentiEsami;
	var url = contextPath + "/FindStudentsServlet;jsessionid=" + sessionID;
	xmlhttpObject.open("POST", url, true)
	xmlhttpObject.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
	xmlhttpObject.send();
}

function handleResponseTrovaStudentiEsami() {
	if (this.readyState == 4) {
		if (this.status == 200) {
			var table = document.getElementById("formEsame").getElementsByTagName("tbody")[0];
			var students = document.getElementById("formEsame");
			students.removeChild(table);
			table =	document.createElement("tbody");
			var data = JSON.parse(this.responseText);
			for (var i = 0; i < data.length; i++) {
				var row = table.insertRow(table.rows.length);
				row.className = "studentEx";
				var name = row.insertCell(0);
				name.setAttribute("class", "name");
				var text1 = document.createTextNode(data[i].nome);
				name.appendChild(text1);

				var surname = row.insertCell(1);
				surname.setAttribute("class", "surname");
				text1 = document.createTextNode(data[i].cognome);
				surname.appendChild(text1);
				
				var vote = row.insertCell(2);
				vote.setAttribute("class", "vote");
				var select = document.createElement("select");
			    select.setAttribute("class", "selectVote");
				for (var j = 1; j <= 10; j++) {
					var option = document.createElement("option");
					option.setAttribute("value", j)
					option.innerHTML = j;
					select.appendChild(option);
				}	
				vote.appendChild(select);				
				var cf = row.insertCell(3);
				text1 = document.createTextNode(data[i].codiceFiscale);
				cf.appendChild(text1);
				cf.setAttribute("class", "invisible cf");
			}
			var oldButton = document.getElementById("buttonEsame");
			if (oldButton != null) {
			    document.getElementById("AJAXesame").removeChild(oldButton);
			}
			var button = document.createElement("input");
		    button.setAttribute("type", "button");
		    button.setAttribute("id", "buttonEsame");
		    button.setAttribute("value", "Aggiungi esame");
		    button.addEventListener("click", creaEsame);
		    document.getElementById("AJAXesame").appendChild(button);
		    students.appendChild(table);
		    students.setAttribute("class", "");
		} else {
			alert("Error during AJAX call. Please try again");
		}
	}	
}

function creaEsame() {
	var date = new Date().toISOString().slice(0,10);
	var json = generaDatiEsame();
	var xmlhttpObject = new XMLHttpRequest();
	xmlhttpObject.onreadystatechange = handleResponseCreaEsame;
	var url = contextPath + "/NewExamController;jsessionid=" + sessionID;
	xmlhttpObject.open("POST", url, true)
	xmlhttpObject.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
	xmlhttpObject.send("voti="+json+"&data="+date);
}

function handleResponseCreaEsame() {
	var error = "Error";
	var success = "Success";
	if (this.readyState == 4) {
		if (this.status == 200) {
			var data = this.responseText;
			if(data === error) {
				var text = document.createTextNode("Errore: Esame gia' esistente");				
			} 
			if (data === success) {
				var text = document.createTextNode("Inserimento completato");
				trovaEsami();
			}			
			var response = document.createElement("div");
			response.appendChild(text);
			document.getElementById("AJAXesame").appendChild(response);
		}
	}
}

function Esame() {
	this.nome = "";
	this.cognome = "";
	this.data = "";
	this.voto = "";
	this.codiceEsame = "";
	this.cf = "";
}

function generaDatiEsame() {
	var students = document.getElementsByClassName("studentEx");
	var currentCell;
	var esami = [];
	for (var i = 0; i < students.length; i++) {
		 var esame = new Esame();
		 currentCell = students[i].getElementsByClassName("name");
		 esame.nome = currentCell[0].innerHTML;
		 currentCell = students[i].getElementsByClassName("surname");		 
		 esame.cognome = currentCell[0].innerHTML;
		 
		 currentCell = students[i].getElementsByClassName("vote");
		 var value = currentCell[0].getElementsByClassName("selectVote")[0].value;
		 esame.voto = value;
		 currentCell = students[i].getElementsByClassName("cf");
		 esame.cf = currentCell[0].innerHTML;
		 esami.push(esame);
	}
	return JSON.stringify(esami);	
}


