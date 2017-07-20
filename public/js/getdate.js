	function getOrderDate(id) {
		var date = Date();
		var dateAsString = date.toString();
		document.getElementById(id).value = dateAsString;
	}