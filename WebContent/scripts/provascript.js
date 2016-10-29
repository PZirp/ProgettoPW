window.addEventListener("load", function() {
	var linkbuttons = document.getElementsByClassName("linkbutton");
	linkbuttons[0].addEventListener("click", mainNavbarResponsive);
	linkbuttons[1].addEventListener("click", martialArtResponsive);
	linkbuttons[2].addEventListener("click", fitnessResponsive);
})

window.addEventListener("load", function() {
	var par = "page";
})

function mainNavbarResponsive() {
    var x = document.getElementById("navbar");
    if (x.className === "barbody") {
        x.className += " responsive";
    } else {
        x.className = "barbody";
    }
}

function martialArtResponsive() {
    var x = document.getElementById("arti");
    if (x.className === "subs") {
        x.className += " responsive";
    } else {
        x.className = "subs";
    }
    document.getElementById("fitness").className = "subs";
    
}
function fitnessResponsive() {
    var x = document.getElementById("fitness");
    if (x.className === "subs") {
        x.className += " responsive";
    } else {
        x.className = "subs";
    }
    document.getElementById("arti").className = "subs";
}

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
				div.style.backgroundColor = "red";
				div.style.width = "200px";
				div.style.height = "20px";
				div.appendChild(text);
				document.getElementById("AJAXsection").appendChild(div);
			}			
		} else {
			alert("Error during AJAX call. Please try again");
		}
	}	

}