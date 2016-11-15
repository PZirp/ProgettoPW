window.addEventListener("load", trovaPresenzeStudente)
window.addEventListener("load", trovaEsamiStudente)

function trovaPresenzeStudente() {
	var xmlhttpObject = new XMLHttpRequest();
	xmlhttpObject.onreadystatechange = handleResponsePresenzeStudente;
	var url = contextPath + "/PresenzaStudenteController;jsessionid=" + sessionID;
	xmlhttpObject.open("GET", url, true)
	xmlhttpObject.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
	xmlhttpObject.send();
}

function handleResponsePresenzeStudente() {
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
		
				var dataLezione = row.insertCell(0);
				dataLezione.setAttribute("class", "data");
				text1 = document.createTextNode(data[i].date);
				dataLezione.appendChild(text1);
				
				var pres = row.insertCell(1);
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

// Script per esami

function trovaEsamiStudente() {
	var xmlhttpObject = new XMLHttpRequest();
	xmlhttpObject.onreadystatechange = handleResponseEsamiStudente;
	var url = contextPath + "/StudentExamController;jsessionid=" + sessionID;
	xmlhttpObject.open("GET", url, true)
	xmlhttpObject.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
	xmlhttpObject.send();
}

function handleResponseEsamiStudente() {
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
		
				var dataLezione = row.insertCell(0);
				dataLezione.setAttribute("class", "data");
				text1 = document.createTextNode(data[i].data);
				dataLezione.appendChild(text1);
				
				var pres = row.insertCell(1);
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