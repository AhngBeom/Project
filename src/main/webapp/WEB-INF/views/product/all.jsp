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
			<div class="row mb-4">
				<c:forEach items="${pdt }" var="pdt">
					<div class="col-xl-3 col-md-6">
						<div class="card">
							<div class="card-image">
								<img class="card-img-top"
									src="/resources/assets/img/readyToImg.jpg" alt="Card image"
									style="width: 100%">
								<div class="pdt-dir-btn d-flex justify-content-around w-100">
									<button class="btn btn-warning add-cart-btn">장바구니</button>
									<button class="btn btn-success dir-buy-btn">바로 구매</button>
								</div>
							</div>
							<div class="card-body">
								<div class="h4 card-title">${pdt.name }</div>
								<div class="h5 card-text float-right">${pdt.price }￦</div>
							</div>
							<div class="card-footer">
								<a href="#" class="btn btn-primary get-btn float-right" data-oper="get"
									data-pno="${pdt.pno }">자세히</a>
							</div>
						</div>
					</div>
				</c:forEach>
			</div>
		</div>
	</main>
	<%@ include file="../includes/footer.jsp"%>