<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ include file="../includes/header.jsp"%>


<form action="" method="get" id="operForm"></form>

<div id="layoutSidenav_content">
	<main>
		<div class="container-fluid">
			<h1 class="mt-4">Product</h1>
			<ol class="breadcrumb mb-4">
				<li class="breadcrumb-item active">Product</li>
			</ol>

			<div class="row">
				<c:forEach items="${pdt }" var="pdt" varStatus="status">
					<div class="column col-xl-3 col-md-6">
						<div class="card mb-3">
							<div class="card-image">
								<img class="card-header"
									src="/resources/assets/img/readyToImg.jpg" alt="Card image"
									data-pno="${pdt.pno }" data-index="${status.index }"
									style="width: 100%">
								<div class="opacity-div d-flex justify-content-around w-100">
									<button class="btn btn-warning add-cart-btn"
										data-pno="${pdt.pno }">
										<i class="fas fa-cart-plus"></i> 장바구니
									</button>
									<button class="btn btn-success dir-buy-btn"
										data-pno="${pdt.pno }">바로 구매</button>
								</div>
							</div>
							<div class="card-body">
								<div class="h4 card-title">${pdt.title }</div>
								<div class="h5 card-text float-right">${pdt.price }￦</div>
							</div>
							<div class="card-footer">
								<a href="#" class="btn btn-primary get-btn float-right"
									data-oper="get" data-pno="${pdt.pno }">자세히</a>
							</div>
						</div>
					</div>
				</c:forEach>
			</div>
	</main>
	<script type="text/javascript">
		$(document)
				.ready(
						function() {
							(function() {
								$(".card-header")
										.each(
												function(i, titleImg) {
													var pno = $(this).data(
															"pno");
													var index = $(this).data(
															"index");
													$
															.getJSON(
																	"/admin/getAttachList",
																	{
																		pno : pno
																	},
																	function(
																			arr) {
																		if (arr.length > 0) {
																			console
																					.log(arr);
																			var imageThumbPath = encodeURIComponent(arr[i].uploadPath
																					+ "/s_"
																					+ arr[i].uuid
																					+ "_"
																					+ arr[i].fileName);
																			$(
																					".card-header[data-index='"
																							+ i
																							+ "']")
																					.attr(
																							"src",
																							"/display?fileName="
																									+ imageThumbPath);
																		}
																	});
												});
							})();
						})
	</script>

	<%@ include file="../includes/footer.jsp"%>