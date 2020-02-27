$(document).ready(function() {
	$(".add-cart-btn").on("click", function(e) {
		alert("장바구니 추가");
		console.log("PNO : " + $(this).data("pno"));
		sessionStorage.setItem("CART1", $(this).data("pno"));
		$.getJSON("/product/get/" + $(this).data("pno") + ".json", function(result) {
			console.log(result);
		});
	});
	$(".dir-buy-btn").on("click", function(e) {
		console.log("상품 주문 화면 출력");
	});
	$(".get-btn").on("click", function(e) {
		location.href = "/product/get";
	});

	var form = $("#operForm");
	$("a[data-oper='get']").on("click", function(e) {
		var pno = $(this).data("pno");
		form.append("<input type='hidden' name='pno' value='" + pno + "'>");
		form.attr("action", "/product/get").submit();
	});
});
