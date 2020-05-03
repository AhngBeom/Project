$(document).ready(
		function() {
			var headForm = $("#headerForm");
			$(".nav-product").on("click", function(e){
				console.log($(this).data('ctg'));
				headForm.attr("action", "/product");
				headForm.append("<input type='hidden' name='category' value='"
						+ $(this).data('ctg') + "'>");
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
			function operation(form, data){
				form.append("<input type='hidden' name='pno' value='"
						+ data + "'>");
				form.attr("action", "/product/get").submit();
			} 
			
			$(".add-cart-btn").on(
					"click",
					function(e) {
						alert("장바구니에 추가되었습니다.");
						var userID = "unknown";
						var pno = $(this).data("pno");
						var amount = $("select[name='amount']").val();
						var cartVO = {userID, pno, amount};
						
						$.getJSON("/product/get/" + pno
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
					complete : operForm.attr("action", "/product/cart").submit()
				});
				
			});
			$(".cart-toggle").on("click", function(e) {
				var cart = $(".cart-list");
				$.getJSON("/cartList.json", function(result) {
					var str = "";
					$(result).each(function(i, item){
						str += "<a class='dropdown-item' data-oper='get' data-pno='" 
							+ item.pno + "'>" + item.name + "</a>";
					});
					cart.html(str);
				});
			});
			
			var operForm = $("#operForm");
			
			$(".dir-buy-btn").on("click", function(e) {
				var pno = $(this).data("pno");
				$.getJSON("/cartList.json", function(result) {
					if(result.length === 0){
						operForm.attr("action", "/product/orderDirect");
						operForm.append("<input type='hidden' name='pno' value='"
								+ pno + "'>");
						operForm.submit();
					}
					if(result.length > 0){
						$("#alertModal").modal('show');
						$("#alertModal #modalAccept").on("click", function(e){
							operForm.attr("action", "/product/orderDirect");
							operForm.append("<input type='hidden' name='pno' value='"
									+ pno + "'>");
							operForm.submit();
						});
						$("#alertModal #modalSecFunc").on("click", function(e){
							var cartVO = {userID : "unknown", pno : pno};
							cartADD(cartVO);
							$("#alertModal .modal-body").html("장바구니에 추가되었습니다.");
							$("#alertModal #modalAccept").html("주문하러 가기");
							$("#alertModal #modalSecFunc").html("계속 쇼핑");
							$("#alertModal").modal('show');
							$("#alertModal #modalAccept").on("click", function(e){
								operForm.attr("action", "/product/orderCart");
								operForm.submit();
							});
							$("#alertModal #modalSecFunc").on("click", function(e){
								operForm.submit();
							});
						});
					}
				});
				
			});
			var pageForm = $("#pageForm");
			$(document).on(
					"click", "a[data-oper='get']",
					function(e) {
						var pno = $(this).data("pno");
						console.log(pno);
						operation(operForm, pno);
					});
			$(".pdt-mod-btn").on("click", function(e){
				pageForm.attr("action", "/admin/pdtModify");
				pageForm.append("<input type='hidden' name='pno' value='" + $(this).data("pno") +"'>");
				pageForm.submit();
			});
			$(".pdt-del-btn").on("click", function(e){
				var pno = $(this).data("pno");
				$('#alertModal').modal('show');
				$("#acceptBtn").on("click", function(e){
					pageForm.append("<input type='hidden' name='pno' value='" + pno + "'>");
					pageForm.attr("action", "/admin/pdtDelete");
					pageForm.attr("method", "post").submit();
				});
			});
		});
