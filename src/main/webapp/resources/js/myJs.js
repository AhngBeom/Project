$(document).ready(function() {
	var time = setInterval(function() {
		var now = new Date();
		$("#time").html(now);
	}, 1000);
	$('[data-toggle="tooltip"]').tooltip();
});
