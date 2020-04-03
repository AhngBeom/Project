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
	</main>

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
				<div class="modal-body">
					장바구니에 보관되어있는 상품이 있습니다.<br> 현재 상품만 구매하시겠습니까?
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-warning" id="modalSecFunc">장바구니에
						추가 & 구매</button>
					<button type="button" class="btn btn-primary" id="modalAccept">예</button>
					<!-- 					<button type="button" class="btn btn-secondary" -->
					<!-- 						data-dismiss="modal">Close</button> -->
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript" src="/resources/js/productJS.js"></script>
	<script type="text/javascript">
		$(document).ready(function() {
			$("button[data-toggle='collapse']").on("click", function(e) {
				e.preventDefault();
				var index = $(this).data('index');
				console.log(index);
				$(".collapse[data-index='" + index + "']").collapse('toggle');
			});
		});
	</script>
	<%@ include file="../includes/footer.jsp"%>