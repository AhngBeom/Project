<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ include file="../includes/header.jsp"%>

<div id="layoutSidenav_content">
	<main>
		<div class="container-fluid mt-3">
			<form action="/product/all" method="get">
				<input type="hidden" name="pageNum" value="${cri.pageNum }">
				<input type="hidden" name="amount" value="${cri.amount }">
			</form>
			<ol class="breadcrumb mb-4">
				<li class="breadcrumb-item active"><a href="#" id="listOper">List</a></li>
				<li class="breadcrumb-item active">${pdt.category }</li>
				<li class="breadcrumb-item">${pdt.title }</li>
			</ol>

			<div class="row mb-4">
				<div class="col-xl-12 col-md-12">
					<div class="card">
						<div class="card-header d-flex">
							<div class="col-xl-6 col-md-12">
								<img class="card-img-top"
									src="/resources/assets/img/readyToImg.jpg" alt="Card image">
							</div>
							<div class="p-4 col-xl-6 col-md-12">
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
									<button class="btn btn-warning add-cart-btn"
										data-pno="${pdt.pno }">장바구니</button>
									<button class="btn btn-success dir-buy-btn"
										data-pno="${pdt.pno }">바로주문</button>
								</div>
							</div>
						</div>
						<div class="card-body text-center">
							<h1 class="card-title">${pdt.name }</h1>
							<p class="card-text">${pdt.title }</p>
							<div
								class="attach-list d-flex flex-column justify-content-center m-3"></div>
							<textarea rows="10" class="col-xl-12" readonly="readonly">${pdt.descript }</textarea>
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
												"/admin/getAttachList",
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
																			bodyImg += "<div class='attach-image mb-3' data-path='"
																	+ attach.uploadPath
																	+ "' data-uuid='"
																	+ attach.uuid
																	+ "' data-filename='"
																	+ attach.fileName
																	+ "' data-type='"
																	+ attach.fileType
																	+ "'><img class='img-item col-xl-12' src='/display?fileName="
																					+ imageOriginPath
																					+ "'>"
																					// 																					+ overlay
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
													$(".attach-list").html(
															bodyImg);
												});
							})();
						});
	</script>
	<%@ include file="../includes/footer.jsp"%>