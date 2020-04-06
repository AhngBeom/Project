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
											var selectTag = $("select[data-index='"
													+ i + "']");
											$
													.getJSON(
															"/cartRead",
															{
																userID : "unknown"
															},
															function(arr) {
																var amount = arr[i].amount;
																$(
																		selectTag
																				.children("option"))
																		.each(
																				function(
																						i,
																						e) {
//																					console
//																							.log(Number($(
//																									this)
//																									.val()));
																					if (Number($(
																							this)
																							.val()) === amount) {
																						console
																								.log($(
																										this)
																										.val());
																						 $(
																						 selectTag
																						 .children("option[value='"
																						 +
																						 amount
																						 +
																						 "']"))
																						 .attr(
																						 "selected",
																						 "selected");
																					}
																				});
															});
											$
													.getJSON(
															"/admin/getAttachList",
															{
																pno : pno
															},
															function(arr) {
																// console
																// .log(arr);
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