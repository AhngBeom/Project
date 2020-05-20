$(document)
		.ready(
				function() {
					$(".cartItemDelBtn")
							.on(
									"click",
									function(e) {
										var pno = $(this).data("pno");
										var userid = $.trim($(".user-info")
												.html());
										$
												.ajax({
													type : 'post',
													url : '/cartItemDel',
													data : {
														userID : userid,
														pno : pno
													},
													error : function() {
														alert('ERROR');
													},
													success : alert("상품이 장바구니에서 정상적으로 삭제되었습니다."),
													complete : operForm.attr(
															"action",
															"/product/cart")
															.submit(),
													contentType : "application/json; charset=utf-8"
												});
									});
					$("#cartAllDelBtn")
							.on(
									"click",
									function(e) {
										$
												.ajax({
													type : 'post',
													url : '/cartAllDel',
													error : function() {
														alert('ERROR');
													},
													success : alert("상품들이 장바구니에서 정상적으로 삭제되었습니다."),
													complete : operForm.attr(
															"action",
															"/product/cart")
															.submit()
												});
									});
					(function() {
						console.log($.trim($(".user-info").html()));
						var cart;
						$(".card")
								.each(
										function(i, data) {
											var pno = $(this).data("pno");
											var userid = $.trim($(".user-info").html());
											var index = $(this).data("index");
											var selectTag = $("select[data-index='" + i + "']");
											var priceTag = ($(this).find("input[name='price']"));
											$.getJSON("/cartRead", {userID : userid},
												function(arr) {
													if (arr.length > 0) {
														console.log(arr[i]);
														var amount = arr[i].amount;
														$(selectTag.children("option")).each(
															function(i, e) {
																if (Number($(this).val()) === amount) {
																	$(selectTag.children("option[value='" + amount + "']"))
																			.attr("selected", "selected");
																}
															});
														var price = arr[i].amount * priceTag.val();
														console.log(price);
														priceTag.val(price);
													}
												});
											$.getJSON(
															"/product/getAttachList",
															{
																pno : pno
															},
															function(arr) {
																if (arr.length > 0) {
																	var imageThumbPath = encodeURIComponent(arr[0].uploadPath
																			+ "/s_"
																			+ arr[0].uuid
																			+ "_"
																			+ arr[0].fileName);
																	$(
																			".card[data-index='"
																					+ i
																					+ "'] .card-body div img")
																			.attr(
																					"src",
																					"/display?fileName="
																							+ imageThumbPath);
																}
															});

										});
					})();
				})