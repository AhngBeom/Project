$(document)
		.ready(
				function() {
					(function() {
						var cart;
						$(".card")
								.each(
										function(i, data) {
											var pno = $(this).data("pno");
											var index = $(this).data("index");
											$
													.getJSON(
															"/admin/getAttachList",
															{
																pno : pno
															},
															function(arr) {
																console
																		.log(arr);
																if (arr.length != 0) {
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