window.addEventListener("load", function() {
	var linkbuttons = document.getElementsByClassName("linkbutton");
	linkbuttons[0].addEventListener("click", mainNavbarResponsive);
	linkbuttons[1].addEventListener("click", martialArtResponsive);
	linkbuttons[2].addEventListener("click", fitnessResponsive);
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
