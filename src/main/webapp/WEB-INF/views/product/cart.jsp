<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ include file="../includes/header.jsp"%>


<form action="" method="get" id="operForm"></form>

<div id="layoutSidenav_content">
	<main>
		<div class="container-fluid">
			<h1 class="mt-4">Cart List</h1>
			<ol class="breadcrumb mb-4">
				<li class="breadcrumb-item active">Cart List</li>
			</ol>
			<div class="row mb-4">
				<c:forEach items="${item }" var="item" varStatus="status">
					<div class="col-xl-12">
						<div class="card" data-pno="${item.pno }"
							data-index="${status.index }">
							<div class="card-header">
								<input type="checkbox">
							</div>
							<div class="card-body d-flex">
								<div class="col-xl-8 d-flex justice-content-start">
									<div class="m-1">
										<img class="img-thumbnail"
											src="/resources/assets/img/readyToImg.jpg" alt="Card image">
									</div>
									<div class="row align-items-center p-3 m-3">
										<a href="#" class="h5" data-oper="get" data-pno="${item.pno }">
											<small class="text-muted">${item.title }</small><br>
											${item.name}
										</a>
									</div>
								</div>
								<div class="h5 d-flex flex-column col-xl-4">
									<div class="input-group mb-3 input-group-lg">
										<select class="custom-select" id="inputGroupSelect">
											<option selected>옵션 선택</option>
											<option value="opt01">옵션 01</option>
											<option value="opt02">옵션 02</option>
											<option value="opt03">옵션 03</option>
										</select>
									</div>
									<div class="input-group mb-3 input-group-lg">
										<select class="custom-select" id="inputGroupSelect">
											<option selected>수량</option>
											<option value="cnt01">1</option>
											<option value="cnt02">2</option>
											<option value="cnt03">3</option>
											<option value="cnt04">4</option>
											<option value="cnt05">5</option>
											<option value="cnt06">6</option>
											<option value="cnt07">7</option>
											<option value="cnt08">8</option>
											<option value="cnt09">9</option>
											<option value="cnt10">10</option>
										</select>
									</div>
									<div class="input-group mb-3 input-group-lg">
										<div class="input-group-prepend">
											<span class="input-group-text">가격</span>
										</div>
										<input type="text" class="form-control text-right"
											name="price" value="${item.price }" readonly="readonly">
										<div class="input-group-append">
											<span class="input-group-text">￦</span>
										</div>
									</div>
								</div>
							</div>
							<div class="card-footer">
								<a href=""
									class="btn btn-danger float-right mr-3 cartItemDelBtn"
									data-pno="${item.pno }">상품 삭제</a> <a href=""
									class="btn btn-success get-btn float-right mr-3"
									data-oper="get" data-pno="${item.pno }">상품 화면</a>
							</div>
						</div>
					</div>
				</c:forEach>
			</div>
		</div>
	</main>

	<script type="text/javascript">
		$(document)
				.ready(
						function() {
							(function() {
								console.log("${item}");
								$(".card")
										.each(
												function(i, data) {
													var pno = $(this).data(
															"pno");
													var index = $(this).data(
															"index");
													$
															.getJSON(
																	"/cartList",
																	{
																		userID : "unknown"
																	},
																	function(
																			arr) {
																		var cart = arr[i].cartVO;
																		console.log(cart.amount);
																	});
													$
															.getJSON(
																	"/admin/getAttachList",
																	{
																		pno : pno
																	},
																	function(
																			arr) {
																		var imageThumbPath = encodeURIComponent(arr[i].uploadPath
																				+ "/s_"
																				+ arr[i].uuid
																				+ "_"
																				+ arr[i].fileName);
																		$(
																				".card[data-index='"
																						+ i
																						+ "'] .card-body div img")
																				.attr(
																						"src",
																						"/display?fileName="
																								+ imageThumbPath);
																	});

												});
							})();
						})
	</script>
	<%@ include file="../includes/footer.jsp"%>