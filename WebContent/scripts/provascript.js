function Allievo(codFisc) {
	this.codFisc = codFisc;
}

function trovaAllievo() {
	var xmlhttpObject = new XMLHttpRequest();
	xmlhttpObject.onreadystatechange = handleResponse;
	var field = document.getElementById("codF");
	var cf = field.value;
	var all = new Allievo(cf);
	var all2 = new Allievo("DCCGTN11L06C361E");
	var array = [all, all2];
	var json = JSON.stringify(array);
	var url = "../AjaxServlet"; //?cf="+cf;
	xmlhttpObject.open("POST", url, true)
	xmlhttpObject.setRequestHeader("Content-type", "application/json");
	xmlhttpObject.setRequestHeader("json", json);
	xmlhttpObject.send();	

}

function handleResponse() {
	var data = JSON.parse(this.responseText);
	if (this.readyState == 4) {
		if (this.status == 200) {
			for (var i = 0; i < data.length; i++) {
				var form = document.getElementById("codF").innerHTML = data[i].nome;
				var div = document.createElement("div");
				var text = document.createTextNode(data[i].nome + " " + data[i].cognome);
				div.appendChild(text);
				div.style.backgroundColor = "red";
				div.style.width = "200px";
				div.style.height = "20px";
				document.body.appendChild(div);
			}			
		} else {
			alert("Error during AJAX call. Please try again");
		}
	}	

}
     