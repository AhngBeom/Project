<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ include file="../includes/header.jsp"%>

<style>
* {
	box-sizing: border-box;
}

body {
	margin: 0;
	font-family: Arial;
}

.header {
	text-align: center;
	padding: 32px;
}

.row {
	display: -ms-flexbox; /* IE10 */
	display: flex;
	-ms-flex-wrap: wrap; /* IE10 */
	flex-wrap: wrap;
	padding: 0 4px;
}

/* Create four equal columns that sits next to each other */
.column {
	-ms-flex: 25%; /* IE10 */
	flex: 25%;
	max-width: 25%;
	padding: 0 4px;
}

.column img {
	margin-top: 8px;
	vertical-align: middle;
	width: 100%;
}

/* Responsive layout - makes a two column-layout instead of four columns */
@media screen and (max-width: 800px) {
	.column {
		-ms-flex: 50%;
		flex: 50%;
		max-width: 50%;
	}
}

/* Responsive layout - makes the two columns stack on top of each other instead of next to each other */
@media screen and (max-width: 600px) {
	.column {
		-ms-flex: 100%;
		flex: 100%;
		max-width: 100%;
	}
}
</style>

<form action="" method="get" id="operForm"></form>

<div id="layoutSidenav_content">
	<main>
		<div class="container-fluid">
			<h1 class="mt-4">Product</h1>
			<ol class="breadcrumb mb-4">
				<li class="breadcrumb-item active">Product</li>
			</ol>
			<!-- 			<div class="row mb-4"> -->

			<%-- 				<c:forEach items="${pdt }" var="pdt" varStatus="status"> --%>
			<!-- 					<div class="column col-xl-3 col-md-6"> -->
			<!-- 						<div class="card"> -->
			<!-- 							<div class="card-image"> -->
			<!-- 								<img class="card-img-top" -->
			<!-- 									src="/resources/assets/img/readyToImg.jpg" alt="Card image" -->
			<%-- 									data-pno="${pdt.pno }" data-index="${status.index }" --%>
			<!-- 									style="width: 100%"> -->
			<!-- 																	<img class="card-img-top" -->
			<!-- 																	src="/display?fileName=2020%5C03%5C13%2Fs_47f3bb6f-73bf-4bac-a5e4-f7addb31a0bf_42-black-1_GEO_KR.jpg" alt="Card image" -->
			<!-- 																	style="width: 100%"> -->
			<!-- 								<div class="opacity-div d-flex justify-content-around w-100"> -->
			<!-- 									<button class="btn btn-warning add-cart-btn" -->
			<%-- 										data-pno="${pdt.pno }"> --%>
			<!-- 										<i class="fas fa-cart-plus"></i> 장바구니 -->
			<!-- 									</button> -->
			<!-- 									<button class="btn btn-success dir-buy-btn" -->
			<%-- 										data-pno="${pdt.pno }">바로 구매</button> --%>
			<!-- 								</div> -->
			<!-- 							</div> -->
			<!-- 							<div class="card-body"> -->
			<%-- 								<div class="h4 card-title">${pdt.title }</div> --%>
			<%-- 								<div class="h5 card-text float-right">${pdt.price }￦</div> --%>
			<!-- 							</div> -->
			<!-- 							<div class="card-footer"> -->
			<!-- 								<a href="#" class="btn btn-primary get-btn float-right" -->
			<%-- 									data-oper="get" data-pno="${pdt.pno }">자세히</a> --%>
			<!-- 							</div> -->
			<!-- 						</div> -->
			<!-- 					</div> -->
			<%-- 				</c:forEach> --%>
			<!-- 			</div> -->
			<!-- 		</div> -->

			<div class="row">
				<c:forEach items="${pdt }" var="pdt" varStatus="status">
					<div class="column col-xl-3 col-md-6">
						<div class="card">
							<div class="card-image">
								<img class="card-img-top"
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
								$(".card-img-top")
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
																		if (arr.length) {
																			console
																					.log(arr);
																			var imageThumbPath = encodeURIComponent(arr[i].uploadPath
																					+ "/s_"
																					+ arr[i].uuid
																					+ "_"
																					+ arr[i].fileName);
																			$(
																					".card-img-top[data-index='"
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