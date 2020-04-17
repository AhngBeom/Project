$(document).ready(function() {
	$("#listOper").on("click", function(e) {
		$("form[method = 'get']").submit();
	});
	var pageForm = $("#pageForm");
	$(".page-num a").on("click", function(e) {
		e.preventDefault();
		console.log('click');
		pageForm.find("input[name='pageNum']").val($(this).attr("href"));
		pageForm.submit();
	});
});
