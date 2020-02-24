$(document).ready(function() {
	$(".add-cart-btn").on("click", function(e) {
		console.log("장바구니 추가");
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
	/*
	 * if (matchMedia("screen and (min-width: 1200px)").matches) {
	 * $(".card-header").addClass("d-flex", "flex-row"); } else if
	 * (matchMedia("screen and (min-width: 768px)").matches) {
	 * $(".card-header").removeClass("d-flex", "flex-row"); }
	 */

});
