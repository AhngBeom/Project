$(document).ready(
		function() {
			var operForm = $("#operForm");
			var headForm = $("#headerForm");
			$(".nav-product").on("click", function(e){
				console.log($(this).data('ctg'));
				headForm.attr("action", "/product");
				headForm.append("<input type='hidden' name='category' value='"
						+ $(this).data('ctg') + "'>");
				headForm.submit();
			});
			
			$('[data-toggle="tooltip"]').tooltip();
			
			function cartADD(vo){
				console.log(vo);
				$.getJSON("/product/get/" + vo.pno
						+ ".json", function(result) {
					console.log(result);
					$.ajax({
						type : 'post',
						url : '/cartAdd',
						data : JSON.stringify(vo),
						success : alert("장바구니에 추가되었습니다."),
						complete : operForm.submit(),
						contentType : "application/json; charset=utf-8"
					});
				});
			}
			function cartItemCheck(vo){
				$.getJSON("/cartList.json", function(result) {
							console.log("장바구니 담기");
							$.getJSON("/product/get/" + vo.pno
									+ ".json", function(result) {
								var pdtName = result.name;
								console.log(pdtName);
								$("#alertModal .modal-title").html(pdtName);
								
								var modalBody = "<div class='input-group mb-3'>"+
								"<div class='input-group-prepend'>" +
									"<span class='input-group-text'>수량</span>" +
									"</div>" +
									"<select class='custom-select' name='amount' data-index='${status.index }' data-amount=''>" +
									"<option value='1'>1</option>" +
									"<option value='2'>2</option>" +
									"<option value='3'>3</option>" +
									"<option value='4'>4</option>" +
									"<option value='5'>5</option>" +
									"<option value='6'>6</option>" +
									"<option value='7'>7</option>" +
									"<option value='8'>8</option>" +
									"<option value='9'>9</option>" +
									"<option value='10'>10</option>" +
									"</select>" +
									"</div>";
								$("#alertModal .modal-body").html(modalBody);
								$("#alertModal #modalAccept").remove();
								$("#alertModal #modalSecFunc").html("장바구니 담기");
								$("#alertModal").modal('show');
								
								$("#alertModal #modalSecFunc").on("click", function(e){
									var amount = $("select[name='amount']").val();
									var cartVO = {userID : vo.userID, pno : vo.pno, amount : amount};
									cartADD(cartVO);
									$("#alertModal").modal('hide');
								});
							});
// }
// });
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
						var userID = $(this).data("userid");
						var pno = $(this).data("pno");
						var amount = $("select[name='amount']").val();
						var itemVO = {userID, pno, amount};
						cartADD(itemVO);
					});
			$(".add-cart-dirbtn").on(
					"click",
					function(e) {
						var userID = $.trim($(".user-info").html());
						var pno = $(this).data("pno");
						var itemVO = {userID, pno};
						cartItemCheck(itemVO);
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
						$("#alertModal .modal-body").html("장바구니에 보관되어있는 상품이 있습니다. <br> 현재 상품만 구매하시겠습니까?");
						$("#alertModal #modalAccept").html("예");
						$("#alertModal #modalSecFunc").html("장바구니에 추가 & 구매");
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
