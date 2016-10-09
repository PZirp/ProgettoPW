window.addEventListener("load", function() {
	var x = document.getElementById("submit");
	x.addEventListener("click", clickHandler);
})

function clickHandler() {
	var req = new XMLHttpRequest();
	prepareRequest(req);
}

function prepareRequest(req) {
	var a = document.getElementsByName("lista");
	var value;
	for (var i = 0; i < a.length; i++) {
		if (a[i].checked) {			
			value = a[i].value;
		}
	}	
	var codice = document.getElementById("codice").value;

	if (value === "studenti") {
		req.onreadystatechange = handleResponseA;
	//	var url = "../AjaxServlet?lista="+value+"&codice="+codice+"&ajax=true";
		//alert("studenti");
	} else if (value === "presenze") {
		req.onreadystatechange = handleResponseB;
		//var url = "../AjaxServlet2?lista="+value+"&codice="+codice+"&ajax=true";
		//alert("presenze");
	}
	var url = "../AjaxServlet3?lista="+value+"&codice="+codice+"&ajax=true";
	req.open("GET", url, true);
	req.send();
	//alert("Richiesta eseguita");
}


/*function prepareRequest(req) {
	var a = document.getElementsByName("lista");
	var value;
	for (var i = 0; i < a.length; i++) {
		if (a[i].checked) {			
			value = a[i].value;
		}
	}
	var codice = document.getElementById("codice").value;
	var url = "../AjaxServlet?lista="+value+"&codice="+codice+"&ajax=true";
	req.open("GET", url, true);
	req.send();
	//alert("Something");
}*/

function handleResponseA() {
	var data = JSON.parse(this.responseText);
	if (this.readyState == 4) {
		if (this.status == 200) {
			for (var i = 0; i < data.length; i++) {
				var div = document.createElement("div");
				var text = document.createTextNode(data[i].nome + " " + data[i].cognome);
				div.style.backgroundColor = "red";
				div.style.width = "200px";
				div.style.height = "20px";
				div.appendChild(text);
				document.getElementById("results").appendChild(div);
			}	
			//alert("Something2");

		} else {
			alert("Error during AJAX call. Please try again");
		}
	}	
}
function handleResponseB() {
	var data = JSON.parse(this.responseText);
	if (this.readyState == 4) {
		if (this.status == 200) {
			for (var i = 0; i < data.length; i++) {
				var div = document.createElement("div");
				var text = document.createTextNode(data[i].nome + " " + data[i].cognome + " Codice lezione: " + data[i].codLezione);
				div.style.backgroundColor = "red";
				div.style.width = "400px";
				div.style.height = "20px";
				div.appendChild(text);
				document.getElementById("results").appendChild(div);
			}	
			//alert("Something2");

		} else {
			alert("Error during AJAX call. Please try again");
		}
	}	
}