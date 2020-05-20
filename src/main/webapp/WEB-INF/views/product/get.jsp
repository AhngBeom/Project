<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<%@ include file="../includes/header.jsp"%>

<div id="layoutSidenav_content">
	<main>
		<div class="container-fluid mt-3">
			<form action="/product/list" method="get" id="operForm">
				<input type="hidden" name="pageNum" value="${cri.pageNum }">
				<input type="hidden" name="amount" value="${cri.amount }">
			</form>
			<ol class="breadcrumb mb-4">
				<li class="breadcrumb-item active"><a href="#" id="listOper">List</a></li>
				<li class="breadcrumb-item active">${pdt.category }</li>
				<li class="breadcrumb-item">${pdt.name }</li>
			</ol>

			<div class="row mb-4">
				<div class="col-xl-12 col-md-12">
					<div class="card">
						<div class="card-header d-flex">
							<div class="col-xl-4 col-md-12">
								<img class="card-img-top"
									src="/resources/assets/img/readyToImg.jpg" alt="Card image">
							</div>
							<div class="p-4 col-xl-8 col-md-12">
								<form action="/" method="post">
									<div class="input-group mb-lg-5 input-group-lg">
										<div class="input-group-prepend">
											<span class="input-group-text">이름</span>
										</div>
										<input type="text" class="form-control" readonly="readonly"
											value="${pdt.name }">
									</div>
									<div class="input-group mb-lg-5 input-group-lg">
										<input type="text" class="form-control" readonly="readonly"
											value="${pdt.title }">
									</div>
									<!-- 									<div class="input-group mb-lg-5 input-group-lg"> -->
									<!-- 										<div class="input-group-prepend"> -->
									<!-- 											<label class="input-group-text" for="inputGroupSelect">옵션 -->
									<!-- 												선택</label> -->
									<!-- 										</div> -->
									<!-- 										<select class="custom-select" id="inputGroupSelect"> -->
									<!-- 											<option selected>옵션 선택</option> -->
									<!-- 											<option value="opt01">옵션 01</option> -->
									<!-- 											<option value="opt02">옵션 02</option> -->
									<!-- 											<option value="opt03">옵션 03</option> -->
									<!-- 										</select> -->
									<!-- 									</div> -->
									<div class="input-group mb-lg-5 col-xl-6 float-right">
										<div class="input-group-prepend">
											<label class="input-group-text" for="inputGroupSelect01">수량</label>
										</div>
										<select class="custom-select" id="inputGroupSelect01"
											name="amount">
											<option value="1" selected>1</option>
											<option value="2">2</option>
											<option value="3">3</option>
											<option value="4">4</option>
											<option value="5">5</option>
											<option value="6">6</option>
											<option value="7">7</option>
											<option value="8">8</option>
											<option value="9">9</option>
											<option value="10">10</option>
										</select>
									</div>
									<div class="input-group mb-lg-5 col-xl-8 float-right">
										<div class="input-group-prepend">
											<span class="input-group-text">가격</span>
										</div>
										<input type="text" class="form-control text-right h3"
											readonly="readonly" value="${pdt.price }">
										<div class="input-group-append">
											<span class="input-group-text">￦</span>
										</div>
									</div>
								</form>
								<div class="d-flex justify-content-around col-xl-12">
									<sec:authorize access="isAuthenticated()">
										<button class="btn btn-warning add-cart-btn"
											data-pno="${pdt.pno }"
											data-userid='<sec:authentication property="principal.username"/>'>장바구니</button>
									</sec:authorize>
									<sec:authorize access="isAnonymous()">
										<button class="btn btn-warning add-cart-btn"
											data-pno="${pdt.pno }" data-userid=''>장바구니</button>
									</sec:authorize>
									<button class="btn btn-success dir-buy-btn"
										data-pno="${pdt.pno }">바로주문</button>
								</div>
							</div>
						</div>
						<div class="card-body text-center">
							<h1 class="card-title">${pdt.name }</h1>
							<p class="card-text">${pdt.title }</p>
							<div
								class="image-list d-flex flex-column justify-content-center m-3"></div>
							<textarea rows="10" class="form-control col-xl-12 bg-transparent"
								readonly="readonly">${pdt.descript }</textarea>
						</div>
					</div>
				</div>
			</div>
			<div class="modal fade" id="alertModal" tabindex="-1" role="dialog"
				aria-labelledby="alertModalLabel" aria-hidden="true">
				<div class="modal-dialog modal-dialog-centered" role="document">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title" id="alertModalLabel">Alert</h5>
							<button type="button" class="close" data-dismiss="modal"
								aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
						</div>
						<div class="modal-body">Modal Body</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-warning" id="modalSecFunc">SecFunc</button>
							<button type="button" class="btn btn-primary" id="modalAccept">Accept</button>
							<!-- 					<button type="button" class="btn btn-secondary" -->
							<!-- 						data-dismiss="modal">Close</button> -->
						</div>
					</div>
				</div>
			</div>
		</div>
	</main>

	<script type="text/javascript">
		$(document)
				.ready(
						function() {
							(function() {
								var pno = '<c:out value="${pdt.pno}"/>';
								var overlay = "<div class='opacity-div d-flex flex-column justify-content-center w-100'>"
										+ "<button class='btn btn-warning m-auto img-expand-btn'><i class=''></i>크게 보기</button>"
										+ "</div>";

								$
										.getJSON(
												"/product/getAttachList",
												{
													pno : pno
												},
												function(arr) {
													console.log(arr);
													var titleImg = "";
													var bodyImg = "";
													$(arr)
															.each(
																	function(i,
																			attach) {
																		if (attach.fileType) {
																			var imageThumbPath = encodeURIComponent(attach.uploadPath
																					+ "/s_"
																					+ attach.uuid
																					+ "_"
																					+ attach.fileName);
																			var imageOriginPath = encodeURIComponent(attach.uploadPath
																					+ "/"
																					+ attach.uuid
																					+ "_"
																					+ attach.fileName);
																			bodyImg += "<div class='image-item mb-3' data-path='" + attach.uploadPath
										+ "' data-uuid='" + attach.uuid + "' data-filename='" + attach.fileName
										+ "' data-type='" + attach.fileType + "'><img class='img-item col-xl-6' src='/display?fileName="
																					+ imageOriginPath
																					+ "'>"
																					// + overlay
																					+ "</div>";
																			if (i === 0) {
																				$(
																						".card-img-top")
																						.attr(
																								"src",
																								"/display?fileName="
																										+ imageOriginPath);
																			}
																		}

																	});
													$(".image-list").html(
															bodyImg);
												});
							})();
						});
	</script>
	<%@ include file="../includes/footer.jsp"%>