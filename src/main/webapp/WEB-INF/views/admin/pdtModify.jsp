<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../includes/header.jsp"%>

<div id="layoutSidenav_content">
	<main>
		<div class="container-fluid">
			<h1 class="mt-4">Product Name</h1>
			<ol class="breadcrumb mb-4">
				<li class="breadcrumb-item active">Simple Explanation</li>
			</ol>

			<div class="row mb-4">
				<div class="col-xl-12 col-md-12">
					<div class="card">
						<div class="card-header d-flex">
							<div class="card-image col-xl-6 col-md-12">
								<img class="card-img-top" src="/resources/assets/img/cake.png"
									alt="Card image" style="width: 100%">
							</div>
							<div class="p-4 col-xl-6 col-md-12">
								<form>
									<div class="input-group mb-lg-5 input-group-lg">
										<div class="input-group-prepend">
											<span class="input-group-text">가격</span>
										</div>
										<input type="text" class="form-control">
										<div class="input-group-append">
											<span class="input-group-text">￦</span>
										</div>
									</div>
									<div class="input-group mb-lg-5 input-group-lg">
										<div class="input-group-prepend">
											<label class="input-group-text" for="inputGroupSelect">옵션
												선택</label>
										</div>
										<select class="custom-select" id="inputGroupSelect">
											<option selected>옵션 선택</option>
											<option value="opt01">옵션 01</option>
											<option value="opt02">옵션 02</option>
											<option value="opt03">옵션 03</option>
										</select>
									</div>
									<div class="input-group mb-lg-5 input-group-lg">
										<div class="input-group-prepend">
											<label class="input-group-text" for="inputGroupSelect01">수량</label>
										</div>
										<select class="custom-select" id="inputGroupSelect01">
											<option selected>수량 선택</option>
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
									</div>
								</form>
							</div>
						</div>
						<div class="card-body text-center">
							<input type="text" class="card-title form-control"
								placeholder="Product Title">

							<textarea class="card-text form-control"
								placeholder="Product Explanation"></textarea>
							<div class="card-image bg-light border p-5 m-3">
								<input type="file" class="m-xl-4 form-control-file">
							</div>
							<textarea class="card-text form-control"
								placeholder="Product Explanation"></textarea>
						</div>
					</div>
				</div>
			</div>

		</div>
	</main>
	<%@ include file="../includes/footer.jsp"%>