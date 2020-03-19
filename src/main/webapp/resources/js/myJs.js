$(document).ready(
		function() {
			$('[data-toggle="tooltip"]').tooltip()

			$(".add-cart-btn").on(
					"click",
					function(e) {
						alert("장바구니 추가");
						var userID = "unknown";
						var pno = $(this).data("pno");
						var cartVO = {userID, pno};
						console.log(cartVO);
						
						$.getJSON("/product/get/" + $(this).data("pno")
								+ ".json", function(result) {
							console.log(result);
							$.ajax({
								type : 'post',
								url : '/cartAdd',
								data : JSON.stringify(cartVO),
								contentType : "application/json; charset=utf-8"
							});
						});
					});
			$(".cartItemDelBtn").on("click", function(e){
				console.log($(this).data("pno"));
				$.ajax({
					type : 'post',
					url : '/cartItemDel',
					data : {userID : "unknown", pno : $(this).data("pno")},
					 error : function() {
				          alert('ERROR');
				        },
					success : alert("상품이 장바구니에서 정상적으로 삭제되었습니다."),
					complete : location.reload()
				});
				
			});
			$(".cart-toggle").on("click", function(e) {
				$.getJSON("/cartList.json", function(result) {
					$(result).each(function(i, item){
						console.log(item);
						sessionStorage.setItem("CART" + i, JSON.stringify(item));
					});
				});
			});
			$(".dir-buy-btn").on("click", function(e) {
				console.log("상품 주문 화면 출력");
				console.log(JSON.parse(sessionStorage.getItem("CART0")));
			});
			$(".get-btn").on("click", function(e) {
				location.href = "/product/get";
			});

			var form = $("#operForm");
			$("a[data-oper='get']").on(
					"click",
					function(e) {
						var pno = $(this).data("pno");
						form.append("<input type='hidden' name='pno' value='"
								+ pno + "'>");
						form.attr("action", "/product/get").submit();
					});
			$(".pdt-del-btn").on("click", function(e){
				var pno = $(this).data("pno");
				$('#alertModal').modal('show');
				$("#acceptBtn").on("click", function(e){
					form.append("<input type='hidden' name='pno' value='" + pno + "'>");
					form.attr("action", "/admin/pdtDelete");
					form.attr("method", "post").submit();
				});
			});
		});
