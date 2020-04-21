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
	$(".nav-item a").on("click", function(e) {
		e.preventDefault();
		pageForm.append("<input type='hidden' name='sort' value='" + $(this).data("sort") + "'>");
		console.log(pageForm.find("input[name='pageNum']").val());
		console.log(pageForm.find("input[name='amount']").val());
		var cri = {"pageNum" : pageForm.find("input[name='pageNum']").val(), 
					"amount" : pageForm.find("input[name='amount']").val(),
					"sort" : $(this).data("sort")}
//		pageForm.submit();
		
		$.ajax({
			type: "GET",
			url : "/product/list2",
			data : cri
		});
	});
	
});
