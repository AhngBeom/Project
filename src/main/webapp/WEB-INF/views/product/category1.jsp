<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../includes/header.jsp"%>

<div id="layoutSidenav_content">
	<main>
		<div class="container-fluid">
			<h1 class="mt-4">Product - Category 1 </h1>
			<ol class="breadcrumb mb-4">
				<li class="breadcrumb-item active">Product  - Category 1 </li>
			</ol>
			<div class="row mb-4">
				<div class="col-xl-3 col-md-6">
					<div class="card">
						<div class="card-image">
							<img class="card-img-top"
								src="/resources/assets/img/cabin.png"
								alt="Card image" style="width: 100%">
							<div class="pdt-dir-btn d-flex justify-content-around w-100">
								<button class="btn btn-warning add-cart-btn">장바구니</button>
								<button class="btn btn-success dir-buy-btn">바로 구매</button>
							</div>
						</div>
						<div class="card-body">
							<h4 class="card-title">Product 1</h4>
							<p class="card-text">Product Explanation</p>
							<a href="#" class="btn btn-primary">자세히</a>
						</div>
					</div>
				</div>
				<div class="col-xl-3 col-md-6">
					<div class="card">
						<div class="card-image">
							<img class="card-img-top"
								src="/resources/assets/img/cake.png"
								alt="Card image" style="width: 100%">
							<div class="pdt-dir-btn d-flex justify-content-around w-100">
								<button class="btn btn-warning add-cart-btn">장바구니</button>
								<button class="btn btn-success dir-buy-btn">바로 구매</button>
							</div>
						</div>
						<div class="card-body">
							<h4 class="card-title">Product 2</h4>
							<p class="card-text">Product Explanation</p>
							<a href="#" class="btn btn-primary">자세히</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</main>
	<%@ include file="../includes/footer.jsp"%>