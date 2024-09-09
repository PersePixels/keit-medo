
addEventListener("message", function(event) {

    if(event.data.meta == "s") {
		document.getElementById("s").innerHTML = event.data.html;
	} else if (event.data.meta == "t") {
		document.getElementById("t").innerHTML = event.data.html;
	} else if (event.data.meta == "d") {
		document.getElementById("d").innerHTML = event.data.html;
	}
	
});
