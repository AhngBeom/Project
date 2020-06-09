$(document)
		.ready(
				function() {
					var operForm = $("#operForm");
					var headForm = $("#headerForm");

					function operation(form, data) {
						form.append("<input type='hidden' name='pno' value='"
								+ data + "'>");
						form.attr("action", "/product/get").submit();
					}

					$(document).on("click", "a[data-oper='get']", function(e) {
						var pno = $(this).data("pno");
						console.log(pno);
						operation(headForm, pno);
					});

					$(".nav-product")
							.on(
									"click",
									function(e) {
										console.log($(this).data('ctg'));
										headForm.attr("action", "/product/list");
										headForm
												.append("<input type='hidden' name='category' value='"
														+ $(this).data('ctg')
														+ "'>");
										headForm.submit();
									});

					$("#listOper").on("click", function(e) {
						$("form[method = 'get']").submit();
					});

					var pageForm = $("#pageForm");

					$(".pdt-mod-btn")
							.on(
									"click",
									function(e) {
										pageForm.attr("action",
												"/admin/pdtModify");
										pageForm
												.append("<input type='hidden' name='pno' value='"
														+ $(this).data("pno")
														+ "'>");
										pageForm.submit();
									});
					$(".pdt-del-btn")
							.on(
									"click",
									function(e) {
										var pno = $(this).data("pno");
										$('#alertModal').modal('show');
										$("#acceptBtn")
												.on(
														"click",
														function(e) {
															pageForm
																	.append("<input type='hidden' name='pno' value='"
																			+ pno
																			+ "'>");
															pageForm
																	.attr(
																			"action",
																			"/admin/pdtDelete");
															pageForm.attr(
																	"method",
																	"post")
																	.submit();
														});
									});

					$(".page-num a").on(
							"click",
							function(e) {
								e.preventDefault();
								pageForm.find("input[name='pageNum']").val(
										$(this).attr("href"));
								pageForm.submit();
							});

					$(".asort").on(
							"click",
							function(e) {
								pageForm.find("input[name='column']").val(
										$(this).data("col"));
								pageForm.submit();
							});

				});
