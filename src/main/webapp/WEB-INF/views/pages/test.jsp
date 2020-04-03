<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<title>Bootstrap Example</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="/resources/css/myCss.css?ver=1" rel="stylesheet" />
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
</head>
<body>
	<div class="row border">
		<div class="col-xl-3 col-md-6">
			<c:forEach items="${pdt }" var="pdt" varStatus="status">
				<c:if test="${status.index % 4 eq 0}">
					<div class="card mb-3">
						<div class="card-header">
							<img class="card-image"
								src="/resources/assets/img/readyToImg.jpg" alt="Card image"
								data-pno="${pdt.pno }" data-index="${status.index }"
								style="width: 100%; height: auto;">
							<div
								class="opacity-div d-flex flex-column bd-highlight p-3 w-100">
								<div class="d-flex justify-content-around w-100 mb-3">
									<button class="btn btn-warning add-cart-btn"
										data-pno="${pdt.pno }">
										<i class="fas fa-cart-plus"></i> 장바구니
									</button>
									<button class="btn btn-success dir-buy-btn"
										data-pno="${pdt.pno }">바로 구매</button>
								</div>
								<div class="mb-3">
									<a class="btn btn-primary get-btn text-white" data-oper="get"
										data-pno="${pdt.pno }">자세히</a>
								</div>
								<div class="mb-3">
									<button class="btn btn-secondary" data-toggle="collapse"
										data-index="${status.index }">가격 보기</button>
								</div>
							</div>
						</div>
						<div class="collapse p-3" id="collapseExample"
							data-index="${status.index }">
							<div class="card-body">
								<span>${pdt.category }</span>
								<div class="h4 card-title">${pdt.title }</div>
								<div class="h5 card-text float-right">￦${pdt.price }</div>
							</div>
						</div>
					</div>
				</c:if>
			</c:forEach>
		</div>
		<div class="col-xl-3 col-md-6">
			<c:forEach items="${pdt }" var="pdt" varStatus="status">
				<c:if test="${status.index % 4 eq 1}">
					<div class="card mb-3">
						<div class="card-header">
							<img class="card-image"
								src="/resources/assets/img/readyToImg.jpg" alt="Card image"
								data-pno="${pdt.pno }" data-index="${status.index }"
								style="width: 100%; height: auto;">
							<div
								class="opacity-div d-flex flex-column bd-highlight p-3 w-100">
								<div class="d-flex justify-content-around w-100 mb-3">
									<button class="btn btn-warning add-cart-btn"
										data-pno="${pdt.pno }">
										<i class="fas fa-cart-plus"></i> 장바구니
									</button>
									<button class="btn btn-success dir-buy-btn"
										data-pno="${pdt.pno }">바로 구매</button>
								</div>
								<div class="mb-3">
									<a class="btn btn-primary get-btn text-white" data-oper="get"
										data-pno="${pdt.pno }">자세히</a>
								</div>
								<div class="mb-3">
									<button class="btn btn-secondary" data-toggle="collapse"
										data-index="${status.index }">가격 보기</button>
								</div>
							</div>
						</div>
						<div class="collapse p-3" id="collapseExample"
							data-index="${status.index }">
							<div class="card-body">
								<span>${pdt.category }</span>
								<div class="h4 card-title">${pdt.title }</div>
								<div class="h5 card-text float-right">￦${pdt.price }</div>
							</div>
						</div>
					</div>
				</c:if>
			</c:forEach>
		</div>
		<div class="col-xl-3 col-md-6">
			<c:forEach items="${pdt }" var="pdt" varStatus="status">
				<c:if test="${status.index % 4 eq 2}">
					<div class="card mb-3">
						<div class="card-header">
							<img class="card-image"
								src="/resources/assets/img/readyToImg.jpg" alt="Card image"
								data-pno="${pdt.pno }" data-index="${status.index }"
								style="width: 100%; height: auto;">
							<div
								class="opacity-div d-flex flex-column bd-highlight p-3 w-100">
								<div class="d-flex justify-content-around w-100 mb-3">
									<button class="btn btn-warning add-cart-btn"
										data-pno="${pdt.pno }">
										<i class="fas fa-cart-plus"></i> 장바구니
									</button>
									<button class="btn btn-success dir-buy-btn"
										data-pno="${pdt.pno }">바로 구매</button>
								</div>
								<div class="mb-3">
									<a class="btn btn-primary get-btn text-white" data-oper="get"
										data-pno="${pdt.pno }">자세히</a>
								</div>
								<div class="mb-3">
									<button class="btn btn-secondary" data-toggle="collapse"
										data-index="${status.index }">가격 보기</button>
								</div>
							</div>
						</div>
						<div class="collapse p-3" id="collapseExample"
							data-index="${status.index }">
							<div class="card-body">
								<span>${pdt.category }</span>
								<div class="h4 card-title">${pdt.title }</div>
								<div class="h5 card-text float-right">￦${pdt.price }</div>
							</div>
						</div>
					</div>
				</c:if>
			</c:forEach>
		</div>
		<div class="col-xl-3 col-md-6">
			<c:forEach items="${pdt }" var="pdt" varStatus="status">
				<c:if test="${status.index % 4 eq 3}">
					<div class="card mb-3">
						<div class="card-header">
							<img class="card-image"
								src="/resources/assets/img/readyToImg.jpg" alt="Card image"
								data-pno="${pdt.pno }" data-index="${status.index }"
								style="width: 100%; height: auto;">
							<div
								class="opacity-div d-flex flex-column bd-highlight p-3 w-100">
								<div class="d-flex justify-content-around w-100 mb-3">
									<button class="btn btn-warning add-cart-btn"
										data-pno="${pdt.pno }">
										<i class="fas fa-cart-plus"></i> 장바구니
									</button>
									<button class="btn btn-success dir-buy-btn"
										data-pno="${pdt.pno }">바로 구매</button>
								</div>
								<div class="mb-3">
									<a class="btn btn-primary get-btn text-white" data-oper="get"
										data-pno="${pdt.pno }">자세히</a>
								</div>
								<div class="mb-3">
									<button class="btn btn-secondary" data-toggle="collapse"
										data-index="${status.index }">가격 보기</button>
								</div>
							</div>
						</div>
						<div class="collapse p-3" id="collapseExample"
							data-index="${status.index }">
							<div class="card-body">
								<span>${pdt.category }</span>
								<div class="h4 card-title">${pdt.title }</div>
								<div class="h5 card-text float-right">￦${pdt.price }</div>
							</div>
						</div>
					</div>
				</c:if>
			</c:forEach>
		</div>
	</div>
	<!-- 	<div class="row border"> -->
	<!-- 		<div class="col-xl-3 col-md-6"> -->
	<!-- 			<img src="/resources/assets/img/42-black-1_GEO_KR.jpg" -->
	<!-- 				style="width: 100%"> <img -->
	<!-- 				src="/resources/assets/img/iPhone_11bk.jpg" style="width: 100%"> -->
	<!-- 			<img src="/resources/assets/img/cake.png" style="width: 100%"> -->
	<!-- 			<img src="/resources/assets/img/circus.png" style="width: 100%"> -->
	<!-- 			<img src="/resources/assets/img/cabin.png" style="width: 100%"> -->
	<!-- 			<img src="/resources/assets/img/game.png" style="width: 100%"> -->
	<!-- 			<img src="/resources/assets/img/safe.png" style="width: 100%"> -->
	<!-- 		</div> -->
	<!-- 		<div class="col-xl-3 col-md-6"> -->
	<!-- 			<img src="/resources/assets/img/submarine.png" style="width: 100%"> -->
	<!-- 			<img src="/resources/assets/img/42-black-2_GEO_KR.jpg" -->
	<!-- 				style="width: 100%"> <img -->
	<!-- 				src="/resources/assets/img/42-black-1_GEO_KR.jpg" -->
	<!-- 				style="width: 100%"> <img -->
	<!-- 				src="/resources/assets/img/circus.png" style="width: 100%"> <img -->
	<!-- 				src="/resources/assets/img/iPhone_11wh.jpg" style="width: 100%"> -->
	<!-- 			<img src="/resources/assets/img/circus.png" style="width: 100%"> -->
	<!-- 		</div> -->
	<!-- 		<div class="col-xl-3 col-md-6"> -->
	<!-- 			<img src="/resources/assets/img/iPhone_11bk.jpg" style="width: 100%"> -->
	<!-- 			<img src="/resources/assets/img/iPhone_11yw.jpg" style="width: 100%"> -->
	<!-- 			<img src="/resources/assets/img/safe.png" style="width: 100%"> -->
	<!-- 			<img src="/resources/assets/img/game.png" style="width: 100%"> -->
	<!-- 			<img src="/resources/assets/img/game.png" style="width: 100%"> -->
	<!-- 			<img src="/resources/assets/img/42-black-2_GEO_KR.jpg" -->
	<!-- 				style="width: 100%"> <img -->
	<!-- 				src="/resources/assets/img/iPhone_11wh.jpg" style="width: 100%"> -->
	<!-- 		</div> -->
	<!-- 		<div class="col-xl-3 col-md-6"> -->
	<!-- 			<img src="/resources/assets/img/42-black-1_GEO_KR.jpg" -->
	<!-- 				style="width: 100%"> <img -->
	<!-- 				src="/resources/assets/img/iPhone_11bk.jpg" style="width: 100%"> -->
	<!-- 			<img src="/resources/assets/img/cake.png" style="width: 100%"> -->
	<!-- 			<img src="/resources/assets/img/circus.png" style="width: 100%"> -->
	<!-- 			<img src="/resources/assets/img/cabin.png" style="width: 100%"> -->
	<!-- 			<img src="/resources/assets/img/game.png" style="width: 100%"> -->
	<!-- 			<img src="/resources/assets/img/safe.png" style="width: 100%"> -->
	<!-- 		</div> -->
	<!-- 	</div> -->
	<script type="text/javascript">
		$(document)
				.ready(
						function() {
							(function() {
								$(".card-image")
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
																			var imagePath = encodeURIComponent(arr[0].uploadPath
																					+ "/"
																					+ arr[0].uuid
																					+ "_"
																					+ arr[0].fileName);
																			$(
																					".card-image[data-index='"
																							+ i
																							+ "']")
																					.attr(
																							"src",
																							"/display?fileName="
																									+ imagePath);
																		}
																	});
												});
							})();
						});
	</script>
</body>
</html>

