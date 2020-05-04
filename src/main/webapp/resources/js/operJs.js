$(document).ready(function() {
	$("#listOper").on("click", function(e) {
		$("form[method = 'get']").submit();
	});
	var pageForm = $("#pageForm");
	$(".page-num a").on("click", function(e) {
		e.preventDefault();
		pageForm.find("input[name='pageNum']").val($(this).attr("href"));
		pageForm.submit();
	});
	
	$(".asort").on("click", function(e) {
		pageForm.find("input[name='column']").val($(this).data("col"));
		pageForm.submit();
	});

});
