function myFunction() {
    var x = document.getElementById("navbar");
    if (x.className === "barbody") {
        x.className += " responsive";
    } else {
        x.className = "barbody";
    }
}

function myFunction2() {
    var x = document.getElementById("arti");
    if (x.className === "subs") {
        x.className += " responsive";
    } else {
        x.className = "subs";
    }
    document.getElementById("fitness").className = "subs";
    
}
function myFunction3() {
    var x = document.getElementById("fitness");
    if (x.className === "subs") {
        x.className += " responsive";
    } else {
        x.className = "subs";
    }
    document.getElementById("arti").className = "subs";
}


/*function Slideshow( element ) {
	this.el = document.querySelector( element );
	this.init();	
}

Slideshow.prototype = {
	init: function() {
	    this.wrapper = this.el.querySelector( ".slider-wrapper" );
		this.slides = this.el.querySelectorAll( ".slide" );
		this.previous = this.el.querySelector( ".slider-previous" );
		this.next = this.el.querySelector( ".slider-next" );
		this.index = 0;
		this.total = this.slides.length;
		this.actions();
	},
	_slideTo: function( pointer ) {
		var currentSlide = this.slides[pointer]; // Slide corrente
		this.wrapper.style.left = "-" + currentSlide.offsetLeft + "px";
	},
	actions: function() {
		var self = this;
		self.next.addEventListener( "click", function() {
			self.index++;
			self.previous.style.display = "block";
				
			if( self.index == self.total - 1 ) {
				self.index = self.total - 1;
				self.next.style.display = "none";
			}
				
			self._slideTo( self.index );
				
		}, false);
			
		self.previous.addEventListener( "click", function() {
			self.index--;
			self.next.style.display = "block";
				
			if( self.index == 0 ) {
				self.index = 0;
				self.previous.style.display = "none";
			}
				
			self._slideTo( self.index );
				
		}, false);
	}
};*/


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
				document.getElementById("prova").appendChild(div);
			}			
		} else {
			alert("Error during AJAX call. Please try again");
		}
	}	

}