<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<%@ include file="../includes/header.jsp"%>

<form action="/member/orderList" method="post" id="operForm"></form>

<div id="layoutSidenav_content">
	<main>
		<div class="container-fluid">
			<h1 class="mt-4">Order List</h1>
			<ol class="breadcrumb mb-4">
				<li class="breadcrumb-item active">Order List</li>
			</ol>

			<c:if test="${empty order }">
				<div class="col-xl-12 mb-3">

					<div class="card">
						<div class="card-header"></div>
						<div class="card-body text-center h5">주문 내역이 존재하지 않습니다.</div>
						<div class="card-footer"></div>
					</div>
				</div>
			</c:if>

			<c:forEach items="${order }" var="order">
				<div class="card m-3" data-ordernum="${order.orderNumber }">
					<div class="card-header d-flex flex-row justify-content-between">
						<div class="">
							<fmt:formatDate value="${order.orderDate}"
								pattern="yyyy-MM-dd HH:mm:ss" />
						</div>
						<div class="">
							<span class="badge badge-secondary">주문상태</span>
						</div>
					</div>
					<div class="card-body d-flex flex-column">
						<div class="d-flex justify-content-between">
							<h5 class="card-title">
								주문번호 :
								<c:out value="${order.orderNumber }" />
							</h5>
							<div class="d-flex flex-column">

								<button class="btn btn-warning mb-3">상세정보</button>
								<button class="btn btn-danger mb-3 orderDelBtn"
									data-ordernum="${order.orderNumber }">주문취소</button>
							</div>
						</div>
						<button class="btn btn-light orderPdtListBtn"
							data-ordernum="${order.orderNumber }" data-toggle="collapse"
							data-target="#collapseExample">상품 목록</button>

					</div>
					<c:forEach items="${orderPdt }" var="pdt">
						<c:if test="${order.orderNumber eq pdt.orderNumber}">
							<div class="card-footer collapse" data-pno="${pdt.pno }">
								<div class="d-flex justify-content-between">
									<div>
										<a href="#" class="h5 pdtNameTag" data-oper="get"
											data-pno="${pdt.pno }"> ${pdt.pdtName } </a>
									</div>
									<div class="d-flex flex-row">
										<div class="input-group input-group-sm ml-1">
											<div class="input-group-prepend">
												<span class="input-group-text" id="inputGroup-sizing-sm">수량</span>
											</div>
											<select class="custom-select" name="amount"
												style="width: 10px;" data-index="${status.index }"
												data-amount="${pdt.amount }">
												<option value="1">1</option>
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
											<div class="input-group-append">
												<button class="btn btn-outline-primary amountBtn"
													type="button">변경</button>
											</div>
										</div>
										<div class="input-group input-group-sm ml-1">
											<div class="input-group-prepend">
												<span class="input-group-text" id="inputGroup-sizing-sm">가격</span>
											</div>
											<input type="text" class="form-control"
												value="${pdt.pdtPrice * pdt.amount}"
												aria-label="Sizing example input"
												aria-describedby="inputGroup-sizing-sm"
												style="width: 200px;">
											<div class="input-group-append">
												<span class="input-group-text">￦</span>
											</div>
										</div>
									</div>
								</div>
							</div>
						</c:if>
					</c:forEach>

				</div>
			</c:forEach>
		</div>
	</main>
	<script type="text/javascript">
		$(document).ready(
				function() {

					$(".orderDelBtn").on(
							"click",
							function(e) {
								console.log($(this).data("ordernum"));
								$("#operForm").append(
										"<input type='hidden' name='orderNumber' value='"
												+ $(this).data("ordernum")
												+ "'>");
								$("#operForm").attr("action", "/orderRemove");
								$("#operForm").submit();
							});

					$(".card").each(function(i, arr) {
						$(arr).on("click", ".orderPdtListBtn", function(e) {
							$(arr).find(".collapse").collapse("toggle");
						});
					});
					$(".card-footer select[name='amount']").each(
							function(i, select) {
								$(select).children(
										"option[value='"
												+ $(select).data("amount")
												+ "']").attr("selected",
										"selected");
							});
				});
	</script>
	<%@ include file="../includes/footer.jsp"%>