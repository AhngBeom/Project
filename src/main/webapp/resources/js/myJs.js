$(document).ready(
		function() {
			var headForm = $("#headerForm");
			$(".nav-product").on("click", function(e){
				console.log($(this).data('cate'));
				headForm.attr("action", "/product/category");
				headForm.append("<input type='hidden' name='cate' value='"
						+ $(this).data('cate') + "'>");
				headForm.submit();
			});
			
			$('[data-toggle="tooltip"]').tooltip()
			
			function cartADD(vo){
				console.log(vo);
				$.getJSON("/product/get/" + vo.pno
						+ ".json", function(result) {
					console.log(result);
					$.ajax({
						type : 'post',
						url : '/cartAdd',
						data : JSON.stringify(vo),
						contentType : "application/json; charset=utf-8"
					});
				});
			}
			$(".add-cart-btn").on(
					"click",
					function(e) {
						alert("장바구니에 추가되었습니다.");
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
			
			var operForm = $("#operForm");
			
			$(".dir-buy-btn").on("click", function(e) {
				$("#alertModal").modal('show');
				var pno = $(this).data("pno");
				$("#alertModal #modalAccept").on("click", function(e){
					operForm.attr("action", "/product/dirOrder");
					operForm.append("<input type='hidden' name='pno' value='"
							+ pno + "'>");
					operForm.submit();
				});
				$("#alertModal #modalSecFunc").on("click", function(e){
					var cartVO = {userID : "unknown", pno : pno};
					cartADD(cartVO);
				});
				
				console.log(pno);
// $.getJSON("/product/get", {pno : pno}, function(arr){
// console.log(arr);
// });
			});

			$("a[data-oper='get']").on(
					"click",
					function(e) {
						var pno = $(this).data("pno");
						operForm.append("<input type='hidden' name='pno' value='"
								+ pno + "'>");
						operForm.attr("action", "/product/get").submit();
					});
			$(".pdt-del-btn").on("click", function(e){
				var pno = $(this).data("pno");
				$('#alertModal').modal('show');
				$("#acceptBtn").on("click", function(e){
					operForm.append("<input type='hidden' name='pno' value='" + pno + "'>");
					operForm.attr("action", "/admin/pdtDelete");
					operForm.attr("method", "post").submit();
				});
			});
		});
